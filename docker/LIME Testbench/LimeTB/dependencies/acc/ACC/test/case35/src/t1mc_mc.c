

void foo(int k) {
        printf("inside foo, k = %d\n", k);

}


void foo2() {
        printf("call foo in foo2\n");
        foo(2);
}

void foo4() {
        printf("call foo in foo4\n");
        foo(2);
}

char foo5(int a, int b) {
        printf("in foo5, second argument = %d\n", b);
}

char foo6(int a, char b, int c) {
        printf("inside foo6\n");
}


char foo7(int a, char b, int c, char d, int e, char f, int g) {
        printf("inside foo7, a = %d, b = %c, c = %d, d = %c, e = %d, f = %c , g = %d\n", a, b, c
, d, e, f, g);
}


void fo3() {
        printf("call foo in fo3\n");
        foo(1);
}

void fo(int a, int b) {
        printf("in fo, first = %d, last = %d\n", a, b);
}

void f3o(int a, char c, int b) {
        printf("in f3o, first = %d, last = %d\n", a, b);
}

void f44o(int a, int * c, int b) {
        printf("in f44o, first = %d, last = %d\n", a ,b);
}

void cbc(int a) {
        printf("in cbc\n");
}

void cbcbc(int b) {
        printf("in cbcbc\n");
}


int main() {
        printf("call foo in main\n");
        foo(3);
        foo2();
        foo4();
        fo3();

        fo(1,2);
        f3o(3,7,4);
        f44o(5,0,6);

        cbc(3);
        cbcbc(4);


        foo5(3,5);
        foo6(3,'w',4);

        foo7(1,'a', 2, 'b', 3, 'c', 4);

        return 0;
}
