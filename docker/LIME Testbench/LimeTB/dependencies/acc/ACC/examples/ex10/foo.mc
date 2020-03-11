#include <stdio.h>

void foo1() {
	printf("inside foo1\n");
}
	
int main() {
	printf("call foo1 in main\n");
	foo1();
	return 0;
}

