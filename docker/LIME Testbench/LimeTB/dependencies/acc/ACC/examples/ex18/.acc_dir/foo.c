
struct JoinPoint { 
	void** (*fp) (struct JoinPoint *);
	void ** args;
	int argsCount;
	const char ** argsType;
	 void * (*arg)(int, struct JoinPoint *); 
	 const char * (*argType)(int , struct JoinPoint *); 
	void ** retValue;
	const char * retType;
	const char * funcName ;
	const char * targetName ;
	const char * fileName ;
	const char * kind ;
	void * excep_return ;
};

 struct __UTAC__EXCEPTION {
	void * jumpbuf ;
	unsigned long long int prtValue ;
	int pops;
	struct __UTAC__CFLOW_FUNC {
		int (*func)(int,int) ;
		int val ;
		struct __UTAC__CFLOW_FUNC * next; 
	} * cflowfuncs; 
}; 


# 1 "/home/kee/examples/ex18/foo.c" 
# 1 "<built-in>" 
# 1 "<command line>" 
# 1 "/home/kee/examples/ex18/foo.c" 
# 1 "/usr/include/stdio.h" 1 3 4
# 28 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 330 "/usr/include/features.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 348 "/usr/include/sys/cdefs.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 349 "/usr/include/sys/cdefs.h" 2 3 4
# 331 "/usr/include/features.h" 2 3 4
# 354 "/usr/include/features.h" 3 4
# 1 "/usr/include/gnu/stubs.h" 1 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 5 "/usr/include/gnu/stubs.h" 2 3 4
# 1 "/usr/include/gnu/stubs-32.h" 1 3 4
# 8 "/usr/include/gnu/stubs.h" 2 3 4
# 355 "/usr/include/features.h" 2 3 4
# 29 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/lib/gcc/i486-linux-gnu/4.1.3/include/stddef.h" 1 3 4
# 214 "/usr/lib/gcc/i486-linux-gnu/4.1.3/include/stddef.h" 3 4
typedef unsigned int size_t; 
# 35 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types.h" 1 3 4
# 28 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 31 "/usr/include/bits/types.h" 2 3 4
typedef unsigned char __u_char; 
#line 32 "/usr/include/bits/types.h"
typedef unsigned short int __u_short; 
#line 33 "/usr/include/bits/types.h"
typedef unsigned int __u_int; 
#line 34 "/usr/include/bits/types.h"
typedef unsigned long int __u_long; 
#line 37 "/usr/include/bits/types.h"
typedef signed char __int8_t; 
#line 38 "/usr/include/bits/types.h"
typedef unsigned char __uint8_t; 
#line 39 "/usr/include/bits/types.h"
typedef signed short int __int16_t; 
#line 40 "/usr/include/bits/types.h"
typedef unsigned short int __uint16_t; 
#line 41 "/usr/include/bits/types.h"
typedef signed int __int32_t; 
#line 42 "/usr/include/bits/types.h"
typedef unsigned int __uint32_t; 
#line 47 "/usr/include/bits/types.h"
 __extension__ typedef signed long long int __int64_t; 
#line 48 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long long int __uint64_t; 
#line 56 "/usr/include/bits/types.h"
 __extension__ typedef long long int __quad_t; 
#line 57 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long long int __u_quad_t; 
# 131 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/typesizes.h" 1 3 4
# 134 "/usr/include/bits/types.h" 2 3 4
 __extension__ typedef  __u_quad_t __dev_t; 
#line 135 "/usr/include/bits/types.h"
 __extension__ typedef unsigned int __uid_t; 
#line 136 "/usr/include/bits/types.h"
 __extension__ typedef unsigned int __gid_t; 
#line 137 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long int __ino_t; 
#line 138 "/usr/include/bits/types.h"
 __extension__ typedef  __u_quad_t __ino64_t; 
#line 139 "/usr/include/bits/types.h"
 __extension__ typedef unsigned int __mode_t; 
#line 140 "/usr/include/bits/types.h"
 __extension__ typedef unsigned int __nlink_t; 
#line 141 "/usr/include/bits/types.h"
 __extension__ typedef long int __off_t; 
#line 142 "/usr/include/bits/types.h"
 __extension__ typedef  __quad_t __off64_t; 
#line 143 "/usr/include/bits/types.h"
 __extension__ typedef int __pid_t; 
#line 144 "/usr/include/bits/types.h"
 __extension__ typedef struct {int __val[2]; 
}__fsid_t; 
#line 145 "/usr/include/bits/types.h"
 __extension__ typedef long int __clock_t; 
#line 146 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long int __rlim_t; 
#line 147 "/usr/include/bits/types.h"
 __extension__ typedef  __u_quad_t __rlim64_t; 
#line 148 "/usr/include/bits/types.h"
 __extension__ typedef unsigned int __id_t; 
#line 149 "/usr/include/bits/types.h"
 __extension__ typedef long int __time_t; 
#line 150 "/usr/include/bits/types.h"
 __extension__ typedef unsigned int __useconds_t; 
#line 151 "/usr/include/bits/types.h"
 __extension__ typedef long int __suseconds_t; 
#line 153 "/usr/include/bits/types.h"
 __extension__ typedef int __daddr_t; 
#line 154 "/usr/include/bits/types.h"
 __extension__ typedef long int __swblk_t; 
#line 155 "/usr/include/bits/types.h"
 __extension__ typedef int __key_t; 
#line 158 "/usr/include/bits/types.h"
 __extension__ typedef int __clockid_t; 
#line 161 "/usr/include/bits/types.h"
 __extension__ typedef void *__timer_t; 
#line 164 "/usr/include/bits/types.h"
 __extension__ typedef long int __blksize_t; 
#line 169 "/usr/include/bits/types.h"
 __extension__ typedef long int __blkcnt_t; 
#line 170 "/usr/include/bits/types.h"
 __extension__ typedef  __quad_t __blkcnt64_t; 
#line 173 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long int __fsblkcnt_t; 
#line 174 "/usr/include/bits/types.h"
 __extension__ typedef  __u_quad_t __fsblkcnt64_t; 
#line 177 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long int __fsfilcnt_t; 
#line 178 "/usr/include/bits/types.h"
 __extension__ typedef  __u_quad_t __fsfilcnt64_t; 
#line 180 "/usr/include/bits/types.h"
 __extension__ typedef int __ssize_t; 
#line 184 "/usr/include/bits/types.h"
typedef  __off64_t __loff_t; 
#line 185 "/usr/include/bits/types.h"
typedef  __quad_t *__qaddr_t; 
#line 186 "/usr/include/bits/types.h"
typedef char *__caddr_t; 
#line 189 "/usr/include/bits/types.h"
 __extension__ typedef int __intptr_t; 
#line 192 "/usr/include/bits/types.h"
 __extension__ typedef unsigned int __socklen_t; 
# 37 "/usr/include/stdio.h" 2 3 4
# 45 "/usr/include/stdio.h" 3 4
struct _IO_FILE ; 
#line 49 "/usr/include/stdio.h"
typedef struct _IO_FILE FILE; 
#line 65 "/usr/include/stdio.h"
typedef struct _IO_FILE __FILE; 
# 65 "/usr/include/stdio.h" 3 4
# 75 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 32 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/usr/lib/gcc/i486-linux-gnu/4.1.3/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4
# 1 "/usr/include/wchar.h" 1 3 4
# 90 "/usr/include/wchar.h" 3 4
typedef struct {int __count; union {unsigned int __wch; char __wchb[4]; 
}__value; 
}__mbstate_t; 
#line 26 "/usr/include/_G_config.h"
typedef struct { __off_t __pos;  __mbstate_t __state; 
}_G_fpos_t; 
#line 31 "/usr/include/_G_config.h"
typedef struct { __off64_t __pos;  __mbstate_t __state; 
}_G_fpos64_t; 
# 21 "/usr/include/_G_config.h" 2 3 4
# 53 "/usr/include/_G_config.h" 3 4
typedef int _G_int16_t __attribute__  (( __mode__ ( __HI__ )  )) ; 
#line 54 "/usr/include/_G_config.h"
typedef int _G_int32_t __attribute__  (( __mode__ ( __SI__ )  )) ; 
#line 55 "/usr/include/_G_config.h"
typedef unsigned int _G_uint16_t __attribute__  (( __mode__ ( __HI__ )  )) ; 
#line 56 "/usr/include/_G_config.h"
typedef unsigned int _G_uint32_t __attribute__  (( __mode__ ( __SI__ )  )) ; 
# 33 "/usr/include/libio.h" 2 3 4
# 53 "/usr/include/libio.h" 3 4
# 1 "/usr/lib/gcc/i486-linux-gnu/4.1.3/include/stdarg.h" 1 3 4
# 43 "/usr/lib/gcc/i486-linux-gnu/4.1.3/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list; 
# 54 "/usr/include/libio.h" 2 3 4
# 170 "/usr/include/libio.h" 3 4
struct _IO_jump_t ; 
#line 170 "/usr/include/libio.h"
struct _IO_FILE ; 
#line 180 "/usr/include/libio.h"
typedef void _IO_lock_t; 
# 180 "/usr/include/libio.h" 3 4
# 203 "/usr/include/libio.h" 3 4
struct _IO_marker {struct _IO_marker *_next; struct _IO_FILE *_sbuf; int _pos; 
}; 
#line 212 "/usr/include/libio.h"
enum __codecvt_result {__codecvt_ok,__codecvt_partial,__codecvt_error,__codecvt_noconv}; 
# 271 "/usr/include/libio.h" 3 4
# 319 "/usr/include/libio.h" 3 4
# 338 "/usr/include/libio.h" 3 4
struct _IO_FILE {int _flags; char *_IO_read_ptr; char *_IO_read_end; char *_IO_read_base; char *_IO_write_base; char *_IO_write_ptr; char *_IO_write_end; char *_IO_buf_base; char *_IO_buf_end; char *_IO_save_base; char *_IO_backup_base; char *_IO_save_end; struct _IO_marker *_markers; struct _IO_FILE *_chain; int _fileno; int _flags2;  __off_t _old_offset; unsigned short _cur_column; signed char _vtable_offset; char _shortbuf[1];  _IO_lock_t *_lock;  __off64_t _offset; void *__pad1; void *__pad2; void *__pad3; void *__pad4;  size_t __pad5; int _mode; char _unused2[15 * sizeof (int ) - 4 * sizeof (void *) - sizeof ( size_t )]; 
}; 
#line 341 "/usr/include/libio.h"
typedef struct _IO_FILE _IO_FILE; 
#line 344 "/usr/include/libio.h"
struct _IO_FILE_plus ; 
#line 346 "/usr/include/libio.h"
extern struct _IO_FILE_plus _IO_2_1_stdin_; 
#line 347 "/usr/include/libio.h"
extern struct _IO_FILE_plus _IO_2_1_stdout_; 
#line 348 "/usr/include/libio.h"
extern struct _IO_FILE_plus _IO_2_1_stderr_; 
#line 364 "/usr/include/libio.h"
typedef  __ssize_t __io_read_fn(void *__cookie, char *__buf,  size_t __nbytes); 
#line 373 "/usr/include/libio.h"
typedef  __ssize_t __io_write_fn(void *__cookie, __const char *__buf,  size_t __n); 
#line 381 "/usr/include/libio.h"
typedef int __io_seek_fn(void *__cookie,  __off64_t *__pos, int __w); 
#line 384 "/usr/include/libio.h"
typedef int __io_close_fn(void *__cookie); 
# 364 "/usr/include/libio.h" 3 4
# 416 "/usr/include/libio.h" 3 4
extern int __underflow( _IO_FILE *); 
#line 417 "/usr/include/libio.h"
extern int __uflow( _IO_FILE *); 
#line 418 "/usr/include/libio.h"
extern int __overflow( _IO_FILE *, int ); 
#line 458 "/usr/include/libio.h"
extern int _IO_getc( _IO_FILE *__fp); 
#line 459 "/usr/include/libio.h"
extern int _IO_putc(int __c,  _IO_FILE *__fp); 
#line 460 "/usr/include/libio.h"
extern int _IO_feof( _IO_FILE *__fp) __attribute__  (( __nothrow__ )) ; 
#line 461 "/usr/include/libio.h"
extern int _IO_ferror( _IO_FILE *__fp) __attribute__  (( __nothrow__ )) ; 
#line 463 "/usr/include/libio.h"
extern int _IO_peekc_locked( _IO_FILE *__fp); 
#line 469 "/usr/include/libio.h"
extern void _IO_flockfile( _IO_FILE *) __attribute__  (( __nothrow__ )) ; 
#line 470 "/usr/include/libio.h"
extern void _IO_funlockfile( _IO_FILE *) __attribute__  (( __nothrow__ )) ; 
#line 471 "/usr/include/libio.h"
extern int _IO_ftrylockfile( _IO_FILE *) __attribute__  (( __nothrow__ )) ; 
# 458 "/usr/include/libio.h" 3 4
# 489 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf( _IO_FILE *__restrict , const char *__restrict ,  __gnuc_va_list , int *__restrict ); 
#line 491 "/usr/include/libio.h"
extern int _IO_vfprintf( _IO_FILE *__restrict , const char *__restrict ,  __gnuc_va_list ); 
#line 492 "/usr/include/libio.h"
extern  __ssize_t _IO_padn( _IO_FILE *, int ,  __ssize_t ); 
#line 493 "/usr/include/libio.h"
extern  size_t _IO_sgetn( _IO_FILE *, void *,  size_t ); 
#line 495 "/usr/include/libio.h"
extern  __off64_t _IO_seekoff( _IO_FILE *,  __off64_t , int , int ); 
#line 496 "/usr/include/libio.h"
extern  __off64_t _IO_seekpos( _IO_FILE *,  __off64_t , int ); 
#line 498 "/usr/include/libio.h"
extern void _IO_free_backup_area( _IO_FILE *) __attribute__  (( __nothrow__ )) ; 
# 76 "/usr/include/stdio.h" 2 3 4
# 91 "/usr/include/stdio.h" 3 4
typedef  _G_fpos_t fpos_t; 
# 141 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/stdio_lim.h" 1 3 4
# 145 "/usr/include/stdio.h" 2 3 4
extern struct _IO_FILE *stdin; 
#line 146 "/usr/include/stdio.h"
extern struct _IO_FILE *stdout; 
#line 147 "/usr/include/stdio.h"
extern struct _IO_FILE *stderr; 
#line 155 "/usr/include/stdio.h"
extern int remove(__const char *__filename) __attribute__  (( __nothrow__ )) ; 
#line 157 "/usr/include/stdio.h"
extern int rename(__const char *__old, __const char *__new) __attribute__  (( __nothrow__ )) ; 
#line 172 "/usr/include/stdio.h"
extern  FILE *tmpfile(void ); 
#line 186 "/usr/include/stdio.h"
extern char *tmpnam(char *__s) __attribute__  (( __nothrow__ )) ; 
#line 192 "/usr/include/stdio.h"
extern char *tmpnam_r(char *__s) __attribute__  (( __nothrow__ )) ; 
# 186 "/usr/include/stdio.h" 3 4
# 205 "/usr/include/stdio.h" 3 4
extern char *tempnam(__const char *__dir, __const char *__pfx) __attribute__  (( __nothrow__ ))  __attribute__  (( __malloc__ )) ; 
#line 214 "/usr/include/stdio.h"
extern int fclose( FILE *__stream); 
#line 219 "/usr/include/stdio.h"
extern int fflush( FILE *__stream); 
#line 229 "/usr/include/stdio.h"
extern int fflush_unlocked( FILE *__stream); 
# 229 "/usr/include/stdio.h" 3 4
# 250 "/usr/include/stdio.h" 3 4
extern  FILE *fopen(__const char *__restrict __filename, __const char *__restrict __modes); 
#line 257 "/usr/include/stdio.h"
extern  FILE *freopen(__const char *__restrict __filename, __const char *__restrict __modes,  FILE *__restrict __stream); 
# 272 "/usr/include/stdio.h" 3 4
# 283 "/usr/include/stdio.h" 3 4
extern  FILE *fdopen(int __fd, __const char *__modes) __attribute__  (( __nothrow__ )) ; 
#line 307 "/usr/include/stdio.h"
extern void setbuf( FILE *__restrict __stream, char *__restrict __buf) __attribute__  (( __nothrow__ )) ; 
#line 312 "/usr/include/stdio.h"
extern int setvbuf( FILE *__restrict __stream, char *__restrict __buf, int __modes,  size_t __n) __attribute__  (( __nothrow__ )) ; 
#line 319 "/usr/include/stdio.h"
extern void setbuffer( FILE *__restrict __stream, char *__restrict __buf,  size_t __size) __attribute__  (( __nothrow__ )) ; 
#line 322 "/usr/include/stdio.h"
extern void setlinebuf( FILE *__stream) __attribute__  (( __nothrow__ )) ; 
#line 332 "/usr/include/stdio.h"
extern int fprintf( FILE *__restrict __stream, __const char *__restrict __format, ...); 
#line 337 "/usr/include/stdio.h"
extern int printf(__const char *__restrict __format, ...); 
#line 340 "/usr/include/stdio.h"
extern int sprintf(char *__restrict __s, __const char *__restrict __format, ...) __attribute__  (( __nothrow__ )) ; 
#line 347 "/usr/include/stdio.h"
extern int vfprintf( FILE *__restrict __s, __const char *__restrict __format,  __gnuc_va_list __arg); 
#line 352 "/usr/include/stdio.h"
extern int vprintf(__const char *__restrict __format,  __gnuc_va_list __arg); 
#line 355 "/usr/include/stdio.h"
extern int vsprintf(char *__restrict __s, __const char *__restrict __format,  __gnuc_va_list __arg) __attribute__  (( __nothrow__ )) ; 
#line 363 "/usr/include/stdio.h"
extern int snprintf(char *__restrict __s,  size_t __maxlen, __const char *__restrict __format, ...) __attribute__  (( __nothrow__ ))  __attribute__  (( __format__ ( __printf__, 3, 4 )  )) ; 
#line 367 "/usr/include/stdio.h"
extern int vsnprintf(char *__restrict __s,  size_t __maxlen, __const char *__restrict __format,  __gnuc_va_list __arg) __attribute__  (( __nothrow__ ))  __attribute__  (( __format__ ( __printf__, 3, 0 )  )) ; 
# 304 "/usr/include/stdio.h" 3 4
# 404 "/usr/include/stdio.h" 3 4
extern int fscanf( FILE *__restrict __stream, __const char *__restrict __format, ...); 
#line 409 "/usr/include/stdio.h"
extern int scanf(__const char *__restrict __format, ...); 
#line 412 "/usr/include/stdio.h"
extern int sscanf(__const char *__restrict __s, __const char *__restrict __format, ...) __attribute__  (( __nothrow__ )) ; 
# 441 "/usr/include/stdio.h" 3 4
# 509 "/usr/include/stdio.h" 3 4
extern int fgetc( FILE *__stream); 
#line 510 "/usr/include/stdio.h"
extern int getc( FILE *__stream); 
#line 516 "/usr/include/stdio.h"
extern int getchar(void ); 
#line 528 "/usr/include/stdio.h"
extern int getc_unlocked( FILE *__stream); 
#line 529 "/usr/include/stdio.h"
extern int getchar_unlocked(void ); 
# 528 "/usr/include/stdio.h" 3 4
# 539 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked( FILE *__stream); 
#line 551 "/usr/include/stdio.h"
extern int fputc(int __c,  FILE *__stream); 
#line 552 "/usr/include/stdio.h"
extern int putc(int __c,  FILE *__stream); 
#line 558 "/usr/include/stdio.h"
extern int putchar(int __c); 
#line 572 "/usr/include/stdio.h"
extern int fputc_unlocked(int __c,  FILE *__stream); 
#line 580 "/usr/include/stdio.h"
extern int putc_unlocked(int __c,  FILE *__stream); 
#line 581 "/usr/include/stdio.h"
extern int putchar_unlocked(int __c); 
#line 588 "/usr/include/stdio.h"
extern int getw( FILE *__stream); 
#line 591 "/usr/include/stdio.h"
extern int putw(int __w,  FILE *__stream); 
#line 601 "/usr/include/stdio.h"
extern char *fgets(char *__restrict __s, int __n,  FILE *__restrict __stream); 
#line 608 "/usr/include/stdio.h"
extern char *gets(char *__s); 
# 572 "/usr/include/stdio.h" 3 4
# 658 "/usr/include/stdio.h" 3 4
extern int fputs(__const char *__restrict __s,  FILE *__restrict __stream); 
#line 664 "/usr/include/stdio.h"
extern int puts(__const char *__s); 
#line 671 "/usr/include/stdio.h"
extern int ungetc(int __c,  FILE *__stream); 
#line 679 "/usr/include/stdio.h"
extern  size_t fread(void *__restrict __ptr,  size_t __size,  size_t __n,  FILE *__restrict __stream); 
#line 685 "/usr/include/stdio.h"
extern  size_t fwrite(__const void *__restrict __ptr,  size_t __size,  size_t __n,  FILE *__restrict __s); 
#line 707 "/usr/include/stdio.h"
extern  size_t fread_unlocked(void *__restrict __ptr,  size_t __size,  size_t __n,  FILE *__restrict __stream); 
#line 709 "/usr/include/stdio.h"
extern  size_t fwrite_unlocked(__const void *__restrict __ptr,  size_t __size,  size_t __n,  FILE *__restrict __stream); 
#line 718 "/usr/include/stdio.h"
extern int fseek( FILE *__stream, long int __off, int __whence); 
#line 723 "/usr/include/stdio.h"
extern long int ftell( FILE *__stream); 
#line 728 "/usr/include/stdio.h"
extern void rewind( FILE *__stream); 
# 706 "/usr/include/stdio.h" 3 4
# 742 "/usr/include/stdio.h" 3 4
extern int fseeko( FILE *__stream,  __off_t __off, int __whence); 
#line 747 "/usr/include/stdio.h"
extern  __off_t ftello( FILE *__stream); 
#line 767 "/usr/include/stdio.h"
extern int fgetpos( FILE *__restrict __stream,  fpos_t *__restrict __pos); 
#line 772 "/usr/include/stdio.h"
extern int fsetpos( FILE *__stream, __const  fpos_t *__pos); 
# 761 "/usr/include/stdio.h" 3 4
# 784 "/usr/include/stdio.h" 3 4
# 795 "/usr/include/stdio.h" 3 4
extern void clearerr( FILE *__stream) __attribute__  (( __nothrow__ )) ; 
#line 797 "/usr/include/stdio.h"
extern int feof( FILE *__stream) __attribute__  (( __nothrow__ )) ; 
#line 799 "/usr/include/stdio.h"
extern int ferror( FILE *__stream) __attribute__  (( __nothrow__ )) ; 
#line 804 "/usr/include/stdio.h"
extern void clearerr_unlocked( FILE *__stream) __attribute__  (( __nothrow__ )) ; 
#line 805 "/usr/include/stdio.h"
extern int feof_unlocked( FILE *__stream) __attribute__  (( __nothrow__ )) ; 
#line 806 "/usr/include/stdio.h"
extern int ferror_unlocked( FILE *__stream) __attribute__  (( __nothrow__ )) ; 
#line 815 "/usr/include/stdio.h"
extern void perror(__const char *__s); 
# 1 "/usr/include/bits/sys_errlist.h" 1 3 4
# 27 "/usr/include/bits/sys_errlist.h" 3 4
extern int sys_nerr; 
#line 28 "/usr/include/bits/sys_errlist.h"
extern __const char *__const sys_errlist[]; 
#line 827 "/usr/include/stdio.h"
extern int fileno( FILE *__stream) __attribute__  (( __nothrow__ )) ; 
#line 832 "/usr/include/stdio.h"
extern int fileno_unlocked( FILE *__stream) __attribute__  (( __nothrow__ )) ; 
# 823 "/usr/include/stdio.h" 2 3 4
# 842 "/usr/include/stdio.h" 3 4
extern  FILE *popen(__const char *__command, __const char *__modes); 
#line 848 "/usr/include/stdio.h"
extern int pclose( FILE *__stream); 
#line 854 "/usr/include/stdio.h"
extern char *ctermid(char *__s) __attribute__  (( __nothrow__ )) ; 
#line 882 "/usr/include/stdio.h"
extern void flockfile( FILE *__stream) __attribute__  (( __nothrow__ )) ; 
#line 886 "/usr/include/stdio.h"
extern int ftrylockfile( FILE *__stream) __attribute__  (( __nothrow__ )) ; 
#line 889 "/usr/include/stdio.h"
extern void funlockfile( FILE *__stream) __attribute__  (( __nothrow__ )) ; 
# 882 "/usr/include/stdio.h" 3 4
# 912 "/usr/include/stdio.h" 3 4
# 3 "/home/kee/examples/ex18/foo.c" 2
char *foo(int a)  
# 451 "/home/kee/examples/ex18/.acc_dir/foo.c"
{
# 453 "/home/kee/examples/ex18/.acc_dir/foo.c"
char* retValue_acc;




# 459 "/home/kee/examples/ex18/.acc_dir/foo.c"
{

#line 4 "/home/kee/examples/ex18/foo.c"

# 464 "/home/kee/examples/ex18/.acc_dir/foo.c"
retValue_acc = "just a test ";
# 466 "/home/kee/examples/ex18/.acc_dir/foo.c"
return (char* )retValue_acc;
 
# 469 "/home/kee/examples/ex18/.acc_dir/foo.c"

}

# 473 "/home/kee/examples/ex18/.acc_dir/foo.c"
return (char* )retValue_acc;

# 476 "/home/kee/examples/ex18/.acc_dir/foo.c"

}
 
static inline char*  foo__foo__0 (int a  )  ; 

#line 7 "/home/kee/examples/ex18/foo.c"
void foo2(int a, double b)  
# 484 "/home/kee/examples/ex18/.acc_dir/foo.c"
{



# 489 "/home/kee/examples/ex18/.acc_dir/foo.c"
{

#line 8 "/home/kee/examples/ex18/foo.c"
foo__foo__0(3); 
# 494 "/home/kee/examples/ex18/.acc_dir/foo.c"

}

# 498 "/home/kee/examples/ex18/.acc_dir/foo.c"

}
  void __utac_acc__fooac_ac__1 (  struct JoinPoint * );

  char* foo (int a  ) ; 

# 505 "/home/kee/examples/ex18/.acc_dir/foo.c"
static inline char*  foo__foo__0 (int a  ) {

# 508 "/home/kee/examples/ex18/.acc_dir/foo.c"
char* retValue_acc;
 { 
 struct JoinPoint this; 
int* __utac__arg0 = &a; 
const char * __utac__argtype0 = "int"; 
 void * __utac__args[1]; 
 const char * __utac__argstype[1];
this.argsCount = 1 ; 
 void * __utac__retp[1]; 
char* __utac__ret ;
__utac__args[0] = (void*)(__utac__arg0);
__utac__argstype[0] = __utac__argtype0;
*__utac__retp  = (void *)(&__utac__ret);
this.args = __utac__args; 
this.argsType = __utac__argstype; 
{ extern void * __utac__get_this_arg (int, struct JoinPoint *)  ; 
  extern const char * __utac__get_this_argtype (int, struct JoinPoint *)  ; 
this.arg = __utac__get_this_arg ; 
this.argType= __utac__get_this_argtype ; } 
this.retValue = __utac__retp ; 
this.retType ="char*" ; 
this.funcName = "foo2"; 
this.targetName = "foo"; 
this.fileName = "/home/kee/examples/ex18/foo.c"; 
this.kind = "call"; 
 { 
__utac_acc__fooac_ac__1(&this );
 
 } 
 } 

# 540 "/home/kee/examples/ex18/.acc_dir/foo.c"
retValue_acc = foo ( a ) ;  

# 543 "/home/kee/examples/ex18/.acc_dir/foo.c"
return (char* )retValue_acc;
}
 
static inline void  foo2__foo__1 (int a ,double b  )  ; 

#line 11 "/home/kee/examples/ex18/foo.c"
void foo3()  
# 551 "/home/kee/examples/ex18/.acc_dir/foo.c"
{



# 556 "/home/kee/examples/ex18/.acc_dir/foo.c"
{

#line 12 "/home/kee/examples/ex18/foo.c"
foo2__foo__1(5, 2.2); 
# 561 "/home/kee/examples/ex18/.acc_dir/foo.c"

}

# 565 "/home/kee/examples/ex18/.acc_dir/foo.c"

}
  void __utac_acc__fooac_ac__1 (  struct JoinPoint * );

  void foo2 (int a ,double b  ) ; 

# 572 "/home/kee/examples/ex18/.acc_dir/foo.c"
static inline void  foo2__foo__1 (int a ,double b  ) {
 { 
 struct JoinPoint this; 
int* __utac__arg0 = &a; 
const char * __utac__argtype0 = "int"; 
double* __utac__arg1 = &b; 
const char * __utac__argtype1 = "double"; 
 void * __utac__args[2]; 
 const char * __utac__argstype[2];
this.argsCount = 2 ; 
 void * __utac__retp[1]; 
__utac__args[0] = (void*)(__utac__arg0);
__utac__argstype[0] = __utac__argtype0;
__utac__args[1] = (void*)(__utac__arg1);
__utac__argstype[1] = __utac__argtype1;
this.args = __utac__args; 
this.argsType = __utac__argstype; 
{ extern void * __utac__get_this_arg (int, struct JoinPoint *)  ; 
  extern const char * __utac__get_this_argtype (int, struct JoinPoint *)  ; 
this.arg = __utac__get_this_arg ; 
this.argType= __utac__get_this_argtype ; } 
this.retValue = __utac__retp ; 
this.retType ="void" ; 
this.funcName = "foo3"; 
this.targetName = "foo2"; 
this.fileName = "/home/kee/examples/ex18/foo.c"; 
this.kind = "call"; 
 { 
__utac_acc__fooac_ac__1(&this );
 
 } 
 } 
foo2 ( a , b ) ;  
}
 
static inline void  foo3__foo__2 (void)  ; 

#line 15 "/home/kee/examples/ex18/foo.c"
int main()  
# 612 "/home/kee/examples/ex18/.acc_dir/foo.c"
{
# 614 "/home/kee/examples/ex18/.acc_dir/foo.c"
int retValue_acc;




# 620 "/home/kee/examples/ex18/.acc_dir/foo.c"
{

#line 16 "/home/kee/examples/ex18/foo.c"
foo3__foo__2(); 
# 625 "/home/kee/examples/ex18/.acc_dir/foo.c"

}

# 629 "/home/kee/examples/ex18/.acc_dir/foo.c"
return (int )retValue_acc;

# 632 "/home/kee/examples/ex18/.acc_dir/foo.c"

}
  void __utac_acc__fooac_ac__1 (  struct JoinPoint * );

  void foo3 () ; 

# 639 "/home/kee/examples/ex18/.acc_dir/foo.c"
static inline void  foo3__foo__2 (void) {
 { 
 struct JoinPoint this; 
 void * __utac__args[0]; 
 const char * __utac__argstype[0];
this.argsCount = 0 ; 
 void * __utac__retp[1]; 
this.args = __utac__args; 
this.argsType = __utac__argstype; 
{ extern void * __utac__get_this_arg (int, struct JoinPoint *)  ; 
  extern const char * __utac__get_this_argtype (int, struct JoinPoint *)  ; 
this.arg = __utac__get_this_arg ; 
this.argType= __utac__get_this_argtype ; } 
this.retValue = __utac__retp ; 
this.retType ="void" ; 
this.funcName = "main"; 
this.targetName = "foo3"; 
this.fileName = "/home/kee/examples/ex18/foo.c"; 
this.kind = "call"; 
 { 
__utac_acc__fooac_ac__1(&this );
 
 } 
 } 
foo3 ( ) ;  
}
 
