int around(char * x, int y) : 
	cflow(execution($ main(...))) && args(x, y) && call ($ foo3(...)) {
	printf("aspect: around, argument: x = %s, y = %d\n", x, y);
	printf("caller = %s, callee = %s \n", this->funcName, this->targetName);
	proceed();
}

