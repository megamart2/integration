int foo(int x) {
	printf("foo1, core program: x = %d \n", x);
	return x;
}

int foo2(int x) {
	printf("foo2, core program: x = %d \n", x);
	return x;
}


int main() {
	int result;
	printf("foo(1) in main \n");
	result = foo(1);
	printf("result = %d\n", result);
	printf("-------------\n");
        
	printf("foo(4) in main \n");
        result = foo(4);
        printf("result = %d\n", result);
        printf("-------------\n");


	printf("foo(10) in main \n");
        result = foo(10);
        printf("result = %d\n", result);
        printf("-------------\n");

	printf("foo(21) in main \n");
        result = foo(21);
        printf("result = %d\n", result);
        printf("-------------\n");


	printf("foo2(21) in main \n");
        result = foo2(21);
        printf("result = %d\n", result);
        printf("-------------\n");

	return 0;
}

