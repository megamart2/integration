/*
// Missing brackets in if-stmt leads to syntax error
// for woven code, as the if and the else branch will
// contain more code that takes care of the woven advice
// code, however, since there are no brackets, the weaver
// does not generate them.
//
// Maybe we should generate the brackets by default.
//
*/
int fct(int a){
 
  printf("In `fct'\n");

  if (a < 10)
    return 100;
  else
    return 400;
}

int main(){
  int i;

  i = fct(8);
  printf("Result from `fct' %i\n", i);
  return 0;
}
