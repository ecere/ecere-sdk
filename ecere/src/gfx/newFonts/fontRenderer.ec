/* *****************************************************************************
 * Original Version Copyright (c) 2007-2014 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
import "Color"

#include <math.h>

#if defined(_GLES)
   #define ES1_1
#else
   #define SHADERS
#endif

#if !defined(__ANDROID__) && !defined(__EMSCRIPTEN__) && !defined(__ODROID__)
#  if defined(SHADERS)
//#     include "gl_core_3_3.h"
#     include "gl_compat_4_4.h"     // FIXME: no glPushAttrib() in core profile
#  else
#     include "gl_compat_4_4.h"
#  endif
#endif

#include "cc.h"
#include "mm.h"

import "fontManager"
import "textureManager"
import "drawManager"

#define DM_ENABLE_EXT_COLOR (1)

public class FontRenderer : FontManagerRenderer
{
   DrawManager dm;
   Texture texture;
   int textureWidth, textureHeight;
   int channelcount;

   int imagecount;
   int imageAlloc;
   DMImage *imageList;

   ColorAlpha stateColor;
   ColorAlpha stateExtColor;
   ColorAlpha stateCursorColor;
   uint32 stateLayer;

   imageAlloc = 512;
   imageList = new DMImage[imageAlloc];

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
      delete imageList;
   }

   bool createTexture( int width, int height )
   {
      IMGImage image
      {
         format = { width = width, height = height, type = grayScale, bytesPerPixel = channelcount, bytesPerLine = width };
      };

      delete texture;

      texture = { 0 << DM_TEXTURE_ORDER_SHIFT };
      texture.build(image, 0, 0.0, 0 );

      textureWidth = width;
      textureHeight = height;
      return true;
   }

   int resizeTexture( int width, int height )
   {
     int retval;

     // Reuse create to resize too.
     delete imageList;
     imagecount = 0;
     imageAlloc = 512;
     imageList = new DMImage[imageAlloc];

     retval = createTexture( width, height );
     return retval;
   }

   void updateTexture( int *rect, const byte* data )
   {
     if(texture)
     {
        int glformat = GL_RED;
        int w = rect[2] - rect[0];
        int h = rect[3] - rect[1];

        if( channelcount == 1 )
          glformat = GL_RED;
        else if( channelcount == 2 )
          glformat = GL_RG;
        else if( channelcount == 3 )
          glformat = GL_RGB;
        else if( channelcount == 4 )
          glformat = GL_RGBA;

        // FIXME: no glPushAttrib() in core profile
//#ifndef SHADERS
        glPushClientAttrib( GL_CLIENT_PIXEL_STORE_BIT );
        glPushAttrib( GL_TEXTURE_BIT );
//#endif
        glBindTexture( GL_TEXTURE_2D, texture.glTex );
        glPixelStorei( GL_UNPACK_ALIGNMENT, 1 );
        glPixelStorei( GL_UNPACK_ROW_LENGTH, textureWidth );
        glPixelStorei( GL_UNPACK_SKIP_PIXELS, rect[0] );
        glPixelStorei( GL_UNPACK_SKIP_ROWS, rect[1] );
        glTexSubImage2D( GL_TEXTURE_2D, 0, rect[0], rect[1], w, h, glformat, GL_UNSIGNED_BYTE, data );
//#ifndef SHADERS
        glPopAttrib();
        glPopClientAttrib();
//#endif

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
      int imageindex = imagecount;
      DMImage *image;

      if( imagecount >= imageAlloc )
      {
         imageAlloc <<= 1;
         imageList = renew imageList DMImage[imageAlloc];
      }
      imagecount++;

      image = &imageList[ imageindex ];
   #if 1
      image->defineImage( texture, offsetx, offsety, width, height, 1, DM_PROGRAM_ALPHABLEND_INTENSITY_EXTCOLOR, stateLayer );
   #elif 1
      image->defineImage( texture, offsetx, offsety, width, height, 1, DM_PROGRAM_ALPHABLEND_INTENSITY, stateLayer );
   #elif 1
      image->defineImage( texture, offsetx, offsety, width, height, 1, DM_PROGRAM_ALPHABLEND, stateLayer );
   #else
      image->defineImage( texture, offsetx, offsety, width, height, 1, DM_PROGRAM_NORMAL, stateLayer );
   #endif

      return imageindex;
   }

   void drawImage( int targetx, int targety, int imageindex )
   {
      DMImage *image = &imageList[ imageindex ];
   #if DM_ENABLE_EXT_COLOR
      dm.drawImageExtColor( image, targetx, targety, image->sizex, image->sizey, stateColor, stateExtColor );
   #else
      dm.drawImage( image, targetx, targety, image->sizex, image->sizey, stateColor );
   #endif
   }

   void drawImageCursor( int targetx, int targety, int imageindex )
   {
      DMImage *image = &imageList[ imageindex ];
   #if DM_ENABLE_EXT_COLOR
      dm.drawImageExtColor( image, targetx, targety, image->sizex, image->sizey, stateCursorColor, stateExtColor );
   #else
      dm.drawImage( image, targetx, targety, image->sizex, image->sizey, stateCursorColor );
   #endif
   }

   void drawImageAlt( byte *texdata, int targetx, int targety, int offsetx, int offsety, int width, int height )
   {

   }

   void drawImageFloat( float targetx, float targety, float angsin, float angcos, int imageindex )
   {
      DMImage *image = &imageList[ imageindex ];

      /* 0.2588190451, 0.965925826289 */

   #if DM_ENABLE_EXT_COLOR
      dm.drawImageFloatExtColor( image, targetx, targety, (float)image->sizex, (float)image->sizey, angsin, angcos, stateColor, stateExtColor );
   #else
      dm.drawImageFloat( image, targetx, targety, (float)image->sizex, (float)image->sizey, angsin, angcos, stateColor );
   #endif
   }

   void resetImages( )
   {
      imagecount = 0;
   }

   void setColor( ColorAlpha color )
   {
      stateColor = { color.a, { color.color.b, color.color.g, color.color.r } };
   }

   void setExtColor( ColorAlpha color )
   {
      stateExtColor = { color.a, { color.color.b, color.color.g, color.color.r } };
   }

   void setCursorColor( ColorAlpha color )
   {
      stateCursorColor = { color.a, { color.color.b, color.color.g, color.color.r } };
   }

   void setLayer( uint32 layerIndex )
   {
      stateLayer = layerIndex;
   }
}
