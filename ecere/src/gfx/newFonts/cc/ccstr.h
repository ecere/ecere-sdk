/* -----------------------------------------------------------------------------
 *
 * Copyright (c) 2011 Alexis Naveros.
 * Ecere Corporation has unlimited/unrestricted rights.
 * -----------------------------------------------------------------------------
 */


#ifndef CCSTR_H
#define CCSTR_H

#include "cc.h"

////


static inline CC_ALWAYSINLINE int ccStrCmpEqualInline( char *s0, char *s1 )
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

static inline CC_ALWAYSINLINE int ccIsAlphaNum( char c )
{
  if( ( c >= 'a' ) && ( c <= 'z' ) )
    return 1;
  if( ( c >= 'A' ) && ( c <= 'Z' ) )
    return 1;
  if( ( c >= '0' ) && ( c <= '9' ) )
    return 1;
  return 0;
}

static inline CC_ALWAYSINLINE int ccIsAlphaNumExtended( unsigned char c )
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

static inline CC_ALWAYSINLINE int ccCharHexBase( char c )
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

static inline CC_ALWAYSINLINE size_t ccStrlen( char *str )
{
  return ( str ? strlen( str ) : 0 );
}

void ccStrLowCase( char *str, int length );
void ccStrLowCopy( char *dst, char *src, int length );
int ccStrCmpEqual( char *s0, char *s1 );
int ccStrCmpEqualTest( char *s0, char *s1 );
int ccStrCmpStdTest( char *s0, char *s1 );
int ccStrCpyStr( char *buffer, int buffersize, char *str );
char *ccStrCmpWord( char *str, char *word );
char *ccStrCmpWordIgnoreCase( char *str, char *word );
char *ccStrCmpSeq( char *str, char *seq, int seqlength );
char *ccStrCmpSeqIgnoreCase( char *str, char *seq, int seqlength );
char *ccStrMatchSeq( char *str, char *seq, int seqlength );
char *ccSeqCmpSeq( char *s1, char *s2, int s1length, int s2length );
int ccSeqCmpSeqStdTest( char *s1, char *s2, int s1length, int s2length );
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
char *ccSeqFindStrIgnoreCaseSkip( char *seq, int seqlen, char *str );
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


char *ccStrAllocPrintf( char *format, ... );
char *ccStrDup( const char *str );
int ccUnicodeToUtf8( char *s, uint32_t unicode );
/* Returns 1 when data is insufficient, send more bytes ; state must be initialized to zero */
uint32_t ccUtf8ToUnicode( uint32_t byte, uint32_t *state, uint32_t *retunicode );


////


/* 5 times faster than snprintf() and such */
int ccStrPrintInt32( char *str, int32_t n );
int ccStrPrintUint32( char *str, uint32_t n );
int ccStrPrintInt64( char *str, int64_t n );
int ccStrPrintUint64( char *str, uint64_t n );

/* Buffer size required by ccStrPrint* integer functions */
#define CC_STR_PRINT_BUFSIZE_INT32 (12)
#define CC_STR_PRINT_BUFSIZE_UINT32 (11)
#define CC_STR_PRINT_BUFSIZE_INT64 (21)
#define CC_STR_PRINT_BUFSIZE_UINT64 (20)

/* 20 times faster than snprintf() and such ~ integer range under uint64_t, up to 16 decimals, rounding of decimal at end of mantissa range can be off */
int ccStrPrintDouble( char *str, int bufsize, int decimals, double value );


////


/* Much faster than sscanf() and such */
int ccStrParseInt32( char *str, int32_t *retint );
int ccSeqParseInt32( char *seq, int seqlength, int32_t *retint );
int ccStrParseInt64( char *str, int64_t *retint );
int ccSeqParseInt64( char *seq, int seqlength, int64_t *retint );

/* Fast and generally accurate except for the last 1-2 bits of double mantissa ~ 3x-10x faster than sscanf() and such */
int ccStrParseFloat( char *str, float *retfloat );
int ccSeqParseFloat( char *seq, int seqlength, float *retfloat );
int ccStrParseDouble( char *str, double *retdouble );
int ccSeqParseDouble( char *seq, int seqlength, double *retdouble );

int ccStrParseHex( char *str, int hexchars );


////


#endif

