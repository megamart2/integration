struct A { } ;



int foo1(int a) {
	printf("inside foo1\n");
	return 0;
}

void foo(a, b, c) int b; char a; int (*c)(int); 
{
  int d;
  printf("in foo, a = %c , b = %d\n", a, b);
  (*c)(3);
}

void foo2(a, b, c) int a; char b, c; {
	printf("in foo2\n");
}

int main() {
	foo('A', 4, foo1);
	foo2(3, 'a', 'b');
	printf("size of struct A = %d\n" , sizeof(struct A));
	return 0;
}
