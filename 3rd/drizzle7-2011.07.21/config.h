/* config.h.  Generated from config.h.in by configure.  */
/* config.h.in.  Generated from configure.ac by autoheader.  */


#ifndef __CONFIG_H__
#define __CONFIG_H__

/* _SYS_FEATURE_TESTS_H is Solaris, _FEATURES_H is GCC */
#if defined( _SYS_FEATURE_TESTS_H) || defined(_FEATURES_H)
#error "You should include config.h as your first include file"
#endif

#include <config/top.h>


/* Define if building universal (internal helper macro) */
/* #undef AC_APPLE_UNIVERSAL_BUILD */

/* Disable forward decl of stl in boost */
/* #undef BOOST_DETAIL_NO_CONTAINER_FWD */

/* Use the v2 interface until we can stop using old versions */
#define BOOST_FILESYSTEM_DEPRECATED 1

/* Define indicating we are building and not consuming drizzle. */
/* #undef BUILDING_DRIZZLED */

/* the location of <cinttypes> */
#define CINTTYPES_H <tr1/cinttypes>

/* Comment about compilation environment */
/* #undef COMPILATION_COMMENT */

/* Define to one of `_getb67', `GETB67', `getb67' for Cray-2 and Cray-YMP
   systems. This function is required for `alloca.c' support on those systems.
   */
/* #undef CRAY_STACKSEG_END */

/* the location of <cstdint> */
#define CSTDINT_H <tr1/cstdint>

/* Define to 1 if using `alloca.c'. */
/* #undef C_ALLOCA */

/* Set to trunk if the branch is the main $PACKAGE branch */
#define DRIZZLE7_RELEASE_COMMENT "drizzle"

/* Release date of version control checkout */
#define DRIZZLE7_RELEASE_DATE "2011.07"

/* Numeric formatted release date and revision number of checkout */
#define DRIZZLE7_RELEASE_ID 20110721

/* Numeric formatted release date of checkout */
#define DRIZZLE7_RELEASE_NODOTS_DATE 201107

/* Release date and revision number of checkout */
#define DRIZZLE7_RELEASE_VERSION "2011.07.21"

/* Version control branch name */
#define DRIZZLE7_VC_BRANCH "drizzle"

/* Version control revision ID */
#define DRIZZLE7_VC_REVID "me@mark.atwood.name-20110704014029-msdso7k8gibt084t"

/* Version control revision number */
#define DRIZZLE7_VC_REVNO 2359

/* Append value to the version string */
/* #undef DRIZZLE_SERVER_SUFFIX */

/* Another magical number */
/* #undef EAI_SYSTEM */

/* Turn on language support */
/* #undef ENABLE_NLS */

/* READLINE: your system defines TIOCGWINSZ in sys/ioctl.h. */
#define GWINSZ_IN_SYS_IOCTL 1

/* Define to 1 if you have the `abi::__cxa_demangle' function. */
#define HAVE_ABI_CXA_DEMANGLE 1

/* Define to 1 if you have the <aio.h> header file. */
#define HAVE_AIO_H 1

/* Define to 1 if you have `alloca', as a function or macro. */
#define HAVE_ALLOCA 1

/* Define to 1 if you have <alloca.h> and it should be used (not on Ultrix).
   */
#define HAVE_ALLOCA_H 1

/* Define to 1 if you have the <asm/termbits.h> header file. */
#define HAVE_ASM_TERMBITS_H 1

/* Define to 1 if you have the <assert.h> header file. */
#define HAVE_ASSERT_H 1

/* Define to 1 if you have the `atomic_add_long' function. */
/* #undef HAVE_ATOMIC_ADD_LONG */

/* Define to 1 if you have the `atomic_cas_32' function. */
/* #undef HAVE_ATOMIC_CAS_32 */

/* Define to 1 if you have the `atomic_cas_64' function. */
/* #undef HAVE_ATOMIC_CAS_64 */

/* Define to 1 if you have the `atomic_cas_ulong' function. */
/* #undef HAVE_ATOMIC_CAS_ULONG */

/* pthread_t can be used by solaris atomics */
#define HAVE_ATOMIC_PTHREAD_T 1

/* Define to 1 if you have support for __attribute__((visibility("hidden")))
   */
#define HAVE_ATTR_HIDDEN 1

/* Define to 1 if you have the `backtrace' function. */
#define HAVE_BACKTRACE 1

/* Define to 1 if you have the `backtrace_symbols' function. */
#define HAVE_BACKTRACE_SYMBOLS 1

/* Define to 1 if you have the `backtrace_symbols_fd' function. */
#define HAVE_BACKTRACE_SYMBOLS_FD 1

/* Define to 1 if you have the `bzero' function. */
#define HAVE_BZERO 1

/* Have a working clock_gettime function */
#define HAVE_CLOCK_GETTIME 1

/* Does libcurl provide the CURLOPT_USERNAME constant */
/* #undef HAVE_CURLOPT_USERNAME */

/* Define to 1 if you have the <curses.h> header file. */
#define HAVE_CURSES_H 1

/* Define to 1 if you have the <cxxabi.h> header file. */
#define HAVE_CXXABI_H 1

/* Define to 1 if you have the declaration of `madvise', and to 0 if you
   don't. */
#define HAVE_DECL_MADVISE 0

/* Define to 1 if you have the declaration of `strerror_r', and to 0 if you
   don't. */
/* #undef HAVE_DECL_STRERROR_R */

/* Define to 1 if you have the <dirent.h> header file, and it defines `DIR'.
   */
#define HAVE_DIRENT_H 1

/* Define to 1 if you have the <dlfcn.h> header file. */
#define HAVE_DLFCN_H 1

/* Define to 1 if you have the `dlopen' function. */
#define HAVE_DLOPEN 1

/* Define to 1 if you don't have `vprintf' but do have `_doprnt.' */
/* #undef HAVE_DOPRNT */

/* Enables DTRACE Support */
/* #undef HAVE_DTRACE */

/* Define to 1 if you have the `event_base_free' function. */
#define HAVE_EVENT_BASE_FREE 1

/* Define to 1 if you have the `event_base_get_method' function. */
#define HAVE_EVENT_BASE_GET_METHOD 1

/* Define to 1 if you have the `event_base_new' function. */
#define HAVE_EVENT_BASE_NEW 1

/* Define to 1 if you have the <execinfo.h> header file. */
#define HAVE_EXECINFO_H 1

/* Define to 1 if you have the `fdatasync' function. */
#define HAVE_FDATASYNC 1

/* Define to 1 if you have the <fpu_control.h> header file. */
#define HAVE_FPU_CONTROL_H 1

/* Define to 1 if compiler provides atomic builtins. */
#define HAVE_GCC_ATOMIC_BUILTINS 1

/* Define to 1 if you have the `gethrtime' function. */
/* #undef HAVE_GETHRTIME */

/* Define to 1 if you have the `getpagesize' function. */
#define HAVE_GETPAGESIZE 1

/* Do we have haildb.h */
/* #undef HAVE_HAILDB_H */

/* Define to 1 if you have the <history.h> header file. */
/* #undef HAVE_HISTORY_H */

/* Define to 1 if you have the <ieeefp.h> header file. */
/* #undef HAVE_IEEEFP_H */

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define if you have the aio library. */
/* #undef HAVE_LIBAIO */

/* Define to 1 if you have the <libaio.h> header file. */
/* #undef HAVE_LIBAIO_H */

/* Define to 1 if you have the `bind' library (-lbind). */
/* #undef HAVE_LIBBIND */

/* Define if you have the boost_date_time library. */
/* #undef HAVE_LIBBOOST_DATE_TIME */

/* Define if you have the boost_date_time-mt library. */
/* #undef HAVE_LIBBOOST_DATE_TIME_MT */

/* Define if you have the boost_filesystem library. */
/* #undef HAVE_LIBBOOST_FILESYSTEM */

/* Define if you have the boost_filesystem-mt library. */
/* #undef HAVE_LIBBOOST_FILESYSTEM_MT */

/* Define if you have the boost_iostreams library. */
/* #undef HAVE_LIBBOOST_IOSTREAMS */

/* Define if you have the boost_iostreams-mt library. */
/* #undef HAVE_LIBBOOST_IOSTREAMS_MT */

/* Define if you have the boost_program_options library. */
/* #undef HAVE_LIBBOOST_PROGRAM_OPTIONS */

/* Define if you have the boost_program_options-mt library. */
/* #undef HAVE_LIBBOOST_PROGRAM_OPTIONS_MT */

/* Define if you have the boost_regex library. */
/* #undef HAVE_LIBBOOST_REGEX */

/* Define if you have the boost_regex-mt library. */
/* #undef HAVE_LIBBOOST_REGEX_MT */

/* Define if you have the boost_thread library. */
/* #undef HAVE_LIBBOOST_THREAD */

/* Define if you have the boost_thread-mt library. */
/* #undef HAVE_LIBBOOST_THREAD_MT */

/* Define if you have the boost_unit_test_framework library. */
/* #undef HAVE_LIBBOOST_UNIT_TEST_FRAMEWORK */

/* Define if you have the boost_unit_test_framework-mt library. */
/* #undef HAVE_LIBBOOST_UNIT_TEST_FRAMEWORK_MT */

/* Define if you have the c library. */
/* #undef HAVE_LIBC */

/* Define to 1 if you have the `compat' library (-lcompat). */
/* #undef HAVE_LIBCOMPAT */

/* Define if you have the curl library. */
#define HAVE_LIBCURL 1

/* Define to 1 if you have the `c_p' library (-lc_p). */
/* #undef HAVE_LIBC_P */

/* Define to 1 if you have the `dl' library (-ldl). */
#define HAVE_LIBDL 1

/* Define if you have the event library. */
#define HAVE_LIBEVENT 1

/* Define if you have the gcrypt library. */
/* #undef HAVE_LIBGCRYPT */

/* Define if you have the gearman library. */
/* #undef HAVE_LIBGEARMAN */

/* Define if you have the haildb library. */
/* #undef HAVE_LIBHAILDB */

/* Define to 1 if you have the `intl' library (-lintl). */
/* #undef HAVE_LIBINTL */

/* Define to 1 if you have the <libintl.h> header file. */
#define HAVE_LIBINTL_H 1

/* Define if you have the ldap library. */
#define HAVE_LIBLDAP 1

/* Define if you have the memcached library. */
#define HAVE_LIBMEMCACHED 1

/* Define if you have the memcachedprotocol library. */
#define HAVE_LIBMEMCACHEDPROTOCOL 1

/* Define to 1 if you have the `mtmalloc' library (-lmtmalloc). */
/* #undef HAVE_LIBMTMALLOC */

/* Define to 1 if you have the `nsl' library (-lnsl). */
/* #undef HAVE_LIBNSL */

/* Define if you have the pam library. */
#define HAVE_LIBPAM 1

/* Define if you have the pcre library. */
#define HAVE_LIBPCRE 1

/* Define if you have the protobuf library. */
/* #undef HAVE_LIBPROTOBUF */

/* Define if you have the rabbitmq library. */
/* #undef HAVE_LIBRABBITMQ */

/* Define if you have a readline compatible library */
#define HAVE_LIBREADLINE 1

/* Define to 1 if you have the `socket' library (-lsocket). */
/* #undef HAVE_LIBSOCKET */

/* Define if you have the sqlite3 library. */
#define HAVE_LIBSQLITE3 1

/* Define to 1 if you have the `tcmalloc' library (-ltcmalloc). */
/* #undef HAVE_LIBTCMALLOC */

/* Define to 1 if you have the `tcmalloc-minimal' library
   (-ltcmalloc-minimal). */
/* #undef HAVE_LIBTCMALLOC_MINIMAL */

/* Define to 1 if you have the `umem' library (-lumem). */
/* #undef HAVE_LIBUMEM */

/* Define if you have the uuid library. */
/* #undef HAVE_LIBUUID */

/* Define if you have the z library. */
#define HAVE_LIBZ 1

/* Define to 1 if you have the <locale.h> header file. */
#define HAVE_LOCALE_H 1

/* Define to 1 if you have the `localtime_r' function. */
#define HAVE_LOCALTIME_R 1

/* If we have the new memcached_server_fn typedef */
#define HAVE_MEMCACHED_SERVER_FN 1

/* Define to 1 if you have the `memchr' function. */
#define HAVE_MEMCHR 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have a working `mmap' system call. */
#define HAVE_MMAP 1

/* Define to 1 if you have the `munmap' function. */
#define HAVE_MUNMAP 1

/* Define to 1 if you have the <ndir.h> header file, and it defines `DIR'. */
/* #undef HAVE_NDIR_H */

/* For some non posix threads */
/* #undef HAVE_NONPOSIX_PTHREAD_GETSPECIFIC */

/* For some non posix threads */
/* #undef HAVE_NONPOSIX_PTHREAD_MUTEX_INIT */

/* sigwait with one argument */
/* #undef HAVE_NONPOSIX_SIGWAIT */

/* Define to 1 if you have the <paths.h> header file. */
#define HAVE_PATHS_H 1

/* Define to 1 if you have the `pread' function. */
#define HAVE_PREAD 1

/* Define if you have POSIX threads libraries and header files. */
#define HAVE_PTHREAD 1

/* Define to 1 if you have the `pthread_attr_create' function. */
/* #undef HAVE_PTHREAD_ATTR_CREATE */

/* Define to 1 if you have the `pthread_attr_getstacksize' function. */
#define HAVE_PTHREAD_ATTR_GETSTACKSIZE 1

/* Define to 1 if you have the `pthread_attr_setprio' function. */
/* #undef HAVE_PTHREAD_ATTR_SETPRIO */

/* Define to 1 if you have the `pthread_attr_setschedparam' function. */
#define HAVE_PTHREAD_ATTR_SETSCHEDPARAM 1

/* pthread_attr_setscope */
#define HAVE_PTHREAD_ATTR_SETSCOPE 1

/* Define to 1 if you have the `pthread_attr_setstacksize' function. */
#define HAVE_PTHREAD_ATTR_SETSTACKSIZE 1

/* Define to 1 if you have the `pthread_condattr_create' function. */
/* #undef HAVE_PTHREAD_CONDATTR_CREATE */

/* Define to 1 if you have the `pthread_getsequence_np' function. */
/* #undef HAVE_PTHREAD_GETSEQUENCE_NP */

/* Define to 1 if you have the `pthread_key_delete' function. */
#define HAVE_PTHREAD_KEY_DELETE 1

/* Define to 1 if you have the `pthread_rwlock_rdlock' function. */
#define HAVE_PTHREAD_RWLOCK_RDLOCK 1

/* Define to 1 if you have the `pthread_setprio' function. */
/* #undef HAVE_PTHREAD_SETPRIO */

/* Define to 1 if you have the `pthread_setprio_np' function. */
/* #undef HAVE_PTHREAD_SETPRIO_NP */

/* Define to 1 if you have the `pthread_setschedparam' function. */
#define HAVE_PTHREAD_SETSCHEDPARAM 1

/* Define to 1 if you have the `pthread_sigmask' function. */
#define HAVE_PTHREAD_SIGMASK 1

/* Define to 1 if you have the `pthread_yield_np' function. */
/* #undef HAVE_PTHREAD_YIELD_NP */

/* pthread_yield function with one argument */
/* #undef HAVE_PTHREAD_YIELD_ONE_ARG */

/* pthread_yield that doesn't take any arguments */
#define HAVE_PTHREAD_YIELD_ZERO_ARG 1

/* POSIX readdir_r */
#define HAVE_READDIR_R 1

/* Define to 1 if you have the <readline.h> header file. */
/* #undef HAVE_READLINE_H */

/* Define if your readline library has \`add_history' */
#define HAVE_READLINE_HISTORY 1

/* Define to 1 if you have the <readline/history.h> header file. */
#define HAVE_READLINE_HISTORY_H 1

/* Define to 1 if you have the <readline/readline.h> header file. */
#define HAVE_READLINE_READLINE_H 1

/* Does system provide rl_compentry_func_t */
#define HAVE_RL_COMPENTRY 1

/* Does system provide rl_completion_func_t */
#define HAVE_RL_COMPLETION 1

/* Define to 1 if you have the `rwlock_init' function. */
/* #undef HAVE_RWLOCK_INIT */

/* Define to 1 if you have the <sched.h> header file. */
#define HAVE_SCHED_H 1

/* Define to 1 if you have the `sched_yield' function. */
#define HAVE_SCHED_YIELD 1

/* Define to 1 if you have the <select.h> header file. */
/* #undef HAVE_SELECT_H */

/* Define to 1 if you have the `setupterm' function. */
/* #undef HAVE_SETUPTERM */

/* POSIX sigwait */
#define HAVE_SIGWAIT 1

/* Define to 1 if Solaris supports atomic functions. */
/* #undef HAVE_SOLARIS_ATOMICS */

/* Define to 1 if stdbool.h conforms to C99. */
#define HAVE_STDBOOL_H 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the `strerror_r' function. */
/* #undef HAVE_STRERROR_R */

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the <synch.h> header file. */
/* #undef HAVE_SYNCH_H */

/* Define to 1 if you have the <sys/dir.h> header file, and it defines `DIR'.
   */
/* #undef HAVE_SYS_DIR_H */

/* Define to 1 if you have the <sys/fpu.h> header file. */
/* #undef HAVE_SYS_FPU_H */

/* Define to 1 if you have the <sys/mman.h> header file. */
#define HAVE_SYS_MMAN_H 1

/* Define to 1 if you have the <sys/ndir.h> header file, and it defines `DIR'.
   */
/* #undef HAVE_SYS_NDIR_H */

/* Define to 1 if you have the <sys/prctl.h> header file. */
#define HAVE_SYS_PRCTL_H 1

/* Define to 1 if you have the <sys/sdt.h> header file. */
/* #undef HAVE_SYS_SDT_H */

/* Define to 1 if you have the <sys/select.h> header file. */
#define HAVE_SYS_SELECT_H 1

/* Define to 1 if you have the <sys/socket.h> header file. */
#define HAVE_SYS_SOCKET_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <sys/utime.h> header file. */
/* #undef HAVE_SYS_UTIME_H */

/* Define to 1 if you have <sys/wait.h> that is POSIX.1 compatible. */
#define HAVE_SYS_WAIT_H 1

/* Define to 1 if you have the <termcap.h> header file. */
#define HAVE_TERMCAP_H 1

/* Define to 1 if you have the <termios.h> header file. */
#define HAVE_TERMIOS_H 1

/* Define to 1 if you have the <termio.h> header file. */
#define HAVE_TERMIO_H 1

/* Define to 1 if you have the <term.h> header file. */
#define HAVE_TERM_H 1

/* Define to 1 if the system has the type `uint'. */
#define HAVE_UINT 1

/* Define to 1 if the system has the type `ulong'. */
#define HAVE_ULONG 1

/* Define to 1 if you have the `uname' function. */
#define HAVE_UNAME 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to 1 if you have the <utime.h> header file. */
#define HAVE_UTIME_H 1

/* Define to 1 if `utime(file, NULL)' sets file's timestamp to the present. */
#define HAVE_UTIME_NULL 1

/* Define to 1 if you have the <uuid/uuid.h> header file. */
/* #undef HAVE_UUID_UUID_H */

/* Add additional valgrind code for testing with valgrind. */
/* #undef HAVE_VALGRIND */

/* Define to 1 or 0, depending whether the compiler supports simple visibility
   declarations. */
#define HAVE_VISIBILITY 1

/* Define to 1 if you have the `vprintf' function. */
#define HAVE_VPRINTF 1

/* Does system provide an rl_compentry_func_t that is usable */
#define HAVE_WORKING_RL_COMPENTRY 1

/* Define to 1 if the system has the type `_Bool'. */
#define HAVE__BOOL 1

/* CPU of Build System */
#define HOST_CPU "x86_64"

/* OS of Build System */
#define HOST_OS "linux-gnu"

/* Vendor of Build System */
#define HOST_VENDOR "unknown"

/* Does x86 PAUSE instruction exist */
#define IB_HAVE_PAUSE_INSTRUCTION 1

/* Enabel libaio support in InnoDB */
/* #undef LINUX_NATIVE_AIO */

/* Define to the sub-directory in which libtool stores uninstalled libraries.
   */
#define LT_OBJDIR ".libs/"

/* Name of the memcached binary used in make test */
#define MEMCACHED_BINARY "no"

/* Define to 1 if assertions should be disabled. */
/* #undef NDEBUG */

/* Define to 1 if your C compiler doesn't accept -c and -o together. */
/* #undef NO_MINUS_C_MINUS_O */

/* Name of package */
#define PACKAGE "drizzle7"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "http://bugs.launchpad.net/drizzle"

/* Define to the full name of this package. */
#define PACKAGE_NAME "drizzle7"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "drizzle7 7"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "drizzle7"

/* Define to the version of this package. */
#define PACKAGE_VERSION "7"

/* The real version of the software */
#define PANDORA_RELEASE_VERSION "2011.07.21"

/* Location of pcre header */
#define PCRE_HEADER <pcre.h>

/* Define to necessary symbol if this constant uses a non-standard name on
   your system. */
/* #undef PTHREAD_CREATE_JOINABLE */

/* Define if system doesn't define */
/* #undef RUSAGE_THREAD */

/* The size of `int', as computed by sizeof. */
#define SIZEOF_INT 4

/* The size of `long', as computed by sizeof. */
#define SIZEOF_LONG 8

/* Size of long long as computed by sizeof() */
#define SIZEOF_LONG_LONG 8

/* The size of `off_t', as computed by sizeof. */
#define SIZEOF_OFF_T 8

/* The size of `pthread_t', as computed by sizeof. */
/* #undef SIZEOF_PTHREAD_T */

/* Size of size_t as computed by sizeof() */
#define SIZEOF_SIZE_T 8

/* The size of `void*', as computed by sizeof. */
#define SIZEOF_VOIDP 8

/* If using the C implementation of alloca, define if you know the
   direction of stack growth for your system; otherwise it will be
   automatically deduced at runtime.
	STACK_DIRECTION > 0 => grows toward higher addresses
	STACK_DIRECTION < 0 => grows toward lower addresses
	STACK_DIRECTION = 0 => direction of growth unknown */
/* #undef STACK_DIRECTION */

/* Define to 1 if the `S_IS*' macros in <sys/stat.h> do not work properly. */
/* #undef STAT_MACROS_BROKEN */

/* Define if ISO C++ 1998 header files are present. */
#define STDCXX_98_HEADERS /**/

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Define to 1 if strerror_r returns char *. */
/* #undef STRERROR_R_CHAR_P */

/* CPU of Target System */
#define TARGET_CPU "x86_64"

/* OS of Target System */
#define TARGET_OS "linux-gnu"

/* Whether we are building for FreeBSD */
/* #undef TARGET_OS_FREEBSD */

/* Whether we build for Linux */
#define TARGET_OS_LINUX 1

/* Whether we build for OSX */
/* #undef TARGET_OS_OSX */

/* Whether we are building for Solaris */
/* #undef TARGET_OS_SOLARIS */

/* Whether we are building for Windows */
/* #undef TARGET_OS_WINDOWS */

/* Vendor of Target System */
#define TARGET_VENDOR "unknown"

/* Define to 1 if time_t is unsigned */
/* #undef TIME_T_UNSIGNED */

/* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
#define TIME_WITH_SYS_TIME 1

/* Define to 1 if your <sys/time.h> declares `struct tm'. */
/* #undef TM_IN_SYS_TIME */

/* Enable extensions on AIX 3, Interix.  */
#ifndef _ALL_SOURCE
# define _ALL_SOURCE 1
#endif
/* Enable GNU extensions on systems that have them.  */
#ifndef _GNU_SOURCE
# define _GNU_SOURCE 1
#endif
/* Enable threading extensions on Solaris.  */
#ifndef _POSIX_PTHREAD_SEMANTICS
# define _POSIX_PTHREAD_SEMANTICS 1
#endif
/* Enable extensions on HP NonStop.  */
#ifndef _TANDEM_SOURCE
# define _TANDEM_SOURCE 1
#endif
/* Enable general extensions on Solaris.  */
#ifndef __EXTENSIONS__
# define __EXTENSIONS__ 1
#endif


/* Version number of package */
#define VERSION "7"

/* Version of Windows */
/* #undef WINVER */

/* Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
   significant byte first (like Motorola and SPARC, unlike Intel). */
#if defined AC_APPLE_UNIVERSAL_BUILD
# if defined __BIG_ENDIAN__
#  define WORDS_BIGENDIAN 1
# endif
#else
# ifndef WORDS_BIGENDIAN
/* #  undef WORDS_BIGENDIAN */
# endif
#endif

/* Number of bits in a file offset, on hosts where this is settable. */
/* #undef _FILE_OFFSET_BITS */

/* Enable GCC Profile Mode */
/* #undef _GLIBCXX_PROFILE */

/* Define for large files, on AIX-style hosts. */
/* #undef _LARGE_FILES */

/* Define to 1 if on MINIX. */
/* #undef _MINIX */

/* Define to 2 if the system does not provide POSIX.1 features except with
   this defined. */
/* #undef _POSIX_1_SOURCE */

/* Define to 1 if you need to in order for `stat' and other things to work. */
/* #undef _POSIX_SOURCE */

/* Cause Sun Studio to not be quite so strict with standards conflicts */
/* #undef _STLP_NO_NEW_C_HEADERS */

/* Magical number to make things work */
/* #undef _WIN32_WINNT */

/* Workaround for bug in FreeBSD headers */
/* #undef __APPLE_CC__ */

/* Use STDC Constant Macros in C++ */
/* #undef __STDC_CONSTANT_MACROS */

/* Use STDC Format Macros in C++ */
/* #undef __STDC_FORMAT_MACROS */

/* Use STDC Limit Macros in C++ */
#define __STDC_LIMIT_MACROS 1

/* Define to empty if `const' does not conform to ANSI C. */
/* #undef const */

/* Define to `__inline__' or `__inline' if that's what the C compiler
   calls it, or to nothing if 'inline' is not supported under any name.  */
#ifndef __cplusplus
/* #undef inline */
#endif

/* Define to the equivalent of the C99 'restrict' keyword, or to
   nothing if this is not supported.  Do not define if restrict is
   supported directly.  */
#define restrict __restrict
/* Work around a bug in Sun C++: it does not support _Restrict, even
   though the corresponding Sun C compiler does, which causes
   "#define restrict _Restrict" in the previous line.  Perhaps some future
   version of Sun C++ will work with _Restrict; if so, it'll probably
   define __RESTRICT, just as Sun C does.  */
#if defined __SUNPRO_CC && !defined __RESTRICT
# define _Restrict
#endif

/* Define to `unsigned int' if <sys/types.h> does not define. */
/* #undef size_t */

/* Define to empty if the keyword `volatile' does not work. Warning: valid
   code using `volatile' can become incorrect without. Disable with care. */
/* #undef volatile */


#ifndef HAVE_SYS_SOCKET_H
# define SHUT_RD SD_RECEIVE
# define SHUT_WR SD_SEND
# define SHUT_RDWR SD_BOTH
#endif
      


#if defined(__cplusplus)
# include CSTDINT_H
# include CINTTYPES_H
#else
# include <stdint.h>
# include <inttypes.h>
#endif

#if !defined(HAVE_ULONG) && !defined(__USE_MISC)
# define HAVE_ULONG 1
typedef unsigned long int ulong;
#endif

/* To hide the platform differences between MS Windows and Unix, I am
 * going to use the Microsoft way and #define the Microsoft-specific
 * functions to the unix way. Microsoft use a separate subsystem for sockets,
 * but Unix normally just use a filedescriptor on the same functions. It is
 * a lot easier to map back to the unix way with macros than going the other
 * way without side effect ;-)
 */
#ifdef TARGET_OS_WINDOWS
#define random() rand()
#define srandom(a) srand(a)
#define get_socket_errno() WSAGetLastError()
#else
#define INVALID_SOCKET -1
#define SOCKET_ERROR -1
#define closesocket(a) close(a)
#define get_socket_errno() errno
#endif

#if defined(__cplusplus)
# if defined(DEBUG)
#  include <cassert>
#  include <cstddef>
# endif
template<typename To, typename From>
inline To implicit_cast(From const &f) {
  return f;
}
template<typename To, typename From>     // use like this: down_cast<T*>(foo);
inline To down_cast(From* f) {                   // so we only accept pointers
  // Ensures that To is a sub-type of From *.  This test is here only
  // for compile-time type checking, and has no overhead in an
  // optimized build at run-time, as it will be optimized away
  // completely.
  if (false) {
    implicit_cast<From*, To>(0);
  }

#if defined(DEBUG)
  assert(f == NULL || dynamic_cast<To>(f) != NULL);  // RTTI: debug mode only!
#endif
  return static_cast<To>(f);
}
#endif /* defined(__cplusplus) */

#endif /* __CONFIG_H__ */
  
