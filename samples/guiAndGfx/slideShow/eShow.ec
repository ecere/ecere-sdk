import "ecere"

class PictureFile : struct
{
   PictureFile prev, next;
   char name[MAX_LOCATION];
   int dirID;
   bool dir;
};

class SlideShow : Window
{
   OldList fileNames {};
   Bitmap bitmap {};
   Timer timer
   {
      this, delay = Seconds { 2 };

      bool DelayExpired()
      {
         NextImage(direction);
         return true;
      }
   };

   PictureFile fileName;
   int dirID;
   int direction;

   background = black;
   anchor = Anchor { 0, 0, 0, 0 };
   
   void NextImage(int direction)
   {
      timer.Stop();
      bitmap.Free();
      if(!fileName) fileName = fileNames.first;
      else if(fileName)
      {
         PictureFile oldFileName = fileName;
         int oldDirID = fileName.dirID;
         while(fileName.dirID == oldDirID || 
            (direction == -2 && 
               (fileName.prev ? fileName.prev : (PictureFile)fileNames.last).dirID == fileName.dirID))
         {
            if(Sgn(direction) == 1)
            {
               fileName = fileName.next;
               if(!fileName) fileName = fileNames.first;
            }
            else if(Sgn(direction) == -1)
            {
               fileName = fileName.prev;
               if(!fileName) fileName = fileNames.last;
            }
            if(Abs(direction) == 1) break;
            
            if(fileName == oldFileName) break;
         }
      }

      if(fileName)
         bitmap.Load(fileName.name, null, displaySystem);
      Update(null);
      if(this.direction)
         timer.Start();
   }

   int ::Compare(PictureFile a, PictureFile b, void * data)
   {
      if(a.dir && !b.dir)
         return 1;
      else if(b.dir && !a.dir)
         return -1;
      else
         return strcmp(a.name, b.name);
   }

   void AddDirectory(OldList files, char * directory)
   {
      FileListing listing { directory, "pcx, jpg, bmp, png" };
      OldList list { };
   
      PictureFile fileName;
      int thisDirID = dirID++;

      while(listing.Find())
      {
         fileName = PictureFile {};
         strcpy(fileName.name, listing.path);
         list.Add(fileName);
         fileName.dir = listing.stats.attribs.isDirectory;
      }

      list.Sort(Compare, null);

      for(;(fileName = list.first);)
      {
         list.Remove(fileName);
         
         if(fileName.dir)
         {
            AddDirectory(files, fileName.name);
            delete fileName;
         }
         else
         {
            files.Add(fileName);
            fileName.dirID = thisDirID;
         }
      }
   }

   bool OnCreate()
   {
      AddDirectory(fileNames, "");
      NextImage(0);
      return true;
   }

   void OnRedraw(Surface surface)
   {
      if(bitmap && bitmap.width)
      {
         float scale = Min((float)clientSize.w / (float)bitmap.width, (float)clientSize.h / (float)bitmap.height);
         int w = (int)(bitmap.width * scale);
         int h = (int)(bitmap.height * scale);
#ifndef __linux__
         surface.Filter(bitmap, (clientSize.w - w) / 2,(clientSize.h - h) / 2, 0,0, w, h, bitmap.width, bitmap.height);
#else
         // Until Filter / Stretch works with X
         surface.Blit(bitmap, (clientSize.w - bitmap.width) / 2,(clientSize.h - bitmap.height) / 2, 0,0, bitmap.width, bitmap.height);
#endif
      }
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      switch(key)
      {
         case left: NextImage(-2); break;
         case right: NextImage(2); break;
         case pageDown: case down: NextImage(1); break;
         case pageUp: case up: NextImage(-1); break;
      }
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case escape: Destroy(0); break;
         case space: direction ^=1; if(direction) timer.Start(); else timer.Stop(); break;
         case home: fileName = fileNames.first; NextImage(0); break;
         case end: fileName = fileNames.last; NextImage(0); break;
      }
      return true;
   }
}

class eShow : GuiApplication
{
   fullScreen = true;
   SlideShow slideShow {};
}
