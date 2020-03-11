# 1 "SelectionSort.k"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "SelectionSort.k"

int incr(int x){
  int q;
  printf("inside incr, x = %d\n", x);

  return ++x;
}


int main(int argc, char *argv[]){
	int p;
	printf("before call incr \n");
    
	p = incr(99);

	printf("after call incr p = %d \n", p);

	return 0;
}
