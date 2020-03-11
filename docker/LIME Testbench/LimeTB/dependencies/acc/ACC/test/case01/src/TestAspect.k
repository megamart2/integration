
/*
before(int a): call(void sort(int x[], int n)){
  
   printf("before sort function call\n");
}
*/

/*
void around()
   : 
   execution
   (void sort(int, int))
   {
   printf("Replace sort\n");
}*/

before(): execution(void sort(int [], int )){
  
   printf("before sort function execution\n");
}

after(): execution(void sort(int [], int )){
  
   printf("after sort function execution\n");
}


void around(): execution(void sort(int [], int )){
  
   printf("around sort function execution\n");
   printf("no sorting\n");
}

before(): call(int incr(int )){
  
   printf("before incr function call\n");
}

after(): call(int incr(int )){
  
   printf("after incr function call\n");
}

int around(): call(int incr(int )){
  
   printf("around incr function call\n");
   return 100;
}

