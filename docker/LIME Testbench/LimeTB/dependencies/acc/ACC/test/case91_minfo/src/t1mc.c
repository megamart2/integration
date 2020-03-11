
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


#line 1 "t1mc.mc"
void foo()  
# 33 "t1mc.c"
{



# 38 "t1mc.c"
{

# 41 "t1mc.c"

}

# 45 "t1mc.c"

}
 
static inline void  foo__t1mc__0 (void)  ; 

#line 5 "t1mc.mc"
int main()  
# 53 "t1mc.c"
{
# 55 "t1mc.c"
int retValue_acc;




# 61 "t1mc.c"
{

#line 6 "t1mc.mc"
foo__t1mc__0(); 
# 66 "t1mc.c"

}

# 70 "t1mc.c"
return (int )retValue_acc;

# 73 "t1mc.c"

}
  void __utac_acc__t1ac__1 (void);

  void __utac_acc__t2ac__1 (void);

  void foo () ; 

# 82 "t1mc.c"
static inline void  foo__t1mc__0 (void) {

{
__utac_acc__t1ac__1();

}
foo ( ) ;  

{
__utac_acc__t2ac__1();

}
}
 
