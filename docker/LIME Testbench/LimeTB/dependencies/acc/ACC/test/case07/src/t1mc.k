int fct(int a){

  printf("In `fct'\n");

  if(a > 3) 
	return 100;
  else 
	return 9;
  
}

void fct2(int a) {
  printf("In fct2\n");
  return;
}

void fct3(int a) {
	printf("in fct3\n");
}


int main(){
  int i;

  i = fct(8);
 
  i = fct(0);

  printf("Result from `fct' %i\n", i);

  fct2(2);

  fct3(24);

  return 0;
}
