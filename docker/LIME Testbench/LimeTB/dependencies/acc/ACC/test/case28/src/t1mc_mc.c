
void foo1( int info) {
        printf("inside foo1, info = %d\n", info);
}

int foo2( int info) {
	printf("inside foo2, info = %d\n", info);
	return info * 2;
}

int main() {

	foo1(3);

	foo2(9);


	foo1(4);

	foo2(-2);

	return 0;
}
