before(): call(void foo(char *)) && infunc(main) {		
	printf("aspect: call foo in main \n");
}

before(): call(void foo(char *)) && infunc(foo2) {		
	printf("aspect: call foo in foo2\n");
}

