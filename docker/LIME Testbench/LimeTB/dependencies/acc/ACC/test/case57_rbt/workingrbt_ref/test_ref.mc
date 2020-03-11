# 1 "test.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "test.c"
# 26 "test.c"
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



# 27 "test.c" 2
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
# 28 "test.c" 2
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 102 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 29 "test.c" 2
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

# 30 "test.c" 2
# 1 "/usr/include/stdlib.h" 1 3 4
# 33 "/usr/include/stdlib.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stddef.h" 1 3 4
# 323 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stddef.h" 3 4
typedef int wchar_t;
# 34 "/usr/include/stdlib.h" 2 3 4


# 96 "/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;







__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;


# 140 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__)) ;




extern double atof (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





extern double strtod (__const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;





extern float strtof (__const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

extern long double strtold (__const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;





extern long int strtol (__const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

extern unsigned long int strtoul (__const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;




__extension__
extern long long int strtoq (__const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

__extension__
extern unsigned long long int strtouq (__const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;





__extension__
extern long long int strtoll (__const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

__extension__
extern unsigned long long int strtoull (__const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

# 311 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) __attribute__ ((__nothrow__)) ;


extern long int a64l (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;




# 1 "/usr/include/sys/types.h" 1 3 4
# 29 "/usr/include/sys/types.h" 3 4






typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;



typedef __ino_t ino_t;
# 62 "/usr/include/sys/types.h" 3 4
typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;
# 100 "/usr/include/sys/types.h" 3 4
typedef __pid_t pid_t;




typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;
# 133 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/time.h" 1 3 4
# 74 "/usr/include/time.h" 3 4


typedef __time_t time_t;



# 92 "/usr/include/time.h" 3 4
typedef __clockid_t clockid_t;
# 104 "/usr/include/time.h" 3 4
typedef __timer_t timer_t;
# 134 "/usr/include/sys/types.h" 2 3 4
# 147 "/usr/include/sys/types.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stddef.h" 1 3 4
# 148 "/usr/include/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
# 195 "/usr/include/sys/types.h" 3 4
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));


typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));
# 217 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 37 "/usr/include/endian.h" 3 4
# 1 "/usr/include/bits/endian.h" 1 3 4
# 38 "/usr/include/endian.h" 2 3 4
# 61 "/usr/include/endian.h" 3 4
# 1 "/usr/include/bits/byteswap.h" 1 3 4
# 28 "/usr/include/bits/byteswap.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 29 "/usr/include/bits/byteswap.h" 2 3 4
# 62 "/usr/include/endian.h" 2 3 4
# 218 "/usr/include/sys/types.h" 2 3 4


# 1 "/usr/include/sys/select.h" 1 3 4
# 31 "/usr/include/sys/select.h" 3 4
# 1 "/usr/include/bits/select.h" 1 3 4
# 23 "/usr/include/bits/select.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 24 "/usr/include/bits/select.h" 2 3 4
# 32 "/usr/include/sys/select.h" 2 3 4


# 1 "/usr/include/bits/sigset.h" 1 3 4
# 24 "/usr/include/bits/sigset.h" 3 4
typedef int __sig_atomic_t;




typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
# 35 "/usr/include/sys/select.h" 2 3 4



typedef __sigset_t sigset_t;





# 1 "/usr/include/time.h" 1 3 4
# 120 "/usr/include/time.h" 3 4
struct timespec
  {
    __time_t tv_sec;
    long int tv_nsec;
  };
# 45 "/usr/include/sys/select.h" 2 3 4

# 1 "/usr/include/bits/time.h" 1 3 4
# 69 "/usr/include/bits/time.h" 3 4
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
# 47 "/usr/include/sys/select.h" 2 3 4


typedef __suseconds_t suseconds_t;





typedef long int __fd_mask;
# 67 "/usr/include/sys/select.h" 3 4
typedef struct
  {






    __fd_mask __fds_bits[1024 / (8 * sizeof (__fd_mask))];


  } fd_set;






typedef __fd_mask fd_mask;
# 99 "/usr/include/sys/select.h" 3 4

# 109 "/usr/include/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 121 "/usr/include/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);



# 221 "/usr/include/sys/types.h" 2 3 4


# 1 "/usr/include/sys/sysmacros.h" 1 3 4
# 30 "/usr/include/sys/sysmacros.h" 3 4
__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__));
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__));
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)
     __attribute__ ((__nothrow__));
# 224 "/usr/include/sys/types.h" 2 3 4
# 235 "/usr/include/sys/types.h" 3 4
typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 270 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/bits/pthreadtypes.h" 1 3 4
# 23 "/usr/include/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 24 "/usr/include/bits/pthreadtypes.h" 2 3 4
# 50 "/usr/include/bits/pthreadtypes.h" 3 4
typedef unsigned long int pthread_t;


typedef union
{
  char __size[56];
  long int __align;
} pthread_attr_t;



typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
# 76 "/usr/include/bits/pthreadtypes.h" 3 4
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;

    unsigned int __nusers;



    int __kind;

    int __spins;
    __pthread_list_t __list;
# 101 "/usr/include/bits/pthreadtypes.h" 3 4
  } __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;





typedef union
{

  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
    int __writer;
    int __shared;
    unsigned long int __pad1;
    unsigned long int __pad2;


    unsigned int __flags;
  } __data;
# 187 "/usr/include/bits/pthreadtypes.h" 3 4
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 271 "/usr/include/sys/types.h" 2 3 4



# 321 "/usr/include/stdlib.h" 2 3 4






extern long int random (void) __attribute__ ((__nothrow__));


extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__));





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));






extern int rand (void) __attribute__ ((__nothrow__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__));




extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__));







extern double drand48 (void) __attribute__ ((__nothrow__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) __attribute__ ((__nothrow__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) __attribute__ ((__nothrow__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) __attribute__ ((__nothrow__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    unsigned long long int __a;
  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));









extern void *malloc (size_t __size) __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__)) __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) __attribute__ ((__nothrow__));




extern void cfree (void *__ptr) __attribute__ ((__nothrow__));



# 1 "/usr/include/alloca.h" 1 3 4
# 25 "/usr/include/alloca.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stddef.h" 1 3 4
# 26 "/usr/include/alloca.h" 2 3 4







extern void *alloca (size_t __size) __attribute__ ((__nothrow__));






# 498 "/usr/include/stdlib.h" 2 3 4




extern void *valloc (size_t __size) __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;




extern void abort (void) __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
# 530 "/usr/include/stdlib.h" 3 4





extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));






extern void exit (int __status) __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));
# 553 "/usr/include/stdlib.h" 3 4






extern void _Exit (int __status) __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));






extern char *getenv (__const char *__name) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;




extern char *__secure_getenv (__const char *__name)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;





extern int putenv (char *__string) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));





extern int setenv (__const char *__name, __const char *__value, int __replace)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (__const char *__name) __attribute__ ((__nothrow__));






extern int clearenv (void) __attribute__ ((__nothrow__));
# 604 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
# 615 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 635 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
# 661 "/usr/include/stdlib.h" 3 4





extern int system (__const char *__command) ;

# 683 "/usr/include/stdlib.h" 3 4
extern char *realpath (__const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__)) ;






typedef int (*__compar_fn_t) (__const void *, __const void *);
# 701 "/usr/include/stdlib.h" 3 4



extern void *bsearch (__const void *__key, __const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;



extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 720 "/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;

# 756 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));







extern int mblen (__const char *__s, size_t __n) __attribute__ ((__nothrow__)) ;


extern int mbtowc (wchar_t *__restrict __pwc,
     __const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__)) ;


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__)) ;



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   __const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__));

extern size_t wcstombs (char *__restrict __s,
   __const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__));








extern int rpmatch (__const char *__response) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
# 861 "/usr/include/stdlib.h" 3 4
extern int posix_openpt (int __oflag) ;
# 896 "/usr/include/stdlib.h" 3 4
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
# 912 "/usr/include/stdlib.h" 3 4

# 31 "test.c" 2
# 1 "/usr/include/string.h" 1 3 4
# 28 "/usr/include/string.h" 3 4





# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stddef.h" 1 3 4
# 34 "/usr/include/string.h" 2 3 4









extern void *memcpy (void *__restrict __dest,
       __const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, __const void *__src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));






extern void *memccpy (void *__restrict __dest, __const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));





extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 94 "/usr/include/string.h" 3 4
extern void *memchr (__const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 125 "/usr/include/string.h" 3 4


extern char *strcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, __const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));






# 1 "/usr/include/xlocale.h" 1 3 4
# 28 "/usr/include/xlocale.h" 3 4
typedef struct __locale_struct
{

  struct locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
} *__locale_t;


typedef __locale_t locale_t;
# 162 "/usr/include/string.h" 2 3 4


extern int strcoll_l (__const char *__s1, __const char *__s2, __locale_t __l)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern size_t strxfrm_l (char *__dest, __const char *__src, size_t __n,
    __locale_t __l) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 4)));




extern char *strdup (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (__const char *__string, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 208 "/usr/include/string.h" 3 4

# 233 "/usr/include/string.h" 3 4
extern char *strchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 260 "/usr/include/string.h" 3 4
extern char *strrchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 279 "/usr/include/string.h" 3 4



extern size_t strcspn (__const char *__s, __const char *__reject)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 312 "/usr/include/string.h" 3 4
extern char *strpbrk (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 340 "/usr/include/string.h" 3 4
extern char *strstr (__const char *__haystack, __const char *__needle)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, __const char *__restrict __delim)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    __const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, __const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 3)));
# 395 "/usr/include/string.h" 3 4


extern size_t strlen (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strnlen (__const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) __attribute__ ((__nothrow__));

# 425 "/usr/include/string.h" 3 4
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));
# 443 "/usr/include/string.h" 3 4
extern char *strerror_l (int __errnum, __locale_t __l) __attribute__ ((__nothrow__));





extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern void bcopy (__const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int bcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 487 "/usr/include/string.h" 3 4
extern char *index (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 515 "/usr/include/string.h" 3 4
extern char *rindex (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern int ffs (int __i) __attribute__ ((__nothrow__)) __attribute__ ((__const__));
# 534 "/usr/include/string.h" 3 4
extern int strcasecmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 557 "/usr/include/string.h" 3 4
extern char *strsep (char **__restrict __stringp,
       __const char *__restrict __delim)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) __attribute__ ((__nothrow__));


extern char *__stpcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
# 644 "/usr/include/string.h" 3 4

# 32 "test.c" 2
# 1 "/usr/include/time.h" 1 3 4
# 30 "/usr/include/time.h" 3 4








# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.4.1/include/stddef.h" 1 3 4
# 39 "/usr/include/time.h" 2 3 4



# 1 "/usr/include/bits/time.h" 1 3 4
# 43 "/usr/include/time.h" 2 3 4
# 58 "/usr/include/time.h" 3 4


typedef __clock_t clock_t;



# 131 "/usr/include/time.h" 3 4


struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;


  long int tm_gmtoff;
  __const char *tm_zone;




};








struct itimerspec
  {
    struct timespec it_interval;
    struct timespec it_value;
  };


struct sigevent;
# 180 "/usr/include/time.h" 3 4



extern clock_t clock (void) __attribute__ ((__nothrow__));


extern time_t time (time_t *__timer) __attribute__ ((__nothrow__));


extern double difftime (time_t __time1, time_t __time0)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern time_t mktime (struct tm *__tp) __attribute__ ((__nothrow__));





extern size_t strftime (char *__restrict __s, size_t __maxsize,
   __const char *__restrict __format,
   __const struct tm *__restrict __tp) __attribute__ ((__nothrow__));

# 217 "/usr/include/time.h" 3 4
extern size_t strftime_l (char *__restrict __s, size_t __maxsize,
     __const char *__restrict __format,
     __const struct tm *__restrict __tp,
     __locale_t __loc) __attribute__ ((__nothrow__));
# 230 "/usr/include/time.h" 3 4



extern struct tm *gmtime (__const time_t *__timer) __attribute__ ((__nothrow__));



extern struct tm *localtime (__const time_t *__timer) __attribute__ ((__nothrow__));





extern struct tm *gmtime_r (__const time_t *__restrict __timer,
       struct tm *__restrict __tp) __attribute__ ((__nothrow__));



extern struct tm *localtime_r (__const time_t *__restrict __timer,
          struct tm *__restrict __tp) __attribute__ ((__nothrow__));





extern char *asctime (__const struct tm *__tp) __attribute__ ((__nothrow__));


extern char *ctime (__const time_t *__timer) __attribute__ ((__nothrow__));







extern char *asctime_r (__const struct tm *__restrict __tp,
   char *__restrict __buf) __attribute__ ((__nothrow__));


extern char *ctime_r (__const time_t *__restrict __timer,
        char *__restrict __buf) __attribute__ ((__nothrow__));




extern char *__tzname[2];
extern int __daylight;
extern long int __timezone;




extern char *tzname[2];



extern void tzset (void) __attribute__ ((__nothrow__));



extern int daylight;
extern long int timezone;





extern int stime (__const time_t *__when) __attribute__ ((__nothrow__));
# 313 "/usr/include/time.h" 3 4
extern time_t timegm (struct tm *__tp) __attribute__ ((__nothrow__));


extern time_t timelocal (struct tm *__tp) __attribute__ ((__nothrow__));


extern int dysize (int __year) __attribute__ ((__nothrow__)) __attribute__ ((__const__));
# 328 "/usr/include/time.h" 3 4
extern int nanosleep (__const struct timespec *__requested_time,
        struct timespec *__remaining);



extern int clock_getres (clockid_t __clock_id, struct timespec *__res) __attribute__ ((__nothrow__));


extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp) __attribute__ ((__nothrow__));


extern int clock_settime (clockid_t __clock_id, __const struct timespec *__tp)
     __attribute__ ((__nothrow__));






extern int clock_nanosleep (clockid_t __clock_id, int __flags,
       __const struct timespec *__req,
       struct timespec *__rem);


extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) __attribute__ ((__nothrow__));




extern int timer_create (clockid_t __clock_id,
    struct sigevent *__restrict __evp,
    timer_t *__restrict __timerid) __attribute__ ((__nothrow__));


extern int timer_delete (timer_t __timerid) __attribute__ ((__nothrow__));


extern int timer_settime (timer_t __timerid, int __flags,
     __const struct itimerspec *__restrict __value,
     struct itimerspec *__restrict __ovalue) __attribute__ ((__nothrow__));


extern int timer_gettime (timer_t __timerid, struct itimerspec *__value)
     __attribute__ ((__nothrow__));


extern int timer_getoverrun (timer_t __timerid) __attribute__ ((__nothrow__));
# 417 "/usr/include/time.h" 3 4

# 33 "test.c" 2
# 1 "test.h" 1
# 32 "test.h"
struct libavl_allocator
  {
    void *(*libavl_malloc) (struct libavl_allocator *, size_t libavl_size);
    void (*libavl_free) (struct libavl_allocator *, void *libavl_block);
  };


int test_correctness (struct libavl_allocator *allocator,
                      int insert[], int delete[], int n, int verbosity);
int test_overflow (struct libavl_allocator *, int order[], int n,
                   int verbosity);
int compare_ints (const void *pa, const void *pb, void *param);
# 34 "test.c" 2


enum insert_order
  {
    INS_RANDOM,
    INS_ASCENDING,
    INS_DESCENDING,
    INS_BALANCED,
    INS_ZIGZAG,
    INS_ASCENDING_SHIFTED,
    INS_CUSTOM,

    INS_CNT
  };


enum delete_order
  {
    DEL_RANDOM,
    DEL_REVERSE,
    DEL_SAME,
    DEL_CUSTOM,

    DEL_CNT
  };


enum mt_policy
  {
    MT_TRACK,
    MT_NO_TRACK,
    MT_FAIL_COUNT,
    MT_FAIL_PERCENT,
    MT_SUBALLOC
  };


struct option
  {
    const char *long_name;
    int short_name;
    int has_arg;
  };


enum test
  {
    TST_CORRECTNESS,
    TST_OVERFLOW,
    TST_NULL
  };


struct test_options
  {
    enum test test;
    enum insert_order insert_order;
    enum delete_order delete_order;

    enum mt_policy alloc_policy;
    int alloc_arg[2];
    int alloc_incr;

    int node_cnt;
    int iter_cnt;

    int seed_given;
    unsigned seed;

    int verbosity;
    int nonstop;
  };


char *pgm_name;





int
compare_ints (const void *pa, const void *pb, void *param)
{
  const int *a = pa;
  const int *b = pb;

  if (*a < *b)
    return -1;
  else if (*a > *b)
    return +1;
  else
    return 0;
}



static void
fail (const char *message, ...)
{
  va_list args;

  fprintf (stderr, "%s: ", pgm_name);

  __builtin_va_start(args,message);
  vfprintf (stderr, message, args);
  __builtin_va_end(args);

  putchar ('\n');

  exit (1);
}



static void *
xmalloc (size_t size)
{
  void *block = malloc (size);
  if (block == ((void *)0) && size != 0)
    fail ("out of memory");
  return block;
}




struct block
  {
    struct block *next;

    int idx;
    size_t size;
    size_t used;
    void *content;
  };


enum mt_arg_index
  {
    MT_COUNT = 0,
    MT_PERCENT = 0,
    MT_BLOCK_SIZE = 0,
    MT_ALIGN = 1
  };


struct mt_allocator
  {
    struct libavl_allocator allocator;


    enum mt_policy policy;
    int arg[2];
    int verbosity;


    struct block *head, *tail;
    int alloc_idx;
    int block_cnt;
  };

static void *mt_allocate (struct libavl_allocator *, size_t);
static void mt_free (struct libavl_allocator *, void *);




struct mt_allocator *
mt_create (enum mt_policy policy, int arg[2], int verbosity)
{
  struct mt_allocator *mt = xmalloc (sizeof *mt);

  mt->allocator.libavl_malloc = mt_allocate;
  mt->allocator.libavl_free = mt_free;

  mt->policy = policy;
  mt->arg[0] = arg[0];
  mt->arg[1] = arg[1];
  mt->verbosity = verbosity;

  mt->head = mt->tail = ((void *)0);
  mt->alloc_idx = 0;
  mt->block_cnt = 0;

  return mt;
}



void
mt_destroy (struct mt_allocator *mt)
{
  ((mt != ((void *)0)) ? (void) (0) : __assert_fail ("mt != ((void *)0)", "test.c", 226, __PRETTY_FUNCTION__));

  if (mt->block_cnt == 0)
    {
      if (mt->policy != MT_NO_TRACK && mt->verbosity >= 1)
        printf ("  No memory leaks.\n");
    }
  else
    {
      struct block *iter, *next;

      if (mt->policy != MT_SUBALLOC)
        printf ("  Memory leaks detected:\n");
      for (iter = mt->head; iter != ((void *)0); iter = next)
        {
          if (mt->policy != MT_SUBALLOC)
            printf ("    block #%d: %lu bytes\n",
                    iter->idx, (unsigned long) iter->size);

          next = iter->next;
          free (iter->content);
          free (iter);
        }
    }

  free (mt);
}


void *
mt_allocator (struct mt_allocator *mt)
{
  return &mt->allocator;
}



static void *
new_block (struct mt_allocator *mt, size_t size)
{
  struct block *new;


  new = xmalloc (sizeof *new);
  new->next = ((void *)0);
  new->idx = mt->alloc_idx++;
  new->size = size;
  new->used = 0;
  new->content = xmalloc (size);


  if (mt->head == ((void *)0))
    mt->head = new;
  else
    mt->tail->next = new;
  mt->tail = new;


  if (mt->verbosity >= 3)
    printf ("    block #%d: allocated %lu bytes\n",
            new->idx, (unsigned long) size);


  mt->block_cnt++;
  return new->content;
}


static void
reject_request (struct mt_allocator *mt, size_t size)
{
  if (mt->verbosity >= 2)
    printf ("    block #%d: rejected request for %lu bytes\n",
            mt->alloc_idx++, (unsigned long) size);
}


static void *
mt_allocate (struct libavl_allocator *allocator, size_t size)
{
  struct mt_allocator *mt = (struct mt_allocator *) allocator;


  if (size == 0)
    return ((void *)0);

  switch (mt->policy)
    {
    case MT_TRACK:
      return new_block (mt, size);

    case MT_NO_TRACK:
      return xmalloc (size);

    case MT_FAIL_COUNT:
      if (mt->arg[MT_COUNT] == 0)
        {
          reject_request (mt, size);
          return ((void *)0);
        }
      mt->arg[MT_COUNT]--;
      return new_block (mt, size);

    case MT_FAIL_PERCENT:
      if (rand () / (2147483647 / 100 + 1) < mt->arg[MT_PERCENT])
        {
          reject_request (mt, size);
          return ((void *)0);
        }
      else
        return new_block (mt, size);

    case MT_SUBALLOC:
      if (mt->tail == ((void *)0)
          || mt->tail->used + size > (size_t) mt->arg[MT_BLOCK_SIZE])
        new_block (mt, mt->arg[MT_BLOCK_SIZE]);
      if (mt->tail->used + size <= (size_t) mt->arg[MT_BLOCK_SIZE])
        {
          void *p = (char *) mt->tail->content + mt->tail->used;
          size = ((size + mt->arg[MT_ALIGN] - 1)
                  / mt->arg[MT_ALIGN] * mt->arg[MT_ALIGN]);
          mt->tail->used += size;
          if (mt->verbosity >= 3)
            printf ("    block #%d: suballocated %lu bytes\n",
                    mt->tail->idx, (unsigned long) size);
          return p;
        }
      else
        fail ("blocksize %lu too small for %lu-byte allocation",
              (unsigned long) mt->tail->size, (unsigned long) size);

    default:
      ((0) ? (void) (0) : __assert_fail ("0", "test.c", 358, __PRETTY_FUNCTION__));
    }
}


static void
mt_free (struct libavl_allocator *allocator, void *block)
{
  struct mt_allocator *mt = (struct mt_allocator *) allocator;
  struct block *iter, *prev;


  if (block == ((void *)0) || mt->policy == MT_NO_TRACK)
    {
      free (block);
      return;
    }
  if (mt->policy == MT_SUBALLOC)
    return;


  for (prev = ((void *)0), iter = mt->head; iter; prev = iter, iter = iter->next)
    {
      if (iter->content == block)
        {

          struct block *next = iter->next;

          if (prev == ((void *)0))
            mt->head = next;
          else
            prev->next = next;
          if (next == ((void *)0))
            mt->tail = prev;


          if (mt->verbosity >= 4)
            printf ("    block #%d: freed %lu bytes\n",
                    iter->idx, (unsigned long) iter->size);


          free (iter->content);
          free (iter);


          mt->block_cnt--;
          return;
        }
    }


  printf ("    attempt to free unknown block %p (already freed?)\n", block);
}


struct option_state
  {
    const struct option *options;
    char **arg_next;
    char *short_next;
  };




static struct option_state *
option_init (const struct option *options, char **args)
{
  struct option_state *state;

  ((options != ((void *)0) && args != ((void *)0)) ? (void) (0) : __assert_fail ("options != ((void *)0) && args != ((void *)0)", "test.c", 428, __PRETTY_FUNCTION__));

  state = xmalloc (sizeof *state);
  state->options = options;
  state->arg_next = args;
  state->short_next = ((void *)0);

  return state;
}





static int
handle_short_option (struct option_state *state, char **argp)
{
  const struct option *o;

  ((state != ((void *)0) && state->short_next != ((void *)0) && *state->short_next != '\0' && state->options != ((void *)0)) ? (void) (0) : __assert_fail ("state != ((void *)0) && state->short_next != ((void *)0) && *state->short_next != '\\0' && state->options != ((void *)0)", "test.c", 449, __PRETTY_FUNCTION__));




  for (o = state->options; ; o++)
    if (o->long_name == ((void *)0))
      fail ("unknown option `-%c'; use --help for help", *state->short_next);
    else if (o->short_name == *state->short_next)
      break;
  state->short_next++;


  if (o->has_arg)
    {
      if (*state->arg_next == ((void *)0) || **state->arg_next == '-')
        fail ("`-%c' requires an argument; use --help for help");

      *argp = *state->arg_next++;
    }

  return o->short_name;
}





static int
handle_long_option (struct option_state *state, char **argp)
{
  const struct option *o;
  char name[16];
  const char *arg;

  ((state != ((void *)0) && state->arg_next != ((void *)0) && *state->arg_next != ((void *)0) && state->options != ((void *)0) && argp != ((void *)0)) ? (void) (0) : __assert_fail ("state != ((void *)0) && state->arg_next != ((void *)0) && *state->arg_next != ((void *)0) && state->options != ((void *)0) && argp != ((void *)0)", "test.c", 485, __PRETTY_FUNCTION__));






  {
    const char *p = *state->arg_next + 2;
    const char *q = p + strcspn (p, "=");
    size_t name_len = q - p;

    if (name_len > (sizeof name) - 1)
      name_len = (sizeof name) - 1;
    memcpy (name, p, name_len);
    name[name_len] = '\0';

    arg = (*q == '=') ? q + 1 : ((void *)0);
  }


  for (o = state->options; ; o++)
    if (o->long_name == ((void *)0))
      fail ("unknown option --%s; use --help for help", name);
    else if (!strcmp (name, o->long_name))
      break;


  if ((arg != ((void *)0)) != (o->has_arg != 0))
    {
      if (arg != ((void *)0))
        fail ("--%s can't take an argument; use --help for help", name);
      else
        fail ("--%s requires an argument; use --help for help", name);
    }


  state->arg_next++;
  *argp = (char *) arg;
  return o->short_name;
}




static int
option_get (struct option_state *state, char **argp)
{
  ((state != ((void *)0) && argp != ((void *)0)) ? (void) (0) : __assert_fail ("state != ((void *)0) && argp != ((void *)0)", "test.c", 530, __PRETTY_FUNCTION__));


  *argp = ((void *)0);


  if (state->short_next != ((void *)0))
    {
      if (*state->short_next != '\0')
        return handle_short_option (state, argp);
      else
        state->short_next = ((void *)0);
    }


  if (*state->arg_next == ((void *)0))
    {
      free (state);
      return -1;
    }


  if ((*state->arg_next)[0] != '-')
    fail ("non-option arguments encountered; use --help for help");
  if ((*state->arg_next)[1] == '\0')
    fail ("unknown option `-'; use --help for help");


  if ((*state->arg_next)[1] == '-')
    return handle_long_option (state, argp);
  else
    {
      state->short_next = *state->arg_next + 1;
      state->arg_next++;
      return handle_short_option (state, argp);
    }
}






size_t
match_len (const char *a, const char *b)
{
  size_t cnt;

  for (cnt = 0; *a == *b && *a != '\0'; a++, b++)
    cnt++;

  return (*a != *b && *a != '\0' && *b != '\0') ? 0 : cnt;
}



static int
stoi (const char *s)
{
  long x = strtol (s, ((void *)0), 10);
  return x >= (-2147483647 - 1) && x <= 2147483647 ? x : 0;
}


static void
usage (void)
{
  static const char *help[] =
    {
      "bst-test, unit test for GNU libavl.\n\n",
      "Usage: %s [OPTION]...\n\n",
      "In the option descriptions below, CAPITAL denote arguments.\n",
      "If a long option shows an argument as mandatory, then it is\n",
      "mandatory for the equivalent short option also.  See the GNU\n",
      "libavl manual for more information.\n\n",
      "-t, --test=TEST     Sets test to perform.  TEST is one of:\n",
      "                      correctness insert/delete/... (default)\n",
      "                      overflow    stack overflow test\n",
      "                      benchmark   benchmark test\n",
      "                      null        no test\n",
      "-s, --size=TREE-SIZE  Sets tree size in nodes (default 16).\n",
      "-r, --repeat=COUNT  Repeats operation COUNT times (default 16).\n",
      "-i, --insert=ORDER  Sets the insertion order.  ORDER is one of:\n",
      "                      random      random permutation (default)\n",
      "                      ascending   ascending order 0...n-1\n",
      "                      descending  descending order n-1...0\n",
      "                      balanced    balanced tree order\n",
      "                      zigzag      zig-zag tree\n",
      "                      asc-shifted n/2...n-1, 0...n/2-1\n",
      "                      custom      custom, read from stdin\n",
      "-d, --delete=ORDER  Sets the deletion order.  ORDER is one of:\n",
      "                      random   random permutation (default)\n",
      "                      reverse  reverse order of insertion\n",
      "                      same     same as insertion order\n",
      "                      custom   custom, read from stdin\n",
      "-a, --alloc=POLICY  Sets allocation policy.  POLICY is one of:\n",
      "                      track     track memory leaks (default)\n",
      "                      no-track  turn off leak detection\n",
      "                      fail-CNT  fail after CNT allocations\n",
      "                      fail%%PCT  fail random PCT%% of allocations\n",
      "                      sub-B,A   divide B-byte blocks in A-byte units\n",
      "                    (Ignored for `benchmark' test.)\n",
      "-A, --incr=INC      Fail policies: arg increment per repetition.\n",
      "-S, --seed=SEED     Sets initial number seed to SEED.\n",
      "                    (default based on system time)\n",
      "-n, --nonstop       Don't stop after a single error.\n",
      "-q, --quiet         Turns down verbosity level.\n",
      "-v, --verbose       Turns up verbosity level.\n",
      "-h, --help          Displays this help screen.\n",
      "-V, --version       Reports version and copyright information.\n",
      ((void *)0),
    };

  const char **p;
  for (p = help; *p != ((void *)0); p++)
    printf (*p, pgm_name);

  exit (0);
}



static void
parse_command_line (char **args, struct test_options *options)
{
  static const struct option option_tab[] =
    {
      {"test", 't', 1},
      {"insert", 'i', 1},
      {"delete", 'd', 1},
      {"alloc", 'a', 1},
      {"incr", 'A', 1},
      {"size", 's', 1},
      {"repeat", 'r', 1},
      {"operation", 'o', 1},
      {"seed", 'S', 1},
      {"nonstop", 'n', 0},
      {"quiet", 'q', 0},
      {"verbose", 'v', 0},
      {"help", 'h', 0},
      {"version", 'V', 0},
      {((void *)0), 0, 0},
    };

  struct option_state *state;


  options->test = TST_CORRECTNESS;
  options->insert_order = INS_RANDOM;
  options->delete_order = DEL_RANDOM;
  options->alloc_policy = MT_TRACK;
  options->alloc_arg[0] = 0;
  options->alloc_arg[1] = 0;
  options->alloc_incr = 0;
  options->node_cnt = 15;
  options->iter_cnt = 15;
  options->seed_given = 0;
  options->verbosity = 0;
  options->nonstop = 0;

  if (*args == ((void *)0))
    return;

  state = option_init (option_tab, args + 1);
  for (;;)
    {
      char *arg;
      int id = option_get (state, &arg);
      if (id == -1)
        break;

      switch (id)
        {
        case 't':
          if (match_len (arg, "correctness") >= 3)
            options->test = TST_CORRECTNESS;
          else if (match_len (arg, "overflow") >= 3)
            options->test = TST_OVERFLOW;
          else if (match_len (arg, "null") >= 3)
            options->test = TST_NULL;
          else
            fail ("unknown test \"%s\"", arg);
          break;

        case 'i':
          {
            static const char *orders[INS_CNT] =
              {
                "random", "ascending", "descending",
                "balanced", "zigzag", "asc-shifted", "custom",
              };

            const char **iter;

            ((sizeof orders / sizeof *orders == INS_CNT) ? (void) (0) : __assert_fail ("sizeof orders / sizeof *orders == INS_CNT", "test.c", 724, __PRETTY_FUNCTION__));
            for (iter = orders; ; iter++)
              if (iter >= orders + INS_CNT)
                fail ("unknown order \"%s\"", arg);
              else if (match_len (*iter, arg) >= 3)
                {
                  options->insert_order = iter - orders;
                  break;
                }
          }
          break;

        case 'd':
          {
            static const char *orders[DEL_CNT] =
              {
                "random", "reverse", "same", "custom",
              };

            const char **iter;

            ((sizeof orders / sizeof *orders == DEL_CNT) ? (void) (0) : __assert_fail ("sizeof orders / sizeof *orders == DEL_CNT", "test.c", 745, __PRETTY_FUNCTION__));
            for (iter = orders; ; iter++)
              if (iter >= orders + DEL_CNT)
                fail ("unknown order \"%s\"", arg);
              else if (match_len (*iter, arg) >= 3)
                {
                  options->delete_order = iter - orders;
                  break;
                }
          }
          break;

        case 'a':
          if (match_len (arg, "track") >= 3)
            options->alloc_policy = MT_TRACK;
          else if (match_len (arg, "no-track") >= 3)
            options->alloc_policy = MT_NO_TRACK;
          else if (!strncmp (arg, "fail", 3))
            {
              const char *p = arg + strcspn (arg, "-%");
              if (*p == '-')
                options->alloc_policy = MT_FAIL_COUNT;
              else if (*p == '%')
                options->alloc_policy = MT_FAIL_PERCENT;
              else
                fail ("invalid allocation policy \"%s\"", arg);

              options->alloc_arg[0] = stoi (p + 1);
            }
          else if (!strncmp (arg, "suballoc", 3))
            {
              const char *p = strchr (arg, '-');
              const char *q = strchr (arg, ',');
              if (p == ((void *)0) || q == ((void *)0))
                fail ("invalid allocation policy \"%s\"", arg);

              options->alloc_policy = MT_SUBALLOC;
              options->alloc_arg[0] = stoi (p + 1);
              options->alloc_arg[1] = stoi (q + 1);
              if (options->alloc_arg[MT_BLOCK_SIZE] < 32)
                fail ("block size too small");
              else if (options->alloc_arg[MT_ALIGN]
                       > options->alloc_arg[MT_BLOCK_SIZE])
                fail ("alignment cannot be greater than block size");
              else if (options->alloc_arg[MT_ALIGN] < 1)
                fail ("alignment must be at least 1");
            }
          break;

        case 'A':
          options->alloc_incr = stoi (arg);
          break;

        case 's':
          options->node_cnt = stoi (arg);
          if (options->node_cnt < 1)
            fail ("bad tree size \"%s\"", arg);
          break;

        case 'r':
          options->iter_cnt = stoi (arg);
          if (options->iter_cnt < 1)
            fail ("bad repeat count \"%s\"", arg);
          break;

        case 'S':
          options->seed_given = 1;
          options->seed = strtoul (arg, ((void *)0), 0);
          break;

        case 'n':
          options->nonstop = 1;
          break;

        case 'q':
          options->verbosity--;
          break;

        case 'v':
          options->verbosity++;
          break;

        case 'h':
          usage ();
          break;

        case 'V':
          fputs ("GNU libavl 2.0.2\n"
                 "Copyright (C) 1998-2002, 2004 "
                 "Free Software Foundation, Inc.\n"
                 "This program comes with NO WARRANTY, not even for\n"
                 "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n"
                 "You may redistribute copies under the terms of the\n"
                 "GNU General Public License.  For more information on\n"
                 "these matters, see the file named COPYING.\n",
                 stdout);
          exit (0);

        default:
          ((0) ? (void) (0) : __assert_fail ("0", "test.c", 844, __PRETTY_FUNCTION__));
        }
    }
}



static void
permuted_integers (int array[], size_t n)
{
  size_t i;

  for (i = 0; i < n; i++)
    array[i] = i;

  for (i = 0; i < n; i++)
    {
      size_t j = i + (unsigned) rand () / (2147483647 / (n - i) + 1);
      int t = array[j];
      array[j] = array[i];
      array[i] = t;
    }
}





static void
gen_balanced_tree (int min, int max, int **array)
{
  int i;

  if (min > max)
    return;

  i = (min + max + 1) / 2;
  *(*array)++ = i;
  gen_balanced_tree (min, i - 1, array);
  gen_balanced_tree (i + 1, max, array);
}




static void
gen_insertions (size_t n, enum insert_order insert_order, int insert[])
{
  size_t i;

  switch (insert_order)
    {
    case INS_RANDOM:
      permuted_integers (insert, n);
      break;

    case INS_ASCENDING:
      for (i = 0; i < n; i++)
        insert[i] = i;
      break;

    case INS_DESCENDING:
      for (i = 0; i < n; i++)
        insert[i] = n - i - 1;
      break;

    case INS_BALANCED:
      gen_balanced_tree (0, n - 1, &insert);
      break;

    case INS_ZIGZAG:
      for (i = 0; i < n; i++)
        if (i % 2 == 0)
          insert[i] = i / 2;
        else
          insert[i] = n - i / 2 - 1;
      break;

    case INS_ASCENDING_SHIFTED:
      for (i = 0; i < n; i++)
        {
           insert[i] = i + n / 2;
           if ((size_t) insert[i] >= n)
             insert[i] -= n;
        }
      break;

    case INS_CUSTOM:
      for (i = 0; i < n; i++)
        if (scanf ("%d", &insert[i]) == 0)
          fail ("error reading insertion order from stdin");
      break;

    default:
      ((0) ? (void) (0) : __assert_fail ("0", "test.c", 938, __PRETTY_FUNCTION__));
    }
}



static void
gen_deletions (size_t n, enum delete_order delete_order,
               const int *insert, int *delete)
{
  size_t i;

  switch (delete_order)
    {
    case DEL_RANDOM:
      permuted_integers (delete, n);
      break;

    case DEL_REVERSE:
      for (i = 0; i < n; i++)
        delete[i] = insert[n - i - 1];
      break;

    case DEL_SAME:
      for (i = 0; i < n; i++)
        delete[i] = insert[i];
      break;

    case DEL_CUSTOM:
      for (i = 0; i < n; i++)
        if (scanf ("%d", &delete[i]) == 0)
          fail ("error reading deletion order from stdin");
      break;

    default:
      ((0) ? (void) (0) : __assert_fail ("0", "test.c", 973, __PRETTY_FUNCTION__));
    }
}



unsigned
time_seed (void)
{
  time_t timeval;
  unsigned char *ptr;
  unsigned seed;
  size_t i;

  timeval = time (((void *)0));
  ptr = (unsigned char *) &timeval;

  seed = 0;
  for (i = 0; i < sizeof timeval; i++)
    seed = seed * ((127 * 2 + 1) + 2u) + ptr[i];

  return seed;
}

int
main (int argc, char *argv[])
{
  struct test_options opts;
  int *insert, *delete;
  int success;


  pgm_name = argv[0] != ((void *)0) && argv[0][0] != '\0' ? argv[0] : "bst-test";


  parse_command_line (argv, &opts);

  if (opts.verbosity >= 0)
    fputs ("bst-test for GNU libavl 2.0.2; use --help to get help.\n", stdout);

  if (!opts.seed_given)
    opts.seed = time_seed () % 32768u;

  insert = xmalloc (sizeof *insert * opts.node_cnt);
  delete = xmalloc (sizeof *delete * opts.node_cnt);


  success = 1;
  while (opts.iter_cnt--)
    {
      struct mt_allocator *alloc;

      if (opts.verbosity >= 0)
        {
          printf ("Testing seed=%u", opts.seed);
          if (opts.alloc_incr)
            printf (", alloc arg=%d", opts.alloc_arg[0]);
          printf ("...\n");
          fflush (stdout);
        }




      srand (opts.seed);
      gen_insertions (opts.node_cnt, opts.insert_order, insert);

      srand (++opts.seed);
      gen_deletions (opts.node_cnt, opts.delete_order, insert, delete);

      if (opts.verbosity >= 1)
        {
          int i;

          printf ("  Insertion order:");
          for (i = 0; i < opts.node_cnt; i++)
            printf (" %d", insert[i]);
          printf (".\n");

          if (opts.test == TST_CORRECTNESS)
            {
              printf ("Deletion order:");
              for (i = 0; i < opts.node_cnt; i++)
                printf (" %d", delete[i]);
              printf (".\n");
            }
        }

      alloc = mt_create (opts.alloc_policy, opts.alloc_arg, opts.verbosity);

      {
        int okay;
        struct libavl_allocator *a = mt_allocator (alloc);

        switch (opts.test)
          {
          case TST_CORRECTNESS:
            okay = test_correctness (a, insert, delete, opts.node_cnt,
                                     opts.verbosity);
            break;

          case TST_OVERFLOW:
            okay = test_overflow (a, insert, opts.node_cnt, opts.verbosity);
            break;

          case TST_NULL:
            okay = 1;
            break;

          default:
            ((0) ? (void) (0) : __assert_fail ("0", "test.c", 1083, __PRETTY_FUNCTION__));
          }

        if (okay)
          {
            if (opts.verbosity >= 1)
              printf ("  No errors.\n");
          }
        else
          {
            success = 0;
            printf ("  Error!\n");
          }
      }

      mt_destroy (alloc);
      opts.alloc_arg[0] += opts.alloc_incr;

      if (!success && !opts.nonstop)
        break;
    }

  free (delete);
  free (insert);

  return success ? 0 : 1;
}
