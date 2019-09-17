#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

import "Project"

#if defined(__WIN32__)
define pathListSep = ";";
#else
define pathListSep = ":";
#endif

#if defined(_DEBUG) && defined(__WIN32__)
extern int getch(void);
#endif

IDESettings ideSettings;

IDESettingsContainer settingsContainer
{
   dataOwner = &ideSettings;
   dataClass = class(IDESettings);
};

IDEConfigHolder ideConfig { };

void ParseDirList(char * string, Container<String> list)
{
   int c;
   char * tokens[256];
   int numTokens = TokenizeWith(string, sizeof(tokens) / sizeof(byte *), tokens, ";", false);
   list.Free();
   for(c = 0; c < numTokens; c++)
      list.Add(CopyString(tokens[c]));
}

// NOTE: FileMonitors are not to be used by an Application class. globalSystem is not set up properly otherwise.
// Mantis ticket #545 was filed regarding this.
class epj2makeApp : GuiApplication
{
   void Main()
   {
      int c;
      bool valid = true;
      char * configName = null;
      char * epjPath = null;
      char * makePath = null;
      /*
      char ** argv = null;
      int argc = 0;
      */

      Project project = null;

      CompilerConfig optionsCompiler { };

      bool noGlobalSettings = false;
      bool noResources = false;
      bool noWarnings = false;
      const char * overrideObjDir = null;
      const char * includemkPath = null;
      const char * includecfPath = null;
      const char * cfDir = null;

      MakefileGenerationOptions opt { };

      /*
      for(c = 0; c < this.argc; c++)
      {
         char * arg = this.argv[c];
         int argLen = strlen(arg);

         argv = renew argv char *[argc + 1];
         argv[argc] = new char[argLen + 1];
         strcpy(argv[argc], arg);

         while(argv[argc][argLen - 1] == '\\' && c < this.argc-1)
         {
            int len;

            c++;
            arg = this.argv[c];
            len = strlen(arg);
            argv[argc] = renew argv[argc] char[argLen + len + 1];

            argv[argc][argLen - 1] = ' ';
            strcpy(argv[argc] + argLen, arg);
            argLen += len;
         }
         argc++;
      }
      */

      for(c = 1; c < argc; c++)
      {
         const char * arg = argv[c];
         if(arg[0] == '-')
         {
            if(!strcmpi(arg+1, "compiler-config"))
            {
               if(++c < argc)
               {
                  const String path = argv[c];
                  delete optionsCompiler;
                  if(FileExists(path))
                     optionsCompiler = CompilerConfig::read(path);
                  else
                     printf($"Error: Project compiler configuration file (%s) was not found.\n", path);
               }
               else
                  valid = false;
            }
            else if(!strcmpi(arg+1, "make"))
            {
               if(++c < argc)
                  optionsCompiler.makeCommand = argv[c];
               else
                  valid = false;
            }
            else if(!strcmpi(arg+1, "cpp"))
            {
               if(++c < argc)
                  optionsCompiler.cppCommand = argv[c];
               else
                  valid = false;
            }
            else if(!strcmpi(arg+1, "cc"))
            {
               if(++c < argc)
                  optionsCompiler.ccCommand = argv[c];
               else
                  valid = false;
            }
            else if(!strcmpi(arg+1, "ecp"))
            {
               if(++c < argc)
                  optionsCompiler.ecpCommand = argv[c];
               else
                  valid = false;
            }
            else if(!strcmpi(arg+1, "ecc"))
            {
               if(++c < argc)
                  optionsCompiler.eccCommand = argv[c];
               else
                  valid = false;
            }
            else if(!strcmpi(arg+1, "ecs"))
            {
               if(++c < argc)
                  optionsCompiler.ecsCommand = argv[c];
               else
                  valid = false;
            }
            else if(!strcmpi(arg+1, "ear"))
            {
               if(++c < argc)
                  optionsCompiler.earCommand = argv[c];
               else
                  valid = false;
            }
            else if(!strcmpi(arg+1, "noglobalsettings"))
            {
               noGlobalSettings = true;
            }
            else if(!strcmpi(arg+1, "noresources"))
            {
               noResources = true;
            }
            else if(!strcmpi(arg+1, "includemk"))
            {
               if(++c < argc)
                  includemkPath = argv[c];
               else
                  valid = false;
            }
            else if(!strcmpi(arg+1, "includecf"))
            {
               if(++c < argc)
                  includecfPath = argv[c];
               else
                  valid = false;
            }
            else if(!strcmpi(arg+1, "cfdir"))
            {
               if(++c < argc)
                  cfDir = argv[c];
               else
                  valid = false;
            }
            else if(!strcmpi(arg+1, "genoptfile"))
            {
               if(++c < argc)
               {
                  if(!loadFromFileECON(argv[c], class(MakefileGenerationOptions), &opt))
                  {
                     bool exists = FileExists(argv[c]).isFile;
                     printf($"Error: Generation options file (%s) %s%s", argv[c], exists ? "does not exist" : "could not be loaded", ".\n");
                     valid = false; // abort = true;
                  }
               }
               else
                  valid = false;
            }
            else if(arg[1] == 'w' && !arg[2])
            {
               noWarnings = true;
            }
            else if(arg[1] == 'c' && !arg[2])
            {
               if(++c < argc)
               {
                  int argLen = strlen(argv[c]);
                  configName = new char[argLen + 1];
                  strcpy(configName, argv[c]);
               }
               else
                  valid = false;
            }
            else if(arg[1] == 't' && !arg[2])
            {
               // Obsolete target platform option
               if(++c < argc);
               else
                  valid = false;
            }
            else if(arg[1] == 'o')
            {
               if(++c < argc)
               {
                  int argLen = strlen(argv[c]);
                  makePath = new char[argLen + 1];
                  strcpy(makePath, argv[c]);
               }
               else
                  valid = false;
            }
            else if(arg[1] == 'i')
            {
               if(++c < argc)
                  ParseDirList((char *)argv[c], optionsCompiler.includeDirs);
               else
                  valid = false;
            }
            else if(arg[1] == 'l')
            {
               if(++c < argc)
                  ParseDirList((char *)argv[c], optionsCompiler.libraryDirs);
               else
                  valid = false;
            }
            else if(arg[1] == 'd' && !arg[2])
            {
               if(++c < argc)
                  overrideObjDir = argv[c];
               else
                  valid = false;
            }
            else
            {
               valid = false;
               printf($"invalid option: %s\n", arg);
            }
         }
         else
         {
            if(!epjPath)
            {
               int argLen = strlen(arg);
               epjPath = new char[argLen + 1];
               strcpy(epjPath, arg);
               c++;
            }
            else
               valid = false;
         }
      }
      if(!epjPath)
         valid = false;

      if(!valid)
      {
         printf("%s", $"Syntax:\n");
         printf("%s", $"   epj2make [-t <target platform>] [-c <configuration>] [toolchain] [directories] [options] [-o <output>] <input>\n");
         printf("%s", $"      toolchain:\n");
         printf("%s", $"         [-compiler-config <path to compiler configuration file>]\n");
         printf("%s", $"         [-make <make tool>]\n");
         printf("%s", $"         [-cpp <c preprocessor>]\n");
         printf("%s", $"         [-cc <c compiler>]\n");
         printf("%s", $"         [-ecp <eC preprocessor>]\n");
         printf("%s", $"         [-ecc <eC compiler>]\n");
         printf("%s", $"         [-ecs <eC symbol generator>]\n");
         printf("%s", $"         [-ear <Ecere Archiver>]\n");
         printf("%s", $"      directories:\n");
         printf("%s", $"         [-i <include dir[;inc dir[...]]>]\n");
         printf("%s", $"         [-l <library dir[;lib dir[...]]>]\n");
         printf("%s", $"      options:\n");
         printf("%s", $"         [-noglobalsettings]\n");
         printf("%s", $"         [-noresources]\n");
         printf("%s", $"         [-d <intermediate objects directory>]\n");
         printf("%s", $"         [-includemk <crossplatform.mk path>]\n");
         printf("%s", $"         [-includecf <compiler.cf path>]\n");
         printf("%s", $"         [-cfdir <path to configuration directory>]\n");
         printf("%s", $"         [-genoptfile <path to makefile generation options econ file>]\n");
      }
      else
      {
         if(FileExists(epjPath).isFile)
         {
            char extension[MAX_EXTENSION] = "";
            GetExtension(epjPath, extension);
            strlwr(extension);
            if(!strcmp(extension, ProjectExtension))
            {
               if(noGlobalSettings)
               {
                  defaultCompiler = MakeDefaultCompiler("Default", true);
                  delete ideSettings;
               }
               else
               {
                  const char * compiler = getenv("COMPILER");
                  if(!compiler) compiler = "Default";
                  settingsContainer.Load();
                  ideConfig.compilers.read(settingsContainer);

                  //incref ideSettings;
                  delete settingsContainer;

      // TODO: Command line option to choose between the two
      // or a command line option to not use global settings
      //defaultCompiler = MakeDefaultCompiler();
                  defaultCompiler = ideConfig.compilers.GetCompilerConfig(compiler);
      // possible TODO: use the workspace to select the active compiler
      // TODO: option to specify compiler name when using global settings
               }

               if(optionsCompiler.makeCommand)
                  defaultCompiler.makeCommand = optionsCompiler.makeCommand;
               if(optionsCompiler.cppCommand)
                  defaultCompiler.cppCommand = optionsCompiler.cppCommand;
               if(optionsCompiler.ccCommand)
                  defaultCompiler.ccCommand = optionsCompiler.ccCommand;
               if(optionsCompiler.ecpCommand)
                  defaultCompiler.ecpCommand = optionsCompiler.ecpCommand;
               if(optionsCompiler.eccCommand)
                  defaultCompiler.eccCommand = optionsCompiler.eccCommand;
               if(optionsCompiler.ecsCommand)
                  defaultCompiler.ecsCommand = optionsCompiler.ecsCommand;
               if(optionsCompiler.earCommand)
                  defaultCompiler.earCommand = optionsCompiler.earCommand;
               // TODO: Pass/combine/override the include and library dirs
               for(dir : optionsCompiler.includeDirs)
                  defaultCompiler.includeDirs.Add(dir);
               for(dir : optionsCompiler.libraryDirs)
                  defaultCompiler.libraryDirs.Add(dir);
               delete optionsCompiler;

               project = LoadProject(epjPath, null);
               if(project)
               {
                  ProjectConfig defaultConfig = null;
                  if(configName)
                  {
                     valid = false;
                     for(config : project.configurations)
                     {
                        if(!strcmpi(configName, config.name))
                        {
                           project.config = config;
                           valid = true;
                           break;
                        }
                     }
                     if(!valid)
                        printf($"Error: Project configuration (%s) was not found.\n", configName);
                  }
                  else
                  {
                     ProjectConfig releaseConfig = null;
                     for(config : project.configurations)
                     {
                        if(!strcmpi(config.name, "Release"))
                        {
                           releaseConfig = config;
                           break;
                        }
                     }
                     if(!releaseConfig && project.configurations.count)
                     {
                        releaseConfig = project.configurations[0];
                        printf($"Notice: Project configuration (%s) will be used.\n", releaseConfig.name);
                     }

                     if(releaseConfig)
                     {
                        project.config = releaseConfig;
                        if(overrideObjDir)
                        {
                           delete releaseConfig.options.targetDirectory;
                           releaseConfig.options.targetDirectory = CopyString(overrideObjDir);
                           delete releaseConfig.options.objectsDirectory;
                           releaseConfig.options.objectsDirectory = CopyString(overrideObjDir);
                        }
                        if(noWarnings)
                           releaseConfig.options.warnings = none;
                     }
                     else if(overrideObjDir)
                     {
                        delete project.options.targetDirectory;
                        project.options.targetDirectory = CopyString(overrideObjDir);
                        delete project.options.objectsDirectory;
                        project.options.objectsDirectory = CopyString(overrideObjDir);
                     }
                     if(noWarnings)
                        project.options.warnings = none;
                  }
                  if(valid)
                  {
                     project.GenerateCompilerCf(defaultCompiler, project.topNode.ContainsFilesWithExtension("ec", project.config));
                     project.GenerateCrossPlatformMk(null);
                     if(project.GenerateMakefile(makePath, noResources, includemkPath, includecfPath, cfDir, project.config, opt))
                     {
                        if(makePath)
                           printf("%s\n", makePath);
                     }
                  }

                  if(noGlobalSettings)
                     delete defaultCompiler;

                  delete defaultConfig;
                  delete project;
               }
               else
                  printf($"Error: Unable to open project file (%s) due to unknown error.\n", epjPath);
            }
         }
         else
            printf($"Error: Input file (%s) does not exist.\n", epjPath);
      }

      //if(optionsCompiler) // how to fix those leaks?
      delete optionsCompiler;

      delete configName;
      delete epjPath;
      delete makePath;

      // Why do we need to free this here?
      delete defaultCompiler;

      /*
      for(c = 0; c<argc; c++)
         delete argv[c];
      delete argv;
      */

      // CheckMemory();
      delete ideSettings;
#if defined(_DEBUG) && defined(__WIN32__)
      getch();
#endif
   }
}

public bool loadFromFileECON(const String path, Class objectType, void * object)
{
   File f = FileOpen(path, read);
   if(f)
   {
      ECONParser parser { f = f };
      JSONResult jsonResult;
      jsonResult = parser.GetObject(objectType, object);
      delete f;
      return jsonResult == success;
   }
   return false;
}
