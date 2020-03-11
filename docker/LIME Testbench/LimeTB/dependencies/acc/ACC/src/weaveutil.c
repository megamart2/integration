#include "weaveutil.h"
#include "symboltable.h"
#include "lexer.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


boolean isFuncDefn;
struct Context * currExecContext= NULL;
char *rtType = NULL;
char *funcId = NULL;
int call_counter = 0;
struct CallContext * matchedCallContexts = NULL;


boolean startCallMatch = FALSE;
char * curr_call_fp_name = NULL;	// when matching a call through a function pointer, we need to pass the value of the function pointer as the last argument for the generated function call, curr_call_fp_name points to the function pointer name
boolean curr_call_has_preturn = FALSE;

struct Scope * currScope = NULL;

int wrapper_counter = 0;
char * target = NULL;
char * typedefTarget = NULL;

int strLevel = 0;
int setFuncName = 0;

boolean needSetjmp = FALSE;

char * emitConditionStmt(char * buf, struct advice * d);


/***************************/
void enterStrDecl() {
	strLevel ++;
}

void leaveStrDecl() {
	strLevel --;
}

/*************************/
int lvalLevel = 0;
void incrLVal() {
	lvalLevel ++;
}
void decrLVal() {
	lvalLevel --;
}
void isLVal(long *flag) {
	if(lvalLevel > 0) {
		*flag = 1;
	}else {
		*flag = 0;
	}
}

int disableGetLevel = 0;
void incrDisableGet() {
        disableGetLevel ++;
}
void decrDisableGet() {
        disableGetLevel --;
}
void isDisableGet(long *flag) {
        if(disableGetLevel > 0) {
                *flag = 1;
        }else {
                *flag = 0;
        }
}

/***************************/
/* set */

void setCollectFuncName() {
	setFuncName = 1;
}

void unsetCollectFuncName() {
	setFuncName = 0;
}



void setFuncId(char *id){
   if(id == NULL){
   	  return;
   }

   if(funcId == NULL && setFuncName == 1){
      funcId = id;
   }
}

void endFuncCollection() {
	rtType = "";
	funcId = NULL;
	needSetjmp = FALSE;
}

void setCurrentExecContext(char * c) {
	assert(c);
	assert(currExecContext == NULL);
	currExecContext = (struct Context *)(c);
}


void setFuncDefinition() { isFuncDefn = TRUE; }

void setTypedefTargetName() {
        typedefTarget = target;
}
void setDeclaratorTarget(char * s) {
        target = copy_chars(s);
}

long firstDeclarator = 1;

void setFirstDeclarator() {
	firstDeclarator = 1;
}

void unsetFirstDeclarator() {
	firstDeclarator = 0;
}

void isFirstDeclarator(long * flag) {
	*flag = firstDeclarator;
}

/********************************/
/* unset */
void unsetFuncDefinition() { isFuncDefn = FALSE; }
void unsetDeclaratorTarget() {
        MYFREE(target);
        target = typedefTarget = NULL;
}

/********************************/
/* check */
boolean isAFuncDefinition() { return isFuncDefn;}
void isCallMatch(long *flag) { *flag =  startCallMatch; }
void isPointcutExist(long *flag) { *flag = (PointCutTable == NULL ? 0 : 1 );
//printf("Flag is %d \n", *flag);
//if(PointCutTable==NULL)
//printf("PointCutTable is NULL\n");

            }


boolean needReturn(char * rtType) {
	if(rtType != NULL && !(match_type(rtType, "")) && !(match_type(rtType, "void")))
		return TRUE;

	return FALSE;
}


boolean needReturnValue(struct Context * c) {
	return needReturn(c->rtType);

}

void needLogSetjmp(long *flag) { *flag = needSetjmp; }


/***************************/
/* get */

void get_curr_func_name(char ** f) {
	*f = funcId;
}

char * get_exec_ori_name(char * fName, char * buf) {
	sprintf(buf, "%s%s", fName, EXEC_ORI_NAME);
	return buf;
}


char * get_wrapper_func_name(char *fName, PointcutType t, char * buf) {
	char * baseFileName;
        get_target_file_base_name(&baseFileName);

        sprintf(buf, "%s_%s_%s_%d", fName, t==CALL ? CALL_WRAPPER_NAME : EXEC_WRAPPER_NAME, baseFileName, wrapper_counter);
        return buf;
}

void getCurrentExecContext(char **c) {
	*c = (char *)currExecContext;
}

/* need to handle the case:

   typedef struct X {
		union {		<-- this union doesn't have a typedef target
			int b;
		} c;
   }MYU;

*/
void getTypedefTarget(char ** s) {
        if(typedefTarget && strLevel == 1) {
                *s = copy_chars(typedefTarget);
        }else {
                *s = NULL;
        }
}

/***************************/
/* add */
void addMatchedCallContexts(struct CallContext **head, struct CallContext *d){
   struct CallContext * temp;
   temp = *head;
   *head = d;
   d->next = temp;
}

/**************************/
/* start */
void initFuncCollection(){
  rtType = "";
  funcId = NULL;
  needSetjmp = FALSE;
}

void initFuncCalls(){
   call_counter = 0;
}

void StartCallMatch(){
   startCallMatch = 1;
   curr_call_fp_name=NULL;
   curr_call_has_preturn = FALSE;
}

void startNewFuncDefn(char * context) {
	char declBuf[1000];
	char nameBuf[NAMELEN];
	char srcLineBuf[ONELINE];

	struct Context * c = (struct Context *)(context);
	assert(c->type == EXECUTION);

	s("\n"); s(STARTNEWFUNCTAG); s("\n");

	s(genSrcLineInfo(srcLineBuf));
	genFuncDecl(get_exec_ori_name(c->funcName, nameBuf), c->rtType, c->p, declBuf, 0);
	s(declBuf);

	s(" { \n");

	outputReturnDeclInContext(c);

}

void endNewFuncDefn() {
	s("\n } \n");
	s(ENDNEWFUNCTAG);
	s("\n");
}


/**************************/
/* end */
void EndCallMatch(){ startCallMatch = 0; }


/*************************/
/* enqueue */
void enqueueAdvice(struct AdviceQueue **head, struct advice *data, boolean emitCondition){
  struct AdviceQueue *d;

  if(data == NULL){
  	 return;
  }

  d = (struct AdviceQueue *)malloc(sizeof(struct AdviceQueue));
  d->data = data;
  d->next = (*head);
  d->emitCond = emitCondition;

  (*head) = d;
}

void newEnqueueAdvice(AdviceType aT, struct Context *c, struct advice *data, boolean emitCondition) {
	switch(aT){
             case BEFORE:
                    enqueueAdvice(&(c->before_advices), data, emitCondition);
                    break;
             case AFTER:
                    enqueueAdvice(&(c->after_advices), data, emitCondition);
                    break;
             case AROUND:
                    enqueueAdvice(&(c->around_advices), data, emitCondition);
                    break;
             default:
                    assert(0);
         }

}

/************************/
/* append */
void appendAdvice(AdviceType aT, struct Context *c, struct advice *data) {
        struct AdviceQueue *d;
	struct AdviceQueue *head = c->after_advices;
	assert(aT == AFTER);
        assert(data);
  	d = (struct AdviceQueue *)malloc(sizeof(struct AdviceQueue));
  	d->data = data;
  	d->next = NULL;
	d->emitCond = FALSE;

	while(head && head->next) {
		head = head->next;
	}
	if(head == NULL) {
		c->after_advices = d;
	}else {
		head->next = d;
	}
}

/* add declaration for cflow functions and cflow context exposure functions in the buf */
/* make sure the totalLen < maxLen */
/* where totalLen = oldLen + length of cflow function declarations */
void append_cflow_func(struct advice * ad, char * buf, int * oldLen, int maxLen) {
	char * ptr = buf , *start;
	char * lp = 0;
	int len = 0;
	struct adviceParam * ap = ad->p;
	if(ad->cflowCondition != NULL) {
		start = strstr(ad->cflowCondition, CFLOW_FUNC_NAME);
		if(start) {
			lp = strchr(start, '(');
			assert(lp);
			*lp = '\0';
			len = sprintf(ptr, "int %s(int, int);\n", start);
			*lp = '(';
			ptr += len;
			(*oldLen) += len;
			assert(*oldLen < maxLen);
		}
	}

	while(ap != NULL) {
		if(ap->callCflowContextFunc != NULL) {
			lp = strchr(ap->callCflowContextFunc, '(');
			assert(lp);
			*lp = '\0';
			if(strstr(buf, ap->callCflowContextFunc) == NULL) {
				len = sprintf(ptr, "void * %s(int,int,void*);\n", ap->callCflowContextFunc);
				ptr += len;
				(*oldLen) += len;
				assert(*oldLen < maxLen);
			}
			*lp = '(';
		}
		ap = ap->next;
	}
}


/*****************************/
/* insert */
void insert_advice(AdviceType type, char * callC, long * flag) {
	struct Context * c = (struct Context *)(callC);
        struct AdviceQueue * ptr;
        *flag = 0;
	assert(c);
        assert(type == BEFORE || type == AFTER || type == AROUND);
	switch(type) {
		case BEFORE:
			ptr = c->before_advices; break;
		case AFTER:
			ptr = c->after_advices; break;
		case AROUND:
			ptr = c->around_advices;
	}

	while(ptr != NULL) {
		if(c->type == EXECUTION) {
                        output_one_advice_declaration(ptr->data, FALSE, NULL);
                }

		if( (ptr->data->malInfo & HASPROCEED) ||
		    (type == AROUND && ptr->emitCond == TRUE)) {
              		insert_advice_with_context(ptr, c, ptr->emitCond, TRUE);
			*flag = 2;
			//the rest advices on the queue are handled inside the insert_advice_with_context functions
			break;
		}
		else if(ptr->data->malInfo & HASTHISJPN || ptr->data->malInfo & HASPRETURN) {
                        insert_advice_with_context(ptr, c, ptr->emitCond, FALSE);
                        *flag = 1;
		} else {
			*flag = 1;
			s("\n{\n");
			insert_one_advice(ptr->data, c, ptr->emitCond);
			s("\n}\n");
                }
		ptr = ptr->next;
        }
}

//for simple advice , it should generated like:
/*
	{
		int kk= p1;
		char * p = p2;
		advice_func_cal(kk, p);
	}	<-- the opening and closing {} shold be added by the caller


where p1, and p2 are formal parameter of the join point

for around advice: it will assign return value.

{
	int kk = p1;
	char * p = p2;
	$rtVal = advice_func_call(kk,p);
}

*/
void insert_one_advice(struct advice * d, struct Context * c, boolean emitCond) {
        struct adviceParam * param = d->p;
        char func_call_buf[ONEFUNCDEFINITION];        //the buffer for the generated call
        char * buf = func_call_buf;
        char * oneName;
        char * temp;
        long index = 1, cflowlevel = 0, indexInCflow = 0;
        assert(c);

	//let's start
	switch(d->type) {
		case ADBEFORETRY:
                {
                        struct advice * ad = (struct advice *)(d->name);
                        if(d->cflowCondition) {
				buf += sprintf(buf, "if ( %s ) { \n", d->cflowCondition);
			}

			buf += sprintf(buf, "\n{ extern %s ; \n", ERRSTACKMGT_DECL);
			buf += sprintf(buf, "int %s = 0 ; \n int i = 0 ; \n", TRY_EXCEP_POPLEVEL);
                        index = (long)d->rtType;
			assert(index);
			assert(ad);

			buf += sprintf(buf, "%s ( & %s_%ld , %d , %d ) ; \n", ERRSTACKMGT_NAME, TRY_EXCEPV, index, ERRSTACK_PUSH , 1);
                        buf += sprintf(buf, "%s |= 1 << (%ld - %ld ) ; \n", TRY_EXCEP_MASK, c->numOfCH, index);

			/* keep track of number of pops to do when "preturn" is called */
			if(ad->malInfo & HASPRETURN) {
                        	buf += sprintf(buf, "%s ++ ;\n", JMPPOPS);
			}

			buf += sprintf(buf, "if (%s_%ld = setjmp(%s_%ld)) { \n", TRY_RETVAR, index, TRY_JMPBUF, index );

			/* need to find out how many handlers to pop */                                 buf += sprintf(buf, "%s = 0; \n", TRY_EXCEP_POPLEVEL);
			buf += sprintf(buf, "for(i = %ld - %ld - 1; i >= 0; i--) { \n if(%s & ( 1 << i)) { %s ++ ; } \n } \n", c->numOfCH, index, TRY_EXCEP_MASK, TRY_EXCEP_POPLEVEL);

			if(ad->malInfo & HASPRETURN) {
				buf += sprintf(buf, "%s = %s ; \n", JMPPOPS, TRY_EXCEP_POPLEVEL);
			}

			/* call the "catch()" advice function */
			buf += sprintf(buf, " %s ( %s_%ld ", ad->name, TRY_RETVAR, index);

			if(ad->malInfo & NEEDEXTRAP) {
				buf += sprintf(buf, ",  & %s ", JOINPOINT_VAR);
			}

			buf += sprintf(buf, " %s ; \n", ")");

			buf += sprintf(buf, "%s ( & %s_%ld, %d , %s ); \n", ERRSTACKMGT_NAME, TRY_EXCEPV, index, ERRSTACK_POP, TRY_EXCEP_POPLEVEL);

			/* return , mwgong todo: need to reconsider which value to return */
			/* need to force adding a return */
			buf = outputReturnInContext(c, 1, buf);
			buf += sprintf(buf, "\n %s \n", "}");


                        buf += sprintf(buf, "%s \n", "}");

			if(d->cflowCondition) {
                                buf += sprintf(buf, "\n%s\n", "}");
                        }
                }

			break;
                case ADAFTERTRY:
			if(d->cflowCondition) {
                                buf += sprintf(buf, "if ( %s ) { \n", d->cflowCondition);
                        }

			buf += sprintf(buf, "\n{ extern %s ; \n", ERRSTACKMGT_DECL);

			/* pop */
			buf += sprintf(buf, "%s ( & %s_%d, %d , %d ); \n", ERRSTACKMGT_NAME, TRY_EXCEPV, 1, ERRSTACK_POP, 1);

			buf += sprintf(buf, "\n%s\n", "}");

			if(d->cflowCondition) {
                                buf += sprintf(buf, "\n%s\n", "}");
                        }

                        break;



		case ADBEFORECFLOW:
			cflowlevel = CFLOWINCREASE;

			/* register the cflow level on the top of the catch handler */
			buf += sprintf(buf, "{ extern %s ; \n void * tmp = %s ( 0, %d , 1); \n", ERRSTACKMGT_DECL, ERRSTACKMGT_NAME, ERRSTACK_TOP);
			buf += sprintf(buf, " if(tmp) { extern %s ; \n", EXCEP_CF_SET_DECL);
			buf += sprintf(buf, " %s (tmp, & %s, %s(%d,0)); } \n } \n", EXCEP_CF_SET_NAME, d->name, d->name, CFLOWQUERY);

			if(c->malInfo & HASPRETURN) {
				if(c->type == CALL) {
					/* need to store:
						1. current value of cflow level;
						2. cflow function address into the jmp_buf variable.
						When the longjmp jumps to the position indicated by jmp_buf variable, all stored cflow value should be restored */
					/* a helper function will be provided by ACC */
					buf += sprintf(buf, "{ extern %s ; \n", EXCEP_CF_SET_DECL);
					buf += sprintf(buf, "%s ( %s, & %s , %s(%d, 0)); } \n",
						EXCEP_CF_SET_NAME,
						UTAC_EXCEP_PARAM_NAME,
						d->name,
						d->name,
						CFLOWQUERY);
				}else {
					assert(c->type == EXECUTION);
					buf += sprintf(buf, "{ extern %s ; \n", EXCEP_CF_SET_DECL);
					buf += sprintf(buf, "%s ( (void *) & %s, & %s , %s(%d, 0)); } \n",
						EXCEP_CF_SET_NAME,
                                		UTAC_EXCEP_VAR,
						d->name,
						d->name,
						CFLOWQUERY);
				}
			}
		case ADAFTERCFLOW:
			if(cflowlevel != CFLOWINCREASE) {
				cflowlevel = CFLOWDECREASE;
				if(c->malInfo & HASPRETURN) {
                                	if(c->type == CALL) {
                                        	/* need to free memory */
                                        	/* a helper function will be provided by ACC */
                                        	buf += sprintf(buf, "extern %s ; \n", EXCEP_CF_FREE_DECL);
                                        	buf += sprintf(buf, "%s ( %s ); \n",
                                                	EXCEP_CF_FREE_NAME,
                                                	UTAC_EXCEP_PARAM_NAME);
                                	}else {
                                        	assert(c->type == EXECUTION);
						buf += sprintf(buf, "extern %s ; \n", EXCEP_CF_FREE_DECL);
                                        	buf += sprintf(buf, "%s ( (void *) & %s); \n",
                                                	EXCEP_CF_FREE_NAME,
                                                	UTAC_EXCEP_VAR);
                                	}
                        	}
			}

			sprintf(buf, "%s ( %ld, 0 ) ; \n", d->name, cflowlevel);

			break;
		case ADARGSCFLOW:
			assert(param);

			/* the prototype for the function corresponding to args() inside cflow is :	void * func_name(int, int, void *) */

                        while(param) {
                                oneName = output_one_param(param, c, index++);
                                buf += sprintf(buf, "%s(%d, %ld, (void *)(&%s) ); \n", d->name, CFLOWSETCONTEXT, indexInCflow ++, oneName);
                                MYFREE(oneName);
                                param = param->next;
                        }

			break;
		case BEFORE:
		case AFTER:
		case AROUND:
			if(emitCond) {
				/* 1. add function declaration */
				/* 2. enable/disable settting the target name */
				buf = emitConditionStmt(buf, d);
			}

			if(d->type == AROUND && needReturn(c->rtType)) {
				buf += sprintf(buf, "%s = ", RETVALUE);
			}

        		buf += sprintf(buf, "%s%s", d->name, "(");

        		while(param) {
                		oneName = output_one_param(param, c, index++);
                		buf += sprintf(buf, "%s ,", oneName);
                		MYFREE(oneName);
				param = param->next;
        		}

			if(d->malInfo & NEEDEXTRAP) {
				//need to add an extra argument for the join point
				buf += sprintf(buf, "&%s ", JOINPOINT_VAR);
        		}else {
				temp = buf - 1;
        			if(*temp == ',') {
                			buf = temp;
        			}
        		}

			buf += sprintf(buf, "%s", ");\n");

			if(emitCond) {
				buf += sprintf(buf, " } \n");
			}
			break;
		default:
			assert(0);
	}

	//function call is composed fully, output it
        s(func_call_buf);
}

void insert_advice_with_context(struct AdviceQueue * aQ, struct Context * c, boolean emitCond, boolean needWrapperFunction) {
	int index = -1;
        int j = -1;
        struct Param * pa = c->p;
	char wrapperFuncName[NAMELEN];
	struct advice * ad = aQ->data;

	/* let's start , generate it line by line */
	s(" { \n" );
	s(" struct JoinPoint "); s(JOINPOINT_VAR); s("; \n");

	/* store address of the argument value */
        if(needWrapperFunction || (ad->malInfo & HASTHISJPNARG)) {
		while(pa != NULL){
                	index ++;
                	s(pa->type); s("* "); s(JOINPOINT_ARG); i(index); s(" = &"); s(pa->id) ; s("; \n");
                	s("const char * "); s(JOINPOINT_ARGTYPE); i(index) ; s(" = \"");
			s(pa->type); s("\"; \n");
			pa = pa->next;
        	}

		s(" void * "); s(JOINPOINT_ARGS); s("["); i(index+1); s("]; \n");
		s(" const char * "); s(JOINPOINT_ARGSTYPE); s("["); i(index+1); s("];\n");
      		s(JOINPOINT_VAR); s(".argsCount = ") ; i(index + 1); s(" ; \n");

		s(" void * "); s(JOINPOINT_RETP); s("[1]; \n");
        	if(needReturnValue(c)) {
                	s(c->rtType); s(" ") ; s(JOINPOINT_RET) ; s(" ;\n");
        	}

		/* get address */
        	for(j = -1; j < index; ) {
			j++;
			s(JOINPOINT_ARGS); s("["); i(j); s("] = (void*)("); s(JOINPOINT_ARG); i(j); s(");\n");
			s(JOINPOINT_ARGSTYPE); s("["); i(j); s("] = "); s(JOINPOINT_ARGTYPE); i(j); s(";\n");
        	}
		if(needReturnValue(c)) {
			s("*"); s(JOINPOINT_RETP); s("  = (void *)(&"); s(JOINPOINT_RET); s(");\n");
		}

		/* setup jointpoint structure */
        	s(JOINPOINT_VAR); s(".args = "); s(JOINPOINT_ARGS); s("; \n");
		s(JOINPOINT_VAR); s(".argsType = "); s(JOINPOINT_ARGSTYPE); s("; \n");

		s("{ extern "); s(JOINPOINT_ARG_FUNC_DECL); s(" ; \n ");
		s(" extern "); s(JOINPOINT_ARGTYPE_FUNC_DECL); s(" ; \n");
		s(JOINPOINT_VAR); s(".arg = "); s(JOINPOINT_ARG_FUNC_NAME); s(" ; \n");
                s(JOINPOINT_VAR); s(".argType= "); s(JOINPOINT_ARGTYPE_FUNC_NAME); s(" ; } \n");

		if(needWrapperFunction) {
			s(JOINPOINT_VAR); s(".fp = &(");
			s(get_wrapper_func_name(c->funcName, c->type, wrapperFuncName)); s(");\n");
        	}
		s(JOINPOINT_VAR); s(".retValue = "); s(JOINPOINT_RETP); s(" ; \n");
      		s(JOINPOINT_VAR); s(".retType =\""); s(c->rtType); s("\" ; \n");
	}

	if(ad->malInfo & HASTHISJPN) {
		s(JOINPOINT_VAR); s(".funcName = \""); s(c->insideFunc); s("\"; \n");
		s(JOINPOINT_VAR); s(".targetName = \""); s(c->funcName); s("\"; \n");
		s(JOINPOINT_VAR); s(".fileName = \""); s(number_to_name(c->insideFile/ 1000000)); s("\"; \n");
		s(JOINPOINT_VAR); s(".kind = \""); s(getPointCutTypeText(c->type)); s("\"; \n");
	}

	if(ad->malInfo & HASPRETURN) {
                s(JOINPOINT_VAR);
		s(".excep_return = ");
		switch(c->type) {
			case SETPC:
			case CALL:
			case GETPC:
				s(UTAC_EXCEP_PARAM_NAME); break;
			case EXECUTION:
				s(" (void *) &"); s(UTAC_EXCEP_VAR); break;
			default:
				assert(0);
		}
		s("; \n");
        }

	/* open a scope for the advice */
	s(" { \n");

	insert_one_advice(ad, c, emitCond);

	/* emit the else part if there is a cflow condition */
	if(ad->type == AROUND && emitCond == TRUE) {
		s("\n else { \n");
		/* just call the wrapper function, like the proceed call inside the advice function */
		outputReturnAssignInContext(c);
		if(needReturnValue(c)) {
                	s("(** ("); s(c->rtType); s(" **)");
                }
		s(get_wrapper_func_name(c->funcName, c->type, wrapperFuncName));
		s("(&");	s(JOINPOINT_VAR); s(" ) ");
		if(needReturnValue(c)) {
			s(")");
		}
		s("; \n } \n");
	}

	/* close the scope for the advice */
	s(" \n } \n");

	/* close the outer scope */
	s(" } \n");

	if(needWrapperFunction) {
		logWrapperFunction(aQ, c, NULL);
		wrapper_counter++;
	}
}


void insert_call_bodys(){
	struct CallContext * ptr = matchedCallContexts;
        while(ptr != NULL){
           genCallBody(ptr);
           ptr = ptr->next;
        }
}

void insert_advice_for_args_in_cflow(struct ArgsInCflow * args, struct Context * c) {
	struct ArgsInCflow * arg = args;

	while(arg != NULL) {
		struct advice *ad = create_advice_for_args_in_cflow(arg, c);
		if(ad != NULL) {
			newEnqueueAdvice(BEFORE, c, ad, FALSE);
		}
		arg = arg->next;
	}
}


/********************************/
/* delete */
void delCurrentExecContext() {
	assert(currExecContext);
	free_context(currExecContext);
	currExecContext = NULL;
}

/*******************************/
/* create */
/* for each args() pointcut inside a cflow, need to create a special advice, so that
the context would be exposed when the cflow() takes effect */
struct advice * create_advice_for_args_in_cflow(struct ArgsInCflow * arg, struct Context * c) {
	struct advice * ad = NULL;
	struct adviceParam * ap = NULL;
	struct adviceParam * tp = ap;
	struct pointcutParam * p = arg->pc->info.mInfo->p;
	int indexInCflow = 0;

	/* look through each parameter inside args() to find each parameter which needs to expose context */
	while(p != NULL) {
		if(p->ap != NULL) {
			struct adviceParam * newAp = (struct adviceParam *)malloc(sizeof(struct adviceParam));
			assert(newAp != NULL);
			newAp->p.id = copy_chars(p->ap->p.id);
   			newAp->p.type = copy_chars(p->ap->p.type);
        		newAp->indexInContext = copy_argindex_incontext(p->ap->indexInContext);
        		newAp->matchAddress = p->ap->matchAddress;
        		newAp->usedInPC = TRUE;

			assert(p->ap->callCflowContextFunc != NULL);
			newAp->callCflowContextFunc = NULL;

			newAp->next = NULL;
			newAp->p.next = NULL;
			if(tp) {
				tp->next = newAp;
				tp->p.next = (struct Param *)newAp;
			}else {
				ap = newAp;
			}
			tp = newAp;
		}

		p = p->next;
	}


	if(ap != NULL) {
		char buf[NAMELEN];
		ad = (struct advice *)malloc(sizeof(struct advice));
                assert(ad != NULL);

		ad->name = copy_chars(arg->funcName);
                ad->rtType = NULL;
                ad->type = ADARGSCFLOW;
                ad->p = ap;
		ad->malInfo = 0;
                ad->acFileBaseName = NULL;
                ad->cflowCondition = NULL;
	}

	return ad;
}


/**************************/
/* output */

/* definition of following functions are in the libacc.a */
void output_exception_cflow_handler_func_decl() {
       	s("extern "); s(EXCEP_CF_SET_DECL); s("; \n");
       	s("extern "); s(EXCEP_CF_FREE_DECL) ; s(";\n");
      	s("extern "); s(EXCEP_CF_RESET_DECL) ; s(" ; \n");
	s("extern "); s(ERRSTACKMGT_DECL); s(";\n");


}

void outputWithSrcLine(char * str) {
	char srcLineBuf[ONELINE];
	s(genSrcLineInfo(srcLineBuf));
	s(str);
}



//output a parameter for an advice function call,
//return the newly created name
char * output_one_param(struct adviceParam * param, struct Context * context, int index) {
	char newNameBuf[NAMELEN];
	char paraDeclBuf[ONELINE];
	char * newName;
	char * realContextName;
	int len ;
	int indexInContext;
	sprintf(newNameBuf, "%s%d", ADVICE_ARGUMENT, index);
	len = strlen(newNameBuf) + 1;
	newName = (char *)malloc(len);
	strcpy(newName, newNameBuf);
	newName[len-1] = '\0';

	if(param->callCflowContextFunc != NULL) {
                buildParamDecl(paraDeclBuf, param->p.type, newName);
                s(paraDeclBuf); s (" = ");
		/* should call the function to get the value */
		s (" * ("); s(param->p.type); s(" * )"); s(param->callCflowContextFunc); s("; \n");
	}else {
		if(param->indexInContext->argIndex == 0) {
			assert(param->indexInContext->nextContext == NULL && param->indexInContext->c == NULL);
			indexInContext = 0;
		}else {
			indexInContext = findArgIndexInContext(param->indexInContext, context)->argIndex;
		}
		assert(indexInContext >= 0);
		if(indexInContext == 0) {
			realContextName = RETVALUE;
        	}else {
        		realContextName = find_parameter_by_index(context->p, indexInContext)->id;
		}

		assert(realContextName);

		/* everything is ready, emit the declaration */
        	buildParamDecl(paraDeclBuf, param->p.type, newName);
		s(paraDeclBuf); s (" = ");

		if(param->matchAddress == TRUE) s("&");
		s(realContextName); s(" ; \n");
	}
	return newName;
}


void outputReturn() {
	outputReturnInContext(currExecContext, 0, NULL);
	//Told_flush();
}

void outputUserReturn() {
	outputReturnInContext(currExecContext, 1, NULL);
}

char * outputReturnInContext(struct Context * c, int userReturn, char * buf) {
        assert(c->rtType);

	if(needReturn(c->rtType)) {
		char srcLineBuf[ONELINE];
           	char retTypeBuf[ONELINE];

		buildParamDecl(retTypeBuf, c->rtType, NULL);

		if(buf == NULL) {
                	s(genSrcLineInfo(srcLineBuf));
                	s("return ("); s(retTypeBuf) ; s(")"); s(RETVALUE); s(";\n");
            	}else {
                	buf += sprintf(buf, "%s", genSrcLineInfo(srcLineBuf));
                	buf += sprintf(buf, "return ( %s ) %s ; \n", retTypeBuf, RETVALUE);
            	}
        }else if(userReturn) {
		if(buf == NULL) {
                	s("return ; \n");
           	}else {
                	buf += sprintf(buf, "%s ; \n", "return");
           	}
        }

   //    if(buf!=NULL)
   // printf("%s\n", buf);
  //  else    printf("NULL\n");

	return buf;
}

//output a declaration of the return variable
void outputReturnDecl() {
	assert(currExecContext);
	outputReturnDeclInContext(currExecContext);
	outputExceptionHandlerVars(currExecContext);


	outputDefnBgnLn();
}

//output a declaration of the return variable
void outputReturnDeclInContext(struct Context * c ) {
        char plainType[ONELINE];
	char oneDecl[ONELINE];
	char rtTemplate[ONELINE];

	char * t;
	plainType[0] = '\0';
	assert(c->rtType);
        if(needReturn(c->rtType)) {
		char srcLineBuf[ONELINE];
	   	/* remove the "const" and "volatile" type qualifier */
	   	getPlainType(c->rtType, plainType);
           	s(genSrcLineInfo(srcLineBuf));
	   	if(plainType[0] == '\0') {
			t = c->rtType ;
	   	}else {
			t = plainType;
	   	}

		buildParamDecl(oneDecl, t, RETVALUE);
		s(oneDecl); s(";\n");
        }
}

void outputReturnAssign() {
	outputReturnAssignInContext(currExecContext);
}

//output a declaration of the return variable
void outputReturnAssignInContext(struct Context * c) {
        assert(c->rtType);
        if(needReturn(c->rtType)) {
            char srcLineBuf[ONELINE];
            s(genSrcLineInfo(srcLineBuf));
	   s(RETVALUE); s(" = ");
        }
}

//output exception handling variables
void outputExceptionHandlerVars(struct Context * c) {
	/* there are matched exception handlers */
	if(c->numOfCH) {
             	char tmp[ONELINE];
             	int i;
		s("int "); s(TRY_EXCEP_MASK); s(" = 0; \n");
		for(i = 1; i <= c->numOfCH; i++) {
			sprintf(tmp, "\n int %s_%d = 0; \n jmp_buf %s_%d ; \n struct __UTAC__EXCEPTION %s_%d = { & %s_%d , 0, 0 }; \n ", TRY_RETVAR, i , TRY_JMPBUF, i , TRY_EXCEPV, i , TRY_JMPBUF, i  );
			s(tmp);
		}
        }
}


//ouput a declaration for the advice function
char * output_one_advice_declaration(struct advice * ad, boolean outputNow, char *buf) {
	char funcDeclBuf[DECLARATION];
	int size ;
	char * pos;
	assert(ad);
	pos = funcDeclBuf;
	funcDeclBuf[0] = '\0';

	switch(ad->type) {
                case ADBEFORECFLOW:
                case ADAFTERCFLOW:
                        sprintf(pos, "int %s ( int , int)", ad->name);
                        break;
                case ADARGSCFLOW:
                        sprintf(pos, "void * %s (int, int, void *)", ad->name);
                        break;
                case ADBEFORETRY:
                {
                        struct advice * catchAd = (struct advice *)(ad->name);
                        assert(catchAd);
			pos += sprintf(pos, "void %s (int %s ) ",
						catchAd->name,
						(catchAd->malInfo & NEEDEXTRAP) ? ", struct JoinPoint * " : "");
                        break;
                }
		case ADAFTERTRY:
                        break;
                default:
                {
                        int malinfo = 0;
                        if(!(ad->malInfo & NEEDEXTRAP)) {
                                malinfo |= EMITVOIDFORNOPARAM;
                        }

                        genFuncDecl(ad->name, ad->rtType, &(ad->p->p), pos, malinfo);

			if(ad->malInfo & NEEDEXTRAP) {
				size = strlen(funcDeclBuf);
				assert(funcDeclBuf[size-1] == ')');
				sprintf(funcDeclBuf + size - 1, "%s %s", ad->p == NULL ? " " : "," , "struct JoinPoint * )" );
			}
		}
	}


	size = strlen(funcDeclBuf);

	assert(size + 1 < DECLARATION);

	//add ";" in the end
	funcDeclBuf[size] = ';';
	funcDeclBuf[++size] = '\n';

	append_cflow_func(ad, funcDeclBuf + size + 1, &size , DECLARATION - 1);

	funcDeclBuf[size+1] = '\0';


	if(outputNow) {
		s(funcDeclBuf); s("\n");
	}else if(buf) {
		buf += sprintf(buf, "%s\n", funcDeclBuf);
	}else {
		//save it in buffer, and output later
		long line = getCurrDefnLineNum();
		logGenDecls(funcDeclBuf, line);
	}

	return buf;
}



void output_cflow_function() {
	struct CFlowRecord * head = cflowTable;

	s("\n"); s(UTAC_CFLOW_FUNCS_BEGIN); s("\n");

	while(head && head->notPrinted) {
		output_one_cflow_func(head);
		head = head->next;
	}

	s("\n"); s(UTAC_CFLOW_FUNCS_END); s("\n");

}


char * output_one_variable_in_cflow_context(struct adviceParam * ap, int index) {
	char nameBuf[NAMELEN];
	char * varName = NULL;
	s("static ");
	if(isThreadSafe()) s (" __thread ");
	s(ap->p.type); s(" ");

	sprintf(nameBuf, "%s_%d", PARAM_NAME , index);
	varName = (char *)malloc(strlen(nameBuf) + 1);
	sprintf(varName, "%s", nameBuf);

	s(varName); s(";\n");

	return varName;
}

//for each function to handle the context exposure in cflow, its prototype is like:
/*
void * func_name (int action, int index, void * p) {
	 action ==0 --> set value ; action == 1 --> get value
	 a bunch of static variables to record the information , say a1, a2
	 switch (index) {
		case 0 :
			if(action == 0) {
				a1 = (*)(a1's type *)(p);
			}else {
				return (void *)(&a1);
			}
			break;
		...
	*/
void output_one_cflow_context_func(struct ArgsInCflow * arg) {
	struct pointcutParam * p = arg->pc->info.mInfo->p;
	char func_buf[ONEFUNCDEFINITION];
	char * buf = func_buf;
	char * oneName = NULL;
	int indexInsideFunc = 0;
	s(" void * "); s(arg->funcName); s(" (int action, int index, void * p) { \n");
	buf += sprintf(buf, "%s ", "switch (index) { \n");
	while(p != NULL) {
		if(p->ap != NULL) {
			oneName = output_one_variable_in_cflow_context(p->ap, indexInsideFunc);
			buf += sprintf(buf,
				" case %d : if(action == %d ) { \n", indexInsideFunc, CFLOWSETCONTEXT);
			buf += sprintf(buf, " %s = *(%s *)(p); \n",
				oneName, p->ap->p.type );
			buf += sprintf(buf, " } else { return (void *)(&%s); } \n break ; \n",
				oneName);
			MYFREE(oneName);
			indexInsideFunc++;
		}
		p = p->next;
	}

	buf += sprintf(buf, " %s \n } \n", " } ");
	s(func_buf);
}

//each cflow handling function is like:
/* int __utac_cflow_x(int x) {
	static int level = 0;
	if(x == 1) level ++;
	if(x == 2) level --;
	return level;
   }
*/

//todo: consider using a macro
void output_one_cflow_func(struct CFlowRecord * rec) {
    struct ArgsInCflow * args = rec->argsPCs;

    s(" int "); s(rec->pc->cflowFuncName); s(" (int x, int y) { \n ");
    s("static ");
    if(isThreadSafe()) s (" __thread ");
    s("int level = 0; \n switch(x) { \n case 1: level ++; break ; \n case 2: level -- ; break; \n case 3: break; \n case 4: level = y ; \n } \n return level ; \n } \n");
    rec->notPrinted = FALSE;

    while(args != NULL) {
	output_one_cflow_context_func(args);
	args = args->next;
    }

}

void outputTypeInsertionMarker(char * names) {
        char namesBuffer[GENDECLSIZE];
	if(names == NULL) return;
	sprintf(namesBuffer, "%s", names);
	outputTypeInsertionMarkers(namesBuffer);
	MYFREE(names);
}

/* todo: should handle
	typedef struct {
		int a;
	} MYABC;

   currently, I skip this kind of match */

void outputTypeInsertionMarkerInAC(char * str) {
	if(str) {
		s(ACTYPEINSERTBEGIN);
		s(str);
		s(ACTYPEINSERTEND);
		s("\n");
		MYFREE(str);
	}
}

void outputTypeInsertionMarkers(char * buf) {
	char * restName;
        if(strlen(buf) == 0) return;
        restName = strstr(buf, "\n");
        if(restName) {
                *restName='\0';
        }
        if(restName) {
                outputTypeInsertionMarkers(restName + 1);
        }
        output_one_marker(buf);
}


void output_one_marker(char * name) {
        char * separater = strstr(name, "#");
        assert(separater);
        *separater = '\0';      //the left side is the file name, the right side is the function name
        s(TYPEINSERTIONBEGIN); s(name); s("\n");
        s(separater + 1) ; s("\n");

}

void outputJoinPointStrDecl() {
	s("\n"); s(JOINPOINT_STR); s("\n");

}

/* there are 2 cases we need to add extra arguments:
        1. callp:
                add the name of the function pointer

        2. preturn:
                add the address of the longjmp buf
*/
void output_extra_args(int separator) {
        if(curr_call_fp_name || curr_call_has_preturn) {
                char buf[ONELINE];
                sprintf(buf, "%s %s %s %s %s ",
                        separator == 1 ? "," : "" ,
                        curr_call_fp_name ? curr_call_fp_name : "" ,
                        (curr_call_fp_name && curr_call_has_preturn==TRUE) ? "," : "" ,
                        curr_call_has_preturn ? "(void *) & " : "",
                        curr_call_has_preturn ? UTAC_EXCEP_VAR : "");
                s(buf);
                curr_call_fp_name = NULL;
                curr_call_has_preturn=FALSE;
        }
}


/**************************/
/* generate */
void genCallBody(struct CallContext * callContext) {
   	struct FuncInfo *tmp;
   	struct Param *pa;
   	long inserted = 0;
	char * fileName;
	boolean needRetValue = FALSE;	//whether the call needs a return value

	char declBuffer[GENDECLSIZE];	//a buffer for constructed declaration
        char declBuffer2[GENDECLSIZE];
	char callBuffer[GENDECLSIZE];   //a buffer for generated function call

	/* insert declarations of all advice functions which would be called inside the new function */
	struct AdviceQueue * ptr ;
	ptr = callContext->context.before_advices;
   	while(ptr != NULL){
      		output_one_advice_declaration(ptr->data, TRUE, NULL);
		ptr = ptr->next;
	}

	ptr = callContext->context.after_advices;
        while(ptr != NULL){
                output_one_advice_declaration(ptr->data, TRUE, NULL);
                ptr = ptr->next;
        }

	ptr = callContext->context.around_advices;
        while(ptr != NULL){
                output_one_advice_declaration(ptr->data, TRUE, NULL);
                ptr = ptr->next;
        }

	/* add a declaration for the original function if this is a real function call, not a
call through function pointer */
	if(callContext->context.type == CALL) {
		struct Context * c = (struct Context *)callContext;
     		struct FuncInfo * func = searchFunc(funcTable, c->funcName);
		if(func && (func->malInfo & HASKNRDECL) == 0) {
			genFuncDecl(c->funcName, c->rtType, c->p, declBuffer, c->malInfo);
			s(declBuffer);
			s(" ; \n");
		}
	}

	buildGenFuncDecl(declBuffer, callContext);

	//add ";" in the end
	sprintf(declBuffer2, "%s ; ", declBuffer);
	logGenDecls(declBuffer2, getCurrDefnLineNum());

	//output the "# " for debugging purpose
	{ char srcLineBuf[ONELINE];
        s(genSrcLineInfo(srcLineBuf));
	}
	s(declBuffer);
	s("{\n");

    	outputReturnDeclInContext(&(callContext->context));

	outputExceptionHandlerVars(&(callContext->context));

	insert_advice(BEFORE, (char*)(callContext), &inserted);

	insert_advice(AROUND, (char*)(callContext), &inserted);

        if(!inserted) {
	  outputReturnAssignInContext(&(callContext->context));
          switch(callContext->context.type) {
		case CALLP:
			{
	  		char defFP[NAMELEN];
			sprintf(defFP, "(*%s)", FP_PARAM_NAME);
			genFuncCall(defFP, callContext->context.p, callBuffer);
			}
			break;
		case SETPC:
			{
                        assert(callContext->context.p && callContext->context.p->next && callContext->context.p->next->next == NULL);
                        sprintf(callBuffer, "(*%s = %s) ; \n", callContext->context.p->id, callContext->context.p->next->id);
                        }
                        break;
		case GETPC:
			{
			assert(callContext->context.p && callContext->context.p->next == NULL);
			sprintf(callBuffer, "%s ; \n", callContext->context.p->id);
			}
			break;
		case CALL:
			genFuncCall(callContext->context.funcName, callContext->context.p, callBuffer);
	  		break;
		default:
			assert(0);
	 }
	 s(callBuffer);
	}


	insert_advice(AFTER, (char*)(callContext), &inserted);

	outputReturnInContext(&(callContext->context), 0, NULL);

	s("}\n");
}

void genNewProceedCall() {
        struct advice * ad;
        ad = getCurrAdvice();
        if(ad->type != AROUND) {
                ERR(invalid_proceed, );
        }
        if(needReturn(ad->rtType)) {
                s("(** ("); s(ad->rtType); s(" **)");
        }

        s("("); s(JOINPOINT_VAR); s("->fp("); s(JOINPOINT_VAR); s("))");

        if(needReturn(ad->rtType)) {
                s(" ) ");
        }
        setFoundAdKeyword(PROCEED);
}

void genNewPreturnCall() {
	s("\n{ jmp_buf * p; \n struct __UTAC__EXCEPTION * excep = (struct __UTAC__EXCEPTION *)");
	s(JMPENV ); s(" ; \n if(excep->pops) "); s(ERRSTACKMGT_NAME); s(" (0 , "); i(ERRSTACK_POP); s(", excep->pops);\n");
	s("p = (jmp_buf *)excep->jumpbuf; \n ; excep->prtValue = (unsigned long long int)( ");
	setFoundAdKeyword(PRETURN);
}

void enclosePreturnCall() {
	s(");"); /* close the original paramter to preturn */
	s("longjmp(*p, 1); }");	/* add a lonjmp manually */
}

void genNewThrowCall() {
        s("\n{ jmp_buf * p; \n struct __UTAC__EXCEPTION * excep = (struct __UTAC__EXCEPTION *)");
        s(ERRSTACKMGT_NAME);
        s("(0, "); i(ERRSTACK_POP); s(", "); i(1); s(" ) ; \n p = (jmp_buf*)(excep->jumpbuf); \n");
        s("longjmp(*p, ");

        setFoundAdKeyword(THROW);
}


char * genFuncDecl(char *fName, char * retType, struct Param * p, char * buf, int malInfo) {
	char * oldAdd = buf;
	char pBuf[ONELINE];
	char funcDecl[ONELINE];
	char * pFuncDecl = funcDecl;

	pFuncDecl += sprintf(pFuncDecl , "%s (", fName);
        if(p == NULL) {
		if(malInfo & EMITVOIDFORNOPARAM)
			pFuncDecl += sprintf(pFuncDecl, "%s", "void");
	}else {
		while(p != NULL){
			buildParamDecl(pBuf, p->type, p->id);
           		pFuncDecl += sprintf(pFuncDecl, "%s %s", pBuf, (p->next == NULL? " ": ","));
                	p = p->next;
        	}
	}
        pFuncDecl += sprintf(pFuncDecl, "%s", ")");

	buf += sprintf(buf, "%s ", malInfo & ISSTATIC ? "static " : "" );

	if(needReturn(retType)) {
		buildParamDecl(pBuf, retType, funcDecl);
		buf += sprintf(buf, " %s", pBuf );
	}else {
		buf += sprintf(buf, " %s %s", "void", funcDecl );
	}

	return oldAdd;
}

char * genFuncCall(char * fName, struct Param * p, char * buf) {
	buf += sprintf(buf, "%s ( ", fName);
	while(p != NULL) {
                buf += sprintf(buf, "%s ", p->id);
                if(p->next != NULL){
                   buf += sprintf(buf, "%s ", ",");
                }
                p = p->next;
        }
        buf += sprintf(buf, "%s \n", ") ; ");
	return buf;
}

char * genTransWrapperFunction(struct AdviceQueue *aQ, struct Context * c) {
	int index = -1;
	struct adviceParam * param;
	char buf[ONEFUNCDEFINITION];
	char *bufPtr = &(buf[0]);
	char wrapperFuncName[NAMELEN];
	char wrapperFuncNameNext[NAMELEN];
	char * newDecl;
	char prtType[ONELINE];
        struct advice *ad = aQ->data;

	param = ad->p;

	assert(aQ);
	assert(ad->type == AROUND);

	//now comes the wrapper function
	get_wrapper_func_name(c->funcName, c->type, wrapperFuncName);
	wrapper_counter ++;
       	get_wrapper_func_name(c->funcName, c->type, wrapperFuncNameNext);

	bufPtr += sprintf(bufPtr, "%s%s%s \n", "void ** ", wrapperFuncName, " (struct JoinPoint * this);  \n");

	bufPtr = output_one_advice_declaration(ad, FALSE, bufPtr);

       	bufPtr += sprintf(bufPtr, "%s%s%s \n", "void ** ", wrapperFuncName, " (struct JoinPoint * this) { \n");

	if(needReturnValue(c)) {
		getPlainType(c->rtType, prtType);
       		bufPtr += sprintf(bufPtr, "%s %s %s %s %s \n", prtType, "**", " rp = ( ",  prtType, "**)(this->retValue);");
                bufPtr += sprintf(bufPtr, "%s %s \n", prtType, " temp ; ");
	}

	bufPtr += sprintf(bufPtr, "%s = %s %s %s ; \n", "this->fp", "&(", wrapperFuncNameNext, ")" );
	if(aQ->emitCond) {
        	bufPtr += sprintf(bufPtr, "if( %s ) { \n", ad->cflowCondition);
	}

        if(needReturnValue(c)) {
        	bufPtr += sprintf(bufPtr, "%s = ", "temp");
	}

       	bufPtr += sprintf(bufPtr, "%s%s", ad->name, "(");

        while(param) {
       		if(param->indexInContext->argIndex == 0) {
                	index = 0;
        	}else {
                	index = findArgIndexInContext(param->indexInContext, c)->argIndex;
        	}
        	assert(index >= 0);

		if(index == 0) {
			assert(param->matchAddress == FALSE);
			bufPtr += sprintf(bufPtr, "%s ", RETVALUE);
		}else {
			bufPtr += sprintf(bufPtr, " %s ( %s %s) %s %d %s ", param->matchAddress ? "" : "*", param->p.type, param->matchAddress ? "" : "*", "(this->args[", --index, "])");
		}

		if(param->next) bufPtr += sprintf(bufPtr, "%s ", ", ");
                param = param->next;
	}

	if(ad->malInfo & NEEDEXTRAP) {
       		//need to add an extra argument for the join point
                bufPtr += sprintf(bufPtr, "%s %s ", ad->p ? "," : "", JOINPOINT_VAR);
      	}

	bufPtr += sprintf(bufPtr, " %s ", "); \n");

	//emit the "else" part
	if(aQ->emitCond) {
		bufPtr += sprintf(bufPtr, "%s \n", " } else {" );

		if(needReturnValue(c)) {
			bufPtr += sprintf(bufPtr, "%s = (** (%s **)", "temp", prtType);
		}

		bufPtr += sprintf(bufPtr, "%s %s %s %s ", wrapperFuncNameNext, "(", JOINPOINT_VAR, ")");
		if(needReturnValue(c)) {
			bufPtr += sprintf(bufPtr, "%s", ")");
		}

		bufPtr += sprintf(bufPtr, "%s", "; \n } \n");

	}

	if(needReturnValue(c)) {
                bufPtr += sprintf(bufPtr, "%s \n", "** rp = temp ; ");
        }

	bufPtr += sprintf(bufPtr, "%s \n", "return this->retValue;");

	bufPtr += sprintf(bufPtr, " %s \n", " } ");

	newDecl = (char *)malloc(strlen(buf) + 1);
	sprintf(newDecl, "%s", buf);

	return newDecl;
}

char * genSrcLineInfo(char * buf) {
       char * fileName;
       if(needLine()) {
		get_target_file_name(&fileName);
       		sprintf(buf, "\n%s # %d \"%s\"\n", UTACSRCLINE, get_curr_line_no() + 3, fileName);
	}else {
		sprintf(buf, "%s", "\n");
	}
       return buf;
}


/***************************/
/* build */
/* a function pointer type is like:

   fp:[return type][(parameter 1)(parameter2)]
*/

/* return all the string inside the first pair of "()".
and *ptr will point to the character after the ")".
*/
char * getOneParam(char ** ptr) {
	int level = 0;
	int i;
	char buf[ONELINE];
	char * bufP = buf;
	char * oneP;
	char * tP = *ptr;

	assert(tP && *tP == '(');

	tP ++;

	while(1) {
		if(*tP == ')' && level == 0) {
			break;
		}
		if(*tP == '(') level ++;
		if(*tP == ')') level --;

		*bufP ++ = *tP ++;
	}

	*bufP = '\0';

	oneP = (char *)malloc(strlen(buf) + 1);
	sprintf(oneP, "%s", buf);

	*ptr = (++tP);
	return oneP;
}

/* assume buf is a preallocated buffer */
char * buildParamDecl(char * buf, char * type, char * id) {
	char * ptr = type;
	char * bPtr = buf;
	char * oneParam = NULL;
	if(strstr(type, "fp:[") == type) {
		/* this is a function pointer */
		ptr += 4;

		while(*ptr != ']') {
			/* store the return type */
			*bPtr++ = *ptr++;
		}

		bPtr += sprintf(bPtr, "(*%s)(", id == NULL ? "" : id);
		ptr ++;
		assert(*ptr == '[');
		ptr ++;

		while(1) {
			assert(*ptr == ']' || *ptr == '(');
			if(*ptr == ']') {
				/* no parameter type for this function pointer */
				bPtr += sprintf(bPtr, "%s", ")");
				break;
			}else {
				oneParam = getOneParam(&ptr);
				bPtr = buildParamDecl(bPtr, oneParam, NULL);
				MYFREE(oneParam);
				if(*ptr != ']') {
					bPtr += sprintf(bPtr, "%s", ",");
				}
			}
		}
	}else {
		bPtr += sprintf(buf, "%s %s", type, id == NULL ? "" : id);
	}

	return bPtr;
}
void buildGenFuncDecl(char * buf, struct CallContext * c) {
        char * ptr;
	struct Param *pa;
	char pBuf[ONELINE];
	char funcBuf[ONELINE];

	ptr = funcBuf;

	boolean needExtraArgu = FALSE;

	switch(c->context.type) {
		case SETPC:
		case GETPC:
			{
				char * tmp = strstr(c->newFuncName, "(");
				assert(tmp);
				*tmp = '\0';
				ptr += sprintf(ptr, " %s (", c->newFuncName);
				*tmp = '(';
			}
			break;
		default:
			ptr += sprintf(ptr, " %s (", c->newFuncName);
        }

	pa = c->context.p;

	if(c->context.type == CALLP || (c->context.malInfo & HASPRETURN)) {
		/* CALLP needs an argument to pass a function pointer */
		/* PRETURN needs an argument to pass an address of a jmp_buf */
		needExtraArgu = TRUE;
	}

	if(pa==NULL && needExtraArgu == FALSE) {
		ptr += sprintf(ptr, "%s", "void");
	}else {
		while(pa != NULL){
           		buildParamDecl(pBuf, pa->type, pa->id);
	   		ptr += sprintf(ptr, "%s %s", pBuf, (pa->next == NULL? " ": ","));
           		pa = pa->next;
        	}
        	if(needExtraArgu) {
                	if(c->context.p != NULL)
                        	ptr += sprintf(ptr, "%s", ",");
                	if(c->context.type == CALLP) {
                        	build_func_pointer_type_decl(pBuf, c);
                        	ptr += sprintf(ptr, "%s", pBuf);
                        	if(c->context.malInfo & HASPRETURN) {
                                	ptr += sprintf(ptr, "%s", ",");
                        	}
                	}

                	if(c->context.malInfo & HASPRETURN) {
                        	ptr += sprintf(ptr, "void * %s ", UTAC_EXCEP_PARAM_NAME);
                	}
        	}
	}
	ptr += sprintf(ptr, "%s ", ")");


	buildParamDecl(pBuf, c->context.rtType, funcBuf);

        sprintf(buf, "static inline %s", pBuf);

}

/* create a parameter declaration, which is a function pointer to the function specified by
the c->context */
void build_func_pointer_type_decl(char * buf, struct CallContext * c) {
	char * ptr = buf;
        struct Param *pa;
        char pBuf[ONELINE];

        ptr += sprintf(ptr, "%s (* %s) (", c->context.rtType, FP_PARAM_NAME);
        pa = c->context.p;
        while(pa != NULL){
           buildParamDecl(pBuf, pa->type, pa->id);
           ptr += sprintf(ptr, "%s %s", pBuf, (pa->next == NULL? " ": ","));
           pa = pa->next;
        }
        ptr += sprintf(ptr, "%s ", ")");
}

void buildJoinPointContext(long srcinfo, char * inFuncName, char * funcName, char * type, char ** context) {
	struct FuncInfo *tmpFunc = NULL;
	struct Context * c;
	PointcutType pType = text2PointcutType(type);

	assert(pType == CALL || pType == EXECUTION || pType == INTYPE || pType == CALLP || pType == GETPC || pType == SETPC);

        switch(pType) {
		case INTYPE :
			break;
		case CALLP:
			tmpFunc = searchFP(fpTable, funcName, inFuncName);
                	if(tmpFunc == NULL) {
                        	*context = NULL;
                        	return;
                	}
			break;
		case SETPC:
		case GETPC:
			tmpFunc = searchFunc(varTable, funcName);
                        if(tmpFunc == NULL || (tmpFunc->malInfo & ISSHADOWED)) {
 				/* either no such global symbol or it is shadowed by a local one */
                                *context = NULL;
                                return;
                        }
			break;
		case CALL:
		case EXECUTION:
                	tmpFunc = searchFunc(funcTable, funcName);
                	if(pType == EXECUTION) assert(tmpFunc);

                	if(tmpFunc == NULL) {
                        	// for a function call, can not find function's declaration from the symbol table
                        	*context = NULL;
                        	return;
                	}
			break;
		default:
			assert(0);
	}

	if(pType == CALL || pType == CALLP || pType == GETPC || pType == SETPC) {
		c = (struct Context*)(malloc(sizeof(struct CallContext)));
		((struct CallContext*)c)->newFuncName = NULL;
		((struct CallContext*)c)->next = NULL;
	}else {
	 	c = (struct Context *)(malloc(sizeof(struct Context)));
	}

	c->insideFile = srcinfo;
	c->insideFunc = inFuncName;
	c->funcName = funcName;
	c->type = pType;
	switch(pType) {
		case INTYPE:
                	c->rtType = NULL;
                	c->p = NULL;
        		c->malInfo = 0;
			break;
		case SETPC:
			{
			struct Param * p1, *p2;
			c->rtType = tmpFunc->rtType;
			c->malInfo = tmpFunc->malInfo;
			/* for set() join point, it actually has 2 parameter, */
			/* for example,
				int a;
				a = 3;

			the set() join point for "a" has parameter (int *, int);
			*/
                        p1 = copy_parameters(tmpFunc->p);
			p2 = copy_parameters(tmpFunc->p);

			addStarToType(&(p1->type));

			/* the name of p1 and p2 are same because they are copied from the same parameter, need to change name to avoid conflict */
			assert(p2->id[strlen(p2->id)-1] == '0');
			p2->id[strlen(p2->id)-1] = '1';

			p1->next = p2;
			c->p = p1;
			}
			break;
		default:
                	c->rtType = tmpFunc->rtType;
                	c->p = copy_parameters(tmpFunc->p);
			c->malInfo = tmpFunc->malInfo;
	}

	c->numOfCH = 0;
	c->before_advices = NULL;
        c->after_advices = NULL;
        c->around_advices = NULL;

	*context = (char *)(c);

}

void buildType(long type, char * tag, char ** name) {
        char nameBuf[NAMELEN];

        setComplexTypeName(type, nameBuf, tag);

        *name = (char *)malloc(strlen(nameBuf) + 1);

        sprintf(*name, "%s", nameBuf);
}


/**************************/
/* match */
/* mwgong todo: consider merge following 3 matching functions */
//match the context of a call join point against a list of pointcut
void match_call_join_point(char * context, char * realName, char **newFuncName) {
        struct CallContext * c = NULL;
	long matched = 0;
	char * tmp;
	char * baseFileName;

	c = (struct CallContext *)(context);
	if(c == NULL) {
          	*newFuncName = realName;
          	free_call_context(c);
		return;
   	}

	match_join_point( (char *)(c), &matched);

	if(matched) {
      		get_target_file_base_name(&baseFileName);
		tmp = (char *)malloc(strlen(c->context.funcName) + strlen(baseFileName) + 4 + 5); //4 - for digits, 4 - for "_", 1 - for '\0'
		sprintf(tmp, "%s__%s__%d", c->context.funcName, baseFileName, call_counter++);
      		*newFuncName = tmp;
                c->newFuncName = tmp;     // the generated function name
		addMatchedCallContexts(&(matchedCallContexts), c);
		if(c->context.type == CALLP) {
			curr_call_fp_name = c->context.funcName;
		}
	}else {
		*newFuncName = realName;
		free_call_context(c);
	}
}

void match_get_join_point(char * context, char * realName, char **newFuncName) {
        struct CallContext * c = NULL;
        long matched = 0;
        char * tmp;
        char * baseFileName;
        c = (struct CallContext *)(context);
	if(c == NULL) {
                *newFuncName = realName;
                free_call_context(c);
                return;
        }

        match_join_point( (char *)(c), &matched);

	if(matched) {
		get_target_file_base_name(&baseFileName);
		tmp = (char *)malloc(	2 * strlen(c->context.funcName) +
					strlen(baseFileName) +
					4 /* for digits */ +
					4 /* for 4 '_'  */ +
					2 /* for () */ +
					1 /* for '\0' */ +
					(curr_call_has_preturn == FALSE ?
						2 /* for 2 empty spaces */
					  : (10 /* for ,(void *)& */ + strlen(UTAC_EXCEP_VAR))));

		sprintf(tmp, "%s__%s__%d(%s%s%s)", c->context.funcName, baseFileName, call_counter++, c->context.funcName, curr_call_has_preturn == FALSE ? " " : ",(void *)&",
			curr_call_has_preturn == FALSE ? " " : UTAC_EXCEP_VAR );

		*newFuncName = tmp;
                c->newFuncName = tmp;     // the generated function name
                addMatchedCallContexts(&(matchedCallContexts), c);
        	curr_call_has_preturn = FALSE;
	}else {
                *newFuncName = realName;
                free_call_context(c);
        }
}

int matched_a_set_pc = 0;
void incrMatchedSetPC() {
	matched_a_set_pc ++;
}

void decrMatchedSetPC() {
	matched_a_set_pc --;
}

void hasMatchedSetPC(long *flag) {
	*flag = (matched_a_set_pc ? 1 : 0);
}

void match_set_join_point(char * context, char * realName, char **newFuncName) {
        struct CallContext * c = NULL;
        long matched = 0;
        char * tmp;
        char * baseFileName;
        c = (struct CallContext *)(context);
        if(c == NULL) {
                *newFuncName = realName;
                free_call_context(c);
                return;
        }

        match_join_point( (char *)(c), &matched);

	if(matched) {
                get_target_file_base_name(&baseFileName);
                tmp = (char *)malloc(   2 * strlen(c->context.funcName) +
                                        strlen(baseFileName) +
                                        4 /* for digits */ +
                                        4 /* for 4 '_'  */ +
                                        3 /* for (&, */ +
                                        1 /* for '\0' */ );
		sprintf(tmp, "%s__%s__%d(&%s,", c->context.funcName, baseFileName, call_counter++, c->context.funcName);
                *newFuncName = tmp;
                c->newFuncName = tmp;     // the generated function name
                addMatchedCallContexts(&(matchedCallContexts), c);
	   	incrMatchedSetPC();
	}else {
                *newFuncName = realName;
                free_call_context(c);
        }
}



boolean match_pointcut_type(PointcutType pattern, PointcutType realJoinPoint) {
	assert(realJoinPoint == EXECUTION || realJoinPoint == CALL || realJoinPoint == CALLP
		|| realJoinPoint == INTYPE || realJoinPoint == GETPC || realJoinPoint == SETPC);
	assert(pattern == EXECUTION || pattern == CALL || pattern == ARGS || pattern == RESULT || pattern == INTYPE || pattern == CALLP || pattern == GETPC || pattern == SETPC);

	if( (pattern == ARGS || pattern == RESULT) &&
	    (realJoinPoint == EXECUTION || realJoinPoint == CALL || realJoinPoint == CALLP || realJoinPoint == GETPC || realJoinPoint == SETPC)) return TRUE;

	return pattern == realJoinPoint;
}

//match the context of a join point against a list of pointcut
void match_join_point(char * context, long * findAMatch) {
        struct Context * c = (struct Context *)(context);
        struct Record *ptr = PointCutTable;
        struct CFlowRecord *cflowPtr = cflowTable;
	struct TryRecord *tryPtr = tryTable;
	struct advice *ad, *ad1, *ad2;
        char * condition = NULL;
	boolean matched = FALSE;

        //no context available or the context has variable argument list, just return
        if(c == NULL || (c->malInfo & HASELLIPSIS) || c->insideFunc == NULL ) {
		*findAMatch = FALSE;
		return;
	}

        while(ptr != NULL){
                if(ptr->type != NAMEDPC && ptr->type != INTYPE ) {
                        matched = match_pointcut_with_jp(ptr, c , &condition);
                        if(matched == TRUE || matched == UNKNOWN) {
                                ad = ptr->aList;
                                if(matched == UNKNOWN) {
					MYFREE(ad->cflowCondition);
					ad->cflowCondition = condition;
				}

				if(ad != NULL){
                                        newEnqueueAdvice(ad->type, c, ad, matched == TRUE ? FALSE : TRUE);
                                        if(ad->malInfo & HASPRETURN) {
                                                c->malInfo |= HASPRETURN;
                                                needSetjmp = TRUE;
                                                if(c->type == CALL || c->type == GETPC || c->type == SETPC) {
							curr_call_has_preturn = TRUE;
							assert(currExecContext);
							currExecContext->malInfo |= HASPRETURN;
						}
                                        }

					if(ad->malInfo & HASTHROW) {
                                                c->malInfo |= HASTHROW;
						needSetjmp = TRUE;
                                        }

					*findAMatch = TRUE;
                                }
			}
                }
                ptr = ptr->next;
        }

	while(cflowPtr != NULL) {
		matched = match_pointcut_with_jp(cflowPtr->pc, c, NULL);
		if(matched == TRUE) {
			ad1 = (struct advice*)(malloc(sizeof(struct advice)));
			ad2 = (struct advice*)(malloc(sizeof(struct advice)));
			ad1->name = copy_chars(cflowPtr->pc->cflowFuncName);
			ad2->name = copy_chars(cflowPtr->pc->cflowFuncName);
			ad1->rtType = ad2->rtType = NULL;
			ad1->type = ADBEFORECFLOW;
  			ad2->type = ADAFTERCFLOW;
			ad1->p = ad2->p = NULL;
			ad1->malInfo = ad2->malInfo = 0;
  			ad1->acFileBaseName = ad2->acFileBaseName = NULL;
  			ad1->cflowCondition = ad2->cflowCondition = NULL;
			newEnqueueAdvice(BEFORE, c, ad1, FALSE);
			appendAdvice(AFTER, c, ad2);
			*findAMatch = TRUE;
			/* in case there is args() inside cflow, the context should be exposed */

			insert_advice_for_args_in_cflow(cflowPtr->argsPCs, c);

		}
		cflowPtr = cflowPtr->next;
	}


	/* insert the advice call for the try pointcut */
        while(tryPtr != NULL) {
                matched = match_pointcut_with_jp(tryPtr->pc, c, &condition);
                if(matched == TRUE || matched == UNKNOWN) {
                        ad1 = (struct advice*)(malloc(sizeof(struct advice)));
                        ad2 = (struct advice*)(malloc(sizeof(struct advice)));
                        ad1->name = (char *)tryPtr->ad;
                        ad2->name = NULL;
                        ad1->type = ADBEFORETRY;
                        ad2->type = ADAFTERTRY;
                        ad1->p = ad2->p = NULL;
                        ad1->acFileBaseName = ad2->acFileBaseName = NULL;
                        ad1->cflowCondition = (matched == UNKNOWN ? condition : NULL);
			ad2->cflowCondition = (matched == UNKNOWN ? copy_chars(condition) : NULL) ;
                        newEnqueueAdvice(BEFORE, c, ad1, FALSE);
                        appendAdvice(AFTER, c, ad2);
                        *findAMatch = TRUE;
                        c->malInfo |= HASTRY;
			needSetjmp = TRUE;
			c->numOfCH ++ ;

			/* use ad1's rtType field to record an index of current catch handler */ 			ad1->rtType = (char *)c->numOfCH;

			ad2->rtType = NULL;

			ad1->malInfo = tryPtr->ad->malInfo;
			if(ad1->malInfo & HASPRETURN) {
                               c->malInfo |= HASPRETURN;
                               if(c->type == CALL || c->type == GETPC || c->type == SETPC) {
                                        curr_call_has_preturn = TRUE;
                                        assert(currExecContext);
                                        currExecContext->malInfo |= HASPRETURN;
                               }
                        }

			ad2->malInfo = 0;



		}
                tryPtr = tryPtr->next;
        }

}


void match_intype_join_point(char * context , char ** result) {
        struct Context * c = (struct Context *)(context);
        struct Record *ptr = PointCutTable;
        char adviceBuf[DECLARATION];
        char * bufPtr;
        //no context available, just return
        if(c == NULL) return;

        assert(c->type == INTYPE);

        adviceBuf[0] = '\0';
        bufPtr = &(adviceBuf[0]);

        while(ptr != NULL){
		if(match_pointcut_with_jp(ptr, c, NULL)) {
			bufPtr += sprintf(bufPtr, "%s#%s\n", ptr->aList->acFileBaseName, ptr->aList->name);
		}

                ptr = ptr->next;
        }

	if(adviceBuf[0] == '\0') {
                *result = NULL;
        }else {
                *result = (char *)malloc(strlen(adviceBuf) + 1);
                sprintf(*result, "%s", adviceBuf);
        }

	free_intype_context(c);
}

//the comparison result of cflow is unknown.

//for && operator:
//truth table
/*                      |  true           false          unknown
                 ------------------------------------------------
                 true   |  true            false         unknown
                 false  |  false           false         false
                 unknown|  unknown         false         unknown
                        |
*/
//for || operator:
//truth table
/*                      |  true           false          unknown
                 ------------------------------------------------
                 true   |  true            true          true
                 false  |  true            false         unknown
                 unknown|  true            unknown       unknown
                        |
*/

//for ! operator:
//truth table
/*                      |  true           false          unknown
                 ------------------------------------------------
                           false           true          unknown
*/

boolean match_pointcut_with_jp(struct Record * pc, struct Context * context, char ** condition) {
      	boolean result = FALSE;
	struct matchInfo *info;
   	struct advice *ad;
	char * cond1 = NULL, * cond2 = NULL;

	assert(context->type == CALL || context->type == CALLP
		|| context->type == EXECUTION
		|| context->type == INTYPE
		|| context->type == GETPC
		|| context->type == SETPC);

	if(pc == NULL) {
		result = FALSE;
	}else
	if(pc->type == INFILE) {
		result = match_name(pc->info.inside,
				number_to_name(context->insideFile/ 1000000));
	}else
	if(pc->type == INFUNC) {
		result = match_name(pc->info.inside, context->insideFunc);
	}else
	if(pc->type == CALL || pc->type == EXECUTION
		|| pc->type == ARGS || pc->type == RESULT || pc->type == GETPC || pc->type == SETPC) {
	   //match join point with pointcut type
	   if(! match_pointcut_type(pc->type, context->type))  goto END;

	   info = pc->info.mInfo;
           //1. match function name
	   if(!match_name(info->funcName, context->funcName)) goto END;

	   //2. match return type
           if(!match_type(info->rtType, context->rtType)) goto END;

	   //3. match paramete type
	   if(pc->type != RESULT && !match_parameters(info->p, context->p , (pc->type == ARGS), 1 , context )) goto END;

	   result = TRUE;

	}else
        if(pc->type == COMP_AND) {
	   result = match_pointcut_with_jp(pc->info.childPCs[0], context, &cond1);
	   if(result == TRUE) {
		result = match_pointcut_with_jp(pc->info.childPCs[1], context, condition);
	   }else if(result == FALSE) {
	   }else {
		//result = UNKNOWN
		assert(cond1);
		result = match_pointcut_with_jp(pc->info.childPCs[1], context, &cond2);
		if(result != FALSE) {
			if(result == TRUE) {
				result = UNKNOWN;
				*condition = cond1;
			}else {
				//result = UNKNOWN
				assert(cond2);
				*condition = (char *)malloc(strlen(cond1) + strlen(cond2) + 7);
				sprintf(*condition, "(%s && %s)", (cond1), (cond2));
				MYFREE(cond1);
				MYFREE(cond2);
			}
		}else {
			MYFREE(cond1);
		}
	   }
        }else
	if(pc->type == COMP_OR) {
	   result = match_pointcut_with_jp(pc->info.childPCs[0], context, &cond1);
           if(result == FALSE) {
                result = match_pointcut_with_jp(pc->info.childPCs[1], context, condition);
           }else if(result == TRUE) {
	   }else {
		//result = UNKNOWN
		assert(cond1);
		result = match_pointcut_with_jp(pc->info.childPCs[1], context, &cond2);
		if(result != TRUE) {
			if(result == FALSE) {
				result = UNKNOWN;
				*condition = cond1;
			}else {
				//result = UNKNOWN
				assert(cond2);
				*condition = (char *)malloc(strlen(cond1) + strlen(cond2) + 7);
				sprintf(*condition, "(%s || %s)", (cond1), (cond2));
				MYFREE(cond1);
				MYFREE(cond2);
			}
		}else {
			MYFREE(cond1);
		}
	   }
	}else
        if(pc->type == COMP_NOT) {
           result = match_pointcut_with_jp(pc->info.childPC, context, &cond1);
           if(result == FALSE) {
                result = TRUE;
           }else if(result == TRUE) {
		result = FALSE;
	   }else {
		*condition = (char *)malloc(strlen(cond1) + 4);
		sprintf(*condition, "!(%s)", cond1);
		MYFREE(cond1);
	   }
        }else
	 if(pc->type == PCNAME) {
           struct Record * realPC = findPointcut(PointCutTable, pc->name);
           assert(realPC) ;     //make sure an named pointcut exists
           result = match_pointcut_with_jp(realPC, context, condition);
           if( ( result == TRUE || result == UNKNOWN ) && pc->info.mInfo->p != NULL) {
                struct pointcutParam * pp = pc->info.mInfo->p;
                struct adviceParam * ap = realPC->aList->p;
                struct argIndexInContext * argIndex = NULL;
		assert(realPC->aList && realPC->aList->p);
                //context exposure is required
                while(pp) {
			assert(ap);
                        //type has to match
                        assert(match_name(pp->ap->p.type, ap->p.type));
                        assert(pp->ap->indexInContext);

			argIndex = findArgIndexInContext(ap->indexInContext, context);
			assert(argIndex ||
                               (argIndex == NULL && ap->indexInContext->argIndex==0));

			if(argIndex) {
				createNewArgIndex(pp->ap, context, argIndex->argIndex);
                        }else {
				pp->ap->indexInContext->argIndex = 0;
			}

			pp->ap->matchAddress = ap->matchAddress;

                        ap = ap->next;
                        pp = pp->next;
                }
                //number of parameter has to match
                assert(ap == NULL);
           }
 	}else
        if(pc->type == NAMEDPC) {
           assert(pc->info.childPC && pc->aList);
           result = match_pointcut_with_jp(pc->info.childPC, context, condition);
        }else
        if(pc->type == CFLOW) {
	   if(condition == NULL) goto END;
	   result = UNKNOWN;
           *condition = (char *)malloc(strlen(pc->info.childPC->cflowFuncName)
					+1 /* '(' */
					+4 /* '%d' */
					+1 /* ',' */
					+1 /* '0' */
					+1 /* ')' */
					+1 /* '\0' */
				);
	   sprintf(*condition, "%s(%d,0)", pc->info.childPC->cflowFuncName, CFLOWQUERY);
	}else
        if(pc->type == CALLP) {
           char condBuf[GENDECLSIZE];
  	   char *cbp;

	   if(! match_pointcut_type(pc->type, context->type))  goto END;

	   info = pc->info.mInfo;

           if(!match_type(info->rtType, context->rtType)) goto END;

           if(pc->type != RESULT && !match_parameters(info->p, context->p , FALSE, 1 , context )) goto END;

           result = UNKNOWN;

	   /* the condition is special for callp: it composes 3 parts, which looks like */
	   /* ( part1 @~ part2 @p3~ part3 @# ) */
	   /* part1: compare the function pointer to see whether it matches the target function name
 		eg: FP_PARAM_NAME==target function name
	      part2: assign the target function name to the thisJoinPoint, so that the advice could know the real function name
		eg: this.targetName=real function name
	      part3: contains the target function's declaration, in case the function is not declared in current compilation unit or is not seen yet.

	      Example: if a function pointers matches a pointcut : callp(int foo(void)), the condition is:

		( FP_PARAM_NAME==foo @~ this.targetName="foo" @p3~ int foo(void); @# )

           */
 	   /* Inside the wrapper function, the condition will be filtered:
              1. if the advice contains "this" variable, the first @~ will be replaced by &&, otherwise, part2 will be removed
	      2. part3 will be removed from the condition and inserted before the "if" statement
	   */
	   /* construct the condition */
	   cbp = condBuf;
	   cbp += sprintf(cbp, "(%s==%s @~ ( this.targetName=\"%s\")  @p3~ ", FP_PARAM_NAME, info->funcName, info->funcName);
	   genFuncDecl(info->funcName, info->rtType, (struct Param*)(info->p), cbp, 0);

	   //need to add ; @~ )
	   *condition = (char *)malloc(strlen(condBuf) + 7 + 1);
           sprintf(*condition, "%s ; @# )", condBuf);
        }
        else
        if(pc->type == INTYPE) {
           result = match_typedef_name(pc->info.mInfo->p->p.type, context->funcName);
        }
	else
	if(pc->type == TRY) {
	   result = FALSE;
	}
	else assert(0);

END:

	return result;

}

// the ANY "$" may be inside pattern, it can match any part of name
// "$$" in the pattern means the normal "$"
// the "$" in the name just represents normal "$"
boolean match_name(char * pattern, char * name) {
	char * patternC, * nameC , * nextPatternC;
	char * posInName = NULL;
	char patternChar[2];
	boolean matched = FALSE;

	if(pattern == NULL || name == NULL) return FALSE;

	if(strstr(pattern, ANY) == NULL){
	 //   int i =strcmp(pattern, name);
       // printf("NUMBER::%d\n", i);

	    return !strcmp(pattern, name);
	  //return !i;
	}


	// a specical ANY pattern, which can match anything
	if(! strcmp(pattern, ANY)) return TRUE;

	patternC = pattern;
	nameC = name;

	if(*patternC != ANYC) {
		if(*patternC == *nameC) return match_name(patternC + 1, nameC + 1);
		else return FALSE;
	}

	nextPatternC = (++patternC );
	if(*nextPatternC == ANYC) {
		if(*nextPatternC == *nameC) return match_name(patternC +1, nameC + 1);
		else return FALSE;
	}

	if(*nextPatternC == '\0') return TRUE;

	//there is at least 1 normal character after the "$"
	patternChar[0] = *nextPatternC;
	patternChar[1] = '\0';

	posInName = strstr(nameC, patternChar);

	while(posInName != NULL) {
		matched = match_name(nextPatternC + 1, posInName + 1);
		if(matched == TRUE) break;
		nameC = nameC + 1;
		if(*(nameC) == '\0') break;
		posInName = strstr(nameC, patternChar);

	}

	return matched;
}

boolean match_type(char * type1, char * type2) {
        return match_name(type1, type2);
}

//a special pattern "...", which can match any list of parameters.
boolean match_parameters(struct pointcutParam * paramPattern,
			struct Param * param,
			boolean extractParam,
			int currIndex, struct Context * c) {
	struct Param * currPattern = (struct Param*)(paramPattern);
	struct Param * nextPattern = NULL;

	if(currPattern == NULL) {
		if(param == NULL) return TRUE;
		else return FALSE;
	}

	if(strstr(currPattern->type, ANYLIST) == 0) {
		//try to match the current parameter
		if(match_one_parameter(currPattern, param, extractParam, currIndex, c)) {
			return match_parameters(paramPattern->next, param==NULL ? NULL : param->next, extractParam, currIndex + 1, c);
		}else {
			return FALSE;
		}
	}else {
		struct Param * matchedParam = NULL;
		int indexIncrease = 0 ;
		boolean matched = FALSE;
		boolean preMatched = FALSE;

		//current pattern is a special flag "..."
		nextPattern = (struct Param*)(paramPattern->next);
		//skip continuous "..."
		while(nextPattern != NULL && strstr(nextPattern->type, ANYLIST)) {
			nextPattern = nextPattern->next;
		}

		if(nextPattern == NULL) return TRUE;
		if(param == NULL) return FALSE;

		matchedParam = find_parameter_by_type(nextPattern, param, &indexIncrease);
		while(matchedParam != NULL) {
			currIndex = currIndex + indexIncrease;
			matched = match_parameters((struct pointcutParam*)(nextPattern), matchedParam, extractParam, currIndex, c);
			if(preMatched == FALSE) preMatched = matched;
			indexIncrease = 0;
			currIndex ++;
			matchedParam = find_parameter_by_type(nextPattern, matchedParam->next, &indexIncrease);
		}

		return preMatched;
	}
	return FALSE;
}

//do 1 normal match, ie. there is no special flag in the current pattern
//assume both pattern and param are not null
boolean match_one_parameter(struct Param * currPattern, struct Param * param,
			boolean extractParam,
			int currIndex, struct Context * c) {
	struct pointcutParam * pcParam = (struct pointcutParam *)(currPattern);

	//if the param is null, it is possible that it is only a "void"
	char * ptype = NULL;
	if(param != NULL) {
		ptype = param->type;
	}else if(c->malInfo & EMITVOIDFORNOPARAM) {
		ptype = "void";
	}

	if(match_type(currPattern->type, ptype)) {
              if(extractParam) {
                   if(pcParam->ap != NULL) {
                         createNewArgIndex(pcParam->ap, c, currIndex);
                   }else {
                         assert(currPattern->id == NULL);
                   }
               }
               return TRUE;
	}else {
		return FALSE;
	}
}

boolean match_pointcut(struct Record * pc1, struct Record * pc2) {
	struct matchInfo * match1, *match2;
	struct Param * param1, *param2;
	assert(pc1 && pc2);
	if(pc1->type != CALL && pc1->type != EXECUTION) return FALSE;
	assert(pc1->type == CALL || pc1->type == EXECUTION);

	if(pc1->type != pc2->type) return FALSE;

	match1 = pc1->info.mInfo;
	match2 = pc2->info.mInfo;

	if(strcmp(match1->funcName, match2->funcName)) return FALSE;

  	if(strcmp(match1->rtType, match2->rtType)) return FALSE;

	param1 = (struct Param*)(match1->p);
	param2 = (struct Param*)(match2->p);

	while(param1 != NULL && param2 != NULL) {
		if(strcmp(param1->type, param2->type)) return FALSE;

		param1 = param1->next;
		param2 = param2->next;
	}

	if(param1 == NULL && param2 == NULL) return TRUE;

	return FALSE;
}




/*********************/
/* free memory */
/* when free context, do not free the 3 advice queues, because the advices may be used by other contexts */
/* advices will be freed after the whole compilation is freed */
void free_context(struct Context * temp) {
        free_parameters(temp->p);
	free_advice_queue(temp->before_advices);
	free_advice_queue(temp->after_advices);
	free_advice_queue(temp->around_advices);

	MYFREE(temp);
}

void free_call_context(struct CallContext * temp) {
	struct CallContext * c = NULL;
	c = temp;

	if(c == NULL) return;
	free_call_context(c->next);

	MYFREE(c->newFuncName);
	free_context( (struct Context *)(c));
}

void free_intype_context(struct Context * temp) {
	MYFREE(temp->funcName);
	free_context(temp);
}


void free_all_queues(){
	if(matchedCallContexts != NULL) {
		free_call_context(matchedCallContexts);
	}
	matchedCallContexts = NULL;
}

void free_parameters(struct Param * head) {
	struct Param * next ;
	if(head == NULL) return;
	next = head->next;
	free_parameters(next);
	MYFREE(head->id);
	MYFREE(head->type);
	MYFREE(head);
}

void free_advice_queue(struct AdviceQueue * queue) {
	if(queue == NULL) return;
	free_advice_queue(queue->next);
	switch(queue->data->type) {
		case ADBEFORETRY :
			queue->data->name = NULL;
			queue->data->rtType = NULL;
		case ADAFTERTRY:
		case ADBEFORECFLOW :
		case ADAFTERCFLOW :
		case ADARGSCFLOW:
			free_advices(queue->data);
	}

	MYFREE(queue);
}

void free_scope(struct Scope * s) {
	assert(s);
	free_scope_syms(s->syms);
	MYFREE(s);
}

void free_scope_syms(struct ScopeSym *ss) {
	if(ss == NULL) return;
	free_scope_syms(ss->next);
	MYFREE(ss);
}

/**************************/
/* find */
struct Param * find_parameter_by_index(struct Param * head, int index) {
	assert(head);
	if(index == 1) return head;
	return find_parameter_by_index(head->next, index-1);
}

struct Param * find_parameter_by_type(struct Param * target, struct Param * head, int * indexIncrease ) {
        if(head == NULL) return NULL;
	if(match_name(target->type, head->type)) return head;

	*indexIncrease = *indexIncrease + 1;
	return find_parameter_by_type(target, head->next, indexIncrease);
}

struct argIndexInContext * findArgIndexInContext(struct argIndexInContext * head, struct Context * c) {
	if(head == NULL) return NULL;
	if(head->c == c) return head;
	return findArgIndexInContext(head->nextContext, c);
}

/*****************/
/* log */
void logSetjmp(char * context) {
	struct Context * c = (struct Context *)context;

	if(isSJMPH_Emitted() == FALSE) {
                logGenDecls("#include <setjmp.h> \n", getCurrDefnLineNum());
                setSJMPH_Emitted();
        }

	assert(c);
	assert(c->type == EXECUTION);

	if(c->malInfo & HASPRETURN) {
		char buf[5000];
        	char * bufptr;
        	struct AdviceQueue * adptr;

		bufptr = &(buf[0]);

		bufptr += sprintf(bufptr, "\nstruct __UTAC__EXCEPTION %s ; \n jmp_buf %s ; \n int %s ; \n %s.jumpbuf = & %s ; \n %s.prtValue = 0 ; \n %s.cflowfuncs = 0 ; \n %s.pops = 0 ; \n ",
                        UTAC_EXCEP_VAR,
			JMPENVVAR,
                        JMPRETVAR,
                        UTAC_EXCEP_VAR, JMPENVVAR,
			UTAC_EXCEP_VAR,
                        UTAC_EXCEP_VAR,
			UTAC_EXCEP_VAR);

		/* register cflow functions */
		adptr = c->before_advices;
        	while(adptr) {
			if(adptr->data->type == ADBEFORECFLOW) {
				bufptr += sprintf(bufptr, "{ extern %s ; \n", EXCEP_CF_SET_DECL);
				bufptr += sprintf(bufptr, "%s ( (void *) & %s, & %s , %s(%d, 0)); } \n",
                                                EXCEP_CF_SET_NAME,
                                                UTAC_EXCEP_VAR,
                                                adptr->data->name,
                                                adptr->data->name,
                                                CFLOWQUERY);
			}
                	adptr = adptr->next;
		}

		bufptr += sprintf(bufptr, "%s = setjmp(%s); \n if(%s !=0) { \n if(%s.cflowfuncs != 0) { \n extern %s ; \n %s (& %s ); \n } \n",
                        JMPRETVAR, JMPENVVAR,
                        JMPRETVAR,
                        UTAC_EXCEP_VAR,
                        EXCEP_CF_RESET_DECL,
                        EXCEP_CF_RESET_NAME,
                        UTAC_EXCEP_VAR);

		if(needReturnValue(c)) {
			/* if the parent function needs a return value , cast the prtValue to the described return value and type  */
			bufptr += sprintf(bufptr, "%s = (%s)%s.prtValue ; \n return %s ; \n",
						RETVALUE ,
						c->rtType ,
						UTAC_EXCEP_VAR,
						RETVALUE);
		}else {
			bufptr += sprintf(bufptr, "%s; \n", "return ");
		}

		bufptr += sprintf(bufptr, "%s \n", "}");

		logGenDecls(buf, getCurrDefnBgnLn());
	}
}

void logAroundDeclaration() {
	char buf[ONELINE];
	char * targetFileName;
	long line;
	struct advice * ad;

	ad = getCurrAdvice();

	if(ad->malInfo & NEEDEXTRAP) {
		line = getCurrDefnLineNum();

		logGenDecls("", line); /* this is important, don't remove it */

		//for an advice having proceed() inside, its function definition should be changed to have an extra parameter.
	//this adding will be done later, so I log a message here
		sprintf(buf, "%s%s%s", ad->p == NULL ? NOPARAM_TAG:HSPARAM_TAG, HAS_PROCEED_TAG, ad->name);
		logGenDecls(buf, line);
	}

}

void logWrapperFunction(struct AdviceQueue * aQ, struct Context * c, char * preBuf ) {
	int index = -1;
	int i = -1;
	struct Param * pa = c->p;
	char buf[ONEFUNCDEFINITION];
	char *bufPtr = &(buf[0]);
	char funcDeclBuf[DECLARATION];	//a buffer for function declaration
	char wrapperFuncName[NAMELEN];
	char execoriFuncName[NAMELEN];
	char * myDecl ;
	struct advice * ad = aQ->data;
	char prtType[ONELINE];

	//this advice must belong to an advice queue
	assert(aQ);
	assert(ad->type == AROUND);

	//before the wrapper function, need declaration of the original function
	switch(c->type) {
		case CALL:
		case EXECUTION :
			bufPtr += sprintf(bufPtr, "%s ; \n", genFuncDecl(c->funcName, c->rtType, c->p, funcDeclBuf, c->malInfo));
			break;
		case SETPC:
		case GETPC:
			break;
		default:
			assert(0);
	}


	if(aQ->next && ( (ad->malInfo & HASPROCEED) || aQ->emitCond) ) {
		myDecl =  genTransWrapperFunction(aQ->next, c);

		if(preBuf) {
			char * newBuf = (char *)malloc(strlen(preBuf) + strlen(myDecl) + 1);
			sprintf(newBuf, "%s%s", myDecl, preBuf);
			MYFREE(preBuf);
			MYFREE(myDecl);
			myDecl = newBuf;
		}

		logWrapperFunction(aQ->next, c, myDecl);
		return;
	}


	pa = c->p;

	//now comes the wrapper function
	get_wrapper_func_name(c->funcName, c->type, wrapperFuncName);

	if(c->type == EXECUTION) {
		get_exec_ori_name(c->funcName, execoriFuncName);
		genFuncDecl(execoriFuncName, c->rtType, c->p, funcDeclBuf, 0);
		bufPtr += sprintf(bufPtr, "%s ; \n", funcDeclBuf);
	}


	bufPtr += sprintf(bufPtr, "%s%s%s \n", "void ** ", wrapperFuncName, " (struct JoinPoint * this);  \n");

        bufPtr += strlen(genSrcLineInfo(bufPtr));

       	bufPtr += sprintf(bufPtr, "%s%s%s \n", "void ** ", wrapperFuncName, " (struct JoinPoint * this) { \n");
       	while(pa != NULL){
               	index ++;
               	bufPtr += sprintf(bufPtr, "%s %s %s%d %s %s %s %s %d %s  \n", pa->type, "*", "a", index, " = (", pa->type, "*)", "(this->args[", index ,  "]); \n");
               	pa = pa->next;
       	}

       	if(needReturnValue(c)) {
		getPlainType(c->rtType, prtType);
               	bufPtr += sprintf(bufPtr, "%s %s %s %s %s \n", prtType, "**", " rp = ( ",  prtType, "**)(this->retValue);");
               	bufPtr += sprintf(bufPtr, "%s %s \n", prtType, " temp ; ");
               	bufPtr += sprintf(bufPtr, "%s ", "temp = ");
       	}

	switch(c->type) {
		case CALL:
		case EXECUTION:
			bufPtr += sprintf(bufPtr, "%s %s ", c->type == CALL ? c->funcName : execoriFuncName, "(");

			for(i = -1; i < index; ) {
                		i++;
                		bufPtr += sprintf(bufPtr, "%s%d ", "*a", i);
                		if(i < index) {
                        		bufPtr += sprintf(bufPtr, "%s ", ",");
                		}
        		}
			break;
		case SETPC:
			bufPtr += sprintf(bufPtr, "(**a0 = *a1");
			break;
		case GETPC:
			bufPtr += sprintf(bufPtr, "%s ", "(*a0");
			break;
		default:
			assert(0);
	}

       	bufPtr += sprintf(bufPtr, "%s \n", ");");

       	if(needReturnValue(c)) {
               	bufPtr += sprintf(bufPtr, "%s \n", "** rp = temp ; ");
       	}
       	bufPtr += sprintf(bufPtr, "%s \n", "return this->retValue;");
       	bufPtr += sprintf(bufPtr, "%s \n", "}");

	if(preBuf) {
		bufPtr += sprintf(bufPtr, "%s", preBuf);
		MYFREE(preBuf);
	}

	/* finish composing */
	logGenDecls(buf, 0 );  // 0 means put in the current line ;
}

/* deal with visibility of symbols among scopes */
/* local symbols should shadow global symbols */
void enterScope() {
	struct Scope * newScope = (struct Scope *)malloc(sizeof(struct Scope));
	newScope->parent = currScope;
	newScope->syms = NULL;
	currScope = newScope;
}

void leaveScope() {
	struct Scope * oldScope = currScope;
	struct ScopeSym * ss ;
	assert(oldScope);

	currScope = currScope->parent;

	ss = oldScope->syms;
	/* restore malInfo for each shadowed symbols */
	while(ss) {
		ss->sym->malInfo = ss->oriInfo;
		ss = ss->next;
	}

	free_scope(oldScope);
}

void shadowGlobSym(char * sym) {
	struct FuncInfo * gSym = searchFunc(varTable, sym);

	if(gSym) {
		/* this global symbol should be shadowed */
		struct ScopeSym * ss = (struct ScopeSym *)malloc(sizeof(struct ScopeSym));
		ss->sym = gSym;
		ss->oriInfo = gSym->malInfo;
		gSym->malInfo |= ISSHADOWED;
		ss->next = currScope->syms;
		currScope->syms = ss;
	}
}

void isInLocalScope(long * flag) {
	*flag = (currScope == NULL ? 0 : 1);
}

//check whether the name represents a function pointer
void isFuncPointer(char * inFuncName, char * name, long * flag) {

	*flag = (searchFP(fpTable, name, inFuncName) == NULL ? 0 : 1);

}


//if the condition statement doesn't have @~ in it, just emit:
//	if( condition ) { \n
//else:
//     the condition contains like:  ( part1 @~ part2 @p3~ part3 @# )
//     1. extract part3 and put them before the if() statement
//     2. if the advice contains the "this" variable, replace the @~ with &&; otherwise: remove the part2
//     3. emit if statment
//
//return the next available position in the buffer
//
char * emitConditionStmt(char * buf, struct advice * d) {
	char * cond = d->cflowCondition;
	char * newBuf=NULL;
	char * bkBuf=NULL;
	int i, j;
	assert(d->cflowCondition);

	if(strstr(cond, "@~") && strstr(cond, "@p3~") && strstr(cond, "@#")) {
		char * p0;
		char * p1;
		char * p2;
		char * replaceStr;


		//save a copy of the condition
		bkBuf = (char*)malloc(strlen(cond) + 1);
		sprintf(bkBuf, "%s", cond);
		p0 = bkBuf;


		//extract part 3
		while(p1 = strstr(p0, "@p3~")) {
			p2 = strstr(p1, "@#");
			*p2 = '\0';
			buf += sprintf(buf, " %s \n", p1+4);
			*p2 = '@';
			p0 = p2;
		}


		//change @~ to && if the advice contains "this"; otherwise, change to @p3~
		if(d->malInfo & HASTHISJPN) {
			replaceStr="&&";
		}else {
			replaceStr="@p3~";
		}

		j= strlen(replaceStr);
		p0=bkBuf;
		while(p1= strstr(p0, "@~")) {
			for(i = 0; i < j; i++) {
				p1[i] = replaceStr[i];
			}
			p0=p1+j;
		}

		//copy the condition to another buffer by remove @p3~ ... @#
		newBuf = (char *)malloc(strlen(cond) + 1);
		p0=bkBuf;
		p1=newBuf;
		while(p2=strstr(p0, "@p3~")) {
			*p2='\0';
			p1+= sprintf(p1, "%s", p0);
			*p2='@';
			p0=strstr(p2, "@#");
			p0+=2;
		}
		p1+= sprintf(p1, "%s", p0);

		cond = newBuf;
	}

	buf += sprintf(buf, "if( %s ) { \n", cond);

	if(newBuf != NULL) free(newBuf);
	if(bkBuf != NULL) free(bkBuf);

	return buf;
}



