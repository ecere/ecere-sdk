#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

define ecpDefaultCommand = "ecp";
define eccDefaultCommand = "ecc";
define ecsDefaultCommand = "ecs";
define earDefaultCommand = "ear";
define cppDefaultCommand = "gcc"; // As per #624 we decided to default to "gcc"...
define ccDefaultCommand = "gcc";
define cxxDefaultCommand = "g++";
//define ldDefaultCommand = "gcc";
define arDefaultCommand = "ar";
define objectDefaultFileExt = "o";
define outputDefaultFileExt = "";

import "StringsBox"

import "OldIDESettings"

#if defined(ECERE_IDE)
import "process"
#endif

IDESettings ideSettings;

IDESettingsContainer settingsContainer
{
   dataOwner = &ideSettings;
   dataClass = class(IDESettings);

   void OnLoad(GlobalSettingsData data)
   {
#ifndef OUTSIDE_IDE_SETTINGS_USE
      IDESettings settings = (IDESettings)data;
      globalSettingsDialog.ideSettings = settings;
      ide.UpdateRecentMenus();
      ide.UpdateCompilerConfigs(true);
#endif
   }
};

define MaxRecent = 9;

enum DirTypes { includes, libraries, executables };

define defaultCompilerName = "Default";

define defaultObjDirExpression = "obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)";

const char * settingsDirectoryNames[DirTypes] =
{
   "Include Files",
   "Library Files",
   "Executable Files"
};

// This function cannot accept same pointer for source and output
// todo: rename ReplaceSpaces to EscapeSpaceAndSpecialChars or something
void ReplaceSpaces(char * output, const char * source)
{
   int c, dc;
   char ch, pch = 0;

   for(c = 0, dc = 0; (ch = source[c]); c++, dc++)
   {
      if(ch == ' ') output[dc++] = '\\';
      if(ch == '\"') output[dc++] = '\\';
      if(ch == '&') output[dc++] = '\\';
      if(pch != '$')
      {
         if(ch == '(' || ch == ')') output[dc++] = '\\';
         pch = ch;
      }
      else if(ch == ')')
         pch = 0;
      output[dc] = ch;
   }
   output[dc] = '\0';
}


enum GlobalSettingsChange { none, editorSettings, projectOptions, compilerSettings };

enum PathRelationship { unrelated, identical, siblings, subPath, parentPath, insuficientInput, pathEmpty, toEmpty, pathNull, toNull, bothEmpty, bothNull };
PathRelationship eString_PathRelated(const char * path, const char * to, char * pathDiff)
{
   PathRelationship result;
   if(pathDiff) *pathDiff = '\0';
   if(path && *path && to && *to)
   {
      char toPart[MAX_FILENAME], toRest[MAX_LOCATION];
      char pathPart[MAX_FILENAME], pathRest[MAX_LOCATION];
      strcpy(toRest, to);
      strcpy(pathRest, path);
      for(; toRest[0] && pathRest[0];)
      {
         SplitDirectory(toRest, toPart, toRest);
         SplitDirectory(pathRest, pathPart, pathRest);
         if(!fstrcmp(pathPart, toPart)) result = siblings;
         else break;
      }
      if(result == siblings)
      {
         if(!*toRest && !*pathRest) result = identical;
         else if(!*pathRest) result = parentPath;
         else result = subPath;
         if(pathDiff && result != identical) strcpy(pathDiff, *pathRest == '\0' ? toRest : pathRest);
      }
      else result = unrelated;
   }
   else
   {
      if(path && to)
      {
         if(!*path && !*to) result = bothEmpty;
         else if(!*path) result = pathEmpty;
         else result = toEmpty;
      }
      else if(!path && !to) result = bothNull;
      else if(!path) result = pathNull;
      else result = toNull;
   }
   return result;
}

char * CopyValidateMakefilePath(const char * path)
{
   const int map[]  =    {           0,           1,             2,             3,           4,                    5,                 6,            0,                   1,                    2,        7 };
   const char * vars[] = { "$(MODULE)", "$(CONFIG)", "$(PLATFORM)", "$(COMPILER)", "$(TARGET)", "$(COMPILER_SUFFIX)", "$(DEBUG_SUFFIX)", "$(PROJECT)",  "$(CONFIGURATION)", "$(TARGET_PLATFORM)",(char *)0 };

   char * copy = null;
   if(path)
   {
      int len;
      len = (int)strlen(path);
      copy = CopyString(path);
      if(len)
      {
         int c;
         char * tmp = copy;
         char * start = tmp;
         Array<const char *> parts { };

         for(c=0; c<len; c++)
         {
            if(tmp[c] == '$')
            {
               int v;
               for(v=0; vars[v]; v++)
               {
                  if(SearchString(&tmp[c], 0, vars[v], false, false) == &tmp[c])
                  {
                     tmp[c] = '\0';
                     parts.Add(start);
                     parts.Add(vars[map[v]]);
                     c += strlen(vars[v]);
                     start = &tmp[c];
                     c--;
                     break;
                  }
               }
            }
         }
         if(start[0])
            parts.Add(start);

         if(parts.count)
         {
            /*int c, */len = 0;
            for(c=0; c<parts.count; c++) len += strlen(parts[c]);
            copy = new char[++len];
            copy[0] = '\0';
            for(c=0; c<parts.count; c++) strcat(copy, parts[c]);
         }
         else
            copy = null;
         delete parts;
         delete tmp;
      }
   }
   return copy;
}

void ValidPathBufCopy(char *output, const char *input)
{
#ifdef __WIN32__
   bool volumePath = false;
#endif
   strcpy(output, input);
   TrimLSpaces(output, output);
   TrimRSpaces(output, output);
   MakeSystemPath(output);
#ifdef __WIN32__
   if(output[0] && output[1] == ':')
   {
      output[1] = '_';
      volumePath = true;
   }
#endif
   {
      const char * chars = "*|:\",<>?";
      char ch, * s = output, * o = output;
      while((ch = *s++)) { if(!strchr(chars, ch)) *o++ = ch; }
      *o = '\0';
   }
#ifdef __WIN32__
   if(volumePath && output[0])
      output[1] = ':';
#endif
}

void RemoveTrailingPathSeparator(char *path)
{
   int len;
   len = (int)strlen(path);
   if(len>1 && path[len-1] == DIR_SEP)
      path[--len] = '\0';
}

void BasicValidatePathBoxPath(PathBox pathBox)
{
   char path[MAX_LOCATION];
   ValidPathBufCopy(path, pathBox.path);
   RemoveTrailingPathSeparator(path);
   pathBox.path = path;
}

CompilerConfig MakeDefaultCompiler(const char * name, bool readOnly)
{
   CompilerConfig defaultCompiler
   {
      name,
      readOnly,
      gcc,
      __runtimePlatform,
      1,
      makeDefaultCommand,
      ecpDefaultCommand,
      eccDefaultCommand,
      ecsDefaultCommand,
      earDefaultCommand,
      cppDefaultCommand,
      ccDefaultCommand,
      cxxDefaultCommand,
      arDefaultCommand
      //ldDefaultCommand
   };
   incref defaultCompiler;
   return defaultCompiler;
}

#ifdef SETTINGS_TEST
define settingsDir = ".ecereIDE-SettingsTest";
define ideSettingsName = "ecereIDE-SettingsTest";
#else
define settingsDir = ".ecereIDE";
define ideSettingsName = "ecereIDE";
#endif

class IDESettingsContainer : GlobalSettings
{
   property bool useNewConfigurationFiles
   {
      set
      {
         if(value)
         {
            settingsContainer.driver = "ECON";
            settingsName = "config";
            settingsExtension = "econ";
            settingsDirectory = settingsDir;
         }
         else
         {
            settingsContainer.driver = "JSON";
            settingsName = ideSettingsName;
            settingsExtension = null;
            settingsDirectory = null;
         }
      }
   }

   virtual void OnLoad(GlobalSettingsData data);

   char moduleLocation[MAX_LOCATION];

private:
   bool oldConfig;
   FileSize settingsFileSize;

   IDESettingsContainer()
   {
      char path[MAX_LOCATION];
      char * start;
      LocateModule(null, moduleLocation);
      strcpy(path, moduleLocation);
      StripLastDirectory(moduleLocation, moduleLocation);
      ChangeCh(moduleLocation, '\\', '/');
      // PortableApps.com directory structure
      if((start = strstr(path, "\\App\\EcereSDK\\bin\\ide.exe")))
      {
         char configFilePath[MAX_LOCATION];
         char defaultConfigFilePath[MAX_LOCATION];

         start[0] = '\0';

         strcpy(configFilePath, path);
         PathCat(configFilePath, "Data");
         PathCat(configFilePath, ideSettingsName);
         ChangeExtension(configFilePath, "ini", configFilePath);

         strcpy(defaultConfigFilePath, path);
         PathCat(defaultConfigFilePath, "App");
         PathCat(defaultConfigFilePath, "DefaultData");
         PathCat(defaultConfigFilePath, ideSettingsName);
         ChangeExtension(defaultConfigFilePath, "ini", defaultConfigFilePath);

         if(FileExists(defaultConfigFilePath))
         {
            if(!FileExists(configFilePath))
            {
               File f = FileOpen(defaultConfigFilePath, read);
               f.CopyTo(configFilePath);
               f.Flush();
               delete f;
            }
            PathCat(path, "Data");
            // the forced settings location will only be
            // used if the running ide's path matches
            // the PortableApps.com directory structure
            // and the default ini file is found in
            // the DefaultData directory
            settingsLocation = path;
            portable = true;
         }
      }
   }

   void OnAskReloadSettings()
   {
      FileSize newSettingsFileSize;

      if(OpenAndLock(&newSettingsFileSize))
      {
         if((double)settingsFileSize - (double)newSettingsFileSize < 2048)
            Load();
         else
         {
            GuiApplication app = ((GuiApplication)__thisModule.application);
            Window w;
            for(w = app.desktop.firstChild; w && (!w.created || !w.visible); w = w.next);

            CloseAndMonitor();

            MessageBox { master = w, type = ok, isModal = true,
                  text = "Global Settings Modified Externally",
                  contents = "The global settings were modified by another process and a drastic shrinking of the settings file was detected.\n"
                  "The new settings will not be loaded to prevent loss of your ide settings.\n"
                  "Please check your settings file and make sure to save this IDE's global settings if your settings file has been compromised."
                  }.Create();
         }
      }
   }

   SettingsIOResult Load()
   {
      IDESettings data;
      CompilerConfig defaultCompiler = null;
      SettingsIOResult result;
      useNewConfigurationFiles = true;
      result = GlobalSettings::Load();
      data = (IDESettings)this.data;
      oldConfig = false;
      if(result == fileNotFound)
      {
         oldConfig = true;
         /*delete this.data;
         data = null;
         *dataOwner = null;*/
         useNewConfigurationFiles = false;
         result = GlobalSettings::Load();
      }
      data = (IDESettings)this.data;
      if(!data)
      {
         this.data = IDESettings { };
         if(dataOwner)
            *dataOwner = this.data;

         if(result == fileNotCompatibleWithDriver)
         {
            bool loaded;
            OldIDESettings oldSettings { };
            Close();
            loaded = oldSettings.Load() == success;
            oldSettings.Close();
            if(loaded)
            {
               data = (IDESettings)this.data;

               for(c : oldSettings.compilerConfigs)
                  data.compilerConfigs.Add(c.Copy());

               for(s : oldSettings.recentFiles) data.recentFiles.Add(CopyString(s));
               for(s : oldSettings.recentProjects) data.recentProjects.Add(CopyString(s));

               data.docDir = oldSettings.docDir;
               data.ideFileDialogLocation = oldSettings.ideFileDialogLocation;
               data.ideProjectFileDialogLocation = oldSettings.ideProjectFileDialogLocation;
               data.useFreeCaret = oldSettings.useFreeCaret;
               data.showLineNumbers = oldSettings.showLineNumbers;
               data.caretFollowsScrolling = oldSettings.caretFollowsScrolling;
               delete data.displayDriver; data.displayDriver = CopyString(oldSettings.displayDriver);
               data.projectDefaultTargetDir = oldSettings.projectDefaultTargetDir;
               data.projectDefaultIntermediateObjDir = oldSettings.projectDefaultIntermediateObjDir;

               Save();
               result = success;
            }
            delete oldSettings;
         }
         if(result == fileNotFound || !data)
         {
            data = (IDESettings)this.data;
            data.useFreeCaret = false; //true;
            data.showLineNumbers = true;
            data.caretFollowsScrolling = false; //true;
         }
      }

      if(settingsFilePath)
      {
         {
            CompilerConfigsData d = null;
            d.read(settingsFilePath, oldConfig, class(CompilerConfigsData), &d);
            if(d && d.compilers && d.compilers.count)
            {
               data.property::compilerConfigs = d.compilers;
               d.compilers = null;
            }
            delete d;
         }
         {
            RecentFilesData d = null;
            d.read(settingsFilePath, oldConfig, class(RecentFilesData), &d);
            if(d && d.recentFiles && d.recentFiles.count)
            {
               data.property::recentFiles = d.recentFiles;
               d.recentFiles = null;
            }
            delete d;
         }
         {
            RecentWorkspacesData d = null;
            d.read(settingsFilePath, oldConfig, class(RecentWorkspacesData), &d);
            if(d && d.recentWorkspaces && d.recentWorkspaces.count)
            {
               data.property::recentProjects = d.recentWorkspaces;
               d.recentWorkspaces = null;
            }
            delete d;
         }
      }

      // Ensure we have a default compiler
      defaultCompiler = data.GetCompilerConfig(defaultCompilerName);
      if(!defaultCompiler)
      {
         defaultCompiler = MakeDefaultCompiler(defaultCompilerName, true);
         data.compilerConfigs.Add(defaultCompiler);
      }

      // We incref the compilers below, so reset refCount to 0
      defaultCompiler._refCount = 0;

      CloseAndMonitor();
      FileGetSize(settingsFilePath, &settingsFileSize);
      if(data.compilerConfigs)
      {
         for(ccfg : data.compilerConfigs)
         {
            if(!ccfg.ecpCommand || !ccfg.ecpCommand[0])
               ccfg.ecpCommand = ecpDefaultCommand;
            if(!ccfg.eccCommand || !ccfg.eccCommand[0])
               ccfg.eccCommand = eccDefaultCommand;
            if(!ccfg.ecsCommand || !ccfg.ecsCommand[0])
               ccfg.ecsCommand = ecsDefaultCommand;
            if(!ccfg.earCommand || !ccfg.earCommand[0])
               ccfg.earCommand = earDefaultCommand;
            if(!ccfg.cppCommand || !ccfg.cppCommand[0])
               ccfg.cppCommand = cppDefaultCommand;
            if(!ccfg.ccCommand || !ccfg.ccCommand[0])
               ccfg.ccCommand = ccDefaultCommand;
            if(!ccfg.cxxCommand || !ccfg.cxxCommand[0])
               ccfg.cxxCommand = cxxDefaultCommand;
            /*if(!ccfg.ldCommand || !ccfg.ldCommand[0])
               ccfg.ldCommand = ldDefaultCommand;*/
            if(!ccfg.arCommand || !ccfg.arCommand[0])
               ccfg.arCommand = arDefaultCommand;
            if(!ccfg.objectFileExt || !ccfg.objectFileExt[0])
               ccfg.objectFileExt = objectDefaultFileExt;
            /*if(!ccfg.outputFileExt || !ccfg.outputFileExt[0])
               ccfg.outputFileExt = outputDefaultFileExt;*/
            incref ccfg;
         }
      }
      if(portable && moduleLocation[0] && FileExists(moduleLocation).isDirectory)
         data.ManagePortablePaths(moduleLocation, true);
      data.ForcePathSeparatorStyle(true);
      OnLoad(data);
      if(oldConfig)
      {
         useNewConfigurationFiles = true;
         Save();
      }
      return result;
   }

   SettingsIOResult Save()
   {
      SettingsIOResult result;
      IDESettings data;
      useNewConfigurationFiles = true;
      data = (IDESettings)this.data;
      if(portable && moduleLocation[0] && FileExists(moduleLocation).isDirectory)
         data.ManagePortablePaths(moduleLocation, false);
      data.ForcePathSeparatorStyle(true);
      if(oldConfig)
         settingsFilePath = null;
      result = GlobalSettings::Save();
      if(result != success)
         PrintLn("Error saving IDE settings");
      else
         oldConfig = false;
      if(portable && moduleLocation[0] && FileExists(moduleLocation).isDirectory)
         data.ManagePortablePaths(moduleLocation, true);

      CloseAndMonitor();
      FileGetSize(settingsFilePath, &settingsFileSize);

      {
         CompilerConfigsData d { };
         delete d.compilers;
         d.compilers = data.compilerConfigs;
         d.write(settingsFilePath, oldConfig, class(CompilerConfigsData), d);
         d.compilers = null;
         delete d;
      }
      {
         RecentFilesData d { };
         delete d.recentFiles;
         d.recentFiles = data.recentFiles;
         d.write(settingsFilePath, oldConfig, class(RecentFilesData), d);
         d.recentFiles = null;
         delete d;
      }
      {
         RecentWorkspacesData d { };
         delete d.recentWorkspaces;
         d.recentWorkspaces = data.recentProjects;
         d.write(settingsFilePath, oldConfig, class(RecentWorkspacesData), d);
         d.recentWorkspaces = null;
         delete d;
      }

      return result;
   }
}

static void getDotEcereIDEFileDataPath(const char * settingsFilePath, bool oldConfig, Class _class, char * path)
{
   strcpy(path, settingsFilePath);
   StripLastDirectory(path, path);
   if(oldConfig)
      PathCatSlash(path, settingsDir);
   if(_class == class(CompilerConfigsData))
      PathCatSlash(path, "compilerConfigs.econ");
   else if(_class == class(RecentFilesData))
      PathCatSlash(path, "recentFiles.econ");
   else if(_class == class(RecentWorkspacesData))
      PathCatSlash(path, "recentWorkspaces.econ");
}

class DotEcereIDEFileData
{
   SettingsIOResult write(const char * settingsFilePath, bool oldConfig, Class _class, DotEcereIDEFileData data)
   {
      SettingsIOResult result = error;
      char path[MAX_LOCATION];
      File f;
      getDotEcereIDEFileDataPath(settingsFilePath, oldConfig, _class, path);
      f = FileOpen(path, write);
      if(f)
      {
         WriteECONObject(f, _class, data, 0);
         delete f;
         result = success;
      }
      else
         PrintLn($"Error writing compiler configs file to ", path, " location.");
      return result;
   }

   SettingsIOResult read(const char * settingsFilePath, bool oldConfig, Class _class, DotEcereIDEFileData * data/*, bool interactive*/)
   {
      SettingsIOResult result = error;
      char path[MAX_LOCATION];
      File f;
      getDotEcereIDEFileDataPath(settingsFilePath, oldConfig, _class, path);
      if(!FileExists(path))
         result = fileNotFound;
      else if((f = FileOpen(path, read)))
      {
         JSONResult jsonResult;
         {
            ECONParser parser { f = f };
            f.Seek(0, start);
            jsonResult = parser.GetObject(_class, data);
            if(jsonResult != success)
               delete *data;
            delete parser;
         }
         if(!*data)
         {
            JSONParser parser { f = f };
            f.Seek(0, start);
            jsonResult = parser.GetObject(this._class, data);
            if(jsonResult != success)
               delete *data;
            delete parser;
         }
         if(jsonResult == success)
            result = success;
         else
         {
   #if 0
            if(jsonResult == syntaxError && (!interactive || MessageBox { type = yesNo, master = cartographer,
                              caption = $"Corrupt compiler configs file", contents = $"Attempt to load safety copy?" }.Modal() == yes))
            {
               char * altPath = new char[MAX_LOCATION]; strcat(altPath, path);
               delete f;
               strcat(altPath, ".copy");
               if((f = FileOpen(altPath, read)))
               {
                  jsonResult = parser.GetObject(this._class, data);
                  if(jsonResult == success)
                     result = success;
               }
               delete altPath;
            }
            else
   #endif
            {
               result = fileNotCompatibleWithDriver;
               PrintLn($"Error reading compiler configs file");
            }
         }
         delete f;
      }
      return result;
   }
}

class CompilerConfigsData : DotEcereIDEFileData
{
public:
   List<CompilerConfig> compilers { };
}

class RecentFilesData : DotEcereIDEFileData
{
public:
   Array<String> recentFiles { };
}

class RecentWorkspacesData : DotEcereIDEFileData
{
public:
   Array<String> recentWorkspaces { };
}

class IDESettings : GlobalSettingsData
{
public:
   property List<CompilerConfig> compilerConfigs
   {
      set { delete compilerConfigs; if(value) compilerConfigs = value; }
      get { return compilerConfigs; }
      isset { return false; }
   }
   property Array<String> recentFiles
   {
      set { delete recentFiles; if(value) recentFiles = value; }
      get { return recentFiles; }
      isset { return false; }
   }
   property Array<String> recentProjects
   {
      set { delete recentProjects; if(value) recentProjects = value; }
      get { return recentProjects; }
      isset { return false; }
   }
   property const char * docDir
   {
      set { delete docDir; if(value && value[0]) docDir = CopyString(value); }
      get { return docDir ? docDir : ""; }
      isset { return docDir && docDir[0]; }
   }
   property const char * ideFileDialogLocation
   {
      set { delete ideFileDialogLocation; if(value && value[0]) ideFileDialogLocation = CopyString(value); }
      get { return ideFileDialogLocation ? ideFileDialogLocation : ""; }
      isset { return ideFileDialogLocation && ideFileDialogLocation[0]; }
   }
   property const char * ideProjectFileDialogLocation
   {
      set { delete ideProjectFileDialogLocation; if(value && value[0]) ideProjectFileDialogLocation = CopyString(value); }
      get { return ideProjectFileDialogLocation ? ideProjectFileDialogLocation : ""; }
      isset { return ideProjectFileDialogLocation && ideProjectFileDialogLocation[0]; }
   }
   bool useFreeCaret;
   bool showLineNumbers;
   bool caretFollowsScrolling;
   char * displayDriver;

   // TODO: Classify settings
   //EditorSettings editor { };

   property const char * projectDefaultTargetDir
   {
      set { delete projectDefaultTargetDir; if(value && value[0]) projectDefaultTargetDir = CopyValidateMakefilePath(value); }
      get { return projectDefaultTargetDir ? projectDefaultTargetDir : ""; }
      isset { return projectDefaultTargetDir && projectDefaultTargetDir[0]; }
   }
   property const char * projectDefaultIntermediateObjDir
   {
      set { delete projectDefaultIntermediateObjDir; if(value && value[0]) projectDefaultIntermediateObjDir = CopyValidateMakefilePath(value); }
      get { return projectDefaultIntermediateObjDir ? projectDefaultIntermediateObjDir : ""; }
      isset { return projectDefaultIntermediateObjDir && projectDefaultIntermediateObjDir[0]; }
   }

   property const char * compilerConfigsDir
   {
      set { delete compilerConfigsDir; if(value && value[0]) compilerConfigsDir = CopyString(value); }
      get { return compilerConfigsDir ? compilerConfigsDir : ""; }
      isset { return compilerConfigsDir && compilerConfigsDir[0]; }
   }

   property const char * defaultCompiler
   {
      set { delete defaultCompiler; if(value && value[0]) defaultCompiler = CopyString(value); }
      get { return defaultCompiler && defaultCompiler[0] ? defaultCompiler : defaultCompilerName; }
      isset { return defaultCompiler && defaultCompiler[0]; }
   }

   property const String language
   {
      set
      {
         delete language;
         language = CopyString(value);
      }
      get { return language; }
      isset { return language != null; }
   }

private:
   List<CompilerConfig> compilerConfigs { };
   char * docDir;
   char * ideFileDialogLocation;
   char * ideProjectFileDialogLocation;
   char * projectDefaultTargetDir;
   char * projectDefaultIntermediateObjDir;
   char * compilerConfigsDir;
   char * defaultCompiler;
   String language;
   Array<String> recentFiles { };
   Array<String> recentProjects { };

   CompilerConfig GetCompilerConfig(const String compilerName)
   {
      const char * name = compilerName && compilerName[0] ? compilerName : defaultCompilerName;
      CompilerConfig compilerConfig = null;
      for(compiler : compilerConfigs)
      {
         if(!strcmp(compiler.name, name))
         {
            compilerConfig = compiler;
            break;
         }
      }
      if(!compilerConfig && compilerConfigs.count)
         compilerConfig = compilerConfigs.firstIterator.data;
      if(compilerConfig)
         incref compilerConfig;
      return compilerConfig;
   }

   ~IDESettings()
   {
      compilerConfigs.Free();
      delete compilerConfigs;
      recentFiles.Free();
      delete recentFiles;
      recentProjects.Free();
      delete recentProjects;
      delete docDir;

      delete projectDefaultTargetDir;
      delete projectDefaultIntermediateObjDir;
      delete compilerConfigsDir;
      delete defaultCompiler;
      delete language;

      delete ideFileDialogLocation;
      delete ideProjectFileDialogLocation;
      delete displayDriver;
   }

   void ForcePathSeparatorStyle(bool unixStyle)
   {
      char from, to;
      if(unixStyle)
         from = '\\', to = '/';
      else
         from = '/', to = '\\';
      if(compilerConfigs && compilerConfigs.count)
      {
         int i;
         for(config : compilerConfigs)
         {
            if(config.includeDirs && config.includeDirs.count)
            {
               for(i = 0; i < config.includeDirs.count; i++)
               {
                  if(config.includeDirs[i] && config.includeDirs[i][0])
                     ChangeCh(config.includeDirs[i], from, to);
               }
            }
            if(config.libraryDirs && config.libraryDirs.count)
            {
               for(i = 0; i < config.libraryDirs.count; i++)
               {
                  if(config.libraryDirs[i] && config.libraryDirs[i][0])
                     ChangeCh(config.libraryDirs[i], from, to);
               }
            }
            if(config.executableDirs && config.executableDirs.count)
            {
               for(i = 0; i < config.executableDirs.count; i++)
               {
                  if(config.executableDirs[i] && config.executableDirs[i][0])
                     ChangeCh(config.executableDirs[i], from, to);
               }
            }
         }
      }
      if(recentFiles && recentFiles.count)
      {
         int c;
         for(c = 0; c < recentFiles.count; c++)
         {
            if(recentFiles[c] && recentFiles[c][0])
               ChangeCh(recentFiles[c], from, to);
         }
      }
      if(recentProjects && recentProjects.count)
      {
         int c;
         for(c = 0; c < recentProjects.count; c++)
         {
            if(recentProjects[c] && recentProjects[c][0])
               ChangeCh(recentProjects[c], from, to);
         }
      }
      if(docDir && docDir[0])
         ChangeCh(docDir, from, to);
      if(ideFileDialogLocation && ideFileDialogLocation[0])
         ChangeCh(ideFileDialogLocation, from, to);
      if(ideProjectFileDialogLocation && ideProjectFileDialogLocation[0])
         ChangeCh(ideProjectFileDialogLocation, from, to);

      if(projectDefaultTargetDir && projectDefaultTargetDir[0])
         ChangeCh(projectDefaultTargetDir, from, to);
      if(projectDefaultIntermediateObjDir && projectDefaultIntermediateObjDir[0])
         ChangeCh(projectDefaultIntermediateObjDir, from, to);

      if(compilerConfigsDir && compilerConfigsDir[0])
         ChangeCh(compilerConfigsDir, from, to);
   }

   void ManagePortablePaths(char * location, bool makeAbsolute)
   {
      int c;
      if(compilerConfigs && compilerConfigs.count)
      {
         for(config : compilerConfigs)
         {
            DirTypes t;
            for(t = 0; t < DirTypes::enumSize; t++)
            {
               Array<String> dirs = null;
               if(t == executables) dirs = config.executableDirs;
               else if(t == includes) dirs = config.includeDirs;
               else if(t == libraries) dirs = config.libraryDirs;
               if(dirs && dirs.count)
               {
                  for(c = 0; c < dirs.count; c++)
                  {
                     if(dirs[c] && dirs[c][0])
                        dirs[c] = UpdatePortablePath(dirs[c], location, makeAbsolute);
                  }
               }
            }
         }
      }
      if(recentFiles && recentFiles.count)
      {
         for(c = 0; c < recentFiles.count; c++)
         {
            if(recentFiles[c] && recentFiles[c][0])
               recentFiles[c] = UpdatePortablePath(recentFiles[c], location, makeAbsolute);
         }
      }
      if(recentProjects && recentProjects.count)
      {
         for(c = 0; c < recentProjects.count; c++)
         {
            if(recentProjects[c] && recentProjects[c][0])
               recentProjects[c] = UpdatePortablePath(recentProjects[c], location, makeAbsolute);
         }
      }
      if(docDir && docDir[0])
         docDir = UpdatePortablePath(docDir, location, makeAbsolute);
      if(ideFileDialogLocation && ideFileDialogLocation[0])
         ideFileDialogLocation = UpdatePortablePath(ideFileDialogLocation, location, makeAbsolute);
      if(ideProjectFileDialogLocation && ideProjectFileDialogLocation[0])
         ideProjectFileDialogLocation = UpdatePortablePath(ideProjectFileDialogLocation, location, makeAbsolute);

      if(projectDefaultTargetDir && projectDefaultTargetDir[0])
         projectDefaultTargetDir = UpdatePortablePath(projectDefaultTargetDir, location, makeAbsolute);
      if(projectDefaultIntermediateObjDir && projectDefaultIntermediateObjDir[0])
         projectDefaultIntermediateObjDir = UpdatePortablePath(projectDefaultIntermediateObjDir, location, makeAbsolute);

      if(compilerConfigsDir && compilerConfigsDir[0])
         compilerConfigsDir = UpdatePortablePath(compilerConfigsDir, location, makeAbsolute);
   }

   char * UpdatePortablePath(char * path, const char * location, bool makeAbsolute)
   {
      char * output;
      if(makeAbsolute)
      {
         char p[MAX_LOCATION];
         strcpy(p, location);
         PathCatSlash(p, path);
         delete path;
         output = CopyString(p);
      }
      else
      {
         PathRelationship rel = eString_PathRelated(path, location, null);
         if(rel == subPath || rel == identical)
         {
            char p[MAX_LOCATION];
            MakePathRelative(path, location, p);
            if(!*p) strcpy(p, "./");
            else ChangeCh(p, '\\', '/');
            delete path;
            output = CopyString(p);
         }
         else
            output = path;
      }
      return output;
   }

   void AddRecentFile(const char * fileName)
   {
      int c;
      char * filePath = CopyString(fileName);
      ChangeCh(filePath, '\\', '/');
      for(c = 0; c<recentFiles.count; c++)
      {
         if(recentFiles[c] && !fstrcmp(recentFiles[c], filePath))
         {
            recentFiles.Delete((void *)&recentFiles[c]);
            c--;
         }
      }
      while(recentFiles.count >= MaxRecent)
         recentFiles.Delete(recentFiles.GetLast());
      recentFiles.Insert(null, filePath);
      //UpdateRecentMenus(owner);
   }

   void AddRecentProject(const char * projectName)
   {
      int c;
      char * filePath = CopyString(projectName);
      ChangeCh(filePath, '\\', '/');
      for(c = 0; c<recentProjects.count; c++)
      {
         if(recentProjects[c] && !fstrcmp(recentProjects[c], filePath))
         {
            recentProjects.Delete((void *)&recentProjects[c]);
            c--;
         }
      }
      while(recentProjects.count >= MaxRecent)
         recentProjects.Delete(recentProjects.GetLast());
      recentProjects.Insert(null, filePath);
      //UpdateRecentMenus(owner);
   }
}

static const char * compilerTypeNames[CompilerType] = { "GCC", "TCC", "PCC", "VS8", "VS9", "VS10" };
static const char * compilerTypeVersionString[CompilerType] = { "", "", "", "8.00", "9.00", "10.00" };
static const char * compilerTypeSolutionFileVersionString[CompilerType] = { "", "", "", "9.00", "10.00", "11.00" };
static const char * compilerTypeYearString[CompilerType] = { "", "", "", "2005", "2008", "2010" };
static const char * compilerTypeProjectFileExtension[CompilerType] = { "", "", "", "vcproj", "vcproj", "vcxproj" };
// TODO: i18n with Array
static Array<const String> compilerTypeLongNames
{ [
   $"GNU Compiler Collection (GCC) / GNU Make",
   $"Tiny C Compiler / GNU Make",
   $"Portable C Compiler / GNU Make",
   $"Microsoft Visual Studio 2005 (8.0) Compiler",
   $"Microsoft Visual Studio 2008 (9.0) Compiler",
   $"Microsoft Visual Studio 2010 (10.0) Compiler"
] };
const CompilerType firstCompilerType = gcc;
const CompilerType lastCompilerType = vs10;
public enum CompilerType
{
   gcc, tcc, pcc, vs8, vs9, vs10;

   property bool isVC
   {
      get { return this == vs8 || this == vs9 || this == vs10; }
   }

   property const char *
   {
      get { return OnGetString(null, null, null); }
      set
      {
         if(value)
         {
            CompilerType c;
            for(c = firstCompilerType; c <= lastCompilerType; c++)
               if(!strcmpi(value, compilerTypeNames[c]))
                  return c;
         }
         return gcc;
      }
   };

   property const char * longName { get { return OnGetString(null, (void*)1, null); } };
   property const char * versionString { get { return OnGetString(null, (void*)2, null); } };
   property const char * yearString { get { return OnGetString(null, (void*)3, null); } };
   property const char * projectFileExtension { get { return OnGetString(null, (void*)4, null); } };
   property const char * solutionFileVersionString { get { return OnGetString(null, (void*)5, null); } };

   const char * OnGetString(char * tempString, void * fieldData, bool * needClass)
   {
      if(this >= firstCompilerType && this <= lastCompilerType)
      {
         if(tempString)
            strcpy(tempString, compilerTypeNames[this]);
         if(fieldData == null)
            return compilerTypeNames[this];
         else if(fieldData == (void*)1)
            return compilerTypeLongNames[this];
         else if(fieldData == (void*)2)
            return compilerTypeVersionString[this];
         else if(fieldData == (void*)3)
            return compilerTypeYearString[this];
         else if(fieldData == (void*)4)
            return compilerTypeProjectFileExtension[this];
         else if(fieldData == (void*)5)
            return compilerTypeSolutionFileVersionString[this];
      }
      return null;
   }
};

class CompilerConfig
{
   class_no_expansion;

   numJobs = 1;
public:
   property const char * name
   {
      set
      {
         delete name;
         if(value)
            name = CopyString(value);
      }
      get { return name; }
   }
   bool readOnly;
   CompilerType type;
   Platform targetPlatform;
   int numJobs;
   property const char * makeCommand
   {
      set { delete makeCommand; if(value && value[0]) makeCommand = CopyString(value); }
      get { return makeCommand; }
      isset { return makeCommand && makeCommand[0]; }
   }
   property const char * ecpCommand
   {
      set { delete ecpCommand; if(value && value[0]) ecpCommand = CopyString(value); }
      get { return ecpCommand; }
      isset { return ecpCommand && ecpCommand[0]; }
   }
   property const char * eccCommand
   {
      set { delete eccCommand; if(value && value[0]) eccCommand = CopyString(value); }
      get { return eccCommand; }
      isset { return eccCommand && eccCommand[0]; }
   }
   property const char * ecsCommand
   {
      set { delete ecsCommand; if(value && value[0]) ecsCommand = CopyString(value); }
      get { return ecsCommand; }
      isset { return ecsCommand && ecsCommand[0]; }
   }
   property const char * earCommand
   {
      set { delete earCommand; if(value && value[0]) earCommand = CopyString(value); }
      get { return earCommand; }
      isset { return earCommand && earCommand[0]; }
   }
   property const char * cppCommand
   {
      set { delete cppCommand; if(value && value[0]) cppCommand = CopyString(value); }
      get { return cppCommand; }
      isset { return cppCommand && cppCommand[0]; }
   }
   property const char * ccCommand
   {
      set { delete ccCommand; if(value && value[0]) ccCommand = CopyString(value); }
      get { return ccCommand; }
      isset { return ccCommand && ccCommand[0]; }
   }
   property const char * cxxCommand
   {
      set { delete cxxCommand; if(value && value[0]) cxxCommand = CopyString(value); }
      get { return cxxCommand; }
      isset { return cxxCommand && cxxCommand[0]; }
   }
   property const char * arCommand
   {
      set { delete arCommand; if(value && value[0]) arCommand = CopyString(value); }
      get { return arCommand; }
      isset { return arCommand && arCommand[0]; }
   }
   property const char * ldCommand
   {
      set { delete ldCommand; if(value && value[0]) ldCommand = CopyString(value); }
      get { return ldCommand; }
      isset { return ldCommand && ldCommand[0]; }
   }
   property const char * objectFileExt
   {
      set { delete objectFileExt; if(value && value[0]) objectFileExt = CopyString(value); }
      get { return objectFileExt && objectFileExt[0] ? objectFileExt : objectDefaultFileExt ; }
      isset { return objectFileExt && objectFileExt[0] && strcmp(objectFileExt, objectDefaultFileExt); }
   }
   property const char * outputFileExt
   {
      set { delete outputFileExt; if(value && value[0]) outputFileExt = CopyString(value); }
      get { return outputFileExt; }
      isset { return outputFileExt && outputFileExt[0]; }
   }
   property const char * executableLauncher
   {
      set { delete executableLauncher; if(value && value[0]) executableLauncher = CopyString(value); }
      get { return executableLauncher; }
      isset { return executableLauncher && executableLauncher[0]; }
   }
   // TODO: implement CompilerConfig::windresCommand
   bool ccacheEnabled;
   bool distccEnabled;
   // deprecated
   property bool supportsBitDepth { set { } get { return true; } isset { return false; } }

   property const char * distccHosts
   {
      set { delete distccHosts; if(value && value[0]) distccHosts = CopyString(value); }
      get { return distccHosts; }
      isset { return distccHosts && distccHosts[0]; }
   }
   property const char * gnuToolchainPrefix
   {
      set { delete gnuToolchainPrefix; if(value && value[0]) gnuToolchainPrefix = CopyString(value); }
      get { return gnuToolchainPrefix; }
      isset { return gnuToolchainPrefix && gnuToolchainPrefix[0]; }
   }
   property const char * sysroot
   {
      set { delete sysroot; if(value && value[0]) sysroot = CopyString(value); }
      get { return sysroot; }
      isset { return sysroot && sysroot[0]; }
   }
   bool resourcesDotEar;
   property Array<String> includeDirs
   {
      set
      {
         includeDirs.Free();
         if(value)
         {
            delete includeDirs;
            includeDirs = value;
         }
      }
      get { return includeDirs; }
      isset { return includeDirs.count != 0; }
   }
   property Array<String> libraryDirs
   {
      set
      {
         libraryDirs.Free();
         if(value)
         {
            delete libraryDirs;
            libraryDirs = value;
         }
      }
      get { return libraryDirs; }
      isset { return libraryDirs.count != 0; }
   }
   property Array<String> executableDirs
   {
      set
      {
         executableDirs.Free();
         if(value)
         {
            delete executableDirs;
            executableDirs = value;
         }
      }
      get { return executableDirs; }
      isset { return executableDirs.count != 0; }
   }
   property Array<NamedString> environmentVars
   {
      set
      {
         environmentVars.Free();
         if(value)
         {
            delete environmentVars;
            environmentVars = value;
         }
      }
      get { return environmentVars; }
      isset { return environmentVars.count != 0; }
   }
   property Array<String> prepDirectives
   {
      set
      {
         prepDirectives.Free();
         if(value)
         {
            delete prepDirectives;
            prepDirectives = value;
         }
      }
      get { return prepDirectives; }
      isset { return prepDirectives.count != 0; }
   }
   property Array<String> excludeLibs
   {
      set
      {
         excludeLibs.Free();
         if(value)
         {
            delete excludeLibs;
            excludeLibs = value;
         }
      }
      get { return excludeLibs; }
      isset { return excludeLibs.count != 0; }
   }
   property Array<String> eCcompilerFlags
   {
      set
      {
         eCcompilerFlags.Free();
         if(value)
         {
            delete eCcompilerFlags;
            eCcompilerFlags = value;
         }
      }
      get { return eCcompilerFlags; }
      isset { return eCcompilerFlags.count != 0; }
   }
   property Array<String> compilerFlags
   {
      set
      {
         compilerFlags.Free();
         if(value)
         {
            delete compilerFlags;
            compilerFlags = value;
         }
      }
      get { return compilerFlags; }
      isset { return compilerFlags.count != 0; }
   }
   property Array<String> linkerFlags
   {
      set
      {
         linkerFlags.Free();
         if(value)
         {
            delete linkerFlags;
            linkerFlags = value;
         }
      }
      get { return linkerFlags; }
      isset { return linkerFlags.count != 0; }
   }
   // json backward compatibility
   property const char * gccPrefix
   {
      set { delete gnuToolchainPrefix; if(value && value[0]) gnuToolchainPrefix = CopyString(value); }
      get { return gnuToolchainPrefix; }
      isset { return false; }
   }
   property const char * execPrefixCommand
   {
      set { delete executableLauncher; if(value && value[0]) executableLauncher = CopyString(value); }
      get { return executableLauncher; }
      isset { return false; }
   }
private:
   Array<String> includeDirs { };
   Array<String> libraryDirs { };
   Array<String> executableDirs { };
   // TODO: Can JSON parse and serialize maps?
   //EnvironmentVariables { };
   Array<NamedString> environmentVars { };
   Array<String> prepDirectives { };
   Array<String> excludeLibs { };
   Array<String> eCcompilerFlags { };
   Array<String> compilerFlags { };
   Array<String> linkerFlags { };
   char * name;
   char * makeCommand;
   char * ecpCommand;
   char * eccCommand;
   char * ecsCommand;
   char * earCommand;
   char * cppCommand;
   char * ccCommand;
   char * cxxCommand;
   char * ldCommand;
   char * arCommand;
   char * objectFileExt;
   char * outputFileExt;
   char * executableLauncher;
   char * distccHosts;
   char * gnuToolchainPrefix;
   char * sysroot;
   /*union
   {
      struct { Array<String> includes, libraries, executables; };
      Array<String> dirs[DirTypes];
   }*/

   ~CompilerConfig()
   {
      delete name;
      delete ecpCommand;
      delete eccCommand;
      delete ecsCommand;
      delete earCommand;
      delete cppCommand;
      delete ccCommand;
      delete cxxCommand;
      delete ldCommand;
      delete arCommand;
      delete objectFileExt;
      delete outputFileExt;
      delete makeCommand;
      delete executableLauncher;
      delete distccHosts;
      delete gnuToolchainPrefix;
      delete sysroot;
      if(environmentVars) environmentVars.Free();
      if(includeDirs) { includeDirs.Free(); }
      if(libraryDirs) { libraryDirs.Free(); }
      if(executableDirs) { executableDirs.Free(); }
      if(prepDirectives) { prepDirectives.Free(); }
      if(excludeLibs) { excludeLibs.Free(); }
      if(compilerFlags) { compilerFlags.Free(); }
      if(eCcompilerFlags) { eCcompilerFlags.Free(); }
      if(linkerFlags) { linkerFlags.Free(); }
   }

public:
   CompilerConfig Copy()
   {
      CompilerConfig copy
      {
         name,
         readOnly,
         type,
         targetPlatform,
         numJobs,
         makeCommand,
         ecpCommand,
         eccCommand,
         ecsCommand,
         earCommand,
         cppCommand,
         ccCommand,
         cxxCommand,
         arCommand,
         ldCommand,
         objectFileExt,
         outputFileExt,
         executableLauncher,
         ccacheEnabled,
         distccEnabled,
         false,
         distccHosts,
         gnuToolchainPrefix,
         sysroot,
         resourcesDotEar
      };
      for(s : includeDirs) copy.includeDirs.Add(CopyString(s));
      for(s : libraryDirs) copy.libraryDirs.Add(CopyString(s));
      for(s : executableDirs) copy.executableDirs.Add(CopyString(s));
      for(ns : environmentVars) copy.environmentVars.Add(NamedString { name = ns.name, string = ns.string });
      for(s : prepDirectives) copy.prepDirectives.Add(CopyString(s));
      for(s : excludeLibs) copy.excludeLibs.Add(CopyString(s));
      for(s : compilerFlags) copy.compilerFlags.Add(CopyString(s));
      for(s : eCcompilerFlags) copy.eCcompilerFlags.Add(CopyString(s));
      for(s : linkerFlags) copy.linkerFlags.Add(CopyString(s));

      incref copy;
      return copy;
   }
}

#if defined(ECERE_IDE)
struct LanguageOption
{
   const String name;
   const String bitmap;
   const String code;
   BitmapResource res;

   const char * OnGetString(char * tempString, void * fieldData, bool * needClass)
   {
      return name;
   }

   void OnDisplay(Surface surface, int x, int y, int width, void * data, Alignment alignment, DataDisplayFlags flags)
   {
      Bitmap icon = res ? res.bitmap : null;
      int w = 8 + 16;
      if(icon)
         surface.Blit(icon, x + (16 - icon.width) / 2,y+2,0,0, icon.width, icon.height);
      class::OnDisplay(surface, x + w, y, width - w, null, alignment, flags);
   }
};

Array<LanguageOption> languages
{ [
   { "English",            ":countryCode/gb.png", "" },
   { "汉语",                ":countryCode/cn.png", "zh_CN" },
   { "Español",            ":countryCode/es.png", "es" },
   { "Português (Brazil)", ":countryCode/br.png", "pt_BR" },
   { "Русский (43%)",      ":countryCode/ru.png", "ru" },
   { "Nederlandse (13%)",  ":countryCode/nl.png", "nl" },
   { "Tiếng Việt (12%)",   ":countryCode/vn.png", "vi" },
   { "मराठी (10%)",          ":countryCode/in.png", "mr" },
   { "Hebrew (8%)",        ":countryCode/il.png", "he" },
   { "Magyar (8%)",        ":countryCode/hu.png", "hu" }
] };

const String GetLanguageString()
{
   char * dot, * colon;
   static char lang[256];
   const String language = getenv("ECERE_LANGUAGE");
   if(!language) language = getenv("LANGUAGE");
   if(!language) language = getenv("LC_ALL");
   if(!language) language = getenv("LC_MESSAGES");
   if(!language) language = getenv("LANG");
   if(!language) language = "";
   if(language && (colon = strchr(language, ':')))
   {
      if(lang != language)
         strncpy(lang, language, sizeof(lang));
      lang[sizeof(lang)-1] = 0;
      lang[colon - language] = 0;
      language = lang;
   }
   if(language && (dot = strchr(language, '.')))
   {
      if(lang != language)
         strncpy(lang, language, sizeof(lang));
      lang[sizeof(lang)-1] = 0;
      lang[dot - language] = 0;
      language = lang;
   }
   return language;
}

bool LanguageRestart(const char * code, Application app, IDESettings settings, IDESettingsContainer settingsContainer, Window ide, Window projectView, bool wait)
{
   bool restart = true;
   String command = null;
   int arg0Len = (int)strlen(app.argv[0]);
   int len = arg0Len;
   int j;
   char ch;

   if(ide)
   {
      Window w;

      if(projectView)
      {
         Window w;
         for(w = ide.firstChild; w; w = w.next)
         {
            if(w.isActiveClient && w.isDocument)
            {
               if(!w.CloseConfirmation(true))
               {
                  restart = false;
                  break;
               }
            }
         }
         if(restart)
         {
            if(!projectView.CloseConfirmation(true))
               restart = false;
            if(projectView.fileName)
            {
               const char * name = projectView.fileName;
               if(name)
               {
                  for(j = 0; (ch = name[j]); j++)
                     len += (ch == ' ' || ch == '\"' || ch == '&' || ch == '$' || ch == '(' || ch == ')') ? 2 : 1;
               }
            }

            command = new char[len + 1];

            strcpy(command, app.argv[0]);
            len = arg0Len;
            if(projectView.fileName)
            {
               strcat(command, " ");
               len++;
               ReplaceSpaces(command + len, projectView.fileName);
            }
         }
         if(restart)
         {
            for(w = ide.firstChild; w; w = w.next)
               if(w.isActiveClient && w.isDocument)
                  w.modifiedDocument = false;
            projectView.modifiedDocument = false;
         }
      }
      else
      {
         for(w = ide.firstChild; w; w = w.next)
         {
            if(w.isActiveClient && w.isDocument)
            {
               if(!w.CloseConfirmation(true))
               {
                  restart = false;
                  break;
               }
               if(w.fileName)
               {
                  const char * name = w.fileName;
                  len++;
                  for(j = 0; (ch = name[j]); j++)
                     len += (ch == ' ' || ch == '\"' || ch == '&' || ch == '$' || ch == '(' || ch == ')') ? 2 : 1;
               }
            }
         }

         if(restart)
         {
            command = new char[len + 1];
            strcpy(command, app.argv[0]);
            len = arg0Len;

            for(w = ide.firstChild; w; w = w.next)
            {
               if(w.isActiveClient && w.isDocument)
               {
                  const char * name = w.fileName;
                  if(name)
                  {
                     strcat(command, " ");
                     len++;
                     ReplaceSpaces(command + len, name);
                     len = (int)strlen(command);
                  }
               }
            }
         }
         if(restart)
         {
            for(w = ide.firstChild; w; w = w.next)
               if(w.isActiveClient && w.isDocument)
                  w.modifiedDocument = false;
         }
      }
      if(restart)
      {
         settings.language = code;
         settingsContainer.Save();

         setLanguageEnvironmentVariable(code);

         if(eClass_IsDerived(app._class, class(GuiApplication)))
         {
            GuiApplication guiApp = (GuiApplication)app;
            guiApp.desktop.Destroy(0);
         }
      }
   }
   else
   {
      int i;
      for(i = 1; i < app.argc; i++)
      {
         const char * arg = app.argv[i];
         len++;
         for(j = 0; (ch = arg[j]); j++)
            len += (ch == ' ' || ch == '\"' || ch == '&' || ch == '$' || ch == '(' || ch == ')') ? 2 : 1;
      }

      command = new char[len + 1];
      strcpy(command, app.argv[0]);
      len = arg0Len;
      for(i = 1; i < app.argc; i++)
      {
         strcat(command, " ");
         len++;
         ReplaceSpaces(command + len, app.argv[i]);
         len = (int)strlen(command);
      }
   }

   if(restart)
   {
      SetEnvironment("ECERE_LANGUAGE", code);
      if(wait)
         ExecuteWait(command);
      else
         Execute(command);
   }
   delete command;
   return restart;
}
#endif
