#include <stdio.h>


void foo(char * a) {
	
	printf("inside foo, a = %s\n", a);
}

int main() {
	
	foo("abcde");
}

