import "ecere"

enum DrawingMode { line, fill };
public struct ShortPoint { uint16 x, y; };

class PointStack : Array<ShortPoint>
{
   // How to implement a Pop in Array?
   ShortPoint Pop()
   {
      ShortPoint value;
      Iterator<ShortPoint> it { this, pointer = GetLast() };
      value = it.data;
      it.Remove();
      return value;
   }
}

void FloodFill(Surface surface, int x0, int y0, ColorAlpha newColor)
{
   Bitmap bitmap = surface.bitmap;
   ColorAlpha * picture = (ColorAlpha *)bitmap.picture + (y0 * bitmap.stride) + x0;
   ColorAlpha oldColor = *picture;

   if(oldColor != newColor)
   {
      PointStack stack { minAllocSize = 16 };
      stack.Add({ (uint16)x0, (uint16)y0 });
      while(stack.count > 0)
      {
         ShortPoint point = stack.Pop();

         picture = (ColorAlpha *)bitmap.picture + (point.y * bitmap.stride) + point.x;
         if(*picture == oldColor)
         {
            ColorAlpha * pic, * pictureUp, * pictureDown;
            int x = point.x, sx = point.x;
            int y = point.y;
            bool upIn = false, downIn = false;

            while(x > 0)
            {
               x--;
               picture--;
               if(*picture != oldColor) break;
               sx = x;
            }

            pic = picture = (ColorAlpha *)bitmap.picture + (y * bitmap.stride) + sx;
            pictureUp = (y > 0) ? (picture - bitmap.stride) : null;
            pictureDown = (y < bitmap.height - 1) ? (picture + bitmap.stride) : null;

            for(x = sx; x < bitmap.width; x++)
            {
               if(pictureUp)
               {
                  if(*pictureUp == oldColor)
                  {
                     if(!upIn)
                        stack.Add({ (uint16)x, (uint16)y - 1});
                     upIn = true;
                  }
                  else
                     upIn = false;
                  pictureUp++;
               }
               if(pictureDown)
               {
                  if(*pictureDown == oldColor)
                  {
                     if(!downIn)
                        stack.Add({ (uint16)x, (uint16)y + 1});
                     downIn = true;
                  }
                  else
                     downIn = false;
                  pictureDown++;
               }
               pic++;
               if(*pic != oldColor) break;
            }
            if(x == bitmap.width) x--;
            FillBytesBy4(picture, newColor, x - sx + 1);
         }
      }
      delete stack;
   }
}

class DrawingArea : Window
{
   bool drawing;
   Color color;
   DrawingMode drawingMode;

   Point start, end;

   color = black;

   hasVertScroll = true;
   hasHorzScroll = true;
   borderStyle = deep;

   Bitmap bitmap
   {

   };

   void OnRedraw(Surface surface)
   {
      surface.Blit(bitmap, 0, 0, scroll.x, scroll.y, clientSize.w, clientSize.h);
      surface.foreground = black;
      surface.Rectangle(-1, -1, bitmap.width, bitmap.height);
      if(drawing)
      {
         surface.foreground = color;
         surface.DrawLine(start.x - scroll.x, start.y - scroll.y, end.x - scroll.x, end.y - scroll.y);
      }
   }

   void OnVScroll(ScrollBarAction action, int position, Key key)
   {
      Update(null);
   }

   void OnHScroll(ScrollBarAction action, int position, Key key)
   {
      Update(null);
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(x >= 0 && y >= 0 && x < bitmap.width && y < bitmap.height)
      {
         switch(drawingMode)
         {
            case line:
               end = start = { x + scroll.x, y + scroll.y };
               drawing = true;
               Capture();
               break;
            case fill:
            {
               Surface surface = bitmap.GetSurface(0,0,null);
               surface.background = color;
               FloodFill(surface, x + scroll.x, y + scroll.y, color);
               delete surface;
               Update(null);
               break;
            }
         }
      }
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      end = { x + scroll.x, y + scroll.y };
      if(drawing) Update(null);
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      end = { x + scroll.x, y + scroll.y };
      if(drawing)
      {
         Surface surface = bitmap.GetSurface(0,0,null);
         surface.foreground = color;
         surface.DrawLine(start.x, start.y, end.x, end.y);
         delete surface;
         Update(null);
         drawing = false;
         ReleaseCapture();
      }
      return true;
   }

   void Clear()
   {
      Surface surface;
      surface = bitmap.GetSurface(0,0,null);
      surface.background = white;
      surface.Clear(colorBuffer);
      delete surface;
      Update(null);
   }

   DrawingArea()
   {
      bitmap.Allocate(null, 800, 600, 0, pixelFormat888, false);
      Clear();
      scrollArea = { bitmap.width, bitmap.height };
   }
}

class PaintWindow : Window
{
   text = "Ecere Paint";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };

   Window colorBox
   {
      this,
      position = { 18, 150 }, size = { 64, 64 };
      borderStyle = deep;
      background = black;

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
         ColorPicker dialog { color = paintWindow.drawingArea.color };
         incref dialog;
         if(dialog.Modal() == ok)
         {
            paintWindow.drawingArea.color = dialog.color;
            paintWindow.colorBox.background = paintWindow.drawingArea.color;
            paintWindow.colorBox.Update(null);
         }
         delete dialog;
         return true;
      }

   };
   DrawingArea drawingArea
   {
      this,
      anchor = { 100, 8, 8, 8 };
   };

   Button lineBtn
   {
      this, text = "Line", position = { 24, 24 };
      toggle = true; checked = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         fillBtn.checked = false;
         drawingArea.drawingMode = line;
         return true;
      }
   };
   Button fillBtn
   {
      this, text = "Fill", position = { 24, 64 };
      toggle = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         lineBtn.checked = false;
         drawingArea.drawingMode = fill;
         return true;
      }
   };
   Button clearBtn
   {
      this, text = "Clear", position = { 24, 104 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         lineBtn.checked = false;
         drawingArea.Clear();
         return true;
      }
   };
}

PaintWindow paintWindow {};
