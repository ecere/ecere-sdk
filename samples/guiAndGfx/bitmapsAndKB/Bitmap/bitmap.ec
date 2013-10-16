import "ecere"

class MainWindow : Window
{
   text = "Bitmap Demo";
   background = black;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 576, 432 };

   BitmapResource castleGfx { ":castle.png", window = this };

   void OnRedraw(Surface surface)
   {
      Bitmap bitmap = castleGfx.bitmap;

      if(bitmap)
         surface.Blit(bitmap, 100, 100, 0,0, bitmap.width, bitmap.height);
   }
}

MainWindow mainWindow {};
