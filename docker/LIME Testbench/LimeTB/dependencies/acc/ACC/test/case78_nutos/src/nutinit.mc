# 1 "../../os/nutinit.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "../../os/nutinit.c"
# 102 "../../os/nutinit.c"
# 1 "../../include/compiler.h" 1
# 70 "../../include/compiler.h"
# 1 "../../include/arch/avr.h" 1
# 87 "../../include/arch/avr.h"
# 1 "../../include/arch/avr/gcc.h" 1
# 54 "../../include/arch/avr/gcc.h"
# 1 "/usr/avr/include/avr/io.h" 1 3
# 81 "/usr/avr/include/avr/io.h" 3
# 1 "/usr/avr/include/avr/sfr_defs.h" 1 3
# 82 "/usr/avr/include/avr/io.h" 2 3
# 163 "/usr/avr/include/avr/io.h" 3
# 1 "/usr/avr/include/avr/iom128.h" 1 3
# 164 "/usr/avr/include/avr/io.h" 2 3
# 55 "../../include/arch/avr/gcc.h" 2
# 1 "/usr/avr/include/avr/interrupt.h" 1 3
# 129 "/usr/avr/include/avr/interrupt.h" 3
extern inline void timer_enable_int (unsigned char ints)
{

    (*(volatile unsigned char *)((0x37) + 0x20)) = ints;

}
# 56 "../../include/arch/avr/gcc.h" 2
# 1 "/usr/avr/include/avr/signal.h" 1 3
# 57 "../../include/arch/avr/gcc.h" 2
# 1 "/usr/avr/include/avr/eeprom.h" 1 3
# 40 "/usr/avr/include/avr/eeprom.h" 3
# 1 "/usr/lib/gcc-lib/avr/3.3.1/include/stddef.h" 1 3 4
# 213 "/usr/lib/gcc-lib/avr/3.3.1/include/stddef.h" 3 4
typedef unsigned int size_t;
# 41 "/usr/avr/include/avr/eeprom.h" 2 3
# 1 "/usr/avr/include/inttypes.h" 1 3
# 67 "/usr/avr/include/inttypes.h" 3
typedef signed char int8_t;




typedef unsigned char uint8_t;
# 90 "/usr/avr/include/inttypes.h" 3
typedef int int16_t;




typedef unsigned int uint16_t;
# 106 "/usr/avr/include/inttypes.h" 3
typedef long int32_t;




typedef unsigned long uint32_t;
# 124 "/usr/avr/include/inttypes.h" 3
typedef long long int64_t;




typedef unsigned long long uint64_t;
# 141 "/usr/avr/include/inttypes.h" 3
typedef int16_t intptr_t;




typedef uint16_t uintptr_t;
# 42 "/usr/avr/include/avr/eeprom.h" 2 3
# 83 "/usr/avr/include/avr/eeprom.h" 3
extern uint8_t eeprom_read_byte (const uint8_t *addr);




extern uint16_t eeprom_read_word (const uint16_t *addr);





extern void eeprom_read_block (void *buf, const void *addr, size_t n);




extern void eeprom_write_byte (uint8_t *addr, uint8_t val);




extern void eeprom_write_word (uint16_t *addr, uint16_t val);





extern void eeprom_write_block (const void *buf, void *addr, size_t n);
# 58 "../../include/arch/avr/gcc.h" 2
# 1 "/usr/avr/include/avr/pgmspace.h" 1 3
# 68 "/usr/avr/include/avr/pgmspace.h" 3
# 1 "/usr/lib/gcc-lib/avr/3.3.1/include/stddef.h" 1 3 4
# 69 "/usr/avr/include/avr/pgmspace.h" 2 3
# 89 "/usr/avr/include/avr/pgmspace.h" 3
typedef void prog_void __attribute__((__progmem__));
typedef char prog_char __attribute__((__progmem__));
typedef unsigned char prog_uchar __attribute__((__progmem__));

typedef int8_t prog_int8_t __attribute__((__progmem__));
typedef uint8_t prog_uint8_t __attribute__((__progmem__));
typedef int16_t prog_int16_t __attribute__((__progmem__));
typedef uint16_t prog_uint16_t __attribute__((__progmem__));

typedef int32_t prog_int32_t __attribute__((__progmem__));
typedef uint32_t prog_uint32_t __attribute__((__progmem__));

typedef int64_t prog_int64_t __attribute__((__progmem__));
typedef uint64_t prog_uint64_t __attribute__((__progmem__));
# 349 "/usr/avr/include/avr/pgmspace.h" 3
extern void *memcpy_P(void *, const prog_void *, size_t);
extern char *strcat_P(char *, const prog_char *);
extern int strcmp_P(const char *, const prog_char *) __attribute__((__pure__));
extern char *strcpy_P(char *, const prog_char *);
extern int strcasecmp_P(const char *, const prog_char *) __attribute__((__pure__));
extern size_t strlcat_P (char *, const prog_char *, size_t );
extern size_t strlcpy_P (char *, const prog_char *, size_t );
extern size_t strlen_P(const prog_char *) __attribute__((__const__));
extern int strncmp_P(const char *, const prog_char *, size_t) __attribute__((__pure__));
extern int strncasecmp_P(const char *, const prog_char *, size_t) __attribute__((__pure__));
extern char *strncat_P(char *, const prog_char *, size_t);
extern char *strncpy_P(char *, const prog_char *, size_t);
# 59 "../../include/arch/avr/gcc.h" 2
# 1 "/usr/avr/include/avr/sleep.h" 1 3
# 60 "../../include/arch/avr/gcc.h" 2
# 1 "/usr/avr/include/stdlib.h" 1 3
# 41 "/usr/avr/include/stdlib.h" 3
# 1 "/usr/lib/gcc-lib/avr/3.3.1/include/stddef.h" 1 3 4
# 325 "/usr/lib/gcc-lib/avr/3.3.1/include/stddef.h" 3 4
typedef int wchar_t;
# 42 "/usr/avr/include/stdlib.h" 2 3
# 60 "/usr/avr/include/stdlib.h" 3
typedef struct {
        int quot;
        int rem;
} div_t;


typedef struct {
        long quot;
        long rem;
} ldiv_t;


typedef int (*__compar_fn_t)(const void *, const void *);
# 94 "/usr/avr/include/stdlib.h" 3
extern __inline__ void abort(void) __attribute__((__noreturn__));




extern __inline__ void
abort(void)
{
        for (;;);
}




extern int abs(int __i) __attribute__((__const__));
# 117 "/usr/avr/include/stdlib.h" 3
extern long labs(long __i) __attribute__((__const__));
# 140 "/usr/avr/include/stdlib.h" 3
extern void *bsearch(const void *__key, const void *__base, size_t __nmemb,
                     size_t __size, int (*__compar)(const void *, const void *));







extern div_t div(int __num, int __denom) __asm__("__divmodhi4") __attribute__((__const__));





extern ldiv_t ldiv(long __num, long __denom) __asm__("__divmodsi4") __attribute__((__const__));
# 172 "/usr/avr/include/stdlib.h" 3
extern void qsort(void *__base, size_t __nmemb, size_t __size,
                  __compar_fn_t __compar);
# 205 "/usr/avr/include/stdlib.h" 3
extern long strtol(const char *__nptr, char **__endptr, int __base);
# 239 "/usr/avr/include/stdlib.h" 3
extern unsigned long strtoul(const char *__nptr, char **__endptr, int __base);
# 249 "/usr/avr/include/stdlib.h" 3
extern __inline__ long atol(const char *__nptr) __attribute__((__pure__));
extern __inline__ long
atol(const char *__nptr)
{
        return strtol(__nptr, (char **) 0, 10);
}
# 273 "/usr/avr/include/stdlib.h" 3
extern int atoi(const char *) __attribute__((__pure__));
# 285 "/usr/avr/include/stdlib.h" 3
extern void exit(int __status) __attribute__((__noreturn__));
# 297 "/usr/avr/include/stdlib.h" 3
extern void *malloc(size_t __size) __attribute__((__malloc__));






extern void free(void *__ptr);




extern size_t __malloc_margin;




extern char *__malloc_heap_start;




extern char *__malloc_heap_end;






extern void *calloc(size_t __nele, size_t __size) __attribute__((__malloc__));
# 358 "/usr/avr/include/stdlib.h" 3
extern double strtod(const char *__nptr, char **__endptr);
# 380 "/usr/avr/include/stdlib.h" 3
extern int rand(void);



extern void srand(unsigned int __seed);






extern int rand_r(unsigned long *ctx);
# 414 "/usr/avr/include/stdlib.h" 3
extern char *itoa(int __val, char *__s, int __radix);
# 434 "/usr/avr/include/stdlib.h" 3
extern char *ltoa(long int __val, char *__s, int __radix);
# 452 "/usr/avr/include/stdlib.h" 3
extern char *utoa(unsigned int __val, char *__s, int __radix);
# 470 "/usr/avr/include/stdlib.h" 3
extern char *ultoa(unsigned long int __val, char *__s, int __radix);
# 488 "/usr/avr/include/stdlib.h" 3
extern long random(void);




extern void srandom(unsigned long __seed);







extern long random_r(unsigned long *ctx);
# 541 "/usr/avr/include/stdlib.h" 3
extern char *dtostre(double __val, char *__s, unsigned char __prec,
                     unsigned char __flags);
# 554 "/usr/avr/include/stdlib.h" 3
extern char *dtostrf(double __val, char __width, char __prec, char *__s);
# 61 "../../include/arch/avr/gcc.h" 2







# 1 "/usr/avr/include/avr/twi.h" 1 3
# 69 "../../include/arch/avr/gcc.h" 2
# 88 "../../include/arch/avr.h" 2
# 138 "../../include/arch/avr.h"
extern void *__heap_start;
# 71 "../../include/compiler.h" 2
# 103 "../../os/nutinit.c" 2
# 1 "../../include/sys/heap.h" 1
# 68 "../../include/sys/heap.h"
# 1 "../../include/sys/types.h" 1
# 155 "../../include/sys/types.h"
    typedef unsigned char u_char;


    typedef unsigned short u_short;



    typedef unsigned int u_int;


    typedef unsigned long u_long;


    typedef unsigned long long u_longlong;




    typedef void *HANDLE;
# 186 "../../include/sys/types.h"
    typedef unsigned char ureg_t;
# 203 "../../include/sys/types.h"
    typedef unsigned char reg_t;
# 221 "../../include/sys/types.h"
    typedef unsigned short uptr_t;
# 244 "../../include/sys/types.h"
    static inline u_short __byte_swap2(u_short val) {
        asm volatile ("mov __tmp_reg__, %A0\n\t" "mov %A0, %B0\n\t" "mov %B0, __tmp_reg__\n\t":"=r" (val)
                      :"0"(val)
            );
         return val;
    }




    static inline u_long __byte_swap4(u_long val) {
        asm volatile ("mov __tmp_reg__, %A0\n\t"
                      "mov %A0, %D0\n\t"
                      "mov %D0, __tmp_reg__\n\t" "mov __tmp_reg__, %B0\n\t" "mov %B0, %C0\n\t" "mov %C0, __tmp_reg__\n\t":"=r" (val)
                      :"0"(val)
            );
        return val;
    }
# 69 "../../include/sys/heap.h" 2
# 87 "../../include/sys/heap.h"
typedef struct _HEAPNODE {
    size_t hn_size;
    struct _HEAPNODE *hn_next;
} HEAPNODE;

extern HEAPNODE* volatile heapFreeList;
# 103 "../../include/sys/heap.h"
extern void *NutHeapAlloc(size_t size);
extern void *NutHeapAllocClear(size_t size);
extern int NutHeapFree(void *block);
extern void NutHeapAdd(void *addr, size_t size);
extern size_t NutHeapAvailable(void);
# 104 "../../os/nutinit.c" 2
# 1 "../../include/sys/thread.h" 1
# 121 "../../include/sys/thread.h"
    typedef struct _NUTTHREADINFO NUTTHREADINFO;






    struct _NUTTHREADINFO {
        NUTTHREADINFO *volatile td_next;
        NUTTHREADINFO *td_qnxt;
        u_char td_name[9];
        u_char td_state;
        uptr_t td_sp;
        u_char td_priority;
        u_char *td_memory;
        HANDLE td_timer;
        HANDLE td_queue;







    };
# 160 "../../include/sys/thread.h"
    extern NUTTHREADINFO * runningThread;
    extern NUTTHREADINFO * nutThreadList;
    extern NUTTHREADINFO *volatile readyQueue;
    extern NUTTHREADINFO * runQueue;







    extern void NutThreadSetSleepMode(u_char mode);


    extern HANDLE NutThreadCreate(u_char * name, void (*fn) (void *), void *arg, size_t stackSize);
    extern u_char NutThreadSetPriority(u_char level);

    extern void NutThreadKill(void);
    extern void NutThreadDestroy(void);
    extern void NutThreadExit(void);

    extern void NutThreadResume(void);
    extern void NutThreadWake(HANDLE timer, HANDLE th);
    extern void NutThreadYield(void);

    extern void NutThreadAddPriQueue(NUTTHREADINFO * td, NUTTHREADINFO ** tqpp);
    extern void NutThreadRemoveQueue(NUTTHREADINFO * td, NUTTHREADINFO * volatile *tqpp);

    extern void NutThreadSwitch(void);
    extern HANDLE GetThreadByName(u_char * name);
# 198 "../../include/sys/thread.h"
    extern void DumpThreads(HANDLE handle);

    extern void *NutStackAlloc(size_t size);
    extern int NutStackFree(void *block);
    extern void NutStackAdd(void *addr, size_t size);
# 105 "../../os/nutinit.c" 2
# 1 "../../include/sys/timer.h" 1
# 93 "../../include/sys/timer.h"
# 1 "../../include/arch/timer.h" 1
# 44 "../../include/arch/timer.h"
# 1 "../../include/arch/avr/timer.h" 1
# 45 "../../include/arch/timer.h" 2
# 55 "../../include/arch/timer.h"






extern void NutRegisterTimer(void (*handler) (void *));
extern u_long NutGetCpuClock(void);
extern u_long NutGetTickClock(void);
extern u_long NutTimerMillisToTicks(u_long ms);
extern void NutDelay(u_char ms);


# 94 "../../include/sys/timer.h" 2
# 103 "../../include/sys/timer.h"
typedef struct _NUTTIMERINFO NUTTIMERINFO;





struct _NUTTIMERINFO {


    NUTTIMERINFO *tn_next;



    u_long tn_ticks;


    u_long tn_ticks_left;


    void (*tn_callback)(HANDLE, void *);


    volatile void *tn_arg;
};

extern NUTTIMERINFO* volatile nutTimerList;
extern NUTTIMERINFO* volatile nutTimerPool;









extern void NutTimerInit(void);
extern NUTTIMERINFO * NutTimerCreate(u_long ticks, void (*callback) (HANDLE, void *), void *arg, u_char flags);
extern void NutTimerInsert(NUTTIMERINFO * tn);
extern void NutTimerProcessElapsed(void);




extern void NutSleep(u_long ms);

extern u_long NutGetTickCount(void);
extern u_long NutGetSeconds(void);
extern u_long NutGetMillis(void);

extern HANDLE NutTimerStart(u_long ms, void (*callback)(HANDLE, void *), void *arg, u_char flags);
extern HANDLE NutTimerStartTicks(u_long ticks, void (*callback) (HANDLE, void *), void *arg, u_char flags);
extern void NutTimerStop(HANDLE handle);
extern void NutTimerStopAsync(HANDLE handle);


# 106 "../../os/nutinit.c" 2

# 1 "../../include/sys/confos.h" 1
# 56 "../../include/sys/confos.h"
# 1 "../../nutbld-13g-gcc/include/cfg/eeprom.h" 1
# 57 "../../include/sys/confos.h" 2
# 72 "../../include/sys/confos.h"
typedef struct _CONFOS CONFOS;






struct _CONFOS {
    u_char size;
    u_char magic[2];
    u_char hostname[16];
};

extern CONFOS confos;




extern int NutLoadConfig(void);
extern int NutSaveConfig(void);


# 108 "../../os/nutinit.c" 2
# 1 "/usr/avr/include/string.h" 1 3
# 40 "/usr/avr/include/string.h" 3
# 1 "/usr/lib/gcc-lib/avr/3.3.1/include/stddef.h" 1 3 4
# 41 "/usr/avr/include/string.h" 2 3
# 59 "/usr/avr/include/string.h" 3
extern void *memccpy(void *, const void *, int, size_t);
extern void *memchr(const void *, int, size_t) __attribute__((__pure__));
extern int memcmp(const void *, const void *, size_t) __attribute__((__pure__));
extern void *memcpy(void *, const void *, size_t);
extern void *memmove(void *, const void *, size_t);
extern void *memset(void *, int, size_t);
extern char *strcat(char *, const char *);
extern char *strchr(const char *, int) __attribute__((__pure__));
extern int strcmp(const char *, const char *) __attribute__((__pure__));
extern char *strcpy(char *, const char *);
extern int strcasecmp(const char *, const char *) __attribute__((__pure__));
extern size_t strlcat(char *, const char *, size_t);
extern size_t strlcpy(char *, const char *, size_t);
extern size_t strlen(const char *) __attribute__((__pure__));
extern char *strlwr(char *);
extern char *strncat(char *, const char *, size_t);
extern int strncmp(const char *, const char *, size_t);
extern char *strncpy(char *, const char *, size_t);
extern int strncasecmp(const char *, const char *, size_t) __attribute__((__pure__));
extern size_t strnlen(const char *, size_t) __attribute__((__pure__));
extern char *strrchr(const char *, int) __attribute__((__pure__));
extern char *strrev(char *);
extern char *strsep(char **, const char *) __attribute__((__pure__));
extern char *strstr(const char *, const char *) __attribute__((__pure__));
extern char *strtok_r(char *, const char *, char **) __attribute__((__pure__));
extern char *strupr(char *);
# 109 "../../os/nutinit.c" 2
# 126 "../../os/nutinit.c"
volatile u_char ms62_5 = 0;




# 1 "../../arch/avr/os/nutinit.c" 1
# 106 "../../arch/avr/os/nutinit.c"
# 1 "../../nutbld-13g-gcc/include/cfg/memory.h" 1
# 107 "../../arch/avr/os/nutinit.c" 2
# 1 "../../nutbld-13g-gcc/include/cfg/os.h" 1
# 108 "../../arch/avr/os/nutinit.c" 2
# 1 "../../include/cfg/arch/avr.h" 1
# 77 "../../include/cfg/arch/avr.h"
# 1 "../../nutbld-13g-gcc/include/cfg/arch/avrpio.h" 1
# 78 "../../include/cfg/arch/avr.h" 2
# 109 "../../arch/avr/os/nutinit.c" 2
# 1 "../../nutbld-13g-gcc/include/cfg/arch.h" 1
# 110 "../../arch/avr/os/nutinit.c" 2
# 144 "../../arch/avr/os/nutinit.c"
u_char nutmem_onchip[64];




u_char idle_sleep_mode = 0xff;
# 264 "../../arch/avr/os/nutinit.c"
void NutInit(void) __attribute__ ((naked)) __attribute__ ((section(".init8")));
extern void NutAppMain(void *arg) __attribute__ ((noreturn));
# 278 "../../arch/avr/os/nutinit.c"
static void NutInitXRAM(void) __attribute__ ((naked, section(".init1"), used));
void NutInitXRAM(void)
{
# 294 "../../arch/avr/os/nutinit.c"
    (*(volatile unsigned char *)((0x35) + 0x20)) = (1 << (7)) | (1 << (6));
# 308 "../../arch/avr/os/nutinit.c"
}
# 325 "../../arch/avr/os/nutinit.c"
static void FakeNicEeprom(void) __attribute__ ((naked, section(".init1"), used));
void FakeNicEeprom(void)
{





    ((*(volatile unsigned char *)(((unsigned int) &((*(volatile unsigned char *)((0x15) + 0x20)))))) |= (1 << (7)));
    ((*(volatile unsigned char *)(((unsigned int) &((*(volatile unsigned char *)((0x14) + 0x20)))))) |= (1 << (7)));

    ((*(volatile unsigned char *)(((unsigned int) &((*(volatile unsigned char *)((0x15) + 0x20)))))) |= (1 << (6)));
    ((*(volatile unsigned char *)(((unsigned int) &((*(volatile unsigned char *)((0x14) + 0x20)))))) |= (1 << (6)));


    (*(volatile unsigned char *)(0x8300)) = 0xE1;
    (*(volatile unsigned char *)(0x8300 + 1)) = 0x40;



    ((*(volatile unsigned char *)(((unsigned int) &((*(volatile unsigned char *)((0x35) + 0x20)))))) &= ~(1 << (7)));







    __asm__ __volatile__("\n"
                         "EmuLoop:               " "\n"
                         "        ldi  r24, 0    " "\n"
                         "        ldi  r25, 0    " "\n"
                         "        sbis %0, %1    " "\n"
                         "        rjmp EmuClkClr " "\n"
                         "EmuClkSet:             " "\n"
                         "        adiw r24, 1    " "\n"
                         "        breq EmuDone   " "\n"
                         "        sbis %0, %1    " "\n"
                         "        rjmp EmuLoop   " "\n"
                         "        rjmp EmuClkSet " "\n"
                         "EmuClkClr:             " "\n"
                         "        adiw r24, 1    " "\n"
                         "        breq EmuDone   " "\n"
                         "        sbic %0, %1    " "\n"
                         "        rjmp EmuLoop   " "\n"
                         "        rjmp EmuClkClr " "\n"
                         "EmuDone:               \n\t"
                         :
                         :"I"((((unsigned int) &((*(volatile unsigned char *)((0x13) + 0x20)))) - 0x20)),
                          "I"(5)
                         :"r24", "r25");



    ((*(volatile unsigned char *)(((unsigned int) &((*(volatile unsigned char *)((0x35) + 0x20)))))) |= (1 << (7)));




    ((*(volatile unsigned char *)(((unsigned int) &((*(volatile unsigned char *)((0x15) + 0x20)))))) &= ~(1 << (7)));
    ((*(volatile unsigned char *)(((unsigned int) &((*(volatile unsigned char *)((0x14) + 0x20)))))) &= ~(1 << (7)));

    ((*(volatile unsigned char *)(((unsigned int) &((*(volatile unsigned char *)((0x15) + 0x20)))))) &= ~(1 << (6)));
    ((*(volatile unsigned char *)(((unsigned int) &((*(volatile unsigned char *)((0x14) + 0x20)))))) &= ~(1 << (6)));
}
# 403 "../../arch/avr/os/nutinit.c"
void NutThreadSetSleepMode(u_char mode)
{
    idle_sleep_mode = mode;
}







void NutIdle(void *arg) __attribute__ ((noreturn)); void NutIdle(void *arg)
{

    u_char sleep_mode;


    NutTimerInit();


    NutThreadCreate("main", NutAppMain, 0, 768);






    NutThreadSetPriority(254);
    for (;;) {
        NutThreadYield();
        NutThreadDestroy();


        if (idle_sleep_mode != 0xff) {
            sleep_mode = (*(volatile unsigned char *)((0x35) + 0x20)) & ((1 << (3)) | (1 << (4)) | (1 << (2)));
            ((*(volatile unsigned char *)((0x35) + 0x20)) = (((*(volatile unsigned char *)((0x35) + 0x20)) & ~((1 << (3)) | (1 << (4)) | (1 << (2)))) | (idle_sleep_mode)));


            (*(volatile unsigned char *)((0x35) + 0x20)) |= (1 << (5));
            __asm__ __volatile__ ("sleep" "\n\t" :: );
            (*(volatile unsigned char *)((0x35) + 0x20)) &= ~(1 << (5));
            ((*(volatile unsigned char *)((0x35) + 0x20)) = (((*(volatile unsigned char *)((0x35) + 0x20)) & ~((1 << (3)) | (1 << (4)) | (1 << (2)))) | (sleep_mode)));
        }

    }
}


static void NutInitSP(void) __attribute__ ((naked, section (".init5"), used));
void NutInitSP(void)
{






    (*(volatile unsigned int *)((0x3D) + 0x20)) = (u_short)((u_short)(0x1100 + (u_short)28416 - 1U));

}



static void NutInitHeap(void) __attribute__ ((naked, section (".init5"), used));

void NutInitHeap()
{
# 479 "../../arch/avr/os/nutinit.c"
    if ((u_short)(u_short)(0x1100 + (u_short)28416 - 1U) - (u_short) (&__heap_start) > 384) {
        NutHeapAdd(&__heap_start, (u_short) (u_short)(0x1100 + (u_short)28416 - 1U) - 256 - (u_short) (&__heap_start));
    }
}


static void NutCustomInit(void) __attribute__ ((naked, section (".init1"), used));
# 496 "../../arch/avr/os/nutinit.c"
void NutCustomInit(void)
# 568 "../../arch/avr/os/nutinit.c"
{

    ((*(volatile unsigned char *)(((unsigned int) &((*(volatile unsigned char *)((0x09) + 0x20)))))) = (7));

    ((*(volatile unsigned char *)(((unsigned int) &((*(volatile unsigned char *)(0x99)))))) = (7));

}
# 609 "../../arch/avr/os/nutinit.c"
void NutInit(void)
{
# 636 "../../arch/avr/os/nutinit.c"
    if (NutLoadConfig()) {
        strcpy(confos.hostname, "ethernut");
        NutSaveConfig();
    }



    NutThreadCreate("idle", NutIdle, 0, 384);
}
# 132 "../../os/nutinit.c" 2
