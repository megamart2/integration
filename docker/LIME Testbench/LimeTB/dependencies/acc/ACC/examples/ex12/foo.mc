#include <stdio.h>

void foo1(char * a) {
	printf("inside foo1, a = %s\n", a);
}

void foo2(char * a) {
	printf("inside foo2, a = %s\n", a);
}

int foo(char * a, void (*p)(char *)) {
	printf("inside foo \n");
	(*p)(a);
	return 0;
};

int main() {
	foo("call foo1", foo1);
	
	foo("call foo2", foo2);
	
	return 0;
}

