
before(): execution(int fct(int )){
  
   printf("before `fct' function execution\n");
}

after(): execution(int fct(int )){
  
   printf("after `fct' function execution\n");
}

before(): call(int fct(int)) {
   printf("before 'fct' call\n");
}
