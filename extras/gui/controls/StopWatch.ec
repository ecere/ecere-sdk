import "ecere"

class StopWatch : Window
{
   background = darkGray;
   foreground = black;
   clientSize = { 200, 40 };
   font = { "Consolas", 14, true };

   //watch(font) { SetInitSize(initSize); }; // want to use SetInitSize here damn it! :/
   /*watch(font)
   {
      Size size { };
      //
   };*/

   Time time;

   Timer timer
   {
      userData = this, started = false, delay = 0.04;

      bool DelayExpired()
      {
         Update(null);
         return true;
      }
   };

   void start()
   {
      time = GetTime();
      timer.Start();
   }

   void OnRedraw(Surface surface)
   {
      Time t = timer.started ? GetTime() : time;
      Time d = t - time;
      //DateTime time;
      if(opacity > 0)
         surface.Clear(colorBuffer); // todo: fix for partial opacity? alpha value?
      surface.WriteTextf(0, 0, "%02d:%02d.%02d", ((int)d) / 60, ((int)d) % 60, ((int)(d * 1000)) % 100);
      //time.GetLocalTime();
      //surface.SetForeground({ 128, black });
      //surface.WriteTextf(0,0, "%02d:%02d:%02d",
      //   time.hour, time.minute, time.second);
      //surface.SetForeground({ 192, teal });
      //surface.WriteTextf(2, 2, "%02d:%02d:%02d",
      //   time.hour, time.minute, time.second);
   }

   StopWatch()
   {
      time = GetTime();
   }
}