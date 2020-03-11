
/* following is the gcc extension present in stdio.h */
/* AC compiler should recognize it */

__extension__ typedef int myint;

int footemp(__const int b);

struct A {
	int b;
};

typedef struct __gconv_info
{
  int  __nsteps;
  __extension__ struct A b;
} *__gconv_t;


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
