extern int printf(__const char *__restrict __format, ...);

void printfmine(char * s) {
        printf("call printfmine, %s \n", s);
}

void printfmine2(char *s, ...) {
	printf("call printfmine2, %s\n", s);
}
 
int foo1(void);

int foo1() {
	printf("here is foo1\n");
	printfmine("call printfmine inside foo1\n");
	printfmine2("call printfmine2 inside foo1\n");
	return 3;
}

int foo2();

int foo2(int a) {
	printf("here is foo2, a = %d\n", a);
	printfmine("call printfmine inside foo1\n");
	printfmine2("call printfmine2 inside foo1\n");
	return a;
}


int main() {
	foo1();
	foo2(4);
	return 0;
}

