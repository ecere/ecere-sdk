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
   Sound piano { "piano.wav" };
   Sound xylophone { "xylophone.wav" };
   Sound cello { "cello.wav" };
   Sound tone { "tone.wav" };
   Sound instrument;

   Voice lastVoice;

   instrument = piano;

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
      if(instrument == cello && lastVoice)
         lastVoice.volume = 0;

      switch(key)
      {
         case f1: instrument = piano; break;
         case f2: instrument = xylophone; break;
         case f3: instrument = cello; break;
         case f4: instrument = tone; break;

         // The regular octave on the zxcvbn row, sharps above (asdf)
         case z:     lastVoice = mixer.Play(instrument, 1.0, -1, Do); break;
         case x:     lastVoice = mixer.Play(instrument, 1.0, -.8, Re); break;
         case c:     lastVoice = mixer.Play(instrument, 1.0, -.6, Mi); break;
         case v:     lastVoice = mixer.Play(instrument, 1.0, -.4, Fa); break;
         case b:     lastVoice = mixer.Play(instrument, 1.0, -.2, Sol); break;
         case n:     lastVoice = mixer.Play(instrument, 1.0, 0, La); break;
         case m:     lastVoice = mixer.Play(instrument, 1.0, .2, Si); break;
         case comma: lastVoice = mixer.Play(instrument, 1.0, .4, Do*2); break;
         case period:lastVoice = mixer.Play(instrument, 1.0, .6, Re*2); break;
         case slash: lastVoice = mixer.Play(instrument, 1.0, .8, Mi*2); break;
         case s:     lastVoice = mixer.Play(instrument, 1.0, -.9, Do_); break;
         case d:     lastVoice = mixer.Play(instrument, 1.0, -.7, Re_); break;
         case g:     lastVoice = mixer.Play(instrument, 1.0, -.3, Fa_); break;
         case h:     lastVoice = mixer.Play(instrument, 1.0, -.1, Sol_); break;
         case j:     lastVoice = mixer.Play(instrument, 1.0, .1, La_); break;
         case l:     lastVoice = mixer.Play(instrument, 1.0, .5, Do_*2); break;
         case colon: lastVoice = mixer.Play(instrument, 1.0, .7, Re_*2); break;

         // The lower octave on the qwerty row, sharps above (digits)
         case q:     lastVoice = mixer.Play(instrument, 1.0, 0, Do/2); break;
         case w:     lastVoice = mixer.Play(instrument, 1.0, 0, Re/2); break;
         case e:     lastVoice = mixer.Play(instrument, 1.0, 0, Mi/2); break;
         case r:     lastVoice = mixer.Play(instrument, 1.0, 0, Fa/2); break;
         case t:     lastVoice = mixer.Play(instrument, 1.0, 0, Sol/2); break;
         case y:     lastVoice = mixer.Play(instrument, 1.0, 0, La/2); break;
         case u:     lastVoice = mixer.Play(instrument, 1.0, 0, Si/2); break;
         case i:     lastVoice = mixer.Play(instrument, 1.0, 0, Do); break;
         case o:     lastVoice = mixer.Play(instrument, 1.0, 0, Re); break;
         case p:     lastVoice = mixer.Play(instrument, 1.0, 0, Mi); break;
         case k2:    lastVoice = mixer.Play(instrument, 1.0, 0, Do_/2); break;
         case k3:    lastVoice = mixer.Play(instrument, 1.0, 0, Re_/2); break;
         case k5:    lastVoice = mixer.Play(instrument, 1.0, 0, Fa_/2); break;
         case k6:    lastVoice = mixer.Play(instrument, 1.0, 0, Sol_/2); break;
         case k7:    lastVoice = mixer.Play(instrument, 1.0, 0, La_/2); break;
         case k9:    lastVoice = mixer.Play(instrument, 1.0, 0, Do_); break;
         case k0:    lastVoice = mixer.Play(instrument, 1.0, 0, Re_); break;
      }

      return true;
   }
}

MainWindow mainWindow { };
