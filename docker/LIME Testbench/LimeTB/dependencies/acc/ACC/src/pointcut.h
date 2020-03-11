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
#ifndef POINTCUT_H
#define POINTCUT_H

#include "symboltable.h"
#include "utac_tag.h"

#include <assert.h>

#define MYFREE(p) \
	if(p) free(p)

#define SET(x) state |= x 
#define GET(x) ( state & x ? TRUE : FALSE) 
#define CLR(x) state &= ~x


//COMPOUND pointcut is for user defined pointcuts, which are based on 
//the primitive pointcuts. Other pointcuts are primitive pointcuts.
typedef enum {CALL, EXECUTION, CALLP, ARGS, RESULT, INFILE, INFUNC, INTYPE, COMPOUND, COMP_AND, COMP_OR, COMP_NOT, NAMEDPC, PCNAME, CFLOW, TRY, GETPC, SETPC, UNKNOWN_PC} PointcutType;

typedef enum {BEFORE, AFTER, AROUND, INTRODUCE, CATCH, ADFORNAMEDPC, ADBEFORECFLOW, ADAFTERCFLOW, ADARGSCFLOW, ADBEFORETRY, ADAFTERTRY, UNKNOWN_AD } AdviceType;

typedef enum {PROCEED, PRETURN, THROW, THIS, ARG, ARGTYPE, UNKNOWN_ADKEYWORD} AdviceKeyword;
 
#define TRUE 1 
#define FALSE 0
#define UNKNOWN 2

//this pattern can match any single item 
#define ANY "$"
#define ANYC '$'

//this pattern can match any list
#define ANYLIST "..."

#define RETVALUE "retValue_acc"     // name of the variable to hold return value. AC compiler will genrate it for each function

// for an parameter of an advice function, it must correspond to an argument of an function,
// the trick thing is that for different function, the index of the corresponding argument may be
// different, 
// eg. before(int x): args(int, ..., x) {}
// 
// void foo(int a, int b, int c) { }   <-- when matching foo, the index of "x" is 3
// void faa(int a, int b, char c, char * d, int e) {} <-- when matching faa, the index of "x" is 5

// A special case, when index = 0, it always corresponds to the return value
struct argIndexInContext {	
	struct Context * c;     
	int argIndex;           
	struct argIndexInContext * nextContext;
};


/***********************/
struct jpInfo {
        	char * name;
        	long pos;
        	PointcutType type;
        	struct jpInfo * next;
  	};


/*********************************/


//a parameter for an advice, eg. before(int x, int y): ... 
//different from normal parameter, it has to link with an argument in the programing context
struct adviceParam {
	struct Param p;
	struct argIndexInContext * indexInContext;
	char * callCflowContextFunc; /* some advice parameter's value should be retrived from the point when cflow() happens, like: before(int x): cflow(call(foo) && args(x)) && call(foo2) , where x is not the parameter of foo2, but the parameter of foo. x's value should be got by calling a function */
 
	boolean matchAddress ;	     //whether match the address of an argument
	boolean usedInPC;            //whether it is used in the pointcut
	struct adviceParam * next;
};


//todo: consider separate around advice from before and after advice, because the rtType and hasProceed flag is around advice specific, 
//it is not good to include them in before and after advice
struct advice {
  char *name; 			//the compiled function name
  char *rtType;                //return type
  AdviceType type;
  struct adviceParam *p ; 	
  int malInfo;
  char * acFileBaseName;	//name of the aspect file which contains this advice  
  char * cflowCondition;  
	
};


// a list of advices
struct AdviceQueue{
   struct advice *data;
   struct AdviceQueue *next;
   boolean emitCond;
};


//a parameter inside a pointcut
//Two kinds of parameter:
//1. call(void foo(int x, int y)) 
//2. args(int , x);

//for the second type, it has to link with an advice parameter
struct pointcutParam {
	struct Param p;
        struct adviceParam * ap;
        struct pointcutParam * next;
}; 

struct matchInfo{
  char *funcName;
  char *rtType;
  struct pointcutParam *p ;  	//for each matching, a list of types for parameters 
};


union MatchingInfo {
        struct matchInfo * mInfo;       // for a primitive pointcut
        struct Record * childPCs[2];    // for a binary compound pointcut, like a && b;
        struct Record * childPC;        // for a unary compound pointcut, like !
	char * inside;			// infile and infunc shares 1 pointer
};

//one record for each pointcut
struct Record {
  int id;
  char *name;
  PointcutType type;
  struct advice *aList;
  struct Record *next;      	//next pointcut in the pointcut table
  union MatchingInfo info;  	
  struct Record *parentPC;  	//parent pointcut within a compound pointcut
  char * cflowFuncName;
};

//the location where cflow handling function should be inserted
struct ArgsInCflow {
	struct Record * pc;
	char * funcName;
	struct ArgsInCflow * next;
};

struct CFlowRecord {
        struct Record * pc;
        struct CFlowRecord * next;
        struct ArgsInCflow * argsPCs;           // a list of args() pointcuts inside cflow
                                                // it is special because their context exposure
                                                // happens when cflow() is initialized
        boolean notPrinted;
};

/* each TryRecord has 1 catch advice */
struct TryRecord {
        struct Record * pc;
        struct TryRecord * next;
        struct advice * ad;
};

//context of a join point
struct Context {
	long   insideFile;
	char * insideFunc;
	char * funcName;
	PointcutType type;	//only support CALL, EXECUTION
	char * rtType;
	struct Param * p;	//parameter list
			
	struct AdviceQueue * before_advices;        //a list of before advices matching this context, (either call or execution) 
        struct AdviceQueue * after_advices;
        struct AdviceQueue * around_advices;
        int malInfo ;  
	long numOfCH ; 
}; 

//context for a call join point
struct CallContext {
	struct Context context;
	char * newFuncName;	// the generated function name 
	struct CallContext * next; 
};

extern struct Record *pCutInfo;
extern struct Record *PointCutTable;//contain the collected pointcuts
extern struct CFlowRecord * cflowTable;
extern struct TypedefInfo * typedefTable;
extern struct TryRecord * tryTable;
extern char * currTypeQualifier ; 

void addPointCutType2Current(char *type);
void addNewAdvice(struct advice **head); 
void addPointCutToCFlowTable(struct Record * pc);
struct ArgsInCflow * addArgsPCsInCFlow(struct Record * pc, char * baseFuncName, int * index);


void startPointcutInfo();
void startAdFuncHeader();
void startAdReturnType();
void startJPReturnType();
void startAdFunctionBD();
void startGetDynInfo();

void endPointcutInfo();
void endAdFuncHeader();
void endAdReturnType();
void endJPReturnType();
void endAdFunctionBD();
void endPointcutName();
void endGetDynInfo();


void isPointcutInfo(long *flag);
void isAdFuncHeader(long *flag);
void isAdFunctionBD(long *flag);


void assertKeyword(char * s, char * keyword); 
void assert2Keywords(char * s, char * keyword1, char * keyword2);
void checkKeywordInAdvice(char *s, long * flag);


struct Record * createNewRecord(int id);
char * createAdName(char *fname, int counter);
void createNewArgIndex(struct adviceParam * adParam, struct Context *, int initValue);
void createPointcutMatchingInfo(struct checkFrame * cf);
struct adviceParam * create_advice_parameter(struct Param * p);
struct argIndexInContext * copy_argindex_incontext(struct argIndexInContext *);
char * create_dot_types(struct Param * p);


void setACName(char * id);
void setACType(char * t);
void setACComplexType(long type, char *t);
void setACTypePointer();
void setAdviceType(char *);
void resetCurrParamAndType() ;
void resetAdviceCounter();
void setInsideFile(char *);
void setPointcutName(char * s);


char *getPointCutTypeText(PointcutType p);
char *getAdviceText(AdviceType a);
void getAdviceName(char **);   
struct advice * getCurrAdvice();


struct Param * findParam(struct Param * head, char * name);
struct Record * findPointcut(struct Record * head, char * name);
struct CFlowRecord * findPointcutInTable(struct CFlowRecord * head, struct Record * target);

boolean hasIntypePCOnly(struct Record * pc) ;
boolean hasTryPCOnly(struct Record *pc);


AdviceType text2AdviceType(char *type);
PointcutType text2PointcutType(char *type);

void pushAChildForCompPC(long index) ;

void popChild();

void outputAdviceFuncBeginTag();
void outputAdviceFuncEndTag();

void endACParamDeclCollection(); 


void free_pointcut(struct Record *);
void free_matchinginfo_struct(struct matchInfo * info);
void free_pointcut_param(struct pointcutParam * pp);
void free_matchinginfo(struct Record * rec) ;
void free_advices(struct advice * a);
void free_advice_param(struct adviceParam *p) ;
void free_argIndexInContext(struct argIndexInContext * arg);
void free_cflowTable(struct CFlowRecord *);
void free_tryTable(struct TryRecord *);

char * checkContextExposureInCflow(struct Record *pc, char * fName, int * index);


#ifdef UT_AC_DEBUG
void printParameters(struct Param * p);
void printRecord(struct Record *ptr);
void printRecordList(struct Record *head);
void printCFlowRecordList(struct CFlowRecord * head);

#endif

#endif
