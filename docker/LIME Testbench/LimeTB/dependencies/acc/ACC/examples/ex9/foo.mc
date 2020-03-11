#include <stdio.h>

void foo1() {
	printf("inside foo1\n");
}

void foo2() {
	printf("inside foo2\n");
	foo1();
}

void foo3() {
	printf("inside foo3\n");
	foo2();
}
	
int main() {
	printf("call foo1 in main\n");
	foo1();
	printf("-----------------\n\n");
	printf("call foo2 in main\n");
	foo2();
	printf("-----------------\n\n");
	printf("call foo3 in main\n");
	foo3();
	return 0;
}

