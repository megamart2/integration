int foo1 (__const char *__nptr)  
	__attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__((__nonnull__));

void foo2 (__const char *__nptr)
        __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__((__nonnull__ (1) ));

void foo3 (__const char *__nptr)
        __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__((__nonnull__ (1,2)));

typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;
    int __kind;
    unsigned int __nusers;
    __extension__ union
    {
      int __spins;
      int __list;
    };
  } __data;
  char __size[24];
  long int __align;
} pthread_mutex_t;
