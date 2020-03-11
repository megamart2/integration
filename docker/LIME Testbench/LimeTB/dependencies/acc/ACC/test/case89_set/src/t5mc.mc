
int a = 99;


void foo() {
        int b;
	printf("in foo\n");
	printf("assignment: b = a = 1 \n");
	b = a = 1;
	printf("a = %d, b = %d \n" , a, b);
	printf("assignment: b=a=-1 \n");
	b = a = -1;
	printf("a = %d, b = %d \n", a, b);
        printf("end of foo\n");
}

int main() {
	foo();
	return 0;
}

