extern void foo(int );

void foo2(char * s) {
	printf("inside foo2, s = %s\n", s);
	foo(3);
}

