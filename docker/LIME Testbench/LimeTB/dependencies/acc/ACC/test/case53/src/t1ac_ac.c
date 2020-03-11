introduce(): intype(struct A) {
	int a;
	char b;
	char * c;
}

introduce(): intype(struct A) {
	char d;
}

introduce(): intype(union B) {
	long long a;
	int (*funp)(int) ;
}


introduce(): intype(STRD) {
	double c;
}

introduce(): intype(struct X) {
	double c;
}

introduce(): intype(MYSTRX) {
	double d;
}

introduce(): intype(MYSTRX2) {
        double e;
}


before(): execution($ main(...)) {
	printf("aspect 1: before executing main\n");
}
