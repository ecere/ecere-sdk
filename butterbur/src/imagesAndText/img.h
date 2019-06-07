/* *****************************************************************************
 * Copyright (c) 2007-2016 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/

#ifndef IMG_H
#define IMG_H


typedef struct
{
  int width;
  int height;
  int type;
  int bytesperpixel;
  int bytesperline;
} imgFormat;

enum
{
  IMG_FORMAT_TYPE_ANY,
  IMG_FORMAT_TYPE_RGB24,
  IMG_FORMAT_TYPE_BGR24,
  IMG_FORMAT_TYPE_RGBX32,
  IMG_FORMAT_TYPE_BGRX32,
  IMG_FORMAT_TYPE_RGBA32,
  IMG_FORMAT_TYPE_BGRA32,
  IMG_FORMAT_TYPE_GRAYSCALE,
  IMG_FORMAT_TYPE_GRAYALPHA
};

typedef struct
{
  imgFormat format;
  void *data;
} imgImage;


////


void imgCopyRect( imgImage *image, int dstx, int dsty, int srcx, int srcy, int sizex, int sizey );

void (*imgBlendGetFunction( imgImage *dstimage, imgImage *srcimage ))( imgImage *dstimage, int dstx, int dsty, imgImage *srcimage );
int imgBlendImage( imgImage *dstimage, int dstx, int dsty, imgImage *srcimage );

void imgAllocCopy( imgImage *dst, imgImage *src );
void imgAllocCopyExtendBorder( imgImage *dstimage, imgImage *srcimage, int extendsize );
void imgAllocExtractChannel( imgImage *dst, imgImage *src, int channelindex );
void imgAllocExtractChannelExtendBorder( imgImage *dstimage, imgImage *srcimage, int channelindex, int extendsize );
void imgAllocCopyChannelToAlpha( imgImage *dstimage, imgImage *srcimage, int channelindex, unsigned char r, unsigned char g, unsigned char b );
void imgAllocAdjustBrightnessContrast( imgImage *dstimage, imgImage *srcimage, float brightness, float contrast );

void imgFree( imgImage *image );


#endif

