
#include <stdio.h>

int abc;


int increaseABC(int a) {

	abc += a;

	return abc;
}

void decreaseABC(int a) {
	abc -= a;

}


before() : execution(void foo()) {
	
	increaseABC(3);
	
	printf("in aspect\n");

	increaseABC(4);
}

after(): execution(void foo()) {

	decreaseABC(3);

	printf("in after aspect\n");

	decreaseABC(4);

}


void around(): execution(void foo()) {

	printf("in around aspect\n");

}
