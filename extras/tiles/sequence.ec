/****************************************************************************
   ECERE Tile Engine

   Copyright (c) 1997-2001 Jerome Jacovella-St-Louis
   All Rights Reserved.

   sequence.c - Sprite Sequence System
****************************************************************************/
import "ecere"

struct SequenceFrame
{
   uint16 frame,wait,walk;
   uint16 hit;
};

struct Sequence
{
   uint16 numEvents;
   uint16 *numFrames;
   SequenceFrame **frames;
};

void SequenceFree(Sequence *sequence)
{
   if(sequence)
   {
      int c;
      if(sequence->frames)
      {
         for(c=0; c<sequence->numEvents; c++)
         {
            if(sequence->frames[c])
               delete sequence->frames[c];
         }
         delete sequence->frames;
      }
      if(sequence->numFrames)
         delete sequence->numFrames;
      delete sequence;
   }
}

Sequence * SequenceInit(uint16 numEvents)
{
   Sequence * result = null;
   Sequence * sequence = new0 Sequence[1];
   if(sequence)
   {
      sequence->numEvents = numEvents;
      sequence->numFrames = new0 uint16[numEvents];
      if(sequence->numFrames)
      {
         sequence->frames = new0 SequenceFrame *[numEvents];
         if(sequence->frames)
            result = sequence;
      }
   }
   if(!result)
      SequenceFree(sequence);
   return result;
}

bool SequenceLoadTable(Sequence **sequences, int count, const char * fileName)
{
   bool result = false;
   File f = FileOpen(fileName, read);
   FillBytes(sequences, 0, sizeof(Sequence *) * count);
   if(f)
   {
      int c;
      result = true;
      for(c=0; c<count; c++)
      {
         uint16 numEvents = 0;
         Sequence * sequence;

         if(f.Read(&numEvents, sizeof(uint16), 1)  &&  (sequence = SequenceInit(numEvents)) )
         {
            int e;
            sequences[c] = sequence;
            for(e=0; e<numEvents; e++)
            {
               if(f.Read(&sequence->numFrames[e],sizeof(uint16), 1))
               {
                  if(sequence->numFrames[e])
                  {
                     sequence->frames[e] = new0 SequenceFrame[sequence->numFrames[e]];
                     if(sequence->frames[e])
                     {
                        int r;
                        for(r=0; r<sequence->numFrames[e]; r++)
                        {
                           if(!f.Read(&sequence->frames[e][r].frame,sizeof(uint16), 1) ||
                              !f.Read(&sequence->frames[e][r].wait, sizeof(uint16), 1) ||
                              !f.Read(&sequence->frames[e][r].walk, sizeof(uint16), 1) ||
                              !f.Read(&sequence->frames[e][r].hit,  sizeof(uint16), 1))
                           { sequences[c] = null; break; }
                        }
                     }
                     else { sequences[c] = null; break; }
                  }
               }
               else { sequences[c] = null; break; }
            }
            if(!sequences[c])
            {
               result = false;
               SequenceFree(sequence);
               break;
            }
         }
      }
      if(!result)
      {
         for(c = 0; c<count; c++)
         {
            if(sequences[c])
            {
               SequenceFree(sequences[c]);
               sequences[c] = null;
            }
         }
         Logf("Error reading sequence table file (%s).\n", fileName);
      }
      delete f;
   }
   else
      Logf("Couldn't open sequence table file (%s).\n", fileName);
   return result;
}

void SequenceSaveTable(Sequence **sequences, int count, char *fileName)
{
   File f = FileOpen(fileName, write);
   if(f)
   {
      int c;
      for(c=0; c<count; c++)
      {
         int e;
         Sequence * sequence = sequences[c];
         f.Write(&sequence->numEvents, sizeof(uint16), 1);

         for(e=0; e<sequence->numEvents; e++)
         {
            int r;
            f.Write(&sequence->numFrames[e],sizeof(uint16), 1);
            for(r = 0; r<sequence->numFrames[e]; r++)
            {
               f.Write(&sequence->frames[e][r].frame,sizeof(uint16), 1);
               f.Write(&sequence->frames[e][r].wait, sizeof(uint16), 1);
               f.Write(&sequence->frames[e][r].walk, sizeof(uint16), 1);
               f.Write(&sequence->frames[e][r].hit,  sizeof(uint16), 1);
            }
         }
      }
      delete f;
   }
}

Sequence *SequenceLoad(char *fileName)
{
   Sequence * result = null;
   File f = FileOpen(fileName, read);
   if(f)
   {
      Sequence * sequence;
      uint16 numEvents = 0;
      if(f.Read(&numEvents, sizeof(uint16), 1)   &&
         (sequence = SequenceInit(numEvents))   )
      {
         int e;
         result = sequence;
         for(e=0; e<sequence->numEvents; e++)
         {
            int r;
            if(f.Read(&sequence->numFrames[e],sizeof(uint16), 1))
            {
               if(sequence->numFrames[e])
               {
                  if((sequence->frames[e] = new0 SequenceFrame[sequence->numFrames[e]]))
                  {
                     for(r = 0; r<sequence->numFrames[e]; r++)
                     {
                        if(!f.Read(&sequence->frames[e][r].frame,sizeof(uint16), 1) ||
                           !f.Read(&sequence->frames[e][r].wait, sizeof(uint16), 1) ||
                           !f.Read(&sequence->frames[e][r].walk, sizeof(uint16), 1) ||
                           !f.Read(&sequence->frames[e][r].hit,  sizeof(uint16), 1) )
                        { result = null; break; }
                     }
                  }
                  else { result = null; break; }
               }
            }
            else { result = null; break; }
         }
         if(!result)
            SequenceFree(sequence);
      }
      delete f;

      if(!result)
         Logf("Error loading sequence file (%s).\n", fileName);
   }
   else
      Logf("Couldn't open sequence file (%s).\n", fileName);
   return result;
}

void SequenceSave(Sequence *sequence, char *filename)
{
   File f;
   uint16 e,r;

   f=FileOpen(filename, write);
   if(!f) return;
   f.Write(&sequence->numEvents, sizeof(uint16), 1);
   for(e=0; e<sequence->numEvents; e++)
   {
      f.Write(&sequence->numFrames[e],sizeof(uint16), 1);
      for(r=0; r<sequence->numFrames[e]; r++)
      {
         f.Write(&sequence->frames[e][r].frame,sizeof(uint16), 1);
         f.Write(&sequence->frames[e][r].wait, sizeof(uint16), 1);
         f.Write(&sequence->frames[e][r].walk, sizeof(uint16), 1);
         f.Write(&sequence->frames[e][r].hit,  sizeof(uint16), 1);
      }
   }
   delete f;
}
