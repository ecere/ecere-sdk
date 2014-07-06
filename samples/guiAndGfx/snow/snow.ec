#ifndef __WIN32__
void XSync();
void * IS_XGetDisplay();
#endif

import "ecere"

define NUMFLAKES = 60;
const char * textString = "Let it snow!";
define backgroundColor = Color { 10, 0, 60 };

class Snowing : Window
{
   caption = "Snowing";
   background = backgroundColor;
   opacity = 0;
   drawBehind = false;
   foreground = red;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };
   font = { "Comic Sans MS", 40, true };
   useSharedMemory = true;

   ColorAlpha * screen, * screenBuffer;
   uint stride;
   int w, h;
   int lastLine;
   Bitmap buffer { };

   Snowing() { RandomSeed((uint)(GetTime() * 100000)); ((GuiApplication)__thisModule).timerResolution = 60; }

   Timer timer
   {
      this, 0.01, true;

      bool DelayExpired()
      {
         Update(null);
         return true;
      }
   };

   void OnRedraw(Surface surface)
   {
      Bitmap bitmap = ((LFBDisplay)display.driverData).bitmap;

      if(buffer.width != bitmap.width || buffer.height != bitmap.height)
      {
         int tw, th;
         int len = strlen(textString);
         stride = bitmap.stride;
         buffer.Allocate(null, bitmap.width, bitmap.height, stride, pixelFormat888, false);
         surface.TextExtent(textString, strlen(textString), &tw, &th);
         w = clientSize.w;
         h = clientSize.h;
         lastLine = h-1;
         screen = (ColorAlpha*)bitmap.picture + (surface.offset.y * stride) + surface.offset.x;
         screenBuffer = (ColorAlpha*)buffer.picture + (surface.offset.y * stride) + surface.offset.x;
         surface.background = backgroundColor;
         surface.Area(0,0, w-1, h-1);
         surface.WriteText((clientSize.w - tw)/2, (clientSize.h - th)/2, textString, len);

         #ifndef __WIN32__
         XSync(IS_XGetDisplay());   // TODO: Need an API for this...
         #endif

         memcpy(buffer.picture, bitmap.picture, buffer.sizeBytes);
      }

      if(screenBuffer)
      {
         int x,y;
         RandLine();
         for(y = lastLine; y >= 0; y--)
         {
            int offset = y * stride;
            bool isLastLine = true;
            for(x = 0; x < w; x++, offset++)
            {
               if(screen[offset].color == white)
                  SnowDown(offset);
               else
                  isLastLine = false;
            }
            if(isLastLine) lastLine = y-1;
         }
         memcpy(bitmap.picture, buffer.picture, buffer.sizeBytes);
      }
   }

   void RandLine()
   {
      int c;
      for(c = 0; c < NUMFLAKES; c++)
         screenBuffer[GetRandom(0, w-1)] = white;
   }
   bool SnowTo(int offset, int add)
   {
      add += offset;
      if(screen[add].color != backgroundColor)
         return false;
      screenBuffer[add] = white;
      screenBuffer[offset] = backgroundColor;
      return true;
   }
   void SnowDown(int offset)
   {
      if(offset < (h-2)*stride + w)
      {
         bool atLeft  = (offset % stride) <= 0;
         bool atRight = (offset % stride) >= w - 1;
         switch(GetRandom(0, 2))
         {
            case 0:
               if(!SnowTo(offset, stride))
               {
                  if(GetRandom(0, 4) == 0)
                  {
                     if(GetRandom(0, 1))
                        (void)((!atLeft && SnowTo(offset, stride-1)) || (!atRight && SnowTo(offset, stride+1)));
                     else
                        (void)((!atRight && SnowTo(offset, stride+1)) || (!atLeft && SnowTo(offset, stride-1)));
                  }
               }
               break;
            case 1: (void)((!atLeft && SnowTo(offset, stride-1)) || (GetRandom(0, 4) == 0 && SnowTo(offset, stride)) || (!atRight && SnowTo(offset, stride+1))); break;
            case 2: (void)((!atRight && SnowTo(offset, stride+1)) || (GetRandom(0, 4) == 0 && SnowTo(offset, stride)) || (!atLeft && SnowTo(offset, stride-1))); break;
         }
      }
   }
}

Snowing snowing {};
