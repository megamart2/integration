int foo4(void) {
	printf("\t\t\tin foo4\n\n");
	return 0;
}

int foo3(void) {
	printf("\t\tin foo3\n");
	printf("\t\tcall foo4 in foo3\n");
	foo4();
	printf("\t\tend of foo3\n");
	return 0;
}

int foo2(void) {
        printf("\tin foo2\n");
        printf("\tcall foo3 in foo2\n");
        foo3();
        printf("\tcall foo4 in foo2\n");
	foo4();
	printf("\tend of foo2\n");
        return 0;
}

int foo1(void) {
        printf("in foo1\n");
        printf("call foo2 in foo1\n");
        foo2();
        printf("call foo3 in foo1\n");
        foo3();
        printf("call foo4 in foo1\n");
	foo4();
	printf("end of foo1\n");
        return 0;
}

int main(void) {
	printf("call foo1 in main\n");
	foo1();
	printf("end of main\n");
	return 0;
}


