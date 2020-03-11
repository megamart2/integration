void call1(int a, int b) {
	printf("in call1, a = %d, b = %d\n", a, b);
}

void * call2(int a, int b) {
	void * p = 0;
	printf("in call2, a = %d, b = %d\n", a, b);
	return 0;
}


void foo(int *g, void (callback)(int , int)) {

	printf("in foo, call call1 with 3, 4\n");
	(*callback)(3, 4);
	
	return;
}

void foo2(int g, void * (callback)(int, int)) {

	printf("in foo2, call call2 with 5, 6\n");
	(*callback)(5, 6);
	return ;
}


int main() {
	int p = 3;
	printf("call foo in main\n");
	foo(&p, call1);
	printf("\n");

	printf("call foo2 in main\n");
	foo2(p, call2);
	return 0;
}

