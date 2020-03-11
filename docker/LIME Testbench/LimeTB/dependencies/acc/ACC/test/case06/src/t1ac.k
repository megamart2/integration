
after(): execution(int fct(int )){

   printf("after `fct' function execution\n");
}

after(): execution(void fct2(int )) {
   printf("after fct2 execution\n");
}

after(): execution(void fct3(int )) {
   printf("after fct3 execution\n");
}
