
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


  int const __utac_acc__t2ac__1 (  struct JoinPoint * );


  int const foo1 (int a  ) ; 
  int const foo1utac__exec__ori (int a  ) ; 
void ** foo1_utac__exec__wrapper_t2mc_1 (struct JoinPoint * this);  
 

# 39 "t2mc.c"
void ** foo1_utac__exec__wrapper_t2mc_1 (struct JoinPoint * this) { 
 
int * a0  = ( int *) (this->args[ 0 ]); 
  
int **  rp = (  int **)(this->retValue); 
int  temp ;  
temp =  foo1utac__exec__ori ( *a0 ); 
** rp = temp ;  
return this->retValue; 
} 
void ** foo1_utac__exec__wrapper_t2mc_0 (struct JoinPoint * this);  
 
  int __utac_acc__t2ac__4 (  struct JoinPoint * );

void ** foo1_utac__exec__wrapper_t2mc_0 (struct JoinPoint * this) { 
 
int **  rp = (  int **)(this->retValue); 
int  temp ;  
this->fp = &( foo1_utac__exec__wrapper_t2mc_1 ) ; 
temp = __utac_acc__t2ac__4( this  ); 
 ** rp = temp ;  
return this->retValue; 
  }  


#line 1 "t2mc.mc"
const int foo1(int a)  
# 67 "t2mc.c"
{
# 69 "t2mc.c"
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
this.fp = &(foo1_utac__exec__wrapper_t2mc_0);
this.retValue = __utac__retp ; 
this.retType ="int const" ; 
this.funcName = "foo1"; 
this.targetName = "foo1"; 
this.fileName = "t2mc.mc"; 
this.kind = "execution"; 
 { 
retValue_acc = __utac_acc__t2ac__1(&this );
 
 } 
 } 


# 106 "t2mc.c"
return (int const )retValue_acc;

# 109 "t2mc.c"

}
 

# 114 "t2mc.c"
  int const foo1utac__exec__ori (int a  ) { 

# 117 "t2mc.c"
int retValue_acc;

#line 2 "t2mc.mc"
printf("inside foo1\n"); 
#line 3 "t2mc.mc"

# 124 "t2mc.c"
retValue_acc = 3;
# 126 "t2mc.c"
return (int const )retValue_acc;
 
 } 
  int __utac_acc__t2ac__2 (  struct JoinPoint * );


  int foo2 (int const a  ) ; 
  int foo2utac__exec__ori (int const a  ) ; 
void ** foo2_utac__exec__wrapper_t2mc_3 (struct JoinPoint * this);  
 

# 138 "t2mc.c"
void ** foo2_utac__exec__wrapper_t2mc_3 (struct JoinPoint * this) { 
 
int const * a0  = ( int const *) (this->args[ 0 ]); 
  
int **  rp = (  int **)(this->retValue); 
int  temp ;  
temp =  foo2utac__exec__ori ( *a0 ); 
** rp = temp ;  
return this->retValue; 
} 
void ** foo2_utac__exec__wrapper_t2mc_2 (struct JoinPoint * this);  
 
  int __utac_acc__t2ac__3 (  struct JoinPoint * );

void ** foo2_utac__exec__wrapper_t2mc_2 (struct JoinPoint * this) { 
 
int **  rp = (  int **)(this->retValue); 
int  temp ;  
this->fp = &( foo2_utac__exec__wrapper_t2mc_3 ) ; 
temp = __utac_acc__t2ac__3( this  ); 
 ** rp = temp ;  
return this->retValue; 
  }  


#line 6 "t2mc.mc"
int foo2(const int a)  
# 166 "t2mc.c"
{
# 168 "t2mc.c"
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
this.fp = &(foo2_utac__exec__wrapper_t2mc_2);
this.retValue = __utac__retp ; 
this.retType ="int" ; 
this.funcName = "foo2"; 
this.targetName = "foo2"; 
this.fileName = "t2mc.mc"; 
this.kind = "execution"; 
 { 
retValue_acc = __utac_acc__t2ac__2(&this );
 
 } 
 } 


# 205 "t2mc.c"
return (int )retValue_acc;

# 208 "t2mc.c"

}
 

# 213 "t2mc.c"
  int foo2utac__exec__ori (int const a  ) { 

# 216 "t2mc.c"
int retValue_acc;

#line 7 "t2mc.mc"
printf("inside foo2\n"); 
#line 8 "t2mc.mc"

# 223 "t2mc.c"
retValue_acc = 0;
# 225 "t2mc.c"
return (int )retValue_acc;
 
 } 
  int __utac_acc__t2ac__2 (  struct JoinPoint * );


  int foo3 (int const* ap  ) ; 
  int foo3utac__exec__ori (int const* ap  ) ; 
void ** foo3_utac__exec__wrapper_t2mc_6 (struct JoinPoint * this);  
 

# 237 "t2mc.c"
void ** foo3_utac__exec__wrapper_t2mc_6 (struct JoinPoint * this) { 
 
int const* * a0  = ( int const* *) (this->args[ 0 ]); 
  
int **  rp = (  int **)(this->retValue); 
int  temp ;  
temp =  foo3utac__exec__ori ( *a0 ); 
** rp = temp ;  
return this->retValue; 
} 
void ** foo3_utac__exec__wrapper_t2mc_5 (struct JoinPoint * this);  
 
  int __utac_acc__t2ac__5 (  struct JoinPoint * );

void ** foo3_utac__exec__wrapper_t2mc_5 (struct JoinPoint * this) { 
 
int **  rp = (  int **)(this->retValue); 
int  temp ;  
this->fp = &( foo3_utac__exec__wrapper_t2mc_6 ) ; 
temp = __utac_acc__t2ac__5( this  ); 
 ** rp = temp ;  
return this->retValue; 
  }  
void ** foo3_utac__exec__wrapper_t2mc_4 (struct JoinPoint * this);  
 
  int __utac_acc__t2ac__3 (  struct JoinPoint * );

void ** foo3_utac__exec__wrapper_t2mc_4 (struct JoinPoint * this) { 
 
int **  rp = (  int **)(this->retValue); 
int  temp ;  
this->fp = &( foo3_utac__exec__wrapper_t2mc_5 ) ; 
temp = __utac_acc__t2ac__3( this  ); 
 ** rp = temp ;  
return this->retValue; 
  }  


#line 11 "t2mc.mc"
int foo3(const int *ap)  
# 278 "t2mc.c"
{
# 280 "t2mc.c"
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
this.fp = &(foo3_utac__exec__wrapper_t2mc_4);
this.retValue = __utac__retp ; 
this.retType ="int" ; 
this.funcName = "foo3"; 
this.targetName = "foo3"; 
this.fileName = "t2mc.mc"; 
this.kind = "execution"; 
 { 
retValue_acc = __utac_acc__t2ac__2(&this );
 
 } 
 } 


# 317 "t2mc.c"
return (int )retValue_acc;

# 320 "t2mc.c"

}
 

# 325 "t2mc.c"
  int foo3utac__exec__ori (int const* ap  ) { 

# 328 "t2mc.c"
int retValue_acc;

#line 12 "t2mc.mc"
printf("inside foo3\n"); 
#line 13 "t2mc.mc"

# 335 "t2mc.c"
retValue_acc = 0;
# 337 "t2mc.c"
return (int )retValue_acc;
 
 } 
  int __utac_acc__t2ac__2 (  struct JoinPoint * );


  int fooX (int a  ) ; 
  int fooXutac__exec__ori (int a  ) ; 
void ** fooX_utac__exec__wrapper_t2mc_8 (struct JoinPoint * this);  
 

# 349 "t2mc.c"
void ** fooX_utac__exec__wrapper_t2mc_8 (struct JoinPoint * this) { 
 
int * a0  = ( int *) (this->args[ 0 ]); 
  
int **  rp = (  int **)(this->retValue); 
int  temp ;  
temp =  fooXutac__exec__ori ( *a0 ); 
** rp = temp ;  
return this->retValue; 
} 
void ** fooX_utac__exec__wrapper_t2mc_7 (struct JoinPoint * this);  
 
  int __utac_acc__t2ac__4 (  struct JoinPoint * );

void ** fooX_utac__exec__wrapper_t2mc_7 (struct JoinPoint * this) { 
 
int **  rp = (  int **)(this->retValue); 
int  temp ;  
this->fp = &( fooX_utac__exec__wrapper_t2mc_8 ) ; 
temp = __utac_acc__t2ac__4( this  ); 
 ** rp = temp ;  
return this->retValue; 
  }  


#line 17 "t2mc.mc"
 __attribute__  (( const  )) int fooX(int a)  
# 377 "t2mc.c"
{
# 379 "t2mc.c"
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
this.fp = &(fooX_utac__exec__wrapper_t2mc_7);
this.retValue = __utac__retp ; 
this.retType ="int" ; 
this.funcName = "fooX"; 
this.targetName = "fooX"; 
this.fileName = "t2mc.mc"; 
this.kind = "execution"; 
 { 
retValue_acc = __utac_acc__t2ac__2(&this );
 
 } 
 } 


# 416 "t2mc.c"
return (int )retValue_acc;

# 419 "t2mc.c"

}
 

# 424 "t2mc.c"
  int fooXutac__exec__ori (int a  ) { 

# 427 "t2mc.c"
int retValue_acc;

#line 18 "t2mc.mc"
printf("inside fooX\n"); 
#line 19 "t2mc.mc"

# 434 "t2mc.c"
retValue_acc = 3;
# 436 "t2mc.c"
return (int )retValue_acc;
 
 } 
#line 22 "t2mc.mc"
int main()  
# 442 "t2mc.c"
{
# 444 "t2mc.c"
int retValue_acc;




# 450 "t2mc.c"
{

#line 23 "t2mc.mc"

#line 23 "t2mc.mc"
int a = 3;
#line 24 "t2mc.mc"

#line 24 "t2mc.mc"
const int b = 4;
#line 25 "t2mc.mc"
foo1(a); 
#line 26 "t2mc.mc"
foo2(b); 
#line 27 "t2mc.mc"
foo3((&a)); 
#line 28 "t2mc.mc"
fooX(a); 
#line 29 "t2mc.mc"

# 471 "t2mc.c"
retValue_acc = 0;
# 473 "t2mc.c"
return (int )retValue_acc;
 
# 476 "t2mc.c"

}

# 480 "t2mc.c"
return (int )retValue_acc;

# 483 "t2mc.c"

}
 
