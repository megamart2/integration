int around(int x): call(int foo2(int)) && args(x) {
	printf("aspect 1, has proceed\n");
	return proceed();;
}

int around(int x) : call(int foo2(int)) && args(x){
	printf("aspect 2, no proceed \n");
        return 99;
}


int around(int x) : call(int foo2(int)) && args(x){
        printf("aspect 3, has proceed \n");
        return 2020;
}

