# 1 "test.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "test.c"
# 26 "test.c"
# 1 "/usr/include/assert.h" 1 3 4
# 42 "/usr/include/assert.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 43 "/usr/include/assert.h" 2 3 4
# 75 "/usr/include/assert.h" 3 4

void __assert_rtn(const char *, const char *, int, const char *) __attribute__((__noreturn__));
void __eprintf(const char *, const char *, unsigned, const char *) __attribute__((__noreturn__));

# 27 "test.c" 2
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
# 28 "test.c" 2
# 1 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/stdarg.h" 1 3 4
# 43 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 105 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 29 "test.c" 2
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
# 76 "/usr/include/stdio.h" 3 4
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
# 30 "test.c" 2
# 1 "/usr/include/stdlib.h" 1 3 4
# 64 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/sys/wait.h" 1 3 4
# 73 "/usr/include/sys/wait.h" 3 4
typedef enum {
 P_ALL,
 P_PID,
 P_PGID
} idtype_t;






typedef __darwin_pid_t pid_t;




typedef __darwin_id_t id_t;
# 110 "/usr/include/sys/wait.h" 3 4
# 1 "/usr/include/sys/signal.h" 1 3 4
# 67 "/usr/include/sys/signal.h" 3 4
# 1 "/usr/include/sys/appleapiopts.h" 1 3 4
# 68 "/usr/include/sys/signal.h" 2 3 4





# 1 "/usr/include/machine/signal.h" 1 3 4
# 29 "/usr/include/machine/signal.h" 3 4
# 1 "/usr/include/i386/signal.h" 1 3 4
# 31 "/usr/include/i386/signal.h" 3 4
typedef int sig_atomic_t;
# 46 "/usr/include/i386/signal.h" 3 4
struct sigcontext {
    int sc_onstack;
    int sc_mask;
    unsigned int sc_eax;
    unsigned int sc_ebx;
    unsigned int sc_ecx;
    unsigned int sc_edx;
    unsigned int sc_edi;
    unsigned int sc_esi;
    unsigned int sc_ebp;
    unsigned int sc_esp;
    unsigned int sc_ss;
    unsigned int sc_eflags;
    unsigned int sc_eip;
    unsigned int sc_cs;
    unsigned int sc_ds;
    unsigned int sc_es;
    unsigned int sc_fs;
    unsigned int sc_gs;
};
# 30 "/usr/include/machine/signal.h" 2 3 4
# 74 "/usr/include/sys/signal.h" 2 3 4
# 139 "/usr/include/sys/signal.h" 3 4
typedef __darwin_mcontext_t mcontext_t;





typedef __darwin_mcontext64_t mcontext64_t;
# 156 "/usr/include/sys/signal.h" 3 4
typedef __darwin_pthread_attr_t pthread_attr_t;




typedef __darwin_sigset_t sigset_t;
# 171 "/usr/include/sys/signal.h" 3 4
typedef __darwin_ucontext_t ucontext_t;





typedef __darwin_ucontext64_t ucontext64_t;





typedef __darwin_uid_t uid_t;


union sigval {

 int sival_int;
 void *sival_ptr;
};





struct sigevent {
 int sigev_notify;
 int sigev_signo;
 union sigval sigev_value;
 void (*sigev_notify_function)(union sigval);
 pthread_attr_t *sigev_notify_attributes;
};



typedef struct __siginfo {
 int si_signo;
 int si_errno;
 int si_code;
 pid_t si_pid;
 uid_t si_uid;
 int si_status;
 void *si_addr;
 union sigval si_value;
 long si_band;
 unsigned long pad[7];
} siginfo_t;
# 297 "/usr/include/sys/signal.h" 3 4
union __sigaction_u {
 void (*__sa_handler)(int);
 void (*__sa_sigaction)(int, struct __siginfo *,
         void *);
};


struct __sigaction {
 union __sigaction_u __sigaction_u;
 void (*sa_tramp)(void *, int, int, siginfo_t *, void *);
 sigset_t sa_mask;
 int sa_flags;
};




struct sigaction {
 union __sigaction_u __sigaction_u;
 sigset_t sa_mask;
 int sa_flags;
};
# 355 "/usr/include/sys/signal.h" 3 4
typedef void (*sig_t)(int);
# 364 "/usr/include/sys/signal.h" 3 4
typedef __darwin_stack_t stack_t;
# 377 "/usr/include/sys/signal.h" 3 4
struct sigvec {
 void (*sv_handler)(int);
 int sv_mask;
 int sv_flags;
};
# 396 "/usr/include/sys/signal.h" 3 4
struct sigstack {
 char *ss_sp;
 int ss_onstack;
};
# 418 "/usr/include/sys/signal.h" 3 4

void (*signal(int, void (*)(int)))(int);

# 111 "/usr/include/sys/wait.h" 2 3 4
# 1 "/usr/include/sys/resource.h" 1 3 4
# 74 "/usr/include/sys/resource.h" 3 4
struct timeval {
 __darwin_time_t tv_sec;
 __darwin_suseconds_t tv_usec;
};
# 90 "/usr/include/sys/resource.h" 3 4
typedef __int64_t rlim_t;
# 135 "/usr/include/sys/resource.h" 3 4
struct rusage {
 struct timeval ru_utime;
 struct timeval ru_stime;
# 146 "/usr/include/sys/resource.h" 3 4
 long ru_maxrss;

 long ru_ixrss;
 long ru_idrss;
 long ru_isrss;
 long ru_minflt;
 long ru_majflt;
 long ru_nswap;
 long ru_inblock;
 long ru_oublock;
 long ru_msgsnd;
 long ru_msgrcv;
 long ru_nsignals;
 long ru_nvcsw;
 long ru_nivcsw;


};
# 207 "/usr/include/sys/resource.h" 3 4
struct rlimit {
 rlim_t rlim_cur;
 rlim_t rlim_max;
};




int getpriority(int, id_t);
int getrlimit(int, struct rlimit *);
int getrusage(int, struct rusage *);
int setpriority(int, id_t, int);
int setrlimit(int, const struct rlimit *);

# 112 "/usr/include/sys/wait.h" 2 3 4
# 182 "/usr/include/sys/wait.h" 3 4
# 1 "/usr/include/machine/endian.h" 1 3 4
# 32 "/usr/include/machine/endian.h" 3 4
# 1 "/usr/include/i386/endian.h" 1 3 4
# 92 "/usr/include/i386/endian.h" 3 4
# 1 "/usr/include/sys/_endian.h" 1 3 4
# 88 "/usr/include/sys/_endian.h" 3 4
# 1 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/stdint.h" 1 3 4
# 14 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/stdint.h" 3 4
typedef signed char int8_t;




typedef short int16_t;




typedef int int32_t;




typedef long long int64_t;




typedef unsigned char uint8_t;




typedef unsigned short uint16_t;




typedef unsigned int uint32_t;




typedef unsigned long long uint64_t;



typedef int8_t int_least8_t;
typedef int16_t int_least16_t;
typedef int32_t int_least32_t;
typedef int64_t int_least64_t;
typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;
typedef uint32_t uint_least32_t;
typedef uint64_t uint_least64_t;



typedef int8_t int_fast8_t;
typedef int16_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef int64_t int_fast64_t;
typedef uint8_t uint_fast8_t;
typedef uint16_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
typedef uint64_t uint_fast64_t;






typedef long intptr_t;




typedef unsigned long uintptr_t;







typedef long long int intmax_t;
# 100 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/stdint.h" 3 4
typedef long long unsigned int uintmax_t;
# 89 "/usr/include/sys/_endian.h" 2 3 4
# 1 "/usr/include/libkern/OSByteOrder.h" 1 3 4
# 54 "/usr/include/libkern/OSByteOrder.h" 3 4
# 1 "/usr/include/libkern/i386/OSByteOrder.h" 1 3 4
# 40 "/usr/include/libkern/i386/OSByteOrder.h" 3 4
static __inline__
uint16_t
_OSSwapInt16(
    uint16_t data
)
{
    return ((data << 8) | (data >> 8));
}

static __inline__
uint32_t
_OSSwapInt32(
    uint32_t data
)
{
    __asm__ ("bswap   %0" : "+r" (data));
    return data;
}


static __inline__
uint64_t
_OSSwapInt64(
    uint64_t data
)
{
    __asm__ ("bswap   %%eax\n\t"
             "bswap   %%edx\n\t"
             "xchgl   %%eax, %%edx"
             : "+A" (data));
    return data;
}
# 88 "/usr/include/libkern/i386/OSByteOrder.h" 3 4
static __inline__
uint16_t
OSReadSwapInt16(
    const volatile void * base,
    uintptr_t byteOffset
)
{
    uint16_t result;

    result = *(volatile uint16_t *)((uintptr_t)base + byteOffset);
    return _OSSwapInt16(result);
}

static __inline__
uint32_t
OSReadSwapInt32(
    const volatile void * base,
    uintptr_t byteOffset
)
{
    uint32_t result;

    result = *(volatile uint32_t *)((uintptr_t)base + byteOffset);
    return _OSSwapInt32(result);
}

static __inline__
uint64_t
OSReadSwapInt64(
    const volatile void * base,
    uintptr_t byteOffset
)
{
    uint64_t result;

    result = *(volatile uint64_t *)((uintptr_t)base + byteOffset);
    return _OSSwapInt64(result);
}



static __inline__
void
OSWriteSwapInt16(
    volatile void * base,
    uintptr_t byteOffset,
    uint16_t data
)
{
    *(volatile uint16_t *)((uintptr_t)base + byteOffset) = _OSSwapInt16(data);
}

static __inline__
void
OSWriteSwapInt32(
    volatile void * base,
    uintptr_t byteOffset,
    uint32_t data
)
{
    *(volatile uint32_t *)((uintptr_t)base + byteOffset) = _OSSwapInt32(data);
}

static __inline__
void
OSWriteSwapInt64(
    volatile void * base,
    uintptr_t byteOffset,
    uint64_t data
)
{
    *(volatile uint64_t *)((uintptr_t)base + byteOffset) = _OSSwapInt64(data);
}
# 55 "/usr/include/libkern/OSByteOrder.h" 2 3 4
# 80 "/usr/include/libkern/OSByteOrder.h" 3 4
enum {
    OSUnknownByteOrder,
    OSLittleEndian,
    OSBigEndian
};

static __inline__
int32_t
OSHostByteOrder(void) {

    return OSLittleEndian;





}
# 109 "/usr/include/libkern/OSByteOrder.h" 3 4
static __inline__
uint16_t
_OSReadInt16(
    const volatile void * base,
    uintptr_t byteOffset
)
{
    return *(volatile uint16_t *)((uintptr_t)base + byteOffset);
}

static __inline__
uint32_t
_OSReadInt32(
    const volatile void * base,
    uintptr_t byteOffset
)
{
    return *(volatile uint32_t *)((uintptr_t)base + byteOffset);
}

static __inline__
uint64_t
_OSReadInt64(
    const volatile void * base,
    uintptr_t byteOffset
)
{
    return *(volatile uint64_t *)((uintptr_t)base + byteOffset);
}



static __inline__
void
_OSWriteInt16(
    volatile void * base,
    uintptr_t byteOffset,
    uint16_t data
)
{
    *(volatile uint16_t *)((uintptr_t)base + byteOffset) = data;
}

static __inline__
void
_OSWriteInt32(
    volatile void * base,
    uintptr_t byteOffset,
    uint32_t data
)
{
    *(volatile uint32_t *)((uintptr_t)base + byteOffset) = data;
}

static __inline__
void
_OSWriteInt64(
    volatile void * base,
    uintptr_t byteOffset,
    uint64_t data
)
{
    *(volatile uint64_t *)((uintptr_t)base + byteOffset) = data;
}
# 90 "/usr/include/sys/_endian.h" 2 3 4


uint16_t ntohs(uint16_t);
uint16_t htons(uint16_t);
uint32_t ntohl(uint32_t);
uint32_t htonl(uint32_t);

# 93 "/usr/include/i386/endian.h" 2 3 4
# 33 "/usr/include/machine/endian.h" 2 3 4
# 183 "/usr/include/sys/wait.h" 2 3 4







union wait {
 int w_status;



 struct {

  unsigned int w_Termsig:7,
    w_Coredump:1,
    w_Retcode:8,
    w_Filler:16;







 } w_T;





 struct {

  unsigned int w_Stopval:8,
    w_Stopsig:8,
    w_Filler:16;






 } w_S;
};
# 240 "/usr/include/sys/wait.h" 3 4

pid_t wait(int *);
pid_t waitpid(pid_t, int *, int);

int waitid(idtype_t, id_t, siginfo_t *, int);


pid_t wait3(int *, int, struct rusage *);
pid_t wait4(pid_t, int *, int, struct rusage *);


# 65 "/usr/include/stdlib.h" 2 3 4

# 1 "/usr/include/alloca.h" 1 3 4
# 35 "/usr/include/alloca.h" 3 4

void *alloca(size_t);

# 67 "/usr/include/stdlib.h" 2 3 4
# 80 "/usr/include/stdlib.h" 3 4
typedef __darwin_ct_rune_t ct_rune_t;




typedef __darwin_rune_t rune_t;






typedef __darwin_wchar_t wchar_t;



typedef struct {
 int quot;
 int rem;
} div_t;

typedef struct {
 long quot;
 long rem;
} ldiv_t;


typedef struct {
 long long quot;
 long long rem;
} lldiv_t;
# 133 "/usr/include/stdlib.h" 3 4
extern int __mb_cur_max;
# 143 "/usr/include/stdlib.h" 3 4

void abort(void) __attribute__((__noreturn__));
int abs(int) __attribute__((__const__));
int atexit(void (*)(void));
double atof(const char *);
int atoi(const char *);
long atol(const char *);

long long
  atoll(const char *);

void *bsearch(const void *, const void *, size_t,
     size_t, int (*)(const void *, const void *));
void *calloc(size_t, size_t);
div_t div(int, int) __attribute__((__const__));
void exit(int) __attribute__((__noreturn__));
void free(void *);
char *getenv(const char *);
long labs(long) __attribute__((__const__));
ldiv_t ldiv(long, long) __attribute__((__const__));

long long
  llabs(long long);
lldiv_t lldiv(long long, long long);

void *malloc(size_t);
int mblen(const char *, size_t);
size_t mbstowcs(wchar_t * , const char * , size_t);
int mbtowc(wchar_t * , const char * , size_t);
void qsort(void *, size_t, size_t,
     int (*)(const void *, const void *));
int rand(void);
void *realloc(void *, size_t);
void srand(unsigned);
double strtod(const char *, char **);
float strtof(const char *, char **);
long strtol(const char *, char **, int);
long double
  strtold(const char *, char **) ;

long long
  strtoll(const char *, char **, int);

unsigned long
  strtoul(const char *, char **, int);

unsigned long long
  strtoull(const char *, char **, int);

int system(const char *);
size_t wcstombs(char * , const wchar_t * , size_t);
int wctomb(char *, wchar_t);


void _Exit(int) __attribute__((__noreturn__));
long a64l(const char *);
double drand48(void);
char *ecvt(double, int, int *, int *);
double erand48(unsigned short[3]);
char *fcvt(double, int, int *, int *);
char *gcvt(double, int, char *);
int getsubopt(char **, char * const *, char **);
int grantpt(int);



char *initstate(unsigned long, char *, long);

long jrand48(unsigned short[3]);
char *l64a(long);
void lcong48(unsigned short[7]);
long lrand48(void);
char *mktemp(char *);
int mkstemp(char *);
long mrand48(void);
long nrand48(unsigned short[3]);
int posix_openpt(int);
char *ptsname(int);
int putenv(char *) ;
long random(void);
char *realpath(const char *, char *resolved_path);
unsigned short
 *seed48(unsigned short[3]);
int setenv(const char *, const char *, int) ;



int setkey(const char *);

char *setstate(const char *);
void srand48(long);



void srandom(unsigned long);

int unlockpt(int);



void unsetenv(const char *);




# 1 "/usr/include/machine/types.h" 1 3 4
# 32 "/usr/include/machine/types.h" 3 4
# 1 "/usr/include/i386/types.h" 1 3 4
# 74 "/usr/include/i386/types.h" 3 4
typedef unsigned char u_int8_t;




typedef unsigned short u_int16_t;




typedef unsigned int u_int32_t;




typedef unsigned long long u_int64_t;




typedef int32_t register_t;
# 109 "/usr/include/i386/types.h" 3 4
typedef u_int64_t user_addr_t;
typedef u_int64_t user_size_t;
typedef int64_t user_ssize_t;
typedef int64_t user_long_t;
typedef u_int64_t user_ulong_t;
typedef int64_t user_time_t;




typedef u_int64_t syscall_arg_t;
# 33 "/usr/include/machine/types.h" 2 3 4
# 249 "/usr/include/stdlib.h" 2 3 4


typedef __darwin_dev_t dev_t;




typedef __darwin_mode_t mode_t;



u_int32_t
  arc4random(void);
void arc4random_addrandom(unsigned char *dat, int datlen);
void arc4random_stir(void);


char *cgetcap(char *, const char *, int);
int cgetclose(void);
int cgetent(char **, char **, const char *);
int cgetfirst(char **, char **);
int cgetmatch(const char *, const char *);
int cgetnext(char **, char **);
int cgetnum(char *, const char *, long *);
int cgetset(const char *);
int cgetstr(char *, const char *, char **);
int cgetustr(char *, const char *, char **);

int daemon(int, int);
char *devname(dev_t, mode_t);
char *devname_r(dev_t, mode_t, char *buf, int len);
char *getbsize(int *, long *);
int getloadavg(double [], int);
const char
 *getprogname(void);

int heapsort(void *, size_t, size_t,
     int (*)(const void *, const void *));
int mergesort(void *, size_t, size_t,
     int (*)(const void *, const void *));
void qsort_r(void *, size_t, size_t, void *,
     int (*)(void *, const void *, const void *));
int radixsort(const unsigned char **, int, const unsigned char *,
     unsigned);
void setprogname(const char *);
int sradixsort(const unsigned char **, int, const unsigned char *,
     unsigned);
void sranddev(void);
void srandomdev(void);
int rand_r(unsigned *);
void *reallocf(void *, size_t);

long long
  strtoq(const char *, char **, int);
unsigned long long
  strtouq(const char *, char **, int);

extern char *suboptarg;
void *valloc(size_t);


# 31 "test.c" 2
# 1 "/usr/include/string.h" 1 3 4
# 70 "/usr/include/string.h" 3 4
typedef __darwin_ssize_t ssize_t;
# 80 "/usr/include/string.h" 3 4

void *memchr(const void *, int, size_t);
int memcmp(const void *, const void *, size_t);
void *memcpy(void *, const void *, size_t);
void *memmove(void *, const void *, size_t);
void *memset(void *, int, size_t);

char *stpcpy(char *, const char *);
char *strcasestr(const char *, const char *);

char *strcat(char *, const char *);
char *strchr(const char *, int);
int strcmp(const char *, const char *);
int strcoll(const char *, const char *);
char *strcpy(char *, const char *);
size_t strcspn(const char *, const char *);
char *strerror(int);
int strerror_r(int, char *, size_t);
size_t strlen(const char *);
char *strncat(char *, const char *, size_t);
int strncmp(const char *, const char *, size_t);
char *strncpy(char *, const char *, size_t);

char *strnstr(const char *, const char *, size_t);

char *strpbrk(const char *, const char *);
char *strrchr(const char *, int);
size_t strspn(const char *, const char *);
char *strstr(const char *, const char *);
char *strtok(char *, const char *);
size_t strxfrm(char *, const char *, size_t);



void *memccpy(void *, const void *, int, size_t);
char *strtok_r(char *, const char *, char **);
char *strdup(const char *);

int bcmp(const void *, const void *, size_t);
void bcopy(const void *, void *, size_t);
void bzero(void *, size_t);
int ffs(int);
char *index(const char *, int);
char *rindex(const char *, int);
int strcasecmp(const char *, const char *);
size_t strlcat(char *, const char *, size_t);
size_t strlcpy(char *, const char *, size_t);
void strmode(int, char *);
int strncasecmp(const char *, const char *, size_t);
char *strsep(char **, const char *);
char *strsignal(int sig);
void swab(const void * , void * , ssize_t);



# 32 "test.c" 2
# 1 "/usr/include/time.h" 1 3 4
# 74 "/usr/include/time.h" 3 4
typedef __darwin_clock_t clock_t;
# 84 "/usr/include/time.h" 3 4
typedef __darwin_time_t time_t;




struct timespec {
        time_t tv_sec;
        long tv_nsec;
};


struct tm {
 int tm_sec;
 int tm_min;
 int tm_hour;
 int tm_mday;
 int tm_mon;
 int tm_year;
 int tm_wday;
 int tm_yday;
 int tm_isdst;
 long tm_gmtoff;
 char *tm_zone;
};

# 1 "/usr/include/machine/_limits.h" 1 3 4
# 110 "/usr/include/time.h" 2 3 4






extern char *tzname[];


extern int getdate_err;



extern int daylight;


char *asctime(const struct tm *);
clock_t clock(void);
char *ctime(const time_t *);
double difftime(time_t, time_t);
struct tm *getdate(const char *);
struct tm *gmtime(const time_t *);
struct tm *localtime(const time_t *);
time_t mktime(struct tm *);
size_t strftime(char * , size_t, const char * , const struct tm * ) ;
char *strptime(const char * , const char * , struct tm * );
time_t time(time_t *);


void tzset(void);



char *asctime_r(const struct tm *, char *);
char *ctime_r(const time_t *, char *);
struct tm *gmtime_r(const time_t *, struct tm *);
struct tm *localtime_r(const time_t *, struct tm *);
time_t posix2time(time_t);

char *timezone(int, int);

void tzsetwall(void);
time_t time2posix(time_t);
time_t timelocal(struct tm * const);
time_t timegm(struct tm * const);



int nanosleep(const struct timespec *, struct timespec *) ;


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

  fprintf ((&__sF[2]), "%s: ", pgm_name);

  __builtin_va_start(args,message);
  vfprintf ((&__sF[2]), message, args);
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
  ((void) (__builtin_expect(!(mt != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "test.c", 226, "mt != NULL"), 0) : 0));

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
      ((void) (__builtin_expect(!(0), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "test.c", 358, "0"), 0) : 0));
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

  ((void) (__builtin_expect(!(options != ((void *)0) && args != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "test.c", 428, "options != NULL && args != NULL"), 0) : 0));

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

  ((void) (__builtin_expect(!(state != ((void *)0) && state->short_next != ((void *)0) && *state->short_next != '\0' && state->options != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "test.c", 449, "state != NULL && state->short_next != NULL && *state->short_next != '\\0' && state->options != NULL"), 0) : 0));




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

  ((void) (__builtin_expect(!(state != ((void *)0) && state->arg_next != ((void *)0) && *state->arg_next != ((void *)0) && state->options != ((void *)0) && argp != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "test.c", 485, "state != NULL && state->arg_next != NULL && *state->arg_next != NULL && state->options != NULL && argp != NULL"), 0) : 0));






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
  ((void) (__builtin_expect(!(state != ((void *)0) && argp != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "test.c", 530, "state != NULL && argp != NULL"), 0) : 0));


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

            ((void) (__builtin_expect(!(sizeof orders / sizeof *orders == INS_CNT), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "test.c", 724, "sizeof orders / sizeof *orders == INS_CNT"), 0) : 0));
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

            ((void) (__builtin_expect(!(sizeof orders / sizeof *orders == DEL_CNT), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "test.c", 745, "sizeof orders / sizeof *orders == DEL_CNT"), 0) : 0));
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
                 (&__sF[1]));
          exit (0);

        default:
          ((void) (__builtin_expect(!(0), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "test.c", 844, "0"), 0) : 0));
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
      ((void) (__builtin_expect(!(0), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "test.c", 938, "0"), 0) : 0));
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
      ((void) (__builtin_expect(!(0), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "test.c", 973, "0"), 0) : 0));
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
    fputs ("bst-test for GNU libavl 2.0.2; use --help to get help.\n", (&__sF[1]));

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
          fflush ((&__sF[1]));
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
            ((void) (__builtin_expect(!(0), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "test.c", 1083, "0"), 0) : 0));
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
