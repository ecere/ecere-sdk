namespace gfx::bitmaps;

import "Display"

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

struct BMPHead
{
   byte type[2]      __attribute__((packed));
   uint32 size       __attribute__((packed));
   uint16 reserved1  __attribute__((packed));
   uint16 reserved2  __attribute__((packed));
   uint32 offBits    __attribute__((packed));
   void Swap(void) {
      #ifdef __BIG_ENDIAN__
      swap32s(&size, 1);
      swap32s(&offBits, 1);
      #endif
   }
};

struct BMPInfo
{
   uint32 size             __attribute__((packed));
   uint32 width            __attribute__((packed));
   int    height           __attribute__((packed));
   uint16 planes           __attribute__((packed));
   uint16 bitCount         __attribute__((packed));
   uint32 compression      __attribute__((packed));
   uint32 sizeImage        __attribute__((packed));
   uint32 xPelsPerMeter    __attribute__((packed));
   uint32 yPelsPerMeter    __attribute__((packed));
   uint32 clrUsed          __attribute__((packed));
   uint32 clrImportant     __attribute__((packed));
   void Swap(void) {
      #ifdef __BIG_ENDIAN__
      swap32s(&size, 3);
      swap16pair(&planes);
      swap32s(&compression, 6);
      #endif
   }
};

static bool LoadBMP(Bitmap bitmap, File f, BMPHead header, BMPInfo info)
{
   bool result = false;
   bool flip;
   flip = info.height < 0;
   if(flip) info.height = -info.height;
   switch(info.bitCount)
   {
      case 1:
         result = bitmap.Allocate(null, info.width, info.height, info.width, pixelFormat888, false);
         break;
      case 8:
         result = bitmap.Allocate(null, info.width, info.height, info.width, pixelFormat8, true);
         break;
      case 24:
         // if(info.sizeImage) info.height = info.sizeImage / info.width / 3;
         result = bitmap.Allocate(null, info.width, info.height, info.width, pixelFormat888, false);
         break;
   }

   if(result)
   {
      int x,y;
      byte div;
      byte r,g,b;
      byte value, count;
      bool errorReading = false;

      if(info.bitCount == 1)
      {
         // Bitmap      
         byte * buffer = new byte[info.width >> 3];
         ColorAlpha * dest24=(ColorAlpha *)bitmap.picture + (flip ? 0 : (info.height-1)) * bitmap.stride;
         f.Read(buffer, 1, 8);   // TOCHECK: What are these 8 bytes?
         for(y=0; y<info.height && !errorReading; y++)
         {
            if(f.Read(buffer, 1, info.width >> 3) != info.width >> 3)
            {
               errorReading = true; 
               break;
            }
            for(x = 0; x < info.width; x++)
            {
               int offset = x >> 3;
               uint mask = 1 << (7 - (x & 0x07));
               byte b = (buffer[offset] & mask) ? 255 : 0;
               *(dest24++) = ColorAlpha { 255, { b, b, b } };
            }
            if(!errorReading)
            {
               div = (byte)((info.width>>3) % 4);
               if(div)
                  for(x=0; x<4-div; x++) 
                     if(!f.Getc(null)) { errorReading = true; break; }
               if(flip)
                  dest24 += (bitmap.stride - info.width);
               else
                  dest24 -= bitmap.stride*2; // IS THIS CORRECT? NO WIDTH?
            }
         }
         // bitmap.height = y;
         delete buffer;
         if(!errorReading) 
            result = true;
      }
      else if(info.bitCount == 24)
      {
         // Bitmap      
         byte * buffer = new byte[info.width * sizeof(Color)];
         ColorAlpha * dest24=(ColorAlpha *)bitmap.picture + (flip ? 0 : (info.height-1)) * bitmap.stride;
         for(y=0; y<info.height && !errorReading; y++)
         {
            if(f.Read( buffer, 3, info.width) != info.width)
            {
               errorReading = true; 
               break;
            }
            for(x = 0; x < info.width; x++)
            {
               b = buffer[x * 3];
               g = buffer[x * 3+1];
               r = buffer[x * 3+2];
               *(dest24++) = ColorAlpha { 255, { r, g, b } };
            }
            if(!errorReading)
            {
               div = (byte)((info.width * 3) % 4);
               if(div)
                  for(x=0; x<4-div; x++) 
                     if(!f.Getc(null)) { errorReading = true; break; }
               if(flip)
                  dest24 += (bitmap.stride - info.width);
               else
                  dest24 -= bitmap.stride*2; // IS THIS CORRECT? NO WIDTH?
            }
         }
         // bitmap.height = y;
         delete buffer;
         if(!errorReading) 
            result = true;
      }
      else if(info.bitCount == 8)
      {
         byte * dest256;
         int c;

         // Palette
         if(info.clrUsed)
         {
            FillBytesBy4(bitmap.palette,0,256);
            if(f.Read( bitmap.palette,sizeof(uint32),info.clrUsed) != info.clrUsed)
               errorReading = true;
         }
         else if(f.Read( bitmap.palette,sizeof(uint32),256) != 256)
            errorReading = true;

         if(!errorReading)
         {
            for(c = 0; c<256; c++)
               bitmap.palette[c] |= 0xFF000000;

            f.Seek(header.offBits, start);

            // Bitmap
            if(info.compression == 0x01)
            {
               value = 0x00;
               for(y = info.height - 1; y >= 0 && !errorReading; y--)
               {
                  dest256 = bitmap.picture + y * bitmap.stride;
                  for(;!errorReading;)
                  {
                     if(!f.Getc(&count)) { errorReading = true; break; }
                     if(!f.Getc(&value)) { errorReading = true; break; }
                     if(count)
                        for(c = 0; c<count; c++)
                           *(dest256++) = value;
                     else
                     {
                        if(!value) break;
                        if(value == 0x01) break;
                        else if(value == 0x02)
                        {
                           if(!f.Getc(&count)) { errorReading = true; break; }
                           dest256 += count;
                           if(!f.Getc(&count)) { errorReading = true; break; }
                           y -= count;
                           dest256 -= count * bitmap.stride;
                        }
                        else
                        {
                           count = value;
                           for(c=0; c<count; c++)
                              if(!f.Getc(dest256 ++))
                                 { errorReading = true; break; }
                           if(!errorReading)
                              if(count & 0x01) 
                                 if(!f.Getc(null))
                                    { errorReading = true; break; }
                        }
                     }
                  }
                  if(value == 0x01) break;
               }
               if(!errorReading)
                  result = true;
            }
            else
            {
               dest256=bitmap.picture + (flip ? 0 : (info.height-1)) * bitmap.stride;
               for(y=0; y<info.height; y++)
               {
                  if(f.Read(dest256, 1, info.width) != info.width)
                     break;
                  div = (byte)(info.width % 4);
                  if(div)
                     for(x=0; x<4-div; x++) 
                        if(!f.Getc(null)) 
                           break;

                  if(flip)
                     dest256 += bitmap.stride;
                  else
                     dest256 -= bitmap.stride;
               }

               if(y == info.height)
                  result = true;
            }
         }
      }
   }
   return result;
}

static char * extensions[] = { "bmp", null };
static char * extensionsMem[] = { "memorybmp", null };

class MEMORYBMPFormat : BitmapFormat
{
   class_property(extensions) = extensionsMem;

   bool Load(Bitmap bitmap, File f)
   {
      bool result = false;
      BMPInfo info;
      if(f.Read(info, sizeof(info), 1))
      {
         BMPHead header;
      
         info.Swap();
         header.type[0] = 'B';
         header.type[1] = 'M';
         header.size=0;
         header.reserved1=0;
         header.reserved2=0;
         header.offBits=sizeof(BMPInfo) + (info.bitCount == 8) * sizeof(uint32) * 256;
         result = LoadBMP(bitmap, f, header, info);
      }
      return result;
   }
}

class BMPFormat : BitmapFormat
{
   class_property(extensions) = extensions;

   bool Load(Bitmap bitmap, File f)
   {
      bool result = false;
      
      BMPHead header;
      BMPInfo info;

      if(f.Read(header, sizeof(header), 1) && header.type[0] == 'B' && header.type[1] == 'M' && f.Read(info, sizeof(info), 1))
      {
         header.Swap();
         info.Swap();
         result = LoadBMP(bitmap, f, header, info);
      }
      return result;
   }

   bool Save(Bitmap bitmap, char * filename, void * options)
   {
      bool result = false;
      if(bitmap.pixelFormat == pixelFormat8 || bitmap.pixelFormat == pixelFormat888)
      {
         File f = FileOpen(filename, write);
         if(f) 
         {
            BMPHead header;

            f.buffered = true;
         
            header.type[0] = 'B';
            header.type[1] = 'M';
            header.size=0;
            header.reserved1=0;
            header.reserved2=0;
            header.offBits=sizeof(BMPHead)+sizeof(BMPInfo)+
               (bitmap.pixelFormat == pixelFormat8) * sizeof(uint32) * 256;

            header.Swap();

            if(f.Write(&header,sizeof(header),1))
            {
               BMPInfo info;  

               info.bitCount = (bitmap.pixelFormat == pixelFormat8) ? 8 : 24;
               info.size = sizeof(BMPInfo);
               info.width = bitmap.width;
               info.height = bitmap.height;
               info.planes = 1;
               info.compression = 0;
               info.sizeImage = 0;
               info.xPelsPerMeter = 0;
               info.yPelsPerMeter = 0;
               info.clrUsed = 0;
               info.clrImportant = 0;
               if(bitmap.pixelFormat == pixelFormat8 && options)
                  info.compression = 0x01;

               info.Swap();

               if(f.Write(&info,sizeof(info),1))
               {
                  int x,y;
                  byte div;
                  byte value, count;
                  bool errorWriting = false;

                  if(info.bitCount==24)
                  {
                     ColorAlpha * dest24;

                     // Bitmap      
                     dest24 = (ColorAlpha *)bitmap.picture + (info.height-1) * bitmap.stride;
                     for(y=0; y<info.height && !errorWriting; y++)
                     {
                        for(x=0; x<info.width; x++)
                        {
                           if(!f.Putc(dest24->color.b)) { errorWriting = true; break; }
                           if(!f.Putc(dest24->color.g)) { errorWriting = true; break; }
                           if(!f.Putc(dest24->color.r)) { errorWriting = true; break; }
                           dest24->a = 255;
                           dest24++;
                        }
                        if(!errorWriting)
                        {
                           div = (byte)((info.width * 3) % 4);
                           if(div)
                              for(x=0; x<4-div; x++) 
                                 if(!f.Putc(0)) { errorWriting = true; break; }
                           dest24-=info.width;
                           dest24-=bitmap.stride;         
                        }
                     }
                     if(!errorWriting)
                        result = true;
                  }
                  else if(info.bitCount == 8)
                  {
                     // Palette
                     if(f.Write(bitmap.palette,sizeof(uint32),256))
                     {
                        byte * dest256;
                        if(options)
                        {
                           // RLE Compressed
                           uint32 size = 0;
                           for(y=info.height-1; y>=0 && !errorWriting; y--)
                           {
                              dest256 = bitmap.picture + y * bitmap.stride;
                              x = 0;
                              for(;;)
                              {
                                 value = * (dest256++);
                                 count = 1;
                                 x++;
                                 while((x<bitmap.width) && (count<255) && (*dest256 == value))
                                 {
                                    count++;
                                    dest256++;
                                    x++;
                                 };
                                 if(!f.Putc(count)) { errorWriting = true; break; }
                                 if(!f.Putc(value)) { errorWriting = true; break; }
                                 size+=2;
                                 if(x == bitmap.width) break;
                              }
                              if(y)
                              {
                                 if(!f.Putc(0x00)) { errorWriting = true; break; }
                                 if(!f.Putc(0x00)) { errorWriting = true; break; }
                                 size+=2;
                              }
                           }
                           if(!errorWriting)
                           {
                              if(f.Putc(0x00))
                                 if(f.Putc(0x01))
                                 {
                                    size+=2;
                                    if(!(size % 4))
                                    {
                                       if(!f.Putc(0x00)) errorWriting = true;
                                       else if(!f.Putc(0x00)) errorWriting = true;
                                    }
                                    if(!errorWriting)
                                    {
                                       f.Seek(sizeof(BMPHead) + 20, start);
                                       if(f.Write(&size, sizeof(uint32), 1))
                                          result = true;
                                    }
                                 }
                           }
                        }
                        else
                        {
                           // Uncompressed
                           dest256 = bitmap.picture + (info.height-1) * bitmap.stride;
                           for(y = 0; y < info.height && !errorWriting; y++)
                           {
                              if(f.Write(dest256,1,info.width))
                              {
                                 div = (byte)(info.width % 4);
                                 if(div)
                                    for(x=0; x<4-div; x++)
                                       if(!f.Putc(0)) { errorWriting = true; break; }
                                 dest256-=bitmap.stride;
                              }
                              else
                                 errorWriting = true;
                           }
                           if(!errorWriting)
                              result = true;
                        }
                     }
                  }
               }
            }
            delete f;
         }
      }
      return result;   
   }

   ColorAlpha * LoadPalette(char * fileName, char * type)
   {
      ColorAlpha * result = null;
      File f = FileOpen(fileName, read);

      if(f)
      {
         BMPHead header;
         //Load BMP header
         if(f.Read(&header,sizeof(header),1))
         {
            BMPInfo info;
            if(f.Read(&info,sizeof(info),1))
            {
               header.Swap();
               info.Swap();
               if(info.bitCount==8)
               {
                  ColorAlpha * palette;
                  if((palette = new ColorAlpha[256]))
                  {
                     bool errorReading = false;
                     // Palette
                     if(info.clrUsed)
                     {
                        FillBytesBy4(palette,0,256);
                        if(f.Read(palette,sizeof(ColorAlpha),info.clrUsed) != info.clrUsed)
                           errorReading = true;
                     }
                     else if(f.Read(palette,sizeof(ColorAlpha),256) != 256)
                        errorReading = true;

                     if(!errorReading)
                     {
                        uint c;
                        for(c = 0; c<256; c++)
                           palette[c] |= 0xFF000000;
                        result = palette;
                     }
                     if(!result)
                        delete palette;
                  }
               }
            }
         }
         delete f;
      }   
      return result;
   }
}
