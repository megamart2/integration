struct X {
	int a;
};

int foo1(int a[]) {
	printf("inside foo1, a[0] = %d, a[1] = %d\n", a[0], a[1]);
	return 0;
}


int main() {
	int a[3]= {1,2,3};
	foo1(a);
	return 0;

}
