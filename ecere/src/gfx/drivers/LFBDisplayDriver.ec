namespace gfx::drivers;

#if (defined(ECERE_VANILLA) || defined(ECERE_ONEDRIVER)) && defined(__WIN32__)
#define ECERE_NOTRUETYPE
#endif

#undef __BLOCKS__
#define uint _uint
#if !defined(ECERE_NOTRUETYPE)
#include <ft2build.h>
#include FT_FREETYPE_H
#include FT_TRUETYPE_TABLES_H
#include <freetype/ttunpat.h>
#define property  _property
#include "harfbuzz.h"
#undef property

#if defined(__WIN32__)
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#elif !defined(ECERE_NOTRUETYPE) && !defined(ECERE_NOFONTCONFIG)
#define set _set
#include <fontconfig/fontconfig.h>
static FcConfig * fcConfig;
#undef set
#endif

#endif
#undef uint

#ifdef __MSC__
#pragma warning(disable:4244)
#pragma warning(disable:4018)
#endif

import "File"
import "Display"

public define LIGHTSHIFT = 5;
public define LIGHTSTEPS = 1<<LIGHTSHIFT;

/*#ifndef ECERE_VANILLA
import "lfbRGBLookup"
static bool rgbLookupSet = true;
#else*/
/*static */byte defaultRGBLookup[32768];
/*static */bool rgbLookupSet = false;
//#endif

import "lfbBlit"
import "lfbConvert"

#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA) && defined(__WIN32__)
import "OpenGLDisplayDriver"
import "Direct3D8DisplayDriver"
import "Direct3D9DisplayDriver"
#endif

#if !defined(ECERE_NOTRUETYPE)

#define MAX_FONT_LINK_ENTRIES   10

static HB_Script theCurrentScript;

static unichar UTF16GetChar(uint16 *string, int * nw)
{
   unichar ch;
   if(HB_IsHighSurrogate(string[0]) && HB_IsLowSurrogate(string[1]))
   {
      ch = HB_SurrogateToUcs4(string[0], string[1]);
      *nw = 2;
   }
   else
   {
      ch = *string;
      *nw = 1;
   }
   return ch;
}

static HB_Bool hb_stringToGlyphs(HB_Font font, uint16 * string, uint length, HB_Glyph *glyphs, uint *numGlyphs, HB_Bool rightToLeft)
{
   FT_Face face = ((FontEntry)font->userData).face;
   int glyph_pos = 0;
   int c, nw;

   if (length > *numGlyphs)
      return 0;

   for (c = 0; c < length; c += nw)
   {
      unichar ch = UTF16GetChar(string + c, &nw);
      glyphs[glyph_pos++] = FT_Get_Char_Index(face, ch);
   }
   *numGlyphs = glyph_pos;
   return 1;
}

static void hb_getAdvances(HB_Font font, const HB_Glyph * glyphs, uint numGlyphs, HB_Fixed *advances, int flags)
{
   FontEntry entry = font->userData;
   Font glFont = entry.font;
   int c;
   uint lastPack = 0;
   GlyphPack pack = glFont.asciiPack;
   int fontEntryNum;
   for(fontEntryNum = 0; fontEntryNum < MAX_FONT_LINK_ENTRIES; fontEntryNum++)
   {
      if(glFont.fontEntries[fontEntryNum] == entry)
         break;
   }

   for(c = 0; c < numGlyphs; c++)
   {
      GlyphInfo * glyph;
      uint glyphNo = glyphs[c] | 0x80000000 | (theCurrentScript << 24);
      uint packNo = glyphNo & 0xFFFFFF80;
      if(packNo != lastPack)
      {
         pack = (GlyphPack)glFont.glyphPacks.Find((uintptr)packNo);
         if(!pack)
         {
            glFont.glyphPacks.Add((pack = GlyphPack { key = (uintptr)packNo }));
            pack.Render(glFont, fontEntryNum, glFont.displaySystem);
            pack.bitmap.alphaBlend = true;
         }
         lastPack = packNo;
      }
      glyph = &pack.glyphs[glyphNo & 0x7F];
      advances[c] = glyph->ax;
   }
}

static HB_Bool hb_canRender(HB_Font font, uint16 * string, uint length)
{
   FT_Face face = ((FontEntry)font->userData).face;
   int c, nw;

   for (c = 0; c < length; c += nw)
   {
      unichar ch = UTF16GetChar(string + c, &nw);
      if(!FT_Get_Char_Index(face, ch))
         return 0;
   }
   return 1;
}

static HB_Error hb_getSFntTable(void *font, HB_Tag tableTag, HB_Byte *buffer, HB_UInt *length)
{
    FT_Face face = (FT_Face)font;
    FT_ULong ftlen = *length;
    FT_Error error = 0;

    if (!FT_IS_SFNT(face))
        return HB_Err_Invalid_Argument;

    error = FT_Load_Sfnt_Table(face, tableTag, 0, buffer, &ftlen);
    *length = ftlen;
    return (HB_Error)error;
}

static HB_Error hb_getPointInOutline(HB_Font font, HB_Glyph glyph, int flags, hb_uint32 point, HB_Fixed *xpos, HB_Fixed *ypos, hb_uint32 *nPoints)
{
    HB_Error error = HB_Err_Ok;
    FT_Face face = (FT_Face)font->userData;

    int load_flags = (flags & HB_ShaperFlag_UseDesignMetrics) ? FT_LOAD_NO_HINTING : FT_LOAD_DEFAULT;

    if ((error = (HB_Error)FT_Load_Glyph(face, glyph, load_flags)))
        return error;

    if (face->glyph->format != ft_glyph_format_outline)
        return (HB_Error)HB_Err_Invalid_SubTable;

    *nPoints = face->glyph->outline.n_points;
    if (!(*nPoints))
        return HB_Err_Ok;

    if (point > *nPoints)
        return (HB_Error)HB_Err_Invalid_SubTable;

    *xpos = face->glyph->outline.points[point].x;
    *ypos = face->glyph->outline.points[point].y;

    return HB_Err_Ok;
}

static void hb_getGlyphMetrics(HB_Font font, HB_Glyph theGlyph, HB_GlyphMetrics *metrics)
{
   FontEntry entry = font->userData;
   Font glFont = entry.font;
   uint lastPack = 0;
   GlyphPack pack = glFont.asciiPack;
   int fontEntryNum;
   for(fontEntryNum = 0; fontEntryNum < MAX_FONT_LINK_ENTRIES; fontEntryNum++)
   {
      if(glFont.fontEntries[fontEntryNum] == entry)
         break;
   }
   {
      GlyphInfo * glyph;
      uint glyphNo = theGlyph | 0x80000000 | (theCurrentScript << 24);
      uint packNo = glyphNo & 0xFFFFFF80;
      if(packNo != lastPack)
      {
         pack = (GlyphPack)glFont.glyphPacks.Find((uintptr)packNo);
         if(!pack)
         {
            pack = { key = (uintptr)packNo };
            glFont.glyphPacks.Add(pack);
            pack.Render(glFont, fontEntryNum, glFont.displaySystem);
            pack.bitmap.alphaBlend = true;
         }
         lastPack = packNo;
      }
      glyph = &pack.glyphs[glyphNo & 0x7F];

      metrics->x = glyph->ax;
      metrics->y = 0;
      metrics->width = glyph->w;
      metrics->height = glyph->h;
      metrics->xOffset = glyph->bx;
      metrics->yOffset = glyph->by;
   }
}

static HB_Fixed hb_getFontMetric(HB_Font font, HB_FontMetric metric)
{
   FontEntry entry = font->userData;
   FT_Face face = entry.face;

   // Note that we aren't scanning the VDMX table which we probably would in
   // an ideal world.
   if(metric == HB_FontAscent)
      return face->ascender;
   return 0;
}

static HB_FontClass hb_fontClass =
{
   hb_stringToGlyphs, hb_getAdvances, hb_canRender,
   hb_getPointInOutline, hb_getGlyphMetrics, hb_getFontMetric
};

static uint FT_stream_load(FT_Stream stream, uint offset, byte * buffer, uint count)
{
    File f = stream->descriptor.pointer;
    f.Seek(offset, start);
    return count ? f.Read(buffer, 1, count) : 0;
}

static void FT_stream_close(FT_Stream stream)
{
   File f = stream->descriptor.pointer;
   delete f;
   delete stream;
}

static FT_Library ftLibrary;
static int numFonts;
#undef CompareString
static BinaryTree loadedFonts
{
   CompareKey = (void *)BinaryTree::CompareString 
};

class FontEntry : BTNode
{
   FT_Face face;
   HB_FontRec hbFont;
   HB_Face hbFace;

   int used;
   byte * buffer;
   
   //If we don't save the FT_Stream before sacrificing it to FreeType, the garbage collector (if one is used) will destroy it prematurely
   FT_Stream stream;
   Font font;
   float scale;

   ~FontEntry()
   {
      char * fileName = (char *)key;
      delete fileName;
      delete buffer;
      if(hbFace)
         HB_FreeFace(hbFace);
      if(face)
      {
         FT_Done_Face(face);
         numFonts--;
         if(!numFonts)
         {
            FT_Done_FreeType(ftLibrary);
            ftLibrary = null;
         }
      }
   }
}

static float FaceSetCharSize(FT_Face face, float size)
{
   float scale = 1;
   if(FT_Set_Char_Size(face, (int)(size * 64), (int)(size * 64), 96, 96))
   {
      if(face->num_fixed_sizes)
      {
         int c;
         int bestDiff = MAXINT, best = 0;
         FT_Bitmap_Size * sizes = face->available_sizes;
         int wishedHeight = (int)(size * 96 / 72);
         for(c = 0; c < face->num_fixed_sizes; c++)
         {
            int diff = abs(sizes[c].height - wishedHeight);
            if(diff < bestDiff)
            {
               best = c;
               bestDiff = diff;
            }
         }
         FT_Set_Pixel_Sizes(face, sizes[best].width, sizes[best].height);

         if(!face->ascender)
            face->ascender = sizes[best].height;
         scale = (float)wishedHeight / sizes[best].height;
      }
   }
   return scale;
}

#endif

struct GlyphInfo
{
   int ax, ay;
   int x, y;
   int w, h;
   int left, top;
   int bx, by;
   int glyphNo;
   float scale;
};

class GlyphPack : BTNode
{
   GlyphInfo glyphs[256];
   Bitmap bitmap { };

   void Render(Font font, int startFontEntry, DisplaySystem displaySystem)
   {
#if !defined(ECERE_NOTRUETYPE)
      unichar c;
      int maxWidth, maxHeight;
      int cellWidth, cellHeight;
      int width, height;
      FontEntry fontEntry = null;
      FT_Face faces[128];
      float scales[128];
      bool isGlyph = (uint)key & 0x80000000;
      int curScript = ((uint)key & 0x7F000000) >> 24;
      unichar testChar = 0;
      /*
      if(isGlyph)
      {
         switch(curScript)
         {
            case HB_Script_Arabic:
               testChar = 0x621;
               // printf("\nRendering arabic in %s (%d)\n", font.faceName, key & 0xFFFFFF);
               break;
            case HB_Script_Devanagari:
               testChar = 0x905; 
               break;
            case 60: testChar =　'あ'; break;
            case 61: testChar =　0x3400; break;
         }
      }
      */
      /*
      FT_GlyphSlot slot;
      FT_Matrix matrix;
      FT_Vector pen = { 0, 0 };
      if(font.fakeItalic)
      {
         matrix.xx = (FT_Fixed)( 1.0 * 0x10000L );
         matrix.xy = (FT_Fixed)( 0.3 * 0x10000L );
         matrix.yx = (FT_Fixed)( 0.0 * 0x10000L );
         matrix.yy = (FT_Fixed)( 1.0 * 0x10000L );
         FT_Set_Transform( fontEntry.face, &matrix, &pen );
      }
      FT_Set_Char_Size( fontEntry.face, (int)(font.size * 64), (int)(font.size * 64), 96, 96);
      */

      maxWidth = 0; 
      maxHeight = 0;

      for(c = 0; c < MAX_FONT_LINK_ENTRIES; c++)
      {
         fontEntry = font.fontEntries[c];
         if(fontEntry)
         {
            FT_Matrix matrix;
            FT_Vector pen = { 0, 0 };
            
            if(font.fakeItalic)
            {
               matrix.xx = (FT_Fixed)( 1.0 * 0x10000L );
               matrix.xy = (FT_Fixed)( 0.3 * 0x10000L );
               matrix.yx = (FT_Fixed)( 0.0 * 0x10000L );
               matrix.yy = (FT_Fixed)( 1.0 * 0x10000L );
               FT_Set_Transform(fontEntry.face, &matrix, &pen);
            }
            //FT_Set_Char_Size(fontEntry.face, (int)(font.size * 64), (int)(font.size * 64), 96, 96);
            fontEntry.scale = FaceSetCharSize(fontEntry.face, font.size);
            if(!c)
            {
               if(!fontEntry.face->units_per_EM)
                  font.ascent = (int)((double)fontEntry.face->ascender);
               else
                  font.ascent = (int)((double)fontEntry.face->ascender * fontEntry.face->size->metrics.y_ppem / fontEntry.face->units_per_EM);
            }

            fontEntry.hbFont.x_ppem  = fontEntry.face->size->metrics.x_ppem;
            fontEntry.hbFont.y_ppem  = fontEntry.face->size->metrics.y_ppem;
            fontEntry.hbFont.x_scale = fontEntry.face->size->metrics.x_scale;
            fontEntry.hbFont.y_scale = fontEntry.face->size->metrics.y_scale;
         }
      }

      fontEntry = null;
      for(c = 0; c < 128; c++)
      {
         int entry = 0;
         if(isGlyph)
         {
            uint glyph = ((uint)key | c) & 0xFFFFFF;
            for(entry = startFontEntry; entry < MAX_FONT_LINK_ENTRIES; entry++)
            {
               fontEntry = font.fontEntries[entry];
               if(fontEntry && (FT_Get_Char_Index(fontEntry.face, testChar) || !testChar || entry == MAX_FONT_LINK_ENTRIES-1 || !font.fontEntries[entry+1]))
               {
                  if(!FT_Load_Glyph(fontEntry.face, glyph, FT_LOAD_DEFAULT /*FT_LOAD_NO_HINTING*/) || entry == MAX_FONT_LINK_ENTRIES-1 || !font.fontEntries[entry+1])
                  {
                     //printf("%s: Accepted entry %d ", font.faceName, entry);
                     break;
                  }
               }
            }
         }
         else
         {
            for(entry = startFontEntry; ; entry++)
            {
               uint glyph;
               fontEntry = font.fontEntries[entry];
               if((glyph = FT_Get_Char_Index(fontEntry.face, ((uint)key | c) & 0xFFFFFF)) || entry == MAX_FONT_LINK_ENTRIES-1 || !font.fontEntries[entry+1])
               {
                  if(!FT_Load_Glyph(fontEntry.face, glyph, FT_LOAD_DEFAULT /*FT_LOAD_NO_HINTING*/) || entry == MAX_FONT_LINK_ENTRIES-1 || !font.fontEntries[entry+1])
                     break;
               }
            }
         }
         scales[c] = fontEntry.scale;
         faces[c] = fontEntry.face;
         maxWidth = Max(maxWidth, ((faces[c]->glyph->metrics.width + 64 + (64 - (faces[c]->glyph->metrics.width & 0x3F))) >> 6));
         maxHeight = Max(maxHeight, ((faces[c]->glyph->metrics.height + 64 + (64 - (faces[c]->glyph->metrics.height & 0x3F))) >> 6));
         //maxHeight = Max(maxHeight, ((faces[c]->glyph->metrics.height) >> 6));
      }
      cellWidth = maxWidth;
      cellHeight = maxHeight;

      width = pow2i(maxWidth * 16);
      height = pow2i(maxHeight * 8);

      if(bitmap.Allocate(null, width, height, 0, pixelFormatAlpha, false /*true*/))
      {
         Bitmap bitmap = this.bitmap;

         bitmap.transparent = true;

         for(c = 0; c < 128; c++)
         {
            FT_Int i, j, p, q;
            FT_Int xMax, yMax;
            int sx = (c % 16) * cellWidth;
            int sy = (c / 16) * cellHeight;
            int x, y;
            byte * picture = (byte *)bitmap.picture;
            GlyphInfo * glyph = &glyphs[c];
            FT_GlyphSlot slot = faces[c]->glyph;
            double em_size = 1.0 * faces[c]->units_per_EM;
            //double x_scale = faces[c]->size->metrics.x_ppem / em_size;
            double y_scale = em_size ? (faces[c]->size->metrics.y_ppem / em_size) : 1;
            double ascender = faces[c]->ascender * y_scale;
            int glyphNo = isGlyph ? (((uint)key | c) & 0x00FFFFFF) : FT_Get_Char_Index(faces[c], (uint)key | c);

            FT_Load_Glyph(faces[c], glyphNo, /*FT_LOAD_DEFAULT | FT_LOAD_FORCE_AUTOHINT*/ FT_LOAD_DEFAULT /*FT_LOAD_NO_HINTING*/); // FT_LOAD_RENDER // FT_LOAD_NO_HINTING
            
            FT_Render_Glyph(slot, FT_RENDER_MODE_NORMAL);

            x = sx;
            y = sy;
            //printf("%d, %d\n", maxHeight, faces[c]->size->metrics.height >> 6);
            
            glyph->left = slot->bitmap_left;
            // glyph->top = ((64 + (64 - faces[c]->glyph->metrics.height & 0x3F)) >> 6) + (int)(ascender - slot->bitmap_top) + font.height - (faces[c]->size->metrics.height >> 6);
            // glyph->top = (int)(ascender - slot->bitmap_top) + 2 * (font.height - maxHeight);
            //glyph->top = (int)(ascender - slot->bitmap_top) + 2 * ((((faces[c]->size->metrics.height + 64 + (64 - faces[c]->size->metrics.height & 0x3F)) >> 6)) - font.height);
            //glyph->top = (int)(ascender - slot->bitmap_top) + (font.height - (faces[c]->size->metrics.height >> 6));

            //glyph->top = (int)(ascender + (font.height *64 - /*faces[0]->size->metrics.height - */faces[c]->size->metrics.height) / 64.0  + 0.5) - slot->bitmap_top;
            //glyph->top = (int)(ascender + (font.height *64 - /*faces[0]->size->metrics.height - */faces[c]->size->metrics.height) / 64.0  + 0.5) - slot->bitmap_top;

            //glyph->top = (int)((ascender - slot->bitmap_top) + (font.height * 64 - maxHeight * 64 + faces[c]->glyph->metrics.height - faces[c]->glyph->metrics.height) / 64);

            //glyph->top = (int)(ascender - slot->bitmap_top); // + ((faces[c]->size->metrics.height >> 6) - (faces[0]->size->metrics.height >> 6)) + (font.height - (faces[c]->size->metrics.height >> 6));
            //glyph->top = (int)(ascender - slot->bitmap_top); // + ((faces[c]->size->metrics.height >> 6) - (faces[0]->size->metrics.height >> 6)) + (font.height - (faces[c]->size->metrics.height >> 6));
            
            //glyph->top = (int)(ascender - slot->bitmap_top);// + (font.height - maxHeight);
            glyph->top = (int)(ascender - slot->bitmap_top) + (font.height - (faces[c]->size->metrics.height >> 6)) / 2;

            // printf("[char: %d] mode: %d, width: %d, height: %d, pitch: %d\n", key + c, slot->bitmap.pixel_mode, slot->bitmap.width, slot->bitmap.rows, slot->bitmap.pitch);
            xMax = x + slot->bitmap.width;
            yMax = y + slot->bitmap.rows;

            {
               int total = 0;
               int numPixels = 0;
               int max;
               if(slot->bitmap.pixel_mode != FT_PIXEL_MODE_MONO)
               {
                  for(j = y, q = 0; j<yMax; j++)
                  {
                     for(p = 0, i = x; i<xMax; i++)
                     {
                        byte value = ((byte *)slot->bitmap.buffer)[q + p++];
                        if(value > 32)
                        {
                           total += value;
                           numPixels++;
                        }
                     }
                     q += slot->bitmap.pitch;
                  }
               }
               max = numPixels ? (total / numPixels) : 1;

               for(j = y, q = 0; j<yMax; j++)
               {
                  int bit = 0x80;
                  for(p = 0, i = x; i<xMax; i++)
                  {
                     if(slot->bitmap.pixel_mode == FT_PIXEL_MODE_MONO)
                     {
                        picture[j * bitmap.stride + i] = (slot->bitmap.buffer[q + p] & bit) ? 255 : 0;
                        bit >>= 1;
                        if(!bit) { bit = 0x80; p++; }                     
                     }
                     else
                     {
                        byte value = ((byte *)slot->bitmap.buffer)[q + p++];
                        picture[j * bitmap.stride + i] = /*(max < 192) ? Min(255, value * 192/max) :*/ value;
                     }
                  }
                  q += slot->bitmap.pitch;
               }
            }
            glyph->x = sx;
            glyph->y = sy;
            glyph->w = slot->bitmap.width;
            glyph->h = slot->bitmap.rows;
            glyph->glyphNo = glyphNo;
            glyph->bx = faces[c]->glyph->metrics.horiBearingX;
            glyph->by = faces[c]->glyph->metrics.horiBearingY;
            glyph->scale = scales[c];

            glyph->ax = slot->advance.x;
            glyph->ay = slot->advance.y + (64 - slot->advance.y % 64);
         }
         #if 0
         {
            int c;
            char fileName[256];
            static int fid = 0;
            for(c = 0; c<256; c++)
               bitmap.palette[c] = ColorAlpha { 255, { (byte)c,(byte)c,(byte)c } };
            bitmap.pixelFormat = pixelFormat8;
            
            /*
            //strcpy(fileName, faceName);
            if(flags)
               strcat(fileName, "Bold");
            */
            sprintf(fileName, "font%d", fid++);
            ChangeExtension(fileName, "pcx", fileName);

            bitmap.Save(fileName, null, 0);
            bitmap.pixelFormat = pixelFormatAlpha;
         }
         #endif

         if(displaySystem && displaySystem.pixelFormat != pixelFormat4) // TODO: Add none PixelFormat
         {
            displaySystem.Lock();
#if defined(__WIN32__)
            // Is this check still required?
            if(displaySystem.driver == class(OpenGLDisplayDriver) ||
               displaySystem.driver == class(Direct3D8DisplayDriver) ||
               displaySystem.driver == class(Direct3D9DisplayDriver))
#endif
               bitmap.MakeDD(displaySystem);
            displaySystem.Unlock();
         }
      }
#endif
   }
}

#if !defined(ECERE_NOTRUETYPE)
static HB_ShaperItem shaper_item;

static uint * shaping(FontEntry entry, uint16 * string, int len, HB_Script script, int *numGlyphs, bool * rightToLeft)
{
   static uint maxGlyphs = 0;
   HB_Glyph * glyphs = shaper_item.glyphs;

   shaper_item.kerning_applied = 0;
   shaper_item.string = string;
   shaper_item.stringLength = len;
   shaper_item.item.script = script;
   shaper_item.item.pos = 0;
   shaper_item.item.length = shaper_item.stringLength;
   if(script == HB_Script_Arabic || script == HB_Script_Hebrew || script == HB_Script_Thaana || script == HB_Script_Syriac)
      shaper_item.item.bidiLevel = 1;
   else
      shaper_item.item.bidiLevel = 0;
   shaper_item.shaperFlags = 0;
   shaper_item.font = &entry.hbFont;
   shaper_item.face = entry.hbFace;
   shaper_item.num_glyphs = shaper_item.item.length;
   shaper_item.glyphIndicesPresent = 0;
   shaper_item.initialGlyphCount = 0;
   shaper_item.num_glyphs = 0;   
   shaper_item.glyphs = null;   

   while(!HB_ShapeItem(&shaper_item))
   {
      if(shaper_item.num_glyphs > maxGlyphs)
      {
         maxGlyphs = shaper_item.num_glyphs;                                                                                                            
         glyphs = shaper_item.glyphs = renew0 glyphs HB_Glyph[maxGlyphs];
         shaper_item.attributes   = renew0 shaper_item.attributes HB_GlyphAttributes[maxGlyphs];
         shaper_item.advances     = renew0 shaper_item.advances HB_Fixed[maxGlyphs];
         shaper_item.offsets      = renew0 shaper_item.offsets HB_FixedPoint[maxGlyphs];
         shaper_item.log_clusters = renew0 shaper_item.log_clusters unsigned short[maxGlyphs];
      }
      else
      {
         shaper_item.glyphs = glyphs;
         shaper_item.num_glyphs = maxGlyphs;
      } 
  }

   *numGlyphs = shaper_item.num_glyphs;
   *rightToLeft = shaper_item.item.bidiLevel % 2;
   return shaper_item.glyphs;
}

/*
   delete shaper_item.glyphs;
   delete shaper_item.attributes;
   delete shaper_item.advances;
   delete shaper_item.offsets;
   delete shaper_item.log_clusters;
*/
#endif

public class Font : struct
{
   BinaryTree glyphPacks { };
   GlyphPack asciiPack { };
#if !defined(ECERE_NOTRUETYPE)
   FontEntry fontEntries[MAX_FONT_LINK_ENTRIES];
#endif
   float size;
   bool fakeItalic;
   int height;
   FontFlags flags;
   char faceName[512];
   DisplaySystem displaySystem;
   int ascent;
   float scale;

   ~Font()
   {
#if !defined(ECERE_NOTRUETYPE)
      GlyphPack pack;
      while((pack = (GlyphPack)glyphPacks.root))
      {
         glyphPacks.Remove(pack);
         delete pack;
      }
#endif
   }
};

public class LFBDisplay : struct
{
public:
   Bitmap bitmap { };
   byte rgbLookup[32768];
   byte lightTable[256][LIGHTSTEPS];
   OldList updateBoxes;
   int x,y;
   bool selfManaged;
   void (* displayCallback)(Display display, Box updateBox);
};

public class LFBSystem : struct
{
public:
   int format;
   ColorAlpha * palette;
   byte rgbLookup[32768];

   LFBSystem()
   {
      if(!rgbLookupSet)
      {
         int c, r, g, b;
         ColorAlpha * palette = GetDefaultPalette();
         for(c = 16; c < 232; c++)
         {
            Color555 color = palette[c].color;
            for(r = Max(0, color.r - 2); r <= Min(31, color.r + 4); r++)
               for(g = Max(0, color.g - 2); g <= Min(31, color.g + 4); g++)
                  for(b = Max(0, color.b - 2); b <= Min(31, color.b + 4); b++)
                     defaultRGBLookup[r * 32 * 32 + g * 32 + b] = (byte)c;
         }
         for(c = 232; c < 246; c++)
         {
            Color555 color = palette[c].color;
            defaultRGBLookup[color] = (byte)c;
         }
         /*
         for(c = 246; c < 256; c++)
         {
            Color555 color = palette[c].color;
            defaultRGBLookup[color] = (byte)c;
         }
         for(c = 0; c < 16; c++)
         {
            Color555 color = palette[c].color;
            defaultRGBLookup[color] = (byte)c;
         }*/
         /*
         for(c = 0; c<32768; c++)
         {
            Color color = (Color)(Color555)c;
            defaultRGBLookup[c] = 16 + (color.r * 5 / 255) * 36 + (color.g * 5 / 255) * 6 + (color.b * 5 / 255);
            // defaultRGBLookup[c] = (byte)BestColorMatch(palette, 0, 255, (Color)(Color555)c);
         }
         */
         rgbLookupSet = true;
      }
   }
};

public class LFBSurface : struct
{
public:
   // For compatibility with 3D drivers as well
   Font font;
   bool opaqueText;
   int xOffset;
   bool writingText;

   Bitmap bitmap;

   // Drawing attributes
   uint foreground, background;
   ColorAlpha foregroundRgb;
   uint16 stipple;
   byte drawingChar;
   byte * paletteShades;
   bool clearing;
};

/*
static int CompareHit(GLHitRecord * recordA, GLHitRecord * recordB, const void * nothing)
{
   if(recordA->zMin > recordB->zMin)
      return  1;
   else if(recordA->zMin < recordB->zMin)
      return -1;
   else if(recordA > recordB)
      return 1;
   else if(recordA < recordB)
      return -1;
   else
      return  0;
}
*/

#if defined(__WIN32__) && !defined(ECERE_NOTRUETYPE)
struct FontData
{
   char fileName[MAX_FILENAME];
   FontFlags flags;
   bool forgive;
};

static int CALLBACK MyFontProc(ENUMLOGFONTEX * font, NEWTEXTMETRICEX *lpntme, int fontType, LPARAM lParam)
{
   //if(fontType == TRUETYPE_FONTTYPE)
   {
      FontData * fontData = (FontData *) lParam;
      char * fileName = (char *)lParam;
      HKEY key;
      int weight = (fontData->flags.bold) ? FW_BOLD : FW_NORMAL;
      int italic = (fontData->flags.italic) ? 1 : 0;
      if((fontData->forgive || weight == font->elfLogFont.lfWeight) && italic == (font->elfLogFont.lfItalic != 0))
      {
         if(!RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Fonts",0,KEY_READ,&key) ||
            !RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Fonts",0,KEY_READ,&key))
         {  
            int value = 0;
            while(true)
            {
               char entryName[1024];
               char fontFileName[1024];
               uint32 type;
               int size = 1024;
               int sizeFileName = 1024;
               char * occurence;
               if(RegEnumValue(key, value++, entryName, (PDWORD)&size, null, (PDWORD)&type, (LPBYTE)fontFileName, (PDWORD)&sizeFileName) != ERROR_SUCCESS)
                  break;
               if((occurence = SearchString((char *)entryName, 0, (char *)font->elfFullName, false, false)))
               {
                  int c;
                  for(c = (int)(occurence - entryName) - 1; c >= 0; c--)
                  {
                     char ch = entryName[c];
                     if(ch == '&') { c = -1; break; }
                     else if(ch != ' ') break;
                  }
                  if(c >= 0) continue;
                  for(c = (int)(occurence - entryName) + strlen((char *)font->elfFullName); ; c++)
                  {
                     char ch = entryName[c];
                     if(ch == 0 || ch == '&' || ch == '(') { c = -1; break; }
                     else if(ch != ' ') break;
                  }

                  if(atoi(entryName + c))
                     c = -1;
                  if(c >= 0) continue;

                  strcpy(fileName, fontFileName);
                  RegCloseKey(key);
                  return 0;
               }               
            }
            RegCloseKey(key);
            return 1;
         }
      }
   }
   return 1;   
}
#endif

static int utf16BufferSize = 0;
static uint16 * utf16 = null;

public class LFBDisplayDriver : DisplayDriver
{
   class_property(name) = "LFB";

   bool CreateDisplaySystem(DisplaySystem displaySystem)
   {
      displaySystem.flags.memBackBuffer = true;
      // displaySystem.pixelFormat = pixelFormat888;
      return true;
   }

   void DestroyDisplaySystem(DisplaySystem displaySystem)
   {
   }

   void FreeBitmap(DisplaySystem displaySystem, Bitmap bitmap)
   {
      delete bitmap.picture;
      if(bitmap.allocatePalette)
         delete bitmap.palette;
   }

   bool AllocateBitmap(DisplaySystem displaySystem, Bitmap bitmap, int width, int height, int stride, PixelFormat format, bool allocatePalette)
   {
      bool result = false;
      if(!stride)
      {
         switch(GetColorDepthShifts(format))
         {
            case 0: stride = (width + 3) & 0xFFFFFFFC; break;
            case 1: stride = (width + 1) & 0xFFFFFFFE; break;
            case 2: stride = width;                    break;
         }
      }
      bitmap.stride = stride;   
      bitmap.width = width;
      bitmap.height = height;
      bitmap.size = (uint32) stride * (uint32)height;
      bitmap.sizeBytes = bitmap.size << GetColorDepthShifts(format);
      bitmap.pixelFormat = format;
      bitmap.transparent = false;
   /*
      surface.box.left = surface.box.top = 0;
      surface.box.right = width - 1;
      surface.box.bottom = height - 1;
   */
      bitmap.picture = new0 byte[bitmap.sizeBytes];
      if(bitmap.picture)
      {
         bitmap.allocatePalette = allocatePalette;
         if(allocatePalette)
         {
            bitmap.palette = new ColorAlpha[256];
            if(bitmap.palette)
            {
               CopyBytesBy4(bitmap.palette, GetDefaultPalette(), 256);
               result = true;
            }
         }
         else
         {
            bitmap.palette = GetDefaultPalette();
            result = true;
         }
      }
      if(!result)
         FreeBitmap(displaySystem, bitmap);
      return result;
   }

   bool ConvertBitmap(DisplaySystem displaySystem, Bitmap src, PixelFormat format, ColorAlpha * palette)
   {  
      bool result = false;
      LFBSystem lfbSystem = displaySystem ? displaySystem.driverData : null;

      if(src)
      {
         if((src.pixelFormat == format) && (format != pixelFormat8 || !palette))
         {
            if(src.transparent && src.pixelFormat == pixelFormat888)
            {
               /*
               DWORD c;
               DWORD * picture = (DWORD *)src.picture;
               
               for(c = 0; c<src.size; c++, picture++)
               {
                  if(*picture & 0xFFFFFF)
                     *picture =  *picture | 0xFF000000;
                  else
                     *picture = *picture & 0xFFFFFF;
               }
               */
            }
            result = true;
         }
         else
         {
            Bitmap bitmap { };
            if(bitmap.Allocate(null, src.width, src.height, 0, format, false))
            {
               if(format == pixelFormat8)
               {
                  if(palette)
                     bitmap.palette = palette;
                  else if(lfbSystem && lfbSystem.palette)
                     bitmap.palette = lfbSystem.palette;
                  else
                     bitmap.palette = src.palette;
               }

               if(converters_table[src.pixelFormat][bitmap.pixelFormat])
               {
                  converters_table[src.pixelFormat][bitmap.pixelFormat](lfbSystem, src, bitmap);
                  bitmap.transparent = src.transparent;
                  bitmap.alphaBlend = src.alphaBlend && format != pixelFormat8;
                  delete src.picture;
                  if(src.palette != bitmap.palette)
                  {
                     if(src.allocatePalette)
                        delete src.palette;
                     src.allocatePalette = false;
                  }
                  src.picture = bitmap.picture;
                  src.palette = bitmap.palette;
                  src.stride = bitmap.stride;
                  src.size = bitmap.size;
                  src.pixelFormat = bitmap.pixelFormat;

                  result = true;
               }

               bitmap.palette = null;
               bitmap.picture = null;
            }
            delete bitmap;
         }
      }
      return result;
   }

   void DestroyDisplay(Display display)
   {
      LFBDisplay lfbDisplay = display.driverData;
      delete lfbDisplay.bitmap.palette;
   }

   bool CreateDisplay(Display display)
   {
      bool result = false;
      LFBDisplay lfbDisplay = display.driverData;
      if(!lfbDisplay)
      {
         lfbDisplay = display.driverData = LFBDisplay { };
         lfbDisplay.selfManaged = true;
         lfbDisplay.bitmap.pixelFormat = pixelFormatRGBA;
      }

      if((lfbDisplay.bitmap.palette = new ColorAlpha[256]))
      {
         CopyBytesBy4(lfbDisplay.bitmap.palette, GetDefaultPalette(), 256);
         result = true;
      }
      return result;
   }

   bool DisplaySize(Display display, int width, int height)
   {
      LFBDisplay lfbDisplay = display.driverData;
      //display.width = width;
      //display.height = height;
      lfbDisplay.bitmap.width = width;
      lfbDisplay.bitmap.height = height;
      /*
      lfbDisplay.updateBox.left = display.width;
      lfbDisplay.updateBox.top = display.height;
      lfbDisplay.updateBox.right = 0;
      lfbDisplay.updateBox.bottom = 0;
      */

      if(lfbDisplay.selfManaged)
      {
         lfbDisplay.bitmap.picture = (byte *)renew lfbDisplay.bitmap.picture int[width * height];
         lfbDisplay.bitmap.stride = width;
      }
      lfbDisplay.bitmap.size = lfbDisplay.bitmap.stride * lfbDisplay.bitmap.height;
      return true;
   }

   void DisplayPosition(Display display, int x, int y)
   {
      LFBDisplay lfbDisplay = display.driverData;
      lfbDisplay.x = x;
      lfbDisplay.y = y;
   }

   void SetPalette(Display display, ColorAlpha * palette, bool colorMatch)
   {
      LFBDisplay lfbDisplay = display.driverData;
      if(colorMatch)
      {
         int c;

         if(!palette)
         {
            LFBSystem lfbSystem = display.displaySystem ? display.displaySystem.driverData : null;
            palette = lfbSystem ? lfbSystem.palette : GetDefaultPalette();
            CopyBytes(lfbDisplay.rgbLookup, defaultRGBLookup, 32768);
         }
         else
            for(c = 0; c<32768; c++)
               lfbDisplay.rgbLookup[c] = (byte)BestColorMatch(palette, 1, 255, (Color)(Color555)c);

         for(c=0; c<256; c++)
         {
            int i;
            for(i=0; i<LIGHTSTEPS; i++)
            {
               lfbDisplay.lightTable[c][i] = lfbDisplay.rgbLookup[(uint16)(Color555) Color {
                          (byte)(((uint16)palette[c].color.r * i) >> LIGHTSHIFT),
                          (byte)(((uint16)palette[c].color.g * i) >> LIGHTSHIFT),
                          (byte)(((uint16)palette[c].color.b * i) >> LIGHTSHIFT) }];
            }
         }
      }
      if(lfbDisplay.bitmap.palette)
         CopyBytesBy4(lfbDisplay.bitmap.palette, palette ? palette : GetDefaultPalette(), 256);
   }

   void Update(Display display, Box updateBox)
   {
      LFBDisplay lfbDisplay = display.driverData;
      if(lfbDisplay.displayCallback)
      {
         if(updateBox == null)
         {
            Box box { 0,0, display.width,display.height };
            lfbDisplay.displayCallback(display, box);
         }
         else
            lfbDisplay.displayCallback(display, updateBox);
      }
   }

   bool MakeDDBitmap(DisplaySystem displaySystem, Bitmap bitmap, bool mipMaps)
   {
      if(bitmap.pixelFormat != pixelFormatAlpha)
      {
         if(!ConvertBitmap(displaySystem, bitmap, /*bitmap.alphaBlend ? pixelFormat888 : */displaySystem.pixelFormat, null))
         {
            FreeBitmap(displaySystem, bitmap);
            return false;
         }
      }
      return true;
   }

   void ReleaseSurface(Display display, Surface surface)
   {
      LFBSurface lfbSurface = surface.driverData;
      delete lfbSurface;
      surface.driverData = null;
   }

   bool GetSurface(Display display, Surface surface, int x, int y, Box clip)
   {
      LFBDisplay lfbDisplay = display.driverData;
      LFBSurface lfbSurface = surface.driverData;
      if(!lfbSurface)
      {
         lfbSurface = surface.driverData = LFBSurface { };
      }

      lfbSurface.bitmap = lfbDisplay.bitmap;

      surface.offset.x = x;
      surface.offset.y = y;
      surface.box = clip;
      if(lfbDisplay.bitmap.pixelFormat == pixelFormatText)
      {
         surface.offset.x /= textCellW;
         surface.offset.y /= textCellH;
         surface.box.left /= textCellW;
         surface.box.top /= textCellH;
         surface.box.right /= textCellW;
         surface.box.bottom /= textCellH;
      }

      /*
      lfbDisplay.updateBox.left = Min(x + clip.left, lfbDisplay.updateBox.left);
      lfbDisplay.updateBox.top = Min(y + clip.top, lfbDisplay.updateBox.top);
      lfbDisplay.updateBox.right = Max(x + clip.right, lfbDisplay.updateBox.right);
      lfbDisplay.updateBox.bottom = Max(y + clip.bottom, lfbDisplay.updateBox.bottom);
      */

      surface.unclippedBox = surface.box;
      lfbSurface.drawingChar = 219;
      return true;
   }

   bool GetBitmapSurface(DisplaySystem displaySystem, Surface surface, Bitmap bitmap, int x,int y, Box clip)
   {
      bool result = false;
      LFBSurface lfbSurface = surface.driverData;
      if(lfbSurface || (surface.driverData = lfbSurface = LFBSurface { }))
      {
         lfbSurface.bitmap = bitmap;

         surface.offset.x = x;
         surface.offset.y = y;
         surface.box = clip;
         if(bitmap.pixelFormat == pixelFormatText)
         {
            surface.offset.x /= textCellW;
            surface.offset.y /= textCellH;
            surface.box.left /= textCellW;
            surface.box.top /= textCellH;
            surface.box.right /= textCellW;
            surface.box.bottom /= textCellH;
         }

         surface.unclippedBox = *&surface.box;
         lfbSurface.drawingChar = 219;

         result = true;
      }
      return result;
   }

   void Clip(Display display, Surface surface, Box clip)
   {
      LFBSurface lfbSurface = surface.driverData;
      if(clip != null)
      {
         Box box = clip;

         if(lfbSurface.bitmap.pixelFormat == pixelFormatText)
         {
            box.left /= textCellW;
            box.top /= textCellH;
            box.right /= textCellW;
            box.bottom /= textCellH;
         }
         box.Clip(surface.unclippedBox);
         surface.box = box;
      }
      else
         surface.box = surface.unclippedBox;
   }

   void SetForeground(Display display, Surface surface, ColorAlpha color)
   {
      LFBDisplay lfbDisplay = display ? display.driverData : null;
      LFBSurface lfbSurface = surface.driverData;
      uint index;
      if(display) color = color /*& 0xFFFFFF*/;
      lfbSurface.foregroundRgb = color;

      if(lfbSurface.font && lfbDisplay)
      {
         index = lfbDisplay.rgbLookup[(uint16)(Color555)lfbSurface.foregroundRgb];
         lfbSurface.paletteShades = lfbDisplay.lightTable[index];
      }

      switch(lfbSurface.bitmap.pixelFormat)
      {
         case pixelFormat8:
            if(display)
               lfbSurface.foreground = lfbDisplay.rgbLookup[(uint16)(Color555)color];
            else
               lfbSurface.foreground = BestColorMatch(lfbSurface.bitmap.palette,0,255,color);
            break;
         case pixelFormat444:  lfbSurface.foreground = (Color444)color; break;
         case pixelFormat555:  lfbSurface.foreground = (Color555)color; break;
         case pixelFormat565:  lfbSurface.foreground = (Color565)color; break;
         case pixelFormat888:  lfbSurface.foreground = color; break;
         case pixelFormatRGBA: lfbSurface.foreground = (ColorRGBA)color; break;
         case pixelFormatText: 
            if(display)
               lfbSurface.foreground = BestColorMatch(lfbDisplay.bitmap.palette,0,15,color) << 8;
            else
               lfbSurface.foreground = BestColorMatch(lfbSurface.bitmap.palette,0,15,color) << 8;
            break;
      }
   }

   void SetBackground(Display display, Surface surface, ColorAlpha color)
   {
      LFBDisplay lfbDisplay = display ? display.driverData : null;
      LFBSurface lfbSurface = surface.driverData;
      color = color /*& 0xFFFFFF*/;
      switch(lfbSurface.bitmap.pixelFormat)
      {
         case pixelFormat8:
            if(display)
               lfbSurface.background = lfbDisplay.rgbLookup[(uint16)(Color555)color];
            else
               lfbSurface.background = BestColorMatch(lfbSurface.bitmap.palette,0,255,color);
            break;
         case pixelFormat444:  lfbSurface.background = (Color444)color; break;
         case pixelFormat555:  lfbSurface.background = (Color555)color; break;
         case pixelFormat565:  lfbSurface.background = (Color565)color; break;
         case pixelFormat888:  lfbSurface.background = color; break;
         case pixelFormatRGBA: lfbSurface.background = (ColorRGBA)color; break;
         case pixelFormatText: 
            if(display)
               lfbSurface.background = BestColorMatch(lfbDisplay.bitmap.palette,0,15,color) << 12;
            else
               lfbSurface.background = BestColorMatch(lfbSurface.bitmap.palette,0,15,color) << 12;
            break;
      }
   }

   ColorAlpha GetPixel(Display display, Surface surface, int x, int y)
   {
      LFBSurface lfbSurface = surface.driverData;
      if(lfbSurface.bitmap.pixelFormat == pixelFormatText)
      {
         x /= textCellW;
         y /= textCellH;
      }
      if((x <= surface.box.right) && (y <= surface.box.bottom) && (x >= surface.box.left) && (y >= surface.box.top))
      {
         x += surface.offset.x;
         y += surface.offset.y;
         if(lfbSurface.bitmap.picture)
         {
            switch(lfbSurface.bitmap.pixelFormat)
            {
               case pixelFormatText:
               case pixelFormat8:
                  if(!lfbSurface.bitmap.palette) return 0;
                  return lfbSurface.bitmap.palette[((byte *)lfbSurface.bitmap.picture)[(uint) y * lfbSurface.bitmap.stride + x]];
               case pixelFormat444:  return ((Color444 *)lfbSurface.bitmap.picture)[(uint) y * lfbSurface.bitmap.stride + x];
               case pixelFormat555:  return ((Color555 *)lfbSurface.bitmap.picture)[(uint) y * lfbSurface.bitmap.stride + x];
               case pixelFormat565:  return ((Color565 *)lfbSurface.bitmap.picture)[(uint) y * lfbSurface.bitmap.stride + x];
               case pixelFormat888:  return ((ColorAlpha *)lfbSurface.bitmap.picture)[(uint) y * lfbSurface.bitmap.stride+x];
            }
         }
      }
      return 0;
   }

   void PutPixel(Display display, Surface surface,int x,int y)
   {
      LFBSurface lfbSurface = surface.driverData;
      if(lfbSurface.bitmap.pixelFormat == pixelFormatText)
      {
         x /= textCellW;
         y /= textCellH;
      }
      if((x <= surface.box.right) && (y <= surface.box.bottom) && (x >= surface.box.left) && (y >= surface.box.top))
      {
         x += surface.offset.x;
         y += surface.offset.y;
         if(lfbSurface.bitmap.picture)
         {
            switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
            {
               case 0:
                  ((byte *)lfbSurface.bitmap.picture)[(uint) y * lfbSurface.bitmap.stride + x] = (byte)lfbSurface.foreground;
                  break;
               case 1:
                  ((uint16 *)lfbSurface.bitmap.picture)[(uint)y * lfbSurface.bitmap.stride + x] = (uint16)lfbSurface.foreground;
                  break;
               case 2:
                  if(((uint32 *)lfbSurface.bitmap.picture)[(uint32) y * lfbSurface.bitmap.stride + x] != (uint32)lfbSurface.foreground)
                     ((uint32 *)lfbSurface.bitmap.picture)[(uint32) y * lfbSurface.bitmap.stride + x] = (uint32)lfbSurface.foreground;
                  break;
            }
         }
      }
   }

   void DrawLine(Display display, Surface surface, int x1, int y1, int x2, int y2)
   {
      LFBSurface lfbSurface = surface.driverData;

      int xd, yd;
      int xu,yu;
      int errorterm;
      uint offset;
      uint color = lfbSurface.foreground;
      uint16 stipple = lfbSurface.stipple ? lfbSurface.stipple : 0xFFFF;
      bool invert = false;
      if(!lfbSurface.bitmap.picture) return;
      if(lfbSurface.bitmap.pixelFormat == pixelFormatText)
      {
         x1 /= textCellW;
         x2 /= textCellW;
         y1 /= textCellH;
         y2 /= textCellH;
         if(surface.textOpacity)
            color |= lfbSurface.background;
         color |= lfbSurface.drawingChar;
      }
      if(y1 == y2)
      {
         if(x1>x2) { int tmp = x2; x2 = x1; x1 = tmp; invert = true; }

         if((y1>surface.box.bottom)||(y1<surface.box.top))return;
         if((x1>surface.box.right)||(x2<surface.box.left))return;
         if(x1<surface.box.left)x1=surface.box.left;
         if(x2>surface.box.right)x2=surface.box.right;

         if(x2 < x1) return;

         offset=(y1+surface.offset.y)*lfbSurface.bitmap.stride+x1+surface.offset.x;
         if(stipple != 0xFFFF)
         {
            int x;
            switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
            {
               case 0:
                  for(x=x1; x<=x2; x++, offset++)
                  {
                     if(stipple & 0x8000)
                        ((byte *)lfbSurface.bitmap.picture)[offset]=(byte)color;
                     if(invert)
                        stipple = ((stipple & 0x7FFF)<<1) | ((stipple & 0x8000)>>15);
                     else
                        stipple = ((stipple & 0xFFFE)>>1) | ((stipple & 0x0001)<<15);
                  }
                  break;
               case 1:
                  for(x=x1; x<=x2; x++, offset++)
                  {
                     if(stipple & 0x8000)
                        ((uint16 *)lfbSurface.bitmap.picture)[offset] = (uint16)color;
                     if(invert)
                        stipple = ((stipple & 0x7FFF)<<1) | ((stipple & 0x8000)>>15);
                     else
                        stipple = ((stipple & 0xFFFE)>>1) | ((stipple & 0x0001)<<15);
                  }
                  break;
               case 2:
                  for(x=x1; x<=x2; x++, offset++)
                  {
                     if(stipple & 0x8000)
                        ((uint32 *)lfbSurface.bitmap.picture)[offset] = color;
                     if(invert)
                        stipple = ((stipple & 0x7FFF)<<1) | ((stipple & 0x8000)>>15);
                     else
                        stipple = ((stipple & 0xFFFE)>>1) | ((stipple & 0x0001)<<15);
                  }
                  break;
            }
         }
         else
         {
            if(lfbSurface.bitmap.pixelFormat != pixelFormatText || surface.textOpacity)
            {
               switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
               {
                  case 0: FillBytes(((byte *)lfbSurface.bitmap.picture)+offset,(byte)color,x2-x1+1); break;
                  case 1: FillBytesBy2(((uint16 *)lfbSurface.bitmap.picture)+offset,(uint16)color,x2-x1+1); break;
                  case 2: FillBytesBy4(((uint32 *)lfbSurface.bitmap.picture)+offset,color,x2-x1+1); break;
               }
            }
            else
            {
               int x;
               for(x = x1; x <= x2; x++, offset++)
               {
                  ((uint16 *)lfbSurface.bitmap.picture)[offset] =
                     (((uint16 *)lfbSurface.bitmap.picture)[offset] & 0xF000) | (uint16)color;
               }
            }
         }
      }
      else if(x1 == x2)
      {
         int y;

         if(y1>y2) { int tmp = y2; y2 = y1; y1 = tmp; invert = true; }

         if((x1>surface.box.right)||(x1<surface.box.left))return;
         if((y1>surface.box.bottom)||(y2<surface.box.top))return;
         if(y1<surface.box.top)y1=surface.box.top;
         if(y2>surface.box.bottom)y2=surface.box.bottom;

         offset=(y1+surface.offset.y)*lfbSurface.bitmap.stride+x1+surface.offset.x;
         switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
         {
            case 0:
               for(y=y1; y<=y2; y++, offset+=lfbSurface.bitmap.stride)
               {
                  if(stipple & 0x8000)
                     ((byte *)lfbSurface.bitmap.picture)[offset]=(byte)color;
                  if(invert)
                     stipple = ((stipple & 0x7FFF)<<1) | ((stipple & 0x8000)>>15);
                  else
                     stipple = ((stipple & 0xFFFE)>>1) | ((stipple & 0x0001)<<15);
               }
               break;
            case 1:
               for(y=y1; y<=y2; y++, offset+=lfbSurface.bitmap.stride)
               {
                  if(stipple & 0x8000)
                  {
                     if(lfbSurface.bitmap.pixelFormat != pixelFormatText || surface.textOpacity)
                        ((uint16 *)lfbSurface.bitmap.picture)[offset]=(uint16)color;
                     else
                     {
                        ((uint16 *)lfbSurface.bitmap.picture)[offset] = 
                           (((uint16 *)lfbSurface.bitmap.picture)[offset] & 0xF000) | (uint16)color;
                     }
                  }
                  if(invert)
                     stipple = ((stipple & 0x7FFF)<<1) | ((stipple & 0x8000)>>15);
                  else
                     stipple = ((stipple & 0xFFFE)>>1) | ((stipple & 0x0001)<<15);
               }
               break;
            case 2:
               if(stipple != 0xFFFF)
               {
                  for(y=y1; y<=y2; y++, offset+=lfbSurface.bitmap.stride)
                  {
                     if(stipple & 0x8000)
                        ((uint32*)lfbSurface.bitmap.picture)[offset]=color;
                     if(invert)
                        stipple = ((stipple & 0x7FFF)<<1) | ((stipple & 0x8000)>>15);
                     else
                        stipple = ((stipple & 0xFFFE)>>1) | ((stipple & 0x0001)<<15);
                  }
               }
               else
               {
                  for(y=y1; y<=y2; y++, offset+=lfbSurface.bitmap.stride)
                     ((uint32*)lfbSurface.bitmap.picture)[offset]=color;
               }
               break;
         }
      }
      else 
      {
         if(x2 >= x1)
         {
            if(x1 < surface.box.left)
            {
               if(x2 < surface.box.left)
                  return;
               y1 += (y2 - y1) * (surface.box.left - x1) / (x2 - x1);
               x1 = surface.box.left;
            }
            if(x2 > surface.box.right)
            {
               if(x1 > surface.box.right)
                  return;
               y2 -= (y2 - y1) * (x2 - surface.box.right) / (x2 - x1);
               x2 = surface.box.right;
            }
            if(y2 >= y1)
            {
               if(y1 < surface.box.top)
               {
                  if(y2 < surface.box.top)
                     return;
                  x1 += (x2 - x1) * (surface.box.top - y1) / (y2 - y1);
                  y1 = surface.box.top;
               }
               if(y2 > surface.box.bottom)
               {
                  if(y1 > surface.box.bottom)
                     return;
                  x2 -= (x2 - x1) * (y2 - surface.box.bottom) / (y2 - y1);
                  y2 = surface.box.bottom;
               }
            }
            else
            {
               if(y1 > surface.box.bottom)
               {
                  if(y2 > surface.box.bottom)
                     return;
                  x1 -= (x1 - x2) * (y1 - surface.box.bottom) / (y1 - y2);
                  y1 = surface.box.bottom;
               }
               if(y2 < surface.box.top)
               {
                  if(y1 < surface.box.top)
                     return;
                  x2 += (x1 - x2) * (surface.box.top - y2) / (y1 - y2);
                  y2 = surface.box.top;
               }
            }
         }
         else
         {
            if(x1 > surface.box.right)
            {
               if(x2 > surface.box.right)
                  return;
               y1 -= (y1 - y2) * (x1 - surface.box.right) / (x1 - x2);
               x1 = surface.box.right;
            }
            if(x2 < surface.box.left)
            {
               if(x1 < surface.box.left)
                  return;
               y2 += (y1 - y2) * (surface.box.left - x2) / (x1 - x2);
               x2 = surface.box.left;
            }
            if(y2 >= y1)
            {
               if(y1 < surface.box.top)
               {
                  if(y2 < surface.box.top)
                     return;
                  x1 += (x2 - x1) * (surface.box.top - y1) / (y2 - y1);
                  y1 = surface.box.top;
               }
               if(y2 > surface.box.bottom)
               {
                  if(y1 > surface.box.bottom)
                     return;
                  x2 -= (x2 - x1) * (y2 - surface.box.bottom) / (y2 - y1);
                  y2 = surface.box.bottom;
               }
            }
            else
            {
               if(y1 > surface.box.bottom)
               {
                  if(y2 > surface.box.bottom)
                     return;
                  x1 -= (x1 - x2) * (y1 - surface.box.bottom) / (y1 - y2);
                  y1 = surface.box.bottom;
               }
               if(y2 < surface.box.top)
               {
                  if(y1 < surface.box.top)
                     return;
                  x2 += (x1 - x2) * (surface.box.top - y2) / (y1 - y2);
                  y2 = surface.box.top;
               }
            }
         }

         xd=x2-x1;
         yd=y2-y1;

         if(xd<0)
         {
            xd=-xd;
            xu=-1;
         }
         else
            xu=1;
         if(yd<0)
         {
            yd=-yd;
            yu=-(int)lfbSurface.bitmap.stride;
         }
         else
            yu=lfbSurface.bitmap.stride;

         offset=(y1+surface.offset.y)*lfbSurface.bitmap.stride+x1+surface.offset.x;
         errorterm=0;

         if(xd>yd)
         {
            int i, length=xd;
            for(i=0; i<=length; i++)
            {
               if(stipple & 0x8000)
                  switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
                  {
                     case 0: ((byte *)lfbSurface.bitmap.picture)[offset]=(byte)color; break;
                     case 1: ((uint16 *)lfbSurface.bitmap.picture)[offset]=(uint16)color; break;
                     case 2: ((uint32*)lfbSurface.bitmap.picture)[offset]=(uint32)color; break;
                  }
               offset+=xu;
               errorterm+=yd;
               if(errorterm>=xd)
               {
                  errorterm-=xd;
                  offset+=yu;
               }
               stipple = ((stipple & 0x7FFF)<<1) | ((stipple & 0x8000)>>15);
            }
         }
         else
         {
            int i, length=yd;
            for(i=0; i<=length; i++)
            {
               if(stipple & 0x8000)
                  switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
                  {
                     case 0: ((byte *)lfbSurface.bitmap.picture)[offset]=(byte)color; break;
                     case 1: ((uint16 *)lfbSurface.bitmap.picture)[offset]=(uint16)color; break;
                     case 2: ((uint32*)lfbSurface.bitmap.picture)[offset]=(uint32)color; break;
                  }
               offset+=yu;
               errorterm+=xd;
               if(errorterm>=yd)
               {
                  errorterm-=yd;
                  offset+=xu;
               }
            }
         }
      }
   }

   void Rectangle(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      DrawLine(display, surface,x1,y1,x2,y1);
      DrawLine(display, surface,x2,y1,x2,y2);
      DrawLine(display, surface,x2,y2,x1,y2);
      DrawLine(display, surface,x1,y2,x1,y1);
   }

   #if !defined(__GNUC__)
   /*
   void memset_32_aligned(void *buf, int val, int dwords)
   {
            // Qword align
            if ((int)(buf) & 4) 
            {
                    *((uint32 *)(buf)) = val;
                    buf = ((uint32 *)(buf))+1;
                    dwords--;
            }
    
            if (dwords > 1) 
            {
                    __asm {
                            cld
                            mov   edi,  buf
                            mov   ecx,  dwords
                            shr       ecx,  1
                            mov   eax,  val
                            movd  mm0,  eax
                            movd  mm1,  eax
                            psllq mm1,  32
                            por   mm0,  mm1
                            align 16
            repeat:
                            movq [edi], mm0
                            add   edi,  8
                            loop  repeat
                            emms
                    };
            }
    
            // Final dword
            if (dwords & 1) *((int*)(buf)) = val;
   }*/

   //#define USE_SSE

/*
   void memset_32_aligned(uint32 *buf, uint32 val, uint32 dwords)
   {
      dwords <<= 2;
   #ifdef USE_SSE
      if(((uint32)buf) & 0x7F)
      {
         for( ; ((uint32)buf) & 0x7F && dwords; buf++)
         {
            *buf = val;
            dwords--;
         }
      }
      if(dwords)
   #endif
      __asm
      {
         mov edi, buf
         mov eax, val
         mov ecx, dwords

         mov edx,ecx
   #ifdef USE_SSE
         shr ecx,7
   #else
         shr ecx,6
   #endif
         mov ebx,ecx
   #ifdef USE_SSE
         shl ebx,7
   #else
         shl ebx,6
   #endif
         sub edx,ebx				; edx holds # of overflow bytes

   #ifdef USE_SSE
   	   mov [edi],eax
   	   mov [edi+4],eax
         mov [edi+8],eax
         mov [edi+12],eax
         movdqa xmm0, [edi]
   #else
         mov [edi],eax
   	   mov [edi+4],eax
         movq mm0, [edi]
   #endif
   	   cmp ecx,0
   	   je doneloop
   setloop:

   #ifdef USE_SSE
         movdqa [edi],xmm0
         movdqa [edi+16],xmm0
         movdqa [edi+32],xmm0
         movdqa [edi+48],xmm0
         movdqa [edi+64],xmm0
         movdqa [edi+80],xmm0
         movdqa [edi+96],xmm0
         movdqa [edi+112],xmm0
         add edi,8*16
   #else
         movq [edi],mm0
         movq [edi+8],mm0
         movq [edi+16],mm0
         movq [edi+24],mm0
         movq [edi+32],mm0
         movq [edi+40],mm0
         movq [edi+48],mm0
         movq [edi+56],mm0
         add edi,8*8
   #endif
         dec ecx
   	   jnz setloop

   doneloop:
   	   mov ecx,edx
   	   shr ecx,2
   	   rep stosd

   	   emms
      };
   }
   void memset_32(void *buf, uint32 val, uint32 dwords)
   {
      int align = 0;
      if ((uint32)(buf) & 3) 
      {
         align = 4;
         dwords--;
         
         if (((uint32)(buf) & 1))
         {
            *(byte *)(buf) = (byte)(val&0xFF); 
            buf = ((byte *)(buf))+1;
            val = ((val& 0xFF) << 24) || ((val& 0xFFFFFF00) >> 8);
            align --;
         }
         if (((uint32)(buf) & 2))
         {
            *(uint16 *)(buf) = (uint16)(val&0xFFFF); 
            buf = ((uint16 *)(buf))+1;
            val = ((val& 0xFFFF) << 16) || ((val& 0xFFFF0000) >> 16);
            align-=2;
         }
      }
      memset_32_aligned(buf,val,dwords);
      if (align)
      {
         if (align == 1)
         {
            *(byte *)(buf) = (byte)(val&0xFF); 
         }
         else
         {
            *(uint16 *)(buf) = (uint16)(val&0xFFFF); 
            if (align & 1) *((byte *)(buf)+2) = (byte)((val>>16)&0xFF); 
         }
      }
   }
   */
   #endif

   void Area(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      LFBSurface lfbSurface = surface.driverData;
      uint32 color = lfbSurface.background;

      if(lfbSurface.bitmap.pixelFormat == pixelFormatText)
      {
         color |= lfbSurface.foreground | lfbSurface.drawingChar;
         x1 /= textCellW;
         x2 /= textCellW;
         y1 /= textCellH;
         y2 /= textCellH;
      }
      if(x1>x2) { int tmp = x2; x2 = x1; x1 = tmp; }

      if(x1<surface.box.left)  x1=surface.box.left;
      if(x2>surface.box.right) x2=surface.box.right;
      if(y1<surface.box.top)   y1=surface.box.top;
      if(y2>surface.box.bottom)  y2=surface.box.bottom;

      if(x2>=x1 && y2>=y1)
      {
         int w,y;
         byte * theOffset;
         
         w = x2-x1+1;
         if(w<1) return;

         x1 += surface.offset.x;
         x2 += surface.offset.x;
         y1 += surface.offset.y;
         y2 += surface.offset.y;
         if(lfbSurface.bitmap.picture)
         {
            if(!surface.writeColor)
            {
               ColorAlpha * picture = (((ColorAlpha *)lfbSurface.bitmap.picture) + y1 * lfbSurface.bitmap.stride + x1);
               for(y = y1; y<= y2; y++)
               {
                  int c;
                  for(c = 0; c < w; c++, picture++)
                     if(!picture->a)
                        picture->a = (byte)((color & 0xFF000000) >> 24);
                  picture += lfbSurface.bitmap.stride - w;
               }
            }
            else
            {
               if(surface.background.a == 255 || lfbSurface.clearing)
               {
                  switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
                  {
                     case 0:
                        theOffset = ((byte *)lfbSurface.bitmap.picture) + y1 * lfbSurface.bitmap.stride + x1;
                        for(y = y1; y<= y2; y++)
                        {
                           FillBytes(theOffset,(byte)color,w);
                           theOffset += lfbSurface.bitmap.stride;
                        }
                        break;
                     case 1:
                        theOffset = (byte *) (((uint16 *)lfbSurface.bitmap.picture) + y1 * lfbSurface.bitmap.stride + x1);
                        for(y = y1; y<= y2; y++)
                        {
                           FillBytesBy2((uint16 *) theOffset,(uint16)color,w);
                           theOffset += lfbSurface.bitmap.stride * sizeof(uint16);
                        }
                        break;
                     case 2:
                        theOffset = (byte *) (((uint32 *)lfbSurface.bitmap.picture) + y1 * lfbSurface.bitmap.stride + x1);
                        for(y = y1; y<= y2; y++)
                        {
         #if defined(__GNUC__)
                           FillBytesBy4((uint32 *) theOffset,color,w);
         #else
                           memset_32((uint32 *) theOffset,color,w);
         #endif
                           theOffset += lfbSurface.bitmap.stride * sizeof(uint32);

                        }
                        /*
                        y = y2-y1+1;
                        {
                           int bla = (lfbSurface.bitmap.stride - w) * sizeof(uint32);
                           //memset_32((uint32 *) theOffset,color,w);
                           /-*_asm
                           {
                              push edi
                              push ecx
                              push eax
                              push ebx
                              push edx

                              mov ebx,bla

                              mov edi,theOffset
                              mov eax,color
                              mov edx,y
                              mov ecx,w
                              
                              start:
                                 push ecx
                                 
                                 rep stosd
                                 add edi,ebx
                                 pop ecx
                                 dec edx                        
                                 jnz start
                              pop edx
                              pop ebx
                              pop eax
                              pop ecx
                              pop edi
                           };
                        break;
                        }*/
                  }
               }
               else
               {
                  switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
                  {
                     case 0:
                        theOffset = ((byte *)lfbSurface.bitmap.picture) + y1 * lfbSurface.bitmap.stride + x1;
                        for(y = y1; y<= y2; y++)
                        {
                           // TODO: IMPLEMENT THIS
                           FillBytes(theOffset,(byte)color,w);
                           theOffset += lfbSurface.bitmap.stride;
                        }
                        break;
                     case 1:
                     {
                        uint16 * dest = (((uint16 *)lfbSurface.bitmap.picture) + y1 * lfbSurface.bitmap.stride + x1);
                        ColorAlpha c = surface.background;
                        int a = c.a;
                        int cr = c.color.r;
                        int cg = c.color.g;
                        int cb = c.color.b;
                        PixelFormat pixelFormat = lfbSurface.bitmap.pixelFormat;

                        for(y = y1; y <= y2; y++)
                        {
                           int c;
                           for(c = 0; c < w; c++, dest++)
                           {                              
                              Color destColor;
                              if(pixelFormat == pixelFormat565)      { destColor = (Color)*(Color565 *)dest; }
                              else if(pixelFormat == pixelFormat555) { destColor = (Color)*(Color555 *)dest; }
                              else if(pixelFormat == pixelFormat444) { destColor = (Color)*(Color444 *)dest; }
                              {
                                 int r = a * cr / 255 + ((255 - a) * destColor.r / 255);
                                 int g = a * cg / 255 + ((255 - a) * destColor.g / 255);
                                 int b = a * cb / 255 + ((255 - a) * destColor.b / 255);

                                 if(r > 255) r = 255;
                                 if(g > 255) g = 255;
                                 if(b > 255) b = 255;

                                 destColor = { (byte)r, (byte)g, (byte)b };

                                 if(pixelFormat == pixelFormat565)      { *dest = (Color565)destColor; }
                                 else if(pixelFormat == pixelFormat555) { *dest = (Color555)destColor; }
                                 else if(pixelFormat == pixelFormat444) { *dest = (Color444)destColor; }
                              }
                           }
                           dest += (lfbSurface.bitmap.stride - w);
                        }
                        break;
                     }
                     case 2:
                     {
                        ColorAlpha * dest = (ColorAlpha *)(((uint32 *)lfbSurface.bitmap.picture) + y1 * lfbSurface.bitmap.stride + x1);
                        AlphaWriteMode alphaWrite = surface.alphaWrite;
                        ColorAlpha c = surface.background;
                        int a = c.a;
                        int cr = c.color.r;
                        int cg = c.color.g;
                        int cb = c.color.b;
                        for(y = y1; y <= y2; y++)
                        {
                           int c;
                           for(c = 0; c < w; c++, dest++)
                           {                              
                              int dr = dest->color.r;
                              int dg = dest->color.g;
                              int db = dest->color.b;
                              int r = a * cr / 255 + ((255 - a) * dr / 255);
                              int g = a * cg / 255 + ((255 - a) * dg / 255);
                              int b = a * cb / 255 + ((255 - a) * db / 255);

                              if(r > 255) r = 255;
                              if(g > 255) g = 255;
                              if(b > 255) b = 255;
                              dest->color = { (byte)r, (byte)g, (byte)b };

                              if(alphaWrite == blend)
                              {
                                 int ca = (int)(a + ((255 - a) * dest->a / 255));
                                 if(ca > 255) ca = 255;
                                 dest->a = (byte)ca;
                              }
                              else if(alphaWrite)
                                 dest->a = (byte)a;
                           }
                           dest += (lfbSurface.bitmap.stride - w);
                        }
                     }
                  }
               }
            }
         }
      }
   }
   void Clear(Display display, Surface surface, ClearType type)
   {
      LFBSurface lfbSurface = surface.driverData;

      lfbSurface.clearing = true;
      if(surface.offset.x == 0 && surface.offset.y == 0 &&
         surface.box.left == 0 && surface.box.top  == 0 &&
         surface.box.right == surface.width-1 &&
         surface.box.bottom  == surface.height-1)
      {
         uint32 color = /*0xFF000000 | */lfbSurface.background;
         if(type != depthBuffer)
         {
            if(lfbSurface.bitmap.stride != surface.width)
               Area(display, surface,surface.box.left,surface.box.top,surface.box.right,surface.box.bottom);
            else
            {
               switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
               {
                  case 0:
                     FillBytes(lfbSurface.bitmap.picture, (byte)color, lfbSurface.bitmap.size);
                     break;
                  case 1: FillBytesBy2((uint16 *)lfbSurface.bitmap.picture, (uint16)color, lfbSurface.bitmap.size); break;
                  case 2: FillBytesBy4((uint32 *)lfbSurface.bitmap.picture, color, lfbSurface.bitmap.size); break;
               }
            }
         }
   /*
         if((flags & CLEAR_Z) && zbuffer)
            FillBytesBy4((DWORD *)zbuffer,0,(sizeof(float)*(DWORD)display.width * display.Height)>>2);
   */
      }
      else
      {
         if(type != depthBuffer)
            Area(display, surface,surface.box.left,surface.box.top,surface.box.right,surface.box.bottom);
   /*
         if((flags & CLEAR_Z))
         {
            int y;
            uint32 w = surface.box.right-surface.box.left+1;
            float * offset = zbuffer + ((surface.box.top +surface.offset.y) * (DWORD)DISPLAY.Width)
                             +   surface.box.left+surface.offset.x;
            for(y = surface.box.top; y<= surface.box.bottom; y++)
            {
               FillBytesBy4((uint32 *) offset,0,(sizeof(float)>>2)*w);
               offset += DISPLAY.Width;
            }
         }
   */
      }
      lfbSurface.clearing = false;
   }

   void Blit(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h)
   {
      LFBSurface lfbSurface = surface.driverData;
      bool flip = false;

      if(surface.box.right < surface.box.left || surface.box.bottom < surface.box.top || !src.picture) return;

      if(w < 0) { w = -w; flip = true; }

      //Clip against the edges of the source
      if(sx<0)
      {
         dx+=-sx;
         w-=-sx;
         sx=0;
      }
      if(sy<0)
      {
         dy+=0-sy;
         h-=0-sy;
         sy=0;
      }
      if(sx+w>src.width-1)
         w-=sx+w-(src.width-1)-1;
      if(sy+h>src.height-1)
         h-=sy+h-(src.height-1)-1;
      //Clip against the edges of the destination
      if(dx<surface.box.left)
      {
         if(!flip) sx+=surface.box.left-dx;
         w-=surface.box.left-dx;
         dx=surface.box.left;
      }
      if(dy<surface.box.top)
      {
         sy+=surface.box.top-dy;
         h-=surface.box.top-dy;
         dy=surface.box.top;
      }
      if((dx+w)>surface.box.right)
      {
         if(flip) sx+=(uint32)(dx+w)-surface.box.right-1;
         w-=((uint32)(dx+w)-surface.box.right-1);
      }
      if((dy+h)>surface.box.bottom)
         h-=((dy+h)-surface.box.bottom-1);
      if((w<=0)||(h<=0))
         return;

      dx += surface.offset.x;
      dy += surface.offset.y;

      if(lfbSurface.bitmap.picture)
      {
         AlphaWriteMode alphaWrite = surface.alphaWrite;
         if(src.alphaBlend && surface.blend)
         {
            int x, y;
            if(src.pixelFormat == pixelFormatAlpha)
            {
               if(lfbSurface.bitmap.pixelFormat == pixelFormat888)
               {
                  ColorAlpha * picture = ((ColorAlpha *)lfbSurface.bitmap.picture) + (lfbSurface.bitmap.stride * dy) + dx;
                  byte * source = ((byte *)src.picture) + (src.stride * sy) + sx;
                  ColorAlpha color = lfbSurface.writingText ? surface.foreground : surface.blitTint;
                  for(y = 0; y < h; y++)
                  {
                     for(x = 0; x < w; x++, picture++, source++)
                     {
                        int a = *source * color.a;
                        ColorAlpha dest = *picture;
                        int r = (a * color.color.r + ((255 * 255 - a) * dest.color.r)) / (255 * 255);
                        int g = (a * color.color.g + ((255 * 255 - a) * dest.color.g)) / (255 * 255);
                        int b = (a * color.color.b + ((255 * 255 - a) * dest.color.b)) / (255 * 255);
                        if(r > 255) r = 255;
                        if(g > 255) g = 255;
                        if(b > 255) b = 255;
                        picture->color = { (byte)r, (byte)g, (byte)b };
                        if(alphaWrite == blend)
                        {
                           int ca = (a * 255 + (255 * 255 - a) * dest.a) / (255 * 255);
                           if(ca > 255) ca = 255;
                           picture->a = (byte)ca;
                        }
                        else if(alphaWrite)
                           picture->a = (byte)(a / 255);
                     }
                     picture += lfbSurface.bitmap.stride - w;
                     source += src.stride - w;
                  }
               }
               else if(lfbSurface.bitmap.pixelFormat == pixelFormat555)
               {
                  Color555 * picture = ((Color555 *)lfbSurface.bitmap.picture) + (lfbSurface.bitmap.stride * dy) + dx;
                  byte * source = ((byte *)src.picture) + (src.stride * sy) + sx;
                  ColorAlpha color = lfbSurface.writingText ? surface.foreground : surface.blitTint;
                  for(y = 0; y < h; y++)
                  {
                     for(x = 0; x < w; x++, picture++, source++)
                     {
                        int a = *source * color.a;
                        Color dest = *picture;
                        int r = (a * color.color.r + ((255 * 255 - a) * dest.r)) / (255 * 255);
                        int g = (a * color.color.g + ((255 * 255 - a) * dest.g)) / (255 * 255);
                        int b = (a * color.color.b + ((255 * 255 - a) * dest.b)) / (255 * 255);
                        if(r > 255) r = 255;
                        if(g > 255) g = 255;
                        if(b > 255) b = 255;
                        *picture = Color { (byte)r, (byte)g, (byte)b };
                     }
                     picture += lfbSurface.bitmap.stride - w;
                     source += src.stride - w;
                  }
               }
               else if(lfbSurface.bitmap.pixelFormat == pixelFormat565)
               {
                  Color565 * picture = ((Color565 *)lfbSurface.bitmap.picture) + (lfbSurface.bitmap.stride * dy) + dx;
                  byte * source = ((byte *)src.picture) + (src.stride * sy) + sx;
                  ColorAlpha color = lfbSurface.writingText ? surface.foreground : surface.blitTint;
                  for(y = 0; y < h; y++)
                  {
                     for(x = 0; x < w; x++, picture++, source++)
                     {
                        int a = *source * color.a;
                        Color dest = *picture;
                        int r = (a * color.color.r + ((255 * 255 - a) * dest.r)) / (255 * 255);
                        int g = (a * color.color.g + ((255 * 255 - a) * dest.g)) / (255 * 255);
                        int b = (a * color.color.b + ((255 * 255 - a) * dest.b)) / (255 * 255);
                        if(r > 255) r = 255;
                        if(g > 255) g = 255;
                        if(b > 255) b = 255;
                        *picture = Color { (byte)r, (byte)g, (byte)b };
                     }
                     picture += lfbSurface.bitmap.stride - w;
                     source += src.stride - w;
                  }
               }
            }
            else
            {
               ColorAlpha * source = ((ColorAlpha *)src.picture) + (src.stride * sy) + sx;
               if(lfbSurface.bitmap.pixelFormat == pixelFormat888)
               {
                  ColorAlpha * picture = ((ColorAlpha *)lfbSurface.bitmap.picture) + (lfbSurface.bitmap.stride * dy) + dx;
                  for(y = 0; y < h; y++)
                  {
                     for(x = 0; x < w; x++, picture++, source++)
                     {
                        ColorAlpha src = *source;
                        ColorAlpha dest = *picture;
                        int r = src.a * src.color.r / 255 + ((255 - src.a) * dest.color.r / 255);
                        int g = src.a * src.color.g / 255 + ((255 - src.a) * dest.color.g / 255);
                        int b = src.a * src.color.b / 255 + ((255 - src.a) * dest.color.b / 255);
                        if(r > 255) r = 255;
                        if(g > 255) g = 255;
                        if(b > 255) b = 255;
                        picture->color = { (byte)r, (byte)g, (byte)b };
                        if(alphaWrite == blend)
                        {
                           int a = src.a + ((255 - src.a) * dest.a / 255);
                           if(a > 255) a = 255;
                           picture->a = (byte)a;
                        }
                        else if(alphaWrite)
                           picture->a = src.a;
                     }
                     picture += lfbSurface.bitmap.stride - w;
                     source += src.stride - w;
                  }
               }
               else if(lfbSurface.bitmap.pixelFormat == pixelFormat565)
               {
                  Color565 * picture = ((Color565 *)lfbSurface.bitmap.picture) + (lfbSurface.bitmap.stride * dy) + dx;
                  for(y = 0; y < h; y++)
                  {
                     for(x = 0; x < w; x++, picture++, source++)
                     {
                        ColorAlpha src = *source;
                        Color565 dest = *picture;
                        int r = src.a * src.color.r * 31 / 255 + ((255 - src.a) * dest.r);
                        int g = src.a * src.color.g * 63 / 255 + ((255 - src.a) * dest.g);
                        int b = src.a * src.color.b * 31 / 255 + ((255 - src.a) * dest.b);
                        if(r > 255 * 31) r = 255 * 31;
                        if(g > 255 * 63) g = 255 * 63;
                        if(b > 255 * 31) b = 255 * 31;
                        *picture = { (byte)(r / 255), (byte)(g / 255), (byte)(b / 255) };
                     }
                     picture += lfbSurface.bitmap.stride - w;
                     source += src.stride - w;
                  }
               }
               else if(lfbSurface.bitmap.pixelFormat == pixelFormat555)
               {
                  Color555 * picture = ((Color555 *)lfbSurface.bitmap.picture) + (lfbSurface.bitmap.stride * dy) + dx;
                  for(y = 0; y < h; y++)
                  {
                     for(x = 0; x < w; x++, picture++, source++)
                     {
                        ColorAlpha psrc = *source;
                        Color555 dest = *picture;
                        int r = psrc.a * psrc.color.r * 31 / 255 + ((255 - psrc.a) * dest.r);
                        int g = psrc.a * psrc.color.g * 31 / 255 + ((255 - psrc.a) * dest.g);
                        int b = psrc.a * psrc.color.b * 31 / 255 + ((255 - psrc.a) * dest.b);
                        if(r > 255 * 31) r = 255 * 31;
                        if(g > 255 * 31) g = 255 * 31;
                        if(b > 255 * 31) b = 255 * 31;
                        *picture = { (byte)(r / 255), (byte)(g / 255), (byte)(b / 255) };
                     }
                     picture += lfbSurface.bitmap.stride - w;
                     source += src.stride - w;
                  }
               }
            }
         }
         else if(src.paletteShades)
            shades_blit_table[lfbSurface.bitmap.pixelFormat][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h);
         else if(src.pixelFormat == lfbSurface.bitmap.pixelFormat)
            blits_table[lfbSurface.bitmap.pixelFormat][src.transparent][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h);
         else if(src.pixelFormat == pixelFormat8)
            blits_8bit_table[lfbSurface.bitmap.pixelFormat][src.transparent][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h);
      }
   }

   bool GrabScreen(Display display, Bitmap bitmap, int x, int y, unsigned int w, unsigned int h)
   {
      bool result = false;
      LFBDisplay lfbDisplay = display.driverData;

      if(bitmap.pixelFormat != lfbDisplay.bitmap.pixelFormat || bitmap.width < w || bitmap.height < h)
      {
         bitmap.Free();
         bitmap.Allocate(null, w,h,w, lfbDisplay.bitmap.pixelFormat, 
            (lfbDisplay.bitmap.pixelFormat == pixelFormat8)?true:false);
      }
      if(bitmap)
      {
         Surface surface = bitmap.GetSurface(0,0,null);
         if(surface)
         {
            Blit(display, surface, lfbDisplay.bitmap, 0,0,x,y,w,h);
            if(bitmap.palette && lfbDisplay.bitmap.pixelFormat == pixelFormat8 && lfbDisplay.bitmap.palette)
               CopyBytesBy4(bitmap.palette, lfbDisplay.bitmap.palette, 256);
            delete surface;
         }
         result = true;
      }
      return result;
   }

   void Stretch(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      LFBSurface lfbSurface = surface.driverData;
      bool flip = false;

      float s2dw,s2dh,d2sw,d2sh;

      if(surface.box.right < surface.box.left || surface.box.bottom < surface.box.top || !src.picture) return;

      if(Sgn(w) != Sgn(sw))
      {
         w = Abs(w);
         sw = Abs(sw);
         flip = true; 
      }

      s2dw=(float)w / sw;
      s2dh=(float)h / sh;
      d2sw=(float)sw / w;
      d2sh=(float)sh / h;

      //Clip against the edges of the source
      if(sx<0)
      {
         dx+=(int)((0-sx) * s2dw);
         w-=(int)((0-sx) * s2dw);
         sw-=0-sx;
         sx=0;
      }
      if(sy<0)
      {
         dy+=(int)((0-sy) * s2dh);
         h-=(int)((0-sy) * s2dh);

         sh-=0-sy;
         sy=0;
      }
      if(sx+sw>src.width-1)
      {
         w-=(int)((sx+sw-(src.width-1)-1)*s2dw);
         sw-=sx+sw-(src.width-1)-1;
      }
      if(sy+sh>(src.height-1))
      {
         h-=(int)((sy+sh-(src.height-1)-1)*s2dh);
         sh-=sy+sh-(src.height-1)-1;
      }
      //Clip against the edges of the destination
      if(dx<surface.box.left)
      {
         if(!flip) sx+=(int)((surface.box.left-dx)*d2sw);
         sw-=(int)((surface.box.left-dx)*d2sw);
         w-=surface.box.left-dx;
         dx=surface.box.left;
      }
      if(dy<surface.box.top)
      {
         sy+=(int)((surface.box.top-dy)*d2sh);
         sh-=(int)((surface.box.top-dy)*d2sh);
         h-=surface.box.top-dy;
         dy=surface.box.top;
      }
      if((dx+w)>surface.box.right)
      {
         if(flip) sx+=(int)(((dx+w)-surface.box.right-1)*d2sw);
         sw-=(int)(((dx+w)-surface.box.right-1)*d2sw);
         w-=((dx+w)-surface.box.right-1);
      }
      if((dy+h)>surface.box.bottom)
      {
         sh-=(int)(((dy+h)-surface.box.bottom-1)*d2sh);
         h-=((dy+h)-surface.box.bottom-1);
      }
      if((w<=0)||(h<=0)||(sw<=0)||(sh<=0)) return;

      dx+=surface.offset.x;
      dy+=surface.offset.y;

      if(lfbSurface.bitmap.picture)
      {
         AlphaWriteMode alphaWrite = surface.alphaWrite;
         if(src.alphaBlend && surface.blend)
         {
            int x, y;
            uint xerr,yerr;
            uint adddest = lfbSurface.bitmap.stride, addsource = src.stride;
            ColorAlpha * backsrc;
            ColorAlpha * source = ((ColorAlpha *) src.picture) + sy * addsource + sx;
            ColorAlpha * dest = ((ColorAlpha *) lfbSurface.bitmap.picture) + dy * adddest   + dx;
            if(flip < 0) source += sw-1;
            adddest -= w;
            yerr = 0;
            for(y=0; y<sh; y++)
            {
               yerr+=h;
               backsrc = source;
               while(yerr >= sh)
               {
                  yerr-=sh;
                  xerr = 0;
                  for(x=0; x<sw; x++)
                  {
                     xerr+=w;
                     while(xerr>=sw)
                     {
                        xerr-=sw;
                        {
                           ColorAlpha src = *source;
                           ColorAlpha dst = *dest;
                           int r = src.a * src.color.r / 255 + ((255 - src.a) * dst.color.r / 255);
                           int g = src.a * src.color.g / 255 + ((255 - src.a) * dst.color.g / 255);
                           int b = src.a * src.color.b / 255 + ((255 - src.a) * dst.color.b / 255);
                           if(r > 255) r = 255;
                           if(g > 255) g = 255;
                           if(b > 255) b = 255;
                           dest->color = { (byte)r, (byte)g, (byte)b };
                           if(alphaWrite == blend)
                           {
                              int a = src.a + ((255 - src.a) * dst.a / 255);
                              if(a > 255) a = 255;
                              dest->a = (byte)a;
                           }
                           else if(alphaWrite)
                              dest->a = src.a;
                        }
                        dest++;
                     }
                     source ++;
                  }
                  dest+=adddest;
                  source = backsrc;
               }
               source += addsource;
            }
         }
         else if(src.paletteShades)
            shades_stretch_table[lfbSurface.bitmap.pixelFormat][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h,sw,sh);
         else if(src.pixelFormat == lfbSurface.bitmap.pixelFormat)
            stretches_table[lfbSurface.bitmap.pixelFormat][src.transparent][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h,sw,sh);
         else if(src.pixelFormat == pixelFormat8 && lfbSurface.bitmap.pixelFormat != pixelFormatText)
            stretches_8bit_table[lfbSurface.bitmap.pixelFormat][src.transparent][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h,sw,sh);
      }
   }

   void Filter(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      LFBSurface lfbSurface = surface.driverData;
      bool flip = false;

      float s2dw,s2dh,d2sw,d2sh;

      if(surface.box.right < surface.box.left || surface.box.bottom < surface.box.top || !src.picture) return;

      if(Sgn(w) != Sgn(sw))
      {
         w = Abs(w);
         sw = Abs(sw);
         flip = true; 
      }

      s2dw=(float)w / sw;
      s2dh=(float)h / sh;
      d2sw=(float)sw / w;
      d2sh=(float)sh / h;

      //Clip against the edges of the source
      if(sx<0)
      {
         dx+=(int)((0-sx) * s2dw);
         w-=(int)((0-sx) * s2dw);
         sw-=0-sx;
         sx=0;
      }
      if(sy<0)
      {
         dy+=(int)((0-sy) * s2dh);
         h-=(int)((0-sy) * s2dh);

         sh-=0-sy;
         sy=0;
      }
      if(sx+sw>src.width-1)
      {
         w-=(int)((sx+sw-(src.width-1)-1)*s2dw);
         sw-=sx+sw-(src.width-1)-1;
      }
      if(sy+sh>(src.height-1))
      {
         h-=(int)((sy+sh-(src.height-1)-1)*s2dh);
         sh-=sy+sh-(src.height-1)-1;
      }
      //Clip against the edges of the destination
      if(dx<surface.box.left)
      {
         if(!flip) sx+=(int)((surface.box.left-dx)*d2sw);
         sw-=(int)((surface.box.left-dx)*d2sw);
         w-=surface.box.left-dx;
         dx=surface.box.left;
      }
      if(dy<surface.box.top)
      {
         sy+=(int)((surface.box.top-dy)*d2sh);
         sh-=(int)((surface.box.top-dy)*d2sh);
         h-=surface.box.top-dy;
         dy=surface.box.top;
      }
      if((dx+w)>surface.box.right)
      {
         if(flip) sx+=(int)(((dx+w)-surface.box.right-1)*d2sw);
         sw-=(int)(((dx+w)-surface.box.right-1)*d2sw);
         w-=((dx+w)-surface.box.right-1);
      }
      if((dy+h)>surface.box.bottom)
      {
         sh-=(int)(((dy+h)-surface.box.bottom-1)*d2sh);
         h-=((dy+h)-surface.box.bottom-1);
      }
      if((w<=0)||(h<=0)||(sw<=0)||(sh<=0)) return;

      dx+=surface.offset.x;
      dy+=surface.offset.y;

      if(lfbSurface.bitmap.picture)
      {
         AlphaWriteMode alphaWrite = surface.alphaWrite;
         if(src.alphaBlend && surface.blend)
         {
            int x, y;
            uint xerr,yerr;
            uint adddest = lfbSurface.bitmap.stride, addsource = src.stride;
            ColorAlpha * backsrc;
            ColorAlpha * source = ((ColorAlpha *) src.picture) + sy * addsource + sx;
            ColorAlpha * dest = ((ColorAlpha *) lfbSurface.bitmap.picture) + dy * adddest   + dx;
            float scaleX = (float)sw / w;
            float scaleY = (float)sh / h;
            /*if(flip < 0)
            {
               dest += w-1;
               adddest += w;
            }
            else*/
               adddest -= w;
            if (w > sw && h > sh)
            {
               int y;
               for (y = 0; y < h; y++)
               {
                  int y0 = y * sh / h;
                  int y1 = Min(y0 + 1, sh - 1);
                  float alpha = y * scaleY - y0;
                  int x;
                  for(x = 0; x < w; x++, dest += 1)
                  {
                     int x0 = x * sw / w;
                     int x1 = Min(x0 + 1, sw - 1);
                     float beta = x * scaleX - x0;
                     ColorAlpha color;
                     ColorAlpha src00, src01, src10, src11;
                     float a1,r1,g1,b1,a2,r2,g2,b2;
                     float a,r,g,b;
                     src00 = source[y0 * src.stride + x0];
                     src01 = source[y0 * src.stride + x1];
                     src10 = source[y1 * src.stride + x0];
                     src11 = source[y1 * src.stride + x1];
                     a1 = (src00.a) * (1.0f - beta) + (src01.a) * beta;
                     r1 = (src00.color.r) * (1.0f - beta) + (src01.color.r) * beta;
                     g1 = (src00.color.g) * (1.0f - beta) + (src01.color.g) * beta;
                     b1 = (src00.color.b) * (1.0f - beta) + (src01.color.b) * beta;
                     a2 = (src10.a) * (1.0f - beta) + (src11.a) * beta;
                     r2 = (src10.color.r) * (1.0f - beta) + (src11.color.r) * beta;
                     g2 = (src10.color.g) * (1.0f - beta) + (src11.color.g) * beta;
                     b2 = (src10.color.b) * (1.0f - beta) + (src11.color.b) * beta;
                     a = a1 * (1.0f - alpha) + a2 * alpha;
                     r = r1 * (1.0f - alpha) + r2 * alpha;
                     g = g1 * (1.0f - alpha) + g2 * alpha;
                     b = b1 * (1.0f - alpha) + b2 * alpha;
                     {
                        ColorAlpha dst = *dest;
                        int cr = (int)(a * r / 255 + ((255 - a) * dst.color.r / 255));
                        int cg = (int)(a * g / 255 + ((255 - a) * dst.color.g / 255));
                        int cb = (int)(a * b / 255 + ((255 - a) * dst.color.b / 255));
                        if(cr > 255) cr = 255;
                        if(cg > 255) cg = 255;
                        if(cb > 255) cb = 255;
                        dest->color = { (byte)cr, (byte)cg, (byte)cb };

                        if(alphaWrite == blend)
                        {
                           int ca = (int)(a + ((255 - a) * dst.a / 255));
                           if(ca > 255) ca = 255;
                           dest->a = (byte)ca;
                        }
                        else if(alphaWrite)
                           dest->a = (byte)a;
                     }
                  } 
                  dest += adddest;
               }
            }
            else 
            { 
               int y;
               for (y = 0; y < h; y++)
               {
                  int y0 = Min((int)((y + 1) * scaleY), sh - 1);
                  int y1 = Min(y0 + 1, sh - 1);
                  int x;
                  for (x = 0; x < w; x++, dest += 1)
                  {
                     int x0 = Min((int)((x + 1) * scaleX), sw - 1);
                     int x1 = Min(x0 + 1, sw - 1);
                     float a = 0, r = 0, g = 0, b = 0;
                     int numPixels = 0;
                     int i, j;
                     ColorAlpha color;
                     for (i = y0; i <= y1; i++)
                        for (j = x0; j <= x1; j++)
                        {
                           ColorAlpha pixel = source[i * src.stride + j];
                           a += pixel.a;
                           r += pixel.color.r;
                           g += pixel.color.g;
                           b += pixel.color.b;
                           numPixels++;
                        } 
                     a /= numPixels;
                     r /= numPixels;
                     g /= numPixels;
                     b /= numPixels;
                     {
                        ColorAlpha src = *source;
                        ColorAlpha dst = *dest;
                        int cr = (int)(a * r / 255 + ((255 - a) * dst.color.r / 255));
                        int cg = (int)(a * g / 255 + ((255 - a) * dst.color.g / 255));
                        int cb = (int)(a * b / 255 + ((255 - a) * dst.color.b / 255));
                        if(cr > 255) cr = 255;
                        if(cg > 255) cg = 255;
                        if(cb > 255) cb = 255;
                        dest->color = { (byte)cr, (byte)cg, (byte)cb };
                        if(alphaWrite == blend)
                        {
                           int ca = (int)(a + ((255 - a) * dst.a / 255));
                           if(ca > 255) ca = 255;
                           dest->a = (byte)ca;
                        }
                        else if(alphaWrite)
                           dest->a = (byte)a;
                     }
                  }
                  dest += adddest;
               } 
            }
         }
         else if(!src.paletteShades && src.pixelFormat == lfbSurface.bitmap.pixelFormat)
            filters_table[lfbSurface.bitmap.pixelFormat][src.transparent][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h,sw,sh);
         // Fail back on Stretch
         else if(src.paletteShades)
            shades_stretch_table[lfbSurface.bitmap.pixelFormat][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h,sw,sh);
         else if(src.pixelFormat == lfbSurface.bitmap.pixelFormat)
            stretches_table[lfbSurface.bitmap.pixelFormat][src.transparent][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h,sw,sh);
         else if(src.pixelFormat == pixelFormat8 && lfbSurface.bitmap.pixelFormat != pixelFormatText)
            stretches_8bit_table[lfbSurface.bitmap.pixelFormat][src.transparent][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h,sw,sh);
      }
   }

   void BlitDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h)
   {
      Blit(display, surface, src, dx, dy, sx, sy, w, h);
   }

   void StretchDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      Stretch(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
   }

   void FilterDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      Filter(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
   }

   void UnloadFont(DisplaySystem displaySystem, Font font)
   {
      if(font)
      {
#if !defined(ECERE_NOTRUETYPE)
         int entry;
         for(entry = 0; entry<MAX_FONT_LINK_ENTRIES; entry++)
         {
            FontEntry fontEntry = font.fontEntries[entry];
            if(fontEntry)
            {
               fontEntry.used--;
               if(!fontEntry.used)
               {
                  loadedFonts.Remove(fontEntry);
                  delete fontEntry;
               }
            }
         } 
#endif
         delete font;
      }
   }

   Font LoadFont(DisplaySystem displaySystem, char * faceName, float size, FontFlags flags)
   {
      void * result = null;

#if !defined(ECERE_NOTRUETYPE)
      Font font = Font { };
      if(font)
      {
         char fileName[MAX_LOCATION];
         bool fakeItalic = flags.italic;
         char linkCfgPath[MAX_LOCATION];
         int fontID = 0;
#if !defined(__WIN32__)
         File linkCfg;
#endif
         char * ecereFonts = getenv("ECERE_FONTS");
         if(!ecereFonts) ecereFonts = "<:ecere>";
#if !defined(__WIN32__)
         strcpy(linkCfgPath, ecereFonts);
         PathCat(linkCfgPath, "linking.cfg");
         linkCfg = FileOpen(linkCfgPath, read);
#endif
         strcpy(fileName, faceName);
         strcpy(font.faceName, faceName);
         font.flags = flags;
         font.displaySystem = displaySystem;

         if(!FileExists(fileName))
         {
            strcpy(fileName, ecereFonts);
            PathCat(fileName, faceName);
            if(flags.bold && flags.italic) strcat(fileName, "bi");
            else if(flags.bold) strcat(fileName, "bd");
            else if(flags.italic) strcat(fileName, "i");
            strcat(fileName, ".ttf");
            strlwr(fileName);
            fakeItalic = false;

            if(flags.italic && !FileExists(fileName))
            {
               strcpy(fileName, ecereFonts);
               PathCat(fileName, faceName);
               if(flags.bold) strcat(fileName, "bd");
               strcat(fileName, ".ttf");
               strlwr(fileName);
               fakeItalic = true;
            }

            // Search in current working directory
            if(!FileExists(fileName))
            {
               strcpy(fileName, faceName);
               if(flags.bold && flags.italic) strcat(fileName, "bi");
               else if(flags.bold) strcat(fileName, "bd");
               else if(flags.italic) strcat(fileName, "i");
               strcat(fileName, ".ttf");
               strlwr(fileName);
               fakeItalic = false;

               if(flags.italic && !FileExists(fileName))
               {
                  strcpy(fileName, faceName);
                  if(flags.bold) strcat(fileName, "bd");
                  strcat(fileName, ".ttf");
                  strlwr(fileName);
                  fakeItalic = true;
               }
            }

   #if defined(__WIN32__)
            if(!FileExists(fileName))
            {
               FontData fontData = { { 0 } };
               LOGFONT logFont = { 0 };
               HDC hdc = GetDC(0);
      
               fakeItalic = false;
      
               logFont.lfCharSet = DEFAULT_CHARSET;
               strcpy(logFont.lfFaceName, faceName);
               fontData.flags = flags;
                  
               EnumFontFamiliesEx(hdc, &logFont, (void *)MyFontProc, (DWORD)&fontData, 0);
               if(!fontData.fileName[0] && flags.bold)
               {
                  fontData.forgive = true;
                  EnumFontFamiliesEx(hdc, &logFont, (void *)MyFontProc, (DWORD)&fontData, 0);
               }
               if(!fontData.fileName[0])
               {
                  // Fake italic
                  fontData.flags.italic = false;
                  EnumFontFamiliesEx(hdc, &logFont, (void *)MyFontProc, (DWORD)&fontData, 0);
                  fakeItalic = true;
               }
      
               if(fontData.fileName[0])
               {
                  GetWindowsDirectory(fileName, MAX_LOCATION);
                  PathCat(fileName, "fonts");
                  PathCat(fileName, fontData.fileName);
               }
               ReleaseDC(0, hdc);
            }  
   #elif !defined(ECERE_NOFONTCONFIG)
            {
               char * fileName2;
               FcResult result = 0;
               FcPattern * pattern;
               FcPattern * matched;
               char * family;
               unichar testChar = 0;
               FcCharSet * charSet;
               if(!fcConfig)
                  fcConfig = FcInitLoadConfigAndFonts();

               charSet = FcCharSetCreate();

               if(!strcmpi(faceName, "Mangal"))
               {
                  testChar = 0x905;
               }

               if(testChar)
                  FcCharSetAddChar(charSet, testChar);
   
               pattern = FcPatternBuild(null,
                               //FC_SOURCE, FcTypeString, "freetype",
                               FC_FAMILY, FcTypeString, faceName,
                               //FC_SCALABLE, FcTypeBool, 1,
                               FC_SIZE, FcTypeDouble, (double)size,
                               FC_WEIGHT, FcTypeInteger, flags.bold ? FC_WEIGHT_BOLD : FC_WEIGHT_MEDIUM /*FC_WEIGHT_LIGHT*/,
                               FC_SLANT, FcTypeInteger, flags.italic ? FC_SLANT_ITALIC : FC_SLANT_ROMAN,
                               testChar ? FC_CHARSET : 0,FcTypeCharSet, charSet,
                               null);
               FcDefaultSubstitute(pattern);
               FcConfigSubstitute(fcConfig, pattern, FcMatchPattern); //FcMatchFont);

               matched = FcFontMatch (0, pattern, &result);
               // printf("Locating %s\n", faceName);
               if(matched)
               {
                  FcPatternGetString(matched, FC_FAMILY, 0, &family);
                  //printf("Fontconfig returned %s\n", family);
               }
               if(matched && (result == FcResultMatch /*|| result == FcResultNoId*/) /*&& !strcmpi(family, faceName)*/)
               {
                  double fontSize;
                  FcPatternGetString (matched, FC_FILE, 0, &fileName2);
                  FcPatternGetInteger(matched, FC_INDEX, 0, &fontID);
                  FcPatternGetDouble(matched, FC_SIZE, 0, &fontSize);
                  strcpy(fileName, fileName2);
                  // size = (float)fontSize;

                  //printf("Matched to %s, %f\n", fileName, size);
               }
               else
               {
                  //printf("Could not find a match for %s, %f, %s %s (%d)\n", faceName, size, flags.bold ? "bold" : "", flags.italic ? "italic" : "", (int)result);
               }
               if(pattern) FcPatternDestroy(pattern);
               if(matched) FcPatternDestroy(matched);
               if(charSet) FcCharSetDestroy(charSet);
            }
   #endif
         }

         if(!FileExists(fileName))
            ChangeExtension(fileName, "otf", fileName);
         if(!FileExists(fileName))
            ChangeExtension(fileName, "ttc", fileName);

         //if(FileExists(fileName))
         {
            int entry = 0;
            char links[1024] = "";
            int linksPos = 0;
#if defined(__WIN32__)
            HKEY key;
            links[0] = 0;
            if(!RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\FontLink\\SystemLink",0,KEY_READ,&key) ||
               !RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\FontLink\\SystemLink",0,KEY_READ,&key))
            {  
               // int value = 0;
               uint32 type;
               int size = 1024;
               RegQueryValueEx(key, faceName, null, (LPDWORD)&type, (LPBYTE)links, (LPDWORD)&size);
               memset(links + size, 0, 1024 - size);
               RegCloseKey(key);
            }
#else
            links[0] = 0;
            if(linkCfg)
            {
               char line[512];
               while(linkCfg.GetLine(line, sizeof(line)))
               {
                  int len = strlen(faceName);
                  if(line[0] == '[' && !strncasecmp(line + 1, faceName, len) && line[len + 1] == ']')
                  {
                     while(linkCfg.GetLine(line, sizeof(line)))
                     {
                        TrimLSpaces(line, line);
                        if(!line[0] || line[0] == '[')
                           break;
                        len = strlen(line);
                        memcpy(links + linksPos, line, len);
                        linksPos += len;
                        links[linksPos] = 0;
                        linksPos++;
                     }
                  }
               }
               linksPos = 0;
            }
#endif
            while(entry < MAX_FONT_LINK_ENTRIES)
            {
               FontEntry fontEntry = (FontEntry)loadedFonts.FindString(fileName);
               if(!fontEntry)
               {
                  File file = FileOpen/*Buffered*/(fileName, read);
                  if(file)
                  {
                     FileSize fileSize = file.GetSize();
                     FT_Open_Args args = { 0 };
                     FT_Parameter param = { FT_PARAM_TAG_UNPATENTED_HINTING };
                     FT_Stream stream = new0 FT_StreamRec[1];
                     
                     if(!ftLibrary)
                        FT_Init_FreeType( &ftLibrary );

                     fontEntry = FontEntry { key = (uintptr)CopyString(fileName) };
                     fontEntry.stream = stream;

                     /*
                     fontEntry.buffer = new byte[fileSize];
                     file.Read(fontEntry.buffer, 1, fileSize);
                     */

                     //args.num_params = 1;
                     args.params = &param;

                     stream->size = fileSize;
                     stream->descriptor.pointer = file;
                     stream->read = FT_stream_load;
                     stream->close = FT_stream_close;

                     args.flags = /*FT_OPEN_PATHNAME|*//*FT_OPEN_MEMORY|*/FT_OPEN_STREAM/*|FT_OPEN_PARAMS*/;
                     args.stream = stream;
                     //args.pathname = fileName;
                     //args.memory_base = fontEntry.buffer;
                     //args.memory_size = fileSize;

                     // printf("Opening: %s\n", fileName);
                     FT_Open_Face( ftLibrary, &args, fontID, &fontEntry.face );

                     // delete file;
                     if(fontEntry.face)
                     {
                        fontEntry.hbFace = HB_NewFace(fontEntry.face, hb_getSFntTable);
                        fontEntry.hbFont.klass = &hb_fontClass;
                        fontEntry.hbFont.userData = fontEntry; //.face;

                        numFonts++;
                        loadedFonts.Add(fontEntry);
                     }
                     else
                     {
                        delete fontEntry;
                        // printf("Error opening font %s\n", fileName);
                     }
                  }
               }
               if(fontEntry)
               {
                  if(!entry)
                  {
                     FT_Matrix matrix;
                     FT_Vector pen = { 0, 0 };
                     if(fakeItalic)
                     {
                        matrix.xx = (FT_Fixed)( 1.0 * 0x10000L );
                        matrix.xy = (FT_Fixed)( 0.3 * 0x10000L );
                        matrix.yx = (FT_Fixed)( 0.0 * 0x10000L );
                        matrix.yy = (FT_Fixed)( 1.0 * 0x10000L );
                     }
                     else
                     {
                        matrix.xx = (FT_Fixed)( 1.0 * 0x10000L );
                        matrix.xy = (FT_Fixed)( 0.0 * 0x10000L );
                        matrix.yx = (FT_Fixed)( 0.0 * 0x10000L );
                        matrix.yy = (FT_Fixed)( 1.0 * 0x10000L );
                     }
                     FT_Set_Transform(fontEntry.face, &matrix, &pen );
                     FaceSetCharSize(fontEntry.face, size);
                     font.height = ((fontEntry.face->size->metrics.height) >> 6); //* y_scale;
                     // printf("Font height is %d\n", font.height);
                     font.fakeItalic = fakeItalic;
                     font.size = size;
                     result = font;
                  }
                  font.fontEntries[entry++] = fontEntry;
                  fontEntry.used++;
               }

               {
                  int c;
                  char ch;
                  char fontName[1024];
                  if(!links[linksPos]) break;
                  for(c = 0; (ch = links[linksPos + c]); c++)
                  {
                     fontName[c] = ch;
                     if(ch == ',') break;
                  }
                  fontName[c] = 0;
                  if(fontName[0] || ch == ',')
                  {
#if defined(__WIN32__)
                     GetWindowsDirectory(fileName, MAX_LOCATION);
                     PathCat(fileName, "fonts");
                     PathCat(fileName, fontName);
#elif !defined(ECERE_NOFONTCONFIG)
                     if(getenv("ECERE_FONTS"))
                     {
                        strcpy(fileName, ecereFonts);
                        PathCat(fileName, fontName);
                     }
                     else
                     {
                        {
                           char * fileName2;
                           FcResult result = 0;
                           FcPattern * pattern;
                           FcPattern * matched;
                           char * family;
                            pattern = FcPatternBuild(null,
                                           //FC_SOURCE, FcTypeString, "freetype",
                                           //FC_SCALABLE, FcTypeBool, 1,
                                           FC_FAMILY, FcTypeString, links + linksPos + c + 1,
                                           FC_SIZE, FcTypeDouble, (double)size,
                                           FC_WEIGHT, FcTypeInteger, flags.bold ? FC_WEIGHT_BOLD : FC_WEIGHT_MEDIUM /*FC_WEIGHT_LIGHT*/,
                                           FC_SLANT, FcTypeInteger, flags.italic ? FC_SLANT_ITALIC : FC_SLANT_ROMAN,
                                           null);
                           FcDefaultSubstitute(pattern);
                           FcConfigSubstitute(fcConfig, pattern, FcMatchPattern); //FcMatchFont);

                           //printf("Locating %s\n", links + linksPos + c + 1);
                           matched = FcFontMatch (0, pattern, &result);
                           if(matched)
                           {
                              FcPatternGetString(matched, FC_FAMILY, 0, &family);
                              // printf("Fontconfig returned %s\n", family);
                           }
                           if(matched && (result == FcResultMatch /*|| result == FcResultNoId*/) &&
                              FcPatternGetString(matched, FC_FAMILY, 0, &family) == FcResultMatch /*&& !strcmpi(family, links + linksPos + c + 1)*/)
                           {
                              double fontSize;
                              FcPatternGetString (matched, FC_FILE, 0, &fileName2);
                              FcPatternGetInteger(matched, FC_INDEX, 0, &fontID);
                              FcPatternGetDouble(matched, FC_SIZE, 0, &fontSize);
                              strcpy(fileName, fileName2);
                              //size = (float)fontSize;
                              // printf("Matched to %s, %f\n", fileName, size);
                           }
                           else
                           {
                              // printf("Could not find a match for %s, %f, %s %s (%d)\n", links + linksPos + c + 1, size, flags.bold ? "bold" : "", flags.italic ? "italic" : "", (int)result);
                           }
                           if(pattern) FcPatternDestroy(pattern);
                           if(matched) FcPatternDestroy(matched);
                        }
                     }
#endif
                     
                  }
                  linksPos += c;
                  while(links[linksPos] && links[linksPos] != ',') linksPos++;
                  linksPos++;
               }
            }
         }
            
         if(!result)
            UnloadFont(displaySystem, font);
         else
         {
            font.asciiPack.Render(font, 0, displaySystem);
         }
#if !defined(__WIN32__)
         delete linkCfg;
#endif
      }
   #endif
      return result;
   }

#if !defined(ECERE_NOTRUETYPE)
   void ::ProcessString(Font font, DisplaySystem displaySystem, byte * text, int len, 
                        void (* callback)(Surface surface, Display display, int x, int y, GlyphInfo * glyph, Bitmap bitmap),
                        Surface surface, Display display, int * x, int y)
   {
      if(font && font.fontEntries && font.fontEntries[0])
      {
         int previousGlyph = 0;
         FT_Face previousFace = 0;
         int c, nb, glyphIndex = 0;
         unichar lastPack = 0;
         GlyphPack pack = font.asciiPack;
         int wc;
         uint * glyphs;
         int numGlyphs = 0;
         bool rightToLeft = false;
         int fontEntryNum = 0;
         int glyphScript = 0;
         FontEntry curFontEntry;
         
         pack.bitmap.alphaBlend = true;

         for(c = 0; c < len || (numGlyphs && (rightToLeft ? (glyphIndex >= 0) : (glyphIndex < numGlyphs)));)
         {
            uint glyphNo;
            uint packNo;
            if(numGlyphs && (rightToLeft ? (glyphIndex >= 0) : (glyphIndex < numGlyphs)))
            {
               glyphNo = glyphs[glyphIndex] | 0x80000000 | (glyphScript << 24);
               rightToLeft ? glyphIndex-- : glyphIndex++;
            }
            else
            {
               HB_Script curScript = HB_Script_Common;
               byte * scriptStart = text + c;
               unichar nonASCIIch = 0;
               unichar ch;
               unichar ahead = 0;
               unichar testChar = 0;
               char * testLang = null;
               
               while(true)
               {
                  HB_Script script = HB_Script_Common;
                  ch = UTF8GetChar((char *)text + c, &nb);
                  if(ch > 127) nonASCIIch = ch;
                  if(!nb) break;
                  if(ch == 32 && curScript)
                  {
                     if(ahead)
                        script = curScript;
                     else
                     {
                        int a;
                        for(a = c + 1; a < c + len; a++)
                        {
                           if(text[a] != 32)
                              break;
                        }
                        if(a < c + len)
                        {
                           int nb;
                           unichar ahead = UTF8GetChar((char *)text + a, &nb);
                           if((ahead >= 0x590 && ahead <= 0x7C0) || (ahead >= 0xFB1D && ahead <= 0xFB4F) || (ahead >= 0xFB50 && ahead <= 0xFDFF))
                              script = curScript;                           
                        }
                        else
                           script = curScript;
                     }
                  }
                  else if(ch < 0x370)
                     script = HB_Script_Common;
                  else if(ch <= 0x11FF)
                  {
                     switch(ch & 0xFF00)
                     {
                        case 0x300: script = HB_Script_Greek; break;
                        case 0x400: script = HB_Script_Cyrillic; break;
                        case 0x500: script = (ch < 0x530) ? HB_Script_Cyrillic : ((ch < 0x590) ? HB_Script_Armenian : HB_Script_Hebrew); break;
                        case 0x600: script = HB_Script_Arabic; break;
                        case 0x700: script = (ch < 0x750) ? HB_Script_Syriac : ((ch < 0x780) ? HB_Script_Arabic : ((ch < 0x7C0) ? HB_Script_Thaana : HB_Script_Common)); break;
                        case 0x800: script = HB_Script_Common; break;   // NO CHARACTERS ASSIGNED BETWEEN 0x7C0 and 0x8FF?
                        case 0x900: script = (ch < 0x980) ? HB_Script_Devanagari : HB_Script_Bengali; break;
                        case 0xA00: script = (ch < 0xA80) ? HB_Script_Gurmukhi : HB_Script_Gujarati; break;
                        case 0xB00: script = (ch < 0xB80) ? HB_Script_Oriya : HB_Script_Tamil; break;
                        case 0xC00: script = (ch < 0xC80) ? HB_Script_Telugu : HB_Script_Kannada; break;
                        case 0xD00: script = (ch < 0xD80) ? HB_Script_Malayalam : HB_Script_Sinhala; break;
                        case 0xE00: script = (ch < 0xE80) ? HB_Script_Thai : HB_Script_Lao; break;
                        case 0xF00: script = HB_Script_Tibetan; break;
                        case 0x1000: script = (ch < 0x10A0) ? HB_Script_Myanmar : HB_Script_Georgian; break;
                        case 0x1100: script = HB_Script_Hangul; break;
                     }
                  }
                  else if(ch >= 0x1F00 && ch <= 0x1FFF) script = HB_Script_Greek;
                  else if((ch >= 0x2D00 && ch <= 0x2D2F) || (ch >= 0x3130 && ch <= 0x318F) || (ch >= 0xAC00 && ch <= 0xD7AF) || (ch >= 0xFFA0 && ch <= 0xFFDC))
                     script = HB_Script_Hangul;
                  else if(ch >= 0x1680 && ch <= 0x169F) script = HB_Script_Ogham;
                  else if(ch >= 0x16A0 && ch <= 0x16FF) script = HB_Script_Runic;
                  else if((ch >= 0x1780 && ch <= 0x17FF) || (ch >= 0x19E0 && ch <= 0x19FF)) script = HB_Script_Khmer;
                  else if(ch >= 0x3040 && ch <= 0x309F) script = 60;
                  else if(ch >= 0x3400 && ch <= 0x9FBF) script = 61;
                  //else if(ch >= 0x4E00 && ch <= 0x9FBF) script = 61;
                  else if(ch >= 0xFB13 && ch <= 0xFB17) script = HB_Script_Armenian;
                  else if(ch >= 0xFB1D && ch <= 0xFB4F) script = HB_Script_Hebrew;
                  else if(ch >= 0xFB50 && ch <= 0xFDFF) script = HB_Script_Arabic;
                  if(curScript)
                  {
                     if(!script || (script != curScript))
                        break;
                     c += nb;
                     if(c >= len)
                        break;
                  }
                  else 
                  {
                     if(!script || script > HB_ScriptCount) { c += nb; if(script > HB_ScriptCount) curScript = script; break; }
                     if(!script) { c += nb; break; }
                     curScript = script;
                  }
               }
               if(!nb) break;
               fontEntryNum = 0;

               if(curScript == HB_Script_Common || curScript > HB_ScriptCount)
               {
                  rightToLeft = false;
                  glyphNo = ch;
                  theCurrentScript = 0;
               }
               else
               {
                  int len = c - (int)(scriptStart - text);
                  int max = len * 2 + 1;
                  if(max > utf16BufferSize)
                  {
                     utf16 = renew utf16 uint16[max];
                     utf16BufferSize = max;
                  }
                  wc = UTF8toUTF16BufferLen((char *)scriptStart, utf16, max, len);
                  theCurrentScript = glyphScript = curScript;
               }
               switch(curScript)
               {
                  case HB_Script_Arabic:        testChar = 0x621; /*testLang = "ar"; */
                     //printf("Arabic ");
                     break;
                  case HB_Script_Devanagari:    testChar = 0x905; testLang = "sa"; 
                     //printf("Devanagari ");
                     break;
                  case HB_Script_Hebrew:        testChar = 0x05EA /*'ת'*/; /*testLang = "he"; */
                     //printf("Hebrew ");
                     break;
                  default:
                     testChar = (ch == '\t') ? ' ' : ch;
                  /*
                  case 60: testChar =　'あ'; break;
                  case 61: testChar =　0x3400; break; //'愛'; break;
                  */
               }

               if(testChar)
               {
                  // printf("Testing for char %x\n", testChar);
                  for(fontEntryNum = 0; fontEntryNum<MAX_FONT_LINK_ENTRIES; fontEntryNum++)
                  {
                     if(font.fontEntries[fontEntryNum] && FT_Get_Char_Index(font.fontEntries[fontEntryNum].face, testChar))
                        break;
                     /*if(font.fontEntries[fontEntryNum])
                        printf("Not found in %s\n", (char *)font.fontEntries[fontEntryNum].key);*/
                  }
               }
               
               if(fontEntryNum == MAX_FONT_LINK_ENTRIES) 
               {
#if !defined(__WIN32__) && !defined(ECERE_NOFONTCONFIG)
                  int fontID = 0;
                  double fontSize = font.size;
                  FcResult result = 0;
                  FcPattern * pattern;
                  FcPattern * matched;
                  FcCharSet * charSet;
                  char * family;
                  FontEntry fontEntry;
                  char * fileName = null;
                  bool fakeItalic = false;
                  for(fontEntryNum = 0; fontEntryNum<MAX_FONT_LINK_ENTRIES; fontEntryNum++)
                     if(!font.fontEntries[fontEntryNum])
                        break;
                  if(fontEntryNum == MAX_FONT_LINK_ENTRIES)
#endif
                     continue;
            
#if !defined(__WIN32__) && !defined(ECERE_NOFONTCONFIG)
                  {
                     charSet = FcCharSetCreate();
                     FcCharSetAddChar(charSet, testChar);
                     //printf("Loading with char %x\n", testChar);

                     pattern = FcPatternBuild(null,
                                     //FC_SOURCE, FcTypeString, "freetype",
                                     //FC_SCALABLE, FcTypeBool, 1,
                                     FC_FAMILY, FcTypeString, font.faceName,
                                     FC_SIZE, FcTypeDouble, (double)font.size,
                                     FC_WEIGHT, FcTypeInteger, font.flags.bold ? FC_WEIGHT_BOLD : FC_WEIGHT_MEDIUM,
                                     FC_SLANT, FcTypeInteger, font.flags.italic ? FC_SLANT_ITALIC : FC_SLANT_ROMAN,
                                     FC_CHARSET,FcTypeCharSet, charSet,
                                     testLang ? FC_LANG : 0, FcTypeString,testLang,
                                     null);
                     FcDefaultSubstitute(pattern);
                     FcConfigSubstitute(fcConfig, pattern, FcMatchPattern); //FcMatchFont);

                     //printf("Locating %s for script %d\n", font.faceName, curScript);
                     matched = FcFontMatch (0, pattern, &result);
                     if(matched)
                     {
                        FcPatternGetString(matched, FC_FAMILY, 0, &family);
                        //printf("Fontconfig returned %s\n", family);
                     }
                     if(matched && (result == FcResultMatch) && FcPatternGetString(matched, FC_FAMILY, 0, &family) == FcResultMatch)
                     {
                        FcPatternGetString (matched, FC_FILE, 0, &fileName);
                        FcPatternGetInteger(matched, FC_INDEX, 0, &fontID);
                        FcPatternGetDouble(matched, FC_SIZE, 0, &fontSize);
                        // printf("\nMatched to %s, %f\n", fileName, fontSize);
                     }
                     else
                     {
                        //printf("Could not find a match for %s, %f, %s %s (%d)\n", font.faceName, font.size, font.flags.bold ? "bold" : "", font.flags.italic ? "italic" : "", (int)result);
                     }
                  }
                  if(fileName)
                  {
                     fontEntry = (FontEntry)loadedFonts.FindString(fileName);
                     if(!fontEntry)
                     {
                        File file = FileOpen(fileName, read);
                        if(file)
                        {
                           FileSize fileSize = file.GetSize();
                           FT_Open_Args args = { 0 };                            
                           FT_Parameter param = { FT_PARAM_TAG_UNPATENTED_HINTING };
                           FT_Stream stream = new0 FT_StreamRec[1];
                           
                           if(!ftLibrary)
                              FT_Init_FreeType( &ftLibrary );

                           fontEntry = FontEntry { key = (uintptr)CopyString(fileName) };
                           fontEntry.stream = stream;
                                                
                           //args.num_params = 1;
                           args.params = &param;

                           stream->size = fileSize;
                           stream->descriptor.pointer = file;
                           stream->read = FT_stream_load;
                           stream->close = FT_stream_close;

                           args.flags = FT_OPEN_STREAM;
                           args.stream = stream;
                           //args.pathname = fileName;
                           //args.memory_base = fontEntry.buffer;
                           //args.memory_size = fileSize;

                           // printf("Opening: %s\n", fileName);
                           FT_Open_Face( ftLibrary, &args, fontID, &fontEntry.face );

                           // delete file;
                           if(fontEntry.face)
                           {
                              fontEntry.hbFace = HB_NewFace(fontEntry.face, hb_getSFntTable);            
                              fontEntry.hbFont.klass = &hb_fontClass;
                              fontEntry.hbFont.userData = fontEntry; //.face;

                              numFonts++;
                              loadedFonts.Add(fontEntry);
                           }
                           else
                           {
                              delete fontEntry;
                              // printf("Error opening font %s\n", fileName);
                           }
                        }
                     }
                     if(fontEntry)
                     {
                        FaceSetCharSize(fontEntry.face, font.size);

                        font.fontEntries[fontEntryNum] = fontEntry;
                        fontEntry.used++;
                     }
                  }
                  if(pattern) FcPatternDestroy(pattern);          
                  if(matched) FcPatternDestroy(matched);
                  if(charSet) FcCharSetDestroy(charSet);
#endif
               }
               if(curScript > HB_ScriptCount) curScript = HB_Script_Common;
               if(curScript != HB_Script_Common && curScript < HB_ScriptCount)
               {
                  font.fontEntries[fontEntryNum].font = font;
                  glyphs = shaping(font.fontEntries[fontEntryNum], utf16, wc, curScript, &numGlyphs, &rightToLeft);
                  if(!numGlyphs)
                     continue;

                  glyphIndex = rightToLeft ? (numGlyphs - 1) : 0;
                  glyphNo = glyphs[glyphIndex] | 0x80000000 | (glyphScript << 24);
                  rightToLeft ? glyphIndex-- : glyphIndex++;
               }
            }

            curFontEntry = font.fontEntries[fontEntryNum];

            packNo = glyphNo & 0xFFFFFF80;

            if(packNo != lastPack)
            {
               if(glyphNo < 128) 
                  pack = font.asciiPack;
               else
               {
                  pack = (GlyphPack)font.glyphPacks.Find((uintptr)packNo);
                  if(!pack)
                  {
                     pack = GlyphPack { key = (uintptr)packNo };
                     font.glyphPacks.Add(pack);
                     pack.Render(font, fontEntryNum, displaySystem);
                  }
               }
               pack.bitmap.alphaBlend = true;
               lastPack = packNo;
            }
            if(pack)
            {
               int index = rightToLeft ? (glyphIndex + 1) : (glyphIndex-1);
               GlyphInfo * glyph = &pack.glyphs[glyphNo & 0x7F];

               int ax = (int)((numGlyphs ? shaper_item.advances[index] : glyph->ax) * glyph->scale);
               int offset = numGlyphs ? shaper_item.offsets[index].x : 0;
               int oy = 0;//numGlyphs ? shaper_item.offsets[index].y : 0;

               ax += offset;

               if(previousGlyph && curFontEntry.face == previousFace)
               {
                  FT_Vector delta = { 0, 0 };
                  FT_Get_Kerning(curFontEntry.face, previousGlyph, glyph->glyphNo, FT_KERNING_UNFITTED, &delta );
                  if(delta.x < 0)  delta.x += (-delta.x) % 64;
                  else if(delta.x) delta.x += 64 - (delta.x % 64);
                  *x += delta.x * glyph->scale;
               }
               else
                  FaceSetCharSize(curFontEntry.face, font.size);

               previousGlyph = glyph->glyphNo;
               previousFace = curFontEntry.face;

               if(callback)
                  callback(surface, display, ((*x) >> 6), y + (oy >> 6), glyph, pack.bitmap);
               *x += ax;
            }
            if(numGlyphs && (rightToLeft ? (glyphIndex < 0) : (glyphIndex == numGlyphs)))
               numGlyphs = 0;
         }
      }
      if(surface)
      {
         LFBSurface lfbSurface = surface.driverData;
         lfbSurface.xOffset = 0;
      }
   }

#endif
   void FontExtent(DisplaySystem displaySystem, Font font, byte * text, int len, int * width, int * height)
   {
      if(displaySystem && displaySystem.flags.text && len)
      {
         if(width) 
         {
            int num = len;
            *width = num * textCellW;
         }
         if(height) *height = textCellH;
      }
      else if(font && len)
      {
         if(width)
         {
            int w = 0;
#if !defined(ECERE_NOTRUETYPE)
            ProcessString(font, displaySystem, text, len, null, null, null, &w, 0);
#endif
            //*width = (w + 64 - w % 64) >> 6;
            *width = w >> 6;
         }
         if(height)
            *height = font.height;
      }
      else
      {
         if(width) *width = 0;
         if(height) *height = 0;
      }
   }

#if !defined(ECERE_NOTRUETYPE)
   void ::OutputGlyph(Surface surface, Display display, int x, int y, GlyphInfo * glyph, Bitmap bitmap)
   {
      surface.driver.Blit(display, surface, bitmap, x + glyph->left, y + glyph->top, glyph->x, glyph->y, glyph->w, glyph->h);
   }
#endif

   void WriteText(Display display, Surface surface, int x, int y, byte * text, int len)
   {
      LFBSurface lfbSurface = surface.driverData;
      if(display && display.displaySystem.flags.text)
      {
         LFBDisplay lfbDisplay = display.driverData;
         uint16 * coffset = (uint16 *)lfbDisplay.bitmap.picture;
         int c;

         x /= textCellW;
         y /= textCellH;

         if(y > surface.box.bottom || y < surface.box.top) 
            return;
         coffset += (y+surface.offset.y) * lfbSurface.bitmap.stride + x + surface.offset.x;
         for(c=0; (c<len && x < surface.box.left); c++, x++,coffset++);
         for(; (c<len && x <= surface.box.right); c++, x++,coffset++)
         {
            if(surface.textOpacity)
               *coffset = (uint16) (lfbSurface.background|lfbSurface.foreground|text[c]);
            else
               *coffset = (uint16) (((*coffset)&0xF000)|lfbSurface.foreground|text[c]);
         }
      }
      else 
      {
         lfbSurface.writingText = true;
#if !defined(ECERE_NOTRUETYPE)
         x <<= 6;
         ProcessString(lfbSurface.font, surface.displaySystem, text, len, OutputGlyph, surface, display, &x, y);
#endif
         lfbSurface.writingText = false;
      }
   }
   
   void TextFont(Display display, Surface surface, Font font)
   {
      LFBSurface lfbSurface = surface.driverData;
      lfbSurface.font = font;
   }

   void TextOpacity(Display display, Surface surface, bool opaque)
   {
      LFBSurface lfbSurface = surface.driverData;

   }

   void TextExtent(Display display, Surface surface, byte * text, int len, int * width, int * height)
   {
      LFBSurface lfbSurface = surface.driverData;
      FontExtent(surface.displaySystem, lfbSurface.font, text, len, width, height);
   }

   void DrawingChar(Display display, Surface surface, byte character)
   {
      LFBSurface lfbSurface = surface.driverData;
      lfbSurface.drawingChar = character;
   }

   void LineStipple(Display display, Surface surface, uint32 stipple)
   {
      LFBSurface lfbSurface = surface.driverData;
      lfbSurface.stipple = (uint16)stipple;
   }

#if !defined(ECERE_VANILLA) && !defined(ECERE_NO3D)
   void FreeMesh(DisplaySystem displaySystem, Mesh mesh)
   {
      if(mesh.vertices && !mesh.flags.vertices)
         delete mesh.vertices;
      if(mesh.normals && !mesh.flags.normals)
         delete mesh.normals;
      if(mesh.texCoords && !mesh.flags.texCoords1)
         delete mesh.texCoords;
   }

   bool AllocateMesh(DisplaySystem displaySystem, Mesh mesh)
   {
      bool result = false;

      if((!mesh.flags.vertices   || mesh.vertices  || (mesh.vertices  = new Vector3Df[mesh.nVertices])) &&
         (!mesh.flags.normals    || mesh.normals   || (mesh.normals   = new Vector3Df[mesh.nVertices])) &&
         (!mesh.flags.texCoords1 || mesh.texCoords || (mesh.texCoords = new Pointf  [mesh.nVertices])))
         result = true;
      return result;
   }

   bool LockMesh(DisplaySystem displaySystem, Mesh mesh, MeshFeatures features)
   {
      return true;
   }

   void FreeIndices(DisplaySystem displaySystem, uint16 * indices)
   {
      delete indices;
   }

   uint16 * AllocateIndices(DisplaySystem displaySystem, int nIndices, bool indices32bit)
   {
      return (void *)(indices32bit ? new uint32[nIndices] : new uint16[nIndices]);
   }
   uint16 * LockIndices(DisplaySystem displaySystem, void * indices)
   {
      return indices;
   }
#endif
}
