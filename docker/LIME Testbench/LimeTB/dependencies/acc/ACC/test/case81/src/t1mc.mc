int foo3(int a) {
	printf("in foo3, a = %d\n", a);
	return a * 2;
}


void foo2(int a, int b, int c) {

	printf("in foo2, a = %d, b = %d , c = %d \n", a, b, c);

	foo3(b+c);

}


void foo(double a, int b, int c) {
	printf("in foo, a = %d, b = %d, c = %d \n", (int)a, b, c);
	foo2( a * b, b * c, c );
}

int main() {

	printf("call foo(3,4,5) in main\n");
	foo(3,4,5);
	printf("\n---------------------\n");
	printf("call foo2(3,4,5) in main\n");
	foo2(3,4,5);

	return 0;
}

