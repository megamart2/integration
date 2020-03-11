
extern void foo3();

void foo2() {
	printf("call foo3 in foo2 \n");
	foo3();
}

void foo1() {
       	printf("call foo2 in foo1\n");
	foo2();
}


void foo() {
	printf("call foo1 in foo\n");
	foo1();
}

int main() {
	printf("call foo in main\n");
	foo();
	return 0;
}

