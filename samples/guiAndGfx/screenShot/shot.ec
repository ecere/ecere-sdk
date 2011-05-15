/********************************************************
   This sample demonstrates takes a screenshot of the
   desktop and saves it to a bitmap file.
********************************************************/
import "ecere"

class ShotApp : GuiApplication
{
   bool Init()
   {
      Bitmap bitmap { };
      int c;
      SwitchMode(false, null, 0,0,0, null, false);
      desktop.Grab(bitmap, null, false);
      for(c = 0; c<1000; c++)
      {
         char fileName[MAX_LOCATION];
         sprintf(fileName, "shot%02d.png", c);
         if(!FileExists(fileName))
         {
            bitmap.Save(fileName, null, null);
            break;
         }
      }
      delete bitmap;
      return true;
   }
}
