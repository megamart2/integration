
#include <stdio.h>

introduce(): intype(struct A) {
	
	int b;

	int c;
}


void around(int a, int b): cflow(execution($ foo($)) && args(b)) &&
			call($ foo1($)) && args(a) {
	printf("in around aspect, para = %d, %d \n", a, b);
	
	proceed();
}
