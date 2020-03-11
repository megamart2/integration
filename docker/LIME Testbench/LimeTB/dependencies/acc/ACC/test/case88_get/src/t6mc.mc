
int a = 99;

void foo3() {
	printf("in foo3\n");
}

void foo2(int i) {
        printf("in foo2, assign a to be %d \n", i);
	a = i;
        printf("in foo2, a = %d\n", a);
        printf("end of foo2\n");
}

void foo1(int i) {
        printf("in foo1, call foo2(%d) \n", i);
        foo2(i);
        printf("end of foo1\n");
}

void foo() {
        printf("in foo, call foo1(2) \n");
	foo1(2);
	printf("in foo, call foo1(-1) \n");
	foo1(-1);
        printf("end of foo\n");
}

int main() {
	foo();
	printf("call foo3() in main\n");
	foo3();
	return 0;
}

