/* MYA should be same as MYB */
typedef const int MYA;

typedef int const MYB;

const int const foo1(int a) {
	printf("inside foo1\n");
	return 3;
}


int foo2(int const a) {
	printf("inside foo2\n");
	return 0;
}

int foo3(int const * ap) {
	printf("inside foo3\n");
	return 0;
}

int foo4(int volatile a, int * __restrict b, int __const c) {
	printf("inside foo4\n");
	return 0;
}

const int * foo5(const int * p, const int * q) {
	printf("inside foo5, value = %d\n", *p);
	return p;
}


int main() {
	int a = 3;
	const int b= 4;
	int __const c = 9;
	int * __restrict d;
	d = &a;
	foo1(a);
	foo2(b);
	foo3(&a);
	foo4(3, d, c);
	foo5(&b, &b);

	return 0;
}
