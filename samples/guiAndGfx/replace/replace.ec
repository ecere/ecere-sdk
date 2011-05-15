import "ecere"

eReplace app;

class Replace : Window
{
   text = "ECERE Multi-Files Find & Replace";
   background = Color { 212, 208, 200 };
   borderStyle = sizable;
   minClientSize = Size { 410, 290 };
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   tabCycle = true;
   size = Size { 820, 318 };

   FileDialog fileDialog { master = this, type = selectDir, text = "Select Directory..." };

   EditBox directory
   {
      this, textHorzScroll = true, parent = this, text = "Directory", hotKey = altD, position = { 10, 30 }, size = { 300, 19 }
   };
   Label { this, position = Point { 10, 10 }, labeledWindow = directory };
   Button
   {
      this, text = "Browse", position = { 320, 30 }, size = { 80, 20 }, hotKey = altB;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(fileDialog.Modal() == ok)
            directory.contents = fileDialog.filePath;
         return true;
      }
   };
   EditBox findWhat
   {
      this, textHorzScroll = true, text = "Find What", position = { 10, 100 }, size = { 300, 19 }, hotKey = altN
   };
   Label { this, position = Point { 10, 80 }, labeledWindow = findWhat };
   EditBox replaceWith { this, textHorzScroll = true, text = "Replace With", position = { 10, 150 }, size = { 300, 19 }, hotKey = altP };
   Label { this, position = Point { 10, 130 }, labeledWindow = replaceWith };
   Button
   {
      this, text = "Replace All!!!", position = { 300, 240 }, size = { 100, 20 }, hotKey = altA;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         int entriesReplaced;
         EditBox replaceEdit
         {
            multiLine = true,textHorzScroll = true,textVertScroll = true, 
            text = "Replacing Editbox", size = Size { 640,480 },maxLineSize = 65536
         };
            
         log.Clear();
         
         app.UpdateDisplay();

         entriesReplaced =
            ReplaceInDirectory(directory.contents, findWhat.contents, replaceWith.contents, 
               matchCase.checked, wholeWord.checked, recurse.checked, replaceEdit, log);
         log.Printf("SEARCH & REPLACE COMPLETED: %d ENTRIES REPLACED.\n", entriesReplaced);

         delete replaceEdit;
         return true;
      }
   };
   Button wholeWord { this, isCheckbox = true, text = "Whole Word Only", position = Point { 11, 202 }, hotKey = altW };
   Button matchCase { this, isCheckbox = true, text = "Match Case", position = Point { 10, 230 }, hotKey = altM, checked = true };
   Button recurse { this, isCheckbox = true, text = "Recurse Subdirectories", position = Point { 10, 260 }, hotKey = altR, checked = true };
   EditBox log
   {
      this, noCaret = true, multiLine = true, autoEmpty = true, textHorzScroll = true, hasVertScroll = true, anchor = Anchor { left = 420, top = 30, right = 10, bottom = 10 }
   };

   int ReplaceInDirectory(char * directory, char * findWhat, char * replaceWith, 
                            bool matchCase, bool wholeWord, bool recurse, EditBox edit, EditBox log)
   {
      FileListing listing { directory, "htm, html, css, ec" };
      int total = 0;
      while(listing.Find())
      {
         if(listing.stats.attribs.isDirectory)
         {
            if(recurse)
            {
               log.Printf("Entering directory %s...\n", listing.name);
               app.UpdateDisplay();
               total += ReplaceInDirectory(listing.path, findWhat, replaceWith, matchCase, wholeWord, recurse, edit, log);
            }
         }
         else
         {
            File f = FileOpen(listing.path, read);
            if(f)
            {
               int entriesReplaced;

               log.Printf("Replacing in %s...", listing.name);
               app.UpdateDisplay();
               edit.Load(f);
               delete f;

               for(entriesReplaced = 0;
                   edit.Find(findWhat, wholeWord, matchCase, true) == found; 
                   entriesReplaced++)
                  edit.PutS(replaceWith);
               if(entriesReplaced)
               {
                  if((f = FileOpen(listing.path, write)))
                  {
                     edit.Save(f, true);
                     delete f;
                  }
                  total += entriesReplaced;
                  log.Printf("%d entries replaced.\n", entriesReplaced);
               }
               else
                  log.Printf("Not Found.\n");
               app.UpdateDisplay();
               edit.Clear();
            }
         }
      }
      return total;
   }
}

class eReplace : GuiApplication
{
   Replace replace {};

   void Main()
   {
      app = this;
      GuiApplication::Main();
   }
}
