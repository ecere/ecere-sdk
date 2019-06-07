/* *****************************************************************************
 * Copyright (c) 2011-2017 Alexis Naveros.
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************
 */

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

#include "cpuconfig.h"
#include "cc.h"

#include "atlasbuilder.h"


////


typedef struct
{
  int16_t x, y, width;
} abAtlasNode;


struct _abAtlas
{
  int width, height;
  abAtlasNode *nodes;
  int nodecount;
  int nodealloc;
};


////


abAtlas *abCreateAtlas( int width, int h, int nodealloc )
{
  abAtlas *atlas = 0;

  /* Allocate memory for the font stash. */
  atlas = (abAtlas*)malloc( sizeof(abAtlas) );
  if( !( atlas ) )
    goto error;
  memset( atlas, 0, sizeof(abAtlas) );

  atlas->width = width;
  atlas->height = h;

  /* Allocate space for skyline nodes */
  if( nodealloc < 32 )
    nodealloc = 32;
  atlas->nodes = (abAtlasNode*)malloc( nodealloc * sizeof(abAtlasNode) );
  if( !( atlas->nodes ) )
    goto error;
  memset( atlas->nodes, 0, nodealloc * sizeof(abAtlasNode) );
  atlas->nodecount = 0;
  atlas->nodealloc = nodealloc;

  /* Init root node. */
  atlas->nodes[0].x = 0;
  atlas->nodes[0].y = 0;
  atlas->nodes[0].width = (int16_t)width;
  atlas->nodecount++;

  return atlas;

  error:
  if( atlas )
  {
    if( atlas->nodes )
      free( atlas->nodes );
    free( atlas );
  }
  return 0;
}

void abDestroyAtlas( abAtlas *atlas )
{
  if( !( atlas ) )
    return;
  if( atlas->nodes )
    free( atlas->nodes );
  free( atlas );
  return;
}


////


static int abAtlasInsertNode( abAtlas *atlas, int nodeindex, int x, int y, int width )
{
  int i;
  /* Insert node */
  if( atlas->nodecount >= atlas->nodealloc )
  {
    atlas->nodealloc <<= 1;
    atlas->nodes = (abAtlasNode*)realloc( atlas->nodes, atlas->nodealloc * sizeof(abAtlasNode) );
    if( !( atlas->nodes ) )
      return 0;
  }
  for( i = atlas->nodecount ; i > nodeindex ; i-- )
    atlas->nodes[i] = atlas->nodes[i-1];
  atlas->nodes[nodeindex].x = (int16_t)x;
  atlas->nodes[nodeindex].y = (int16_t)y;
  atlas->nodes[nodeindex].width = (int16_t)width;
  atlas->nodecount++;

  return 1;
}

static void abAtlasRemoveNode( abAtlas *atlas, int nodeindex )
{
  int i;
  if( atlas->nodecount == 0 )
    return;
  for( i = nodeindex ; i < atlas->nodecount-1 ; i++ )
    atlas->nodes[i] = atlas->nodes[i+1];
  atlas->nodecount--;
  return;
}

static int abAtlasAddSkylineLevel( abAtlas *atlas, int nodeindex, int x, int y, int width, int height )
{
  int i, shrink;

  if( abAtlasInsertNode( atlas, nodeindex, x, y+height, width ) == 0 )
    return 0;

  for( i = nodeindex+1 ; i < atlas->nodecount ; i++ )
  {
    if( atlas->nodes[i].x < ( atlas->nodes[i-1].x + atlas->nodes[i-1].width ) )
    {
      shrink = atlas->nodes[i-1].x + atlas->nodes[i-1].width - atlas->nodes[i].x;
      atlas->nodes[i].x += (int16_t)shrink;
      atlas->nodes[i].width -= (int16_t)shrink;
      if( atlas->nodes[i].width <= 0 )
      {
        abAtlasRemoveNode( atlas, i );
        i--;
      }
      else
        break;
    }
    else
      break;
  }

  for( i = 0 ; i < atlas->nodecount - 1 ; )
  {
    if( atlas->nodes[i].y != atlas->nodes[i+1].y )
      i++;
    else
    {
      atlas->nodes[i].width += atlas->nodes[i+1].width;
      abAtlasRemoveNode( atlas, i+1 );
    }
  }

  return 1;
}

static int abAtlasRectFits( abAtlas *atlas, int nodeindex, int width, int height )
{
  int x, y, rem;
  x = atlas->nodes[nodeindex].x;
  y = atlas->nodes[nodeindex].y;
  if( ( x + width ) > atlas->width )
    return -1;
  for( rem = width ; rem > 0 ; nodeindex++ )
  {
    if( nodeindex == atlas->nodecount )
      return -1;
    if( y < atlas->nodes[nodeindex].y )
      y = atlas->nodes[nodeindex].y;
    if( ( y + height ) > atlas->height )
      return -1;
    rem -= atlas->nodes[nodeindex].width;
  }
  return y;
}


int abAtlasAddRect( abAtlas *atlas, int width, int height, int *retx, int *rety )
{
  int besth, bestw, besti, bestx, besty, y, nodeindex;

  besth = atlas->height;
  bestw = atlas->width;
  besti = -1;
  bestx = -1;
  besty = -1;

  for( nodeindex = 0 ; nodeindex < atlas->nodecount ; nodeindex++ )
  {
    y = abAtlasRectFits( atlas, nodeindex, width, height );
    if( y != -1 )
    {
      if( ( ( y + height ) < besth ) || ( ( ( y + height ) == besth ) && ( atlas->nodes[nodeindex].width < bestw ) ) )
      {
        besti = nodeindex;
        bestw = atlas->nodes[nodeindex].width;
        besth = y + height;
        bestx = atlas->nodes[nodeindex].x;
        besty = y;
      }
    }
  }

  if( besti == -1 )
    return 0;

  if( abAtlasAddSkylineLevel( atlas, besti, bestx, besty, width, height ) == 0 )
    return 0;

  *retx = bestx;
  *rety = besty;

  return 1;
}


void abAtlasExpand( abAtlas *atlas, int width, int height )
{
  if( width > atlas->width )
    abAtlasInsertNode( atlas, atlas->nodecount, atlas->width, 0, width - atlas->width );
  atlas->width = width;
  atlas->height = height;
  return;
}


void abResetAtlas( abAtlas *atlas, int width, int height )
{
  atlas->width = width;
  atlas->height = height;
  atlas->nodecount = 0;
  atlas->nodes[0].x = 0;
  atlas->nodes[0].y = 0;
  atlas->nodes[0].width = (int16_t)width;
  atlas->nodecount++;
  return;
}


int abGetAtlasMaxHeight( abAtlas *atlas )
{
  int i, maxy;
  maxy = 0;
  for( i = 0 ; i < atlas->nodecount ; i++ )
  {
    if( maxy < atlas->nodes[i].y )
      maxy = atlas->nodes[i].y;
  }
  return maxy;
}


