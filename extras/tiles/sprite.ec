/****************************************************************************
   ECERE Tile Engine

   Copyright (c) 1997-2005 Jerome Jacovella-St-Louis
   All Rights Reserved.

   sprite.ec - Bitmap Sprite System
****************************************************************************/
import "ecere"

struct SpriteFrame
{
   byte xDis, yDis;
   Bitmap bitmap;
};

class Sprite
{
   byte numFrames;
   uint16 maxWidth,maxHeight;
   SpriteFrame *frames;

   ~Sprite()
   {
      Free();
   }

   void Free()
   {
      int c;
      if(frames)
      {
         for(c=0; c<numFrames; c++)
            delete frames[c].bitmap;
         delete frames;
      }
   }

   bool Load(char *bmpname, char *sizefile, bool trans, bool usePaletteShades, ColorAlpha * palette, DisplaySystem displaySystem)
   {
      bool result = false;
      File f = FileOpen(sizefile, read);
      if(f)
      {
         Bitmap bmpFrames {};
         if(bmpFrames.Load(bmpname, null, null))
         {
            f.Getc(&numFrames);
            f.Read(&maxWidth,  sizeof(uint16),1);
            f.Read(&maxHeight, sizeof(uint16),1);
            frames = new0 SpriteFrame[numFrames];
            if(frames)
            {
               uint startY=0;
               int c;
               result = true;
               for(c=0; c<numFrames; c++)
               {
                  byte width,height;
                  f.Getc(&width);
                  f.Getc(&height);
                  f.Getc(&frames[c].xDis);
                  f.Getc(&frames[c].yDis);

                  frames[c].bitmap = Bitmap {};
                  if(frames[c].bitmap.Allocate(null, width,height,0,bmpFrames.pixelFormat, false))
                  {
                     frames[c].bitmap.transparent = trans;
                     frames[c].bitmap.Grab(bmpFrames,0,startY);

                     frames[c].bitmap.palette = palette;
                     if(!usePaletteShades)
                     {
                        if(displaySystem)
                           frames[c].bitmap.MakeDD(displaySystem);
                        if(!frames[c].bitmap)
                           Logf("Couldn't adapt bitmap %s.\n", bmpname);
                     }
                     startY+=height;
                  }
                  else
                  {
                     delete frames[c].bitmap;
                     result = false;
                     Logf("Couldn't allocate bitmap loading sprite %s.\n", bmpname);
                     break;
                  }
               }
            }
            else
               Logf("Couldn't allocate frames for sprite %s.\n", bmpname);
         }
         else
            Logf("Couldn't load sprite bitmap %s.\n", bmpname);

         delete bmpFrames;
         delete f;
         if(!result)
            Free();
      }
      else
         Logf("Couldn't load sprite info %s.\n", sizefile);
      return result;
   }

   void DisplayFrame(Surface surface, int frameNum, int x, int y, bool flip, byte * inPal)
   {
      SpriteFrame * frame;
      int dx,dy;
      int lx = 0,ly = 0;
      int rx, ry;

      if(!frames) return;

      frame = &frames[frameNum];
      if(!frame) return;
      rx=frame->bitmap.width;
      ry=frame->bitmap.height;
      if(flip)
      {
         dx = x-(frame->xDis+frame->bitmap.width)+maxWidth;
         dy = y+frame->yDis;
      }
      else
      {
         dx = x+frame->xDis;
         dy = y+frame->yDis;
      }

      if(inPal)
         frame->bitmap.paletteShades = inPal;

      surface.Blit(frame->bitmap, dx,dy, lx,ly, flip?(-rx):(rx), ry);
   }
};
