# 1 "t1ac.k"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "t1ac.k"
# 18 "t1ac.k"

int around(int x): execution(int incr(int )) && args(x){

   printf("around incr function call, parameter = %d \n", x);
   return x * 2 ;
}
