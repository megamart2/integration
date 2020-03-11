# 1 "rb.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "rb.c"
# 26 "rb.c"
# 1 "/usr/include/assert.h" 1 3 4
# 42 "/usr/include/assert.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 43 "/usr/include/assert.h" 2 3 4
# 75 "/usr/include/assert.h" 3 4

void __assert_rtn(const char *, const char *, int, const char *) __attribute__((__noreturn__));
void __eprintf(const char *, const char *, unsigned, const char *) __attribute__((__noreturn__));

# 27 "rb.c" 2
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
# 28 "rb.c" 2
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


# 29 "rb.c" 2
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



# 30 "rb.c" 2
# 1 "rb.h" 1
# 29 "rb.h"
# 1 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/stddef.h" 1 3 4
# 152 "/usr/lib/gcc/i686-apple-darwin8/4.0.1/include/stddef.h" 3 4
typedef int ptrdiff_t;
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

  ((void) (__builtin_expect(!(compare != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 42, "compare != NULL"), 0) : 0));

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

  ((void) (__builtin_expect(!(tree != ((void *)0) && item != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 69, "tree != NULL && item != NULL"), 0) : 0));
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

  ((void) (__builtin_expect(!(tree != ((void *)0) && item != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 99, "tree != NULL && item != NULL"), 0) : 0));

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

  ((void) (__builtin_expect(!(tree != ((void *)0) && item != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 244, "tree != NULL && item != NULL"), 0) : 0));

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
  ((void) (__builtin_expect(!(trav != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 440, "trav != NULL"), 0) : 0));

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
          ((void) (__builtin_expect(!(trav->rb_height < 48), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 454, "trav->rb_height < RB_MAX_HEIGHT"), 0) : 0));
          ((void) (__builtin_expect(!(i != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 455, "i != NULL"), 0) : 0));

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

  ((void) (__builtin_expect(!(tree != ((void *)0) && trav != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 482, "tree != NULL && trav != NULL"), 0) : 0));

  trav->rb_table = tree;
  trav->rb_height = 0;
  trav->rb_generation = tree->rb_generation;

  x = tree->rb_root;
  if (x != ((void *)0))
    while (x->rb_link[0] != ((void *)0))
      {
        ((void) (__builtin_expect(!(trav->rb_height < 48), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 492, "trav->rb_height < RB_MAX_HEIGHT"), 0) : 0));
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

  ((void) (__builtin_expect(!(tree != ((void *)0) && trav != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 509, "tree != NULL && trav != NULL"), 0) : 0));

  trav->rb_table = tree;
  trav->rb_height = 0;
  trav->rb_generation = tree->rb_generation;

  x = tree->rb_root;
  if (x != ((void *)0))
    while (x->rb_link[1] != ((void *)0))
      {
        ((void) (__builtin_expect(!(trav->rb_height < 48), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 519, "trav->rb_height < RB_MAX_HEIGHT"), 0) : 0));
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

  ((void) (__builtin_expect(!(trav != ((void *)0) && tree != ((void *)0) && item != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 538, "trav != NULL && tree != NULL && item != NULL"), 0) : 0));
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

      ((void) (__builtin_expect(!(trav->rb_height < 48), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 556, "trav->rb_height < RB_MAX_HEIGHT"), 0) : 0));
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

  ((void) (__builtin_expect(!(trav != ((void *)0) && tree != ((void *)0) && item != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 577, "trav != NULL && tree != NULL && item != NULL"), 0) : 0));

  p = rb_probe (tree, item);
  if (p != ((void *)0))
    {
      trav->rb_table = tree;
      trav->rb_node =
        ((struct rb_node *)
         ((char *) p - __builtin_offsetof (struct rb_node, rb_data)));
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
  ((void) (__builtin_expect(!(trav != ((void *)0) && src != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 600, "trav != NULL && src != NULL"), 0) : 0));

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

  ((void) (__builtin_expect(!(trav != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 626, "trav != NULL"), 0) : 0));

  if (trav->rb_generation != trav->rb_table->rb_generation)
    trav_refresh (trav);

  x = trav->rb_node;
  if (x == ((void *)0))
    {
      return rb_t_first (trav, trav->rb_table);
    }
  else if (x->rb_link[1] != ((void *)0))
    {
      ((void) (__builtin_expect(!(trav->rb_height < 48), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 638, "trav->rb_height < RB_MAX_HEIGHT"), 0) : 0));
      trav->rb_stack[trav->rb_height++] = x;
      x = x->rb_link[1];

      while (x->rb_link[0] != ((void *)0))
        {
          ((void) (__builtin_expect(!(trav->rb_height < 48), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 644, "trav->rb_height < RB_MAX_HEIGHT"), 0) : 0));
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

  ((void) (__builtin_expect(!(trav != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 679, "trav != NULL"), 0) : 0));

  if (trav->rb_generation != trav->rb_table->rb_generation)
    trav_refresh (trav);

  x = trav->rb_node;
  if (x == ((void *)0))
    {
      return rb_t_last (trav, trav->rb_table);
    }
  else if (x->rb_link[0] != ((void *)0))
    {
      ((void) (__builtin_expect(!(trav->rb_height < 48), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 691, "trav->rb_height < RB_MAX_HEIGHT"), 0) : 0));
      trav->rb_stack[trav->rb_height++] = x;
      x = x->rb_link[0];

      while (x->rb_link[1] != ((void *)0))
        {
          ((void) (__builtin_expect(!(trav->rb_height < 48), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 697, "trav->rb_height < RB_MAX_HEIGHT"), 0) : 0));
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
  ((void) (__builtin_expect(!(trav != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 728, "trav != NULL"), 0) : 0));

  return trav->rb_node != ((void *)0) ? trav->rb_node->rb_data : ((void *)0);
}




void *
rb_t_replace (struct rb_traverser *trav, void *new)
{
  void *old;

  ((void) (__builtin_expect(!(trav != ((void *)0) && trav->rb_node != ((void *)0) && new != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 741, "trav != NULL && trav->rb_node != NULL && new != NULL"), 0) : 0));
  old = trav->rb_node->rb_data;
  trav->rb_node->rb_data = new;
  return old;
}




static void
copy_error_recovery (struct rb_node **stack, int height,
                     struct rb_table *new, rb_item_func *destroy)
{
  ((void) (__builtin_expect(!(stack != ((void *)0) && height >= 0 && new != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 754, "stack != NULL && height >= 0 && new != NULL"), 0) : 0));

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

  ((void) (__builtin_expect(!(org != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 781, "org != NULL"), 0) : 0));
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
          ((void) (__builtin_expect(!(height < 2 * (48 + 1)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 806, "height < 2 * (RB_MAX_HEIGHT + 1)"), 0) : 0));

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

  ((void) (__builtin_expect(!(tree != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 880, "tree != NULL"), 0) : 0));

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
  ((void) (__builtin_expect(!(allocator != ((void *)0) && size > 0), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 905, "allocator != NULL && size > 0"), 0) : 0));
  return malloc (size);
}


void
rb_free (struct libavl_allocator *allocator, void *block)
{
  ((void) (__builtin_expect(!(allocator != ((void *)0) && block != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 913, "allocator != NULL && block != NULL"), 0) : 0));
  free (block);
}


struct libavl_allocator rb_allocator_default =
  {
    rb_malloc,
    rb_free
  };


# 1 "/usr/include/assert.h" 1 3 4
# 75 "/usr/include/assert.h" 3 4

void __assert_rtn(const char *, const char *, int, const char *) __attribute__((__noreturn__));
void __eprintf(const char *, const char *, unsigned, const char *) __attribute__((__noreturn__));

# 926 "rb.c" 2


void
(rb_assert_insert) (struct rb_table *table, void *item)
{
  void **p = rb_probe (table, item);
  ((void) (__builtin_expect(!(p != ((void *)0) && *p == item), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 932, "p != NULL && *p == item"), 0) : 0));
}



void *
(rb_assert_delete) (struct rb_table *table, void *item)
{
  void *p = rb_delete (table, item);
  ((void) (__builtin_expect(!(p != ((void *)0)), 0) ? (__eprintf ("%s:%u: failed assertion `%s'\n", "rb.c", 941, "p != NULL"), 0) : 0));
  return p;
}
