/* *****************************************************************************
 *
 * Copyright (c) 2007-2016 Alexis Naveros.
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************
 */

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

#if defined(__linux__) && !defined(__ANDROID__) && !defined(__EMSCRIPTEN__) && !defined(__i386__)
asm(".symver pow,pow@GLIBC_2.2.5");
asm(".symver log,log@GLIBC_2.2.5");
#endif

#include "cc.h"
#include "ccstr.h"


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


int ccStrCpyStr( char *buffer, int buffersize, char *str )
{
  int i;
  char c;
  if( !( buffersize ) )
    return 0;
  buffersize--;
  for( i = 0 ; i < buffersize ; i++ )
  {
    c = str[i];
    if( !c )
      break;
    buffer[i] = c;
  }
  buffer[i] = 0;
  return i + 1;
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


char *ccStrCmpWordIgnoreCase( char *str, char *word )
{
  int i;
  char c0, c1;
  if( !( str ) )
    return 0;
  for( i = 0 ; ; i++ )
  {
    if( !( word[i] ) )
      return str + i;
    c0 = str[i];
    c1 = word[i];
    if( ( c0 >= 'A' ) && ( c0 <= 'Z' ) )
      c0 += 'a' - 'A';
    if( ( c1 >= 'A' ) && ( c1 <= 'Z' ) )
      c1 += 'a' - 'A';
    if( c0 != c1 )
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


char *ccStrCmpSeqIgnoreCase( char *str, char *seq, int seqlength )
{
  int i;
  char c0, c1;
  if( !( str ) )
    return 0;
  for( i = 0 ; ; i++ )
  {
    if( i >= seqlength )
      return str + i;
    c0 = seq[i];
    c1 = str[i];
    if( ( c0 >= 'A' ) && ( c0 <= 'Z' ) )
      c0 += 'a' - 'A';
    if( ( c1 >= 'A' ) && ( c1 <= 'Z' ) )
      c1 += 'a' - 'A';
    if( c0 != c1 )
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


int ccSeqCmpSeqStdTest( char *s1, char *s2, int s1length, int s2length )
{
  int i;
  if( !( s1length ) )
    return ( s2length ? -1 : 0 );
  else if( !( s2length ) )
    return 1;
  for( i = 0 ; ; i++ )
  {
    if( i >= s1length )
    {
      if( i >= s2length )
        break;
      return -1;
    }
    else if( i >= s2length )
      return 1;
    if( s1[i] != s2[i] )
      return( s1[i] > s2[i] ? 1 : -1 );
  }
  return 0;
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


char *ccSeqFindStrIgnoreCaseSkip( char *seq, int seqlen, char *str )
{
  int i;
  char c0, c1;
  for( ; seqlen ; seqlen--, seq++ )
  {
    for( i = 0 ; i < seqlen ; i++ )
    {
      if( !str[i] )
        return seq + i;
      c0 = seq[i];
      c1 = str[i];
      if( ( c0 >= 'A' ) && ( c0 <= 'Z' ) )
        c0 += 'a' - 'A';
      if( ( c1 >= 'A' ) && ( c1 <= 'Z' ) )
        c1 += 'a' - 'A';
      if( c0 != c1 )
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


char *ccStrDup( const char *str )
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


static const char ccStrPrintDecimalTable[201] =
{
  "00010203040506070809"
  "10111213141516171819"
  "20212223242526272829"
  "30313233343536373839"
  "40414243444546474849"
  "50515253545556575859"
  "60616263646566676869"
  "70717273747576777879"
  "80818283848586878889"
  "90919293949596979899"
};

static inline CC_ALWAYSINLINE int ccStrPrintLength32( uint32_t n )
{
  int size;
  if( n >= 10000 )
  {
    if( n >= 10000000 )
    {
      if( n >= 1000000000 )
        size = 10;
      else if( n >= 100000000 )
        size = 9;
      else
        size = 8;
    }
    else if( n >= 1000000 )
      size = 7;
    else if( n >= 100000 )
      size = 6;
    else
      size = 5;
  }
  else
  {
    if( n >= 100 )
    {
      if( n >= 1000 )
        size = 4;
      else
        size = 3;
    }
    else if( n >= 10 )
      size = 2;
    else
      size = 1;
  }
  return size;
}

static inline CC_ALWAYSINLINE int ccStrPrintLength64( uint64_t n )
{
  int size;
  if( n >= 10000 )
  {
    if( n >= 10000000 )
    {
      if( n >= 10000000000LL )
      {
        if( n >= 10000000000000LL )
        {
          if( n >= 10000000000000000LL )
          {
            if( n >= 10000000000000000000ULL )
              size = 20;
            else if( n >= 1000000000000000000LL )
              size = 19;
            else if( n >= 100000000000000000LL )
              size = 18;
            else
              size = 17;
          }
          else if( n >= 1000000000000000LL )
            size = 16;
          else if( n >= 100000000000000LL )
            size = 15;
          else
            size = 14;
        }
        else if( n >= 1000000000000LL )
          size = 13;
        else if( n >= 100000000000LL )
          size = 12;
        else
          size = 11;
      }
      else if( n >= 1000000000 )
        size = 10;
      else if( n >= 100000000 )
        size = 9;
      else
        size = 8;
    }
    else
    {
      if( n >= 1000000 )
        size = 7;
      else if( n >= 100000 )
        size = 6;
      else
        size = 5;
    }
  }
  else if( n >= 100 )
  {
    if( n >= 1000 )
      size = 4;
    else
      size = 3;
  }
  else if( n >= 10 )
    size = 2;
  else
    size = 1;
  return size;
}

int ccStrPrintInt32( char *str, int32_t n )
{
  int sign, size, retsize, pos;
  uint32_t val32;
  const char *src;

  if( n == 0 )
  {
    str[0] = '0';
    str[1] = 0;
    return 1;
  }

  sign = -( n < 0 );
  val32 = ( n ^ sign ) - sign;
  size = ccStrPrintLength32( val32 );

  if( sign )
  {
    size++;
    str[0] = '-';
  }
  retsize = size;
  str[size] = 0;
  str += size - 1;

  while( val32 >= 100 )
  {
    pos = val32 % 100;
    val32 /= 100;
    src = &ccStrPrintDecimalTable[ pos << 1 ];
    str[-1] = src[0];
    str[0] = src[1];
    str -= 2;
  }
  while( val32 > 0 )
  {
    *str-- = '0' + ( val32 % 10 );
    val32 /= 10;
  }

  return retsize;
}

int ccStrPrintUint32( char *str, uint32_t n )
{
  int size, retsize, pos;
  uint32_t val32;
  const char *src;

  if( n == 0 )
  {
    str[0] = '0';
    str[1] = 0;
    return 1;
  }

  val32 = n;
  size = ccStrPrintLength32( val32 );
  retsize = size;
  str[size] = 0;
  str += size - 1;

  while( val32 >= 100 )
  {
    pos = val32 % 100;
    val32 /= 100;
    src = &ccStrPrintDecimalTable[ pos << 1 ];
    str[-1] = src[0];
    str[0] = src[1];
    str -= 2;
  }
  while( val32 > 0 )
  {
    *str-- = '0' + ( val32 % 10 );
    val32 /= 10;
  }

  return retsize;
}

int ccStrPrintInt64( char *str, int64_t n )
{
  int sign, size, retsize, pos;
  uint64_t val64;
  const char *src;

  if( n == 0 )
  {
    str[0] = '0';
    str[1] = 0;
    return 1;
  }

  sign = -( n < 0 );
  val64 = ( n ^ sign ) - sign;
  size = ccStrPrintLength64( val64 );

  if( sign )
  {
    size++;
    str[0] = '-';
  }
  retsize = size;
  str[size] = 0;
  str += size - 1;

  while( val64 >= 100 )
  {
    pos = val64 % 100;
    val64 /= 100;
    src = &ccStrPrintDecimalTable[ pos << 1 ];
    str[-1] = src[0];
    str[0] = src[1];
    str -= 2;
  }
  while( val64 > 0 )
  {
    *str-- = '0' + ( val64 % 10 );
    val64 /= 10;
  }

  return retsize;
}

int ccStrPrintUint64( char *str, uint64_t n )
{
  int size, retsize, pos;
  uint64_t val64;
  const char *src;

  if( n == 0 )
  {
    str[0] = '0';
    str[1] = 0;
    return 1;
  }

  val64 = n;
  size = ccStrPrintLength64( val64 );

  retsize = size;
  str[size] = 0;
  str += size - 1;

  while( val64 >= 100 )
  {
    pos = val64 % 100;
    val64 /= 100;
    src = &ccStrPrintDecimalTable[ pos << 1 ];
    str[-1] = src[0];
    str[0] = src[1];
    str -= 2;
  }
  while( val64 > 0 )
  {
    *str-- = '0' + ( val64 % 10 );
    val64 /= 10;
  }

  return retsize;
}


////


#define CC_STR_PRINT_DOUBLE_MAX_DECIMAL (17)

static const double ccStrPrintBiasTable[CC_STR_PRINT_DOUBLE_MAX_DECIMAL] =
{ 0.5, 0.05, 0.005, 0.0005, 0.00005, 0.000005, 0.0000005, 0.00000005, 0.000000005, 0.0000000005, 0.00000000005, 0.000000000005, 0.0000000000005, 0.00000000000005, 0.000000000000005, 0.0000000000000005, 0.00000000000000005 };

int ccStrPrintDouble( char *str, int bufsize, int decimals, double value )
{
  int size, offset, index;
  int32_t frac, accumsub;
  double muldec;
  uint32_t u32;
  uint64_t u64;

  size = 0;
  if( value < 0.0 )
  {
    size = 1;
    *str++ = '-';
    bufsize--;
    value = -value;
  }

  /* Add bias matching the count of desired decimals in order to round the right way */
  if( decimals >= CC_STR_PRINT_DOUBLE_MAX_DECIMAL )
    decimals = CC_STR_PRINT_DOUBLE_MAX_DECIMAL;
  value += ccStrPrintBiasTable[decimals];

  if( value < 4294967296.0 )
  {
    if( bufsize < CC_STR_PRINT_BUFSIZE_UINT32 )
      goto error;
    u32 = (uint32_t)value;
    offset = ccStrPrintUint32( str, u32 );
    size += offset;
    bufsize -= size;
    value -= (double)u32;
  }
  else if( value < 18446744073709551616.0 )
  {
    if( bufsize < CC_STR_PRINT_BUFSIZE_UINT64 )
      goto error;
    u64 = (uint64_t)value;
    offset = ccStrPrintUint64( str, u64 );
    size += offset;
    bufsize -= size;
    value -= (double)u64;
  }
  else
    goto error;

  decimals = CC_MIN( decimals, bufsize - 2 );
  if( !( bufsize ) || !( decimals ) )
    return size;

  str[offset] = '.';
  muldec = 10.0;
  accumsub = 0;
  str += offset + 1;
  size++;

  for( index = 0 ; index < decimals ; index++ )
  {
    frac = (int32_t)( value * muldec ) - accumsub;
    str[index] = '0' + (char)frac;
    accumsub += frac;
    accumsub = ( accumsub << 3 ) + ( accumsub << 1 );
    if( muldec < 10000000 )
      muldec *= 10.0;
    else
    {
      value *= 10000000.0;
      value -= (int32_t)value;
      muldec = 10.0;
      accumsub = 0;
    }
  }
  str[ decimals ] = 0;
  size += decimals;

  return size;

  error:
  if( bufsize < 4 )
    *str = 0;
  else
  {
    str[0] = 'E';
    str[1] = 'R';
    str[2] = 'R';
    str[3] = 0;
  }
  return 0;
}


////


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
    if( ( c >= '0' ) && ( c <= '9' ) )
    {
      if( workint >= (int64_t)0xcccccccccccccccLL )
        return 0;
      workint = ( workint * 10 ) + ( c - '0' );
    }
    else if( CC_CHAR_IS_DELIMITER( c ) )
      break;
    else
      return 0;
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
    if( ( c >= '0' ) && ( c <= '9' ) )
    {
      if( workint >= (int64_t)0xcccccccccccccccLL )
        return 0;
      workint = ( workint * 10 ) + ( c - '0' );
    }
    else if( CC_CHAR_IS_DELIMITER( c ) )
      break;
    else
      return 0;
  }

  if( negflag )
    workint = -workint;
  *retint = workint;
  return 1;
}


////


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
  double accum;
  double decfactor;

  *retdouble = 0.0;
  if( !( str ) )
    return 0;
  negflag = ( *str == '-' );
  str += negflag;

  accum = 0.0;
  for( ; ; str++ )
  {
    c = *str;
    if( ( c >= '0' ) && ( c <= '9' ) )
      accum = ( accum * 10.0 ) + (double)( c - '0' );
    else if( CC_CHAR_IS_DELIMITER( c ) )
      goto done;
    else if( c == '.' )
      break;
    else
      return 0;
  }

  str++;
  decfactor = 0.1;
  for( ; ; str++ )
  {
    c = *str;
    if( ( c >= '0' ) && ( c <= '9' ) )
    {
      accum += (double)( c - '0' ) * decfactor;
      decfactor *= 0.1;
    }
    else if( CC_CHAR_IS_DELIMITER( c ) )
      break;
    else
      return 0;
  }

  done:

  if( negflag )
    accum = -accum;
  *retdouble = (double)accum;
  return 1;
}


int ccSeqParseDouble( char *seq, int seqlength, double *retdouble )
{
  int i, negflag;
  char c;
  double accum;
  double decfactor;

  *retdouble = 0.0;
  i = 0;
  if( !( seq ) )
    return 0;
  negflag = ( seq[i] == '-' );
  i += negflag;

  accum = 0.0;
  for( ; i < seqlength ; i++ )
  {
    c = seq[i];
    if( ( c >= '0' ) && ( c <= '9' ) )
      accum = ( accum * 10.0 ) + (double)( c - '0' );
    else if( CC_CHAR_IS_DELIMITER( c ) )
      goto done;
    else if( c == '.' )
      break;
    else
      return 0;
  }

  i++;
  decfactor = 0.1;
  for( ; i < seqlength ; i++ )
  {
    c = seq[i];
    if( ( c >= '0' ) && ( c <= '9' ) )
    {
      accum += (double)( c - '0' ) * decfactor;
      decfactor *= 0.1;
    }
    else if( CC_CHAR_IS_DELIMITER( c ) )
      break;
    else
      return 0;
  }

  done:

  if( negflag )
    accum = -accum;
  *retdouble = (double)accum;
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


////

