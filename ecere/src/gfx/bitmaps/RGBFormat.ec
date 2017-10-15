namespace gfx::bitmaps;

import "Display"

static const char * extensions[] = { "rgb", "rgba", "bw", "int", "inta", "sgi", null };

static struct RGBHeader
{
   short magic          __attribute__((packed));
   char storage                                ;
   char bpc                                    ;
   uint16 dimension     __attribute__((packed));
   uint16 xSize         __attribute__((packed));
   uint16 ySize         __attribute__((packed));
   uint16 zSize         __attribute__((packed));
   int pixMin           __attribute__((packed));
   int pixMax           __attribute__((packed));
   char dummy[4]                               ;
   char imageName[80]                          ;
   int colorMap         __attribute__((packed));
   char dummy2[404]                            ;
};


#define SWAP_WORD(word) (((uint16)(word) & 0x00ff) << 8) | (((uint16)(word) & 0xff00) >> 8)
#define SWAP_DWORD(dword) ((((uint32)(dword) & 0x000000ff) << 24)  | (((uint32)(dword) & 0x0000ff00) <<  8) \
                         | (((uint32)(dword) & 0x00ff0000) >>  8)  | (((uint32)(dword) & 0xff000000) >> 24))
#define SWAP_PWORD(word)      (*(uint16 *)(&(word)))  = SWAP_WORD((*(uint16 *)(&(word))));
#define SWAP_PDWORD(dword)    (*(uint32 *)(&(dword))) = SWAP_DWORD((*(uint32 *)(&(dword))));

class RGBFormat : BitmapFormat
{
   class_property(extensions) = extensions;

   bool Load(Bitmap bitmap, File f)
   {
      RGBHeader header;
      if(f.Read(&header, sizeof(RGBHeader), 1))
      {
#ifndef __BIG_ENDIAN__
         SWAP_PWORD(header.magic);
         SWAP_PWORD(header.xSize);
         SWAP_PWORD(header.ySize);
         SWAP_PWORD(header.zSize);
         SWAP_PWORD(header.dimension);
         SWAP_PDWORD(header.pixMin);
         SWAP_PDWORD(header.pixMax);
         SWAP_PDWORD(header.colorMap);
#endif
         if(header.magic == 474)
         {
            int storage = header.storage, width = header.xSize, height = header.ySize, channels = header.zSize, bpc = header.bpc;
            if((storage == 0 || storage == 1) && (channels == 1 || channels == 3 || channels == 4) && bpc == 1)   // What's supported for now...
            {
               if(bitmap.Allocate(null, width, height, 0, pixelFormat888, false))
               {
                  byte * scanLine;
                  int c, y, x;
                  ColorAlpha defaultAlpha = channels == 4 ? 0 : ColorAlpha { a = 255 };
                  uint * rleStarts = storage ? new uint[height * channels] : null;
                  uint * rleLengths = storage ? new uint[height * channels] : null;
                  int tblIndex = 0;
                  if(storage)
                  {
                     int i, maxLength = 0;
                     f.Read(rleStarts, sizeof(uint), height * channels);
                     f.Read(rleLengths, sizeof(uint), height * channels);
                     for(i = 0; i < height * channels; i++)
                     {
#ifndef __BIG_ENDIAN__
                        SWAP_PDWORD(rleStarts[i]);
                        SWAP_PDWORD(rleLengths[i]);
#endif
                        if(rleLengths[i] > maxLength) maxLength = rleLengths[i];
                     }
                     scanLine = new byte[maxLength];
                  }
                  else
                     scanLine = new byte[width];

                  for(c = 0; c < header.zSize; c++)
                     for(y = 0; y < height; y++)
                     {
                        ColorAlpha * pic = ((ColorAlpha *)bitmap.picture) + (height - 1 - y) * width;
                        int i = 0, repeatCount = 0, copyCount = 0, len = 1;
                        byte repeatValue;
                        if(storage == 0)  // Plain
                           f.Read(scanLine, 1, width);
                        else              // RLE-compressed
                        {
                           f.Seek(rleStarts[tblIndex], start);
                           len = rleLengths[tblIndex++];
                           f.Read(scanLine, 1, len);
                        }

                        for(x = 0; x < width && i < len; )
                        {
                           byte value;
                           if(storage)
                           {
                              if(repeatCount)
                                 value = repeatValue, repeatCount--, x++;
                              else if(copyCount)
                                 value = scanLine[i++], copyCount--, x++;
                              else
                              {
                                 byte b = scanLine[i++];
                                 int count = b & 0x7f;
                                 if(!count)
                                    break;
                                 else if(b & 0x80)
                                    copyCount = count;
                                 else
                                    repeatCount = count, repeatValue = scanLine[i++];
                                 continue;
                              }
                           }
                           else
                              value = scanLine[x++];
                           switch(c)
                           {
                              case 0: *pic |= channels == 1 ? ColorAlpha { value, white } : Color { r = value } | defaultAlpha; break;
                              case 1: *pic |= Color { g = value }; break;
                              case 2: *pic |= Color { b = value }; break;
                              case 3: *pic |= ColorAlpha { a = value }; break;
                           }
                           pic++;
                        }
                     }
                  delete scanLine;
                  delete rleStarts;
                  delete rleLengths;
                  return true;
               }
            }
         }
      }
      return false;
   }

   bool Save(Bitmap bitmap, const char * filename, void * options)
   {
      return false;
   }

   ColorAlpha * LoadPalette(const char * fileName, const char * type)
   {
      ColorAlpha * result = null;
      File f = FileOpen(fileName, read);
      if(f)
      {
         byte palette[768];
         if(f.Read(palette, 768, 1))
         {
            if((result = new ColorAlpha[256]))
            {
               int c;
               for(c = 0; c<256; c++)
                  result[c] = ColorAlpha { 255, { (byte)(palette[c*3]<<2), (byte)(palette[c*3+1]<<2), (byte)(palette[c*3+2]<<2) } };
            }
         }
         delete f;
      }
      return result;
   }
}
