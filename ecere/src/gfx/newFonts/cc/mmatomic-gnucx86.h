/* *****************************************************************************
 * Copyright (c) 2011-2023 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
#ifndef MMATOMIC_H
 #warning Do not include directly, include mmatomic.h
#endif


////


/* GNUC && ( x86 || amd64 ) */
#if ( defined(MMATOMIC_ARCH_IA32) || defined(MMATOMIC_ARCH_AMD64) ) && defined(__GNUC__) && !defined(MM_ATOMIC_SUPPORT)


////


#define MM_ATOMIC_SUPPORT (1)

#if MMATOMIC_ARCH_AMD64
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
  __asm__ __volatile__( ""::: "memory" );
  return;
}

/* All previous loads must complete before future loads */
static inline void mmLoadLoadBarrier()
{
  /* x86/AMD64 don't normally reorder loads ~ different rules apply to WC/WT/UC memory */
  return;
}

/* All previous loads must complete before future stores */
static inline void mmLoadStoreBarrier()
{
  /* x86/AMD64 don't normally reorder stores ~ different rules apply to WC/WT/UC memory */
  /* The sfence instruction is useless unless using streaming stores or chatting with devices on MMIO */
  __asm__ __volatile__( ""::: "memory" );
  return;
}

/* All previous stores must complete before future loads */
static inline void mmStoreLoadBarrier()
{
#if MMATOMIC_ARCH_AMD64
  __asm__ __volatile__( "lock ; addl $0,(%%rsp)"::: "memory", "cc" );
#else
  __asm__ __volatile__( "lock ; addl $0,(%%esp)"::: "memory", "cc" );
#endif
  return;
}

/* All previous stores must complete before future stores */
static inline void mmStoreStoreBarrier()
{
  /* x86/AMD64 don't normally reorder stores ~ different rules apply to WC/WT/UC memory */
  /* The sfence instruction is useless unless using streaming stores or chatting with devices on MMIO */
  __asm__ __volatile__( ""::: "memory" );
  return;
}

/* All previous loads/stores must complete before future loads/stores */
static inline void mmFullBarrier()
{
#if MMATOMIC_ARCH_AMD64
  __asm__ __volatile__( "lock ; addl $0,(%%rsp)"::: "memory", "cc" );
#else
  __asm__ __volatile__( "lock ; addl $0,(%%esp)"::: "memory", "cc" );
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
  __asm__ __volatile__(
    "lock ; xchgb %0,%1"
    :"=q"(i)
    :"m"(v->value), "0"(i) : "memory", "cc" );
  return;
}

static inline void mmAtomicBarrierWrite16( mmAtomic16 *v, int16_t i )
{
  __asm__ __volatile__(
    "lock ; xchgw %0,%1"
    :"=q"(i)
    :"m"(v->value), "0"(i) : "memory", "cc" );
  return;
}

static inline void mmAtomicBarrierWrite32( mmAtomic32 *v, int32_t i )
{
  __asm__ __volatile__(
    "lock ; xchgl %0,%1"
    :"=q"(i)
    :"m"(v->value), "0"(i) : "memory", "cc" );
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicBarrierWrite64( mmAtomic64 *v, int64_t i )
{
  __asm__ __volatile__(
    "lock ; xchgq %0,%1"
    :"=q"(i)
    :"m"(v->value), "0"(i) : "memory", "cc" );
  return;
}
#endif


////


static inline void mmAtomicAdd8( mmAtomic8 *v, int8_t i )
{
  __asm__ __volatile__(
    "lock ; addb %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}

static inline void mmAtomicAdd16( mmAtomic16 *v, int16_t i )
{
  __asm__ __volatile__(
    "lock ; addw %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}

static inline void mmAtomicAdd32( mmAtomic32 *v, int32_t i )
{
  __asm__ __volatile__(
    "lock ; addl %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicAdd64( mmAtomic64 *v, int64_t i )
{
  __asm__ __volatile__(
    "lock ; addq %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}
#endif


////


static inline void mmAtomicSub8( mmAtomic8 *v, int8_t i )
{
  __asm__ __volatile__(
    "lock ; subb %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}

static inline void mmAtomicSub16( mmAtomic16 *v, int16_t i )
{
  __asm__ __volatile__(
    "lock ; subw %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}

static inline void mmAtomicSub32( mmAtomic32 *v, int32_t i )
{
  __asm__ __volatile__(
    "lock ; subl %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicSub64( mmAtomic64 *v, int64_t i )
{
  __asm__ __volatile__(
    "lock ; subq %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}
#endif


////


static inline int8_t mmAtomicAddRead8( mmAtomic8 *v, int8_t i )
{
  int8_t value;
  value = i;
  __asm__ __volatile__(
    "lock; xaddl %0,%1"
    :"=r"(i), "=m"(v->value)
    :"0"(i), "m"(v->value) : "memory", "cc" );
   return value + i;
}

static inline int16_t mmAtomicAddRead16( mmAtomic16 *v, int16_t i )
{
  int16_t value;
  value = i;
  __asm__ __volatile__(
    "lock; xaddw %0,%1"
    :"=r"(i), "=m"(v->value)
    :"0"(i), "m"(v->value) : "memory", "cc" );
   return value + i;
}

static inline int32_t mmAtomicAddRead32( mmAtomic32 *v, int32_t i )
{
  int32_t value;
  value = i;
  __asm__ __volatile__(
    "lock; xaddl %0,%1"
    :"=r"(i), "=m"(v->value)
    :"0"(i), "m"(v->value) : "memory", "cc" );
   return value + i;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicAddRead64( mmAtomic64 *v, int64_t i )
{
  int64_t value;
  value = i;
  __asm__ __volatile__(
    "lock; xaddq %0,%1"
    :"=r"(i), "=m"(v->value)
    :"0"(i), "m"(v->value) : "memory", "cc" );
   return value + i;
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
  unsigned char c;
  __asm__ __volatile__(
    "lock ; addb %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

static inline int mmAtomicAddTestZero16( mmAtomic16 *v, int16_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; addw %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

static inline int mmAtomicAddTestZero32( mmAtomic32 *v, int32_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; addl %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicAddTestZero64( mmAtomic64 *v, int64_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; addq %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}
#endif


////


static inline int mmAtomicSubTestZero8( mmAtomic8 *v, int8_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; subb %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

static inline int mmAtomicSubTestZero16( mmAtomic16 *v, int16_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; subw %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

static inline int mmAtomicSubTestZero32( mmAtomic32 *v, int32_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; subl %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicSubTestZero64( mmAtomic64 *v, int64_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; subq %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}
#endif


////


static inline int mmAtomicAddTestNegative8( mmAtomic8 *v, int8_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; addb %2,%0 ; sets %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

static inline int mmAtomicAddTestNegative16( mmAtomic16 *v, int16_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; addw %2,%0 ; sets %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

static inline int mmAtomicAddTestNegative32( mmAtomic32 *v, int32_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; addl %2,%0 ; sets %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicAddTestNegative64( mmAtomic64 *v, int64_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; addq %2,%0 ; sets %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}
#endif


////


static inline int mmAtomicSubTestNegative8( mmAtomic8 *v, int8_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; subb %2,%0 ; sets %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

static inline int mmAtomicSubTestNegative16( mmAtomic16 *v, int16_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; subw %2,%0 ; sets %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

static inline int mmAtomicSubTestNegative32( mmAtomic32 *v, int32_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; subl %2,%0 ; sets %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicSubTestNegative64( mmAtomic64 *v, int64_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; subq %2,%0 ; sets %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}
#endif



////////////////



static inline void mmAtomicAnd8( mmAtomic8 *v, int8_t i )
{
  __asm__ __volatile__(
    "lock ; andb %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}

static inline void mmAtomicAnd16( mmAtomic16 *v, int16_t i )
{
  __asm__ __volatile__(
    "lock ; andw %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}

static inline void mmAtomicAnd32( mmAtomic32 *v, int32_t i )
{
  __asm__ __volatile__(
    "lock ; andl %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicAnd64( mmAtomic64 *v, int64_t i )
{
  __asm__ __volatile__(
    "lock ; andq %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}
#endif


////


static inline int mmAtomicAndTestZero8( mmAtomic8 *v, int8_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; andb %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

static inline int mmAtomicAndTestZero16( mmAtomic16 *v, int16_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; andw %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

static inline int mmAtomicAndTestZero32( mmAtomic32 *v, int32_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; andl %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicAndTestZero64( mmAtomic64 *v, int64_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; andq %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}
#endif


////


static inline void mmAtomicOr8( mmAtomic8 *v, int8_t i )
{
  __asm__ __volatile__(
    "lock ; orb %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}

static inline void mmAtomicOr16( mmAtomic16 *v, int16_t i )
{
  __asm__ __volatile__(
    "lock ; orw %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}

static inline void mmAtomicOr32( mmAtomic32 *v, int32_t i )
{
  __asm__ __volatile__(
    "lock ; orl %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicOr64( mmAtomic64 *v, int64_t i )
{
  __asm__ __volatile__(
    "lock ; orq %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}
#endif


////


static inline int mmAtomicOrTestZero8( mmAtomic8 *v, int8_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; orb %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

static inline int mmAtomicOrTestZero16( mmAtomic16 *v, int16_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; orw %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

static inline int mmAtomicOrTestZero32( mmAtomic32 *v, int32_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; orl %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicOrTestZero64( mmAtomic64 *v, int64_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; orq %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}
#endif


////


static inline void mmAtomicXor8( mmAtomic8 *v, int8_t i )
{
  __asm__ __volatile__(
    "lock ; xorb %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}

static inline void mmAtomicXor16( mmAtomic16 *v, int16_t i )
{
  __asm__ __volatile__(
    "lock ; xorw %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}

static inline void mmAtomicXor32( mmAtomic32 *v, int32_t i )
{
  __asm__ __volatile__(
    "lock ; xorl %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicXor64( mmAtomic64 *v, int64_t i )
{
  __asm__ __volatile__(
    "lock ; xorq %1,%0"
    :"=m"(v->value)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
}
#endif


////


static inline int mmAtomicXorTestZero8( mmAtomic8 *v, int8_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; xorb %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

static inline int mmAtomicXorTestZero16( mmAtomic16 *v, int16_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; xorw %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

static inline int mmAtomicXorTestZero32( mmAtomic32 *v, int32_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; xorl %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int mmAtomicXorTestZero64( mmAtomic64 *v, int64_t i )
{
  unsigned char c;
  __asm__ __volatile__(
    "lock ; xorq %2,%0 ; setz %1"
    :"=m"(v->value), "=qm"(c)
    :"ir"(i), "m"(v->value) : "memory", "cc" );
  return c;
}
#endif



////////////////



static inline int8_t mmAtomicXchg8( mmAtomic8 *v, int8_t i )
{
  __asm__ __volatile__(
    "lock ; xchgb %0,%1"
    :"=q"(i)
    :"m"(v->value), "0"(i) : "memory", "cc" );
  return i;
}

static inline int16_t mmAtomicXchg16( mmAtomic16 *v, int16_t i )
{
  __asm__ __volatile__(
    "lock ; xchgw %0,%1"
    :"=q"(i)
    :"m"(v->value), "0"(i) : "memory", "cc" );
  return i;
}

static inline int32_t mmAtomicXchg32( mmAtomic32 *v, int32_t i )
{
  __asm__ __volatile__(
    "lock ; xchgl %0,%1"
    :"=q"(i)
    :"m"(v->value), "0"(i) : "memory", "cc" );
  return i;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicXchg64( mmAtomic64 *v, int64_t i )
{
  __asm__ __volatile__(
    "lock ; xchgq %0,%1"
    :"=q"(i)
    :"m"(v->value), "0"(i) : "memory", "cc" );
  return i;
}
#endif


////


static inline int8_t mmAtomicCmpXchg8( mmAtomic8 *v, int8_t old, int8_t new )
{
  int8_t prev;
  __asm__ __volatile__(
    "lock ; cmpxchgb %1,%2"
    :"=a"(prev)
    :"r"(new), "m"(v->value), "a"(old) : "memory", "cc" );
  return prev;
}

static inline int16_t mmAtomicCmpXchg16( mmAtomic16 *v, int16_t old, int16_t new )
{
  int16_t prev;
  __asm__ __volatile__(
    "lock ; cmpxchgw %1,%2"
    :"=a"(prev)
    :"r"(new), "m"(v->value), "a"(old) : "memory", "cc" );
  return prev;
}

static inline int32_t mmAtomicCmpXchg32( mmAtomic32 *v, int32_t old, int32_t new )
{
  int32_t prev;
  __asm__ __volatile__(
    "lock ; cmpxchgl %1,%2"
    :"=a"(prev)
    :"r"(new), "m"(v->value), "a"(old) : "memory", "cc" );
  return prev;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int64_t mmAtomicCmpXchg64( mmAtomic64 *v, int64_t old, int64_t new )
{
  int64_t prev;
  __asm__ __volatile__(
    "lock ; cmpxchgq %1,%2"
    :"=a"(prev)
    :"r"(new), "m"(v->value), "a"(old) : "memory", "cc" );
  return prev;
}
#endif



////////////////



static inline void mmAtomicPause()
{
  __asm__ __volatile__(
    "rep ; nop"
    :
    :: "memory" );
  return;
}


static inline void mmAtomicSpinWaitEq8( mmAtomic8 *v, int8_t i )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "rep ; nop\n"
    "1:\n"
    "cmpb %1,%0\n"
    "jnz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :
    :"m"(v->value), "r"(i) : "memory", "cc" );
  return;
}

static inline void mmAtomicSpinWaitEq16( mmAtomic16 *v, int16_t i )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "rep ; nop\n"
    "1:\n"
    "cmpw %1,%0\n"
    "jnz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :
    :"m"(v->value), "r"(i) : "memory", "cc" );
  return;
}

static inline void mmAtomicSpinWaitEq32( mmAtomic32 *v, int32_t i )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "rep ; nop\n"
    "1:\n"
    "cmpl %1,%0\n"
    "jnz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :
    :"m"(v->value), "r"(i) : "memory", "cc" );
  return;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicSpinWaitEq64( mmAtomic64 *v, int64_t i )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "rep ; nop\n"
    "1:\n"
    "cmpq %1,%0\n"
    "jnz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :
    :"m"(v->value), "r"(i) : "memory", "cc" );
  return;
}
#endif


static inline int32_t mmAtomicSpinWaitEq8Count( mmAtomic8 *v, int8_t i, int32_t spinmaxcount )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "subl $1,%0\n"
    "jz 3f\n"
    "rep ; nop\n"
    "1:\n"
    "cmpb %2,%1\n"
    "jnz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :"=q"(spinmaxcount)
    :"m"(v->value), "r"(i), "0"(spinmaxcount) : "memory", "cc" );
  return spinmaxcount;
}

static inline int32_t mmAtomicSpinWaitEq16Count( mmAtomic16 *v, int16_t i, int32_t spinmaxcount )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "subl $1,%0\n"
    "jz 3f\n"
    "rep ; nop\n"
    "1:\n"
    "cmpw %2,%1\n"
    "jnz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :"=q"(spinmaxcount)
    :"m"(v->value), "r"(i), "0"(spinmaxcount) : "memory", "cc" );
  return spinmaxcount;
}

static inline int32_t mmAtomicSpinWaitEq32Count( mmAtomic32 *v, int32_t i, int32_t spinmaxcount )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "subl $1,%0\n"
    "jz 3f\n"
    "rep ; nop\n"
    "1:\n"
    "cmpl %2,%1\n"
    "jnz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :"=q"(spinmaxcount)
    :"m"(v->value), "r"(i), "0"(spinmaxcount) : "memory", "cc" );
  return spinmaxcount;
}

#if MM_ATOMIC_64_BITS_SUPPORT
static inline int32_t mmAtomicSpinWaitEq64Count( mmAtomic64 *v, int64_t i, int32_t spinmaxcount )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "subl $1,%0\n"
    "jz 3f\n"
    "rep ; nop\n"
    "1:\n"
    "cmpq %2,%1\n"
    "jnz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :"=q"(spinmaxcount)
    :"m"(v->value), "r"(i), "0"(spinmaxcount) : "memory", "cc" );
  return spinmaxcount;
}
#endif


static inline void mmAtomicSpinWaitNeq8( mmAtomic8 *v, int8_t i )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "rep ; nop\n"
    "1:\n"
    "cmpb %1,%0\n"
    "jz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :
    :"m"(v->value), "r"(i) : "memory", "cc" );
  return;
}


static inline void mmAtomicSpinWaitNeq16( mmAtomic16 *v, int16_t i )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "rep ; nop\n"
    "1:\n"
    "cmpw %1,%0\n"
    "jz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :
    :"m"(v->value), "r"(i) : "memory", "cc" );
  return;
}


static inline void mmAtomicSpinWaitNeq32( mmAtomic32 *v, int32_t i )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "rep ; nop\n"
    "1:\n"
    "cmpl %1,%0\n"
    "jz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :
    :"m"(v->value), "r"(i) : "memory", "cc" );
  return;
}


#if MM_ATOMIC_64_BITS_SUPPORT
static inline void mmAtomicSpinWaitNeq64( mmAtomic64 *v, int64_t i )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "rep ; nop\n"
    "1:\n"
    "cmpq %1,%0\n"
    "jz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :
    :"m"(v->value), "r"(i) : "memory", "cc" );
  return;
}
#endif


static inline int32_t mmAtomicSpinWaitNeq8Count( mmAtomic8 *v, int8_t i, int32_t spinmaxcount )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "subl $1,%0\n"
    "jz 3f\n"
    "rep ; nop\n"
    "1:\n"
    "cmpb %2,%1\n"
    "jz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :"=q"(spinmaxcount)
    :"m"(v->value), "r"(i), "0"(spinmaxcount) : "memory", "cc" );
  return spinmaxcount;
}


static inline int32_t mmAtomicSpinWaitNeq16Count( mmAtomic16 *v, int16_t i, int32_t spinmaxcount )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "subl $1,%0\n"
    "jz 3f\n"
    "rep ; nop\n"
    "1:\n"
    "cmpw %2,%1\n"
    "jz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :"=q"(spinmaxcount)
    :"m"(v->value), "r"(i), "0"(spinmaxcount) : "memory", "cc" );
  return spinmaxcount;
}


static inline int32_t mmAtomicSpinWaitNeq32Count( mmAtomic32 *v, int32_t i, int32_t spinmaxcount )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "subl $1,%0\n"
    "jz 3f\n"
    "rep ; nop\n"
    "1:\n"
    "cmpl %2,%1\n"
    "jz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :"=q"(spinmaxcount)
    :"m"(v->value), "r"(i), "0"(spinmaxcount) : "memory", "cc" );
  return spinmaxcount;
}


#if MM_ATOMIC_64_BITS_SUPPORT
static inline int32_t mmAtomicSpinWaitNeq64Count( mmAtomic64 *v, int64_t i, int32_t spinmaxcount )
{
  __asm__ __volatile__(
    "jmp 1f\n"
    ".p2align 6\n"
    "2:\n"
    "subl $1,%0\n"
    "jz 3f\n"
    "rep ; nop\n"
    "1:\n"
    "cmpq %2,%1\n"
    "jz 2b\n"
    ".p2align 4\n"
    "3:\n"
    :"=q"(spinmaxcount)
    :"m"(v->value), "r"(i), "0"(spinmaxcount) : "memory", "cc" );
  return spinmaxcount;
}
#endif


////


/* GNUC && ( x86 || amd64 ) */
#endif

