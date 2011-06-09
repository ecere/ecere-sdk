#ifdef BUILDING_ECERE_COM
namespace gui::controls;
import "Window"
#else
#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif
#endif

void MakeSlashPath(char * p)
{
   FileFixCase(p);
#ifdef WIN32
   ChangeCh(p, '\\', '/');
#endif
}

void MakeSystemPath(char * p)
{
   /*
#if defined(__WIN32__)
   ChangeCh(p, '/', '\\');
#else
   ChangeCh(p, '\\', '/');
#endif*/
   FileFixCase(p);
}

public char * CopySystemPath(char * p)
{
   char * d = CopyString(p);
   if(d)
      MakeSystemPath(d);
   return d;
}

public char * CopyUnixPath(char * p)
{
   char * d = CopyString(p);
   if(d)
      MakeSlashPath(d);
   return d;
}

public char * GetSystemPathBuffer(char * d, char * p)
{
   if(d != p)
      strcpy(d, p ? p : "");
   MakeSystemPath(d);
   return d;
}

public char * GetSlashPathBuffer(char * d, char * p)
{
   if(d != p)
      strcpy(d, p ? p : "");
   MakeSlashPath(d);
   return d;
}

public char * PathCatSlash(char * string, char * addedPath)
{
   bool modified = false;
   if(addedPath)
   {
      char fileName[MAX_LOCATION] = "", archiveName[MAX_LOCATION] = "", * file;
      int c = 0;
      bool isURL = false;
      char * urlFileName;

      if(SplitArchivePath(string, archiveName, &file))
         strcpy(fileName, file);
      else
      {
         strcpy(fileName, string);
      }

      if(strstr(string, "http://") == string)
      {
         char * slash = strstr(fileName + 7, "/");
         isURL = true;
         if(slash)
            urlFileName = slash;
         else
            urlFileName = fileName + strlen(fileName);
      }
      if(strstr(addedPath, "http://") == addedPath)
      {
         strcpy(fileName, "http://");
         isURL = true;
         c = 7;
      }
      else if(GetRuntimePlatform() == win32)
      {
         if(addedPath[0] && addedPath[1] == ':' && addedPath[0] != '<')
         {
            fileName[0] = (char)toupper(addedPath[0]);
            fileName[1] = ':';
            fileName[2] = '\0';
            c = 2;
            modified = true;
         }
         else if(addedPath[0] == '\\' && addedPath[1] == '\\')
         {
            fileName[0] = fileName[1] = '\\';
            fileName[2] = '\0';
            c = 2;
            modified = true;
         }
         // A drive needs to be selected
         /* TOCHECK: Cutting this out, can't handle relative path
         else if(fileName[0] == '/' && !archiveName[0] && strcmp(addedPath, "/"))
            return null;
         */
      }

      if(!modified && isURL && (addedPath[0] == '\\' || addedPath[0] == '/'))
      {
         urlFileName[0] = '/';
         urlFileName[1] = '\0';
      }
      else if(!modified && (addedPath[0] == '\\' || addedPath[0] == '/'))
      {
         if(GetRuntimePlatform() == win32)
         {
            // Entire Computer
            if(addedPath[0] == '/' && !addedPath[1])
            {
               fileName[0] = addedPath[0];
               fileName[1] = '\0';
               modified = true;
            }
            // Root of drive
            else if(fileName[0] && fileName[1] == ':')
            {
               fileName[2] = '\0';
               modified = true;
            }
            // Relative path root of drive
            else
            {
               fileName[0] = '\\';
               fileName[1] = '\0';
               modified = true;
            }
         }
         else
         {
            fileName[0] = '/';
            fileName[1] = '\0';
            modified = true;
         }
         c = 1;
      }

      for(; addedPath[c]; )
      {
         // DANGER OF OVERFLOW HERE
         // char directory[MAX_FILENAME];
         char directory[MAX_FILENAME * 16];
         int len = 0;
         char ch;
         int count;
      
         for(;(ch = addedPath[c]) && (ch == '/' || ch == '\\'); c++);
         for(;(ch = addedPath[c]) && (ch != '/' && ch != '\\'); c++)
         {
            if(isURL && ch == '?')
            {
               break;
            }
            if(len < MAX_FILENAME)
               directory[len++] = ch;  
         }
         directory[len] = '\0';

         // Trim rightmost spaces
         for(count = len-1; count >= 0 && (directory[count] == ' ' || directory[count] == '\t'); count--)
         {
            directory[count] = '\0';
            len--;
         }

         if(len > 0)
         {
            modified = true;
            if(strstr(directory, "..") == directory && (!directory[2] || directory[2] == DIR_SEP || directory[2] == '/'))
            {
               int strLen = strlen(fileName) - 1;
               if(strLen > -1)
               {
                  // Go back one directory
                  for(;(ch = fileName[strLen]) && strLen > -1 && (ch == '/' || ch == '\\'); strLen--);
                  for(;(ch = fileName[strLen]) && strLen > -1 && (ch != '/' && ch != '\\' && ch != ':'); strLen--);
                  for(;(ch = fileName[strLen]) && strLen > -1 && (ch == '/' || ch == '\\'); strLen--);

                  if(isURL)
                  {
                     strLen = Max(strLen, urlFileName - fileName);
                  }
                  if(!strcmp(fileName + strLen + 1, ".."))
                  {
                     strcat(fileName, "/" /*DIR_SEPS*/);
                     strcat(fileName, "..");
                  }
                  else
                  {
                     if(GetRuntimePlatform() == win32)
                     {
                        if(!strLen && fileName[0] == '\\' && fileName[1] == '\\')
                        {
                           if(!fileName[2])
                              return null;
                           else
                           {
                              fileName[0] = '\\';
                              fileName[1] = '\\';
                              fileName[2] = '\0';
                           }
                        }
                        else
                           fileName[strLen+1] = '\0';
                     }
                     else
                     {
                        fileName[strLen+1] = '\0';
                        if(strLen<0)
                        {
                           fileName[0] = '/';
                           fileName[1] = '\0';
                           strLen = 2;
                        }
                     }
                  }
               }
               else
               {
                  strcpy(fileName, "..");
               }
            }
            else if(strcmp(directory, "."))
            {
               int strLen = strlen(fileName);
               bool notZeroLen = strLen > 0;
               // if(strLen > 1 && (fileName[strLen-1] == '/' || fileName[strLen-1] == '\\'))
               if(strLen > 0 && (fileName[strLen-1] == '/' || fileName[strLen-1] == '\\'))
                  strLen--;
               if(notZeroLen /*&& fileName[strLen-1] != ':' && fileName[strLen-1] != '>'*/)
                  fileName[strLen++] = '/';

               fileName[strLen] = '\0';

               if(strLen + strlen(directory) > MAX_LOCATION - 3)
                  return null;   // AN ERROR OCCURED!

               strcat(fileName, directory);
            }
         }
         if(isURL && ch == '/')
            strcat(fileName, "/");
         if(isURL && ch == '?')
         {
            strcat(fileName, addedPath+c);
            break;
         }
      }
      if(archiveName[0])
         sprintf(string, "<%s>%s", archiveName, fileName);
      else
         strcpy(string, fileName);
   }
   return modified ? string : null;
}

default extern int __ecereVMethodID_class_OnGetDataFromString;
default static void _workAround()
{
   int a;
   a.OnGetDataFromString(0);
}

public class DirPath : String
{
   Window OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)
   {
      PathBox pathBox
      {
         dataBox, borderStyle = 0, anchor = { 0, 0, 0, 0 },
         browseDialog = (FileDialog)userData;
         visible = false;

         void OnPathBrowsed(char * browsedPath)
         {
            ListBox lb = (ListBox)((DataBox)parent).parent;
            property::path = browsedPath;
            modifiedDocument = true;
            if(eClass_IsDerived(lb._class, class(ListBox)))
               lb.StopEditing(true);
         }
      };
      pathBox.path = this;
      pathBox.visible = true;
      pathBox.Create();
      if(!dataBox.active)
      {
         pathBox.editBox.Deselect();
         pathBox.editBox.Home();
      }
      return pathBox;
   }

   bool OnSaveEdit(PathBox pathBox, void * object)
   {
      bool changed = false;
      if(pathBox.modifiedDocument)
      {
         /*
         char path[MAX_LOCATION];
         char * c = pathBox.path;
         GetSystemPathBuffer(path, c);
         if(strcmp(path, c))
            pathBox.editBox.contents = path;
         */

         String::OnFree();
         // changed = String::OnGetDataFromString(path);  // TODO: Fix Me
         changed = _class._vTbl[__ecereVMethodID_class_OnGetDataFromString](_class, &this, pathBox.systemPath);
      }
      return changed;
   }

   int OnCompare(DirPath b)
   {
      return fstrcmp(this, b);
   }

}

public enum PathTypeExpected { none, any, directory, file };

public class PathBox : CommonControl
{
   borderStyle = deep;
   clientSize = { 64, 18 };

#if defined(__WIN32__)
   PathBox()
   {
      path[0] = '\0';
   }
#endif

   PathTypeExpected typeExpected;
   FileDialog browseDialog;
#if defined(__WIN32__)
   char path[MAX_LOCATION];
#endif

   BitmapResource file { "<:ecere>mimeTypes/file.png", transparent = true, alphaBlend = true };
   BitmapResource brokenFile { "<:ecere>mimeTypes/brokenFile.png", transparent = true, alphaBlend = true };
   BitmapResource folder { "<:ecere>places/folder.png", transparent = true, alphaBlend = true };
   BitmapResource brokenFolder { "<:ecere>places/brokenFolder.png", transparent = true, alphaBlend = true };

   Picture picture
   {
      this/*, size = { 318, 94 }*/, anchor = { left = 1, vert = 0 };
      image = brokenFolder;
      visible = false;
      opacity = 0;
      alphaBlend = true;
   };

   EditBox editBox
   {
      this/*, size = { 290, 22 }*/, position = { 1, 1 }, anchor = { left = 1, top = 1, right = 1 };
      borderStyle = none;

      void NotifyUpdate(EditBox editBox)
      {
         CheckFileExists();
         modifiedDocument = true;
      }
      bool NotifyModified(EditBox editBox)
      {
         return NotifyModified(master, this);
      }

      bool OnKeyDown(Key key, unichar ch)
      {
         if(key == f4)
            ((PathBox)parent).browse.NotifyClicked(parent, ((PathBox)parent).browse, 0, 0, (Modifiers)null);
         return EditBox::OnKeyDown(key, ch);
      }
   };

   Button browse
   {
      this, size = { w = 26 }, anchor = { top = 0, right = 0, bottom = 0 };
      text = "...";
      hotKey = f2;
      visible = false;
      inactive = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(browseDialog)
         {
            char * browsePath = CopyString(OnBrowse());
            char fileName[MAX_LOCATION];//, filePath[MAX_LOCATION];

            GetLastDirectory(browsePath, fileName);
            StripLastDirectory(browsePath, browsePath);

            if(!browsePath[0])
            {
               char filePath[MAX_LOCATION];
               delete browsePath;
               LocateModule(null, filePath);
               StripLastDirectory(filePath, filePath);
               browsePath = CopyString(filePath);
            }

            while(browsePath[0] && !FileExists(browsePath).isDirectory)
            {
               char temp[MAX_LOCATION];
               GetLastDirectory(browsePath, temp);
               PathCat(temp, fileName);
               strcpy(fileName, temp);
               StripLastDirectory(browsePath, browsePath);
            }
            browseDialog.filePath = fileName;
            browseDialog.currentDirectory = browsePath;
            delete browsePath;
            browseDialog.master = rootWindow;
            if(browseDialog.Modal())
            {
               OnPathBrowsed(browseDialog.filePath);
               NotifyModified(master, this);
            }
         }
         return true;
      }
   };

   void CheckFileExists()
   {
      if(typeExpected != none)
      {
         BitmapResource icon = null;
         FileAttribs exists = FileExists(editBox.contents);
         
         //printf("%s\n", editBox.contents);
         switch(typeExpected)
         {
            case any:
               // TODO: improvements, add drive, etc, also find a better solution/icon for expect any and file doesn't exist
               icon = exists ? exists.isFile ? file : exists.isDirectory ? folder : null : null;
               break;
            case directory:
               icon = exists && exists.isDirectory ? folder : brokenFolder;
               break;
            case file:
               icon = exists && exists.isFile ? file : brokenFile;
               break;
         }

         picture.image = icon;
      }
   }

   void OnRedraw(Surface surface)
   {
      if(!isEnabled)
      {
         surface.SetBackground(activeBorder);
         surface.Area(0, 0, clientSize.w, clientSize.h);
      }
      else
         Window::OnRedraw(surface);
   }

   ~PathBox()
   {
      delete browseDialog;
   }

public:
   property PathTypeExpected typeExpected
   {
      set
      {
         if(value != typeExpected)
         {
            if(value == none || typeExpected == none)
            {
               bool withIcon = value != none;
               picture.visible = withIcon;
               editBox.anchor.left = withIcon ? 18 : 1;
               CheckFileExists();
            }
            typeExpected = value;
            if(browseDialog && browseDialog.type == open && typeExpected == directory)
               browseDialog.type = selectDir;
         }         
      }
   }

   property FileDialog browseDialog
   {
      set
      {
         delete browseDialog;
         browseDialog = value;
         if(browseDialog)
         {
            incref browseDialog;
            if(browseDialog.type == open && typeExpected == directory)
               browseDialog.type = selectDir;
            if(!strcmp(browseDialog.text, "Select a file...") && text)
            {
               char temp[1024] = "Select ";
               strcat(temp, text);
               strcat(temp, "...");
               browseDialog.text = temp;
            }
         }
         browse.visible = browseDialog ? true : false;
         editBox.anchor.right = browseDialog ? 26 : 1;
      }
   }

   void Home() { editBox.Home(); }
   void End() { editBox.End(); }

   void SelectAll() { editBox.SelectAll(); }
   void Deselect() { editBox.Deselect(); }

   property String path
   {
      set
      {
         char path[MAX_LOCATION];
         GetSystemPathBuffer(path, value);
         editBox.contents = path;
         editBox.SelectAll();
         CheckFileExists();
      }
      get { return editBox.contents; }
   }
   property String slashPath  { get { return GetSlashPathBuffer (path, editBox.contents); } };
   property String systemPath { get { return GetSystemPathBuffer(path, editBox.contents); } };

   virtual char * OnBrowse()
   {
      return editBox.contents;
   }

   virtual void OnPathBrowsed(char * browsedPath)
   {
      property::path = browsedPath;
      editBox.SelectAll();
   }

   virtual bool Window::NotifyModified(PathBox pathBox);
}
