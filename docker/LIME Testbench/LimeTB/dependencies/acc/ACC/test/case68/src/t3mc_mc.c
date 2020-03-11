int (*p)();

int foo() {
	printf("in foo\n");
	return 1;
}


int main() {
	p = foo;

	(*p)();

	return 0;
}
