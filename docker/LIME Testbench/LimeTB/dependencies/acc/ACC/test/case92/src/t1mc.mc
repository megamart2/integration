unsigned foo1() {
	printf("in foo1\n");
}

signed foo2() {
        printf("in foo2\n");
}


unsigned int foo3() {
        printf("in foo3\n");
}


signed int foo4() {
        printf("in foo4\n");
}

void foo5(unsigned a) {
        printf("in foo5\n");
}

void foo6(signed a) {
        printf("in foo6\n");
}


void foo7(unsigned int a) {
        printf("in foo7\n");
}


void foo8(signed int a) {
	printf("in foo8\n");
}


int main() {
	foo1();
	foo2();
	foo3();
	foo4();

	foo5(1);
	foo6(1);
	foo7(1);
	foo8(1);
	
	return 0;
}
