#if defined(__linux__)
#define uint _uint
#include <alsa/asoundlib.h>
#undef uint

import "audio"

static byte * buffer;
static snd_pcm_t *handle;
static snd_pcm_sframes_t frames;
static AudioSpec audioSpec { };
static bool paused;
static Semaphore pauseSemaphore { };

static char *device = "default";

static snd_mixer_t *mixer_handle;

static double volume, balance;

public void AudioSetBalance(double percent)
{
   balance = percent;
}

public bool AudioSetVolume(VolumeControl type, double percent)
{
   bool result = false;
   if(type == application)
   {
      volume = percent;
      result = true;
   }
   else
   {
      snd_mixer_elem_t *elem;
      snd_mixer_selem_id_t *sid;
      int pmin, pmax;
      int get_vol, set_vol;
      float f_multi;

     	snd_mixer_load(mixer_handle);

      // snd_mixer_selem_id_alloca(&sid);
      sid = (snd_mixer_selem_id_t *) alloca(snd_mixer_selem_id_sizeof());
      memset(sid, 0, snd_mixer_selem_id_sizeof());

      snd_mixer_selem_id_set_index(sid, 0);
      snd_mixer_selem_id_set_name(sid, (type == pcm) ? "PCM" : "Master");
      elem = snd_mixer_find_selem(mixer_handle, sid);
      if(elem)
      {
         snd_mixer_selem_get_playback_volume_range(elem,&pmin,&pmax);
         f_multi = 1 / (float)(pmax - pmin);
         set_vol = (int)(percent / f_multi + pmin + 0.5);
         snd_mixer_selem_set_playback_volume(elem, 0, set_vol);
         snd_mixer_selem_set_playback_volume(elem, 1, set_vol);
         result = true;
      }
      snd_mixer_free(mixer_handle);
   }
   return result;
}

public bool AudioGetVolume(VolumeControl type, double * percent)
{
   bool result = false;
   if(type == application)
   {
      *percent = volume;
      result = true;
   }
   else
   {
      snd_mixer_elem_t *elem;
      snd_mixer_selem_id_t *sid;
      long pmin, pmax;
      long get_vol, set_vol;
      float f_multi;

    	snd_mixer_load(mixer_handle);

      // snd_mixer_selem_id_alloca(&sid);
      sid = (snd_mixer_selem_id_t *) alloca(snd_mixer_selem_id_sizeof());
      memset(sid, 0, snd_mixer_selem_id_sizeof());

      snd_mixer_selem_id_set_index(sid, 0);
      snd_mixer_selem_id_set_name(sid, (type == pcm) ? "PCM" : "Master");
      elem = snd_mixer_find_selem(mixer_handle, sid);

      if(elem)
      {
         snd_mixer_selem_get_playback_volume_range(elem,&pmin,&pmax);
         snd_mixer_selem_get_playback_volume(elem, 0, &set_vol);
         f_multi = 1 / (float)(pmax - pmin);
         *percent = f_multi * (set_vol - 0.5 - pmin);
         result = true;
      }
      snd_mixer_free(mixer_handle);
   }
   return result;
}

public void OpenMixer()
{
   snd_mixer_open(&mixer_handle, 0);
   snd_mixer_attach(mixer_handle, "default");
	snd_mixer_selem_register(mixer_handle, null, null);
}

public void CloseMixer()
{
   snd_mixer_close(mixer_handle);
}

public int OpenAudio(AudioSpec wanted, AudioSpec result)
{
   int err;
   unsigned int i;

   buffer = new byte[wanted.samples * wanted.channels * wanted.bits / 8];
   memset(buffer, 0, wanted.samples * wanted.channels * wanted.bits / 8);

   if ((err = snd_pcm_open(&handle, device, SND_PCM_STREAM_PLAYBACK, 0)) < 0)
   {
      printf("Playback open error: %s\n", snd_strerror(err));
      return 0;
   }
   if ((err = snd_pcm_set_params(handle,
                                 (wanted.bits == 8) ? SND_PCM_FORMAT_U8 : SND_PCM_FORMAT_S16,
                                 SND_PCM_ACCESS_RW_INTERLEAVED,
                                 wanted.channels,
                                 wanted.freq,
                                 1,
                                 50000)) < 0)
   {   /* 0.5sec */
      printf("Playback open error: %s\n", snd_strerror(err));
      return 0;
   }
   soundThread.done = false;
   result = wanted;
   audioSpec = wanted;
   volume = wanted.volume;
   balance = 0.5;
   return 1;
}

public void PauseAudio(int value)
{
   if(!value)
   {
      soundThread.Create();
   }
}

public void CloseAudio()
{
   soundThread.done = true;
   soundThread.Wait();
   delete buffer;
   if(handle) snd_pcm_close(handle);
}

static class SoundThread : Thread
{
   bool done;
   SoundThread()
   {

   }
   ~SoundThread()
   {

   }

   uint Main()
   {
      while(!done)
      {
         if(paused)
         {
            pauseSemaphore.Wait();
         }
         else
         {
            int c;
            short int * samples = (short int *)buffer;
            double m = volume / (1 + Abs(balance * 2 - 1)) / 100.0;
            double ll = (2 - (2 * Max(balance, 0.5)))* m;
            double lr = (-2 * Min(balance, 0.5) + 1) * m;
            double rl = (2 * Max(balance, 0.5) - 1)  * m;
            double rr = (2 * Min(balance, 0.5))      * m;
            uint numSamples = audioSpec.samples/16;
            // printf("Volume: %f, m : %f, Left: (%f, %f), Right: (%f, %f) \n", volume, m, ll, lr, rl, rr);

            audioSpec.callback(audioSpec.userdata, buffer, numSamples * audioSpec.channels * audioSpec.bits / 8);
            for(c = 0; c<numSamples; c++)
            {
               short sLeft = samples[0], sRight = samples[1];
               samples[0] = (short)(sLeft * ll + sRight * lr);
               samples[1] = (short)(sLeft * rl + sRight * rr);
               samples += 2;
            }

            frames = snd_pcm_writei(handle, buffer, numSamples);
            if(frames < 0)
               frames = snd_pcm_recover(handle, frames, 0);
            if (frames < 0)
            {
               printf("snd_pcm_writei failed: %s\n", snd_strerror(frames));
               break;
            }
            if (frames > 0 && frames < numSamples)
               printf("Short write (expected %li, wrote %li)\n", numSamples, frames);
         }
      }
      return 0;
   }
}

static SoundThread soundThread { };

#endif
