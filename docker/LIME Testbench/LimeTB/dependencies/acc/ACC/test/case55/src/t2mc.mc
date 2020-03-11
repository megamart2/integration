const int foo1(int a) {
	printf("inside foo1\n");
	return 3;
}

int foo2(const int a) {
	printf("inside foo2\n");
	return 0;
}

int foo3(const int * ap) {
	printf("inside foo3\n");
	return 0;
}

/* this const qualifier should be ignored */
__attribute__((const)) int fooX(int a) {
        printf("inside fooX\n");
        return 3;
}

int main() {
	int a = 3;
	const int b= 4;
	foo1(a);
	foo2(b);
	foo3(&a);
	fooX(a);
	return 0;
}
