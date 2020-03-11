struct X {
	int a;
};


void callme() {
	char  * a;
	struct X abc;
	printf("sizeof(a) = %d\n", sizeof a);
	printf("sizeof(*a) = %d\n", sizeof *a);
	printf("sizeof(struct X) = %d\n", sizeof(abc));
}


int around(int p[]): call($ foo1($)) && args(p) {
	printf("aspect1: call %s from %s , p[0] = %d\n", this->targetName, this->funcName, p[0]);
	proceed();
	callme();
	printf("aspect: end\n");
	return 0;
}

introduce(): intype(struct X) {
	int b;
}


