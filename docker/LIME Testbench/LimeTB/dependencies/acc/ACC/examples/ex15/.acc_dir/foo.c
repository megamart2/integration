
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


# 1 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c" 
# 1 "<built-in>" 
# 1 "<command-line>" 
# 1 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c" 
int foo2(int i)  
# 36 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
{
# 38 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
int retValue_acc;




# 44 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
{

#line 2 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"
printf("\t\t\t in foo2\n"); 
#line 3 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"

# 51 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
retValue_acc = i;
# 53 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
return (int )retValue_acc;
 
# 56 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"

}

# 60 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
return (int )retValue_acc;

# 63 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"

}
 
static inline int  foo2__foo__0 (int i  )  ; 

#include <setjmp.h> 


#line 6 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"
int foo1(int i)  
# 74 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
{
# 76 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
int retValue_acc;




# 82 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
{

#line 7 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"
printf("\t\t in foo1\n"); 
#line 8 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"
foo2__foo__0(i); 
#line 9 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"
printf("\t\t end of foo1\n"); 
#line 10 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"

# 93 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
retValue_acc = i;
# 95 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
return (int )retValue_acc;
 
# 98 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"

}

# 102 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
return (int )retValue_acc;

# 105 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"

}
  void __utac_acc__fooac_ac__1 (void);

  int foo2 (int i  ) ; 

# 112 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
static inline int  foo2__foo__0 (int i  ) {

# 115 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
int retValue_acc;

{
__utac_acc__fooac_ac__1();

}

# 123 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
retValue_acc = foo2 ( i ) ;  

# 126 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
return (int )retValue_acc;
}
 
static inline int  foo1__foo__1 (int i  )  ; 

#line 13 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"
int foo(int i)  
# 134 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
{
# 136 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
int retValue_acc;




# 142 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
{

#line 14 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"
printf("\t in foo\n"); 
#line 15 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"
foo1__foo__1(i); 
#line 16 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"
printf("\t end of foo\n"); 
#line 17 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"

# 153 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
retValue_acc = i;
# 155 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
return (int )retValue_acc;
 
# 158 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"

}

# 162 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
return (int )retValue_acc;

# 165 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"

}
void __utac_acc__fooac_ac__2 (int  ) ;

;

  int foo1 (int i  ) ; 

# 174 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
static inline int  foo1__foo__1 (int i  ) {

# 177 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
int retValue_acc;
int __utac__try_mask = 0; 

 int __utac__try_jmp_ret_1 = 0; 
 jmp_buf __utac__try_jmpbuf_1 ; 
 struct __UTAC__EXCEPTION __utac__try_exception_1 = { & __utac__try_jmpbuf_1 , 0, 0 }; 
 
{

{ extern void * __utac__error_stack_mgt(void * env , int mode, int count)  ; 
int __utac__try_poplevel = 0 ; 
 int i = 0 ; 
__utac__error_stack_mgt ( & __utac__try_exception_1 , 0 , 1 ) ; 
__utac__try_mask |= 1 << (1 - 1 ) ; 
if (__utac__try_jmp_ret_1 = setjmp(__utac__try_jmpbuf_1)) { 
__utac__try_poplevel = 0; 
for(i = 1 - 1 - 1; i >= 0; i--) { 
 if(__utac__try_mask & ( 1 << i)) { __utac__try_poplevel ++ ; } 
 } 
 __utac_acc__fooac_ac__2 ( __utac__try_jmp_ret_1  ) ; 
__utac__error_stack_mgt ( & __utac__try_exception_1, 1 , __utac__try_poplevel ); 

# 200 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
return ( int  ) retValue_acc ; 

 } 
} 

}

# 208 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
retValue_acc = foo1 ( i ) ;  

{

{ extern void * __utac__error_stack_mgt(void * env , int mode, int count)  ; 
__utac__error_stack_mgt ( & __utac__try_exception_1, 1 , 1 ); 

}

}

# 220 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
return (int )retValue_acc;
}
 
#line 21 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"
int main()  
# 226 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
{
# 228 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
int retValue_acc;




# 234 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
{

#line 22 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"
printf("in main, call foo\n"); 
#line 23 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"
foo(1); 
#line 24 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"
printf("end of main\n"); 
#line 25 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/foo.c"

# 245 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
retValue_acc = 0;
# 247 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
return (int )retValue_acc;
 
# 250 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"

}

# 254 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"
return (int )retValue_acc;

# 257 "/home/kee/Desktop/ACCfinal/ACC/examples/ex15/.acc_dir/foo.c"

}
 
