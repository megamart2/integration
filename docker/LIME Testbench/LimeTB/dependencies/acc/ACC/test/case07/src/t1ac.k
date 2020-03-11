
after(int x, int y): execution(int fct(int )) && result(x) && args(y) {

   printf("after fct function execution, parameter = %d, result = %d \n", y, x);
}

after(int x, int y): call(int fct(int )) && result(x) && args(y) {

   printf("after fct function call, parameter = %d, result = %d \n", y, x);
}

