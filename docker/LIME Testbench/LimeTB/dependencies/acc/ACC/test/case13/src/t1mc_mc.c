typedef int _G_int16_t __attribute__ ((__mode__ (__HI__)));
typedef int _G_int32_t __attribute__ ((__mode__ (__SI__)));


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
