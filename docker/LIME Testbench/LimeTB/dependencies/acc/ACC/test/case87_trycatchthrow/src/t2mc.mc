
int foo2(int i) {
        printf("\t\t\t in foo2\n");
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
	printf("end of main\n");
	return 0;
}

