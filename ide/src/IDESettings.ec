#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

enum KeywordType { regular, preprocessor };

class SyntaxColorScheme
{
public:
   Color commentColor;
   Color charLiteralColor;
   Color stringLiteralColor;
   Color preprocessorColor;
   Color numberColor;
   Color typeColor;
   Color defColor;
   Color fnColor;

   commentColor = dimGray;
   charLiteralColor = crimson;
   stringLiteralColor = crimson;
   preprocessorColor = green;
   numberColor = teal;
   property::keywordColors = [ blue, blue ];
   typeColor = 0x15CE4C;
   defColor = 0xFFCE7A;
   fnColor = 0x9CB7FF;

   private Array<Color> keywordColors { };   // For each KeywordType

   public property Container<Color> keywordColors
   {
      set
      {
         keywordColors.Copy((void *)value);
         // JSON/ECON Parser expects we'll hang on to this... Better solution with improved ref counting model?
         if(value && value._class != class(BuiltInContainer) && !value._refCount)
            delete value;
      }
      get { return keywordColors; }
   }
};

// *** Color Schemes ***
class IDEColorScheme
{
   String name;
   SyntaxColorScheme syntaxColors;
public:

   property const String name
   {
      set { delete name; name = CopyString(value); }
      get { return name; }
   }

   Color selectionColor;
   Color selectionText;
   Color viewsBackground;
   Color viewsText;
   Color outputBackground;
   Color outputText;
   Color projectViewBackground;
   Color projectViewText;
   Color codeEditorBG;
   Color codeEditorFG;
   Color marginColor;
   Color selectedMarginColor;
   Color lineNumbersColor;
   Color sheetSelectionColor;
   Color sheetSelectionText;

   property SyntaxColorScheme syntaxColors
   {
      set { delete syntaxColors; syntaxColors = value; if(value) incref value; }
      get { return syntaxColors; }
   }

   ~IDEColorScheme()
   {
      delete syntaxColors;
      delete name;
   }
}

IDEColorScheme colorScheme;

// Default Color Schemes
IDEColorScheme darkColorScheme
{
   name = "Classic Dark";
   selectionColor = lightYellow;
   selectionText = Color { 30, 40, 50 };
   viewsBackground = Color { 30, 40, 50 };
   viewsText = lightGray;
   outputBackground = black;
   outputText = lime;
   sheetSelectionColor = Color { 170, 220, 255 };
   sheetSelectionText = black;
   projectViewBackground = Color { 30, 40, 50 };
   projectViewText = lightGray;
   codeEditorBG = black;
   codeEditorFG = ivory;
   marginColor = Color {24, 24, 24};
   selectedMarginColor = Color {64, 64, 64};
   lineNumbersColor = Color {160, 160, 160};
   syntaxColors =
   {
      keywordColors = [ skyBlue, skyBlue ];
      commentColor = Color { 125, 125, 125 };
      charLiteralColor = Color { 245, 50, 245 };
      stringLiteralColor = Color { 245, 50, 245 };
      preprocessorColor = { 120, 220, 140 };
      numberColor = Color {   0, 192, 192 };
      typeColor = 0x15CE4C;
      defColor = 0xFFCE7A;
      fnColor = 0x9CB7FF;
   };
};

IDEColorScheme lightColorScheme
{
   name = "Classic Light";
   selectionColor = Color { 10, 36, 106 };
   selectionText = white;
   viewsBackground = white;
   viewsText = black;
   outputBackground = white;
   outputText = black;
   sheetSelectionColor = Color { 170, 220, 255 };
   sheetSelectionText = black;
   projectViewBackground = white;
   projectViewText = black;
   codeEditorBG = white;
   codeEditorFG = black;
   marginColor = Color {230, 230, 230};
   selectedMarginColor = Color {200, 200, 200};
   lineNumbersColor = Color {60, 60, 60};
   syntaxColors =
   {
      keywordColors = [ blue, blue ];
      commentColor = dimGray;
      charLiteralColor = crimson;
      stringLiteralColor = crimson;
      preprocessorColor = green;
      numberColor = teal;
      typeColor = 0x15CE4C;
      defColor = 0xFFCE7A;
      fnColor = 0x9CB7FF;
   };
};

IDEColorScheme greenColorScheme
{
   name = "Green",
   selectionColor = 0x00FFFFE0,
   selectionText = 0x001E2832,
   viewsBackground = 0x001E2832,
   viewsText = 0x00D3D3D3,
   outputBackground = 0x00000000,
   outputText = 0x0000FF00,
   projectViewBackground = 0x001E2832,
   projectViewText = 0x00D3D3D3,
   codeEditorBG = 0x00000000,
   codeEditorFG = 0x00FFFFF0,
   marginColor = 0x001100,
   selectedMarginColor = 0x002200,
   lineNumbersColor = 0x00FF00,
   sheetSelectionColor = 0x00AADCFF,
   sheetSelectionText = 0x00000000,
   syntaxColors = {
      commentColor = 0x008c00,
      charLiteralColor = 0x89de00,
      stringLiteralColor = 0x89de00,
      preprocessorColor = 0x0078DC8C,
      numberColor = { 8, 237, 141 },
      typeColor = 0x15CE4C,
      defColor = 0xFFCE7A;
      fnColor = 0x9CB7FF;
      keywordColors = [
         0x00e09d,
         0x00e09d
      ]
   }
};

IDEColorScheme grayColorScheme
{
   name = "Gray & Orange",
   selectionColor = 0x00FFFFE0,
   selectionText = 0x001E2832,
   viewsBackground = 0x001E2832,
   viewsText = 0x00D3D3D3,
   outputBackground = 0x00000000,
   outputText = 0x0000FF00,
   projectViewBackground = 0x001E2832,
   projectViewText = 0x00D3D3D3,
   codeEditorBG = 0x00202020,
   codeEditorFG = 0x00E2E2E5,
   marginColor = 0x00303030,
   selectedMarginColor = 0x00404040,
   lineNumbersColor = 0x00939395,
   sheetSelectionColor = 0x00AADCFF,
   sheetSelectionText = 0x00000000,
   syntaxColors = {
      commentColor = 0x005F5F5F,
      charLiteralColor = 0x0089DE00,
      stringLiteralColor = 0x00707070,
      preprocessorColor = 0x00FAF4C6,
      numberColor = 0x00FF9800,
      typeColor = 0x15CE4C;
      defColor = 0xFFCE7A;
      fnColor = 0x9CB7FF;
      keywordColors = [
         0x00FF9800,
         0x00FF9800
      ]
   }
};

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

#ifdef __WIN32__
#define WIN32_LEAN_AND_MEAN
#define Sleep _Sleep
#include <windows.h>
#undef MoveFileEx
#undef Sleep
#undef MessageBox
#undef GetObject
#endif

define MaxRecent = 128;
define NumKeyRecent = 9;
define MaxMoreRecent = 16;

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


enum GlobalSettingsChange { none, editorSettings, projectOptions, compilerSettings, compilers };

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

//#define SETTINGS_TEST
#ifdef SETTINGS_TEST
define settingsDir = ".ecereIDE-SettingsTest";
define ideSettingsName = "ecereIDE-SettingsTest";
#else
#ifdef __WIN32__
define settingsDir = "EcereIDE";
define ideSettingsName = "EcereIDE";
#else
define settingsDir = ".ecereIDE";
define ideSettingsName = "ecereIDE";
#endif
#endif

class IDEConfigHolder
{
   CompilerConfigs compilers { };
   RecentFiles recentFiles { };
   RecentWorkspaces recentWorkspaces { };

   property CompilerConfigs compilers
   {
      set { compilers.Free(); delete compilers; compilers = value; }
      get { return compilers; }
   }
   property RecentFiles recentFiles
   {
      set { recentFiles.Free(); delete recentFiles; recentFiles = value; }
      get { return recentFiles; }
   }
   property RecentWorkspaces recentProjects
   {
      set { recentWorkspaces.Free(); delete recentWorkspaces; recentWorkspaces = value; }
      get { return recentWorkspaces; }
   }

   ~IDEConfigHolder()
   {
      compilers.Free();
      recentFiles.Free();
      recentWorkspaces.Free();
   }

   void forcePathSeparatorStyle(bool unixStyle)
   {
      char from, to;
      if(unixStyle)
         from = '\\', to = '/';
      else
         from = '/', to = '\\';
      recentFiles.changeChar(from, to);
      recentWorkspaces.changeChar(from, to);
   }
}

class IDESettingsContainer : GlobalSettings
{
   virtual void onLoadCompilerConfigs();
   virtual void onLoadRecentFiles();
   virtual void onLoadRecentProjects();
   virtual void onLoad();

   CompilerConfigs compilerConfigs;
   RecentFiles recentFiles;
   RecentWorkspaces recentProjects;

   property bool useNewConfigurationFiles
   {
      set
      {
         if(value)
         {
            driver = "ECON";
            settingsName = "config";
            settingsExtension = "econ";
            settingsDirectory = settingsDir;
         }
         else
         {
            driver = "JSON";
            settingsName = ideSettingsName;
            settingsExtension = null;
            settingsDirectory = null;
         }
      }
   }

   char moduleLocation[MAX_LOCATION];

   FileMonitor recentFilesMonitor
   {
      this, fileChange = { modified = true };

      bool OnFileNotify(FileChange action, const char * param)
      {
         File f;
         recentFilesMonitor.StopMonitoring();
         f = FileOpen(recentFilesMonitor.fileName, read);
         if(f)
         {
            int c;
            bool locked;
            for(c = 0; c < 10 && !(locked = f.Lock(shared, 0, 0, false)); c++) ecere::sys::Sleep(0.01);
            recentFiles.read(this);
            f.Unlock(0,0,true);
            delete f;
         }
         return true;
      }
   };

   FileMonitor recentProjectsMonitor
   {
      this, fileChange = { modified = true };

      bool OnFileNotify(FileChange action, const char * param)
      {
         File f;
         recentProjectsMonitor.StopMonitoring();
         f = FileOpen(recentProjectsMonitor.fileName, read);
         if(f)
         {
            int c;
            bool locked;
            for(c = 0; c < 10 && !(locked = f.Lock(shared, 0, 0, false)); c++) ecere::sys::Sleep(0.01);
            if(!recentProjects) recentProjects = { };
            recentProjects.read(this);
            f.Unlock(0,0,true);
            delete f;
         }
         return true;
      }
   };

   static void getConfigFilePath(char * path, Class _class, char * dir, const char * configName)
   {
      if(dir) *dir = 0;
      strcpy(path, settingsFilePath);
      StripLastDirectory(path, path);
      if(oldConfig)
         PathCatSlash(path, settingsDir);
      if(_class == class(CompilerConfig))
      {
         PathCatSlash(path, "compilerConfigs");
         if(dir)
            strcpy(dir, path);
         if(configName)
         {
            PathCatSlash(path, configName);
            strcat(path, ".econ");
         }
      }
      else if(_class == class(RecentFilesData))
         PathCatSlash(path, "recentFiles.econ");
      else if(_class == class(RecentWorkspacesData))
         PathCatSlash(path, "recentWorkspaces.econ");
   }

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
      if((start = strstr(path, "\\App\\EcereSDK\\bin\\ecere-ide.exe")))
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
         //if((double)settingsFileSize - (double)newSettingsFileSize < 2048)
            Load();
            onLoad();
         /*else
         {
            GuiApplication app = ((GuiApplication)__thisModule.application);
            Window w;
            for(w = app.desktop.firstChild; w && (!w.created || !w.visible); w = w.next);

            CloseAndMonitor();

            MessageBox { master = w, type = ok, isModal = true,
                  creationActivation = flash,
                  text = "Global Settings Modified Externally",
                  contents = "The global settings were modified by another process and a drastic shrinking of the settings file was detected.\n"
                  "The new settings will not be loaded to prevent loss of your ide settings.\n"
                  "Please check your settings file and make sure to save this IDE's global settings if your settings file has been compromised."
                  }.Create();
         }*/
      }
   }

   SettingsIOResult Load()
   {
      IDESettings data;
      SettingsIOResult result;
      useNewConfigurationFiles = true;
      result = GlobalSettings::Load();
      data = (IDESettings)this.data;
      oldConfig = false;
      if(result == fileNotFound || (settingsFilePath && isGlobalPath))
      {
         bool retryNewConfig = settingsFilePath && isGlobalPath;

         if(retryNewConfig)
         {
            // Need to load the data outside of main config file first
            data.compilerConfigs.read(this);
            data.recentFiles.read(this);
            data.recentProjects.read(this);
         }
         oldConfig = true; // WARNING: This is being used with two meanings: Old format and loaded from system-wide settings
         useNewConfigurationFiles = false;
         if(retryNewConfig)
         {
            settingsFilePath = null;
            CloseAndMonitor();
         }

         GlobalSettings::Load();

         if(result == fileNotFound && retryNewConfig)
         {
            oldConfig = false;
            useNewConfigurationFiles = true;
            result = GlobalSettings::Load();
         }
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

               for(s : oldSettings.recentFiles) data.recentFiles.Add(s);
               for(s : oldSettings.recentProjects) data.recentProjects.Add(s);

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

      CloseAndMonitor();
      FileGetSize(settingsFilePath, &settingsFileSize);
      if(portable && moduleLocation[0] && FileExists(moduleLocation).isDirectory)
         data.ManagePortablePaths(moduleLocation, true);
      data.ForcePathSeparatorStyle(true);

      if(!data.colorSchemes || !data.colorSchemes.count)
      {
         if(!data.colorSchemes) data.colorSchemes = { };

         data.colorSchemes.Add(darkColorScheme);   incref darkColorScheme;
         data.colorSchemes.Add(lightColorScheme);  incref lightColorScheme;
         data.colorSchemes.Add(greenColorScheme);  incref greenColorScheme;
         data.colorSchemes.Add(grayColorScheme);   incref grayColorScheme;
      }
      colorScheme = null;
      if(data.activeColorScheme)
      {
         for(cs : data.colorSchemes; cs.name && !strcmp(cs.name, data.activeColorScheme))
         {
            colorScheme = cs;
            break;
         }
      }
      if(!colorScheme)
      {
         colorScheme = data.colorSchemes[0];
         data.activeColorScheme = colorScheme.name;
      }

      // Import from previous ecereIDE settings
      if(oldConfig)
      {
         // Save first so that settingsFilePath get set up
         Save();

         data.compilerConfigs.ensureDefaults();
         data.compilerConfigs.write(this, null);
         data.compilerConfigs.Free();

         data.recentFiles.write(this);
         data.recentFiles.Free();

         data.recentProjects.write(this);
         data.recentProjects.Free();
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

      return result;
   }
}

static Map<String, String> getCompilerConfigFilePathsByName(const char * path)
{
   Map<String, String> map { };
   FileListing fl { path, extensions = "econ" };
   while(fl.Find())
   {
      if(fl.stats.attribs.isFile)
      {
         char name[MAX_FILENAME];
         char * path = CopyString(fl.path);
         MakeSlashPath(path);
         GetLastDirectory(path, name);
         StripExtension(name);
         map[name] = path;
      }
   }
   return map;
}

static Map<String, CompilerConfig> getCompilerConfigsByName(const char * path)
{
   Map<String, CompilerConfig> map { };
   FileListing fl { path, extensions = "econ" };
   while(fl.Find())
   {
      if(fl.stats.attribs.isFile)
      {
         char name[MAX_FILENAME];
         char * path = CopyString(fl.path);
         MakeSlashPath(path);
         GetLastDirectory(path, name);
         StripExtension(name);
         {
            CompilerConfig ccfg = CompilerConfig::read(path);
            if(ccfg)
               map[name] = ccfg;
         }
         delete path;
      }
   }
   return map;
}

static SettingsIOResult writeConfigFile(const char * path, Class dataType, void * data)
{
   SettingsIOResult result = error;
   SafeFile sf = SafeFile::open(path, write);
   if(sf)
   {
      WriteECONObject(sf.file, dataType, data, 0);
      sf.sync();
      delete sf;
      result = success;
   }
   else
      PrintLn($"error: could not safely open file for writing configuration: ", path);
   return result;
}

static SettingsIOResult readConfigFile(const char * path, Class dataType, void ** data)
{
   SettingsIOResult result = error;
   SafeFile sf;
   if(!FileExists(path))
      result = fileNotFound;
   else if((sf = SafeFile::open(path, read)))
   {
      JSONResult jsonResult;
      {
         ECONParser parser { f = sf.file };
         sf.file.Seek(0, start);
         jsonResult = parser.GetObject(dataType, data);
         if(jsonResult != success)
            delete *data;
         delete parser;
      }
      if(jsonResult == success)
         result = success;
      else
      {
         result = fileNotCompatibleWithDriver;
         PrintLn($"error: could not parse configuration file: ", path);
      }
      delete sf;
   }
   return result;
}

class SafeFile
{
   File file;
   FileOpenMode mode;
   char path[MAX_LOCATION];
   char tmp[MAX_LOCATION];

   SafeFile ::open(const char * path, FileOpenMode mode)
   {
      SafeFile result = null;
      if(mode == write || mode == read)
      {
         SafeFile sf { mode = mode };
         int c;
         bool locked = false;
         FileLock lockType = mode == write ? exclusive : shared;

         strcpy(sf.path, path);
         strcpy(sf.tmp, path);
         strcat(sf.tmp, ".tmp");
         if(mode == write && FileExists(sf.tmp).isFile)
            DeleteFile(sf.tmp);

         if(mode == write)
         {
            sf.file = FileOpen(sf.tmp, readWrite);
            if(!sf.file)
            {
               sf.file = FileOpen(sf.tmp, writeRead);
               if(sf.file)
               {
                  delete sf.file;
                  sf.file = FileOpen(sf.tmp, readWrite);
               }
            }
         }
         else
            sf.file = FileOpen(path, mode);
         if(sf.file)
         {
            for(c = 0; c < 10 && !(locked = sf.file.Lock(lockType, 0, 0, false)); c++) Sleep(0.01);
            if(locked)
            {
               sf.file.Truncate(0);
               sf.file.Seek(0, start);
               result = sf;
            }
            else if(mode == write)
               PrintLn($"warning: SafeFile::open: unable to obtain exclusive lock on temporary file for writing: ", sf.tmp);
            else
               PrintLn($"warning: SafeFile::open: unable to obtain shared lock on file for reading: ", path);
         }
         else if(mode == write)
            PrintLn($"warning: SafeFile::open: unable to open temporary file for writing: ", sf.tmp);
         else
            PrintLn($"warning: SafeFile::open: unable to open file for reading: ", path);

         if(!result)
            delete sf;
      }
      else
         PrintLn($"warning: SafeFile::open: does not yet support FileOpenMode::", mode);
      return result;
   }

   void sync()
   {
      if(file && mode == write)
      {
         int c;
         File f = FileOpen(path, readWrite);
         if(!f)
         {
            f = FileOpen(path, writeRead);
            if(f)
            {
               delete f;
               f = FileOpen(path, readWrite);
            }
         }
         if(f)
         {
            bool locked = true;
            for(c = 0; c < 10 && !(locked = f.Lock(exclusive, 0,0, false)); c++) Sleep(0.01);

            if(locked)
            {
               f.Unlock(0,0, false);
               delete f;
               file.Unlock(0,0, false);
               delete file;

               for(c = 0; c < 10; c++)
               {
                  if(MoveFileEx(tmp, path, { true, true }))
                     break;
                  else
                     Sleep(0.01);
               }
            }
            else
            {
               delete f;
               PrintLn($"warning: SafeFile::sync: failed to lock file for ", mode);
            }
         }
      }
   }


   ~SafeFile()
   {
      if(file)
      {
         file.Unlock(0,0, false);
         delete file;
      }
   }
}

class RecentFilesData
{
public:
   RecentFiles recentFiles;

   ~RecentFilesData()
   {
      if(recentFiles) recentFiles.Free();
      delete recentFiles;
   }
}

class RecentWorkspacesData
{
public:
   RecentWorkspaces recentWorkspaces;

   ~RecentWorkspacesData()
   {
      if(recentWorkspaces) recentWorkspaces.Free();
      delete recentWorkspaces;
   }
}

class IDESettings : GlobalSettingsData
{
public:
   property CompilerConfigs compilerConfigs
   {
      set { /*if(settingsContainer.oldConfig)*/ { if(compilerConfigs) compilerConfigs.Free(); delete compilerConfigs; if(value) compilerConfigs = value; } }
      get { return compilerConfigs; }
      isset { return false; }
   }
   property RecentFiles recentFiles
   {
      set { if(recentFiles) recentFiles.Free(); delete recentFiles; if(value) recentFiles = value; }
      get { return recentFiles; }
      isset { return false; }
   }
   property RecentWorkspaces recentProjects
   {
      set { if(recentProjects) recentProjects.Free(); delete recentProjects; if(value) recentProjects = value; }
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

   property const String codeEditorFont
   {
      set
      {
         delete codeEditorFont;
         codeEditorFont = CopyString(value);
      }
      get { return codeEditorFont; }
   }

   float codeEditorFontSize;
   bool showFixedPitchFontsOnly;

   property Array<IDEColorScheme> colorSchemes
   {
      set
      {
         if(colorSchemes && colorSchemes._refCount < 2)
            colorSchemes.Free();
         delete colorSchemes;
         colorSchemes = value;
         if(value)
            incref colorSchemes;
      }
      get { return colorSchemes; }
   }

   property const String activeColorScheme
   {
      set
      {
         delete activeColorScheme;
         activeColorScheme = CopyString(value);
      }
      get { return activeColorScheme; }
   }

private:
   CompilerConfigs compilerConfigs { };
   char * docDir;
   char * ideFileDialogLocation;
   char * ideProjectFileDialogLocation;
   char * projectDefaultTargetDir;
   char * projectDefaultIntermediateObjDir;
   char * compilerConfigsDir;
   char * defaultCompiler;
   String language;
   RecentFiles recentFiles { };
   RecentWorkspaces recentProjects { };

   Array<IDEColorScheme> colorSchemes;

   String codeEditorFont;

   String activeColorScheme;

   showFixedPitchFontsOnly = true;
   codeEditorFontSize = 12;
   codeEditorFont = CopyString("Courier New");

   ~IDESettings()
   {
      compilerConfigs.Free();
      delete compilerConfigs;
      if(recentProjects) { recentFiles.Free(); delete recentFiles; }
      if(recentProjects) { recentProjects.Free(); delete recentProjects; }
      delete docDir;

      delete projectDefaultTargetDir;
      delete projectDefaultIntermediateObjDir;
      delete compilerConfigsDir;
      delete defaultCompiler;
      delete language;

      delete ideFileDialogLocation;
      delete ideProjectFileDialogLocation;
      delete displayDriver;

      delete codeEditorFont;

      colorSchemes.Free();
      delete colorSchemes;
      delete activeColorScheme;
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
      recentFiles.changeChar(from, to);
      recentProjects.changeChar(from, to);
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
}

class RecentFiles : RecentPaths
{
   void read(IDESettingsContainer settingsContainer)
   {
      char path[MAX_LOCATION];
      RecentFilesData d = null;
      Class _class = class(RecentFilesData);
      settingsContainer.getConfigFilePath(path, _class, null, null);
      readConfigFile(path, _class, &d);
      if(d && d.recentFiles && d.recentFiles.count)
      {
         Free();
         Copy((void *)d.recentFiles);
         d.recentFiles.RemoveAll();
         settingsContainer.recentFiles = this; // Merge IDEConfigHolder / IDESettingsContainer?
      }
      delete d;
      settingsContainer.recentFilesMonitor.fileName = path;
      settingsContainer.recentFilesMonitor.StartMonitoring();
      settingsContainer.onLoadRecentFiles();
   }

   void write(IDESettingsContainer settingsContainer)
   {
      char path[MAX_LOCATION];
      RecentFilesData d { };
      Class _class = class(RecentFilesData);
      settingsContainer.getConfigFilePath(path, _class, null, null);
      d.recentFiles = this;
      writeConfigFile(path, _class, d);
      d.recentFiles = null;
      delete d;
   }
}

class RecentWorkspaces : RecentPaths
{
   void read(IDESettingsContainer settingsContainer)
   {
      char path[MAX_LOCATION];
      RecentWorkspacesData d = null;
      Class _class = class(RecentWorkspacesData);
      settingsContainer.getConfigFilePath(path, _class, null, null);
      readConfigFile(path, _class, &d);
      if(d && d.recentWorkspaces && d.recentWorkspaces.count)
      {
         Free();
         Copy((void *)d.recentWorkspaces);
         d.recentWorkspaces.RemoveAll();
         settingsContainer.recentProjects = this; // Merge IDEConfigHolder / IDESettingsContainer?
      }
      delete d;
      settingsContainer.recentProjectsMonitor.fileName = path;
      settingsContainer.recentProjectsMonitor.StartMonitoring();
      settingsContainer.onLoadRecentProjects();
   }

   void write(IDESettingsContainer settingsContainer)
   {
      char path[MAX_LOCATION];
      RecentWorkspacesData d { };
      Class _class = class(RecentWorkspacesData);
      settingsContainer.getConfigFilePath(path, _class, null, null);
      d.recentWorkspaces = this;
      writeConfigFile(path, _class, d);
      d.recentWorkspaces = null;
      delete d;
   }
}

class RecentPaths : Array<String>
{
   IteratorPointer Add(T value)
   {
      int c;
      char * filePath = (char *)value;
      ChangeCh(filePath, '\\', '/');
      for(c = 0; c < count; c++)
      {
         if(this[c] && !fstrcmp(this[c], filePath))
         {
            Delete((void *)&this[c]);
            c--;
         }
      }
      return Array::Add((T)filePath);
   }

   IteratorPointer addRecent(const String value)
   {
      int c;
      char * filePath = CopyString((char *)value);
      IteratorPointer ip;
      ChangeCh(filePath, '\\', '/');
      for(c = 0; c < count; c++)
      {
         if(this[c] && !fstrcmp(this[c], filePath))
         {
            Delete((void *)&this[c]);
            c--;
         }
      }
      while(count >= MaxRecent)
         Delete(GetLast());
      ip = Insert(null, filePath);
      return ip;
   }

   void changeChar(char from, char to)
   {
      if(this && count)
      {
         int c;
         for(c = 0; c < count; c++)
         {
            if(this[c] && this[c][0])
               ChangeCh(this[c], from, to);
         }
      }
   }

   void updateRecentMenu(Window master, bool(recentNotifySelect)(Window this, MenuItem selection, Modifiers mods), Menu recentMenu)
   {
      int c = 0;
      int addedExistCount = 0;
      int addedMissingCount = 0;
      int existMoreCount = 0;
      int missingMoreCount = 0;
      char * itemPath = new char[MAX_LOCATION];
      char * itemName = new char[MAX_LOCATION + 4];
      Menu missingMenu = null;
      Menu addToExist = recentMenu;
      Menu addToMissing = null;
      recentMenu.Clear();
      for(recent : this)
      {
         bool key = false;
         bool exists = false;
         strncpy(itemPath, recent, MAX_LOCATION);
         itemPath[MAX_LOCATION - 1] = '\0';
         MakeSystemPath(itemPath);
         exists = FileExists(itemPath).isFile;
         key = exists && addedExistCount < NumKeyRecent;
         if(key)
            snprintf(itemName, MAX_LOCATION + 4, "%d %s", 1 + addedExistCount, itemPath);
         else
            snprintf(itemName, MAX_LOCATION + 4, "%s", itemPath);
         itemName[MAX_LOCATION + 4 - 1] = '\0';
         {
            MenuItem item { copyText = true, text = itemName, id = c, NotifySelect = recentNotifySelect };
            if(key)
               item.hotKey = (Key)k1 + addedExistCount;
            if(exists)
            {
               if(addedExistCount == NumKeyRecent)
                  addToExist.AddDynamic(MenuDivider { }, master, true);
               else if(addedExistCount - NumKeyRecent - MaxMoreRecent >= existMoreCount && this.count - 2 > c)
               {
                  addToExist.AddDynamic(MenuDivider { }, master, true);
                  {
                     Menu moreMenu { addToExist, $"More", m };
                     addToExist = moreMenu;
                  }
                  existMoreCount += MaxMoreRecent;
               }
               addToExist.AddDynamic(item, master, true);
               addedExistCount++;
            }
            else
            {
               if(!missingMenu)
                  addToMissing = missingMenu = { null, $"Missing", n };
               if(addedMissingCount - MaxMoreRecent >= missingMoreCount)
               {
                  addToMissing.AddDynamic(MenuDivider { }, master, true);
                  {
                     Menu moreMenu { addToMissing, $"More", m };
                     addToMissing = moreMenu;
                  }
                  missingMoreCount += MaxMoreRecent;
               }
               addToMissing.AddDynamic(item, master, true);
               addedMissingCount++;
            }
         }
         c++;
      }
      if(missingMenu && addedExistCount)
         recentMenu.AddDynamic(MenuDivider { }, master, true);
      missingMenu.parent = recentMenu;
      delete itemPath;
      delete itemName;
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

   property const char * longName { get { return getString(null, 1); } };
   property const char * versionString { get { return getString(null, 2); } };
   property const char * yearString { get { return getString(null, 3); } };
   property const char * projectFileExtension { get { return getString(null, 4); } };
   property const char * solutionFileVersionString { get { return getString(null, 5); } };

   private static const char * getString(char * tempString, int stringType)
   {
      if(this >= firstCompilerType && this <= lastCompilerType)
      {
         if(tempString)
            strcpy(tempString, compilerTypeNames[this]);
         if(stringType == 0)
            return compilerTypeNames[this];
         else if(stringType == 1)
            return compilerTypeLongNames[this];
         else if(stringType == 2)
            return compilerTypeVersionString[this];
         else if(stringType == 3)
            return compilerTypeYearString[this];
         else if(stringType == 4)
            return compilerTypeProjectFileExtension[this];
         else if(stringType == 5)
            return compilerTypeSolutionFileVersionString[this];
      }
      return null;
   }

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      return getString(tempString, 0);
   }
};

class CompilerConfig
{
   class_no_expansion;

   numJobs = 1;
public:
   property const char * name
   {
      set { delete name; if(value) name = CopyString(value); }
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
   property const char * staticLibFileExt
   {
      set { delete staticLibFileExt; if(value && value[0]) staticLibFileExt = CopyString(value); }
      get { return staticLibFileExt; }
      isset { return staticLibFileExt && staticLibFileExt[0]; }
   }
   property const char * sharedLibFileExt
   {
      set { delete sharedLibFileExt; if(value && value[0]) sharedLibFileExt = CopyString(value); }
      get { return sharedLibFileExt; }
      isset { return sharedLibFileExt && sharedLibFileExt[0]; }
   }
   property const char * executableFileExt
   {
      set { delete executableFileExt; if(value && value[0]) executableFileExt = CopyString(value); }
      get { return executableFileExt; }
      isset { return executableFileExt && executableFileExt[0]; }
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
   bool noStripTarget;
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
   property Array<String> cxxFlags
   {
      set
      {
         cxxFlags.Free();
         if(value)
         {
            delete cxxFlags;
            cxxFlags = value;
         }
      }
      get { return cxxFlags; }
      isset { return cxxFlags.count != 0; }
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
   property const char * outputFileExt
   {
      set { delete executableFileExt; if(value && value[0]) executableFileExt = CopyString(value); }
      get { return executableFileExt; }
      isset { return false; }
   }
   // utility
   property bool hasDocumentOutput
   {
      get
      {
         bool result = executableFileExt && executableFileExt[0] &&
               (!strcmpi(executableFileExt, "htm") || !strcmpi(executableFileExt, "html"));
         return result;
      }
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
   Array<String> cxxFlags { };
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
   char * staticLibFileExt;
   char * sharedLibFileExt;
   char * executableFileExt;
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
      delete staticLibFileExt;
      delete sharedLibFileExt;
      delete executableFileExt;
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
      if(cxxFlags) { cxxFlags.Free(); }
      if(eCcompilerFlags) { eCcompilerFlags.Free(); }
      if(linkerFlags) { linkerFlags.Free(); }
   }

   int OnCompare(CompilerConfig b)
   {
      int result;
      if(
         !(result = type.OnCompare(b.type)) &&
         !(result = targetPlatform.OnCompare(b.targetPlatform)) &&
         !(result = numJobs.OnCompare(b.numJobs)) &&
         !(result = ccacheEnabled.OnCompare(b.ccacheEnabled)) &&
         !(result = distccEnabled.OnCompare(b.distccEnabled)) &&
         !(result = resourcesDotEar.OnCompare(b.resourcesDotEar)) &&
         !(result = noStripTarget.OnCompare(b.noStripTarget))
         );

      if(!result &&
         !(result = name.OnCompare(b.name)) &&
         !(result = ecpCommand.OnCompare(b.ecpCommand)) &&
         !(result = eccCommand.OnCompare(b.eccCommand)) &&
         !(result = ecsCommand.OnCompare(b.ecsCommand)) &&
         !(result = earCommand.OnCompare(b.earCommand)) &&
         !(result = cppCommand.OnCompare(b.cppCommand)) &&
         !(result = ccCommand.OnCompare(b.ccCommand)) &&
         !(result = cxxCommand.OnCompare(b.cxxCommand)) &&
         !(result = ldCommand.OnCompare(b.ldCommand)) &&
         !(result = arCommand.OnCompare(b.arCommand)) &&
         !(result = objectFileExt.OnCompare(b.objectFileExt)) &&
         !(result = outputFileExt.OnCompare(b.outputFileExt)) &&
         !(result = makeCommand.OnCompare(b.makeCommand)) &&
         !(result = executableLauncher.OnCompare(b.executableLauncher)) &&
         !(result = distccHosts.OnCompare(b.distccHosts)) &&
         !(result = gnuToolchainPrefix.OnCompare(b.gnuToolchainPrefix)) &&
         !(result = sysroot.OnCompare(b.sysroot)));

      if(!result &&
         !(result = includeDirs.OnCompare(b.includeDirs)) &&
         !(result = libraryDirs.OnCompare(b.libraryDirs)) &&
         !(result = executableDirs.OnCompare(b.executableDirs)) &&
         !(result = environmentVars.OnCompare(b.environmentVars)) &&
         !(result = prepDirectives.OnCompare(b.prepDirectives)) &&
         !(result = excludeLibs.OnCompare(b.excludeLibs)) &&
         !(result = cxxFlags.OnCompare(b.cxxFlags)) &&
         !(result = eCcompilerFlags.OnCompare(b.eCcompilerFlags)) &&
         !(result = compilerFlags.OnCompare(b.compilerFlags)) &&
         !(result = linkerFlags.OnCompare(b.linkerFlags)));
      return result;
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
         staticLibFileExt,
         sharedLibFileExt,
         executableFileExt,
         executableLauncher,
         ccacheEnabled,
         distccEnabled,
         false,
         distccHosts,
         gnuToolchainPrefix,
         sysroot,
         resourcesDotEar,
         noStripTarget
      };
      for(s : includeDirs) copy.includeDirs.Add(CopyString(s));
      for(s : libraryDirs) copy.libraryDirs.Add(CopyString(s));
      for(s : executableDirs) copy.executableDirs.Add(CopyString(s));
      for(ns : environmentVars) copy.environmentVars.Add(NamedString { name = ns.name, string = ns.string });
      for(s : prepDirectives) copy.prepDirectives.Add(CopyString(s));
      for(s : excludeLibs) copy.excludeLibs.Add(CopyString(s));
      for(s : compilerFlags) copy.compilerFlags.Add(CopyString(s));
      for(s : cxxFlags) copy.cxxFlags.Add(CopyString(s));
      for(s : eCcompilerFlags) copy.eCcompilerFlags.Add(CopyString(s));
      for(s : linkerFlags) copy.linkerFlags.Add(CopyString(s));

      incref copy;
      return copy;
   }

   CompilerConfig ::read(const char * path)
   {
      CompilerConfig d = null;
      readConfigFile(path, class(CompilerConfig), &d);
      return d;
   }

   void write(IDESettingsContainer settingsContainer)
   {
      char dir[MAX_LOCATION];
      char path[MAX_LOCATION];
      const char * settingsFilePath = settingsContainer.settingsFilePath;
      settingsContainer.getConfigFilePath(path, _class, dir, name);
      if(FileExists(settingsFilePath) && !FileExists(dir))
      {
         MakeDir(dir);
         if(!FileExists(dir))
            PrintLn($"Error creating compiler configs directory at ", dir, " location.");
      }
      writeConfigFile(path, _class, this);
   }
}

class CompilerConfigs : List<CompilerConfig>
{
   CompilerConfig GetCompilerConfig(const String compilerName)
   {
      const char * name = compilerName && compilerName[0] ? compilerName : defaultCompilerName;
      CompilerConfig compilerConfig = null;
      for(compiler : this)
      {
         if(!strcmp(compiler.name, name))
         {
            compilerConfig = compiler;
            break;
         }
      }
      if(!compilerConfig && count)
         compilerConfig = this[0];
      if(compilerConfig)
      {
         incref compilerConfig;
         if(compilerConfig._refCount == 1)
            incref compilerConfig;
      }
      return compilerConfig;
   }

   void ensureDefaults()
   {
      // Ensure we have a default compiler
      CompilerConfig defaultCompiler = GetCompilerConfig(defaultCompilerName);
      if(!defaultCompiler)
      {
         defaultCompiler = MakeDefaultCompiler(defaultCompilerName, true);
         Insert(null, defaultCompiler);
         defaultCompiler = null;
      }
      delete defaultCompiler;

      for(ccfg : this)
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
         /*if(!ccfg.staticLibFileExt || !ccfg.staticLibFileExt[0])
            ccfg.staticLibFileExt = staticLibDefaultFileExt;*/
         /*if(!ccfg.sharedLibFileExt || !ccfg.sharedLibFileExt[0])
            ccfg.sharedLibFileExt = sharedLibDefaultFileExt;*/
         /*if(!ccfg.executableFileExt || !ccfg.executableFileExt[0])
            ccfg.executableFileExt = outputDefaultFileExt;*/
         if(!ccfg._refCount) incref ccfg;
      }
   }

   AVLTree<String> getWriteRequiredList(CompilerConfigs oldConfigs)
   {
      AVLTree<String> list { };
      for(ccfg : this)
      {
         bool found = false;
         for(occfg : oldConfigs; !strcmp(ccfg.name, occfg.name))
         {
            found = true;
            if(ccfg.OnCompare(occfg))
               list.Add(CopyString(ccfg.name));
            break;
         }
         if(!found)
            list.Add(CopyString(ccfg.name));
      }
      return list;
   }

   bool read(IDESettingsContainer settingsContainer)
   {
      if(settingsContainer.settingsFilePath)
      {
         char dir[MAX_LOCATION];
         char path[MAX_LOCATION];
         Class _class = class(CompilerConfig);
         settingsContainer.getConfigFilePath(path, _class, dir, null);
         if(dir[0])
         {
            AVLTree<const String> addedConfigs { };
            Map<String, CompilerConfig> compilerConfigsByName = getCompilerConfigsByName(dir);
            MapIterator<const String, CompilerConfig> it { map = compilerConfigsByName };
            Free();
            settingsContainer.compilerConfigs = this; // Merge IDEConfigHolder / IDESettingsContainer?
            if(it.Index("Default", false))
            {
               CompilerConfig ccfg = it.data;
               Add(ccfg.Copy());
               addedConfigs.Add(ccfg.name);
            }
            for(ccfg : compilerConfigsByName)
            {
               if(!addedConfigs.Find(ccfg.name))
               {
                  Add(ccfg.Copy());
                  addedConfigs.Add(ccfg.name);
               }
            }
            addedConfigs.Free();
            delete addedConfigs;
            ensureDefaults();
            compilerConfigsByName.Free();
            delete compilerConfigsByName;
            settingsContainer.onLoadCompilerConfigs();
            return true;
         }
      }
      return false;
   }

   void write(IDESettingsContainer settingsContainer, AVLTree<String> cfgsToWrite)
   {
      char dir[MAX_LOCATION];
      char path[MAX_LOCATION];
      Map<String, String> paths;
      settingsContainer.getConfigFilePath(path, class(CompilerConfig), dir, null);
      paths = getCompilerConfigFilePathsByName(dir);
      {
         MapIterator<String, String> it { map = paths };
         for(c : this)
         {
            CompilerConfig ccfg = c;
            if(!cfgsToWrite || cfgsToWrite.Find(ccfg.name))
               ccfg.write(settingsContainer);
            if(it.Index(ccfg.name, false))
            {
               delete it.data;
               it.Remove();
            }
         }
      }
      for(p : paths)
      {
         const char * path = p;
         DeleteFile(path);
      }
      paths.Free();
      delete paths;
   }
}

#if !defined(ECERE_DOCUMENTOR) && !defined(ECERE_EPJ2MAKE)
struct LanguageOption
{
   const String name;
   const String bitmap;
   const String code;
   BitmapResource res;

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
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

void setEcereLanguageInWinRegEnvironment(const char * languageCode)
{
#ifdef __WIN32__
   HKEY key = null;
   uint16 wLanguage[256];
   DWORD status;
   wLanguage[0] = 0;

   RegCreateKeyEx(HKEY_CURRENT_USER, "Environment", 0, NULL, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, null, &key, &status);
   if(key)
   {
      UTF8toUTF16Buffer(languageCode, wLanguage, sizeof(wLanguage) / sizeof(uint16));
      RegSetValueExW(key, L"ECERE_LANGUAGE", 0, REG_EXPAND_SZ, (byte *)wLanguage, (uint)(wcslen(wLanguage)+1) * 2);
      RegCloseKey(key);
   }
#endif
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

         setEcereLanguageInWinRegEnvironment(code);

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
