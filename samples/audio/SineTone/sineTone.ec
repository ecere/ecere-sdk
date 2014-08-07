import "EcereAudio"

class ToneSound : private Sound
{
   bits = 16;
   channels = 1;
   frequency = 44100;

   void GenerateTone(float freq, int duration, double volume)
   {
      uint length = this.length = frequency * duration;
      short * data = (short *)(this.data = (byte *)new short[length]);
      int i;

      for(i = 0; i < length; i++)
      {
         Angle x = 2 * Pi * i * freq / frequency;
         ((short *)data)[i] = (short)(sin(x) * volume * 32767);
      }
   }
}

class BeepForm : Window
{
   caption = "Beep";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };

   ToneSound sound { };
   int pos;

   Button button1
   {
      this, caption = "Play", position = { 200, 168 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         pos = 0;
         PauseAudio(0);
         return true;
      }
   };

   bool OnPostCreate()
   {
      AudioSpec wantedSpec
      {
         freq = 44100;
         bits = 16;
         channels = 1;
         samples = AUDIO_BUFFER_SIZE;
         callback = AudioCallback;
         userdata = this;
         windowHandle = systemHandle;
         volume = 100;
      };
      AudioSpec spec { };

      sound.GenerateTone(440, 1, 0.25);   // 1 second of 440Hz A at quarter volume

      if(OpenAudio(wantedSpec, spec) < 0)
      {
         MessageBox { contents = "OpenAudio epic fail" }.Modal();
         return false;
      }
      return true;
   }

   void OnDestroy()
   {
      CloseAudio();
   }

   void AudioCallback(byte *stream, int len)
   {
      static byte buffer[AUDIO_BUFFER_SIZE];
      int s = Min(sound.length * (sound.bits == 16 ? 2 : 1) - pos, len);
      memcpy(buffer, sound.data + pos, s);
      pos += s;
      if(s < len)
      {
         if(sound.bits == 8)
            memset(buffer + s, 128, len - s);
         else
            memset(buffer + s, 0, len - s);
      }
      memcpy(stream, buffer, len);
   }
}

BeepForm beep { };
