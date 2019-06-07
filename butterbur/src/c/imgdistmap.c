/* -----------------------------------------------------------------------------
 *
 * Copyright (c) 2015 Alexis Naveros.
 *
 * Based on the "Dead Reckoning signed distance transform", by George J. Grevera
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * -----------------------------------------------------------------------------
 */

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <float.h>


////


typedef struct
{
  float distance;
  float x;
  float y;
  float bias;
} mapDistMapPoint;


#define IMGDISTMAP_SQRT2 (1.41421356237f)
#define IMGDISTMAP_SQRT5 (2.2360679775f)
#define IMGDISTMAP_SQRT10 (3.16227766017f)
#define IMGDISTMAP_SQRT13 (3.60555127546f)


#if defined(__GNUC__)
 #define ALWAYS_INLINE __attribute__((always_inline))
#else
 #define ALWAYS_INLINE
#endif


static inline ALWAYS_INLINE void imgDistMapCheck( mapDistMapPoint *pt, float fx, float fy, mapDistMapPoint *ptref, float delta )
{
  float dx, dy;
  if( ( ptref->distance + delta ) < pt->distance )
  {
    pt->x = ptref->x;
    pt->y = ptref->y;
    dx = ptref->x - fx;
    dy = ptref->y - fy;
    pt->distance = sqrtf( ( dx * dx ) + ( dy * dy ) ) + ptref->bias;
    pt->bias = ptref->bias;
  }
  return;
}


#define IMGDIST_OPFLAGS_XP1_SHIFT (0)
#define IMGDIST_OPFLAGS_XP2_SHIFT (1)
#define IMGDIST_OPFLAGS_XP3_SHIFT (2)
#define IMGDIST_OPFLAGS_XM1_SHIFT (3)
#define IMGDIST_OPFLAGS_XM2_SHIFT (4)
#define IMGDIST_OPFLAGS_XM3_SHIFT (5)
#define IMGDIST_OPFLAGS_YP1_SHIFT (6)
#define IMGDIST_OPFLAGS_YP2_SHIFT (7)
#define IMGDIST_OPFLAGS_YP3_SHIFT (8)
#define IMGDIST_OPFLAGS_YM1_SHIFT (9)
#define IMGDIST_OPFLAGS_YM2_SHIFT (10)
#define IMGDIST_OPFLAGS_YM3_SHIFT (11)

#define IMGDIST_OPFLAGS_XP1 (1<<IMGDIST_OPFLAGS_XP1_SHIFT)
#define IMGDIST_OPFLAGS_XP2 (1<<IMGDIST_OPFLAGS_XP2_SHIFT)
#define IMGDIST_OPFLAGS_XP3 (1<<IMGDIST_OPFLAGS_XP3_SHIFT)
#define IMGDIST_OPFLAGS_XM1 (1<<IMGDIST_OPFLAGS_XM1_SHIFT)
#define IMGDIST_OPFLAGS_XM2 (1<<IMGDIST_OPFLAGS_XM2_SHIFT)
#define IMGDIST_OPFLAGS_XM3 (1<<IMGDIST_OPFLAGS_XM3_SHIFT)
#define IMGDIST_OPFLAGS_YP1 (1<<IMGDIST_OPFLAGS_YP1_SHIFT)
#define IMGDIST_OPFLAGS_YP2 (1<<IMGDIST_OPFLAGS_YP2_SHIFT)
#define IMGDIST_OPFLAGS_YP3 (1<<IMGDIST_OPFLAGS_YP3_SHIFT)
#define IMGDIST_OPFLAGS_YM1 (1<<IMGDIST_OPFLAGS_YM1_SHIFT)
#define IMGDIST_OPFLAGS_YM2 (1<<IMGDIST_OPFLAGS_YM2_SHIFT)
#define IMGDIST_OPFLAGS_YM3 (1<<IMGDIST_OPFLAGS_YM3_SHIFT)


static inline ALWAYS_INLINE int imgDistMapForwardOpFlags( int x, int y, int sizex, int sizey )
{
  int opflags;
  opflags = 0;
  opflags |= ( x >= 1 ) << IMGDIST_OPFLAGS_XM1_SHIFT;
  opflags |= ( x >= 2 ) << IMGDIST_OPFLAGS_XM2_SHIFT;
  opflags |= ( x >= 3 ) << IMGDIST_OPFLAGS_XM3_SHIFT;
  opflags |= ( y >= 1 ) << IMGDIST_OPFLAGS_YM1_SHIFT;
  opflags |= ( y >= 2 ) << IMGDIST_OPFLAGS_YM2_SHIFT;
  opflags |= ( y >= 3 ) << IMGDIST_OPFLAGS_YM3_SHIFT;
  opflags |= ( x < (sizex-1) ) << IMGDIST_OPFLAGS_XP1_SHIFT;
  opflags |= ( x < (sizex-2) ) << IMGDIST_OPFLAGS_XP2_SHIFT;
  opflags |= ( x < (sizex-3) ) << IMGDIST_OPFLAGS_XP3_SHIFT;
  return opflags;
}

static void imgDistMapForwardClamp( mapDistMapPoint *p, float fx, float fy, int x, int y, int sizex, int opflags )
{
  if( opflags & IMGDIST_OPFLAGS_XM1 )
    imgDistMapCheck( p, fx, fy, p+( 0*sizex)+(-1), 1.0f );
  if( opflags & IMGDIST_OPFLAGS_YM1 )
  {
    imgDistMapCheck( p, fx, fy, p+(-1*sizex)+( 0), 1.0f );
    if( opflags & IMGDIST_OPFLAGS_XM1 )
      imgDistMapCheck( p, fx, fy, p+(-1*sizex)+(-1), IMGDISTMAP_SQRT2 );
    if( opflags & IMGDIST_OPFLAGS_XP1 )
      imgDistMapCheck( p, fx, fy, p+(-1*sizex)+( 1), IMGDISTMAP_SQRT2 );
    if( opflags & IMGDIST_OPFLAGS_XM2 )
      imgDistMapCheck( p, fx, fy, p+(-1*sizex)+(-2), IMGDISTMAP_SQRT5 );
    if( opflags & IMGDIST_OPFLAGS_XP2 )
      imgDistMapCheck( p, fx, fy, p+(-1*sizex)+( 2), IMGDISTMAP_SQRT5 );
    if( opflags & IMGDIST_OPFLAGS_XM3 )
      imgDistMapCheck( p, fx, fy, p+(-1*sizex)+(-3), IMGDISTMAP_SQRT10 );
    if( opflags & IMGDIST_OPFLAGS_XP3 )
      imgDistMapCheck( p, fx, fy, p+(-1*sizex)+( 3), IMGDISTMAP_SQRT10 );
  }
  if( opflags & IMGDIST_OPFLAGS_YM2 )
  {
    if( opflags & IMGDIST_OPFLAGS_XM1 )
      imgDistMapCheck( p, fx, fy, p+(-2*sizex)+(-1), IMGDISTMAP_SQRT5 );
    if( opflags & IMGDIST_OPFLAGS_XP1 )
      imgDistMapCheck( p, fx, fy, p+(-2*sizex)+( 1), IMGDISTMAP_SQRT5 );
    if( opflags & IMGDIST_OPFLAGS_XM3 )
      imgDistMapCheck( p, fx, fy, p+(-2*sizex)+(-3), IMGDISTMAP_SQRT13 );
    if( opflags & IMGDIST_OPFLAGS_XP3 )
      imgDistMapCheck( p, fx, fy, p+(-2*sizex)+( 3), IMGDISTMAP_SQRT13 );
  }
  if( opflags & IMGDIST_OPFLAGS_YM3 )
  {
    if( opflags & IMGDIST_OPFLAGS_XM1 )
      imgDistMapCheck( p, fx, fy, p+(-3*sizex)+(-1), IMGDISTMAP_SQRT10 );
    if( opflags & IMGDIST_OPFLAGS_XP1 )
      imgDistMapCheck( p, fx, fy, p+(-3*sizex)+( 1), IMGDISTMAP_SQRT10 );
    if( opflags & IMGDIST_OPFLAGS_XM2 )
      imgDistMapCheck( p, fx, fy, p+(-3*sizex)+(-2), IMGDISTMAP_SQRT13 );
    if( opflags & IMGDIST_OPFLAGS_XP2 )
      imgDistMapCheck( p, fx, fy, p+(-3*sizex)+( 2), IMGDISTMAP_SQRT13 );
  }
  return;
}

static inline ALWAYS_INLINE int imgDistMapBackwardOpFlags( int x, int y, int sizex, int sizey )
{
  int opflags;
  opflags = 0;
  opflags |= ( x >= 1 ) << IMGDIST_OPFLAGS_XM1_SHIFT;
  opflags |= ( x >= 2 ) << IMGDIST_OPFLAGS_XM2_SHIFT;
  opflags |= ( x >= 3 ) << IMGDIST_OPFLAGS_XM3_SHIFT;
  opflags |= ( x < (sizex-1) ) << IMGDIST_OPFLAGS_XP1_SHIFT;
  opflags |= ( x < (sizex-2) ) << IMGDIST_OPFLAGS_XP2_SHIFT;
  opflags |= ( x < (sizex-3) ) << IMGDIST_OPFLAGS_XP3_SHIFT;
  opflags |= ( y < (sizey-1) ) << IMGDIST_OPFLAGS_YP1_SHIFT;
  opflags |= ( y < (sizey-2) ) << IMGDIST_OPFLAGS_YP2_SHIFT;
  opflags |= ( y < (sizey-3) ) << IMGDIST_OPFLAGS_YP3_SHIFT;
  return opflags;
}

static void imgDistMapBackwardClamp( mapDistMapPoint *p, float fx, float fy, int x, int y, int sizex, int opflags )
{
  if( opflags & IMGDIST_OPFLAGS_XP1 )
    imgDistMapCheck( p, fx, fy, p+( 0*sizex)+( 1), 1.0f );
  if( opflags & IMGDIST_OPFLAGS_YP1 )
  {
    imgDistMapCheck( p, fx, fy, p+( 1*sizex)+( 0), 1.0f );
    if( opflags & IMGDIST_OPFLAGS_XM1 )
      imgDistMapCheck( p, fx, fy, p+( 1*sizex)+(-1), IMGDISTMAP_SQRT2 );
    if( opflags & IMGDIST_OPFLAGS_XP1 )
      imgDistMapCheck( p, fx, fy, p+( 1*sizex)+( 1), IMGDISTMAP_SQRT2 );
    if( opflags & IMGDIST_OPFLAGS_XM2 )
      imgDistMapCheck( p, fx, fy, p+( 1*sizex)+(-2), IMGDISTMAP_SQRT5 );
    if( opflags & IMGDIST_OPFLAGS_XP2 )
      imgDistMapCheck( p, fx, fy, p+( 1*sizex)+( 2), IMGDISTMAP_SQRT5 );
    if( opflags & IMGDIST_OPFLAGS_XM3 )
      imgDistMapCheck( p, fx, fy, p+( 1*sizex)+(-3), IMGDISTMAP_SQRT10 );
    if( opflags & IMGDIST_OPFLAGS_XP3 )
      imgDistMapCheck( p, fx, fy, p+( 1*sizex)+( 3), IMGDISTMAP_SQRT10 );
  }
  if( opflags & IMGDIST_OPFLAGS_YP2 )
  {
    if( opflags & IMGDIST_OPFLAGS_XM1 )
      imgDistMapCheck( p, fx, fy, p+( 2*sizex)+(-1), IMGDISTMAP_SQRT5 );
    if( opflags & IMGDIST_OPFLAGS_XP1 )
      imgDistMapCheck( p, fx, fy, p+( 2*sizex)+( 1), IMGDISTMAP_SQRT5 );
    if( opflags & IMGDIST_OPFLAGS_XM3 )
      imgDistMapCheck( p, fx, fy, p+( 2*sizex)+(-3), IMGDISTMAP_SQRT13 );
    if( opflags & IMGDIST_OPFLAGS_XP3 )
      imgDistMapCheck( p, fx, fy, p+( 2*sizex)+( 3), IMGDISTMAP_SQRT13 );
  }
  if( opflags & IMGDIST_OPFLAGS_YP3 )
  {
    if( opflags & IMGDIST_OPFLAGS_XM1 )
      imgDistMapCheck( p, fx, fy, p+( 3*sizex)+(-1), IMGDISTMAP_SQRT10 );
    if( opflags & IMGDIST_OPFLAGS_XP1 )
      imgDistMapCheck( p, fx, fy, p+( 3*sizex)+( 1), IMGDISTMAP_SQRT10 );
    if( opflags & IMGDIST_OPFLAGS_XM2 )
      imgDistMapCheck( p, fx, fy, p+( 3*sizex)+(-2), IMGDISTMAP_SQRT13 );
    if( opflags & IMGDIST_OPFLAGS_XP2 )
      imgDistMapCheck( p, fx, fy, p+( 3*sizex)+( 2), IMGDISTMAP_SQRT13 );
  }
  return;
}



/* The outer edge must be all zeroes */
void imgDistMapBuild( float *distancemap, unsigned char *src, int sizex, int sizey, int srcbytesperpixel, int srcbytesperline )
{
  int x, y, mapindex, srcindex;
  unsigned char pixel;
  float fx, fy, bias, maxdistance;
  mapDistMapPoint *ptmap;
  mapDistMapPoint *p;

  if( ( sizex < 4 ) || ( sizey < 4 ) )
    return;

  ptmap = malloc( sizex * sizey * sizeof(mapDistMapPoint) );

  maxdistance = sizex + sizey;
  mapindex = 0;
  for( y = 0 ; y < sizey ; y++ )
  {
    srcindex = y * srcbytesperline;
    for( x = 0 ; x < sizex ; x++ )
    {
      pixel = src[ srcindex ];
      if( pixel )
      {
        fx = (float)x;
        fy = (float)y;
        bias = 1.0f - ( (float)pixel * (1.0f/255.0f) );
        ptmap[mapindex].distance = bias;
        ptmap[mapindex].x = fx;
        ptmap[mapindex].y = fy;
        ptmap[mapindex].bias = bias;
      }
      else
      {
        ptmap[mapindex].distance = maxdistance;
        ptmap[mapindex].x = -1.0f;
        ptmap[mapindex].y = -1.0f;
        ptmap[mapindex].bias = 0.0f;
      }
      mapindex++;
      srcindex += srcbytesperpixel;
    }
  }

  /* Forward pass */
  for( y = 0 ; y < 3 ; y++ )
  {
    mapindex = y * sizex;
    for( x = 0 ; x < sizex ; x++ )
    {
      p = &ptmap[mapindex];
      fx = (float)x;
      fy = (float)y;
      imgDistMapForwardClamp( p, fx, fy, x, y, sizex, imgDistMapForwardOpFlags( x, y, sizex, sizey ) );
      mapindex++;
    }
  }
  for( ; y < sizey - 3 ; y++ )
  {
    mapindex = y * sizex;
    for( x = 0 ; x < 3 ; x++ )
    {
      p = &ptmap[mapindex];
      fx = (float)x;
      fy = (float)y;
      imgDistMapForwardClamp( p, fx, fy, x, y, sizex, imgDistMapForwardOpFlags( x, y, sizex, sizey ) );
      mapindex++;
    }
    for( x = 3 ; x < sizex - 3 ; x++ )
    {
      p = &ptmap[mapindex];
      fx = (float)x;
      fy = (float)y;

      imgDistMapCheck( p, fx, fy, p+( 0*sizex)+(-1), 1.0f );
      imgDistMapCheck( p, fx, fy, p+(-1*sizex)+( 0), 1.0f );
      imgDistMapCheck( p, fx, fy, p+(-1*sizex)+(-1), IMGDISTMAP_SQRT2 );
      imgDistMapCheck( p, fx, fy, p+(-1*sizex)+( 1), IMGDISTMAP_SQRT2 );

      imgDistMapCheck( p, fx, fy, p+(-2*sizex)+(-1), IMGDISTMAP_SQRT5 );
      imgDistMapCheck( p, fx, fy, p+(-2*sizex)+( 1), IMGDISTMAP_SQRT5 );
      imgDistMapCheck( p, fx, fy, p+(-1*sizex)+(-2), IMGDISTMAP_SQRT5 );
      imgDistMapCheck( p, fx, fy, p+(-1*sizex)+( 2), IMGDISTMAP_SQRT5 );

      imgDistMapCheck( p, fx, fy, p+(-3*sizex)+(-1), IMGDISTMAP_SQRT10 );
      imgDistMapCheck( p, fx, fy, p+(-3*sizex)+( 1), IMGDISTMAP_SQRT10 );
      imgDistMapCheck( p, fx, fy, p+(-1*sizex)+(-3), IMGDISTMAP_SQRT10 );
      imgDistMapCheck( p, fx, fy, p+(-1*sizex)+( 3), IMGDISTMAP_SQRT10 );

      imgDistMapCheck( p, fx, fy, p+(-3*sizex)+(-2), IMGDISTMAP_SQRT13 );
      imgDistMapCheck( p, fx, fy, p+(-3*sizex)+( 2), IMGDISTMAP_SQRT13 );
      imgDistMapCheck( p, fx, fy, p+(-2*sizex)+(-3), IMGDISTMAP_SQRT13 );
      imgDistMapCheck( p, fx, fy, p+(-2*sizex)+( 3), IMGDISTMAP_SQRT13 );
      mapindex++;
    }
    for( ; x < sizex ; x++ )
    {
      p = &ptmap[mapindex];
      fx = (float)x;
      fy = (float)y;
      imgDistMapForwardClamp( p, fx, fy, x, y, sizex, imgDistMapForwardOpFlags( x, y, sizex, sizey ) );
      mapindex++;
    }
  }
  for( ; y < sizey ; y++ )
  {
    mapindex = y * sizex;
    for( x = 0 ; x < sizex ; x++ )
    {
      p = &ptmap[mapindex];
      fx = (float)x;
      fy = (float)y;
      imgDistMapForwardClamp( p, fx, fy, x, y, sizex, imgDistMapForwardOpFlags( x, y, sizex, sizey ) );
      mapindex++;
    }
  }

  /* Backward pass */
  for( y = sizey - 1 ; y >= sizey - 3 ; y-- )
  {
    mapindex = ( y * sizex ) + ( sizex - 1 );
    for( x = sizex - 1 ; x >= 0 ; x-- )
    {
      p = &ptmap[mapindex];
      fx = (float)x;
      fy = (float)y;
      imgDistMapBackwardClamp( p, fx, fy, x, y, sizex, imgDistMapBackwardOpFlags( x, y, sizex, sizey ) );
      distancemap[ mapindex ] = p->distance;
      mapindex--;
    }
  }
  for( ; y >= 3 ; y-- )
  {
    mapindex = ( y * sizex ) + ( sizex - 1 );
    for( x = sizex - 1 ; x >= sizex - 3 ; x-- )
    {
      p = &ptmap[mapindex];
      fx = (float)x;
      fy = (float)y;
      imgDistMapBackwardClamp( p, fx, fy, x, y, sizex, imgDistMapBackwardOpFlags( x, y, sizex, sizey ) );
      distancemap[ mapindex ] = p->distance;
      mapindex--;
    }
    for( ; x >= 3 ; x-- )
    {
      p = &ptmap[mapindex];
      fx = (float)x;
      fy = (float)y;

      imgDistMapCheck( p, fx, fy, p+( 0*sizex)+( 1), 1.0f );
      imgDistMapCheck( p, fx, fy, p+( 1*sizex)+( 0), 1.0f );
      imgDistMapCheck( p, fx, fy, p+( 1*sizex)+(-1), IMGDISTMAP_SQRT2 );
      imgDistMapCheck( p, fx, fy, p+( 1*sizex)+( 1), IMGDISTMAP_SQRT2 );

      imgDistMapCheck( p, fx, fy, p+( 2*sizex)+(-1), IMGDISTMAP_SQRT5 );
      imgDistMapCheck( p, fx, fy, p+( 2*sizex)+( 1), IMGDISTMAP_SQRT5 );
      imgDistMapCheck( p, fx, fy, p+( 1*sizex)+(-2), IMGDISTMAP_SQRT5 );
      imgDistMapCheck( p, fx, fy, p+( 1*sizex)+( 2), IMGDISTMAP_SQRT5 );

      imgDistMapCheck( p, fx, fy, p+( 3*sizex)+(-1), IMGDISTMAP_SQRT10 );
      imgDistMapCheck( p, fx, fy, p+( 3*sizex)+( 1), IMGDISTMAP_SQRT10 );
      imgDistMapCheck( p, fx, fy, p+( 1*sizex)+(-3), IMGDISTMAP_SQRT10 );
      imgDistMapCheck( p, fx, fy, p+( 1*sizex)+( 3), IMGDISTMAP_SQRT10 );

      imgDistMapCheck( p, fx, fy, p+( 3*sizex)+(-2), IMGDISTMAP_SQRT13 );
      imgDistMapCheck( p, fx, fy, p+( 3*sizex)+( 2), IMGDISTMAP_SQRT13 );
      imgDistMapCheck( p, fx, fy, p+( 2*sizex)+(-3), IMGDISTMAP_SQRT13 );
      imgDistMapCheck( p, fx, fy, p+( 2*sizex)+( 3), IMGDISTMAP_SQRT13 );

      distancemap[ mapindex ] = p->distance;
      mapindex--;
    }
    for( ; x >= 0 ; x-- )
    {
      p = &ptmap[mapindex];
      fx = (float)x;
      fy = (float)y;
      imgDistMapBackwardClamp( p, fx, fy, x, y, sizex, imgDistMapBackwardOpFlags( x, y, sizex, sizey ) );
      distancemap[ mapindex ] = p->distance;
      mapindex--;
    }
  }
  for( ; y >= 0 ; y-- )
  {
    mapindex = ( y * sizex ) + ( sizex - 1 );
    for( x = sizex - 1 ; x >= 0 ; x-- )
    {
      p = &ptmap[mapindex];
      fx = (float)x;
      fy = (float)y;
      imgDistMapBackwardClamp( p, fx, fy, x, y, sizex, imgDistMapBackwardOpFlags( x, y, sizex, sizey ) );
      distancemap[ mapindex ] = p->distance;
      mapindex--;
    }
  }

  free( ptmap );

  return;
}


////

