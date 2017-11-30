namespace gfx::bitmaps;

#define _Noreturn

import "Display"

#define uint _uint
#include "png.h"
#undef uint

#ifdef __BIG_ENDIAN__
static void swap16pair(uint16 n[2]) {
   char *p = (char*)n;
   char tmp;
   tmp = p[0];
   p[0] = p[1];
   p[1] = tmp;
   p += 2;
   tmp = p[0];
   p[0] = p[1];
   p[1] = tmp;
}
//this function only swaps on big endian
static void swap32s(uint32 n[], uint count) {
   unsigned char *i = (unsigned char*)n;
   uint *o = n;
   uint32 tmp;
   while (count--) {
      unsigned char *p = (i+=4);
      tmp = 0;
      tmp |= (*--p) & 0xFF;
      tmp <<= 8;
      tmp |= (*--p) & 0xFF;
      tmp <<= 8;
      tmp |= (*--p) & 0xFF;
      tmp <<= 8;
      tmp |= (*--p) & 0xFF;
      *o++ = tmp;
   }
}
#endif

static void ReadData(png_structp png, png_bytep bytes, png_size_t size)
{
   File f = png_get_io_ptr(png);
   f.Read(bytes, 1, (uint)size);
}

static void WriteData(png_structp png, png_bytep bytes, png_size_t size)
{
   File f = png_get_io_ptr(png);
   f.Write(bytes, 1, (uint)size);
}

static const char * extensions[] = { "png", null };

class PNGFormat : BitmapFormat
{
   class_property(extensions) = extensions;

   bool Load(Bitmap bitmap, File f)
   {
      bool result = false;

      png_structp png_ptr = png_create_read_struct(PNG_LIBPNG_VER_STRING, null, null, null);

      if(png_ptr)
      {
         png_infop info_ptr = png_create_info_struct(png_ptr);
         if (info_ptr)
         {
            if(!setjmp(png_jmpbuf(png_ptr)))
            {
               png_uint_32 width, height;
               int bit_depth, color_type, interlace_type;
               unsigned int sig_read = 0;
               int numPasses;
               int channels;

               png_set_read_fn(png_ptr, f, ReadData);

               png_set_sig_bytes(png_ptr, sig_read);

               png_read_info(png_ptr, info_ptr);
               channels = png_get_channels(png_ptr, info_ptr);
               if(channels == 3 || channels == 4 || channels == 1 || channels == 2)
               {
                  PixelFormat pixelFormat = pixelFormatRGBA;
                  int stride = 0;
                  png_get_IHDR(png_ptr, info_ptr, &width, &height, &bit_depth, &color_type,
                      &interlace_type, null, null);
                  numPasses = png_set_interlace_handling(png_ptr);
                  if(color_type == PNG_COLOR_TYPE_PALETTE)
                  {
                     if (png_get_valid(png_ptr, info_ptr, PNG_INFO_tRNS))
                     {
                        channels = 4;
                        png_set_tRNS_to_alpha(png_ptr);
                     }
                     else
                        channels = 3;
                     png_set_palette_to_rgb(png_ptr);
                  }
                  else if (png_get_valid(png_ptr, info_ptr, PNG_INFO_tRNS))
                      png_set_tRNS_to_alpha(png_ptr);

                  if(channels == 1 && bit_depth == 16 && color_type == PNG_COLOR_TYPE_GRAY)
                  {
                     pixelFormat = pixelFormatA16;
                     stride = width; // no padding for now...
                  }

                  if((result = bitmap.Allocate(null, (uint)width, (uint)height, stride, pixelFormat, false)))
                  {
                     int pass;

                     result = false;

                     if(channels == 1)
                     {
                        byte * rowPtr = new byte[width * ((bit_depth == 16) ? 2 : 1)];
                        for (pass = 0; pass < numPasses; pass++)
                        {
                           uint y;
                           for (y = 0; y < height; y++)
                           {
                              uint x;
                              png_read_rows(png_ptr, &rowPtr, null, 1);
                              if(bit_depth == 16)
                              {
                                 // We have pixelFormatA16 format for this now...
                                 /*
                                 for(x = 0; x<width; x++)
                                    destPtr[x] = ColorRGBA { rowPtr[x*2+0], rowPtr[x*2+0], rowPtr[x*2+0], 255 };
                                 */
                                 uint16 * destPtr = ((uint16 *)bitmap.picture) + y * bitmap.stride;
                                 memcpy(destPtr, rowPtr, width*2);
                              }
                              else if(bit_depth == 8)
                              {
                                 ColorRGBA * destPtr = ((ColorRGBA *)bitmap.picture) + y * bitmap.stride;
                                 for(x = 0; x<width; x++)
                                    destPtr[x] = ColorRGBA { rowPtr[x], rowPtr[x], rowPtr[x], 255 };
                              }
                              else if(bit_depth == 1)
                              {
                                 ColorRGBA * destPtr = ((ColorRGBA *)bitmap.picture) + y * bitmap.stride;
                                 for(x = 0; x<width; x++)
                                 {
                                    int offset = x >> 3;
                                    uint mask = 1 << (7 - (x & 0x07));
                                    byte b = (rowPtr[offset] & mask) ? 255 : 0;
                                    destPtr[x] = ColorRGBA { b, b, b, 255 };
                                 }
                              }
                           }
                        }
                        delete rowPtr;
                        result = true;
                     }
                     else if(channels == 2)
                     {
                        byte * rowPtr = new byte[width * 2 * ((bit_depth == 16) ? 2 : 1)];
                        for (pass = 0; pass < numPasses; pass++)
                        {
                           uint y;
                           for (y = 0; y < height; y++)
                           {
                              uint x;
                              ColorRGBA * destPtr = ((ColorRGBA *)bitmap.picture) + y * bitmap.stride;
                              png_read_rows(png_ptr, &rowPtr, null, 1);
                              if(bit_depth == 16)
                              {
                                 for(x = 0; x<width; x++)
                                    destPtr[x] = ColorRGBA { rowPtr[x*4], rowPtr[x*4], rowPtr[x*4], rowPtr[x*4+2] };
                              }
                              else if(bit_depth == 8)
                              {
                                 for(x = 0; x<width; x++)
                                    destPtr[x] = ColorRGBA { rowPtr[x*2], rowPtr[x*2], rowPtr[x*2], rowPtr[x*2+1] };
                              }
                           }
                        }
                        delete rowPtr;
                        result = true;
                     }
                     else if(channels == 3)
                     {
                        byte * rowPtr = new byte[width * 4 /*3*/ * ((bit_depth == 16) ? 2 : 1)];
                        for (pass = 0; pass < numPasses; pass++)
                        {
                           uint y;
                           for (y = 0; y < height; y++)
                           {
                              uint x;
                              ColorRGBA * destPtr = ((ColorRGBA *)bitmap.picture) + y * bitmap.stride;
                              png_read_rows(png_ptr, &rowPtr, null, 1);
                              if(bit_depth == 16)
                              {
                                 for(x = 0; x<width; x++)
                                    destPtr[x] = ColorRGBA { rowPtr[x*6+0], rowPtr[x*6+2], rowPtr[x*6+4], 255 };
                              }
                              else
                              {
                                 for(x = 0; x<width; x++)
                                    destPtr[x] = ColorRGBA { rowPtr[x*3+0], rowPtr[x*3+1], rowPtr[x*3+2], 255 };
                              }
                           }
                        }
                        delete rowPtr;
                        result = true;
                     }
                     else if(channels == 4)
                     {
                        if(bit_depth == 16)
                        {
                           // 16 bit per pixel not supported... Convert to 8 bit
                           byte * rowPtr = new byte[width * 4 * 2];
                           for (pass = 0; pass < numPasses; pass++)
                           {
                              uint y;
                              for (y = 0; y < height; y++)
                              {
                                 uint x;
                                 ColorRGBA * destPtr = ((ColorRGBA *)bitmap.picture) + y * bitmap.stride;
                                 png_read_rows(png_ptr, &rowPtr, null, 1);
                                 for(x = 0; x<width; x++)
                                    destPtr[x] = ColorRGBA { rowPtr[x*8+0], rowPtr[x*8+2], rowPtr[x*8+4], rowPtr[x*8+6] };
                              }
                           }
                           delete rowPtr;
                           result = true;
                        }
                        else
                        {
                           for (pass = 0; pass < numPasses; pass++)
                           {
                              uint y;
                              for (y = 0; y < height; y++)
                              {
                                 byte * rowPtr = (byte *)(((ColorRGBA *)bitmap.picture) + y * bitmap.stride);
                                 png_read_rows(png_ptr, &rowPtr, null, 1);
                                 #ifdef __BIG_ENDIAN__
                                 swap32s((uint32*)rowPtr, width);
                                 #endif
                              }
                           }
                           result = true;
                        }
                     }
                  }
               }

               png_read_end(png_ptr, info_ptr);
            }
         }
         png_destroy_read_struct(&png_ptr, &info_ptr, null);
      }
      if(!result)
         bitmap.Free();
      return result;
   }

   bool Save(Bitmap bitmap, const char *filename, void * options)
   {
      bool result = false;
      Bitmap tempBitmap = null;
      if(bitmap && bitmap.pixelFormat != pixelFormatRGBA && bitmap.pixelFormat != pixelFormatA16)
      {
         tempBitmap = Bitmap { };
         if(tempBitmap.Copy(bitmap) && tempBitmap.Convert(null, pixelFormatRGBA, null))
            bitmap = tempBitmap;
         else
            bitmap = null;
      }

      if(bitmap)
      {
         File f = FileOpen(filename, write);
         if(f)
         {
            png_structp png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, null, null, null);
            if(png_ptr)
            {
               png_infop info_ptr = png_create_info_struct(png_ptr);
               if(info_ptr)
               {
                  if(!setjmp(png_jmpbuf(png_ptr)))
                  {
                     uint y;
                     uint bytesPerRow = bitmap.stride * (bitmap.pixelFormat == pixelFormatA16 ? 2 : 4);
                     int colorType = bitmap.pixelFormat == pixelFormatA16 ? PNG_COLOR_TYPE_GRAY : PNG_COLOR_TYPE_RGBA;
                     int bitsPerPixel = bitmap.pixelFormat == pixelFormatA16 ? 16 : 8;

                     png_set_write_fn(png_ptr, f, WriteData, null);

                     png_set_IHDR(png_ptr, info_ptr, bitmap.width, bitmap.height, bitsPerPixel, colorType,
                        PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);

                     png_write_info(png_ptr, info_ptr);

                     for (y = 0; y < bitmap.height; y++)
                     {
                        byte * rowPtr = ((byte *)bitmap.picture) + y * bytesPerRow;
                        png_write_rows(png_ptr, &rowPtr, 1);
                     }

                     png_write_end(png_ptr, info_ptr);

                     result = true;
                  }
               }
               png_destroy_write_struct(&png_ptr, &info_ptr);
            }
            delete f;
         }
      }
      if(tempBitmap)
         delete tempBitmap;
      return result;
   }

   ColorAlpha * LoadPalette(const char * fileName, const char * type)
   {
      ColorAlpha * result = null;
      return result;
   }
}
