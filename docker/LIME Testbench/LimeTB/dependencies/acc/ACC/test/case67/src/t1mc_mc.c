#include <stdio.h>

int foo() {
    volatile int *addr;
    return 3;
}

struct rb_table {
        int a;
};


int main() {
	printf("size of rb_table = %d\n", sizeof(struct rb_table));
	return 0;
}
