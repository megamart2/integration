extern int snprintf (char *__restrict __s, int __maxlen,   __const char *__restrict __format, ...) __attribute__ ((__format__ (__printf__, 3, 4))) __attribute__((__pure__)) __attribute__((__const));

int __attribute__((__cdecl__)) gcc_attr1(int *);
int * __attribute__((__cdecl__)) gcc_attr2(int);

struct X {
	int __attribute__((__cdecl__)) (* abc ) (int);
	int * __attribute__((__cdecl__)) (*def) (int);
};


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
