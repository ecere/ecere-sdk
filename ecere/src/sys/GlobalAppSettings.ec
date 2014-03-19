namespace sys;

#if defined(__WIN32__)
#define WIN32_LEAN_AND_MEAN
#define UNICODE
#define String String_
#define strlen _strlen
#include <windows.h>
#undef String
#undef strlen
#endif

import "System"
import "Container"

public enum GlobalSettingType
{
   integer,
   singleString,
   stringList
};

public enum SettingsIOResult { error, success, fileNotFound, fileNotCompatibleWithDriver };

public class GlobalSettingsDriver
{
   class_data const char * name;

   class_property const char * name
   {
      set { class_data(name) = value; }
      get { return class_data(name); }
   }

public:
   virtual SettingsIOResult ::Load(File f, GlobalSettings globalSettings);
   virtual SettingsIOResult ::Save(File f, GlobalSettings globalSettings);

}

static subclass(GlobalSettingsDriver) GetGlobalSettingsDriver(const char * driverName)
{
   OldLink link;
   for(link = class(GlobalSettingsDriver).derivatives.first; link; link = link.next)
   {
      subclass(GlobalSettingsDriver) driver = link.data;
      if(driver.name && !strcmp(driver.name, driverName))
         return driver;
   }

   /*{
      Module module;
      char moduleName[MAX_LOCATION];
      sprintf(moduleName, "ecere%s", driverName);
      if(module = eModule_Load(__thisModule.application, moduleName, publicAccess))
      {
         //Class dsdClass = class(GlobalSettingsDriver);
         Class dsdClass = eSystem_FindClass(module /-__thisModule.application-/, "GlobalSettingsDriver");

         for(link = dsdClass.derivatives.first; link; link = link.next)
         {
            subclass(GlobalSettingsDriver) driver = link.data;
            if(driver.name && !strcmp(driver.name, driverName))
               return driver;
         }
      }
   }*/
   return null;
}

public class GlobalSettingsData
{
}

public class GlobalSettings
{
public:
   property const char * settingsName
   {
      set { delete settingsName; if(value && value[0]) settingsName = CopyString(value); }
      get { return settingsName; }
   };
   property const char * settingsExtension
   {
      set { delete settingsExtension; if(value && value[0]) settingsExtension = CopyString(value); }
      get { return settingsExtension; }
   };
   property const char * settingsDirectory
   {
      set { delete settingsDirectory; if(value && value[0]) settingsDirectory = CopyUnixPath(value); }
      get { return settingsDirectory; }
   };
   property const char * settingsLocation
   {
      set { delete settingsLocation; if(value && value[0]) settingsLocation = CopyUnixPath(value); }
      get { return settingsLocation; }
   };
   property const char * settingsFilePath
   {
      set { delete settingsFilePath; if(value && value[0]) settingsFilePath = CopyUnixPath(value); }
      get { return settingsFilePath; }
   };
   property bool allowDefaultLocations
   {
      set { allowDefaultLocations = value; }
      get { return allowDefaultLocations; }
   };
   property bool allUsers
   {
      set { allUsers = value; }
      get { return allUsers; }
   };

   property const String driver
   {
      set
      {
         driverClass = null;
         if(value)
            driverClass = GetGlobalSettingsDriver(value);
      }
      get { return driverClass ? driverClass.name : null; }
   }
   GlobalSettingsData data;
   GlobalSettingsData * dataOwner;
   subclass(GlobalSettingsData) dataClass;
   bool portable;

private:
   char * settingsName;
   char * settingsExtension;
   char * settingsLocation;
   char * settingsFilePath;
   bool allowDefaultLocations;
   bool allUsers;
   bool globalPath;
   char * settingsDirectory;

   FileMonitor settingsMonitor
   {
      this, fileChange = { modified = true };

      bool OnFileNotify(FileChange action, const char * param)
      {
         OnAskReloadSettings();
         return true;
      }
   };
   File f;
   bool locked;

   subclass(GlobalSettingsDriver) driverClass;

   ~GlobalSettings()
   {
      if(f)
         f.Unlock(0, 0, true);
      delete f;
      delete settingsName;
      delete settingsExtension;
      delete settingsLocation;
      delete settingsFilePath;
      delete settingsDirectory;
   }

   char * PrepareSpecifiedLocationPath(const char * extension, bool create)
   {
      char * path = null;
      char location[MAX_LOCATION] = "";
      if(settingsLocation)
         strcpy(location, settingsLocation);
      path = GetFilePath(location, extension, create, false, false);
      return path;
   }

   char * PreparePortablePath(const char * extension, bool create)
   {
      //
      char * path = null;
      char location[MAX_LOCATION];
      LocateModule(null, location);
      StripLastDirectory(location, location);
      path = GetFilePath(location, extension, create, false, false);
      return path;
   }

   char * PrepareHomePath(const char * extension, bool create, bool unixStyle)
   {
      // ~/.apprc
      char * path = null;
      char * home = getenv("HOME");
      if(home && home[0])
      {
         char location[MAX_LOCATION];
         strcpy(location, home);
         path = GetFilePath(location, extension, create, true, unixStyle);
      }
      return path;
   }

#if defined(__WIN32__)
   char * PrepareUserProfilePath(const char * extension, bool create)
   {
      // Windows attempts: $USERPROFILE/app.ini
      char * path = null;
      char * profile = getenv("USERPROFILE");
      if(profile && profile[0])
      {
         char location[MAX_LOCATION];
         strcpy(location, profile);
         path = GetFilePath(location, extension, create, false, false);
      }
      return path;
   }

   char * PrepareHomeDrivePath(const char * extension, bool create)
   {
      char * path = null;
      const char * homedrive = getenv("HOMEDRIVE");
      const char * homepath = getenv("HOMEPATH");
      if(homedrive && homedrive[0] && homepath && homepath[0])
      {
         char location[MAX_LOCATION];
         strcpy(location, homedrive);
         PathCatSlash(location, homepath);
         path = GetFilePath(location, extension, create, false, false);
      }
      return path;
   }

   char * PrepareSystemPath(const char * extension, bool create)
   {
      char * path = null;
      uint16 _wfilePath[MAX_LOCATION];
      char location[MAX_LOCATION];
      GetSystemDirectory(_wfilePath, MAX_LOCATION);
      UTF16toUTF8Buffer(_wfilePath, location, MAX_LOCATION);
      path = GetFilePath(location, extension, create, false, false);
      return path;
   }

   char * PrepareAllUsersPath(const char * extension, bool create)
   {
      char * path = null;
      char * allUsers = getenv("ALLUSERSPROFILE");
      if(allUsers && allUsers[0])
      {
         char location[MAX_LOCATION];
         strcpy(location, allUsers);
         path = GetFilePath(location, extension, create, false, false);
      }
      return path;
   }
#else
   char * PrepareEtcPath(const char * extension, bool create)
   {
      char * path = null;
      char location[MAX_LOCATION] = "/etc/";
      path = GetFilePath(location, extension, create, false, false);
      return path;
   }
#endif

   char * GetFilePath(char * location, const char * extension, bool create, bool dotPrefix, bool runCommandsStyle)
   {
      char * path = null;
      FileAttribs attribs;
      if(location[0])
         MakeSlashPath(location);
      if(location[0] && (attribs = FileExists(location)).isDirectory)
      {
         if(settingsDirectory)
         {
            if(dotPrefix)
            {
               PathCatSlash(location, ".");
               strcat(location, settingsDirectory);
            }
            else
               PathCatSlash(location, settingsDirectory);
            if(create)
               MakeDir(location);
            attribs = FileExists(location);
         }
         if(attribs.isDirectory)
         {
            char * name = new char[strlen(settingsName) + strlen(extension) + 2];
            if(dotPrefix && !settingsDirectory)
            {
               strcpy(name, ".");
               strcat(name, settingsName);
            }
            else
               strcpy(name, settingsName);
            if(runCommandsStyle)
               strcat(name, "rc");
            else
            {
               strcat(name, ".");
               strcat(name, extension);
            }
            path = new char[strlen(location) + strlen(name) + 16];
            strcpy(path, location);
            PathCatSlash(path, name);
            delete name;
         }
      }
      return path;
   }

   const char * GetExtension()
   {
      const char * extension;
      if(settingsExtension)
         extension = settingsExtension;
      else
#if defined(__WIN32__)
         extension = "ini";
#else
         extension = "conf";
#endif
      return extension;
   }

   void FileOpenTryRead()
   {
      f = FileOpen(settingsFilePath, read);
      //PrintLn("GlobalSettings::FileOpenTryRead -- ", settingsFilePath, " -- ", f != null);
      if(!f)                       // This delete will cover both trying the next possible config location and
         delete settingsFilePath;  // the case when we're doing a load when the config file is no longer available
   }                               // and we want to re-try all possible config locations.

   bool FileOpenTryWrite(bool shouldDelete, bool * locked)
   {
      *locked = false;
      f = FileOpen(settingsFilePath, readWrite);
      if(!f)
      {
         f = FileOpen(settingsFilePath, writeRead);
         if(!driverClass)
         {
            delete f;
            f = FileOpen(settingsFilePath, readWrite);
         }
      }
      if(f)
      {
         // Don't wait for a lock, first one to lock gets to write, other will likely loose changes on a reload.
         if(f.Lock(exclusive, 0, 0, false))
         {
            *locked = true;
            if(driverClass)
            {
               f.Truncate(0);
               f.Seek(0, start);
            }
         }
      }
      else if(shouldDelete)        // This delete will cover both trying the next possible config location and
         delete settingsFilePath;  // allow trying to save to a location where user has permission.
      //PrintLn("GlobalSettings::FileOpenTryWrite -- ", settingsFilePath, " -- ", f != null);
      return f != null;
   }

public:
   virtual void OnAskReloadSettings();

   bool OpenAndLock(FileSize * fileSize)
   {
      if(!f)
      {
         settingsMonitor.StopMonitoring();

         if(settingsFilePath)
            FileOpenTryRead();

         if(!settingsFilePath && settingsName && settingsName[0])
         {
            const char * extension = GetExtension();

            if(!f && (settingsFilePath = PrepareSpecifiedLocationPath(extension, false)))
               FileOpenTryRead();
            if(!f && (!settingsLocation || allowDefaultLocations))
            {
               globalPath = false;
               if(!f && (settingsFilePath = PreparePortablePath(extension, false)))
                  FileOpenTryRead();
               if(f)
                  portable = true;
               if(!allUsers)
               {
#if defined(__WIN32__)
                  if(!f && (settingsFilePath = PrepareHomePath(extension, false, false)))
                     FileOpenTryRead();
#endif
                  if(!f && (settingsFilePath = PrepareHomePath(extension, false, true)))
                     FileOpenTryRead();
               }
#if defined(__WIN32__)
               if(!allUsers)
               {
                  if(!f && (settingsFilePath = PrepareUserProfilePath(extension, false)))
                     FileOpenTryRead();
                  if(!f && (settingsFilePath = PrepareHomeDrivePath(extension, false)))
                     FileOpenTryRead();
               }
               if(!f)
                  globalPath = true;
               if(!f && (settingsFilePath = PrepareAllUsersPath(extension, false)))
                  FileOpenTryRead();

               if(!f && (settingsFilePath = PrepareSystemPath(extension, false)))
                  FileOpenTryRead();
#else
               if(!f)
                  globalPath = true;
               if(!f && (settingsFilePath = PrepareEtcPath(extension, false)))
                  FileOpenTryRead();
#endif
            }
         }
      }
      if(f)
      {
         int c;
         if(!locked)
         {
            // At some point wait was true, it was changed to false and now we do retries.
            // Could it be because the wait to true was causing blocking behaviors?
            //if(f && f.Lock(shared, 0, 0, true)) <- I think the wait to true is bad, it wrote blanked out global settings.
            for(c = 0; c < 10 && !(locked = f.Lock(shared, 0, 0, false)); c++)
            {
               ecere::sys::Sleep(0.01);
            }
         }

         if(locked && fileSize)
            *fileSize = f.GetSize();
      }
      return f && locked;
   }

   virtual SettingsIOResult Load()
   {
      SettingsIOResult result = fileNotFound;
      if(!f || !locked)
         OpenAndLock(null);

      if(f && locked)
      {
         if(driverClass)
            result = driverClass.Load(f, this);
         else
            result = success;
      }
      return result;
   }

   virtual SettingsIOResult Save()
   {
      SettingsIOResult result = error;
      if(!f)
      {
         locked = false;

         settingsMonitor.StopMonitoring();

         if(settingsFilePath)
            // Don't auto delete settingsFilePath because only want to try another path if we were using a global path
            FileOpenTryWrite(false, &locked);

         if((!settingsFilePath || (!f && globalPath)) && settingsName && settingsName[0])
         {
            const char * extension = GetExtension();
            delete settingsFilePath;

            if(!f && (settingsFilePath = PrepareSpecifiedLocationPath(extension, true)))
               FileOpenTryWrite(true, &locked);
            if(!f && (!settingsLocation || allowDefaultLocations))
            {
               globalPath = true;
               // never try to write a new portable configuration file?
               //       -- Probably always want to write back to the same file, the first FileOpenTryWrite(true) should succeed
               //if(!f && (settingsFilePath = PreparePortablePath(extension, true)))
               //   FileOpenTryWrite(true);
#if defined(__WIN32__)
               if(!f && (settingsFilePath = PrepareAllUsersPath(extension, true)))
                  FileOpenTryWrite(true, &locked);
#else
               if(!f && (settingsFilePath = PrepareEtcPath(extension, true)))
                  FileOpenTryWrite(true, &locked);
#endif
               if(!f && allUsers)
               {
                  globalPath = false;
                  if(!f && (settingsFilePath = PrepareHomePath(extension, true,
#if defined(__WIN32__)
                     false
#else
                     true
#endif
                     )))
                     FileOpenTryWrite(true, &locked);
               }
#if defined(__WIN32__)
               if(!f && !allUsers)
               {
                  globalPath = false;
                  if(!f && (settingsFilePath = PrepareUserProfilePath(extension, true)))
                     FileOpenTryWrite(true, &locked);
                  if(!f && (settingsFilePath = PrepareHomeDrivePath(extension, true)))
                     FileOpenTryWrite(true, &locked);
               }
               if(!f && (settingsFilePath = PrepareSystemPath(extension, true)))
               {
                  globalPath = true;
                  FileOpenTryWrite(true, &locked);
               }
#endif
            }
         }
         if(f && locked)
         {
            if(driverClass)
               result = driverClass.Save(f, this);
            else
               result = success;
         }
      }
      return result;
   }

   void Close()
   {
      if(f)
      {
         settingsMonitor.StopMonitoring();
         f.Unlock(0,0,true);
         locked = false;
         delete f;
      }
   }

   void CloseAndMonitor()
   {
      Close();
      if(settingsFilePath && OnAskReloadSettings != GlobalSettings::OnAskReloadSettings)
      {
         settingsMonitor.fileName = settingsFilePath;
         settingsMonitor.StartMonitoring();
      }
   }
}

public class GlobalAppSettings : GlobalSettings
{
public:
   bool GetGlobalValue(const char * section, const char * name, GlobalSettingType type, void * value)
   {
      bool result = false;
      if(f)
      {
         char line[92048];
         int lenSection = strlen(section);
         int lenName = strlen(name);
         f.Seek(0, start);
         while(f.GetLine(line, sizeof(line)))
         {
            if(line[0] == '[' && !strncmp(line+1, section, lenSection) && line[lenSection+1] == ']')
               break;
         }
         if(!f.Eof())
         {
            while(f.GetLine(line, sizeof(line)))
            {
               if(!strncmp(line, name, lenName) && line[lenName] == '=')
               {
                  char * string = line + lenName + 1;
                  switch(type)
                  {
                     case stringList:
                     {
                        int c;
                        Container<String> list = value;
                        char * tokens[256];
                        int numTokens = TokenizeWith(string,
                           sizeof(tokens) / sizeof(byte *), tokens, " ,", false);
                        list.Free();
                        for(c = 0; c<numTokens; c++)
                        {
                           list.Add(CopyString(tokens[c]));
                        }
                        break;
                     }
                     case singleString:
                     {
                        char ** thisString = value;
                        *thisString = CopyString(string);
                        break;
                     }
                     case integer:
                     {
                        int * integer = value;
                        *integer = (int)strtol(string, null, 0);
                        break;
                     }
                  }
                  result = true;
                  break;
               }
            }
         }
      }
      return result;
   }

   bool PutGlobalValue(const char * section, const char * name, GlobalSettingType type, const void * value)
   {
      bool result = false;
      if(f)
      {
         char line[92048], outputLine[92048] = "";
         int lenSection = strlen(section);
         int lenName = strlen(name);
         int lenOutput;
         byte * remainingBuffer = null;
         int remainingLen = 0;
         uint currentSize = 0, newSize = 0;

         f.Seek(0, start);

         // Prepare the output line
         strcpy(outputLine, name);
         strcat(outputLine, "=");
         switch(type)
         {
            case stringList:
            {
               Container<String> list = (void *)value;
               Iterator<String> item { list };
               item.Next();
               while(item.pointer)
               {
                  strcat(outputLine, "\"");
                  if(item.data)
                     strcat(outputLine, item.data);
                  strcat(outputLine, "\"");
                  item.Next();
                  if(item.pointer)
                     strcat(outputLine, ",");
               }
               break;
            }
            case singleString:
               // strcat(outputLine, "\"");
               if(value)
                  strcat(outputLine, value);
               // strcat(outputLine, "\"");
               break;
            case integer:
            {
               char integer[64];
               sprintf(integer, "%d", (int)(intptr)value);
               strcat(outputLine, integer);
               break;
            }
         }
#if defined(__WIN32__)
         strcat(outputLine, "\r\n");
#else
         strcat(outputLine, "\n");
#endif
         lenOutput = strlen(outputLine);

         while(f.GetLine(line, sizeof(line)))
         {
            if(line[0] == '[' && !strncmp(line+1, section, lenSection) && line[lenSection+1] == ']')
               break;
         }
         if(!f.Eof())
         {
            int posBeforeSection = -1;
            for(;;)
            {
               uint pos = f.Tell();
               if(!f.GetLine(line, sizeof(line)))
                  break;
               if(posBeforeSection == -1 || !line[0])
                  posBeforeSection = pos;

               if(line[0] == '[')
               {
                  // We've already reached next section
                  f.Seek(posBeforeSection, start);

                  // Remember the rest of the file
                  while(!f.Eof())
                  {
                     remainingBuffer = renew remainingBuffer byte[remainingLen + 65536];
                     remainingLen += f.Read(remainingBuffer + remainingLen, 1, 65536);
                  }
                  // Don't need to truncate. leave currentSize and newSize at 0
                  f.Seek(posBeforeSection, start);
                  break;
               }
               else if(!strncmp(line, name, lenName) && line[lenName] == '=')
               {
                  uint endLinePos = f.Tell();

                  // Remember the rest of the file
                  while(!f.Eof())
                  {
                     remainingBuffer = renew remainingBuffer byte[remainingLen + 65536];
                     remainingLen += f.Read(remainingBuffer + remainingLen, 1, 65536);
                  }
                  currentSize = endLinePos + remainingLen;
                  newSize = pos + lenOutput + remainingLen;

                  // Go back where we will overwrite this line
                  f.Seek(pos, start);
                  break;
               }
            }
         }
         else
         {
            // Add the section
#if defined(__WIN32__)
            f.Printf("\r\n[%s]\r\n", section);
#else
            f.Printf("\n[%s]\n", section);
#endif
         }

         // Write the line
         f.Write(outputLine, 1, lenOutput);

         // Write back the rest of the file if necessary
         if(remainingBuffer)
         {
            f.Write(remainingBuffer, 1, remainingLen);
            delete remainingBuffer;
            if(currentSize != newSize)
               FileTruncate(settingsFilePath, newSize);
         }
         result = true;
      }
      return result;
   }
};
