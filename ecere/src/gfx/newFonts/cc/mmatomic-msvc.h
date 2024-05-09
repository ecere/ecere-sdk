/* *****************************************************************************
 * Copyright (c) 2011-2023 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
#ifndef MMATOMIC_H
 #warning Do not include directly, include mmatomic.h
#endif


////


/* MSVC */
#if defined(_MSC_VER) && !defined(MM_ATOMIC_SUPPORT)

#if ( defined(__SSE2__) || defined(_M_X64) || (defined(_M_IX86_FP) && _M_IX86_FP >= 2) )
 #include <emmintrin.h>
#endif


////


#define MM_ATOMIC_SUPPORT (1)

#if MMATOMIC_ARCH_AMD64 || MMATOMIC_ARCH_ARM64
 #define MM_ATOMIC_64_BITS_SUPPORT (1)
#endif

typedef struct { volatile int8_t value; } mmAtomic8;
typedef struct { volatile int16_t value; } mmAtomic16;
typedef struct { volatile int32_t value; } mmAtomic32;
#if MM_ATOMIC_64_BITS_SUPPORT
typedef struct { volatile int64_t value; } mmAtomic64;
#endif


////


/* Do nothing, prevent compiler reordering */
static inline void mmBarrier()
{
  _ReadWriteBarrier();
  return;
}

/* All previous loads must complete before future loads */
static inline void mmLoadLoadBarrier()
{
#if defined(i386) || defined(__i386) || defined(__i386__) || defined(__i386) || defined(__IA32__) || defined(_M_IX86) || defined(__X86__) || defined(_X86_) || defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__x86_64) || defined(_M_X64) || defined(_M_AMD64)
  /* x86/AMD64 don't normally reorder loads ~ different rules apply to WC/WT/UC memory */
  _ReadWriteBarrier();
#elif _WIN32_WINNT >= 0x600
  MemoryBarrier();
#else
  /* Danger? */
  _ReadWriteBarrier();
#endif
  return;
}

/* All previous loads must complete before future stores */
static inline void mmLoadStoreBarrier()
{
#if defined(i386) || defined(__i386) || defined(__i386__) || defined(__i386) || defined(__IA32__) || defined(_M_IX86) || defined(__X86__) || defined(_X86_) || defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__x86_64) || defined(_M_X64) || defined(_M_AMD64)
  /* x86/AMD64 don't normally reorder loads ~ different rules apply to WC/WT/UC memory */
  _ReadWriteBarrier();
#elif _WIN32_WINNT >= 0x600
  MemoryBarrier();
#else
  /* Danger? */
  _ReadWriteBarrier();
#endif
  return;
}

/* All previous stores must complete before future loads */
static inline void mmStoreLoadBarrier()
{
#if ( defined(__SSE2__) || defined(_M_X64) || (defined(_M_IX86_FP) && _M_IX86_FP >= 2) )
  _mm_mfence();
#elif _WIN32_WINNT >= 0x600
  MemoryBarrier();
#else
  /* Danger? */
  _ReadWriteBarrier();
#endif
  return;
}

/* All previous stores must complete before future stores */
static inline void mmStoreStoreBarrier()
{
#if defined(i386) || defined(__i386) || defined(__i386__) || defined(__i386) || defined(__IA32__) || defined(_M_IX86) || defined(__X86__) || defined(_X86_) || defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__x86_64) || defined(_M_X64) || defined(_M_AMD64)
  /* x86/AMD64 don't normally reorder stores ~ different rules apply to WC/WT/UC memory */
  _ReadWriteBarrier();
#elif _WIN32_WINNT >= 0x600
  MemoryBarrier();
#else
  /* Danger? */
  _ReadWriteBarrier();
#endif
  return;
}

/* All previous loads/stores must complete before future loads/stores */
static inline void mmFullBarrier()
{
#if ( defined(__SSE2__) || defined(_M_X64) || (defined(_M_IX86_FP) && _M_IX86_FP >= 2) )
  _mm_mfence();
#elif _WIN32_WINNT >= 0x600
  MemoryBarrier();
#else
  /* Danger? */
  _ReadWriteBarrier();
#endif
  return;
}


////


/* Direct access to the atomic variables, for use when the caller knows no atomicity is needed */
#define MM_ATOMIC_ACCESS_8(v) ((v)->value)
#define MM_ATOMIC_ACCESS_16(v) ((v)->value)
#define MM_ATOMIC_ACCESS_32(v) ((v)->value)
#if MM_ATOMIC_64_BITS_SUPPORT
 #define MM_ATOMIC_ACCESS_64(v) ((v)->value)
#endif


////


/*
mmAtomicRead*()
Atomically read the value
*/
static inline int8_t mmAtomicRead8( mmAtomic8 *v )
{
  mmBarrier();
  return v->value;
}

static inline int16_t mmAtomicRead16( mmAtomic16 *v )
{
  mmBarrier();
  return v->value;
}

static inline int32_t mmAtomicRead32( mmAtomic32 *v )
{
  mmBarrier();
  return v->value;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicRead64( mmAtomic64 *v )
{
  mmBarrier();
  return v->value;
}
#endif


////


/*
mmAtomicWrite*()
Atomically write the value
*/
static inline void mmAtomicWrite8( mmAtomic8 *v, int8_t i )
{
  mmBarrier();
  v->value = i;
  return;
}

static inline void mmAtomicWrite16( mmAtomic16 *v, int16_t i )
{
  mmBarrier();
  v->value = i;
  return;
}

static inline void mmAtomicWrite32( mmAtomic32 *v, int32_t i )
{
  mmBarrier();
  v->value = i;
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicWrite64( mmAtomic64 *v, int64_t i )
{
  mmBarrier();
  v->value = i;
  return;
}
#endif


////


/*
mmAtomicBarrierWrite*()
Atomically write the value and act as a full memory barrier
*/
static inline void mmAtomicBarrierWrite8( mmAtomic8 *v, int8_t i )
{
  mmBarrier();
  v->value = i;
  mmFullBarrier();
  return;
}

static inline void mmAtomicBarrierWrite16( mmAtomic16 *v, int16_t i )
{
  mmBarrier();
  v->value = i;
  mmFullBarrier();
  return;
}

static inline void mmAtomicBarrierWrite32( mmAtomic32 *v, int32_t i )
{
  mmBarrier();
  v->value = i;
  mmFullBarrier();
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicBarrierWrite64( mmAtomic64 *v, int64_t i )
{
  mmBarrier();
  v->value = i;
  mmFullBarrier();
  return;
}
#endif


////


static inline void mmAtomicAdd8( mmAtomic8 *v, int8_t i )
{
#if _MSC_VER >= 1800
  _InterlockedExchangeAdd8( &v->value, i );
#else
  /* Die MSVC, die */
  int16_t old16, new16, value, next;
  for( ; ; )
  {
    value = v->value;
    next = ( (int16_t)((char *)&v->value)[1] << 8 );
    old16 = value | next;
    new16 = ( ( value + i ) & 0xff ) | next;
    if( _InterlockedCompareExchange16( (int16_t *)&v->value, new16, old16 ) == old16 )
      break;
  }
#endif
  return;
}

static inline void mmAtomicAdd16( mmAtomic16 *v, int16_t i )
{
#if _MSC_VER >= 1800
  _InterlockedExchangeAdd16( &v->value, i );
#else
  /* ARGGHH */
  int16_t value;
  for( ; ; )
  {
    value = v->value;
    if( _InterlockedCompareExchange16( (int16_t *)&v->value, value + i, value ) == value )
      break;
  }
#endif
  return;
}

static inline void mmAtomicAdd32( mmAtomic32 *v, int32_t i )
{
  _InterlockedExchangeAdd( &v->value, i );
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicAdd64( mmAtomic64 *v, int64_t i )
{
  _InterlockedExchangeAdd64( &v->value, i );
  return;
}
#endif


////


static inline void mmAtomicSub8( mmAtomic8 *v, int8_t i )
{
#if _MSC_VER >= 1800
  _InterlockedExchangeAdd8( &v->value, -i );
#else
  mmAtomicAdd8( v, -i );
#endif
  return;
}

static inline void mmAtomicSub16( mmAtomic16 *v, int16_t i )
{
#if _MSC_VER >= 1800
  _InterlockedExchangeAdd16( &v->value, -i );
#else
  mmAtomicAdd16( v, -i );
#endif
  return;
}

static inline void mmAtomicSub32( mmAtomic32 *v, int32_t i )
{
  _InterlockedExchangeAdd( &v->value, -i );
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicSub64( mmAtomic64 *v, int64_t i )
{
  _InterlockedExchangeAdd64( &v->value, -i );
  return;
}
#endif


////


static inline int8_t mmAtomicAddRead8( mmAtomic8 *v, int8_t i )
{
#if _MSC_VER >= 1800
  return _InterlockedExchangeAdd8( &v->value, i ) + i;
#else
  /* I can't even... */
  int16_t old16, new16, value, next;
  for( ; ; )
  {
    value = v->value;
    next = ( (int16_t)((char *)&v->value)[1] << 8 );
    old16 = value | next;
    new16 = ( ( value + i ) & 0xff ) | next;
    if( _InterlockedCompareExchange16( (int16_t *)&v->value, new16, old16 ) == old16 )
      break;
  }
  return ( old16 + i ) & 0xff;
#endif
}

static inline int16_t mmAtomicAddRead16( mmAtomic16 *v, int16_t i )
{
#if _MSC_VER >= 1800
  return _InterlockedExchangeAdd16( &v->value, i ) + i;
#else
  int16_t value;
  for( ; ; )
  {
    value = v->value;
    if( _InterlockedCompareExchange16( (int16_t *)&v->value, value + i, value ) == value )
      break;
  }
  return value + i;
#endif
}

static inline int32_t mmAtomicAddRead32( mmAtomic32 *v, int32_t i )
{
  return _InterlockedExchangeAdd( &v->value, i ) + i;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicAddRead64( mmAtomic64 *v, int64_t i )
{
  return _InterlockedExchangeAdd64( &v->value, i ) + i;
}
#endif


////


static inline int8_t mmAtomicSubRead8( mmAtomic8 *v, int8_t i )
{
  return mmAtomicAddRead8( v, -i );
}

static inline int16_t mmAtomicSubRead16( mmAtomic16 *v, int16_t i )
{
  return mmAtomicAddRead16( v, -i );
}

static inline int32_t mmAtomicSubRead32( mmAtomic32 *v, int32_t i )
{
  return mmAtomicAddRead32( v, -i );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicSubRead64( mmAtomic64 *v, int64_t i )
{
  return mmAtomicAddRead64( v, -i );
}
#endif


////


static inline int mmAtomicAddTestZero8( mmAtomic8 *v, int8_t i )
{
#if _MSC_VER >= 1800
  return ( ( _InterlockedExchangeAdd8( &v->value, i ) + i ) == 0 );
#else
  /* The... pain... */
  int16_t old16, new16, value, next;
  for( ; ; )
  {
    value = v->value;
    next = ( (int16_t)((char *)&v->value)[1] << 8 );
    old16 = value | next;
    new16 = ( ( value + i ) & 0xff ) | next;
    if( _InterlockedCompareExchange16( (int16_t *)&v->value, new16, old16 ) == old16 )
      break;
  }
  return ( ( old16 + i ) & 0xff ) == 0;
#endif
}

static inline int mmAtomicAddTestZero16( mmAtomic16 *v, int16_t i )
{
#if _MSC_VER >= 1800
  return ( ( _InterlockedExchangeAdd16( &v->value, i ) + i ) == 0 );
#else
  int16_t value;
  for( ; ; )
  {
    value = v->value;
    if( _InterlockedCompareExchange16( (int16_t *)&v->value, value + i, value ) == value )
      break;
  }
  return ( value + i ) == 0;
#endif
}

static inline int mmAtomicAddTestZero32( mmAtomic32 *v, int32_t i )
{
  return ( ( _InterlockedExchangeAdd( &v->value, i ) + i ) == 0 );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicAddTestZero64( mmAtomic64 *v, int64_t i )
{
  return ( ( _InterlockedExchangeAdd64( &v->value, i ) + i ) == 0 );
}
#endif


////


static inline int mmAtomicSubTestZero8( mmAtomic8 *v, int8_t i )
{
#if _MSC_VER >= 1800
  return ( ( _InterlockedExchangeAdd8( &v->value, -i ) - i ) == 0 );
#else
  return mmAtomicAddTestZero8( v, -i );
#endif
}

static inline int mmAtomicSubTestZero16( mmAtomic16 *v, int16_t i )
{
#if _MSC_VER >= 1800
  return ( ( _InterlockedExchangeAdd16( &v->value, -i ) - i ) == 0 );
#else
  return mmAtomicAddTestZero16( v, -i );
#endif
}

static inline int mmAtomicSubTestZero32( mmAtomic32 *v, int32_t i )
{
  return ( ( _InterlockedExchangeAdd( &v->value, -i ) - i ) == 0 );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicSubTestZero64( mmAtomic64 *v, int64_t i )
{
  return ( ( _InterlockedExchangeAdd64( &v->value, -i ) - i ) == 0 );
}
#endif


////


static inline int mmAtomicAddTestNegative8( mmAtomic8 *v, int8_t i )
{
#if _MSC_VER >= 1800
  return ( ( _InterlockedExchangeAdd8( &v->value, i ) + i ) < 0 );
#else
  /* Why does a hardware instruction from 1985 need a compiler upgrade in 2013 to be used? WHY! */
  int16_t old16, new16, value, next;
  for( ; ; )
  {
    value = v->value;
    next = ( (int16_t)((char *)&v->value)[1] << 8 );
    old16 = value | next;
    new16 = ( ( value + i ) & 0xff ) | next;
    if( _InterlockedCompareExchange16( (int16_t *)&v->value, new16, old16 ) == old16 )
      break;
  }
  return ( ( old16 + i ) & 0xff ) < 0;
#endif
}

static inline int mmAtomicAddTestNegative16( mmAtomic16 *v, int16_t i )
{
#if _MSC_VER >= 1800
  return ( ( _InterlockedExchangeAdd16( &v->value, i ) + i ) < 0 );
#else
  int16_t value;
  for( ; ; )
  {
    value = v->value;
    if( _InterlockedCompareExchange16( (int16_t *)&v->value, value + i, value ) == value )
      break;
  }
  return ( value + i ) < 0;
#endif
}

static inline int mmAtomicAddTestNegative32( mmAtomic32 *v, int32_t i )
{
  return ( ( _InterlockedExchangeAdd( &v->value, i ) + i ) < 0 );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicAddTestNegative64( mmAtomic64 *v, int64_t i )
{
  return ( ( _InterlockedExchangeAdd64( &v->value, i ) + i ) < 0 );
}
#endif


////


static inline int mmAtomicSubTestNegative8( mmAtomic8 *v, int8_t i )
{
#if _MSC_VER >= 1800
  return ( ( _InterlockedExchangeAdd8( &v->value, -i ) - i ) < 0 );
#else
  return mmAtomicAddTestNegative8( v, -i );
#endif
}

static inline int mmAtomicSubTestNegative16( mmAtomic16 *v, int16_t i )
{
#if _MSC_VER >= 1800
  return ( ( _InterlockedExchangeAdd16( &v->value, -i ) - i ) < 0 );
#else
  return mmAtomicAddTestNegative16( v, -i );
#endif
}

static inline int mmAtomicSubTestNegative32( mmAtomic32 *v, int32_t i )
{
  return ( ( _InterlockedExchangeAdd( &v->value, -i ) - i ) < 0 );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicSubTestNegative64( mmAtomic64 *v, int64_t i )
{
  return ( ( _InterlockedExchangeAdd64( &v->value, -i ) - i ) < 0 );
}
#endif



////////////////



static inline void mmAtomicAnd8( mmAtomic8 *v, int8_t i )
{
  _InterlockedAnd8( &v->value, i );
  return;
}

static inline void mmAtomicAnd16( mmAtomic16 *v, int16_t i )
{
  _InterlockedAnd16( &v->value, i );
  return;
}

static inline void mmAtomicAnd32( mmAtomic32 *v, int32_t i )
{
  _InterlockedAnd( &v->value, i );
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicAnd64( mmAtomic64 *v, int64_t i )
{
  _InterlockedAnd64( &v->value, i );
  return;
}
#endif


////


static inline int mmAtomicAndTestZero8( mmAtomic8 *v, int8_t i )
{
  return ( ( _InterlockedAnd8( &v->value, i ) & i ) == 0 );
}

static inline int mmAtomicAndTestZero16( mmAtomic16 *v, int16_t i )
{
  return ( ( _InterlockedAnd16( &v->value, i ) & i ) == 0 );
}

static inline int mmAtomicAndTestZero32( mmAtomic32 *v, int32_t i )
{
  return ( ( _InterlockedAnd( &v->value, i ) & i ) == 0 );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicAndTestZero64( mmAtomic64 *v, int64_t i )
{
  return ( ( _InterlockedAnd64( &v->value, i ) & i ) == 0 );
}
#endif


////


static inline void mmAtomicOr8( mmAtomic8 *v, int8_t i )
{
  _InterlockedOr8( &v->value, i );
  return;
}

static inline void mmAtomicOr16( mmAtomic16 *v, int16_t i )
{
  _InterlockedOr16( &v->value, i );
  return;
}

static inline void mmAtomicOr32( mmAtomic32 *v, int32_t i )
{
  _InterlockedOr( &v->value, i );
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicOr64( mmAtomic64 *v, int64_t i )
{
  _InterlockedOr64( &v->value, i );
  return;
}
#endif


////


static inline int mmAtomicOrTestZero8( mmAtomic8 *v, int8_t i )
{
  return ( ( _InterlockedOr8( &v->value, i ) | i ) == 0 );
}

static inline int mmAtomicOrTestZero16( mmAtomic16 *v, int16_t i )
{
  return ( ( _InterlockedOr16( &v->value, i ) | i ) == 0 );
}

static inline int mmAtomicOrTestZero32( mmAtomic32 *v, int32_t i )
{
  return ( ( _InterlockedOr( &v->value, i ) | i ) == 0 );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicOrTestZero64( mmAtomic64 *v, int64_t i )
{
  return ( ( _InterlockedOr64( &v->value, i ) | i ) == 0 );
}
#endif


////


static inline void mmAtomicXor8( mmAtomic8 *v, int8_t i )
{
  _InterlockedXor8( &v->value, i );
  return;
}

static inline void mmAtomicXor16( mmAtomic16 *v, int16_t i )
{
  _InterlockedXor16( &v->value, i );
  return;
}

static inline void mmAtomicXor32( mmAtomic32 *v, int32_t i )
{
  _InterlockedXor( &v->value, i );
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicXor64( mmAtomic64 *v, int64_t i )
{
  _InterlockedXor64( &v->value, i );
  return;
}
#endif


////


static inline int mmAtomicXorTestZero8( mmAtomic8 *v, int8_t i )
{
  return ( ( _InterlockedXor8( &v->value, i ) ^ i ) == 0 );
}

static inline int mmAtomicXorTestZero16( mmAtomic16 *v, int16_t i )
{
  return ( ( _InterlockedXor16( &v->value, i ) ^ i ) == 0 );
}

static inline int mmAtomicXorTestZero32( mmAtomic32 *v, int32_t i )
{
  return ( ( _InterlockedXor( &v->value, i ) ^ i ) == 0 );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicXorTestZero64( mmAtomic64 *v, int64_t i )
{
  return ( ( _InterlockedXor64( &v->value, i ) ^ i ) == 0 );
}
#endif



////////////////



static inline int8_t mmAtomicXchg8( mmAtomic8 *v, int8_t i )
{
#if _MSC_VER >= 1800
  return _InterlockedExchange8( &v->value, i );
#else
  /* WTF, screw you MSVC */
  int16_t old16, new16, next;
  for( ; ; )
  {
    next = ( (int16_t)((char *)&v->value)[1] << 8 );
    new16 = i | next;
    old16 = v->value | next;
    if( _InterlockedCompareExchange16( (int16_t *)&v->value, new16, old16 ) == old16 )
      break;
  }
  return old16 & 0xff;
#endif
}

static inline int16_t mmAtomicXchg16( mmAtomic16 *v, int16_t i )
{
#if _MSC_VER >= 1800
  return _InterlockedExchange16( &v->value, i );
#else
  /* What... */
  int16_t c;
  while( _InterlockedCompareExchange16( &v->value, i, ( c = v->value ) ) != c );
#endif
}

static inline int32_t mmAtomicXchg32( mmAtomic32 *v, int32_t i )
{
  return _InterlockedExchange( &v->value, i );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicXchg64( mmAtomic64 *v, int64_t i )
{
  return _InterlockedExchange64( &v->value, i );
}
#endif


////


static inline int8_t mmAtomicCmpXchg8( mmAtomic8 *v, int8_t old, int8_t new )
{
#if _MSC_VER >= 1700
  return _InterlockedCompareExchange8( &v->value, new, old );
#else
  /* I hate you MSVC */
  int16_t old16, new16, next;
  next = ( (int16_t)((char *)&v->value)[1] << 8 );
  new16 = new | next;
  old16 = old | next;
  return _InterlockedCompareExchange16( (int16_t *)&v->value, new16, old16 ) & 0xff;
#endif
}

static inline int16_t mmAtomicCmpXchg16( mmAtomic16 *v, int16_t old, int16_t new )
{
  return _InterlockedCompareExchange16( &v->value, new, old );
}

static inline int32_t mmAtomicCmpXchg32( mmAtomic32 *v, int32_t old, int32_t new )
{
  return _InterlockedCompareExchange( &v->value, new, old );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicCmpXchg64( mmAtomic64 *v, int64_t old, int64_t new )
{
  return _InterlockedCompareExchange64( &v->value, new, old );
}
#endif



////////////////



static inline void mmAtomicPause()
{
#if ( defined(__SSE2__) || defined(_M_X64) || (defined(_M_IX86_FP) && _M_IX86_FP >= 2) )
  _mm_pause();
#endif
  return;
}


static inline void mmAtomicSpinWaitEq8( mmAtomic8 *v, int8_t i )
{
  while( mmAtomicRead8( v ) != i );
  return;
}

static inline void mmAtomicSpinWaitEq16( mmAtomic16 *v, int16_t i )
{
  while( mmAtomicRead16( v ) != i );
  return;
}

static inline void mmAtomicSpinWaitEq32( mmAtomic32 *v, int32_t i )
{
  while( mmAtomicRead32( v ) != i );
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicSpinWaitEq64( mmAtomic64 *v, int64_t i )
{
  while( mmAtomicRead64( v ) != i );
  return;
}
#endif


static inline int32_t mmAtomicSpinWaitEq8Count( mmAtomic8 *v, int8_t i, int32_t spinmaxcount )
{
  for( ; ( mmAtomicRead8( v ) != i ) && ( spinmaxcount ) ; spinmaxcount-- );
  return spinmaxcount;
}

static inline int32_t mmAtomicSpinWaitEq16Count( mmAtomic16 *v, int16_t i, int32_t spinmaxcount )
{
  for( ; ( mmAtomicRead16( v ) != i ) && ( spinmaxcount ) ; spinmaxcount-- );
  return spinmaxcount;
}

static inline int32_t mmAtomicSpinWaitEq32Count( mmAtomic32 *v, int32_t i, int32_t spinmaxcount )
{
  for( ; ( mmAtomicRead32( v ) != i ) && ( spinmaxcount ) ; spinmaxcount-- );
  return spinmaxcount;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int32_t mmAtomicSpinWaitEq64Count( mmAtomic64 *v, int64_t i, int32_t spinmaxcount )
{
  for( ; ( mmAtomicRead64( v ) != i ) && ( spinmaxcount ) ; spinmaxcount-- );
  return spinmaxcount;
}
#endif


static inline void mmAtomicSpinWaitNeq8( mmAtomic8 *v, int8_t i )
{
  while( mmAtomicRead8( v ) == i );
  return;
}

static inline void mmAtomicSpinWaitNeq16( mmAtomic16 *v, int16_t i )
{
  while( mmAtomicRead16( v ) == i );
  return;
}

static inline void mmAtomicSpinWaitNeq32( mmAtomic32 *v, int32_t i )
{
  while( mmAtomicRead32( v ) == i );
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicSpinWaitNeq64( mmAtomic64 *v, int64_t i )
{
  while( mmAtomicRead64( v ) == i );
  return;
}
#endif


static inline int32_t mmAtomicSpinWaitNeq8Count( mmAtomic8 *v, int8_t i, int32_t spinmaxcount )
{
  for( ; ( mmAtomicRead8( v ) == i ) && ( spinmaxcount ) ; spinmaxcount-- );
  return spinmaxcount;
}

static inline int32_t mmAtomicSpinWaitNeq16Count( mmAtomic16 *v, int16_t i, int32_t spinmaxcount )
{
  for( ; ( mmAtomicRead16( v ) == i ) && ( spinmaxcount ) ; spinmaxcount-- );
  return spinmaxcount;
}

static inline int32_t mmAtomicSpinWaitNeq32Count( mmAtomic32 *v, int32_t i, int32_t spinmaxcount )
{
  for( ; ( mmAtomicRead32( v ) == i ) && ( spinmaxcount ) ; spinmaxcount-- );
  return spinmaxcount;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int32_t mmAtomicSpinWaitNeq64Count( mmAtomic64 *v, int64_t i, int32_t spinmaxcount )
{
  for( ; ( mmAtomicRead64( v ) == i ) && ( spinmaxcount ) ; spinmaxcount-- );
  return spinmaxcount;
}
#endif


////


/* MSVC */
#endif

