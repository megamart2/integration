# 1 "rb-test.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "rb-test.c"
# 26 "rb-test.c"
# 1 "/usr/include/assert.h" 1 3 4
# 37 "/usr/include/assert.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 313 "/usr/include/features.h" 3 4
# 1 "/usr/include/bits/predefs.h" 1 3 4
# 314 "/usr/include/features.h" 2 3 4
# 346 "/usr/include/features.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 353 "/usr/include/sys/cdefs.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 354 "/usr/include/sys/cdefs.h" 2 3 4
# 347 "/usr/include/features.h" 2 3 4
# 378 "/usr/include/features.h" 3 4
# 1 "/usr/include/gnu/stubs.h" 1 3 4



# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 5 "/usr/include/gnu/stubs.h" 2 3 4




# 1 "/usr/include/gnu/stubs-64.h" 1 3 4
# 10 "/usr/include/gnu/stubs.h" 2 3 4
# 379 "/usr/include/features.h" 2 3 4
# 38 "/usr/include/assert.h" 2 3 4
# 68 "/usr/include/assert.h" 3 4



extern void __assert_fail (__const char *__assertion, __const char *__file,
      unsigned int __line, __const char *__function)
     __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));


extern void __assert_perror_fail (int __errnum, __const char *__file,
      unsigned int __line,
      __const char *__function)
     __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));




extern void __assert (const char *__assertion, const char *__file, int __line)
     __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));



# 27 "rb-test.c" 2
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include-fixed/limits.h" 1 3 4
# 11 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include-fixed/limits.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include-fixed/syslimits.h" 1 3 4






# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include-fixed/limits.h" 1 3 4
# 122 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include-fixed/limits.h" 3 4
# 1 "/usr/include/limits.h" 1 3 4
# 145 "/usr/include/limits.h" 3 4
# 1 "/usr/include/bits/posix1_lim.h" 1 3 4
# 157 "/usr/include/bits/posix1_lim.h" 3 4
# 1 "/usr/include/bits/local_lim.h" 1 3 4
# 39 "/usr/include/bits/local_lim.h" 3 4
# 1 "/usr/include/linux/limits.h" 1 3 4
# 40 "/usr/include/bits/local_lim.h" 2 3 4
# 158 "/usr/include/bits/posix1_lim.h" 2 3 4
# 146 "/usr/include/limits.h" 2 3 4



# 1 "/usr/include/bits/posix2_lim.h" 1 3 4
# 150 "/usr/include/limits.h" 2 3 4
# 123 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include-fixed/limits.h" 2 3 4
# 8 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include-fixed/syslimits.h" 2 3 4
# 12 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include-fixed/limits.h" 2 3 4
# 28 "rb-test.c" 2
# 1 "/usr/include/stdio.h" 1 3 4
# 30 "/usr/include/stdio.h" 3 4




# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stddef.h" 1 3 4
# 211 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 35 "/usr/include/stdio.h" 2 3 4

# 1 "/usr/include/bits/types.h" 1 3 4
# 28 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 29 "/usr/include/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
# 131 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/typesizes.h" 1 3 4
# 132 "/usr/include/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef long int __swblk_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;

typedef long int __ssize_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;
# 37 "/usr/include/stdio.h" 2 3 4
# 45 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 65 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
# 75 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 32 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4




# 1 "/usr/include/wchar.h" 1 3 4
# 83 "/usr/include/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
# 21 "/usr/include/_G_config.h" 2 3 4

typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 53 "/usr/include/_G_config.h" 3 4
typedef int _G_int16_t __attribute__ ((__mode__ (__HI__)));
typedef int _G_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int _G_uint16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int _G_uint32_t __attribute__ ((__mode__ (__SI__)));
# 33 "/usr/include/libio.h" 2 3 4
# 53 "/usr/include/libio.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 54 "/usr/include/libio.h" 2 3 4
# 170 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;
# 180 "/usr/include/libio.h" 3 4
typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 203 "/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 271 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 319 "/usr/include/libio.h" 3 4
  __off64_t _offset;
# 328 "/usr/include/libio.h" 3 4
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;
  size_t __pad5;

  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 364 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, __const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);
# 416 "/usr/include/libio.h" 3 4
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 458 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__));

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__));
# 488 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__));
# 76 "/usr/include/stdio.h" 2 3 4
# 89 "/usr/include/stdio.h" 3 4


typedef _G_fpos_t fpos_t;




# 141 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/stdio_lim.h" 1 3 4
# 142 "/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;







extern int remove (__const char *__filename) __attribute__ ((__nothrow__));

extern int rename (__const char *__old, __const char *__new) __attribute__ ((__nothrow__));




extern int renameat (int __oldfd, __const char *__old, int __newfd,
       __const char *__new) __attribute__ ((__nothrow__));








extern FILE *tmpfile (void) ;
# 186 "/usr/include/stdio.h" 3 4
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__)) ;





extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__)) ;
# 204 "/usr/include/stdio.h" 3 4
extern char *tempnam (__const char *__dir, __const char *__pfx)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;








extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 229 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 243 "/usr/include/stdio.h" 3 4






extern FILE *fopen (__const char *__restrict __filename,
      __const char *__restrict __modes) ;




extern FILE *freopen (__const char *__restrict __filename,
        __const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 272 "/usr/include/stdio.h" 3 4

# 283 "/usr/include/stdio.h" 3 4
extern FILE *fdopen (int __fd, __const char *__modes) __attribute__ ((__nothrow__)) ;
# 296 "/usr/include/stdio.h" 3 4
extern FILE *fmemopen (void *__s, size_t __len, __const char *__modes)
  __attribute__ ((__nothrow__)) ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__)) ;






extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__));





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__));








extern int fprintf (FILE *__restrict __stream,
      __const char *__restrict __format, ...);




extern int printf (__const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      __const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (__const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));





extern int snprintf (char *__restrict __s, size_t __maxlen,
       __const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        __const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));

# 394 "/usr/include/stdio.h" 3 4
extern int vdprintf (int __fd, __const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, __const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));








extern int fscanf (FILE *__restrict __stream,
     __const char *__restrict __format, ...) ;




extern int scanf (__const char *__restrict __format, ...) ;

extern int sscanf (__const char *__restrict __s,
     __const char *__restrict __format, ...) __attribute__ ((__nothrow__));
# 425 "/usr/include/stdio.h" 3 4
extern int fscanf (FILE *__restrict __stream, __const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf") ;


extern int scanf (__const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf") ;

extern int sscanf (__const char *__restrict __s, __const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__));
# 445 "/usr/include/stdio.h" 3 4








extern int vfscanf (FILE *__restrict __s, __const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (__const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (__const char *__restrict __s,
      __const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 476 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, __const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (__const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (__const char *__restrict __s, __const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf")



     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 504 "/usr/include/stdio.h" 3 4









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

# 532 "/usr/include/stdio.h" 3 4
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 543 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);











extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

# 576 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);








extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;






extern char *gets (char *__s) ;

# 638 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) ;








extern int fputs (__const char *__restrict __s, FILE *__restrict __stream);





extern int puts (__const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (__const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);

# 710 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (__const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);








extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 746 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;
# 765 "/usr/include/stdio.h" 3 4






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, __const fpos_t *__pos);
# 788 "/usr/include/stdio.h" 3 4

# 797 "/usr/include/stdio.h" 3 4


extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__)) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__)) ;




extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;








extern void perror (__const char *__s);






# 1 "/usr/include/bits/sys_errlist.h" 1 3 4
# 27 "/usr/include/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern __const char *__const sys_errlist[];
# 827 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__)) ;




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;
# 846 "/usr/include/stdio.h" 3 4
extern FILE *popen (__const char *__command, __const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) __attribute__ ((__nothrow__));
# 886 "/usr/include/stdio.h" 3 4
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__)) ;


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__));
# 916 "/usr/include/stdio.h" 3 4

# 29 "rb-test.c" 2
# 1 "rb.h" 1
# 29 "rb.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stddef.h" 1 3 4
# 149 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 323 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stddef.h" 3 4
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
      ((a == ((void *)0) && b == ((void *)0)) ? (void) (0) : __assert_fail ("a == ((void *)0) && b == ((void *)0)", "rb-test.c", 125, __PRETTY_FUNCTION__));
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
