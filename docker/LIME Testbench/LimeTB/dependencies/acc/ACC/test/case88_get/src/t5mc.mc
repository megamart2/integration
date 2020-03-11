
int a = 99;


void foo() {
        printf("in foo\n");
	printf("a = %d\n" , a);
	printf("assign a to be -1 \n");
	a = -1;
	printf("a = %d\n", a);
        printf("end of foo\n");
}

int main() {
	foo();
	return 0;
}

