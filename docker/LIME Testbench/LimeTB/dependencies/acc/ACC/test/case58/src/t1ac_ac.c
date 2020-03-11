typedef union {
        struct A {
                int b;
        }d;
}MYU;

typedef union X {
        struct {
                int c;
        }p;
}MYU2;

introduce(): intype(struct A) {
	int a;
}

introduce(): intype(MYU) {
	int b;
}

introduce(): intype(MYU2) {
	int c;
}

introduce(): intype(union X) {
	int d;
}
