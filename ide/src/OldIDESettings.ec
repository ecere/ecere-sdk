#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

import "IDESettings"

define makeCommandSetting = "Make Command";
define ecpCommandSetting = "ECP Command";
define eccCommandSetting = "ECC Command";
define ecsCommandSetting = "ECS Command";
define earCommandSetting = "EAR Command";
define cPreprocessorCommandSetting = "C Preprocessor Command";
define cCompilerCommandSetting = "C Compiler Command";

define projectOptions = "Project Options";
define defaultTargetDir = "Default Target Directory";
define defaultIntermediateObjDir = "Default Intermediate Objects Directory";

define makeDefaultCommand = (GetRuntimePlatform() == win32) ? "mingw32-make" : "make";
define ecpDefaultCommand = "ecp";
define eccDefaultCommand = "ecc";
define ecsDefaultCommand = "ecs";
define earDefaultCommand = "ear";
define cppDefaultCommand = "cpp";
define ccDefaultCommand = "gcc";

class OldIDESettings : GlobalAppSettings
{
#ifdef SETTINGS_TEST
   settingsName = "ecereIDESettingsTest";
#else
   settingsName = "ecereIDE";
#endif

   List<CompilerConfig> compilerConfigs { };
   Array<String> recentFiles { };
   Array<String> recentProjects { };
   char * docDir;
   char * ideFileDialogLocation;
   char * ideProjectFileDialogLocation;
   bool useFreeCaret;
   bool showLineNumbers;
   bool caretFollowsScrolling;
   //int numJobs;
   char * displayDriver;
   useFreeCaret = true;
   showLineNumbers = false;
   caretFollowsScrolling = true;
   //numJobs = 1;

   char * projectDefaultTargetDir;
   property char * projectDefaultTargetDir
   {
      set { delete projectDefaultTargetDir; if(value && value[0]) projectDefaultTargetDir = CopyString(value); }
      get { return projectDefaultTargetDir ? projectDefaultTargetDir : ""; }
   }
   char * projectDefaultIntermediateObjDir;
   property char * projectDefaultIntermediateObjDir
   {
      set { delete projectDefaultIntermediateObjDir; if(value && value[0]) projectDefaultIntermediateObjDir = CopyString(value); }
      get { return projectDefaultIntermediateObjDir ? projectDefaultIntermediateObjDir : ""; }
   }

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

   ~OldIDESettings()
   {
      compilerConfigs.Free();
      recentFiles.Free();
      recentProjects.Free();
      delete docDir;
   
      delete projectDefaultTargetDir;
      delete projectDefaultIntermediateObjDir;

      delete ideFileDialogLocation;
      delete ideProjectFileDialogLocation;
      delete displayDriver;
   }

   void OnAskReloadSettings()
   {
      /*if(MessageBox { type = YesNo, master = this, 
            text = "Global Settings Modified Externally", 
            contents = "The global settings were modified by another instance.\n"
            "Would you like to reload them?" }.Modal() == Yes)*/
      {
         //Load();
      }
   }

   bool Load()
   {
      bool result = GlobalAppSettings::Load() == success;
      if(result)
      {
         Array<String> configNames { };
         CompilerConfig compiler;
      
         CompilerConfig defaultCompiler = MakeDefaultCompiler(defaultCompilerName, true);
         compilerConfigs.Free();
         compilerConfigs.Add(defaultCompiler);

         // Load new settings
         GetGlobalValue("Compilers", "Configs", stringList, configNames);
         // todo manage the ability to modify the Default config, for now it will be hard coded

         GetGlobalValue("Directories", settingsDirectoryNames[includes], stringList, defaultCompiler.includeDirs);
         GetGlobalValue("Directories", settingsDirectoryNames[libraries], stringList, defaultCompiler.libraryDirs);
         GetGlobalValue("Directories", settingsDirectoryNames[executables], stringList, defaultCompiler.executableDirs);

         for(configName : configNames)
         {
            int len = strlen(configName);
            if(len)
            {
               char * v = null;
               char * section, * platformName = null;
               section = new char[len + 17];
               sprintf(section, "%s Compiler Config", configName);
               GetGlobalValue(section, "Target Platform", singleString, &platformName);
               compiler = CompilerConfig { name = configName, targetPlatform = platformName };
               incref compiler;
               if(!compiler.targetPlatform)
                  compiler.targetPlatform = GetRuntimePlatform();
               delete platformName;
               // TOCHECK these must call the property!
               GetGlobalValue(section, makeCommandSetting, singleString, &v); compiler.makeCommand = v && v[0] ? v : makeDefaultCommand; delete v;
               GetGlobalValue(section, ecpCommandSetting, singleString, &v); compiler.ecpCommand = v && v[0] ? v : ecpDefaultCommand; delete v;
               GetGlobalValue(section, eccCommandSetting, singleString, &v); compiler.eccCommand = v && v[0] ? v : eccDefaultCommand; delete v;
               GetGlobalValue(section, ecsCommandSetting, singleString, &v); compiler.ecsCommand = v && v[0] ? v : ecsDefaultCommand; delete v;
               GetGlobalValue(section, earCommandSetting, singleString, &v); compiler.earCommand = v && v[0] ? v : earDefaultCommand; delete v;
               GetGlobalValue(section, cPreprocessorCommandSetting, singleString, &v); compiler.cppCommand = v && v[0] ? v : cppDefaultCommand; delete v;
               GetGlobalValue(section, cCompilerCommandSetting, singleString, &v); compiler.ccCommand = v && v[0] ? v : ccDefaultCommand; delete v;
               delete section;
               section = new char[len + 13];
               sprintf(section, "%s Directories", configName);
               GetGlobalValue(section, settingsDirectoryNames[includes], stringList, compiler.includeDirs);
               GetGlobalValue(section, settingsDirectoryNames[libraries], stringList, compiler.libraryDirs);
               GetGlobalValue(section, settingsDirectoryNames[executables], stringList, compiler.executableDirs);

               delete section;
               compilerConfigs.Add(compiler);
            }
         }
         configNames.Free();
         delete configNames;

         GetGlobalValue("Recent", "Files", stringList, recentFiles);

         GetGlobalValue("Recent", "Projects", stringList, recentProjects);

         {
            delete ideFileDialogLocation;
            GetGlobalValue("FileOpenLocations", "Files", singleString, &ideFileDialogLocation);

            delete ideProjectFileDialogLocation;
            GetGlobalValue("FileOpenLocations", "Projects", singleString, &ideProjectFileDialogLocation);
         }

         GetGlobalValue("Editing", "UseFreeCaret", integer, &useFreeCaret);
         GetGlobalValue("Editing", "CaretFollowsScrolling", integer, &caretFollowsScrolling);
         GetGlobalValue("Editing", "ShowLineNumbers", integer, &showLineNumbers);
         
         GetGlobalValue("Building", "NumParallelJobs", integer, &defaultCompiler.numJobs);
         {
            delete displayDriver;
            GetGlobalValue("View", "DisplayDriver", singleString, &displayDriver);
         }

         delete docDir;
         GetGlobalValue("Documentor", "Files", singleString, &docDir); // get the path to the documentor files from ecereIDE.ini. Note that the path cannot include quotes or it will not work.

         delete projectDefaultTargetDir;
         GetGlobalValue(projectOptions, defaultTargetDir, singleString, &projectDefaultTargetDir);
         if(!projectDefaultTargetDir || !projectDefaultTargetDir[0])
            property::projectDefaultTargetDir = defaultObjDirExpression;

         delete projectDefaultIntermediateObjDir;
         GetGlobalValue(projectOptions, defaultIntermediateObjDir, singleString, &projectDefaultIntermediateObjDir);
         if(!projectDefaultIntermediateObjDir || !projectDefaultIntermediateObjDir[0])
            property::projectDefaultIntermediateObjDir = defaultObjDirExpression;

         CloseAndMonitor();
      }
      return result;
   }

   void Save()
   {
      if(GlobalAppSettings::Save())
      {
         Array<String> configNames { };
         CompilerConfig compiler = compilerConfigs.firstIterator.data;

         PutGlobalValue("Directories", settingsDirectoryNames[includes],  stringList, compiler.includeDirs);
         PutGlobalValue("Directories", settingsDirectoryNames[libraries],  stringList, compiler.libraryDirs);
         PutGlobalValue("Directories", settingsDirectoryNames[executables],  stringList, compiler.executableDirs);
         PutGlobalValue("Recent", "Files", stringList, recentFiles);
         PutGlobalValue("Recent", "Projects", stringList, recentProjects);

         PutGlobalValue("FileOpenLocations", "Files", singleString, ideFileDialogLocation);
         PutGlobalValue("FileOpenLocations", "Projects", singleString, ideProjectFileDialogLocation);

         PutGlobalValue("Editing", "UseFreeCaret", integer, (void *)useFreeCaret);
         PutGlobalValue("Editing", "CaretFollowsScrolling", integer, (void *)caretFollowsScrolling);
         PutGlobalValue("Editing", "ShowLineNumbers", integer, (void *)showLineNumbers);

         PutGlobalValue("Building", "NumParallelJobs", integer, (void *)(compiler.numJobs));
         PutGlobalValue("View", "DisplayDriver", singleString, displayDriver);
         PutGlobalValue("Documentor", "Files", singleString, docDir);

         PutGlobalValue(projectOptions, defaultTargetDir, singleString, projectDefaultTargetDir);
         PutGlobalValue(projectOptions, defaultIntermediateObjDir, singleString, projectDefaultIntermediateObjDir);

         for(compiler : compilerConfigs; compiler != compilerConfigs.firstIterator.data)
            configNames.Add(CopyString(compiler.name));
         
         PutGlobalValue("Compilers", "Configs", stringList, configNames);

         for(compiler : compilerConfigs; compiler != compilerConfigs.firstIterator.data)
         {
            int len = strlen(compiler.name);
            if(len)
            {
               char * section, * platform;
               section = new char[len + 17];
               sprintf(section, "%s Compiler Config", compiler.name);
               platform = compiler.targetPlatform.OnGetString(null, null, null);
               PutGlobalValue(section, "Target Platform", singleString, platform);
               PutGlobalValue(section, makeCommandSetting, singleString, compiler.makeCommand);
               PutGlobalValue(section, ecpCommandSetting, singleString, compiler.ecpCommand);
               PutGlobalValue(section, eccCommandSetting, singleString, compiler.eccCommand);
               PutGlobalValue(section, ecsCommandSetting, singleString, compiler.ecsCommand);
               PutGlobalValue(section, earCommandSetting, singleString, compiler.earCommand);
               PutGlobalValue(section, cPreprocessorCommandSetting, singleString, compiler.cppCommand);
               PutGlobalValue(section, cCompilerCommandSetting, singleString, compiler.ccCommand);
               delete section;
               section = new char[len + 13];
               sprintf(section, "%s Directories", compiler.name);
               PutGlobalValue(section, settingsDirectoryNames[includes], stringList, compiler.includeDirs);
               PutGlobalValue(section, settingsDirectoryNames[libraries], stringList, compiler.libraryDirs);
               PutGlobalValue(section, settingsDirectoryNames[executables], stringList, compiler.executableDirs);
               delete section;
            }
         }
         configNames.Free();
         delete configNames;
         
         CloseAndMonitor();
      }
   }
}

