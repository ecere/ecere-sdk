/* -----------------------------------------------------------------------------
 * Copyright (c) 2013-2017 Alexis Naveros.
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

#include "img.h"

#include "texturemanager.h"


/////


#define TEXMG_ENABLE_PNG_SUPPORT (0)


#if TEXMG_ENABLE_PNG_SUPPORT
 #include "imgpng.h"
#endif


////


int selectGLTextureFormat(int bytesPerPixel)
{
  int glformat = 0;

  if( bytesPerPixel == 1 )
  {
#if defined(_GLES) || defined(_GLES2)
    glformat = GL_ALPHA;
#else
   #if ENABLE_GL_LEGACY
      if(glCaps_legacyFormats)
         glformat = GL_ALPHA;
      else
   #endif
        glformat = GL_RED;
#endif
  }
  else if( bytesPerPixel == 2 )
  {
#if defined(_GLES) || defined(_GLES2)
       glformat = GL_LUMINANCE_ALPHA;
#else
   #if ENABLE_GL_LEGACY
      if(glCaps_legacyFormats)
         glformat = GL_LUMINANCE_ALPHA;
      else
   #endif
         glformat = GL_RG;
#endif
  }
  else if( bytesPerPixel == 3 )
    glformat = GL_RGB;
  else if( bytesPerPixel == 4 )
    glformat = GL_RGBA;
  else
  {
    fprintf( stderr, "ERROR: Bad image format.\n" );
  }
  return glformat;
}

static int tmSetTextureData( tmTexture *texture, imgImage *image, int internalformat, int mipmapmode, float anisotropy, int maxresolution )
{
  int width, height;
  int glformat = selectGLTextureFormat(image->format.bytesperpixel);

  if( internalformat == -1 )
  {
    internalformat = glformat;
#if defined(__EMSCRIPTEN__)    // REVIEW: Is this needed for other GL ES 3.0 platforms?
    if(glformat == GL_RG)
       internalformat = GL_RG8;
#endif
  }

  width = image->format.width;
  height = image->format.height;
  if( !( glCaps_nonPow2Textures ) )
  {
    if( !( ccIsPow2Int32( width ) ) || !( ccIsPow2Int32( height ) ) )
    {
      fprintf( stderr, "ERROR: Non-power of two texture used and GL_ARB_texture_non_power_of_two not supported.\n" );
      return 0;
    }
  }

  glGenTextures( 1, &texture->gltex );
  glBindTexture( GL_TEXTURE_2D, texture->gltex );

  glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
  glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR );
  glTexImage2D( GL_TEXTURE_2D, 0, internalformat, image->format.width, image->format.height, 0, glformat, GL_UNSIGNED_BYTE, image->data );

#if GL_TEXTURE_MAX_ANISOTROPY_EXT
  if( /*( GL_EXT_texture_filter_anisotropic ) && */( anisotropy > 1.0 ) )
    glTexParameterf( GL_TEXTURE_2D, GL_TEXTURE_MAX_ANISOTROPY_EXT, anisotropy );
#endif

  texture->width = width;
  texture->height = height;
  texture->widthinv = 1.0 / (float)width;
  texture->heightinv = 1.0 / (float)height;

  return 1;
}



tmTexture *tmCreateTexture( uint32_t textureordermask )
{
  tmTexture *texture = calloc( 1, sizeof(tmTexture) );
  texture->flags = TM_TEXTURE_FLAGS_INVALID;
  texture->ordermask = textureordermask;
  return texture;
}

int tmBuildTexture( tmTexture *texture, imgImage *image, int mipmapmode, float anisotropy, int maxresolution )
{
  if( !( texture->flags & TM_TEXTURE_FLAGS_INVALID ) )
    glDeleteTextures( 1, &texture->gltex );
  if( !( tmSetTextureData( texture, image, -1, mipmapmode, anisotropy, maxresolution ) ) )
  {
    fprintf( stderr, "ERROR: Failed to create texture.\n" );
    free( texture );
    return 0;
  }
  texture->flags &= ~TM_TEXTURE_FLAGS_INVALID;

  return 1;
}

int tmLoadTexture( tmTexture *texture, char *path, int mipmapmode, float anisotropy, int maxresolution )
{
  int retval;
  imgImage image;

#if TEXMG_ENABLE_PNG_SUPPORT
  if( !( imgReadPngFile( &image, path, 0 ) ) )
  {
    fprintf( stderr, "ERROR: Loading texture %s failed.\n", path );
    return 0;
  }
#else
  fprintf( stderr, "ERROR: File support disabled, %s:%d\n", __FILE__, __LINE__ );
  return 0;
#endif

  retval = tmBuildTexture( texture, &image, mipmapmode, anisotropy, maxresolution );
  if( !( retval ) )
    fprintf( stderr, "ERROR: Bad format for texture %s.\n", path );
  free( image.data );

  return retval;
}

void tmDestroyTexture( tmTexture *texture )
{
  if( !( texture->flags & TM_TEXTURE_FLAGS_INVALID ) )
    glDeleteTextures( 1, &texture->gltex );
  free( texture );
  return;
}


////


