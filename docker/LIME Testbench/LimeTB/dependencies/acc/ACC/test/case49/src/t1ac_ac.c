/* test :
	
  	if(x < 3) : aspect 1
else  	if(x < 9) : aspect 2
else	if(x < 20): aspect 3
else    default handler in core program.
*/  


int around(int x): call(int foo(int)) && args(x) && cflow(call(void foo2(...))) {
	printf("aspect 1\n");
	if(x < 3) {
		printf("a < 3\n");
		return 33;
	}

}	

int around(int x) : call(int foo(int)) && args(x){
	printf("aspect 2\n");
        if(x < 9) {
                printf("a < 9\n");
                return 99;
        }else {
                return proceed();
        }
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

