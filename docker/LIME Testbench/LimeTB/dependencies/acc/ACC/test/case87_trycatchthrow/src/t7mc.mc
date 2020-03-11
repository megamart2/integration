int foo4(int i) {
	printf("in foo4\n");
	return i;
}

int foo3(int i) {
	printf("\t\t\t in foo3\n");
	return i;
}

int foo2(int i) {
        printf("\t\t\t in foo2\n");
        foo3(i);
	printf("\t\t\t end of foo2\n");
	return i;
}

int foo1(int i) {
        printf("\t\t in foo1\n");
        foo2(i);
        printf("\t\t end of foo1\n");
        return i;
}

int foo(int i) {
	printf("\t in foo\n");
	foo1(i);
	printf("\t end of foo\n");
	return i;
}


int main() {
	printf("in main, call foo\n");
	foo(1);
	printf("call foo4 in main\n");
	foo4(2);
	printf("end of main\n");
	return 0;
}

