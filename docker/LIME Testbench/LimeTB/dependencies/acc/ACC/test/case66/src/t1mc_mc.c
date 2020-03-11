#include <stdio.h>

static char foo(int i) {
	printf("in foo, i = %d\n", i);
	return 'A';
}

static char foo2(int i) {
	printf("in foo2, i = %d\n", i);
	return 'B';
}

int main() {
	foo(3);
	foo2(4);
	return 0;
}

