
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

extern void __utac__exception__cf_handler_set(void * exception, int (*cflow_func)(int, int), int val) ; 
extern void __utac__exception__cf_handler_free(void * exception);
extern void __utac__exception__cf_handler_reset(void * exception) ; 
extern void * __utac__error_stack_mgt(void * env , int mode, int count) ;

# 1 "t6ac_acc.c" 
# 1 "<built-in>" 
# 1 "<command line>" 
# 1 "t6ac_acc.c" 
# 1 "/usr/include/stdio.h" 1 3 4
# 28 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 295 "/usr/include/features.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 296 "/usr/include/features.h" 2 3 4
# 318 "/usr/include/features.h" 3 4
# 1 "/usr/include/gnu/stubs.h" 1 3 4
# 319 "/usr/include/features.h" 2 3 4
# 29 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/local/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stddef.h" 1 3 4
# 214 "/usr/local/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stddef.h" 3 4
typedef unsigned int size_t; 
# 35 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types.h" 1 3 4
# 28 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 29 "/usr/include/bits/types.h" 2 3 4
# 1 "/usr/local/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stddef.h" 1 3 4
# 34 "/usr/include/bits/types.h" 2 3 4
typedef unsigned char __u_char; 
#line 35 "/usr/include/bits/types.h"
typedef unsigned short int __u_short; 
#line 36 "/usr/include/bits/types.h"
typedef unsigned int __u_int; 
#line 37 "/usr/include/bits/types.h"
typedef unsigned long int __u_long; 
#line 40 "/usr/include/bits/types.h"
typedef signed char __int8_t; 
#line 41 "/usr/include/bits/types.h"
typedef unsigned char __uint8_t; 
#line 42 "/usr/include/bits/types.h"
typedef signed short int __int16_t; 
#line 43 "/usr/include/bits/types.h"
typedef unsigned short int __uint16_t; 
#line 44 "/usr/include/bits/types.h"
typedef signed int __int32_t; 
#line 45 "/usr/include/bits/types.h"
typedef unsigned int __uint32_t; 
#line 50 "/usr/include/bits/types.h"
 __extension__ typedef signed long long int __int64_t; 
#line 51 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long long int __uint64_t; 
#line 59 "/usr/include/bits/types.h"
 __extension__ typedef long long int __quad_t; 
#line 60 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long long int __u_quad_t; 
# 129 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/typesizes.h" 1 3 4
# 136 "/usr/include/bits/types.h" 2 3 4
 __extension__ typedef unsigned long long int __dev_t; 
#line 137 "/usr/include/bits/types.h"
 __extension__ typedef unsigned int __uid_t; 
#line 138 "/usr/include/bits/types.h"
 __extension__ typedef unsigned int __gid_t; 
#line 139 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long int __ino_t; 
#line 140 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long long int __ino64_t; 
#line 141 "/usr/include/bits/types.h"
 __extension__ typedef unsigned int __mode_t; 
#line 142 "/usr/include/bits/types.h"
 __extension__ typedef unsigned int __nlink_t; 
#line 143 "/usr/include/bits/types.h"
 __extension__ typedef long int __off_t; 
#line 144 "/usr/include/bits/types.h"
 __extension__ typedef long long int __off64_t; 
#line 145 "/usr/include/bits/types.h"
 __extension__ typedef int __pid_t; 
#line 146 "/usr/include/bits/types.h"
 __extension__ typedef struct {int __val[2]; 
}__fsid_t; 
#line 147 "/usr/include/bits/types.h"
 __extension__ typedef long int __clock_t; 
#line 148 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long int __rlim_t; 
#line 149 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long long int __rlim64_t; 
#line 150 "/usr/include/bits/types.h"
 __extension__ typedef unsigned int __id_t; 
#line 151 "/usr/include/bits/types.h"
 __extension__ typedef long int __time_t; 
#line 152 "/usr/include/bits/types.h"
 __extension__ typedef unsigned int __useconds_t; 
#line 153 "/usr/include/bits/types.h"
 __extension__ typedef long int __suseconds_t; 
#line 155 "/usr/include/bits/types.h"
 __extension__ typedef int __daddr_t; 
#line 156 "/usr/include/bits/types.h"
 __extension__ typedef long int __swblk_t; 
#line 157 "/usr/include/bits/types.h"
 __extension__ typedef int __key_t; 
#line 160 "/usr/include/bits/types.h"
 __extension__ typedef int __clockid_t; 
#line 163 "/usr/include/bits/types.h"
 __extension__ typedef int __timer_t; 
#line 166 "/usr/include/bits/types.h"
 __extension__ typedef long int __blksize_t; 
#line 171 "/usr/include/bits/types.h"
 __extension__ typedef long int __blkcnt_t; 
#line 172 "/usr/include/bits/types.h"
 __extension__ typedef long long int __blkcnt64_t; 
#line 175 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long int __fsblkcnt_t; 
#line 176 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long long int __fsblkcnt64_t; 
#line 179 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long int __fsfilcnt_t; 
#line 180 "/usr/include/bits/types.h"
 __extension__ typedef unsigned long long int __fsfilcnt64_t; 
#line 182 "/usr/include/bits/types.h"
 __extension__ typedef int __ssize_t; 
#line 186 "/usr/include/bits/types.h"
typedef  __off64_t __loff_t; 
#line 187 "/usr/include/bits/types.h"
typedef  __quad_t *__qaddr_t; 
#line 188 "/usr/include/bits/types.h"
typedef char *__caddr_t; 
#line 191 "/usr/include/bits/types.h"
 __extension__ typedef int __intptr_t; 
#line 194 "/usr/include/bits/types.h"
 __extension__ typedef unsigned int __socklen_t; 
#line 46 "/usr/include/stdio.h"
typedef struct _IO_FILE FILE; 
# 37 "/usr/include/stdio.h" 2 3 4
# 62 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE; 
# 72 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 32 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 14 "/usr/include/_G_config.h" 3 4
# 1 "/usr/local/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stddef.h" 1 3 4
# 326 "/usr/local/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stddef.h" 3 4
typedef long int wchar_t; 
#line 355 "/usr/local/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stddef.h"
typedef unsigned int wint_t; 
# 355 "/usr/local/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stddef.h" 3 4
# 15 "/usr/include/_G_config.h" 2 3 4
# 24 "/usr/include/_G_config.h" 3 4
# 1 "/usr/include/wchar.h" 1 3 4
# 48 "/usr/include/wchar.h" 3 4
# 1 "/usr/local/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stddef.h" 1 3 4
# 49 "/usr/include/wchar.h" 2 3 4
# 1 "/usr/include/bits/wchar.h" 1 3 4
# 51 "/usr/include/wchar.h" 2 3 4
# 84 "/usr/include/wchar.h" 3 4
typedef struct {int __count; union { wint_t __wch; char __wchb[4]; 
}__value; 
}__mbstate_t; 
#line 30 "/usr/include/_G_config.h"
typedef struct { __off_t __pos;  __mbstate_t __state; 
}_G_fpos_t; 
#line 35 "/usr/include/_G_config.h"
typedef struct { __off64_t __pos;  __mbstate_t __state; 
}_G_fpos64_t; 
# 25 "/usr/include/_G_config.h" 2 3 4
# 44 "/usr/include/_G_config.h" 3 4
# 1 "/usr/include/gconv.h" 1 3 4
# 28 "/usr/include/gconv.h" 3 4
# 1 "/usr/include/wchar.h" 1 3 4
# 48 "/usr/include/wchar.h" 3 4
# 1 "/usr/local/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stddef.h" 1 3 4
# 49 "/usr/include/wchar.h" 2 3 4
# 29 "/usr/include/gconv.h" 2 3 4
# 1 "/usr/local/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stddef.h" 1 3 4
# 51 "/usr/include/gconv.h" 2 3 4
enum {__GCONV_OK=0,__GCONV_NOCONV,__GCONV_NODB,__GCONV_NOMEM,__GCONV_EMPTY_INPUT,__GCONV_FULL_OUTPUT,__GCONV_ILLEGAL_INPUT,__GCONV_INCOMPLETE_INPUT,__GCONV_ILLEGAL_DESCRIPTOR,__GCONV_INTERNAL_ERROR}; 
#line 59 "/usr/include/gconv.h"
enum {__GCONV_IS_LAST=0x0001,__GCONV_IGNORE_ERRORS=0x0002}; 
#line 63 "/usr/include/gconv.h"
struct __gconv_step ; 
#line 64 "/usr/include/gconv.h"
struct __gconv_step_data ; 
#line 65 "/usr/include/gconv.h"
struct __gconv_loaded_object ; 
#line 66 "/usr/include/gconv.h"
struct __gconv_trans_data ; 
#line 72 "/usr/include/gconv.h"
typedef int (*__gconv_fct)(struct __gconv_step *, struct __gconv_step_data *, __const unsigned char **, __const unsigned char *, unsigned char **,  size_t *, int , int ); 
#line 75 "/usr/include/gconv.h"
typedef  wint_t (*__gconv_btowc_fct)(struct __gconv_step *, unsigned char ); 
#line 78 "/usr/include/gconv.h"
typedef int (*__gconv_init_fct)(struct __gconv_step *); 
#line 79 "/usr/include/gconv.h"
typedef void (*__gconv_end_fct)(struct __gconv_step *); 
#line 88 "/usr/include/gconv.h"
typedef int (*__gconv_trans_fct)(struct __gconv_step *, struct __gconv_step_data *, void *, __const unsigned char *, __const unsigned char **, __const unsigned char *, unsigned char **,  size_t *); 
#line 93 "/usr/include/gconv.h"
typedef int (*__gconv_trans_context_fct)(void *, __const unsigned char *, __const unsigned char *, unsigned char *, unsigned char *); 
#line 97 "/usr/include/gconv.h"
typedef int (*__gconv_trans_query_fct)(__const char *, __const char ***,  size_t *); 
#line 100 "/usr/include/gconv.h"
typedef int (*__gconv_trans_init_fct)(void **, const char *); 
#line 101 "/usr/include/gconv.h"
typedef void (*__gconv_trans_end_fct)(void *); 
#line 111 "/usr/include/gconv.h"
struct __gconv_trans_data { __gconv_trans_fct __trans_fct;  __gconv_trans_context_fct __trans_context_fct;  __gconv_trans_end_fct __trans_end_fct; void *__data; struct __gconv_trans_data *__next; 
}; 
#line 141 "/usr/include/gconv.h"
struct __gconv_step {struct __gconv_loaded_object *__shlib_handle; __const char *__modname; int __counter; char *__from_name; char *__to_name;  __gconv_fct __fct;  __gconv_btowc_fct __btowc_fct;  __gconv_init_fct __init_fct;  __gconv_end_fct __end_fct; int __min_needed_from; int __max_needed_from; int __min_needed_to; int __max_needed_to; int __stateful; void *__data; 
}; 
#line 168 "/usr/include/gconv.h"
struct __gconv_step_data {unsigned char *__outbuf; unsigned char *__outbufend; int __flags; int __invocation_counter; int __internal_use;  __mbstate_t *__statep;  __mbstate_t __state; struct __gconv_trans_data *__trans; 
}; 
#line 177 "/usr/include/gconv.h"
typedef struct __gconv_info { size_t __nsteps; struct __gconv_step *__steps;  __extension__ struct __gconv_step_data __data[]; 
}*__gconv_t; 
#line 53 "/usr/include/_G_config.h"
typedef union {struct __gconv_info __cd; struct {struct __gconv_info __cd; struct __gconv_step_data __data; 
}__combined; 
}_G_iconv_t; 
#line 55 "/usr/include/_G_config.h"
typedef int _G_int16_t __attribute__  (( __mode__ ( __HI__ )  )) ; 
#line 56 "/usr/include/_G_config.h"
typedef int _G_int32_t __attribute__  (( __mode__ ( __SI__ )  )) ; 
#line 57 "/usr/include/_G_config.h"
typedef unsigned int _G_uint16_t __attribute__  (( __mode__ ( __HI__ )  )) ; 
#line 58 "/usr/include/_G_config.h"
typedef unsigned int _G_uint32_t __attribute__  (( __mode__ ( __SI__ )  )) ; 
# 45 "/usr/include/_G_config.h" 2 3 4
# 33 "/usr/include/libio.h" 2 3 4
# 53 "/usr/include/libio.h" 3 4
# 1 "/usr/local/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stdarg.h" 1 3 4
# 43 "/usr/local/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list; 
# 54 "/usr/include/libio.h" 2 3 4
# 163 "/usr/include/libio.h" 3 4
struct _IO_jump_t ; 
#line 163 "/usr/include/libio.h"
struct _IO_FILE ; 
#line 173 "/usr/include/libio.h"
typedef void _IO_lock_t; 
# 173 "/usr/include/libio.h" 3 4
# 196 "/usr/include/libio.h" 3 4
struct _IO_marker {struct _IO_marker *_next; struct _IO_FILE *_sbuf; int _pos; 
}; 
#line 205 "/usr/include/libio.h"
enum __codecvt_result {__codecvt_ok,__codecvt_partial,__codecvt_error,__codecvt_noconv}; 
# 264 "/usr/include/libio.h" 3 4
# 325 "/usr/include/libio.h" 3 4
struct _IO_FILE {int _flags; char *_IO_read_ptr; char *_IO_read_end; char *_IO_read_base; char *_IO_write_base; char *_IO_write_ptr; char *_IO_write_end; char *_IO_buf_base; char *_IO_buf_end; char *_IO_save_base; char *_IO_backup_base; char *_IO_save_end; struct _IO_marker *_markers; struct _IO_FILE *_chain; int _fileno; int _flags2;  __off_t _old_offset; unsigned short _cur_column; signed char _vtable_offset; char _shortbuf[1];  _IO_lock_t *_lock;  __off64_t _offset; void *__pad1; void *__pad2; int _mode; char _unused2[15 * sizeof (int ) - 2 * sizeof (void *)]; 
}; 
#line 328 "/usr/include/libio.h"
typedef struct _IO_FILE _IO_FILE; 
#line 331 "/usr/include/libio.h"
struct _IO_FILE_plus ; 
#line 333 "/usr/include/libio.h"
extern struct _IO_FILE_plus _IO_2_1_stdin_; 
#line 334 "/usr/include/libio.h"
extern struct _IO_FILE_plus _IO_2_1_stdout_; 
#line 335 "/usr/include/libio.h"
extern struct _IO_FILE_plus _IO_2_1_stderr_; 
#line 351 "/usr/include/libio.h"
typedef  __ssize_t __io_read_fn(void *__cookie, char *__buf,  size_t __nbytes); 
#line 360 "/usr/include/libio.h"
typedef  __ssize_t __io_write_fn(void *__cookie, __const char *__buf,  size_t __n); 
#line 368 "/usr/include/libio.h"
typedef int __io_seek_fn(void *__cookie,  __off64_t *__pos, int __w); 
#line 371 "/usr/include/libio.h"
typedef int __io_close_fn(void *__cookie); 
# 351 "/usr/include/libio.h" 3 4
# 403 "/usr/include/libio.h" 3 4
extern int __underflow( _IO_FILE *); 
#line 404 "/usr/include/libio.h"
extern int __uflow( _IO_FILE *); 
#line 405 "/usr/include/libio.h"
extern int __overflow( _IO_FILE *, int ); 
#line 406 "/usr/include/libio.h"
extern  wint_t __wunderflow( _IO_FILE *); 
#line 407 "/usr/include/libio.h"
extern  wint_t __wuflow( _IO_FILE *); 
#line 408 "/usr/include/libio.h"
extern  wint_t __woverflow( _IO_FILE *,  wint_t ); 
#line 433 "/usr/include/libio.h"
extern int _IO_getc( _IO_FILE *__fp); 
#line 434 "/usr/include/libio.h"
extern int _IO_putc(int __c,  _IO_FILE *__fp); 
#line 435 "/usr/include/libio.h"
extern int _IO_feof( _IO_FILE *__fp); 
#line 436 "/usr/include/libio.h"
extern int _IO_ferror( _IO_FILE *__fp); 
#line 438 "/usr/include/libio.h"
extern int _IO_peekc_locked( _IO_FILE *__fp); 
#line 444 "/usr/include/libio.h"
extern void _IO_flockfile( _IO_FILE *); 
#line 445 "/usr/include/libio.h"
extern void _IO_funlockfile( _IO_FILE *); 
#line 446 "/usr/include/libio.h"
extern int _IO_ftrylockfile( _IO_FILE *); 
# 433 "/usr/include/libio.h" 3 4
# 464 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf( _IO_FILE *__restrict , const char *__restrict ,  __gnuc_va_list , int *__restrict ); 
#line 466 "/usr/include/libio.h"
extern int _IO_vfprintf( _IO_FILE *__restrict , const char *__restrict ,  __gnuc_va_list ); 
#line 467 "/usr/include/libio.h"
extern  __ssize_t _IO_padn( _IO_FILE *, int ,  __ssize_t ); 
#line 468 "/usr/include/libio.h"
extern  size_t _IO_sgetn( _IO_FILE *, void *,  size_t ); 
#line 470 "/usr/include/libio.h"
extern  __off64_t _IO_seekoff( _IO_FILE *,  __off64_t , int , int ); 
#line 471 "/usr/include/libio.h"
extern  __off64_t _IO_seekpos( _IO_FILE *,  __off64_t , int ); 
#line 473 "/usr/include/libio.h"
extern void _IO_free_backup_area( _IO_FILE *); 
# 73 "/usr/include/stdio.h" 2 3 4
# 88 "/usr/include/stdio.h" 3 4
typedef  _G_fpos_t fpos_t; 
# 138 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/stdio_lim.h" 1 3 4
# 142 "/usr/include/stdio.h" 2 3 4
extern struct _IO_FILE *stdin; 
#line 143 "/usr/include/stdio.h"
extern struct _IO_FILE *stdout; 
#line 144 "/usr/include/stdio.h"
extern struct _IO_FILE *stderr; 
#line 154 "/usr/include/stdio.h"
extern int remove(__const char *__filename); 
#line 156 "/usr/include/stdio.h"
extern int rename(__const char *__old, __const char *__new); 
#line 166 "/usr/include/stdio.h"
extern  FILE *tmpfile(void ); 
#line 180 "/usr/include/stdio.h"
extern char *tmpnam(char *__s); 
#line 186 "/usr/include/stdio.h"
extern char *tmpnam_r(char *__s); 
# 180 "/usr/include/stdio.h" 3 4
# 199 "/usr/include/stdio.h" 3 4
extern char *tempnam(__const char *__dir, __const char *__pfx) __attribute__  (( __malloc__ )) ; 
#line 208 "/usr/include/stdio.h"
extern int fclose( FILE *__stream); 
#line 213 "/usr/include/stdio.h"
extern int fflush( FILE *__stream); 
#line 223 "/usr/include/stdio.h"
extern int fflush_unlocked( FILE *__stream); 
# 223 "/usr/include/stdio.h" 3 4
# 244 "/usr/include/stdio.h" 3 4
extern  FILE *fopen(__const char *__restrict __filename, __const char *__restrict __modes); 
#line 251 "/usr/include/stdio.h"
extern  FILE *freopen(__const char *__restrict __filename, __const char *__restrict __modes,  FILE *__restrict __stream); 
# 264 "/usr/include/stdio.h" 3 4
# 275 "/usr/include/stdio.h" 3 4
extern  FILE *fdopen(int __fd, __const char *__modes); 
#line 299 "/usr/include/stdio.h"
extern void setbuf( FILE *__restrict __stream, char *__restrict __buf); 
#line 304 "/usr/include/stdio.h"
extern int setvbuf( FILE *__restrict __stream, char *__restrict __buf, int __modes,  size_t __n); 
#line 311 "/usr/include/stdio.h"
extern void setbuffer( FILE *__restrict __stream, char *__restrict __buf,  size_t __size); 
#line 314 "/usr/include/stdio.h"
extern void setlinebuf( FILE *__stream); 
#line 324 "/usr/include/stdio.h"
extern int fprintf( FILE *__restrict __stream, __const char *__restrict __format, ...); 
#line 329 "/usr/include/stdio.h"
extern int printf(__const char *__restrict __format, ...); 
#line 332 "/usr/include/stdio.h"
extern int sprintf(char *__restrict __s, __const char *__restrict __format, ...); 
#line 339 "/usr/include/stdio.h"
extern int vfprintf( FILE *__restrict __s, __const char *__restrict __format,  __gnuc_va_list __arg); 
#line 344 "/usr/include/stdio.h"
extern int vprintf(__const char *__restrict __format,  __gnuc_va_list __arg); 
#line 347 "/usr/include/stdio.h"
extern int vsprintf(char *__restrict __s, __const char *__restrict __format,  __gnuc_va_list __arg); 
#line 355 "/usr/include/stdio.h"
extern int snprintf(char *__restrict __s,  size_t __maxlen, __const char *__restrict __format, ...) __attribute__  (( __format__ ( __printf__, 3, 4 )  )) ; 
#line 359 "/usr/include/stdio.h"
extern int vsnprintf(char *__restrict __s,  size_t __maxlen, __const char *__restrict __format,  __gnuc_va_list __arg) __attribute__  (( __format__ ( __printf__, 3, 0 )  )) ; 
# 296 "/usr/include/stdio.h" 3 4
# 396 "/usr/include/stdio.h" 3 4
extern int fscanf( FILE *__restrict __stream, __const char *__restrict __format, ...); 
#line 401 "/usr/include/stdio.h"
extern int scanf(__const char *__restrict __format, ...); 
#line 404 "/usr/include/stdio.h"
extern int sscanf(__const char *__restrict __s, __const char *__restrict __format, ...); 
#line 437 "/usr/include/stdio.h"
extern int fgetc( FILE *__stream); 
#line 438 "/usr/include/stdio.h"
extern int getc( FILE *__stream); 
#line 444 "/usr/include/stdio.h"
extern int getchar(void ); 
# 432 "/usr/include/stdio.h" 3 4
# 456 "/usr/include/stdio.h" 3 4
extern int getc_unlocked( FILE *__stream); 
#line 457 "/usr/include/stdio.h"
extern int getchar_unlocked(void ); 
#line 467 "/usr/include/stdio.h"
extern int fgetc_unlocked( FILE *__stream); 
#line 479 "/usr/include/stdio.h"
extern int fputc(int __c,  FILE *__stream); 
#line 480 "/usr/include/stdio.h"
extern int putc(int __c,  FILE *__stream); 
#line 486 "/usr/include/stdio.h"
extern int putchar(int __c); 
# 467 "/usr/include/stdio.h" 3 4
# 500 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked(int __c,  FILE *__stream); 
#line 508 "/usr/include/stdio.h"
extern int putc_unlocked(int __c,  FILE *__stream); 
#line 509 "/usr/include/stdio.h"
extern int putchar_unlocked(int __c); 
#line 516 "/usr/include/stdio.h"
extern int getw( FILE *__stream); 
#line 519 "/usr/include/stdio.h"
extern int putw(int __w,  FILE *__stream); 
#line 528 "/usr/include/stdio.h"
extern char *fgets(char *__restrict __s, int __n,  FILE *__restrict __stream); 
#line 535 "/usr/include/stdio.h"
extern char *gets(char *__s); 
#line 585 "/usr/include/stdio.h"
extern int fputs(__const char *__restrict __s,  FILE *__restrict __stream); 
#line 591 "/usr/include/stdio.h"
extern int puts(__const char *__s); 
#line 598 "/usr/include/stdio.h"
extern int ungetc(int __c,  FILE *__stream); 
#line 606 "/usr/include/stdio.h"
extern  size_t fread(void *__restrict __ptr,  size_t __size,  size_t __n,  FILE *__restrict __stream); 
#line 612 "/usr/include/stdio.h"
extern  size_t fwrite(__const void *__restrict __ptr,  size_t __size,  size_t __n,  FILE *__restrict __s); 
# 580 "/usr/include/stdio.h" 3 4
# 634 "/usr/include/stdio.h" 3 4
extern  size_t fread_unlocked(void *__restrict __ptr,  size_t __size,  size_t __n,  FILE *__restrict __stream); 
#line 636 "/usr/include/stdio.h"
extern  size_t fwrite_unlocked(__const void *__restrict __ptr,  size_t __size,  size_t __n,  FILE *__restrict __stream); 
#line 645 "/usr/include/stdio.h"
extern int fseek( FILE *__stream, long int __off, int __whence); 
#line 650 "/usr/include/stdio.h"
extern long int ftell( FILE *__stream); 
#line 655 "/usr/include/stdio.h"
extern void rewind( FILE *__stream); 
#line 694 "/usr/include/stdio.h"
extern int fgetpos( FILE *__restrict __stream,  fpos_t *__restrict __pos); 
#line 699 "/usr/include/stdio.h"
extern int fsetpos( FILE *__stream, __const  fpos_t *__pos); 
# 688 "/usr/include/stdio.h" 3 4
# 711 "/usr/include/stdio.h" 3 4
# 722 "/usr/include/stdio.h" 3 4
extern void clearerr( FILE *__stream); 
#line 724 "/usr/include/stdio.h"
extern int feof( FILE *__stream); 
#line 726 "/usr/include/stdio.h"
extern int ferror( FILE *__stream); 
#line 731 "/usr/include/stdio.h"
extern void clearerr_unlocked( FILE *__stream); 
#line 732 "/usr/include/stdio.h"
extern int feof_unlocked( FILE *__stream); 
#line 733 "/usr/include/stdio.h"
extern int ferror_unlocked( FILE *__stream); 
#line 742 "/usr/include/stdio.h"
extern void perror(__const char *__s); 
# 1 "/usr/include/bits/sys_errlist.h" 1 3 4
# 27 "/usr/include/bits/sys_errlist.h" 3 4
extern int sys_nerr; 
#line 28 "/usr/include/bits/sys_errlist.h"
extern __const char *__const sys_errlist[]; 
#line 754 "/usr/include/stdio.h"
extern int fileno( FILE *__stream); 
#line 759 "/usr/include/stdio.h"
extern int fileno_unlocked( FILE *__stream); 
# 750 "/usr/include/stdio.h" 2 3 4
# 769 "/usr/include/stdio.h" 3 4
extern  FILE *popen(__const char *__command, __const char *__modes); 
#line 775 "/usr/include/stdio.h"
extern int pclose( FILE *__stream); 
#line 781 "/usr/include/stdio.h"
extern char *ctermid(char *__s); 
#line 809 "/usr/include/stdio.h"
extern void flockfile( FILE *__stream); 
#line 813 "/usr/include/stdio.h"
extern int ftrylockfile( FILE *__stream); 
#line 816 "/usr/include/stdio.h"
extern void funlockfile( FILE *__stream); 
# 809 "/usr/include/stdio.h" 3 4
# 833 "/usr/include/stdio.h" 3 4
# 4 "t6ac_acc.c" 2
 inline void __utac_acc__t6ac_ac__1(void) { 


/* __utac__introduce__begin@ */


#line 6 "t6ac_acc.c"

#line 6 "t6ac_acc.c"
int b;
#line 8 "t6ac_acc.c"

#line 8 "t6ac_acc.c"
int c;
/* __utac__introduce__end@   */
}

 


#line 13 "t6ac_acc.c"
 inline void __utac_acc__t6ac_ac__2(int a, int b , struct JoinPoint *  this  )  {
 


#line 14 "t6ac_acc.c"
printf("in around aspect, para = %d, %d \n", a, b); 
#line 16 "t6ac_acc.c"
(this->fp(this)); }

 

 int __utac__cflow_t6ac_ac_0 (int x, int y) { 
 static int level = 0; 
 switch(x) { 
 case 1: level ++; break ; 
 case 2: level -- ; break; 
 case 3: break; 
 case 4: level = y ; 
 } 
 return level ; 
 } 
 void * __utac__cflow_t6ac_ac_0_0 (int action, int index, void * p) { 
static int __utac__para_0;
switch (index) { 
  case 0 : if(action == 1 ) { 
 __utac__para_0 = *(int *)(p); 
 } else { return (void *)(&__utac__para_0); } 
 break ; 
  }  
 } 


