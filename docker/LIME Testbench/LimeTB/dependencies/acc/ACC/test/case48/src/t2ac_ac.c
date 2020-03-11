

int around(int x): call(int foo(int)) && args(x) {
	printf("aspect 1\n");
	if(x < 3) {
		printf("a < 3\n");
		return 33;
	}else {
		return proceed();
	}

}	

int around(int x) : call(int foo(int)) && args(x) && cflow(call($ foo2(...))) {
	printf("aspect 2, has proceed, args = %d \n", x);
	return proceed();
}


int around(int x) : call(int foo(int)) && args(x){
        printf("aspect 3\n");
        if(x < 20) {
                printf("a < 20\n");
                return 2020;
        }else {
                return proceed();
        }
}

