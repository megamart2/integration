
void foo1( int *a1, int a2, int a3) {
        printf("inside foo1, a1 = %d , a2 = %d , a3 = %d \n", *a1, a2, a3);
	printf("sum = %d\n", *a1 + a2 + a3);
}


void foo2(int a1, int * a2, int a3) {
	printf("inside foo2, a1 = %d, a2 = %d, a3 = %d \n", a1, *a2, a3);
}

	
int main() {
	int n = 3;
	int m = 99;
	printf("call foo1 in main, argu = %d,%d,%d\n", n, 4, 5);
	foo1(&n, 4, 5);

	printf("call foo2 in main, argu = %d,%d,%d\n", 1, m, 20);
	foo2(1, &m, 20);

	
	return 0;
}
