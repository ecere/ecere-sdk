namespace gfx;

import "fontManagement"

#if (defined(ECERE_VANILLA) || defined(ECERE_ONEDRIVER)) && defined(__WIN32__)
#define ECERE_NOTRUETYPE
#endif

#undef __BLOCKS__
#define uint _uint
#define strlen _strlen
#if !defined(ECERE_NOTRUETYPE)
   #include <ft2build.h>
   #include FT_FREETYPE_H
   #include FT_TRUETYPE_TABLES_H
   #include FT_UNPATENTED_HINTING_H
   #define property  _property
   #include "harfbuzz.h"
   #undef property
#endif
#undef uint
#undef strlen

#if !defined(ECERE_NOTRUETYPE)
static int utf16BufferSize = 0;
static uint16 * utf16 = null;
#endif

#if !defined(ECERE_NOTRUETYPE)

#if !defined(ECERE_VANILLA)
import "imgDistMap"
#endif

#define MAX_FONT_LINK_ENTRIES   10

static HB_Script theCurrentScript;

static unichar UTF16GetChar(const uint16 *string, int * nw)
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

static HB_Bool hb_stringToGlyphs(HB_Font font, const uint16 * string, uint length, HB_Glyph *glyphs, uint *numGlyphs, HB_Bool rightToLeft)
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
      Glyph * glyph;
      uint glyphNo = glyphs[c] | 0x80000000 | (theCurrentScript << 24);
      uint packNo = glyphNo & 0xFFFFFF80;
      if(packNo != lastPack)
      {
         pack = (GlyphPack)glFont.glyphPacks.Find((uintptr)packNo);
         if(!pack)
         {
            glFont.glyphPacks.Add((pack = GlyphPack { key = (uintptr)packNo }));
            pack.Render(glFont, fontEntryNum, glFont.displaySystem);
         }
         lastPack = packNo;
      }
      glyph = &pack.glyphs[glyphNo & 0x7F];
      advances[c] = glyph->ax;
   }
}

static HB_Bool hb_canRender(HB_Font font, const uint16 * string, uint length)
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
    *length = (uint)ftlen;
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

    *xpos = (int)face->glyph->outline.points[point].x;
    *ypos = (int)face->glyph->outline.points[point].y;

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
      Glyph * glyph;
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

static uint FT_stream_load(FT_Stream stream, long offset, byte * buffer, long count)
{
    File f = stream->descriptor.pointer;
    f.Seek((int)offset, start);
    return count ? f.Read(buffer, 1, (uint)count) : 0;
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
      delete (char *)key;
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

   FontEntry ::Load(FaceInfo info)
   {
      FontEntry fontEntry = (FontEntry)loadedFonts.FindString(info.fileName);
      if(!fontEntry)
      {
         File file = FileOpen/*Buffered*/(info.fileName, read);
         if(file)
         {
            FileSize fileSize = file.GetSize();
            FT_Open_Args args = { 0 };
            FT_Parameter param = { FT_PARAM_TAG_UNPATENTED_HINTING };
            FT_Stream stream = new0 FT_StreamRec[1];

            if(!ftLibrary)
               FT_Init_FreeType( &ftLibrary );

            fontEntry = FontEntry { key = (uintptr)CopyString(info.fileName) };
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
            FT_Open_Face( ftLibrary, &args, info.fontID, &fontEntry.face );

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
      return fontEntry;
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

struct Glyph
{
   int ax, ay;
   int x, y;
   int ox, oy; // Outline
   int w, h;
   int left, top;
   int bx, by;
   int glyphNo;
   float scale;
};

class GlyphPack : BTNode
{
   Glyph glyphs[256];
   Bitmap bitmap { transparent = true, alphaBlend = true };
   Bitmap outline;
   int cellWidth, cellHeight;
   int oCellWidth, oCellHeight;

   ~GlyphPack()
   {
      delete outline;
   }

   void Render(Font font, int startFontEntry, DisplaySystem displaySystem)
   {
#if !defined(ECERE_NOTRUETYPE)
      unichar c;
      int maxWidth = 0, maxHeight = 0;
      int cellWidth, cellHeight;
      int oCellWidth = 0, oCellHeight = 0;
      int width, height, oWidth = 0, oHeight = 0;
      FontEntry fontEntry = null;
      FT_Face faces[128];
      float scales[128];
      float outlineSize = font.outlineSize;
      int padding = 1 + (int)outlineSize;
      bool isGlyph = ((uint)key & 0x80000000) != 0;
      unichar testChar = 0;
      Bitmap bitmap = this.bitmap;

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
            fontEntry.scale = FaceSetCharSize(fontEntry.face, font.size);
            if(!font.scale)
               font.scale = fontEntry.scale;
            if(!c)
            {
               if(!fontEntry.face->units_per_EM)
               {
                  font.ascent = (int)((double)fontEntry.face->ascender);
                  font.descent = (int)((double)fontEntry.face->descender);
               }
               else
               {
                  font.ascent = (int)((double)fontEntry.face->ascender * fontEntry.face->size->metrics.y_ppem / fontEntry.face->units_per_EM);
                  font.descent = (int)((double)fontEntry.face->descender * fontEntry.face->size->metrics.y_ppem / fontEntry.face->units_per_EM);
               }
            }

            fontEntry.hbFont.x_ppem  = fontEntry.face->size->metrics.x_ppem;
            fontEntry.hbFont.y_ppem  = fontEntry.face->size->metrics.y_ppem;
            fontEntry.hbFont.x_scale = (int)fontEntry.face->size->metrics.x_scale;
            fontEntry.hbFont.y_scale = (int)fontEntry.face->size->metrics.y_scale;
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
                     //printf("%s: Accepted entry %d ", faceName, entry);
                     break;
                  }
               }
            }
         }
         else
         {
            for(entry = startFontEntry; entry < MAX_FONT_LINK_ENTRIES; entry++)
            {
               uint glyph;
               fontEntry = font.fontEntries[entry];
               if(fontEntry && ((glyph = FT_Get_Char_Index(fontEntry.face, ((uint)key | c) & 0xFFFFFF)) || entry == MAX_FONT_LINK_ENTRIES-1 || !font.fontEntries[entry+1]))
               {
                  if(!FT_Load_Glyph(fontEntry.face, glyph, FT_LOAD_DEFAULT /*FT_LOAD_NO_HINTING*/) || entry == MAX_FONT_LINK_ENTRIES-1 || !font.fontEntries[entry+1])
                     break;
               }
            }
         }
         scales[c] = fontEntry ? fontEntry.scale : 0;
         faces[c] = fontEntry ? fontEntry.face : null;
         if(fontEntry)
         {
            maxWidth = Max(maxWidth, ((faces[c]->glyph->metrics.width + 64 + (64 - (faces[c]->glyph->metrics.width & 0x3F))) >> 6));
            maxHeight = Max(maxHeight, ((faces[c]->glyph->metrics.height + 64 + (64 - (faces[c]->glyph->metrics.height & 0x3F))) >> 6));
         }
      }
      this.cellWidth = cellWidth = maxWidth;
      this.cellHeight = cellHeight = maxHeight;

      width = pow2i(maxWidth * 16);
      height = pow2i(maxHeight * 8);

#if !defined(ECERE_VANILLA)
      if(outlineSize)
      {
         oCellWidth = 2*padding + cellWidth;
         oCellHeight = 2*padding + cellHeight;
         oWidth = pow2i(oCellWidth * 16);
         oHeight = pow2i(oCellHeight * 8);
         outline = { transparent = true, alphaBlend = true };
      }
#endif

      if(bitmap.Allocate(null, width, height, 0, pixelFormatAlpha, false) &&
         (!outline || outline.Allocate(null, oWidth, oHeight, 0, pixelFormatAlpha, false)))
      {
         float fade = font.outlineFade;
         float alphaFactor = 1.0f / (0.2f + fade);
         // float intensityFactor = 1.0f / (0.2f + outlineSize);
         float range = outlineSize, rangeInv = 1.0f / range;
         float * distanceMap = null;
         byte * padded = null;
         if(outline)
         {
            distanceMap = new float[oCellWidth * oCellHeight];
            padded = new byte[oCellWidth * oCellHeight];
         }

         for(c = 0; c < 128; c++)
         {
            FT_Int i, j, p, q;
            FT_Int xMax, yMax;
            int gx = ((uint)c & 0xF), gy = ((uint)c >> 4);
            int sx = gx * cellWidth, sy = gy * cellHeight;
            byte * picture = (byte *)bitmap.picture;
            Glyph * glyph = &glyphs[c];
            FT_GlyphSlot slot = null;
            int glyphNo = isGlyph ? (((uint)key | c) & 0x00FFFFFF) : (faces[c] ? FT_Get_Char_Index(faces[c], (uint)key | c) : 0);
            if(faces[c])
            {
               double em_size = 1.0 * faces[c]->units_per_EM;
               double y_scale = em_size ? (faces[c]->size->metrics.y_ppem / em_size) : 1;
               double ascender = faces[c]->ascender * y_scale;
               slot = faces[c]->glyph;

               FT_Load_Glyph(faces[c], glyphNo, /*FT_LOAD_DEFAULT | FT_LOAD_FORCE_AUTOHINT*/ FT_LOAD_DEFAULT /*FT_LOAD_NO_HINTING*/); // FT_LOAD_RENDER // FT_LOAD_NO_HINTING

               FT_Render_Glyph(slot, FT_RENDER_MODE_NORMAL);

               glyph->left = slot->bitmap_left;
               glyph->top = (int)(ascender - slot->bitmap_top) + (int)(font.height - (faces[c]->size->metrics.height >> 6)) / 2;

               xMax = sx + slot->bitmap.width;
               yMax = sy + slot->bitmap.rows;

               {
                  int total = 0;
                  int numPixels = 0;
                  if(slot->bitmap.pixel_mode != FT_PIXEL_MODE_MONO)
                  {
                     for(j = sy, q = 0; j<yMax; j++)
                     {
                        for(p = 0, i = sx; i<xMax; i++)
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

                  for(j = sy, q = 0; j<yMax; j++)
                  {
                     int bit = 0x80;
                     for(p = 0, i = sx; i<xMax; i++)
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
                           picture[j * bitmap.stride + i] = value;
                        }
                     }
                     q += slot->bitmap.pitch;
                  }
               }
#if !defined(ECERE_VANILLA)
               if(outline)
               {
                  // Generate outline from distance map
                  float * dmap = distanceMap;
                  byte *dst = outline.picture + gy * oCellHeight * oWidth + gx * oCellWidth;
                  int x, y;
                  byte * core = picture + gy * cellHeight * width + gx * cellWidth, * p;
                  memset(padded, 0, oCellWidth * oCellHeight);
                  if(slot->bitmap.width)
                  {
                     byte * src = padded + padding * oCellWidth + padding;
                     picture = core;
                     for(y = 0; y < cellHeight; y++)
                     {
                        byte * pic = picture;
                        p = src;
                        for(x = 0; x < cellWidth; x++, p++, pic++)
                           *p = *pic;
                        picture += width;
                        src += oCellWidth;
                     }
                  }
                  imgDistMapBuild(distanceMap, padded, oCellWidth, oCellHeight, 1, oCellWidth);

                  //core -= padding * width;
                  for(y = 0; y < oCellHeight; y++, dst += oWidth)
                  {
                     byte * dstRow = dst;
                     p = core - padding;
                     for(x = 0; x < oCellWidth; x++, dstRow++, dmap++, p++)
                     {
                        float rangeBase = (range - *dmap) * rangeInv, alpha = alphaFactor * rangeBase;
                        *dstRow = (byte)( Max( 0.0f, Min( 255.0f, alpha * 255.0f ) ) + 0.5f);
                        /*
                        if(y >= padding && y < cellWidth + padding && x >= padding && x < cellWidth + padding)
                        {
                           float intensity = Max( (float) *p * (1.0f/255.0f), intensityFactor * rangeBase );
                           byte v = (byte)( Max( 0.0f, Min( 255.0f, intensity * 255.0f ) ) + 0.5f);
                           *p = v;
                        }
                        */
                     }
                     //core += width;
                  }

                  glyph->ox = gx * oCellWidth;
                  glyph->oy = gy * oCellHeight;
               }
#endif
            }
            glyph->x = sx;
            glyph->y = sy;
            if(slot)
            {
               glyph->w = slot->bitmap.width;
               glyph->h = slot->bitmap.rows;
               glyph->ax = (int)slot->advance.x;
               glyph->ay = (int)(slot->advance.y + (64 - slot->advance.y % 64));
            }
            glyph->glyphNo = glyphNo;
            if(faces[c])
            {
               glyph->bx = (int)faces[c]->glyph->metrics.horiBearingX;
               glyph->by = (int)faces[c]->glyph->metrics.horiBearingY;
            }
            glyph->scale = scales[c];
         }

         delete padded;
         delete distanceMap;

         #if 0
         {
            int c;
            char fileName[256];
            static int fid = 0;
            for(c = 0; c<256; c++)
               bitmap.palette[c] = ColorAlpha { 255, { (byte)c,(byte)c,(byte)c } };
            bitmap.pixelFormat = pixelFormat8;

            sprintf(fileName, "font%d", fid);
            ChangeExtension(fileName, "pcx", fileName);

            bitmap.Save(fileName, null, 0);
            bitmap.pixelFormat = pixelFormatAlpha;

            if(outline)
            {
               for(c = 0; c<256; c++)
                  outline.palette[c] = ColorAlpha { 255, { (byte)c,(byte)c,(byte)c } };
               outline.pixelFormat = pixelFormat8;

               sprintf(fileName, "outline%d", fid);
               ChangeExtension(fileName, "pcx", fileName);

               outline.Save(fileName, null, 0);
               outline.pixelFormat = pixelFormatAlpha;
            }
            fid++;
         }
         #endif

         if(displaySystem && displaySystem.pixelFormat != pixelFormat4) // TODO: Add none PixelFormat
         {
            displaySystem.Lock();
#if defined(__WIN32__)
            // Is this check still required?
            if(displaySystem.driver == class(OpenGLDisplayDriver)

#if !defined(_GLES) && !defined(ECERE_STATIC)
            || displaySystem.driver == class(Direct3D8DisplayDriver)
            || displaySystem.driver == class(Direct3D9DisplayDriver)
#endif
               )
#endif
            {
               bitmap.MakeDD(displaySystem);
               if(outline)
                  outline.MakeDD(displaySystem);
            }
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
   *rightToLeft = (bool)(shaper_item.item.bidiLevel % 2);
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
   char faceName[512];
   FontFlags flags;
   float size;
   float outlineSize;
   float outlineFade;
   int ascent, descent;
   float scale;

   BinaryTree glyphPacks { };
   GlyphPack asciiPack { };
   bool fakeItalic;
   int height;
   DisplaySystem displaySystem;
   int numEntries;
#if !defined(ECERE_NOTRUETYPE)
   FontEntry fontEntries[MAX_FONT_LINK_ENTRIES];
#endif

   ~Font()
   {
      int entry;

#if !defined(ECERE_NOTRUETYPE)
      GlyphPack pack;
      while((pack = (GlyphPack)glyphPacks.root))
      {
         glyphPacks.Remove(pack);
         delete pack;
      }
#endif

#if !defined(ECERE_NOTRUETYPE)
      for(entry = 0; entry<MAX_FONT_LINK_ENTRIES; entry++)
      {
         FontEntry fontEntry = fontEntries[entry];
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
   }
   public property int ascent
   {
      get { return (int)(this ? ascent * scale : 0); }
   }
   public property int descent
   {
      get { return (int)(this ? descent * scale : 0); }
   }

   void Setup(DisplaySystem displaySystem, const String faceName, float size, FontFlags flags, float outlineSize, float outlineFade)
   {
      strcpy(this.faceName, faceName);
      this.flags = flags;
      this.displaySystem = displaySystem;
      this.size = size;
      this.outlineSize = outlineSize;
      this.outlineFade = outlineFade;
   }

   bool LoadEntry(FaceInfo info)
   {
      bool result = false;
      if(numEntries < MAX_FONT_LINK_ENTRIES)
      {
         FontEntry fontEntry = FontEntry::Load(info);
         if(fontEntry)
         {
            if(!numEntries)
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
               height = (int)((fontEntry.face->size->metrics.height) >> 6); //* y_scale;
               // printf("Font height is %d\n", height);
               this.fakeItalic = info.fakeItalic;
            }
            fontEntries[numEntries++] = fontEntry;
            fontEntry.used++;

            result = true;
         }
      }
      return result;
   }

   Font ::Load(DisplaySystem displaySystem, const char * faceName, float size, FontFlags flags, float outlineSize, float outlineFade)
   {
      Font result = null;
      Array<FaceInfo> infos = ResolveFont(faceName, size, flags);
      if(infos)
      {
         Font font { };
         bool success = false;
         font.Setup(displaySystem, faceName, size, flags, outlineSize, outlineFade);
         for(f : infos)
            success |= font.LoadEntry(f);
         if(success)
         {
            font.asciiPack.Render(font, 0, displaySystem);
            result = font;
         }
         else
            delete font;
         infos.Free();
         delete infos;
      }
      return result;
   }

   void ProcessString(DisplaySystem displaySystem, const byte * text, int len,
                      bool output,
                      Surface surface, Display display, int * x, int y, int prevGlyph, int * rPrevGlyph, int * advance)
   {
#if !defined(ECERE_NOTRUETYPE)
      if(this && fontEntries[0])
      {
         LFBSurface lfbSurface = surface ? surface.driverData : null;
         int previousGlyph = prevGlyph;
         FT_Face previousFace = 0;
         int c, nb, glyphIndex = 0;
         bool writingOutline = lfbSurface && lfbSurface.writingOutline;
         int padding = writingOutline ? 1 + (int)surface.font.outlineSize : 0;
         unichar lastPack = writingOutline ? -1 : 0;
         GlyphPack pack = asciiPack;
         Bitmap bitmap = writingOutline ? pack.outline : pack.bitmap;
         int wc = 0;
         uint * glyphs = null;
         int numGlyphs = 0;
         bool rightToLeft = false;
         int fontEntryNum = 0;
         int glyphScript = 0;
         FontEntry curFontEntry;
         Glyph * lastGlyph = null;
         int lastAX = 0;

         for(c = 0; c < len || (numGlyphs && (rightToLeft ? (glyphIndex >= 0) : (glyphIndex < numGlyphs)));)
         {
            uint glyphNo = 0;
            uint packNo;
            if(numGlyphs && (rightToLeft ? (glyphIndex >= 0) : (glyphIndex < numGlyphs)))
            {
               glyphNo = glyphs[glyphIndex] | 0x80000000 | (glyphScript << 24);
               rightToLeft ? glyphIndex-- : glyphIndex++;
            }
            else
            {
               HB_Script curScript = HB_Script_Common;
               const byte * scriptStart = text + c;
               //unichar nonASCIIch = 0;
               unichar ch;
               unichar ahead = 0;
               unichar testChar = 0;
               const String testLang = null;

               while(true)
               {
                  HB_Script script = HB_Script_Common;
                  ch = UTF8GetChar((const char *)text + c, &nb);
                  //if(ch > 127) nonASCIIch = ch;
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
                           unichar ahead = UTF8GetChar((const char *)text + a, &nb);
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
                  wc = UTF8toUTF16BufferLen((const char *)scriptStart, utf16, max, len);
                  theCurrentScript = glyphScript = curScript;
               }
               switch(curScript)
               {
                  case HB_Script_Arabic:        testChar = 0x621; /*testLang = "ar"; */
                     //printf("Arabic ");
                     break;
                  case HB_Script_Devanagari:    testChar = 0x905;
                     testLang = "sa";
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
                     if(fontEntries[fontEntryNum] && FT_Get_Char_Index(fontEntries[fontEntryNum].face, testChar))
                        break;
                     /*if(fontEntries[fontEntryNum])
                        printf("Not found in %s\n", (char *)fontEntries[fontEntryNum].key);*/
                  }
               }

               if(fontEntryNum == MAX_FONT_LINK_ENTRIES)
               {
                  FaceInfo info;
                  // Do we still have room to add an entry?
                  for(fontEntryNum = 0; fontEntryNum<MAX_FONT_LINK_ENTRIES; fontEntryNum++)
                     if(!fontEntries[fontEntryNum])
                        break;
                  if(fontEntryNum == MAX_FONT_LINK_ENTRIES)
                     continue;

                  if((info = ResolveCharFont(faceName, size, flags, testLang, testChar)))
                  {
                     FontEntry fontEntry = FontEntry::Load(info);
                     if(fontEntry)
                     {
                        FaceSetCharSize(fontEntry.face, size);
                        fontEntries[fontEntryNum] = fontEntry;
                        fontEntry.used++;
                     }
                     delete info;
                  }

                  if(!fontEntries[fontEntryNum])
                     continue;
               }
               if(curScript > HB_ScriptCount) curScript = HB_Script_Common;
               if(curScript != HB_Script_Common && curScript < HB_ScriptCount)
               {
                  fontEntries[fontEntryNum].font = this;
                  glyphs = shaping(fontEntries[fontEntryNum], utf16, wc, curScript, &numGlyphs, &rightToLeft);
                  if(!numGlyphs)
                     continue;

                  glyphIndex = rightToLeft ? (numGlyphs - 1) : 0;
                  glyphNo = glyphs[glyphIndex] | 0x80000000 | (glyphScript << 24);
                  rightToLeft ? glyphIndex-- : glyphIndex++;
               }
            }

            curFontEntry = fontEntries[fontEntryNum];

            packNo = glyphNo & 0xFFFFFF80;

            if(packNo != lastPack)
            {
               if(glyphNo < 128)
                  pack = asciiPack;
               else
               {
                  pack = (GlyphPack)glyphPacks.Find((uintptr)packNo);
                  if(!pack)
                  {
                     pack = GlyphPack { key = (uintptr)packNo };
                     glyphPacks.Add(pack);
                     pack.Render(this, fontEntryNum, displaySystem);
                  }
               }
               bitmap = writingOutline ? pack.outline : pack.bitmap;
               lastPack = packNo;
            }
            if(pack)
            {
               FT_Face face = curFontEntry ? curFontEntry.face : null;
               int index = rightToLeft ? (glyphIndex + 1) : (glyphIndex-1);
               Glyph * glyph = &pack.glyphs[glyphNo & 0x7F];

               int ax = (int)((numGlyphs ? shaper_item.advances[index] : glyph->ax) * glyph->scale);
               int offset = numGlyphs ? shaper_item.offsets[index].x : 0;

               ax += offset;

               if(previousGlyph && curFontEntry && (face == previousFace || !previousFace)) // TO IMPROVE: Assuming same face for now for multiple calls...
               {
                  FT_Vector delta = { 0, 0 };
                  FT_Get_Kerning(curFontEntry.face, previousGlyph, glyph->glyphNo, FT_KERNING_UNFITTED, &delta );
                  if(delta.x < 0)  delta.x += (-delta.x) % 64;
                  else if(delta.x) delta.x += 64 - (delta.x % 64);
                  *x += delta.x * glyph->scale;
               }
               else if(curFontEntry)
                  FaceSetCharSize(face, size);

               previousGlyph = glyph->glyphNo;
               previousFace = face;

               if(output && face)
               {
                  int h = (int)face->size->metrics.height;
                  int desc = (int)face->size->metrics.descender;
                  int oy = (numGlyphs ? shaper_item.offsets[index].y : 0);

                  oy += h + desc - glyph->by;
                  oy >>= 6;
                  //oy += glyph->top;

                  surface.driver.Blit(display, surface, bitmap, ((*x) >> 6) + glyph->left - writingOutline * padding, y + oy - writingOutline * padding,
                     writingOutline ? glyph->ox : glyph->x, writingOutline ? glyph->oy : glyph->y, glyph->w + writingOutline + 2 * padding, glyph->h + writingOutline + 2 * padding);
               }
               *x += ax;

               lastGlyph = glyph;
               lastAX = ax;
            }
            if(numGlyphs && (rightToLeft ? (glyphIndex < 0) : (glyphIndex == numGlyphs)))
               numGlyphs = 0;
         }
         if(lastGlyph)
         {
            int w = (lastGlyph->w + lastGlyph->left) * (1 << 6);
            // Fix for advance != width + left (e.g. italic fonts)
            if(w > lastAX)
               *advance = w - lastAX;
         }
         if(rPrevGlyph) *rPrevGlyph = previousGlyph;
         if(lfbSurface)
            lfbSurface.xOffset = 0;
      }
#endif
   }
};
