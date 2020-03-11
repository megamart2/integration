
#include <stdlib.h>

before() : call(void * malloc(size_t)) {
	printf("aspect, before call malloc \n");
}
