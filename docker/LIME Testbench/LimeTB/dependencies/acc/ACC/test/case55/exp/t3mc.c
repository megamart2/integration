
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


#line 2 "t3mc.mc"
typedef const int MYA; 
#line 4 "t3mc.mc"
typedef int const MYB; 
  int const __utac_acc__t3ac__1 (  struct JoinPoint * );


  int const foo1 (int a  ) ; 
  int const foo1utac__exec__ori (int a  ) ; 
void ** foo1_utac__exec__wrapper_t3mc_1 (struct JoinPoint * this);  
 

# 43 "t3mc.c"
void ** foo1_utac__exec__wrapper_t3mc_1 (struct JoinPoint * this) { 
 
int * a0  = ( int *) (this->args[ 0 ]); 
  
int **  rp = (  int **)(this->retValue); 
int  temp ;  
temp =  foo1utac__exec__ori ( *a0 ); 
** rp = temp ;  
return this->retValue; 
} 
void ** foo1_utac__exec__wrapper_t3mc_0 (struct JoinPoint * this);  
 
  int __utac_acc__t3ac__4 (  struct JoinPoint * );

void ** foo1_utac__exec__wrapper_t3mc_0 (struct JoinPoint * this) { 
 
int **  rp = (  int **)(this->retValue); 
int  temp ;  
this->fp = &( foo1_utac__exec__wrapper_t3mc_1 ) ; 
temp = __utac_acc__t3ac__4( this  ); 
 ** rp = temp ;  
return this->retValue; 
  }  


#line 6 "t3mc.mc"
const int const foo1(int a)  
# 71 "t3mc.c"
{
# 73 "t3mc.c"
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
this.fp = &(foo1_utac__exec__wrapper_t3mc_0);
this.retValue = __utac__retp ; 
this.retType ="int const" ; 
this.funcName = "foo1"; 
this.targetName = "foo1"; 
this.fileName = "t3mc.mc"; 
this.kind = "execution"; 
 { 
retValue_acc = __utac_acc__t3ac__1(&this );
 
 } 
 } 


# 110 "t3mc.c"
return (int const )retValue_acc;

# 113 "t3mc.c"

}
 

# 118 "t3mc.c"
  int const foo1utac__exec__ori (int a  ) { 

# 121 "t3mc.c"
int retValue_acc;

#line 7 "t3mc.mc"
printf("inside foo1\n"); 
#line 8 "t3mc.mc"

# 128 "t3mc.c"
retValue_acc = 3;
# 130 "t3mc.c"
return (int const )retValue_acc;
 
 } 
  int __utac_acc__t3ac__2 (  struct JoinPoint * );


  int foo2 (int const a  ) ; 
  int foo2utac__exec__ori (int const a  ) ; 
void ** foo2_utac__exec__wrapper_t3mc_3 (struct JoinPoint * this);  
 

# 142 "t3mc.c"
void ** foo2_utac__exec__wrapper_t3mc_3 (struct JoinPoint * this) { 
 
int const * a0  = ( int const *) (this->args[ 0 ]); 
  
int **  rp = (  int **)(this->retValue); 
int  temp ;  
temp =  foo2utac__exec__ori ( *a0 ); 
** rp = temp ;  
return this->retValue; 
} 
void ** foo2_utac__exec__wrapper_t3mc_2 (struct JoinPoint * this);  
 
  int __utac_acc__t3ac__3 (  struct JoinPoint * );

void ** foo2_utac__exec__wrapper_t3mc_2 (struct JoinPoint * this) { 
 
int **  rp = (  int **)(this->retValue); 
int  temp ;  
this->fp = &( foo2_utac__exec__wrapper_t3mc_3 ) ; 
temp = __utac_acc__t3ac__3( this  ); 
 ** rp = temp ;  
return this->retValue; 
  }  


#line 12 "t3mc.mc"
int foo2(int const a)  
# 170 "t3mc.c"
{
# 172 "t3mc.c"
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
this.fp = &(foo2_utac__exec__wrapper_t3mc_2);
this.retValue = __utac__retp ; 
this.retType ="int" ; 
this.funcName = "foo2"; 
this.targetName = "foo2"; 
this.fileName = "t3mc.mc"; 
this.kind = "execution"; 
 { 
retValue_acc = __utac_acc__t3ac__2(&this );
 
 } 
 } 


# 209 "t3mc.c"
return (int )retValue_acc;

# 212 "t3mc.c"

}
 

# 217 "t3mc.c"
  int foo2utac__exec__ori (int const a  ) { 

# 220 "t3mc.c"
int retValue_acc;

#line 13 "t3mc.mc"
printf("inside foo2\n"); 
#line 14 "t3mc.mc"

# 227 "t3mc.c"
retValue_acc = 0;
# 229 "t3mc.c"
return (int )retValue_acc;
 
 } 
  int __utac_acc__t3ac__2 (  struct JoinPoint * );


  int foo3 (int const* ap  ) ; 
  int foo3utac__exec__ori (int const* ap  ) ; 
void ** foo3_utac__exec__wrapper_t3mc_6 (struct JoinPoint * this);  
 

# 241 "t3mc.c"
void ** foo3_utac__exec__wrapper_t3mc_6 (struct JoinPoint * this) { 
 
int const* * a0  = ( int const* *) (this->args[ 0 ]); 
  
int **  rp = (  int **)(this->retValue); 
int  temp ;  
temp =  foo3utac__exec__ori ( *a0 ); 
** rp = temp ;  
return this->retValue; 
} 
void ** foo3_utac__exec__wrapper_t3mc_5 (struct JoinPoint * this);  
 
  int __utac_acc__t3ac__5 (  struct JoinPoint * );

void ** foo3_utac__exec__wrapper_t3mc_5 (struct JoinPoint * this) { 
 
int **  rp = (  int **)(this->retValue); 
int  temp ;  
this->fp = &( foo3_utac__exec__wrapper_t3mc_6 ) ; 
temp = __utac_acc__t3ac__5( this  ); 
 ** rp = temp ;  
return this->retValue; 
  }  
void ** foo3_utac__exec__wrapper_t3mc_4 (struct JoinPoint * this);  
 
  int __utac_acc__t3ac__3 (  struct JoinPoint * );

void ** foo3_utac__exec__wrapper_t3mc_4 (struct JoinPoint * this) { 
 
int **  rp = (  int **)(this->retValue); 
int  temp ;  
this->fp = &( foo3_utac__exec__wrapper_t3mc_5 ) ; 
temp = __utac_acc__t3ac__3( this  ); 
 ** rp = temp ;  
return this->retValue; 
  }  


#line 17 "t3mc.mc"
int foo3(int const *ap)  
# 282 "t3mc.c"
{
# 284 "t3mc.c"
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
this.fp = &(foo3_utac__exec__wrapper_t3mc_4);
this.retValue = __utac__retp ; 
this.retType ="int" ; 
this.funcName = "foo3"; 
this.targetName = "foo3"; 
this.fileName = "t3mc.mc"; 
this.kind = "execution"; 
 { 
retValue_acc = __utac_acc__t3ac__2(&this );
 
 } 
 } 


# 321 "t3mc.c"
return (int )retValue_acc;

# 324 "t3mc.c"

}
 

# 329 "t3mc.c"
  int foo3utac__exec__ori (int const* ap  ) { 

# 332 "t3mc.c"
int retValue_acc;

#line 18 "t3mc.mc"
printf("inside foo3\n"); 
#line 19 "t3mc.mc"

# 339 "t3mc.c"
retValue_acc = 0;
# 341 "t3mc.c"
return (int )retValue_acc;
 
 } 
  int __utac_acc__t3ac__2 (  struct JoinPoint * );


  int foo4 (int volatile a ,int* __restrict b ,int __const c  ) ; 
  int foo4utac__exec__ori (int volatile a ,int* __restrict b ,int __const c  ) ; 
void ** foo4_utac__exec__wrapper_t3mc_8 (struct JoinPoint * this);  
 

# 353 "t3mc.c"
void ** foo4_utac__exec__wrapper_t3mc_8 (struct JoinPoint * this) { 
 
int volatile * a0  = ( int volatile *) (this->args[ 0 ]); 
  
int* __restrict * a1  = ( int* __restrict *) (this->args[ 1 ]); 
  
int __const * a2  = ( int __const *) (this->args[ 2 ]); 
  
int **  rp = (  int **)(this->retValue); 
int  temp ;  
temp =  foo4utac__exec__ori ( *a0 , *a1 , *a2 ); 
** rp = temp ;  
return this->retValue; 
} 
void ** foo4_utac__exec__wrapper_t3mc_7 (struct JoinPoint * this);  
 
  int __utac_acc__t3ac__6 (  struct JoinPoint * );

void ** foo4_utac__exec__wrapper_t3mc_7 (struct JoinPoint * this) { 
 
int **  rp = (  int **)(this->retValue); 
int  temp ;  
this->fp = &( foo4_utac__exec__wrapper_t3mc_8 ) ; 
temp = __utac_acc__t3ac__6( this  ); 
 ** rp = temp ;  
return this->retValue; 
  }  


#line 22 "t3mc.mc"
int foo4(int volatile a, int *__restrict b, int __const c)  
# 385 "t3mc.c"
{
# 387 "t3mc.c"
int retValue_acc;



 { 
 struct JoinPoint this; 
int volatile* __utac__arg0 = &a; 
const char * __utac__argtype0 = "int volatile"; 
int* __restrict* __utac__arg1 = &b; 
const char * __utac__argtype1 = "int* __restrict"; 
int __const* __utac__arg2 = &c; 
const char * __utac__argtype2 = "int __const"; 
 void * __utac__args[3]; 
 const char * __utac__argstype[3];
this.argsCount = 3 ; 
 void * __utac__retp[1]; 
int __utac__ret ;
__utac__args[0] = (void*)(__utac__arg0);
__utac__argstype[0] = __utac__argtype0;
__utac__args[1] = (void*)(__utac__arg1);
__utac__argstype[1] = __utac__argtype1;
__utac__args[2] = (void*)(__utac__arg2);
__utac__argstype[2] = __utac__argtype2;
*__utac__retp  = (void *)(&__utac__ret);
this.args = __utac__args; 
this.argsType = __utac__argstype; 
{ extern void * __utac__get_this_arg (int, struct JoinPoint *)  ; 
  extern const char * __utac__get_this_argtype (int, struct JoinPoint *)  ; 
this.arg = __utac__get_this_arg ; 
this.argType= __utac__get_this_argtype ; } 
this.fp = &(foo4_utac__exec__wrapper_t3mc_7);
this.retValue = __utac__retp ; 
this.retType ="int" ; 
this.funcName = "foo4"; 
this.targetName = "foo4"; 
this.fileName = "t3mc.mc"; 
this.kind = "execution"; 
 { 
retValue_acc = __utac_acc__t3ac__2(&this );
 
 } 
 } 


# 432 "t3mc.c"
return (int )retValue_acc;

# 435 "t3mc.c"

}
 

# 440 "t3mc.c"
  int foo4utac__exec__ori (int volatile a ,int* __restrict b ,int __const c  ) { 

# 443 "t3mc.c"
int retValue_acc;

#line 23 "t3mc.mc"
printf("inside foo4\n"); 
#line 24 "t3mc.mc"

# 450 "t3mc.c"
retValue_acc = 0;
# 452 "t3mc.c"
return (int )retValue_acc;
 
 } 
  int const* __utac_acc__t3ac__7 (int const* ap  , struct JoinPoint * );


  int const* foo5 (int const* p ,int const* q  ) ; 
  int const* foo5utac__exec__ori (int const* p ,int const* q  ) ; 
void ** foo5_utac__exec__wrapper_t3mc_9 (struct JoinPoint * this);  
 

# 464 "t3mc.c"
void ** foo5_utac__exec__wrapper_t3mc_9 (struct JoinPoint * this) { 
 
int const* * a0  = ( int const* *) (this->args[ 0 ]); 
  
int const* * a1  = ( int const* *) (this->args[ 1 ]); 
  
int const* **  rp = (  int const* **)(this->retValue); 
int const*  temp ;  
temp =  foo5utac__exec__ori ( *a0 , *a1 ); 
** rp = temp ;  
return this->retValue; 
} 


#line 27 "t3mc.mc"
const int *foo5(const int *p, const int *q)  
# 481 "t3mc.c"
{
# 483 "t3mc.c"
int const* retValue_acc;



 { 
 struct JoinPoint this; 
int const** __utac__arg0 = &p; 
const char * __utac__argtype0 = "int const*"; 
int const** __utac__arg1 = &q; 
const char * __utac__argtype1 = "int const*"; 
 void * __utac__args[2]; 
 const char * __utac__argstype[2];
this.argsCount = 2 ; 
 void * __utac__retp[1]; 
int const* __utac__ret ;
__utac__args[0] = (void*)(__utac__arg0);
__utac__argstype[0] = __utac__argtype0;
__utac__args[1] = (void*)(__utac__arg1);
__utac__argstype[1] = __utac__argtype1;
*__utac__retp  = (void *)(&__utac__ret);
this.args = __utac__args; 
this.argsType = __utac__argstype; 
{ extern void * __utac__get_this_arg (int, struct JoinPoint *)  ; 
  extern const char * __utac__get_this_argtype (int, struct JoinPoint *)  ; 
this.arg = __utac__get_this_arg ; 
this.argType= __utac__get_this_argtype ; } 
this.fp = &(foo5_utac__exec__wrapper_t3mc_9);
this.retValue = __utac__retp ; 
this.retType ="int const*" ; 
this.funcName = "foo5"; 
this.targetName = "foo5"; 
this.fileName = "t3mc.mc"; 
this.kind = "execution"; 
 { 
int const* __utac__ad__arg1 = p ; 
retValue_acc = __utac_acc__t3ac__7(__utac__ad__arg1 ,&this );
 
 } 
 } 


# 525 "t3mc.c"
return (int const* )retValue_acc;

# 528 "t3mc.c"

}
 

# 533 "t3mc.c"
  int const* foo5utac__exec__ori (int const* p ,int const* q  ) { 

# 536 "t3mc.c"
int const* retValue_acc;

#line 28 "t3mc.mc"
printf("inside foo5, value = %d\n", (*p)); 
#line 29 "t3mc.mc"

# 543 "t3mc.c"
retValue_acc = p;
# 545 "t3mc.c"
return (int const* )retValue_acc;
 
 } 
#line 33 "t3mc.mc"
int main()  
# 551 "t3mc.c"
{
# 553 "t3mc.c"
int retValue_acc;




# 559 "t3mc.c"
{

#line 34 "t3mc.mc"

#line 34 "t3mc.mc"
int a = 3;
#line 35 "t3mc.mc"

#line 35 "t3mc.mc"
const int b = 4;
#line 36 "t3mc.mc"

#line 36 "t3mc.mc"
int __const c = 9;
#line 37 "t3mc.mc"

#line 37 "t3mc.mc"
int *__restrict d;
#line 38 "t3mc.mc"
d = (&a); 
#line 39 "t3mc.mc"
foo1(a); 
#line 40 "t3mc.mc"
foo2(b); 
#line 41 "t3mc.mc"
foo3((&a)); 
#line 42 "t3mc.mc"
foo4(3, d, c); 
#line 43 "t3mc.mc"
foo5((&b), (&b)); 
#line 45 "t3mc.mc"

# 592 "t3mc.c"
retValue_acc = 0;
# 594 "t3mc.c"
return (int )retValue_acc;
 
# 597 "t3mc.c"

}

# 601 "t3mc.c"
return (int )retValue_acc;

# 604 "t3mc.c"

}
 
