import "EcereAudio"

class Form1 : Window
{
   text = "Form1";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };

   Sound sound { };
   int pos;

   Button button1
   {
      this, text = "Play", position = { 200, 168 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         pos = 0;
         PauseAudio(0);
         return true;
      }
   };

   bool OnPostCreate()
   {
      if(sound.Load("test.wav"))
      {
         AudioSpec wantedSpec
         {
            freq = sound.frequency; //44100;
            bits = sound.bits; //16;
            channels = sound.channels; //2;
            samples = AUDIO_BUFFER_SIZE;
            callback = AudioCallback;
            userdata = this;
            windowHandle = systemHandle;
            volume = 100;
         };
         AudioSpec spec { };

         if(OpenAudio(wantedSpec, spec) < 0)
         {
            MessageBox { contents = "OpenAudio epic fail" }.Modal();
            return false;
         }
         return true;
      }
      else
         MessageBox { contents = "test.wav not found" }.Modal();
      return false;
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
         {
            /*if(s)
            {
               byte value = sound.data[pos-1];
               int c;
               for(c = s; c < len; c++)
               {
                  if(value < 128) value++; else if(value > 128) value--; else break;
                  buffer[c] = value;
               }
               s = c;
            }*/
            memset(buffer + s, 128, len - s);
         }
         else
            memset(buffer + s, 0, len - s);
      }
      memcpy(stream, buffer, len);
   }
}

Form1 form1 { };
