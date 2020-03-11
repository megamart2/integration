void pointcut() {
	printf("here is function poincut\n");
}


void foo2() {
	printf("inside foo2\n");
}


int foo1( int *a1, int a2, int a3) {
        printf("inside foo1, a1 = %d , a2 = %d , a3 = %d \n", *a1, a2, a3);
	foo2();
	return *a1 + a2 + a3;
}


void foo3() {
	printf("inside foo3\n");
}

	
int main() {
	int n = 3;
	int m = 99;
	printf("call foo1 in main, argu = %d,%d,%d\n", n, 4, 5);
	foo1(&n, 4, 5);

	printf("call foo2 in main\n");
	foo2();

	foo3();
	
	return 0;
}
