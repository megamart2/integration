#include <stdio.h>

char around(): call(char foo(int)) {
	printf("aspect 1 : \n");
	proceed();
	printf("aspect 1 end \n");
}

char around(): execution(char foo2(int)) {
	printf("aspect 2 :\n");
	proceed();
	printf("aspect 2 end \n");
}

