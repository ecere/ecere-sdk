import "ecere"

class Form1 : Window
{
   background = 0;
   opacity = 0;
   font = { "Arial", 40 };
   size = { 320, 60 };
   //displayDriver = "OpenGL";
   moveable = true;
   alphaBlend = true;
   stayOnTop = true;
   showInTaskBar = false;

   Timer timer
   {
      userData = this, started = true, delay = 0.2;

      bool DelayExpired()
      {
         Update(null);
         return true;
      }
   };

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      MenuWindowMove(null, mods);
      return true;
   }
   bool OnKeyDown(Key key, unichar ch)
   {
      if(key == escape) Destroy(0);
      return true;
   }

   void OnRedraw(Surface surface)
   {
      DateTime time;
      surface.Clear(colorBuffer);
      time.GetLocalTime();
      surface.SetForeground({ 128, darkGray });
      surface.WriteTextf(0,0, "%02d:%02d:%02d", 
         time.hour, time.minute, time.second);
      surface.SetForeground({ 192, teal });
      surface.WriteTextf(2, 2, "%02d:%02d:%02d", 
         time.hour, time.minute, time.second);
      
   }
}

Form1 form1 { };
