#include <stdlib.h>

void foo() {
	char * c;
	printf("call malloc in foo\n");
	c  = (char *)malloc(33);

	free(c);
}
	
int main() {
	char * a;


	printf("call malloc in main\n");
	a  = (char *)malloc(24);

	free(a);

	foo();	
	return 0;
}
