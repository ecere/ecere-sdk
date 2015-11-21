/* *****************************************************************************
 * Copyright (c) 2007-2014 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
/*

Templates C style!

#include this whole file with the following definitions set:

#define HSORT_MAIN MyInlinedSortFunction
#define HSORT_CMP MyComparisonFunction
#define HSORT_TYPE int

*/


#ifndef CC_HSORT_INLINE

 #define CC_HSORT_SWAP(a,b) (__extension__({temp=table[b];table[b]=table[a];table[a]=temp;}))
 #define CC_HSORT_STACK_DEPTH (512)
 #define CC_HSORT_MIN_QSORT_COUNT (5)

typedef struct
{
  void *table;
  int count;
  int depth;
} ccHybridSortStack;

 #define CC_HSORT_INLINE
 #define CC_HSORT_STACK_DEPTH (512)

#endif


#ifndef HSORT_COPY
 #define HSORT_COPY(d,s) (*(d)=*(s))
 #define CC_HSORT_COPY
#endif


#ifdef HSORT_CONTEXT
 #define HSORT_CONTEXT_PARAM , HSORT_CONTEXT context
 #define HSORT_CONTEXT_PASS context,
 #define HSORT_CONTEXT_PASSLAST , context
#else
 #define HSORT_CONTEXT_PARAM
 #define HSORT_CONTEXT_PASS
 #define HSORT_CONTEXT_PASSLAST
#endif


/* Build merge sort pipeline */
#define HSORT_MERGE_FUNCX(n) n##Merge
#define HSORT_MERGE_FUNC(n) HSORT_MERGE_FUNCX(n)
#define MSORT_MAIN HSORT_MERGE_FUNC(HSORT_MAIN)
#define MSORT_CMP HSORT_CMP
#define MSORT_TYPE HSORT_TYPE
#ifdef HSORT_CONTEXT
 #define MSORT_CONTEXT HSORT_CONTEXT
#endif
#include "ccmergesort.h"
#undef MSORT_MAIN
#undef MSORT_CMP
#undef MSORT_TYPE
#ifdef HSORT_CONTEXT
 #undef MSORT_CONTEXT
#endif


#define HSORT_PART_FUNCX(n) n##Part
#define HSORT_PART_FUNC(n) HSORT_PART_FUNCX(n)

static void HSORT_PART_FUNC(HSORT_MAIN)( HSORT_TYPE *table, int count HSORT_CONTEXT_PARAM )
{
  HSORT_TYPE temp;
  if( count == 4 )
  {
    if( HSORT_CMP( HSORT_CONTEXT_PASS &table[0], &table[1] ) )
      CC_HSORT_SWAP( 1, 0 );
    if( HSORT_CMP( HSORT_CONTEXT_PASS &table[2], &table[3] ) )
      CC_HSORT_SWAP( 3, 2 );
    if( HSORT_CMP( HSORT_CONTEXT_PASS &table[0], &table[2] ) )
    {
      temp = table[2];
      table[2] = table[1];
      table[1] = table[0];
      table[0] = temp;
      if( HSORT_CMP( HSORT_CONTEXT_PASS &table[2], &table[3] ) )
      {
        CC_HSORT_SWAP( 3, 2 );
        if( HSORT_CMP( HSORT_CONTEXT_PASS &table[1], &table[2] ) )
          CC_HSORT_SWAP( 2, 1 );
      }
    }
    else
    {
      if( HSORT_CMP( HSORT_CONTEXT_PASS &table[1], &table[2] ) )
      {
        CC_HSORT_SWAP( 2, 1 );
        if( HSORT_CMP( HSORT_CONTEXT_PASS &table[2], &table[3] ) )
          CC_HSORT_SWAP( 3, 2 );
      }
    }
  }
  else if( count == 3 )
  {
    if( HSORT_CMP( HSORT_CONTEXT_PASS &table[0], &table[1] ) )
    {
      if( HSORT_CMP( HSORT_CONTEXT_PASS &table[1], &table[2] ) )
      {
        /* [1]>[0], [2]>[1] = [2]>[1]>[0] */
        CC_HSORT_SWAP( 2, 0 );
      }
      else
      {
        if( HSORT_CMP( HSORT_CONTEXT_PASS &table[0], &table[2] ) )
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
          CC_HSORT_SWAP( 1, 0 );
        }
      }
    }
    else
    {
      if( HSORT_CMP( HSORT_CONTEXT_PASS &table[1], &table[2] ) )
      {
        if( HSORT_CMP( HSORT_CONTEXT_PASS &table[0], &table[2] ) )
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
          CC_HSORT_SWAP( 1, 2 );
        }
      }
      else
      {
        /* [1]<[0], [2]<[1] = [0]>[1]>[2] */
      }
    }
  }
  else if( count == 2 )
  {
    if( HSORT_CMP( HSORT_CONTEXT_PASS &table[0], &table[1] ) )
      CC_HSORT_SWAP( 1, 0 );
  }
  return;
}


static void HSORT_MAIN( HSORT_TYPE *table, HSORT_TYPE *tmp, int count HSORT_CONTEXT_PARAM, uint32_t randmask )
{
  int depth, depthmax, tmpcountalloc;
  ssize_t i, pivotindex, leftcount, rightcount, highindex, pivotoffset;
  HSORT_TYPE temp;
  HSORT_TYPE *mergesrc;
  HSORT_TYPE pivot;
  ccHybridSortStack stack[CC_HSORT_STACK_DEPTH];
  ccHybridSortStack *sp;
#ifdef HSORT_PIVOT_STORE
  HSORT_PIVOT_STORE pivotstore;
#endif

  if( count <= 1 )
    return;

  depth = 0;
  depthmax = 1 + ccLog2Int32( count );
  tmpcountalloc = count;

  sp = stack;
  for( ; ; )
  {
    if( count < CC_HSORT_MIN_QSORT_COUNT )
    {
      HSORT_PART_FUNC(HSORT_MAIN)( table, count HSORT_CONTEXT_PASSLAST );
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
      if( !( tmp ) )
      {
        tmp = malloc( tmpcountalloc * sizeof(HSORT_TYPE) );
        tmpcountalloc = 0;
      }
      mergesrc = HSORT_MERGE_FUNC(HSORT_MAIN)( table, tmp, count HSORT_CONTEXT_PASSLAST );
      if( mergesrc != table )
        memcpy( table, mergesrc, count * sizeof(HSORT_TYPE) );
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
    if( HSORT_CMP( HSORT_CONTEXT_PASS &table[0], &table[pivotindex] ) )
      CC_HSORT_SWAP( pivotindex, 0 );
    if( HSORT_CMP( HSORT_CONTEXT_PASS &table[pivotindex], &table[count-1] ) )
    {
      CC_HSORT_SWAP( count-1, pivotindex );
      if( HSORT_CMP( HSORT_CONTEXT_PASS &table[0], &table[pivotindex] ) )
        CC_HSORT_SWAP( pivotindex, 0 );
    }

    /* Quick sort on both sides of the pivot */
    pivot = table[pivotindex];
    highindex = count - 2;
    pivotoffset = highindex;
    CC_HSORT_SWAP( pivotoffset, pivotindex );
    pivotindex = 1;
#ifdef HSORT_PIVOT_STORE
    HSORT_PIVOT_INIT( HSORT_CONTEXT_PASS &pivotstore, &pivot );
#endif
    for( i = highindex ; --i ; )
    {
      /* Optional optimization for constant pivot */
#ifdef HSORT_PIVOT_STORE
      if( HSORT_PIVOT_CMP( HSORT_CONTEXT_PASS &pivotstore, &pivot, &table[pivotindex] ) )
#else
      if( HSORT_CMP( HSORT_CONTEXT_PASS &pivot, &table[pivotindex] ) )
#endif
        pivotindex++;
      else
      {
        highindex--;
        CC_HSORT_SWAP( highindex, pivotindex );
      }
    }
    CC_HSORT_SWAP( pivotindex, pivotoffset );

    /* Count of entries on both sides of the pivot */
    leftcount = pivotindex;
    pivotindex++;
    rightcount = count - pivotindex;

    /* Fast sort small chunks, iterate */
    if( leftcount < rightcount )
    {
      depth++;
      sp->table = &table[pivotindex];
      sp->count = (int)rightcount;
      sp->depth = depth;
      sp++;
      count = (int)leftcount;
    }
    else
    {
      depth++;
      sp->table = table;
      sp->count = (int)leftcount;
      sp->depth = depth;
      sp++;
      table += pivotindex;
      count = (int)rightcount;
    }
  }

  if( !( tmpcountalloc ) )
    free( tmp );

  return;
}


#ifdef CC_HSORT_COPY
 #undef HSORT_COPY
 #undef CC_HSORT_COPY
#endif

#undef HSORT_CONTEXT_PARAM
#undef HSORT_CONTEXT_PASS
#undef HSORT_CONTEXT_PASSLAST

