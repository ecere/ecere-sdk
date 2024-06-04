import "Display"

#include <stdio.h>
#include <math.h>

#include "gl123es.h"

namespace gfx;

#include "cc.h"

struct IMGFormat
{
   int width;
   int height;
   IMGFormatType type;
   int bytesPerPixel;
   int bytesPerLine;
};

enum IMGFormatType { any, rgb24, bfr24, rgba32, bgra32, grayScale };

struct IMGImage
{
   IMGFormat format;
   void *data;
};

class TextureFlags : uint32 { bool invalid:1; }

class Texture : struct
{
   GLuint glTex;
   int width;
   int height;
   float widthinv;
   float heightinv;
   TextureFlags flags;
   SwizzleMode swizzle;
   uint32 orderMask;

   flags = { invalid = true };

public:

   property uint32 orderMask { set { orderMask = value; } }

   static bool setData( IMGImage image, int internalformat, int mipmapmode, float anisotropy, int maxresolution )
   {
      int width, height;
      int glformat;
      SwizzleMode swizzle = 0;

      if( image.format.bytesPerPixel == 1 )
      {
#if defined(_GLES) || defined(_GLES2)
         glformat = GL_ALPHA, swizzle = 1;
#else

   #if ENABLE_GL_LEGACY
         if(glCaps_legacyFormats)
            glformat = GL_ALPHA, swizzle = 1;
         else
   #endif
           glformat = GL_RED, swizzle = 2;
#endif
      }
     else if( image.format.bytesPerPixel == 2 )
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
     else if( image.format.bytesPerPixel == 3 )
       glformat = GL_RGB;
     else if( image.format.bytesPerPixel == 4 )
       glformat = GL_RGBA;
     else
     {
       fprintf( stderr, "ERROR: Bad image format.\n" );
       return false;
     }
     if( internalformat == -1 )
     {
       internalformat = glformat;
#if defined(__EMSCRIPTEN__)    // REVIEW: Is this needed for other GL ES 3.0 platforms?
       if(glformat == GL_RG)
         internalformat = GL_RG8;
       else if(glformat == GL_RED)
         internalformat = GL_R8;
#endif
     }

     width = image.format.width;
     height = image.format.height;
     if(!glCaps_nonPow2Textures)
     {
       if( !( ccIsPow2Int32( width ) ) || !( ccIsPow2Int32( height ) ) )
       {
         fprintf( stderr, "ERROR: Non-power of two texture used and GL_ARB_texture_non_power_of_two not supported.\n" );
         return false;
       }
     }

     glGenTextures( 1, &this.glTex );
     glBindTexture( GL_TEXTURE_2D, this.glTex );

     glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
     glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR );
     glTexImage2D( GL_TEXTURE_2D, 0, internalformat, image.format.width, image.format.height, 0, glformat, GL_UNSIGNED_BYTE, image.data );

#if GL_TEXTURE_MAX_ANISOTROPY_EXT
     if(anisotropy > 1.0)
       glTexParameterf( GL_TEXTURE_2D, GL_TEXTURE_MAX_ANISOTROPY_EXT, anisotropy );
#endif

     this.width = width;
     this.height = height;
     this.swizzle = swizzle;
     widthinv = 1.0f / (float)width;
     heightinv = 1.0f / (float)height;

     return true;
   }

   bool build( IMGImage image, int mipmapmode, float anisotropy, int maxresolution )
   {
     if(!flags.invalid)
       glDeleteTextures( 1, &glTex );
     if( !setData( image, -1, mipmapmode, anisotropy, maxresolution ) )
     {
       fprintf( stderr, "ERROR: Failed to create texture.\n" );
       return false;
     }
     flags.invalid = false;

     return true;
   }

   bool load( const String path, int mipmapmode, float anisotropy, int maxresolution )
   {
     bool result = false;
     IMGImage image;

   #if TEXMG_ENABLE_PNG_SUPPORT
     if( !( imgReadPngFile( &image, path, 0 ) ) )
     {
       fprintf( stderr, "ERROR: Loading texture %s failed.\n", path );
       return false;
     }
   #else
     fprintf( stderr, "ERROR: File support disabled, %s:%d\n", __FILE__, __LINE__ );
     return false;
   #endif

     result = build( image, mipmapmode, anisotropy, maxresolution );
     if( !result )
       fprintf( stderr, "ERROR: Bad format for texture %s.\n", path );
     delete image.data;

     return result;
   }

   ~Texture()
   {
      if( !flags.invalid )
         glDeleteTextures( 1, &glTex );
   }
}
