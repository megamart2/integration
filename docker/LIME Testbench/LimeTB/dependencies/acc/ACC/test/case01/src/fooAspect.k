
before(): execution(int fct(int n)){
  
   printf("before fct function execution\n");
}

after(): execution(int fct(int n)){
  
   printf("after fct function execution\n");
}
