#ifdef __WIN32__
import "project"

static char indendation[MAX_F_STRING];

#define VCPROJ_INDENTATION
#define VCPROJ_TAGS_ON_NEW_LINES
#define VCPROJ_ATTRIBS_ON_NEW_LINES

#define VCPROJ_NEW_LINE "\n"
//#define VCPROJ_NEW_LINE "\r\n"

#ifdef VCPROJ_INDENTATION
define tagIndent = (char *)indendation;
#else
define tagIndent = "";
#endif

#ifdef VCPROJ_TAGS_ON_NEW_LINES
define tagLine = VCPROJ_NEW_LINE;
#else
define tagLine = "";
#endif

#ifdef VCPROJ_ATTRIBS_ON_NEW_LINES
define attribSep = VCPROJ_NEW_LINE;
#ifdef VCPROJ_INDENTATION
define attribIndent = (char *)indendation;
#else
define attribIndent = "";
#endif
#else
define attribSep = " ";
define attribIndent = "";
#endif

static void IndentClear()
{
   indendation[0] = '\0';
}
static void IndentPush()
{
#ifdef VCPROJ_INDENTATION
   int len = strlen(indendation);
   indendation[len] = '\t';
   indendation[len+1] = '\0';
#endif
}
static void IndentPop()
{
#ifdef VCPROJ_INDENTATION
   int len = strlen(indendation);
   if(len)
      indendation[len-1] = '\0';
#endif
}

void GenerateVSSolutionFile(Project project)
{
   char filePath[MAX_LOCATION];
   char slnFileName[MAX_LOCATION];
   char * projectName = project.name;
   File f;

   IndentClear();

   strcpy(filePath, project.topNode.path);
   //PathCat(filePath, "..\\");
   sprintf(slnFileName, "%s.sln", projectName);
   PathCatSlash(filePath, slnFileName);

   f = FileOpen(filePath, write);
   if(f)
   {
      char * slnGUID = "8BC9CEB8-8B4A-11D0-8D11-00A0C91BC942";
      char * prjGUID = "3A1E5467-4EE2-4299-8F0C-7D26CC8C24BA";
      //char * relPathToVCProjFile = "win32ProjectConsoleApp\\win32ProjectConsoleApp";
      CompilerConfig compiler = GetCompilerConfig();

      f.Print(""); f.Printf("\r\n");
      f.Print("Microsoft Visual Studio Solution File, Format Version ", compiler.type.solutionFileVersionString); f.Printf("\r\n");
      f.Print("# Visual Studio ", compiler.type.yearString); f.Printf("\r\n");
      f.Print("Project(\"{", slnGUID, "}\") = \"", projectName, "\", \"", projectName, ".", 
            compiler.type.projectFileExtension, "\", \"{", prjGUID, "}\"", attribSep); f.Printf("\r\n");
      f.Print("EndProject"); f.Printf("\r\n");
      f.Print("Global"); f.Printf("\r\n");
      f.Print("\tGlobalSection(SolutionConfigurationPlatforms) = preSolution"); f.Printf("\r\n");
      for(config : project.configurations)
      {
         f.Print("\t\t", config.name, "|Win32 = ", config.name, "|Win32"); f.Printf("\r\n");
      }
      f.Print("\tEndGlobalSection"); f.Printf("\r\n");
      f.Print("\tGlobalSection(ProjectConfigurationPlatforms) = postSolution"); f.Printf("\r\n");
      for(config : project.configurations)
      {
         f.Print("\t\t{", prjGUID, "}.", config.name, "|Win32.ActiveCfg = ", config.name, "|Win32"); f.Printf("\r\n");
         f.Print("\t\t{", prjGUID, "}.", config.name, "|Win32.Build.0 = ", config.name, "|Win32"); f.Printf("\r\n");
      }
      f.Print("\tEndGlobalSection"); f.Printf("\r\n");
      f.Print("\tGlobalSection(SolutionProperties) = preSolution"); f.Printf("\r\n");
      f.Print("\t\tHideSolutionNode = FALSE"); f.Printf("\r\n");
      f.Print("\tEndGlobalSection"); f.Printf("\r\n");
      f.Print("EndGlobal"); f.Printf("\r\n");
   
      delete compiler;
      delete f;
   }
}

void GenerateVCProjectFile(Project project)
{
   char filePath[MAX_LOCATION];
   char slnFileName[MAX_LOCATION];
   char * projectName = project.name;
   bool usePrecompiledHeaders = false;
   File f;
   CompilerConfig compiler = GetCompilerConfig();

   IndentClear();

   strcpy(filePath, project.topNode.path);
   sprintf(slnFileName, "%s.%s", projectName, compiler.type.projectFileExtension);
   PathCatSlash(filePath, slnFileName);

   f = FileOpen(filePath, write);
   if(f)
   {
      char * targetFrameworkVersion = "196613";
      char * prjGUID = "3A1E5467-4EE2-4299-8F0C-7D26CC8C24BA";
      char * rootNamespace = projectName;
      Map<String, NameCollisionInfo> namesInfo { };
      project.topNode.GenMakefileGetNameCollisionInfo(namesInfo);

      f.Print(tagIndent, "<?xml version=\"1.0\" encoding=\"Windows-1252\"?>", tagLine);
      f.Print(tagIndent, "<VisualStudioProject", attribSep);
         IndentPush();
         f.Print(attribIndent, "ProjectType=\"Visual C++\"", attribSep);
         f.Print(attribIndent, "Version=\"", compiler.type.versionString, "\"", attribSep);
         f.Print(attribIndent, "Name=\"", projectName, "\"", attribSep);
         f.Print(attribIndent, "ProjectGUID=\"{", prjGUID, "}\"", attribSep);
         f.Print(attribIndent, "RootNamespace=\"", rootNamespace, "\"", attribSep);
         f.Print(attribIndent, "Keyword=\"Win32Proj\"", attribSep);
      if(compiler.type == vs9)
         f.Print(attribIndent, "TargetFrameworkVersion=\"", targetFrameworkVersion, "\"", attribSep);
         f.Print(attribIndent, ">", tagLine);

         f.Print(tagIndent, "<Platforms>", tagLine);
            IndentPush();
            f.Print(tagIndent, "<Platform", attribSep);
               IndentPush();
               f.Print(attribIndent, "Name=\"Win32\"", attribSep);
            IndentPop();
            f.Print(attribIndent, "/>", tagLine);
         IndentPop();
         f.Print(tagIndent, "</Platforms>", tagLine);
         
         f.Print(tagIndent, "<ToolFiles>", tagLine);
         f.Print(tagIndent, "</ToolFiles>", tagLine);

         f.Print(tagIndent, "<Configurations>", tagLine);
            IndentPush();

            for(config : project.configurations)
               PrintConfiguration(f, project, config, usePrecompiledHeaders);

         IndentPop();
         f.Print(tagIndent, "</Configurations>", tagLine);

         f.Print(tagIndent, "<References>", tagLine);
         f.Print(tagIndent, "</References>", tagLine);

         f.Print(tagIndent, "<Files>", tagLine);
            IndentPush();
            f.Print(tagIndent, "<Filter", attribSep);
               IndentPush();
               f.Print(attribIndent, "Name=\"Source Files\"", attribSep);
               f.Print(attribIndent, "Filter=\"cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx\"", attribSep);
               f.Print(attribIndent, "UniqueIdentifier=\"{4FC737F1-C7A5-4376-A066-2A32D752A2FF}\"", attribSep);
               f.Print(attribIndent, ">", tagLine);
            
               PrintNodes(f, project, project.topNode, namesInfo, source, false, usePrecompiledHeaders);
            IndentPop();
            f.Print(tagIndent, "</Filter>", tagLine);

            f.Print(tagIndent, "<Filter", attribSep);
               IndentPush();
               f.Print(attribIndent, "Name=\"Header Files\"", attribSep);
               f.Print(attribIndent, "Filter=\"h;hpp;hxx;hm;inl;inc;xsd\"", attribSep);
               f.Print(attribIndent, "UniqueIdentifier=\"{93995380-89BD-4b04-88EB-625FBE52EBFB}\"", attribSep);
               f.Print(attribIndent, ">", tagLine);
            
               PrintNodes(f, project, project.topNode, namesInfo, header, false, usePrecompiledHeaders);
            IndentPop();
            f.Print(tagIndent, "</Filter>", tagLine);

            f.Print(tagIndent, "<Filter", attribSep);
               IndentPush();
               f.Print(attribIndent, "Name=\"Resource Files\"", attribSep);
               f.Print(attribIndent, "Filter=\"rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav\"", attribSep);
               f.Print(attribIndent, "UniqueIdentifier=\"{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}\"", attribSep);
               f.Print(attribIndent, ">", tagLine);
            
               PrintNodes(f, project, project.resNode, namesInfo, resource, false, usePrecompiledHeaders);
            IndentPop();
            f.Print(tagIndent, "</Filter>", tagLine);
            PrintNodes(f, project, project.topNode, namesInfo, other, false, usePrecompiledHeaders);
         IndentPop();
         f.Print(tagIndent, "</Files>", tagLine);

         f.Print(tagIndent, "<Globals>", tagLine);
         f.Print(tagIndent, "</Globals>", tagLine);
      
      IndentPop();
      f.Print("</VisualStudioProject>", tagLine);
   
      namesInfo.Free();
      delete namesInfo;
      delete f;
   }
   delete compiler;
}

void PrintConfiguration(File f, Project project, ProjectConfig config, bool usePrecompiledHeaders)
{
   ProjectOptions options = project.options;
   SetBool consoleSet = localConsole;
   SetBool debugSet = localDebug;
   OptimizationStrategy optimizationSet = localOptimization;
   String targetFileName = localTargetFileName;
   bool console = consoleSet == true;
   bool debug = debugSet == true;
   bool optimize = optimizationSet == speed;
   char * objDirExpr = localObjectsDirectory;
   char * targetDirExpr = localTargetDirectory;
   DirExpression objDir { type = intermediateObjectsDir };
   DirExpression targetDir { type = DirExpressionType::targetDir };
   CompilerConfig compiler = GetCompilerConfig();

   if(!objDirExpr)
      objDirExpr = settingsObjectsDirectory;
   objDir.Evaluate(objDirExpr, project);
   if(!targetDirExpr)
      targetDirExpr = settingsTargetDirectory;
   targetDir.Evaluate(targetDirExpr, project);

   f.Print(tagIndent, "<Configuration", attribSep);
      IndentPush();
      f.Print(attribIndent, "Name=\"", config.name, "|Win32\"", attribSep);
      f.Print(attribIndent, "OutputDirectory=\"$(SolutionDir)", targetDir.dir/*"$(ConfigurationName)"*/, "\"", attribSep);
      f.Print(attribIndent, "IntermediateDirectory=\"", objDir.dir/*"$(ConfigurationName)"*/, "\"", attribSep);
      f.Print(attribIndent, "ConfigurationType=\"", project.targetType == sharedLibrary ? 2 : project.targetType == staticLibrary ? 4 : 1, "\"", attribSep);
      f.Print(attribIndent, "CharacterSet=\"", false/*unicode*/ ? 1 : true/*multibyte*/ ? 2 : 0, "\"", attribSep);
   if(optimizationSet == speed)
      f.Print(attribIndent, "WholeProgramOptimization=\"1\"", attribSep);
      f.Print(attribIndent, ">", tagLine);

      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCPreBuildEventTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCCustomBuildTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCXMLDataGeneratorTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCWebServiceProxyGeneratorTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCMIDLTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCCLCompilerTool\"", attribSep);
   if(debug || (optimize && compiler.type == vs9))
         f.Print(attribIndent, "Optimization=\"", debug ? 0 : 2, "\"", attribSep);
   if(optimize && compiler.type == vs9)
         f.Print(attribIndent, "EnableIntrinsicFunctions=\"true\"", attribSep);
         {
            Array<DirPath> additionalIncludeDirs { };
            if(project.options && project.options.includeDirs)
            {
               for(dir : project.options.includeDirs)
                  additionalIncludeDirs.Add(CopySystemPath(dir));
            }
            if(config && config.options && config.options.includeDirs)
            {
               for(dir : config.options.includeDirs)
                  additionalIncludeDirs.Add(CopySystemPath(dir));
            }
            CollectPlatformSpecificDirs(project, config, null, additionalIncludeDirs, null, null);
            if(additionalIncludeDirs.count)
            {
               f.Print(attribIndent, "AdditionalIncludeDirectories=\"");
               for(dir : additionalIncludeDirs)
                  f.Print(dir == additionalIncludeDirs.firstIterator.data ?  "" : ";", dir);
               f.Print("\"", attribSep);
               additionalIncludeDirs.Free();
            }
            delete additionalIncludeDirs;
         }
         f.Print(attribIndent, "PreprocessorDefinitions=\"WIN32");
         f.Print(";_CRT_SECURE_NO_DEPRECATE");
         if(console)
            f.Print(";_CONSOLE");
         if(project.targetType == sharedLibrary)
            f.Print(";_WINDOWS;_USRDLL;WIN32DYNAMICLIB_EXPORTS");
         else if(project.targetType == staticLibrary)
            f.Print(";_LIB");
         if(project.options && project.options.preprocessorDefinitions)
         {
            for(def : project.options.preprocessorDefinitions)
               f.Print(";", def);
         }
         if(config && config.options && config.options.preprocessorDefinitions)
         {
            for(def : config.options.preprocessorDefinitions)
               f.Print(";", def);
         }
         f.Print("\"", attribSep);
   if(debug)
   {
         f.Print(attribIndent, "MinimalRebuild=\"true\"", attribSep);
         f.Print(attribIndent, "BasicRuntimeChecks=\"3\"", attribSep);
   }
         f.Print(attribIndent, "RuntimeLibrary=\"", debug ? 3 : 2, "\"", attribSep);
   if(optimize && compiler.type == vs9)
         f.Print(attribIndent, "EnableFunctionLevelLinking=\"true\"", attribSep);
         f.Print(attribIndent, "UsePrecompiledHeader=\"", usePrecompiledHeaders ? 2 : 0, "\"", attribSep);
         f.Print(attribIndent, "WarningLevel=\"3\"", attribSep);
   if(compiler.type == vs8)
         f.Print(attribIndent, "Detect64BitPortabilityProblems=\"true\"", attribSep);
         f.Print(attribIndent, "DebugInformationFormat=\"", debug ? 4 : 3, "\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCManagedResourceCompilerTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCResourceCompilerTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCPreLinkEventTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"", (project.targetType == executable || project.targetType == sharedLibrary) ? "VCLinkerTool" : "VCLibrarianTool", "\"", attribSep);
         {
            Array<String> additionalLibraries { };
            if(project.options && project.options.libraries)
            {
               for(lib : project.options.libraries)
                  additionalLibraries.Add(CopyString(lib));
            }
            if(config && config.options && config.options.libraries)
            {
               for(lib : config.options.libraries)
                  additionalLibraries.Add(CopyString(lib));
            }
            CollectPlatformSpecificDirs(project, config, null, null, null, additionalLibraries);
            if(additionalLibraries.count)
            {
               f.Print(attribIndent, "AdditionalDependencies=\"");
               for(lib : additionalLibraries)
                  f.Print(lib == additionalLibraries.firstIterator.data ?  "" : " ", lib, ".lib");
               f.Print("\"", attribSep);
               additionalLibraries.Free();
            }
            delete additionalLibraries;
         }
         f.Print(attribIndent, "OutputFile=\"$(OutDir)\\", targetFileName, ".");
         if(project.targetType == executable)
            f.Print("exe");
         else if(project.targetType == sharedLibrary)
            f.Print("dll");
         else if(project.targetType == staticLibrary)
            f.Print("lib");
         f.Print("\"", attribSep);
   if(project.targetType == executable)
         f.Print(attribIndent, "LinkIncremental=\"", debug ? 2 : 1, "\"", attribSep);
         {
            Array<DirPath> additionalLibraryDirs { };
            if(project.options && project.options.libraryDirs)
            {
               for(dir : project.options.libraryDirs)
                  additionalLibraryDirs.Add(CopySystemPath(dir));
            }
            if(config && config.options && config.options.libraryDirs)
            {
               for(dir : config.options.libraryDirs)
                  additionalLibraryDirs.Add(CopySystemPath(dir));
            }
            CollectPlatformSpecificDirs(project, config, null, null, additionalLibraryDirs, null);
            if(additionalLibraryDirs.count)
            {
               f.Print(attribIndent, "AdditionalLibraryDirectories=\"");
               for(dir : additionalLibraryDirs)
                  f.Print(dir == additionalLibraryDirs.firstIterator.data ?  "" : ";", dir);
               f.Print("\"", attribSep);
               additionalLibraryDirs.Free();
            }
            delete additionalLibraryDirs;
         }
   if(project.targetType == executable)
   {
         f.Print(attribIndent, "GenerateDebugInformation=\"true\"", attribSep);
         f.Print(attribIndent, "SubSystem=\"1\"", attribSep);
      if(optimize)
      {      
         f.Print(attribIndent, "OptimizeReferences=\"2\"", attribSep);
         f.Print(attribIndent, "EnableCOMDATFolding=\"2\"", attribSep);
      }
         f.Print(attribIndent, "TargetMachine=\"1\"", attribSep);
   }
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCALinkTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
   if(project.targetType == executable)
   {
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCManifestTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
   }
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCXDCMakeTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCBscMakeTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCFxCopTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
   if(project.targetType == executable)
   {
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCAppVerifierTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
      /*
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCWebDeploymentTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
      */
   }
      f.Print(tagIndent, "<Tool", attribSep);
         IndentPush();
         f.Print(attribIndent, "Name=\"VCPostBuildEventTool\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
   IndentPop();
   f.Print(tagIndent, "</Configuration>", tagLine);

   delete objDir;
   delete targetDir;
   delete compiler;
}

void CollectPlatformSpecificDirs(Project project, ProjectConfig config, Array<String> additionalPreprocessorDefs,
      Array<DirPath> additionalIncludeDirs, Array<DirPath> additionalLibraryDirs, Array<String> additionalLibraries)
{
   ProjectOptions options = project.options;
   TargetTypes targetType = localTargetType;

   Platform platform = win32;
   //for(platform = firstPlatform; platform <= lastPlatform; platform++)
   //for(platform = win32; platform <= apple; platform++)
   
   //for(platform = (Platform)1; platform < Platform::enumSize; platform++)
   //{
      PlatformOptions projectPlatformOptions = null;
      PlatformOptions configPlatformOptions = null;

      if(project.platforms)
      {
         for(p : project.platforms)
         {
            if(!strcmpi(p.name, platform))
            {
               projectPlatformOptions = p;
               break;
            }
         }
      }
      if(config && config.platforms)
      {
         for(p : config.platforms)
         {
            if(!strcmpi(p.name, platform))
            {
               configPlatformOptions = p;
               break;
            }
         }
      }
      if(projectPlatformOptions)
      {
         if(additionalPreprocessorDefs && projectPlatformOptions.options.preprocessorDefinitions && projectPlatformOptions.options.preprocessorDefinitions.count)
         {
            for(def : projectPlatformOptions.options.preprocessorDefinitions)
               additionalPreprocessorDefs.Add(CopyString(def));
         }
         if(additionalIncludeDirs && projectPlatformOptions.options.includeDirs && projectPlatformOptions.options.includeDirs.count)
         {
            for(dir : projectPlatformOptions.options.includeDirs)
               additionalIncludeDirs.Add(CopySystemPath(dir));
         }
         if(targetType != staticLibrary)
         {
            if(additionalLibraryDirs && projectPlatformOptions && projectPlatformOptions.options.libraryDirs && projectPlatformOptions.options.libraryDirs.count)
            {
               for(dir : projectPlatformOptions.options.libraryDirs)
                  additionalLibraryDirs.Add(CopySystemPath(dir));
            }
            if(additionalLibraries && projectPlatformOptions.options.libraries && projectPlatformOptions.options.libraries.count)
            {
               for(lib : projectPlatformOptions.options.libraries)
                  additionalLibraries.Add(CopyString(lib));
            }
         }
      }
      if(configPlatformOptions)
      {
         if(additionalPreprocessorDefs && configPlatformOptions.options.preprocessorDefinitions && configPlatformOptions.options.preprocessorDefinitions.count)
         {
            for(def : configPlatformOptions.options.preprocessorDefinitions)
               additionalPreprocessorDefs.Add(CopyString(def));
         }
         if(additionalIncludeDirs && configPlatformOptions.options.includeDirs && configPlatformOptions.options.includeDirs.count)
         {
            for(dir : configPlatformOptions.options.includeDirs)
               additionalIncludeDirs.Add(CopySystemPath(dir));
         }
         if(targetType != staticLibrary)
         {
            if(additionalLibraryDirs && configPlatformOptions && configPlatformOptions.options.libraryDirs && configPlatformOptions.options.libraryDirs.count)
            {
               for(dir : configPlatformOptions.options.libraryDirs)
                  additionalLibraryDirs.Add(CopySystemPath(dir));
            }
            if(additionalLibraries && configPlatformOptions.options.libraries && configPlatformOptions.options.libraries.count)
            {
               for(lib : configPlatformOptions.options.libraries)
                  additionalLibraries.Add(CopyString(lib));
            }
         }
      }
   //}
}

enum FilesFilter { source, header, resource, other };
bool PrintNodes(File f, Project prj, ProjectNode node, Map<String, NameCollisionInfo> namesInfo, FilesFilter filter, bool justHasChild, bool usePrecompiledHeaders)
{
   if(node.type == file)
   {
      char extension[MAX_EXTENSION];
      GetExtension(node.name, extension);
      if(filter == source)
      {
         if(!strcmpi(extension, "cpp") || !strcmpi(extension, "c") ||
               !strcmpi(extension, "cxx") || !strcmpi(extension, "def") ||
               !strcmpi(extension, "odl") || !strcmpi(extension, "idl") ||
               !strcmpi(extension, "hpj") || !strcmpi(extension, "bat") ||
               !strcmpi(extension, "asm") || !strcmpi(extension, "asmx"))
         {
            if(justHasChild)
               return true;
            PrintFile(f, prj, node, namesInfo, usePrecompiledHeaders);
         }
      }
      else if(filter == header)
      {
         if(!strcmpi(extension, "h") || !strcmpi(extension, "hpp") ||
               !strcmpi(extension, "hxx") || !strcmpi(extension, "hm") ||
               !strcmpi(extension, "inl") || !strcmpi(extension, "inc") ||
               !strcmpi(extension, "xsd"))
         {
            if(justHasChild)
               return true;
            PrintFile(f, prj, node, namesInfo, usePrecompiledHeaders);
         }
      }
      else if(filter == resource)
      {
         if(!strcmpi(extension, "rc") || !strcmpi(extension, "ico") ||
               !strcmpi(extension, "cur") || !strcmpi(extension, "bmp") ||
               !strcmpi(extension, "dlg") || !strcmpi(extension, "rc2") ||
               !strcmpi(extension, "rct") || !strcmpi(extension, "bin") ||
               !strcmpi(extension, "rgs") || !strcmpi(extension, "gif") ||
               !strcmpi(extension, "jpg") || !strcmpi(extension, "jpeg") ||
               !strcmpi(extension, "jpe") || !strcmpi(extension, "resx") ||
               !strcmpi(extension, "tiff") || !strcmpi(extension, "tif") ||
               !strcmpi(extension, "png") || !strcmpi(extension, "wav"))
         {
            if(justHasChild)
               return true;
            PrintFile(f, prj, node, namesInfo, usePrecompiledHeaders);
         }
      }
      else if(filter == other)
      {
         if(!(!strcmpi(extension, "cpp") || !strcmpi(extension, "c") ||
               !strcmpi(extension, "cxx") || !strcmpi(extension, "def") ||
               !strcmpi(extension, "odl") || !strcmpi(extension, "idl") ||
               !strcmpi(extension, "hpj") || !strcmpi(extension, "bat") ||
               !strcmpi(extension, "asm") || !strcmpi(extension, "asmx") ||
               !strcmpi(extension, "h") || !strcmpi(extension, "hpp") ||
               !strcmpi(extension, "hxx") || !strcmpi(extension, "hm") ||
               !strcmpi(extension, "inl") || !strcmpi(extension, "inc") ||
               !strcmpi(extension, "xsd") ||
               !strcmpi(extension, "rc") || !strcmpi(extension, "ico") ||
               !strcmpi(extension, "cur") || !strcmpi(extension, "bmp") ||
               !strcmpi(extension, "dlg") || !strcmpi(extension, "rc2") ||
               !strcmpi(extension, "rct") || !strcmpi(extension, "bin") ||
               !strcmpi(extension, "rgs") || !strcmpi(extension, "gif") ||
               !strcmpi(extension, "jpg") || !strcmpi(extension, "jpeg") ||
               !strcmpi(extension, "jpe") || !strcmpi(extension, "resx") ||
               !strcmpi(extension, "tiff") || !strcmpi(extension, "tif") ||
               !strcmpi(extension, "png") || !strcmpi(extension, "wav")))
         {
            if(justHasChild)
               return true;
            PrintFile(f, prj, node, namesInfo, usePrecompiledHeaders);
         }
      }
   }
   else if(node.files)
   {
      bool hasChild = false;

      if(!justHasChild && node.type == folder)
      {
         for(child : node.files)
         {
            if(child.type == folder || (child.type != resources && !child.isExcluded))
            {
               if((hasChild = PrintNodes(f, prj, child, namesInfo, filter, true, usePrecompiledHeaders)))
                  break;
            }
         }

         if(hasChild)
         {
            f.Print(tagIndent, "<Filter", attribSep);
               IndentPush();
               f.Print(attribIndent, "Name=\"", node.name, "\"", attribSep);
               f.Print(attribIndent, ">", tagLine);
         }
      }

      for(child : node.files)
      {
         if(child.type == folder || (child.type != resources && !child.isExcluded))
         {
            if(PrintNodes(f, prj, child, namesInfo, filter, justHasChild, usePrecompiledHeaders) && justHasChild)
               break;
         }
      }

      if(!justHasChild && hasChild && node.type == folder)
      {
         IndentPop();
         f.Print(tagIndent, "</Filter>", tagLine);
      }
   }
   return false;
}

void PrintFile(File f, Project prj, ProjectNode node, Map<String, NameCollisionInfo> namesInfo, bool usePrecompiledHeaders)
{
   char modulePath[MAX_LOCATION];
   char moduleName[MAX_FILENAME];
   char relativePath[MAX_LOCATION];
   ProjectConfig config = null;
   Array<String> perFilePreprocessorDefs { };
   Array<DirPath> perFileIncludeDirs { };

   ReplaceSpaces(modulePath, node.path);
   ReplaceSpaces(moduleName, node.name);
   //sprintf(s, "%s%s%s%s%s", ts.a, modulePath, path[0] ? SEPS : "", moduleName, ts.b);
   //items.Add(CopyString(s));
   //strcpy(relativePath, ".\\");
   strcpy(relativePath, "");
   PathCat(relativePath, modulePath);
   PathCat(relativePath, moduleName);
   //relativePath = ".\stdafx.cpp";

   f.Print(tagIndent, "<File", attribSep);
      IndentPush();
      f.Print(attribIndent, "RelativePath=\"", relativePath, "\"", attribSep);
      f.Print(attribIndent, ">", tagLine);
      
      for(config : prj.configurations)
      {
         node.CollectPerFileAndDirOptions(config, perFilePreprocessorDefs, perFileIncludeDirs);
         PrintFileConfiguration(f, prj, node, namesInfo, config, perFilePreprocessorDefs, perFileIncludeDirs, usePrecompiledHeaders && !strcmpi(relativePath, ".\\stdafx.cpp"));
         perFilePreprocessorDefs.Free();
         perFileIncludeDirs.Free();
      }

   IndentPop();
   f.Print(tagIndent, "</File>", tagLine);

   delete perFilePreprocessorDefs;
   delete perFileIncludeDirs;
}

void PrintFileConfiguration(File f, Project prj, ProjectNode node,
      Map<String, NameCollisionInfo> namesInfo, ProjectConfig config,
      Array<String> perFilePreprocessorDefs, Array<DirPath> perFileIncludeDirs,
      bool usePrecompiledHeaders)
{
   char extension[MAX_EXTENSION];
   char moduleName[MAX_FILENAME];
   bool nameCollision;
   NameCollisionInfo info;
   GetExtension(node.name, extension);
   ReplaceSpaces(moduleName, node.name);
   StripExtension(moduleName);
   info = namesInfo[moduleName];
   nameCollision = info ? info.IsExtensionColliding(extension) : false;
   if(perFilePreprocessorDefs.count || perFileIncludeDirs.count ||
         node.isExcluded || nameCollision ||
         !strcmpi(extension, "h") || usePrecompiledHeaders)
   {
   f.Print(tagIndent, "<FileConfiguration", attribSep);
      IndentPush();
      f.Print(attribIndent, "Name=\"", config.name, "|Win32\"", attribSep);
      if(node.isExcluded || !strcmpi(extension, "h"))
         f.Print(attribIndent, "ExcludedFromBuild=\"true\"", attribSep);
      f.Print(attribIndent, ">", tagLine);

      if(perFileIncludeDirs.count || perFileIncludeDirs.count || perFilePreprocessorDefs.count || usePrecompiledHeaders)
      {
      f.Print(tagIndent, "<Tool", attribSep);
      IndentPush();
         f.Print(attribIndent, "Name=\"VCCLCompilerTool\"", attribSep);
         if(perFileIncludeDirs.count)
         {
         f.Print(attribIndent, "AditionalIncludeDirectories=\"");
         for(dir : perFileIncludeDirs)
            f.Print(dir == perFileIncludeDirs.firstIterator.data ?  "" : ";", dir);
         f.Print("\"", attribSep);
         }

      if(nameCollision)
         f.Print(attribIndent, "ObjectFile=\"$(IntDir)\\", node.name, ".obj\"", attribSep);

         if(perFilePreprocessorDefs.count)
         {
         f.Print(attribIndent, "PreprocessorDefinitions=\"");
         for(def : perFilePreprocessorDefs)
            f.Print(def == perFilePreprocessorDefs.firstIterator.data ?  "" : ";", def);
         f.Print("\"", attribSep);
         }
         if(usePrecompiledHeaders)
         f.Print(attribIndent, "UsePrecompiledHeader=\"1\"", attribSep);
      IndentPop();
      f.Print(attribIndent, "/>", tagLine);
      }
   IndentPop();
   f.Print(tagIndent, "</FileConfiguration>", tagLine);
   }
}
#endif
