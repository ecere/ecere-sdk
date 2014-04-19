public import "ecere"
import "audio"

#include <string.h>

// public define AUDIO_BUFFER_SIZE = 21024;
public define AUDIO_BUFFER_SIZE = 48000;

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
   property String fileName { set { Load(value); } }

   int frequency, bits, channels, length;
   byte * data;

   ~Sound() { delete data; }

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

                  if(bits == 16)
                     length /= 2;
                  result = true;
               }
            }
         }
         delete f;
      }
      return result;
   }
}

public class Voice
{
public:
   Sound sound;
   double volume, balance, pitch;
   int pos;
   bool looped;
   int loopStart, loopEnd;
}

public class Mixer
{
   AudioSpec spec { };
   Mutex mutex { };

   ~Mixer()
   {
      CloseAudio();
      while(voices.count)
         voices.Delete((void *)voices.array);
   }

   void AudioCallback(byte *stream, int lenToFill)
   {
      static byte buffer[AUDIO_BUFFER_SIZE];
      static float fBuffer[AUDIO_BUFFER_SIZE];
      int c;
      int numSamples = (bits == 16) ? (lenToFill / 2) : lenToFill;
      memset(fBuffer, 0, sizeof(float) * numSamples);
      mutex.Wait();
      for(v : voices)
      {
         Sound sound = v.sound;
         float volume = (float)v.volume;
         float balance = (float)v.balance;
         int freq = (int)(sound.frequency * v.pitch);
         int chn = sound.channels;
         if(sound.bits == 16)
         {
            short * sBuffer = sound.data;
            int se = 0;
            int s = v.pos;
            short sampleL = sBuffer[s];
            short sampleR = (chn == 2) ? sBuffer[s+1] : sampleL;

            for(c = 0; c < numSamples; c++)
            {
               float left  = sampleL * volume / 32767.0f;
               float right = sampleR * volume / 32767.0f;
               if(balance)
               {
                  float v = balance * ((balance < 0) ? right : left);
                  right += v;
                  left  -= v;
               }
               if(channels == 2)
               {
                  fBuffer[c++] += left;
                  fBuffer[c]   += right;
               }
               else
                  fBuffer[c] += (left + right)/2;

               se += freq;
               if(se >= frequency)
               {
                  do
                  {
                     s += chn;
                     se -= frequency;
                  } while(se >= frequency);
                  if(s < sound.length)
                  {
                     sampleL = sBuffer[s];
                     sampleR = (chn == 2) ? sBuffer[s+1] : sampleL;
                  }
                  else
                     break;
               }
            }
            v.pos = s;
         }
         else if(sound.bits == 8)
         {
            byte * sBuffer = sound.data;
            int se = 0;
            int s = v.pos;
            byte sampleL = sBuffer[s];
            byte sampleR = (chn == 2) ? sBuffer[s+1] : sampleL;
            bool looped = v.looped;
            int loopStart = v.loopStart, loopEnd = v.loopEnd;

            for(c = 0; c < numSamples; c++)
            {
               float left  = (sampleL - 127) * volume / 127.0f;
               float right = (sampleR - 127) * volume / 127.0f;;
               if(balance)
               {
                  float v = balance * ((balance < 0) ? right : left);
                  right += v;
                  left  -= v;
               }
               if(channels == 2)
               {
                  fBuffer[c++] += left;
                  fBuffer[c]   += right;
               }
               else
                  fBuffer[c] += (left + right)/2;

               se += freq;
               if(se >= frequency)
               {
                  do
                  {
                     s += chn;
                     if(looped && s >= loopEnd)
                        s = loopStart;
                     se -= frequency;
                  } while(se >= frequency);
                  if(s < sound.length)
                  {
                     sampleL = sBuffer[s];
                     sampleR = (chn == 2) ? sBuffer[s+1] : sampleL;
                  }
                  else
                     break;
               }
            }
            v.pos = s;
         }
      }
      if(bits == 16)
      {
         for(c = 0; c < numSamples; c++)
         {
            int i = (int)(fBuffer[c] * 32767);
            if(i > 32767) i = 32767; else if(i < -32768) i = -32768;
            ((short *)buffer)[c] = (short)i;
         }
      }
      else
      {
         for(c = 0; c < numSamples; c++)
         {
            int i = (int)(fBuffer[c] * 127) + 127;
            if(i > 255) i = 255; else if(i < 0) i = 0;
            buffer[c] = (byte)i;
         }
      }
      memcpy(stream, buffer, lenToFill);
      {
         bool removed;
         do
         {
            removed = false;
            c = 0;
            for(v : voices)
            {
               if(v.pos >= v.sound.length)
               {
                  removed = true;
                  voices.Delete((void *)(voices.array + c));
                  break;
               }
               c++;
            }
         } while(removed);
      }
      mutex.Release();
   }

public:
   void * systemHandle;
   int frequency;
   int bits;
   int channels;
   Array<Voice> voices { };

   frequency = 44100;
   bits = 16;
   channels = 2;

   property void * systemHandle { set { systemHandle = value; Init(); } }

   bool Init()
   {
      AudioSpec wantedSpec
      {
         freq = frequency;
         bits = bits;
         channels = channels;
         samples = AUDIO_BUFFER_SIZE;
         callback = AudioCallback;
         userdata = this;
         windowHandle = systemHandle;
         volume = 100;
      };

      if(!OpenAudio(wantedSpec, spec))
      {
         MessageBox { contents = "OpenAudio failed" }.Modal();
         return false;
      }
      PauseAudio(0);
      return true;
   }

   Voice Play(Sound sound, double volume, double balance, double pitch)
   {
      if(sound && sound.data)
      {
         Voice voice { sound, volume, balance, pitch };
         mutex.Wait();
         voices.Add(voice);
         incref voice;
         mutex.Release();
         return voice;
      }
      return null;
   }

   void Wait()
   {
      mutex.Wait();
   }

   void Release()
   {
      mutex.Release();
   }

   void PlayInVoice(Voice voice, Sound sound, double volume, double balance, double pitch)
   {
      bool found = false;
      mutex.Wait();
      for(v : voices)
      {
         if(v == voice)
         {
            found = true;
            break;
         }
      }
      if(!found)
      {
         voices.Add(voice);
         incref voice;
      }
      voice.sound = sound;
      voice.volume = volume;
      voice.balance = balance;
      voice.pitch = pitch;
      voice.pos = 0;
      mutex.Release();
   }
}
