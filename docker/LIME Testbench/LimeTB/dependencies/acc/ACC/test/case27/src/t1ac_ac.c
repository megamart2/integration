struct X {
	int a;
};

union Y {
	int b;
};

enum Z { A , B };

before(): call(void foo1( struct X  )) {
        printf("before call foo1\n");
 }

before(): call(void foo2( struct X * )) {
        printf("before call foo2\n");
 }

before(): call(void foo3( union  Y   )) {
        printf("before call foo3\n");
 }

before(): call(void foo4( union Y *  )) {
        printf("before call foo4\n");
 }

before(): call(void foo5( enum Z  )) {
        printf("before call foo5\n");
 }

 
before(): call(void foo6( enum Z * )) {
        printf("before call foo6\n");
 }


