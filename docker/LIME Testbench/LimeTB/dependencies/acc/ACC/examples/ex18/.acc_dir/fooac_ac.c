
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



# 1 "/home/kee/examples/ex18/fooac.acc" 
# 1 "<built-in>" 
# 1 "<command line>" 
# 1 "/home/kee/examples/ex18/fooac.acc" 
 inline void __utac_acc__fooac_ac__1(   struct JoinPoint *  this  )  {
 


#line 2 "/home/kee/examples/ex18/fooac.acc"
printf("%s \" %s \" in function %s \n", (this->kind), (this->targetName), (this->funcName)); 
#line 3 "/home/kee/examples/ex18/fooac.acc"
printf("\" %s \" parameter type: \n", (this->targetName)); 
#line 4 "/home/kee/examples/ex18/fooac.acc"
if ((this->argsCount) == 0){
printf("no parameter \n"); }else{
{ 
#line 6 "/home/kee/examples/ex18/fooac.acc"

#line 6 "/home/kee/examples/ex18/fooac.acc"
int i;
#line 7 "/home/kee/examples/ex18/fooac.acc"
for(i = 1;i <= (this->argsCount);i++) { { 
#line 8 "/home/kee/examples/ex18/fooac.acc"
printf("arg[%d] = %s  ", i, (this->argType)(i , this ) ); 
#line 10 "/home/kee/examples/ex18/fooac.acc"
if (strcmp((this->argType)(i , this ) , "int") == 0){
{ 
#line 11 "/home/kee/examples/ex18/fooac.acc"
printf(", value = %d ", (*((int *)((this->arg)(i , this ) )))); } }else{
if (strcmp((this->argType)(i , this ) , "double") == 0){
{ 
#line 13 "/home/kee/examples/ex18/fooac.acc"
printf(", value = %.2f ", (*((double *)((this->arg)(i , this ) )))); } }}
#line 16 "/home/kee/examples/ex18/fooac.acc"
printf("\n"); } } } }
#line 20 "/home/kee/examples/ex18/fooac.acc"
printf("return type = %s \n \n", (this->retType)); }

 



