#include <stdio.h>

void foo(int a, int b, int c) {
	printf("inside foo, argu = %d, %d, %d\n", a, b, c);
}

int main() {
	int n = 3;
	printf("call foo in main, argu = %d,%d,%d\n", 1, n, 5);
	foo(1,n,5);
}

