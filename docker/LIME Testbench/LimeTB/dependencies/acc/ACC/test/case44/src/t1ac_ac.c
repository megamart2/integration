pointcut cflowfoo3(): call($ $(...)) && cflow(execution($ foo3(...)));

before(): cflowfoo3() {
	printf("aspect: within cflow of foo3, before, caller = %s\n", this->funcName);
	printf("aspect: within cflow of foo3, before, callee = %s\n", this->targetName);
	printf("aspect: within cflow of foo3, before, file = %s\n", this->fileName);
	 
}

after(): cflowfoo3() {
	printf("aspect: within cflow of foo3, after, call = %s\n", this->funcName);
}

before(): execution($ foo(...)) {
	printf("before execution of foo, caller = %s, callee = %s, file = %s\n",
		this->funcName,
		this->targetName,
		this->fileName);
}
