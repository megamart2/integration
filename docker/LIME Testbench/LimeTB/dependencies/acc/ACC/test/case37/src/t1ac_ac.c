int around(char * x) : call($ foo$(..., char *, $)) && args(...,x,$) { 
	printf("aspect: call function\n");
	if(x != 0) {
		proceed();
	}else {
		printf("aspect, the second last parameter is 0, skip the call\n");
	}
}
