namespace gui::controls;

import "Window"

public class Picture : CommonControl
{
   class_property(icon) = "<:ecere>mimeTypes/image.png";

   background = black;
   opacity = 0;
   drawBehind = true;
   inactive = true;

public:
   property Color tint { set { tint = value; } };   
   property BitmapResource image
   {
      property_category $"Appearance" 
      set
      {
         if(this)
         {
            AddResource(value);
            RemoveResource(bitmapRes);
            bitmapRes = value;
            defaultBitmap = value ? false : true;
            //if(created)
               OnLoadGraphics();
         }
      }

      get
      {
         if(this)
            return defaultBitmap ? null : bitmapRes;
         return null;
      }
   }
   property bool filter { property_category $"Appearance" set { filter = value; } get { return filter; } };
   property Bitmap bitmapImage
   {
      set
      {
         OnUnloadGraphics();

         bitmapImage = value;         

         OnLoadGraphics();
      }
   }

private:
   BitmapResource bitmapRes;
   float zoomFactor;
   Color tint;
   bool zoom, filter;
   bool defaultBitmap;
   Bitmap bitmapImage;
   Bitmap bitmap;

   Picture()
   {
      zoomFactor = 1.0f;
      tint = white;

      if(isDocument)
      {
         Menu fileMenu;
         menu = Menu { };
         fileMenu = Menu { menu, "File", f };
         MenuItem { fileMenu, $"Save\tCtrl+S", s, ctrlS, NotifySelect = MenuFileSave };
         MenuItem { fileMenu, $"Save As...",   a, NotifySelect = MenuFileSaveAs };
      }
      return true;
   }

   ~Picture()
   {
      if(bitmapImage)
         delete bitmap;
   }

   bool OnLoadGraphics()
   {
      bool result = false;

      if(bitmapImage)
      {
         if(!bitmap)
         {
            bitmap = { };
            
            if(hasHorzScroll || hasVertScroll)
               bitmap.Copy(bitmapImage);
            else if(bitmap.Allocate(null, clientSize.w, clientSize.h, 0, bitmapImage.pixelFormat, false))
            {
               Surface s = bitmap.GetSurface(0,0,null);
               s.Filter(bitmapImage, 0,0,0,0, bitmap.width, bitmap.height, bitmapImage.width, bitmapImage.height);
               delete s;
            }
         }
         bitmap.MakeDD(displaySystem);
      }
      else
      {
         if(!bitmapRes)
         {
            bitmapRes = BitmapResource { fileName = ":mimeTypes/image.png", alphaBlend = true, window = this };
            defaultBitmap = true;
            bitmap = null;
         }
         else
            bitmap = bitmapRes.bitmap;
      }

      SetInitSize(initSize);

      if(bitmap)
      {
         if(zoom || (hasVertScroll || hasHorzScroll))
            SetScrollArea(bitmap.width, bitmap.height, false);
         result = true;
      }
      else if(!isDocument)
         result = true;
      return result;
   }

   void OnUnloadGraphics()
   {
      if(bitmapImage)
      {
         delete bitmap;
      }
   }

   bool OnResizing(int * w, int * h)
   {
      Size size = initSize;
      Anchor anchor = this.anchor;

      if(!size.w && (!anchor.left.type || !anchor.right.type))
      {
         if(bitmap)
            *w = bitmap.width;
         else
            *w = 80;
      }
         
      if(!size.h && (!anchor.top.type || !anchor.bottom.type))
      {
         
         if(bitmap)
            *h = bitmap.height;
         else
            *h = 80;
      }
      return true;
   }

   void OnScroll(ScrollBarAction action, int position, Key key)
   {
      Update(null);
   }

   OnHScroll = OnScroll;
   OnVScroll = OnScroll;

   bool OnKeyHit(Key key, unichar ch)
   {
      Bitmap bitmap = this.bitmap;
      if(zoom)
      {
         switch(key)
         {
            case equal:
            case keyPadPlus:
               if(zoomFactor < 25)
               {
                  float x = 0.5f, y = 0.5f;
                  if(bitmap.width * zoomFactor > clientSize.w) 
                     x = scroll.x / (bitmap.width * zoomFactor - clientSize.w);
                  if(bitmap.height * zoomFactor > clientSize.h) 
                     y = scroll.y / (bitmap.height * zoomFactor - clientSize.h);

                  zoomFactor *= 1.5;
                  SetScrollArea(
                     (int)(bitmap.width * zoomFactor), 
                     (int)(bitmap.height * zoomFactor), false);

                  SetScrollPosition(
                     (int)(Max(0, bitmap.width * zoomFactor - clientSize.w) * x),
                     (int)(Max(0, bitmap.height * zoomFactor - clientSize.h) * y));

                  Update(null);
               }
               break;
            case minus:
            case keyPadMinus:
               if(zoomFactor > 0.05)
               {
                  float x = 0.5f, y = 0.5f;
                  if(bitmap.width * zoomFactor > clientSize.w) 
                     x = scroll.x / (bitmap.width * zoomFactor - clientSize.w);
                  if(bitmap.height * zoomFactor > clientSize.h) 
                     y = scroll.y / (bitmap.height * zoomFactor - clientSize.h);

                  zoomFactor /= 1.5;
                  SetScrollArea(
                     (int)(bitmap.width * zoomFactor), 
                     (int)(bitmap.height * zoomFactor), false);

                  SetScrollPosition(
                     (int)(Max(0, bitmap.width * zoomFactor - clientSize.w) * x),
                     (int)(Max(0, bitmap.height * zoomFactor - clientSize.h) * y));

                  Update(null);
               }
               break;
         }
      }
      return true;
   }

   void OnRedraw(Surface surface)
   {
      Bitmap bitmap = this.bitmap;
      if(bitmap)
      {
         surface.blitTint = tint;
         if(zoom)
         {
            int w = (int)(bitmap.width * zoomFactor);
            int h = (int)(bitmap.height * zoomFactor);
            if(w == bitmap.width && h == bitmap.height)
            {
               surface.Blit(bitmap, 
                  Max(0, (clientSize.w - w) / 2), Max(0, (clientSize.h - h) / 2), 
                  scroll.x,scroll.y, w, h);
            }
            else
            {
               if(filter)
                  surface.Filter(bitmap, 
                     Max(0, (clientSize.w - w) / 2), Max(0, (clientSize.h - h) / 2), 
                     (int)(scroll.x / zoomFactor), (int)(scroll.y / zoomFactor), w, h, 
                     bitmap.width, bitmap.height);
               else
                  surface.Stretch(bitmap, 
                     Max(0, (clientSize.w - w) / 2), Max(0, (clientSize.h - h) / 2), 
                     (int)(scroll.x / zoomFactor), (int)(scroll.y / zoomFactor), w, h, 
                     bitmap.width, bitmap.height);
            }
         }
         else
         {
            int w = bitmap.width;
            int h = bitmap.height;
            if(clientSize.w == bitmap.width && clientSize.h == bitmap.height)
               surface.Blit(bitmap, 
                  Max(0, (clientSize.w - w) / 2), Max(0, (clientSize.h - h) / 2),
                  scroll.x,scroll.y, 
                  hasHorzScroll ? clientSize.w : bitmap.width, hasVertScroll ? clientSize.h : bitmap.height);
            else
            {
               int x = hasHorzScroll ? Max(0, (clientSize.w - w) / 2) : 0;
               int y = hasVertScroll ? Max(0, (clientSize.h - h) / 2) : 0;
               int sx = scroll.x, sy = scroll.y;
               int w = clientSize.w, h = clientSize.h;
               int sw = hasHorzScroll ? clientSize.w : bitmap.width, sh = hasVertScroll ? clientSize.h : bitmap.height;
               if(filter)
                  surface.Filter(bitmap, x, y, sx, sy, w, h, sw, sh);
               else
                  surface.Stretch(bitmap, x, y, sx, sy, w, h, sw, sh);
            }
         }
      }
   }
}
