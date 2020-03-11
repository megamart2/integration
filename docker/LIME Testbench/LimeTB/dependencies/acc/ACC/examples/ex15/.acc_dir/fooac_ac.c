
struct JoinPoint { 
	void** (*fp) (struct JoinPoint *);
	void ** args;
	int argsCount;
	const char ** argsType;
	 void * (*arg)(int, struct JoinPoint *); 
	 const char * (*argType)(int , struct JoinPoint *); 
	void ** retValue;
	const char * retType;
	const char * funcName ;
	const char * targetName ;
	const char * fileName ;
	const char * kind ;
	void * excep_return ;
};

 struct __UTAC__EXCEPTION {
	void * jumpbuf ;
	unsigned long long int prtValue ;
	int pops;
	struct __UTAC__CFLOW_FUNC {
		int (*func)(int,int) ;
		int val ;
		struct __UTAC__CFLOW_FUNC * next; 
	} * cflowfuncs; 
}; 

extern void __utac__exception__cf_handler_set(void * exception, int (*cflow_func)(int, int), int val) ; 
extern void __utac__exception__cf_handler_free(void * exception);
extern void __utac__exception__cf_handler_reset(void * exception) ; 
extern void * __utac__error_stack_mgt(void * env , int mode, int count) ;

#include <setjmp.h> 


# 1 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/fooac.acc" 
# 1 "<built-in>" 
# 1 "<command-line>" 
# 1 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/fooac.acc" 
 inline void __utac_acc__fooac_ac__1(void) { 



#line 2 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/fooac.acc"
printf("aspect, throw exception 3 before calling foo2\n"); 
#line 3 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/fooac.acc"

{ jmp_buf * p; 
 struct __UTAC__EXCEPTION * excep = (struct __UTAC__EXCEPTION *)__utac__error_stack_mgt(0, 1, 1 ) ; 
 p = (jmp_buf*)(excep->jumpbuf); 
longjmp(*p, 3);}; 
#line 4 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/fooac.acc"
printf("end of aspect\n"); }

 
#line 7 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/fooac.acc"
 inline void __utac_acc__fooac_ac__2(int e) {



#line 8 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/fooac.acc"
printf("catch exception = %d when calling foo\n", e); }

 



