pointcut callfoo(): call(int foo(char *)) ;		

pointcut callfooinfoo2(): callfoo() && infunc(foo2);	

pointcut callfooinmain(): callfoo() && infunc(main);	

before() : callfooinfoo2() {				
	printf("aspect: before call foo in foo2\n");
}

before() : callfooinmain() {				
	printf("aspect: before call foo in main\n");
}


