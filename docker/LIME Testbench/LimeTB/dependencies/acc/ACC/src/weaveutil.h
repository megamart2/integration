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
#ifndef WEAVEUTIL_H
#define WEAVEUTIL_H

#include "pointcut.h"

struct Scope {
	struct Scope * parent;
	struct ScopeSym {
		struct FuncInfo * sym;
		int oriInfo;
		struct ScopeSym * next;
	} * syms;
};

extern char *rtType;

void setRtType(char *t);
void setFuncId(char *id);
void endFuncCollection();
void setCurrentExecContext(char * c);
void setFuncDefinition();
void setTypedefTargetName();
void setDeclaratorTarget(char * );

void unsetDeclaratorTarget();
void unsetFuncDefinition();

boolean isAFuncDefinition();
void isCallMatch(long *flag);
void isPointcutExist(long *flag);

void get_curr_func_name(char ** f);
void getCurrentExecContext(char **c);
char * getOneParam(char ** ptr);


void addMatchedCallContexts(struct CallContext **head, struct CallContext *d);

void initFuncCollection();
void initFuncCalls();
void StartCallMatch();
void startNewFuncDefn(char *);


void EndCallMatch();
void endNewFuncDefn();

void enqueueAdvice(struct AdviceQueue **head, struct advice *data, boolean);
void newEnqueueAdvice(AdviceType aT, struct Context *c, struct advice *data, boolean);

void appendAdvice(AdviceType aT, struct Context *c, struct advice *data);

void insert_advice(AdviceType type, char *, long *);
void insert_one_advice(struct advice * d, struct Context * c, boolean );
void insert_call_bodys();
void insert_advice_with_context(struct AdviceQueue * , struct Context * , boolean, boolean);
void insert_advice_for_args_in_cflow(struct ArgsInCflow * pc, struct Context * context);

void delCurrentExecContext();

char * output_one_param(struct adviceParam * param, struct Context * context, int index);
void outputUserReturn();
void outputReturn();
void outputReturnDecl();
void outputReturnDeclInContext(struct Context *);
void outputReturnAssign();
void outputReturnAssignInContext(struct Context * );
char * outputReturnInContext(struct Context *, int, char *);
void outputExceptionHandlerVars(struct Context * c);
char * output_one_advice_declaration(struct advice * ad, boolean, char * );
void output_cflow_function();
void output_exception_cflow_handler_func_decl() ;
void output_one_cflow_func(struct CFlowRecord * rec);
void outputTypeInsertionMarker(char *);
void outputTypeInsertionMarkerInAC(char *);
void output_one_marker(char *);
void outputTypeInsertionMarkers(char * buf);
void outputJoinPointStrDecl();
void output_extra_args(int separator);
char * output_one_variable_in_cflow_context(struct adviceParam * ap, int index);
void output_one_cflow_context_func(struct ArgsInCflow * arg);

void outputWithSrcLine(char *);


void genCallBody(struct CallContext * callContext);
void genNewProceedCall ();
void genNewPreturnCall ();
void enclosePreturnCall ();
void genNewThrowCall ();
void genNewWrapperFunction(struct Context * c);
char * genFuncDecl(char *fName, char * retType, struct Param * p, char * buf, int malInfo);
char * genFuncCall(char *fName, struct Param *p, char *buf);
char * genTransWrapperFunction(struct AdviceQueue * aQ, struct Context * c);
char * genSrcLineInfo(char * buf);



void buildGenFuncDecl(char * buf, struct CallContext * c);
void buildJoinPointContext(long srcinfo , char * infuncName, char * funcName, char * type, char ** context);
void buildType(long type, char * tag, char ** name);
char * buildParamDecl(char * buf, char * type, char * id);
void build_func_pointer_type_decl(char * buf, struct CallContext * c) ;


void match_call_join_point(char * context, char * realName, char **newFuncName);
void match_get_join_point(char * context, char * realName, char **newFuncName);
void match_set_join_point(char * context, char * realName, char **newFuncName);
boolean match_pointcut_type(PointcutType pattern, PointcutType realJoinPoint);
void match_join_point(char * context, long * findAMatch);
boolean match_pointcut_with_jp(struct Record * pc, struct Context * context, char **);
boolean match_name(char * pattern, char * name) ;
boolean match_type(char * type1, char * type2) ;
boolean match_parameters(struct pointcutParam * paramPattern, struct Param * param, boolean extractParam, int currIndex, struct Context *);
boolean match_one_parameter(struct Param * paramPattern, struct Param * param, boolean extractParam, int currIndex, struct Context *);
boolean match_pointcut(struct Record * pc1, struct Record * pc2) ;
void match_intype_join_point(char *, char **);
boolean match_typedef_name(char * name1, char * source);



void free_context(struct Context * temp);
void free_call_context(struct CallContext * temp);
void free_all_queues();
void free_parameters(struct Param * head);
void free_advice_queue(struct AdviceQueue * queue);
void free_intype_context(struct Context *);
void free_scope(struct Scope * s) ;
void free_scope_syms(struct ScopeSym *ss);


struct Param * find_parameter_by_index(struct Param * head, int index);
struct Param * find_parameter_by_type(struct Param * target, struct Param * head, int * indexIncrease );
struct argIndexInContext * findArgIndexInContext(struct argIndexInContext * head, struct Context * c);



void logAroundDeclaration();
void logWrapperFunction(struct AdviceQueue * aQ, struct Context * c, char * preBuf );
void logSetjmp(char *);
void needLogSetjmp(long *);


void enterStrDecl();
void leaveStrDecl();

void setCollectFuncName();
void unsetCollectFuncName();

void setFirstDeclarator();
void unsetFirstDeclarator();
void isFirstDeclarator(long *);

struct advice * create_advice_for_args_in_cflow(struct ArgsInCflow * p, struct Context * c);

void append_cflow_func(struct advice * ad, char * buf, int * oldLen, int maxLen);

/* mwgong todo: consider combining following functions */
void enterScope();
void leaveScope();
void isInLoFcalScope(long *);
void incrLVal();
void decrLVal();
void isLVal(long*);
void incrDisableGet();
void decrDisableGet();
void isDisableGet(long *);
void incrMatchedPC();
void decrMatchedPC();
void hasMatchedPC(int *);

#endif
