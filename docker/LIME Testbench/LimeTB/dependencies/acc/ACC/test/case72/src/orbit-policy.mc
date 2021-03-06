typedef __builtin_va_list __gnuc_va_list;
typedef __gnuc_va_list va_list;











typedef unsigned int size_t;




extern void *memcpy (void *__restrict __dest,
       __const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, __const void *__src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));






extern void *memccpy (void *__restrict __dest, __const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));





extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memchr (__const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));



extern char *strcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, __const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));

extern char *strdup (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));


extern char *strchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

extern char *strrchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern size_t strcspn (__const char *__s, __const char *__reject)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strpbrk (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strstr (__const char *__haystack, __const char *__needle)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));



extern char *strtok (char *__restrict __s, __const char *__restrict __delim)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    __const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, __const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 3)));


extern size_t strlen (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));



extern char *strerror (int __errnum) __attribute__ ((__nothrow__));

extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));
extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern void bcopy (__const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int bcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *index (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


extern char *rindex (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));



extern int ffs (int __i) __attribute__ ((__nothrow__)) __attribute__ ((__const__));
extern int strcasecmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strsep (char **__restrict __stringp,
       __const char *__restrict __delim)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));






typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;




__extension__ typedef signed long long int __int64_t;
__extension__ typedef unsigned long long int __uint64_t;







__extension__ typedef long long int __quad_t;
__extension__ typedef unsigned long long int __u_quad_t;


__extension__ typedef __u_quad_t __dev_t;
__extension__ typedef unsigned int __uid_t;
__extension__ typedef unsigned int __gid_t;
__extension__ typedef unsigned long int __ino_t;
__extension__ typedef __u_quad_t __ino64_t;
__extension__ typedef unsigned int __mode_t;
__extension__ typedef unsigned int __nlink_t;
__extension__ typedef long int __off_t;
__extension__ typedef __quad_t __off64_t;
__extension__ typedef int __pid_t;
__extension__ typedef struct { int __val[2]; } __fsid_t;
__extension__ typedef long int __clock_t;
__extension__ typedef unsigned long int __rlim_t;
__extension__ typedef __u_quad_t __rlim64_t;
__extension__ typedef unsigned int __id_t;
__extension__ typedef long int __time_t;
__extension__ typedef unsigned int __useconds_t;
__extension__ typedef long int __suseconds_t;

__extension__ typedef int __daddr_t;
__extension__ typedef long int __swblk_t;
__extension__ typedef int __key_t;


__extension__ typedef int __clockid_t;


__extension__ typedef void * __timer_t;


__extension__ typedef long int __blksize_t;




__extension__ typedef long int __blkcnt_t;
__extension__ typedef __quad_t __blkcnt64_t;


__extension__ typedef unsigned long int __fsblkcnt_t;
__extension__ typedef __u_quad_t __fsblkcnt64_t;


__extension__ typedef unsigned long int __fsfilcnt_t;
__extension__ typedef __u_quad_t __fsfilcnt64_t;

__extension__ typedef int __ssize_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


__extension__ typedef int __intptr_t;


__extension__ typedef unsigned int __socklen_t;
extern void *__rawmemchr (const void *__s, int __c);
extern __inline size_t __strcspn_c1 (__const char *__s, int __reject);
extern __inline size_t
__strcspn_c1 (__const char *__s, int __reject)
{
  register size_t __result = 0;
  while (__s[__result] != '\0' && __s[__result] != __reject)
    ++__result;
  return __result;
}

extern __inline size_t __strcspn_c2 (__const char *__s, int __reject1,
         int __reject2);
extern __inline size_t
__strcspn_c2 (__const char *__s, int __reject1, int __reject2)
{
  register size_t __result = 0;
  while (__s[__result] != '\0' && __s[__result] != __reject1
  && __s[__result] != __reject2)
    ++__result;
  return __result;
}

extern __inline size_t __strcspn_c3 (__const char *__s, int __reject1,
         int __reject2, int __reject3);
extern __inline size_t
__strcspn_c3 (__const char *__s, int __reject1, int __reject2,
       int __reject3)
{
  register size_t __result = 0;
  while (__s[__result] != '\0' && __s[__result] != __reject1
  && __s[__result] != __reject2 && __s[__result] != __reject3)
    ++__result;
  return __result;
}
extern __inline size_t __strspn_c1 (__const char *__s, int __accept);
extern __inline size_t
__strspn_c1 (__const char *__s, int __accept)
{
  register size_t __result = 0;

  while (__s[__result] == __accept)
    ++__result;
  return __result;
}

extern __inline size_t __strspn_c2 (__const char *__s, int __accept1,
        int __accept2);
extern __inline size_t
__strspn_c2 (__const char *__s, int __accept1, int __accept2)
{
  register size_t __result = 0;

  while (__s[__result] == __accept1 || __s[__result] == __accept2)
    ++__result;
  return __result;
}

extern __inline size_t __strspn_c3 (__const char *__s, int __accept1,
        int __accept2, int __accept3);
extern __inline size_t
__strspn_c3 (__const char *__s, int __accept1, int __accept2, int __accept3)
{
  register size_t __result = 0;

  while (__s[__result] == __accept1 || __s[__result] == __accept2
  || __s[__result] == __accept3)
    ++__result;
  return __result;
}
extern __inline char *__strpbrk_c2 (__const char *__s, int __accept1,
         int __accept2);
extern __inline char *
__strpbrk_c2 (__const char *__s, int __accept1, int __accept2)
{

  while (*__s != '\0' && *__s != __accept1 && *__s != __accept2)
    ++__s;
  return *__s == '\0' ? ((void *)0) : (char *) (size_t) __s;
}

extern __inline char *__strpbrk_c3 (__const char *__s, int __accept1,
         int __accept2, int __accept3);
extern __inline char *
__strpbrk_c3 (__const char *__s, int __accept1, int __accept2,
       int __accept3)
{

  while (*__s != '\0' && *__s != __accept1 && *__s != __accept2
  && *__s != __accept3)
    ++__s;
  return *__s == '\0' ? ((void *)0) : (char *) (size_t) __s;
}
extern __inline char *__strtok_r_1c (char *__s, char __sep, char **__nextp);
extern __inline char *
__strtok_r_1c (char *__s, char __sep, char **__nextp)
{
  char *__result;
  if (__s == ((void *)0))
    __s = *__nextp;
  while (*__s == __sep)
    ++__s;
  __result = ((void *)0);
  if (*__s != '\0')
    {
      __result = __s++;
      while (*__s != '\0')
 if (*__s++ == __sep)
   {
     __s[-1] = '\0';
     break;
   }
      *__nextp = __s;
    }
  return __result;
}
extern char *__strsep_g (char **__stringp, __const char *__delim);
extern __inline char *__strsep_1c (char **__s, char __reject);
extern __inline char *
__strsep_1c (char **__s, char __reject)
{
  register char *__retval = *__s;
  if (__retval != ((void *)0) && (*__s = (__extension__ (__builtin_constant_p (__reject) && !__builtin_constant_p (__retval) && (__reject) == '\0' ? (char *) __rawmemchr (__retval, __reject) : __builtin_strchr (__retval, __reject)))) != ((void *)0))
    *(*__s)++ = '\0';
  return __retval;
}

extern __inline char *__strsep_2c (char **__s, char __reject1, char __reject2);
extern __inline char *
__strsep_2c (char **__s, char __reject1, char __reject2)
{
  register char *__retval = *__s;
  if (__retval != ((void *)0))
    {
      register char *__cp = __retval;
      while (1)
 {
   if (*__cp == '\0')
     {
       __cp = ((void *)0);
   break;
     }
   if (*__cp == __reject1 || *__cp == __reject2)
     {
       *__cp++ = '\0';
       break;
     }
   ++__cp;
 }
      *__s = __cp;
    }
  return __retval;
}

extern __inline char *__strsep_3c (char **__s, char __reject1, char __reject2,
       char __reject3);
extern __inline char *
__strsep_3c (char **__s, char __reject1, char __reject2, char __reject3)
{
  register char *__retval = *__s;
  if (__retval != ((void *)0))
    {
      register char *__cp = __retval;
      while (1)
 {
   if (*__cp == '\0')
     {
       __cp = ((void *)0);
   break;
     }
   if (*__cp == __reject1 || *__cp == __reject2 || *__cp == __reject3)
     {
       *__cp++ = '\0';
       break;
     }
   ++__cp;
 }
      *__s = __cp;
    }
  return __retval;
}




extern void *malloc (size_t __size) __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;






extern char *__strdup (__const char *__string) __attribute__ ((__nothrow__)) __attribute__ ((__malloc__));
extern char *__strndup (__const char *__string, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__));





typedef int ptrdiff_t;
typedef long int wchar_t;




















typedef signed char gint8;
typedef unsigned char guint8;
typedef signed short gint16;
typedef unsigned short guint16;



typedef signed int gint32;
typedef unsigned int guint32;





__extension__ typedef signed long long gint64;
__extension__ typedef unsigned long long guint64;
typedef signed int gssize;
typedef unsigned int gsize;
typedef struct _GStaticMutex GStaticMutex;
struct _GStaticMutex
{
  struct _GMutex *runtime_mutex;
  union {
    char pad[24];
    double dummy_double;
    void *dummy_pointer;
    long dummy_long;
  } static_mutex;
};
typedef union _GSystemThread GSystemThread;
union _GSystemThread
{
  char data[4];
  double dummy_double;
  void *dummy_pointer;
  long dummy_long;
};
typedef int GPid;




typedef char gchar;
typedef short gshort;
typedef long glong;
typedef int gint;
typedef gint gboolean;

typedef unsigned char guchar;
typedef unsigned short gushort;
typedef unsigned long gulong;
typedef unsigned int guint;

typedef float gfloat;
typedef double gdouble;
typedef void* gpointer;
typedef const void *gconstpointer;

typedef gint (*GCompareFunc) (gconstpointer a,
                                                 gconstpointer b);
typedef gint (*GCompareDataFunc) (gconstpointer a,
                                                 gconstpointer b,
       gpointer user_data);
typedef gboolean (*GEqualFunc) (gconstpointer a,
                                                 gconstpointer b);
typedef void (*GDestroyNotify) (gpointer data);
typedef void (*GFunc) (gpointer data,
                                                 gpointer user_data);
typedef guint (*GHashFunc) (gconstpointer key);
typedef void (*GHFunc) (gpointer key,
                                                 gpointer value,
                                                 gpointer user_data);
typedef void (*GFreeFunc) (gpointer data);
typedef const gchar * (*GTranslateFunc) (const gchar *str,
       gpointer data);
typedef union _GDoubleIEEE754 GDoubleIEEE754;
typedef union _GFloatIEEE754 GFloatIEEE754;





union _GFloatIEEE754
{
  gfloat v_float;
  struct {
    guint mantissa : 23;
    guint biased_exponent : 8;
    guint sign : 1;
  } mpn;
};
union _GDoubleIEEE754
{
  gdouble v_double;
  struct {
    guint mantissa_low : 32;
    guint mantissa_high : 20;
    guint biased_exponent : 11;
    guint sign : 1;
  } mpn;
};
typedef struct _GTimeVal GTimeVal;

struct _GTimeVal
{
  glong tv_sec;
  glong tv_usec;
};




typedef struct _GArray GArray;
typedef struct _GByteArray GByteArray;
typedef struct _GPtrArray GPtrArray;

struct _GArray
{
  gchar *data;
  guint len;
};

struct _GByteArray
{
  guint8 *data;
  guint len;
};

struct _GPtrArray
{
  gpointer *pdata;
  guint len;
};
GArray* g_array_new (gboolean zero_terminated,
       gboolean clear_,
       guint element_size);
GArray* g_array_sized_new (gboolean zero_terminated,
       gboolean clear_,
       guint element_size,
       guint reserved_size);
gchar* g_array_free (GArray *array,
       gboolean free_segment);
GArray* g_array_append_vals (GArray *array,
       gconstpointer data,
       guint len);
GArray* g_array_prepend_vals (GArray *array,
       gconstpointer data,
       guint len);
GArray* g_array_insert_vals (GArray *array,
       guint index_,
       gconstpointer data,
       guint len);
GArray* g_array_set_size (GArray *array,
       guint length);
GArray* g_array_remove_index (GArray *array,
       guint index_);
GArray* g_array_remove_index_fast (GArray *array,
       guint index_);
GArray* g_array_remove_range (GArray *array,
       guint index_,
       guint length);
void g_array_sort (GArray *array,
       GCompareFunc compare_func);
void g_array_sort_with_data (GArray *array,
       GCompareDataFunc compare_func,
       gpointer user_data);






GPtrArray* g_ptr_array_new (void);
GPtrArray* g_ptr_array_sized_new (guint reserved_size);
gpointer* g_ptr_array_free (GPtrArray *array,
        gboolean free_seg);
void g_ptr_array_set_size (GPtrArray *array,
        gint length);
gpointer g_ptr_array_remove_index (GPtrArray *array,
        guint index_);
gpointer g_ptr_array_remove_index_fast (GPtrArray *array,
        guint index_);
gboolean g_ptr_array_remove (GPtrArray *array,
        gpointer data);
gboolean g_ptr_array_remove_fast (GPtrArray *array,
        gpointer data);
void g_ptr_array_remove_range (GPtrArray *array,
        guint index_,
        guint length);
void g_ptr_array_add (GPtrArray *array,
        gpointer data);
void g_ptr_array_sort (GPtrArray *array,
        GCompareFunc compare_func);
void g_ptr_array_sort_with_data (GPtrArray *array,
        GCompareDataFunc compare_func,
        gpointer user_data);
void g_ptr_array_foreach (GPtrArray *array,
        GFunc func,
        gpointer user_data);






GByteArray* g_byte_array_new (void);
GByteArray* g_byte_array_sized_new (guint reserved_size);
guint8* g_byte_array_free (GByteArray *array,
         gboolean free_segment);
GByteArray* g_byte_array_append (GByteArray *array,
         const guint8 *data,
         guint len);
GByteArray* g_byte_array_prepend (GByteArray *array,
         const guint8 *data,
         guint len);
GByteArray* g_byte_array_set_size (GByteArray *array,
         guint length);
GByteArray* g_byte_array_remove_index (GByteArray *array,
         guint index_);
GByteArray* g_byte_array_remove_index_fast (GByteArray *array,
         guint index_);
GByteArray* g_byte_array_remove_range (GByteArray *array,
         guint index_,
         guint length);
void g_byte_array_sort (GByteArray *array,
         GCompareFunc compare_func);
void g_byte_array_sort_with_data (GByteArray *array,
         GCompareDataFunc compare_func,
         gpointer user_data);





typedef guint32 GQuark;



GQuark g_quark_try_string (const gchar *string);
GQuark g_quark_from_static_string (const gchar *string);
GQuark g_quark_from_string (const gchar *string);
const gchar* g_quark_to_string (GQuark quark) __attribute__((__const__));

const gchar* g_intern_string (const gchar *string);
const gchar* g_intern_static_string (const gchar *string);






typedef struct _GError GError;

struct _GError
{
  GQuark domain;
  gint code;
  gchar *message;
};

GError* g_error_new (GQuark domain,
                                gint code,
                                const gchar *format,
                                ...) __attribute__((__format__ (__printf__, 3, 4)));

GError* g_error_new_literal (GQuark domain,
                                gint code,
                                const gchar *message);

void g_error_free (GError *error);
GError* g_error_copy (const GError *error);

gboolean g_error_matches (const GError *error,
                                GQuark domain,
                                gint code);




void g_set_error (GError **err,
                                GQuark domain,
                                gint code,
                                const gchar *format,
                                ...) __attribute__((__format__ (__printf__, 4, 5)));



void g_propagate_error (GError **dest,
    GError *src);


void g_clear_error (GError **err);






gint g_atomic_int_exchange_and_add (volatile gint *atomic,
      gint val);
void g_atomic_int_add (volatile gint *atomic,
      gint val);
gboolean g_atomic_int_compare_and_exchange (volatile gint *atomic,
      gint oldval,
      gint newval);
gboolean g_atomic_pointer_compare_and_exchange (volatile gpointer *atomic,
      gpointer oldval,
      gpointer newval);

gint g_atomic_int_get (volatile gint *atomic);
void g_atomic_int_set (volatile gint *atomic,
      gint newval);
gpointer g_atomic_pointer_get (volatile gpointer *atomic);
void g_atomic_pointer_set (volatile gpointer *atomic,
      gpointer newval);







extern GQuark g_thread_error_quark (void);


typedef enum
{
  G_THREAD_ERROR_AGAIN
} GThreadError;

typedef gpointer (*GThreadFunc) (gpointer data);

typedef enum
{
  G_THREAD_PRIORITY_LOW,
  G_THREAD_PRIORITY_NORMAL,
  G_THREAD_PRIORITY_HIGH,
  G_THREAD_PRIORITY_URGENT
} GThreadPriority;

typedef struct _GThread GThread;
struct _GThread
{

  GThreadFunc func;
  gpointer data;
  gboolean joinable;
  GThreadPriority priority;
};

typedef struct _GMutex GMutex;
typedef struct _GCond GCond;
typedef struct _GPrivate GPrivate;
typedef struct _GStaticPrivate GStaticPrivate;

typedef struct _GThreadFunctions GThreadFunctions;
struct _GThreadFunctions
{
  GMutex* (*mutex_new) (void);
  void (*mutex_lock) (GMutex *mutex);
  gboolean (*mutex_trylock) (GMutex *mutex);
  void (*mutex_unlock) (GMutex *mutex);
  void (*mutex_free) (GMutex *mutex);
  GCond* (*cond_new) (void);
  void (*cond_signal) (GCond *cond);
  void (*cond_broadcast) (GCond *cond);
  void (*cond_wait) (GCond *cond,
                                   GMutex *mutex);
  gboolean (*cond_timed_wait) (GCond *cond,
                                   GMutex *mutex,
                                   GTimeVal *end_time);
  void (*cond_free) (GCond *cond);
  GPrivate* (*private_new) (GDestroyNotify destructor);
  gpointer (*private_get) (GPrivate *private_key);
  void (*private_set) (GPrivate *private_key,
                                   gpointer data);
  void (*thread_create) (GThreadFunc func,
                                   gpointer data,
                                   gulong stack_size,
                                   gboolean joinable,
                                   gboolean bound,
                                   GThreadPriority priority,
                                   gpointer thread,
                                   GError **error);
  void (*thread_yield) (void);
  void (*thread_join) (gpointer thread);
  void (*thread_exit) (void);
  void (*thread_set_priority)(gpointer thread,
                                   GThreadPriority priority);
  void (*thread_self) (gpointer thread);
  gboolean (*thread_equal) (gpointer thread1,
       gpointer thread2);
};

extern GThreadFunctions g_thread_functions_for_glib_use;
extern gboolean g_thread_use_default_impl;
extern gboolean g_threads_got_initialized;





void g_thread_init (GThreadFunctions *vtable);
void g_thread_init_with_errorcheck_mutexes (GThreadFunctions* vtable);
GMutex* g_static_mutex_get_mutex_impl (GMutex **mutex);
GThread* g_thread_create_full (GThreadFunc func,
                                gpointer data,
                                gulong stack_size,
                                gboolean joinable,
                                gboolean bound,
                                GThreadPriority priority,
                                GError **error);
GThread* g_thread_self (void);
void g_thread_exit (gpointer retval);
gpointer g_thread_join (GThread *thread);

void g_thread_set_priority (GThread *thread,
                                GThreadPriority priority);
void g_static_mutex_init (GStaticMutex *mutex);
void g_static_mutex_free (GStaticMutex *mutex);

struct _GStaticPrivate
{

  guint index;
};

void g_static_private_init (GStaticPrivate *private_key);
gpointer g_static_private_get (GStaticPrivate *private_key);
void g_static_private_set (GStaticPrivate *private_key,
       gpointer data,
       GDestroyNotify notify);
void g_static_private_free (GStaticPrivate *private_key);

typedef struct _GStaticRecMutex GStaticRecMutex;
struct _GStaticRecMutex
{

  GStaticMutex mutex;
  guint depth;
  GSystemThread owner;
};


void g_static_rec_mutex_init (GStaticRecMutex *mutex);
void g_static_rec_mutex_lock (GStaticRecMutex *mutex);
gboolean g_static_rec_mutex_trylock (GStaticRecMutex *mutex);
void g_static_rec_mutex_unlock (GStaticRecMutex *mutex);
void g_static_rec_mutex_lock_full (GStaticRecMutex *mutex,
                                         guint depth);
guint g_static_rec_mutex_unlock_full (GStaticRecMutex *mutex);
void g_static_rec_mutex_free (GStaticRecMutex *mutex);

typedef struct _GStaticRWLock GStaticRWLock;
struct _GStaticRWLock
{

  GStaticMutex mutex;
  GCond *read_cond;
  GCond *write_cond;
  guint read_counter;
  gboolean have_writer;
  guint want_to_read;
  guint want_to_write;
};



void g_static_rw_lock_init (GStaticRWLock* lock);
void g_static_rw_lock_reader_lock (GStaticRWLock* lock);
gboolean g_static_rw_lock_reader_trylock (GStaticRWLock* lock);
void g_static_rw_lock_reader_unlock (GStaticRWLock* lock);
void g_static_rw_lock_writer_lock (GStaticRWLock* lock);
gboolean g_static_rw_lock_writer_trylock (GStaticRWLock* lock);
void g_static_rw_lock_writer_unlock (GStaticRWLock* lock);
void g_static_rw_lock_free (GStaticRWLock* lock);

void g_thread_foreach (GFunc thread_func,
        gpointer user_data);

typedef enum
{
  G_ONCE_STATUS_NOTCALLED,
  G_ONCE_STATUS_PROGRESS,
  G_ONCE_STATUS_READY
} GOnceStatus;

typedef struct _GOnce GOnce;
struct _GOnce
{
  volatile GOnceStatus status;
  volatile gpointer retval;
};



gpointer g_once_impl (GOnce *once, GThreadFunc func, gpointer arg);
extern void glib_dummy_decl (void);




typedef struct _GAsyncQueue GAsyncQueue;





GAsyncQueue* g_async_queue_new (void);





void g_async_queue_lock (GAsyncQueue *queue);
void g_async_queue_unlock (GAsyncQueue *queue);




GAsyncQueue* g_async_queue_ref (GAsyncQueue *queue);
void g_async_queue_unref (GAsyncQueue *queue);
void g_async_queue_push (GAsyncQueue *queue,
       gpointer data);
void g_async_queue_push_unlocked (GAsyncQueue *queue,
       gpointer data);

void g_async_queue_push_sorted (GAsyncQueue *queue,
       gpointer data,
       GCompareDataFunc func,
       gpointer user_data);
void g_async_queue_push_sorted_unlocked (GAsyncQueue *queue,
       gpointer data,
       GCompareDataFunc func,
       gpointer user_data);



gpointer g_async_queue_pop (GAsyncQueue *queue);
gpointer g_async_queue_pop_unlocked (GAsyncQueue *queue);




gpointer g_async_queue_try_pop (GAsyncQueue *queue);
gpointer g_async_queue_try_pop_unlocked (GAsyncQueue *queue);





gpointer g_async_queue_timed_pop (GAsyncQueue *queue,
       GTimeVal *end_time);
gpointer g_async_queue_timed_pop_unlocked (GAsyncQueue *queue,
       GTimeVal *end_time);
gint g_async_queue_length (GAsyncQueue *queue);
gint g_async_queue_length_unlocked (GAsyncQueue *queue);
void g_async_queue_sort (GAsyncQueue *queue,
       GCompareDataFunc func,
       gpointer user_data);
void g_async_queue_sort_unlocked (GAsyncQueue *queue,
       GCompareDataFunc func,
       gpointer user_data);





void g_on_error_query (const gchar *prg_name);
void g_on_error_stack_trace (const gchar *prg_name);





gpointer g_slice_alloc (gsize block_size) __attribute__((__malloc__));
gpointer g_slice_alloc0 (gsize block_size) __attribute__((__malloc__));
void g_slice_free1 (gsize block_size,
      gpointer mem_block);
void g_slice_free_chain_with_offset (gsize block_size,
      gpointer mem_chain,
      gsize next_offset);
typedef enum {
  G_SLICE_CONFIG_ALWAYS_MALLOC = 1,
  G_SLICE_CONFIG_BYPASS_MAGAZINES,
  G_SLICE_CONFIG_WORKING_SET_MSECS,
  G_SLICE_CONFIG_COLOR_INCREMENT,
  G_SLICE_CONFIG_CHUNK_SIZES,
  G_SLICE_CONFIG_CONTENTION_COUNTER
} GSliceConfig;
void g_slice_set_config (GSliceConfig ckey, gint64 value);
gint64 g_slice_get_config (GSliceConfig ckey);
gint64* g_slice_get_config_state (GSliceConfig ckey, gint64 address, guint *n_values);






typedef struct _GMemVTable GMemVTable;
gpointer g_malloc (gulong n_bytes) __attribute__((__malloc__));
gpointer g_malloc0 (gulong n_bytes) __attribute__((__malloc__));
gpointer g_realloc (gpointer mem,
      gulong n_bytes) __attribute__((warn_unused_result));
void g_free (gpointer mem);
gpointer g_try_malloc (gulong n_bytes) __attribute__((__malloc__));
gpointer g_try_malloc0 (gulong n_bytes) __attribute__((__malloc__));
gpointer g_try_realloc (gpointer mem,
      gulong n_bytes) __attribute__((warn_unused_result));
struct _GMemVTable
{
  gpointer (*malloc) (gsize n_bytes);
  gpointer (*realloc) (gpointer mem,
      gsize n_bytes);
  void (*free) (gpointer mem);

  gpointer (*calloc) (gsize n_blocks,
      gsize n_block_bytes);
  gpointer (*try_malloc) (gsize n_bytes);
  gpointer (*try_realloc) (gpointer mem,
      gsize n_bytes);
};
void g_mem_set_vtable (GMemVTable *vtable);
gboolean g_mem_is_system_malloc (void);

extern gboolean g_mem_gc_friendly;



extern GMemVTable *glib_mem_profiler_table;
void g_mem_profile (void);




typedef struct _GList GList;

struct _GList
{
  gpointer data;
  GList *next;
  GList *prev;
};



GList* g_list_alloc (void) __attribute__((warn_unused_result));
void g_list_free (GList *list);
void g_list_free_1 (GList *list);

GList* g_list_append (GList *list,
      gpointer data) __attribute__((warn_unused_result));
GList* g_list_prepend (GList *list,
      gpointer data) __attribute__((warn_unused_result));
GList* g_list_insert (GList *list,
      gpointer data,
      gint position) __attribute__((warn_unused_result));
GList* g_list_insert_sorted (GList *list,
      gpointer data,
      GCompareFunc func) __attribute__((warn_unused_result));
GList* g_list_insert_sorted_with_data (GList *list,
      gpointer data,
      GCompareDataFunc func,
      gpointer user_data) __attribute__((warn_unused_result));
GList* g_list_insert_before (GList *list,
      GList *sibling,
      gpointer data) __attribute__((warn_unused_result));
GList* g_list_concat (GList *list1,
      GList *list2) __attribute__((warn_unused_result));
GList* g_list_remove (GList *list,
      gconstpointer data) __attribute__((warn_unused_result));
GList* g_list_remove_all (GList *list,
      gconstpointer data) __attribute__((warn_unused_result));
GList* g_list_remove_link (GList *list,
      GList *llink) __attribute__((warn_unused_result));
GList* g_list_delete_link (GList *list,
      GList *link_) __attribute__((warn_unused_result));
GList* g_list_reverse (GList *list) __attribute__((warn_unused_result));
GList* g_list_copy (GList *list) __attribute__((warn_unused_result));
GList* g_list_nth (GList *list,
      guint n);
GList* g_list_nth_prev (GList *list,
      guint n);
GList* g_list_find (GList *list,
      gconstpointer data);
GList* g_list_find_custom (GList *list,
      gconstpointer data,
      GCompareFunc func);
gint g_list_position (GList *list,
      GList *llink);
gint g_list_index (GList *list,
      gconstpointer data);
GList* g_list_last (GList *list);
GList* g_list_first (GList *list);
guint g_list_length (GList *list);
void g_list_foreach (GList *list,
      GFunc func,
      gpointer user_data);
GList* g_list_sort (GList *list,
      GCompareFunc compare_func) __attribute__((warn_unused_result));
GList* g_list_sort_with_data (GList *list,
      GCompareDataFunc compare_func,
      gpointer user_data) __attribute__((warn_unused_result));
gpointer g_list_nth_data (GList *list,
      guint n);




typedef struct _GCache GCache;

typedef gpointer (*GCacheNewFunc) (gpointer key);
typedef gpointer (*GCacheDupFunc) (gpointer value);
typedef void (*GCacheDestroyFunc) (gpointer value);



GCache* g_cache_new (GCacheNewFunc value_new_func,
                                GCacheDestroyFunc value_destroy_func,
                                GCacheDupFunc key_dup_func,
                                GCacheDestroyFunc key_destroy_func,
                                GHashFunc hash_key_func,
                                GHashFunc hash_value_func,
                                GEqualFunc key_equal_func);
void g_cache_destroy (GCache *cache);
gpointer g_cache_insert (GCache *cache,
                                gpointer key);
void g_cache_remove (GCache *cache,
                                gconstpointer value);
void g_cache_key_foreach (GCache *cache,
                                GHFunc func,
                                gpointer user_data);









typedef struct _GCompletion GCompletion;

typedef gchar* (*GCompletionFunc) (gpointer);




typedef gint (*GCompletionStrncmpFunc) (const gchar *s1,
     const gchar *s2,
     gsize n);

struct _GCompletion
{
  GList* items;
  GCompletionFunc func;

  gchar* prefix;
  GList* cache;
  GCompletionStrncmpFunc strncmp_func;
};

GCompletion* g_completion_new (GCompletionFunc func);
void g_completion_add_items (GCompletion* cmp,
                                         GList* items);
void g_completion_remove_items (GCompletion* cmp,
                                         GList* items);
void g_completion_clear_items (GCompletion* cmp);
GList* g_completion_complete (GCompletion* cmp,
                                         const gchar* prefix,
                                         gchar** new_prefix);
GList* g_completion_complete_utf8 (GCompletion *cmp,
                                         const gchar* prefix,
                                         gchar** new_prefix);
void g_completion_set_compare (GCompletion *cmp,
             GCompletionStrncmpFunc strncmp_func);
void g_completion_free (GCompletion* cmp);






typedef enum
{
  G_CONVERT_ERROR_NO_CONVERSION,
  G_CONVERT_ERROR_ILLEGAL_SEQUENCE,
  G_CONVERT_ERROR_FAILED,
  G_CONVERT_ERROR_PARTIAL_INPUT,
  G_CONVERT_ERROR_BAD_URI,
  G_CONVERT_ERROR_NOT_ABSOLUTE_PATH
} GConvertError;


GQuark g_convert_error_quark (void);



typedef struct _GIConv *GIConv;

GIConv g_iconv_open (const gchar *to_codeset,
         const gchar *from_codeset);
size_t g_iconv (GIConv converter,
         gchar **inbuf,
         gsize *inbytes_left,
         gchar **outbuf,
         gsize *outbytes_left);
gint g_iconv_close (GIConv converter);


gchar* g_convert (const gchar *str,
    gssize len,
    const gchar *to_codeset,
    const gchar *from_codeset,
    gsize *bytes_read,
    gsize *bytes_written,
    GError **error) __attribute__((__malloc__));
gchar* g_convert_with_iconv (const gchar *str,
    gssize len,
    GIConv converter,
    gsize *bytes_read,
    gsize *bytes_written,
    GError **error) __attribute__((__malloc__));
gchar* g_convert_with_fallback (const gchar *str,
    gssize len,
    const gchar *to_codeset,
    const gchar *from_codeset,
    gchar *fallback,
    gsize *bytes_read,
    gsize *bytes_written,
    GError **error) __attribute__((__malloc__));




gchar* g_locale_to_utf8 (const gchar *opsysstring,
      gssize len,
      gsize *bytes_read,
      gsize *bytes_written,
      GError **error) __attribute__((__malloc__));
gchar* g_locale_from_utf8 (const gchar *utf8string,
      gssize len,
      gsize *bytes_read,
      gsize *bytes_written,
      GError **error) __attribute__((__malloc__));
gchar* g_filename_to_utf8 (const gchar *opsysstring,
        gssize len,
        gsize *bytes_read,
        gsize *bytes_written,
        GError **error) __attribute__((__malloc__));
gchar* g_filename_from_utf8 (const gchar *utf8string,
        gssize len,
        gsize *bytes_read,
        gsize *bytes_written,
        GError **error) __attribute__((__malloc__));

gchar *g_filename_from_uri (const gchar *uri,
       gchar **hostname,
       GError **error) __attribute__((__malloc__));

gchar *g_filename_to_uri (const gchar *filename,
       const gchar *hostname,
       GError **error) __attribute__((__malloc__));
gchar *g_filename_display_name (const gchar *filename) __attribute__((__malloc__));
gboolean g_get_filename_charsets (const gchar ***charsets);

gchar *g_filename_display_basename (const gchar *filename) __attribute__((__malloc__));

gchar **g_uri_list_extract_uris (const gchar *uri_list) __attribute__((__malloc__));




typedef struct _GData GData;

typedef void (*GDataForeachFunc) (GQuark key_id,
                                                 gpointer data,
                                                 gpointer user_data);



void g_datalist_init (GData **datalist);
void g_datalist_clear (GData **datalist);
gpointer g_datalist_id_get_data (GData **datalist,
      GQuark key_id);
void g_datalist_id_set_data_full (GData **datalist,
      GQuark key_id,
      gpointer data,
      GDestroyNotify destroy_func);
gpointer g_datalist_id_remove_no_notify (GData **datalist,
      GQuark key_id);
void g_datalist_foreach (GData **datalist,
      GDataForeachFunc func,
      gpointer user_data);
void g_datalist_set_flags (GData **datalist,
      guint flags);
void g_datalist_unset_flags (GData **datalist,
      guint flags);
guint g_datalist_get_flags (GData **datalist);
void g_dataset_destroy (gconstpointer dataset_location);
gpointer g_dataset_id_get_data (gconstpointer dataset_location,
                                         GQuark key_id);
void g_dataset_id_set_data_full (gconstpointer dataset_location,
                                         GQuark key_id,
                                         gpointer data,
                                         GDestroyNotify destroy_func);
gpointer g_dataset_id_remove_no_notify (gconstpointer dataset_location,
                                         GQuark key_id);
void g_dataset_foreach (gconstpointer dataset_location,
                                         GDataForeachFunc func,
                                         gpointer user_data);














typedef __clock_t clock_t;





typedef __time_t time_t;



typedef __clockid_t clockid_t;
typedef __timer_t timer_t;
struct timespec
  {
    __time_t tv_sec;
    long int tv_nsec;
  };








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


  long int tm_gmtoff;
  __const char *tm_zone;




};








struct itimerspec
  {
    struct timespec it_interval;
    struct timespec it_value;
  };


struct sigevent;





typedef __pid_t pid_t;








extern clock_t clock (void) __attribute__ ((__nothrow__));


extern time_t time (time_t *__timer) __attribute__ ((__nothrow__));


extern double difftime (time_t __time1, time_t __time0)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern time_t mktime (struct tm *__tp) __attribute__ ((__nothrow__));





extern size_t strftime (char *__restrict __s, size_t __maxsize,
   __const char *__restrict __format,
   __const struct tm *__restrict __tp) __attribute__ ((__nothrow__));




extern struct tm *gmtime (__const time_t *__timer) __attribute__ ((__nothrow__));



extern struct tm *localtime (__const time_t *__timer) __attribute__ ((__nothrow__));





extern struct tm *gmtime_r (__const time_t *__restrict __timer,
       struct tm *__restrict __tp) __attribute__ ((__nothrow__));



extern struct tm *localtime_r (__const time_t *__restrict __timer,
          struct tm *__restrict __tp) __attribute__ ((__nothrow__));





extern char *asctime (__const struct tm *__tp) __attribute__ ((__nothrow__));


extern char *ctime (__const time_t *__timer) __attribute__ ((__nothrow__));







extern char *asctime_r (__const struct tm *__restrict __tp,
   char *__restrict __buf) __attribute__ ((__nothrow__));


extern char *ctime_r (__const time_t *__restrict __timer,
        char *__restrict __buf) __attribute__ ((__nothrow__));




extern char *__tzname[2];
extern int __daylight;
extern long int __timezone;




extern char *tzname[2];



extern void tzset (void) __attribute__ ((__nothrow__));



extern int daylight;
extern long int timezone;





extern int stime (__const time_t *__when) __attribute__ ((__nothrow__));
extern time_t timegm (struct tm *__tp) __attribute__ ((__nothrow__));


extern time_t timelocal (struct tm *__tp) __attribute__ ((__nothrow__));


extern int dysize (int __year) __attribute__ ((__nothrow__)) __attribute__ ((__const__));
extern int nanosleep (__const struct timespec *__requested_time,
        struct timespec *__remaining);



extern int clock_getres (clockid_t __clock_id, struct timespec *__res) __attribute__ ((__nothrow__));


extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp) __attribute__ ((__nothrow__));


extern int clock_settime (clockid_t __clock_id, __const struct timespec *__tp)
     __attribute__ ((__nothrow__));






extern int clock_nanosleep (clockid_t __clock_id, int __flags,
       __const struct timespec *__req,
       struct timespec *__rem);


extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) __attribute__ ((__nothrow__));




extern int timer_create (clockid_t __clock_id,
    struct sigevent *__restrict __evp,
    timer_t *__restrict __timerid) __attribute__ ((__nothrow__));


extern int timer_delete (timer_t __timerid) __attribute__ ((__nothrow__));


extern int timer_settime (timer_t __timerid, int __flags,
     __const struct itimerspec *__restrict __value,
     struct itimerspec *__restrict __ovalue) __attribute__ ((__nothrow__));


extern int timer_gettime (timer_t __timerid, struct itimerspec *__value)
     __attribute__ ((__nothrow__));


extern int timer_getoverrun (timer_t __timerid) __attribute__ ((__nothrow__));






typedef gint32 GTime;
typedef guint16 GDateYear;
typedef guint8 GDateDay;
typedef struct _GDate GDate;

struct tm;


typedef enum
{
  G_DATE_DAY = 0,
  G_DATE_MONTH = 1,
  G_DATE_YEAR = 2
} GDateDMY;


typedef enum
{
  G_DATE_BAD_WEEKDAY = 0,
  G_DATE_MONDAY = 1,
  G_DATE_TUESDAY = 2,
  G_DATE_WEDNESDAY = 3,
  G_DATE_THURSDAY = 4,
  G_DATE_FRIDAY = 5,
  G_DATE_SATURDAY = 6,
  G_DATE_SUNDAY = 7
} GDateWeekday;
typedef enum
{
  G_DATE_BAD_MONTH = 0,
  G_DATE_JANUARY = 1,
  G_DATE_FEBRUARY = 2,
  G_DATE_MARCH = 3,
  G_DATE_APRIL = 4,
  G_DATE_MAY = 5,
  G_DATE_JUNE = 6,
  G_DATE_JULY = 7,
  G_DATE_AUGUST = 8,
  G_DATE_SEPTEMBER = 9,
  G_DATE_OCTOBER = 10,
  G_DATE_NOVEMBER = 11,
  G_DATE_DECEMBER = 12
} GDateMonth;
struct _GDate
{
  guint julian_days : 32;





  guint julian : 1;
  guint dmy : 1;


  guint day : 6;
  guint month : 4;
  guint year : 16;
};





GDate* g_date_new (void);
GDate* g_date_new_dmy (GDateDay day,
                                           GDateMonth month,
                                           GDateYear year);
GDate* g_date_new_julian (guint32 julian_day);
void g_date_free (GDate *date);






gboolean g_date_valid (const GDate *date);
gboolean g_date_valid_day (GDateDay day) __attribute__((__const__));
gboolean g_date_valid_month (GDateMonth month) __attribute__((__const__));
gboolean g_date_valid_year (GDateYear year) __attribute__((__const__));
gboolean g_date_valid_weekday (GDateWeekday weekday) __attribute__((__const__));
gboolean g_date_valid_julian (guint32 julian_date) __attribute__((__const__));
gboolean g_date_valid_dmy (GDateDay day,
                                           GDateMonth month,
                                           GDateYear year) __attribute__((__const__));

GDateWeekday g_date_get_weekday (const GDate *date);
GDateMonth g_date_get_month (const GDate *date);
GDateYear g_date_get_year (const GDate *date);
GDateDay g_date_get_day (const GDate *date);
guint32 g_date_get_julian (const GDate *date);
guint g_date_get_day_of_year (const GDate *date);






guint g_date_get_monday_week_of_year (const GDate *date);
guint g_date_get_sunday_week_of_year (const GDate *date);
guint g_date_get_iso8601_week_of_year (const GDate *date);





void g_date_clear (GDate *date,
                                           guint n_dates);





void g_date_set_parse (GDate *date,
                                           const gchar *str);
void g_date_set_time_t (GDate *date,
        time_t timet);
void g_date_set_time_val (GDate *date,
        GTimeVal *timeval);




void g_date_set_month (GDate *date,
                                           GDateMonth month);
void g_date_set_day (GDate *date,
                                           GDateDay day);
void g_date_set_year (GDate *date,
                                           GDateYear year);
void g_date_set_dmy (GDate *date,
                                           GDateDay day,
                                           GDateMonth month,
                                           GDateYear y);
void g_date_set_julian (GDate *date,
                                           guint32 julian_date);
gboolean g_date_is_first_of_month (const GDate *date);
gboolean g_date_is_last_of_month (const GDate *date);


void g_date_add_days (GDate *date,
                                           guint n_days);
void g_date_subtract_days (GDate *date,
                                           guint n_days);


void g_date_add_months (GDate *date,
                                           guint n_months);
void g_date_subtract_months (GDate *date,
                                           guint n_months);


void g_date_add_years (GDate *date,
                                           guint n_years);
void g_date_subtract_years (GDate *date,
                                           guint n_years);
gboolean g_date_is_leap_year (GDateYear year) __attribute__((__const__));
guint8 g_date_get_days_in_month (GDateMonth month,
                                           GDateYear year) __attribute__((__const__));
guint8 g_date_get_monday_weeks_in_year (GDateYear year) __attribute__((__const__));
guint8 g_date_get_sunday_weeks_in_year (GDateYear year) __attribute__((__const__));



gint g_date_days_between (const GDate *date1,
        const GDate *date2);


gint g_date_compare (const GDate *lhs,
                                           const GDate *rhs);
void g_date_to_struct_tm (const GDate *date,
                                           struct tm *tm);

void g_date_clamp (GDate *date,
        const GDate *min_date,
        const GDate *max_date);


void g_date_order (GDate *date1, GDate *date2);




gsize g_date_strftime (gchar *s,
                                           gsize slen,
                                           const gchar *format,
                                           const GDate *date);



typedef struct _GDir GDir;







GDir * g_dir_open (const gchar *path,
            guint flags,
            GError **error);
const gchar *g_dir_read_name (GDir *dir);
void g_dir_rewind (GDir *dir);
void g_dir_close (GDir *dir);







typedef enum
{
  G_FILE_ERROR_EXIST,
  G_FILE_ERROR_ISDIR,
  G_FILE_ERROR_ACCES,
  G_FILE_ERROR_NAMETOOLONG,
  G_FILE_ERROR_NOENT,
  G_FILE_ERROR_NOTDIR,
  G_FILE_ERROR_NXIO,
  G_FILE_ERROR_NODEV,
  G_FILE_ERROR_ROFS,
  G_FILE_ERROR_TXTBSY,
  G_FILE_ERROR_FAULT,
  G_FILE_ERROR_LOOP,
  G_FILE_ERROR_NOSPC,
  G_FILE_ERROR_NOMEM,
  G_FILE_ERROR_MFILE,
  G_FILE_ERROR_NFILE,
  G_FILE_ERROR_BADF,
  G_FILE_ERROR_INVAL,
  G_FILE_ERROR_PIPE,
  G_FILE_ERROR_AGAIN,
  G_FILE_ERROR_INTR,
  G_FILE_ERROR_IO,
  G_FILE_ERROR_PERM,
  G_FILE_ERROR_NOSYS,
  G_FILE_ERROR_FAILED
} GFileError;





typedef enum
{
  G_FILE_TEST_IS_REGULAR = 1 << 0,
  G_FILE_TEST_IS_SYMLINK = 1 << 1,
  G_FILE_TEST_IS_DIR = 1 << 2,
  G_FILE_TEST_IS_EXECUTABLE = 1 << 3,
  G_FILE_TEST_EXISTS = 1 << 4
} GFileTest;

GQuark g_file_error_quark (void);

GFileError g_file_error_from_errno (gint err_no);
gboolean g_file_test (const gchar *filename,
                              GFileTest test);
gboolean g_file_get_contents (const gchar *filename,
                              gchar **contents,
                              gsize *length,
                              GError **error);
gboolean g_file_set_contents (const gchar *filename,
         const gchar *contents,
         gssize length,
         GError **error);
gchar *g_file_read_link (const gchar *filename,
         GError **error);


gint g_mkstemp (gchar *tmpl);


gint g_file_open_tmp (const gchar *tmpl,
         gchar **name_used,
         GError **error);

gchar *g_build_path (const gchar *separator,
    const gchar *first_element,
    ...) __attribute__((__malloc__)) __attribute__((__sentinel__));
gchar *g_build_pathv (const gchar *separator,
    gchar **args) __attribute__((__malloc__));

gchar *g_build_filename (const gchar *first_element,
    ...) __attribute__((__malloc__)) __attribute__((__sentinel__));
gchar *g_build_filenamev (gchar **args) __attribute__((__malloc__));

int g_mkdir_with_parents (const gchar *pathname,
        int mode);




typedef struct _GHashTable GHashTable;

typedef gboolean (*GHRFunc) (gpointer key,
                               gpointer value,
                               gpointer user_data);



GHashTable* g_hash_table_new (GHashFunc hash_func,
         GEqualFunc key_equal_func);
GHashTable* g_hash_table_new_full (GHashFunc hash_func,
         GEqualFunc key_equal_func,
         GDestroyNotify key_destroy_func,
         GDestroyNotify value_destroy_func);
void g_hash_table_destroy (GHashTable *hash_table);
void g_hash_table_insert (GHashTable *hash_table,
         gpointer key,
         gpointer value);
void g_hash_table_replace (GHashTable *hash_table,
         gpointer key,
         gpointer value);
gboolean g_hash_table_remove (GHashTable *hash_table,
         gconstpointer key);
gboolean g_hash_table_steal (GHashTable *hash_table,
         gconstpointer key);
gpointer g_hash_table_lookup (GHashTable *hash_table,
         gconstpointer key);
gboolean g_hash_table_lookup_extended (GHashTable *hash_table,
         gconstpointer lookup_key,
         gpointer *orig_key,
         gpointer *value);
void g_hash_table_foreach (GHashTable *hash_table,
         GHFunc func,
         gpointer user_data);
gpointer g_hash_table_find (GHashTable *hash_table,
         GHRFunc predicate,
         gpointer user_data);
guint g_hash_table_foreach_remove (GHashTable *hash_table,
         GHRFunc func,
         gpointer user_data);
guint g_hash_table_foreach_steal (GHashTable *hash_table,
         GHRFunc func,
         gpointer user_data);
guint g_hash_table_size (GHashTable *hash_table);


GHashTable* g_hash_table_ref (GHashTable *hash_table);
void g_hash_table_unref (GHashTable *hash_table);
gboolean g_str_equal (gconstpointer v1,
                      gconstpointer v2);
guint g_str_hash (gconstpointer v);

gboolean g_int_equal (gconstpointer v1,
                      gconstpointer v2);
guint g_int_hash (gconstpointer v);







guint g_direct_hash (gconstpointer v) __attribute__((__const__));
gboolean g_direct_equal (gconstpointer v1,
                         gconstpointer v2) __attribute__((__const__));






typedef struct _GHook GHook;
typedef struct _GHookList GHookList;

typedef gint (*GHookCompareFunc) (GHook *new_hook,
       GHook *sibling);
typedef gboolean (*GHookFindFunc) (GHook *hook,
       gpointer data);
typedef void (*GHookMarshaller) (GHook *hook,
       gpointer marshal_data);
typedef gboolean (*GHookCheckMarshaller) (GHook *hook,
       gpointer marshal_data);
typedef void (*GHookFunc) (gpointer data);
typedef gboolean (*GHookCheckFunc) (gpointer data);
typedef void (*GHookFinalizeFunc) (GHookList *hook_list,
       GHook *hook);
typedef enum
{
  G_HOOK_FLAG_ACTIVE = 1 << 0,
  G_HOOK_FLAG_IN_CALL = 1 << 1,
  G_HOOK_FLAG_MASK = 0x0f
} GHookFlagMask;




struct _GHookList
{
  gulong seq_id;
  guint hook_size : 16;
  guint is_setup : 1;
  GHook *hooks;
  gpointer dummy3;
  GHookFinalizeFunc finalize_hook;
  gpointer dummy[2];
};
struct _GHook
{
  gpointer data;
  GHook *next;
  GHook *prev;
  guint ref_count;
  gulong hook_id;
  guint flags;
  gpointer func;
  GDestroyNotify destroy;
};
void g_hook_list_init (GHookList *hook_list,
      guint hook_size);
void g_hook_list_clear (GHookList *hook_list);
GHook* g_hook_alloc (GHookList *hook_list);
void g_hook_free (GHookList *hook_list,
      GHook *hook);
GHook * g_hook_ref (GHookList *hook_list,
      GHook *hook);
void g_hook_unref (GHookList *hook_list,
      GHook *hook);
gboolean g_hook_destroy (GHookList *hook_list,
      gulong hook_id);
void g_hook_destroy_link (GHookList *hook_list,
      GHook *hook);
void g_hook_prepend (GHookList *hook_list,
      GHook *hook);
void g_hook_insert_before (GHookList *hook_list,
      GHook *sibling,
      GHook *hook);
void g_hook_insert_sorted (GHookList *hook_list,
      GHook *hook,
      GHookCompareFunc func);
GHook* g_hook_get (GHookList *hook_list,
      gulong hook_id);
GHook* g_hook_find (GHookList *hook_list,
      gboolean need_valids,
      GHookFindFunc func,
      gpointer data);
GHook* g_hook_find_data (GHookList *hook_list,
      gboolean need_valids,
      gpointer data);
GHook* g_hook_find_func (GHookList *hook_list,
      gboolean need_valids,
      gpointer func);
GHook* g_hook_find_func_data (GHookList *hook_list,
      gboolean need_valids,
      gpointer func,
      gpointer data);

GHook* g_hook_first_valid (GHookList *hook_list,
      gboolean may_be_in_call);



GHook* g_hook_next_valid (GHookList *hook_list,
      GHook *hook,
      gboolean may_be_in_call);

gint g_hook_compare_ids (GHook *new_hook,
      GHook *sibling);





void g_hook_list_invoke (GHookList *hook_list,
      gboolean may_recurse);



void g_hook_list_invoke_check (GHookList *hook_list,
      gboolean may_recurse);


void g_hook_list_marshal (GHookList *hook_list,
      gboolean may_recurse,
      GHookMarshaller marshaller,
      gpointer marshal_data);
void g_hook_list_marshal_check (GHookList *hook_list,
      gboolean may_recurse,
      GHookCheckMarshaller marshaller,
      gpointer marshal_data);




typedef struct _GSList GSList;

struct _GSList
{
  gpointer data;
  GSList *next;
};



GSList* g_slist_alloc (void) __attribute__((warn_unused_result));
void g_slist_free (GSList *list);
void g_slist_free_1 (GSList *list);

GSList* g_slist_append (GSList *list,
       gpointer data) __attribute__((warn_unused_result));
GSList* g_slist_prepend (GSList *list,
       gpointer data) __attribute__((warn_unused_result));
GSList* g_slist_insert (GSList *list,
       gpointer data,
       gint position) __attribute__((warn_unused_result));
GSList* g_slist_insert_sorted (GSList *list,
       gpointer data,
       GCompareFunc func) __attribute__((warn_unused_result));
GSList* g_slist_insert_sorted_with_data (GSList *list,
       gpointer data,
       GCompareDataFunc func,
       gpointer user_data) __attribute__((warn_unused_result));
GSList* g_slist_insert_before (GSList *slist,
       GSList *sibling,
       gpointer data) __attribute__((warn_unused_result));
GSList* g_slist_concat (GSList *list1,
       GSList *list2) __attribute__((warn_unused_result));
GSList* g_slist_remove (GSList *list,
       gconstpointer data) __attribute__((warn_unused_result));
GSList* g_slist_remove_all (GSList *list,
       gconstpointer data) __attribute__((warn_unused_result));
GSList* g_slist_remove_link (GSList *list,
       GSList *link_) __attribute__((warn_unused_result));
GSList* g_slist_delete_link (GSList *list,
       GSList *link_) __attribute__((warn_unused_result));
GSList* g_slist_reverse (GSList *list) __attribute__((warn_unused_result));
GSList* g_slist_copy (GSList *list) __attribute__((warn_unused_result));
GSList* g_slist_nth (GSList *list,
       guint n);
GSList* g_slist_find (GSList *list,
       gconstpointer data);
GSList* g_slist_find_custom (GSList *list,
       gconstpointer data,
       GCompareFunc func);
gint g_slist_position (GSList *list,
       GSList *llink);
gint g_slist_index (GSList *list,
       gconstpointer data);
GSList* g_slist_last (GSList *list);
guint g_slist_length (GSList *list);
void g_slist_foreach (GSList *list,
       GFunc func,
       gpointer user_data);
GSList* g_slist_sort (GSList *list,
       GCompareFunc compare_func) __attribute__((warn_unused_result));
GSList* g_slist_sort_with_data (GSList *list,
       GCompareDataFunc compare_func,
       gpointer user_data) __attribute__((warn_unused_result));
gpointer g_slist_nth_data (GSList *list,
       guint n);












typedef struct _GMainContext GMainContext;
typedef struct _GMainLoop GMainLoop;
typedef struct _GSource GSource;
typedef struct _GSourceCallbackFuncs GSourceCallbackFuncs;
typedef struct _GSourceFuncs GSourceFuncs;

typedef gboolean (*GSourceFunc) (gpointer data);
typedef void (*GChildWatchFunc) (GPid pid,
           gint status,
           gpointer data);
struct _GSource
{

  gpointer callback_data;
  GSourceCallbackFuncs *callback_funcs;

  GSourceFuncs *source_funcs;
  guint ref_count;

  GMainContext *context;

  gint priority;
  guint flags;
  guint source_id;

  GSList *poll_fds;

  GSource *prev;
  GSource *next;

  gpointer reserved1;
  gpointer reserved2;
};

struct _GSourceCallbackFuncs
{
  void (*ref) (gpointer cb_data);
  void (*unref) (gpointer cb_data);
  void (*get) (gpointer cb_data,
   GSource *source,
   GSourceFunc *func,
   gpointer *data);
};

typedef void (*GSourceDummyMarshal) (void);

struct _GSourceFuncs
{
  gboolean (*prepare) (GSource *source,
   gint *timeout_);
  gboolean (*check) (GSource *source);
  gboolean (*dispatch) (GSource *source,
   GSourceFunc callback,
   gpointer user_data);
  void (*finalize) (GSource *source);


  GSourceFunc closure_callback;
  GSourceDummyMarshal closure_marshal;
};
typedef struct _GPollFD GPollFD;
typedef gint (*GPollFunc) (GPollFD *ufds,
     guint nfsd,
     gint timeout_);

struct _GPollFD
{
  gint fd;
  gushort events;
  gushort revents;
};
GMainContext *g_main_context_new (void);
GMainContext *g_main_context_ref (GMainContext *context);
void g_main_context_unref (GMainContext *context);
GMainContext *g_main_context_default (void);

gboolean g_main_context_iteration (GMainContext *context,
     gboolean may_block);
gboolean g_main_context_pending (GMainContext *context);



GSource *g_main_context_find_source_by_id (GMainContext *context,
            guint source_id);
GSource *g_main_context_find_source_by_user_data (GMainContext *context,
            gpointer user_data);
GSource *g_main_context_find_source_by_funcs_user_data (GMainContext *context,
             GSourceFuncs *funcs,
            gpointer user_data);



void g_main_context_wakeup (GMainContext *context);
gboolean g_main_context_acquire (GMainContext *context);
void g_main_context_release (GMainContext *context);
gboolean g_main_context_is_owner (GMainContext *context);
gboolean g_main_context_wait (GMainContext *context,
     GCond *cond,
     GMutex *mutex);

gboolean g_main_context_prepare (GMainContext *context,
      gint *priority);
gint g_main_context_query (GMainContext *context,
      gint max_priority,
      gint *timeout_,
      GPollFD *fds,
      gint n_fds);
gint g_main_context_check (GMainContext *context,
      gint max_priority,
      GPollFD *fds,
      gint n_fds);
void g_main_context_dispatch (GMainContext *context);

void g_main_context_set_poll_func (GMainContext *context,
     GPollFunc func);
GPollFunc g_main_context_get_poll_func (GMainContext *context);



void g_main_context_add_poll (GMainContext *context,
       GPollFD *fd,
       gint priority);
void g_main_context_remove_poll (GMainContext *context,
       GPollFD *fd);

int g_main_depth (void);



GMainLoop *g_main_loop_new (GMainContext *context,
           gboolean is_running);
void g_main_loop_run (GMainLoop *loop);
void g_main_loop_quit (GMainLoop *loop);
GMainLoop *g_main_loop_ref (GMainLoop *loop);
void g_main_loop_unref (GMainLoop *loop);
gboolean g_main_loop_is_running (GMainLoop *loop);
GMainContext *g_main_loop_get_context (GMainLoop *loop);



GSource *g_source_new (GSourceFuncs *source_funcs,
       guint struct_size);
GSource *g_source_ref (GSource *source);
void g_source_unref (GSource *source);

guint g_source_attach (GSource *source,
       GMainContext *context);
void g_source_destroy (GSource *source);

void g_source_set_priority (GSource *source,
       gint priority);
gint g_source_get_priority (GSource *source);
void g_source_set_can_recurse (GSource *source,
       gboolean can_recurse);
gboolean g_source_get_can_recurse (GSource *source);
guint g_source_get_id (GSource *source);

GMainContext *g_source_get_context (GSource *source);

void g_source_set_callback (GSource *source,
         GSourceFunc func,
         gpointer data,
         GDestroyNotify notify);



void g_source_set_callback_indirect (GSource *source,
         gpointer callback_data,
         GSourceCallbackFuncs *callback_funcs);

void g_source_add_poll (GSource *source,
        GPollFD *fd);
void g_source_remove_poll (GSource *source,
        GPollFD *fd);

void g_source_get_current_time (GSource *source,
        GTimeVal *timeval);







GSource *g_idle_source_new (void);
GSource *g_child_watch_source_new (GPid pid);
GSource *g_timeout_source_new (guint interval);



void g_get_current_time (GTimeVal *result);
gboolean g_source_remove (guint tag);
gboolean g_source_remove_by_user_data (gpointer user_data);
gboolean g_source_remove_by_funcs_user_data (GSourceFuncs *funcs,
           gpointer user_data);


guint g_timeout_add_full (gint priority,
     guint interval,
     GSourceFunc function,
     gpointer data,
     GDestroyNotify notify);
guint g_timeout_add (guint interval,
     GSourceFunc function,
     gpointer data);
guint g_child_watch_add_full (gint priority,
     GPid pid,
     GChildWatchFunc function,
     gpointer data,
     GDestroyNotify notify);
guint g_child_watch_add (GPid pid,
     GChildWatchFunc function,
     gpointer data);
guint g_idle_add (GSourceFunc function,
     gpointer data);
guint g_idle_add_full (gint priority,
     GSourceFunc function,
     gpointer data,
     GDestroyNotify notify);
gboolean g_idle_remove_by_data (gpointer data);


extern GSourceFuncs g_timeout_funcs;
extern GSourceFuncs g_child_watch_funcs;
extern GSourceFuncs g_idle_funcs;




typedef guint32 gunichar;
typedef guint16 gunichar2;




typedef enum
{
  G_UNICODE_CONTROL,
  G_UNICODE_FORMAT,
  G_UNICODE_UNASSIGNED,
  G_UNICODE_PRIVATE_USE,
  G_UNICODE_SURROGATE,
  G_UNICODE_LOWERCASE_LETTER,
  G_UNICODE_MODIFIER_LETTER,
  G_UNICODE_OTHER_LETTER,
  G_UNICODE_TITLECASE_LETTER,
  G_UNICODE_UPPERCASE_LETTER,
  G_UNICODE_COMBINING_MARK,
  G_UNICODE_ENCLOSING_MARK,
  G_UNICODE_NON_SPACING_MARK,
  G_UNICODE_DECIMAL_NUMBER,
  G_UNICODE_LETTER_NUMBER,
  G_UNICODE_OTHER_NUMBER,
  G_UNICODE_CONNECT_PUNCTUATION,
  G_UNICODE_DASH_PUNCTUATION,
  G_UNICODE_CLOSE_PUNCTUATION,
  G_UNICODE_FINAL_PUNCTUATION,
  G_UNICODE_INITIAL_PUNCTUATION,
  G_UNICODE_OTHER_PUNCTUATION,
  G_UNICODE_OPEN_PUNCTUATION,
  G_UNICODE_CURRENCY_SYMBOL,
  G_UNICODE_MODIFIER_SYMBOL,
  G_UNICODE_MATH_SYMBOL,
  G_UNICODE_OTHER_SYMBOL,
  G_UNICODE_LINE_SEPARATOR,
  G_UNICODE_PARAGRAPH_SEPARATOR,
  G_UNICODE_SPACE_SEPARATOR
} GUnicodeType;






typedef enum
{
  G_UNICODE_BREAK_MANDATORY,
  G_UNICODE_BREAK_CARRIAGE_RETURN,
  G_UNICODE_BREAK_LINE_FEED,
  G_UNICODE_BREAK_COMBINING_MARK,
  G_UNICODE_BREAK_SURROGATE,
  G_UNICODE_BREAK_ZERO_WIDTH_SPACE,
  G_UNICODE_BREAK_INSEPARABLE,
  G_UNICODE_BREAK_NON_BREAKING_GLUE,
  G_UNICODE_BREAK_CONTINGENT,
  G_UNICODE_BREAK_SPACE,
  G_UNICODE_BREAK_AFTER,
  G_UNICODE_BREAK_BEFORE,
  G_UNICODE_BREAK_BEFORE_AND_AFTER,
  G_UNICODE_BREAK_HYPHEN,
  G_UNICODE_BREAK_NON_STARTER,
  G_UNICODE_BREAK_OPEN_PUNCTUATION,
  G_UNICODE_BREAK_CLOSE_PUNCTUATION,
  G_UNICODE_BREAK_QUOTATION,
  G_UNICODE_BREAK_EXCLAMATION,
  G_UNICODE_BREAK_IDEOGRAPHIC,
  G_UNICODE_BREAK_NUMERIC,
  G_UNICODE_BREAK_INFIX_SEPARATOR,
  G_UNICODE_BREAK_SYMBOL,
  G_UNICODE_BREAK_ALPHABETIC,
  G_UNICODE_BREAK_PREFIX,
  G_UNICODE_BREAK_POSTFIX,
  G_UNICODE_BREAK_COMPLEX_CONTEXT,
  G_UNICODE_BREAK_AMBIGUOUS,
  G_UNICODE_BREAK_UNKNOWN,
  G_UNICODE_BREAK_NEXT_LINE,
  G_UNICODE_BREAK_WORD_JOINER,
  G_UNICODE_BREAK_HANGUL_L_JAMO,
  G_UNICODE_BREAK_HANGUL_V_JAMO,
  G_UNICODE_BREAK_HANGUL_T_JAMO,
  G_UNICODE_BREAK_HANGUL_LV_SYLLABLE,
  G_UNICODE_BREAK_HANGUL_LVT_SYLLABLE
} GUnicodeBreakType;







gboolean g_get_charset (const char **charset);



gboolean g_unichar_isalnum (gunichar c) __attribute__((__const__));
gboolean g_unichar_isalpha (gunichar c) __attribute__((__const__));
gboolean g_unichar_iscntrl (gunichar c) __attribute__((__const__));
gboolean g_unichar_isdigit (gunichar c) __attribute__((__const__));
gboolean g_unichar_isgraph (gunichar c) __attribute__((__const__));
gboolean g_unichar_islower (gunichar c) __attribute__((__const__));
gboolean g_unichar_isprint (gunichar c) __attribute__((__const__));
gboolean g_unichar_ispunct (gunichar c) __attribute__((__const__));
gboolean g_unichar_isspace (gunichar c) __attribute__((__const__));
gboolean g_unichar_isupper (gunichar c) __attribute__((__const__));
gboolean g_unichar_isxdigit (gunichar c) __attribute__((__const__));
gboolean g_unichar_istitle (gunichar c) __attribute__((__const__));
gboolean g_unichar_isdefined (gunichar c) __attribute__((__const__));
gboolean g_unichar_iswide (gunichar c) __attribute__((__const__));



gunichar g_unichar_toupper (gunichar c) __attribute__((__const__));
gunichar g_unichar_tolower (gunichar c) __attribute__((__const__));
gunichar g_unichar_totitle (gunichar c) __attribute__((__const__));



gint g_unichar_digit_value (gunichar c) __attribute__((__const__));

gint g_unichar_xdigit_value (gunichar c) __attribute__((__const__));


GUnicodeType g_unichar_type (gunichar c) __attribute__((__const__));


GUnicodeBreakType g_unichar_break_type (gunichar c) __attribute__((__const__));





void g_unicode_canonical_ordering (gunichar *string,
       gsize len);




gunichar *g_unicode_canonical_decomposition (gunichar ch,
          gsize *result_len) __attribute__((__malloc__));



extern const gchar * const g_utf8_skip;



gunichar g_utf8_get_char (const gchar *p);
gunichar g_utf8_get_char_validated (const gchar *p,
        gssize max_len);

gchar* g_utf8_offset_to_pointer (const gchar *str,
                                   glong offset);
glong g_utf8_pointer_to_offset (const gchar *str,
       const gchar *pos);
gchar* g_utf8_prev_char (const gchar *p);
gchar* g_utf8_find_next_char (const gchar *p,
       const gchar *end);
gchar* g_utf8_find_prev_char (const gchar *str,
       const gchar *p);

glong g_utf8_strlen (const gchar *p,
       gssize max);


gchar* g_utf8_strncpy (gchar *dest,
         const gchar *src,
         gsize n);



gchar* g_utf8_strchr (const gchar *p,
         gssize len,
         gunichar c);
gchar* g_utf8_strrchr (const gchar *p,
         gssize len,
         gunichar c);
gchar* g_utf8_strreverse (const gchar *str,
     gssize len);

gunichar2 *g_utf8_to_utf16 (const gchar *str,
    glong len,
    glong *items_read,
    glong *items_written,
    GError **error) __attribute__((__malloc__));
gunichar * g_utf8_to_ucs4 (const gchar *str,
    glong len,
    glong *items_read,
    glong *items_written,
    GError **error) __attribute__((__malloc__));
gunichar * g_utf8_to_ucs4_fast (const gchar *str,
    glong len,
    glong *items_written) __attribute__((__malloc__));
gunichar * g_utf16_to_ucs4 (const gunichar2 *str,
    glong len,
    glong *items_read,
    glong *items_written,
    GError **error) __attribute__((__malloc__));
gchar* g_utf16_to_utf8 (const gunichar2 *str,
    glong len,
    glong *items_read,
    glong *items_written,
    GError **error) __attribute__((__malloc__));
gunichar2 *g_ucs4_to_utf16 (const gunichar *str,
    glong len,
    glong *items_read,
    glong *items_written,
    GError **error) __attribute__((__malloc__));
gchar* g_ucs4_to_utf8 (const gunichar *str,
    glong len,
    glong *items_read,
    glong *items_written,
    GError **error) __attribute__((__malloc__));





gint g_unichar_to_utf8 (gunichar c,
        gchar *outbuf);





gboolean g_utf8_validate (const gchar *str,
                          gssize max_len,
                          const gchar **end);


gboolean g_unichar_validate (gunichar ch);

gchar *g_utf8_strup (const gchar *str,
         gssize len) __attribute__((__malloc__));
gchar *g_utf8_strdown (const gchar *str,
         gssize len) __attribute__((__malloc__));
gchar *g_utf8_casefold (const gchar *str,
   gssize len) __attribute__((__malloc__));

typedef enum {
  G_NORMALIZE_DEFAULT,
  G_NORMALIZE_NFD = G_NORMALIZE_DEFAULT,
  G_NORMALIZE_DEFAULT_COMPOSE,
  G_NORMALIZE_NFC = G_NORMALIZE_DEFAULT_COMPOSE,
  G_NORMALIZE_ALL,
  G_NORMALIZE_NFKD = G_NORMALIZE_ALL,
  G_NORMALIZE_ALL_COMPOSE,
  G_NORMALIZE_NFKC = G_NORMALIZE_ALL_COMPOSE
} GNormalizeMode;

gchar *g_utf8_normalize (const gchar *str,
    gssize len,
    GNormalizeMode mode) __attribute__((__malloc__));

gint g_utf8_collate (const gchar *str1,
      const gchar *str2);
gchar *g_utf8_collate_key (const gchar *str,
      gssize len) __attribute__((__malloc__));
gchar *g_utf8_collate_key_for_filename (const gchar *str,
                   gssize len) __attribute__((__malloc__));

gboolean g_unichar_get_mirror_char (gunichar ch,
                                    gunichar *mirrored_ch);



const gchar* g_get_user_name (void);
const gchar* g_get_real_name (void);
const gchar* g_get_home_dir (void);
const gchar* g_get_tmp_dir (void);
const gchar* g_get_host_name (void);
gchar* g_get_prgname (void);
void g_set_prgname (const gchar *prgname);
const gchar* g_get_application_name (void);
void g_set_application_name (const gchar *application_name);

const gchar* g_get_user_data_dir (void);
const gchar* g_get_user_config_dir (void);
const gchar* g_get_user_cache_dir (void);
const gchar* const * g_get_system_data_dirs (void);
const gchar* const * g_get_system_config_dirs (void);

const gchar* const * g_get_language_names (void);

typedef struct _GDebugKey GDebugKey;
struct _GDebugKey
{
  gchar *key;
  guint value;
};



guint g_parse_debug_string (const gchar *string,
         const GDebugKey *keys,
         guint nkeys);

gint g_snprintf (gchar *string,
         gulong n,
         gchar const *format,
         ...) __attribute__((__format__ (__printf__, 3, 4)));
gint g_vsnprintf (gchar *string,
         gulong n,
         gchar const *format,
         va_list args);


gboolean g_path_is_absolute (const gchar *file_name);


const gchar* g_path_skip_root (const gchar *file_name);
gchar* g_get_current_dir (void);
gchar* g_path_get_basename (const gchar *file_name) __attribute__((__malloc__));
gchar* g_path_get_dirname (const gchar *file_name) __attribute__((__malloc__));


void g_nullify_pointer (gpointer *nullify_location);
const gchar* g_getenv (const gchar *variable);
gboolean g_setenv (const gchar *variable,
         const gchar *value,
         gboolean overwrite);
void g_unsetenv (const gchar *variable);
gchar** g_listenv (void);
const gchar* _g_getenv_nomalloc (const gchar *variable,
         gchar buffer[1024]);





typedef void (*GVoidFunc) (void);
void g_atexit (GVoidFunc func);
gchar* g_find_program_in_path (const gchar *program);



extern inline gint g_bit_nth_lsf (gulong mask,
           gint nth_bit);
extern inline gint g_bit_nth_msf (gulong mask,
           gint nth_bit);
extern inline guint g_bit_storage (gulong number);




typedef struct _GTrashStack GTrashStack;
struct _GTrashStack
{
  GTrashStack *next;
};

extern inline void g_trash_stack_push (GTrashStack **stack_p,
       gpointer data_p);
extern inline gpointer g_trash_stack_pop (GTrashStack **stack_p);
extern inline gpointer g_trash_stack_peek (GTrashStack **stack_p);
extern inline guint g_trash_stack_height (GTrashStack **stack_p);




extern inline gint
g_bit_nth_lsf (gulong mask,
        gint nth_bit)
{
  do
    {
      nth_bit++;
      if (mask & (1UL << nth_bit))
 return nth_bit;
    }
  while (nth_bit < ((4 * 8) - 1));
  return -1;
}
extern inline gint
g_bit_nth_msf (gulong mask,
        gint nth_bit)
{
  if (nth_bit < 0)
    nth_bit = 4 * 8;
  do
    {
      nth_bit--;
      if (mask & (1UL << nth_bit))
 return nth_bit;
    }
  while (nth_bit > 0);
  return -1;
}
extern inline guint
g_bit_storage (gulong number)
{
  register guint n_bits = 0;

  do
    {
      n_bits++;
      number >>= 1;
    }
  while (number);
  return n_bits;
}
extern inline void
g_trash_stack_push (GTrashStack **stack_p,
      gpointer data_p)
{
  GTrashStack *data = (GTrashStack *) data_p;

  data->next = *stack_p;
  *stack_p = data;
}
extern inline gpointer
g_trash_stack_pop (GTrashStack **stack_p)
{
  GTrashStack *data;

  data = *stack_p;
  if (data)
    {
      *stack_p = data->next;



      data->next = ((void *)0);
    }

  return data;
}
extern inline gpointer
g_trash_stack_peek (GTrashStack **stack_p)
{
  GTrashStack *data;

  data = *stack_p;

  return data;
}
extern inline guint
g_trash_stack_height (GTrashStack **stack_p)
{
  GTrashStack *data;
  guint i = 0;

  for (data = *stack_p; data; data = data->next)
    i++;

  return i;
}






extern const guint glib_major_version;
extern const guint glib_minor_version;
extern const guint glib_micro_version;
extern const guint glib_interface_age;
extern const guint glib_binary_age;

const gchar * glib_check_version (guint required_major,
                                  guint required_minor,
                                  guint required_micro);











typedef struct _GString GString;
typedef struct _GStringChunk GStringChunk;

struct _GString
{
  gchar *str;
  gsize len;
  gsize allocated_len;
};



GStringChunk* g_string_chunk_new (gsize size);
void g_string_chunk_free (GStringChunk *chunk);
gchar* g_string_chunk_insert (GStringChunk *chunk,
         const gchar *string);
gchar* g_string_chunk_insert_len (GStringChunk *chunk,
         const gchar *string,
         gssize len);
gchar* g_string_chunk_insert_const (GStringChunk *chunk,
         const gchar *string);




GString* g_string_new (const gchar *init);
GString* g_string_new_len (const gchar *init,
                                         gssize len);
GString* g_string_sized_new (gsize dfl_size);
gchar* g_string_free (GString *string,
      gboolean free_segment);
gboolean g_string_equal (const GString *v,
      const GString *v2);
guint g_string_hash (const GString *str);
GString* g_string_assign (GString *string,
      const gchar *rval);
GString* g_string_truncate (GString *string,
      gsize len);
GString* g_string_set_size (GString *string,
      gsize len);
GString* g_string_insert_len (GString *string,
                                         gssize pos,
                                         const gchar *val,
                                         gssize len);
GString* g_string_append (GString *string,
                    const gchar *val);
GString* g_string_append_len (GString *string,
                    const gchar *val,
                                         gssize len);
GString* g_string_append_c (GString *string,
      gchar c);
GString* g_string_append_unichar (GString *string,
      gunichar wc);
GString* g_string_prepend (GString *string,
      const gchar *val);
GString* g_string_prepend_c (GString *string,
      gchar c);
GString* g_string_prepend_unichar (GString *string,
      gunichar wc);
GString* g_string_prepend_len (GString *string,
                    const gchar *val,
                                         gssize len);
GString* g_string_insert (GString *string,
      gssize pos,
      const gchar *val);
GString* g_string_insert_c (GString *string,
      gssize pos,
      gchar c);
GString* g_string_insert_unichar (GString *string,
      gssize pos,
      gunichar wc);
GString* g_string_erase (GString *string,
      gssize pos,
      gssize len);
GString* g_string_ascii_down (GString *string);
GString* g_string_ascii_up (GString *string);
void g_string_printf (GString *string,
      const gchar *format,
      ...) __attribute__((__format__ (__printf__, 2, 3)));
void g_string_append_printf (GString *string,
      const gchar *format,
      ...) __attribute__((__format__ (__printf__, 2, 3)));



static inline GString*
g_string_append_c_inline (GString *gstring,
                          gchar c)
{
  if (gstring->len + 1 < gstring->allocated_len)
    {
      gstring->str[gstring->len++] = c;
      gstring->str[gstring->len] = 0;
    }
  else
    g_string_insert_c (gstring, -1, c);
  return gstring;
}







typedef struct _GIOChannel GIOChannel;
typedef struct _GIOFuncs GIOFuncs;

typedef enum
{
  G_IO_ERROR_NONE,
  G_IO_ERROR_AGAIN,
  G_IO_ERROR_INVAL,
  G_IO_ERROR_UNKNOWN
} GIOError;



typedef enum
{

  G_IO_CHANNEL_ERROR_FBIG,
  G_IO_CHANNEL_ERROR_INVAL,
  G_IO_CHANNEL_ERROR_IO,
  G_IO_CHANNEL_ERROR_ISDIR,
  G_IO_CHANNEL_ERROR_NOSPC,
  G_IO_CHANNEL_ERROR_NXIO,
  G_IO_CHANNEL_ERROR_OVERFLOW,
  G_IO_CHANNEL_ERROR_PIPE,

  G_IO_CHANNEL_ERROR_FAILED
} GIOChannelError;

typedef enum
{
  G_IO_STATUS_ERROR,
  G_IO_STATUS_NORMAL,
  G_IO_STATUS_EOF,
  G_IO_STATUS_AGAIN
} GIOStatus;

typedef enum
{
  G_SEEK_CUR,
  G_SEEK_SET,
  G_SEEK_END
} GSeekType;

typedef enum
{
  G_IO_IN =1,
  G_IO_OUT =4,
  G_IO_PRI =2,
  G_IO_ERR =8,
  G_IO_HUP =16,
  G_IO_NVAL =32
} GIOCondition;

typedef enum
{
  G_IO_FLAG_APPEND = 1 << 0,
  G_IO_FLAG_NONBLOCK = 1 << 1,
  G_IO_FLAG_IS_READABLE = 1 << 2,
  G_IO_FLAG_IS_WRITEABLE = 1 << 3,
  G_IO_FLAG_IS_SEEKABLE = 1 << 4,
  G_IO_FLAG_MASK = (1 << 5) - 1,
  G_IO_FLAG_GET_MASK = G_IO_FLAG_MASK,
  G_IO_FLAG_SET_MASK = G_IO_FLAG_APPEND | G_IO_FLAG_NONBLOCK
} GIOFlags;

struct _GIOChannel
{

  guint ref_count;
  GIOFuncs *funcs;

  gchar *encoding;
  GIConv read_cd;
  GIConv write_cd;
  gchar *line_term;
  guint line_term_len;

  gsize buf_size;
  GString *read_buf;
  GString *encoded_read_buf;
  GString *write_buf;
  gchar partial_write_buf[6];



  guint use_buffer : 1;
  guint do_encode : 1;
  guint close_on_unref : 1;
  guint is_readable : 1;
  guint is_writeable : 1;
  guint is_seekable : 1;

  gpointer reserved1;
  gpointer reserved2;
};

typedef gboolean (*GIOFunc) (GIOChannel *source,
        GIOCondition condition,
        gpointer data);
struct _GIOFuncs
{
  GIOStatus (*io_read) (GIOChannel *channel,
             gchar *buf,
      gsize count,
      gsize *bytes_read,
      GError **err);
  GIOStatus (*io_write) (GIOChannel *channel,
      const gchar *buf,
      gsize count,
      gsize *bytes_written,
      GError **err);
  GIOStatus (*io_seek) (GIOChannel *channel,
      gint64 offset,
      GSeekType type,
      GError **err);
  GIOStatus (*io_close) (GIOChannel *channel,
      GError **err);
  GSource* (*io_create_watch) (GIOChannel *channel,
      GIOCondition condition);
  void (*io_free) (GIOChannel *channel);
  GIOStatus (*io_set_flags) (GIOChannel *channel,
                                  GIOFlags flags,
      GError **err);
  GIOFlags (*io_get_flags) (GIOChannel *channel);
};

void g_io_channel_init (GIOChannel *channel);
GIOChannel *g_io_channel_ref (GIOChannel *channel);
void g_io_channel_unref (GIOChannel *channel);
GIOStatus g_io_channel_shutdown (GIOChannel *channel,
     gboolean flush,
     GError **err);
guint g_io_add_watch_full (GIOChannel *channel,
     gint priority,
     GIOCondition condition,
     GIOFunc func,
     gpointer user_data,
     GDestroyNotify notify);
GSource * g_io_create_watch (GIOChannel *channel,
     GIOCondition condition);
guint g_io_add_watch (GIOChannel *channel,
     GIOCondition condition,
     GIOFunc func,
     gpointer user_data);




void g_io_channel_set_buffer_size (GIOChannel *channel,
        gsize size);
gsize g_io_channel_get_buffer_size (GIOChannel *channel);
GIOCondition g_io_channel_get_buffer_condition (GIOChannel *channel);
GIOStatus g_io_channel_set_flags (GIOChannel *channel,
        GIOFlags flags,
        GError **error);
GIOFlags g_io_channel_get_flags (GIOChannel *channel);
void g_io_channel_set_line_term (GIOChannel *channel,
        const gchar *line_term,
        gint length);
const gchar* g_io_channel_get_line_term (GIOChannel *channel,
        gint *length);
void g_io_channel_set_buffered (GIOChannel *channel,
        gboolean buffered);
gboolean g_io_channel_get_buffered (GIOChannel *channel);
GIOStatus g_io_channel_set_encoding (GIOChannel *channel,
        const gchar *encoding,
        GError **error);
const gchar* g_io_channel_get_encoding (GIOChannel *channel);
void g_io_channel_set_close_on_unref (GIOChannel *channel,
        gboolean do_close);
gboolean g_io_channel_get_close_on_unref (GIOChannel *channel);


GIOStatus g_io_channel_flush (GIOChannel *channel,
        GError **error);
GIOStatus g_io_channel_read_line (GIOChannel *channel,
        gchar **str_return,
        gsize *length,
        gsize *terminator_pos,
        GError **error);
GIOStatus g_io_channel_read_line_string (GIOChannel *channel,
        GString *buffer,
        gsize *terminator_pos,
        GError **error);
GIOStatus g_io_channel_read_to_end (GIOChannel *channel,
        gchar **str_return,
        gsize *length,
        GError **error);
GIOStatus g_io_channel_read_chars (GIOChannel *channel,
        gchar *buf,
        gsize count,
        gsize *bytes_read,
        GError **error);
GIOStatus g_io_channel_read_unichar (GIOChannel *channel,
        gunichar *thechar,
        GError **error);
GIOStatus g_io_channel_write_chars (GIOChannel *channel,
        const gchar *buf,
        gssize count,
        gsize *bytes_written,
        GError **error);
GIOStatus g_io_channel_write_unichar (GIOChannel *channel,
        gunichar thechar,
        GError **error);
GIOStatus g_io_channel_seek_position (GIOChannel *channel,
        gint64 offset,
        GSeekType type,
        GError **error);




GIOChannel* g_io_channel_new_file (const gchar *filename,
        const gchar *mode,
        GError **error);



GQuark g_io_channel_error_quark (void);
GIOChannelError g_io_channel_error_from_errno (gint en);
GIOChannel* g_io_channel_unix_new (int fd);
gint g_io_channel_unix_get_fd (GIOChannel *channel);



extern GSourceFuncs g_io_watch_funcs;



typedef enum
{
  G_KEY_FILE_ERROR_UNKNOWN_ENCODING,
  G_KEY_FILE_ERROR_PARSE,
  G_KEY_FILE_ERROR_NOT_FOUND,
  G_KEY_FILE_ERROR_KEY_NOT_FOUND,
  G_KEY_FILE_ERROR_GROUP_NOT_FOUND,
  G_KEY_FILE_ERROR_INVALID_VALUE
} GKeyFileError;



GQuark g_key_file_error_quark (void);

typedef struct _GKeyFile GKeyFile;

typedef enum
{
  G_KEY_FILE_NONE = 0,
  G_KEY_FILE_KEEP_COMMENTS = 1 << 0,
  G_KEY_FILE_KEEP_TRANSLATIONS = 1 << 1
} GKeyFileFlags;

GKeyFile *g_key_file_new (void);
void g_key_file_free (GKeyFile *key_file);
void g_key_file_set_list_separator (GKeyFile *key_file,
          gchar separator);
gboolean g_key_file_load_from_file (GKeyFile *key_file,
          const gchar *file,
          GKeyFileFlags flags,
          GError **error);
gboolean g_key_file_load_from_data (GKeyFile *key_file,
          const gchar *data,
          gsize length,
          GKeyFileFlags flags,
          GError **error);
gboolean g_key_file_load_from_data_dirs (GKeyFile *key_file,
          const gchar *file,
          gchar **full_path,
          GKeyFileFlags flags,
          GError **error);
gchar *g_key_file_to_data (GKeyFile *key_file,
          gsize *length,
          GError **error) __attribute__((__malloc__));
gchar *g_key_file_get_start_group (GKeyFile *key_file) __attribute__((__malloc__));
gchar **g_key_file_get_groups (GKeyFile *key_file,
          gsize *length) __attribute__((__malloc__));
gchar **g_key_file_get_keys (GKeyFile *key_file,
          const gchar *group_name,
          gsize *length,
          GError **error) __attribute__((__malloc__));
gboolean g_key_file_has_group (GKeyFile *key_file,
          const gchar *group_name);
gboolean g_key_file_has_key (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          GError **error);
gchar *g_key_file_get_value (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          GError **error) __attribute__((__malloc__));
void g_key_file_set_value (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          const gchar *value);
gchar *g_key_file_get_string (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          GError **error) __attribute__((__malloc__));
void g_key_file_set_string (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          const gchar *string);
gchar *g_key_file_get_locale_string (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          const gchar *locale,
          GError **error) __attribute__((__malloc__));
void g_key_file_set_locale_string (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          const gchar *locale,
          const gchar *string);
gboolean g_key_file_get_boolean (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          GError **error);
void g_key_file_set_boolean (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          gboolean value);
gint g_key_file_get_integer (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          GError **error);
void g_key_file_set_integer (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          gint value);
gchar **g_key_file_get_string_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          gsize *length,
          GError **error) __attribute__((__malloc__));
void g_key_file_set_string_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          const gchar * const list[],
          gsize length);
gchar **g_key_file_get_locale_string_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          const gchar *locale,
          gsize *length,
          GError **error) __attribute__((__malloc__));
void g_key_file_set_locale_string_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          const gchar *locale,
          const gchar * const list[],
          gsize length);
gboolean *g_key_file_get_boolean_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          gsize *length,
          GError **error) __attribute__((__malloc__));
void g_key_file_set_boolean_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          gboolean list[],
          gsize length);
gint *g_key_file_get_integer_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          gsize *length,
          GError **error) __attribute__((__malloc__));
void g_key_file_set_integer_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          gint list[],
          gsize length);
void g_key_file_set_comment (GKeyFile *key_file,
                                             const gchar *group_name,
                                             const gchar *key,
                                             const gchar *comment,
                                             GError **error);
gchar *g_key_file_get_comment (GKeyFile *key_file,
                                             const gchar *group_name,
                                             const gchar *key,
                                             GError **error) __attribute__((__malloc__));

void g_key_file_remove_comment (GKeyFile *key_file,
                                             const gchar *group_name,
                                             const gchar *key,
          GError **error);
void g_key_file_remove_key (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          GError **error);
void g_key_file_remove_group (GKeyFile *key_file,
          const gchar *group_name,
          GError **error);







typedef struct _GMappedFile GMappedFile;

GMappedFile *g_mapped_file_new (const gchar *filename,
             gboolean writable,
             GError **error) __attribute__((__malloc__));
gsize g_mapped_file_get_length (GMappedFile *file);
gchar *g_mapped_file_get_contents (GMappedFile *file);
void g_mapped_file_free (GMappedFile *file);




typedef enum
{
  G_MARKUP_ERROR_BAD_UTF8,
  G_MARKUP_ERROR_EMPTY,
  G_MARKUP_ERROR_PARSE,



  G_MARKUP_ERROR_UNKNOWN_ELEMENT,
  G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE,
  G_MARKUP_ERROR_INVALID_CONTENT
} GMarkupError;



GQuark g_markup_error_quark (void);

typedef enum
{

  G_MARKUP_DO_NOT_USE_THIS_UNSUPPORTED_FLAG = 1 << 0

} GMarkupParseFlags;

typedef struct _GMarkupParseContext GMarkupParseContext;
typedef struct _GMarkupParser GMarkupParser;

struct _GMarkupParser
{

  void (*start_element) (GMarkupParseContext *context,
                          const gchar *element_name,
                          const gchar **attribute_names,
                          const gchar **attribute_values,
                          gpointer user_data,
                          GError **error);


  void (*end_element) (GMarkupParseContext *context,
                          const gchar *element_name,
                          gpointer user_data,
                          GError **error);



  void (*text) (GMarkupParseContext *context,
                          const gchar *text,
                          gsize text_len,
                          gpointer user_data,
                          GError **error);






  void (*passthrough) (GMarkupParseContext *context,
                          const gchar *passthrough_text,
                          gsize text_len,
                          gpointer user_data,
                          GError **error);




  void (*error) (GMarkupParseContext *context,
                          GError *error,
                          gpointer user_data);
};

GMarkupParseContext *g_markup_parse_context_new (const GMarkupParser *parser,
                                                   GMarkupParseFlags flags,
                                                   gpointer user_data,
                                                   GDestroyNotify user_data_dnotify);
void g_markup_parse_context_free (GMarkupParseContext *context);
gboolean g_markup_parse_context_parse (GMarkupParseContext *context,
                                                   const gchar *text,
                                                   gssize text_len,
                                                   GError **error);

gboolean g_markup_parse_context_end_parse (GMarkupParseContext *context,
                                                       GError **error);
const gchar *g_markup_parse_context_get_element (GMarkupParseContext *context);


void g_markup_parse_context_get_position (GMarkupParseContext *context,
                                                          gint *line_number,
                                                          gint *char_number);


gchar* g_markup_escape_text (const gchar *text,
                             gssize length);

gchar *g_markup_printf_escaped (const char *format,
    ...) __attribute__((__format__ (__printf__, 1, 2)));
gchar *g_markup_vprintf_escaped (const char *format,
     va_list args);



       






gsize g_printf_string_upper_bound (const gchar* format,
         va_list args);
typedef enum
{

  G_LOG_FLAG_RECURSION = 1 << 0,
  G_LOG_FLAG_FATAL = 1 << 1,


  G_LOG_LEVEL_ERROR = 1 << 2,
  G_LOG_LEVEL_CRITICAL = 1 << 3,
  G_LOG_LEVEL_WARNING = 1 << 4,
  G_LOG_LEVEL_MESSAGE = 1 << 5,
  G_LOG_LEVEL_INFO = 1 << 6,
  G_LOG_LEVEL_DEBUG = 1 << 7,

  G_LOG_LEVEL_MASK = ~(G_LOG_FLAG_RECURSION | G_LOG_FLAG_FATAL)
} GLogLevelFlags;




typedef void (*GLogFunc) (const gchar *log_domain,
                                                 GLogLevelFlags log_level,
                                                 const gchar *message,
                                                 gpointer user_data);



guint g_log_set_handler (const gchar *log_domain,
                                         GLogLevelFlags log_levels,
                                         GLogFunc log_func,
                                         gpointer user_data);
void g_log_remove_handler (const gchar *log_domain,
                                         guint handler_id);
void g_log_default_handler (const gchar *log_domain,
                                         GLogLevelFlags log_level,
                                         const gchar *message,
                                         gpointer unused_data);
GLogFunc g_log_set_default_handler (GLogFunc log_func,
        gpointer user_data);
void g_log (const gchar *log_domain,
                                         GLogLevelFlags log_level,
                                         const gchar *format,
                                         ...) __attribute__((__format__ (__printf__, 3, 4)));
void g_logv (const gchar *log_domain,
                                         GLogLevelFlags log_level,
                                         const gchar *format,
                                         va_list args);
GLogLevelFlags g_log_set_fatal_mask (const gchar *log_domain,
                                         GLogLevelFlags fatal_mask);
GLogLevelFlags g_log_set_always_fatal (GLogLevelFlags fatal_mask);


void _g_log_fallback_handler (const gchar *log_domain,
     GLogLevelFlags log_level,
     const gchar *message,
     gpointer unused_data) __attribute__((visibility("hidden")));


void g_return_if_fail_warning (const char *log_domain,
          const char *pretty_function,
          const char *expression);
void g_assert_warning (const char *log_domain,
          const char *file,
          const int line,
                 const char *pretty_function,
                 const char *expression) __attribute__((__noreturn__));
typedef void (*GPrintFunc) (const gchar *string);
void g_print (const gchar *format,
                                         ...) __attribute__((__format__ (__printf__, 1, 2)));
GPrintFunc g_set_print_handler (GPrintFunc func);
void g_printerr (const gchar *format,
                                         ...) __attribute__((__format__ (__printf__, 1, 2)));
GPrintFunc g_set_printerr_handler (GPrintFunc func);



typedef struct _GNode GNode;


typedef enum
{
  G_TRAVERSE_LEAVES = 1 << 0,
  G_TRAVERSE_NON_LEAVES = 1 << 1,
  G_TRAVERSE_ALL = G_TRAVERSE_LEAVES | G_TRAVERSE_NON_LEAVES,
  G_TRAVERSE_MASK = 0x03,
  G_TRAVERSE_LEAFS = G_TRAVERSE_LEAVES,
  G_TRAVERSE_NON_LEAFS = G_TRAVERSE_NON_LEAVES
} GTraverseFlags;


typedef enum
{
  G_IN_ORDER,
  G_PRE_ORDER,
  G_POST_ORDER,
  G_LEVEL_ORDER
} GTraverseType;

typedef gboolean (*GNodeTraverseFunc) (GNode *node,
       gpointer data);
typedef void (*GNodeForeachFunc) (GNode *node,
       gpointer data);
typedef gpointer (*GCopyFunc) (gconstpointer src,
                                                 gpointer data);



struct _GNode
{
  gpointer data;
  GNode *next;
  GNode *prev;
  GNode *parent;
  GNode *children;
};






GNode* g_node_new (gpointer data);
void g_node_destroy (GNode *root);
void g_node_unlink (GNode *node);
GNode* g_node_copy_deep (GNode *node,
     GCopyFunc copy_func,
     gpointer data);
GNode* g_node_copy (GNode *node);
GNode* g_node_insert (GNode *parent,
     gint position,
     GNode *node);
GNode* g_node_insert_before (GNode *parent,
     GNode *sibling,
     GNode *node);
GNode* g_node_insert_after (GNode *parent,
     GNode *sibling,
     GNode *node);
GNode* g_node_prepend (GNode *parent,
     GNode *node);
guint g_node_n_nodes (GNode *root,
     GTraverseFlags flags);
GNode* g_node_get_root (GNode *node);
gboolean g_node_is_ancestor (GNode *node,
     GNode *descendant);
guint g_node_depth (GNode *node);
GNode* g_node_find (GNode *root,
     GTraverseType order,
     GTraverseFlags flags,
     gpointer data);
void g_node_traverse (GNode *root,
     GTraverseType order,
     GTraverseFlags flags,
     gint max_depth,
     GNodeTraverseFunc func,
     gpointer data);






guint g_node_max_height (GNode *root);

void g_node_children_foreach (GNode *node,
      GTraverseFlags flags,
      GNodeForeachFunc func,
      gpointer data);
void g_node_reverse_children (GNode *node);
guint g_node_n_children (GNode *node);
GNode* g_node_nth_child (GNode *node,
      guint n);
GNode* g_node_last_child (GNode *node);
GNode* g_node_find_child (GNode *node,
      GTraverseFlags flags,
      gpointer data);
gint g_node_child_position (GNode *node,
      GNode *child);
gint g_node_child_index (GNode *node,
      gpointer data);

GNode* g_node_first_sibling (GNode *node);
GNode* g_node_last_sibling (GNode *node);



typedef struct _GOptionContext GOptionContext;
typedef struct _GOptionGroup GOptionGroup;
typedef struct _GOptionEntry GOptionEntry;

typedef enum
{
  G_OPTION_FLAG_HIDDEN = 1 << 0,
  G_OPTION_FLAG_IN_MAIN = 1 << 1,
  G_OPTION_FLAG_REVERSE = 1 << 2,
  G_OPTION_FLAG_NO_ARG = 1 << 3,
  G_OPTION_FLAG_FILENAME = 1 << 4,
  G_OPTION_FLAG_OPTIONAL_ARG = 1 << 5,
  G_OPTION_FLAG_NOALIAS = 1 << 6
} GOptionFlags;

typedef enum
{
  G_OPTION_ARG_NONE,
  G_OPTION_ARG_STRING,
  G_OPTION_ARG_INT,
  G_OPTION_ARG_CALLBACK,
  G_OPTION_ARG_FILENAME,
  G_OPTION_ARG_STRING_ARRAY,
  G_OPTION_ARG_FILENAME_ARRAY
} GOptionArg;

typedef gboolean (*GOptionArgFunc) (const gchar *option_name,
        const gchar *value,
        gpointer data,
        GError **error);

typedef gboolean (*GOptionParseFunc) (GOptionContext *context,
          GOptionGroup *group,
          gpointer data,
          GError **error);

typedef void (*GOptionErrorFunc) (GOptionContext *context,
      GOptionGroup *group,
      gpointer data,
      GError **error);



typedef enum
{
  G_OPTION_ERROR_UNKNOWN_OPTION,
  G_OPTION_ERROR_BAD_VALUE,
  G_OPTION_ERROR_FAILED
} GOptionError;

GQuark g_option_error_quark (void);


struct _GOptionEntry
{
  const gchar *long_name;
  gchar short_name;
  gint flags;

  GOptionArg arg;
  gpointer arg_data;

  const gchar *description;
  const gchar *arg_description;
};



GOptionContext *g_option_context_new (const gchar *parameter_string);
void g_option_context_free (GOptionContext *context);
void g_option_context_set_help_enabled (GOptionContext *context,
         gboolean help_enabled);
gboolean g_option_context_get_help_enabled (GOptionContext *context);
void g_option_context_set_ignore_unknown_options (GOptionContext *context,
            gboolean ignore_unknown);
gboolean g_option_context_get_ignore_unknown_options (GOptionContext *context);

void g_option_context_add_main_entries (GOptionContext *context,
         const GOptionEntry *entries,
         const gchar *translation_domain);
gboolean g_option_context_parse (GOptionContext *context,
         gint *argc,
         gchar ***argv,
         GError **error);

void g_option_context_add_group (GOptionContext *context,
            GOptionGroup *group);
void g_option_context_set_main_group (GOptionContext *context,
            GOptionGroup *group);
GOptionGroup *g_option_context_get_main_group (GOptionContext *context);


GOptionGroup *g_option_group_new (const gchar *name,
           const gchar *description,
           const gchar *help_description,
           gpointer user_data,
           GDestroyNotify destroy);
void g_option_group_set_parse_hooks (GOptionGroup *group,
           GOptionParseFunc pre_parse_func,
           GOptionParseFunc post_parse_func);
void g_option_group_set_error_hook (GOptionGroup *group,
           GOptionErrorFunc error_func);
void g_option_group_free (GOptionGroup *group);
void g_option_group_add_entries (GOptionGroup *group,
           const GOptionEntry *entries);
void g_option_group_set_translate_func (GOptionGroup *group,
           GTranslateFunc func,
           gpointer data,
           GDestroyNotify destroy_notify);
void g_option_group_set_translation_domain (GOptionGroup *group,
           const gchar *domain);






typedef struct _GPatternSpec GPatternSpec;

GPatternSpec* g_pattern_spec_new (const gchar *pattern);
void g_pattern_spec_free (GPatternSpec *pspec);
gboolean g_pattern_spec_equal (GPatternSpec *pspec1,
     GPatternSpec *pspec2);
gboolean g_pattern_match (GPatternSpec *pspec,
     guint string_length,
     const gchar *string,
     const gchar *string_reversed);
gboolean g_pattern_match_string (GPatternSpec *pspec,
     const gchar *string);
gboolean g_pattern_match_simple (const gchar *pattern,
     const gchar *string);



guint g_spaced_primes_closest (guint num) __attribute__((__const__));




void g_qsort_with_data (gconstpointer pbase,
   gint total_elems,
   gsize size,
   GCompareDataFunc compare_func,
   gpointer user_data);





typedef struct _GQueue GQueue;

struct _GQueue
{
  GList *head;
  GList *tail;
  guint length;
};



GQueue* g_queue_new (void);
void g_queue_free (GQueue *queue);
gboolean g_queue_is_empty (GQueue *queue);
guint g_queue_get_length (GQueue *queue);
void g_queue_reverse (GQueue *queue);
GQueue * g_queue_copy (GQueue *queue);
void g_queue_foreach (GQueue *queue,
     GFunc func,
     gpointer user_data);
GList * g_queue_find (GQueue *queue,
     gconstpointer data);
GList * g_queue_find_custom (GQueue *queue,
     gconstpointer data,
     GCompareFunc func);
void g_queue_sort (GQueue *queue,
     GCompareDataFunc compare_func,
     gpointer user_data);

void g_queue_push_head (GQueue *queue,
     gpointer data);
void g_queue_push_tail (GQueue *queue,
     gpointer data);
void g_queue_push_nth (GQueue *queue,
     gpointer data,
     gint n);
gpointer g_queue_pop_head (GQueue *queue);
gpointer g_queue_pop_tail (GQueue *queue);
gpointer g_queue_pop_nth (GQueue *queue,
     guint n);
gpointer g_queue_peek_head (GQueue *queue);
gpointer g_queue_peek_tail (GQueue *queue);
gpointer g_queue_peek_nth (GQueue *queue,
     guint n);
gint g_queue_index (GQueue *queue,
     gconstpointer data);
void g_queue_remove (GQueue *queue,
     gconstpointer data);
void g_queue_remove_all (GQueue *queue,
     gconstpointer data);
void g_queue_insert_before (GQueue *queue,
     GList *sibling,
     gpointer data);
void g_queue_insert_after (GQueue *queue,
     GList *sibling,
     gpointer data);
void g_queue_insert_sorted (GQueue *queue,
     gpointer data,
     GCompareDataFunc func,
     gpointer user_data);

void g_queue_push_head_link (GQueue *queue,
     GList *link_);
void g_queue_push_tail_link (GQueue *queue,
     GList *link_);
void g_queue_push_nth_link (GQueue *queue,
     gint n,
     GList *link_);
GList* g_queue_pop_head_link (GQueue *queue);
GList* g_queue_pop_tail_link (GQueue *queue);
GList* g_queue_pop_nth_link (GQueue *queue,
     guint n);
GList* g_queue_peek_head_link (GQueue *queue);
GList* g_queue_peek_tail_link (GQueue *queue);
GList* g_queue_peek_nth_link (GQueue *queue,
     guint n);
gint g_queue_link_index (GQueue *queue,
     GList *link_);
void g_queue_unlink (GQueue *queue,
     GList *link_);
void g_queue_delete_link (GQueue *queue,
     GList *link_);




typedef struct _GRand GRand;
GRand* g_rand_new_with_seed (guint32 seed);
GRand* g_rand_new_with_seed_array (const guint32 *seed,
        guint seed_length);
GRand* g_rand_new (void);
void g_rand_free (GRand *rand_);
GRand* g_rand_copy (GRand *rand_);
void g_rand_set_seed (GRand *rand_,
          guint32 seed);
void g_rand_set_seed_array (GRand *rand_,
          const guint32 *seed,
          guint seed_length);



guint32 g_rand_int (GRand *rand_);
gint32 g_rand_int_range (GRand *rand_,
          gint32 begin,
          gint32 end);
gdouble g_rand_double (GRand *rand_);
gdouble g_rand_double_range (GRand *rand_,
          gdouble begin,
          gdouble end);
void g_random_set_seed (guint32 seed);



guint32 g_random_int (void);
gint32 g_random_int_range (gint32 begin,
          gint32 end);
gdouble g_random_double (void);
gdouble g_random_double_range (gdouble begin,
          gdouble end);





typedef struct _GRelation GRelation;
typedef struct _GTuples GTuples;

struct _GTuples
{
  guint len;
};
GRelation* g_relation_new (gint fields);
void g_relation_destroy (GRelation *relation);
void g_relation_index (GRelation *relation,
                               gint field,
                               GHashFunc hash_func,
                               GEqualFunc key_equal_func);
void g_relation_insert (GRelation *relation,
                               ...);
gint g_relation_delete (GRelation *relation,
                               gconstpointer key,
                               gint field);
GTuples* g_relation_select (GRelation *relation,
                               gconstpointer key,
                               gint field);
gint g_relation_count (GRelation *relation,
                               gconstpointer key,
                               gint field);
gboolean g_relation_exists (GRelation *relation,
                               ...);
void g_relation_print (GRelation *relation);

void g_tuples_destroy (GTuples *tuples);
gpointer g_tuples_index (GTuples *tuples,
                               gint index_,
                               gint field);




typedef struct _GScanner GScanner;
typedef struct _GScannerConfig GScannerConfig;
typedef union _GTokenValue GTokenValue;

typedef void (*GScannerMsgFunc) (GScanner *scanner,
       gchar *message,
       gboolean error);
typedef enum
{
  G_ERR_UNKNOWN,
  G_ERR_UNEXP_EOF,
  G_ERR_UNEXP_EOF_IN_STRING,
  G_ERR_UNEXP_EOF_IN_COMMENT,
  G_ERR_NON_DIGIT_IN_CONST,
  G_ERR_DIGIT_RADIX,
  G_ERR_FLOAT_RADIX,
  G_ERR_FLOAT_MALFORMED
} GErrorType;


typedef enum
{
  G_TOKEN_EOF = 0,

  G_TOKEN_LEFT_PAREN = '(',
  G_TOKEN_RIGHT_PAREN = ')',
  G_TOKEN_LEFT_CURLY = '{',
  G_TOKEN_RIGHT_CURLY = '}',
  G_TOKEN_LEFT_BRACE = '[',
  G_TOKEN_RIGHT_BRACE = ']',
  G_TOKEN_EQUAL_SIGN = '=',
  G_TOKEN_COMMA = ',',

  G_TOKEN_NONE = 256,

  G_TOKEN_ERROR,

  G_TOKEN_CHAR,
  G_TOKEN_BINARY,
  G_TOKEN_OCTAL,
  G_TOKEN_INT,
  G_TOKEN_HEX,
  G_TOKEN_FLOAT,
  G_TOKEN_STRING,

  G_TOKEN_SYMBOL,
  G_TOKEN_IDENTIFIER,
  G_TOKEN_IDENTIFIER_NULL,

  G_TOKEN_COMMENT_SINGLE,
  G_TOKEN_COMMENT_MULTI,
  G_TOKEN_LAST
} GTokenType;

union _GTokenValue
{
  gpointer v_symbol;
  gchar *v_identifier;
  gulong v_binary;
  gulong v_octal;
  gulong v_int;
  guint64 v_int64;
  gdouble v_float;
  gulong v_hex;
  gchar *v_string;
  gchar *v_comment;
  guchar v_char;
  guint v_error;
};

struct _GScannerConfig
{


  gchar *cset_skip_characters;
  gchar *cset_identifier_first;
  gchar *cset_identifier_nth;
  gchar *cpair_comment_single;



  guint case_sensitive : 1;




  guint skip_comment_multi : 1;
  guint skip_comment_single : 1;
  guint scan_comment_multi : 1;
  guint scan_identifier : 1;
  guint scan_identifier_1char : 1;
  guint scan_identifier_NULL : 1;
  guint scan_symbols : 1;
  guint scan_binary : 1;
  guint scan_octal : 1;
  guint scan_float : 1;
  guint scan_hex : 1;
  guint scan_hex_dollar : 1;
  guint scan_string_sq : 1;
  guint scan_string_dq : 1;
  guint numbers_2_int : 1;
  guint int_2_float : 1;
  guint identifier_2_string : 1;
  guint char_2_token : 1;
  guint symbol_2_token : 1;
  guint scope_0_fallback : 1;
  guint store_int64 : 1;
  guint padding_dummy;
};

struct _GScanner
{

  gpointer user_data;
  guint max_parse_errors;


  guint parse_errors;


  const gchar *input_name;


  GData *qdata;


  GScannerConfig *config;


  GTokenType token;
  GTokenValue value;
  guint line;
  guint position;


  GTokenType next_token;
  GTokenValue next_value;
  guint next_line;
  guint next_position;


  GHashTable *symbol_table;
  gint input_fd;
  const gchar *text;
  const gchar *text_end;
  gchar *buffer;
  guint scope_id;


  GScannerMsgFunc msg_handler;
};

GScanner* g_scanner_new (const GScannerConfig *config_templ);
void g_scanner_destroy (GScanner *scanner);
void g_scanner_input_file (GScanner *scanner,
       gint input_fd);
void g_scanner_sync_file_offset (GScanner *scanner);
void g_scanner_input_text (GScanner *scanner,
       const gchar *text,
       guint text_len);
GTokenType g_scanner_get_next_token (GScanner *scanner);
GTokenType g_scanner_peek_next_token (GScanner *scanner);
GTokenType g_scanner_cur_token (GScanner *scanner);
GTokenValue g_scanner_cur_value (GScanner *scanner);
guint g_scanner_cur_line (GScanner *scanner);
guint g_scanner_cur_position (GScanner *scanner);
gboolean g_scanner_eof (GScanner *scanner);
guint g_scanner_set_scope (GScanner *scanner,
       guint scope_id);
void g_scanner_scope_add_symbol (GScanner *scanner,
       guint scope_id,
       const gchar *symbol,
       gpointer value);
void g_scanner_scope_remove_symbol (GScanner *scanner,
       guint scope_id,
       const gchar *symbol);
gpointer g_scanner_scope_lookup_symbol (GScanner *scanner,
       guint scope_id,
       const gchar *symbol);
void g_scanner_scope_foreach_symbol (GScanner *scanner,
       guint scope_id,
       GHFunc func,
       gpointer user_data);
gpointer g_scanner_lookup_symbol (GScanner *scanner,
       const gchar *symbol);
void g_scanner_unexp_token (GScanner *scanner,
       GTokenType expected_token,
       const gchar *identifier_spec,
       const gchar *symbol_spec,
       const gchar *symbol_name,
       const gchar *message,
       gint is_error);
void g_scanner_error (GScanner *scanner,
       const gchar *format,
       ...) __attribute__((__format__ (__printf__, 2, 3)));
void g_scanner_warn (GScanner *scanner,
       const gchar *format,
       ...) __attribute__((__format__ (__printf__, 2, 3)));





typedef enum
{

  G_SHELL_ERROR_BAD_QUOTING,

  G_SHELL_ERROR_EMPTY_STRING,
  G_SHELL_ERROR_FAILED
} GShellError;

GQuark g_shell_error_quark (void);

gchar* g_shell_quote (const gchar *unquoted_string);
gchar* g_shell_unquote (const gchar *quoted_string,
                             GError **error);
gboolean g_shell_parse_argv (const gchar *command_line,
                             gint *argcp,
                             gchar ***argvp,
                             GError **error);








typedef enum
{
  G_SPAWN_ERROR_FORK,
  G_SPAWN_ERROR_READ,
  G_SPAWN_ERROR_CHDIR,
  G_SPAWN_ERROR_ACCES,
  G_SPAWN_ERROR_PERM,
  G_SPAWN_ERROR_2BIG,
  G_SPAWN_ERROR_NOEXEC,
  G_SPAWN_ERROR_NAMETOOLONG,
  G_SPAWN_ERROR_NOENT,
  G_SPAWN_ERROR_NOMEM,
  G_SPAWN_ERROR_NOTDIR,
  G_SPAWN_ERROR_LOOP,
  G_SPAWN_ERROR_TXTBUSY,
  G_SPAWN_ERROR_IO,
  G_SPAWN_ERROR_NFILE,
  G_SPAWN_ERROR_MFILE,
  G_SPAWN_ERROR_INVAL,
  G_SPAWN_ERROR_ISDIR,
  G_SPAWN_ERROR_LIBBAD,
  G_SPAWN_ERROR_FAILED


} GSpawnError;

typedef void (* GSpawnChildSetupFunc) (gpointer user_data);

typedef enum
{
  G_SPAWN_LEAVE_DESCRIPTORS_OPEN = 1 << 0,
  G_SPAWN_DO_NOT_REAP_CHILD = 1 << 1,

  G_SPAWN_SEARCH_PATH = 1 << 2,

  G_SPAWN_STDOUT_TO_DEV_NULL = 1 << 3,
  G_SPAWN_STDERR_TO_DEV_NULL = 1 << 4,
  G_SPAWN_CHILD_INHERITS_STDIN = 1 << 5,
  G_SPAWN_FILE_AND_ARGV_ZERO = 1 << 6
} GSpawnFlags;

GQuark g_spawn_error_quark (void);
gboolean g_spawn_async (const gchar *working_directory,
                        gchar **argv,
                        gchar **envp,
                        GSpawnFlags flags,
                        GSpawnChildSetupFunc child_setup,
                        gpointer user_data,
                        GPid *child_pid,
                        GError **error);





gboolean g_spawn_async_with_pipes (const gchar *working_directory,
                                   gchar **argv,
                                   gchar **envp,
                                   GSpawnFlags flags,
                                   GSpawnChildSetupFunc child_setup,
                                   gpointer user_data,
                                   GPid *child_pid,
                                   gint *standard_input,
                                   gint *standard_output,
                                   gint *standard_error,
                                   GError **error);






gboolean g_spawn_sync (const gchar *working_directory,
                               gchar **argv,
                               gchar **envp,
                               GSpawnFlags flags,
                               GSpawnChildSetupFunc child_setup,
                               gpointer user_data,
                               gchar **standard_output,
                               gchar **standard_error,
                               gint *exit_status,
                               GError **error);

gboolean g_spawn_command_line_sync (const gchar *command_line,
                                     gchar **standard_output,
                                     gchar **standard_error,
                                     gint *exit_status,
                                     GError **error);
gboolean g_spawn_command_line_async (const gchar *command_line,
                                     GError **error);

void g_spawn_close_pid (GPid pid);






typedef enum {
  G_ASCII_ALNUM = 1 << 0,
  G_ASCII_ALPHA = 1 << 1,
  G_ASCII_CNTRL = 1 << 2,
  G_ASCII_DIGIT = 1 << 3,
  G_ASCII_GRAPH = 1 << 4,
  G_ASCII_LOWER = 1 << 5,
  G_ASCII_PRINT = 1 << 6,
  G_ASCII_PUNCT = 1 << 7,
  G_ASCII_SPACE = 1 << 8,
  G_ASCII_UPPER = 1 << 9,
  G_ASCII_XDIGIT = 1 << 10
} GAsciiType;

extern const guint16 * const g_ascii_table;
gchar g_ascii_tolower (gchar c) __attribute__((__const__));
gchar g_ascii_toupper (gchar c) __attribute__((__const__));

gint g_ascii_digit_value (gchar c) __attribute__((__const__));
gint g_ascii_xdigit_value (gchar c) __attribute__((__const__));





gchar* g_strdelimit (gchar *string,
     const gchar *delimiters,
     gchar new_delimiter);
gchar* g_strcanon (gchar *string,
     const gchar *valid_chars,
     gchar substitutor);
const gchar* g_strerror (gint errnum) __attribute__((__const__));
const gchar* g_strsignal (gint signum) __attribute__((__const__));
gchar* g_strreverse (gchar *string);
gsize g_strlcpy (gchar *dest,
     const gchar *src,
     gsize dest_size);
gsize g_strlcat (gchar *dest,
     const gchar *src,
     gsize dest_size);
gchar * g_strstr_len (const gchar *haystack,
     gssize haystack_len,
     const gchar *needle);
gchar * g_strrstr (const gchar *haystack,
     const gchar *needle);
gchar * g_strrstr_len (const gchar *haystack,
     gssize haystack_len,
     const gchar *needle);

gboolean g_str_has_suffix (const gchar *str,
     const gchar *suffix);
gboolean g_str_has_prefix (const gchar *str,
     const gchar *prefix);



gdouble g_strtod (const gchar *nptr,
     gchar **endptr);
gdouble g_ascii_strtod (const gchar *nptr,
     gchar **endptr);
guint64 g_ascii_strtoull (const gchar *nptr,
     gchar **endptr,
     guint base);




gchar * g_ascii_dtostr (gchar *buffer,
     gint buf_len,
     gdouble d);
gchar * g_ascii_formatd (gchar *buffer,
     gint buf_len,
     const gchar *format,
     gdouble d);


gchar* g_strchug (gchar *string);

gchar* g_strchomp (gchar *string);



gint g_ascii_strcasecmp (const gchar *s1,
        const gchar *s2);
gint g_ascii_strncasecmp (const gchar *s1,
        const gchar *s2,
        gsize n);
gchar* g_ascii_strdown (const gchar *str,
        gssize len) __attribute__((__malloc__));
gchar* g_ascii_strup (const gchar *str,
        gssize len) __attribute__((__malloc__));
gchar* g_strdup (const gchar *str) __attribute__((__malloc__));
gchar* g_strdup_printf (const gchar *format,
     ...) __attribute__((__format__ (__printf__, 1, 2))) __attribute__((__malloc__));
gchar* g_strdup_vprintf (const gchar *format,
     va_list args) __attribute__((__malloc__));
gchar* g_strndup (const gchar *str,
     gsize n) __attribute__((__malloc__));
gchar* g_strnfill (gsize length,
     gchar fill_char) __attribute__((__malloc__));
gchar* g_strconcat (const gchar *string1,
     ...) __attribute__((__malloc__)) __attribute__((__sentinel__));
gchar* g_strjoin (const gchar *separator,
     ...) __attribute__((__malloc__)) __attribute__((__sentinel__));





gchar* g_strcompress (const gchar *source) __attribute__((__malloc__));
gchar* g_strescape (const gchar *source,
     const gchar *exceptions) __attribute__((__malloc__));

gpointer g_memdup (gconstpointer mem,
     guint byte_size) __attribute__((__malloc__));
gchar** g_strsplit (const gchar *string,
     const gchar *delimiter,
     gint max_tokens) __attribute__((__malloc__));
gchar ** g_strsplit_set (const gchar *string,
     const gchar *delimiters,
     gint max_tokens) __attribute__((__malloc__));
gchar* g_strjoinv (const gchar *separator,
     gchar **str_array) __attribute__((__malloc__));
void g_strfreev (gchar **str_array);
gchar** g_strdupv (gchar **str_array) __attribute__((__malloc__));
guint g_strv_length (gchar **str_array);

gchar* g_stpcpy (gchar *dest,
                                        const char *src);

const gchar *g_strip_context (const gchar *msgid,
     const gchar *msgval);






typedef struct _GThreadPool GThreadPool;






struct _GThreadPool
{
  GFunc func;
  gpointer user_data;
  gboolean exclusive;
};






GThreadPool* g_thread_pool_new (GFunc func,
                                               gpointer user_data,
                                               gint max_threads,
                                               gboolean exclusive,
                                               GError **error);





void g_thread_pool_push (GThreadPool *pool,
                                               gpointer data,
                                               GError **error);




void g_thread_pool_set_max_threads (GThreadPool *pool,
                                               gint max_threads,
                                               GError **error);
gint g_thread_pool_get_max_threads (GThreadPool *pool);



guint g_thread_pool_get_num_threads (GThreadPool *pool);


guint g_thread_pool_unprocessed (GThreadPool *pool);





void g_thread_pool_free (GThreadPool *pool,
                                               gboolean immediate,
                                               gboolean wait);



void g_thread_pool_set_max_unused_threads (gint max_threads);
gint g_thread_pool_get_max_unused_threads (void);
guint g_thread_pool_get_num_unused_threads (void);


void g_thread_pool_stop_unused_threads (void);


void g_thread_pool_set_sort_function (GThreadPool *pool,
                                        GCompareDataFunc func,
            gpointer user_data);


void g_thread_pool_set_max_idle_time (guint interval);
guint g_thread_pool_get_max_idle_time (void);








typedef struct _GTimer GTimer;



GTimer* g_timer_new (void);
void g_timer_destroy (GTimer *timer);
void g_timer_start (GTimer *timer);
void g_timer_stop (GTimer *timer);
void g_timer_reset (GTimer *timer);
void g_timer_continue (GTimer *timer);
gdouble g_timer_elapsed (GTimer *timer,
    gulong *microseconds);

void g_usleep (gulong microseconds);

void g_time_val_add (GTimeVal *time_,
                         glong microseconds);




typedef struct _GTree GTree;

typedef gboolean (*GTraverseFunc) (gpointer key,
                                   gpointer value,
                                   gpointer data);



GTree* g_tree_new (GCompareFunc key_compare_func);
GTree* g_tree_new_with_data (GCompareDataFunc key_compare_func,
                                 gpointer key_compare_data);
GTree* g_tree_new_full (GCompareDataFunc key_compare_func,
                                 gpointer key_compare_data,
                                 GDestroyNotify key_destroy_func,
                                 GDestroyNotify value_destroy_func);
void g_tree_destroy (GTree *tree);
void g_tree_insert (GTree *tree,
                                 gpointer key,
                                 gpointer value);
void g_tree_replace (GTree *tree,
                                 gpointer key,
                                 gpointer value);
gboolean g_tree_remove (GTree *tree,
                                 gconstpointer key);
gboolean g_tree_steal (GTree *tree,
                                 gconstpointer key);
gpointer g_tree_lookup (GTree *tree,
                                 gconstpointer key);
gboolean g_tree_lookup_extended (GTree *tree,
                                 gconstpointer lookup_key,
                                 gpointer *orig_key,
                                 gpointer *value);
void g_tree_foreach (GTree *tree,
                                 GTraverseFunc func,
                                 gpointer user_data);
gpointer g_tree_search (GTree *tree,
                                 GCompareFunc search_func,
                                 gconstpointer user_data);
gint g_tree_height (GTree *tree);
gint g_tree_nnodes (GTree *tree);













enum {
 CORBA_FALSE = (0),
 CORBA_TRUE = (!(0))
};

typedef gint16 CORBA_short;
typedef gint32 CORBA_long;
typedef guint16 CORBA_unsigned_short;
typedef guint32 CORBA_unsigned_long;
typedef gfloat CORBA_float;
typedef gdouble CORBA_double;
typedef char CORBA_char;
typedef gunichar2 CORBA_wchar;
typedef guchar CORBA_boolean;
typedef guchar CORBA_octet;
typedef gdouble CORBA_long_double;




typedef CORBA_char *CORBA_string;
typedef CORBA_wchar *CORBA_wstring;




typedef struct CORBA_Object_type *CORBA_Object;
typedef gint64 CORBA_long_long;
typedef guint64 CORBA_unsigned_long_long;











typedef enum {
 ORBIT_GENUID_STRONG,
 ORBIT_GENUID_SIMPLE
} ORBitGenUidType;

typedef enum {
 ORBIT_GENUID_COOKIE,
 ORBIT_GENUID_OBJECT_ID
} ORBitGenUidRole;

gboolean ORBit_genuid_init (ORBitGenUidType type);
void ORBit_genuid_fini (void);
void ORBit_genuid_buffer (guint8 *buffer,
         int length,
         ORBitGenUidRole role);






gulong ORBit_wchar_strlen(CORBA_wchar *wstr);











typedef gulong GType;



typedef struct _GValue GValue;
typedef union _GTypeCValue GTypeCValue;
typedef struct _GTypePlugin GTypePlugin;
typedef struct _GTypeClass GTypeClass;
typedef struct _GTypeInterface GTypeInterface;
typedef struct _GTypeInstance GTypeInstance;
typedef struct _GTypeInfo GTypeInfo;
typedef struct _GTypeFundamentalInfo GTypeFundamentalInfo;
typedef struct _GInterfaceInfo GInterfaceInfo;
typedef struct _GTypeValueTable GTypeValueTable;
typedef struct _GTypeQuery GTypeQuery;




struct _GTypeClass
{

  GType g_type;
};
struct _GTypeInstance
{

  GTypeClass *g_class;
};
struct _GTypeInterface
{

  GType g_type;
  GType g_instance_type;
};
struct _GTypeQuery
{
  GType type;
  const gchar *type_name;
  guint class_size;
  guint instance_size;
};
typedef enum
{
  G_TYPE_DEBUG_NONE = 0,
  G_TYPE_DEBUG_OBJECTS = 1 << 0,
  G_TYPE_DEBUG_SIGNALS = 1 << 1,
  G_TYPE_DEBUG_MASK = 0x03
} GTypeDebugFlags;



void g_type_init (void);
void g_type_init_with_debug_flags (GTypeDebugFlags debug_flags);
const gchar* g_type_name (GType type);
GQuark g_type_qname (GType type);
GType g_type_from_name (const gchar *name);
GType g_type_parent (GType type);
guint g_type_depth (GType type);
GType g_type_next_base (GType leaf_type,
            GType root_type);
gboolean g_type_is_a (GType type,
            GType is_a_type);
gpointer g_type_class_ref (GType type);
gpointer g_type_class_peek (GType type);
gpointer g_type_class_peek_static (GType type);
void g_type_class_unref (gpointer g_class);
gpointer g_type_class_peek_parent (gpointer g_class);
gpointer g_type_interface_peek (gpointer instance_class,
            GType iface_type);
gpointer g_type_interface_peek_parent (gpointer g_iface);

gpointer g_type_default_interface_ref (GType g_type);
gpointer g_type_default_interface_peek (GType g_type);
void g_type_default_interface_unref (gpointer g_iface);


GType* g_type_children (GType type,
            guint *n_children);
GType* g_type_interfaces (GType type,
            guint *n_interfaces);


void g_type_set_qdata (GType type,
            GQuark quark,
            gpointer data);
gpointer g_type_get_qdata (GType type,
            GQuark quark);
void g_type_query (GType type,
            GTypeQuery *query);



typedef void (*GBaseInitFunc) (gpointer g_class);
typedef void (*GBaseFinalizeFunc) (gpointer g_class);
typedef void (*GClassInitFunc) (gpointer g_class,
           gpointer class_data);
typedef void (*GClassFinalizeFunc) (gpointer g_class,
           gpointer class_data);
typedef void (*GInstanceInitFunc) (GTypeInstance *instance,
           gpointer g_class);
typedef void (*GInterfaceInitFunc) (gpointer g_iface,
           gpointer iface_data);
typedef void (*GInterfaceFinalizeFunc) (gpointer g_iface,
           gpointer iface_data);
typedef gboolean (*GTypeClassCacheFunc) (gpointer cache_data,
           GTypeClass *g_class);
typedef void (*GTypeInterfaceCheckFunc) (gpointer check_data,
           gpointer g_iface);
typedef enum
{
  G_TYPE_FLAG_CLASSED = (1 << 0),
  G_TYPE_FLAG_INSTANTIATABLE = (1 << 1),
  G_TYPE_FLAG_DERIVABLE = (1 << 2),
  G_TYPE_FLAG_DEEP_DERIVABLE = (1 << 3)
} GTypeFundamentalFlags;
typedef enum
{
  G_TYPE_FLAG_ABSTRACT = (1 << 4),
  G_TYPE_FLAG_VALUE_ABSTRACT = (1 << 5)
} GTypeFlags;
struct _GTypeInfo
{

  guint16 class_size;

  GBaseInitFunc base_init;
  GBaseFinalizeFunc base_finalize;


  GClassInitFunc class_init;
  GClassFinalizeFunc class_finalize;
  gconstpointer class_data;


  guint16 instance_size;
  guint16 n_preallocs;
  GInstanceInitFunc instance_init;


  const GTypeValueTable *value_table;
};
struct _GTypeFundamentalInfo
{
  GTypeFundamentalFlags type_flags;
};
struct _GInterfaceInfo
{
  GInterfaceInitFunc interface_init;
  GInterfaceFinalizeFunc interface_finalize;
  gpointer interface_data;
};
struct _GTypeValueTable
{
  void (*value_init) (GValue *value);
  void (*value_free) (GValue *value);
  void (*value_copy) (const GValue *src_value,
      GValue *dest_value);

  gpointer (*value_peek_pointer) (const GValue *value);
  gchar *collect_format;
  gchar* (*collect_value) (GValue *value,
      guint n_collect_values,
      GTypeCValue *collect_values,
      guint collect_flags);
  gchar *lcopy_format;
  gchar* (*lcopy_value) (const GValue *value,
      guint n_collect_values,
      GTypeCValue *collect_values,
      guint collect_flags);
};
GType g_type_register_static (GType parent_type,
      const gchar *type_name,
      const GTypeInfo *info,
      GTypeFlags flags);
GType g_type_register_dynamic (GType parent_type,
      const gchar *type_name,
      GTypePlugin *plugin,
      GTypeFlags flags);
GType g_type_register_fundamental (GType type_id,
      const gchar *type_name,
      const GTypeInfo *info,
      const GTypeFundamentalInfo *finfo,
      GTypeFlags flags);
void g_type_add_interface_static (GType instance_type,
      GType interface_type,
      const GInterfaceInfo *info);
void g_type_add_interface_dynamic (GType instance_type,
      GType interface_type,
      GTypePlugin *plugin);
void g_type_interface_add_prerequisite (GType interface_type,
      GType prerequisite_type);
GType*g_type_interface_prerequisites (GType interface_type,
      guint *n_prerequisites);
void g_type_class_add_private (gpointer g_class,
                                         gsize private_size);
gpointer g_type_instance_get_private (GTypeInstance *instance,
                                         GType private_type);
GTypePlugin* g_type_get_plugin (GType type);
GTypePlugin* g_type_interface_get_plugin (GType instance_type,
       GType interface_type);
GType g_type_fundamental_next (void);
GType g_type_fundamental (GType type_id);
GTypeInstance* g_type_create_instance (GType type);
void g_type_free_instance (GTypeInstance *instance);

void g_type_add_class_cache_func (gpointer cache_data,
       GTypeClassCacheFunc cache_func);
void g_type_remove_class_cache_func (gpointer cache_data,
       GTypeClassCacheFunc cache_func);
void g_type_class_unref_uncached (gpointer g_class);

void g_type_add_interface_check (gpointer check_data,
       GTypeInterfaceCheckFunc check_func);
void g_type_remove_interface_check (gpointer check_data,
       GTypeInterfaceCheckFunc check_func);

GTypeValueTable* g_type_value_table_peek (GType type);



gboolean g_type_check_instance (GTypeInstance *instance);
GTypeInstance* g_type_check_instance_cast (GTypeInstance *instance,
       GType iface_type);
gboolean g_type_check_instance_is_a (GTypeInstance *instance,
       GType iface_type);
GTypeClass* g_type_check_class_cast (GTypeClass *g_class,
       GType is_a_type);
gboolean g_type_check_class_is_a (GTypeClass *g_class,
       GType is_a_type);
gboolean g_type_check_is_value_type (GType type);
gboolean g_type_check_value (GValue *value);
gboolean g_type_check_value_holds (GValue *value,
       GType type);
gboolean g_type_test_flags (GType type,
       guint flags);



const gchar* g_type_name_from_instance (GTypeInstance *instance);
const gchar* g_type_name_from_class (GTypeClass *g_class);



void g_value_c_init (void) __attribute__((visibility("hidden")));
void g_value_types_init (void) __attribute__((visibility("hidden")));
void g_enum_types_init (void) __attribute__((visibility("hidden")));
void g_param_type_init (void) __attribute__((visibility("hidden")));
void g_boxed_type_init (void) __attribute__((visibility("hidden")));
void g_object_type_init (void) __attribute__((visibility("hidden")));
void g_param_spec_types_init (void) __attribute__((visibility("hidden")));
void g_value_transforms_init (void) __attribute__((visibility("hidden")));
void g_signal_init (void) __attribute__((visibility("hidden")));
extern GTypeDebugFlags _g_type_debug_flags;











typedef gpointer (*GBoxedCopyFunc) (gpointer boxed);
typedef void (*GBoxedFreeFunc) (gpointer boxed);



gpointer g_boxed_copy (GType boxed_type,
       gconstpointer src_boxed);
void g_boxed_free (GType boxed_type,
       gpointer boxed);
void g_value_set_boxed (GValue *value,
       gconstpointer v_boxed);
void g_value_set_static_boxed (GValue *value,
       gconstpointer v_boxed);
gpointer g_value_get_boxed (const GValue *value);
gpointer g_value_dup_boxed (const GValue *value);



GType g_boxed_type_register_static (const gchar *name,
       GBoxedCopyFunc boxed_copy,
       GBoxedFreeFunc boxed_free);
void g_value_take_boxed (GValue *value,
     gconstpointer v_boxed);




GType g_closure_get_type (void) __attribute__((__const__));
GType g_value_get_type (void) __attribute__((__const__));
GType g_value_array_get_type (void) __attribute__((__const__));
GType g_date_get_type (void) __attribute__((__const__));
GType g_strv_get_type (void) __attribute__((__const__));
GType g_gstring_get_type (void) __attribute__((__const__));
GType g_hash_table_get_type (void) __attribute__((__const__));

typedef gchar** GStrv;




typedef struct _GEnumClass GEnumClass;
typedef struct _GFlagsClass GFlagsClass;
typedef struct _GEnumValue GEnumValue;
typedef struct _GFlagsValue GFlagsValue;
struct _GEnumClass
{
  GTypeClass g_type_class;


  gint minimum;
  gint maximum;
  guint n_values;
  GEnumValue *values;
};
struct _GFlagsClass
{
  GTypeClass g_type_class;


  guint mask;
  guint n_values;
  GFlagsValue *values;
};
struct _GEnumValue
{
  gint value;
  gchar *value_name;
  gchar *value_nick;
};
struct _GFlagsValue
{
  guint value;
  gchar *value_name;
  gchar *value_nick;
};



GEnumValue* g_enum_get_value (GEnumClass *enum_class,
       gint value);
GEnumValue* g_enum_get_value_by_name (GEnumClass *enum_class,
       const gchar *name);
GEnumValue* g_enum_get_value_by_nick (GEnumClass *enum_class,
       const gchar *nick);
GFlagsValue* g_flags_get_first_value (GFlagsClass *flags_class,
       guint value);
GFlagsValue* g_flags_get_value_by_name (GFlagsClass *flags_class,
       const gchar *name);
GFlagsValue* g_flags_get_value_by_nick (GFlagsClass *flags_class,
       const gchar *nick);
void g_value_set_enum (GValue *value,
       gint v_enum);
gint g_value_get_enum (const GValue *value);
void g_value_set_flags (GValue *value,
       guint v_flags);
guint g_value_get_flags (const GValue *value);







GType g_enum_register_static (const gchar *name,
        const GEnumValue *const_static_values);
GType g_flags_register_static (const gchar *name,
        const GFlagsValue *const_static_values);



void g_enum_complete_type_info (GType g_enum_type,
        GTypeInfo *info,
        const GEnumValue *const_values);
void g_flags_complete_type_info (GType g_flags_type,
        GTypeInfo *info,
        const GFlagsValue *const_values);




typedef void (*GValueTransform) (const GValue *src_value,
     GValue *dest_value);
struct _GValue
{

  GType g_type;


  union {
    gint v_int;
    guint v_uint;
    glong v_long;
    gulong v_ulong;
    gint64 v_int64;
    guint64 v_uint64;
    gfloat v_float;
    gdouble v_double;
    gpointer v_pointer;
  } data[2];
};



GValue* g_value_init (GValue *value,
      GType g_type);
void g_value_copy (const GValue *src_value,
      GValue *dest_value);
GValue* g_value_reset (GValue *value);
void g_value_unset (GValue *value);
void g_value_set_instance (GValue *value,
      gpointer instance);



gboolean g_value_fits_pointer (const GValue *value);
gpointer g_value_peek_pointer (const GValue *value);



gboolean g_value_type_compatible (GType src_type,
      GType dest_type);
gboolean g_value_type_transformable (GType src_type,
      GType dest_type);
gboolean g_value_transform (const GValue *src_value,
      GValue *dest_value);
void g_value_register_transform_func (GType src_type,
      GType dest_type,
      GValueTransform transform_func);






typedef enum
{
  G_PARAM_READABLE = 1 << 0,
  G_PARAM_WRITABLE = 1 << 1,
  G_PARAM_CONSTRUCT = 1 << 2,
  G_PARAM_CONSTRUCT_ONLY = 1 << 3,
  G_PARAM_LAX_VALIDATION = 1 << 4,
  G_PARAM_STATIC_NAME = 1 << 5,



  G_PARAM_STATIC_NICK = 1 << 6,
  G_PARAM_STATIC_BLURB = 1 << 7
} GParamFlags;







typedef struct _GParamSpec GParamSpec;
typedef struct _GParamSpecClass GParamSpecClass;
typedef struct _GParameter GParameter;
typedef struct _GParamSpecPool GParamSpecPool;
struct _GParamSpec
{
  GTypeInstance g_type_instance;

  gchar *name;
  GParamFlags flags;
  GType value_type;
  GType owner_type;


  gchar *_nick;
  gchar *_blurb;
  GData *qdata;
  guint ref_count;
  guint param_id;
};
struct _GParamSpecClass
{
  GTypeClass g_type_class;

  GType value_type;

  void (*finalize) (GParamSpec *pspec);


  void (*value_set_default) (GParamSpec *pspec,
      GValue *value);
  gboolean (*value_validate) (GParamSpec *pspec,
      GValue *value);
  gint (*values_cmp) (GParamSpec *pspec,
      const GValue *value1,
      const GValue *value2);

  gpointer dummy[4];
};
struct _GParameter
{
  const gchar *name;
  GValue value;
};



GParamSpec* g_param_spec_ref (GParamSpec *pspec);
void g_param_spec_unref (GParamSpec *pspec);
void g_param_spec_sink (GParamSpec *pspec);
GParamSpec* g_param_spec_ref_sink (GParamSpec *pspec);
gpointer g_param_spec_get_qdata (GParamSpec *pspec,
       GQuark quark);
void g_param_spec_set_qdata (GParamSpec *pspec,
       GQuark quark,
       gpointer data);
void g_param_spec_set_qdata_full (GParamSpec *pspec,
       GQuark quark,
       gpointer data,
       GDestroyNotify destroy);
gpointer g_param_spec_steal_qdata (GParamSpec *pspec,
       GQuark quark);
GParamSpec* g_param_spec_get_redirect_target (GParamSpec *pspec);

void g_param_value_set_default (GParamSpec *pspec,
       GValue *value);
gboolean g_param_value_defaults (GParamSpec *pspec,
       GValue *value);
gboolean g_param_value_validate (GParamSpec *pspec,
       GValue *value);
gboolean g_param_value_convert (GParamSpec *pspec,
       const GValue *src_value,
       GValue *dest_value,
       gboolean strict_validation);
gint g_param_values_cmp (GParamSpec *pspec,
       const GValue *value1,
       const GValue *value2);
const gchar* g_param_spec_get_name (GParamSpec *pspec);
const gchar* g_param_spec_get_nick (GParamSpec *pspec);
const gchar* g_param_spec_get_blurb (GParamSpec *pspec);
void g_value_set_param (GValue *value,
       GParamSpec *param);
GParamSpec* g_value_get_param (const GValue *value);
GParamSpec* g_value_dup_param (const GValue *value);


void g_value_take_param (GValue *value,
              GParamSpec *param);






typedef struct _GParamSpecTypeInfo GParamSpecTypeInfo;
struct _GParamSpecTypeInfo
{

  guint16 instance_size;
  guint16 n_preallocs;
  void (*instance_init) (GParamSpec *pspec);


  GType value_type;
  void (*finalize) (GParamSpec *pspec);
  void (*value_set_default) (GParamSpec *pspec,
      GValue *value);
  gboolean (*value_validate) (GParamSpec *pspec,
      GValue *value);
  gint (*values_cmp) (GParamSpec *pspec,
      const GValue *value1,
      const GValue *value2);
};
GType g_param_type_register_static (const gchar *name,
      const GParamSpecTypeInfo *pspec_info);


GType _g_param_type_register_static_constant (const gchar *name,
            const GParamSpecTypeInfo *pspec_info,
            GType opt_type);



gpointer g_param_spec_internal (GType param_type,
       const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       GParamFlags flags);
GParamSpecPool* g_param_spec_pool_new (gboolean type_prefixing);
void g_param_spec_pool_insert (GParamSpecPool *pool,
       GParamSpec *pspec,
       GType owner_type);
void g_param_spec_pool_remove (GParamSpecPool *pool,
       GParamSpec *pspec);
GParamSpec* g_param_spec_pool_lookup (GParamSpecPool *pool,
       const gchar *param_name,
       GType owner_type,
       gboolean walk_ancestors);
GList* g_param_spec_pool_list_owned (GParamSpecPool *pool,
       GType owner_type);
GParamSpec** g_param_spec_pool_list (GParamSpecPool *pool,
       GType owner_type,
       guint *n_pspecs_p);



typedef struct _GClosure GClosure;
typedef struct _GClosureNotifyData GClosureNotifyData;
typedef void (*GCallback) (void);
typedef void (*GClosureNotify) (gpointer data,
      GClosure *closure);
typedef void (*GClosureMarshal) (GClosure *closure,
      GValue *return_value,
      guint n_param_values,
      const GValue *param_values,
      gpointer invocation_hint,
      gpointer marshal_data);
typedef struct _GCClosure GCClosure;



struct _GClosureNotifyData
{
  gpointer data;
  GClosureNotify notify;
};
struct _GClosure
{

  volatile guint ref_count : 15;
  volatile guint meta_marshal : 1;
  volatile guint n_guards : 1;
  volatile guint n_fnotifiers : 2;
  volatile guint n_inotifiers : 8;
  volatile guint in_inotify : 1;
  volatile guint floating : 1;

  volatile guint derivative_flag : 1;

  volatile guint in_marshal : 1;
  volatile guint is_invalid : 1;

                  void (*marshal) (GClosure *closure,
         GValue *return_value,
         guint n_param_values,
         const GValue *param_values,
         gpointer invocation_hint,
         gpointer marshal_data);
                    gpointer data;

                  GClosureNotifyData *notifiers;
};


struct _GCClosure
{
  GClosure closure;
  gpointer callback;
};



GClosure* g_cclosure_new (GCallback callback_func,
       gpointer user_data,
       GClosureNotify destroy_data);
GClosure* g_cclosure_new_swap (GCallback callback_func,
       gpointer user_data,
       GClosureNotify destroy_data);
GClosure* g_signal_type_cclosure_new (GType itype,
       guint struct_offset);



GClosure* g_closure_ref (GClosure *closure);
void g_closure_sink (GClosure *closure);
void g_closure_unref (GClosure *closure);

GClosure* g_closure_new_simple (guint sizeof_closure,
       gpointer data);
void g_closure_add_finalize_notifier (GClosure *closure,
       gpointer notify_data,
       GClosureNotify notify_func);
void g_closure_remove_finalize_notifier (GClosure *closure,
       gpointer notify_data,
       GClosureNotify notify_func);
void g_closure_add_invalidate_notifier (GClosure *closure,
       gpointer notify_data,
       GClosureNotify notify_func);
void g_closure_remove_invalidate_notifier (GClosure *closure,
       gpointer notify_data,
       GClosureNotify notify_func);
void g_closure_add_marshal_guards (GClosure *closure,
       gpointer pre_marshal_data,
       GClosureNotify pre_marshal_notify,
       gpointer post_marshal_data,
       GClosureNotify post_marshal_notify);
void g_closure_set_marshal (GClosure *closure,
       GClosureMarshal marshal);
void g_closure_set_meta_marshal (GClosure *closure,
       gpointer marshal_data,
       GClosureMarshal meta_marshal);
void g_closure_invalidate (GClosure *closure);
void g_closure_invoke (GClosure *closure,
       GValue *return_value,
       guint n_param_values,
       const GValue *param_values,
       gpointer invocation_hint);







extern void g_cclosure_marshal_VOID__VOID (GClosure *closure,
                                           GValue *return_value,
                                           guint n_param_values,
                                           const GValue *param_values,
                                           gpointer invocation_hint,
                                           gpointer marshal_data);


extern void g_cclosure_marshal_VOID__BOOLEAN (GClosure *closure,
                                              GValue *return_value,
                                              guint n_param_values,
                                              const GValue *param_values,
                                              gpointer invocation_hint,
                                              gpointer marshal_data);


extern void g_cclosure_marshal_VOID__CHAR (GClosure *closure,
                                           GValue *return_value,
                                           guint n_param_values,
                                           const GValue *param_values,
                                           gpointer invocation_hint,
                                           gpointer marshal_data);


extern void g_cclosure_marshal_VOID__UCHAR (GClosure *closure,
                                            GValue *return_value,
                                            guint n_param_values,
                                            const GValue *param_values,
                                            gpointer invocation_hint,
                                            gpointer marshal_data);


extern void g_cclosure_marshal_VOID__INT (GClosure *closure,
                                          GValue *return_value,
                                          guint n_param_values,
                                          const GValue *param_values,
                                          gpointer invocation_hint,
                                          gpointer marshal_data);


extern void g_cclosure_marshal_VOID__UINT (GClosure *closure,
                                           GValue *return_value,
                                           guint n_param_values,
                                           const GValue *param_values,
                                           gpointer invocation_hint,
                                           gpointer marshal_data);


extern void g_cclosure_marshal_VOID__LONG (GClosure *closure,
                                           GValue *return_value,
                                           guint n_param_values,
                                           const GValue *param_values,
                                           gpointer invocation_hint,
                                           gpointer marshal_data);


extern void g_cclosure_marshal_VOID__ULONG (GClosure *closure,
                                            GValue *return_value,
                                            guint n_param_values,
                                            const GValue *param_values,
                                            gpointer invocation_hint,
                                            gpointer marshal_data);


extern void g_cclosure_marshal_VOID__ENUM (GClosure *closure,
                                           GValue *return_value,
                                           guint n_param_values,
                                           const GValue *param_values,
                                           gpointer invocation_hint,
                                           gpointer marshal_data);


extern void g_cclosure_marshal_VOID__FLAGS (GClosure *closure,
                                            GValue *return_value,
                                            guint n_param_values,
                                            const GValue *param_values,
                                            gpointer invocation_hint,
                                            gpointer marshal_data);


extern void g_cclosure_marshal_VOID__FLOAT (GClosure *closure,
                                            GValue *return_value,
                                            guint n_param_values,
                                            const GValue *param_values,
                                            gpointer invocation_hint,
                                            gpointer marshal_data);


extern void g_cclosure_marshal_VOID__DOUBLE (GClosure *closure,
                                             GValue *return_value,
                                             guint n_param_values,
                                             const GValue *param_values,
                                             gpointer invocation_hint,
                                             gpointer marshal_data);


extern void g_cclosure_marshal_VOID__STRING (GClosure *closure,
                                             GValue *return_value,
                                             guint n_param_values,
                                             const GValue *param_values,
                                             gpointer invocation_hint,
                                             gpointer marshal_data);


extern void g_cclosure_marshal_VOID__PARAM (GClosure *closure,
                                            GValue *return_value,
                                            guint n_param_values,
                                            const GValue *param_values,
                                            gpointer invocation_hint,
                                            gpointer marshal_data);


extern void g_cclosure_marshal_VOID__BOXED (GClosure *closure,
                                            GValue *return_value,
                                            guint n_param_values,
                                            const GValue *param_values,
                                            gpointer invocation_hint,
                                            gpointer marshal_data);


extern void g_cclosure_marshal_VOID__POINTER (GClosure *closure,
                                              GValue *return_value,
                                              guint n_param_values,
                                              const GValue *param_values,
                                              gpointer invocation_hint,
                                              gpointer marshal_data);


extern void g_cclosure_marshal_VOID__OBJECT (GClosure *closure,
                                             GValue *return_value,
                                             guint n_param_values,
                                             const GValue *param_values,
                                             gpointer invocation_hint,
                                             gpointer marshal_data);


extern void g_cclosure_marshal_VOID__UINT_POINTER (GClosure *closure,
                                                   GValue *return_value,
                                                   guint n_param_values,
                                                   const GValue *param_values,
                                                   gpointer invocation_hint,
                                                   gpointer marshal_data);


extern void g_cclosure_marshal_BOOLEAN__FLAGS (GClosure *closure,
                                               GValue *return_value,
                                               guint n_param_values,
                                               const GValue *param_values,
                                               gpointer invocation_hint,
                                               gpointer marshal_data);



extern void g_cclosure_marshal_STRING__OBJECT_POINTER (GClosure *closure,
                                                       GValue *return_value,
                                                       guint n_param_values,
                                                       const GValue *param_values,
                                                       gpointer invocation_hint,
                                                       gpointer marshal_data);






typedef struct _GSignalQuery GSignalQuery;
typedef struct _GSignalInvocationHint GSignalInvocationHint;
typedef GClosureMarshal GSignalCMarshaller;
typedef gboolean (*GSignalEmissionHook) (GSignalInvocationHint *ihint,
      guint n_param_values,
      const GValue *param_values,
      gpointer data);
typedef gboolean (*GSignalAccumulator) (GSignalInvocationHint *ihint,
      GValue *return_accu,
      const GValue *handler_return,
      gpointer data);



typedef enum
{
  G_SIGNAL_RUN_FIRST = 1 << 0,
  G_SIGNAL_RUN_LAST = 1 << 1,
  G_SIGNAL_RUN_CLEANUP = 1 << 2,
  G_SIGNAL_NO_RECURSE = 1 << 3,
  G_SIGNAL_DETAILED = 1 << 4,
  G_SIGNAL_ACTION = 1 << 5,
  G_SIGNAL_NO_HOOKS = 1 << 6
} GSignalFlags;

typedef enum
{
  G_CONNECT_AFTER = 1 << 0,
  G_CONNECT_SWAPPED = 1 << 1
} GConnectFlags;
typedef enum
{
  G_SIGNAL_MATCH_ID = 1 << 0,
  G_SIGNAL_MATCH_DETAIL = 1 << 1,
  G_SIGNAL_MATCH_CLOSURE = 1 << 2,
  G_SIGNAL_MATCH_FUNC = 1 << 3,
  G_SIGNAL_MATCH_DATA = 1 << 4,
  G_SIGNAL_MATCH_UNBLOCKED = 1 << 5
} GSignalMatchType;





struct _GSignalInvocationHint
{
  guint signal_id;
  GQuark detail;
  GSignalFlags run_type;
};
struct _GSignalQuery
{
  guint signal_id;
  const gchar *signal_name;
  GType itype;
  GSignalFlags signal_flags;
  GType return_type;
  guint n_params;
  const GType *param_types;
};



guint g_signal_newv (const gchar *signal_name,
          GType itype,
          GSignalFlags signal_flags,
          GClosure *class_closure,
          GSignalAccumulator accumulator,
          gpointer accu_data,
          GSignalCMarshaller c_marshaller,
          GType return_type,
          guint n_params,
          GType *param_types);
guint g_signal_new_valist (const gchar *signal_name,
          GType itype,
          GSignalFlags signal_flags,
          GClosure *class_closure,
          GSignalAccumulator accumulator,
          gpointer accu_data,
          GSignalCMarshaller c_marshaller,
          GType return_type,
          guint n_params,
          va_list args);
guint g_signal_new (const gchar *signal_name,
          GType itype,
          GSignalFlags signal_flags,
          guint class_offset,
          GSignalAccumulator accumulator,
          gpointer accu_data,
          GSignalCMarshaller c_marshaller,
          GType return_type,
          guint n_params,
          ...);
void g_signal_emitv (const GValue *instance_and_params,
          guint signal_id,
          GQuark detail,
          GValue *return_value);
void g_signal_emit_valist (gpointer instance,
          guint signal_id,
          GQuark detail,
          va_list var_args);
void g_signal_emit (gpointer instance,
          guint signal_id,
          GQuark detail,
          ...);
void g_signal_emit_by_name (gpointer instance,
          const gchar *detailed_signal,
          ...);
guint g_signal_lookup (const gchar *name,
          GType itype);
const gchar* g_signal_name (guint signal_id);
void g_signal_query (guint signal_id,
          GSignalQuery *query);
guint* g_signal_list_ids (GType itype,
          guint *n_ids);
gboolean g_signal_parse_name (const gchar *detailed_signal,
          GType itype,
          guint *signal_id_p,
          GQuark *detail_p,
          gboolean force_detail_quark);
GSignalInvocationHint* g_signal_get_invocation_hint (gpointer instance);



void g_signal_stop_emission (gpointer instance,
          guint signal_id,
          GQuark detail);
void g_signal_stop_emission_by_name (gpointer instance,
          const gchar *detailed_signal);
gulong g_signal_add_emission_hook (guint signal_id,
          GQuark detail,
          GSignalEmissionHook hook_func,
          gpointer hook_data,
          GDestroyNotify data_destroy);
void g_signal_remove_emission_hook (guint signal_id,
          gulong hook_id);



gboolean g_signal_has_handler_pending (gpointer instance,
            guint signal_id,
            GQuark detail,
            gboolean may_be_blocked);
gulong g_signal_connect_closure_by_id (gpointer instance,
            guint signal_id,
            GQuark detail,
            GClosure *closure,
            gboolean after);
gulong g_signal_connect_closure (gpointer instance,
            const gchar *detailed_signal,
            GClosure *closure,
            gboolean after);
gulong g_signal_connect_data (gpointer instance,
            const gchar *detailed_signal,
            GCallback c_handler,
            gpointer data,
            GClosureNotify destroy_data,
            GConnectFlags connect_flags);
void g_signal_handler_block (gpointer instance,
            gulong handler_id);
void g_signal_handler_unblock (gpointer instance,
            gulong handler_id);
void g_signal_handler_disconnect (gpointer instance,
            gulong handler_id);
gboolean g_signal_handler_is_connected (gpointer instance,
            gulong handler_id);
gulong g_signal_handler_find (gpointer instance,
            GSignalMatchType mask,
            guint signal_id,
            GQuark detail,
            GClosure *closure,
            gpointer func,
            gpointer data);
guint g_signal_handlers_block_matched (gpointer instance,
            GSignalMatchType mask,
            guint signal_id,
            GQuark detail,
            GClosure *closure,
            gpointer func,
            gpointer data);
guint g_signal_handlers_unblock_matched (gpointer instance,
            GSignalMatchType mask,
            guint signal_id,
            GQuark detail,
            GClosure *closure,
            gpointer func,
            gpointer data);
guint g_signal_handlers_disconnect_matched (gpointer instance,
            GSignalMatchType mask,
            guint signal_id,
            GQuark detail,
            GClosure *closure,
            gpointer func,
            gpointer data);



void g_signal_override_class_closure (guint signal_id,
            GType instance_type,
            GClosure *class_closure);
void g_signal_chain_from_overridden (const GValue *instance_and_params,
            GValue *return_value);
gboolean g_signal_accumulator_true_handled (GSignalInvocationHint *ihint,
         GValue *return_accu,
         const GValue *handler_return,
         gpointer dummy);


void g_signal_handlers_destroy (gpointer instance);
void _g_signals_destroy (GType itype);




typedef struct _GObject GObject;
typedef struct _GObjectClass GObjectClass;
typedef struct _GObject GInitiallyUnowned;
typedef struct _GObjectClass GInitiallyUnownedClass;
typedef struct _GObjectConstructParam GObjectConstructParam;
typedef void (*GObjectGetPropertyFunc) (GObject *object,
                                         guint property_id,
                                         GValue *value,
                                         GParamSpec *pspec);
typedef void (*GObjectSetPropertyFunc) (GObject *object,
                                         guint property_id,
                                         const GValue *value,
                                         GParamSpec *pspec);
typedef void (*GObjectFinalizeFunc) (GObject *object);
typedef void (*GWeakNotify) (gpointer data,
      GObject *where_the_object_was);
struct _GObject
{
  GTypeInstance g_type_instance;


  volatile guint ref_count;
  GData *qdata;
};
struct _GObjectClass
{
  GTypeClass g_type_class;


  GSList *construct_properties;



  GObject* (*constructor) (GType type,
                                 guint n_construct_properties,
                                 GObjectConstructParam *construct_properties);
  void (*set_property) (GObject *object,
                                         guint property_id,
                                         const GValue *value,
                                         GParamSpec *pspec);
  void (*get_property) (GObject *object,
                                         guint property_id,
                                         GValue *value,
                                         GParamSpec *pspec);
  void (*dispose) (GObject *object);
  void (*finalize) (GObject *object);


  void (*dispatch_properties_changed) (GObject *object,
          guint n_pspecs,
          GParamSpec **pspecs);


  void (*notify) (GObject *object,
      GParamSpec *pspec);


  gpointer pdummy[8];
};
struct _GObjectConstructParam
{
  GParamSpec *pspec;
  GValue *value;
};



GType g_initially_unowned_get_type (void);
void g_object_class_install_property (GObjectClass *oclass,
            guint property_id,
            GParamSpec *pspec);
GParamSpec* g_object_class_find_property (GObjectClass *oclass,
            const gchar *property_name);
GParamSpec**g_object_class_list_properties (GObjectClass *oclass,
            guint *n_properties);
void g_object_class_override_property (GObjectClass *oclass,
            guint property_id,
            const gchar *name);

void g_object_interface_install_property (gpointer g_iface,
       GParamSpec *pspec);
GParamSpec* g_object_interface_find_property (gpointer g_iface,
       const gchar *property_name);
GParamSpec**g_object_interface_list_properties (gpointer g_iface,
       guint *n_properties_p);

gpointer g_object_new (GType object_type,
            const gchar *first_property_name,
            ...);
gpointer g_object_newv (GType object_type,
            guint n_parameters,
            GParameter *parameters);
GObject* g_object_new_valist (GType object_type,
            const gchar *first_property_name,
            va_list var_args);
void g_object_set (gpointer object,
            const gchar *first_property_name,
            ...) __attribute__((__sentinel__));
void g_object_get (gpointer object,
            const gchar *first_property_name,
            ...) __attribute__((__sentinel__));
gpointer g_object_connect (gpointer object,
            const gchar *signal_spec,
            ...) __attribute__((__sentinel__));
void g_object_disconnect (gpointer object,
            const gchar *signal_spec,
            ...) __attribute__((__sentinel__));
void g_object_set_valist (GObject *object,
            const gchar *first_property_name,
            va_list var_args);
void g_object_get_valist (GObject *object,
            const gchar *first_property_name,
            va_list var_args);
void g_object_set_property (GObject *object,
            const gchar *property_name,
            const GValue *value);
void g_object_get_property (GObject *object,
            const gchar *property_name,
            GValue *value);
void g_object_freeze_notify (GObject *object);
void g_object_notify (GObject *object,
            const gchar *property_name);
void g_object_thaw_notify (GObject *object);
gboolean g_object_is_floating (gpointer object);
gpointer g_object_ref_sink (gpointer object);
gpointer g_object_ref (gpointer object);
void g_object_unref (gpointer object);
void g_object_weak_ref (GObject *object,
            GWeakNotify notify,
            gpointer data);
void g_object_weak_unref (GObject *object,
            GWeakNotify notify,
            gpointer data);
void g_object_add_weak_pointer (GObject *object,
                                               gpointer *weak_pointer_location);
void g_object_remove_weak_pointer (GObject *object,
                                               gpointer *weak_pointer_location);

typedef void (*GToggleNotify) (gpointer data,
          GObject *object,
          gboolean is_last_ref);

void g_object_add_toggle_ref (GObject *object,
     GToggleNotify notify,
     gpointer data);
void g_object_remove_toggle_ref (GObject *object,
     GToggleNotify notify,
     gpointer data);

gpointer g_object_get_qdata (GObject *object,
            GQuark quark);
void g_object_set_qdata (GObject *object,
            GQuark quark,
            gpointer data);
void g_object_set_qdata_full (GObject *object,
            GQuark quark,
            gpointer data,
            GDestroyNotify destroy);
gpointer g_object_steal_qdata (GObject *object,
            GQuark quark);
gpointer g_object_get_data (GObject *object,
            const gchar *key);
void g_object_set_data (GObject *object,
            const gchar *key,
            gpointer data);
void g_object_set_data_full (GObject *object,
            const gchar *key,
            gpointer data,
            GDestroyNotify destroy);
gpointer g_object_steal_data (GObject *object,
            const gchar *key);
void g_object_watch_closure (GObject *object,
            GClosure *closure);
GClosure* g_cclosure_new_object (GCallback callback_func,
            GObject *object);
GClosure* g_cclosure_new_object_swap (GCallback callback_func,
            GObject *object);
GClosure* g_closure_new_object (guint sizeof_closure,
            GObject *object);
void g_value_set_object (GValue *value,
            gpointer v_object);
gpointer g_value_get_object (const GValue *value);
GObject* g_value_dup_object (const GValue *value);
gulong g_signal_connect_object (gpointer instance,
            const gchar *detailed_signal,
            GCallback c_handler,
            gpointer gobject,
            GConnectFlags connect_flags);


void g_object_force_floating (GObject *object);
void g_object_run_dispose (GObject *object);


void g_value_take_object (GValue *value,
            gpointer v_object);



typedef struct _GParamSpecChar GParamSpecChar;
typedef struct _GParamSpecUChar GParamSpecUChar;
typedef struct _GParamSpecBoolean GParamSpecBoolean;
typedef struct _GParamSpecInt GParamSpecInt;
typedef struct _GParamSpecUInt GParamSpecUInt;
typedef struct _GParamSpecLong GParamSpecLong;
typedef struct _GParamSpecULong GParamSpecULong;
typedef struct _GParamSpecInt64 GParamSpecInt64;
typedef struct _GParamSpecUInt64 GParamSpecUInt64;
typedef struct _GParamSpecUnichar GParamSpecUnichar;
typedef struct _GParamSpecEnum GParamSpecEnum;
typedef struct _GParamSpecFlags GParamSpecFlags;
typedef struct _GParamSpecFloat GParamSpecFloat;
typedef struct _GParamSpecDouble GParamSpecDouble;
typedef struct _GParamSpecString GParamSpecString;
typedef struct _GParamSpecParam GParamSpecParam;
typedef struct _GParamSpecBoxed GParamSpecBoxed;
typedef struct _GParamSpecPointer GParamSpecPointer;
typedef struct _GParamSpecValueArray GParamSpecValueArray;
typedef struct _GParamSpecObject GParamSpecObject;
typedef struct _GParamSpecOverride GParamSpecOverride;
typedef struct _GParamSpecGType GParamSpecGType;

struct _GParamSpecChar
{
  GParamSpec parent_instance;

  gint8 minimum;
  gint8 maximum;
  gint8 default_value;
};
struct _GParamSpecUChar
{
  GParamSpec parent_instance;

  guint8 minimum;
  guint8 maximum;
  guint8 default_value;
};
struct _GParamSpecBoolean
{
  GParamSpec parent_instance;

  gboolean default_value;
};
struct _GParamSpecInt
{
  GParamSpec parent_instance;

  gint minimum;
  gint maximum;
  gint default_value;
};
struct _GParamSpecUInt
{
  GParamSpec parent_instance;

  guint minimum;
  guint maximum;
  guint default_value;
};
struct _GParamSpecLong
{
  GParamSpec parent_instance;

  glong minimum;
  glong maximum;
  glong default_value;
};
struct _GParamSpecULong
{
  GParamSpec parent_instance;

  gulong minimum;
  gulong maximum;
  gulong default_value;
};
struct _GParamSpecInt64
{
  GParamSpec parent_instance;

  gint64 minimum;
  gint64 maximum;
  gint64 default_value;
};
struct _GParamSpecUInt64
{
  GParamSpec parent_instance;

  guint64 minimum;
  guint64 maximum;
  guint64 default_value;
};
struct _GParamSpecUnichar
{
  GParamSpec parent_instance;

  gunichar default_value;
};
struct _GParamSpecEnum
{
  GParamSpec parent_instance;

  GEnumClass *enum_class;
  gint default_value;
};
struct _GParamSpecFlags
{
  GParamSpec parent_instance;

  GFlagsClass *flags_class;
  guint default_value;
};
struct _GParamSpecFloat
{
  GParamSpec parent_instance;

  gfloat minimum;
  gfloat maximum;
  gfloat default_value;
  gfloat epsilon;
};
struct _GParamSpecDouble
{
  GParamSpec parent_instance;

  gdouble minimum;
  gdouble maximum;
  gdouble default_value;
  gdouble epsilon;
};
struct _GParamSpecString
{
  GParamSpec parent_instance;

  gchar *default_value;
  gchar *cset_first;
  gchar *cset_nth;
  gchar substitutor;
  guint null_fold_if_empty : 1;
  guint ensure_non_null : 1;
};
struct _GParamSpecParam
{
  GParamSpec parent_instance;
};
struct _GParamSpecBoxed
{
  GParamSpec parent_instance;
};
struct _GParamSpecPointer
{
  GParamSpec parent_instance;
};
struct _GParamSpecValueArray
{
  GParamSpec parent_instance;
  GParamSpec *element_spec;
  guint fixed_n_elements;
};
struct _GParamSpecObject
{
  GParamSpec parent_instance;
};
struct _GParamSpecOverride
{

  GParamSpec parent_instance;
  GParamSpec *overridden;
};
struct _GParamSpecGType
{
  GParamSpec parent_instance;
  GType is_a_type;
};


GParamSpec* g_param_spec_char (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       gint8 minimum,
       gint8 maximum,
       gint8 default_value,
       GParamFlags flags);
GParamSpec* g_param_spec_uchar (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       guint8 minimum,
       guint8 maximum,
       guint8 default_value,
       GParamFlags flags);
GParamSpec* g_param_spec_boolean (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       gboolean default_value,
       GParamFlags flags);
GParamSpec* g_param_spec_int (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       gint minimum,
       gint maximum,
       gint default_value,
       GParamFlags flags);
GParamSpec* g_param_spec_uint (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       guint minimum,
       guint maximum,
       guint default_value,
       GParamFlags flags);
GParamSpec* g_param_spec_long (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       glong minimum,
       glong maximum,
       glong default_value,
       GParamFlags flags);
GParamSpec* g_param_spec_ulong (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       gulong minimum,
       gulong maximum,
       gulong default_value,
       GParamFlags flags);
GParamSpec* g_param_spec_int64 (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       gint64 minimum,
       gint64 maximum,
       gint64 default_value,
       GParamFlags flags);
GParamSpec* g_param_spec_uint64 (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       guint64 minimum,
       guint64 maximum,
       guint64 default_value,
       GParamFlags flags);
GParamSpec* g_param_spec_unichar (const gchar *name,
              const gchar *nick,
              const gchar *blurb,
              gunichar default_value,
              GParamFlags flags);
GParamSpec* g_param_spec_enum (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       GType enum_type,
       gint default_value,
       GParamFlags flags);
GParamSpec* g_param_spec_flags (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       GType flags_type,
       guint default_value,
       GParamFlags flags);
GParamSpec* g_param_spec_float (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       gfloat minimum,
       gfloat maximum,
       gfloat default_value,
       GParamFlags flags);
GParamSpec* g_param_spec_double (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       gdouble minimum,
       gdouble maximum,
       gdouble default_value,
       GParamFlags flags);
GParamSpec* g_param_spec_string (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       const gchar *default_value,
       GParamFlags flags);
GParamSpec* g_param_spec_param (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       GType param_type,
       GParamFlags flags);
GParamSpec* g_param_spec_boxed (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       GType boxed_type,
       GParamFlags flags);
GParamSpec* g_param_spec_pointer (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       GParamFlags flags);
GParamSpec* g_param_spec_value_array (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       GParamSpec *element_spec,
       GParamFlags flags);
GParamSpec* g_param_spec_object (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       GType object_type,
       GParamFlags flags);
GParamSpec* g_param_spec_override (const gchar *name,
       GParamSpec *overridden);
GParamSpec* g_param_spec_gtype (const gchar *name,
       const gchar *nick,
       const gchar *blurb,
       GType is_a_type,
       GParamFlags flags);
extern GType *g_param_spec_types;





void g_source_set_closure (GSource *source,
      GClosure *closure);

GType g_io_channel_get_type (void);
GType g_io_condition_get_type (void);








typedef struct _GTypeModule GTypeModule;
typedef struct _GTypeModuleClass GTypeModuleClass;
struct _GTypeModule
{
  GObject parent_instance;

  guint use_count;
  GSList *type_infos;
  GSList *interface_infos;


  gchar *name;
};

struct _GTypeModuleClass
{
  GObjectClass parent_class;


  gboolean (* load) (GTypeModule *module);
  void (* unload) (GTypeModule *module);



  void (*reserved1) (void);
  void (*reserved2) (void);
  void (*reserved3) (void);
  void (*reserved4) (void);
};

GType g_type_module_get_type (void) __attribute__((__const__));
gboolean g_type_module_use (GTypeModule *module);
void g_type_module_unuse (GTypeModule *module);
void g_type_module_set_name (GTypeModule *module,
                                       const gchar *name);
GType g_type_module_register_type (GTypeModule *module,
                                       GType parent_type,
                                       const gchar *type_name,
                                       const GTypeInfo *type_info,
                                       GTypeFlags flags);
void g_type_module_add_interface (GTypeModule *module,
                                       GType instance_type,
                                       GType interface_type,
                                       const GInterfaceInfo *interface_info);
GType g_type_module_register_enum (GTypeModule *module,
                                       const gchar *name,
                                       const GEnumValue *const_static_values);
GType g_type_module_register_flags (GTypeModule *module,
                                       const gchar *name,
                                       const GFlagsValue *const_static_values);




typedef struct _GTypePluginClass GTypePluginClass;
typedef void (*GTypePluginUse) (GTypePlugin *plugin);
typedef void (*GTypePluginUnuse) (GTypePlugin *plugin);
typedef void (*GTypePluginCompleteTypeInfo) (GTypePlugin *plugin,
         GType g_type,
         GTypeInfo *info,
         GTypeValueTable *value_table);
typedef void (*GTypePluginCompleteInterfaceInfo) (GTypePlugin *plugin,
         GType instance_type,
         GType interface_type,
         GInterfaceInfo *info);
struct _GTypePluginClass
{

  GTypeInterface base_iface;


  GTypePluginUse use_plugin;
  GTypePluginUnuse unuse_plugin;
  GTypePluginCompleteTypeInfo complete_type_info;
  GTypePluginCompleteInterfaceInfo complete_interface_info;
};



GType g_type_plugin_get_type (void) __attribute__((__const__));
void g_type_plugin_use (GTypePlugin *plugin);
void g_type_plugin_unuse (GTypePlugin *plugin);
void g_type_plugin_complete_type_info (GTypePlugin *plugin,
       GType g_type,
       GTypeInfo *info,
       GTypeValueTable *value_table);
void g_type_plugin_complete_interface_info (GTypePlugin *plugin,
       GType instance_type,
       GType interface_type,
       GInterfaceInfo *info);








typedef struct _GValueArray GValueArray;
struct _GValueArray
{
  guint n_values;
  GValue *values;


  guint n_prealloced;
};



GValue* g_value_array_get_nth (GValueArray *value_array,
           guint index_);
GValueArray* g_value_array_new (guint n_prealloced);
void g_value_array_free (GValueArray *value_array);
GValueArray* g_value_array_copy (const GValueArray *value_array);
GValueArray* g_value_array_prepend (GValueArray *value_array,
           const GValue *value);
GValueArray* g_value_array_append (GValueArray *value_array,
           const GValue *value);
GValueArray* g_value_array_insert (GValueArray *value_array,
           guint index_,
           const GValue *value);
GValueArray* g_value_array_remove (GValueArray *value_array,
           guint index_);
GValueArray* g_value_array_sort (GValueArray *value_array,
           GCompareFunc compare_func);
GValueArray* g_value_array_sort_with_data (GValueArray *value_array,
           GCompareDataFunc compare_func,
           gpointer user_data);





void g_value_set_char (GValue *value,
       gchar v_char);
gchar g_value_get_char (const GValue *value);
void g_value_set_uchar (GValue *value,
       guchar v_uchar);
guchar g_value_get_uchar (const GValue *value);
void g_value_set_boolean (GValue *value,
       gboolean v_boolean);
gboolean g_value_get_boolean (const GValue *value);
void g_value_set_int (GValue *value,
       gint v_int);
gint g_value_get_int (const GValue *value);
void g_value_set_uint (GValue *value,
       guint v_uint);
guint g_value_get_uint (const GValue *value);
void g_value_set_long (GValue *value,
       glong v_long);
glong g_value_get_long (const GValue *value);
void g_value_set_ulong (GValue *value,
       gulong v_ulong);
gulong g_value_get_ulong (const GValue *value);
void g_value_set_int64 (GValue *value,
       gint64 v_int64);
gint64 g_value_get_int64 (const GValue *value);
void g_value_set_uint64 (GValue *value,
       guint64 v_uint64);
guint64 g_value_get_uint64 (const GValue *value);
void g_value_set_float (GValue *value,
       gfloat v_float);
gfloat g_value_get_float (const GValue *value);
void g_value_set_double (GValue *value,
       gdouble v_double);
gdouble g_value_get_double (const GValue *value);
void g_value_set_string (GValue *value,
       const gchar *v_string);
void g_value_set_static_string (GValue *value,
       const gchar *v_string);
const gchar* g_value_get_string (const GValue *value);
gchar* g_value_dup_string (const GValue *value);
void g_value_set_pointer (GValue *value,
       gpointer v_pointer);
gpointer g_value_get_pointer (const GValue *value);
GType g_gtype_get_type (void);
void g_value_set_gtype (GValue *value,
       GType v_gtype);
GType g_value_get_gtype (const GValue *value);



GType g_pointer_type_register_static (const gchar *name);


gchar* g_strdup_value_contents (const GValue *value);


void g_value_take_string (GValue *value,
       gchar *v_string);







typedef gchar* gchararray;






typedef enum {
 LINK_CONNECTION_SSL = 1 << 0,
 LINK_CONNECTION_NONBLOCKING = 1 << 1,
 LINK_CONNECTION_BLOCK_SIGNAL = 1 << 2,
 LINK_CONNECTION_LOCAL_ONLY = 1 << 3
} LinkConnectionOptions;

typedef struct _LinkWatch LinkWatch;
typedef struct _LinkProtocolInfo LinkProtocolInfo;
GMutex *link_mutex_new (void);











typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;



typedef __ino_t ino_t;
typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;
typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));


typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));


typedef int __sig_atomic_t;




typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;



typedef __sigset_t sigset_t;







struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };


typedef __suseconds_t suseconds_t;





typedef long int __fd_mask;
typedef struct
  {






    __fd_mask __fds_bits[1024 / (8 * sizeof (__fd_mask))];


  } fd_set;






typedef __fd_mask fd_mask;

extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);





__extension__
extern __inline unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__));
__extension__
extern __inline unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__));
__extension__
extern __inline unsigned long long int gnu_dev_makedev (unsigned int __major,
       unsigned int __minor)
     __attribute__ ((__nothrow__));


__extension__ extern __inline unsigned int
__attribute__ ((__nothrow__)) gnu_dev_major (unsigned long long int __dev)
{
  return ((__dev >> 8) & 0xfff) | ((unsigned int) (__dev >> 32) & ~0xfff);
}

__extension__ extern __inline unsigned int
__attribute__ ((__nothrow__)) gnu_dev_minor (unsigned long long int __dev)
{
  return (__dev & 0xff) | ((unsigned int) (__dev >> 12) & ~0xff);
}

__extension__ extern __inline unsigned long long int
__attribute__ ((__nothrow__)) gnu_dev_makedev (unsigned int __major, unsigned int __minor)
{
  return ((__minor & 0xff) | ((__major & 0xfff) << 8)
   | (((unsigned long long int) (__minor & ~0xff)) << 12)
   | (((unsigned long long int) (__major & ~0xfff)) << 32));
}
typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
typedef unsigned long int pthread_t;


typedef union
{
  char __size[36];
  long int __align;
} pthread_attr_t;


typedef struct __pthread_internal_slist
{
  struct __pthread_internal_slist *__next;
} __pthread_slist_t;




typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;


    int __kind;
    unsigned int __nusers;
    __extension__ union
    {
      int __spins;
      __pthread_slist_t __list;
    };
  } __data;
  char __size[24];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  long int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  long int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;





typedef union
{
  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;


    unsigned int __flags;
    int __writer;
  } __data;
  char __size[32];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[20];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;













struct iovec
  {
    void *iov_base;
    size_t iov_len;
  };
extern ssize_t readv (int __fd, __const struct iovec *__iovec, int __count);
extern ssize_t writev (int __fd, __const struct iovec *__iovec, int __count);













typedef __socklen_t socklen_t;




enum __socket_type
{
  SOCK_STREAM = 1,


  SOCK_DGRAM = 2,


  SOCK_RAW = 3,

  SOCK_RDM = 4,

  SOCK_SEQPACKET = 5,


  SOCK_PACKET = 10



};
typedef unsigned short int sa_family_t;


struct sockaddr
  {
    sa_family_t sa_family;
    char sa_data[14];
  };
struct sockaddr_storage
  {
    sa_family_t ss_family;
    __uint32_t __ss_align;
    char __ss_padding[(128 - (2 * sizeof (__uint32_t)))];
  };



enum
  {
    MSG_OOB = 0x01,

    MSG_PEEK = 0x02,

    MSG_DONTROUTE = 0x04,






    MSG_CTRUNC = 0x08,

    MSG_PROXY = 0x10,

    MSG_TRUNC = 0x20,

    MSG_DONTWAIT = 0x40,

    MSG_EOR = 0x80,

    MSG_WAITALL = 0x100,

    MSG_FIN = 0x200,

    MSG_SYN = 0x400,

    MSG_CONFIRM = 0x800,

    MSG_RST = 0x1000,

    MSG_ERRQUEUE = 0x2000,

    MSG_NOSIGNAL = 0x4000,

    MSG_MORE = 0x8000

  };




struct msghdr
  {
    void *msg_name;
    socklen_t msg_namelen;

    struct iovec *msg_iov;
    size_t msg_iovlen;

    void *msg_control;
    size_t msg_controllen;

    int msg_flags;
  };


struct cmsghdr
  {
    size_t cmsg_len;

    int cmsg_level;
    int cmsg_type;

    __extension__ unsigned char __cmsg_data [];

  };
extern struct cmsghdr *__cmsg_nxthdr (struct msghdr *__mhdr,
          struct cmsghdr *__cmsg) __attribute__ ((__nothrow__));




extern __inline struct cmsghdr *
__attribute__ ((__nothrow__)) __cmsg_nxthdr (struct msghdr *__mhdr, struct cmsghdr *__cmsg)
{
  if ((size_t) __cmsg->cmsg_len < sizeof (struct cmsghdr))

    return 0;

  __cmsg = (struct cmsghdr *) ((unsigned char *) __cmsg
          + (((__cmsg->cmsg_len) + sizeof (size_t) - 1) & (size_t) ~(sizeof (size_t) - 1)));
  if ((unsigned char *) (__cmsg + 1) > ((unsigned char *) __mhdr->msg_control
     + __mhdr->msg_controllen)
      || ((unsigned char *) __cmsg + (((__cmsg->cmsg_len) + sizeof (size_t) - 1) & (size_t) ~(sizeof (size_t) - 1))
   > ((unsigned char *) __mhdr->msg_control + __mhdr->msg_controllen)))

    return 0;
  return __cmsg;
}




enum
  {
    SCM_RIGHTS = 0x01


    , SCM_CREDENTIALS = 0x02


  };



struct ucred
{
  pid_t pid;
  uid_t uid;
  gid_t gid;
};








struct linger
  {
    int l_onoff;
    int l_linger;
  };




struct osockaddr
  {
    unsigned short int sa_family;
    unsigned char sa_data[14];
  };




enum
{
  SHUT_RD = 0,

  SHUT_WR,

  SHUT_RDWR

};
extern int socket (int __domain, int __type, int __protocol) __attribute__ ((__nothrow__));





extern int socketpair (int __domain, int __type, int __protocol,
         int __fds[2]) __attribute__ ((__nothrow__));


extern int bind (int __fd, __const struct sockaddr * __addr, socklen_t __len)
     __attribute__ ((__nothrow__));


extern int getsockname (int __fd, struct sockaddr *__restrict __addr,
   socklen_t *__restrict __len) __attribute__ ((__nothrow__));
extern int connect (int __fd, __const struct sockaddr * __addr, socklen_t __len);



extern int getpeername (int __fd, struct sockaddr *__restrict __addr,
   socklen_t *__restrict __len) __attribute__ ((__nothrow__));






extern ssize_t send (int __fd, __const void *__buf, size_t __n, int __flags);






extern ssize_t recv (int __fd, void *__buf, size_t __n, int __flags);






extern ssize_t sendto (int __fd, __const void *__buf, size_t __n,
         int __flags, __const struct sockaddr * __addr,
         socklen_t __addr_len);
extern ssize_t recvfrom (int __fd, void *__restrict __buf, size_t __n,
    int __flags, struct sockaddr *__restrict __addr,
    socklen_t *__restrict __addr_len);







extern ssize_t sendmsg (int __fd, __const struct msghdr *__message,
   int __flags);






extern ssize_t recvmsg (int __fd, struct msghdr *__message, int __flags);





extern int getsockopt (int __fd, int __level, int __optname,
         void *__restrict __optval,
         socklen_t *__restrict __optlen) __attribute__ ((__nothrow__));




extern int setsockopt (int __fd, int __level, int __optname,
         __const void *__optval, socklen_t __optlen) __attribute__ ((__nothrow__));





extern int listen (int __fd, int __n) __attribute__ ((__nothrow__));
extern int accept (int __fd, struct sockaddr *__restrict __addr,
     socklen_t *__restrict __addr_len);







extern int shutdown (int __fd, int __how) __attribute__ ((__nothrow__));




extern int sockatmark (int __fd) __attribute__ ((__nothrow__));







extern int isfdtype (int __fd, int __fdtype) __attribute__ ((__nothrow__));

typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;

typedef unsigned int uint32_t;





__extension__
typedef unsigned long long int uint64_t;






typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef int int_least32_t;



__extension__
typedef long long int int_least64_t;



typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;



__extension__
typedef unsigned long long int uint_least64_t;






typedef signed char int_fast8_t;





typedef int int_fast16_t;
typedef int int_fast32_t;
__extension__
typedef long long int int_fast64_t;



typedef unsigned char uint_fast8_t;





typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
__extension__
typedef unsigned long long int uint_fast64_t;
typedef int intptr_t;


typedef unsigned int uintptr_t;
__extension__
typedef long long int intmax_t;
__extension__
typedef unsigned long long int uintmax_t;







enum
  {
    IPPROTO_IP = 0,

    IPPROTO_HOPOPTS = 0,

    IPPROTO_ICMP = 1,

    IPPROTO_IGMP = 2,

    IPPROTO_IPIP = 4,

    IPPROTO_TCP = 6,

    IPPROTO_EGP = 8,

    IPPROTO_PUP = 12,

    IPPROTO_UDP = 17,

    IPPROTO_IDP = 22,

    IPPROTO_TP = 29,

    IPPROTO_IPV6 = 41,

    IPPROTO_ROUTING = 43,

    IPPROTO_FRAGMENT = 44,

    IPPROTO_RSVP = 46,

    IPPROTO_GRE = 47,

    IPPROTO_ESP = 50,

    IPPROTO_AH = 51,

    IPPROTO_ICMPV6 = 58,

    IPPROTO_NONE = 59,

    IPPROTO_DSTOPTS = 60,

    IPPROTO_MTP = 92,

    IPPROTO_ENCAP = 98,

    IPPROTO_PIM = 103,

    IPPROTO_COMP = 108,

    IPPROTO_SCTP = 132,

    IPPROTO_RAW = 255,

    IPPROTO_MAX
  };



typedef uint16_t in_port_t;


enum
  {
    IPPORT_ECHO = 7,
    IPPORT_DISCARD = 9,
    IPPORT_SYSTAT = 11,
    IPPORT_DAYTIME = 13,
    IPPORT_NETSTAT = 15,
    IPPORT_FTP = 21,
    IPPORT_TELNET = 23,
    IPPORT_SMTP = 25,
    IPPORT_TIMESERVER = 37,
    IPPORT_NAMESERVER = 42,
    IPPORT_WHOIS = 43,
    IPPORT_MTP = 57,

    IPPORT_TFTP = 69,
    IPPORT_RJE = 77,
    IPPORT_FINGER = 79,
    IPPORT_TTYLINK = 87,
    IPPORT_SUPDUP = 95,


    IPPORT_EXECSERVER = 512,
    IPPORT_LOGINSERVER = 513,
    IPPORT_CMDSERVER = 514,
    IPPORT_EFSSERVER = 520,


    IPPORT_BIFFUDP = 512,
    IPPORT_WHOSERVER = 513,
    IPPORT_ROUTESERVER = 520,


    IPPORT_RESERVED = 1024,


    IPPORT_USERRESERVED = 5000
  };



typedef uint32_t in_addr_t;
struct in_addr
  {
    in_addr_t s_addr;
  };
struct in6_addr
  {
    union
      {
 uint8_t u6_addr8[16];
 uint16_t u6_addr16[8];
 uint32_t u6_addr32[4];
      } in6_u;



  };

extern const struct in6_addr in6addr_any;
extern const struct in6_addr in6addr_loopback;
struct sockaddr_in
  {
    sa_family_t sin_family;
    in_port_t sin_port;
    struct in_addr sin_addr;


    unsigned char sin_zero[sizeof (struct sockaddr) -
      (sizeof (unsigned short int)) -
      sizeof (in_port_t) -
      sizeof (struct in_addr)];
  };


struct sockaddr_in6
  {
    sa_family_t sin6_family;
    in_port_t sin6_port;
    uint32_t sin6_flowinfo;
    struct in6_addr sin6_addr;
    uint32_t sin6_scope_id;
  };



struct ip_mreq
  {

    struct in_addr imr_multiaddr;


    struct in_addr imr_interface;
  };

struct ip_mreq_source
  {

    struct in_addr imr_multiaddr;


    struct in_addr imr_interface;


    struct in_addr imr_sourceaddr;
  };


struct ipv6_mreq
  {

    struct in6_addr ipv6mr_multiaddr;


    unsigned int ipv6mr_interface;
  };



struct group_req
  {

    uint32_t gr_interface;


    struct sockaddr_storage gr_group;
  };

struct group_source_req
  {

    uint32_t gsr_interface;


    struct sockaddr_storage gsr_group;


    struct sockaddr_storage gsr_source;
  };



struct ip_msfilter
  {

    struct in_addr imsf_multiaddr;


    struct in_addr imsf_interface;


    uint32_t imsf_fmode;


    uint32_t imsf_numsrc;

    struct in_addr imsf_slist[1];
  };





struct group_filter
  {

    uint32_t gf_interface;


    struct sockaddr_storage gf_group;


    uint32_t gf_fmode;


    uint32_t gf_numsrc;

    struct sockaddr_storage gf_slist[1];
};
struct ip_opts
  {
    struct in_addr ip_dst;
    char ip_opts[40];
  };


struct ip_mreqn
  {
    struct in_addr imr_multiaddr;
    struct in_addr imr_address;
    int imr_ifindex;
  };


struct in_pktinfo
  {
    int ipi_ifindex;
    struct in_addr ipi_spec_dst;
    struct in_addr ipi_addr;
  };
extern uint32_t ntohl (uint32_t __netlong) __attribute__ ((__nothrow__)) __attribute__ ((__const__));
extern uint16_t ntohs (uint16_t __netshort)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__));
extern uint32_t htonl (uint32_t __hostlong)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__));
extern uint16_t htons (uint16_t __hostshort)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__));




extern int bindresvport (int __sockfd, struct sockaddr_in *__sock_in) __attribute__ ((__nothrow__));


extern int bindresvport6 (int __sockfd, struct sockaddr_in6 *__sock_in)
     __attribute__ ((__nothrow__));
struct in6_pktinfo
  {
    struct in6_addr ipi6_addr;
    unsigned int ipi6_ifindex;
  };








struct rpcent
{
  char *r_name;
  char **r_aliases;
  int r_number;
};

extern void setrpcent (int __stayopen) __attribute__ ((__nothrow__));
extern void endrpcent (void) __attribute__ ((__nothrow__));
extern struct rpcent *getrpcbyname (__const char *__name) __attribute__ ((__nothrow__));
extern struct rpcent *getrpcbynumber (int __number) __attribute__ ((__nothrow__));
extern struct rpcent *getrpcent (void) __attribute__ ((__nothrow__));


extern int getrpcbyname_r (__const char *__name, struct rpcent *__result_buf,
      char *__buffer, size_t __buflen,
      struct rpcent **__result) __attribute__ ((__nothrow__));

extern int getrpcbynumber_r (int __number, struct rpcent *__result_buf,
        char *__buffer, size_t __buflen,
        struct rpcent **__result) __attribute__ ((__nothrow__));

extern int getrpcent_r (struct rpcent *__result_buf, char *__buffer,
   size_t __buflen, struct rpcent **__result) __attribute__ ((__nothrow__));



struct netent
{
  char *n_name;
  char **n_aliases;
  int n_addrtype;
  uint32_t n_net;
};







extern int *__h_errno_location (void) __attribute__ ((__nothrow__)) __attribute__ ((__const__));
extern void herror (__const char *__str) __attribute__ ((__nothrow__));


extern __const char *hstrerror (int __err_num) __attribute__ ((__nothrow__));




struct hostent
{
  char *h_name;
  char **h_aliases;
  int h_addrtype;
  int h_length;
  char **h_addr_list;

};






extern void sethostent (int __stay_open);





extern void endhostent (void);






extern struct hostent *gethostent (void);






extern struct hostent *gethostbyaddr (__const void *__addr, __socklen_t __len,
          int __type);





extern struct hostent *gethostbyname (__const char *__name);
extern struct hostent *gethostbyname2 (__const char *__name, int __af);
extern int gethostent_r (struct hostent *__restrict __result_buf,
    char *__restrict __buf, size_t __buflen,
    struct hostent **__restrict __result,
    int *__restrict __h_errnop);

extern int gethostbyaddr_r (__const void *__restrict __addr, __socklen_t __len,
       int __type,
       struct hostent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct hostent **__restrict __result,
       int *__restrict __h_errnop);

extern int gethostbyname_r (__const char *__restrict __name,
       struct hostent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct hostent **__restrict __result,
       int *__restrict __h_errnop);

extern int gethostbyname2_r (__const char *__restrict __name, int __af,
        struct hostent *__restrict __result_buf,
        char *__restrict __buf, size_t __buflen,
        struct hostent **__restrict __result,
        int *__restrict __h_errnop);
extern void setnetent (int __stay_open);





extern void endnetent (void);






extern struct netent *getnetent (void);






extern struct netent *getnetbyaddr (uint32_t __net, int __type);





extern struct netent *getnetbyname (__const char *__name);
extern int getnetent_r (struct netent *__restrict __result_buf,
   char *__restrict __buf, size_t __buflen,
   struct netent **__restrict __result,
   int *__restrict __h_errnop);

extern int getnetbyaddr_r (uint32_t __net, int __type,
      struct netent *__restrict __result_buf,
      char *__restrict __buf, size_t __buflen,
      struct netent **__restrict __result,
      int *__restrict __h_errnop);

extern int getnetbyname_r (__const char *__restrict __name,
      struct netent *__restrict __result_buf,
      char *__restrict __buf, size_t __buflen,
      struct netent **__restrict __result,
      int *__restrict __h_errnop);




struct servent
{
  char *s_name;
  char **s_aliases;
  int s_port;
  char *s_proto;
};






extern void setservent (int __stay_open);





extern void endservent (void);






extern struct servent *getservent (void);






extern struct servent *getservbyname (__const char *__name,
          __const char *__proto);






extern struct servent *getservbyport (int __port, __const char *__proto);
extern int getservent_r (struct servent *__restrict __result_buf,
    char *__restrict __buf, size_t __buflen,
    struct servent **__restrict __result);

extern int getservbyname_r (__const char *__restrict __name,
       __const char *__restrict __proto,
       struct servent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct servent **__restrict __result);

extern int getservbyport_r (int __port, __const char *__restrict __proto,
       struct servent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct servent **__restrict __result);




struct protoent
{
  char *p_name;
  char **p_aliases;
  int p_proto;
};






extern void setprotoent (int __stay_open);





extern void endprotoent (void);






extern struct protoent *getprotoent (void);





extern struct protoent *getprotobyname (__const char *__name);





extern struct protoent *getprotobynumber (int __proto);
extern int getprotoent_r (struct protoent *__restrict __result_buf,
     char *__restrict __buf, size_t __buflen,
     struct protoent **__restrict __result);

extern int getprotobyname_r (__const char *__restrict __name,
        struct protoent *__restrict __result_buf,
        char *__restrict __buf, size_t __buflen,
        struct protoent **__restrict __result);

extern int getprotobynumber_r (int __proto,
          struct protoent *__restrict __result_buf,
          char *__restrict __buf, size_t __buflen,
          struct protoent **__restrict __result);
extern int setnetgrent (__const char *__netgroup);







extern void endnetgrent (void);
extern int getnetgrent (char **__restrict __hostp,
   char **__restrict __userp,
   char **__restrict __domainp);
extern int innetgr (__const char *__netgroup, __const char *__host,
      __const char *__user, __const char *domain);







extern int getnetgrent_r (char **__restrict __hostp,
     char **__restrict __userp,
     char **__restrict __domainp,
     char *__restrict __buffer, size_t __buflen);
extern int rcmd (char **__restrict __ahost, unsigned short int __rport,
   __const char *__restrict __locuser,
   __const char *__restrict __remuser,
   __const char *__restrict __cmd, int *__restrict __fd2p);
extern int rcmd_af (char **__restrict __ahost, unsigned short int __rport,
      __const char *__restrict __locuser,
      __const char *__restrict __remuser,
      __const char *__restrict __cmd, int *__restrict __fd2p,
      sa_family_t __af);
extern int rexec (char **__restrict __ahost, int __rport,
    __const char *__restrict __name,
    __const char *__restrict __pass,
    __const char *__restrict __cmd, int *__restrict __fd2p);
extern int rexec_af (char **__restrict __ahost, int __rport,
       __const char *__restrict __name,
       __const char *__restrict __pass,
       __const char *__restrict __cmd, int *__restrict __fd2p,
       sa_family_t __af);
extern int ruserok (__const char *__rhost, int __suser,
      __const char *__remuser, __const char *__locuser);
extern int ruserok_af (__const char *__rhost, int __suser,
         __const char *__remuser, __const char *__locuser,
         sa_family_t __af);
extern int rresvport (int *__alport);
extern int rresvport_af (int *__alport, sa_family_t __af);






struct addrinfo
{
  int ai_flags;
  int ai_family;
  int ai_socktype;
  int ai_protocol;
  socklen_t ai_addrlen;
  struct sockaddr *ai_addr;
  char *ai_canonname;
  struct addrinfo *ai_next;
};
extern int getaddrinfo (__const char *__restrict __name,
   __const char *__restrict __service,
   __const struct addrinfo *__restrict __req,
   struct addrinfo **__restrict __pai);


extern void freeaddrinfo (struct addrinfo *__ai) __attribute__ ((__nothrow__));


extern __const char *gai_strerror (int __ecode) __attribute__ ((__nothrow__));





extern int getnameinfo (__const struct sockaddr *__restrict __sa,
   socklen_t __salen, char *__restrict __host,
   socklen_t __hostlen, char *__restrict __serv,
   socklen_t __servlen, unsigned int __flags);




typedef unsigned int LinkSockLen;

typedef enum {
 LINK_PROTOCOL_SECURE = 1<<0,
 LINK_PROTOCOL_NEEDS_BIND = 1<<1
} LinkProtocolFlags;

typedef void (*LinkProtocolSetupFunc) (int fd,
          LinkConnectionOptions cnx_flags);
typedef void (*LinkProtocolDestroyFunc) (int fd,
          const char *host_info,
          const char *serv_info);
typedef struct sockaddr *(*LinkProtocolGetSockAddrFunc) (const LinkProtocolInfo *proto,
        const char *hostname,
        const char *service,
        LinkSockLen *saddr_len);

typedef gboolean (*LinkProtocolGetSockInfoFunc) (const LinkProtocolInfo *proto,
       const struct sockaddr *sockaddr,
       gchar **hostname,
       gchar **service);

typedef gboolean (*LinkProtocolIsLocal) (const LinkProtocolInfo *proto,
       const struct sockaddr *sockaddr,
       LinkSockLen saddr_len);

struct _LinkProtocolInfo {
 const char *name;
 int family;
 int addr_len;
 int stream_proto_num;
 LinkProtocolFlags flags;

 LinkProtocolSetupFunc setup;
 LinkProtocolDestroyFunc destroy;
 LinkProtocolGetSockAddrFunc get_sockaddr;
 LinkProtocolGetSockInfoFunc get_sockinfo;
 LinkProtocolIsLocal is_local;

 gpointer dummy[8];
};

typedef enum {
 LINK_NET_ID_IS_LOCAL,
 LINK_NET_ID_IS_SHORT_HOSTNAME,
 LINK_NET_ID_IS_FQDN,
 LINK_NET_ID_IS_IPADDR
} LinkNetIdType;


LinkProtocolInfo * link_protocol_find (const char *name);
LinkProtocolInfo * link_protocol_find_num (const int family);
LinkProtocolInfo * link_protocol_all (void);
char *link_get_tmpdir (void);
void link_set_tmpdir (const char *dir);
void link_use_local_hostname (LinkNetIdType use);
const char* link_get_local_hostname (void);



typedef enum { LINK_CONNECTING, LINK_CONNECTED, LINK_DISCONNECTED } LinkConnectionStatus;

typedef struct _LinkWriteOpts LinkWriteOpts;
typedef struct _LinkConnectionPrivate LinkConnectionPrivate;

typedef struct {
 GObject parent;

 const LinkProtocolInfo *proto;

 LinkConnectionStatus status;
 LinkConnectionOptions options;
 guint was_initiated : 1;
 guint is_auth : 1;
 guint inhibit_reconnect : 1;

 gchar *remote_host_info;
 gchar *remote_serv_info;

 LinkConnectionPrivate *priv;

 GSList *idle_broken_callbacks;
} LinkConnection;

typedef struct {
 GObjectClass parent_class;

 void (* state_changed) (LinkConnection *cnx,
        LinkConnectionStatus status);
 gboolean (* handle_input) (LinkConnection *cnx);


 void (* broken) (LinkConnection *cnx);




 void (* blocking) (LinkConnection *cnx,
        gulong buffer_size);
} LinkConnectionClass;

GType link_connection_get_type (void) __attribute__((__const__));

void link_connection_from_fd (LinkConnection *cnx,
       int fd,
       const LinkProtocolInfo *proto,
       gchar *remote_host_info,
       gchar *remote_serv_info,
       gboolean was_initiated,
       LinkConnectionStatus status,
       LinkConnectionOptions options);

LinkConnection *link_connection_initiate (GType derived_type,
       const char *proto_name,
       const char *remote_host_info,
       const char *remote_serv_info,
       LinkConnectionOptions options,
       const char *first_property,
       ...);
LinkConnectionStatus link_connection_try_reconnect (LinkConnection *cnx);

gpointer link_connection_ref (gpointer cnx);
void link_connection_unref (gpointer cnx);

typedef enum {
 LINK_IO_OK = 0,
 LINK_IO_FATAL_ERROR = -1,
 LINK_IO_QUEUED_DATA = -2
} LinkIOStatus;

glong link_connection_read (LinkConnection *cnx,
           guchar *buf,
           int len,
           gboolean block_for_full_read);



LinkIOStatus link_connection_write (LinkConnection *cnx,
           const guchar *buf,
           gulong len,
           const LinkWriteOpts *opt_write_opts);

LinkIOStatus link_connection_writev (LinkConnection *cnx,
           struct iovec *vecs,
           int nvecs,
           const LinkWriteOpts *opt_write_opts);

void link_connection_state_changed (LinkConnection *cnx,
         LinkConnectionStatus status);

LinkConnectionStatus link_connection_get_status (LinkConnection *cnx);
void link_connection_disconnect (LinkConnection *cnx);
LinkConnectionStatus link_connection_wait_connected (LinkConnection *cnx);




void link_connection_set_max_buffer (LinkConnection *cnx,
        gulong max_buffer_bytes);
LinkWriteOpts *link_write_options_new (gboolean block_on_write);

void link_write_options_free (LinkWriteOpts *write_opts);


typedef void (*LinkBrokenCallback) (LinkConnection *, gpointer user_data);
void link_connection_add_broken_cb (LinkConnection *cnx,
        LinkBrokenCallback fn,
        gpointer user_data);
void link_connection_remove_broken_cb (LinkConnection *cnx,
        LinkBrokenCallback opt_fn,
        gpointer opt_user_data);

void link_connections_close (void);



typedef struct _LinkServerPrivate LinkServerPrivate;

typedef struct {
 GObject parent;

 const LinkProtocolInfo *proto;

 char *local_host_info;
 char *local_serv_info;


 LinkConnectionOptions create_options;

 LinkServerPrivate *priv;
} LinkServer;

typedef struct {
 GObjectClass parent_class;

 LinkConnection *(* create_connection) (LinkServer *srv);

 void (* new_connection) (LinkServer *srv,
            LinkConnection *cnx);
} LinkServerClass;

GType link_server_get_type (void) __attribute__((__const__));

gboolean link_server_setup (LinkServer *srv,
          const char *proto_name,
          const char *local_host_info,
          const char *local_serv_info,
          LinkConnectionOptions create_options);







GSource *link_source_create_watch (GMainContext *context,
        int fd,
        GIOChannel *opt_channel,
        GIOCondition condition,
        GIOFunc func,
        gpointer user_data);
void link_source_set_condition (GSource *source,
        GIOCondition condition);





extern GMainLoop *link_loop;

void link_init (gboolean thread_safe);
void link_set_io_thread (gboolean io_in_thread);
void link_shutdown (void);
void link_main_iteration (gboolean block_for_reply);
gboolean link_main_pending (void);
void link_main_loop_run (void);
GMainLoop *link_main_get_loop (void);
guint link_main_idle_add (GSourceFunc function,
      gpointer data);

void link_wait (void);
void link_signal (void);

gboolean link_thread_io (void);
gboolean link_thread_safe (void);





int link_pipe (int *handles);







typedef struct _GIOPRecvBuffer GIOPRecvBuffer;
typedef struct _GIOPSendBuffer GIOPSendBuffer;
typedef struct _GIOPConnection GIOPConnection;

typedef enum {
  GIOP_1_0,
  GIOP_1_1,
  GIOP_1_2,
  GIOP_LATEST = GIOP_1_2,
  GIOP_NUM_VERSIONS
} GIOPVersion;














typedef struct CORBA_any_struct CORBA_any;

typedef struct {
        CORBA_unsigned_short _digits;
        CORBA_short _scale;
        signed char _sign;
        signed char _value[1];
} CORBA_fixed_d_s;

struct CORBA_NVList_type {
 CORBA_unsigned_long flags;
 GArray *list;
};











typedef struct CORBA_TypeCode_struct *CORBA_TypeCode;









struct CORBA_any_struct {
 CORBA_TypeCode _type;
 gpointer _value;
 CORBA_boolean _release;
};












 typedef struct CORBA_Environment_type CORBA_Environment;


struct CORBA_Environment_type {
 CORBA_char *_id;
 CORBA_unsigned_long _major;
 CORBA_any _any;
};








typedef enum {
 ORBIT_ROT_NULL,
 ORBIT_ROT_OBJREF,

 ORBIT_ROT_ORB,
 ORBIT_ROT_ADAPTOR,
 ORBIT_ROT_POAMANAGER,
 ORBIT_ROT_POLICY,
 ORBIT_ROT_TYPECODE,
 ORBIT_ROT_REQUEST,
 ORBIT_ROT_SERVERREQUEST,
 ORBIT_ROT_CONTEXT,
 ORBIT_ROT_DYNANY,
 ORBIT_ROT_OAOBJECT,
 ORBIT_ROT_ORBGROUP,
 ORBIT_ROT_POACURRENT,
 ORBIT_ROT_CLIENT_POLICY
} ORBit_RootObject_Type;

typedef struct ORBit_RootObject_struct *ORBit_RootObject;

typedef void (* ORBit_RootObject_DestroyFunc) (ORBit_RootObject obj);

typedef struct _ORBit_RootObject_Interface {
 ORBit_RootObject_Type type;
 ORBit_RootObject_DestroyFunc destroy;
} ORBit_RootObject_Interface;

struct ORBit_RootObject_struct {
 const ORBit_RootObject_Interface *interface;
  int refs;
};



void ORBit_RootObject_init (ORBit_RootObject obj,
         const ORBit_RootObject_Interface *interface);
gpointer ORBit_RootObject_duplicate (gpointer obj);
gpointer ORBit_RootObject_duplicate_T (gpointer obj);
void ORBit_RootObject_release (gpointer obj);
void ORBit_RootObject_release_T (gpointer obj);

extern GMutex *ORBit_RootObject_lifecycle_lock;










typedef struct CORBA_ORB_type *CORBA_ORB;




   typedef CORBA_string CORBA_ORB_ObjectId;
   extern const struct CORBA_TypeCode_struct TC_CORBA_ORB_ObjectId_struct;
   typedef CORBA_Object CORBA_InterfaceDef;
   extern CORBA_unsigned_long CORBA_InterfaceDef__classid;
   extern const struct CORBA_TypeCode_struct TC_CORBA_InterfaceDef_struct;






struct CORBA_ORB_type {
 struct ORBit_RootObject_struct root_object;

 GMutex *lock;

 GIOPVersion default_giop_version;

 GSList *servers;
 GSList *profiles;
 GPtrArray *adaptors;
 GHashTable *forw_binds;
 GSList *current_invocations;
 gpointer default_ctx;
 GHashTable *initial_refs;
 guint life_flags;





 GHashTable *objrefs;
};














typedef struct {
 CORBA_unsigned_long len;
 const CORBA_char *str;
} ORBit_ContextMarshalItem;

















struct CORBA_TypeCode_struct {
 struct ORBit_RootObject_struct parent;
 CORBA_unsigned_long kind;
 CORBA_unsigned_long flags;
 CORBA_short c_length;
 CORBA_short c_align;
 CORBA_unsigned_long length;
 CORBA_unsigned_long sub_parts;
 CORBA_TypeCode *subtypes;
 CORBA_TypeCode discriminator;
 char *name;
 char *repo_id;
 char **subnames;
 CORBA_long *sublabels;
 CORBA_long default_index;
 CORBA_unsigned_long recurse_depth;
 CORBA_unsigned_short digits;
 CORBA_short scale;
};

extern const ORBit_RootObject_Interface ORBit_TypeCode_epv;
extern const struct CORBA_TypeCode_struct TC_null_struct;
extern const struct CORBA_TypeCode_struct TC_void_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_char_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_wchar_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_string_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_wstring_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_long_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_unsigned_long_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_short_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_unsigned_short_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_octet_struct;

extern const struct CORBA_TypeCode_struct TC_CORBA_Object_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_any_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_TypeCode_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_boolean_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_float_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_double_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_long_double_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_long_long_struct;
extern const struct CORBA_TypeCode_struct TC_CORBA_unsigned_long_long_struct;





void ORBit_encode_CORBA_TypeCode (CORBA_TypeCode tc,
      GIOPSendBuffer *buf);
gboolean ORBit_decode_CORBA_TypeCode (CORBA_TypeCode *tc,
      GIOPRecvBuffer *buf);

const char *ORBit_tk_to_name (CORBA_unsigned_long tk);














void CORBA_free (gpointer mem);
gpointer ORBit_alloc_tcval (CORBA_TypeCode tc,
         guint nelements);
gpointer ORBit_realloc_tcval (gpointer old,
         CORBA_TypeCode tc,
         guint old_num_elements,
         guint num_elements);
typedef gpointer (*ORBit_Mem_free_fn) (gpointer mem,
           gpointer func_data);





typedef enum {
 ORBIT_MEMHOW_NONE = 0,
 ORBIT_MEMHOW_SIMPLE = 1,
 ORBIT_MEMHOW_TYPECODE = 2,
 ORBIT_MEMHOW_FREEFNC = 3
} ORBitMemHow;

typedef struct ORBit_Memprefix {
 union {
  CORBA_TypeCode tc;
  ORBit_Mem_free_fn free_fn;
 } u;
 ORBitMemHow how;
} ORBit_MemPrefix;

void ORBit_free (gpointer mem);
void ORBit_free_T (gpointer mem);

CORBA_char *ORBit_alloc_string (size_t string_length);
gpointer ORBit_alloc_simple (size_t block_size);
gpointer ORBit_alloc_by_tc (CORBA_TypeCode tc);
gpointer ORBit_alloc_with_free_fn (size_t element_size,
          guint num_elements,
          ORBit_Mem_free_fn free_fn);
CORBA_TypeCode ORBit_alloc_get_tcval (gpointer mem);

gpointer CORBA_any__freekids (gpointer mem, gpointer dat);
gpointer ORBit_freekids_via_TypeCode (CORBA_TypeCode tc, gpointer mem);






typedef CORBA_Object CORBA_ConstructionPolicy;
extern CORBA_unsigned_long CORBA_ConstructionPolicy__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ConstructionPolicy_struct;







typedef CORBA_Object CORBA_Current;
extern CORBA_unsigned_long CORBA_Current__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_Current_struct;







typedef CORBA_Object CORBA_DomainManager;
extern CORBA_unsigned_long CORBA_DomainManager__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_DomainManager_struct;







typedef CORBA_Object CORBA_Policy;
extern CORBA_unsigned_long CORBA_Policy__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_Policy_struct;







typedef CORBA_Object CORBA_AbstractInterfaceDef;
extern CORBA_unsigned_long CORBA_AbstractInterfaceDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_AbstractInterfaceDef_struct;







typedef CORBA_Object CORBA_AliasDef;
extern CORBA_unsigned_long CORBA_AliasDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_AliasDef_struct;







typedef CORBA_Object CORBA_ArrayDef;
extern CORBA_unsigned_long CORBA_ArrayDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ArrayDef_struct;







typedef CORBA_Object CORBA_AttributeDef;
extern CORBA_unsigned_long CORBA_AttributeDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_AttributeDef_struct;







typedef CORBA_Object CORBA_ConstantDef;
extern CORBA_unsigned_long CORBA_ConstantDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ConstantDef_struct;







typedef CORBA_Object CORBA_Contained;
extern CORBA_unsigned_long CORBA_Contained__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_Contained_struct;







typedef CORBA_Object CORBA_Container;
extern CORBA_unsigned_long CORBA_Container__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_Container_struct;







typedef CORBA_Object CORBA_EnumDef;
extern CORBA_unsigned_long CORBA_EnumDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_EnumDef_struct;







typedef CORBA_Object CORBA_ExceptionDef;
extern CORBA_unsigned_long CORBA_ExceptionDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExceptionDef_struct;







typedef CORBA_Object CORBA_ExtInterfaceDef;
extern CORBA_unsigned_long CORBA_ExtInterfaceDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExtInterfaceDef_struct;







typedef CORBA_Object CORBA_ExtValueDef;
extern CORBA_unsigned_long CORBA_ExtValueDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExtValueDef_struct;







typedef CORBA_Object CORBA_ExtAbstractInterfaceDef;
extern CORBA_unsigned_long CORBA_ExtAbstractInterfaceDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExtAbstractInterfaceDef_struct;







typedef CORBA_Object CORBA_ExtLocalInterfaceDef;
extern CORBA_unsigned_long CORBA_ExtLocalInterfaceDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExtLocalInterfaceDef_struct;







typedef CORBA_Object CORBA_FixedDef;
extern CORBA_unsigned_long CORBA_FixedDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_FixedDef_struct;







typedef CORBA_Object CORBA_IDLType;
extern CORBA_unsigned_long CORBA_IDLType__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_IDLType_struct;
typedef CORBA_Object CORBA_IRObject;
extern CORBA_unsigned_long CORBA_IRObject__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_IRObject_struct;







typedef CORBA_Object CORBA_LocalInterfaceDef;
extern CORBA_unsigned_long CORBA_LocalInterfaceDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_LocalInterfaceDef_struct;







typedef CORBA_Object CORBA_ModuleDef;
extern CORBA_unsigned_long CORBA_ModuleDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ModuleDef_struct;







typedef CORBA_Object CORBA_NativeDef;
extern CORBA_unsigned_long CORBA_NativeDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_NativeDef_struct;







typedef CORBA_Object CORBA_OperationDef;
extern CORBA_unsigned_long CORBA_OperationDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_OperationDef_struct;







typedef CORBA_Object CORBA_PrimitiveDef;
extern CORBA_unsigned_long CORBA_PrimitiveDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_PrimitiveDef_struct;







typedef CORBA_Object CORBA_Repository;
extern CORBA_unsigned_long CORBA_Repository__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_Repository_struct;







typedef CORBA_Object CORBA_SequenceDef;
extern CORBA_unsigned_long CORBA_SequenceDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_SequenceDef_struct;







typedef CORBA_Object CORBA_StringDef;
extern CORBA_unsigned_long CORBA_StringDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_StringDef_struct;







typedef CORBA_Object CORBA_StructDef;
extern CORBA_unsigned_long CORBA_StructDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_StructDef_struct;
typedef CORBA_Object CORBA_TypedefDef;
extern CORBA_unsigned_long CORBA_TypedefDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_TypedefDef_struct;







typedef CORBA_Object CORBA_UnionDef;
extern CORBA_unsigned_long CORBA_UnionDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_UnionDef_struct;







typedef CORBA_Object CORBA_ValueDef;
extern CORBA_unsigned_long CORBA_ValueDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ValueDef_struct;







typedef CORBA_Object CORBA_ValueBoxDef;
extern CORBA_unsigned_long CORBA_ValueBoxDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ValueBoxDef_struct;







typedef CORBA_Object CORBA_ValueMemberDef;
extern CORBA_unsigned_long CORBA_ValueMemberDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ValueMemberDef_struct;







typedef CORBA_Object CORBA_WstringDef;
extern CORBA_unsigned_long CORBA_WstringDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_WstringDef_struct;





typedef CORBA_string CORBA_Identifier;
extern

const struct CORBA_TypeCode_struct TC_CORBA_Identifier_struct;
typedef enum {
  CORBA_COMPLETED_YES,
  CORBA_COMPLETED_NO,
  CORBA_COMPLETED_MAYBE
} CORBA_completion_status;
extern

const struct CORBA_TypeCode_struct TC_CORBA_completion_status_struct;





typedef enum {
  CORBA_NO_EXCEPTION,
  CORBA_USER_EXCEPTION,
  CORBA_SYSTEM_EXCEPTION
} CORBA_exception_type;
extern

const struct CORBA_TypeCode_struct TC_CORBA_exception_type_struct;







typedef struct CORBA_UNKNOWN_type CORBA_UNKNOWN;
struct CORBA_UNKNOWN_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_UNKNOWN_struct;
typedef struct CORBA_BAD_PARAM_type CORBA_BAD_PARAM;
struct CORBA_BAD_PARAM_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_BAD_PARAM_struct;
typedef struct CORBA_NO_MEMORY_type CORBA_NO_MEMORY;
struct CORBA_NO_MEMORY_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_NO_MEMORY_struct;
typedef struct CORBA_IMP_LIMIT_type CORBA_IMP_LIMIT;
struct CORBA_IMP_LIMIT_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_IMP_LIMIT_struct;
typedef struct CORBA_COMM_FAILURE_type CORBA_COMM_FAILURE;
struct CORBA_COMM_FAILURE_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_COMM_FAILURE_struct;
typedef struct CORBA_INV_OBJREF_type CORBA_INV_OBJREF;
struct CORBA_INV_OBJREF_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_INV_OBJREF_struct;
typedef struct CORBA_NO_PERMISSION_type CORBA_NO_PERMISSION;
struct CORBA_NO_PERMISSION_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_NO_PERMISSION_struct;
typedef struct CORBA_INTERNAL_type CORBA_INTERNAL;
struct CORBA_INTERNAL_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_INTERNAL_struct;
typedef struct CORBA_MARSHAL_type CORBA_MARSHAL;
struct CORBA_MARSHAL_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_MARSHAL_struct;
typedef struct CORBA_INITIALIZE_type CORBA_INITIALIZE;
struct CORBA_INITIALIZE_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_INITIALIZE_struct;
typedef struct CORBA_NO_IMPLEMENT_type CORBA_NO_IMPLEMENT;
struct CORBA_NO_IMPLEMENT_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_NO_IMPLEMENT_struct;
typedef struct CORBA_BAD_TYPECODE_type CORBA_BAD_TYPECODE;
struct CORBA_BAD_TYPECODE_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_BAD_TYPECODE_struct;
typedef struct CORBA_BAD_OPERATION_type CORBA_BAD_OPERATION;
struct CORBA_BAD_OPERATION_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_BAD_OPERATION_struct;
typedef struct CORBA_NO_RESOURCES_type CORBA_NO_RESOURCES;
struct CORBA_NO_RESOURCES_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_NO_RESOURCES_struct;
typedef struct CORBA_NO_RESPONSE_type CORBA_NO_RESPONSE;
struct CORBA_NO_RESPONSE_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_NO_RESPONSE_struct;
typedef struct CORBA_PERSIST_STORE_type CORBA_PERSIST_STORE;
struct CORBA_PERSIST_STORE_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_PERSIST_STORE_struct;
typedef struct CORBA_BAD_INV_ORDER_type CORBA_BAD_INV_ORDER;
struct CORBA_BAD_INV_ORDER_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_BAD_INV_ORDER_struct;
typedef struct CORBA_TRANSIENT_type CORBA_TRANSIENT;
struct CORBA_TRANSIENT_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_TRANSIENT_struct;
typedef struct CORBA_FREE_MEM_type CORBA_FREE_MEM;
struct CORBA_FREE_MEM_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_FREE_MEM_struct;
typedef struct CORBA_INV_IDENT_type CORBA_INV_IDENT;
struct CORBA_INV_IDENT_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_INV_IDENT_struct;
typedef struct CORBA_INV_FLAG_type CORBA_INV_FLAG;
struct CORBA_INV_FLAG_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_INV_FLAG_struct;
typedef struct CORBA_INTF_REPOS_type CORBA_INTF_REPOS;
struct CORBA_INTF_REPOS_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_INTF_REPOS_struct;
typedef struct CORBA_BAD_CONTEXT_type CORBA_BAD_CONTEXT;
struct CORBA_BAD_CONTEXT_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_BAD_CONTEXT_struct;
typedef struct CORBA_OBJ_ADAPTER_type CORBA_OBJ_ADAPTER;
struct CORBA_OBJ_ADAPTER_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_OBJ_ADAPTER_struct;
typedef struct CORBA_DATA_CONVERSION_type CORBA_DATA_CONVERSION;
struct CORBA_DATA_CONVERSION_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_DATA_CONVERSION_struct;
typedef struct CORBA_OBJECT_NOT_EXIST_type CORBA_OBJECT_NOT_EXIST;
struct CORBA_OBJECT_NOT_EXIST_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_OBJECT_NOT_EXIST_struct;
typedef struct CORBA_TRANSACTION_REQUIRED_type CORBA_TRANSACTION_REQUIRED;
struct CORBA_TRANSACTION_REQUIRED_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_TRANSACTION_REQUIRED_struct;
typedef struct CORBA_TRANSACTION_ROLLEDBACK_type CORBA_TRANSACTION_ROLLEDBACK;
struct CORBA_TRANSACTION_ROLLEDBACK_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_TRANSACTION_ROLLEDBACK_struct;
typedef struct CORBA_INVALID_TRANSACTION_type CORBA_INVALID_TRANSACTION;
struct CORBA_INVALID_TRANSACTION_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_INVALID_TRANSACTION_struct;
typedef struct CORBA_INV_POLICY_type CORBA_INV_POLICY;
struct CORBA_INV_POLICY_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_INV_POLICY_struct;
typedef struct CORBA_CODESET_INCOMPATIBLE_type CORBA_CODESET_INCOMPATIBLE;
struct CORBA_CODESET_INCOMPATIBLE_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_CODESET_INCOMPATIBLE_struct;
typedef struct CORBA_REBIND_type CORBA_REBIND;
struct CORBA_REBIND_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_REBIND_struct;
typedef struct CORBA_TIMEOUT_type CORBA_TIMEOUT;
struct CORBA_TIMEOUT_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_TIMEOUT_struct;
typedef struct CORBA_TRANSACTION_UNAVAILABLE_type CORBA_TRANSACTION_UNAVAILABLE;
struct CORBA_TRANSACTION_UNAVAILABLE_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_TRANSACTION_UNAVAILABLE_struct;
typedef struct CORBA_TRANSACTION_MODE_type CORBA_TRANSACTION_MODE;
struct CORBA_TRANSACTION_MODE_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_TRANSACTION_MODE_struct;
typedef struct CORBA_BAD_QOS_type CORBA_BAD_QOS;
struct CORBA_BAD_QOS_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_BAD_QOS_struct;
typedef CORBA_unsigned_long CORBA_PolicyType;
extern

const struct CORBA_TypeCode_struct TC_CORBA_PolicyType_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_Object* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_Object;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_Object_struct;
typedef CORBA_sequence_CORBA_Object CORBA_sequence_CORBA_Policy;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_Policy_struct;
typedef CORBA_sequence_CORBA_Policy CORBA_PolicyList;
extern

const struct CORBA_TypeCode_struct TC_CORBA_PolicyList_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_unsigned_long* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_unsigned_long;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_unsigned_long_struct;
typedef CORBA_sequence_CORBA_unsigned_long CORBA_sequence_CORBA_PolicyType;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_PolicyType_struct;
typedef CORBA_sequence_CORBA_PolicyType CORBA_PolicyTypeSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_PolicyTypeSeq_struct;
typedef struct CORBA_InvalidPolicies_type CORBA_InvalidPolicies;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_unsigned_short* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_unsigned_short;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_unsigned_short_struct;







struct CORBA_InvalidPolicies_type {
CORBA_sequence_CORBA_unsigned_short indices;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_InvalidPolicies_struct;







typedef CORBA_short CORBA_PolicyErrorCode;
extern

const struct CORBA_TypeCode_struct TC_CORBA_PolicyErrorCode_struct;
typedef struct CORBA_PolicyError_type CORBA_PolicyError;
struct CORBA_PolicyError_type {
CORBA_PolicyErrorCode reason;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_PolicyError_struct;
typedef CORBA_sequence_CORBA_Object CORBA_sequence_CORBA_DomainManager;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_DomainManager_struct;
typedef CORBA_sequence_CORBA_DomainManager CORBA_DomainManagersList;
extern

const struct CORBA_TypeCode_struct TC_CORBA_DomainManagersList_struct;
typedef CORBA_string CORBA_ScopedName;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ScopedName_struct;







typedef CORBA_string CORBA_RepositoryId;
extern

const struct CORBA_TypeCode_struct TC_CORBA_RepositoryId_struct;







typedef enum {
  CORBA_dk_none,
  CORBA_dk_all,
  CORBA_dk_Attribute,
  CORBA_dk_Constant,
  CORBA_dk_Exception,
  CORBA_dk_Interface,
  CORBA_dk_Module,
  CORBA_dk_Operation,
  CORBA_dk_Typedef,
  CORBA_dk_Alias,
  CORBA_dk_Struct,
  CORBA_dk_Union,
  CORBA_dk_Enum,
  CORBA_dk_Primitive,
  CORBA_dk_String,
  CORBA_dk_Sequence,
  CORBA_dk_Array,
  CORBA_dk_Repository,
  CORBA_dk_Wstring,
  CORBA_dk_Fixed,
  CORBA_dk_Value,
  CORBA_dk_ValueBox,
  CORBA_dk_ValueMember,
  CORBA_dk_Native,
  CORBA_dk_AbstractInterface,
  CORBA_dk_LocalInterface,
  CORBA_dk_Component,
  CORBA_dk_Home,
  CORBA_dk_Factory,
  CORBA_dk_Finder,
  CORBA_dk_Emits,
  CORBA_dk_Publishes,
  CORBA_dk_Consumes,
  CORBA_dk_Provides,
  CORBA_dk_Uses,
  CORBA_dk_Event
} CORBA_DefinitionKind;
extern

const struct CORBA_TypeCode_struct TC_CORBA_DefinitionKind_struct;
typedef CORBA_string CORBA_VersionSpec;
extern

const struct CORBA_TypeCode_struct TC_CORBA_VersionSpec_struct;
typedef struct CORBA_Contained_Description_type CORBA_Contained_Description;
struct CORBA_Contained_Description_type {
CORBA_DefinitionKind kind;
CORBA_any value;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_Contained_Description_struct;
typedef CORBA_sequence_CORBA_Object CORBA_sequence_CORBA_InterfaceDef;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_InterfaceDef_struct;
typedef CORBA_sequence_CORBA_InterfaceDef CORBA_InterfaceDefSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_InterfaceDefSeq_struct;
typedef CORBA_sequence_CORBA_Object CORBA_sequence_CORBA_ValueDef;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_ValueDef_struct;
typedef CORBA_sequence_CORBA_ValueDef CORBA_ValueDefSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ValueDefSeq_struct;
typedef CORBA_sequence_CORBA_Object CORBA_sequence_CORBA_AbstractInterfaceDef;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_AbstractInterfaceDef_struct;
typedef CORBA_sequence_CORBA_AbstractInterfaceDef CORBA_AbstractInterfaceDefSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_AbstractInterfaceDefSeq_struct;
typedef CORBA_sequence_CORBA_Object CORBA_sequence_CORBA_LocalInterfaceDef;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_LocalInterfaceDef_struct;
typedef CORBA_sequence_CORBA_LocalInterfaceDef CORBA_LocalInterfaceDefSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_LocalInterfaceDefSeq_struct;
typedef CORBA_sequence_CORBA_Object CORBA_sequence_CORBA_ExtInterfaceDef;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_ExtInterfaceDef_struct;
typedef CORBA_sequence_CORBA_ExtInterfaceDef CORBA_ExtInterfaceDefSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExtInterfaceDefSeq_struct;
typedef CORBA_sequence_CORBA_Object CORBA_sequence_CORBA_ExtValueDef;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_ExtValueDef_struct;
typedef CORBA_sequence_CORBA_ExtValueDef CORBA_ExtValueDefSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExtValueDefSeq_struct;
typedef CORBA_sequence_CORBA_Object CORBA_sequence_CORBA_ExtAbstractInterfaceDef;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_ExtAbstractInterfaceDef_struct;
typedef CORBA_sequence_CORBA_ExtAbstractInterfaceDef CORBA_ExtAbstractInterfaceDefSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExtAbstractInterfaceDefSeq_struct;
typedef CORBA_sequence_CORBA_Object CORBA_sequence_CORBA_ExtLocalInterfaceDef;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_ExtLocalInterfaceDef_struct;
typedef CORBA_sequence_CORBA_ExtLocalInterfaceDef CORBA_ExtLocalInterfaceDefSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExtLocalInterfaceDefSeq_struct;
typedef CORBA_sequence_CORBA_Object CORBA_sequence_CORBA_Contained;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_Contained_struct;
typedef CORBA_sequence_CORBA_Contained CORBA_ContainedSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ContainedSeq_struct;
typedef struct CORBA_StructMember_type CORBA_StructMember;
struct CORBA_StructMember_type {
CORBA_Identifier name;
CORBA_TypeCode type;
CORBA_IDLType type_def;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_StructMember_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_StructMember* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_StructMember;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_StructMember_struct;
typedef CORBA_sequence_CORBA_StructMember CORBA_StructMemberSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_StructMemberSeq_struct;
typedef struct CORBA_Initializer_type CORBA_Initializer;
struct CORBA_Initializer_type {
CORBA_StructMemberSeq members;
CORBA_Identifier name;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_Initializer_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_Initializer* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_Initializer;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_Initializer_struct;
typedef CORBA_sequence_CORBA_Initializer CORBA_InitializerSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_InitializerSeq_struct;
typedef struct CORBA_UnionMember_type CORBA_UnionMember;
struct CORBA_UnionMember_type {
CORBA_Identifier name;
CORBA_any label;
CORBA_TypeCode type;
CORBA_IDLType type_def;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_UnionMember_struct;







typedef struct CORBA_ExceptionDescription_type CORBA_ExceptionDescription;
struct CORBA_ExceptionDescription_type {
CORBA_Identifier name;
CORBA_RepositoryId id;
CORBA_RepositoryId defined_in;
CORBA_VersionSpec version;
CORBA_TypeCode type;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExceptionDescription_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_ExceptionDescription* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_ExceptionDescription;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_ExceptionDescription_struct;
typedef CORBA_sequence_CORBA_ExceptionDescription CORBA_ExcDescriptionSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExcDescriptionSeq_struct;
typedef struct CORBA_ExtInitializer_type CORBA_ExtInitializer;
struct CORBA_ExtInitializer_type {
CORBA_StructMemberSeq members;
CORBA_ExcDescriptionSeq exceptions;
CORBA_Identifier name;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExtInitializer_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_ExtInitializer* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_ExtInitializer;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_ExtInitializer_struct;
typedef CORBA_sequence_CORBA_ExtInitializer CORBA_ExtInitializerSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExtInitializerSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_UnionMember* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_UnionMember;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_UnionMember_struct;
typedef CORBA_sequence_CORBA_UnionMember CORBA_UnionMemberSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_UnionMemberSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_string* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_string;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_string_struct;
typedef CORBA_sequence_CORBA_string CORBA_sequence_CORBA_Identifier;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_Identifier_struct;
typedef CORBA_sequence_CORBA_Identifier CORBA_EnumMemberSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_EnumMemberSeq_struct;
typedef struct CORBA_Container_Description_type CORBA_Container_Description;
struct CORBA_Container_Description_type {
CORBA_Contained contained_object;
CORBA_DefinitionKind kind;
CORBA_any value;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_Container_Description_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_Container_Description* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_Container_Description;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_Container_Description_struct;
typedef CORBA_sequence_CORBA_Container_Description CORBA_Container_DescriptionSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_Container_DescriptionSeq_struct;
typedef enum {
  CORBA_pk_null,
  CORBA_pk_void,
  CORBA_pk_short,
  CORBA_pk_long,
  CORBA_pk_ushort,
  CORBA_pk_ulong,
  CORBA_pk_float,
  CORBA_pk_double,
  CORBA_pk_boolean,
  CORBA_pk_char,
  CORBA_pk_octet,
  CORBA_pk_any,
  CORBA_pk_TypeCode,
  CORBA_pk_Principal,
  CORBA_pk_string,
  CORBA_pk_objref,
  CORBA_pk_longlong,
  CORBA_pk_ulonglong,
  CORBA_pk_longdouble,
  CORBA_pk_wchar,
  CORBA_pk_wstring,
  CORBA_pk_value_base
} CORBA_PrimitiveKind;
extern

const struct CORBA_TypeCode_struct TC_CORBA_PrimitiveKind_struct;
typedef struct CORBA_ModuleDescription_type CORBA_ModuleDescription;
struct CORBA_ModuleDescription_type {
CORBA_Identifier name;
CORBA_RepositoryId id;
CORBA_RepositoryId defined_in;
CORBA_VersionSpec version;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_ModuleDescription_struct;
typedef struct CORBA_ConstantDescription_type CORBA_ConstantDescription;
struct CORBA_ConstantDescription_type {
CORBA_Identifier name;
CORBA_RepositoryId id;
CORBA_RepositoryId defined_in;
CORBA_VersionSpec version;
CORBA_TypeCode type;
CORBA_any value;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_ConstantDescription_struct;
typedef struct CORBA_TypeDescription_type CORBA_TypeDescription;
struct CORBA_TypeDescription_type {
CORBA_Identifier name;
CORBA_RepositoryId id;
CORBA_RepositoryId defined_in;
CORBA_VersionSpec version;
CORBA_TypeCode type;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_TypeDescription_struct;
typedef enum {
  CORBA_ATTR_NORMAL,
  CORBA_ATTR_READONLY
} CORBA_AttributeMode;
extern

const struct CORBA_TypeCode_struct TC_CORBA_AttributeMode_struct;
typedef struct CORBA_AttributeDescription_type CORBA_AttributeDescription;
struct CORBA_AttributeDescription_type {
CORBA_Identifier name;
CORBA_RepositoryId id;
CORBA_RepositoryId defined_in;
CORBA_VersionSpec version;
CORBA_TypeCode type;
CORBA_AttributeMode mode;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_AttributeDescription_struct;







typedef struct CORBA_ExtAttributeDescription_type CORBA_ExtAttributeDescription;
struct CORBA_ExtAttributeDescription_type {
CORBA_Identifier name;
CORBA_RepositoryId id;
CORBA_RepositoryId defined_in;
CORBA_VersionSpec version;
CORBA_TypeCode type;
CORBA_AttributeMode mode;
CORBA_ExcDescriptionSeq get_exceptions;
CORBA_ExcDescriptionSeq put_exceptions;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExtAttributeDescription_struct;
typedef CORBA_Object CORBA_ExtAttributeDef;
extern CORBA_unsigned_long CORBA_ExtAttributeDef__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExtAttributeDef_struct;





typedef enum {
  CORBA_OP_NORMAL,
  CORBA_OP_ONEWAY
} CORBA_OperationMode;
extern

const struct CORBA_TypeCode_struct TC_CORBA_OperationMode_struct;





typedef enum {
  CORBA_PARAM_IN,
  CORBA_PARAM_OUT,
  CORBA_PARAM_INOUT
} CORBA_ParameterMode;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ParameterMode_struct;





typedef struct CORBA_ParameterDescription_type CORBA_ParameterDescription;
struct CORBA_ParameterDescription_type {
CORBA_Identifier name;
CORBA_TypeCode type;
CORBA_IDLType type_def;
CORBA_ParameterMode mode;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_ParameterDescription_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_ParameterDescription* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_ParameterDescription;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_ParameterDescription_struct;
typedef CORBA_sequence_CORBA_ParameterDescription CORBA_ParDescriptionSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ParDescriptionSeq_struct;
typedef CORBA_Identifier CORBA_ContextIdentifier;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ContextIdentifier_struct;
typedef CORBA_sequence_CORBA_string CORBA_sequence_CORBA_ContextIdentifier;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_ContextIdentifier_struct;
typedef CORBA_sequence_CORBA_ContextIdentifier CORBA_ContextIdSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ContextIdSeq_struct;
typedef CORBA_sequence_CORBA_Object CORBA_sequence_CORBA_ExceptionDef;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_ExceptionDef_struct;
typedef CORBA_sequence_CORBA_ExceptionDef CORBA_ExceptionDefSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExceptionDefSeq_struct;
typedef struct CORBA_OperationDescription_type CORBA_OperationDescription;
struct CORBA_OperationDescription_type {
CORBA_Identifier name;
CORBA_RepositoryId id;
CORBA_RepositoryId defined_in;
CORBA_VersionSpec version;
CORBA_TypeCode result;
CORBA_OperationMode mode;
CORBA_ContextIdSeq contexts;
CORBA_ParDescriptionSeq parameters;
CORBA_ExcDescriptionSeq exceptions;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_OperationDescription_struct;
typedef CORBA_sequence_CORBA_string CORBA_sequence_CORBA_RepositoryId;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_RepositoryId_struct;
typedef CORBA_sequence_CORBA_RepositoryId CORBA_RepositoryIdSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_RepositoryIdSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_OperationDescription* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_OperationDescription;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_OperationDescription_struct;
typedef CORBA_sequence_CORBA_OperationDescription CORBA_OpDescriptionSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_OpDescriptionSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_AttributeDescription* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_AttributeDescription;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_AttributeDescription_struct;
typedef CORBA_sequence_CORBA_AttributeDescription CORBA_AttrDescriptionSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_AttrDescriptionSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_ExtAttributeDescription* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_ExtAttributeDescription;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_ExtAttributeDescription_struct;
typedef CORBA_sequence_CORBA_ExtAttributeDescription CORBA_ExtAttrDescriptionSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExtAttrDescriptionSeq_struct;
typedef struct CORBA_InterfaceDef_FullInterfaceDescription_type CORBA_InterfaceDef_FullInterfaceDescription;
struct CORBA_InterfaceDef_FullInterfaceDescription_type {
CORBA_Identifier name;
CORBA_RepositoryId id;
CORBA_RepositoryId defined_in;
CORBA_VersionSpec version;
CORBA_OpDescriptionSeq operations;
CORBA_AttrDescriptionSeq attributes;
CORBA_RepositoryIdSeq base_interfaces;
CORBA_TypeCode type;
CORBA_boolean is_abstract;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_InterfaceDef_FullInterfaceDescription_struct;







typedef struct CORBA_InterfaceDescription_type CORBA_InterfaceDescription;
struct CORBA_InterfaceDescription_type {
CORBA_Identifier name;
CORBA_RepositoryId id;
CORBA_RepositoryId defined_in;
CORBA_VersionSpec version;
CORBA_RepositoryIdSeq base_interfaces;
CORBA_boolean is_abstract;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_InterfaceDescription_struct;
typedef CORBA_Object CORBA_InterfaceAttrExtension;
extern CORBA_unsigned_long CORBA_InterfaceAttrExtension__classid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_InterfaceAttrExtension_struct;





typedef struct CORBA_InterfaceAttrExtension_ExtFullInterfaceDescription_type CORBA_InterfaceAttrExtension_ExtFullInterfaceDescription;
struct CORBA_InterfaceAttrExtension_ExtFullInterfaceDescription_type {
CORBA_Identifier name;
CORBA_RepositoryId id;
CORBA_RepositoryId defined_in;
CORBA_VersionSpec version;
CORBA_OpDescriptionSeq operations;
CORBA_ExtAttrDescriptionSeq attributes;
CORBA_RepositoryIdSeq base_interfaces;
CORBA_TypeCode type;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_InterfaceAttrExtension_ExtFullInterfaceDescription_struct;
typedef CORBA_short CORBA_Visibility;
extern

const struct CORBA_TypeCode_struct TC_CORBA_Visibility_struct;
typedef struct CORBA_ValueMember_type CORBA_ValueMember;
struct CORBA_ValueMember_type {
CORBA_Identifier name;
CORBA_RepositoryId id;
CORBA_RepositoryId defined_in;
CORBA_VersionSpec version;
CORBA_TypeCode type;
CORBA_IDLType type_def;
CORBA_Visibility access;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_ValueMember_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_ValueMember* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_ValueMember;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_ValueMember_struct;
typedef CORBA_sequence_CORBA_ValueMember CORBA_ValueMemberSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ValueMemberSeq_struct;
typedef struct CORBA_ValueDef_FullValueDescription_type CORBA_ValueDef_FullValueDescription;
struct CORBA_ValueDef_FullValueDescription_type {
CORBA_Identifier name;
CORBA_RepositoryId id;
CORBA_boolean is_abstract;
CORBA_boolean is_custom;
CORBA_RepositoryId defined_in;
CORBA_VersionSpec version;
CORBA_OpDescriptionSeq operations;
CORBA_AttrDescriptionSeq attributes;
CORBA_ValueMemberSeq members;
CORBA_InitializerSeq initializers;
CORBA_RepositoryIdSeq supported_interfaces;
CORBA_RepositoryIdSeq abstract_base_values;
CORBA_boolean is_truncatable;
CORBA_RepositoryId base_value;
CORBA_TypeCode type;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_ValueDef_FullValueDescription_struct;







typedef struct CORBA_ValueDescription_type CORBA_ValueDescription;
struct CORBA_ValueDescription_type {
CORBA_Identifier name;
CORBA_RepositoryId id;
CORBA_boolean is_abstract;
CORBA_boolean is_custom;
CORBA_RepositoryId defined_in;
CORBA_VersionSpec version;
CORBA_RepositoryIdSeq supported_interfaces;
CORBA_RepositoryIdSeq abstract_base_values;
CORBA_boolean is_truncatable;
CORBA_RepositoryId base_value;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_ValueDescription_struct;
typedef struct CORBA_ExtValueDef_ExtFullValueDescription_type CORBA_ExtValueDef_ExtFullValueDescription;
struct CORBA_ExtValueDef_ExtFullValueDescription_type {
CORBA_Identifier name;
CORBA_RepositoryId id;
CORBA_boolean is_abstract;
CORBA_boolean is_custom;
CORBA_RepositoryId defined_in;
CORBA_VersionSpec version;
CORBA_OpDescriptionSeq operations;
CORBA_ExtAttrDescriptionSeq attributes;
CORBA_ValueMemberSeq members;
CORBA_ExtInitializerSeq initializers;
CORBA_RepositoryIdSeq supported_interfaces;
CORBA_RepositoryIdSeq abstract_base_values;
CORBA_boolean is_truncatable;
CORBA_RepositoryId base_value;
CORBA_TypeCode type;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_ExtValueDef_ExtFullValueDescription_struct;
typedef enum {
  CORBA_tk_null,
  CORBA_tk_void,
  CORBA_tk_short,
  CORBA_tk_long,
  CORBA_tk_ushort,
  CORBA_tk_ulong,
  CORBA_tk_float,
  CORBA_tk_double,
  CORBA_tk_boolean,
  CORBA_tk_char,
  CORBA_tk_octet,
  CORBA_tk_any,
  CORBA_tk_TypeCode,
  CORBA_tk_Principal,
  CORBA_tk_objref,
  CORBA_tk_struct,
  CORBA_tk_union,
  CORBA_tk_enum,
  CORBA_tk_string,
  CORBA_tk_sequence,
  CORBA_tk_array,
  CORBA_tk_alias,
  CORBA_tk_except,
  CORBA_tk_longlong,
  CORBA_tk_ulonglong,
  CORBA_tk_longdouble,
  CORBA_tk_wchar,
  CORBA_tk_wstring,
  CORBA_tk_fixed,
  CORBA_tk_value,
  CORBA_tk_value_box,
  CORBA_tk_native,
  CORBA_tk_abstract_interface,
  CORBA_tk_local_interface,
  CORBA_tk_component,
  CORBA_tk_home,
  CORBA_tk_event
} CORBA_TCKind;
extern

const struct CORBA_TypeCode_struct TC_CORBA_TCKind_struct;





typedef CORBA_short CORBA_ValueModifier;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ValueModifier_struct;
typedef struct CORBA_TypeCode_Bounds_type CORBA_TypeCode_Bounds;
struct CORBA_TypeCode_Bounds_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_TypeCode_Bounds_struct;
typedef struct CORBA_TypeCode_BadKind_type CORBA_TypeCode_BadKind;
struct CORBA_TypeCode_BadKind_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_TypeCode_BadKind_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_any* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_any;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_any_struct;
typedef CORBA_sequence_CORBA_any CORBA_AnySeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_AnySeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_boolean* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_boolean;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_boolean_struct;
typedef CORBA_sequence_CORBA_boolean CORBA_BooleanSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_BooleanSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_char* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_char;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_char_struct;
typedef CORBA_sequence_CORBA_char CORBA_CharSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_CharSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_wchar* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_wchar;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_wchar_struct;
typedef CORBA_sequence_CORBA_wchar CORBA_WCharSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_WCharSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_octet* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_octet;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_octet_struct;
typedef CORBA_sequence_CORBA_octet CORBA_OctetSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_OctetSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_short* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_short;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_short_struct;
typedef CORBA_sequence_CORBA_short CORBA_ShortSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ShortSeq_struct;
typedef CORBA_sequence_CORBA_unsigned_short CORBA_UShortSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_UShortSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_long* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_long;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_long_struct;
typedef CORBA_sequence_CORBA_long CORBA_LongSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_LongSeq_struct;
typedef CORBA_sequence_CORBA_unsigned_long CORBA_ULongSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ULongSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_long_long* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_long_long;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_long_long_struct;
typedef CORBA_sequence_CORBA_long_long CORBA_LongLongSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_LongLongSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_unsigned_long_long* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_unsigned_long_long;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_unsigned_long_long_struct;
typedef CORBA_sequence_CORBA_unsigned_long_long CORBA_ULongLongSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ULongLongSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_float* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_float;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_float_struct;
typedef CORBA_sequence_CORBA_float CORBA_FloatSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_FloatSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_double* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_double;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_double_struct;
typedef CORBA_sequence_CORBA_double CORBA_DoubleSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_DoubleSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_long_double* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_long_double;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_long_double_struct;
typedef CORBA_sequence_CORBA_long_double CORBA_LongDoubleSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_LongDoubleSeq_struct;
typedef CORBA_sequence_CORBA_string CORBA_StringSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_StringSeq_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_wstring* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_wstring;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_wstring_struct;
typedef CORBA_sequence_CORBA_wstring CORBA_WStringSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_WStringSeq_struct;
typedef struct CORBA_BadFixedValue_type CORBA_BadFixedValue;
struct CORBA_BadFixedValue_type {
CORBA_unsigned_long offset;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_BadFixedValue_struct;
typedef struct CORBA_SystemException_type CORBA_SystemException;
struct CORBA_SystemException_type {
CORBA_unsigned_long minor;
CORBA_completion_status completed;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_SystemException_struct;
typedef struct CORBA_Context_type *CORBA_Context;







typedef struct CORBA_NVList_type *CORBA_NVList;
typedef struct CORBA_Request_type *CORBA_Request;







typedef struct CORBA_ServerRequest_type *CORBA_ServerRequest;






typedef CORBA_unsigned_long CORBA_Flags;
extern

const struct CORBA_TypeCode_struct TC_CORBA_Flags_struct;







typedef struct CORBA_NamedValue_type CORBA_NamedValue;
struct CORBA_NamedValue_type {
CORBA_Identifier name;
CORBA_any argument;
CORBA_long len;
CORBA_Flags arg_modes;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_NamedValue_struct;







typedef enum {
  CORBA_SET_OVERRIDE,
  CORBA_ADD_OVERRIDE
} CORBA_SetOverrideType;
extern

const struct CORBA_TypeCode_struct TC_CORBA_SetOverrideType_struct;
typedef CORBA_sequence_CORBA_Object CORBA_sequence_CORBA_Request;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_Request_struct;
typedef CORBA_sequence_CORBA_Request CORBA_RequestSeq;
extern

const struct CORBA_TypeCode_struct TC_CORBA_RequestSeq_struct;
typedef struct CORBA_AbstractBase_type *CORBA_AbstractBase;



typedef CORBA_unsigned_short CORBA_ServiceType;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ServiceType_struct;







typedef CORBA_unsigned_long CORBA_ServiceOption;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ServiceOption_struct;







typedef CORBA_unsigned_long CORBA_ServiceDetailType;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ServiceDetailType_struct;
typedef struct CORBA_ServiceDetail_type CORBA_ServiceDetail;
struct CORBA_ServiceDetail_type {
CORBA_ServiceDetailType service_detail_type;
CORBA_sequence_CORBA_octet service_detail;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_ServiceDetail_struct;







typedef struct CORBA_ServiceInformation_type CORBA_ServiceInformation;
typedef CORBA_sequence_CORBA_unsigned_long CORBA_sequence_CORBA_ServiceOption;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_ServiceOption_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_ServiceDetail* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_ServiceDetail;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_ServiceDetail_struct;







struct CORBA_ServiceInformation_type {
CORBA_sequence_CORBA_ServiceOption service_options;
CORBA_sequence_CORBA_ServiceDetail service_details;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_ServiceInformation_struct;







typedef struct CORBA_ValueFactory_type *CORBA_ValueFactory;



typedef CORBA_string CORBA_ORBid;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ORBid_struct;
typedef struct CORBA_WrongTransaction_type CORBA_WrongTransaction;
struct CORBA_WrongTransaction_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_WrongTransaction_struct;
typedef CORBA_sequence_CORBA_string CORBA_sequence_CORBA_ORB_ObjectId;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_ORB_ObjectId_struct;
typedef CORBA_sequence_CORBA_ORB_ObjectId CORBA_ORB_ObjectIdList;
extern

const struct CORBA_TypeCode_struct TC_CORBA_ORB_ObjectIdList_struct;
typedef struct CORBA_ORB_InvalidName_type CORBA_ORB_InvalidName;
struct CORBA_ORB_InvalidName_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_CORBA_ORB_InvalidName_struct;







typedef struct CORBA_OpaqueValue_type *CORBA_OpaqueValue;
CORBA_PolicyType CORBA_Policy__get_policy_type(CORBA_Policy _obj, CORBA_Environment *ev);
CORBA_Policy CORBA_Policy_copy(CORBA_Policy _obj, CORBA_Environment *ev);
void CORBA_Policy_destroy(CORBA_Policy _obj, CORBA_Environment *ev);
CORBA_Policy CORBA_DomainManager_get_domain_policy(CORBA_DomainManager _obj, const CORBA_PolicyType policy_type, CORBA_Environment *ev);



void CORBA_ConstructionPolicy_make_domain_manager(CORBA_ConstructionPolicy _obj, const CORBA_InterfaceDef object_type, const CORBA_boolean constr_policy, CORBA_Environment *ev);
CORBA_DefinitionKind CORBA_IRObject__get_def_kind(CORBA_IRObject _obj, CORBA_Environment *ev);
void CORBA_IRObject_destroy(CORBA_IRObject _obj, CORBA_Environment *ev);


CORBA_RepositoryId CORBA_Contained__get_id(CORBA_Contained _obj, CORBA_Environment *ev);
void CORBA_Contained__set_id(CORBA_Contained _obj, const CORBA_char * value, CORBA_Environment *ev);
CORBA_Identifier CORBA_Contained__get_name(CORBA_Contained _obj, CORBA_Environment *ev);
void CORBA_Contained__set_name(CORBA_Contained _obj, const CORBA_char * value, CORBA_Environment *ev);
CORBA_VersionSpec CORBA_Contained__get_version(CORBA_Contained _obj, CORBA_Environment *ev);
void CORBA_Contained__set_version(CORBA_Contained _obj, const CORBA_char * value, CORBA_Environment *ev);
CORBA_Container CORBA_Contained__get_defined_in(CORBA_Contained _obj, CORBA_Environment *ev);
CORBA_ScopedName CORBA_Contained__get_absolute_name(CORBA_Contained _obj, CORBA_Environment *ev);
CORBA_Repository CORBA_Contained__get_containing_repository(CORBA_Contained _obj, CORBA_Environment *ev);
CORBA_Contained_Description* CORBA_Contained_describe(CORBA_Contained _obj, CORBA_Environment *ev);
void CORBA_Contained_move(CORBA_Contained _obj, const CORBA_Container new_container, const CORBA_char * new_name, const CORBA_char * new_version, CORBA_Environment *ev);


CORBA_Contained CORBA_Container_lookup(CORBA_Container _obj, const CORBA_char * search_name, CORBA_Environment *ev);
CORBA_ContainedSeq* CORBA_Container_contents(CORBA_Container _obj, const CORBA_DefinitionKind limit_type, const CORBA_boolean exclude_inherited, CORBA_Environment *ev);
CORBA_ContainedSeq* CORBA_Container_lookup_name(CORBA_Container _obj, const CORBA_char * search_name, const CORBA_long levels_to_search, const CORBA_DefinitionKind limit_type, const CORBA_boolean exclude_inherited, CORBA_Environment *ev);
CORBA_Container_DescriptionSeq* CORBA_Container_describe_contents(CORBA_Container _obj, const CORBA_DefinitionKind limit_type, const CORBA_boolean exclude_inherited, const CORBA_long max_returned_objs, CORBA_Environment *ev);
CORBA_ModuleDef CORBA_Container_create_module(CORBA_Container _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, CORBA_Environment *ev);
CORBA_ConstantDef CORBA_Container_create_constant(CORBA_Container _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_IDLType type, const CORBA_any* value, CORBA_Environment *ev);
CORBA_StructDef CORBA_Container_create_struct(CORBA_Container _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_StructMemberSeq* members, CORBA_Environment *ev);
CORBA_UnionDef CORBA_Container_create_union(CORBA_Container _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_IDLType discriminator_type, const CORBA_UnionMemberSeq* members, CORBA_Environment *ev);
CORBA_EnumDef CORBA_Container_create_enum(CORBA_Container _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_EnumMemberSeq* members, CORBA_Environment *ev);
CORBA_AliasDef CORBA_Container_create_alias(CORBA_Container _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_IDLType original_type, CORBA_Environment *ev);
CORBA_InterfaceDef CORBA_Container_create_interface(CORBA_Container _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_InterfaceDefSeq* base_interfaces, const CORBA_boolean is_abstract, CORBA_Environment *ev);
CORBA_ValueDef CORBA_Container_create_value(CORBA_Container _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_boolean is_custom, const CORBA_boolean is_abstract, const CORBA_ValueDef base_value, const CORBA_boolean is_truncatable, const CORBA_ValueDefSeq* abstract_base_values, const CORBA_InterfaceDefSeq* supported_interfaces, const CORBA_InitializerSeq* initializers, CORBA_Environment *ev);
CORBA_ValueBoxDef CORBA_Container_create_value_box(CORBA_Container _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_IDLType original_type_def, CORBA_Environment *ev);
CORBA_ExceptionDef CORBA_Container_create_exception(CORBA_Container _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_StructMemberSeq* members, CORBA_Environment *ev);
CORBA_NativeDef CORBA_Container_create_native(CORBA_Container _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, CORBA_Environment *ev);
CORBA_AbstractInterfaceDef CORBA_Container_create_abstract_interface(CORBA_Container _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_AbstractInterfaceDefSeq* base_interfaces, CORBA_Environment *ev);
CORBA_LocalInterfaceDef CORBA_Container_create_local_interface(CORBA_Container _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_InterfaceDefSeq* base_interfaces, CORBA_Environment *ev);
CORBA_ExtValueDef CORBA_Container_create_ext_value(CORBA_Container _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_boolean is_custom, const CORBA_boolean is_abstract, const CORBA_ValueDef base_value, const CORBA_boolean is_truncatable, const CORBA_ValueDefSeq* abstract_base_values, const CORBA_InterfaceDefSeq* supported_interfaces, const CORBA_ExtInitializerSeq* initializers, CORBA_Environment *ev);


CORBA_TypeCode CORBA_IDLType__get_type(CORBA_IDLType _obj, CORBA_Environment *ev);
CORBA_Contained CORBA_Repository_lookup_id(CORBA_Repository _obj, const CORBA_char * search_id, CORBA_Environment *ev);
CORBA_TypeCode CORBA_Repository_get_canonical_typecode(CORBA_Repository _obj, const CORBA_TypeCode tc, CORBA_Environment *ev);
CORBA_PrimitiveDef CORBA_Repository_get_primitive(CORBA_Repository _obj, const CORBA_PrimitiveKind kind, CORBA_Environment *ev);
CORBA_StringDef CORBA_Repository_create_string(CORBA_Repository _obj, const CORBA_unsigned_long bound, CORBA_Environment *ev);
CORBA_WstringDef CORBA_Repository_create_wstring(CORBA_Repository _obj, const CORBA_unsigned_long bound, CORBA_Environment *ev);
CORBA_SequenceDef CORBA_Repository_create_sequence(CORBA_Repository _obj, const CORBA_unsigned_long bound, const CORBA_IDLType element_type, CORBA_Environment *ev);
CORBA_ArrayDef CORBA_Repository_create_array(CORBA_Repository _obj, const CORBA_unsigned_long length, const CORBA_IDLType element_type, CORBA_Environment *ev);
CORBA_FixedDef CORBA_Repository_create_fixed(CORBA_Repository _obj, const CORBA_unsigned_short digits, const CORBA_short scale, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ConstantDef__get_type(CORBA_ConstantDef _obj, CORBA_Environment *ev);
CORBA_IDLType CORBA_ConstantDef__get_type_def(CORBA_ConstantDef _obj, CORBA_Environment *ev);
void CORBA_ConstantDef__set_type_def(CORBA_ConstantDef _obj, const CORBA_IDLType value, CORBA_Environment *ev);
CORBA_any* CORBA_ConstantDef__get_value(CORBA_ConstantDef _obj, CORBA_Environment *ev);
void CORBA_ConstantDef__set_value(CORBA_ConstantDef _obj, const CORBA_any* value, CORBA_Environment *ev);
CORBA_StructMemberSeq* CORBA_StructDef__get_members(CORBA_StructDef _obj, CORBA_Environment *ev);
void CORBA_StructDef__set_members(CORBA_StructDef _obj, const CORBA_StructMemberSeq* value, CORBA_Environment *ev);
CORBA_TypeCode CORBA_UnionDef__get_discriminator_type(CORBA_UnionDef _obj, CORBA_Environment *ev);
CORBA_IDLType CORBA_UnionDef__get_discriminator_type_def(CORBA_UnionDef _obj, CORBA_Environment *ev);
void CORBA_UnionDef__set_discriminator_type_def(CORBA_UnionDef _obj, const CORBA_IDLType value, CORBA_Environment *ev);
CORBA_UnionMemberSeq* CORBA_UnionDef__get_members(CORBA_UnionDef _obj, CORBA_Environment *ev);
void CORBA_UnionDef__set_members(CORBA_UnionDef _obj, const CORBA_UnionMemberSeq* value, CORBA_Environment *ev);
CORBA_EnumMemberSeq* CORBA_EnumDef__get_members(CORBA_EnumDef _obj, CORBA_Environment *ev);
void CORBA_EnumDef__set_members(CORBA_EnumDef _obj, const CORBA_EnumMemberSeq* value, CORBA_Environment *ev);
CORBA_IDLType CORBA_AliasDef__get_original_type_def(CORBA_AliasDef _obj, CORBA_Environment *ev);
void CORBA_AliasDef__set_original_type_def(CORBA_AliasDef _obj, const CORBA_IDLType value, CORBA_Environment *ev);
CORBA_PrimitiveKind CORBA_PrimitiveDef__get_kind(CORBA_PrimitiveDef _obj, CORBA_Environment *ev);



CORBA_unsigned_long CORBA_StringDef__get_bound(CORBA_StringDef _obj, CORBA_Environment *ev);
void CORBA_StringDef__set_bound(CORBA_StringDef _obj, const CORBA_unsigned_long value, CORBA_Environment *ev);



CORBA_unsigned_long CORBA_WstringDef__get_bound(CORBA_WstringDef _obj, CORBA_Environment *ev);
void CORBA_WstringDef__set_bound(CORBA_WstringDef _obj, const CORBA_unsigned_long value, CORBA_Environment *ev);



CORBA_unsigned_short CORBA_FixedDef__get_digits(CORBA_FixedDef _obj, CORBA_Environment *ev);
void CORBA_FixedDef__set_digits(CORBA_FixedDef _obj, const CORBA_unsigned_short value, CORBA_Environment *ev);
CORBA_short CORBA_FixedDef__get_scale(CORBA_FixedDef _obj, CORBA_Environment *ev);
void CORBA_FixedDef__set_scale(CORBA_FixedDef _obj, const CORBA_short value, CORBA_Environment *ev);



CORBA_unsigned_long CORBA_SequenceDef__get_bound(CORBA_SequenceDef _obj, CORBA_Environment *ev);
void CORBA_SequenceDef__set_bound(CORBA_SequenceDef _obj, const CORBA_unsigned_long value, CORBA_Environment *ev);
CORBA_TypeCode CORBA_SequenceDef__get_element_type(CORBA_SequenceDef _obj, CORBA_Environment *ev);
CORBA_IDLType CORBA_SequenceDef__get_element_type_def(CORBA_SequenceDef _obj, CORBA_Environment *ev);
void CORBA_SequenceDef__set_element_type_def(CORBA_SequenceDef _obj, const CORBA_IDLType value, CORBA_Environment *ev);



CORBA_unsigned_long CORBA_ArrayDef__get_length(CORBA_ArrayDef _obj, CORBA_Environment *ev);
void CORBA_ArrayDef__set_length(CORBA_ArrayDef _obj, const CORBA_unsigned_long value, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ArrayDef__get_element_type(CORBA_ArrayDef _obj, CORBA_Environment *ev);
CORBA_IDLType CORBA_ArrayDef__get_element_type_def(CORBA_ArrayDef _obj, CORBA_Environment *ev);
void CORBA_ArrayDef__set_element_type_def(CORBA_ArrayDef _obj, const CORBA_IDLType value, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ExceptionDef__get_type(CORBA_ExceptionDef _obj, CORBA_Environment *ev);
CORBA_StructMemberSeq* CORBA_ExceptionDef__get_members(CORBA_ExceptionDef _obj, CORBA_Environment *ev);
void CORBA_ExceptionDef__set_members(CORBA_ExceptionDef _obj, const CORBA_StructMemberSeq* value, CORBA_Environment *ev);
CORBA_TypeCode CORBA_AttributeDef__get_type(CORBA_AttributeDef _obj, CORBA_Environment *ev);
CORBA_IDLType CORBA_AttributeDef__get_type_def(CORBA_AttributeDef _obj, CORBA_Environment *ev);
void CORBA_AttributeDef__set_type_def(CORBA_AttributeDef _obj, const CORBA_IDLType value, CORBA_Environment *ev);
CORBA_AttributeMode CORBA_AttributeDef__get_mode(CORBA_AttributeDef _obj, CORBA_Environment *ev);
void CORBA_AttributeDef__set_mode(CORBA_AttributeDef _obj, const CORBA_AttributeMode value, CORBA_Environment *ev);
CORBA_ExcDescriptionSeq* CORBA_ExtAttributeDef__get_get_exceptions(CORBA_ExtAttributeDef _obj, CORBA_Environment *ev);
void CORBA_ExtAttributeDef__set_get_exceptions(CORBA_ExtAttributeDef _obj, const CORBA_ExcDescriptionSeq* value, CORBA_Environment *ev);
CORBA_ExcDescriptionSeq* CORBA_ExtAttributeDef__get_set_exceptions(CORBA_ExtAttributeDef _obj, CORBA_Environment *ev);
void CORBA_ExtAttributeDef__set_set_exceptions(CORBA_ExtAttributeDef _obj, const CORBA_ExcDescriptionSeq* value, CORBA_Environment *ev);
CORBA_ExtAttributeDescription* CORBA_ExtAttributeDef_describe_attribute(CORBA_ExtAttributeDef _obj, CORBA_Environment *ev);
CORBA_TypeCode CORBA_OperationDef__get_result(CORBA_OperationDef _obj, CORBA_Environment *ev);
CORBA_IDLType CORBA_OperationDef__get_result_def(CORBA_OperationDef _obj, CORBA_Environment *ev);
void CORBA_OperationDef__set_result_def(CORBA_OperationDef _obj, const CORBA_IDLType value, CORBA_Environment *ev);
CORBA_ParDescriptionSeq* CORBA_OperationDef__get_params(CORBA_OperationDef _obj, CORBA_Environment *ev);
void CORBA_OperationDef__set_params(CORBA_OperationDef _obj, const CORBA_ParDescriptionSeq* value, CORBA_Environment *ev);
CORBA_OperationMode CORBA_OperationDef__get_mode(CORBA_OperationDef _obj, CORBA_Environment *ev);
void CORBA_OperationDef__set_mode(CORBA_OperationDef _obj, const CORBA_OperationMode value, CORBA_Environment *ev);
CORBA_ContextIdSeq* CORBA_OperationDef__get_contexts(CORBA_OperationDef _obj, CORBA_Environment *ev);
void CORBA_OperationDef__set_contexts(CORBA_OperationDef _obj, const CORBA_ContextIdSeq* value, CORBA_Environment *ev);
CORBA_ExceptionDefSeq* CORBA_OperationDef__get_exceptions(CORBA_OperationDef _obj, CORBA_Environment *ev);
void CORBA_OperationDef__set_exceptions(CORBA_OperationDef _obj, const CORBA_ExceptionDefSeq* value, CORBA_Environment *ev);
CORBA_InterfaceDefSeq* CORBA_InterfaceDef__get_base_interfaces(CORBA_InterfaceDef _obj, CORBA_Environment *ev);
void CORBA_InterfaceDef__set_base_interfaces(CORBA_InterfaceDef _obj, const CORBA_InterfaceDefSeq* value, CORBA_Environment *ev);
CORBA_boolean CORBA_InterfaceDef__get_is_abstract(CORBA_InterfaceDef _obj, CORBA_Environment *ev);
void CORBA_InterfaceDef__set_is_abstract(CORBA_InterfaceDef _obj, const CORBA_boolean value, CORBA_Environment *ev);
CORBA_boolean CORBA_InterfaceDef_is_a(CORBA_InterfaceDef _obj, const CORBA_char * interface_id, CORBA_Environment *ev);
CORBA_InterfaceDef_FullInterfaceDescription* CORBA_InterfaceDef_describe_interface(CORBA_InterfaceDef _obj, CORBA_Environment *ev);
CORBA_AttributeDef CORBA_InterfaceDef_create_attribute(CORBA_InterfaceDef _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_IDLType type, const CORBA_AttributeMode mode, CORBA_Environment *ev);
CORBA_OperationDef CORBA_InterfaceDef_create_operation(CORBA_InterfaceDef _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_IDLType result, const CORBA_OperationMode mode, const CORBA_ParDescriptionSeq* params, const CORBA_ExceptionDefSeq* exceptions, const CORBA_ContextIdSeq* contexts, CORBA_Environment *ev);
CORBA_InterfaceAttrExtension_ExtFullInterfaceDescription* CORBA_InterfaceAttrExtension_describe_ext_interface(CORBA_InterfaceAttrExtension _obj, CORBA_Environment *ev);
CORBA_ExtAttributeDef CORBA_InterfaceAttrExtension_create_ext_attribute(CORBA_InterfaceAttrExtension _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_IDLType type, const CORBA_AttributeMode mode, const CORBA_ExceptionDefSeq* get_exceptions, const CORBA_ExceptionDefSeq* set_exceptions, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ValueMemberDef__get_type(CORBA_ValueMemberDef _obj, CORBA_Environment *ev);
CORBA_IDLType CORBA_ValueMemberDef__get_type_def(CORBA_ValueMemberDef _obj, CORBA_Environment *ev);
void CORBA_ValueMemberDef__set_type_def(CORBA_ValueMemberDef _obj, const CORBA_IDLType value, CORBA_Environment *ev);
CORBA_Visibility CORBA_ValueMemberDef__get_access(CORBA_ValueMemberDef _obj, CORBA_Environment *ev);
void CORBA_ValueMemberDef__set_access(CORBA_ValueMemberDef _obj, const CORBA_Visibility value, CORBA_Environment *ev);
CORBA_InterfaceDefSeq* CORBA_ValueDef__get_supported_interfaces(CORBA_ValueDef _obj, CORBA_Environment *ev);
void CORBA_ValueDef__set_supported_interfaces(CORBA_ValueDef _obj, const CORBA_InterfaceDefSeq* value, CORBA_Environment *ev);
CORBA_InitializerSeq* CORBA_ValueDef__get_initializers(CORBA_ValueDef _obj, CORBA_Environment *ev);
void CORBA_ValueDef__set_initializers(CORBA_ValueDef _obj, const CORBA_InitializerSeq* value, CORBA_Environment *ev);
CORBA_ValueDef CORBA_ValueDef__get_base_value(CORBA_ValueDef _obj, CORBA_Environment *ev);
void CORBA_ValueDef__set_base_value(CORBA_ValueDef _obj, const CORBA_ValueDef value, CORBA_Environment *ev);
CORBA_ValueDefSeq* CORBA_ValueDef__get_abstract_base_values(CORBA_ValueDef _obj, CORBA_Environment *ev);
void CORBA_ValueDef__set_abstract_base_values(CORBA_ValueDef _obj, const CORBA_ValueDefSeq* value, CORBA_Environment *ev);
CORBA_boolean CORBA_ValueDef__get_is_abstract(CORBA_ValueDef _obj, CORBA_Environment *ev);
void CORBA_ValueDef__set_is_abstract(CORBA_ValueDef _obj, const CORBA_boolean value, CORBA_Environment *ev);
CORBA_boolean CORBA_ValueDef__get_is_custom(CORBA_ValueDef _obj, CORBA_Environment *ev);
void CORBA_ValueDef__set_is_custom(CORBA_ValueDef _obj, const CORBA_boolean value, CORBA_Environment *ev);
CORBA_boolean CORBA_ValueDef__get_is_truncatable(CORBA_ValueDef _obj, CORBA_Environment *ev);
void CORBA_ValueDef__set_is_truncatable(CORBA_ValueDef _obj, const CORBA_boolean value, CORBA_Environment *ev);
CORBA_boolean CORBA_ValueDef_is_a(CORBA_ValueDef _obj, const CORBA_char * id, CORBA_Environment *ev);
CORBA_ValueDef_FullValueDescription* CORBA_ValueDef_describe_value(CORBA_ValueDef _obj, CORBA_Environment *ev);
CORBA_ValueMemberDef CORBA_ValueDef_create_value_member(CORBA_ValueDef _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_IDLType type, const CORBA_Visibility access, CORBA_Environment *ev);
CORBA_AttributeDef CORBA_ValueDef_create_attribute(CORBA_ValueDef _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_IDLType type, const CORBA_AttributeMode mode, CORBA_Environment *ev);
CORBA_OperationDef CORBA_ValueDef_create_operation(CORBA_ValueDef _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_IDLType result, const CORBA_OperationMode mode, const CORBA_ParDescriptionSeq* params, const CORBA_ExceptionDefSeq* exceptions, const CORBA_ContextIdSeq* contexts, CORBA_Environment *ev);
CORBA_ExtInitializerSeq* CORBA_ExtValueDef__get_ext_initializers(CORBA_ExtValueDef _obj, CORBA_Environment *ev);
void CORBA_ExtValueDef__set_ext_initializers(CORBA_ExtValueDef _obj, const CORBA_ExtInitializerSeq* value, CORBA_Environment *ev);
CORBA_ExtValueDef_ExtFullValueDescription* CORBA_ExtValueDef_describe_ext_value(CORBA_ExtValueDef _obj, CORBA_Environment *ev);
CORBA_ExtAttributeDef CORBA_ExtValueDef_create_ext_attribute(CORBA_ExtValueDef _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_char * version, const CORBA_IDLType type, const CORBA_AttributeMode mode, const CORBA_ExceptionDefSeq* get_exceptions, const CORBA_ExceptionDefSeq* set_exceptions, CORBA_Environment *ev);
CORBA_IDLType CORBA_ValueBoxDef__get_original_type_def(CORBA_ValueBoxDef _obj, CORBA_Environment *ev);
void CORBA_ValueBoxDef__set_original_type_def(CORBA_ValueBoxDef _obj, const CORBA_IDLType value, CORBA_Environment *ev);
CORBA_boolean CORBA_TypeCode_equal(CORBA_TypeCode _obj, const CORBA_TypeCode tc, CORBA_Environment *ev);
CORBA_boolean CORBA_TypeCode_equivalent(CORBA_TypeCode _obj, const CORBA_TypeCode tc, CORBA_Environment *ev);
CORBA_TypeCode CORBA_TypeCode_get_compact_typecode(CORBA_TypeCode _obj, CORBA_Environment *ev);
CORBA_TCKind CORBA_TypeCode_kind(CORBA_TypeCode _obj, CORBA_Environment *ev);
CORBA_RepositoryId CORBA_TypeCode_id(CORBA_TypeCode _obj, CORBA_Environment *ev);
CORBA_Identifier CORBA_TypeCode_name(CORBA_TypeCode _obj, CORBA_Environment *ev);
CORBA_unsigned_long CORBA_TypeCode_member_count(CORBA_TypeCode _obj, CORBA_Environment *ev);
CORBA_Identifier CORBA_TypeCode_member_name(CORBA_TypeCode _obj, const CORBA_unsigned_long index, CORBA_Environment *ev);
CORBA_TypeCode CORBA_TypeCode_member_type(CORBA_TypeCode _obj, const CORBA_unsigned_long index, CORBA_Environment *ev);
CORBA_any* CORBA_TypeCode_member_label(CORBA_TypeCode _obj, const CORBA_unsigned_long index, CORBA_Environment *ev);
CORBA_TypeCode CORBA_TypeCode_discriminator_type(CORBA_TypeCode _obj, CORBA_Environment *ev);
CORBA_long CORBA_TypeCode_default_index(CORBA_TypeCode _obj, CORBA_Environment *ev);
CORBA_unsigned_long CORBA_TypeCode_length(CORBA_TypeCode _obj, CORBA_Environment *ev);
CORBA_TypeCode CORBA_TypeCode_content_type(CORBA_TypeCode _obj, CORBA_Environment *ev);
CORBA_unsigned_short CORBA_TypeCode_fixed_digits(CORBA_TypeCode _obj, CORBA_Environment *ev);
CORBA_short CORBA_TypeCode_fixed_scale(CORBA_TypeCode _obj, CORBA_Environment *ev);
CORBA_Visibility CORBA_TypeCode_member_visibility(CORBA_TypeCode _obj, const CORBA_unsigned_long index, CORBA_Environment *ev);
CORBA_ValueModifier CORBA_TypeCode_type_modifier(CORBA_TypeCode _obj, CORBA_Environment *ev);
CORBA_TypeCode CORBA_TypeCode_concrete_base_type(CORBA_TypeCode _obj, CORBA_Environment *ev);
CORBA_InterfaceDef CORBA_Object_get_interface(CORBA_Object _obj, CORBA_Environment *ev);
CORBA_boolean CORBA_Object_is_nil(CORBA_Object _obj, CORBA_Environment *ev);
CORBA_Object CORBA_Object_duplicate(CORBA_Object _obj, CORBA_Environment *ev);
void CORBA_Object_release(CORBA_Object _obj, CORBA_Environment *ev);
CORBA_boolean CORBA_Object_is_a(CORBA_Object _obj, const CORBA_char * logical_type_id, CORBA_Environment *ev);
CORBA_boolean CORBA_Object_non_existent(CORBA_Object _obj, CORBA_Environment *ev);
CORBA_boolean CORBA_Object_is_equivalent(CORBA_Object _obj, const CORBA_Object other_object, CORBA_Environment *ev);
CORBA_unsigned_long CORBA_Object_hash(CORBA_Object _obj, const CORBA_unsigned_long maximum, CORBA_Environment *ev);
void CORBA_Object_create_request(CORBA_Object _obj, const CORBA_Context ctx, const CORBA_char * operation, const CORBA_NVList arg_list, CORBA_NamedValue* result, CORBA_Request* request, const CORBA_Flags req_flag, CORBA_Environment *ev);
CORBA_Policy CORBA_Object_get_policy(CORBA_Object _obj, const CORBA_PolicyType policy_type, CORBA_Environment *ev);
CORBA_DomainManagersList* CORBA_Object_get_domain_managers(CORBA_Object _obj, CORBA_Environment *ev);
CORBA_Object CORBA_Object_set_policy_overrides(CORBA_Object _obj, const CORBA_PolicyList* policies, const CORBA_SetOverrideType set_add, CORBA_Environment *ev);
CORBA_Policy CORBA_Object_get_client_policy(CORBA_Object _obj, const CORBA_PolicyType type, CORBA_Environment *ev);
CORBA_PolicyList* CORBA_Object_get_policy_overrides(CORBA_Object _obj, const CORBA_PolicyTypeSeq* types, CORBA_Environment *ev);
CORBA_boolean CORBA_Object_validate_connection(CORBA_Object _obj, CORBA_PolicyList** inconsistent_policies, CORBA_Environment *ev);
CORBA_Object CORBA_Object_get_component(CORBA_Object _obj, CORBA_Environment *ev);
CORBA_ORBid CORBA_ORB_id(CORBA_ORB _obj, CORBA_Environment *ev);
CORBA_string CORBA_ORB_object_to_string(CORBA_ORB _obj, const CORBA_Object obj, CORBA_Environment *ev);
CORBA_Object CORBA_ORB_string_to_object(CORBA_ORB _obj, const CORBA_char * str, CORBA_Environment *ev);
void CORBA_ORB_create_list(CORBA_ORB _obj, const CORBA_long count, CORBA_NVList* new_list, CORBA_Environment *ev);
void CORBA_ORB_create_operation_list(CORBA_ORB _obj, const CORBA_OperationDef oper, CORBA_NVList* new_list, CORBA_Environment *ev);
void CORBA_ORB_get_default_context(CORBA_ORB _obj, CORBA_Context* ctx, CORBA_Environment *ev);
void CORBA_ORB_send_multiple_requests_oneway(CORBA_ORB _obj, const CORBA_RequestSeq* req, CORBA_Environment *ev);
void CORBA_ORB_send_multiple_requests_deferred(CORBA_ORB _obj, const CORBA_RequestSeq* req, CORBA_Environment *ev);
CORBA_boolean CORBA_ORB_poll_next_response(CORBA_ORB _obj, CORBA_Environment *ev);
void CORBA_ORB_get_next_response(CORBA_ORB _obj, CORBA_Request* req, CORBA_Environment *ev);
CORBA_boolean CORBA_ORB_get_service_information(CORBA_ORB _obj, const CORBA_ServiceType service_type, CORBA_ServiceInformation** service_information, CORBA_Environment *ev);
CORBA_ORB_ObjectIdList* CORBA_ORB_list_initial_services(CORBA_ORB _obj, CORBA_Environment *ev);
CORBA_Object CORBA_ORB_resolve_initial_references(CORBA_ORB _obj, const CORBA_char * identifier, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_struct_tc(CORBA_ORB _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_StructMemberSeq* members, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_union_tc(CORBA_ORB _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_TypeCode discriminator_type, const CORBA_UnionMemberSeq* members, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_enum_tc(CORBA_ORB _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_EnumMemberSeq* members, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_alias_tc(CORBA_ORB _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_TypeCode original_type, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_exception_tc(CORBA_ORB _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_StructMemberSeq* members, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_interface_tc(CORBA_ORB _obj, const CORBA_char * id, const CORBA_char * name, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_string_tc(CORBA_ORB _obj, const CORBA_unsigned_long bound, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_wstring_tc(CORBA_ORB _obj, const CORBA_unsigned_long bound, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_fixed_tc(CORBA_ORB _obj, const CORBA_unsigned_short digits, const CORBA_short scale, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_sequence_tc(CORBA_ORB _obj, const CORBA_unsigned_long bound, const CORBA_TypeCode element_type, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_recursive_sequence_tc(CORBA_ORB _obj, const CORBA_unsigned_long bound, const CORBA_unsigned_long offset, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_array_tc(CORBA_ORB _obj, const CORBA_unsigned_long length, const CORBA_TypeCode element_type, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_value_tc(CORBA_ORB _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_ValueModifier type_modifier, const CORBA_TypeCode concrete_base, const CORBA_ValueMemberSeq* members, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_value_box_tc(CORBA_ORB _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_TypeCode boxed_type, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_native_tc(CORBA_ORB _obj, const CORBA_char * id, const CORBA_char * name, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_recursive_tc(CORBA_ORB _obj, const CORBA_char * id, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_abstract_interface_tc(CORBA_ORB _obj, const CORBA_char * id, const CORBA_char * name, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_local_interface_tc(CORBA_ORB _obj, const CORBA_char * id, const CORBA_char * name, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_component_tc(CORBA_ORB _obj, const CORBA_char * id, const CORBA_char * name, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_home_tc(CORBA_ORB _obj, const CORBA_char * id, const CORBA_char * name, CORBA_Environment *ev);
CORBA_TypeCode CORBA_ORB_create_event_tc(CORBA_ORB _obj, const CORBA_char * id, const CORBA_char * name, const CORBA_ValueModifier type_modifier, const CORBA_TypeCode concrete_base, const CORBA_ValueMemberSeq* members, CORBA_Environment *ev);
CORBA_boolean CORBA_ORB_work_pending(CORBA_ORB _obj, CORBA_Environment *ev);
void CORBA_ORB_perform_work(CORBA_ORB _obj, CORBA_Environment *ev);
void CORBA_ORB_run(CORBA_ORB _obj, CORBA_Environment *ev);
void CORBA_ORB_shutdown(CORBA_ORB _obj, const CORBA_boolean wait_for_completion, CORBA_Environment *ev);
void CORBA_ORB_destroy(CORBA_ORB _obj, CORBA_Environment *ev);
CORBA_Policy CORBA_ORB_create_policy(CORBA_ORB _obj, const CORBA_PolicyType type, const CORBA_any* val, CORBA_Environment *ev);
CORBA_ValueFactory CORBA_ORB_register_value_factory(CORBA_ORB _obj, const CORBA_char * id, const CORBA_ValueFactory factory, CORBA_Environment *ev);
void CORBA_ORB_unregister_value_factory(CORBA_ORB _obj, const CORBA_char * id, CORBA_Environment *ev);
CORBA_ValueFactory CORBA_ORB_lookup_value_factory(CORBA_ORB _obj, const CORBA_char * id, CORBA_Environment *ev);
void CORBA_ORB_register_initial_reference(CORBA_ORB _obj, const CORBA_char * id, const CORBA_Object obj, CORBA_Environment *ev);
void CORBA_Request_add_arg(CORBA_Request _obj, const CORBA_char * name, const CORBA_TypeCode arg_type, const CORBA_OpaqueValue value, const CORBA_long len, const CORBA_Flags arg_flags, CORBA_Environment *ev);
void CORBA_Request_invoke(CORBA_Request _obj, const CORBA_Flags invoke_flags, CORBA_Environment *ev);
void CORBA_Request_delete(CORBA_Request _obj, CORBA_Environment *ev);
void CORBA_Request_send(CORBA_Request _obj, const CORBA_Flags invoke_flags, CORBA_Environment *ev);
void CORBA_Request_get_response(CORBA_Request _obj, CORBA_Environment *ev);
CORBA_boolean CORBA_Request_poll_response(CORBA_Request _obj, CORBA_Environment *ev);
CORBA_Object CORBA_Request_sendp(CORBA_Request _obj, CORBA_Environment *ev);
void CORBA_Request_prepare(CORBA_Request _obj, const CORBA_Object p, CORBA_Environment *ev);
void CORBA_Request_sendc(CORBA_Request _obj, const CORBA_Object handler, CORBA_Environment *ev);
void CORBA_Context_set_one_value(CORBA_Context _obj, const CORBA_char * prop_name, const CORBA_char * value, CORBA_Environment *ev);
void CORBA_Context_set_values(CORBA_Context _obj, const CORBA_NVList values, CORBA_Environment *ev);
void CORBA_Context_get_values(CORBA_Context _obj, const CORBA_char * start_scope, const CORBA_Flags op_flags, const CORBA_char * prop_name, CORBA_NVList* values, CORBA_Environment *ev);
void CORBA_Context_delete_values(CORBA_Context _obj, const CORBA_char * prop_name, CORBA_Environment *ev);
void CORBA_Context_create_child(CORBA_Context _obj, const CORBA_char * ctx_name, CORBA_Context* child_ctx, CORBA_Environment *ev);
void CORBA_Context_delete(CORBA_Context _obj, const CORBA_Flags del_flags, CORBA_Environment *ev);
void CORBA_NVList_add_item(CORBA_NVList _obj, const CORBA_char * item_name, const CORBA_TypeCode item_type, const CORBA_OpaqueValue value, const CORBA_long value_len, const CORBA_Flags item_flags, CORBA_Environment *ev);
void CORBA_NVList_free(CORBA_NVList _obj, CORBA_Environment *ev);
void CORBA_NVList_free_memory(CORBA_NVList _obj, CORBA_Environment *ev);
void CORBA_NVList_get_count(CORBA_NVList _obj, CORBA_long* count, CORBA_Environment *ev);
CORBA_Identifier CORBA_ServerRequest__get_operation(CORBA_ServerRequest _obj, CORBA_Environment *ev);
void CORBA_ServerRequest_arguments(CORBA_ServerRequest _obj, CORBA_NVList* nv, CORBA_Environment *ev);
CORBA_Context CORBA_ServerRequest_ctx(CORBA_ServerRequest _obj, CORBA_Environment *ev);
void CORBA_ServerRequest_set_result(CORBA_ServerRequest _obj, const CORBA_any* val, CORBA_Environment *ev);
void CORBA_ServerRequest_set_exception(CORBA_ServerRequest _obj, const CORBA_any* val, CORBA_Environment *ev);









 typedef gpointer PortableServer_Servant;







 typedef struct PortableServer_POA_type *PortableServer_POA;


typedef struct {
 void *_private;
 void (*finalize) (PortableServer_Servant,
          CORBA_Environment *);
 PortableServer_POA (*default_POA) (PortableServer_Servant,
          CORBA_Environment *);
 void (*add_ref) (PortableServer_Servant,
          CORBA_Environment *);
 void (*remove_ref) (PortableServer_Servant,
          CORBA_Environment *);
 CORBA_InterfaceDef (*get_interface) (PortableServer_Servant,
                                             CORBA_Environment *);
 CORBA_boolean (*is_a) (PortableServer_Servant,
          const char *,
          CORBA_Environment *);
 CORBA_boolean (*non_existent) (PortableServer_Servant,
          CORBA_Environment *);
} PortableServer_ServantBase__epv;

typedef PortableServer_ServantBase__epv *PortableServer_ServantBase__vepv;

typedef struct {
 void *_private;
 PortableServer_ServantBase__vepv *vepv;
} PortableServer_ServantBase;

typedef PortableServer_ServantBase__epv PortableServer_RefCountServantBase__epv;
typedef PortableServer_ServantBase__epv *PortableServer_RefCountServantBase__vepv;
typedef PortableServer_ServantBase PortableServer_RefCountServantBase;



typedef struct ORBit_POAObject_type *ORBit_POAObject;
typedef struct ORBit_OAObject_type *ORBit_OAObject;

typedef gshort ORBit_VepvIdx;

typedef void (*ORBitSmallSkeleton) (PortableServer_ServantBase *servant,
        gpointer ret,
        gpointer *args,
        gpointer ctx,
        CORBA_Environment *ev,
        gpointer implementation);

typedef ORBitSmallSkeleton (*ORBit_impl_finder)
       (PortableServer_ServantBase *servant,
        const char *method,
        gpointer *m_data,
        gpointer *implementation);

typedef ORBit_impl_finder ORBit_small_impl_finder;











typedef CORBA_unsigned_long IOP_ProfileId;
extern

const struct CORBA_TypeCode_struct TC_IOP_ProfileId_struct;
typedef struct IOP_TaggedProfile_type IOP_TaggedProfile;
struct IOP_TaggedProfile_type {
IOP_ProfileId tag;
CORBA_sequence_CORBA_octet profile_data;
};
extern

const struct CORBA_TypeCode_struct TC_IOP_TaggedProfile_struct;







typedef struct IOP_IOR_type IOP_IOR;
typedef struct { CORBA_unsigned_long _maximum, _length; IOP_TaggedProfile* _buffer; CORBA_boolean _release; } CORBA_sequence_IOP_TaggedProfile;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_IOP_TaggedProfile_struct;







struct IOP_IOR_type {
CORBA_string type_id;
CORBA_sequence_IOP_TaggedProfile profiles;
};
extern

const struct CORBA_TypeCode_struct TC_IOP_IOR_struct;







typedef CORBA_unsigned_long IOP_ComponentId;
extern

const struct CORBA_TypeCode_struct TC_IOP_ComponentId_struct;







typedef struct IOP_TaggedComponent_type IOP_TaggedComponent;
struct IOP_TaggedComponent_type {
IOP_ComponentId tag;
CORBA_sequence_CORBA_octet component_data;
};
extern

const struct CORBA_TypeCode_struct TC_IOP_TaggedComponent_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; IOP_TaggedComponent* _buffer; CORBA_boolean _release; } CORBA_sequence_IOP_TaggedComponent;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_IOP_TaggedComponent_struct;
typedef CORBA_sequence_IOP_TaggedComponent IOP_MultipleComponentProfile;
extern

const struct CORBA_TypeCode_struct TC_IOP_MultipleComponentProfile_struct;
typedef CORBA_unsigned_long IOP_ServiceId;
extern

const struct CORBA_TypeCode_struct TC_IOP_ServiceId_struct;







typedef struct IOP_ServiceContext_type IOP_ServiceContext;
struct IOP_ServiceContext_type {
IOP_ServiceId context_id;
CORBA_sequence_CORBA_octet context_data;
};
extern

const struct CORBA_TypeCode_struct TC_IOP_ServiceContext_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; IOP_ServiceContext* _buffer; CORBA_boolean _release; } CORBA_sequence_IOP_ServiceContext;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_IOP_ServiceContext_struct;
typedef CORBA_sequence_IOP_ServiceContext IOP_ServiceContextList;
extern

const struct CORBA_TypeCode_struct TC_IOP_ServiceContextList_struct;
typedef CORBA_Object IOP_Codec;
extern CORBA_unsigned_long IOP_Codec__classid;
extern

const struct CORBA_TypeCode_struct TC_IOP_Codec_struct;







typedef struct IOP_Codec_InvalidTypeForEncoding_type IOP_Codec_InvalidTypeForEncoding;
struct IOP_Codec_InvalidTypeForEncoding_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_IOP_Codec_InvalidTypeForEncoding_struct;
typedef struct IOP_Codec_FormatMismatch_type IOP_Codec_FormatMismatch;
struct IOP_Codec_FormatMismatch_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_IOP_Codec_FormatMismatch_struct;
typedef struct IOP_Codec_TypeMismatch_type IOP_Codec_TypeMismatch;
struct IOP_Codec_TypeMismatch_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_IOP_Codec_TypeMismatch_struct;







typedef CORBA_short IOP_EncodingFormat;
extern

const struct CORBA_TypeCode_struct TC_IOP_EncodingFormat_struct;
typedef struct IOP_Encoding_type IOP_Encoding;
struct IOP_Encoding_type {
IOP_EncodingFormat format;
CORBA_octet major_version;
CORBA_octet minor_version;
};
extern

const struct CORBA_TypeCode_struct TC_IOP_Encoding_struct;
typedef CORBA_Object IOP_CodecFactory;
extern CORBA_unsigned_long IOP_CodecFactory__classid;
extern

const struct CORBA_TypeCode_struct TC_IOP_CodecFactory_struct;







typedef struct IOP_CodecFactory_UnknownEncoding_type IOP_CodecFactory_UnknownEncoding;
struct IOP_CodecFactory_UnknownEncoding_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_IOP_CodecFactory_UnknownEncoding_struct;







typedef struct IIOP_Version_type IIOP_Version;
struct IIOP_Version_type {
CORBA_octet major;
CORBA_octet minor;
};
extern

const struct CORBA_TypeCode_struct TC_IIOP_Version_struct;







typedef struct IIOP_ProfileBody_1_0_type IIOP_ProfileBody_1_0;
struct IIOP_ProfileBody_1_0_type {
IIOP_Version iiop_version;
CORBA_string host;
CORBA_unsigned_short port;
CORBA_sequence_CORBA_octet object_key;
};
extern

const struct CORBA_TypeCode_struct TC_IIOP_ProfileBody_1_0_struct;







typedef struct IIOP_ProfileBody_1_1_type IIOP_ProfileBody_1_1;
struct IIOP_ProfileBody_1_1_type {
IIOP_Version iiop_version;
CORBA_string host;
CORBA_unsigned_short port;
CORBA_sequence_CORBA_octet object_key;
CORBA_sequence_IOP_TaggedComponent components;
};
extern

const struct CORBA_TypeCode_struct TC_IIOP_ProfileBody_1_1_struct;







typedef struct IIOP_ListenPoint_type IIOP_ListenPoint;
struct IIOP_ListenPoint_type {
CORBA_string host;
CORBA_unsigned_short port;
};
extern

const struct CORBA_TypeCode_struct TC_IIOP_ListenPoint_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; IIOP_ListenPoint* _buffer; CORBA_boolean _release; } CORBA_sequence_IIOP_ListenPoint;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_IIOP_ListenPoint_struct;
typedef CORBA_sequence_IIOP_ListenPoint IIOP_ListenPointList;
extern

const struct CORBA_TypeCode_struct TC_IIOP_ListenPointList_struct;
typedef struct IIOP_BiDirIIOPServiceContext_type IIOP_BiDirIIOPServiceContext;
struct IIOP_BiDirIIOPServiceContext_type {
IIOP_ListenPointList listen_points;
};
extern

const struct CORBA_TypeCode_struct TC_IIOP_BiDirIIOPServiceContext_struct;







typedef struct GIOP_Version_type GIOP_Version;
struct GIOP_Version_type {
CORBA_octet major;
CORBA_octet minor;
};
extern

const struct CORBA_TypeCode_struct TC_GIOP_Version_struct;
typedef CORBA_sequence_CORBA_octet GIOP_Principal;
extern

const struct CORBA_TypeCode_struct TC_GIOP_Principal_struct;
typedef enum {
  GIOP_Request,
  GIOP_Reply,
  GIOP_CancelRequest,
  GIOP_LocateRequest,
  GIOP_LocateReply,
  GIOP_CloseConnection,
  GIOP_MessageError,
  GIOP_Fragment
} GIOP_MsgType_1_1;
extern

const struct CORBA_TypeCode_struct TC_GIOP_MsgType_1_1_struct;





typedef GIOP_MsgType_1_1 GIOP_MsgType_1_2;
extern

const struct CORBA_TypeCode_struct TC_GIOP_MsgType_1_2_struct;







typedef GIOP_MsgType_1_1 GIOP_MsgType_1_3;
extern

const struct CORBA_TypeCode_struct TC_GIOP_MsgType_1_3_struct;







typedef struct GIOP_MessageHeader_1_0_type GIOP_MessageHeader_1_0;
struct GIOP_MessageHeader_1_0_type {
CORBA_char magic[4];
GIOP_Version GIOP_version;
CORBA_boolean byte_order;
CORBA_octet message_type;
CORBA_unsigned_long message_size;
};
extern

const struct CORBA_TypeCode_struct TC_GIOP_MessageHeader_1_0_struct;







typedef struct GIOP_MessageHeader_1_1_type GIOP_MessageHeader_1_1;
struct GIOP_MessageHeader_1_1_type {
CORBA_char magic[4];
GIOP_Version GIOP_version;
CORBA_octet flags;
CORBA_octet message_type;
CORBA_unsigned_long message_size;
};
extern

const struct CORBA_TypeCode_struct TC_GIOP_MessageHeader_1_1_struct;







typedef GIOP_MessageHeader_1_1 GIOP_MessageHeader_1_2;
extern

const struct CORBA_TypeCode_struct TC_GIOP_MessageHeader_1_2_struct;







typedef GIOP_MessageHeader_1_1 GIOP_MessageHeader_1_3;
extern

const struct CORBA_TypeCode_struct TC_GIOP_MessageHeader_1_3_struct;







typedef struct GIOP_RequestHeader_1_0_type GIOP_RequestHeader_1_0;
struct GIOP_RequestHeader_1_0_type {
IOP_ServiceContextList service_context;
CORBA_unsigned_long request_id;
CORBA_boolean response_expected;
CORBA_sequence_CORBA_octet object_key;
CORBA_string operation;
GIOP_Principal requesting_principal;
};
extern

const struct CORBA_TypeCode_struct TC_GIOP_RequestHeader_1_0_struct;







typedef struct GIOP_RequestHeader_1_1_type GIOP_RequestHeader_1_1;
struct GIOP_RequestHeader_1_1_type {
IOP_ServiceContextList service_context;
CORBA_unsigned_long request_id;
CORBA_boolean response_expected;
CORBA_octet reserved[3];
CORBA_sequence_CORBA_octet object_key;
CORBA_string operation;
GIOP_Principal requesting_principal;
};
extern

const struct CORBA_TypeCode_struct TC_GIOP_RequestHeader_1_1_struct;







typedef CORBA_short GIOP_AddressingDisposition;
extern

const struct CORBA_TypeCode_struct TC_GIOP_AddressingDisposition_struct;
typedef struct GIOP_IORAddressingInfo_type GIOP_IORAddressingInfo;
struct GIOP_IORAddressingInfo_type {
CORBA_unsigned_long selected_profile_index;
IOP_IOR ior;
};
extern

const struct CORBA_TypeCode_struct TC_GIOP_IORAddressingInfo_struct;







typedef struct GIOP_TargetAddress_type GIOP_TargetAddress;
struct GIOP_TargetAddress_type {
GIOP_AddressingDisposition _d;
union {
CORBA_sequence_CORBA_octet object_key;
IOP_TaggedProfile profile;
GIOP_IORAddressingInfo ior;
} _u;
};
extern

const struct CORBA_TypeCode_struct TC_GIOP_TargetAddress_struct;







typedef struct GIOP_RequestHeader_1_2_type GIOP_RequestHeader_1_2;
struct GIOP_RequestHeader_1_2_type {
CORBA_unsigned_long request_id;
CORBA_octet response_flags;
CORBA_octet reserved[3];
GIOP_TargetAddress target;
CORBA_string operation;
IOP_ServiceContextList service_context;
};
extern

const struct CORBA_TypeCode_struct TC_GIOP_RequestHeader_1_2_struct;







typedef GIOP_RequestHeader_1_2 GIOP_RequestHeader_1_3;
extern

const struct CORBA_TypeCode_struct TC_GIOP_RequestHeader_1_3_struct;







typedef enum {
  GIOP_NO_EXCEPTION,
  GIOP_USER_EXCEPTION,
  GIOP_SYSTEM_EXCEPTION,
  GIOP_LOCATION_FORWARD
} GIOP_ReplyStatusType_1_0;
extern

const struct CORBA_TypeCode_struct TC_GIOP_ReplyStatusType_1_0_struct;





typedef struct GIOP_ReplyHeader_1_0_type GIOP_ReplyHeader_1_0;
struct GIOP_ReplyHeader_1_0_type {
IOP_ServiceContextList service_context;
CORBA_unsigned_long request_id;
GIOP_ReplyStatusType_1_0 reply_status;
};
extern

const struct CORBA_TypeCode_struct TC_GIOP_ReplyHeader_1_0_struct;







typedef GIOP_ReplyHeader_1_0 GIOP_ReplyHeader_1_1;
extern

const struct CORBA_TypeCode_struct TC_GIOP_ReplyHeader_1_1_struct;







typedef struct GIOP_SystemExceptionReplyBody_type GIOP_SystemExceptionReplyBody;
struct GIOP_SystemExceptionReplyBody_type {
CORBA_string exception_id;
CORBA_unsigned_long minor_code_value;
CORBA_unsigned_long completion_status;
};
extern

const struct CORBA_TypeCode_struct TC_GIOP_SystemExceptionReplyBody_struct;







typedef struct GIOP_CancelRequestHeader_type GIOP_CancelRequestHeader;
struct GIOP_CancelRequestHeader_type {
CORBA_unsigned_long request_id;
};
extern

const struct CORBA_TypeCode_struct TC_GIOP_CancelRequestHeader_struct;







typedef struct GIOP_LocateRequestHeader_1_0_type GIOP_LocateRequestHeader_1_0;
struct GIOP_LocateRequestHeader_1_0_type {
CORBA_unsigned_long request_id;
CORBA_sequence_CORBA_octet object_key;
};
extern

const struct CORBA_TypeCode_struct TC_GIOP_LocateRequestHeader_1_0_struct;







typedef GIOP_LocateRequestHeader_1_0 GIOP_LocateRequestHeader_1_1;
extern

const struct CORBA_TypeCode_struct TC_GIOP_LocateRequestHeader_1_1_struct;







typedef struct GIOP_LocateRequestHeader_1_2_type GIOP_LocateRequestHeader_1_2;
struct GIOP_LocateRequestHeader_1_2_type {
CORBA_unsigned_long request_id;
GIOP_TargetAddress target;
};
extern

const struct CORBA_TypeCode_struct TC_GIOP_LocateRequestHeader_1_2_struct;







typedef GIOP_LocateRequestHeader_1_2 GIOP_LocateRequestHeader_1_3;
extern

const struct CORBA_TypeCode_struct TC_GIOP_LocateRequestHeader_1_3_struct;







typedef enum {
  GIOP_UNKNOWN_OBJECT,
  GIOP_OBJECT_HERE,
  GIOP_OBJECT_FORWARD
} GIOP_LocateStatusType_1_0;
extern

const struct CORBA_TypeCode_struct TC_GIOP_LocateStatusType_1_0_struct;





typedef struct GIOP_LocateReplyHeader_1_0_type GIOP_LocateReplyHeader_1_0;
struct GIOP_LocateReplyHeader_1_0_type {
CORBA_unsigned_long request_id;
GIOP_LocateStatusType_1_0 locate_status;
};
extern

const struct CORBA_TypeCode_struct TC_GIOP_LocateReplyHeader_1_0_struct;







typedef GIOP_LocateReplyHeader_1_0 GIOP_LocateReplyHeader_1_1;
extern

const struct CORBA_TypeCode_struct TC_GIOP_LocateReplyHeader_1_1_struct;







typedef struct GIOP_FragmentHeader_1_2_type GIOP_FragmentHeader_1_2;
struct GIOP_FragmentHeader_1_2_type {
CORBA_unsigned_long request_id;
};
extern

const struct CORBA_TypeCode_struct TC_GIOP_FragmentHeader_1_2_struct;







typedef GIOP_FragmentHeader_1_2 GIOP_FragmentHeader_1_3;
extern

const struct CORBA_TypeCode_struct TC_GIOP_FragmentHeader_1_3_struct;
typedef CORBA_sequence_CORBA_octet CSI_X509CertificateChain;
extern

const struct CORBA_TypeCode_struct TC_CSI_X509CertificateChain_struct;
typedef CORBA_sequence_CORBA_octet CSI_X501DistinguishedName;
extern

const struct CORBA_TypeCode_struct TC_CSI_X501DistinguishedName_struct;
typedef CORBA_sequence_CORBA_octet CSI_UTF8String;
extern

const struct CORBA_TypeCode_struct TC_CSI_UTF8String_struct;
typedef CORBA_sequence_CORBA_octet CSI_OID;
extern

const struct CORBA_TypeCode_struct TC_CSI_OID_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_sequence_CORBA_octet* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_sequence_CORBA_octet;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_sequence_CORBA_octet_struct;
typedef CORBA_sequence_CORBA_sequence_CORBA_octet CORBA_sequence_CSI_OID;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CSI_OID_struct;
typedef CORBA_sequence_CSI_OID CSI_OIDList;
extern

const struct CORBA_TypeCode_struct TC_CSI_OIDList_struct;
typedef CORBA_sequence_CORBA_octet CSI_GSSToken;
extern

const struct CORBA_TypeCode_struct TC_CSI_GSSToken_struct;
typedef CORBA_sequence_CORBA_octet CSI_GSS_NT_ExportedName;
extern

const struct CORBA_TypeCode_struct TC_CSI_GSS_NT_ExportedName_struct;
typedef CORBA_sequence_CORBA_sequence_CORBA_octet CORBA_sequence_CSI_GSS_NT_ExportedName;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CSI_GSS_NT_ExportedName_struct;
typedef CORBA_sequence_CSI_GSS_NT_ExportedName CSI_GSS_NT_ExportedNameList;
extern

const struct CORBA_TypeCode_struct TC_CSI_GSS_NT_ExportedNameList_struct;
typedef CORBA_short CSI_MsgType;
extern

const struct CORBA_TypeCode_struct TC_CSI_MsgType_struct;
typedef CORBA_unsigned_long_long CSI_ContextId;
extern

const struct CORBA_TypeCode_struct TC_CSI_ContextId_struct;







typedef CORBA_unsigned_long CSI_AuthorizationElementType;
extern

const struct CORBA_TypeCode_struct TC_CSI_AuthorizationElementType_struct;
typedef CORBA_sequence_CORBA_octet CSI_AuthorizationElementContents;
extern

const struct CORBA_TypeCode_struct TC_CSI_AuthorizationElementContents_struct;
typedef struct CSI_AuthorizationElement_type CSI_AuthorizationElement;
struct CSI_AuthorizationElement_type {
CSI_AuthorizationElementType the_type;
CSI_AuthorizationElementContents the_element;
};
extern

const struct CORBA_TypeCode_struct TC_CSI_AuthorizationElement_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CSI_AuthorizationElement* _buffer; CORBA_boolean _release; } CORBA_sequence_CSI_AuthorizationElement;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CSI_AuthorizationElement_struct;
typedef CORBA_sequence_CSI_AuthorizationElement CSI_AuthorizationToken;
extern

const struct CORBA_TypeCode_struct TC_CSI_AuthorizationToken_struct;
typedef CORBA_unsigned_long CSI_IdentityTokenType;
extern

const struct CORBA_TypeCode_struct TC_CSI_IdentityTokenType_struct;
typedef CORBA_sequence_CORBA_octet CSI_IdentityExtension;
extern

const struct CORBA_TypeCode_struct TC_CSI_IdentityExtension_struct;
typedef struct CSI_IdentityToken_type CSI_IdentityToken;
struct CSI_IdentityToken_type {
CSI_IdentityTokenType _d;
union {
CORBA_boolean absent;
CORBA_boolean anonymous;
CSI_GSS_NT_ExportedName principal_name;
CSI_X509CertificateChain certificate_chain;
CSI_X501DistinguishedName dn;
CSI_IdentityExtension id;
} _u;
};
extern

const struct CORBA_TypeCode_struct TC_CSI_IdentityToken_struct;







typedef struct CSI_EstablishContext_type CSI_EstablishContext;
struct CSI_EstablishContext_type {
CSI_ContextId client_context_id;
CSI_AuthorizationToken authorization_token;
CSI_IdentityToken identity_token;
CSI_GSSToken client_authentication_token;
};
extern

const struct CORBA_TypeCode_struct TC_CSI_EstablishContext_struct;







typedef struct CSI_CompleteEstablishContext_type CSI_CompleteEstablishContext;
struct CSI_CompleteEstablishContext_type {
CSI_ContextId client_context_id;
CORBA_boolean context_stateful;
CSI_GSSToken final_context_token;
};
extern

const struct CORBA_TypeCode_struct TC_CSI_CompleteEstablishContext_struct;







typedef struct CSI_ContextError_type CSI_ContextError;
struct CSI_ContextError_type {
CSI_ContextId client_context_id;
CORBA_long major_status;
CORBA_long minor_status;
CSI_GSSToken error_token;
};
extern

const struct CORBA_TypeCode_struct TC_CSI_ContextError_struct;







typedef struct CSI_MessageInContext_type CSI_MessageInContext;
struct CSI_MessageInContext_type {
CSI_ContextId client_context_id;
CORBA_boolean discard_context;
};
extern

const struct CORBA_TypeCode_struct TC_CSI_MessageInContext_struct;







typedef struct CSI_SASContextBody_type CSI_SASContextBody;
struct CSI_SASContextBody_type {
CSI_MsgType _d;
union {
CSI_EstablishContext establish_msg;
CSI_CompleteEstablishContext complete_msg;
CSI_ContextError error_msg;
CSI_MessageInContext in_context_msg;
} _u;
};
extern

const struct CORBA_TypeCode_struct TC_CSI_SASContextBody_struct;







typedef CORBA_string CSI_StringOID;
extern

const struct CORBA_TypeCode_struct TC_CSI_StringOID_struct;
typedef CORBA_unsigned_short CSIIOP_AssociationOptions;
extern

const struct CORBA_TypeCode_struct TC_CSIIOP_AssociationOptions_struct;
typedef CORBA_unsigned_long CSIIOP_ServiceConfigurationSyntax;
extern

const struct CORBA_TypeCode_struct TC_CSIIOP_ServiceConfigurationSyntax_struct;
typedef CORBA_sequence_CORBA_octet CSIIOP_ServiceSpecificName;
extern

const struct CORBA_TypeCode_struct TC_CSIIOP_ServiceSpecificName_struct;
typedef struct CSIIOP_ServiceConfiguration_type CSIIOP_ServiceConfiguration;
struct CSIIOP_ServiceConfiguration_type {
CSIIOP_ServiceConfigurationSyntax syntax;
CSIIOP_ServiceSpecificName name;
};
extern

const struct CORBA_TypeCode_struct TC_CSIIOP_ServiceConfiguration_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CSIIOP_ServiceConfiguration* _buffer; CORBA_boolean _release; } CORBA_sequence_CSIIOP_ServiceConfiguration;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CSIIOP_ServiceConfiguration_struct;
typedef CORBA_sequence_CSIIOP_ServiceConfiguration CSIIOP_ServiceConfigurationList;
extern

const struct CORBA_TypeCode_struct TC_CSIIOP_ServiceConfigurationList_struct;
typedef struct CSIIOP_AS_ContextSec_type CSIIOP_AS_ContextSec;
struct CSIIOP_AS_ContextSec_type {
CSIIOP_AssociationOptions target_supports;
CSIIOP_AssociationOptions target_requires;
CSI_OID client_authentication_mech;
CSI_GSS_NT_ExportedName target_name;
};
extern

const struct CORBA_TypeCode_struct TC_CSIIOP_AS_ContextSec_struct;







typedef struct CSIIOP_SAS_ContextSec_type CSIIOP_SAS_ContextSec;
struct CSIIOP_SAS_ContextSec_type {
CSIIOP_AssociationOptions target_supports;
CSIIOP_AssociationOptions target_requires;
CSIIOP_ServiceConfigurationList privilege_authorities;
CSI_OIDList supported_naming_mechanisms;
CSI_IdentityTokenType supported_identity_types;
};
extern

const struct CORBA_TypeCode_struct TC_CSIIOP_SAS_ContextSec_struct;







typedef struct CSIIOP_CompoundSecMech_type CSIIOP_CompoundSecMech;
struct CSIIOP_CompoundSecMech_type {
CSIIOP_AssociationOptions target_requires;
IOP_TaggedComponent transport_mech;
CSIIOP_AS_ContextSec as_context_mech;
CSIIOP_SAS_ContextSec sas_context_mech;
};
extern

const struct CORBA_TypeCode_struct TC_CSIIOP_CompoundSecMech_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CSIIOP_CompoundSecMech* _buffer; CORBA_boolean _release; } CORBA_sequence_CSIIOP_CompoundSecMech;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CSIIOP_CompoundSecMech_struct;
typedef CORBA_sequence_CSIIOP_CompoundSecMech CSIIOP_CompoundSecMechanisms;
extern

const struct CORBA_TypeCode_struct TC_CSIIOP_CompoundSecMechanisms_struct;
typedef struct CSIIOP_CompoundSecMechList_type CSIIOP_CompoundSecMechList;
struct CSIIOP_CompoundSecMechList_type {
CORBA_boolean stateful;
CSIIOP_CompoundSecMechanisms mechanism_list;
};
extern

const struct CORBA_TypeCode_struct TC_CSIIOP_CompoundSecMechList_struct;







typedef struct CSIIOP_TransportAddress_type CSIIOP_TransportAddress;
struct CSIIOP_TransportAddress_type {
CORBA_string host_name;
CORBA_unsigned_short port;
};
extern

const struct CORBA_TypeCode_struct TC_CSIIOP_TransportAddress_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CSIIOP_TransportAddress* _buffer; CORBA_boolean _release; } CORBA_sequence_CSIIOP_TransportAddress;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CSIIOP_TransportAddress_struct;
typedef CORBA_sequence_CSIIOP_TransportAddress CSIIOP_TransportAddressList;
extern

const struct CORBA_TypeCode_struct TC_CSIIOP_TransportAddressList_struct;
typedef struct CSIIOP_SECIOP_SEC_TRANS_type CSIIOP_SECIOP_SEC_TRANS;
struct CSIIOP_SECIOP_SEC_TRANS_type {
CSIIOP_AssociationOptions target_supports;
CSIIOP_AssociationOptions target_requires;
CSI_OID mech_oid;
CSI_GSS_NT_ExportedName target_name;
CSIIOP_TransportAddressList addresses;
};
extern

const struct CORBA_TypeCode_struct TC_CSIIOP_SECIOP_SEC_TRANS_struct;
typedef struct CSIIOP_TLS_SEC_TRANS_type CSIIOP_TLS_SEC_TRANS;
struct CSIIOP_TLS_SEC_TRANS_type {
CSIIOP_AssociationOptions target_supports;
CSIIOP_AssociationOptions target_requires;
CSIIOP_TransportAddressList addresses;
};
extern

const struct CORBA_TypeCode_struct TC_CSIIOP_TLS_SEC_TRANS_struct;







typedef CORBA_unsigned_short BiDirPolicy_BidirectionalPolicyValue;
extern

const struct CORBA_TypeCode_struct TC_BiDirPolicy_BidirectionalPolicyValue_struct;
typedef CORBA_Object BiDirPolicy_BidirectionalPolicy;
extern CORBA_unsigned_long BiDirPolicy_BidirectionalPolicy__classid;
extern

const struct CORBA_TypeCode_struct TC_BiDirPolicy_BidirectionalPolicy_struct;





typedef CORBA_unsigned_long CONV_FRAME_CodeSetId;
extern

const struct CORBA_TypeCode_struct TC_CONV_FRAME_CodeSetId_struct;







typedef struct CONV_FRAME_CodeSetComponent_type CONV_FRAME_CodeSetComponent;
typedef CORBA_sequence_CORBA_unsigned_long CORBA_sequence_CONV_FRAME_CodeSetId;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CONV_FRAME_CodeSetId_struct;
struct CONV_FRAME_CodeSetComponent_type {
CONV_FRAME_CodeSetId native_code_set;
CORBA_sequence_CONV_FRAME_CodeSetId conversion_code_sets;
};
extern

const struct CORBA_TypeCode_struct TC_CONV_FRAME_CodeSetComponent_struct;







typedef struct CONV_FRAME_CodeSetComponentInfo_type CONV_FRAME_CodeSetComponentInfo;
struct CONV_FRAME_CodeSetComponentInfo_type {
CONV_FRAME_CodeSetComponent ForCharData;
CONV_FRAME_CodeSetComponent ForWcharData;
};
extern

const struct CORBA_TypeCode_struct TC_CONV_FRAME_CodeSetComponentInfo_struct;







typedef struct CONV_FRAME_CodeSetContext_type CONV_FRAME_CodeSetContext;
struct CONV_FRAME_CodeSetContext_type {
CONV_FRAME_CodeSetId char_data;
CONV_FRAME_CodeSetId wchar_data;
};
extern

const struct CORBA_TypeCode_struct TC_CONV_FRAME_CodeSetContext_struct;
typedef struct IOP_ORBitSpecificProfileBody_type IOP_ORBitSpecificProfileBody;
struct IOP_ORBitSpecificProfileBody_type {
CORBA_string unix_sock_path;
CORBA_unsigned_short ipv6_port;
CORBA_sequence_CORBA_octet object_key;
};
extern

const struct CORBA_TypeCode_struct TC_IOP_ORBitSpecificProfileBody_struct;







typedef struct IOP_GenericIOPProfileBody_type IOP_GenericIOPProfileBody;
struct IOP_GenericIOPProfileBody_type {
IIOP_Version iiop_version;
CORBA_string protocol;
CORBA_string host;
CORBA_string service;
CORBA_sequence_IOP_TaggedComponent components;
};
extern

const struct CORBA_TypeCode_struct TC_IOP_GenericIOPProfileBody_struct;







typedef struct IOP_SSLGenericComponent_type IOP_SSLGenericComponent;
struct IOP_SSLGenericComponent_type {
CORBA_string service;
};
extern

const struct CORBA_TypeCode_struct TC_IOP_SSLGenericComponent_struct;







CORBA_OctetSeq* IOP_Codec_encode(IOP_Codec _obj, const CORBA_any* data, CORBA_Environment *ev);
CORBA_any* IOP_Codec_decode(IOP_Codec _obj, const CORBA_OctetSeq* data, CORBA_Environment *ev);
CORBA_OctetSeq* IOP_Codec_encode_value(IOP_Codec _obj, const CORBA_any* data, CORBA_Environment *ev);
CORBA_any* IOP_Codec_decode_value(IOP_Codec _obj, const CORBA_OctetSeq* data, const CORBA_TypeCode tc, CORBA_Environment *ev);
IOP_Codec IOP_CodecFactory_create_codec(IOP_CodecFactory _obj, const IOP_Encoding* enc, CORBA_Environment *ev);



BiDirPolicy_BidirectionalPolicyValue BiDirPolicy_BidirectionalPolicy__get_value(BiDirPolicy_BidirectionalPolicy _obj, CORBA_Environment *ev);







typedef struct _GIOPThread GIOPThread;

struct _GIOPThread {
 GMutex *lock;
 GCond *incoming;
 GMainContext *wake_context;

 GList *keys;

 GList *async_ents;
 GList *request_queue;

 GQueue *invoke_policies;

 void (*request_handler) (gpointer poa_object,
     gpointer recv_buffer,
     gpointer dummy);
};



typedef enum {
 GIOP_CONNECTION_SSL
} GIOPConnectionOptions;

extern const char giop_version_ids[GIOP_NUM_VERSIONS][2];

typedef struct {
 CORBA_char magic[4];
 CORBA_char version[2];
 CORBA_octet flags;
 CORBA_octet message_type;
 CORBA_unsigned_long message_size;
} GIOPMsgHeader;

typedef enum
{
 GIOP_REQUEST,
 GIOP_REPLY,
 GIOP_CANCELREQUEST,
 GIOP_LOCATEREQUEST,
 GIOP_LOCATEREPLY,
 GIOP_CLOSECONNECTION,
 GIOP_MESSAGEERROR,
 GIOP_FRAGMENT,
 GIOP_NUM_MSG_TYPES
} GIOPMsgType;
typedef CORBA_sequence_CORBA_octet CORBA_Principal;

typedef struct {
  IOP_ServiceContextList service_context;
  CORBA_unsigned_long request_id;
  CORBA_boolean response_expected;
  CORBA_sequence_CORBA_octet object_key;
  CORBA_char *operation;
  CORBA_Principal requesting_principal;
} GIOPMsgRequest_1_0;

typedef struct {
  IOP_ServiceContextList service_context;
  CORBA_unsigned_long request_id;
  CORBA_boolean response_expected;
  CORBA_char reserved[3];
  CORBA_sequence_CORBA_octet object_key;
  CORBA_char *operation;
  CORBA_Principal requesting_principal;
} GIOPMsgRequest_1_1;

typedef struct {
  CORBA_unsigned_long request_id;
  CORBA_octet response_flags;
  CORBA_octet reserved[3];
  GIOP_TargetAddress target;
  CORBA_char *operation;
  IOP_ServiceContextList service_context;
} GIOPMsgRequest_1_2;

typedef struct {
  IOP_ServiceContextList service_context;
  CORBA_unsigned_long request_id;
  CORBA_unsigned_long reply_status;
} GIOPMsgReply_1_0;

typedef GIOPMsgReply_1_0 GIOPMsgReply_1_1;

typedef struct {
  CORBA_unsigned_long request_id;
  CORBA_unsigned_long reply_status;
  IOP_ServiceContextList service_context;
} GIOPMsgReply_1_2;

typedef struct {
  CORBA_unsigned_long request_id;
} GIOPMsgCancelRequest;

typedef struct {
  CORBA_unsigned_long request_id;
  CORBA_sequence_CORBA_octet object_key;
} GIOPMsgLocateRequest_1_0;

typedef GIOPMsgLocateRequest_1_0 GIOPMsgLocateRequest_1_1;

typedef struct {
  CORBA_unsigned_long request_id;
  GIOP_TargetAddress target;
} GIOPMsgLocateRequest_1_2;

typedef struct {
  CORBA_unsigned_long request_id;
  CORBA_unsigned_long locate_status;
} GIOPMsgLocateReply_1_0;

typedef GIOPMsgLocateReply_1_0 GIOPMsgLocateReply_1_1;

typedef struct {
  CORBA_unsigned_long request_id;
  CORBA_unsigned_long locate_status;
} GIOPMsgLocateReply_1_2;

typedef struct {
  GIOPMsgHeader header;

  union {
    GIOPMsgRequest_1_0 request_1_0;
    GIOPMsgRequest_1_1 request_1_1;
    GIOPMsgRequest_1_2 request_1_2;
    GIOPMsgReply_1_0 reply_1_0;
    GIOPMsgReply_1_1 reply_1_1;
    GIOPMsgReply_1_2 reply_1_2;
    GIOPMsgCancelRequest cancel_request;
    GIOPMsgLocateRequest_1_0 locate_request_1_0;
    GIOPMsgLocateRequest_1_1 locate_request_1_1;
    GIOPMsgLocateRequest_1_2 locate_request_1_2;
    GIOPMsgLocateReply_1_0 locate_reply_1_0;
    GIOPMsgLocateReply_1_1 locate_reply_1_1;
    GIOPMsgLocateReply_1_2 locate_reply_1_2;
  } u;
} GIOPMsg;

















typedef struct {
 LinkServer parent;

 gpointer orb_data;
 GIOPVersion giop_version;
} GIOPServer;

typedef struct {
 LinkServerClass parent_class;
} GIOPServerClass;

GType giop_server_get_type (void) __attribute__((__const__));
GIOPServer *giop_server_new (GIOPVersion giop_version,
      const char *proto_name,
      const char *local_host_info,
      const char *local_serv_info,
      LinkConnectionOptions create_options,
      gpointer create_orb_data);










struct _GIOPConnection {
 LinkConnection parent;

 GIOPRecvBuffer *incoming_msg;
 GList *incoming_frags;

 GIOPVersion giop_version;

 gpointer orb_data;
};

typedef struct {
 LinkConnectionClass parent_class;
} GIOPConnectionClass;

GType giop_connection_get_type (void) __attribute__((__const__));
GIOPConnection *giop_connection_initiate (gpointer orb_data,
            const char *proto_name,
            const char *remote_host_info,
            const char *remote_serv_info,
            GIOPConnectionOptions options,
            GIOPVersion giop_version);
void giop_connections_shutdown (void);
void giop_connection_close (GIOPConnection *cnx);
LinkConnectionStatus giop_connection_try_reconnect (GIOPConnection *cnx);












typedef struct {
 gulong size;
 guchar *ptr;
} GIOPIndirectChunk;

struct _GIOPSendBuffer {
 GIOPMsg msg;

 struct iovec *iovecs;
 gulong num_alloced;
 gulong num_used;

 const guchar *lastptr;

 guchar *indirect;
 gulong indirect_left;

 GIOPIndirectChunk *indirects;
 guint num_indirects_alloced;

 guint num_indirects_used;
 GIOPVersion giop_version;
 guint header_size;
};

GIOPSendBuffer *giop_send_buffer_use (GIOPVersion giop_version);


GIOPSendBuffer *giop_send_buffer_use_request (GIOPVersion giop_version,
           CORBA_unsigned_long request_id,
           CORBA_boolean response_expected,
           const CORBA_sequence_CORBA_octet *objkey,
           const struct iovec *operation_vec,
           const struct iovec *principal_vec);

GIOPSendBuffer *giop_send_buffer_use_reply (GIOPVersion giop_version,
           CORBA_unsigned_long request_id,
           CORBA_unsigned_long reply_status);
GIOPSendBuffer *giop_send_buffer_use_locate_request (GIOPVersion giop_version,
           CORBA_unsigned_long request_id,
           const CORBA_sequence_CORBA_octet *objkey);
GIOPSendBuffer *giop_send_buffer_use_locate_reply (GIOPVersion giop_version,
           CORBA_unsigned_long request_id,
           CORBA_unsigned_long locate_status);
GIOPSendBuffer *giop_send_buffer_use_close_connection (GIOPVersion giop_version);
GIOPSendBuffer *giop_send_buffer_use_message_error (GIOPVersion giop_version);

void giop_send_buffer_unuse (GIOPSendBuffer *buf);
void giop_send_buffer_append (GIOPSendBuffer *buf,
      gconstpointer mem,
      gulong len);
guchar *giop_send_buffer_append_aligned (GIOPSendBuffer *buf,
      gconstpointer mem,
      gulong align_len);
void giop_send_buffer_append_string (GIOPSendBuffer *buf,
      const char *str);
void giop_send_buffer_align (GIOPSendBuffer *buf,
      gulong boundary);
int giop_send_buffer_write (GIOPSendBuffer *buf,
      GIOPConnection *cnx,
      gboolean block);













typedef struct _IO_FILE FILE;





typedef struct _IO_FILE __FILE;
typedef unsigned int wint_t;
typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    char __wchb[4];
  } __value;
} __mbstate_t;

typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;







enum
{
  __GCONV_OK = 0,
  __GCONV_NOCONV,
  __GCONV_NODB,
  __GCONV_NOMEM,

  __GCONV_EMPTY_INPUT,
  __GCONV_FULL_OUTPUT,
  __GCONV_ILLEGAL_INPUT,
  __GCONV_INCOMPLETE_INPUT,

  __GCONV_ILLEGAL_DESCRIPTOR,
  __GCONV_INTERNAL_ERROR
};



enum
{
  __GCONV_IS_LAST = 0x0001,
  __GCONV_IGNORE_ERRORS = 0x0002
};



struct __gconv_step;
struct __gconv_step_data;
struct __gconv_loaded_object;
struct __gconv_trans_data;



typedef int (*__gconv_fct) (struct __gconv_step *, struct __gconv_step_data *,
       __const unsigned char **, __const unsigned char *,
       unsigned char **, size_t *, int, int);


typedef wint_t (*__gconv_btowc_fct) (struct __gconv_step *, unsigned char);


typedef int (*__gconv_init_fct) (struct __gconv_step *);
typedef void (*__gconv_end_fct) (struct __gconv_step *);



typedef int (*__gconv_trans_fct) (struct __gconv_step *,
      struct __gconv_step_data *, void *,
      __const unsigned char *,
      __const unsigned char **,
      __const unsigned char *, unsigned char **,
      size_t *);


typedef int (*__gconv_trans_context_fct) (void *, __const unsigned char *,
       __const unsigned char *,
       unsigned char *, unsigned char *);


typedef int (*__gconv_trans_query_fct) (__const char *, __const char ***,
     size_t *);


typedef int (*__gconv_trans_init_fct) (void **, const char *);
typedef void (*__gconv_trans_end_fct) (void *);

struct __gconv_trans_data
{

  __gconv_trans_fct __trans_fct;
  __gconv_trans_context_fct __trans_context_fct;
  __gconv_trans_end_fct __trans_end_fct;
  void *__data;
  struct __gconv_trans_data *__next;
};



struct __gconv_step
{
  struct __gconv_loaded_object *__shlib_handle;
  __const char *__modname;

  int __counter;

  char *__from_name;
  char *__to_name;

  __gconv_fct __fct;
  __gconv_btowc_fct __btowc_fct;
  __gconv_init_fct __init_fct;
  __gconv_end_fct __end_fct;



  int __min_needed_from;
  int __max_needed_from;
  int __min_needed_to;
  int __max_needed_to;


  int __stateful;

  void *__data;
};



struct __gconv_step_data
{
  unsigned char *__outbuf;
  unsigned char *__outbufend;



  int __flags;



  int __invocation_counter;



  int __internal_use;

  __mbstate_t *__statep;
  __mbstate_t __state;



  struct __gconv_trans_data *__trans;
};



typedef struct __gconv_info
{
  size_t __nsteps;
  struct __gconv_step *__steps;
  __extension__ struct __gconv_step_data __data [];
} *__gconv_t;
typedef union
{
  struct __gconv_info __cd;
  struct
  {
    struct __gconv_info __cd;
    struct __gconv_step_data __data;
  } __combined;
} _G_iconv_t;

typedef int _G_int16_t __attribute__ ((__mode__ (__HI__)));
typedef int _G_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int _G_uint16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int _G_uint32_t __attribute__ ((__mode__ (__SI__)));
struct _IO_jump_t; struct _IO_FILE;
typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
  __off64_t _offset;
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;
  size_t __pad5;

  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, __const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);
extern int __underflow (_IO_FILE *) __attribute__ ((__nothrow__));
extern int __uflow (_IO_FILE *) __attribute__ ((__nothrow__));
extern int __overflow (_IO_FILE *, int) __attribute__ ((__nothrow__));
extern wint_t __wunderflow (_IO_FILE *) __attribute__ ((__nothrow__));
extern wint_t __wuflow (_IO_FILE *) __attribute__ ((__nothrow__));
extern wint_t __woverflow (_IO_FILE *, wint_t) __attribute__ ((__nothrow__));
extern int _IO_getc (_IO_FILE *__fp) __attribute__ ((__nothrow__));
extern int _IO_putc (int __c, _IO_FILE *__fp) __attribute__ ((__nothrow__));
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__));

extern int _IO_peekc_locked (_IO_FILE *__fp) __attribute__ ((__nothrow__));





extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__));
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t) __attribute__ ((__nothrow__));
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t) __attribute__ ((__nothrow__));

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int) __attribute__ ((__nothrow__));
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int) __attribute__ ((__nothrow__));

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__));


typedef _G_fpos_t fpos_t;







extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;









extern int remove (__const char *__filename) __attribute__ ((__nothrow__));

extern int rename (__const char *__old, __const char *__new) __attribute__ ((__nothrow__));














extern FILE *tmpfile (void);
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__));





extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__));
extern char *tempnam (__const char *__dir, __const char *__pfx)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__));








extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

extern int fflush_unlocked (FILE *__stream);






extern FILE *fopen (__const char *__restrict __filename,
      __const char *__restrict __modes);




extern FILE *freopen (__const char *__restrict __filename,
        __const char *__restrict __modes,
        FILE *__restrict __stream);

extern FILE *fdopen (int __fd, __const char *__modes) __attribute__ ((__nothrow__));



extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__));





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__));








extern int fprintf (FILE *__restrict __stream,
      __const char *__restrict __format, ...);




extern int printf (__const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      __const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (__const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));





extern int snprintf (char *__restrict __s, size_t __maxlen,
       __const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        __const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));






extern int fscanf (FILE *__restrict __stream,
     __const char *__restrict __format, ...) ;




extern int scanf (__const char *__restrict __format, ...) ;

extern int sscanf (__const char *__restrict __s,
     __const char *__restrict __format, ...) __attribute__ ((__nothrow__));






extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
extern int fgetc_unlocked (FILE *__stream);











extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);








extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;






extern char *gets (char *__s) ;






extern int fputs (__const char *__restrict __s, FILE *__restrict __stream);





extern int puts (__const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (__const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s) ;

extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (__const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream) ;








extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, __const fpos_t *__pos);



extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__)) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__)) ;




extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;








extern void perror (__const char *__s);






extern int sys_nerr;
extern __const char *__const sys_errlist[];




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__)) ;




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;
extern FILE *popen (__const char *__command, __const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) __attribute__ ((__nothrow__));
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__)) ;


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__));
extern __inline int
vprintf (__const char *__restrict __fmt, __gnuc_va_list __arg)
{
  return vfprintf (stdout, __fmt, __arg);
}


extern __inline int
getchar (void)
{
  return _IO_getc (stdin);
}




extern __inline int
getc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}


extern __inline int
getchar_unlocked (void)
{
  return (__builtin_expect (((stdin)->_IO_read_ptr >= (stdin)->_IO_read_end), 0) ? __uflow (stdin) : *(unsigned char *) (stdin)->_IO_read_ptr++);
}




extern __inline int
putchar (int __c)
{
  return _IO_putc (__c, stdout);
}




extern __inline int
fputc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}





extern __inline int
putc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}


extern __inline int
putchar_unlocked (int __c)
{
  return (__builtin_expect (((stdout)->_IO_write_ptr >= (stdout)->_IO_write_end), 0) ? __overflow (stdout, (unsigned char) (__c)) : (unsigned char) (*(stdout)->_IO_write_ptr++ = (__c)));
}
extern __inline int
__attribute__ ((__nothrow__)) feof_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x10) != 0);
}


extern __inline int
__attribute__ ((__nothrow__)) ferror_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x20) != 0);
}







typedef enum {
  GIOP_MSG_READING_HEADER,
  GIOP_MSG_READING_BODY,
  GIOP_MSG_AWAITING_FRAGMENTS,
  GIOP_MSG_READY
} GIOPMessageBufferState;

typedef struct _GIOPMessageQueueEntry GIOPMessageQueueEntry;

typedef void (*GIOPAsyncCallback) (GIOPMessageQueueEntry *ent);


struct _GIOPMessageQueueEntry {
 GIOPRecvBuffer *buffer;
 GIOPConnection *cnx;
 CORBA_unsigned_long msg_type;
 CORBA_unsigned_long request_id;
 GIOPThread *src_thread;

 GIOPAsyncCallback async_cb;
};

struct _GIOPRecvBuffer {
 GIOPMsg msg;

 guchar *message_body;
 guchar *cur;
 guchar *end;

 GIOPConnection *connection;
 GIOPMessageBufferState state;

 GIOPVersion giop_version;
 gulong left_to_read;
 guint free_body : 1;
};


GIOPRecvBuffer *giop_recv_buffer_use_buf (GIOPConnection *cnx);
GIOPRecvBuffer *giop_recv_buffer_use_encaps_buf (GIOPRecvBuffer *buf);
GIOPRecvBuffer *giop_recv_buffer_use_encaps (guchar *mem,
          gulong len);
void giop_recv_list_destroy_queue_entry (GIOPMessageQueueEntry *ent);
void giop_recv_list_setup_queue_entry (GIOPMessageQueueEntry *ent,
          GIOPConnection *cnx,
          CORBA_unsigned_long msg_type,
          CORBA_unsigned_long request_id);
void giop_recv_list_setup_queue_entry_async (GIOPMessageQueueEntry *ent,
       GIOPAsyncCallback cb);

GIOPRecvBuffer *giop_recv_buffer_get (GIOPMessageQueueEntry *ent);
void giop_recv_buffer_unuse (GIOPRecvBuffer *buf);







CORBA_unsigned_long giop_recv_buffer_get_request_id (GIOPRecvBuffer *buf);
char *giop_recv_buffer_get_opname (GIOPRecvBuffer *buf);
CORBA_sequence_CORBA_octet *giop_recv_buffer_get_objkey (GIOPRecvBuffer *buf);
void giop_recv_list_zap (GIOPConnection *cnx);
gboolean giop_connection_handle_input (LinkConnection *lcnx);
void giop_connection_destroy_frags (GIOPConnection *cnx);
















void giop_byteswap(guchar *outdata,
     const guchar *data,
     gulong datalen);


extern inline void giop_byteswap(guchar *outdata,
     const guchar *data,
     gulong datalen)
{
  const guchar *source_ptr = data;
  guchar *dest_ptr = outdata + datalen - 1;
  while(dest_ptr >= outdata)
    *dest_ptr-- = *source_ptr++;
}










void giop_init (gboolean thread_safe,
        gboolean blank_wire_data);
void giop_main_run (void);
void giop_shutdown (void);
gboolean giop_thread_safe (void);
gboolean giop_thread_io (void);
GIOPThread *giop_thread_self (void);
void giop_invoke_async (GIOPMessageQueueEntry *ent);
void giop_recv_set_limit (glong limit);
glong giop_recv_get_limit (void);
void giop_incoming_signal_T (GIOPThread *tdata, GIOPMsgType t);

typedef struct _GIOPQueue GIOPQueue;
GIOPThread *giop_thread_get_main (void);
void giop_thread_set_main_handler (gpointer request_handler);
void giop_thread_request_push (GIOPThread *tdata,
       gpointer *poa_object,
       gpointer *recv_buffer);
void giop_thread_request_push_key (gpointer key,
       gpointer *poa_object,
       gpointer *recv_buffer);
gboolean giop_thread_same_key (gpointer key,
       gboolean no_key_default);
void giop_thread_key_add (GIOPThread *tdata,
       gpointer key);
void giop_thread_key_release (gpointer key);
void giop_thread_new_check (GIOPThread *opt_self);
void giop_thread_queue_process (GIOPThread *tdata);
gboolean giop_thread_queue_empty_T (GIOPThread *tdata);
void giop_thread_queue_tail_wakeup(GIOPThread *tdata);




















CORBA_ORB CORBA_ORB_init (int *argc,
     char **argv,
     CORBA_ORBid orb_identifier,
     CORBA_Environment *ev);
void ORBit_ORB_forw_bind (CORBA_ORB orb,
          CORBA_sequence_CORBA_octet *okey,
          CORBA_Object oref,
          CORBA_Environment *ev);

guint ORBit_ORB_idle_init (CORBA_ORB orb);

void ORBit_ORB_start_servers (CORBA_ORB orb);











CORBA_char *CORBA_string_alloc (CORBA_unsigned_long len);
CORBA_wchar *CORBA_wstring_alloc (CORBA_unsigned_long len);




CORBA_char *CORBA_string_dup (const CORBA_char *str);

CORBA_unsigned_long CORBA_wstring_len (CORBA_wchar *ws);



gpointer CORBA_string__freekids (gpointer mem,
      gpointer data);

CORBA_sequence_CORBA_octet *
         ORBit_sequence_CORBA_octet_dup (const CORBA_sequence_CORBA_octet *seq);












CORBA_Environment *CORBA_exception__alloc (void);
CORBA_Environment *CORBA_exception__copy (const CORBA_Environment *ev);

void CORBA_exception_set (CORBA_Environment *ev,
        CORBA_exception_type major,
        const CORBA_char *except_repos_id,
        void *param);

CORBA_char *CORBA_exception_id (CORBA_Environment *ev);
void *CORBA_exception_value (CORBA_Environment *ev);
void CORBA_exception_init (CORBA_Environment *ev);
void CORBA_exception_free (CORBA_Environment *ev);
CORBA_any *CORBA_exception_as_any (CORBA_Environment *ev);

void CORBA_exception_set_system (CORBA_Environment *ev,
        const CORBA_char *except_repos_id,
        CORBA_completion_status completed);



typedef struct {
 const CORBA_TypeCode tc;

 void (*marshal) (GIOPSendBuffer *, CORBA_Environment *);
} ORBit_exception_marshal_info;

typedef struct {
 const CORBA_TypeCode tc;

 void (*demarshal) (GIOPRecvBuffer *, CORBA_Environment *);
} ORBit_exception_demarshal_info;

void ORBit_handle_system_exception (CORBA_Environment *ev,
        const CORBA_char *nom,
        CORBA_completion_status status,
        GIOPRecvBuffer *buf,
        GIOPSendBuffer *sendbuf);

void ORBit_handle_exception (GIOPRecvBuffer *buf,
        CORBA_Environment *ev,
        const ORBit_exception_demarshal_info *ex_info,
        CORBA_ORB orb);
GIOPConnection *
     ORBit_handle_location_forward (GIOPRecvBuffer *buf,
        CORBA_Object obj);

void ORBit_send_system_exception (GIOPSendBuffer *buf,
        CORBA_Environment *ev);

void ORBit_send_user_exception (GIOPSendBuffer *send_buffer,
        CORBA_Environment *ev,
        const ORBit_exception_marshal_info *user_exceptions);











void CORBA_any__copy (CORBA_any *out,
    const CORBA_any *in);
CORBA_any *CORBA_any__alloc (void);



gpointer CORBA_any__freekids (gpointer mem,
    gpointer data);




gpointer ORBit_copy_value (gconstpointer value,
     CORBA_TypeCode tc);

CORBA_boolean
  ORBit_any_equivalent (CORBA_any *obj,
     CORBA_any *any,
     CORBA_Environment *ev);



void ORBit_marshal_arg (GIOPSendBuffer *buf,
     gconstpointer val,
     CORBA_TypeCode tc);

void ORBit_marshal_any (GIOPSendBuffer *buf,
     const CORBA_any *val);

gpointer ORBit_demarshal_arg (GIOPRecvBuffer *buf,
     CORBA_TypeCode tc,
     CORBA_ORB orb);

gboolean ORBit_demarshal_any (GIOPRecvBuffer *buf,
     CORBA_any *retval,
     CORBA_ORB orb);

gboolean ORBit_demarshal_value (CORBA_TypeCode tc,
     gpointer *val,
     GIOPRecvBuffer *buf,
     CORBA_ORB orb);

void ORBit_marshal_value (GIOPSendBuffer *buf,
     gconstpointer *val,
     CORBA_TypeCode tc);

CORBA_boolean
  ORBit_value_equivalent (gpointer *a,
     gpointer *b,
     CORBA_TypeCode tc,
     CORBA_Environment *ev);

size_t ORBit_gather_alloc_info (CORBA_TypeCode tc);















typedef CORBA_sequence_CORBA_octet ORBit_ObjectKey;

struct CORBA_Object_type {
 struct ORBit_RootObject_struct parent;

 GIOPConnection *connection;
 GQuark type_qid;
 GSList *profile_list;
 GSList *forward_locations;
 ORBit_ObjectKey *object_key;
 struct _ORBitPolicy *invoke_policy;

 CORBA_ORB orb;
 ORBit_OAObject adaptor_obj;
};













GIOPConnection *ORBit_object_get_connection (CORBA_Object obj);
GIOPConnection *ORBit_object_peek_connection (CORBA_Object obj);


void ORBit_marshal_object (GIOPSendBuffer *buf,
          CORBA_Object obj);
gboolean ORBit_demarshal_object (CORBA_Object *obj,
          GIOPRecvBuffer *buf,
          CORBA_ORB orb);

CORBA_Object ORBit_objref_new (CORBA_ORB orb,
          ORBit_OAObject adaptor_obj,
          GQuark type_id);






typedef struct _ORBitPolicy ORBitPolicy;




GType ORBit_policy_ex_get_type (void) __attribute__((__const__));
ORBitPolicy *ORBit_policy_new (GType type,
           const char *first_prop,
           ...);
ORBitPolicy *ORBit_policy_ref (ORBitPolicy *p);
void ORBit_policy_unref (ORBitPolicy *p);
void ORBit_object_set_policy (CORBA_Object obj,
           ORBitPolicy *p);
ORBitPolicy *ORBit_object_get_policy (CORBA_Object obj);
void ORBit_policy_push (ORBitPolicy *p);
void ORBit_policy_pop (void);




typedef CORBA_long ORBit_IArgFlag;
extern

const struct CORBA_TypeCode_struct TC_ORBit_IArgFlag_struct;
typedef struct ORBit_IArg_type ORBit_IArg;
struct ORBit_IArg_type {
CORBA_TypeCode tc;
ORBit_IArgFlag flags;
CORBA_string name;
};
extern

const struct CORBA_TypeCode_struct TC_ORBit_IArg_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; ORBit_IArg* _buffer; CORBA_boolean _release; } CORBA_sequence_ORBit_IArg;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_ORBit_IArg_struct;
typedef CORBA_sequence_ORBit_IArg ORBit_IArgs;
extern

const struct CORBA_TypeCode_struct TC_ORBit_IArgs_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; CORBA_TypeCode* _buffer; CORBA_boolean _release; } CORBA_sequence_CORBA_TypeCode;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_CORBA_TypeCode_struct;
typedef CORBA_sequence_CORBA_TypeCode ORBit_ITypes;
extern

const struct CORBA_TypeCode_struct TC_ORBit_ITypes_struct;
typedef CORBA_sequence_CORBA_string ORBit_IContexts;
extern

const struct CORBA_TypeCode_struct TC_ORBit_IContexts_struct;
typedef CORBA_long ORBit_IMethodFlag;
extern

const struct CORBA_TypeCode_struct TC_ORBit_IMethodFlag_struct;
typedef struct ORBit_IMethod_type ORBit_IMethod;
struct ORBit_IMethod_type {
ORBit_IArgs arguments;
ORBit_IContexts contexts;
ORBit_ITypes exceptions;
CORBA_TypeCode ret;
CORBA_string name;
CORBA_long name_len;
ORBit_IMethodFlag flags;
};
extern

const struct CORBA_TypeCode_struct TC_ORBit_IMethod_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; ORBit_IMethod* _buffer; CORBA_boolean _release; } CORBA_sequence_ORBit_IMethod;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_ORBit_IMethod_struct;
typedef CORBA_sequence_ORBit_IMethod ORBit_IMethods;
extern

const struct CORBA_TypeCode_struct TC_ORBit_IMethods_struct;
typedef struct ORBit_IInterface_type ORBit_IInterface;
struct ORBit_IInterface_type {
CORBA_TypeCode tc;
ORBit_IMethods methods;
CORBA_sequence_CORBA_string base_interfaces;
};
extern

const struct CORBA_TypeCode_struct TC_ORBit_IInterface_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; ORBit_IInterface* _buffer; CORBA_boolean _release; } CORBA_sequence_ORBit_IInterface;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_ORBit_IInterface_struct;
typedef CORBA_sequence_ORBit_IInterface ORBit_IInterfaces;
extern

const struct CORBA_TypeCode_struct TC_ORBit_IInterfaces_struct;
typedef struct ORBit_NoIInterface_type ORBit_NoIInterface;
struct ORBit_NoIInterface_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_ORBit_NoIInterface_struct;




extern ORBit_IInterface CORBA_Object__iinterface;
extern ORBit_IMethod CORBA_Object__imethods[];













struct CORBA_Policy_type {
 struct ORBit_RootObject_struct parent;

 CORBA_unsigned_long type;
 CORBA_unsigned_long value;
};

CORBA_Policy ORBit_Policy_new (CORBA_unsigned_long type,
          CORBA_unsigned_long value);













struct CORBA_Context_type {
 struct ORBit_RootObject_struct parent;

 GHashTable *mappings;
 GSList *children;

 gchar *the_name;

 CORBA_Context parent_ctx;
};

void ORBit_Context_marshal (CORBA_Context ctx,
        const ORBit_ContextMarshalItem *mlist,
        CORBA_unsigned_long nitems,
        GIOPSendBuffer *buf);

gboolean ORBit_Context_demarshal (CORBA_Context parent,
        CORBA_Context initme,
        GIOPRecvBuffer *recv_buffer);

void ORBit_Context_server_free (CORBA_Context ctx);















typedef struct {
 CORBA_unsigned_long version;
 ORBit_IInterface **interfaces;
 CORBA_sequence_CORBA_TypeCode types;
} ORBit_IModule;

const char *ORBit_get_safe_tmp (void);


gpointer ORBit_small_alloc (CORBA_TypeCode tc);
gpointer ORBit_small_allocbuf (CORBA_TypeCode tc,
     CORBA_unsigned_long length);
void ORBit_small_freekids (CORBA_TypeCode tc,
     gpointer p,
     gpointer d);


gpointer ORBit_sequence_alloc (CORBA_TypeCode sequence_tc,
     CORBA_unsigned_long length);
void ORBit_sequence_append (gpointer sequence,
     gconstpointer element);
void ORBit_sequence_set_size (gpointer sequence,
     CORBA_unsigned_long length);

void ORBit_sequence_concat (gpointer sequence,
     gconstpointer append);
void ORBit_sequence_remove (gpointer sequence,
                                        guint idx);

typedef enum {
 ORBIT_CONNECTION_CONNECTED,
 ORBIT_CONNECTION_CONNECTING,
 ORBIT_CONNECTION_DISCONNECTED,
 ORBIT_CONNECTION_IN_PROC
} ORBitConnectionStatus;

gpointer ORBit_small_get_servant (CORBA_Object obj);
ORBitConnectionStatus ORBit_small_get_connection_status (CORBA_Object obj);
ORBitConnectionStatus ORBit_small_listen_for_broken (CORBA_Object obj,
           GCallback fn,
           gpointer user_data);
ORBitConnectionStatus ORBit_small_unlisten_for_broken_full (CORBA_Object obj,
           GCallback fn,
           gpointer user_data);

ORBitConnectionStatus ORBit_small_unlisten_for_broken (CORBA_Object obj,
           GCallback fn);

typedef struct _ORBitConnection ORBitConnection;

ORBitConnection *ORBit_small_get_connection (CORBA_Object obj);
ORBitConnection *ORBit_small_get_connection_ref (CORBA_Object obj);
void ORBit_small_connection_unref (ORBitConnection *cnx);
void ORBit_connection_set_max_buffer (ORBitConnection *cnx,
        gulong max_buffer_bytes);






extern int ORBit_small_flags;


void ORBit_small_invoke_stub (CORBA_Object object,
     ORBit_IMethod *m_data,
     gpointer ret,
     gpointer *args,
     CORBA_Context ctx,
     CORBA_Environment *ev);


void ORBit_small_invoke_stub_n (CORBA_Object object,
       ORBit_IMethods *methods,
       glong index,
       gpointer ret,
       gpointer *args,
       CORBA_Context ctx,
       CORBA_Environment *ev);







void ORBit_small_invoke_adaptor (ORBit_OAObject adaptor_obj,
        GIOPRecvBuffer *recv_buffer,
        ORBit_IMethod *m_data,
        gpointer data,
        CORBA_Environment *ev);




CORBA_char *ORBit_small_get_type_id (CORBA_Object object,
         CORBA_Environment *ev);
ORBit_IInterface *ORBit_small_get_iinterface (CORBA_Object opt_object,
                const CORBA_char *repo_id,
         CORBA_Environment *ev);
gboolean ORBit_small_load_typelib (const char *libname);
CORBA_sequence_CORBA_TypeCode *
                  ORBit_small_get_types (const char *name);
CORBA_sequence_ORBit_IInterface *
                  ORBit_small_get_iinterfaces (const char *name);

typedef struct _ORBitAsyncQueueEntry ORBitAsyncQueueEntry;

typedef void (*ORBitAsyncInvokeFunc) (CORBA_Object object,
          ORBit_IMethod *m_data,
          ORBitAsyncQueueEntry *aqe,
          gpointer user_data,
          CORBA_Environment *ev);


void ORBit_small_invoke_async (CORBA_Object obj,
          ORBit_IMethod *m_data,
          ORBitAsyncInvokeFunc fn,
          gpointer user_data,
          gpointer *args,
          CORBA_Context ctx,
          CORBA_Environment *ev);

void ORBit_small_demarshal_async (ORBitAsyncQueueEntry *aqe,
          gpointer ret,
          gpointer *args,
          CORBA_Environment *ev);





typedef CORBA_sequence_CORBA_Object CORBA_sequence_PortableServer_POA;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_PortableServer_POA_struct;
typedef CORBA_sequence_PortableServer_POA PortableServer_POAList;
extern

const struct CORBA_TypeCode_struct TC_PortableServer_POAList_struct;
typedef CORBA_OctetSeq PortableServer_ObjectId;
extern

const struct CORBA_TypeCode_struct TC_PortableServer_ObjectId_struct;
typedef struct PortableServer_ForwardRequest_type PortableServer_ForwardRequest;
struct PortableServer_ForwardRequest_type {
CORBA_Object forward_reference;
};
extern

const struct CORBA_TypeCode_struct TC_PortableServer_ForwardRequest_struct;
typedef enum {
  PortableServer_ORB_CTRL_MODEL,
  PortableServer_SINGLE_THREAD_MODEL,
  PortableServer_MAIN_THREAD_MODEL
} PortableServer_ThreadPolicyValue;
extern

const struct CORBA_TypeCode_struct TC_PortableServer_ThreadPolicyValue_struct;






typedef struct PortableServer_ThreadPolicy_type *PortableServer_ThreadPolicy;






typedef enum {
  PortableServer_TRANSIENT,
  PortableServer_PERSISTENT
} PortableServer_LifespanPolicyValue;
extern

const struct CORBA_TypeCode_struct TC_PortableServer_LifespanPolicyValue_struct;






typedef struct PortableServer_LifespanPolicy_type *PortableServer_LifespanPolicy;






typedef enum {
  PortableServer_UNIQUE_ID,
  PortableServer_MULTIPLE_ID
} PortableServer_IdUniquenessPolicyValue;
extern

const struct CORBA_TypeCode_struct TC_PortableServer_IdUniquenessPolicyValue_struct;






typedef struct PortableServer_IdUniquenessPolicy_type *PortableServer_IdUniquenessPolicy;






typedef enum {
  PortableServer_USER_ID,
  PortableServer_SYSTEM_ID
} PortableServer_IdAssignmentPolicyValue;
extern

const struct CORBA_TypeCode_struct TC_PortableServer_IdAssignmentPolicyValue_struct;






typedef struct PortableServer_IdAssignmentPolicy_type *PortableServer_IdAssignmentPolicy;






typedef enum {
  PortableServer_IMPLICIT_ACTIVATION,
  PortableServer_NO_IMPLICIT_ACTIVATION
} PortableServer_ImplicitActivationPolicyValue;
extern

const struct CORBA_TypeCode_struct TC_PortableServer_ImplicitActivationPolicyValue_struct;






typedef struct PortableServer_ImplicitActivationPolicy_type *PortableServer_ImplicitActivationPolicy;






typedef enum {
  PortableServer_RETAIN,
  PortableServer_NON_RETAIN
} PortableServer_ServantRetentionPolicyValue;
extern

const struct CORBA_TypeCode_struct TC_PortableServer_ServantRetentionPolicyValue_struct;






typedef struct PortableServer_ServantRetentionPolicy_type *PortableServer_ServantRetentionPolicy;






typedef enum {
  PortableServer_USE_ACTIVE_OBJECT_MAP_ONLY,
  PortableServer_USE_DEFAULT_SERVANT,
  PortableServer_USE_SERVANT_MANAGER
} PortableServer_RequestProcessingPolicyValue;
extern

const struct CORBA_TypeCode_struct TC_PortableServer_RequestProcessingPolicyValue_struct;






typedef struct PortableServer_RequestProcessingPolicy_type *PortableServer_RequestProcessingPolicy;







typedef struct PortableServer_POAManager_type *PortableServer_POAManager;
typedef struct PortableServer_POAManager_AdapterInactive_type PortableServer_POAManager_AdapterInactive;
struct PortableServer_POAManager_AdapterInactive_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_PortableServer_POAManager_AdapterInactive_struct;







typedef enum {
  PortableServer_POAManager_HOLDING,
  PortableServer_POAManager_ACTIVE,
  PortableServer_POAManager_DISCARDING,
  PortableServer_POAManager_INACTIVE
} PortableServer_POAManager_State;
extern

const struct CORBA_TypeCode_struct TC_PortableServer_POAManager_State_struct;






typedef struct PortableServer_POAManagerFactory_type *PortableServer_POAManagerFactory;
typedef CORBA_sequence_CORBA_Object CORBA_sequence_PortableServer_POAManager;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_PortableServer_POAManager_struct;
typedef CORBA_sequence_PortableServer_POAManager PortableServer_POAManagerFactory_POAManagerSeq;
extern

const struct CORBA_TypeCode_struct TC_PortableServer_POAManagerFactory_POAManagerSeq_struct;
typedef struct PortableServer_POAManagerFactory_ManagerAlreadyExists_type PortableServer_POAManagerFactory_ManagerAlreadyExists;
struct PortableServer_POAManagerFactory_ManagerAlreadyExists_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_PortableServer_POAManagerFactory_ManagerAlreadyExists_struct;
typedef struct PortableServer_AdapterActivator_type *PortableServer_AdapterActivator;







typedef struct PortableServer_ServantManager_type *PortableServer_ServantManager;







typedef struct PortableServer_ServantActivator_type *PortableServer_ServantActivator;







typedef struct PortableServer_ServantLocator_type *PortableServer_ServantLocator;






typedef struct PortableServer_ServantLocator_Cookie_type *PortableServer_ServantLocator_Cookie;
typedef struct PortableServer_POA_AdapterAlreadyExists_type PortableServer_POA_AdapterAlreadyExists;
struct PortableServer_POA_AdapterAlreadyExists_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_PortableServer_POA_AdapterAlreadyExists_struct;
typedef struct PortableServer_POA_AdapterNonExistent_type PortableServer_POA_AdapterNonExistent;
struct PortableServer_POA_AdapterNonExistent_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_PortableServer_POA_AdapterNonExistent_struct;
typedef struct PortableServer_POA_InvalidPolicy_type PortableServer_POA_InvalidPolicy;
struct PortableServer_POA_InvalidPolicy_type {
CORBA_unsigned_short index;
};
extern

const struct CORBA_TypeCode_struct TC_PortableServer_POA_InvalidPolicy_struct;
typedef struct PortableServer_POA_NoServant_type PortableServer_POA_NoServant;
struct PortableServer_POA_NoServant_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_PortableServer_POA_NoServant_struct;
typedef struct PortableServer_POA_ObjectAlreadyActive_type PortableServer_POA_ObjectAlreadyActive;
struct PortableServer_POA_ObjectAlreadyActive_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_PortableServer_POA_ObjectAlreadyActive_struct;
typedef struct PortableServer_POA_ObjectNotActive_type PortableServer_POA_ObjectNotActive;
struct PortableServer_POA_ObjectNotActive_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_PortableServer_POA_ObjectNotActive_struct;
typedef struct PortableServer_POA_ServantAlreadyActive_type PortableServer_POA_ServantAlreadyActive;
struct PortableServer_POA_ServantAlreadyActive_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_PortableServer_POA_ServantAlreadyActive_struct;
typedef struct PortableServer_POA_ServantNotActive_type PortableServer_POA_ServantNotActive;
struct PortableServer_POA_ServantNotActive_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_PortableServer_POA_ServantNotActive_struct;
typedef struct PortableServer_POA_WrongAdapter_type PortableServer_POA_WrongAdapter;
struct PortableServer_POA_WrongAdapter_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_PortableServer_POA_WrongAdapter_struct;
typedef struct PortableServer_POA_WrongPolicy_type PortableServer_POA_WrongPolicy;
struct PortableServer_POA_WrongPolicy_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_PortableServer_POA_WrongPolicy_struct;
typedef struct PortableServer_Current_type *PortableServer_Current;
typedef struct PortableServer_Current_NoContext_type PortableServer_Current_NoContext;
struct PortableServer_Current_NoContext_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_PortableServer_Current_NoContext_struct;
PortableServer_ThreadPolicyValue PortableServer_ThreadPolicy__get_value(PortableServer_ThreadPolicy _obj, CORBA_Environment *ev);



PortableServer_LifespanPolicyValue PortableServer_LifespanPolicy__get_value(PortableServer_LifespanPolicy _obj, CORBA_Environment *ev);



PortableServer_IdUniquenessPolicyValue PortableServer_IdUniquenessPolicy__get_value(PortableServer_IdUniquenessPolicy _obj, CORBA_Environment *ev);



PortableServer_IdAssignmentPolicyValue PortableServer_IdAssignmentPolicy__get_value(PortableServer_IdAssignmentPolicy _obj, CORBA_Environment *ev);



PortableServer_ImplicitActivationPolicyValue PortableServer_ImplicitActivationPolicy__get_value(PortableServer_ImplicitActivationPolicy _obj, CORBA_Environment *ev);



PortableServer_ServantRetentionPolicyValue PortableServer_ServantRetentionPolicy__get_value(PortableServer_ServantRetentionPolicy _obj, CORBA_Environment *ev);



PortableServer_RequestProcessingPolicyValue PortableServer_RequestProcessingPolicy__get_value(PortableServer_RequestProcessingPolicy _obj, CORBA_Environment *ev);
void PortableServer_POAManager_activate(PortableServer_POAManager _obj, CORBA_Environment *ev);
void PortableServer_POAManager_hold_requests(PortableServer_POAManager _obj, const CORBA_boolean wait_for_completion, CORBA_Environment *ev);
void PortableServer_POAManager_discard_requests(PortableServer_POAManager _obj, const CORBA_boolean wait_for_completion, CORBA_Environment *ev);
void PortableServer_POAManager_deactivate(PortableServer_POAManager _obj, const CORBA_boolean etherealize_objects, const CORBA_boolean wait_for_completion, CORBA_Environment *ev);
PortableServer_POAManager_State PortableServer_POAManager_get_state(PortableServer_POAManager _obj, CORBA_Environment *ev);
CORBA_string PortableServer_POAManager_get_id(PortableServer_POAManager _obj, CORBA_Environment *ev);
PortableServer_POAManager PortableServer_POAManagerFactory_create_POAManager(PortableServer_POAManagerFactory _obj, const CORBA_char * id, const CORBA_PolicyList* policies, CORBA_Environment *ev);
PortableServer_POAManagerFactory_POAManagerSeq* PortableServer_POAManagerFactory_list(PortableServer_POAManagerFactory _obj, CORBA_Environment *ev);
PortableServer_POAManager PortableServer_POAManagerFactory_find(PortableServer_POAManagerFactory _obj, const CORBA_char * id, CORBA_Environment *ev);
CORBA_boolean PortableServer_AdapterActivator_unknown_adapter(PortableServer_AdapterActivator _obj, const PortableServer_POA parent, const CORBA_char * name, CORBA_Environment *ev);
PortableServer_Servant PortableServer_ServantActivator_incarnate(PortableServer_ServantActivator _obj, const PortableServer_ObjectId* oid, const PortableServer_POA adapter, CORBA_Environment *ev);
void PortableServer_ServantActivator_etherealize(PortableServer_ServantActivator _obj, const PortableServer_ObjectId* oid, const PortableServer_POA adapter, const PortableServer_Servant serv, const CORBA_boolean cleanup_in_progress, const CORBA_boolean remaining_activations, CORBA_Environment *ev);
PortableServer_Servant PortableServer_ServantLocator_preinvoke(PortableServer_ServantLocator _obj, const PortableServer_ObjectId* oid, const PortableServer_POA adapter, const CORBA_char * operation, PortableServer_ServantLocator_Cookie the_cookie, CORBA_Environment *ev);
void PortableServer_ServantLocator_postinvoke(PortableServer_ServantLocator _obj, const PortableServer_ObjectId* oid, const PortableServer_POA adapter, const CORBA_char * operation, const PortableServer_ServantLocator_Cookie the_cookie, const PortableServer_Servant the_servant, CORBA_Environment *ev);
PortableServer_POA PortableServer_POA_create_POA(PortableServer_POA _obj, const CORBA_char * adapter_name, const PortableServer_POAManager a_POAManager, const CORBA_PolicyList* policies, CORBA_Environment *ev);
PortableServer_POA PortableServer_POA_find_POA(PortableServer_POA _obj, const CORBA_char * adapter_name, const CORBA_boolean activate_it, CORBA_Environment *ev);
void PortableServer_POA_destroy(PortableServer_POA _obj, const CORBA_boolean etherealize_objects, const CORBA_boolean wait_for_completion, CORBA_Environment *ev);
PortableServer_ThreadPolicy PortableServer_POA_create_thread_policy(PortableServer_POA _obj, const PortableServer_ThreadPolicyValue value, CORBA_Environment *ev);
PortableServer_LifespanPolicy PortableServer_POA_create_lifespan_policy(PortableServer_POA _obj, const PortableServer_LifespanPolicyValue value, CORBA_Environment *ev);
PortableServer_IdUniquenessPolicy PortableServer_POA_create_id_uniqueness_policy(PortableServer_POA _obj, const PortableServer_IdUniquenessPolicyValue value, CORBA_Environment *ev);
PortableServer_IdAssignmentPolicy PortableServer_POA_create_id_assignment_policy(PortableServer_POA _obj, const PortableServer_IdAssignmentPolicyValue value, CORBA_Environment *ev);
PortableServer_ImplicitActivationPolicy PortableServer_POA_create_implicit_activation_policy(PortableServer_POA _obj, const PortableServer_ImplicitActivationPolicyValue value, CORBA_Environment *ev);
PortableServer_ServantRetentionPolicy PortableServer_POA_create_servant_retention_policy(PortableServer_POA _obj, const PortableServer_ServantRetentionPolicyValue value, CORBA_Environment *ev);
PortableServer_RequestProcessingPolicy PortableServer_POA_create_request_processing_policy(PortableServer_POA _obj, const PortableServer_RequestProcessingPolicyValue value, CORBA_Environment *ev);
CORBA_string PortableServer_POA__get_the_name(PortableServer_POA _obj, CORBA_Environment *ev);
PortableServer_POA PortableServer_POA__get_the_parent(PortableServer_POA _obj, CORBA_Environment *ev);
PortableServer_POAList* PortableServer_POA__get_the_children(PortableServer_POA _obj, CORBA_Environment *ev);
PortableServer_POAManager PortableServer_POA__get_the_POAManager(PortableServer_POA _obj, CORBA_Environment *ev);
PortableServer_AdapterActivator PortableServer_POA__get_the_activator(PortableServer_POA _obj, CORBA_Environment *ev);
void PortableServer_POA__set_the_activator(PortableServer_POA _obj, const PortableServer_AdapterActivator value, CORBA_Environment *ev);
PortableServer_ServantManager PortableServer_POA_get_servant_manager(PortableServer_POA _obj, CORBA_Environment *ev);
void PortableServer_POA_set_servant_manager(PortableServer_POA _obj, const PortableServer_ServantManager imgr, CORBA_Environment *ev);
PortableServer_Servant PortableServer_POA_get_servant(PortableServer_POA _obj, CORBA_Environment *ev);
void PortableServer_POA_set_servant(PortableServer_POA _obj, const PortableServer_Servant p_servant, CORBA_Environment *ev);
PortableServer_ObjectId* PortableServer_POA_activate_object(PortableServer_POA _obj, const PortableServer_Servant p_servant, CORBA_Environment *ev);
void PortableServer_POA_activate_object_with_id(PortableServer_POA _obj, const PortableServer_ObjectId* id, const PortableServer_Servant p_servant, CORBA_Environment *ev);
void PortableServer_POA_deactivate_object(PortableServer_POA _obj, const PortableServer_ObjectId* oid, CORBA_Environment *ev);
CORBA_Object PortableServer_POA_create_reference(PortableServer_POA _obj, const CORBA_char * intf, CORBA_Environment *ev);
CORBA_Object PortableServer_POA_create_reference_with_id(PortableServer_POA _obj, const PortableServer_ObjectId* oid, const CORBA_char * intf, CORBA_Environment *ev);
PortableServer_ObjectId* PortableServer_POA_servant_to_id(PortableServer_POA _obj, const PortableServer_Servant p_servant, CORBA_Environment *ev);
CORBA_Object PortableServer_POA_servant_to_reference(PortableServer_POA _obj, const PortableServer_Servant p_servant, CORBA_Environment *ev);
PortableServer_Servant PortableServer_POA_reference_to_servant(PortableServer_POA _obj, const CORBA_Object reference, CORBA_Environment *ev);
PortableServer_ObjectId* PortableServer_POA_reference_to_id(PortableServer_POA _obj, const CORBA_Object reference, CORBA_Environment *ev);
PortableServer_Servant PortableServer_POA_id_to_servant(PortableServer_POA _obj, const PortableServer_ObjectId* oid, CORBA_Environment *ev);
CORBA_Object PortableServer_POA_id_to_reference(PortableServer_POA _obj, const PortableServer_ObjectId* oid, CORBA_Environment *ev);
CORBA_OctetSeq* PortableServer_POA__get_id(PortableServer_POA _obj, CORBA_Environment *ev);
PortableServer_POAManagerFactory PortableServer_POA__get_the_POAManagerFactory(PortableServer_POA _obj, CORBA_Environment *ev);
PortableServer_POA PortableServer_Current_get_POA(PortableServer_Current _obj, CORBA_Environment *ev);
PortableServer_ObjectId* PortableServer_Current_get_object_id(PortableServer_Current _obj, CORBA_Environment *ev);
CORBA_Object PortableServer_Current_get_reference(PortableServer_Current _obj, CORBA_Environment *ev);
PortableServer_Servant PortableServer_Current_get_servant(PortableServer_Current _obj, CORBA_Environment *ev);











typedef enum {
 ORBIT_THREAD_HINT_NONE = 0,
 ORBIT_THREAD_HINT_PER_OBJECT,
 ORBIT_THREAD_HINT_PER_REQUEST,
 ORBIT_THREAD_HINT_PER_POA,
 ORBIT_THREAD_HINT_PER_CONNECTION,
 ORBIT_THREAD_HINT_ONEWAY_AT_IDLE,
 ORBIT_THREAD_HINT_ALL_AT_IDLE,
 ORBIT_THREAD_HINT_ON_CONTEXT
} ORBitThreadHint;

typedef struct ORBit_ObjectAdaptor_type *ORBit_ObjectAdaptor;

void ORBit_ObjectAdaptor_set_thread_hint (ORBit_ObjectAdaptor adaptor,
            ORBitThreadHint thread_hint,
            ...);
void ORBit_ObjectAdaptor_set_thread_hintv (ORBit_ObjectAdaptor adaptor,
            ORBitThreadHint thread_hint,
            va_list args);
ORBitThreadHint ORBit_ObjectAdaptor_get_thread_hint (ORBit_ObjectAdaptor adaptor);

void ORBit_ObjectAdaptor_object_bind_to_current_thread (CORBA_Object obj);




void ORBit_handle_locate_request (CORBA_ORB orb,
           GIOPRecvBuffer *recv_buffer);

void ORBit_handle_request (CORBA_ORB orb,
           GIOPRecvBuffer *recv_buffer);

void ORBit_small_handle_request (ORBit_OAObject adaptor_obj,
           CORBA_Identifier opname,
           gpointer ret,
           gpointer *args,
           CORBA_Context ctx,
           GIOPRecvBuffer *recv_buffer,
           CORBA_Environment *ev);

gboolean ORBit_OAObject_is_active (ORBit_OAObject adaptor_obj);

ORBit_ObjectKey *ORBit_OAObject_object_to_objkey (ORBit_OAObject adaptor_obj);

void ORBit_OAObject_invoke (ORBit_OAObject adaptor_obj,
           gpointer ret,
           gpointer *args,
           CORBA_Context ctx,
           gpointer data,
           CORBA_Environment *ev);




typedef gboolean (*ORBitStateCheckFunc) (ORBit_OAObject adaptor_obj);

typedef ORBit_ObjectKey *(*ORBitKeyGenFunc) (ORBit_OAObject adaptor_obj);

typedef void (*ORBitInvokeFunc) (ORBit_OAObject adaptor_obj,
          gpointer ret,
          gpointer *args,
          CORBA_Context ctx,
          gpointer data,
          CORBA_Environment *ev);

typedef void (*ORBitReqFunc) (ORBit_OAObject adaptor_obj,
          CORBA_Identifier opname,
          gpointer ret,
          gpointer *args,
          CORBA_Context ctx,
          GIOPRecvBuffer *recv_buffer,
          CORBA_Environment *ev);

typedef enum {
 ORBIT_ADAPTOR_POA = 1 << 0
} ORBit_Adaptor_type;

struct ORBit_OAObject_Interface_type {
 ORBit_Adaptor_type adaptor_type;

 ORBitStateCheckFunc is_active;
 ORBitKeyGenFunc object_to_objkey;
 ORBitInvokeFunc invoke;
 ORBitReqFunc handle_request;
};

typedef struct ORBit_OAObject_Interface_type *ORBit_OAObject_Interface;

struct ORBit_OAObject_type {
 struct ORBit_RootObject_struct parent;

 CORBA_Object objref;

 ORBit_OAObject_Interface interface;
};





typedef CORBA_sequence_CORBA_octet ORBit_AdaptorKey;

typedef void (*ORBitReqHandlerFunc) (ORBit_ObjectAdaptor adaptor,
         GIOPRecvBuffer *recv_buffer,
         ORBit_ObjectKey *objkey);

struct ORBit_ObjectAdaptor_type {
 struct ORBit_RootObject_struct parent;

 GMutex *lock;

 ORBitReqHandlerFunc handle_request;

 ORBit_AdaptorKey adaptor_key;

 ORBitThreadHint thread_hint;

 GMainContext *context;
};

int ORBit_adaptor_setup (ORBit_ObjectAdaptor adaptor, CORBA_ORB orb);









typedef struct {
 void (*dummy_padding) (void);
 ORBit_impl_finder impl_finder;
 const char *class_name;
 CORBA_unsigned_long *class_id;
 ORBit_VepvIdx *vepvmap;
 ORBit_IInterface *idata;
} PortableServer_ClassInfo;





struct ORBit_POAObject_type {
 struct ORBit_OAObject_type base;

 PortableServer_Servant servant;
 PortableServer_POA poa;
 PortableServer_ObjectId *object_id;

 ORBit_VepvIdx *vepvmap_cache;

 guint16 life_flags;
 guint16 use_cnt;

 ORBit_POAObject next;
};
void
ORBit_c_stub_invoke (CORBA_Object obj,
       ORBit_IMethods *methods,
       glong method_index,
       gpointer ret,
       gpointer args,
       CORBA_Context ctx,
       CORBA_Environment *ev,
       glong class_id,
       glong method_offset,
       ORBitSmallSkeleton skel_impl);




typedef struct {
 void *_private;
} POA_PortableServer_ServantManager__epv;

typedef struct {
 void *_private;

 PortableServer_Servant(*incarnate) (PortableServer_Servant _servant,
         const PortableServer_ObjectId *
         oid,
         const PortableServer_POA adapter,
         CORBA_Environment * ev);
 void (*etherealize) (PortableServer_Servant _servant,
        const PortableServer_ObjectId * oid,
        const PortableServer_POA adapter,
        const PortableServer_Servant serv,
        const CORBA_boolean cleanup_in_progress,
        const CORBA_boolean remaining_activations,
        CORBA_Environment * ev);
} POA_PortableServer_ServantActivator__epv;
typedef struct {
 PortableServer_ServantBase__epv *_base_epv;
 POA_PortableServer_ServantManager__epv
  *PortableServer_ServantManager_epv;
 POA_PortableServer_ServantActivator__epv
  *PortableServer_ServantActivator_epv;
} POA_PortableServer_ServantActivator__vepv;

typedef struct {
 void *_private;
 POA_PortableServer_ServantActivator__vepv *vepv;
} POA_PortableServer_ServantActivator;

typedef struct {
 void *_private;

 PortableServer_Servant(*preinvoke) (PortableServer_Servant _servant,
         const PortableServer_ObjectId *
         oid,
         const PortableServer_POA adapter,
         const CORBA_Identifier operation,
         PortableServer_ServantLocator_Cookie
         * the_cookie,
         CORBA_Environment * ev);
 void (*postinvoke) (PortableServer_Servant _servant,
       const PortableServer_ObjectId * oid,
       const PortableServer_POA adapter,
       const CORBA_Identifier operation,
       const PortableServer_ServantLocator_Cookie
       the_cookie,
       const PortableServer_Servant the_servant,
       CORBA_Environment * ev);
} POA_PortableServer_ServantLocator__epv;
typedef struct {
 PortableServer_ServantBase__epv *_base_epv;
 POA_PortableServer_ServantManager__epv
  *PortableServer_ServantManager_epv;
 POA_PortableServer_ServantLocator__epv
  *PortableServer_ServantLocator_epv;
} POA_PortableServer_ServantLocator__vepv;
typedef struct {
 void *_private;
 POA_PortableServer_ServantLocator__vepv *vepv;
} POA_PortableServer_ServantLocator;










struct PortableServer_POAManager_type {
 struct ORBit_RootObject_struct parent;

 GSList *poa_collection;
 PortableServer_POAManager_State state;
 CORBA_ORB orb;
};

struct PortableServer_POA_type {
 struct ORBit_ObjectAdaptor_type base;

 guint16 use_cnt;
 guint16 life_flags;
 int poa_id;
 int next_sysid;
 char *name;
 CORBA_ORB orb;
 PortableServer_POA parent_poa;
 PortableServer_POAManager poa_manager;
 PortableServer_AdapterActivator the_activator;
 PortableServer_ServantManager servant_manager;
 PortableServer_Servant default_servant;

 GHashTable *oid_to_obj_map;
 CORBA_unsigned_long next_id;

 GSList *held_requests;
 GHashTable *child_poas;

 PortableServer_ThreadPolicyValue p_thread;
 PortableServer_LifespanPolicyValue p_lifespan;
 PortableServer_IdUniquenessPolicyValue p_id_uniqueness;
 PortableServer_IdAssignmentPolicyValue p_id_assignment;
 PortableServer_ImplicitActivationPolicyValue p_implicit_activation;
 PortableServer_ServantRetentionPolicyValue p_servant_retention;
 PortableServer_RequestProcessingPolicyValue p_request_processing;
};













struct PortableServer_Current_type {
        struct ORBit_RootObject_struct parent;

        CORBA_ORB orb;
};





void PortableServer_ServantBase__init (PortableServer_Servant servant,
      CORBA_Environment *ev);
void PortableServer_ServantBase__fini (PortableServer_Servant servant,
      CORBA_Environment *ev);

void PortableServer_RefCountServantBase__init (PortableServer_Servant servant,
      CORBA_Environment *ev);
void PortableServer_RefCountServantBase__fini (PortableServer_Servant servant,
      CORBA_Environment *ev);

void PortableServer_ServantBase__add_ref (PortableServer_Servant servant,
      CORBA_Environment *ev);
void PortableServer_ServantBase__remove_ref (PortableServer_Servant servant,
      CORBA_Environment *ev);

void PortableServer_RefCountServantBase__add_ref (PortableServer_Servant servant,
           CORBA_Environment *ev);
void PortableServer_RefCountServantBase__remove_ref (PortableServer_Servant servant,
           CORBA_Environment *ev);

PortableServer_POA
     PortableServer_ServantBase__default_POA (PortableServer_Servant servant,
      CORBA_Environment *ev);
CORBA_InterfaceDef
     PortableServer_ServantBase__get_interface (PortableServer_Servant servant,
      CORBA_Environment *ev);
CORBA_boolean
     PortableServer_ServantBase__is_a (PortableServer_Servant servant,
      const CORBA_char *logical_type_id,
      CORBA_Environment *ev);
PortableServer_ObjectId *PortableServer_string_to_ObjectId(CORBA_char *str,
                                                           CORBA_Environment *nv);

PortableServer_ObjectId *PortableServer_wstring_to_ObjectId(CORBA_wchar *str,
                                                            CORBA_Environment *ev);

CORBA_char *PortableServer_ObjectId_to_string(PortableServer_ObjectId *oid,
                                              CORBA_Environment *ev);

CORBA_wchar *PortableServer_ObjectId_to_wstring(PortableServer_ObjectId *oid,
                                                CORBA_Environment *ev);


PortableServer_POA ORBit_POA_new_from (CORBA_ORB orb,
           PortableServer_POA parent,
           const CORBA_char *adaptor_name,
           const CORBA_PolicyList *opt_policies,
           CORBA_Environment *ev);



void ORBit_skel_class_register (PortableServer_ClassInfo *ci,
    PortableServer_ServantBase *servant,
    void (*opt_finalize) (PortableServer_Servant,
            CORBA_Environment *),
    CORBA_unsigned_long class_offset,
    CORBA_unsigned_long first_parent_id,
    ...);


void ORBit_classinfo_register (PortableServer_ClassInfo *ci);
PortableServer_ClassInfo *ORBit_classinfo_lookup (const char *type_id);
void ORBit_POAObject_post_invoke (ORBit_POAObject obj);
gboolean ORBit_poa_allow_cross_thread_call (ORBit_POAObject pobj,
          ORBit_IMethodFlag method_flags);
void ORBit_recv_buffer_return_sys_exception (GIOPRecvBuffer *buf,
          CORBA_Environment *ev);
void ORBit_poa_init (void);




typedef struct DynamicAny_DynAny_type *DynamicAny_DynAny;
typedef struct DynamicAny_DynAny_InvalidValue_type DynamicAny_DynAny_InvalidValue;
struct DynamicAny_DynAny_InvalidValue_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_DynamicAny_DynAny_InvalidValue_struct;
typedef struct DynamicAny_DynAny_TypeMismatch_type DynamicAny_DynAny_TypeMismatch;
struct DynamicAny_DynAny_TypeMismatch_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_DynamicAny_DynAny_TypeMismatch_struct;
typedef struct DynamicAny_DynFixed_type *DynamicAny_DynFixed;







typedef struct DynamicAny_DynEnum_type *DynamicAny_DynEnum;






typedef CORBA_string DynamicAny_FieldName;
extern

const struct CORBA_TypeCode_struct TC_DynamicAny_FieldName_struct;







typedef struct DynamicAny_NameValuePair_type DynamicAny_NameValuePair;
struct DynamicAny_NameValuePair_type {
DynamicAny_FieldName id;
CORBA_any value;
};
extern

const struct CORBA_TypeCode_struct TC_DynamicAny_NameValuePair_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; DynamicAny_NameValuePair* _buffer; CORBA_boolean _release; } CORBA_sequence_DynamicAny_NameValuePair;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_DynamicAny_NameValuePair_struct;
typedef CORBA_sequence_DynamicAny_NameValuePair DynamicAny_NameValuePairSeq;
extern

const struct CORBA_TypeCode_struct TC_DynamicAny_NameValuePairSeq_struct;
typedef struct DynamicAny_NameDynAnyPair_type DynamicAny_NameDynAnyPair;
struct DynamicAny_NameDynAnyPair_type {
DynamicAny_FieldName id;
DynamicAny_DynAny value;
};
extern

const struct CORBA_TypeCode_struct TC_DynamicAny_NameDynAnyPair_struct;
typedef struct { CORBA_unsigned_long _maximum, _length; DynamicAny_NameDynAnyPair* _buffer; CORBA_boolean _release; } CORBA_sequence_DynamicAny_NameDynAnyPair;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_DynamicAny_NameDynAnyPair_struct;
typedef CORBA_sequence_DynamicAny_NameDynAnyPair DynamicAny_NameDynAnyPairSeq;
extern

const struct CORBA_TypeCode_struct TC_DynamicAny_NameDynAnyPairSeq_struct;
typedef struct DynamicAny_DynStruct_type *DynamicAny_DynStruct;







typedef struct DynamicAny_DynUnion_type *DynamicAny_DynUnion;
typedef CORBA_sequence_CORBA_any DynamicAny_AnySeq;
extern

const struct CORBA_TypeCode_struct TC_DynamicAny_AnySeq_struct;
typedef CORBA_sequence_CORBA_Object CORBA_sequence_DynamicAny_DynAny;
extern

const struct CORBA_TypeCode_struct TC_CORBA_sequence_DynamicAny_DynAny_struct;
typedef CORBA_sequence_DynamicAny_DynAny DynamicAny_DynAnySeq;
extern

const struct CORBA_TypeCode_struct TC_DynamicAny_DynAnySeq_struct;
typedef struct DynamicAny_DynSequence_type *DynamicAny_DynSequence;







typedef struct DynamicAny_DynArray_type *DynamicAny_DynArray;







typedef struct DynamicAny_DynValueCommon_type *DynamicAny_DynValueCommon;







typedef struct DynamicAny_DynValue_type *DynamicAny_DynValue;







typedef struct DynamicAny_DynValueBox_type *DynamicAny_DynValueBox;
typedef struct DynamicAny_MustTruncate_type DynamicAny_MustTruncate;
struct DynamicAny_MustTruncate_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_DynamicAny_MustTruncate_struct;
typedef struct DynamicAny_DynAnyFactory_type *DynamicAny_DynAnyFactory;
typedef struct DynamicAny_DynAnyFactory_InconsistentTypeCode_type DynamicAny_DynAnyFactory_InconsistentTypeCode;
struct DynamicAny_DynAnyFactory_InconsistentTypeCode_type {
int dummy;
};
extern

const struct CORBA_TypeCode_struct TC_DynamicAny_DynAnyFactory_InconsistentTypeCode_struct;







CORBA_TypeCode DynamicAny_DynAny_type(DynamicAny_DynAny _obj, CORBA_Environment *ev);
void DynamicAny_DynAny_assign(DynamicAny_DynAny _obj, const DynamicAny_DynAny dyn_any, CORBA_Environment *ev);
void DynamicAny_DynAny_from_any(DynamicAny_DynAny _obj, const CORBA_any* value, CORBA_Environment *ev);
CORBA_any* DynamicAny_DynAny_to_any(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_boolean DynamicAny_DynAny_equal(DynamicAny_DynAny _obj, const DynamicAny_DynAny dyn_any, CORBA_Environment *ev);
void DynamicAny_DynAny_destroy(DynamicAny_DynAny _obj, CORBA_Environment *ev);
DynamicAny_DynAny DynamicAny_DynAny_copy(DynamicAny_DynAny _obj, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_boolean(DynamicAny_DynAny _obj, const CORBA_boolean value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_octet(DynamicAny_DynAny _obj, const CORBA_octet value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_char(DynamicAny_DynAny _obj, const CORBA_char value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_short(DynamicAny_DynAny _obj, const CORBA_short value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_ushort(DynamicAny_DynAny _obj, const CORBA_unsigned_short value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_long(DynamicAny_DynAny _obj, const CORBA_long value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_ulong(DynamicAny_DynAny _obj, const CORBA_unsigned_long value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_float(DynamicAny_DynAny _obj, const CORBA_float value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_double(DynamicAny_DynAny _obj, const CORBA_double value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_string(DynamicAny_DynAny _obj, const CORBA_char * value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_reference(DynamicAny_DynAny _obj, const CORBA_Object value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_typecode(DynamicAny_DynAny _obj, const CORBA_TypeCode value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_longlong(DynamicAny_DynAny _obj, const CORBA_long_long value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_ulonglong(DynamicAny_DynAny _obj, const CORBA_unsigned_long_long value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_longdouble(DynamicAny_DynAny _obj, const CORBA_long_double value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_wchar(DynamicAny_DynAny _obj, const CORBA_wchar value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_wstring(DynamicAny_DynAny _obj, const CORBA_wstring value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_any(DynamicAny_DynAny _obj, const CORBA_any* value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_dyn_any(DynamicAny_DynAny _obj, const DynamicAny_DynAny value, CORBA_Environment *ev);
CORBA_boolean DynamicAny_DynAny_get_boolean(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_octet DynamicAny_DynAny_get_octet(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_char DynamicAny_DynAny_get_char(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_short DynamicAny_DynAny_get_short(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_unsigned_short DynamicAny_DynAny_get_ushort(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_long DynamicAny_DynAny_get_long(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_unsigned_long DynamicAny_DynAny_get_ulong(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_float DynamicAny_DynAny_get_float(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_double DynamicAny_DynAny_get_double(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_string DynamicAny_DynAny_get_string(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_Object DynamicAny_DynAny_get_reference(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_TypeCode DynamicAny_DynAny_get_typecode(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_long_long DynamicAny_DynAny_get_longlong(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_unsigned_long_long DynamicAny_DynAny_get_ulonglong(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_long_double DynamicAny_DynAny_get_longdouble(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_wchar DynamicAny_DynAny_get_wchar(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_wstring DynamicAny_DynAny_get_wstring(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_any* DynamicAny_DynAny_get_any(DynamicAny_DynAny _obj, CORBA_Environment *ev);
DynamicAny_DynAny DynamicAny_DynAny_get_dyn_any(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_boolean DynamicAny_DynAny_seek(DynamicAny_DynAny _obj, const CORBA_long index, CORBA_Environment *ev);
void DynamicAny_DynAny_rewind(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_boolean DynamicAny_DynAny_next(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_unsigned_long DynamicAny_DynAny_component_count(DynamicAny_DynAny _obj, CORBA_Environment *ev);
DynamicAny_DynAny DynamicAny_DynAny_current_component(DynamicAny_DynAny _obj, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_abstract(DynamicAny_DynAny _obj, const CORBA_AbstractBase value, CORBA_Environment *ev);
CORBA_AbstractBase DynamicAny_DynAny_get_abstract(DynamicAny_DynAny _obj, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_boolean_seq(DynamicAny_DynAny _obj, const CORBA_BooleanSeq* value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_octet_seq(DynamicAny_DynAny _obj, const CORBA_OctetSeq* value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_char_seq(DynamicAny_DynAny _obj, const CORBA_CharSeq* value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_short_seq(DynamicAny_DynAny _obj, const CORBA_ShortSeq* value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_ushort_seq(DynamicAny_DynAny _obj, const CORBA_UShortSeq* value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_long_seq(DynamicAny_DynAny _obj, const CORBA_LongSeq* value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_ulong_seq(DynamicAny_DynAny _obj, const CORBA_ULongSeq* value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_float_seq(DynamicAny_DynAny _obj, const CORBA_FloatSeq* value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_double_seq(DynamicAny_DynAny _obj, const CORBA_DoubleSeq* value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_longlong_seq(DynamicAny_DynAny _obj, const CORBA_LongLongSeq* value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_ulonglong_seq(DynamicAny_DynAny _obj, const CORBA_ULongLongSeq* value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_longdouble_seq(DynamicAny_DynAny _obj, const CORBA_LongDoubleSeq* value, CORBA_Environment *ev);
void DynamicAny_DynAny_insert_wchar_seq(DynamicAny_DynAny _obj, const CORBA_WCharSeq* value, CORBA_Environment *ev);
CORBA_BooleanSeq* DynamicAny_DynAny_get_boolean_seq(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_OctetSeq* DynamicAny_DynAny_get_octet_seq(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_CharSeq* DynamicAny_DynAny_get_char_seq(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_ShortSeq* DynamicAny_DynAny_get_short_seq(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_UShortSeq* DynamicAny_DynAny_get_ushort_seq(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_LongSeq* DynamicAny_DynAny_get_long_seq(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_ULongSeq* DynamicAny_DynAny_get_ulong_seq(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_FloatSeq* DynamicAny_DynAny_get_float_seq(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_DoubleSeq* DynamicAny_DynAny_get_double_seq(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_LongLongSeq* DynamicAny_DynAny_get_longlong_seq(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_ULongLongSeq* DynamicAny_DynAny_get_ulonglong_seq(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_LongDoubleSeq* DynamicAny_DynAny_get_longdouble_seq(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_WCharSeq* DynamicAny_DynAny_get_wchar_seq(DynamicAny_DynAny _obj, CORBA_Environment *ev);
CORBA_string DynamicAny_DynFixed_get_value(DynamicAny_DynFixed _obj, CORBA_Environment *ev);
CORBA_boolean DynamicAny_DynFixed_set_value(DynamicAny_DynFixed _obj, const CORBA_char * val, CORBA_Environment *ev);
CORBA_string DynamicAny_DynEnum_get_as_string(DynamicAny_DynEnum _obj, CORBA_Environment *ev);
void DynamicAny_DynEnum_set_as_string(DynamicAny_DynEnum _obj, const CORBA_char * value, CORBA_Environment *ev);
CORBA_unsigned_long DynamicAny_DynEnum_get_as_ulong(DynamicAny_DynEnum _obj, CORBA_Environment *ev);
void DynamicAny_DynEnum_set_as_ulong(DynamicAny_DynEnum _obj, const CORBA_unsigned_long value, CORBA_Environment *ev);
DynamicAny_FieldName DynamicAny_DynStruct_current_member_name(DynamicAny_DynStruct _obj, CORBA_Environment *ev);
CORBA_TCKind DynamicAny_DynStruct_current_member_kind(DynamicAny_DynStruct _obj, CORBA_Environment *ev);
DynamicAny_NameValuePairSeq* DynamicAny_DynStruct_get_members(DynamicAny_DynStruct _obj, CORBA_Environment *ev);
void DynamicAny_DynStruct_set_members(DynamicAny_DynStruct _obj, const DynamicAny_NameValuePairSeq* value, CORBA_Environment *ev);
DynamicAny_NameDynAnyPairSeq* DynamicAny_DynStruct_get_members_as_dyn_any(DynamicAny_DynStruct _obj, CORBA_Environment *ev);
void DynamicAny_DynStruct_set_members_as_dyn_any(DynamicAny_DynStruct _obj, const DynamicAny_NameDynAnyPairSeq* value, CORBA_Environment *ev);
DynamicAny_DynAny DynamicAny_DynUnion_get_discriminator(DynamicAny_DynUnion _obj, CORBA_Environment *ev);
void DynamicAny_DynUnion_set_discriminator(DynamicAny_DynUnion _obj, const DynamicAny_DynAny d, CORBA_Environment *ev);
void DynamicAny_DynUnion_set_to_default_member(DynamicAny_DynUnion _obj, CORBA_Environment *ev);
void DynamicAny_DynUnion_set_to_no_active_member(DynamicAny_DynUnion _obj, CORBA_Environment *ev);
CORBA_boolean DynamicAny_DynUnion_has_no_active_member(DynamicAny_DynUnion _obj, CORBA_Environment *ev);
CORBA_TCKind DynamicAny_DynUnion_discriminator_kind(DynamicAny_DynUnion _obj, CORBA_Environment *ev);
DynamicAny_DynAny DynamicAny_DynUnion_member(DynamicAny_DynUnion _obj, CORBA_Environment *ev);
DynamicAny_FieldName DynamicAny_DynUnion_member_name(DynamicAny_DynUnion _obj, CORBA_Environment *ev);
CORBA_TCKind DynamicAny_DynUnion_member_kind(DynamicAny_DynUnion _obj, CORBA_Environment *ev);
CORBA_unsigned_long DynamicAny_DynSequence_get_length(DynamicAny_DynSequence _obj, CORBA_Environment *ev);
void DynamicAny_DynSequence_set_length(DynamicAny_DynSequence _obj, const CORBA_unsigned_long len, CORBA_Environment *ev);
DynamicAny_AnySeq* DynamicAny_DynSequence_get_elements(DynamicAny_DynSequence _obj, CORBA_Environment *ev);
void DynamicAny_DynSequence_set_elements(DynamicAny_DynSequence _obj, const DynamicAny_AnySeq* value, CORBA_Environment *ev);
DynamicAny_DynAnySeq* DynamicAny_DynSequence_get_elements_as_dyn_any(DynamicAny_DynSequence _obj, CORBA_Environment *ev);
void DynamicAny_DynSequence_set_elements_as_dyn_any(DynamicAny_DynSequence _obj, const DynamicAny_DynAnySeq* value, CORBA_Environment *ev);
DynamicAny_AnySeq* DynamicAny_DynArray_get_elements(DynamicAny_DynArray _obj, CORBA_Environment *ev);
void DynamicAny_DynArray_set_elements(DynamicAny_DynArray _obj, const DynamicAny_AnySeq* value, CORBA_Environment *ev);
DynamicAny_DynAnySeq* DynamicAny_DynArray_get_elements_as_dyn_any(DynamicAny_DynArray _obj, CORBA_Environment *ev);
void DynamicAny_DynArray_set_elements_as_dyn_any(DynamicAny_DynArray _obj, const DynamicAny_DynAnySeq* value, CORBA_Environment *ev);
CORBA_boolean DynamicAny_DynValueCommon_is_null(DynamicAny_DynValueCommon _obj, CORBA_Environment *ev);
void DynamicAny_DynValueCommon_set_to_null(DynamicAny_DynValueCommon _obj, CORBA_Environment *ev);
void DynamicAny_DynValueCommon_set_to_value(DynamicAny_DynValueCommon _obj, CORBA_Environment *ev);
DynamicAny_FieldName DynamicAny_DynValue_current_member_name(DynamicAny_DynValue _obj, CORBA_Environment *ev);
CORBA_TCKind DynamicAny_DynValue_current_member_kind(DynamicAny_DynValue _obj, CORBA_Environment *ev);
DynamicAny_NameValuePairSeq* DynamicAny_DynValue_get_members(DynamicAny_DynValue _obj, CORBA_Environment *ev);
void DynamicAny_DynValue_set_members(DynamicAny_DynValue _obj, const DynamicAny_NameValuePairSeq* value, CORBA_Environment *ev);
DynamicAny_NameDynAnyPairSeq* DynamicAny_DynValue_get_members_as_dyn_any(DynamicAny_DynValue _obj, CORBA_Environment *ev);
void DynamicAny_DynValue_set_members_as_dyn_any(DynamicAny_DynValue _obj, const DynamicAny_NameDynAnyPairSeq* value, CORBA_Environment *ev);
CORBA_any* DynamicAny_DynValueBox_get_boxed_value(DynamicAny_DynValueBox _obj, CORBA_Environment *ev);
void DynamicAny_DynValueBox_set_boxed_value(DynamicAny_DynValueBox _obj, const CORBA_any* boxed, CORBA_Environment *ev);
DynamicAny_DynAny DynamicAny_DynValueBox_get_boxed_value_as_dyn_any(DynamicAny_DynValueBox _obj, CORBA_Environment *ev);
void DynamicAny_DynValueBox_set_boxed_value_as_dyn_any(DynamicAny_DynValueBox _obj, const DynamicAny_DynAny boxed, CORBA_Environment *ev);
DynamicAny_DynAny DynamicAny_DynAnyFactory_create_dyn_any(DynamicAny_DynAnyFactory _obj, const CORBA_any* value, CORBA_Environment *ev);
DynamicAny_DynAny DynamicAny_DynAnyFactory_create_dyn_any_from_type_code(DynamicAny_DynAnyFactory _obj, const CORBA_TypeCode type, CORBA_Environment *ev);
DynamicAny_DynAny DynamicAny_DynAnyFactory_create_dyn_any_without_truncation(DynamicAny_DynAnyFactory _obj, const CORBA_any* value, CORBA_Environment *ev);
DynamicAny_DynAnySeq* DynamicAny_DynAnyFactory_create_multiple_dyn_anys(DynamicAny_DynAnyFactory _obj, const DynamicAny_AnySeq* values, const CORBA_boolean allow_truncate, CORBA_Environment *ev);
DynamicAny_AnySeq* DynamicAny_DynAnyFactory_create_multiple_anys(DynamicAny_DynAnyFactory _obj, const DynamicAny_DynAnySeq* values, CORBA_Environment *ev);





gpointer ORBit_dynany_new_default (const CORBA_TypeCode tc);







extern const char *orbit_version;
extern unsigned int orbit_major_version;
extern unsigned int orbit_minor_version;
extern unsigned int orbit_micro_version;





struct _ORBitPolicy {
 struct ORBit_RootObject_struct parent;

 GPtrArray *allowed_poas;
};

gboolean ORBit_policy_validate (ORBitPolicy *policy);





typedef enum {
 ORBIT_DEBUG_NONE = 0,
 ORBIT_DEBUG_TRACES = 1 << 0,
 ORBIT_DEBUG_INPROC_TRACES = 1 << 1,
 ORBIT_DEBUG_TIMINGS = 1 << 2,
 ORBIT_DEBUG_TYPES = 1 << 3,
 ORBIT_DEBUG_MESSAGES = 1 << 4,
 ORBIT_DEBUG_ERRORS = 1 << 5,
 ORBIT_DEBUG_OBJECTS = 1 << 6,
 ORBIT_DEBUG_GIOP = 1 << 7,
 ORBIT_DEBUG_REFS = 1 << 8,
 ORBIT_DEBUG_FORCE_THREADED = 1 << 9
} OrbitDebugFlags;


GType
ORBit_policy_ex_get_type (void)
{
 return 0;
}

static void
ORBit_policy_free_fn (ORBit_RootObject obj)
{
 ORBitPolicy *p = (ORBitPolicy *) obj;
 g_ptr_array_free (p->allowed_poas, (!(0)));
 g_free (p);
}

static const ORBit_RootObject_Interface ORBit_Policy_epv = {
 ORBIT_ROT_CLIENT_POLICY,
 ORBit_policy_free_fn
};

ORBitPolicy *
ORBit_policy_new (GType type,
    const char *first_prop,
    ...)
{
 va_list args;
 const char *name;
 ORBitPolicy *policy = ((ORBitPolicy *) g_malloc0 (((gsize) sizeof (ORBitPolicy)) * ((gsize) (1))));
 ORBit_RootObject_init (&policy->parent, &ORBit_Policy_epv);

 policy->allowed_poas = g_ptr_array_sized_new (1);

 __builtin_va_start(args,first_prop);
 for (name = first_prop; name; name = __builtin_va_arg(args,char *)) {
  if (!__extension__ ({ size_t __s1_len, __s2_len; (__builtin_constant_p (name) && __builtin_constant_p ("allow") && (__s1_len = strlen (name), __s2_len = strlen ("allow"), (!((size_t)(const void *)((name) + 1) - (size_t)(const void *)(name) == 1) || __s1_len >= 4) && (!((size_t)(const void *)(("allow") + 1) - (size_t)(const void *)("allow") == 1) || __s2_len >= 4)) ? __builtin_strcmp (name, "allow") : (__builtin_constant_p (name) && ((size_t)(const void *)((name) + 1) - (size_t)(const void *)(name) == 1) && (__s1_len = strlen (name), __s1_len < 4) ? (__builtin_constant_p ("allow") && ((size_t)(const void *)(("allow") + 1) - (size_t)(const void *)("allow") == 1) ? __builtin_strcmp (name, "allow") : (__extension__ ({ __const unsigned char *__s2 = (__const unsigned char *) (__const char *) ("allow"); register int __result = (((__const unsigned char *) (__const char *) (name))[0] - __s2[0]); if (__s1_len > 0 && __result == 0) { __result = (((__const unsigned char *) (__const char *) (name))[1] - __s2[1]); if (__s1_len > 1 && __result == 0) { __result = (((__const unsigned char *) (__const char *) (name))[2] - __s2[2]); if (__s1_len > 2 && __result == 0) __result = (((__const unsigned char *) (__const char *) (name))[3] - __s2[3]); } } __result; }))) : (__builtin_constant_p ("allow") && ((size_t)(const void *)(("allow") + 1) - (size_t)(const void *)("allow") == 1) && (__s2_len = strlen ("allow"), __s2_len < 4) ? (__builtin_constant_p (name) && ((size_t)(const void *)((name) + 1) - (size_t)(const void *)(name) == 1) ? __builtin_strcmp (name, "allow") : (__extension__ ({ __const unsigned char *__s1 = (__const unsigned char *) (__const char *) (name); register int __result = __s1[0] - ((__const unsigned char *) (__const char *) ("allow"))[0]; if (__s2_len > 0 && __result == 0) { __result = (__s1[1] - ((__const unsigned char *) (__const char *) ("allow"))[1]); if (__s2_len > 1 && __result == 0) { __result = (__s1[2] - ((__const unsigned char *) (__const char *) ("allow"))[2]); if (__s2_len > 2 && __result == 0) __result = (__s1[3] - ((__const unsigned char *) (__const char *) ("allow"))[3]); } } __result; }))) : __builtin_strcmp (name, "allow")))); })) {
   gpointer poa = __builtin_va_arg(args,void *);
   g_ptr_array_add (policy->allowed_poas, poa);
  }
 }

 __builtin_va_end(args);

 return ORBit_RootObject_duplicate_T (policy);
}

ORBitPolicy *
ORBit_policy_ref (ORBitPolicy *p)
{
 return ORBit_RootObject_duplicate (p);
}

void
ORBit_policy_unref (ORBitPolicy *p)
{
 ORBit_RootObject_release (p);
}

void
ORBit_object_set_policy (CORBA_Object obj,
    ORBitPolicy *p)
{
 if (obj == ((void *)0))
  return;
 ORBit_policy_unref (obj->invoke_policy);
 obj->invoke_policy = ORBit_policy_ref (p);
}

ORBitPolicy *
ORBit_object_get_policy (CORBA_Object obj)
{
 if (obj == ((void *)0))
  return ((void *)0);
 else
  return ORBit_policy_ref (obj->invoke_policy);
}

void
ORBit_policy_push (ORBitPolicy *p)
{
 GIOPThread *tdata = giop_thread_self ();

 if (!tdata->invoke_policies)
  tdata->invoke_policies = g_queue_new ();

 g_queue_push_head (tdata->invoke_policies, ORBit_policy_ref (p));
}

void
ORBit_policy_pop (void)
{
 GIOPThread *tdata = giop_thread_self ();

 if (!tdata->invoke_policies)
  g_log (((gchar*) 0), G_LOG_LEVEL_WARNING, "No policy queue to pop from");
 else {
  ORBitPolicy *p;
  p = g_queue_pop_head (tdata->invoke_policies);
  ORBit_policy_unref (p);
 }
}

gboolean
ORBit_policy_validate (ORBitPolicy *policy)
{
 return (!(0));
}
