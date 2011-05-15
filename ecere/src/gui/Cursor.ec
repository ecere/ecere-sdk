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
   bool Load(char * name, int hotSpotX, int hotSpotY, byte * paletteShades);
   property SystemCursor systemCursor { set { systemCursor = value; } }
};
