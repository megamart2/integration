before(): call($ foo(...)) {
	printf("aspect : call foo\n");
}

void around(): call($ foo(...)) {
	printf("around aspect: call foo\n");
	proceed();
}

