/*
    output.c

    Output to target file
    used by unparser

*/

/*----------------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <ctype.h>
#include <assert.h>
#include <string.h>
#include "pointcut.h"
#include "utac_tag.h"


#define FLUSHBUF(F, Buf, BufPtr)	\
	{ write(F, Buf, BufPtr - &Buf[0]);  \
          BufPtr = &Buf[0];                          \
        }

#define TESTBUF(F, Buf, BufPtr)                                        \
   if (BufPtr > &Buf[FlushPos]) {                \
      FLUSHBUF(F, Buf, BufPtr) \
   }

#define chopLine(x) \
	if(x[strlen(x)-1] == '\n') x[strlen(x)-1] = '\0'


char OutBuf[OutBufSize];
char *OutBufPtr;

char GenDeclFileName[NAMELEN];	//name for the file storing the generated declarations
char GenDeclBuf[OutBufSize];
char *GenDeclBufPtr = NULL;

long OutFile, GenDeclFile;
long OutFileIsOpen = 0, GenDeclFileIsOpen = 0;

int outputEnabled = 1;      // whether the text should be outputted to the file
int curr_line_no = 0;	    // the current line number in the opened file


void insertNewMember(char * acFile, char * function);

long maxGenDeclSize = 0;	   // the size of the biggest declaration needed to be inserted;

void resetGenBufSize() {
	maxGenDeclSize = 0;
}

long openFile(Name) char *Name;
{
   long f = open(Name, O_WRONLY | O_CREAT | O_TRUNC , 0400 | 0200 | 040 | 020 );
   if (f < 0) {
      char msg[200];
      sprintf(msg, "cannot open `%s'\n", Name);
      Fatal(msg);
      exit(1);
   }
   return f;
}
	

/*----------------------------------------------------------------------------*/
TdeclBuf(Name) char * Name; 
{
   sprintf(GenDeclFileName, "%s_$$_gen_file", Name);
   assert(GenDeclFileIsOpen == 0);

   GenDeclFile = openFile(GenDeclFileName);
   GenDeclBufPtr = &GenDeclBuf[0];
   GenDeclFileIsOpen = 1;
}



Tell(Name)
   char *Name;
{
   Told();
   OutFile = openFile(Name);
   OutBufPtr = &OutBuf[0];
   OutFileIsOpen = 1;
   curr_line_no = 0;
}

/*----------------------------------------------------------------------------*/

Told()
{
   if (OutFileIsOpen) {
      write(OutFile, OutBuf, OutBufPtr - &OutBuf[0]);
      close(OutFile);
      OutFileIsOpen = 0; 
      curr_line_no=0;
   }
}

TcloseDeclBuf() {
   if (GenDeclFileIsOpen) {
      FLUSHBUF(GenDeclFile, GenDeclBuf, GenDeclBufPtr);
      close(GenDeclFile);
      GenDeclFileIsOpen= 0;
   }



}

int get_curr_line_no() {
        return curr_line_no;
}

/*----------------------------------------------------------------------------*/

s(Str)
   char *Str;
{
   if(outputEnabled < 1 || ! Str) return ;

   TESTBUF(OutFile, OutBuf, OutBufPtr);
   while(*Str) {
        if(*Str == '\n') {
		curr_line_no ++;
	}
	*OutBufPtr++ = *Str++; 
   }
}

/*----------------------------------------------------------------------------*/

qu_s(Str)
   char *Str;
{
   if(outputEnabled < 1 ) return ;

   *OutBufPtr++ = '\"';

   while(*Str) {
      switch (*Str) {

      case '\\':
	 *OutBufPtr++ = '\\';
	 *OutBufPtr++ = '\\';
	 Str++;
	 break;
      case '\n':
	 *OutBufPtr++ = '\\';
	 *OutBufPtr++ = 'n';
	 Str++;
	 break;
      case '\"':
	 *OutBufPtr++ = '\\';
	 *OutBufPtr++ = '"';
	 Str++;
	 break;

      default:
         *OutBufPtr++ = *Str++; 
      }
   }

   *OutBufPtr++ = '\"';
}

/*----------------------------------------------------------------------------*/

lstring(s, isChar, isWide)
   char *s; int isChar; int isWide;
{
   /* the length field has only 1 byte, which can't be used for a long string */
   /* since '\0' is always added in the string end, the length of the lstring is not used */
   /* int len = (unsigned char)(*s); */
   int i;
  
   if(outputEnabled < 1 ) return ;


   s++; /* skip the length field */
   if(isWide) {
	*OutBufPtr++ = 'L';
   }
   if(isChar) {
	*OutBufPtr++ = '\'';
   }else {
	*OutBufPtr++ = '"';
   }
   while(*s != '\0') {
	if(*s == '\n') 
		curr_line_no++;
	*OutBufPtr ++ = *s;
	s++;
   }
   
   if(isChar) {
        *OutBufPtr++ = '\'';
   }else {
        *OutBufPtr++ = '"';
   }
}

/*----------------------------------------------------------------------------*/

f (rep)
  char *rep;
{
   s(rep);
}

/*----------------------------------------------------------------------------*/

doublequote ()
{
   s("\"");
}

/*----------------------------------------------------------------------------*/
i(N)
   long N;
{
   long butlast;
   long last;
   
   if(outputEnabled < 1 ) return ;
   
   if (N < 0) {
      *OutBufPtr++ = '-';
      N = - N;
   }
   last = N % 10;
   butlast = N / 10;
   if (butlast > 0) i(butlast);
   *OutBufPtr++ = last + '0';
}

sIntConst(lstring)
 char * lstring;
{
  s(lstring +1);
}



/*----------------------------------------------------------------------------*/

true_nl()
{
   if(outputEnabled < 1 ) return ;
   curr_line_no++;
   *OutBufPtr++ = '\n';
   TESTBUF(OutFile, OutBuf, OutBufPtr);
}

/*----------------------------------------------------------------------------*/
nl()
{
   if(outputEnabled < 1 ) return ;

   *OutBufPtr++ = ' ';
   TESTBUF(OutFile, OutBuf, OutBufPtr);
}

void turnOffOutput() {
	outputEnabled --;	 
}

void turnOnOutput() {
	outputEnabled ++;      
}

void outputLine(char * line, char rmvSrcLineTag) {
	char * start;
	/* remove the tag: ACLINE, and ADVICE_FUNC_BEGIN_TAG */
	if(  HASTAG(line, ACLINE) || 
             HASTAG(line, ADVICE_FUNC_BEGIN_TAG))  {
		start = strstr(line, "*/");
		if(start > 0) {
			s(start + 2);
		}else {
			s(line);
		}
	}else if( HASTAG(line, UTACSRCLINE) && rmvSrcLineTag == 1) {
		char * ss = strstr(line, UTACSRCLINE);
		*ss = '\0';
		outputLine(line, rmvSrcLineTag);
		start = strstr(ss + 1, "\"");
		s("# ");
        	i(get_curr_line_no() + 2);
        	s(" ");	
		outputLine(start, rmvSrcLineTag);
	}else if( HASTAG(line, ADVICE_FUNC_END_TAG) || HASTAG(line, UTAC_CFLOW_FUNCS_BEGIN) || HASTAG(line, UTAC_CFLOW_FUNCS_END)) {
		return;
	}else {
		s(line);
	}
}

/* add an extra parameter to a line containing a function declaration */
/* then output it */
void addExtraParameter(char * line, char hasParam) {
	char buf[ONELINE];
	int i;
	int lastBracket = -1;
	
	/* searching from the last ")", split it into 2 parts, and insert a "struct JoinPoint * __utac_jp" */ 
	for(i = strlen(line) - 1; i >= 0 ; i --) {
		if(line[i] == ')') {
			lastBracket = i;
			break;
		}
	}

	assert(lastBracket >= 0);
	line[lastBracket] = '\0';


	sprintf(buf, "%s %s %s %s %s %s ", line, (hasParam==0 ? " " : ","), "struct JoinPoint * ", JOINPOINT_VAR, " )", line+lastBracket+1);

	outputLine(buf, 0);
}


// functions for inserting generated declarations into the output file
void logGenDecls(char * decl, long line) {
	int size;
	if(line == 0) {
		//line = 0 means the declarations will be inserted after the latest declaration
		line = getPreDeclLineNum(); //  preLine;
	}else {
		setPreDeclLineNum(line); // preLine = line;
	}

	TESTBUF(GenDeclFile, GenDeclBuf, GenDeclBufPtr);
	
	//add a marker to indicate the end of the declarations
	GenDeclBufPtr += sprintf(GenDeclBufPtr, "%ld\n%s\n%s\n", line, decl, GENDECL_END);

	size = 7 + strlen(decl) + strlen(GENDECL_END) ; /* 4 for %d, 3 for \n */
	if(size > maxGenDeclSize) {
		maxGenDeclSize = size;
	}

	assert(GenDeclBufPtr - GenDeclBuf <= OutBufSize);  
	//make sure the buffer is big enough, otherwise, need to increase the buffer size 
}

void copy_files(char * targetFile, char * srcFile) {
	FILE * f;
	char oneLine[ONELINE];

	f= fopen(srcFile, "r");
	Tell(targetFile);
	while(fgets(oneLine, ONELINE, f)) {
                s(oneLine);
        }

	Told();			//close target file
	fclose(f);		//close source file
}

//insert the declarations into the output file
void insertGenDecls(char * fileName, char removeSrcTag) {
	FILE * f1 = NULL, *f2 = NULL;
	char tempFile[TEMPFILENAMELEN];
	char oneLineFromSrc[ONELINE], oneLineFromDeclBuf[ONELINE];
	
	char * newLine;
	char * decl, * declPtr ;
	char linePattern[ONELINE];
	char matched = 0, hasGenDecl = 0, endOfFile = 0; 
	char * oriexecBuf, *oriexecBufPtr;
	char adFuncName[NAMELEN];
	char adFuncHasParameter = 0;
	int lineNum = 0;
	int currentLineNumInF1 = 0;
	int maxSizeForExecBuf = 0;	
	//initialize 
	oneLineFromSrc[0] = oneLineFromDeclBuf[0] = '\0';
	linePattern[0] = '\0';
	adFuncName[0] = '\0';
	decl = (char*)malloc(maxGenDeclSize + 1);
	decl[0] = '\0';
	oriexecBuf = (char*)malloc(ONEFUNCDEFINITION+1);
	oriexecBuf[0]='\0';
	maxSizeForExecBuf = ONEFUNCDEFINITION;
	
	//open the original file
	f1 = fopen(fileName, "r");
	f2 = fopen(GenDeclFileName, "r"); 
	
	//create a temp file to store the merged file
        sprintf(tempFile, "%s_$decl", fileName);
        Tell(tempFile);

	while(1) {
		if(fgets(oneLineFromDeclBuf, ONELINE, f2) == NULL ||
			sscanf(oneLineFromDeclBuf, "%d\n", &lineNum) <= 0) {
                        //no generated declaration
			hasGenDecl = 0;
			decl[0] = '\0';
                	linePattern[0] = '\0';
		}else {
			hasGenDecl = 1;
		
			declPtr = decl;
			//search for the end marker of current declaration	
			while(fgets(oneLineFromDeclBuf, ONELINE, f2) &&
				strstr(oneLineFromDeclBuf, GENDECL_END) == NULL) {
				declPtr += sprintf(declPtr, "%s", oneLineFromDeclBuf);
			}
			
			if(HASTAG(decl, HAS_PROCEED_TAG)) {
				char * lineIndex;
				sprintf(adFuncName, "%s", decl + strlen(HAS_PROCEED_TAG) + strlen(NOPARAM_TAG));
				
				lineIndex = strstr(adFuncName, "\n");
				if(lineIndex) *lineIndex = '\0';
				
				if(HASTAG(decl, NOPARAM_TAG)) {
					adFuncHasParameter = 0;
				}else {
					assert(HASTAG(decl, HSPARAM_TAG));
					adFuncHasParameter = 1;
				}

				linePattern[0] = '\0';	
				decl[0] = '\0';
			}else {
				//create a pattern for searching in the original file
				sprintf(linePattern, "%s%d", ACLINE, lineNum);	
			}
		}

		while(currentLineNumInF1 != lineNum || hasGenDecl == 0) {
			if(oneLineFromSrc[0] != '\0') {
				matched = 1;
				if(HASTAG(oneLineFromSrc, ADVICE_FUNC_BEGIN_TAG) &&
				   adFuncName[0] != '\0' && 
				   strstr(oneLineFromSrc, adFuncName) ) {
					addExtraParameter(oneLineFromSrc, adFuncHasParameter);
					adFuncName[0] = '\0';
				}else if(strncmp(oneLineFromSrc, TYPEINSERTIONBEGIN, strlen(TYPEINSERTIONBEGIN)) == 0) {
                                	/* the tag indicates this is the place where new type members should be inserted */
                                	char acFile[NAMELEN];
                                	sprintf(acFile, "%s", oneLineFromSrc + strlen(TYPEINSERTIONBEGIN));
                                	assert(fgets(oneLineFromSrc, ONELINE, f1) != NULL);
                                	chopLine(acFile);
                                	chopLine(oneLineFromSrc);
                                	insertNewMember(acFile, oneLineFromSrc);
				}else if(HASTAG(oneLineFromSrc, ADVICE_FUNC_BEGIN_TAG) && strstr(oneLineFromSrc, "() {")) {
					/* it is an advice function having no parameter, need to specify "void" */
					char * paraStart = strstr(oneLineFromSrc, "() {");
					*paraStart = '\0';
					outputLine(oneLineFromSrc, removeSrcTag);
					s("(void) { \n");
				}
				else {
				   outputLine(oneLineFromSrc, removeSrcTag);
				}
			}
		
			if(fgets(oneLineFromSrc, ONELINE, f1) == NULL) {
				endOfFile = 1;
				break;
			}
		
			if(strstr(oneLineFromSrc, ACLINE) && oriexecBuf[0] != '\0') {
				outputLine(oriexecBuf, removeSrcTag);
				oriexecBuf[0] = '\0';
			}
	
			if(linePattern[0] != '\0' && strstr(oneLineFromSrc, linePattern)) {
				currentLineNumInF1 = lineNum;
				continue;
			}

			if(HASTAG(oneLineFromSrc, STARTNEWFUNCTAG)) {
				/* This tag indicates the following function defintion should be ouput after the current function definition */
				oriexecBufPtr = oriexecBuf;
				assert(fgets(oneLineFromSrc, ONELINE, f1) != NULL);
				while(! HASTAG(oneLineFromSrc, ENDNEWFUNCTAG)) {
					if( (oriexecBufPtr - oriexecBuf) + 
						strlen(oneLineFromSrc) >= maxSizeForExecBuf) {
						/* in case a big function body overflows the buffer */
						char * newbuf = (char *)realloc(oriexecBuf, maxSizeForExecBuf * 2 + 1);
						maxSizeForExecBuf *= 2;
						oriexecBufPtr = newbuf + (oriexecBufPtr - oriexecBuf);
						oriexecBuf = newbuf;
					}
					
					oriexecBufPtr += sprintf(oriexecBufPtr, "%s", oneLineFromSrc);
					assert(fgets(oneLineFromSrc, ONELINE, f1) != NULL);
				}
				
				assert(fgets(oneLineFromSrc, ONELINE, f1) != NULL);
			}

		}
		
		if(decl[0] != '\0') {
			outputLine(decl, removeSrcTag);	//output the declaration to the temp file
			outputLine("\n", removeSrcTag);
		}

		if(endOfFile == 1) {
			break;
		}
			
	}

	if(oriexecBuf[0] != '\0') {
           outputLine(oriexecBuf, removeSrcTag);
           oriexecBuf[0] = '\0';
        }

	//close all files
        Told();
        fclose(f1);
	
	fclose(f2);		
	remove(GenDeclFileName);
	
	if(matched) {
		copy_files(fileName, tempFile);
	}

	 //remove the temp file
        remove(tempFile);
	
	free(decl);
	free(oriexecBuf);

	//reset the buffer
	GenDeclBuf[0] = '\0';
        GenDeclBufPtr = &(GenDeclBuf[0]);
}

void insertNewMember(char * acFile, char * function) {
        FILE * f;
        char oneLine[ONELINE];
	int foundDecl = 0;
	int introduceBegin = 0;
	
        f= fopen(acFile, "r");
        while(fgets(oneLine, ONELINE, f)) {
		if(strstr(oneLine, INTRODUCEEND_TAG) && introduceBegin) {
                        break;
                }else if(introduceBegin && strstr(oneLine, "# ") == NULL && strstr(oneLine, "#line") == NULL 
			&& !HASTAG(oneLine, ACTYPEINSERTBEGIN)) {
			s(oneLine);
		}else if(strstr(oneLine, function)) { 
			foundDecl = 1;
		}else if(strstr(oneLine, INTRODUCEBEGIN_TAG) && foundDecl) {
			introduceBegin = 1;
		}
	}
        fclose(f);              //close source file
}

void output(char *val){
   printf("%s\n", val);
}

/** the *buf points to a list like:
    t2ac.c$t2ac$0\nt1ac.c$t1ac$1\n
    
    this function reverses it to be:
    t1ac.c$t1ac$1\nt2ac.c$t2ac$0\n
*/
char * reverseTypeInsertionMarkers(char ** buf) {
	char * result, * start , * p, * resultP;
	int count = 0;
	if(*buf == NULL) return NULL;
	result = (char *)malloc(strlen(*buf) + 1);
	resultP = result;

	start = *buf;
	p = (*buf) + strlen(*buf) - 1;

	/* search reversely */
	while(p != start) {
		if(*p == '\n') {
			*p = '\0';
			if(count > 0) {
				resultP += sprintf(resultP, "%s\n", p + 1);
				count = 0;
			}
		}else {
			count ++;
		}
		p = p - 1;
	}

	resultP += sprintf(resultP, "%s\n", p);

	MYFREE(*buf);
	
	*buf = result;
	return result;
} 

void searchInTypeDecl(char * typeName, struct Record * p, char ** funcName) {
        char * c;
        buildJoinPointContext(0, 0, copy_chars(typeName), "intype", &c);
        match_intype_join_point( c, funcName);
}

void insertTypeMember(char * acFile,struct Record * pc) {
	FILE * f = NULL, *f2 = NULL;
        char tempFile[TEMPFILENAMELEN];
	char tempFile2[TEMPFILENAMELEN];
	char oneLine[ONELINE];
	char typeName[ONELINE];
	char * funcName = NULL;
	
	//create 2 temp file
        sprintf(tempFile, "%s_$intype_insertion_temp", acFile);
     	sprintf(tempFile2,"%s_$ac_copy", acFile);
	
	copy_files(tempFile2, acFile);

	Tell(tempFile);
	f = fopen(tempFile2, "r");
        while(fgets(oneLine, ONELINE, f)) {
                if(HASTAG(oneLine, ACTYPEINSERTBEGIN)) {
			char * context, *buf, *bufP;
			char * p = strstr(oneLine, ACTYPEINSERTEND);
			*p='\0';
			sprintf(typeName, "%s", oneLine+ strlen(ACTYPEINSERTBEGIN));
		
			buildJoinPointContext(0, 0, copy_chars(typeName), "intype", &context);
			match_intype_join_point(context, &buf);
			bufP = reverseTypeInsertionMarkers(&buf);
			
			while(buf && strstr(buf, "\n")) {
				char fileName[ONELINE];
				char funcName[ONELINE];	
				char * newLine = strstr(buf, "\n");
				char * sep = strstr(buf, "#");
				*newLine = '\0';
				*sep = '\0';
				sprintf(fileName, "%s", buf);
				sprintf(funcName, "%s", sep + 1);
				insertNewMember(fileName, funcName);
				buf = (newLine + 1);
			}
			MYFREE(bufP);
		}else {
			outputLine(oneLine, 1); //the source line tag inside the aspect files should be removed in this round, because this is the final phase to process the aspect file.
		}
	}
        
	fclose(f);

	copy_files(acFile, tempFile);

	remove(tempFile);
	remove(tempFile2);
 
}

