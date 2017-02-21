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

// note: missing application data location support on windows
enum SettingsLocationType { none, specified, portable, home, winUserProfile, winHomeDrive, winSystemPath, winAllUsers, nixEtc };

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
   property bool portable
   {
      set { portable = value; }
      get { return portable; }
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

private:
   char * settingsName;
   char * settingsExtension;
   char * settingsLocation;
   char * settingsFilePath;
   bool allowDefaultLocations;
   bool allUsers;
   bool portable;
   bool globalPath;
   char * settingsDirectory;
   SettingsLocationType readType;
   SettingsLocationType writeType;

#if !defined(__EMSCRIPTEN__)
   FileMonitor settingsMonitor
   {
      this, fileChange = { modified = true };

      bool OnFileNotify(FileChange action, const char * param)
      {
         OnAskReloadSettings();
         return true;
      }
   };
#endif
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

   char * PreparePath(SettingsLocationType type, const char * extension, bool create, bool unixStyle)
   {
      char * path = null;
      char * buffer = new char[MAX_LOCATION];
      switch(type)
      {
         case specified:
            if(settingsLocation)
            {
               buffer[0] = '\0';
               strcpy(buffer, settingsLocation);
               path = GetFilePath(buffer, extension, create, false, false);
            }
            break;
         case portable:
            buffer[0] = '\0';
            LocateModule(null, buffer);
            StripLastDirectory(buffer, buffer);
            path = GetFilePath(buffer, extension, create, false, false);
            break;
         case home:
         {
            // ~/.apprc
            char * home = getenv("HOME");
            if(home && home[0])
            {
               strcpy(buffer, home);
               path = GetFilePath(buffer, extension, create, true, unixStyle);
            }
            break;
         }
#if defined(__WIN32__)
         case winUserProfile:
         {
            // Windows attempts: $USERPROFILE/app.ini
            char * profile = getenv("USERPROFILE");
            if(profile && profile[0])
            {
               strcpy(buffer, profile);
               path = GetFilePath(buffer, extension, create, false, false);
            }
            break;
         }
         case winHomeDrive:
         {
            const char * homedrive = getenv("HOMEDRIVE");
            const char * homepath = getenv("HOMEPATH");
            if(homedrive && homedrive[0] && homepath && homepath[0])
            {
               strcpy(buffer, homedrive);
               PathCatSlash(buffer, homepath);
               path = GetFilePath(buffer, extension, create, false, false);
            }
            break;
         }
         case winSystemPath:
         {
            uint16 _wfilePath[MAX_LOCATION];
            buffer[0] = '\0';
            GetSystemDirectory(_wfilePath, MAX_LOCATION);
            UTF16toUTF8Buffer(_wfilePath, buffer, MAX_LOCATION);
            path = GetFilePath(buffer, extension, create, false, false);
            break;
         }
         case winAllUsers:
         {
            char * allUsers = getenv("ALLUSERSPROFILE");
            if(allUsers && allUsers[0])
            {
               strcpy(buffer, allUsers);
               path = GetFilePath(buffer, extension, create, false, false);
            }
            break;
         }
#else
         case nixEtc:
         {
            strcpy(buffer, "/etc/");
            path = GetFilePath(buffer, extension, create, false, false);
            break;
         }
#endif
      }
      if(!path) delete buffer;
      return path;
   }

   char * GetFilePath(char * location, const char * extension, bool create, bool dotPrefix, bool runCommandsStyle)
   {
      char * path = null;
      FileAttribs attribs;
      if(location[0])
         MakeSlashPath(location);
      if(location[0] && (attribs = FileExists(location)) && (attribs.isDirectory || attribs.isDrive))
      {
         if(settingsDirectory)
         {
            if(dotPrefix && settingsDirectory[0] != '.')
            {
               int len = strlen(settingsDirectory);
               String s = new char[len + 2];
               s[0] = '.';
               memcpy(s + 1, settingsDirectory, len + 1);
               PathCatSlash(location, s);
               delete s;
            }
            else
               PathCatSlash(location, settingsDirectory);
            if(create)
               MakeDir(location);
            attribs = FileExists(location);
         }
         if(attribs.isDirectory || attribs.isDrive)
         {
            char * name = new char[strlen(settingsName) + strlen(extension) + 4];
            if(dotPrefix && !settingsDirectory && settingsName[0] != '.')
            {
               strcpy(name, ".");
               strcat(name, settingsName);
            }
            else
               strcpy(name, settingsName);
            if(!settingsExtension && runCommandsStyle)
               strcat(name, "rc");
            else
            {
               strcat(name, ".");
               strcat(name, extension);
            }
            PathCatSlash(location, name);
            path = location;
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

   void FileOpenTryRead(SettingsLocationType type)
   {
      f = FileOpen(settingsFilePath, read);
      //PrintLn("GlobalSettings::FileOpenTryRead(", type, ") (", settingsFilePath, ") -- ", f ? "SUCCESS" : "FAIL");
      if(f)
         readType = type;
      else
      {
                                   // This delete will cover both trying the next possible config location and
         delete settingsFilePath;  // the case when we're doing a load when the config file is no longer available
      }                            // and we want to re-try all possible config locations.
   }

   bool FileOpenTryWrite(SettingsLocationType type, bool shouldDelete, bool * locked)
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
      //PrintLn("GlobalSettings::FileOpenTryWrite(", type, ") (", settingsFilePath, ") -- ", f ? "SUCCESS" : "FAIL");
      if(f)
      {
         writeType = type;
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
      else if(shouldDelete)
      {
         delete settingsFilePath;  // This delete will cover both trying the next possible config location and
      }                            // allow trying to save to a location where user has permission.
      return f != null;
   }

public:
   virtual void OnAskReloadSettings();

   property bool isGlobalPath { get { return globalPath; } }

   bool OpenAndLock(FileSize * fileSize)
   {
      SettingsLocationType type = readType;
      if(!f)
      {
#if !defined(__EMSCRIPTEN__)
         settingsMonitor.StopMonitoring();
#endif

         if(settingsFilePath)
            FileOpenTryRead(type);

         if(!settingsFilePath && settingsName && settingsName[0])
         {
            const char * extension = GetExtension();

            if(!f && (settingsFilePath = PreparePath((type = specified), extension, false, false)))
               FileOpenTryRead(type);
            if(!f && (!settingsLocation || allowDefaultLocations))
            {
               globalPath = false;
               if(!f && (settingsFilePath = PreparePath((type = portable), extension, false, false)))
                  FileOpenTryRead(type);
               if(f)
                  portable = true;
               if(!allUsers)
               {
#if defined(__WIN32__)
                  if(!f && (settingsFilePath = PreparePath((type = home), extension, false, false)))
                     FileOpenTryRead(type);
#endif
                  if(!f && (settingsFilePath = PreparePath((type = home), extension, false, true)))
                     FileOpenTryRead(type);
               }
#if defined(__WIN32__)
               if(!allUsers)
               {
                  if(!f && (settingsFilePath = PreparePath((type = winUserProfile), extension, false, false)))
                     FileOpenTryRead(type);
                  if(!f && (settingsFilePath = PreparePath((type = winHomeDrive), extension, false, false)))
                     FileOpenTryRead(type);
               }
               if(!f)
                  globalPath = true;
               if(!f && (settingsFilePath = PreparePath((type = winAllUsers), extension, false, false)))
                  FileOpenTryRead(type);

               if(!f && (settingsFilePath = PreparePath((type = winSystemPath), extension, false, false)))
                  FileOpenTryRead(type);
#else
               if(!f)
                  globalPath = true;
               if(!f && (settingsFilePath = PreparePath((type = nixEtc), extension, false, false)))
                  FileOpenTryRead(type);
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
            *fileSize = (FileSize)f.GetSize();
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
      SettingsLocationType type = writeType;
      if(!f)
      {
         locked = false;

#if !defined(__EMSCRIPTEN__)
         settingsMonitor.StopMonitoring();
#endif

         if(settingsFilePath)
            // Don't auto delete settingsFilePath because only want to try another path if we were using a global path
            FileOpenTryWrite(type, false, &locked);

         if((!settingsFilePath || (!f && globalPath)) && settingsName && settingsName[0])
         {
            const char * extension = GetExtension();
            delete settingsFilePath;

            if(!f && (settingsFilePath = PreparePath((type = specified), extension, true, false)))
               FileOpenTryWrite(type, true, &locked);
            if(!f && (!settingsLocation || allowDefaultLocations))
            {
               globalPath = true;
               if(!f && portable && (settingsFilePath = PreparePath((type = portable), extension, true, false)))
                  FileOpenTryWrite(type, true, &locked);
#if defined(__WIN32__)
               if(!f && allUsers && (settingsFilePath = PreparePath((type = winAllUsers), extension, true, false)))
                  FileOpenTryWrite(type, true, &locked);
#else
               if(!f && allUsers && (settingsFilePath = PreparePath((type = nixEtc), extension, true, false)))
                  FileOpenTryWrite(type, true, &locked);
#endif
               if(!f && !allUsers)
               {
                  globalPath = false;
                  if(!f && (settingsFilePath = PreparePath((type = home), extension, true,
#if defined(__WIN32__)
                     false
#else
                     true
#endif
                     )))
                     FileOpenTryWrite(type, true, &locked);
               }
#if defined(__WIN32__)
               if(!f && !allUsers)
               {
                  globalPath = false;
                  if(!f && (settingsFilePath = PreparePath((type = winUserProfile), extension, true, false)))
                     FileOpenTryWrite(type, true, &locked);
                  if(!f && (settingsFilePath = PreparePath((type = winHomeDrive), extension, true, false)))
                     FileOpenTryWrite(type, true, &locked);
               }
               if(!f && (settingsFilePath = PreparePath((type = winSystemPath), extension, true, false)))
               {
                  globalPath = true;
                  FileOpenTryWrite(type, true, &locked);
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
#if !defined(__EMSCRIPTEN__)
         settingsMonitor.StopMonitoring();
#endif
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
#if !defined(__EMSCRIPTEN__)
         settingsMonitor.fileName = settingsFilePath;
         settingsMonitor.StartMonitoring();
#endif
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
         uint64 currentSize = 0, newSize = 0;

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
            int64 posBeforeSection = -1;
            for(;;)
            {
               uint64 pos = f.Tell();
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
                  uint64 endLinePos = f.Tell();

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
