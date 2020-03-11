pointcut callfoounderfoo3(): call($ foo(...)) && cflow(execution($ foo3(...))) ;

pointcut callfoounderfoo4inmain() : call($ foo(...)) && cflow(call($ foo4(...)) && infunc(main));

after() : callfoounderfoo3() {				
	printf("****aspect 1: call foo in the control flow of foo3\n");
}

after() : call($ foo(...)) && cflow(call($ foo2(...))) {				
	printf("****aspect 2: call foo in the control flow of foo2\n");
}

after(): callfoounderfoo4inmain() {
	printf("****aspect 3: call foo in the control flow of : main --> foo4 \n");
}

