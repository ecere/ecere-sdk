#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

static char archivePath[MAX_LOCATION], archive[MAX_LOCATION];

#define BUFFERSIZE 0x10000

void ExtractFileFromArchive(ProgressBar progressBar, const char * path, const char * outputFile)
{
   char fileName[MAX_LOCATION];
   FileAttribs exists = FileExists(path);
   bool setTime = false;
   FileStats stats;

   if(exists.isDirectory)
   {
      FileListing listing { path };

      if(outputFile[0])
      {
         if(MakeDir(outputFile))
         {
            setTime = true;
            FileGetStats(path, &stats);
         }
      }

      while(listing.Find())
      {
         if(strcmp(listing.path, "<:>ecere"))
         {
            strcpy(fileName, outputFile);

            // Tweak file name if out
            if(outputFile[0])
            {
               if(!strcmp(fileName, ".")) fileName[0] = '\0';
               if(listing.name[0] == '/' || listing.name[0] == '\\')
               {
                  char * afterSlash, rest[MAX_LOCATION];
                  for(afterSlash = fileName; *afterSlash == '/' || *afterSlash == '\\'; afterSlash++);
                  strcpy(rest, afterSlash);
                  PathCat(fileName, "_root");
                  PathCat(fileName, rest);
               }
               else if(listing.name[1] == ':')
               {
                  char letter[10];
                  sprintf(letter, "_%cdrive", toupper(listing.name[0]));
                  PathCat(fileName, letter);
                  PathCat(fileName, listing.name[2] ? (listing.name + 3) : (listing.name + 2));
               }
               else
                  PathCat(fileName, listing.name);
            }
            else
               PathCat(fileName, listing.name);
            if(!strcmp(fileName, "/") || !strcmp(fileName, "\\"))
               strcpy(fileName, DIR_SEPS);
            ExtractFileFromArchive(progressBar, listing.path, fileName);
         }
      }
   }
   else if(exists)
   {
      File input = FileOpen(path, read);
      if(input)
      {
         File output = FileOpen(outputFile, write);
         if(output)
         {
            char fileName[MAX_FILENAME];
            uint position = progressBar.progress;
            FileSize dataSize;
            uint c;
            byte buffer[BUFFERSIZE];

            FileGetSize(path, &dataSize);
            GetLastDirectory(outputFile, fileName);
            progressBar.statusBar.SetText($"Extracting %s...", fileName);

            app.UpdateDisplay();

            for(c = 0; c<dataSize; c += BUFFERSIZE)
            {
               uint size = (dataSize > c + BUFFERSIZE) ? BUFFERSIZE : (dataSize - c);
               input.Read(buffer, 1, size);
               output.Write(buffer, 1, size);

               progressBar.progress = position + c + size;
               app.UpdateDisplay();
            }
            delete output;
            setTime = true;
            FileGetStats(path, &stats);
         }
         delete input;
      }
   }
   if(setTime)
      FileSetTime(outputFile, stats.created, 0, stats.modified);
}

class SelfExtract : Window
{
   background = activeBorder;
   borderStyle = fixed;
   minClientSize = Size { 500, 112 };
   hasClose = true;
   tabCycle = true;
   size = Size { 506, 138 };
   anchor = Anchor { vert = -0.15 };

   Button view { this, text = $"View Files", anchor = Anchor { right = 100, top = 70 }, size = Size { 100 }, hotKey = altV, NotifyClicked = ViewClicked };
   Button usePaths
   {
      this, isCheckbox = true, text = $"Use paths from archive...", position = Point { 10,70 }, hotKey = altU, checked = true;

      bool NotifyClicked(Button control, int x, int y, Modifiers mods)
      {
         if(usePaths.checked)
         {
            browse.disabled = true;
            where.disabled = true;
         }
         else
         {
            browse.disabled = false;
            where.disabled = false;
         }
         whereLabel.Update(null); // Is this still needed?
         return true;
      }
   };
   EditBox where { this, text = $"Extract to", anchor = Anchor { left = 10, top = 40, right = 100 }, size = Size { h = 22 }, hotKey = altT, disabled = true };
   Label whereLabel { this, position = Point { 10,20 }, labeledWindow = where };
   Button browse
   {
      this, text = $"Browse...", anchor = Anchor { right = 10, top = 40 }, size = Size { 80 }, hotKey = altB, disabled = true;

      bool NotifyClicked(Button control, int x, int y, Modifiers mods)
      {
         fileDialog.currentDirectory = where.contents;
         if(fileDialog.Modal() == ok)
            where.contents = fileDialog.filePath;
         return true;
      }
   };
   Button close { this, text = $"Exit", anchor = Anchor { right = 10, top = 70 }, size = Size { 80 }, hotKey = altX, NotifyClicked = ButtonCloseDialog };
   Button extract
   {
      this, isDefault = true, text = $"Extract", anchor = Anchor { right = 10, top = 10 }, size = Size { 80 }, hotKey = altE;

      bool NotifyClicked(Button control, int x, int y, Modifiers mods)
      {
         FileSize totalSize;
         ProgressBar progressBar { master = this, isModal = true, borderStyle = fixed, hasStatusBar = true, text = $"Extracting Files...", clientSize = Size { 400, 40 } };

         ArchiveQuerySize(archive, &totalSize);
         progressBar.range = totalSize;

         app.UpdateDisplay();

         if(usePaths.checked)
            ExtractFileFromArchive(progressBar, archivePath, "");
         else
         {
            char output[MAX_LOCATION];
            TrimLSpaces(where.contents, output);
            TrimRSpaces(output, output);
            if(!output[0]) strcpy(output, ".");
            ExtractFileFromArchive(progressBar, archivePath, output);
         }
         MessageBox { master = progressBar, text = $"Done.", contents = $"Extraction Completed" }.Modal();
         progressBar.Destroy(0);
         return true;
      }
   };
   ListBox viewList { this, hasHeader = true, borderStyle = deep, hasHorzScroll = true, hasVertScroll = true, anchor = Anchor { left = 10, top = 112, right = 10,bottom = 10 } };
   DataField nameField { header = $"File", width = 360 };
   DataField sizeField { dataType = "FileSize", header = $"Size", width = 96 };
   DataField mField { dataType = "TimeStamp", header = $"Modified", width = 216 };
   DataField cField {dataType = "TimeStamp", header = $"Created", width = 216 };
   FileDialog fileDialog { master = this, type = selectDir, text = $"Select extraction directory" };

   bool HideClicked(Button control, int x, int y, Modifiers mods)
   {
      borderStyle = fixed;
      viewList.visible = false;
      size = Size {};
      position = position;
      view.text = $"View Files";
      view.hotKey = altV;
      view.NotifyClicked = ViewClicked;
      return true;
   }

   bool ViewClicked(Button control, int x, int y, Modifiers mods)
   {
      borderStyle = sizable;
      position = position;
      clientSize.h = 300;
      viewList.visible = true;
      view.text = $"Hide Files";
      view.hotKey = altH;
      view.NotifyClicked = HideClicked;
      return true;
   }

   void ViewArchive(const char * path)
   {
      FileListing listing { path };
      char string[MAX_LOCATION];
      const char * directory;
      DataRow row;

      SplitArchivePath(path, string, &directory);

      if(directory[0])
      {
         FileStats stats;

         strcpy(string, directory);
         if(!strcmp(directory, "/") || !strcmp(directory, "\\"))
            strcpy(string, DIR_SEPS);
         else
            strcat(string, DIR_SEPS);

         FileGetStats(path, &stats);

         row = viewList.AddRow();
         row.SetData(nameField, string);
         row.SetData(sizeField, 0);
         {
            TimeStamp m = stats.modified.local, c = stats.created.local;
            row.SetData(mField, m);//(void *)stats.modified.local); // .local was missing here
            row.SetData(cField, c);//(void *)stats.created.local);
         }
      }

      while(listing.Find())
      {
         if(strcmp(listing.path, "<:>ecere"))
         {
            strcpy(string, directory);
            if(string[0])
            {
               if(!strcmp(directory, "/") || !strcmp(directory, "\\"))
                  strcpy(string, DIR_SEPS);
               else
                  strcat(string, DIR_SEPS);
            }
            PathCat(string, listing.name);
            if(listing.stats.attribs.isDirectory)
               ViewArchive(listing.path);
            else
            {
               row = viewList.AddRow();
               row.SetData(nameField, string);
               row.SetData(sizeField, listing.stats.size);
               {
                  TimeStamp m = listing.stats.modified.local, c = listing.stats.created.local;
                  row.SetData(mField, m);//(void *)listing.stats.modified.local);
                  row.SetData(cField, c);//(void *)listing.stats.created.local);
               }
            }
         }
      }
   }

   SelfExtract()
   {
      viewList.AddField(nameField);
      viewList.AddField(sizeField);
      viewList.AddField(mField);
      viewList.AddField(cField);

      ViewArchive(archivePath);
      return true;
   }
}

class SelfExtractApp : GuiApplication
{
   void Main()
   {
      char title[1024];

      app = this;

      if(argc > 1)
      {
         strcpy(archive, argv[1]);
         sprintf(archivePath, "<%s>", archive);
         sprintf(title, $"ECERE Archive - %s", argv[1]);
      }
      else
      {
         strcpy(archive, ":");
         strcpy(archivePath, ":");
         strcpy(title, $"ECERE Self-Extractable Archive");
      }

      SetLoggingMode(stdOut, null);
      SelfExtract { text = title };

      GuiApplication::Main();
   }
}

SelfExtractApp app;
