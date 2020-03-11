void foo_c() { }
void foo1_c() { }
void foo2_c() { }
void foo3_c() { }
void foo4_c() { }
void foo5_c() { }
void foo6_c() {}

void foo() {
	foo_c();
	printf("end of foo\n");
}


int foo1() {
        foo1_c();
        printf("end of foo1\n");
	return 9;
}

float foo2() {
        foo2_c();
        printf("end of foo2\n");
	return 9.9;
}

double foo3() {
        foo3_c();
        printf("end of foo3\n");
	return 9.9;
}

char * foo4() {
	foo4_c();
        printf("end of foo4\n");
	return "normal return of foo4";
}

char foo5() {
	foo5_c();
	printf("end of foo5\n");
	return 'X';
}

void * foo6() {
	foo6_c();
	printf("end of foo6\n");
	return (void *)(1);
}

int main() {

	printf("call foo in main\n");
	foo();

	printf("return value of foo1 = %d\n", foo1());
	printf("return value of foo2 = %f\n", foo2());
	printf("return value of foo3 = %f\n", foo3());
	printf("return value of foo4 = %s\n", foo4());
	printf("return value of foo5 = %c\n", foo5());

	printf("return value of foo6 = %d\n", (int)foo6());
	return 0;
}

