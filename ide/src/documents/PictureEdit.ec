/****************************************************************************
   ECERE IDE

   Copyright (c) 2003 Jerome Jacovella-St-Louis
   All Rights Reserved.
   
   pictureEdit.ec - Picture Editor Control
****************************************************************************/
#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

#define ID_IMAGE_MODE_COLORTABLE 9
#define ID_IMAGE_MODE_INDEXED    10
#define ID_IMAGE_MODE_RGB        11

static Array<FileFilter> filters
{ [
   { $"Image Files (*.jpg, *.jpeg, *.bmp, *.pcx, *.png, *.gif)", "jpg, jpeg, bmp, pcx, png, gif" },
   { $"All files", null }
] };

static Array<FileType> types
{ [
   { $"Based on extension", null,  never },
   { $"JPG Image",          "jpg", always },
   { $"BMP Image",          "bmp", always },
   { $"PCX Image",          "pcx", always },
   { $"PNG Image",          "png", always },
   { $"GIF Image",          "gif", always }
] };

FileDialog pictureEditFileDialog { filters = filters.array, sizeFilters = filters.count * sizeof(FileFilter), types = types.array, sizeTypes = types.count * sizeof(FileType) };

class PictureEdit : Window
{
   background = black;
   isDocument = true;
   isActiveClient = true;
   menu = Menu { };

   OnHScroll = OnScroll;
   OnVScroll = OnScroll;

   float zoomFactor;
   char fileName[MAX_LOCATION];
   Bitmap bitmap;
   
   //saveDialog = pictureEditFileDialog;
   
   Menu fileMenu { menu, $"File", f }
      MenuItem { fileMenu, $"Save", s, ctrlS, NotifySelect = MenuFileSave };
      MenuItem { fileMenu, $"Save As...", a, NotifySelect = MenuFileSaveAs };
   Menu imageMenu { menu, $"Image", i };
      Menu modeMenu { imageMenu, $"Mode", m };
         MenuItem imageModeIndexedItem
         {
            modeMenu, $"Indexed Color...", i, isRadio = true;
            bool NotifySelect(MenuItem selection, Modifiers mods)
            {
               ColorAlpha * palette = bitmap.Quantize(0, 255);
               /*
               eBitmap_Convert(null, bitmap, PixelFormat8, palette);
               bitmap.allocatePalette = true;
               */               
               
               imageModeColorTableItem.disabled = false;
               Update(null);
               modifiedDocument = true;
               return true;
            }
         };
         MenuItem imageModeRGBItem
         {
            modeMenu, $"RGB Color", r, isRadio = true;
            bool NotifySelect(MenuItem selection, Modifiers mods)
            {
               bitmap.Convert(null, pixelFormat888, null);
               imageModeColorTableItem.disabled = true;
               Update(null);
               modifiedDocument = true;
               return true;
            }
         };
         MenuDivider { modeMenu };
         MenuItem imageModeColorTableItem
         {
            modeMenu, $"Color Table", r;
            bool NotifySelect(MenuItem selection, Modifiers mods)
            {
               PictureEditColorTable colorTable { master = this };
               colorTable.Modal();
               Update(null);
               return true;
            }
         };
         #ifdef _DEBUG
         MenuDivider { imageMenu };
         MenuItem adjustHSVItem
         {
            imageMenu, $"Adjust Hue, Saturation, Value", h;
            bool NotifySelect(MenuItem selection, Modifiers mods)
            {
               AdjustHSV adjustHSV { master = this };
               adjustHSV.Modal();
               Update(null);
               return true;
            }
         };
         #endif
   
   property char * bitmapFile
   {
      set
      {
         if(value)
         {
            strcpy(fileName, value);
         }
         if(fileName[0])
         {
            bitmap = Bitmap {};
            if(bitmap.Load(fileName, null, null))
            {
               if(bitmap.pixelFormat == pixelFormatRGBA)
                  bitmap.Convert(null, pixelFormat888, null);

               //if(!eWindow_GetStartWidth(window) || !eWindow_GetStartHeight(window))
               {
                  Size size = initSize;  // what's the use of retrieving initSize
                  size.w = bitmap.width;
                  size.h = bitmap.height;
                  clientSize = size;

                  /*
                  Move(eWindow_GetStartX(window), eWindow_GetStartY(window), 
                     (!eWindow_GetStartWidth(window)) ? (A_CLIENT|bitmap.width) : eWindow_GetStartWidth(window), 
                     (!eWindow_GetStartHeight(window)) ? (A_CLIENT|bitmap.height) : eWindow_GetStartHeight(window));
                  */

                  /*
                  Move(eWindow_GetStartX(window), eWindow_GetStartY(window), 
                     (!) ? (A_CLIENT|bitmap.width) : eWindow_GetStartWidth(window), 
                     (!eWindow_GetStartHeight(window)) ? (A_CLIENT|bitmap.height) : eWindow_GetStartHeight(window));
                  */
               }
               scrollArea = Size {bitmap.width, bitmap.height };
            }
            else
               delete bitmap;
         }

         if(bitmap)
         {
            switch(bitmap.pixelFormat)
            {
               case pixelFormat8:
                  imageModeIndexedItem.checked = true;
                  break;
               case pixelFormat888:
                  imageModeRGBItem.checked = true;
                  imageModeColorTableItem.disabled = true;
                  break;
            }
         }
      }
   }

   void OnRedraw(Surface surface)
   {
      if(bitmap)
      {
         int w = (int)(bitmap.width * zoomFactor);
         int h = (int)(bitmap.height * zoomFactor);
         if(w == bitmap.width && h == bitmap.height)
         {
            surface.Blit(bitmap, 
               Max(0, (clientSize.w - w) / 2), Max(0, (clientSize.h - h) / 2), 
               scroll.x, scroll.y, w, h);
         }
         else
         {
            surface.Filter(bitmap, 
               Max(0, (clientSize.w - w) / 2), Max(0, (clientSize.h - h) / 2), 
               (int)(scroll.x / zoomFactor), (int)(scroll.y / zoomFactor), w, h, 
               bitmap.width, bitmap.height);
         }
      }
   }

   void OnScroll(ScrollBarAction action, int position, Key key)
   {
      Update(null);
   }

   bool OnKeyHit(Key key, unichar ch)
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
               scrollArea = Size { bitmap.width * zoomFactor,  bitmap.height * zoomFactor };

               scroll = Point { 
                     (int)(Max(0, bitmap.width * zoomFactor - clientSize.w) * x), 
                     (int)(Max(0, bitmap.height * zoomFactor - clientSize.h) * y) };

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
               if(bitmap.height * zoomFactor > clientSize.w) 
                  y = scroll.y / (bitmap.height * zoomFactor - clientSize.h);

               zoomFactor /= 1.5;
               scrollArea = Size { bitmap.width * zoomFactor, bitmap.height * zoomFactor };

               scroll = Point { 
                     (int)(Max(0, bitmap.width * zoomFactor - clientSize.w) * x),
                     (int)(Max(0, bitmap.height * zoomFactor - clientSize.h) * y) };

               Update(null);
            }
            break;
      }
      return true;
   }

   bool OnSaveFile(char * fileName)
   {
      bool result = false;
      if(bitmap)
      {
         if(bitmap.Save(fileName, 
            ((FileType *)pictureEditFileDialog.types)[pictureEditFileDialog.fileType].typeExtension, (void *) bool::true))
         {
            modifiedDocument = false;
            result = true;
         }
      }
      return result;
   }
   
   PictureEdit()
   {
      zoomFactor = 1.0f;
      return true;
   }

}

class PictureEditColorTable : Window
{
   hasClose = true;
   text = $"Color Table";
   background = formColor;
   minClientSize = Size { 400, 400 };

   Button button
   {
      parent = this, hotKey = escape, size = { 80 }, text = $"Close";
      anchor = Anchor { right = 10, bottom = 10 };
      NotifyClicked = ButtonCloseDialog;
   };

   void OnRedraw(Surface surface)
   {
      PictureEdit picture = (PictureEdit)master;
      Bitmap bitmap = picture.bitmap;
      int c;
      for(c = 0; c < 256; c++)
      {
         int x = (c % 16) * 16;
         int y = (c / 16) * 16;
         surface.SetBackground(bitmap.palette[c]);
         surface.Area(10 + x, 30 + y, 10 + x + 15, 30 + y + 15);
      }
   }
}

class ColorBox : Window
{
   size = { 32, 32 };
   borderStyle = deepContour;
}

#ifdef _DEBUG
class AdjustHSV : Window
{
   size = { 400, 300 };

   background = formColor;
   ColorHSV target;
   ColorHSV replace;
   replace = { 248, 100, 71 }; //Color { 26, 0, 183 };
   target = { 207, 61, 71 };
   hasClose = true;

   Button button1
   {
      this, text = $"Go", position = { 296, 104 }, isDefault = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         PictureEdit picture = (PictureEdit)master;
         Bitmap bitmap = picture.bitmap;
         double h = 1.0f, s = 0.80f, v = 1.24f;
         double tolH = 1;
         double tolS = 1;
         double tolV = 1;
         
         h = target.h - replace.h;
         s = target.s / replace.s;
         v = target.v / replace.v;

         for(y = 0; y<bitmap.height; y++)
         {
            for(x = 0; x<bitmap.width; x++)
            {
               ColorAlpha color = ((ColorAlpha *)bitmap.picture)[y * bitmap.stride + x];
               ColorHSV hsv = color;
               double diffH = Abs(hsv.h/360 - replace.h/360);
               double diffS = Abs(hsv.s - replace.s)/100.0;
               double diffV = Abs(hsv.v - replace.v)/100.0;
               if(diffH <= tolH && diffS <= tolS && diffV <= tolV)
               {
                  hsv.h += h;
                  hsv.s *= s;
                  hsv.v *= v;
                  color.color = hsv;
                  ((ColorAlpha *)bitmap.picture)[y * bitmap.stride + x] = color;
               }
            }
         }
         picture.Update(null);
         picture.modifiedDocument = true;
         Destroy(0);
         return true;
      }
   };

   EditBox hBox { this, text = "H", size = { 78, 19 }, position = { 176, 80 } };
   EditBox sBox { this, text = "S", size = { 78, 19 }, position = { 176, 120 } };
   EditBox vBox { this, text = "V", size = { 78, 19 }, position = { 176, 160 } };
   Label label1 { this, size = { 7, 13 }, position = { 152, 80 }, labeledWindow = hBox };
   Label label2 { this, size = { 6, 13 }, position = { 152, 120 }, labeledWindow = sBox };
   Label label3 { this, size = { 6, 13 }, position = { 152, 168 }, labeledWindow = vBox };
   ColorBox original { this, position = { 10, 10 }, background = replace };
   ColorBox result { this, position = { 10, 100 }, background = target };
}
#endif
