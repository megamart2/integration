before(): execution(void sort(int )){
  
   printf("advice 1\n");
}


/* test && composition */
before() : execution(void foo(int )) && execution(void sort(int )) {
	printf("advice 2 \n");
}

/* test || composition */
before() : execution(void foo(int )) || execution(void sort(int )) {
        printf("advice 3 \n");
}

/* test ! composition */
before() : ! execution(void foo(int )) {
        printf("advice 4\n");
}

/* test () composition */
before() : (execution(void foo(int ))) {
        printf("advice 5 \n");
}

/* test combination */
before() : ! (execution(void foo(int )) && ! execution(void sort(int ))) {
        printf("advice 6\n");
}

before() : execution(void foo(int )) || execution(void sort(int )) && !(execution(void sort(int ))) {
        printf("advice 7\n");
}

before() : (execution(void foo(int )) || execution(void sort(int ))) && !(execution(void sort(int ))) {
        printf("advice 8\n");
}

