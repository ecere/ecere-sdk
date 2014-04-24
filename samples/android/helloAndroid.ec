import "ecere"

class AndroidApp : GuiApplication
{
   ColorHSV color;
   color = red;
   bool Cycle(bool idle)
   {
      color.h += Degrees { 1 };
      if(color.h >= Degrees { 360 }) color.h = 0;
      mw.background = color;
      mw.Update(null);
      return true;
   }
}

class MyWindow : Window
{
   BitmapResource bmp { "<:Hello>ecere sdk.png", window = this, alphaBlend = true };
   hasClose = true;
   anchor = { 0,0,0,0 };

   void OnRedraw(Surface surface)
   {
      surface.background = green;
      surface.Area(100, 100, 300, 300);
      if(bmp.bitmap)
      {
         surface.Stretch(bmp.bitmap, 0,0, 0,0, 350, 350, bmp.bitmap.width, bmp.bitmap.height);
      }
   }
}

MyWindow mw { };
MessageBox hello { mw, contents = "Hello, Android!!" };
