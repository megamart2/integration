
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


# 1 "t1mc_mc.c" 
# 1 "<built-in>" 
# 1 "<command-line>" 
# 1 "t1mc_mc.c" 
void foo(char *a)  
# 36 "t1mc.c"
{



# 41 "t1mc.c"
{

#line 2 "t1mc_mc.c"
printf("inside foo, a = %s\n", a); 
# 46 "t1mc.c"

}

# 50 "t1mc.c"

}
 
static inline void  foo__t1mc__0 (char* a  )  ; 

#line 5 "t1mc_mc.c"
void foo2()  
# 58 "t1mc.c"
{



# 63 "t1mc.c"
{

#line 6 "t1mc_mc.c"
printf("in foo2, call foo\n"); 
#line 7 "t1mc_mc.c"
foo__t1mc__0("ABCDE\n"); 
# 70 "t1mc.c"

}

# 74 "t1mc.c"

}
  void __utac_acc__t1ac__2 (void);

  void foo (char* a  ) ; 

# 81 "t1mc.c"
static inline void  foo__t1mc__0 (char* a  ) {

{
__utac_acc__t1ac__2();

}
foo ( a ) ;  
}
 
static inline void  foo__t1mc__1 (char* a  )  ; 

#line 10 "t1mc_mc.c"
int main()  
# 95 "t1mc.c"
{
# 97 "t1mc.c"
int retValue_acc;




# 103 "t1mc.c"
{

#line 11 "t1mc_mc.c"
foo__t1mc__1("abcde"); 
#line 12 "t1mc_mc.c"
foo2(); 
#line 13 "t1mc_mc.c"

# 112 "t1mc.c"
retValue_acc = 0;
# 114 "t1mc.c"
return (int )retValue_acc;
 
# 117 "t1mc.c"

}

# 121 "t1mc.c"
return (int )retValue_acc;

# 124 "t1mc.c"

}
  void __utac_acc__t1ac__1 (void);

  void foo (char* a  ) ; 

# 131 "t1mc.c"
static inline void  foo__t1mc__1 (char* a  ) {

{
__utac_acc__t1ac__1();

}
foo ( a ) ;  
}
 
