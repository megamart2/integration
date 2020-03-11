extern void foo2(char * c);

void foo(int a) {
	printf("inside foo\n");
}

int foo3(char * s, int b) {
	printf("inside foo3, s =%s, b = %d\n", s, b);
	foo2("call foo2 in foo3\n");
	return 9;
}
int main() {
	foo(4);
	printf("---------\n");
	foo3("abc", 3);
	return 0;
}
