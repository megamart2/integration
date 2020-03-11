# 1 "init/main.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "include/linux/autoconf.h" 1
# 2 "<command line>" 2
# 1 "init/main.c"
# 12 "init/main.c"
# 1 "include/linux/types.h" 1
# 14 "include/linux/types.h"
# 1 "include/linux/posix_types.h" 1



# 1 "include/linux/stddef.h" 1



# 1 "include/linux/compiler.h" 1
# 44 "include/linux/compiler.h"
# 1 "include/linux/compiler-gcc3.h" 1



# 1 "include/linux/compiler-gcc.h" 1
# 5 "include/linux/compiler-gcc3.h" 2
# 45 "include/linux/compiler.h" 2
# 5 "include/linux/stddef.h" 2
# 15 "include/linux/stddef.h"
enum {
        false = 0,
        true = 1
};
# 5 "include/linux/posix_types.h" 2
# 36 "include/linux/posix_types.h"
typedef struct {
        unsigned long fds_bits [(1024/(8 * sizeof(unsigned long)))];
} __kernel_fd_set;


typedef void (*__kernel_sighandler_t)(int);


typedef int __kernel_key_t;
typedef int __kernel_mqd_t;

# 1 "include/asm/posix_types.h" 1
# 10 "include/asm/posix_types.h"
typedef unsigned long __kernel_ino_t;
typedef unsigned short __kernel_mode_t;
typedef unsigned short __kernel_nlink_t;
typedef long __kernel_off_t;
typedef int __kernel_pid_t;
typedef unsigned short __kernel_ipc_pid_t;
typedef unsigned short __kernel_uid_t;
typedef unsigned short __kernel_gid_t;
typedef unsigned int __kernel_size_t;
typedef int __kernel_ssize_t;
typedef int __kernel_ptrdiff_t;
typedef long __kernel_time_t;
typedef long __kernel_suseconds_t;
typedef long __kernel_clock_t;
typedef int __kernel_timer_t;
typedef int __kernel_clockid_t;
typedef int __kernel_daddr_t;
typedef char * __kernel_caddr_t;
typedef unsigned short __kernel_uid16_t;
typedef unsigned short __kernel_gid16_t;
typedef unsigned int __kernel_uid32_t;
typedef unsigned int __kernel_gid32_t;

typedef unsigned short __kernel_old_uid_t;
typedef unsigned short __kernel_old_gid_t;
typedef unsigned short __kernel_old_dev_t;


typedef long long __kernel_loff_t;


typedef struct {

        int val[2];



} __kernel_fsid_t;
# 48 "include/linux/posix_types.h" 2
# 15 "include/linux/types.h" 2
# 1 "include/asm/types.h" 1





typedef unsigned short umode_t;






typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;


typedef __signed__ long long __s64;
typedef unsigned long long __u64;
# 39 "include/asm/types.h"
typedef signed char s8;
typedef unsigned char u8;

typedef signed short s16;
typedef unsigned short u16;

typedef signed int s32;
typedef unsigned int u32;

typedef signed long long s64;
typedef unsigned long long u64;






typedef u32 dma_addr_t;

typedef u64 dma64_addr_t;
# 16 "include/linux/types.h" 2



typedef __u32 __kernel_dev_t;

typedef __kernel_fd_set fd_set;
typedef __kernel_dev_t dev_t;
typedef __kernel_ino_t ino_t;
typedef __kernel_mode_t mode_t;
typedef __kernel_nlink_t nlink_t;
typedef __kernel_off_t off_t;
typedef __kernel_pid_t pid_t;
typedef __kernel_daddr_t daddr_t;
typedef __kernel_key_t key_t;
typedef __kernel_suseconds_t suseconds_t;
typedef __kernel_timer_t timer_t;
typedef __kernel_clockid_t clockid_t;
typedef __kernel_mqd_t mqd_t;


typedef _Bool bool;

typedef __kernel_uid32_t uid_t;
typedef __kernel_gid32_t gid_t;
typedef __kernel_uid16_t uid16_t;
typedef __kernel_gid16_t gid16_t;



typedef __kernel_old_uid_t old_uid_t;
typedef __kernel_old_gid_t old_gid_t;
# 58 "include/linux/types.h"
typedef __kernel_loff_t loff_t;
# 67 "include/linux/types.h"
typedef __kernel_size_t size_t;




typedef __kernel_ssize_t ssize_t;




typedef __kernel_ptrdiff_t ptrdiff_t;




typedef __kernel_time_t time_t;




typedef __kernel_clock_t clock_t;




typedef __kernel_caddr_t caddr_t;



typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;


typedef unsigned char unchar;
typedef unsigned short ushort;
typedef unsigned int uint;
typedef unsigned long ulong;




typedef __u8 u_int8_t;
typedef __s8 int8_t;
typedef __u16 u_int16_t;
typedef __s16 int16_t;
typedef __u32 u_int32_t;
typedef __s32 int32_t;



typedef __u8 uint8_t;
typedef __u16 uint16_t;
typedef __u32 uint32_t;


typedef __u64 uint64_t;
typedef __u64 u_int64_t;
typedef __s64 int64_t;
# 141 "include/linux/types.h"
typedef u64 sector_t;
# 152 "include/linux/types.h"
typedef unsigned long blkcnt_t;
# 181 "include/linux/types.h"
typedef __u16 __le16;
typedef __u16 __be16;
typedef __u32 __le32;
typedef __u32 __be32;

typedef __u64 __le64;
typedef __u64 __be64;

typedef __u16 __sum16;
typedef __u32 __wsum;


typedef unsigned gfp_t;


typedef u64 resource_size_t;






struct ustat {
        __kernel_daddr_t f_tfree;
        __kernel_ino_t f_tinode;
        char f_fname[6];
        char f_fpack[6];
};
# 13 "init/main.c" 2
# 1 "include/linux/module.h" 1
# 9 "include/linux/module.h"
# 1 "include/linux/spinlock.h" 1
# 49 "include/linux/spinlock.h"
# 1 "include/linux/preempt.h" 1
# 9 "include/linux/preempt.h"
# 1 "include/linux/thread_info.h" 1
# 13 "include/linux/thread_info.h"
struct restart_block {
        long (*fn)(struct restart_block *);
        unsigned long arg0, arg1, arg2, arg3;
};

extern long do_no_restart_syscall(struct restart_block *parm);

# 1 "include/linux/bitops.h" 1
# 9 "include/linux/bitops.h"
# 1 "include/asm/bitops.h" 1
# 9 "include/asm/bitops.h"
# 1 "include/asm/alternative.h" 1
# 10 "include/asm/alternative.h"
struct alt_instr {
        u8 *instr;
        u8 *replacement;
        u8 cpuid;
        u8 instrlen;
        u8 replacementlen;
        u8 pad;
};

extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end);

struct module;

extern void alternatives_smp_module_add(struct module *mod, char *name,
                                        void *locks, void *locks_end,
                                        void *text, void *text_end);
extern void alternatives_smp_module_del(struct module *mod);
extern void alternatives_smp_switch(int smp);
# 121 "include/asm/alternative.h"
struct paravirt_patch;



static inline __attribute__((always_inline)) void
apply_paravirt(struct paravirt_patch *start, struct paravirt_patch *end)
{}
# 10 "include/asm/bitops.h" 2
# 36 "include/asm/bitops.h"
static inline __attribute__((always_inline)) void set_bit(int nr, volatile unsigned long * addr)
{
        __asm__ __volatile__( ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; "
                "btsl %1,%0"
                :"+m" ((*(volatile long *) addr))
                :"Ir" (nr));
}
# 53 "include/asm/bitops.h"
static inline __attribute__((always_inline)) void __set_bit(int nr, volatile unsigned long * addr)
{
        __asm__(
                "btsl %1,%0"
                :"+m" ((*(volatile long *) addr))
                :"Ir" (nr));
}
# 71 "include/asm/bitops.h"
static inline __attribute__((always_inline)) void clear_bit(int nr, volatile unsigned long * addr)
{
        __asm__ __volatile__( ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; "
                "btrl %1,%0"
                :"+m" ((*(volatile long *) addr))
                :"Ir" (nr));
}

static inline __attribute__((always_inline)) void __clear_bit(int nr, volatile unsigned long * addr)
{
        __asm__ __volatile__(
                "btrl %1,%0"
                :"+m" ((*(volatile long *) addr))
                :"Ir" (nr));
}
# 98 "include/asm/bitops.h"
static inline __attribute__((always_inline)) void __change_bit(int nr, volatile unsigned long * addr)
{
        __asm__ __volatile__(
                "btcl %1,%0"
                :"+m" ((*(volatile long *) addr))
                :"Ir" (nr));
}
# 116 "include/asm/bitops.h"
static inline __attribute__((always_inline)) void change_bit(int nr, volatile unsigned long * addr)
{
        __asm__ __volatile__( ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; "
                "btcl %1,%0"
                :"+m" ((*(volatile long *) addr))
                :"Ir" (nr));
}
# 133 "include/asm/bitops.h"
static inline __attribute__((always_inline)) int test_and_set_bit(int nr, volatile unsigned long * addr)
{
        int oldbit;

        __asm__ __volatile__( ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; "
                "btsl %2,%1\n\tsbbl %0,%0"
                :"=r" (oldbit),"+m" ((*(volatile long *) addr))
                :"Ir" (nr) : "memory");
        return oldbit;
}
# 153 "include/asm/bitops.h"
static inline __attribute__((always_inline)) int __test_and_set_bit(int nr, volatile unsigned long * addr)
{
        int oldbit;

        __asm__(
                "btsl %2,%1\n\tsbbl %0,%0"
                :"=r" (oldbit),"+m" ((*(volatile long *) addr))
                :"Ir" (nr));
        return oldbit;
}
# 173 "include/asm/bitops.h"
static inline __attribute__((always_inline)) int test_and_clear_bit(int nr, volatile unsigned long * addr)
{
        int oldbit;

        __asm__ __volatile__( ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; "
                "btrl %2,%1\n\tsbbl %0,%0"
                :"=r" (oldbit),"+m" ((*(volatile long *) addr))
                :"Ir" (nr) : "memory");
        return oldbit;
}
# 193 "include/asm/bitops.h"
static inline __attribute__((always_inline)) int __test_and_clear_bit(int nr, volatile unsigned long *addr)
{
        int oldbit;

        __asm__(
                "btrl %2,%1\n\tsbbl %0,%0"
                :"=r" (oldbit),"+m" ((*(volatile long *) addr))
                :"Ir" (nr));
        return oldbit;
}


static inline __attribute__((always_inline)) int __test_and_change_bit(int nr, volatile unsigned long *addr)
{
        int oldbit;

        __asm__ __volatile__(
                "btcl %2,%1\n\tsbbl %0,%0"
                :"=r" (oldbit),"+m" ((*(volatile long *) addr))
                :"Ir" (nr) : "memory");
        return oldbit;
}
# 224 "include/asm/bitops.h"
static inline __attribute__((always_inline)) int test_and_change_bit(int nr, volatile unsigned long* addr)
{
        int oldbit;

        __asm__ __volatile__( ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; "
                "btcl %2,%1\n\tsbbl %0,%0"
                :"=r" (oldbit),"+m" ((*(volatile long *) addr))
                :"Ir" (nr) : "memory");
        return oldbit;
}
# 244 "include/asm/bitops.h"
static inline __attribute__((always_inline)) __attribute__((always_inline)) int constant_test_bit(int nr, const volatile unsigned long *addr)
{
        return ((1UL << (nr & 31)) & (addr[nr >> 5])) != 0;
}

static inline __attribute__((always_inline)) int variable_test_bit(int nr, const volatile unsigned long * addr)
{
        int oldbit;

        __asm__ __volatile__(
                "btl %2,%1\n\tsbbl %0,%0"
                :"=r" (oldbit)
                :"m" ((*(volatile long *) addr)),"Ir" (nr));
        return oldbit;
}
# 275 "include/asm/bitops.h"
static inline __attribute__((always_inline)) int find_first_zero_bit(const unsigned long *addr, unsigned size)
{
        int d0, d1, d2;
        int res;

        if (!size)
                return 0;

        __asm__ __volatile__(
                "movl $-1,%%eax\n\t"
                "xorl %%edx,%%edx\n\t"
                "repe; scasl\n\t"
                "je 1f\n\t"
                "xorl -4(%%edi),%%eax\n\t"
                "subl $4,%%edi\n\t"
                "bsfl %%eax,%%edx\n"
                "1:\tsubl %%ebx,%%edi\n\t"
                "shll $3,%%edi\n\t"
                "addl %%edi,%%edx"
                :"=d" (res), "=&c" (d0), "=&D" (d1), "=&a" (d2)
                :"1" ((size + 31) >> 5), "2" (addr), "b" (addr) : "memory");
        return res;
}







int find_next_zero_bit(const unsigned long *addr, int size, int offset);







static inline __attribute__((always_inline)) unsigned long __ffs(unsigned long word)
{
        __asm__("bsfl %1,%0"
                :"=r" (word)
                :"rm" (word));
        return word;
}
# 329 "include/asm/bitops.h"
static inline __attribute__((always_inline)) unsigned find_first_bit(const unsigned long *addr, unsigned size)
{
        unsigned x = 0;

        while (x < size) {
                unsigned long val = *addr++;
                if (val)
                        return __ffs(val) + x;
                x += (sizeof(*addr)<<3);
        }
        return x;
}







int find_next_bit(const unsigned long *addr, int size, int offset);







static inline __attribute__((always_inline)) unsigned long ffz(unsigned long word)
{
        __asm__("bsfl %1,%0"
                :"=r" (word)
                :"r" (~word));
        return word;
}



# 1 "include/asm-generic/bitops/sched.h" 1
# 13 "include/asm-generic/bitops/sched.h"
static inline __attribute__((always_inline)) int sched_find_first_bit(const unsigned long *b)
{







        if (__builtin_expect(!!(b[0]), 0))
                return __ffs(b[0]);
        if (__builtin_expect(!!(b[1]), 0))
                return __ffs(b[1]) + 32;
        if (__builtin_expect(!!(b[2]), 0))
                return __ffs(b[2]) + 64;
        if (b[3])
                return __ffs(b[3]) + 96;
        return __ffs(b[4]) + 128;



}
# 367 "include/asm/bitops.h" 2
# 376 "include/asm/bitops.h"
static inline __attribute__((always_inline)) int ffs(int x)
{
        int r;

        __asm__("bsfl %1,%0\n\t"
                "jnz 1f\n\t"
                "movl $-1,%0\n"
                "1:" : "=r" (r) : "rm" (x));
        return r+1;
}







static inline __attribute__((always_inline)) int fls(int x)
{
        int r;

        __asm__("bsrl %1,%0\n\t"
                "jnz 1f\n\t"
                "movl $-1,%0\n"
                "1:" : "=r" (r) : "rm" (x));
        return r+1;
}

# 1 "include/asm-generic/bitops/hweight.h" 1





extern unsigned int hweight32(unsigned int w);
extern unsigned int hweight16(unsigned int w);
extern unsigned int hweight8(unsigned int w);
extern unsigned long hweight64(__u64 w);
# 405 "include/asm/bitops.h" 2



# 1 "include/asm-generic/bitops/fls64.h" 1





static inline __attribute__((always_inline)) int fls64(__u64 x)
{
        __u32 h = x >> 32;
        if (h)
                return fls(h) + 32;
        return fls(x);
}
# 409 "include/asm/bitops.h" 2



# 1 "include/asm-generic/bitops/ext2-non-atomic.h" 1



# 1 "include/asm-generic/bitops/le.h" 1




# 1 "include/asm/byteorder.h" 1
# 13 "include/asm/byteorder.h"
static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u32 ___arch__swab32(__u32 x)
{

        __asm__("bswap %0" : "=r" (x) : "0" (x));







        return x;
}

static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u64 ___arch__swab64(__u64 val)
{
        union {
                struct { __u32 a,b; } s;
                __u64 u;
        } v;
        v.u = val;

        asm("bswapl %0 ; bswapl %1 ; xchgl %0,%1"
            : "=r" (v.s.a), "=r" (v.s.b)
            : "0" (v.s.a), "1" (v.s.b));





        return v.u;
}
# 56 "include/asm/byteorder.h"
# 1 "include/linux/byteorder/little_endian.h" 1
# 12 "include/linux/byteorder/little_endian.h"
# 1 "include/linux/byteorder/swab.h" 1
# 133 "include/linux/byteorder/swab.h"
static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u16 __fswab16(__u16 x)
{
        return ({ __u16 __tmp = (x) ; ({ __u16 __x = (__tmp); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }); });
}
static __inline__ __attribute__((always_inline)) __u16 __swab16p(const __u16 *x)
{
        return ({ __u16 __tmp = (*(x)) ; ({ __u16 __x = (__tmp); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }); });
}
static __inline__ __attribute__((always_inline)) void __swab16s(__u16 *addr)
{
        do { *(addr) = ({ __u16 __tmp = (*((addr))) ; ({ __u16 __x = (__tmp); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }); }); } while (0);
}

static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u32 __fswab32(__u32 x)
{
        return ___arch__swab32(x);
}
static __inline__ __attribute__((always_inline)) __u32 __swab32p(const __u32 *x)
{
        return ___arch__swab32(*(x));
}
static __inline__ __attribute__((always_inline)) void __swab32s(__u32 *addr)
{
        do { *(addr) = ___arch__swab32(*((addr))); } while (0);
}


static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u64 __fswab64(__u64 x)
{





        return ___arch__swab64(x);

}
static __inline__ __attribute__((always_inline)) __u64 __swab64p(const __u64 *x)
{
        return ___arch__swab64(*(x));
}
static __inline__ __attribute__((always_inline)) void __swab64s(__u64 *addr)
{
        do { *(addr) = ___arch__swab64(*((addr))); } while (0);
}
# 13 "include/linux/byteorder/little_endian.h" 2
# 43 "include/linux/byteorder/little_endian.h"
static inline __attribute__((always_inline)) __le64 __cpu_to_le64p(const __u64 *p)
{
        return ( __le64)*p;
}
static inline __attribute__((always_inline)) __u64 __le64_to_cpup(const __le64 *p)
{
        return ( __u64)*p;
}
static inline __attribute__((always_inline)) __le32 __cpu_to_le32p(const __u32 *p)
{
        return ( __le32)*p;
}
static inline __attribute__((always_inline)) __u32 __le32_to_cpup(const __le32 *p)
{
        return ( __u32)*p;
}
static inline __attribute__((always_inline)) __le16 __cpu_to_le16p(const __u16 *p)
{
        return ( __le16)*p;
}
static inline __attribute__((always_inline)) __u16 __le16_to_cpup(const __le16 *p)
{
        return ( __u16)*p;
}
static inline __attribute__((always_inline)) __be64 __cpu_to_be64p(const __u64 *p)
{
        return ( __be64)__swab64p(p);
}
static inline __attribute__((always_inline)) __u64 __be64_to_cpup(const __be64 *p)
{
        return __swab64p((__u64 *)p);
}
static inline __attribute__((always_inline)) __be32 __cpu_to_be32p(const __u32 *p)
{
        return ( __be32)__swab32p(p);
}
static inline __attribute__((always_inline)) __u32 __be32_to_cpup(const __be32 *p)
{
        return __swab32p((__u32 *)p);
}
static inline __attribute__((always_inline)) __be16 __cpu_to_be16p(const __u16 *p)
{
        return ( __be16)__swab16p(p);
}
static inline __attribute__((always_inline)) __u16 __be16_to_cpup(const __be16 *p)
{
        return __swab16p((__u16 *)p);
}
# 104 "include/linux/byteorder/little_endian.h"
# 1 "include/linux/byteorder/generic.h" 1
# 154 "include/linux/byteorder/generic.h"
extern __u32 ntohl(__be32);
extern __be32 htonl(__u32);
extern __u16 ntohs(__be16);
extern __be16 htons(__u16);
# 105 "include/linux/byteorder/little_endian.h" 2
# 57 "include/asm/byteorder.h" 2
# 6 "include/asm-generic/bitops/le.h" 2
# 5 "include/asm-generic/bitops/ext2-non-atomic.h" 2
# 413 "include/asm/bitops.h" 2






# 1 "include/asm-generic/bitops/minix.h" 1
# 420 "include/asm/bitops.h" 2
# 10 "include/linux/bitops.h" 2

static __inline__ __attribute__((always_inline)) int get_bitmask_order(unsigned int count)
{
        int order;

        order = fls(count);
        return order;
}

static __inline__ __attribute__((always_inline)) int get_count_order(unsigned int count)
{
        int order;

        order = fls(count) - 1;
        if (count & (count - 1))
                order++;
        return order;
}

static inline __attribute__((always_inline)) unsigned long hweight_long(unsigned long w)
{
        return sizeof(w) == 4 ? hweight32(w) : hweight64(w);
}






static inline __attribute__((always_inline)) __u32 rol32(__u32 word, unsigned int shift)
{
        return (word << shift) | (word >> (32 - shift));
}






static inline __attribute__((always_inline)) __u32 ror32(__u32 word, unsigned int shift)
{
        return (word >> shift) | (word << (32 - shift));
}

static inline __attribute__((always_inline)) unsigned fls_long(unsigned long l)
{
        if (sizeof(l) == 4)
                return fls(l);
        return fls64(l);
}
# 21 "include/linux/thread_info.h" 2
# 1 "include/asm/thread_info.h" 1
# 13 "include/asm/thread_info.h"
# 1 "include/asm/page.h" 1
# 44 "include/asm/page.h"
extern int nx_enabled;
# 57 "include/asm/page.h"
typedef struct { unsigned long pte_low; } pte_t;
typedef struct { unsigned long pgd; } pgd_t;
typedef struct { unsigned long pgprot; } pgprot_t;



# 1 "include/asm-generic/pgtable-nopmd.h" 1





# 1 "include/asm-generic/pgtable-nopud.h" 1
# 13 "include/asm-generic/pgtable-nopud.h"
typedef struct { pgd_t pgd; } pud_t;
# 25 "include/asm-generic/pgtable-nopud.h"
static inline __attribute__((always_inline)) int pgd_none(pgd_t pgd) { return 0; }
static inline __attribute__((always_inline)) int pgd_bad(pgd_t pgd) { return 0; }
static inline __attribute__((always_inline)) int pgd_present(pgd_t pgd) { return 1; }
static inline __attribute__((always_inline)) void pgd_clear(pgd_t *pgd) { }
# 38 "include/asm-generic/pgtable-nopud.h"
static inline __attribute__((always_inline)) pud_t * pud_offset(pgd_t * pgd, unsigned long address)
{
        return (pud_t *)pgd;
}
# 7 "include/asm-generic/pgtable-nopmd.h" 2
# 15 "include/asm-generic/pgtable-nopmd.h"
typedef struct { pud_t pud; } pmd_t;
# 27 "include/asm-generic/pgtable-nopmd.h"
static inline __attribute__((always_inline)) int pud_none(pud_t pud) { return 0; }
static inline __attribute__((always_inline)) int pud_bad(pud_t pud) { return 0; }
static inline __attribute__((always_inline)) int pud_present(pud_t pud) { return 1; }
static inline __attribute__((always_inline)) void pud_clear(pud_t *pud) { }
# 41 "include/asm-generic/pgtable-nopmd.h"
static inline __attribute__((always_inline)) pmd_t * pmd_offset(pud_t * pud, unsigned long address)
{
        return (pmd_t *)pud;
}
# 64 "include/asm/page.h" 2
# 101 "include/asm/page.h"
struct vm_area_struct;





extern unsigned int __VMALLOC_RESERVE;

extern int sysctl_legacy_va_layout;

extern int page_is_ram(unsigned long pagenr);
# 143 "include/asm/page.h"
# 1 "include/asm-generic/memory_model.h" 1
# 144 "include/asm/page.h" 2
# 1 "include/asm-generic/page.h" 1
# 10 "include/asm-generic/page.h"
static __inline__ __attribute__((always_inline)) __attribute__((__const__)) int get_order(unsigned long size)
{
        int order;

        size = (size - 1) >> (12 - 1);
        order = -1;
        do {
                size >>= 1;
                order++;
        } while (size);
        return order;
}
# 145 "include/asm/page.h" 2
# 14 "include/asm/thread_info.h" 2


# 1 "include/asm/processor.h" 1
# 10 "include/asm/processor.h"
# 1 "include/asm/vm86.h" 1
# 72 "include/asm/vm86.h"
struct vm86_regs {



        long ebx;
        long ecx;
        long edx;
        long esi;
        long edi;
        long ebp;
        long eax;
        long __null_ds;
        long __null_es;
        long __null_fs;
        long __null_gs;
        long orig_eax;
        long eip;
        unsigned short cs, __csh;
        long eflags;
        long esp;
        unsigned short ss, __ssh;



        unsigned short es, __esh;
        unsigned short ds, __dsh;
        unsigned short fs, __fsh;
        unsigned short gs, __gsh;
};

struct revectored_struct {
        unsigned long __map[8];
};

struct vm86_struct {
        struct vm86_regs regs;
        unsigned long flags;
        unsigned long screen_bitmap;
        unsigned long cpu_type;
        struct revectored_struct int_revectored;
        struct revectored_struct int21_revectored;
};






struct vm86plus_info_struct {
        unsigned long force_return_for_pic:1;
        unsigned long vm86dbg_active:1;
        unsigned long vm86dbg_TFpendig:1;
        unsigned long unused:28;
        unsigned long is_vm86pus:1;
        unsigned char vm86dbg_intxxtab[32];
};

struct vm86plus_struct {
        struct vm86_regs regs;
        unsigned long flags;
        unsigned long screen_bitmap;
        unsigned long cpu_type;
        struct revectored_struct int_revectored;
        struct revectored_struct int21_revectored;
        struct vm86plus_info_struct vm86plus;
};
# 148 "include/asm/vm86.h"
# 1 "include/asm/ptrace.h" 1



# 1 "include/asm/ptrace-abi.h" 1
# 5 "include/asm/ptrace.h" 2




struct pt_regs {
        long ebx;
        long ecx;
        long edx;
        long esi;
        long edi;
        long ebp;
        long eax;
        int xds;
        int xes;

        int xgs;
        long orig_eax;
        long eip;
        int xcs;
        long eflags;
        long esp;
        int xss;
};



# 1 "include/asm/vm86.h" 1
# 32 "include/asm/ptrace.h" 2
# 1 "include/asm/segment.h" 1
# 33 "include/asm/ptrace.h" 2

struct task_struct;
extern void send_sigtrap(struct task_struct *tsk, struct pt_regs *regs, int error_code);
# 44 "include/asm/ptrace.h"
static inline __attribute__((always_inline)) int user_mode(struct pt_regs *regs)
{
        return (regs->xcs & 0x3) == 0x3;
}
static inline __attribute__((always_inline)) int user_mode_vm(struct pt_regs *regs)
{
        return ((regs->xcs & 0x3) | (regs->eflags & 0x00020000)) >= 0x3;
}




extern unsigned long profile_pc(struct pt_regs *regs);
# 149 "include/asm/vm86.h" 2

struct kernel_vm86_regs {



        struct pt_regs pt;



        unsigned short es, __esh;
        unsigned short ds, __dsh;
        unsigned short fs, __fsh;
        unsigned short gs, __gsh;
};

struct kernel_vm86_struct {
        struct kernel_vm86_regs regs;
# 175 "include/asm/vm86.h"
        unsigned long flags;
        unsigned long screen_bitmap;
        unsigned long cpu_type;
        struct revectored_struct int_revectored;
        struct revectored_struct int21_revectored;
        struct vm86plus_info_struct vm86plus;
        struct pt_regs *regs32;
# 192 "include/asm/vm86.h"
};



void handle_vm86_fault(struct kernel_vm86_regs *, long);
int handle_vm86_trap(struct kernel_vm86_regs *, long, int);

struct task_struct;
void release_vm86_irqs(struct task_struct *);
# 11 "include/asm/processor.h" 2
# 1 "include/asm/math_emu.h" 1



# 1 "include/asm/sigcontext.h" 1
# 20 "include/asm/sigcontext.h"
struct _fpreg {
        unsigned short significand[4];
        unsigned short exponent;
};

struct _fpxreg {
        unsigned short significand[4];
        unsigned short exponent;
        unsigned short padding[3];
};

struct _xmmreg {
        unsigned long element[4];
};

struct _fpstate {

        unsigned long cw;
        unsigned long sw;
        unsigned long tag;
        unsigned long ipoff;
        unsigned long cssel;
        unsigned long dataoff;
        unsigned long datasel;
        struct _fpreg _st[8];
        unsigned short status;
        unsigned short magic;


        unsigned long _fxsr_env[6];
        unsigned long mxcsr;
        unsigned long reserved;
        struct _fpxreg _fxsr_st[8];
        struct _xmmreg _xmm[8];
        unsigned long padding[56];
};



struct sigcontext {
        unsigned short gs, __gsh;
        unsigned short fs, __fsh;
        unsigned short es, __esh;
        unsigned short ds, __dsh;
        unsigned long edi;
        unsigned long esi;
        unsigned long ebp;
        unsigned long esp;
        unsigned long ebx;
        unsigned long edx;
        unsigned long ecx;
        unsigned long eax;
        unsigned long trapno;
        unsigned long err;
        unsigned long eip;
        unsigned short cs, __csh;
        unsigned long eflags;
        unsigned long esp_at_signal;
        unsigned short ss, __ssh;
        struct _fpstate * fpstate;
        unsigned long oldmask;
        unsigned long cr2;
};
# 5 "include/asm/math_emu.h" 2

int restore_i387_soft(void *s387, struct _fpstate *buf);
int save_i387_soft(void *s387, struct _fpstate *buf);





struct info {
        long ___orig_eip;
        long ___ebx;
        long ___ecx;
        long ___edx;
        long ___esi;
        long ___edi;
        long ___ebp;
        long ___eax;
        long ___ds;
        long ___es;
        long ___fs;
        long ___orig_eax;
        long ___eip;
        long ___cs;
        long ___eflags;
        long ___esp;
        long ___ss;
        long ___vm86_es;
        long ___vm86_ds;
        long ___vm86_fs;
        long ___vm86_gs;
};
# 12 "include/asm/processor.h" 2




# 1 "include/asm/cpufeature.h" 1
# 17 "include/asm/processor.h" 2
# 1 "include/asm/msr.h" 1
# 31 "include/asm/msr.h"
static inline __attribute__((always_inline)) void wrmsrl (unsigned long msr, unsigned long long val)
{
        unsigned long lo, hi;
        lo = (unsigned long) val;
        hi = val >> 32;
        __asm__ __volatile__("wrmsr" : : "c" (msr), "a" (lo), "d" (hi));
}
# 18 "include/asm/processor.h" 2
# 1 "include/asm/system.h" 1



# 1 "include/linux/kernel.h" 1
# 10 "include/linux/kernel.h"
# 1 "/usr/lib/gcc-lib/i386-redhat-linux/3.2.2/include/stdarg.h" 1 3
# 43 "/usr/lib/gcc-lib/i386-redhat-linux/3.2.2/include/stdarg.h" 3
typedef __builtin_va_list __gnuc_va_list;
# 110 "/usr/lib/gcc-lib/i386-redhat-linux/3.2.2/include/stdarg.h" 3
typedef __gnuc_va_list va_list;
# 11 "include/linux/kernel.h" 2
# 1 "include/linux/linkage.h" 1



# 1 "include/asm/linkage.h" 1
# 5 "include/linux/linkage.h" 2
# 12 "include/linux/kernel.h" 2




# 1 "include/linux/log2.h" 1
# 21 "include/linux/log2.h"
extern __attribute__((const, noreturn))
int ____ilog2_NaN(void);
# 31 "include/linux/log2.h"
static inline __attribute__((always_inline)) __attribute__((const))
int __ilog2_u32(u32 n)
{
        return fls(n) - 1;
}



static inline __attribute__((always_inline)) __attribute__((const))
int __ilog2_u64(u64 n)
{
        return fls64(n) - 1;
}





static inline __attribute__((always_inline)) __attribute__((const))
unsigned long __roundup_pow_of_two(unsigned long n)
{
        return 1UL << fls_long(n - 1);
}
# 17 "include/linux/kernel.h" 2

# 1 "include/asm/bug.h" 1
# 36 "include/asm/bug.h"
# 1 "include/asm-generic/bug.h" 1
# 10 "include/asm-generic/bug.h"
struct bug_entry {
        unsigned long bug_addr;

        const char *file;
        unsigned short line;

        unsigned short flags;
};
# 37 "include/asm/bug.h" 2
# 19 "include/linux/kernel.h" 2

extern const char linux_banner[];
extern const char linux_proc_banner[];
# 52 "include/linux/kernel.h"
extern int console_printk[];






struct completion;
struct pt_regs;
struct user;
# 74 "include/linux/kernel.h"
extern int cond_resched(void);
# 100 "include/linux/kernel.h"
extern struct atomic_notifier_head panic_notifier_list;
extern long (*panic_blink)(long time);
 void panic(const char * fmt, ...)
        __attribute__ ((noreturn, format (printf, 1, 2)));
extern void oops_enter(void);
extern void oops_exit(void);
extern int oops_may_print(void);
__attribute__((regparm(3))) void do_exit(long error_code)
        __attribute__((noreturn));
 void complete_and_exit(struct completion *, long)
        __attribute__((noreturn));
extern unsigned long simple_strtoul(const char *,char **,unsigned int);
extern long simple_strtol(const char *,char **,unsigned int);
extern unsigned long long simple_strtoull(const char *,char **,unsigned int);
extern long long simple_strtoll(const char *,char **,unsigned int);
extern int sprintf(char * buf, const char * fmt, ...)
        __attribute__ ((format (printf, 2, 3)));
extern int vsprintf(char *buf, const char *, va_list)
        __attribute__ ((format (printf, 2, 0)));
extern int snprintf(char * buf, size_t size, const char * fmt, ...)
        __attribute__ ((format (printf, 3, 4)));
extern int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
        __attribute__ ((format (printf, 3, 0)));
extern int scnprintf(char * buf, size_t size, const char * fmt, ...)
        __attribute__ ((format (printf, 3, 4)));
extern int vscnprintf(char *buf, size_t size, const char *fmt, va_list args)
        __attribute__ ((format (printf, 3, 0)));
extern char *kasprintf(gfp_t gfp, const char *fmt, ...)
        __attribute__ ((format (printf, 2, 3)));

extern int sscanf(const char *, const char *, ...)
        __attribute__ ((format (scanf, 2, 3)));
extern int vsscanf(const char *, const char *, va_list)
        __attribute__ ((format (scanf, 2, 0)));

extern int get_option(char **str, int *pint);
extern char *get_options(const char *str, int nints, int *ints);
extern unsigned long long memparse(char *ptr, char **retptr);

extern int core_kernel_text(unsigned long addr);
extern int __kernel_text_address(unsigned long addr);
extern int kernel_text_address(unsigned long addr);
extern int session_of_pgrp(int pgrp);

extern void dump_thread(struct pt_regs *regs, struct user *dump);


 __attribute__((regparm(0))) int vprintk(const char *fmt, va_list args)
        __attribute__ ((format (printf, 1, 0)));
 __attribute__((regparm(0))) int printk(const char * fmt, ...)
        __attribute__ ((format (printf, 1, 2)));
# 160 "include/linux/kernel.h"
unsigned long int_sqrt(unsigned long);

extern int printk_ratelimit(void);
extern int __printk_ratelimit(int ratelimit_jiffies, int ratelimit_burst);
extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
                                unsigned int interval_msec);

static inline __attribute__((always_inline)) void console_silent(void)
{
        (console_printk[0]) = 0;
}

static inline __attribute__((always_inline)) void console_verbose(void)
{
        if ((console_printk[0]))
                (console_printk[0]) = 15;
}

extern void bust_spinlocks(int yes);
extern int oops_in_progress;
extern int panic_timeout;
extern int panic_on_oops;
extern int panic_on_unrecovered_nmi;
extern int tainted;
extern const char *print_tainted(void);
extern void add_taint(unsigned);


extern enum system_states {
        SYSTEM_BOOTING,
        SYSTEM_RUNNING,
        SYSTEM_HALT,
        SYSTEM_POWER_OFF,
        SYSTEM_RESTART,
        SYSTEM_SUSPEND_DISK,
} system_state;
# 204 "include/linux/kernel.h"
extern void dump_stack(void);






static inline __attribute__((always_inline)) int __attribute__ ((format (printf, 1, 2))) pr_debug(const char * fmt, ...)
{
        return 0;
}
# 318 "include/linux/kernel.h"
struct sysinfo {
        long uptime;
        unsigned long loads[3];
        unsigned long totalram;
        unsigned long freeram;
        unsigned long sharedram;
        unsigned long bufferram;
        unsigned long totalswap;
        unsigned long freeswap;
        unsigned short procs;
        unsigned short pad;
        unsigned long totalhigh;
        unsigned long freehigh;
        unsigned int mem_unit;
        char _f[20-2*sizeof(long)-sizeof(int)];
};
# 5 "include/asm/system.h" 2






struct task_struct;
extern struct task_struct * __switch_to(struct task_struct *prev, struct task_struct *next) __attribute__((regparm(3)));
# 157 "include/asm/system.h"
static inline __attribute__((always_inline)) unsigned long get_limit(unsigned long segment)
{
        unsigned long __limit;
        __asm__("lsll %1,%0"
                :"=r" (__limit):"r" (segment));
        return __limit+1;
}







struct __xchg_dummy { unsigned long a[100]; };
# 191 "include/asm/system.h"
static inline __attribute__((always_inline)) void __set_64bit (unsigned long long * ptr,
                unsigned int low, unsigned int high)
{
        __asm__ __volatile__ (
                "\n1:\t"
                "movl (%0), %%eax\n\t"
                "movl 4(%0), %%edx\n\t"
                "lock cmpxchg8b (%0)\n\t"
                "jnz 1b"
                :
                : "D"(ptr),
                        "b"(low),
                        "c"(high)
                : "ax","dx","memory");
}

static inline __attribute__((always_inline)) void __set_64bit_constant (unsigned long long *ptr,
                                                 unsigned long long value)
{
        __set_64bit(ptr,(unsigned int)(value), (unsigned int)((value)>>32ULL));
}



static inline __attribute__((always_inline)) void __set_64bit_var (unsigned long long *ptr,
                         unsigned long long value)
{
        __set_64bit(ptr,*(((unsigned int*)&(value))+0), *(((unsigned int*)&(value))+1));
}
# 238 "include/asm/system.h"
static inline __attribute__((always_inline)) unsigned long __xchg(unsigned long x, volatile void * ptr, int size)
{
        switch (size) {
                case 1:
                        __asm__ __volatile__("xchgb %b0,%1"
                                :"=q" (x)
                                :"m" (*((struct __xchg_dummy *)(ptr))), "0" (x)
                                :"memory");
                        break;
                case 2:
                        __asm__ __volatile__("xchgw %w0,%1"
                                :"=r" (x)
                                :"m" (*((struct __xchg_dummy *)(ptr))), "0" (x)
                                :"memory");
                        break;
                case 4:
                        __asm__ __volatile__("xchgl %0,%1"
                                :"=r" (x)
                                :"m" (*((struct __xchg_dummy *)(ptr))), "0" (x)
                                :"memory");
                        break;
        }
        return x;
}
# 279 "include/asm/system.h"
static inline __attribute__((always_inline)) unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
                                      unsigned long new, int size)
{
        unsigned long prev;
        switch (size) {
        case 1:
                __asm__ __volatile__(".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "cmpxchgb %b1,%2"
                                     : "=a"(prev)
                                     : "q"(new), "m"(*((struct __xchg_dummy *)(ptr))), "0"(old)
                                     : "memory");
                return prev;
        case 2:
                __asm__ __volatile__(".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "cmpxchgw %w1,%2"
                                     : "=a"(prev)
                                     : "r"(new), "m"(*((struct __xchg_dummy *)(ptr))), "0"(old)
                                     : "memory");
                return prev;
        case 4:
                __asm__ __volatile__(".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "cmpxchgl %1,%2"
                                     : "=a"(prev)
                                     : "r"(new), "m"(*((struct __xchg_dummy *)(ptr))), "0"(old)
                                     : "memory");
                return prev;
        }
        return old;
}






static inline __attribute__((always_inline)) unsigned long __sync_cmpxchg(volatile void *ptr,
                                            unsigned long old,
                                            unsigned long new, int size)
{
        unsigned long prev;
        switch (size) {
        case 1:
                __asm__ __volatile__("lock; cmpxchgb %b1,%2"
                                     : "=a"(prev)
                                     : "q"(new), "m"(*((struct __xchg_dummy *)(ptr))), "0"(old)
                                     : "memory");
                return prev;
        case 2:
                __asm__ __volatile__("lock; cmpxchgw %w1,%2"
                                     : "=a"(prev)
                                     : "r"(new), "m"(*((struct __xchg_dummy *)(ptr))), "0"(old)
                                     : "memory");
                return prev;
        case 4:
                __asm__ __volatile__("lock; cmpxchgl %1,%2"
                                     : "=a"(prev)
                                     : "r"(new), "m"(*((struct __xchg_dummy *)(ptr))), "0"(old)
                                     : "memory");
                return prev;
        }
        return old;
}
# 379 "include/asm/system.h"
static inline __attribute__((always_inline)) unsigned long long __cmpxchg64(volatile void *ptr, unsigned long long old,
                                      unsigned long long new)
{
        unsigned long long prev;
        __asm__ __volatile__(".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "cmpxchg8b %3"
                             : "=A"(prev)
                             : "b"((unsigned long)new),
                               "c"((unsigned long)(new >> 32)),
                               "m"(*((struct __xchg_dummy *)(ptr))),
                               "0"(old)
                             : "memory");
        return prev;
}
# 502 "include/asm/system.h"
# 1 "include/linux/irqflags.h" 1
# 46 "include/linux/irqflags.h"
# 1 "include/asm/irqflags.h" 1
# 18 "include/asm/irqflags.h"
static inline __attribute__((always_inline)) unsigned long __raw_local_save_flags(void)
{
        unsigned long flags;

        __asm__ __volatile__(
                "pushfl ; popl %0"
                : "=g" (flags)
                :
        );

        return flags;
}

static inline __attribute__((always_inline)) void raw_local_irq_restore(unsigned long flags)
{
        __asm__ __volatile__(
                "pushl %0 ; popfl"
                :
                :"g" (flags)
                :"memory", "cc"
        );
}

static inline __attribute__((always_inline)) void raw_local_irq_disable(void)
{
        __asm__ __volatile__("cli" : : : "memory");
}

static inline __attribute__((always_inline)) void raw_local_irq_enable(void)
{
        __asm__ __volatile__("sti" : : : "memory");
}





static inline __attribute__((always_inline)) void raw_safe_halt(void)
{
        __asm__ __volatile__("sti; hlt" : : : "memory");
}





static inline __attribute__((always_inline)) void halt(void)
{
        __asm__ __volatile__("hlt": : :"memory");
}




static inline __attribute__((always_inline)) unsigned long __raw_local_irq_save(void)
{
        unsigned long flags = __raw_local_save_flags();

        raw_local_irq_disable();

        return flags;
}
# 97 "include/asm/irqflags.h"
static inline __attribute__((always_inline)) int raw_irqs_disabled_flags(unsigned long flags)
{
        return !(flags & (1 << 9));
}

static inline __attribute__((always_inline)) int raw_irqs_disabled(void)
{
        unsigned long flags = __raw_local_save_flags();

        return raw_irqs_disabled_flags(flags);
}
# 47 "include/linux/irqflags.h" 2
# 503 "include/asm/system.h" 2





void disable_hlt(void);
void enable_hlt(void);

extern int es7000_plat;
void cpu_idle_wait(void);





static inline __attribute__((always_inline)) void sched_cacheflush(void)
{
        __asm__ __volatile__ ("wbinvd": : :"memory");
}

extern unsigned long arch_align_stack(unsigned long sp);
extern void free_init_pages(char *what, unsigned long begin, unsigned long end);

void default_idle(void);
# 19 "include/asm/processor.h" 2
# 1 "include/linux/cache.h" 1




# 1 "include/asm/cache.h" 1
# 6 "include/linux/cache.h" 2
# 20 "include/asm/processor.h" 2
# 1 "include/linux/threads.h" 1
# 21 "include/asm/processor.h" 2
# 1 "include/asm/percpu.h" 1




# 1 "include/asm-generic/percpu.h" 1







extern unsigned long __per_cpu_offset[32];
# 6 "include/asm/percpu.h" 2
# 22 "include/asm/processor.h" 2
# 1 "include/linux/cpumask.h" 1
# 86 "include/linux/cpumask.h"
# 1 "include/linux/bitmap.h" 1







# 1 "include/linux/string.h" 1
# 16 "include/linux/string.h"
extern char *strndup_user(const char *, long);




# 1 "include/asm/string.h" 1
# 29 "include/asm/string.h"
static inline __attribute__((always_inline)) char * strcpy(char * dest,const char *src)
{
int d0, d1, d2;
__asm__ __volatile__(
        "1:\tlodsb\n\t"
        "stosb\n\t"
        "testb %%al,%%al\n\t"
        "jne 1b"
        : "=&S" (d0), "=&D" (d1), "=&a" (d2)
        :"0" (src),"1" (dest) : "memory");
return dest;
}


static inline __attribute__((always_inline)) char * strncpy(char * dest,const char *src,size_t count)
{
int d0, d1, d2, d3;
__asm__ __volatile__(
        "1:\tdecl %2\n\t"
        "js 2f\n\t"
        "lodsb\n\t"
        "stosb\n\t"
        "testb %%al,%%al\n\t"
        "jne 1b\n\t"
        "rep\n\t"
        "stosb\n"
        "2:"
        : "=&S" (d0), "=&D" (d1), "=&c" (d2), "=&a" (d3)
        :"0" (src),"1" (dest),"2" (count) : "memory");
return dest;
}


static inline __attribute__((always_inline)) char * strcat(char * dest,const char * src)
{
int d0, d1, d2, d3;
__asm__ __volatile__(
        "repne\n\t"
        "scasb\n\t"
        "decl %1\n"
        "1:\tlodsb\n\t"
        "stosb\n\t"
        "testb %%al,%%al\n\t"
        "jne 1b"
        : "=&S" (d0), "=&D" (d1), "=&a" (d2), "=&c" (d3)
        : "0" (src), "1" (dest), "2" (0), "3" (0xffffffffu):"memory");
return dest;
}


static inline __attribute__((always_inline)) char * strncat(char * dest,const char * src,size_t count)
{
int d0, d1, d2, d3;
__asm__ __volatile__(
        "repne\n\t"
        "scasb\n\t"
        "decl %1\n\t"
        "movl %8,%3\n"
        "1:\tdecl %3\n\t"
        "js 2f\n\t"
        "lodsb\n\t"
        "stosb\n\t"
        "testb %%al,%%al\n\t"
        "jne 1b\n"
        "2:\txorl %2,%2\n\t"
        "stosb"
        : "=&S" (d0), "=&D" (d1), "=&a" (d2), "=&c" (d3)
        : "0" (src),"1" (dest),"2" (0),"3" (0xffffffffu), "g" (count)
        : "memory");
return dest;
}


static inline __attribute__((always_inline)) int strcmp(const char * cs,const char * ct)
{
int d0, d1;
register int __res;
__asm__ __volatile__(
        "1:\tlodsb\n\t"
        "scasb\n\t"
        "jne 2f\n\t"
        "testb %%al,%%al\n\t"
        "jne 1b\n\t"
        "xorl %%eax,%%eax\n\t"
        "jmp 3f\n"
        "2:\tsbbl %%eax,%%eax\n\t"
        "orb $1,%%al\n"
        "3:"
        :"=a" (__res), "=&S" (d0), "=&D" (d1)
        :"1" (cs),"2" (ct)
        :"memory");
return __res;
}


static inline __attribute__((always_inline)) int strncmp(const char * cs,const char * ct,size_t count)
{
register int __res;
int d0, d1, d2;
__asm__ __volatile__(
        "1:\tdecl %3\n\t"
        "js 2f\n\t"
        "lodsb\n\t"
        "scasb\n\t"
        "jne 3f\n\t"
        "testb %%al,%%al\n\t"
        "jne 1b\n"
        "2:\txorl %%eax,%%eax\n\t"
        "jmp 4f\n"
        "3:\tsbbl %%eax,%%eax\n\t"
        "orb $1,%%al\n"
        "4:"
        :"=a" (__res), "=&S" (d0), "=&D" (d1), "=&c" (d2)
        :"1" (cs),"2" (ct),"3" (count)
        :"memory");
return __res;
}


static inline __attribute__((always_inline)) char * strchr(const char * s, int c)
{
int d0;
register char * __res;
__asm__ __volatile__(
        "movb %%al,%%ah\n"
        "1:\tlodsb\n\t"
        "cmpb %%ah,%%al\n\t"
        "je 2f\n\t"
        "testb %%al,%%al\n\t"
        "jne 1b\n\t"
        "movl $1,%1\n"
        "2:\tmovl %1,%0\n\t"
        "decl %0"
        :"=a" (__res), "=&S" (d0)
        :"1" (s),"0" (c)
        :"memory");
return __res;
}


static inline __attribute__((always_inline)) char * strrchr(const char * s, int c)
{
int d0, d1;
register char * __res;
__asm__ __volatile__(
        "movb %%al,%%ah\n"
        "1:\tlodsb\n\t"
        "cmpb %%ah,%%al\n\t"
        "jne 2f\n\t"
        "leal -1(%%esi),%0\n"
        "2:\ttestb %%al,%%al\n\t"
        "jne 1b"
        :"=g" (__res), "=&S" (d0), "=&a" (d1)
        :"0" (0),"1" (s),"2" (c)
        :"memory");
return __res;
}


static inline __attribute__((always_inline)) size_t strlen(const char * s)
{
int d0;
register int __res;
__asm__ __volatile__(
        "repne\n\t"
        "scasb\n\t"
        "notl %0\n\t"
        "decl %0"
        :"=c" (__res), "=&D" (d0)
        :"1" (s),"a" (0), "0" (0xffffffffu)
        :"memory");
return __res;
}

static inline __attribute__((always_inline)) __attribute__((always_inline)) void * __memcpy(void * to, const void * from, size_t n)
{
int d0, d1, d2;
__asm__ __volatile__(
        "rep ; movsl\n\t"
        "movl %4,%%ecx\n\t"
        "andl $3,%%ecx\n\t"

        "jz 1f\n\t"

        "rep ; movsb\n\t"
        "1:"
        : "=&c" (d0), "=&D" (d1), "=&S" (d2)
        : "0" (n/4), "g" (n), "1" ((long) to), "2" ((long) from)
        : "memory");
return (to);
}





static inline __attribute__((always_inline)) __attribute__((always_inline)) void * __constant_memcpy(void * to, const void * from, size_t n)
{
        long esi, edi;
        if (!n) return to;

        switch (n) {
                case 1: *(char*)to = *(char*)from; return to;
                case 2: *(short*)to = *(short*)from; return to;
                case 4: *(int*)to = *(int*)from; return to;

                case 3: *(short*)to = *(short*)from;
                        *((char*)to+2) = *((char*)from+2); return to;
                case 5: *(int*)to = *(int*)from;
                        *((char*)to+4) = *((char*)from+4); return to;
                case 6: *(int*)to = *(int*)from;
                        *((short*)to+2) = *((short*)from+2); return to;
                case 8: *(int*)to = *(int*)from;
                        *((int*)to+1) = *((int*)from+1); return to;

        }

        esi = (long) from;
        edi = (long) to;
        if (n >= 5*4) {

                int ecx;
                __asm__ __volatile__(
                        "rep ; movsl"
                        : "=&c" (ecx), "=&D" (edi), "=&S" (esi)
                        : "0" (n/4), "1" (edi),"2" (esi)
                        : "memory"
                );
        } else {

                if (n >= 4*4) __asm__ __volatile__("movsl"
                        :"=&D"(edi),"=&S"(esi):"0"(edi),"1"(esi):"memory");
                if (n >= 3*4) __asm__ __volatile__("movsl"
                        :"=&D"(edi),"=&S"(esi):"0"(edi),"1"(esi):"memory");
                if (n >= 2*4) __asm__ __volatile__("movsl"
                        :"=&D"(edi),"=&S"(esi):"0"(edi),"1"(esi):"memory");
                if (n >= 1*4) __asm__ __volatile__("movsl"
                        :"=&D"(edi),"=&S"(esi):"0"(edi),"1"(esi):"memory");
        }
        switch (n % 4) {

                case 0: return to;
                case 1: __asm__ __volatile__("movsb"
                        :"=&D"(edi),"=&S"(esi):"0"(edi),"1"(esi):"memory");
                        return to;
                case 2: __asm__ __volatile__("movsw"
                        :"=&D"(edi),"=&S"(esi):"0"(edi),"1"(esi):"memory");
                        return to;
                default: __asm__ __volatile__("movsw\n\tmovsb"
                        :"=&D"(edi),"=&S"(esi):"0"(edi),"1"(esi):"memory");
                        return to;
        }
}
# 326 "include/asm/string.h"
void *memmove(void * dest,const void * src, size_t n);




static inline __attribute__((always_inline)) void * memchr(const void * cs,int c,size_t count)
{
int d0;
register void * __res;
if (!count)
        return ((void *)0);
__asm__ __volatile__(
        "repne\n\t"
        "scasb\n\t"
        "je 1f\n\t"
        "movl $1,%0\n"
        "1:\tdecl %0"
        :"=D" (__res), "=&c" (d0)
        :"a" (c),"0" (cs),"1" (count)
        :"memory");
return __res;
}

static inline __attribute__((always_inline)) void * __memset_generic(void * s, char c,size_t count)
{
int d0, d1;
__asm__ __volatile__(
        "rep\n\t"
        "stosb"
        : "=&c" (d0), "=&D" (d1)
        :"a" (c),"1" (s),"0" (count)
        :"memory");
return s;
}
# 369 "include/asm/string.h"
static inline __attribute__((always_inline)) __attribute__((always_inline)) void * __constant_c_memset(void * s, unsigned long c, size_t count)
{
int d0, d1;
__asm__ __volatile__(
        "rep ; stosl\n\t"
        "testb $2,%b3\n\t"
        "je 1f\n\t"
        "stosw\n"
        "1:\ttestb $1,%b3\n\t"
        "je 2f\n\t"
        "stosb\n"
        "2:"
        :"=&c" (d0), "=&D" (d1)
        :"a" (c), "q" (count), "0" (count/4), "1" ((long) s)
        :"memory");
return (s);
}



static inline __attribute__((always_inline)) size_t strnlen(const char * s, size_t count)
{
int d0;
register int __res;
__asm__ __volatile__(
        "movl %2,%0\n\t"
        "jmp 2f\n"
        "1:\tcmpb $0,(%0)\n\t"
        "je 3f\n\t"
        "incl %0\n"
        "2:\tdecl %1\n\t"
        "cmpl $-1,%1\n\t"
        "jne 1b\n"
        "3:\tsubl %2,%0"
        :"=a" (__res), "=&d" (d0)
        :"c" (s),"1" (count)
        :"memory");
return __res;
}




extern char *strstr(const char *cs, const char *ct);





static inline __attribute__((always_inline)) __attribute__((always_inline)) void * __constant_c_and_count_memset(void * s, unsigned long pattern, size_t count)
{
        switch (count) {
                case 0:
                        return s;
                case 1:
                        *(unsigned char *)s = pattern;
                        return s;
                case 2:
                        *(unsigned short *)s = pattern;
                        return s;
                case 3:
                        *(unsigned short *)s = pattern;
                        *(2+(unsigned char *)s) = pattern;
                        return s;
                case 4:
                        *(unsigned long *)s = pattern;
                        return s;
        }







{
        int d0, d1;
        switch (count % 4) {
                case 0: __asm__ __volatile__( "rep ; stosl" "" : "=&c" (d0), "=&D" (d1) : "a" (pattern),"0" (count/4),"1" ((long) s) : "memory"); return s;
                case 1: __asm__ __volatile__( "rep ; stosl" "\n\tstosb" : "=&c" (d0), "=&D" (d1) : "a" (pattern),"0" (count/4),"1" ((long) s) : "memory"); return s;
                case 2: __asm__ __volatile__( "rep ; stosl" "\n\tstosw" : "=&c" (d0), "=&D" (d1) : "a" (pattern),"0" (count/4),"1" ((long) s) : "memory"); return s;
                default: __asm__ __volatile__( "rep ; stosl" "\n\tstosw\n\tstosb" : "=&c" (d0), "=&D" (d1) : "a" (pattern),"0" (count/4),"1" ((long) s) : "memory"); return s;
        }
}


}
# 477 "include/asm/string.h"
static inline __attribute__((always_inline)) void * memscan(void * addr, int c, size_t size)
{
        if (!size)
                return addr;
        __asm__("repnz; scasb\n\t"
                "jnz 1f\n\t"
                "dec %%edi\n"
                "1:"
                : "=D" (addr), "=c" (size)
                : "0" (addr), "1" (size), "a" (c)
                : "memory");
        return addr;
}
# 22 "include/linux/string.h" 2
# 30 "include/linux/string.h"
size_t strlcpy(char *, const char *, size_t);
# 39 "include/linux/string.h"
extern size_t strlcat(char *, const char *, __kernel_size_t);
# 48 "include/linux/string.h"
extern int strnicmp(const char *, const char *, __kernel_size_t);





extern char * strnchr(const char *, size_t, int);




extern char * strstrip(char *);
# 70 "include/linux/string.h"
extern char * strpbrk(const char *,const char *);


extern char * strsep(char **,const char *);


extern __kernel_size_t strspn(const char *,const char *);


extern __kernel_size_t strcspn(const char *,const char *);
# 95 "include/linux/string.h"
extern int __builtin_memcmp(const void *,const void *,__kernel_size_t);





extern char *kstrdup(const char *s, gfp_t gfp);
extern void *kmemdup(const void *src, size_t len, gfp_t gfp);
# 9 "include/linux/bitmap.h" 2
# 84 "include/linux/bitmap.h"
extern int __bitmap_empty(const unsigned long *bitmap, int bits);
extern int __bitmap_full(const unsigned long *bitmap, int bits);
extern int __bitmap_equal(const unsigned long *bitmap1,
                        const unsigned long *bitmap2, int bits);
extern void __bitmap_complement(unsigned long *dst, const unsigned long *src,
                        int bits);
extern void __bitmap_shift_right(unsigned long *dst,
                        const unsigned long *src, int shift, int bits);
extern void __bitmap_shift_left(unsigned long *dst,
                        const unsigned long *src, int shift, int bits);
extern void __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
                        const unsigned long *bitmap2, int bits);
extern void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
                        const unsigned long *bitmap2, int bits);
extern void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
                        const unsigned long *bitmap2, int bits);
extern void __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
                        const unsigned long *bitmap2, int bits);
extern int __bitmap_intersects(const unsigned long *bitmap1,
                        const unsigned long *bitmap2, int bits);
extern int __bitmap_subset(const unsigned long *bitmap1,
                        const unsigned long *bitmap2, int bits);
extern int __bitmap_weight(const unsigned long *bitmap, int bits);

extern int bitmap_scnprintf(char *buf, unsigned int len,
                        const unsigned long *src, int nbits);
extern int __bitmap_parse(const char *buf, unsigned int buflen, int is_user,
                        unsigned long *dst, int nbits);
extern int bitmap_parse_user(const char *ubuf, unsigned int ulen,
                        unsigned long *dst, int nbits);
extern int bitmap_scnlistprintf(char *buf, unsigned int len,
                        const unsigned long *src, int nbits);
extern int bitmap_parselist(const char *buf, unsigned long *maskp,
                        int nmaskbits);
extern void bitmap_remap(unsigned long *dst, const unsigned long *src,
                const unsigned long *old, const unsigned long *new, int bits);
extern int bitmap_bitremap(int oldbit,
                const unsigned long *old, const unsigned long *new, int bits);
extern int bitmap_find_free_region(unsigned long *bitmap, int bits, int order);
extern void bitmap_release_region(unsigned long *bitmap, int pos, int order);
extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);







static inline __attribute__((always_inline)) void bitmap_zero(unsigned long *dst, int nbits)
{
        if (nbits <= 32)
                *dst = 0UL;
        else {
                int len = (((nbits)+32 -1)/32) * sizeof(unsigned long);
                (__builtin_constant_p(0) ? (__builtin_constant_p((len)) ? __constant_c_and_count_memset(((dst)),((0x01010101UL*(unsigned char)(0))),((len))) : __constant_c_memset(((dst)),((0x01010101UL*(unsigned char)(0))),((len)))) : (__builtin_constant_p((len)) ? __memset_generic((((dst))),(((0))),(((len)))) : __memset_generic(((dst)),((0)),((len)))));
        }
}

static inline __attribute__((always_inline)) void bitmap_fill(unsigned long *dst, int nbits)
{
        size_t nlongs = (((nbits)+32 -1)/32);
        if (nlongs > 1) {
                int len = (nlongs - 1) * sizeof(unsigned long);
                (__builtin_constant_p(0xff) ? (__builtin_constant_p((len)) ? __constant_c_and_count_memset(((dst)),((0x01010101UL*(unsigned char)(0xff))),((len))) : __constant_c_memset(((dst)),((0x01010101UL*(unsigned char)(0xff))),((len)))) : (__builtin_constant_p((len)) ? __memset_generic((((dst))),(((0xff))),(((len)))) : __memset_generic(((dst)),((0xff)),((len)))));
        }
        dst[nlongs - 1] = ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL );
}

static inline __attribute__((always_inline)) void bitmap_copy(unsigned long *dst, const unsigned long *src,
                        int nbits)
{
        if (nbits <= 32)
                *dst = *src;
        else {
                int len = (((nbits)+32 -1)/32) * sizeof(unsigned long);
                (__builtin_constant_p(len) ? __constant_memcpy((dst),(src),(len)) : __memcpy((dst),(src),(len)));
        }
}

static inline __attribute__((always_inline)) void bitmap_and(unsigned long *dst, const unsigned long *src1,
                        const unsigned long *src2, int nbits)
{
        if (nbits <= 32)
                *dst = *src1 & *src2;
        else
                __bitmap_and(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline)) void bitmap_or(unsigned long *dst, const unsigned long *src1,
                        const unsigned long *src2, int nbits)
{
        if (nbits <= 32)
                *dst = *src1 | *src2;
        else
                __bitmap_or(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline)) void bitmap_xor(unsigned long *dst, const unsigned long *src1,
                        const unsigned long *src2, int nbits)
{
        if (nbits <= 32)
                *dst = *src1 ^ *src2;
        else
                __bitmap_xor(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline)) void bitmap_andnot(unsigned long *dst, const unsigned long *src1,
                        const unsigned long *src2, int nbits)
{
        if (nbits <= 32)
                *dst = *src1 & ~(*src2);
        else
                __bitmap_andnot(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline)) void bitmap_complement(unsigned long *dst, const unsigned long *src,
                        int nbits)
{
        if (nbits <= 32)
                *dst = ~(*src) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL );
        else
                __bitmap_complement(dst, src, nbits);
}

static inline __attribute__((always_inline)) int bitmap_equal(const unsigned long *src1,
                        const unsigned long *src2, int nbits)
{
        if (nbits <= 32)
                return ! ((*src1 ^ *src2) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
        else
                return __bitmap_equal(src1, src2, nbits);
}

static inline __attribute__((always_inline)) int bitmap_intersects(const unsigned long *src1,
                        const unsigned long *src2, int nbits)
{
        if (nbits <= 32)
                return ((*src1 & *src2) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL )) != 0;
        else
                return __bitmap_intersects(src1, src2, nbits);
}

static inline __attribute__((always_inline)) int bitmap_subset(const unsigned long *src1,
                        const unsigned long *src2, int nbits)
{
        if (nbits <= 32)
                return ! ((*src1 & ~(*src2)) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
        else
                return __bitmap_subset(src1, src2, nbits);
}

static inline __attribute__((always_inline)) int bitmap_empty(const unsigned long *src, int nbits)
{
        if (nbits <= 32)
                return ! (*src & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
        else
                return __bitmap_empty(src, nbits);
}

static inline __attribute__((always_inline)) int bitmap_full(const unsigned long *src, int nbits)
{
        if (nbits <= 32)
                return ! (~(*src) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
        else
                return __bitmap_full(src, nbits);
}

static inline __attribute__((always_inline)) int bitmap_weight(const unsigned long *src, int nbits)
{
        if (nbits <= 32)
                return hweight_long(*src & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
        return __bitmap_weight(src, nbits);
}

static inline __attribute__((always_inline)) void bitmap_shift_right(unsigned long *dst,
                        const unsigned long *src, int n, int nbits)
{
        if (nbits <= 32)
                *dst = *src >> n;
        else
                __bitmap_shift_right(dst, src, n, nbits);
}

static inline __attribute__((always_inline)) void bitmap_shift_left(unsigned long *dst,
                        const unsigned long *src, int n, int nbits)
{
        if (nbits <= 32)
                *dst = (*src << n) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL );
        else
                __bitmap_shift_left(dst, src, n, nbits);
}

static inline __attribute__((always_inline)) int bitmap_parse(const char *buf, unsigned int buflen,
                        unsigned long *maskp, int nmaskbits)
{
        return __bitmap_parse(buf, buflen, 0, maskp, nmaskbits);
}
# 87 "include/linux/cpumask.h" 2

typedef struct { unsigned long bits[(((32)+32 -1)/32)]; } cpumask_t;
extern cpumask_t _unused_cpumask_arg_;


static inline __attribute__((always_inline)) void __cpu_set(int cpu, volatile cpumask_t *dstp)
{
        set_bit(cpu, dstp->bits);
}


static inline __attribute__((always_inline)) void __cpu_clear(int cpu, volatile cpumask_t *dstp)
{
        clear_bit(cpu, dstp->bits);
}


static inline __attribute__((always_inline)) void __cpus_setall(cpumask_t *dstp, int nbits)
{
        bitmap_fill(dstp->bits, nbits);
}


static inline __attribute__((always_inline)) void __cpus_clear(cpumask_t *dstp, int nbits)
{
        bitmap_zero(dstp->bits, nbits);
}





static inline __attribute__((always_inline)) int __cpu_test_and_set(int cpu, cpumask_t *addr)
{
        return test_and_set_bit(cpu, addr->bits);
}


static inline __attribute__((always_inline)) void __cpus_and(cpumask_t *dstp, const cpumask_t *src1p,
                                        const cpumask_t *src2p, int nbits)
{
        bitmap_and(dstp->bits, src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) void __cpus_or(cpumask_t *dstp, const cpumask_t *src1p,
                                        const cpumask_t *src2p, int nbits)
{
        bitmap_or(dstp->bits, src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) void __cpus_xor(cpumask_t *dstp, const cpumask_t *src1p,
                                        const cpumask_t *src2p, int nbits)
{
        bitmap_xor(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) void __cpus_andnot(cpumask_t *dstp, const cpumask_t *src1p,
                                        const cpumask_t *src2p, int nbits)
{
        bitmap_andnot(dstp->bits, src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) void __cpus_complement(cpumask_t *dstp,
                                        const cpumask_t *srcp, int nbits)
{
        bitmap_complement(dstp->bits, srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_equal(const cpumask_t *src1p,
                                        const cpumask_t *src2p, int nbits)
{
        return bitmap_equal(src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_intersects(const cpumask_t *src1p,
                                        const cpumask_t *src2p, int nbits)
{
        return bitmap_intersects(src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_subset(const cpumask_t *src1p,
                                        const cpumask_t *src2p, int nbits)
{
        return bitmap_subset(src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_empty(const cpumask_t *srcp, int nbits)
{
        return bitmap_empty(srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_full(const cpumask_t *srcp, int nbits)
{
        return bitmap_full(srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_weight(const cpumask_t *srcp, int nbits)
{
        return bitmap_weight(srcp->bits, nbits);
}



static inline __attribute__((always_inline)) void __cpus_shift_right(cpumask_t *dstp,
                                        const cpumask_t *srcp, int n, int nbits)
{
        bitmap_shift_right(dstp->bits, srcp->bits, n, nbits);
}



static inline __attribute__((always_inline)) void __cpus_shift_left(cpumask_t *dstp,
                                        const cpumask_t *srcp, int n, int nbits)
{
        bitmap_shift_left(dstp->bits, srcp->bits, n, nbits);
}


int __first_cpu(const cpumask_t *srcp);

int __next_cpu(int n, const cpumask_t *srcp);
# 270 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) int __cpumask_scnprintf(char *buf, int len,
                                        const cpumask_t *srcp, int nbits)
{
        return bitmap_scnprintf(buf, len, srcp->bits, nbits);
}



static inline __attribute__((always_inline)) int __cpumask_parse_user(const char *buf, int len,
                                        cpumask_t *dstp, int nbits)
{
        return bitmap_parse_user(buf, len, dstp->bits, nbits);
}



static inline __attribute__((always_inline)) int __cpulist_scnprintf(char *buf, int len,
                                        const cpumask_t *srcp, int nbits)
{
        return bitmap_scnlistprintf(buf, len, srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpulist_parse(const char *buf, cpumask_t *dstp, int nbits)
{
        return bitmap_parselist(buf, dstp->bits, nbits);
}



static inline __attribute__((always_inline)) int __cpu_remap(int oldbit,
                const cpumask_t *oldp, const cpumask_t *newp, int nbits)
{
        return bitmap_bitremap(oldbit, oldp->bits, newp->bits, nbits);
}



static inline __attribute__((always_inline)) void __cpus_remap(cpumask_t *dstp, const cpumask_t *srcp,
                const cpumask_t *oldp, const cpumask_t *newp, int nbits)
{
        bitmap_remap(dstp->bits, srcp->bits, oldp->bits, newp->bits, nbits);
}
# 380 "include/linux/cpumask.h"
extern cpumask_t cpu_possible_map;
extern cpumask_t cpu_online_map;
extern cpumask_t cpu_present_map;
# 401 "include/linux/cpumask.h"
int highest_possible_processor_id(void);

int __any_online_cpu(const cpumask_t *mask);
# 23 "include/asm/processor.h" 2
# 1 "include/linux/init.h" 1
# 63 "include/linux/init.h"
typedef int (*initcall_t)(void);
typedef void (*exitcall_t)(void);

extern initcall_t __con_initcall_start[], __con_initcall_end[];
extern initcall_t __security_initcall_start[], __security_initcall_end[];


extern char saved_command_line[];
extern unsigned int reset_devices;


extern void setup_arch(char **);
# 133 "include/linux/init.h"
struct obs_kernel_param {
        const char *str;
        int (*setup_func)(char *);
        int early;
};
# 168 "include/linux/init.h"
void __attribute__ ((__section__ (".init.text"))) parse_early_param(void);
# 24 "include/asm/processor.h" 2


extern int tsc_disable;

struct desc_struct {
        unsigned long a,b;
};
# 49 "include/asm/processor.h"
struct cpuinfo_x86 {
        __u8 x86;
        __u8 x86_vendor;
        __u8 x86_model;
        __u8 x86_mask;
        char wp_works_ok;
        char hlt_works_ok;
        char hard_math;
        char rfu;
        int cpuid_level;
        unsigned long x86_capability[7];
        char x86_vendor_id[16];
        char x86_model_id[64];
        int x86_cache_size;

        int x86_cache_alignment;
        char fdiv_bug;
        char f00f_bug;
        char coma_bug;
        char pad0;
        int x86_power;
        unsigned long loops_per_jiffy;

        cpumask_t llc_shared_map;

        unsigned char x86_max_cores;
        unsigned char apicid;
        unsigned short x86_clflush_size;

        unsigned char booted_cores;
        __u8 phys_proc_id;
        __u8 cpu_core_id;

} __attribute__((__aligned__((1 << (7)))));
# 100 "include/asm/processor.h"
extern struct cpuinfo_x86 boot_cpu_data;
extern struct cpuinfo_x86 new_cpu_data;
extern struct tss_struct doublefault_tss;
extern __typeof__(struct tss_struct) per_cpu__init_tss;


extern struct cpuinfo_x86 cpu_data[];






extern int cpu_llc_id[32];
extern char ignore_fpu_irq;

void __attribute__ ((__section__ (".init.text"))) cpu_detect(struct cpuinfo_x86 *c);

extern void identify_cpu(struct cpuinfo_x86 *);
extern void print_cpu_info(struct cpuinfo_x86 *);
extern unsigned int init_intel_cacheinfo(struct cpuinfo_x86 *c);
extern unsigned short num_cache_leaves;


extern void detect_ht(struct cpuinfo_x86 *c);
# 150 "include/asm/processor.h"
static inline __attribute__((always_inline)) __attribute__((regparm(3))) void native_cpuid(unsigned int *eax, unsigned int *ebx,
                                         unsigned int *ecx, unsigned int *edx)
{

        __asm__("cpuid"
                : "=a" (*eax),
                  "=b" (*ebx),
                  "=c" (*ecx),
                  "=d" (*edx)
                : "0" (*eax), "2" (*ecx));
}
# 185 "include/asm/processor.h"
extern unsigned long mmu_cr4_features;

static inline __attribute__((always_inline)) void set_in_cr4 (unsigned long mask)
{
        unsigned cr4;
        mmu_cr4_features |= mask;
        cr4 = ({ unsigned int __dummy; __asm__( "movl %%cr4,%0\n\t" :"=r" (__dummy)); __dummy; });
        cr4 |= mask;
        __asm__ __volatile__("movl %0,%%cr4": :"r" (cr4));
}

static inline __attribute__((always_inline)) void clear_in_cr4 (unsigned long mask)
{
        unsigned cr4;
        mmu_cr4_features &= ~mask;
        cr4 = ({ unsigned int __dummy; __asm__( "movl %%cr4,%0\n\t" :"=r" (__dummy)); __dummy; });
        cr4 &= ~mask;
        __asm__ __volatile__("movl %0,%%cr4": :"r" (cr4));
}
# 237 "include/asm/processor.h"
static inline __attribute__((always_inline)) void sync_core(void)
{
        int tmp;
        asm volatile("cpuid" : "=a" (tmp) : "0" (1) : "ebx","ecx","edx","memory");
}

static inline __attribute__((always_inline)) void __monitor(const void *eax, unsigned long ecx,
                unsigned long edx)
{

        asm volatile(
                ".byte 0x0f,0x01,0xc8;"
                : :"a" (eax), "c" (ecx), "d"(edx));
}

static inline __attribute__((always_inline)) void __mwait(unsigned long eax, unsigned long ecx)
{

        asm volatile(
                ".byte 0x0f,0x01,0xc9;"
                : :"a" (eax), "c" (ecx));
}

extern void mwait_idle_with_hints(unsigned long eax, unsigned long ecx);



extern unsigned int machine_id;
extern unsigned int machine_submodel_id;
extern unsigned int BIOS_revision;
extern unsigned int mca_pentium_flag;


extern int bootloader_type;
# 294 "include/asm/processor.h"
struct i387_fsave_struct {
        long cwd;
        long swd;
        long twd;
        long fip;
        long fcs;
        long foo;
        long fos;
        long st_space[20];
        long status;
};

struct i387_fxsave_struct {
        unsigned short cwd;
        unsigned short swd;
        unsigned short twd;
        unsigned short fop;
        long fip;
        long fcs;
        long foo;
        long fos;
        long mxcsr;
        long mxcsr_mask;
        long st_space[32];
        long xmm_space[32];
        long padding[56];
} __attribute__ ((aligned (16)));

struct i387_soft_struct {
        long cwd;
        long swd;
        long twd;
        long fip;
        long fcs;
        long foo;
        long fos;
        long st_space[20];
        unsigned char ftop, changed, lookahead, no_update, rm, alimit;
        struct info *info;
        unsigned long entry_eip;
};

union i387_union {
        struct i387_fsave_struct fsave;
        struct i387_fxsave_struct fxsave;
        struct i387_soft_struct soft;
};

typedef struct {
        unsigned long seg;
} mm_segment_t;

struct thread_struct;

struct tss_struct {
        unsigned short back_link,__blh;
        unsigned long esp0;
        unsigned short ss0,__ss0h;
        unsigned long esp1;
        unsigned short ss1,__ss1h;
        unsigned long esp2;
        unsigned short ss2,__ss2h;
        unsigned long __cr3;
        unsigned long eip;
        unsigned long eflags;
        unsigned long eax,ecx,edx,ebx;
        unsigned long esp;
        unsigned long ebp;
        unsigned long esi;
        unsigned long edi;
        unsigned short es, __esh;
        unsigned short cs, __csh;
        unsigned short ss, __ssh;
        unsigned short ds, __dsh;
        unsigned short fs, __fsh;
        unsigned short gs, __gsh;
        unsigned short ldt, __ldth;
        unsigned short trace, io_bitmap_base;






        unsigned long io_bitmap[((65536/8)/sizeof(long)) + 1];



        unsigned long io_bitmap_max;
        struct thread_struct *io_bitmap_owner;



        unsigned long __cacheline_filler[35];



        unsigned long stack[64];
} __attribute__((packed));



struct thread_struct {

        struct desc_struct tls_array[3];
        unsigned long esp0;
        unsigned long sysenter_cs;
        unsigned long eip;
        unsigned long esp;
        unsigned long fs;
        unsigned long gs;

        unsigned long debugreg[8];

        unsigned long cr2, trap_no, error_code;

        union i387_union i387;

        struct vm86_struct * vm86_info;
        unsigned long screen_bitmap;
        unsigned long v86flags, v86mask, saved_esp0;
        unsigned int saved_fs, saved_gs;

        unsigned long *io_bitmap_ptr;
        unsigned long iopl;

        unsigned long io_bitmap_max;
};
# 457 "include/asm/processor.h"
struct task_struct;
struct mm_struct;


extern void release_thread(struct task_struct *);


extern void prepare_to_copy(struct task_struct *tsk);




extern int kernel_thread(int (*fn)(void *), void * arg, unsigned long flags);

extern unsigned long thread_saved_pc(struct task_struct *tsk);
void show_trace(struct task_struct *task, struct pt_regs *regs, unsigned long *stack);

unsigned long get_wchan(struct task_struct *p);
# 504 "include/asm/processor.h"
struct microcode_header {
        unsigned int hdrver;
        unsigned int rev;
        unsigned int date;
        unsigned int sig;
        unsigned int cksum;
        unsigned int ldrver;
        unsigned int pf;
        unsigned int datasize;
        unsigned int totalsize;
        unsigned int reserved[3];
};

struct microcode {
        struct microcode_header hdr;
        unsigned int bits[0];
};

typedef struct microcode microcode_t;
typedef struct microcode_header microcode_header_t;


struct extended_signature {
        unsigned int sig;
        unsigned int pf;
        unsigned int cksum;
};

struct extended_sigtable {
        unsigned int count;
        unsigned int cksum;
        unsigned int reserved[3];
        struct extended_signature sigs[0];
};


static inline __attribute__((always_inline)) void rep_nop(void)
{
        __asm__ __volatile__("rep;nop": : :"memory");
}
# 553 "include/asm/processor.h"
static inline __attribute__((always_inline)) void load_esp0(struct tss_struct *tss, struct thread_struct *thread)
{
        tss->esp0 = thread->esp0;

        if (__builtin_expect(!!(tss->ss1 != thread->sysenter_cs), 0)) {
                tss->ss1 = thread->sysenter_cs;
                __asm__ __volatile__("wrmsr" : : "c" (0x174), "a" (thread->sysenter_cs), "d" (0));
        }
}
# 580 "include/asm/processor.h"
static __attribute__((regparm(3))) inline __attribute__((always_inline)) void native_set_iopl_mask(unsigned mask)
{
        unsigned int reg;
        __asm__ __volatile__ ("pushfl;"
                              "popl %0;"
                              "andl %1, %0;"
                              "orl %2, %0;"
                              "pushl %0;"
                              "popfl"
                                : "=&r" (reg)
                                : "i" (~0x00003000), "r" (mask));
}






static inline __attribute__((always_inline)) void cpuid(unsigned int op, unsigned int *eax, unsigned int *ebx, unsigned int *ecx, unsigned int *edx)
{
        *eax = op;
        *ecx = 0;
        native_cpuid(eax, ebx, ecx, edx);
}


static inline __attribute__((always_inline)) void cpuid_count(int op, int count, int *eax, int *ebx, int *ecx,
                               int *edx)
{
        *eax = op;
        *ecx = count;
        native_cpuid(eax, ebx, ecx, edx);
}




static inline __attribute__((always_inline)) unsigned int cpuid_eax(unsigned int op)
{
        unsigned int eax, ebx, ecx, edx;

        cpuid(op, &eax, &ebx, &ecx, &edx);
        return eax;
}
static inline __attribute__((always_inline)) unsigned int cpuid_ebx(unsigned int op)
{
        unsigned int eax, ebx, ecx, edx;

        cpuid(op, &eax, &ebx, &ecx, &edx);
        return ebx;
}
static inline __attribute__((always_inline)) unsigned int cpuid_ecx(unsigned int op)
{
        unsigned int eax, ebx, ecx, edx;

        cpuid(op, &eax, &ebx, &ecx, &edx);
        return ecx;
}
static inline __attribute__((always_inline)) unsigned int cpuid_edx(unsigned int op)
{
        unsigned int eax, ebx, ecx, edx;

        cpuid(op, &eax, &ebx, &ecx, &edx);
        return edx;
}
# 714 "include/asm/processor.h"
static inline __attribute__((always_inline)) void prefetch(const void *x)
{
        asm volatile ("661:\n\t" ".byte 0x8d,0x74,0x26,0x00\n" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "prefetchnta (%1)" "\n664:\n" ".previous" :: "i" ((0*32+25)), "r" (x));



}







static inline __attribute__((always_inline)) void prefetchw(const void *x)
{
        asm volatile ("661:\n\t" ".byte 0x8d,0x74,0x26,0x00\n" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "prefetchw (%1)" "\n664:\n" ".previous" :: "i" ((1*32+31)), "r" (x));



}


extern void select_idle_routine(const struct cpuinfo_x86 *c);



extern unsigned long boot_option_idle_override;
extern void enable_sep_cpu(void);
extern int sysenter_setup(void);

extern int init_gdt(int cpu, struct task_struct *idle);
extern void cpu_set_gdt(int);
extern void secondary_cpu_init(void);
# 17 "include/asm/thread_info.h" 2
# 27 "include/asm/thread_info.h"
struct thread_info {
        struct task_struct *task;
        struct exec_domain *exec_domain;
        unsigned long flags;
        unsigned long status;
        __u32 cpu;
        int preempt_count;


        mm_segment_t addr_limit;



        void *sysenter_return;
        struct restart_block restart_block;

        unsigned long previous_esp;


        __u8 supervisor_stack[0];
};
# 88 "include/asm/thread_info.h"
register unsigned long current_stack_pointer asm("esp") __attribute__((__unused__));


static inline __attribute__((always_inline)) struct thread_info *current_thread_info(void)
{
        return (struct thread_info *)(current_stack_pointer & ~((8192) - 1));
}
# 22 "include/linux/thread_info.h" 2
# 30 "include/linux/thread_info.h"
static inline __attribute__((always_inline)) void set_ti_thread_flag(struct thread_info *ti, int flag)
{
        set_bit(flag,&ti->flags);
}

static inline __attribute__((always_inline)) void clear_ti_thread_flag(struct thread_info *ti, int flag)
{
        clear_bit(flag,&ti->flags);
}

static inline __attribute__((always_inline)) int test_and_set_ti_thread_flag(struct thread_info *ti, int flag)
{
        return test_and_set_bit(flag,&ti->flags);
}

static inline __attribute__((always_inline)) int test_and_clear_ti_thread_flag(struct thread_info *ti, int flag)
{
        return test_and_clear_bit(flag,&ti->flags);
}

static inline __attribute__((always_inline)) int test_ti_thread_flag(struct thread_info *ti, int flag)
{
        return (__builtin_constant_p(flag) ? constant_test_bit((flag),(&ti->flags)) : variable_test_bit((flag),(&ti->flags)));
}
# 10 "include/linux/preempt.h" 2
# 50 "include/linux/spinlock.h" 2




# 1 "include/linux/stringify.h" 1
# 55 "include/linux/spinlock.h" 2
# 1 "include/linux/bottom_half.h" 1



extern void local_bh_disable(void);
extern void __local_bh_enable(void);
extern void _local_bh_enable(void);
extern void local_bh_enable(void);
extern void local_bh_enable_ip(unsigned long ip);
# 56 "include/linux/spinlock.h" 2
# 79 "include/linux/spinlock.h"
# 1 "include/linux/spinlock_types.h" 1
# 12 "include/linux/spinlock_types.h"
# 1 "include/linux/lockdep.h" 1
# 11 "include/linux/lockdep.h"
struct task_struct;
# 251 "include/linux/lockdep.h"
static inline __attribute__((always_inline)) void lockdep_off(void)
{
}

static inline __attribute__((always_inline)) void lockdep_on(void)
{
}
# 277 "include/linux/lockdep.h"
struct lock_class_key { };
# 286 "include/linux/lockdep.h"
static inline __attribute__((always_inline)) void early_init_irq_lock_class(void)
{
}







static inline __attribute__((always_inline)) void early_boot_irqs_off(void)
{
}
static inline __attribute__((always_inline)) void early_boot_irqs_on(void)
{
}
static inline __attribute__((always_inline)) void print_irqtrace_events(struct task_struct *curr)
{
}
# 13 "include/linux/spinlock_types.h" 2


# 1 "include/asm/spinlock_types.h" 1







typedef struct {
        unsigned int slock;
} raw_spinlock_t;



typedef struct {
        unsigned int lock;
} raw_rwlock_t;
# 16 "include/linux/spinlock_types.h" 2




typedef struct {
        raw_spinlock_t raw_lock;
# 32 "include/linux/spinlock_types.h"
} spinlock_t;



typedef struct {
        raw_rwlock_t raw_lock;
# 48 "include/linux/spinlock_types.h"
} rwlock_t;
# 80 "include/linux/spinlock.h" 2

extern int __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) generic__raw_read_trylock(raw_rwlock_t *lock);





# 1 "include/asm/spinlock.h" 1



# 1 "include/asm/atomic.h" 1
# 17 "include/asm/atomic.h"
typedef struct { int counter; } atomic_t;
# 45 "include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) void atomic_add(int i, atomic_t *v)
{
        __asm__ __volatile__(
                ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "addl %1,%0"
                :"+m" (v->counter)
                :"ir" (i));
}
# 60 "include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) void atomic_sub(int i, atomic_t *v)
{
        __asm__ __volatile__(
                ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "subl %1,%0"
                :"+m" (v->counter)
                :"ir" (i));
}
# 77 "include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) int atomic_sub_and_test(int i, atomic_t *v)
{
        unsigned char c;

        __asm__ __volatile__(
                ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "subl %2,%0; sete %1"
                :"+m" (v->counter), "=qm" (c)
                :"ir" (i) : "memory");
        return c;
}







static __inline__ __attribute__((always_inline)) void atomic_inc(atomic_t *v)
{
        __asm__ __volatile__(
                ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "incl %0"
                :"+m" (v->counter));
}







static __inline__ __attribute__((always_inline)) void atomic_dec(atomic_t *v)
{
        __asm__ __volatile__(
                ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "decl %0"
                :"+m" (v->counter));
}
# 122 "include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) int atomic_dec_and_test(atomic_t *v)
{
        unsigned char c;

        __asm__ __volatile__(
                ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "decl %0; sete %1"
                :"+m" (v->counter), "=qm" (c)
                : : "memory");
        return c != 0;
}
# 141 "include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) int atomic_inc_and_test(atomic_t *v)
{
        unsigned char c;

        __asm__ __volatile__(
                ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "incl %0; sete %1"
                :"+m" (v->counter), "=qm" (c)
                : : "memory");
        return c != 0;
}
# 161 "include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) int atomic_add_negative(int i, atomic_t *v)
{
        unsigned char c;

        __asm__ __volatile__(
                ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "addl %2,%0; sets %1"
                :"+m" (v->counter), "=qm" (c)
                :"ir" (i) : "memory");
        return c;
}
# 179 "include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) int atomic_add_return(int i, atomic_t *v)
{
        int __i;






        __i = i;
        __asm__ __volatile__(
                ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "xaddl %0, %1"
                :"+r" (i), "+m" (v->counter)
                : : "memory");
        return i + __i;
# 203 "include/asm/atomic.h"
}

static __inline__ __attribute__((always_inline)) int atomic_sub_return(int i, atomic_t *v)
{
        return atomic_add_return(-i,v);
}
# 256 "include/asm/atomic.h"
# 1 "include/asm-generic/atomic.h" 1
# 71 "include/asm-generic/atomic.h"
typedef atomic_t atomic_long_t;


static inline __attribute__((always_inline)) long atomic_long_read(atomic_long_t *l)
{
        atomic_t *v = (atomic_t *)l;

        return (long)((v)->counter);
}

static inline __attribute__((always_inline)) void atomic_long_set(atomic_long_t *l, long i)
{
        atomic_t *v = (atomic_t *)l;

        (((v)->counter) = (i));
}

static inline __attribute__((always_inline)) void atomic_long_inc(atomic_long_t *l)
{
        atomic_t *v = (atomic_t *)l;

        atomic_inc(v);
}

static inline __attribute__((always_inline)) void atomic_long_dec(atomic_long_t *l)
{
        atomic_t *v = (atomic_t *)l;

        atomic_dec(v);
}

static inline __attribute__((always_inline)) void atomic_long_add(long i, atomic_long_t *l)
{
        atomic_t *v = (atomic_t *)l;

        atomic_add(i, v);
}

static inline __attribute__((always_inline)) void atomic_long_sub(long i, atomic_long_t *l)
{
        atomic_t *v = (atomic_t *)l;

        atomic_sub(i, v);
}
# 257 "include/asm/atomic.h" 2
# 5 "include/asm/spinlock.h" 2
# 1 "include/asm/rwlock.h" 1
# 6 "include/asm/spinlock.h" 2
# 30 "include/asm/spinlock.h"
static inline __attribute__((always_inline)) int __raw_spin_is_locked(raw_spinlock_t *x)
{
        return *(volatile signed char *)(&(x)->slock) <= 0;
}

static inline __attribute__((always_inline)) void __raw_spin_lock(raw_spinlock_t *lock)
{
        asm volatile("\n1:\t"
                     ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " " ; decb %0\n\t"
                     "jns 3f\n"
                     "2:\t"
                     "rep;nop\n\t"
                     "cmpb $0,%0\n\t"
                     "jle 2b\n\t"
                     "jmp 1b\n"
                     "3:\n\t"
                     : "+m" (lock->slock) : : "memory");
}
# 58 "include/asm/spinlock.h"
static inline __attribute__((always_inline)) void __raw_spin_lock_flags(raw_spinlock_t *lock, unsigned long flags)
{
        asm volatile(
                "\n1:\t"
                ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " " ; decb %[slock]\n\t"
                "jns 5f\n"
                "2:\t"
                "testl $0x200, %[flags]\n\t"
                "jz 4f\n\t"
                "sti" "\n"
                "3:\t"
                "rep;nop\n\t"
                "cmpb $0, %[slock]\n\t"
                "jle 3b\n\t"
                "cli" "\n\t"
                "jmp 1b\n"
                "4:\t"
                "rep;nop\n\t"
                "cmpb $0, %[slock]\n\t"
                "jg 1b\n\t"
                "jmp 4b\n"
                "5:\n\t"
                : [slock] "+m" (lock->slock)
                : [flags] "r" (flags)
                 
                : "memory" );
}


static inline __attribute__((always_inline)) int __raw_spin_trylock(raw_spinlock_t *lock)
{
        char oldval;
        asm volatile(
                "xchgb %b0,%1"
                :"=q" (oldval), "+m" (lock->slock)
                :"0" (0) : "memory");
        return oldval > 0;
}
# 106 "include/asm/spinlock.h"
static inline __attribute__((always_inline)) void __raw_spin_unlock(raw_spinlock_t *lock)
{
        asm volatile("movb $1,%0" : "+m" (lock->slock) :: "memory");
}
# 124 "include/asm/spinlock.h"
static inline __attribute__((always_inline)) void __raw_spin_unlock_wait(raw_spinlock_t *lock)
{
        while (__raw_spin_is_locked(lock))
                rep_nop();
}
# 155 "include/asm/spinlock.h"
static inline __attribute__((always_inline)) int __raw_read_can_lock(raw_rwlock_t *x)
{
        return (int)(x)->lock > 0;
}





static inline __attribute__((always_inline)) int __raw_write_can_lock(raw_rwlock_t *x)
{
        return (x)->lock == 0x01000000;
}

static inline __attribute__((always_inline)) void __raw_read_lock(raw_rwlock_t *rw)
{
        asm volatile(".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " " subl $1,(%0)\n\t"
                     "jns 1f\n"
                     "call __read_lock_failed\n\t"
                     "1:\n"
                     ::"a" (rw) : "memory");
}

static inline __attribute__((always_inline)) void __raw_write_lock(raw_rwlock_t *rw)
{
        asm volatile(".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " " subl $" "0x01000000" ",(%0)\n\t"
                     "jz 1f\n"
                     "call __write_lock_failed\n\t"
                     "1:\n"
                     ::"a" (rw) : "memory");
}

static inline __attribute__((always_inline)) int __raw_read_trylock(raw_rwlock_t *lock)
{
        atomic_t *count = (atomic_t *)lock;
        atomic_dec(count);
        if (((count)->counter) >= 0)
                return 1;
        atomic_inc(count);
        return 0;
}

static inline __attribute__((always_inline)) int __raw_write_trylock(raw_rwlock_t *lock)
{
        atomic_t *count = (atomic_t *)lock;
        if (atomic_sub_and_test(0x01000000, count))
                return 1;
        atomic_add(0x01000000, count);
        return 0;
}

static inline __attribute__((always_inline)) void __raw_read_unlock(raw_rwlock_t *rw)
{
        asm volatile(".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "incl %0" :"+m" (rw->lock) : : "memory");
}

static inline __attribute__((always_inline)) void __raw_write_unlock(raw_rwlock_t *rw)
{
        asm volatile(".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "addl $" "0x01000000" ", %0"
                                 : "+m" (rw->lock) : : "memory");
}
# 88 "include/linux/spinlock.h" 2
# 133 "include/linux/spinlock.h"
# 1 "include/linux/spinlock_api_smp.h" 1
# 18 "include/linux/spinlock_api_smp.h"
int in_lock_functions(unsigned long addr);



void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _spin_lock(spinlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _spin_lock_nested(spinlock_t *lock, int subclass)
                                                        ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _read_lock(rwlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _write_lock(rwlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _spin_lock_bh(spinlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _read_lock_bh(rwlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _write_lock_bh(rwlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _spin_lock_irq(spinlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _read_lock_irq(rwlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _write_lock_irq(rwlock_t *lock) ;
unsigned long __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _spin_lock_irqsave(spinlock_t *lock)
                                                        ;
unsigned long __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _spin_lock_irqsave_nested(spinlock_t *lock, int subclass)
                                                        ;
unsigned long __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _read_lock_irqsave(rwlock_t *lock)
                                                        ;
unsigned long __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _write_lock_irqsave(rwlock_t *lock)
                                                        ;
int __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _spin_trylock(spinlock_t *lock);
int __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _read_trylock(rwlock_t *lock);
int __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _write_trylock(rwlock_t *lock);
int __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _spin_trylock_bh(spinlock_t *lock);
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _spin_unlock(spinlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _read_unlock(rwlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _write_unlock(rwlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _spin_unlock_bh(spinlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _read_unlock_bh(rwlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _write_unlock_bh(rwlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _spin_unlock_irq(spinlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _read_unlock_irq(rwlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _write_unlock_irq(rwlock_t *lock) ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
                                                        ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _read_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
                                                        ;
void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) _write_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
                                                        ;
# 134 "include/linux/spinlock.h" 2
# 280 "include/linux/spinlock.h"
extern int _atomic_dec_and_lock(atomic_t *atomic, spinlock_t *lock);
# 10 "include/linux/module.h" 2
# 1 "include/linux/list.h" 1






# 1 "include/linux/poison.h" 1
# 8 "include/linux/list.h" 2
# 1 "include/linux/prefetch.h" 1
# 58 "include/linux/prefetch.h"
static inline __attribute__((always_inline)) void prefetch_range(void *addr, size_t len)
{

        char *cp;
        char *end = addr + len;

        for (cp = addr; cp < end; cp += (4*(1 << (7))))
                prefetch(cp);

}
# 9 "include/linux/list.h" 2
# 21 "include/linux/list.h"
struct list_head {
        struct list_head *next, *prev;
};






static inline __attribute__((always_inline)) void INIT_LIST_HEAD(struct list_head *list)
{
        list->next = list;
        list->prev = list;
}
# 43 "include/linux/list.h"
static inline __attribute__((always_inline)) void __list_add(struct list_head *new,
                              struct list_head *prev,
                              struct list_head *next)
{
        next->prev = new;
        new->next = next;
        new->prev = prev;
        prev->next = new;
}
# 67 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_add(struct list_head *new, struct list_head *head)
{
        __list_add(new, head, head->next);
}
# 84 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_add_tail(struct list_head *new, struct list_head *head)
{
        __list_add(new, head->prev, head);
}







static inline __attribute__((always_inline)) void __list_add_rcu(struct list_head * new,
                struct list_head * prev, struct list_head * next)
{
        new->next = next;
        new->prev = prev;
        __asm__ __volatile__ ("": : :"memory");
        next->prev = new;
        prev->next = new;
}
# 121 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_add_rcu(struct list_head *new, struct list_head *head)
{
        __list_add_rcu(new, head, head->next);
}
# 142 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_add_tail_rcu(struct list_head *new,
                                        struct list_head *head)
{
        __list_add_rcu(new, head->prev, head);
}
# 155 "include/linux/list.h"
static inline __attribute__((always_inline)) void __list_del(struct list_head * prev, struct list_head * next)
{
        next->prev = prev;
        prev->next = next;
}
# 168 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_del(struct list_head *entry)
{
        __list_del(entry->prev, entry->next);
        entry->next = ((void *) 0x00100100);
        entry->prev = ((void *) 0x00200200);
}
# 202 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_del_rcu(struct list_head *entry)
{
        __list_del(entry->prev, entry->next);
        entry->prev = ((void *) 0x00200200);
}







static inline __attribute__((always_inline)) void list_replace(struct list_head *old,
                                struct list_head *new)
{
        new->next = old->next;
        new->next->prev = new;
        new->prev = old->prev;
        new->prev->next = new;
}

static inline __attribute__((always_inline)) void list_replace_init(struct list_head *old,
                                        struct list_head *new)
{
        list_replace(old, new);
        INIT_LIST_HEAD(old);
}
# 238 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_replace_rcu(struct list_head *old,
                                struct list_head *new)
{
        new->next = old->next;
        new->prev = old->prev;
        __asm__ __volatile__ ("": : :"memory");
        new->next->prev = new;
        new->prev->next = new;
        old->prev = ((void *) 0x00200200);
}





static inline __attribute__((always_inline)) void list_del_init(struct list_head *entry)
{
        __list_del(entry->prev, entry->next);
        INIT_LIST_HEAD(entry);
}






static inline __attribute__((always_inline)) void list_move(struct list_head *list, struct list_head *head)
{
        __list_del(list->prev, list->next);
        list_add(list, head);
}






static inline __attribute__((always_inline)) void list_move_tail(struct list_head *list,
                                  struct list_head *head)
{
        __list_del(list->prev, list->next);
        list_add_tail(list, head);
}






static inline __attribute__((always_inline)) int list_is_last(const struct list_head *list,
                                const struct list_head *head)
{
        return list->next == head;
}





static inline __attribute__((always_inline)) int list_empty(const struct list_head *head)
{
        return head->next == head;
}
# 315 "include/linux/list.h"
static inline __attribute__((always_inline)) int list_empty_careful(const struct list_head *head)
{
        struct list_head *next = head->next;
        return (next == head) && (next == head->prev);
}

static inline __attribute__((always_inline)) void __list_splice(struct list_head *list,
                                 struct list_head *head)
{
        struct list_head *first = list->next;
        struct list_head *last = list->prev;
        struct list_head *at = head->next;

        first->prev = head;
        head->next = first;

        last->next = at;
        at->prev = last;
}






static inline __attribute__((always_inline)) void list_splice(struct list_head *list, struct list_head *head)
{
        if (!list_empty(list))
                __list_splice(list, head);
}
# 353 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_splice_init(struct list_head *list,
                                    struct list_head *head)
{
        if (!list_empty(list)) {
                __list_splice(list, head);
                INIT_LIST_HEAD(list);
        }
}
# 607 "include/linux/list.h"
struct hlist_head {
        struct hlist_node *first;
};

struct hlist_node {
        struct hlist_node *next, **pprev;
};




static inline __attribute__((always_inline)) void INIT_HLIST_NODE(struct hlist_node *h)
{
        h->next = ((void *)0);
        h->pprev = ((void *)0);
}

static inline __attribute__((always_inline)) int hlist_unhashed(const struct hlist_node *h)
{
        return !h->pprev;
}

static inline __attribute__((always_inline)) int hlist_empty(const struct hlist_head *h)
{
        return !h->first;
}

static inline __attribute__((always_inline)) void __hlist_del(struct hlist_node *n)
{
        struct hlist_node *next = n->next;
        struct hlist_node **pprev = n->pprev;
        *pprev = next;
        if (next)
                next->pprev = pprev;
}

static inline __attribute__((always_inline)) void hlist_del(struct hlist_node *n)
{
        __hlist_del(n);
        n->next = ((void *) 0x00100100);
        n->pprev = ((void *) 0x00200200);
}
# 669 "include/linux/list.h"
static inline __attribute__((always_inline)) void hlist_del_rcu(struct hlist_node *n)
{
        __hlist_del(n);
        n->pprev = ((void *) 0x00200200);
}

static inline __attribute__((always_inline)) void hlist_del_init(struct hlist_node *n)
{
        if (!hlist_unhashed(n)) {
                __hlist_del(n);
                INIT_HLIST_NODE(n);
        }
}
# 690 "include/linux/list.h"
static inline __attribute__((always_inline)) void hlist_replace_rcu(struct hlist_node *old,
                                        struct hlist_node *new)
{
        struct hlist_node *next = old->next;

        new->next = next;
        new->pprev = old->pprev;
        __asm__ __volatile__ ("": : :"memory");
        if (next)
                new->next->pprev = &new->next;
        *new->pprev = new;
        old->pprev = ((void *) 0x00200200);
}

static inline __attribute__((always_inline)) void hlist_add_head(struct hlist_node *n, struct hlist_head *h)
{
        struct hlist_node *first = h->first;
        n->next = first;
        if (first)
                first->pprev = &n->next;
        h->first = n;
        n->pprev = &h->first;
}
# 734 "include/linux/list.h"
static inline __attribute__((always_inline)) void hlist_add_head_rcu(struct hlist_node *n,
                                        struct hlist_head *h)
{
        struct hlist_node *first = h->first;
        n->next = first;
        n->pprev = &h->first;
        __asm__ __volatile__ ("": : :"memory");
        if (first)
                first->pprev = &n->next;
        h->first = n;
}


static inline __attribute__((always_inline)) void hlist_add_before(struct hlist_node *n,
                                        struct hlist_node *next)
{
        n->pprev = next->pprev;
        n->next = next;
        next->pprev = &n->next;
        *(n->pprev) = n;
}

static inline __attribute__((always_inline)) void hlist_add_after(struct hlist_node *n,
                                        struct hlist_node *next)
{
        next->next = n->next;
        n->next = next;
        next->pprev = &n->next;

        if(next->next)
                next->next->pprev = &next->next;
}
# 785 "include/linux/list.h"
static inline __attribute__((always_inline)) void hlist_add_before_rcu(struct hlist_node *n,
                                        struct hlist_node *next)
{
        n->pprev = next->pprev;
        n->next = next;
        __asm__ __volatile__ ("": : :"memory");
        next->pprev = &n->next;
        *(n->pprev) = n;
}
# 813 "include/linux/list.h"
static inline __attribute__((always_inline)) void hlist_add_after_rcu(struct hlist_node *prev,
                                       struct hlist_node *n)
{
        n->next = prev->next;
        n->pprev = &prev->next;
        __asm__ __volatile__ ("": : :"memory");
        prev->next = n;
        if (n->next)
                n->next->pprev = &n->next;
}
# 11 "include/linux/module.h" 2
# 1 "include/linux/stat.h" 1





# 1 "include/asm/stat.h" 1



struct __old_kernel_stat {
        unsigned short st_dev;
        unsigned short st_ino;
        unsigned short st_mode;
        unsigned short st_nlink;
        unsigned short st_uid;
        unsigned short st_gid;
        unsigned short st_rdev;
        unsigned long st_size;
        unsigned long st_atime;
        unsigned long st_mtime;
        unsigned long st_ctime;
};

struct stat {
        unsigned long st_dev;
        unsigned long st_ino;
        unsigned short st_mode;
        unsigned short st_nlink;
        unsigned short st_uid;
        unsigned short st_gid;
        unsigned long st_rdev;
        unsigned long st_size;
        unsigned long st_blksize;
        unsigned long st_blocks;
        unsigned long st_atime;
        unsigned long st_atime_nsec;
        unsigned long st_mtime;
        unsigned long st_mtime_nsec;
        unsigned long st_ctime;
        unsigned long st_ctime_nsec;
        unsigned long __unused4;
        unsigned long __unused5;
};




struct stat64 {
        unsigned long long st_dev;
        unsigned char __pad0[4];


        unsigned long __st_ino;

        unsigned int st_mode;
        unsigned int st_nlink;

        unsigned long st_uid;
        unsigned long st_gid;

        unsigned long long st_rdev;
        unsigned char __pad3[4];

        long long st_size;
        unsigned long st_blksize;

        unsigned long long st_blocks;

        unsigned long st_atime;
        unsigned long st_atime_nsec;

        unsigned long st_mtime;
        unsigned int st_mtime_nsec;

        unsigned long st_ctime;
        unsigned long st_ctime_nsec;

        unsigned long long st_ino;
};
# 7 "include/linux/stat.h" 2
# 57 "include/linux/stat.h"
# 1 "include/linux/time.h" 1






# 1 "include/linux/seqlock.h" 1
# 32 "include/linux/seqlock.h"
typedef struct {
        unsigned sequence;
        spinlock_t lock;
} seqlock_t;
# 60 "include/linux/seqlock.h"
static inline __attribute__((always_inline)) void write_seqlock(seqlock_t *sl)
{
        _spin_lock(&sl->lock);
        ++sl->sequence;
        __asm__ __volatile__ ("": : :"memory");
}

static inline __attribute__((always_inline)) void write_sequnlock(seqlock_t *sl)
{
        __asm__ __volatile__ ("": : :"memory");
        sl->sequence++;
        __raw_spin_unlock(&(&sl->lock)->raw_lock);
}

static inline __attribute__((always_inline)) int write_tryseqlock(seqlock_t *sl)
{
        int ret = (_spin_trylock(&sl->lock));

        if (ret) {
                ++sl->sequence;
                __asm__ __volatile__ ("": : :"memory");
        }
        return ret;
}


static inline __attribute__((always_inline)) __attribute__((always_inline)) unsigned read_seqbegin(const seqlock_t *sl)
{
        unsigned ret = sl->sequence;
        asm volatile ("661:\n\t" "lock; addl $0,0(%%esp)" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "lfence" "\n664:\n" ".previous" :: "i" ((0*32+26)) : "memory");
        return ret;
}
# 101 "include/linux/seqlock.h"
static inline __attribute__((always_inline)) __attribute__((always_inline)) int read_seqretry(const seqlock_t *sl, unsigned iv)
{
        asm volatile ("661:\n\t" "lock; addl $0,0(%%esp)" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "lfence" "\n664:\n" ".previous" :: "i" ((0*32+26)) : "memory");
        return (iv & 1) | (sl->sequence ^ iv);
}
# 115 "include/linux/seqlock.h"
typedef struct seqcount {
        unsigned sequence;
} seqcount_t;





static inline __attribute__((always_inline)) unsigned read_seqcount_begin(const seqcount_t *s)
{
        unsigned ret = s->sequence;
        asm volatile ("661:\n\t" "lock; addl $0,0(%%esp)" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "lfence" "\n664:\n" ".previous" :: "i" ((0*32+26)) : "memory");
        return ret;
}






static inline __attribute__((always_inline)) int read_seqcount_retry(const seqcount_t *s, unsigned iv)
{
        asm volatile ("661:\n\t" "lock; addl $0,0(%%esp)" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "lfence" "\n664:\n" ".previous" :: "i" ((0*32+26)) : "memory");
        return (iv & 1) | (s->sequence ^ iv);
}






static inline __attribute__((always_inline)) void write_seqcount_begin(seqcount_t *s)
{
        s->sequence++;
        __asm__ __volatile__ ("": : :"memory");
}

static inline __attribute__((always_inline)) void write_seqcount_end(seqcount_t *s)
{
        __asm__ __volatile__ ("": : :"memory");
        s->sequence++;
}
# 8 "include/linux/time.h" 2




struct timespec {
        time_t tv_sec;
        long tv_nsec;
};


struct timeval {
        time_t tv_sec;
        suseconds_t tv_usec;
};

struct timezone {
        int tz_minuteswest;
        int tz_dsttime;
};
# 39 "include/linux/time.h"
static inline __attribute__((always_inline)) int timespec_equal(struct timespec *a, struct timespec *b)
{
        return (a->tv_sec == b->tv_sec) && (a->tv_nsec == b->tv_nsec);
}






static inline __attribute__((always_inline)) int timespec_compare(struct timespec *lhs, struct timespec *rhs)
{
        if (lhs->tv_sec < rhs->tv_sec)
                return -1;
        if (lhs->tv_sec > rhs->tv_sec)
                return 1;
        return lhs->tv_nsec - rhs->tv_nsec;
}

static inline __attribute__((always_inline)) int timeval_compare(struct timeval *lhs, struct timeval *rhs)
{
        if (lhs->tv_sec < rhs->tv_sec)
                return -1;
        if (lhs->tv_sec > rhs->tv_sec)
                return 1;
        return lhs->tv_usec - rhs->tv_usec;
}

extern unsigned long mktime(const unsigned int year, const unsigned int mon,
                            const unsigned int day, const unsigned int hour,
                            const unsigned int min, const unsigned int sec);

extern void set_normalized_timespec(struct timespec *ts, time_t sec, long nsec);




static inline __attribute__((always_inline)) struct timespec timespec_sub(struct timespec lhs,
                                                struct timespec rhs)
{
        struct timespec ts_delta;
        set_normalized_timespec(&ts_delta, lhs.tv_sec - rhs.tv_sec,
                                lhs.tv_nsec - rhs.tv_nsec);
        return ts_delta;
}







extern struct timespec xtime;
extern struct timespec wall_to_monotonic;
extern seqlock_t xtime_lock;

void timekeeping_init(void);

static inline __attribute__((always_inline)) unsigned long get_seconds(void)
{
        return xtime.tv_sec;
}

struct timespec current_kernel_time(void);




extern void do_gettimeofday(struct timeval *tv);
extern int do_settimeofday(struct timespec *tv);
extern int do_sys_settimeofday(struct timespec *tv, struct timezone *tz);

extern long do_utimes(int dfd, char *filename, struct timeval *times);
struct itimerval;
extern int do_setitimer(int which, struct itimerval *value,
                        struct itimerval *ovalue);
extern unsigned int alarm_setitimer(unsigned int seconds);
extern int do_getitimer(int which, struct itimerval *value);
extern void getnstimeofday(struct timespec *tv);

extern struct timespec timespec_trunc(struct timespec t, unsigned gran);
extern int timekeeping_is_continuous(void);
# 129 "include/linux/time.h"
static inline __attribute__((always_inline)) s64 timespec_to_ns(const struct timespec *ts)
{
        return ((s64) ts->tv_sec * 1000000000L) + ts->tv_nsec;
}
# 141 "include/linux/time.h"
static inline __attribute__((always_inline)) s64 timeval_to_ns(const struct timeval *tv)
{
        return ((s64) tv->tv_sec * 1000000000L) +
                tv->tv_usec * 1000L;
}







extern struct timespec ns_to_timespec(const s64 nsec);







extern struct timeval ns_to_timeval(const s64 nsec);






static inline __attribute__((always_inline)) void timespec_add_ns(struct timespec *a, u64 ns)
{
        ns += a->tv_nsec;
        while(__builtin_expect(!!(ns >= 1000000000L), 0)) {
                ns -= 1000000000L;
                a->tv_sec++;
        }
        a->tv_nsec = ns;
}
# 195 "include/linux/time.h"
struct itimerspec {
        struct timespec it_interval;
        struct timespec it_value;
};

struct itimerval {
        struct timeval it_interval;
        struct timeval it_value;
};
# 58 "include/linux/stat.h" 2

struct kstat {
        u64 ino;
        dev_t dev;
        umode_t mode;
        unsigned int nlink;
        uid_t uid;
        gid_t gid;
        dev_t rdev;
        loff_t size;
        struct timespec atime;
        struct timespec mtime;
        struct timespec ctime;
        unsigned long blksize;
        unsigned long long blocks;
};
# 12 "include/linux/module.h" 2


# 1 "include/linux/kmod.h" 1
# 23 "include/linux/kmod.h"
# 1 "include/linux/errno.h" 1



# 1 "include/asm/errno.h" 1



# 1 "include/asm-generic/errno.h" 1



# 1 "include/asm-generic/errno-base.h" 1
# 5 "include/asm-generic/errno.h" 2
# 5 "include/asm/errno.h" 2
# 5 "include/linux/errno.h" 2
# 24 "include/linux/kmod.h" 2
# 33 "include/linux/kmod.h"
static inline __attribute__((always_inline)) int request_module(const char * name, ...) { return -38; }




struct key;
extern int call_usermodehelper_keys(char *path, char *argv[], char *envp[],
                                    struct key *session_keyring, int wait);

static inline __attribute__((always_inline)) int
call_usermodehelper(char *path, char **argv, char **envp, int wait)
{
        return call_usermodehelper_keys(path, argv, envp, ((void *)0), wait);
}

extern void usermodehelper_init(void);

struct file;
extern int call_usermodehelper_pipe(char *path, char *argv[], char *envp[],
                                    struct file **filp);
# 15 "include/linux/module.h" 2
# 1 "include/linux/elf.h" 1




# 1 "include/linux/auxvec.h" 1



# 1 "include/asm/auxvec.h" 1
# 5 "include/linux/auxvec.h" 2
# 6 "include/linux/elf.h" 2
# 1 "include/linux/elf-em.h" 1
# 7 "include/linux/elf.h" 2
# 1 "include/asm/elf.h" 1
# 9 "include/asm/elf.h"
# 1 "include/asm/user.h" 1
# 44 "include/asm/user.h"
struct user_i387_struct {
        long cwd;
        long swd;
        long twd;
        long fip;
        long fcs;
        long foo;
        long fos;
        long st_space[20];
};

struct user_fxsr_struct {
        unsigned short cwd;
        unsigned short swd;
        unsigned short twd;
        unsigned short fop;
        long fip;
        long fcs;
        long foo;
        long fos;
        long mxcsr;
        long reserved;
        long st_space[32];
        long xmm_space[32];
        long padding[56];
};







struct user_regs_struct {
        long ebx, ecx, edx, esi, edi, ebp, eax;
        unsigned short ds, __ds, es, __es;
        unsigned short fs, __fs, gs, __gs;
        long orig_eax, eip;
        unsigned short cs, __cs;
        long eflags, esp;
        unsigned short ss, __ss;
};




struct user{


  struct user_regs_struct regs;

  int u_fpvalid;

  struct user_i387_struct i387;

  unsigned long int u_tsize;
  unsigned long int u_dsize;
  unsigned long int u_ssize;
  unsigned long start_code;
  unsigned long start_stack;



  long int signal;
  int reserved;
  struct user_pt_regs * u_ar0;

  struct user_i387_struct* u_fpstate;
  unsigned long magic;
  char u_comm[32];
  int u_debugreg[8];
};
# 10 "include/asm/elf.h" 2


# 1 "include/linux/utsname.h" 1





struct oldold_utsname {
        char sysname[9];
        char nodename[9];
        char release[9];
        char version[9];
        char machine[9];
};



struct old_utsname {
        char sysname[65];
        char nodename[65];
        char release[65];
        char version[65];
        char machine[65];
};

struct new_utsname {
        char sysname[65];
        char nodename[65];
        char release[65];
        char version[65];
        char machine[65];
        char domainname[65];
};



# 1 "include/linux/sched.h" 1
# 40 "include/linux/sched.h"
struct sched_param {
        int sched_priority;
};

# 1 "include/asm/param.h" 1
# 45 "include/linux/sched.h" 2

# 1 "include/linux/capability.h" 1
# 32 "include/linux/capability.h"
typedef struct __user_cap_header_struct {
        __u32 version;
        int pid;
} *cap_user_header_t;

typedef struct __user_cap_data_struct {
        __u32 effective;
        __u32 permitted;
        __u32 inheritable;
} *cap_user_data_t;




# 1 "include/asm/current.h" 1



# 1 "include/asm/pda.h" 1
# 12 "include/asm/pda.h"
struct i386_pda
{
        struct i386_pda *_pda;

        int cpu_number;
        struct task_struct *pcurrent;
        struct pt_regs *irq_regs;
};

extern struct i386_pda *_cpu_pda[];





extern void __bad_pda_field(void);






extern struct i386_pda _proxy_pda;
# 5 "include/asm/current.h" 2


struct task_struct;

static inline __attribute__((always_inline)) __attribute__((always_inline)) struct task_struct *get_current(void)
{
        return ({ typeof(_proxy_pda.pcurrent) ret__; switch (sizeof(_proxy_pda.pcurrent)) { case 1: asm("mov" "b %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->pcurrent)), "m" (_proxy_pda.pcurrent)); break; case 2: asm("mov" "w %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->pcurrent)), "m" (_proxy_pda.pcurrent)); break; case 4: asm("mov" "l %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->pcurrent)), "m" (_proxy_pda.pcurrent)); break; default: __bad_pda_field(); } ret__; });
}
# 47 "include/linux/capability.h" 2
# 58 "include/linux/capability.h"
typedef __u32 kernel_cap_t;
# 295 "include/linux/capability.h"
extern kernel_cap_t cap_bset;
# 323 "include/linux/capability.h"
static inline __attribute__((always_inline)) kernel_cap_t cap_combine(kernel_cap_t a, kernel_cap_t b)
{
     kernel_cap_t dest;
     (dest) = (a) | (b);
     return dest;
}

static inline __attribute__((always_inline)) kernel_cap_t cap_intersect(kernel_cap_t a, kernel_cap_t b)
{
     kernel_cap_t dest;
     (dest) = (a) & (b);
     return dest;
}

static inline __attribute__((always_inline)) kernel_cap_t cap_drop(kernel_cap_t a, kernel_cap_t drop)
{
     kernel_cap_t dest;
     (dest) = (a) & ~(drop);
     return dest;
}

static inline __attribute__((always_inline)) kernel_cap_t cap_invert(kernel_cap_t c)
{
     kernel_cap_t dest;
     (dest) = ~(c);
     return dest;
}
# 360 "include/linux/capability.h"
int capable(int cap);
int __capable(struct task_struct *t, int cap);
# 47 "include/linux/sched.h" 2



# 1 "include/linux/timex.h" 1
# 100 "include/linux/timex.h"
struct timex {
        unsigned int modes;
        long offset;
        long freq;
        long maxerror;
        long esterror;
        int status;
        long constant;
        long precision;
        long tolerance;


        struct timeval time;
        long tick;

        long ppsfreq;
        long jitter;
        int shift;
        long stabil;
        long jitcnt;
        long calcnt;
        long errcnt;
        long stbcnt;

        int :32; int :32; int :32; int :32;
        int :32; int :32; int :32; int :32;
        int :32; int :32; int :32; int :32;
};
# 187 "include/linux/timex.h"
# 1 "include/asm/timex.h" 1
# 10 "include/asm/timex.h"
# 1 "include/asm/tsc.h" 1
# 25 "include/asm/tsc.h"
typedef unsigned long long cycles_t;

extern unsigned int cpu_khz;
extern unsigned int tsc_khz;

static inline __attribute__((always_inline)) cycles_t get_cycles(void)
{
        unsigned long long ret = 0;







        __asm__ __volatile__("rdtsc" : "=A" (ret));

        return ret;
}

extern void tsc_init(void);
extern void mark_tsc_unstable(void);
# 11 "include/asm/timex.h" 2
# 19 "include/asm/timex.h"
extern int read_current_timer(unsigned long *timer_value);
# 188 "include/linux/timex.h" 2






extern unsigned long tick_usec;
extern unsigned long tick_nsec;
extern int tickadj;




extern int time_status;
extern long time_maxerror;
extern long time_esterror;

extern long time_freq;

extern long time_adjust;

extern void ntp_clear(void);





static inline __attribute__((always_inline)) int ntp_synced(void)
{
        return !(time_status & 0x0040);
}
# 277 "include/linux/timex.h"
static inline __attribute__((always_inline)) void time_interpolator_reset(void)
{
}

static inline __attribute__((always_inline)) void time_interpolator_update(long delta_nsec)
{
}






extern u64 current_tick_length(void);

extern void second_overflow(void);
extern void update_ntp_one_tick(void);
extern int do_adjtimex(struct timex *);
# 51 "include/linux/sched.h" 2
# 1 "include/linux/jiffies.h" 1



# 1 "include/linux/calc64.h" 1




# 1 "include/asm/div64.h" 1
# 38 "include/asm/div64.h"
static inline __attribute__((always_inline)) long
div_ll_X_l_rem(long long divs, long div, long *rem)
{
        long dum2;
      __asm__("divl %2":"=a"(dum2), "=d"(*rem)
      : "rm"(div), "A"(divs));

        return dum2;

}
# 6 "include/linux/calc64.h" 2
# 35 "include/linux/calc64.h"
static inline __attribute__((always_inline)) long div_long_long_rem_signed(const long long dividend,
                                            const long divisor, long *remainder)
{
        long res;

        if (__builtin_expect(!!(dividend < 0), 0)) {
                res = -div_ll_X_l_rem(-dividend,divisor,remainder);
                *remainder = -(*remainder);
        } else
                res = div_ll_X_l_rem(dividend,divisor,remainder);

        return res;
}
# 5 "include/linux/jiffies.h" 2
# 81 "include/linux/jiffies.h"
extern u64 __attribute__((section(".data"))) jiffies_64;
extern unsigned long volatile __attribute__((section(".data"))) jiffies;


u64 get_jiffies_64(void);
# 267 "include/linux/jiffies.h"
static inline __attribute__((always_inline)) unsigned int jiffies_to_msecs(const unsigned long j)
{

        return (1000L / 250) * j;





}

static inline __attribute__((always_inline)) unsigned int jiffies_to_usecs(const unsigned long j)
{

        return (1000000L / 250) * j;





}

static inline __attribute__((always_inline)) unsigned long msecs_to_jiffies(const unsigned int m)
{
        if (m > jiffies_to_msecs(((~0UL >> 1)-1)))
                return ((~0UL >> 1)-1);

        return (m + (1000L / 250) - 1) / (1000L / 250);





}

static inline __attribute__((always_inline)) unsigned long usecs_to_jiffies(const unsigned int u)
{
        if (u > jiffies_to_usecs(((~0UL >> 1)-1)))
                return ((~0UL >> 1)-1);

        return (u + (1000000L / 250) - 1) / (1000000L / 250);





}
# 326 "include/linux/jiffies.h"
static __inline__ __attribute__((always_inline)) unsigned long
timespec_to_jiffies(const struct timespec *value)
{
        unsigned long sec = value->tv_sec;
        long nsec = value->tv_nsec + (( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))))) - 1;

        if (sec >= (long)((u64)((u64)((~0UL >> 1)-1) * (( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))))) / 1000000000L)){
                sec = (long)((u64)((u64)((~0UL >> 1)-1) * (( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))))) / 1000000000L);
                nsec = 0;
        }
        return (((u64)sec * ((unsigned long)((((u64)1000000000L << (32 - 8)) + (( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))))) -1) / (u64)(( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))))))) +
                (((u64)nsec * ((unsigned long)((((u64)1 << ((32 - 8) + 29)) + (( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))))) -1) / (u64)(( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))))))) >>
                 (((32 - 8) + 29) - (32 - 8)))) >> (32 - 8);

}

static __inline__ __attribute__((always_inline)) void
jiffies_to_timespec(const unsigned long jiffies, struct timespec *value)
{




        u64 nsec = (u64)jiffies * (( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))));
        value->tv_sec = div_ll_X_l_rem(nsec,1000000000L,&value->tv_nsec);
}
# 365 "include/linux/jiffies.h"
static __inline__ __attribute__((always_inline)) unsigned long
timeval_to_jiffies(const struct timeval *value)
{
        unsigned long sec = value->tv_sec;
        long usec = value->tv_usec;

        if (sec >= (long)((u64)((u64)((~0UL >> 1)-1) * (( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))))) / 1000000000L)){
                sec = (long)((u64)((u64)((~0UL >> 1)-1) * (( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))))) / 1000000000L);
                usec = 0;
        }
        return (((u64)sec * ((unsigned long)((((u64)1000000000L << (32 - 8)) + (( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))))) -1) / (u64)(( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))))))) +
                (((u64)usec * ((unsigned long)((((u64)1000L << ((32 - 8) + 19)) + (( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))))) -1) / (u64)(( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))))))) + (u64)(((u64)1 << ((32 - 8) + 19)) - 1)) >>
                 (((32 - 8) + 19) - (32 - 8)))) >> (32 - 8);
}

static __inline__ __attribute__((always_inline)) void
jiffies_to_timeval(const unsigned long jiffies, struct timeval *value)
{




        u64 nsec = (u64)jiffies * (( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))));
        long tv_usec;

        value->tv_sec = div_ll_X_l_rem(nsec,1000000000L,&tv_usec);
        tv_usec /= 1000L;
        value->tv_usec = tv_usec;
}




static inline __attribute__((always_inline)) clock_t jiffies_to_clock_t(long x)
{



        u64 tmp = (u64)x * (( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))));
        ({ unsigned long __upper, __low, __high, __mod, __base; __base = ((1000000000L / 100)); asm("":"=a" (__low), "=d" (__high):"A" (tmp)); __upper = __high; if (__high) { __upper = __high % (__base); __high = __high / (__base); } asm("divl %2":"=a" (__low), "=d" (__mod):"rm" (__base), "0" (__low), "1" (__upper)); asm("":"=A" (tmp):"a" (__low),"d" (__high)); __mod; });
        return (long)tmp;

}

static inline __attribute__((always_inline)) unsigned long clock_t_to_jiffies(unsigned long x)
{





        u64 jif;


        if (x >= ~0UL / 250 * 100)
                return ~0UL;


        jif = x * (u64) 250;
        ({ unsigned long __upper, __low, __high, __mod, __base; __base = (100); asm("":"=a" (__low), "=d" (__high):"A" (jif)); __upper = __high; if (__high) { __upper = __high % (__base); __high = __high / (__base); } asm("divl %2":"=a" (__low), "=d" (__mod):"rm" (__base), "0" (__low), "1" (__upper)); asm("":"=A" (jif):"a" (__low),"d" (__high)); __mod; });
        return jif;

}

static inline __attribute__((always_inline)) u64 jiffies_64_to_clock_t(u64 x)
{
# 439 "include/linux/jiffies.h"
        x *= (( (((1000000UL * 1000) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((((1000000UL * 1000) % ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))) << (8)) + ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250))))) / 2) / ((( (((1193182) / (((1193182 + 250/2) / 250))) << (8)) + ((((1193182) % (((1193182 + 250/2) / 250))) << (8)) + (((1193182 + 250/2) / 250)) / 2) / (((1193182 + 250/2) / 250)))))));
        ({ unsigned long __upper, __low, __high, __mod, __base; __base = ((1000000000L / 100)); asm("":"=a" (__low), "=d" (__high):"A" (x)); __upper = __high; if (__high) { __upper = __high % (__base); __high = __high / (__base); } asm("divl %2":"=a" (__low), "=d" (__mod):"rm" (__base), "0" (__low), "1" (__upper)); asm("":"=A" (x):"a" (__low),"d" (__high)); __mod; });

        return x;
}

static inline __attribute__((always_inline)) u64 nsec_to_clock_t(u64 x)
{

        ({ unsigned long __upper, __low, __high, __mod, __base; __base = ((1000000000L / 100)); asm("":"=a" (__low), "=d" (__high):"A" (x)); __upper = __high; if (__high) { __upper = __high % (__base); __high = __high / (__base); } asm("divl %2":"=a" (__low), "=d" (__mod):"rm" (__base), "0" (__low), "1" (__upper)); asm("":"=A" (x):"a" (__low),"d" (__high)); __mod; });
# 462 "include/linux/jiffies.h"
        return x;
}
# 52 "include/linux/sched.h" 2
# 1 "include/linux/rbtree.h" 1
# 100 "include/linux/rbtree.h"
struct rb_node
{
        unsigned long rb_parent_color;


        struct rb_node *rb_right;
        struct rb_node *rb_left;
} __attribute__((aligned(sizeof(long))));


struct rb_root
{
        struct rb_node *rb_node;
};
# 123 "include/linux/rbtree.h"
static inline __attribute__((always_inline)) void rb_set_parent(struct rb_node *rb, struct rb_node *p)
{
        rb->rb_parent_color = (rb->rb_parent_color & 3) | (unsigned long)p;
}
static inline __attribute__((always_inline)) void rb_set_color(struct rb_node *rb, int color)
{
        rb->rb_parent_color = (rb->rb_parent_color & ~1) | color;
}
# 139 "include/linux/rbtree.h"
extern void rb_insert_color(struct rb_node *, struct rb_root *);
extern void rb_erase(struct rb_node *, struct rb_root *);


extern struct rb_node *rb_next(struct rb_node *);
extern struct rb_node *rb_prev(struct rb_node *);
extern struct rb_node *rb_first(struct rb_root *);
extern struct rb_node *rb_last(struct rb_root *);


extern void rb_replace_node(struct rb_node *victim, struct rb_node *new,
                            struct rb_root *root);

static inline __attribute__((always_inline)) void rb_link_node(struct rb_node * node, struct rb_node * parent,
                                struct rb_node ** rb_link)
{
        node->rb_parent_color = (unsigned long )parent;
        node->rb_left = node->rb_right = ((void *)0);

        *rb_link = node;
}
# 53 "include/linux/sched.h" 2



# 1 "include/linux/nodemask.h" 1
# 86 "include/linux/nodemask.h"
# 1 "include/linux/numa.h" 1
# 87 "include/linux/nodemask.h" 2

typedef struct { unsigned long bits[((((1 << 0))+32 -1)/32)]; } nodemask_t;
extern nodemask_t _unused_nodemask_arg_;


static inline __attribute__((always_inline)) void __node_set(int node, volatile nodemask_t *dstp)
{
        set_bit(node, dstp->bits);
}


static inline __attribute__((always_inline)) void __node_clear(int node, volatile nodemask_t *dstp)
{
        clear_bit(node, dstp->bits);
}


static inline __attribute__((always_inline)) void __nodes_setall(nodemask_t *dstp, int nbits)
{
        bitmap_fill(dstp->bits, nbits);
}


static inline __attribute__((always_inline)) void __nodes_clear(nodemask_t *dstp, int nbits)
{
        bitmap_zero(dstp->bits, nbits);
}






static inline __attribute__((always_inline)) int __node_test_and_set(int node, nodemask_t *addr)
{
        return test_and_set_bit(node, addr->bits);
}



static inline __attribute__((always_inline)) void __nodes_and(nodemask_t *dstp, const nodemask_t *src1p,
                                        const nodemask_t *src2p, int nbits)
{
        bitmap_and(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_or(nodemask_t *dstp, const nodemask_t *src1p,
                                        const nodemask_t *src2p, int nbits)
{
        bitmap_or(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_xor(nodemask_t *dstp, const nodemask_t *src1p,
                                        const nodemask_t *src2p, int nbits)
{
        bitmap_xor(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_andnot(nodemask_t *dstp, const nodemask_t *src1p,
                                        const nodemask_t *src2p, int nbits)
{
        bitmap_andnot(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_complement(nodemask_t *dstp,
                                        const nodemask_t *srcp, int nbits)
{
        bitmap_complement(dstp->bits, srcp->bits, nbits);
}



static inline __attribute__((always_inline)) int __nodes_equal(const nodemask_t *src1p,
                                        const nodemask_t *src2p, int nbits)
{
        return bitmap_equal(src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) int __nodes_intersects(const nodemask_t *src1p,
                                        const nodemask_t *src2p, int nbits)
{
        return bitmap_intersects(src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) int __nodes_subset(const nodemask_t *src1p,
                                        const nodemask_t *src2p, int nbits)
{
        return bitmap_subset(src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) int __nodes_empty(const nodemask_t *srcp, int nbits)
{
        return bitmap_empty(srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __nodes_full(const nodemask_t *srcp, int nbits)
{
        return bitmap_full(srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __nodes_weight(const nodemask_t *srcp, int nbits)
{
        return bitmap_weight(srcp->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_shift_right(nodemask_t *dstp,
                                        const nodemask_t *srcp, int n, int nbits)
{
        bitmap_shift_right(dstp->bits, srcp->bits, n, nbits);
}



static inline __attribute__((always_inline)) void __nodes_shift_left(nodemask_t *dstp,
                                        const nodemask_t *srcp, int n, int nbits)
{
        bitmap_shift_left(dstp->bits, srcp->bits, n, nbits);
}





static inline __attribute__((always_inline)) int __first_node(const nodemask_t *srcp)
{
        return ({ int __x = ((1 << 0)); int __y = (find_first_bit(srcp->bits, (1 << 0))); __x < __y ? __x: __y; });
}


static inline __attribute__((always_inline)) int __next_node(int n, const nodemask_t *srcp)
{
        return ({ int __x = ((1 << 0)); int __y = (find_next_bit(srcp->bits, (1 << 0), n+1)); __x < __y ? __x: __y; });
}
# 251 "include/linux/nodemask.h"
static inline __attribute__((always_inline)) int __first_unset_node(const nodemask_t *maskp)
{
        return ({ int __x = ((1 << 0)); int __y = (find_first_zero_bit(maskp->bits, (1 << 0))); __x < __y ? __x: __y; });

}
# 285 "include/linux/nodemask.h"
static inline __attribute__((always_inline)) int __nodemask_scnprintf(char *buf, int len,
                                        const nodemask_t *srcp, int nbits)
{
        return bitmap_scnprintf(buf, len, srcp->bits, nbits);
}



static inline __attribute__((always_inline)) int __nodemask_parse_user(const char *buf, int len,
                                        nodemask_t *dstp, int nbits)
{
        return bitmap_parse_user(buf, len, dstp->bits, nbits);
}



static inline __attribute__((always_inline)) int __nodelist_scnprintf(char *buf, int len,
                                        const nodemask_t *srcp, int nbits)
{
        return bitmap_scnlistprintf(buf, len, srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __nodelist_parse(const char *buf, nodemask_t *dstp, int nbits)
{
        return bitmap_parselist(buf, dstp->bits, nbits);
}



static inline __attribute__((always_inline)) int __node_remap(int oldbit,
                const nodemask_t *oldp, const nodemask_t *newp, int nbits)
{
        return bitmap_bitremap(oldbit, oldp->bits, newp->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_remap(nodemask_t *dstp, const nodemask_t *srcp,
                const nodemask_t *oldp, const nodemask_t *newp, int nbits)
{
        bitmap_remap(dstp->bits, srcp->bits, oldp->bits, newp->bits, nbits);
}
# 345 "include/linux/nodemask.h"
extern nodemask_t node_online_map;
extern nodemask_t node_possible_map;
# 57 "include/linux/sched.h" 2


# 1 "include/asm/semaphore.h" 1
# 41 "include/asm/semaphore.h"
# 1 "include/linux/wait.h" 1
# 28 "include/linux/wait.h"
typedef struct __wait_queue wait_queue_t;
typedef int (*wait_queue_func_t)(wait_queue_t *wait, unsigned mode, int sync, void *key);
int default_wake_function(wait_queue_t *wait, unsigned mode, int sync, void *key);

struct __wait_queue {
        unsigned int flags;

        void *private;
        wait_queue_func_t func;
        struct list_head task_list;
};

struct wait_bit_key {
        void *flags;
        int bit_nr;
};

struct wait_bit_queue {
        struct wait_bit_key key;
        wait_queue_t wait;
};

struct __wait_queue_head {
        spinlock_t lock;
        struct list_head task_list;
};
typedef struct __wait_queue_head wait_queue_head_t;

struct task_struct;
# 80 "include/linux/wait.h"
extern void init_waitqueue_head(wait_queue_head_t *q);
# 91 "include/linux/wait.h"
static inline __attribute__((always_inline)) void init_waitqueue_entry(wait_queue_t *q, struct task_struct *p)
{
        q->flags = 0;
        q->private = p;
        q->func = default_wake_function;
}

static inline __attribute__((always_inline)) void init_waitqueue_func_entry(wait_queue_t *q,
                                        wait_queue_func_t func)
{
        q->flags = 0;
        q->private = ((void *)0);
        q->func = func;
}

static inline __attribute__((always_inline)) int waitqueue_active(wait_queue_head_t *q)
{
        return !list_empty(&q->task_list);
}
# 120 "include/linux/wait.h"
extern void add_wait_queue(wait_queue_head_t *q, wait_queue_t * wait) __attribute__((regparm(3)));
extern void add_wait_queue_exclusive(wait_queue_head_t *q, wait_queue_t * wait) __attribute__((regparm(3)));
extern void remove_wait_queue(wait_queue_head_t *q, wait_queue_t * wait) __attribute__((regparm(3)));

static inline __attribute__((always_inline)) void __add_wait_queue(wait_queue_head_t *head, wait_queue_t *new)
{
        list_add(&new->task_list, &head->task_list);
}




static inline __attribute__((always_inline)) void __add_wait_queue_tail(wait_queue_head_t *head,
                                                wait_queue_t *new)
{
        list_add_tail(&new->task_list, &head->task_list);
}

static inline __attribute__((always_inline)) void __remove_wait_queue(wait_queue_head_t *head,
                                                        wait_queue_t *old)
{
        list_del(&old->task_list);
}

void __wake_up(wait_queue_head_t *q, unsigned int mode, int nr, void *key) __attribute__((regparm(3)));
extern void __wake_up_locked(wait_queue_head_t *q, unsigned int mode) __attribute__((regparm(3)));
extern void __wake_up_sync(wait_queue_head_t *q, unsigned int mode, int nr) __attribute__((regparm(3)));
void __wake_up_bit(wait_queue_head_t *, void *, int) __attribute__((regparm(3)));
int __wait_on_bit(wait_queue_head_t *, struct wait_bit_queue *, int (*)(void *), unsigned) __attribute__((regparm(3)));
int __wait_on_bit_lock(wait_queue_head_t *, struct wait_bit_queue *, int (*)(void *), unsigned) __attribute__((regparm(3)));
void wake_up_bit(void *, int) __attribute__((regparm(3)));
int out_of_line_wait_on_bit(void *, int, int (*)(void *), unsigned) __attribute__((regparm(3)));
int out_of_line_wait_on_bit_lock(void *, int, int (*)(void *), unsigned) __attribute__((regparm(3)));
wait_queue_head_t *bit_waitqueue(void *, int) __attribute__((regparm(3)));
# 351 "include/linux/wait.h"
static inline __attribute__((always_inline)) void add_wait_queue_exclusive_locked(wait_queue_head_t *q,
                                                   wait_queue_t * wait)
{
        wait->flags |= 0x01;
        __add_wait_queue_tail(q, wait);
}




static inline __attribute__((always_inline)) void remove_wait_queue_locked(wait_queue_head_t *q,
                                            wait_queue_t * wait)
{
        __remove_wait_queue(q, wait);
}






extern void sleep_on(wait_queue_head_t *q) __attribute__((regparm(3)));
extern long sleep_on_timeout(wait_queue_head_t *q, signed long timeout) __attribute__((regparm(3)));

extern void interruptible_sleep_on(wait_queue_head_t *q) __attribute__((regparm(3)));
extern long interruptible_sleep_on_timeout(wait_queue_head_t *q, signed long timeout) __attribute__((regparm(3)));





void prepare_to_wait(wait_queue_head_t *q, wait_queue_t *wait, int state) __attribute__((regparm(3)));

void prepare_to_wait_exclusive(wait_queue_head_t *q, wait_queue_t *wait, int state) __attribute__((regparm(3)));

void finish_wait(wait_queue_head_t *q, wait_queue_t *wait) __attribute__((regparm(3)));
int autoremove_wake_function(wait_queue_t *wait, unsigned mode, int sync, void *key);
int wake_bit_function(wait_queue_t *wait, unsigned mode, int sync, void *key);
# 429 "include/linux/wait.h"
static inline __attribute__((always_inline)) int wait_on_bit(void *word, int bit,
                                int (*action)(void *), unsigned mode)
{
        if (!(__builtin_constant_p(bit) ? constant_test_bit((bit),(word)) : variable_test_bit((bit),(word))))
                return 0;
        return out_of_line_wait_on_bit(word, bit, action, mode);
}
# 453 "include/linux/wait.h"
static inline __attribute__((always_inline)) int wait_on_bit_lock(void *word, int bit,
                                int (*action)(void *), unsigned mode)
{
        if (!test_and_set_bit(bit, word))
                return 0;
        return out_of_line_wait_on_bit_lock(word, bit, action, mode);
}
# 42 "include/asm/semaphore.h" 2
# 1 "include/linux/rwsem.h" 1
# 19 "include/linux/rwsem.h"
struct rw_semaphore;




# 1 "include/asm/rwsem.h" 1
# 45 "include/asm/rwsem.h"
struct rwsem_waiter;

extern struct rw_semaphore *rwsem_down_read_failed(struct rw_semaphore *sem) __attribute__((regparm(3)));
extern struct rw_semaphore *rwsem_down_write_failed(struct rw_semaphore *sem) __attribute__((regparm(3)));
extern struct rw_semaphore *rwsem_wake(struct rw_semaphore *) __attribute__((regparm(3)));
extern struct rw_semaphore *rwsem_downgrade_wake(struct rw_semaphore *sem) __attribute__((regparm(3)));




struct rw_semaphore {
        signed long count;






        spinlock_t wait_lock;
        struct list_head wait_list;



};
# 84 "include/asm/rwsem.h"
extern void __init_rwsem(struct rw_semaphore *sem, const char *name,
                         struct lock_class_key *key);
# 97 "include/asm/rwsem.h"
static inline __attribute__((always_inline)) void __down_read(struct rw_semaphore *sem)
{
        __asm__ __volatile__(
                "# beginning down_read\n\t"
".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "  incl      (%%eax)\n\t"
                "  jns        1f\n"
                "  call call_rwsem_down_read_failed\n"
                "1:\n\t"
                "# ending down_read\n\t"
                : "+m" (sem->count)
                : "a" (sem)
                : "memory", "cc");
}




static inline __attribute__((always_inline)) int __down_read_trylock(struct rw_semaphore *sem)
{
        __s32 result, tmp;
        __asm__ __volatile__(
                "# beginning __down_read_trylock\n\t"
                "  movl      %0,%1\n\t"
                "1:\n\t"
                "  movl	     %1,%2\n\t"
                "  addl      %3,%2\n\t"
                "  jle	     2f\n\t"
".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "  cmpxchgl  %2,%0\n\t"
                "  jnz	     1b\n\t"
                "2:\n\t"
                "# ending __down_read_trylock\n\t"
                : "+m" (sem->count), "=&a" (result), "=&r" (tmp)
                : "i" (0x00000001)
                : "memory", "cc");
        return result>=0 ? 1 : 0;
}




static inline __attribute__((always_inline)) void __down_write_nested(struct rw_semaphore *sem, int subclass)
{
        int tmp;

        tmp = ((-0x00010000) + 0x00000001);
        __asm__ __volatile__(
                "# beginning down_write\n\t"
".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "  xadd      %%edx,(%%eax)\n\t"
                "  testl     %%edx,%%edx\n\t"
                "  jz        1f\n"
                "  call call_rwsem_down_write_failed\n"
                "1:\n"
                "# ending down_write"
                : "+m" (sem->count), "=d" (tmp)
                : "a" (sem), "1" (tmp)
                : "memory", "cc");
}

static inline __attribute__((always_inline)) void __down_write(struct rw_semaphore *sem)
{
        __down_write_nested(sem, 0);
}




static inline __attribute__((always_inline)) int __down_write_trylock(struct rw_semaphore *sem)
{
        signed long ret = ((__typeof__(*(&sem->count)))__cmpxchg((&sem->count),(unsigned long)(0x00000000), (unsigned long)(((-0x00010000) + 0x00000001)),sizeof(*(&sem->count))));


        if (ret == 0x00000000)
                return 1;
        return 0;
}




static inline __attribute__((always_inline)) void __up_read(struct rw_semaphore *sem)
{
        __s32 tmp = -0x00000001;
        __asm__ __volatile__(
                "# beginning __up_read\n\t"
".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "  xadd      %%edx,(%%eax)\n\t"
                "  jns        1f\n\t"
                "  call call_rwsem_wake\n"
                "1:\n"
                "# ending __up_read\n"
                : "+m" (sem->count), "=d" (tmp)
                : "a" (sem), "1" (tmp)
                : "memory", "cc");
}




static inline __attribute__((always_inline)) void __up_write(struct rw_semaphore *sem)
{
        __asm__ __volatile__(
                "# beginning __up_write\n\t"
                "  movl      %2,%%edx\n\t"
".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "  xaddl     %%edx,(%%eax)\n\t"
                "  jz       1f\n"
                "  call call_rwsem_wake\n"
                "1:\n\t"
                "# ending __up_write\n"
                : "+m" (sem->count)
                : "a" (sem), "i" (-((-0x00010000) + 0x00000001))
                : "memory", "cc", "edx");
}




static inline __attribute__((always_inline)) void __downgrade_write(struct rw_semaphore *sem)
{
        __asm__ __volatile__(
                "# beginning __downgrade_write\n\t"
".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "  addl      %2,(%%eax)\n\t"
                "  jns       1f\n\t"
                "  call call_rwsem_downgrade_wake\n"
                "1:\n\t"
                "# ending __downgrade_write\n"
                : "+m" (sem->count)
                : "a" (sem), "i" (-(-0x00010000))
                : "memory", "cc");
}




static inline __attribute__((always_inline)) void rwsem_atomic_add(int delta, struct rw_semaphore *sem)
{
        __asm__ __volatile__(
".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "addl %1,%0"
                : "+m" (sem->count)
                : "ir" (delta));
}




static inline __attribute__((always_inline)) int rwsem_atomic_update(int delta, struct rw_semaphore *sem)
{
        int tmp = delta;

        __asm__ __volatile__(
".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "xadd %0,%1"
                : "+r" (tmp), "+m" (sem->count)
                : : "memory");

        return tmp+delta;
}

static inline __attribute__((always_inline)) int rwsem_is_locked(struct rw_semaphore *sem)
{
        return (sem->count != 0);
}
# 25 "include/linux/rwsem.h" 2





extern void down_read(struct rw_semaphore *sem);




extern int down_read_trylock(struct rw_semaphore *sem);




extern void down_write(struct rw_semaphore *sem);




extern int down_write_trylock(struct rw_semaphore *sem);




extern void up_read(struct rw_semaphore *sem);




extern void up_write(struct rw_semaphore *sem);




extern void downgrade_write(struct rw_semaphore *sem);
# 43 "include/asm/semaphore.h" 2

struct semaphore {
        atomic_t count;
        int sleepers;
        wait_queue_head_t wait;
};
# 64 "include/asm/semaphore.h"
static inline __attribute__((always_inline)) void sema_init (struct semaphore *sem, int val)
{






        (((&sem->count)->counter) = (val));
        sem->sleepers = 0;
        init_waitqueue_head(&sem->wait);
}

static inline __attribute__((always_inline)) void init_MUTEX (struct semaphore *sem)
{
        sema_init(sem, 1);
}

static inline __attribute__((always_inline)) void init_MUTEX_LOCKED (struct semaphore *sem)
{
        sema_init(sem, 0);
}

__attribute__((regparm(3))) void __down_failed(void );
__attribute__((regparm(3))) int __down_failed_interruptible(void );
__attribute__((regparm(3))) int __down_failed_trylock(void );
__attribute__((regparm(3))) void __up_wakeup(void );






static inline __attribute__((always_inline)) void down(struct semaphore * sem)
{
        do { cond_resched(); } while (0);
        __asm__ __volatile__(
                "# atomic down operation\n\t"
                ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "decl %0\n\t"
                "jns 2f\n"
                "\tlea %0,%%eax\n\t"
                "call __down_failed\n"
                "2:"
                :"+m" (sem->count)
                :
                :"memory","ax");
}





static inline __attribute__((always_inline)) int down_interruptible(struct semaphore * sem)
{
        int result;

        do { cond_resched(); } while (0);
        __asm__ __volatile__(
                "# atomic interruptible down operation\n\t"
                "xorl %0,%0\n\t"
                ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "decl %1\n\t"
                "jns 2f\n\t"
                "lea %1,%%eax\n\t"
                "call __down_failed_interruptible\n"
                "2:"
                :"=&a" (result), "+m" (sem->count)
                :
                :"memory");
        return result;
}





static inline __attribute__((always_inline)) int down_trylock(struct semaphore * sem)
{
        int result;

        __asm__ __volatile__(
                "# atomic interruptible down operation\n\t"
                "xorl %0,%0\n\t"
                ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "decl %1\n\t"
                "jns 2f\n\t"
                "lea %1,%%eax\n\t"
                "call __down_failed_trylock\n\t"
                "2:\n"
                :"=&a" (result), "+m" (sem->count)
                :
                :"memory");
        return result;
}





static inline __attribute__((always_inline)) void up(struct semaphore * sem)
{
        __asm__ __volatile__(
                "# atomic up operation\n\t"
                ".section .smp_locks,\"a\"\n" "  .align 4\n" "  .long 661f\n" ".previous\n" "661:\n\tlock; " "incl %0\n\t"
                "jg 1f\n\t"
                "lea %0,%%eax\n\t"
                "call __up_wakeup\n"
                "1:"
                :"+m" (sem->count)
                :
                :"memory","ax");
}
# 60 "include/linux/sched.h" 2


# 1 "include/asm/mmu.h" 1
# 11 "include/asm/mmu.h"
typedef struct {
        int size;
        struct semaphore sem;
        void *ldt;
        void *vdso;
} mm_context_t;
# 63 "include/linux/sched.h" 2
# 1 "include/asm/cputime.h" 1



# 1 "include/asm-generic/cputime.h" 1






typedef unsigned long cputime_t;
# 23 "include/asm-generic/cputime.h"
typedef u64 cputime64_t;
# 5 "include/asm/cputime.h" 2
# 64 "include/linux/sched.h" 2

# 1 "include/linux/smp.h" 1
# 10 "include/linux/smp.h"
extern void cpu_idle(void);







# 1 "include/asm/smp.h" 1
# 16 "include/asm/smp.h"
# 1 "include/asm/fixmap.h" 1
# 32 "include/asm/fixmap.h"
# 1 "include/asm/acpi.h" 1
# 31 "include/asm/acpi.h"
# 1 "include/acpi/pdc_intel.h" 1
# 32 "include/asm/acpi.h" 2
# 59 "include/asm/acpi.h"
int __acpi_acquire_global_lock(unsigned int *lock);
int __acpi_release_global_lock(unsigned int *lock);
# 85 "include/asm/acpi.h"
extern void check_acpi_pci(void);





extern int acpi_lapic;
extern int acpi_ioapic;
extern int acpi_noirq;
extern int acpi_strict;
extern int acpi_disabled;
extern int acpi_ht;
extern int acpi_pci_disabled;
static inline __attribute__((always_inline)) void disable_acpi(void)
{
        acpi_disabled = 1;
        acpi_ht = 0;
        acpi_pci_disabled = 1;
        acpi_noirq = 1;
}




extern int acpi_gsi_to_irq(u32 gsi, unsigned int *irq);


extern int acpi_skip_timer_override;
extern int acpi_use_timer_override;


static inline __attribute__((always_inline)) void acpi_noirq_set(void) { acpi_noirq = 1; }
static inline __attribute__((always_inline)) void acpi_disable_pci(void)
{
        acpi_pci_disabled = 1;
        acpi_noirq_set();
}
extern int acpi_irq_balance_set(char *str);
# 147 "include/asm/acpi.h"
extern u8 x86_acpiid_to_apicid[];
# 33 "include/asm/fixmap.h" 2
# 1 "include/asm/apicdef.h" 1
# 125 "include/asm/apicdef.h"
struct local_apic {

        struct { unsigned int __reserved[4]; } __reserved_01;

        struct { unsigned int __reserved[4]; } __reserved_02;

        struct {
                unsigned int __reserved_1 : 24,
                        phys_apic_id : 4,
                        __reserved_2 : 4;
                unsigned int __reserved[3];
        } id;

        const
        struct {
                unsigned int version : 8,
                        __reserved_1 : 8,
                        max_lvt : 8,
                        __reserved_2 : 8;
                unsigned int __reserved[3];
        } version;

        struct { unsigned int __reserved[4]; } __reserved_03;

        struct { unsigned int __reserved[4]; } __reserved_04;

        struct { unsigned int __reserved[4]; } __reserved_05;

        struct { unsigned int __reserved[4]; } __reserved_06;

        struct {
                unsigned int priority : 8,
                        __reserved_1 : 24;
                unsigned int __reserved_2[3];
        } tpr;

        const
        struct {
                unsigned int priority : 8,
                        __reserved_1 : 24;
                unsigned int __reserved_2[3];
        } apr;

        const
        struct {
                unsigned int priority : 8,
                        __reserved_1 : 24;
                unsigned int __reserved_2[3];
        } ppr;

        struct {
                unsigned int eoi;
                unsigned int __reserved[3];
        } eoi;

        struct { unsigned int __reserved[4]; } __reserved_07;

        struct {
                unsigned int __reserved_1 : 24,
                        logical_dest : 8;
                unsigned int __reserved_2[3];
        } ldr;

        struct {
                unsigned int __reserved_1 : 28,
                        model : 4;
                unsigned int __reserved_2[3];
        } dfr;

        struct {
                unsigned int spurious_vector : 8,
                        apic_enabled : 1,
                        focus_cpu : 1,
                        __reserved_2 : 22;
                unsigned int __reserved_3[3];
        } svr;

        struct {
                unsigned int bitfield;
                unsigned int __reserved[3];
        } isr [8];

        struct {
                unsigned int bitfield;
                unsigned int __reserved[3];
        } tmr [8];

        struct {
                unsigned int bitfield;
                unsigned int __reserved[3];
        } irr [8];

        union {
                struct {
                        unsigned int send_cs_error : 1,
                                receive_cs_error : 1,
                                send_accept_error : 1,
                                receive_accept_error : 1,
                                __reserved_1 : 1,
                                send_illegal_vector : 1,
                                receive_illegal_vector : 1,
                                illegal_register_address : 1,
                                __reserved_2 : 24;
                        unsigned int __reserved_3[3];
                } error_bits;
                struct {
                        unsigned int errors;
                        unsigned int __reserved_3[3];
                } all_errors;
        } esr;

        struct { unsigned int __reserved[4]; } __reserved_08;

        struct { unsigned int __reserved[4]; } __reserved_09;

        struct { unsigned int __reserved[4]; } __reserved_10;

        struct { unsigned int __reserved[4]; } __reserved_11;

        struct { unsigned int __reserved[4]; } __reserved_12;

        struct { unsigned int __reserved[4]; } __reserved_13;

        struct { unsigned int __reserved[4]; } __reserved_14;

        struct {
                unsigned int vector : 8,
                        delivery_mode : 3,
                        destination_mode : 1,
                        delivery_status : 1,
                        __reserved_1 : 1,
                        level : 1,
                        trigger : 1,
                        __reserved_2 : 2,
                        shorthand : 2,
                        __reserved_3 : 12;
                unsigned int __reserved_4[3];
        } icr1;

        struct {
                union {
                        unsigned int __reserved_1 : 24,
                                phys_dest : 4,
                                __reserved_2 : 4;
                        unsigned int __reserved_3 : 24,
                                logical_dest : 8;
                } dest;
                unsigned int __reserved_4[3];
        } icr2;

        struct {
                unsigned int vector : 8,
                        __reserved_1 : 4,
                        delivery_status : 1,
                        __reserved_2 : 3,
                        mask : 1,
                        timer_mode : 1,
                        __reserved_3 : 14;
                unsigned int __reserved_4[3];
        } lvt_timer;

        struct {
                unsigned int vector : 8,
                        delivery_mode : 3,
                        __reserved_1 : 1,
                        delivery_status : 1,
                        __reserved_2 : 3,
                        mask : 1,
                        __reserved_3 : 15;
                unsigned int __reserved_4[3];
        } lvt_thermal;

        struct {
                unsigned int vector : 8,
                        delivery_mode : 3,
                        __reserved_1 : 1,
                        delivery_status : 1,
                        __reserved_2 : 3,
                        mask : 1,
                        __reserved_3 : 15;
                unsigned int __reserved_4[3];
        } lvt_pc;

        struct {
                unsigned int vector : 8,
                        delivery_mode : 3,
                        __reserved_1 : 1,
                        delivery_status : 1,
                        polarity : 1,
                        remote_irr : 1,
                        trigger : 1,
                        mask : 1,
                        __reserved_2 : 15;
                unsigned int __reserved_3[3];
        } lvt_lint0;

        struct {
                unsigned int vector : 8,
                        delivery_mode : 3,
                        __reserved_1 : 1,
                        delivery_status : 1,
                        polarity : 1,
                        remote_irr : 1,
                        trigger : 1,
                        mask : 1,
                        __reserved_2 : 15;
                unsigned int __reserved_3[3];
        } lvt_lint1;

        struct {
                unsigned int vector : 8,
                        __reserved_1 : 4,
                        delivery_status : 1,
                        __reserved_2 : 3,
                        mask : 1,
                        __reserved_3 : 15;
                unsigned int __reserved_4[3];
        } lvt_error;

        struct {
                unsigned int initial_count;
                unsigned int __reserved_2[3];
        } timer_icr;

        const
        struct {
                unsigned int curr_count;
                unsigned int __reserved_2[3];
        } timer_ccr;

        struct { unsigned int __reserved[4]; } __reserved_16;

        struct { unsigned int __reserved[4]; } __reserved_17;

        struct { unsigned int __reserved[4]; } __reserved_18;

        struct { unsigned int __reserved[4]; } __reserved_19;

        struct {
                unsigned int divisor : 4,
                        __reserved_1 : 28;
                unsigned int __reserved_2[3];
        } timer_dcr;

        struct { unsigned int __reserved[4]; } __reserved_20;

} __attribute__ ((packed));
# 34 "include/asm/fixmap.h" 2



# 1 "include/asm/kmap_types.h" 1
# 11 "include/asm/kmap_types.h"
enum km_type {
 KM_BOUNCE_READ,
 KM_SKB_SUNRPC_DATA,
 KM_SKB_DATA_SOFTIRQ,
 KM_USER0,
 KM_USER1,
 KM_BIO_SRC_IRQ,
 KM_BIO_DST_IRQ,
 KM_PTE0,
 KM_PTE1,
 KM_IRQ0,
 KM_IRQ1,
 KM_SOFTIRQ0,
 KM_SOFTIRQ1,
 KM_TYPE_NR
};
# 38 "include/asm/fixmap.h" 2
# 58 "include/asm/fixmap.h"
enum fixed_addresses {
        FIX_HOLE,
        FIX_VDSO,

        FIX_APIC_BASE,


        FIX_IO_APIC_BASE_0,
        FIX_IO_APIC_BASE_END = FIX_IO_APIC_BASE_0 + 64 -1,
# 78 "include/asm/fixmap.h"
        FIX_CYCLONE_TIMER,


        FIX_KMAP_BEGIN,
        FIX_KMAP_END = FIX_KMAP_BEGIN+(KM_TYPE_NR*32)-1,


        FIX_ACPI_BEGIN,
        FIX_ACPI_END = FIX_ACPI_BEGIN + 4 - 1,


        FIX_PCIE_MCFG,

        __end_of_permanent_fixed_addresses,


        FIX_BTMAP_END = __end_of_permanent_fixed_addresses,
        FIX_BTMAP_BEGIN = FIX_BTMAP_END + 16 - 1,
        FIX_WP_TEST,
        __end_of_fixed_addresses
};

extern void __set_fixmap (enum fixed_addresses idx,
                                        unsigned long phys, pgprot_t flags);
extern void reserve_top_address(unsigned long reserve);
# 125 "include/asm/fixmap.h"
extern void __this_fixmap_does_not_exist(void);






static inline __attribute__((always_inline)) __attribute__((always_inline)) unsigned long fix_to_virt(const unsigned int idx)
{
# 143 "include/asm/fixmap.h"
        if (idx >= __end_of_fixed_addresses)
                __this_fixmap_does_not_exist();

        return (((unsigned long)0xfffff000) - ((idx) << 12));
}

static inline __attribute__((always_inline)) unsigned long virt_to_fix(const unsigned long vaddr)
{
        do { if (__builtin_expect(!!((vaddr >= ((unsigned long)0xfffff000) || vaddr < (((unsigned long)0xfffff000) - (__end_of_permanent_fixed_addresses << 12)))!=0), 0)) do { asm volatile("1:\tud2\n" ".pushsection __bug_table,\"a\"\n" "2:\t.long 1b, %c0\n" "\t.word %c1, 0\n" "\t.org 2b+%c2\n" ".popsection" : : "i" ("include/asm/fixmap.h"), "i" (151), "i" (sizeof(struct bug_entry))); for(;;) ; } while(0); } while(0);
        return ((((unsigned long)0xfffff000) - ((vaddr)&(~((1UL << 12)-1)))) >> 12);
}
# 17 "include/asm/smp.h" 2

# 1 "include/asm/mpspec.h" 1




# 1 "include/asm/mpspec_def.h" 1
# 19 "include/asm/mpspec_def.h"
struct intel_mp_floating
{
        char mpf_signature[4];
        unsigned long mpf_physptr;
        unsigned char mpf_length;
        unsigned char mpf_specification;
        unsigned char mpf_checksum;
        unsigned char mpf_feature1;
        unsigned char mpf_feature2;
        unsigned char mpf_feature3;
        unsigned char mpf_feature4;
        unsigned char mpf_feature5;
};

struct mp_config_table
{
        char mpc_signature[4];

        unsigned short mpc_length;
        char mpc_spec;
        char mpc_checksum;
        char mpc_oem[8];
        char mpc_productid[12];
        unsigned long mpc_oemptr;
        unsigned short mpc_oemsize;
        unsigned short mpc_oemcount;
        unsigned long mpc_lapic;
        unsigned long reserved;
};
# 58 "include/asm/mpspec_def.h"
struct mpc_config_processor
{
        unsigned char mpc_type;
        unsigned char mpc_apicid;
        unsigned char mpc_apicver;
        unsigned char mpc_cpuflag;


        unsigned long mpc_cpufeature;



        unsigned long mpc_featureflag;
        unsigned long mpc_reserved[2];
};

struct mpc_config_bus
{
        unsigned char mpc_type;
        unsigned char mpc_busid;
        unsigned char mpc_bustype[6];
};
# 101 "include/asm/mpspec_def.h"
struct mpc_config_ioapic
{
        unsigned char mpc_type;
        unsigned char mpc_apicid;
        unsigned char mpc_apicver;
        unsigned char mpc_flags;

        unsigned long mpc_apicaddr;
};

struct mpc_config_intsrc
{
        unsigned char mpc_type;
        unsigned char mpc_irqtype;
        unsigned short mpc_irqflag;
        unsigned char mpc_srcbus;
        unsigned char mpc_srcbusirq;
        unsigned char mpc_dstapic;
        unsigned char mpc_dstirq;
};

enum mp_irq_source_types {
        mp_INT = 0,
        mp_NMI = 1,
        mp_SMI = 2,
        mp_ExtINT = 3
};






struct mpc_config_lintsrc
{
        unsigned char mpc_type;
        unsigned char mpc_irqtype;
        unsigned short mpc_irqflag;
        unsigned char mpc_srcbusid;
        unsigned char mpc_srcbusirq;
        unsigned char mpc_destapic;

        unsigned char mpc_destapiclint;
};

struct mp_config_oemtable
{
        char oem_signature[4];

        unsigned short oem_length;
        char oem_rev;
        char oem_checksum;
        char mpc_oem[8];
};

struct mpc_config_translation
{
        unsigned char mpc_type;
        unsigned char trans_len;
        unsigned char trans_type;
        unsigned char trans_quad;
        unsigned char trans_global;
        unsigned char trans_local;
        unsigned short trans_reserved;
};
# 179 "include/asm/mpspec_def.h"
enum mp_bustype {
        MP_BUS_ISA = 1,
        MP_BUS_EISA,
        MP_BUS_PCI,
        MP_BUS_MCA,
};
# 6 "include/asm/mpspec.h" 2
# 1 "include/asm-i386/mach-generic/mach_mpspec.h" 1
# 7 "include/asm/mpspec.h" 2

extern int mp_bus_id_to_type [260];
extern int mp_bus_id_to_node [260];
extern int mp_bus_id_to_local [260];
extern int quad_local_to_mp_bus_id [32/4][4];
extern int mp_bus_id_to_pci_bus [260];

extern unsigned int def_to_bigsmp;
extern unsigned int boot_cpu_physical_apicid;
extern int smp_found_config;
extern void find_smp_config (void);
extern void get_smp_config (void);
extern int nr_ioapics;
extern int apic_version [256];
extern int mp_irq_entries;
extern struct mpc_config_intsrc mp_irqs [256];
extern int mpc_default_type;
extern unsigned long mp_lapic_addr;
extern int pic_mode;
extern int using_apic_timer;


extern void mp_register_lapic (u8 id, u8 enabled);
extern void mp_register_lapic_address (u64 address);
extern void mp_register_ioapic (u8 id, u32 address, u32 gsi_base);
extern void mp_override_legacy_irq (u8 bus_irq, u8 polarity, u8 trigger, u32 gsi);
extern void mp_config_acpi_legacy_irqs (void);
extern int mp_register_gsi (u32 gsi, int edge_level, int active_high_low);




struct physid_mask
{
        unsigned long mask[(((256)+32 -1)/32)];
};

typedef struct physid_mask physid_mask_t;
# 79 "include/asm/mpspec.h"
extern physid_mask_t phys_cpu_present_map;
# 19 "include/asm/smp.h" 2

# 1 "include/asm/io_apic.h" 1
# 18 "include/asm/io_apic.h"
union IO_APIC_reg_00 {
        u32 raw;
        struct {
                u32 __reserved_2 : 14,
                        LTS : 1,
                        delivery_type : 1,
                        __reserved_1 : 8,
                        ID : 8;
        } __attribute__ ((packed)) bits;
};

union IO_APIC_reg_01 {
        u32 raw;
        struct {
                u32 version : 8,
                        __reserved_2 : 7,
                        PRQ : 1,
                        entries : 8,
                        __reserved_1 : 8;
        } __attribute__ ((packed)) bits;
};

union IO_APIC_reg_02 {
        u32 raw;
        struct {
                u32 __reserved_2 : 24,
                        arbitration : 4,
                        __reserved_1 : 4;
        } __attribute__ ((packed)) bits;
};

union IO_APIC_reg_03 {
        u32 raw;
        struct {
                u32 boot_DT : 1,
                        __reserved_1 : 31;
        } __attribute__ ((packed)) bits;
};




extern int nr_ioapics;
extern int nr_ioapic_registers[64];

enum ioapic_irq_destination_types {
        dest_Fixed = 0,
        dest_LowestPrio = 1,
        dest_SMI = 2,
        dest__reserved_1 = 3,
        dest_NMI = 4,
        dest_INIT = 5,
        dest__reserved_2 = 6,
        dest_ExtINT = 7
};

struct IO_APIC_route_entry {
        __u32 vector : 8,
                delivery_mode : 3,



                dest_mode : 1,
                delivery_status : 1,
                polarity : 1,
                irr : 1,
                trigger : 1,
                mask : 1,
                __reserved_2 : 15;

        union { struct { __u32
                                        __reserved_1 : 24,
                                        physical_dest : 4,
                                        __reserved_2 : 4;
                        } physical;

                        struct { __u32
                                        __reserved_1 : 24,
                                        logical_dest : 8;
                        } logical;
        } dest;

} __attribute__ ((packed));






extern struct mpc_config_ioapic mp_ioapics[64];


extern int mp_irq_entries;


extern struct mpc_config_intsrc mp_irqs[256];


extern int mpc_default_type;


extern int sis_apic_bug;


extern int skip_ioapic_setup;

static inline __attribute__((always_inline)) void disable_ioapic_setup(void)
{
        skip_ioapic_setup = 1;
}

static inline __attribute__((always_inline)) int ioapic_setup_disabled(void)
{
        return skip_ioapic_setup;
}
# 141 "include/asm/io_apic.h"
extern int io_apic_get_unique_id (int ioapic, int apic_id);
extern int io_apic_get_version (int ioapic);
extern int io_apic_get_redir_entries (int ioapic);
extern int io_apic_set_pci_routing (int ioapic, int pin, int irq, int edge_level, int active_high_low);
extern int timer_uses_ioapic_pin_0;


extern int (*ioapic_renumber_irq)(int ioapic, int irq);
# 21 "include/asm/smp.h" 2

# 1 "include/asm/apic.h" 1



# 1 "include/linux/pm.h" 1
# 34 "include/linux/pm.h"
typedef int pm_request_t;
# 43 "include/linux/pm.h"
typedef int pm_dev_t;
# 56 "include/linux/pm.h"
enum
{
        PM_SYS_UNKNOWN = 0x00000000,
        PM_SYS_KBC = 0x41d00303,
        PM_SYS_COM = 0x41d00500,
        PM_SYS_IRDA = 0x41d00510,
        PM_SYS_FDC = 0x41d00700,
        PM_SYS_VGA = 0x41d00900,
        PM_SYS_PCMCIA = 0x41d00e00,
};
# 75 "include/linux/pm.h"
struct pm_dev;

typedef int (*pm_callback)(struct pm_dev *dev, pm_request_t rqst, void *data);




struct pm_dev
{
        pm_dev_t type;
        unsigned long id;
        pm_callback callback;
        void *data;

        unsigned long flags;
        unsigned long state;
        unsigned long prev_state;

        struct list_head entry;
};







extern void (*pm_idle)(void);
extern void (*pm_power_off)(void);

typedef int suspend_state_t;







typedef int suspend_disk_method_t;
# 123 "include/linux/pm.h"
struct pm_ops {
        suspend_disk_method_t pm_disk_mode;
        int (*valid)(suspend_state_t state);
        int (*prepare)(suspend_state_t state);
        int (*enter)(suspend_state_t state);
        int (*finish)(suspend_state_t state);
};

extern void pm_set_ops(struct pm_ops *);
extern struct pm_ops *pm_ops;
extern int pm_suspend(suspend_state_t state);






struct device;

typedef struct pm_message {
        int event;
} pm_message_t;
# 205 "include/linux/pm.h"
struct dev_pm_info {
        pm_message_t power_state;
        unsigned can_wakeup:1;

        unsigned should_wakeup:1;
        pm_message_t prev_state;
        void * saved_state;
        struct device * pm_parent;
        struct list_head entry;

};

extern void device_pm_set_parent(struct device * dev, struct device * parent);

extern int device_power_down(pm_message_t state);
extern void device_power_up(void);
extern void device_resume(void);


extern suspend_disk_method_t pm_disk_mode;

extern int device_suspend(pm_message_t state);
extern int device_prepare_suspend(pm_message_t state);






extern int dpm_runtime_suspend(struct device *, pm_message_t);
extern void dpm_runtime_resume(struct device *);
extern void __suspend_report_result(const char *function, void *fn, int ret);
# 5 "include/asm/apic.h" 2
# 19 "include/asm/apic.h"
extern int apic_verbosity;
# 33 "include/asm/apic.h"
extern void generic_apic_probe(void);
# 48 "include/asm/apic.h"
static __inline __attribute__((always_inline)) __attribute__((regparm(3))) void native_apic_write(unsigned long reg,
                                                unsigned long v)
{
        *((volatile unsigned long *)((fix_to_virt(FIX_APIC_BASE))+reg)) = v;
}

static __inline __attribute__((always_inline)) __attribute__((regparm(3))) void native_apic_write_atomic(unsigned long reg,
                                                       unsigned long v)
{
        ((__typeof__(*((volatile unsigned long *)((fix_to_virt(FIX_APIC_BASE))+reg))))__xchg((unsigned long)(v),((volatile unsigned long *)((fix_to_virt(FIX_APIC_BASE))+reg)),sizeof(*((volatile unsigned long *)((fix_to_virt(FIX_APIC_BASE))+reg)))));
}

static __inline __attribute__((always_inline)) __attribute__((regparm(3))) unsigned long native_apic_read(unsigned long reg)
{
        return *((volatile unsigned long *)((fix_to_virt(FIX_APIC_BASE))+reg));
}

static __inline__ __attribute__((always_inline)) void apic_wait_icr_idle(void)
{
        while ( native_apic_read( 0x300 ) & 0x01000 )
                rep_nop();
}

int get_physical_broadcast(void);
# 83 "include/asm/apic.h"
static inline __attribute__((always_inline)) void ack_APIC_irq(void)
{
# 93 "include/asm/apic.h"
        native_apic_write((0xB0),(0));
}

extern void (*wait_timer_tick)(void);

extern int get_maxlvt(void);
extern void clear_local_APIC(void);
extern void connect_bsp_APIC (void);
extern void disconnect_bsp_APIC (int virt_wire_setup);
extern void disable_local_APIC (void);
extern void lapic_shutdown (void);
extern int verify_local_APIC (void);
extern void cache_APIC_registers (void);
extern void sync_Arb_IDs (void);
extern void init_bsp_APIC (void);
extern void setup_local_APIC (void);
extern void init_apic_mappings (void);
extern void smp_local_timer_interrupt (void);
extern void setup_boot_APIC_clock (void);
extern void setup_secondary_APIC_clock (void);
extern int APIC_init_uniprocessor (void);
extern void disable_APIC_timer(void);
extern void enable_APIC_timer(void);

extern void enable_NMI_through_LVT0 (void * dummy);

void smp_send_timer_broadcast_ipi(void);
void switch_APIC_timer_to_ipi(void *cpumask);
void switch_ipi_to_APIC_timer(void *cpumask);


extern int timer_over_8254;
# 23 "include/asm/smp.h" 2
# 34 "include/asm/smp.h"
extern void smp_alloc_memory(void);
extern int pic_mode;
extern int smp_num_siblings;
extern cpumask_t cpu_sibling_map[];
extern cpumask_t cpu_core_map[];

extern void (*mtrr_hook) (void);
extern void zap_low_mappings (void);
extern void lock_ipi_call_lock(void);
extern void unlock_ipi_call_lock(void);


extern u8 x86_cpu_to_apicid[];
# 62 "include/asm/smp.h"
extern cpumask_t cpu_callout_map;
extern cpumask_t cpu_callin_map;
extern cpumask_t cpu_possible_map;


static inline __attribute__((always_inline)) int num_booting_cpus(void)
{
        return __cpus_weight(&(cpu_callout_map), 32);
}






# 1 "include/asm-i386/mach-generic/mach_apicdef.h" 1




# 1 "include/asm/genapic.h" 1
# 17 "include/asm/genapic.h"
struct mpc_config_translation;
struct mpc_config_bus;
struct mp_config_table;
struct mpc_config_processor;

struct genapic {
        char *name;
        int (*probe)(void);

        int (*apic_id_registered)(void);
        cpumask_t (*target_cpus)(void);
        int int_delivery_mode;
        int int_dest_mode;
        int ESR_DISABLE;
        int apic_destination_logical;
        unsigned long (*check_apicid_used)(physid_mask_t bitmap, int apicid);
        unsigned long (*check_apicid_present)(int apicid);
        int no_balance_irq;
        int no_ioapic_check;
        void (*init_apic_ldr)(void);
        physid_mask_t (*ioapic_phys_id_map)(physid_mask_t map);

        void (*clustered_apic_check)(void);
        int (*multi_timer_check)(int apic, int irq);
        int (*apicid_to_node)(int logical_apicid);
        int (*cpu_to_logical_apicid)(int cpu);
        int (*cpu_present_to_apicid)(int mps_cpu);
        physid_mask_t (*apicid_to_cpu_present)(int phys_apicid);
        int (*mpc_apic_id)(struct mpc_config_processor *m,
                           struct mpc_config_translation *t);
        void (*setup_portio_remap)(void);
        int (*check_phys_apicid_present)(int boot_cpu_physical_apicid);
        void (*enable_apic_mode)(void);
        u32 (*phys_pkg_id)(u32 cpuid_apic, int index_msb);


        void (*mpc_oem_bus_info)(struct mpc_config_bus *, char *,
                                 struct mpc_config_translation *);
        void (*mpc_oem_pci_bus)(struct mpc_config_bus *,
                                struct mpc_config_translation *);




        int (*mps_oem_check)(struct mp_config_table *mpc, char *oem,
                              char *productid);
        int (*acpi_madt_oem_check)(char *oem_id, char *oem_table_id);

        unsigned (*get_apic_id)(unsigned long x);
        unsigned long apic_id_mask;
        unsigned int (*cpu_mask_to_apicid)(cpumask_t cpumask);



        void (*send_IPI_mask)(cpumask_t mask, int vector);
        void (*send_IPI_allbutself)(int vector);
        void (*send_IPI_all)(int vector);

};
# 125 "include/asm/genapic.h"
extern struct genapic *genapic, apic_default;
# 6 "include/asm-i386/mach-generic/mach_apicdef.h" 2
# 78 "include/asm/smp.h" 2
static inline __attribute__((always_inline)) int hard_smp_processor_id(void)
{

        return (genapic->get_apic_id)(*(unsigned long *)((fix_to_virt(FIX_APIC_BASE))+0x20));
}



extern int safe_smp_processor_id(void);
extern int __cpu_disable(void);
extern void __cpu_die(unsigned int cpu);
extern unsigned int num_processors;
# 104 "include/asm/smp.h"
extern u8 apicid_2_node[];


static __inline __attribute__((always_inline)) int logical_smp_processor_id(void)
{

        return (((*(unsigned long *)((fix_to_virt(FIX_APIC_BASE))+0xD0))>>24)&0xFF);
}
# 19 "include/linux/smp.h" 2
# 28 "include/linux/smp.h"
extern void smp_send_stop(void);




extern void smp_send_reschedule(int cpu);





extern void smp_prepare_cpus(unsigned int max_cpus);




extern int __cpu_up(unsigned int cpunum);




extern void smp_cpus_done(unsigned int max_cpus);




int smp_call_function(void(*func)(void *info), void *info, int retry, int wait);

int smp_call_function_single(int cpuid, void (*func) (void *info), void *info,
                                int retry, int wait);




int on_each_cpu(void (*func) (void *info), void *info, int retry, int wait);
# 78 "include/linux/smp.h"
void smp_prepare_boot_cpu(void);
# 138 "include/linux/smp.h"
void smp_setup_processor_id(void);
# 66 "include/linux/sched.h" 2
# 1 "include/linux/sem.h" 1



# 1 "include/linux/ipc.h" 1
# 9 "include/linux/ipc.h"
struct ipc_perm
{
        __kernel_key_t key;
        __kernel_uid_t uid;
        __kernel_gid_t gid;
        __kernel_uid_t cuid;
        __kernel_gid_t cgid;
        __kernel_mode_t mode;
        unsigned short seq;
};


# 1 "include/asm/ipcbuf.h" 1
# 14 "include/asm/ipcbuf.h"
struct ipc64_perm
{
        __kernel_key_t key;
        __kernel_uid32_t uid;
        __kernel_gid32_t gid;
        __kernel_uid32_t cuid;
        __kernel_gid32_t cgid;
        __kernel_mode_t mode;
        unsigned short __pad1;
        unsigned short seq;
        unsigned short __pad2;
        unsigned long __unused1;
        unsigned long __unused2;
};
# 22 "include/linux/ipc.h" 2
# 54 "include/linux/ipc.h"
# 1 "include/linux/kref.h" 1
# 23 "include/linux/kref.h"
struct kref {
        atomic_t refcount;
};

void kref_init(struct kref *kref);
void kref_get(struct kref *kref);
int kref_put(struct kref *kref, void (*release) (struct kref *kref));
# 55 "include/linux/ipc.h" 2




struct kern_ipc_perm
{
        spinlock_t lock;
        int deleted;
        key_t key;
        uid_t uid;
        gid_t gid;
        uid_t cuid;
        gid_t cgid;
        mode_t mode;
        unsigned long seq;
        void *security;
};

struct ipc_ids;
struct ipc_namespace {
        struct kref kref;
        struct ipc_ids *ids[3];

        int sem_ctls[4];
        int used_sems;

        int msg_ctlmax;
        int msg_ctlmnb;
        int msg_ctlmni;

        size_t shm_ctlmax;
        size_t shm_ctlall;
        int shm_ctlmni;
        int shm_tot;
};

extern struct ipc_namespace init_ipc_ns;
# 104 "include/linux/ipc.h"
static inline __attribute__((always_inline)) int copy_ipcs(unsigned long flags, struct task_struct *tsk)
{
        return 0;
}


static inline __attribute__((always_inline)) struct ipc_namespace *get_ipc_ns(struct ipc_namespace *ns)
{




        return ns;
}

static inline __attribute__((always_inline)) void put_ipc_ns(struct ipc_namespace *ns)
{



}
# 5 "include/linux/sem.h" 2
# 23 "include/linux/sem.h"
struct semid_ds {
        struct ipc_perm sem_perm;
        __kernel_time_t sem_otime;
        __kernel_time_t sem_ctime;
        struct sem *sem_base;
        struct sem_queue *sem_pending;
        struct sem_queue **sem_pending_last;
        struct sem_undo *undo;
        unsigned short sem_nsems;
};


# 1 "include/asm/sembuf.h" 1
# 14 "include/asm/sembuf.h"
struct semid64_ds {
        struct ipc64_perm sem_perm;
        __kernel_time_t sem_otime;
        unsigned long __unused1;
        __kernel_time_t sem_ctime;
        unsigned long __unused2;
        unsigned long sem_nsems;
        unsigned long __unused3;
        unsigned long __unused4;
};
# 36 "include/linux/sem.h" 2


struct sembuf {
        unsigned short sem_num;
        short sem_op;
        short sem_flg;
};


union semun {
        int val;
        struct semid_ds *buf;
        unsigned short *array;
        struct seminfo *__buf;
        void *__pad;
};

struct seminfo {
        int semmap;
        int semmni;
        int semmns;
        int semmnu;
        int semmsl;
        int semopm;
        int semume;
        int semusz;
        int semvmx;
        int semaem;
};
# 82 "include/linux/sem.h"
struct task_struct;


struct sem {
        int semval;
        int sempid;
};


struct sem_array {
        struct kern_ipc_perm sem_perm;
        int sem_id;
        time_t sem_otime;
        time_t sem_ctime;
        struct sem *sem_base;
        struct sem_queue *sem_pending;
        struct sem_queue **sem_pending_last;
        struct sem_undo *undo;
        unsigned long sem_nsems;
};


struct sem_queue {
        struct sem_queue * next;
        struct sem_queue ** prev;
        struct task_struct* sleeper;
        struct sem_undo * undo;
        int pid;
        int status;
        struct sem_array * sma;
        int id;
        struct sembuf * sops;
        int nsops;
        int alter;
};




struct sem_undo {
        struct sem_undo * proc_next;
        struct sem_undo * id_next;
        int semid;
        short * semadj;
};




struct sem_undo_list {
        atomic_t refcnt;
        spinlock_t lock;
        struct sem_undo *proc_list;
};

struct sysv_sem {
        struct sem_undo_list *undo_list;
};



extern int copy_semundo(unsigned long clone_flags, struct task_struct *tsk);
extern void exit_sem(struct task_struct *tsk);
# 67 "include/linux/sched.h" 2
# 1 "include/linux/signal.h" 1



# 1 "include/asm/signal.h" 1
# 9 "include/asm/signal.h"
struct siginfo;
# 22 "include/asm/signal.h"
typedef unsigned long old_sigset_t;

typedef struct {
        unsigned long sig[(64 / 32)];
} sigset_t;
# 113 "include/asm/signal.h"
# 1 "include/asm-generic/signal.h" 1
# 17 "include/asm-generic/signal.h"
typedef void __signalfn_t(int);
typedef __signalfn_t *__sighandler_t;

typedef void __restorefn_t(void);
typedef __restorefn_t *__sigrestore_t;
# 114 "include/asm/signal.h" 2


struct old_sigaction {
        __sighandler_t sa_handler;
        old_sigset_t sa_mask;
        unsigned long sa_flags;
        __sigrestore_t sa_restorer;
};

struct sigaction {
        __sighandler_t sa_handler;
        unsigned long sa_flags;
        __sigrestore_t sa_restorer;
        sigset_t sa_mask;
};

struct k_sigaction {
        struct sigaction sa;
};
# 151 "include/asm/signal.h"
typedef struct sigaltstack {
        void *ss_sp;
        int ss_flags;
        size_t ss_size;
} stack_t;
# 167 "include/asm/signal.h"
static __inline__ __attribute__((always_inline)) void __gen_sigaddset(sigset_t *set, int _sig)
{
        __asm__("btsl %1,%0" : "+m"(*set) : "Ir"(_sig - 1) : "cc");
}

static __inline__ __attribute__((always_inline)) void __const_sigaddset(sigset_t *set, int _sig)
{
        unsigned long sig = _sig - 1;
        set->sig[sig / 32] |= 1 << (sig % 32);
}







static __inline__ __attribute__((always_inline)) void __gen_sigdelset(sigset_t *set, int _sig)
{
        __asm__("btrl %1,%0" : "+m"(*set) : "Ir"(_sig - 1) : "cc");
}

static __inline__ __attribute__((always_inline)) void __const_sigdelset(sigset_t *set, int _sig)
{
        unsigned long sig = _sig - 1;
        set->sig[sig / 32] &= ~(1 << (sig % 32));
}

static __inline__ __attribute__((always_inline)) int __const_sigismember(sigset_t *set, int _sig)
{
        unsigned long sig = _sig - 1;
        return 1 & (set->sig[sig / 32] >> (sig % 32));
}

static __inline__ __attribute__((always_inline)) int __gen_sigismember(sigset_t *set, int _sig)
{
        int ret;
        __asm__("btl %2,%1\n\tsbbl %0,%0"
                : "=r"(ret) : "m"(*set), "Ir"(_sig-1) : "cc");
        return ret;
}






static __inline__ __attribute__((always_inline)) int sigfindinword(unsigned long word)
{
        __asm__("bsfl %1,%0" : "=r"(word) : "rm"(word) : "cc");
        return word;
}

struct pt_regs;
# 5 "include/linux/signal.h" 2
# 1 "include/asm/siginfo.h" 1



# 1 "include/asm-generic/siginfo.h" 1






typedef union sigval {
        int sival_int;
        void *sival_ptr;
} sigval_t;
# 40 "include/asm-generic/siginfo.h"
typedef struct siginfo {
        int si_signo;
        int si_errno;
        int si_code;

        union {
                int _pad[((128 - (3 * sizeof(int))) / sizeof(int))];


                struct {
                        pid_t _pid;
                        uid_t _uid;
                } _kill;


                struct {
                        timer_t _tid;
                        int _overrun;
                        char _pad[sizeof( uid_t) - sizeof(int)];
                        sigval_t _sigval;
                        int _sys_private;
                } _timer;


                struct {
                        pid_t _pid;
                        uid_t _uid;
                        sigval_t _sigval;
                } _rt;


                struct {
                        pid_t _pid;
                        uid_t _uid;
                        int _status;
                        clock_t _utime;
                        clock_t _stime;
                } _sigchld;


                struct {
                        void *_addr;



                } _sigfault;


                struct {
                        long _band;
                        int _fd;
                } _sigpoll;
        } _sifields;
} siginfo_t;
# 251 "include/asm-generic/siginfo.h"
typedef struct sigevent {
        sigval_t sigev_value;
        int sigev_signo;
        int sigev_notify;
        union {
                int _pad[((64 - (sizeof(int) * 2 + sizeof(sigval_t))) / sizeof(int))];
                 int _tid;

                struct {
                        void (*_function)(sigval_t);
                        void *_attribute;
                } _sigev_thread;
        } _sigev_un;
} sigevent_t;







struct siginfo;
void do_schedule_next_timer(struct siginfo *info);





static inline __attribute__((always_inline)) void copy_siginfo(struct siginfo *to, struct siginfo *from)
{
        if (from->si_code < 0)
                (__builtin_constant_p(sizeof(*to)) ? __constant_memcpy((to),(from),(sizeof(*to))) : __memcpy((to),(from),(sizeof(*to))));
        else

                (__builtin_constant_p((3 * sizeof(int)) + sizeof(from->_sifields._sigchld)) ? __constant_memcpy((to),(from),((3 * sizeof(int)) + sizeof(from->_sifields._sigchld))) : __memcpy((to),(from),((3 * sizeof(int)) + sizeof(from->_sifields._sigchld))));
}



extern int copy_siginfo_to_user(struct siginfo *to, struct siginfo *from);
# 5 "include/asm/siginfo.h" 2
# 6 "include/linux/signal.h" 2
# 15 "include/linux/signal.h"
struct sigqueue {
        struct list_head list;
        int flags;
        siginfo_t info;
        struct user_struct *user;
};




struct sigpending {
        struct list_head list;
        sigset_t signal;
};
# 73 "include/linux/signal.h"
static inline __attribute__((always_inline)) int sigisemptyset(sigset_t *set)
{
        extern void _NSIG_WORDS_is_unsupported_size(void);
        switch ((64 / 32)) {
        case 4:
                return (set->sig[3] | set->sig[2] |
                        set->sig[1] | set->sig[0]) == 0;
        case 2:
                return (set->sig[1] | set->sig[0]) == 0;
        case 1:
                return set->sig[0] == 0;
        default:
                _NSIG_WORDS_is_unsupported_size();
                return 0;
        }
}
# 120 "include/linux/signal.h"
static inline __attribute__((always_inline)) void sigorsets(sigset_t *r, const sigset_t *a, const sigset_t *b) { extern void _NSIG_WORDS_is_unsupported_size(void); unsigned long a0, a1, a2, a3, b0, b1, b2, b3; switch ((64 / 32)) { case 4: a3 = a->sig[3]; a2 = a->sig[2]; b3 = b->sig[3]; b2 = b->sig[2]; r->sig[3] = ((a3) | (b3)); r->sig[2] = ((a2) | (b2)); case 2: a1 = a->sig[1]; b1 = b->sig[1]; r->sig[1] = ((a1) | (b1)); case 1: a0 = a->sig[0]; b0 = b->sig[0]; r->sig[0] = ((a0) | (b0)); break; default: _NSIG_WORDS_is_unsupported_size(); } }


static inline __attribute__((always_inline)) void sigandsets(sigset_t *r, const sigset_t *a, const sigset_t *b) { extern void _NSIG_WORDS_is_unsupported_size(void); unsigned long a0, a1, a2, a3, b0, b1, b2, b3; switch ((64 / 32)) { case 4: a3 = a->sig[3]; a2 = a->sig[2]; b3 = b->sig[3]; b2 = b->sig[2]; r->sig[3] = ((a3) & (b3)); r->sig[2] = ((a2) & (b2)); case 2: a1 = a->sig[1]; b1 = b->sig[1]; r->sig[1] = ((a1) & (b1)); case 1: a0 = a->sig[0]; b0 = b->sig[0]; r->sig[0] = ((a0) & (b0)); break; default: _NSIG_WORDS_is_unsupported_size(); } }


static inline __attribute__((always_inline)) void signandsets(sigset_t *r, const sigset_t *a, const sigset_t *b) { extern void _NSIG_WORDS_is_unsupported_size(void); unsigned long a0, a1, a2, a3, b0, b1, b2, b3; switch ((64 / 32)) { case 4: a3 = a->sig[3]; a2 = a->sig[2]; b3 = b->sig[3]; b2 = b->sig[2]; r->sig[3] = ((a3) & ~(b3)); r->sig[2] = ((a2) & ~(b2)); case 2: a1 = a->sig[1]; b1 = b->sig[1]; r->sig[1] = ((a1) & ~(b1)); case 1: a0 = a->sig[0]; b0 = b->sig[0]; r->sig[0] = ((a0) & ~(b0)); break; default: _NSIG_WORDS_is_unsupported_size(); } }
# 150 "include/linux/signal.h"
static inline __attribute__((always_inline)) void signotset(sigset_t *set) { extern void _NSIG_WORDS_is_unsupported_size(void); switch ((64 / 32)) { case 4: set->sig[3] = (~(set->sig[3])); set->sig[2] = (~(set->sig[2])); case 2: set->sig[1] = (~(set->sig[1])); case 1: set->sig[0] = (~(set->sig[0])); break; default: _NSIG_WORDS_is_unsupported_size(); } }




static inline __attribute__((always_inline)) void sigemptyset(sigset_t *set)
{
        switch ((64 / 32)) {
        default:
                (__builtin_constant_p(0) ? (__builtin_constant_p((sizeof(sigset_t))) ? __constant_c_and_count_memset(((set)),((0x01010101UL*(unsigned char)(0))),((sizeof(sigset_t)))) : __constant_c_memset(((set)),((0x01010101UL*(unsigned char)(0))),((sizeof(sigset_t))))) : (__builtin_constant_p((sizeof(sigset_t))) ? __memset_generic((((set))),(((0))),(((sizeof(sigset_t))))) : __memset_generic(((set)),((0)),((sizeof(sigset_t))))));
                break;
        case 2: set->sig[1] = 0;
        case 1: set->sig[0] = 0;
                break;
        }
}

static inline __attribute__((always_inline)) void sigfillset(sigset_t *set)
{
        switch ((64 / 32)) {
        default:
                (__builtin_constant_p(-1) ? (__builtin_constant_p((sizeof(sigset_t))) ? __constant_c_and_count_memset(((set)),((0x01010101UL*(unsigned char)(-1))),((sizeof(sigset_t)))) : __constant_c_memset(((set)),((0x01010101UL*(unsigned char)(-1))),((sizeof(sigset_t))))) : (__builtin_constant_p((sizeof(sigset_t))) ? __memset_generic((((set))),(((-1))),(((sizeof(sigset_t))))) : __memset_generic(((set)),((-1)),((sizeof(sigset_t))))));
                break;
        case 2: set->sig[1] = -1;
        case 1: set->sig[0] = -1;
                break;
        }
}



static inline __attribute__((always_inline)) void sigaddsetmask(sigset_t *set, unsigned long mask)
{
        set->sig[0] |= mask;
}

static inline __attribute__((always_inline)) void sigdelsetmask(sigset_t *set, unsigned long mask)
{
        set->sig[0] &= ~mask;
}

static inline __attribute__((always_inline)) int sigtestsetmask(sigset_t *set, unsigned long mask)
{
        return (set->sig[0] & mask) != 0;
}

static inline __attribute__((always_inline)) void siginitset(sigset_t *set, unsigned long mask)
{
        set->sig[0] = mask;
        switch ((64 / 32)) {
        default:
                (__builtin_constant_p(0) ? (__builtin_constant_p((sizeof(long)*((64 / 32)-1))) ? __constant_c_and_count_memset(((&set->sig[1])),((0x01010101UL*(unsigned char)(0))),((sizeof(long)*((64 / 32)-1)))) : __constant_c_memset(((&set->sig[1])),((0x01010101UL*(unsigned char)(0))),((sizeof(long)*((64 / 32)-1))))) : (__builtin_constant_p((sizeof(long)*((64 / 32)-1))) ? __memset_generic((((&set->sig[1]))),(((0))),(((sizeof(long)*((64 / 32)-1))))) : __memset_generic(((&set->sig[1])),((0)),((sizeof(long)*((64 / 32)-1))))));
                break;
        case 2: set->sig[1] = 0;
        case 1: ;
        }
}

static inline __attribute__((always_inline)) void siginitsetinv(sigset_t *set, unsigned long mask)
{
        set->sig[0] = ~mask;
        switch ((64 / 32)) {
        default:
                (__builtin_constant_p(-1) ? (__builtin_constant_p((sizeof(long)*((64 / 32)-1))) ? __constant_c_and_count_memset(((&set->sig[1])),((0x01010101UL*(unsigned char)(-1))),((sizeof(long)*((64 / 32)-1)))) : __constant_c_memset(((&set->sig[1])),((0x01010101UL*(unsigned char)(-1))),((sizeof(long)*((64 / 32)-1))))) : (__builtin_constant_p((sizeof(long)*((64 / 32)-1))) ? __memset_generic((((&set->sig[1]))),(((-1))),(((sizeof(long)*((64 / 32)-1))))) : __memset_generic(((&set->sig[1])),((-1)),((sizeof(long)*((64 / 32)-1))))));
                break;
        case 2: set->sig[1] = -1;
        case 1: ;
        }
}



static inline __attribute__((always_inline)) void init_sigpending(struct sigpending *sig)
{
        sigemptyset(&sig->signal);
        INIT_LIST_HEAD(&sig->list);
}

extern void flush_sigqueue(struct sigpending *queue);


static inline __attribute__((always_inline)) int valid_signal(unsigned long sig)
{
        return sig <= 64 ? 1 : 0;
}

extern int group_send_sig_info(int sig, struct siginfo *info, struct task_struct *p);
extern int __group_send_sig_info(int, struct siginfo *, struct task_struct *);
extern long do_sigpending(void *, unsigned long);
extern int sigprocmask(int, sigset_t *, sigset_t *);

struct pt_regs;
extern int get_signal_to_deliver(siginfo_t *info, struct k_sigaction *return_ka, struct pt_regs *regs, void *cookie);

extern struct kmem_cache *sighand_cachep;
# 68 "include/linux/sched.h" 2
# 1 "include/linux/securebits.h" 1





extern unsigned securebits;
# 69 "include/linux/sched.h" 2
# 1 "include/linux/fs_struct.h" 1



struct dentry;
struct vfsmount;

struct fs_struct {
        atomic_t count;
        rwlock_t lock;
        int umask;
        struct dentry * root, * pwd, * altroot;
        struct vfsmount * rootmnt, * pwdmnt, * altrootmnt;
};







extern struct kmem_cache *fs_cachep;

extern void exit_fs(struct task_struct *);
extern void set_fs_altroot(void);
extern void set_fs_root(struct fs_struct *, struct vfsmount *, struct dentry *);
extern void set_fs_pwd(struct fs_struct *, struct vfsmount *, struct dentry *);
extern struct fs_struct *copy_fs_struct(struct fs_struct *);
extern void put_fs_struct(struct fs_struct *);
# 70 "include/linux/sched.h" 2

# 1 "include/linux/completion.h" 1
# 13 "include/linux/completion.h"
struct completion {
        unsigned int done;
        wait_queue_head_t wait;
};
# 39 "include/linux/completion.h"
static inline __attribute__((always_inline)) void init_completion(struct completion *x)
{
        x->done = 0;
        init_waitqueue_head(&x->wait);
}

extern void wait_for_completion(struct completion *) __attribute__((regparm(3)));
extern int wait_for_completion_interruptible(struct completion *x) __attribute__((regparm(3)));
extern unsigned long wait_for_completion_timeout(struct completion *x, unsigned long timeout) __attribute__((regparm(3)));

extern unsigned long wait_for_completion_interruptible_timeout( struct completion *x, unsigned long timeout) __attribute__((regparm(3)));


extern void complete(struct completion *) __attribute__((regparm(3)));
extern void complete_all(struct completion *) __attribute__((regparm(3)));
# 72 "include/linux/sched.h" 2
# 1 "include/linux/pid.h" 1



# 1 "include/linux/rcupdate.h" 1
# 41 "include/linux/rcupdate.h"
# 1 "include/linux/percpu.h" 1




# 1 "include/linux/slab.h" 1
# 14 "include/linux/slab.h"
# 1 "include/linux/gfp.h" 1



# 1 "include/linux/mmzone.h" 1
# 27 "include/linux/mmzone.h"
struct free_area {
        struct list_head free_list;
        unsigned long nr_free;
};

struct pglist_data;
# 41 "include/linux/mmzone.h"
struct zone_padding {
        char x[0];
} __attribute__((__aligned__(1 << ((7)))));





enum zone_stat_item {
        NR_ANON_PAGES,
        NR_FILE_MAPPED,

        NR_FILE_PAGES,
        NR_SLAB_RECLAIMABLE,
        NR_SLAB_UNRECLAIMABLE,
        NR_PAGETABLE,
        NR_FILE_DIRTY,
        NR_WRITEBACK,
        NR_UNSTABLE_NFS,
        NR_BOUNCE,
        NR_VMSCAN_WRITE,
# 70 "include/linux/mmzone.h"
        NR_VM_ZONE_STAT_ITEMS };

struct per_cpu_pages {
        int count;
        int high;
        int batch;
        struct list_head list;
};

struct per_cpu_pageset {
        struct per_cpu_pages pcp[2];

        s8 stat_threshold;
        s8 vm_stat_diff[NR_VM_ZONE_STAT_ITEMS];

} __attribute__((__aligned__((1 << (7)))));







enum zone_type {
# 113 "include/linux/mmzone.h"
        ZONE_DMA,
# 127 "include/linux/mmzone.h"
        ZONE_NORMAL,
# 137 "include/linux/mmzone.h"
        ZONE_HIGHMEM,

        MAX_NR_ZONES
};
# 156 "include/linux/mmzone.h"
struct zone {

        unsigned long free_pages;
        unsigned long pages_min, pages_low, pages_high;
# 168 "include/linux/mmzone.h"
        unsigned long lowmem_reserve[MAX_NR_ZONES];
# 179 "include/linux/mmzone.h"
        struct per_cpu_pageset pageset[32];




        spinlock_t lock;




        struct free_area free_area[11];


        struct zone_padding _pad1_;


        spinlock_t lru_lock;
        struct list_head active_list;
        struct list_head inactive_list;
        unsigned long nr_scan_active;
        unsigned long nr_scan_inactive;
        unsigned long nr_active;
        unsigned long nr_inactive;
        unsigned long pages_scanned;
        int all_unreclaimable;


        atomic_t reclaim_in_progress;


        atomic_long_t vm_stat[NR_VM_ZONE_STAT_ITEMS];
# 224 "include/linux/mmzone.h"
        int prev_priority;


        struct zone_padding _pad2_;
# 254 "include/linux/mmzone.h"
        wait_queue_head_t * wait_table;
        unsigned long wait_table_hash_nr_entries;
        unsigned long wait_table_bits;




        struct pglist_data *zone_pgdat;

        unsigned long zone_start_pfn;
# 275 "include/linux/mmzone.h"
        unsigned long spanned_pages;
        unsigned long present_pages;




        const char *name;
} __attribute__((__aligned__(1 << ((7)))));
# 360 "include/linux/mmzone.h"
struct zonelist_cache;
# 373 "include/linux/mmzone.h"
struct zonelist {
        struct zonelist_cache *zlcache_ptr;
        struct zone *zones[((1 << 0) * MAX_NR_ZONES) + 1];



};


struct node_active_region {
        unsigned long start_pfn;
        unsigned long end_pfn;
        int nid;
};




extern struct page *mem_map;
# 405 "include/linux/mmzone.h"
struct bootmem_data;
typedef struct pglist_data {
        struct zone node_zones[MAX_NR_ZONES];
        struct zonelist node_zonelists[MAX_NR_ZONES];
        int nr_zones;

        struct page *node_mem_map;

        struct bootmem_data *bdata;
# 424 "include/linux/mmzone.h"
        unsigned long node_start_pfn;
        unsigned long node_present_pages;
        unsigned long node_spanned_pages;

        int node_id;
        wait_queue_head_t kswapd_wait;
        struct task_struct *kswapd;
        int kswapd_max_order;
} pg_data_t;
# 443 "include/linux/mmzone.h"
# 1 "include/linux/memory_hotplug.h" 1



# 1 "include/linux/mmzone.h" 1
# 5 "include/linux/memory_hotplug.h" 2


# 1 "include/linux/notifier.h" 1
# 13 "include/linux/notifier.h"
# 1 "include/linux/mutex.h" 1
# 47 "include/linux/mutex.h"
struct mutex {

        atomic_t count;
        spinlock_t wait_lock;
        struct list_head wait_list;
# 60 "include/linux/mutex.h"
};





struct mutex_waiter {
        struct list_head list;
        struct task_struct *task;




};
# 105 "include/linux/mutex.h"
extern void __mutex_init(struct mutex *lock, const char *name,
                         struct lock_class_key *key);







static inline __attribute__((always_inline)) int __attribute__((regparm(3))) mutex_is_locked(struct mutex *lock)
{
        return ((&lock->count)->counter) != 1;
}





extern void __attribute__((regparm(3))) mutex_lock(struct mutex *lock);
extern int __attribute__((regparm(3))) mutex_lock_interruptible(struct mutex *lock);
# 138 "include/linux/mutex.h"
extern int __attribute__((regparm(3))) mutex_trylock(struct mutex *lock);
extern void __attribute__((regparm(3))) mutex_unlock(struct mutex *lock);
# 14 "include/linux/notifier.h" 2

# 1 "include/linux/srcu.h" 1
# 30 "include/linux/srcu.h"
struct srcu_struct_array {
        int c[2];
};

struct srcu_struct {
        int completed;
        struct srcu_struct_array *per_cpu_ref;
        struct mutex mutex;
};







int init_srcu_struct(struct srcu_struct *sp);
void cleanup_srcu_struct(struct srcu_struct *sp);
int srcu_read_lock(struct srcu_struct *sp) ;
void srcu_read_unlock(struct srcu_struct *sp, int idx) ;
void synchronize_srcu(struct srcu_struct *sp);
long srcu_batches_completed(struct srcu_struct *sp);
# 16 "include/linux/notifier.h" 2
# 50 "include/linux/notifier.h"
struct notifier_block {
        int (*notifier_call)(struct notifier_block *, unsigned long, void *);
        struct notifier_block *next;
        int priority;
};

struct atomic_notifier_head {
        spinlock_t lock;
        struct notifier_block *head;
};

struct blocking_notifier_head {
        struct rw_semaphore rwsem;
        struct notifier_block *head;
};

struct raw_notifier_head {
        struct notifier_block *head;
};

struct srcu_notifier_head {
        struct mutex mutex;
        struct srcu_struct srcu;
        struct notifier_block *head;
};
# 89 "include/linux/notifier.h"
extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
# 115 "include/linux/notifier.h"
extern int atomic_notifier_chain_register(struct atomic_notifier_head *,
                struct notifier_block *);
extern int blocking_notifier_chain_register(struct blocking_notifier_head *,
                struct notifier_block *);
extern int raw_notifier_chain_register(struct raw_notifier_head *,
                struct notifier_block *);
extern int srcu_notifier_chain_register(struct srcu_notifier_head *,
                struct notifier_block *);

extern int atomic_notifier_chain_unregister(struct atomic_notifier_head *,
                struct notifier_block *);
extern int blocking_notifier_chain_unregister(struct blocking_notifier_head *,
                struct notifier_block *);
extern int raw_notifier_chain_unregister(struct raw_notifier_head *,
                struct notifier_block *);
extern int srcu_notifier_chain_unregister(struct srcu_notifier_head *,
                struct notifier_block *);

extern int atomic_notifier_call_chain(struct atomic_notifier_head *,
                unsigned long val, void *v);
extern int blocking_notifier_call_chain(struct blocking_notifier_head *,
                unsigned long val, void *v);
extern int raw_notifier_call_chain(struct raw_notifier_head *,
                unsigned long val, void *v);
extern int srcu_notifier_call_chain(struct srcu_notifier_head *,
                unsigned long val, void *v);
# 8 "include/linux/memory_hotplug.h" 2

struct page;
struct zone;
struct pglist_data;
# 140 "include/linux/memory_hotplug.h"
static inline __attribute__((always_inline)) void pgdat_resize_lock(struct pglist_data *p, unsigned long *f) {}
static inline __attribute__((always_inline)) void pgdat_resize_unlock(struct pglist_data *p, unsigned long *f) {}
static inline __attribute__((always_inline)) void pgdat_resize_init(struct pglist_data *pgdat) {}

static inline __attribute__((always_inline)) unsigned zone_span_seqbegin(struct zone *zone)
{
        return 0;
}
static inline __attribute__((always_inline)) int zone_span_seqretry(struct zone *zone, unsigned iv)
{
        return 0;
}
static inline __attribute__((always_inline)) void zone_span_writelock(struct zone *zone) {}
static inline __attribute__((always_inline)) void zone_span_writeunlock(struct zone *zone) {}
static inline __attribute__((always_inline)) void zone_seqlock_init(struct zone *zone) {}

static inline __attribute__((always_inline)) int mhp_notimplemented(const char *func)
{
        printk("<4>" "%s() called, with CONFIG_MEMORY_HOTPLUG disabled\n", func);
        dump_stack();
        return -38;
}


static inline __attribute__((always_inline)) int __remove_pages(struct zone *zone, unsigned long start_pfn,
        unsigned long nr_pages)
{
        printk("<4>" "%s() called, not yet supported\n", (__func__));
        dump_stack();
        return -38;
}

extern int add_memory(int nid, u64 start, u64 size);
extern int arch_add_memory(int nid, u64 start, u64 size);
extern int remove_memory(u64 start, u64 size);
extern int sparse_add_one_section(struct zone *zone, unsigned long start_pfn,
                                                                int nr_pages);
# 444 "include/linux/mmzone.h" 2

void __get_zone_counts(unsigned long *active, unsigned long *inactive,
                        unsigned long *free, struct pglist_data *pgdat);
void get_zone_counts(unsigned long *active, unsigned long *inactive,
                        unsigned long *free);
void build_all_zonelists(void);
void wakeup_kswapd(struct zone *zone, int order);
int zone_watermark_ok(struct zone *z, int order, unsigned long mark,
                int classzone_idx, int alloc_flags);
enum memmap_context {
        MEMMAP_EARLY,
        MEMMAP_HOTPLUG,
};
extern int init_currently_empty_zone(struct zone *zone, unsigned long start_pfn,
                                     unsigned long size,
                                     enum memmap_context context);




static inline __attribute__((always_inline)) void memory_present(int nid, unsigned long start, unsigned long end) {}
# 476 "include/linux/mmzone.h"
static inline __attribute__((always_inline)) int populated_zone(struct zone *zone)
{
        return (!!zone->present_pages);
}

static inline __attribute__((always_inline)) int is_highmem_idx(enum zone_type idx)
{

        return (idx == ZONE_HIGHMEM);



}

static inline __attribute__((always_inline)) int is_normal_idx(enum zone_type idx)
{
        return (idx == ZONE_NORMAL);
}







static inline __attribute__((always_inline)) int is_highmem(struct zone *zone)
{

        return zone == zone->zone_pgdat->node_zones + ZONE_HIGHMEM;



}

static inline __attribute__((always_inline)) int is_normal(struct zone *zone)
{
        return zone == zone->zone_pgdat->node_zones + ZONE_NORMAL;
}

static inline __attribute__((always_inline)) int is_dma32(struct zone *zone)
{



        return 0;

}

static inline __attribute__((always_inline)) int is_dma(struct zone *zone)
{
        return zone == zone->zone_pgdat->node_zones + ZONE_DMA;
}


struct ctl_table;
struct file;
int min_free_kbytes_sysctl_handler(struct ctl_table *, int, struct file *,
                                        void *, size_t *, loff_t *);
extern int sysctl_lowmem_reserve_ratio[MAX_NR_ZONES-1];
int lowmem_reserve_ratio_sysctl_handler(struct ctl_table *, int, struct file *,
                                        void *, size_t *, loff_t *);
int percpu_pagelist_fraction_sysctl_handler(struct ctl_table *, int, struct file *,
                                        void *, size_t *, loff_t *);
int sysctl_min_unmapped_ratio_sysctl_handler(struct ctl_table *, int,
                        struct file *, void *, size_t *, loff_t *);
int sysctl_min_slab_ratio_sysctl_handler(struct ctl_table *, int,
                        struct file *, void *, size_t *, loff_t *);

# 1 "include/linux/topology.h" 1
# 34 "include/linux/topology.h"
# 1 "include/asm/topology.h" 1
# 111 "include/asm/topology.h"
# 1 "include/asm-generic/topology.h" 1
# 112 "include/asm/topology.h" 2



extern cpumask_t cpu_coregroup_map(int cpu);
# 35 "include/linux/topology.h" 2
# 545 "include/linux/mmzone.h" 2







extern struct pglist_data contig_page_data;
# 563 "include/linux/mmzone.h"
extern struct pglist_data *first_online_pgdat(void);
extern struct pglist_data *next_online_pgdat(struct pglist_data *pgdat);
extern struct zone *next_zone(struct zone *zone);
# 762 "include/linux/mmzone.h"
void memory_present(int nid, unsigned long start, unsigned long end);
unsigned long __attribute__ ((__section__ (".init.text"))) node_memmap_size_bytes(int, unsigned long, unsigned long);
# 5 "include/linux/gfp.h" 2



struct vm_area_struct;
# 86 "include/linux/gfp.h"
static inline __attribute__((always_inline)) enum zone_type gfp_zone(gfp_t flags)
{
        if (flags & (( gfp_t)0x01u))
                return ZONE_DMA;





        if (flags & (( gfp_t)0x02u))
                return ZONE_HIGHMEM;

        return ZONE_NORMAL;
}
# 117 "include/linux/gfp.h"
static inline __attribute__((always_inline)) void arch_free_page(struct page *page, int order) { }


static inline __attribute__((always_inline)) void arch_alloc_page(struct page *page, int order) { }


extern struct page *
__alloc_pages(gfp_t, unsigned int, struct zonelist *) __attribute__((regparm(3)));

static inline __attribute__((always_inline)) struct page *alloc_pages_node(int nid, gfp_t gfp_mask,
                                                unsigned int order)
{
        if (__builtin_expect(!!(order >= 11), 0))
                return ((void *)0);


        if (nid < 0)
                nid = ((0));

        return __alloc_pages(gfp_mask, order,
                (&contig_page_data)->node_zonelists + gfp_zone(gfp_mask));
}
# 160 "include/linux/gfp.h"
extern unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int order) __attribute__((regparm(3)));
extern unsigned long get_zeroed_page(gfp_t gfp_mask) __attribute__((regparm(3)));







extern void __free_pages(struct page *page, unsigned int order) __attribute__((regparm(3)));
extern void free_pages(unsigned long addr, unsigned int order) __attribute__((regparm(3)));
extern void free_hot_page(struct page *page) __attribute__((regparm(3)));
extern void free_cold_page(struct page *page) __attribute__((regparm(3)));




void page_alloc_init(void);



static inline __attribute__((always_inline)) void drain_node_pages(int node) { };
# 15 "include/linux/slab.h" 2


typedef struct kmem_cache kmem_cache_t __attribute__((deprecated));
# 44 "include/linux/slab.h"
void __attribute__ ((__section__ (".init.text"))) kmem_cache_init(void);
extern int slab_is_available(void);

struct kmem_cache *kmem_cache_create(const char *, size_t, size_t,
                        unsigned long,
                        void (*)(void *, struct kmem_cache *, unsigned long),
                        void (*)(void *, struct kmem_cache *, unsigned long));
void kmem_cache_destroy(struct kmem_cache *);
int kmem_cache_shrink(struct kmem_cache *);
void *kmem_cache_alloc(struct kmem_cache *, gfp_t);
void *kmem_cache_zalloc(struct kmem_cache *, gfp_t);
void kmem_cache_free(struct kmem_cache *, void *);
unsigned int kmem_cache_size(struct kmem_cache *);
const char *kmem_cache_name(struct kmem_cache *);
int kmem_ptr_validate(struct kmem_cache *cachep, const void *ptr);




static inline __attribute__((always_inline)) void *kmem_cache_alloc_node(struct kmem_cache *cachep,
                                        gfp_t flags, int node)
{
        return kmem_cache_alloc(cachep, flags);
}





void *__kmalloc(size_t, gfp_t);
void *__kzalloc(size_t, gfp_t);
void kfree(const void *);
unsigned int ksize(const void *);







static inline __attribute__((always_inline)) void *kcalloc(size_t n, size_t size, gfp_t flags)
{
        if (n != 0 && size > (~0UL) / n)
                return ((void *)0);
        return __kzalloc(n * size, flags);
}
# 98 "include/linux/slab.h"
# 1 "include/linux/slab_def.h" 1
# 19 "include/linux/slab_def.h"
struct cache_sizes {
        size_t cs_size;
        struct kmem_cache *cs_cachep;
        struct kmem_cache *cs_dmacachep;
};
extern struct cache_sizes malloc_sizes[];

static inline __attribute__((always_inline)) void *kmalloc(size_t size, gfp_t flags)
{
        if (__builtin_constant_p(size)) {
                int i = 0;





# 1 "include/linux/kmalloc_sizes.h" 1

        if (size <= 32) goto found; else i++;

        if (size <= 64) goto found; else i++;



        if (size <= 128) goto found; else i++;



        if (size <= 256) goto found; else i++;
        if (size <= 512) goto found; else i++;
        if (size <= 1024) goto found; else i++;
        if (size <= 2048) goto found; else i++;
        if (size <= 4096) goto found; else i++;
        if (size <= 8192) goto found; else i++;
        if (size <= 16384) goto found; else i++;
        if (size <= 32768) goto found; else i++;
        if (size <= 65536) goto found; else i++;
        if (size <= 131072) goto found; else i++;
# 36 "include/linux/slab_def.h" 2

                {
                        extern void __you_cannot_kmalloc_that_much(void);
                        __you_cannot_kmalloc_that_much();
                }
found:
                return kmem_cache_alloc((flags & (( gfp_t)0x01u)) ?
                        malloc_sizes[i].cs_dmacachep :
                        malloc_sizes[i].cs_cachep, flags);
        }
        return __kmalloc(size, flags);
}

static inline __attribute__((always_inline)) void *kzalloc(size_t size, gfp_t flags)
{
        if (__builtin_constant_p(size)) {
                int i = 0;





# 1 "include/linux/kmalloc_sizes.h" 1

        if (size <= 32) goto found; else i++;

        if (size <= 64) goto found; else i++;



        if (size <= 128) goto found; else i++;



        if (size <= 256) goto found; else i++;
        if (size <= 512) goto found; else i++;
        if (size <= 1024) goto found; else i++;
        if (size <= 2048) goto found; else i++;
        if (size <= 4096) goto found; else i++;
        if (size <= 8192) goto found; else i++;
        if (size <= 16384) goto found; else i++;
        if (size <= 32768) goto found; else i++;
        if (size <= 65536) goto found; else i++;
        if (size <= 131072) goto found; else i++;
# 59 "include/linux/slab_def.h" 2

                {
                        extern void __you_cannot_kzalloc_that_much(void);
                        __you_cannot_kzalloc_that_much();
                }
found:
                return kmem_cache_zalloc((flags & (( gfp_t)0x01u)) ?
                        malloc_sizes[i].cs_dmacachep :
                        malloc_sizes[i].cs_cachep, flags);
        }
        return __kzalloc(size, flags);
}
# 99 "include/linux/slab.h" 2
# 167 "include/linux/slab.h"
static inline __attribute__((always_inline)) void *kmalloc_node(size_t size, gfp_t flags, int node)
{
        return kmalloc(size, flags);
}

static inline __attribute__((always_inline)) void *__kmalloc_node(size_t size, gfp_t flags, int node)
{
        return __kmalloc(size, flags);
}
# 6 "include/linux/percpu.h" 2
# 29 "include/linux/percpu.h"
struct percpu_data {
        void *ptrs[32];
};
# 45 "include/linux/percpu.h"
extern void *percpu_populate(void *__pdata, size_t size, gfp_t gfp, int cpu);
extern void percpu_depopulate(void *__pdata, int cpu);
extern int __percpu_populate_mask(void *__pdata, size_t size, gfp_t gfp,
                                  cpumask_t *mask);
extern void __percpu_depopulate_mask(void *__pdata, cpumask_t *mask);
extern void *__percpu_alloc_mask(size_t size, gfp_t gfp, cpumask_t *mask);
extern void percpu_free(void *__pdata);
# 42 "include/linux/rcupdate.h" 2
# 50 "include/linux/rcupdate.h"
struct rcu_head {
        struct rcu_head *next;
        void (*func)(struct rcu_head *head);
};
# 64 "include/linux/rcupdate.h"
struct rcu_ctrlblk {
        long cur;
        long completed;
        int next_pending;

        int signaled;

        spinlock_t lock __attribute__((__aligned__(1 << ((7)))));
        cpumask_t cpumask;

} __attribute__((__aligned__(1 << ((7)))));


static inline __attribute__((always_inline)) int rcu_batch_before(long a, long b)
{
        return (a - b) < 0;
}


static inline __attribute__((always_inline)) int rcu_batch_after(long a, long b)
{
        return (a - b) > 0;
}






struct rcu_data {

        long quiescbatch;
        int passed_quiesc;
        int qs_pending;


        long batch;
        struct rcu_head *nxtlist;
        struct rcu_head **nxttail;
        long qlen;
        struct rcu_head *curlist;
        struct rcu_head **curtail;
        struct rcu_head *donelist;
        struct rcu_head **donetail;
        long blimit;
        int cpu;
        struct rcu_head barrier;
};

extern __typeof__(struct rcu_data) per_cpu__rcu_data;
extern __typeof__(struct rcu_data) per_cpu__rcu_bh_data;







static inline __attribute__((always_inline)) void rcu_qsctr_inc(int cpu)
{
        struct rcu_data *rdp = &(*({ extern int simple_identifier_rcu_data(void); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"(&per_cpu__rcu_data)); (typeof(&per_cpu__rcu_data)) (__ptr + (__per_cpu_offset[cpu])); }); }));
        rdp->passed_quiesc = 1;
}
static inline __attribute__((always_inline)) void rcu_bh_qsctr_inc(int cpu)
{
        struct rcu_data *rdp = &(*({ extern int simple_identifier_rcu_bh_data(void); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"(&per_cpu__rcu_bh_data)); (typeof(&per_cpu__rcu_bh_data)) (__ptr + (__per_cpu_offset[cpu])); }); }));
        rdp->passed_quiesc = 1;
}

extern int rcu_pending(int cpu);
extern int rcu_needs_cpu(int cpu);
# 272 "include/linux/rcupdate.h"
extern void rcu_init(void);
extern void rcu_check_callbacks(int cpu, int user);
extern void rcu_restart_cpu(int cpu);
extern long rcu_batches_completed(void);
extern long rcu_batches_completed_bh(void);


extern void call_rcu(struct rcu_head *head, void (*func)(struct rcu_head *head)) __attribute__((regparm(3)));

extern void call_rcu_bh(struct rcu_head *head, void (*func)(struct rcu_head *head)) __attribute__((regparm(3)));

extern void synchronize_rcu(void);
void synchronize_idle(void);
extern void rcu_barrier(void);
# 5 "include/linux/pid.h" 2

enum pid_type
{
        PIDTYPE_PID,
        PIDTYPE_PGID,
        PIDTYPE_SID,
        PIDTYPE_MAX
};
# 43 "include/linux/pid.h"
struct pid
{
        atomic_t count;

        int nr;
        struct hlist_node pid_chain;

        struct hlist_head tasks[PIDTYPE_MAX];
        struct rcu_head rcu;
};

struct pid_link
{
        struct hlist_node node;
        struct pid *pid;
};

static inline __attribute__((always_inline)) struct pid *get_pid(struct pid *pid)
{
        if (pid)
                atomic_inc(&pid->count);
        return pid;
}

extern void put_pid(struct pid *pid) __attribute__((regparm(3)));
extern struct task_struct *pid_task(struct pid *pid, enum pid_type) __attribute__((regparm(3)));
extern struct task_struct *get_pid_task(struct pid *pid, enum pid_type) __attribute__((regparm(3)));


extern struct pid *get_task_pid(struct task_struct *task, enum pid_type type);





extern int attach_pid(struct task_struct *task, enum pid_type type, int nr) __attribute__((regparm(3)));


extern void detach_pid(struct task_struct *task, enum pid_type) __attribute__((regparm(3)));
extern void transfer_pid(struct task_struct *old, struct task_struct *new, enum pid_type) __attribute__((regparm(3)));






extern struct pid *find_pid(int nr) __attribute__((regparm(3)));




extern struct pid *find_get_pid(int nr);
extern struct pid *find_ge_pid(int nr);

extern struct pid *alloc_pid(void);
extern void free_pid(struct pid *pid) __attribute__((regparm(3)));

static inline __attribute__((always_inline)) pid_t pid_nr(struct pid *pid)
{
        pid_t nr = 0;
        if (pid)
                nr = pid->nr;
        return nr;
}
# 73 "include/linux/sched.h" 2


# 1 "include/linux/seccomp.h" 1
# 10 "include/linux/seccomp.h"
# 1 "include/asm/seccomp.h" 1
# 9 "include/asm/seccomp.h"
# 1 "include/linux/unistd.h" 1






# 1 "include/asm/unistd.h" 1
# 8 "include/linux/unistd.h" 2
# 10 "include/asm/seccomp.h" 2
# 11 "include/linux/seccomp.h" 2

typedef struct { int mode; } seccomp_t;

extern void __secure_computing(int);
static inline __attribute__((always_inline)) void secure_computing(int this_syscall)
{
        if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 8)), 0))
                __secure_computing(this_syscall);
}

static inline __attribute__((always_inline)) int has_secure_computing(struct thread_info *ti)
{
        return __builtin_expect(!!(test_ti_thread_flag(ti, 8)), 0);
}
# 76 "include/linux/sched.h" 2

# 1 "include/linux/futex.h" 1



# 1 "include/linux/sched.h" 1
# 5 "include/linux/futex.h" 2
# 33 "include/linux/futex.h"
struct robust_list {
        struct robust_list *next;
};
# 45 "include/linux/futex.h"
struct robust_list_head {



        struct robust_list list;







        long futex_offset;
# 69 "include/linux/futex.h"
        struct robust_list *list_op_pending;
};
# 97 "include/linux/futex.h"
long do_futex(u32 *uaddr, int op, u32 val, unsigned long timeout,
              u32 *uaddr2, u32 val2, u32 val3);

extern int
handle_futex_death(u32 *uaddr, struct task_struct *curr, int pi);


extern void exit_robust_list(struct task_struct *curr);
extern void exit_pi_state_list(struct task_struct *curr);
# 78 "include/linux/sched.h" 2
# 1 "include/linux/rtmutex.h" 1
# 16 "include/linux/rtmutex.h"
# 1 "include/linux/plist.h" 1
# 80 "include/linux/plist.h"
struct plist_head {
        struct list_head prio_list;
        struct list_head node_list;



};

struct plist_node {
        int prio;
        struct plist_head plist;
};
# 128 "include/linux/plist.h"
static inline __attribute__((always_inline)) void
plist_head_init(struct plist_head *head, spinlock_t *lock)
{
        INIT_LIST_HEAD(&head->prio_list);
        INIT_LIST_HEAD(&head->node_list);



}







static inline __attribute__((always_inline)) void plist_node_init(struct plist_node *node, int prio)
{
        node->prio = prio;
        plist_head_init(&node->plist, ((void *)0));
}

extern void plist_add(struct plist_node *node, struct plist_head *head);
extern void plist_del(struct plist_node *node, struct plist_head *head);
# 200 "include/linux/plist.h"
static inline __attribute__((always_inline)) int plist_head_empty(const struct plist_head *head)
{
        return list_empty(&head->node_list);
}






static inline __attribute__((always_inline)) int plist_node_empty(const struct plist_node *node)
{
        return plist_head_empty(&node->plist);
}
# 242 "include/linux/plist.h"
static inline __attribute__((always_inline)) struct plist_node* plist_first(const struct plist_head *head)
{
        return ({ const typeof( ((struct plist_node *)0)->plist.node_list ) *__mptr = (head->node_list.next); (struct plist_node *)( (char *)__mptr - ((size_t) &((struct plist_node *)0)->plist.node_list) );});

}
# 17 "include/linux/rtmutex.h" 2
# 26 "include/linux/rtmutex.h"
struct rt_mutex {
        spinlock_t wait_lock;
        struct plist_head wait_list;
        struct task_struct *owner;






};

struct rt_mutex_waiter;
struct hrtimer_sleeper;






 static inline __attribute__((always_inline)) int rt_mutex_debug_check_no_locks_freed(const void *from,
                                                       unsigned long len)
 {
        return 0;
 }
# 80 "include/linux/rtmutex.h"
static inline __attribute__((always_inline)) int rt_mutex_is_locked(struct rt_mutex *lock)
{
        return lock->owner != ((void *)0);
}

extern void __rt_mutex_init(struct rt_mutex *lock, const char *name);
extern void rt_mutex_destroy(struct rt_mutex *lock);

extern void rt_mutex_lock(struct rt_mutex *lock);
extern int rt_mutex_lock_interruptible(struct rt_mutex *lock,
                                                int detect_deadlock);
extern int rt_mutex_timed_lock(struct rt_mutex *lock,
                                        struct hrtimer_sleeper *timeout,
                                        int detect_deadlock);

extern int rt_mutex_trylock(struct rt_mutex *lock);

extern void rt_mutex_unlock(struct rt_mutex *lock);
# 79 "include/linux/sched.h" 2


# 1 "include/linux/param.h" 1
# 82 "include/linux/sched.h" 2
# 1 "include/linux/resource.h" 1





struct task_struct;
# 23 "include/linux/resource.h"
struct rusage {
        struct timeval ru_utime;
        struct timeval ru_stime;
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

struct rlimit {
        unsigned long rlim_cur;
        unsigned long rlim_max;
};
# 70 "include/linux/resource.h"
# 1 "include/asm/resource.h" 1



# 1 "include/asm-generic/resource.h" 1
# 5 "include/asm/resource.h" 2
# 71 "include/linux/resource.h" 2

int getrusage(struct task_struct *p, int who, struct rusage *ru);
# 83 "include/linux/sched.h" 2
# 1 "include/linux/timer.h" 1







struct tvec_t_base_s;

struct timer_list {
        struct list_head entry;
        unsigned long expires;

        void (*function)(unsigned long);
        unsigned long data;

        struct tvec_t_base_s *base;
};

extern struct tvec_t_base_s boot_tvec_bases;
# 33 "include/linux/timer.h"
void __attribute__((regparm(3))) init_timer(struct timer_list * timer);

static inline __attribute__((always_inline)) void setup_timer(struct timer_list * timer,
                                void (*function)(unsigned long),
                                unsigned long data)
{
        timer->function = function;
        timer->data = data;
        init_timer(timer);
}
# 54 "include/linux/timer.h"
static inline __attribute__((always_inline)) int timer_pending(const struct timer_list * timer)
{
        return timer->entry.next != ((void *)0);
}

extern void add_timer_on(struct timer_list *timer, int cpu);
extern int del_timer(struct timer_list * timer);
extern int __mod_timer(struct timer_list *timer, unsigned long expires);
extern int mod_timer(struct timer_list *timer, unsigned long expires);

extern unsigned long next_timer_interrupt(void);
# 80 "include/linux/timer.h"
static inline __attribute__((always_inline)) void add_timer(struct timer_list *timer)
{
        do { if (__builtin_expect(!!((timer_pending(timer))!=0), 0)) do { asm volatile("1:\tud2\n" ".pushsection __bug_table,\"a\"\n" "2:\t.long 1b, %c0\n" "\t.word %c1, 0\n" "\t.org 2b+%c2\n" ".popsection" : : "i" ("include/linux/timer.h"), "i" (82), "i" (sizeof(struct bug_entry))); for(;;) ; } while(0); } while(0);
        __mod_timer(timer, timer->expires);
}


  extern int try_to_del_timer_sync(struct timer_list *timer);
  extern int del_timer_sync(struct timer_list *timer);







extern void init_timers(void);
extern void run_local_timers(void);
struct hrtimer;
extern int it_real_fn(struct hrtimer *);

unsigned long __round_jiffies(unsigned long j, int cpu);
unsigned long __round_jiffies_relative(unsigned long j, int cpu);
unsigned long round_jiffies(unsigned long j);
unsigned long round_jiffies_relative(unsigned long j);
# 84 "include/linux/sched.h" 2
# 1 "include/linux/hrtimer.h" 1
# 19 "include/linux/hrtimer.h"
# 1 "include/linux/ktime.h" 1
# 46 "include/linux/ktime.h"
typedef union {
        s64 tv64;
# 57 "include/linux/ktime.h"
} ktime_t;
# 75 "include/linux/ktime.h"
static inline __attribute__((always_inline)) ktime_t ktime_set(const long secs, const unsigned long nsecs)
{




        return (ktime_t) { .tv64 = (s64)secs * 1000000000L + (s64)nsecs };
}
# 100 "include/linux/ktime.h"
static inline __attribute__((always_inline)) ktime_t timespec_to_ktime(struct timespec ts)
{
        return ktime_set(ts.tv_sec, ts.tv_nsec);
}


static inline __attribute__((always_inline)) ktime_t timeval_to_ktime(struct timeval tv)
{
        return ktime_set(tv.tv_sec, tv.tv_usec * 1000L);
}
# 268 "include/linux/ktime.h"
extern void ktime_get_ts(struct timespec *ts);
# 20 "include/linux/hrtimer.h" 2







enum hrtimer_mode {
        HRTIMER_ABS,
        HRTIMER_REL,
};

enum hrtimer_restart {
        HRTIMER_NORESTART,
        HRTIMER_RESTART,
};



struct hrtimer_base;
# 52 "include/linux/hrtimer.h"
struct hrtimer {
        struct rb_node node;
        ktime_t expires;
        int (*function)(struct hrtimer *);
        struct hrtimer_base *base;
};
# 66 "include/linux/hrtimer.h"
struct hrtimer_sleeper {
        struct hrtimer timer;
        struct task_struct *task;
};
# 85 "include/linux/hrtimer.h"
struct hrtimer_base {
        clockid_t index;
        spinlock_t lock;
        struct rb_root active;
        struct rb_node *first;
        ktime_t resolution;
        ktime_t (*get_time)(void);
        ktime_t (*get_softirq_time)(void);
        struct hrtimer *curr_timer;
        ktime_t softirq_time;
        struct lock_class_key lock_key;
};
# 108 "include/linux/hrtimer.h"
extern void hrtimer_init(struct hrtimer *timer, clockid_t which_clock,
                         enum hrtimer_mode mode);


extern int hrtimer_start(struct hrtimer *timer, ktime_t tim,
                         const enum hrtimer_mode mode);
extern int hrtimer_cancel(struct hrtimer *timer);
extern int hrtimer_try_to_cancel(struct hrtimer *timer);




extern ktime_t hrtimer_get_remaining(const struct hrtimer *timer);
extern int hrtimer_get_res(const clockid_t which_clock, struct timespec *tp);





static inline __attribute__((always_inline)) int hrtimer_active(const struct hrtimer *timer)
{
        return ((struct rb_node *)((&timer->node)->rb_parent_color & ~3)) != &timer->node;
}


extern unsigned long
hrtimer_forward(struct hrtimer *timer, ktime_t now, ktime_t interval);


extern long hrtimer_nanosleep(struct timespec *rqtp,
                              struct timespec *rmtp,
                              const enum hrtimer_mode mode,
                              const clockid_t clockid);
extern long hrtimer_nanosleep_restart(struct restart_block *restart_block);

extern void hrtimer_init_sleeper(struct hrtimer_sleeper *sl,
                                 struct task_struct *tsk);


extern void hrtimer_run_queues(void);


extern void __attribute__ ((__section__ (".init.text"))) hrtimers_init(void);
# 85 "include/linux/sched.h" 2
# 1 "include/linux/task_io_accounting.h" 1
# 35 "include/linux/task_io_accounting.h"
struct task_io_accounting {
};
# 86 "include/linux/sched.h" 2



struct exec_domain;
struct futex_pi_state;
# 108 "include/linux/sched.h"
extern unsigned long avenrun[];
# 122 "include/linux/sched.h"
extern unsigned long total_forks;
extern int nr_threads;
extern __typeof__(unsigned long) per_cpu__process_counts;
extern int nr_processes(void);
extern unsigned long nr_running(void);
extern unsigned long nr_uninterruptible(void);
extern unsigned long nr_active(void);
extern unsigned long nr_iowait(void);
extern unsigned long weighted_cpuload(const int cpu);
# 187 "include/linux/sched.h"
extern rwlock_t tasklist_lock;
extern spinlock_t mmlist_lock;

struct task_struct;

extern void sched_init(void);
extern void sched_init_smp(void);
extern void init_idle(struct task_struct *idle, int cpu);

extern cpumask_t nohz_cpu_mask;




extern void show_state_filter(unsigned long state_filter);

static inline __attribute__((always_inline)) void show_state(void)
{
        show_state_filter(-1);
}

extern void show_regs(struct pt_regs *);






extern void show_stack(struct task_struct *task, unsigned long *sp);

void io_schedule(void);
long io_schedule_timeout(long timeout);

extern void cpu_init (void);
extern void trap_init(void);
extern void update_process_times(int user);
extern void scheduler_tick(void);


extern void softlockup_tick(void);
extern void spawn_softlockup_task(void);
extern void touch_softlockup_watchdog(void);
# 245 "include/linux/sched.h"
extern int in_sched_functions(unsigned long addr);


extern signed long schedule_timeout(signed long timeout) __attribute__((regparm(3)));
extern signed long schedule_timeout_interruptible(signed long timeout);
extern signed long schedule_timeout_uninterruptible(signed long timeout);
 __attribute__((regparm(0))) void schedule(void);

struct nsproxy;




extern int sysctl_max_map_count;

# 1 "include/linux/aio.h" 1




# 1 "include/linux/workqueue.h" 1
# 13 "include/linux/workqueue.h"
struct workqueue_struct;

struct work_struct;
typedef void (*work_func_t)(struct work_struct *work);







struct work_struct {
        atomic_long_t data;




        struct list_head entry;
        work_func_t func;
};




struct delayed_work {
        struct work_struct work;
        struct timer_list timer;
};

struct execute_work {
        struct work_struct work;
};
# 161 "include/linux/workqueue.h"
extern struct workqueue_struct *__create_workqueue(const char *name,
                                                    int singlethread,
                                                    int freezeable);




extern void destroy_workqueue(struct workqueue_struct *wq);

extern int queue_work(struct workqueue_struct *wq, struct work_struct *work) __attribute__((regparm(3)));
extern int queue_delayed_work(struct workqueue_struct *wq, struct delayed_work *work, unsigned long delay) __attribute__((regparm(3)));
extern int queue_delayed_work_on(int cpu, struct workqueue_struct *wq,
        struct delayed_work *work, unsigned long delay);
extern void flush_workqueue(struct workqueue_struct *wq) __attribute__((regparm(3)));

extern int schedule_work(struct work_struct *work) __attribute__((regparm(3)));
extern int run_scheduled_work(struct work_struct *work) __attribute__((regparm(3)));
extern int schedule_delayed_work(struct delayed_work *work, unsigned long delay) __attribute__((regparm(3)));

extern int schedule_delayed_work_on(int cpu, struct delayed_work *work, unsigned long delay);
extern int schedule_on_each_cpu(work_func_t func);
extern void flush_scheduled_work(void);
extern int current_is_keventd(void);
extern int keventd_up(void);

extern void init_workqueues(void);
void cancel_rearming_delayed_work(struct delayed_work *work);
void cancel_rearming_delayed_workqueue(struct workqueue_struct *,
                                       struct delayed_work *);
int execute_in_process_context(work_func_t fn, struct execute_work *);






static inline __attribute__((always_inline)) int cancel_delayed_work(struct delayed_work *work)
{
        int ret;

        ret = del_timer_sync(&work->timer);
        if (ret)
                clear_bit(0, ((unsigned long *)(&(&work->work)->data)));
        return ret;
}
# 6 "include/linux/aio.h" 2
# 1 "include/linux/aio_abi.h" 1
# 32 "include/linux/aio_abi.h"
typedef unsigned long aio_context_t;

enum {
        IOCB_CMD_PREAD = 0,
        IOCB_CMD_PWRITE = 1,
        IOCB_CMD_FSYNC = 2,
        IOCB_CMD_FDSYNC = 3,




        IOCB_CMD_NOOP = 6,
        IOCB_CMD_PREADV = 7,
        IOCB_CMD_PWRITEV = 8,
};


struct io_event {
        __u64 data;
        __u64 obj;
        __s64 res;
        __s64 res2;
};
# 70 "include/linux/aio_abi.h"
struct iocb {

        __u64 aio_data;
        __u32 aio_key, aio_reserved1;



        __u16 aio_lio_opcode;
        __s16 aio_reqprio;
        __u32 aio_fildes;

        __u64 aio_buf;
        __u64 aio_nbytes;
        __s64 aio_offset;


        __u64 aio_reserved2;
        __u64 aio_reserved3;
};
# 7 "include/linux/aio.h" 2
# 1 "include/linux/uio.h" 1
# 20 "include/linux/uio.h"
struct iovec
{
        void *iov_base;
        __kernel_size_t iov_len;
};



struct kvec {
        void *iov_base;
        size_t iov_len;
};
# 54 "include/linux/uio.h"
static inline __attribute__((always_inline)) size_t iov_length(const struct iovec *iov, unsigned long nr_segs)
{
        unsigned long seg;
        size_t ret = 0;

        for (seg = 0; seg < nr_segs; seg++)
                ret += iov[seg].iov_len;
        return ret;
}

unsigned long iov_shorten(struct iovec *iov, unsigned long nr_segs, size_t to);
# 8 "include/linux/aio.h" 2







struct kioctx;
# 87 "include/linux/aio.h"
struct kiocb {
        struct list_head ki_run_list;
        long ki_flags;
        int ki_users;
        unsigned ki_key;

        struct file *ki_filp;
        struct kioctx *ki_ctx;
        int (*ki_cancel)(struct kiocb *, struct io_event *);
        ssize_t (*ki_retry)(struct kiocb *);
        void (*ki_dtor)(struct kiocb *);

        union {
                void *user;
                struct task_struct *tsk;
        } ki_obj;

        __u64 ki_user_data;
        wait_queue_t ki_wait;
        loff_t ki_pos;

        atomic_t ki_bio_count;
        void *private;

        unsigned short ki_opcode;
        size_t ki_nbytes;
        char *ki_buf;
        size_t ki_left;
        struct iovec ki_inline_vec;
        struct iovec *ki_iovec;
        unsigned long ki_nr_segs;
        unsigned long ki_cur_seg;

        struct list_head ki_list;

};
# 144 "include/linux/aio.h"
struct aio_ring {
        unsigned id;
        unsigned nr;
        unsigned head;
        unsigned tail;

        unsigned magic;
        unsigned compat_features;
        unsigned incompat_features;
        unsigned header_length;


        struct io_event io_events[0];
};




struct aio_ring_info {
        unsigned long mmap_base;
        unsigned long mmap_size;

        struct page **ring_pages;
        spinlock_t ring_lock;
        long nr_pages;

        unsigned nr, tail;

        struct page *internal_pages[8];
};

struct kioctx {
        atomic_t users;
        int dead;
        struct mm_struct *mm;


        unsigned long user_id;
        struct kioctx *next;

        wait_queue_head_t wait;

        spinlock_t ctx_lock;

        int reqs_active;
        struct list_head active_reqs;
        struct list_head run_list;


        unsigned max_reqs;

        struct aio_ring_info ring_info;

        struct delayed_work wq;
};


extern unsigned aio_max_size;

extern ssize_t wait_on_sync_kiocb(struct kiocb *iocb) __attribute__((regparm(3)));
extern int aio_put_req(struct kiocb *iocb) __attribute__((regparm(3)));
extern void kick_iocb(struct kiocb *iocb) __attribute__((regparm(3)));
extern int aio_complete(struct kiocb *iocb, long res, long res2) __attribute__((regparm(3)));
extern void __put_ioctx(struct kioctx *ctx) __attribute__((regparm(3)));
struct mm_struct;
extern void exit_aio(struct mm_struct *mm) __attribute__((regparm(3)));
extern struct kioctx *lookup_ioctx(unsigned long ctx_id);
extern int io_submit_one(struct kioctx *ctx, struct iocb *user_iocb, struct iocb *iocb) __attribute__((regparm(3)));



struct kioctx *lookup_ioctx(unsigned long ctx_id);
int io_submit_one(struct kioctx *ctx, struct iocb *user_iocb, struct iocb *iocb) __attribute__((regparm(3)));
# 244 "include/linux/aio.h"
static inline __attribute__((always_inline)) struct kiocb *list_kiocb(struct list_head *h)
{
        return ({ const typeof( ((struct kiocb *)0)->ki_list ) *__mptr = (h); (struct kiocb *)( (char *)__mptr - ((size_t) &((struct kiocb *)0)->ki_list) );});
}


extern unsigned long aio_nr;
extern unsigned long aio_max_nr;
# 261 "include/linux/sched.h" 2

extern unsigned long
arch_get_unmapped_area(struct file *, unsigned long, unsigned long,
                       unsigned long, unsigned long);
extern unsigned long
arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
                          unsigned long len, unsigned long pgoff,
                          unsigned long flags);
extern void arch_unmap_area(struct mm_struct *, unsigned long);
extern void arch_unmap_area_topdown(struct mm_struct *, unsigned long);
# 282 "include/linux/sched.h"
typedef atomic_long_t mm_counter_t;
# 310 "include/linux/sched.h"
struct mm_struct {
        struct vm_area_struct * mmap;
        struct rb_root mm_rb;
        struct vm_area_struct * mmap_cache;
        unsigned long (*get_unmapped_area) (struct file *filp,
                                unsigned long addr, unsigned long len,
                                unsigned long pgoff, unsigned long flags);
        void (*unmap_area) (struct mm_struct *mm, unsigned long addr);
        unsigned long mmap_base;
        unsigned long task_size;
        unsigned long cached_hole_size;
        unsigned long free_area_cache;
        pgd_t * pgd;
        atomic_t mm_users;
        atomic_t mm_count;
        int map_count;
        struct rw_semaphore mmap_sem;
        spinlock_t page_table_lock;

        struct list_head mmlist;







        mm_counter_t _file_rss;
        mm_counter_t _anon_rss;

        unsigned long hiwater_rss;
        unsigned long hiwater_vm;

        unsigned long total_vm, locked_vm, shared_vm, exec_vm;
        unsigned long stack_vm, reserved_vm, def_flags, nr_ptes;
        unsigned long start_code, end_code, start_data, end_data;
        unsigned long start_brk, brk, start_stack;
        unsigned long arg_start, arg_end, env_start, env_end;

        unsigned long saved_auxv[44];

        cpumask_t cpu_vm_mask;


        mm_context_t context;
# 363 "include/linux/sched.h"
        unsigned int faultstamp;
        unsigned int token_priority;
        unsigned int last_interval;

        unsigned char dumpable:2;


        int core_waiters;
        struct completion *core_startup_done, core_done;


        rwlock_t ioctx_list_lock;
        struct kioctx *ioctx_list;
};

struct sighand_struct {
        atomic_t count;
        struct k_sigaction action[64];
        spinlock_t siglock;
};

struct pacct_struct {
        int ac_flag;
        long ac_exitcode;
        unsigned long ac_mem;
        cputime_t ac_utime, ac_stime;
        unsigned long ac_minflt, ac_majflt;
};
# 399 "include/linux/sched.h"
struct signal_struct {
        atomic_t count;
        atomic_t live;

        wait_queue_head_t wait_chldexit;


        struct task_struct *curr_target;


        struct sigpending shared_pending;


        int group_exit_code;





        struct task_struct *group_exit_task;
        int notify_count;


        int group_stop_count;
        unsigned int flags;


        struct list_head posix_timers;


        struct hrtimer real_timer;
        struct task_struct *tsk;
        ktime_t it_real_incr;


        cputime_t it_prof_expires, it_virt_expires;
        cputime_t it_prof_incr, it_virt_incr;


        pid_t pgrp;
        pid_t tty_old_pgrp;

        union {
                pid_t session __attribute__((deprecated));
                pid_t __session;
        };


        int leader;

        struct tty_struct *tty;







        cputime_t utime, stime, cutime, cstime;
        unsigned long nvcsw, nivcsw, cnvcsw, cnivcsw;
        unsigned long min_flt, maj_flt, cmin_flt, cmaj_flt;







        unsigned long long sched_time;
# 478 "include/linux/sched.h"
        struct rlimit rlim[15];

        struct list_head cpu_timers[3];
# 494 "include/linux/sched.h"
};
# 537 "include/linux/sched.h"
struct user_struct {
        atomic_t __count;
        atomic_t processes;
        atomic_t files;
        atomic_t sigpending;

        atomic_t inotify_watches;
        atomic_t inotify_devs;


        unsigned long mq_bytes;
        unsigned long locked_shm;







        struct list_head uidhash_list;
        uid_t uid;
};

extern struct user_struct *find_user(uid_t);

extern struct user_struct root_user;


struct backing_dev_info;
struct reclaim_state;
# 615 "include/linux/sched.h"
static inline __attribute__((always_inline)) int sched_info_on(void)
{






        return 0;

}

enum idle_type
{
        SCHED_IDLE,
        NOT_IDLE,
        NEWLY_IDLE,
        MAX_IDLE_TYPES
};
# 664 "include/linux/sched.h"
struct sched_group {
        struct sched_group *next;
        cpumask_t cpumask;





        unsigned long cpu_power;
};

struct sched_domain {

        struct sched_domain *parent;
        struct sched_domain *child;
        struct sched_group *groups;
        cpumask_t span;
        unsigned long min_interval;
        unsigned long max_interval;
        unsigned int busy_factor;
        unsigned int imbalance_pct;
        unsigned long long cache_hot_time;
        unsigned int cache_nice_tries;
        unsigned int per_cpu_gain;
        unsigned int busy_idx;
        unsigned int idle_idx;
        unsigned int newidle_idx;
        unsigned int wake_idx;
        unsigned int forkexec_idx;
        int flags;


        unsigned long last_balance;
        unsigned int balance_interval;
        unsigned int nr_balance_failed;
# 731 "include/linux/sched.h"
};

extern int partition_sched_domains(cpumask_t *partition1,
                                    cpumask_t *partition2);





extern unsigned int max_cache_size;




struct io_context;
struct cpuset;



struct group_info {
        int ngroups;
        atomic_t usage;
        gid_t small_block[32];
        int nblocks;
        gid_t *blocks[0];
};
# 773 "include/linux/sched.h"
extern struct group_info *groups_alloc(int gidsetsize);
extern void groups_free(struct group_info *group_info);
extern int set_current_groups(struct group_info *group_info);
extern int groups_search(struct group_info *group_info, gid_t grp);







static inline __attribute__((always_inline)) void prefetch_stack(struct task_struct *t) { }


struct audit_context;
struct mempolicy;
struct pipe_inode_info;
struct uts_namespace;

enum sleep_type {
        SLEEP_NORMAL,
        SLEEP_NONINTERACTIVE,
        SLEEP_INTERACTIVE,
        SLEEP_INTERRUPTED,
};

struct prio_array;

struct task_struct {
        volatile long state;
        struct thread_info *thread_info;
        atomic_t usage;
        unsigned long flags;
        unsigned long ptrace;

        int lock_depth;






        int load_weight;
        int prio, static_prio, normal_prio;
        struct list_head run_list;
        struct prio_array *array;

        unsigned short ioprio;



        unsigned long sleep_avg;
        unsigned long long timestamp, last_ran;
        unsigned long long sched_time;
        enum sleep_type sleep_type;

        unsigned long policy;
        cpumask_t cpus_allowed;
        unsigned int time_slice, first_time_slice;





        struct list_head tasks;




        struct list_head ptrace_children;
        struct list_head ptrace_list;

        struct mm_struct *mm, *active_mm;


        struct linux_binfmt *binfmt;
        long exit_state;
        int exit_code, exit_signal;
        int pdeath_signal;

        unsigned long personality;
        unsigned did_exec:1;
        pid_t pid;
        pid_t tgid;
# 867 "include/linux/sched.h"
        struct task_struct *real_parent;
        struct task_struct *parent;




        struct list_head children;
        struct list_head sibling;
        struct task_struct *group_leader;


        struct pid_link pids[PIDTYPE_MAX];
        struct list_head thread_group;

        struct completion *vfork_done;
        int *set_child_tid;
        int *clear_child_tid;

        unsigned long rt_priority;
        cputime_t utime, stime;
        unsigned long nvcsw, nivcsw;
        struct timespec start_time;

        unsigned long min_flt, maj_flt;

        cputime_t it_prof_expires, it_virt_expires;
        unsigned long long it_sched_expires;
        struct list_head cpu_timers[3];


        uid_t uid,euid,suid,fsuid;
        gid_t gid,egid,sgid,fsgid;
        struct group_info *group_info;
        kernel_cap_t cap_effective, cap_inheritable, cap_permitted;
        unsigned keep_capabilities:1;
        struct user_struct *user;
# 916 "include/linux/sched.h"
        unsigned char fpu_counter;
        int oomkilladj;
        char comm[16];




        int link_count, total_link_count;


        struct sysv_sem sysvsem;


        struct thread_struct thread;

        struct fs_struct *fs;

        struct files_struct *files;

        struct nsproxy *nsproxy;

        struct signal_struct *signal;
        struct sighand_struct *sighand;

        sigset_t blocked, real_blocked;
        sigset_t saved_sigmask;
        struct sigpending pending;

        unsigned long sas_ss_sp;
        size_t sas_ss_size;
        int (*notifier)(void *priv);
        void *notifier_data;
        sigset_t *notifier_mask;

        void *security;
        struct audit_context *audit_context;
        seccomp_t seccomp;


        u32 parent_exec_id;
        u32 self_exec_id;

        spinlock_t alloc_lock;


        spinlock_t pi_lock;



        struct plist_head pi_waiters;

        struct rt_mutex_waiter *pi_blocked_on;
# 998 "include/linux/sched.h"
        void *journal_info;


        struct reclaim_state *reclaim_state;

        struct backing_dev_info *backing_dev_info;

        struct io_context *io_context;

        unsigned long ptrace_message;
        siginfo_t *last_siginfo;






        wait_queue_t *io_wait;

        u64 rchar, wchar, syscr, syscw;
        struct task_io_accounting ioac;
# 1034 "include/linux/sched.h"
        struct robust_list_head *robust_list;



        struct list_head pi_state_list;
        struct futex_pi_state *pi_state_cache;

        atomic_t fs_excl;
        struct rcu_head rcu;




        struct pipe_inode_info *splice_pipe;






};

static inline __attribute__((always_inline)) pid_t process_group(struct task_struct *tsk)
{
        return tsk->signal->pgrp;
}

static inline __attribute__((always_inline)) pid_t signal_session(struct signal_struct *sig)
{
        return sig->__session;
}

static inline __attribute__((always_inline)) pid_t process_session(struct task_struct *tsk)
{
        return signal_session(tsk->signal);
}

static inline __attribute__((always_inline)) void set_signal_session(struct signal_struct *sig, pid_t session)
{
        sig->__session = session;
}

static inline __attribute__((always_inline)) struct pid *task_pid(struct task_struct *task)
{
        return task->pids[PIDTYPE_PID].pid;
}

static inline __attribute__((always_inline)) struct pid *task_tgid(struct task_struct *task)
{
        return task->group_leader->pids[PIDTYPE_PID].pid;
}

static inline __attribute__((always_inline)) struct pid *task_pgrp(struct task_struct *task)
{
        return task->group_leader->pids[PIDTYPE_PGID].pid;
}

static inline __attribute__((always_inline)) struct pid *task_session(struct task_struct *task)
{
        return task->group_leader->pids[PIDTYPE_SID].pid;
}
# 1104 "include/linux/sched.h"
static inline __attribute__((always_inline)) int pid_alive(struct task_struct *p)
{
        return p->pids[PIDTYPE_PID].pid != ((void *)0);
}







static inline __attribute__((always_inline)) int is_init(struct task_struct *tsk)
{
        return tsk->pid == 1;
}

extern struct pid *cad_pid;

extern void free_task(struct task_struct *tsk);


extern void __put_task_struct(struct task_struct *t);

static inline __attribute__((always_inline)) void put_task_struct(struct task_struct *t)
{
        if (atomic_dec_and_test(&t->usage))
                __put_task_struct(t);
}
# 1187 "include/linux/sched.h"
extern int set_cpus_allowed(struct task_struct *p, cpumask_t new_mask);
# 1197 "include/linux/sched.h"
extern unsigned long long sched_clock(void);
extern unsigned long long
current_sched_time(const struct task_struct *current_task);



extern void sched_exec(void);







static inline __attribute__((always_inline)) void idle_task_exit(void) {}


extern void sched_idle_next(void);


extern int rt_mutex_getprio(struct task_struct *p);
extern void rt_mutex_setprio(struct task_struct *p, int prio);
extern void rt_mutex_adjust_pi(struct task_struct *p);
# 1228 "include/linux/sched.h"
extern void set_user_nice(struct task_struct *p, long nice);
extern int task_prio(const struct task_struct *p);
extern int task_nice(const struct task_struct *p);
extern int can_nice(const struct task_struct *p, const int nice);
extern int task_curr(const struct task_struct *p);
extern int idle_cpu(int cpu);
extern int sched_setscheduler(struct task_struct *, int, struct sched_param *);
extern struct task_struct *idle_task(int cpu);
extern struct task_struct *curr_task(int cpu);
extern void set_curr_task(int cpu, struct task_struct *p);

void yield(void);




extern struct exec_domain default_exec_domain;

union thread_union {
        struct thread_info thread_info;
        unsigned long stack[(8192)/sizeof(long)];
};


static inline __attribute__((always_inline)) int kstack_end(void *addr)
{



        return !(((unsigned long)addr+sizeof(void*)-1) & ((8192)-sizeof(void*)));
}


extern union thread_union init_thread_union;
extern struct task_struct init_task;

extern struct mm_struct init_mm;


extern struct task_struct *find_task_by_pid_type(int type, int pid);
extern void __set_special_pids(pid_t session, pid_t pgrp);


extern struct user_struct * alloc_uid(uid_t);
static inline __attribute__((always_inline)) struct user_struct *get_uid(struct user_struct *u)
{
        atomic_inc(&u->__count);
        return u;
}
extern void free_uid(struct user_struct *);
extern void switch_uid(struct user_struct *);



extern void do_timer(unsigned long ticks);

extern int wake_up_state(struct task_struct * tsk, unsigned int state) __attribute__((regparm(3)));
extern int wake_up_process(struct task_struct * tsk) __attribute__((regparm(3)));
extern void wake_up_new_task(struct task_struct * tsk, unsigned long clone_flags) __attribute__((regparm(3)));


 extern void kick_process(struct task_struct *tsk);



extern void sched_fork(struct task_struct * p, int clone_flags) __attribute__((regparm(3)));
extern void sched_exit(struct task_struct * p) __attribute__((regparm(3)));

extern int in_group_p(gid_t);
extern int in_egroup_p(gid_t);

extern void proc_caches_init(void);
extern void flush_signals(struct task_struct *);
extern void flush_signal_handlers(struct task_struct *, int force_default);
extern int dequeue_signal(struct task_struct *tsk, sigset_t *mask, siginfo_t *info);

static inline __attribute__((always_inline)) int dequeue_signal_lock(struct task_struct *tsk, sigset_t *mask, siginfo_t *info)
{
        unsigned long flags;
        int ret;

        flags = _spin_lock_irqsave(&tsk->sighand->siglock);
        ret = dequeue_signal(tsk, mask, info);
        _spin_unlock_irqrestore(&tsk->sighand->siglock, flags);

        return ret;
}

extern void block_all_signals(int (*notifier)(void *priv), void *priv,
                              sigset_t *mask);
extern void unblock_all_signals(void);
extern void release_task(struct task_struct * p);
extern int send_sig_info(int, struct siginfo *, struct task_struct *);
extern int send_group_sig_info(int, struct siginfo *, struct task_struct *);
extern int force_sigsegv(int, struct task_struct *);
extern int force_sig_info(int, struct siginfo *, struct task_struct *);
extern int __kill_pgrp_info(int sig, struct siginfo *info, struct pid *pgrp);
extern int kill_pgrp_info(int sig, struct siginfo *info, struct pid *pgrp);
extern int kill_pid_info(int sig, struct siginfo *info, struct pid *pid);
extern int kill_pid_info_as_uid(int, struct siginfo *, struct pid *, uid_t, uid_t, u32);
extern int kill_pgrp(struct pid *pid, int sig, int priv);
extern int kill_pid(struct pid *pid, int sig, int priv);
extern int __kill_pg_info(int sig, struct siginfo *info, pid_t pgrp);
extern int kill_pg_info(int, struct siginfo *, pid_t);
extern void do_notify_parent(struct task_struct *, int);
extern void force_sig(int, struct task_struct *);
extern void force_sig_specific(int, struct task_struct *);
extern int send_sig(int, struct task_struct *, int);
extern void zap_other_threads(struct task_struct *p);
extern int kill_pg(pid_t, int, int);
extern int kill_proc(pid_t, int, int);
extern struct sigqueue *sigqueue_alloc(void);
extern void sigqueue_free(struct sigqueue *);
extern int send_sigqueue(int, struct sigqueue *, struct task_struct *);
extern int send_group_sigqueue(int, struct sigqueue *, struct task_struct *);
extern int do_sigaction(int, struct k_sigaction *, struct k_sigaction *);
extern int do_sigaltstack(const stack_t *, stack_t *, unsigned long);

static inline __attribute__((always_inline)) int kill_cad_pid(int sig, int priv)
{
        return kill_pid(cad_pid, sig, priv);
}






static inline __attribute__((always_inline)) int is_si_special(const struct siginfo *info)
{
        return info <= ((struct siginfo *) 2);
}



static inline __attribute__((always_inline)) int on_sig_stack(unsigned long sp)
{
        return (sp - get_current()->sas_ss_sp < get_current()->sas_ss_size);
}

static inline __attribute__((always_inline)) int sas_ss_flags(unsigned long sp)
{
        return (get_current()->sas_ss_size == 0 ? 2
                : on_sig_stack(sp) ? 1 : 0);
}




extern struct mm_struct * mm_alloc(void);


extern void __mmdrop(struct mm_struct *) __attribute__((regparm(3)));
static inline __attribute__((always_inline)) void mmdrop(struct mm_struct * mm)
{
        if (atomic_dec_and_test(&mm->mm_count))
                __mmdrop(mm);
}


extern void mmput(struct mm_struct *);

extern struct mm_struct *get_task_mm(struct task_struct *task);

extern void mm_release(struct task_struct *, struct mm_struct *);

extern int copy_thread(int, unsigned long, unsigned long, unsigned long, struct task_struct *, struct pt_regs *);
extern void flush_thread(void);
extern void exit_thread(void);

extern void exit_files(struct task_struct *);
extern void __cleanup_signal(struct signal_struct *);
extern void __cleanup_sighand(struct sighand_struct *);
extern void exit_itimers(struct signal_struct *);

extern void do_group_exit(int);

extern void daemonize(const char *, ...);
extern int allow_signal(int);
extern int disallow_signal(int);

extern int do_execve(char *, char * *, char * *, struct pt_regs *);
extern long do_fork(unsigned long, unsigned long, struct pt_regs *, unsigned long, int *, int *);
struct task_struct *fork_idle(int);

extern void set_task_comm(struct task_struct *tsk, char *from);
extern void get_task_comm(char *to, struct task_struct *tsk);


extern void wait_task_inactive(struct task_struct * p);
# 1449 "include/linux/sched.h"
static inline __attribute__((always_inline)) int has_group_leader_pid(struct task_struct *p)
{
        return p->pid == p->tgid;
}

static inline __attribute__((always_inline)) struct task_struct *next_thread(const struct task_struct *p)
{
        return ({ const typeof( ((struct task_struct *)0)->thread_group ) *__mptr = (({ typeof(p->thread_group.next) _________p1 = p->thread_group.next; do { } while(0); (_________p1); })); (struct task_struct *)( (char *)__mptr - ((size_t) &((struct task_struct *)0)->thread_group) );});

}

static inline __attribute__((always_inline)) int thread_group_empty(struct task_struct *p)
{
        return list_empty(&p->thread_group);
}
# 1477 "include/linux/sched.h"
static inline __attribute__((always_inline)) void task_lock(struct task_struct *p)
{
        _spin_lock(&p->alloc_lock);
}

static inline __attribute__((always_inline)) void task_unlock(struct task_struct *p)
{
        __raw_spin_unlock(&(&p->alloc_lock)->raw_lock);
}

extern struct sighand_struct *lock_task_sighand(struct task_struct *tsk,
                                                        unsigned long *flags);

static inline __attribute__((always_inline)) void unlock_task_sighand(struct task_struct *tsk,
                                                unsigned long *flags)
{
        _spin_unlock_irqrestore(&tsk->sighand->siglock, *flags);
}






static inline __attribute__((always_inline)) void setup_thread_stack(struct task_struct *p, struct task_struct *org)
{
        *(p)->thread_info = *(org)->thread_info;
        (p)->thread_info->task = p;
}

static inline __attribute__((always_inline)) unsigned long *end_of_stack(struct task_struct *p)
{
        return (unsigned long *)(p->thread_info + 1);
}






static inline __attribute__((always_inline)) void set_tsk_thread_flag(struct task_struct *tsk, int flag)
{
        set_ti_thread_flag((tsk)->thread_info, flag);
}

static inline __attribute__((always_inline)) void clear_tsk_thread_flag(struct task_struct *tsk, int flag)
{
        clear_ti_thread_flag((tsk)->thread_info, flag);
}

static inline __attribute__((always_inline)) int test_and_set_tsk_thread_flag(struct task_struct *tsk, int flag)
{
        return test_and_set_ti_thread_flag((tsk)->thread_info, flag);
}

static inline __attribute__((always_inline)) int test_and_clear_tsk_thread_flag(struct task_struct *tsk, int flag)
{
        return test_and_clear_ti_thread_flag((tsk)->thread_info, flag);
}

static inline __attribute__((always_inline)) int test_tsk_thread_flag(struct task_struct *tsk, int flag)
{
        return test_ti_thread_flag((tsk)->thread_info, flag);
}

static inline __attribute__((always_inline)) void set_tsk_need_resched(struct task_struct *tsk)
{
        set_tsk_thread_flag(tsk,3);
}

static inline __attribute__((always_inline)) void clear_tsk_need_resched(struct task_struct *tsk)
{
        clear_tsk_thread_flag(tsk,3);
}

static inline __attribute__((always_inline)) int signal_pending(struct task_struct *p)
{
        return __builtin_expect(!!(test_tsk_thread_flag(p,2)), 0);
}

static inline __attribute__((always_inline)) int need_resched(void)
{
        return __builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 3)), 0);
}
# 1569 "include/linux/sched.h"
extern int cond_resched(void);
extern int cond_resched_lock(spinlock_t * lock);
extern int cond_resched_softirq(void);
# 1587 "include/linux/sched.h"
static inline __attribute__((always_inline)) int lock_need_resched(spinlock_t *lock)
{
        if (0 || need_resched())
                return 1;
        return 0;
}





extern void recalc_sigpending_tsk(struct task_struct *t) __attribute__((regparm(3)));
extern void recalc_sigpending(void);

extern void signal_wake_up(struct task_struct *t, int resume_stopped);






static inline __attribute__((always_inline)) unsigned int task_cpu(const struct task_struct *p)
{
        return (p)->thread_info->cpu;
}

static inline __attribute__((always_inline)) void set_task_cpu(struct task_struct *p, unsigned int cpu)
{
        (p)->thread_info->cpu = cpu;
}
# 1632 "include/linux/sched.h"
extern void arch_pick_mmap_layout(struct mm_struct *mm);
# 1642 "include/linux/sched.h"
extern long sched_setaffinity(pid_t pid, cpumask_t new_mask);
extern long sched_getaffinity(pid_t pid, cpumask_t *mask);

# 1 "include/linux/sysdev.h" 1
# 24 "include/linux/sysdev.h"
# 1 "include/linux/kobject.h" 1
# 22 "include/linux/kobject.h"
# 1 "include/linux/sysfs.h" 1
# 16 "include/linux/sysfs.h"
struct kobject;
struct module;

struct attribute {
        const char * name;
        struct module * owner;
        mode_t mode;
};

struct attribute_group {
        const char * name;
        struct attribute ** attrs;
};
# 52 "include/linux/sysfs.h"
struct vm_area_struct;

struct bin_attribute {
        struct attribute attr;
        size_t size;
        void *private;
        ssize_t (*read)(struct kobject *, char *, loff_t, size_t);
        ssize_t (*write)(struct kobject *, char *, loff_t, size_t);
        int (*mmap)(struct kobject *, struct bin_attribute *attr,
                    struct vm_area_struct *vma);
};

struct sysfs_ops {
        ssize_t (*show)(struct kobject *, struct attribute *,char *);
        ssize_t (*store)(struct kobject *,struct attribute *,const char *, size_t);
};

struct sysfs_dirent {
        atomic_t s_count;
        struct list_head s_sibling;
        struct list_head s_children;
        void * s_element;
        int s_type;
        umode_t s_mode;
        struct dentry * s_dentry;
        struct iattr * s_iattr;
        atomic_t s_event;
};
# 90 "include/linux/sysfs.h"
extern int
sysfs_create_dir(struct kobject *);

extern void
sysfs_remove_dir(struct kobject *);

extern int
sysfs_rename_dir(struct kobject *, const char *new_name);

extern int
sysfs_move_dir(struct kobject *, struct kobject *);

extern int
sysfs_create_file(struct kobject *, const struct attribute *);

extern int
sysfs_update_file(struct kobject *, const struct attribute *);

extern int
sysfs_chmod_file(struct kobject *kobj, struct attribute *attr, mode_t mode);

extern void
sysfs_remove_file(struct kobject *, const struct attribute *);

extern int
sysfs_create_link(struct kobject * kobj, struct kobject * target, const char * name);

extern void
sysfs_remove_link(struct kobject *, const char * name);

int sysfs_create_bin_file(struct kobject *kobj,
                                        struct bin_attribute *attr);
void sysfs_remove_bin_file(struct kobject *kobj, struct bin_attribute *attr);

int sysfs_create_group(struct kobject *,
                                        const struct attribute_group *);
void sysfs_remove_group(struct kobject *, const struct attribute_group *);
void sysfs_notify(struct kobject * k, char *dir, char *attr);

extern int sysfs_init(void);
# 23 "include/linux/kobject.h" 2
# 35 "include/linux/kobject.h"
extern char uevent_helper[];


extern u64 uevent_seqnum;


typedef int kobject_action_t;
enum kobject_action {
        KOBJ_ADD = ( kobject_action_t) 0x01,
        KOBJ_REMOVE = ( kobject_action_t) 0x02,
        KOBJ_CHANGE = ( kobject_action_t) 0x03,
        KOBJ_MOUNT = ( kobject_action_t) 0x04,
        KOBJ_UMOUNT = ( kobject_action_t) 0x05,
        KOBJ_OFFLINE = ( kobject_action_t) 0x06,
        KOBJ_ONLINE = ( kobject_action_t) 0x07,
        KOBJ_MOVE = ( kobject_action_t) 0x08,
};

struct kobject {
        const char * k_name;
        char name[20];
        struct kref kref;
        struct list_head entry;
        struct kobject * parent;
        struct kset * kset;
        struct kobj_type * ktype;
        struct dentry * dentry;
        wait_queue_head_t poll;
};

extern int kobject_set_name(struct kobject *, const char *, ...)
        __attribute__((format(printf,2,3)));

static inline __attribute__((always_inline)) const char * kobject_name(const struct kobject * kobj)
{
        return kobj->k_name;
}

extern void kobject_init(struct kobject *);
extern void kobject_cleanup(struct kobject *);

extern int kobject_add(struct kobject *);
extern void kobject_del(struct kobject *);

extern int kobject_rename(struct kobject *, const char *new_name);
extern int kobject_move(struct kobject *, struct kobject *);

extern int kobject_register(struct kobject *);
extern void kobject_unregister(struct kobject *);

extern struct kobject * kobject_get(struct kobject *);
extern void kobject_put(struct kobject *);

extern struct kobject *kobject_add_dir(struct kobject *, const char *);

extern char * kobject_get_path(struct kobject *, gfp_t);

struct kobj_type {
        void (*release)(struct kobject *);
        struct sysfs_ops * sysfs_ops;
        struct attribute ** default_attrs;
};
# 116 "include/linux/kobject.h"
struct kset_uevent_ops {
        int (*filter)(struct kset *kset, struct kobject *kobj);
        const char *(*name)(struct kset *kset, struct kobject *kobj);
        int (*uevent)(struct kset *kset, struct kobject *kobj, char **envp,
                        int num_envp, char *buffer, int buffer_size);
};

struct kset {
        struct subsystem * subsys;
        struct kobj_type * ktype;
        struct list_head list;
        spinlock_t list_lock;
        struct kobject kobj;
        struct kset_uevent_ops * uevent_ops;
};


extern void kset_init(struct kset * k);
extern int kset_add(struct kset * k);
extern int kset_register(struct kset * k);
extern void kset_unregister(struct kset * k);

static inline __attribute__((always_inline)) struct kset * to_kset(struct kobject * kobj)
{
        return kobj ? ({ const typeof( ((struct kset *)0)->kobj ) *__mptr = (kobj); (struct kset *)( (char *)__mptr - ((size_t) &((struct kset *)0)->kobj) );}) : ((void *)0);
}

static inline __attribute__((always_inline)) struct kset * kset_get(struct kset * k)
{
        return k ? to_kset(kobject_get(&k->kobj)) : ((void *)0);
}

static inline __attribute__((always_inline)) void kset_put(struct kset * k)
{
        kobject_put(&k->kobj);
}

static inline __attribute__((always_inline)) struct kobj_type * get_ktype(struct kobject * k)
{
        if (k->kset && k->kset->ktype)
                return k->kset->ktype;
        else
                return k->ktype;
}

extern struct kobject * kset_find_obj(struct kset *, const char *);
# 172 "include/linux/kobject.h"
struct subsystem {
        struct kset kset;
        struct rw_semaphore rwsem;
};
# 195 "include/linux/kobject.h"
extern struct subsystem kernel_subsys;

extern struct subsystem hypervisor_subsys;
# 244 "include/linux/kobject.h"
extern void subsystem_init(struct subsystem *);
extern int subsystem_register(struct subsystem *);
extern void subsystem_unregister(struct subsystem *);

static inline __attribute__((always_inline)) struct subsystem * subsys_get(struct subsystem * s)
{
        return s ? ({ const typeof( ((struct subsystem *)0)->kset ) *__mptr = (kset_get(&s->kset)); (struct subsystem *)( (char *)__mptr - ((size_t) &((struct subsystem *)0)->kset) );}) : ((void *)0);
}

static inline __attribute__((always_inline)) void subsys_put(struct subsystem * s)
{
        kset_put(&s->kset);
}

struct subsys_attribute {
        struct attribute attr;
        ssize_t (*show)(struct subsystem *, char *);
        ssize_t (*store)(struct subsystem *, const char *, size_t);
};

extern int subsys_create_file(struct subsystem * ,
                                        struct subsys_attribute *);


int kobject_uevent(struct kobject *kobj, enum kobject_action action);
int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,
                        char *envp[]);

int add_uevent_var(char **envp, int num_envp, int *cur_index,
                        char *buffer, int buffer_size, int *cur_len,
                        const char *format, ...)
        __attribute__((format (printf, 7, 8)));
# 25 "include/linux/sysdev.h" 2



struct sys_device;

struct sysdev_class {
        struct list_head drivers;


        int (*shutdown)(struct sys_device *);
        int (*suspend)(struct sys_device *, pm_message_t state);
        int (*resume)(struct sys_device *);
        struct kset kset;
};

struct sysdev_class_attribute {
        struct attribute attr;
        ssize_t (*show)(struct sysdev_class *, char *);
        ssize_t (*store)(struct sysdev_class *, const char *, size_t);
};
# 54 "include/linux/sysdev.h"
extern int sysdev_class_register(struct sysdev_class *);
extern void sysdev_class_unregister(struct sysdev_class *);

extern int sysdev_class_create_file(struct sysdev_class *,
        struct sysdev_class_attribute *);
extern void sysdev_class_remove_file(struct sysdev_class *,
        struct sysdev_class_attribute *);




struct sysdev_driver {
        struct list_head entry;
        int (*add)(struct sys_device *);
        int (*remove)(struct sys_device *);
        int (*shutdown)(struct sys_device *);
        int (*suspend)(struct sys_device *, pm_message_t state);
        int (*resume)(struct sys_device *);
};


extern int sysdev_driver_register(struct sysdev_class *, struct sysdev_driver *);
extern void sysdev_driver_unregister(struct sysdev_class *, struct sysdev_driver *);







struct sys_device {
        u32 id;
        struct sysdev_class * cls;
        struct kobject kobj;
};

extern int sysdev_register(struct sys_device *);
extern void sysdev_unregister(struct sys_device *);


struct sysdev_attribute {
        struct attribute attr;
        ssize_t (*show)(struct sys_device *, char *);
        ssize_t (*store)(struct sys_device *, const char *, size_t);
};
# 108 "include/linux/sysdev.h"
extern int sysdev_create_file(struct sys_device *, struct sysdev_attribute *);
extern void sysdev_remove_file(struct sys_device *, struct sysdev_attribute *);
# 1646 "include/linux/sched.h" 2
extern int sched_mc_power_savings, sched_smt_power_savings;
extern struct sysdev_attribute attr_sched_mc_power_savings, attr_sched_smt_power_savings;
extern int sched_create_sysfs_power_savings_entries(struct sysdev_class *cls);

extern void normalize_rt_tasks(void);
# 36 "include/linux/utsname.h" 2

# 1 "include/linux/nsproxy.h" 1






struct mnt_namespace;
struct uts_namespace;
struct ipc_namespace;
struct pid_namespace;
# 24 "include/linux/nsproxy.h"
struct nsproxy {
        atomic_t count;
        spinlock_t nslock;
        struct uts_namespace *uts_ns;
        struct ipc_namespace *ipc_ns;
        struct mnt_namespace *mnt_ns;
        struct pid_namespace *pid_ns;
};
extern struct nsproxy init_nsproxy;

struct nsproxy *dup_namespaces(struct nsproxy *orig);
int copy_namespaces(int flags, struct task_struct *tsk);
void get_task_namespaces(struct task_struct *tsk);
void free_nsproxy(struct nsproxy *ns);

static inline __attribute__((always_inline)) void put_nsproxy(struct nsproxy *ns)
{
        if (atomic_dec_and_test(&ns->count)) {
                free_nsproxy(ns);
        }
}

static inline __attribute__((always_inline)) void exit_task_namespaces(struct task_struct *p)
{
        struct nsproxy *ns = p->nsproxy;
        if (ns) {
                task_lock(p);
                p->nsproxy = ((void *)0);
                task_unlock(p);
                put_nsproxy(ns);
        }
}
# 38 "include/linux/utsname.h" 2


struct uts_namespace {
        struct kref kref;
        struct new_utsname name;
};
extern struct uts_namespace init_uts_ns;

static inline __attribute__((always_inline)) void get_uts_ns(struct uts_namespace *ns)
{
        kref_get(&ns->kref);
}
# 62 "include/linux/utsname.h"
static inline __attribute__((always_inline)) int unshare_utsname(unsigned long unshare_flags,
                        struct uts_namespace **new_uts)
{
        if (unshare_flags & 0x04000000)
                return -22;

        return 0;
}

static inline __attribute__((always_inline)) int copy_utsname(int flags, struct task_struct *tsk)
{
        return 0;
}
static inline __attribute__((always_inline)) void put_uts_ns(struct uts_namespace *ns)
{
}


static inline __attribute__((always_inline)) struct new_utsname *utsname(void)
{
        return &get_current()->nsproxy->uts_ns->name;
}

static inline __attribute__((always_inline)) struct new_utsname *init_utsname(void)
{
        return &init_uts_ns.name;
}

extern struct rw_semaphore uts_sem;
# 13 "include/asm/elf.h" 2
# 27 "include/asm/elf.h"
typedef unsigned long elf_greg_t;


typedef elf_greg_t elf_gregset_t[(sizeof (struct user_regs_struct) / sizeof(elf_greg_t))];

typedef struct user_i387_struct elf_fpregset_t;
typedef struct user_fxsr_struct elf_fpxregset_t;
# 52 "include/asm/elf.h"
# 1 "include/asm/desc.h" 1



# 1 "include/asm/ldt.h" 1
# 15 "include/asm/ldt.h"
struct user_desc {
        unsigned int entry_number;
        unsigned long base_addr;
        unsigned int limit;
        unsigned int seg_32bit:1;
        unsigned int contents:2;
        unsigned int read_exec_only:1;
        unsigned int limit_in_pages:1;
        unsigned int seg_not_present:1;
        unsigned int useable:1;
};
# 5 "include/asm/desc.h" 2
# 15 "include/asm/desc.h"
extern struct desc_struct cpu_gdt_table[32];

struct Xgt_desc_struct {
        unsigned short size;
        unsigned long address __attribute__((packed));
        unsigned short pad;
} __attribute__ ((packed));

extern struct Xgt_desc_struct idt_descr;
extern __typeof__(struct Xgt_desc_struct) per_cpu__cpu_gdt_descr;


static inline __attribute__((always_inline)) struct desc_struct *get_cpu_gdt_table(unsigned int cpu)
{
        return (struct desc_struct *)(*({ extern int simple_identifier_cpu_gdt_descr(void); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"(&per_cpu__cpu_gdt_descr)); (typeof(&per_cpu__cpu_gdt_descr)) (__ptr + (__per_cpu_offset[cpu])); }); })).address;
}

extern struct desc_struct idt_table[];
extern void set_intr_gate(unsigned int irq, void * addr);

static inline __attribute__((always_inline)) void pack_descriptor(__u32 *a, __u32 *b,
        unsigned long base, unsigned long limit, unsigned char type, unsigned char flags)
{
        *a = ((base & 0xffff) << 16) | (limit & 0xffff);
        *b = (base & 0xff000000) | ((base & 0xff0000) >> 16) |
                (limit & 0x000f0000) | ((type & 0xff) << 8) | ((flags & 0xf) << 20);
}

static inline __attribute__((always_inline)) void pack_gate(__u32 *a, __u32 *b,
        unsigned long base, unsigned short seg, unsigned char type, unsigned char flags)
{
        *a = (seg << 16) | (base & 0xffff);
        *b = (base & 0xffff0000) | ((type & 0xff) << 8) | (flags & 0xff);
}
# 77 "include/asm/desc.h"
static inline __attribute__((always_inline)) void load_TLS(struct thread_struct *t, unsigned int cpu)
{

        get_cpu_gdt_table(cpu)[6 + 0] = t->tls_array[0]; get_cpu_gdt_table(cpu)[6 + 1] = t->tls_array[1]; get_cpu_gdt_table(cpu)[6 + 2] = t->tls_array[2];

}





static inline __attribute__((always_inline)) void write_dt_entry(void *dt, int entry, __u32 entry_a, __u32 entry_b)
{
        __u32 *lp = (__u32 *)((char *)dt + entry*8);
        *lp = entry_a;
        *(lp+1) = entry_b;
}




static inline __attribute__((always_inline)) __attribute__((regparm(3))) void native_set_ldt(const void *addr,
                                           unsigned int entries)
{
        if (__builtin_expect(!!(entries == 0), 1))
                __asm__ __volatile__("lldt %w0"::"q" (0));
        else {
                unsigned cpu = (({ typeof(_proxy_pda.cpu_number) ret__; switch (sizeof(_proxy_pda.cpu_number)) { case 1: asm("mov" "b %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 2: asm("mov" "w %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 4: asm("mov" "l %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; default: __bad_pda_field(); } ret__; }));
                __u32 a, b;

                pack_descriptor(&a, &b, (unsigned long)addr,
                                entries * sizeof(struct desc_struct) - 1,
                                0x82, 0);
                write_dt_entry(get_cpu_gdt_table(cpu), (12 + 5), a, b);
                __asm__ __volatile__("lldt %w0"::"q" ((12 + 5)*8));
        }
}

static inline __attribute__((always_inline)) void _set_gate(int gate, unsigned int type, void *addr, unsigned short seg)
{
        __u32 a, b;
        pack_gate(&a, &b, (unsigned long)addr, seg, type, 0);
        write_dt_entry(idt_table, gate, a, b);
}

static inline __attribute__((always_inline)) void __set_tss_desc(unsigned int cpu, unsigned int entry, const void *addr)
{
        __u32 a, b;
        pack_descriptor(&a, &b, (unsigned long)addr,
                        ((size_t) &((struct tss_struct *)0)->__cacheline_filler) - 1,
                        0x89, 0);
        write_dt_entry(get_cpu_gdt_table(cpu), entry, a, b);
}
# 159 "include/asm/desc.h"
static inline __attribute__((always_inline)) void clear_LDT(void)
{
        native_set_ldt(((void *)0), 0);
}




static inline __attribute__((always_inline)) void load_LDT_nolock(mm_context_t *pc)
{
        native_set_ldt(pc->ldt, pc->size);
}

static inline __attribute__((always_inline)) void load_LDT(mm_context_t *pc)
{
        do { } while (0);
        load_LDT_nolock(pc);
        do { } while (0);
}

static inline __attribute__((always_inline)) unsigned long get_desc_base(unsigned long *desc)
{
        unsigned long base;
        base = ((desc[0] >> 16) & 0x0000ffff) |
                ((desc[1] << 16) & 0x00ff0000) |
                (desc[1] & 0xff000000);
        return base;
}
# 53 "include/asm/elf.h" 2
# 125 "include/asm/elf.h"
struct task_struct;

extern int dump_task_regs (struct task_struct *, elf_gregset_t *);
extern int dump_task_fpu (struct task_struct *, elf_fpregset_t *);
extern int dump_task_extended_fpu (struct task_struct *, struct user_fxsr_struct *);
# 152 "include/asm/elf.h"
extern void __kernel_vsyscall;
# 163 "include/asm/elf.h"
extern unsigned int vdso_enabled;
# 8 "include/linux/elf.h" 2

struct file;
# 19 "include/linux/elf.h"
typedef __u32 Elf32_Addr;
typedef __u16 Elf32_Half;
typedef __u32 Elf32_Off;
typedef __s32 Elf32_Sword;
typedef __u32 Elf32_Word;


typedef __u64 Elf64_Addr;
typedef __u16 Elf64_Half;
typedef __s16 Elf64_SHalf;
typedef __u64 Elf64_Off;
typedef __s32 Elf64_Sword;
typedef __u32 Elf64_Word;
typedef __u64 Elf64_Xword;
typedef __s64 Elf64_Sxword;
# 109 "include/linux/elf.h"
typedef struct dynamic{
  Elf32_Sword d_tag;
  union{
    Elf32_Sword d_val;
    Elf32_Addr d_ptr;
  } d_un;
} Elf32_Dyn;

typedef struct {
  Elf64_Sxword d_tag;
  union {
    Elf64_Xword d_val;
    Elf64_Addr d_ptr;
  } d_un;
} Elf64_Dyn;
# 132 "include/linux/elf.h"
typedef struct elf32_rel {
  Elf32_Addr r_offset;
  Elf32_Word r_info;
} Elf32_Rel;

typedef struct elf64_rel {
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
} Elf64_Rel;

typedef struct elf32_rela{
  Elf32_Addr r_offset;
  Elf32_Word r_info;
  Elf32_Sword r_addend;
} Elf32_Rela;

typedef struct elf64_rela {
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
  Elf64_Sxword r_addend;
} Elf64_Rela;

typedef struct elf32_sym{
  Elf32_Word st_name;
  Elf32_Addr st_value;
  Elf32_Word st_size;
  unsigned char st_info;
  unsigned char st_other;
  Elf32_Half st_shndx;
} Elf32_Sym;

typedef struct elf64_sym {
  Elf64_Word st_name;
  unsigned char st_info;
  unsigned char st_other;
  Elf64_Half st_shndx;
  Elf64_Addr st_value;
  Elf64_Xword st_size;
} Elf64_Sym;




typedef struct elf32_hdr{
  unsigned char e_ident[16];
  Elf32_Half e_type;
  Elf32_Half e_machine;
  Elf32_Word e_version;
  Elf32_Addr e_entry;
  Elf32_Off e_phoff;
  Elf32_Off e_shoff;
  Elf32_Word e_flags;
  Elf32_Half e_ehsize;
  Elf32_Half e_phentsize;
  Elf32_Half e_phnum;
  Elf32_Half e_shentsize;
  Elf32_Half e_shnum;
  Elf32_Half e_shstrndx;
} Elf32_Ehdr;

typedef struct elf64_hdr {
  unsigned char e_ident[16];
  Elf64_Half e_type;
  Elf64_Half e_machine;
  Elf64_Word e_version;
  Elf64_Addr e_entry;
  Elf64_Off e_phoff;
  Elf64_Off e_shoff;
  Elf64_Word e_flags;
  Elf64_Half e_ehsize;
  Elf64_Half e_phentsize;
  Elf64_Half e_phnum;
  Elf64_Half e_shentsize;
  Elf64_Half e_shnum;
  Elf64_Half e_shstrndx;
} Elf64_Ehdr;







typedef struct elf32_phdr{
  Elf32_Word p_type;
  Elf32_Off p_offset;
  Elf32_Addr p_vaddr;
  Elf32_Addr p_paddr;
  Elf32_Word p_filesz;
  Elf32_Word p_memsz;
  Elf32_Word p_flags;
  Elf32_Word p_align;
} Elf32_Phdr;

typedef struct elf64_phdr {
  Elf64_Word p_type;
  Elf64_Word p_flags;
  Elf64_Off p_offset;
  Elf64_Addr p_vaddr;
  Elf64_Addr p_paddr;
  Elf64_Xword p_filesz;
  Elf64_Xword p_memsz;
  Elf64_Xword p_align;
} Elf64_Phdr;
# 271 "include/linux/elf.h"
typedef struct {
  Elf32_Word sh_name;
  Elf32_Word sh_type;
  Elf32_Word sh_flags;
  Elf32_Addr sh_addr;
  Elf32_Off sh_offset;
  Elf32_Word sh_size;
  Elf32_Word sh_link;
  Elf32_Word sh_info;
  Elf32_Word sh_addralign;
  Elf32_Word sh_entsize;
} Elf32_Shdr;

typedef struct elf64_shdr {
  Elf64_Word sh_name;
  Elf64_Word sh_type;
  Elf64_Xword sh_flags;
  Elf64_Addr sh_addr;
  Elf64_Off sh_offset;
  Elf64_Xword sh_size;
  Elf64_Word sh_link;
  Elf64_Word sh_info;
  Elf64_Xword sh_addralign;
  Elf64_Xword sh_entsize;
} Elf64_Shdr;
# 344 "include/linux/elf.h"
typedef struct elf32_note {
  Elf32_Word n_namesz;
  Elf32_Word n_descsz;
  Elf32_Word n_type;
} Elf32_Nhdr;


typedef struct elf64_note {
  Elf64_Word n_namesz;
  Elf64_Word n_descsz;
  Elf64_Word n_type;
} Elf64_Nhdr;



extern Elf32_Dyn _DYNAMIC [];
# 376 "include/linux/elf.h"
static inline __attribute__((always_inline)) int arch_notes_size(void) { return 0; }
static inline __attribute__((always_inline)) void arch_write_notes(struct file *file) { }
# 16 "include/linux/module.h" 2


# 1 "include/linux/moduleparam.h" 1
# 29 "include/linux/moduleparam.h"
struct kernel_param;


typedef int (*param_set_fn)(const char *val, struct kernel_param *kp);

typedef int (*param_get_fn)(char *buffer, struct kernel_param *kp);

struct kernel_param {
        const char *name;
        unsigned int perm;
        param_set_fn set;
        param_get_fn get;
        void *arg;
};


struct kparam_string {
        unsigned int maxlen;
        char *string;
};


struct kparam_array
{
        unsigned int max;
        unsigned int *num;
        param_set_fn set;
        param_get_fn get;
        unsigned int elemsize;
        void *elem;
};
# 98 "include/linux/moduleparam.h"
extern int parse_args(const char *name,
                      char *args,
                      struct kernel_param *params,
                      unsigned num,
                      int (*unknown)(char *param, char *val));







extern int param_set_byte(const char *val, struct kernel_param *kp);
extern int param_get_byte(char *buffer, struct kernel_param *kp);


extern int param_set_short(const char *val, struct kernel_param *kp);
extern int param_get_short(char *buffer, struct kernel_param *kp);


extern int param_set_ushort(const char *val, struct kernel_param *kp);
extern int param_get_ushort(char *buffer, struct kernel_param *kp);


extern int param_set_int(const char *val, struct kernel_param *kp);
extern int param_get_int(char *buffer, struct kernel_param *kp);


extern int param_set_uint(const char *val, struct kernel_param *kp);
extern int param_get_uint(char *buffer, struct kernel_param *kp);


extern int param_set_long(const char *val, struct kernel_param *kp);
extern int param_get_long(char *buffer, struct kernel_param *kp);


extern int param_set_ulong(const char *val, struct kernel_param *kp);
extern int param_get_ulong(char *buffer, struct kernel_param *kp);


extern int param_set_charp(const char *val, struct kernel_param *kp);
extern int param_get_charp(char *buffer, struct kernel_param *kp);


extern int param_set_bool(const char *val, struct kernel_param *kp);
extern int param_get_bool(char *buffer, struct kernel_param *kp);


extern int param_set_invbool(const char *val, struct kernel_param *kp);
extern int param_get_invbool(char *buffer, struct kernel_param *kp);
# 162 "include/linux/moduleparam.h"
extern int param_array_set(const char *val, struct kernel_param *kp);
extern int param_array_get(char *buffer, struct kernel_param *kp);

extern int param_set_copystring(const char *val, struct kernel_param *kp);
extern int param_get_string(char *buffer, struct kernel_param *kp);



struct module;

extern int module_param_sysfs_setup(struct module *mod,
                                    struct kernel_param *kparam,
                                    unsigned int num_params);

extern void module_param_sysfs_remove(struct module *mod);
# 19 "include/linux/module.h" 2
# 1 "include/asm/local.h" 1





typedef struct
{
        volatile long counter;
} local_t;






static __inline__ __attribute__((always_inline)) void local_inc(local_t *v)
{
        __asm__ __volatile__(
                "incl %0"
                :"+m" (v->counter));
}

static __inline__ __attribute__((always_inline)) void local_dec(local_t *v)
{
        __asm__ __volatile__(
                "decl %0"
                :"+m" (v->counter));
}

static __inline__ __attribute__((always_inline)) void local_add(long i, local_t *v)
{
        __asm__ __volatile__(
                "addl %1,%0"
                :"+m" (v->counter)
                :"ir" (i));
}

static __inline__ __attribute__((always_inline)) void local_sub(long i, local_t *v)
{
        __asm__ __volatile__(
                "subl %1,%0"
                :"+m" (v->counter)
                :"ir" (i));
}
# 20 "include/linux/module.h" 2

# 1 "include/asm/module.h" 1




struct mod_arch_specific
{
};
# 22 "include/linux/module.h" 2
# 33 "include/linux/module.h"
struct kernel_symbol
{
        unsigned long value;
        const char *name;
};

struct modversion_info
{
        unsigned long crc;
        char name[(64 - sizeof(unsigned long))];
};

struct module;

struct module_attribute {
        struct attribute attr;
        ssize_t (*show)(struct module_attribute *, struct module *, char *);
        ssize_t (*store)(struct module_attribute *, struct module *,
                         const char *, size_t count);
        void (*setup)(struct module *, const char *);
        int (*test)(struct module *);
        void (*free)(struct module *);
};

struct module_kobject
{
        struct kobject kobj;
        struct module *mod;
};


extern int init_module(void);
extern void cleanup_module(void);


struct exception_table_entry;

const struct exception_table_entry *
search_extable(const struct exception_table_entry *first,
               const struct exception_table_entry *last,
               unsigned long value);
void sort_extable(struct exception_table_entry *start,
                  struct exception_table_entry *finish);
void sort_main_extable(void);

extern struct subsystem module_subsys;
# 164 "include/linux/module.h"
const struct exception_table_entry *search_exception_tables(unsigned long add);

struct notifier_block;




void *__symbol_get(const char *symbol);
void *__symbol_get_gpl(const char *symbol);
# 221 "include/linux/module.h"
struct module_ref
{
        local_t count;
} __attribute__((__aligned__((1 << (7)))));

enum module_state
{
        MODULE_STATE_LIVE,
        MODULE_STATE_COMING,
        MODULE_STATE_GOING,
};


struct module_sect_attr
{
        struct module_attribute mattr;
        char *name;
        unsigned long address;
};

struct module_sect_attrs
{
        struct attribute_group grp;
        int nsections;
        struct module_sect_attr attrs[0];
};

struct module_param_attrs;

struct module
{
        enum module_state state;


        struct list_head list;


        char name[(64 - sizeof(unsigned long))];


        struct module_kobject mkobj;
        struct module_param_attrs *param_attrs;
        struct module_attribute *modinfo_attrs;
        const char *version;
        const char *srcversion;
        struct kobject *drivers_dir;


        const struct kernel_symbol *syms;
        unsigned int num_syms;
        const unsigned long *crcs;


        const struct kernel_symbol *gpl_syms;
        unsigned int num_gpl_syms;
        const unsigned long *gpl_crcs;


        const struct kernel_symbol *unused_syms;
        unsigned int num_unused_syms;
        const unsigned long *unused_crcs;

        const struct kernel_symbol *unused_gpl_syms;
        unsigned int num_unused_gpl_syms;
        const unsigned long *unused_gpl_crcs;


        const struct kernel_symbol *gpl_future_syms;
        unsigned int num_gpl_future_syms;
        const unsigned long *gpl_future_crcs;


        unsigned int num_exentries;
        const struct exception_table_entry *extable;


        int (*init)(void);


        void *module_init;


        void *module_core;


        unsigned long init_size, core_size;


        unsigned long init_text_size, core_text_size;


        void *unwind_info;


        struct mod_arch_specific arch;


        int unsafe;

        unsigned int taints;



        struct list_head bug_list;
        struct bug_entry *bug_table;
        unsigned num_bugs;




        struct module_ref ref[32];


        struct list_head modules_which_use_me;


        struct task_struct *waiter;


        void (*exit)(void);




        Elf32_Sym *symtab;
        unsigned long num_symtab;
        char *strtab;


        struct module_sect_attrs *sect_attrs;



        void *percpu;



        char *args;
};




static inline __attribute__((always_inline)) int module_is_live(struct module *mod)
{
        return mod->state != MODULE_STATE_GOING;
}


struct module *module_text_address(unsigned long addr);
struct module *__module_text_address(unsigned long addr);
int is_module_address(unsigned long addr);



struct module *module_get_kallsym(unsigned int symnum, unsigned long *value,
                                char *type, char *name, size_t namelen);


unsigned long module_kallsyms_lookup_name(const char *name);

int is_exported(const char *name, const struct module *mod);

extern void __module_put_and_exit(struct module *mod, long code)
        __attribute__((noreturn));



unsigned int module_refcount(struct module *mod);
void __symbol_put(const char *symbol);

void symbol_put_addr(void *addr);



static inline __attribute__((always_inline)) void __module_get(struct module *module)
{
        if (module) {
                do { if (__builtin_expect(!!((module_refcount(module) == 0)!=0), 0)) do { asm volatile("1:\tud2\n" ".pushsection __bug_table,\"a\"\n" "2:\t.long 1b, %c0\n" "\t.word %c1, 0\n" "\t.org 2b+%c2\n" ".popsection" : : "i" ("include/linux/module.h"), "i" (399), "i" (sizeof(struct bug_entry))); for(;;) ; } while(0); } while(0);
                local_inc(&module->ref[({ do { } while (0); (({ typeof(_proxy_pda.cpu_number) ret__; switch (sizeof(_proxy_pda.cpu_number)) { case 1: asm("mov" "b %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 2: asm("mov" "w %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 4: asm("mov" "l %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; default: __bad_pda_field(); } ret__; })); })].count);
                do { } while (0);
        }
}

static inline __attribute__((always_inline)) int try_module_get(struct module *module)
{
        int ret = 1;

        if (module) {
                unsigned int cpu = ({ do { } while (0); (({ typeof(_proxy_pda.cpu_number) ret__; switch (sizeof(_proxy_pda.cpu_number)) { case 1: asm("mov" "b %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 2: asm("mov" "w %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 4: asm("mov" "l %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; default: __bad_pda_field(); } ret__; })); });
                if (__builtin_expect(!!(module_is_live(module)), 1))
                        local_inc(&module->ref[cpu].count);
                else
                        ret = 0;
                do { } while (0);
        }
        return ret;
}

extern void module_put(struct module *module);
# 456 "include/linux/module.h"
const char *module_address_lookup(unsigned long addr,
                                  unsigned long *symbolsize,
                                  unsigned long *offset,
                                  char **modname);


const struct exception_table_entry *search_module_extables(unsigned long addr);

int register_module_notifier(struct notifier_block * nb);
int unregister_module_notifier(struct notifier_block * nb);

extern void print_modules(void);

struct device_driver;
void module_add_driver(struct module *, struct device_driver *);
void module_remove_driver(struct device_driver *);
# 14 "init/main.c" 2
# 1 "include/linux/proc_fs.h" 1




# 1 "include/linux/fs.h" 1
# 9 "include/linux/fs.h"
# 1 "include/linux/limits.h" 1
# 10 "include/linux/fs.h" 2
# 1 "include/linux/ioctl.h" 1



# 1 "include/asm/ioctl.h" 1
# 1 "include/asm-generic/ioctl.h" 1
# 51 "include/asm-generic/ioctl.h"
extern unsigned int __invalid_size_argument_for_IOC;
# 2 "include/asm/ioctl.h" 2
# 5 "include/linux/ioctl.h" 2
# 11 "include/linux/fs.h" 2
# 35 "include/linux/fs.h"
struct files_stat_struct {
        int nr_files;
        int nr_free_files;
        int max_files;
};
extern struct files_stat_struct files_stat;
extern int get_max_files(void);

struct inodes_stat_t {
        int nr_inodes;
        int nr_unused;
        int dummy[5];
};
extern struct inodes_stat_t inodes_stat;

extern int leases_enable, lease_break_time;


extern int dir_notify_enable;
# 271 "include/linux/fs.h"
# 1 "include/linux/kdev_t.h" 1
# 21 "include/linux/kdev_t.h"
static inline __attribute__((always_inline)) int old_valid_dev(dev_t dev)
{
        return ((unsigned int) ((dev) >> 20)) < 256 && ((unsigned int) ((dev) & ((1U << 20) - 1))) < 256;
}

static inline __attribute__((always_inline)) u16 old_encode_dev(dev_t dev)
{
        return (((unsigned int) ((dev) >> 20)) << 8) | ((unsigned int) ((dev) & ((1U << 20) - 1)));
}

static inline __attribute__((always_inline)) dev_t old_decode_dev(u16 val)
{
        return ((((val >> 8) & 255) << 20) | (val & 255));
}

static inline __attribute__((always_inline)) int new_valid_dev(dev_t dev)
{
        return 1;
}

static inline __attribute__((always_inline)) u32 new_encode_dev(dev_t dev)
{
        unsigned major = ((unsigned int) ((dev) >> 20));
        unsigned minor = ((unsigned int) ((dev) & ((1U << 20) - 1)));
        return (minor & 0xff) | (major << 8) | ((minor & ~0xff) << 12);
}

static inline __attribute__((always_inline)) dev_t new_decode_dev(u32 dev)
{
        unsigned major = (dev & 0xfff00) >> 8;
        unsigned minor = (dev & 0xff) | ((dev >> 12) & 0xfff00);
        return (((major) << 20) | (minor));
}

static inline __attribute__((always_inline)) int huge_valid_dev(dev_t dev)
{
        return 1;
}

static inline __attribute__((always_inline)) u64 huge_encode_dev(dev_t dev)
{
        return new_encode_dev(dev);
}

static inline __attribute__((always_inline)) dev_t huge_decode_dev(u64 dev)
{
        return new_decode_dev(dev);
}

static inline __attribute__((always_inline)) int sysv_valid_dev(dev_t dev)
{
        return ((unsigned int) ((dev) >> 20)) < (1<<14) && ((unsigned int) ((dev) & ((1U << 20) - 1))) < (1<<18);
}

static inline __attribute__((always_inline)) u32 sysv_encode_dev(dev_t dev)
{
        return ((unsigned int) ((dev) & ((1U << 20) - 1))) | (((unsigned int) ((dev) >> 20)) << 18);
}

static inline __attribute__((always_inline)) unsigned sysv_major(u32 dev)
{
        return (dev >> 18) & 0x3fff;
}

static inline __attribute__((always_inline)) unsigned sysv_minor(u32 dev)
{
        return dev & 0x3ffff;
}
# 272 "include/linux/fs.h" 2
# 1 "include/linux/dcache.h" 1
# 12 "include/linux/dcache.h"
struct nameidata;
struct vfsmount;
# 33 "include/linux/dcache.h"
struct qstr {
        unsigned int hash;
        unsigned int len;
        const unsigned char *name;
};

struct dentry_stat_t {
        int nr_dentry;
        int nr_unused;
        int age_limit;
        int want_pages;
        int dummy[2];
};
extern struct dentry_stat_t dentry_stat;






static inline __attribute__((always_inline)) unsigned long
partial_name_hash(unsigned long c, unsigned long prevhash)
{
        return (prevhash + (c << 4) + (c >> 4)) * 11;
}





static inline __attribute__((always_inline)) unsigned long end_name_hash(unsigned long hash)
{
        return (unsigned int) hash;
}


static inline __attribute__((always_inline)) unsigned int
full_name_hash(const unsigned char *name, unsigned int len)
{
        unsigned long hash = 0;
        while (len--)
                hash = partial_name_hash(*name++, hash);
        return end_name_hash(hash);
}

struct dcookie_struct;



struct dentry {
        atomic_t d_count;
        unsigned int d_flags;
        spinlock_t d_lock;
        struct inode *d_inode;





        struct hlist_node d_hash;
        struct dentry *d_parent;
        struct qstr d_name;

        struct list_head d_lru;



        union {
                struct list_head d_child;
                struct rcu_head d_rcu;
        } d_u;
        struct list_head d_subdirs;
        struct list_head d_alias;
        unsigned long d_time;
        struct dentry_operations *d_op;
        struct super_block *d_sb;
        void *d_fsdata;

        struct dcookie_struct *d_cookie;

        int d_mounted;
        unsigned char d_iname[36];
};







enum dentry_d_lock_class
{
        DENTRY_D_LOCK_NORMAL,
        DENTRY_D_LOCK_NESTED
};

struct dentry_operations {
        int (*d_revalidate)(struct dentry *, struct nameidata *);
        int (*d_hash) (struct dentry *, struct qstr *);
        int (*d_compare) (struct dentry *, struct qstr *, struct qstr *);
        int (*d_delete)(struct dentry *);
        void (*d_release)(struct dentry *);
        void (*d_iput)(struct dentry *, struct inode *);
};
# 179 "include/linux/dcache.h"
extern spinlock_t dcache_lock;
# 197 "include/linux/dcache.h"
static inline __attribute__((always_inline)) void __d_drop(struct dentry *dentry)
{
        if (!(dentry->d_flags & 0x0010)) {
                dentry->d_flags |= 0x0010;
                hlist_del_rcu(&dentry->d_hash);
        }
}

static inline __attribute__((always_inline)) void d_drop(struct dentry *dentry)
{
        _spin_lock(&dcache_lock);
        _spin_lock(&dentry->d_lock);
        __d_drop(dentry);
        __raw_spin_unlock(&(&dentry->d_lock)->raw_lock);
        __raw_spin_unlock(&(&dcache_lock)->raw_lock);
}

static inline __attribute__((always_inline)) int dname_external(struct dentry *dentry)
{
        return dentry->d_name.name != dentry->d_iname;
}




extern void d_instantiate(struct dentry *, struct inode *);
extern struct dentry * d_instantiate_unique(struct dentry *, struct inode *);
extern struct dentry * d_materialise_unique(struct dentry *, struct inode *);
extern void d_delete(struct dentry *);


extern struct dentry * d_alloc(struct dentry *, const struct qstr *);
extern struct dentry * d_alloc_anon(struct inode *);
extern struct dentry * d_splice_alias(struct inode *, struct dentry *);
extern void shrink_dcache_sb(struct super_block *);
extern void shrink_dcache_parent(struct dentry *);
extern void shrink_dcache_for_umount(struct super_block *);
extern int d_invalidate(struct dentry *);


extern struct dentry * d_alloc_root(struct inode *);


extern void d_genocide(struct dentry *);

extern struct dentry *d_find_alias(struct inode *);
extern void d_prune_aliases(struct inode *);


extern int have_submounts(struct dentry *);




extern void d_rehash(struct dentry *);
# 262 "include/linux/dcache.h"
static inline __attribute__((always_inline)) void d_add(struct dentry *entry, struct inode *inode)
{
        d_instantiate(entry, inode);
        d_rehash(entry);
}
# 276 "include/linux/dcache.h"
static inline __attribute__((always_inline)) struct dentry *d_add_unique(struct dentry *entry, struct inode *inode)
{
        struct dentry *res;

        res = d_instantiate_unique(entry, inode);
        d_rehash(res != ((void *)0) ? res : entry);
        return res;
}


extern void d_move(struct dentry *, struct dentry *);


extern struct dentry * d_lookup(struct dentry *, struct qstr *);
extern struct dentry * __d_lookup(struct dentry *, struct qstr *);
extern struct dentry * d_hash_and_lookup(struct dentry *, struct qstr *);


extern int d_validate(struct dentry *, struct dentry *);

extern char * d_path(struct dentry *, struct vfsmount *, char *, int);
# 313 "include/linux/dcache.h"
static inline __attribute__((always_inline)) struct dentry *dget(struct dentry *dentry)
{
        if (dentry) {
                do { if (__builtin_expect(!!((!((&dentry->d_count)->counter))!=0), 0)) do { asm volatile("1:\tud2\n" ".pushsection __bug_table,\"a\"\n" "2:\t.long 1b, %c0\n" "\t.word %c1, 0\n" "\t.org 2b+%c2\n" ".popsection" : : "i" ("include/linux/dcache.h"), "i" (316), "i" (sizeof(struct bug_entry))); for(;;) ; } while(0); } while(0);
                atomic_inc(&dentry->d_count);
        }
        return dentry;
}

extern struct dentry * dget_locked(struct dentry *);
# 331 "include/linux/dcache.h"
static inline __attribute__((always_inline)) int d_unhashed(struct dentry *dentry)
{
        return (dentry->d_flags & 0x0010);
}

static inline __attribute__((always_inline)) struct dentry *dget_parent(struct dentry *dentry)
{
        struct dentry *ret;

        _spin_lock(&dentry->d_lock);
        ret = dget(dentry->d_parent);
        __raw_spin_unlock(&(&dentry->d_lock)->raw_lock);
        return ret;
}

extern void dput(struct dentry *);

static inline __attribute__((always_inline)) int d_mountpoint(struct dentry *dentry)
{
        return dentry->d_mounted;
}

extern struct vfsmount *lookup_mnt(struct vfsmount *, struct dentry *);
extern struct vfsmount *__lookup_mnt(struct vfsmount *, struct dentry *, int);
extern struct dentry *lookup_create(struct nameidata *nd, int is_dir);

extern int sysctl_vfs_cache_pressure;
# 273 "include/linux/fs.h" 2
# 1 "include/linux/namei.h" 1






struct vfsmount;

struct open_intent {
        int flags;
        int create_mode;
        struct file *file;
};

enum { MAX_NESTED_LINKS = 8 };

struct nameidata {
        struct dentry *dentry;
        struct vfsmount *mnt;
        struct qstr last;
        unsigned int flags;
        int last_type;
        unsigned depth;
        char *saved_names[MAX_NESTED_LINKS + 1];


        union {
                struct open_intent open;
        } intent;
};

struct path {
        struct vfsmount *mnt;
        struct dentry *dentry;
};




enum {LAST_NORM, LAST_ROOT, LAST_DOT, LAST_DOTDOT, LAST_BIND};
# 65 "include/linux/namei.h"
extern int __user_walk(const char *, unsigned, struct nameidata *) __attribute__((regparm(3)));
extern int __user_walk_fd(int dfd, const char *, unsigned, struct nameidata *) __attribute__((regparm(3)));




extern int path_lookup(const char *, unsigned, struct nameidata *) __attribute__((regparm(3)));
extern int path_walk(const char *, struct nameidata *) __attribute__((regparm(3)));
extern int link_path_walk(const char *, struct nameidata *) __attribute__((regparm(3)));
extern void path_release(struct nameidata *);
extern void path_release_on_umount(struct nameidata *);

extern int __user_path_lookup_open(const char *, unsigned lookup_flags, struct nameidata *nd, int open_flags);
extern int path_lookup_open(int dfd, const char *name, unsigned lookup_flags, struct nameidata *, int open_flags);
extern struct file *lookup_instantiate_filp(struct nameidata *nd, struct dentry *dentry,
                int (*open)(struct inode *, struct file *));
extern struct file *nameidata_to_filp(struct nameidata *nd, int flags);
extern void release_open_intent(struct nameidata *);

extern struct dentry * lookup_one_len(const char *, struct dentry *, int);

extern int follow_down(struct vfsmount **, struct dentry **);
extern int follow_up(struct vfsmount **, struct dentry **);

extern struct dentry *lock_rename(struct dentry *, struct dentry *);
extern void unlock_rename(struct dentry *, struct dentry *);

static inline __attribute__((always_inline)) void nd_set_link(struct nameidata *nd, char *path)
{
        nd->saved_names[nd->depth] = path;
}

static inline __attribute__((always_inline)) char *nd_get_link(struct nameidata *nd)
{
        return nd->saved_names[nd->depth];
}
# 274 "include/linux/fs.h" 2




# 1 "include/linux/radix-tree.h" 1
# 38 "include/linux/radix-tree.h"
static inline __attribute__((always_inline)) void *radix_tree_ptr_to_direct(void *ptr)
{
        return (void *)((unsigned long)ptr | 1);
}

static inline __attribute__((always_inline)) void *radix_tree_direct_to_ptr(void *ptr)
{
        return (void *)((unsigned long)ptr & ~1);
}

static inline __attribute__((always_inline)) int radix_tree_is_direct_ptr(void *ptr)
{
        return (int)((unsigned long)ptr & 1);
}






struct radix_tree_root {
        unsigned int height;
        gfp_t gfp_mask;
        struct radix_tree_node *rnode;
};
# 131 "include/linux/radix-tree.h"
static inline __attribute__((always_inline)) void *radix_tree_deref_slot(void **pslot)
{
        return radix_tree_direct_to_ptr(*pslot);
}
# 143 "include/linux/radix-tree.h"
static inline __attribute__((always_inline)) void radix_tree_replace_slot(void **pslot, void *item)
{
        do { if (__builtin_expect(!!((radix_tree_is_direct_ptr(item))!=0), 0)) do { asm volatile("1:\tud2\n" ".pushsection __bug_table,\"a\"\n" "2:\t.long 1b, %c0\n" "\t.word %c1, 0\n" "\t.org 2b+%c2\n" ".popsection" : : "i" ("include/linux/radix-tree.h"), "i" (145), "i" (sizeof(struct bug_entry))); for(;;) ; } while(0); } while(0);
        ({ __asm__ __volatile__ ("": : :"memory"); (*pslot) = ((void *)((unsigned long)item | ((unsigned long)*pslot & 1))); });


}

int radix_tree_insert(struct radix_tree_root *, unsigned long, void *);
void *radix_tree_lookup(struct radix_tree_root *, unsigned long);
void **radix_tree_lookup_slot(struct radix_tree_root *, unsigned long);
void *radix_tree_delete(struct radix_tree_root *, unsigned long);
unsigned int
radix_tree_gang_lookup(struct radix_tree_root *root, void **results,
                        unsigned long first_index, unsigned int max_items);
int radix_tree_preload(gfp_t gfp_mask);
void radix_tree_init(void);
void *radix_tree_tag_set(struct radix_tree_root *root,
                        unsigned long index, unsigned int tag);
void *radix_tree_tag_clear(struct radix_tree_root *root,
                        unsigned long index, unsigned int tag);
int radix_tree_tag_get(struct radix_tree_root *root,
                        unsigned long index, unsigned int tag);
unsigned int
radix_tree_gang_lookup_tag(struct radix_tree_root *root, void **results,
                unsigned long first_index, unsigned int max_items,
                unsigned int tag);
int radix_tree_tagged(struct radix_tree_root *root, unsigned int tag);

static inline __attribute__((always_inline)) void radix_tree_preload_end(void)
{
        do { } while (0);
}
# 279 "include/linux/fs.h" 2
# 1 "include/linux/prio_tree.h" 1
# 14 "include/linux/prio_tree.h"
struct raw_prio_tree_node {
        struct prio_tree_node *left;
        struct prio_tree_node *right;
        struct prio_tree_node *parent;
};

struct prio_tree_node {
        struct prio_tree_node *left;
        struct prio_tree_node *right;
        struct prio_tree_node *parent;
        unsigned long start;
        unsigned long last;
};

struct prio_tree_root {
        struct prio_tree_node *prio_tree_node;
        unsigned short index_bits;
        unsigned short raw;




};

struct prio_tree_iter {
        struct prio_tree_node *cur;
        unsigned long mask;
        unsigned long value;
        int size_level;

        struct prio_tree_root *root;
        unsigned long r_index;
        unsigned long h_index;
};

static inline __attribute__((always_inline)) void prio_tree_iter_init(struct prio_tree_iter *iter,
                struct prio_tree_root *root, unsigned long r_index, unsigned long h_index)
{
        iter->root = root;
        iter->r_index = r_index;
        iter->h_index = h_index;
        iter->cur = ((void *)0);
}
# 84 "include/linux/prio_tree.h"
static inline __attribute__((always_inline)) int prio_tree_empty(const struct prio_tree_root *root)
{
        return root->prio_tree_node == ((void *)0);
}

static inline __attribute__((always_inline)) int prio_tree_root(const struct prio_tree_node *node)
{
        return node->parent == node;
}

static inline __attribute__((always_inline)) int prio_tree_left_empty(const struct prio_tree_node *node)
{
        return node->left == node;
}

static inline __attribute__((always_inline)) int prio_tree_right_empty(const struct prio_tree_node *node)
{
        return node->right == node;
}


struct prio_tree_node *prio_tree_replace(struct prio_tree_root *root,
                struct prio_tree_node *old, struct prio_tree_node *node);
struct prio_tree_node *prio_tree_insert(struct prio_tree_root *root,
                struct prio_tree_node *node);
void prio_tree_remove(struct prio_tree_root *root, struct prio_tree_node *node);
struct prio_tree_node *prio_tree_next(struct prio_tree_iter *iter);
# 280 "include/linux/fs.h" 2
# 288 "include/linux/fs.h"
struct hd_geometry;
struct iovec;
struct nameidata;
struct kiocb;
struct pipe_inode_info;
struct poll_table_struct;
struct kstatfs;
struct vm_area_struct;
struct vfsmount;

extern void __attribute__ ((__section__ (".init.text"))) inode_init(unsigned long);
extern void __attribute__ ((__section__ (".init.text"))) inode_init_early(void);
extern void __attribute__ ((__section__ (".init.text"))) mnt_init(unsigned long);
extern void __attribute__ ((__section__ (".init.text"))) files_init(unsigned long);

struct buffer_head;
typedef int (get_block_t)(struct inode *inode, sector_t iblock,
                        struct buffer_head *bh_result, int create);
typedef void (dio_iodone_t)(struct kiocb *iocb, loff_t offset,
                        ssize_t bytes, void *private);
# 337 "include/linux/fs.h"
struct iattr {
        unsigned int ia_valid;
        umode_t ia_mode;
        uid_t ia_uid;
        gid_t ia_gid;
        loff_t ia_size;
        struct timespec ia_atime;
        struct timespec ia_mtime;
        struct timespec ia_ctime;






        struct file *ia_file;
};




# 1 "include/linux/quota.h" 1
# 44 "include/linux/quota.h"
typedef __kernel_uid32_t qid_t;
typedef __u64 qsize_t;

extern spinlock_t dq_data_lock;
# 105 "include/linux/quota.h"
struct if_dqblk {
        __u64 dqb_bhardlimit;
        __u64 dqb_bsoftlimit;
        __u64 dqb_curspace;
        __u64 dqb_ihardlimit;
        __u64 dqb_isoftlimit;
        __u64 dqb_curinodes;
        __u64 dqb_btime;
        __u64 dqb_itime;
        __u32 dqb_valid;
};
# 126 "include/linux/quota.h"
struct if_dqinfo {
        __u64 dqi_bgrace;
        __u64 dqi_igrace;
        __u32 dqi_flags;
        __u32 dqi_valid;
};





# 1 "include/linux/dqblk_xfs.h" 1
# 50 "include/linux/dqblk_xfs.h"
typedef struct fs_disk_quota {
        __s8 d_version;
        __s8 d_flags;
        __u16 d_fieldmask;
        __u32 d_id;
        __u64 d_blk_hardlimit;
        __u64 d_blk_softlimit;
        __u64 d_ino_hardlimit;
        __u64 d_ino_softlimit;
        __u64 d_bcount;
        __u64 d_icount;
        __s32 d_itimer;

        __s32 d_btimer;
        __u16 d_iwarns;
        __u16 d_bwarns;
        __s32 d_padding2;
        __u64 d_rtb_hardlimit;
        __u64 d_rtb_softlimit;
        __u64 d_rtbcount;
        __s32 d_rtbtimer;
        __u16 d_rtbwarns;
        __s16 d_padding3;
        char d_padding4[8];
} fs_disk_quota_t;
# 137 "include/linux/dqblk_xfs.h"
typedef struct fs_qfilestat {
        __u64 qfs_ino;
        __u64 qfs_nblks;
        __u32 qfs_nextents;
} fs_qfilestat_t;

typedef struct fs_quota_stat {
        __s8 qs_version;
        __u16 qs_flags;
        __s8 qs_pad;
        fs_qfilestat_t qs_uquota;
        fs_qfilestat_t qs_gquota;
        __u32 qs_incoredqs;
        __s32 qs_btimelimit;
        __s32 qs_itimelimit;
        __s32 qs_rtbtimelimit;
        __u16 qs_bwarnlimit;
        __u16 qs_iwarnlimit;
} fs_quota_stat_t;
# 138 "include/linux/quota.h" 2
# 1 "include/linux/dqblk_v1.h" 1
# 21 "include/linux/dqblk_v1.h"
struct v1_mem_dqinfo {
};
# 139 "include/linux/quota.h" 2
# 1 "include/linux/dqblk_v2.h" 1
# 20 "include/linux/dqblk_v2.h"
struct v2_mem_dqinfo {
        unsigned int dqi_blocks;
        unsigned int dqi_free_blk;
        unsigned int dqi_free_entry;
};
# 140 "include/linux/quota.h" 2
# 151 "include/linux/quota.h"
struct mem_dqblk {
        __u32 dqb_bhardlimit;
        __u32 dqb_bsoftlimit;
        qsize_t dqb_curspace;
        __u32 dqb_ihardlimit;
        __u32 dqb_isoftlimit;
        __u32 dqb_curinodes;
        time_t dqb_btime;
        time_t dqb_itime;
};




struct quota_format_type;

struct mem_dqinfo {
        struct quota_format_type *dqi_format;
        struct list_head dqi_dirty_list;
        unsigned long dqi_flags;
        unsigned int dqi_bgrace;
        unsigned int dqi_igrace;
        union {
                struct v1_mem_dqinfo v1_i;
                struct v2_mem_dqinfo v2_i;
        } u;
};

struct super_block;





extern void mark_info_dirty(struct super_block *sb, int type);







struct dqstats {
        int lookups;
        int drops;
        int reads;
        int writes;
        int cache_hits;
        int allocated_dquots;
        int free_dquots;
        int syncs;
};

extern struct dqstats dqstats;
# 213 "include/linux/quota.h"
struct dquot {
        struct hlist_node dq_hash;
        struct list_head dq_inuse;
        struct list_head dq_free;
        struct list_head dq_dirty;
        struct mutex dq_lock;
        atomic_t dq_count;
        wait_queue_head_t dq_wait_unused;
        struct super_block *dq_sb;
        unsigned int dq_id;
        loff_t dq_off;
        unsigned long dq_flags;
        short dq_type;
        struct mem_dqblk dq_dqb;
};







struct quota_format_ops {
        int (*check_quota_file)(struct super_block *sb, int type);
        int (*read_file_info)(struct super_block *sb, int type);
        int (*write_file_info)(struct super_block *sb, int type);
        int (*free_file_info)(struct super_block *sb, int type);
        int (*read_dqblk)(struct dquot *dquot);
        int (*commit_dqblk)(struct dquot *dquot);
        int (*release_dqblk)(struct dquot *dquot);
};


struct dquot_operations {
        int (*initialize) (struct inode *, int);
        int (*drop) (struct inode *);
        int (*alloc_space) (struct inode *, qsize_t, int);
        int (*alloc_inode) (const struct inode *, unsigned long);
        int (*free_space) (struct inode *, qsize_t);
        int (*free_inode) (const struct inode *, unsigned long);
        int (*transfer) (struct inode *, struct iattr *);
        int (*write_dquot) (struct dquot *);
        int (*acquire_dquot) (struct dquot *);
        int (*release_dquot) (struct dquot *);
        int (*mark_dirty) (struct dquot *);
        int (*write_info) (struct super_block *, int);
};


struct quotactl_ops {
        int (*quota_on)(struct super_block *, int, int, char *);
        int (*quota_off)(struct super_block *, int);
        int (*quota_sync)(struct super_block *, int);
        int (*get_info)(struct super_block *, int, struct if_dqinfo *);
        int (*set_info)(struct super_block *, int, struct if_dqinfo *);
        int (*get_dqblk)(struct super_block *, int, qid_t, struct if_dqblk *);
        int (*set_dqblk)(struct super_block *, int, qid_t, struct if_dqblk *);
        int (*get_xstate)(struct super_block *, struct fs_quota_stat *);
        int (*set_xstate)(struct super_block *, unsigned int, int);
        int (*get_xquota)(struct super_block *, int, qid_t, struct fs_disk_quota *);
        int (*set_xquota)(struct super_block *, int, qid_t, struct fs_disk_quota *);
};

struct quota_format_type {
        int qf_fmt_id;
        struct quota_format_ops *qf_ops;
        struct module *qf_owner;
        struct quota_format_type *qf_next;
};




struct quota_info {
        unsigned int flags;
        struct mutex dqio_mutex;
        struct mutex dqonoff_mutex;
        struct rw_semaphore dqptr_sem;
        struct inode *files[2];
        struct mem_dqinfo info[2];
        struct quota_format_ops *ops[2];
};


int mark_dquot_dirty(struct dquot *dquot);
# 307 "include/linux/quota.h"
int register_quota_format(struct quota_format_type *fmt);
void unregister_quota_format(struct quota_format_type *fmt);

struct quota_module_name {
        int qm_fmt_id;
        char *qm_mod_name;
};
# 359 "include/linux/fs.h" 2
# 386 "include/linux/fs.h"
enum positive_aop_returns {
        AOP_WRITEPAGE_ACTIVATE = 0x80000,
        AOP_TRUNCATED_PAGE = 0x80001,
};




struct page;
struct address_space;
struct writeback_control;

struct address_space_operations {
        int (*writepage)(struct page *page, struct writeback_control *wbc);
        int (*readpage)(struct file *, struct page *);
        void (*sync_page)(struct page *);


        int (*writepages)(struct address_space *, struct writeback_control *);


        int (*set_page_dirty)(struct page *page);

        int (*readpages)(struct file *filp, struct address_space *mapping,
                        struct list_head *pages, unsigned nr_pages);





        int (*prepare_write)(struct file *, struct page *, unsigned, unsigned);
        int (*commit_write)(struct file *, struct page *, unsigned, unsigned);

        sector_t (*bmap)(struct address_space *, sector_t);
        void (*invalidatepage) (struct page *, unsigned long);
        int (*releasepage) (struct page *, gfp_t);
        ssize_t (*direct_IO)(int, struct kiocb *, const struct iovec *iov,
                        loff_t offset, unsigned long nr_segs);
        struct page* (*get_xip_page)(struct address_space *, sector_t,
                        int);

        int (*migratepage) (struct address_space *,
                        struct page *, struct page *);
        int (*launder_page) (struct page *);
};

struct backing_dev_info;
struct address_space {
        struct inode *host;
        struct radix_tree_root page_tree;
        rwlock_t tree_lock;
        unsigned int i_mmap_writable;
        struct prio_tree_root i_mmap;
        struct list_head i_mmap_nonlinear;
        spinlock_t i_mmap_lock;
        unsigned int truncate_count;
        unsigned long nrpages;
        unsigned long writeback_index;
        const struct address_space_operations *a_ops;
        unsigned long flags;
        struct backing_dev_info *backing_dev_info;
        spinlock_t private_lock;
        struct list_head private_list;
        struct address_space *assoc_mapping;
} __attribute__((aligned(sizeof(long))));






struct block_device {
        dev_t bd_dev;
        struct inode * bd_inode;
        int bd_openers;
        struct mutex bd_mutex;
        struct semaphore bd_mount_sem;
        struct list_head bd_inodes;
        void * bd_holder;
        int bd_holders;

        struct list_head bd_holder_list;

        struct block_device * bd_contains;
        unsigned bd_block_size;
        struct hd_struct * bd_part;

        unsigned bd_part_count;
        int bd_invalidated;
        struct gendisk * bd_disk;
        struct list_head bd_list;
        struct backing_dev_info *bd_inode_backing_dev_info;






        unsigned long bd_private;
};
# 494 "include/linux/fs.h"
int mapping_tagged(struct address_space *mapping, int tag);




static inline __attribute__((always_inline)) int mapping_mapped(struct address_space *mapping)
{
        return !prio_tree_empty(&mapping->i_mmap) ||
                !list_empty(&mapping->i_mmap_nonlinear);
}







static inline __attribute__((always_inline)) int mapping_writably_mapped(struct address_space *mapping)
{
        return mapping->i_mmap_writable != 0;
}
# 527 "include/linux/fs.h"
struct inode {
        struct hlist_node i_hash;
        struct list_head i_list;
        struct list_head i_sb_list;
        struct list_head i_dentry;
        unsigned long i_ino;
        atomic_t i_count;
        unsigned int i_nlink;
        uid_t i_uid;
        gid_t i_gid;
        dev_t i_rdev;
        unsigned long i_version;
        loff_t i_size;

        seqcount_t i_size_seqcount;

        struct timespec i_atime;
        struct timespec i_mtime;
        struct timespec i_ctime;
        unsigned int i_blkbits;
        blkcnt_t i_blocks;
        unsigned short i_bytes;
        umode_t i_mode;
        spinlock_t i_lock;
        struct mutex i_mutex;
        struct rw_semaphore i_alloc_sem;
        struct inode_operations *i_op;
        const struct file_operations *i_fop;
        struct super_block *i_sb;
        struct file_lock *i_flock;
        struct address_space *i_mapping;
        struct address_space i_data;



        struct list_head i_devices;
        union {
                struct pipe_inode_info *i_pipe;
                struct block_device *i_bdev;
                struct cdev *i_cdev;
        };
        int i_cindex;

        __u32 i_generation;


        unsigned long i_dnotify_mask;
        struct dnotify_struct *i_dnotify;



        struct list_head inotify_watches;
        struct mutex inotify_mutex;


        unsigned long i_state;
        unsigned long dirtied_when;

        unsigned int i_flags;

        atomic_t i_writecount;



        void *i_private;
};
# 605 "include/linux/fs.h"
enum inode_i_mutex_lock_class
{
        I_MUTEX_NORMAL,
        I_MUTEX_PARENT,
        I_MUTEX_CHILD,
        I_MUTEX_XATTR,
        I_MUTEX_QUOTA
};

extern void inode_double_lock(struct inode *inode1, struct inode *inode2);
extern void inode_double_unlock(struct inode *inode1, struct inode *inode2);
# 627 "include/linux/fs.h"
static inline __attribute__((always_inline)) loff_t i_size_read(const struct inode *inode)
{

        loff_t i_size;
        unsigned int seq;

        do {
                seq = read_seqcount_begin(&inode->i_size_seqcount);
                i_size = inode->i_size;
        } while (read_seqcount_retry(&inode->i_size_seqcount, seq));
        return i_size;
# 648 "include/linux/fs.h"
}






static inline __attribute__((always_inline)) void i_size_write(struct inode *inode, loff_t i_size)
{

        write_seqcount_begin(&inode->i_size_seqcount);
        inode->i_size = i_size;
        write_seqcount_end(&inode->i_size_seqcount);







}

static inline __attribute__((always_inline)) unsigned iminor(const struct inode *inode)
{
        return ((unsigned int) ((inode->i_rdev) & ((1U << 20) - 1)));
}

static inline __attribute__((always_inline)) unsigned imajor(const struct inode *inode)
{
        return ((unsigned int) ((inode->i_rdev) >> 20));
}

extern struct block_device *I_BDEV(struct inode *inode);

struct fown_struct {
        rwlock_t lock;
        struct pid *pid;
        enum pid_type pid_type;
        uid_t uid, euid;
        int signum;
};




struct file_ra_state {
        unsigned long start;
        unsigned long size;
        unsigned long flags;
        unsigned long cache_hit;
        unsigned long prev_page;
        unsigned long ahead_start;
        unsigned long ahead_size;
        unsigned long ra_pages;
        unsigned long mmap_hit;
        unsigned long mmap_miss;
};



struct file {




        union {
                struct list_head fu_list;
                struct rcu_head fu_rcuhead;
        } f_u;
        struct path f_path;


        const struct file_operations *f_op;
        atomic_t f_count;
        unsigned int f_flags;
        mode_t f_mode;
        loff_t f_pos;
        struct fown_struct f_owner;
        unsigned int f_uid, f_gid;
        struct file_ra_state f_ra;

        unsigned long f_version;




        void *private_data;



        struct list_head f_ep_links;
        spinlock_t f_ep_lock;

        struct address_space *f_mapping;
};
extern spinlock_t files_lock;
# 775 "include/linux/fs.h"
typedef struct files_struct *fl_owner_t;

struct file_lock_operations {
        void (*fl_insert)(struct file_lock *);
        void (*fl_remove)(struct file_lock *);
        void (*fl_copy_lock)(struct file_lock *, struct file_lock *);
        void (*fl_release_private)(struct file_lock *);
};

struct lock_manager_operations {
        int (*fl_compare_owner)(struct file_lock *, struct file_lock *);
        void (*fl_notify)(struct file_lock *);
        void (*fl_copy_lock)(struct file_lock *, struct file_lock *);
        void (*fl_release_private)(struct file_lock *);
        void (*fl_break)(struct file_lock *);
        int (*fl_mylease)(struct file_lock *, struct file_lock *);
        int (*fl_change)(struct file_lock **, int);
};


# 1 "include/linux/nfs_fs_i.h" 1





# 1 "include/linux/nfs.h" 1
# 39 "include/linux/nfs.h"
 enum nfs_stat {
        NFS_OK = 0,
        NFSERR_PERM = 1,
        NFSERR_NOENT = 2,
        NFSERR_IO = 5,
        NFSERR_NXIO = 6,
        NFSERR_EAGAIN = 11,
        NFSERR_ACCES = 13,
        NFSERR_EXIST = 17,
        NFSERR_XDEV = 18,
        NFSERR_NODEV = 19,
        NFSERR_NOTDIR = 20,
        NFSERR_ISDIR = 21,
        NFSERR_INVAL = 22,
        NFSERR_FBIG = 27,
        NFSERR_NOSPC = 28,
        NFSERR_ROFS = 30,
        NFSERR_MLINK = 31,
        NFSERR_OPNOTSUPP = 45,
        NFSERR_NAMETOOLONG = 63,
        NFSERR_NOTEMPTY = 66,
        NFSERR_DQUOT = 69,
        NFSERR_STALE = 70,
        NFSERR_REMOTE = 71,
        NFSERR_WFLUSH = 99,
        NFSERR_BADHANDLE = 10001,
        NFSERR_NOT_SYNC = 10002,
        NFSERR_BAD_COOKIE = 10003,
        NFSERR_NOTSUPP = 10004,
        NFSERR_TOOSMALL = 10005,
        NFSERR_SERVERFAULT = 10006,
        NFSERR_BADTYPE = 10007,
        NFSERR_JUKEBOX = 10008,
        NFSERR_SAME = 10009,
        NFSERR_DENIED = 10010,
        NFSERR_EXPIRED = 10011,
        NFSERR_LOCKED = 10012,
        NFSERR_GRACE = 10013,
        NFSERR_FHEXPIRED = 10014,
        NFSERR_SHARE_DENIED = 10015,
        NFSERR_WRONGSEC = 10016,
        NFSERR_CLID_INUSE = 10017,
        NFSERR_RESOURCE = 10018,
        NFSERR_MOVED = 10019,
        NFSERR_NOFILEHANDLE = 10020,
        NFSERR_MINOR_VERS_MISMATCH = 10021,
        NFSERR_STALE_CLIENTID = 10022,
        NFSERR_STALE_STATEID = 10023,
        NFSERR_OLD_STATEID = 10024,
        NFSERR_BAD_STATEID = 10025,
        NFSERR_BAD_SEQID = 10026,
        NFSERR_NOT_SAME = 10027,
        NFSERR_LOCK_RANGE = 10028,
        NFSERR_SYMLINK = 10029,
        NFSERR_RESTOREFH = 10030,
        NFSERR_LEASE_MOVED = 10031,
        NFSERR_ATTRNOTSUPP = 10032,
        NFSERR_NO_GRACE = 10033,
        NFSERR_RECLAIM_BAD = 10034,
        NFSERR_RECLAIM_CONFLICT = 10035,
        NFSERR_BAD_XDR = 10036,
        NFSERR_LOCKS_HELD = 10037,
        NFSERR_OPENMODE = 10038,
        NFSERR_BADOWNER = 10039,
        NFSERR_BADCHAR = 10040,
        NFSERR_BADNAME = 10041,
        NFSERR_BAD_RANGE = 10042,
        NFSERR_LOCK_NOTSUPP = 10043,
        NFSERR_OP_ILLEGAL = 10044,
        NFSERR_DEADLOCK = 10045,
        NFSERR_FILE_OPEN = 10046,
        NFSERR_ADMIN_REVOKED = 10047,
        NFSERR_CB_PATH_DOWN = 10048,
        NFSERR_REPLAY_ME = 10049
};



enum nfs_ftype {
        NFNON = 0,
        NFREG = 1,
        NFDIR = 2,
        NFBLK = 3,
        NFCHR = 4,
        NFLNK = 5,
        NFSOCK = 6,
        NFBAD = 7,
        NFFIFO = 8
};


# 1 "include/linux/sunrpc/msg_prot.h" 1
# 18 "include/linux/sunrpc/msg_prot.h"
typedef u32 rpc_authflavor_t;

enum rpc_auth_flavors {
        RPC_AUTH_NULL = 0,
        RPC_AUTH_UNIX = 1,
        RPC_AUTH_SHORT = 2,
        RPC_AUTH_DES = 3,
        RPC_AUTH_KRB = 4,
        RPC_AUTH_GSS = 6,
        RPC_AUTH_MAXFLAVOR = 8,

        RPC_AUTH_GSS_KRB5 = 390003,
        RPC_AUTH_GSS_KRB5I = 390004,
        RPC_AUTH_GSS_KRB5P = 390005,
        RPC_AUTH_GSS_LKEY = 390006,
        RPC_AUTH_GSS_LKEYI = 390007,
        RPC_AUTH_GSS_LKEYP = 390008,
        RPC_AUTH_GSS_SPKM = 390009,
        RPC_AUTH_GSS_SPKMI = 390010,
        RPC_AUTH_GSS_SPKMP = 390011,
};




enum rpc_msg_type {
        RPC_CALL = 0,
        RPC_REPLY = 1
};

enum rpc_reply_stat {
        RPC_MSG_ACCEPTED = 0,
        RPC_MSG_DENIED = 1
};

enum rpc_accept_stat {
        RPC_SUCCESS = 0,
        RPC_PROG_UNAVAIL = 1,
        RPC_PROG_MISMATCH = 2,
        RPC_PROC_UNAVAIL = 3,
        RPC_GARBAGE_ARGS = 4,
        RPC_SYSTEM_ERR = 5,

        RPC_DROP_REPLY = 60000,
};

enum rpc_reject_stat {
        RPC_MISMATCH = 0,
        RPC_AUTH_ERROR = 1
};

enum rpc_auth_stat {
        RPC_AUTH_OK = 0,
        RPC_AUTH_BADCRED = 1,
        RPC_AUTH_REJECTEDCRED = 2,
        RPC_AUTH_BADVERF = 3,
        RPC_AUTH_REJECTEDVERF = 4,
        RPC_AUTH_TOOWEAK = 5,

        RPCSEC_GSS_CREDPROBLEM = 13,
        RPCSEC_GSS_CTXPROBLEM = 14
};
# 106 "include/linux/sunrpc/msg_prot.h"
typedef __be32 rpc_fraghdr;
# 131 "include/linux/nfs.h" 2






struct nfs_fh {
        unsigned short size;
        unsigned char data[128];
};





static inline __attribute__((always_inline)) int nfs_compare_fh(const struct nfs_fh *a, const struct nfs_fh *b)
{
        return a->size != b->size || __builtin_memcmp(a->data, b->data, a->size) != 0;
}

static inline __attribute__((always_inline)) void nfs_copy_fh(struct nfs_fh *target, const struct nfs_fh *source)
{
        target->size = source->size;
        (__builtin_constant_p(source->size) ? __constant_memcpy((target->data),(source->data),(source->size)) : __memcpy((target->data),(source->data),(source->size)));
}
# 165 "include/linux/nfs.h"
enum nfs3_stable_how {
        NFS_UNSTABLE = 0,
        NFS_DATA_SYNC = 1,
        NFS_FILE_SYNC = 2
};
# 7 "include/linux/nfs_fs_i.h" 2

struct nlm_lockowner;




struct nfs_lock_info {
        u32 state;
        struct nlm_lockowner *owner;
        struct list_head list;
};

struct nfs4_lock_state;
struct nfs4_lock_info {
        struct nfs4_lock_state *owner;
};
# 796 "include/linux/fs.h" 2

struct file_lock {
        struct file_lock *fl_next;
        struct list_head fl_link;
        struct list_head fl_block;
        fl_owner_t fl_owner;
        unsigned int fl_pid;
        wait_queue_head_t fl_wait;
        struct file *fl_file;
        unsigned char fl_flags;
        unsigned char fl_type;
        loff_t fl_start;
        loff_t fl_end;

        struct fasync_struct * fl_fasync;
        unsigned long fl_break_time;

        struct file_lock_operations *fl_ops;
        struct lock_manager_operations *fl_lmops;
        union {
                struct nfs_lock_info nfs_fl;
                struct nfs4_lock_info nfs4_fl;
        } fl_u;
};
# 828 "include/linux/fs.h"
# 1 "include/linux/fcntl.h" 1



# 1 "include/asm/fcntl.h" 1
# 1 "include/asm-generic/fcntl.h" 1
# 114 "include/asm-generic/fcntl.h"
struct flock {
        short l_type;
        short l_whence;
        off_t l_start;
        off_t l_len;
        pid_t l_pid;
       
};
# 137 "include/asm-generic/fcntl.h"
struct flock64 {
        short l_type;
        short l_whence;
        loff_t l_start;
        loff_t l_len;
        pid_t l_pid;
       
};
# 2 "include/asm/fcntl.h" 2
# 5 "include/linux/fcntl.h" 2
# 829 "include/linux/fs.h" 2

extern int fcntl_getlk(struct file *, struct flock *);
extern int fcntl_setlk(unsigned int, struct file *, unsigned int,
                        struct flock *);


extern int fcntl_getlk64(struct file *, struct flock64 *);
extern int fcntl_setlk64(unsigned int, struct file *, unsigned int,
                        struct flock64 *);


extern void send_sigio(struct fown_struct *fown, int fd, int band);
extern int fcntl_setlease(unsigned int fd, struct file *filp, long arg);
extern int fcntl_getlease(struct file *filp);


extern int do_sync_file_range(struct file *file, loff_t offset, loff_t endbyte,
                        unsigned int flags);


extern void locks_init_lock(struct file_lock *);
extern void locks_copy_lock(struct file_lock *, struct file_lock *);
extern void locks_remove_posix(struct file *, fl_owner_t);
extern void locks_remove_flock(struct file *);
extern int posix_test_lock(struct file *, struct file_lock *, struct file_lock *);
extern int posix_lock_file_conf(struct file *, struct file_lock *, struct file_lock *);
extern int posix_lock_file(struct file *, struct file_lock *);
extern int posix_lock_file_wait(struct file *, struct file_lock *);
extern int posix_unblock_lock(struct file *, struct file_lock *);
extern int flock_lock_file_wait(struct file *filp, struct file_lock *fl);
extern int __break_lease(struct inode *inode, unsigned int flags);
extern void lease_get_mtime(struct inode *, struct timespec *time);
extern int setlease(struct file *, long, struct file_lock **);
extern int lease_modify(struct file_lock **, int);
extern int lock_may_read(struct inode *, loff_t start, unsigned long count);
extern int lock_may_write(struct inode *, loff_t start, unsigned long count);

struct fasync_struct {
        int magic;
        int fa_fd;
        struct fasync_struct *fa_next;
        struct file *fa_file;
};




extern int fasync_helper(int, struct file *, int, struct fasync_struct **);

extern void kill_fasync(struct fasync_struct **, int, int);

extern void __kill_fasync(struct fasync_struct *, int, int);

extern int __f_setown(struct file *filp, struct pid *, enum pid_type, int force);
extern int f_setown(struct file *filp, unsigned long arg, int force);
extern void f_delown(struct file *filp);
extern pid_t f_getown(struct file *filp);
extern int send_sigurg(struct fown_struct *fown);
# 896 "include/linux/fs.h"
extern struct list_head super_blocks;
extern spinlock_t sb_lock;



struct super_block {
        struct list_head s_list;
        dev_t s_dev;
        unsigned long s_blocksize;
        unsigned char s_blocksize_bits;
        unsigned char s_dirt;
        unsigned long long s_maxbytes;
        struct file_system_type *s_type;
        struct super_operations *s_op;
        struct dquot_operations *dq_op;
        struct quotactl_ops *s_qcop;
        struct export_operations *s_export_op;
        unsigned long s_flags;
        unsigned long s_magic;
        struct dentry *s_root;
        struct rw_semaphore s_umount;
        struct mutex s_lock;
        int s_count;
        int s_syncing;
        int s_need_sync_fs;
        atomic_t s_active;



        struct xattr_handler **s_xattr;

        struct list_head s_inodes;
        struct list_head s_dirty;
        struct list_head s_io;
        struct hlist_head s_anon;
        struct list_head s_files;

        struct block_device *s_bdev;
        struct list_head s_instances;
        struct quota_info s_dquot;

        int s_frozen;
        wait_queue_head_t s_wait_unfrozen;

        char s_id[32];

        void *s_fs_info;





        struct mutex s_vfs_rename_mutex;



        u32 s_time_gran;
};

extern struct timespec current_fs_time(struct super_block *sb);




enum {
        SB_UNFROZEN = 0,
        SB_FREEZE_WRITE = 1,
        SB_FREEZE_TRANS = 2,
};
# 974 "include/linux/fs.h"
extern void lock_super(struct super_block *);
extern void unlock_super(struct super_block *);




extern int vfs_permission(struct nameidata *, int);
extern int vfs_create(struct inode *, struct dentry *, int, struct nameidata *);
extern int vfs_mkdir(struct inode *, struct dentry *, int);
extern int vfs_mknod(struct inode *, struct dentry *, int, dev_t);
extern int vfs_symlink(struct inode *, struct dentry *, const char *, int);
extern int vfs_link(struct dentry *, struct inode *, struct dentry *);
extern int vfs_rmdir(struct inode *, struct dentry *);
extern int vfs_unlink(struct inode *, struct dentry *);
extern int vfs_rename(struct inode *, struct dentry *, struct inode *, struct dentry *);




extern void dentry_unhash(struct dentry *dentry);




extern int file_permission(struct file *, int);
# 1019 "include/linux/fs.h"
int generic_osync_inode(struct inode *, struct address_space *, int);







typedef int (*filldir_t)(void *, const char *, int, loff_t, u64, unsigned);

struct block_device_operations {
        int (*open) (struct inode *, struct file *);
        int (*release) (struct inode *, struct file *);
        int (*ioctl) (struct inode *, struct file *, unsigned, unsigned long);
        long (*unlocked_ioctl) (struct file *, unsigned, unsigned long);
        long (*compat_ioctl) (struct file *, unsigned, unsigned long);
        int (*direct_access) (struct block_device *, sector_t, unsigned long *);
        int (*media_changed) (struct gendisk *);
        int (*revalidate_disk) (struct gendisk *);
        int (*getgeo)(struct block_device *, struct hd_geometry *);
        struct module *owner;
};
# 1051 "include/linux/fs.h"
typedef struct {
        size_t written;
        size_t count;
        union {
                char * buf;
                void *data;
        } arg;
        int error;
} read_descriptor_t;

typedef int (*read_actor_t)(read_descriptor_t *, struct page *, unsigned long, unsigned long);
# 1074 "include/linux/fs.h"
struct file_operations {
        struct module *owner;
        loff_t (*llseek) (struct file *, loff_t, int);
        ssize_t (*read) (struct file *, char *, size_t, loff_t *);
        ssize_t (*write) (struct file *, const char *, size_t, loff_t *);
        ssize_t (*aio_read) (struct kiocb *, const struct iovec *, unsigned long, loff_t);
        ssize_t (*aio_write) (struct kiocb *, const struct iovec *, unsigned long, loff_t);
        int (*readdir) (struct file *, void *, filldir_t);
        unsigned int (*poll) (struct file *, struct poll_table_struct *);
        int (*ioctl) (struct inode *, struct file *, unsigned int, unsigned long);
        long (*unlocked_ioctl) (struct file *, unsigned int, unsigned long);
        long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
        int (*mmap) (struct file *, struct vm_area_struct *);
        int (*open) (struct inode *, struct file *);
        int (*flush) (struct file *, fl_owner_t id);
        int (*release) (struct inode *, struct file *);
        int (*fsync) (struct file *, struct dentry *, int datasync);
        int (*aio_fsync) (struct kiocb *, int datasync);
        int (*fasync) (int, struct file *, int);
        int (*lock) (struct file *, int, struct file_lock *);
        ssize_t (*sendfile) (struct file *, loff_t *, size_t, read_actor_t, void *);
        ssize_t (*sendpage) (struct file *, struct page *, int, size_t, loff_t *, int);
        unsigned long (*get_unmapped_area)(struct file *, unsigned long, unsigned long, unsigned long, unsigned long);
        int (*check_flags)(int);
        int (*dir_notify)(struct file *filp, unsigned long arg);
        int (*flock) (struct file *, int, struct file_lock *);
        ssize_t (*splice_write)(struct pipe_inode_info *, struct file *, loff_t *, size_t, unsigned int);
        ssize_t (*splice_read)(struct file *, loff_t *, struct pipe_inode_info *, size_t, unsigned int);
};

struct inode_operations {
        int (*create) (struct inode *,struct dentry *,int, struct nameidata *);
        struct dentry * (*lookup) (struct inode *,struct dentry *, struct nameidata *);
        int (*link) (struct dentry *,struct inode *,struct dentry *);
        int (*unlink) (struct inode *,struct dentry *);
        int (*symlink) (struct inode *,struct dentry *,const char *);
        int (*mkdir) (struct inode *,struct dentry *,int);
        int (*rmdir) (struct inode *,struct dentry *);
        int (*mknod) (struct inode *,struct dentry *,int,dev_t);
        int (*rename) (struct inode *, struct dentry *,
                        struct inode *, struct dentry *);
        int (*readlink) (struct dentry *, char *,int);
        void * (*follow_link) (struct dentry *, struct nameidata *);
        void (*put_link) (struct dentry *, struct nameidata *, void *);
        void (*truncate) (struct inode *);
        int (*permission) (struct inode *, int, struct nameidata *);
        int (*setattr) (struct dentry *, struct iattr *);
        int (*getattr) (struct vfsmount *mnt, struct dentry *, struct kstat *);
        int (*setxattr) (struct dentry *, const char *,const void *,size_t,int);
        ssize_t (*getxattr) (struct dentry *, const char *, void *, size_t);
        ssize_t (*listxattr) (struct dentry *, char *, size_t);
        int (*removexattr) (struct dentry *, const char *);
        void (*truncate_range)(struct inode *, loff_t, loff_t);
};

struct seq_file;

ssize_t rw_copy_check_uvector(int type, const struct iovec * uvector,
                                unsigned long nr_segs, unsigned long fast_segs,
                                struct iovec *fast_pointer,
                                struct iovec **ret_pointer);

extern ssize_t vfs_read(struct file *, char *, size_t, loff_t *);
extern ssize_t vfs_write(struct file *, const char *, size_t, loff_t *);
extern ssize_t vfs_readv(struct file *, const struct iovec *,
                unsigned long, loff_t *);
extern ssize_t vfs_writev(struct file *, const struct iovec *,
                unsigned long, loff_t *);





struct super_operations {
        struct inode *(*alloc_inode)(struct super_block *sb);
        void (*destroy_inode)(struct inode *);

        void (*read_inode) (struct inode *);

        void (*dirty_inode) (struct inode *);
        int (*write_inode) (struct inode *, int);
        void (*put_inode) (struct inode *);
        void (*drop_inode) (struct inode *);
        void (*delete_inode) (struct inode *);
        void (*put_super) (struct super_block *);
        void (*write_super) (struct super_block *);
        int (*sync_fs)(struct super_block *sb, int wait);
        void (*write_super_lockfs) (struct super_block *);
        void (*unlockfs) (struct super_block *);
        int (*statfs) (struct dentry *, struct kstatfs *);
        int (*remount_fs) (struct super_block *, int *, char *);
        void (*clear_inode) (struct inode *);
        void (*umount_begin) (struct vfsmount *, int);

        int (*show_options)(struct seq_file *, struct vfsmount *);
        int (*show_stats)(struct seq_file *, struct vfsmount *);




};
# 1189 "include/linux/fs.h"
extern void __mark_inode_dirty(struct inode *, int);
static inline __attribute__((always_inline)) void mark_inode_dirty(struct inode *inode)
{
        __mark_inode_dirty(inode, (1 | 2 | 4));
}

static inline __attribute__((always_inline)) void mark_inode_dirty_sync(struct inode *inode)
{
        __mark_inode_dirty(inode, 1);
}

static inline __attribute__((always_inline)) void inc_nlink(struct inode *inode)
{
        inode->i_nlink++;
}

static inline __attribute__((always_inline)) void inode_inc_link_count(struct inode *inode)
{
        inc_nlink(inode);
        mark_inode_dirty(inode);
}

static inline __attribute__((always_inline)) void drop_nlink(struct inode *inode)
{
        inode->i_nlink--;
}

static inline __attribute__((always_inline)) void clear_nlink(struct inode *inode)
{
        inode->i_nlink = 0;
}

static inline __attribute__((always_inline)) void inode_dec_link_count(struct inode *inode)
{
        drop_nlink(inode);
        mark_inode_dirty(inode);
}

extern void touch_atime(struct vfsmount *mnt, struct dentry *dentry);
static inline __attribute__((always_inline)) void file_accessed(struct file *file)
{
        if (!(file->f_flags & 01000000))
                touch_atime(file->f_path.mnt, file->f_path.dentry);
}

int sync_inode(struct inode *inode, struct writeback_control *wbc);
# 1322 "include/linux/fs.h"
struct export_operations {
        struct dentry *(*decode_fh)(struct super_block *sb, __u32 *fh, int fh_len, int fh_type,
                         int (*acceptable)(void *context, struct dentry *de),
                         void *context);
        int (*encode_fh)(struct dentry *de, __u32 *fh, int *max_len,
                         int connectable);


        int (*get_name)(struct dentry *parent, char *name,
                        struct dentry *child);
        struct dentry * (*get_parent)(struct dentry *child);
        struct dentry * (*get_dentry)(struct super_block *sb, void *inump);


        struct dentry * (*find_exported_dentry)(
                struct super_block *sb, void *obj, void *parent,
                int (*acceptable)(void *context, struct dentry *de),
                void *context);


};

extern struct dentry *
find_exported_dentry(struct super_block *sb, void *obj, void *parent,
                     int (*acceptable)(void *context, struct dentry *de),
                     void *context);

struct file_system_type {
        const char *name;
        int fs_flags;
        int (*get_sb) (struct file_system_type *, int,
                       const char *, void *, struct vfsmount *);
        void (*kill_sb) (struct super_block *);
        struct module *owner;
        struct file_system_type * next;
        struct list_head fs_supers;
        struct lock_class_key s_lock_key;
        struct lock_class_key s_umount_key;
};

extern int get_sb_bdev(struct file_system_type *fs_type,
        int flags, const char *dev_name, void *data,
        int (*fill_super)(struct super_block *, void *, int),
        struct vfsmount *mnt);
extern int get_sb_single(struct file_system_type *fs_type,
        int flags, void *data,
        int (*fill_super)(struct super_block *, void *, int),
        struct vfsmount *mnt);
extern int get_sb_nodev(struct file_system_type *fs_type,
        int flags, void *data,
        int (*fill_super)(struct super_block *, void *, int),
        struct vfsmount *mnt);
void generic_shutdown_super(struct super_block *sb);
void kill_block_super(struct super_block *sb);
void kill_anon_super(struct super_block *sb);
void kill_litter_super(struct super_block *sb);
void deactivate_super(struct super_block *sb);
int set_anon_super(struct super_block *s, void *data);
struct super_block *sget(struct file_system_type *type,
                        int (*test)(struct super_block *,void *),
                        int (*set)(struct super_block *,void *),
                        void *data);
extern int get_sb_pseudo(struct file_system_type *, char *,
        struct super_operations *ops, unsigned long,
        struct vfsmount *mnt);
extern int simple_set_mnt(struct vfsmount *mnt, struct super_block *sb);
int __put_super(struct super_block *sb);
int __put_super_and_need_restart(struct super_block *sb);
void unnamed_dev_init(void);







extern int register_filesystem(struct file_system_type *);
extern int unregister_filesystem(struct file_system_type *);
extern struct vfsmount *kern_mount(struct file_system_type *);
extern int may_umount_tree(struct vfsmount *);
extern int may_umount(struct vfsmount *);
extern void umount_tree(struct vfsmount *, int, struct list_head *);
extern void release_mounts(struct list_head *);
extern long do_mount(char *, char *, char *, unsigned long, void *);
extern struct vfsmount *copy_tree(struct vfsmount *, struct dentry *, int);
extern void mnt_set_mountpoint(struct vfsmount *, struct dentry *,
                                  struct vfsmount *);

extern int vfs_statfs(struct dentry *, struct kstatfs *);


extern struct subsystem fs_subsys;




extern int locks_mandatory_locked(struct inode *);
extern int locks_mandatory_area(int, struct inode *, struct file *, loff_t, size_t);
# 1428 "include/linux/fs.h"
static inline __attribute__((always_inline)) int locks_verify_locked(struct inode *inode)
{
        if ((((inode)->i_sb->s_flags & (64)) && ((inode)->i_mode & (0002000 | 00010)) == 0002000))
                return locks_mandatory_locked(inode);
        return 0;
}

extern int rw_verify_area(int, struct file *, loff_t *, size_t);

static inline __attribute__((always_inline)) int locks_verify_truncate(struct inode *inode,
                                    struct file *filp,
                                    loff_t size)
{
        if (inode->i_flock && (((inode)->i_sb->s_flags & (64)) && ((inode)->i_mode & (0002000 | 00010)) == 0002000))
                return locks_mandatory_area(
                        2, inode, filp,
                        size < inode->i_size ? size : inode->i_size,
                        (size < inode->i_size ? inode->i_size - size
                         : size - inode->i_size)
                );
        return 0;
}

static inline __attribute__((always_inline)) int break_lease(struct inode *inode, unsigned int mode)
{
        if (inode->i_flock)
                return __break_lease(inode, mode);
        return 0;
}



extern int do_truncate(struct dentry *, loff_t start, unsigned int time_attrs,
                       struct file *filp);
extern long do_sys_open(int fdf, const char *filename, int flags,
                        int mode);
extern struct file *filp_open(const char *, int, int);
extern struct file * dentry_open(struct dentry *, struct vfsmount *, int);
extern int filp_close(struct file *, fl_owner_t id);
extern char * getname(const char *);


extern void __attribute__ ((__section__ (".init.text"))) vfs_caches_init_early(void);
extern void __attribute__ ((__section__ (".init.text"))) vfs_caches_init(unsigned long);

extern struct kmem_cache *names_cachep;
# 1484 "include/linux/fs.h"
extern int register_blkdev(unsigned int, const char *);
extern int unregister_blkdev(unsigned int, const char *);
extern struct block_device *bdget(dev_t);
extern void bd_set_size(struct block_device *, loff_t size);
extern void bd_forget(struct inode *inode);
extern void bdput(struct block_device *);
extern struct block_device *open_by_devnum(dev_t, unsigned);
extern const struct address_space_operations def_blk_aops;



extern const struct file_operations def_blk_fops;
extern const struct file_operations def_chr_fops;
extern const struct file_operations bad_sock_fops;
extern const struct file_operations def_fifo_fops;

extern int ioctl_by_bdev(struct block_device *, unsigned, unsigned long);
extern int blkdev_ioctl(struct inode *, struct file *, unsigned, unsigned long);
extern int blkdev_driver_ioctl(struct inode *inode, struct file *file,
                               struct gendisk *disk, unsigned cmd,
                               unsigned long arg);
extern long compat_blkdev_ioctl(struct file *, unsigned, unsigned long);
extern int blkdev_get(struct block_device *, mode_t, unsigned);
extern int blkdev_put(struct block_device *);
extern int bd_claim(struct block_device *, void *);
extern void bd_release(struct block_device *);

extern int bd_claim_by_disk(struct block_device *, void *, struct gendisk *);
extern void bd_release_from_disk(struct block_device *, struct gendisk *);
# 1521 "include/linux/fs.h"
extern int alloc_chrdev_region(dev_t *, unsigned, unsigned, const char *);
extern int register_chrdev_region(dev_t, unsigned, const char *);
extern int register_chrdev(unsigned int, const char *,
                           const struct file_operations *);
extern int unregister_chrdev(unsigned int, const char *);
extern void unregister_chrdev_region(dev_t, unsigned);
extern int chrdev_open(struct inode *, struct file *);
extern void chrdev_show(struct seq_file *,off_t);






extern const char *__bdevname(dev_t, char *buffer);
extern const char *bdevname(struct block_device *bdev, char *buffer);
extern struct block_device *lookup_bdev(const char *);
extern struct block_device *open_bdev_excl(const char *, int, void *);
extern void close_bdev_excl(struct block_device *);
extern void blkdev_show(struct seq_file *,off_t);




extern void init_special_inode(struct inode *, umode_t, dev_t);


extern void make_bad_inode(struct inode *);
extern int is_bad_inode(struct inode *);

extern const struct file_operations read_fifo_fops;
extern const struct file_operations write_fifo_fops;
extern const struct file_operations rdwr_fifo_fops;

extern int fs_may_remount_ro(struct super_block *);
# 1568 "include/linux/fs.h"
extern int check_disk_change(struct block_device *);
extern int __invalidate_device(struct block_device *);
extern int invalidate_partition(struct gendisk *, int);

extern int invalidate_inodes(struct super_block *);
unsigned long invalidate_mapping_pages(struct address_space *mapping,
                                        unsigned long start, unsigned long end);
unsigned long invalidate_inode_pages(struct address_space *mapping);
static inline __attribute__((always_inline)) void invalidate_remote_inode(struct inode *inode)
{
        if ((((inode->i_mode) & 00170000) == 0100000) || (((inode->i_mode) & 00170000) == 0040000) ||
            (((inode->i_mode) & 00170000) == 0120000))
                invalidate_inode_pages(inode->i_mapping);
}
extern int invalidate_inode_pages2(struct address_space *mapping);
extern int invalidate_inode_pages2_range(struct address_space *mapping,
                                         unsigned long start, unsigned long end);
extern int write_inode_now(struct inode *, int);
extern int filemap_fdatawrite(struct address_space *);
extern int filemap_flush(struct address_space *);
extern int filemap_fdatawait(struct address_space *);
extern int filemap_write_and_wait(struct address_space *mapping);
extern int filemap_write_and_wait_range(struct address_space *mapping,
                                        loff_t lstart, loff_t lend);
extern int wait_on_page_writeback_range(struct address_space *mapping,
                                unsigned long start, unsigned long end);
extern int __filemap_fdatawrite_range(struct address_space *mapping,
                                loff_t start, loff_t end, int sync_mode);

extern long do_fsync(struct file *file, int datasync);
extern void sync_supers(void);
extern void sync_filesystems(int wait);
extern void __fsync_super(struct super_block *sb);
extern void emergency_sync(void);
extern void emergency_remount(void);
extern int do_remount_sb(struct super_block *sb, int flags,
                         void *data, int force);

extern sector_t bmap(struct inode *, sector_t);

extern int notify_change(struct dentry *, struct iattr *);
extern int permission(struct inode *, int, struct nameidata *);
extern int generic_permission(struct inode *, int,
                int (*check_acl)(struct inode *, int));

extern int get_write_access(struct inode *);
extern int deny_write_access(struct file *);
static inline __attribute__((always_inline)) void put_write_access(struct inode * inode)
{
        atomic_dec(&inode->i_writecount);
}
static inline __attribute__((always_inline)) void allow_write_access(struct file *file)
{
        if (file)
                atomic_inc(&file->f_path.dentry->d_inode->i_writecount);
}
extern int do_pipe(int *);
extern struct file *create_read_pipe(struct file *f);
extern struct file *create_write_pipe(void);
extern void free_write_pipe(struct file *);

extern int open_namei(int dfd, const char *, int, int, struct nameidata *);
extern int may_open(struct nameidata *, int, int);

extern int kernel_read(struct file *, unsigned long, char *, unsigned long);
extern struct file * open_exec(const char *);


extern int is_subdir(struct dentry *, struct dentry *);
extern ino_t find_inode_number(struct dentry *, struct qstr *);

# 1 "include/linux/err.h" 1
# 22 "include/linux/err.h"
static inline __attribute__((always_inline)) void *ERR_PTR(long error)
{
        return (void *) error;
}

static inline __attribute__((always_inline)) long PTR_ERR(const void *ptr)
{
        return (long) ptr;
}

static inline __attribute__((always_inline)) long IS_ERR(const void *ptr)
{
        return __builtin_expect(!!(((unsigned long)ptr) >= (unsigned long)-4095), 0);
}
# 1640 "include/linux/fs.h" 2


extern loff_t default_llseek(struct file *file, loff_t offset, int origin);

extern loff_t vfs_llseek(struct file *file, loff_t offset, int origin);

extern void inode_init_once(struct inode *);
extern void iput(struct inode *);
extern struct inode * igrab(struct inode *);
extern ino_t iunique(struct super_block *, ino_t);
extern int inode_needs_sync(struct inode *inode);
extern void generic_delete_inode(struct inode *inode);
extern void generic_drop_inode(struct inode *inode);

extern struct inode *ilookup5_nowait(struct super_block *sb,
                unsigned long hashval, int (*test)(struct inode *, void *),
                void *data);
extern struct inode *ilookup5(struct super_block *sb, unsigned long hashval,
                int (*test)(struct inode *, void *), void *data);
extern struct inode *ilookup(struct super_block *sb, unsigned long ino);

extern struct inode * iget5_locked(struct super_block *, unsigned long, int (*test)(struct inode *, void *), int (*set)(struct inode *, void *), void *);
extern struct inode * iget_locked(struct super_block *, unsigned long);
extern void unlock_new_inode(struct inode *);

static inline __attribute__((always_inline)) struct inode *iget(struct super_block *sb, unsigned long ino)
{
        struct inode *inode = iget_locked(sb, ino);

        if (inode && (inode->i_state & 64)) {
                sb->s_op->read_inode(inode);
                unlock_new_inode(inode);
        }

        return inode;
}

extern void __iget(struct inode * inode);
extern void clear_inode(struct inode *);
extern void destroy_inode(struct inode *);
extern struct inode *new_inode(struct super_block *);
extern int __remove_suid(struct dentry *, int);
extern int should_remove_suid(struct dentry *);
extern int remove_suid(struct dentry *);
extern void remove_dquot_ref(struct super_block *, int, struct list_head *);

extern void __insert_inode_hash(struct inode *, unsigned long hashval);
extern void remove_inode_hash(struct inode *);
static inline __attribute__((always_inline)) void insert_inode_hash(struct inode *inode) {
        __insert_inode_hash(inode, inode->i_ino);
}

extern struct file * get_empty_filp(void);
extern void file_move(struct file *f, struct list_head *list);
extern void file_kill(struct file *f);

struct bio;
extern void submit_bio(int, struct bio *);
extern int bdev_read_only(struct block_device *);

extern int set_blocksize(struct block_device *, int);
extern int sb_set_blocksize(struct super_block *, int);
extern int sb_min_blocksize(struct super_block *, int);

extern int generic_file_mmap(struct file *, struct vm_area_struct *);
extern int generic_file_readonly_mmap(struct file *, struct vm_area_struct *);
extern int file_read_actor(read_descriptor_t * desc, struct page *page, unsigned long offset, unsigned long size);
extern int file_send_actor(read_descriptor_t * desc, struct page *page, unsigned long offset, unsigned long size);
int generic_write_checks(struct file *file, loff_t *pos, size_t *count, int isblk);
extern ssize_t generic_file_aio_read(struct kiocb *, const struct iovec *, unsigned long, loff_t);
extern ssize_t generic_file_aio_write(struct kiocb *, const struct iovec *, unsigned long, loff_t);
extern ssize_t generic_file_aio_write_nolock(struct kiocb *, const struct iovec *,
                unsigned long, loff_t);
extern ssize_t generic_file_direct_write(struct kiocb *, const struct iovec *,
                unsigned long *, loff_t, loff_t *, size_t, size_t);
extern ssize_t generic_file_buffered_write(struct kiocb *, const struct iovec *,
                unsigned long, loff_t, loff_t *, size_t, ssize_t);
extern ssize_t do_sync_read(struct file *filp, char *buf, size_t len, loff_t *ppos);
extern ssize_t do_sync_write(struct file *filp, const char *buf, size_t len, loff_t *ppos);
extern ssize_t generic_file_sendfile(struct file *, loff_t *, size_t, read_actor_t, void *);
extern void do_generic_mapping_read(struct address_space *mapping,
                                    struct file_ra_state *, struct file *,
                                    loff_t *, read_descriptor_t *, read_actor_t);


extern ssize_t generic_file_splice_read(struct file *, loff_t *,
                struct pipe_inode_info *, size_t, unsigned int);
extern ssize_t generic_file_splice_write(struct pipe_inode_info *,
                struct file *, loff_t *, size_t, unsigned int);
extern ssize_t generic_file_splice_write_nolock(struct pipe_inode_info *,
                struct file *, loff_t *, size_t, unsigned int);
extern ssize_t generic_splice_sendpage(struct pipe_inode_info *pipe,
                struct file *out, loff_t *, size_t len, unsigned int flags);
extern long do_splice_direct(struct file *in, loff_t *ppos, struct file *out,
                size_t len, unsigned int flags);

extern void
file_ra_state_init(struct file_ra_state *ra, struct address_space *mapping);
extern loff_t no_llseek(struct file *file, loff_t offset, int origin);
extern loff_t generic_file_llseek(struct file *file, loff_t offset, int origin);
extern loff_t remote_llseek(struct file *file, loff_t offset, int origin);
extern int generic_file_open(struct inode * inode, struct file * filp);
extern int nonseekable_open(struct inode * inode, struct file * filp);
# 1755 "include/linux/fs.h"
static inline __attribute__((always_inline)) int xip_truncate_page(struct address_space *mapping, loff_t from)
{
        return 0;
}


static inline __attribute__((always_inline)) void do_generic_file_read(struct file * filp, loff_t *ppos,
                                        read_descriptor_t * desc,
                                        read_actor_t actor)
{
        do_generic_mapping_read(filp->f_mapping,
                                &filp->f_ra,
                                filp,
                                ppos,
                                desc,
                                actor);
}


ssize_t __blockdev_direct_IO(int rw, struct kiocb *iocb, struct inode *inode,
        struct block_device *bdev, const struct iovec *iov, loff_t offset,
        unsigned long nr_segs, get_block_t get_block, dio_iodone_t end_io,
        int lock_type);

enum {
        DIO_LOCKING = 1,
        DIO_NO_LOCKING,
        DIO_OWN_LOCKING,
};

static inline __attribute__((always_inline)) ssize_t blockdev_direct_IO(int rw, struct kiocb *iocb,
        struct inode *inode, struct block_device *bdev, const struct iovec *iov,
        loff_t offset, unsigned long nr_segs, get_block_t get_block,
        dio_iodone_t end_io)
{
        return __blockdev_direct_IO(rw, iocb, inode, bdev, iov, offset,
                                nr_segs, get_block, end_io, DIO_LOCKING);
}

static inline __attribute__((always_inline)) ssize_t blockdev_direct_IO_no_locking(int rw, struct kiocb *iocb,
        struct inode *inode, struct block_device *bdev, const struct iovec *iov,
        loff_t offset, unsigned long nr_segs, get_block_t get_block,
        dio_iodone_t end_io)
{
        return __blockdev_direct_IO(rw, iocb, inode, bdev, iov, offset,
                                nr_segs, get_block, end_io, DIO_NO_LOCKING);
}

static inline __attribute__((always_inline)) ssize_t blockdev_direct_IO_own_locking(int rw, struct kiocb *iocb,
        struct inode *inode, struct block_device *bdev, const struct iovec *iov,
        loff_t offset, unsigned long nr_segs, get_block_t get_block,
        dio_iodone_t end_io)
{
        return __blockdev_direct_IO(rw, iocb, inode, bdev, iov, offset,
                                nr_segs, get_block, end_io, DIO_OWN_LOCKING);
}


extern const struct file_operations generic_ro_fops;



extern int vfs_readlink(struct dentry *, char *, int, const char *);
extern int vfs_follow_link(struct nameidata *, const char *);
extern int page_readlink(struct dentry *, char *, int);
extern void *page_follow_link_light(struct dentry *, struct nameidata *);
extern void page_put_link(struct dentry *, struct nameidata *, void *);
extern int __page_symlink(struct inode *inode, const char *symname, int len,
                gfp_t gfp_mask);
extern int page_symlink(struct inode *inode, const char *symname, int len);
extern struct inode_operations page_symlink_inode_operations;
extern int generic_readlink(struct dentry *, char *, int);
extern void generic_fillattr(struct inode *, struct kstat *);
extern int vfs_getattr(struct vfsmount *, struct dentry *, struct kstat *);
void inode_add_bytes(struct inode *inode, loff_t bytes);
void inode_sub_bytes(struct inode *inode, loff_t bytes);
loff_t inode_get_bytes(struct inode *inode);
void inode_set_bytes(struct inode *inode, loff_t bytes);

extern int vfs_readdir(struct file *, filldir_t, void *);

extern int vfs_stat(char *, struct kstat *);
extern int vfs_lstat(char *, struct kstat *);
extern int vfs_stat_fd(int dfd, char *, struct kstat *);
extern int vfs_lstat_fd(int dfd, char *, struct kstat *);
extern int vfs_fstat(unsigned int, struct kstat *);

extern int vfs_ioctl(struct file *, unsigned int, unsigned int, unsigned long);

extern struct file_system_type *get_fs_type(const char *name);
extern struct super_block *get_super(struct block_device *);
extern struct super_block *user_get_super(dev_t);
extern void drop_super(struct super_block *sb);

extern int dcache_dir_open(struct inode *, struct file *);
extern int dcache_dir_close(struct inode *, struct file *);
extern loff_t dcache_dir_lseek(struct file *, loff_t, int);
extern int dcache_readdir(struct file *, void *, filldir_t);
extern int simple_getattr(struct vfsmount *, struct dentry *, struct kstat *);
extern int simple_statfs(struct dentry *, struct kstatfs *);
extern int simple_link(struct dentry *, struct inode *, struct dentry *);
extern int simple_unlink(struct inode *, struct dentry *);
extern int simple_rmdir(struct inode *, struct dentry *);
extern int simple_rename(struct inode *, struct dentry *, struct inode *, struct dentry *);
extern int simple_sync_file(struct file *, struct dentry *, int);
extern int simple_empty(struct dentry *);
extern int simple_readpage(struct file *file, struct page *page);
extern int simple_prepare_write(struct file *file, struct page *page,
                        unsigned offset, unsigned to);
extern int simple_commit_write(struct file *file, struct page *page,
                                unsigned offset, unsigned to);

extern struct dentry *simple_lookup(struct inode *, struct dentry *, struct nameidata *);
extern ssize_t generic_read_dir(struct file *, char *, size_t, loff_t *);
extern const struct file_operations simple_dir_operations;
extern struct inode_operations simple_dir_inode_operations;
struct tree_descr { char *name; const struct file_operations *ops; int mode; };
struct dentry *d_alloc_name(struct dentry *, const char *);
extern int simple_fill_super(struct super_block *, int, struct tree_descr *);
extern int simple_pin_fs(struct file_system_type *, struct vfsmount **mount, int *count);
extern void simple_release_fs(struct vfsmount **mount, int *count);

extern ssize_t simple_read_from_buffer(void *, size_t, loff_t *, const void *, size_t);
# 1886 "include/linux/fs.h"
extern int inode_change_ok(struct inode *, struct iattr *);
extern int inode_setattr(struct inode *, struct iattr *);

extern void file_update_time(struct file *file);

static inline __attribute__((always_inline)) ino_t parent_ino(struct dentry *dentry)
{
        ino_t res;

        _spin_lock(&dentry->d_lock);
        res = dentry->d_parent->d_inode->i_ino;
        __raw_spin_unlock(&(&dentry->d_lock)->raw_lock);
        return res;
}


extern int unshare_files(void);







struct simple_transaction_argresp {
        ssize_t size;
        char data[0];
};



char *simple_transaction_get(struct file *file, const char *buf,
                                size_t size);
ssize_t simple_transaction_read(struct file *file, char *buf,
                                size_t size, loff_t *pos);
int simple_transaction_release(struct inode *inode, struct file *file);

static inline __attribute__((always_inline)) void simple_transaction_set(struct file *file, size_t n)
{
        struct simple_transaction_argresp *ar = file->private_data;

        do { if (__builtin_expect(!!((n > ((1UL << 12) - sizeof(struct simple_transaction_argresp)))!=0), 0)) do { asm volatile("1:\tud2\n" ".pushsection __bug_table,\"a\"\n" "2:\t.long 1b, %c0\n" "\t.word %c1, 0\n" "\t.org 2b+%c2\n" ".popsection" : : "i" ("include/linux/fs.h"), "i" (1927), "i" (sizeof(struct bug_entry))); for(;;) ; } while(0); } while(0);





        asm volatile ("661:\n\t" "lock; addl $0,0(%%esp)" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "mfence" "\n664:\n" ".previous" :: "i" ((0*32+26)) : "memory");
        ar->size = n;
}
# 1967 "include/linux/fs.h"
static inline __attribute__((always_inline)) void __attribute__((format(printf, 1, 2)))
__simple_attr_check_format(const char *fmt, ...)
{

}

int simple_attr_open(struct inode *inode, struct file *file,
                     u64 (*get)(void *), void (*set)(void *, u64),
                     const char *fmt);
int simple_attr_close(struct inode *inode, struct file *file);
ssize_t simple_attr_read(struct file *file, char *buf,
                         size_t len, loff_t *ppos);
ssize_t simple_attr_write(struct file *file, const char *buf,
                          size_t len, loff_t *ppos);
# 1994 "include/linux/fs.h"
static inline __attribute__((always_inline)) char *alloc_secdata(void)
{
        return (char *)1;
}

static inline __attribute__((always_inline)) void free_secdata(void *secdata)
{ }
# 6 "include/linux/proc_fs.h" 2

# 1 "include/linux/magic.h" 1
# 8 "include/linux/proc_fs.h" 2
# 24 "include/linux/proc_fs.h"
enum {
        PROC_ROOT_INO = 1,
};
# 43 "include/linux/proc_fs.h"
typedef int (read_proc_t)(char *page, char **start, off_t off,
                          int count, int *eof, void *data);
typedef int (write_proc_t)(struct file *file, const char *buffer,
                           unsigned long count, void *data);
typedef int (get_info_t)(char *, char **, off_t, int);

struct proc_dir_entry {
        unsigned int low_ino;
        unsigned short namelen;
        const char *name;
        mode_t mode;
        nlink_t nlink;
        uid_t uid;
        gid_t gid;
        loff_t size;
        struct inode_operations * proc_iops;
        const struct file_operations * proc_fops;
        get_info_t *get_info;
        struct module *owner;
        struct proc_dir_entry *next, *parent, *subdir;
        void *data;
        read_proc_t *read_proc;
        write_proc_t *write_proc;
        atomic_t count;
        int deleted;
        void *set;
};

struct kcore_list {
        struct kcore_list *next;
        unsigned long addr;
        size_t size;
};

struct vmcore {
        struct list_head list;
        unsigned long long paddr;
        unsigned long long size;
        loff_t offset;
};



extern struct proc_dir_entry proc_root;
extern struct proc_dir_entry *proc_root_fs;
extern struct proc_dir_entry *proc_net;
extern struct proc_dir_entry *proc_net_stat;
extern struct proc_dir_entry *proc_bus;
extern struct proc_dir_entry *proc_root_driver;
extern struct proc_dir_entry *proc_root_kcore;

extern spinlock_t proc_subdir_lock;

extern void proc_root_init(void);
extern void proc_misc_init(void);

struct mm_struct;

void proc_flush_task(struct task_struct *task);
struct dentry *proc_pid_lookup(struct inode *dir, struct dentry * dentry, struct nameidata *);
int proc_pid_readdir(struct file * filp, void * dirent, filldir_t filldir);
unsigned long task_vsize(struct mm_struct *);
int task_statm(struct mm_struct *, int *, int *, int *, int *);
char *task_mem(struct mm_struct *, char *);

extern struct proc_dir_entry *create_proc_entry(const char *name, mode_t mode,
                                                struct proc_dir_entry *parent);
extern void remove_proc_entry(const char *name, struct proc_dir_entry *parent);

extern struct vfsmount *proc_mnt;
extern int proc_fill_super(struct super_block *,void *,int);
extern struct inode *proc_get_inode(struct super_block *, unsigned int, struct proc_dir_entry *);

extern int proc_match(int, const char *,struct proc_dir_entry *);
# 125 "include/linux/proc_fs.h"
extern int proc_readdir(struct file *, void *, filldir_t);
extern struct dentry *proc_lookup(struct inode *, struct dentry *, struct nameidata *);

extern const struct file_operations proc_kcore_operations;
extern const struct file_operations proc_kmsg_operations;
extern const struct file_operations ppc_htab_operations;




struct tty_driver;
extern void proc_tty_init(void);
extern void proc_tty_register_driver(struct tty_driver *driver);
extern void proc_tty_unregister_driver(struct tty_driver *driver);
# 156 "include/linux/proc_fs.h"
extern struct proc_dir_entry *proc_symlink(const char *,
                struct proc_dir_entry *, const char *);
extern struct proc_dir_entry *proc_mkdir(const char *,struct proc_dir_entry *);
extern struct proc_dir_entry *proc_mkdir_mode(const char *name, mode_t mode,
                        struct proc_dir_entry *parent);

static inline __attribute__((always_inline)) struct proc_dir_entry *create_proc_read_entry(const char *name,
        mode_t mode, struct proc_dir_entry *base,
        read_proc_t *read_proc, void * data)
{
        struct proc_dir_entry *res=create_proc_entry(name,mode,base);
        if (res) {
                res->read_proc=read_proc;
                res->data=data;
        }
        return res;
}

static inline __attribute__((always_inline)) struct proc_dir_entry *create_proc_info_entry(const char *name,
        mode_t mode, struct proc_dir_entry *base, get_info_t *get_info)
{
        struct proc_dir_entry *res=create_proc_entry(name,mode,base);
        if (res) res->get_info=get_info;
        return res;
}

static inline __attribute__((always_inline)) struct proc_dir_entry *proc_net_create(const char *name,
        mode_t mode, get_info_t *get_info)
{
        return create_proc_info_entry(name,mode,proc_net,get_info);
}

static inline __attribute__((always_inline)) struct proc_dir_entry *proc_net_fops_create(const char *name,
        mode_t mode, const struct file_operations *fops)
{
        struct proc_dir_entry *res = create_proc_entry(name, mode, proc_net);
        if (res)
                res->proc_fops = fops;
        return res;
}

static inline __attribute__((always_inline)) void proc_net_remove(const char *name)
{
        remove_proc_entry(name,proc_net);
}
# 244 "include/linux/proc_fs.h"
extern void kclist_add(struct kcore_list *, void *, size_t);


union proc_op {
        int (*proc_get_link)(struct inode *, struct dentry **, struct vfsmount **);
        int (*proc_read)(struct task_struct *task, char *page);
};

struct proc_inode {
        struct pid *pid;
        int fd;
        union proc_op op;
        struct proc_dir_entry *pde;
        struct inode vfs_inode;
};

static inline __attribute__((always_inline)) struct proc_inode *PROC_I(const struct inode *inode)
{
        return ({ const typeof( ((struct proc_inode *)0)->vfs_inode ) *__mptr = (inode); (struct proc_inode *)( (char *)__mptr - ((size_t) &((struct proc_inode *)0)->vfs_inode) );});
}

static inline __attribute__((always_inline)) struct proc_dir_entry *PDE(const struct inode *inode)
{
        return PROC_I(inode)->pde;
}

struct proc_maps_private {
        struct pid *pid;
        struct task_struct *task;

        struct vm_area_struct *tail_vma;

};
# 15 "init/main.c" 2

# 1 "include/linux/syscalls.h" 1
# 14 "include/linux/syscalls.h"
struct epoll_event;
struct iattr;
struct inode;
struct iocb;
struct io_event;
struct iovec;
struct itimerspec;
struct itimerval;
struct kexec_segment;
struct linux_dirent;
struct linux_dirent64;
struct list_head;
struct msgbuf;
struct msghdr;
struct msqid_ds;
struct new_utsname;
struct nfsctl_arg;
struct __old_kernel_stat;
struct pollfd;
struct rlimit;
struct rusage;
struct sched_param;
struct semaphore;
struct sembuf;
struct shmid_ds;
struct sockaddr;
struct stat;
struct stat64;
struct statfs;
struct statfs64;
struct __sysctl_args;
struct sysinfo;
struct timespec;
struct timeval;
struct timex;
struct timezone;
struct tms;
struct utimbuf;
struct mq_attr;
struct compat_stat;
struct compat_timeval;
struct robust_list_head;
struct getcpu_cache;
# 67 "include/linux/syscalls.h"
# 1 "include/linux/key.h" 1
# 27 "include/linux/key.h"
typedef int32_t key_serial_t;


typedef uint32_t key_perm_t;

struct key;
# 381 "include/linux/key.h"
extern struct key root_user_keyring;
extern struct key root_session_keyring;
# 68 "include/linux/syscalls.h" 2

 __attribute__((regparm(0))) long sys_time(time_t *tloc);
 __attribute__((regparm(0))) long sys_stime(time_t *tptr);
 __attribute__((regparm(0))) long sys_gettimeofday(struct timeval *tv,
                                struct timezone *tz);
 __attribute__((regparm(0))) long sys_settimeofday(struct timeval *tv,
                                struct timezone *tz);
 __attribute__((regparm(0))) long sys_adjtimex(struct timex *txc_p);

 __attribute__((regparm(0))) long sys_times(struct tms *tbuf);

 __attribute__((regparm(0))) long sys_gettid(void);
 __attribute__((regparm(0))) long sys_nanosleep(struct timespec *rqtp, struct timespec *rmtp);
 __attribute__((regparm(0))) unsigned long sys_alarm(unsigned int seconds);
 __attribute__((regparm(0))) long sys_getpid(void);
 __attribute__((regparm(0))) long sys_getppid(void);
 __attribute__((regparm(0))) long sys_getuid(void);
 __attribute__((regparm(0))) long sys_geteuid(void);
 __attribute__((regparm(0))) long sys_getgid(void);
 __attribute__((regparm(0))) long sys_getegid(void);
 __attribute__((regparm(0))) long sys_getresuid(uid_t *ruid, uid_t *euid, uid_t *suid);
 __attribute__((regparm(0))) long sys_getresgid(gid_t *rgid, gid_t *egid, gid_t *sgid);
 __attribute__((regparm(0))) long sys_getpgid(pid_t pid);
 __attribute__((regparm(0))) long sys_getpgrp(void);
 __attribute__((regparm(0))) long sys_getsid(pid_t pid);
 __attribute__((regparm(0))) long sys_getgroups(int gidsetsize, gid_t *grouplist);

 __attribute__((regparm(0))) long sys_setregid(gid_t rgid, gid_t egid);
 __attribute__((regparm(0))) long sys_setgid(gid_t gid);
 __attribute__((regparm(0))) long sys_setreuid(uid_t ruid, uid_t euid);
 __attribute__((regparm(0))) long sys_setuid(uid_t uid);
 __attribute__((regparm(0))) long sys_setresuid(uid_t ruid, uid_t euid, uid_t suid);
 __attribute__((regparm(0))) long sys_setresgid(gid_t rgid, gid_t egid, gid_t sgid);
 __attribute__((regparm(0))) long sys_setfsuid(uid_t uid);
 __attribute__((regparm(0))) long sys_setfsgid(gid_t gid);
 __attribute__((regparm(0))) long sys_setpgid(pid_t pid, pid_t pgid);
 __attribute__((regparm(0))) long sys_setsid(void);
 __attribute__((regparm(0))) long sys_setgroups(int gidsetsize, gid_t *grouplist);

 __attribute__((regparm(0))) long sys_acct(const char *name);
 __attribute__((regparm(0))) long sys_capget(cap_user_header_t header,
                                cap_user_data_t dataptr);
 __attribute__((regparm(0))) long sys_capset(cap_user_header_t header,
                                const cap_user_data_t data);
 __attribute__((regparm(0))) long sys_personality(u_long personality);

 __attribute__((regparm(0))) long sys_sigpending(old_sigset_t *set);
 __attribute__((regparm(0))) long sys_sigprocmask(int how, old_sigset_t *set,
                                old_sigset_t *oset);
 __attribute__((regparm(0))) long sys_getitimer(int which, struct itimerval *value);
 __attribute__((regparm(0))) long sys_setitimer(int which,
                                struct itimerval *value,
                                struct itimerval *ovalue);
 __attribute__((regparm(0))) long sys_timer_create(clockid_t which_clock,
                                 struct sigevent *timer_event_spec,
                                 timer_t * created_timer_id);
 __attribute__((regparm(0))) long sys_timer_gettime(timer_t timer_id,
                                struct itimerspec *setting);
 __attribute__((regparm(0))) long sys_timer_getoverrun(timer_t timer_id);
 __attribute__((regparm(0))) long sys_timer_settime(timer_t timer_id, int flags,
                                const struct itimerspec *new_setting,
                                struct itimerspec *old_setting);
 __attribute__((regparm(0))) long sys_timer_delete(timer_t timer_id);
 __attribute__((regparm(0))) long sys_clock_settime(clockid_t which_clock,
                                const struct timespec *tp);
 __attribute__((regparm(0))) long sys_clock_gettime(clockid_t which_clock,
                                struct timespec *tp);
 __attribute__((regparm(0))) long sys_clock_getres(clockid_t which_clock,
                                struct timespec *tp);
 __attribute__((regparm(0))) long sys_clock_nanosleep(clockid_t which_clock, int flags,
                                const struct timespec *rqtp,
                                struct timespec *rmtp);

 __attribute__((regparm(0))) long sys_nice(int increment);
 __attribute__((regparm(0))) long sys_sched_setscheduler(pid_t pid, int policy,
                                        struct sched_param *param);
 __attribute__((regparm(0))) long sys_sched_setparam(pid_t pid,
                                        struct sched_param *param);
 __attribute__((regparm(0))) long sys_sched_getscheduler(pid_t pid);
 __attribute__((regparm(0))) long sys_sched_getparam(pid_t pid,
                                        struct sched_param *param);
 __attribute__((regparm(0))) long sys_sched_setaffinity(pid_t pid, unsigned int len,
                                        unsigned long *user_mask_ptr);
 __attribute__((regparm(0))) long sys_sched_getaffinity(pid_t pid, unsigned int len,
                                        unsigned long *user_mask_ptr);
 __attribute__((regparm(0))) long sys_sched_yield(void);
 __attribute__((regparm(0))) long sys_sched_get_priority_max(int policy);
 __attribute__((regparm(0))) long sys_sched_get_priority_min(int policy);
 __attribute__((regparm(0))) long sys_sched_rr_get_interval(pid_t pid,
                                        struct timespec *interval);
 __attribute__((regparm(0))) long sys_setpriority(int which, int who, int niceval);
 __attribute__((regparm(0))) long sys_getpriority(int which, int who);

 __attribute__((regparm(0))) long sys_shutdown(int, int);
 __attribute__((regparm(0))) long sys_reboot(int magic1, int magic2, unsigned int cmd,
                                void *arg);
 __attribute__((regparm(0))) long sys_restart_syscall(void);
 __attribute__((regparm(0))) long sys_kexec_load(unsigned long entry, unsigned long nr_segments,
                                struct kexec_segment *segments,
                                unsigned long flags);

 __attribute__((regparm(0))) long sys_exit(int error_code);
 __attribute__((regparm(0))) void sys_exit_group(int error_code);
 __attribute__((regparm(0))) long sys_wait4(pid_t pid, int *stat_addr,
                                int options, struct rusage *ru);
 __attribute__((regparm(0))) long sys_waitid(int which, pid_t pid,
                           struct siginfo *infop,
                           int options, struct rusage *ru);
 __attribute__((regparm(0))) long sys_waitpid(pid_t pid, int *stat_addr, int options);
 __attribute__((regparm(0))) long sys_set_tid_address(int *tidptr);
 __attribute__((regparm(0))) long sys_futex(u32 *uaddr, int op, u32 val,
                        struct timespec *utime, u32 *uaddr2,
                        u32 val3);

 __attribute__((regparm(0))) long sys_init_module(void *umod, unsigned long len,
                                const char *uargs);
 __attribute__((regparm(0))) long sys_delete_module(const char *name_user,
                                unsigned int flags);

 __attribute__((regparm(0))) long sys_rt_sigprocmask(int how, sigset_t *set,
                                sigset_t *oset, size_t sigsetsize);
 __attribute__((regparm(0))) long sys_rt_sigpending(sigset_t *set, size_t sigsetsize);
 __attribute__((regparm(0))) long sys_rt_sigtimedwait(const sigset_t *uthese,
                                siginfo_t *uinfo,
                                const struct timespec *uts,
                                size_t sigsetsize);
 __attribute__((regparm(0))) long sys_kill(int pid, int sig);
 __attribute__((regparm(0))) long sys_tgkill(int tgid, int pid, int sig);
 __attribute__((regparm(0))) long sys_tkill(int pid, int sig);
 __attribute__((regparm(0))) long sys_rt_sigqueueinfo(int pid, int sig, siginfo_t *uinfo);
 __attribute__((regparm(0))) long sys_sgetmask(void);
 __attribute__((regparm(0))) long sys_ssetmask(int newmask);
 __attribute__((regparm(0))) unsigned long sys_signal(int sig, __sighandler_t handler);
 __attribute__((regparm(0))) long sys_pause(void);

 __attribute__((regparm(0))) long sys_sync(void);
 __attribute__((regparm(0))) long sys_fsync(unsigned int fd);
 __attribute__((regparm(0))) long sys_fdatasync(unsigned int fd);
 __attribute__((regparm(0))) long sys_bdflush(int func, long data);
 __attribute__((regparm(0))) long sys_mount(char *dev_name, char *dir_name,
                                char *type, unsigned long flags,
                                void *data);
 __attribute__((regparm(0))) long sys_umount(char *name, int flags);
 __attribute__((regparm(0))) long sys_oldumount(char *name);
 __attribute__((regparm(0))) long sys_truncate(const char *path,
                                unsigned long length);
 __attribute__((regparm(0))) long sys_ftruncate(unsigned int fd, unsigned long length);
 __attribute__((regparm(0))) long sys_stat(char *filename,
                        struct __old_kernel_stat *statbuf);
 __attribute__((regparm(0))) long sys_statfs(const char * path,
                                struct statfs *buf);
 __attribute__((regparm(0))) long sys_statfs64(const char *path, size_t sz,
                                struct statfs64 *buf);
 __attribute__((regparm(0))) long sys_fstatfs(unsigned int fd, struct statfs *buf);
 __attribute__((regparm(0))) long sys_fstatfs64(unsigned int fd, size_t sz,
                                struct statfs64 *buf);
 __attribute__((regparm(0))) long sys_lstat(char *filename,
                        struct __old_kernel_stat *statbuf);
 __attribute__((regparm(0))) long sys_fstat(unsigned int fd,
                        struct __old_kernel_stat *statbuf);
 __attribute__((regparm(0))) long sys_newstat(char *filename,
                                struct stat *statbuf);
 __attribute__((regparm(0))) long sys_newlstat(char *filename,
                                struct stat *statbuf);
 __attribute__((regparm(0))) long sys_newfstat(unsigned int fd, struct stat *statbuf);
 __attribute__((regparm(0))) long sys_ustat(unsigned dev, struct ustat *ubuf);

 __attribute__((regparm(0))) long sys_stat64(char *filename,
                                struct stat64 *statbuf);
 __attribute__((regparm(0))) long sys_fstat64(unsigned long fd, struct stat64 *statbuf);
 __attribute__((regparm(0))) long sys_lstat64(char *filename,
                                struct stat64 *statbuf);
 __attribute__((regparm(0))) long sys_truncate64(const char *path, loff_t length);
 __attribute__((regparm(0))) long sys_ftruncate64(unsigned int fd, loff_t length);


 __attribute__((regparm(0))) long sys_setxattr(char *path, char *name,
                                void *value, size_t size, int flags);
 __attribute__((regparm(0))) long sys_lsetxattr(char *path, char *name,
                                void *value, size_t size, int flags);
 __attribute__((regparm(0))) long sys_fsetxattr(int fd, char *name, void *value,
                                size_t size, int flags);
 __attribute__((regparm(0))) ssize_t sys_getxattr(char *path, char *name,
                                void *value, size_t size);
 __attribute__((regparm(0))) ssize_t sys_lgetxattr(char *path, char *name,
                                void *value, size_t size);
 __attribute__((regparm(0))) ssize_t sys_fgetxattr(int fd, char *name,
                                void *value, size_t size);
 __attribute__((regparm(0))) ssize_t sys_listxattr(char *path, char *list,
                                size_t size);
 __attribute__((regparm(0))) ssize_t sys_llistxattr(char *path, char *list,
                                size_t size);
 __attribute__((regparm(0))) ssize_t sys_flistxattr(int fd, char *list, size_t size);
 __attribute__((regparm(0))) long sys_removexattr(char *path, char *name);
 __attribute__((regparm(0))) long sys_lremovexattr(char *path, char *name);
 __attribute__((regparm(0))) long sys_fremovexattr(int fd, char *name);

 __attribute__((regparm(0))) unsigned long sys_brk(unsigned long brk);
 __attribute__((regparm(0))) long sys_mprotect(unsigned long start, size_t len,
                                unsigned long prot);
 __attribute__((regparm(0))) unsigned long sys_mremap(unsigned long addr,
                                unsigned long old_len, unsigned long new_len,
                                unsigned long flags, unsigned long new_addr);
 __attribute__((regparm(0))) long sys_remap_file_pages(unsigned long start, unsigned long size,
                        unsigned long prot, unsigned long pgoff,
                        unsigned long flags);
 __attribute__((regparm(0))) long sys_msync(unsigned long start, size_t len, int flags);
 __attribute__((regparm(0))) long sys_fadvise64(int fd, loff_t offset, size_t len, int advice);
 __attribute__((regparm(0))) long sys_fadvise64_64(int fd, loff_t offset, loff_t len, int advice);
 __attribute__((regparm(0))) long sys_munmap(unsigned long addr, size_t len);
 __attribute__((regparm(0))) long sys_mlock(unsigned long start, size_t len);
 __attribute__((regparm(0))) long sys_munlock(unsigned long start, size_t len);
 __attribute__((regparm(0))) long sys_mlockall(int flags);
 __attribute__((regparm(0))) long sys_munlockall(void);
 __attribute__((regparm(0))) long sys_madvise(unsigned long start, size_t len, int behavior);
 __attribute__((regparm(0))) long sys_mincore(unsigned long start, size_t len,
                                unsigned char * vec);

 __attribute__((regparm(0))) long sys_pivot_root(const char *new_root,
                                const char *put_old);
 __attribute__((regparm(0))) long sys_chroot(const char *filename);
 __attribute__((regparm(0))) long sys_mknod(const char *filename, int mode,
                                unsigned dev);
 __attribute__((regparm(0))) long sys_link(const char *oldname,
                                const char *newname);
 __attribute__((regparm(0))) long sys_symlink(const char *old, const char *new);
 __attribute__((regparm(0))) long sys_unlink(const char *pathname);
 __attribute__((regparm(0))) long sys_rename(const char *oldname,
                                const char *newname);
 __attribute__((regparm(0))) long sys_chmod(const char *filename, mode_t mode);
 __attribute__((regparm(0))) long sys_fchmod(unsigned int fd, mode_t mode);

 __attribute__((regparm(0))) long sys_fcntl(unsigned int fd, unsigned int cmd, unsigned long arg);

 __attribute__((regparm(0))) long sys_fcntl64(unsigned int fd,
                                unsigned int cmd, unsigned long arg);

 __attribute__((regparm(0))) long sys_dup(unsigned int fildes);
 __attribute__((regparm(0))) long sys_dup2(unsigned int oldfd, unsigned int newfd);
 __attribute__((regparm(0))) long sys_ioperm(unsigned long from, unsigned long num, int on);
 __attribute__((regparm(0))) long sys_ioctl(unsigned int fd, unsigned int cmd,
                                unsigned long arg);
 __attribute__((regparm(0))) long sys_flock(unsigned int fd, unsigned int cmd);
 __attribute__((regparm(0))) long sys_io_setup(unsigned nr_reqs, aio_context_t *ctx);
 __attribute__((regparm(0))) long sys_io_destroy(aio_context_t ctx);
 __attribute__((regparm(0))) long sys_io_getevents(aio_context_t ctx_id,
                                long min_nr,
                                long nr,
                                struct io_event *events,
                                struct timespec *timeout);
 __attribute__((regparm(0))) long sys_io_submit(aio_context_t, long,
                                struct iocb * *);
 __attribute__((regparm(0))) long sys_io_cancel(aio_context_t ctx_id, struct iocb *iocb,
                              struct io_event *result);
 __attribute__((regparm(0))) ssize_t sys_sendfile(int out_fd, int in_fd,
                                off_t *offset, size_t count);
 __attribute__((regparm(0))) ssize_t sys_sendfile64(int out_fd, int in_fd,
                                loff_t *offset, size_t count);
 __attribute__((regparm(0))) long sys_readlink(const char *path,
                                char *buf, int bufsiz);
 __attribute__((regparm(0))) long sys_creat(const char *pathname, int mode);
 __attribute__((regparm(0))) long sys_open(const char *filename,
                                int flags, int mode);
 __attribute__((regparm(0))) long sys_close(unsigned int fd);
 __attribute__((regparm(0))) long sys_access(const char *filename, int mode);
 __attribute__((regparm(0))) long sys_vhangup(void);
 __attribute__((regparm(0))) long sys_chown(const char *filename,
                                uid_t user, gid_t group);
 __attribute__((regparm(0))) long sys_lchown(const char *filename,
                                uid_t user, gid_t group);
 __attribute__((regparm(0))) long sys_fchown(unsigned int fd, uid_t user, gid_t group);

 __attribute__((regparm(0))) long sys_chown16(const char *filename,
                                old_uid_t user, old_gid_t group);
 __attribute__((regparm(0))) long sys_lchown16(const char *filename,
                                old_uid_t user, old_gid_t group);
 __attribute__((regparm(0))) long sys_fchown16(unsigned int fd, old_uid_t user, old_gid_t group);
 __attribute__((regparm(0))) long sys_setregid16(old_gid_t rgid, old_gid_t egid);
 __attribute__((regparm(0))) long sys_setgid16(old_gid_t gid);
 __attribute__((regparm(0))) long sys_setreuid16(old_uid_t ruid, old_uid_t euid);
 __attribute__((regparm(0))) long sys_setuid16(old_uid_t uid);
 __attribute__((regparm(0))) long sys_setresuid16(old_uid_t ruid, old_uid_t euid, old_uid_t suid);
 __attribute__((regparm(0))) long sys_getresuid16(old_uid_t *ruid,
                                old_uid_t *euid, old_uid_t *suid);
 __attribute__((regparm(0))) long sys_setresgid16(old_gid_t rgid, old_gid_t egid, old_gid_t sgid);
 __attribute__((regparm(0))) long sys_getresgid16(old_gid_t *rgid,
                                old_gid_t *egid, old_gid_t *sgid);
 __attribute__((regparm(0))) long sys_setfsuid16(old_uid_t uid);
 __attribute__((regparm(0))) long sys_setfsgid16(old_gid_t gid);
 __attribute__((regparm(0))) long sys_getgroups16(int gidsetsize, old_gid_t *grouplist);
 __attribute__((regparm(0))) long sys_setgroups16(int gidsetsize, old_gid_t *grouplist);
 __attribute__((regparm(0))) long sys_getuid16(void);
 __attribute__((regparm(0))) long sys_geteuid16(void);
 __attribute__((regparm(0))) long sys_getgid16(void);
 __attribute__((regparm(0))) long sys_getegid16(void);


 __attribute__((regparm(0))) long sys_utime(char *filename,
                                struct utimbuf *times);
 __attribute__((regparm(0))) long sys_utimes(char *filename,
                                struct timeval *utimes);
 __attribute__((regparm(0))) off_t sys_lseek(unsigned int fd, off_t offset,
                                unsigned int origin);
 __attribute__((regparm(0))) long sys_llseek(unsigned int fd, unsigned long offset_high,
                        unsigned long offset_low, loff_t *result,
                        unsigned int origin);
 __attribute__((regparm(0))) ssize_t sys_read(unsigned int fd, char *buf,
                                size_t count);
 __attribute__((regparm(0))) ssize_t sys_readahead(int fd, loff_t offset, size_t count);
 __attribute__((regparm(0))) ssize_t sys_readv(unsigned long fd,
                                const struct iovec *vec,
                                unsigned long vlen);
 __attribute__((regparm(0))) ssize_t sys_write(unsigned int fd, const char *buf,
                                size_t count);
 __attribute__((regparm(0))) ssize_t sys_writev(unsigned long fd,
                                const struct iovec *vec,
                                unsigned long vlen);
 __attribute__((regparm(0))) ssize_t sys_pread64(unsigned int fd, char *buf,
                                size_t count, loff_t pos);
 __attribute__((regparm(0))) ssize_t sys_pwrite64(unsigned int fd, const char *buf,
                                size_t count, loff_t pos);
 __attribute__((regparm(0))) long sys_getcwd(char *buf, unsigned long size);
 __attribute__((regparm(0))) long sys_mkdir(const char *pathname, int mode);
 __attribute__((regparm(0))) long sys_chdir(const char *filename);
 __attribute__((regparm(0))) long sys_fchdir(unsigned int fd);
 __attribute__((regparm(0))) long sys_rmdir(const char *pathname);
 __attribute__((regparm(0))) long sys_lookup_dcookie(u64 cookie64, char *buf, size_t len);
 __attribute__((regparm(0))) long sys_quotactl(unsigned int cmd, const char *special,
                                qid_t id, void *addr);
 __attribute__((regparm(0))) long sys_getdents(unsigned int fd,
                                struct linux_dirent *dirent,
                                unsigned int count);
 __attribute__((regparm(0))) long sys_getdents64(unsigned int fd,
                                struct linux_dirent64 *dirent,
                                unsigned int count);

 __attribute__((regparm(0))) long sys_setsockopt(int fd, int level, int optname,
                                char *optval, int optlen);
 __attribute__((regparm(0))) long sys_getsockopt(int fd, int level, int optname,
                                char *optval, int *optlen);
 __attribute__((regparm(0))) long sys_bind(int, struct sockaddr *, int);
 __attribute__((regparm(0))) long sys_connect(int, struct sockaddr *, int);
 __attribute__((regparm(0))) long sys_accept(int, struct sockaddr *, int *);
 __attribute__((regparm(0))) long sys_getsockname(int, struct sockaddr *, int *);
 __attribute__((regparm(0))) long sys_getpeername(int, struct sockaddr *, int *);
 __attribute__((regparm(0))) long sys_send(int, void *, size_t, unsigned);
 __attribute__((regparm(0))) long sys_sendto(int, void *, size_t, unsigned,
                                struct sockaddr *, int);
 __attribute__((regparm(0))) long sys_sendmsg(int fd, struct msghdr *msg, unsigned flags);
 __attribute__((regparm(0))) long sys_recv(int, void *, size_t, unsigned);
 __attribute__((regparm(0))) long sys_recvfrom(int, void *, size_t, unsigned,
                                struct sockaddr *, int *);
 __attribute__((regparm(0))) long sys_recvmsg(int fd, struct msghdr *msg, unsigned flags);
 __attribute__((regparm(0))) long sys_socket(int, int, int);
 __attribute__((regparm(0))) long sys_socketpair(int, int, int, int *);
 __attribute__((regparm(0))) long sys_socketcall(int call, unsigned long *args);
 __attribute__((regparm(0))) long sys_listen(int, int);
 __attribute__((regparm(0))) long sys_poll(struct pollfd *ufds, unsigned int nfds,
                                long timeout);
 __attribute__((regparm(0))) long sys_select(int n, fd_set *inp, fd_set *outp,
                        fd_set *exp, struct timeval *tvp);
 __attribute__((regparm(0))) long sys_epoll_create(int size);
 __attribute__((regparm(0))) long sys_epoll_ctl(int epfd, int op, int fd,
                                struct epoll_event *event);
 __attribute__((regparm(0))) long sys_epoll_wait(int epfd, struct epoll_event *events,
                                int maxevents, int timeout);
 __attribute__((regparm(0))) long sys_epoll_pwait(int epfd, struct epoll_event *events,
                                int maxevents, int timeout,
                                const sigset_t *sigmask,
                                size_t sigsetsize);
 __attribute__((regparm(0))) long sys_gethostname(char *name, int len);
 __attribute__((regparm(0))) long sys_sethostname(char *name, int len);
 __attribute__((regparm(0))) long sys_setdomainname(char *name, int len);
 __attribute__((regparm(0))) long sys_newuname(struct new_utsname *name);

 __attribute__((regparm(0))) long sys_getrlimit(unsigned int resource,
                                struct rlimit *rlim);

 __attribute__((regparm(0))) long sys_old_getrlimit(unsigned int resource, struct rlimit *rlim);

 __attribute__((regparm(0))) long sys_setrlimit(unsigned int resource,
                                struct rlimit *rlim);
 __attribute__((regparm(0))) long sys_getrusage(int who, struct rusage *ru);
 __attribute__((regparm(0))) long sys_umask(int mask);

 __attribute__((regparm(0))) long sys_msgget(key_t key, int msgflg);
 __attribute__((regparm(0))) long sys_msgsnd(int msqid, struct msgbuf *msgp,
                                size_t msgsz, int msgflg);
 __attribute__((regparm(0))) long sys_msgrcv(int msqid, struct msgbuf *msgp,
                                size_t msgsz, long msgtyp, int msgflg);
 __attribute__((regparm(0))) long sys_msgctl(int msqid, int cmd, struct msqid_ds *buf);

 __attribute__((regparm(0))) long sys_semget(key_t key, int nsems, int semflg);
 __attribute__((regparm(0))) long sys_semop(int semid, struct sembuf *sops,
                                unsigned nsops);
 __attribute__((regparm(0))) long sys_semctl(int semid, int semnum, int cmd, union semun arg);
 __attribute__((regparm(0))) long sys_semtimedop(int semid, struct sembuf *sops,
                                unsigned nsops,
                                const struct timespec *timeout);
 __attribute__((regparm(0))) long sys_shmat(int shmid, char *shmaddr, int shmflg);
 __attribute__((regparm(0))) long sys_shmget(key_t key, size_t size, int flag);
 __attribute__((regparm(0))) long sys_shmdt(char *shmaddr);
 __attribute__((regparm(0))) long sys_shmctl(int shmid, int cmd, struct shmid_ds *buf);

 __attribute__((regparm(0))) long sys_mq_open(const char *name, int oflag, mode_t mode, struct mq_attr *attr);
 __attribute__((regparm(0))) long sys_mq_unlink(const char *name);
 __attribute__((regparm(0))) long sys_mq_timedsend(mqd_t mqdes, const char *msg_ptr, size_t msg_len, unsigned int msg_prio, const struct timespec *abs_timeout);
 __attribute__((regparm(0))) ssize_t sys_mq_timedreceive(mqd_t mqdes, char *msg_ptr, size_t msg_len, unsigned int *msg_prio, const struct timespec *abs_timeout);
 __attribute__((regparm(0))) long sys_mq_notify(mqd_t mqdes, const struct sigevent *notification);
 __attribute__((regparm(0))) long sys_mq_getsetattr(mqd_t mqdes, const struct mq_attr *mqstat, struct mq_attr *omqstat);

 __attribute__((regparm(0))) long sys_pciconfig_iobase(long which, unsigned long bus, unsigned long devfn);
 __attribute__((regparm(0))) long sys_pciconfig_read(unsigned long bus, unsigned long dfn,
                                unsigned long off, unsigned long len,
                                void *buf);
 __attribute__((regparm(0))) long sys_pciconfig_write(unsigned long bus, unsigned long dfn,
                                unsigned long off, unsigned long len,
                                void *buf);

 __attribute__((regparm(0))) long sys_prctl(int option, unsigned long arg2, unsigned long arg3,
                        unsigned long arg4, unsigned long arg5);
 __attribute__((regparm(0))) long sys_swapon(const char *specialfile, int swap_flags);
 __attribute__((regparm(0))) long sys_swapoff(const char *specialfile);
 __attribute__((regparm(0))) long sys_sysctl(struct __sysctl_args *args);
 __attribute__((regparm(0))) long sys_sysinfo(struct sysinfo *info);
 __attribute__((regparm(0))) long sys_sysfs(int option,
                                unsigned long arg1, unsigned long arg2);
 __attribute__((regparm(0))) long sys_nfsservctl(int cmd,
                                struct nfsctl_arg *arg,
                                void *res);
 __attribute__((regparm(0))) long sys_syslog(int type, char *buf, int len);
 __attribute__((regparm(0))) long sys_uselib(const char *library);
 __attribute__((regparm(0))) long sys_ni_syscall(void);
 __attribute__((regparm(0))) long sys_ptrace(long request, long pid, long addr, long data);

 __attribute__((regparm(0))) long sys_add_key(const char *_type,
                            const char *_description,
                            const void *_payload,
                            size_t plen,
                            key_serial_t destringid);

 __attribute__((regparm(0))) long sys_request_key(const char *_type,
                                const char *_description,
                                const char *_callout_info,
                                key_serial_t destringid);

 __attribute__((regparm(0))) long sys_keyctl(int cmd, unsigned long arg2, unsigned long arg3,
                           unsigned long arg4, unsigned long arg5);

 __attribute__((regparm(0))) long sys_ioprio_set(int which, int who, int ioprio);
 __attribute__((regparm(0))) long sys_ioprio_get(int which, int who);
 __attribute__((regparm(0))) long sys_set_mempolicy(int mode, unsigned long *nmask,
                                unsigned long maxnode);
 __attribute__((regparm(0))) long sys_migrate_pages(pid_t pid, unsigned long maxnode,
                                const unsigned long *from,
                                const unsigned long *to);
 __attribute__((regparm(0))) long sys_move_pages(pid_t pid, unsigned long nr_pages,
                                const void * *pages,
                                const int *nodes,
                                int *status,
                                int flags);
 __attribute__((regparm(0))) long compat_sys_move_pages(pid_t pid, unsigned long nr_page,
                                __u32 *pages,
                                const int *nodes,
                                int *status,
                                int flags);
 __attribute__((regparm(0))) long sys_mbind(unsigned long start, unsigned long len,
                                unsigned long mode,
                                unsigned long *nmask,
                                unsigned long maxnode,
                                unsigned flags);
 __attribute__((regparm(0))) long sys_get_mempolicy(int *policy,
                                unsigned long *nmask,
                                unsigned long maxnode,
                                unsigned long addr, unsigned long flags);

 __attribute__((regparm(0))) long sys_inotify_init(void);
 __attribute__((regparm(0))) long sys_inotify_add_watch(int fd, const char *path,
                                        u32 mask);
 __attribute__((regparm(0))) long sys_inotify_rm_watch(int fd, u32 wd);

 __attribute__((regparm(0))) long sys_spu_run(int fd, __u32 *unpc,
                                 __u32 *ustatus);
 __attribute__((regparm(0))) long sys_spu_create(const char *name,
                unsigned int flags, mode_t mode);

 __attribute__((regparm(0))) long sys_mknodat(int dfd, const char * filename, int mode,
                            unsigned dev);
 __attribute__((regparm(0))) long sys_mkdirat(int dfd, const char * pathname, int mode);
 __attribute__((regparm(0))) long sys_unlinkat(int dfd, const char * pathname, int flag);
 __attribute__((regparm(0))) long sys_symlinkat(const char * oldname,
                              int newdfd, const char * newname);
 __attribute__((regparm(0))) long sys_linkat(int olddfd, const char *oldname,
                           int newdfd, const char *newname, int flags);
 __attribute__((regparm(0))) long sys_renameat(int olddfd, const char * oldname,
                             int newdfd, const char * newname);
 __attribute__((regparm(0))) long sys_futimesat(int dfd, char *filename,
                              struct timeval *utimes);
 __attribute__((regparm(0))) long sys_faccessat(int dfd, const char *filename, int mode);
 __attribute__((regparm(0))) long sys_fchmodat(int dfd, const char * filename,
                             mode_t mode);
 __attribute__((regparm(0))) long sys_fchownat(int dfd, const char *filename, uid_t user,
                             gid_t group, int flag);
 __attribute__((regparm(0))) long sys_openat(int dfd, const char *filename, int flags,
                           int mode);
 __attribute__((regparm(0))) long sys_newfstatat(int dfd, char *filename,
                               struct stat *statbuf, int flag);
 __attribute__((regparm(0))) long sys_fstatat64(int dfd, char *filename,
                               struct stat64 *statbuf, int flag);
 __attribute__((regparm(0))) long sys_readlinkat(int dfd, const char *path, char *buf,
                               int bufsiz);
 __attribute__((regparm(0))) long compat_sys_futimesat(unsigned int dfd, char *filename,
                                     struct compat_timeval *t);
 __attribute__((regparm(0))) long compat_sys_newfstatat(unsigned int dfd, char * filename,
                                      struct compat_stat *statbuf,
                                      int flag);
 __attribute__((regparm(0))) long compat_sys_openat(unsigned int dfd, const char *filename,
                                   int flags, int mode);
 __attribute__((regparm(0))) long sys_unshare(unsigned long unshare_flags);

 __attribute__((regparm(0))) long sys_splice(int fd_in, loff_t *off_in,
                           int fd_out, loff_t *off_out,
                           size_t len, unsigned int flags);

 __attribute__((regparm(0))) long sys_vmsplice(int fd, const struct iovec *iov,
                             unsigned long nr_segs, unsigned int flags);

 __attribute__((regparm(0))) long sys_tee(int fdin, int fdout, size_t len, unsigned int flags);

 __attribute__((regparm(0))) long sys_sync_file_range(int fd, loff_t offset, loff_t nbytes,
                                        unsigned int flags);
 __attribute__((regparm(0))) long sys_get_robust_list(int pid,
                                    struct robust_list_head * *head_ptr,
                                    size_t *len_ptr);
 __attribute__((regparm(0))) long sys_set_robust_list(struct robust_list_head *head,
                                    size_t len);
 __attribute__((regparm(0))) long sys_getcpu(unsigned *cpu, unsigned *node, struct getcpu_cache *cache);

int kernel_execve(const char *filename, char *const argv[], char *const envp[]);
# 17 "init/main.c" 2

# 1 "include/linux/ctype.h" 1
# 18 "include/linux/ctype.h"
extern unsigned char _ctype[];
# 37 "include/linux/ctype.h"
static inline __attribute__((always_inline)) unsigned char __tolower(unsigned char c)
{
        if ((((_ctype[(int)(unsigned char)(c)])&(0x01)) != 0))
                c -= 'A'-'a';
        return c;
}

static inline __attribute__((always_inline)) unsigned char __toupper(unsigned char c)
{
        if ((((_ctype[(int)(unsigned char)(c)])&(0x02)) != 0))
                c -= 'a'-'A';
        return c;
}
# 19 "init/main.c" 2
# 1 "include/linux/delay.h" 1
# 10 "include/linux/delay.h"
extern unsigned long loops_per_jiffy;

# 1 "include/asm/delay.h" 1
# 11 "include/asm/delay.h"
extern void __bad_udelay(void);
extern void __bad_ndelay(void);

extern void __udelay(unsigned long usecs);
extern void __ndelay(unsigned long nsecs);
extern void __const_udelay(unsigned long usecs);
extern void __delay(unsigned long loops);
# 37 "include/asm/delay.h"
void use_tsc_delay(void);
# 13 "include/linux/delay.h" 2
# 38 "include/linux/delay.h"
void calibrate_delay(void);
void msleep(unsigned int msecs);
unsigned long msleep_interruptible(unsigned int msecs);

static inline __attribute__((always_inline)) void ssleep(unsigned int seconds)
{
        msleep(seconds * 1000);
}
# 20 "init/main.c" 2

# 1 "include/linux/ioport.h" 1
# 17 "include/linux/ioport.h"
struct resource {
        resource_size_t start;
        resource_size_t end;
        const char *name;
        unsigned long flags;
        struct resource *parent, *sibling, *child;
};

struct resource_list {
        struct resource_list *next;
        struct resource *res;
        struct pci_dev *dev;
};
# 98 "include/linux/ioport.h"
extern struct resource ioport_resource;
extern struct resource iomem_resource;

extern int request_resource(struct resource *root, struct resource *new);
extern struct resource * ____request_resource(struct resource *root, struct resource *new);
extern int release_resource(struct resource *new);
extern int insert_resource(struct resource *parent, struct resource *new);
extern int allocate_resource(struct resource *root, struct resource *new,
                             resource_size_t size, resource_size_t min,
                             resource_size_t max, resource_size_t align,
                             void (*alignf)(void *, struct resource *,
                                            resource_size_t, resource_size_t),
                             void *alignf_data);
int adjust_resource(struct resource *res, resource_size_t start,
                    resource_size_t size);


extern int find_next_system_ram(struct resource *res);






extern struct resource * __request_region(struct resource *,
                                        resource_size_t start,
                                        resource_size_t n, const char *name);






extern int __check_region(struct resource *, resource_size_t, resource_size_t);
extern void __release_region(struct resource *, resource_size_t,
                                resource_size_t);

static inline __attribute__((always_inline)) int __attribute__((deprecated)) check_region(resource_size_t s,
                                                resource_size_t n)
{
        return __check_region(&ioport_resource, s, n);
}
# 22 "init/main.c" 2

# 1 "include/linux/smp_lock.h" 1
# 10 "include/linux/smp_lock.h"
extern int __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) __reacquire_kernel_lock(void);
extern void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) __release_kernel_lock(void);
# 33 "include/linux/smp_lock.h"
static inline __attribute__((always_inline)) int reacquire_kernel_lock(struct task_struct *task)
{
        if (__builtin_expect(!!(task->lock_depth >= 0), 0))
                __reacquire_kernel_lock();
        return 0;
}

extern void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) lock_kernel(void) ;
extern void __attribute__((regparm(3))) __attribute__((section(".spinlock.text"))) unlock_kernel(void) ;
# 24 "init/main.c" 2
# 1 "include/linux/initrd.h" 1




extern int rd_doload;


extern int rd_prompt;


extern int rd_image_start;


extern int initrd_below_start_ok;


extern unsigned long initrd_start, initrd_end;
extern void free_initrd_mem(unsigned long, unsigned long);

extern unsigned int real_root_dev;
# 25 "init/main.c" 2
# 1 "include/linux/hdreg.h" 1




# 1 "include/linux/ata.h" 1
# 38 "include/linux/ata.h"
enum {

        ATA_MAX_DEVICES = 2,
        ATA_MAX_PRD = 256,
        ATA_SECT_SIZE = 512,
        ATA_MAX_SECTORS = 256,
        ATA_MAX_SECTORS_LBA48 = 65535,

        ATA_ID_WORDS = 256,
        ATA_ID_SERNO_OFS = 10,
        ATA_ID_FW_REV_OFS = 23,
        ATA_ID_PROD_OFS = 27,
        ATA_ID_OLD_PIO_MODES = 51,
        ATA_ID_FIELD_VALID = 53,
        ATA_ID_MWDMA_MODES = 63,
        ATA_ID_PIO_MODES = 64,
        ATA_ID_EIDE_DMA_MIN = 65,
        ATA_ID_EIDE_PIO = 67,
        ATA_ID_EIDE_PIO_IORDY = 68,
        ATA_ID_UDMA_MODES = 88,
        ATA_ID_MAJOR_VER = 80,
        ATA_ID_PIO4 = (1 << 1),

        ATA_PCI_CTL_OFS = 2,
        ATA_SERNO_LEN = 20,
        ATA_UDMA0 = (1 << 0),
        ATA_UDMA1 = ATA_UDMA0 | (1 << 1),
        ATA_UDMA2 = ATA_UDMA1 | (1 << 2),
        ATA_UDMA3 = ATA_UDMA2 | (1 << 3),
        ATA_UDMA4 = ATA_UDMA3 | (1 << 4),
        ATA_UDMA5 = ATA_UDMA4 | (1 << 5),
        ATA_UDMA6 = ATA_UDMA5 | (1 << 6),
        ATA_UDMA7 = ATA_UDMA6 | (1 << 7),


        ATA_UDMA_MASK_40C = ATA_UDMA2,


        ATA_PRD_SZ = 8,
        ATA_PRD_TBL_SZ = (ATA_MAX_PRD * ATA_PRD_SZ),
        ATA_PRD_EOT = (1 << 31),

        ATA_DMA_TABLE_OFS = 4,
        ATA_DMA_STATUS = 2,
        ATA_DMA_CMD = 0,
        ATA_DMA_WR = (1 << 3),
        ATA_DMA_START = (1 << 0),
        ATA_DMA_INTR = (1 << 2),
        ATA_DMA_ERR = (1 << 1),
        ATA_DMA_ACTIVE = (1 << 0),


        ATA_HOB = (1 << 7),
        ATA_NIEN = (1 << 1),
        ATA_LBA = (1 << 6),
        ATA_DEV1 = (1 << 4),
        ATA_DEVICE_OBS = (1 << 7) | (1 << 5),
        ATA_DEVCTL_OBS = (1 << 3),
        ATA_BUSY = (1 << 7),
        ATA_DRDY = (1 << 6),
        ATA_DF = (1 << 5),
        ATA_DRQ = (1 << 3),
        ATA_ERR = (1 << 0),
        ATA_SRST = (1 << 2),
        ATA_ICRC = (1 << 7),
        ATA_UNC = (1 << 6),
        ATA_IDNF = (1 << 4),
        ATA_ABORTED = (1 << 2),


        ATA_REG_DATA = 0x00,
        ATA_REG_ERR = 0x01,
        ATA_REG_NSECT = 0x02,
        ATA_REG_LBAL = 0x03,
        ATA_REG_LBAM = 0x04,
        ATA_REG_LBAH = 0x05,
        ATA_REG_DEVICE = 0x06,
        ATA_REG_STATUS = 0x07,

        ATA_REG_FEATURE = ATA_REG_ERR,
        ATA_REG_CMD = ATA_REG_STATUS,
        ATA_REG_BYTEL = ATA_REG_LBAM,
        ATA_REG_BYTEH = ATA_REG_LBAH,
        ATA_REG_DEVSEL = ATA_REG_DEVICE,
        ATA_REG_IRQ = ATA_REG_NSECT,


        ATA_CMD_CHK_POWER = 0xE5,
        ATA_CMD_STANDBY = 0xE2,
        ATA_CMD_IDLE = 0xE3,
        ATA_CMD_EDD = 0x90,
        ATA_CMD_FLUSH = 0xE7,
        ATA_CMD_FLUSH_EXT = 0xEA,
        ATA_CMD_ID_ATA = 0xEC,
        ATA_CMD_ID_ATAPI = 0xA1,
        ATA_CMD_READ = 0xC8,
        ATA_CMD_READ_EXT = 0x25,
        ATA_CMD_WRITE = 0xCA,
        ATA_CMD_WRITE_EXT = 0x35,
        ATA_CMD_WRITE_FUA_EXT = 0x3D,
        ATA_CMD_FPDMA_READ = 0x60,
        ATA_CMD_FPDMA_WRITE = 0x61,
        ATA_CMD_PIO_READ = 0x20,
        ATA_CMD_PIO_READ_EXT = 0x24,
        ATA_CMD_PIO_WRITE = 0x30,
        ATA_CMD_PIO_WRITE_EXT = 0x34,
        ATA_CMD_READ_MULTI = 0xC4,
        ATA_CMD_READ_MULTI_EXT = 0x29,
        ATA_CMD_WRITE_MULTI = 0xC5,
        ATA_CMD_WRITE_MULTI_EXT = 0x39,
        ATA_CMD_WRITE_MULTI_FUA_EXT = 0xCE,
        ATA_CMD_SET_FEATURES = 0xEF,
        ATA_CMD_PACKET = 0xA0,
        ATA_CMD_VERIFY = 0x40,
        ATA_CMD_VERIFY_EXT = 0x42,
        ATA_CMD_STANDBYNOW1 = 0xE0,
        ATA_CMD_IDLEIMMEDIATE = 0xE1,
        ATA_CMD_INIT_DEV_PARAMS = 0x91,
        ATA_CMD_READ_NATIVE_MAX = 0xF8,
        ATA_CMD_READ_NATIVE_MAX_EXT = 0x27,
        ATA_CMD_READ_LOG_EXT = 0x2f,


        ATA_LOG_SATA_NCQ = 0x10,


        SETFEATURES_XFER = 0x03,
        XFER_UDMA_7 = 0x47,
        XFER_UDMA_6 = 0x46,
        XFER_UDMA_5 = 0x45,
        XFER_UDMA_4 = 0x44,
        XFER_UDMA_3 = 0x43,
        XFER_UDMA_2 = 0x42,
        XFER_UDMA_1 = 0x41,
        XFER_UDMA_0 = 0x40,
        XFER_MW_DMA_4 = 0x24,
        XFER_MW_DMA_3 = 0x23,
        XFER_MW_DMA_2 = 0x22,
        XFER_MW_DMA_1 = 0x21,
        XFER_MW_DMA_0 = 0x20,
        XFER_SW_DMA_2 = 0x12,
        XFER_SW_DMA_1 = 0x11,
        XFER_SW_DMA_0 = 0x10,
        XFER_PIO_6 = 0x0E,
        XFER_PIO_5 = 0x0D,
        XFER_PIO_4 = 0x0C,
        XFER_PIO_3 = 0x0B,
        XFER_PIO_2 = 0x0A,
        XFER_PIO_1 = 0x09,
        XFER_PIO_0 = 0x08,
        XFER_PIO_SLOW = 0x00,

        SETFEATURES_WC_ON = 0x02,
        SETFEATURES_WC_OFF = 0x82,


        ATAPI_PKT_DMA = (1 << 0),
        ATAPI_DMADIR = (1 << 2),

        ATAPI_CDB_LEN = 16,


        ATA_CBL_NONE = 0,
        ATA_CBL_PATA40 = 1,
        ATA_CBL_PATA80 = 2,
        ATA_CBL_PATA40_SHORT = 3,
        ATA_CBL_PATA_UNK = 4,
        ATA_CBL_SATA = 5,


        SCR_STATUS = 0,
        SCR_ERROR = 1,
        SCR_CONTROL = 2,
        SCR_ACTIVE = 3,
        SCR_NOTIFICATION = 4,


        SERR_DATA_RECOVERED = (1 << 0),
        SERR_COMM_RECOVERED = (1 << 1),
        SERR_DATA = (1 << 8),
        SERR_PERSISTENT = (1 << 9),
        SERR_PROTOCOL = (1 << 10),
        SERR_INTERNAL = (1 << 11),
        SERR_PHYRDY_CHG = (1 << 16),
        SERR_DEV_XCHG = (1 << 26),


        ATA_TFLAG_LBA48 = (1 << 0),
        ATA_TFLAG_ISADDR = (1 << 1),
        ATA_TFLAG_DEVICE = (1 << 2),
        ATA_TFLAG_WRITE = (1 << 3),
        ATA_TFLAG_LBA = (1 << 4),
        ATA_TFLAG_FUA = (1 << 5),
        ATA_TFLAG_POLLING = (1 << 6),
};

enum ata_tf_protocols {

        ATA_PROT_UNKNOWN,
        ATA_PROT_NODATA,
        ATA_PROT_PIO,
        ATA_PROT_DMA,
        ATA_PROT_NCQ,
        ATA_PROT_ATAPI,
        ATA_PROT_ATAPI_NODATA,
        ATA_PROT_ATAPI_DMA,
};

enum ata_ioctls {
        ATA_IOC_GET_IO32 = 0x309,
        ATA_IOC_SET_IO32 = 0x324,
};



struct ata_prd {
        u32 addr;
        u32 flags_len;
};

struct ata_taskfile {
        unsigned long flags;
        u8 protocol;

        u8 ctl;

        u8 hob_feature;
        u8 hob_nsect;
        u8 hob_lbal;
        u8 hob_lbam;
        u8 hob_lbah;

        u8 feature;
        u8 nsect;
        u8 lbal;
        u8 lbam;
        u8 lbah;

        u8 device;

        u8 command;
};
# 309 "include/linux/ata.h"
static inline __attribute__((always_inline)) unsigned int ata_id_major_version(const u16 *id)
{
        unsigned int mver;

        if (id[ATA_ID_MAJOR_VER] == 0xFFFF)
                return 0;

        for (mver = 14; mver >= 1; mver--)
                if (id[ATA_ID_MAJOR_VER] & (1 << mver))
                        break;
        return mver;
}

static inline __attribute__((always_inline)) int ata_id_current_chs_valid(const u16 *id)
{



        return (id[53] & 0x01) &&
                id[54] &&
                id[55] &&
                id[55] <= 16 &&
                id[56];
}

static inline __attribute__((always_inline)) int ata_id_is_cfa(const u16 *id)
{
        u16 v = id[0];
        if (v == 0x848A)
                return 1;

        if (ata_id_major_version(id) >= 3 && id[82] != 0xFFFF &&
                        (id[82] & ( 1 << 2)))
                return 1;
        return 0;
}

static inline __attribute__((always_inline)) int ata_drive_40wire(const u16 *dev_id)
{
        if (ata_id_major_version(dev_id) >= 5 && ((dev_id)[93] == 0))
                return 0;
        if (dev_id[93] & 0x4000)
                return 0;
        return 1;
}

static inline __attribute__((always_inline)) int atapi_cdb_len(const u16 *dev_id)
{
        u16 tmp = dev_id[0] & 0x3;
        switch (tmp) {
        case 0: return 12;
        case 1: return 16;
        default: return -1;
        }
}

static inline __attribute__((always_inline)) int is_atapi_taskfile(const struct ata_taskfile *tf)
{
        return (tf->protocol == ATA_PROT_ATAPI) ||
               (tf->protocol == ATA_PROT_ATAPI_NODATA) ||
               (tf->protocol == ATA_PROT_ATAPI_DMA);
}

static inline __attribute__((always_inline)) int is_multi_taskfile(struct ata_taskfile *tf)
{
        return (tf->command == ATA_CMD_READ_MULTI) ||
               (tf->command == ATA_CMD_WRITE_MULTI) ||
               (tf->command == ATA_CMD_READ_MULTI_EXT) ||
               (tf->command == ATA_CMD_WRITE_MULTI_EXT) ||
               (tf->command == ATA_CMD_WRITE_MULTI_FUA_EXT);
}

static inline __attribute__((always_inline)) int ata_ok(u8 status)
{
        return ((status & (ATA_BUSY | ATA_DRDY | ATA_DF | ATA_DRQ | ATA_ERR))
                        == ATA_DRDY);
}

static inline __attribute__((always_inline)) int lba_28_ok(u64 block, u32 n_block)
{

        return ((block + n_block - 1) < ((u64)1 << 28)) && (n_block <= 256);
}

static inline __attribute__((always_inline)) int lba_48_ok(u64 block, u32 n_block)
{

        return ((block + n_block - 1) < ((u64)1 << 48)) && (n_block <= 65536);
}
# 6 "include/linux/hdreg.h" 2
# 92 "include/linux/hdreg.h"
typedef unsigned char task_ioreg_t;
typedef unsigned long sata_ioreg_t;

typedef union ide_reg_valid_s {
        unsigned all : 16;
        struct {
                unsigned data : 1;
                unsigned error_feature : 1;
                unsigned sector : 1;
                unsigned nsector : 1;
                unsigned lcyl : 1;
                unsigned hcyl : 1;
                unsigned select : 1;
                unsigned status_command : 1;

                unsigned data_hob : 1;
                unsigned error_feature_hob : 1;
                unsigned sector_hob : 1;
                unsigned nsector_hob : 1;
                unsigned lcyl_hob : 1;
                unsigned hcyl_hob : 1;
                unsigned select_hob : 1;
                unsigned control_hob : 1;
        } b;
} ide_reg_valid_t;

typedef struct ide_task_request_s {
        task_ioreg_t io_ports[8];
        task_ioreg_t hob_ports[8];
        ide_reg_valid_t out_flags;
        ide_reg_valid_t in_flags;
        int data_phase;
        int req_cmd;
        unsigned long out_size;
        unsigned long in_size;
} ide_task_request_t;

typedef struct ide_ioctl_request_s {
        ide_task_request_t *task_request;
        unsigned char *out_buffer;
        unsigned char *in_buffer;
} ide_ioctl_request_t;

struct hd_drive_cmd_hdr {
        task_ioreg_t command;
        task_ioreg_t sector_number;
        task_ioreg_t feature;
        task_ioreg_t sector_count;
};

typedef struct hd_drive_task_hdr {
        task_ioreg_t data;
        task_ioreg_t feature;
        task_ioreg_t sector_count;
        task_ioreg_t sector_number;
        task_ioreg_t low_cylinder;
        task_ioreg_t high_cylinder;
        task_ioreg_t device_head;
        task_ioreg_t command;
} task_struct_t;

typedef struct hd_drive_hob_hdr {
        task_ioreg_t data;
        task_ioreg_t feature;
        task_ioreg_t sector_count;
        task_ioreg_t sector_number;
        task_ioreg_t low_cylinder;
        task_ioreg_t high_cylinder;
        task_ioreg_t device_head;
        task_ioreg_t control;
} hob_struct_t;
# 377 "include/linux/hdreg.h"
struct hd_geometry {
      unsigned char heads;
      unsigned char sectors;
      unsigned short cylinders;
      unsigned long start;
};
# 429 "include/linux/hdreg.h"
enum {
        BUSSTATE_OFF = 0,
        BUSSTATE_ON,
        BUSSTATE_TRISTATE
};
# 449 "include/linux/hdreg.h"
struct hd_driveid {
        unsigned short config;
        unsigned short cyls;
        unsigned short reserved2;
        unsigned short heads;
        unsigned short track_bytes;
        unsigned short sector_bytes;
        unsigned short sectors;
        unsigned short vendor0;
        unsigned short vendor1;
        unsigned short vendor2;
        unsigned char serial_no[20];
        unsigned short buf_type;
        unsigned short buf_size;


        unsigned short ecc_bytes;
        unsigned char fw_rev[8];
        unsigned char model[40];
        unsigned char max_multsect;
        unsigned char vendor3;
        unsigned short dword_io;
        unsigned char vendor4;
        unsigned char capability;





        unsigned short reserved50;
        unsigned char vendor5;
        unsigned char tPIO;
        unsigned char vendor6;
        unsigned char tDMA;
        unsigned short field_valid;




        unsigned short cur_cyls;
        unsigned short cur_heads;
        unsigned short cur_sectors;
        unsigned short cur_capacity0;
        unsigned short cur_capacity1;
        unsigned char multsect;
        unsigned char multsect_valid;
        unsigned int lba_capacity;
        unsigned short dma_1word;
        unsigned short dma_mword;
        unsigned short eide_pio_modes;
        unsigned short eide_dma_min;
        unsigned short eide_dma_time;
        unsigned short eide_pio;
        unsigned short eide_pio_iordy;
        unsigned short words69_70[2];



        unsigned short words71_74[4];


        unsigned short queue_depth;



        unsigned short words76_79[4];
        unsigned short major_rev_num;
        unsigned short minor_rev_num;
        unsigned short command_set_1;
# 535 "include/linux/hdreg.h"
        unsigned short command_set_2;
# 553 "include/linux/hdreg.h"
        unsigned short cfsse;
# 565 "include/linux/hdreg.h"
        unsigned short cfs_enable_1;
# 584 "include/linux/hdreg.h"
        unsigned short cfs_enable_2;
# 603 "include/linux/hdreg.h"
        unsigned short csf_default;
# 615 "include/linux/hdreg.h"
        unsigned short dma_ultra;
        unsigned short trseuc;
        unsigned short trsEuc;
        unsigned short CurAPMvalues;
        unsigned short mprc;
        unsigned short hw_config;
# 638 "include/linux/hdreg.h"
        unsigned short acoustic;



        unsigned short msrqs;
        unsigned short sxfert;
        unsigned short sal;
        unsigned int spg;
        unsigned long long lba_capacity_2;
        unsigned short words104_125[22];
        unsigned short last_lun;
        unsigned short word127;







        unsigned short dlf;
# 669 "include/linux/hdreg.h"
        unsigned short csfo;







        unsigned short words130_155[26];
        unsigned short word156;
        unsigned short words157_159[3];
        unsigned short cfa_power;






        unsigned short words161_175[15];
        unsigned short words176_205[30];
        unsigned short words206_254[49];
        unsigned short integrity_word;



};
# 26 "init/main.c" 2
# 1 "include/linux/bootmem.h" 1







# 1 "include/asm/dma.h" 1
# 12 "include/asm/dma.h"
# 1 "include/asm/io.h" 1
# 47 "include/asm/io.h"
# 1 "include/asm-generic/iomap.h" 1
# 28 "include/asm-generic/iomap.h"
extern unsigned int __attribute__((regparm(3))) ioread8(void *);
extern unsigned int __attribute__((regparm(3))) ioread16(void *);
extern unsigned int __attribute__((regparm(3))) ioread16be(void *);
extern unsigned int __attribute__((regparm(3))) ioread32(void *);
extern unsigned int __attribute__((regparm(3))) ioread32be(void *);

extern void __attribute__((regparm(3))) iowrite8(u8, void *);
extern void __attribute__((regparm(3))) iowrite16(u16, void *);
extern void __attribute__((regparm(3))) iowrite16be(u16, void *);
extern void __attribute__((regparm(3))) iowrite32(u32, void *);
extern void __attribute__((regparm(3))) iowrite32be(u32, void *);
# 51 "include/asm-generic/iomap.h"
extern void __attribute__((regparm(3))) ioread8_rep(void *port, void *buf, unsigned long count);
extern void __attribute__((regparm(3))) ioread16_rep(void *port, void *buf, unsigned long count);
extern void __attribute__((regparm(3))) ioread32_rep(void *port, void *buf, unsigned long count);

extern void __attribute__((regparm(3))) iowrite8_rep(void *port, const void *buf, unsigned long count);
extern void __attribute__((regparm(3))) iowrite16_rep(void *port, const void *buf, unsigned long count);
extern void __attribute__((regparm(3))) iowrite32_rep(void *port, const void *buf, unsigned long count);


extern void *ioport_map(unsigned long port, unsigned int nr);
extern void ioport_unmap(void *);


struct pci_dev;
extern void *pci_iomap(struct pci_dev *dev, int bar, unsigned long max);
extern void pci_iounmap(struct pci_dev *dev, void *);
# 48 "include/asm/io.h" 2

# 1 "include/linux/vmalloc.h" 1






struct vm_area_struct;
# 25 "include/linux/vmalloc.h"
struct vm_struct {

        struct vm_struct *next;
        void *addr;
        unsigned long size;
        unsigned long flags;
        struct page **pages;
        unsigned int nr_pages;
        unsigned long phys_addr;
};




extern void *vmalloc(unsigned long size);
extern void *vmalloc_user(unsigned long size);
extern void *vmalloc_node(unsigned long size, int node);
extern void *vmalloc_exec(unsigned long size);
extern void *vmalloc_32(unsigned long size);
extern void *vmalloc_32_user(unsigned long size);
extern void *__vmalloc(unsigned long size, gfp_t gfp_mask, pgprot_t prot);
extern void *__vmalloc_area(struct vm_struct *area, gfp_t gfp_mask,
                                pgprot_t prot);
extern void vfree(void *addr);

extern void *vmap(struct page **pages, unsigned int count,
                        unsigned long flags, pgprot_t prot);
extern void vunmap(void *addr);

extern int remap_vmalloc_range(struct vm_area_struct *vma, void *addr,
                                                        unsigned long pgoff);




extern struct vm_struct *get_vm_area(unsigned long size, unsigned long flags);
extern struct vm_struct *__get_vm_area(unsigned long size, unsigned long flags,
                                        unsigned long start, unsigned long end);
extern struct vm_struct *get_vm_area_node(unsigned long size,
                                          unsigned long flags, int node,
                                          gfp_t gfp_mask);
extern struct vm_struct *remove_vm_area(void *addr);
extern int map_vm_area(struct vm_struct *area, pgprot_t prot,
                        struct page ***pages);
extern void unmap_vm_area(struct vm_struct *area);




extern rwlock_t vmlist_lock;
extern struct vm_struct *vmlist;
# 50 "include/asm/io.h" 2
# 75 "include/asm/io.h"
static inline __attribute__((always_inline)) unsigned long virt_to_phys(volatile void * address)
{
        return ((unsigned long)(address)-((unsigned long)((unsigned long)0xC0000000)));
}
# 93 "include/asm/io.h"
static inline __attribute__((always_inline)) void * phys_to_virt(unsigned long address)
{
        return ((void *)((unsigned long)(address)+((unsigned long)((unsigned long)0xC0000000))));
}






extern void * __ioremap(unsigned long offset, unsigned long size, unsigned long flags);
# 117 "include/asm/io.h"
static inline __attribute__((always_inline)) void * ioremap(unsigned long offset, unsigned long size)
{
        return __ioremap(offset, size, 0);
}

extern void * ioremap_nocache(unsigned long offset, unsigned long size);
extern void iounmap(volatile void *addr);






extern void *bt_ioremap(unsigned long offset, unsigned long size);
extern void bt_iounmap(void *addr, unsigned long size);
# 161 "include/asm/io.h"
static inline __attribute__((always_inline)) unsigned char readb(const volatile void *addr)
{
        return *(volatile unsigned char *) addr;
}
static inline __attribute__((always_inline)) unsigned short readw(const volatile void *addr)
{
        return *(volatile unsigned short *) addr;
}
static inline __attribute__((always_inline)) unsigned int readl(const volatile void *addr)
{
        return *(volatile unsigned int *) addr;
}







static inline __attribute__((always_inline)) void writeb(unsigned char b, volatile void *addr)
{
        *(volatile unsigned char *) addr = b;
}
static inline __attribute__((always_inline)) void writew(unsigned short b, volatile void *addr)
{
        *(volatile unsigned short *) addr = b;
}
static inline __attribute__((always_inline)) void writel(unsigned int b, volatile void *addr)
{
        *(volatile unsigned int *) addr = b;
}






static inline __attribute__((always_inline)) void memset_io(volatile void *addr, unsigned char val, int count)
{
        (__builtin_constant_p(val) ? (__builtin_constant_p((count)) ? __constant_c_and_count_memset((((void *) addr)),((0x01010101UL*(unsigned char)(val))),((count))) : __constant_c_memset((((void *) addr)),((0x01010101UL*(unsigned char)(val))),((count)))) : (__builtin_constant_p((count)) ? __memset_generic(((((void *) addr))),(((val))),(((count)))) : __memset_generic((((void *) addr)),((val)),((count)))));
}
static inline __attribute__((always_inline)) void memcpy_fromio(void *dst, const volatile void *src, int count)
{
        __memcpy(dst, (void *) src, count);
}
static inline __attribute__((always_inline)) void memcpy_toio(volatile void *dst, const void *src, int count)
{
        __memcpy((void *) dst, src, count);
}
# 265 "include/asm/io.h"
static inline __attribute__((always_inline)) void slow_down_io(void) {
        __asm__ __volatile__(
                "outb %%al,$0x80;"



                : : );
}
# 344 "include/asm/io.h"
static inline __attribute__((always_inline)) void outb_local(unsigned char value, int port) { __asm__ __volatile__("out" "b" " %" "b" "0, %w1" : : "a"(value), "Nd"(port)); } static inline __attribute__((always_inline)) unsigned char inb_local(int port) { unsigned char value; __asm__ __volatile__("in" "b" " %w1, %" "b" "0" : "=a"(value) : "Nd"(port)); return value; } static inline __attribute__((always_inline)) void outb_local_p(unsigned char value, int port) { outb_local(value, port); slow_down_io(); } static inline __attribute__((always_inline)) unsigned char inb_local_p(int port) { unsigned char value = inb_local(port); slow_down_io(); return value; } static inline __attribute__((always_inline)) void outb(unsigned char value, int port) { outb_local(value, port); } static inline __attribute__((always_inline)) unsigned char inb(int port) { return inb_local(port); } static inline __attribute__((always_inline)) void outb_p(unsigned char value, int port) { outb(value, port); slow_down_io(); } static inline __attribute__((always_inline)) unsigned char inb_p(int port) { unsigned char value = inb(port); slow_down_io(); return value; } static inline __attribute__((always_inline)) void outsb(int port, const void *addr, unsigned long count) { __asm__ __volatile__("rep; outs" "b" : "+S"(addr), "+c"(count) : "d"(port)); } static inline __attribute__((always_inline)) void insb(int port, void *addr, unsigned long count) { __asm__ __volatile__("rep; ins" "b" : "+D"(addr), "+c"(count) : "d"(port)); }
static inline __attribute__((always_inline)) void outw_local(unsigned short value, int port) { __asm__ __volatile__("out" "w" " %" "w" "0, %w1" : : "a"(value), "Nd"(port)); } static inline __attribute__((always_inline)) unsigned short inw_local(int port) { unsigned short value; __asm__ __volatile__("in" "w" " %w1, %" "w" "0" : "=a"(value) : "Nd"(port)); return value; } static inline __attribute__((always_inline)) void outw_local_p(unsigned short value, int port) { outw_local(value, port); slow_down_io(); } static inline __attribute__((always_inline)) unsigned short inw_local_p(int port) { unsigned short value = inw_local(port); slow_down_io(); return value; } static inline __attribute__((always_inline)) void outw(unsigned short value, int port) { outw_local(value, port); } static inline __attribute__((always_inline)) unsigned short inw(int port) { return inw_local(port); } static inline __attribute__((always_inline)) void outw_p(unsigned short value, int port) { outw(value, port); slow_down_io(); } static inline __attribute__((always_inline)) unsigned short inw_p(int port) { unsigned short value = inw(port); slow_down_io(); return value; } static inline __attribute__((always_inline)) void outsw(int port, const void *addr, unsigned long count) { __asm__ __volatile__("rep; outs" "w" : "+S"(addr), "+c"(count) : "d"(port)); } static inline __attribute__((always_inline)) void insw(int port, void *addr, unsigned long count) { __asm__ __volatile__("rep; ins" "w" : "+D"(addr), "+c"(count) : "d"(port)); }
static inline __attribute__((always_inline)) void outl_local(unsigned int value, int port) { __asm__ __volatile__("out" "l" " %" "" "0, %w1" : : "a"(value), "Nd"(port)); } static inline __attribute__((always_inline)) unsigned int inl_local(int port) { unsigned int value; __asm__ __volatile__("in" "l" " %w1, %" "" "0" : "=a"(value) : "Nd"(port)); return value; } static inline __attribute__((always_inline)) void outl_local_p(unsigned int value, int port) { outl_local(value, port); slow_down_io(); } static inline __attribute__((always_inline)) unsigned int inl_local_p(int port) { unsigned int value = inl_local(port); slow_down_io(); return value; } static inline __attribute__((always_inline)) void outl(unsigned int value, int port) { outl_local(value, port); } static inline __attribute__((always_inline)) unsigned int inl(int port) { return inl_local(port); } static inline __attribute__((always_inline)) void outl_p(unsigned int value, int port) { outl(value, port); slow_down_io(); } static inline __attribute__((always_inline)) unsigned int inl_p(int port) { unsigned int value = inl(port); slow_down_io(); return value; } static inline __attribute__((always_inline)) void outsl(int port, const void *addr, unsigned long count) { __asm__ __volatile__("rep; outs" "l" : "+S"(addr), "+c"(count) : "d"(port)); } static inline __attribute__((always_inline)) void insl(int port, void *addr, unsigned long count) { __asm__ __volatile__("rep; ins" "l" : "+D"(addr), "+c"(count) : "d"(port)); }
# 13 "include/asm/dma.h" 2
# 137 "include/asm/dma.h"
extern spinlock_t dma_spin_lock;

static __inline__ __attribute__((always_inline)) unsigned long claim_dma_lock(void)
{
        unsigned long flags;
        flags = _spin_lock_irqsave(&dma_spin_lock);
        return flags;
}

static __inline__ __attribute__((always_inline)) void release_dma_lock(unsigned long flags)
{
        _spin_unlock_irqrestore(&dma_spin_lock, flags);
}


static __inline__ __attribute__((always_inline)) void enable_dma(unsigned int dmanr)
{
        if (dmanr<=3)
                outb(dmanr, 0x0A);
        else
                outb(dmanr & 3, 0xD4);
}

static __inline__ __attribute__((always_inline)) void disable_dma(unsigned int dmanr)
{
        if (dmanr<=3)
                outb(dmanr | 4, 0x0A);
        else
                outb((dmanr & 3) | 4, 0xD4);
}
# 175 "include/asm/dma.h"
static __inline__ __attribute__((always_inline)) void clear_dma_ff(unsigned int dmanr)
{
        if (dmanr<=3)
                outb(0, 0x0C);
        else
                outb(0, 0xD8);
}


static __inline__ __attribute__((always_inline)) void set_dma_mode(unsigned int dmanr, char mode)
{
        if (dmanr<=3)
                outb(mode | dmanr, 0x0B);
        else
                outb(mode | (dmanr&3), 0xD6);
}






static __inline__ __attribute__((always_inline)) void set_dma_page(unsigned int dmanr, char pagenr)
{
        switch(dmanr) {
                case 0:
                        outb(pagenr, 0x87);
                        break;
                case 1:
                        outb(pagenr, 0x83);
                        break;
                case 2:
                        outb(pagenr, 0x81);
                        break;
                case 3:
                        outb(pagenr, 0x82);
                        break;
                case 5:
                        outb(pagenr & 0xfe, 0x8B);
                        break;
                case 6:
                        outb(pagenr & 0xfe, 0x89);
                        break;
                case 7:
                        outb(pagenr & 0xfe, 0x8A);
                        break;
        }
}





static __inline__ __attribute__((always_inline)) void set_dma_addr(unsigned int dmanr, unsigned int a)
{
        set_dma_page(dmanr, a>>16);
        if (dmanr <= 3) {
            outb( a & 0xff, ((dmanr&3)<<1) + 0x00 );
            outb( (a>>8) & 0xff, ((dmanr&3)<<1) + 0x00 );
        } else {
            outb( (a>>1) & 0xff, ((dmanr&3)<<2) + 0xC0 );
            outb( (a>>9) & 0xff, ((dmanr&3)<<2) + 0xC0 );
        }
}
# 249 "include/asm/dma.h"
static __inline__ __attribute__((always_inline)) void set_dma_count(unsigned int dmanr, unsigned int count)
{
        count--;
        if (dmanr <= 3) {
            outb( count & 0xff, ((dmanr&3)<<1) + 1 + 0x00 );
            outb( (count>>8) & 0xff, ((dmanr&3)<<1) + 1 + 0x00 );
        } else {
            outb( (count>>1) & 0xff, ((dmanr&3)<<2) + 2 + 0xC0 );
            outb( (count>>9) & 0xff, ((dmanr&3)<<2) + 2 + 0xC0 );
        }
}
# 270 "include/asm/dma.h"
static __inline__ __attribute__((always_inline)) int get_dma_residue(unsigned int dmanr)
{
        unsigned int io_port = (dmanr<=3)? ((dmanr&3)<<1) + 1 + 0x00
                                         : ((dmanr&3)<<2) + 2 + 0xC0;


        unsigned short count;

        count = 1 + inb(io_port);
        count += inb(io_port) << 8;

        return (dmanr<=3)? count : (count<<1);
}



extern int request_dma(unsigned int dmanr, const char * device_id);
extern void free_dma(unsigned int dmanr);




extern int isa_dma_bridge_buggy;
# 9 "include/linux/bootmem.h" 2





extern unsigned long max_low_pfn;
extern unsigned long min_low_pfn;




extern unsigned long max_pfn;
# 30 "include/linux/bootmem.h"
typedef struct bootmem_data {
        unsigned long node_boot_start;
        unsigned long node_low_pfn;
        void *node_bootmem_map;
        unsigned long last_offset;
        unsigned long last_pos;
        unsigned long last_success;

        struct list_head list;
} bootmem_data_t;

extern unsigned long bootmem_bootmap_pages(unsigned long);
extern unsigned long init_bootmem(unsigned long addr, unsigned long memend);
extern void free_bootmem(unsigned long addr, unsigned long size);
extern void *__alloc_bootmem(unsigned long size,
                             unsigned long align,
                             unsigned long goal);
extern void *__alloc_bootmem_nopanic(unsigned long size,
                                     unsigned long align,
                                     unsigned long goal);
extern void *__alloc_bootmem_low(unsigned long size,
                                 unsigned long align,
                                 unsigned long goal);
extern void *__alloc_bootmem_low_node(pg_data_t *pgdat,
                                      unsigned long size,
                                      unsigned long align,
                                      unsigned long goal);
extern void *__alloc_bootmem_core(struct bootmem_data *bdata,
                                  unsigned long size,
                                  unsigned long align,
                                  unsigned long goal,
                                  unsigned long limit);


extern void reserve_bootmem(unsigned long addr, unsigned long size);
# 75 "include/linux/bootmem.h"
extern unsigned long free_all_bootmem(void);
extern unsigned long free_all_bootmem_node(pg_data_t *pgdat);
extern void *__alloc_bootmem_node(pg_data_t *pgdat,
                                  unsigned long size,
                                  unsigned long align,
                                  unsigned long goal);
extern unsigned long init_bootmem_node(pg_data_t *pgdat,
                                       unsigned long freepfn,
                                       unsigned long startpfn,
                                       unsigned long endpfn);
extern void reserve_bootmem_node(pg_data_t *pgdat,
                                 unsigned long physaddr,
                                 unsigned long size);
extern void free_bootmem_node(pg_data_t *pgdat,
                              unsigned long addr,
                              unsigned long size);
# 104 "include/linux/bootmem.h"
static inline __attribute__((always_inline)) void *alloc_remap(int nid, unsigned long size)
{
        return ((void *)0);
}


extern unsigned long __attribute__ ((__section__ (".init.data"))) nr_kernel_pages;
extern unsigned long nr_all_pages;

extern void *alloc_large_system_hash(const char *tablename,
                                     unsigned long bucketsize,
                                     unsigned long numentries,
                                     int scale,
                                     int flags,
                                     unsigned int *_hash_shift,
                                     unsigned int *_hash_mask,
                                     unsigned long limit);
# 132 "include/linux/bootmem.h"
extern int hashdist;
# 27 "init/main.c" 2
# 1 "include/linux/tty.h" 1
# 10 "include/linux/tty.h"
# 1 "include/linux/major.h" 1
# 11 "include/linux/tty.h" 2
# 1 "include/linux/termios.h" 1




# 1 "include/asm/termios.h" 1



# 1 "include/asm/termbits.h" 1





typedef unsigned char cc_t;
typedef unsigned int speed_t;
typedef unsigned int tcflag_t;


struct termios {
        tcflag_t c_iflag;
        tcflag_t c_oflag;
        tcflag_t c_cflag;
        tcflag_t c_lflag;
        cc_t c_line;
        cc_t c_cc[19];
};

struct ktermios {
        tcflag_t c_iflag;
        tcflag_t c_oflag;
        tcflag_t c_cflag;
        tcflag_t c_lflag;
        cc_t c_line;
        cc_t c_cc[19];
        speed_t c_ispeed;
        speed_t c_ospeed;
};
# 5 "include/asm/termios.h" 2
# 1 "include/asm/ioctls.h" 1



# 1 "include/asm/ioctl.h" 1
# 5 "include/asm/ioctls.h" 2
# 6 "include/asm/termios.h" 2

struct winsize {
        unsigned short ws_row;
        unsigned short ws_col;
        unsigned short ws_xpixel;
        unsigned short ws_ypixel;
};


struct termio {
        unsigned short c_iflag;
        unsigned short c_oflag;
        unsigned short c_cflag;
        unsigned short c_lflag;
        unsigned char c_line;
        unsigned char c_cc[8];
};
# 6 "include/linux/termios.h" 2
# 12 "include/linux/tty.h" 2

# 1 "include/linux/tty_driver.h" 1
# 120 "include/linux/tty_driver.h"
# 1 "include/linux/cdev.h" 1
# 9 "include/linux/cdev.h"
struct file_operations;
struct inode;
struct module;

struct cdev {
        struct kobject kobj;
        struct module *owner;
        const struct file_operations *ops;
        struct list_head list;
        dev_t dev;
        unsigned int count;
};

void cdev_init(struct cdev *, const struct file_operations *);

struct cdev *cdev_alloc(void);

void cdev_put(struct cdev *p);

int cdev_add(struct cdev *, dev_t, unsigned);

void cdev_del(struct cdev *);

void cd_forget(struct inode *);

extern struct backing_dev_info directly_mappable_cdev_bdi;
# 121 "include/linux/tty_driver.h" 2

struct tty_struct;

struct tty_operations {
        int (*open)(struct tty_struct * tty, struct file * filp);
        void (*close)(struct tty_struct * tty, struct file * filp);
        int (*write)(struct tty_struct * tty,
                      const unsigned char *buf, int count);
        void (*put_char)(struct tty_struct *tty, unsigned char ch);
        void (*flush_chars)(struct tty_struct *tty);
        int (*write_room)(struct tty_struct *tty);
        int (*chars_in_buffer)(struct tty_struct *tty);
        int (*ioctl)(struct tty_struct *tty, struct file * file,
                    unsigned int cmd, unsigned long arg);
        void (*set_termios)(struct tty_struct *tty, struct ktermios * old);
        void (*throttle)(struct tty_struct * tty);
        void (*unthrottle)(struct tty_struct * tty);
        void (*stop)(struct tty_struct *tty);
        void (*start)(struct tty_struct *tty);
        void (*hangup)(struct tty_struct *tty);
        void (*break_ctl)(struct tty_struct *tty, int state);
        void (*flush_buffer)(struct tty_struct *tty);
        void (*set_ldisc)(struct tty_struct *tty);
        void (*wait_until_sent)(struct tty_struct *tty, int timeout);
        void (*send_xchar)(struct tty_struct *tty, char ch);
        int (*read_proc)(char *page, char **start, off_t off,
                          int count, int *eof, void *data);
        int (*write_proc)(struct file *file, const char *buffer,
                          unsigned long count, void *data);
        int (*tiocmget)(struct tty_struct *tty, struct file *file);
        int (*tiocmset)(struct tty_struct *tty, struct file *file,
                        unsigned int set, unsigned int clear);
};

struct tty_driver {
        int magic;
        struct cdev cdev;
        struct module *owner;
        const char *driver_name;
        const char *name;
        int name_base;
        int major;
        int minor_start;
        int minor_num;
        int num;
        short type;
        short subtype;
        struct ktermios init_termios;
        int flags;
        int refcount;
        struct proc_dir_entry *proc_entry;
        struct tty_driver *other;




        struct tty_struct **ttys;
        struct ktermios **termios;
        struct ktermios **termios_locked;
        void *driver_state;





        int (*open)(struct tty_struct * tty, struct file * filp);
        void (*close)(struct tty_struct * tty, struct file * filp);
        int (*write)(struct tty_struct * tty,
                      const unsigned char *buf, int count);
        void (*put_char)(struct tty_struct *tty, unsigned char ch);
        void (*flush_chars)(struct tty_struct *tty);
        int (*write_room)(struct tty_struct *tty);
        int (*chars_in_buffer)(struct tty_struct *tty);
        int (*ioctl)(struct tty_struct *tty, struct file * file,
                    unsigned int cmd, unsigned long arg);
        void (*set_termios)(struct tty_struct *tty, struct ktermios * old);
        void (*throttle)(struct tty_struct * tty);
        void (*unthrottle)(struct tty_struct * tty);
        void (*stop)(struct tty_struct *tty);
        void (*start)(struct tty_struct *tty);
        void (*hangup)(struct tty_struct *tty);
        void (*break_ctl)(struct tty_struct *tty, int state);
        void (*flush_buffer)(struct tty_struct *tty);
        void (*set_ldisc)(struct tty_struct *tty);
        void (*wait_until_sent)(struct tty_struct *tty, int timeout);
        void (*send_xchar)(struct tty_struct *tty, char ch);
        int (*read_proc)(char *page, char **start, off_t off,
                          int count, int *eof, void *data);
        int (*write_proc)(struct file *file, const char *buffer,
                          unsigned long count, void *data);
        int (*tiocmget)(struct tty_struct *tty, struct file *file);
        int (*tiocmset)(struct tty_struct *tty, struct file *file,
                        unsigned int set, unsigned int clear);

        struct list_head tty_drivers;
};

extern struct list_head tty_drivers;

struct tty_driver *alloc_tty_driver(int lines);
void put_tty_driver(struct tty_driver *driver);
void tty_set_operations(struct tty_driver *driver,
                        const struct tty_operations *op);
# 14 "include/linux/tty.h" 2
# 1 "include/linux/tty_ldisc.h" 1
# 102 "include/linux/tty_ldisc.h"
struct tty_ldisc {
        int magic;
        char *name;
        int num;
        int flags;




        int (*open)(struct tty_struct *);
        void (*close)(struct tty_struct *);
        void (*flush_buffer)(struct tty_struct *tty);
        ssize_t (*chars_in_buffer)(struct tty_struct *tty);
        ssize_t (*read)(struct tty_struct * tty, struct file * file,
                        unsigned char * buf, size_t nr);
        ssize_t (*write)(struct tty_struct * tty, struct file * file,
                         const unsigned char * buf, size_t nr);
        int (*ioctl)(struct tty_struct * tty, struct file * file,
                         unsigned int cmd, unsigned long arg);
        void (*set_termios)(struct tty_struct *tty, struct ktermios * old);
        unsigned int (*poll)(struct tty_struct *, struct file *,
                             struct poll_table_struct *);
        int (*hangup)(struct tty_struct *tty);




        void (*receive_buf)(struct tty_struct *, const unsigned char *cp,
                               char *fp, int count);
        void (*write_wakeup)(struct tty_struct *);

        struct module *owner;

        int refcount;
};
# 15 "include/linux/tty.h" 2
# 43 "include/linux/tty.h"
struct tty_buffer {
        struct tty_buffer *next;
        char *char_buf_ptr;
        unsigned char *flag_buf_ptr;
        int used;
        int size;
        int commit;
        int read;

        unsigned long data[0];
};

struct tty_bufhead {
        struct delayed_work work;
        struct semaphore pty_sem;
        spinlock_t lock;
        struct tty_buffer *head;
        struct tty_buffer *tail;
        struct tty_buffer *free;
        int memory_used;
};
# 160 "include/linux/tty.h"
struct device;
# 172 "include/linux/tty.h"
struct tty_struct {
        int magic;
        struct tty_driver *driver;
        int index;
        struct tty_ldisc ldisc;
        struct mutex termios_mutex;
        struct ktermios *termios, *termios_locked;
        char name[64];
        int pgrp;
        int session;
        unsigned long flags;
        int count;
        struct winsize winsize;
        unsigned char stopped:1, hw_stopped:1, flow_stopped:1, packet:1;
        unsigned char low_latency:1, warned:1;
        unsigned char ctrl_status;
        unsigned int receive_room;

        struct tty_struct *link;
        struct fasync_struct *fasync;
        struct tty_bufhead buf;
        int alt_speed;
        wait_queue_head_t write_wait;
        wait_queue_head_t read_wait;
        struct work_struct hangup_work;
        void *disc_data;
        void *driver_data;
        struct list_head tty_files;







        unsigned int column;
        unsigned char lnext:1, erasing:1, raw:1, real_raw:1, icanon:1;
        unsigned char closing:1;
        unsigned short minimum_to_wake;
        unsigned long overrun_time;
        int num_overrun;
        unsigned long process_char_map[256/(8*sizeof(unsigned long))];
        char *read_buf;
        int read_head;
        int read_tail;
        int read_cnt;
        unsigned long read_flags[4096/(8*sizeof(unsigned long))];
        int canon_data;
        unsigned long canon_head;
        unsigned int canon_column;
        struct mutex atomic_read_lock;
        struct mutex atomic_write_lock;
        unsigned char *write_buf;
        int write_cnt;
        spinlock_t read_lock;

        struct work_struct SAK_work;
};
# 259 "include/linux/tty.h"
extern void tty_write_flush(struct tty_struct *);

extern struct ktermios tty_std_termios;

extern int kmsg_redirect;

extern void console_init(void);
extern int vcs_init(void);

extern int tty_paranoia_check(struct tty_struct *tty, struct inode *inode,
                              const char *routine);
extern char *tty_name(struct tty_struct *tty, char *buf);
extern void tty_wait_until_sent(struct tty_struct * tty, long timeout);
extern int tty_check_change(struct tty_struct * tty);
extern void stop_tty(struct tty_struct * tty);
extern void start_tty(struct tty_struct * tty);
extern int tty_register_ldisc(int disc, struct tty_ldisc *new_ldisc);
extern int tty_unregister_ldisc(int disc);
extern int tty_register_driver(struct tty_driver *driver);
extern int tty_unregister_driver(struct tty_driver *driver);
extern struct device *tty_register_device(struct tty_driver *driver,
                                          unsigned index, struct device *dev);
extern void tty_unregister_device(struct tty_driver *driver, unsigned index);
extern int tty_read_raw_data(struct tty_struct *tty, unsigned char *bufp,
                             int buflen);
extern void tty_write_message(struct tty_struct *tty, char *msg);

extern int is_orphaned_pgrp(int pgrp);
extern int is_ignored(int sig);
extern int tty_signal(int sig, struct tty_struct *tty);
extern void tty_hangup(struct tty_struct * tty);
extern void tty_vhangup(struct tty_struct * tty);
extern void tty_unhangup(struct file *filp);
extern int tty_hung_up_p(struct file * filp);
extern void do_SAK(struct tty_struct *tty);
extern void disassociate_ctty(int priv);
extern void tty_flip_buffer_push(struct tty_struct *tty);
extern speed_t tty_get_baud_rate(struct tty_struct *tty);
extern speed_t tty_termios_baud_rate(struct ktermios *termios);
extern speed_t tty_termios_input_baud_rate(struct ktermios *termios);

extern struct tty_ldisc *tty_ldisc_ref(struct tty_struct *);
extern void tty_ldisc_deref(struct tty_ldisc *);
extern struct tty_ldisc *tty_ldisc_ref_wait(struct tty_struct *);

extern struct tty_ldisc *tty_ldisc_get(int);
extern void tty_ldisc_put(int);

extern void tty_wakeup(struct tty_struct *tty);
extern void tty_ldisc_flush(struct tty_struct *tty);

extern int tty_ioctl(struct inode *inode, struct file *file, unsigned int cmd,
                     unsigned long arg);

extern dev_t tty_devnum(struct tty_struct *tty);
extern void proc_clear_tty(struct task_struct *p);
extern void __proc_set_tty(struct task_struct *tsk, struct tty_struct *tty);
extern void proc_set_tty(struct task_struct *tsk, struct tty_struct *tty);
extern struct tty_struct *get_current_tty(void);

extern struct mutex tty_mutex;


extern struct tty_ldisc tty_ldisc_N_TTY;


extern int n_tty_ioctl(struct tty_struct * tty, struct file * file,
                       unsigned int cmd, unsigned long arg);



extern void serial_console_init(void);



extern int pcxe_open(struct tty_struct *tty, struct file *filp);



extern void console_print(const char *);



extern int vt_ioctl(struct tty_struct *tty, struct file * file,
                    unsigned int cmd, unsigned long arg);
# 28 "init/main.c" 2



# 1 "include/linux/kernel_stat.h" 1



# 1 "include/asm/irq.h" 1
# 15 "include/asm/irq.h"
# 1 "include/asm-i386/mach-default/irq_vectors.h" 1
# 87 "include/asm-i386/mach-default/irq_vectors.h"
# 1 "include/asm-i386/mach-default/irq_vectors_limits.h" 1
# 88 "include/asm-i386/mach-default/irq_vectors.h" 2
# 16 "include/asm/irq.h" 2


static __inline__ __attribute__((always_inline)) int irq_canonicalize(int irq)
{
        return ((irq == 2) ? 9 : irq);
}
# 40 "include/asm/irq.h"
extern void quirk_intel_irqbalance(void);





void init_IRQ(void);
void __attribute__ ((__section__ (".init.text"))) native_init_IRQ(void);
# 5 "include/linux/kernel_stat.h" 2
# 17 "include/linux/kernel_stat.h"
struct cpu_usage_stat {
        cputime64_t user;
        cputime64_t nice;
        cputime64_t system;
        cputime64_t softirq;
        cputime64_t irq;
        cputime64_t idle;
        cputime64_t iowait;
        cputime64_t steal;
};

struct kernel_stat {
        struct cpu_usage_stat cpustat;
        unsigned int irqs[224];
};

extern __typeof__(struct kernel_stat) per_cpu__kstat;





extern unsigned long long nr_context_switches(void);




static inline __attribute__((always_inline)) int kstat_irqs(int irq)
{
        int cpu, sum = 0;

        for (((cpu)) = __first_cpu(&(cpu_possible_map)); ((cpu)) < 32; ((cpu)) = __next_cpu((((cpu))), &((cpu_possible_map))))
                sum += (*({ extern int simple_identifier_kstat(void); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"(&per_cpu__kstat)); (typeof(&per_cpu__kstat)) (__ptr + (__per_cpu_offset[cpu])); }); })).irqs[irq];

        return sum;
}

extern void account_user_time(struct task_struct *, cputime_t);
extern void account_system_time(struct task_struct *, int, cputime_t);
extern void account_steal_time(struct task_struct *, cputime_t);
# 32 "init/main.c" 2
# 1 "include/linux/start_kernel.h" 1
# 10 "include/linux/start_kernel.h"
extern __attribute__((regparm(0))) void __attribute__ ((__section__ (".init.text"))) start_kernel(void);
# 33 "init/main.c" 2
# 1 "include/linux/security.h" 1
# 26 "include/linux/security.h"
# 1 "include/linux/binfmts.h" 1





struct pt_regs;
# 23 "include/linux/binfmts.h"
struct linux_binprm{
        char buf[128];
        struct page *page[32];
        struct mm_struct *mm;
        unsigned long p;
        int sh_bang;
        struct file * file;
        int e_uid, e_gid;
        kernel_cap_t cap_inheritable, cap_permitted, cap_effective;
        void *security;
        int argc, envc;
        char * filename;
        char * interp;


        unsigned interp_flags;
        unsigned interp_data;
        unsigned long loader, exec;
};
# 55 "include/linux/binfmts.h"
struct linux_binfmt {
        struct linux_binfmt * next;
        struct module *module;
        int (*load_binary)(struct linux_binprm *, struct pt_regs * regs);
        int (*load_shlib)(struct file *);
        int (*core_dump)(long signr, struct pt_regs * regs, struct file * file);
        unsigned long min_coredump;
        int hasvdso;
};

extern int register_binfmt(struct linux_binfmt *);
extern int unregister_binfmt(struct linux_binfmt *);

extern int prepare_binprm(struct linux_binprm *);
extern void remove_arg_zero(struct linux_binprm *);
extern int search_binary_handler(struct linux_binprm *,struct pt_regs *);
extern int flush_old_exec(struct linux_binprm * bprm);

extern int suid_dumpable;
# 83 "include/linux/binfmts.h"
extern int setup_arg_pages(struct linux_binprm * bprm,
                           unsigned long stack_top,
                           int executable_stack);
extern int copy_strings_kernel(int argc,char ** argv,struct linux_binprm *bprm);
extern void compute_creds(struct linux_binprm *binprm);
extern int do_coredump(long signr, int exit_code, struct pt_regs * regs);
extern int set_binfmt(struct linux_binfmt *new);
# 27 "include/linux/security.h" 2



# 1 "include/linux/shm.h" 1
# 19 "include/linux/shm.h"
# 1 "include/asm/shmparam.h" 1
# 20 "include/linux/shm.h" 2


struct shmid_ds {
        struct ipc_perm shm_perm;
        int shm_segsz;
        __kernel_time_t shm_atime;
        __kernel_time_t shm_dtime;
        __kernel_time_t shm_ctime;
        __kernel_ipc_pid_t shm_cpid;
        __kernel_ipc_pid_t shm_lpid;
        unsigned short shm_nattch;
        unsigned short shm_unused;
        void *shm_unused2;
        void *shm_unused3;
};


# 1 "include/asm/shmbuf.h" 1
# 14 "include/asm/shmbuf.h"
struct shmid64_ds {
        struct ipc64_perm shm_perm;
        size_t shm_segsz;
        __kernel_time_t shm_atime;
        unsigned long __unused1;
        __kernel_time_t shm_dtime;
        unsigned long __unused2;
        __kernel_time_t shm_ctime;
        unsigned long __unused3;
        __kernel_pid_t shm_cpid;
        __kernel_pid_t shm_lpid;
        unsigned long shm_nattch;
        unsigned long __unused4;
        unsigned long __unused5;
};

struct shminfo64 {
        unsigned long shmmax;
        unsigned long shmmin;
        unsigned long shmmni;
        unsigned long shmseg;
        unsigned long shmall;
        unsigned long __unused1;
        unsigned long __unused2;
        unsigned long __unused3;
        unsigned long __unused4;
};
# 38 "include/linux/shm.h" 2
# 58 "include/linux/shm.h"
struct shminfo {
        int shmmax;
        int shmmin;
        int shmmni;
        int shmseg;
        int shmall;
};

struct shm_info {
        int used_ids;
        unsigned long shm_tot;
        unsigned long shm_rss;
        unsigned long shm_swp;
        unsigned long swap_attempts;
        unsigned long swap_successes;
};


struct shmid_kernel
{
        struct kern_ipc_perm shm_perm;
        struct file * shm_file;
        int id;
        unsigned long shm_nattch;
        unsigned long shm_segsz;
        time_t shm_atim;
        time_t shm_dtim;
        time_t shm_ctim;
        pid_t shm_cprid;
        pid_t shm_lprid;
        struct user_struct *mlock_user;
};
# 98 "include/linux/shm.h"
long do_shmat(int shmid, char *shmaddr, int shmflg, unsigned long *addr);
# 31 "include/linux/security.h" 2
# 1 "include/linux/msg.h" 1
# 15 "include/linux/msg.h"
struct msqid_ds {
        struct ipc_perm msg_perm;
        struct msg *msg_first;
        struct msg *msg_last;
        __kernel_time_t msg_stime;
        __kernel_time_t msg_rtime;
        __kernel_time_t msg_ctime;
        unsigned long msg_lcbytes;
        unsigned long msg_lqbytes;
        unsigned short msg_cbytes;
        unsigned short msg_qnum;
        unsigned short msg_qbytes;
        __kernel_ipc_pid_t msg_lspid;
        __kernel_ipc_pid_t msg_lrpid;
};


# 1 "include/asm/msgbuf.h" 1
# 14 "include/asm/msgbuf.h"
struct msqid64_ds {
        struct ipc64_perm msg_perm;
        __kernel_time_t msg_stime;
        unsigned long __unused1;
        __kernel_time_t msg_rtime;
        unsigned long __unused2;
        __kernel_time_t msg_ctime;
        unsigned long __unused3;
        unsigned long msg_cbytes;
        unsigned long msg_qnum;
        unsigned long msg_qbytes;
        __kernel_pid_t msg_lspid;
        __kernel_pid_t msg_lrpid;
        unsigned long __unused4;
        unsigned long __unused5;
};
# 33 "include/linux/msg.h" 2


struct msgbuf {
        long mtype;
        char mtext[1];
};


struct msginfo {
        int msgpool;
        int msgmap;
        int msgmax;
        int msgmnb;
        int msgmni;
        int msgssz;
        int msgtql;
        unsigned short msgseg;
};
# 68 "include/linux/msg.h"
struct msg_msg {
        struct list_head m_list;
        long m_type;
        int m_ts;
        struct msg_msgseg* next;
        void *security;

};


struct msg_queue {
        struct kern_ipc_perm q_perm;
        int q_id;
        time_t q_stime;
        time_t q_rtime;
        time_t q_ctime;
        unsigned long q_cbytes;
        unsigned long q_qnum;
        unsigned long q_qbytes;
        pid_t q_lspid;
        pid_t q_lrpid;

        struct list_head q_messages;
        struct list_head q_receivers;
        struct list_head q_senders;
};


extern long do_msgsnd(int msqid, long mtype, void *mtext,
                        size_t msgsz, int msgflg);
extern long do_msgrcv(int msqid, long *pmtype, void *mtext,
                        size_t msgsz, long msgtyp, int msgflg);
# 32 "include/linux/security.h" 2


# 1 "include/linux/xfrm.h" 1
# 13 "include/linux/xfrm.h"
typedef union
{
        __be32 a4;
        __be32 a6[4];
} xfrm_address_t;





struct xfrm_id
{
        xfrm_address_t daddr;
        __be32 spi;
        __u8 proto;
};

struct xfrm_sec_ctx {
        __u8 ctx_doi;
        __u8 ctx_alg;
        __u16 ctx_len;
        __u32 ctx_sid;
        char ctx_str[0];
};
# 48 "include/linux/xfrm.h"
struct xfrm_selector
{
        xfrm_address_t daddr;
        xfrm_address_t saddr;
        __be16 dport;
        __be16 dport_mask;
        __be16 sport;
        __be16 sport_mask;
        __u16 family;
        __u8 prefixlen_d;
        __u8 prefixlen_s;
        __u8 proto;
        int ifindex;
        uid_t user;
};



struct xfrm_lifetime_cfg
{
        __u64 soft_byte_limit;
        __u64 hard_byte_limit;
        __u64 soft_packet_limit;
        __u64 hard_packet_limit;
        __u64 soft_add_expires_seconds;
        __u64 hard_add_expires_seconds;
        __u64 soft_use_expires_seconds;
        __u64 hard_use_expires_seconds;
};

struct xfrm_lifetime_cur
{
        __u64 bytes;
        __u64 packets;
        __u64 add_time;
        __u64 use_time;
};

struct xfrm_replay_state
{
        __u32 oseq;
        __u32 seq;
        __u32 bitmap;
};

struct xfrm_algo {
        char alg_name[64];
        int alg_key_len;
        char alg_key[0];
};

struct xfrm_stats {
        __u32 replay_window;
        __u32 replay;
        __u32 integrity_failed;
};

enum
{
        XFRM_POLICY_TYPE_MAIN = 0,
        XFRM_POLICY_TYPE_SUB = 1,
        XFRM_POLICY_TYPE_MAX = 2
};

enum
{
        XFRM_POLICY_IN = 0,
        XFRM_POLICY_OUT = 1,
        XFRM_POLICY_FWD = 2,
        XFRM_POLICY_MAX = 3
};

enum
{
        XFRM_SHARE_ANY,
        XFRM_SHARE_SESSION,
        XFRM_SHARE_USER,
        XFRM_SHARE_UNIQUE
};
# 136 "include/linux/xfrm.h"
enum {
        XFRM_MSG_BASE = 0x10,

        XFRM_MSG_NEWSA = 0x10,

        XFRM_MSG_DELSA,

        XFRM_MSG_GETSA,


        XFRM_MSG_NEWPOLICY,

        XFRM_MSG_DELPOLICY,

        XFRM_MSG_GETPOLICY,


        XFRM_MSG_ALLOCSPI,

        XFRM_MSG_ACQUIRE,

        XFRM_MSG_EXPIRE,


        XFRM_MSG_UPDPOLICY,

        XFRM_MSG_UPDSA,


        XFRM_MSG_POLEXPIRE,


        XFRM_MSG_FLUSHSA,

        XFRM_MSG_FLUSHPOLICY,


        XFRM_MSG_NEWAE,

        XFRM_MSG_GETAE,


        XFRM_MSG_REPORT,


        __XFRM_MSG_MAX
};
# 191 "include/linux/xfrm.h"
struct xfrm_user_sec_ctx {
        __u16 len;
        __u16 exttype;
        __u8 ctx_alg;
        __u8 ctx_doi;
        __u16 ctx_len;
};

struct xfrm_user_tmpl {
        struct xfrm_id id;
        __u16 family;
        xfrm_address_t saddr;
        __u32 reqid;
        __u8 mode;
        __u8 share;
        __u8 optional;
        __u32 aalgos;
        __u32 ealgos;
        __u32 calgos;
};

struct xfrm_encap_tmpl {
        __u16 encap_type;
        __be16 encap_sport;
        __be16 encap_dport;
        xfrm_address_t encap_oa;
};


enum xfrm_ae_ftype_t {
        XFRM_AE_UNSPEC,
        XFRM_AE_RTHR=1,
        XFRM_AE_RVAL=2,
        XFRM_AE_LVAL=4,
        XFRM_AE_ETHR=8,
        XFRM_AE_CR=16,
        XFRM_AE_CE=32,
        XFRM_AE_CU=64,
        __XFRM_AE_MAX


};

struct xfrm_userpolicy_type {
        __u8 type;
        __u16 reserved1;
        __u8 reserved2;
};


enum xfrm_attr_type_t {
        XFRMA_UNSPEC,
        XFRMA_ALG_AUTH,
        XFRMA_ALG_CRYPT,
        XFRMA_ALG_COMP,
        XFRMA_ENCAP,
        XFRMA_TMPL,
        XFRMA_SA,
        XFRMA_POLICY,
        XFRMA_SEC_CTX,
        XFRMA_LTIME_VAL,
        XFRMA_REPLAY_VAL,
        XFRMA_REPLAY_THRESH,
        XFRMA_ETIMER_THRESH,
        XFRMA_SRCADDR,
        XFRMA_COADDR,
        XFRMA_LASTUSED,
        XFRMA_POLICY_TYPE,
        __XFRMA_MAX


};

struct xfrm_usersa_info {
        struct xfrm_selector sel;
        struct xfrm_id id;
        xfrm_address_t saddr;
        struct xfrm_lifetime_cfg lft;
        struct xfrm_lifetime_cur curlft;
        struct xfrm_stats stats;
        __u32 seq;
        __u32 reqid;
        __u16 family;
        __u8 mode;
        __u8 replay_window;
        __u8 flags;




};

struct xfrm_usersa_id {
        xfrm_address_t daddr;
        __be32 spi;
        __u16 family;
        __u8 proto;
};

struct xfrm_aevent_id {
        struct xfrm_usersa_id sa_id;
        xfrm_address_t saddr;
        __u32 flags;
        __u32 reqid;
};

struct xfrm_userspi_info {
        struct xfrm_usersa_info info;
        __u32 min;
        __u32 max;
};

struct xfrm_userpolicy_info {
        struct xfrm_selector sel;
        struct xfrm_lifetime_cfg lft;
        struct xfrm_lifetime_cur curlft;
        __u32 priority;
        __u32 index;
        __u8 dir;
        __u8 action;


        __u8 flags;

        __u8 share;
};

struct xfrm_userpolicy_id {
        struct xfrm_selector sel;
        __u32 index;
        __u8 dir;
};

struct xfrm_user_acquire {
        struct xfrm_id id;
        xfrm_address_t saddr;
        struct xfrm_selector sel;
        struct xfrm_userpolicy_info policy;
        __u32 aalgos;
        __u32 ealgos;
        __u32 calgos;
        __u32 seq;
};

struct xfrm_user_expire {
        struct xfrm_usersa_info state;
        __u8 hard;
};

struct xfrm_user_polexpire {
        struct xfrm_userpolicy_info pol;
        __u8 hard;
};

struct xfrm_usersa_flush {
        __u8 proto;
};

struct xfrm_user_report {
        __u8 proto;
        struct xfrm_selector sel;
};
# 363 "include/linux/xfrm.h"
enum xfrm_nlgroups {
        XFRMNLGRP_NONE,

        XFRMNLGRP_ACQUIRE,

        XFRMNLGRP_EXPIRE,

        XFRMNLGRP_SA,

        XFRMNLGRP_POLICY,

        XFRMNLGRP_AEVENTS,

        XFRMNLGRP_REPORT,

        __XFRMNLGRP_MAX
};
# 35 "include/linux/security.h" 2
# 1 "include/net/flow.h" 1
# 10 "include/net/flow.h"
# 1 "include/linux/in6.h" 1
# 30 "include/linux/in6.h"
struct in6_addr
{
        union
        {
                __u8 u6_addr8[16];
                __be16 u6_addr16[8];
                __be32 u6_addr32[4];
        } in6_u;



};
# 51 "include/linux/in6.h"
extern const struct in6_addr in6addr_loopback;


struct sockaddr_in6 {
        unsigned short int sin6_family;
        __be16 sin6_port;
        __be32 sin6_flowinfo;
        struct in6_addr sin6_addr;
        __u32 sin6_scope_id;
};

struct ipv6_mreq {

        struct in6_addr ipv6mr_multiaddr;


        int ipv6mr_ifindex;
};



struct in6_flowlabel_req
{
        struct in6_addr flr_dst;
        __be32 flr_label;
        __u8 flr_action;
        __u8 flr_share;
        __u16 flr_flags;
        __u16 flr_expires;
        __u16 flr_linger;
        __u32 __flr_pad;

};
# 11 "include/net/flow.h" 2


struct flowi {
        int oif;
        int iif;
        __u32 mark;

        union {
                struct {
                        __be32 daddr;
                        __be32 saddr;
                        __u8 tos;
                        __u8 scope;
                } ip4_u;

                struct {
                        struct in6_addr daddr;
                        struct in6_addr saddr;
                        __be32 flowlabel;
                } ip6_u;

                struct {
                        __le16 daddr;
                        __le16 saddr;
                        __u8 scope;
                } dn_u;
        } nl_u;
# 49 "include/net/flow.h"
        __u8 proto;
        __u8 flags;

        union {
                struct {
                        __be16 sport;
                        __be16 dport;
                } ports;

                struct {
                        __u8 type;
                        __u8 code;
                } icmpt;

                struct {
                        __le16 sport;
                        __le16 dport;
                } dnports;

                __be32 spi;






        } uli_u;
# 84 "include/net/flow.h"
        __u32 secid;
} __attribute__((__aligned__(32/8)));





struct sock;
typedef int (*flow_resolve_t)(struct flowi *key, u16 family, u8 dir,
                               void **objp, atomic_t **obj_refp);

extern void *flow_cache_lookup(struct flowi *key, u16 family, u8 dir,
                               flow_resolve_t resolver);
extern void flow_cache_flush(void);
extern atomic_t flow_cache_genid;
# 36 "include/linux/security.h" 2

struct ctl_table;





extern int cap_capable (struct task_struct *tsk, int cap);
extern int cap_settime (struct timespec *ts, struct timezone *tz);
extern int cap_ptrace (struct task_struct *parent, struct task_struct *child);
extern int cap_capget (struct task_struct *target, kernel_cap_t *effective, kernel_cap_t *inheritable, kernel_cap_t *permitted);
extern int cap_capset_check (struct task_struct *target, kernel_cap_t *effective, kernel_cap_t *inheritable, kernel_cap_t *permitted);
extern void cap_capset_set (struct task_struct *target, kernel_cap_t *effective, kernel_cap_t *inheritable, kernel_cap_t *permitted);
extern int cap_bprm_set_security (struct linux_binprm *bprm);
extern void cap_bprm_apply_creds (struct linux_binprm *bprm, int unsafe);
extern int cap_bprm_secureexec(struct linux_binprm *bprm);
extern int cap_inode_setxattr(struct dentry *dentry, char *name, void *value, size_t size, int flags);
extern int cap_inode_removexattr(struct dentry *dentry, char *name);
extern int cap_task_post_setuid (uid_t old_ruid, uid_t old_euid, uid_t old_suid, int flags);
extern void cap_task_reparent_to_init (struct task_struct *p);
extern int cap_syslog (int type);
extern int cap_vm_enough_memory (long pages);

struct msghdr;
struct sk_buff;
struct sock;
struct sockaddr;
struct socket;
struct flowi;
struct dst_entry;
struct xfrm_selector;
struct xfrm_policy;
struct xfrm_state;
struct xfrm_user_sec_ctx;

extern int cap_netlink_send(struct sock *sk, struct sk_buff *skb);
extern int cap_netlink_recv(struct sk_buff *skb, int cap);
# 90 "include/linux/security.h"
struct nfsctl_arg;
struct sched_param;
struct swap_info_struct;
struct request_sock;
# 2145 "include/linux/security.h"
static inline __attribute__((always_inline)) int security_init(void)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_ptrace (struct task_struct *parent, struct task_struct * child)
{
        return cap_ptrace (parent, child);
}

static inline __attribute__((always_inline)) int security_capget (struct task_struct *target,
                                   kernel_cap_t *effective,
                                   kernel_cap_t *inheritable,
                                   kernel_cap_t *permitted)
{
        return cap_capget (target, effective, inheritable, permitted);
}

static inline __attribute__((always_inline)) int security_capset_check (struct task_struct *target,
                                         kernel_cap_t *effective,
                                         kernel_cap_t *inheritable,
                                         kernel_cap_t *permitted)
{
        return cap_capset_check (target, effective, inheritable, permitted);
}

static inline __attribute__((always_inline)) void security_capset_set (struct task_struct *target,
                                        kernel_cap_t *effective,
                                        kernel_cap_t *inheritable,
                                        kernel_cap_t *permitted)
{
        cap_capset_set (target, effective, inheritable, permitted);
}

static inline __attribute__((always_inline)) int security_capable(struct task_struct *tsk, int cap)
{
        return cap_capable(tsk, cap);
}

static inline __attribute__((always_inline)) int security_acct (struct file *file)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_sysctl(struct ctl_table *table, int op)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_quotactl (int cmds, int type, int id,
                                     struct super_block * sb)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_quota_on (struct dentry * dentry)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_syslog(int type)
{
        return cap_syslog(type);
}

static inline __attribute__((always_inline)) int security_settime(struct timespec *ts, struct timezone *tz)
{
        return cap_settime(ts, tz);
}

static inline __attribute__((always_inline)) int security_vm_enough_memory(long pages)
{
        return cap_vm_enough_memory(pages);
}

static inline __attribute__((always_inline)) int security_bprm_alloc (struct linux_binprm *bprm)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_bprm_free (struct linux_binprm *bprm)
{ }

static inline __attribute__((always_inline)) void security_bprm_apply_creds (struct linux_binprm *bprm, int unsafe)
{
        cap_bprm_apply_creds (bprm, unsafe);
}

static inline __attribute__((always_inline)) void security_bprm_post_apply_creds (struct linux_binprm *bprm)
{
        return;
}

static inline __attribute__((always_inline)) int security_bprm_set (struct linux_binprm *bprm)
{
        return cap_bprm_set_security (bprm);
}

static inline __attribute__((always_inline)) int security_bprm_check (struct linux_binprm *bprm)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_bprm_secureexec (struct linux_binprm *bprm)
{
        return cap_bprm_secureexec(bprm);
}

static inline __attribute__((always_inline)) int security_sb_alloc (struct super_block *sb)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_sb_free (struct super_block *sb)
{ }

static inline __attribute__((always_inline)) int security_sb_copy_data (struct file_system_type *type,
                                         void *orig, void *copy)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_sb_kern_mount (struct super_block *sb, void *data)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_sb_statfs (struct dentry *dentry)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_sb_mount (char *dev_name, struct nameidata *nd,
                                    char *type, unsigned long flags,
                                    void *data)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_sb_check_sb (struct vfsmount *mnt,
                                        struct nameidata *nd)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_sb_umount (struct vfsmount *mnt, int flags)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_sb_umount_close (struct vfsmount *mnt)
{ }

static inline __attribute__((always_inline)) void security_sb_umount_busy (struct vfsmount *mnt)
{ }

static inline __attribute__((always_inline)) void security_sb_post_remount (struct vfsmount *mnt,
                                             unsigned long flags, void *data)
{ }

static inline __attribute__((always_inline)) void security_sb_post_mountroot (void)
{ }

static inline __attribute__((always_inline)) void security_sb_post_addmount (struct vfsmount *mnt,
                                              struct nameidata *mountpoint_nd)
{ }

static inline __attribute__((always_inline)) int security_sb_pivotroot (struct nameidata *old_nd,
                                         struct nameidata *new_nd)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_sb_post_pivotroot (struct nameidata *old_nd,
                                               struct nameidata *new_nd)
{ }

static inline __attribute__((always_inline)) int security_inode_alloc (struct inode *inode)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_inode_free (struct inode *inode)
{ }

static inline __attribute__((always_inline)) int security_inode_init_security (struct inode *inode,
                                                struct inode *dir,
                                                char **name,
                                                void **value,
                                                size_t *len)
{
        return -95;
}

static inline __attribute__((always_inline)) int security_inode_create (struct inode *dir,
                                         struct dentry *dentry,
                                         int mode)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_inode_link (struct dentry *old_dentry,
                                       struct inode *dir,
                                       struct dentry *new_dentry)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_inode_unlink (struct inode *dir,
                                         struct dentry *dentry)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_inode_symlink (struct inode *dir,
                                          struct dentry *dentry,
                                          const char *old_name)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_inode_mkdir (struct inode *dir,
                                        struct dentry *dentry,
                                        int mode)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_inode_rmdir (struct inode *dir,
                                        struct dentry *dentry)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_inode_mknod (struct inode *dir,
                                        struct dentry *dentry,
                                        int mode, dev_t dev)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_inode_rename (struct inode *old_dir,
                                         struct dentry *old_dentry,
                                         struct inode *new_dir,
                                         struct dentry *new_dentry)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_inode_readlink (struct dentry *dentry)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_inode_follow_link (struct dentry *dentry,
                                              struct nameidata *nd)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_inode_permission (struct inode *inode, int mask,
                                             struct nameidata *nd)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_inode_setattr (struct dentry *dentry,
                                          struct iattr *attr)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_inode_getattr (struct vfsmount *mnt,
                                          struct dentry *dentry)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_inode_delete (struct inode *inode)
{ }

static inline __attribute__((always_inline)) int security_inode_setxattr (struct dentry *dentry, char *name,
                                           void *value, size_t size, int flags)
{
        return cap_inode_setxattr(dentry, name, value, size, flags);
}

static inline __attribute__((always_inline)) void security_inode_post_setxattr (struct dentry *dentry, char *name,
                                                 void *value, size_t size, int flags)
{ }

static inline __attribute__((always_inline)) int security_inode_getxattr (struct dentry *dentry, char *name)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_inode_listxattr (struct dentry *dentry)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_inode_removexattr (struct dentry *dentry, char *name)
{
        return cap_inode_removexattr(dentry, name);
}

static inline __attribute__((always_inline)) const char *security_inode_xattr_getsuffix (void)
{
        return ((void *)0) ;
}

static inline __attribute__((always_inline)) int security_inode_getsecurity(const struct inode *inode, const char *name, void *buffer, size_t size, int err)
{
        return -95;
}

static inline __attribute__((always_inline)) int security_inode_setsecurity(struct inode *inode, const char *name, const void *value, size_t size, int flags)
{
        return -95;
}

static inline __attribute__((always_inline)) int security_inode_listsecurity(struct inode *inode, char *buffer, size_t buffer_size)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_file_permission (struct file *file, int mask)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_file_alloc (struct file *file)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_file_free (struct file *file)
{ }

static inline __attribute__((always_inline)) int security_file_ioctl (struct file *file, unsigned int cmd,
                                       unsigned long arg)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_file_mmap (struct file *file, unsigned long reqprot,
                                      unsigned long prot,
                                      unsigned long flags)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_file_mprotect (struct vm_area_struct *vma,
                                          unsigned long reqprot,
                                          unsigned long prot)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_file_lock (struct file *file, unsigned int cmd)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_file_fcntl (struct file *file, unsigned int cmd,
                                       unsigned long arg)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_file_set_fowner (struct file *file)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_file_send_sigiotask (struct task_struct *tsk,
                                                struct fown_struct *fown,
                                                int sig)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_file_receive (struct file *file)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_create (unsigned long clone_flags)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_alloc (struct task_struct *p)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_task_free (struct task_struct *p)
{ }

static inline __attribute__((always_inline)) int security_task_setuid (uid_t id0, uid_t id1, uid_t id2,
                                        int flags)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_post_setuid (uid_t old_ruid, uid_t old_euid,
                                             uid_t old_suid, int flags)
{
        return cap_task_post_setuid (old_ruid, old_euid, old_suid, flags);
}

static inline __attribute__((always_inline)) int security_task_setgid (gid_t id0, gid_t id1, gid_t id2,
                                        int flags)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_setpgid (struct task_struct *p, pid_t pgid)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_getpgid (struct task_struct *p)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_getsid (struct task_struct *p)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_task_getsecid (struct task_struct *p, u32 *secid)
{ }

static inline __attribute__((always_inline)) int security_task_setgroups (struct group_info *group_info)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_setnice (struct task_struct *p, int nice)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_setioprio (struct task_struct *p, int ioprio)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_getioprio (struct task_struct *p)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_setrlimit (unsigned int resource,
                                           struct rlimit *new_rlim)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_setscheduler (struct task_struct *p,
                                              int policy,
                                              struct sched_param *lp)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_getscheduler (struct task_struct *p)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_movememory (struct task_struct *p)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_kill (struct task_struct *p,
                                      struct siginfo *info, int sig,
                                      u32 secid)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_wait (struct task_struct *p)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_task_prctl (int option, unsigned long arg2,
                                       unsigned long arg3,
                                       unsigned long arg4,
                                       unsigned long arg5)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_task_reparent_to_init (struct task_struct *p)
{
        cap_task_reparent_to_init (p);
}

static inline __attribute__((always_inline)) void security_task_to_inode(struct task_struct *p, struct inode *inode)
{ }

static inline __attribute__((always_inline)) int security_ipc_permission (struct kern_ipc_perm *ipcp,
                                           short flag)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_msg_msg_alloc (struct msg_msg * msg)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_msg_msg_free (struct msg_msg * msg)
{ }

static inline __attribute__((always_inline)) int security_msg_queue_alloc (struct msg_queue *msq)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_msg_queue_free (struct msg_queue *msq)
{ }

static inline __attribute__((always_inline)) int security_msg_queue_associate (struct msg_queue * msq,
                                                int msqflg)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_msg_queue_msgctl (struct msg_queue * msq, int cmd)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_msg_queue_msgsnd (struct msg_queue * msq,
                                             struct msg_msg * msg, int msqflg)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_msg_queue_msgrcv (struct msg_queue * msq,
                                             struct msg_msg * msg,
                                             struct task_struct * target,
                                             long type, int mode)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_shm_alloc (struct shmid_kernel *shp)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_shm_free (struct shmid_kernel *shp)
{ }

static inline __attribute__((always_inline)) int security_shm_associate (struct shmid_kernel * shp,
                                          int shmflg)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_shm_shmctl (struct shmid_kernel * shp, int cmd)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_shm_shmat (struct shmid_kernel * shp,
                                      char *shmaddr, int shmflg)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_sem_alloc (struct sem_array *sma)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_sem_free (struct sem_array *sma)
{ }

static inline __attribute__((always_inline)) int security_sem_associate (struct sem_array * sma, int semflg)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_sem_semctl (struct sem_array * sma, int cmd)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_sem_semop (struct sem_array * sma,
                                      struct sembuf * sops, unsigned nsops,
                                      int alter)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_d_instantiate (struct dentry *dentry, struct inode *inode)
{ }

static inline __attribute__((always_inline)) int security_getprocattr(struct task_struct *p, char *name, void *value, size_t size)
{
        return -22;
}

static inline __attribute__((always_inline)) int security_setprocattr(struct task_struct *p, char *name, void *value, size_t size)
{
        return -22;
}

static inline __attribute__((always_inline)) int security_netlink_send (struct sock *sk, struct sk_buff *skb)
{
        return cap_netlink_send (sk, skb);
}

static inline __attribute__((always_inline)) int security_netlink_recv (struct sk_buff *skb, int cap)
{
        return cap_netlink_recv (skb, cap);
}

static inline __attribute__((always_inline)) struct dentry *securityfs_create_dir(const char *name,
                                        struct dentry *parent)
{
        return ERR_PTR(-19);
}

static inline __attribute__((always_inline)) struct dentry *securityfs_create_file(const char *name,
                                                mode_t mode,
                                                struct dentry *parent,
                                                void *data,
                                                struct file_operations *fops)
{
        return ERR_PTR(-19);
}

static inline __attribute__((always_inline)) void securityfs_remove(struct dentry *dentry)
{
}

static inline __attribute__((always_inline)) int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
{
        return -95;
}

static inline __attribute__((always_inline)) void security_release_secctx(char *secdata, u32 seclen)
{
}
# 2967 "include/linux/security.h"
static inline __attribute__((always_inline)) int security_unix_stream_connect(struct socket * sock,
                                               struct socket * other,
                                               struct sock * newsk)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_unix_may_send(struct socket * sock,
                                         struct socket * other)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_socket_create (int family, int type,
                                          int protocol, int kern)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_socket_post_create(struct socket * sock,
                                              int family,
                                              int type,
                                              int protocol, int kern)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_socket_bind(struct socket * sock,
                                       struct sockaddr * address,
                                       int addrlen)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_socket_connect(struct socket * sock,
                                          struct sockaddr * address,
                                          int addrlen)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_socket_listen(struct socket * sock, int backlog)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_socket_accept(struct socket * sock,
                                         struct socket * newsock)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_socket_post_accept(struct socket * sock,
                                               struct socket * newsock)
{
}

static inline __attribute__((always_inline)) int security_socket_sendmsg(struct socket * sock,
                                          struct msghdr * msg, int size)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_socket_recvmsg(struct socket * sock,
                                          struct msghdr * msg, int size,
                                          int flags)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_socket_getsockname(struct socket * sock)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_socket_getpeername(struct socket * sock)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_socket_getsockopt(struct socket * sock,
                                             int level, int optname)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_socket_setsockopt(struct socket * sock,
                                             int level, int optname)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_socket_shutdown(struct socket * sock, int how)
{
        return 0;
}
static inline __attribute__((always_inline)) int security_sock_rcv_skb (struct sock * sk,
                                         struct sk_buff * skb)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_socket_getpeersec_stream(struct socket *sock, char *optval,
                                                    int *optlen, unsigned len)
{
        return -92;
}

static inline __attribute__((always_inline)) int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid)
{
        return -92;
}

static inline __attribute__((always_inline)) int security_sk_alloc(struct sock *sk, int family, gfp_t priority)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_sk_free(struct sock *sk)
{
}

static inline __attribute__((always_inline)) void security_sk_clone(const struct sock *sk, struct sock *newsk)
{
}

static inline __attribute__((always_inline)) void security_sk_classify_flow(struct sock *sk, struct flowi *fl)
{
}

static inline __attribute__((always_inline)) void security_req_classify_flow(const struct request_sock *req, struct flowi *fl)
{
}

static inline __attribute__((always_inline)) void security_sock_graft(struct sock* sk, struct socket *parent)
{
}

static inline __attribute__((always_inline)) int security_inet_conn_request(struct sock *sk,
                        struct sk_buff *skb, struct request_sock *req)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_inet_csk_clone(struct sock *newsk,
                        const struct request_sock *req)
{
}

static inline __attribute__((always_inline)) void security_inet_conn_established(struct sock *sk,
                        struct sk_buff *skb)
{
}
# 3194 "include/linux/security.h"
static inline __attribute__((always_inline)) int security_xfrm_policy_alloc(struct xfrm_policy *xp, struct xfrm_user_sec_ctx *sec_ctx)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_xfrm_policy_clone(struct xfrm_policy *old, struct xfrm_policy *new)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_xfrm_policy_free(struct xfrm_policy *xp)
{
}

static inline __attribute__((always_inline)) int security_xfrm_policy_delete(struct xfrm_policy *xp)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_xfrm_state_alloc(struct xfrm_state *x,
                                        struct xfrm_user_sec_ctx *sec_ctx)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_xfrm_state_alloc_acquire(struct xfrm_state *x,
                                        struct xfrm_sec_ctx *polsec, u32 secid)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_xfrm_state_free(struct xfrm_state *x)
{
}

static inline __attribute__((always_inline)) int security_xfrm_state_delete(struct xfrm_state *x)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_xfrm_policy_lookup(struct xfrm_policy *xp, u32 fl_secid, u8 dir)
{
        return 0;
}

static inline __attribute__((always_inline)) int security_xfrm_state_pol_flow_match(struct xfrm_state *x,
                        struct xfrm_policy *xp, struct flowi *fl)
{
        return 1;
}

static inline __attribute__((always_inline)) int security_xfrm_decode_session(struct sk_buff *skb, u32 *secid)
{
        return 0;
}

static inline __attribute__((always_inline)) void security_skb_classify_flow(struct sk_buff *skb, struct flowi *fl)
{
}
# 34 "init/main.c" 2

# 1 "include/linux/profile.h" 1
# 13 "include/linux/profile.h"
extern int prof_on __attribute__((__section__(".data.read_mostly")));






struct proc_dir_entry;
struct pt_regs;
struct notifier_block;


void __attribute__ ((__section__ (".init.text"))) profile_init(void);
void profile_tick(int);




void profile_hits(int, void *ip, unsigned int nr_hits);




static inline __attribute__((always_inline)) void profile_hit(int type, void *ip)
{



        if (__builtin_expect(!!(prof_on == type), 0))
                profile_hits(type, ip, 1);
}


void create_prof_cpu_mask(struct proc_dir_entry *);




enum profile_type {
        PROFILE_TASK_EXIT,
        PROFILE_MUNMAP
};



struct task_struct;
struct mm_struct;


void profile_task_exit(struct task_struct * task);




int profile_handoff_task(struct task_struct * task);


void profile_munmap(unsigned long addr);

int task_handoff_register(struct notifier_block * n);
int task_handoff_unregister(struct notifier_block * n);

int profile_event_register(enum profile_type, struct notifier_block * n);
int profile_event_unregister(enum profile_type, struct notifier_block * n);

int register_timer_hook(int (*hook)(struct pt_regs *));
void unregister_timer_hook(int (*hook)(struct pt_regs *));


extern int (*timer_hook)(struct pt_regs *);

struct pt_regs;
# 36 "init/main.c" 2


# 1 "include/linux/kallsyms.h" 1
# 13 "include/linux/kallsyms.h"
unsigned long kallsyms_lookup_name(const char *name);

extern int kallsyms_lookup_size_offset(unsigned long addr,
                                  unsigned long *symbolsize,
                                  unsigned long *offset);


const char *kallsyms_lookup(unsigned long addr,
                            unsigned long *symbolsize,
                            unsigned long *offset,
                            char **modname, char *namebuf);


extern void __print_symbol(const char *fmt, unsigned long address);
# 55 "include/linux/kallsyms.h"
static void __check_printsym_format(const char *fmt, ...)
__attribute__((format(printf,1,2)));
static inline __attribute__((always_inline)) void __check_printsym_format(const char *fmt, ...)
{
}
# 71 "include/linux/kallsyms.h"
static inline __attribute__((always_inline)) void print_symbol(const char *fmt, unsigned long addr)
{
        __check_printsym_format(fmt, "");
        __print_symbol(fmt, (unsigned long)
                       __builtin_extract_return_addr((void *)addr));
}
# 39 "init/main.c" 2
# 1 "include/linux/writeback.h" 1






struct backing_dev_info;

extern spinlock_t inode_lock;
extern struct list_head inode_in_use;
extern struct list_head inode_unused;





static inline __attribute__((always_inline)) int task_is_pdflush(struct task_struct *task)
{
        return task->flags & 0x00001000;
}






enum writeback_sync_modes {
        WB_SYNC_NONE,
        WB_SYNC_ALL,
        WB_SYNC_HOLD,
};






struct writeback_control {
        struct backing_dev_info *bdi;

        enum writeback_sync_modes sync_mode;
        unsigned long *older_than_this;

        long nr_to_write;

        long pages_skipped;






        loff_t range_start;
        loff_t range_end;

        unsigned nonblocking:1;
        unsigned encountered_congestion:1;
        unsigned for_kupdate:1;
        unsigned for_reclaim:1;
        unsigned for_writepages:1;
        unsigned range_cyclic:1;
};




void writeback_inodes(struct writeback_control *wbc);
void wake_up_inode(struct inode *inode);
int inode_wait(void *);
void sync_inodes_sb(struct super_block *, int wait);
void sync_inodes(int wait);


static inline __attribute__((always_inline)) void wait_on_inode(struct inode *inode)
{
        do { cond_resched(); } while (0);
        wait_on_bit(&inode->i_state, 3, inode_wait,
                                                        2);
}




int wakeup_pdflush(long nr_pages);
void laptop_io_completion(void);
void laptop_sync_completion(void);
void throttle_vm_writeout(gfp_t gfp_mask);


extern int dirty_background_ratio;
extern int vm_dirty_ratio;
extern int dirty_writeback_interval;
extern int dirty_expire_interval;
extern int block_dump;
extern int laptop_mode;

struct ctl_table;
struct file;
int dirty_writeback_centisecs_handler(struct ctl_table *, int, struct file *,
                                      void *, size_t *, loff_t *);

void page_writeback_init(void);
void balance_dirty_pages_ratelimited_nr(struct address_space *mapping,
                                        unsigned long nr_pages_dirtied);

static inline __attribute__((always_inline)) void
balance_dirty_pages_ratelimited(struct address_space *mapping)
{
        balance_dirty_pages_ratelimited_nr(mapping, 1);
}

int pdflush_operation(void (*fn)(unsigned long), unsigned long arg0);
extern int generic_writepages(struct address_space *mapping,
                              struct writeback_control *wbc);
int do_writepages(struct address_space *mapping, struct writeback_control *wbc);
int sync_page_range(struct inode *inode, struct address_space *mapping,
                        loff_t pos, loff_t count);
int sync_page_range_nolock(struct inode *inode, struct address_space *mapping,
                           loff_t pos, loff_t count);
void set_page_dirty_balance(struct page *page);
void writeback_set_ratelimit(void);


extern int nr_pdflush_threads;
# 40 "init/main.c" 2
# 1 "include/linux/cpu.h" 1
# 23 "include/linux/cpu.h"
# 1 "include/linux/node.h" 1
# 25 "include/linux/node.h"
struct node {
        struct sys_device sysdev;
};

extern struct node node_devices[];

extern int register_node(struct node *, int, struct node *);
extern void unregister_node(struct node *node);






static inline __attribute__((always_inline)) int register_one_node(int nid)
{
        return 0;
}
static inline __attribute__((always_inline)) int unregister_one_node(int nid)
{
        return 0;
}
static inline __attribute__((always_inline)) int register_cpu_under_node(unsigned int cpu, unsigned int nid)
{
        return 0;
}
static inline __attribute__((always_inline)) int unregister_cpu_under_node(unsigned int cpu, unsigned int nid)
{
        return 0;
}
# 24 "include/linux/cpu.h" 2





struct cpu {
        int node_id;
        int hotpluggable;
        struct sys_device sysdev;
};

extern int register_cpu(struct cpu *cpu, int num);
extern struct sys_device *get_cpu_sysdev(unsigned cpu);

extern int cpu_add_sysdev_attr(struct sysdev_attribute *attr);
extern void cpu_remove_sysdev_attr(struct sysdev_attribute *attr);

extern int cpu_add_sysdev_attr_group(struct attribute_group *attrs);
extern void cpu_remove_sysdev_attr_group(struct attribute_group *attrs);





struct notifier_block;



extern int register_cpu_notifier(struct notifier_block *nb);



static inline __attribute__((always_inline)) void unregister_cpu_notifier(struct notifier_block *nb)
{
}


int cpu_up(unsigned int cpu);
# 74 "include/linux/cpu.h"
extern struct sysdev_class cpu_sysdev_class;
# 103 "include/linux/cpu.h"
static inline __attribute__((always_inline)) void cpuhotplug_mutex_lock(struct mutex *cpu_hp_mutex)
{ }
static inline __attribute__((always_inline)) void cpuhotplug_mutex_unlock(struct mutex *cpu_hp_mutex)
{ }
# 116 "include/linux/cpu.h"
static inline __attribute__((always_inline)) int cpu_is_offline(int cpu) { return 0; }






static inline __attribute__((always_inline)) int disable_nonboot_cpus(void) { return 0; }
static inline __attribute__((always_inline)) void enable_nonboot_cpus(void) {}
# 41 "init/main.c" 2
# 1 "include/linux/cpuset.h" 1
# 80 "include/linux/cpuset.h"
static inline __attribute__((always_inline)) int cpuset_init_early(void) { return 0; }
static inline __attribute__((always_inline)) int cpuset_init(void) { return 0; }
static inline __attribute__((always_inline)) void cpuset_init_smp(void) {}
static inline __attribute__((always_inline)) void cpuset_fork(struct task_struct *p) {}
static inline __attribute__((always_inline)) void cpuset_exit(struct task_struct *p) {}

static inline __attribute__((always_inline)) cpumask_t cpuset_cpus_allowed(struct task_struct *p)
{
        return cpu_possible_map;
}

static inline __attribute__((always_inline)) nodemask_t cpuset_mems_allowed(struct task_struct *p)
{
        return node_possible_map;
}


static inline __attribute__((always_inline)) void cpuset_init_current_mems_allowed(void) {}
static inline __attribute__((always_inline)) void cpuset_update_task_memory_state(void) {}


static inline __attribute__((always_inline)) int cpuset_zonelist_valid_mems_allowed(struct zonelist *zl)
{
        return 1;
}

static inline __attribute__((always_inline)) int cpuset_zone_allowed_softwall(struct zone *z, gfp_t gfp_mask)
{
        return 1;
}

static inline __attribute__((always_inline)) int cpuset_zone_allowed_hardwall(struct zone *z, gfp_t gfp_mask)
{
        return 1;
}

static inline __attribute__((always_inline)) int cpuset_excl_nodes_overlap(const struct task_struct *p)
{
        return 1;
}

static inline __attribute__((always_inline)) void cpuset_memory_pressure_bump(void) {}

static inline __attribute__((always_inline)) char *cpuset_task_status_allowed(struct task_struct *task,
                                                        char *buffer)
{
        return buffer;
}

static inline __attribute__((always_inline)) void cpuset_lock(void) {}
static inline __attribute__((always_inline)) void cpuset_unlock(void) {}

static inline __attribute__((always_inline)) int cpuset_mem_spread_node(void)
{
        return 0;
}

static inline __attribute__((always_inline)) int cpuset_do_page_mem_spread(void)
{
        return 0;
}

static inline __attribute__((always_inline)) int cpuset_do_slab_mem_spread(void)
{
        return 0;
}

static inline __attribute__((always_inline)) void cpuset_track_online_nodes(void) {}
# 42 "init/main.c" 2
# 1 "include/linux/efi.h" 1
# 19 "include/linux/efi.h"
# 1 "include/linux/rtc.h" 1
# 20 "include/linux/rtc.h"
struct rtc_time {
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





struct rtc_wkalrm {
        unsigned char enabled;
        unsigned char pending;
        struct rtc_time time;
};
# 55 "include/linux/rtc.h"
struct rtc_pll_info {
        int pll_ctrl;
        int pll_value;
        int pll_max;
        int pll_min;
        int pll_posmult;
        int pll_negmult;
        long pll_clock;
};
# 102 "include/linux/rtc.h"
# 1 "include/linux/interrupt.h" 1
# 10 "include/linux/interrupt.h"
# 1 "include/linux/irqreturn.h" 1
# 19 "include/linux/irqreturn.h"
typedef int irqreturn_t;
# 11 "include/linux/interrupt.h" 2
# 1 "include/linux/hardirq.h" 1






# 1 "include/asm/hardirq.h" 1




# 1 "include/linux/irq.h" 1
# 24 "include/linux/irq.h"
# 1 "include/asm/irq_regs.h" 1
# 12 "include/asm/irq_regs.h"
static inline __attribute__((always_inline)) struct pt_regs *get_irq_regs(void)
{
        return ({ typeof(_proxy_pda.irq_regs) ret__; switch (sizeof(_proxy_pda.irq_regs)) { case 1: asm("mov" "b %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->irq_regs)), "m" (_proxy_pda.irq_regs)); break; case 2: asm("mov" "w %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->irq_regs)), "m" (_proxy_pda.irq_regs)); break; case 4: asm("mov" "l %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->irq_regs)), "m" (_proxy_pda.irq_regs)); break; default: __bad_pda_field(); } ret__; });
}

static inline __attribute__((always_inline)) struct pt_regs *set_irq_regs(struct pt_regs *new_regs)
{
        struct pt_regs *old_regs;

        old_regs = ({ typeof(_proxy_pda.irq_regs) ret__; switch (sizeof(_proxy_pda.irq_regs)) { case 1: asm("mov" "b %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->irq_regs)), "m" (_proxy_pda.irq_regs)); break; case 2: asm("mov" "w %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->irq_regs)), "m" (_proxy_pda.irq_regs)); break; case 4: asm("mov" "l %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->irq_regs)), "m" (_proxy_pda.irq_regs)); break; default: __bad_pda_field(); } ret__; });
        do { typedef typeof(_proxy_pda.irq_regs) T__; if (0) { T__ tmp__; tmp__ = (new_regs); } switch (sizeof(_proxy_pda.irq_regs)) { case 1: asm("mov" "b %1,%%gs:%c2" : "+m" (_proxy_pda.irq_regs) :"ri" ((T__)new_regs), "i"(((size_t) &((struct i386_pda *)0)->irq_regs))); break; case 2: asm("mov" "w %1,%%gs:%c2" : "+m" (_proxy_pda.irq_regs) :"ri" ((T__)new_regs), "i"(((size_t) &((struct i386_pda *)0)->irq_regs))); break; case 4: asm("mov" "l %1,%%gs:%c2" : "+m" (_proxy_pda.irq_regs) :"ri" ((T__)new_regs), "i"(((size_t) &((struct i386_pda *)0)->irq_regs))); break; default: __bad_pda_field(); } } while (0);

        return old_regs;
}
# 25 "include/linux/irq.h" 2

struct irq_desc;
typedef void __attribute__((regparm(3))) (*irq_flow_handler_t)(unsigned int irq,
                                            struct irq_desc *desc);
# 70 "include/linux/irq.h"
struct proc_dir_entry;
# 94 "include/linux/irq.h"
struct irq_chip {
        const char *name;
        unsigned int (*startup)(unsigned int irq);
        void (*shutdown)(unsigned int irq);
        void (*enable)(unsigned int irq);
        void (*disable)(unsigned int irq);

        void (*ack)(unsigned int irq);
        void (*mask)(unsigned int irq);
        void (*mask_ack)(unsigned int irq);
        void (*unmask)(unsigned int irq);
        void (*eoi)(unsigned int irq);

        void (*end)(unsigned int irq);
        void (*set_affinity)(unsigned int irq, cpumask_t dest);
        int (*retrigger)(unsigned int irq);
        int (*set_type)(unsigned int irq, unsigned int flow_type);
        int (*set_wake)(unsigned int irq, unsigned int on);
# 121 "include/linux/irq.h"
        const char *typename;
};
# 148 "include/linux/irq.h"
struct irq_desc {
        irq_flow_handler_t handle_irq;
        struct irq_chip *chip;
        void *handler_data;
        void *chip_data;
        struct irqaction *action;
        unsigned int status;

        unsigned int depth;
        unsigned int wake_depth;
        unsigned int irq_count;
        unsigned int irqs_unhandled;
        spinlock_t lock;

        cpumask_t affinity;
        unsigned int cpu;


        cpumask_t pending_mask;


        struct proc_dir_entry *dir;

        const char *name;
} __attribute__((__aligned__((1 << (7)))));

extern struct irq_desc irq_desc[224];





typedef struct irq_chip hw_irq_controller;

typedef struct irq_desc irq_desc_t;




# 1 "include/asm/hw_irq.h" 1
# 18 "include/asm/hw_irq.h"
# 1 "include/asm/sections.h" 1




# 1 "include/asm-generic/sections.h" 1





extern char _text[], _stext[], _etext[];
extern char _data[], _sdata[], _edata[];
extern char __bss_start[], __bss_stop[];
extern char __init_begin[], __init_end[];
extern char _sinittext[], _einittext[];
extern char _sextratext[] __attribute__((weak));
extern char _eextratext[] __attribute__((weak));
extern char _end[];
extern char __per_cpu_start[], __per_cpu_end[];
extern char __kprobes_text_start[], __kprobes_text_end[];
extern char __initdata_begin[], __initdata_end[];
extern char __start_rodata[], __end_rodata[];
# 6 "include/asm/sections.h" 2
# 19 "include/asm/hw_irq.h" 2
# 29 "include/asm/hw_irq.h"
extern void (*interrupt[224])(void);


__attribute__((regparm(3))) void reschedule_interrupt(void);
__attribute__((regparm(3))) void invalidate_interrupt(void);
__attribute__((regparm(3))) void call_function_interrupt(void);



__attribute__((regparm(3))) void apic_timer_interrupt(void);
__attribute__((regparm(3))) void error_interrupt(void);
__attribute__((regparm(3))) void spurious_interrupt(void);
__attribute__((regparm(3))) void thermal_interrupt(void);



void disable_8259A_irq(unsigned int irq);
void enable_8259A_irq(unsigned int irq);
int i8259A_irq_pending(unsigned int irq);
void make_8259A_irq(unsigned int irq);
void init_8259A(int aeoi);
void send_IPI_self(int vector) __attribute__((regparm(3)));
void init_VISWS_APIC_irqs(void);
void setup_IO_APIC(void);
void disable_IO_APIC(void);
void print_IO_APIC(void);
int IO_APIC_get_PCI_irq_vector(int bus, int slot, int fn);
void send_IPI(int dest, int vector);
void setup_ioapic_dest(void);

extern unsigned long io_apic_irqs;

extern atomic_t irq_err_count;
extern atomic_t irq_mis_count;
# 188 "include/linux/irq.h" 2

extern int setup_irq(unsigned int irq, struct irqaction *new);
# 198 "include/linux/irq.h"
static inline __attribute__((always_inline)) void set_native_irq_info(int irq, cpumask_t mask)
{
        irq_desc[irq].affinity = mask;
}
# 212 "include/linux/irq.h"
void set_pending_irq(unsigned int irq, cpumask_t mask);
void move_native_irq(int irq);
void move_masked_irq(int irq);
# 246 "include/linux/irq.h"
static inline __attribute__((always_inline)) void set_balance_irq_affinity(unsigned int irq, cpumask_t mask)
{
}





static inline __attribute__((always_inline)) int select_smp_affinity(unsigned int irq)
{
        return 1;
}


extern int no_irq_affinity;


extern int handle_IRQ_event(unsigned int irq, struct irqaction *action);





extern void __attribute__((regparm(3))) handle_level_irq(unsigned int irq, struct irq_desc *desc);
extern void __attribute__((regparm(3))) handle_fasteoi_irq(unsigned int irq, struct irq_desc *desc);
extern void __attribute__((regparm(3))) handle_edge_irq(unsigned int irq, struct irq_desc *desc);
extern void __attribute__((regparm(3))) handle_simple_irq(unsigned int irq, struct irq_desc *desc);
extern void __attribute__((regparm(3))) handle_percpu_irq(unsigned int irq, struct irq_desc *desc);
extern void __attribute__((regparm(3))) handle_bad_irq(unsigned int irq, struct irq_desc *desc);






extern __attribute__((regparm(3))) unsigned int __do_IRQ(unsigned int irq);
# 290 "include/linux/irq.h"
static inline __attribute__((always_inline)) void generic_handle_irq(unsigned int irq)
{
        struct irq_desc *desc = irq_desc + irq;




        if (__builtin_expect(!!(desc->handle_irq), 1))
                desc->handle_irq(irq, desc);
        else
                __do_IRQ(irq);

}


extern void note_interrupt(unsigned int irq, struct irq_desc *desc,
                           int action_ret);


void check_irq_resend(struct irq_desc *desc, unsigned int irq);


extern void init_irq_proc(void);


extern int noirqdebug_setup(char *str);


extern int can_request_irq(unsigned int irq, unsigned long irqflags);


extern struct irq_chip no_irq_chip;
extern struct irq_chip dummy_irq_chip;

extern void
set_irq_chip_and_handler(unsigned int irq, struct irq_chip *chip,
                         irq_flow_handler_t handle);
extern void
set_irq_chip_and_handler_name(unsigned int irq, struct irq_chip *chip,
                              irq_flow_handler_t handle, const char *name);

extern void
__set_irq_handler(unsigned int irq, irq_flow_handler_t handle, int is_chained,
                  const char *name);




static inline __attribute__((always_inline)) void
set_irq_handler(unsigned int irq, irq_flow_handler_t handle)
{
        __set_irq_handler(irq, handle, 0, ((void *)0));
}






static inline __attribute__((always_inline)) void
set_irq_chained_handler(unsigned int irq,
                        irq_flow_handler_t handle)
{
        __set_irq_handler(irq, handle, 1, ((void *)0));
}


extern int create_irq(void);
extern void destroy_irq(unsigned int irq);


static inline __attribute__((always_inline)) int irq_has_action(unsigned int irq)
{
        struct irq_desc *desc = irq_desc + irq;
        return desc->action != ((void *)0);
}


extern void dynamic_irq_init(unsigned int irq);
extern void dynamic_irq_cleanup(unsigned int irq);


extern int set_irq_chip(unsigned int irq, struct irq_chip *chip);
extern int set_irq_data(unsigned int irq, void *data);
extern int set_irq_chip_data(unsigned int irq, void *data);
extern int set_irq_type(unsigned int irq, unsigned int type);
# 6 "include/asm/hardirq.h" 2

typedef struct {
        unsigned int __softirq_pending;
        unsigned long idle_timestamp;
        unsigned int __nmi_count;
        unsigned int apic_timer_irqs;
} __attribute__((__aligned__((1 << (7))))) irq_cpustat_t;

extern __typeof__(irq_cpustat_t) per_cpu__irq_stat;
extern irq_cpustat_t irq_stat[];




void ack_bad_irq(unsigned int irq);
# 1 "include/linux/irq_cpustat.h" 1
# 22 "include/asm/hardirq.h" 2
# 8 "include/linux/hardirq.h" 2
# 90 "include/linux/hardirq.h"
extern void synchronize_irq(unsigned int irq);




struct task_struct;


static inline __attribute__((always_inline)) void account_system_vtime(struct task_struct *tsk)
{
}
# 129 "include/linux/hardirq.h"
extern void irq_exit(void);
# 12 "include/linux/interrupt.h" 2
# 68 "include/linux/interrupt.h"
typedef irqreturn_t (*irq_handler_t)(int, void *);

struct irqaction {
        irq_handler_t handler;
        unsigned long flags;
        cpumask_t mask;
        const char *name;
        void *dev_id;
        struct irqaction *next;
        int irq;
        struct proc_dir_entry *dir;
};

extern irqreturn_t no_action(int cpl, void *dev_id);
extern int request_irq(unsigned int, irq_handler_t handler,
                       unsigned long, const char *, void *);
extern void free_irq(unsigned int, void *);
# 105 "include/linux/interrupt.h"
extern void disable_irq_nosync(unsigned int irq);
extern void disable_irq(unsigned int irq);
extern void enable_irq(unsigned int irq);
# 120 "include/linux/interrupt.h"
static inline __attribute__((always_inline)) void disable_irq_nosync_lockdep(unsigned int irq)
{
        disable_irq_nosync(irq);



}

static inline __attribute__((always_inline)) void disable_irq_nosync_lockdep_irqsave(unsigned int irq, unsigned long *flags)
{
        disable_irq_nosync(irq);



}

static inline __attribute__((always_inline)) void disable_irq_lockdep(unsigned int irq)
{
        disable_irq(irq);



}

static inline __attribute__((always_inline)) void enable_irq_lockdep(unsigned int irq)
{



        enable_irq(irq);
}

static inline __attribute__((always_inline)) void enable_irq_lockdep_irqrestore(unsigned int irq, unsigned long *flags)
{



        enable_irq(irq);
}


extern int set_irq_wake(unsigned int irq, unsigned int on);

static inline __attribute__((always_inline)) int enable_irq_wake(unsigned int irq)
{
        return set_irq_wake(irq, 1);
}

static inline __attribute__((always_inline)) int disable_irq_wake(unsigned int irq)
{
        return set_irq_wake(irq, 0);
}
# 227 "include/linux/interrupt.h"
enum
{
        HI_SOFTIRQ=0,
        TIMER_SOFTIRQ,
        NET_TX_SOFTIRQ,
        NET_RX_SOFTIRQ,
        BLOCK_SOFTIRQ,
        TASKLET_SOFTIRQ,
        SCHED_SOFTIRQ,
};





struct softirq_action
{
        void (*action)(struct softirq_action *);
        void *data;
};

 __attribute__((regparm(0))) void do_softirq(void);
extern void open_softirq(int nr, void (*action)(struct softirq_action*), void *data);
extern void softirq_init(void);

extern void raise_softirq_irqoff(unsigned int nr) __attribute__((regparm(3)));
extern void raise_softirq(unsigned int nr) __attribute__((regparm(3)));
# 276 "include/linux/interrupt.h"
struct tasklet_struct
{
        struct tasklet_struct *next;
        unsigned long state;
        atomic_t count;
        void (*func)(unsigned long);
        unsigned long data;
};
# 292 "include/linux/interrupt.h"
enum
{
        TASKLET_STATE_SCHED,
        TASKLET_STATE_RUN
};


static inline __attribute__((always_inline)) int tasklet_trylock(struct tasklet_struct *t)
{
        return !test_and_set_bit(TASKLET_STATE_RUN, &(t)->state);
}

static inline __attribute__((always_inline)) void tasklet_unlock(struct tasklet_struct *t)
{
        __asm__ __volatile__("": : :"memory");
        clear_bit(TASKLET_STATE_RUN, &(t)->state);
}

static inline __attribute__((always_inline)) void tasklet_unlock_wait(struct tasklet_struct *t)
{
        while ((__builtin_constant_p(TASKLET_STATE_RUN) ? constant_test_bit((TASKLET_STATE_RUN),(&(t)->state)) : variable_test_bit((TASKLET_STATE_RUN),(&(t)->state)))) { __asm__ __volatile__("": : :"memory"); }
}






extern void __tasklet_schedule(struct tasklet_struct *t) __attribute__((regparm(3)));

static inline __attribute__((always_inline)) void tasklet_schedule(struct tasklet_struct *t)
{
        if (!test_and_set_bit(TASKLET_STATE_SCHED, &t->state))
                __tasklet_schedule(t);
}

extern void __tasklet_hi_schedule(struct tasklet_struct *t) __attribute__((regparm(3)));

static inline __attribute__((always_inline)) void tasklet_hi_schedule(struct tasklet_struct *t)
{
        if (!test_and_set_bit(TASKLET_STATE_SCHED, &t->state))
                __tasklet_hi_schedule(t);
}


static inline __attribute__((always_inline)) void tasklet_disable_nosync(struct tasklet_struct *t)
{
        atomic_inc(&t->count);
        __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((always_inline)) void tasklet_disable(struct tasklet_struct *t)
{
        tasklet_disable_nosync(t);
        tasklet_unlock_wait(t);
        asm volatile ("661:\n\t" "lock; addl $0,0(%%esp)" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "mfence" "\n664:\n" ".previous" :: "i" ((0*32+26)) : "memory");
}

static inline __attribute__((always_inline)) void tasklet_enable(struct tasklet_struct *t)
{
        __asm__ __volatile__("": : :"memory");
        atomic_dec(&t->count);
}

static inline __attribute__((always_inline)) void tasklet_hi_enable(struct tasklet_struct *t)
{
        __asm__ __volatile__("": : :"memory");
        atomic_dec(&t->count);
}

extern void tasklet_kill(struct tasklet_struct *t);
extern void tasklet_kill_immediate(struct tasklet_struct *t, unsigned int cpu);
extern void tasklet_init(struct tasklet_struct *t,
                         void (*func)(unsigned long), unsigned long data);
# 409 "include/linux/interrupt.h"
extern unsigned long probe_irq_on(void);
extern int probe_irq_off(unsigned long);
extern unsigned int probe_irq_mask(unsigned long);
# 103 "include/linux/rtc.h" 2

extern int rtc_month_days(unsigned int month, unsigned int year);
extern int rtc_year_days(unsigned int day, unsigned int month, unsigned int year);
extern int rtc_valid_tm(struct rtc_time *tm);
extern int rtc_tm_to_time(struct rtc_time *tm, unsigned long *time);
extern void rtc_time_to_tm(unsigned long time, struct rtc_time *tm);
extern void rtc_merge_alarm(struct rtc_time *now, struct rtc_time *alarm);

# 1 "include/linux/device.h" 1
# 16 "include/linux/device.h"
# 1 "include/linux/klist.h" 1
# 20 "include/linux/klist.h"
struct klist_node;
struct klist {
        spinlock_t k_lock;
        struct list_head k_list;
        void (*get)(struct klist_node *);
        void (*put)(struct klist_node *);
};


extern void klist_init(struct klist * k, void (*get)(struct klist_node *),
                       void (*put)(struct klist_node *));

struct klist_node {
        struct klist * n_klist;
        struct list_head n_node;
        struct kref n_ref;
        struct completion n_removed;
};

extern void klist_add_tail(struct klist_node * n, struct klist * k);
extern void klist_add_head(struct klist_node * n, struct klist * k);

extern void klist_del(struct klist_node * n);
extern void klist_remove(struct klist_node * n);

extern int klist_node_attached(struct klist_node * n);


struct klist_iter {
        struct klist * i_klist;
        struct list_head * i_head;
        struct klist_node * i_cur;
};


extern void klist_iter_init(struct klist * k, struct klist_iter * i);
extern void klist_iter_init_node(struct klist * k, struct klist_iter * i,
                                 struct klist_node * n);
extern void klist_iter_exit(struct klist_iter * i);
extern struct klist_node * klist_next(struct klist_iter * i);
# 17 "include/linux/device.h" 2







# 1 "include/asm/device.h" 1
# 9 "include/asm/device.h"
struct dev_archdata {

        void *acpi_handle;

};
# 25 "include/linux/device.h" 2







struct device;
struct device_driver;
struct class;
struct class_device;

struct bus_type {
        const char * name;

        struct subsystem subsys;
        struct kset drivers;
        struct kset devices;
        struct klist klist_devices;
        struct klist klist_drivers;

        struct blocking_notifier_head bus_notifier;

        struct bus_attribute * bus_attrs;
        struct device_attribute * dev_attrs;
        struct driver_attribute * drv_attrs;

        int (*match)(struct device * dev, struct device_driver * drv);
        int (*uevent)(struct device *dev, char **envp,
                                  int num_envp, char *buffer, int buffer_size);
        int (*probe)(struct device * dev);
        int (*remove)(struct device * dev);
        void (*shutdown)(struct device * dev);

        int (*suspend)(struct device * dev, pm_message_t state);
        int (*suspend_late)(struct device * dev, pm_message_t state);
        int (*resume_early)(struct device * dev);
        int (*resume)(struct device * dev);
};

extern int bus_register(struct bus_type * bus);
extern void bus_unregister(struct bus_type * bus);

extern int bus_rescan_devices(struct bus_type * bus);



int bus_for_each_dev(struct bus_type * bus, struct device * start, void * data,
                     int (*fn)(struct device *, void *));
struct device * bus_find_device(struct bus_type *bus, struct device *start,
                                void *data, int (*match)(struct device *, void *));

int bus_for_each_drv(struct bus_type *bus,
                struct device_driver *start, void *data,
                int (*fn)(struct device_driver *, void *));







struct notifier_block;

extern int bus_register_notifier(struct bus_type *bus,
                                 struct notifier_block *nb);
extern int bus_unregister_notifier(struct bus_type *bus,
                                   struct notifier_block *nb);
# 106 "include/linux/device.h"
struct bus_attribute {
        struct attribute attr;
        ssize_t (*show)(struct bus_type *, char * buf);
        ssize_t (*store)(struct bus_type *, const char * buf, size_t count);
};




extern int bus_create_file(struct bus_type *,
                                        struct bus_attribute *);
extern void bus_remove_file(struct bus_type *, struct bus_attribute *);

struct device_driver {
        const char * name;
        struct bus_type * bus;

        struct completion unloaded;
        struct kobject kobj;
        struct klist klist_devices;
        struct klist_node knode_bus;

        struct module * owner;

        int (*probe) (struct device * dev);
        int (*remove) (struct device * dev);
        void (*shutdown) (struct device * dev);
        int (*suspend) (struct device * dev, pm_message_t state);
        int (*resume) (struct device * dev);

        unsigned int multithread_probe:1;
};


extern int driver_register(struct device_driver * drv);
extern void driver_unregister(struct device_driver * drv);

extern struct device_driver * get_driver(struct device_driver * drv);
extern void put_driver(struct device_driver * drv);
extern struct device_driver *driver_find(const char *name, struct bus_type *bus);
extern int driver_probe_done(void);



struct driver_attribute {
        struct attribute attr;
        ssize_t (*show)(struct device_driver *, char * buf);
        ssize_t (*store)(struct device_driver *, const char * buf, size_t count);
};




extern int driver_create_file(struct device_driver *,
                                        struct driver_attribute *);
extern void driver_remove_file(struct device_driver *, struct driver_attribute *);

extern int driver_for_each_device(struct device_driver * drv,
                struct device *start, void *data,
                int (*fn)(struct device *, void *));
struct device * driver_find_device(struct device_driver *drv,
                                   struct device *start, void *data,
                                   int (*match)(struct device *, void *));




struct class {
        const char * name;
        struct module * owner;

        struct subsystem subsys;
        struct list_head children;
        struct list_head devices;
        struct list_head interfaces;
        struct semaphore sem;

        struct kobject *virtual_dir;

        struct class_attribute * class_attrs;
        struct class_device_attribute * class_dev_attrs;
        struct device_attribute * dev_attrs;

        int (*uevent)(struct class_device *dev, char **envp,
                           int num_envp, char *buffer, int buffer_size);
        int (*dev_uevent)(struct device *dev, char **envp, int num_envp,
                                char *buffer, int buffer_size);

        void (*release)(struct class_device *dev);
        void (*class_release)(struct class *class);
        void (*dev_release)(struct device *dev);

        int (*suspend)(struct device *, pm_message_t state);
        int (*resume)(struct device *);
};

extern int class_register(struct class *);
extern void class_unregister(struct class *);


struct class_attribute {
        struct attribute attr;
        ssize_t (*show)(struct class *, char * buf);
        ssize_t (*store)(struct class *, const char * buf, size_t count);
};




extern int class_create_file(struct class *,
                                        const struct class_attribute *);
extern void class_remove_file(struct class *, const struct class_attribute *);

struct class_device_attribute {
        struct attribute attr;
        ssize_t (*show)(struct class_device *, char * buf);
        ssize_t (*store)(struct class_device *, const char * buf, size_t count);
};





extern int class_device_create_file(struct class_device *,
                                    const struct class_device_attribute *);
# 257 "include/linux/device.h"
struct class_device {
        struct list_head node;

        struct kobject kobj;
        struct class * class;
        dev_t devt;
        struct class_device_attribute *devt_attr;
        struct class_device_attribute uevent_attr;
        struct device * dev;
        void * class_data;
        struct class_device *parent;
        struct attribute_group ** groups;

        void (*release)(struct class_device *dev);
        int (*uevent)(struct class_device *dev, char **envp,
                           int num_envp, char *buffer, int buffer_size);
        char class_id[20];
};

static inline __attribute__((always_inline)) void *
class_get_devdata (struct class_device *dev)
{
        return dev->class_data;
}

static inline __attribute__((always_inline)) void
class_set_devdata (struct class_device *dev, void *data)
{
        dev->class_data = data;
}


extern int class_device_register(struct class_device *);
extern void class_device_unregister(struct class_device *);
extern void class_device_initialize(struct class_device *);
extern int class_device_add(struct class_device *);
extern void class_device_del(struct class_device *);

extern int class_device_rename(struct class_device *, char *);

extern struct class_device * class_device_get(struct class_device *);
extern void class_device_put(struct class_device *);

extern void class_device_remove_file(struct class_device *,
                                     const struct class_device_attribute *);
extern int class_device_create_bin_file(struct class_device *,
                                        struct bin_attribute *);
extern void class_device_remove_bin_file(struct class_device *,
                                         struct bin_attribute *);

struct class_interface {
        struct list_head node;
        struct class *class;

        int (*add) (struct class_device *, struct class_interface *);
        void (*remove) (struct class_device *, struct class_interface *);
        int (*add_dev) (struct device *, struct class_interface *);
        void (*remove_dev) (struct device *, struct class_interface *);
};

extern int class_interface_register(struct class_interface *);
extern void class_interface_unregister(struct class_interface *);

extern struct class *class_create(struct module *owner, const char *name);
extern void class_destroy(struct class *cls);
extern struct class_device *class_device_create(struct class *cls,
                                                struct class_device *parent,
                                                dev_t devt,
                                                struct device *device,
                                                const char *fmt, ...)
                                        __attribute__((format(printf,5,6)));
extern void class_device_destroy(struct class *cls, dev_t devt);


struct device_attribute {
        struct attribute attr;
        ssize_t (*show)(struct device *dev, struct device_attribute *attr,
                        char *buf);
        ssize_t (*store)(struct device *dev, struct device_attribute *attr,
                         const char *buf, size_t count);
};




extern int device_create_file(struct device *device,
                                        struct device_attribute * entry);
extern void device_remove_file(struct device * dev, struct device_attribute * attr);
extern int device_create_bin_file(struct device *dev,
                                               struct bin_attribute *attr);
extern void device_remove_bin_file(struct device *dev,
                                   struct bin_attribute *attr);
struct device {
        struct klist klist_children;
        struct klist_node knode_parent;
        struct klist_node knode_driver;
        struct klist_node knode_bus;
        struct device * parent;

        struct kobject kobj;
        char bus_id[20];
        unsigned is_registered:1;
        struct device_attribute uevent_attr;
        struct device_attribute *devt_attr;

        struct semaphore sem;



        struct bus_type * bus;
        struct device_driver *driver;

        void *driver_data;
        void *platform_data;

        struct dev_pm_info power;




        u64 *dma_mask;
        u64 coherent_dma_mask;





        struct list_head dma_pools;

        struct dma_coherent_mem *dma_mem;


        struct dev_archdata archdata;


        struct list_head node;
        struct class *class;
        dev_t devt;
        struct attribute_group **groups;

        void (*release)(struct device * dev);
};
# 410 "include/linux/device.h"
static inline __attribute__((always_inline)) int dev_to_node(struct device *dev)
{
        return -1;
}
static inline __attribute__((always_inline)) void set_dev_node(struct device *dev, int node)
{
}


static inline __attribute__((always_inline)) void *
dev_get_drvdata (struct device *dev)
{
        return dev->driver_data;
}

static inline __attribute__((always_inline)) void
dev_set_drvdata (struct device *dev, void *data)
{
        dev->driver_data = data;
}

static inline __attribute__((always_inline)) int device_is_registered(struct device *dev)
{
        return dev->is_registered;
}

void driver_init(void);




extern int device_register(struct device * dev);
extern void device_unregister(struct device * dev);
extern void device_initialize(struct device * dev);
extern int device_add(struct device * dev);
extern void device_del(struct device * dev);
extern int device_for_each_child(struct device *, void *,
                     int (*fn)(struct device *, void *));
extern struct device *device_find_child(struct device *, void *data,
                                        int (*match)(struct device *, void *));
extern int device_rename(struct device *dev, char *new_name);
extern int device_move(struct device *dev, struct device *new_parent);





extern int device_bind_driver(struct device *dev);
extern void device_release_driver(struct device * dev);
extern int device_attach(struct device * dev);
extern int driver_attach(struct device_driver *drv);
extern int device_reprobe(struct device *dev);




extern struct device *device_create(struct class *cls, struct device *parent,
                                    dev_t devt, const char *fmt, ...)
                                    __attribute__((format(printf,4,5)));
extern void device_destroy(struct class *cls, dev_t devt);







extern int (*platform_notify)(struct device * dev);

extern int (*platform_notify_remove)(struct device * dev);






extern struct device * get_device(struct device * dev);
extern void put_device(struct device * dev);



extern void device_shutdown(void);



extern int firmware_register(struct subsystem *);
extern void firmware_unregister(struct subsystem *);


extern const char *dev_driver_string(struct device *dev);
# 112 "include/linux/rtc.h" 2
# 1 "include/linux/seq_file.h" 1
# 9 "include/linux/seq_file.h"
struct seq_operations;
struct file;
struct vfsmount;
struct dentry;
struct inode;

struct seq_file {
        char *buf;
        size_t size;
        size_t from;
        size_t count;
        loff_t index;
        loff_t version;
        struct mutex lock;
        const struct seq_operations *op;
        void *private;
};

struct seq_operations {
        void * (*start) (struct seq_file *m, loff_t *pos);
        void (*stop) (struct seq_file *m, void *v);
        void * (*next) (struct seq_file *m, void *v, loff_t *pos);
        int (*show) (struct seq_file *m, void *v);
};

int seq_open(struct file *, const struct seq_operations *);
ssize_t seq_read(struct file *, char *, size_t, loff_t *);
loff_t seq_lseek(struct file *, loff_t, int);
int seq_release(struct inode *, struct file *);
int seq_escape(struct seq_file *, const char *, const char *);
int seq_putc(struct seq_file *m, char c);
int seq_puts(struct seq_file *m, const char *s);

int seq_printf(struct seq_file *, const char *, ...)
        __attribute__ ((format (printf,2,3)));

int seq_path(struct seq_file *, struct vfsmount *, struct dentry *, char *);

int single_open(struct file *, int (*)(struct seq_file *, void *), void *);
int single_release(struct inode *, struct file *);
int seq_release_private(struct inode *, struct file *);
# 113 "include/linux/rtc.h" 2

# 1 "include/linux/poll.h" 1



# 1 "include/asm/poll.h" 1
# 21 "include/asm/poll.h"
struct pollfd {
        int fd;
        short events;
        short revents;
};
# 5 "include/linux/poll.h" 2
# 13 "include/linux/poll.h"
# 1 "include/asm/uaccess.h" 1
# 40 "include/asm/uaccess.h"
extern struct movsl_mask {
        int mask;
} __attribute__((__aligned__((1 << (7))))) movsl_mask;
# 98 "include/asm/uaccess.h"
struct exception_table_entry
{
        unsigned long insn, fixup;
};

extern int fixup_exception(struct pt_regs *regs);
# 120 "include/asm/uaccess.h"
extern void __get_user_1(void);
extern void __get_user_2(void);
extern void __get_user_4(void);
# 162 "include/asm/uaccess.h"
extern void __put_user_bad(void);





extern void __put_user_1(void);
extern void __put_user_2(void);
extern void __put_user_4(void);
extern void __put_user_8(void);
# 325 "include/asm/uaccess.h"
struct __large_struct { unsigned long buf[100]; };
# 358 "include/asm/uaccess.h"
extern long __get_user_bad(void);
# 389 "include/asm/uaccess.h"
unsigned long __copy_to_user_ll(void *to,
                                const void *from, unsigned long n);
unsigned long __copy_from_user_ll(void *to,
                                const void *from, unsigned long n);
unsigned long __copy_from_user_ll_nozero(void *to,
                                const void *from, unsigned long n);
unsigned long __copy_from_user_ll_nocache(void *to,
                                const void *from, unsigned long n);
unsigned long __copy_from_user_ll_nocache_nozero(void *to,
                                const void *from, unsigned long n);
# 407 "include/asm/uaccess.h"
static inline __attribute__((always_inline)) __attribute__((always_inline)) unsigned long
__copy_to_user_inatomic(void *to, const void *from, unsigned long n)
{
        if (__builtin_constant_p(n)) {
                unsigned long ret;

                switch (n) {
                case 1:
                        do { ret = 0; (void)0; switch (1) { case 1: __asm__ __volatile__( "1:	mov""b"" %""b""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "iq" (*(u8 *)from), "m"((*(struct __large_struct *)((u8 *)to))), "i"(1), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %""w""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "ir" (*(u8 *)from), "m"((*(struct __large_struct *)((u8 *)to))), "i"(1), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %""""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "ir" (*(u8 *)from), "m"((*(struct __large_struct *)((u8 *)to))), "i"(1), "0"(ret)); break; case 8: __asm__ __volatile__( "1:	movl %%eax,0(%2)\n" "2:	movl %%edx,4(%2)\n" "3:\n" ".section .fixup,\"ax\"\n" "4:	movl %3,%0\n" "	jmp 3b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,4b\n" "	.long 2b,4b\n" ".previous" : "=r"(ret) : "A" ((__typeof__(*(u8 *)to))(*(u8 *)from)), "r" ((u8 *)to), "i"(-14), "0"(ret)); break; default: __put_user_bad(); } } while (0);
                        return ret;
                case 2:
                        do { ret = 0; (void)0; switch (2) { case 1: __asm__ __volatile__( "1:	mov""b"" %""b""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "iq" (*(u16 *)from), "m"((*(struct __large_struct *)((u16 *)to))), "i"(2), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %""w""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "ir" (*(u16 *)from), "m"((*(struct __large_struct *)((u16 *)to))), "i"(2), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %""""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "ir" (*(u16 *)from), "m"((*(struct __large_struct *)((u16 *)to))), "i"(2), "0"(ret)); break; case 8: __asm__ __volatile__( "1:	movl %%eax,0(%2)\n" "2:	movl %%edx,4(%2)\n" "3:\n" ".section .fixup,\"ax\"\n" "4:	movl %3,%0\n" "	jmp 3b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,4b\n" "	.long 2b,4b\n" ".previous" : "=r"(ret) : "A" ((__typeof__(*(u16 *)to))(*(u16 *)from)), "r" ((u16 *)to), "i"(-14), "0"(ret)); break; default: __put_user_bad(); } } while (0);
                        return ret;
                case 4:
                        do { ret = 0; (void)0; switch (4) { case 1: __asm__ __volatile__( "1:	mov""b"" %""b""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "iq" (*(u32 *)from), "m"((*(struct __large_struct *)((u32 *)to))), "i"(4), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %""w""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "ir" (*(u32 *)from), "m"((*(struct __large_struct *)((u32 *)to))), "i"(4), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %""""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "ir" (*(u32 *)from), "m"((*(struct __large_struct *)((u32 *)to))), "i"(4), "0"(ret)); break; case 8: __asm__ __volatile__( "1:	movl %%eax,0(%2)\n" "2:	movl %%edx,4(%2)\n" "3:\n" ".section .fixup,\"ax\"\n" "4:	movl %3,%0\n" "	jmp 3b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,4b\n" "	.long 2b,4b\n" ".previous" : "=r"(ret) : "A" ((__typeof__(*(u32 *)to))(*(u32 *)from)), "r" ((u32 *)to), "i"(-14), "0"(ret)); break; default: __put_user_bad(); } } while (0);
                        return ret;
                }
        }
        return __copy_to_user_ll(to, from, n);
}
# 442 "include/asm/uaccess.h"
static inline __attribute__((always_inline)) __attribute__((always_inline)) unsigned long
__copy_to_user(void *to, const void *from, unsigned long n)
{
       do { cond_resched(); } while (0);
       return __copy_to_user_inatomic(to, from, n);
}

static inline __attribute__((always_inline)) __attribute__((always_inline)) unsigned long
__copy_from_user_inatomic(void *to, const void *from, unsigned long n)
{





        if (__builtin_constant_p(n)) {
                unsigned long ret;

                switch (n) {
                case 1:
                        do { ret = 0; (void)0; switch (1) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=q" (*(u8 *)to) : "m"((*(struct __large_struct *)(from))), "i"(1), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u8 *)to) : "m"((*(struct __large_struct *)(from))), "i"(1), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u8 *)to) : "m"((*(struct __large_struct *)(from))), "i"(1), "0"(ret));break; default: (*(u8 *)to) = __get_user_bad(); } } while (0);
                        return ret;
                case 2:
                        do { ret = 0; (void)0; switch (2) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=q" (*(u16 *)to) : "m"((*(struct __large_struct *)(from))), "i"(2), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u16 *)to) : "m"((*(struct __large_struct *)(from))), "i"(2), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u16 *)to) : "m"((*(struct __large_struct *)(from))), "i"(2), "0"(ret));break; default: (*(u16 *)to) = __get_user_bad(); } } while (0);
                        return ret;
                case 4:
                        do { ret = 0; (void)0; switch (4) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=q" (*(u32 *)to) : "m"((*(struct __large_struct *)(from))), "i"(4), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u32 *)to) : "m"((*(struct __large_struct *)(from))), "i"(4), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u32 *)to) : "m"((*(struct __large_struct *)(from))), "i"(4), "0"(ret));break; default: (*(u32 *)to) = __get_user_bad(); } } while (0);
                        return ret;
                }
        }
        return __copy_from_user_ll_nozero(to, from, n);
}
# 497 "include/asm/uaccess.h"
static inline __attribute__((always_inline)) __attribute__((always_inline)) unsigned long
__copy_from_user(void *to, const void *from, unsigned long n)
{
        do { cond_resched(); } while (0);
        if (__builtin_constant_p(n)) {
                unsigned long ret;

                switch (n) {
                case 1:
                        do { ret = 0; (void)0; switch (1) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=q" (*(u8 *)to) : "m"((*(struct __large_struct *)(from))), "i"(1), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u8 *)to) : "m"((*(struct __large_struct *)(from))), "i"(1), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u8 *)to) : "m"((*(struct __large_struct *)(from))), "i"(1), "0"(ret));break; default: (*(u8 *)to) = __get_user_bad(); } } while (0);
                        return ret;
                case 2:
                        do { ret = 0; (void)0; switch (2) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=q" (*(u16 *)to) : "m"((*(struct __large_struct *)(from))), "i"(2), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u16 *)to) : "m"((*(struct __large_struct *)(from))), "i"(2), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u16 *)to) : "m"((*(struct __large_struct *)(from))), "i"(2), "0"(ret));break; default: (*(u16 *)to) = __get_user_bad(); } } while (0);
                        return ret;
                case 4:
                        do { ret = 0; (void)0; switch (4) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=q" (*(u32 *)to) : "m"((*(struct __large_struct *)(from))), "i"(4), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u32 *)to) : "m"((*(struct __large_struct *)(from))), "i"(4), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u32 *)to) : "m"((*(struct __large_struct *)(from))), "i"(4), "0"(ret));break; default: (*(u32 *)to) = __get_user_bad(); } } while (0);
                        return ret;
                }
        }
        return __copy_from_user_ll(to, from, n);
}



static inline __attribute__((always_inline)) __attribute__((always_inline)) unsigned long __copy_from_user_nocache(void *to,
                                const void *from, unsigned long n)
{
        do { cond_resched(); } while (0);
        if (__builtin_constant_p(n)) {
                unsigned long ret;

                switch (n) {
                case 1:
                        do { ret = 0; (void)0; switch (1) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=q" (*(u8 *)to) : "m"((*(struct __large_struct *)(from))), "i"(1), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u8 *)to) : "m"((*(struct __large_struct *)(from))), "i"(1), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u8 *)to) : "m"((*(struct __large_struct *)(from))), "i"(1), "0"(ret));break; default: (*(u8 *)to) = __get_user_bad(); } } while (0);
                        return ret;
                case 2:
                        do { ret = 0; (void)0; switch (2) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=q" (*(u16 *)to) : "m"((*(struct __large_struct *)(from))), "i"(2), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u16 *)to) : "m"((*(struct __large_struct *)(from))), "i"(2), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u16 *)to) : "m"((*(struct __large_struct *)(from))), "i"(2), "0"(ret));break; default: (*(u16 *)to) = __get_user_bad(); } } while (0);
                        return ret;
                case 4:
                        do { ret = 0; (void)0; switch (4) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=q" (*(u32 *)to) : "m"((*(struct __large_struct *)(from))), "i"(4), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u32 *)to) : "m"((*(struct __large_struct *)(from))), "i"(4), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u32 *)to) : "m"((*(struct __large_struct *)(from))), "i"(4), "0"(ret));break; default: (*(u32 *)to) = __get_user_bad(); } } while (0);
                        return ret;
                }
        }
        return __copy_from_user_ll_nocache(to, from, n);
}

static inline __attribute__((always_inline)) __attribute__((always_inline)) unsigned long
__copy_from_user_inatomic_nocache(void *to, const void *from, unsigned long n)
{
       return __copy_from_user_ll_nocache_nozero(to, from, n);
}

unsigned long copy_to_user(void *to,
                                const void *from, unsigned long n);
unsigned long copy_from_user(void *to,
                                const void *from, unsigned long n);
long strncpy_from_user(char *dst, const char *src,
                                long count);
long __strncpy_from_user(char *dst,
                                const char *src, long count);
# 574 "include/asm/uaccess.h"
long strnlen_user(const char *str, long n);
unsigned long clear_user(void *mem, unsigned long len);
unsigned long __clear_user(void *mem, unsigned long len);
# 14 "include/linux/poll.h" 2
# 24 "include/linux/poll.h"
struct poll_table_struct;




typedef void (*poll_queue_proc)(struct file *, wait_queue_head_t *, struct poll_table_struct *);

typedef struct poll_table_struct {
        poll_queue_proc qproc;
} poll_table;

static inline __attribute__((always_inline)) void poll_wait(struct file * filp, wait_queue_head_t * wait_address, poll_table *p)
{
        if (p && wait_address)
                p->qproc(filp, wait_address, p);
}

static inline __attribute__((always_inline)) void init_poll_funcptr(poll_table *pt, poll_queue_proc qproc)
{
        pt->qproc = qproc;
}

struct poll_table_entry {
        struct file * filp;
        wait_queue_t wait;
        wait_queue_head_t * wait_address;
};




struct poll_wqueues {
        poll_table pt;
        struct poll_table_page * table;
        int error;
        int inline_index;
        struct poll_table_entry inline_entries[((832 - 256) / sizeof(struct poll_table_entry))];
};

extern void poll_initwait(struct poll_wqueues *pwq);
extern void poll_freewait(struct poll_wqueues *pwq);





typedef struct {
        unsigned long *in, *out, *ex;
        unsigned long *res_in, *res_out, *res_ex;
} fd_set_bits;
# 88 "include/linux/poll.h"
static inline __attribute__((always_inline))
int get_fd_set(unsigned long nr, void *ufdset, unsigned long *fdset)
{
        nr = ((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long));
        if (ufdset)
                return copy_from_user(fdset, ufdset, nr) ? -14 : 0;

        (__builtin_constant_p(0) ? (__builtin_constant_p((nr)) ? __constant_c_and_count_memset(((fdset)),((0x01010101UL*(unsigned char)(0))),((nr))) : __constant_c_memset(((fdset)),((0x01010101UL*(unsigned char)(0))),((nr)))) : (__builtin_constant_p((nr)) ? __memset_generic((((fdset))),(((0))),(((nr)))) : __memset_generic(((fdset)),((0)),((nr)))));
        return 0;
}

static inline __attribute__((always_inline)) unsigned long
set_fd_set(unsigned long nr, void *ufdset, unsigned long *fdset)
{
        if (ufdset)
                return __copy_to_user(ufdset, fdset, ((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long)));
        return 0;
}

static inline __attribute__((always_inline))
void zero_fd_set(unsigned long nr, unsigned long *fdset)
{
        (__builtin_constant_p(0) ? (__builtin_constant_p((((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long)))) ? __constant_c_and_count_memset(((fdset)),((0x01010101UL*(unsigned char)(0))),((((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long))))) : __constant_c_memset(((fdset)),((0x01010101UL*(unsigned char)(0))),((((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long)))))) : (__builtin_constant_p((((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long)))) ? __memset_generic((((fdset))),(((0))),(((((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long)))))) : __memset_generic(((fdset)),((0)),((((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long)))))));
}



extern int do_select(int n, fd_set_bits *fds, s64 *timeout);
extern int do_sys_poll(struct pollfd * ufds, unsigned int nfds,
                       s64 *timeout);
# 115 "include/linux/rtc.h" 2


extern struct class *rtc_class;

struct rtc_class_ops {
        int (*open)(struct device *);
        void (*release)(struct device *);
        int (*ioctl)(struct device *, unsigned int, unsigned long);
        int (*read_time)(struct device *, struct rtc_time *);
        int (*set_time)(struct device *, struct rtc_time *);
        int (*read_alarm)(struct device *, struct rtc_wkalrm *);
        int (*set_alarm)(struct device *, struct rtc_wkalrm *);
        int (*proc)(struct device *, struct seq_file *);
        int (*set_mmss)(struct device *, unsigned long secs);
        int (*irq_set_state)(struct device *, int enabled);
        int (*irq_set_freq)(struct device *, int freq);
        int (*read_callback)(struct device *, int data);
};


struct rtc_task;

struct rtc_device
{
        struct class_device class_dev;
        struct module *owner;

        int id;
        char name[20];

        const struct rtc_class_ops *ops;
        struct mutex ops_lock;

        struct class_device *rtc_dev;
        struct cdev char_dev;
        struct mutex char_lock;

        unsigned long irq_data;
        spinlock_t irq_lock;
        wait_queue_head_t irq_queue;
        struct fasync_struct *async_queue;

        struct rtc_task *irq_task;
        spinlock_t irq_task_lock;
        int irq_freq;
        int max_user_freq;
# 171 "include/linux/rtc.h"
};


extern struct rtc_device *rtc_device_register(const char *name,
                                        struct device *dev,
                                        const struct rtc_class_ops *ops,
                                        struct module *owner);
extern void rtc_device_unregister(struct rtc_device *rdev);
extern int rtc_interface_register(struct class_interface *intf);

extern int rtc_read_time(struct class_device *class_dev, struct rtc_time *tm);
extern int rtc_set_time(struct class_device *class_dev, struct rtc_time *tm);
extern int rtc_set_mmss(struct class_device *class_dev, unsigned long secs);
extern int rtc_read_alarm(struct class_device *class_dev,
                        struct rtc_wkalrm *alrm);
extern int rtc_set_alarm(struct class_device *class_dev,
                                struct rtc_wkalrm *alrm);
extern void rtc_update_irq(struct class_device *class_dev,
                        unsigned long num, unsigned long events);

extern struct class_device *rtc_class_open(char *name);
extern void rtc_class_close(struct class_device *class_dev);

extern int rtc_irq_register(struct class_device *class_dev,
                                struct rtc_task *task);
extern void rtc_irq_unregister(struct class_device *class_dev,
                                struct rtc_task *task);
extern int rtc_irq_set_state(struct class_device *class_dev,
                                struct rtc_task *task, int enabled);
extern int rtc_irq_set_freq(struct class_device *class_dev,
                                struct rtc_task *task, int freq);

typedef struct rtc_task {
        void (*func)(void *private_data);
        void *private_data;
} rtc_task_t;

int rtc_register(rtc_task_t *task);
int rtc_unregister(rtc_task_t *task);
int rtc_control(rtc_task_t *t, unsigned int cmd, unsigned long arg);
void rtc_get_rtc_time(struct rtc_time *rtc_tm);
irqreturn_t rtc_interrupt(int irq, void *dev_id);
# 20 "include/linux/efi.h" 2
# 33 "include/linux/efi.h"
typedef unsigned long efi_status_t;
typedef u8 efi_bool_t;
typedef u16 efi_char16_t;


typedef struct {
        u8 b[16];
} efi_guid_t;
# 52 "include/linux/efi.h"
typedef struct {
        u64 signature;
        u32 revision;
        u32 headersize;
        u32 crc32;
        u32 reserved;
} efi_table_hdr_t;
# 94 "include/linux/efi.h"
typedef struct {
        u32 type;
        u32 pad;
        u64 phys_addr;
        u64 virt_addr;
        u64 num_pages;
        u64 attribute;
} efi_memory_desc_t;

typedef int (*efi_freemem_callback_t) (unsigned long start, unsigned long end, void *arg);
# 112 "include/linux/efi.h"
typedef struct {
        u16 year;
        u8 month;
        u8 day;
        u8 hour;
        u8 minute;
        u8 second;
        u8 pad1;
        u32 nanosecond;
        s16 timezone;
        u8 daylight;
        u8 pad2;
} efi_time_t;

typedef struct {
        u32 resolution;
        u32 accuracy;
        u8 sets_to_zero;
} efi_time_cap_t;
# 145 "include/linux/efi.h"
typedef struct {
        efi_table_hdr_t hdr;
        unsigned long get_time;
        unsigned long set_time;
        unsigned long get_wakeup_time;
        unsigned long set_wakeup_time;
        unsigned long set_virtual_address_map;
        unsigned long convert_pointer;
        unsigned long get_variable;
        unsigned long get_next_variable;
        unsigned long set_variable;
        unsigned long get_next_high_mono_count;
        unsigned long reset_system;
} efi_runtime_services_t;

typedef efi_status_t efi_get_time_t (efi_time_t *tm, efi_time_cap_t *tc);
typedef efi_status_t efi_set_time_t (efi_time_t *tm);
typedef efi_status_t efi_get_wakeup_time_t (efi_bool_t *enabled, efi_bool_t *pending,
                                            efi_time_t *tm);
typedef efi_status_t efi_set_wakeup_time_t (efi_bool_t enabled, efi_time_t *tm);
typedef efi_status_t efi_get_variable_t (efi_char16_t *name, efi_guid_t *vendor, u32 *attr,
                                         unsigned long *data_size, void *data);
typedef efi_status_t efi_get_next_variable_t (unsigned long *name_size, efi_char16_t *name,
                                              efi_guid_t *vendor);
typedef efi_status_t efi_set_variable_t (efi_char16_t *name, efi_guid_t *vendor,
                                         unsigned long attr, unsigned long data_size,
                                         void *data);
typedef efi_status_t efi_get_next_high_mono_count_t (u32 *count);
typedef void efi_reset_system_t (int reset_type, efi_status_t status,
                                 unsigned long data_size, efi_char16_t *data);
typedef efi_status_t efi_set_virtual_address_map_t (unsigned long memory_map_size,
                                                unsigned long descriptor_size,
                                                u32 descriptor_version,
                                                efi_memory_desc_t *virtual_map);
# 210 "include/linux/efi.h"
typedef struct {
        efi_guid_t guid;
        unsigned long table;
} efi_config_table_t;




typedef struct {
        efi_table_hdr_t hdr;
        unsigned long fw_vendor;
        u32 fw_revision;
        unsigned long con_in_handle;
        unsigned long con_in;
        unsigned long con_out_handle;
        unsigned long con_out;
        unsigned long stderr_handle;
        unsigned long stderr;
        efi_runtime_services_t *runtime;
        unsigned long boottime;
        unsigned long nr_tables;
        unsigned long tables;
} efi_system_table_t;

struct efi_memory_map {
        void *phys_map;
        void *map;
        void *map_end;
        int nr_map;
        unsigned long desc_version;
        unsigned long desc_size;
};






extern struct efi {
        efi_system_table_t *systab;
        unsigned long mps;
        unsigned long acpi;
        unsigned long acpi20;
        unsigned long smbios;
        unsigned long sal_systab;
        unsigned long boot_info;
        unsigned long hcdp;
        unsigned long uga;
        efi_get_time_t *get_time;
        efi_set_time_t *set_time;
        efi_get_wakeup_time_t *get_wakeup_time;
        efi_set_wakeup_time_t *set_wakeup_time;
        efi_get_variable_t *get_variable;
        efi_get_next_variable_t *get_next_variable;
        efi_set_variable_t *set_variable;
        efi_get_next_high_mono_count_t *get_next_high_mono_count;
        efi_reset_system_t *reset_system;
        efi_set_virtual_address_map_t *set_virtual_address_map;
} efi;

static inline __attribute__((always_inline)) int
efi_guidcmp (efi_guid_t left, efi_guid_t right)
{
        return __builtin_memcmp(&left, &right, sizeof (efi_guid_t));
}

static inline __attribute__((always_inline)) char *
efi_guid_unparse(efi_guid_t *guid, char *out)
{
        sprintf(out, "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x",
                guid->b[3], guid->b[2], guid->b[1], guid->b[0],
                guid->b[5], guid->b[4], guid->b[7], guid->b[6],
                guid->b[8], guid->b[9], guid->b[10], guid->b[11],
                guid->b[12], guid->b[13], guid->b[14], guid->b[15]);
        return out;
}

extern void efi_init (void);
extern void *efi_get_pal_addr (void);
extern void efi_map_pal_code (void);
extern void efi_map_memmap(void);
extern void efi_memmap_walk (efi_freemem_callback_t callback, void *arg);
extern void efi_gettimeofday (struct timespec *ts);
extern void efi_enter_virtual_mode (void);
extern u64 efi_get_iobase (void);
extern u32 efi_mem_type (unsigned long phys_addr);
extern u64 efi_mem_attributes (unsigned long phys_addr);
extern u64 efi_mem_attribute (unsigned long phys_addr, unsigned long size);
extern int efi_mem_attribute_range (unsigned long phys_addr, unsigned long size,
                                    u64 attr);
extern int __attribute__ ((__section__ (".init.text"))) efi_uart_console_only (void);
extern void efi_initialize_iomem_resources(struct resource *code_resource,
                                        struct resource *data_resource);
extern unsigned long efi_get_time(void);
extern int efi_set_rtc_mmss(unsigned long nowtime);
extern int is_available_memory(efi_memory_desc_t * md);
extern struct efi_memory_map memmap;
# 316 "include/linux/efi.h"
static inline __attribute__((always_inline)) int efi_range_is_wc(unsigned long start, unsigned long len)
{
        unsigned long i;

        for (i = 0; i < len; i += (1UL << 12)) {
                unsigned long paddr = ((unsigned long)(start + i)-((unsigned long)((unsigned long)0xC0000000)));
                if (!(efi_mem_attributes(paddr) & ((u64)0x0000000000000002ULL)))
                        return 0;
        }

        return 1;
}
# 392 "include/linux/efi.h"
struct efi_generic_dev_path {
        u8 type;
        u8 sub_type;
        u16 length;
} __attribute ((packed));
# 43 "init/main.c" 2
# 1 "include/linux/taskstats_kern.h" 1
# 10 "include/linux/taskstats_kern.h"
# 1 "include/linux/taskstats.h" 1
# 38 "include/linux/taskstats.h"
struct taskstats {





        __u16 version;
        __u32 ac_exitcode;




        __u8 ac_flag;
        __u8 ac_nice;
# 69 "include/linux/taskstats.h"
        __u64 cpu_count;
        __u64 cpu_delay_total;






        __u64 blkio_count;
        __u64 blkio_delay_total;


        __u64 swapin_count;
        __u64 swapin_delay_total;







        __u64 cpu_run_real_total;







        __u64 cpu_run_virtual_total;




        char ac_comm[32];
        __u8 ac_sched;
        __u8 ac_pad[3];
        __u32 ac_uid;
        __u32 ac_gid;
        __u32 ac_pid;
        __u32 ac_ppid;
        __u32 ac_btime;
        __u64 ac_etime;
        __u64 ac_utime;
        __u64 ac_stime;
        __u64 ac_minflt;
        __u64 ac_majflt;
# 125 "include/linux/taskstats.h"
        __u64 coremem;



        __u64 virtmem;




        __u64 hiwater_rss;
        __u64 hiwater_vm;


        __u64 read_char;
        __u64 write_char;
        __u64 read_syscalls;
        __u64 write_syscalls;




        __u64 read_bytes;
        __u64 write_bytes;
        __u64 cancelled_write_bytes;
};
# 158 "include/linux/taskstats.h"
enum {
        TASKSTATS_CMD_UNSPEC = 0,
        TASKSTATS_CMD_GET,
        TASKSTATS_CMD_NEW,
        __TASKSTATS_CMD_MAX,
};



enum {
        TASKSTATS_TYPE_UNSPEC = 0,
        TASKSTATS_TYPE_PID,
        TASKSTATS_TYPE_TGID,
        TASKSTATS_TYPE_STATS,
        TASKSTATS_TYPE_AGGR_PID,
        TASKSTATS_TYPE_AGGR_TGID,
        __TASKSTATS_TYPE_MAX,
};



enum {
        TASKSTATS_CMD_ATTR_UNSPEC = 0,
        TASKSTATS_CMD_ATTR_PID,
        TASKSTATS_CMD_ATTR_TGID,
        TASKSTATS_CMD_ATTR_REGISTER_CPUMASK,
        TASKSTATS_CMD_ATTR_DEREGISTER_CPUMASK,
        __TASKSTATS_CMD_ATTR_MAX,
};
# 11 "include/linux/taskstats_kern.h" 2

# 1 "include/net/genetlink.h" 1



# 1 "include/linux/genetlink.h" 1



# 1 "include/linux/netlink.h" 1



# 1 "include/linux/socket.h" 1
# 11 "include/linux/socket.h"
struct __kernel_sockaddr_storage {
        unsigned short ss_family;

        char __data[128 - sizeof(unsigned short)];


} __attribute__ ((aligned((__alignof__ (struct sockaddr *)))));



# 1 "include/asm/socket.h" 1



# 1 "include/asm/sockios.h" 1
# 5 "include/asm/socket.h" 2
# 22 "include/linux/socket.h" 2
# 1 "include/linux/sockios.h" 1
# 23 "include/linux/socket.h" 2




extern int sysctl_somaxconn;

struct seq_file;
extern void socket_seq_show(struct seq_file *seq);


typedef unsigned short sa_family_t;





struct sockaddr {
        sa_family_t sa_family;
        char sa_data[14];
};

struct linger {
        int l_onoff;
        int l_linger;
};
# 57 "include/linux/socket.h"
struct msghdr {
        void * msg_name;
        int msg_namelen;
        struct iovec * msg_iov;
        __kernel_size_t msg_iovlen;
        void * msg_control;
        __kernel_size_t msg_controllen;
        unsigned msg_flags;
};







struct cmsghdr {
        __kernel_size_t cmsg_len;
        int cmsg_level;
        int cmsg_type;
};
# 130 "include/linux/socket.h"
static inline __attribute__((always_inline)) struct cmsghdr * __cmsg_nxthdr(void *__ctl, __kernel_size_t __size,
                                               struct cmsghdr *__cmsg)
{
        struct cmsghdr * __ptr;

        __ptr = (struct cmsghdr*)(((unsigned char *) __cmsg) + ( ((__cmsg->cmsg_len)+sizeof(long)-1) & ~(sizeof(long)-1) ));
        if ((unsigned long)((char*)(__ptr+1) - (char *) __ctl) > __size)
                return (struct cmsghdr *)0;

        return __ptr;
}

static inline __attribute__((always_inline)) struct cmsghdr * cmsg_nxthdr (struct msghdr *__msg, struct cmsghdr *__cmsg)
{
        return __cmsg_nxthdr(__msg->msg_control, __msg->msg_controllen, __cmsg);
}







struct ucred {
        __u32 pid;
        __u32 uid;
        __u32 gid;
};
# 290 "include/linux/socket.h"
extern int memcpy_fromiovec(unsigned char *kdata, struct iovec *iov, int len);
extern int memcpy_fromiovecend(unsigned char *kdata, struct iovec *iov,
                                int offset, int len);
extern int csum_partial_copy_fromiovecend(unsigned char *kdata,
                                          struct iovec *iov,
                                          int offset,
                                          unsigned int len, __wsum *csump);

extern int verify_iovec(struct msghdr *m, struct iovec *iov, char *address, int mode);
extern int memcpy_toiovec(struct iovec *v, unsigned char *kdata, int len);
extern int move_addr_to_user(void *kaddr, int klen, void *uaddr, int *ulen);
extern int move_addr_to_kernel(void *uaddr, int ulen, void *kaddr);
extern int put_cmsg(struct msghdr*, int level, int type, int len, void *data);
# 5 "include/linux/netlink.h" 2
# 29 "include/linux/netlink.h"
struct sockaddr_nl
{
        sa_family_t nl_family;
        unsigned short nl_pad;
        __u32 nl_pid;
        __u32 nl_groups;
};

struct nlmsghdr
{
        __u32 nlmsg_len;
        __u16 nlmsg_type;
        __u16 nlmsg_flags;
        __u32 nlmsg_seq;
        __u32 nlmsg_pid;
};
# 94 "include/linux/netlink.h"
struct nlmsgerr
{
        int error;
        struct nlmsghdr msg;
};





struct nl_pktinfo
{
        __u32 group;
};



enum {
        NETLINK_UNCONNECTED = 0,
        NETLINK_CONNECTED,
};
# 125 "include/linux/netlink.h"
struct nlattr
{
        __u16 nla_len;
        __u16 nla_type;
};
# 138 "include/linux/netlink.h"
# 1 "include/linux/skbuff.h" 1
# 25 "include/linux/skbuff.h"
# 1 "include/linux/net.h" 1
# 24 "include/linux/net.h"
struct poll_table_struct;
struct inode;
# 47 "include/linux/net.h"
typedef enum {
        SS_FREE = 0,
        SS_UNCONNECTED,
        SS_CONNECTING,
        SS_CONNECTED,
        SS_DISCONNECTING
} socket_state;





# 1 "include/linux/random.h" 1
# 35 "include/linux/random.h"
struct rand_pool_info {
        int entropy_count;
        int buf_size;
        __u32 buf[0];
};





extern void rand_initialize_irq(int irq);

extern void add_input_randomness(unsigned int type, unsigned int code,
                                 unsigned int value);
extern void add_interrupt_randomness(int irq);

extern void get_random_bytes(void *buf, int nbytes);
void generate_random_uuid(unsigned char uuid_out[16]);

extern __u32 secure_ip_id(__be32 daddr);
extern u32 secure_ipv4_port_ephemeral(__be32 saddr, __be32 daddr, __be16 dport);
extern u32 secure_ipv6_port_ephemeral(const __be32 *saddr, const __be32 *daddr,
                                      __be16 dport);
extern __u32 secure_tcp_sequence_number(__be32 saddr, __be32 daddr,
                                        __be16 sport, __be16 dport);
extern __u32 secure_tcpv6_sequence_number(__be32 *saddr, __be32 *daddr,
                                          __be16 sport, __be16 dport);
extern u64 secure_dccp_sequence_number(__be32 saddr, __be32 daddr,
                                       __be16 sport, __be16 dport);


extern struct file_operations random_fops, urandom_fops;


unsigned int get_random_int(void);
unsigned long randomize_range(unsigned long start, unsigned long end, unsigned long len);

u32 random32(void);
void srandom32(u32 seed);
# 60 "include/linux/net.h" 2
# 83 "include/linux/net.h"
enum sock_type {
        SOCK_STREAM = 1,
        SOCK_DGRAM = 2,
        SOCK_RAW = 3,
        SOCK_RDM = 4,
        SOCK_SEQPACKET = 5,
        SOCK_DCCP = 6,
        SOCK_PACKET = 10,
};
# 108 "include/linux/net.h"
struct socket {
        socket_state state;
        unsigned long flags;
        const struct proto_ops *ops;
        struct fasync_struct *fasync_list;
        struct file *file;
        struct sock *sk;
        wait_queue_head_t wait;
        short type;
};

struct vm_area_struct;
struct page;
struct kiocb;
struct sockaddr;
struct msghdr;
struct module;

struct proto_ops {
        int family;
        struct module *owner;
        int (*release) (struct socket *sock);
        int (*bind) (struct socket *sock,
                                      struct sockaddr *myaddr,
                                      int sockaddr_len);
        int (*connect) (struct socket *sock,
                                      struct sockaddr *vaddr,
                                      int sockaddr_len, int flags);
        int (*socketpair)(struct socket *sock1,
                                      struct socket *sock2);
        int (*accept) (struct socket *sock,
                                      struct socket *newsock, int flags);
        int (*getname) (struct socket *sock,
                                      struct sockaddr *addr,
                                      int *sockaddr_len, int peer);
        unsigned int (*poll) (struct file *file, struct socket *sock,
                                      struct poll_table_struct *wait);
        int (*ioctl) (struct socket *sock, unsigned int cmd,
                                      unsigned long arg);
        int (*compat_ioctl) (struct socket *sock, unsigned int cmd,
                                      unsigned long arg);
        int (*listen) (struct socket *sock, int len);
        int (*shutdown) (struct socket *sock, int flags);
        int (*setsockopt)(struct socket *sock, int level,
                                      int optname, char *optval, int optlen);
        int (*getsockopt)(struct socket *sock, int level,
                                      int optname, char *optval, int *optlen);
        int (*compat_setsockopt)(struct socket *sock, int level,
                                      int optname, char *optval, int optlen);
        int (*compat_getsockopt)(struct socket *sock, int level,
                                      int optname, char *optval, int *optlen);
        int (*sendmsg) (struct kiocb *iocb, struct socket *sock,
                                      struct msghdr *m, size_t total_len);
        int (*recvmsg) (struct kiocb *iocb, struct socket *sock,
                                      struct msghdr *m, size_t total_len,
                                      int flags);
        int (*mmap) (struct file *file, struct socket *sock,
                                      struct vm_area_struct * vma);
        ssize_t (*sendpage) (struct socket *sock, struct page *page,
                                      int offset, size_t size, int flags);
};

struct net_proto_family {
        int family;
        int (*create)(struct socket *sock, int protocol);
        struct module *owner;
};

struct iovec;
struct kvec;

extern int sock_wake_async(struct socket *sk, int how, int band);
extern int sock_register(const struct net_proto_family *fam);
extern void sock_unregister(int family);
extern int sock_create(int family, int type, int proto,
                                 struct socket **res);
extern int sock_create_kern(int family, int type, int proto,
                                      struct socket **res);
extern int sock_create_lite(int family, int type, int proto,
                                      struct socket **res);
extern void sock_release(struct socket *sock);
extern int sock_sendmsg(struct socket *sock, struct msghdr *msg,
                                  size_t len);
extern int sock_recvmsg(struct socket *sock, struct msghdr *msg,
                                  size_t size, int flags);
extern int sock_map_fd(struct socket *sock);
extern struct socket *sockfd_lookup(int fd, int *err);

extern int net_ratelimit(void);




extern int kernel_sendmsg(struct socket *sock, struct msghdr *msg,
                                    struct kvec *vec, size_t num, size_t len);
extern int kernel_recvmsg(struct socket *sock, struct msghdr *msg,
                                    struct kvec *vec, size_t num,
                                    size_t len, int flags);

extern int kernel_bind(struct socket *sock, struct sockaddr *addr,
                       int addrlen);
extern int kernel_listen(struct socket *sock, int backlog);
extern int kernel_accept(struct socket *sock, struct socket **newsock,
                         int flags);
extern int kernel_connect(struct socket *sock, struct sockaddr *addr,
                          int addrlen, int flags);
extern int kernel_getsockname(struct socket *sock, struct sockaddr *addr,
                              int *addrlen);
extern int kernel_getpeername(struct socket *sock, struct sockaddr *addr,
                              int *addrlen);
extern int kernel_getsockopt(struct socket *sock, int level, int optname,
                             char *optval, int *optlen);
extern int kernel_setsockopt(struct socket *sock, int level, int optname,
                             char *optval, int optlen);
extern int kernel_sendpage(struct socket *sock, struct page *page, int offset,
                           size_t size, int flags);
extern int kernel_sock_ioctl(struct socket *sock, int cmd, unsigned long arg);
# 316 "include/linux/net.h"
# 1 "include/linux/sysctl.h" 1
# 32 "include/linux/sysctl.h"
struct file;
struct completion;






struct __sysctl_args {
        int *name;
        int nlen;
        void *oldval;
        size_t *oldlenp;
        void *newval;
        size_t newlen;
        unsigned long __unused[4];
};
# 61 "include/linux/sysctl.h"
enum
{
        CTL_KERN=1,
        CTL_VM=2,
        CTL_NET=3,

        CTL_FS=5,
        CTL_DEBUG=6,
        CTL_DEV=7,
        CTL_BUS=8,
        CTL_ABI=9,
        CTL_CPU=10
};


enum
{
        CTL_BUS_ISA=1
};


enum
{
        INOTIFY_MAX_USER_INSTANCES=1,
        INOTIFY_MAX_USER_WATCHES=2,
        INOTIFY_MAX_QUEUED_EVENTS=3
};


enum
{
        KERN_OSTYPE=1,
        KERN_OSRELEASE=2,
        KERN_OSREV=3,
        KERN_VERSION=4,
        KERN_SECUREMASK=5,
        KERN_PROF=6,
        KERN_NODENAME=7,
        KERN_DOMAINNAME=8,

        KERN_CAP_BSET=14,
        KERN_PANIC=15,
        KERN_REALROOTDEV=16,

        KERN_SPARC_REBOOT=21,
        KERN_CTLALTDEL=22,
        KERN_PRINTK=23,
        KERN_NAMETRANS=24,
        KERN_PPC_HTABRECLAIM=25,
        KERN_PPC_ZEROPAGED=26,
        KERN_PPC_POWERSAVE_NAP=27,
        KERN_MODPROBE=28,
        KERN_SG_BIG_BUFF=29,
        KERN_ACCT=30,
        KERN_PPC_L2CR=31,

        KERN_RTSIGNR=32,
        KERN_RTSIGMAX=33,

        KERN_SHMMAX=34,
        KERN_MSGMAX=35,
        KERN_MSGMNB=36,
        KERN_MSGPOOL=37,
        KERN_SYSRQ=38,
        KERN_MAX_THREADS=39,
        KERN_RANDOM=40,
        KERN_SHMALL=41,
        KERN_MSGMNI=42,
        KERN_SEM=43,
        KERN_SPARC_STOP_A=44,
        KERN_SHMMNI=45,
        KERN_OVERFLOWUID=46,
        KERN_OVERFLOWGID=47,
        KERN_SHMPATH=48,
        KERN_HOTPLUG=49,
        KERN_IEEE_EMULATION_WARNINGS=50,
        KERN_S390_USER_DEBUG_LOGGING=51,
        KERN_CORE_USES_PID=52,
        KERN_TAINTED=53,
        KERN_CADPID=54,
        KERN_PIDMAX=55,
        KERN_CORE_PATTERN=56,
        KERN_PANIC_ON_OOPS=57,
        KERN_HPPA_PWRSW=58,
        KERN_HPPA_UNALIGNED=59,
        KERN_PRINTK_RATELIMIT=60,
        KERN_PRINTK_RATELIMIT_BURST=61,
        KERN_PTY=62,
        KERN_NGROUPS_MAX=63,
        KERN_SPARC_SCONS_PWROFF=64,
        KERN_HZ_TIMER=65,
        KERN_UNKNOWN_NMI_PANIC=66,
        KERN_BOOTLOADER_TYPE=67,
        KERN_RANDOMIZE=68,
        KERN_SETUID_DUMPABLE=69,
        KERN_SPIN_RETRY=70,
        KERN_ACPI_VIDEO_FLAGS=71,
        KERN_IA64_UNALIGNED=72,
        KERN_COMPAT_LOG=73,
        KERN_MAX_LOCK_DEPTH=74,
        KERN_NMI_WATCHDOG=75,
        KERN_PANIC_ON_NMI=76,
};




enum
{
        VM_UNUSED1=1,
        VM_UNUSED2=2,
        VM_UNUSED3=3,
        VM_UNUSED4=4,
        VM_OVERCOMMIT_MEMORY=5,
        VM_UNUSED5=6,
        VM_UNUSED7=7,
        VM_UNUSED8=8,
        VM_UNUSED9=9,
        VM_PAGE_CLUSTER=10,
        VM_DIRTY_BACKGROUND=11,
        VM_DIRTY_RATIO=12,
        VM_DIRTY_WB_CS=13,
        VM_DIRTY_EXPIRE_CS=14,
        VM_NR_PDFLUSH_THREADS=15,
        VM_OVERCOMMIT_RATIO=16,
        VM_PAGEBUF=17,
        VM_HUGETLB_PAGES=18,
        VM_SWAPPINESS=19,
        VM_LOWMEM_RESERVE_RATIO=20,
        VM_MIN_FREE_KBYTES=21,
        VM_MAX_MAP_COUNT=22,
        VM_LAPTOP_MODE=23,
        VM_BLOCK_DUMP=24,
        VM_HUGETLB_GROUP=25,
        VM_VFS_CACHE_PRESSURE=26,
        VM_LEGACY_VA_LAYOUT=27,
        VM_SWAP_TOKEN_TIMEOUT=28,
        VM_DROP_PAGECACHE=29,
        VM_PERCPU_PAGELIST_FRACTION=30,
        VM_ZONE_RECLAIM_MODE=31,
        VM_MIN_UNMAPPED=32,
        VM_PANIC_ON_OOM=33,
        VM_VDSO_ENABLED=34,
        VM_MIN_SLAB=35,
};



enum
{
        NET_CORE=1,
        NET_ETHER=2,
        NET_802=3,
        NET_UNIX=4,
        NET_IPV4=5,
        NET_IPX=6,
        NET_ATALK=7,
        NET_NETROM=8,
        NET_AX25=9,
        NET_BRIDGE=10,
        NET_ROSE=11,
        NET_IPV6=12,
        NET_X25=13,
        NET_TR=14,
        NET_DECNET=15,
        NET_ECONET=16,
        NET_SCTP=17,
        NET_LLC=18,
        NET_NETFILTER=19,
        NET_DCCP=20,
};


enum
{
        RANDOM_POOLSIZE=1,
        RANDOM_ENTROPY_COUNT=2,
        RANDOM_READ_THRESH=3,
        RANDOM_WRITE_THRESH=4,
        RANDOM_BOOT_ID=5,
        RANDOM_UUID=6
};


enum
{
        PTY_MAX=1,
        PTY_NR=2
};


enum
{
        BUS_ISA_MEM_BASE=1,
        BUS_ISA_PORT_BASE=2,
        BUS_ISA_PORT_SHIFT=3
};


enum
{
        NET_CORE_WMEM_MAX=1,
        NET_CORE_RMEM_MAX=2,
        NET_CORE_WMEM_DEFAULT=3,
        NET_CORE_RMEM_DEFAULT=4,

        NET_CORE_MAX_BACKLOG=6,
        NET_CORE_FASTROUTE=7,
        NET_CORE_MSG_COST=8,
        NET_CORE_MSG_BURST=9,
        NET_CORE_OPTMEM_MAX=10,
        NET_CORE_HOT_LIST_LENGTH=11,
        NET_CORE_DIVERT_VERSION=12,
        NET_CORE_NO_CONG_THRESH=13,
        NET_CORE_NO_CONG=14,
        NET_CORE_LO_CONG=15,
        NET_CORE_MOD_CONG=16,
        NET_CORE_DEV_WEIGHT=17,
        NET_CORE_SOMAXCONN=18,
        NET_CORE_BUDGET=19,
        NET_CORE_AEVENT_ETIME=20,
        NET_CORE_AEVENT_RSEQTH=21,
};







enum
{
        NET_UNIX_DESTROY_DELAY=1,
        NET_UNIX_DELETE_DELAY=2,
        NET_UNIX_MAX_DGRAM_QLEN=3,
};


enum
{
        NET_NF_CONNTRACK_MAX=1,
        NET_NF_CONNTRACK_TCP_TIMEOUT_SYN_SENT=2,
        NET_NF_CONNTRACK_TCP_TIMEOUT_SYN_RECV=3,
        NET_NF_CONNTRACK_TCP_TIMEOUT_ESTABLISHED=4,
        NET_NF_CONNTRACK_TCP_TIMEOUT_FIN_WAIT=5,
        NET_NF_CONNTRACK_TCP_TIMEOUT_CLOSE_WAIT=6,
        NET_NF_CONNTRACK_TCP_TIMEOUT_LAST_ACK=7,
        NET_NF_CONNTRACK_TCP_TIMEOUT_TIME_WAIT=8,
        NET_NF_CONNTRACK_TCP_TIMEOUT_CLOSE=9,
        NET_NF_CONNTRACK_UDP_TIMEOUT=10,
        NET_NF_CONNTRACK_UDP_TIMEOUT_STREAM=11,
        NET_NF_CONNTRACK_ICMP_TIMEOUT=12,
        NET_NF_CONNTRACK_GENERIC_TIMEOUT=13,
        NET_NF_CONNTRACK_BUCKETS=14,
        NET_NF_CONNTRACK_LOG_INVALID=15,
        NET_NF_CONNTRACK_TCP_TIMEOUT_MAX_RETRANS=16,
        NET_NF_CONNTRACK_TCP_LOOSE=17,
        NET_NF_CONNTRACK_TCP_BE_LIBERAL=18,
        NET_NF_CONNTRACK_TCP_MAX_RETRANS=19,
        NET_NF_CONNTRACK_SCTP_TIMEOUT_CLOSED=20,
        NET_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_WAIT=21,
        NET_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_ECHOED=22,
        NET_NF_CONNTRACK_SCTP_TIMEOUT_ESTABLISHED=23,
        NET_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_SENT=24,
        NET_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_RECD=25,
        NET_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_ACK_SENT=26,
        NET_NF_CONNTRACK_COUNT=27,
        NET_NF_CONNTRACK_ICMPV6_TIMEOUT=28,
        NET_NF_CONNTRACK_FRAG6_TIMEOUT=29,
        NET_NF_CONNTRACK_FRAG6_LOW_THRESH=30,
        NET_NF_CONNTRACK_FRAG6_HIGH_THRESH=31,
        NET_NF_CONNTRACK_CHECKSUM=32,
};


enum
{

        NET_IPV4_FORWARD=8,
        NET_IPV4_DYNADDR=9,

        NET_IPV4_CONF=16,
        NET_IPV4_NEIGH=17,
        NET_IPV4_ROUTE=18,
        NET_IPV4_FIB_HASH=19,
        NET_IPV4_NETFILTER=20,

        NET_IPV4_TCP_TIMESTAMPS=33,
        NET_IPV4_TCP_WINDOW_SCALING=34,
        NET_IPV4_TCP_SACK=35,
        NET_IPV4_TCP_RETRANS_COLLAPSE=36,
        NET_IPV4_DEFAULT_TTL=37,
        NET_IPV4_AUTOCONFIG=38,
        NET_IPV4_NO_PMTU_DISC=39,
        NET_IPV4_TCP_SYN_RETRIES=40,
        NET_IPV4_IPFRAG_HIGH_THRESH=41,
        NET_IPV4_IPFRAG_LOW_THRESH=42,
        NET_IPV4_IPFRAG_TIME=43,
        NET_IPV4_TCP_MAX_KA_PROBES=44,
        NET_IPV4_TCP_KEEPALIVE_TIME=45,
        NET_IPV4_TCP_KEEPALIVE_PROBES=46,
        NET_IPV4_TCP_RETRIES1=47,
        NET_IPV4_TCP_RETRIES2=48,
        NET_IPV4_TCP_FIN_TIMEOUT=49,
        NET_IPV4_IP_MASQ_DEBUG=50,
        NET_TCP_SYNCOOKIES=51,
        NET_TCP_STDURG=52,
        NET_TCP_RFC1337=53,
        NET_TCP_SYN_TAILDROP=54,
        NET_TCP_MAX_SYN_BACKLOG=55,
        NET_IPV4_LOCAL_PORT_RANGE=56,
        NET_IPV4_ICMP_ECHO_IGNORE_ALL=57,
        NET_IPV4_ICMP_ECHO_IGNORE_BROADCASTS=58,
        NET_IPV4_ICMP_SOURCEQUENCH_RATE=59,
        NET_IPV4_ICMP_DESTUNREACH_RATE=60,
        NET_IPV4_ICMP_TIMEEXCEED_RATE=61,
        NET_IPV4_ICMP_PARAMPROB_RATE=62,
        NET_IPV4_ICMP_ECHOREPLY_RATE=63,
        NET_IPV4_ICMP_IGNORE_BOGUS_ERROR_RESPONSES=64,
        NET_IPV4_IGMP_MAX_MEMBERSHIPS=65,
        NET_TCP_TW_RECYCLE=66,
        NET_IPV4_ALWAYS_DEFRAG=67,
        NET_IPV4_TCP_KEEPALIVE_INTVL=68,
        NET_IPV4_INET_PEER_THRESHOLD=69,
        NET_IPV4_INET_PEER_MINTTL=70,
        NET_IPV4_INET_PEER_MAXTTL=71,
        NET_IPV4_INET_PEER_GC_MINTIME=72,
        NET_IPV4_INET_PEER_GC_MAXTIME=73,
        NET_TCP_ORPHAN_RETRIES=74,
        NET_TCP_ABORT_ON_OVERFLOW=75,
        NET_TCP_SYNACK_RETRIES=76,
        NET_TCP_MAX_ORPHANS=77,
        NET_TCP_MAX_TW_BUCKETS=78,
        NET_TCP_FACK=79,
        NET_TCP_REORDERING=80,
        NET_TCP_ECN=81,
        NET_TCP_DSACK=82,
        NET_TCP_MEM=83,
        NET_TCP_WMEM=84,
        NET_TCP_RMEM=85,
        NET_TCP_APP_WIN=86,
        NET_TCP_ADV_WIN_SCALE=87,
        NET_IPV4_NONLOCAL_BIND=88,
        NET_IPV4_ICMP_RATELIMIT=89,
        NET_IPV4_ICMP_RATEMASK=90,
        NET_TCP_TW_REUSE=91,
        NET_TCP_FRTO=92,
        NET_TCP_LOW_LATENCY=93,
        NET_IPV4_IPFRAG_SECRET_INTERVAL=94,
        NET_IPV4_IGMP_MAX_MSF=96,
        NET_TCP_NO_METRICS_SAVE=97,
        NET_TCP_DEFAULT_WIN_SCALE=105,
        NET_TCP_MODERATE_RCVBUF=106,
        NET_TCP_TSO_WIN_DIVISOR=107,
        NET_TCP_BIC_BETA=108,
        NET_IPV4_ICMP_ERRORS_USE_INBOUND_IFADDR=109,
        NET_TCP_CONG_CONTROL=110,
        NET_TCP_ABC=111,
        NET_IPV4_IPFRAG_MAX_DIST=112,
        NET_TCP_MTU_PROBING=113,
        NET_TCP_BASE_MSS=114,
        NET_IPV4_TCP_WORKAROUND_SIGNED_WINDOWS=115,
        NET_TCP_DMA_COPYBREAK=116,
        NET_TCP_SLOW_START_AFTER_IDLE=117,
        NET_CIPSOV4_CACHE_ENABLE=118,
        NET_CIPSOV4_CACHE_BUCKET_SIZE=119,
        NET_CIPSOV4_RBM_OPTFMT=120,
        NET_CIPSOV4_RBM_STRICTVALID=121,
        NET_TCP_AVAIL_CONG_CONTROL=122,
        NET_TCP_ALLOWED_CONG_CONTROL=123,
};

enum {
        NET_IPV4_ROUTE_FLUSH=1,
        NET_IPV4_ROUTE_MIN_DELAY=2,
        NET_IPV4_ROUTE_MAX_DELAY=3,
        NET_IPV4_ROUTE_GC_THRESH=4,
        NET_IPV4_ROUTE_MAX_SIZE=5,
        NET_IPV4_ROUTE_GC_MIN_INTERVAL=6,
        NET_IPV4_ROUTE_GC_TIMEOUT=7,
        NET_IPV4_ROUTE_GC_INTERVAL=8,
        NET_IPV4_ROUTE_REDIRECT_LOAD=9,
        NET_IPV4_ROUTE_REDIRECT_NUMBER=10,
        NET_IPV4_ROUTE_REDIRECT_SILENCE=11,
        NET_IPV4_ROUTE_ERROR_COST=12,
        NET_IPV4_ROUTE_ERROR_BURST=13,
        NET_IPV4_ROUTE_GC_ELASTICITY=14,
        NET_IPV4_ROUTE_MTU_EXPIRES=15,
        NET_IPV4_ROUTE_MIN_PMTU=16,
        NET_IPV4_ROUTE_MIN_ADVMSS=17,
        NET_IPV4_ROUTE_SECRET_INTERVAL=18,
        NET_IPV4_ROUTE_GC_MIN_INTERVAL_MS=19,
};

enum
{
        NET_PROTO_CONF_ALL=-2,
        NET_PROTO_CONF_DEFAULT=-3


};

enum
{
        NET_IPV4_CONF_FORWARDING=1,
        NET_IPV4_CONF_MC_FORWARDING=2,
        NET_IPV4_CONF_PROXY_ARP=3,
        NET_IPV4_CONF_ACCEPT_REDIRECTS=4,
        NET_IPV4_CONF_SECURE_REDIRECTS=5,
        NET_IPV4_CONF_SEND_REDIRECTS=6,
        NET_IPV4_CONF_SHARED_MEDIA=7,
        NET_IPV4_CONF_RP_FILTER=8,
        NET_IPV4_CONF_ACCEPT_SOURCE_ROUTE=9,
        NET_IPV4_CONF_BOOTP_RELAY=10,
        NET_IPV4_CONF_LOG_MARTIANS=11,
        NET_IPV4_CONF_TAG=12,
        NET_IPV4_CONF_ARPFILTER=13,
        NET_IPV4_CONF_MEDIUM_ID=14,
        NET_IPV4_CONF_NOXFRM=15,
        NET_IPV4_CONF_NOPOLICY=16,
        NET_IPV4_CONF_FORCE_IGMP_VERSION=17,
        NET_IPV4_CONF_ARP_ANNOUNCE=18,
        NET_IPV4_CONF_ARP_IGNORE=19,
        NET_IPV4_CONF_PROMOTE_SECONDARIES=20,
        NET_IPV4_CONF_ARP_ACCEPT=21,
        __NET_IPV4_CONF_MAX
};


enum
{
        NET_IPV4_NF_CONNTRACK_MAX=1,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_SYN_SENT=2,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_SYN_RECV=3,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_ESTABLISHED=4,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_FIN_WAIT=5,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_CLOSE_WAIT=6,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_LAST_ACK=7,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_TIME_WAIT=8,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_CLOSE=9,
        NET_IPV4_NF_CONNTRACK_UDP_TIMEOUT=10,
        NET_IPV4_NF_CONNTRACK_UDP_TIMEOUT_STREAM=11,
        NET_IPV4_NF_CONNTRACK_ICMP_TIMEOUT=12,
        NET_IPV4_NF_CONNTRACK_GENERIC_TIMEOUT=13,
        NET_IPV4_NF_CONNTRACK_BUCKETS=14,
        NET_IPV4_NF_CONNTRACK_LOG_INVALID=15,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_MAX_RETRANS=16,
        NET_IPV4_NF_CONNTRACK_TCP_LOOSE=17,
        NET_IPV4_NF_CONNTRACK_TCP_BE_LIBERAL=18,
        NET_IPV4_NF_CONNTRACK_TCP_MAX_RETRANS=19,
        NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_CLOSED=20,
        NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_WAIT=21,
        NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_ECHOED=22,
        NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_ESTABLISHED=23,
        NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_SENT=24,
        NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_RECD=25,
        NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_ACK_SENT=26,
        NET_IPV4_NF_CONNTRACK_COUNT=27,
        NET_IPV4_NF_CONNTRACK_CHECKSUM=28,
};


enum {
        NET_IPV6_CONF=16,
        NET_IPV6_NEIGH=17,
        NET_IPV6_ROUTE=18,
        NET_IPV6_ICMP=19,
        NET_IPV6_BINDV6ONLY=20,
        NET_IPV6_IP6FRAG_HIGH_THRESH=21,
        NET_IPV6_IP6FRAG_LOW_THRESH=22,
        NET_IPV6_IP6FRAG_TIME=23,
        NET_IPV6_IP6FRAG_SECRET_INTERVAL=24,
        NET_IPV6_MLD_MAX_MSF=25,
};

enum {
        NET_IPV6_ROUTE_FLUSH=1,
        NET_IPV6_ROUTE_GC_THRESH=2,
        NET_IPV6_ROUTE_MAX_SIZE=3,
        NET_IPV6_ROUTE_GC_MIN_INTERVAL=4,
        NET_IPV6_ROUTE_GC_TIMEOUT=5,
        NET_IPV6_ROUTE_GC_INTERVAL=6,
        NET_IPV6_ROUTE_GC_ELASTICITY=7,
        NET_IPV6_ROUTE_MTU_EXPIRES=8,
        NET_IPV6_ROUTE_MIN_ADVMSS=9,
        NET_IPV6_ROUTE_GC_MIN_INTERVAL_MS=10
};

enum {
        NET_IPV6_FORWARDING=1,
        NET_IPV6_HOP_LIMIT=2,
        NET_IPV6_MTU=3,
        NET_IPV6_ACCEPT_RA=4,
        NET_IPV6_ACCEPT_REDIRECTS=5,
        NET_IPV6_AUTOCONF=6,
        NET_IPV6_DAD_TRANSMITS=7,
        NET_IPV6_RTR_SOLICITS=8,
        NET_IPV6_RTR_SOLICIT_INTERVAL=9,
        NET_IPV6_RTR_SOLICIT_DELAY=10,
        NET_IPV6_USE_TEMPADDR=11,
        NET_IPV6_TEMP_VALID_LFT=12,
        NET_IPV6_TEMP_PREFERED_LFT=13,
        NET_IPV6_REGEN_MAX_RETRY=14,
        NET_IPV6_MAX_DESYNC_FACTOR=15,
        NET_IPV6_MAX_ADDRESSES=16,
        NET_IPV6_FORCE_MLD_VERSION=17,
        NET_IPV6_ACCEPT_RA_DEFRTR=18,
        NET_IPV6_ACCEPT_RA_PINFO=19,
        NET_IPV6_ACCEPT_RA_RTR_PREF=20,
        NET_IPV6_RTR_PROBE_INTERVAL=21,
        NET_IPV6_ACCEPT_RA_RT_INFO_MAX_PLEN=22,
        NET_IPV6_PROXY_NDP=23,
        __NET_IPV6_MAX
};


enum {
        NET_IPV6_ICMP_RATELIMIT=1
};


enum {
        NET_NEIGH_MCAST_SOLICIT=1,
        NET_NEIGH_UCAST_SOLICIT=2,
        NET_NEIGH_APP_SOLICIT=3,
        NET_NEIGH_RETRANS_TIME=4,
        NET_NEIGH_REACHABLE_TIME=5,
        NET_NEIGH_DELAY_PROBE_TIME=6,
        NET_NEIGH_GC_STALE_TIME=7,
        NET_NEIGH_UNRES_QLEN=8,
        NET_NEIGH_PROXY_QLEN=9,
        NET_NEIGH_ANYCAST_DELAY=10,
        NET_NEIGH_PROXY_DELAY=11,
        NET_NEIGH_LOCKTIME=12,
        NET_NEIGH_GC_INTERVAL=13,
        NET_NEIGH_GC_THRESH1=14,
        NET_NEIGH_GC_THRESH2=15,
        NET_NEIGH_GC_THRESH3=16,
        NET_NEIGH_RETRANS_TIME_MS=17,
        NET_NEIGH_REACHABLE_TIME_MS=18,
        __NET_NEIGH_MAX
};


enum {
        NET_DCCP_DEFAULT=1,
};


enum {
        NET_IPX_PPROP_BROADCASTING=1,
        NET_IPX_FORWARDING=2
};


enum {
        NET_LLC2=1,
        NET_LLC_STATION=2,
};


enum {
        NET_LLC2_TIMEOUT=1,
};


enum {
        NET_LLC_STATION_ACK_TIMEOUT=1,
};


enum {
        NET_LLC2_ACK_TIMEOUT=1,
        NET_LLC2_P_TIMEOUT=2,
        NET_LLC2_REJ_TIMEOUT=3,
        NET_LLC2_BUSY_TIMEOUT=4,
};


enum {
        NET_ATALK_AARP_EXPIRY_TIME=1,
        NET_ATALK_AARP_TICK_TIME=2,
        NET_ATALK_AARP_RETRANSMIT_LIMIT=3,
        NET_ATALK_AARP_RESOLVE_TIME=4
};



enum {
        NET_NETROM_DEFAULT_PATH_QUALITY=1,
        NET_NETROM_OBSOLESCENCE_COUNT_INITIALISER=2,
        NET_NETROM_NETWORK_TTL_INITIALISER=3,
        NET_NETROM_TRANSPORT_TIMEOUT=4,
        NET_NETROM_TRANSPORT_MAXIMUM_TRIES=5,
        NET_NETROM_TRANSPORT_ACKNOWLEDGE_DELAY=6,
        NET_NETROM_TRANSPORT_BUSY_DELAY=7,
        NET_NETROM_TRANSPORT_REQUESTED_WINDOW_SIZE=8,
        NET_NETROM_TRANSPORT_NO_ACTIVITY_TIMEOUT=9,
        NET_NETROM_ROUTING_CONTROL=10,
        NET_NETROM_LINK_FAILS_COUNT=11,
        NET_NETROM_RESET=12
};


enum {
        NET_AX25_IP_DEFAULT_MODE=1,
        NET_AX25_DEFAULT_MODE=2,
        NET_AX25_BACKOFF_TYPE=3,
        NET_AX25_CONNECT_MODE=4,
        NET_AX25_STANDARD_WINDOW=5,
        NET_AX25_EXTENDED_WINDOW=6,
        NET_AX25_T1_TIMEOUT=7,
        NET_AX25_T2_TIMEOUT=8,
        NET_AX25_T3_TIMEOUT=9,
        NET_AX25_IDLE_TIMEOUT=10,
        NET_AX25_N2=11,
        NET_AX25_PACLEN=12,
        NET_AX25_PROTOCOL=13,
        NET_AX25_DAMA_SLAVE_TIMEOUT=14
};


enum {
        NET_ROSE_RESTART_REQUEST_TIMEOUT=1,
        NET_ROSE_CALL_REQUEST_TIMEOUT=2,
        NET_ROSE_RESET_REQUEST_TIMEOUT=3,
        NET_ROSE_CLEAR_REQUEST_TIMEOUT=4,
        NET_ROSE_ACK_HOLD_BACK_TIMEOUT=5,
        NET_ROSE_ROUTING_CONTROL=6,
        NET_ROSE_LINK_FAIL_TIMEOUT=7,
        NET_ROSE_MAX_VCS=8,
        NET_ROSE_WINDOW_SIZE=9,
        NET_ROSE_NO_ACTIVITY_TIMEOUT=10
};


enum {
        NET_X25_RESTART_REQUEST_TIMEOUT=1,
        NET_X25_CALL_REQUEST_TIMEOUT=2,
        NET_X25_RESET_REQUEST_TIMEOUT=3,
        NET_X25_CLEAR_REQUEST_TIMEOUT=4,
        NET_X25_ACK_HOLD_BACK_TIMEOUT=5
};


enum
{
        NET_TR_RIF_TIMEOUT=1
};


enum {
        NET_DECNET_NODE_TYPE = 1,
        NET_DECNET_NODE_ADDRESS = 2,
        NET_DECNET_NODE_NAME = 3,
        NET_DECNET_DEFAULT_DEVICE = 4,
        NET_DECNET_TIME_WAIT = 5,
        NET_DECNET_DN_COUNT = 6,
        NET_DECNET_DI_COUNT = 7,
        NET_DECNET_DR_COUNT = 8,
        NET_DECNET_DST_GC_INTERVAL = 9,
        NET_DECNET_CONF = 10,
        NET_DECNET_NO_FC_MAX_CWND = 11,
        NET_DECNET_MEM = 12,
        NET_DECNET_RMEM = 13,
        NET_DECNET_WMEM = 14,
        NET_DECNET_DEBUG_LEVEL = 255
};


enum {
        NET_DECNET_CONF_LOOPBACK = -2,
        NET_DECNET_CONF_DDCMP = -3,
        NET_DECNET_CONF_PPP = -4,
        NET_DECNET_CONF_X25 = -5,
        NET_DECNET_CONF_GRE = -6,
        NET_DECNET_CONF_ETHER = -7


};


enum {
        NET_DECNET_CONF_DEV_PRIORITY = 1,
        NET_DECNET_CONF_DEV_T1 = 2,
        NET_DECNET_CONF_DEV_T2 = 3,
        NET_DECNET_CONF_DEV_T3 = 4,
        NET_DECNET_CONF_DEV_FORWARDING = 5,
        NET_DECNET_CONF_DEV_BLKSIZE = 6,
        NET_DECNET_CONF_DEV_STATE = 7
};


enum {
        NET_SCTP_RTO_INITIAL = 1,
        NET_SCTP_RTO_MIN = 2,
        NET_SCTP_RTO_MAX = 3,
        NET_SCTP_RTO_ALPHA = 4,
        NET_SCTP_RTO_BETA = 5,
        NET_SCTP_VALID_COOKIE_LIFE = 6,
        NET_SCTP_ASSOCIATION_MAX_RETRANS = 7,
        NET_SCTP_PATH_MAX_RETRANS = 8,
        NET_SCTP_MAX_INIT_RETRANSMITS = 9,
        NET_SCTP_HB_INTERVAL = 10,
        NET_SCTP_PRESERVE_ENABLE = 11,
        NET_SCTP_MAX_BURST = 12,
        NET_SCTP_ADDIP_ENABLE = 13,
        NET_SCTP_PRSCTP_ENABLE = 14,
        NET_SCTP_SNDBUF_POLICY = 15,
        NET_SCTP_SACK_TIMEOUT = 16,
        NET_SCTP_RCVBUF_POLICY = 17,
};


enum {
        NET_BRIDGE_NF_CALL_ARPTABLES = 1,
        NET_BRIDGE_NF_CALL_IPTABLES = 2,
        NET_BRIDGE_NF_CALL_IP6TABLES = 3,
        NET_BRIDGE_NF_FILTER_VLAN_TAGGED = 4,
};


enum
{
        FS_NRINODE=1,
        FS_STATINODE=2,
        FS_MAXINODE=3,
        FS_NRDQUOT=4,
        FS_MAXDQUOT=5,
        FS_NRFILE=6,
        FS_MAXFILE=7,
        FS_DENTRY=8,
        FS_NRSUPER=9,
        FS_MAXSUPER=10,
        FS_OVERFLOWUID=11,
        FS_OVERFLOWGID=12,
        FS_LEASES=13,
        FS_DIR_NOTIFY=14,
        FS_LEASE_TIME=15,
        FS_DQSTATS=16,
        FS_XFS=17,
        FS_AIO_NR=18,
        FS_AIO_MAX_NR=19,
        FS_INOTIFY=20,
};


enum {
        FS_DQ_LOOKUPS = 1,
        FS_DQ_DROPS = 2,
        FS_DQ_READS = 3,
        FS_DQ_WRITES = 4,
        FS_DQ_CACHE_HITS = 5,
        FS_DQ_ALLOCATED = 6,
        FS_DQ_FREE = 7,
        FS_DQ_SYNCS = 8,
        FS_DQ_WARNINGS = 9,
};




enum {
        DEV_CDROM=1,
        DEV_HWMON=2,
        DEV_PARPORT=3,
        DEV_RAID=4,
        DEV_MAC_HID=5,
        DEV_SCSI=6,
        DEV_IPMI=7,
};


enum {
        DEV_CDROM_INFO=1,
        DEV_CDROM_AUTOCLOSE=2,
        DEV_CDROM_AUTOEJECT=3,
        DEV_CDROM_DEBUG=4,
        DEV_CDROM_LOCK=5,
        DEV_CDROM_CHECK_MEDIA=6
};


enum {
        DEV_PARPORT_DEFAULT=-3
};


enum {
        DEV_RAID_SPEED_LIMIT_MIN=1,
        DEV_RAID_SPEED_LIMIT_MAX=2
};


enum {
        DEV_PARPORT_DEFAULT_TIMESLICE=1,
        DEV_PARPORT_DEFAULT_SPINTIME=2
};


enum {
        DEV_PARPORT_SPINTIME=1,
        DEV_PARPORT_BASE_ADDR=2,
        DEV_PARPORT_IRQ=3,
        DEV_PARPORT_DMA=4,
        DEV_PARPORT_MODES=5,
        DEV_PARPORT_DEVICES=6,
        DEV_PARPORT_AUTOPROBE=16
};


enum {
        DEV_PARPORT_DEVICES_ACTIVE=-3,
};


enum {
        DEV_PARPORT_DEVICE_TIMESLICE=1,
};


enum {
        DEV_MAC_HID_KEYBOARD_SENDS_LINUX_KEYCODES=1,
        DEV_MAC_HID_KEYBOARD_LOCK_KEYCODES=2,
        DEV_MAC_HID_MOUSE_BUTTON_EMULATION=3,
        DEV_MAC_HID_MOUSE_BUTTON2_KEYCODE=4,
        DEV_MAC_HID_MOUSE_BUTTON3_KEYCODE=5,
        DEV_MAC_HID_ADB_MOUSE_SENDS_KEYCODES=6
};


enum {
        DEV_SCSI_LOGGING_LEVEL=1,
};


enum {
        DEV_IPMI_POWEROFF_POWERCYCLE=1,
};


enum
{
        ABI_DEFHANDLER_COFF=1,
        ABI_DEFHANDLER_ELF=2,
        ABI_DEFHANDLER_LCALL7=3,
        ABI_DEFHANDLER_LIBCSO=4,
        ABI_TRACE=5,
        ABI_FAKE_UTSNAME=6,
};




extern void sysctl_init(void);

typedef struct ctl_table ctl_table;

typedef int ctl_handler (ctl_table *table, int *name, int nlen,
                         void *oldval, size_t *oldlenp,
                         void *newval, size_t newlen);

typedef int proc_handler (ctl_table *ctl, int write, struct file * filp,
                          void *buffer, size_t *lenp, loff_t *ppos);

extern int proc_dostring(ctl_table *, int, struct file *,
                         void *, size_t *, loff_t *);
extern int proc_dointvec(ctl_table *, int, struct file *,
                         void *, size_t *, loff_t *);
extern int proc_dointvec_bset(ctl_table *, int, struct file *,
                              void *, size_t *, loff_t *);
extern int proc_dointvec_minmax(ctl_table *, int, struct file *,
                                void *, size_t *, loff_t *);
extern int proc_dointvec_jiffies(ctl_table *, int, struct file *,
                                 void *, size_t *, loff_t *);
extern int proc_dointvec_userhz_jiffies(ctl_table *, int, struct file *,
                                        void *, size_t *, loff_t *);
extern int proc_dointvec_ms_jiffies(ctl_table *, int, struct file *,
                                    void *, size_t *, loff_t *);
extern int proc_doulongvec_minmax(ctl_table *, int, struct file *,
                                  void *, size_t *, loff_t *);
extern int proc_doulongvec_ms_jiffies_minmax(ctl_table *table, int,
                                      struct file *, void *, size_t *, loff_t *);

extern int do_sysctl (int *name, int nlen,
                      void *oldval, size_t *oldlenp,
                      void *newval, size_t newlen);

extern int do_sysctl_strategy (ctl_table *table,
                               int *name, int nlen,
                               void *oldval, size_t *oldlenp,
                               void *newval, size_t newlen);

extern ctl_handler sysctl_string;
extern ctl_handler sysctl_intvec;
extern ctl_handler sysctl_jiffies;
extern ctl_handler sysctl_ms_jiffies;
# 1001 "include/linux/sysctl.h"
struct ctl_table
{
        int ctl_name;
        const char *procname;
        void *data;
        int maxlen;
        mode_t mode;
        ctl_table *child;
        proc_handler *proc_handler;
        ctl_handler *strategy;
        struct proc_dir_entry *de;
        void *extra1;
        void *extra2;
};



struct ctl_table_header
{
        ctl_table *ctl_table;
        struct list_head ctl_entry;
        int used;
        struct completion *unregistering;
};

struct ctl_table_header * register_sysctl_table(ctl_table * table,
                                                int insert_at_head);
void unregister_sysctl_table(struct ctl_table_header * table);
# 317 "include/linux/net.h" 2
extern ctl_table net_table[];
extern int net_msg_cost;
extern int net_msg_burst;
# 26 "include/linux/skbuff.h" 2
# 1 "include/linux/textsearch.h" 1
# 13 "include/linux/textsearch.h"
struct ts_config;
# 25 "include/linux/textsearch.h"
struct ts_state
{
        unsigned int offset;
        char cb[40];
};
# 41 "include/linux/textsearch.h"
struct ts_ops
{
        const char *name;
        struct ts_config * (*init)(const void *, unsigned int, gfp_t);
        unsigned int (*find)(struct ts_config *,
                                        struct ts_state *);
        void (*destroy)(struct ts_config *);
        void * (*get_pattern)(struct ts_config *);
        unsigned int (*get_pattern_len)(struct ts_config *);
        struct module *owner;
        struct list_head list;
};







struct ts_config
{
        struct ts_ops *ops;
# 76 "include/linux/textsearch.h"
        unsigned int (*get_next_block)(unsigned int consumed,
                                                  const u8 **dst,
                                                  struct ts_config *conf,
                                                  struct ts_state *state);
# 89 "include/linux/textsearch.h"
        void (*finish)(struct ts_config *conf,
                                          struct ts_state *state);
};
# 105 "include/linux/textsearch.h"
static inline __attribute__((always_inline)) unsigned int textsearch_next(struct ts_config *conf,
                                           struct ts_state *state)
{
        unsigned int ret = conf->ops->find(conf, state);

        if (conf->finish)
                conf->finish(conf, state);

        return ret;
}
# 124 "include/linux/textsearch.h"
static inline __attribute__((always_inline)) unsigned int textsearch_find(struct ts_config *conf,
                                           struct ts_state *state)
{
        state->offset = 0;
        return textsearch_next(conf, state);
}





static inline __attribute__((always_inline)) void *textsearch_get_pattern(struct ts_config *conf)
{
        return conf->ops->get_pattern(conf);
}





static inline __attribute__((always_inline)) unsigned int textsearch_get_pattern_len(struct ts_config *conf)
{
        return conf->ops->get_pattern_len(conf);
}

extern int textsearch_register(struct ts_ops *);
extern int textsearch_unregister(struct ts_ops *);
extern struct ts_config *textsearch_prepare(const char *, const void *,
                                            unsigned int, gfp_t, int);
extern void textsearch_destroy(struct ts_config *conf);
extern unsigned int textsearch_find_continuous(struct ts_config *,
                                               struct ts_state *,
                                               const void *, unsigned int);





static inline __attribute__((always_inline)) struct ts_config *alloc_ts_config(size_t payload,
                                                gfp_t gfp_mask)
{
        struct ts_config *conf;

        conf = kmalloc((((sizeof(*conf)) + 8 -1) & ~(8 -1)) + payload, gfp_mask);
        if (conf == ((void *)0))
                return ERR_PTR(-12);

        (__builtin_constant_p(0) ? (__builtin_constant_p(((((sizeof(*conf)) + 8 -1) & ~(8 -1)) + payload)) ? __constant_c_and_count_memset(((conf)),((0x01010101UL*(unsigned char)(0))),(((((sizeof(*conf)) + 8 -1) & ~(8 -1)) + payload))) : __constant_c_memset(((conf)),((0x01010101UL*(unsigned char)(0))),(((((sizeof(*conf)) + 8 -1) & ~(8 -1)) + payload)))) : (__builtin_constant_p(((((sizeof(*conf)) + 8 -1) & ~(8 -1)) + payload)) ? __memset_generic((((conf))),(((0))),((((((sizeof(*conf)) + 8 -1) & ~(8 -1)) + payload)))) : __memset_generic(((conf)),((0)),(((((sizeof(*conf)) + 8 -1) & ~(8 -1)) + payload)))));
        return conf;
}

static inline __attribute__((always_inline)) void *ts_config_priv(struct ts_config *conf)
{
        return ((u8 *) conf + (((sizeof(struct ts_config)) + 8 -1) & ~(8 -1)));
}
# 27 "include/linux/skbuff.h" 2
# 1 "include/net/checksum.h" 1
# 26 "include/net/checksum.h"
# 1 "include/asm/checksum.h" 1
# 20 "include/asm/checksum.h"
 __attribute__((regparm(0))) __wsum csum_partial(const void *buff, int len, __wsum sum);
# 30 "include/asm/checksum.h"
 __attribute__((regparm(0))) __wsum csum_partial_copy_generic(const void *src, void *dst,
                                                  int len, __wsum sum, int *src_err_ptr, int *dst_err_ptr);
# 40 "include/asm/checksum.h"
static __inline__ __attribute__((always_inline))
__wsum csum_partial_copy_nocheck (const void *src, void *dst,
                                        int len, __wsum sum)
{
        return csum_partial_copy_generic ( src, dst, len, sum, ((void *)0), ((void *)0));
}

static __inline__ __attribute__((always_inline))
__wsum csum_partial_copy_from_user(const void *src, void *dst,
                                                int len, __wsum sum, int *err_ptr)
{
        do { cond_resched(); } while (0);
        return csum_partial_copy_generic(( void *)src, dst,
                                        len, sum, err_ptr, ((void *)0));
}
# 63 "include/asm/checksum.h"
static inline __attribute__((always_inline)) __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
{
        unsigned int sum;

        __asm__ __volatile__(
            "movl (%1), %0	;\n"
            "subl $4, %2	;\n"
            "jbe 2f		;\n"
            "addl 4(%1), %0	;\n"
            "adcl 8(%1), %0	;\n"
            "adcl 12(%1), %0	;\n"
"1:	    adcl 16(%1), %0	;\n"
            "lea 4(%1), %1	;\n"
            "decl %2		;\n"
            "jne 1b		;\n"
            "adcl $0, %0	;\n"
            "movl %0, %2	;\n"
            "shrl $16, %0	;\n"
            "addw %w2, %w0	;\n"
            "adcl $0, %0	;\n"
            "notl %0		;\n"
"2:				;\n"



        : "=r" (sum), "=r" (iph), "=r" (ihl)
        : "1" (iph), "2" (ihl)
        : "memory");
        return ( __sum16)sum;
}





static inline __attribute__((always_inline)) __sum16 csum_fold(__wsum sum)
{
        __asm__(
                "addl %1, %0		;\n"
                "adcl $0xffff, %0	;\n"
                : "=r" (sum)
                : "r" (( u32)sum << 16),
                  "0" (( u32)sum & 0xffff0000)
        );
        return ( __sum16)(~( u32)sum >> 16);
}

static inline __attribute__((always_inline)) __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
                                           unsigned short len,
                                           unsigned short proto,
                                           __wsum sum)
{
    __asm__(
        "addl %1, %0	;\n"
        "adcl %2, %0	;\n"
        "adcl %3, %0	;\n"
        "adcl $0, %0	;\n"
        : "=r" (sum)
        : "g" (daddr), "g"(saddr), "g"((len + proto) << 8), "0"(sum));
    return sum;
}





static inline __attribute__((always_inline)) __sum16 csum_tcpudp_magic(__be32 saddr, __be32 daddr,
                                                   unsigned short len,
                                                   unsigned short proto,
                                                   __wsum sum)
{
        return csum_fold(csum_tcpudp_nofold(saddr,daddr,len,proto,sum));
}






static inline __attribute__((always_inline)) __sum16 ip_compute_csum(const void *buff, int len)
{
    return csum_fold (csum_partial(buff, len, 0));
}


static __inline__ __attribute__((always_inline)) __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
                                          const struct in6_addr *daddr,
                                          __u32 len, unsigned short proto,
                                          __wsum sum)
{
        __asm__(
                "addl 0(%1), %0		;\n"
                "adcl 4(%1), %0		;\n"
                "adcl 8(%1), %0		;\n"
                "adcl 12(%1), %0	;\n"
                "adcl 0(%2), %0		;\n"
                "adcl 4(%2), %0		;\n"
                "adcl 8(%2), %0		;\n"
                "adcl 12(%2), %0	;\n"
                "adcl %3, %0		;\n"
                "adcl %4, %0		;\n"
                "adcl $0, %0		;\n"
                : "=&r" (sum)
                : "r" (saddr), "r" (daddr),
                  "r"((( __be32)(__builtin_constant_p((__u32)((len))) ? ({ __u32 __x = (((len))); ((__u32)( (((__u32)(__x) & (__u32)0x000000ffUL) << 24) | (((__u32)(__x) & (__u32)0x0000ff00UL) << 8) | (((__u32)(__x) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(__x) & (__u32)0xff000000UL) >> 24) )); }) : __fswab32(((len)))))), "r"((( __be32)(__builtin_constant_p((__u32)((proto))) ? ({ __u32 __x = (((proto))); ((__u32)( (((__u32)(__x) & (__u32)0x000000ffUL) << 24) | (((__u32)(__x) & (__u32)0x0000ff00UL) << 8) | (((__u32)(__x) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(__x) & (__u32)0xff000000UL) >> 24) )); }) : __fswab32(((proto)))))), "0"(sum));

        return csum_fold(sum);
}





static __inline__ __attribute__((always_inline)) __wsum csum_and_copy_to_user(const void *src,
                                                     void *dst,
                                                     int len, __wsum sum,
                                                     int *err_ptr)
{
        do { cond_resched(); } while (0);
        if ((__builtin_expect(!!(({ unsigned long flag,sum; (void)0; asm("addl %3,%1 ; sbbl %0,%0; cmpl %1,%4; sbbl $0,%0" :"=&r" (flag), "=r" (sum) :"1" (dst),"g" ((int)(len)),"rm" (current_thread_info()->addr_limit.seg)); flag; }) == 0), 1)))
                return csum_partial_copy_generic(src, ( void *)dst, len, sum, ((void *)0), err_ptr);

        if (len)
                *err_ptr = -14;

        return ( __wsum)-1;
}
# 27 "include/net/checksum.h" 2


static inline __attribute__((always_inline))
__wsum csum_and_copy_from_user (const void *src, void *dst,
                                      int len, __wsum sum, int *err_ptr)
{
        if ((__builtin_expect(!!(({ unsigned long flag,sum; (void)0; asm("addl %3,%1 ; sbbl %0,%0; cmpl %1,%4; sbbl $0,%0" :"=&r" (flag), "=r" (sum) :"1" (src),"g" ((int)(len)),"rm" (current_thread_info()->addr_limit.seg)); flag; }) == 0), 1)))
                return csum_partial_copy_from_user(src, dst, len, sum, err_ptr);

        if (len)
                *err_ptr = -14;

        return sum;
}
# 60 "include/net/checksum.h"
static inline __attribute__((always_inline)) __wsum csum_add(__wsum csum, __wsum addend)
{
        u32 res = ( u32)csum;
        res += ( u32)addend;
        return ( __wsum)(res + (res < ( u32)addend));
}

static inline __attribute__((always_inline)) __wsum csum_sub(__wsum csum, __wsum addend)
{
        return csum_add(csum, ~addend);
}

static inline __attribute__((always_inline)) __wsum
csum_block_add(__wsum csum, __wsum csum2, int offset)
{
        u32 sum = ( u32)csum2;
        if (offset&1)
                sum = ((sum&0xFF00FF)<<8)+((sum>>8)&0xFF00FF);
        return csum_add(csum, ( __wsum)sum);
}

static inline __attribute__((always_inline)) __wsum
csum_block_sub(__wsum csum, __wsum csum2, int offset)
{
        u32 sum = ( u32)csum2;
        if (offset&1)
                sum = ((sum&0xFF00FF)<<8)+((sum>>8)&0xFF00FF);
        return csum_sub(csum, ( __wsum)sum);
}

static inline __attribute__((always_inline)) __wsum csum_unfold(__sum16 n)
{
        return ( __wsum)n;
}
# 28 "include/linux/skbuff.h" 2

# 1 "include/linux/dmaengine.h" 1
# 30 "include/linux/skbuff.h" 2
# 85 "include/linux/skbuff.h"
struct net_device;
# 108 "include/linux/skbuff.h"
struct sk_buff_head {

        struct sk_buff *next;
        struct sk_buff *prev;

        __u32 qlen;
        spinlock_t lock;
};

struct sk_buff;




typedef struct skb_frag_struct skb_frag_t;

struct skb_frag_struct {
        struct page *page;
        __u16 page_offset;
        __u16 size;
};




struct skb_shared_info {
        atomic_t dataref;
        unsigned short nr_frags;
        unsigned short gso_size;

        unsigned short gso_segs;
        unsigned short gso_type;
        __be32 ip6_frag_id;
        struct sk_buff *frag_list;
        skb_frag_t frags[(65536/(1UL << 12) + 2)];
};
# 159 "include/linux/skbuff.h"
struct skb_timeval {
        u32 off_sec;
        u32 off_usec;
};


enum {
        SKB_FCLONE_UNAVAILABLE,
        SKB_FCLONE_ORIG,
        SKB_FCLONE_CLONE,
};

enum {
        SKB_GSO_TCPV4 = 1 << 0,
        SKB_GSO_UDP = 1 << 1,


        SKB_GSO_DODGY = 1 << 2,


        SKB_GSO_TCP_ECN = 1 << 3,

        SKB_GSO_TCPV6 = 1 << 4,
};
# 230 "include/linux/skbuff.h"
struct sk_buff {

        struct sk_buff *next;
        struct sk_buff *prev;

        struct sock *sk;
        struct skb_timeval tstamp;
        struct net_device *dev;
        struct net_device *input_dev;

        union {
                struct tcphdr *th;
                struct udphdr *uh;
                struct icmphdr *icmph;
                struct igmphdr *igmph;
                struct iphdr *ipiph;
                struct ipv6hdr *ipv6h;
                unsigned char *raw;
        } h;

        union {
                struct iphdr *iph;
                struct ipv6hdr *ipv6h;
                struct arphdr *arph;
                unsigned char *raw;
        } nh;

        union {
                unsigned char *raw;
        } mac;

        struct dst_entry *dst;
        struct sec_path *sp;







        char cb[48];

        unsigned int len,
                                data_len,
                                mac_len;
        union {
                __wsum csum;
                __u32 csum_offset;
        };
        __u32 priority;
        __u8 local_df:1,
                                cloned:1,
                                ip_summed:2,
                                nohdr:1,
                                nfctinfo:3;
        __u8 pkt_type:3,
                                fclone:2,
                                ipvs_property:1;
        __be16 protocol;

        void (*destructor)(struct sk_buff *skb);
# 313 "include/linux/skbuff.h"
        __u32 mark;


        unsigned int truesize;
        atomic_t users;
        unsigned char *head,
                                *data,
                                *tail,
                                *end;
};
# 332 "include/linux/skbuff.h"
extern void kfree_skb(struct sk_buff *skb);
extern void __kfree_skb(struct sk_buff *skb);
extern struct sk_buff *__alloc_skb(unsigned int size,
                                   gfp_t priority, int fclone, int node);
static inline __attribute__((always_inline)) struct sk_buff *alloc_skb(unsigned int size,
                                        gfp_t priority)
{
        return __alloc_skb(size, priority, 0, -1);
}

static inline __attribute__((always_inline)) struct sk_buff *alloc_skb_fclone(unsigned int size,
                                               gfp_t priority)
{
        return __alloc_skb(size, priority, 1, -1);
}

extern struct sk_buff *alloc_skb_from_cache(struct kmem_cache *cp,
                                            unsigned int size,
                                            gfp_t priority);
extern void kfree_skbmem(struct sk_buff *skb);
extern struct sk_buff *skb_clone(struct sk_buff *skb,
                                 gfp_t priority);
extern struct sk_buff *skb_copy(const struct sk_buff *skb,
                                gfp_t priority);
extern struct sk_buff *pskb_copy(struct sk_buff *skb,
                                 gfp_t gfp_mask);
extern int pskb_expand_head(struct sk_buff *skb,
                                        int nhead, int ntail,
                                        gfp_t gfp_mask);
extern struct sk_buff *skb_realloc_headroom(struct sk_buff *skb,
                                            unsigned int headroom);
extern struct sk_buff *skb_copy_expand(const struct sk_buff *skb,
                                       int newheadroom, int newtailroom,
                                       gfp_t priority);
extern int skb_pad(struct sk_buff *skb, int pad);

extern void skb_over_panic(struct sk_buff *skb, int len,
                                     void *here);
extern void skb_under_panic(struct sk_buff *skb, int len,
                                      void *here);
extern void skb_truesize_bug(struct sk_buff *skb);

static inline __attribute__((always_inline)) void skb_truesize_check(struct sk_buff *skb)
{
        if (__builtin_expect(!!((int)skb->truesize < sizeof(struct sk_buff) + skb->len), 0))
                skb_truesize_bug(skb);
}

extern int skb_append_datato_frags(struct sock *sk, struct sk_buff *skb,
                        int getfrag(void *from, char *to, int offset,
                        int len,int odd, struct sk_buff *skb),
                        void *from, int length);

struct skb_seq_state
{
        __u32 lower_offset;
        __u32 upper_offset;
        __u32 frag_idx;
        __u32 stepped_offset;
        struct sk_buff *root_skb;
        struct sk_buff *cur_skb;
        __u8 *frag_data;
};

extern void skb_prepare_seq_read(struct sk_buff *skb,
                                           unsigned int from, unsigned int to,
                                           struct skb_seq_state *st);
extern unsigned int skb_seq_read(unsigned int consumed, const u8 **data,
                                   struct skb_seq_state *st);
extern void skb_abort_seq_read(struct skb_seq_state *st);

extern unsigned int skb_find_text(struct sk_buff *skb, unsigned int from,
                                    unsigned int to, struct ts_config *config,
                                    struct ts_state *state);
# 416 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_queue_empty(const struct sk_buff_head *list)
{
        return list->next == (struct sk_buff *)list;
}
# 428 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *skb_get(struct sk_buff *skb)
{
        atomic_inc(&skb->users);
        return skb;
}
# 447 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_cloned(const struct sk_buff *skb)
{
        return skb->cloned &&
               (((&((struct skb_shared_info *)((skb)->end))->dataref)->counter) & ((1 << 16) - 1)) != 1;
}
# 460 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_header_cloned(const struct sk_buff *skb)
{
        int dataref;

        if (!skb->cloned)
                return 0;

        dataref = ((&((struct skb_shared_info *)((skb)->end))->dataref)->counter);
        dataref = (dataref & ((1 << 16) - 1)) - (dataref >> 16);
        return dataref != 1;
}
# 480 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_header_release(struct sk_buff *skb)
{
        do { if (__builtin_expect(!!((skb->nohdr)!=0), 0)) do { asm volatile("1:\tud2\n" ".pushsection __bug_table,\"a\"\n" "2:\t.long 1b, %c0\n" "\t.word %c1, 0\n" "\t.org 2b+%c2\n" ".popsection" : : "i" ("include/linux/skbuff.h"), "i" (482), "i" (sizeof(struct bug_entry))); for(;;) ; } while(0); } while(0);
        skb->nohdr = 1;
        atomic_add(1 << 16, &((struct skb_shared_info *)((skb)->end))->dataref);
}
# 494 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_shared(const struct sk_buff *skb)
{
        return ((&skb->users)->counter) != 1;
}
# 512 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *skb_share_check(struct sk_buff *skb,
                                              gfp_t pri)
{
        do { if (pri & (( gfp_t)0x10u)) do { cond_resched(); } while (0); } while (0);
        if (skb_shared(skb)) {
                struct sk_buff *nskb = skb_clone(skb, pri);
                kfree_skb(skb);
                skb = nskb;
        }
        return skb;
}
# 544 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *skb_unshare(struct sk_buff *skb,
                                          gfp_t pri)
{
        do { if (pri & (( gfp_t)0x10u)) do { cond_resched(); } while (0); } while (0);
        if (skb_cloned(skb)) {
                struct sk_buff *nskb = skb_copy(skb, pri);
                kfree_skb(skb);
                skb = nskb;
        }
        return skb;
}
# 569 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *skb_peek(struct sk_buff_head *list_)
{
        struct sk_buff *list = ((struct sk_buff *)list_)->next;
        if (list == (struct sk_buff *)list_)
                list = ((void *)0);
        return list;
}
# 590 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *skb_peek_tail(struct sk_buff_head *list_)
{
        struct sk_buff *list = ((struct sk_buff *)list_)->prev;
        if (list == (struct sk_buff *)list_)
                list = ((void *)0);
        return list;
}







static inline __attribute__((always_inline)) __u32 skb_queue_len(const struct sk_buff_head *list_)
{
        return list_->qlen;
}
# 617 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_queue_head_init(struct sk_buff_head *list)
{
        do { *(&list->lock) = (spinlock_t) { .raw_lock = { 1 }, }; } while (0);
        list->prev = list->next = (struct sk_buff *)list;
        list->qlen = 0;
}
# 642 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void __skb_queue_after(struct sk_buff_head *list,
                                     struct sk_buff *prev,
                                     struct sk_buff *newsk)
{
        struct sk_buff *next;
        list->qlen++;

        next = prev->next;
        newsk->next = next;
        newsk->prev = prev;
        next->prev = prev->next = newsk;
}
# 665 "include/linux/skbuff.h"
extern void skb_queue_head(struct sk_buff_head *list, struct sk_buff *newsk);
static inline __attribute__((always_inline)) void __skb_queue_head(struct sk_buff_head *list,
                                    struct sk_buff *newsk)
{
        __skb_queue_after(list, (struct sk_buff *)list, newsk);
}
# 682 "include/linux/skbuff.h"
extern void skb_queue_tail(struct sk_buff_head *list, struct sk_buff *newsk);
static inline __attribute__((always_inline)) void __skb_queue_tail(struct sk_buff_head *list,
                                   struct sk_buff *newsk)
{
        struct sk_buff *prev, *next;

        list->qlen++;
        next = (struct sk_buff *)list;
        prev = next->prev;
        newsk->next = next;
        newsk->prev = prev;
        next->prev = prev->next = newsk;
}
# 705 "include/linux/skbuff.h"
extern struct sk_buff *skb_dequeue(struct sk_buff_head *list);
static inline __attribute__((always_inline)) struct sk_buff *__skb_dequeue(struct sk_buff_head *list)
{
        struct sk_buff *next, *prev, *result;

        prev = (struct sk_buff *) list;
        next = prev->next;
        result = ((void *)0);
        if (next != prev) {
                result = next;
                next = next->next;
                list->qlen--;
                next->prev = prev;
                prev->next = next;
                result->next = result->prev = ((void *)0);
        }
        return result;
}





extern void skb_insert(struct sk_buff *old, struct sk_buff *newsk, struct sk_buff_head *list);
static inline __attribute__((always_inline)) void __skb_insert(struct sk_buff *newsk,
                                struct sk_buff *prev, struct sk_buff *next,
                                struct sk_buff_head *list)
{
        newsk->next = next;
        newsk->prev = prev;
        next->prev = prev->next = newsk;
        list->qlen++;
}




extern void skb_append(struct sk_buff *old, struct sk_buff *newsk, struct sk_buff_head *list);
static inline __attribute__((always_inline)) void __skb_append(struct sk_buff *old, struct sk_buff *newsk, struct sk_buff_head *list)
{
        __skb_insert(newsk, old, old->next, list);
}





extern void skb_unlink(struct sk_buff *skb, struct sk_buff_head *list);
static inline __attribute__((always_inline)) void __skb_unlink(struct sk_buff *skb, struct sk_buff_head *list)
{
        struct sk_buff *next, *prev;

        list->qlen--;
        next = skb->next;
        prev = skb->prev;
        skb->next = skb->prev = ((void *)0);
        next->prev = prev;
        prev->next = next;
}
# 776 "include/linux/skbuff.h"
extern struct sk_buff *skb_dequeue_tail(struct sk_buff_head *list);
static inline __attribute__((always_inline)) struct sk_buff *__skb_dequeue_tail(struct sk_buff_head *list)
{
        struct sk_buff *skb = skb_peek_tail(list);
        if (skb)
                __skb_unlink(skb, list);
        return skb;
}


static inline __attribute__((always_inline)) int skb_is_nonlinear(const struct sk_buff *skb)
{
        return skb->data_len;
}

static inline __attribute__((always_inline)) unsigned int skb_headlen(const struct sk_buff *skb)
{
        return skb->len - skb->data_len;
}

static inline __attribute__((always_inline)) int skb_pagelen(const struct sk_buff *skb)
{
        int i, len = 0;

        for (i = (int)((struct skb_shared_info *)((skb)->end))->nr_frags - 1; i >= 0; i--)
                len += ((struct skb_shared_info *)((skb)->end))->frags[i].size;
        return len + skb_headlen(skb);
}

static inline __attribute__((always_inline)) void skb_fill_page_desc(struct sk_buff *skb, int i,
                                      struct page *page, int off, int size)
{
        skb_frag_t *frag = &((struct skb_shared_info *)((skb)->end))->frags[i];

        frag->page = page;
        frag->page_offset = off;
        frag->size = size;
        ((struct skb_shared_info *)((skb)->end))->nr_frags = i + 1;
}
# 823 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) unsigned char *__skb_put(struct sk_buff *skb, unsigned int len)
{
        unsigned char *tmp = skb->tail;
        do { if (__builtin_expect(!!((skb_is_nonlinear(skb))!=0), 0)) do { asm volatile("1:\tud2\n" ".pushsection __bug_table,\"a\"\n" "2:\t.long 1b, %c0\n" "\t.word %c1, 0\n" "\t.org 2b+%c2\n" ".popsection" : : "i" ("include/linux/skbuff.h"), "i" (826), "i" (sizeof(struct bug_entry))); for(;;) ; } while(0); } while(0);
        skb->tail += len;
        skb->len += len;
        return tmp;
}
# 841 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) unsigned char *skb_put(struct sk_buff *skb, unsigned int len)
{
        unsigned char *tmp = skb->tail;
        do { if (__builtin_expect(!!((skb_is_nonlinear(skb))!=0), 0)) do { asm volatile("1:\tud2\n" ".pushsection __bug_table,\"a\"\n" "2:\t.long 1b, %c0\n" "\t.word %c1, 0\n" "\t.org 2b+%c2\n" ".popsection" : : "i" ("include/linux/skbuff.h"), "i" (844), "i" (sizeof(struct bug_entry))); for(;;) ; } while(0); } while(0);
        skb->tail += len;
        skb->len += len;
        if (__builtin_expect(!!(skb->tail>skb->end), 0))
                skb_over_panic(skb, len, ({ void *pc; __asm__("movl $1f,%0\n1:":"=g" (pc)); pc; }));
        return tmp;
}

static inline __attribute__((always_inline)) unsigned char *__skb_push(struct sk_buff *skb, unsigned int len)
{
        skb->data -= len;
        skb->len += len;
        return skb->data;
}
# 868 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) unsigned char *skb_push(struct sk_buff *skb, unsigned int len)
{
        skb->data -= len;
        skb->len += len;
        if (__builtin_expect(!!(skb->data<skb->head), 0))
                skb_under_panic(skb, len, ({ void *pc; __asm__("movl $1f,%0\n1:":"=g" (pc)); pc; }));
        return skb->data;
}

static inline __attribute__((always_inline)) unsigned char *__skb_pull(struct sk_buff *skb, unsigned int len)
{
        skb->len -= len;
        do { if (__builtin_expect(!!((skb->len < skb->data_len)!=0), 0)) do { asm volatile("1:\tud2\n" ".pushsection __bug_table,\"a\"\n" "2:\t.long 1b, %c0\n" "\t.word %c1, 0\n" "\t.org 2b+%c2\n" ".popsection" : : "i" ("include/linux/skbuff.h"), "i" (880), "i" (sizeof(struct bug_entry))); for(;;) ; } while(0); } while(0);
        return skb->data += len;
}
# 894 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) unsigned char *skb_pull(struct sk_buff *skb, unsigned int len)
{
        return __builtin_expect(!!(len > skb->len), 0) ? ((void *)0) : __skb_pull(skb, len);
}

extern unsigned char *__pskb_pull_tail(struct sk_buff *skb, int delta);

static inline __attribute__((always_inline)) unsigned char *__pskb_pull(struct sk_buff *skb, unsigned int len)
{
        if (len > skb_headlen(skb) &&
            !__pskb_pull_tail(skb, len-skb_headlen(skb)))
                return ((void *)0);
        skb->len -= len;
        return skb->data += len;
}

static inline __attribute__((always_inline)) unsigned char *pskb_pull(struct sk_buff *skb, unsigned int len)
{
        return __builtin_expect(!!(len > skb->len), 0) ? ((void *)0) : __pskb_pull(skb, len);
}

static inline __attribute__((always_inline)) int pskb_may_pull(struct sk_buff *skb, unsigned int len)
{
        if (__builtin_expect(!!(len <= skb_headlen(skb)), 1))
                return 1;
        if (__builtin_expect(!!(len > skb->len), 0))
                return 0;
        return __pskb_pull_tail(skb, len-skb_headlen(skb)) != ((void *)0);
}







static inline __attribute__((always_inline)) int skb_headroom(const struct sk_buff *skb)
{
        return skb->data - skb->head;
}







static inline __attribute__((always_inline)) int skb_tailroom(const struct sk_buff *skb)
{
        return skb_is_nonlinear(skb) ? 0 : skb->end - skb->tail;
}
# 954 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_reserve(struct sk_buff *skb, int len)
{
        skb->data += len;
        skb->tail += len;
}
# 1003 "include/linux/skbuff.h"
extern int ___pskb_trim(struct sk_buff *skb, unsigned int len);

static inline __attribute__((always_inline)) void __skb_trim(struct sk_buff *skb, unsigned int len)
{
        if (__builtin_expect(!!(skb->data_len), 0)) {
                ({ typeof(1) __ret_warn_on = (1); if (__builtin_expect(!!(__ret_warn_on), 0)) { printk("BUG: at %s:%d %s()\n", "include/linux/skbuff.h", 1008, (__func__)); dump_stack(); } __builtin_expect(!!(__ret_warn_on), 0); });
                return;
        }
        skb->len = len;
        skb->tail = skb->data + len;
}
# 1024 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_trim(struct sk_buff *skb, unsigned int len)
{
        if (skb->len > len)
                __skb_trim(skb, len);
}


static inline __attribute__((always_inline)) int __pskb_trim(struct sk_buff *skb, unsigned int len)
{
        if (skb->data_len)
                return ___pskb_trim(skb, len);
        __skb_trim(skb, len);
        return 0;
}

static inline __attribute__((always_inline)) int pskb_trim(struct sk_buff *skb, unsigned int len)
{
        return (len < skb->len) ? __pskb_trim(skb, len) : 0;
}
# 1053 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void pskb_trim_unique(struct sk_buff *skb, unsigned int len)
{
        int err = pskb_trim(skb, len);
        do { if (__builtin_expect(!!((err)!=0), 0)) do { asm volatile("1:\tud2\n" ".pushsection __bug_table,\"a\"\n" "2:\t.long 1b, %c0\n" "\t.word %c1, 0\n" "\t.org 2b+%c2\n" ".popsection" : : "i" ("include/linux/skbuff.h"), "i" (1056), "i" (sizeof(struct bug_entry))); for(;;) ; } while(0); } while(0);
}
# 1067 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_orphan(struct sk_buff *skb)
{
        if (skb->destructor)
                skb->destructor(skb);
        skb->destructor = ((void *)0);
        skb->sk = ((void *)0);
}
# 1083 "include/linux/skbuff.h"
extern void skb_queue_purge(struct sk_buff_head *list);
static inline __attribute__((always_inline)) void __skb_queue_purge(struct sk_buff_head *list)
{
        struct sk_buff *skb;
        while ((skb = __skb_dequeue(list)) != ((void *)0))
                kfree_skb(skb);
}
# 1103 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *__dev_alloc_skb(unsigned int length,
                                              gfp_t gfp_mask)
{
        struct sk_buff *skb = alloc_skb(length + 16, gfp_mask);
        if (__builtin_expect(!!(skb), 1))
                skb_reserve(skb, 16);
        return skb;
}
# 1124 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *dev_alloc_skb(unsigned int length)
{
        return __dev_alloc_skb(length, ((( gfp_t)0x20u)));
}

extern struct sk_buff *__netdev_alloc_skb(struct net_device *dev,
                unsigned int length, gfp_t gfp_mask);
# 1145 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) struct sk_buff *netdev_alloc_skb(struct net_device *dev,
                unsigned int length)
{
        return __netdev_alloc_skb(dev, length, ((( gfp_t)0x20u)));
}
# 1163 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_cow(struct sk_buff *skb, unsigned int headroom)
{
        int delta = (headroom > 16 ? headroom : 16) -
                        skb_headroom(skb);

        if (delta < 0)
                delta = 0;

        if (delta || skb_cloned(skb))
                return pskb_expand_head(skb, (delta + (16 -1)) &
                                ~(16 -1), 0, ((( gfp_t)0x20u)));
        return 0;
}
# 1188 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_padto(struct sk_buff *skb, unsigned int len)
{
        unsigned int size = skb->len;
        if (__builtin_expect(!!(size >= len), 1))
                return 0;
        return skb_pad(skb, len-size);
}

static inline __attribute__((always_inline)) int skb_add_data(struct sk_buff *skb,
                               char *from, int copy)
{
        const int off = skb->len;

        if (skb->ip_summed == 0) {
                int err = 0;
                __wsum csum = csum_and_copy_from_user(from, skb_put(skb, copy),
                                                            copy, 0, &err);
                if (!err) {
                        skb->csum = csum_block_add(skb->csum, csum, off);
                        return 0;
                }
        } else if (!copy_from_user(skb_put(skb, copy), from, copy))
                return 0;

        __skb_trim(skb, off);
        return -14;
}

static inline __attribute__((always_inline)) int skb_can_coalesce(struct sk_buff *skb, int i,
                                   struct page *page, int off)
{
        if (i) {
                struct skb_frag_struct *frag = &((struct skb_shared_info *)((skb)->end))->frags[i - 1];

                return page == frag->page &&
                       off == frag->page_offset + frag->size;
        }
        return 0;
}

static inline __attribute__((always_inline)) int __skb_linearize(struct sk_buff *skb)
{
        return __pskb_pull_tail(skb, skb->data_len) ? 0 : -12;
}
# 1240 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_linearize(struct sk_buff *skb)
{
        return skb_is_nonlinear(skb) ? __skb_linearize(skb) : 0;
}
# 1252 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int skb_linearize_cow(struct sk_buff *skb)
{
        return skb_is_nonlinear(skb) || skb_cloned(skb) ?
               __skb_linearize(skb) : 0;
}
# 1269 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_postpull_rcsum(struct sk_buff *skb,
                                      const void *start, unsigned int len)
{
        if (skb->ip_summed == 3)
                skb->csum = csum_sub(skb->csum, csum_partial(start, len, 0));
}

unsigned char *skb_pull_rcsum(struct sk_buff *skb, unsigned int len);
# 1287 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) int pskb_trim_rcsum(struct sk_buff *skb, unsigned int len)
{
        if (__builtin_expect(!!(len >= skb->len), 1))
                return 0;
        if (skb->ip_summed == 3)
                skb->ip_summed = 0;
        return __pskb_trim(skb, len);
}
# 1307 "include/linux/skbuff.h"
extern struct sk_buff *skb_recv_datagram(struct sock *sk, unsigned flags,
                                         int noblock, int *err);
extern unsigned int datagram_poll(struct file *file, struct socket *sock,
                                     struct poll_table_struct *wait);
extern int skb_copy_datagram_iovec(const struct sk_buff *from,
                                               int offset, struct iovec *to,
                                               int size);
extern int skb_copy_and_csum_datagram_iovec(struct sk_buff *skb,
                                                        int hlen,
                                                        struct iovec *iov);
extern void skb_free_datagram(struct sock *sk, struct sk_buff *skb);
extern void skb_kill_datagram(struct sock *sk, struct sk_buff *skb,
                                         unsigned int flags);
extern __wsum skb_checksum(const struct sk_buff *skb, int offset,
                                    int len, __wsum csum);
extern int skb_copy_bits(const struct sk_buff *skb, int offset,
                                     void *to, int len);
extern int skb_store_bits(const struct sk_buff *skb, int offset,
                                      void *from, int len);
extern __wsum skb_copy_and_csum_bits(const struct sk_buff *skb,
                                              int offset, u8 *to, int len,
                                              __wsum csum);
extern void skb_copy_and_csum_dev(const struct sk_buff *skb, u8 *to);
extern void skb_split(struct sk_buff *skb,
                                 struct sk_buff *skb1, const u32 len);

extern struct sk_buff *skb_segment(struct sk_buff *skb, int features);

static inline __attribute__((always_inline)) void *skb_header_pointer(const struct sk_buff *skb, int offset,
                                       int len, void *buffer)
{
        int hlen = skb_headlen(skb);

        if (hlen - offset >= len)
                return skb->data + offset;

        if (skb_copy_bits(skb, offset, buffer, len) < 0)
                return ((void *)0);

        return buffer;
}

extern void skb_init(void);
extern void skb_add_mtu(int mtu);
# 1361 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_get_timestamp(const struct sk_buff *skb, struct timeval *stamp)
{
        stamp->tv_sec = skb->tstamp.off_sec;
        stamp->tv_usec = skb->tstamp.off_usec;
}
# 1376 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_set_timestamp(struct sk_buff *skb, const struct timeval *stamp)
{
        skb->tstamp.off_sec = stamp->tv_sec;
        skb->tstamp.off_usec = stamp->tv_usec;
}

extern void __net_timestamp(struct sk_buff *skb);

extern __sum16 __skb_checksum_complete(struct sk_buff *skb);
# 1402 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) unsigned int skb_checksum_complete(struct sk_buff *skb)
{
        return skb->ip_summed != 2 &&
                __skb_checksum_complete(skb);
}
# 1458 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void nf_reset(struct sk_buff *skb) {}
# 1472 "include/linux/skbuff.h"
static inline __attribute__((always_inline)) void skb_copy_secmark(struct sk_buff *to, const struct sk_buff *from)
{ }

static inline __attribute__((always_inline)) void skb_init_secmark(struct sk_buff *skb)
{ }


static inline __attribute__((always_inline)) int skb_is_gso(const struct sk_buff *skb)
{
        return ((struct skb_shared_info *)((skb)->end))->gso_size;
}
# 139 "include/linux/netlink.h" 2

struct netlink_skb_parms
{
        struct ucred creds;
        __u32 pid;
        __u32 dst_group;
        kernel_cap_t eff_cap;
        __u32 loginuid;
        __u32 sid;
};





extern struct sock *netlink_kernel_create(int unit, unsigned int groups, void (*input)(struct sock *sk, int len), struct module *module);
extern void netlink_ack(struct sk_buff *in_skb, struct nlmsghdr *nlh, int err);
extern int netlink_has_listeners(struct sock *sk, unsigned int group);
extern int netlink_unicast(struct sock *ssk, struct sk_buff *skb, __u32 pid, int nonblock);
extern int netlink_broadcast(struct sock *ssk, struct sk_buff *skb, __u32 pid,
                             __u32 group, gfp_t allocation);
extern void netlink_set_err(struct sock *ssk, __u32 pid, __u32 group, int code);
extern int netlink_register_notifier(struct notifier_block *nb);
extern int netlink_unregister_notifier(struct notifier_block *nb);


struct sock *netlink_getsockbyfilp(struct file *filp);
int netlink_attachskb(struct sock *sk, struct sk_buff *skb, int nonblock,
                long timeo, struct sock *ssk);
void netlink_detachskb(struct sock *sk, struct sk_buff *skb);
int netlink_sendskb(struct sock *sk, struct sk_buff *skb, int protocol);
# 179 "include/linux/netlink.h"
struct netlink_callback
{
        struct sk_buff *skb;
        struct nlmsghdr *nlh;
        int (*dump)(struct sk_buff * skb, struct netlink_callback *cb);
        int (*done)(struct netlink_callback *cb);
        int family;
        long args[5];
};

struct netlink_notify
{
        int pid;
        int protocol;
};

static __inline__ __attribute__((always_inline)) struct nlmsghdr *
__nlmsg_put(struct sk_buff *skb, u32 pid, u32 seq, int type, int len, int flags)
{
        struct nlmsghdr *nlh;
        int size = ((len)+( ((((int) ( ((sizeof(struct nlmsghdr))+4 -1) & ~(4 -1) )))+4 -1) & ~(4 -1) ));

        nlh = (struct nlmsghdr*)skb_put(skb, ( ((size)+4 -1) & ~(4 -1) ));
        nlh->nlmsg_type = type;
        nlh->nlmsg_len = size;
        nlh->nlmsg_flags = flags;
        nlh->nlmsg_pid = pid;
        nlh->nlmsg_seq = seq;
        (__builtin_constant_p(0) ? (__builtin_constant_p((( ((size)+4 -1) & ~(4 -1) ) - size)) ? __constant_c_and_count_memset(((((void*)(((char*)nlh) + ((0)+( ((((int) ( ((sizeof(struct nlmsghdr))+4 -1) & ~(4 -1) )))+4 -1) & ~(4 -1) )))) + len)),((0x01010101UL*(unsigned char)(0))),((( ((size)+4 -1) & ~(4 -1) ) - size))) : __constant_c_memset(((((void*)(((char*)nlh) + ((0)+( ((((int) ( ((sizeof(struct nlmsghdr))+4 -1) & ~(4 -1) )))+4 -1) & ~(4 -1) )))) + len)),((0x01010101UL*(unsigned char)(0))),((( ((size)+4 -1) & ~(4 -1) ) - size)))) : (__builtin_constant_p((( ((size)+4 -1) & ~(4 -1) ) - size)) ? __memset_generic((((((void*)(((char*)nlh) + ((0)+( ((((int) ( ((sizeof(struct nlmsghdr))+4 -1) & ~(4 -1) )))+4 -1) & ~(4 -1) )))) + len))),(((0))),(((( ((size)+4 -1) & ~(4 -1) ) - size)))) : __memset_generic(((((void*)(((char*)nlh) + ((0)+( ((((int) ( ((sizeof(struct nlmsghdr))+4 -1) & ~(4 -1) )))+4 -1) & ~(4 -1) )))) + len)),((0)),((( ((size)+4 -1) & ~(4 -1) ) - size)))));
        return nlh;
}
# 231 "include/linux/netlink.h"
extern int netlink_dump_start(struct sock *ssk, struct sk_buff *skb,
                              struct nlmsghdr *nlh,
                              int (*dump)(struct sk_buff *skb, struct netlink_callback*),
                              int (*done)(struct netlink_callback*));




extern void netlink_set_nonroot(int protocol, unsigned flag);
# 5 "include/linux/genetlink.h" 2






struct genlmsghdr {
        __u8 cmd;
        __u8 version;
        __u16 reserved;
};
# 34 "include/linux/genetlink.h"
enum {
        CTRL_CMD_UNSPEC,
        CTRL_CMD_NEWFAMILY,
        CTRL_CMD_DELFAMILY,
        CTRL_CMD_GETFAMILY,
        CTRL_CMD_NEWOPS,
        CTRL_CMD_DELOPS,
        CTRL_CMD_GETOPS,
        __CTRL_CMD_MAX,
};



enum {
        CTRL_ATTR_UNSPEC,
        CTRL_ATTR_FAMILY_ID,
        CTRL_ATTR_FAMILY_NAME,
        CTRL_ATTR_VERSION,
        CTRL_ATTR_HDRSIZE,
        CTRL_ATTR_MAXATTR,
        CTRL_ATTR_OPS,
        __CTRL_ATTR_MAX,
};



enum {
        CTRL_ATTR_OP_UNSPEC,
        CTRL_ATTR_OP_ID,
        CTRL_ATTR_OP_FLAGS,
        __CTRL_ATTR_OP_MAX,
};
# 5 "include/net/genetlink.h" 2
# 1 "include/net/netlink.h" 1
# 163 "include/net/netlink.h"
enum {
        NLA_UNSPEC,
        NLA_U8,
        NLA_U16,
        NLA_U32,
        NLA_U64,
        NLA_STRING,
        NLA_FLAG,
        NLA_MSECS,
        NLA_NESTED,
        NLA_NUL_STRING,
        __NLA_TYPE_MAX,
};
# 200 "include/net/netlink.h"
struct nla_policy {
        u16 type;
        u16 len;
};






struct nl_info {
        struct nlmsghdr *nlh;
        u32 pid;
};

extern void netlink_run_queue(struct sock *sk, unsigned int *qlen,
                                          int (*cb)(struct sk_buff *,
                                                    struct nlmsghdr *, int *));
extern void netlink_queue_skip(struct nlmsghdr *nlh,
                                           struct sk_buff *skb);
extern int nlmsg_notify(struct sock *sk, struct sk_buff *skb,
                                     u32 pid, unsigned int group, int report,
                                     gfp_t flags);

extern int nla_validate(struct nlattr *head, int len, int maxtype,
                                     struct nla_policy *policy);
extern int nla_parse(struct nlattr *tb[], int maxtype,
                                  struct nlattr *head, int len,
                                  struct nla_policy *policy);
extern struct nlattr * nla_find(struct nlattr *head, int len, int attrtype);
extern size_t nla_strlcpy(char *dst, const struct nlattr *nla,
                                    size_t dstsize);
extern int nla_memcpy(void *dest, struct nlattr *src, int count);
extern int nla_memcmp(const struct nlattr *nla, const void *data,
                                   size_t size);
extern int nla_strcmp(const struct nlattr *nla, const char *str);
extern struct nlattr * __nla_reserve(struct sk_buff *skb, int attrtype,
                                      int attrlen);
extern void * __nla_reserve_nohdr(struct sk_buff *skb, int attrlen);
extern struct nlattr * nla_reserve(struct sk_buff *skb, int attrtype,
                                    int attrlen);
extern void * nla_reserve_nohdr(struct sk_buff *skb, int attrlen);
extern void __nla_put(struct sk_buff *skb, int attrtype,
                                  int attrlen, const void *data);
extern void __nla_put_nohdr(struct sk_buff *skb, int attrlen,
                                        const void *data);
extern int nla_put(struct sk_buff *skb, int attrtype,
                                int attrlen, const void *data);
extern int nla_put_nohdr(struct sk_buff *skb, int attrlen,
                                      const void *data);
# 259 "include/net/netlink.h"
static inline __attribute__((always_inline)) int nlmsg_msg_size(int payload)
{
        return ((int) ( ((sizeof(struct nlmsghdr))+4 -1) & ~(4 -1) )) + payload;
}





static inline __attribute__((always_inline)) int nlmsg_total_size(int payload)
{
        return ( ((nlmsg_msg_size(payload))+4 -1) & ~(4 -1) );
}





static inline __attribute__((always_inline)) int nlmsg_padlen(int payload)
{
        return nlmsg_total_size(payload) - nlmsg_msg_size(payload);
}





static inline __attribute__((always_inline)) void *nlmsg_data(const struct nlmsghdr *nlh)
{
        return (unsigned char *) nlh + ((int) ( ((sizeof(struct nlmsghdr))+4 -1) & ~(4 -1) ));
}





static inline __attribute__((always_inline)) int nlmsg_len(const struct nlmsghdr *nlh)
{
        return nlh->nlmsg_len - ((int) ( ((sizeof(struct nlmsghdr))+4 -1) & ~(4 -1) ));
}






static inline __attribute__((always_inline)) struct nlattr *nlmsg_attrdata(const struct nlmsghdr *nlh,
                                            int hdrlen)
{
        unsigned char *data = nlmsg_data(nlh);
        return (struct nlattr *) (data + ( ((hdrlen)+4 -1) & ~(4 -1) ));
}






static inline __attribute__((always_inline)) int nlmsg_attrlen(const struct nlmsghdr *nlh, int hdrlen)
{
        return nlmsg_len(nlh) - ( ((hdrlen)+4 -1) & ~(4 -1) );
}






static inline __attribute__((always_inline)) int nlmsg_ok(const struct nlmsghdr *nlh, int remaining)
{
        return (remaining >= sizeof(struct nlmsghdr) &&
                nlh->nlmsg_len >= sizeof(struct nlmsghdr) &&
                nlh->nlmsg_len <= remaining);
}
# 342 "include/net/netlink.h"
static inline __attribute__((always_inline)) struct nlmsghdr *nlmsg_next(struct nlmsghdr *nlh, int *remaining)
{
        int totlen = ( ((nlh->nlmsg_len)+4 -1) & ~(4 -1) );

        *remaining -= totlen;

        return (struct nlmsghdr *) ((unsigned char *) nlh + totlen);
}
# 361 "include/net/netlink.h"
static inline __attribute__((always_inline)) int nlmsg_parse(struct nlmsghdr *nlh, int hdrlen,
                              struct nlattr *tb[], int maxtype,
                              struct nla_policy *policy)
{
        if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen))
                return -22;

        return nla_parse(tb, maxtype, nlmsg_attrdata(nlh, hdrlen),
                         nlmsg_attrlen(nlh, hdrlen), policy);
}
# 380 "include/net/netlink.h"
static inline __attribute__((always_inline)) struct nlattr *nlmsg_find_attr(struct nlmsghdr *nlh,
                                             int hdrlen, int attrtype)
{
        return nla_find(nlmsg_attrdata(nlh, hdrlen),
                        nlmsg_attrlen(nlh, hdrlen), attrtype);
}
# 394 "include/net/netlink.h"
static inline __attribute__((always_inline)) int nlmsg_validate(struct nlmsghdr *nlh, int hdrlen, int maxtype,
                                 struct nla_policy *policy)
{
        if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen))
                return -22;

        return nla_validate(nlmsg_attrdata(nlh, hdrlen),
                            nlmsg_attrlen(nlh, hdrlen), maxtype, policy);
}







static inline __attribute__((always_inline)) int nlmsg_report(struct nlmsghdr *nlh)
{
        return !!(nlh->nlmsg_flags & 8);
}
# 473 "include/net/netlink.h"
static inline __attribute__((always_inline)) struct nlmsghdr *nlmsg_put(struct sk_buff *skb, u32 pid, u32 seq,
                                         int type, int payload, int flags)
{
        if (__builtin_expect(!!(skb_tailroom(skb) < nlmsg_total_size(payload)), 0))
                return ((void *)0);

        return __nlmsg_put(skb, pid, seq, type, payload, flags);
}
# 493 "include/net/netlink.h"
static inline __attribute__((always_inline)) struct nlmsghdr *nlmsg_put_answer(struct sk_buff *skb,
                                                struct netlink_callback *cb,
                                                int type, int payload,
                                                int flags)
{
        return nlmsg_put(skb, (*(struct netlink_skb_parms*)&((cb->skb)->cb)).pid, cb->nlh->nlmsg_seq,
                         type, payload, flags);
}
# 510 "include/net/netlink.h"
static inline __attribute__((always_inline)) struct sk_buff *nlmsg_new(size_t payload, gfp_t flags)
{
        return alloc_skb(nlmsg_total_size(payload), flags);
}
# 526 "include/net/netlink.h"
static inline __attribute__((always_inline)) int nlmsg_end(struct sk_buff *skb, struct nlmsghdr *nlh)
{
        nlh->nlmsg_len = skb->tail - (unsigned char *) nlh;

        return skb->len;
}







static inline __attribute__((always_inline)) void *nlmsg_get_pos(struct sk_buff *skb)
{
        return skb->tail;
}
# 551 "include/net/netlink.h"
static inline __attribute__((always_inline)) int nlmsg_trim(struct sk_buff *skb, void *mark)
{
        if (mark)
                skb_trim(skb, (unsigned char *) mark - skb->data);

        return -1;
}
# 567 "include/net/netlink.h"
static inline __attribute__((always_inline)) int nlmsg_cancel(struct sk_buff *skb, struct nlmsghdr *nlh)
{
        return nlmsg_trim(skb, nlh);
}





static inline __attribute__((always_inline)) void nlmsg_free(struct sk_buff *skb)
{
        kfree_skb(skb);
}
# 589 "include/net/netlink.h"
static inline __attribute__((always_inline)) int nlmsg_multicast(struct sock *sk, struct sk_buff *skb,
                                  u32 pid, unsigned int group, gfp_t flags)
{
        int err;

        (*(struct netlink_skb_parms*)&((skb)->cb)).dst_group = group;

        err = netlink_broadcast(sk, skb, pid, group, flags);
        if (err > 0)
                err = 0;

        return err;
}







static inline __attribute__((always_inline)) int nlmsg_unicast(struct sock *sk, struct sk_buff *skb, u32 pid)
{
        int err;

        err = netlink_unicast(sk, skb, pid, 0x40);
        if (err > 0)
                err = 0;

        return err;
}
# 640 "include/net/netlink.h"
static inline __attribute__((always_inline)) int nla_attr_size(int payload)
{
        return ((int) (((sizeof(struct nlattr)) + 4 - 1) & ~(4 - 1))) + payload;
}





static inline __attribute__((always_inline)) int nla_total_size(int payload)
{
        return (((nla_attr_size(payload)) + 4 - 1) & ~(4 - 1));
}





static inline __attribute__((always_inline)) int nla_padlen(int payload)
{
        return nla_total_size(payload) - nla_attr_size(payload);
}





static inline __attribute__((always_inline)) void *nla_data(const struct nlattr *nla)
{
        return (char *) nla + ((int) (((sizeof(struct nlattr)) + 4 - 1) & ~(4 - 1)));
}





static inline __attribute__((always_inline)) int nla_len(const struct nlattr *nla)
{
        return nla->nla_len - ((int) (((sizeof(struct nlattr)) + 4 - 1) & ~(4 - 1)));
}






static inline __attribute__((always_inline)) int nla_ok(const struct nlattr *nla, int remaining)
{
        return remaining >= sizeof(*nla) &&
               nla->nla_len >= sizeof(*nla) &&
               nla->nla_len <= remaining;
}
# 701 "include/net/netlink.h"
static inline __attribute__((always_inline)) struct nlattr *nla_next(const struct nlattr *nla, int *remaining)
{
        int totlen = (((nla->nla_len) + 4 - 1) & ~(4 - 1));

        *remaining -= totlen;
        return (struct nlattr *) ((char *) nla + totlen);
}
# 716 "include/net/netlink.h"
static inline __attribute__((always_inline)) struct nlattr *nla_find_nested(struct nlattr *nla, int attrtype)
{
        return nla_find(nla_data(nla), nla_len(nla), attrtype);
}
# 730 "include/net/netlink.h"
static inline __attribute__((always_inline)) int nla_parse_nested(struct nlattr *tb[], int maxtype,
                                   struct nlattr *nla,
                                   struct nla_policy *policy)
{
        return nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), policy);
}






static inline __attribute__((always_inline)) int nla_put_u8(struct sk_buff *skb, int attrtype, u8 value)
{
        return nla_put(skb, attrtype, sizeof(u8), &value);
}







static inline __attribute__((always_inline)) int nla_put_u16(struct sk_buff *skb, int attrtype, u16 value)
{
        return nla_put(skb, attrtype, sizeof(u16), &value);
}







static inline __attribute__((always_inline)) int nla_put_u32(struct sk_buff *skb, int attrtype, u32 value)
{
        return nla_put(skb, attrtype, sizeof(u32), &value);
}







static inline __attribute__((always_inline)) int nla_put_u64(struct sk_buff *skb, int attrtype, u64 value)
{
        return nla_put(skb, attrtype, sizeof(u64), &value);
}







static inline __attribute__((always_inline)) int nla_put_string(struct sk_buff *skb, int attrtype,
                                 const char *str)
{
        return nla_put(skb, attrtype, strlen(str) + 1, str);
}






static inline __attribute__((always_inline)) int nla_put_flag(struct sk_buff *skb, int attrtype)
{
        return nla_put(skb, attrtype, 0, ((void *)0));
}







static inline __attribute__((always_inline)) int nla_put_msecs(struct sk_buff *skb, int attrtype,
                                unsigned long jiffies)
{
        u64 tmp = jiffies_to_msecs(jiffies);
        return nla_put(skb, attrtype, sizeof(u64), &tmp);
}
# 858 "include/net/netlink.h"
static inline __attribute__((always_inline)) u32 nla_get_u32(struct nlattr *nla)
{
        return *(u32 *) nla_data(nla);
}





static inline __attribute__((always_inline)) __be32 nla_get_be32(struct nlattr *nla)
{
        return *(__be32 *) nla_data(nla);
}





static inline __attribute__((always_inline)) u16 nla_get_u16(struct nlattr *nla)
{
        return *(u16 *) nla_data(nla);
}





static inline __attribute__((always_inline)) __le16 nla_get_le16(struct nlattr *nla)
{
        return *(__le16 *) nla_data(nla);
}





static inline __attribute__((always_inline)) u8 nla_get_u8(struct nlattr *nla)
{
        return *(u8 *) nla_data(nla);
}





static inline __attribute__((always_inline)) u64 nla_get_u64(struct nlattr *nla)
{
        u64 tmp;

        nla_memcpy(&tmp, nla, sizeof(tmp));

        return tmp;
}





static inline __attribute__((always_inline)) int nla_get_flag(struct nlattr *nla)
{
        return !!nla;
}







static inline __attribute__((always_inline)) unsigned long nla_get_msecs(struct nlattr *nla)
{
        u64 msecs = nla_get_u64(nla);

        return msecs_to_jiffies((unsigned long) msecs);
}
# 941 "include/net/netlink.h"
static inline __attribute__((always_inline)) struct nlattr *nla_nest_start(struct sk_buff *skb, int attrtype)
{
        struct nlattr *start = (struct nlattr *) skb->tail;

        if (nla_put(skb, attrtype, 0, ((void *)0)) < 0)
                return ((void *)0);

        return start;
}
# 961 "include/net/netlink.h"
static inline __attribute__((always_inline)) int nla_nest_end(struct sk_buff *skb, struct nlattr *start)
{
        start->nla_len = skb->tail - (unsigned char *) start;
        return skb->len;
}
# 975 "include/net/netlink.h"
static inline __attribute__((always_inline)) int nla_nest_cancel(struct sk_buff *skb, struct nlattr *start)
{
        return nlmsg_trim(skb, start);
}
# 992 "include/net/netlink.h"
static inline __attribute__((always_inline)) int nla_validate_nested(struct nlattr *start, int maxtype,
                                      struct nla_policy *policy)
{
        return nla_validate(nla_data(start), nla_len(start), maxtype, policy);
}
# 6 "include/net/genetlink.h" 2
# 18 "include/net/genetlink.h"
struct genl_family
{
        unsigned int id;
        unsigned int hdrsize;
        char name[16];
        unsigned int version;
        unsigned int maxattr;
        struct nlattr ** attrbuf;
        struct list_head ops_list;
        struct list_head family_list;
};
# 39 "include/net/genetlink.h"
struct genl_info
{
        u32 snd_seq;
        u32 snd_pid;
        struct nlmsghdr * nlhdr;
        struct genlmsghdr * genlhdr;
        void * userhdr;
        struct nlattr ** attrs;
};
# 59 "include/net/genetlink.h"
struct genl_ops
{
        u8 cmd;
        unsigned int flags;
        struct nla_policy *policy;
        int (*doit)(struct sk_buff *skb,
                                       struct genl_info *info);
        int (*dumpit)(struct sk_buff *skb,
                                         struct netlink_callback *cb);
        int (*done)(struct netlink_callback *cb);
        struct list_head ops_list;
};

extern int genl_register_family(struct genl_family *family);
extern int genl_unregister_family(struct genl_family *family);
extern int genl_register_ops(struct genl_family *, struct genl_ops *ops);
extern int genl_unregister_ops(struct genl_family *, struct genl_ops *ops);

extern struct sock *genl_sock;
# 90 "include/net/genetlink.h"
static inline __attribute__((always_inline)) void *genlmsg_put(struct sk_buff *skb, u32 pid, u32 seq,
                                struct genl_family *family, int flags, u8 cmd)
{
        struct nlmsghdr *nlh;
        struct genlmsghdr *hdr;

        nlh = nlmsg_put(skb, pid, seq, family->id, ( ((sizeof(struct genlmsghdr))+4 -1) & ~(4 -1) ) +
                        family->hdrsize, flags);
        if (nlh == ((void *)0))
                return ((void *)0);

        hdr = nlmsg_data(nlh);
        hdr->cmd = cmd;
        hdr->version = family->version;
        hdr->reserved = 0;

        return (char *) hdr + ( ((sizeof(struct genlmsghdr))+4 -1) & ~(4 -1) );
}
# 119 "include/net/genetlink.h"
static inline __attribute__((always_inline)) void *genlmsg_put_reply(struct sk_buff *skb,
                                      struct genl_info *info,
                                      struct genl_family *family,
                                      int flags, u8 cmd)
{
        return genlmsg_put(skb, info->snd_pid, info->snd_seq, family,
                           flags, cmd);
}






static inline __attribute__((always_inline)) int genlmsg_end(struct sk_buff *skb, void *hdr)
{
        return nlmsg_end(skb, hdr - ( ((sizeof(struct genlmsghdr))+4 -1) & ~(4 -1) ) - ((int) ( ((sizeof(struct nlmsghdr))+4 -1) & ~(4 -1) )));
}






static inline __attribute__((always_inline)) int genlmsg_cancel(struct sk_buff *skb, void *hdr)
{
        return nlmsg_cancel(skb, hdr - ( ((sizeof(struct genlmsghdr))+4 -1) & ~(4 -1) ) - ((int) ( ((sizeof(struct nlmsghdr))+4 -1) & ~(4 -1) )));
}
# 155 "include/net/genetlink.h"
static inline __attribute__((always_inline)) int genlmsg_multicast(struct sk_buff *skb, u32 pid,
                                    unsigned int group, gfp_t flags)
{
        return nlmsg_multicast(genl_sock, skb, pid, group, flags);
}






static inline __attribute__((always_inline)) int genlmsg_unicast(struct sk_buff *skb, u32 pid)
{
        return nlmsg_unicast(genl_sock, skb, pid);
}






static inline __attribute__((always_inline)) int genlmsg_reply(struct sk_buff *skb, struct genl_info *info)
{
        return genlmsg_unicast(skb, info->snd_pid);
}





static inline __attribute__((always_inline)) void *genlmsg_data(const struct genlmsghdr *gnlh)
{
        return ((unsigned char *) gnlh + ( ((sizeof(struct genlmsghdr))+4 -1) & ~(4 -1) ));
}





static inline __attribute__((always_inline)) int genlmsg_len(const struct genlmsghdr *gnlh)
{
        struct nlmsghdr *nlh = (struct nlmsghdr *)((unsigned char *)gnlh -
                                                        ((int) ( ((sizeof(struct nlmsghdr))+4 -1) & ~(4 -1) )));
        return (nlh->nlmsg_len - ( ((sizeof(struct genlmsghdr))+4 -1) & ~(4 -1) ) - ((int) ( ((sizeof(struct nlmsghdr))+4 -1) & ~(4 -1) )));
}





static inline __attribute__((always_inline)) int genlmsg_msg_size(int payload)
{
        return ( ((sizeof(struct genlmsghdr))+4 -1) & ~(4 -1) ) + payload;
}





static inline __attribute__((always_inline)) int genlmsg_total_size(int payload)
{
        return ( ((genlmsg_msg_size(payload))+4 -1) & ~(4 -1) );
}






static inline __attribute__((always_inline)) struct sk_buff *genlmsg_new(size_t payload, gfp_t flags)
{
        return nlmsg_new(genlmsg_total_size(payload), flags);
}
# 13 "include/linux/taskstats_kern.h" 2
# 32 "include/linux/taskstats_kern.h"
static inline __attribute__((always_inline)) void taskstats_exit(struct task_struct *tsk, int group_dead)
{}
static inline __attribute__((always_inline)) void taskstats_tgid_init(struct signal_struct *sig)
{}
static inline __attribute__((always_inline)) void taskstats_tgid_free(struct signal_struct *sig)
{}
static inline __attribute__((always_inline)) void taskstats_init_early(void)
{}
# 44 "init/main.c" 2
# 1 "include/linux/delayacct.h" 1
# 100 "include/linux/delayacct.h"
static inline __attribute__((always_inline)) void delayacct_set_flag(int flag)
{}
static inline __attribute__((always_inline)) void delayacct_clear_flag(int flag)
{}
static inline __attribute__((always_inline)) void delayacct_init(void)
{}
static inline __attribute__((always_inline)) void delayacct_tsk_init(struct task_struct *tsk)
{}
static inline __attribute__((always_inline)) void delayacct_tsk_free(struct task_struct *tsk)
{}
static inline __attribute__((always_inline)) void delayacct_blkio_start(void)
{}
static inline __attribute__((always_inline)) void delayacct_blkio_end(void)
{}
static inline __attribute__((always_inline)) int delayacct_add_tsk(struct taskstats *d,
                                        struct task_struct *tsk)
{ return 0; }
static inline __attribute__((always_inline)) __u64 delayacct_blkio_ticks(struct task_struct *tsk)
{ return 0; }
# 45 "init/main.c" 2

# 1 "include/linux/rmap.h" 1
# 9 "include/linux/rmap.h"
# 1 "include/linux/mm.h" 1
# 17 "include/linux/mm.h"
# 1 "include/linux/debug_locks.h" 1



struct task_struct;

extern int debug_locks;
extern int debug_locks_silent;




extern int debug_locks_off(void);
# 46 "include/linux/debug_locks.h"
struct task_struct;







static inline __attribute__((always_inline)) void debug_show_all_locks(void)
{
}

static inline __attribute__((always_inline)) void debug_show_held_locks(struct task_struct *task)
{
}

static inline __attribute__((always_inline)) void
debug_check_no_locks_freed(const void *from, unsigned long len)
{
}

static inline __attribute__((always_inline)) void
debug_check_no_locks_held(struct task_struct *task)
{
}
# 18 "include/linux/mm.h" 2
# 1 "include/linux/backing-dev.h" 1
# 13 "include/linux/backing-dev.h"
struct page;




enum bdi_state {
        BDI_pdflush,
        BDI_write_congested,
        BDI_read_congested,
        BDI_unused,
};

typedef int (congested_fn)(void *, int);

struct backing_dev_info {
        unsigned long ra_pages;
        unsigned long state;
        unsigned int capabilities;
        congested_fn *congested_fn;
        void *congested_data;
        void (*unplug_io_fn)(struct backing_dev_info *, struct page *);
        void *unplug_io_data;
};
# 63 "include/linux/backing-dev.h"
extern struct backing_dev_info default_backing_dev_info;
void default_unplug_io_fn(struct backing_dev_info *bdi, struct page *page);

int writeback_acquire(struct backing_dev_info *bdi);
int writeback_in_progress(struct backing_dev_info *bdi);
void writeback_release(struct backing_dev_info *bdi);

static inline __attribute__((always_inline)) int bdi_congested(struct backing_dev_info *bdi, int bdi_bits)
{
        if (bdi->congested_fn)
                return bdi->congested_fn(bdi->congested_data, bdi_bits);
        return (bdi->state & bdi_bits);
}

static inline __attribute__((always_inline)) int bdi_read_congested(struct backing_dev_info *bdi)
{
        return bdi_congested(bdi, 1 << BDI_read_congested);
}

static inline __attribute__((always_inline)) int bdi_write_congested(struct backing_dev_info *bdi)
{
        return bdi_congested(bdi, 1 << BDI_write_congested);
}

static inline __attribute__((always_inline)) int bdi_rw_congested(struct backing_dev_info *bdi)
{
        return bdi_congested(bdi, (1 << BDI_read_congested)|
                                  (1 << BDI_write_congested));
}

void clear_bdi_congested(struct backing_dev_info *bdi, int rw);
void set_bdi_congested(struct backing_dev_info *bdi, int rw);
long congestion_wait(int rw, long timeout);
void congestion_end(int rw);
# 19 "include/linux/mm.h" 2
# 1 "include/linux/mm_types.h" 1
# 9 "include/linux/mm_types.h"
struct address_space;
# 18 "include/linux/mm_types.h"
struct page {
        unsigned long flags;

        atomic_t _count;
        atomic_t _mapcount;



        union {
            struct {
                unsigned long private;






                struct address_space *mapping;






            };

            spinlock_t ptl;

        };
        unsigned long index;
        struct list_head lru;
# 65 "include/linux/mm_types.h"
};
# 20 "include/linux/mm.h" 2

struct mempolicy;
struct anon_vma;


extern unsigned long max_mapnr;


extern unsigned long num_physpages;
extern void * high_memory;
extern unsigned long vmalloc_earlyreserve;
extern int page_cluster;


extern int sysctl_legacy_va_layout;





# 1 "include/asm/pgtable.h" 1
# 18 "include/asm/pgtable.h"
# 1 "include/asm/paravirt.h" 1
# 19 "include/asm/pgtable.h" 2
# 28 "include/asm/pgtable.h"
struct mm_struct;
struct vm_area_struct;






extern unsigned long empty_zero_page[1024];
extern pgd_t swapper_pg_dir[1024];
extern struct kmem_cache *pgd_cache;
extern struct kmem_cache *pmd_cache;
extern spinlock_t pgd_lock;
extern struct page *pgd_list;

void pmd_ctor(void *, struct kmem_cache *, unsigned long);
void pgd_ctor(void *, struct kmem_cache *, unsigned long);
void pgd_dtor(void *, struct kmem_cache *, unsigned long);
void pgtable_cache_init(void);
void paging_init(void);
# 59 "include/asm/pgtable.h"
# 1 "include/asm/pgtable-2level-defs.h" 1
# 60 "include/asm/pgtable.h" 2
# 160 "include/asm/pgtable.h"
extern unsigned long long __PAGE_KERNEL, __PAGE_KERNEL_EXEC;
# 204 "include/asm/pgtable.h"
extern unsigned long pg0[];
# 220 "include/asm/pgtable.h"
static inline __attribute__((always_inline)) int pte_user(pte_t pte) { return (pte).pte_low & 0x004; }
static inline __attribute__((always_inline)) int pte_read(pte_t pte) { return (pte).pte_low & 0x004; }
static inline __attribute__((always_inline)) int pte_dirty(pte_t pte) { return (pte).pte_low & 0x040; }
static inline __attribute__((always_inline)) int pte_young(pte_t pte) { return (pte).pte_low & 0x020; }
static inline __attribute__((always_inline)) int pte_write(pte_t pte) { return (pte).pte_low & 0x002; }
static inline __attribute__((always_inline)) int pte_huge(pte_t pte) { return (pte).pte_low & 0x080; }




static inline __attribute__((always_inline)) int pte_file(pte_t pte) { return (pte).pte_low & 0x040; }

static inline __attribute__((always_inline)) pte_t pte_rdprotect(pte_t pte) { (pte).pte_low &= ~0x004; return pte; }
static inline __attribute__((always_inline)) pte_t pte_exprotect(pte_t pte) { (pte).pte_low &= ~0x004; return pte; }
static inline __attribute__((always_inline)) pte_t pte_mkclean(pte_t pte) { (pte).pte_low &= ~0x040; return pte; }
static inline __attribute__((always_inline)) pte_t pte_mkold(pte_t pte) { (pte).pte_low &= ~0x020; return pte; }
static inline __attribute__((always_inline)) pte_t pte_wrprotect(pte_t pte) { (pte).pte_low &= ~0x002; return pte; }
static inline __attribute__((always_inline)) pte_t pte_mkread(pte_t pte) { (pte).pte_low |= 0x004; return pte; }
static inline __attribute__((always_inline)) pte_t pte_mkexec(pte_t pte) { (pte).pte_low |= 0x004; return pte; }
static inline __attribute__((always_inline)) pte_t pte_mkdirty(pte_t pte) { (pte).pte_low |= 0x040; return pte; }
static inline __attribute__((always_inline)) pte_t pte_mkyoung(pte_t pte) { (pte).pte_low |= 0x020; return pte; }
static inline __attribute__((always_inline)) pte_t pte_mkwrite(pte_t pte) { (pte).pte_low |= 0x002; return pte; }
static inline __attribute__((always_inline)) pte_t pte_mkhuge(pte_t pte) { (pte).pte_low |= 0x080; return pte; }




# 1 "include/asm/pgtable-2level.h" 1
# 37 "include/asm/pgtable-2level.h"
static inline __attribute__((always_inline)) int pte_exec(pte_t pte)
{
        return pte_user(pte);
}




static inline __attribute__((always_inline)) int pte_exec_kernel(pte_t pte)
{
        return 1;
}
# 69 "include/asm/pgtable-2level.h"
void vmalloc_sync_all(void);
# 248 "include/asm/pgtable.h" 2
# 330 "include/asm/pgtable.h"
static inline __attribute__((always_inline)) pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
{
        pte_t pte = ((pte_t) { (((__typeof__(*(&(ptep)->pte_low)))__xchg((unsigned long)(0),(&(ptep)->pte_low),sizeof(*(&(ptep)->pte_low))))) } );
        do { } while (0);
        return pte;
}


static inline __attribute__((always_inline)) pte_t ptep_get_and_clear_full(struct mm_struct *mm, unsigned long addr, pte_t *ptep, int full)
{
        pte_t pte;
        if (full) {
                pte = *ptep;
                do { (*(ptep) = ((pte_t) { (0) } )); } while (0);
        } else {
                pte = ptep_get_and_clear(mm, addr, ptep);
        }
        return pte;
}


static inline __attribute__((always_inline)) void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
{
        clear_bit(1, &ptep->pte_low);
        do { } while (0);
}
# 367 "include/asm/pgtable.h"
static inline __attribute__((always_inline)) void clone_pgd_range(pgd_t *dst, pgd_t *src, int count)
{
       (__builtin_constant_p(count * sizeof(pgd_t)) ? __constant_memcpy((dst),(src),(count * sizeof(pgd_t))) : __memcpy((dst),(src),(count * sizeof(pgd_t))));
}
# 386 "include/asm/pgtable.h"
static inline __attribute__((always_inline)) pte_t pte_modify(pte_t pte, pgprot_t newprot)
{
        pte.pte_low &= ((~((1UL << 12)-1)) | 0x020 | 0x040);
        pte.pte_low |= ((newprot).pgprot);
# 399 "include/asm/pgtable.h"
        return pte;
}
# 457 "include/asm/pgtable.h"
extern pte_t *lookup_address(unsigned long address);
# 468 "include/asm/pgtable.h"
 static inline __attribute__((always_inline)) int set_kernel_exec(unsigned long vaddr, int enable) { return 0;}
# 511 "include/asm/pgtable.h"
# 1 "include/asm-generic/pgtable.h" 1
# 215 "include/asm-generic/pgtable.h"
void pgd_clear_bad(pgd_t *);
void pud_clear_bad(pud_t *);
void pmd_clear_bad(pmd_t *);

static inline __attribute__((always_inline)) int pgd_none_or_clear_bad(pgd_t *pgd)
{
        if (pgd_none(*pgd))
                return 1;
        if (__builtin_expect(!!(pgd_bad(*pgd)), 0)) {
                pgd_clear_bad(pgd);
                return 1;
        }
        return 0;
}

static inline __attribute__((always_inline)) int pud_none_or_clear_bad(pud_t *pud)
{
        if (pud_none(*pud))
                return 1;
        if (__builtin_expect(!!(pud_bad(*pud)), 0)) {
                pud_clear_bad(pud);
                return 1;
        }
        return 0;
}

static inline __attribute__((always_inline)) int pmd_none_or_clear_bad(pmd_t *pmd)
{
        if ((!(unsigned long)((((((*pmd).pud).pgd).pgd)))))
                return 1;
        if (__builtin_expect(!!(((((((((*pmd).pud).pgd).pgd))) & (~(~((1UL << 12)-1)) & ~0x004)) != (0x001 | 0x002 | 0x020 | 0x040))), 0)) {
                pmd_clear_bad(pmd);
                return 1;
        }
        return 0;
}
# 512 "include/asm/pgtable.h" 2
# 41 "include/linux/mm.h" 2
# 60 "include/linux/mm.h"
struct vm_area_struct {
        struct mm_struct * vm_mm;
        unsigned long vm_start;
        unsigned long vm_end;



        struct vm_area_struct *vm_next;

        pgprot_t vm_page_prot;
        unsigned long vm_flags;

        struct rb_node vm_rb;







        union {
                struct {
                        struct list_head list;
                        void *parent;
                        struct vm_area_struct *head;
                } vm_set;

                struct raw_prio_tree_node prio_tree_node;
        } shared;







        struct list_head anon_vma_node;
        struct anon_vma *anon_vma;


        struct vm_operations_struct * vm_ops;


        unsigned long vm_pgoff;

        struct file * vm_file;
        void * vm_private_data;
        unsigned long vm_truncate_count;







};

extern struct kmem_cache *vm_area_cachep;






struct vm_list_struct {
        struct vm_list_struct *next;
        struct vm_area_struct *vma;
};
# 193 "include/linux/mm.h"
extern pgprot_t protection_map[16];







struct vm_operations_struct {
        void (*open)(struct vm_area_struct * area);
        void (*close)(struct vm_area_struct * area);
        struct page * (*nopage)(struct vm_area_struct * area, unsigned long address, int *type);
        unsigned long (*nopfn)(struct vm_area_struct * area, unsigned long address);
        int (*populate)(struct vm_area_struct * area, unsigned long address, unsigned long len, pgprot_t prot, unsigned long pgoff, int nonblock);



        int (*page_mkwrite)(struct vm_area_struct *vma, struct page *page);







};

struct mmu_gather;
struct inode;
# 230 "include/linux/mm.h"
# 1 "include/linux/page-flags.h" 1
# 254 "include/linux/page-flags.h"
struct page;

extern void cancel_dirty_page(struct page *page, unsigned int account_size);

int test_clear_page_writeback(struct page *page);
int test_set_page_writeback(struct page *page);

static inline __attribute__((always_inline)) void set_page_writeback(struct page *page)
{
        test_set_page_writeback(page);
}
# 231 "include/linux/mm.h" 2
# 254 "include/linux/mm.h"
static inline __attribute__((always_inline)) int put_page_testzero(struct page *page)
{
        do { } while(0);
        return atomic_dec_and_test(&page->_count);
}





static inline __attribute__((always_inline)) int get_page_unless_zero(struct page *page)
{
        do { } while(0);
        return ({ int c, old; c = (((&page->_count))->counter); for (;;) { if (__builtin_expect(!!(c == (0)), 0)) break; old = ((int)((__typeof__(*(&((((&page->_count)))->counter))))__cmpxchg((&((((&page->_count)))->counter)),(unsigned long)(c), (unsigned long)(c + (1)),sizeof(*(&((((&page->_count)))->counter)))))); if (__builtin_expect(!!(old == c), 1)) break; c = old; } c != (0); });
}

static inline __attribute__((always_inline)) int page_count(struct page *page)
{
        if (__builtin_expect(!!((__builtin_constant_p(14) ? constant_test_bit((14),(&(page)->flags)) : variable_test_bit((14),(&(page)->flags)))), 0))
                page = (struct page *)((page)->private);
        return ((&page->_count)->counter);
}

static inline __attribute__((always_inline)) void get_page(struct page *page)
{
        if (__builtin_expect(!!((__builtin_constant_p(14) ? constant_test_bit((14),(&(page)->flags)) : variable_test_bit((14),(&(page)->flags)))), 0))
                page = (struct page *)((page)->private);
        do { } while(0);
        atomic_inc(&page->_count);
}





static inline __attribute__((always_inline)) void init_page_count(struct page *page)
{
        (((&page->_count)->counter) = (1));
}

void put_page(struct page *page);
void put_pages_list(struct list_head *pages);

void split_page(struct page *page, unsigned int order);






typedef void compound_page_dtor(struct page *);

static inline __attribute__((always_inline)) void set_compound_page_dtor(struct page *page,
                                                compound_page_dtor *dtor)
{
        page[1].lru.next = (void *)dtor;
}

static inline __attribute__((always_inline)) compound_page_dtor *get_compound_page_dtor(struct page *page)
{
        return (compound_page_dtor *)page[1].lru.next;
}
# 459 "include/linux/mm.h"
static inline __attribute__((always_inline)) enum zone_type page_zonenum(struct page *page)
{
        return (page->flags >> (((((sizeof(unsigned long)*8) - 0) - 0) - 2) * (2 != 0))) & ((1UL << 2) - 1);
}
# 472 "include/linux/mm.h"
static inline __attribute__((always_inline)) int page_zone_id(struct page *page)
{
        ((void)sizeof(char[1 - 2*!!((((((sizeof(unsigned long)*8) - 0) - 0) - 2) * (2 != 0)) == 0 && ((1UL << (0 + 2)) - 1))]));
        return (page->flags >> (((((sizeof(unsigned long)*8) - 0) - 0) - 2) * (2 != 0))) & ((1UL << (0 + 2)) - 1);
}

static inline __attribute__((always_inline)) int zone_to_nid(struct zone *zone)
{



        return 0;

}




static inline __attribute__((always_inline)) int page_to_nid(struct page *page)
{
        return (page->flags >> ((((sizeof(unsigned long)*8) - 0) - 0) * (0 != 0))) & ((1UL << 0) - 1);
}


static inline __attribute__((always_inline)) struct zone *page_zone(struct page *page)
{
        return &(&contig_page_data)->node_zones[page_zonenum(page)];
}

static inline __attribute__((always_inline)) unsigned long page_to_section(struct page *page)
{
        return (page->flags >> (((sizeof(unsigned long)*8) - 0) * (0 != 0))) & ((1UL << 0) - 1);
}

static inline __attribute__((always_inline)) void set_page_zone(struct page *page, enum zone_type zone)
{
        page->flags &= ~(((1UL << 2) - 1) << (((((sizeof(unsigned long)*8) - 0) - 0) - 2) * (2 != 0)));
        page->flags |= (zone & ((1UL << 2) - 1)) << (((((sizeof(unsigned long)*8) - 0) - 0) - 2) * (2 != 0));
}

static inline __attribute__((always_inline)) void set_page_node(struct page *page, unsigned long node)
{
        page->flags &= ~(((1UL << 0) - 1) << ((((sizeof(unsigned long)*8) - 0) - 0) * (0 != 0)));
        page->flags |= (node & ((1UL << 0) - 1)) << ((((sizeof(unsigned long)*8) - 0) - 0) * (0 != 0));
}

static inline __attribute__((always_inline)) void set_page_section(struct page *page, unsigned long section)
{
        page->flags &= ~(((1UL << 0) - 1) << (((sizeof(unsigned long)*8) - 0) * (0 != 0)));
        page->flags |= (section & ((1UL << 0) - 1)) << (((sizeof(unsigned long)*8) - 0) * (0 != 0));
}

static inline __attribute__((always_inline)) void set_page_links(struct page *page, enum zone_type zone,
        unsigned long node, unsigned long pfn)
{
        set_page_zone(page, zone);
        set_page_node(page, node);
        set_page_section(page, ((pfn) >> 0));
}




# 1 "include/linux/vmstat.h" 1
# 35 "include/linux/vmstat.h"
enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
                PGALLOC_DMA, PGALLOC_NORMAL , PGALLOC_HIGH,
                PGFREE, PGACTIVATE, PGDEACTIVATE,
                PGFAULT, PGMAJFAULT,
                PGREFILL_DMA, PGREFILL_NORMAL , PGREFILL_HIGH,
                PGSTEAL_DMA, PGSTEAL_NORMAL , PGSTEAL_HIGH,
                PGSCAN_KSWAPD_DMA, PGSCAN_KSWAPD_NORMAL , PGSCAN_KSWAPD_HIGH,
                PGSCAN_DIRECT_DMA, PGSCAN_DIRECT_NORMAL , PGSCAN_DIRECT_HIGH,
                PGINODESTEAL, SLABS_SCANNED, KSWAPD_STEAL, KSWAPD_INODESTEAL,
                PAGEOUTRUN, ALLOCSTALL, PGROTATED,
                NR_VM_EVENT_ITEMS
};

struct vm_event_state {
        unsigned long event[NR_VM_EVENT_ITEMS];
};

extern __typeof__(struct vm_event_state) per_cpu__vm_event_states;

static inline __attribute__((always_inline)) void __count_vm_event(enum vm_event_item item)
{
        (*({ extern int simple_identifier_vm_event_states(void); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"(&per_cpu__vm_event_states)); (typeof(&per_cpu__vm_event_states)) (__ptr + (__per_cpu_offset[(({ typeof(_proxy_pda.cpu_number) ret__; switch (sizeof(_proxy_pda.cpu_number)) { case 1: asm("mov" "b %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 2: asm("mov" "w %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 4: asm("mov" "l %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; default: __bad_pda_field(); } ret__; }))])); }); })).event[item]++;
}

static inline __attribute__((always_inline)) void count_vm_event(enum vm_event_item item)
{
        (*({ extern int simple_identifier_vm_event_states(void); do { } while (0); &(*({ extern int simple_identifier_vm_event_states(void); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"(&per_cpu__vm_event_states)); (typeof(&per_cpu__vm_event_states)) (__ptr + (__per_cpu_offset[(({ typeof(_proxy_pda.cpu_number) ret__; switch (sizeof(_proxy_pda.cpu_number)) { case 1: asm("mov" "b %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 2: asm("mov" "w %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 4: asm("mov" "l %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; default: __bad_pda_field(); } ret__; }))])); }); })); })).event[item]++;
        do { } while (0);
}

static inline __attribute__((always_inline)) void __count_vm_events(enum vm_event_item item, long delta)
{
        (*({ extern int simple_identifier_vm_event_states(void); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"(&per_cpu__vm_event_states)); (typeof(&per_cpu__vm_event_states)) (__ptr + (__per_cpu_offset[(({ typeof(_proxy_pda.cpu_number) ret__; switch (sizeof(_proxy_pda.cpu_number)) { case 1: asm("mov" "b %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 2: asm("mov" "w %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 4: asm("mov" "l %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; default: __bad_pda_field(); } ret__; }))])); }); })).event[item] += delta;
}

static inline __attribute__((always_inline)) void count_vm_events(enum vm_event_item item, long delta)
{
        (*({ extern int simple_identifier_vm_event_states(void); do { } while (0); &(*({ extern int simple_identifier_vm_event_states(void); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"(&per_cpu__vm_event_states)); (typeof(&per_cpu__vm_event_states)) (__ptr + (__per_cpu_offset[(({ typeof(_proxy_pda.cpu_number) ret__; switch (sizeof(_proxy_pda.cpu_number)) { case 1: asm("mov" "b %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 2: asm("mov" "w %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 4: asm("mov" "l %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; default: __bad_pda_field(); } ret__; }))])); }); })); })).event[item] += delta;
        do { } while (0);
}

extern void all_vm_events(unsigned long *);

extern void vm_events_fold_cpu(int cpu);
# 103 "include/linux/vmstat.h"
extern atomic_long_t vm_stat[NR_VM_ZONE_STAT_ITEMS];

static inline __attribute__((always_inline)) void zone_page_state_add(long x, struct zone *zone,
                                 enum zone_stat_item item)
{
        atomic_long_add(x, &zone->vm_stat[item]);
        atomic_long_add(x, &vm_stat[item]);
}

static inline __attribute__((always_inline)) unsigned long global_page_state(enum zone_stat_item item)
{
        long x = atomic_long_read(&vm_stat[item]);

        if (x < 0)
                x = 0;

        return x;
}

static inline __attribute__((always_inline)) unsigned long zone_page_state(struct zone *zone,
                                        enum zone_stat_item item)
{
        long x = atomic_long_read(&zone->vm_stat[item]);

        if (x < 0)
                x = 0;

        return x;
}
# 172 "include/linux/vmstat.h"
static inline __attribute__((always_inline)) void zap_zone_vm_stats(struct zone *zone)
{
        (__builtin_constant_p(0) ? (__builtin_constant_p((sizeof(zone->vm_stat))) ? __constant_c_and_count_memset(((zone->vm_stat)),((0x01010101UL*(unsigned char)(0))),((sizeof(zone->vm_stat)))) : __constant_c_memset(((zone->vm_stat)),((0x01010101UL*(unsigned char)(0))),((sizeof(zone->vm_stat))))) : (__builtin_constant_p((sizeof(zone->vm_stat))) ? __memset_generic((((zone->vm_stat))),(((0))),(((sizeof(zone->vm_stat))))) : __memset_generic(((zone->vm_stat)),((0)),((sizeof(zone->vm_stat))))));
}

extern void inc_zone_state(struct zone *, enum zone_stat_item);


void __mod_zone_page_state(struct zone *, enum zone_stat_item item, int);
void __inc_zone_page_state(struct page *, enum zone_stat_item);
void __dec_zone_page_state(struct page *, enum zone_stat_item);

void mod_zone_page_state(struct zone *, enum zone_stat_item, int);
void inc_zone_page_state(struct page *, enum zone_stat_item);
void dec_zone_page_state(struct page *, enum zone_stat_item);

extern void inc_zone_state(struct zone *, enum zone_stat_item);

void refresh_cpu_vm_stats(int);
void refresh_vm_stats(void);
# 536 "include/linux/mm.h" 2

static inline __attribute__((always_inline)) __attribute__((always_inline)) void *lowmem_page_address(struct page *page)
{
        return ((void *)((unsigned long)(((unsigned long)((page) - mem_map) + (0UL)) << 12)+((unsigned long)((unsigned long)0xC0000000))));
}
# 556 "include/linux/mm.h"
void *page_address(struct page *page);
void set_page_address(struct page *page, void *virtual);
void page_address_init(void);
# 578 "include/linux/mm.h"
extern struct address_space swapper_space;
static inline __attribute__((always_inline)) struct address_space *page_mapping(struct page *page)
{
        struct address_space *mapping = page->mapping;

        if (__builtin_expect(!!((__builtin_constant_p(15) ? constant_test_bit((15),(&(page)->flags)) : variable_test_bit((15),(&(page)->flags)))), 0))
                mapping = &swapper_space;
        else if (__builtin_expect(!!((unsigned long)mapping & 1), 0))
                mapping = ((void *)0);
        return mapping;
}

static inline __attribute__((always_inline)) int PageAnon(struct page *page)
{
        return ((unsigned long)page->mapping & 1) != 0;
}





static inline __attribute__((always_inline)) unsigned long page_index(struct page *page)
{
        if (__builtin_expect(!!((__builtin_constant_p(15) ? constant_test_bit((15),(&(page)->flags)) : variable_test_bit((15),(&(page)->flags)))), 0))
                return ((page)->private);
        return page->index;
}






static inline __attribute__((always_inline)) void reset_page_mapcount(struct page *page)
{
        (((&(page)->_mapcount)->counter) = (-1));
}

static inline __attribute__((always_inline)) int page_mapcount(struct page *page)
{
        return ((&(page)->_mapcount)->counter) + 1;
}




static inline __attribute__((always_inline)) int page_mapped(struct page *page)
{
        return ((&(page)->_mapcount)->counter) >= 0;
}
# 660 "include/linux/mm.h"
extern void show_free_areas(void);


struct page *shmem_nopage(struct vm_area_struct *vma,
                        unsigned long address, int *type);
int shmem_set_policy(struct vm_area_struct *vma, struct mempolicy *new);
struct mempolicy *shmem_get_policy(struct vm_area_struct *vma,
                                        unsigned long addr);
int shmem_lock(struct file *file, int lock, struct user_struct *user);
# 690 "include/linux/mm.h"
struct file *shmem_file_setup(char *name, loff_t size, unsigned long flags);
extern int shmem_mmap(struct file *file, struct vm_area_struct *vma);

int shmem_zero_setup(struct vm_area_struct *);
# 703 "include/linux/mm.h"
static inline __attribute__((always_inline)) int can_do_mlock(void)
{
        if (capable(14))
                return 1;
        if (get_current()->signal->rlim[8].rlim_cur != 0)
                return 1;
        return 0;
}
extern int user_shm_lock(size_t, struct user_struct *);
extern void user_shm_unlock(size_t, struct user_struct *);




struct zap_details {
        struct vm_area_struct *nonlinear_vma;
        struct address_space *check_mapping;
        unsigned long first_index;
        unsigned long last_index;
        spinlock_t *i_mmap_lock;
        unsigned long truncate_count;
};

struct page *vm_normal_page(struct vm_area_struct *, unsigned long, pte_t);
unsigned long zap_page_range(struct vm_area_struct *vma, unsigned long address,
                unsigned long size, struct zap_details *);
unsigned long unmap_vmas(struct mmu_gather **tlb,
                struct vm_area_struct *start_vma, unsigned long start_addr,
                unsigned long end_addr, unsigned long *nr_accounted,
                struct zap_details *);
void free_pgd_range(struct mmu_gather **tlb, unsigned long addr,
                unsigned long end, unsigned long floor, unsigned long ceiling);
void free_pgtables(struct mmu_gather **tlb, struct vm_area_struct *start_vma,
                unsigned long floor, unsigned long ceiling);
int copy_page_range(struct mm_struct *dst, struct mm_struct *src,
                        struct vm_area_struct *vma);
int zeromap_page_range(struct vm_area_struct *vma, unsigned long from,
                        unsigned long size, pgprot_t prot);
void unmap_mapping_range(struct address_space *mapping,
                loff_t const holebegin, loff_t const holelen, int even_cows);

static inline __attribute__((always_inline)) void unmap_shared_mapping_range(struct address_space *mapping,
                loff_t const holebegin, loff_t const holelen)
{
        unmap_mapping_range(mapping, holebegin, holelen, 0);
}

extern int vmtruncate(struct inode * inode, loff_t offset);
extern int vmtruncate_range(struct inode * inode, loff_t offset, loff_t end);
extern int install_page(struct mm_struct *mm, struct vm_area_struct *vma, unsigned long addr, struct page *page, pgprot_t prot);
extern int install_file_pte(struct mm_struct *mm, struct vm_area_struct *vma, unsigned long addr, unsigned long pgoff, pgprot_t prot);


extern int __handle_mm_fault(struct mm_struct *mm,struct vm_area_struct *vma,
                        unsigned long address, int write_access);

static inline __attribute__((always_inline)) int handle_mm_fault(struct mm_struct *mm,
                        struct vm_area_struct *vma, unsigned long address,
                        int write_access)
{
        return __handle_mm_fault(mm, vma, address, write_access) &
                                (~0x10);
}
# 777 "include/linux/mm.h"
extern int make_pages_present(unsigned long addr, unsigned long end);
extern int access_process_vm(struct task_struct *tsk, unsigned long addr, void *buf, int len, int write);
void install_arg_page(struct vm_area_struct *, struct page *, unsigned long);

int get_user_pages(struct task_struct *tsk, struct mm_struct *mm, unsigned long start,
                int len, int write, int force, struct page **pages, struct vm_area_struct **vmas);
void print_bad_pte(struct vm_area_struct *, pte_t, unsigned long);

extern int try_to_release_page(struct page * page, gfp_t gfp_mask);
extern void do_invalidatepage(struct page *page, unsigned long offset);

int __set_page_dirty_nobuffers(struct page *page);
int redirty_page_for_writepage(struct writeback_control *wbc,
                                struct page *page);
int set_page_dirty(struct page *page) __attribute__((regparm(3)));
int set_page_dirty_lock(struct page *page);
int clear_page_dirty_for_io(struct page *page);

extern unsigned long do_mremap(unsigned long addr,
                               unsigned long old_len, unsigned long new_len,
                               unsigned long flags, unsigned long new_addr);
# 810 "include/linux/mm.h"
typedef int (*shrinker_t)(int nr_to_scan, gfp_t gfp_mask);







struct shrinker;
extern struct shrinker *set_shrinker(int, shrinker_t);
extern void remove_shrinker(struct shrinker *shrinker);







static inline __attribute__((always_inline)) int vma_wants_writenotify(struct vm_area_struct *vma)
{
        unsigned int vm_flags = vma->vm_flags;


        if ((vm_flags & (0x00000002|0x00000008)) != ((0x00000002|0x00000008)))
                return 0;


        if (vma->vm_ops && vma->vm_ops->page_mkwrite)
                return 1;


        if (((vma->vm_page_prot).pgprot) !=
            ((protection_map[vm_flags & (0x00000001|0x00000002|0x00000004|0x00000008)]).pgprot))

                return 0;


        if (vm_flags & (0x00000400|0x02000000))
                return 0;


        return vma->vm_file && vma->vm_file->f_mapping &&
                (!(((vma->vm_file->f_mapping)->backing_dev_info)->capabilities & 0x00000001));
}

extern pte_t *get_locked_pte(struct mm_struct *mm, unsigned long addr, spinlock_t **ptl) __attribute__((regparm(3)));

int __pud_alloc(struct mm_struct *mm, pgd_t *pgd, unsigned long address);
int __pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address);
int __pte_alloc(struct mm_struct *mm, pmd_t *pmd, unsigned long address);
int __pte_alloc_kernel(pmd_t *pmd, unsigned long address);






static inline __attribute__((always_inline)) pud_t *pud_alloc(struct mm_struct *mm, pgd_t *pgd, unsigned long address)
{
        return (__builtin_expect(!!(pgd_none(*pgd)), 0) && __pud_alloc(mm, pgd, address))?
                ((void *)0): pud_offset(pgd, address);
}

static inline __attribute__((always_inline)) pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
{
        return (__builtin_expect(!!(pud_none(*pud)), 0) && __pmd_alloc(mm, pud, address))?
                ((void *)0): pmd_offset(pud, address);
}
# 928 "include/linux/mm.h"
extern void free_area_init(unsigned long * zones_size);
extern void free_area_init_node(int nid, pg_data_t *pgdat,
        unsigned long * zones_size, unsigned long zone_start_pfn,
        unsigned long *zholes_size);
# 960 "include/linux/mm.h"
extern void free_area_init_nodes(unsigned long *max_zone_pfn);
extern void add_active_range(unsigned int nid, unsigned long start_pfn,
                                        unsigned long end_pfn);
extern void shrink_active_range(unsigned int nid, unsigned long old_end_pfn,
                                                unsigned long new_end_pfn);
extern void push_node_boundaries(unsigned int nid, unsigned long start_pfn,
                                        unsigned long end_pfn);
extern void remove_all_active_ranges(void);
extern unsigned long absent_pages_in_range(unsigned long start_pfn,
                                                unsigned long end_pfn);
extern void get_pfn_range_for_nid(unsigned int nid,
                        unsigned long *start_pfn, unsigned long *end_pfn);
extern unsigned long find_min_pfn_with_active_regions(void);
extern unsigned long find_max_pfn_with_active_regions(void);
extern void free_bootmem_with_active_regions(int nid,
                                                unsigned long max_low_pfn);
extern void sparse_memory_present_with_active_regions(int nid);

extern int early_pfn_to_nid(unsigned long pfn);


extern void set_dma_reserve(unsigned long new_dma_reserve);
extern void memmap_init_zone(unsigned long, int, unsigned long,
                                unsigned long, enum memmap_context);
extern void setup_per_zone_pages_min(void);
extern void mem_init(void);
extern void show_mem(void);
extern void si_meminfo(struct sysinfo * val);
extern void si_meminfo_node(struct sysinfo *val, int nid);




static inline __attribute__((always_inline)) void setup_per_cpu_pageset(void) {}



void vma_prio_tree_add(struct vm_area_struct *, struct vm_area_struct *old);
void vma_prio_tree_insert(struct vm_area_struct *, struct prio_tree_root *);
void vma_prio_tree_remove(struct vm_area_struct *, struct prio_tree_root *);
struct vm_area_struct *vma_prio_tree_next(struct vm_area_struct *vma,
        struct prio_tree_iter *iter);





static inline __attribute__((always_inline)) void vma_nonlinear_insert(struct vm_area_struct *vma,
                                        struct list_head *list)
{
        vma->shared.vm_set.parent = ((void *)0);
        list_add_tail(&vma->shared.vm_set.list, list);
}


extern int __vm_enough_memory(long pages, int cap_sys_admin);
extern void vma_adjust(struct vm_area_struct *vma, unsigned long start,
        unsigned long end, unsigned long pgoff, struct vm_area_struct *insert);
extern struct vm_area_struct *vma_merge(struct mm_struct *,
        struct vm_area_struct *prev, unsigned long addr, unsigned long end,
        unsigned long vm_flags, struct anon_vma *, struct file *, unsigned long,
        struct mempolicy *);
extern struct anon_vma *find_mergeable_anon_vma(struct vm_area_struct *);
extern int split_vma(struct mm_struct *,
        struct vm_area_struct *, unsigned long addr, int new_below);
extern int insert_vm_struct(struct mm_struct *, struct vm_area_struct *);
extern void __vma_link_rb(struct mm_struct *, struct vm_area_struct *,
        struct rb_node **, struct rb_node *);
extern void unlink_file_vma(struct vm_area_struct *);
extern struct vm_area_struct *copy_vma(struct vm_area_struct **,
        unsigned long addr, unsigned long len, unsigned long pgoff);
extern void exit_mmap(struct mm_struct *);
extern int may_expand_vm(struct mm_struct *mm, unsigned long npages);

extern unsigned long get_unmapped_area(struct file *, unsigned long, unsigned long, unsigned long, unsigned long);

extern unsigned long do_mmap_pgoff(struct file *file, unsigned long addr,
        unsigned long len, unsigned long prot,
        unsigned long flag, unsigned long pgoff);

static inline __attribute__((always_inline)) unsigned long do_mmap(struct file *file, unsigned long addr,
        unsigned long len, unsigned long prot,
        unsigned long flag, unsigned long offset)
{
        unsigned long ret = -22;
        if ((offset + (((len)+(1UL << 12)-1)&(~((1UL << 12)-1)))) < offset)
                goto out;
        if (!(offset & ~(~((1UL << 12)-1))))
                ret = do_mmap_pgoff(file, addr, len, prot, flag, offset >> 12);
out:
        return ret;
}

extern int do_munmap(struct mm_struct *, unsigned long, size_t);

extern unsigned long do_brk(unsigned long, unsigned long);


extern unsigned long page_unuse(struct page *);
extern void truncate_inode_pages(struct address_space *, loff_t);
extern void truncate_inode_pages_range(struct address_space *,
                                       loff_t lstart, loff_t lend);


extern struct page *filemap_nopage(struct vm_area_struct *, unsigned long, int *);
extern int filemap_populate(struct vm_area_struct *, unsigned long,
                unsigned long, pgprot_t, unsigned long, int);


int write_one_page(struct page *page, int wait);







int do_page_cache_readahead(struct address_space *mapping, struct file *filp,
                        unsigned long offset, unsigned long nr_to_read);
int force_page_cache_readahead(struct address_space *mapping, struct file *filp,
                        unsigned long offset, unsigned long nr_to_read);
unsigned long page_cache_readahead(struct address_space *mapping,
                          struct file_ra_state *ra,
                          struct file *filp,
                          unsigned long offset,
                          unsigned long size);
void handle_ra_miss(struct address_space *mapping,
                    struct file_ra_state *ra, unsigned long offset);
unsigned long max_sane_readahead(unsigned long nr);


extern int expand_stack(struct vm_area_struct *vma, unsigned long address);





extern struct vm_area_struct * find_vma(struct mm_struct * mm, unsigned long addr);
extern struct vm_area_struct * find_vma_prev(struct mm_struct * mm, unsigned long addr,
                                             struct vm_area_struct **pprev);



static inline __attribute__((always_inline)) struct vm_area_struct * find_vma_intersection(struct mm_struct * mm, unsigned long start_addr, unsigned long end_addr)
{
        struct vm_area_struct * vma = find_vma(mm,start_addr);

        if (vma && end_addr <= vma->vm_start)
                vma = ((void *)0);
        return vma;
}

static inline __attribute__((always_inline)) unsigned long vma_pages(struct vm_area_struct *vma)
{
        return (vma->vm_end - vma->vm_start) >> 12;
}

pgprot_t vm_get_page_prot(unsigned long vm_flags);
struct vm_area_struct *find_extend_vma(struct mm_struct *, unsigned long addr);
struct page *vmalloc_to_page(void *addr);
unsigned long vmalloc_to_pfn(void *addr);
int remap_pfn_range(struct vm_area_struct *, unsigned long addr,
                        unsigned long pfn, unsigned long size, pgprot_t);
int vm_insert_page(struct vm_area_struct *, unsigned long addr, struct page *);

struct page *follow_page(struct vm_area_struct *, unsigned long address,
                        unsigned int foll_flags);






void vm_stat_account(struct mm_struct *, unsigned long, struct file *, long);
# 1142 "include/linux/mm.h"
static inline __attribute__((always_inline)) void
kernel_map_pages(struct page *page, int numpages, int enable) {}


extern struct vm_area_struct *get_gate_vma(struct task_struct *tsk);




int in_gate_area_no_task(unsigned long addr);



int drop_caches_sysctl_handler(struct ctl_table *, int, struct file *,
                                        void *, size_t *, loff_t *);
unsigned long shrink_slab(unsigned long scanned, gfp_t gfp_mask,
                        unsigned long lru_pages);
void drop_pagecache(void);
void drop_slab(void);




extern int randomize_va_space;


__attribute__((weak)) const char *arch_vma_name(struct vm_area_struct *vma);
# 10 "include/linux/rmap.h" 2
# 26 "include/linux/rmap.h"
struct anon_vma {
        spinlock_t lock;
        struct list_head head;
};



extern struct kmem_cache *anon_vma_cachep;

static inline __attribute__((always_inline)) struct anon_vma *anon_vma_alloc(void)
{
        return kmem_cache_alloc(anon_vma_cachep, ((( gfp_t)0x10u) | (( gfp_t)0x40u) | (( gfp_t)0x80u)));
}

static inline __attribute__((always_inline)) void anon_vma_free(struct anon_vma *anon_vma)
{
        kmem_cache_free(anon_vma_cachep, anon_vma);
}

static inline __attribute__((always_inline)) void anon_vma_lock(struct vm_area_struct *vma)
{
        struct anon_vma *anon_vma = vma->anon_vma;
        if (anon_vma)
                _spin_lock(&anon_vma->lock);
}

static inline __attribute__((always_inline)) void anon_vma_unlock(struct vm_area_struct *vma)
{
        struct anon_vma *anon_vma = vma->anon_vma;
        if (anon_vma)
                __raw_spin_unlock(&(&anon_vma->lock)->raw_lock);
}




void anon_vma_init(void);
int anon_vma_prepare(struct vm_area_struct *);
void __anon_vma_merge(struct vm_area_struct *, struct vm_area_struct *);
void anon_vma_unlink(struct vm_area_struct *);
void anon_vma_link(struct vm_area_struct *);
void __anon_vma_link(struct vm_area_struct *);




void page_add_anon_rmap(struct page *, struct vm_area_struct *, unsigned long);
void page_add_new_anon_rmap(struct page *, struct vm_area_struct *, unsigned long);
void page_add_file_rmap(struct page *);
void page_remove_rmap(struct page *, struct vm_area_struct *);
# 84 "include/linux/rmap.h"
static inline __attribute__((always_inline)) void page_dup_rmap(struct page *page)
{
        atomic_inc(&page->_mapcount);
}




int page_referenced(struct page *, int is_locked);
int try_to_unmap(struct page *, int ignore_refs);




pte_t *page_check_address(struct page *, struct mm_struct *,
                                unsigned long, spinlock_t **);




unsigned long page_address_in_vma(struct page *, struct vm_area_struct *);







int page_mkclean(struct page *);
# 47 "init/main.c" 2
# 1 "include/linux/mempolicy.h" 1
# 37 "include/linux/mempolicy.h"
struct vm_area_struct;
struct mm_struct;
# 180 "include/linux/mempolicy.h"
struct mempolicy {};

static inline __attribute__((always_inline)) int mpol_equal(struct mempolicy *a, struct mempolicy *b)
{
        return 1;
}




static inline __attribute__((always_inline)) void mpol_free(struct mempolicy *p)
{
}

static inline __attribute__((always_inline)) void mpol_get(struct mempolicy *pol)
{
}

static inline __attribute__((always_inline)) struct mempolicy *mpol_copy(struct mempolicy *old)
{
        return ((void *)0);
}

struct shared_policy {};

static inline __attribute__((always_inline)) int mpol_set_shared_policy(struct shared_policy *info,
                                        struct vm_area_struct *vma,
                                        struct mempolicy *new)
{
        return -22;
}

static inline __attribute__((always_inline)) void mpol_shared_policy_init(struct shared_policy *info,
                                        int policy, nodemask_t *nodes)
{
}

static inline __attribute__((always_inline)) void mpol_free_shared_policy(struct shared_policy *p)
{
}

static inline __attribute__((always_inline)) struct mempolicy *
mpol_shared_policy_lookup(struct shared_policy *sp, unsigned long idx)
{
        return ((void *)0);
}




static inline __attribute__((always_inline)) void numa_policy_init(void)
{
}

static inline __attribute__((always_inline)) void numa_default_policy(void)
{
}

static inline __attribute__((always_inline)) void mpol_rebind_policy(struct mempolicy *pol,
                                        const nodemask_t *new)
{
}

static inline __attribute__((always_inline)) void mpol_rebind_task(struct task_struct *tsk,
                                        const nodemask_t *new)
{
}

static inline __attribute__((always_inline)) void mpol_rebind_mm(struct mm_struct *mm, nodemask_t *new)
{
}

static inline __attribute__((always_inline)) void mpol_fix_fork_child_flag(struct task_struct *p)
{
}



static inline __attribute__((always_inline)) struct zonelist *huge_zonelist(struct vm_area_struct *vma,
                unsigned long addr)
{
        return (&contig_page_data)->node_zonelists + gfp_zone(((( gfp_t)0x10u) | (( gfp_t)0x40u) | (( gfp_t)0x80u) | (( gfp_t)0x20000u) | (( gfp_t)0x02u)));
}

static inline __attribute__((always_inline)) int do_migrate_pages(struct mm_struct *mm,
                        const nodemask_t *from_nodes,
                        const nodemask_t *to_nodes, int flags)
{
        return 0;
}

static inline __attribute__((always_inline)) void check_highest_zone(int k)
{
}
# 48 "init/main.c" 2

# 1 "include/linux/unwind.h" 1
# 15 "include/linux/unwind.h"
struct module;

struct unwind_frame_info {};

static inline __attribute__((always_inline)) void unwind_init(void) {}
static inline __attribute__((always_inline)) void unwind_setup(void) {}



static inline __attribute__((always_inline)) void *unwind_add_table(struct module *mod,
                                     const void *table_start,
                                     unsigned long table_size)
{
        return ((void *)0);
}

static inline __attribute__((always_inline)) void unwind_remove_table(void *handle, int init_only)
{
}



static inline __attribute__((always_inline)) int unwind_init_frame_info(struct unwind_frame_info *info,
                                         struct task_struct *tsk,
                                         const struct pt_regs *regs)
{
        return -38;
}

static inline __attribute__((always_inline)) int unwind_init_blocked(struct unwind_frame_info *info,
                                      struct task_struct *tsk)
{
        return -38;
}

static inline __attribute__((always_inline)) int unwind_init_running(struct unwind_frame_info *info,
                                      __attribute__((regparm(0))) int (*cb)(struct unwind_frame_info *,
                                                           void *arg),
                                      void *arg)
{
        return -38;
}

static inline __attribute__((always_inline)) int unwind(struct unwind_frame_info *info)
{
        return -38;
}

static inline __attribute__((always_inline)) int unwind_to_user(struct unwind_frame_info *info)
{
        return -38;
}
# 50 "init/main.c" 2
# 1 "include/linux/buffer_head.h" 1
# 13 "include/linux/buffer_head.h"
# 1 "include/linux/pagemap.h" 1
# 10 "include/linux/pagemap.h"
# 1 "include/linux/highmem.h" 1





# 1 "include/linux/uaccess.h" 1
# 16 "include/linux/uaccess.h"
static inline __attribute__((always_inline)) void pagefault_disable(void)
{
        do { (current_thread_info()->preempt_count) += (1); } while (0);




        __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((always_inline)) void pagefault_enable(void)
{




        __asm__ __volatile__("": : :"memory");
        do { (current_thread_info()->preempt_count) -= (1); } while (0);



        __asm__ __volatile__("": : :"memory");
        do { } while (0);
}
# 7 "include/linux/highmem.h" 2

# 1 "include/asm/cacheflush.h" 1
# 27 "include/asm/cacheflush.h"
void global_flush_tlb(void);
int change_page_attr(struct page *page, int numpages, pgprot_t prot);
# 9 "include/linux/highmem.h" 2


static inline __attribute__((always_inline)) void flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vmaddr)
{
}



static inline __attribute__((always_inline)) void flush_kernel_dcache_page(struct page *page)
{
}




# 1 "include/asm/highmem.h" 1
# 26 "include/asm/highmem.h"
# 1 "include/asm/tlbflush.h" 1
# 120 "include/asm/tlbflush.h"
extern void flush_tlb_all(void);
extern void flush_tlb_current_task(void);
extern void flush_tlb_mm(struct mm_struct *);
extern void flush_tlb_page(struct vm_area_struct *, unsigned long);



static inline __attribute__((always_inline)) void flush_tlb_range(struct vm_area_struct * vma, unsigned long start, unsigned long end)
{
        flush_tlb_mm(vma->vm_mm);
}




struct tlb_state
{
        struct mm_struct *active_mm;
        int state;
        char __cacheline_padding[(1 << (7))-8];
};
extern __typeof__(struct tlb_state) per_cpu__cpu_tlbstate;






static inline __attribute__((always_inline)) void flush_tlb_pgtables(struct mm_struct *mm,
                                      unsigned long start, unsigned long end)
{

}
# 27 "include/asm/highmem.h" 2


extern unsigned long highstart_pfn, highend_pfn;

extern pte_t *kmap_pte;
extern pgprot_t kmap_prot;
extern pte_t *pkmap_page_table;
# 65 "include/asm/highmem.h"
extern void * kmap_high(struct page *page) __attribute__((regparm(3)));
extern void kunmap_high(struct page *page) __attribute__((regparm(3)));

void *kmap(struct page *page);
void kunmap(struct page *page);
void *kmap_atomic(struct page *page, enum km_type type);
void kunmap_atomic(void *kvaddr, enum km_type type);
void *kmap_atomic_pfn(unsigned long pfn, enum km_type type);
struct page *kmap_atomic_to_page(void *ptr);
# 25 "include/linux/highmem.h" 2


unsigned int nr_free_highpages(void);
extern unsigned long totalhigh_pages;
# 55 "include/linux/highmem.h"
static inline __attribute__((always_inline)) void clear_user_highpage(struct page *page, unsigned long vaddr)
{
        void *addr = kmap_atomic(page, KM_USER0);
        (__builtin_constant_p(0) ? (__builtin_constant_p(((1UL << 12))) ? __constant_c_and_count_memset((((void *)(addr))),((0x01010101UL*(unsigned char)(0))),(((1UL << 12)))) : __constant_c_memset((((void *)(addr))),((0x01010101UL*(unsigned char)(0))),(((1UL << 12))))) : (__builtin_constant_p(((1UL << 12))) ? __memset_generic(((((void *)(addr)))),(((0))),((((1UL << 12))))) : __memset_generic((((void *)(addr))),((0)),(((1UL << 12))))));
        kunmap_atomic(addr, KM_USER0);

        __asm__ __volatile__ ("": : :"memory");
}
# 77 "include/linux/highmem.h"
static inline __attribute__((always_inline)) void clear_highpage(struct page *page)
{
        void *kaddr = kmap_atomic(page, KM_USER0);
        (__builtin_constant_p(0) ? (__builtin_constant_p(((1UL << 12))) ? __constant_c_and_count_memset((((void *)(kaddr))),((0x01010101UL*(unsigned char)(0))),(((1UL << 12)))) : __constant_c_memset((((void *)(kaddr))),((0x01010101UL*(unsigned char)(0))),(((1UL << 12))))) : (__builtin_constant_p(((1UL << 12))) ? __memset_generic(((((void *)(kaddr)))),(((0))),((((1UL << 12))))) : __memset_generic((((void *)(kaddr))),((0)),(((1UL << 12))))));
        kunmap_atomic(kaddr, KM_USER0);
}




static inline __attribute__((always_inline)) void memclear_highpage_flush(struct page *page, unsigned int offset, unsigned int size)
{
        void *kaddr;

        do { if (__builtin_expect(!!((offset + size > (1UL << 12))!=0), 0)) do { asm volatile("1:\tud2\n" ".pushsection __bug_table,\"a\"\n" "2:\t.long 1b, %c0\n" "\t.word %c1, 0\n" "\t.org 2b+%c2\n" ".popsection" : : "i" ("include/linux/highmem.h"), "i" (91), "i" (sizeof(struct bug_entry))); for(;;) ; } while(0); } while(0);

        kaddr = kmap_atomic(page, KM_USER0);
        (__builtin_constant_p(0) ? (__builtin_constant_p((size)) ? __constant_c_and_count_memset((((char *)kaddr + offset)),((0x01010101UL*(unsigned char)(0))),((size))) : __constant_c_memset((((char *)kaddr + offset)),((0x01010101UL*(unsigned char)(0))),((size)))) : (__builtin_constant_p((size)) ? __memset_generic(((((char *)kaddr + offset))),(((0))),(((size)))) : __memset_generic((((char *)kaddr + offset)),((0)),((size)))));
        do { } while (0);
        kunmap_atomic(kaddr, KM_USER0);
}



static inline __attribute__((always_inline)) void copy_user_highpage(struct page *to, struct page *from,
        unsigned long vaddr, struct vm_area_struct *vma)
{
        char *vfrom, *vto;

        vfrom = kmap_atomic(from, KM_USER0);
        vto = kmap_atomic(to, KM_USER1);
        (__builtin_constant_p((1UL << 12)) ? __constant_memcpy(((void *)(vto)),((void *)(vfrom)),((1UL << 12))) : __memcpy(((void *)(vto)),((void *)(vfrom)),((1UL << 12))));
        kunmap_atomic(vfrom, KM_USER0);
        kunmap_atomic(vto, KM_USER1);

        __asm__ __volatile__ ("": : :"memory");
}



static inline __attribute__((always_inline)) void copy_highpage(struct page *to, struct page *from)
{
        char *vfrom, *vto;

        vfrom = kmap_atomic(from, KM_USER0);
        vto = kmap_atomic(to, KM_USER1);
        (__builtin_constant_p((1UL << 12)) ? __constant_memcpy(((void *)(vto)),((void *)(vfrom)),((1UL << 12))) : __memcpy(((void *)(vto)),((void *)(vfrom)),((1UL << 12))));
        kunmap_atomic(vfrom, KM_USER0);
        kunmap_atomic(vto, KM_USER1);
}
# 11 "include/linux/pagemap.h" 2
# 22 "include/linux/pagemap.h"
static inline __attribute__((always_inline)) gfp_t mapping_gfp_mask(struct address_space * mapping)
{
        return ( gfp_t)mapping->flags & (( gfp_t)((1 << 20) - 1));
}





static inline __attribute__((always_inline)) void mapping_set_gfp_mask(struct address_space *m, gfp_t mask)
{
        m->flags = (m->flags & ~( unsigned long)(( gfp_t)((1 << 20) - 1))) |
                                ( unsigned long)mask;
}
# 52 "include/linux/pagemap.h"
void release_pages(struct page **pages, int nr, int cold);




static inline __attribute__((always_inline)) struct page *__page_cache_alloc(gfp_t gfp)
{
        return alloc_pages_node(((0)), gfp, 0);
}


static inline __attribute__((always_inline)) struct page *page_cache_alloc(struct address_space *x)
{
        return __page_cache_alloc(mapping_gfp_mask(x));
}

static inline __attribute__((always_inline)) struct page *page_cache_alloc_cold(struct address_space *x)
{
        return __page_cache_alloc(mapping_gfp_mask(x)|(( gfp_t)0x100u));
}

typedef int filler_t(void *, struct page *);

extern struct page * find_get_page(struct address_space *mapping,
                                unsigned long index);
extern struct page * find_lock_page(struct address_space *mapping,
                                unsigned long index);
extern struct page * find_trylock_page(
                        struct address_space *mapping, unsigned long index);
extern struct page * find_or_create_page(struct address_space *mapping,
                                unsigned long index, gfp_t gfp_mask);
unsigned find_get_pages(struct address_space *mapping, unsigned long start,
                        unsigned int nr_pages, struct page **pages);
unsigned find_get_pages_contig(struct address_space *mapping, unsigned long start,
                               unsigned int nr_pages, struct page **pages);
unsigned find_get_pages_tag(struct address_space *mapping, unsigned long *index,
                        int tag, unsigned int nr_pages, struct page **pages);




static inline __attribute__((always_inline)) struct page *grab_cache_page(struct address_space *mapping, unsigned long index)
{
        return find_or_create_page(mapping, index, mapping_gfp_mask(mapping));
}

extern struct page * grab_cache_page_nowait(struct address_space *mapping,
                                unsigned long index);
extern struct page * read_cache_page(struct address_space *mapping,
                                unsigned long index, filler_t *filler,
                                void *data);
extern int read_cache_pages(struct address_space *mapping,
                struct list_head *pages, filler_t *filler, void *data);

static inline __attribute__((always_inline)) struct page *read_mapping_page(struct address_space *mapping,
                                             unsigned long index, void *data)
{
        filler_t *filler = (filler_t *)mapping->a_ops->readpage;
        return read_cache_page(mapping, index, filler, data);
}

int add_to_page_cache(struct page *page, struct address_space *mapping,
                                unsigned long index, gfp_t gfp_mask);
int add_to_page_cache_lru(struct page *page, struct address_space *mapping,
                                unsigned long index, gfp_t gfp_mask);
extern void remove_from_page_cache(struct page *page);
extern void __remove_from_page_cache(struct page *page);




static inline __attribute__((always_inline)) loff_t page_offset(struct page *page)
{
        return ((loff_t)page->index) << 12;
}

static inline __attribute__((always_inline)) unsigned long linear_page_index(struct vm_area_struct *vma,
                                        unsigned long address)
{
        unsigned long pgoff = (address - vma->vm_start) >> 12;
        pgoff += vma->vm_pgoff;
        return pgoff >> (12 - 12);
}

extern void __lock_page(struct page *page) __attribute__((regparm(3)));
extern void __lock_page_nosync(struct page *page) __attribute__((regparm(3)));
extern void unlock_page(struct page *page) __attribute__((regparm(3)));




static inline __attribute__((always_inline)) void lock_page(struct page *page)
{
        do { cond_resched(); } while (0);
        if (test_and_set_bit(0, &(page)->flags))
                __lock_page(page);
}





static inline __attribute__((always_inline)) void lock_page_nosync(struct page *page)
{
        do { cond_resched(); } while (0);
        if (test_and_set_bit(0, &(page)->flags))
                __lock_page_nosync(page);
}





extern void wait_on_page_bit(struct page *page, int bit_nr) __attribute__((regparm(3)));
# 174 "include/linux/pagemap.h"
static inline __attribute__((always_inline)) void wait_on_page_locked(struct page *page)
{
        if ((__builtin_constant_p(0) ? constant_test_bit((0),(&(page)->flags)) : variable_test_bit((0),(&(page)->flags))))
                wait_on_page_bit(page, 0);
}




static inline __attribute__((always_inline)) void wait_on_page_writeback(struct page *page)
{
        if ((__builtin_constant_p(12) ? constant_test_bit((12),(&(page)->flags)) : variable_test_bit((12),(&(page)->flags))))
                wait_on_page_bit(page, 12);
}

extern void end_page_writeback(struct page *page);







static inline __attribute__((always_inline)) int fault_in_pages_writeable(char *uaddr, int size)
{
        int ret;





        ret = ({ long __pu_err; do { __pu_err = 0; (void)0; switch ((sizeof(*(uaddr)))) { case 1: __asm__ __volatile__( "1:	mov""b"" %""b""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__pu_err) : "iq" (((__typeof__(*(uaddr)))(0))), "m"((*(struct __large_struct *)(((uaddr))))), "i"(-14), "0"(__pu_err));break; case 2: __asm__ __volatile__( "1:	mov""w"" %""w""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__pu_err) : "ir" (((__typeof__(*(uaddr)))(0))), "m"((*(struct __large_struct *)(((uaddr))))), "i"(-14), "0"(__pu_err));break; case 4: __asm__ __volatile__( "1:	mov""l"" %""""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__pu_err) : "ir" (((__typeof__(*(uaddr)))(0))), "m"((*(struct __large_struct *)(((uaddr))))), "i"(-14), "0"(__pu_err)); break; case 8: __asm__ __volatile__( "1:	movl %%eax,0(%2)\n" "2:	movl %%edx,4(%2)\n" "3:\n" ".section .fixup,\"ax\"\n" "4:	movl %3,%0\n" "	jmp 3b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,4b\n" "	.long 2b,4b\n" ".previous" : "=r"(__pu_err) : "A" ((__typeof__(*((uaddr))))(((__typeof__(*(uaddr)))(0)))), "r" (((uaddr))), "i"(-14), "0"(__pu_err)); break; default: __put_user_bad(); } } while (0); __pu_err; });
        if (ret == 0) {
                char *end = uaddr + size - 1;





                if (((unsigned long)uaddr & (~((1UL << 12)-1))) !=
                                ((unsigned long)end & (~((1UL << 12)-1))))
                        ret = ({ long __pu_err; do { __pu_err = 0; (void)0; switch ((sizeof(*(end)))) { case 1: __asm__ __volatile__( "1:	mov""b"" %""b""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__pu_err) : "iq" (((__typeof__(*(end)))(0))), "m"((*(struct __large_struct *)(((end))))), "i"(-14), "0"(__pu_err));break; case 2: __asm__ __volatile__( "1:	mov""w"" %""w""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__pu_err) : "ir" (((__typeof__(*(end)))(0))), "m"((*(struct __large_struct *)(((end))))), "i"(-14), "0"(__pu_err));break; case 4: __asm__ __volatile__( "1:	mov""l"" %""""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__pu_err) : "ir" (((__typeof__(*(end)))(0))), "m"((*(struct __large_struct *)(((end))))), "i"(-14), "0"(__pu_err)); break; case 8: __asm__ __volatile__( "1:	movl %%eax,0(%2)\n" "2:	movl %%edx,4(%2)\n" "3:\n" ".section .fixup,\"ax\"\n" "4:	movl %3,%0\n" "	jmp 3b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,4b\n" "	.long 2b,4b\n" ".previous" : "=r"(__pu_err) : "A" ((__typeof__(*((end))))(((__typeof__(*(end)))(0)))), "r" (((end))), "i"(-14), "0"(__pu_err)); break; default: __put_user_bad(); } } while (0); __pu_err; });
        }
        return ret;
}

static inline __attribute__((always_inline)) void fault_in_pages_readable(const char *uaddr, int size)
{
        volatile char c;
        int ret;

        ret = ({ long __gu_err; unsigned long __gu_val; do { __gu_err = 0; (void)0; switch ((sizeof(*(uaddr)))) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__gu_err), "=q" (__gu_val) : "m"((*(struct __large_struct *)(((uaddr))))), "i"(-14), "0"(__gu_err));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__gu_err), "=r" (__gu_val) : "m"((*(struct __large_struct *)(((uaddr))))), "i"(-14), "0"(__gu_err));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__gu_err), "=r" (__gu_val) : "m"((*(struct __large_struct *)(((uaddr))))), "i"(-14), "0"(__gu_err));break; default: (__gu_val) = __get_user_bad(); } } while (0); ((c)) = (__typeof__(*((uaddr))))__gu_val; __gu_err; });
        if (ret == 0) {
                const char *end = uaddr + size - 1;

                if (((unsigned long)uaddr & (~((1UL << 12)-1))) !=
                                ((unsigned long)end & (~((1UL << 12)-1))))
                        ({ long __gu_err; unsigned long __gu_val; do { __gu_err = 0; (void)0; switch ((sizeof(*(end)))) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__gu_err), "=q" (__gu_val) : "m"((*(struct __large_struct *)(((end))))), "i"(-14), "0"(__gu_err));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__gu_err), "=r" (__gu_val) : "m"((*(struct __large_struct *)(((end))))), "i"(-14), "0"(__gu_err));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__gu_err), "=r" (__gu_val) : "m"((*(struct __large_struct *)(((end))))), "i"(-14), "0"(__gu_err));break; default: (__gu_val) = __get_user_bad(); } } while (0); ((c)) = (__typeof__(*((end))))__gu_val; __gu_err; });
        }
}
# 14 "include/linux/buffer_head.h" 2





enum bh_state_bits {
        BH_Uptodate,
        BH_Dirty,
        BH_Lock,
        BH_Req,
        BH_Uptodate_Lock,



        BH_Mapped,
        BH_New,
        BH_Async_Read,
        BH_Async_Write,
        BH_Delay,
        BH_Boundary,
        BH_Write_EIO,
        BH_Ordered,
        BH_Eopnotsupp,

        BH_PrivateStart,


};



struct page;
struct buffer_head;
struct address_space;
typedef void (bh_end_io_t)(struct buffer_head *bh, int uptodate);
# 59 "include/linux/buffer_head.h"
struct buffer_head {
        unsigned long b_state;
        struct buffer_head *b_this_page;
        struct page *b_page;

        sector_t b_blocknr;
        size_t b_size;
        char *b_data;

        struct block_device *b_bdev;
        bh_end_io_t *b_end_io;
        void *b_private;
        struct list_head b_assoc_buffers;
        struct address_space *b_assoc_map;

        atomic_t b_count;
};
# 113 "include/linux/buffer_head.h"
static inline __attribute__((always_inline)) void set_buffer_uptodate(struct buffer_head *bh) { set_bit(BH_Uptodate, &(bh)->b_state); } static inline __attribute__((always_inline)) void clear_buffer_uptodate(struct buffer_head *bh) { clear_bit(BH_Uptodate, &(bh)->b_state); } static inline __attribute__((always_inline)) int buffer_uptodate(const struct buffer_head *bh) { return (__builtin_constant_p(BH_Uptodate) ? constant_test_bit((BH_Uptodate),(&(bh)->b_state)) : variable_test_bit((BH_Uptodate),(&(bh)->b_state))); }
static inline __attribute__((always_inline)) void set_buffer_dirty(struct buffer_head *bh) { set_bit(BH_Dirty, &(bh)->b_state); } static inline __attribute__((always_inline)) void clear_buffer_dirty(struct buffer_head *bh) { clear_bit(BH_Dirty, &(bh)->b_state); } static inline __attribute__((always_inline)) int buffer_dirty(const struct buffer_head *bh) { return (__builtin_constant_p(BH_Dirty) ? constant_test_bit((BH_Dirty),(&(bh)->b_state)) : variable_test_bit((BH_Dirty),(&(bh)->b_state))); }
static inline __attribute__((always_inline)) int test_set_buffer_dirty(struct buffer_head *bh) { return test_and_set_bit(BH_Dirty, &(bh)->b_state); } static inline __attribute__((always_inline)) int test_clear_buffer_dirty(struct buffer_head *bh) { return test_and_clear_bit(BH_Dirty, &(bh)->b_state); }
static inline __attribute__((always_inline)) void set_buffer_locked(struct buffer_head *bh) { set_bit(BH_Lock, &(bh)->b_state); } static inline __attribute__((always_inline)) void clear_buffer_locked(struct buffer_head *bh) { clear_bit(BH_Lock, &(bh)->b_state); } static inline __attribute__((always_inline)) int buffer_locked(const struct buffer_head *bh) { return (__builtin_constant_p(BH_Lock) ? constant_test_bit((BH_Lock),(&(bh)->b_state)) : variable_test_bit((BH_Lock),(&(bh)->b_state))); }
static inline __attribute__((always_inline)) int test_set_buffer_locked(struct buffer_head *bh) { return test_and_set_bit(BH_Lock, &(bh)->b_state); } static inline __attribute__((always_inline)) int test_clear_buffer_locked(struct buffer_head *bh) { return test_and_clear_bit(BH_Lock, &(bh)->b_state); }
static inline __attribute__((always_inline)) void set_buffer_req(struct buffer_head *bh) { set_bit(BH_Req, &(bh)->b_state); } static inline __attribute__((always_inline)) void clear_buffer_req(struct buffer_head *bh) { clear_bit(BH_Req, &(bh)->b_state); } static inline __attribute__((always_inline)) int buffer_req(const struct buffer_head *bh) { return (__builtin_constant_p(BH_Req) ? constant_test_bit((BH_Req),(&(bh)->b_state)) : variable_test_bit((BH_Req),(&(bh)->b_state))); }
static inline __attribute__((always_inline)) int test_set_buffer_req(struct buffer_head *bh) { return test_and_set_bit(BH_Req, &(bh)->b_state); } static inline __attribute__((always_inline)) int test_clear_buffer_req(struct buffer_head *bh) { return test_and_clear_bit(BH_Req, &(bh)->b_state); }
static inline __attribute__((always_inline)) void set_buffer_mapped(struct buffer_head *bh) { set_bit(BH_Mapped, &(bh)->b_state); } static inline __attribute__((always_inline)) void clear_buffer_mapped(struct buffer_head *bh) { clear_bit(BH_Mapped, &(bh)->b_state); } static inline __attribute__((always_inline)) int buffer_mapped(const struct buffer_head *bh) { return (__builtin_constant_p(BH_Mapped) ? constant_test_bit((BH_Mapped),(&(bh)->b_state)) : variable_test_bit((BH_Mapped),(&(bh)->b_state))); }
static inline __attribute__((always_inline)) void set_buffer_new(struct buffer_head *bh) { set_bit(BH_New, &(bh)->b_state); } static inline __attribute__((always_inline)) void clear_buffer_new(struct buffer_head *bh) { clear_bit(BH_New, &(bh)->b_state); } static inline __attribute__((always_inline)) int buffer_new(const struct buffer_head *bh) { return (__builtin_constant_p(BH_New) ? constant_test_bit((BH_New),(&(bh)->b_state)) : variable_test_bit((BH_New),(&(bh)->b_state))); }
static inline __attribute__((always_inline)) void set_buffer_async_read(struct buffer_head *bh) { set_bit(BH_Async_Read, &(bh)->b_state); } static inline __attribute__((always_inline)) void clear_buffer_async_read(struct buffer_head *bh) { clear_bit(BH_Async_Read, &(bh)->b_state); } static inline __attribute__((always_inline)) int buffer_async_read(const struct buffer_head *bh) { return (__builtin_constant_p(BH_Async_Read) ? constant_test_bit((BH_Async_Read),(&(bh)->b_state)) : variable_test_bit((BH_Async_Read),(&(bh)->b_state))); }
static inline __attribute__((always_inline)) void set_buffer_async_write(struct buffer_head *bh) { set_bit(BH_Async_Write, &(bh)->b_state); } static inline __attribute__((always_inline)) void clear_buffer_async_write(struct buffer_head *bh) { clear_bit(BH_Async_Write, &(bh)->b_state); } static inline __attribute__((always_inline)) int buffer_async_write(const struct buffer_head *bh) { return (__builtin_constant_p(BH_Async_Write) ? constant_test_bit((BH_Async_Write),(&(bh)->b_state)) : variable_test_bit((BH_Async_Write),(&(bh)->b_state))); }
static inline __attribute__((always_inline)) void set_buffer_delay(struct buffer_head *bh) { set_bit(BH_Delay, &(bh)->b_state); } static inline __attribute__((always_inline)) void clear_buffer_delay(struct buffer_head *bh) { clear_bit(BH_Delay, &(bh)->b_state); } static inline __attribute__((always_inline)) int buffer_delay(const struct buffer_head *bh) { return (__builtin_constant_p(BH_Delay) ? constant_test_bit((BH_Delay),(&(bh)->b_state)) : variable_test_bit((BH_Delay),(&(bh)->b_state))); }
static inline __attribute__((always_inline)) void set_buffer_boundary(struct buffer_head *bh) { set_bit(BH_Boundary, &(bh)->b_state); } static inline __attribute__((always_inline)) void clear_buffer_boundary(struct buffer_head *bh) { clear_bit(BH_Boundary, &(bh)->b_state); } static inline __attribute__((always_inline)) int buffer_boundary(const struct buffer_head *bh) { return (__builtin_constant_p(BH_Boundary) ? constant_test_bit((BH_Boundary),(&(bh)->b_state)) : variable_test_bit((BH_Boundary),(&(bh)->b_state))); }
static inline __attribute__((always_inline)) void set_buffer_write_io_error(struct buffer_head *bh) { set_bit(BH_Write_EIO, &(bh)->b_state); } static inline __attribute__((always_inline)) void clear_buffer_write_io_error(struct buffer_head *bh) { clear_bit(BH_Write_EIO, &(bh)->b_state); } static inline __attribute__((always_inline)) int buffer_write_io_error(const struct buffer_head *bh) { return (__builtin_constant_p(BH_Write_EIO) ? constant_test_bit((BH_Write_EIO),(&(bh)->b_state)) : variable_test_bit((BH_Write_EIO),(&(bh)->b_state))); }
static inline __attribute__((always_inline)) void set_buffer_ordered(struct buffer_head *bh) { set_bit(BH_Ordered, &(bh)->b_state); } static inline __attribute__((always_inline)) void clear_buffer_ordered(struct buffer_head *bh) { clear_bit(BH_Ordered, &(bh)->b_state); } static inline __attribute__((always_inline)) int buffer_ordered(const struct buffer_head *bh) { return (__builtin_constant_p(BH_Ordered) ? constant_test_bit((BH_Ordered),(&(bh)->b_state)) : variable_test_bit((BH_Ordered),(&(bh)->b_state))); }
static inline __attribute__((always_inline)) void set_buffer_eopnotsupp(struct buffer_head *bh) { set_bit(BH_Eopnotsupp, &(bh)->b_state); } static inline __attribute__((always_inline)) void clear_buffer_eopnotsupp(struct buffer_head *bh) { clear_bit(BH_Eopnotsupp, &(bh)->b_state); } static inline __attribute__((always_inline)) int buffer_eopnotsupp(const struct buffer_head *bh) { return (__builtin_constant_p(BH_Eopnotsupp) ? constant_test_bit((BH_Eopnotsupp),(&(bh)->b_state)) : variable_test_bit((BH_Eopnotsupp),(&(bh)->b_state))); }
# 145 "include/linux/buffer_head.h"
void mark_buffer_dirty(struct buffer_head *bh) __attribute__((regparm(3)));
void init_buffer(struct buffer_head *, bh_end_io_t *, void *);
void set_bh_page(struct buffer_head *bh,
                struct page *page, unsigned long offset);
int try_to_free_buffers(struct page *);
struct buffer_head *alloc_page_buffers(struct page *page, unsigned long size,
                int retry);
void create_empty_buffers(struct page *, unsigned long,
                        unsigned long b_state);
void end_buffer_read_sync(struct buffer_head *bh, int uptodate);
void end_buffer_write_sync(struct buffer_head *bh, int uptodate);


void mark_buffer_dirty_inode(struct buffer_head *bh, struct inode *inode);
int inode_has_buffers(struct inode *);
void invalidate_inode_buffers(struct inode *);
int remove_inode_buffers(struct inode *inode);
int sync_mapping_buffers(struct address_space *mapping);
void unmap_underlying_metadata(struct block_device *bdev, sector_t block);

void mark_buffer_async_write(struct buffer_head *bh);
void invalidate_bdev(struct block_device *, int);
int sync_blockdev(struct block_device *bdev);
void __wait_on_buffer(struct buffer_head *);
wait_queue_head_t *bh_waitq_head(struct buffer_head *bh);
int fsync_bdev(struct block_device *);
struct super_block *freeze_bdev(struct block_device *);
void thaw_bdev(struct block_device *, struct super_block *);
int fsync_super(struct super_block *);
int fsync_no_super(struct block_device *);
struct buffer_head *__find_get_block(struct block_device *, sector_t, int);
struct buffer_head * __getblk(struct block_device *, sector_t, int);
void __brelse(struct buffer_head *);
void __bforget(struct buffer_head *);
void __breadahead(struct block_device *, sector_t block, int size);
struct buffer_head *__bread(struct block_device *, sector_t block, int size);
struct buffer_head *alloc_buffer_head(gfp_t gfp_flags);
void free_buffer_head(struct buffer_head * bh);
void unlock_buffer(struct buffer_head *bh) __attribute__((regparm(3)));
void __lock_buffer(struct buffer_head *bh) __attribute__((regparm(3)));
void ll_rw_block(int, int, struct buffer_head * bh[]);
int sync_dirty_buffer(struct buffer_head *bh);
int submit_bh(int, struct buffer_head *);
void write_boundary_block(struct block_device *bdev,
                        sector_t bblock, unsigned blocksize);

extern int buffer_heads_over_limit;





void block_invalidatepage(struct page *page, unsigned long offset);
int block_write_full_page(struct page *page, get_block_t *get_block,
                                struct writeback_control *wbc);
int block_read_full_page(struct page*, get_block_t*);
int block_prepare_write(struct page*, unsigned, unsigned, get_block_t*);
int cont_prepare_write(struct page*, unsigned, unsigned, get_block_t*,
                                loff_t *);
int generic_cont_expand(struct inode *inode, loff_t size);
int generic_cont_expand_simple(struct inode *inode, loff_t size);
int block_commit_write(struct page *page, unsigned from, unsigned to);
void block_sync_page(struct page *);
sector_t generic_block_bmap(struct address_space *, sector_t, get_block_t *);
int generic_commit_write(struct file *, struct page *, unsigned, unsigned);
int block_truncate_page(struct address_space *, loff_t, get_block_t *);
int file_fsync(struct file *, struct dentry *, int);
int nobh_prepare_write(struct page*, unsigned, unsigned, get_block_t*);
int nobh_commit_write(struct file *, struct page *, unsigned, unsigned);
int nobh_truncate_page(struct address_space *, loff_t);
int nobh_writepage(struct page *page, get_block_t *get_block,
                        struct writeback_control *wbc);

void buffer_init(void);





static inline __attribute__((always_inline)) void attach_page_buffers(struct page *page,
                struct buffer_head *head)
{
        get_page(page);
        set_bit(11, &(page)->flags);
        ((page)->private = ((unsigned long)head));
}

static inline __attribute__((always_inline)) void get_bh(struct buffer_head *bh)
{
        atomic_inc(&bh->b_count);
}

static inline __attribute__((always_inline)) void put_bh(struct buffer_head *bh)
{
        __asm__ __volatile__("": : :"memory");
        atomic_dec(&bh->b_count);
}

static inline __attribute__((always_inline)) void brelse(struct buffer_head *bh)
{
        if (bh)
                __brelse(bh);
}

static inline __attribute__((always_inline)) void bforget(struct buffer_head *bh)
{
        if (bh)
                __bforget(bh);
}

static inline __attribute__((always_inline)) struct buffer_head *
sb_bread(struct super_block *sb, sector_t block)
{
        return __bread(sb->s_bdev, block, sb->s_blocksize);
}

static inline __attribute__((always_inline)) void
sb_breadahead(struct super_block *sb, sector_t block)
{
        __breadahead(sb->s_bdev, block, sb->s_blocksize);
}

static inline __attribute__((always_inline)) struct buffer_head *
sb_getblk(struct super_block *sb, sector_t block)
{
        return __getblk(sb->s_bdev, block, sb->s_blocksize);
}

static inline __attribute__((always_inline)) struct buffer_head *
sb_find_get_block(struct super_block *sb, sector_t block)
{
        return __find_get_block(sb->s_bdev, block, sb->s_blocksize);
}

static inline __attribute__((always_inline)) void
map_bh(struct buffer_head *bh, struct super_block *sb, sector_t block)
{
        set_buffer_mapped(bh);
        bh->b_bdev = sb->s_bdev;
        bh->b_blocknr = block;
        bh->b_size = sb->s_blocksize;
}






static inline __attribute__((always_inline)) void wait_on_buffer(struct buffer_head *bh)
{
        do { cond_resched(); } while (0);
        if (buffer_locked(bh) || ((&bh->b_count)->counter) == 0)
                __wait_on_buffer(bh);
}

static inline __attribute__((always_inline)) void lock_buffer(struct buffer_head *bh)
{
        do { cond_resched(); } while (0);
        if (test_set_buffer_locked(bh))
                __lock_buffer(bh);
}

extern int __set_page_dirty_buffers(struct page *page);
# 51 "init/main.c" 2


# 1 "include/linux/pid_namespace.h" 1
# 11 "include/linux/pid_namespace.h"
struct pidmap {
       atomic_t nr_free;
       void *page;
};



struct pid_namespace {
        struct kref kref;
        struct pidmap pidmap[(((0 ? (1UL << 12) * 8 : (sizeof(long) > 4 ? 4 * 1024 * 1024 : (0 ? 0x1000 : 0x8000))) + 8*(1UL << 12) - 1)/(1UL << 12)/8)];
        int last_pid;
        struct task_struct *child_reaper;
};

extern struct pid_namespace init_pid_ns;

static inline __attribute__((always_inline)) void get_pid_ns(struct pid_namespace *ns)
{
        kref_get(&ns->kref);
}

extern int copy_pid_ns(int flags, struct task_struct *tsk);
extern void free_pid_ns(struct kref *kref);

static inline __attribute__((always_inline)) void put_pid_ns(struct pid_namespace *ns)
{
        kref_put(&ns->kref, free_pid_ns);
}

static inline __attribute__((always_inline)) struct task_struct *child_reaper(struct task_struct *tsk)
{
        return init_pid_ns.child_reaper;
}
# 54 "init/main.c" 2



# 1 "include/asm/bugs.h" 1
# 22 "include/asm/bugs.h"
# 1 "include/asm/i387.h" 1
# 21 "include/asm/i387.h"
extern void mxcsr_feature_mask_init(void);
extern void init_fpu(struct task_struct *);
# 39 "include/asm/i387.h"
extern void kernel_fpu_begin(void);
# 54 "include/asm/i387.h"
static inline __attribute__((always_inline)) void __save_init_fpu( struct task_struct *tsk )
{


        asm volatile ("661:\n\t" "fnsave %[fx] ;fwait;" ".byte 0x90\n" ".byte 0x8d,0xb4,0x26,0x00,0x00,0x00,0x00\n" ".byte 0x8d,0x74,0x26,0x00\n" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "fxsave %[fx]\n" "bt $7,%[fsw] ; jnc 1f ; fnclex\n1:" "\n664:\n" ".previous" :: "i" ((0*32+24)), [fx] "m" (tsk->thread.i387.fxsave), [fsw] "m" (tsk->thread.i387.fxsave.swd) : "memory");
# 68 "include/asm/i387.h"
        asm volatile ("661:\n\t" ".byte 0x90\n" ".byte 0x8d,0xb4,0x26,0x00,0x00,0x00,0x00\n" ".byte 0x89,0xf6\n" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "emms\n\t" "fildl %[addr]" "\n664:\n" ".previous" :: "i" ((3*32+10)), [addr] "m" ((__per_cpu_offset[0])));





        (tsk)->thread_info->status &= ~0x0001;
}
# 97 "include/asm/i387.h"
static inline __attribute__((always_inline)) void save_init_fpu( struct task_struct *tsk )
{
        do { } while (0);
        __save_init_fpu(tsk);
        __asm__ __volatile__("movl %0,%%cr0": :"r" (8 | ({ unsigned int __dummy; __asm__ __volatile__( "movl %%cr0,%0\n\t" :"=r" (__dummy)); __dummy; })));
        do { } while (0);
}
# 120 "include/asm/i387.h"
extern unsigned short get_fpu_cwd( struct task_struct *tsk );
extern unsigned short get_fpu_swd( struct task_struct *tsk );
extern unsigned short get_fpu_mxcsr( struct task_struct *tsk );
extern __attribute__((regparm(0))) void math_state_restore(void);




extern int save_i387( struct _fpstate *buf );
extern int restore_i387( struct _fpstate *buf );




extern int get_fpregs( struct user_i387_struct *buf,
                       struct task_struct *tsk );
extern int set_fpregs( struct task_struct *tsk,
                       struct user_i387_struct *buf );

extern int get_fpxregs( struct user_fxsr_struct *buf,
                        struct task_struct *tsk );
extern int set_fpxregs( struct task_struct *tsk,
                        struct user_fxsr_struct *buf );




extern int dump_fpu( struct pt_regs *regs,
                     struct user_i387_struct *fpu );
# 23 "include/asm/bugs.h" 2



static int __attribute__ ((__section__ (".init.text"))) no_halt(char *s)
{
        boot_cpu_data.hlt_works_ok = 0;
        return 1;
}

static char __setup_str_no_halt[] __attribute__ ((__section__ (".init.data"))) = "no-hlt"; static struct obs_kernel_param __setup_no_halt __attribute__((__unused__)) __attribute__((__section__(".init.setup"))) __attribute__((aligned((sizeof(long))))) = { __setup_str_no_halt, no_halt, 0 };

static int __attribute__ ((__section__ (".init.text"))) mca_pentium(char *s)
{
        mca_pentium_flag = 1;
        return 1;
}

static char __setup_str_mca_pentium[] __attribute__ ((__section__ (".init.data"))) = "mca-pentium"; static struct obs_kernel_param __setup_mca_pentium __attribute__((__unused__)) __attribute__((__section__(".init.setup"))) __attribute__((aligned((sizeof(long))))) = { __setup_str_mca_pentium, mca_pentium, 0 };

static int __attribute__ ((__section__ (".init.text"))) no_387(char *s)
{
        boot_cpu_data.hard_math = 0;
        __asm__ __volatile__("movl %0,%%cr0": :"r" (0xE | ({ unsigned int __dummy; __asm__ __volatile__( "movl %%cr0,%0\n\t" :"=r" (__dummy)); __dummy; })));
        return 1;
}

static char __setup_str_no_387[] __attribute__ ((__section__ (".init.data"))) = "no387"; static struct obs_kernel_param __setup_no_387 __attribute__((__unused__)) __attribute__((__section__(".init.setup"))) __attribute__((aligned((sizeof(long))))) = { __setup_str_no_387, no_387, 0 };

static double __attribute__ ((__section__ (".init.data"))) x = 4195835.0;
static double __attribute__ ((__section__ (".init.data"))) y = 3145727.0;
# 65 "include/asm/bugs.h"
static void __attribute__ ((__section__ (".init.text"))) check_fpu(void)
{
        if (!boot_cpu_data.hard_math) {

                printk("<0>" "No coprocessor found and no math emulation present.\n");
                printk("<0>" "Giving up.\n");
                for (;;) ;

                return;
        }



        __asm__("fninit\n\t"
                "fldl %1\n\t"
                "fdivl %2\n\t"
                "fmull %2\n\t"
                "fldl %1\n\t"
                "fsubp %%st,%%st(1)\n\t"
                "fistpl %0\n\t"
                "fwait\n\t"
                "fninit"
                : "=m" (*&boot_cpu_data.fdiv_bug)
                : "m" (*&x), "m" (*&y));
        if (boot_cpu_data.fdiv_bug)
                printk("Hmm, FPU with FDIV bug.\n");
}

static void __attribute__ ((__section__ (".init.text"))) check_hlt(void)
{
        if (0)
                return;

        printk("<6>" "Checking 'hlt' instruction... ");
        if (!boot_cpu_data.hlt_works_ok) {
                printk("disabled\n");
                return;
        }
        halt();
        halt();
        halt();
        halt();
        printk("OK.\n");
}






static void __attribute__ ((__section__ (".init.text"))) check_popad(void)
{
# 130 "include/asm/bugs.h"
}
# 147 "include/asm/bugs.h"
static void __attribute__ ((__section__ (".init.text"))) check_config(void)
{






        if (boot_cpu_data.x86 == 3)
                panic("Kernel requires i486+ for 'invlpg' and other features");






        if (!(__builtin_constant_p((0*32+ 4)) ? constant_test_bit(((0*32+ 4)),(boot_cpu_data.x86_capability)) : variable_test_bit(((0*32+ 4)),(boot_cpu_data.x86_capability))))
                panic("Kernel compiled for Pentium+, requires TSC feature!");
# 174 "include/asm/bugs.h"
        if (boot_cpu_data.x86_vendor == 0
            && (__builtin_constant_p((0*32+ 9)) ? constant_test_bit(((0*32+ 9)),(boot_cpu_data.x86_capability)) : variable_test_bit(((0*32+ 9)),(boot_cpu_data.x86_capability)))
            && boot_cpu_data.x86 == 5
            && boot_cpu_data.x86_model == 2
            && (boot_cpu_data.x86_mask < 6 || boot_cpu_data.x86_mask == 11))
                panic("Kernel compiled for PMMX+, assumes a local APIC without the read-before-write bug!");

}

extern void alternative_instructions(void);

static void __attribute__ ((__section__ (".init.text"))) check_bugs(void)
{
        identify_cpu(&boot_cpu_data);




        check_config();
        check_fpu();
        check_hlt();
        check_popad();
        init_utsname()->machine[1] = '0' + (boot_cpu_data.x86 > 6 ? 6 : boot_cpu_data.x86);
        alternative_instructions();
}
# 58 "init/main.c" 2
# 1 "include/asm/setup.h" 1
# 12 "include/asm/setup.h"
# 1 "include/linux/pfn.h" 1
# 13 "include/asm/setup.h" 2
# 32 "include/asm/setup.h"
extern unsigned char boot_params[4096];
# 70 "include/asm/setup.h"
struct e820entry;

char * __attribute__ ((__section__ (".init.text"))) machine_specific_memory_setup(void);
char *memory_setup(void);

int __attribute__ ((__section__ (".init.text"))) copy_e820_map(struct e820entry * biosmap, int nr_map);
int __attribute__ ((__section__ (".init.text"))) sanitize_e820_map(struct e820entry * biosmap, char * pnr_map);
void __attribute__ ((__section__ (".init.text"))) add_memory_region(unsigned long long start,
                              unsigned long long size, int type);
# 59 "init/main.c" 2
# 83 "init/main.c"
static int init(void *);

extern void init_IRQ(void);
extern void fork_init(unsigned long);
extern void mca_init(void);
extern void sbus_init(void);
extern void sysctl_init(void);
extern void signals_init(void);
extern void pidhash_init(void);
extern void pidmap_init(void);
extern void prio_tree_init(void);
extern void radix_tree_init(void);
extern void free_initmem(void);
extern void prepare_namespace(void);

extern void acpi_early_init(void);




static inline __attribute__((always_inline)) void mark_rodata_ro(void) { }






enum system_states system_state;
extern typeof(system_state) system_state; static const char __kstrtab_system_state[] __attribute__((section("__ksymtab_strings"))) = "" "system_state"; static const struct kernel_symbol __ksymtab_system_state __attribute__((__unused__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&system_state, __kstrtab_system_state };







extern void time_init(void);

void (*late_time_init)(void);
extern void softirq_init(void);


char saved_command_line[256];

static char *execute_command;
static char *ramdisk_execute_command;


static unsigned int max_cpus = 32;
# 142 "init/main.c"
unsigned int reset_devices;
extern typeof(reset_devices) reset_devices; static const char __kstrtab_reset_devices[] __attribute__((section("__ksymtab_strings"))) = "" "reset_devices"; static const struct kernel_symbol __ksymtab_reset_devices __attribute__((__unused__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&reset_devices, __kstrtab_reset_devices };
# 155 "init/main.c"
static int __attribute__ ((__section__ (".init.text"))) nosmp(char *str)
{
        max_cpus = 0;
        return 1;
}

static char __setup_str_nosmp[] __attribute__ ((__section__ (".init.data"))) = "nosmp"; static struct obs_kernel_param __setup_nosmp __attribute__((__unused__)) __attribute__((__section__(".init.setup"))) __attribute__((aligned((sizeof(long))))) = { __setup_str_nosmp, nosmp, 0 };

static int __attribute__ ((__section__ (".init.text"))) maxcpus(char *str)
{
        get_option(&str, &max_cpus);
        return 1;
}

static char __setup_str_maxcpus[] __attribute__ ((__section__ (".init.data"))) = "maxcpus="; static struct obs_kernel_param __setup_maxcpus __attribute__((__unused__)) __attribute__((__section__(".init.setup"))) __attribute__((aligned((sizeof(long))))) = { __setup_str_maxcpus, maxcpus, 0 };

static int __attribute__ ((__section__ (".init.text"))) set_reset_devices(char *str)
{
        reset_devices = 1;
        return 1;
}

static char __setup_str_set_reset_devices[] __attribute__ ((__section__ (".init.data"))) = "reset_devices"; static struct obs_kernel_param __setup_set_reset_devices __attribute__((__unused__)) __attribute__((__section__(".init.setup"))) __attribute__((aligned((sizeof(long))))) = { __setup_str_set_reset_devices, set_reset_devices, 0 };

static char * argv_init[32 +2] = { "init", ((void *)0), };
char * envp_init[32 +2] = { "HOME=/", "TERM=linux", ((void *)0), };
static const char *panic_later, *panic_param;

extern struct obs_kernel_param __setup_start[], __setup_end[];

static int __attribute__ ((__section__ (".init.text"))) obsolete_checksetup(char *line)
{
        struct obs_kernel_param *p;
        int had_early_param = 0;

        p = __setup_start;
        do {
                int n = strlen(p->str);
                if (!strncmp(line, p->str, n)) {
                        if (p->early) {




                                if (line[n] == '\0' || line[n] == '=')
                                        had_early_param = 1;
                        } else if (!p->setup_func) {
                                printk("<4>" "Parameter %s is obsolete,"
                                       " ignored\n", p->str);
                                return 1;
                        } else if (p->setup_func(line + n))
                                return 1;
                }
                p++;
        } while (p < __setup_end);

        return had_early_param;
}





unsigned long loops_per_jiffy = (1<<12);

extern typeof(loops_per_jiffy) loops_per_jiffy; static const char __kstrtab_loops_per_jiffy[] __attribute__((section("__ksymtab_strings"))) = "" "loops_per_jiffy"; static const struct kernel_symbol __ksymtab_loops_per_jiffy __attribute__((__unused__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&loops_per_jiffy, __kstrtab_loops_per_jiffy };

static int __attribute__ ((__section__ (".init.text"))) debug_kernel(char *str)
{
        if (*str)
                return 0;
        (console_printk[0]) = 10;
        return 1;
}

static int __attribute__ ((__section__ (".init.text"))) quiet_kernel(char *str)
{
        if (*str)
                return 0;
        (console_printk[0]) = 4;
        return 1;
}

static char __setup_str_debug_kernel[] __attribute__ ((__section__ (".init.data"))) = "debug"; static struct obs_kernel_param __setup_debug_kernel __attribute__((__unused__)) __attribute__((__section__(".init.setup"))) __attribute__((aligned((sizeof(long))))) = { __setup_str_debug_kernel, debug_kernel, 0 };
static char __setup_str_quiet_kernel[] __attribute__ ((__section__ (".init.data"))) = "quiet"; static struct obs_kernel_param __setup_quiet_kernel __attribute__((__unused__)) __attribute__((__section__(".init.setup"))) __attribute__((aligned((sizeof(long))))) = { __setup_str_quiet_kernel, quiet_kernel, 0 };

static int __attribute__ ((__section__ (".init.text"))) loglevel(char *str)
{
        get_option(&str, &(console_printk[0]));
        return 1;
}

static char __setup_str_loglevel[] __attribute__ ((__section__ (".init.data"))) = "loglevel="; static struct obs_kernel_param __setup_loglevel __attribute__((__unused__)) __attribute__((__section__(".init.setup"))) __attribute__((aligned((sizeof(long))))) = { __setup_str_loglevel, loglevel, 0 };





static int __attribute__ ((__section__ (".init.text"))) unknown_bootoption(char *param, char *val)
{

        if (val) {

                if (val == param+strlen(param)+1)
                        val[-1] = '=';
                else if (val == param+strlen(param)+2) {
                        val[-2] = '=';
                        memmove(val-1, val, strlen(val)+1);
                        val--;
                } else
                        do { asm volatile("1:\tud2\n" ".pushsection __bug_table,\"a\"\n" "2:\t.long 1b, %c0\n" "\t.word %c1, 0\n" "\t.org 2b+%c2\n" ".popsection" : : "i" ("init/main.c"), "i" (265), "i" (sizeof(struct bug_entry))); for(;;) ; } while(0);
        }


        if (obsolete_checksetup(param))
                return 0;





        if (strchr(param, '.') && (!val || strchr(param, '.') < val)) {
                printk("<3>" "Unknown boot option `%s': ignoring\n", param);
                return 0;
        }

        if (panic_later)
                return 0;

        if (val) {

                unsigned int i;
                for (i = 0; envp_init[i]; i++) {
                        if (i == 32) {
                                panic_later = "Too many boot env vars at `%s'";
                                panic_param = param;
                        }
                        if (!strncmp(param, envp_init[i], val - param))
                                break;
                }
                envp_init[i] = param;
        } else {

                unsigned int i;
                for (i = 0; argv_init[i]; i++) {
                        if (i == 32) {
                                panic_later = "Too many boot init vars at `%s'";
                                panic_param = param;
                        }
                }
                argv_init[i] = param;
        }
        return 0;
}

static int __attribute__ ((__section__ (".init.text"))) init_setup(char *str)
{
        unsigned int i;

        execute_command = str;






        for (i = 1; i < 32; i++)
                argv_init[i] = ((void *)0);
        return 1;
}
static char __setup_str_init_setup[] __attribute__ ((__section__ (".init.data"))) = "init="; static struct obs_kernel_param __setup_init_setup __attribute__((__unused__)) __attribute__((__section__(".init.setup"))) __attribute__((aligned((sizeof(long))))) = { __setup_str_init_setup, init_setup, 0 };

static int __attribute__ ((__section__ (".init.text"))) rdinit_setup(char *str)
{
        unsigned int i;

        ramdisk_execute_command = str;

        for (i = 1; i < 32; i++)
                argv_init[i] = ((void *)0);
        return 1;
}
static char __setup_str_rdinit_setup[] __attribute__ ((__section__ (".init.data"))) = "rdinit="; static struct obs_kernel_param __setup_rdinit_setup __attribute__((__unused__)) __attribute__((__section__(".init.setup"))) __attribute__((aligned((sizeof(long))))) = { __setup_str_rdinit_setup, rdinit_setup, 0 };
# 356 "init/main.c"
unsigned long __per_cpu_offset[32] __attribute__((__section__(".data.read_mostly")));

extern typeof(__per_cpu_offset) __per_cpu_offset; static const char __kstrtab___per_cpu_offset[] __attribute__((section("__ksymtab_strings"))) = "" "__per_cpu_offset"; static const struct kernel_symbol __ksymtab___per_cpu_offset __attribute__((__unused__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&__per_cpu_offset, __kstrtab___per_cpu_offset };

static void __attribute__ ((__section__ (".init.text"))) setup_per_cpu_areas(void)
{
        unsigned long size, i;
        char *ptr;
        unsigned long nr_possible_cpus = __cpus_weight(&(cpu_possible_map), 32);


        size = (((__per_cpu_end - __per_cpu_start)+((typeof(__per_cpu_end - __per_cpu_start))((1 << (7)))-1))&~((typeof(__per_cpu_end - __per_cpu_start))((1 << (7)))-1));

        if (size < 32768)
                size = 32768;

        ptr = __alloc_bootmem(size * nr_possible_cpus, (1 << (7)), ((unsigned long)((((unsigned long)((unsigned long)0xC0000000))+0x1000000))-((unsigned long)((unsigned long)0xC0000000))));

        for (((i)) = __first_cpu(&(cpu_possible_map)); ((i)) < 32; ((i)) = __next_cpu((((i))), &((cpu_possible_map)))) {
                __per_cpu_offset[i] = ptr - __per_cpu_start;
                (__builtin_constant_p(__per_cpu_end - __per_cpu_start) ? __constant_memcpy((ptr),(__per_cpu_start),(__per_cpu_end - __per_cpu_start)) : __memcpy((ptr),(__per_cpu_start),(__per_cpu_end - __per_cpu_start)));
                ptr += size;
        }
}



static void __attribute__ ((__section__ (".init.text"))) smp_init(void)
{
        unsigned int i;


        for (((i)) = __first_cpu(&(cpu_present_map)); ((i)) < 32; ((i)) = __next_cpu((((i))), &((cpu_present_map)))) {
                if (__cpus_weight(&(cpu_online_map), 32) >= max_cpus)
                        break;
                if (!(__builtin_constant_p(((i))) ? constant_test_bit((((i))),((cpu_online_map).bits)) : variable_test_bit((((i))),((cpu_online_map).bits))))
                        cpu_up(i);
        }


        printk("<6>" "Brought up %ld CPUs\n", (long)__cpus_weight(&(cpu_online_map), 32));
        smp_cpus_done(max_cpus);





}
# 416 "init/main.c"
static void __attribute__((noinline)) rest_init(void)
       
{
        kernel_thread(init, ((void *)0), 0x00000200 | 0x00000800);
        numa_default_policy();
        unlock_kernel();





        do { } while (0);
        schedule();
        do { } while (0);


        cpu_idle();
}


static int __attribute__ ((__section__ (".init.text"))) do_early_param(char *param, char *val)
{
        struct obs_kernel_param *p;

        for (p = __setup_start; p < __setup_end; p++) {
                if (p->early && strcmp(param, p->str) == 0) {
                        if (p->setup_func(val) != 0)
                                printk("<4>"
                                       "Malformed early option '%s'\n", param);
                }
        }

        return 0;
}


void __attribute__ ((__section__ (".init.text"))) parse_early_param(void)
{
        static __attribute__ ((__section__ (".init.data"))) int done = 0;
        static __attribute__ ((__section__ (".init.data"))) char tmp_cmdline[256];

        if (done)
                return;


        strlcpy(tmp_cmdline, saved_command_line, 256);
        parse_args("early options", tmp_cmdline, ((void *)0), 0, do_early_param);
        done = 1;
}





static void __attribute__ ((__section__ (".init.text"))) boot_cpu_init(void)
{
        int cpu = (({ typeof(_proxy_pda.cpu_number) ret__; switch (sizeof(_proxy_pda.cpu_number)) { case 1: asm("mov" "b %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 2: asm("mov" "w %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; case 4: asm("mov" "l %%gs:%c1,%0" : "=r" (ret__) : "i" (((size_t) &((struct i386_pda *)0)->cpu_number)), "m" (_proxy_pda.cpu_number)); break; default: __bad_pda_field(); } ret__; }));

        __cpu_set((cpu), &(cpu_online_map));
        __cpu_set((cpu), &(cpu_present_map));
        __cpu_set((cpu), &(cpu_possible_map));
}

void __attribute__ ((__section__ (".init.text"))) __attribute__((weak)) smp_setup_processor_id(void)
{
}

 __attribute__((regparm(0))) void __attribute__ ((__section__ (".init.text"))) start_kernel(void)
{
        char * command_line;
        extern struct kernel_param __start___param[], __stop___param[];

        smp_setup_processor_id();





        unwind_init();
        do { } while (0);

        do { raw_local_irq_disable(); do { } while (0); } while (0);
        early_boot_irqs_off();
        early_init_irq_lock_class();





        lock_kernel();
        boot_cpu_init();
        page_address_init();
        printk("<5>");
        printk(linux_banner);
        setup_arch(&command_line);
        unwind_setup();
        setup_per_cpu_areas();
        smp_prepare_boot_cpu();






        sched_init();




        do { } while (0);
        build_all_zonelists();
        page_alloc_init();
        printk("<5>" "Kernel command line: %s\n", saved_command_line);
        parse_early_param();
        parse_args("Booting kernel", command_line, __start___param,
                   __stop___param - __start___param,
                   &unknown_bootoption);
        if (!({ unsigned long flags; do { (flags) = __raw_local_save_flags(); } while (0); raw_irqs_disabled_flags(flags); })) {
                printk("<4>" "start_kernel(): bug: interrupts were "
                                "enabled *very* early, fixing it\n");
                do { raw_local_irq_disable(); do { } while (0); } while (0);
        }
        sort_main_extable();
        trap_init();
        rcu_init();
        init_IRQ();
        pidhash_init();
        init_timers();
        hrtimers_init();
        softirq_init();
        timekeeping_init();
        time_init();
        profile_init();
        if (!({ unsigned long flags; do { (flags) = __raw_local_save_flags(); } while (0); raw_irqs_disabled_flags(flags); }))
                printk("start_kernel(): bug: interrupts were enabled early\n");
        early_boot_irqs_on();
        do { do { } while (0); raw_local_irq_enable(); } while (0);






        console_init();
        if (panic_later)
                panic(panic_later, panic_param);

        do { } while (0);






        do { } while (0);


        if (initrd_start && !initrd_below_start_ok &&
                        initrd_start < min_low_pfn << 12) {
                printk("<2>" "initrd overwritten (0x%08lx < 0x%08lx) - "
                    "disabling it.\n",initrd_start,min_low_pfn << 12);
                initrd_start = 0;
        }

        vfs_caches_init_early();
        cpuset_init_early();
        mem_init();
        kmem_cache_init();
        setup_per_cpu_pageset();
        numa_policy_init();
        if (late_time_init)
                late_time_init();
        calibrate_delay();
        pidmap_init();
        pgtable_cache_init();
        prio_tree_init();
        anon_vma_init();

        if (0)
                efi_enter_virtual_mode();

        fork_init(num_physpages);
        proc_caches_init();
        buffer_init();
        unnamed_dev_init();
        do { } while(0);
        security_init();
        vfs_caches_init(num_physpages);
        radix_tree_init();
        signals_init();

        page_writeback_init();

        proc_root_init();

        cpuset_init();
        taskstats_init_early();
        delayacct_init();

        check_bugs();

        acpi_early_init();


        rest_init();
}

static int __attribute__ ((__section__ (".init.data"))) initcall_debug;

static int __attribute__ ((__section__ (".init.text"))) initcall_debug_setup(char *str)
{
        initcall_debug = 1;
        return 1;
}
static char __setup_str_initcall_debug_setup[] __attribute__ ((__section__ (".init.data"))) = "initcall_debug"; static struct obs_kernel_param __setup_initcall_debug_setup __attribute__((__unused__)) __attribute__((__section__(".init.setup"))) __attribute__((aligned((sizeof(long))))) = { __setup_str_initcall_debug_setup, initcall_debug_setup, 0 };

extern initcall_t __initcall_start[], __initcall_end[];

static void __attribute__ ((__section__ (".init.text"))) do_initcalls(void)
{
        initcall_t *call;
        int count = (current_thread_info()->preempt_count);

        for (call = __initcall_start; call < __initcall_end; call++) {
                char *msg = ((void *)0);
                char msgbuf[40];
                int result;

                if (initcall_debug) {
                        printk("Calling initcall 0x%p", *call);
                        print_symbol(": %s()", (unsigned long) *call);

                        printk("\n");
                }

                result = (*call)();

                if (result && result != -19 && initcall_debug) {
                        sprintf(msgbuf, "error code %d", result);
                        msg = msgbuf;
                }
                if ((current_thread_info()->preempt_count) != count) {
                        msg = "preemption imbalance";
                        (current_thread_info()->preempt_count) = count;
                }
                if (({ unsigned long flags; do { (flags) = __raw_local_save_flags(); } while (0); raw_irqs_disabled_flags(flags); })) {
                        msg = "disabled interrupts";
                        do { do { } while (0); raw_local_irq_enable(); } while (0);
                }
                if (msg) {
                        printk("<4>" "initcall at 0x%p", *call);
                        print_symbol(": %s()", (unsigned long) *call);

                        printk(": returned with %s\n", msg);
                }
        }


        flush_scheduled_work();
}
# 684 "init/main.c"
static void __attribute__ ((__section__ (".init.text"))) do_basic_setup(void)
{

        init_workqueues();
        usermodehelper_init();
        driver_init();


        sysctl_init();


        do_initcalls();
}

static void __attribute__ ((__section__ (".init.text"))) do_pre_smp_initcalls(void)
{
        extern int spawn_ksoftirqd(void);

        extern int migration_init(void);

        migration_init();

        spawn_ksoftirqd();
        spawn_softlockup_task();
}

static void run_init_process(char *init_filename)
{
        argv_init[0] = init_filename;
        kernel_execve(init_filename, argv_init, envp_init);
}

static int init(void * unused)
{
        lock_kernel();



        set_cpus_allowed(get_current(), (cpumask_t) { { [(((32)+32 -1)/32)-1] = ( ((32) % 32) ? (1UL<<((32) % 32))-1 : ~0UL ) } });
# 731 "init/main.c"
        init_pid_ns.child_reaper = get_current();

        cad_pid = task_pid(get_current());

        smp_prepare_cpus(max_cpus);

        do_pre_smp_initcalls();

        smp_init();
        sched_init_smp();

        cpuset_init_smp();

        do_basic_setup();






        if (!ramdisk_execute_command)
                ramdisk_execute_command = "/init";

        if (sys_access((const char *) ramdisk_execute_command, 0) != 0) {
                ramdisk_execute_command = ((void *)0);
                prepare_namespace();
        }






        free_initmem();
        unlock_kernel();
        mark_rodata_ro();
        system_state = SYSTEM_RUNNING;
        numa_default_policy();

        if (sys_open((const char *) "/dev/console", 00000002, 0) < 0)
                printk("<4>" "Warning: unable to open an initial console.\n");

        (void) sys_dup(0);
        (void) sys_dup(0);

        if (ramdisk_execute_command) {
                run_init_process(ramdisk_execute_command);
                printk("<4>" "Failed to execute %s\n",
                                ramdisk_execute_command);
        }







        if (execute_command) {
                run_init_process(execute_command);
                printk("<4>" "Failed to execute %s.  Attempting "
                                        "defaults...\n", execute_command);
        }
        run_init_process("/sbin/init");
        run_init_process("/etc/init");
        run_init_process("/bin/init");
        run_init_process("/bin/sh");

        panic("No init found.  Try passing init= option to kernel.");
}
