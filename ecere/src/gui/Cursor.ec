namespace gui;

import "Window"

public enum SystemCursor { arrow, iBeam, cross, moving, sizeNESW, sizeNS, sizeNWSE, sizeWE, hand };

public class Cursor
{
   class_no_expansion

   int OnCompare(Cursor cursor)
   {
      return (this != null) != (cursor != null);
   }
private:
   Cursor prev, next;
   Bitmap bitmap;
   byte * paletteShades;
   int hotSpotX, hotSpotY;
   char * bitmapName;
   SystemCursor systemCursor;
public:
   bool Load(const char * name, int hotSpotX, int hotSpotY, byte * paletteShades, DisplaySystem ds)
   {
      Bitmap bitmap { };
      if(bitmap.LoadT(name, null, ds))
      {
         this.bitmap = bitmap;
         this.hotSpotX = hotSpotX;
         this.hotSpotY = hotSpotY;
         this.paletteShades = paletteShades;
         return true;
      }
      delete bitmap;
      return false;
   }
   void Free()
   {
      if(bitmap)
      {
         bitmap.Free();
         delete bitmap;
      }
   }
   ~Cursor()
   {
      Free();
   }
   property SystemCursor systemCursor { set { systemCursor = value; } }
};
