public import IMPORT_STATIC "ecere"

#include "gl123es.h"

import "GraphicalElement"
import "DrawingManager"

public class TIManager : DrawingManager
{
   int width, height;

   LWFontManager fontManager;
   LWDrawManager drawManager;

   void prepareDraw(Presentation presentation)
   {
      float transform[2] = { originOffset.x, originOffset.y };
      drawManager.ready(width, height);
      if(glCaps_vao) glBindVertexArray(defaultVAO);
      presentation.prepareDraw(renderFlags, this, transform);
   }

   void draw()
   {
      drawManager.flushImages();
      glEnableVertexAttribArray(GLBufferContents::vertex);
      if(glCaps_vao) glBindVertexArray(0);
   }

   void addTextCommand(const String text, GEFont font, float opacity, Alignment2D alignment, float * transform)
   {
      LWFMFont fmFont = fontManager.getFont(font);
      if(fmFont)
      {
         ColorAlpha color { (byte)(opacity * (font ? font.opacity : 1.0f) * 255), font ? font.color : black };
         ColorAlpha outlineColor { (byte)(opacity * (font ? font.outline.opacity : 1.0f) * 255), font ? font.outline.color : white };
         int paddingWidth = Max(2, (int)(1+(font ? font.outline.size : 0)));
         LWFMHorizontalAlignment hAlign = (LWFMHorizontalAlignment)alignment.horzAlign;
         LWFMVerticalAlignment vAlign = alignment.vertAlign == top ? top : alignment.vertAlign == middle ? middle : bottom ;

         fontManager.setState(fmFont, (font ? font.size : 12) * 96 / 72, { hAlign, vAlign }, 0, paddingWidth);
         fontManager.setColor(color);
         fontManager.setOutlineColor(outlineColor);

         fontManager.drawTextf(transform[0], transform[1], text, 0);
      }
   }

   void addImageCommand(void * image, float w, float h, float opacity, ColorAlpha color, float * transform)
   {
      float x = transform[0], y = transform[1];
      if(x + w >= 0 && y + h >= 0 && x < width && y < height)
      {
         ColorAlpha opacityColor {(byte)(opacity * 255), color};
         drawManager.drawImage(image, x, y, w, h, 0, 1, opacityColor, 0);
      }
   }
}

#include "fontmanager.h"
#include "fontrenderer.h"
#include "imgdistmap.h"
#include "drawmanager.h"

#include <math.h>

enum LWFMHorizontalAlignment { left, center, right };
enum LWFMVerticalAlignment { baseline, top, middle, bottom = 4 };

/// FONT MANAGER /////////////////////////////////////
class LWFMTextAlignment : uint16
{
public:
   LWFMHorizontalAlignment horzAlignment:2;
   LWFMVerticalAlignment vertAlignment:4;
};

class LWFMFont : struct
{
   LWFontManager fm;
   public fmFont * font;

   float outlineRadius;
   float outlineAlphaFactor;
   float outlineIntensityFactor;

   static void ::outlineProcessGlyphImage( byte *image, int width, int height, int bytesperpixel, int bytesperline, int processIndex, int paddingwidth, LWFMFont font )
   {
     int x, y;
     byte *src, *dst, *dstrow;
     float intensityfactor, alphafactor, range, alpha, intensity, rangeinv, rangebase;
     float *distancemap, *dmap;

     distancemap = new float[width * height];

     src = &image[0];
     imgDistMapBuild( distancemap, src, width, height, bytesperpixel, bytesperline );

     alphafactor = font.outlineAlphaFactor; //2.0f;
     intensityfactor = font.outlineIntensityFactor; // 0.2f;
     range = (float)font.outlineRadius;
     rangeinv = 1.0f / range;

     dmap = distancemap;
     dst = &image[0];
     for( y = 0 ; y < height ; y++ )
     {
       dstrow = dst;
       for( x = 0 ; x < width ; x++ )
       {
         rangebase = ( range - dmap[ x ] ) * rangeinv;
         alpha = alphafactor * rangebase;
         intensity = fmaxf( (float)dstrow[0] * (1.0f/255.0f), intensityfactor * rangebase );
         /* Alpha channel */
         dstrow[0] = (unsigned char)roundf( fmaxf( 0.0f, fminf( 255.0f, alpha * 255.0f ) ) );
         /* Intensity channel */
         dstrow[1] = (unsigned char)roundf( fmaxf( 0.0f, fminf( 255.0f, intensity * 255.0f ) ) );
         dstrow += bytesperpixel;
       }
       dst += bytesperline;
       dmap += width;
     }
     delete distancemap;
   }

   void setOutline(float intensityFactor, float alphaFactor, float radius)
   {
      outlineIntensityFactor = intensityFactor;
      outlineAlphaFactor = alphaFactor;
      outlineRadius = radius;
      fmSetFontImageProcessing(fm.fm, font, outlineProcessGlyphImage, this);
   }
}

// 2 callbacks for LWFontManager
static define TEST_FONT_ATLAS_SIZE_MAXHEIGHT = 4096;

/*
// This is handled in our LWFM::outlineProcessGlyphImage()
static void testFontProcessGlyphImage( unsigned char *image, int width, int height, int bytesperpixel, int bytesperline, int processindex, int paddingwidth, void *opaquecontext)
{
  int x, y;
  unsigned char *src, *dst, *dstrow;
  float intensityfactor, alphafactor, range, alpha, intensity, rangeinv, rangebase;
  float *distancemap, *dmap;

  distancemap = malloc( width * height * sizeof(float) );

  src = &image[0];
  imgDistMapBuild( distancemap, src, width, height, bytesperpixel, bytesperline );

  alphafactor = 2.0f;
  intensityfactor = 0.2f;
  range = (float)TEST_FONT_HALO_RADIUS;
  rangeinv = 1.0f / range;

  dmap = distancemap;
  dst = &image[0];
  for( y = 0 ; y < height ; y++ )
  {
    dstrow = dst;
    for( x = 0 ; x < width ; x++ )
    {
      rangebase = ( range - dmap[ x ] ) * rangeinv;
      alpha = alphafactor * rangebase;
      intensity = fmaxf( (float)dstrow[0] * (1.0/255.0f), intensityfactor * rangebase );
      // Alpha channel
      dstrow[0] = (unsigned char)roundf( fmaxf( 0.0f, fminf( 255.0f, alpha * 255.0f ) ) );
      // Intensity channel
      dstrow[1] = (unsigned char)roundf( fmaxf( 0.0f, fminf( 255.0f, intensity * 255.0f ) ) );
      dstrow += bytesperpixel;
    }
    dst += bytesperline;
    dmap += width;
  }

  free( distancemap );
}
*/

struct LWFontKey
{
   const String face;
   float size;
   FontFlags flags;
   float outlineSize;
};

Map<LWFontKey, LWFMFont> loadedFonts { };

public class TmpFaceInfo : struct
{
public:
   String fileName;
   bool fakeItalic;
   int fontID;
}

class LWFontManager
{
   fmManager * fm;

   // TOCHECK: Will we need user flexibility to override this?
   void ::fontAtlasFullCallback( fmManager * fm, LWFontManager fontManager )
   {
      int width, height, newheight;

      fontManager.getAtlasSize(&width, &height);
      if( height < TEST_FONT_ATLAS_SIZE_MAXHEIGHT )
      {
         newheight = height << 1;
         fontManager.expandAtlas(width, newheight);
      }
      else
         fontManager.resetAtlas(width, TEST_FONT_ATLAS_SIZE_MAXHEIGHT);
   }

   bool create( int width, int height, int channelCount, int channelIndex, LWFontManagerRenderer renderer)
   {
      fm = fmCreateManager(width, height, channelCount, channelIndex, &renderer.fr, renderer.dm.dm);
      if(fm)
         fmSetAtlasFullCallback( fm, fontAtlasFullCallback, this );
      return fm != null;
   }

   ~LWFontManager()
   {
      fmDestroyManager(fm);
   }

   LWFMFont addFont(const String path, int glyphPaddingWidth )
   {
      fmFont * font = fmAddFont(fm, path, glyphPaddingWidth);
      if(font)
         return LWFMFont { fm = this, font = font };
      return null;
   }

   LWFMFont getFont(GEFont font)
   {
      LWFMFont result = null;
      bool freeFont = false;
      LWFontKey key;

      #define DEFAULT_FACE "DejaVu Sans"

      if(!font) font = { DEFAULT_FACE, 12 }, freeFont = true;
      key = { font.face ? font.face : DEFAULT_FACE, font.size, { bold = font.bold, underline = font.underline, italic = font.italic }, font.outline.size };

      result = loadedFonts[key];

      if(!result)
      {
         // TOCHECK: Shall we drop this 'fade' parameter for an intensity factor instead? Use font.outline.color.a for alpha ?
         float intensityFactor = 1.0f / (0.2f + font.outline.size);
         float alphaFactor = 1.0f / (0.2f + 0.2f /*font.outline.fade*/);
         int paddingWidth = Max(2, (int)(1+font.outline.size));
         Array<FaceInfo> infos = ResolveFont(key.face, key.size, key.flags);
                                                          // Until 'fileName' access is fixed in libecere
         const String fileName = infos && infos.count ? ((TmpFaceInfo)infos[0]).fileName : null;
         //bool fakeItalic = infos[0].fakeItalic;
         if(!fileName)
         {
            key.face = DEFAULT_FACE;
            result = loadedFonts[key];
            if(result)
               return result;

            fileName =
#if defined(__LUMIN__)
               "data/"
#endif
               "DejaVuSans.ttf";
         }
         result = addFont(fileName, paddingWidth);
         if(result && font.outline.size)
            result.setOutline(intensityFactor, alphaFactor, font.outline.size);
         if(result)
         {
            // incref result; // TODO: Should this be a regular class for memory management?
            loadedFonts[key] = result;
         }
         else
            PrintLn("Error loading font ", font.face);
      }
      if(freeFont) delete font;
      return result;
   }

   void getAtlasSize(int *width, int *height)
   {
      fmGetAtlasSize(fm, width, height);
   }

   int expandAtlas(int width, int height)
   {
      return fmExpandAtlas(fm, width, height);
   }

   int resetAtlas(int width, int height)
   {
      return fmResetAtlas(fm, width, height);
   }

   void flushUpdate()
   {
      fmFlushUpdate(fm);
   }

   void setState(LWFMFont font, float size, LWFMTextAlignment alignment, int processIndex, int paddingWidth)
   {
      fmSetState(fm, font.font, (int)size, alignment, processIndex, paddingWidth);
   }

   void setColor(ColorAlpha color)
   {
      frFontSetColor( fmGetRendererHandle(fm),
         ColorAlpha { color.a, { color.color.b, color.color.g, color.color.r } } );
   }

   void setOutlineColor(ColorAlpha outlineColor)
   {
      frFontSetExtColor( fmGetRendererHandle(fm),
         ColorAlpha { outlineColor.a, { outlineColor.color.b, outlineColor.color.g, outlineColor.color.r } } );
   }

   void drawText(int x, int y, const String text, int length)
   {
      fmDrawText(fm, x, y, text, length);
   }

   void drawTextf(float x, float y, const String text, int length)
   {
      fmDrawTextFloat(fm, x, y, text, length);
   }
}

public class LWDrawManagerFlags : uint32 { public: bool prehistoricOpenGL:1; }

class LWDrawManager
{
   void * dm;

   LWDrawManager() { dm = new0 dmContext[1]; }
   ~LWDrawManager() { delete dm; }

   bool init(LWDrawManagerFlags flags)
   {
      bool success = (bool)dmInit(dm, flags);
      if(success)
         dmSetFlushCallback(dm, (void *)flush, this); //Need to modify this, flush currently doesn't refer to anything when this is called
      return success;
   }

   void * ::defineImage1(uint glTex, int width, int height)
   {
      tmTexture * texture = new0 tmTexture[1];
      dmImage * image = new0 dmImage[1];
      texture->width = width;
      texture->height = height;
      texture->widthinv = 1.0f/width;
      texture->heightinv = 1.0f/height;
      texture->gltex = glTex;

      dmDefineImage(image, texture, 0, 0, texture->width, texture->height, 1, DM_PROGRAM_NORMAL, 0 );
      return image;
   }

   /*
   #define DM_PROGRAM_NORMAL (0)
   #define DM_PROGRAM_ALPHABLEND (1)
   #define DM_PROGRAM_ALPHABLEND_INTENSITY (2)
   #define DM_PROGRAM_ALPHABLEND_INTENSITY_EXTCOLOR (3)
   */
   void * ::defineImage(uint glTex, int offsetX, int offsetY, int width, int height, int blendFlag, int programIndex, int layerIndex )
   {
      tmTexture * texture = new0 tmTexture[1];
      dmImage * image = new0 dmImage[1];

      texture->width = width;
      texture->height = height;
      texture->widthinv = 1.0f/width;
      texture->heightinv = 1.0f/height;
      texture->gltex = glTex;

      dmDefineImage(image, texture, offsetX, offsetY, width, height, blendFlag, programIndex, layerIndex);
      return image;
   }

   void drawImage( void * image, float offsetx, float offsety, float sizex, float sizey, float angsin, float angcos, ColorAlpha color, ColorAlpha extColor )
   {
      dmDrawImageFloatExtColor(dm, image, offsetx, offsety, sizex, sizey, angsin, angcos,
         ColorAlpha { color.a, { color.color.b, color.color.g, color.color.r } },
         ColorAlpha { extColor.a, { extColor.color.b, extColor.color.g, extColor.color.r } });
   }

   void ready( int viewportwidth, int viewportheight )
   {
      dmReady(dm, viewportwidth, viewportheight);
   }

   void flushImages( )
   {
      dmFlushImages( dm );
   }

   void end()
   {
      dmEnd(dm);
   }

   virtual void flush();
}

class LWFontManagerRenderer
{
   fmRenderer fr;
   LWDrawManager dm;
   property LWDrawManager drawManager { set { dm = value; } };
}

class LWFontRenderer : LWFontManagerRenderer
{
   fr = frFontRenderer;
}
