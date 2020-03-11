before(): call ($ foo2(...)) {
	printf("aspect1: before call foo2\n");
}

before(): call($ foo2(int , int (*)(char, int*), int)) {
        printf("aspect2: before call foo2\n");
}


before(int (*p)(char,int*)): call($ foo2(...)) && args($, p, int) {
	int temp= 99;
	printf("aspect3: before call foo2\n");
	(*p)('B', &temp);
}

before(): call($ foo2(...)) && args($, int (*)(char, int*), int) {
        printf("aspect4: before call foo2\n");
}

void around(int (*p)(char)) : call($ $3(...)) && args(p) {
	printf("aspect5:\n");
}

before(): call($ $6(...)) && args(int (*)(char)) {
	printf("aspect6:\n");
}

before(): call($ foo2(...)) && cflow(execution(void foo7(int (*)(char)))) {
	printf("aspect7:\n");
}

pointcut PC1(): execution(void foo7(int (*)(char))) ;


before(): call($ foo2(...)) && cflow(PC1()) {
	printf("aspect8:\n");
}

before(): PC1() {
	printf("aspect9:\n");
}

