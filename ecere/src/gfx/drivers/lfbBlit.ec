namespace gfx::drivers;

import "Bitmap"

//////////////////////////////////////////////////////////////////////////////
// BLITTING ROUTINES /////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

#define BLIT_ARGS    Bitmap src, Bitmap dst, int dx, int dy, int sx, int sy, int w, int h

#define BLIT(suffix, srctype, dsttype, init, xloop) \
static void BLIT_##suffix(BLIT_ARGS) \
{ \
   int y;                                                               \
   uint32 adddest = dst.stride, addsource = src.stride;                \
   srctype * source = (srctype *) src.picture + sy * addsource + sx;   \
   dsttype * dest   = (dsttype *) dst.picture + dy * adddest   + dx;   \
   init                                                                 \
   for(y=0; y<h; y++) { xloop; source+=addsource; dest+=adddest; }      \
}

#define BLIT_INIT_DEC   \
   int x;               \
   dest += w-1;         \
   adddest += w;        \
   addsource -= w;

#define BLIT_INIT_INC   \
   int x;               \
   adddest -= w;        \
   addsource -= w;

#define FLIP(copy) for(x=0; x<w; x++) { copy source++; dest--; }
#define NOFLIP(copy) for(x=0; x<w; x++) { copy source++; dest++; }
#define TRANSPUT(result)  if(*source) *dest=(result);
#define TRANSPUT2(result)  if((*source) & 0xFF000000) *dest=(result);
#define OPAQUEPUT(result) *dest=(result);

// Normal Blitters
BLIT(B,   byte, byte, ;,             CopyBytes(dest, source, w))
BLIT(BF,  byte, byte, BLIT_INIT_DEC,   FLIP(OPAQUEPUT(*source)))
BLIT(BT,  byte, byte, BLIT_INIT_INC, NOFLIP(TRANSPUT(*source)))
BLIT(BTF, byte, byte, BLIT_INIT_DEC,   FLIP(TRANSPUT(*source)))

BLIT(W,   uint16, uint16, ;,             CopyBytesBy2(dest, source, w))
BLIT(WF,  uint16, uint16, BLIT_INIT_DEC,   FLIP(OPAQUEPUT(*source)))
BLIT(WT,  uint16, uint16, BLIT_INIT_INC, NOFLIP(TRANSPUT(*source)))
BLIT(WTF, uint16, uint16, BLIT_INIT_DEC,   FLIP(TRANSPUT(*source)))

BLIT(D,   uint32, uint32, ;,             CopyBytesBy4(dest, source, w))
BLIT(DF,  uint32, uint32, BLIT_INIT_DEC,   FLIP(OPAQUEPUT(*source)))
BLIT(DT,  uint32, uint32, BLIT_INIT_INC, NOFLIP(TRANSPUT2(*source)))
BLIT(DTF, uint32, uint32, BLIT_INIT_DEC,   FLIP(TRANSPUT(*source)))

#define BLITSB { { BLIT_B, BLIT_BF}, { BLIT_BT, BLIT_BTF } }
#define BLITSW { { BLIT_W, BLIT_WF}, { BLIT_WT, BLIT_WTF } }
#define BLITSD { { BLIT_D, BLIT_DF}, { BLIT_DT, BLIT_DTF } }

void (* blits_table[PixelFormat][2][2]) (BLIT_ARGS) =
{ BLITSB, BLITSB, BLITSW, BLITSW, BLITSW, BLITSD, BLITSB, BLITSW, BLITSD, BLITSW };

// 8 bit to other formats
#define PALINIT   ColorAlpha * palette = src.palette;

BLIT(B8,    byte, byte, BLIT_INIT_INC, NOFLIP(OPAQUEPUT(*source)))
BLIT(B8F,   byte, byte, BLIT_INIT_DEC,   FLIP(OPAQUEPUT(*source)))
BLIT(B444,  byte, Color444, PALINIT BLIT_INIT_INC, NOFLIP(OPAQUEPUT((Color444)(palette[*source]))))
BLIT(B444F, byte, Color444, PALINIT BLIT_INIT_DEC,   FLIP(OPAQUEPUT((Color444)(palette[*source]))))
BLIT(B555,  byte, Color555, PALINIT BLIT_INIT_INC, NOFLIP(OPAQUEPUT((Color555)(palette[*source]))))
BLIT(B555F, byte, Color555, PALINIT BLIT_INIT_DEC,   FLIP(OPAQUEPUT((Color555)(palette[*source]))))
BLIT(B565,  byte, Color565, PALINIT BLIT_INIT_INC, NOFLIP(OPAQUEPUT((Color565)(palette[*source]))))
BLIT(B565F, byte, Color565, PALINIT BLIT_INIT_DEC,   FLIP(OPAQUEPUT((Color565)(palette[*source]))))
BLIT(B888,  byte, ColorAlpha,PALINIT BLIT_INIT_INC, NOFLIP(OPAQUEPUT(palette[*source])))
BLIT(B888F, byte, ColorAlpha,PALINIT BLIT_INIT_DEC,   FLIP(OPAQUEPUT(palette[*source])))

static void BLIT_BRGBA(Bitmap src, Bitmap dst, int dx, int dy, int sx, int sy, int w, int h)
{
   int y;
   uint32 adddest = dst.stride, addsource = src.stride;
   byte * source = (byte *) src.picture + sy * addsource + sx;
   ColorRGBA * dest   = (ColorRGBA *) dst.picture + dy * adddest   + dx;
   ColorAlpha * palette = src.palette;
   int x;
   adddest -= w;
   addsource -= w;

   for(y=0; y<h; y++)
   {
      for(x=0; x<w; x++)
      {
         ColorAlpha value = palette[*source];
         ColorRGBA color = (ColorRGBA)(value);
         *dest=color;
         source++;
         dest++;
      }

      source+=addsource;
      dest+=adddest;
   }
}

BLIT(BRGBAF, byte, ColorRGBA,PALINIT BLIT_INIT_DEC,   FLIP(OPAQUEPUT((ColorRGBA)(palette[*source]))))

BLIT(B8T,   byte, byte, BLIT_INIT_INC, NOFLIP(TRANSPUT(*source)))
BLIT(B8TF,  byte, byte, BLIT_INIT_DEC,   FLIP(TRANSPUT(*source)))
BLIT(B444T, byte, Color444, PALINIT BLIT_INIT_INC, NOFLIP(TRANSPUT((Color444)(palette[*source]))))
BLIT(B444TF,byte, Color444, PALINIT BLIT_INIT_DEC,   FLIP(TRANSPUT((Color444)(palette[*source]))))
BLIT(B555T, byte, Color555, PALINIT BLIT_INIT_INC, NOFLIP(TRANSPUT((Color555)(palette[*source]))))
BLIT(B555TF,byte, Color555, PALINIT BLIT_INIT_DEC,   FLIP(TRANSPUT((Color555)(palette[*source]))))
BLIT(B565T, byte, Color565, PALINIT BLIT_INIT_INC, NOFLIP(TRANSPUT((Color565)(palette[*source]))))
BLIT(B565TF,byte, Color565, PALINIT BLIT_INIT_DEC,   FLIP(TRANSPUT((Color565)(palette[*source]))))
BLIT(B888T, byte, ColorAlpha,PALINIT BLIT_INIT_INC, NOFLIP(TRANSPUT(palette[*source])))
BLIT(B888TF,byte, ColorAlpha,PALINIT BLIT_INIT_DEC,   FLIP(TRANSPUT(palette[*source])))
BLIT(BRGBAT, byte, ColorRGBA,PALINIT BLIT_INIT_INC, NOFLIP(TRANSPUT((ColorRGBA)(palette[*source]))))
BLIT(BRGBATF,byte, ColorRGBA,PALINIT BLIT_INIT_DEC,   FLIP(TRANSPUT((ColorRGBA)(palette[*source]))))

void (* blits_8bit_table[PixelFormat][2][2]) (BLIT_ARGS) =
{
   { { null, null }, { null, null } },
   { { BLIT_B8,   BLIT_B8F },   { BLIT_B8T,   BLIT_B8TF } },
   { { BLIT_B444, BLIT_B444F }, { BLIT_B444T, BLIT_B444TF } },
   { { BLIT_B555, BLIT_B555F }, { BLIT_B555T, BLIT_B555TF } },
   { { BLIT_B565, BLIT_B565F }, { BLIT_B565T, BLIT_B565TF } },
   { { BLIT_B888, BLIT_B888F }, { BLIT_B888T, BLIT_B888TF } },
   { { null, null }, { null, null } },
   { { null, null }, { null, null } },
   { { BLIT_BRGBA, BLIT_BRGBAF }, { BLIT_BRGBAT, BLIT_BRGBATF } },
   { { null, null }, { null, null } }
};

// Using Palette Shades
#define PALSHADEINIT    byte * paletteShades = src.paletteShades;   byte shadeShift = (byte)src.shadeShift;
#define SHADESRC        paletteShades[(*source)>>shadeShift]

BLIT(BI8,    byte, byte, PALSHADEINIT BLIT_INIT_INC,         NOFLIP(TRANSPUT(SHADESRC)))
BLIT(BI8F,   byte, byte, PALSHADEINIT BLIT_INIT_DEC,           FLIP(TRANSPUT(SHADESRC)))
BLIT(BI444,  byte, Color444, PALSHADEINIT PALINIT BLIT_INIT_INC, NOFLIP(TRANSPUT((Color444)(palette[SHADESRC]))))
BLIT(BI444F, byte, Color444, PALSHADEINIT PALINIT BLIT_INIT_DEC,   FLIP(TRANSPUT((Color444)(palette[SHADESRC]))))
BLIT(BI555,  byte, Color555, PALSHADEINIT PALINIT BLIT_INIT_INC, NOFLIP(TRANSPUT((Color555)(palette[SHADESRC]))))
BLIT(BI555F, byte, Color555, PALSHADEINIT PALINIT BLIT_INIT_DEC,   FLIP(TRANSPUT((Color555)(palette[SHADESRC]))))
BLIT(BI565,  byte, Color565, PALSHADEINIT PALINIT BLIT_INIT_INC, NOFLIP(TRANSPUT((Color565)(palette[SHADESRC]))))
BLIT(BI565F, byte, Color565, PALSHADEINIT PALINIT BLIT_INIT_DEC,   FLIP(TRANSPUT((Color565)(palette[SHADESRC]))))
BLIT(BI888,  byte, ColorAlpha,PALSHADEINIT PALINIT BLIT_INIT_INC, NOFLIP(TRANSPUT(palette[SHADESRC])))
BLIT(BI888F, byte, ColorAlpha,PALSHADEINIT PALINIT BLIT_INIT_DEC,   FLIP(TRANSPUT(palette[SHADESRC])))
BLIT(BIRGBA, byte, ColorRGBA, PALSHADEINIT PALINIT BLIT_INIT_INC, NOFLIP(TRANSPUT((ColorRGBA)(palette[SHADESRC]))))
BLIT(BIRGBAF,byte, ColorRGBA, PALSHADEINIT PALINIT BLIT_INIT_DEC,   FLIP(TRANSPUT((ColorRGBA)(palette[SHADESRC]))))

void (* shades_blit_table[PixelFormat][2]) (BLIT_ARGS) =
{
   { null, null },
   { BLIT_BI8,  BLIT_BI8F },
   { BLIT_BI444,BLIT_BI444F },
   { BLIT_BI555,BLIT_BI555F },
   { BLIT_BI565,BLIT_BI565F },
   { BLIT_BI888,BLIT_BI888F },
   { null, null },
   { null, null },
   { BLIT_BIRGBA,BLIT_BIRGBAF },
   { null, null }
};

//////////////////////////////////////////////////////////////////////////////
// STRETCHING ROUTINES ///////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

#define STRETCH_ARGS    Bitmap src, Bitmap dst, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh

#define STRETCH(suffix, srctype, dsttype, flip, init, putpixel) \
static void STRETCH_##suffix(STRETCH_ARGS) \
{ \
   int x,y;                   \
   uint xerr,yerr;             \
   uint adddest = dst.stride, addsource = src.stride;    \
   srctype * backsrc; \
   srctype * source = ((srctype *) src.picture) + sy * addsource + sx; \
   dsttype * dest   = ((dsttype *) dst.picture) + dy * adddest   + dx; \
   init                                                \
   if(flip < 0) source += sw-1;                        \
   adddest -= w;                                       \
   yerr = 0;                             \
   for(y=0; y<sh; y++)                   \
   {                                     \
      yerr+=h;                           \
      backsrc = source;                  \
      while(yerr >= sh)                  \
      {                                  \
         yerr-=sh;                       \
         xerr = 0;                             \
         for(x=0; x<sw; x++)                   \
         {                                     \
            xerr+=w;                           \
            while(xerr>=sw)                    \
            {                                  \
               xerr-=sw;                       \
               putpixel                        \
               dest++;                         \
            }                                  \
            source += flip;                    \
         }                                      \
         dest+=adddest;                  \
         source = backsrc;               \
      }                                  \
      source += addsource;               \
   } \
}

// Normal Stretchers
STRETCH(B,   byte, byte, 1, ;, OPAQUEPUT(*source))
STRETCH(BF,  byte, byte,-1, ;, OPAQUEPUT(*source))
STRETCH(BT,  byte, byte, 1, ;, TRANSPUT(*source))
STRETCH(BTF, byte, byte,-1, ;, TRANSPUT(*source))
STRETCH(W,   uint16, uint16, 1, ;, OPAQUEPUT(*source))
STRETCH(WF,  uint16, uint16,-1, ;, OPAQUEPUT(*source))
STRETCH(WT,  uint16, uint16, 1, ;, TRANSPUT(*source))
STRETCH(WTF, uint16, uint16,-1, ;, TRANSPUT(*source))
STRETCH(D,   uint32, uint32, 1, ;, OPAQUEPUT(*source))
STRETCH(DF,  uint32, uint32,-1, ;, OPAQUEPUT(*source))
STRETCH(DT,  uint32, uint32, 1, ;, TRANSPUT2(*source))  // TRANSPUT
STRETCH(DTF, uint32, uint32,-1, ;, TRANSPUT(*source))

#define STRETCHESB { { STRETCH_B, STRETCH_BF}, { STRETCH_BT, STRETCH_BTF } }
#define STRETCHESW { { STRETCH_W, STRETCH_WF}, { STRETCH_WT, STRETCH_WTF } }
#define STRETCHESD { { STRETCH_D, STRETCH_DF}, { STRETCH_DT, STRETCH_DTF } }

void (* stretches_table[PixelFormat][2][2]) (STRETCH_ARGS) =
{ STRETCHESB, STRETCHESB, STRETCHESW, STRETCHESW, STRETCHESW, STRETCHESD, STRETCHESB, STRETCHESW, STRETCHESD };

// 8 bit to other formats
STRETCH(B8,    byte, byte,  1, ;, OPAQUEPUT(*source));
STRETCH(B8F,   byte, byte, -1, ;, OPAQUEPUT(*source));
STRETCH(B444,  byte, Color444,  1, PALINIT, OPAQUEPUT((Color444)(palette[*source])));
STRETCH(B444F, byte, Color444, -1, PALINIT, OPAQUEPUT((Color444)(palette[*source])));
STRETCH(B555,  byte, Color555,  1, PALINIT, OPAQUEPUT((Color555)(palette[*source])));
STRETCH(B555F, byte, Color555, -1, PALINIT, OPAQUEPUT((Color555)(palette[*source])));
STRETCH(B565,  byte, Color565,  1, PALINIT, OPAQUEPUT((Color565)(palette[*source])));
STRETCH(B565F, byte, Color565, -1, PALINIT, OPAQUEPUT((Color565)(palette[*source])));
STRETCH(B888,  byte, ColorAlpha, 1, PALINIT, OPAQUEPUT(palette[*source] | 0xFF000000));
STRETCH(B888F, byte, ColorAlpha,-1, PALINIT, OPAQUEPUT(palette[*source] | 0xFF000000));
STRETCH(BRGBA, byte, ColorRGBA, 1, PALINIT, OPAQUEPUT((ColorRGBA)(palette[*source]) | 0x000000FF));
STRETCH(BRGBAF,byte, ColorRGBA,-1, PALINIT, OPAQUEPUT((ColorRGBA)(palette[*source]) | 0x000000FF));

STRETCH(B8T,   byte, byte,  1, ;, TRANSPUT(*source));
STRETCH(B8TF,  byte, byte, -1, ;, TRANSPUT(*source));
STRETCH(B444T, byte, Color444,  1, PALINIT, TRANSPUT((Color444)(palette[*source])));
STRETCH(B444TF,byte, Color444, -1, PALINIT, TRANSPUT((Color444)(palette[*source])));
STRETCH(B555T, byte, Color555,  1, PALINIT, TRANSPUT((Color555)(palette[*source])));
STRETCH(B555TF,byte, Color555, -1, PALINIT, TRANSPUT((Color555)(palette[*source])));
STRETCH(B565T, byte, Color565,  1, PALINIT, TRANSPUT((Color565)(palette[*source])));
STRETCH(B565TF,byte, Color565, -1, PALINIT, TRANSPUT((Color565)(palette[*source])));
STRETCH(B888T, byte, ColorAlpha, 1, PALINIT, TRANSPUT(palette[*source] | 0xFF000000));
STRETCH(B888TF,byte, ColorAlpha,-1, PALINIT, TRANSPUT(palette[*source] | 0xFF000000));
STRETCH(BRGBAT, byte, ColorRGBA,  1, PALINIT, TRANSPUT((ColorRGBA)(palette[*source]) | 0x000000FF));
STRETCH(BRGBATF,byte, ColorRGBA, -1, PALINIT, TRANSPUT((ColorRGBA)(palette[*source]) | 0x000000FF));

void (* stretches_8bit_table[PixelFormat][2][2]) (STRETCH_ARGS) =
{
   { { null, null }, { null, null } },
   { { STRETCH_B8,   STRETCH_B8F },   { STRETCH_B8T,   STRETCH_B8TF } },
   { { STRETCH_B444, STRETCH_B444F }, { STRETCH_B444T, STRETCH_B444TF } },
   { { STRETCH_B555, STRETCH_B555F }, { STRETCH_B555T, STRETCH_B555TF } },
   { { STRETCH_B565, STRETCH_B565F }, { STRETCH_B565T, STRETCH_B565TF } },
   { { STRETCH_B888, STRETCH_B888F }, { STRETCH_B888T, STRETCH_B888TF } },
   { { null, null }, { null, null } },
   { { null, null }, { null, null } },
   { { STRETCH_BRGBA, STRETCH_BRGBAF }, { STRETCH_BRGBAT, STRETCH_BRGBATF } },
   { { null, null }, { null, null } }
};

// Using Palette Shades

STRETCH(BI8,   byte, byte,  1, PALSHADEINIT, TRANSPUT(SHADESRC));
STRETCH(BI8F,  byte, byte, -1, PALSHADEINIT, TRANSPUT(SHADESRC));
STRETCH(BI444, byte, Color444,  1, PALSHADEINIT PALINIT, TRANSPUT((Color444)(palette[SHADESRC])));
STRETCH(BI444F,byte, Color444, -1, PALSHADEINIT PALINIT, TRANSPUT((Color444)(palette[SHADESRC])));
STRETCH(BI555, byte, Color555,  1, PALSHADEINIT PALINIT, TRANSPUT((Color555)(palette[SHADESRC])));
STRETCH(BI555F,byte, Color555, -1, PALSHADEINIT PALINIT, TRANSPUT((Color555)(palette[SHADESRC])));
STRETCH(BI565, byte, Color565,  1, PALSHADEINIT PALINIT, TRANSPUT((Color565)(palette[SHADESRC])));
STRETCH(BI565F,byte, Color565, -1, PALSHADEINIT PALINIT, TRANSPUT((Color565)(palette[SHADESRC])));
STRETCH(BI888, byte, ColorAlpha, 1, PALSHADEINIT PALINIT, TRANSPUT(palette[SHADESRC] | 0xFF000000));
STRETCH(BI888F,byte, ColorAlpha,-1, PALSHADEINIT PALINIT, TRANSPUT(palette[SHADESRC] | 0xFF000000));
STRETCH(BIRGBA, byte, ColorRGBA, 1, PALSHADEINIT PALINIT, TRANSPUT((ColorRGBA)(palette[SHADESRC]) | 0x000000FF));
STRETCH(BIRGBAF,byte, ColorRGBA,-1, PALSHADEINIT PALINIT, TRANSPUT((ColorRGBA)(palette[SHADESRC]) | 0x000000FF));

void (* shades_stretch_table[PixelFormat][2]) (STRETCH_ARGS) =
{
   { null, null },
   { STRETCH_BI8,  STRETCH_BI8F },
   { STRETCH_BI444,STRETCH_BI444F },
   { STRETCH_BI555,STRETCH_BI555F },
   { STRETCH_BI565,STRETCH_BI565F },
   { STRETCH_BI888,STRETCH_BI888F },
   { null, null },
   { null, null },
   { STRETCH_BIRGBA,STRETCH_BIRGBAF },
   //{ STRETCH_BI888,STRETCH_BI888F }.
   { null, null }
};

//////////////////////////////////////////////////////////////////////////////
// FILTERING ROUTINES ////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

#define FILTER_ARGS    Bitmap src, Bitmap dst, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh

#define FILTER(suffix, srctype, dsttype, flip, transparent, getpixel, putpixel) \
static void FILTER_##suffix(FILTER_ARGS) \
{ \
   uint adddest = dst.stride, addsource = src.stride;    \
   srctype * source = ((srctype *)src.picture) + sy * addsource + sx; \
   dsttype * dest   = ((dsttype *)dst.picture) + dy * adddest   + dx; \
   bool opaque; \
   float scaleX = (float)sw / w; \
   float scaleY = (float)sh / h; \
   if(flip < 0) \
   { \
      dest += w-1; \
      adddest += w; \
   } \
   else \
      adddest -= w; \
   if (w > sw && h > sh)                                 \
   {                                                     \
      int y;                                             \
      for (y = 0; y < h; y++)                            \
      {                                                  \
         int y0 = y * sh / h;                            \
         int y1 = Min(y0 + 1, sh - 1);                   \
         float alpha = y * scaleY - y0;          \
         int x;                                          \
         for (x = 0; x < w; x++, dest += flip)           \
         {                                               \
            int x0 = x * sw / w;                         \
            int x1 = Min(x0 + 1, sw - 1);                \
            float beta = x * scaleX - x0;        \
            ColorAlpha color;                          \
            ColorAlpha src00, src01, src10, src11;     \
            float a1,r1,g1,b1,a2,r2,g2,b2; \
            float a,r,g,b;                   \
            opaque = false; \
            color = source[y0 * src.stride + x0]; \
            if(!transparent || color) { opaque = true; src00 = getpixel; } else src00 = *dest; \
            color = source[y0 * src.stride + x1]; \
            if(!transparent || color) { opaque = true; src01 = getpixel; } else src01 = *dest; \
            color = source[y1 * src.stride + x0]; \
            if(!transparent || color) { opaque = true; src10 = getpixel; } else src10 = *dest; \
            color = source[y1 * src.stride + x1]; \
            if(!transparent || color) { opaque = true; src11 = getpixel; } else src11 = *dest; \
            a1 = (src00.a) * (1.0f - beta) + (src01.a) * beta; \
            r1 = (src00.color.r) * (1.0f - beta) + (src01.color.r) * beta; \
            g1 = (src00.color.g) * (1.0f - beta) + (src01.color.g) * beta; \
            b1 = (src00.color.b) * (1.0f - beta) + (src01.color.b) * beta; \
            a2 = (src10.a) * (1.0f - beta) + (src11.a) * beta; \
            r2 = (src10.color.r) * (1.0f - beta) + (src11.color.r) * beta; \
            g2 = (src10.color.g) * (1.0f - beta) + (src11.color.g) * beta; \
            b2 = (src10.color.b) * (1.0f - beta) + (src11.color.b) * beta; \
            a = a1 * (1.0f - alpha) + a2 * alpha;  \
            r = r1 * (1.0f - alpha) + r2 * alpha;  \
            g = g1 * (1.0f - alpha) + g2 * alpha;  \
            b = b1 * (1.0f - alpha) + b2 * alpha;  \
            if(!transparent || opaque) \
            { \
               color = ColorAlpha { (byte) a, { (byte) r, (byte) g, (byte) b } };  \
               *dest = putpixel;   \
            } \
         }  \
         dest += adddest; \
      }  \
   } \
   else  \
   {  \
      int y;   \
      for (y = 0; y < h; y++)    \
      {  \
         int y0 = (int)(y * scaleY); \
         int y1 = Min(y0 + 1, sh - 1); \
         int x;   \
         for (x = 0; x < w; x++, dest += flip)    \
         {  \
            int x0 = (int)(x * scaleX); \
            int x1 = Min(x0 + 1, sw - 1);  \
            float a = 0, r = 0, g = 0, b = 0;   \
            int numPixels = 0;   \
            int i, j;   \
            ColorAlpha color;  \
            opaque = false; \
            for (i = y0; i <= y1; i++)    \
               for (j = x0; j <= x1; j++)    \
               { \
                  color = source[i * src.stride + j]; \
                  if(!transparent || color) \
                  { \
                     ColorAlpha pixel = getpixel; \
                     a += pixel.a;   \
                     r += pixel.color.r;   \
                     g += pixel.color.g;   \
                     b += pixel.color.b;   \
                     opaque = true; \
                  } \
                  numPixels++;   \
               }  \
            a /= numPixels;   \
            r /= numPixels;   \
            g /= numPixels;   \
            b /= numPixels;   \
            if(!transparent || opaque)    \
            { \
               color = ColorAlpha { (byte) a, { (byte) r, (byte) g, (byte) b } };   \
               *dest = putpixel;   \
            } \
         }  \
         dest += adddest; \
      }  \
   }  \
}

// Filters for each supported color depth
FILTER(8,   byte, byte, 1, 0, src.palette[color], (byte)BestColorMatch(dst.palette,1,255,color))
FILTER(8F,  byte, byte,-1, 0, src.palette[color], (byte)BestColorMatch(dst.palette,1,255,color))
FILTER(8T,  byte, byte, 1, 1, src.palette[color], (byte)BestColorMatch(dst.palette,1,255,color))
FILTER(8TF, byte, byte,-1, 1, src.palette[color], (byte)BestColorMatch(dst.palette,1,255,color))

FILTER(444,   Color444, Color444, 1, 0, (ColorAlpha)(color), (Color444)(color))
FILTER(444F,  Color444, Color444,-1, 0, (ColorAlpha)(color), (Color444)(color))
FILTER(444T,  Color444, Color444, 1, 1, (ColorAlpha)(color), (Color444)(color))
FILTER(444TF, Color444, Color444,-1, 1, (ColorAlpha)(color), (Color444)(color))

FILTER(555,   Color555, Color555, 1, 0, (ColorAlpha)(color), (Color555)(color))
FILTER(555F,  Color555, Color555,-1, 0, (ColorAlpha)(color), (Color555)(color))
FILTER(555T,  Color555, Color555, 1, 1, (ColorAlpha)(color), (Color555)(color))
FILTER(555TF, Color555, Color555,-1, 1, (ColorAlpha)(color), (Color555)(color))

FILTER(565,   Color565, Color565, 1, 0, (ColorAlpha)(color), (Color565)(color))
FILTER(565F,  Color565, Color565,-1, 0, (ColorAlpha)(color), (Color565)(color))
FILTER(565T,  Color565, Color565, 1, 1, (ColorAlpha)(color), (Color565)(color))
FILTER(565TF, Color565, Color565,-1, 1, (ColorAlpha)(color), (Color565)(color))

FILTER(888,   ColorAlpha, ColorAlpha, 1, 0, color, color)
FILTER(888TF, ColorAlpha, ColorAlpha,-1, 0, color, color)
FILTER(888T,  ColorAlpha, ColorAlpha, 1, 1, color, color)
FILTER(888F,  ColorAlpha, ColorAlpha,-1, 1, color, color)

FILTER(A,   byte, byte, 1, 0, color, (byte)color)
FILTER(ATF, byte, byte,-1, 0, color, (byte)color)
FILTER(AT,  byte, byte, 1, 1, color, (byte)color)
FILTER(AF,  byte, byte,-1, 1, color, (byte)color)

FILTER(A16, uint16, uint16, 1, 0, color, (uint16)color)

void (* filters_table[PixelFormat][2][2]) (FILTER_ARGS) =
{
   { { null, null },              { null, null} },
   { { FILTER_8, FILTER_8F },     { FILTER_8T, FILTER_8TF } },
   { { FILTER_444, FILTER_444F }, { FILTER_444T, FILTER_444TF } },
   { { FILTER_555, FILTER_555F }, { FILTER_555T, FILTER_555TF } },
   { { FILTER_565, FILTER_565F }, { FILTER_565T, FILTER_565TF } },
   { { FILTER_888, FILTER_888F }, { FILTER_888T, FILTER_888TF } },
   { { FILTER_A, FILTER_AF },     { FILTER_AT, FILTER_ATF } }, // Alpha
   { { null, null },              { null, null} }, // Text
   { { FILTER_888, FILTER_888F }, { FILTER_888T, FILTER_888TF } }, // RGBA
   { { FILTER_A16, null },              { null, null} } // A16
};
