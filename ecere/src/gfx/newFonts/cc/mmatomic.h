/* *****************************************************************************
 * Copyright (c) 2011-2023 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
/**
 * @file
 *
 * Atomic memory operations.
 */


#ifndef MMATOMIC_H
#define MMATOMIC_H


#if defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__x86_64) || defined(_M_X64) || defined(_M_AMD64)
 #define MMATOMIC_ARCH_AMD64 (1)
 #define MMATOMIC_POINTER_BITS (64)
#elif defined(i386) || defined(__i386) || defined(__i386__) || defined(__i386) || defined(__IA32__) || defined(_M_IX86) || defined(__X86__) || defined(_X86_)
 #define MMATOMIC_ARCH_IA32 (1)
 #define MMATOMIC_POINTER_BITS (32)
#elif defined(__aarch64__)
 #define MMATOMIC_ARCH_ARM64 (1)
 #define MMATOMIC_POINTER_BITS (64)
#elif defined(__arm__) || defined(_ARM) || defined(_M_ARM) || defined(__arm)
 #define MMATOMIC_ARCH_ARM (1)
 #define MMATOMIC_POINTER_BITS (32)
#elif defined(__EMSCRIPTEN__)
 #define MMATOMIC_ARCH_WEBASSEMBLY (1)
 #define MMATOMIC_POINTER_BITS (32)
#endif


////


#if defined(MMATOMIC_ARCH_IA32) || defined(MMATOMIC_ARCH_AMD64)

/*
Architecture Memory Ordering
Memory model for x86 and amd64
--- Aligned stores can not be partially seen by loads
--- Loads can NOT be reordered after loads
--- Loads can NOT be reordered after stores
--- Stores can NOT be reordered after stores
-X- Stores CAN be reordered after loads
--- Atomic instructions are NOT reordered with loads
--- Atomic instructions are NOT reordered with stores
--- Dependent loads can NOT be reordered
*/

/* Memory model configuration for x86/amd64 */
// #define CPUCONF_LOAD_REODERING_AFTER_LOAD
// #define CPUCONF_LOAD_REODERING_AFTER_STORE
#define CPUCONF_STORE_REODERING_AFTER_LOAD (1)
// #define CPUCONF_STORE_REODERING_AFTER_STORE
// #define CPUCONF_ATOMIC_REODERING_WITH_LOAD
// #define CPUCONF_ATOMIC_REODERING_WITH_STORE
// #define CPUCONF_DEPENDENT_REODERING

#elif defined(__arm__) || defined(_ARM) || defined(_M_ARM) || defined(__arm)

#define CPUCONF_LOAD_REODERING_AFTER_LOAD (1)
#define CPUCONF_LOAD_REODERING_AFTER_STORE (1)
#define CPUCONF_STORE_REODERING_AFTER_LOAD (1)
#define CPUCONF_STORE_REODERING_AFTER_STORE (1)
#define CPUCONF_ATOMIC_REODERING_WITH_LOAD
#define CPUCONF_ATOMIC_REODERING_WITH_STORE
// #define CPUCONF_DEPENDENT_REODERING

#else

/* Play it safe... */
#define CPUCONF_LOAD_REODERING_AFTER_LOAD (1)
#define CPUCONF_LOAD_REODERING_AFTER_STORE (1)
#define CPUCONF_STORE_REODERING_AFTER_LOAD (1)
#define CPUCONF_STORE_REODERING_AFTER_STORE (1)
#define CPUCONF_ATOMIC_REODERING_WITH_LOAD
#define CPUCONF_ATOMIC_REODERING_WITH_STORE
// #define CPUCONF_DEPENDENT_REODERING

#endif


////


/* GNUC && x86 */
#if ( defined(MMATOMIC_ARCH_IA32) || defined(MMATOMIC_ARCH_AMD64) ) && defined(__GNUC__) && !defined(MM_ATOMIC_SUPPORT)
 #include "mmatomic-gnucx86.h"
#endif

/* GNUC */
#if defined(__GNUC__) && !defined(MM_ATOMIC_SUPPORT)
 #include "mmatomic-gnuc.h"
#endif

/* MSVC */
#if defined(_MSC_VER) && !defined(MM_ATOMIC_SUPPORT)
 #include "mmatomic-msvc.h"
#endif


////


#if MM_ATOMIC_SUPPORT


////


static inline void mmAtomicSpin8( mmAtomic8 *v, int8_t old, int8_t new )
{
  for( ; mmAtomicCmpXchg8( v, old, new ) != old ; )
  {
    for( ; mmAtomicRead8( v ) != old ; )
      mmAtomicPause();
  }
  return;
}

static inline void mmAtomicSpin16( mmAtomic16 *v, int16_t old, int16_t new )
{
  for( ; mmAtomicCmpXchg16( v, old, new ) != old ; )
  {
    for( ; mmAtomicRead16( v ) != old ; )
      mmAtomicPause();
  }
  return;
}

static inline void mmAtomicSpin32( mmAtomic32 *v, int32_t old, int32_t new )
{
  for( ; mmAtomicCmpXchg32( v, old, new ) != old ; )
  {
    for( ; mmAtomicRead32( v ) != old ; )
      mmAtomicPause();
  }
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicSpin64( mmAtomic64 *v, int64_t old, int64_t new )
{
  for( ; mmAtomicCmpXchg64( v, old, new ) != old ; )
  {
    for( ; mmAtomicRead64( v ) != old ; )
      mmAtomicPause();
  }
  return;
}
#endif


static inline int mmAtomicTrySpin8( mmAtomic8 *v, int8_t old, int8_t new, int spincount )
{
  for( ; mmAtomicCmpXchg8( v, old, new ) != old ; )
  {
    for( ; mmAtomicRead8( v ) != old ; )
    {
      if( !( --spincount ) )
        return 0;
      mmAtomicPause();
    }
  }
  return 1;
}

static inline int mmAtomicTrySpin16( mmAtomic16 *v, int16_t old, int16_t new, int spincount )
{
  for( ; mmAtomicCmpXchg16( v, old, new ) != old ; )
  {
    for( ; mmAtomicRead16( v ) != old ; )
    {
      if( !( --spincount ) )
        return 0;
      mmAtomicPause();
    }
  }
  return 1;
}

static inline int mmAtomicTrySpin32( mmAtomic32 *v, int32_t old, int32_t new, int spincount )
{
  for( ; mmAtomicCmpXchg32( v, old, new ) != old ; )
  {
    for( ; mmAtomicRead32( v ) != old ; )
    {
      if( !( --spincount ) )
        return 0;
      mmAtomicPause();
    }
  }
  return 1;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicTrySpin64( mmAtomic64 *v, int64_t old, int64_t new, int spincount )
{
  for( ; mmAtomicCmpXchg64( v, old, new ) != old ; )
  {
    for( ; mmAtomicRead64( v ) != old ; )
    {
      if( !( --spincount ) )
        return 0;
      mmAtomicPause();
    }
  }
  return 1;
}
#endif


////////////////


static inline int8_t mmAtomicReadAdd8( mmAtomic8 *v, int8_t add )
{
  return mmAtomicAddRead8( v, add ) - add;
}

static inline int16_t mmAtomicReadAdd16( mmAtomic16 *v, int16_t add )
{
  return mmAtomicAddRead16( v, add ) - add;
}

static inline int32_t mmAtomicReadAdd32( mmAtomic32 *v, int32_t add )
{
  return mmAtomicAddRead32( v, add ) - add;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicReadAdd64( mmAtomic64 *v, int64_t add )
{
  return mmAtomicAddRead64( v, add ) - add;
}
#endif


////


static inline int8_t mmAtomicReadAnd8( mmAtomic8 *v, int8_t mask )
{
  int8_t i, j;
  do
  {
    i = mmAtomicRead8( v );
    j = i & mask;
  } while( mmAtomicCmpXchg8( v, i, j ) != i );
  return i;
}

static inline int16_t mmAtomicReadAnd16( mmAtomic16 *v, int16_t mask )
{
  int16_t i, j;
  do
  {
    i = mmAtomicRead16( v );
    j = i & mask;
  } while( mmAtomicCmpXchg16( v, i, j ) != i );
  return i;
}

static inline int32_t mmAtomicReadAnd32( mmAtomic32 *v, int32_t mask )
{
  int32_t i, j;
  do
  {
    i = mmAtomicRead32( v );
    j = i & mask;
  } while( mmAtomicCmpXchg32( v, i, j ) != i );
  return i;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicReadAnd64( mmAtomic64 *v, int64_t mask )
{
  int64_t i, j;
  do
  {
    i = mmAtomicRead64( v );
    j = i & mask;
  } while( mmAtomicCmpXchg64( v, i, j ) != i );
  return i;
}
#endif


////


static inline int8_t mmAtomicReadOr8( mmAtomic8 *v, int8_t mask )
{
  int8_t i, j;
  do
  {
    i = mmAtomicRead8( v );
    j = i | mask;
  } while( mmAtomicCmpXchg8( v, i, j ) != i );
  return i;
}

static inline int16_t mmAtomicReadOr16( mmAtomic16 *v, int16_t mask )
{
  int16_t i, j;
  do
  {
    i = mmAtomicRead16( v );
    j = i | mask;
  } while( mmAtomicCmpXchg16( v, i, j ) != i );
  return i;
}

static inline int32_t mmAtomicReadOr32( mmAtomic32 *v, int32_t mask )
{
  int32_t i, j;
  do
  {
    i = mmAtomicRead32( v );
    j = i | mask;
  } while( mmAtomicCmpXchg32( v, i, j ) != i );
  return i;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicReadOr64( mmAtomic64 *v, int64_t mask )
{
  int64_t i, j;
  do
  {
    i = mmAtomicRead64( v );
    j = i | mask;
  } while( mmAtomicCmpXchg64( v, i, j ) != i );
  return i;
}
#endif


////


static inline int8_t mmAtomicReadIncLoop8( mmAtomic8 *v, int8_t max )
{
  int8_t i, j;
  do
  {
    i = mmAtomicRead8( v );
    j = i + 1;
    if( j >= max )
      j = 0;
  } while( mmAtomicCmpXchg8( v, i, j ) != i );
  return i;
}

static inline int16_t mmAtomicReadIncLoop16( mmAtomic16 *v, int16_t max )
{
  int16_t i, j;
  do
  {
    i = mmAtomicRead16( v );
    j = i + 1;
    if( j >= max )
      j = 0;
  } while( mmAtomicCmpXchg16( v, i, j ) != i );
  return i;
}

static inline int32_t mmAtomicReadIncLoop32( mmAtomic32 *v, int32_t max )
{
  int32_t i, j;
  do
  {
    i = mmAtomicRead32( v );
    j = i + 1;
    if( j >= max )
      j = 0;
  } while( mmAtomicCmpXchg32( v, i, j ) != i );
  return i;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicReadIncLoop64( mmAtomic64 *v, int64_t max )
{
  int64_t i, j;
  do
  {
    i = mmAtomicRead64( v );
    j = i + 1;
    if( j >= max )
      j = 0;
  } while( mmAtomicCmpXchg64( v, i, j ) != i );
  return i;
}
#endif


////


static inline int8_t mmAtomicReadAddLoop8( mmAtomic8 *v, int8_t add, int8_t base, int8_t max )
{
  int8_t i, j;
  do
  {
    i = mmAtomicRead8( v );
    j = i + add;
    if( j >= max )
      j = base;
  } while( mmAtomicCmpXchg8( v, i, j ) != i );
  return i;
}

static inline int16_t mmAtomicReadAddLoop16( mmAtomic16 *v, int16_t add, int16_t base, int16_t max )
{
  int16_t i, j;
  do
  {
    i = mmAtomicRead16( v );
    j = i + add;
    if( j >= max )
      j = base;
  } while( mmAtomicCmpXchg16( v, i, j ) != i );
  return i;
}

static inline int32_t mmAtomicReadAddLoop32( mmAtomic32 *v, int32_t add, int32_t base, int32_t max )
{
  int32_t i, j;
  do
  {
    i = mmAtomicRead32( v );
    j = i + add;
    if( j >= max )
      j = base;
  } while( mmAtomicCmpXchg32( v, i, j ) != i );
  return i;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicReadAddLoop64( mmAtomic64 *v, int64_t add, int64_t base, int64_t max )
{
  int64_t i, j;
  do
  {
    i = mmAtomicRead64( v );
    j = i + add;
    if( j >= max )
      j = base;
  } while( mmAtomicCmpXchg64( v, i, j ) != i );
  return i;
}
#endif



////////////////



#define mmAtomicCmpReplace8(v,old,new) (mmAtomicCmpXchg8(v,old,new)==(old))
#define mmAtomicCmpReplace16(v,old,new) (mmAtomicCmpXchg16(v,old,new)==(old))
#define mmAtomicCmpReplace32(v,old,new) (mmAtomicCmpXchg32(v,old,new)==(old))
#define mmAtomicCmpReplace64(v,old,new) (mmAtomicCmpXchg64(v,old,new)==(old))


#if MMATOMIC_POINTER_BITS == 64
 #define mmAtomicP mmAtomic64
 #define MM_ATOMIC_ACCESS_P(v) (void *)MM_ATOMIC_ACCESS_64(v)
 #define mmAtomicReadP(v) (void *)mmAtomicRead64(v)
 #define mmAtomicWriteP(v,i) mmAtomicWrite64(v,(int64_t)i)
 #define mmAtomicAddP(v,i) mmAtomicAdd64(v,(int64_t)i)
 #define mmAtomicSubP(v,i) mmAtomicSub64(v,(int64_t)i)
 #define mmAtomicAddTestZeroP(v,i) mmAtomicAddTestZero64(v,(int64_t)i)
 #define mmAtomicSubTestZeroP(v,i) mmAtomicSubTestZero64(v,(int64_t)i)
 #define mmAtomicAddTestNegativeP(v,i) mmAtomicAddTestNegative64(v,(int64_t)i)
 #define mmAtomicSubTestNegativeP(v,i) mmAtomicSubTestNegative64(v,(int64_t)i)
 #define mmAtomicAndP(v,i) mmAtomicAnd64(v,(int64_t)i)
 #define mmAtomicAndTestZeroP(v,i) mmAtomicAndTestZero64(v,(int64_t)i)
 #define mmAtomicOrP(v,i) mmAtomicOr64(v,(int64_t)i)
 #define mmAtomicOrTestZeroP(v,i) mmAtomicOrTestZero64(v,(int64_t)i)
 #define mmAtomicXorP(v,i) mmAtomicXor64(v,(int64_t)i)
 #define mmAtomicXorTestZeroP(v,i) mmAtomicXorTestZero64(v,(int64_t)i)
 #define mmAtomicXchgP(v,i) (void *)mmAtomicXchg64(v,(int64_t)i)
 #define mmAtomicCmpXchgP(v,i,j) (void *)mmAtomicCmpXchg64(v,(int64_t)i,(int64_t)j)
 #define mmAtomicCmpReplaceP(v,i,j) mmAtomicCmpReplace64(v,(int64_t)i,(int64_t)j)
 #define mmAtomicSpinP(v,i,j) (void *)mmAtomicSpin64(v,(int64_t)i,(int64_t)j)
 #define mmAtomicAddReadP(v,i) (void *)mmAtomicAddRead64(v,(int64_t)i)
#elif MMATOMIC_POINTER_BITS == 32
 #define mmAtomicP mmAtomic32
 #define MM_ATOMIC_ACCESS_P(v) (void *)MM_ATOMIC_ACCESS_32(v)
 #define mmAtomicReadP(v) (void *)mmAtomicRead32(v)
 #define mmAtomicWriteP(v,i) mmAtomicWrite32(v,(int32_t)i)
 #define mmAtomicAddP(v,i) mmAtomicAdd32(v,(int32_t)i)
 #define mmAtomicSubP(v,i) mmAtomicSub32(v,(int32_t)i)
 #define mmAtomicAddTestZeroP(v,i) mmAtomicAddTestZero32(v,(int32_t)i)
 #define mmAtomicSubTestZeroP(v,i) mmAtomicSubTestZero32(v,(int32_t)i)
 #define mmAtomicAddTestNegativeP(v,i) mmAtomicAddTestNegative32(v,(int32_t)i)
 #define mmAtomicSubTestNegativeP(v,i) mmAtomicSubTestNegative32(v,(int32_t)i)
 #define mmAtomicAndP(v,i) mmAtomicAnd32(v,(int32_t)i)
 #define mmAtomicAndTestZeroP(v,i) mmAtomicAndTestZero32(v,(int32_t)i)
 #define mmAtomicOrP(v,i) mmAtomicOr32(v,(int32_t)i)
 #define mmAtomicOrTestZeroP(v,i) mmAtomicOrTestZero32(v,(int32_t)i)
 #define mmAtomicXorP(v,i) mmAtomicXor32(v,(int32_t)i)
 #define mmAtomicXorTestZeroP(v,i) mmAtomicXorTestZero32(v,(int32_t)i)
 #define mmAtomicXchgP(v,i) (void *)mmAtomicXchg32(v,(int32_t)i)
 #define mmAtomicCmpXchgP(v,i,j) (void *)mmAtomicCmpXchg32(v,(int32_t)i,(int32_t)j)
 #define mmAtomicCmpReplaceP(v,i,j) mmAtomicCmpReplace32(v,(int32_t)i,(int32_t)j)
 #define mmAtomicSpinP(v,i,j) (void *)mmAtomicSpin32(v,(int32_t)i,(int32_t)j)
 #define mmAtomicAddReadP(v,i) (void *)mmAtomicAddRead32(v,(int32_t)i)
#else
 #error MMATOMIC_POINTER_BITS undefined
#endif

#if MM_ATOMIC_64_BITS_SUPPORT
 #ifndef intlarge
  #define intlarge int64_t
 #endif
 #ifndef uintlarge
  #define uintlarge uint64_t
 #endif
 #define mmAtomicL mmAtomic64
 #define MM_ATOMIC_ACCESS_L(v) MM_ATOMIC_ACCESS_64(v)
 #define mmAtomicReadL(v) mmAtomicRead64(v)
 #define mmAtomicWriteL(v,i) mmAtomicWrite64(v,i)
 #define mmAtomicAddL(v,i) mmAtomicAdd64(v,i)
 #define mmAtomicSubL(v,i) mmAtomicSub64(v,i)
 #define mmAtomicAddTestZeroL(v,i) mmAtomicAddTestZero64(v,i)
 #define mmAtomicSubTestZeroL(v,i) mmAtomicSubTestZero64(v,i)
 #define mmAtomicAddTestNegativeL(v,i) mmAtomicAddTestNegative64(v,i)
 #define mmAtomicSubTestNegativeL(v,i) mmAtomicSubTestNegative64(v,i)
 #define mmAtomicAndL(v,i) mmAtomicAnd64(v,i)
 #define mmAtomicAndTestZeroL(v,i) mmAtomicAndTestZero64(v,i)
 #define mmAtomicOrL(v,i) mmAtomicOr64(v,i)
 #define mmAtomicOrTestZeroL(v,i) mmAtomicOrTestZero64(v,i)
 #define mmAtomicXorL(v,i) mmAtomicXor64(v,i)
 #define mmAtomicXorTestZeroL(v,i) mmAtomicXorTestZero64(v,i)
 #define mmAtomicXchgL(v,i) mmAtomicXchg64(v,i)
 #define mmAtomicCmpXchgL(v,i,j) mmAtomicCmpXchg64(v,i,j)
 #define mmAtomicCmpReplaceL(v,i,j) mmAtomicCmpReplace64(v,i,j)
 #define mmAtomicSpinL(v,i,j) mmAtomicSpin64(v,i,j)
 #define mmAtomicAddReadL(v,i) mmAtomicAddRead64(v,(int64_t)i)
#else
 #ifndef intlarge
  #define intlarge int32_t
 #endif
 #ifndef uintlarge
  #define uintlarge uint32_t
 #endif
 #define mmAtomicL mmAtomic32
 #define MM_ATOMIC_ACCESS_L(v) MM_ATOMIC_ACCESS_32(v)
 #define mmAtomicReadL(v) mmAtomicRead32(v)
 #define mmAtomicWriteL(v,i) mmAtomicWrite32(v,i)
 #define mmAtomicAddL(v,i) mmAtomicAdd32(v,i)
 #define mmAtomicSubL(v,i) mmAtomicSub32(v,i)
 #define mmAtomicAddTestZeroL(v,i) mmAtomicAddTestZero32(v,i)
 #define mmAtomicSubTestZeroL(v,i) mmAtomicSubTestZero32(v,i)
 #define mmAtomicAddTestNegativeL(v,i) mmAtomicAddTestNegative32(v,i)
 #define mmAtomicSubTestNegativeL(v,i) mmAtomicSubTestNegative32(v,i)
 #define mmAtomicAndL(v,i) mmAtomicAnd32(v,i)
 #define mmAtomicAndTestZeroL(v,i) mmAtomicAndTestZero32(v,i)
 #define mmAtomicOrL(v,i) mmAtomicOr32(v,i)
 #define mmAtomicOrTestZeroL(v,i) mmAtomicOrTestZero32(v,i)
 #define mmAtomicXorL(v,i) mmAtomicXor32(v,i)
 #define mmAtomicXorTestZeroL(v,i) mmAtomicXorTestZero32(v,i)
 #define mmAtomicXchgL(v,i) mmAtomicXchg32(v,i)
 #define mmAtomicCmpXchgL(v,i,j) mmAtomicCmpXchg32(v,i,j)
 #define mmAtomicCmpReplaceL(v,i,j) mmAtomicCmpReplace32(v,i,j)
 #define mmAtomicSpinL(v,i,j) mmAtomicSpin32(v,i,j)
 #define mmAtomicAddReadL(v,i) mmAtomicAddRead32(v,(int32_t)i)
#endif



////////////////



typedef struct { mmAtomic8 v; } mmAtomicLock8;

#define MM_ATOMIC_LOCK8_WRITE (-((int8_t)0x7f))

static inline void mmAtomicLockInit8( mmAtomicLock8 *v )
{
  mmAtomicWrite8( &v->v, 0 );
  return;
}

static inline int mmAtomicLockAttemptRead8( mmAtomicLock8 *v )
{
  if( mmAtomicAddTestNegative8( &v->v, 1 ) )
  {
    mmAtomicAdd8( &v->v, -1 );
    return 0;
  }
  return 1;
}

static inline int mmAtomicLockAttemptWrite8( mmAtomicLock8 *v )
{
  if( mmAtomicCmpXchg8( &v->v, 0, MM_ATOMIC_LOCK8_WRITE ) )
    return 0;
  return 1;
}

static inline void mmAtomicLockSpinRead8( mmAtomicLock8 *v )
{
  for( ; ; )
  {
    for( ; mmAtomicRead8( &v->v ) < 0 ; )
      mmAtomicPause();
    if( !( mmAtomicAddTestNegative8( &v->v, 1 ) ) )
      break;
    mmAtomicAdd8( &v->v, -1 );
  }
  return;
}

static inline void mmAtomicLockSpinWrite8( mmAtomicLock8 *v )
{
  for( ; ; )
  {
    for( ; mmAtomicRead8( &v->v ) ; )
      mmAtomicPause();
    if( !( mmAtomicCmpXchg8( &v->v, 0, MM_ATOMIC_LOCK8_WRITE ) ) )
      break;
  }
  return;
}

static inline int mmAtomicLockTryRead8( mmAtomicLock8 *v, int spincount )
{
  do
  {
    if( mmAtomicRead8( &v->v ) < 0 )
      mmAtomicPause();
    else
    {
      if( !( mmAtomicAddTestNegative8( &v->v, 1 ) ) )
        return 1;
      mmAtomicAdd8( &v->v, -1 );
    }
  } while( --spincount );
  return 0;
}

static inline int mmAtomicLockTryWrite8( mmAtomicLock8 *v, int spincount )
{
  do
  {
    if( mmAtomicRead8( &v->v ) )
      mmAtomicPause();
    else
    {
      if( !( mmAtomicCmpXchg8( &v->v, 0, MM_ATOMIC_LOCK8_WRITE ) ) )
        return 1;
    }
  } while( --spincount );
  return 0;
}

static inline void mmAtomicLockDoneRead8( mmAtomicLock8 *v )
{
  mmAtomicAdd8( &v->v, -1 );
  return;
}

static inline void mmAtomicLockDoneWrite8( mmAtomicLock8 *v )
{
  mmAtomicAdd8( &v->v, -MM_ATOMIC_LOCK8_WRITE );
  return;
}


////


typedef struct { mmAtomic16 v; } mmAtomicLock16;

#define MM_ATOMIC_LOCK16_WRITE (-((int16_t)0x7fff))

static inline void mmAtomicLockInit16( mmAtomicLock16 *v )
{
  mmAtomicWrite16( &v->v, 0 );
  return;
}

static inline int mmAtomicLockAttemptRead16( mmAtomicLock16 *v )
{
  if( mmAtomicAddTestNegative16( &v->v, 1 ) )
  {
    mmAtomicAdd16( &v->v, -1 );
    return 0;
  }
  return 1;
}

static inline int mmAtomicLockAttemptWrite16( mmAtomicLock16 *v )
{
  if( mmAtomicCmpXchg16( &v->v, 0, MM_ATOMIC_LOCK16_WRITE ) )
    return 0;
  return 1;
}

static inline void mmAtomicLockSpinRead16( mmAtomicLock16 *v )
{
  for( ; ; )
  {
    for( ; mmAtomicRead16( &v->v ) < 0 ; )
      mmAtomicPause();
    if( !( mmAtomicAddTestNegative16( &v->v, 1 ) ) )
      break;
    mmAtomicAdd16( &v->v, -1 );
  }
  return;
}

static inline void mmAtomicLockSpinWrite16( mmAtomicLock16 *v )
{
  for( ; ; )
  {
    for( ; mmAtomicRead16( &v->v ) ; )
      mmAtomicPause();
    if( !( mmAtomicCmpXchg16( &v->v, 0, MM_ATOMIC_LOCK16_WRITE ) ) )
      break;
  }
  return;
}

static inline int mmAtomicLockTryRead16( mmAtomicLock16 *v, int spincount )
{
  do
  {
    if( mmAtomicRead16( &v->v ) < 0 )
      mmAtomicPause();
    else
    {
      if( !( mmAtomicAddTestNegative16( &v->v, 1 ) ) )
        return 1;
      mmAtomicAdd16( &v->v, -1 );
    }
  } while( --spincount );
  return 0;
}

static inline int mmAtomicLockTryWrite16( mmAtomicLock16 *v, int spincount )
{
  do
  {
    if( mmAtomicRead16( &v->v ) )
      mmAtomicPause();
    else
    {
      if( !( mmAtomicCmpXchg16( &v->v, 0, MM_ATOMIC_LOCK16_WRITE ) ) )
        return 1;
    }
  } while( --spincount );
  return 0;
}

static inline void mmAtomicLockDoneRead16( mmAtomicLock16 *v )
{
  mmAtomicAdd16( &v->v, -1 );
  return;
}

static inline void mmAtomicLockDoneWrite16( mmAtomicLock16 *v )
{
  mmAtomicAdd16( &v->v, -MM_ATOMIC_LOCK16_WRITE );
  return;
}


////


typedef struct { mmAtomic32 v; } mmAtomicLock32;

#define MM_ATOMIC_LOCK32_WRITE (-((int32_t)0x10000000))

static inline void mmAtomicLockInit32( mmAtomicLock32 *v )
{
  mmAtomicWrite32( &v->v, 0 );
  return;
}

static inline int mmAtomicLockAttemptRead32( mmAtomicLock32 *v )
{
  if( mmAtomicAddTestNegative32( &v->v, 1 ) )
  {
    mmAtomicAdd32( &v->v, -1 );
    return 0;
  }
  return 1;
}

static inline int mmAtomicLockAttemptWrite32( mmAtomicLock32 *v )
{
  if( mmAtomicCmpXchg32( &v->v, 0, MM_ATOMIC_LOCK32_WRITE ) )
    return 0;
  return 1;
}

static inline void mmAtomicLockSpinRead32( mmAtomicLock32 *v )
{
  for( ; ; )
  {
    for( ; mmAtomicRead32( &v->v ) < 0 ; )
      mmAtomicPause();
    if( !( mmAtomicAddTestNegative32( &v->v, 1 ) ) )
      break;
    mmAtomicAdd32( &v->v, -1 );
  }
  return;
}

static inline void mmAtomicLockSpinWrite32( mmAtomicLock32 *v )
{
  for( ; ; )
  {
    for( ; mmAtomicRead32( &v->v ) ; )
      mmAtomicPause();
    if( !( mmAtomicCmpXchg32( &v->v, 0, MM_ATOMIC_LOCK32_WRITE ) ) )
      break;
  }
  return;
}

static inline int mmAtomicLockTryRead32( mmAtomicLock32 *v, int spincount )
{
  do
  {
    if( mmAtomicRead32( &v->v ) < 0 )
      mmAtomicPause();
    else
    {
      if( !( mmAtomicAddTestNegative32( &v->v, 1 ) ) )
        return 1;
      mmAtomicAdd32( &v->v, -1 );
    }
  } while( --spincount );
  return 0;
}

static inline int mmAtomicLockTryWrite32( mmAtomicLock32 *v, int spincount )
{
  do
  {
    if( mmAtomicRead32( &v->v ) )
      mmAtomicPause();
    else
    {
      if( !( mmAtomicCmpXchg32( &v->v, 0, MM_ATOMIC_LOCK32_WRITE ) ) )
        return 1;
    }
  } while( --spincount );
  return 0;
}

static inline void mmAtomicLockDoneRead32( mmAtomicLock32 *v )
{
  mmAtomicAdd32( &v->v, -1 );
  return;
}

static inline void mmAtomicLockDoneWrite32( mmAtomicLock32 *v )
{
  mmAtomicAdd32( &v->v, -MM_ATOMIC_LOCK32_WRITE );
  return;
}


////


#if MM_ATOMIC_64_BITS_SUPPORT

typedef struct { mmAtomic64 v; } mmAtomicLock64;

#define MM_ATOMIC_LOCK64_WRITE (-((int64_t)0x7fffffffffffffff))

static inline void mmAtomicLockInit64( mmAtomicLock64 *v )
{
  mmAtomicWrite64( &v->v, 0 );
  return;
}

static inline int mmAtomicLockAttemptRead64( mmAtomicLock64 *v )
{
  if( mmAtomicAddTestNegative64( &v->v, 1 ) )
  {
    mmAtomicAdd64( &v->v, -1 );
    return 0;
  }
  return 1;
}

static inline int mmAtomicLockAttemptWrite64( mmAtomicLock64 *v )
{
  if( mmAtomicCmpXchg64( &v->v, 0, MM_ATOMIC_LOCK64_WRITE ) )
    return 0;
  return 1;
}

static inline void mmAtomicLockSpinRead64( mmAtomicLock64 *v )
{
  for( ; ; )
  {
    for( ; mmAtomicRead64( &v->v ) < 0 ; )
      mmAtomicPause();
    if( !( mmAtomicAddTestNegative64( &v->v, 1 ) ) )
      break;
    mmAtomicAdd64( &v->v, -1 );
  }
  return;
}

static inline void mmAtomicLockSpinWrite64( mmAtomicLock64 *v )
{
  for( ; ; )
  {
    for( ; mmAtomicRead64( &v->v ) ; )
      mmAtomicPause();
    if( !( mmAtomicCmpXchg64( &v->v, 0, MM_ATOMIC_LOCK64_WRITE ) ) )
      break;
  }
  return;
}

static inline int mmAtomicLockTryRead64( mmAtomicLock64 *v, int spincount )
{
  do
  {
    if( mmAtomicRead64( &v->v ) < 0 )
      mmAtomicPause();
    else
    {
      if( !( mmAtomicAddTestNegative64( &v->v, 1 ) ) )
        return 1;
      mmAtomicAdd64( &v->v, -1 );
    }
  } while( --spincount );
  return 0;
}

static inline int mmAtomicLockTryWrite64( mmAtomicLock64 *v, int spincount )
{
  do
  {
    if( mmAtomicRead64( &v->v ) )
      mmAtomicPause();
    else
    {
      if( !( mmAtomicCmpXchg64( &v->v, 0, MM_ATOMIC_LOCK64_WRITE ) ) )
        return 1;
    }
  } while( --spincount );
  return 0;
}

static inline void mmAtomicLockDoneRead64( mmAtomicLock64 *v )
{
  mmAtomicAdd64( &v->v, -1 );
  return;
}

static inline void mmAtomicLockDoneWrite64( mmAtomicLock64 *v )
{
  mmAtomicAdd64( &v->v, -MM_ATOMIC_LOCK64_WRITE );
  return;
}

#endif


////


typedef struct { mmAtomic32 v; } mmAtomicFloat;

static inline int32_t mmAtomicFloatToInt( float f )
{
  union
  {
    int32_t i;
    float f;
  } u;
  u.f = f;
  return u.i;
}

static inline float mmAtomicIntToFloat( int32_t i )
{
  union
  {
    int32_t i;
    float f;
  } u;
  u.i = i;
  return u.f;
}

static inline float mmAtomicReadFloat( mmAtomicFloat *v )
{
  mmBarrier();
  return mmAtomicIntToFloat( v->v.value );
}

static inline void mmAtomicWriteFloat( mmAtomicFloat *v, float f )
{
  mmBarrier();
  v->v.value = mmAtomicFloatToInt( f );
  return;
}

static inline void mmAtomicBarrierWriteFloat( mmAtomicFloat *v, float f )
{
  mmBarrier();
  v->v.value = mmAtomicFloatToInt( f );
  return;
}

static inline void mmAtomicAddFloat( mmAtomicFloat *v, float f )
{
  int32_t old;
  float new;
  for( ; ; )
  {
    old = v->v.value;
    new = mmAtomicIntToFloat( old ) + f;
    if( mmAtomicCmpXchg32( &v->v, old, mmAtomicFloatToInt( new ) ) == old )
      break;
  }
  return;
}

static inline void mmAtomicSubFloat( mmAtomicFloat *v, float f )
{
  int32_t old;
  float new;
  for( ; ; )
  {
    old = v->v.value;
    new = mmAtomicIntToFloat( old ) - f;
    if( mmAtomicCmpXchg32( &v->v, old, mmAtomicFloatToInt( new ) ) == old )
      break;
  }
  return;
}

static inline float mmAtomicAddReadFloat( mmAtomicFloat *v, float f )
{
  int32_t old;
  float new;
  for( ; ; )
  {
    old = v->v.value;
    new = mmAtomicIntToFloat( old ) + f;
    if( mmAtomicCmpXchg32( &v->v, old, mmAtomicFloatToInt( new ) ) == old )
      break;
  }
  return new;
}

static inline float mmAtomicSubReadFloat( mmAtomicFloat *v, float f )
{
  int32_t old;
  float new;
  for( ; ; )
  {
    old = v->v.value;
    new = mmAtomicIntToFloat( old ) - f;
    if( mmAtomicCmpXchg32( &v->v, old, mmAtomicFloatToInt( new ) ) == old )
      break;
  }
  return new;
}

static inline float mmAtomicXchgFloat( mmAtomicFloat *v, float f )
{
  return mmAtomicIntToFloat( mmAtomicXchg32( &v->v, mmAtomicFloatToInt( f ) ) );
}

static inline float mmAtomicCmpXchgFloat( mmAtomicFloat *v, float old, float new )
{
  return mmAtomicIntToFloat( mmAtomicCmpXchg32( &v->v, mmAtomicFloatToInt( old ), mmAtomicFloatToInt( new ) ) );
}


#define mmAtomicCmpReplaceFloat(v,old,new) (mmAtomicCmpXchgFloat(v,old,new)==(old))


////


#if MM_ATOMIC_64_BITS_SUPPORT

typedef struct { mmAtomic64 v; } mmAtomicDouble;

static inline int64_t mmAtomicDoubleToInt( double f )
{
  union
  {
    int64_t i;
    double f;
  } u;
  u.f = f;
  return u.i;
}

static inline double mmAtomicIntToDouble( int64_t i )
{
  union
  {
    int64_t i;
    double f;
  } u;
  u.i = i;
  return u.f;
}

static inline double mmAtomicReadDouble( mmAtomicDouble *v )
{
  mmBarrier();
  return mmAtomicIntToDouble( v->v.value );
}

static inline void mmAtomicWriteDouble( mmAtomicDouble *v, float f )
{
  mmBarrier();
  v->v.value = mmAtomicDoubleToInt( f );
  return;
}

static inline void mmAtomicBarrierWriteDouble( mmAtomicDouble *v, float f )
{
  mmBarrier();
  v->v.value = mmAtomicDoubleToInt( f );
  return;
}

static inline void mmAtomicAddDouble( mmAtomicDouble *v, float f )
{
  int64_t old;
  float new;
  for( ; ; )
  {
    old = v->v.value;
    new = mmAtomicIntToDouble( old ) + f;
    if( mmAtomicCmpXchg64( &v->v, old, mmAtomicDoubleToInt( new ) ) == old )
      break;
  }
  return;
}

static inline void mmAtomicSubDouble( mmAtomicDouble *v, float f )
{
  int64_t old;
  float new;
  for( ; ; )
  {
    old = v->v.value;
    new = mmAtomicIntToDouble( old ) - f;
    if( mmAtomicCmpXchg64( &v->v, old, mmAtomicDoubleToInt( new ) ) == old )
      break;
  }
  return;
}

static inline float mmAtomicAddReadDouble( mmAtomicDouble *v, float f )
{
  int64_t old;
  float new;
  for( ; ; )
  {
    old = v->v.value;
    new = mmAtomicIntToDouble( old ) + f;
    if( mmAtomicCmpXchg64( &v->v, old, mmAtomicDoubleToInt( new ) ) == old )
      break;
  }
  return new;
}

static inline float mmAtomicSubReadDouble( mmAtomicDouble *v, float f )
{
  int64_t old;
  float new;
  for( ; ; )
  {
    old = v->v.value;
    new = mmAtomicIntToDouble( old ) - f;
    if( mmAtomicCmpXchg64( &v->v, old, mmAtomicDoubleToInt( new ) ) == old )
      break;
  }
  return new;
}

static inline float mmAtomicXchgDouble( mmAtomicDouble *v, float f )
{
  return mmAtomicIntToDouble( mmAtomicXchg64( &v->v, mmAtomicDoubleToInt( f ) ) );
}

static inline float mmAtomicCmpXchgDouble( mmAtomicDouble *v, float old, float new )
{
  return mmAtomicIntToDouble( mmAtomicCmpXchg64( &v->v, mmAtomicDoubleToInt( old ), mmAtomicDoubleToInt( new ) ) );
}


#define mmAtomicCmpReplaceDouble(v,old,new) (mmAtomicCmpXchgDouble(v,old,new)==(old))


#endif


////


#else
 #if defined(__GNUC__) || defined(__INTEL_COMPILER) || defined(__clang__)
  #warning mmatomic.h: No atomic support
 #else
  #pragma message ( "Warning: No atomic support" )
 #endif
#endif


////


#endif

