/* -----------------------------------------------------------------------------
 *
 * Copyright (c) 2022-2023 Alexis Naveros.
 * Feel free to use however you want.
 *
 * Hash functions for hash tables, solutions converged by genetic algorithm
 * towards maximizing score in statistical analysis, while minimizing cost
 * measured in CPU cycles. They provide near-ideal bit mixing, and no undesired
 * correlations.
 *
 * -----------------------------------------------------------------------------
 */


////


#if defined(__GNUC__) || defined(__INTEL_COMPILER) || defined(__clang__)
 #define CCHASH_ALWAYSINLINE __attribute__((always_inline))
#elif defined(_MSC_VER)
 #define CCHASH_ALWAYSINLINE __forceinline
#else
 #define CCHASH_ALWAYSINLINE
#endif


////


/* Return a 64 bits hash ~ for 64 bits processors */
/* count must be >= 1 */
/*   8 bytes ~ Score: 0.999993 ~ Bitflip odds range: 0.497094 to 0.501770 */
/*  16 bytes ~ Score: 0.999998 ~ Bitflip odds range: 0.498107 to 0.501834 */
/*  32 bytes ~ Score: 0.999999 ~ Bitflip odds range: 0.498051 to 0.501582 */
/*  64 bytes ~ Score: 0.999999 ~ Bitflip odds range: 0.498246 to 0.501577 */
/* 128 bytes ~ Score: 0.999999 ~ Bitflip odds range: 0.498281 to 0.501331 */
static inline uint64_t ccHash64Array64( uint64_t *data, size_t count )
{
  uint64_t hash;
  hash = *data;
  for( ; --count ; )
  {
    hash ^= hash << 13;
    hash += hash >> 30;
    data++;
    hash += *data;
  }
  hash ^= hash << 14;
  hash += hash >> 38;
  hash ^= hash << 6;
  hash += hash >> 10;
  hash ^= hash << 12;
  hash += hash >> 7;
  hash ^= hash << 14;
  hash += hash >> 28;
  hash ^= hash << 32;
  return hash;
}

/* Return a 64 bits hash ~ for 64 bits processors */
/*   8 bytes ~ Score: 0.999993 ~ Bitflip odds range: 0.497094 to 0.501770 */
static inline CCHASH_ALWAYSINLINE uint64_t ccHash64Int64( uint64_t i0 )
{
  uint64_t hash;
  hash = i0;
  hash ^= hash << 14;
  hash += hash >> 38;
  hash ^= hash << 6;
  hash += hash >> 10;
  hash ^= hash << 12;
  hash += hash >> 7;
  hash ^= hash << 14;
  hash += hash >> 28;
  hash ^= hash << 32;
  return hash;
}

/* Return a 64 bits hash ~ for 64 bits processors */
/*  16 bytes ~ Score: 0.999998 ~ Bitflip odds range: 0.498107 to 0.501834 */
static inline CCHASH_ALWAYSINLINE uint64_t ccHash64Int64x2( uint64_t i0, uint64_t i1 )
{
  uint64_t hash;
  hash = i0;
  hash ^= hash << 13;
  hash += hash >> 30;
  hash += i1;
  hash ^= hash << 14;
  hash += hash >> 38;
  hash ^= hash << 6;
  hash += hash >> 10;
  hash ^= hash << 12;
  hash += hash >> 7;
  hash ^= hash << 14;
  hash += hash >> 28;
  hash ^= hash << 32;
  return hash;
}


////


/* Return a 32 bits hash ~ for 32 bits processors */
/* count must be >= 1 */
/*   4 bytes ~ Score: 0.999992 ~ Bitflip odds range: 0.497404 to 0.502084 */
/*   8 bytes ~ Score: 0.999997 ~ Bitflip odds range: 0.498251 to 0.501939 */
/*  12 bytes ~ Score: 0.999996 ~ Bitflip odds range: 0.498173 to 0.501733 */
/*  16 bytes ~ Score: 0.999998 ~ Bitflip odds range: 0.498422 to 0.501361 */
/*  32 bytes ~ Score: 0.999997 ~ Bitflip odds range: 0.497936 to 0.501587 */
/*  64 bytes ~ Score: 0.999997 ~ Bitflip odds range: 0.498125 to 0.501922 */
/* 128 bytes ~ Score: 0.999997 ~ Bitflip odds range: 0.498217 to 0.501496 */
static inline uint32_t ccHash32Array32( uint32_t *data, size_t count )
{
  uint32_t hash;
  hash = *data;
  for( ; --count ; )
  {
    hash ^= hash << 21;
    hash += hash >> 13;
    data++;
    hash += *data;
  }
  hash ^= hash << 17;
  hash += hash >> 12;
  hash ^= hash << 3;
  hash += hash >> 6;
  hash ^= hash << 11;
  hash += hash >> 4;
  hash ^= hash << 8;
  hash += hash >> 16;
  return hash;
}

static inline uint32_t ccHash32Array64( uint64_t *data, int count )
{
  uint32_t hash;
  uint64_t v;
  hash = 0;
  for( ; count ; count-- )
  {
    v = *data;
    hash += v & 0xFFFF;
    hash = ( ( hash << 16 ) ^ hash ) ^ ( ( (uint32_t)( v >> 16 ) & 0xFFFF ) << 11 );
    hash += ( hash >> 11 ) + ( (uint32_t)( v >> 32 ) & 0xFFFF );
    hash = ( ( hash << 16 ) ^ hash ) ^ (uint32_t)( ( v >> 37 ) & 0x7FFF800 );
    hash += hash >> 11;
    data = ADDRESS( data, 8 );
  }
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

/* Return a 32 bits hash ~ for 32 bits processors */
/*   4 bytes ~ Score: 0.999992 ~ Bitflip odds range: 0.497404 to 0.502084 */
static inline CCHASH_ALWAYSINLINE uint32_t ccHash32Int32( uint32_t i0 )
{
  uint32_t hash;
  hash = i0;
  hash ^= hash << 17;
  hash += hash >> 12;
  hash ^= hash << 3;
  hash += hash >> 6;
  hash ^= hash << 11;
  hash += hash >> 4;
  hash ^= hash << 8;
  hash += hash >> 16;
  return hash;
}

/* Return a 32 bits hash ~ for 32 bits processors */
/*   8 bytes ~ Score: 0.999997 ~ Bitflip odds range: 0.498251 to 0.501939 */
static inline CCHASH_ALWAYSINLINE uint32_t ccHash32Int32x2( uint32_t i0, uint32_t i1 )
{
  uint32_t hash;
  hash = i0;
  hash ^= hash << 21;
  hash += hash >> 13;
  hash += i1;
  hash ^= hash << 17;
  hash += hash >> 12;
  hash ^= hash << 3;
  hash += hash >> 6;
  hash ^= hash << 11;
  hash += hash >> 4;
  hash ^= hash << 8;
  hash += hash >> 16;
  return hash;
}

static inline CC_ALWAYSINLINE uint32_t ccHash32Int64Inline( uint64_t i )
{
  uint32_t hash;
  hash = (uint32_t)(i & 0xFFFF);
  hash = ( ( hash << 16 ) ^ hash ) ^ ( ( (uint32_t)( i >> 16 ) & 0xFFFF ) << 11 );
  hash += ( hash >> 11 ) + ( (uint32_t)( i >> 32 ) & 0xFFFF );
  hash = ( ( hash << 16 ) ^ hash ) ^ (uint32_t)( ( i >> 37 ) & 0x7FFF800 );
  hash += hash >> 11;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline CC_ALWAYSINLINE uint32_t ccHash32Int32Inline( uint32_t i )
{
  uint32_t hash;
  hash = i & 0xFFFF;
  hash = ( ( hash << 16 ) ^ hash ) ^ ( ( i & 0xFFFF0000 ) >> 5 );
  hash += hash >> 11;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

////


/* Return a 64 bits hash ~ for 64 bits processors ~ when your input is made of 32 bits values already sitting in registers */
/* count must be >= 1 */
/* !! Template to unroll !! */
/*   4 bytes ~ Score: 1.000000 ~ Bitflip odds range: 0.498983 to 0.501110 */
/*   8 bytes ~ Score: 1.000000 ~ Bitflip odds range: 0.499010 to 0.501086 */
/*  12 bytes ~ Score: 1.000000 ~ Bitflip odds range: 0.499084 to 0.501051 */
/*  16 bytes ~ Score: 1.000000 ~ Bitflip odds range: 0.498741 to 0.501158 */
/*  32 bytes ~ Score: 1.000000 ~ Bitflip odds range: 0.499145 to 0.500892 */
/*  64 bytes ~ Score: 1.000000 ~ Bitflip odds range: 0.498921 to 0.501438 */
/* 128 bytes ~ Score: 1.000000 ~ Bitflip odds range: 0.498897 to 0.500976 */
static inline uint64_t ccHash64Array32( uint32_t *data, size_t count )
{
  uint64_t hash;
  hash = (uint64_t)*data;
  for( ; --count ; )
  {
    hash ^= hash << 17;
    hash += hash >> 10;
    data++;
    hash += (uint64_t)*data;
  }
  hash ^= hash << 24;
  hash += hash >> 6;
  hash ^= hash << 14;
  hash += hash >> 16;
  hash ^= hash << 12;
  hash += hash >> 5;
  hash ^= hash << 30;
  hash += hash >> 27;
  return hash;
}

/* Return a 64 bits hash ~ for 64 bits processors */
/*   4 bytes ~ Score: 1.000000 ~ Bitflip odds range: 0.498983 to 0.501110 */
static inline CCHASH_ALWAYSINLINE uint64_t ccHash64Int32( uint32_t i0 )
{
  uint64_t hash;
  hash = (uint64_t)i0;
  hash ^= hash << 24;
  hash += hash >> 6;
  hash ^= hash << 14;
  hash += hash >> 16;
  hash ^= hash << 12;
  hash += hash >> 5;
  hash ^= hash << 30;
  hash += hash >> 27;
  return hash;
}

/* Return a 64 bits hash ~ for 64 bits processors */
/*   8 bytes ~ Score: 1.000000 ~ Bitflip odds range: 0.499010 to 0.501086 */
static inline CCHASH_ALWAYSINLINE uint64_t ccHash64Int32x2( uint32_t i0, uint32_t i1 )
{
  uint64_t hash;
  hash = (uint64_t)i0;
  hash ^= hash << 17;
  hash += hash >> 10;
  hash += (uint64_t)i1;
  hash ^= hash << 24;
  hash += hash >> 6;
  hash ^= hash << 14;
  hash += hash >> 16;
  hash ^= hash << 12;
  hash += hash >> 5;
  hash ^= hash << 30;
  hash += hash >> 27;
  return hash;
}


////


/* Try to determine endianess for proper arbitrary data hash ~ without dependencies on cc.h/mm.h */

#if !CCHASH_LITTLE_ENDIAN && !CCHASH_BIG_ENDIAN
 #if defined(__BYTE_ORDER__)
  #if defined(__ORDER_LITTLE_ENDIAN__) && ( __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__ )
   #define CCHASH_LITTLE_ENDIAN (1)
   #define CCHASH_BIG_ENDIAN (0)
  #endif
  #if defined(__ORDER_BIG_ENDIAN__) && ( __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__ )
   #define CCHASH_LITTLE_ENDIAN (0)
   #define CCHASH_BIG_ENDIAN (1)
  #endif
 #endif
#endif

#if !CCHASH_LITTLE_ENDIAN && !CCHASH_BIG_ENDIAN
 #if __LITTLE_ENDIAN__
  #define CCHASH_LITTLE_ENDIAN (1)
  #define CCHASH_BIG_ENDIAN (0)
 #endif
 #if __BIG_ENDIAN__
  #define CCHASH_LITTLE_ENDIAN (0)
  #define CCHASH_BIG_ENDIAN (1)
 #endif
#endif

#if !CCHASH_LITTLE_ENDIAN && !CCHASH_BIG_ENDIAN
 #if defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__x86_64) || defined(_M_X64) || defined(_M_AMD64)
  #define CCHASH_LITTLE_ENDIAN (1)
  #define CCHASH_BIG_ENDIAN (0)
 #endif
#endif

#if !CCHASH_LITTLE_ENDIAN && !CCHASH_BIG_ENDIAN
 #if defined(i386) || defined(__i386) || defined(__i386__) || defined(__i386) || defined(__IA32__) || defined(_M_IX86) || defined(__X86__) || defined(_X86_)
  #define CCHASH_LITTLE_ENDIAN (1)
  #define CCHASH_BIG_ENDIAN (0)
 #endif
#endif

#if !CCHASH_LITTLE_ENDIAN && !CCHASH_BIG_ENDIAN
 #if defined(__arm__) || defined(_ARM) || defined(_M_ARM) || defined(__arm) || defined(__aarch64__) || defined(__EMSCRIPTEN__)
  #define CCHASH_LITTLE_ENDIAN (1)
  #define CCHASH_BIG_ENDIAN (0)
 #endif
#endif

#if !CCHASH_LITTLE_ENDIAN && !CCHASH_BIG_ENDIAN
 #warning We could not determine endianness for ccHash64Data()/ccHash32Data() ~ assuming little endian
 #define CCHASH_LITTLE_ENDIAN (1)
 #define CCHASH_BIG_ENDIAN (0)
#endif

#ifdef CHAR_BIT
 #define CCHASH_CHARBITS (CHAR_BIT)
#else
 #define CCHASH_CHARBITS (8)
#endif

/* Determine if the hardware can do misaligned loads (without faulting!) faster than loads/shifts/or */
#if !CCHASH_FAST_MISALIGNED_LOAD
 #if defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__x86_64) || defined(_M_X64) || defined(_M_AMD64)
  #define CCHASH_FAST_MISALIGNED_LOAD (1)
 #endif
#endif

#if !CCHASH_FAST_MISALIGNED_LOAD
 #if defined(i386) || defined(__i386) || defined(__i386__) || defined(__i386) || defined(__IA32__) || defined(_M_IX86) || defined(__X86__) || defined(_X86_)
  #define CCHASH_FAST_MISALIGNED_LOAD (1)
 #endif
#endif


////


/* Return a 64 bits hash ~ for 64 bits processors */
/* Arbitrary length hashing ~ 8 bytes alignment for data performs better, but isn't required */
/* For non-uint64_t data, little-endian and big-endian will return different values */
/* Valgrind note: this function DOES read out of bounds, but it never crosses a page boundary, extra bytes are discarded and it can't segfault */
static inline uint64_t ccHash64Data( void *data, size_t size )
{
  int shift0, shift1;
  size_t count, trail;
  uintptr_t alignment;
  uint64_t hash, currentblock, nextblock, trailvalue;
  uint64_t *data64;

  count = size / sizeof(uint64_t);
  trail = size & (sizeof(uint64_t)-1);
#if CCHASH_FAST_MISALIGNED_LOAD
  alignment = 0;
#else
  alignment = (uintptr_t)data & (sizeof(uint64_t)-1);
#endif
  hash = 0;
  if( alignment == 0 )
  {
    data64 = data;
    if( count )
    {
      hash = *data64;
      data64++;
      for( ; --count ; )
      {
        hash ^= hash << 13;
        hash += hash >> 30;
        hash += *data64;
        data64++;
      }
    }
    if( trail )
    {
      hash ^= hash << 13;
      hash += hash >> 30;
      trailvalue = *data64;
#if CCHASH_LITTLE_ENDIAN
      hash += trailvalue & ( ( (uint64_t)1 << ( trail * CCHASH_CHARBITS ) ) - 1 );
#else
      hash += trailvalue & ( ( ( (uint64_t)1 << ( trail * CCHASH_CHARBITS ) ) - 1 ) << ( ( sizeof(uint64_t) - trail ) * CCHASH_CHARBITS );
#endif
    }
  }
  else
  {
    data64 = (uint64_t *)(((uintptr_t)data)-alignment);
    shift0 = (int)(alignment * CCHASH_CHARBITS);
    shift1 = ( sizeof(uint64_t) * CCHASH_CHARBITS ) - shift0;
    currentblock = data64[0];
    if( count )
    {
      nextblock = data64[1];
#if CCHASH_LITTLE_ENDIAN
      hash = ( currentblock >> shift0 ) | ( nextblock << shift1 );
#else
      hash = ( currentblock << shift0 ) | ( nextblock >> shift1 );
#endif
      data64++;
      for( ; --count ; )
      {
        hash ^= hash << 13;
        hash += hash >> 30;
        currentblock = nextblock;
        nextblock = data64[1];
#if CCHASH_LITTLE_ENDIAN
        hash += ( currentblock >> shift0 ) | ( nextblock << shift1 );
#else
        hash += ( currentblock << shift0 ) | ( nextblock >> shift1 );
#endif
        data64++;
      }
      currentblock = nextblock;
    }
    if( trail )
    {
      hash ^= hash << 13;
      hash += hash >> 30;
      /* Ensure we aren't reading data64[1] if we don't need it, avoid faulting while crossing page boundaries */
#if CCHASH_LITTLE_ENDIAN
      trailvalue = currentblock >> shift0;
      if( trail > ( sizeof(uint64_t) - alignment ) )
        trailvalue |= data64[1] << shift1;
      hash += trailvalue & ( ( (uint64_t)1 << ( trail * CCHASH_CHARBITS ) ) - 1 );
#else
      trailvalue = currentblock << shift0;
      if( trail > ( sizeof(uint64_t) - alignment ) )
        trailvalue |= data64[1] >> shift1;
      hash += trailvalue & ( ( ( (uint64_t)1 << ( trail * CCHASH_CHARBITS ) ) - 1 ) << ( ( sizeof(uint64_t) - trail ) * CCHASH_CHARBITS );
#endif
    }
  }
  hash ^= hash << 14;
  hash += hash >> 38;
  hash ^= hash << 6;
  hash += hash >> 10;
  hash ^= hash << 12;
  hash += hash >> 7;
  hash ^= hash << 14;
  hash += hash >> 28;
  hash ^= hash << 32;
  return hash;
}


////


/* Return a 32 bits hash ~ for 32 bits processors */
/* Arbitrary length hashing ~ 4 bytes alignment for data performs better, but isn't required */
/* For non-uint32_t data, little-endian and big-endian will return different values */
/* Valgrind note: this function DOES read out of bounds, but it never crosses a page boundary, extra bytes are discarded and it can't segfault */
static inline uint32_t ccHash32Data( const void *data, size_t size )
{
  int shift0, shift1;
  size_t count, trail;
  uintptr_t alignment;
  uint32_t hash, currentblock, nextblock, trailvalue;
  const uint32_t *data32;

  count = size / sizeof(uint32_t);
  trail = size & (sizeof(uint32_t)-1);
#if CCHASH_FAST_MISALIGNED_LOAD
  alignment = 0;
#else
  alignment = (uintptr_t)data & (sizeof(uint32_t)-1);
#endif
  hash = 0;
  if( alignment == 0 )
  {
    data32 = data;
    if( count )
    {
      hash = *data32;
      data32++;
      for( ; --count ; )
      {
        hash ^= hash << 21;
        hash += hash >> 13;
        hash += *data32;
        data32++;
      }
    }
    if( trail )
    {
      hash ^= hash << 21;
      hash += hash >> 13;
      trailvalue = *data32;
#if CCHASH_LITTLE_ENDIAN
      hash += trailvalue & ( ( (uint32_t)1 << ( trail * CCHASH_CHARBITS ) ) - 1 );
#else
      hash += trailvalue & ( ( ( (uint32_t)1 << ( trail * CCHASH_CHARBITS ) ) - 1 ) << ( ( sizeof(uint32_t) - trail ) * CCHASH_CHARBITS );
#endif
    }
  }
  else
  {
    data32 = (uint32_t *)(((uintptr_t)data)-alignment);
    shift0 = (int)(alignment * CCHASH_CHARBITS);
    shift1 = ( sizeof(uint32_t) * CCHASH_CHARBITS ) - shift0;
    currentblock = data32[0];
    if( count )
    {
      nextblock = data32[1];
#if CCHASH_LITTLE_ENDIAN
      hash = ( currentblock >> shift0 ) | ( nextblock << shift1 );
#else
      hash = ( currentblock << shift0 ) | ( nextblock >> shift1 );
#endif
      data32++;
      for( ; --count ; )
      {
        hash ^= hash << 21;
        hash += hash >> 13;
        currentblock = nextblock;
        nextblock = data32[1];
#if CCHASH_LITTLE_ENDIAN
        hash += ( currentblock >> shift0 ) | ( nextblock << shift1 );
#else
        hash += ( currentblock << shift0 ) | ( nextblock >> shift1 );
#endif
        data32++;
      }
      currentblock = nextblock;
    }
    if( trail )
    {
      hash ^= hash << 21;
      hash += hash >> 13;
      /* Ensure we aren't reading data32[1] if we don't need it, avoid faulting while crossing page boundaries */
#if CCHASH_LITTLE_ENDIAN
      trailvalue = currentblock >> shift0;
      if( trail > ( sizeof(uint32_t) - alignment ) )
        trailvalue |= data32[1] << shift1;
      hash += trailvalue & ( ( (uint32_t)1 << ( trail * CCHASH_CHARBITS ) ) - 1 );
#else
      trailvalue = currentblock << shift0;
      if( trail > ( sizeof(uint32_t) - alignment ) )
        trailvalue |= data32[1] >> shift1;
      hash += trailvalue & ( ( ( (uint32_t)1 << ( trail * CCHASH_CHARBITS ) ) - 1 ) << ( ( sizeof(uint32_t) - trail ) * CCHASH_CHARBITS );
#endif
    }
  }
  hash ^= hash << 17;
  hash += hash >> 12;
  hash ^= hash << 3;
  hash += hash >> 6;
  hash ^= hash << 11;
  hash += hash >> 4;
  hash ^= hash << 8;
  hash += hash >> 16;
  return hash;
}
