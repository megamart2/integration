# 1 "test.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "test.c"
# 26 "test.c"
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
# 27 "test.c" 2
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
# 28 "test.c" 2
# 1 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stdarg.h" 1 3 4
# 44 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 106 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 29 "test.c" 2
# 1 "/usr/include/stdio.h" 1 3 4
# 34 "/usr/include/stdio.h" 3 4
# 1 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stddef.h" 1 3 4
# 213 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stddef.h" 3 4
typedef unsigned int size_t;
# 35 "/usr/include/stdio.h" 2 3 4
# 45 "/usr/include/stdio.h" 3 4
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

# 30 "test.c" 2
# 1 "/usr/include/stdlib.h" 1 3 4
# 14 "/usr/include/stdlib.h" 3 4
# 1 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stddef.h" 1 3 4
# 15 "/usr/include/stdlib.h" 2 3 4


# 1 "/usr/include/machine/stdlib.h" 1 3 4
# 17 "/usr/include/machine/stdlib.h" 3 4
char *mkdtemp (char *);
# 18 "/usr/include/stdlib.h" 2 3 4

# 1 "/usr/include/alloca.h" 1 3 4
# 20 "/usr/include/stdlib.h" 2 3 4



# 1 "/usr/include/cygwin/stdlib.h" 1 3 4
# 14 "/usr/include/cygwin/stdlib.h" 3 4
# 1 "/usr/include/cygwin/wait.h" 1 3 4
# 15 "/usr/include/cygwin/stdlib.h" 2 3 4






const char *getprogname (void);
void setprogname (const char *);


char *realpath (const char *, char *);
int unsetenv (const char *);
int random (void);
long srandom (unsigned);
char *ptsname (int);
int grantpt (int);
int unlockpt (int);
# 24 "/usr/include/stdlib.h" 2 3 4




typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;
# 57 "/usr/include/stdlib.h" 3 4
extern __attribute__((dllimport)) int __mb_cur_max;



void __attribute__((__cdecl__)) abort (void) __attribute__ ((noreturn));
int __attribute__((__cdecl__)) abs (int);
int __attribute__((__cdecl__)) atexit (void (*__func)(void));
double __attribute__((__cdecl__)) atof (const char *__nptr);

float __attribute__((__cdecl__)) atoff (const char *__nptr);

int __attribute__((__cdecl__)) atoi (const char *__nptr);
int __attribute__((__cdecl__)) _atoi_r (struct _reent *, const char *__nptr);
long __attribute__((__cdecl__)) atol (const char *__nptr);
long __attribute__((__cdecl__)) _atol_r (struct _reent *, const char *__nptr);
void * __attribute__((__cdecl__)) bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, int (* __attribute__((__cdecl__)) _compar) (const void *, const void *));




void * __attribute__((__cdecl__)) calloc (size_t __nmemb, size_t __size);
div_t __attribute__((__cdecl__)) div (int __numer, int __denom);
void __attribute__((__cdecl__)) exit (int __status) __attribute__ ((noreturn));
void __attribute__((__cdecl__)) free (void *);
char * __attribute__((__cdecl__)) getenv (const char *__string);
char * __attribute__((__cdecl__)) _getenv_r (struct _reent *, const char *__string);
char * __attribute__((__cdecl__)) _findenv (const char *, int *);
char * __attribute__((__cdecl__)) _findenv_r (struct _reent *, const char *, int *);
long __attribute__((__cdecl__)) labs (long);
ldiv_t __attribute__((__cdecl__)) ldiv (long __numer, long __denom);
void * __attribute__((__cdecl__)) malloc (size_t __size);
int __attribute__((__cdecl__)) mblen (const char *, size_t);
int __attribute__((__cdecl__)) _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int __attribute__((__cdecl__)) mbtowc (wchar_t *, const char *, size_t);
int __attribute__((__cdecl__)) _mbtowc_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
int __attribute__((__cdecl__)) wctomb (char *, wchar_t);
int __attribute__((__cdecl__)) _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t __attribute__((__cdecl__)) mbstowcs (wchar_t *, const char *, size_t);
size_t __attribute__((__cdecl__)) _mbstowcs_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
size_t __attribute__((__cdecl__)) wcstombs (char *, const wchar_t *, size_t);
size_t __attribute__((__cdecl__)) _wcstombs_r (struct _reent *, char *, const wchar_t *, size_t, _mbstate_t *);


int __attribute__((__cdecl__)) mkstemp (char *);
char * __attribute__((__cdecl__)) mktemp (char *);


void __attribute__((__cdecl__)) qsort (void * __base, size_t __nmemb, size_t __size, int(*_compar)(const void *, const void *));
int __attribute__((__cdecl__)) rand (void);
void * __attribute__((__cdecl__)) realloc (void * __r, size_t __size);
void __attribute__((__cdecl__)) srand (unsigned __seed);
double __attribute__((__cdecl__)) strtod (const char *__n, char **__end_PTR);
double __attribute__((__cdecl__)) _strtod_r (struct _reent *,const char *__n, char **__end_PTR);
float __attribute__((__cdecl__)) strtof (const char *__n, char **__end_PTR);






long __attribute__((__cdecl__)) strtol (const char *__n, char **__end_PTR, int __base);
long __attribute__((__cdecl__)) _strtol_r (struct _reent *,const char *__n, char **__end_PTR, int __base);
unsigned long __attribute__((__cdecl__)) strtoul (const char *__n, char **__end_PTR, int __base);
unsigned long __attribute__((__cdecl__)) _strtoul_r (struct _reent *,const char *__n, char **__end_PTR, int __base);

int __attribute__((__cdecl__)) system (const char *__string);


long __attribute__((__cdecl__)) a64l (const char *__input);
char * __attribute__((__cdecl__)) l64a (long __input);
char * __attribute__((__cdecl__)) _l64a_r (struct _reent *,long __input);
int __attribute__((__cdecl__)) on_exit (void (*__func)(int, void *),void * __arg);
void __attribute__((__cdecl__)) _Exit (int __status) __attribute__ ((noreturn));
int __attribute__((__cdecl__)) putenv (char *__string);
int __attribute__((__cdecl__)) _putenv_r (struct _reent *, char *__string);
int __attribute__((__cdecl__)) setenv (const char *__string, const char *__value, int __overwrite);
int __attribute__((__cdecl__)) _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);

char * __attribute__((__cdecl__)) gcvt (double,int,char *);
char * __attribute__((__cdecl__)) gcvtf (float,int,char *);
char * __attribute__((__cdecl__)) fcvt (double,int,int *,int *);
char * __attribute__((__cdecl__)) fcvtf (float,int,int *,int *);
char * __attribute__((__cdecl__)) ecvt (double,int,int *,int *);
char * __attribute__((__cdecl__)) ecvtbuf (double, int, int*, int*, char *);
char * __attribute__((__cdecl__)) fcvtbuf (double, int, int*, int*, char *);
char * __attribute__((__cdecl__)) ecvtf (float,int,int *,int *);
char * __attribute__((__cdecl__)) dtoa (double, int, int, int *, int*, char**);
int __attribute__((__cdecl__)) rand_r (unsigned *__seed);

double __attribute__((__cdecl__)) drand48 (void);
double __attribute__((__cdecl__)) _drand48_r (struct _reent *);
double __attribute__((__cdecl__)) erand48 (unsigned short [3]);
double __attribute__((__cdecl__)) _erand48_r (struct _reent *, unsigned short [3]);
long __attribute__((__cdecl__)) jrand48 (unsigned short [3]);
long __attribute__((__cdecl__)) _jrand48_r (struct _reent *, unsigned short [3]);
void __attribute__((__cdecl__)) lcong48 (unsigned short [7]);
void __attribute__((__cdecl__)) _lcong48_r (struct _reent *, unsigned short [7]);
long __attribute__((__cdecl__)) lrand48 (void);
long __attribute__((__cdecl__)) _lrand48_r (struct _reent *);
long __attribute__((__cdecl__)) mrand48 (void);
long __attribute__((__cdecl__)) _mrand48_r (struct _reent *);
long __attribute__((__cdecl__)) nrand48 (unsigned short [3]);
long __attribute__((__cdecl__)) _nrand48_r (struct _reent *, unsigned short [3]);
unsigned short *
       __attribute__((__cdecl__)) seed48 (unsigned short [3]);
unsigned short *
       __attribute__((__cdecl__)) _seed48_r (struct _reent *, unsigned short [3]);
void __attribute__((__cdecl__)) srand48 (long);
void __attribute__((__cdecl__)) _srand48_r (struct _reent *, long);
long long __attribute__((__cdecl__)) atoll (const char *__nptr);
long long __attribute__((__cdecl__)) _atoll_r (struct _reent *, const char *__nptr);
long long __attribute__((__cdecl__)) llabs (long long);
lldiv_t __attribute__((__cdecl__)) lldiv (long long __numer, long long __denom);
long long __attribute__((__cdecl__)) strtoll (const char *__n, char **__end_PTR, int __base);
long long __attribute__((__cdecl__)) _strtoll_r (struct _reent *, const char *__n, char **__end_PTR, int __base);
unsigned long long __attribute__((__cdecl__)) strtoull (const char *__n, char **__end_PTR, int __base);
unsigned long long __attribute__((__cdecl__)) _strtoull_r (struct _reent *, const char *__n, char **__end_PTR, int __base);
# 183 "/usr/include/stdlib.h" 3 4
char * __attribute__((__cdecl__)) _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);







int __attribute__((__cdecl__)) _system_r (struct _reent *, const char *);

void __attribute__((__cdecl__)) __eprintf (const char *, const char *, unsigned int, const char *);


# 31 "test.c" 2
# 1 "/usr/include/string.h" 1 3 4
# 14 "/usr/include/string.h" 3 4
# 1 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stddef.h" 1 3 4
# 15 "/usr/include/string.h" 2 3 4







void * __attribute__((__cdecl__)) memchr (const void *, int, size_t);
int __attribute__((__cdecl__)) memcmp (const void *, const void *, size_t);
void * __attribute__((__cdecl__)) memcpy (void *, const void *, size_t);
void * __attribute__((__cdecl__)) memmove (void *, const void *, size_t);
void * __attribute__((__cdecl__)) memset (void *, int, size_t);
char *__attribute__((__cdecl__)) strcat (char *, const char *);
char *__attribute__((__cdecl__)) strchr (const char *, int);
int __attribute__((__cdecl__)) strcmp (const char *, const char *);
int __attribute__((__cdecl__)) strcoll (const char *, const char *);
char *__attribute__((__cdecl__)) strcpy (char *, const char *);
size_t __attribute__((__cdecl__)) strcspn (const char *, const char *);
char *__attribute__((__cdecl__)) strerror (int);
size_t __attribute__((__cdecl__)) strlen (const char *);
char *__attribute__((__cdecl__)) strncat (char *, const char *, size_t);
int __attribute__((__cdecl__)) strncmp (const char *, const char *, size_t);
char *__attribute__((__cdecl__)) strncpy (char *, const char *, size_t);
char *__attribute__((__cdecl__)) strpbrk (const char *, const char *);
char *__attribute__((__cdecl__)) strrchr (const char *, int);
size_t __attribute__((__cdecl__)) strspn (const char *, const char *);
char *__attribute__((__cdecl__)) strstr (const char *, const char *);


char *__attribute__((__cdecl__)) strtok (char *, const char *);


size_t __attribute__((__cdecl__)) strxfrm (char *, const char *, size_t);


char *__attribute__((__cdecl__)) strtok_r (char *, const char *, char **);

int __attribute__((__cdecl__)) bcmp (const void *, const void *, size_t);
void __attribute__((__cdecl__)) bcopy (const void *, void *, size_t);
void __attribute__((__cdecl__)) bzero (void *, size_t);
int __attribute__((__cdecl__)) ffs (int);
char *__attribute__((__cdecl__)) index (const char *, int);
void * __attribute__((__cdecl__)) memccpy (void *, const void *, int, size_t);
void * __attribute__((__cdecl__)) mempcpy (void *, const void *, size_t);

extern void *memmem (__const void *, size_t, __const void *, size_t);

char *__attribute__((__cdecl__)) rindex (const char *, int);
int __attribute__((__cdecl__)) strcasecmp (const char *, const char *);
char *__attribute__((__cdecl__)) strdup (const char *);
char *__attribute__((__cdecl__)) _strdup_r (struct _reent *, const char *);
char *__attribute__((__cdecl__)) strndup (const char *, size_t);
char *__attribute__((__cdecl__)) _strndup_r (struct _reent *, const char *, size_t);
char *__attribute__((__cdecl__)) strerror_r (int, char *, size_t);
size_t __attribute__((__cdecl__)) strlcat (char *, const char *, size_t);
size_t __attribute__((__cdecl__)) strlcpy (char *, const char *, size_t);
int __attribute__((__cdecl__)) strncasecmp (const char *, const char *, size_t);
size_t __attribute__((__cdecl__)) strnlen (const char *, size_t);
char *__attribute__((__cdecl__)) strsep (char **, const char *);
char *__attribute__((__cdecl__)) strlwr (char *);
char *__attribute__((__cdecl__)) strupr (char *);


const char *__attribute__((__cdecl__)) strsignal (int __signo);

int __attribute__((__cdecl__)) strtosigno (const char *__name);
# 99 "/usr/include/string.h" 3 4
# 1 "/usr/include/sys/string.h" 1 3 4
# 100 "/usr/include/string.h" 2 3 4


# 32 "test.c" 2
# 1 "/usr/include/time.h" 1 3 4
# 18 "/usr/include/time.h" 3 4
# 1 "/usr/include/machine/time.h" 1 3 4
# 19 "/usr/include/time.h" 2 3 4
# 27 "/usr/include/time.h" 3 4
# 1 "/usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stddef.h" 1 3 4
# 28 "/usr/include/time.h" 2 3 4





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
};

clock_t __attribute__((__cdecl__)) clock (void);
double __attribute__((__cdecl__)) difftime (time_t _time2, time_t _time1);
time_t __attribute__((__cdecl__)) mktime (struct tm *_timeptr);
time_t __attribute__((__cdecl__)) time (time_t *_timer);

char *__attribute__((__cdecl__)) asctime (const struct tm *_tblock);
char *__attribute__((__cdecl__)) ctime (const time_t *_time);
struct tm *__attribute__((__cdecl__)) gmtime (const time_t *_timer);
struct tm *__attribute__((__cdecl__)) localtime (const time_t *_timer);

size_t __attribute__((__cdecl__)) strftime (char *_s, size_t _maxsize, const char *_fmt, const struct tm *_t);

char *__attribute__((__cdecl__)) asctime_r (const struct tm *, char *);
char *__attribute__((__cdecl__)) ctime_r (const time_t *, char *);
struct tm *__attribute__((__cdecl__)) gmtime_r (const time_t *, struct tm *);
struct tm *__attribute__((__cdecl__)) localtime_r (const time_t *, struct tm *);








char *__attribute__((__cdecl__)) strptime (const char *, const char *, struct tm *);
void __attribute__((__cdecl__)) tzset (void);
void __attribute__((__cdecl__)) _tzset_r (struct _reent *);

typedef struct __tzrule_struct
{
  char ch;
  int m;
  int n;
  int d;
  int s;
  time_t change;
  long offset;
} __tzrule_type;

typedef struct __tzinfo_struct
{
  int __tznorth;
  int __tzyear;
  __tzrule_type __tzrule[2];
} __tzinfo_type;

__tzinfo_type *__attribute__((__cdecl__)) __gettzinfo (void);
# 118 "/usr/include/time.h" 3 4
extern __attribute__((dllimport)) long _timezone;
extern __attribute__((dllimport)) int _daylight;
extern __attribute__((dllimport)) char *_tzname[2];
# 135 "/usr/include/time.h" 3 4
# 1 "/usr/include/cygwin/time.h" 1 3 4
# 18 "/usr/include/cygwin/time.h" 3 4
int nanosleep (const struct timespec *, struct timespec *);
int clock_setres (clockid_t, struct timespec *);
int clock_getres (clockid_t, struct timespec *);


time_t timelocal (struct tm *);
time_t timegm (struct tm *);
# 34 "/usr/include/cygwin/time.h" 3 4
char *timezone (void);
# 136 "/usr/include/time.h" 2 3 4




# 1 "/usr/include/signal.h" 1 3 4




# 1 "/usr/include/sys/signal.h" 1 3 4
# 18 "/usr/include/sys/signal.h" 3 4
typedef unsigned long sigset_t;
# 107 "/usr/include/sys/signal.h" 3 4
# 1 "/usr/include/cygwin/signal.h" 1 3 4
# 17 "/usr/include/cygwin/signal.h" 3 4
struct _fpstate
{
  unsigned long cw;
  unsigned long sw;
  unsigned long tag;
  unsigned long ipoff;
  unsigned long cssel;
  unsigned long dataoff;
  unsigned long datasel;
  unsigned char _st[80];
  unsigned long nxst;
};

struct ucontext
{
  unsigned long cr2;
  unsigned long dr0;
  unsigned long dr1;
  unsigned long dr2;
  unsigned long dr3;
  unsigned long dr6;
  unsigned long dr7;
  struct _fpstate fpstate;
  unsigned long gs;
  unsigned long fs;
  unsigned long es;
  unsigned long ds;
  unsigned long edi;
  unsigned long esi;
  unsigned long ebx;
  unsigned long edx;
  unsigned long ecx;
  unsigned long eax;
  unsigned long ebp;
  unsigned long eip;
  unsigned long cs;
  unsigned long eflags;
  unsigned long esp;
  unsigned long ss;
  unsigned char _internal;
  unsigned long oldmask;
};



typedef union sigval
{
  int sival_int;
  void *sival_ptr;
} sigval_t;

typedef struct sigevent
{
  sigval_t sigev_value;
  int sigev_signo;
  int sigev_notify;
  void (*sigev_notify_function) (sigval_t);
  pthread_attr_t *sigev_notify_attributes;
} sigevent_t;

#pragma pack(push,4)
struct _sigcommune
{
  __uint32_t _si_code;
  void *_si_read_handle;
  void *_si_write_handle;
  void *_si_process_handle;
  union
  {
    int _si_fd;
    void *_si_pipe_fhandler;
    char *_si_str;
  };
};

typedef struct
{
  int si_signo;
  int si_code;
  pid_t si_pid;
  uid_t si_uid;
  int si_errno;

  union
  {
    __uint32_t __pad[32];
    struct _sigcommune _si_commune;
    union
    {

      struct
      {
 union
 {
   struct
   {
     timer_t si_tid;
     unsigned int si_overrun;
   };
   sigval_t si_sigval;
   sigval_t si_value;
 };
      };
    };


    struct
    {
      int si_status;
      clock_t si_utime;
      clock_t si_stime;
    };


    void *si_addr;
  };
} siginfo_t;
#pragma pack(pop)

enum
{
  SI_USER = 0,
  SI_ASYNCIO = 2,

  SI_MESGQ,

  SI_TIMER,
  SI_QUEUE,

  SI_KERNEL,

  ILL_ILLOPC,
  ILL_ILLOPN,
  ILL_ILLADR,
  ILL_ILLTRP,
  ILL_PRVOPC,
  ILL_PRVREG,
  ILL_COPROC,
  ILL_BADSTK,

  FPE_INTDIV,
  FPE_INTOVF,
  FPE_FLTDIV,
  FPE_FLTOVF,
  FPE_FLTUND,
  FPE_FLTRES,
  FPE_FLTINV,
  FPE_FLTSUB,

  SEGV_MAPERR,
  SEGV_ACCERR,

  BUS_ADRALN,
  BUS_ADRERR,
  BUS_OBJERR,

  CLD_EXITED,
  CLD_KILLED,
  CLD_DUMPED,
  CLD_TRAPPED,
  CLD_STOPPED,
  CLD_CONTINUED
};

enum
{
  SIGEV_SIGNAL = 0,


  SIGEV_NONE,


  SIGEV_THREAD

};

typedef void (*_sig_func_ptr)(int);

struct sigaction
{
  union
  {
    _sig_func_ptr sa_handler;
    void (*sa_sigaction) ( int, siginfo_t *, void * );
  };
  sigset_t sa_mask;
  int sa_flags;
};
# 263 "/usr/include/cygwin/signal.h" 3 4
int sigwait (const sigset_t *, int *);
int sigwaitinfo (const sigset_t *, siginfo_t *);
int sighold (int);
int sigignore (int);
int sigrelse (int);
_sig_func_ptr sigset (int, _sig_func_ptr);

int sigqueue(pid_t, int, const union sigval);
int siginterrupt (int, int);
# 108 "/usr/include/sys/signal.h" 2 3 4
# 134 "/usr/include/sys/signal.h" 3 4
int __attribute__((__cdecl__)) sigprocmask (int how, const sigset_t *set, sigset_t *oset);


int __attribute__((__cdecl__)) pthread_sigmask (int how, const sigset_t *set, sigset_t *oset);
# 151 "/usr/include/sys/signal.h" 3 4
int __attribute__((__cdecl__)) kill (int, int);
int __attribute__((__cdecl__)) killpg (pid_t, int);
int __attribute__((__cdecl__)) sigaction (int, const struct sigaction *, struct sigaction *);
int __attribute__((__cdecl__)) sigaddset (sigset_t *, const int);
int __attribute__((__cdecl__)) sigdelset (sigset_t *, const int);
int __attribute__((__cdecl__)) sigismember (const sigset_t *, int);
int __attribute__((__cdecl__)) sigfillset (sigset_t *);
int __attribute__((__cdecl__)) sigemptyset (sigset_t *);
int __attribute__((__cdecl__)) sigpending (sigset_t *);
int __attribute__((__cdecl__)) sigsuspend (const sigset_t *);
int __attribute__((__cdecl__)) sigpause (int);







int __attribute__((__cdecl__)) pthread_kill (pthread_t thread, int sig);
# 6 "/usr/include/signal.h" 2 3 4



typedef int sig_atomic_t;





struct _reent;

_sig_func_ptr __attribute__((__cdecl__)) _signal_r (struct _reent *, int, _sig_func_ptr);
int __attribute__((__cdecl__)) _raise_r (struct _reent *, int);


_sig_func_ptr __attribute__((__cdecl__)) signal (int, _sig_func_ptr);
int __attribute__((__cdecl__)) raise (int);



# 141 "/usr/include/time.h" 2 3 4







int __attribute__((__cdecl__)) clock_settime (clockid_t clock_id, const struct timespec *tp);
int __attribute__((__cdecl__)) clock_gettime (clockid_t clock_id, struct timespec *tp);
int __attribute__((__cdecl__)) clock_getres (clockid_t clock_id, struct timespec *res);



int __attribute__((__cdecl__)) timer_create (clockid_t clock_id, struct sigevent *evp, timer_t *timerid);




int __attribute__((__cdecl__)) timer_delete (timer_t timerid);



int __attribute__((__cdecl__)) timer_settime (timer_t timerid, int flags, const struct itimerspec *value, struct itimerspec *ovalue);


int __attribute__((__cdecl__)) timer_gettime (timer_t timerid, struct itimerspec *value);
int __attribute__((__cdecl__)) timer_getoverrun (timer_t timerid);



int __attribute__((__cdecl__)) nanosleep (const struct timespec *rqtp, struct timespec *rmtp);
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

  fprintf (((__getreent())->_stderr), "%s: ", pgm_name);

  __builtin_va_start(args,message);
  vfprintf (((__getreent())->_stderr), message, args);
  __builtin_va_end(args);

  putc('\n', ((__getreent())->_stdout));

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
  ((mt != ((void *)0)) ? (void)0 : __assert("test.c", 226, "mt != NULL"));

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
      if (rand () / (0x7fffffff / 100 + 1) < mt->arg[MT_PERCENT])
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
      ((0) ? (void)0 : __assert("test.c", 358, "0"));
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

  ((options != ((void *)0) && args != ((void *)0)) ? (void)0 : __assert("test.c", 428, "options != NULL && args != NULL"));

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

  ((state != ((void *)0) && state->short_next != ((void *)0) && *state->short_next != '\0' && state->options != ((void *)0)) ? (void)0 : __assert("test.c", 449, "state != NULL && state->short_next != NULL && *state->short_next != '\\0' && state->options != NULL"));




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

  ((state != ((void *)0) && state->arg_next != ((void *)0) && *state->arg_next != ((void *)0) && state->options != ((void *)0) && argp != ((void *)0)) ? (void)0 : __assert("test.c", 485, "state != NULL && state->arg_next != NULL && *state->arg_next != NULL && state->options != NULL && argp != NULL"));






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
  ((state != ((void *)0) && argp != ((void *)0)) ? (void)0 : __assert("test.c", 530, "state != NULL && argp != NULL"));


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
  return x >= (-2147483647 -1) && x <= 2147483647 ? x : 0;
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

            ((sizeof orders / sizeof *orders == INS_CNT) ? (void)0 : __assert("test.c", 724, "sizeof orders / sizeof *orders == INS_CNT"));
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

            ((sizeof orders / sizeof *orders == DEL_CNT) ? (void)0 : __assert("test.c", 745, "sizeof orders / sizeof *orders == DEL_CNT"));
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
                 ((__getreent())->_stdout));
          exit (0);

        default:
          ((0) ? (void)0 : __assert("test.c", 844, "0"));
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
      size_t j = i + (unsigned) rand () / (0x7fffffff / (n - i) + 1);
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
      ((0) ? (void)0 : __assert("test.c", 938, "0"));
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
      ((0) ? (void)0 : __assert("test.c", 973, "0"));
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
    seed = seed * (255 + 2u) + ptr[i];

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
    fputs ("bst-test for GNU libavl 2.0.2; use --help to get help.\n", ((__getreent())->_stdout));

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
          fflush (((__getreent())->_stdout));
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
            ((0) ? (void)0 : __assert("test.c", 1083, "0"));
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
