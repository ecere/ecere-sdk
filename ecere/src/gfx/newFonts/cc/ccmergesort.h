/* *****************************************************************************
 * Copyright (c) 2007-2014 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
/*

Templates C style!

#include this whole file with the following definitions set:

#define MSORT_MAIN MyInlinedSortFunction
#define MSORT_CMP MyComparisonFunction
#define MSORT_TYPE int

*/


#ifndef CC_MSORT_INLINE

typedef struct
{
  void *src;
  void *dst;
  int count;
  int mergeflag;
  int depthbit;
} ccMergeSortStack;

 #define CC_MSORT_INLINE
 #define CC_MSORT_STACK_DEPTH (512)

#endif


#ifndef MSORT_COPY
 #define MSORT_COPY(d,s) (*(d)=*(s))
 #define CC_MSORT_COPY
#endif


#ifdef MSORT_CONTEXT
 #define MSORT_CONTEXT_PARAM , MSORT_CONTEXT context
 #define MSORT_CONTEXT_PASS context,
 #define MSORT_CONTEXT_PASSLAST , context
#else
 #define MSORT_CONTEXT_PARAM
 #define MSORT_CONTEXT_PASS
 #define MSORT_CONTEXT_PASSLAST
#endif


static MSORT_TYPE *MSORT_MAIN( MSORT_TYPE *src, MSORT_TYPE *tmp, int count MSORT_CONTEXT_PARAM )
{
  int swapflag, depthbit, maxdepthbit;
  ssize_t leftcount, rightcount;
  MSORT_TYPE *dst;
  MSORT_TYPE *sl;
  MSORT_TYPE *sr;
  MSORT_TYPE *dstend;
  MSORT_TYPE *dstbase;
  MSORT_TYPE *swap;
  MSORT_TYPE temp;
  ccMergeSortStack stack[CC_MSORT_STACK_DEPTH];
  ccMergeSortStack *sp;

  if( count <= 1 )
    return src;

  dst = tmp;
  sp = stack;
  swapflag = 0;
  depthbit = 0;

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
        if( ( count == 4 ) && MSORT_CMP( MSORT_CONTEXT_PASS &src[2], &src[3] ) )
        {
          MSORT_COPY( &temp, &src[2] );
          MSORT_COPY( &src[2], &src[3] );
          MSORT_COPY( &src[3], &temp );
        }
        if( MSORT_CMP( MSORT_CONTEXT_PASS &src[0], &src[1] ) )
        {
          MSORT_COPY( &temp, &src[0] );
          MSORT_COPY( &src[0], &src[1] );
          MSORT_COPY( &src[1], &temp );
        }
        swapflag = 0;
      }
      else
      {
        if( count == 4 )
        {
          if( MSORT_CMP( MSORT_CONTEXT_PASS &src[2], &src[3] ) )
          {
            MSORT_COPY( &dst[2], &src[3] );
            MSORT_COPY( &dst[3], &src[2] );
          }
          else
          {
            MSORT_COPY( &dst[2], &src[2] );
            MSORT_COPY( &dst[3], &src[3] );
          }
        }
        else if( count == 3 )
          MSORT_COPY( &dst[2], &src[2] );
        if( MSORT_CMP( MSORT_CONTEXT_PASS &src[0], &src[1] ) )
        {
          MSORT_COPY( &dst[0], &src[1] );
          MSORT_COPY( &dst[1], &src[0] );
        }
        else
        {
          MSORT_COPY( &dst[0], &src[0] );
          MSORT_COPY( &dst[1], &src[1] );
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
      sp->count = (int)rightcount;
      sp->mergeflag = 0;
      sp->depthbit = depthbit;
      sp++;
      count = (int)leftcount;
      continue;
    }

    for( ; ; )
    {
      rightcount = count >> 1;
      leftcount = count - rightcount;
      sl = src;
      sr = src + leftcount;
      dstbase = dst;
      for( ; ; )
      {
        if( MSORT_CMP( MSORT_CONTEXT_PASS sl, sr ) )
        {
          MSORT_COPY( dst++, sr++ );
          if( --rightcount )
            continue;
          for( dstend = &dst[leftcount] ; dst < dstend ; )
            MSORT_COPY( dst++, sl++ );
          break;
        }
        else
        {
          MSORT_COPY( dst++, sl++ );
          if( --leftcount )
            continue;
          for( dstend = &dst[rightcount] ; dst < dstend ; )
            MSORT_COPY( dst++, sr++ );
          break;
        }
      }
      if( sp == stack )
        return dstbase;
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


#ifdef CC_MSORT_COPY
 #undef MSORT_COPY
 #undef CC_MSORT_COPY
#endif

#undef MSORT_CONTEXT_PARAM
#undef MSORT_CONTEXT_PASS
#undef MSORT_CONTEXT_PASSLAST

