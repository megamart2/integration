
void foo( ) {
  int a ;
  __builtin_va_list c;
  
  /* the syntax of __builtin_va_arg need to be translated correctly */
  a = (int)( __builtin_va_arg(c, char *));
}

