
pointcut type2(): intype(MYSTRX3) || intype(union B) || intype(STRD);

introduce(): type2() {
	double newMember;
}

introduce(): intype(MYSTRX4) || intype(union B) || intype(STRD) {
	double newMember2;
}


introduce(): intype(MYSTRX3) {
        double f;
}

introduce(): intype(MYSTRX4) {
        double g;
}

introduce(): intype(MYSTRX5) {
        double h;
}

introduce(): intype(MYSTRX6) {
        double i;
}

introduce(): intype($STR$) {
	char * point;
}

after(): execution($ main(...)) {
	printf("aspect 2: after execution main\n");
}
