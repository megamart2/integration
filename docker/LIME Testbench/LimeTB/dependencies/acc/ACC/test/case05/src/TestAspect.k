
before(short x, int y) : execution(void foo3(short , int )) && args(x, y) {
        printf("before execution of foo3, short = %d, int = %d\n", x, y);
}



before(short x, int y) : call(void foo3(short , int )) && args(x, y) {
	printf("before call of foo3, short = %d, int = %d\n", x, y);
}

