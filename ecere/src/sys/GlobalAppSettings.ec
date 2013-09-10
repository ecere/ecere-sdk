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
   class_data char * name;

   class_property char * name
   {
      set { class_data(name) = value; }
      get { return class_data(name); }
   }

public:
   virtual SettingsIOResult ::Load(File f, GlobalSettings globalSettings);
   virtual SettingsIOResult ::Save(File f, GlobalSettings globalSettings);

}

static subclass(GlobalSettingsDriver) GetGlobalSettingsDriver(char * driverName)
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
   property char * settingsName
   {
      set { delete settingsName; if(value && value[0]) settingsName = CopyString(value); }
      get { return settingsName; }
   }; 
   property char * settingsExtension
   {
      set { delete settingsExtension; if(value && value[0]) settingsExtension = CopyString(value); }
      get { return settingsExtension; }
   };
   property char * settingsLocation
   {
      set { delete settingsLocation; if(value && value[0]) settingsLocation = CopyString(value); }
      get { return settingsLocation; }
   };
   property char * settingsFilePath
   {
      get { return settingsFilePath; }
   }; 
   property bool allowDefaultLocations
   {
      set { allowDefaultLocations = value; }
      get { return allowDefaultLocations; }
   };

   property String driver
   {
      set
      {
         driverClass = null;
         if(value)
            driverClass = GetGlobalSettingsDriver(value);
      }
      get { return driverClass ? (driverClass.name : null; }
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

   FileMonitor settingsMonitor
   {
      this, fileChange = { modified = true };

      bool OnFileNotify(FileChange action, char * param)
      {
         OnAskReloadSettings();
         return true;
      }
   };
   File f;

   subclass(GlobalSettingsDriver) driverClass;

   ~GlobalAppSettings()
   {
      if(f)
         f.Unlock(0, 0, true);
      delete f;
      delete settingsName;
      delete settingsExtension;
      delete settingsLocation;
      delete settingsFilePath;
   }

   char * PrepareSpecifiedLocationPath()
   {
      char * path = null;
      if(settingsLocation && FileExists(settingsLocation).isDirectory)
      {
         char * extension = GetExtension();
         path = new char[strlen(settingsLocation) + strlen(settingsName) + strlen(extension) + 16];
         strcpy(path, settingsLocation);
         PathCat(path, settingsName);
         strcat(path, ".");
         strcat(path, extension);
      }
      return path;
   }

   char * PreparePortablePath()
   {
      // 
      char * path = null;
      char location[MAX_LOCATION];
      LocateModule(null, location);
      StripLastDirectory(location, location);
      if(location[0] && FileExists(location).isDirectory)
      {
         char * extension = GetExtension();
         char * name = new char[strlen(settingsName) + 16];
         path = new char[strlen(location) + strlen(settingsName) + strlen(extension) + 16];
         strcpy(name, settingsName);
         strcat(name, ".");
         strcat(name, extension);
         strcpy(path, location);
         PathCat(path, name);
         delete name;
      }
      return path;
   }

   char * PrepareHomePath(bool useIni)
   {
      // ~/.apprc
      char * path = null;
      char * home = getenv("HOME");
      if(home && home[0] && FileExists(home).isDirectory)
      {
         char * name = new char[strlen(settingsName) + 16];
         path = new char[strlen(home) + strlen(settingsName) + 16];
         if(useIni)
         {
            strcpy(name, settingsName);
            strcat(name, ".");
            strcat(name, GetExtension());
         }
         else
         {
            strcpy(name, ".");
            strcat(name, settingsName);
            strcat(name, "rc");
         }
         strcpy(path, home);
         PathCat(path, name);
         delete name;
      }
      return path;
   }

#if defined(__WIN32__)
   char * PrepareUserProfilePath()
   {
      // Windows attempts: $USERPROFILE/app.ini
      char * path = null;
      char * profile = getenv("USERPROFILE");
      if(profile && profile[0] && FileExists(profile).isDirectory)
      {
         char * extension = GetExtension();
         path = new char[strlen(profile) + strlen(settingsName) + strlen(extension) + 16];
         strcpy(path, profile);
         PathCat(path, settingsName);
         strcat(path, ".");
         strcat(path, extension);
      }
      return path;
   }

   char * PrepareHomeDrivePath()
   {
      char * path = null;
      char * homedrive = getenv("HOMEDRIVE");
      if(homedrive && homedrive[0])
      {
         char * homepath = getenv("HOMEPATH");
         if(homepath && homepath[0])
         {
            char * extension = GetExtension();
            path = new char[strlen(homedrive) + strlen(homepath) + strlen(settingsName) + strlen(extension) + 32];
            strcpy(path, homedrive);
            PathCat(path, homepath);
            if(FileExists(path).isDirectory)
            {
               PathCat(path, settingsName);
               strcat(path, ".");
               strcat(path, extension);
            }
            else
               delete path;
         }
      }
      return path;
   }
   
   char * PrepareSystemPath()
   {
      char * path = new char[MAX_LOCATION];
      char * extension = GetExtension();
      uint16 _wfilePath[MAX_LOCATION];
      GetSystemDirectory(_wfilePath, MAX_LOCATION);
      UTF16toUTF8Buffer(_wfilePath, path, MAX_LOCATION);
      PathCat(path, settingsName);
      strcat(path, ".");
      strcat(path, extension);
      return path;
   }
#else
   char * PrepareEtcPath()
   {
      char * path = null;
      char * etc = "/etc/";
      char * extension = GetExtension();
      path = new char[strlen(etc) + strlen(settingsName) + strlen(extension) + 16];
      strcpy(path, etc);
      PathCat(path, settingsName);
      strcat(path, ".");
      strcat(path, extension);
      return path;
   }
#endif

   char * GetExtension()
   {
      char * extension;
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
      if(!f)                       // This delete will cover both trying the next possible config location and
         delete settingsFilePath;  // the case when we're doing a load when the config file is no longer available
   }                               // and we want to re-try all possible config locations.

   bool FileOpenTryWrite()
   {
      if(driverClass)
         f = FileOpen(settingsFilePath, write);
      else
      {
         if(!(f = FileOpen(settingsFilePath, readWrite)))
         {
            f = FileOpen(settingsFilePath, writeRead);
            delete f;
            f = FileOpen(settingsFilePath, readWrite);
            if(!f)                       // This delete will cover both trying the next possible config location and
               delete settingsFilePath;  // allow trying to save to a location where user has permission.
         }
      }
      return (bool)f;
   }

public:
   virtual void OnAskReloadSettings();

   virtual SettingsIOResult Load()
   {
      SettingsIOResult result = fileNotFound;
      if(!f)
      {
         settingsMonitor.StopMonitoring();

         if(settingsFilePath)
            FileOpenTryRead();

         if(!settingsFilePath && settingsName && settingsName[0])
         {
            if(!f && (settingsFilePath = PrepareSpecifiedLocationPath()))
               FileOpenTryRead();
            if(!settingsLocation || allowDefaultLocations)
            {
               if(!f && (settingsFilePath = PreparePortablePath()))
                  FileOpenTryRead();
               if(f)
                  portable = true;
#if defined(__WIN32__)
               if(!f && (settingsFilePath = PrepareHomePath(true)))
                  FileOpenTryRead();
#endif
               if(!f && (settingsFilePath = PrepareHomePath(false)))
                  FileOpenTryRead();
#if defined(__WIN32__)
               if(!f && (settingsFilePath = PrepareUserProfilePath()))
                  FileOpenTryRead();
               if(!f && (settingsFilePath = PrepareHomeDrivePath()))
                  FileOpenTryRead();
               if(!f && (settingsFilePath = PrepareSystemPath()))
                  FileOpenTryRead();
#else
               if(!f && (settingsFilePath = PrepareEtcPath()))
                  FileOpenTryRead();
#endif
            }
         }

         if(f)
         {
            int c;
            bool locked;
            // At some point wait was true, it was changed to false and now we do retries.
            // Could it be because the wait to true was causing blocking behaviors?
            //if(f && f.Lock(shared, 0, 0, true)) <- I think the wait to true is bad, it wrote blanked out global settings.
            for(c = 0; c < 10 && !(locked = f.Lock(shared, 0, 0, false)); c++)
            {
               ecere::sys::Sleep(0.01);
            }
            if(locked)
            {
               if(driverClass)
                  result = driverClass.Load(f, this);
               else
                  result = success;
            }
         }
         
      }
      return result;
   }

   virtual SettingsIOResult Save()
   {
      SettingsIOResult result = error;
      if(!f)
      {
         char filePath[MAX_LOCATION];

         settingsMonitor.StopMonitoring();

         if(settingsFilePath)
            FileOpenTryWrite();

         if(!settingsFilePath && settingsName && settingsName[0])
         {
            if(!f && (settingsFilePath = PrepareSpecifiedLocationPath()))
               FileOpenTryWrite();
            if(!settingsLocation || allowDefaultLocations)
            {
               // never try to write a new portable configuration file?
               //if(!f && (settingsFilePath = PreparePortablePath()))
               //   FileOpenTryWrite();
#if !defined(__WIN32__)
               if(!f && (settingsFilePath = PrepareEtcPath()))
                  FileOpenTryWrite();
#endif
               if(!f && (settingsFilePath = PrepareHomePath(
#if defined(__WIN32__)
                  true
#else
                  false
#endif
                     )))
                  FileOpenTryWrite();
#if defined(__WIN32__)
               if(!f && (settingsFilePath = PrepareUserProfilePath()))
                  FileOpenTryWrite();
               if(!f && (settingsFilePath = PrepareHomeDrivePath()))
                  FileOpenTryWrite();
               if(!f && (settingsFilePath = PrepareSystemPath()))
                  FileOpenTryWrite();
#endif
            }
         }
         // Don't wait for a lock, first one to lock gets to write, other will likely loose changes on a reload.
         if(f && f.Lock(exclusive, 0, 0, false))
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
         delete f;
      }
   }

   void CloseAndMonitor()
   {
      Close();
      if(settingsFilePath && OnAskReloadSettings != GlobalAppSettings::OnAskReloadSettings)
      {
         settingsMonitor.fileName = settingsFilePath;
         settingsMonitor.StartMonitoring();
      }
   }
}

public class GlobalAppSettings : GlobalSettings
{
public:
   bool GetGlobalValue(char * section, char * name, GlobalSettingType type, void * value)
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
                        byte * tokens[256];
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

   bool PutGlobalValue(char * section, char * name, GlobalSettingType type, void * value)
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
               Container<String> list = value;
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
               sprintf(integer, "%d", value);
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

