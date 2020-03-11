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
#ifndef UTAC_TAG_H
#define UTAC_TAG_H

//define tags inserted by ACC compiler

#define JOINPOINT_STR \
	"struct JoinPoint { \n\tvoid** (*fp) (struct JoinPoint *);\n\tvoid ** args;\n\tint argsCount;\n\tconst char ** argsType;\n\t void * (*arg)(int, struct JoinPoint *); \n\t const char * (*argType)(int , struct JoinPoint *); \n\tvoid ** retValue;\n\tconst char * retType;\n\tconst char * funcName ;\n\tconst char * targetName ;\n\tconst char * fileName ;\n\tconst char * kind ;\n\tvoid * excep_return ;\n};\n\n struct __UTAC__EXCEPTION {\n\tvoid * jumpbuf ;\n\tunsigned long long int prtValue ;\n\tint pops;\n\tstruct __UTAC__CFLOW_FUNC {\n\t\tint (*func)(int,int) ;\n\t\tint val ;\n\t\tstruct __UTAC__CFLOW_FUNC * next; \n\t} * cflowfuncs; \n}; \n" 


#define EXEC_WRAPPER_MACRO "UTAC__EXEC__WRAPPER__FUNC__"
#define CALL_WRAPPER_MACRO "UTAC__CALL__WRAPPER__FUNC__"

#define EXEC_ORI_NAME "utac__exec__ori"
#define EXEC_WRAPPER_NAME "utac__exec__wrapper"
#define CALL_WRAPPER_NAME "utac__call__wrapper"

#define UTAC_ADVICE_NAME_PREFIX "utac_acc"

#define HAS_PROCEED_TAG "UTAC__HASAPROCEED__"

//these two must keep same length
#define NOPARAM_TAG "UTAC__NOPARAM"
#define HSPARAM_TAG "UTAC__HSPARAM"

#define ACLINE "UTAC__ACLINE__"
#define ADVICE_FUNC_BEGIN_TAG "/* UTAC__ADVICEFUNCDECL__BEGIN__ */"
#define ADVICE_FUNC_END_TAG   "/* UTAC__ADVICEFUNCDECL__END__ */" 

#define STARTNEWFUNCTAG   "/* UTAC__START__FUNCTAG__ */"
#define ENDNEWFUNCTAG     "/* UTAC__END__FUNCTAG__ */"

//argument name used in generating an advice call
#define ADVICE_ARGUMENT "__utac__ad__arg"

//
#define UTACSRCLINE    "UTAC__ORISRC__LINE__"

//name used in generating a call for an around advice with proceed, or setting up argument types for the thisJoinpoint
#define JOINPOINT_VAR "this" 
#define JOINPOINT_ARG "__utac__arg"
#define JOINPOINT_ARGS "__utac__args"
#define JOINPOINT_RETP "__utac__retp"
#define JOINPOINT_RET  "__utac__ret"
#define JOINPOINT_ARGTYPE "__utac__argtype"
#define JOINPOINT_ARGSTYPE "__utac__argstype"

//declaration for the function retrieving argument value and type
#define JOINPOINT_ARG_FUNC_DECL "void * __utac__get_this_arg (int, struct JoinPoint *) "
#define JOINPOINT_ARG_FUNC_NAME "__utac__get_this_arg"
#define JOINPOINT_ARGTYPE_FUNC_DECL "const char * __utac__get_this_argtype (int, struct JoinPoint *) "
#define JOINPOINT_ARGTYPE_FUNC_NAME "__utac__get_this_argtype"


#define GENDECL_END "__END__"

//default name for parameter in the function declaration
#define PARAM_NAME "__utac__para"

#define FP_PARAM_NAME "__utac__fp__para"
#define FP_NAME       "__utac__fp__name"

//cflow support
#define CFLOW_FUNC_NAME "__utac__cflow"
#define CFLOWINCREASE 1
#define CFLOWDECREASE 2
#define CFLOWQUERY 3
#define CFLOWSETLEVEL 4

#define CFLOWSETCONTEXT 1
#define CFLOWGETCONTEXT 2

#define UTAC_CFLOW_FUNCS_BEGIN "__utac__cflow_funcs_begin"
#define UTAC_CFLOW_FUNCS_END   "__utac__cflow_funcs_end"


//type insertion tag
#define TYPEINSERTIONBEGIN "#__utac__type__insertion@"

#define INTRODUCEBEGIN_TAG     "/* __utac__introduce__begin@ */"
#define INTRODUCEEND_TAG       "/* __utac__introduce__end@   */"
#define NONAMETAG   "#__utac_noname__type"

//variable holding the longjmp buf inside thisJoinPoint
#define JMPENV   " this->excep_return "

#define JMPPOPS  " ((struct __UTAC__EXCEPTION *)(this.excep_return))->pops "


//variable holding the target for preturn()
#define JMPENVVAR  "__utac__jmpbuf"
#define JMPRETVAR  "__utac__jmp_ret"

//declaration for the function registering cflow function into an ACC exception struct 
#define EXCEP_CF_SET_DECL "void __utac__exception__cf_handler_set(void * exception, int (*cflow_func)(int, int), int val) "
#define EXCEP_CF_SET_NAME "__utac__exception__cf_handler_set"
#define EXCEP_CF_RESET_DECL "void __utac__exception__cf_handler_reset(void * exception)"
#define EXCEP_CF_RESET_NAME "__utac__exception__cf_handler_reset"

#define EXCEP_CF_FREE_DECL "void __utac__exception__cf_handler_free(void * exception)"
#define EXCEP_CF_FREE_NAME "__utac__exception__cf_handler_free"


#define UTAC_EXCEP_VAR "__utac__excep_var"
#define UTAC_EXCEP_PARAM_NAME "__utac__excep_para"

#define TRY_JMPBUF "__utac__try_jmpbuf"
#define TRY_RETVAR "__utac__try_jmp_ret"
#define TRY_EXCEPV "__utac__try_exception"

#define TRY_EXCEP_POPLEVEL "__utac__try_poplevel"
#define TRY_EXCEP_MASK "__utac__try_mask"


//declaration for the error stack management function 
#define ERRSTACKMGT_DECL "void * __utac__error_stack_mgt(void * env , int mode, int count) "
#define ERRSTACKMGT_NAME "__utac__error_stack_mgt"
#define ERRSTACK_PUSH 0
#define ERRSTACK_POP 1
#define ERRSTACK_TOP 2

//literal for the tag
#define mkstr(a) #a
#define LIT(x) mkstr(x)


//a macro to check whether a tag appears
#define HASTAG(line, tag) \
	(strstr(line, tag) && !strstr(line, LIT(tag)))


//size for various buffer

#define OutBufSize 60000
#define FlushPos 4000
#define DECLARATION  2000
#define TEMPFILENAMELEN 500
#define ONEFUNCDEFINITION 6000
#define NAMELEN 300
#define GENDECLSIZE 1000
#define ONELINE GENDECLSIZE

#define ACTYPEINSERTBEGIN "__ac__type__insert@"
#define ACTYPEINSERTEND   "__ac__type__insert__end@"

// error messages
#define syn_error -1
#define undefined_pointcut 0
#define no_wildcard_in_callp 1
#define no_return_type_for_advice 2
#define invalid_pointcut_name 3
#define redefine_pointcut_name 4 
#define advice_param_not_used 5
#define advice_param_multi_used 6
#define undeclared_id 7
#define invalid_intype 8
#define invalid_introduce 9
#define unmatched_type 10
#define invalid_proceed 11
#define invalid_match_address 12
#define unknown_advice 13
#define nested_cflow 14
#define not_string_literal_infile 15
#define wrong_keyword 16
#define multi_param_for_pointcut 17
#define try_catch_mismatch 18
#define catch_wrong_param 19

extern char * errmsg_fmt[];


#define ERR(id, ret ) \
	sem_error (id, errmsg_fmt[id]) ; \
	return ret

#define ERR_I(id, para, ret ) \
	sem_error_i (id, errmsg_fmt[id], para ) ; \
	return ret 

#define ERR_II(id, para1, para2, ret ) \
	sem_error_ii (id, errmsg_fmt[id], para1, para2 ); \
	return ret


#endif
