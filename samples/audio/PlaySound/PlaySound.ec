import "EcereAudio"

class MainWindow : Window
{
   text = "Playing a sound";
   background = black;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 576, 432 };

   Mixer mixer { };
   Sound sound10 { "10.wav" };

   bool OnCreate()
   {
      mixer.systemHandle = systemHandle;
      return true;
   }

   void OnDestroy()
   {
      delete mixer;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case space: mixer.Play(sound10, 1.0,  0, 1); break;
         case left: mixer.Play(sound10,  1.0, -1, 1); break;
         case right: mixer.Play(sound10, 1.0,  1, 1); break;
      }
      return true;
   }
}

MainWindow mainWindow { };
