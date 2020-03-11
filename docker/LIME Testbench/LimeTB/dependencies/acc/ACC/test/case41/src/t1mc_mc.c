


int foo(char * a) {
	printf("inside foo, a = %s\n", a);
	return 99;
}

void foo2(char * s) {
	printf("foo2-->foo\n");
	foo("call foo from foo2\n");
}

void foo3() {
	printf("foo3-->foo\n");
	foo("call foo directly from foo3\n");
	printf("foo3-->foo2\n");
	foo2("call foo2 from foo3\n");
}

void foo4() {
	printf("foo4-->foo3\n");
	foo3();
}

void foo5() {
	printf("foo5-->foo4\n");
	foo4();
}

int main() {
	printf("main-->foo4\n");
        foo4();
	printf("--------------\n");
	printf("main-->foo3\n");
        foo3();
	printf("--------------\n");
	printf("main-->foo2\n");
        foo2("call foo2 in main\n");
	printf("--------------\n");
	printf("main-->foo\n");
	foo("call foo in main\n");
	printf("--------------\n");
	printf("main-->foo5\n");
	foo5();
	return 0;
}

