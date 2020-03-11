# 1 "rb.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "rb.c"
# 26 "rb.c"
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
# 27 "rb.c" 2
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

# 1 "/usr/include/sys/features.h" 1 3 4
# 269 "/usr/include/sys/types.h" 2 3 4
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
# 14 "/usr/include/sys/stdio.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 15 "/usr/include/sys/stdio.h" 2 3 4
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

# 28 "rb.c" 2
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


# 29 "rb.c" 2
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


# 30 "rb.c" 2
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
# 31 "rb.c" 2





struct rb_table *
rb_create (rb_comparison_func *compare, void *param,
            struct libavl_allocator *allocator)
{
  struct rb_table *tree;

  ((compare != ((void *)0)) ? (void)0 : __assert("rb.c", 42, "compare != NULL"));

  if (allocator == ((void *)0))
    allocator = &rb_allocator_default;

  tree = allocator->libavl_malloc (allocator, sizeof *tree);
  if (tree == ((void *)0))
    return ((void *)0);

  tree->rb_root = ((void *)0);
  tree->rb_compare = compare;
  tree->rb_param = param;
  tree->rb_alloc = allocator;


  tree->rb_generation = 0;

  return tree;
}



void *
rb_find (const struct rb_table *tree, const void *item)
{
  const struct rb_node *p;

  ((tree != ((void *)0) && item != ((void *)0)) ? (void)0 : __assert("rb.c", 69, "tree != NULL && item != NULL"));
  for (p = tree->rb_root; p != ((void *)0); )
    {
      int cmp = tree->rb_compare (item, p->rb_data, tree->rb_param);

      if (cmp < 0)
        p = p->rb_link[0];
      else if (cmp > 0)
        p = p->rb_link[1];
      else
        return p->rb_data;
    }

  return ((void *)0);
}





void **
rb_probe (struct rb_table *tree, void *item)
{
  struct rb_node *pa[48];
  unsigned char da[48];
  int k;

  struct rb_node *p;
  struct rb_node *n;

  ((tree != ((void *)0) && item != ((void *)0)) ? (void)0 : __assert("rb.c", 99, "tree != NULL && item != NULL"));

  pa[0] = (struct rb_node *) &tree->rb_root;
  da[0] = 0;
  k = 1;
  for (p = tree->rb_root; p != ((void *)0); p = p->rb_link[da[k - 1]])
    {
      int cmp = tree->rb_compare (item, p->rb_data, tree->rb_param);
      if (cmp == 0)
        return &p->rb_data;

      pa[k] = p;
      da[k++] = cmp > 0;
    }

  n = pa[k - 1]->rb_link[da[k - 1]] =
    tree->rb_alloc->libavl_malloc (tree->rb_alloc, sizeof *n);
  if (n == ((void *)0))
    return ((void *)0);

  n->rb_data = item;
  n->rb_link[0] = n->rb_link[1] = ((void *)0);
  n->rb_color = RB_RED;


  tree->rb_generation++;

  while (k >= 3 && pa[k - 1]->rb_color == RB_RED)
    {
      if (da[k - 2] == 0)
        {
          struct rb_node *y = pa[k - 2]->rb_link[1];
          if (y != ((void *)0) && y->rb_color == RB_RED)
            {
              pa[k - 1]->rb_color = y->rb_color = RB_BLACK;
              pa[k - 2]->rb_color = RB_RED;
              k -= 2;
            }
          else
            {
              struct rb_node *x;

              if (da[k - 1] == 0)
                y = pa[k - 1];
              else
                {
                  x = pa[k - 1];
                  y = x->rb_link[1];
                  x->rb_link[1] = y->rb_link[0];
                  y->rb_link[0] = x;
                  pa[k - 2]->rb_link[0] = y;
                }

              x = pa[k - 2];
              x->rb_color = RB_RED;
              y->rb_color = RB_BLACK;

              x->rb_link[0] = y->rb_link[1];
              y->rb_link[1] = x;
              pa[k - 3]->rb_link[da[k - 3]] = y;
              break;
            }
        }
      else
        {
          struct rb_node *y = pa[k - 2]->rb_link[0];
          if (y != ((void *)0) && y->rb_color == RB_RED)
            {
              pa[k - 1]->rb_color = y->rb_color = RB_BLACK;
              pa[k - 2]->rb_color = RB_RED;
              k -= 2;
            }
          else
            {
              struct rb_node *x;

              if (da[k - 1] == 1)
                y = pa[k - 1];
              else
                {
                  x = pa[k - 1];
                  y = x->rb_link[0];
                  x->rb_link[0] = y->rb_link[1];
                  y->rb_link[1] = x;
                  pa[k - 2]->rb_link[1] = y;
                }

              x = pa[k - 2];
              x->rb_color = RB_RED;
              y->rb_color = RB_BLACK;

              x->rb_link[1] = y->rb_link[0];
              y->rb_link[0] = x;
              pa[k - 3]->rb_link[da[k - 3]] = y;
              break;
            }
        }
    }
  tree->rb_root->rb_color = RB_BLACK;


  return &n->rb_data;
}





void *
rb_insert (struct rb_table *table, void *item)
{
  void **p = rb_probe (table, item);
  return p == ((void *)0) || *p == item ? ((void *)0) : *p;
}





void *
rb_replace (struct rb_table *table, void *item)
{
  void **p = rb_probe (table, item);
  if (p == ((void *)0) || *p == item)
    return ((void *)0);
  else
    {
      void *r = *p;
      *p = item;
      return r;
    }
}



void *
rb_delete (struct rb_table *tree, const void *item)
{
  struct rb_node *pa[48];
  unsigned char da[48];
  int k;

  struct rb_node *p;
  int cmp;

  ((tree != ((void *)0) && item != ((void *)0)) ? (void)0 : __assert("rb.c", 244, "tree != NULL && item != NULL"));

  k = 0;
  p = (struct rb_node *) &tree->rb_root;
  for (cmp = -1; cmp != 0;
       cmp = tree->rb_compare (item, p->rb_data, tree->rb_param))
    {
      int dir = cmp > 0;

      pa[k] = p;
      da[k++] = dir;

      p = p->rb_link[dir];
      if (p == ((void *)0))
        return ((void *)0);
    }
  item = p->rb_data;

  if (p->rb_link[1] == ((void *)0))
    pa[k - 1]->rb_link[da[k - 1]] = p->rb_link[0];
  else
    {
      enum rb_color t;
      struct rb_node *r = p->rb_link[1];

      if (r->rb_link[0] == ((void *)0))
        {
          r->rb_link[0] = p->rb_link[0];
          t = r->rb_color;
          r->rb_color = p->rb_color;
          p->rb_color = t;
          pa[k - 1]->rb_link[da[k - 1]] = r;
          da[k] = 1;
          pa[k++] = r;
        }
      else
        {
          struct rb_node *s;
          int j = k++;

          for (;;)
            {
              da[k] = 0;
              pa[k++] = r;
              s = r->rb_link[0];
              if (s->rb_link[0] == ((void *)0))
                break;

              r = s;
            }

          da[j] = 1;
          pa[j] = s;
          pa[j - 1]->rb_link[da[j - 1]] = s;

          s->rb_link[0] = p->rb_link[0];
          r->rb_link[0] = s->rb_link[1];
          s->rb_link[1] = p->rb_link[1];

          t = s->rb_color;
          s->rb_color = p->rb_color;
          p->rb_color = t;
        }
    }

  if (p->rb_color == RB_BLACK)
    {
      for (;;)
        {
          struct rb_node *x = pa[k - 1]->rb_link[da[k - 1]];
          if (x != ((void *)0) && x->rb_color == RB_RED)
            {
              x->rb_color = RB_BLACK;
              break;
            }
          if (k < 2)
            break;

          if (da[k - 1] == 0)
            {
              struct rb_node *w = pa[k - 1]->rb_link[1];

              if (w->rb_color == RB_RED)
                {
                  w->rb_color = RB_BLACK;
                  pa[k - 1]->rb_color = RB_RED;

                  pa[k - 1]->rb_link[1] = w->rb_link[0];
                  w->rb_link[0] = pa[k - 1];
                  pa[k - 2]->rb_link[da[k - 2]] = w;

                  pa[k] = pa[k - 1];
                  da[k] = 0;
                  pa[k - 1] = w;
                  k++;

                  w = pa[k - 1]->rb_link[1];
                }

              if ((w->rb_link[0] == ((void *)0)
                   || w->rb_link[0]->rb_color == RB_BLACK)
                  && (w->rb_link[1] == ((void *)0)
                      || w->rb_link[1]->rb_color == RB_BLACK))
                w->rb_color = RB_RED;
              else
                {
                  if (w->rb_link[1] == ((void *)0)
                      || w->rb_link[1]->rb_color == RB_BLACK)
                    {
                      struct rb_node *y = w->rb_link[0];
                      y->rb_color = RB_BLACK;
                      w->rb_color = RB_RED;
                      w->rb_link[0] = y->rb_link[1];
                      y->rb_link[1] = w;
                      w = pa[k - 1]->rb_link[1] = y;
                    }

                  w->rb_color = pa[k - 1]->rb_color;
                  pa[k - 1]->rb_color = RB_BLACK;
                  w->rb_link[1]->rb_color = RB_BLACK;

                  pa[k - 1]->rb_link[1] = w->rb_link[0];
                  w->rb_link[0] = pa[k - 1];
                  pa[k - 2]->rb_link[da[k - 2]] = w;
                  break;
                }
            }
          else
            {
              struct rb_node *w = pa[k - 1]->rb_link[0];

              if (w->rb_color == RB_RED)
                {
                  w->rb_color = RB_BLACK;
                  pa[k - 1]->rb_color = RB_RED;

                  pa[k - 1]->rb_link[0] = w->rb_link[1];
                  w->rb_link[1] = pa[k - 1];
                  pa[k - 2]->rb_link[da[k - 2]] = w;

                  pa[k] = pa[k - 1];
                  da[k] = 1;
                  pa[k - 1] = w;
                  k++;

                  w = pa[k - 1]->rb_link[0];
                }

              if ((w->rb_link[0] == ((void *)0)
                   || w->rb_link[0]->rb_color == RB_BLACK)
                  && (w->rb_link[1] == ((void *)0)
                      || w->rb_link[1]->rb_color == RB_BLACK))
                w->rb_color = RB_RED;
              else
                {
                  if (w->rb_link[0] == ((void *)0)
                      || w->rb_link[0]->rb_color == RB_BLACK)
                    {
                      struct rb_node *y = w->rb_link[1];
                      y->rb_color = RB_BLACK;
                      w->rb_color = RB_RED;
                      w->rb_link[1] = y->rb_link[0];
                      y->rb_link[0] = w;
                      w = pa[k - 1]->rb_link[0] = y;
                    }

                  w->rb_color = pa[k - 1]->rb_color;
                  pa[k - 1]->rb_color = RB_BLACK;
                  w->rb_link[0]->rb_color = RB_BLACK;

                  pa[k - 1]->rb_link[0] = w->rb_link[1];
                  w->rb_link[1] = pa[k - 1];
                  pa[k - 2]->rb_link[da[k - 2]] = w;
                  break;
                }
            }

          k--;
        }

    }

  tree->rb_alloc->libavl_free (tree->rb_alloc, p);




  tree->rb_generation++;
  return (void *) item;
}



static void
trav_refresh (struct rb_traverser *trav)
{
  ((trav != ((void *)0)) ? (void)0 : __assert("rb.c", 440, "trav != NULL"));

  trav->rb_generation = trav->rb_table->rb_generation;

  if (trav->rb_node != ((void *)0))
    {
      rb_comparison_func *cmp = trav->rb_table->rb_compare;
      void *param = trav->rb_table->rb_param;
      struct rb_node *node = trav->rb_node;
      struct rb_node *i;

      trav->rb_height = 0;
      for (i = trav->rb_table->rb_root; i != node; )
        {
          ((trav->rb_height < 48) ? (void)0 : __assert("rb.c", 454, "trav->rb_height < RB_MAX_HEIGHT"));
          ((i != ((void *)0)) ? (void)0 : __assert("rb.c", 455, "i != NULL"));

          trav->rb_stack[trav->rb_height++] = i;
          i = i->rb_link[cmp (node->rb_data, i->rb_data, param) > 0];
        }
    }
}



void
rb_t_init (struct rb_traverser *trav, struct rb_table *tree)
{
  trav->rb_table = tree;
  trav->rb_node = ((void *)0);
  trav->rb_height = 0;
  trav->rb_generation = tree->rb_generation;
}




void *
rb_t_first (struct rb_traverser *trav, struct rb_table *tree)
{
  struct rb_node *x;

  ((tree != ((void *)0) && trav != ((void *)0)) ? (void)0 : __assert("rb.c", 482, "tree != NULL && trav != NULL"));

  trav->rb_table = tree;
  trav->rb_height = 0;
  trav->rb_generation = tree->rb_generation;

  x = tree->rb_root;
  if (x != ((void *)0))
    while (x->rb_link[0] != ((void *)0))
      {
        ((trav->rb_height < 48) ? (void)0 : __assert("rb.c", 492, "trav->rb_height < RB_MAX_HEIGHT"));
        trav->rb_stack[trav->rb_height++] = x;
        x = x->rb_link[0];
      }
  trav->rb_node = x;

  return x != ((void *)0) ? x->rb_data : ((void *)0);
}




void *
rb_t_last (struct rb_traverser *trav, struct rb_table *tree)
{
  struct rb_node *x;

  ((tree != ((void *)0) && trav != ((void *)0)) ? (void)0 : __assert("rb.c", 509, "tree != NULL && trav != NULL"));

  trav->rb_table = tree;
  trav->rb_height = 0;
  trav->rb_generation = tree->rb_generation;

  x = tree->rb_root;
  if (x != ((void *)0))
    while (x->rb_link[1] != ((void *)0))
      {
        ((trav->rb_height < 48) ? (void)0 : __assert("rb.c", 519, "trav->rb_height < RB_MAX_HEIGHT"));
        trav->rb_stack[trav->rb_height++] = x;
        x = x->rb_link[1];
      }
  trav->rb_node = x;

  return x != ((void *)0) ? x->rb_data : ((void *)0);
}






void *
rb_t_find (struct rb_traverser *trav, struct rb_table *tree, void *item)
{
  struct rb_node *p, *q;

  ((trav != ((void *)0) && tree != ((void *)0) && item != ((void *)0)) ? (void)0 : __assert("rb.c", 538, "trav != NULL && tree != NULL && item != NULL"));
  trav->rb_table = tree;
  trav->rb_height = 0;
  trav->rb_generation = tree->rb_generation;
  for (p = tree->rb_root; p != ((void *)0); p = q)
    {
      int cmp = tree->rb_compare (item, p->rb_data, tree->rb_param);

      if (cmp < 0)
        q = p->rb_link[0];
      else if (cmp > 0)
        q = p->rb_link[1];
      else
        {
          trav->rb_node = p;
          return p->rb_data;
        }

      ((trav->rb_height < 48) ? (void)0 : __assert("rb.c", 556, "trav->rb_height < RB_MAX_HEIGHT"));
      trav->rb_stack[trav->rb_height++] = p;
    }

  trav->rb_height = 0;
  trav->rb_node = ((void *)0);
  return ((void *)0);
}
# 572 "rb.c"
void *
rb_t_insert (struct rb_traverser *trav, struct rb_table *tree, void *item)
{
  void **p;

  ((trav != ((void *)0) && tree != ((void *)0) && item != ((void *)0)) ? (void)0 : __assert("rb.c", 577, "trav != NULL && tree != NULL && item != NULL"));

  p = rb_probe (tree, item);
  if (p != ((void *)0))
    {
      trav->rb_table = tree;
      trav->rb_node =
        ((struct rb_node *)
         ((char *) p - ((size_t) &((struct rb_node *)0)->rb_data)));
      trav->rb_generation = tree->rb_generation - 1;
      return *p;
    }
  else
    {
      rb_t_init (trav, tree);
      return ((void *)0);
    }
}


void *
rb_t_copy (struct rb_traverser *trav, const struct rb_traverser *src)
{
  ((trav != ((void *)0) && src != ((void *)0)) ? (void)0 : __assert("rb.c", 600, "trav != NULL && src != NULL"));

  if (trav != src)
    {
      trav->rb_table = src->rb_table;
      trav->rb_node = src->rb_node;
      trav->rb_generation = src->rb_generation;
      if (trav->rb_generation == trav->rb_table->rb_generation)
        {
          trav->rb_height = src->rb_height;
          memcpy (trav->rb_stack, (const void *) src->rb_stack,
                  sizeof *trav->rb_stack * trav->rb_height);
        }
    }

  return trav->rb_node != ((void *)0) ? trav->rb_node->rb_data : ((void *)0);
}




void *
rb_t_next (struct rb_traverser *trav)
{
  struct rb_node *x;

  ((trav != ((void *)0)) ? (void)0 : __assert("rb.c", 626, "trav != NULL"));

  if (trav->rb_generation != trav->rb_table->rb_generation)
    trav_refresh (trav);

  x = trav->rb_node;
  if (x == ((void *)0))
    {
      return rb_t_first (trav, trav->rb_table);
    }
  else if (x->rb_link[1] != ((void *)0))
    {
      ((trav->rb_height < 48) ? (void)0 : __assert("rb.c", 638, "trav->rb_height < RB_MAX_HEIGHT"));
      trav->rb_stack[trav->rb_height++] = x;
      x = x->rb_link[1];

      while (x->rb_link[0] != ((void *)0))
        {
          ((trav->rb_height < 48) ? (void)0 : __assert("rb.c", 644, "trav->rb_height < RB_MAX_HEIGHT"));
          trav->rb_stack[trav->rb_height++] = x;
          x = x->rb_link[0];
        }
    }
  else
    {
      struct rb_node *y;

      do
        {
          if (trav->rb_height == 0)
            {
              trav->rb_node = ((void *)0);
              return ((void *)0);
            }

          y = x;
          x = trav->rb_stack[--trav->rb_height];
        }
      while (y == x->rb_link[1]);
    }
  trav->rb_node = x;

  return x->rb_data;
}




void *
rb_t_prev (struct rb_traverser *trav)
{
  struct rb_node *x;

  ((trav != ((void *)0)) ? (void)0 : __assert("rb.c", 679, "trav != NULL"));

  if (trav->rb_generation != trav->rb_table->rb_generation)
    trav_refresh (trav);

  x = trav->rb_node;
  if (x == ((void *)0))
    {
      return rb_t_last (trav, trav->rb_table);
    }
  else if (x->rb_link[0] != ((void *)0))
    {
      ((trav->rb_height < 48) ? (void)0 : __assert("rb.c", 691, "trav->rb_height < RB_MAX_HEIGHT"));
      trav->rb_stack[trav->rb_height++] = x;
      x = x->rb_link[0];

      while (x->rb_link[1] != ((void *)0))
        {
          ((trav->rb_height < 48) ? (void)0 : __assert("rb.c", 697, "trav->rb_height < RB_MAX_HEIGHT"));
          trav->rb_stack[trav->rb_height++] = x;
          x = x->rb_link[1];
        }
    }
  else
    {
      struct rb_node *y;

      do
        {
          if (trav->rb_height == 0)
            {
              trav->rb_node = ((void *)0);
              return ((void *)0);
            }

          y = x;
          x = trav->rb_stack[--trav->rb_height];
        }
      while (y == x->rb_link[0]);
    }
  trav->rb_node = x;

  return x->rb_data;
}


void *
rb_t_cur (struct rb_traverser *trav)
{
  ((trav != ((void *)0)) ? (void)0 : __assert("rb.c", 728, "trav != NULL"));

  return trav->rb_node != ((void *)0) ? trav->rb_node->rb_data : ((void *)0);
}




void *
rb_t_replace (struct rb_traverser *trav, void *new)
{
  void *old;

  ((trav != ((void *)0) && trav->rb_node != ((void *)0) && new != ((void *)0)) ? (void)0 : __assert("rb.c", 741, "trav != NULL && trav->rb_node != NULL && new != NULL"));
  old = trav->rb_node->rb_data;
  trav->rb_node->rb_data = new;
  return old;
}




static void
copy_error_recovery (struct rb_node **stack, int height,
                     struct rb_table *new, rb_item_func *destroy)
{
  ((stack != ((void *)0) && height >= 0 && new != ((void *)0)) ? (void)0 : __assert("rb.c", 754, "stack != NULL && height >= 0 && new != NULL"));

  for (; height > 2; height -= 2)
    stack[height - 1]->rb_link[1] = ((void *)0);
  rb_destroy (new, destroy);
}
# 770 "rb.c"
struct rb_table *
rb_copy (const struct rb_table *org, rb_copy_func *copy,
          rb_item_func *destroy, struct libavl_allocator *allocator)
{
  struct rb_node *stack[2 * (48 + 1)];
  int height = 0;

  struct rb_table *new;
  const struct rb_node *x;
  struct rb_node *y;

  ((org != ((void *)0)) ? (void)0 : __assert("rb.c", 781, "org != NULL"));
  new = rb_create (org->rb_compare, org->rb_param,
                    allocator != ((void *)0) ? allocator : org->rb_alloc);
  if (new == ((void *)0))
    return ((void *)0);
# 795 "rb.c"
  if( org->rb_root == ((void *)0) ) return new;




  x = (const struct rb_node *) &org->rb_root;
  y = (struct rb_node *) &new->rb_root;
  for (;;)
    {
      while (x->rb_link[0] != ((void *)0))
        {
          ((height < 2 * (48 + 1)) ? (void)0 : __assert("rb.c", 806, "height < 2 * (RB_MAX_HEIGHT + 1)"));

          y->rb_link[0] =
            new->rb_alloc->libavl_malloc (new->rb_alloc,
                                           sizeof *y->rb_link[0]);
          if (y->rb_link[0] == ((void *)0))
            {
              if (y != (struct rb_node *) &new->rb_root)
                {
                  y->rb_data = ((void *)0);
                  y->rb_link[1] = ((void *)0);
                }

              copy_error_recovery (stack, height, new, destroy);
              return ((void *)0);
            }

          stack[height++] = (struct rb_node *) x;
          stack[height++] = y;
          x = x->rb_link[0];
          y = y->rb_link[0];
        }
      y->rb_link[0] = ((void *)0);

      for (;;)
        {
          y->rb_color = x->rb_color;
          if (copy == ((void *)0))
            y->rb_data = x->rb_data;
          else
            {
              y->rb_data = copy (x->rb_data, org->rb_param);
              if (y->rb_data == ((void *)0))
                {
                  y->rb_link[1] = ((void *)0);
                  copy_error_recovery (stack, height, new, destroy);
                  return ((void *)0);
                }
            }

          if (x->rb_link[1] != ((void *)0))
            {
              y->rb_link[1] =
                new->rb_alloc->libavl_malloc (new->rb_alloc,
                                               sizeof *y->rb_link[1]);
              if (y->rb_link[1] == ((void *)0))
                {
                  copy_error_recovery (stack, height, new, destroy);
                  return ((void *)0);
                }

              x = x->rb_link[1];
              y = y->rb_link[1];
              break;
            }
          else
            y->rb_link[1] = ((void *)0);

          if (height <= 2)
            return new;

          y = stack[--height];
          x = stack[--height];
        }
    }
}



void
rb_destroy (struct rb_table *tree, rb_item_func *destroy)
{
  struct rb_node *p, *q;

  ((tree != ((void *)0)) ? (void)0 : __assert("rb.c", 880, "tree != NULL"));

  for (p = tree->rb_root; p != ((void *)0); p = q)
    if (p->rb_link[0] == ((void *)0))
      {
        q = p->rb_link[1];
        if (destroy != ((void *)0) && p->rb_data != ((void *)0))
          destroy (p->rb_data, tree->rb_param);
        tree->rb_alloc->libavl_free (tree->rb_alloc, p);
      }
    else
      {
        q = p->rb_link[0];
        p->rb_link[0] = q->rb_link[1];
        q->rb_link[1] = p;
      }

  tree->rb_alloc->libavl_free (tree->rb_alloc, tree);
}



void *
rb_malloc (struct libavl_allocator *allocator, size_t size)
{
  ((allocator != ((void *)0) && size > 0) ? (void)0 : __assert("rb.c", 905, "allocator != NULL && size > 0"));
  return malloc (size);
}


void
rb_free (struct libavl_allocator *allocator, void *block)
{
  ((allocator != ((void *)0) && block != ((void *)0)) ? (void)0 : __assert("rb.c", 913, "allocator != NULL && block != NULL"));
  free (block);
}


struct libavl_allocator rb_allocator_default =
  {
    rb_malloc,
    rb_free
  };


# 1 "/usr/include/assert.h" 1 3 4
# 25 "/usr/include/assert.h" 3 4
void __attribute__((__cdecl__)) __assert (const char *, int, const char *);
# 926 "rb.c" 2


void
(rb_assert_insert) (struct rb_table *table, void *item)
{
  void **p = rb_probe (table, item);
  ((p != ((void *)0) && *p == item) ? (void)0 : __assert("rb.c", 932, "p != NULL && *p == item"));
}



void *
(rb_assert_delete) (struct rb_table *table, void *item)
{
  void *p = rb_delete (table, item);
  ((p != ((void *)0)) ? (void)0 : __assert("rb.c", 941, "p != NULL"));
  return p;
}
