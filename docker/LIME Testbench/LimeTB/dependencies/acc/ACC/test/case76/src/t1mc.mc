void foo(int (*a)) {
	printf("in foo\n");
}

void foo2(int (*a)()) {
	printf("in foo2\n");
}

int foo3() {
	printf("in foo3\n");
	return 0;
}


int main() {
	int a;
	int *ap = &a;

	foo(ap);

	foo2(foo3);

	return 0;
}	

