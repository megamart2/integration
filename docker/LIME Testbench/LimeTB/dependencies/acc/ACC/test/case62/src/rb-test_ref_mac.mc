# 1 "rb-test.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "rb-test.c"
# 26 "rb-test.c"
# 1 "/usr/include/assert.h" 1 3 4
# 42 "/usr/include/assert.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 43 "/usr/include/assert.h" 2 3 4
# 75 "/usr/include/assert.h" 3 4

void __assert_rtn(const char *, const char *, int, const char *) __attribute__((__noreturn__));
void __eprintf(const char *, const char *, unsigned, const char *) __attribute__((__noreturn__));

# 27 "rb-test.c" 2
# 1 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/limits.h" 1 3 4
# 11 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/limits.h" 3 4
# 1 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/syslimits.h" 1 3 4






# 1 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/limits.h" 1 3 4
# 122 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/limits.h" 3 4
# 1 "/usr/include/limits.h" 1 3 4
# 63 "/usr/include/limits.h" 3 4
# 1 "/usr/include/machine/limits.h" 1 3 4







# 1 "/usr/include/i386/limits.h" 1 3 4
# 39 "/usr/include/i386/limits.h" 3 4
# 1 "/usr/include/i386/_limits.h" 1 3 4
# 40 "/usr/include/i386/limits.h" 2 3 4
# 9 "/usr/include/machine/limits.h" 2 3 4
# 64 "/usr/include/limits.h" 2 3 4
# 1 "/usr/include/sys/syslimits.h" 1 3 4
# 65 "/usr/include/limits.h" 2 3 4
# 123 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/limits.h" 2 3 4
# 8 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/syslimits.h" 2 3 4
# 12 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/limits.h" 2 3 4
# 28 "rb-test.c" 2
# 1 "/usr/include/stdio.h" 1 3 4
# 64 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/_types.h" 1 3 4
# 27 "/usr/include/_types.h" 3 4
# 1 "/usr/include/sys/_types.h" 1 3 4
# 27 "/usr/include/sys/_types.h" 3 4
# 1 "/usr/include/machine/_types.h" 1 3 4
# 28 "/usr/include/machine/_types.h" 3 4
# 1 "/usr/include/i386/_types.h" 1 3 4
# 31 "/usr/include/i386/_types.h" 3 4
typedef signed char __int8_t;



typedef unsigned char __uint8_t;
typedef short __int16_t;
typedef unsigned short __uint16_t;
typedef int __int32_t;
typedef unsigned int __uint32_t;
typedef long long __int64_t;
typedef unsigned long long __uint64_t;

typedef long __darwin_intptr_t;
typedef unsigned int __darwin_natural_t;
# 64 "/usr/include/i386/_types.h" 3 4
typedef int __darwin_ct_rune_t;





typedef union {
 char __mbstate8[128];
 long long _mbstateL;
} __mbstate_t;

typedef __mbstate_t __darwin_mbstate_t;


typedef int __darwin_ptrdiff_t;





typedef long unsigned int __darwin_size_t;





typedef __builtin_va_list __darwin_va_list;





typedef int __darwin_wchar_t;




typedef __darwin_wchar_t __darwin_rune_t;


typedef int __darwin_wint_t;




typedef unsigned long __darwin_clock_t;
typedef __uint32_t __darwin_socklen_t;
typedef long __darwin_ssize_t;
typedef long __darwin_time_t;
# 29 "/usr/include/machine/_types.h" 2 3 4
# 28 "/usr/include/sys/_types.h" 2 3 4



struct mcontext;
struct mcontext64;
# 60 "/usr/include/sys/_types.h" 3 4
struct __darwin_pthread_handler_rec
{
 void (*__routine)(void *);
 void *__arg;
 struct __darwin_pthread_handler_rec *__next;
};
struct _opaque_pthread_attr_t { long __sig; char __opaque[36]; };
struct _opaque_pthread_cond_t { long __sig; char __opaque[24]; };
struct _opaque_pthread_condattr_t { long __sig; char __opaque[4]; };
struct _opaque_pthread_mutex_t { long __sig; char __opaque[40]; };
struct _opaque_pthread_mutexattr_t { long __sig; char __opaque[8]; };
struct _opaque_pthread_once_t { long __sig; char __opaque[4]; };
struct _opaque_pthread_rwlock_t { long __sig; char __opaque[124]; };
struct _opaque_pthread_rwlockattr_t { long __sig; char __opaque[12]; };
struct _opaque_pthread_t { long __sig; struct __darwin_pthread_handler_rec *__cleanup_stack; char __opaque[596]; };
# 96 "/usr/include/sys/_types.h" 3 4
typedef __int64_t __darwin_blkcnt_t;
typedef __int32_t __darwin_blksize_t;
typedef __int32_t __darwin_dev_t;
typedef unsigned int __darwin_fsblkcnt_t;
typedef unsigned int __darwin_fsfilcnt_t;
typedef __uint32_t __darwin_gid_t;
typedef __uint32_t __darwin_id_t;
typedef __uint32_t __darwin_ino_t;
typedef __darwin_natural_t __darwin_mach_port_name_t;
typedef __darwin_mach_port_name_t __darwin_mach_port_t;

typedef struct mcontext *__darwin_mcontext_t;
typedef struct mcontext64 *__darwin_mcontext64_t;



typedef __uint16_t __darwin_mode_t;
typedef __int64_t __darwin_off_t;
typedef __int32_t __darwin_pid_t;
typedef struct _opaque_pthread_attr_t
   __darwin_pthread_attr_t;
typedef struct _opaque_pthread_cond_t
   __darwin_pthread_cond_t;
typedef struct _opaque_pthread_condattr_t
   __darwin_pthread_condattr_t;
typedef unsigned long __darwin_pthread_key_t;
typedef struct _opaque_pthread_mutex_t
   __darwin_pthread_mutex_t;
typedef struct _opaque_pthread_mutexattr_t
   __darwin_pthread_mutexattr_t;
typedef struct _opaque_pthread_once_t
   __darwin_pthread_once_t;
typedef struct _opaque_pthread_rwlock_t
   __darwin_pthread_rwlock_t;
typedef struct _opaque_pthread_rwlockattr_t
   __darwin_pthread_rwlockattr_t;
typedef struct _opaque_pthread_t
   *__darwin_pthread_t;
typedef __uint32_t __darwin_sigset_t;
typedef __int32_t __darwin_suseconds_t;
typedef __uint32_t __darwin_uid_t;
typedef __uint32_t __darwin_useconds_t;
typedef unsigned char __darwin_uuid_t[16];



struct sigaltstack



{
 void *ss_sp;
 __darwin_size_t ss_size;
 int ss_flags;
};

typedef struct sigaltstack __darwin_stack_t;






struct ucontext



{
 int uc_onstack;
 __darwin_sigset_t uc_sigmask;
 __darwin_stack_t uc_stack;

 struct ucontext *uc_link;



 __darwin_size_t uc_mcsize;
 __darwin_mcontext_t uc_mcontext;
};

typedef struct ucontext __darwin_ucontext_t;





struct ucontext64 {
 int uc_onstack;
 __darwin_sigset_t uc_sigmask;
 __darwin_stack_t uc_stack;
 struct ucontext64 *uc_link;
 __darwin_size_t uc_mcsize;
 __darwin_mcontext64_t uc_mcontext64;
};
typedef struct ucontext64 __darwin_ucontext64_t;
# 28 "/usr/include/_types.h" 2 3 4

typedef int __darwin_nl_item;
typedef int __darwin_wctrans_t;



typedef unsigned long __darwin_wctype_t;
# 65 "/usr/include/stdio.h" 2 3 4






typedef __darwin_va_list va_list;




typedef __darwin_size_t size_t;







typedef __darwin_off_t fpos_t;
# 98 "/usr/include/stdio.h" 3 4
struct __sbuf {
 unsigned char *_base;
 int _size;
};


struct __sFILEX;
# 132 "/usr/include/stdio.h" 3 4
typedef struct __sFILE {
 unsigned char *_p;
 int _r;
 int _w;
 short _flags;
 short _file;
 struct __sbuf _bf;
 int _lbfsize;


 void *_cookie;
 int (*_close)(void *);
 int (*_read) (void *, char *, int);
 fpos_t (*_seek) (void *, fpos_t, int);
 int (*_write)(void *, const char *, int);


 struct __sbuf _ub;
 struct __sFILEX *_extra;
 int _ur;


 unsigned char _ubuf[3];
 unsigned char _nbuf[1];


 struct __sbuf _lb;


 int _blksize;
 fpos_t _offset;
} FILE;







extern FILE __sF[];


# 248 "/usr/include/stdio.h" 3 4

void clearerr(FILE *);
int fclose(FILE *);
int feof(FILE *);
int ferror(FILE *);
int fflush(FILE *);
int fgetc(FILE *);
int fgetpos(FILE * , fpos_t *);
char *fgets(char * , int, FILE *);
FILE *fopen(const char * , const char * );
int fprintf(FILE * , const char * , ...) ;
int fputc(int, FILE *);
int fputs(const char * , FILE * );
size_t fread(void * , size_t, size_t, FILE * );
FILE *freopen(const char * , const char * ,
     FILE * ) ;
int fscanf(FILE * , const char * , ...) ;
int fseek(FILE *, long, int);
int fsetpos(FILE *, const fpos_t *);
long ftell(FILE *);
size_t fwrite(const void * , size_t, size_t, FILE * ) ;
int getc(FILE *);
int getchar(void);
char *gets(char *);

extern const int sys_nerr;
extern const char *const sys_errlist[];

void perror(const char *);
int printf(const char * , ...) ;
int putc(int, FILE *);
int putchar(int);
int puts(const char *);
int remove(const char *);
int rename (const char *, const char *);
void rewind(FILE *);
int scanf(const char * , ...) ;
void setbuf(FILE * , char * );
int setvbuf(FILE * , char * , int, size_t);
int sprintf(char * , const char * , ...) ;
int sscanf(const char * , const char * , ...) ;
FILE *tmpfile(void);
char *tmpnam(char *);
int ungetc(int, FILE *);
int vfprintf(FILE * , const char * , va_list) ;
int vprintf(const char * , va_list) ;
int vsprintf(char * , const char * , va_list) ;

int asprintf(char **, const char *, ...) ;
int vasprintf(char **, const char *, va_list) ;


# 308 "/usr/include/stdio.h" 3 4

char *ctermid(char *);

char *ctermid_r(char *);

FILE *fdopen(int, const char *);

char *fgetln(FILE *, size_t *);

int fileno(FILE *);
void flockfile(FILE *);

const char
 *fmtcheck(const char *, const char *);
int fpurge(FILE *);

int fseeko(FILE *, fpos_t, int);
fpos_t ftello(FILE *);
int ftrylockfile(FILE *);
void funlockfile(FILE *);
int getc_unlocked(FILE *);
int getchar_unlocked(void);

int getw(FILE *);

int pclose(FILE *);
FILE *popen(const char *, const char *);
int putc_unlocked(int, FILE *);
int putchar_unlocked(int);

int putw(int, FILE *);
void setbuffer(FILE *, char *, int);
int setlinebuf(FILE *);

int snprintf(char * , size_t, const char * , ...) ;
char *tempnam(const char *, const char *);
int vfscanf(FILE * , const char * , va_list) ;
int vscanf(const char * , va_list) ;
int vsnprintf(char * , size_t, const char * , va_list) ;
int vsscanf(const char * , const char * , va_list) ;

FILE *zopen(const char *, const char *, int);








FILE *funopen(const void *,
  int (*)(void *, char *, int),
  int (*)(void *, const char *, int),
  fpos_t (*)(void *, fpos_t, int),
  int (*)(void *));

# 372 "/usr/include/stdio.h" 3 4

int __srget(FILE *);
int __svfscanf(FILE *, const char *, va_list) ;
int __swbuf(int, FILE *);








static __inline int __sputc(int _c, FILE *_p) {
 if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
  return (*_p->_p++ = _c);
 else
  return (__swbuf(_c, _p));
}
# 29 "rb-test.c" 2
# 1 "rb.h" 1
# 29 "rb.h"
# 1 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/stddef.h" 1 3 4
# 152 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 326 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/stddef.h" 3 4
typedef int wchar_t;
# 30 "rb.h" 2


typedef int rb_comparison_func (const void *rb_a, const void *rb_b,
                                 void *rb_param);
typedef void rb_item_func (void *rb_item, void *rb_param);
typedef void *rb_copy_func (void *rb_item, void *rb_param);




struct libavl_allocator
  {
    void *(*libavl_malloc) (struct libavl_allocator *, size_t libavl_size);
    void (*libavl_free) (struct libavl_allocator *, void *libavl_block);
  };



extern struct libavl_allocator rb_allocator_default;
void *rb_malloc (struct libavl_allocator *, size_t);
void rb_free (struct libavl_allocator *, void *);







struct rb_table
  {
    struct rb_node *rb_root;
    rb_comparison_func *rb_compare;
    void *rb_param;
    struct libavl_allocator *rb_alloc;


    unsigned long rb_generation;
  };


enum rb_color
  {
    RB_BLACK,
    RB_RED
  };


struct rb_node
  {
    struct rb_node *rb_link[2];
    void *rb_data;
    unsigned char rb_color;
  };


struct rb_traverser
  {
    struct rb_table *rb_table;
    struct rb_node *rb_node;
    struct rb_node *rb_stack[48];

    size_t rb_height;
    unsigned long rb_generation;
  };


struct rb_table *rb_create (rb_comparison_func *, void *,
                              struct libavl_allocator *);
struct rb_table *rb_copy (const struct rb_table *, rb_copy_func *,
                            rb_item_func *, struct libavl_allocator *);
void rb_destroy (struct rb_table *, rb_item_func *);
void **rb_probe (struct rb_table *, void *);
void *rb_insert (struct rb_table *, void *);
void *rb_replace (struct rb_table *, void *);
void *rb_delete (struct rb_table *, const void *);
void *rb_find (const struct rb_table *, const void *);
void rb_assert_insert (struct rb_table *, void *);
void *rb_assert_delete (struct rb_table *, void *);





void rb_t_init (struct rb_traverser *, struct rb_table *);
void *rb_t_first (struct rb_traverser *, struct rb_table *);
void *rb_t_last (struct rb_traverser *, struct rb_table *);
void *rb_t_find (struct rb_traverser *, struct rb_table *, void *);
void *rb_t_insert (struct rb_traverser *, struct rb_table *, void *);
void *rb_t_copy (struct rb_traverser *, const struct rb_traverser *);
void *rb_t_next (struct rb_traverser *);
void *rb_t_prev (struct rb_traverser *);
void *rb_t_cur (struct rb_traverser *);
void *rb_t_replace (struct rb_traverser *, void *);
# 30 "rb-test.c" 2
# 1 "test.h" 1
# 39 "test.h"
int test_correctness (struct libavl_allocator *allocator,
                      int insert[], int delete[], int n, int verbosity);
int test_overflow (struct libavl_allocator *, int order[], int n,
                   int verbosity);
int compare_ints (const void *pa, const void *pb, void *param);
# 31 "rb-test.c" 2



static void
print_tree_structure (const struct rb_node *node, int level)
{



  if (level > 16)
    {
      printf ("[...]");
      return;
    }

  if (node == ((void *)0))
    return;

  printf ("%d", *(int *) node->rb_data);
  if (node->rb_link[0] != ((void *)0) || node->rb_link[1] != ((void *)0))
    {
      putchar ('(');

      print_tree_structure (node->rb_link[0], level + 1);
      if (node->rb_link[1] != ((void *)0))
        {
          putchar (',');
          print_tree_structure (node->rb_link[1], level + 1);
        }

      putchar (')');
    }
}


void
print_whole_tree (const struct rb_table *tree, const char *title)
{
  printf ("%s: ", title);
  print_tree_structure (tree->rb_root, 0);
  putchar ('\n');
}






static int
check_traverser (struct rb_traverser *trav, int i, int n, const char *label)
{
  int okay = 1;
  int *cur, *prev, *next;

  prev = rb_t_prev (trav);
  if ((i == 0 && prev != ((void *)0))
      || (i > 0 && (prev == ((void *)0) || *prev != i - 1)))
    {
      printf ("   %s traverser ahead of %d, but should be ahead of %d.\n",
              label, prev != ((void *)0) ? *prev : -1, i == 0 ? -1 : i - 1);
      okay = 0;
    }
  rb_t_next (trav);

  cur = rb_t_cur (trav);
  if (cur == ((void *)0) || *cur != i)
    {
      printf ("   %s traverser at %d, but should be at %d.\n",
              label, cur != ((void *)0) ? *cur : -1, i);
      okay = 0;
    }

  next = rb_t_next (trav);
  if ((i == n - 1 && next != ((void *)0))
      || (i != n - 1 && (next == ((void *)0) || *next != i + 1)))
    {
      printf ("   %s traverser behind %d, but should be behind %d.\n",
              label, next != ((void *)0) ? *next : -1, i == n - 1 ? -1 : i + 1);
      okay = 0;
    }
  rb_t_prev (trav);

  return okay;
}



static int
compare_trees (struct rb_node *a, struct rb_node *b)
{
  int okay;

  if (a == ((void *)0) || b == ((void *)0))
    {
      ((void) (__builtin_expect(!(a == ((void *)0) && b == ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb-test.c", 125, "a == NULL && b == NULL"), 0) : 0));
      return 1;
    }

  if (*(int *) a->rb_data != *(int *) b->rb_data
      || ((a->rb_link[0] != ((void *)0)) != (b->rb_link[0] != ((void *)0)))
      || ((a->rb_link[1] != ((void *)0)) != (b->rb_link[1] != ((void *)0)))
      || a->rb_color != b->rb_color)
    {
      printf (" Copied nodes differ: a=%d%c b=%d%c a:",
              *(int *) a->rb_data, a->rb_color == RB_RED ? 'r' : 'b',
              *(int *) b->rb_data, b->rb_color == RB_RED ? 'r' : 'b');

      if (a->rb_link[0] != ((void *)0))
        printf ("l");
      if (a->rb_link[1] != ((void *)0))
        printf ("r");

      printf (" b:");
      if (b->rb_link[0] != ((void *)0))
        printf ("l");
      if (b->rb_link[1] != ((void *)0))
        printf ("r");

      printf ("\n");
      return 0;
    }

  okay = 1;
  if (a->rb_link[0] != ((void *)0))
    okay &= compare_trees (a->rb_link[0], b->rb_link[0]);
  if (a->rb_link[1] != ((void *)0))
    okay &= compare_trees (a->rb_link[1], b->rb_link[1]);
  return okay;
}
# 169 "rb-test.c"
static void
recurse_verify_tree (struct rb_node *node, int *okay, size_t *count,
                     int min, int max, int *bh)
{
  int d;
  size_t subcount[2];
  int subbh[2];

  if (node == ((void *)0))
    {
      *count = 0;
      *bh = 0;
      return;
    }
  d = *(int *) node->rb_data;

  if (min > max)
    {
      printf (" Parents of node %d constrain it to empty range %d...%d.\n",
              d, min, max);
      *okay = 0;
    }
  else if (d < min || d > max)
    {
      printf (" Node %d is not in range %d...%d implied by its parents.\n",
              d, min, max);
      *okay = 0;
    }

  recurse_verify_tree (node->rb_link[0], okay, &subcount[0],
                       min, d - 1, &subbh[0]);
  recurse_verify_tree (node->rb_link[1], okay, &subcount[1],
                       d + 1, max, &subbh[1]);
  *count = 1 + subcount[0] + subcount[1];
  *bh = (node->rb_color == RB_BLACK) + subbh[0];

  if (node->rb_color != RB_RED && node->rb_color != RB_BLACK)
    {
      printf (" Node %d is neither red nor black (%d).\n",
              d, node->rb_color);
      *okay = 0;
    }


  if (node->rb_color == RB_RED)
    {
      if (node->rb_link[0] != ((void *)0) && node->rb_link[0]->rb_color == RB_RED)
        {
          printf (" Red node %d has red left child %d\n",
                  d, *(int *) node->rb_link[0]->rb_data);
          *okay = 0;
        }

      if (node->rb_link[1] != ((void *)0) && node->rb_link[1]->rb_color == RB_RED)
        {
          printf (" Red node %d has red right child %d\n",
                  d, *(int *) node->rb_link[1]->rb_data);
          *okay = 0;
        }
    }


  if (subbh[0] != subbh[1])
    {
      printf (" Node %d has two different black-heights: left bh=%d, "
              "right bh=%d\n", d, subbh[0], subbh[1]);
      *okay = 0;
    }
}





static int
verify_tree (struct rb_table *tree, int array[], size_t n)
{
  int okay = 1;
# 259 "rb-test.c"
  if (okay)
    {
      if (tree->rb_root != ((void *)0) && tree->rb_root->rb_color != RB_BLACK)
        {
          printf (" Tree's root is not black.\n");
          okay = 0;
        }
    }

  if (okay)
    {

      size_t count;
      int bh;

      recurse_verify_tree (tree->rb_root, &okay, &count, 0, 2147483647, &bh);
      if (count != n)
        {
          printf (" Tree has %lu nodes, but should have %lu.\n",
                  (unsigned long) count, (unsigned long) n);
          okay = 0;
        }
    }

  if (okay)
    {

      size_t i;

      for (i = 0; i < n; i++)
        if (rb_find (tree, &array[i]) == ((void *)0))
          {
            printf (" Tree does not contain expected value %d.\n", array[i]);
            okay = 0;
          }
    }

  if (okay)
    {

      struct rb_traverser trav;
      size_t i;
      int prev = -1;
      int *item;

      for (i = 0, item = rb_t_first (&trav, tree); i < 2 * n && item != ((void *)0);
           i++, item = rb_t_next (&trav))
        {
          if (*item <= prev)
            {
              printf (" Tree out of order: %d follows %d in traversal\n",
                      *item, prev);
              okay = 0;
            }

          prev = *item;
        }

      if (i != n)
        {
          printf (" Tree should have %lu items, but has %lu in traversal\n",
                  (unsigned long) n, (unsigned long) i);
          okay = 0;
        }
    }

  if (okay)
    {

      struct rb_traverser trav;
      size_t i;
      int next = 2147483647;
      int *item;

      for (i = 0, item = rb_t_last (&trav, tree); i < 2 * n && item != ((void *)0);
           i++, item = rb_t_prev (&trav))
        {
          if (*item >= next)
            {
              printf (" Tree out of order: %d precedes %d in traversal\n",
                      *item, next);
              okay = 0;
            }

          next = *item;
        }

      if (i != n)
        {
          printf (" Tree should have %lu items, but has %lu in reverse\n",
                  (unsigned long) n, (unsigned long) i);
          okay = 0;
        }
    }

  if (okay)
    {

      struct rb_traverser init, first, last;
      int *cur, *prev, *next;

      rb_t_init (&init, tree);
      rb_t_first (&first, tree);
      rb_t_last (&last, tree);

      cur = rb_t_cur (&init);
      if (cur != ((void *)0))
        {
          printf (" Inited traverser should be null, but is actually %d.\n",
                  *cur);
          okay = 0;
        }

      next = rb_t_next (&init);
      if (next != rb_t_cur (&first))
        {
          printf (" Next after null should be %d, but is actually %d.\n",
                  *(int *) rb_t_cur (&first), *next);
          okay = 0;
        }
      rb_t_prev (&init);

      prev = rb_t_prev (&init);
      if (prev != rb_t_cur (&last))
        {
          printf (" Previous before null should be %d, but is actually %d.\n",
                  *(int *) rb_t_cur (&last), *prev);
          okay = 0;
        }
      rb_t_next (&init);
    }

  return okay;
}






int
test_correctness (struct libavl_allocator *allocator,
                  int insert[], int delete[], int n, int verbosity)
{
  struct rb_table *tree;
  int okay = 1;
  int i;


  tree = rb_create (compare_ints, ((void *)0), allocator);
  if (tree == ((void *)0))
    {
      if (verbosity >= 0)
        printf ("  Out of memory creating tree.\n");
      return 1;
    }

  for (i = 0; i < n; i++)
    {






      {
        void **p = rb_probe (tree, &insert[i]);
        if (p == ((void *)0))
          {
            if (verbosity >= 0)
              printf ("    Out of memory in insertion.\n");
            rb_destroy (tree, ((void *)0));
            return 1;
          }
        if (*p != &insert[i])
          printf ("    Duplicate item in tree!\n");
      }

      if (verbosity >= 3)
        print_whole_tree (tree, "    Afterward");

      if (!verify_tree (tree, insert, i + 1))
        return 0;
    }


  for (i = 0; i < n; i++)
    {
      struct rb_traverser x, y, z;
      int *deleted;

      if (insert[i] == delete[i])
        continue;





      if (rb_t_find (&x, tree, &insert[i]) == ((void *)0))
        {
          printf ("    Can't find item %d in tree!\n", insert[i]);
          continue;
        }

      okay &= check_traverser (&x, insert[i], n, "Predeletion");






      deleted = rb_delete (tree, &delete[i]);
      if (deleted == ((void *)0) || *deleted != delete[i])
        {
          okay = 0;
          if (deleted == ((void *)0))
            printf ("    Deletion failed.\n");
          else
            printf ("    Wrong node %d returned.\n", *deleted);
        }

      rb_t_copy (&y, &x);




      if (rb_t_insert (&z, tree, &delete[i]) == ((void *)0))
        {
          if (verbosity >= 0)
            printf ("    Out of memory re-inserting item.\n");
          rb_destroy (tree, ((void *)0));
          return 1;
        }

      okay &= check_traverser (&x, insert[i], n, "Postdeletion");
      okay &= check_traverser (&y, insert[i], n, "Copied");
      okay &= check_traverser (&z, delete[i], n, "Insertion");

      if (!verify_tree (tree, insert, n))
        return 0;
    }


  for (i = 0; i < n; i++)
    {
      int *deleted;






      deleted = rb_delete (tree, &delete[i]);
      if (deleted == ((void *)0) || *deleted != delete[i])
        {
          okay = 0;
          if (deleted == ((void *)0))
            printf ("    Deletion failed.\n");
          else
            printf ("    Wrong node %d returned.\n", *deleted);
        }

      if (verbosity >= 3)
        print_whole_tree (tree, "    Afterward");

      if (!verify_tree (tree, delete + i + 1, n - i - 1))
        return 0;






      {
        struct rb_table *copy = rb_copy (tree, ((void *)0), ((void *)0), ((void *)0));
        if (copy == ((void *)0))
          {
            if (verbosity >= 0)
              printf ("  Out of memory in copy\n");
            rb_destroy (tree, ((void *)0));
            return 1;
          }

        okay &= compare_trees (tree->rb_root, copy->rb_root);
        rb_destroy (copy, ((void *)0));
      }
    }

  if (rb_delete (tree, &insert[0]) != ((void *)0))
    {
      printf (" Deletion from empty tree succeeded.\n");
      okay = 0;
    }


  rb_destroy (tree, ((void *)0));

  return okay;
}

static int
test_bst_t_first (struct rb_table *tree, int n)
{
  struct rb_traverser trav;
  int *first;

  first = rb_t_first (&trav, tree);
  if (first == ((void *)0) || *first != 0)
    {
      printf ("    First item test failed: expected 0, got %d\n",
              first != ((void *)0) ? *first : -1);
      return 0;
    }

  return 1;
}

static int
test_bst_t_last (struct rb_table *tree, int n)
{
  struct rb_traverser trav;
  int *last;

  last = rb_t_last (&trav, tree);
  if (last == ((void *)0) || *last != n - 1)
    {
      printf ("    Last item test failed: expected %d, got %d\n",
              n - 1, last != ((void *)0) ? *last : -1);
      return 0;
    }

  return 1;
}

static int
test_bst_t_find (struct rb_table *tree, int n)
{
  int i;

  for (i = 0; i < n; i++)
    {
      struct rb_traverser trav;
      int *iter;

      iter = rb_t_find (&trav, tree, &i);
      if (iter == ((void *)0) || *iter != i)
        {
          printf ("    Find item test failed: looked for %d, got %d\n",
                  i, iter != ((void *)0) ? *iter : -1);
          return 0;
        }
    }

  return 1;
}

static int
test_bst_t_insert (struct rb_table *tree, int n)
{
  int i;

  for (i = 0; i < n; i++)
    {
      struct rb_traverser trav;
      int *iter;

      iter = rb_t_insert (&trav, tree, &i);
      if (iter == ((void *)0) || iter == &i || *iter != i)
        {
          printf ("    Insert item test failed: inserted dup %d, got %d\n",
                  i, iter != ((void *)0) ? *iter : -1);
          return 0;
        }
    }

  return 1;
}

static int
test_bst_t_next (struct rb_table *tree, int n)
{
  struct rb_traverser trav;
  int i;

  rb_t_init (&trav, tree);
  for (i = 0; i < n; i++)
    {
      int *iter = rb_t_next (&trav);
      if (iter == ((void *)0) || *iter != i)
        {
          printf ("    Next item test failed: expected %d, got %d\n",
                  i, iter != ((void *)0) ? *iter : -1);
          return 0;
        }
    }

  return 1;
}

static int
test_bst_t_prev (struct rb_table *tree, int n)
{
  struct rb_traverser trav;
  int i;

  rb_t_init (&trav, tree);
  for (i = n - 1; i >= 0; i--)
    {
      int *iter = rb_t_prev (&trav);
      if (iter == ((void *)0) || *iter != i)
        {
          printf ("    Previous item test failed: expected %d, got %d\n",
                  i, iter != ((void *)0) ? *iter : -1);
          return 0;
        }
    }

  return 1;
}

static int
test_bst_copy (struct rb_table *tree, int n)
{
  struct rb_table *copy = rb_copy (tree, ((void *)0), ((void *)0), ((void *)0));
  int okay = compare_trees (tree->rb_root, copy->rb_root);

  rb_destroy (copy, ((void *)0));

  return okay;
}






int
test_overflow (struct libavl_allocator *allocator,
               int order[], int n, int verbosity)
{

  typedef int test_func (struct rb_table *, int n);


  struct test
    {
      test_func *func;
      const char *name;
    };


  static const struct test test[] =
    {
      {test_bst_t_first, "first item"},
      {test_bst_t_last, "last item"},
      {test_bst_t_find, "find item"},
      {test_bst_t_insert, "insert item"},
      {test_bst_t_next, "next item"},
      {test_bst_t_prev, "previous item"},
      {test_bst_copy, "copy tree"},
    };

  const struct test *i;


  for (i = test; i < test + sizeof test / sizeof *test; i++)
    {
      struct rb_table *tree;
      int j;

      if (verbosity >= 2)
        printf ("  Running %s test...\n", i->name);

      tree = rb_create (compare_ints, ((void *)0), allocator);
      if (tree == ((void *)0))
        {
          printf ("    Out of memory creating tree.\n");
          return 1;
        }

      for (j = 0; j < n; j++)
        {
          void **p = rb_probe (tree, &order[j]);
          if (p == ((void *)0) || *p != &order[j])
            {
              if (p == ((void *)0) && verbosity >= 0)
                printf ("    Out of memory in insertion.\n");
              else if (p != ((void *)0))
                printf ("    Duplicate item in tree!\n");
              rb_destroy (tree, ((void *)0));
              return p == ((void *)0);
            }
        }

      if (i->func (tree, n) == 0)
        return 0;

      if (verify_tree (tree, order, n) == 0)
        return 0;
      rb_destroy (tree, ((void *)0));
    }

  return 1;
}
