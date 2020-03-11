#include <stdio.h>
int foo2(void) {
	printf("in foo2\n");
	return 0;
}

int foo1(void) {
	printf("in foo1\n");
	foo2();
	printf("end of foo1\n");
	return 0;
}

int main(void) {
	printf("return value of foo1 = %d \n", foo1());
	return 0;
}


