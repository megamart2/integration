struct A {
	int b;
};



void foo(int a, char b, char * c) {


}

char * foo2(double a , char * b) {


}

struct A * foo3(const char a, const char * c) {

}

double foo4(struct A * a ) {


}


int main() {

	struct A a;
	foo(3, 4, "abc");


	foo2(3, "c");

	foo3('3', "ac");


	foo4(&a);

	return 0;
}
