namespace gui::dialogs;

//#ifdef __WIN32__  // We want the strings in the .pot when building on Unix
static define rootName = $"Entire Computer";
static define msNetwork = $"Microsoft Windows Network";
//#endif

import "Window"

#define IS_ALUNDER(ch) ((ch) == '_' || isalnum((ch)))

default:
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit;
private:

static const char * iconNames[] =
{
   "<:ecere>places/folder.png",
   "<:ecere>status/folderOpen.png",
   "<:ecere>devices/computer.png",
   "<:ecere>devices/driveHardDisk.png",
   "<:ecere>places/driveRemote.png",
   "<:ecere>devices/mediaOptical.png",
   "<:ecere>devices/driveRemovableMedia.png",
   "<:ecere>devices/mediaFloppy.png",
   "<:ecere>places/networkWorkgroup.png",
   "<:ecere>places/networkServer.png",
   "<:ecere>places/folderRemote.png",

   "<:ecere>mimeTypes/file.png",                   /*normalFile*/
   "<:ecere>mimeTypes/textEcereWorkspace.png",     /*ewsFile*/
   "<:ecere>mimeTypes/textEcereProject.png",       /*epjFile*/
   "<:ecere>mimeTypes/textEcereSource.png",        /*ecFile*/
   "<:ecere>mimeTypes/textEcereHeader.png",        /*ehFile*/
   "<:ecere>mimeTypes/textCSource.png",            /*cFile*/
   "<:ecere>mimeTypes/textCHeader.png",            /*hFile*/
   "<:ecere>mimeTypes/textC++Source.png",          /*cppFile*/
   "<:ecere>mimeTypes/textC++Header.png",          /*hppFile*/
   "<:ecere>mimeTypes/text.png",                   /*textFile*/
   "<:ecere>mimeTypes/textHyperTextMarkup.png",    /*webFile*/
   "<:ecere>mimeTypes/image.png",                  /*pictureFile*/
   "<:ecere>status/audioVolumeHigh.png",           /*soundFile*/
   "<:ecere>mimeTypes/package.png",                /*archiveFile*/
   "<:ecere>mimeTypes/packageSoftware.png",        /*packageFile*/
   "<:ecere>mimeTypes/packageOpticalDisc.png"      /*opticalMediaImageFile*/
};

public enum FileNameType     // Had to be private, since icons member of FileDialog is also private... (Static members? Not for a while...)
{
   folder, folderOpen, computer,
   drive, netDrive, cdrom, removable, floppy, network, server, share, // these are sort equal

   normalFile, ewsFile, epjFile, ecFile, ehFile, cFile, hFile, cppFile, hppFile,
   textFile, webFile, pictureFile, soundFile,
   archiveFile, packageFile, opticalMediaImageFile; /* these (all previous) are sort equal */

   /*property char *
   {
      set
      {
         this = SelectByExtension(value);
      }
   }*/
   public property bool isFolderType
   {
      get { return this >= folder && this <= share; }
   }

   public property bool isFileType
   {
      get { return this >= normalFile && this <= opticalMediaImageFile; }
   }

   FileNameType ::SelectByExtension(const char * extension)
   {
      if(!strcmpi(extension, "ews"))
         return ewsFile;
      else if(!strcmpi(extension, "epj"))
         return epjFile;
      else if(!strcmpi(extension, "ec"))
         return ecFile;
      else if(!strcmpi(extension, "eh"))
         return ehFile;
      else if(!strcmpi(extension, "cpp") ||
            !strcmpi(extension, "cc") || !strcmpi(extension, "cxx"))
         return cppFile;
      else if(!strcmpi(extension, "hpp") ||
            !strcmpi(extension, "hh") || !strcmpi(extension, "hxx"))
         return hppFile;
      else if(!strcmpi(extension, "c"))
         return cFile;
      else if(!strcmpi(extension, "h"))
         return hFile;
      else if(!strcmpi(extension, "txt") || !strcmpi(extension, "text") ||
            !strcmpi(extension, "nfo") || !strcmpi(extension, "info"))
         return textFile;
      else if(!strcmpi(extension, "htm") || !strcmpi(extension, "html") ||
            !strcmpi(extension, "css") || !strcmpi(extension, "php") ||
            !strcmpi(extension, "js"))
         return webFile;
      else if(!strcmpi(extension, "bmp") || !strcmpi(extension, "pcx") ||
            !strcmpi(extension, "jpg") || !strcmpi(extension, "jpeg") ||
            !strcmpi(extension, "gif") || !strcmpi(extension, "png") ||
            !strcmpi(extension, "ico"))
         return pictureFile;
      else if(!strcmpi(extension, "wav") || !strcmpi(extension, "mp3") ||
            !strcmpi(extension, "ogg") || !strcmpi(extension, "snd"))
         return soundFile;
      else if(!strcmpi(extension, "ear") || !strcmpi(extension, "7z") ||
            !strcmpi(extension, "rar") || !strcmpi(extension, "zip") ||
            !strcmpi(extension, "gz") || !strcmpi(extension, "bz2") ||
            !strcmpi(extension, "tar") || !strcmpi(extension, "arj") ||
            !strcmpi(extension, "lza") || !strcmpi(extension, "lzh") ||
            !strcmpi(extension, "cpio") || !strcmpi(extension, "z"))
         return archiveFile;
      else if(!strcmpi(extension, "cab") || !strcmpi(extension, "deb") ||
            !strcmpi(extension, "rpm"))
         return packageFile;
      else if(!strcmpi(extension, "iso") || !strcmpi(extension, "mds") ||
            !strcmpi(extension, "cue") || !strcmpi(extension, "bin") ||
            !strcmpi(extension, "ccd") || !strcmpi(extension, "bwt") ||
            !strcmpi(extension, "cdi") || !strcmpi(extension, "nrg"))
         return opticalMediaImageFile;
      return normalFile;
   }
};

public enum FileDialogType { open, save, selectDir, multiOpen };
public struct FileFilter
{
   const char * name;
   const char * extensions;

   bool ValidateFileName(const char * name)
   {
      if(strcmp(name, "..") && strcmp(name, ".") && strcmp(name, ""))
      {
         if(extensions) // && !stats.attribs.isDirectory)
         {
            char extension[MAX_EXTENSION], compared[MAX_EXTENSION];
            int c;

            GetExtension(name, extension);
            for(c = 0; extensions[c];)
            {
               int len = 0;
               char ch;
               for(;(ch = extensions[c]) && !IS_ALUNDER(ch); c++);
               for(;(ch = extensions[c]) &&  IS_ALUNDER(ch); c++)
                  compared[len++] = ch;
               compared[len] = '\0';

               if(!strcmpi(extension, compared))
                  return true;
            }
         }
         else
            return true;
      }
      return false;
   }
};
public enum FileForceExtension { never, always, whenNoneGiven };
public struct FileType
{
   const char * name, * typeExtension;
   FileForceExtension forceExtension;
};

static enum FileDialogSelectFrom { fromEditBox, fromListBox, fromDropBox };

public struct FileName
{
   const char * name;
   FileNameType type;
   int indent;

   void OnDisplay(Surface surface, int x, int y, int width, FileDialog fileDialog, Alignment alignment, DataDisplayFlags displayFlags)
   {
      int indentSize = (displayFlags.dropBox) ? 0 : 10;
      int textOffset;

      Bitmap icon = fileDialog.icons[type].bitmap;
      if(!icon && type > normalFile)
         icon = fileDialog.icons[normalFile].bitmap;
      if(!icon)
      {
         if(type == folder || type == folderOpen)
            surface.SetForeground(red); //Color { 170, 170, 0 } // REDJ What is that color?
         indentSize = 8;
      }
      textOffset = indent * indentSize + (icon ? (icon.width + 4) : 0);

      surface.WriteTextDots
         (alignment, x + textOffset, y + 2, width - textOffset, name, strlen(name));
      if(icon)
         surface.Blit(icon, x + indent * indentSize, y,0,0, icon.width, icon.height);
   }

   int OnCompare(FileName b)
   {
      int result = 0;
      if(type == b.type || (type >= normalFile && b.type >= normalFile) || (type >= drive && type <= share))
         result = strcmpi(name, b.name);
      else
      {
         if(type == folder && b.type >= normalFile) result = -1;
         else if(type >= normalFile && b.type == folder) result = 1;
      }
      return result;
   }

   void OnCopy(FileName newData)
   {
      type = newData.type;
      indent = newData.indent;
      if(newData.name)
      {
         int len = strlen(newData.name) + 1;
         name = new char[len];
         CopyBytes((char *)name, newData.name, len);
      }
   }

   bool OnGetDataFromString(const char * string)
   {
      int len = strlen(string) + 1;
      name = new char[len];
      CopyBytes((char *)name, string, len);
      return true;
   }

   void OnFree()
   {
      char * n = (char *)name;
      delete n;
      name = null;
   }

   const char * OnGetString(char * string, void * fieldData, ObjectNotationType * onType)
   {
      return name;
   }
};

public class FileDialog : Window
{
   text = $"Select a file...";
   background = formColor;
   hasClose = true;
   borderStyle = sizable;
   tabCycle = true;
   autoCreate = false;
   minClientSize = { 500, 300 };

public:
   property FileDialogType type
   {
      get { return style; }
      set
      {
         int numTypes = sizeTypes / sizeof(FileType);
         int rightOffset = (value != selectDir && numTypes > 0) ? 48 : 16;

         style = value;

         if(value == selectDir)
         {
            // Filters
            filter.visible = false;
            filterLabel.visible = false;
            // Types
            type.visible = false;
            typeLabel.visible = false;

            open.visible = true;
            open.isDefault = true;

            ok.text = $"Select";
            ok.id = DialogResult::ok;
            ok.hotKey = altS;
            ok.isDefault = false;
         }
         else
         {
            // Filters
            filter.visible = true;
            filterLabel.visible = true;

            // Types
            type.visible = numTypes != 0;
            typeLabel.visible = numTypes != 0;

            open.visible = false;
            open.isDefault = false;

            ok.text = $"OK";
            ok.id = 0;
            ok.hotKey = 0;
            ok.isDefault = true;
         }
         ok.anchor = { right = 10, bottom = 32 + rightOffset - 1 };

         // Cancel Button
         cancel.anchor = { right = 10, bottom = rightOffset - 1 };

         listBox.anchor = { left = 8, right = 8, top = 40, bottom = 64 + rightOffset };
         fileName.anchor = { left = 96, bottom = 32 + rightOffset, right = 104 };
         fileNameLabel.anchor = { left = 8, bottom = 35 + rightOffset };

         listBox.multiSelect = value == multiOpen;
         fileName.text = (value == selectDir) ? $"Directory:" : $"File Name:";
      }
   };

   // Stuff currently in config moving to FileDialog:
   property const char * filePath { set { strcpy(filePath, value ? value : ""); } get { return (char *)filePath; } };
   property const char * currentDirectory
   {
      set
      {
         GetWorkingDir(currentDirectory, MAX_DIRECTORY);
         PathCat(currentDirectory, value);
         FileFixCase(currentDirectory);
      }
      get { return currentDirectory; }
   };
   property FileFilter * filters { set { filters = value; } get { return filters; } };
   property FileType * types { set { types = value; } get { return types; } };

   // Replace with Array system
   property int sizeFilters
   {
      set
      {
         int numFilters = value / sizeof(FileFilter);
         int c;

         sizeFilters = value;

         // File Extension Filter
         filter.Clear();
         // filter.AddField(null);
         if(filters)
         {
            for(c = 0; c<numFilters; c++)
            {
               DataRow row = filter.AddString(filters[c].name);
               row.tag = c;
            }
         }
         if(!numFilters)
            filter.AddString($"All files");

         if(fileFilter >= numFilters) fileFilter = 0;
         filter.currentRow = filter.FindRow(fileFilter);
      }
      get { return sizeFilters; }
   };
   property int sizeTypes
   {
      set
      {
         int numTypes = value / sizeof(FileType);
         int rightOffset = (numTypes > 0) ? 48 : 16;

         sizeTypes = value;

         // Filters
         filter.anchor = { left = 96, right = 104, bottom = rightOffset };
         filterLabel.anchor = { left = 8, bottom = 3 + rightOffset };

         if(style != selectDir)
         {
            // Types
            type.visible = numTypes ? true : false;
            typeLabel.visible = numTypes ? true : false;

            // Ok Button
            ok.anchor = { right = 10, bottom = 32 + rightOffset - 1 };

            // Cancel Button
            cancel.anchor = { right = 10, bottom = rightOffset - 1 };
         }

         listBox.anchor = { left = 8, right = 8, top = 40, bottom = 64 + rightOffset };
         fileName.anchor = { left = 96, bottom = 32 + rightOffset, right = 104 };
         fileNameLabel.anchor = { left = 8, bottom = 35 + rightOffset };

         // File Types
         if(numTypes)
         {
            int c;

            type.Clear();
            // type.AddField(null);
            if(types)
            {
               for(c = 0; c<numTypes; c++)
               {
                  DataRow row = type.AddString(types[c].name);
                  row.tag = c;
               }
            }
            if(fileType >= numTypes) fileType = 0;

            type.currentRow = type.FindRow(fileType);
         }
      }
      get { return sizeTypes; }
   };

   property int filter
   {
      set
      {
         fileFilter = value;
         filter.currentRow = filter.FindRow(fileFilter);
      }
      get { return fileFilter; }
   };
   property int fileType { set { fileType = value; } get { return fileType; } };
   property bool mayNotExist { set { mayNotExist = value; } get { return mayNotExist; } };

   // Get only
   property int numSelections { get { return numSelections; } };
   property const char * const * multiFilePaths { get { return (const char * const *)multiFilePaths; } };

private:
   FileDialog()
   {
      FileNameType c;

      lookIn.AddField(lookInField);
      listBox.AddField(nameField);
      listBox.AddField(typeField);
      listBox.AddField(sizeField);

      filter.currentRow = filter.AddString($"All files");

      GetWorkingDir(currentDirectory, MAX_DIRECTORY);
      FileFixCase(currentDirectory);

      // Resources
      for(c = 0; c<FileNameType::enumSize; c++)
      {
         icons[c] = BitmapResource { iconNames[c], alphaBlend = true };
         AddResource(icons[c]);
      }
   }

   ~FileDialog()
   {
      char * customExtensions = (char *)customFilter.extensions;
      delete customExtensions;
      customFilter.extensions = null;
      if(multiFilePaths)
      {
         int c;
         for(c = 0; c<numSelections; c++)
            delete multiFilePaths[c];
         delete multiFilePaths;
      }
   }

   void ListDrives()
   {
      int start = 0;
      char tmpDir[MAX_FILENAME];
      DataRow row;
      FileName fileName;
#ifdef __WIN32__
      FileListing listing { "/" };
#endif
      int c;

      fileName.indent = 0;

      // Fill the path dropbox
      lookIn.Clear();

      row = lookIn.AddRow();

   #ifdef __WIN32__
      fileName.name = rootName;
   #else
      fileName.name = "/";
   #endif
      fileName.type = computer;
      row.SetData(null, fileName);
      lookIn.currentRow = row;

      start = 0;
   #ifdef __WIN32__
      while(listing.Find())
      {
         row = lookIn.AddRow();

         fileName.name = listing.name;
         fileName.type = drive;
         if(listing.stats.attribs.isCDROM) fileName.type = cdrom;
         if(listing.stats.attribs.isRemote) fileName.type = netDrive;
         if(listing.stats.attribs.isRemovable)
         {
            if(listing.name[0] == 'A' || listing.name[0] == 'B')
               fileName.type = floppy;
            else
               fileName.type = removable;
         }

         fileName.indent = 1;
         row.SetData(null, fileName);

         start = 2;
         if(listing.name[0] == currentDirectory[0] &&
            listing.name[1] == currentDirectory[1])
         {
   #endif
            for(c = start; currentDirectory[c]; )
            {
               int len = 0;
               char ch;
               for(;(ch = currentDirectory[c]) && (ch == '/' || ch == '\\'); c++);
               for(;(ch = currentDirectory[c]) && (ch != '/' && ch != '\\'); c++)
               {
                  if(len < MAX_FILENAME)
                     tmpDir[len++] = ch;
               }
               for(;(ch = currentDirectory[c]) && (ch == '/' || ch == '\\'); c++);
               tmpDir[len] = '\0';

               if(len > 0)
               {
                  row = lookIn.AddRow();
                  fileName.name = tmpDir;
                  fileName.type = ch ? folder : folderOpen;
                  fileName.indent++;
                  row.SetData(null, fileName);
               }
               if(!ch)
                  lookIn.currentRow = row;
            }
   #ifdef __WIN32__
            if(c == start)
               lookIn.currentRow = row;
         }
         c++;
      }

      row = lookIn.AddRow();
      fileName.name = msNetwork;
      fileName.type = network;
      fileName.indent = 0;
      row.SetData(null, fileName);
      if(!strcmp(currentDirectory, "\\\\"))
         lookIn.currentRow = row;
      else
      {
         if(currentDirectory[0] == '\\' && currentDirectory[1] == '\\')
         {
            for(c = 2; currentDirectory[c]; )
            {
               int len = 0;
               char ch;
               for(;(ch = currentDirectory[c]) && (ch == '/' || ch == '\\'); c++);
               for(;(ch = currentDirectory[c]) && (ch != '/' && ch != '\\'); c++)
               {
                  if(len < MAX_FILENAME)
                     tmpDir[len++] = ch;
               }
               for(;(ch = currentDirectory[c]) && (ch == '/' || ch == '\\'); c++);
               tmpDir[len] = '\0';

               if(len > 0)
               {
                  row = lookIn.AddRow();
                  fileName.name = tmpDir;
                  fileName.indent++;
                  if(fileName.indent == 1)
                     fileName.type = server;
                  else if(fileName.indent == 2)
                     fileName.type = share;
                  else
                     fileName.type = ch ? folder : folderOpen;
                  row.SetData(null, fileName);
               }
               if(!ch)
                  lookIn.currentRow = row;
            }
            if(c == 2)
               lookIn.currentRow = row;
         }
      }
   #endif
   }

   // flag = false : Get Name From Edit Box, flag = true : Get Name From List Box
   void GetNameFromListBox(bool flag)
   {
      bool okDisabled;
      if(flag)
      {
         if(style == multiOpen)
            okDisabled = listBox.numSelections == 0;
         else
            okDisabled = listBox.currentRow == null;
         if(okDisabled) flag = false;
      }
      else
         okDisabled = !fileName || !fileName.line.text[0];

      getNameFromListBox = flag;
      ok.disabled = okDisabled;
      open.disabled = okDisabled;

      if(style == selectDir)
      {
         if(okDisabled)
         {
            ok.disabled = false;
            ok.caption = $"Select Here";
            ok.isDefault = true;
            open.isDefault = false;

            // Never use contents of editbox for 'Select Here'
            getNameFromListBox = true;
         }
         else
         {
            ok.caption = $"Select";
            ok.isDefault = false;
            open.isDefault = true;
         }
      }
   }

   void ListFiles()
   {
      FileListing listing { currentDirectory };
      int c = 0;
      FileName fileName;
      DataRow row;

      if(sizeFilters < sizeof(FileFilter) && !fileFilter)
         listing.extensions = null;
      else if(filters && fileFilter < sizeFilters / (int)sizeof(FileFilter))
         listing.extensions = filters[fileFilter].extensions;
      else
         listing.extensions = customFilter.extensions;

      listBox.Clear();

      fileName.indent = 0;
      while(listing.Find())
      {
         if(style != selectDir || (listing.stats.attribs.isDirectory))
         {
            row = listBox.AddRow();

            fileName.name = listing.name;
            if(listing.stats.attribs.isDirectory)
            {
               fileName.type = (listing.stats.attribs.isDrive) ? drive : folder;
               if(listing.stats.attribs.isServer) fileName.type = server;
               if(listing.stats.attribs.isShare) fileName.type = share;
               if(listing.stats.attribs.isCDROM) fileName.type = cdrom;
               if(listing.stats.attribs.isRemote) fileName.type = netDrive;
               if(listing.stats.attribs.isRemovable)
               {
                  if(listing.name[0] == 'A' || listing.name[0] == 'B')
                     fileName.type = floppy;
                  else
                     fileName.type = removable;
               }
               row.SetData(nameField, fileName);
               row.SetData(typeField, null);
            }
            else
            {
               char extension[MAX_EXTENSION];

               GetExtension(fileName.name, extension);
               fileName.type = FileNameType::SelectByExtension(extension);
               strupr(extension);
               row.SetData(nameField, fileName);
               row.SetData(typeField, extension);
               row.SetData(sizeField, listing.stats.size);
            }
         }
         c++;
      }

      if(sortOrder && sortField != nameField)
         listBox.Sort(nameField, 1);
      listBox.Sort(sortField, sortOrder);

      GetNameFromListBox(activeChild == listBox);

      // Go up button
      if(!strcmp(currentDirectory, "/"))
      {
   #ifdef __WIN32__
         row = listBox.AddRow();
         fileName.name = msNetwork;
         fileName.type = network;
         fileName.indent = 0;
         row.SetData(nameField, fileName);
         row.SetData(typeField, null);
   #endif
         goUp.disabled = true;
      }
      else
         goUp.disabled = false;

      ListDrives();

      listBox.typingTimeout = 0.5;
   }


   bool GetNamesFromRow(DataRow row, char ** selectedFileName)
   {
      FileName * fileName;

      if(style == multiOpen)
      {
         OldList selection;
         listBox.GetMultiSelection(selection);
         if(selection.count)
         {
            int totalLen = 0;
            OldLink item;

            // First allocate enough memory
            for(item = selection.first; item; item = item.next)
            {
               row = item.data;
               fileName = row.GetData(nameField);
   #ifdef __WIN32__
               if(!strcmp(currentDirectory, "/"))
               {
                  if(!strcmp(fileName->name, msNetwork))
                     totalLen += 2;
                  else
                     totalLen += 3;
               }
               else
   #endif
               totalLen += strlen(fileName->name);
               if(item != selection.first)
                  totalLen += 3;
            }
            if(selection.count > 1) totalLen += 2;
            *selectedFileName = new char[totalLen + 1];
            (*selectedFileName)[0] = '\0';

            // Then build the string
            for(item = selection.first; item; item = item.next)
            {
               row = item.data;
               fileName = row.GetData(nameField);
               if(item != selection.first) strcat(*selectedFileName, " ");
               if(selection.count > 1) strcat(*selectedFileName, "\"");
   #ifdef __WIN32__
               if(!strcmp(currentDirectory, "/"))
               {
                  char name[3];
                  if(!strcmp(fileName->name, msNetwork))
                     strcpy(name, "\\\\");
                  else
                  {
                     name[0] = fileName->name[0];
                     name[1] = fileName->name[1];
                     name[2] = '\0';
                  }
                  strcat(*selectedFileName, name);
               }
               else
   #endif
               strcat(*selectedFileName, fileName->name);
               if(selection.count > 1) strcat(*selectedFileName, "\"");
            }
            selection.Free(null);
            return true;
         }
      }
      else if(row)
      {
         fileName = row.GetData(nameField);
         if(fileName != null)
         {
   #ifdef __WIN32__
            if(!strcmp(currentDirectory, "/"))
            {
               *selectedFileName = new char[3];
               if(!strcmp(fileName->name, msNetwork))
                  strcpy(*selectedFileName, "\\\\");
               else
               {
                  (*selectedFileName)[0] = fileName->name[0];
                  (*selectedFileName)[1] = fileName->name[1];
                  (*selectedFileName)[2] = '\0';
               }
            }
            else
   #endif
            {
               *selectedFileName = new char[strlen(fileName->name) + 1];
               strcpy(*selectedFileName, fileName->name);
            }
            return true;
         }
      }
      return false;
   }

   bool SelectFile(const char * fileName, FileDialogSelectFrom from, bool isOK)
   {
      bool result = true;
      FileAttribs exists = 0;
      char * wildcardPointer = fileName ? strstr(fileName, "*") : null;

      if(wildcardPointer)
      {
         if(style != selectDir)
         {
            int numFilters = sizeFilters / sizeof(FileFilter);
            int numExtensions = 0;
            char * pointer = wildcardPointer;

            fileFilter = -1;

            // Count the number of extensions in requested filter
            while(pointer)
            {
               if(pointer[1] == '.' && pointer[2])
                  pointer +=3;
               else
                  pointer ++;
               pointer = strstr(pointer, "*");
               numExtensions++;
            }

            // Try to match the extension(s) to an existing filter
            if(numFilters)
            {
               int filter;
               char extension[MAX_EXTENSION], compared[MAX_EXTENSION];
               for(filter = 0; filter<numFilters; filter++)
               {
                  if(filters[filter].extensions)
                  {
                     int numMatched = 0;
                     int c, d;

                     for(c = 0; filters[filter].extensions[c];)
                     {
                        bool matched = false;
                        int len = 0;
                        char ch;
                        for(;(ch = filters[filter].extensions[c]) && !IS_ALUNDER(ch); c++);
                        for(;(ch = filters[filter].extensions[c]) &&  IS_ALUNDER(ch); c++)
                           compared[len++] = ch;
                        compared[len] = '\0';

                        for(d = 0; wildcardPointer[d]; )
                        {
                           len = 0;
                           for(;(ch = wildcardPointer[d]) && !IS_ALUNDER(ch); d++);
                           for(;(ch = wildcardPointer[d]) && IS_ALUNDER(ch); d++)
                           {
                              if(len < MAX_EXTENSION)
                                 extension[len++] = ch;
                           }
                           extension[len] = '\0';

                           if(!strcmpi(extension, compared))
                           {
                              matched = true;
                              break;
                           }
                        }

                        if(matched)
                           numMatched++;
                        else
                        {
                           numMatched = 0;
                           break;
                        }
                     }
                     if(numMatched == numExtensions)
                     {
                        fileFilter = filter;
                        break;
                     }
                  }
                  else if(!strcmp(wildcardPointer, "*") || strstr(wildcardPointer, "*.*"))
                  {
                     fileFilter = filter;
                     break;
                  }
               }
            }
            // Only have *.* to check for
            else if(!strcmp(wildcardPointer, "*") || strstr(wildcardPointer, "*.*"))
               this.fileFilter = 0;

            // If we can't match it, use the custom extension
            if(this.fileFilter == -1)
            {
               char extension[MAX_EXTENSION];
               int c;
               char * name = new char[numExtensions * (4 + MAX_EXTENSION)];
               char * customExtensions = (char *)customFilter.extensions;
               delete customExtensions;
               customFilter.extensions = null;

               if(!strcmp(wildcardPointer, "*") || strstr(wildcardPointer, "*.*"))
               {
                  strcpy(name, $"All Files");
                  customFilter.extensions = null;
               }
               else
               {
                  customFilter.extensions = new char[numExtensions * (2 + MAX_EXTENSION)];
                  ((char *)customFilter.extensions)[0] = '\0';
                  name[0] = '\0';

                  numExtensions = 0;
                  for(c = 0; wildcardPointer[c]; )
                  {
                     int len = 0;
                     char ch;
                     for(;(ch = wildcardPointer[c]) && !IS_ALUNDER(ch); c++);
                     for(;(ch = wildcardPointer[c]) && IS_ALUNDER(ch); c++)
                     {
                        if(len < MAX_EXTENSION)
                           extension[len++] = ch;
                     }
                     extension[len] = '\0';

                     if(numExtensions)
                     {
                        strcat(name, ", ");
                        strcat((char *)customFilter.extensions, ", ");
                     }
                     strcat(name, "*.");
                     strcat(name, extension);
                     if(!extension[0])
                        strcat((char *)customFilter.extensions, ".");
                     else
                        strcat((char *)customFilter.extensions, extension);

                     numExtensions++;
                  }
               }

               if(!customFilterRow)
               {
                  customFilterRow = filter.AddRow();
                  customFilterRow.tag = numFilters + 1;
               }

               customFilterRow.SetData(null, name);

               fileFilter = numFilters + 1;

               delete name;
            }

            filter.currentRow = filter.FindRow(fileFilter);
            ListFiles();
            result = true;
         }
         *wildcardPointer = '\0';
      }

      if(style == multiOpen)
      {
         int c;
         bool quoted = false;
         bool needQuotes = strchr(fileName, '\"') != null;
         char currentFileName[MAX_LOCATION], * curFileName = currentFileName;
         char ch;
         OldList selections { };
         OldLink selection = null;

         for(c = 0;; c++)
         {
            ch = fileName[c];
            switch(ch)
            {
               case '\0':
               case '\"':
                  if(!ch || quoted)
                  {
                     // Add filename
                     (*curFileName) = '\0';

                     selection = OldLink { data = new char[strlen(currentFileName)+1] };
                     strcpy(selection.data, currentFileName);
                     selections.Add(selection);

                     curFileName = currentFileName;
                  }
                  quoted ^= true;
                  break;
               default:
                  if(needQuotes && !quoted)
                     break;
                  // Add to filename
                  *(curFileName++) = ch;
            }
            if(!ch) break;
         }

         numSelections = 0;
         multiFilePaths = new char *[selections.count];

         for(selection = selections.first; selection; selection = selection.next)
         {
            char * fileName = selection.data;

            // For every file
            strcpy(currentFileName, currentDirectory);
            if(PathCat(currentFileName, fileName))
            {
               FileFixCase(currentFileName);
               exists = FileExists(currentFileName);
               if(exists.isDirectory)
               {
                  strcpy(currentDirectory, currentFileName);
                  ListFiles();
                  break;
               }
               else if(exists || mayNotExist)
               {
                  char ** path = &multiFilePaths[numSelections++];
                  *path = new char[strlen(currentFileName)+1];
                  strcpy(*path, currentFileName);

                  result = false;
               }
               if(exists && result && from == fromListBox) // From List Box
               {
                  char pathName[MAX_LOCATION];
                  GetLastDirectory(this.fileName.line.text, pathName);
                  this.fileName.Clear();
                  if(!exists.isDirectory)
                     this.fileName.PutS(pathName);
                  break;
               }
            }
         }
         selections.Free(OldLink::Free);
         if(result)
         {
            if(multiFilePaths)
            {
               for(c = 0; c<numSelections; c++)
                  if(multiFilePaths[c])
                     delete multiFilePaths[c];
               delete multiFilePaths;
            }
         }
      }
      else
      {
         strcpy(filePath, currentDirectory);
         if((style == selectDir && !fileName) || PathCat(filePath, fileName) || style == selectDir)
         {
            FileFixCase(filePath);
            exists = FileExists(filePath);
            if(exists.isDirectory && (style != selectDir || !isOK))
            {
               strcpy(currentDirectory, filePath);

               ListFiles();
            }
            else
            {
               // *** SAVING ONLY ****
               if(style == save)
               {
                  if(fileType >= 0 && fileType < sizeTypes)
                  {
                     FileType type = types[fileType];
                     if(type.forceExtension && type.typeExtension)
                     {
                        char extension[MAX_EXTENSION];
                        GetExtension(filePath, extension);
                        if(type.forceExtension == always || !extension[0])
                        {
                           ChangeExtension(filePath, type.typeExtension, filePath);
                           exists = FileExists(filePath);
                        }
                     }
                  }
                  if(!exists || MessageBox { master = this, type = yesNo, text = $"File Already Exists", contents = $"Replace existing file?" }.Modal() == yes)
                     result = false;
               }
               else if(exists || mayNotExist)
               {
                  if(style != selectDir ||
                     (strcmp(filePath, "\\\\") &&
                     strcmp(filePath, "\\\\") &&
                     !(exists.isServer)))
                        result = false;
               }
               // *** DIRECTORY SELECTION ONLY ****
               else if(isOK && style == selectDir &&
                  MessageBox { this, type = yesNo, text = $"Directory doesn't exist", contents = $"Create directory?" }.Modal() == yes)
               {
                  if(MakeDir(filePath))
                     result = false;
               }
            }

            if(exists && result && from == fromListBox) // From List Box
            {
               char pathName[MAX_LOCATION];
               GetLastDirectory(this.fileName.line.text, pathName);
               this.fileName.Clear();
               if(!exists.isDirectory)
                  this.fileName.PutS(pathName);
            }
         }
      }

      if(result && !exists && from == fromDropBox) // drive Drop Box
      {
         ListDrives();
      }

      if(!result)
         Destroy(DialogResult::ok);
      return result;
   }

   bool OnPostCreate()
   {
      if(multiFilePaths)
      {
         int c;
         for(c = 0; c<numSelections; c++)
            delete multiFilePaths[c];
         delete multiFilePaths;
      }
      numSelections = 0;

      ListFiles();
      {
         // Fix up config input directory
         char fileName[MAX_FILENAME];
         #if defined(__WIN32__)
         char * dirOccur = SearchString(filePath, 0, currentDirectory, false, false);
         #else
         char * dirOccur = strstr(filePath, currentDirectory);
         #endif
         if(dirOccur)
         {
            dirOccur += strlen(currentDirectory);
            for(;*dirOccur && (*dirOccur == '/' || *dirOccur == '\\'); dirOccur++);
            strcpy(fileName, dirOccur);
         }
         else
            strcpy(fileName, filePath);

         this.fileName.Clear();
         this.fileName.PutS(fileName);
      }

      GetNameFromListBox(false);

      fileName.MakeActive();
      return true;
   }

   FileDialogType style;
   FileFilter customFilter;
   DataRow customFilterRow;
   bool getNameFromListBox;
   BitmapResource icons[FileNameType];

   char currentDirectory[MAX_DIRECTORY];
   char filePath[MAX_LOCATION];
   FileFilter * filters;
   int sizeFilters;
   FileType * types;
   int sizeTypes;
   int fileFilter, fileType;

   int numSelections;
   char ** multiFilePaths;
   bool mayNotExist;

   // ListBox Configuration
   DataField sortField;
   int sortOrder;

   // File Extension Filter
   DropBox filter
   {
      this, text = $"Filter:", anchor = { left = 96, right = 104, bottom = 16 }, hotKey = altR;

      bool NotifySelect(DropBox control, DataRow row, Modifiers mods)
      {
         fileFilter = (int)(row ? row.tag : 0);
         ListFiles();
         return true;
      }
   };

   Label filterLabel
   {
      this, inactive = true, anchor = { left = 8, bottom = 3 + 16 }, labeledWindow = filter
   };

   // File Types
   DropBox type
   {
      this, text = $"As Type:", visible = false, anchor = { left = 96, right = 104, bottom = 16 }, hotKey = altT;

      bool NotifySelect(DropBox control, DataRow row, Modifiers mods)
      {
         char * selectedFileName = null;
         fileType = (int)(row ? row.tag : 0);
         if(style == save && types && types[fileType].typeExtension)
         {
            if(getNameFromListBox)
            {
               if(GetNamesFromRow(listBox.currentRow, &selectedFileName))
                  fileName.Clear();
            }
            else
            {
               const char * fileName = this.fileName.line.text;
               //selectedFileName = new char[strlen(fileName)+1];      // Room to change extension???
               selectedFileName = new char[MAX_FILENAME];
               strcpy(selectedFileName, fileName);
            }
            ChangeExtension(selectedFileName, types[fileType].typeExtension, selectedFileName);
            fileName.Select(null,0,0, null,0,0);
            fileName.PutS(selectedFileName);
            GetNameFromListBox(false);
         }
         delete selectedFileName;
         return true;
      }
   };

   Label typeLabel
   {
      this, inactive = true, visible = false, anchor = { left = 8, bottom = 19 }, labeledWindow = type;
   };

   // Ok Button
   Button ok
   {
      this, isDefault = true, text = $"OK", anchor = { right = 10, bottom = 32 + 16 - 1 }, size = { 80 };

      bool NotifyClicked(Button control, int x, int y, Modifiers mods)
      {
         bool result;
         char * selectedFileName = null;
         if(getNameFromListBox)
         {
            GetNamesFromRow(listBox.currentRow, &selectedFileName);
            result = SelectFile(selectedFileName, fromListBox, control.id == DialogResult::ok);
            if(result && style == selectDir)
               listBox.MakeActive();
         }
         else
         {
            const char * fileName = this.fileName.line.text;
            selectedFileName = new char[strlen(fileName)+1];
            strcpy(selectedFileName, fileName);
            result = SelectFile(selectedFileName, fromEditBox, control.id == DialogResult::ok);
            if(result && style == selectDir)
               this.fileName.MakeActive();
         }
         delete selectedFileName;
         return result;
      }
   };

   // Open Button (SelectDir only)
   Button open
   {
      this, visible = false, text = $"Open", hotKey = altO, anchor = { right = 100, bottom = 16 - 1 }, size = { 80 };
      NotifyClicked = ok.NotifyClicked;
   };

   // Cancel Button
   Button cancel
   {
      this, text = $"Cancel", anchor = { right = 10, bottom = 16 - 1 }, size = { 80 }, hotKey = escape;
      bool NotifyClicked(Button control, int x, int y, Modifiers mods)
      {
         Destroy(DialogResult::cancel);
         return true;
      }
   };

   // Look In Dropbox
   DropBox lookIn
   {
      this, text = $"Look in:", anchor = { left = 81, top = 8, right = 109 }, hotKey = altL, maxShown = 12;

      bool OnKeyHit(Key key, unichar ch)
      {
         if(key == wheelDown || key == wheelUp)
         {
            ((FileDialog)master).listBox.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit, key, ch);
            return false;
         }
         return true;
      }

      bool NotifySelect(DropBox control, DataRow row, Modifiers mods)
      {
         if(row)
         {
            FileName * fileName = row.GetData(null);
            char name[MAX_LOCATION] = "/";
            int indent = 0;
            int c = 0;
         #ifdef __WIN32__
            if(!strcmp(fileName->name, msNetwork) ||
               (currentDirectory[0] == '\\' &&
                currentDirectory[1] == '\\' &&
                strcmp(fileName->name, rootName) &&
                (!fileName->name[0] || fileName->name[1] != ':')))
            {
               strcpy(name, "\\\\");
               c = 2;
            }
            else
            {
               if(fileName->indent > 1)
               {
                  name[0] = currentDirectory[0];
                  name[1] = ':';
                  name[2] = '\0';
                  indent++;
                  c = 2;
               }
               else if(fileName->indent == 1)
               {
                  name[0] = fileName->name[0];
                  name[1] = ':';
                  name[2] = '\0';
                  c = 2;
                  indent++;
               }
            }
         #endif
            if(indent < fileName->indent)
            {
               for(; currentDirectory[c]; )
               {
                  int len = 0;
                  char ch;
                  char directory[MAX_FILENAME];
                  for(;(ch = currentDirectory[c]) && (ch == '/' || ch == '\\'); c++);
                  for(;(ch = currentDirectory[c]) && (ch != '/' && ch != '\\'); c++)
                  {
                     if(len < MAX_FILENAME)
                        directory[len++] = ch;
                  }
                  for(;(ch = currentDirectory[c]) && (ch == '/' || ch == '\\'); c++);
                  directory[len] = '\0';

                  if(indent >= fileName->indent) break;
                  PathCat(name, directory);
                  indent++;
               }
            }

            SelectFile(name, fromDropBox, false);
         }
         return true;
      }
   };

   DataField lookInField { dataType = "FileName", userData = this };

   Label lookInLabel
   {
      this, position = { 10, 11 }, labeledWindow = lookIn;
   };

   // Main Listbox
   ListBox listBox
   {
      this, borderStyle = deep, hasVertScroll = true, hasHorzScroll = true,
      anchor = { left = 8, right = 8, top = 40, bottom = 64 + 16 },
      hasHeader = true, moveFields = true, resizable = true, sortable = true;

      bool NotifySelect(ListBox control, DataRow row, Modifiers mods)
      {
         GetNameFromListBox(true);
         return true;
      }

      bool NotifyDoubleClick(ListBox control, int x, int y, Modifiers mods)
      {
         bool result = true;
         char * selectedFileName = null;
         if(GetNamesFromRow(control.currentRow, &selectedFileName))
         {
            result = SelectFile(selectedFileName, fromEditBox, false);
         }
         delete selectedFileName;
         return result;
      }

      bool NotifyKeyDown(ListBox control, DataRow row, Key key, unichar ch)
      {
         if(key == backSpace)
         {
            if(strcmp(currentDirectory, "/"))
               goUp.NotifyClicked(this, goUp, 0,0, key.modifiers);
         }
         return true;
      }

      bool NotifySort(ListBox control, DataField field, Modifiers mods)
      {
         sortField = field;
         sortOrder = field.sortOrder;
         return true;
      }

      bool NotifyActivate(Window control, bool active, Window previous)
      {
         if(active)
            GetNameFromListBox(true);
         return true;
      }
   };

   DataField nameField { header = $"Name", dataType = "FileName", width = 304, userData = this }; // editable = true
   DataField typeField { header = $"Type", dataType = /*"String"*/ "char *", width = 40 };
   DataField sizeField { header = $"Size", dataType = "FileSize", width = 96, alignment = right };

   // Go up button
   Button goUp
   {
      this, inactive = true, anchor = { right = 79, top = 8 }, size = { 24, 24 },
      bitmap = { "<:ecere>actions/goUp.png", alphaBlend = true };
      symbol = 30;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         char * notRoot;
         notRoot = StripLastDirectory(currentDirectory, currentDirectory);
         if(!notRoot)
            strcpy(currentDirectory, "/");
         ListFiles();
         return true;
      }
   };

   Button createDirectory
   {
      this, inactive = true, anchor = { right = 51, top = 8 }, size = { 24, 24 },
      bitmap = { "<:ecere>actions/folderNew.png", alphaBlend = true };
      symbol = 30;    // what the heck is that?

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(CreateDirectoryDialog { master = this, parent = parent, currentDirectory = currentDirectory }.Modal() == ok )
            ListFiles();
         return true;
      }
   };

   // File name editbox
   EditBox fileName
   {
      this, text = $"File Name:", anchor = { left = 96, bottom = 32 + 16, right = 104 }, size.h = 20, hotKey = altF;

      bool NotifyActivate(Window control, bool active, Window previous)
      {
         if(active)
         {
            char * selectedFileName = null;
            const char * editText;
            if(getNameFromListBox)
            {
               DataRow row = listBox.currentRow;
               if(row)
               {
                  if(GetNamesFromRow(row, &selectedFileName))
                  {
                     fileName.Clear();
                     fileName.PutS(selectedFileName);
                     fileName.Select(null,0,0, null,0,0);
                  }
                  GetNameFromListBox(false);
               }
            }
            delete selectedFileName;
            editText = fileName.contents;
            if(style != selectDir)
               ok.disabled = !editText || !editText[0];
         }
         return true;
      }

      void NotifyUpdate(EditBox control)
      {
         GetNameFromListBox(false);
      }
   };

   Label fileNameLabel
   {
      this, inactive = true, anchor = { left = 8, bottom = 35 + 16 };
      labeledWindow = fileName;
   };
};

public class CreateDirectoryDialog : Window
{
   background = formColor;
   minClientSize = Size { 240, 100 };
   tabCycle = true;
   hasClose = true;
   text = $"Create Directory";

public:

   property const char * currentDirectory
   {
      set
      {
         GetWorkingDir(currentDirectory, MAX_DIRECTORY);  // is this necessary?
         PathCat(currentDirectory, value);
         FileFixCase(currentDirectory);
      }
      get { return (char *)currentDirectory; }
   };

private:

   char currentDirectory[MAX_DIRECTORY];

   CreateDirectoryDialog()
   {
      GetWorkingDir(currentDirectory, MAX_DIRECTORY);
      FileFixCase(currentDirectory);
   }

   ~CreateDirectoryDialog()
   {
   }

   bool OnPostCreate()
   {
      newDirectoryName.SelectAll();
      return true;
   }

   Button ok
   {
      parent = this, isDefault = true, position = { 70, 60 }, size = { 60 }, text = $"OK";
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(newDirectoryName.contents && newDirectoryName.contents[0])
         {
            char newDirPath[MAX_DIRECTORY];
            strcpy(newDirPath, currentDirectory);
            PathCat(newDirPath, newDirectoryName.contents);
            if(!FileExists(newDirPath).isDirectory)
            {
               MakeDir(newDirPath);
               Destroy(DialogResult::ok);
            }
            else
               MessageBox { master = this, parent = parent, type = ok, text = $"Create Directory Error", contents = $"Directory already exists." }.Modal();
         }
         else
            MessageBox { master = this, parent = parent, type = ok, text = $"Create Directory Error", contents = $"Please enter a name." }.Modal();
         return true;
      }
   };

   Button cancel
   {
      parent = this, position = { 140, 60 }, size = { 60 }, hotKey = escape, text = $"Cancel";
      NotifyClicked = ButtonCloseDialog;
   };

   EditBox newDirectoryName
   {
      this, textHorzScroll = true, anchor = { left = 10, right = 10, top = 30 }, size = { 250 };
      hotKey = altN, text = $"Name";
      contents = $"New Directory";
   };
   Label { this, position = { 10, 10 }, labeledWindow = newDirectoryName };

}
