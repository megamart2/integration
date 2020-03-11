

typedef struct { int a[2]; } mystr;



void foo2() {
	printf("in foo2\n");
}

int foo() {
	printf("in foo\n");
	foo2();
	return 0;
}

int main(){
 printf("in main\n");
 foo();
 return 0;
}
