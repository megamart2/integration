#include <stdio.h>

struct X {
	char a;
	int b;
};

typedef struct X MYX1;
typedef MYX1 MYX2;

int main() {
	printf("size of struct X = %d, MYX1 = %d, MYX2 = %d\n", sizeof(struct X), sizeof(MYX1), sizeof(MYX2));
	return 0;
}

