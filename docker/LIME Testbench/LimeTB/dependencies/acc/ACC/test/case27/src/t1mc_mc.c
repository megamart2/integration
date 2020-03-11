struct X {
	int a;
};

union Y {
	int b;
};

enum Z { A , B };

void foo1( struct X  info) {
	printf("in foo1 kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkabc\n");
}

void foo2( struct X * info) {
	printf("in foo2\n");
}

void foo3( union  Y   info) {
	printf("in foo3\n");
}

void foo4( union Y *  info) {
        printf("in foo4\n");
}

void foo5( enum Z  info) {
        printf("in foo5\n");
}

void foo6( enum Z * info) {
        printf("in foo6\n");
 }

int main() {
	struct X a;
	union Y b;
	enum Z c;

	foo1(a);
	foo2(&a);
	foo3(b);
	foo4(&b);
	foo5(c);
	foo6(&c);


	return 0;
}
