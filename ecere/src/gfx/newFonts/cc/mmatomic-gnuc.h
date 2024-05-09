/* *****************************************************************************
 * Copyright (c) 2011-2023 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
#ifndef MMATOMIC_H
 #warning Do not include directly, include mmatomic.h
#endif


////


/* GNUC */
#if defined(__GNUC__) && !defined(MM_ATOMIC_SUPPORT)

/*
Note
The assembly version is preferred on x86/amd64 for a multitude of reasons, like
the rep nop instructions providing hints to a hyperthreading compiler to switch
to the other resident thread, and so on
*/

#if ( __SSE2__ || _M_X64 || _M_IX86_FP >= 2 )
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
  __asm__ __volatile__( "":::"memory" );
  return;
}

/* All previous loads must complete before future loads */
static inline void mmLoadLoadBarrier()
{
#if defined(__ARM_ARCH_8__)
  __asm__ __volatile__( "dmb ld":::"memory" );
#else
  __sync_synchronize();
#endif
  return;
}

/* All previous loads must complete before future stores */
static inline void mmLoadStoreBarrier()
{
#if defined(__ARM_ARCH_8__)
  __asm__ __volatile__( "dmb ld":::"memory" );
#else
  __sync_synchronize();
#endif
  return;
}

/* All previous stores must complete before future loads */
static inline void mmStoreLoadBarrier()
{
#if defined(__arm__) || defined(_ARM) || defined(_M_ARM) || defined(__arm)
  __asm__ __volatile__( "dmb st":::"memory" );
#else
  __sync_synchronize();
#endif
  return;
}

/* All previous stores must complete before future stores */
static inline void mmStoreStoreBarrier()
{
#if defined(__arm__) || defined(_ARM) || defined(_M_ARM) || defined(__arm)
  __asm__ __volatile__( "dmb st":::"memory" );
#else
  __sync_synchronize();
#endif
  return;
}

/* All previous loads/stores must complete before future loads/stores */
static inline void mmFullBarrier()
{
#if defined(__ARM_ARCH_8__)
  __asm__ __volatile__( "dmb sy":::"memory" );
#else
  __sync_synchronize();
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
  __sync_fetch_and_add( &v->value, i );
  return;
}

static inline void mmAtomicAdd16( mmAtomic16 *v, int16_t i )
{
  __sync_fetch_and_add( &v->value, i );
  return;
}

static inline void mmAtomicAdd32( mmAtomic32 *v, int32_t i )
{
  __sync_fetch_and_add( &v->value, i );
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicAdd64( mmAtomic64 *v, int64_t i )
{
  __sync_fetch_and_add( &v->value, i );
  return;
}
#endif


////


static inline void mmAtomicSub8( mmAtomic8 *v, int8_t i )
{
  __sync_fetch_and_sub( &v->value, i );
  return;
}

static inline void mmAtomicSub16( mmAtomic16 *v, int16_t i )
{
  __sync_fetch_and_sub( &v->value, i );
  return;
}

static inline void mmAtomicSub32( mmAtomic32 *v, int32_t i )
{
  __sync_fetch_and_sub( &v->value, i );
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicSub64( mmAtomic64 *v, int64_t i )
{
  __sync_fetch_and_sub( &v->value, i );
  return;
}
#endif


////


static inline int8_t mmAtomicAddRead8( mmAtomic8 *v, int8_t i )
{
  return __sync_add_and_fetch( &v->value, i );
}

static inline int16_t mmAtomicAddRead16( mmAtomic16 *v, int16_t i )
{
  return __sync_add_and_fetch( &v->value, i );
}

static inline int32_t mmAtomicAddRead32( mmAtomic32 *v, int32_t i )
{
  return __sync_add_and_fetch( &v->value, i );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicAddRead64( mmAtomic64 *v, int64_t i )
{
  return __sync_add_and_fetch( &v->value, i );
}
#endif


////


static inline int8_t mmAtomicSubRead8( mmAtomic8 *v, int8_t i )
{
  return __sync_sub_and_fetch( &v->value, i );
}

static inline int16_t mmAtomicSubRead16( mmAtomic16 *v, int16_t i )
{
  return __sync_sub_and_fetch( &v->value, i );
}

static inline int32_t mmAtomicSubRead32( mmAtomic32 *v, int32_t i )
{
  return __sync_sub_and_fetch( &v->value, i );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicSubRead64( mmAtomic64 *v, int64_t i )
{
  return __sync_sub_and_fetch( &v->value, i );
}
#endif


////


static inline int mmAtomicAddTestZero8( mmAtomic8 *v, int8_t i )
{
  return ( __sync_add_and_fetch( &v->value, i ) == 0 );
}

static inline int mmAtomicAddTestZero16( mmAtomic16 *v, int16_t i )
{
  return ( __sync_add_and_fetch( &v->value, i ) == 0 );
}

static inline int mmAtomicAddTestZero32( mmAtomic32 *v, int32_t i )
{
  return ( __sync_add_and_fetch( &v->value, i ) == 0 );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicAddTestZero64( mmAtomic64 *v, int64_t i )
{
  return ( __sync_add_and_fetch( &v->value, i ) == 0 );
}
#endif


////


static inline int mmAtomicSubTestZero8( mmAtomic8 *v, int8_t i )
{
  return ( __sync_sub_and_fetch( &v->value, i ) == 0 );
}

static inline int mmAtomicSubTestZero16( mmAtomic16 *v, int16_t i )
{
  return ( __sync_sub_and_fetch( &v->value, i ) == 0 );
}

static inline int mmAtomicSubTestZero32( mmAtomic32 *v, int32_t i )
{
  return ( __sync_sub_and_fetch( &v->value, i ) == 0 );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicSubTestZero64( mmAtomic64 *v, int64_t i )
{
  return ( __sync_sub_and_fetch( &v->value, i ) == 0 );
}
#endif


////


static inline int mmAtomicAddTestNegative8( mmAtomic8 *v, int8_t i )
{
  return ( __sync_add_and_fetch( &v->value, i ) < 0 );
}

static inline int mmAtomicAddTestNegative16( mmAtomic16 *v, int16_t i )
{
  return ( __sync_add_and_fetch( &v->value, i ) < 0 );
}

static inline int mmAtomicAddTestNegative32( mmAtomic32 *v, int32_t i )
{
  return ( __sync_add_and_fetch( &v->value, i ) < 0 );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicAddTestNegative64( mmAtomic64 *v, int64_t i )
{
  return ( __sync_add_and_fetch( &v->value, i ) < 0 );
}
#endif


////


static inline int mmAtomicSubTestNegative8( mmAtomic8 *v, int8_t i )
{
  return ( __sync_sub_and_fetch( &v->value, i ) < 0 );
}

static inline int mmAtomicSubTestNegative16( mmAtomic16 *v, int16_t i )
{
  return ( __sync_sub_and_fetch( &v->value, i ) < 0 );
}

static inline int mmAtomicSubTestNegative32( mmAtomic32 *v, int32_t i )
{
  return ( __sync_sub_and_fetch( &v->value, i ) < 0 );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicSubTestNegative64( mmAtomic64 *v, int64_t i )
{
  return ( __sync_sub_and_fetch( &v->value, i ) < 0 );
}
#endif



////////////////



static inline void mmAtomicAnd8( mmAtomic8 *v, int8_t i )
{
  __sync_fetch_and_and( &v->value, i );
  return;
}

static inline void mmAtomicAnd16( mmAtomic16 *v, int16_t i )
{
  __sync_fetch_and_and( &v->value, i );
  return;
}

static inline void mmAtomicAnd32( mmAtomic32 *v, int32_t i )
{
  __sync_fetch_and_and( &v->value, i );
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicAnd64( mmAtomic64 *v, int64_t i )
{
  __sync_fetch_and_and( &v->value, i );
  return;
}
#endif


////


static inline int mmAtomicAndTestZero8( mmAtomic8 *v, int8_t i )
{
  return ( __sync_and_and_fetch( &v->value, i ) == 0 );
}

static inline int mmAtomicAndTestZero16( mmAtomic16 *v, int16_t i )
{
  return ( __sync_and_and_fetch( &v->value, i ) == 0 );
}

static inline int mmAtomicAndTestZero32( mmAtomic32 *v, int32_t i )
{
  return ( __sync_and_and_fetch( &v->value, i ) == 0 );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicAndTestZero64( mmAtomic64 *v, int64_t i )
{
  return ( __sync_and_and_fetch( &v->value, i ) == 0 );
}
#endif


////


static inline void mmAtomicOr8( mmAtomic8 *v, int8_t i )
{
  __sync_fetch_and_or( &v->value, i );
  return;
}

static inline void mmAtomicOr16( mmAtomic16 *v, int16_t i )
{
  __sync_fetch_and_or( &v->value, i );
  return;
}

static inline void mmAtomicOr32( mmAtomic32 *v, int32_t i )
{
  __sync_fetch_and_or( &v->value, i );
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicOr64( mmAtomic64 *v, int64_t i )
{
  __sync_fetch_and_or( &v->value, i );
  return;
}
#endif


////


static inline int mmAtomicOrTestZero8( mmAtomic8 *v, int8_t i )
{
  return ( __sync_or_and_fetch( &v->value, i ) == 0 );
}

static inline int mmAtomicOrTestZero16( mmAtomic16 *v, int16_t i )
{
  return ( __sync_or_and_fetch( &v->value, i ) == 0 );
}

static inline int mmAtomicOrTestZero32( mmAtomic32 *v, int32_t i )
{
  return ( __sync_or_and_fetch( &v->value, i ) == 0 );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicOrTestZero64( mmAtomic64 *v, int64_t i )
{
  return ( __sync_or_and_fetch( &v->value, i ) == 0 );
}
#endif


////


static inline void mmAtomicXor8( mmAtomic8 *v, int8_t i )
{
  __sync_fetch_and_xor( &v->value, i );
  return;
}

static inline void mmAtomicXor16( mmAtomic16 *v, int16_t i )
{
  __sync_fetch_and_xor( &v->value, i );
  return;
}

static inline void mmAtomicXor32( mmAtomic32 *v, int32_t i )
{
  __sync_fetch_and_xor( &v->value, i );
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicXor64( mmAtomic64 *v, int64_t i )
{
  __sync_fetch_and_xor( &v->value, i );
  return;
}
#endif


////


static inline int mmAtomicXorTestZero8( mmAtomic8 *v, int8_t i )
{
  return ( __sync_xor_and_fetch( &v->value, i ) == 0 );
}

static inline int mmAtomicXorTestZero16( mmAtomic16 *v, int16_t i )
{
  return ( __sync_xor_and_fetch( &v->value, i ) == 0 );
}

static inline int mmAtomicXorTestZero32( mmAtomic32 *v, int32_t i )
{
  return ( __sync_xor_and_fetch( &v->value, i ) == 0 );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicXorTestZero64( mmAtomic64 *v, int64_t i )
{
  return ( __sync_xor_and_fetch( &v->value, i ) == 0 );
}
#endif



////////////////



static inline int8_t mmAtomicXchg8( mmAtomic8 *v, int8_t i )
{
  int8_t c;
  /* No GNUC __sync for atomic exchange? What the... */
  while( c = v->value , __sync_val_compare_and_swap( &v->value, c, i ) != c );
  return c;
}

static inline int16_t mmAtomicXchg16( mmAtomic16 *v, int16_t i )
{
  int16_t c;
  /* No GNUC __sync for atomic exchange? What the... */
  while( c = v->value, __sync_val_compare_and_swap( &v->value, c, i ) != c );
  return c;
}

static inline int32_t mmAtomicXchg32( mmAtomic32 *v, int32_t i )
{
  int32_t c;
  /* No GNUC __sync for atomic exchange? What the... */
  while( c = v->value, __sync_val_compare_and_swap( &v->value, c, i ) != c );
  return c;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicXchg64( mmAtomic64 *v, int64_t i )
{
  int64_t c;
  /* No GNUC __sync for atomic exchange? What the... */
  while( __sync_val_compare_and_swap( &v->value, ( c = v->value ), i ) != c );
  return c;
}
#endif


////


static inline int8_t mmAtomicCmpXchg8( mmAtomic8 *v, int8_t old, int8_t new )
{
  return __sync_val_compare_and_swap( &v->value, old, new );
}

static inline int16_t mmAtomicCmpXchg16( mmAtomic16 *v, int16_t old, int16_t new )
{
  return __sync_val_compare_and_swap( &v->value, old, new );
}

static inline int32_t mmAtomicCmpXchg32( mmAtomic32 *v, int32_t old, int32_t new )
{
  return __sync_val_compare_and_swap( &v->value, old, new );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicCmpXchg64( mmAtomic64 *v, int64_t old, int64_t new )
{
  return __sync_val_compare_and_swap( &v->value, old, new );
}
#endif



////////////////



static inline void mmAtomicPause()
{
#if ( __SSE2__ || _M_X64 || _M_IX86_FP >= 2 )
  _mm_pause();
#elif defined(__arm__) || defined(_ARM) || defined(_M_ARM) || defined(__arm)
  __yield();
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


/* GNUC */
#endif

