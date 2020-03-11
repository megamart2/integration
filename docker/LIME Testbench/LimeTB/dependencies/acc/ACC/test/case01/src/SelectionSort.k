
void sort(int x[], int n){
   int temp;
   int min, i, j;
   
   printf("begin sorting\n");
   for (i = 0; i < n-1; i++) {
     min = i;
     for (j = i+1; j < n; j++) {
       if (x[min] > x[j]) {
          min = j;
       }
     }
     temp = x[i];
     x[i] = x[min];
     x[min] = temp;
   }
   printf("finish sorting\n");

}

int incr(int x){
  
  x = x +1;
  return x;
}

void printArray(int x[], int n){
   int i;
   
   for(i=0; i<n; i++){
      printf("%d ", x[i]); 
   }
   printf("\n");

} 

int main(int argc, char *argv[]){
    int x[5] = {3, 5, 2, 1, 4};
    int a;
    
   
    printf("initial array:\n");
    printArray(x, 5);
      
    sort(x, 5);
    printf("new array:\n");   
    printArray(x, 5);
    
    a = 8;
    printf("init value: %d\n", a);
    a = incr(a);
    printf("new value: %d\n", a);

    return 0;    
}
