
void around (int *i, int j): execution(void foo1( int * , int, int )) && args(int *, *i, j) {
        printf("in foo1 exec around advice, begin, last 2 parm = %d , %d \n", *i, j);
	printf("2nd argument is doubled by advice \n");
	*i = (*i) * 2; 
	proceed();
	printf("in foo1 exec around advice, end\n");
}

void around (int **i, int* j): call(void foo2( int , int*, int )) && args(int, *i, *j) {
        printf("in foo2 call around advice, begin, last 2 parm = %d , %d \n", **i, *j);
        printf("2nd argument decrease by 2\n");
	**i = (**i) -2;
        proceed();
}
