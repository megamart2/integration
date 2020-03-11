#include "rb.h"

pointcut INTEST (): infunc(test_correctness);

before(void * node ): INTEST() && call($ rb_probe(...)) && args($, node) {
        printf ("  Inserting %d...\n", *(int*)(node));
}
before(void * node) : INTEST() && call($ rb_t_find(...)) && args($, $, node) {
        printf ("   Checking traversal from item %d...\n", *(int*)(node));
}
before(const void * node) : INTEST() && call($ rb_delete(...)) && args($, node) {
        printf ("    Deleting item %d.\n", *(int*)(node));
}
before(void * node): INTEST() && call($ rb_t_insert(...)) && args($,$,node){
	printf("    Re-inserting item %d.\n", *(int*)(node));
}
before(): INTEST() && call($ rb_copy(...)) {
	printf ("  Copying tree and comparing...\n");
}
