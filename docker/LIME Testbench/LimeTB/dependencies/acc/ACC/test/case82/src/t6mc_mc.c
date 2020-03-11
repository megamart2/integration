#include <stdio.h>

struct A {
	int x;
};

void foo1(int p) {
	
	printf("in foo1, para = %d\n", p);

}

void foo(int k) {
	printf("in foo, para = %d\n", k);

	printf("call foo1 inside foo , with para = %d\n", k*2);

	foo1(k*2);

}

int main() {

	printf("call foo in main with para = 9\n");

	foo(9);

	return 0;
}


