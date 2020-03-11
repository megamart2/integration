# 1 "../../arch/avr/dev/ide.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "../../arch/avr/dev/ide.c"
# 59 "../../arch/avr/dev/ide.c"
# 1 "/usr/lib/gcc-lib/avr/3.3.1/include/stddef.h" 1 3 4
# 151 "/usr/lib/gcc-lib/avr/3.3.1/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 213 "/usr/lib/gcc-lib/avr/3.3.1/include/stddef.h" 3 4
typedef unsigned int size_t;
# 325 "/usr/lib/gcc-lib/avr/3.3.1/include/stddef.h" 3 4
typedef int wchar_t;
# 60 "../../arch/avr/dev/ide.c" 2
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
# 61 "../../arch/avr/dev/ide.c" 2

# 1 "../../include/sys/timer.h" 1
# 92 "../../include/sys/timer.h"
# 1 "../../include/sys/types.h" 1
# 144 "../../include/sys/types.h"
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
# 145 "../../include/sys/types.h" 2
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
# 93 "../../include/sys/timer.h" 2
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


# 63 "../../arch/avr/dev/ide.c" 2
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
# 64 "../../arch/avr/dev/ide.c" 2
# 1 "../../include/sys/event.h" 1
# 95 "../../include/sys/event.h"
extern void NutEventTimeout(HANDLE timer, void *arg);
extern int NutEventWait(volatile HANDLE *qhp, u_long ms);
extern int NutEventWaitNext(volatile HANDLE *qhp, u_long ms);
extern int NutEventPostAsync(HANDLE volatile *qhp);
extern int NutEventPostFromIrq(HANDLE volatile *qhp);
extern int NutEventPost(HANDLE *qhp);
extern int NutEventBroadcastAsync(HANDLE *qhp);
extern int NutEventBroadcast(HANDLE *qhp);
# 65 "../../arch/avr/dev/ide.c" 2
# 1 "../../include/sys/atom.h" 1
# 98 "../../include/sys/atom.h"
# 1 "../../nutbld-13g-gcc/include/cfg/os.h" 1
# 99 "../../include/sys/atom.h" 2
# 125 "../../include/sys/atom.h"
# 1 "../../include/arch/avr/atom.h" 1
# 126 "../../include/sys/atom.h" 2
# 66 "../../arch/avr/dev/ide.c" 2
# 1 "../../include/sys/heap.h" 1
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
# 67 "../../arch/avr/dev/ide.c" 2
# 1 "../../include/dev/irqreg.h" 1
# 94 "../../include/dev/irqreg.h"
# 1 "../../nutbld-13g-gcc/include/cfg/arch.h" 1
# 95 "../../include/dev/irqreg.h" 2
# 1 "../../include/sys/device.h" 1
# 85 "../../include/sys/device.h"
# 1 "../../include/sys/file.h" 1
# 52 "../../include/sys/file.h"
struct _NUTDEVICE;




typedef struct _NUTFILE NUTFILE;





struct _NUTFILE {



    NUTFILE *nf_next;




    struct _NUTDEVICE *nf_dev;




    void *nf_fcb;
};
# 86 "../../include/sys/device.h" 2







# 127 "../../include/sys/device.h"
typedef struct _NUTDEVICE NUTDEVICE;
# 143 "../../include/sys/device.h"
struct _NUTDEVICE {




    NUTDEVICE *dev_next;




    u_char dev_name[9];
# 166 "../../include/sys/device.h"
    u_char dev_type;







    uptr_t dev_base;






    u_char dev_irq;






    void *dev_icb;






    void *dev_dcb;






    int (*dev_init) (NUTDEVICE *);






    int (*dev_ioctl) (NUTDEVICE *, int, void *);




    int (*dev_read) (NUTFILE *, void *, int);




    int (*dev_write) (NUTFILE *, const void *, int);





    int (*dev_write_P) (NUTFILE *, const prog_char *, int);





    NUTFILE * (*dev_open) (NUTDEVICE *, const char *, int, int);




    int (*dev_close) (NUTFILE *);




    long (*dev_size) (NUTFILE *);

};




typedef struct _NUTVIRTUALDEVICE NUTVIRTUALDEVICE;




struct _NUTVIRTUALDEVICE {
    NUTVIRTUALDEVICE *vdv_next;
    NUTVIRTUALDEVICE *vdv_zero;
    u_char vdv_type;
    int (*vdv_read) (void *, void *, int);
    int (*vdv_write) (void *, const void *, int);

    int (*vdv_write_P) (void *, const prog_char *, int);

    int (*vdv_ioctl) (void *, int, void *);
};




typedef struct _IFSTREAM IFSTREAM;







struct _IFSTREAM {
    int (*if_input)(NUTDEVICE *);
    int (*if_output)(NUTDEVICE *);
    int (*if_flush)(NUTDEVICE *);
    volatile u_char if_rx_idx;
    u_char if_rd_idx;
    volatile u_char if_tx_idx;
    u_char if_wr_idx;
    volatile u_char if_tx_act;
    u_char if_last_eol;
    u_char if_rx_buf[256];
    u_char if_tx_buf[256];
};




extern NUTDEVICE *nutDeviceList;

extern int NutRegisterDevice(NUTDEVICE * dev, uptr_t base, u_char irq);
extern NUTDEVICE *NutDeviceLookup(const char *name);


# 96 "../../include/dev/irqreg.h" 2
# 1 "../../include/dev/irqstack.h" 1
# 58 "../../include/dev/irqstack.h"
# 1 "../../include/cfg/dev.h" 1
# 59 "../../include/dev/irqstack.h" 2
# 97 "../../include/dev/irqreg.h" 2
# 129 "../../include/dev/irqreg.h"
typedef struct {



    void *ir_arg;
    void (*ir_handler) (void *);
    int (*ir_ctl) (int cmd, void *param);
} IRQ_HANDLER;


# 1 "../../include/arch/avr/irqreg.h" 1
# 56 "../../include/arch/avr/irqreg.h"
extern IRQ_HANDLER sig_INTERRUPT0;
extern IRQ_HANDLER sig_INTERRUPT1;
extern IRQ_HANDLER sig_INTERRUPT2;
extern IRQ_HANDLER sig_INTERRUPT3;
extern IRQ_HANDLER sig_INTERRUPT4;
extern IRQ_HANDLER sig_INTERRUPT5;
extern IRQ_HANDLER sig_INTERRUPT6;
extern IRQ_HANDLER sig_INTERRUPT7;
extern IRQ_HANDLER sig_OUTPUT_COMPARE2;
extern IRQ_HANDLER sig_OVERFLOW2;
extern IRQ_HANDLER sig_INPUT_CAPTURE1;
extern IRQ_HANDLER sig_OUTPUT_COMPARE1A;
extern IRQ_HANDLER sig_OUTPUT_COMPARE1B;
extern IRQ_HANDLER sig_OVERFLOW1;
extern IRQ_HANDLER sig_OUTPUT_COMPARE0;
extern IRQ_HANDLER sig_OVERFLOW0;
extern IRQ_HANDLER sig_SPI;
extern IRQ_HANDLER sig_UART0_TRANS;
extern IRQ_HANDLER sig_UART0_DATA;
extern IRQ_HANDLER sig_UART0_RECV;
extern IRQ_HANDLER sig_ADC;
extern IRQ_HANDLER sig_EEPROM_READY;
extern IRQ_HANDLER sig_COMPARATOR;

extern IRQ_HANDLER sig_OUTPUT_COMPARE1C;
extern IRQ_HANDLER sig_INPUT_CAPTURE3;
extern IRQ_HANDLER sig_OUTPUT_COMPARE3A;
extern IRQ_HANDLER sig_OUTPUT_COMPARE3B;
extern IRQ_HANDLER sig_OUTPUT_COMPARE3C;
extern IRQ_HANDLER sig_OVERFLOW3;
extern IRQ_HANDLER sig_UART1_RECV;
extern IRQ_HANDLER sig_UART1_DATA;
extern IRQ_HANDLER sig_UART1_TRANS;
extern IRQ_HANDLER sig_2WIRE_SERIAL;
extern IRQ_HANDLER sig_SPM_READY;
# 140 "../../include/dev/irqreg.h" 2
# 154 "../../include/dev/irqreg.h"



extern void CallHandler(IRQ_HANDLER * irh);




extern int NutRegisterIrqHandler(IRQ_HANDLER * irh, void (*handler) (void *), void *arg);
extern int NutIrqEnable(IRQ_HANDLER * irq);
extern int NutIrqDisable(IRQ_HANDLER * irq);
extern int NutIrqSetPriority(IRQ_HANDLER * irq, int level);



# 68 "../../arch/avr/dev/ide.c" 2

# 1 "../../include/dev/ide.h" 1
# 44 "../../include/dev/ide.h"
# 1 "../../include/fs/typedefs.h" 1
# 41 "../../include/fs/typedefs.h"
typedef char CHAR;
typedef unsigned char BYTE;
typedef unsigned short WORD;
typedef long LONG;
typedef unsigned long ULONG;
typedef unsigned long DWORD;
# 45 "../../include/dev/ide.h" 2
# 87 "../../include/dev/ide.h"
typedef void IDE_MOUNT_FUNC(int nDevice);
# 96 "../../include/dev/ide.h"
int IDEInit(int nBaseAddress, int nIDEMode, IDE_MOUNT_FUNC * pMountFunc, IDE_MOUNT_FUNC * pUnMountFunc);

int IDEMountDevice(BYTE bDevice, BYTE * pSectorBuffer);

int IDEGetSectorSize(BYTE bDevice);

int IDEIsCDROMDevice(BYTE bDevice);

int IDEIsZIPDevice(BYTE bDevice);

int IDEUnMountDevice(BYTE bDevice);

DWORD IDEGetTotalSectors(BYTE bDevice);

int IDEReadSectors(BYTE bDevice, void *pData, DWORD dwStartSector, WORD wSectorCount);
# 120 "../../include/dev/ide.h"
int IDEATAPISetCDSpeed(BYTE bDevice, WORD wSpeed);
# 70 "../../arch/avr/dev/ide.c" 2
# 1 "../../include/dev/idep.h" 1
# 125 "../../include/dev/idep.h"
typedef struct {
    unsigned UnUsed0:1;
    unsigned HardSector_O:1;
    unsigned SoftSector_O:1;
    unsigned MFM_O:1;
    unsigned SlowHead_O:1;
    unsigned SynchDriveMotor_O:1;
    unsigned FixedDevice:1;
    unsigned RemoveableDevice:1;
    unsigned DiskTransferRate_O:3;
    unsigned InaccurateSpeed_O:1;
    unsigned DataStrobeOffset_O:1;
    unsigned TrackOffsetOption_O:1;
    unsigned FormatGapRequired_O:1;
    unsigned ATAPI:1;

    WORD Cylinders;
    WORD UnUsed1;
    WORD Heads;
    WORD BytesPerTrack_O;
    WORD BytesPerSector_O;
    WORD SectorsPerTrack;
    WORD VendorSpecific[3];
    char SerialNumber[20];
    WORD BufferType_O;
    WORD BufferSizeSectors_O;
    WORD ECCBytes;
    char FirmwareRevision[8];
    char Model[40];
    BYTE MaxMultipleSectors;
    BYTE UnUsed2;
    WORD Can32Bit_O;

    unsigned CanDMA_O:1;
    unsigned UnUsed3:9;
    unsigned CanDisableIORDY:1;
    unsigned IORDYSupported:1;
    unsigned AdvancedTransferMode:1;
    unsigned ATA3StandbyTimer:1;
    unsigned UnUsed4:2;

    WORD UnUsed5;

    BYTE UnUsed6;
    BYTE PIOTransferSpeed;
    BYTE UnUsed7;
    BYTE DMATransferSpeed;

    unsigned Fields_6C_75_Valid:1;
    unsigned Fields_80_8C_Valid:1;
    unsigned UnUsed8:14;

    WORD Cylinders2;
    WORD Heads2;
    WORD SectorsPerTrack2;
    DWORD Sectors;

    BYTE MaxSectorsPerInt;
    unsigned MaxSectorsPerIntIsValid:1;
    unsigned UnUsed9:7;

    DWORD LBASectors;

    WORD UnUsed10;

    BYTE SupportedDMAModes;
    BYTE ActiveDMAModes;

    BYTE PIOModesSupported;
    BYTE UnUsed11;

    WORD DMACycleTime;
    WORD RecommendedDMACycleTime;
    WORD PIOCycleTime;
    WORD IORDYPIOCycleTime;

    WORD Reserved1[2];
    WORD Reserved2[4];

    WORD QueueDepth;

    WORD Reserved3[4];

    WORD ATAVersionMajor;
    WORD ATAVersionMinor;

    WORD CommandSetSupported[2];
    WORD CommandSetSupportedExtension;
    WORD CommandSetEnabled[2];
    WORD CommandSetDefault;

    WORD UltraDMAMode;

    WORD SecurityStatus[2];

    WORD AdvancedPowerManagement;
    WORD MasterPasswordRevisionCode;

    WORD HardwareResetResult;

    WORD AcousticManagementValue;

    WORD Reserved4[5];

    WORD MaximumUserLBA48[4];

    WORD Reserved5[23];

} IDEDEVICEINFO;
# 71 "../../arch/avr/dev/ide.c" 2
# 140 "../../arch/avr/dev/ide.c"
typedef struct _drive {



    WORD wFlags;
    BYTE bIDEMode;
    BYTE bDevice;
# 161 "../../arch/avr/dev/ide.c"
    DWORD dwTotalSectors;

    WORD wSectorSize;
} DRIVE, *LPDRIVE;
# 173 "../../arch/avr/dev/ide.c"
static HANDLE hIDEEvent;
static volatile BYTE *pIDE;
static volatile BYTE gbIntStatus = 0;

static DRIVE sDrive[1];

static HANDLE hIDESemaphore;
static HANDLE hCFChangeInt;
static BYTE gbCFMountStatus = 0;

static IDE_MOUNT_FUNC *pUserMountFunc = ((void *)0);
static IDE_MOUNT_FUNC *pUserUnMountFunc = ((void *)0);





static BYTE aATAPICmd[12];
# 206 "../../arch/avr/dev/ide.c"
static void Wait400ns(void)
{




    ;
    __asm__ __volatile__ ("nop");
    __asm__ __volatile__ ("nop");
    __asm__ __volatile__ ("nop");
    __asm__ __volatile__ ("nop");
    __asm__ __volatile__ ("nop");
    __asm__ __volatile__ ("nop");
    __asm__ __volatile__ ("nop");
    __asm__ __volatile__ ("nop");
    ;
}




void IDELock(void)
{
    NutEventWait(&hIDESemaphore, 0);
}




void IDEFree(void)
{
    NutEventPost(&hIDESemaphore);
}




void IDESemaInit(void)
{
    NutEventPost(&hIDESemaphore);
}




static void HardwareReset(DRIVE * pDrive)
{
    if (pDrive->bIDEMode == 3) {



        (*(volatile unsigned char *)((0x12) + 0x20)) |= 0x20;
        __asm__ __volatile__ ("nop");

        NutSleep(1000);




        (*(volatile unsigned char *)((0x12) + 0x20)) &= ~0x20;
        __asm__ __volatile__ ("nop");

        NutSleep(1000);
    } else {



        (*(volatile unsigned char *)((0x12) + 0x20)) &= ~0x20;
        __asm__ __volatile__ ("nop");

        NutSleep(1000);




        (*(volatile unsigned char *)((0x12) + 0x20)) |= 0x20;
        __asm__ __volatile__ ("nop");

        if (pDrive->bIDEMode == 2) {
            NutSleep(1000);
        } else {





            NutSleep(10000);
        }
    }
}




static void CFInterrupt(void *p)
{
    p = p;

    NutEventPostFromIrq(&hCFChangeInt);
}




static void IDEInterrupt(void *p)
{
    p = p;

    gbIntStatus = pIDE[(0x0000 + 7)];

    NutEventPostFromIrq(&hIDEEvent);
}




static void ClearEvent(HANDLE * pEvent)
{
    asm volatile( "in  __tmp_reg__, __SREG__" "\n\t" "cli" "\n\t" "push __tmp_reg__" "\n\t" );;

    *pEvent = 0;

    asm volatile( "pop __tmp_reg__" "\n\t" "out __SREG__, __tmp_reg__" "\n\t" );
}






static int WaitForInterrupt(DWORD dwTimeout)
{
    int nError;
    int nTimeout;

    nError = 0x00;

    nTimeout = NutEventWait(&hIDEEvent, dwTimeout);
    if (nTimeout == -1) {
        nError = 0x01;
    }

    return (nError);
}







static int WaitDRQ(DWORD dwTimeout)
{
    int nError;
    BYTE bStatus;

    nError = 0x00;

    bStatus = pIDE[(0x0000 + 7)];
    if ((bStatus & (0x80 | 0x08)) != 0x08) {

        dwTimeout = (DWORD) (((dwTimeout * 10UL) / 625UL) + 1UL);
        dwTimeout += NutGetTickCount();

        bStatus = pIDE[(0x0000 + 7)];
        while ((bStatus & (0x80 | 0x08)) != 0x08) {
            if (NutGetTickCount() > dwTimeout) {
                nError = 0x01;
                break;
            }
            bStatus = pIDE[(0x0000 + 7)];
        }

    }

    return (nError);
}







static int WaitNotBusy(DWORD dwTimeout)
{
    int nError;
    BYTE bStatus;

    nError = 0x00;

    bStatus = pIDE[(0x0000 + 7)];
    if (bStatus & (0x80 | 0x08)) {

        dwTimeout = ((dwTimeout * 10) / 625) + 1;
        dwTimeout += NutGetTickCount();

        bStatus = pIDE[(0x0000 + 7)];
        while (bStatus & (0x80 | 0x08)) {
            if (NutGetTickCount() > dwTimeout) {
                nError = 0x04;
                break;
            }
            bStatus = pIDE[(0x0000 + 7)];
        }

    }

    return (nError);
}






static int SelectDevice(BYTE bDevice)
{
    int nError;
    int nTimeout;
    BYTE bStatus;
    BYTE bDummy;

    nError = 0x00;

    if (WaitNotBusy(200) == 0x00) {

        pIDE[(0x0000 + 6)] = 0xA0 + (bDevice << 4);

        Wait400ns();

        nError = WaitNotBusy(200);
    } else {
        nError = 0x04;
    }

    if (nError != 0x00) {




        bStatus = pIDE[(0x0000 + 7)];
        if (bStatus & 0x08) {

            nTimeout = 512;
            while ((bStatus & 0x08) && (nTimeout)) {
                bDummy = pIDE[(0x0000 + 0x0300)];
                bDummy = pIDE[(0x0000 + 0x0300)];
                bStatus = pIDE[(0x0000 + 7)];
                nTimeout--;
            }
        }
    }

    return (nError);
}







static int ATAPISendCommand(LPDRIVE pDrive, BYTE * pSectorBuffer, WORD * pReadCount)
{
    int nError;
    BYTE bStatus;
    BYTE bDevice;
    WORD x, y;
    BYTE bDummy;
    WORD wSectorSize;

    nError = 0x01;
    bDummy = 0;
    bDevice = pDrive->bDevice;
    wSectorSize = pDrive->wSectorSize;

    *pReadCount = 0;

    if (SelectDevice(bDevice) == 0x00) {

        ClearEvent(&hIDEEvent);

        if (WaitNotBusy(5000) == 0x00) {

            pIDE[(0x0000 + 1)] = 0x00;
            pIDE[(0x0000 + 2)] = 0x00;
            pIDE[(0x0000 + 3)] = 0x00;
            pIDE[(0x0000 + 4)] = (BYTE)(wSectorSize & 0x00FF);
            pIDE[(0x0000 + 5)] = (BYTE)((wSectorSize >> 8) & 0x00FF);
            pIDE[(0x0000 + 7)] = 0xA0;

            if (pDrive->wFlags & 0x0008) {
                nError = WaitForInterrupt(5000);
                if (nError == 0x00) {
                    ClearEvent(&hIDEEvent);
                }
            } else {
                nError = WaitDRQ(5000);
            }

            if (nError == 0x00) {
                for (x = 0; x < 12; x = x + 2) {
                    pIDE[(0x0000 + 0x0200)] = aATAPICmd[x + 1];
                    pIDE[(0x0000 + 0x0100)] = aATAPICmd[x];
                }

                if (WaitForInterrupt(5000) == 0x00) {
                    if (gbIntStatus & 0x01) {
                        nError = 0x01;
                    } else {
                        nError = 0x00;

                        if (gbIntStatus & 0x08) {

                            Wait400ns();

                            y = pIDE[(0x0000 + 5)] << 8;
                            y |= pIDE[(0x0000 + 4)];

                            if (y > wSectorSize) {
                                y = wSectorSize;
                            }

                            if (pSectorBuffer != ((void *)0)) {
                                for (x = 0; x < y; x = x + 2) {
                                    pSectorBuffer[x] = pIDE[(0x0000 + 0x0300)];
                                    pSectorBuffer[x + 1] = pIDE[(0x0000 + 0x0400)];
                                }
                            } else {
                                for (x = 0; x < y; x = x + 2) {
                                    bDummy += pIDE[(0x0000 + 0x0300)];
                                    bDummy += pIDE[(0x0000 + 0x0400)];
                                }
                            }

                            *pReadCount = y;

                            bStatus = pIDE[(0x0000 + 7)];
                        }
                    }
                }
            }
        }
    }

    return (nError);
}






static int ATAPIGetTotalSectors(LPDRIVE pDrive, BYTE * pSectorBuffer, DWORD * pMaxSectors)
{
    int nError;
    WORD wReadCount;
    WORD wErrorCount;
    DWORD dwValue;

    nError = 0x00;
    *pMaxSectors = 0;

    wErrorCount = 4;
    while (wErrorCount) {

        { memset(aATAPICmd, 0x00, sizeof(aATAPICmd)); aATAPICmd[0] = 0x25; };
        nError = ATAPISendCommand(pDrive, pSectorBuffer, &wReadCount);
        if ((nError == 0x00) && (wReadCount == 8)) {
            dwValue = pSectorBuffer[0];
            dwValue = dwValue << 8;
            dwValue |= pSectorBuffer[1];
            dwValue = dwValue << 8;
            dwValue |= pSectorBuffer[2];
            dwValue = dwValue << 8;
            dwValue |= pSectorBuffer[3];
            *pMaxSectors = dwValue;




            dwValue = pSectorBuffer[4];
            dwValue = dwValue << 8;
            dwValue |= pSectorBuffer[5];
            dwValue = dwValue << 8;
            dwValue |= pSectorBuffer[6];
            dwValue = dwValue << 8;
            dwValue |= pSectorBuffer[7];
            if (dwValue > 2048) {
                dwValue = 2048;
            }
            pDrive->wSectorSize = (WORD) (dwValue & 0x0000FFFF);
            break;
        }
        wErrorCount--;
        NutSleep(2000);
    }

    return (nError);
}
# 615 "../../arch/avr/dev/ide.c"
static int GetDeviceInfoPacket(LPDRIVE pDrive, BYTE * pSectorBuffer)
{
    WORD i;
    int nError;
    BYTE bStatus;
    BYTE bErrorReg;
    BYTE bDevice;
    WORD wConfig;
    DWORD dwTotalSectors;

    nError = 0x01;
    bDevice = pDrive->bDevice;

    if (SelectDevice(bDevice) == 0x00) {

        ClearEvent(&hIDEEvent);

        pIDE[(0x0000 + 7)] = 0xA1;
        if (WaitForInterrupt(10000) == 0x00) {

            if (gbIntStatus & 0x08) {

                for (i = 0; i < 512; i = i + 2) {
                    pSectorBuffer[i] = pIDE[(0x0000 + 0x0300)];
                    if (pDrive->bIDEMode == 3) {
                        pSectorBuffer[i + 1] = pIDE[(0x0000 + 0x0300)];
                    } else {
                        pSectorBuffer[i + 1] = pIDE[(0x0000 + 0x0400)];
                    }
                }





                bStatus = pIDE[(0x0000 + 7)];

                pDrive->wFlags = 0;

                wConfig = *(WORD *) & pSectorBuffer[0];
                if ((wConfig & 0x0060) == 0x0020) {
                    pDrive->wFlags |= 0x0008;
                }
                if ((wConfig & 0x1F00) == 0x0000) {
                    pDrive->wFlags |= 0x2000;
                }
                if ((wConfig & 0x1F00) == 0x0500) {
                    pDrive->wFlags |= (0x4000 | 0x1000);
                }
                if ((wConfig & 0xC000) == 0x8000) {
                    pDrive->wFlags |= 0x0004;
                }

                if ((wConfig & 0x0003) == 0x0000) {
                    pDrive->wFlags |= 0x8000;

                    nError = ATAPIGetTotalSectors(pDrive, pSectorBuffer, &dwTotalSectors);
                    if (nError == 0x00) {
                        pDrive->dwTotalSectors = dwTotalSectors;




                        { memset(aATAPICmd, 0x00, sizeof(aATAPICmd)); aATAPICmd[0] = 0x5A; };
                        aATAPICmd[2] = 0x2A;
                        aATAPICmd[7] = 0x08;
                        aATAPICmd[8] = 0x00;
                        ATAPISendCommand(pDrive, pSectorBuffer, &i);




                        IDEATAPISetCDSpeed(bDevice, 150);
                    } else {
                        pDrive->dwTotalSectors = 0;
                    }


                }
            }

            if (gbIntStatus & 0x01) {
                bErrorReg = pIDE[(0x0000 + 1)];
            }
        }

    }

    return (nError);
}
# 714 "../../arch/avr/dev/ide.c"
static int GetDeviceInfo(LPDRIVE pDrive, BYTE * pSectorBuffer)
{
    WORD i;
    int nError;
    BYTE bStatus;
    BYTE bErrorReg;
    BYTE bDevice;
    IDEDEVICEINFO *pInfo;

    nError = 0x01;
    bDevice = pDrive->bDevice;

    if (SelectDevice(bDevice) == 0x00) {

        ClearEvent(&hIDEEvent);
# 738 "../../arch/avr/dev/ide.c"
        pIDE[(0x0000 + 7)] = 0xEC;
        if (WaitForInterrupt(10000) == 0x00) {

            if (gbIntStatus & 0x08) {

                for (i = 0; i < 512; i = i + 2) {
                    pSectorBuffer[i] = pIDE[(0x0000 + 0x0300)];
                    if (pDrive->bIDEMode == 3) {
                        pSectorBuffer[i + 1] = pIDE[(0x0000 + 0x0300)];
                    } else {
                        pSectorBuffer[i + 1] = pIDE[(0x0000 + 0x0400)];
                    }
                }





                bStatus = pIDE[(0x0000 + 7)];

                pInfo = (IDEDEVICEINFO *) pSectorBuffer;
# 767 "../../arch/avr/dev/ide.c"
                if (pInfo->LBASectors > 0) {
                    pDrive->wFlags = 0x8000 | 0x0001;
                    pDrive->dwTotalSectors = pInfo->LBASectors;
                } else {
# 779 "../../arch/avr/dev/ide.c"
                }

                nError = 0x00;
            }

            if (gbIntStatus & 0x01) {
                bErrorReg = pIDE[(0x0000 + 1)];
            }
        }

    }

    return (nError);
}
# 803 "../../arch/avr/dev/ide.c"
static int IsPacketDevice(void)
{
    int nPacketDevice;
    BYTE bSectorCount;
    BYTE bSectorNumber;
    BYTE bCylinderLow;
    BYTE bCylinderHigh;

    nPacketDevice = 0;

    bSectorCount = pIDE[(0x0000 + 2)];
    bSectorNumber = pIDE[(0x0000 + 3)];
    bCylinderLow = pIDE[(0x0000 + 4)];
    bCylinderHigh = pIDE[(0x0000 + 5)];


    if ((bCylinderLow == 0x14) && (bCylinderHigh == 0xEB)) {
        nPacketDevice = 1;
    }

    return (nPacketDevice);
}
# 839 "../../arch/avr/dev/ide.c"
static int DeviceDiag(LPDRIVE pDrive)
{
    int nError;
    BYTE bResult;

    nError = 0x01;

    if (SelectDevice(0) == 0x00) {
# 856 "../../arch/avr/dev/ide.c"
        ClearEvent(&hIDEEvent);




        if (IsPacketDevice() == 1) {
            nError = 0x00;
            pDrive->wFlags = 0x0004;
        } else {

            pIDE[(0x0000 + 7)] = 0x90;
            if (WaitForInterrupt(10000) == 0x00) {

                bResult = pIDE[(0x0000 + 1)];
                if (bResult == 0x01) {
                    nError = 0x00;
                }

            }
        }
    }

    return (nError);
}
# 888 "../../arch/avr/dev/ide.c"
static int ReadSectors(BYTE bDevice, BYTE * pData, DWORD dwStartSector, WORD wSectorCount)
{
    WORD i, x;
    int nError;
    BYTE bValue;
    BYTE bErrorReg;
    BYTE bStatus;
    LPDRIVE pDrive;







    pDrive = &sDrive[bDevice];
    nError = SelectDevice(bDevice);





    if ((pDrive->wFlags & 0x0001) == 0) {



        nError = 0x01;
    }


    if (nError == 0x00) {

        ClearEvent(&hIDEEvent);

        if (pDrive->wFlags & 0x0001) {



            bValue = (BYTE) ((bDevice << 4) | 0xE0 | (dwStartSector >> 24));
            pIDE[(0x0000 + 6)] = bValue;
            pIDE[(0x0000 + 5)] = (BYTE) (dwStartSector >> 16);
            pIDE[(0x0000 + 4)] = (BYTE) (dwStartSector >> 8);
            pIDE[(0x0000 + 3)] = (BYTE) (dwStartSector);

            pIDE[(0x0000 + 2)] = (BYTE) (wSectorCount & 0xff);
            pIDE[(0x0000 + 7)] = 0x20;
# 955 "../../arch/avr/dev/ide.c"
        }

        for (i = 0; i < wSectorCount; i++) {
            nError = WaitForInterrupt(10000);
            if (nError == 0x00) {
                bStatus = gbIntStatus;

                if (bStatus & 0x01) {
                    bErrorReg = pIDE[(0x0000 + 1)];
                    nError = 0x01;
                    break;
                }

                for (x = 0; x < 512; x = x + 2) {
                    pData[x] = pIDE[(0x0000 + 0x0300)];
                    if (pDrive->bIDEMode == 3) {
                        pData[x + 1] = pIDE[(0x0000 + 0x0300)];
                    } else {
                        pData[x + 1] = pIDE[(0x0000 + 0x0400)];
                    }
                }

                pData += 512;

            } else {
                bStatus = pIDE[(0x0000 + 7)];
                bErrorReg = pIDE[(0x0000 + 1)];
            }
        }

        bStatus = pIDE[(0x0000 + 7)];

    }

    return (nError);
}
# 1120 "../../arch/avr/dev/ide.c"
void CFChange(void *arg) __attribute__ ((noreturn)); void CFChange(void *arg)
{
    BYTE bNewStatus;
    BYTE *pSectorBuffer;

    while (1) {

        NutEventWaitNext(&hCFChangeInt, 0);



        NutSleep(2000);

        bNewStatus = ((*(volatile unsigned char *)((0x01) + 0x20)) & (1 << (6)));
        if (bNewStatus != gbCFMountStatus) {

            if (bNewStatus == 0) {
                gbCFMountStatus = 0;



                HardwareReset(&sDrive[0]);

                pSectorBuffer = (BYTE *) NutHeapAlloc(512);
                if (pSectorBuffer != ((void *)0)) {
                    IDEMountDevice(0, pSectorBuffer);
                    NutHeapFree(pSectorBuffer);

                    if (pUserMountFunc != ((void *)0)) {
                        pUserMountFunc(0);
                    }
                }

                asm volatile( "in  __tmp_reg__, __SREG__" "\n\t" "cli" "\n\t" "push __tmp_reg__" "\n\t" );;
                (*(volatile unsigned char *)((0x3A) + 0x20)) &= ~0x30;
                (*(volatile unsigned char *)((0x3A) + 0x20)) |= 0x30;
                asm volatile( "pop __tmp_reg__" "\n\t" "out __SREG__, __tmp_reg__" "\n\t" );

            } else {
                gbCFMountStatus = 1;




                IDEUnMountDevice(0);

                if (pUserUnMountFunc != ((void *)0)) {
                    pUserUnMountFunc(0);
                }

                asm volatile( "in  __tmp_reg__, __SREG__" "\n\t" "cli" "\n\t" "push __tmp_reg__" "\n\t" );;
                (*(volatile unsigned char *)((0x3A) + 0x20)) &= ~0x30;
                (*(volatile unsigned char *)((0x3A) + 0x20)) |= 0x20;
                asm volatile( "pop __tmp_reg__" "\n\t" "out __SREG__, __tmp_reg__" "\n\t" );
            }
        }
    }
}







int IDEInit(int nBaseAddress, int nIDEMode, IDE_MOUNT_FUNC * pMountFunc, IDE_MOUNT_FUNC * pUnMountFunc)
{
    int i;
    int nError;
    BYTE bValue;

    pUserMountFunc = pMountFunc;
    pUserUnMountFunc = pUnMountFunc;




    if (nBaseAddress == 0) {
        nBaseAddress = 0xE000;
    }
# 1208 "../../arch/avr/dev/ide.c"
    (*(volatile unsigned char *)(0x6D)) = (1 << (1));





    (*(volatile unsigned char *)((0x11) + 0x20)) = 0x20;


    for (i = 0; i < 1; i++) {
        memset((BYTE *) & sDrive[i], 0x00, sizeof(DRIVE));

        sDrive[i].bDevice = (BYTE) i;
        sDrive[i].bIDEMode = (BYTE) nIDEMode;
    }

    IDESemaInit();

    pIDE = (unsigned char *) nBaseAddress;

    ClearEvent(&hIDEEvent);

    asm volatile( "in  __tmp_reg__, __SREG__" "\n\t" "cli" "\n\t" "push __tmp_reg__" "\n\t" );;




    gbIntStatus = 0;




    nError = NutRegisterIrqHandler(&sig_INTERRUPT7, IDEInterrupt, ((void *)0));
    if (nError == 0) {
        (*(volatile unsigned char *)((0x3A) + 0x20)) |= 0xC0;
        ((*(volatile unsigned char *)(((unsigned int) &((*(volatile unsigned char *)((0x39) + 0x20)))))) |= (1 << (7)));
    }

    switch (nIDEMode) {
    case 0:{
            break;
        }
# 1258 "../../arch/avr/dev/ide.c"
    case 1:{




            (*(volatile unsigned char *)((0x3C) + 0x20)) = 0xff;

            break;
        }
    case 2:{
            break;
        }
    case 3:{
# 1280 "../../arch/avr/dev/ide.c"
            (*(volatile unsigned char *)((0x3A) + 0x20)) &= ~0x30;




            bValue = ((*(volatile unsigned char *)((0x01) + 0x20)) & (1 << (6)));
            if (bValue == 0) {
                gbCFMountStatus = 0;





                (*(volatile unsigned char *)((0x3A) + 0x20)) |= 0x30;
            } else {
                gbCFMountStatus = 1;





                (*(volatile unsigned char *)((0x3A) + 0x20)) |= 0x20;
            }

            nError = NutRegisterIrqHandler(&sig_INTERRUPT6, CFInterrupt, ((void *)0));
            if (nError == 0) {
                NutThreadCreate("cfchange", CFChange, ((void *)0), 640);
                ((*(volatile unsigned char *)(((unsigned int) &((*(volatile unsigned char *)((0x39) + 0x20)))))) |= (1 << (6)));
            }

            break;
        }
    }
    asm volatile( "pop __tmp_reg__" "\n\t" "out __SREG__, __tmp_reg__" "\n\t" );

    HardwareReset(&sDrive[0]);

    nError = 0x00;

    return (nError);
}




int IDEMountDevice(BYTE bDevice, BYTE * pSectorBuffer)
{
    int nError;
    LPDRIVE pDrive;

    pDrive = ((void *)0);

    IDELock();

    if (bDevice >= 1) {
        nError = 0x01;
    } else {
        pDrive = &sDrive[bDevice];

        pDrive->wFlags = 0;
# 1353 "../../arch/avr/dev/ide.c"
        pDrive->dwTotalSectors = 0;

        nError = DeviceDiag(pDrive);
        if (pDrive->wFlags & 0x0004) {

            pDrive->wSectorSize = 2048;
            nError = GetDeviceInfoPacket(pDrive, pSectorBuffer);
            if (pDrive->wFlags & 0x8000) {
                nError = 0x00;
            }

        } else {
            if (nError != 0x00) {



                nError = DeviceDiag(pDrive);
            }

            if (nError == 0x00) {
                pDrive->wSectorSize = 512;
                nError = GetDeviceInfo(pDrive, pSectorBuffer);
                if (pDrive->wFlags & 0x8000) {
                    nError = 0x00;
                }
            }
        }

    }

    IDEFree();

    return (nError);
}




int IDEGetSectorSize(BYTE bDevice)
{
    int nSectorSize;
    LPDRIVE pDrive;

    nSectorSize = 0;

    IDELock();

    if (bDevice >= 1) {
        nSectorSize = 0;
    } else {
        pDrive = &sDrive[bDevice];
        nSectorSize = pDrive->wSectorSize;
    }

    IDEFree();

    return (nSectorSize);
}




int IDEIsCDROMDevice(BYTE bDevice)
{
    int nIsCDROM;
    LPDRIVE pDrive;

    nIsCDROM = 0;

    IDELock();

    if (bDevice >= 1) {
        nIsCDROM = 0;
    } else {
        pDrive = &sDrive[bDevice];
        if ((pDrive->wFlags & 0x8000) && (pDrive->wFlags & 0x1000)) {
            nIsCDROM = 1;
        }
    }

    IDEFree();

    return (nIsCDROM);
}




int IDEIsZIPDevice(BYTE bDevice)
{
    int nIsZIP;
    LPDRIVE pDrive;

    nIsZIP = 0;

    IDELock();

    if (bDevice >= 1) {
        nIsZIP = 0;
    } else {
        pDrive = &sDrive[bDevice];
        if ((pDrive->wFlags & 0x8000) && (pDrive->wFlags & 0x2000)) {
            nIsZIP = 1;
        }
    }

    IDEFree();

    return (nIsZIP);
}




int IDEUnMountDevice(BYTE bDevice)
{
    int nError = 0;
    LPDRIVE pDrive;

    pDrive = ((void *)0);

    IDELock();

    if (bDevice >= 1) {
        nError = 0x01;
    } else {
        pDrive = &sDrive[bDevice];

        pDrive->wFlags = 0;
    }

    IDEFree();

    return (nError);
}




DWORD IDEGetTotalSectors(BYTE bDevice)
{
    DWORD dwTotalSectors;
    LPDRIVE pDrive;

    dwTotalSectors = 0;

    IDELock();

    if (bDevice >= 1) {
        dwTotalSectors = 0;
    } else {
        pDrive = &sDrive[bDevice];
        dwTotalSectors = pDrive->dwTotalSectors;

        dwTotalSectors -= 64;
    }

    IDEFree();

    return (dwTotalSectors);
}




int IDEReadSectors(BYTE bDevice, void *pData, DWORD dwStartSector, WORD wSectorCount)
{
    WORD i;
    int nError;
    WORD wReadCount;
    LPDRIVE pDrive = 0;
    BYTE *pByte;

    nError = 0x00;

    IDELock();

    if (bDevice >= 1) {
        nError = 0x02;
    } else {
        pDrive = &sDrive[bDevice];
        if ((pDrive->wFlags & 0x8000) == 0) {
            nError = 0x02;
        } else {
            if ((dwStartSector + wSectorCount) > pDrive->dwTotalSectors) {
                nError = 0x03;
            }
        }
    }

    if ((pDrive->wFlags & 0x0004) && ((wSectorCount > 1))) {




        nError = 0x03;
    }

    if ((pDrive->wFlags & 0x0004) && (nError == 0x00)) {




        { memset(aATAPICmd, 0x00, sizeof(aATAPICmd)); aATAPICmd[0] = 0xA8; };
        i = 5;
        while (dwStartSector) {
            aATAPICmd[i--] = (BYTE) dwStartSector;
            dwStartSector >>= 8;
        }



        aATAPICmd[9] = 1;
        nError = ATAPISendCommand(pDrive, pData, &i);
        if ((nError != 0x00) || (i != pDrive->wSectorSize)) {
            nError = 0x01;
        }



    } else {
        if (nError == 0x00) {
            pByte = (BYTE *) pData;
            while (wSectorCount > 0) {

                if (wSectorCount < 256) {
                    wReadCount = wSectorCount;
                } else {
                    wReadCount = 256;
                }

                nError = ReadSectors(bDevice, pByte, dwStartSector, wReadCount);
                if (nError != 0x00) {
                    break;
                }

                dwStartSector += wReadCount;
                wSectorCount -= wReadCount;
                pByte += (wReadCount * pDrive->wSectorSize);
            }
        }
    }

    IDEFree();

    return (nError);
}
# 1664 "../../arch/avr/dev/ide.c"
int IDEATAPISetCDSpeed(BYTE bDevice, WORD wSpeed)
{
    WORD i;
    int nError;
    LPDRIVE pDrive;

    nError = 0x00;
    pDrive = ((void *)0);

    if (bDevice >= 1) {
        nError = 0x02;
    } else {
        pDrive = &sDrive[bDevice];
        if ((pDrive->wFlags & 0x8000) == 0) {
            nError = 0x02;
        }
        if ((pDrive->wFlags & 0x0004) == 0) {
            nError = 0x08;
        }
    }

    if (nError == 0x00) {
        { memset(aATAPICmd, 0x00, sizeof(aATAPICmd)); aATAPICmd[0] = 0xBB; };
        aATAPICmd[2] = (BYTE) ((wSpeed >> 8) & 0x00FF);
        aATAPICmd[3] = (BYTE) (wSpeed & 0x00FF);
        nError = ATAPISendCommand(pDrive, ((void *)0), &i);
    }

    return (nError);
}
