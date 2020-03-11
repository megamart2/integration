before(): callp(int foo()) || callp(int foo3()) {
	printf("aspect1: call %s by a function pointer in function %s \n", this->targetName, this->funcName);
}

/* test combinations of callp and other pointcut */

after(): callp(int foo()) && cflow(execution($ foo2(...))) {
	printf("aspect2: call foo by a function pointer in the cflow of foo2\n");
}

after(): callp(int foo()) && args() {
	printf("aspect3: callp && args\n");
}

after(): callp(int foo()) && args(double) {
        printf("aspect3: failed\n");
}

after(): callp(int foo()) && result(int) {
        printf("aspect4: callp && result\n");
}

after(): callp(int foo()) && result(double) {
        printf("aspect4: failed\n");
}


after(): callp(int foo()) && infile("t1mc$") {
        printf("aspect5: callp && infile\n");
}

after(): callp(int foo()) && infile("kkerewr") {
        printf("aspect5: failed\n");
}

after(): callp(int foo()) && infunc(foo2) {
        printf("aspect6: callp && infunc\n");
}

after(): callp(int foo()) && infunc(foo34) {
        printf("aspect6: failed\n");
}

