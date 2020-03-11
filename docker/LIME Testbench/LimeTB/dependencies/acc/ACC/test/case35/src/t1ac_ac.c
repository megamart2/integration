
before(char x, int y) : call(char foo$(int, ..., char, int, ...)) && args(..., x,y) {
        printf("aspect1, call in function name start with foo , second param = %c, last param = %d\n", x, y);
}

before(int x): call(char foo5(int,int)) && args(i$t,x) {
        printf("aspect2 : call foo5, x = %d\n", x);

}

after(): call(char foo5(int, int)) && result( $har) {

        printf("aspect3: after call foo5\n");
}

before() : call(void foo(int)) && infunc( foo$ ) {
        printf("aspect4, call foo in function name start with foo \n");
}


before() : call(void foo(int)) && infunc( $n ) {
        printf("aspect5, call foo in function name end with n \n");
}

before() : call(void foo(int)) && infunc( f$3) {
        printf("aspect6, call foo in functio name start with f, and end with 3 \n");
}

before(int i, int j ): call( $ f$(int, ..., i$t)) && args(i, ..., j) {
        printf("aspect7,catch a call function, first parameter value = %d, last parameter value = %d\n", i, j);
}

before() : call(void c$bc(int)) {
        printf("aspect8, for c$bc function call\n");
}

