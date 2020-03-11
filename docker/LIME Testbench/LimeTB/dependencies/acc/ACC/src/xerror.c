
/*
   xerror.c

   Error messages
*/

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "utac_tag.h"
#include "lexer.h"

char * errmsg_fmt[] = {
        /* undefined_pointcut */ "The pointcut '%s' is not defined . ",
        /* no_wildcard_in_callp */ "The 'callp' pointcut can not use wildcard character.",
        /* no_return_type_for_advice */ "The '%s' advice should not have return type .",
        /* invalid_pointcut_name */ "The '%s' is a keyword and it can not be the name of a user-defined pointcut.",
	/* redefine_pointcut_name */"The pointcut '%s' is already defined before.",
	/* advice_param_not_used */"Advice parameter '%s' is not used in the pointcut.",
	/* advice_param_multi_used */"Advice parameter '%s' has been used multiple times in the pointcut. ",
 	/* undeclared_id */"The identifier '%s' in the '%s' pointcut should be declared as a parameter of the advice function.", 
	/* invalid_intype */"The 'intype' pointcut can only be used in an 'introduce' advice.",
	/* invalid_introduce */"The 'introduce' advice can only have \'intype\' pointcut.",
        /* unmatched_type */"The parameter type of pointcut '%s' does not match the type specified in its definition.",
	/* invalid_proceed */"\'proceed\' can only be used in an 'around' advice.", 
	/* invalid_match_address */"The format of ( * identifier) can only be used in an 'args' or 'result' pointcut.", 
	/* unknown_advice */"The '%s' is not a valid advice type. Advice type should be \'before\', \'after\', \'around\', \'catch\', or \'introduce\' . ",
	/* nested_cflow */"Nested cflow() pointcut is not supported.",
	/* not_string_literal_infile */"The 'infile' pointcut should take a string literal.",
	/* wrong_keyword */"The keyword '%s' should be used , not '%s' . ", 
	/* multi_param_for_pointcut */"The '%s' pointcut should only take 1 parameter.",
	/* try_catch_mismatch */"The 'catch' advice should be used with a single 'try()' pointcut or multiple 'try()' pointcuts connected by '||'.",
	/* catch_wrong_param */"The 'catch()' advice should have only 1 integral type parameter, which should not appear inside pointcut definition."
};


long currDefnLineNum = 0;
long currDefnBgnLn = 0; /* the line number for the beginning of a function body */
			/* eg:
				-->currDefnLineNum
				void foo() {
					-->currDefnBgnLn	
					printf("abc\n");
				}
			*/
int preDeclLineNum = 1;

char sJMPH_Emitted = 0;	/* whether the <setjmp.h> is already emitted */

char isSJMPH_Emitted() { return sJMPH_Emitted ; }
void setSJMPH_Emitted() { sJMPH_Emitted = 1; }


long getCurrDefnLineNum() {
	return currDefnLineNum;
}

long getCurrDefnBgnLn() {
	return currDefnBgnLn;
}

int getPreDeclLineNum() {
	return preDeclLineNum;
}

void setPreDeclLineNum(int line) {
	preDeclLineNum = line;
}

void resetCurrDefnLineNum() {
	currDefnBgnLn = currDefnLineNum = 0;
	preDeclLineNum = 1;
	sJMPH_Emitted = 0;
}

/* set semantic error */
int semError = 0;
 
int getSemanticError() {
    return semError;
}

 
ERROR( msg, pos, msgid)
   char *msg;
   long pos;
   int msgid;
{
   long filenum, linenum;

   filenum = pos / 1000000;
   linenum = pos % 1000000;
   printf("\"%s\", line %ld: error-%d: %s\n", number_to_name(filenum), linenum, msgid, msg);
   semError = 1;
   if(msgid == syn_error ) exit(1); 
}

WARNING( msg1, msg2)
	char * msg1;
	char * msg2;
{
	printf( msg1 , msg2 );
}

ErrorI (msg1, id, msg2, pos)
   char *msg1;
   char *id;
   char *msg2;
   long pos;
{
   char buffer[500];
   char *repr;
   GetRepr2 (id, &repr);

   sprintf(buffer, "%s\'%s\'%s", msg1, repr, msg2);
   ERROR(buffer, pos);
}

ErrorII (msg1, id1, msg2, id2, msg3, pos)
   char *msg1;
   char *id1;
   char *msg2;
   char *id2;
   char *msg3;
   long pos;
{
   char buffer[500];
   char *repr1;
   char *repr2;

   GetRepr2 (id1, &repr1);
   GetRepr2 (id2, &repr2);

   sprintf(buffer, "%s%s%s%s%s", msg1, repr1, msg2, repr2, msg3);
   ERROR(buffer, pos);
}


Error_new(id, fmt, pos)
   int id;
   char *fmt;
   long pos;
{
   char buffer[500];
   sprintf(buffer, "%s", fmt);
   ERROR(buffer, pos, id);
}

ErrorI_new(id, fmt, para, pos)
   int id;
   char *fmt;
   char * para;
   long pos;
{
   char buffer[500];
   sprintf(buffer, fmt, para);
   ERROR(buffer, pos, id);
}


ErrorII_new(id, fmt, para1, para2, pos)
   int id;
   char *fmt;
   char * para1;
   char * para2;
   long pos;
{
   char buffer[500];
   sprintf(buffer, fmt, para1, para2);
   ERROR(buffer, pos, id);
}

void outputOneFilePos(unsigned long fpos, char ol) {
	unsigned long filenum, linenum;

   	filenum = fpos / 1000000;
   	linenum = fpos % 1000000;

        if(ol) {
		s("#line ");
	}else {
		s("# ");
	}

	i(linenum); s(" \""); s(number_to_name(filenum)); s("\""); 

	if(! ol) {
		s(" "); s(number_to_level(filenum));
	}
}

LineInfo(unsigned long pos)
{
   unsigned long filenum, linenum;
   char ol = 1;
   PUTVarLine(pos);

   assert(pos > 0);

   filenum = pos / 1000000;
   linenum = pos % 1000000;

   true_nl();

   //during weaving, we need to keep track line information of each function definition
   //in order to know where to insert the generated function declaration
   //insert a global line number for indicator 
   if(isAFuncDefinition()) {
   	//it serves as a searching target when inserting generated declarations
	currDefnLineNum = currDefnBgnLn + 1;
	s("/*"); s(ACLINE); i(currDefnLineNum); s("*/");
   }
   
   if(needLine()) {
	struct file_chain *p = number_to_file(filenum);
	struct file_pos_chain *fpc = p->preFilePos;
	if(fpc) {
		ol = 0;
	}
	
	while(fpc) {
		outputOneFilePos(fpc->fpos, ol);
		true_nl();
		fpc=fpc->next;
	}
	outputOneFilePos(pos, ol);
   }

   true_nl();
}

void outputDefnBgnLn() {
	currDefnBgnLn = currDefnLineNum + 1;
	
	true_nl();
	s("/*"); s(ACLINE); i(currDefnBgnLn); s("*/");
	true_nl();
}


Fatal(msg)
   char *msg;
{
   printf("Fatal: %s\n", msg);
   exit(1);
}

char * get_current_token();

yyerror(msg)
   char *msg;
{
   unsigned long pos;
   char buffer[500];
   char * currToken;
   get_current_pos(0, &pos);
   currToken = get_current_token();

   sprintf(buffer, "%s near token '%s' .", msg, currToken);
   ERROR(buffer, pos, syn_error);
}

