
before(): call (long long foo(int , long long, long long, int))  {
	printf("before call foo\n");
}

long long around() : call(long long foo(int, long long, long long, int)) {
	printf("around for foo\n");
	proceed();
}
