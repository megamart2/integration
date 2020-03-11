#include <stdio.h>

int foo2() {
    volatile int *addr;

    return 3;
}

struct rb_table {
        int a;
};


introduce():
     intype (struct rb_table) {
        int rb_count;
}

after() : execution($ main(...)) {
	printf("in aspect, size of struct rb_table = %d\n", sizeof(struct rb_table));
}

