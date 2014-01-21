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

#ifdef _DEBUG
extern int getch(void);
#endif

void ParseDirList(char * string, Container<String> list)
{
   int c;
   byte * tokens[256];
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

      Platform targetPlatform = GetRuntimePlatform();

      Project project = null;

      CompilerConfig optionsCompiler { };

      bool noGlobalSettings = false;
      bool noResources = false;
      bool noWarnings = false;
      char * overrideObjDir = null;
      char * includemkPath = null;

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
         char * arg = argv[c];
         if(arg[0] == '-')
         {
            if(!strcmpi(arg+1, "make"))
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
               if(++c < argc)
                  targetPlatform = argv[c];
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
                  ParseDirList(argv[c], optionsCompiler.includeDirs);
               else
                  valid = false;
            }
            else if(arg[1] == 'l')
            {
               if(++c < argc)
                  ParseDirList(argv[c], optionsCompiler.libraryDirs);
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
         printf($"Syntax:\n");
         printf($"   epj2make [-t <target platform>] [-c <configuration>] [toolchain] [directories] [options] [-o <output>] <input>\n");
         printf($"      toolchain:\n");
         printf($"         [-make <make tool>]\n");
         printf($"         [-cpp <c preprocessor>]\n");
         printf($"         [-cc <c compiler>]\n");
         printf($"         [-ecp <eC preprocessor>]\n");
         printf($"         [-ecc <eC compiler>]\n");
         printf($"         [-ecs <eC symbol generator>]\n");
         printf($"         [-ear <Ecere Archiver>]\n");
         printf($"      directories:\n");
         printf($"         [-i <include dir[;inc dir[...]]>]\n");
         printf($"         [-l <library dir[;lib dir[...]]>]\n");
         printf($"      options:\n");
         printf($"         [-noglobalsettings]\n");
         printf($"         [-noresources]\n");
         printf($"         [-d <intermediate objects directory>]\n");
         printf($"         [-includemk <crossplatform.mk path>]\n");
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
                  char * compiler = getenv("COMPILER");
                  if(!compiler) compiler = "Default";
                  settingsContainer.Load();
                  //incref ideSettings;
                  delete settingsContainer;

      // TODO: Command line option to choose between the two
      // or a command line option to not use global settings
      //defaultCompiler = MakeDefaultCompiler();
                  defaultCompiler = ideSettings.GetCompilerConfig(compiler);
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
                     if(project.GenerateMakefile(makePath, noResources, includemkPath, project.config))
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
#ifdef _DEBUG
      getch();
#endif
   }
}
