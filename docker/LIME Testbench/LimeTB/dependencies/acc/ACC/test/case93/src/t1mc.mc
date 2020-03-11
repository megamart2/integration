void foo(int a1, int a2) {
	printf("inside foo, parameter = %d, %d \n", a1, a2);
}

int foo1() {
	printf("inside foo1, return 1; \n");
	return 1;
}

int foo2() {
	printf("inside foo2, return 2; \n");
	return 2;
}

int main() {

	printf("call foo by 3, 4 \n");

	foo(3,4);
	
	printf("\nin main, return value of foo1 = %d\n\n", foo1());

	printf("in main, return value of foo2 = %d\n", foo2());

	return 0;
}

