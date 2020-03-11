pointcut callfoounderfoo3(char * x): call($ foo2(...)) && cflow(execution($ foo3(...))) && args(x);

void around(char * s) : callfoounderfoo3(s) {				
	printf("****aspect 1: around call foo2 in the control flow of foo3, argument = %s \n", s);
}

int around(char * x) : call($ foo(...)) && cflow(call($ foo2(...))) && args(x) {				
	printf("****aspect 2: around call foo in the control flow of foo2, argument = %s \n", x);
}

int around(): call($ foo4(...)) && cflow(execution($ foo5(...))) {
	int result;
	printf("****aspect 3: around call foo4 under foo5, start\n");
	result = proceed();
	printf("****aspect 3: around call foo4 under foo5, end, result = %d \n", result);
}

