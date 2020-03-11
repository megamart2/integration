#include <stdio.h>

void foo1(char * a) {
	printf("inside foo1, a = %s\n", a);
}

void foo2(char * a) {
	printf("inside foo2, a = %s\n", a);
	foo1("call foo1 in foo2");
}

int foo(char * a) {
	printf("inside foo, a = %s\n", a);
	foo2("call foo2 in foo");
	return 0;
};

int main() {
	
	foo1("call foo1 in main");
	printf("\n");
		
	foo("call foo in main");
	
	
	return 0;
}

