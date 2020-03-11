
int fct(int a){
 
  if (a < 10)
    return 100;
  else
    return 400;
}

void foo( int (*c) (int), int i){

 printf("%i\n", c(i) );

}

int main(){
  int i;

  i = fct(8);


}
