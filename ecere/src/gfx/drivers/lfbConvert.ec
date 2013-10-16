namespace gfx::drivers;

import "Display"

//////////////////////////////////////////////////////////////////////////////
// CONVERSION ROUTINES ///////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

#define CONVERT(function, sourcetype, dsttype)     \
{ \
   uint x,y,ic;                                     \
   for(y = 0; y < dst.height; y++)                 \
   {                                            \
      c = y * dst.stride;                       \
      ic = y * src.stride;                    \
      for(x = 0; x < dst.width; x++, c++, ic++)      \
      {                                         \
         pixel = ((sourcetype *)src.picture)[ic];\
         ((dsttype *)dst.picture)[c] = (dsttype)(function); \
      } \
   } \
}

static void BMP8_8(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   byte pixel;
   if(src.transparent)
   {
      if(lfbSystem && lfbSystem.palette == dst.palette)
         CONVERT(
            pixel ?
               ( (pixel = lfbSystem.rgbLookup[(uint16)(Color555)(src.palette[pixel])]) ?
                  pixel
               :
                  lfbSystem.rgbLookup[0x421])
            :
               0,
            byte,byte)
      else
         CONVERT(BestColorMatch(dst.palette,1,255,src.palette[pixel]), byte,byte)
   }
   else
   {
      if(lfbSystem && lfbSystem.palette == dst.palette)
         CONVERT(lfbSystem.rgbLookup[(uint16)(Color555)(src.palette[pixel])], byte,byte)
      else
         CONVERT(BestColorMatch(dst.palette,1,255,src.palette[pixel]), byte,byte)
   }
}

static void BMP8_444(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   Color444 pixel;
   if(src.transparent)
      CONVERT(pixel ? ( (pixel = (Color444)(src.palette[pixel])) ? pixel : 0x111) : 0, byte, Color444)
   else
      CONVERT((Color444)(src.palette[pixel]), byte, Color444)
}

static void BMP8_555(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   Color555 pixel;
   if(src.transparent)
      CONVERT(pixel ? ( (pixel = (Color555)(src.palette[pixel])) ? pixel : 0x421) : 0, byte, Color555)
   else
      CONVERT((Color555)(src.palette[pixel]), byte, Color555)
}

static void BMP8_565(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   Color565 pixel;
   if(src.transparent)
      CONVERT(pixel ? ( (pixel = (Color565)(src.palette[pixel])) ? pixel : 0x821) : 0, byte, Color565)
   else
      CONVERT((Color565)(src.palette[pixel]), byte, Color565);
}

static void BMP8_888(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   byte pixel;
   if(src.transparent)
      // (src.palette[pixel] & 0xFFFFFF)
      CONVERT(pixel ? src.palette[pixel] : 0, byte, ColorAlpha)
   else
      CONVERT(src.palette[pixel], byte, ColorAlpha)
}

static void BMP8_RGBA(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   byte pixel;
   if(src.transparent)
      // (src.palette[pixel] & 0xFFFFFF)
      CONVERT(pixel ? (ColorRGBA)(src.palette[pixel]) : 0, byte, ColorRGBA)
   else
      CONVERT((ColorRGBA)(src.palette[pixel]), byte, ColorRGBA)
}

static void BMP444_8(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   Color444 pixel;
   if(src.transparent)
   {
      if(lfbSystem && lfbSystem.palette == dst.palette)
         CONVERT(
            pixel ?
               ( (pixel = lfbSystem.rgbLookup[(uint16)(Color555)(pixel)]) ?
                  pixel
               :
                  lfbSystem.rgbLookup[0x421])
            :
               0,
            Color444, byte)
      else
         CONVERT(BestColorMatch(dst.palette,1,255,(ColorAlpha)(pixel)), Color444, byte)
   }
   else
   {
      if(lfbSystem && lfbSystem.palette == dst.palette)
         CONVERT(lfbSystem.rgbLookup[(uint16)(Color555)(pixel)],Color444,byte)
      else
         CONVERT(BestColorMatch(dst.palette,1,255,(ColorAlpha)(pixel)), Color444,byte)
   }
}

static void BMP444_555(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   Color444 pixel;
   if(src.transparent)
      CONVERT(pixel ? ( (pixel = (Color555)(pixel)) ? pixel : 0x421) : 0, Color444, Color555)
   else
      CONVERT((Color555)(pixel), Color444, Color555);
}

static void BMP444_565(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   Color444 pixel;
   if(src.transparent)
      CONVERT(pixel ? ( (pixel = (Color565)(pixel) ) ? pixel : 0x821) : 0, Color444, Color565)
   else
      CONVERT((Color565)(pixel), Color444, Color565);
}

static void BMP444_888(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   Color444 pixel;
   if(src.transparent)
      CONVERT(pixel ? ((ColorAlpha)(pixel) | 0xFF000000) : (ColorAlpha)(pixel), Color444, ColorAlpha)
   else
      CONVERT((ColorAlpha)(pixel) | 0xFF000000, Color444, ColorAlpha)
}

static void BMP555_8(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   Color555 pixel;
   if(src.transparent)
   {
      if(lfbSystem && lfbSystem.palette == dst.palette)
         CONVERT(
            pixel ?
               ( (pixel = lfbSystem.rgbLookup[pixel]) ?
                  pixel
               :
                  lfbSystem.rgbLookup[0x421])
            :
               0,
            Color555, byte)
      else
         CONVERT(BestColorMatch(dst.palette,1,255,(ColorAlpha)(pixel)), Color555, byte)
   }
   else
   {
      if(lfbSystem && lfbSystem.palette == dst.palette)
         CONVERT(lfbSystem.rgbLookup[(uint16)pixel], Color555, byte)
      else
         CONVERT(BestColorMatch(dst.palette,1,255,(ColorAlpha)(pixel)), Color555, byte)
   }
}

static void BMP555_444(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   Color444 pixel;
   if(src.transparent)
      CONVERT(pixel ? ( (pixel = (Color444)(pixel) ) ? pixel : 0x111) : 0, Color555, Color444)
   else
      CONVERT((Color444)(pixel), Color555, Color444);
}

static void BMP555_565(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   Color555 pixel;
   if(src.transparent)
      CONVERT(pixel ? ( (pixel = (Color565)(pixel) ) ? pixel : 0x821) : 0, Color555, Color565)
   else
      CONVERT((Color565)(pixel), Color555, Color565);
}

static void BMP555_888(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   Color555 pixel;
   if(src.transparent)
      CONVERT(pixel ? ((ColorAlpha)(pixel) | 0xFF000000) : (ColorAlpha)(pixel), Color555, ColorAlpha)
   else
      CONVERT((ColorAlpha)(pixel) | 0xFF000000, Color555, ColorAlpha)
}

static void BMP565_8(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   Color565 pixel;
   if(src.transparent)
   {
      if(lfbSystem && lfbSystem.palette == dst.palette)
         CONVERT(
            pixel ?
               ( (pixel = lfbSystem.rgbLookup[(uint16)(Color555)(pixel)]) ?
                  pixel
               :
                  lfbSystem.rgbLookup[0x421])
            :
               0,
            Color565, byte)
      else
         CONVERT(BestColorMatch(dst.palette,1,255,(ColorAlpha)(pixel)), Color565, byte)
   }
   else
   {
      if(lfbSystem && lfbSystem.palette == dst.palette)
         CONVERT(lfbSystem.rgbLookup[(uint16)(Color555)(pixel)], Color565, byte)
      else
         CONVERT(BestColorMatch(dst.palette,1,255,(ColorAlpha)(pixel)), Color565, byte)
   }
}

static void BMP565_444(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   Color565 pixel;
   if(src.transparent)
      CONVERT(pixel ? ( (pixel = (Color444)(pixel) ) ? pixel : 0x111) : 0, Color565, Color444)
   else
      CONVERT((Color444)(pixel), Color565, Color444);
}

static void BMP565_555(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   Color565 pixel;
   if(src.transparent)
      CONVERT(pixel ? ( (pixel = (Color555)(pixel) ) ? pixel : 0x421) : 0, Color565, Color555)
   else
      CONVERT((Color555)(pixel), Color565, Color555);
}

static void BMP565_888(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   Color565 pixel;
   if(src.transparent)
      CONVERT(pixel ? ((ColorAlpha)(pixel) | 0xFF000000) : (ColorAlpha)(pixel), Color565, ColorAlpha)
   else
      CONVERT((ColorAlpha)(pixel) | 0xFF000000, Color565, ColorAlpha)
}

static void BMP888_8(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   ColorAlpha pixel;
   if(src.transparent)
   {
      if(lfbSystem && lfbSystem.palette == dst.palette)
         CONVERT(
            (pixel & 0xFFFFFF) ?
               ( (pixel = lfbSystem.rgbLookup[(Color555)(pixel)]) ?
                  pixel
               :
                  lfbSystem.rgbLookup[0x421])
            :
               0,
            ColorAlpha,byte)
      else
         CONVERT(BestColorMatch(dst.palette,1,255,pixel), ColorAlpha,byte)
   }
   else
   {
      if(lfbSystem && lfbSystem.palette == dst.palette)
         CONVERT(lfbSystem.rgbLookup[(Color555)(pixel)], ColorAlpha,byte)
      else
         CONVERT(BestColorMatch(dst.palette,1,255,pixel), ColorAlpha,byte)
   }
}

static void BMP888_444(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   uint pixel;
   if(src.transparent)
      CONVERT((pixel & 0xFFFFFFFF) ? ( (pixel = (Color444)((ColorAlpha)pixel)) ? pixel : 0x111) : 0, ColorAlpha, Color444)
   else
      CONVERT((Color444)((ColorAlpha)pixel), ColorAlpha, Color444);
}

static void BMP888_555(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   uint pixel;
   if(src.transparent)
      CONVERT((pixel & 0xFFFFFFFF) ? ( (pixel = (Color555)((ColorAlpha)pixel)) ? pixel : 0x421) : 0, ColorAlpha, Color555)
   else
      CONVERT((Color555)((ColorAlpha)pixel), ColorAlpha, Color555)
}

static void BMP888_565(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   uint pixel;
   if(src.transparent)
      CONVERT((pixel & 0xFFFFFFFF) ? ( (pixel = (Color565)((ColorAlpha)pixel)) ? pixel : 0x821) : 0, ColorAlpha, Color565)
   else
      CONVERT((Color565)((ColorAlpha)pixel), ColorAlpha, Color565);
}

static void BMP888_RGBA(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   ColorAlpha pixel;
   CONVERT(pixel /* = (ColorRGBA)(pixel)*/, ColorAlpha, ColorRGBA);
}

static void BMPA_888(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   byte pixel;
   CONVERT((ColorAlpha { pixel, white }), byte, ColorAlpha)
}

static void BMPRGBA_555(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   uint pixel;
   if(src.transparent)
      CONVERT((pixel & 0xFF000000) ? ( (pixel = (Color555)(*(ColorRGBA *)&pixel)) ? pixel : 0x421) : 0, uint, Color555)
   else
      CONVERT((Color555)(*(ColorRGBA *)&pixel), ColorRGBA, Color555);

   // CONVERT(pixel /*= (Color555)(pixel)*/, ColorRGBA, Color555);
}

static void BMPRGBA_565(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   uint pixel;
   if(src.transparent)
      CONVERT((pixel & 0xFF000000) ? ( (pixel = (Color565)(*(ColorRGBA *)&pixel)) ? pixel : 0x821) : 0, uint, Color565)
   else
      CONVERT((Color565)(*(ColorRGBA *)&pixel), ColorRGBA, Color565);
}

static void BMPRGBA_888(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   ColorRGBA pixel;
   CONVERT(pixel /* = (ColorAlpha)(pixel)*/, ColorRGBA, ColorAlpha);
}

static void BMPRGBA_8(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   ColorRGBA pixel;
   if(true) //src.transparent)
   {
      if(lfbSystem && lfbSystem.palette == dst.palette)
         CONVERT(
            //(pixel & 0xFF000000) ?
            (pixel.a) ?
               ( (pixel = lfbSystem.rgbLookup[(uint16)(Color555)(pixel)]) ?
                  pixel
               :
                  lfbSystem.rgbLookup[0x421])
            :
               0,
            ColorRGBA, byte)
      else
      {
         //CONVERT((pixel & 0xFF000000) ?
         CONVERT((pixel.a > 192) ?
            (BestColorMatch(dst.palette,1,255, (ColorAlpha)(pixel))) : 0, ColorRGBA, byte)
      }
   }
   else
   {
      if(lfbSystem && lfbSystem.palette == dst.palette)
         CONVERT(lfbSystem.rgbLookup[(uint16)(Color555)(pixel)], ColorRGBA, byte)
      else
         CONVERT(BestColorMatch(dst.palette,1,255,(ColorAlpha)(pixel)), ColorRGBA, byte)
   }
}

static void BMP888_A(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   ColorAlpha pixel;
   CONVERT(pixel.a, ColorAlpha,byte)
}

static void BMPRGBA_A(LFBSystem lfbSystem, Bitmap src, Bitmap dst)
{
   uint c;
   ColorRGBA pixel;
   CONVERT(pixel.a, ColorRGBA, byte)
}

void (* converters_table[PixelFormat][PixelFormat]) (LFBSystem, Bitmap src, Bitmap dst) =
{
   { null,null,null,null,null,null,null, null },
   { null, BMP8_8, BMP8_444, BMP8_555, BMP8_565, BMP8_888, null, null, BMP8_RGBA },
   { null, BMP444_8, null, BMP444_555, BMP444_565, BMP444_888, null, null },
   { null, BMP555_8, BMP555_444, null, BMP555_565, BMP555_888, null, null },
   { null, BMP565_8, BMP565_444, BMP565_555, null, BMP565_888, null, null },
   { null, BMP888_8, BMP888_444, BMP888_555, BMP888_565, null, BMP888_A, null, BMP888_RGBA },
   { null, null, null, null, null, BMPA_888, null, null },
   { null,null,null,null,null,null,null, null },
   { null,BMPRGBA_8,null,BMPRGBA_555,BMPRGBA_565,BMPRGBA_888,BMPRGBA_A, null }
};
