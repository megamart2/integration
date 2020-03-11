
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
const int foo1(int a)  
# 33 "t1mc.c"
{
# 35 "t1mc.c"
int retValue_acc;




# 41 "t1mc.c"
{

#line 2 "t1mc.mc"
printf("inside foo1\n"); 
#line 3 "t1mc.mc"

# 48 "t1mc.c"
retValue_acc = 3;
# 50 "t1mc.c"
return (int const )retValue_acc;
 
# 53 "t1mc.c"

}

# 57 "t1mc.c"
return (int const )retValue_acc;

# 60 "t1mc.c"

}
 
#line 6 "t1mc.mc"
int foo2(const int a)  
# 66 "t1mc.c"
{
# 68 "t1mc.c"
int retValue_acc;




# 74 "t1mc.c"
{

#line 7 "t1mc.mc"
printf("inside foo2\n"); 
#line 8 "t1mc.mc"

# 81 "t1mc.c"
retValue_acc = 0;
# 83 "t1mc.c"
return (int )retValue_acc;
 
# 86 "t1mc.c"

}

# 90 "t1mc.c"
return (int )retValue_acc;

# 93 "t1mc.c"

}
 
#line 11 "t1mc.mc"
int foo3(const int *ap)  
# 99 "t1mc.c"
{
# 101 "t1mc.c"
int retValue_acc;




# 107 "t1mc.c"
{

#line 12 "t1mc.mc"
printf("inside foo3\n"); 
#line 13 "t1mc.mc"

# 114 "t1mc.c"
retValue_acc = 0;
# 116 "t1mc.c"
return (int )retValue_acc;
 
# 119 "t1mc.c"

}

# 123 "t1mc.c"
return (int )retValue_acc;

# 126 "t1mc.c"

}
 
#line 17 "t1mc.mc"
 __attribute__  (( const  )) int fooX(int a)  
# 132 "t1mc.c"
{
# 134 "t1mc.c"
int retValue_acc;




# 140 "t1mc.c"
{

#line 18 "t1mc.mc"
printf("inside fooX\n"); 
#line 19 "t1mc.mc"

# 147 "t1mc.c"
retValue_acc = 3;
# 149 "t1mc.c"
return (int )retValue_acc;
 
# 152 "t1mc.c"

}

# 156 "t1mc.c"
return (int )retValue_acc;

# 159 "t1mc.c"

}
 
static inline int  fooX__t1mc__3 (int a  )  ; 

  int fooX (int a  ) ; 
void ** fooX_utac__call__wrapper_t1mc_1 (struct JoinPoint * this);  
 

# 169 "t1mc.c"
void ** fooX_utac__call__wrapper_t1mc_1 (struct JoinPoint * this) { 
 
int * a0  = ( int *) (this->args[ 0 ]); 
  
int **  rp = (  int **)(this->retValue); 
int  temp ;  
temp =  fooX ( *a0 ); 
** rp = temp ;  
return this->retValue; 
} 
void ** fooX_utac__call__wrapper_t1mc_0 (struct JoinPoint * this);  
 
  int __utac_acc__t1ac__4 (  struct JoinPoint * );

void ** fooX_utac__call__wrapper_t1mc_0 (struct JoinPoint * this) { 
 
int **  rp = (  int **)(this->retValue); 
int  temp ;  
this->fp = &( fooX_utac__call__wrapper_t1mc_1 ) ; 
temp = __utac_acc__t1ac__4( this  ); 
 ** rp = temp ;  
return this->retValue; 
  }  


static inline int  foo3__t1mc__2 (int const* ap  )  ; 

  int foo3 (int const* ap  ) ; 
void ** foo3_utac__call__wrapper_t1mc_4 (struct JoinPoint * this);  
 

# 201 "t1mc.c"
void ** foo3_utac__call__wrapper_t1mc_4 (struct JoinPoint * this) { 
 
int const* * a0  = ( int const* *) (this->args[ 0 ]); 
  
int **  rp = (  int **)(this->retValue); 
int  temp ;  
temp =  foo3 ( *a0 ); 
** rp = temp ;  
return this->retValue; 
} 
void ** foo3_utac__call__wrapper_t1mc_3 (struct JoinPoint * this);  
 
  int __utac_acc__t1ac__5 (  struct JoinPoint * );

void ** foo3_utac__call__wrapper_t1mc_3 (struct JoinPoint * this) { 
 
int **  rp = (  int **)(this->retValue); 
int  temp ;  
this->fp = &( foo3_utac__call__wrapper_t1mc_4 ) ; 
temp = __utac_acc__t1ac__5( this  ); 
 ** rp = temp ;  
return this->retValue; 
  }  
void ** foo3_utac__call__wrapper_t1mc_2 (struct JoinPoint * this);  
 
  int __utac_acc__t1ac__3 (  struct JoinPoint * );

void ** foo3_utac__call__wrapper_t1mc_2 (struct JoinPoint * this) { 
 
int **  rp = (  int **)(this->retValue); 
int  temp ;  
this->fp = &( foo3_utac__call__wrapper_t1mc_3 ) ; 
temp = __utac_acc__t1ac__3( this  ); 
 ** rp = temp ;  
return this->retValue; 
  }  


static inline int  foo2__t1mc__1 (int const a  )  ; 

  int foo2 (int const a  ) ; 
void ** foo2_utac__call__wrapper_t1mc_6 (struct JoinPoint * this);  
 

# 246 "t1mc.c"
void ** foo2_utac__call__wrapper_t1mc_6 (struct JoinPoint * this) { 
 
int const * a0  = ( int const *) (this->args[ 0 ]); 
  
int **  rp = (  int **)(this->retValue); 
int  temp ;  
temp =  foo2 ( *a0 ); 
** rp = temp ;  
return this->retValue; 
} 
void ** foo2_utac__call__wrapper_t1mc_5 (struct JoinPoint * this);  
 
  int __utac_acc__t1ac__3 (  struct JoinPoint * );

void ** foo2_utac__call__wrapper_t1mc_5 (struct JoinPoint * this) { 
 
int **  rp = (  int **)(this->retValue); 
int  temp ;  
this->fp = &( foo2_utac__call__wrapper_t1mc_6 ) ; 
temp = __utac_acc__t1ac__3( this  ); 
 ** rp = temp ;  
return this->retValue; 
  }  


static inline int const  foo1__t1mc__0 (int a  )  ; 

  int const foo1 (int a  ) ; 
void ** foo1_utac__call__wrapper_t1mc_8 (struct JoinPoint * this);  
 

# 278 "t1mc.c"
void ** foo1_utac__call__wrapper_t1mc_8 (struct JoinPoint * this) { 
 
int * a0  = ( int *) (this->args[ 0 ]); 
  
int **  rp = (  int **)(this->retValue); 
int  temp ;  
temp =  foo1 ( *a0 ); 
** rp = temp ;  
return this->retValue; 
} 
void ** foo1_utac__call__wrapper_t1mc_7 (struct JoinPoint * this);  
 
  int __utac_acc__t1ac__4 (  struct JoinPoint * );

void ** foo1_utac__call__wrapper_t1mc_7 (struct JoinPoint * this) { 
 
int **  rp = (  int **)(this->retValue); 
int  temp ;  
this->fp = &( foo1_utac__call__wrapper_t1mc_8 ) ; 
temp = __utac_acc__t1ac__4( this  ); 
 ** rp = temp ;  
return this->retValue; 
  }  


#line 22 "t1mc.mc"
int main()  
# 306 "t1mc.c"
{
# 308 "t1mc.c"
int retValue_acc;




# 314 "t1mc.c"
{

#line 23 "t1mc.mc"

#line 23 "t1mc.mc"
int a = 3;
#line 24 "t1mc.mc"

#line 24 "t1mc.mc"
const int b = 4;
#line 25 "t1mc.mc"
foo1__t1mc__0(a); 
#line 26 "t1mc.mc"
foo2__t1mc__1(b); 
#line 27 "t1mc.mc"
foo3__t1mc__2((&a)); 
#line 28 "t1mc.mc"
fooX__t1mc__3(a); 
#line 29 "t1mc.mc"

# 335 "t1mc.c"
retValue_acc = 0;
# 337 "t1mc.c"
return (int )retValue_acc;
 
# 340 "t1mc.c"

}

# 344 "t1mc.c"
return (int )retValue_acc;

# 347 "t1mc.c"

}
  int __utac_acc__t1ac__2 (  struct JoinPoint * );

  int __utac_acc__t1ac__4 (  struct JoinPoint * );

  int fooX (int a  ) ; 

# 356 "t1mc.c"
static inline int  fooX__t1mc__3 (int a  ) {

# 359 "t1mc.c"
int retValue_acc;
 { 
 struct JoinPoint this; 
int* __utac__arg0 = &a; 
const char * __utac__argtype0 = "int"; 
 void * __utac__args[1]; 
 const char * __utac__argstype[1];
this.argsCount = 1 ; 
 void * __utac__retp[1]; 
int __utac__ret ;
__utac__args[0] = (void*)(__utac__arg0);
__utac__argstype[0] = __utac__argtype0;
*__utac__retp  = (void *)(&__utac__ret);
this.args = __utac__args; 
this.argsType = __utac__argstype; 
{ extern void * __utac__get_this_arg (int, struct JoinPoint *)  ; 
  extern const char * __utac__get_this_argtype (int, struct JoinPoint *)  ; 
this.arg = __utac__get_this_arg ; 
this.argType= __utac__get_this_argtype ; } 
this.fp = &(fooX_utac__call__wrapper_t1mc_0);
this.retValue = __utac__retp ; 
this.retType ="int" ; 
this.funcName = "main"; 
this.targetName = "fooX"; 
this.fileName = "t1mc.mc"; 
this.kind = "call"; 
 { 
retValue_acc = __utac_acc__t1ac__2(&this );
 
 } 
 } 

# 392 "t1mc.c"
return (int )retValue_acc;
}
  int __utac_acc__t1ac__2 (  struct JoinPoint * );

  int __utac_acc__t1ac__3 (  struct JoinPoint * );

  int __utac_acc__t1ac__5 (  struct JoinPoint * );

  int foo3 (int const* ap  ) ; 

# 403 "t1mc.c"
static inline int  foo3__t1mc__2 (int const* ap  ) {

# 406 "t1mc.c"
int retValue_acc;
 { 
 struct JoinPoint this; 
int const** __utac__arg0 = &ap; 
const char * __utac__argtype0 = "int const*"; 
 void * __utac__args[1]; 
 const char * __utac__argstype[1];
this.argsCount = 1 ; 
 void * __utac__retp[1]; 
int __utac__ret ;
__utac__args[0] = (void*)(__utac__arg0);
__utac__argstype[0] = __utac__argtype0;
*__utac__retp  = (void *)(&__utac__ret);
this.args = __utac__args; 
this.argsType = __utac__argstype; 
{ extern void * __utac__get_this_arg (int, struct JoinPoint *)  ; 
  extern const char * __utac__get_this_argtype (int, struct JoinPoint *)  ; 
this.arg = __utac__get_this_arg ; 
this.argType= __utac__get_this_argtype ; } 
this.fp = &(foo3_utac__call__wrapper_t1mc_2);
this.retValue = __utac__retp ; 
this.retType ="int" ; 
this.funcName = "main"; 
this.targetName = "foo3"; 
this.fileName = "t1mc.mc"; 
this.kind = "call"; 
 { 
retValue_acc = __utac_acc__t1ac__2(&this );
 
 } 
 } 

# 439 "t1mc.c"
return (int )retValue_acc;
}
  int __utac_acc__t1ac__2 (  struct JoinPoint * );

  int __utac_acc__t1ac__3 (  struct JoinPoint * );

  int foo2 (int const a  ) ; 

# 448 "t1mc.c"
static inline int  foo2__t1mc__1 (int const a  ) {

# 451 "t1mc.c"
int retValue_acc;
 { 
 struct JoinPoint this; 
int const* __utac__arg0 = &a; 
const char * __utac__argtype0 = "int const"; 
 void * __utac__args[1]; 
 const char * __utac__argstype[1];
this.argsCount = 1 ; 
 void * __utac__retp[1]; 
int __utac__ret ;
__utac__args[0] = (void*)(__utac__arg0);
__utac__argstype[0] = __utac__argtype0;
*__utac__retp  = (void *)(&__utac__ret);
this.args = __utac__args; 
this.argsType = __utac__argstype; 
{ extern void * __utac__get_this_arg (int, struct JoinPoint *)  ; 
  extern const char * __utac__get_this_argtype (int, struct JoinPoint *)  ; 
this.arg = __utac__get_this_arg ; 
this.argType= __utac__get_this_argtype ; } 
this.fp = &(foo2_utac__call__wrapper_t1mc_5);
this.retValue = __utac__retp ; 
this.retType ="int" ; 
this.funcName = "main"; 
this.targetName = "foo2"; 
this.fileName = "t1mc.mc"; 
this.kind = "call"; 
 { 
retValue_acc = __utac_acc__t1ac__2(&this );
 
 } 
 } 

# 484 "t1mc.c"
return (int )retValue_acc;
}
  int const __utac_acc__t1ac__1 (  struct JoinPoint * );

  int __utac_acc__t1ac__4 (  struct JoinPoint * );

  int const foo1 (int a  ) ; 

# 493 "t1mc.c"
static inline int const  foo1__t1mc__0 (int a  ) {

# 496 "t1mc.c"
int retValue_acc;
 { 
 struct JoinPoint this; 
int* __utac__arg0 = &a; 
const char * __utac__argtype0 = "int"; 
 void * __utac__args[1]; 
 const char * __utac__argstype[1];
this.argsCount = 1 ; 
 void * __utac__retp[1]; 
int const __utac__ret ;
__utac__args[0] = (void*)(__utac__arg0);
__utac__argstype[0] = __utac__argtype0;
*__utac__retp  = (void *)(&__utac__ret);
this.args = __utac__args; 
this.argsType = __utac__argstype; 
{ extern void * __utac__get_this_arg (int, struct JoinPoint *)  ; 
  extern const char * __utac__get_this_argtype (int, struct JoinPoint *)  ; 
this.arg = __utac__get_this_arg ; 
this.argType= __utac__get_this_argtype ; } 
this.fp = &(foo1_utac__call__wrapper_t1mc_7);
this.retValue = __utac__retp ; 
this.retType ="int const" ; 
this.funcName = "main"; 
this.targetName = "foo1"; 
this.fileName = "t1mc.mc"; 
this.kind = "call"; 
 { 
retValue_acc = __utac_acc__t1ac__1(&this );
 
 } 
 } 

# 529 "t1mc.c"
return (int const )retValue_acc;
}
 
