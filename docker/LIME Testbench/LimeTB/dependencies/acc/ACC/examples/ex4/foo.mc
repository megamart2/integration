#include <stdio.h>

int foo(char * a) {
	printf("inside foo, a = %s\n", a);
	return 99;
}

int main() {
	foo("abcde");
}

