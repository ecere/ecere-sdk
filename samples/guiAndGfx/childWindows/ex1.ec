import "ecere"

class Child : Window
{
   background = Color { 200,150,0 };
   size = Size { 300, 200 };
   borderStyle = sizable;
   text = "Sizable";

   Button
   {
      this, text = "Push Me", position = { 100, 20 }, size = { 80, 30 };
      bool NotifyClicked(Button button, int x, int y, Modifiers mods) { Destroy(0); return true; }
   };
   ScrollBar { this, direction = vertical, anchor = { left = 0, top = 0, bottom = 0 }, size = Size { 48 } };
   EditBox { this, position = { 50, 80 }, size = { 200, 50 }, foreground = red };
}

class Parent : Window
{
   borderStyle = sizable;
   hasMaximize = true, hasMinimize = true, hasClose = true;
   text = "Hello, Ex1!", position = { 10, 10 }, size = { 1000, 600 };

   BitmapResource bubbles { ":stone2.jpg", window = this, transparent = false };

   void OnRedraw(Surface surface)
   {
      surface.Tile(bubbles.bitmap, 0,0,clientSize.w,clientSize.h);
   }

   Child { this, position = { 100, 100 }, size.h = 150 };
   Child { this, borderStyle = contour, text = "Contour", position = { 200, 300 }, size.w = 500 };
   Child { this, borderStyle = fixed, text = "Fixed", position = { 500, 60 }; };
}

Parent parent { };
