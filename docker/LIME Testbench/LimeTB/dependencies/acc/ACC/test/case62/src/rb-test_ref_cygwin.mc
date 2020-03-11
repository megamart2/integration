# 1 "rb-test.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "rb-test.c"
# 26 "rb-test.c"
# 1 "/usr/include/assert.h" 1 3 4
# 9 "/usr/include/assert.h" 3 4
# 1 "/usr/include/_ansi.h" 1 3 4
# 15 "/usr/include/_ansi.h" 3 4
# 1 "/usr/include/newlib.h" 1 3 4
# 16 "/usr/include/_ansi.h" 2 3 4
# 1 "/usr/include/sys/config.h" 1 3 4



# 1 "/usr/include/machine/ieeefp.h" 1 3 4
# 5 "/usr/include/sys/config.h" 2 3 4
# 167 "/usr/include/sys/config.h" 3 4
# 1 "/usr/include/cygwin/config.h" 1 3 4
# 168 "/usr/include/sys/config.h" 2 3 4
# 17 "/usr/include/_ansi.h" 2 3 4
# 10 "/usr/include/assert.h" 2 3 4
# 25 "/usr/include/assert.h" 3 4
void __attribute__((__cdecl__)) __assert (const char *, int, const char *);
# 27 "rb-test.c" 2
# 1 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/limits.h" 1 3 4
# 11 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/limits.h" 3 4
# 1 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/syslimits.h" 1 3 4






# 1 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/limits.h" 1 3 4
# 122 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/limits.h" 3 4
# 1 "/usr/include/limits.h" 1 3 4
# 13 "/usr/include/limits.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 14 "/usr/include/features.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 15 "/usr/include/features.h" 2 3 4
# 1 "/usr/include/sys/features.h" 1 3 4
# 16 "/usr/include/features.h" 2 3 4
# 14 "/usr/include/limits.h" 2 3 4
# 123 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/limits.h" 2 3 4
# 8 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/syslimits.h" 2 3 4
# 12 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/limits.h" 2 3 4
# 28 "rb-test.c" 2
# 1 "/usr/include/stdio.h" 1 3 4
# 34 "/usr/include/stdio.h" 3 4
# 1 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stddef.h" 1 3 4
# 213 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stddef.h" 3 4
typedef unsigned int size_t;
# 35 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stdarg.h" 1 3 4
# 44 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 38 "/usr/include/stdio.h" 2 3 4







# 1 "/usr/include/sys/reent.h" 1 3 4
# 13 "/usr/include/sys/reent.h" 3 4
# 1 "/usr/include/_ansi.h" 1 3 4
# 14 "/usr/include/sys/reent.h" 2 3 4
# 1 "/usr/include/sys/_types.h" 1 3 4
# 12 "/usr/include/sys/_types.h" 3 4
# 1 "/usr/include/sys/lock.h" 1 3 4
# 14 "/usr/include/sys/lock.h" 3 4
typedef void *_LOCK_T;
# 44 "/usr/include/sys/lock.h" 3 4
void __cygwin_lock_init(_LOCK_T *);
void __cygwin_lock_init_recursive(_LOCK_T *);
void __cygwin_lock_fini(_LOCK_T *);
void __cygwin_lock_lock(_LOCK_T *);
int __cygwin_lock_trylock(_LOCK_T *);
void __cygwin_lock_unlock(_LOCK_T *);
# 13 "/usr/include/sys/_types.h" 2 3 4

typedef long _off_t;
__extension__ typedef long long _off64_t;


typedef int _ssize_t;





# 1 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stddef.h" 1 3 4
# 354 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 25 "/usr/include/sys/_types.h" 2 3 4


typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;

typedef _LOCK_T _flock_t;


typedef void *_iconv_t;
# 15 "/usr/include/sys/reent.h" 2 3 4




typedef unsigned long __ULong;
# 40 "/usr/include/sys/reent.h" 3 4
struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 85 "/usr/include/sys/reent.h" 3 4
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 101 "/usr/include/sys/reent.h" 3 4
struct __sbuf {
 unsigned char *_base;
 int _size;
};






typedef long _fpos_t;



typedef _off64_t _fpos64_t;
# 166 "/usr/include/sys/reent.h" 3 4
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  _ssize_t __attribute__((__cdecl__)) (*_read) (void * _cookie, char *_buf, int _n);
  _ssize_t __attribute__((__cdecl__)) (*_write) (void * _cookie, const char *_buf, int _n);

  _fpos_t __attribute__((__cdecl__)) (*_seek) (void * _cookie, _fpos_t _offset, int _whence);
  int __attribute__((__cdecl__)) (*_close) (void * _cookie);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  int _offset;


  struct _reent *_data;



  _flock_t _lock;

};


struct __sFILE64 {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;

  struct _reent *_data;


  void * _cookie;

  _ssize_t __attribute__((__cdecl__)) (*_read) (void * _cookie, char *_buf, int _n);
  _ssize_t __attribute__((__cdecl__)) (*_write) (void * _cookie, const char *_buf, int _n);

  _fpos_t __attribute__((__cdecl__)) (*_seek) (void * _cookie, _fpos_t _offset, int _whence);
  int __attribute__((__cdecl__)) (*_close) (void * _cookie);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  int _flags2;

  _off64_t _offset;
  _fpos64_t __attribute__((__cdecl__)) (*_seek64) (void * _cookie, _fpos64_t _offset, int _whence);


  _flock_t _lock;

};
typedef struct __sFILE64 __FILE;




struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 290 "/usr/include/sys/reent.h" 3 4
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 565 "/usr/include/sys/reent.h" 3 4
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void __attribute__((__cdecl__)) (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;


  struct _atexit *_atexit;
  struct _atexit _atexit0;


  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 799 "/usr/include/sys/reent.h" 3 4
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);







  struct _reent * __attribute__((__cdecl__)) __getreent (void);
# 46 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/sys/types.h" 1 3 4
# 25 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/machine/_types.h" 1 3 4
# 26 "/usr/include/machine/_types.h" 3 4
typedef signed char __int8_t ;
typedef unsigned char __uint8_t ;
# 36 "/usr/include/machine/_types.h" 3 4
typedef signed short __int16_t;
typedef unsigned short __uint16_t;
# 46 "/usr/include/machine/_types.h" 3 4
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
# 58 "/usr/include/machine/_types.h" 3 4
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
# 76 "/usr/include/machine/_types.h" 3 4
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
# 99 "/usr/include/machine/_types.h" 3 4
typedef signed long long __int64_t;
typedef unsigned long long __uint64_t;
# 26 "/usr/include/sys/types.h" 2 3 4
# 69 "/usr/include/sys/types.h" 3 4
# 1 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stddef.h" 1 3 4
# 151 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 325 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stddef.h" 3 4
typedef short unsigned int wchar_t;
# 70 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/machine/types.h" 1 3 4
# 19 "/usr/include/machine/types.h" 3 4
typedef long int __off_t;
typedef int __pid_t;

__extension__ typedef long long int __loff_t;
# 71 "/usr/include/sys/types.h" 2 3 4
# 92 "/usr/include/sys/types.h" 3 4
typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;



typedef unsigned short ushort;
typedef unsigned int uint;



typedef unsigned long clock_t;




typedef long time_t;




struct timespec {
  time_t tv_sec;
  long tv_nsec;
};

struct itimerspec {
  struct timespec it_interval;
  struct timespec it_value;
};


typedef long daddr_t;
typedef char * caddr_t;
# 180 "/usr/include/sys/types.h" 3 4
typedef int pid_t;



typedef _ssize_t ssize_t;
# 203 "/usr/include/sys/types.h" 3 4
typedef unsigned short nlink_t;
# 225 "/usr/include/sys/types.h" 3 4
typedef long fd_mask;







typedef struct _types_fd_set {
 fd_mask fds_bits[(((64)+(((sizeof (fd_mask) * 8))-1))/((sizeof (fd_mask) * 8)))];
} _types_fd_set;
# 256 "/usr/include/sys/types.h" 3 4
typedef unsigned long clockid_t;




typedef unsigned long timer_t;



typedef unsigned long useconds_t;
typedef long suseconds_t;
# 373 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/cygwin/types.h" 1 3 4
# 20 "/usr/include/cygwin/types.h" 3 4
# 1 "/usr/include/sys/sysmacros.h" 1 3 4
# 21 "/usr/include/cygwin/types.h" 2 3 4
# 1 "/usr/include/stdint.h" 1 3 4
# 18 "/usr/include/stdint.h" 3 4
typedef signed char int8_t;
typedef short int16_t;
typedef long int32_t;
typedef long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned short uint16_t;


typedef unsigned long uint32_t;

typedef unsigned long long uint64_t;



typedef signed char int_least8_t;
typedef short int_least16_t;
typedef long int_least32_t;
typedef long long int_least64_t;

typedef unsigned char uint_least8_t;
typedef unsigned short uint_least16_t;
typedef unsigned long uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed char int_fast8_t;
typedef long int_fast16_t;
typedef long int_fast32_t;
typedef long long int_fast64_t;

typedef unsigned char uint_fast8_t;
typedef unsigned long uint_fast16_t;
typedef unsigned long uint_fast32_t;
typedef unsigned long long uint_fast64_t;





typedef long intptr_t;

typedef unsigned long uintptr_t;



typedef long long intmax_t;
typedef unsigned long long uintmax_t;
# 22 "/usr/include/cygwin/types.h" 2 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 23 "/usr/include/cygwin/types.h" 2 3 4



typedef struct timespec timespec_t;




typedef struct timespec timestruc_t;





typedef _off64_t off_t;





typedef __loff_t loff_t;



typedef short __dev16_t;
typedef unsigned long __dev32_t;

typedef __dev32_t dev_t;







typedef long blksize_t;




typedef long __blkcnt32_t;
typedef long long __blkcnt64_t;

typedef __blkcnt64_t blkcnt_t;







typedef unsigned long fsblkcnt_t;




typedef unsigned long fsfilcnt_t;




typedef unsigned short __uid16_t;
typedef unsigned long __uid32_t;

typedef __uid32_t uid_t;







typedef unsigned short __gid16_t;
typedef unsigned long __gid32_t;

typedef __gid32_t gid_t;







typedef unsigned long __ino32_t;
typedef unsigned long long __ino64_t;

typedef __ino64_t ino_t;
# 118 "/usr/include/cygwin/types.h" 3 4
typedef unsigned long id_t;
# 140 "/usr/include/cygwin/types.h" 3 4
struct flock {
 short l_type;
 short l_whence;
 off_t l_start;
 off_t l_len;

 pid_t l_pid;




};



typedef long long key_t;







typedef unsigned long vm_offset_t;




typedef unsigned long vm_size_t;




typedef void *vm_object_t;




typedef unsigned char u_int8_t;



typedef __uint16_t u_int16_t;



typedef __uint32_t u_int32_t;



typedef __uint64_t u_int64_t;




typedef __int32_t register_t;




typedef char *addr_t;




typedef unsigned mode_t;





typedef struct __pthread_t {char __dummy;} *pthread_t;
typedef struct __pthread_mutex_t {char __dummy;} *pthread_mutex_t;

typedef struct __pthread_key_t {char __dummy;} *pthread_key_t;
typedef struct __pthread_attr_t {char __dummy;} *pthread_attr_t;
typedef struct __pthread_mutexattr_t {char __dummy;} *pthread_mutexattr_t;
typedef struct __pthread_condattr_t {char __dummy;} *pthread_condattr_t;
typedef struct __pthread_cond_t {char __dummy;} *pthread_cond_t;


typedef struct
{
  pthread_mutex_t mutex;
  int state;
}
pthread_once_t;
typedef struct __pthread_rwlock_t {char __dummy;} *pthread_rwlock_t;
typedef struct __pthread_rwlockattr_t {char __dummy;} *pthread_rwlockattr_t;
# 374 "/usr/include/sys/types.h" 2 3 4
# 47 "/usr/include/stdio.h" 2 3 4



typedef __FILE FILE;



typedef _fpos64_t fpos_t;
# 65 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/sys/stdio.h" 1 3 4
# 29 "/usr/include/sys/stdio.h" 3 4








# 66 "/usr/include/stdio.h" 2 3 4
# 170 "/usr/include/stdio.h" 3 4
FILE * __attribute__((__cdecl__)) tmpfile (void);
char * __attribute__((__cdecl__)) tmpnam (char *);
int __attribute__((__cdecl__)) fclose (FILE *);
int __attribute__((__cdecl__)) fflush (FILE *);
FILE * __attribute__((__cdecl__)) freopen (const char *, const char *, FILE *);
void __attribute__((__cdecl__)) setbuf (FILE *, char *);
int __attribute__((__cdecl__)) setvbuf (FILE *, char *, int, size_t);
int __attribute__((__cdecl__)) fprintf (FILE *, const char *, ...);
int __attribute__((__cdecl__)) fscanf (FILE *, const char *, ...);
int __attribute__((__cdecl__)) printf (const char *, ...);
int __attribute__((__cdecl__)) scanf (const char *, ...);
int __attribute__((__cdecl__)) sscanf (const char *, const char *, ...);
int __attribute__((__cdecl__)) vfprintf (FILE *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) vprintf (const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) vsprintf (char *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) fgetc (FILE *);
char * __attribute__((__cdecl__)) fgets (char *, int, FILE *);
int __attribute__((__cdecl__)) fputc (int, FILE *);
int __attribute__((__cdecl__)) fputs (const char *, FILE *);
int __attribute__((__cdecl__)) getc (FILE *);
int __attribute__((__cdecl__)) getchar (void);
char * __attribute__((__cdecl__)) gets (char *);
int __attribute__((__cdecl__)) putc (int, FILE *);
int __attribute__((__cdecl__)) putchar (int);
int __attribute__((__cdecl__)) puts (const char *);
int __attribute__((__cdecl__)) ungetc (int, FILE *);
size_t __attribute__((__cdecl__)) fread (void *, size_t _size, size_t _n, FILE *);
size_t __attribute__((__cdecl__)) fwrite (const void * , size_t _size, size_t _n, FILE *);



int __attribute__((__cdecl__)) fgetpos (FILE *, fpos_t *);

int __attribute__((__cdecl__)) fseek (FILE *, long, int);



int __attribute__((__cdecl__)) fsetpos (FILE *, const fpos_t *);

long __attribute__((__cdecl__)) ftell ( FILE *);
void __attribute__((__cdecl__)) rewind (FILE *);
void __attribute__((__cdecl__)) clearerr (FILE *);
int __attribute__((__cdecl__)) feof (FILE *);
int __attribute__((__cdecl__)) ferror (FILE *);
void __attribute__((__cdecl__)) perror (const char *);

FILE * __attribute__((__cdecl__)) fopen (const char *_name, const char *_type);
int __attribute__((__cdecl__)) sprintf (char *, const char *, ...);
int __attribute__((__cdecl__)) remove (const char *);
int __attribute__((__cdecl__)) rename (const char *, const char *);






int __attribute__((__cdecl__)) fseeko (FILE *, off_t, int);
off_t __attribute__((__cdecl__)) ftello ( FILE *);


int __attribute__((__cdecl__)) asiprintf (char **, const char *, ...);
int __attribute__((__cdecl__)) asprintf (char **, const char *, ...);

int __attribute__((__cdecl__)) dprintf (int, const char *, ...);

int __attribute__((__cdecl__)) fcloseall (void);
int __attribute__((__cdecl__)) fiprintf (FILE *, const char *, ...);
int __attribute__((__cdecl__)) fiscanf (FILE *, const char *, ...);
int __attribute__((__cdecl__)) iprintf (const char *, ...);
int __attribute__((__cdecl__)) iscanf (const char *, ...);
int __attribute__((__cdecl__)) siprintf (char *, const char *, ...);
int __attribute__((__cdecl__)) siscanf (const char *, const char *, ...);
int __attribute__((__cdecl__)) snprintf (char *, size_t, const char *, ...);
int __attribute__((__cdecl__)) sniprintf (char *, size_t, const char *, ...);
char * __attribute__((__cdecl__)) tempnam (const char *, const char *);
int __attribute__((__cdecl__)) vasiprintf (char **, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) vasprintf (char **, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) vdprintf (int, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) vsniprintf (char *, size_t, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) vsnprintf (char *, size_t, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) vfiprintf (FILE *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) vfiscanf (FILE *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) vfscanf (FILE *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) viprintf (const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) viscanf (const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) vscanf (const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) vsiscanf (const char *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) vsscanf (const char *, const char *, __gnuc_va_list);
# 267 "/usr/include/stdio.h" 3 4
FILE * __attribute__((__cdecl__)) fdopen (int, const char *);

int __attribute__((__cdecl__)) fileno (FILE *);
int __attribute__((__cdecl__)) getw (FILE *);
int __attribute__((__cdecl__)) pclose (FILE *);
FILE * __attribute__((__cdecl__)) popen (const char *, const char *);
int __attribute__((__cdecl__)) putw (int, FILE *);
void __attribute__((__cdecl__)) setbuffer (FILE *, char *, int);
int __attribute__((__cdecl__)) setlinebuf (FILE *);
int __attribute__((__cdecl__)) getc_unlocked (FILE *);
int __attribute__((__cdecl__)) getchar_unlocked (void);
void __attribute__((__cdecl__)) flockfile (FILE *);
int __attribute__((__cdecl__)) ftrylockfile (FILE *);
void __attribute__((__cdecl__)) funlockfile (FILE *);
int __attribute__((__cdecl__)) putc_unlocked (int, FILE *);
int __attribute__((__cdecl__)) putchar_unlocked (int);






int __attribute__((__cdecl__)) _asiprintf_r (struct _reent *, char **, const char *, ...);
int __attribute__((__cdecl__)) _asprintf_r (struct _reent *, char **, const char *, ...);
int __attribute__((__cdecl__)) _dprintf_r (struct _reent *, int, const char *, ...);
int __attribute__((__cdecl__)) _fcloseall_r (struct _reent *);
FILE * __attribute__((__cdecl__)) _fdopen_r (struct _reent *, int, const char *);
FILE * __attribute__((__cdecl__)) _fopen_r (struct _reent *, const char *, const char *);
int __attribute__((__cdecl__)) _fclose_r (struct _reent *, FILE *);
char * __attribute__((__cdecl__)) _fgets_r (struct _reent *, char *, int, FILE *);
int __attribute__((__cdecl__)) _fiscanf_r (struct _reent *, FILE *, const char *, ...);
int __attribute__((__cdecl__)) _fputc_r (struct _reent *, int, FILE *);
int __attribute__((__cdecl__)) _fputs_r (struct _reent *, const char *, FILE *);
size_t __attribute__((__cdecl__)) _fread_r (struct _reent *, void *, size_t _size, size_t _n, FILE *);
int __attribute__((__cdecl__)) _fscanf_r (struct _reent *, FILE *, const char *, ...);
int __attribute__((__cdecl__)) _fseek_r (struct _reent *, FILE *, long, int);
long __attribute__((__cdecl__)) _ftell_r (struct _reent *, FILE *);
size_t __attribute__((__cdecl__)) _fwrite_r (struct _reent *, const void * , size_t _size, size_t _n, FILE *);
int __attribute__((__cdecl__)) _getc_r (struct _reent *, FILE *);
int __attribute__((__cdecl__)) _getc_unlocked_r (struct _reent *, FILE *);
int __attribute__((__cdecl__)) _getchar_r (struct _reent *);
int __attribute__((__cdecl__)) _getchar_unlocked_r (struct _reent *);
char * __attribute__((__cdecl__)) _gets_r (struct _reent *, char *);
int __attribute__((__cdecl__)) _iprintf_r (struct _reent *, const char *, ...);
int __attribute__((__cdecl__)) _iscanf_r (struct _reent *, const char *, ...);
int __attribute__((__cdecl__)) _mkstemp_r (struct _reent *, char *);
char * __attribute__((__cdecl__)) _mktemp_r (struct _reent *, char *);
void __attribute__((__cdecl__)) _perror_r (struct _reent *, const char *);
int __attribute__((__cdecl__)) _printf_r (struct _reent *, const char *, ...);
int __attribute__((__cdecl__)) _putc_r (struct _reent *, int, FILE *);
int __attribute__((__cdecl__)) _putc_unlocked_r (struct _reent *, int, FILE *);
int __attribute__((__cdecl__)) _putchar_unlocked_r (struct _reent *, int);
int __attribute__((__cdecl__)) _putchar_r (struct _reent *, int);
int __attribute__((__cdecl__)) _puts_r (struct _reent *, const char *);
int __attribute__((__cdecl__)) _remove_r (struct _reent *, const char *);
int __attribute__((__cdecl__)) _rename_r (struct _reent *, const char *_old, const char *_new);

int __attribute__((__cdecl__)) _scanf_r (struct _reent *, const char *, ...);
int __attribute__((__cdecl__)) _siprintf_r (struct _reent *, char *, const char *, ...);
int __attribute__((__cdecl__)) _siscanf_r (struct _reent *, const char *, const char *, ...);
int __attribute__((__cdecl__)) _sniprintf_r (struct _reent *, char *, size_t, const char *, ...);
int __attribute__((__cdecl__)) _snprintf_r (struct _reent *, char *, size_t, const char *, ...);
int __attribute__((__cdecl__)) _sprintf_r (struct _reent *, char *, const char *, ...);
int __attribute__((__cdecl__)) _sscanf_r (struct _reent *, const char *, const char *, ...);
char * __attribute__((__cdecl__)) _tempnam_r (struct _reent *, const char *, const char *);
FILE * __attribute__((__cdecl__)) _tmpfile_r (struct _reent *);
char * __attribute__((__cdecl__)) _tmpnam_r (struct _reent *, char *);
int __attribute__((__cdecl__)) _ungetc_r (struct _reent *, int, FILE *);
int __attribute__((__cdecl__)) _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _vdprintf_r (struct _reent *, int, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _vfprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _viprintf_r (struct _reent *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _vprintf_r (struct _reent *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _vsprintf_r (struct _reent *, char *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _vsnprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _vfscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _viscanf_r (struct _reent *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _vscanf_r (struct _reent *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _vsscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list);
int __attribute__((__cdecl__)) _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list);

ssize_t __attribute__((__cdecl__)) __getdelim (char **, size_t *, int, FILE *);
ssize_t __attribute__((__cdecl__)) __getline (char **, size_t *, FILE *);
# 380 "/usr/include/stdio.h" 3 4
int __attribute__((__cdecl__)) __srget_r (struct _reent *, FILE *);
int __attribute__((__cdecl__)) __swbuf_r (struct _reent *, int, FILE *);






FILE *__attribute__((__cdecl__)) funopen (const void * _cookie, int (*readfn)(void * _cookie, char *_buf, int _n), int (*writefn)(void * _cookie, const char *_buf, int _n), fpos_t (*seekfn)(void * _cookie, fpos_t _off, int _whence), int (*closefn)(void * _cookie));
# 405 "/usr/include/stdio.h" 3 4
static __inline__ int __sgetc_r(struct _reent *__ptr, FILE *__p)
  {
    int __c = (--(__p)->_r < 0 ? __srget_r(__ptr, __p) : (int)(*(__p)->_p++));
    if ((__p->_flags & 0x4000) && (__c == '\r'))
      {
      int __c2 = (--(__p)->_r < 0 ? __srget_r(__ptr, __p) : (int)(*(__p)->_p++));
      if (__c2 == '\n')
        __c = __c2;
      else
        ungetc(__c2, __p);
      }
    return __c;
  }
# 487 "/usr/include/stdio.h" 3 4

# 29 "rb-test.c" 2
# 1 "rb.h" 1
# 29 "rb.h"
# 1 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stddef.h" 1 3 4
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
      putc('(', ((__getreent())->_stdout));

      print_tree_structure (node->rb_link[0], level + 1);
      if (node->rb_link[1] != ((void *)0))
        {
          putc(',', ((__getreent())->_stdout));
          print_tree_structure (node->rb_link[1], level + 1);
        }

      putc(')', ((__getreent())->_stdout));
    }
}


void
print_whole_tree (const struct rb_table *tree, const char *title)
{
  printf ("%s: ", title);
  print_tree_structure (tree->rb_root, 0);
  putc('\n', ((__getreent())->_stdout));
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
      ((a == ((void *)0) && b == ((void *)0)) ? (void)0 : __assert("rb-test.c", 125, "a == NULL && b == NULL"));
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
