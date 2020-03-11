#include <stdio.h>

int foo1(char * a, char * b, int c) {
	printf("inside foo1, b = %s\n", b);
	return 99;
}

int foo2(int a, int b, int c, char * d, char e) {
	printf("inside foo2, d = %s\n", d);
}

int main() {
	foo1("abc", "call foo1", 3);
	foo2(1,2,3, "call foo2", 'c');
	foo1("abc", 0, 4);			
	foo2(1,2,3, 0, 'd');
}

