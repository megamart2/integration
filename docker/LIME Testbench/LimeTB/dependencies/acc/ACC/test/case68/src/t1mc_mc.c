int (*p)();

int foo3();

int foo() {
	printf("in foo\n");
	return 1;
}

int foo2() {
	printf("in foo2\n");

	p = foo;

	printf("call foo in foo2 by fp\n");
	(*p)();

	return 2;
}


int foo4(int (*d)(), int x) {
	printf("in foo4\n");
	(*d)();
	return 4;
}


int foo5() {
	int (*d1)();
	printf("in foo5\n");
	d1 = foo;
	(*d1)();
}

int main() {
	p = foo;

	printf("call foo in main by fp\n");
	(*p)();

	p = foo2;
	printf("call foo2 in main by fp\n");

	(*p)();

	printf("call foo3 in main by fp\n");
	p = foo3;
	
	(*p)();

	printf("call foo4 in main\n");
	foo4(foo, 3);

	printf("call foo5 in main\n");
	foo5();
	
	return 0;
}
