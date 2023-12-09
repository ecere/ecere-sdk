/* *****************************************************************************
 * Copyright (c) 2007-2014 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <limits.h>
#include <float.h>
#include <time.h>
#include <stdarg.h>
#include <time.h>
#include <errno.h>
#include <assert.h>

#include "cc.h"

#if CC_UNIX
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/time.h>
 #include <unistd.h>
 #include <fcntl.h>
 #include <sys/utsname.h> /* For uname() */
 #include <dirent.h> /* For readdir() */
 #include <sys/statvfs.h> /* For statvfs( ) */
#elif CC_WINDOWS
 #include <windows.h>
 #include <direct.h>
 #include <sys/types.h>
 #include <sys/stat.h>
#else
 #error Unknown/Unsupported platform!
#endif



////



const size_t ccTypeSize[CC_TYPE_COUNT] =
{
 [CC_TYPE_UINT8] = sizeof(uint8_t),
 [CC_TYPE_INT8] = sizeof(int8_t),
 [CC_TYPE_UINT16] = sizeof(uint16_t),
 [CC_TYPE_INT16] = sizeof(int16_t),
 [CC_TYPE_UINT32] = sizeof(uint32_t),
 [CC_TYPE_INT32] = sizeof(int32_t),
 [CC_TYPE_UINT64] = sizeof(uint64_t),
 [CC_TYPE_INT64] = sizeof(int64_t),
 [CC_TYPE_FLOAT] = sizeof(float),
 [CC_TYPE_DOUBLE] = sizeof(double)
};


////


#define CC_HASH_READ8(d,o) ((uint32_t)(((uint8_t *)d)[o]))
#define CC_HASH_AREAD16(d,o) ((uint32_t)(*((uint16_t *)ADDRESS(d,o))))
#define CC_HASH_UREAD16(d,o) ((((uint32_t)(((uint8_t *)(d))[o+1]))<<8)+(uint32_t)(((uint8_t *)(d))[o]))

uint32_t ccHash32Data( void *data, int size )
{
  uint32_t hash;
  int rem;
  rem = size & 3;
  size >>= 2;
  hash = 0;
  if( !( ( (uintptr_t)data ) & 0x1 ) )
  {
    for( ; size ; size-- )
    {
      hash += CC_HASH_AREAD16( data, 0 );
      hash = ( hash << 16 ) ^ ( ( CC_HASH_AREAD16( data, 2 ) << 11 ) ^ hash );
      hash += hash >> 11;
      data = ADDRESS( data, 4 );
    }
  }
  else
  {
    for( ; size ; size-- )
    {
      hash += CC_HASH_UREAD16( data, 0 );
      hash = ( hash << 16 ) ^ ( ( CC_HASH_UREAD16( data, 2 ) << 11 ) ^ hash );
      hash += hash >> 11;
      data = ADDRESS( data, 4 );
    }
  }
  switch( rem )
  {
    case 3:
      hash += CC_HASH_UREAD16( data, 0 );
      hash ^= hash << 16;
      hash ^= CC_HASH_READ8( data, 2 ) << 18;
      hash += hash >> 11;
      break;
    case 2:
      hash += CC_HASH_UREAD16( data, 0 );
      hash ^= hash << 11;
      hash += hash >> 17;
      break;
    case 1:
      hash += CC_HASH_READ8( data, 0 );
      hash ^= hash << 10;
      hash += hash >> 1;
      break;
    case 0:
      break;
  }
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

uint32_t ccHash32Int32( uint32_t i )
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

uint32_t ccHash32Int64( uint64_t i )
{
  uint32_t hash;
  hash = i & 0xFFFF;
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

uint32_t ccHash32Array32( uint32_t *data, int count )
{
  uint32_t hash;
  hash = 0;
  for( ; count ; count-- )
  {
    hash += *data & 0xFFFF;
    hash = ( ( hash << 16 ) ^ hash ) ^ ( ( *data & 0xFFFF0000 ) >> 5 );
    hash += hash >> 11;
    data = ADDRESS( data, 4 );
  }
  hash ^= hash << 3;
  hash += hash >> 5;
  hash ^= hash << 4;
  hash += hash >> 17;
  hash ^= hash << 25;
  hash += hash >> 6;
  return hash;
}

uint32_t ccHash32Array64( uint64_t *data, int count )
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
    hash = ( ( hash << 16 ) ^ hash ) ^ (uint32_t)( ( v & 0xFFFF000000000000LL ) >> 37 );
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


////


int ccMemCmp( void *s0, void *s1, int size )
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

int ccMemCmp32( uint32_t *s0, uint32_t *s1, int count )
{
  int i;
  for( i = 0 ; i < count ; i++ )
  {
    if( s0[i] != s1[i] )
      return 0;
  }
  return 1;
}

int ccMemCmp64( uint64_t *s0, uint64_t *s1, int count )
{
  int i;
  for( i = 0 ; i < count ; i++ )
  {
    if( s0[i] != s1[i] )
      return 0;
  }
  return 1;
}

int ccMemCmpSize( void *s0, void *s1, int size )
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


uint8_t ccLog2Int8( uint8_t v )
{
  uint8_t r = 0;
  if( v & 0xC )
  {
    v >>= 2;
    r |= 2;
  }
  if( v & 0x2 )
  {
    v >>= 1;
    r |= 1;
  }
  return r;
}

uint16_t ccLog2Int16( uint16_t v )
{
  uint16_t r = 0;
  if( v & 0xFF00 )
  {
    v >>= 8;
    r |= 8;
  }
  if( v & 0xF0 )
  {
    v >>= 4;
    r |= 4;
  }
  if( v & 0xC )
  {
    v >>= 2;
    r |= 2;
  }
  if( v & 0x2 )
  {
    v >>= 1;
    r |= 1;
  }
  return r;
}

uint32_t ccLog2Int32( uint32_t v )
{
  uint32_t r = 0;
  if( v & 0xFFFF0000 )
  {
    v >>= 16;
    r |= 16;
  }
  if( v & 0xFF00 )
  {
    v >>= 8;
    r |= 8;
  }
  if( v & 0xF0 )
  {
    v >>= 4;
    r |= 4;
  }
  if( v & 0xC )
  {
    v >>= 2;
    r |= 2;
  }
  if( v & 0x2 )
  {
    v >>= 1;
    r |= 1;
  }
  return r;
}

uint64_t ccLog2Int64( uint64_t v )
{
  uint64_t r = 0;
  if( v & 0xFFFFFFFF00000000LL )
  {
    v >>= 32;
    r |= 32;
  }
  if( v & 0xFFFF0000 )
  {
    v >>= 16;
    r |= 16;
  }
  if( v & 0xFF00 )
  {
    v >>= 8;
    r |= 8;
  }
  if( v & 0xF0 )
  {
    v >>= 4;
    r |= 4;
  }
  if( v & 0xC )
  {
    v >>= 2;
    r |= 2;
  }
  if( v & 0x2 )
  {
    v >>= 1;
    r |= 1;
  }
  return r;
}


////


#define CC_CHAR_IS_CONTROL(c) ((c)<' ')
#define CC_CHAR_IS_DELIMITER(c) ((c)<=' ')


void ccStrLowCase( char *str, int length )
{
  int i;
  for( i = 0 ; i < length ; i++ )
  {
    if( ( str[i] >= 'A' ) && ( str[i] <= 'Z' ) )
      str[i] += 'a' - 'A';
  }
  return;
}


void ccStrLowCopy( char *dst, char *src, int length )
{
  int i;
  for( i = 0 ; i < length ; i++ )
  {
    dst[i] = src[i];
    if( ( src[i] >= 'A' ) && ( src[i] <= 'Z' ) )
      dst[i] = src[i] + 'a' - 'A';
  }
  dst[i] = 0;
  return;
}


int ccStrCmpEqual( char *s0, char *s1 )
{
  int i;
  if( !( s0 ) )
    return ( s1 ? 0 : 1 );
  else if( !( s1 ) )
    return 0;
  for( i = 0 ; ; i++ )
  {
    if( s0[i] != s1[i] )
      return 0;
    if( !( s0[i] ) )
      break;
  }
  return 1;
}


int ccStrCmpEqualTest( char *s0, char *s1 )
{
  int i;
  if( !( s0 ) )
    return ( s1 ? 0 : 1 );
  else if( !( s1 ) )
    return 0;
  for( i = 0 ; ; i++ )
  {
    if( s0[i] != s1[i] )
      return 0;
    if( !( s0[i] ) )
      break;
  }
  return 1;
}


int ccStrCmpStdTest( char *s0, char *s1 )
{
  int i;
  if( !( s0 ) )
    return ( s1 ? -1 : 0 );
  else if( !( s1 ) )
    return 1;
  for( i = 0 ; ; i++ )
  {
    if( s0[i] != s1[i] )
      return( s0[i] > s1[i] ? 1 : -1 );
    if( !( s0[i] ) )
      break;
  }
  return 0;
}


char *ccStrCmpWord( char *str, char *word )
{
  int i;
  if( !( str ) )
    return 0;
  for( i = 0 ; ; i++ )
  {
    if( !( word[i] ) )
      return str + i;
    if( str[i] != word[i] )
      break;
  }
  return 0;
}


char *ccStrCmpSeq( char *str, char *seq, int seqlength )
{
  int i;
  if( !( str ) )
    return 0;
  for( i = 0 ; ; i++ )
  {
    if( i >= seqlength )
      return str + i;
    if( str[i] != seq[i] )
      break;
  }
  return 0;
}


char *ccStrMatchSeq( char *str, char *seq, int seqlength )
{
  int i;
  if( !( str ) )
    return 0;
  for( i = 0 ; ; i++ )
  {
    if( i >= seqlength )
    {
      if( str[i] )
        break;
      return str + i;
    }
    if( str[i] != seq[i] )
      break;
  }
  return 0;
}


char *ccSeqCmpSeq( char *s1, char *s2, int s1length, int s2length )
{
  int i;
  if( s1length != s2length )
    return 0;
  for( i = 0 ; i < s1length ; i++ )
  {
    if( s1[i] != s2[i] )
      break;
  }
  return s1 + i;
}


int ccStrWordCmpWord( char *s1, char *s2 )
{
  int i;
  for( i = 0 ; ; i++ )
  {
    if( s1[i] != s2[i] )
      break;
    if( CC_CHAR_IS_DELIMITER( s1[i] ) )
    {
      if( CC_CHAR_IS_DELIMITER( s2[i] ) )
        return 1;
      else
        return 0;
    }
  }
  if( ( CC_CHAR_IS_DELIMITER( s1[i] ) ) && ( CC_CHAR_IS_DELIMITER( s2[i] ) ) )
    return 1;
  return 0;
}


char *ccStrLowCmpWord( char *str, char *word )
{
  int i;
  char c1, c2;
  if( !( str ) )
    return 0;
  for( i = 0 ; ; i++ )
  {
    if( !( word[i] ) )
    {
      if( CC_CHAR_IS_DELIMITER( str[i] ) )
        return str + i;
      else
        return 0;
    }
    c1 = str[i];
    if( ( c1 >= 'A' ) && ( c1 <= 'Z' ) )
      c1 += 'a' - 'A';
    c2 = word[i];
    if( ( c2 >= 'A' ) && ( c2 <= 'Z' ) )
      c2 += 'a' - 'A';
    if( c1 != c2 )
      break;
  }
  return 0;
}


char *ccStrLowCmpSeq( char *str, char *seq, int seqlength )
{
  int i;
  char c1, c2;
  if( !( str ) )
    return 0;
  for( i = 0 ; ; i++ )
  {
    if( i >= seqlength )
    {
      if( CC_CHAR_IS_DELIMITER( str[i] ) )
        return str + i;
      else
        return 0;
    }
    c1 = str[i];
    if( ( c1 >= 'A' ) && ( c1 <= 'Z' ) )
      c1 += 'a' - 'A';
    c2 = seq[i];
    if( ( c2 >= 'A' ) && ( c2 <= 'Z' ) )
      c2 += 'a' - 'A';
    if( c1 != c2 )
      break;
  }
  return 0;
}


char *ccStrFindStr( char *str0, char *str1 )
{
  int i;
  if( !( str0 ) )
    return 0;
  for( ; *str0 ; str0++ )
  {
    for( i = 0 ; ; i++ )
    {
      if( !( str1[i] ) )
        return str0;
      if( str0[i] != str1[i] )
        break;
    }
  }
  return 0;
}


char *ccStrFindStrSkip( char *str0, char *str1 )
{
  int i;
  if( !( str0 ) )
    return 0;
  for( ; *str0 ; str0++ )
  {
    for( i = 0 ; ; i++ )
    {
      if( !( str1[i] ) )
        return str0 + i;
      if( str0[i] != str1[i] )
        break;
    }
  }
  return 0;
}


char *ccStrFindSeq( char *str, char *seq, int seqlength )
{
  int i;
  if( !( str ) )
    return 0;
  for( ; *str ; str++ )
  {
    for( i = 0 ; ; i++ )
    {
      if( i >= seqlength )
        return str;
      if( str[i] != seq[i] )
        break;
    }
  }
  return 0;
}


char *ccStrFindWord( char *str, char *word, int wordlength )
{
  int i, wordflag;
  wordflag = 0;
  if( !( str ) )
    return 0;
  for( ; *str ; str++ )
  {
    if( CC_CHAR_IS_DELIMITER( *str ) )
    {
      wordflag = 0;
      continue;
    }
    else if( wordflag )
      continue;
    for( i = 0 ; ; i++ )
    {
      if( i >= wordlength )
      {
        if( CC_CHAR_IS_DELIMITER( str[i] ) )
          return str;
        return 0;
      }
      if( str[i] != word[i] )
      {
        wordflag = 1;
        str += i;
        break;
      }
    }
  }
  return 0;
}


int ccStrWordLength( char *str )
{
  int i;
  if( !( str ) )
    return 0;
  for( i = 0 ; ; i++ )
  {
    if( CC_CHAR_IS_DELIMITER( str[i] ) )
      break;
  }
  return i;
}


int ccStrFindChar( char *str, char c )
{
  int i;
  if( !( str ) )
    return -1;
  for( i = 0 ; str[i] ; i++ )
  {
    if( str[i] == c )
      return i;
  }
  return -1;
}


int ccSeqFindChar( char *seq, int seqlen, char c )
{
  int i;
  for( i = 0 ; i < seqlen ; i++ )
  {
    if( seq[i] == c )
      return i;
  }
  return -1;
}


int ccStrFindCharLast( char *str, char c )
{
  int i, last;
  if( !( str ) )
    return -1;
  last = -1;
  for( i = 0 ; str[i] ; i++ )
  {
    if( str[i] == c )
      last = i;
  }
  return last;
}


int ccSeqFindCharLast( char *seq, int seqlen, char c )
{
  int i, last;
  last = -1;
  for( i = 0 ; i < seqlen ; i++ )
  {
    if( seq[i] == c )
      last = i;
  }
  return last;
}


char *ccSeqFindStr( char *seq, int seqlen, char *str )
{
  int i;
  for( ; seqlen ; seqlen--, seq++ )
  {
    for( i = 0 ; i < seqlen ; i++ )
    {
      if( !str[i] )
        return seq;
      if( seq[i] != str[i] )
        break;
    }
  }
  return 0;
}


char *ccSeqFindStrSkip( char *seq, int seqlen, char *str )
{
  int i;
  for( ; seqlen ; seqlen--, seq++ )
  {
    for( i = 0 ; i < seqlen ; i++ )
    {
      if( !str[i] )
        return seq + i;
      if( seq[i] != str[i] )
        break;
    }
  }
  return 0;
}


char *ccStrParam( char *str, int *retparamlen, int *retskiplen )
{
  int i;
  if( !( str ) )
    return 0;
  if( str[0] == '"' )
  {
    for( i = 1 ; ; i++ )
    {
      if( str[i] == '"' )
        break;
      if( CC_CHAR_IS_CONTROL( str[i] ) )
        return 0;
    }
    if( !( CC_CHAR_IS_DELIMITER( str[i+1] ) ) )
      return 0;
    *retparamlen = i-1;
    *retskiplen = i+1;
    return str+1;
  }
  if( CC_CHAR_IS_DELIMITER( str[0] ) )
    return 0;
  for( i = 1 ; ; i++ )
  {
    if( CC_CHAR_IS_DELIMITER( str[i] ) )
      break;
  }
  *retparamlen = i;
  *retskiplen = i;
  return str;
}


int ccParseParameters( char *str, char **argv, int argcountmax )
{
  int argc, paramlen, skiplen;
  char *param;

  if( !( str ) )
    return 0;
  for( argc = 0 ; argc < argcountmax ; )
  {
    if( !( str = ccStrNextWordSameLine( str ) ) )
      break;
    param = ccStrParam( str, &paramlen, &skiplen );
    if( argv )
      argv[argc] = param;
    argc++;
    if( !( param ) )
      break;
    if( !( param[paramlen] ) )
      break;
    str += skiplen + 1;
  }

  return argc;
}


int ccParseParametersCut( char *str, char **argv, int argcountmax )
{
  int argc, paramlen, skiplen;
  char *param;

  if( !( str ) )
    return 0;
  for( argc = 0 ; argc < argcountmax ; )
  {
    if( !( str = ccStrNextWordSameLine( str ) ) )
      break;
    param = ccStrParam( str, &paramlen, &skiplen );
    if( argv )
      argv[argc] = param;
    argc++;
    if( !( param ) )
      break;
    if( !( param[paramlen] ) )
      break;
    param[paramlen] = 0;
    str += skiplen + 1;
  }

  return argc;
}


char *ccStrNextWord( char *str )
{
  if( !( str ) )
    return 0;
  for( ; ; str++ )
  {
    if( *str == 0 )
      return 0;
    if( !( CC_CHAR_IS_DELIMITER( *str ) ) )
      break;
  }
  return str;
}


char *ccStrSkipWord( char *str )
{
  if( !( str ) )
    return 0;
  for( ; ; str++ )
  {
    if( !( *str ) )
      return 0;
    if( ( *str == ' ' ) || ( *str == '\t' ) || ( *str == '\n' ) || ( *str == '\r' ) )
      break;
  }
  return str;
}


char *ccStrEndWord( char *str )
{
  if( !( str ) )
    return 0;
  for( ; ; str++ )
  {
    if( !( *str ) || ( *str == ' ' ) || ( *str == '\t' ) || ( *str == '\n' ) || ( *str == '\r' ) )
      break;
  }
  return str;
}


char *ccStrNextWordSameLine( char *str )
{
  if( !( str ) )
    return 0;
  for( ; ; str++ )
  {
    if( *str == 0 )
      return 0;
    if( *str == '\n' )
      return 0;
    if( !( CC_CHAR_IS_DELIMITER( *str ) ) )
      break;
  }
  return str;
}


char *ccStrNextParam( char *str )
{
  if( !( str ) )
    return 0;
  for( ; ; str++ )
  {
    if( ( *str == 0 ) || ( *str != '\n' ) )
      return 0;
    if( !( CC_CHAR_IS_DELIMITER( *str ) ) )
      break;
  }
  return str;
}


char *ccStrNextLine( char *str )
{
  if( !( str ) )
    return 0;
  for( ; ; str++ )
  {
    if( *str == 0 )
      return str;
    if( *str == '\n' )
      break;
  }
  return str + 1;
}


char *ccStrPassLine( char *str )
{
  if( !( str ) )
    return 0;
  for( ; ; str++ )
  {
    if( ( *str == 0 ) || ( *str == '\n' ) )
      break;
    if( !( CC_CHAR_IS_DELIMITER( *str ) ) )
      return 0;
  }
  return str;
}


int ccStrParseInt32( char *str, int32_t *retint )
{
  int retval;
  int64_t i;
  retval = ccStrParseInt64( str, &i );
  if( ( i >= ((((int64_t)1)<<31)-1) ) || ( i < -(((int64_t)1)<<31) ) )
    return 0;
  *retint = (int32_t)i;
  return retval;
}


int ccSeqParseInt32( char *seq, int seqlength, int32_t *retint )
{
  int retval;
  int64_t i;
  retval = ccSeqParseInt64( seq, seqlength, &i );
  if( ( i >= ((((int64_t)1)<<31)-1) ) || ( i < -(((int64_t)1)<<31) ) )
    return 0;
  *retint = (int32_t)i;
  return retval;
}


int ccStrParseInt64( char *str, int64_t *retint )
{
  int negflag;
  char c;
  int64_t workint;

  *retint = 0;
  if( !( str ) )
    return 0;
  negflag = 0;
  if( *str == '-' )
    negflag = 1;
  str += negflag;

  workint = 0;
  for( ; ; str++ )
  {
    c = *str;
    if( CC_CHAR_IS_DELIMITER( c ) )
      break;
    if( ( c < '0' ) || ( c > '9' ) )
      return 0;
    if( workint >= (int64_t)0xcccccccccccccccLL )
      return 0;
    workint = ( workint * 10 ) + ( c - '0' );
  }

  if( negflag )
    workint = -workint;
  *retint = workint;
  return 1;
}


int ccSeqParseInt64( char *seq, int seqlength, int64_t *retint )
{
  int i, negflag;
  char c;
  int64_t workint;

  *retint = 0;
  if( !( seqlength ) )
    return 0;
  negflag = 0;
  i = 0;
  if( *seq == '-' )
  {
    negflag = 1;
    i = 1;
  }

  workint = 0;
  for( ; i < seqlength ; i++ )
  {
    c = seq[i];
    if( CC_CHAR_IS_DELIMITER( c ) )
      break;
    if( ( c < '0' ) || ( c > '9' ) )
      return 0;
    if( workint >= (int64_t)0xcccccccccccccccLL )
      return 0;
    workint = ( workint * 10 ) + ( c - '0' );
  }

  if( negflag )
    workint = -workint;
  *retint = workint;
  return 1;
}


int ccStrParseFloat( char *str, float *retfloat )
{
  int retval;
  double d;
  retval = ccStrParseDouble( str, &d );
  *retfloat = (float)d;
  return retval;
}


int ccSeqParseFloat( char *seq, int seqlength, float *retfloat )
{
  int retval;
  double d;
  retval = ccSeqParseDouble( seq, seqlength, &d );
  *retfloat = (float)d;
  return retval;
}


int ccStrParseDouble( char *str, double *retdouble )
{
  int negflag;
  char c;
  double workdouble;
  double decfactor;

  *retdouble = 0.0;
  if( !( str ) )
    return 0;
  negflag = 0;
  if( *str == '-' )
    negflag = 1;
  str += negflag;

  workdouble = 0.0;
  for( ; ; str++ )
  {
    c = *str;
    if( CC_CHAR_IS_DELIMITER( c ) )
      goto done;
    if( c == '.' )
      break;
    if( ( c < '0' ) || ( c > '9' ) )
      return 0;
    workdouble = ( workdouble * 10.0 ) + (double)( c - '0' );
  }

  str++;
  decfactor = 0.1;
  for( ; ; str++ )
  {
    c = *str;
    if( CC_CHAR_IS_DELIMITER( c ) )
      break;
    if( ( c < '0' ) || ( c > '9' ) )
      return 0;
    workdouble += (double)( c - '0' ) * decfactor;
    decfactor *= 0.1;
  }

  done:

  if( negflag )
    workdouble = -workdouble;
  *retdouble = (double)workdouble;
  return 1;
}


int ccSeqParseDouble( char *seq, int seqlength, double *retdouble )
{
  int i, negflag;
  char c;
  double workdouble;
  double decfactor;

  *retdouble = 0.0;
  i = 0;
  if( !( seq ) )
    return 0;
  negflag = 0;
  if( seq[i] == '-' )
    negflag = 1;
  i += negflag;

  workdouble = 0.0;
  for( ; i < seqlength ; i++ )
  {
    c = seq[i];
    if( CC_CHAR_IS_DELIMITER( c ) )
      goto done;
    if( c == '.' )
      break;
    if( ( c < '0' ) || ( c > '9' ) )
      return 0;
    workdouble = ( workdouble * 10.0 ) + (double)( c - '0' );
  }

  i++;
  decfactor = 0.1;
  for( ; i < seqlength ; i++ )
  {
    c = seq[i];
    if( CC_CHAR_IS_DELIMITER( c ) )
      break;
    if( ( c < '0' ) || ( c > '9' ) )
      return 0;
    workdouble += (double)( c - '0' ) * decfactor;
    decfactor *= 0.1;
  }

  done:

  if( negflag )
    workdouble = -workdouble;
  *retdouble = (double)workdouble;
  return 1;
}


int ccStrParseHex( char *str, int hexchars )
{
  int index, value, charvalue;
  value = 0;
  for( index = 0 ; index < hexchars ; index++ )
  {
    value <<= 4;
    charvalue = ccCharHexBase( str[index] );
    if( charvalue == -1 )
      return -1;
    value += charvalue;
  }
  return value;
}


char *ccStrAllocPrintf( char *format, ... )
{
  char *str;
  int strsize, allocsize;
  va_list ap;

  allocsize = 512;
  str = malloc( allocsize );
  for( ; ; )
  {
    va_start( ap, format );
    strsize = vsnprintf( str, allocsize, format, ap );
#if CC_WINDOWS
    if( strsize == -1 )
      strsize = allocsize << 1;
#endif
    va_end( ap );
    if( strsize < allocsize )
      break;
    allocsize = strsize + 2;
    str = realloc( str, allocsize );
  }

  return str;
}


char *ccStrDup( char *str )
{
  int len;
  char *newstr;
  if( !( str ) )
    return 0;
  len = strlen( str );
  if( !( len ) )
    return 0;
  newstr = malloc( ( len + 1 ) * sizeof(char) );
  memcpy( newstr, str, len + 1 );
  return newstr;
}


int ccUnicodeToUtf8( char *s, uint32_t unicode )
{
  int retval;
  retval = 0;
  if( unicode < 0x80 )
  {
    *s++ = unicode;
    retval = 1;
  }
  else if( unicode < 0x800 )
  {
    *s++ = 192 + ( unicode / 64 );
    *s++ = 128 + ( unicode % 64 );
    retval = 2;
  }
  else if( ( unicode - 0xd800u ) < 0x800 )
    retval = 0;
  else if( unicode < 0x10000 )
  {
    *s++ = 224 + ( unicode / 4096 );
    *s++ = 128 + ( ( unicode / 64 ) % 64 );
    *s++ = 128 + ( unicode % 64 );
    retval = 3;
  }
  else if( unicode < 0x110000 )
  {
    *s++ = 240 + ( unicode / 262144 );
    *s++ = 128 + ( ( unicode / 4096 ) % 64 );
    *s++ = 128 + ( ( unicode / 64 ) % 64 );
    *s++ = 128 + ( unicode % 64 );
    retval = 4;
  }
  return retval;
}


/* Copyright (c) 2008-2010 Bjoern Hoehrmann <bjoern@hoehrmann.de> */
/* See http://bjoern.hoehrmann.de/utf-8/decoder/dfa/ for details. */

/* Returns 1 when data is insufficient, send more bytes */
uint32_t ccUtf8ToUnicode( uint32_t byte, uint32_t *state, uint32_t *retunicode )
{
  uint32_t type;
  static const unsigned char utf8d[] =
  {
    /* The first part of the table maps bytes to character classes that */
    /* to reduce the size of the transition table and create bitmasks. */
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,  9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,
    7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,  7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
    8,8,2,2,2,2,2,2,2,2,2,2,2,2,2,2,  2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
    10,3,3,3,3,3,3,3,3,3,3,3,3,4,3,3, 11,6,6,6,5,8,8,8,8,8,8,8,8,8,8,8,
    /* The second part is a transition table that maps a combination */
    /* of a state of the automaton and a character class to a state. */
    0,12,24,36,60,96,84,12,12,12,48,72, 12,12,12,12,12,12,12,12,12,12,12,12,
    12, 0,12,12,12,12,12, 0,12, 0,12,12, 12,24,12,12,12,12,12,24,12,24,12,12,
    12,12,12,12,12,12,12,24,12,12,12,12, 12,24,12,12,12,12,12,12,12,24,12,12,
    12,12,12,12,12,12,12,36,12,36,12,12, 12,36,12,12,12,12,12,36,12,36,12,12,
    12,36,12,12,12,12,12,12,12,12,12,12,
  };
  type = utf8d[byte];
  *retunicode = ( (*state != 0) ? ( ( byte & 0x3fu ) | ( *retunicode << 6 ) ) : ( ( 0xff >> type ) & ( byte ) ) );
  *state = utf8d[ 256 + *state + type ];
  return *state;
}


////


#define CC_SORT_SWAP(a,b) ({temp=table[b];table[b]=table[a];table[a]=temp;})

#define CC_SORT_STACK_DEPTH (512)

#define CC_SORT_MIN_QSORT_COUNT (5)

typedef struct
{
  void *table;
  int count;
} ccQuickSortStack;

static void ccQuickSortPart( void **table, int count, int (*sortfunc)( void *t0, void *t1 ) )
{
  void *temp;
  switch( count )
  {
    case 4:
      if( sortfunc( table[0], table[1] ) )
      CC_SORT_SWAP( 1, 0 );
      if( sortfunc( table[2], table[3] ) )
      CC_SORT_SWAP( 3, 2 );
      if( sortfunc( table[0], table[2] ) )
      {
      temp = table[2];
      table[2] = table[1];
      table[1] = table[0];
      table[0] = temp;
      if( sortfunc( table[2], table[3] ) )
      {
        CC_SORT_SWAP( 3, 2 );
        if( sortfunc( table[1], table[2] ) )
          CC_SORT_SWAP( 2, 1 );
      }
      }
      else
      {
      if( sortfunc( table[1], table[2] ) )
      {
        CC_SORT_SWAP( 2, 1 );
        if( sortfunc( table[2], table[3] ) )
          CC_SORT_SWAP( 3, 2 );
      }
      }
      break;
    case 3:
      if( sortfunc( table[0], table[1] ) )
      {
      if( sortfunc( table[1], table[2] ) )
      {
        /* [1]>[0], [2]>[1] = [2]>[1]>[0] */
        CC_SORT_SWAP( 2, 0 );
      }
      else
      {
          if( sortfunc( table[0], table[2] ) )
        {
          /* [1]>[0], [2]<[1], [2]>[0] = [1]>[2]>[0] */
          temp = table[0];
          table[0] = table[1];
          table[1] = table[2];
          table[2] = temp;
        }
        else
        {
          /* [1]>[0], [2]<[1], [2]<[0] = [1]>[0]>[2] */
          CC_SORT_SWAP( 1, 0 );
        }
      }
      }
      else
      {
      if( sortfunc( table[1], table[2] ) )
      {
        if( sortfunc( table[0], table[2] ) )
        {
          /* [1]<[0], [2]>[1], [2]>[0] = [2]>[0]>[1] */
          temp = table[2];
          table[2] = table[1];
          table[1] = table[0];
          table[0] = temp;
        }
        else
        {
          /* [1]<[0], [2]>[1], [2]<[0] = [0]>[2]>[1] */
          CC_SORT_SWAP( 1, 2 );
        }
      }
      else
      {
        /* [1]<[0], [2]<[1] = [0]>[1]>[2] */
      }
      }
      break;
    case 2:
      if( sortfunc( table[0], table[1] ) )
        CC_SORT_SWAP( 1, 0 );
      break;
    case 1:
    case 0:
    default:
      break;
  }
  return;
}


void ccQuickSort( void **table, int count, int (*sortfunc)( void *t0, void *t1 ), uint32_t randmask )
{
  ssize_t i, pivotindex, leftcount, rightcount, highindex, pivotstore;
  void *temp;
  void *pivot;
  ccQuickSortStack stack[CC_SORT_STACK_DEPTH];
  ccQuickSortStack *sp;

  if( count < CC_SORT_MIN_QSORT_COUNT )
  {
    ccQuickSortPart( table, count, sortfunc );
    return;
  }

  sp = stack;
  for( ; ; )
  {
    /* Select pivot */
    randmask += count;
    pivotindex = 1 + ( randmask % ( count-2 ) );

    if( sortfunc( table[0], table[pivotindex] ) )
      CC_SORT_SWAP( pivotindex, 0 );
    if( sortfunc( table[pivotindex], table[count-1] ) )
    {
      CC_SORT_SWAP( count-1, pivotindex );
      if( sortfunc( table[0], table[pivotindex] ) )
        CC_SORT_SWAP( pivotindex, 0 );
    }

    /* Quick sort on both sides of the pivot */
    pivot = table[pivotindex];
    highindex = count - 2;
    pivotstore = highindex;
    CC_SORT_SWAP( pivotstore, pivotindex );
    pivotindex = 1;
    for( i = highindex ; --i ; )
    {
      if( sortfunc( pivot, table[pivotindex] ) )
        pivotindex++;
      else
      {
        highindex--;
        CC_SORT_SWAP( highindex, pivotindex );
      }
    }
    CC_SORT_SWAP( pivotindex, pivotstore );

    /* Count of entries on both sides of the pivot */
    leftcount = pivotindex;
    pivotindex++;
    rightcount = count - pivotindex;

    /* Fast sort small chunks, iterate */
    if( leftcount < CC_SORT_MIN_QSORT_COUNT )
    {
      ccQuickSortPart( table, leftcount, sortfunc );
      table += pivotindex;
      count = rightcount;
      if( rightcount < CC_SORT_MIN_QSORT_COUNT )
      {
        ccQuickSortPart( table, count, sortfunc );
        if( sp == stack )
          break;
        sp--;
        table = sp->table;
        count = sp->count;
      }
    }
    else if( rightcount < CC_SORT_MIN_QSORT_COUNT )
    {
      ccQuickSortPart( &table[pivotindex], rightcount, sortfunc );
      count = leftcount;
    }
    else if( leftcount < rightcount )
    {
      sp->table = &table[pivotindex];
      sp->count = rightcount;
      sp++;
      count = leftcount;
    }
    else
    {
      sp->table = table;
      sp->count = leftcount;
      sp++;
      table += pivotindex;
      count = rightcount;
    }
  }

  return;
}

static void ccQuickSortContextPart( void **table, int count, int (*sortfunc)( void *context, void *t0, void *t1 ), void *context )
{
  void *temp;
  switch( count )
  {
    case 4:
      if( sortfunc( context, table[0], table[1] ) )
      CC_SORT_SWAP( 1, 0 );
      if( sortfunc( context, table[2], table[3] ) )
      CC_SORT_SWAP( 3, 2 );
      if( sortfunc( context, table[0], table[2] ) )
      {
      temp = table[2];
      table[2] = table[1];
      table[1] = table[0];
      table[0] = temp;
      if( sortfunc( context, table[2], table[3] ) )
      {
        CC_SORT_SWAP( 3, 2 );
        if( sortfunc( context, table[1], table[2] ) )
          CC_SORT_SWAP( 2, 1 );
      }
      }
      else
      {
      if( sortfunc( context, table[1], table[2] ) )
      {
        CC_SORT_SWAP( 2, 1 );
        if( sortfunc( context, table[2], table[3] ) )
          CC_SORT_SWAP( 3, 2 );
      }
      }
      break;
    case 3:
      if( sortfunc( context, table[0], table[1] ) )
      {
      if( sortfunc( context, table[1], table[2] ) )
      {
        /* [1]>[0], [2]>[1] = [2]>[1]>[0] */
        CC_SORT_SWAP( 2, 0 );
      }
      else
      {
          if( sortfunc( context, table[0], table[2] ) )
        {
          /* [1]>[0], [2]<[1], [2]>[0] = [1]>[2]>[0] */
          temp = table[0];
          table[0] = table[1];
          table[1] = table[2];
          table[2] = temp;
        }
        else
        {
          /* [1]>[0], [2]<[1], [2]<[0] = [1]>[0]>[2] */
          CC_SORT_SWAP( 1, 0 );
        }
      }
      }
      else
      {
      if( sortfunc( context, table[1], table[2] ) )
      {
        if( sortfunc( context, table[0], table[2] ) )
        {
          /* [1]<[0], [2]>[1], [2]>[0] = [2]>[0]>[1] */
          temp = table[2];
          table[2] = table[1];
          table[1] = table[0];
          table[0] = temp;
        }
        else
        {
          /* [1]<[0], [2]>[1], [2]<[0] = [0]>[2]>[1] */
          CC_SORT_SWAP( 1, 2 );
        }
      }
      else
      {
        /* [1]<[0], [2]<[1] = [0]>[1]>[2] */
      }
      }
      break;
    case 2:
      if( sortfunc( context, table[0], table[1] ) )
        CC_SORT_SWAP( 1, 0 );
      break;
    case 1:
    case 0:
    default:
      break;
  }
  return;
}

void ccQuickSortContext( void **table, int count, int (*sortfunc)( void *context, void *t0, void *t1 ), void *context, uint32_t randmask )
{
  ssize_t i, pivotindex, leftcount, rightcount, highindex, pivotstore;
  void *temp;
  void *pivot;
  ccQuickSortStack stack[CC_SORT_STACK_DEPTH];
  ccQuickSortStack *sp;

  if( count < CC_SORT_MIN_QSORT_COUNT )
  {
    ccQuickSortContextPart( table, count, sortfunc, context );
    return;
  }

  sp = stack;
  for( ; ; )
  {
    /* Select pivot */
    randmask += count;
    pivotindex = 1 + ( randmask % ( count-2 ) );

    if( sortfunc( context, table[0], table[pivotindex] ) )
      CC_SORT_SWAP( pivotindex, 0 );
    if( sortfunc( context, table[pivotindex], table[count-1] ) )
    {
      CC_SORT_SWAP( count-1, pivotindex );
      if( sortfunc( context, table[0], table[pivotindex] ) )
        CC_SORT_SWAP( pivotindex, 0 );
    }

    /* Quick sort on both sides of the pivot */
    pivot = table[pivotindex];
    highindex = count - 2;
    pivotstore = highindex;
    CC_SORT_SWAP( pivotstore, pivotindex );
    pivotindex = 1;
    for( i = highindex ; --i ; )
    {
      if( sortfunc( context, pivot, table[pivotindex] ) )
        pivotindex++;
      else
      {
        highindex--;
        CC_SORT_SWAP( highindex, pivotindex );
      }
    }
    CC_SORT_SWAP( pivotindex, pivotstore );

    /* Count of entries on both sides of the pivot */
    leftcount = pivotindex;
    pivotindex++;
    rightcount = count - pivotindex;

    /* Fast sort small chunks, iterate */
    if( leftcount < CC_SORT_MIN_QSORT_COUNT )
    {
      ccQuickSortContextPart( table, leftcount, sortfunc, context );
      table += pivotindex;
      count = rightcount;
      if( rightcount < CC_SORT_MIN_QSORT_COUNT )
      {
        ccQuickSortContextPart( table, count, sortfunc, context );
        if( sp == stack )
          break;
        sp--;
        table = sp->table;
        count = sp->count;
      }
    }
    else if( rightcount < CC_SORT_MIN_QSORT_COUNT )
    {
      ccQuickSortContextPart( &table[pivotindex], rightcount, sortfunc, context );
      count = leftcount;
    }
    else if( leftcount < rightcount )
    {
      sp->table = &table[pivotindex];
      sp->count = rightcount;
      sp++;
      count = leftcount;
    }
    else
    {
      sp->table = table;
      sp->count = leftcount;
      sp++;
      table += pivotindex;
      count = rightcount;
    }
  }

  return;
}


////


typedef struct
{
  void **src;
  void **dst;
  int count;
  int mergeflag;
  int depthbit;
} ccMergeSortStack;

int ccMergeSort( void **src, void **tmp, int count, int (*sortfunc)( void *t0, void *t1 ) )
{
  int swapflag, depthbit, maxdepthbit;
  ssize_t i, leftcount, rightcount;
  void **dst, **sl, **sr, *temp, **swap;
  ccMergeSortStack stack[CC_SORT_STACK_DEPTH];
  ccMergeSortStack *sp;

  dst = tmp;
  sp = stack;
  swapflag = 0;
  depthbit = 0;

  if( count <= 1 )
    return 0;

  leftcount = count;
  for( maxdepthbit = 1 ; ; maxdepthbit ^= 1 )
  {
    leftcount = leftcount - ( leftcount >> 1 );
    if( leftcount <= 4 )
      break;
  }

  for( ; ; )
  {
    if( count <= 4 )
    {
      if( !( depthbit ^ maxdepthbit ) )
      {
        if( ( count == 4 ) && sortfunc( src[2], src[3] ) )
        {
          temp = src[2];
          src[2] = src[3];
          src[3] = temp;
        }
        if( sortfunc( src[0], src[1] ) )
        {
          temp = src[0];
          src[0] = src[1];
          src[1] = temp;
        }
        swapflag = 0;
      }
      else
      {
        if( count == 4 )
        {
          if( sortfunc( src[2], src[3] ) )
          {
            dst[2] = src[3];
            dst[3] = src[2];
          }
          else
          {
            dst[2] = src[2];
            dst[3] = src[3];
          }
        }
        else if( count == 3 )
          dst[2] = src[2];
        if( sortfunc( src[0], src[1] ) )
        {
          dst[0] = src[1];
          dst[1] = src[0];
        }
        else
        {
          dst[0] = src[0];
          dst[1] = src[1];
        }
        swap = src;
        src = dst;
        dst = swap;
        swapflag = 1;
      }
    }
    else
    {
      rightcount = count >> 1;
      leftcount = count - rightcount;
      sp->src = src;
      sp->dst = dst;
      sp->count = count;
      sp->mergeflag = 1;
      sp->depthbit = depthbit;
      depthbit ^= 1;
      sp++;
      sp->src = src + leftcount;
      sp->dst = dst + leftcount;
      sp->count = rightcount;
      sp->mergeflag = 0;
      sp->depthbit = depthbit;
      sp++;
      count = leftcount;
      continue;
    }

    for( ; ; )
    {
      rightcount = count >> 1;
      leftcount = count - rightcount;
      sl = src;
      sr = src + leftcount;
      for( ; ; )
      {
        if( sortfunc( *sl, *sr ) )
        {
          *dst++ = *sr++;
          if( --rightcount )
            continue;
          for( i = 0 ; i < leftcount ; i++ )
            dst[i] = sl[i];
          break;
        }
        else
        {
          *dst++ = *sl++;
          if( --leftcount )
            continue;
          for( i = 0 ; i < rightcount ; i++ )
            dst[i] = sr[i];
          break;
        }
      }

      if( sp == stack )
        return swapflag ^ 1;
      sp--;
      src = sp->src;
      dst = sp->dst;
      count = sp->count;
      depthbit = sp->depthbit;
      if( !( sp->mergeflag ) )
        break;
      swapflag ^= 1;
      if( swapflag )
      {
        src = sp->dst;
        dst = sp->src;
      }
    }
  }

  return 0;
}

int ccMergeSortContext( void **src, void **tmp, int count, int (*sortfunc)( void *context, void *t0, void *t1 ), void *context )
{
  int swapflag, depthbit, maxdepthbit;
  ssize_t i, leftcount, rightcount;
  void **dst, **sl, **sr, *temp, **swap;
  ccMergeSortStack stack[CC_SORT_STACK_DEPTH];
  ccMergeSortStack *sp;

  dst = tmp;
  sp = stack;
  swapflag = 0;
  depthbit = 0;

  if( count <= 1 )
    return 0;

  leftcount = count;
  for( maxdepthbit = 1 ; ; maxdepthbit ^= 1 )
  {
    leftcount = leftcount - ( leftcount >> 1 );
    if( leftcount <= 4 )
      break;
  }

  for( ; ; )
  {
    if( count <= 4 )
    {
      if( !( depthbit ^ maxdepthbit ) )
      {
        if( ( count == 4 ) && sortfunc( context, src[2], src[3] ) )
        {
          temp = src[2];
          src[2] = src[3];
          src[3] = temp;
        }
        if( sortfunc( context, src[0], src[1] ) )
        {
          temp = src[0];
          src[0] = src[1];
          src[1] = temp;
        }
        swapflag = 0;
      }
      else
      {
        if( count == 4 )
        {
          if( sortfunc( context, src[2], src[3] ) )
          {
            dst[2] = src[3];
            dst[3] = src[2];
          }
          else
          {
            dst[2] = src[2];
            dst[3] = src[3];
          }
        }
        else if( count == 3 )
          dst[2] = src[2];
        if( sortfunc( context, src[0], src[1] ) )
        {
          dst[0] = src[1];
          dst[1] = src[0];
        }
        else
        {
          dst[0] = src[0];
          dst[1] = src[1];
        }
        swap = src;
        src = dst;
        dst = swap;
        swapflag = 1;
      }
    }
    else
    {
      rightcount = count >> 1;
      leftcount = count - rightcount;
      sp->src = src;
      sp->dst = dst;
      sp->count = count;
      sp->mergeflag = 1;
      sp->depthbit = depthbit;
      depthbit ^= 1;
      sp++;
      sp->src = src + leftcount;
      sp->dst = dst + leftcount;
      sp->count = rightcount;
      sp->mergeflag = 0;
      sp->depthbit = depthbit;
      sp++;
      count = leftcount;
      continue;
    }

    for( ; ; )
    {
      rightcount = count >> 1;
      leftcount = count - rightcount;
      sl = src;
      sr = src + leftcount;
      for( ; ; )
      {
        if( sortfunc( context, *sl, *sr ) )
        {
          *dst++ = *sr++;
          if( --rightcount )
            continue;
          for( i = 0 ; i < leftcount ; i++ )
            dst[i] = sl[i];
          break;
        }
        else
        {
          *dst++ = *sl++;
          if( --leftcount )
            continue;
          for( i = 0 ; i < rightcount ; i++ )
            dst[i] = sr[i];
          break;
        }
      }

      if( sp == stack )
        return swapflag ^ 1;
      sp--;
      src = sp->src;
      dst = sp->dst;
      count = sp->count;
      depthbit = sp->depthbit;
      if( !( sp->mergeflag ) )
        break;
      swapflag ^= 1;
      if( swapflag )
      {
        src = sp->dst;
        dst = sp->src;
      }
    }
  }

  return 0;
}


////


typedef struct
{
  void *table;
  int count;
  int depth;
} ccHybridSortStack;

void ccHybridSort( void **table, void **tmp, int count, int (*sortfunc)( void *t0, void *t1 ), uint32_t randmask )
{
  int msortindex, depth, depthmax;
  ssize_t i, pivotindex, leftcount, rightcount, highindex, pivotstore;
  void *temp;
  void *pivot;
  ccHybridSortStack stack[CC_SORT_STACK_DEPTH];
  ccHybridSortStack *sp;

  depth = 0;
  depthmax = 1 + ccLog2Int32( count );

  sp = stack;
  for( ; ; )
  {
    if( count < CC_SORT_MIN_QSORT_COUNT )
    {
      ccQuickSortPart( table, count, sortfunc );
      if( sp == stack )
        break;
      sp--;
      table = sp->table;
      count = sp->count;
      depth = sp->depth;
      continue;
    }

    /* Pathological case, switch to merge sort */
    if( depth >= depthmax )
    {
      msortindex = ccMergeSort( table, tmp, count, sortfunc );
      if( msortindex )
        memcpy( table, tmp, count * sizeof(void *) );
      if( sp == stack )
        break;
      sp--;
      table = sp->table;
      count = sp->count;
      depth = sp->depth;
      continue;
    }

    /* Select pivot */
    randmask += count;
    pivotindex = 1 + ( randmask % ( count-2 ) );
    if( sortfunc( table[0], table[pivotindex] ) )
      CC_SORT_SWAP( pivotindex, 0 );
    if( sortfunc( table[pivotindex], table[count-1] ) )
    {
      CC_SORT_SWAP( count-1, pivotindex );
      if( sortfunc( table[0], table[pivotindex] ) )
        CC_SORT_SWAP( pivotindex, 0 );
    }

    /* Quick sort on both sides of the pivot */
    pivot = table[pivotindex];
    highindex = count - 2;
    pivotstore = highindex;
    CC_SORT_SWAP( pivotstore, pivotindex );
    pivotindex = 1;
    for( i = highindex ; --i ; )
    {
      if( sortfunc( pivot, table[pivotindex] ) )
        pivotindex++;
      else
      {
        highindex--;
        CC_SORT_SWAP( highindex, pivotindex );
      }
    }
    CC_SORT_SWAP( pivotindex, pivotstore );

    /* Count of entries on both sides of the pivot */
    leftcount = pivotindex;
    pivotindex++;
    rightcount = count - pivotindex;

    /* Fast sort small chunks, iterate */
    if( leftcount < rightcount )
    {
      depth++;
      sp->table = &table[pivotindex];
      sp->count = rightcount;
      sp->depth = depth;
      sp++;
      count = leftcount;
    }
    else
    {
      depth++;
      sp->table = table;
      sp->count = leftcount;
      sp->depth = depth;
      sp++;
      table += pivotindex;
      count = rightcount;
    }
  }

  return;
}


void ccHybridSortContext( void **table, void **tmp, int count, int (*sortfunc)( void *context, void *t0, void *t1 ), void *context, uint32_t randmask )
{
  int msortindex, depth, depthmax;
  ssize_t i, pivotindex, leftcount, rightcount, highindex, pivotstore;
  void *temp;
  void *pivot;
  ccHybridSortStack stack[CC_SORT_STACK_DEPTH];
  ccHybridSortStack *sp;

  depth = 0;
  depthmax = 1 + ccLog2Int32( count );

  sp = stack;
  for( ; ; )
  {
    if( count < CC_SORT_MIN_QSORT_COUNT )
    {
      ccQuickSortContextPart( table, count, sortfunc, context );
      if( sp == stack )
        break;
      sp--;
      table = sp->table;
      count = sp->count;
      depth = sp->depth;
      continue;
    }

    /* Pathological case, switch to merge sort */
    if( depth >= depthmax )
    {
      msortindex = ccMergeSortContext( table, tmp, count, sortfunc, context );
      if( msortindex )
        memcpy( table, tmp, count * sizeof(void *) );
      if( sp == stack )
        break;
      sp--;
      depth--;
      table = sp->table;
      count = sp->count;
      depth = sp->depth;
      continue;
    }

    /* Select pivot */
    randmask += count;
    pivotindex = 1 + ( randmask % ( count-2 ) );
    if( sortfunc( context, table[0], table[pivotindex] ) )
      CC_SORT_SWAP( pivotindex, 0 );
    if( sortfunc( context, table[pivotindex], table[count-1] ) )
    {
      CC_SORT_SWAP( count-1, pivotindex );
      if( sortfunc( context, table[0], table[pivotindex] ) )
        CC_SORT_SWAP( pivotindex, 0 );
    }

    /* Quick sort on both sides of the pivot */
    pivot = table[pivotindex];
    highindex = count - 2;
    pivotstore = highindex;
    CC_SORT_SWAP( pivotstore, pivotindex );
    pivotindex = 1;
    for( i = highindex ; --i ; )
    {
      if( sortfunc( context, pivot, table[pivotindex] ) )
        pivotindex++;
      else
      {
        highindex--;
        CC_SORT_SWAP( highindex, pivotindex );
      }
    }
    CC_SORT_SWAP( pivotindex, pivotstore );

    /* Count of entries on both sides of the pivot */
    leftcount = pivotindex;
    pivotindex++;
    rightcount = count - pivotindex;

    /* Fast sort small chunks, iterate */
    if( leftcount < rightcount )
    {
      depth++;
      sp->table = &table[pivotindex];
      sp->count = rightcount;
      sp->depth = depth;
      sp++;
      count = leftcount;
    }
    else
    {
      depth++;
      sp->table = table;
      sp->count = leftcount;
      sp->depth = depth;
      sp++;
      table += pivotindex;
      count = rightcount;
    }
  }

  return;
}


////


#define CC_DEBUG_LOG_SIZE (4096)

void ccDebugLog( char *filename, char *string, ... )
{
  int slen, bufsize;
  char buffer[CC_DEBUG_LOG_SIZE];
  char *wbuf;
  va_list ap;
  FILE *file;

  if( !( file = fopen( filename, "a" ) ) )
    return;

  wbuf = buffer;
  bufsize = CC_DEBUG_LOG_SIZE;
  for( ; ; )
  {
    va_start( ap, string );
    slen = vsnprintf( wbuf, bufsize, string, ap );
    va_end( ap );
#if CC_WINDOWS
    if( slen == -1 )
      slen = bufsize << 1;
#endif
    if( slen < bufsize )
      break;
    if( wbuf != buffer )
      free( wbuf );
    bufsize = slen + 2;
    wbuf = malloc( bufsize );
  }

  fprintf( file, "%s", wbuf );

  if( wbuf != buffer )
    free( wbuf );
  fclose( file );

  return;
}


////


void ccGrowthInit( ccGrowth *growth, int defaultsize )
{
  growth->allocsize = CC_MAX( defaultsize, 512 );
  growth->offset = 0;
  growth->data = malloc( growth->allocsize );
  return;
}

int ccGrowthPrintf( ccGrowth *growth, char *format, ... )
{
  int strsize, clampsize;
  va_list ap;

  for( ; ; )
  {
    va_start( ap, format );
    clampsize = growth->allocsize - growth->offset;
    strsize = vsnprintf( (char *)ADDRESS( growth->data, growth->offset ), clampsize, format, ap );
    va_end( ap );
#if CC_WINDOWS
    if( strsize == -1 )
      strsize = growth->allocsize << 1;
#endif
    if( strsize < clampsize )
      break;
    growth->allocsize = CC_MAX( growth->offset + strsize + 1, growth->allocsize << 1 );
    growth->data = realloc( growth->data, growth->allocsize );
  }
  growth->offset += strsize;

  return 1;
}

int ccGrowthData( ccGrowth *growth, void *data, size_t size )
{
  if( ( growth->offset + size ) >= growth->allocsize )
  {
    growth->allocsize = CC_MAX( growth->offset + size, growth->allocsize << 1 );
    growth->data = realloc( growth->data, growth->allocsize );
  }
  memcpy( ADDRESS( growth->data, growth->offset ), data, size );
  growth->offset += size;
  return 1;
}

int ccGrowthSeek( ccGrowth *growth, int offset )
{
  if( offset >= growth->allocsize )
  {
    growth->allocsize = CC_MAX( offset, growth->allocsize << 1 );
    growth->data = realloc( growth->data, growth->allocsize );
  }
  if( offset > growth->offset )
    memset( ADDRESS( growth->data, growth->offset ), 0, offset - growth->offset );
  growth->offset = offset;
  return 1;
}

void ccGrowthFree( ccGrowth *growth )
{
  free( growth->data );
  memset( growth, 0, sizeof(ccGrowth) );
  return;
}

void ccGrowthElapsedTimeString( ccGrowth *growth, int64_t timecount, int maxfieldcount )
{
  int fieldcount, unitcount;
  fieldcount = 0;
  if( timecount <= 0 )
  {
    ccGrowthPrintf( growth, "Just now" );
    return;
  }
  if( timecount >= (24*60*60) )
  {
    unitcount = timecount / (24*60*60);
    timecount = timecount % (24*60*60);
    ccGrowthPrintf( growth, "%d day%s", (int)unitcount, ( unitcount > 1 ? "s" : "" ) );
    fieldcount++;
    if( fieldcount >= maxfieldcount )
      return;
  }
  if( timecount >= (60*60) )
  {
    if( fieldcount )
      ccGrowthPrintf( growth, ", " );
    unitcount = timecount / (60*60);
    timecount = timecount % (60*60);
    ccGrowthPrintf( growth, "%d hour%s", (int)unitcount, ( unitcount > 1 ? "s" : "" ) );
    fieldcount++;
    if( fieldcount >= maxfieldcount )
      return;
  }
  if( timecount >= (60) )
  {
    if( fieldcount )
      ccGrowthPrintf( growth, ", " );
    unitcount = timecount / (60);
    timecount = timecount % (60);
    ccGrowthPrintf( growth, "%d minute%s", (int)unitcount, ( unitcount > 1 ? "s" : "" ) );
    fieldcount++;
    if( fieldcount >= maxfieldcount )
      return;
  }
  if( timecount >= 1 )
  {
    if( fieldcount )
      ccGrowthPrintf( growth, ", " );
    unitcount = timecount;
    ccGrowthPrintf( growth, "%d second%s", (int)unitcount, ( unitcount > 1 ? "s" : "" ) );
    fieldcount++;
    if( fieldcount >= maxfieldcount )
      return;
  }
  if( !( fieldcount ) )
    ccGrowthPrintf( growth, "Long, long" );
  return;
}



////


void *ccFileLoad( const char *path, size_t maxsize, size_t *retsize )
{
  FILE *file;
  size_t size;
  char *data;

  file = fopen( path, "rb" );
  if( !( file ) )
    return 0;
  fseek( file, 0, SEEK_END );
  size = ftell( file );
  fseek( file, 0, SEEK_SET );
  if( ( maxsize ) && ( size > maxsize ) )
  {
    fclose( file );
    return 0;
  }
  data = malloc( size + 1 );
  data[size] = 0;
  if( fread( data, size, 1, file ) != 1 )
  {
    free( data );
    data = 0;
  }
  fclose( file );
  if( retsize )
    *retsize = size;

  return data;
}


size_t ccFileLoadDirect( const char *path, void *data, size_t minsize, size_t maxsize )
{
  FILE *file;
  size_t size;

  file = fopen( path, "rb" );
  if( !( file ) )
    return 0;
  fseek( file, 0, SEEK_END );
  size = ftell( file );
  fseek( file, 0, SEEK_SET );
  if( ( size < minsize ) || ( size > maxsize ) )
    size = 0;
  else if( fread( data, size, 1, file ) != 1 )
    size = 0;
  fclose( file );

  return size;
}


int ccFileStore( const char *path, void *data, size_t datasize, int fsyncflag )
{
  int retval;
#if CC_UNIX
  int fd;
  if( ( fd = open( path, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR ) ) == -1 )
    return 0;
  retval = 1;
  if( write( fd, data, datasize ) != datasize )
    retval = 0;
  if( fsyncflag )
  {
 #if CC_LINUX
    fdatasync( fd );
 #else
    fsync( fd );
 #endif
  }
  if( close( fd ) != 0 )
    retval = 0;
#elif CC_WINDOWS
  HANDLE file;
  DWORD byteswritten;
  file = CreateFileA( path, GENERIC_WRITE, 0, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0 );
  if( file == INVALID_HANDLE_VALUE )
    return 0;
  retval = 1;
  if( !( WriteFile( file, data, datasize, &byteswritten, 0 ) ) )
    retval = 0;
  if( fsyncflag )
    FlushFileBuffers( file );
  if( CloseHandle( file ) == 0 )
    retval = 0;
#else
  FILE *file;
  file = fopen( path, "wb" );
  if( !( file ) )
    return 0;
  retval = 1;
  if( fwrite( data, size, 1, file ) != 1 )
    retval = 0;
  if( fclose( file ) != 0 )
    retval = 0;
#endif
  return retval;
}


int ccFileExists( char *path )
{
  int statret;
#if CC_UNIX
  struct stat filestat;
  statret = stat( path, &filestat );
  return ( statret == 0 );
#elif CC_WINDOWS
  struct _stat filestat;
  statret = _stat( path, &filestat );
  return ( statret == 0 );
#else
  FILE *file;
  file = fopen( path, "rb" );
  if( !( file ) )
    return 0;
  fclose( file );
  return 1;
#endif
}


int ccFileStat( char *path, size_t *retfilesize, time_t *retfiletime )
{
  int statret;
#if CC_UNIX
  struct stat filestat;
  statret = stat( path, &filestat );
  if( !( statret ) )
  {
    if( retfilesize )
      *retfilesize = filestat.st_size;
    if( retfiletime )
      *retfiletime = filestat.st_mtime;
    return 1;
  }
#elif CC_WINDOWS
  struct _stat filestat;
  statret = _stat( path, &filestat );
  if( !( statret ) )
  {
    if( retfilesize )
      *retfilesize = filestat.st_size;
    if( retfiletime )
      *retfiletime = filestat.st_mtime;
    return 1;
  }
#endif
  if( retfilesize )
    *retfilesize = 0;
  if( retfiletime )
    *retfiletime = 0;
  return 0;
}


int ccRenameFile( char *oldpath, char *newpath )
{
#if CC_WINDOWS
  int attemptindex, attemptcount;
  /* On Windows, file indexing or anti-virus software could be scanning the file and prevent rename() */
  attemptcount = 16;
  for( attemptindex = 0 ; ; attemptindex++ )
  {
    if( MoveFileEx( oldpath, newpath, MOVEFILE_REPLACE_EXISTING ) )
      break;
    if( attemptindex >= attemptcount )
      return 0;
    ccSleep( 250 );
  }
#else
  if( rename( oldpath, newpath ) )
    return 0;
#endif
  return 1;
}


////


struct _ccDir
{
#if CC_UNIX
  void *dirhandle;
#elif CC_WINDOWS
  HANDLE dirhandle;
  WIN32_FIND_DATA direntry;
  int firstflag;
#endif
};


ccDir *ccOpenDir( char *path )
{
  ccDir *dir;
  dir = malloc( sizeof(ccDir) );
#if CC_UNIX
  dir->dirhandle = opendir( path );
  if( !( dir->dirhandle ) )
  {
    free( dir );
    return 0;
  }
  return dir;
#elif CC_WINDOWS
  dir->dirhandle = FindFirstFile( path, &dir->direntry );
  if( dir->dirhandle == INVALID_HANDLE_VALUE )
  {
    free( dir );
    return 0;
  }
  dir->firstflag = 1;
  return dir;
#else
  return 0;
#endif
}

char *ccReadDir( ccDir *dir )
{
#if CC_UNIX
  struct dirent *direntry;
  direntry = readdir( dir->dirhandle );
  if( direntry )
    return direntry->d_name;
  return 0;
#elif CC_WINDOWS
  if( dir->firstflag )
  {
    dir->firstflag = 0;
    return (dir->direntry).cFileName;
  }
  if( FindNextFile( dir->dirhandle, &dir->direntry ) )
    return (dir->direntry).cFileName;
  return 0;
#else
  return 0;
#endif
}

void ccCloseDir( ccDir *dir )
{
#if CC_UNIX
  closedir( dir->dirhandle );
#elif CC_WINDOWS
  FindClose( dir->dirhandle );
#endif
  free( dir );
  return;
}


////


int64_t ccGetFreeDiskSpace( char *dirpath )
{
  int64_t freespace;
#if CC_UNIX
  struct statvfs fsdata;
  if( ( statvfs( dirpath, &fsdata ) ) != 0 )
    return -1;
  if( ( fsdata.f_bfree == 0 ) || ( fsdata.f_bfree == -1 ) || ( fsdata.f_frsize == 0 ) || ( fsdata.f_frsize == -1 ) )
    return -1;
  freespace = (int64_t)fsdata.f_bfree * (int64_t)fsdata.f_frsize;
#elif CC_WINDOWS
  ULARGE_INTEGER winfreespace;
  if( !( GetDiskFreeSpaceExA( dirpath, &winfreespace, 0, 0 ) ) )
    return -1;
  freespace = (int64_t)winfreespace.QuadPart;
#else
  freespace = -1;
#endif
  return freespace;
}


////


int ccGetTimeOfDay( struct timeval *tv )
{
#ifdef CC_WIN32
 #define DELTA_EPOCH_IN_MICROSECS  11644473600000000ULL
  FILETIME ft;
  uint64_t curtime;
  if( tv )
  {
    GetSystemTimeAsFileTime( &ft );
    curtime = ft.dwHighDateTime;
    curtime <<= 32;
    curtime |= ft.dwLowDateTime;
    curtime /= 10;
    curtime -= DELTA_EPOCH_IN_MICROSECS;
    tv->tv_sec = (long)( curtime / 1000000UL );
    tv->tv_usec = (long)( curtime % 1000000UL );
  }
#endif
  if( tv )
    gettimeofday( tv, 0 );
  return 0;
}


void ccSleep( int milliseconds )
{
#if CC_UNIX
  struct timespec nanosleeptime;
  nanosleeptime.tv_sec = milliseconds / 1000;
  nanosleeptime.tv_nsec = ( milliseconds % 1000 ) * 1000000;
  nanosleep( &nanosleeptime, 0 );
#elif CC_WINDOWS
  Sleep( milliseconds );
#else
  sleep( (milliseconds+999)/1000 );
#endif
  return;
}


////


/* Returned string must be free()d */
char *ccGetSystemName()
{
  char *string;
#if CC_UNIX
  struct utsname unamebuf;
  if( uname( &unamebuf ) )
    return 0;
  string = ccStrAllocPrintf( "%s %s, Build %s, %s", unamebuf.sysname, unamebuf.release, unamebuf.version, unamebuf.machine );
#elif CC_WINDOWS
 #ifndef VER_SUITE_WH_SERVER
  #define VER_SUITE_WH_SERVER 0x00008000
 #endif
 #ifndef PRODUCT_PROFESSIONAL
  #define PRODUCT_PROFESSIONAL 0x00000030
 #endif
 #ifndef PRODUCT_ULTIMATE
  #define PRODUCT_ULTIMATE 0x00000001
 #endif
 #ifndef PRODUCT_HOME_BASIC
  #define PRODUCT_HOME_BASIC 0x00000002
 #endif
 #ifndef PRODUCT_HOME_PREMIUM
  #define PRODUCT_HOME_PREMIUM 0x00000003
 #endif
 #ifndef PRODUCT_ENTERPRISE
  #define PRODUCT_ENTERPRISE 0x00000004
 #endif
 #ifndef PRODUCT_BUSINESS
  #define PRODUCT_BUSINESS 0x00000006
 #endif
 #ifndef PRODUCT_STANDARD_SERVER
  #define PRODUCT_STANDARD_SERVER 0x00000007
 #endif
 #ifndef PRODUCT_DATACENTER_SERVER
  #define PRODUCT_DATACENTER_SERVER 0x00000008
 #endif
 #ifndef PRODUCT_SMALLBUSINESS_SERVER
  #define PRODUCT_SMALLBUSINESS_SERVER 0x00000009
 #endif
 #ifndef PRODUCT_ENTERPRISE_SERVER
  #define PRODUCT_ENTERPRISE_SERVER 0x0000000A
 #endif
 #ifndef PRODUCT_STARTER
  #define PRODUCT_STARTER 0x0000000B
 #endif
 #ifndef PRODUCT_DATACENTER_SERVER_CORE
  #define PRODUCT_DATACENTER_SERVER_CORE 0x0000000C
 #endif
 #ifndef PRODUCT_STANDARD_SERVER_CORE
  #define PRODUCT_STANDARD_SERVER_CORE 0x0000000D
 #endif
 #ifndef PRODUCT_ENTERPRISE_SERVER_CORE
  #define PRODUCT_ENTERPRISE_SERVER_CORE 0x0000000E
 #endif
 #ifndef PRODUCT_ENTERPRISE_SERVER_IA64
  #define PRODUCT_ENTERPRISE_SERVER_IA64 0x0000000F
 #endif
 #ifndef PRODUCT_WEB_SERVER
  #define PRODUCT_WEB_SERVER 0x00000011
 #endif
 #ifndef PRODUCT_CLUSTER_SERVER
  #define PRODUCT_CLUSTER_SERVER 0x00000012
 #endif
 #ifndef PRODUCT_SMALLBUSINESS_SERVER_PREMIUM
  #define PRODUCT_SMALLBUSINESS_SERVER_PREMIUM 0x00000019
 #endif

  typedef void (WINAPI *PGNSI)(LPSYSTEM_INFO);
  typedef BOOL (WINAPI *PGPI)(DWORD, DWORD, DWORD, DWORD, PDWORD);

  OSVERSIONINFOEX osvi;
  SYSTEM_INFO si;
  DWORD dwType;
  PGPI pGPI;
  PGNSI pGNSI;
  char *sysname, *detailname, *packname, *archname;
  int buildnumber;

  ZeroMemory( &si, sizeof(SYSTEM_INFO) );
  ZeroMemory( &osvi, sizeof(OSVERSIONINFOEX) );
  osvi.dwOSVersionInfoSize = sizeof(OSVERSIONINFOEX);
  if( !( GetVersionEx( (OSVERSIONINFO*) &osvi ) ) )
   return 0;

  pGNSI = (PGNSI)GetProcAddress( GetModuleHandleA( "kernel32.dll" ), "GetNativeSystemInfo" );
  if( pGNSI )
    pGNSI( &si );
  else
    GetSystemInfo( &si );
  if( ( osvi.dwPlatformId != VER_PLATFORM_WIN32_NT ) || ( osvi.dwMajorVersion <= 4 ) )
    return 0;

  sysname = "Unknown";
  detailname = 0;
  packname = 0;
  buildnumber = 0;
  archname = 0;

  if( osvi.dwMajorVersion == 6 )
  {
    if( osvi.dwMinorVersion == 0 )
      sysname = ( osvi.wProductType == VER_NT_WORKSTATION ? "Windows Vista" : "Windows Server 2008" );
    else if ( osvi.dwMinorVersion == 1 )
      sysname = ( osvi.wProductType == VER_NT_WORKSTATION ? "Windows 7" : "Windows Server 2008 R2" );
    else if ( osvi.dwMinorVersion == 2 )
      sysname = ( osvi.wProductType == VER_NT_WORKSTATION ? "Windows 8" : "Windows Server 2012" );
    else
      sysname = "Windows 8 or more";

    pGPI = (PGPI)GetProcAddress( GetModuleHandleA( "kernel32.dll" ), "GetProductInfo" );

    pGPI( osvi.dwMajorVersion, osvi.dwMinorVersion, 0, 0, &dwType );
    switch( dwType )
    {
      case PRODUCT_ULTIMATE:
        detailname = "Ultimate Edition";
        break;
      case PRODUCT_PROFESSIONAL:
        detailname = "Professional";
        break;
      case PRODUCT_HOME_PREMIUM:
        detailname = "Home Premium Edition";
        break;
      case PRODUCT_HOME_BASIC:
        detailname = "Home Basic Edition";
        break;
      case PRODUCT_ENTERPRISE:
        detailname = "Enterprise Edition";
        break;
      case PRODUCT_BUSINESS:
        detailname = "Business Edition";
        break;
      case PRODUCT_STARTER:
        detailname = "Starter Edition";
        break;
      case PRODUCT_CLUSTER_SERVER:
        detailname = "Cluster Server Edition";
        break;
      case PRODUCT_DATACENTER_SERVER:
        detailname = "Datacenter Edition";
        break;
      case PRODUCT_DATACENTER_SERVER_CORE:
        detailname = "Datacenter Edition (core installation)";
        break;
      case PRODUCT_ENTERPRISE_SERVER:
        detailname = "Enterprise Edition";
        break;
      case PRODUCT_ENTERPRISE_SERVER_CORE:
        detailname = "Enterprise Edition (core installation)";
        break;
      case PRODUCT_ENTERPRISE_SERVER_IA64:
        detailname = "Enterprise Edition for Itanium-based Systems";
        break;
      case PRODUCT_SMALLBUSINESS_SERVER:
        detailname = "Small Business Server";
        break;
      case PRODUCT_SMALLBUSINESS_SERVER_PREMIUM:
        detailname = "Small Business Server Premium Edition";
        break;
      case PRODUCT_STANDARD_SERVER:
        detailname = "Standard Edition";
        break;
      case PRODUCT_STANDARD_SERVER_CORE:
        detailname = "Standard Edition (core installation)";
        break;
      case PRODUCT_WEB_SERVER:
        detailname = "Web Server Edition";
        break;
      default:
        break;
    }
  }
  else if( ( osvi.dwMajorVersion == 5 ) && ( osvi.dwMinorVersion == 2 ) )
  {
    if( GetSystemMetrics(SM_SERVERR2) )
      sysname = "Windows Server 2003 R2, ";
    else if ( osvi.wSuiteMask & VER_SUITE_STORAGE_SERVER )
      sysname = "Windows Storage Server 2003";
    else if ( osvi.wSuiteMask & VER_SUITE_WH_SERVER )
      sysname = "Windows Home Server";
    else if( ( osvi.wProductType == VER_NT_WORKSTATION ) && ( si.wProcessorArchitecture == PROCESSOR_ARCHITECTURE_AMD64 ) )
      sysname = "Windows XP Professional x64 Edition";
    else
      sysname ="Windows Server 2003, ";
    if( osvi.wProductType != VER_NT_WORKSTATION )
    {
      if( si.wProcessorArchitecture == PROCESSOR_ARCHITECTURE_IA64 )
      {
        if( osvi.wSuiteMask & VER_SUITE_DATACENTER )
          detailname = "Datacenter Edition for Itanium-based Systems";
        else if( osvi.wSuiteMask & VER_SUITE_ENTERPRISE )
          detailname = "Enterprise Edition for Itanium-based Systems";
      }
      else if( si.wProcessorArchitecture == PROCESSOR_ARCHITECTURE_AMD64 )
      {
        if( osvi.wSuiteMask & VER_SUITE_DATACENTER )
          detailname = "Datacenter x64 Edition";
        else if( osvi.wSuiteMask & VER_SUITE_ENTERPRISE )
          detailname = "Enterprise x64 Edition";
        else
          detailname = "Standard x64 Edition";
      }
      else
      {
        if( osvi.wSuiteMask & VER_SUITE_COMPUTE_SERVER )
          detailname = "Compute Cluster Edition";
        else if( osvi.wSuiteMask & VER_SUITE_DATACENTER )
          detailname = "Datacenter Edition";
        else if( osvi.wSuiteMask & VER_SUITE_ENTERPRISE )
          detailname = "Enterprise Edition";
        else if ( osvi.wSuiteMask & VER_SUITE_BLADE )
          detailname = "Web Edition";
        else
          detailname = "Standard Edition";
      }
    }
  }
  else if( ( osvi.dwMajorVersion == 5 ) && ( osvi.dwMinorVersion == 1 ) )
  {
    sysname = "Windows XP ";
    if( osvi.wSuiteMask & VER_SUITE_PERSONAL )
      sysname = "Home Edition";
    else
      sysname = "Professional";
  }
  else if( ( osvi.dwMajorVersion == 5 ) && ( osvi.dwMinorVersion == 0 ) )
  {
    sysname = "Windows 2000 ";
    if( osvi.wProductType == VER_NT_WORKSTATION )
      detailname = "Professional";
    else
    {
      if( osvi.wSuiteMask & VER_SUITE_DATACENTER )
        detailname = "Datacenter Server";
      else if( osvi.wSuiteMask & VER_SUITE_ENTERPRISE )
        detailname = "Advanced Server";
      else
        detailname = "Server";
    }
  }
  packname = osvi.szCSDVersion;
  buildnumber = osvi.dwBuildNumber;
  if( osvi.dwMajorVersion >= 6 )
  {
    if( si.wProcessorArchitecture == PROCESSOR_ARCHITECTURE_AMD64 )
      archname = ", 64-bit";
    else if( si.wProcessorArchitecture == PROCESSOR_ARCHITECTURE_INTEL )
      archname = ", 32-bit";
  }

  /* Finally build the string */
  string = ccStrAllocPrintf( "%s%s%s%s%s (build %d )%s", sysname, ( detailname ? ", " : "" ), ( detailname ? detailname : "" ), ( packname ? ", " : "" ), ( packname ? packname : "" ), buildnumber, ( archname ? archname : "" ) );

#endif
  return string;
}
