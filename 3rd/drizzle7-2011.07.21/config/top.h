
#if defined(i386) && !defined(__i386__)
#define __i386__
#endif

#if defined(_FILE_OFFSET_BITS)
# undef _FILE_OFFSET_BITS
#endif
