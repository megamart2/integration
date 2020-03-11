#1 "abc.h" 1 3 4

struct A {
	int * (*foo) ();
};

void foo();

void foo() {
	printf("inside foo\n");
}
	
int main() {

	foo();	
	return 0;
}
