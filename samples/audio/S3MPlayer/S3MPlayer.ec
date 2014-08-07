import "EcereAudio"

static uint16 periods[] = { 1712, 1616, 1524, 1440, 1356, 1280, 1208, 1140, 1076, 1016, 960, 907};
static const String notes[12] = { "C-", "C#", "D-", "D#", "E-", "F-", "F#", "G-", "G#", "A-", "A#", "B-"};

struct S3MHeader
{
   byte name[28];
   byte byte1A;
   byte typ;
   uint16 junk;
   uint16 ordNum;
   uint16 insNum;
   uint16 patNum;
   uint16 flags;
   uint16 created;
   uint16 format;
   byte sign[4];
   byte globalVolume;
   byte initSpeed;
   byte initTempo;
   byte masterVolume;
   byte ultraClicks;
   byte defaultPan;
   byte junk2[8];
   uint16 special;
   byte channelSettings[32];
} __attribute__((packed));

struct InstrumentHeader
{
   byte type;
   byte filename[13];
   uint16 memSeg;
   uint32 length;
   uint32 loopBegin;
   uint32 loopEnd;
   byte volume;
   byte junk;
   byte pack;
   byte flags;
   uint32 c2spd;
   byte junk2[4];
   uint16 intGP;
   uint16 int512;
   uint32 lastUsed;
   byte name[28];
   byte sign[4];
} __attribute__((packed));

struct Instrument
{
   InstrumentHeader header;
   Sound sound;
};

struct Note
{
   byte note;
   byte ins;
   byte vol;
   byte com;
   byte info;
} __attribute__((packed));

struct Pattern
{
   Note channels[32][64];
};

class S3M
{
   S3MHeader header;
   Array<byte> orders { };
   Array<uint16> insPTR { };
   Array<uint16> patPTR { };
   byte panPos[4];
   Array<Instrument> instruments { };
   Array<Pattern> patterns { };
   Voice voices[32];

   bool Load(const char *fileName)
   {
      int i,p,c;
      byte what, row, channel;
      uint16 length;

      //Let's begin by opening the file...
      File f = FileOpen(fileName, read);
      if(!f)
         return false;
      printf("*** Loading S3M ******************\n");
      printf("Loading header...\n");
      //Load header
      f.Read(&header, sizeof(header), 1);

      printf("Loading Order List...\n");
      //Load Order List and pointers to instruments and patterns
      orders.size = header.ordNum;
      insPTR.size = header.insNum;
      patPTR.size = header.patNum;

      f.Read(orders.array, sizeof(byte), header.ordNum);
      f.Read(insPTR.array, sizeof(uint16), header.insNum);
      f.Read(patPTR.array, sizeof(uint16), header.patNum);

      //Load channels panning positions
      f.Read(panPos, sizeof(panPos), 1);

      printf("Loading instruments...\n");
      //Load instruments
      instruments.size = header.insNum;
      for(i = 0; i<header.insNum; i++)
      {
         Sound sound { };
         Instrument * ins = &instruments[i];
         //Read Instrument header
         f.Seek(insPTR[i] << 4, start);
         f.Read(&ins->header, sizeof(InstrumentHeader), 1);

         ins->sound = sound;
         //Allocate and Read Instrument Sound
         sound.data = new byte[ins->header.length];
         f.Seek(ins->header.memSeg << 4, start);
         f.Read(sound.data, ins->header.length, 1);
         sound.channels = (ins->header.flags & 2) ? 2 : 1;
         sound.bits = (ins->header.flags & 4) ? 16 : 8;
         sound.length = ins->header.length;
         sound.frequency = 22150*2;

         printf("%i: %s\n", i, ins->header.name);
      }

      printf("Loading patterns...\n");
      //Load patterns
      patterns.size = header.patNum;
      if(!patterns)
         printf("Not enough memory to load patterns!!\n");
      for(p=0; p<header.patNum; p++)
      {
         Pattern * pat = &patterns[p];
         for(row=0; row<64; row++)
            for(c=0; c<32; c++)
            {
               pat->channels[c][row].note=0;
               pat->channels[c][row].ins=0;
               pat->channels[c][row].vol=255;
               pat->channels[c][row].com=255;
               pat->channels[c][row].info=0;
            }
         //Read Pattern
         f.Seek(patPTR[p] << 4, start);
         row=0;
         f.Read(&length, sizeof(uint16), 1);
         for(;;)
         {
            f.Read(&what, sizeof(byte), 1);
            if(!what)
            {
               row++;
               if(row==64)
                  break;
               else
                  continue;
            }
            channel = what&31;
            if(what&32)
            {
               f.Read(&pat->channels[channel][row].note, sizeof(byte), 1);
               f.Read(&pat->channels[channel][row].ins, sizeof(byte), 1);
            }
            if(what&64)
            {
               f.Read(&pat->channels[channel][row].vol, sizeof(byte), 1);
            }
            if(what&128)
            {
               f.Read(&pat->channels[channel][row].com, sizeof(byte), 1);
               f.Read(&pat->channels[channel][row].info, sizeof(byte), 1);
            }
         }
         printf("Loading Pattern %i\n", p);
      }
      delete f;
      return true;
   }

   void PrintOut(Surface surface, uint16 pattern)
   {
      uint16 row, channel, note, octave, ins;
      Pattern * pat = &patterns[pattern];
      surface.WriteTextf(5,5, "Pattern %d", pattern);
      for(row=0; row<64; row++)
      {
         for(channel=0; channel<32; channel++)
         {
            int x = (channel*8+2) * 8;
            int y = (row+2) * 16;
            note   =pat->channels[channel][row].note&0x0F;
            octave=(pat->channels[channel][row].note&0xF0)>>4;
            ins   =pat->channels[channel][row].ins;
            if(ins && note < 12)
               surface.WriteTextf(x, y, "%s%i %i", notes[note], octave, octave);
            else
               surface.WriteTextf(x, y, "... ..");
         }
      }
   }

   ~S3M()
   {
      for(i : instruments)
      {
         delete i.sound;
      }
   }

   void Stop(Mixer mixer, int channel)
   {
      Voice voice = voices[channel];
      if(voice)
      {
         mixer.Wait();
         voice.looped = false;
         voice.pos = voice.loopEnd;
         mixer.Release();
      }
   }

   void PlayNote(Mixer mixer, Instrument ins, uint16 note, uint16 octave, byte volume, uint16 channel)
   {
      uint32 note_st3period;
      double vol = volume/255.0;
      double bal = 0;
      //while(note > 12) { note -= 12; octave++; }
      mixer.Wait();
      if(note < 12 && ins)
      {
         note_st3period=(8363*16*((uint32)(periods[note])>>octave))/(uint32)ins.header.c2spd;
         //if(note_st3period)
         {
            /*SND_SetLoop(ins->header.Flags&1, ins->header.LoopBegin, ins->header.LoopEnd, channel);
            SND_SetFreq((uint32)(14317056L / note_st3period), channel);
            if(volume!=255)
               SND_SetVolume(volume, channel);
            SND_Play(ins.sound, channel);
            */
            //int c2spd = ins.header.c2spd;
            //double freq = pow(Do_, note) * pow(2, octave-4) / (c2spd/8363.0);
            double freq = 14317456.0 / note_st3period / 22150/2;
            //double freq = 500.0/note_st3period;
            Voice v = voices[channel-1];

            if(!v)
            {
               v = mixer.Play(ins.sound, vol, bal, freq);
               voices[channel-1] = v;
               incref v;
            }
            else
               mixer.PlayInVoice(v, ins.sound, vol, bal, freq);
            v.pos = offsets[channel-1];
            v.loopStart = ins.header.loopBegin;
            v.loopEnd = ins.header.loopEnd;
            v.looped = ins.header.flags & 1;
         }
      }
      else
      {
         Voice v = voices[channel-1];
         if(v)
         {
            v.volume = vol;
         }
      }
      mixer.Release();
   }

   Time lastTick;
   uint16 order, pattern, row, channel;
   int volumes[32];
   Instrument *lastInst[32];
   order = 0;
   int speed;
   speed = 6;
   int slides[32];
   int tempo;
   int offsets[32];

   bool Play(Mixer mixer)
   {
      bool result = false;
      // int initSpeed = header.initSpeed;
      Time time = /*pattern == 10*/ 1? speed/(1.1*45.5) : 0;
      Time current = GetTime();

      if(!lastTick)
      {
         int i;
         for(i = 0; i < 32; i ++)
            volumes[i] = 63;
         lastTick = current;
         pattern = orders[order];
         tempo = header.initTempo;
         speed = header.initSpeed;
         /*
         SND_SetPB(&Instruments[0].Sound);
         SND_StartPB();
         for(channel=0; channel<32; channel++)
            SND_SetVolume(64, channel+1);
         */
      }

      if((current-lastTick) >= time)
      {
         Pattern * pat = &patterns[pattern];
         for(channel=0; channel<32; channel++)
         {
            Note * n = &pat->channels[channel][row];
            bool gotVolume = false;
            int com = n->com;
            int info = n->info;
            uint16 note = n->note&0x0F;
            uint16 octave = (n->note&0xF0)>>4;
            int ins = n->ins;
            int volume = volumes[channel];
            int vol = n->vol;

            if(octave == 0xF && note == 0xE)
            {
               Stop(mixer, channel);
            }
            else if(vol!=255)
            {
               if(ins)
               {
                  volumes[channel] = volume = vol;
                  gotVolume = true;
               }
               else
                  Stop(mixer, channel);
            }
            if(com != 255 && com)
            {
               char fx = (char)('A'+com-1);
               printf("%c%02X\n", fx, info);
               switch(fx)
               {
                  case 'A':
                  {
                     speed = info;
                     break;
                  }
                  case 'D':
                  {
                     if((info & 0x0F) == 0x0)
                        slides[channel] = (info >> 4);
                     else if((info & 0x0F) == 0xF)
                     {
                        volume += (info >> 4);
                        if(volume > 63) volume = 63;
                        volumes[channel] = volume;
                        gotVolume = true;
                     }
                     else if((info & 0xF0) == 0x0)
                        slides[channel] = -(info & 0x0F);
                     else if((info & 0xF0) == 0xF)
                     {
                        volume -= (info & 0x0F);
                        if(volume < 0) volume = 0;
                        volumes[channel] = volume;
                        gotVolume = true;
                     }
                     break;
                  }
                  case 'O':
                  {
                     offsets[channel] = info*256;
                     break;
                  }
               }
            }
            if(slides[channel])
            {
               volume += slides[channel] * (speed-1);
               volumes[channel] = volume;
               if(volume > 63) volume = 63;
               if(volume < 0) volume = 0;
               gotVolume = true;
            }

            if(ins || gotVolume)
            {
               lastInst[channel] = &instruments[ins-1];
               PlayNote(mixer, ins ? &instruments[ins-1] : null, note, octave, lastInst[channel] ? (byte)(volume*lastInst[channel]->header.volume/63) : (byte)volume, (uint16)(channel+1));
            }
            offsets[channel] = 0;
         }
         row++;
         if(row>63)
         {
            for(channel=0; channel<32; channel++)
            {
               volumes[channel] = 63;
               slides[channel] = 0;
               speed = header.initSpeed;
            }
            row=0;
            order++;
            while(orders[order]==255)
            {
               order++;
               if(order >= header.ordNum)
                    break;
            }
            if(order >= header.ordNum)
            {
               order=0;

               for(channel=0; channel<32; channel++)
                  volumes[channel] = 63;
            }
            pattern = orders[order];
         }
         lastTick = current;
         result = true;
      }
      return result;
   }
}

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
   text = "S3M Player";
   background = black;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 1024, 1120 };

   Mixer mixer { };
   Sound instrument;
   S3M s3m { };

   bool OnCreate()
   {
      mixer.systemHandle = systemHandle;
      //s3m.Load("2ND_KEV.S3M");
      //s3m.Load("2nd_pm.s3m");
      //s3m.Load("theweird.s3m");
      //s3m.Load("forgivme.s3m");
      //s3m.Load("quiadroi.s3m");
      //s3m.Load("everyido.s3m");
      //s3m.Load("saywords.s3m");
      s3m.Load("keven1.s3m");
      //s3m.Load("trans.s3m");

      instrument = s3m.instruments[0].sound;
      return true;
   }

   void OnDestroy()
   {
      delete mixer;
   }

   Timer pbTimer
   {
      this, 0.01, true;

      bool DelayExpired()
      {
         if(s3m.Play(mixer))
         {
            Update(null);
         }
         return true;
      }
   };

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case f1: instrument = s3m.instruments[0].sound; break;
         case f2: instrument = s3m.instruments[1].sound; break;

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

   void OnRedraw(Surface surface)
   {
      surface.foreground = mintCream;
      s3m.PrintOut(surface, s3m.pattern);
      surface.background = lime;
      surface.Area(0, (s3m.row+2) * 16, 10, (s3m.row+2) * 16 + 15);
   }
}

MainWindow mainWindow { };

class App : GuiApplication
{
   timerResolution = 60;
}
