
struct pointcut {
	int pointcut;
};


/* a named pointcut for execution of foo1 */
pointcut foo1exec() : execution(int foo1(int *, int, int));

/* a named pointcut for calling foo1, with exposing second argument */
pointcut foo1call(int i): call(int foo1(int *, int,int)) && args(int*,i,int);

/* a named pointcut for call foo2 */
pointcut foo2call() : call (void foo2()) ;

pointcut foo2callInMain() : infunc(main) && foo2call();

pointcut foo2callInfoo1() : infunc(foo1) && foo2call();

/* a named pointcut for exec foo3 */
pointcut foo3exec() : execution(void foo3());

before() : foo1exec() {
        printf("advice:before execution of foo1\n");
}

before(int j, int k): foo1call(j) && args(int *, int , k) {
	printf("advice:before call foo1, second argu = %d, third argu = %d\n", j, k);
}

pointcut resultname(int k): result(k) ;

after(int j, int m): foo1call(j) && resultname(m) {
	printf("advice:after call foo1, second argum = %d, result = %d\n", j, m);

}

before() : foo2callInMain() {
	printf("advice:before call foo2 in main\n");
}

before(): foo2callInfoo1() {
	printf("advice:call foo2 in foo1\n");
}

void around(): foo3exec() {
	int poincut;
	printf("advice:around foo3 execution\n");
	proceed();
}
