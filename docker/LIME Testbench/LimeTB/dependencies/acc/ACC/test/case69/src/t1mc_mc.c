int foo() {
	printf("in foo\n");
	return 0;
}

int (*d1)();

int foo5( int (*parap)()) {
	int (*e1)();

	printf("in foo5\n");

	e1 = foo;
	
	printf("call foo by local fp: e1\n");
	(*e1)();

	printf("call foo by parameter fp: parap\n");

	(*parap)();

	d1 = foo;

	printf("call foo by global fp : d1\n");

	(*d1)();


	printf("end of foo5\n");
}

int main() {
	printf("call foo5 in main\n");
	foo5(foo);

	return 0;
}
