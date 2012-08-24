#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

import "StringsBox"

import "OldIDESettings"

define MaxRecent = 9;

enum DirTypes { includes, libraries, executables };

define defaultCompilerName = "Default";

define defaultObjDirExpression = "obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)";

char * settingsDirectoryNames[DirTypes] = 
{
   "Include Files",
   "Library Files",
   "Executable Files"
};

enum GlobalSettingsChange { none, editorSettings, projectOptions, compilerSettings };

enum PathRelationship { unrelated, identical, siblings, subPath, parentPath, insuficientInput, pathEmpty, toEmpty, pathNull, toNull, bothEmpty, bothNull };
PathRelationship eString_PathRelated(char * path, char * to, char * pathDiff)
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

char * CopyValidateMakefilePath(char * path)
{
   const int map[]  =    { 0,           1,           2,             3,             4,           5,                    6,                 0,             1,                 7         };
   const char * vars[] = { "$(MODULE)", "$(CONFIG)", "$(PLATFORM)", "$(COMPILER)", "$(TARGET)", "$(COMPILER_SUFFIX)", "$(DEBUG_SUFFIX)", "$(PROJECT)",  "$(CONFIGURATION)",(char *)0 };

   char * copy = null;
   if(path)
   {
      int len;
      len = strlen(path);
      copy = CopyString(path);
      if(len)
      {
         int c;
         char * tmp = copy;
         char * start = tmp;
         Array<char *> parts { };
         
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

CompilerConfig MakeDefaultCompiler(char * name, bool readOnly)
{
   CompilerConfig defaultCompiler
   {
      name,
      readOnly,
      gcc,
      GetRuntimePlatform(),
      1,
      makeDefaultCommand,
      ecpDefaultCommand,
      eccDefaultCommand,
      ecsDefaultCommand,
      earDefaultCommand,
      cppDefaultCommand,
      ccDefaultCommand,
      cxxDefaultCommand
   };
   incref defaultCompiler;
   return defaultCompiler;
}

class IDESettingsContainer : GlobalSettings
{
#ifdef SETTINGS_TEST
   settingsName = "ecereIDESettingsTest";
#else
   settingsName = "ecereIDE";
#endif

   virtual void OnLoad(GlobalSettingsData data);

   char moduleLocation[MAX_LOCATION];

private:
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
         PathCat(configFilePath, "ecereIDE.ini");

         strcpy(defaultConfigFilePath, path);
         PathCat(defaultConfigFilePath, "App");
         PathCat(defaultConfigFilePath, "DefaultData");
         PathCat(defaultConfigFilePath, "ecereIDE.ini");
         
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
      /*if(MessageBox { type = YesNo, master = this, 
            text = "Global Settings Modified Externally", 
            contents = "The global settings were modified by another instance.\n"
            "Would you like to reload them?" }.Modal() == Yes)*/
      {
         Load();
      }
   }

   void Load()
   {
      SettingsIOResult result = GlobalSettings::Load();
      IDESettings data = (IDESettings)this.data;
      CompilerConfig defaultCompiler = null;
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
            loaded = oldSettings.Load();
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
            data.useFreeCaret = true;
            data.showLineNumbers = true;
            data.caretFollowsScrolling = true;
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
      if(data.compilerConfigs)
      {
         for(c : data.compilerConfigs)
         {
            CompilerConfig compiler = c;
            incref compiler;
         }
      }
      if(portable && moduleLocation[0] && FileExists(moduleLocation).isDirectory)
         data.ManagePortablePaths(moduleLocation, true);
      data.ForcePathSeparatorStyle(true);
      OnLoad(data);
   }

   void Save()
   {
      IDESettings data = (IDESettings)this.data;
      Platform runtimePlatform = GetRuntimePlatform();
      if(portable && moduleLocation[0] && FileExists(moduleLocation).isDirectory)
         data.ManagePortablePaths(moduleLocation, false);
      data.ForcePathSeparatorStyle(true);
      if(!GlobalSettings::Save())
         PrintLn("Error saving IDE settings");
      if(portable && moduleLocation[0] && FileExists(moduleLocation).isDirectory)
         data.ManagePortablePaths(moduleLocation, true);
      CloseAndMonitor();
   }
}

class IDESettings : GlobalSettingsData
{
public:
   List<CompilerConfig> compilerConfigs { };
   Array<String> recentFiles { };
   Array<String> recentProjects { };
   property char * docDir
   {
      set { delete docDir; if(value && value[0]) docDir = CopyString(value); }
      get { return docDir ? docDir : ""; }
      isset { return docDir && docDir[0]; }
   }
   property char * ideFileDialogLocation
   {
      set { delete ideFileDialogLocation; if(value && value[0]) ideFileDialogLocation = CopyString(value); }
      get { return ideFileDialogLocation ? ideFileDialogLocation : ""; }
      isset { return ideFileDialogLocation && ideFileDialogLocation[0]; }
   }
   property char * ideProjectFileDialogLocation
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

   property char * projectDefaultTargetDir
   {
      set { delete projectDefaultTargetDir; if(value && value[0]) projectDefaultTargetDir = CopyValidateMakefilePath(value); }
      get { return projectDefaultTargetDir ? projectDefaultTargetDir : ""; }
      isset { return projectDefaultTargetDir && projectDefaultTargetDir[0]; }
   }
   property char * projectDefaultIntermediateObjDir
   {
      set { delete projectDefaultIntermediateObjDir; if(value && value[0]) projectDefaultIntermediateObjDir = CopyValidateMakefilePath(value); }
      get { return projectDefaultIntermediateObjDir ? projectDefaultIntermediateObjDir : ""; }
      isset { return projectDefaultIntermediateObjDir && projectDefaultIntermediateObjDir[0]; }
   }

   property char * compilerConfigsDir
   {
      set { delete compilerConfigsDir; if(value && value[0]) compilerConfigsDir = CopyString(value); }
      get { return compilerConfigsDir ? compilerConfigsDir : ""; }
      isset { return compilerConfigsDir && compilerConfigsDir[0]; }
   }

   property char * defaultCompiler
   {
      set { delete defaultCompiler; if(value && value[0]) defaultCompiler = CopyString(value); }
      get { return defaultCompiler && defaultCompiler[0] ? defaultCompiler : defaultCompilerName; }
      isset { return defaultCompiler && defaultCompiler[0]; }
   }

private:
   char * docDir;
   char * ideFileDialogLocation;
   char * ideProjectFileDialogLocation;
   char * projectDefaultTargetDir;
   char * projectDefaultIntermediateObjDir;
   char * compilerConfigsDir;
   char * defaultCompiler;

   CompilerConfig GetCompilerConfig(String compilerName)
   {
      char * name = compilerName && compilerName[0] ? compilerName : defaultCompilerName;
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

   char * UpdatePortablePath(char * path, char * location, bool makeAbsolute)
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

   void AddRecentFile(char * fileName)
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

   void AddRecentProject(char * projectName)
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
static Array<String> compilerTypeLongNames
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

   property char *
   {
      get { return OnGetString(null, null, null); }
      set
      {  
         if(value)
         {
            Platform c;
            for(c = firstCompilerType; c <= lastCompilerType; c++)
               if(!strcmpi(value, compilerTypeNames[c]))
                  return c;
         }
         return gcc;
      }
   };

   property char * longName { get { return OnGetString(null, (void*)1, null); } };
   property char * versionString { get { return OnGetString(null, (void*)2, null); } };
   property char * yearString { get { return OnGetString(null, (void*)3, null); } };
   property char * projectFileExtension { get { return OnGetString(null, (void*)4, null); } };
   property char * solutionFileVersionString { get { return OnGetString(null, (void*)5, null); } };

   char * OnGetString(char * tempString, void * fieldData, bool * needClass)
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
   supportsBitDepth = true;
public:
   property char * name
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
   property char * makeCommand
   {
      set { delete makeCommand; if(value && value[0]) makeCommand = CopyString(value); }
      get { return makeCommand; }
      isset { return makeCommand && makeCommand[0]; }
   }
   property char * ecpCommand
   {
      set { delete ecpCommand; if(value && value[0]) ecpCommand = CopyString(value); }
      get { return ecpCommand; }
      isset { return ecpCommand && ecpCommand[0]; }
   }
   property char * eccCommand
   {
      set { delete eccCommand; if(value && value[0]) eccCommand = CopyString(value); }
      get { return eccCommand; }
      isset { return eccCommand && eccCommand[0]; }
   }
   property char * ecsCommand
   {
      set { delete ecsCommand; if(value && value[0]) ecsCommand = CopyString(value); }
      get { return ecsCommand; }
      isset { return ecsCommand && ecsCommand[0]; }
   }
   property char * earCommand
   {
      set { delete earCommand; if(value && value[0]) earCommand = CopyString(value); }
      get { return earCommand; }
      isset { return earCommand && earCommand[0]; }
   }
   property char * cppCommand
   {
      set { delete cppCommand; if(value && value[0]) cppCommand = CopyString(value); }
      get { return cppCommand; }
      isset { return cppCommand && cppCommand[0]; }
   }
   property char * ccCommand
   {
      set { delete ccCommand; if(value && value[0]) ccCommand = CopyString(value); }
      get { return ccCommand; }
      isset { return ccCommand && ccCommand[0]; }
   }
   property char * cxxCommand
   {
      set { delete cxxCommand; if(value && value[0]) cxxCommand = CopyString(value); }
      get { return cxxCommand; }
      isset { return cxxCommand && cxxCommand[0]; }
   }
   property char * execPrefixCommand
   {
      set { delete execPrefixCommand; if(value && value[0]) execPrefixCommand = CopyString(value); }
      get { return execPrefixCommand; }
      isset { return execPrefixCommand && execPrefixCommand[0]; }
   }
   bool ccacheEnabled;
   bool distccEnabled;
   property bool supportsBitDepth
   {
      set { supportsBitDepth = value; }
      get { return supportsBitDepth; }
      isset { return !supportsBitDepth; }
   }

   property char * distccHosts
   {
      set { delete distccHosts; if(value && value[0]) distccHosts = CopyString(value); }
      get { return distccHosts; }
      isset { return distccHosts && distccHosts[0]; }
   }
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
private:
   Array<String> includeDirs { };
   Array<String> libraryDirs { };
   Array<String> executableDirs { };
   // TODO: Can JSON parse and serialize maps?
   //EnvironmentVariables { };
   Array<NamedString> environmentVars { };
   Array<String> prepDirectives { };
   Array<String> excludeLibs { };
   char * name;
   char * makeCommand;
   char * ecpCommand;
   char * eccCommand;
   char * ecsCommand;
   char * earCommand;
   char * cppCommand;
   char * ccCommand;
   char * cxxCommand;
   char * execPrefixCommand;
   char * distccHosts;
   bool supportsBitDepth;
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
      delete makeCommand;
      delete execPrefixCommand;
      delete distccHosts;
      if(environmentVars) environmentVars.Free();
      if(includeDirs) { includeDirs.Free(); }
      if(libraryDirs) { libraryDirs.Free(); }
      if(executableDirs) { executableDirs.Free(); }
      if(prepDirectives) { prepDirectives.Free(); }
      if(excludeLibs) { excludeLibs.Free(); }
   }
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
         execPrefixCommand,
         ccacheEnabled,
         distccEnabled,
         supportsBitDepth,
         distccHosts
      };
      for(s : includeDirs) copy.includeDirs.Add(CopyString(s));
      for(s : libraryDirs) copy.libraryDirs.Add(CopyString(s));
      for(s : executableDirs) copy.executableDirs.Add(CopyString(s));
      for(ns : environmentVars) copy.environmentVars.Add(NamedString { name = ns.name, string = ns.string });
      for(s : prepDirectives) copy.prepDirectives.Add(CopyString(s));
      for(s : excludeLibs) copy.excludeLibs.Add(CopyString(s));

      incref copy;
      return copy;
   }
}
