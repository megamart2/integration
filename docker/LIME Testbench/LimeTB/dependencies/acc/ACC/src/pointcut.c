/*
 * ASPECT-ORIENTED C (ACC) - an aspect-oriented extension for the C language
 *
 * Copyright (C) 2006 . All rights reserved.
 *
 * Weigang (Michael) Gong, Hans-Arno-Jacobsen
 *
 * ACC development team (www.aspectc.net),
 * Middleware Systems Research Group (www.msrg.utoronto.ca),
 * University of Toronto.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */
#include "pointcut.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


struct Record *pCutInfo = NULL;
struct Record *PointCutTable = NULL;
struct CFlowRecord *cflowTable = NULL;	//a table of pointcut where cflow handling functions need to insert

struct TryRecord * tryTable = NULL;   //a table of pointcut where exception handling functins need to insert

struct advice * currAdvice = NULL;

extern struct checkFrame * currCheckFrame; /* current declaration frame */

//counters
int count = 0;
int cflowCounter = 0;
int adviceCounter = 0;
int cflowArgCounter = 0;

int state = 0;                  //a global state variable

//  a typical advice definition processing:
/*
   |<--------------------------------1------------------------------------------------------>|
   |<------------2------>|
   |<-3->|                     |<-4->|                                                 |<-6->|
   void    around(int a) : call(void  foo(int)) && cflow(execution(int foo3()) && args ( * a )
   {					|<--- 5

                proceed () ;

		preturn (3) ;

		throw(4);

		this->funcName ;

   }                                    ----> 5|
*/


#define POINTCUTINFO 0x0000000000000001		//flag 1
#define ADFUNCHEADER 0x0000000000000002		//flag 2
#define ADRETURNTYPE 0x0000000000000004		//flag 3
#define JPRETURNTYPE 0x0000000000000008		//flag 4
#define ADFUNCTIONBD 0x0000000000000010		//flag 5
#define MATCHARGADDR 0x0000000000000100		//flag 6

/*****************************************/
/* add */
void addNewAdvice(struct advice **head) {
	struct advice *tmp;
    	char * fileName;
	char * fileName2;

	get_target_file_name(&fileName);
	get_target_file_base_name(&fileName2);

	tmp = (struct advice *)malloc(sizeof(struct advice));
    	tmp->name = createAdName(fileName2, ++adviceCounter);
    	tmp->type = UNKNOWN_AD;
	tmp->rtType = NULL;
	tmp->acFileBaseName = copy_chars(fileName);
	tmp->p = NULL;
	tmp->malInfo = 0;
	tmp->cflowCondition = NULL;

	*head = tmp;
    	currAdvice = tmp;
}

struct ArgsInCflow * addArgsPCsInCFlow(struct Record * pc, char * baseFuncName, int * index) {
	struct ArgsInCflow * a1, *a2;

	if(pc == NULL) return;
        assert(pc->type != CFLOW && pc->type != UNKNOWN_PC);
        /* search for ARGS */
        switch(pc->type) {
                case CALL : case EXECUTION : case CALLP : case RESULT : case INFILE :
                case INFUNC : case INTYPE  : case COMP_NOT: case GETPC: case SETPC :
                        return NULL;
                case COMP_AND : case COMP_OR :
                        a1 = addArgsPCsInCFlow(pc->info.childPCs[0], baseFuncName, index);
                        a2 = addArgsPCsInCFlow(pc->info.childPCs[1], baseFuncName, index);
                        if(a1 == NULL) return a2;
			if(a2 == NULL) return a1;
			a1->next = a2;
			return a1;
                case PCNAME:
                        {
				struct Record * realPC = findPointcut(PointCutTable, pc->name);
				assert(realPC) ;     //make sure an named pointcut exists
           			a1 = addArgsPCsInCFlow(realPC, baseFuncName, index);
				if(a1 != NULL) {
                			struct pointcutParam * pp = pc->info.mInfo->p;
                			struct adviceParam * ap = realPC->aList->p;
                			assert(realPC->aList && realPC->aList->p);
                			while(pp) {
						pp->ap->callCflowContextFunc = copy_chars(ap->callCflowContextFunc);
                        			ap = ap->next;
                        			pp = pp->next;
                			}
				}
                        	return a1;
			}
                case NAMEDPC:
			return addArgsPCsInCFlow(pc->info.childPC, baseFuncName, index);
		case ARGS :
                        {
			char * cflowContextFunc = checkContextExposureInCflow(pc, baseFuncName, index);
			if(cflowContextFunc != NULL) {
				a1 = (struct ArgsInCflow *)malloc(sizeof(struct ArgsInCflow));
				assert(a1);
				a1->pc = pc;
				a1->funcName = cflowContextFunc;
				a1->next = NULL;
				return a1;
			}else return NULL;
		}
		default:
			assert(0);
	}
}

void addPointCutToCFlowTable(struct Record * pc) {
	struct CFlowRecord * newCFlowRec = NULL;
	struct CFlowRecord * existRec = NULL;
	char buf[NAMELEN];
	int index = 0;
	char * fileName;

        existRec = findPointcutInTable(cflowTable, pc);
	if(existRec) {
		pc->cflowFuncName = copy_chars(existRec->pc->cflowFuncName);
		return;
	}

	get_target_file_base_name(&fileName);
	newCFlowRec = (struct CFlowRecord*)malloc(sizeof(struct CFlowRecord));
	sprintf(buf, "%s_%s_%d", CFLOW_FUNC_NAME, fileName, cflowCounter++);

	pc->cflowFuncName = copy_chars(buf);


	newCFlowRec->pc = pc;
	newCFlowRec->next = cflowTable;
	newCFlowRec->notPrinted = TRUE;
	newCFlowRec->argsPCs = addArgsPCsInCFlow(pc, pc->cflowFuncName, &index);
	cflowTable = newCFlowRec;
}

/* the advice is the handler */
void addPointCutToTryTable(struct Record * pc, struct advice * ad) {
        struct TryRecord * oneTryRec = NULL;
        struct CatchHandler * handler = NULL;

	/* always add to the end of tryTable */
        oneTryRec = (struct TryRecord*)malloc(sizeof(struct TryRecord));
        oneTryRec->pc = pc;
	oneTryRec->next = NULL;
        oneTryRec->ad = ad;

	if(tryTable == NULL) {
		tryTable = oneTryRec;
	}else {
		/* todo: optimization opportunity */
		struct TryRecord * tmp = tryTable;
		while(tmp->next) {
			tmp = tmp->next;
		}
		tmp->next = oneTryRec;
	}
}

void addPointCutType2Current(char *type){
	PointcutType tmp;
	if(pCutInfo != NULL){
	  tmp = text2PointcutType(type);

          switch(pCutInfo->type = tmp) {
		case CALL:
	      		pCutInfo->name = "call"; break;
		case CALLP:
			pCutInfo->name = "callp"; break;
          	case EXECUTION:
	      		pCutInfo->name = "execution"; break;
	  	case COMP_AND:
	      		pCutInfo->name = "compound_and"; break;
          	case COMP_OR :
	      		pCutInfo->name = "compound_or"; break;
          	case COMP_NOT :
	      		pCutInfo->name = "compound_not"; break;
          	case ARGS :
              		pCutInfo->name = "args"; break;
		case RESULT:
              		pCutInfo->name = "result"; break;
          	case INFILE:
	      		pCutInfo->name = "infile"; break;
		case INFUNC:
			pCutInfo->name = "infunc"; break;
		case CFLOW:
			pCutInfo->name = "cflow"; break;
        	case PCNAME:
			pCutInfo->name = copy_chars(type); break;
		case INTYPE:
			pCutInfo->name = "intype"; break;
		case TRY:
			pCutInfo->name = "try"; break;
		case GETPC:
			pCutInfo->name = "get"; break;
		case SETPC:
			pCutInfo->name = "set" ; break;
		default:
			assert(0);
             }
      }else {
	 	assert(0);
	}
}

void setACName(char * id){
    	if(pCutInfo!=NULL)
    	assert(1);
        else
        assert(0);
	if(currCheckFrame != NULL) {
	   	if(GET(MATCHARGADDR)) {
                        /* the case like : (*i) */
			/* it should match the address */
			char buf[NAMELEN];
			sprintf(buf, "*%s", id);
                        setId(buf);
			CLR(MATCHARGADDR);
		}
		else if(pCutInfo->type == CALL || pCutInfo->type == CALLP || pCutInfo->type == EXECUTION) {
                	if(GET(JPRETURNTYPE)) {
                        	setACType(id);
                	}else if(currCheckFrame->curFunc->fname == NULL) {
                        	if(pCutInfo->type == CALLP && strstr(id, "$")) {
					ERR(no_wildcard_in_callp, ) ;
				}

				setId(id);
			}else {
				setACType(id);
			}
                }
		else {
			setId(id);
		}

		if(currCheckFrame->type == ADFUNCDECL) {
			/* this id represents the type of the advice */
			char * adName;
                        //only 3 types of advice is supported
                        setAdviceType(id);
                        if(currAdvice->type == BEFORE ||
                           currAdvice->type == AFTER ||
                           currAdvice->type == INTRODUCE ||
			   currAdvice->type == CATCH) {
                           if(currCheckFrame->curFunc->rtType != NULL) {
				ERR_I(no_return_type_for_advice, id, ) ;
			   }
			   s("void ");
                       	}

                        getAdviceName(&adName);
                        s(adName);
		}else {
			s(id);
		}
  	}
}

void setPointcutName(char * s) {
        assert(pCutInfo && pCutInfo->type == UNKNOWN_PC);
        assert(currAdvice && currAdvice->type == UNKNOWN_AD);

	if(text2PointcutType(s) != COMPOUND &&
           text2PointcutType(s) != PCNAME) {
		ERR_I(invalid_pointcut_name, s, );
	}

	if(text2PointcutType(s) == PCNAME && findPointcut(PointCutTable, s)) {
		ERR_I(redefine_pointcut_name, s, );
	}

        pCutInfo->type = NAMEDPC;
        pCutInfo->name = copy_chars(s);

        currAdvice->type = ADFORNAMEDPC;
}

/*****************************************/
/* start */
void startPointcutInfo(){
   struct Record *tmp;
   pCutInfo = (struct Record *)createNewRecord(count);
   count++;
   tmp =  PointCutTable;
   PointCutTable = pCutInfo;
   PointCutTable->next = tmp;

   SET(POINTCUTINFO);
}

//create a blank advice, add it to the pointcut,
//note: its type and name would be filled during process
void startAdFuncHeader() {
        assert(pCutInfo);
        addNewAdvice(&(pCutInfo->aList));
        SET(ADFUNCHEADER);
}

void startAdReturnType() { SET(ADRETURNTYPE) ; }
void startJPReturnType() { SET(JPRETURNTYPE); }
void startAdFunctionBD() {
	SET(ADFUNCTIONBD);

	outputDefnBgnLn();	/* indicate this is the beginning of a function */

	if(currAdvice->type == INTRODUCE) {
		s("\n"); s(INTRODUCEBEGIN_TAG); s("\n");
	}

}

void startGetDynInfo() {
	pushAChildForCompPC(0);
}


/*****************************************/
/* output */
void outputAdviceFuncBeginTag() {
	s(ADVICE_FUNC_BEGIN_TAG);
	//s(" inline ");
	s(" "); // viorel
}

void outputAdviceFuncEndTag() {
	s("\n") ;
        s(ADVICE_FUNC_END_TAG);
        s("\n");
}

/*****************************************/
/* end */
void endPointcutInfo(){
	if(currAdvice && currAdvice->type == CATCH) {
		if(!pCutInfo || ! hasTryPCOnly(pCutInfo)) {
			ERR(try_catch_mismatch, );
		}
		if(! currAdvice->p || currAdvice->p->next || currAdvice->p->usedInPC == TRUE) {
			ERR(catch_wrong_param, );
		}
	}

	if(currAdvice && currAdvice->p) {
		struct adviceParam * adp = currAdvice->p;
		while(adp) {
			if(adp->usedInPC == FALSE && currAdvice->type != CATCH ) {
				ERR_I(advice_param_not_used, adp->p.id, );
			}
			adp = adp->next;
		}
	}

	pCutInfo = NULL;
	// current advice information may still be needed inside advice function body, like the return value, reset it to NULL after the whole advice is finished
	CLR(POINTCUTINFO);
}

void endAdFuncHeader(){ CLR(ADFUNCHEADER); }
void endAdReturnType(){ CLR(ADRETURNTYPE); }
void endJPReturnType(){ CLR(JPRETURNTYPE); }

void endAdFunctionBD(){
        CLR(ADFUNCTIONBD);
        if(currAdvice->type == INTRODUCE) {
                s("\n"); s(INTRODUCEEND_TAG); s("\n");
        }
	if( (currAdvice->malInfo & HASPRETURN || currAdvice->malInfo & HASTHROW)
		&& (isSJMPH_Emitted() == FALSE) ) {
                logGenDecls("#include <setjmp.h> \n",  getCurrDefnLineNum());
		setSJMPH_Emitted();
	}

	if(currAdvice->malInfo) {
		logAroundDeclaration();
        }
	currAdvice = NULL;
	state = 0;

}

void endGetDynInfo(){
        struct Record * currRec;
        popChild();
        currRec = pCutInfo;
        switch(currRec->type) {
		case CFLOW:
        		addPointCutToCFlowTable(currRec->info.childPC);
			break;
		case TRY:
                        if(!currAdvice || currAdvice->type != CATCH) {
				ERR(try_catch_mismatch, );
			}
			addPointCutToTryTable(currRec->info.childPC, currAdvice);
                        break;
		default:
			assert(0);
	}
}

void endPointcutName() { endAdFuncHeader(); }

void endACParamDeclCollection() {
	struct checkFrame * oldFrame = currCheckFrame;

	assert(currCheckFrame);

	if(currCheckFrame->parent) {
		/* there is a parent frame */
		if(GET(JPRETURNTYPE) == TRUE) {
			currCheckFrame->parent->curFunc->rtType =
				copy_chars(currCheckFrame->curFunc->rtType);
		}else {
			addParamToFunc(currCheckFrame->parent, currCheckFrame);
		}
	}else {
		switch(currCheckFrame->type) {
			case ADFUNCDECL:
				assert(currAdvice);
				assert(currAdvice->rtType == NULL);
				assert((currAdvice->malInfo & HASPROCEED) ==FALSE);
       				assert((currAdvice->malInfo & HASTHISJPN) == FALSE);
                        	assert(currAdvice->cflowCondition==NULL);

				currAdvice->rtType= copy_chars(currCheckFrame->curFunc->rtType);
        			currAdvice->p = create_advice_parameter(currCheckFrame->curFunc->p);
				break;
			case PCMATCHING:
				createPointcutMatchingInfo(currCheckFrame);
				break;
			default: assert(0);
		}
	}

	currCheckFrame = currCheckFrame->parent;

	free_func(oldFrame->curFunc);
        free_declframe(oldFrame);
}


/*****************************************/
/* check */
void isPointcutInfo(long *flag) { *flag = GET(POINTCUTINFO); }
void isAdFuncHeader(long *flag) { *flag = GET(ADFUNCHEADER); }
void isAdFunctionBD(long *flag) { *flag = GET(ADFUNCTIONBD); }

void checkKeywordInAdvice(char * s, long *flag) {
	if(match_name("proceed", s)) *flag = PROCEED;
	else if(match_name("preturn", s)) { printf("i'm in\n");
	*flag = PRETURN;}
	else if(match_name("throw", s)) *flag = THROW;
	else if(match_name("this", s)) *flag = THIS;
	else if(match_name("arg", s)) * flag = ARG;
	else if(match_name("argType", s)) * flag = ARGTYPE;
	else *flag = UNKNOWN_ADKEYWORD;
}


/*****************************************/
/* assert check */
void assertKeyword(char * s, char * keyword) {
	if( ! match_name(keyword, s) ) {
		ERR_II (wrong_keyword, keyword, s , );
	}
}

void assert2Keywords(char * s, char * keyword1, char * keyword2) {
        if( ! match_name(keyword1, s) && ! match_name(keyword2, s)) {
                char buf[ONELINE];
                sprintf(buf, "%s or %s", keyword1, keyword2);
                ERR_II (wrong_keyword, buf, s, );
        }
}

/****************************************/
/* check each parameter to see whether context exposure is required */
/* if yes, update each corresponding advice parameter with the function call which will
be used to get the value */
/* for each advice parameter, there is an associated index in order to set/get the value */

/* return the cflow context function name */
char * checkContextExposureInCflow(struct Record *pc, char * fName, int * index) {
	struct pointcutParam *p;
	char * cFunc = NULL;
	char * fCall = NULL;
	char buf[NAMELEN];
	char buf2[ONELINE];
	assert(pc && pc->type == ARGS);
	p = pc->info.mInfo->p;
	while(p != NULL) {
                if(p->ap != NULL) {
			if(cFunc == NULL) {
				sprintf(buf, "%s_%d", fName, cflowArgCounter++);
				cFunc = (char *)malloc(strlen(buf) + 1);
				sprintf(cFunc, "%s", buf);
			}
        		sprintf(buf2, "%s ( %d , %d, 0 ) ", cFunc, CFLOWGETCONTEXT, *index);
			*index = *index + 1;
        		fCall = (char *)malloc(strlen(buf2) + 1);
        		sprintf(fCall, "%s", buf2);
        		if(p->ap->callCflowContextFunc) MYFREE(p->ap->callCflowContextFunc);
			p->ap->callCflowContextFunc = fCall;
		}
		p = p->next;
	}
	return cFunc;
}

/*****************************************/
/* create */
struct Record * createNewRecord(int id){
	struct Record *tmp;
	tmp = (struct Record *)malloc(sizeof(struct Record));
        tmp->id = id;
   	tmp->name = NULL;
   	tmp->type = UNKNOWN_PC;
	tmp->aList = NULL;
   	tmp->next = NULL;
	tmp->cflowFuncName = NULL;

   	tmp->info.mInfo = NULL;
  	tmp->info.childPCs[0] = NULL;
	tmp->info.childPCs[1] = NULL;
	tmp->info.childPC = NULL;
	tmp->info.inside = NULL;

	tmp->parentPC = NULL;

	return tmp;
}


void createNewArgIndex(struct adviceParam * adParam, struct Context * c, int initValue) {
	struct argIndexInContext * newArgIndex = NULL;
	newArgIndex = (struct argIndexInContext *)(malloc(sizeof(struct argIndexInContext)));

	newArgIndex->c = c;
        newArgIndex->argIndex = initValue;
        newArgIndex->nextContext = adParam->indexInContext;
	adParam->indexInContext = newArgIndex;
}


struct argIndexInContext * copy_argindex_incontext(struct argIndexInContext * ori) {
	struct argIndexInContext * new = NULL;
	if(ori != NULL) {
		new = (struct argIndexInContext *)malloc(sizeof(struct argIndexInContext));
		assert(new);
		new->argIndex = ori->argIndex;
		new->c = ori->c;
		new->nextContext = copy_argindex_incontext(ori->nextContext);
	}
	return new;




}

//create name for an advice
char * createAdName(char *fname, int counter){
        char *temp;
        // 6 for "_"
        // 4 for counter
        // 1 for '\0'
	temp = (char *)malloc(strlen(UTAC_ADVICE_NAME_PREFIX) + strlen(fname) + 6 + 4 + 1);
        sprintf(temp, "__%s__%s__%d", UTAC_ADVICE_NAME_PREFIX, fname, counter);
	return temp;
}


/* create a string of types connected by "." */
char * create_dot_types(struct Param * p) {
	char * type ;
	char * result;
	char * restStr;
	if(p == NULL) return NULL;

	restStr = create_dot_types(p->next);

	type = (p->type ? p->type : p->id);

	if(restStr == NULL) return copy_chars(type);

	result = add_chars_with_dot(type, restStr);

	free(restStr);
	return result;
}



struct pointcutParam * create_pointcut_param(struct Param * p) {
	struct pointcutParam * pp = NULL;
	struct pointcutParam * rest = NULL;
	if(p == NULL) return NULL;

	pp = (struct pointcutParam*)malloc(sizeof(struct pointcutParam));

	pp->ap = NULL;

	assert(currAdvice);

	/* either id or type is specified */
	if(p->id == NULL || strstr(p->id, PARAM_NAME) == p->id ) {
		assert(p->type);
		pp->p.id = NULL;
		pp->p.type = copy_chars(p->type);
		pp->ap = NULL;
	}else if(p->type == NULL) {
		struct Param * adParam;
		boolean matchAddress = FALSE;
		char * id = p->id;
		/* only has an id, then it has to match an advice parameter */
		assert(p->id);
              	if(*(id) == '*') {
			matchAddress = TRUE;
			id++;
		}

		adParam = findParam((struct Param*)(currAdvice->p), id);
                if(adParam) {
			if( ((struct adviceParam*)(adParam))->usedInPC == FALSE) {
				((struct adviceParam*)(adParam))->usedInPC = TRUE;
			}else {
				free(pp);
				ERR_I(advice_param_multi_used, id, NULL );
			}

			pp->p.id = copy_chars(id);
			pp->p.type = copy_chars(adParam->type);

			if(matchAddress == TRUE) {
                        	int len = strlen(pp->p.type);
                        	assert(pp->p.type[len-1] == '*');
                        	pp->p.type[len-1] = '\0';
                        	((struct adviceParam*)adParam)->matchAddress = TRUE;
                	}

			pp->ap = (struct adviceParam*)(adParam);
		}else {
			if(matchAddress == TRUE) {
                        	free(pp);
				ERR_II(undeclared_id, id , "args", NULL );
			}else if(pCutInfo->type == PCNAME) {
				free(pp);
				ERR_II(undeclared_id, id, pCutInfo->name, NULL);
			}

			/* because we support wildcard character */
			pp->p.id = NULL;
			pp->p.type = copy_chars(p->id);
		}

	}else assert(0);

	rest = create_pointcut_param(p->next);

	pp->p.next = (struct Param *)(rest);
	pp->next = rest;

        return pp;
}

struct adviceParam * create_advice_parameter(struct Param * p) {
        struct adviceParam * ap = NULL;
        struct adviceParam * rest = NULL;
        if(p == NULL) return NULL;

        ap = (struct adviceParam*)malloc(sizeof(struct adviceParam));

        assert(currAdvice);

	ap->p.id = copy_chars(p->id);
	ap->p.type = copy_chars(p->type);

	ap->indexInContext = NULL;
        createNewArgIndex(ap, NULL, -1);

	ap->matchAddress = FALSE;
	ap->usedInPC = FALSE;
	ap->callCflowContextFunc = NULL;
	rest = create_advice_parameter(p->next);

        ap->p.next = (struct Param *)(rest);
        ap->next = rest;

	return ap;
}


void createPointcutMatchingInfo(struct checkFrame * cf) {
	assert(pCutInfo->info.mInfo == NULL);
        assert(pCutInfo->type == CALL ||
                pCutInfo->type == CALLP ||
                pCutInfo->type == EXECUTION ||
                pCutInfo->type == ARGS ||
                pCutInfo->type == RESULT ||
                pCutInfo->type == PCNAME ||
                pCutInfo->type == INTYPE ||
		pCutInfo->type == INFILE ||
		pCutInfo->type == INFUNC ||
		pCutInfo->type == GETPC ||
                pCutInfo->type == SETPC);

	if(currAdvice->type != ADFORNAMEDPC) {
		if(pCutInfo->type == INTYPE && currAdvice->type != INTRODUCE) {
                	ERR(invalid_intype , );
		}
		if(currAdvice->type == INTRODUCE && hasIntypePCOnly(pCutInfo) == FALSE) {
			ERR(invalid_introduce, );
		}
		/* mwgong
		if(currAdvice->type == CATCH) {
			ERR(try_catch_mismatch, );
		}  */
	}

	if( pCutInfo->type == RESULT || pCutInfo->type == INTYPE ||
            pCutInfo->type == INFUNC) {
		if(cf->curFunc->p == NULL || cf->curFunc->p->next != NULL) {
                        ERR_I(multi_param_for_pointcut, pCutInfo->name, );
		}
	}else if(pCutInfo->type == INFILE && cf->curFunc->fname == NULL) {
			ERR_I(multi_param_for_pointcut, pCutInfo->name, );
	}

	switch(pCutInfo->type) {
		case INFUNC:
			pCutInfo->info.inside = copy_chars(cf->curFunc->p->id);
			return;
		case INFILE:
			pCutInfo->info.inside = copy_chars(cf->curFunc->fname);
			return;
		default:
        		pCutInfo->info.mInfo = (struct matchInfo *)malloc(sizeof(struct matchInfo));
        		pCutInfo->info.mInfo->funcName = NULL;
        		pCutInfo->info.mInfo->rtType = NULL;
        		pCutInfo->info.mInfo->p = NULL;
	}

	switch(pCutInfo->type) {
		case CALL:
		case CALLP:
		case EXECUTION:
			pCutInfo->info.mInfo->funcName = copy_chars(cf->curFunc->fname);
			pCutInfo->info.mInfo->rtType = copy_chars(cf->curFunc->rtType);
			pCutInfo->info.mInfo->p = create_pointcut_param(cf->curFunc->p);
			break;
		case SETPC:
			assert(cf->curFunc->p);
                        pCutInfo->info.mInfo->funcName = copy_chars(cf->curFunc->fname);
                        pCutInfo->info.mInfo->rtType =
                                create_dot_types(cf->curFunc->p);
                        {
                                /* need to create 2 fake parameters */
				/* pointcut "set(int a)" will have 2 fake parameters, such as
						(int *, int) */
                                struct pointcutParam * pp1 = (struct pointcutParam *)malloc(sizeof(struct pointcutParam));
                                struct pointcutParam * pp2 = (struct pointcutParam *)malloc(sizeof(struct pointcutParam));

				pp1->p.id = NULL;
                                pp1->p.type = copy_chars(pCutInfo->info.mInfo->rtType);
                                addStarToType(&(pp1->p.type));
				pp1->p.next = (struct Param *)pp2;
                                pp1->ap = NULL;
                                pp1->next = pp2;

				pp2->p.id = NULL;
                                pp2->p.type = copy_chars(pCutInfo->info.mInfo->rtType);
				pp2->p.next = NULL;
                                pp2->ap = NULL;
				pp2->next = NULL;

				pCutInfo->info.mInfo->p = pp1;
                        }
                        break;

		case GETPC:
                        assert(cf->curFunc->p);
			pCutInfo->info.mInfo->funcName = copy_chars(cf->curFunc->fname);
                        pCutInfo->info.mInfo->rtType =
				create_dot_types(cf->curFunc->p);
                        {
				/* need to create a fake parameter */
				struct pointcutParam * pp = (struct pointcutParam *)malloc(sizeof(struct pointcutParam));
				pp->p.id = NULL;
				/* todo: need to reconsider,
				   for "get(struct A.int a.b)", the type should be "int", instead of "struct A.int". So far, such format is not supported */
				pp->p.type = copy_chars(pCutInfo->info.mInfo->rtType);
				pp->p.next = NULL;
				pp->ap = NULL;
				pp->next = NULL;
				pCutInfo->info.mInfo->p = pp;
			}
                        break;
		case ARGS:
            		pCutInfo->info.mInfo->rtType = copy_chars(ANY);
             		pCutInfo->info.mInfo->funcName = copy_chars(ANY);
	        case INTYPE:
		case PCNAME:
			/* need to copy the parameter to ARGS parameter */
			pCutInfo->info.mInfo->p = create_pointcut_param(cf->curFunc->p);
			if(pCutInfo->type == PCNAME) {
				/* check the named pointcut exists */
				/* the parameter type matchs */
				struct Record * pc = findPointcut(PointCutTable, pCutInfo->name);
				if(pc == NULL) {
                        		ERR_I (undefined_pointcut, pCutInfo->name, ) ;
				}

				if(! match_parameters(pCutInfo->info.mInfo->p,
						      (struct Param *)(pc->aList->p),
						      0,
						      0,
						      NULL)) {
					ERR_I(unmatched_type, pCutInfo->name, );
				}
			}
			break;
		case RESULT:
             		pCutInfo->info.mInfo->funcName = copy_chars(ANY);

			if(cf->curFunc->p->type) {
				pCutInfo->info.mInfo->rtType = copy_chars(cf->curFunc->p->type);
			}else {
				/* the case : result(p) */
				struct Param * adParam;
				boolean matchAddress = FALSE;

				assert(cf->curFunc->p->id);
                		assert(currAdvice);

                		if(*(cf->curFunc->p->id) == '*') {
                        		matchAddress = TRUE;
                        		cf->curFunc->p->id++;
                		}

				adParam = findParam((struct Param*)(currAdvice->p), cf->curFunc->p->id);
                		if(adParam) {
                			if( ((struct adviceParam*)(adParam))->usedInPC == FALSE) {
                                		((struct adviceParam*)(adParam))->usedInPC = TRUE;
                        		}else {
                                		ERR_I(advice_param_multi_used, cf->curFunc->p->id, );
					}

					pCutInfo->info.mInfo->rtType = copy_chars(adParam->type);
                			if(matchAddress == TRUE) {
                                		int len = strlen(pCutInfo->info.mInfo->rtType);
                                		assert(pCutInfo->info.mInfo->rtType[len-1] == '*');
                                		pCutInfo->info.mInfo->rtType[len-1] = '\0';
                                		((struct adviceParam*)adParam)->matchAddress = TRUE;
                        			cf->curFunc->p->id --;
					}

					assert( ((struct adviceParam*)(adParam))->indexInContext->argIndex == -1);
                        		((struct adviceParam*)(adParam))->indexInContext->argIndex= 0;
				}else {
					/* since we support wildcard character inside a name, so if there is no advice parameter with such name, we think user want to set a type, eg. result(cha$) */

					pCutInfo->info.mInfo->rtType = copy_chars(cf->curFunc->p->id);
				}
			}
			break;
		default:
			assert(0);
	}
}

/*****************************************/
/* free */
void free_pointcut(struct Record * table) {
	struct Record * rec = table;
	if(rec == NULL) return;
	free_pointcut(rec->next);
	//pointcut name is not malloced, it is a string literal
        if(rec->type == PCNAME || rec->type == NAMEDPC) MYFREE(rec->name);

	MYFREE(rec->cflowFuncName);

	free_matchinginfo(rec);
	free_advices(rec->aList);
	MYFREE(rec);
}

void free_advices(struct advice * a) {
	struct advice * ad = a;
	if(ad == NULL) return;
	MYFREE(ad->name);
	MYFREE(ad->rtType);
	MYFREE(ad->acFileBaseName);
	MYFREE(ad->cflowCondition);
	free_advice_param(ad->p);

	MYFREE(ad);

}

void free_advice_param(struct adviceParam *p) {
	if(p == NULL) return;
	free_advice_param(p->next);
	free_argIndexInContext(p->indexInContext);
	MYFREE(p->p.type);
	MYFREE(p->p.id);
	MYFREE(p->callCflowContextFunc);
	MYFREE(p);
}

void free_argIndexInContext(struct argIndexInContext * arg) {
	if(arg == NULL) return;
	free_argIndexInContext(arg->nextContext);
	MYFREE(arg);
}

void free_matchinginfo(struct Record * rec) {
	switch(rec->type) {
		case CALL : case CALLP : case EXECUTION :
		case ARGS : case RESULT : case PCNAME :
		case INTYPE : case GETPC : case SETPC :
                	free_matchinginfo_struct(rec->info.mInfo); break;
		case COMP_AND : case COMP_OR:
                	free_pointcut(rec->info.childPCs[0]);
                	free_pointcut(rec->info.childPCs[1]);
			break;
		case COMP_NOT : case NAMEDPC : case CFLOW : case TRY:
                	free_pointcut(rec->info.childPC);
			break;
		case INFUNC : case INFILE:
                	MYFREE(rec->info.inside);
			break;
		default:
                	assert(0);
        }
}

void free_matchinginfo_struct(struct matchInfo * info) {
	if(info == NULL) return;
        free_pointcut_param(info->p);
        MYFREE(info->funcName);
        MYFREE(info->rtType);
        MYFREE(info);
}

void free_pointcut_param(struct pointcutParam * pp) {
	if(pp == NULL) return;
        free_pointcut_param(pp->next);
        MYFREE(pp->p.type);
        MYFREE(pp->p.id);
        MYFREE(pp);

}

void free_argspc_in_cflow(struct ArgsInCflow * args) {
	if(args == NULL) return;
	free_argspc_in_cflow(args->next);
	MYFREE(args->funcName);
	MYFREE(args);
}

void free_cflowTable(struct CFlowRecord * cflow) {
	if(cflow == NULL) return;
	free_cflowTable(cflow->next);
        free_argspc_in_cflow(cflow->argsPCs);
	MYFREE(cflow);
}

void free_tryTable(struct TryRecord * tryPtr) {
	if(tryPtr == NULL) return;
	free_tryTable(tryPtr->next);
	MYFREE(tryPtr);
}

/*****************************************/
/* set */

//the s is a lstring, which has the first character indicating the length, so I need to
//skip it
void setInsideFile(char * s) {
	if(pCutInfo && (pCutInfo->type == INFILE) && pCutInfo->info.inside == NULL) {
		setACName(++s);
	}
}

void setFoundAdKeyword(int flag) {
	assert(currAdvice);
	switch(flag) {
		case PROCEED:	/* proceed */
			currAdvice->malInfo |= HASPROCEED;
			currAdvice->malInfo |= NEEDEXTRAP;
			break;
		case PRETURN:	/* preturn */
			currAdvice->malInfo |= HASPRETURN;
        		currAdvice->malInfo |= NEEDEXTRAP;
			break;
		case THROW:	/* throw */
			currAdvice->malInfo |= HASTHROW;
			break;
		case ARG:       /* this->arg */
                case ARGTYPE:   /* this->argtype */
                        currAdvice->malInfo |= HASTHISJPNARG;
		case THIS:	/* this */
			currAdvice->malInfo |= HASTHISJPN;
		        currAdvice->malInfo |= NEEDEXTRAP;
			break;
		default:
			assert(0);
	}
}

void setAdviceType(char *t) {
	assert(currAdvice);
	currAdvice->type = text2AdviceType(t);
}

void resetAdviceCounter() {
        adviceCounter = 0;
	cflowCounter = 0;
	cflowArgCounter = 0;
}

void setACType(char * t) {
  if(GET(POINTCUTINFO) == FALSE ) return;
  if(currCheckFrame != NULL) {
	setType(t);
	return;
  }
  assert(0);
}

//there are 3 complex type: struct, union, enum
void setACComplexType(long type, char *t) {
	char buf[NAMELEN];
	setComplexTypeName(type, buf, t);
	setACType(buf);
}

void setACTypePointer() {
	if( GET(POINTCUTINFO) == FALSE) return;
	//handle args(*i) case: it means to match the address of an argument
	if(pCutInfo && currCheckFrame->type == PARAMDECL &&
		currCheckFrame->curFunc->rtType == NULL ){
		if(pCutInfo->type == ARGS || pCutInfo->type == RESULT) {
			SET(MATCHARGADDR);
			return;
		}else {
			ERR(invalid_match_address, );
		}
	}
	if(currCheckFrame) {
		setPointerType();
	}
}

/*****************************************/
/* get */
struct advice * getCurrAdvice() { return currAdvice ; }


void getAdviceName(char **t ) {
	assert(currAdvice && currAdvice->name);
	*t = currAdvice->name;
}


char *getPointCutTypeText(PointcutType p){
	switch(p){
	   case CALL:
	        return "call";
	        break;
	   case CALLP:
		return "callp";
		break;
           case EXECUTION:
	        return "execution";
	        break;
	   case ARGS:
		return "args";
		break;
	case RESULT:
                return "result";
                break;

	case INFILE:
                return "infile";
                break;

	case INFUNC:
                return "infunc";
                break;

	case COMPOUND:
		    return "compound";
		    break;
	case GETPC:
		return "get";
		break;
	case SETPC:
		return "set";
	default:
	        assert(0);
	        break;
	}
}


char *getAdviceText(AdviceType a){
        switch(a){
           case BEFORE:
                return "before";
                break;
           case AFTER:
                return "after";
                break;
           case AROUND:
                return "around";
                break;
           case ADFORNAMEDPC:
                return "advice_for_named_pc";
                break;
           case INTRODUCE:
		return "introduce";
	   case CATCH:
		return "catch";
	   default:
                assert(0);
                break;
        }
}

/*******************************************/
/* find */
struct Param * findParam(struct Param * head, char * name) {
	if(head == NULL) return NULL;

	if(strcmp(head->id, name) == 0) return head;

	return findParam(head->next, name);
}

struct Record * findPointcut(struct Record * head, char * name) {
        if(head == NULL) return NULL;
        if(match_name(head->name, name) && head->type == NAMEDPC) return head;
        return findPointcut(head->next, name);
}

struct CFlowRecord * findPointcutInTable(struct CFlowRecord * head, struct Record * target) {
	if(head == NULL) return NULL;
	if(match_pointcut(head->pc, target)) return head;
	else return findPointcutInTable(head->next, target);
}


/* return true if the pc only contains intype poincut */
boolean hasIntypePCOnly(struct Record * pc) {
	if(pc == NULL) return TRUE;
	switch(pc->type) {
		case CALL:
		case EXECUTION:
		case CALLP:
		case ARGS:
		case RESULT:
		case INFILE:
		case INFUNC:
		case CFLOW:
	        case GETPC:
		case SETPC:
		case TRY:
			return FALSE;
		case INTYPE:
			return TRUE;
		case COMPOUND:
		case COMP_OR:
		case COMP_AND:
			if(hasIntypePCOnly(pc->info.childPCs[0]) == TRUE) {
           			return hasIntypePCOnly(pc->info.childPCs[1]);
			}else {
				return FALSE;
			}
		case NAMEDPC:
		case COMP_NOT:
			return hasIntypePCOnly(pc->info.childPC);
		case PCNAME:
        		return hasIntypePCOnly(findPointcut(PointCutTable, pc->name));

	}
	assert(0);
}

/* return true if the pc only contains try pointcut, or pointcuts connected by "||" */
boolean hasTryPCOnly(struct Record * pc) {
        if(pc == NULL) return TRUE;
        switch(pc->type) {
                case CALL:
                case EXECUTION:
                case CALLP:
                case ARGS:
                case RESULT:
                case INFILE:
                case INFUNC:
                case CFLOW:
                case INTYPE:
                case COMPOUND:
		case COMP_AND:
		case COMP_NOT:
               	case SETPC:
		case GETPC:
		 	return FALSE;
		case TRY:
			return TRUE;
		case COMP_OR:
                        if(hasTryPCOnly(pc->info.childPCs[0]) == TRUE) {
                                return hasTryPCOnly(pc->info.childPCs[1]);
                        }else {
                                return FALSE;
                        }
                case NAMEDPC:
                        return hasTryPCOnly(pc->info.childPC);
		case PCNAME:
                        return hasTryPCOnly(findPointcut(PointCutTable, pc->name));

        }
        assert(0);
}


/*********************************/
/* convert */
AdviceType text2AdviceType(char *type){

  if(strcmp(type, "before") == 0){
  	 return BEFORE;
  }else if(strcmp(type, "after") == 0){
  	 return AFTER;
  }else if(strcmp(type, "around") == 0){
  	 return AROUND;
  }else if(strcmp(type, "introduce") == 0 ){
	 return INTRODUCE;
  }else if(strcmp(type, "catch") == 0) {
	 return CATCH;
  }else {
	ERR_I(unknown_advice, type, UNKNOWN_AD);
  }

}

PointcutType text2PointcutType(char *type){
  if(strcmp(type, "call") == 0){
  	 return CALL;
  }else if(strcmp(type, "callp") == 0) {
	 return CALLP;
  }else if(strcmp(type, "execution") == 0){
  	 return EXECUTION;
  }else if(strcmp(type, "compound") == 0){
  	 return COMPOUND;
  }else if(strcmp(type, "and") == 0) {
	 return COMP_AND;
  }else if(strcmp(type, "or") == 0) {
	 return COMP_OR;
  }else if(strcmp(type, "not") ==0) {
	 return COMP_NOT;
  }else if(strcmp(type, "args") ==0) {
	 return ARGS;
  }else if(strcmp(type, "result") ==0) {
         return RESULT;
  }else if(strcmp(type, "infile") ==0) {
	return INFILE;
  }else if(strcmp(type, "infunc") ==0) {
	return INFUNC;
  }else if(strcmp(type, "cflow") == 0) {
	return CFLOW;
  }else if(strcmp(type, "intype") == 0) {
	return INTYPE;
  }else if(strcmp(type, "try") == 0) {
	return TRY;
  }else if(strcmp(type, "get") == 0) {
	return GETPC;
  }else if(strcmp(type, "set") == 0) {
	return SETPC;
  }else if(type) {
	return PCNAME;
  }else {
	assert(0);
  }
}

/************************************************/
/* push */
//index = 0: left child
//index = 1: right child
void pushAChildForCompPC(long index) {
        struct Record * tmp;

	if(pCutInfo->type == UNKNOWN_PC) return;

        assert(index == 0 || index == 1);

	tmp = (struct Record *)createNewRecord(count++);

        switch(pCutInfo->type) {
		case COMP_NOT : case NAMEDPC : case CFLOW : case TRY:
                	pCutInfo->info.childPC = tmp;
			break;
		case COMP_AND : case COMP_OR :
                	pCutInfo->info.childPCs[index] = tmp;
			break;
		default:
			assert(0);
	}

	tmp->parentPC = pCutInfo;

        //pushing it on stack means the pCutInfo should point to the new record
        pCutInfo = tmp;
}


/***********************************************/
/* pop */
void popChild() {
	if(pCutInfo->type == UNKNOWN_PC) return;

	//poping a child means the pCutInfo should point back to the parent
	if(pCutInfo->type == CFLOW && pCutInfo->parentPC->type == CFLOW) {
		ERR(nested_cflow, );
	}

	pCutInfo = pCutInfo->parentPC;
}



/**********************************************/
/* semantic check */
void assertNotINFILE() {
	if(pCutInfo && pCutInfo->type == INFILE) {
		ERR(not_string_literal_infile, );
	}
}




#ifdef UT_AC_DEBUG
/*********************************************/
/* print */
void printParameters(struct Param * p) {
	printf("param = ");
        if(p == NULL) printf("none\n");
        else {
             while(p) {
               printf(" %s %s ,", p->type, p->id);
               p = p->next;
             }
        }
        printf("\n");
}


//print out the content of a record
void printRecord(struct Record *ptr){
  int i = 1;
  struct advice * oneAdvice;
  struct Param * oneParam;
  printf("pointcut info:\n");
  if(ptr->type == CALL || ptr->type == CALLP || ptr->type == EXECUTION || ptr->type == GETPC || ptr->type == SETPC) {
	printf("id: %d, name: %s, type: %s, funcName: %s \n", ptr->id, ptr->name, getPointCutTypeText(ptr->type), (ptr->info.mInfo)->funcName);
  }else
  if(ptr->type == ARGS) {
        printf("id: %d, name: %s, type: %s \n", ptr->id, ptr->name, getPointCutTypeText(ptr->type));
	printParameters((struct Param*)(ptr->info.mInfo->p));
  }
  else
  if(ptr->type == RESULT) {
      printf("id: %d, name: %s, type: %s \n", ptr->id, ptr->name, getPointCutTypeText(ptr->type));
      printParameters((struct Param*)(ptr->info.mInfo->p));
  }
  else
  if(ptr->type == INFILE) {
      printf("id: %d, name: %s, type: %s \n", ptr->id, ptr->name, getPointCutTypeText(ptr->type)
);
      printf("infile = %s \n", ptr->info.inside);
  }
  else
  if(ptr->type == INFUNC) {
      printf("id: %d, name: %s, type: %s \n", ptr->id, ptr->name, getPointCutTypeText(ptr->type)
);
      printf("infunc = %s \n", ptr->info.inside);
  }
  else
  if(ptr->type == COMP_AND) {
	printf("id: %d, name: %s, type: %s\n", ptr->id, ptr->name, "comp_and");
	printf("left child : \n");
	printRecord(ptr->info.childPCs[0]);
	printf("\n");
	printf("right child : \n");
        printRecord(ptr->info.childPCs[1]);
        printf("\n");
  }else if(ptr->type == COMP_OR) {
	printf("id: %d, name: %s, type: %s\n", ptr->id, ptr->name, "comp_or");
        printf("left child : \n");
        printRecord(ptr->info.childPCs[0]);
        printf("\n");
        printf("right child : \n");
        printRecord(ptr->info.childPCs[1]);
        printf("\n");
  }else if(ptr->type == COMP_NOT) {
	printf("id: %d, name: %s, type: %s\n", ptr->id, ptr->name, "comp_not");
	printf("child : \n");
	printRecord(ptr->info.childPC);
	printf("\n");
  }else if(ptr->type == NAMEDPC) {
        printf("id: %d, name: %s, type: %s\n", ptr->id, ptr->name, "named_pointcut");
        printf("child : \n");
        printRecord(ptr->info.childPC);
        printf("\n");
  }else if(ptr->type == PCNAME) {
        printf("id: %d, name: %s, type: %s\n", ptr->id, ptr->name, "pointcut_name");
        printParameters((struct Param*)(ptr->info.mInfo->p));
        printf("\n");
  }else if(ptr->type == CFLOW) {
	printf("id: %d, name: %s, type: %s\n", ptr->id, ptr->name, "cflow");
	printf("child : \n");
        printRecord(ptr->info.childPC);
        printf("\n");
  }else if(ptr->type == TRY) {
        printf("id: %d, name: %s, type: %s\n", ptr->id, ptr->name, "try");
        printf("child : \n");
        printRecord(ptr->info.childPC);
        printf("\n");
  }else if(ptr->type == INTYPE) {
	printf("id: %d, name: %s, type: %s\n", ptr->id, ptr->name, "intype");
	printParameters((struct Param*)(ptr->info.mInfo->p));
  }else {
        assert(0);
  }

  printf("related advice:\n");
  if(ptr->aList == NULL) {
	printf("no advice\n");
  }else {
	oneAdvice = ptr->aList;
        if(oneAdvice) {
		printf("%d: advice function name = %s, type = %s \n", i, oneAdvice->name, getAdviceText(oneAdvice->type));
		printParameters((struct Param*)(oneAdvice->p));
        }
  }

  printf("-----------------------------\n\n");

}

//print the content of the list of records
void printRecordList(struct Record *head){
   struct Record *ptr;

   ptr = head;

   while(ptr != NULL){
   	  printRecord(ptr);
   	  ptr = ptr->next;
   }
}

void printCFlowRecordList(struct CFlowRecord * head) {
   if(head == NULL) return;

   printf("cflow:\n\t funcname = %s \n", head->pc->cflowFuncName);
   printf("\t pointcut info :");
   printRecord(head->pc);
   printf("\n");
   printCFlowRecordList(head->next);



}

#endif
