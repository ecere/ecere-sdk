namespace gui;

import "Window"

public enum SkinBitmap { minimize, maximize, restore, close };

public class Skin
{
public:
   class_data char * name;
   class_data bool textMode;
   class_data Color selectionColor;
   class_data Color disabledBackColor;
   class_data Color disabledFrontColor;

   class_property(disabledFrontColor) = Color { 128,128,128 };
   class_property(disabledBackColor) = (Color)white;

   class_property char * name
   {
      set { class_data(name) = value; }
      get { return class_data(name); }
   }

   class_property bool textMode
   {
      set { class_data(textMode) = value; }
      get { return class_data(textMode); }
   }

   class_property Color selectionColor
   {
      set { class_data(selectionColor) = value; }
      get { return class_data(selectionColor); }
   }

   class_property Color disabledFrontColor
   {
      set { class_data(disabledFrontColor) = value; }
      get { return class_data(disabledFrontColor); }
   }

   class_property Color disabledBackColor
   {
      set { class_data(disabledBackColor) = value; }
      get { return class_data(disabledBackColor); }
   }

   virtual FontResource ::SystemFont();
   virtual FontResource ::CaptionFont();
   virtual void ::GetDecorationsSize(Window, MinMaxValue *, MinMaxValue *);
   virtual void ::SetWindowMinimum(Window, MinMaxValue *, MinMaxValue *);
   virtual void ::SetWindowArea(Window, int *, int *, MinMaxValue *, MinMaxValue *, MinMaxValue *, MinMaxValue *);
   virtual void ::ShowDecorations(void *, Surface, Window, char *, bool, bool);
   virtual bool ::IsMouseMoving(Window, int, int, int, int);
   virtual bool ::IsMouseResizing(Window, int, int, int, int, bool *, bool *, bool *, bool *);
   virtual char * ::CursorsBitmaps(uint id, int *hotSpotX, int *hotSpotY, byte ** paletteShades);
   virtual BitmapResource ::GetBitmap(SkinBitmap);
   virtual void ::UpdateNonClient(void *);
   virtual int ::VerticalSBW();
   virtual int ::HorizontalSBH();
};
