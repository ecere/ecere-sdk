import "ecere"

public enum VolumeControl
{
   application,
   pcm,
   master
};

public struct AudioSpec
{
   int samples;
   int silence;
   int channels;
   int freq;
   void (* callback)(void *opaque, byte *stream, int len);
   void * userdata;
   int size;
   int bits;
   void * windowHandle;
   double volume;
};

public void OpenMixer();
public void CloseMixer();
public bool AudioSetVolume(VolumeControl type, double percent);
public bool AudioGetVolume(VolumeControl type, double * percent);
public void AudioSetBalance(double percent);
public int OpenAudio(AudioSpec wanted, AudioSpec result);
public void PauseAudio(bool value);
public void CloseAudio();
