#if defined(__WIN32__)

#define byte _byte
#define Method _Method
#define Function _Function
#define int64 _int64
#define WIN32_LEAN_AND_MEAN
#define MessageBox _MessageBox
#define Array _Array

#include <windows.h>

#include <mmsystem.h>
#include <dsound.h>
#undef Array
#undef MessageBox
#undef byte
#undef Method
#undef Function
#undef int64

import "audio"

void AudioSetBalance(double percent)
{
   if(streamingSound)
      streamingSound.balance = percent;
}

static HWAVEOUT hWaveOut;
static HMIXEROBJ hmx;

void OpenMixer()
{
   HMIXER        mixerHandle;
   WAVEFORMATEX  waveFormat = { 0 };
   waveFormat.nSamplesPerSec = 44100; //(cur_stream && cur_stream->audio_st && cur_stream->audio_st->codec) ? cur_stream->audio_st->codec->sample_rate : 44100;
   waveFormat.wBitsPerSample = 16;
   waveFormat.nChannels = 2;
   waveFormat.cbSize = 0;
   waveFormat.wFormatTag = WAVE_FORMAT_PCM;
   waveFormat.nBlockAlign = (waveFormat.wBitsPerSample >> 3) * waveFormat.nChannels;
   waveFormat.nAvgBytesPerSec = waveFormat.nBlockAlign * waveFormat.nSamplesPerSec;
   
   waveOutOpen(&hWaveOut, WAVE_MAPPER, &waveFormat, 0, 0, CALLBACK_NULL);
   mixerOpen((HMIXER *)&hmx, (uint)hWaveOut, 0, 0, MIXER_OBJECTF_HWAVEOUT);
}

void CloseMixer()
{
   mixerClose((HMIXER)hmx);
   waveOutClose(hWaveOut);
}

bool AudioSetVolume(VolumeControl type, double percent)
{
   bool result = false;
   if(type == application)
   {
      if(streamingSound)
      {
         streamingSound.volume = percent;
         result = true;
      }      
   }
   else
   {
      MIXERLINE uMixerLine;
            
      // waveOutSetVolume((HWAVEOUT)0, (uint)(percent * 0xFFFF) | ((uint)(percent * 0xFFFF) << 16));

      uMixerLine.cbStruct = sizeof(MIXERLINE);
      uMixerLine.dwComponentType = (type == pcm) ? MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT : MIXERLINE_COMPONENTTYPE_DST_SPEAKERS;
      if(mixerGetLineInfo(hmx, &uMixerLine, MIXER_GETLINEINFOF_COMPONENTTYPE) == MMSYSERR_NOERROR)
      {
         MIXERLINECONTROLS uMixerLineControls;
         MIXERCONTROL mixerControl;
         
         uMixerLineControls.cbStruct = sizeof(MIXERLINECONTROLS);
         uMixerLineControls.dwLineID = uMixerLine.dwLineID;
         uMixerLineControls.dwControlID = MIXERCONTROL_CONTROLTYPE_VOLUME;
         uMixerLineControls.cControls = 1;
         uMixerLineControls.cbmxctrl = sizeof(MIXERCONTROL);
         uMixerLineControls.pamxctrl = &mixerControl;
         if(mixerGetLineControls(hmx, &uMixerLineControls, MIXER_GETLINECONTROLSF_ONEBYTYPE) == MMSYSERR_NOERROR)
         {
            MIXERCONTROLDETAILS uDetails;
            uint value;

            uDetails.cMultipleItems = 0;
            uDetails.dwControlID = mixerControl.dwControlID;
            uDetails.cbStruct = sizeof(MIXERCONTROLDETAILS);
            uDetails.cbDetails = sizeof(uint);
            uDetails.paDetails = &value;
            uDetails.cChannels = 1;
            value = (uint)(percent * mixerControl.Bounds.lMaximum);
            mixerSetControlDetails(hmx, &uDetails, MIXER_SETCONTROLDETAILSF_VALUE);
            result = true;
         }
      }
   }
   return result;
}

bool AudioGetVolume(VolumeControl type, double * percent)
{
   bool result = false;
   if(type == application)
   {
      if(streamingSound)
      {
         *percent = streamingSound.volume;
         result = true;
      }      
   }
   else
   {
      MIXERLINE uMixerLine;
                  
      uMixerLine.cbStruct = sizeof(MIXERLINE);
      uMixerLine.dwComponentType = (type == pcm) ? MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT : MIXERLINE_COMPONENTTYPE_DST_SPEAKERS;
      if(mixerGetLineInfo(hmx, &uMixerLine, MIXER_GETLINEINFOF_COMPONENTTYPE) == MMSYSERR_NOERROR)
      {
         MIXERLINECONTROLS uMixerLineControls;
         MIXERCONTROL mixerControl;
         
         uMixerLineControls.cbStruct = sizeof(MIXERLINECONTROLS);
         uMixerLineControls.dwLineID = uMixerLine.dwLineID;
         uMixerLineControls.dwControlID = MIXERCONTROL_CONTROLTYPE_VOLUME;
         uMixerLineControls.cControls = 1;
         uMixerLineControls.cbmxctrl = sizeof(MIXERCONTROL);

         uMixerLineControls.pamxctrl = &mixerControl;
         if(mixerGetLineControls(hmx, &uMixerLineControls, MIXER_GETLINECONTROLSF_ONEBYTYPE) == MMSYSERR_NOERROR)
         {
            MIXERCONTROLDETAILS uDetails;
            uint value;

            uDetails.cMultipleItems = 0;
            uDetails.dwControlID = mixerControl.dwControlID;
            uDetails.cbStruct = sizeof(MIXERCONTROLDETAILS);
            uDetails.cbDetails = sizeof(uint);
            uDetails.paDetails = &value;
            uDetails.cChannels = 1;
            mixerGetControlDetails(hmx, &uDetails, MIXER_SETCONTROLDETAILSF_VALUE);
            *percent = (double)value / mixerControl.Bounds.lMaximum;
            result = true;
         }
      }
   }
   return result;
}

int OpenAudio(AudioSpec wanted, AudioSpec result)
{
   #define NUM_PLAY_NOTIFICATIONS  16
   uint nBlockAlign, dwNotifySize;

   delete streamingSound;

   g_pSoundManager.Initialize(wanted.windowHandle);
   g_pSoundManager.SetPrimaryBufferFormat(wanted.channels, wanted.freq, wanted.bits);

   if(!wanted.channels)
      wanted.channels = 2;
   nBlockAlign = wanted.bits / 8 * wanted.channels;
   // dwNotifySize = 16384 / NUM_PLAY_NOTIFICATIONS; //wanted.freq * 3 * nBlockAlign / NUM_PLAY_NOTIFICATIONS;
   dwNotifySize = wanted.freq / 2 / NUM_PLAY_NOTIFICATIONS; //wanted.freq * 3 * nBlockAlign / NUM_PLAY_NOTIFICATIONS;
   dwNotifySize -= dwNotifySize % nBlockAlign;
   result = wanted;
   result.size = dwNotifySize * NUM_PLAY_NOTIFICATIONS;

   g_pSoundManager.InitStreaming(&streamingSound, NUM_PLAY_NOTIFICATIONS, dwNotifySize, dSoundThread.g_hNotificationEvent,
      wanted.callback, wanted.userdata, wanted.channels, wanted.freq, wanted.bits);
   if(streamingSound)
   {
      streamingSound.volume = wanted.volume;
      dSoundThread.bDone = false;
      
      //dSoundThread.Create();
      return 1;
   }
   return 0;
}

void PauseAudio(int value)
{
   if(!value)
   {
      PlayBuffer(false);
      dSoundThread.Create();
   }
}

void CloseAudio()
{
   if(dSoundThread)
   {
      dSoundThread.bDone = true;
      SetEvent(dSoundThread.g_hNotificationEvent);
      dSoundThread.Wait();
   }
   delete streamingSound;
}

static bool PlayBuffer( bool bLooped )
{
   void * pDSB;
   if(!streamingSound)
      return false;

   if(streamingSound.Reset())
      return false;

   pDSB = streamingSound.GetBuffer( 0 );

   SetEvent(dSoundThread.g_hNotificationEvent);
   return true;
}

static class StreamingSound
{
   IDirectSoundBuffer ** apDSBuffer;
   IDirectSoundBuffer * pDSB;

   uint dwDSBufferSize;
   uint dwNumBuffers;
   uint dwCreationFlags;
   uint dwLastPlayPos;
   uint dwPlayProgress;
   uint dwNotifySize;
   uint dwNextWriteOffset;
   bool bFillNextNotificationWithSilence;
   void (*callback)(void * data, void * buffer, int len);
   void * data;
   double volume;

   public property double volume
   {
      set
      {
         int vol = (int)(20 * log10(value) * 100);
         vol = Max(-10000, vol);
         IDirectSoundBuffer_SetVolume(apDSBuffer[0], vol);
         volume = value;
      }
      get
      {
         return volume;
      }
   };

   public property double balance
   {
      set
      {
         int pan = -2173 + (int)(value * 2173 * 2);
         IDirectSoundBuffer_SetPan(apDSBuffer[0], pan);
      }
   }
   
   property uint dwNumBuffers
   {
      set
      {
         dwNumBuffers = value;
         apDSBuffer = new0 IDirectSoundBuffer *[dwNumBuffers];
      }
   }

   property IDirectSoundBuffer ** apDSBuffer
   {
      set
      {
         if( apDSBuffer )
         {
            uint i;
            for( i=0; i<dwNumBuffers; i++ )
               apDSBuffer[i] = value[i];
         }
      }
   }
   
   ~StreamingSound()
   {
      uint i;
      for( i=0; i<dwNumBuffers; i++ )
      {
         if(apDSBuffer[i])
         {
            IDirectSoundBuffer_Release( apDSBuffer[i] ); 
            apDSBuffer[i] = 0;
         }
      }
      
      delete( apDSBuffer ); 
   }
   
   int RestoreBuffer( IDirectSoundBuffer * pDSB, bool* pbWasRestored )
   {
      int hr;
      uint dwStatus;
      
      if( pDSB == null )
         return CO_E_NOTINITIALIZED;
      if( pbWasRestored )
         *pbWasRestored = false;
      
      if( FAILED( hr = IDirectSoundBuffer_GetStatus(pDSB, &dwStatus) ) )
         return 1; //DXUT_ERR( L"GetStatus", hr );
      
      if( dwStatus & DSBSTATUS_BUFFERLOST )
      {
         // Since the app could have just been activated, then
         // DirectSound may not be giving us control yet, so 
         // the restoring the buffer may fail.  
         // If it does, sleep until DirectSound gives us control.
         do 
         {
            hr = IDirectSoundBuffer_Restore(pDSB);
            if( hr == DSERR_BUFFERLOST )
               Sleep( 10 );
         }
         while( ( hr = IDirectSoundBuffer_Restore(pDSB) ) == DSERR_BUFFERLOST );
         
         if( pbWasRestored != null )
            *pbWasRestored = true;
         
         return S_OK;
      }
      else
      {
         return S_OK; //FALSE;
      }
   }

   IDirectSoundBuffer * GetFreeBuffer()
   {
      uint i;
      if(!apDSBuffer)
         return null; 
      
      for( i=0; i<dwNumBuffers; i++ )
      {
         if( apDSBuffer[i] )
         {  
            uint dwStatus = 0;
            IDirectSoundBuffer_GetStatus(apDSBuffer[i], &dwStatus );
            if ( ( dwStatus & DSBSTATUS_PLAYING ) == 0 )
               break;
         }
      }
      
      if( i != dwNumBuffers )
         return apDSBuffer[ i ];
      else
         return apDSBuffer[ rand() % dwNumBuffers ];
   }
   
   IDirectSoundBuffer * GetBuffer( uint dwIndex )
   {
      if( apDSBuffer == null )
         return null;
      if( dwIndex >= dwNumBuffers )
         return null;
      
      return apDSBuffer[dwIndex];
   }
  
   int Play( uint dwPriority, uint dwFlags, uint lVolume, uint lFrequency, uint lPan )
   {
      int result;
      int hr;
      bool bRestored;
      //IDirectSoundBuffer * pDSB;
      
      // For Streaming Sound
      dwFlags |= DSBPLAY_LOOPING;

      if( apDSBuffer == null )
         return CO_E_NOTINITIALIZED;
      
      pDSB = GetFreeBuffer();
      
      if( pDSB == null )
         return 1; //DXUT_ERR( L"GetFreeBuffer", E_FAIL );
      
      // Restore the buffer if it was lost
      if( FAILED( hr = RestoreBuffer( pDSB, &bRestored ) ) )
         return 1; //DXUT_ERR( L"RestoreBuffer", hr );
      
      if( bRestored )
      {
         // The buffer was restored, so we need to fill it with new data
         if( FAILED( hr = FillBufferWithSound( pDSB, false ) ) )
            return 1; //DXUT_ERR( L"FillBufferWithSound", hr );
      }
      
      if( dwCreationFlags & DSBCAPS_CTRLVOLUME )
      {
         //IDirectSoundBuffer_SetVolume(pDSB, lVolume);
      }
      
      if( lFrequency != -1 && 
         (dwCreationFlags & DSBCAPS_CTRLFREQUENCY) )
      {
         IDirectSoundBuffer_SetFrequency(pDSB, lFrequency);
      }
      
      if( dwCreationFlags & DSBCAPS_CTRLPAN )
      {
         //IDirectSoundBuffer_SetPan(pDSB, lPan);
      }
      result = IDirectSoundBuffer_Play(pDSB, 0, dwPriority, dwFlags);
      return result;
   }

   int Stop()
   {
      int hr = 0;
      uint i;
      if( apDSBuffer == null )
         return CO_E_NOTINITIALIZED;
      
      for( i=0; i<dwNumBuffers; i++ )
         hr |= IDirectSoundBuffer_Stop(apDSBuffer[i]);
      
      return hr;
   }

   bool HandleWaveStreamNotification(  )
   {
      uint dwCurrentPlayPos;
      uint dwPlayDelta;
      uint dwBytesWrittenToBuffer;
      void * pDSLockedBuffer = null;
      void * pDSLockedBuffer2 = null;
      uint dwDSLockedBufferSize;
      uint dwDSLockedBufferSize2;
      uint playCursor, writeCursor;
      bool bRestored;
      uint start, size;
      
      static uint cursor;
      bool written = true;
      int c;
      while(written)
      {
         written = false;
         
         // Figure out how much data has been played so far.  When we have played
         // past the end of the file, we will either need to start filling the
         // buffer with silence or starting reading from the beginning of the file, 
         // depending if the user wants to loop the sound
         if(IDirectSoundBuffer_GetCurrentPosition(apDSBuffer[0], &dwCurrentPlayPos, null))
         {
            return false;
         }
         playCursor = (dwCurrentPlayPos / dwNotifySize);
         writeCursor = dwNextWriteOffset;

         //printf("Play Cursor : %d, Write Cursor %d\n", playCursor, writeCursor);
         if(writeCursor > playCursor)
         {
            start = writeCursor;
            size = (dwDSBufferSize / dwNotifySize) - start;
            for(c = start; c<start + size; c++)
            if(size)
            {
               written = true;
               //printf("Writing %d - %d\n", c, c);
               IDirectSoundBuffer_Lock(apDSBuffer[0], c * dwNotifySize, 1 * dwNotifySize, &pDSLockedBuffer, &dwDSLockedBufferSize, &pDSLockedBuffer2, &dwDSLockedBufferSize2, 0L);
               //printf("In callback...");
               callback(data, pDSLockedBuffer, dwDSLockedBufferSize);
               //printf("Out\n");
               IDirectSoundBuffer_Unlock(apDSBuffer[0], pDSLockedBuffer, dwDSLockedBufferSize, null, 0 );
               dwNextWriteOffset = 0;
            }
            
            if(start > 0)
            {
               start = 0;
               size = playCursor;
               for(c = start; c<start + size; c++)
               if(size)
               {
                  written = true;
                  //printf("Writing %d - %d\n", c, c);
                  IDirectSoundBuffer_Lock(apDSBuffer[0], c * dwNotifySize, 1 * dwNotifySize, &pDSLockedBuffer, &dwDSLockedBufferSize, &pDSLockedBuffer2, &dwDSLockedBufferSize2, 0L);
                  //printf("In callback...");
                  callback(data, pDSLockedBuffer, dwDSLockedBufferSize);
                  //printf("Out\n");
                  IDirectSoundBuffer_Unlock(apDSBuffer[0], pDSLockedBuffer, dwDSLockedBufferSize, null, 0 );
                  dwNextWriteOffset = (playCursor) % (dwDSBufferSize / dwNotifySize);
               }
            }
         }
         else
         {
            start = writeCursor;
            size = playCursor - writeCursor;
            for(c = start; c<start + size; c++)
            if(size)
            {
               written = true;
               //printf("Writing %d - %d\n", c, c);
               IDirectSoundBuffer_Lock(apDSBuffer[0], c * dwNotifySize, 1 * dwNotifySize, &pDSLockedBuffer, &dwDSLockedBufferSize, &pDSLockedBuffer2, &dwDSLockedBufferSize2, 0L);
               //printf("In callback...");
               callback(data, pDSLockedBuffer, dwDSLockedBufferSize);
               //printf("Out\n");
               IDirectSoundBuffer_Unlock(apDSBuffer[0], pDSLockedBuffer, dwDSLockedBufferSize, null, 0 );
               dwNextWriteOffset = (playCursor) % (dwDSBufferSize / dwNotifySize);
            }
         }
         //printf("Next Offset: %d\n", dwNextWriteOffset);
         }
      return true;
   }
   
   int Reset()
   {
      int hr;
      bool bRestored;
      int result;
      
      if(!apDSBuffer[0])
         return 1;
      
      dwLastPlayPos     = 0;
      dwPlayProgress    = 0;
      dwNextWriteOffset = 0;
      bFillNextNotificationWithSilence = false;
      
      // Restore the buffer if it was lost
      if(RestoreBuffer( apDSBuffer[0], &bRestored ))
         return 1;
      
      if( bRestored )
      {
         // The buffer was restored, so we need to fill it with new data
         if(FillBufferWithSound( apDSBuffer[0], false))
            return 1;
      }
      
      result = IDirectSoundBuffer_SetCurrentPosition(apDSBuffer[0], 0L );
      return result;
   }

   int FillBufferWithSound( IDirectSoundBuffer * pDSB, bool bRepeatWavIfBufferLarger )
   {
      int hr; 
      void*   pDSLockedBuffer      = null; // Pointer to locked buffer memory
      uint   dwDSLockedBufferSize = 0;    // Size of the locked DirectSound buffer
      uint   dwWavDataRead        = 0;    // Amount of data read from the wav file 
      
      if( pDSB == null )
         return CO_E_NOTINITIALIZED;
      
      // Make sure we have focus, and we didn't just switch in from
      // an app which had a DirectSound device
      if(RestoreBuffer( pDSB, null ))
         return 1;
      
      // Lock the buffer down
      if(IDirectSoundBuffer_Lock(pDSB, 0, dwDSBufferSize, &pDSLockedBuffer, &dwDSLockedBufferSize, null, null, 0L ))
         return 1;
      
      callback(data, pDSLockedBuffer, dwDSLockedBufferSize);

      dwWavDataRead = dwDSLockedBufferSize;
      
      printf("Filling 16 spots\n");
      IDirectSoundBuffer_Unlock(pDSB, pDSLockedBuffer, dwDSLockedBufferSize, null, 0 );

      //dwNextWriteOffset = dwNotifySize*2;
      return S_OK;
   }
}

static class CSoundManager
{
   IDirectSound8* pDS;
   
   ~CSoundManager()
   {
      if(pDS)
         IDirectSound_Release( pDS ); 
   }
   
   int Initialize( void * hWnd )
   {
      int hr;
      
      if(pDS)
      {
         IDirectSound_Release( pDS );
         pDS = null;
      }
      
      // Create IDirectSound using the primary sound device
      if( FAILED( hr = DirectSoundCreate8( null, &pDS, null ) ) )
         return 1; //DXUT_ERR( L"DirectSoundCreate8", hr );
      
      // Set DirectSound coop level 
      if( FAILED( hr = IDirectSound_SetCooperativeLevel(pDS, hWnd, DSSCL_PRIORITY ) ) )
         return 1; //DXUT_ERR( L"SetCooperativeLevel", hr );   
      
      return S_OK;
   }
   
   
   int SetPrimaryBufferFormat( uint dwPrimaryChannels, uint dwPrimaryFreq, uint dwPrimaryBitRate )
   {
      int hr;
      IDirectSoundBuffer * pDSBPrimary = null;
      DSBUFFERDESC dsbd;
      WAVEFORMATEX wfx;
      
      if( pDS == null )
         return CO_E_NOTINITIALIZED;
      
      // Get the primary buffer 
      ZeroMemory( &dsbd, sizeof(DSBUFFERDESC) );
      dsbd.dwSize        = sizeof(DSBUFFERDESC);
      dsbd.dwFlags       = DSBCAPS_PRIMARYBUFFER | DSBCAPS_CTRLPAN | DSBCAPS_CTRLVOLUME;
      dsbd.dwBufferBytes = 0;
      dsbd.lpwfxFormat   = null;
      
      if( FAILED( hr = IDirectSound_CreateSoundBuffer(pDS, &dsbd, &pDSBPrimary, null ) ) )
         return 1; // DXUT_ERR( L"CreateSoundBuffer", hr );
      
      ZeroMemory( &wfx, sizeof(WAVEFORMATEX) ); 
      wfx.wFormatTag      = (WORD) WAVE_FORMAT_PCM; 
      wfx.nChannels       = (WORD) dwPrimaryChannels; 
      wfx.nSamplesPerSec  = (uint) dwPrimaryFreq; 
      wfx.wBitsPerSample  = (WORD) dwPrimaryBitRate; 
      wfx.nBlockAlign     = (WORD) (wfx.wBitsPerSample / 8 * wfx.nChannels);
      wfx.nAvgBytesPerSec = (uint) (wfx.nSamplesPerSec * wfx.nBlockAlign);
      
      if( FAILED( hr = IDirectSoundBuffer_SetFormat(pDSBPrimary, &wfx) ) )
         return 1; //DXUT_ERR( L"SetFormat", hr );
      
      if(pDSBPrimary)
      {
         IDirectSoundBuffer_Release( pDSBPrimary );
         pDSBPrimary = null;
      }      
      return S_OK;
   }
   

   bool InitStreaming(StreamingSound * ppStreamingSound, uint dwNotifyCount, uint dwNotifySize, void * hNotifyEvent,
                      void (*callback)(void * data, void * buffer, int len), void * data, int nChannels, int freq,int bits)
   {
      int hr;
      IDirectSoundBuffer * pDSBuffer = null;
      uint dwDSBufferSize = 0;
      DSBPOSITIONNOTIFY * aPosNotify = null; 
      IDirectSoundNotify * pDSNotify = null;
      DSBUFFERDESC dsbd;
      uint i;
      
      if(!pDS)
         return false;
      if(!ppStreamingSound || !hNotifyEvent)
         return false;
      
      dwDSBufferSize = dwNotifySize * dwNotifyCount;
      
      ZeroMemory( &dsbd, sizeof(DSBUFFERDESC) );
      dsbd.dwSize= sizeof(DSBUFFERDESC);
      dsbd.dwFlags = DSBCAPS_GLOBALFOCUS | DSBCAPS_CTRLPOSITIONNOTIFY | DSBCAPS_GETCURRENTPOSITION2 | DSBCAPS_CTRLPAN | DSBCAPS_CTRLVOLUME;
      dsbd.dwBufferBytes = dwDSBufferSize;
      dsbd.guid3DAlgorithm = DS3DALG_DEFAULT;
      dsbd.lpwfxFormat = new0 WAVEFORMATEX[1];
      dsbd.lpwfxFormat->wFormatTag = WAVE_FORMAT_PCM;
      dsbd.lpwfxFormat->nChannels = (uint16)nChannels;
      dsbd.lpwfxFormat->nSamplesPerSec = freq;
      dsbd.lpwfxFormat->wBitsPerSample = (uint16)bits;
      dsbd.lpwfxFormat->nBlockAlign = dsbd.lpwfxFormat->nChannels * dsbd.lpwfxFormat->wBitsPerSample / 8;
      dsbd.lpwfxFormat->nAvgBytesPerSec = dsbd.lpwfxFormat->nSamplesPerSec * dsbd.lpwfxFormat->nBlockAlign;
      
      if(IDirectSound_CreateSoundBuffer(pDS, &dsbd, &pDSBuffer, null))
      {
         delete dsbd.lpwfxFormat;
         return false;
      }
      delete dsbd.lpwfxFormat;
      
      if(IDirectSoundBuffer_QueryInterface(pDSBuffer, &IID_IDirectSoundNotify, (void**)&pDSNotify))
      {
         delete aPosNotify;
         return false;
      }
      
      aPosNotify = new DSBPOSITIONNOTIFY[ dwNotifyCount ];
      if( aPosNotify == null )
         return false;
      
      for( i = 0; i < dwNotifyCount; i++ )
      {
         aPosNotify[i].dwOffset     = (dwNotifySize * i) + dwNotifySize - 1;
         aPosNotify[i].hEventNotify = hNotifyEvent;             
      }
      
      if(IDirectSoundNotify_SetNotificationPositions(pDSNotify, dwNotifyCount, aPosNotify ))
      {
         if(pDSNotify)
            IDirectSoundNotify_Release(pDSNotify);
         delete( aPosNotify );
         return false;
      }
      
      if(pDSNotify)
         IDirectSoundNotify_Release(pDSNotify);
      delete aPosNotify;
      
      *ppStreamingSound = StreamingSound
      {
         dwCreationFlags = DSBCAPS_CTRLPAN|DSBCAPS_CTRLVOLUME, dwNumBuffers = 1, dwNotifySize = dwNotifySize, dwDSBufferSize = dwDSBufferSize, apDSBuffer = &pDSBuffer, 
         
         callback = callback, data = data
      };
      // ppStreamingSound->FillBufferWithSound( pDSBuffer, false );
      return true;
   }
}

static DSoundThread dSoundThread { };

static CSoundManager g_pSoundManager { };
static StreamingSound streamingSound;

static class DSoundThread : Thread
{
   void * g_hNotificationEvent;
   bool bDone;
   DSoundThread()
   {
      g_hNotificationEvent = CreateEvent( NULL, FALSE, FALSE, NULL );
   }
   ~DSoundThread()
   {
      CloseHandle( g_hNotificationEvent );
   }
   uint Main( )
   {
      bool filled = false;
      SetPriority(timeCritical);
      while( !bDone ) 
      { 
         WaitForSingleObject(g_hNotificationEvent, INFINITE);
         if(streamingSound)
         {
            if(!filled)
            {
               streamingSound.FillBufferWithSound( streamingSound.GetBuffer( 0 ), false );
               streamingSound.Play( 0, 0, 0, -1, 0);
               filled = true;
            }
            else if(!streamingSound.HandleWaveStreamNotification())
            {
               bDone = true;
            }
         }
      }
      return 0;
   }
}

#endif
