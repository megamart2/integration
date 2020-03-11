/*
 * C-TO-C COMPILER
 *
 * Based on an ANSI-C compiler
 * originally written by Birgit Schwarz
 * in 1989 at GMD Karlsruhe
 * using Gentle/0
 *
 * Copyright (C) 1989, 1993 GMD
 */
/*
 * On July 2006, modified by Weigang (Michael) Gong for AspeCt-oriented C.
 */
/*
   main.c
*/

/*----------------------------------------------------------------------------*/

#include "pointcut.h"
#include "symboltable.h"
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>


#ifndef NULL
#define NULL 0
#endif


char * ac_suffix = ".acc";			// valid suffix for aspect C file
#define ACSUFFIXLEN (strlen(ac_suffix))

char * mc_suffix = ".mc" ;				// valid suffix for normal C file
#define MCSUFFIXLEN (strlen(mc_suffix))

#define FREE_FILES( num, names ) \
	{\
		int k; \
		if(num > 0) { \
			for(k = 0; k < (num); k++) { \
				if((names) && (names)[k]) free((names)[k]); \
   			} \
   			if( (names)) free((names)); \
		}\
	}

void free_file_name() ;
void init(FILE *);
char isThreadSafe();
void setThreadSafe();
char needLine() ;
void setNoLine() ;
void insertTypeMember(char *,struct Record *);
char * get_file_suffix(char * option);
void printHelpMenu();

extern void addMapFileName(char *);

int process_onearg(char **, int, int);



//return 1 if compiling aspect
//return 0 if not compiling aspect
long compileFlag = 1; //defaut value
char *target_file_name, *target_file_base_name, *src_file_name;
char threadSafe = 0;
char srcLineNeeded = 1; //need to output "# " directive
char user_ac_suffix=0;
char user_mc_suffix=0;


main (argc, argv)
   int argc; char **argv;
{
   FILE * f1;
   FILE * f2;
   char ** aFileNames;  // a list of aspect file names
   char ** nFileNames;  // a list of normal C file names
   int aFileNum = 0;
   int nFileNum = 0;
   int i;

   process_args(argc, argv, &aFileNames, &nFileNames, &aFileNum, &nFileNum);

   //compile aspect
   for(i = 0; i < aFileNum; i++) {
   	define_target_file_name(aFileNames[i]);
	/* need to reconsider
        if(fopen(target_file_name, "r")) {
            printf("acc cannot overwrite an existing target file %s .\n", target_file_name);
            exit(1);
         } */

	f1 = fopen(aFileNames[i], "r");
   	if(f1==NULL) {
		WARNING("file %s does not exist. It is skipped.\n", aFileNames[i]);
	}else {
		init(f1);

		ROOT();
//		printf("here is where changed\n");
		insertGenDecls(target_file_name, 0);
	}
	free_file_name();
   }

   if(getSemanticError()) {
	goto free_memory;
   }

   #ifdef UT_AC_DEBUG
   printf("print pointcut table:\n");
   printRecordList(PointCutTable);
   printf("\nprint cflow insertion point:\n");
   printCFlowRecordList(cflowTable);
   #endif

   //compile c file
   compileFlag = 0;
   for(i = 0; i < nFileNum; i++) {
        define_target_file_name(nFileNames[i]);
	 /* need to reconsider
        if(fopen(target_file_name, "r")) {
            printf("acc cannot overwrite an existing target file %s .\n", target_file_name);
            exit(1);
         }
        end */

	f2 = fopen(nFileNames[i], "r");
        if(f2==NULL) {
                WARNING("file %s does not exist. It is skipped.\n", nFileNames[i]);
        }else {
		init(f2);


		ROOT();

		// insert generated function declarations in the corresponding spot of the output file
		insertGenDecls(target_file_name, 1);

		#ifdef UT_AC_DEBUG
   		printf("\nprint function table:\n");
	   	printFuncs(funcTable);
   		printf("\nprint typedef table:\n");
		printTypedefTable(typedefTable);
   		printf("\nprint function pointer table:\n");
		printFuncs(fpTable);
		#endif

	}
        free_file_name();
   }

   //insert new member to the struct/union inside the aspect file
   for(i = 0; i < aFileNum; i++) {
        define_target_file_name(aFileNames[i]);
        insertTypeMember(target_file_name, PointCutTable);
        free_file_name();
   }

free_memory:
   // free memory
   free_pointcut(PointCutTable);
   free_cflowTable(cflowTable);
   free_tryTable(tryTable);
   free_typedefTable(typedefTable);
   free_func(funcTable);
   free_func(fpTable);
   free_func(varTable);
   free_file_chain();
   FREE_FILES(aFileNum, aFileNames)
   FREE_FILES(nFileNum, nFileNames)
   if(user_ac_suffix) free(ac_suffix);
   if(user_mc_suffix) free(mc_suffix);


   exit(0);
}

/*----------------------------------------------------------------------------*/

process_args(argc, argv, aFiles, nFiles, aNum, nNum)
   int argc; char **argv; char *** aFiles; char *** nFiles; int * aNum ; int * nNum;
{
   int i;
   int aFileCount = 0;
   int nFileCount = 0;
   int argLen = 0;	// length of each argument
   if(argc <= 1) {
	printf("no file name is specified.\n");
        exit(1);
   }

   /***************************************************/
   /* handle options                                  */
   for (i = 1; i < argc;) {
      i = process_onearg(argv, argc, i);
   }

   /***************************************************/
   /* handle input files                              */
   for (i = 1; i < argc; i++) {
      argLen = strlen(argv[i]);
      if(strstr(argv[i], "-") == argv[i]) {
		continue;	/* skip options */
      }else if(argLen > ACSUFFIXLEN && (strcmp(argv[i] + argLen - ACSUFFIXLEN, ac_suffix) == 0)) {
		aFileCount ++;
      }else if( argLen > MCSUFFIXLEN && (strcmp(argv[i] + argLen - MCSUFFIXLEN, mc_suffix) == 0)) {
                nFileCount ++;
      }else {
	       printf("invalid file name: \"%s\". Acceptable file name suffix are \"%s\" and \"%s\" \n", argv[i], ac_suffix, mc_suffix);
	       exit(1);
	}
   }

   *aNum = aFileCount;
   *nNum = nFileCount;
   if(aFileCount > 0) (*aFiles) = (char **)malloc( aFileCount * sizeof(char *));
   if(nFileCount > 0) (*nFiles) = (char **)malloc( nFileCount * sizeof(char *));

   aFileCount = 0;
   nFileCount = 0;
   for (i = 1; i < argc; i++) {
      argLen = strlen(argv[i]);
      if(strstr(argv[i], "-") == argv[i]) {
                continue;       /* skip options */
      }else if(argLen > ACSUFFIXLEN && (strcmp(argv[i] + argLen - ACSUFFIXLEN, ac_suffix) == 0)) {
                (*aFiles)[aFileCount] = (char *)malloc(argLen * sizeof(char) + 1);
		strcpy((*aFiles)[aFileCount], argv[i]);
		(*aFiles)[aFileCount][argLen] = '\0';
		aFileCount ++;
       }else if( argLen > MCSUFFIXLEN && (strcmp(argv[i] + argLen - MCSUFFIXLEN, mc_suffix) == 0)) {
                (*nFiles)[nFileCount] = (char *)malloc(argLen * sizeof(char) + 1);
                strcpy((*nFiles)[nFileCount], argv[i]);
                (*nFiles)[nFileCount][argLen] = '\0';
                nFileCount ++;
        }else if(strstr(argv[i], "-") != argv[i]) {
               assert(0);
        }
   }

}

/*----------------------------------------------------------------------------*/
/* handle the i-th argument, return the index of the next argument */
int process_onearg(char ** argv, int argc, int i) {
      char * suffix_temp;
      if(strcmp(argv[i], "-v") == 0 || strcmp(argv[i], "--version") == 0) {
                printf("AspeCt-oriented C (ACC) version dev \n");
                exit(0);
      }else if(strcmp(argv[i], "-h") == 0 || strcmp(argv[i], "--help") == 0) {
                printHelpMenu();
                exit(0);
      }else if(strcmp(argv[i], "-t") == 0 || strcmp(argv[i], "--thread-safe") == 0) {
                setThreadSafe();
      }else if(strstr(argv[i], "-af=") == argv[i] ||
                strstr(argv[i], "--aspect-suffix=") == argv[i]) {
                suffix_temp = get_file_suffix(argv[i]);
                if(suffix_temp) {
                        ac_suffix = suffix_temp;
                        user_ac_suffix=1;
                }
      }else if(strstr(argv[i], "-mf=") == argv[i] ||
                strstr(argv[i], "--mainfile-suffix=") == argv[i]) {
                suffix_temp = get_file_suffix(argv[i]);
                if(suffix_temp) {
                        mc_suffix = suffix_temp;
                        user_mc_suffix = 1;
                }
      }else if(strcmp(argv[i], "-n") == 0 || strcmp(argv[i], "--no-line") == 0) {
		setNoLine();
      }else if(strstr(argv[i], "-map=") == argv[i]) {
                /* a hidden option for mapping file name */
                /* -map="abc.c|def.c" */
                /* reason:
                        when using gcc -E to preprocess files, we have to copy the original files into a .c file, like:
                >cp t1mc.mc t1mc_mc.c
                >cp t1ac.acc t1ac_acc.c
                >gcc -E t1mc_mc.c > t1mc_mm.mc
                >gcc -E t1ac_acc.c > t1ac_acc.acc

                then we use "acc" to compile the .mc and .acc file.
                >acc t1mc_mm.mc t1ac_acc.acc

                if there is error inside the original files "t1mc.mc" or "t1ac.acc", the error message generated from "acc" or "gcc" will points to the copied files, ie. "t1mc_mc.c" or "t1ac_acc.c".

                This might cause confusion. In order for the error message pointing to the original files, user can use -map option, like:
                >acc t1mc_mm.mc t1ac_acc.acc -map="t1mc_mc.c|t1mc.mc" -map="t1ac_acc.c|t1ac.acc"

                acc will replace "t1mc_mc.c" or "t1ac_acc.c" appearing in the "# " directive of the outptu file with "t1mc.mc" or "t1ac.acc".

                As a side effect, when debugging, user can debug on the original files */

		addMapFileName(argv[i]);
      }else if(strstr(argv[i], "-") == argv[i]) {
                printf("invalid option : %s . It is skipped \n", argv[i]);
      }
      return i+1;
}


/*----------------------------------------------------------------------------*/

define_target_file_name (str)
   char *str;
{
   int i, base_name_len;
   char * start = NULL;

   setCurFileName(str);

   src_file_name = (char *)malloc(strlen(str) + 1);
   sprintf(src_file_name, "%s", str);


   i = strlen(str)-1;
   for(;;) {
      if (i < 0) {
	 printf("missing file name extension\n");
	 exit(1);
      }
      if (str[i] == '.') {
	 if (str[i+1] == 'c' && str[i+2] == '\0') {
	    printf("source file name cannot have extension '.c'\n");
	    exit(1);
	 }
	 target_file_name = (char *) malloc(i+3);

         if (target_file_name == 0 ) {
	    printf("running out of memory\n");
	    exit(1);
	 }
	 str[i] = '\0';
	 sprintf(target_file_name, "%s.c", str);
	 str[i] = '.';
	 break;
      }
      i--;
   }
   //skip the last occurance of '/' in the name
   start = strrchr(target_file_name, '/');
   if(start == NULL) {
	start = target_file_name;
   }else {
	start = start + 1;
   }
   base_name_len = strlen(target_file_name) - 2 - (start - target_file_name) + 1;
   target_file_base_name = (char *)malloc(base_name_len);
   i = 0;
   while(i < base_name_len - 1) {
	switch(*start) {
		case '-': case '+' : case '.':
			target_file_base_name[i] = '_';
			break;
		default:
			target_file_base_name[i] = *start;
	}
	i++;
	start = start + 1;
   }
   assert(i == base_name_len - 1);
   target_file_base_name[i] = '\0';

}

void free_file_name() {
	if(src_file_name) {
		free(src_file_name);
		src_file_name = NULL;
	}
        if(target_file_name) {
		free(target_file_name);
		target_file_name = NULL;
	}
	if(target_file_base_name) {
		free(target_file_base_name);
		target_file_base_name = NULL;
	}
}


/*----------------------------------------------------------------------------*/

get_target_file_name (p)
   char **p;
{
   *p = target_file_name;
}

get_target_file_base_name (p)
   char **p;
{
   *p = target_file_base_name;
}

//return 1 if compiling aspect
//return 0 if not compiling aspect
void isAspectCompile(long *flag){
	*flag = compileFlag;
}

//initialize
void init(f) FILE * f; {
	resetCurrDefnLineNum();
	resetAdviceCounter();
	resetGenBufSize();
	initFuncCalls();
        initStream(f);
        InitScanner();
}

//todo: when there are more options in the future, consider using a struct to group all option flags
char isThreadSafe() {
	return threadSafe;
}

void setThreadSafe() {
	threadSafe = 1;
}

char needLine() {
	return srcLineNeeded;
}

void setNoLine() {
	srcLineNeeded = 0;
}


char * get_file_suffix(char * option) {
	char * equalSign = strstr(option, "=");
	char * uSuffix;
	if(equalSign - option == strlen(option)-1) {
		printf("No file suffix is specified after option %s . The option is skipped and default file suffix will be used.\n", option);
		return NULL;
	}else if(*(equalSign + 1) != '.') {
		printf("The file suffix specified in %s does not start with '.'. The option is skipped and default file suffix will be used.\n", option);
		return NULL;
	}else if(strlen(equalSign+1) ==1) {
		printf("No file suffix is specified after '.'. The option %s is skipped and default file suffix will be used.\n", option);
		return NULL;
	}else {
		uSuffix = (char *)malloc(strlen(equalSign+1) + 1);
		sprintf(uSuffix, "%s", equalSign+1);
	}

	return uSuffix;
}

void printOptions();

void printHelpMenu() {
	printf("%s", "Usage: acc [options] file... \nOptions:\n");
	printOptions();
	printf("\n%s", "For bug reporting instructions, please see: http://www.aspectc.net .\n");
}

void printOptions() {
	char options[] = "-h , --help \n"
                "\tDisplay this help information\n\n"
		"-n , --no-line\n"
                "\tNo # directives will be generated\n\n"
		"-t , --thread-safe\n"
                "\tInstruct to generate thread safe code\n\n"
		"-v , --version \n"
		"\tDisplay acc version\n\n"
      		"-af=<file suffix> , --aspect-suffix=<file suffix>\n"
		"\tSpecify file suffix for aspect file\n\n"
                "-mf=<file suffix> , --mainfile-suffix=<file suffix>\n"
		"\tSpecify file suffix for non-aspect file\n\n";
	printf("%s", options);
}
