import "ecere"
import "audio"

#include <string.h>

define AUDIO_BUFFER_SIZE = 21024;

struct WAVEHDR
{
   byte   format[4]           __attribute__((packed));
   uint32 f_len               __attribute__((packed));
   byte   wave_fmt[8]         __attribute__((packed));
   uint32 fmt_len             __attribute__((packed));
   uint16 fmt_tag             __attribute__((packed));
   uint16 channel             __attribute__((packed));
   uint32 samples_per_sec     __attribute__((packed));
   uint32 avg_bytes_per_sec   __attribute__((packed));
   uint16 blk_align           __attribute__((packed));
   uint16 bits_per_sample     __attribute__((packed));
   byte   data[4]             __attribute__((packed));
   uint32 data_len            __attribute__((packed));
};

public class Sound
{
public:
   int frequency, bits, channels, length;
   byte * data;

   ~Sound()
   {
      delete data;
   }

   bool Load(char * fileName)
   {
      bool result = false;
      WAVEHDR header;
      File f = FileOpen(fileName, read);
      if(f)
      {
         if(f.Read(header,sizeof(WAVEHDR),1) && !memcmp(header.format,"RIFF",4) && !memcmp(header.wave_fmt,"WAVEfmt ",8))
         {
            data = new byte[header.data_len];
            if(data)
            {
               int c = f.Read(data, 1, header.data_len);
               if(c)
               {
                  frequency = header.samples_per_sec;
                  bits = header.bits_per_sample;
                  channels = header.channel;
                  length = Min(header.data_len, c);
                  if(c < header.data_len)
                     length -= 2048;
                  result = true;
               }
            }
         }
         delete f;
      }
      return result;
   }
}

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
      int s = Min(sound.length - pos, len);
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
