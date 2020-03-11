int foo2(void) {
	printf("in foo2\n");
	return 0;
}

int foo1(void) {
	printf("in foo1\n");
	return 0;
}

int foo(void) {
	printf("in foo\n");
	foo1();
	printf("end of foo\n");
	return 0;
}

int main(void) {
	printf("call foo in main\n");
	foo();
	printf("\ncall foo2 in main\n");
	foo2();
	return 0;
}


