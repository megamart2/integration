
struct A {
	int a;
	int b;
};


union B {
	int a;
	int b;
} ub = { .a= 77 };



int main() {
	struct A foo;

	__typeof(foo) d;

	typeof(char) i;
	typeof(char *) ip;

	
	foo = (struct A) { 3 };

	printf("foo.a = %d\n", foo.a);

	foo = (struct A) { .b = 4 };

	printf("foo.b = %d\n", foo.b);

	printf("foo.a = %d\n", ((struct A) { 9 }).a);

	printf("ub.b = %d\n", ub.b);

	printf("size of i = %d, ip = %d\n", sizeof(i), sizeof(ip));
	
	return 0;
} 	
