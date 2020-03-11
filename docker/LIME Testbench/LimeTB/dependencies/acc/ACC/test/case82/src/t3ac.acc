#include <stdio.h>


int abc;


int increaseABC(int a) {

	abc += a;

	return abc;
}

void decreaseABC(int a) {
	abc -= a;

}


before() : call(void foo()) {
	
	increaseABC(3);
	
	printf("in aspect\n");

	increaseABC(4);
}

after(): call(void foo()) {

	decreaseABC(3);

	printf("in after aspect\n");

	decreaseABC(4);

}


void around(): call(void foo()) {

	printf("in around aspect\n");

	proceed();
}
