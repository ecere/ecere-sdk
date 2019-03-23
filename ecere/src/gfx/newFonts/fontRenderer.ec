/* *****************************************************************************
 * Original Version Copyright (c) 2007-2014 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
#undef __BLOCKS__

import "Color"

#define _Noreturn

#define set _set
#include <math.h>
#include <stdlib.h>

#include "gl123es.h"

namespace gfx;

#include "cc.h"
#include "mm.h"

#undef set

import "fmFontManager"
import "textureManager"
import "drawManager"

public class FontRenderer : FontManagerRenderer
{
   DrawManager dm;
   Texture texture;
   int textureWidth, textureHeight;
   int channelcount;

   ColorAlpha stateColor;
   ColorAlpha stateExtColor;
   ColorAlpha stateCursorColor;
   uint32 stateLayer;

   stateColor = white;
   stateCursorColor = white;
   stateLayer = DM_LAYER_ABOVE;

public:

   property DrawManager drawManager { set { dm = value; } }

   bool init(int channelCount)
   {
      this.channelcount = channelCount;
      return true;
   }

   ~FontRenderer()
   {
      delete texture;
   }

   bool createTexture( int width, int height )
   {
      IMGImage image
      {
         format = { width = width, height = height, type = grayScale, bytesPerPixel = channelcount, bytesPerLine = width };
      };

      delete texture;

      texture = { };
      texture.build(image, 0, 0.0, 0 );

      textureWidth = width;
      textureHeight = height;
      return true;
   }

   int resizeTexture( int width, int height )
   {
     dm.clearImages();
     // Reuse create to resize too.
     return createTexture( width, height );
   }

   void updateTexture( int *rect, const byte* data )
   {
     if(texture)
     {
#if defined(_GLES) || defined(_GLES2)
        int glformat = GL_ALPHA;
#else
        int glformat =
   #if ENABLE_GL_LEGACY
         glCaps_legacyFormats ? GL_ALPHA :
   #endif
            GL_RED;
#endif
        int w = rect[2] - rect[0];
        int h = rect[3] - rect[1];


        if( channelcount == 1 );
        else if( channelcount == 2 )
        {
#if !ENABLE_GL_LEGACY && !defined(_GLES) && !defined(_GLES2)
          glformat = glCaps_legacyFormats ? GL_LUMINANCE_ALPHA : GL_RG;
#else
          glformat = GL_LUMINANCE_ALPHA;
#endif
        }
        else if( channelcount == 3 )
          glformat = GL_RGB;
        else if( channelcount == 4 )
          glformat = GL_RGBA;

        // FIXME: no glPushAttrib() in core profile
#if ENABLE_GL_LEGACY
        if(glCaps_legacy)
        {
          glPushClientAttrib( GL_CLIENT_PIXEL_STORE_BIT );
          glPushAttrib( GL_TEXTURE_BIT );
        }
#endif

        glPixelStorei( GL_UNPACK_ALIGNMENT, 1 );
        glBindTexture( GL_TEXTURE_2D, texture.glTex );
#if ENABLE_GL_LEGACY
        if(glCaps_legacy)
        {
           glPixelStorei( GL_UNPACK_ROW_LENGTH, textureWidth );
           glTexSubImage2D( GL_TEXTURE_2D, 0, rect[0], rect[1], w, h, glformat, GL_UNSIGNED_BYTE, data + (rect[1] * textureWidth + rect[0]) * channelcount);
        }
        else
#endif
       {
          int row = w * channelcount;
          byte * tmp = new byte[h * row];
          int y;
          for(y = 0; y < h; y++)
            memcpy(tmp + y * row, data + textureWidth * (y + rect[1]) + rect[0], row);
          glTexSubImage2D( GL_TEXTURE_2D, 0, rect[0], rect[1], w, h, glformat, GL_UNSIGNED_BYTE, tmp);
          delete tmp;
       }

#if ENABLE_GL_LEGACY
        if(glCaps_legacy)
        {
           glPopAttrib();
           glPopClientAttrib();
        }
        else
#endif
           glPixelStorei( GL_UNPACK_ALIGNMENT, 4 );

      #if 0
        IMGImage image;
        image.format.width = textureWidth;
        image.format.height = textureHeight;
        image.format.type = channelcount == 4 ? IMG_FORMAT_TYPE_RGBA32 : IMG_FORMAT_TYPE_GRAYSCALE;
        image.format.bytesPerPixel = channelcount;
        image.format.bytesPerLine = image.format.width * image.format.bytesPerPixel;
        image.data = data;
        imgWritePngFile( "zzz2.png", &image, 1.0 );
      #endif
     }
   }

   void flush( )
   {
      dm.flushImages( );
   }

   int registerImage( int offsetx, int offsety, int width, int height )
   {
      return dm.defineImage( texture, offsetx, offsety, width, height, true, stateLayer );
   }

   void drawImage( int targetx, int targety, int imageIndex, bool useExtColor )
   {
      dm.drawImage( imageIndex, targetx, targety, 0,1, useExtColor ? stateExtColor : stateColor );
   }

   void drawImageCursor( int targetx, int targety, int imageIndex )
   {
      dm.drawImage( imageIndex, targetx, targety, 0,1, stateCursorColor );
   }

   void drawImageAlt( byte *texdata, int targetx, int targety, int offsetx, int offsety, int width, int height )
   {

   }

   void drawImageFloat( float targetx, float targety, float angsin, float angcos, int imageIndex, bool useExtColor )
   {
      dm.drawImage( imageIndex, targetx, targety, angsin, angcos, useExtColor ? stateExtColor : stateColor );
   }

   void resetImages( )
   {
      dm.resetImages();
   }

   void setColor( ColorAlpha color )
   {
      stateColor = color;
   }

   void setExtColor( ColorAlpha color )
   {
      stateExtColor = color;
   }

   void setCursorColor( ColorAlpha color )
   {
      stateCursorColor = color;
   }

   void setLayer( uint32 layerIndex )
   {
      stateLayer = layerIndex;
   }
}
