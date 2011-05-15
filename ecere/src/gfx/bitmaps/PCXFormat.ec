namespace gfx::bitmaps;

import "Display"

static struct RGBA32
{
   byte b,g,r,a;
};

static struct PCXHead
{
   byte manufacturer       __attribute__((packed));
   byte version            __attribute__((packed));
   byte encoding           __attribute__((packed));
   byte bitsPerPixel       __attribute__((packed));
   uint16 xMin,yMin        __attribute__((packed));
   uint16 xMax,yMax        __attribute__((packed));
   uint16 hRes             __attribute__((packed));
   uint16 vRes             __attribute__((packed));
   byte palette16[48]      __attribute__((packed));
   byte reserved           __attribute__((packed));
   byte colorPlanes        __attribute__((packed));
   uint16 bytesPerLine     __attribute__((packed));
   uint16 paletteType      __attribute__((packed));
   byte filler[58]         __attribute__((packed));
};

#define BUFLEN 1024

static char * extensions[] = { "pcx", null };

class PCXFormat : BitmapFormat
{
   class_property(extensions) = extensions;

   bool Load(Bitmap bitmap, File f)
   {
      bool result = false;

      PCXHead header;
      if(f.Read(&header,sizeof(header),1))
      {
         switch(header.colorPlanes)
         {
            case 1:
               result = bitmap.Allocate(null,
                  header.xMax-header.xMin+1,header.yMax-header.yMin+1,
                  header.xMax-header.xMin+1, pixelFormat8, true);
               break;
            case 3:
               result = bitmap.Allocate(null,
                  header.xMax-header.xMin+1,header.yMax-header.yMin+1,
                  header.xMax-header.xMin+1, pixelFormat888, false);
               break;
         }
         if(result)
         {
            byte b = 0, count = 0;
            byte buf[BUFLEN];
            uint bptr = BUFLEN+1;
            uint iptr=0, y = 0, x = 0;
            uint16 c;
            uint16 colorPlane = 0;

            result = false;

            //Read bitmap data
            f.Seek(128, start);
            for(; y <= header.yMax; )
            {
               if(bptr >= BUFLEN)
               {
                  if(!f.Read(buf, 1, BUFLEN)) break;
                  bptr=0;
               }
               if(!count)
               {
                  b = buf[bptr++];
                  if(b > 192)
                  {
                     count = b - 192;
                     if(bptr >= BUFLEN)
                     {
                        if(!f.Read(buf, 1, BUFLEN)) break;
                        bptr=0;
                     }
                     b=buf[bptr++];
                     continue;
                  }
               }
               else
                  count--;
               if(bitmap.pixelFormat == pixelFormat888)
               {
                  iptr = (y*bitmap.width) + x;
                  if(x <= header.xMax && y <= header.yMax)
                  {
                     switch(colorPlane)
                     {
                        case 0: 
                           ((RGBA32*)bitmap.picture)[iptr].a = 255;
                           ((RGBA32*)bitmap.picture)[iptr].r = b; 
                           break;
                        case 1: ((RGBA32*)bitmap.picture)[iptr].g = b; break;
                        case 2: ((RGBA32*)bitmap.picture)[iptr].b = b; break;
                     }
                  }
                  x++;
                  if(x == header.bytesPerLine)
                  {
                     colorPlane++;
                     x = 0;
                     if(colorPlane == 3)
                     {
                        colorPlane = 0;
                        y++;
                     }
                  }
               }
               else if(bitmap.pixelFormat == pixelFormat8)
               {
                  if(x <= header.xMax && y <= header.yMax)
                     bitmap.picture[iptr] = b;
                  x++;
                  iptr++;
                  if(x == header.bytesPerLine)
                  { 
                     iptr+= bitmap.stride - x;
                     x = 0;
                     y++;
                  }
               }
            }
            if(y > header.yMax)
            {
               if(bitmap.pixelFormat == pixelFormat8)
               {
                  byte palette[768];

                  f.Seek(-768, end);
                  if(f.Read(palette, 768, 1))
                  {
                     for(c=0; c<256; c++)
                        bitmap.palette[c] = ColorAlpha { 255, { palette[c*3], palette[c*3+1], palette[c*3+2] } };
                     result = true;
                  }
               }
               else
                  result = true;
            }
         }
         if(!result)
            bitmap.Free();
      }
      return result;
   }

   bool Save(Bitmap bitmap, char *filename, void * options)
   {
      bool result = false;
      if(bitmap.pixelFormat == pixelFormat8 || bitmap.pixelFormat == pixelFormat888)
      {
         File f = FileOpen(filename, write);
         if(f)
         {
            PCXHead header;
            int div = (bitmap.pixelFormat == pixelFormat8) ? (bitmap.width % 2) : 0;
            if(div) div = 2-div;

            // Write the header
            header.manufacturer=10;
            header.version=5;
            header.encoding=1;
            header.bitsPerPixel=8;
            header.xMin=0;
            header.yMin=0;
            header.xMax=(uint16)(bitmap.width-1);
            header.yMax=(uint16)(bitmap.height-1);
            header.hRes=72;
            header.vRes=72;
            FillBytes(header.palette16, 0, 48);
            header.reserved=0;
            if(bitmap.pixelFormat == pixelFormat8)
               header.colorPlanes = 1;
            else if(bitmap.pixelFormat == pixelFormat888)
               header.colorPlanes=3;
            header.bytesPerLine=(uint16)(bitmap.width+div);
            header.paletteType=1;
            FillBytes(header.filler, 0, 58);

            if(f.Write(&header, sizeof(header), 1))
            {
               uint16 c;
               uint16 x=0;
               int count=0;
               byte b = 0;
               byte last=0;
               uint iptr=0, y = 0;
               uint16 colorPlane = 0;
               bool pad = false;
               byte padder;
               bool errorWriting = false;

               padder = (bitmap.pixelFormat == pixelFormat8) ? 0xFF : 0x00;

               for(; (iptr<bitmap.size || count) && !errorWriting; )
               {
                  iptr = (y*bitmap.stride) + x;
                  for(;iptr<bitmap.size;)
                  {
                     if(bitmap.pixelFormat == pixelFormat888)
                     {
                        switch(colorPlane)
                        {
                           case 0: b = ((RGBA32*)bitmap.picture)[iptr].r; break;
                           case 1: b = ((RGBA32*)bitmap.picture)[iptr].g; break;
                           case 2: b = ((RGBA32*)bitmap.picture)[iptr].b; break;
                        }  
                     }
                     else
                        b = bitmap.picture[iptr];
                     if(count)
                     {
                        if(b != last)
                           break;
                     }
                     else
                     {
                        last = b;
                     }
                     count++,x++;iptr++;
            
                     if(x==bitmap.width)
                     {
                        x = 0;
                        if(bitmap.pixelFormat == pixelFormat888)
                        {
                           colorPlane ++;
                           if(colorPlane == 3) 
                           { 
                              colorPlane = 0; 
                              y++;
                           }
                        }
                        else
                           y++;
                        iptr = y*bitmap.stride;
                        if(div)
                        {
                           if(last == padder && count <= 63-div && 
                             (colorPlane || bitmap.pixelFormat == pixelFormat8))
                              count += div;
                           else
                           {
                              pad = true;
                              break;
                           }
                        }
                        if(!colorPlane)
                           break;
                     }
                     if(count >= 63) 
                        break;
                  }
                  if((count>1)||(last>=192))
                     if(!f.Putc((byte)(count+192))) { errorWriting = true; break; }
                  if(!f.Putc(last)) { errorWriting = true; break; }
                  count = 0;
                  if(pad)
                  {
                     pad = false;
                     // Padding can mix with rest between 2 color planes in a scan line
                     if(colorPlane || bitmap.pixelFormat == pixelFormat8)
                     {
                        count = div;
                        last = padder;
                     }
                     else
                     {
                        if(div>1)
                           if(f.Putc((byte)(div+192))) { errorWriting = true; break; }
                        if(f.Putc(padder)) { errorWriting = true; break; }
                     }
                  }
               }

               if(!errorWriting)
               {
                  // Save palette
                  if(bitmap.pixelFormat == pixelFormat8)
                  {
                     byte palette[768];
                     // Shift palette 2 bytes left
                     for(c=0; c<256; c++)
                     {
                        palette[c*3]   = bitmap.palette[c].color.r;
                        palette[c*3+1] = bitmap.palette[c].color.g;
                        palette[c*3+2] = bitmap.palette[c].color.b;
                     }
                     if(f.Putc(0x0C))
                        if(f.Write(palette, 768, 1))
                           result = true;
                  }
                  else
                     result = true;
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
         PCXHead header;
         if(f.Read(&header,sizeof(header),1))
         {
            if(header.colorPlanes == 1)
            {
               byte palette[768];

               f.Seek(-768, end);
               if(f.Read(palette, 768, 1))
               {
                  if((result = new ColorAlpha[256]))
                  {
                     uint c;
                     for(c=0; c<256; c++)
                        result[c] = ColorAlpha { 255, { palette[c*3], palette[c*3+1], palette[c*3+2] } };
                  }
               }
            }
         }
         delete f;
      }   
      return result;
   }
}
