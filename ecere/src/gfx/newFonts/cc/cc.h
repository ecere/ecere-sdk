/* *****************************************************************************
 * Copyright (c) 2007-2014 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
#include <sys/time.h>
#include <stdarg.h>


#if defined(__linux__) || defined(__gnu_linux__) || defined(__linux) || defined(__linux)
 #define CC_LINUX (1)
 #define CC_UNIX (1)
#elif defined(__APPLE__)
 #define CC_OSX (1)
 #define CC_UNIX (1)
#elif defined(__unix__) || defined(__unix) || defined(unix)
 #define CC_UNIX (1)
#elif defined(_WIN64) || defined(__WIN64__) || defined(WIN64)
 #define CC_WIN64 (1)
 #define CC_WIN32 (1)
 #define CC_WINDOWS (1)
#elif defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
 #define CC_WIN32 (1)
 #define CC_WINDOWS (1)
#endif


#ifndef ADDRESS
 #define ADDRESS(p,o) ((void *)(((char *)p)+(o)))
#endif

#ifndef ADDRESSDIFF
 #define ADDRESSDIFF(a,b) (((char *)a)-((char *)b))
#endif


#define CC_SIZEOF_ALIGN4(x) ((sizeof(x)+0x3)&~0x3)
#define CC_SIZEOF_ALIGN8(x) ((sizeof(x)+0x7)&~0x7)
#define CC_SIZEOF_ALIGN16(x) ((sizeof(x)+0xF)&~0xF)
#define CC_SIZEOF_ALIGN32(x) ((sizeof(x)+0x1F)&~0x1F)
#define CC_SIZEOF_ALIGN64(x) ((sizeof(x)+0x3F)&~0x3F)


#define CC_MIN(x,y) ((x)>(y)?(y):(x))
#define CC_MAX(x,y) ((x)<(y)?(y):(x))
#define CC_CLAMP(x,min,max) ((x)<(min)?(min):((x)>(max)?(max):(x)))


#define CC_MAX_INT8(x,y) (((int8_t)x)-((((int8_t)x)-((int8_t)y))&((((int8_t)x)-((int8_t)y))>>7)))
#define CC_MAX_INT16(x,y) (((int16_t)x)-((((int16_t)x)-((int16_t)y))&((((int16_t)x)-((int16_t)y))>>15)))
#define CC_MAX_INT32(x,y) (((int32_t)x)-((((int32_t)x)-((int32_t)y))&((((int32_t)x)-((int32_t)y))>>31)))
#define CC_MAX_INT64(x,y) (((int64_t)x)-((((int64_t)x)-((int64_t)y))&((((int64_t)x)-((int64_t)y))>>63)))

#define CC_MIN_INT8(x,y) (((int8_t)y)+((((int8_t)x)-((int8_t)y))&((((int8_t)x)-((int8_t)y))>>7)))
#define CC_MIN_INT16(x,y) (((int16_t)y)+((((int16_t)x)-((int16_t)y))&((((int16_t)x)-((int16_t)y))>>15)))
#define CC_MIN_INT32(x,y) (((int32_t)y)+((((int32_t)x)-((int32_t)y))&((((int32_t)x)-((int32_t)y))>>31)))
#define CC_MIN_INT64(x,y) (((int64_t)y)+((((int64_t)x)-((int64_t)y))&((((int64_t)x)-((int64_t)y))>>63)))

#define CC_SHIFTDIV_INT8(value,shift) ({uint8_t _s=((uint8_t)value)>>7;((int8_t)((value)+(_s<<shift)-_s))>>shift;})
#define CC_SHIFTDIV_INT16(value,shift) ({uint16_t _s=((uint16_t)value)>>15;((int16_t)((value)+(_s<<shift)-_s))>>shift;})
#define CC_SHIFTDIV_INT32(value,shift) ({uint32_t _s=((uint32_t)value)>>31;((int32_t)((value)+(_s<<shift)-_s))>>shift;})
#define CC_SHIFTDIV_INT64(value,shift) ({uint64_t _s=((uint64_t)value)>>63;((int64_t)((value)+(_s<<shift)-_s))>>shift;})

#define CC_SHIFTDIVROUND(value,shift) ((value>>shift)+(((value&((1<<shift)-1))<<1)>=(1<<shift)))

#define CC_SHIFTDIVROUND_INT8(value,shift) ((value>>shift)+((((value&((1<<shift)-1))-((uint8_t)value>>7))<<1)>=(1<<shift)))
#define CC_SHIFTDIVROUND_INT16(value,shift) ((value>>shift)+((((value&((1<<shift)-1))-((uint16_t)value>>15))<<1)>=(1<<shift)))
#define CC_SHIFTDIVROUND_INT32(value,shift) ((value>>shift)+((((value&((1<<shift)-1))-((uint32_t)value>>31))<<1)>=(1<<shift)))
#define CC_SHIFTDIVROUND_INT64(value,shift) ((value>>shift)+((((value&((1<<shift)-1))-((uint64_t)value>>63))<<1)>=(1<<shift)))


#define CC_NUMBITS2(n) ((n&2)?1:0)
#define CC_NUMBITS4(n) ((n&(0xC))?(2+CC_NUMBITS2(n>>2)):(CC_NUMBITS2(n)))
#define CC_NUMBITS8(n) ((n&0xF0)?(4+CC_NUMBITS4(n>>4)):(CC_NUMBITS4(n)))
#define CC_NUMBITS16(n) ((n&0xFF00)?(8+CC_NUMBITS8(n>>8)):(CC_NUMBITS8(n)))
#define CC_NUMBITS32(n) ((n&0xFFFF0000)?(16+CC_NUMBITS16(n>>16)):(CC_NUMBITS16(n)))
#define CC_NUMBITS(n) (n==0?0:CC_NUMBITS32(n)+1)


////


#define CC_STRINGIFY(s) CC_STRINGIFY_IN(s)
#define CC_STRINGIFY_IN(s) #s

#define CC_CONCATENATE(s,n) CC_CONCATENATE_IN(s,n)
#define CC_CONCATENATE_IN(s,n) s ## n


////


enum
{
  CC_TYPE_UINT8,
  CC_TYPE_INT8,
  CC_TYPE_UINT16,
  CC_TYPE_INT16,
  CC_TYPE_UINT32,
  CC_TYPE_INT32,
  CC_TYPE_UINT64,
  CC_TYPE_INT64,
  CC_TYPE_FLOAT,
  CC_TYPE_DOUBLE,

  CC_TYPE_COUNT
};

extern const size_t ccTypeSize[CC_TYPE_COUNT];


////


#if CC_UNIX
 #define CC_DIR_SEPARATOR_CHAR '/'
 #define CC_DIR_SEPARATOR_STRING "/"
#elif CC_WINDOWS
 #define CC_DIR_SEPARATOR_CHAR '\\'
 #define CC_DIR_SEPARATOR_STRING "\\"
#else
 #define CC_DIR_SEPARATOR_CHAR '/'
 #define CC_DIR_SEPARATOR_STRING "/"
#endif

#if CC_WINDOWS
 #define CC_LL "I64"
 #define CC_LLD "%I64d"
 #define CC_LLU "%I64u"
 #define CC_LLX "%I64x"
#else
 #define CC_LL "ll"
 #define CC_LLD "%lld"
 #define CC_LLU "%llu"
 #define CC_LLX "%llx"
#endif


////


uint32_t ccHash32Data( void *data, int size );
uint32_t ccHash32Int32( uint32_t data );
uint32_t ccHash32Int64( uint64_t data );
uint32_t ccHash32Array32( uint32_t *data, int count );
uint32_t ccHash32Array64( uint64_t *data, int count );

static inline uint32_t ccHash32Int16Inline( uint32_t i )
{
  uint32_t hash;
  hash = ( i << 16 ) ^ i;
  hash += hash >> 11;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline uint32_t ccHash32Int32Inline( uint32_t i )
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

static inline uint32_t ccHash32Int64Inline( uint64_t i )
{
  uint32_t hash;
  hash = (uint32_t)(i & 0xFFFF);
  hash = ( ( hash << 16 ) ^ hash ) ^ ( ( (uint32_t)( i >> 16 ) & 0xFFFF ) << 11 );
  hash += ( hash >> 11 ) + ( (uint32_t)( i >> 32 ) & 0xFFFF );
  hash = ( ( hash << 16 ) ^ hash ) ^ (uint32_t)( ( i & 0xFFFF000000000000LL ) >> 37 );
  hash += hash >> 11;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline uint32_t ccHash32Data3Inline( uint8_t *data )
{
  uint32_t hash;
  hash = 0;
  hash += ( (uint32_t)data[1] << 8 ) | (uint32_t)data[0];
  hash ^= hash << 16;
  hash ^= (uint32_t)data[2] << 18;
  hash += hash >> 11;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline uint32_t ccHash32Data4Inline( uint8_t *data )
{
  uint32_t hash;
  hash = 0;
  hash += ( (uint32_t)data[1] << 8 ) | (uint32_t)data[0];
  hash = ( hash << 16 ) ^ ( ( ( (uint32_t)data[3] << 19 ) | ( (uint32_t)data[2] << 11 ) ) ^ hash );
  hash += hash >> 11;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline uint32_t ccHash32Data5Inline( uint8_t *data )
{
  uint32_t hash;
  hash = 0;
  hash += ( (uint32_t)data[1] << 8 ) | (uint32_t)data[0];
  hash = ( hash << 16 ) ^ ( ( ( (uint32_t)data[3] << 19 ) | ( (uint32_t)data[2] << 11 ) ) ^ hash );
  hash += hash >> 11;
  hash += (uint32_t)data[4];
  hash ^= hash << 10;
  hash += hash >> 1;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline uint32_t ccHash32Data6Inline( uint8_t *data )
{
  uint32_t hash;
  hash = 0;
  hash += ( (uint32_t)data[1] << 8 ) | (uint32_t)data[0];
  hash = ( hash << 16 ) ^ ( ( ( (uint32_t)data[3] << 19 ) | ( (uint32_t)data[2] << 11 ) ) ^ hash );
  hash += hash >> 11;
  hash += ( (uint32_t)data[5] << 8 ) | (uint32_t)data[4];
  hash ^= hash << 11;
  hash += hash >> 17;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline uint32_t ccHash32Data7Inline( uint8_t *data )
{
  uint32_t hash;
  hash = 0;
  hash += ( (uint32_t)data[1] << 8 ) | (uint32_t)data[0];
  hash = ( hash << 16 ) ^ ( ( ( (uint32_t)data[3] << 19 ) | ( (uint32_t)data[2] << 11 ) ) ^ hash );
  hash += hash >> 11;
  data = ADDRESS( data, 4 );
  hash += ( (uint32_t)data[5] << 8 ) | (uint32_t)data[4];
  hash ^= hash << 16;
  hash ^= (uint32_t)data[6] << 18;
  hash += hash >> 11;
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

static inline uint32_t ccHash32Data8Inline( uint8_t *data )
{
  uint32_t hash;
  hash = 0;
  hash += ( (uint32_t)data[1] << 8 ) | (uint32_t)data[0];
  hash = ( hash << 16 ) ^ ( ( ( (uint32_t)data[3] << 19 ) | ( (uint32_t)data[2] << 11 ) ) ^ hash );
  hash += hash >> 11;
  hash += ( (uint32_t)data[5] << 8 ) | (uint32_t)data[4];
  hash = ( hash << 16 ) ^ ( ( ( (uint32_t)data[7] << 19 ) | ( (uint32_t)data[6] << 11 ) ) ^ hash );
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



typedef struct
{
  uint32_t a;
  uint32_t b;
  uint32_t c;
  uint32_t d;
} ccQuickRandState32;

static inline uint32_t ccQuickRand32( ccQuickRandState32 *randstate )
{
  uint32_t e;
  e = randstate->a - ( ( randstate->b << 27 ) | ( randstate->b >> (32-27) ) );
  randstate->a = randstate->b ^ ( ( randstate->c << 17 ) | ( randstate->c >> (32-17) ) );
  randstate->b = randstate->c + randstate->d;
  randstate->c = randstate->d + e;
  randstate->d = e + randstate->a;
  return randstate->d;
}

static inline void ccQuickRand32Seed( ccQuickRandState32 *randstate, uint32_t seed )
{
  uint32_t i;
  randstate->a = 0xf1ea5eed;
  randstate->b = seed;
  randstate->c = seed;
  randstate->d = seed;
  for( i = 0 ; i < 20 ; i++ )
    ccQuickRand32( randstate );
  return;
}

static inline void ccQuickRand32SeedFast( ccQuickRandState32 *randstate, uint32_t seed0, uint32_t seed1, uint32_t seed2 )
{
  uint32_t i;
  randstate->a = 0xf1ea5eed;
  randstate->b = seed0;
  randstate->c = seed1;
  randstate->d = seed2;
  for( i = 0 ; i < 4 ; i++ )
    ccQuickRand32( randstate );
  return;
}


typedef struct
{
  uint64_t a;
  uint64_t b;
  uint64_t c;
  uint64_t d;
} ccQuickRandState64;

static inline uint64_t ccQuickRand64( ccQuickRandState64 *randstate )
{
  uint64_t e;
  e = randstate->a - ( ( randstate->b << 7 ) | ( randstate->b >> (64-7) ) );
  randstate->a = randstate->b ^ ( ( randstate->c << 13 ) | ( randstate->c >> (64-13) ) );
  randstate->b = randstate->c + ( ( randstate->d << 37 ) | ( randstate->d >> (64-37) ) );
  randstate->c = randstate->d + e;
  randstate->d = e + randstate->a;
  return randstate->d;
}

static inline void ccQuickRand64Seed( ccQuickRandState64 *randstate, uint64_t seed )
{
  uint64_t i;
  randstate->a = 0xf1ea5eed;
  randstate->b = seed;
  randstate->c = seed;
  randstate->d = seed;
  for( i = 0 ; i < 20 ; i++ )
    ccQuickRand64( randstate );
  return;
}



////



int ccMemCmp( void *s0, void *s1, int size );
int ccMemCmp32( uint32_t *s0, uint32_t *s1, int count );
int ccMemCmp64( uint64_t *s0, uint64_t *s1, int count );
int ccMemCmpRetSize( void *s0, void *s1, int size );

static inline int ccMemCmpInline( void *s0, void *s1, int size )
{
  int i;
  uint8_t *t0, *t1;
  t0 = s0;
  t1 = s1;
  for( i = 0 ; i < size ; i++ )
  {
    if( t0[i] != t1[i] )
      return 0;
  }
  return 1;
}

static inline int ccMemCmpSizeInline( void *s0, void *s1, int size )
{
  int i;
  uint8_t *t0, *t1;
  t0 = s0;
  t1 = s1;
  for( i = 0 ; i < size ; i++ )
  {
    if( t0[i] != t1[i] )
      break;
  }
  return i;
}


////


uint8_t ccLog2Int8( uint8_t i );
uint16_t ccLog2Int16( uint16_t i );
uint32_t ccLog2Int32( uint32_t i );
uint64_t ccLog2Int64( uint64_t i );
#if CPUCONF_LONG_SIZE == 8
 #define ccLog2IntL(v) ccLog2Int64(v)
#else
 #define ccLog2IntL(v) ccLog2Int32(v)
#endif


////


static inline int8_t ccPowInt8( int8_t base, int exp )
{
  int result;
  result = 1;
  while( exp )
  {
    if( exp & 1 )
      result *= base;
    exp >>= 1;
    base *= base;
  }
  return (int8_t)result;
}

static inline int16_t ccPowInt16( int16_t base, int exp )
{
  int result;
  result = 1;
  while( exp )
  {
    if( exp & 1 )
      result *= base;
    exp >>= 1;
    base *= base;
  }
  return (int16_t)result;
}

static inline int32_t ccPowInt32( int32_t base, int exp )
{
  int result;
  result = 1;
  while( exp )
  {
    if( exp & 1 )
      result *= base;
    exp >>= 1;
    base *= base;
  }
  return result;
}

static inline int64_t ccPowInt64( int64_t base, int exp )
{
  int result;
  result = 1;
  while( exp )
  {
    if( exp & 1 )
      result *= base;
    exp >>= 1;
    base *= base;
  }
  return result;
}


////


static inline uint8_t ccMergeIntMask8( uint8_t i0, uint8_t i1, uint8_t mask )
{
  return (uint8_t)(i0 ^ ( ( i0 ^ i1 ) & mask ));
}

static inline uint16_t ccMergeIntMask16( uint16_t i0, uint16_t i1, uint16_t mask )
{
  return (uint16_t)(i0 ^ ( ( i0 ^ i1 ) & mask ));
}

static inline uint32_t ccMergeIntMask32( uint32_t i0, uint32_t i1, uint32_t mask )
{
  return i0 ^ ( ( i0 ^ i1 ) & mask );
}

static inline uint64_t ccMergeIntMask64( uint64_t i0, uint64_t i1, uint64_t mask )
{
  return i0 ^ ( ( i0 ^ i1 ) & mask );
}

#if CPUCONF_LONG_SIZE == 8
 #define ccMergeIntMaskL(v) ccMergeIntMask64(v)
#else
 #define ccMergeIntMaskL(v) ccMergeIntMask32(v)
#endif



////



static inline int ccCountBits64( uint64_t i )
{
  int r;
  for( r = 0 ; i ; r++ )
    i &= i - 1;
  return r;
}


static inline int ccCountBits32( uint32_t v )
{
  int c;
  v = v - ( ( v >> 1 ) & 0x55555555 );
  v = ( v & 0x33333333 ) + ( ( v >> 2 ) & 0x33333333 );
  c = ( ( ( v + ( v >> 4 ) ) & 0xF0F0F0F ) * 0x1010101 ) >> 24;
  return c;
}


////


static inline int ccTrailingCount32( uint32_t v )
{
  int c;
  if( v & 0x1 )
    c = 0;
  else
  {
    c = 1;
    if( !( v & 0xffff ) )
    {
      v >>= 16;
      c += 16;
    }
    if( !( v & 0xff ) )
    {
      v >>= 8;
      c += 8;
    }
    if( !( v & 0xf ) )
    {
      v >>= 4;
      c += 4;
    }
    if( !( v & 0x3 ) )
    {
      v >>= 2;
      c += 2;
    }
    c -= v & 0x1;
  }
  return c;
}


static inline int ccTrailingCount64( uint64_t v )
{
  int c;
  if( v & 0x1 )
    c = 0;
  else
  {
    c = 1;
    if( !( v & 0xffffffff ) )
    {
      v >>= 32;
      c += 32;
    }
    if( !( v & 0xffff ) )
    {
      v >>= 16;
      c += 16;
    }
    if( !( v & 0xff ) )
    {
      v >>= 8;
      c += 8;
    }
    if( !( v & 0xf ) )
    {
      v >>= 4;
      c += 4;
    }
    if( !( v & 0x3 ) )
    {
      v >>= 2;
      c += 2;
    }
    c -= v & 0x1;
  }
  return c;
}


////


static inline uint32_t ccReverseBits32( uint32_t value )
{
  uint32_t result;
  int shift;

  result = value;
  shift = 32-1;
  for( value >>= 1 ; value ; value >>= 1 )
  {
    result <<= 1;
    result |= value & 1;
    shift--;
  }
  result <<= shift;

  return result;
}

static inline uint64_t ccReverseBits64( uint64_t value )
{
  uint64_t result;
  int shift;

  result = value;
  shift = 64-1;
  for( value >>= 1 ; value ; value >>= 1 )
  {
    result <<= 1;
    result |= value & 1;
    shift--;
  }
  result <<= shift;

  return result;
}

static inline uint32_t ccReverseBitsVar32( uint32_t value, int numbits )
{
  uint32_t result;
  int shift;

  value &= ( ((uint32_t)1) << numbits ) - 1;
  result = value;
  shift = 32-1;
  for( value >>= 1 ; value ; value >>= 1 )
  {
    result <<= 1;
    result |= value & 1;
    shift--;
  }
  result <<= shift;
  result >>= 32 - numbits;

  return result;
}

static inline uint64_t ccReverseBitsVar64( uint64_t value, int numbits )
{
  uint64_t result;
  int shift;

  value &= ( ((uint64_t)1) << numbits ) - 1;
  result = value;
  shift = 64-1;
  for( value >>= 1 ; value ; value >>= 1 )
  {
    result <<= 1;
    result |= value & 1;
    shift--;
  }
  result <<= shift;
  result >>= 64 - numbits;

  return result;
}



////



static inline uint8_t ccIsPow2Int8( uint8_t v )
{
  return ( ( v & ( v - 1 ) ) == 0 );
}

static inline uint16_t ccIsPow2Int16( uint16_t v )
{
  return ( ( v & ( v - 1 ) ) == 0 );
}

static inline uint32_t ccIsPow2Int32( uint32_t v )
{
  return ( ( v & ( v - 1 ) ) == 0 );
}

static inline uint64_t ccIsPow2Int64( uint64_t v )
{
  return ( ( v & ( v - 1 ) ) == 0 );
}


static inline uint8_t ccPow2Round8( uint8_t v )
{
  v--;
  v |= v >> 1;
  v |= v >> 2;
  v |= v >> 4;
  v++;
  return v;
}

static inline uint16_t ccPow2Round16( uint16_t v )
{
  v--;
  v |= v >> 1;
  v |= v >> 2;
  v |= v >> 4;
  v |= v >> 8;
  v++;
  return v;
}

static inline uint32_t ccPow2Round32( uint32_t v )
{
  v--;
  v |= v >> 1;
  v |= v >> 2;
  v |= v >> 4;
  v |= v >> 8;
  v |= v >> 16;
  v++;
  return v;
}

static inline uint64_t ccPow2Round64( uint64_t v )
{
  v--;
  v |= v >> 1;
  v |= v >> 2;
  v |= v >> 4;
  v |= v >> 8;
  v |= v >> 16;
  v |= v >> 32;
  v++;
  return v;
}

#if CPUCONF_LONG_SIZE == 8
 #define ccPow2RoundL(v) ccPow2Round64(v)
#else
 #define ccPow2RoundL(v) ccPow2Round32(v)
#endif



////



static inline uint32_t ccTestNullByte32( uint32_t v )
{
  return ( v - 0x01010101 ) & ~v & 0x80808080;
}

static inline uint64_t ccTestNullByte64( uint64_t v )
{
  return ( v - 0x0101010101010101ULL ) & ~v & 0x8080808080808080ULL;
}

static inline uint32_t ccSignBit32( uint32_t v )
{
  return v >> 31;
}

static inline uint64_t ccSignBit64( uint64_t v )
{
  return v >> 63;
}

static inline uint32_t ccAbs32( int32_t v )
{
  int32_t mask;
  mask = v >> 31;
  return ( v ^ mask ) - mask;
}

static inline uint64_t ccAbs64( int64_t v )
{
  int64_t mask;
  mask = (int32_t)(v >> 63);
  return ( v ^ mask ) - mask;
}



////



static inline int32_t ccMortonNumber32( int32_t x, int32_t y )
{
  int i;
  uint32_t z;
  z = 0;
  for( i = 0 ; i < 16 ; i++ )
  {
    z |= ( x & ( ((uint32_t)1) << i ) ) << i;
    z |= ( y & ( ((uint32_t)1) << i ) ) << ( i + 1 );
  }
  return z;
}

static inline int64_t ccMortonNumber64( int32_t x, int32_t y )
{
  int i;
  uint64_t z;
  z = 0;
  for( i = 0 ; i < 16 ; i++ )
  {
    z |= ( x & ( ((uint64_t)1) << i ) ) << i;
    z |= ( y & ( ((uint64_t)1) << i ) ) << ( i + 1 );
  }
  return z;
}



////



static inline int ccStrCmpEqualInline( char *s0, char *s1 )
{
  int i;
  for( i = 0 ; ; i++ )
  {
    if( s0[i] != s1[i] )
      return 0;
    if( !( s0[i] ) )
      break;
  }
  return 1;
}

static inline int ccIsAlphaNum( char c )
{
  if( ( c >= 'a' ) && ( c <= 'z' ) )
    return 1;
  if( ( c >= 'A' ) && ( c <= 'Z' ) )
    return 1;
  if( ( c >= '0' ) && ( c <= '9' ) )
    return 1;
  return 0;
}

static inline int ccIsAlphaNumExtended( unsigned char c )
{
  if( ( c >= 'a' ) && ( c <= 'z' ) )
    return 1;
  if( ( c >= 'A' ) && ( c <= 'Z' ) )
    return 1;
  if( ( c >= '0' ) && ( c <= '9' ) )
    return 1;
  if( c >= 128 )
    return 1;
  return 0;
}

static inline int ccCharHexBase( char c )
{
  int hex;
  if( ( c >= '0' ) && ( c <= '9' ) )
    hex = c - '0';
  else if( ( c >= 'A' ) && ( c <= 'F' ) )
    hex = c - ('A'-10);
  else if( ( c >= 'a' ) && ( c <= 'f' ) )
    hex = c - ('a'-10);
  else
    hex = -1;
  return hex;
}


void ccStrLowCase( char *str, int length );
void ccStrLowCopy( char *dst, char *src, int length );
int ccStrCmpEqual( char *s0, char *s1 );
int ccStrCmpEqualTest( char *s0, char *s1 );
int ccStrCmpStdTest( char *s0, char *s1 );
char *ccStrCmpWord( char *str, char *word );
char *ccStrCmpSeq( char *str, char *seq, int seqlength );
char *ccStrMatchSeq( char *str, char *seq, int seqlength );
char *ccSeqCmpSeq( char *s1, char *s2, int s1length, int s2length );
int ccStrWordCmpWord( char *s1, char *s2 );
char *ccStrLowCmpWord( char *str, char *word );
char *ccStrLowCmpSeq( char *str, char *seq, int seqlength );
char *ccStrFindStr( char *str0, char *str1 );
char *ccStrFindStrSkip( char *str0, char *str1 );
char *ccStrFindSeq( char *str, char *seq, int seqlength );
char *ccStrFindWord( char *str, char *word, int wordlength );
int ccStrWordLength( char *str );
int ccStrFindChar( char *str, char c );
int ccSeqFindChar( char *seq, int seqlen, char c );
int ccStrFindCharLast( char *str, char c );
int ccSeqFindCharLast( char *seq, int seqlen, char c );
char *ccSeqFindStr( char *seq, int seqlen, char *str );
char *ccSeqFindStrSkip( char *seq, int seqlen, char *str );
char *ccStrParam( char *str, int *retparamlen, int *retskiplen );
int ccParseParameters( char *str, char **argv, int argcountmax );
int ccParseParametersCut( char *str, char **argv, int argcountmax );
char *ccStrNextWord( char *str );
char *ccStrSkipWord( char *str );
char *ccStrEndWord( char *str );
char *ccStrNextWordSameLine( char *str );
char *ccStrNextParam( char *str );
char *ccStrNextLine( char *str );
char *ccStrPassLine( char *str );
int ccStrParseInt32( char *str, int32_t *retint );
int ccSeqParseInt32( char *seq, int seqlength, int32_t *retint );
int ccStrParseInt64( char *str, int64_t *retint );
int ccSeqParseInt64( char *seq, int seqlength, int64_t *retint );
int ccStrParseFloat( char *str, float *retfloat );
int ccSeqParseFloat( char *seq, int seqlength, float *retfloat );
int ccStrParseDouble( char *str, double *retdouble );
int ccSeqParseDouble( char *seq, int seqlength, double *retdouble );
int ccStrParseHex( char *str, int hexchars );
char *ccStrAllocPrintf( char *format, ... );
char *ccStrDup( char *str );
int ccUnicodeToUtf8( char *s, uint32_t unicode );
/* Returns 1 when data is insufficient, send more bytes ; state must be initialized to zero */
uint32_t ccUtf8ToUnicode( uint32_t byte, uint32_t *state, uint32_t *retunicode );


////


#define CC_FLT_INT_MAPPING

#if CPUCONF_FLOAT_SIZE == 4
typedef uint32_t ccuintf;
#elif CPUCONF_FLOAT_SIZE == 8
typedef uint64_t ccuintf;
#else
 #undef CC_FLT_INT_MAPPING
#endif

#if CPUCONF_DOUBLE_SIZE == 4
typedef uint32_t ccuintd;
#elif CPUCONF_DOUBLE_SIZE == 8
typedef uint64_t ccuintd;
#else
 #undef CC_FLT_INT_MAPPING
#endif


#ifdef CC_FLT_INT_MAPPING

static inline ccuintf ccFloatToUint( float f )
{
  void *p = &f;
  return *((ccuintf *)p);
}

static inline float ccUintToFloat( ccuintf f )
{
  void *p = &f;
  return *((float *)p);
}


static inline ccuintd ccDoubleToUint( double d )
{
  void *p = &d;
  return *((ccuintd *)p);
}

static inline double ccUintToDouble( ccuintd d )
{
  void *p = &d;
  return *((double *)p);
}

#endif



////



#define CC_LOG2_E 1.4426950408889634073599246810018921

static inline float ccFastExpFloat( float x )
{
  union
  {
    uint32_t i;
    float f;
  } u;
  if( x > 88.0 )
    return expf( x );
  else if( x < -80.0 )
    return 0.0;
  u.i = (int32_t)( x * ( (float)0x800000 * (float)CC_LOG2_E ) ) + ( 0x3f800000 - 486408 );
  return u.f;
}

static inline float ccFastExpFloatNearZero( float x )
{
  union
  {
    uint32_t i;
    float f;
  } u;
  if( x > 88.0 )
    return expf( x );
  else if( x < -80.0 )
    return 0.0;
  u.i = (int32_t)( x * ( (float)0x800000 * (float)CC_LOG2_E ) ) + 0x3f800000;
  return u.f;
}

static inline double ccFastExpDouble( double x )
{
#if CPUCONF_WORD_SIZE >= 64
  union
  {
    uint64_t i;
    double d;
  } u;
  if( x > 88.0 )
    return exp( x );
  else if( x < -80.0 )
    return 0.0;
  u.i = (int64_t)( x * ( (double)0x10000000000000 * CC_LOG2_E ) ) + ( (uint64_t)0x3ff0000000000000 - (uint64_t)261138306564096 );
  return u.d;
#else
  union
  {
    uint32_t i[2];
    double d;
  } u;
  if( x > 88.0 )
    return expf( (float)x );
  else if( x < -80.0 )
    return 0.0;
 #ifdef CPUCONF_LITTLE_ENDIAN
  u.i[1] = (int32_t)( x * ( (double)0x100000 * CC_LOG2_E ) ) + ( 0x3ff00000 - 60801 );
  u.i[0] = 0;
 #else
  u.i[0] = (int32_t)( x * ( (double)0x100000 * CC_LOG2_E ) ) + ( 0x3ff00000 - 60801 );
  u.i[1] = 0;
 #endif
  return u.d;
#endif
}

static inline double ccFastExpDoubleNearZero( double x )
{
#if CPUCONF_WORD_SIZE >= 64
  union
  {
    uint64_t i;
    double d;
  } u;
  if( x > 88.0 )
    return expf( x );
  else if( x < -80.0 )
    return 0.0;
  u.i = (int64_t)( x * ( (double)0x10000000000000 * CC_LOG2_E ) ) + (uint64_t)0x3ff0000000000000;
  return u.d;
#else
  union
  {
    uint32_t i[2];
    double d;
  } u;
  if( x > 88.0 )
    return expf( (float)x );
  else if( x < -80.0 )
    return 0.0;
 #ifdef CPUCONF_LITTLE_ENDIAN
  u.i[1] = (int32_t)( x * ( (double)0x100000 * CC_LOG2_E ) ) + 0x3ff00000;
  u.i[0] = 0;
 #else
  u.i[0] = (int32_t)( x * ( (double)0x100000 * CC_LOG2_E ) ) + 0x3ff00000;
  u.i[1] = 0;
 #endif
  return u.d;
#endif
}



////



static inline float ccFastLog2Float( float x )
{
  int base;
  union
  {
    uint32_t i;
    float f;
  } u;
  u.f = x;
  base = ( ( u.i >> 23 ) & 0xff ) - 0x80;
  u.i &= ~( (uint32_t)0xff << 23 );
  u.i += (uint32_t)0x7f << 23;
  return (float)base + ( u.f * ( 2.0f + u.f * ( -1.0f/3.0f ) ) ) - ( 2.0f/3.0f );
}

static inline float ccFastLog2Double( double x )
{
#if CPUCONF_WORD_SIZE >= 64
  int base;
  union
  {
    uint64_t i;
    double f;
  } u;
  u.f = x;
  base = ( ( u.i >> 52 ) & 0x7ff ) - 0x400;
  u.i &= ~( (uint64_t)0x7ff << 52 );
  u.i += (uint64_t)0x3ff << 52;
#else
  int base;
  union
  {
    uint32_t i[2];
    double f;
  } u;
  u.f = x;
  base = ( ( u.i[1] >> 20 ) & 0x7ff ) - 0x400;
  u.i[1] &= ~( (uint32_t)0x7ff << 20 );
  u.i[1] += (uint32_t)0x3ff << 20;
#endif
  return (float)(base + ( u.f * ( 2.0f + u.f * ( -1.0f/3.0f ) ) ) - ( 2.0f/3.0f ));
}



////


/* Only valid between -M_PI and M_PI */
static inline float ccFastSinFloat( float x )
{
  float s;
  s = (float)(( 1.27323954474 * x ) + ( -0.405284734569 * x * fabsf( x ) ));
  return s;
}

/* Only valid between -M_PI and M_PI */
static inline double ccFastSinDouble( double x )
{
  double s;
  s = ( 1.27323954474 * x ) + ( -0.405284734569 * x * fabs( x ) );
  return s;
}



////



#define CC_INT16_BSWAP(i) (__extension__({uint16_t bsw=(i);((bsw&0xff)<<8)|(bsw>>8);}))
#define CC_INT32_BSWAP(i) (__extension__({uint32_t bsw=(i);(bsw<<24)|((bsw&0xff00)<<8)|((bsw>>8)&0xff00)|(bsw>>24);}))
#define CC_INT64_BSWAP(i) (__extension__({uint64_t bsw=(i);(bsw>>56)|((bsw&0x00ff000000000000LL)>>40)|((bsw&0x0000ff0000000000LL)>>24)|((bsw&0x000000ff00000000LL)>>8)|((bsw&0x00000000ff000000LL)<<8)|((bsw&0x0000000000ff0000LL)<<24)|((bsw&0x000000000000ff00LL)<<40)|(bsw<<56);}))


static inline uint16_t ccByteSwap16( uint16_t i )
{
  return (uint16_t)(CC_INT16_BSWAP( i ));
}

#if defined(__GNUC__) && defined(__i386__)

static inline uint32_t ccByteSwap32( uint32_t i )
{
  __asm__( "bswap %0" : "=r" (i) : "0" (i) );
  return i;
}

static inline uint64_t ccByteSwap64( uint64_t i )
{
  union {
    uint32_t s[2];
    uint64_t i;
  } u;
  u.i = i;
  __asm__( "bswapl %0 ; bswapl %1 ; xchgl %0,%1" : "=r" (u.s[0]), "=r" (u.s[1]) : "0" (u.s[0]), "1" (u.s[1]) );
  return u.i;
}

#elif defined(__GNUC__) && defined(__x86_64__)

static inline uint32_t ccByteSwap32( uint32_t i )
{
  __asm__( "bswapl %0" : "=r" (i) : "0" (i) );
  return i;
}

static inline uint64_t ccByteSwap64( uint64_t i )
{
  __asm__( "bswapq %0" : "=r" (i) : "0" (i) );
  return i;
}

#else

static inline uint32_t ccByteSwap32( uint32_t i )
{
  return CC_INT32_BSWAP( i );
}

static inline uint64_t ccByteSwap64( uint64_t i )
{
  return CC_INT64_BSWAP( i );
}

#endif

static inline float ccByteSwapf( float f )
{
  uint32_t i;
  void *p;
  p = &f;
  i = ccByteSwap32( *((uint32_t *)p) );
  p = &i;
  return *((float *)p);
}

static inline double ccByteSwapd( double f )
{
  uint64_t i;
  void *p;
  p = &f;
  i = ccByteSwap64( *((uint64_t *)p) );
  p = &i;
  return *((double *)p);
}


static inline uint32_t ccAlignInt32( uint32_t i )
{
  i--;
  i |= i >> 1;
  i |= i >> 2;
  i |= i >> 4;
  i |= i >> 8;
  i |= i >> 16;
  return i + 1;
}

static inline uint64_t ccAlignInt64( uint64_t i )
{
  i--;
  i |= i >> 1;
  i |= i >> 2;
  i |= i >> 4;
  i |= i >> 8;
  i |= i >> 16;
  i |= i >> 32;
  return i + 1;
}

static inline uintptr_t ccAlignIntPtr( uintptr_t i )
{
  i--;
  i |= i >> 1;
  i |= i >> 2;
  i |= i >> 4;
  i |= i >> 8;
  i |= i >> 16;
#if CPUCONF_INTPTR_BITS > 32
  i |= i >> 32;
#endif
  return i + 1;
}



////



static inline uint8_t ccRotateLeft8( uint8_t x, int bits )
{
  return ( x << bits ) | ( x >> ( 8 - bits ) );
}

static inline uint16_t ccRotateLeft16( uint16_t x, int bits )
{
  return ( x << bits ) | ( x >> ( 16 - bits ) );
}

static inline uint32_t ccRotateLeft32( uint32_t x, int bits )
{
  return ( x << bits ) | ( x >> ( 32 - bits ) );
}

static inline uint64_t ccRotateLeft64( uint64_t x, int bits )
{
  return ( x << bits ) | ( x >> ( 64 - bits ) );
}


static inline uint8_t ccRotateRight8( uint8_t x, int bits )
{
  return ( x >> bits ) | ( x << ( 8 - bits ) );
}

static inline uint16_t ccRotateRight16( uint16_t x, int bits )
{
  return ( x >> bits ) | ( x << ( 16 - bits ) );
}

static inline uint32_t ccRotateRight32( uint32_t x, int bits )
{
  return ( x >> bits ) | ( x << ( 32 - bits ) );
}

static inline uint64_t ccRotateRight64( uint64_t x, int bits )
{
  return ( x >> bits ) | ( x << ( 64 - bits ) );
}


////


#define CC_INT32_MAX ((((uint32_t)1)<<31)-1)

static inline int32_t ccFloatToInt32Sat( float f )
{
  if( f >= (float)CC_INT32_MAX )
    return CC_INT32_MAX;
  else if( f <= -(float)CC_INT32_MAX )
    return -CC_INT32_MAX;
  else
    return (int32_t)f;
}


static inline int32_t ccDoubleToInt32Sat( double f )
{
  if( f >= (double)CC_INT32_MAX )
    return CC_INT32_MAX;
  else if( f <= -(double)CC_INT32_MAX )
    return -CC_INT32_MAX;
  else
    return (int32_t)f;
}


#define CC_INT64_MAX ((((uint64_t)1)<<63)-1)

static inline int64_t ccFloatToInt64Sat( float f )
{
  if( f >= (float)CC_INT64_MAX )
    return CC_INT64_MAX;
  else if( f <= -(float)CC_INT64_MAX )
    return -CC_INT64_MAX;
  else
    return (int64_t)f;
}


static inline int64_t ccDoubleToInt64Sat( double f )
{
  if( f >= (double)CC_INT64_MAX )
    return CC_INT64_MAX;
  else if( f <= -(double)CC_INT64_MAX )
    return -CC_INT64_MAX;
  else
    return (int64_t)f;
}


////



void ccQuickSort( void **table, int count, int (*sortfunc)( void *t0, void *t1 ), uint32_t randmask );
void ccQuickSortContext( void **table, int count, int (*sortfunc)( void *context, void *t0, void *t1 ), void *context, uint32_t randmask );

int ccMergeSort( void **src, void **tmp, int count, int (*sortfunc)( void *t0, void *t1 ) );
int ccMergeSortContext( void **src, void **tmp, int count, int (*sortfunc)( void *context, void *t0, void *t1 ), void *context );

void ccHybridSort( void **table, void **tmp, int count, int (*sortfunc)( void *t0, void *t1 ), uint32_t randmask );
void ccHybridSortContext( void **table, void **tmp, int count, int (*sortfunc)( void *context, void *t0, void *t1 ), void *context, uint32_t randmask );



////



void ccDebugLog( char *filename, char *string, ... );


////


typedef struct
{
  size_t allocsize;
  size_t offset;
  char *data;
} ccGrowth;

void ccGrowthInit( ccGrowth *growth, int defaultsize );
int ccGrowthPrintf( ccGrowth *growth, char *format, ... );
int ccGrowthData( ccGrowth *growth, void *data, size_t size );
int ccGrowthSeek( ccGrowth *growth, int offset );
void ccGrowthFree( ccGrowth *growth );
void ccGrowthElapsedTimeString( ccGrowth *growth, int64_t timecount, int maxfieldcount );


////


void *ccFileLoad( const char *path, size_t maxsize, size_t *retsize );
size_t ccFileLoadDirect( const char *path, void *data, size_t minsize, size_t maxsize );
int ccFileStore( const char *path, void *data, size_t datasize, int fsyncflag );
int ccFileExists( char *path );
int ccFileStat( char *path, size_t *retfilesize, time_t *retfiletime );
int ccRenameFile( char *oldpath, char *newpath );


////


typedef struct _ccDir ccDir;

ccDir *ccOpenDir( char *path );
char *ccReadDir( ccDir *dir );
void ccCloseDir( ccDir *dir );


////


int64_t ccGetFreeDiskSpace( char *dirpath );


////


int ccGetTimeOfDay( struct timeval *tv );

void ccSleep( int milliseconds );

static inline uint64_t ccGetMillisecondsTime()
{
  struct timeval lntime;
  ccGetTimeOfDay( &lntime );
  return ( (uint64_t)lntime.tv_sec * 1000 ) + ( (uint64_t)lntime.tv_usec / 1000 );
}

static inline uint64_t ccGetMicrosecondsTime()
{
  struct timeval lntime;
  ccGetTimeOfDay( &lntime );
  return ( (uint64_t)lntime.tv_sec * 1000000 ) + (uint64_t)lntime.tv_usec;
}

static inline uint64_t ccGetNanosecondsTime()
{
  struct timeval lntime;
  ccGetTimeOfDay( &lntime );
  return ( (uint64_t)lntime.tv_sec * 1000000000 ) + ( (uint64_t)lntime.tv_usec * 1000 );
}


////


/* Returned string must be free()d */
char *ccGetSystemName();
