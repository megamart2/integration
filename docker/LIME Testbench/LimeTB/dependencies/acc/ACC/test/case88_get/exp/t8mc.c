
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


#line 2 "t8mc.mc"
int a; 
#line 3 "t8mc.mc"
int d; 
#line 4 "t8mc.mc"
int main()  
# 37 "t8mc.c"
{
# 39 "t8mc.c"
int retValue_acc;




# 45 "t8mc.c"
{

#line 5 "t8mc.mc"

#line 5 "t8mc.mc"
typeof (a) b;
#line 6 "t8mc.mc"

#line 6 "t8mc.mc"
int c;
#line 8 "t8mc.mc"
c = __alignof__ (a); 
#line 10 "t8mc.mc"
c = sizeof (a); 
#line 12 "t8mc.mc"
c = __builtin_offsetof (struct A  , a); 
# 62 "t8mc.c"

}

# 66 "t8mc.c"
return (int )retValue_acc;

# 69 "t8mc.c"

}
 
