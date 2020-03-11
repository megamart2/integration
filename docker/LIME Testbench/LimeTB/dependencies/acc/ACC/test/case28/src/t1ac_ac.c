
void around (int i): execution(void foo1( int )) && args(i) {
        printf("in foo1 exec around advice, begin, i = %d\n", i);
	proceed();
	printf("in foo1 exec around advice, end\n");
}

int around (int i): execution(int foo2( int )) && args(i){
        int k;
	printf("in foo2 exec around advice, begin, i = %d\n", i);
        k = proceed();
        printf("in foo2 exec around advice, end \n");

	printf("result of proceed in exec = %d \n", k);
	return k;
}


void around (int i): call(void foo1( int )) && args(i){
        printf("in foo1 call around advice, begin, i = %d\n", i);
	proceed();
	printf("in foo1 call around advice, end\n");
}

int around (int i): call(int foo2( int )) && args(i){
        int k;
	printf("in foo2 call around advice, begin, i = %d\n", i);
        k = proceed();
        printf("in foo2 call around advice, end \n");

	printf("result of proceed in call = %d \n", k);
	return k;
}


