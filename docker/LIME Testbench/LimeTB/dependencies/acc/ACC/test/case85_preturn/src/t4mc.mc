int foo3(int a) {
	printf("in foo3, a = %d\n", a);
	return a * 2;
}


int foo2(int a, int b, int c) {
	printf("in foo2, a = %d, b = %d , c = %d \n", a, b, c);
}


int foo(int a, int b, int c) {
	printf("in foo, a = %d, b = %d, c = %d \n", a, b, c);
	foo2( a * b, b * c, c );
	foo3(9);
	return 0; 
}

void foo4() {
	printf("in foo4, call foo3\n");
	foo3(9);
	printf("end of foo4\n");
}

int main() {

	printf("call foo(3,4,5) in main\n");
	foo(3,4,5);
	printf("\n---------------------\n");
	printf("call foo2(3,4,5) in main\n");
	foo2(3,4,5);
	printf("\n---------------------\n");
	printf("call foo4 in main\n");
	foo4();
	return 0;
}

