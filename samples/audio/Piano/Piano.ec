import "EcereAudio"

// There are 12 half-tones in an octave, and the frequency doubles in an octave.
define Do = 1.0;
define Do_ = 1.0594630943592952645618252949463; // The root 12 of 2. 
define Re = Do_*Do_;
define Re_ = Re*Do_;
define Mi = Re_*Do_;
define Fa = Mi*Do_;
define Fa_ = Fa*Do_;
define Sol = Fa_*Do_;
define Sol_ = Sol*Do_;
define La = Sol_*Do_;
define La_ = La*Do_;
define Si = La_*Do_;

class MainWindow : Window
{
   text = "A keyboard piano";
   background = black;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 576, 432 };

   Mixer mixer { };
   Sound ding { "ding.wav" };
   Sound chord { "chord.wav" };
   Sound instrument;

   instrument = ding;

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
         case f1: instrument = ding; break;
         case f2: instrument = chord; break;

         // The regular octave on the zxcvbn row, sharps above (asdf)
         case z:     mixer.Play(instrument, 1.0, -1, Do); break;
         case x:     mixer.Play(instrument, 1.0, -.8, Re); break;
         case c:     mixer.Play(instrument, 1.0, -.6, Mi); break;
         case v:     mixer.Play(instrument, 1.0, -.4, Fa); break;
         case b:     mixer.Play(instrument, 1.0, -.2, Sol); break;
         case n:     mixer.Play(instrument, 1.0, 0, La); break;
         case m:     mixer.Play(instrument, 1.0, .2, Si); break;
         case comma: mixer.Play(instrument, 1.0, .4, Do*2); break;
         case period:mixer.Play(instrument, 1.0, .6, Re*2); break;
         case slash: mixer.Play(instrument, 1.0, .8, Mi*2); break;
         case s:     mixer.Play(instrument, 1.0, -.9, Do_); break;
         case d:     mixer.Play(instrument, 1.0, -.7, Re_); break;
         case g:     mixer.Play(instrument, 1.0, -.3, Fa_); break;
         case h:     mixer.Play(instrument, 1.0, -.1, Sol_); break;
         case j:     mixer.Play(instrument, 1.0, .1, La_); break;
         case l:     mixer.Play(instrument, 1.0, .5, Do_*2); break;
         case colon: mixer.Play(instrument, 1.0, .7, Re_*2); break;

         // The lower octave on the qwerty row, sharps above (digits)
         case q:     mixer.Play(instrument, 1.0, 0, Do/2); break;
         case w:     mixer.Play(instrument, 1.0, 0, Re/2); break;
         case e:     mixer.Play(instrument, 1.0, 0, Mi/2); break;
         case r:     mixer.Play(instrument, 1.0, 0, Fa/2); break;
         case t:     mixer.Play(instrument, 1.0, 0, Sol/2); break;
         case y:     mixer.Play(instrument, 1.0, 0, La/2); break;
         case u:     mixer.Play(instrument, 1.0, 0, Si/2); break;
         case i:     mixer.Play(instrument, 1.0, 0, Do); break;
         case o:     mixer.Play(instrument, 1.0, 0, Re); break;
         case p:     mixer.Play(instrument, 1.0, 0, Mi); break;
         case k2:     mixer.Play(instrument, 1.0, 0, Do_/2); break;
         case k3:     mixer.Play(instrument, 1.0, 0, Re_/2); break;
         case k5:     mixer.Play(instrument, 1.0, 0, Fa_/2); break;
         case k6:     mixer.Play(instrument, 1.0, 0, Sol_/2); break;
         case k7:     mixer.Play(instrument, 1.0, 0, La_/2); break;
         case k9:     mixer.Play(instrument, 1.0, 0, Do_); break;
         case k0:     mixer.Play(instrument, 1.0, 0, Re_); break;
      }
      return true;
   }
}

MainWindow mainWindow { };
