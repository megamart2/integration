
int a = 99;

void foo2() {
        
	printf("in foo2, assign a be 2\n");
	a = a =  2;
	
	a ? 4 : 5;
	
	printf("end of foo2\n");
}

void foo1() {
       	int a = 1;
	printf("in foo1, local a shadows global a \n");
        printf("a = %d\n", a);
	printf("end of foo1\n");
}


void foo() {
        printf("in foo\n");
	printf("a = %d\n" , a);
        printf("end of foo\n");
}

int main() {
	foo();
	foo1();
	foo2();
	foo();
	return 0;
}

