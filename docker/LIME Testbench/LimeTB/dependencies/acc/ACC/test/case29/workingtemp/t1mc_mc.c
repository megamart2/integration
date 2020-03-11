void foo(char * a) {
	printf("inside foo, a = %s\n", a);
}

void foo2() {
	printf("in foo2, call foo\n");
	foo("ABCDE\n");
}

int main() {
	foo("abcde");
	foo2();
	return 0;
}
