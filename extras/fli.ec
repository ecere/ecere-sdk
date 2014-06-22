/****************************************************************************
   FLC/FLI Player

   Copyright (c) 2001 Jerome Jacovella-St-Louis
   All Rights Reserved.

****************************************************************************/
import "ecere"

#pragma pack(push,1)

struct FLIheader
{
   uint size              __attribute__((packed));
   uint16 magic           __attribute__((packed));
   uint16 frame           __attribute__((packed));
   uint16 width           __attribute__((packed));
   uint16 height          __attribute__((packed));
   uint16 depth           __attribute__((packed));
   uint16 flags           __attribute__((packed));
   uint16 speed           __attribute__((packed));
   uint next              __attribute__((packed));
   uint frit              __attribute__((packed));
   byte expand[102];
};

struct FLIFrame
{
   uint size              __attribute__((packed));
   uint16 magic           __attribute__((packed));
   uint16 chunknum        __attribute__((packed));
   byte nothing[8];
};

struct FLIchunk
{
   uint size              __attribute__((packed));
   uint16 type            __attribute__((packed));
};

#pragma pack(pop)

#define FLI_COLOR       11  //RGB ranging from 0-63
#define FLI_BLACK       13  //When creating a new frame
#define FLI_COPY        16  //Raw

#define FLI_LC          12  //Line compression (common)
#define FLI_BRUN        15  //First frame only
#define FLI_DELTA       7   //Delta (common)
#define FLI_256_COLOR   4   //RGB ranging from 0-255
#define FLI_MINI        18  //That's shit

class Fli
{
   // Private
   FLIheader header;
   FLIFrame fliFrame;
   FLIchunk chunk;
   File f;

   void FliColor(Bitmap bitmap)
   {
      uint16 skip=0, put;
      uint16 num;
      uint16 c;
      byte palette[768];
      f.Read(&num,sizeof(uint16),1);
      for(; num>0; num--)
      {
         byte ch;

         f.Getc((char *)&ch);
         skip+=ch;
         f.Getc((char *)&ch);
         put=ch;

         if(!put)
            put=256;
         f.Read(palette+skip*3,1,3*put);

         if(chunk.type!=FLI_256_COLOR)
            for(c=0; c<put*3; c++)
               palette[c+skip*3]*=4;
         for(c=skip; c<skip+put; c++)
            this.palette[c] = ColorAlpha {255, Color{palette[c*3],palette[c*3+1],palette[c*3+2]}};
         CopyBytesBy4(bitmap.palette+skip,this.palette+skip,put);
         skip+=put;
      }
      palUpdate=true;
   }

   void Lc(Bitmap bitmap)
   {
      uint offset;
      short skipline, putline;
      byte value;
      short num;
      signed char put;

      f.Read(&skipline,sizeof(uint16),1);
      f.Read(&putline,sizeof(uint16),1);
      for(; putline>0; putline--, skipline++)
      {
         byte ch;
         offset=skipline*bitmap.width;
         f.Getc((char *)&ch);
         num = ch;
         for(; num>0; num--)
         {
            f.Getc((char *)&ch);
            offset += ch;
            f.Getc((char *)&ch);
            put = ch;
            if(put>0)
            {
               f.Read(bitmap.picture+offset,1,put);
               offset+=put;
            }
            else if(put<0)
            {
               f.Getc((char *)&value);
               FillBytes(bitmap.picture+offset,value,-put);
               offset-=put;
            }
         }
      }
   }

   void Delta(Bitmap bitmap)
   {
      byte ch;
      short putline;
      int y;
      int offset;

      short num;
      signed char put;
      uint16 value;

      f.Read(&putline,sizeof(uint16),1);

      for(y=0; putline>0; )
      {
         f.Read(&num,sizeof(uint16),1);
         if(!num)break;
         if(num>0)
         {
            offset=y*bitmap.width;
            for(; num>0; num--)
            {
               f.Getc((char *)&ch);
               offset += ch;
               f.Getc((char *)&ch);
               put = ch;

               if(put>0)
               {
                  f.Read(bitmap.picture+offset,1,put*2);
                  offset+=put*2;
               }
               else if(put<0)
               {
                  f.Read(&value,sizeof(uint16),1);
                  FillBytesBy2(bitmap.picture+offset,value,-put);
                  offset-=put*2;
               }
            }
            y++;
            putline--;
         }
         else if(num<0)
            y-=num;
      }
   }

   void Brun(Bitmap bitmap)
   {
      uint offset;
      int y;
      //short num;
      signed char put;
      byte value;
      for(y=0; y<bitmap.height; y++)
      {
         byte ch;
         int x = 0;
         f.Getc((char *)&ch);
         //num = ch;
         /*if(!num)
         {
            f.Getc((char *)&ch);
            f.Getc((char *)&ch);
            FillBytes(bitmap.picture,ch,bitmap.size);
            return;
         }*/
         offset=bitmap.width*y;
         // for(; num>0 && x < bitmap.width; num--)
         for(; x < bitmap.width; )
         {
            f.Getc((char *)&ch);
            put = ch;
            if(put<0)
            {
               f.Read(bitmap.picture+offset,1,-put);
               offset-=put;
               x-=put;
            }
            else if(put>0)
            {
               f.Getc((char *)&value);
               if(offset > bitmap.width * bitmap.height)
                  printf("bug");
               FillBytes(bitmap.picture+offset,value,put);
               offset += put;
               x+=put;
            }
         }
      }
   }

   // Public
   int width, height;
   double speed;
   ColorAlpha palette[256];
   int numFrames;
   int frame;
   bool palUpdate;

   property int width { get { return width; } }
   property int height { get { return height; } }
   property double speed { get { return speed; } }
   property ColorAlpha * palette { get { return palette; } }
   property int numFrames { get { return numFrames; } }
   property int frame { get { return frame; } set { frame = value; } }
   property bool palUpdate { get { return palUpdate; } set { palUpdate = value; }}

   bool Load(const char *fileName)
   {
      bool result = false;
      //f=FileOpen(fileName, read);
      f = FileOpenBuffered(fileName, read);
      if(f)
      {
         f.Read(&header,sizeof(FLIheader),1);
         if(header.magic<0xAF12)
            header.speed = header.speed * 100 / 7;
         speed = header.speed / 1000.0;
         palUpdate=false;
         frame=0;
         width = header.width;
         height = header.height;
         FillBytesBy4(palette,0,256);
         numFrames = header.frame;

         result = true;
      }
      return result;
   }

   void PlayFrame(Bitmap bitmap)
   {
      int nextf,nextc;

      if(!f) return;
      if(frame==header.frame)
        frame=0;
      if(!frame)
         f.Seek(128L, start);

      f.Read(&fliFrame,sizeof(FLIFrame),1);
      nextf=f.Tell()+fliFrame.size-sizeof(FLIFrame);
      for(; fliFrame.chunknum>0; fliFrame.chunknum--)
      {
         f.Read(&chunk,sizeof(FLIchunk),1);
         nextc=f.Tell()+chunk.size-sizeof(FLIchunk);
         switch(chunk.type)
         {
            case FLI_COLOR:      FliColor(bitmap); break;
            case FLI_256_COLOR:  FliColor(bitmap); break;
            case FLI_BRUN:       Brun(bitmap); break;
            case FLI_LC:         Lc(bitmap); break;
            case FLI_DELTA:      Delta(bitmap); break;
            case FLI_BLACK:      FillBytes(bitmap.picture,0,bitmap.size); break;
            case FLI_COPY:       f.Read(bitmap.picture,1,bitmap.size);  break;
         }
         f.Seek(nextc, start);
      }
      f.Seek(nextf, start);
      frame++;
   }

   bool Save(char *fileName, Bitmap bitmap, int frames, int speed)
   {
      f=FileOpen(fileName, write);
      if(!f)
         return false;
      header.size=sizeof(FLIheader)+
                       sizeof(FLIchunk)+768+
                       (sizeof(FLIFrame)+sizeof(FLIchunk)+bitmap.size)*frames;

      header.magic=0xAF12;
      header.frame=(uint16)frames;
      header.width=(uint16)bitmap.width;
      header.height=(uint16)bitmap.height;
      header.depth=8;
      header.flags=0;
      header.speed=(uint16)speed;
      header.next=0;
      header.frit=0;
      FillBytes(header.expand,0,102);
      f.Write(&header,sizeof(FLIheader),1);
      frame=0;
      FillBytesBy4(palette,0,256);
      return true;
   }

   void SaveFrame(Bitmap bitmap, ColorAlpha * palette)
   {
      uint16 num;
      int c;
      fliFrame.magic=0xF1FA;
      fliFrame.chunknum=1;
      fliFrame.size=sizeof(FLIFrame)+sizeof(FLIchunk)+bitmap.size;
      if(!frame)
      {
         fliFrame.chunknum++;
         fliFrame.size+=sizeof(FLIchunk)+772;
      }
      FillBytes(fliFrame.nothing,0,8);
      f.Write(&fliFrame,sizeof(FLIFrame),1);

      if(!frame)
      {
         //Color chunk
         CopyBytesBy4(palette,palette,256);
         chunk.size=sizeof(FLIchunk)+772;
         chunk.type=FLI_COLOR;
         f.Write(&chunk,sizeof(FLIchunk),1);
         num=1;
         f.Write(&num,sizeof(uint16),1);
         num=0;
         f.Write(&num,sizeof(uint16),1);
         for(c=0; c<256; c++)
         {
            f.Putc(palette[c].color.r);
            f.Putc(palette[c].color.g);
            f.Putc(palette[c].color.b);
         }
      }
      //Copy chunk
      chunk.size=sizeof(FLIchunk)+bitmap.size;
      chunk.type=FLI_COPY;
      f.Write(&chunk,sizeof(FLIchunk),1);
      f.Write(bitmap.picture,1,bitmap.size);
   }

   /*
   ~Fli()
   {
      delete f;
   }
   */
}
