namespace gfx::bitmaps;

#include "gif_lib.h"

import "Display"

static int ReadData(GifFileType * gifFile, GifByteType * bytes, int size)
{
   File f = gifFile->UserData;
   return f.Read(bytes, 1, size);
}

/*static int WriteData(GifFileType * gifFile, GifByteType * bytes, int size)
{
   File f = gifFile->UserData;
   return f.Write(bytes, 1, size);
}
*/
static char * extensions[] = { "gif", null };

class GIFFormat : BitmapFormat
{
   class_property(extensions) = extensions;

   bool Load(Bitmap bitmap, File f)
   {
      bool result = false;

#if GIFLIB_MAJOR > 5
      GifFileType * gifFile = DGifOpen(f, ReadData, null);
#else
      GifFileType * gifFile = DGifOpen(f, ReadData);
#endif
      if(gifFile)
      {
         DGifSlurp(gifFile);
         if(bitmap.Allocate(null, gifFile->SWidth, gifFile->SHeight, 0, pixelFormat888, false))
         {
            uint y;
            ColorAlpha * picture = (ColorAlpha *)bitmap.picture;
            int transparent = -1;
            struct SavedImage * image = &gifFile->SavedImages[0];
            int c;
            ColorMapObject * colorMap = gifFile->SColorMap;

            if(!colorMap) colorMap = gifFile->Image.ColorMap;

            for(c = 0; c<image->ExtensionBlockCount; c++)
            {
               ExtensionBlock * block = &image->ExtensionBlocks[c];
               if(block->Function == 249)
               {
                  if(block->Bytes[0])
                     transparent = (byte)block->Bytes[3];
               }
            }
            if(colorMap)
            {
               int colorCount = colorMap->ColorCount;
               if(!gifFile->Image.Interlace)
               {
                  for(y = 0; y < gifFile->SHeight; y++)
                  {
                     uint x;
                     for(x = 0; x < gifFile->SWidth; x++)
                     {
                        byte index = image->RasterBits[y*gifFile->SWidth+x];
                        if(index == transparent || index >= colorCount)
                           picture[y * bitmap.stride + x] = 0; //&= 0xFFFFFF;
                        else
                           picture[y * bitmap.stride + x] = ColorAlpha { 255, {
                              colorMap->Colors[index].Red,
                              colorMap->Colors[index].Green,
                              colorMap->Colors[index].Blue } };
                     }
                  }
               }
               else
               {
                  int startline[4] = {0, 4, 2, 1};
                  int offset[4] = {8, 8, 4, 2};
                  int group;
                  uint i;
                  for(group=0,i=0;group<4;group++)
                  {
                     uint y;
                     for(y = startline[group]; y < gifFile->SHeight; y += offset[group], i++)
                     {
                        uint x;
                        for(x = 0; x < gifFile->SWidth; x++)
                        {
                           byte index = image->RasterBits[i*gifFile->SWidth+x];
                           if(index == transparent)
                              picture[y * bitmap.stride + x] = 0;// &= 0xFFFFFF;
                           else
                              picture[y * bitmap.stride + x] = ColorAlpha { 255, {
                                 colorMap->Colors[index].Red,
                                 colorMap->Colors[index].Green,
                                 colorMap->Colors[index].Blue } };
                        }
                     }
                  }
               }
               bitmap.transparent = (transparent != -1) ? true : false;
               result = true;
            }
         }
         DGifCloseFile(gifFile);
      }

      if(!result)
         bitmap.Free();
      return result;
   }

   bool Save(Bitmap bitmap, char * filename, void * options)
   {
      bool result = false;
      return result;
   }

   ColorAlpha * LoadPalette(char * fileName, char * type)
   {
      ColorAlpha * result = null;
      return result;
   }
}
