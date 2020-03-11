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

/* as variable name */
int call;
int execution;
int before;
int after;
int around;
int args;
int result;
int proceed;
int infile;
int infunc;


typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));

inline unsigned int gnu_dev_minor (unsigned long long int __dev) ;

extern void abort (void) __attribute__ ((__noreturn__));

extern void absder (void) __attribute__ ((__const__));

extern double atof (__const char *__nptr) __attribute__ ((__pure__));

extern int snprintf (char *__restrict __s, int __maxlen,                     __const char *__restrict __format, ...) __attribute__ ((__format__ (__printf__, 3, 4)));

/* old version of gcc does not support it */
/* typedef  __builtin_va_list kkkkkerewr ; 
*/

extern void foox(__const int * __restrict abc);
extern void fooy(__const int * __restrict);


int foo3() {
	printf("inside foo3\n");
	return 0;
}

int foo4() {
	printf("call foo3 inside foo4\n");
	foo3();
	printf("end of call foo3 inside foo4\n");
}


int main() {
	


	printf("call foo3 inside main\n");

	foo3();

	printf("end of calling foo3 inside main\n");
	
	foo4();

        return 0;
}
