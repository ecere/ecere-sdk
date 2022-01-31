/* -----------------------------------------------------------------------------
 * Copyright (c) 2013-2017 Alexis Naveros.
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

typedef unsigned int GLCapabilities;
typedef unsigned int bool;
#include "gl123es.h"

#include "cc.h"
#include "mm.h"

#if PNG_SUPPORT
 #include "imgpng.h"
#endif

#include "fontmanager.h"

#include "drawmanager.h"


////


typedef struct
{
  void *context;
  tmTexture *texture;
  int texturewidth, textureheight;
  int channelcount;

  int imagecount;
  int imagealloc;
  dmImage *imagelist;

  uint32_t statecolor;
  uint32_t stateextcolor;
  uint32_t statecursorcolor;
  uint32_t statelayer;

} frFontState;


////


void *frFontInit( fmManager *fm, void *rendererdata, int channelcount )
{
  frFontState *state;
  void *context;

  context = rendererdata;
  state = (frFontState *)malloc( sizeof(frFontState) );
  if( !( state ) )
    return 0;
  memset( state, 0, sizeof(frFontState) );
  state->context = context;
  state->texture = 0;
  state->channelcount = channelcount;
  state->imagecount = 0;
  state->imagealloc = 512;
  state->imagelist = malloc( state->imagealloc * sizeof(dmImage) );

  state->statecolor = 0xffffffff;
  state->statecursorcolor = 0xffffffff;
  state->statelayer = DM_LAYER_ABOVE;

  return state;
}


static void frFontDestroy( void *rendererhandle )
{
  frFontState *state;

  state = (frFontState *)rendererhandle;
  if( state->texture )
    tmDestroyTexture( state->texture );
  if( state->imagelist )
    free( state->imagelist );
  free( state );
  return;
}


static int frFontCreateTexture( void *rendererhandle, int width, int height )
{
  frFontState *state;
  imgImage image;

  state = (frFontState *)rendererhandle;
  if( state->texture )
  {
    tmDestroyTexture( state->texture );
    state->texture = 0;
  }

  state->texture = tmCreateTexture( 0 << DM_TEXTURE_ORDER_SHIFT );
  state->texturewidth = width;
  state->textureheight = height;

  image.format.width = width;
  image.format.height = height;
  image.format.type = -1;
  image.format.bytesperpixel = state->channelcount;
  image.format.bytesperline = width * state->channelcount;
  image.data = 0;
  tmBuildTexture( state->texture, &image, 0, 0.0, 0 );

  return 1;
}

static int frFontResizeTexture( void *rendererhandle, int width, int height )
{
  int retval;
  frFontState *state;

  state = (frFontState *)rendererhandle;
  // Reuse create to resize too.
  if( state->imagelist )
    ; // REVIEW: free( state->imagelist );
      // It seems that this was freeing existing glyphs while the atlas is being resized...
  if(!state->imagelist )
  {
    state->imagecount = 0;
    state->imagealloc = 512;
    state->imagelist = malloc( state->imagealloc * sizeof(dmImage) );
  }
  retval = frFontCreateTexture( rendererhandle, width, height );
  return retval;
}

static void frFontUpdateTexture( void *rendererhandle, int *rect, const unsigned char *data )
{
  int sizex, sizey, glformat = GL_RGBA;
  frFontState *state;

  sizex = rect[2] - rect[0];
  sizey = rect[3] - rect[1];
  state = (frFontState *)rendererhandle;
  if( !( state->texture ) )
    return;

  if( state->channelcount == 1 )
    glformat = GL_RED;
  else if( state->channelcount == 2 )
    glformat = GL_RG;
  else if( state->channelcount == 3 )
    glformat = GL_RGB;
  else if( state->channelcount == 4 )
    glformat = GL_RGBA;

  glBindTexture( GL_TEXTURE_2D, (state->texture)->gltex );
  glPixelStorei( GL_UNPACK_ALIGNMENT, 1 );
  glPixelStorei( GL_UNPACK_ROW_LENGTH, state->texturewidth );
  glTexSubImage2D( GL_TEXTURE_2D, 0, rect[0], rect[1], sizex, sizey, glformat, GL_UNSIGNED_BYTE, data + (rect[1] * state->texturewidth + rect[0]) * state->channelcount);

  // BIG BUG HERE: The caller expects the texture to remain bound!!
  //glBindTexture( GL_TEXTURE_2D, 0);
  //glPixelStorei( GL_UNPACK_ALIGNMENT, 4 );
  glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
  glPixelStorei( GL_UNPACK_ROW_LENGTH, 0 );

#if PNG_SUPPORT && 0
  imgImage image;
  image.format.width = state->texturewidth;
  image.format.height = state->textureheight;
  image.format.type = IMG_FORMAT_TYPE_GRAYSCALE;
  if( state->channelcount == 4 )
    image.format.type = IMG_FORMAT_TYPE_RGBA32;
  image.format.bytesperpixel = state->channelcount;
  image.format.bytesperline = image.format.width * image.format.bytesperpixel;
  image.data = (void *)data;
  if( !( imgWritePngFile( "zzzfontatlas.png", &image, 1.0 ) ) )
    printf( "PNG write failed (zzzfontatlas.png)\n" );
#endif

  return;
}

static void frFontFlush( void *rendererhandle )
{
  frFontState *state;
  state = (frFontState *)rendererhandle;
  dmFlushImages( state->context );
  return;
}


static int frFontRegisterImage( void *rendererhandle, int offsetx, int offsety, int width, int height )
{
  int imageindex;
  frFontState *state;
  dmImage *image;

  state = (frFontState *)rendererhandle;
  imageindex = state->imagecount;

  if( state->imagecount >= state->imagealloc )
  {
    /* Do we really need that image flush? */
    dmFlushImages( state->context );
    state->imagealloc <<= 1;
    state->imagelist = realloc( state->imagelist, state->imagealloc * sizeof(dmImage) );
    memset((char *)state->imagelist + state->imagecount * sizeof(dmImage), 0,
      (state->imagealloc - state->imagecount) * sizeof(dmImage));
  }
  state->imagecount++;

  if(!state->texture)
  {
     printf("Null texture?\n");
  }

  image = &state->imagelist[ imageindex ];
#if DM_ENABLE_EXT_COLOR //1
  dmDefineImage( image, state->texture, offsetx, offsety, width, height, 1, DM_PROGRAM_ALPHABLEND_INTENSITY_EXTCOLOR, state->statelayer );
#elif 1
  dmDefineImage( image, state->texture, offsetx, offsety, width, height, 1, DM_PROGRAM_ALPHABLEND_INTENSITY, state->statelayer );
#elif 1
  dmDefineImage( image, state->texture, offsetx, offsety, width, height, 1, DM_PROGRAM_ALPHABLEND, state->statelayer );
#else
  dmDefineImage( image, state->texture, offsetx, offsety, width, height, 1, DM_PROGRAM_NORMAL, state->statelayer );
#endif

  return imageindex;
}


static void frFontDrawImage( void *rendererhandle, int targetx, int targety, int imageindex )
{
  frFontState *state;
  dmImage *image;

  state = (frFontState *)rendererhandle;
  image = &state->imagelist[ imageindex ];

#if DM_ENABLE_EXT_COLOR
  dmDrawImageExtColor( state->context, image, targetx, targety, image->sizex, image->sizey, state->statecolor, state->stateextcolor );
#else
  dmDrawImage( state->context, image, targetx, targety, image->sizex, image->sizey, state->statecolor );
#endif

  return;
}

static void frFontDrawImageCursor( void *rendererhandle, int targetx, int targety, int imageindex )
{
  frFontState *state;
  dmImage *image;

  state = (frFontState *)rendererhandle;
  image = &state->imagelist[ imageindex ];

#if DM_ENABLE_EXT_COLOR
  dmDrawImageExtColor( state->context, image, targetx, targety, image->sizex, image->sizey, state->statecursorcolor, state->stateextcolor );
#else
  dmDrawImage( state->context, image, targetx, targety, image->sizex, image->sizey, state->statecursorcolor );
#endif

  return;
}

static void frFontDrawImageAlt( void *rendererhandle, unsigned char *texdata, int targetx, int targety, int offsetx, int offsety, int width, int height )
{
  return;
}

static void frFontDrawImageFloat( void *rendererhandle, float targetx, float targety, float angsin, float angcos, int imageindex )
{
  frFontState *state;
  dmImage *image;

  state = (frFontState *)rendererhandle;
  image = &state->imagelist[ imageindex ];

  /* 0.2588190451, 0.965925826289 */
#if DM_ENABLE_EXT_COLOR
  dmDrawImageFloatExtColor( state->context, image, targetx, targety, (float)image->sizex, (float)image->sizey, angsin, angcos, state->statecolor, state->stateextcolor );
#else
  dmDrawImageFloat( state->context, image, targetx, targety, (float)image->sizex, (float)image->sizey, angsin, angcos, state->statecolor );
#endif

  return;
}


static void frFontResetImages( void *rendererhandle )
{
  frFontState *state;

  state = (frFontState *)rendererhandle;
  state->imagecount = 0;
  return;
}


////


const fmRenderer frFontRenderer =
{
  .init = frFontInit,
  .destroy = frFontDestroy,
  .createtexture = frFontCreateTexture,
  .resizetexture = frFontResizeTexture,
  .updatetexture = frFontUpdateTexture,
  .flush = frFontFlush,
  .registerimage = frFontRegisterImage,
  .drawimage = frFontDrawImage,
  .drawimagecursor = frFontDrawImageCursor,
  .drawimagealt = frFontDrawImageAlt,
  .drawimagefloat = frFontDrawImageFloat,
  .drawimagefloatalt = 0,
  .resetimages = frFontResetImages,
  .escapeprocess = 0,
  .escapeskip = 0
};


////


void frFontSetColor( void *rendererhandle, uint32_t color )
{
  frFontState *state;
  state = (frFontState *)rendererhandle;
  state->statecolor = color;
  return;
}


void frFontSetExtColor( void *rendererhandle, uint32_t extcolor )
{
  frFontState *state;
  state = (frFontState *)rendererhandle;
  state->stateextcolor = extcolor;
  return;
}


void frFontSetCursorColor( void *rendererhandle, uint32_t color )
{
  frFontState *state;
  state = (frFontState *)rendererhandle;
  state->statecursorcolor = color;
  return;
}


void frFontSetLayer( void *rendererhandle, uint32_t layerindex )
{
  frFontState *state;
  state = (frFontState *)rendererhandle;
  state->statelayer = layerindex;
  return;
}


