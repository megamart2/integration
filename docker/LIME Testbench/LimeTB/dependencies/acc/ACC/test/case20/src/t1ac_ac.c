/* as parameter name */
int foo( int call);
int foo2(int execution);
int foo33(int before);
int foo44444(int after);
int foo5(int around);
int foo6(int args);
int foo7(int result);
int foo8(int proceed);
int foo9(int infile);
int foo10(int infunc ) {
	return 3;
}

/* as struct member name */
struct S1 {
	 int call;
};

struct S2 {
	int execution;
};

struct S3 {
	int before;
};

struct S4 {
	int after ;
};

struct S5 {
	int around;
};

struct S6 {
	int args;
};

struct S7 {
	int result;
};


struct S8 {
	int proceed;
};

struct S9 {
	int infile;
};

struct S10 {
	int infunc;
};


/* as function name */
int call() ;
int execution();
int before();
int after();
int around();
int args();
int result();
int proceed();
int infile();
int infunc( );


before ():infile("t1mc_mc.c") && call(int foo3()) && infunc(main)    
{
	printf("match all foo3 in main of t1mc.c \n"); 
}

before (): infile("t2mc_mc.c") && call(int foo3()) 
{
	printf("match call foo3 in t2mc.c\n");
}

