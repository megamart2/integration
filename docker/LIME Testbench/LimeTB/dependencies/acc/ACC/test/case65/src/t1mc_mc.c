int foo(char a, int * b) {
	printf("in foo, a = %c, b = %d\n", a, *b);
	return 99;
}

void foo2 ( int c, int (*p)(char, int*), int d) {
	printf("in foo2, c = %d, d = %d\n", c , d);
	(*p)('A', &d);
}

int foo4(char c) {
	printf("in foo4, c = %c\n", c);
	return 99;
}

void foo3(int (*p)(char)) {
	printf("call foo3\n");
	(*p)('z');
}

void foo6(int (*p)(char)) {
	printf("call foo6\n");
	(*p)('x');
}

void foo7(int (*p)(char)) {
	printf("in foo7\n");
	printf("call foo2 inside foo7\n");
	foo2(3, foo, -3);
}

int main() {
	foo2(3, foo, 4);

	foo3(foo4);

	foo6(foo4);

	foo7(foo4);

	return 0;
}


