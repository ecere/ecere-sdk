#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

import "DynamicString"

#ifndef MAKEFILE_GENERATOR
import "ide"
// We should have the .sln/.vcproj generation even on other platforms
// e.g. detect from an environment variable pointing to a Windows drive
#ifdef __WIN32__
import "vsSupport"
#endif
#endif

import "ProjectConfig"
import "ProjectNode"
import "IDESettings"

default:

static void DummyFunction()
{
int a;
a.OnFree();
}

private:

extern int __ecereVMethodID_class_OnCompare;
extern int __ecereVMethodID_class_OnFree;

IDESettings ideSettings;

IDESettingsContainer settingsContainer
{
   driver = "JSON";
   dataOwner = &ideSettings;
   dataClass = class(IDESettings);

   void OnLoad(GlobalSettingsData data)
   {
      IDESettings settings = (IDESettings)data;
#ifndef MAKEFILE_GENERATOR
      globalSettingsDialog.ideSettings = settings;
      ide.UpdateRecentMenus();
      ide.UpdateCompilerConfigs(true);
#endif
   }
};

#ifdef MAKEFILE_GENERATOR
CompilerConfig defaultCompiler;
#endif

// LEGACY BINARY EPJ LOADING

SetBool ParseTrueFalseValue(char * string)
{
   if(!strcmpi(string, "True")) return true;
   return false;
}

void ParseArrayValue(Array<String> array, char * equal)
{
   char * start, * comma;
   char * string;
   string = CopyString(equal);
   start = string;
   while(start)
   {
      comma = strstr(start, ",");
      if(comma)
         comma[0] = '\0';
      array.Add(CopyString(start));
      if(comma)
         comma++;
      if(comma)
         comma++;
      start = comma;
   }
   delete string;
}

void ProjectNode::LegacyBinaryLoadNode(File f)
{
   int len, count, c;
   int fileNameLen;

   f.Read(&len, sizeof(len), 1);
   name = new char[len+1];
   fileNameLen = len;
   f.Read(name, sizeof(char), len+1);
   f.Read(&len, sizeof(len), 1);
   fileNameLen += len;
   path = new char[len+1];
   f.Read(path, sizeof(char), len+1);
   
   /*
   fileName = new char[fileNameLen+2];
   strcpy(fileName, path);
   if(fileName[0]) strcat(fileName, "/");
   strcat(fileName, name);
   */

   f.Read(&type, sizeof(type), 1);
   f.Read(&count, sizeof(count), 1);
   
   if(type == file)
   {
      nodeType = file;
      icon = NodeIcons::SelectFileIcon(name);
   }
   else
   {
      nodeType = folder;
      icon = NodeIcons::SelectNodeIcon(type);
   }

   if(count && !files) files = { };
   for(c = 0; c < count; c++)
   {
      ProjectNode child { };
      files.Add(child);
      child.parent = this;
      child.indent = indent + 1;
      LegacyBinaryLoadNode(child, f);
   }
}

/*void LegacyBinarySaveNode(File f)
{
   int len;
   ProjectNode child;
   len = strlen(name);
   f.Write(&len, sizeof(len), 1);
   f.Write(name, sizeof(char), len+1);

   if(type == project)
   {
      // Projects Absolute Path Are Not Saved
      len = 0;
      f.Write(&len, sizeof(len), 1);
      f.Write(&len, sizeof(char), 1);
   }
   else
   {
      len = strlen(path);
      f.Write(&len, sizeof(len), 1);
      f.Write(path, sizeof(char), len+1);
   }
   f.Write(&type, sizeof(type), 1);
   f.Write(&children.count, sizeof(children.count), 1);
   for(child = children.first; child; child.next)
      child.SaveNode(f);
}*/

void ProjectNode::LegacyAsciiSaveNode(File f, char * indentation, char * insidePath)
{
   int len;
   char printPath[MAX_LOCATION];

   if(type == project && (files.count /*|| preprocessorDefs.first*/))
   {
      f.Printf("\n   Files\n");
   }
   else if(type == file)
   {
      if(!strcmp(path, insidePath))
         f.Printf("%s - %s\n", indentation, name);
      else
      {
         strcpy(printPath, path);
         len = strlen(printPath);
         if(len)
            if(printPath[len-1] != '/')
               strcat(printPath, "/");
         strcat(printPath, name);
         f.Printf("%s = %s\n", indentation, printPath);
      }
      if(files.count)
         f.Printf("\nError\n\n");
   }
   else if(type == folder)
   {
      f.Printf("%s + %s\n", indentation, name);
   }
   else if(type == resources && files.count)
   {
      PathCatSlash(insidePath, path);
      f.Printf("\n%sResources\n", indentation);
      if(path && path[0])
         f.Printf("%s   Path = %s\n", indentation, path);
   }
   
   /*if(buildExclusions.first && type != project)
   {
      for(item = buildExclusions.first; item; item = item.next)
      {
         if(item == buildExclusions.first)
            f.Printf("%s      Build Exclusions = %s", indentation, item.name);
         else
            f.Printf(", %s", item.name);
      }
      f.Printf("\n");
   }

   if(preprocessorDefs.first && (type == project || ((type == file || type == folder) && !isInResources)))
   {
      for(item = preprocessorDefs.first; item; item = item.next)
      {
         if(item == preprocessorDefs.first)
            f.Printf("%s%s   Preprocessor Definitions = %s", indentation, type == project ? "" : "   ", item.name);
         else
            f.Printf(", %s", item.name);
      }
      f.Printf("\n");
   }
   */
   
   if(type == project && (files.count /*|| preprocessorDefs.first*/))
   {
      f.Printf("\n");
      for(child : files)
         LegacyAsciiSaveNode(child, f, indentation, insidePath);
   }
   else if(type == folder)
   {
      strcat(indentation, "   ");
      // WHAT WAS THIS: strcpy(printPath, path);
      // TOCHECK: why is Unix/PathCat not used here
      len = strlen(insidePath);
      if(len)
         if(insidePath[len-1] != '/')
            strcat(insidePath, "/");
      strcat(insidePath, name);

      for(child : files)
         LegacyAsciiSaveNode(child, f, indentation, insidePath);
      f.Printf("%s -\n", indentation);
      indentation[strlen(indentation) - 3] = '\0';
      StripLastDirectory(insidePath, insidePath);
   }
   else if(type == resources && files.count)
   {
      f.Printf("\n");
      for(child : files)
         LegacyAsciiSaveNode(child, f, indentation, insidePath);
      StripLastDirectory(insidePath, insidePath);
   }
}

/*
void ProjectConfig::LegacyProjectConfigSave(File f)
{
   char * indentation = "      ";
   //if(isCommonConfig)
      //f.Printf("\n * Common\n");
   //else
      f.Printf("\n + %s\n", name);
   f.Printf("\n   Compiler\n\n");
   if(objDir.expression[0])
      f.Printf("%sIntermediate Directory = %s\n", indentation, objDir.expression);
   f.Printf("%sDebug = %s\n", indentation, (options.debug == true) ? "True" : "False");
   switch(options.optimization)
   {
      // case none:   f.Printf("%sOptimize = %s\n", indentation, "None"); break;
      case speed: f.Printf("%sOptimize = %s\n", indentation, "Speed"); break;
      case size:  f.Printf("%sOptimize = %s\n", indentation, "Size");  break;
   }
   f.Printf("%sAllWarnings = %s\n", indentation, (options.warnings == all) ? "True" : "False");
   if(options.profile)
      f.Printf("%sProfile = %s\n", indentation, (options.profile == true) ? "True" : "False");
   if(options.memoryGuard == true)
      f.Printf("%sMemoryGuard = %s\n", indentation, (options.memoryGuard == true) ? "True" : "False");
   if(options.strictNameSpaces == true)
      f.Printf("%sStrict Name Spaces = %s\n", indentation, (options.strictNameSpaces == true) ? "True" : "False");
   if(options.defaultNameSpace && strlen(options.defaultNameSpace))
      f.Printf("%sDefault Name Space = %s\n", indentation, options.defaultNameSpace);
    TOFIX: Compiler Bug {
      if(options.preprocessorDefinitions.count)
      {
         bool isFirst = true;
         for(item : options.preprocessorDefinitions)
         {
            if(isFirst)
            {
               f.Printf("\n%sPreprocessor Definitions = %s", indentation, item);
               isFirst = false;
            }
            else
               f.Printf(", %s", item);
         }
         f.Printf("\n");
      }
   }
   if(options.includeDirs.count)
   {
      f.Printf("\n%sInclude Directories\n", indentation);
      for(item : options.includeDirs)
         f.Printf("%s - %s\n", indentation, name);
      f.Printf("\n");
   }

   f.Printf("\n%sLinker\n\n", indentation);
   f.Printf("%sTarget Name = %s\n", indentation, options.targetFileName);
   switch(options.targetType)
   {
      case executable:     f.Printf("%sTarget Type = %s\n", indentation, "Executable"); break;
      case sharedLibrary:  f.Printf("%sTarget Type = %s\n", indentation, "Shared");     break;
      case staticLibrary:  f.Printf("%sTarget Type = %s\n", indentation, "Static");     break;
   }
   if(targetDir.expression[0])
      f.Printf("%sTarget Directory = %s\n", indentation, targetDir.expression);
   if(options.console)
      f.Printf("%sConsole = %s\n", indentation, options.console ? "True" : "False");
   if(options.compress)
      f.Printf("%sCompress = %s\n", indentation, options.compress ? "True" : "False");
   if(options.libraries.count)
   {
      bool isFirst = true;
      for(item : options.libraries)
      {
         if(isFirst)
         {
            f.Printf("\n%sLibraries = %s", indentation, name);
            isFirst = false;
         }
         else
            f.Printf(", %s", item);
      }
      f.Printf("\n");
   }
   if(options.libraryDirs.count)
   {
      f.Printf("\n%sLibrary Directories\n\n", indentation);
      for(item : options.libraryDirs)
         f.Printf("       - %s\n", indentation, item);
   }
}

void LegacyAsciiSaveProject(File f, Project project)
{
   char indentation[128*3];
   char path[MAX_LOCATION];

   f.Printf("\nECERE Project File : Format Version 0.1b\n");
   f.Printf("\nDescription\n%s\n.\n", project.description);
   f.Printf("\nLicense\n%s\n.\n", project.license);
   f.Printf("\nModule Name = %s\n", project.moduleName);
   f.Printf("\n   Configurations\n");
   //////////////////////////////////////commonConfig.Save(f, true);
   for(cfg : project.configurations)
      LegacyProjectConfigSave(cfg, f);

   strcpy(indentation, "   ");
   path[0] = '\0';
   LegacyAsciiSaveNode(project.topNode, f, indentation, path);
   // f.Printf("\n");
   delete f;
}
*/

// *** NEW JSON PROJECT FORMAT ***
public enum ProjectNodeType { file, folder };

// *******************************

define PEEK_RESOLUTION = (18.2 * 10);

// On Windows & UNIX
#define SEPS    "/"
#define SEP     '/'

static Array<String> notLinkerOptions
{ [
   "-static-libgcc",
   "-shared",
   "-static",
   "-s",
   "-shared-libgcc",
   "-nostartfiles",
   "-nodefaultlibs",
   "-nostdlib",
   "-pie",
   "-rdynamic",
   "-static-libasan",
   "-static-libtsan",
   "-static libstdc++",
   "-symbolic",
   "-Wl,"
   //"-T ",
   //"-Xlinker ",
   //"-u "
] };

static bool IsLinkerOption(String s)
{
   for(i : notLinkerOptions)
      if(strstr(s, "-Wl,") || !strcmp(s, i))
         return false;
   return true;
}

static byte epjSignature[] = { 'E', 'P', 'J', 0x04, 0x01, 0x12, 0x03, 0x12 };

enum GenMakefilePrintTypes { objects, cObjects, symbols, imports, sources, resources, eCsources };

define WorkspaceExtension = "ews";
define ProjectExtension = "epj";

define stringInFileIncludedFrom = "In file included from ";

void ReplaceSpaces(char * output, char * source)
{
   int c, dc;
   char ch, pch = 0;

   for(c = 0, dc = 0; (ch = source[c]); c++, dc++)
   {
      if(ch == ' ') output[dc++] = '\\';
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

void ReplaceUnwantedMakeChars(char * output, char * source)
{
   int c, dc;
   char ch, pch = 0;

   for(c = 0, dc = 0; (ch = source[c]); c++, dc++)
   {
      if(pch != '$')
      {
         if(ch == '(' || ch == ')') output[dc++] = '\\';
         pch = ch;
      }
      else if(ch == ')')
         pch = 0;
      if(ch == ' ')
         output[dc] = 127;
      else
         output[dc] = ch;
   }
   output[dc] = '\0';
}

static void OutputNoSpace(File f, char * source)
{
   char * output = new char[strlen(source)+1024];
   ReplaceSpaces(output, source);
   f.Puts(output);
   delete output;
}

enum ListOutputMethod { inPlace, newLine, lineEach };

int OutputFileList(File f, char * name, Array<String> list, Map<String, int> varStringLenDiffs, char * prefix)
{
   int numOfBreaks = 0;
   const int breakListLength = 1536;
   const int breakLineLength = 78; // TODO: turn this into an option.

   int c, len, itemCount = 0;
   Array<int> breaks { };
   if(list.count)
   {
      int charCount = 0;
      MapNode<String, int> mn;
      for(c=0; c<list.count; c++)
      {
         len = strlen(list[c]) + 3;
         if(strstr(list[c], "$(") && varStringLenDiffs && varStringLenDiffs.count)
         {
            for(mn = varStringLenDiffs.root.minimum; mn; mn = mn.next)
            {
               if(strstr(list[c], mn.key))
                  len += mn.value;
            }
         }
         if(charCount + len > breakListLength)
         {
            breaks.Add(itemCount);
            itemCount = 0;
            charCount = len;
         }
         itemCount++;
         charCount += len;
      }
      if(itemCount)
         breaks.Add(itemCount);
      numOfBreaks = breaks.count;
   }

   if(numOfBreaks > 1)
   {
      f.Printf("%s =%s%s", name, prefix ? " " : "", prefix ? prefix : "");
      for(c=0; c<numOfBreaks; c++)
         f.Printf(" $(%s%d)", name, c+1);
      f.Puts("\n");
   }
   else
      f.Printf("%s =%s%s", name, prefix ? " " : "", prefix ? prefix : "");

   if(numOfBreaks)
   {
      int n, offset = 0;

      for(c=0; c<numOfBreaks; c++)
      {
         if(numOfBreaks > 1)
            f.Printf("%s%d =", name, c+1);
         
         len = 3;
         itemCount = breaks[c];
         for(n=offset; n<offset+itemCount; n++)
         {
            if(false) // TODO: turn this into an option.
            {
               int itemLen = strlen(list[n]);
               if(len > 3 && len + itemLen > breakLineLength)
               {
                  f.Printf(" \\\n\t%s", list[n]);
                  len = 3;
               }
               else
               {
                  len += itemLen;
                  f.Printf(" %s", list[n]);
               }
            }
            else
               f.Printf(" \\\n\t%s", list[n]);
         }
         offset += itemCount;
         f.Puts("\n");
      }
      list.Free();
      list.count = 0;
   }
   else
      f.Puts("\n");
   f.Puts("\n");
   delete breaks;
   return numOfBreaks;
}

void OutputLinkObjectActions(File f, char * name, int parts)
{
   if(parts > 1)
   {
      int c;
      for(c=0; c<parts; c++)
         f.Printf("\t@$(call echo,$(%s%d)) >> $(OBJ)linkobjects.lst\n", name, c+1);
   } else if(parts) {
      f.Printf("\t@$(call echo,$(%s)) >> $(OBJ)linkobjects.lst\n", name);
   }
}

void OutputCleanActions(File f, char * name, int parts)
{
   if(parts > 1)
   {
      int c;
      for(c=0; c<parts; c++)
         f.Printf("\t$(call rmq,$(%s%d))\n", name, c+1);
   }
   else
      f.Printf("\t$(call rmq,$(%s))\n", name);
}

void OutputListOption(File f, char * option, Array<String> list, ListOutputMethod method, bool noSpace)
{
   if(list.count)
   {
      if(method == newLine)
         f.Puts(" \\\n\t");
      for(item : list)
      {
         if(method == lineEach)
            f.Puts(" \\\n\t");
         f.Printf(" -%s", option);
         if(noSpace)
            OutputNoSpace(f, item);
         else
            f.Printf("%s", item);
      }
   }
}

void StringNoSpaceToDynamicString(DynamicString s, char * path)
{
   char * output = new char[strlen(path)+1024];
   ReplaceSpaces(output, path);
   s.concat(output);
   delete output;
}

static void OutputLibraries(File f, Array<String> libraries)
{
   for(item : libraries)
   {
      char ext[MAX_EXTENSION];
      char temp[MAX_LOCATION];
      char * s = item;
      bool usedFunction = false;
      GetExtension(item, ext);
      if(!strcmp(ext, "o") || !strcmp(ext, "a"))
         f.Puts(" ");
      else
      {
         if(!strcmp(ext, "so") || !strcmp(ext, "dylib"))
         {
            if(!strncmp(item, "lib", 3))
               strcpy(temp, item + 3);
            else
               strcpy(temp, item);
            StripExtension(temp);
            s = temp;
         } 
         f.Puts(" \\\n\t$(call _L,");
         usedFunction = true;
      }
      OutputNoSpace(f, s);
      if(usedFunction)
         f.Puts(")");
   }
}

void CamelCase(char * string)
{
   int c, len = strlen(string);
   for(c=0; c<len && string[c] >= 'A' && string[c] <= 'Z'; c++)
      string[c] = (char)tolower(string[c]);
}

CompilerConfig GetCompilerConfig()
{
#ifndef MAKEFILE_GENERATOR
   CompilerConfig compiler = null;
   if(ide && ide.workspace)
      compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
   return compiler;
#else
   incref defaultCompiler;
   return defaultCompiler;
#endif
}

define localTargetType = config && config.options && config.options.targetType ?
            config.options.targetType : options && options.targetType ?
            options.targetType : TargetTypes::executable;
define localWarnings = config && config.options && config.options.warnings ?
            config.options.warnings : options && options.warnings ?
            options.warnings : WarningsOption::unset;
define localDebug = config && config.options && config.options.debug ?
            config.options.debug : options && options.debug ?
            options.debug : SetBool::unset;
define localMemoryGuard = config && config.options && config.options.memoryGuard ?
            config.options.memoryGuard : options && options.memoryGuard ?
            options.memoryGuard : SetBool::unset;
define localNoLineNumbers = config && config.options && config.options.noLineNumbers ?
            config.options.noLineNumbers : options && options.noLineNumbers ?
            options.noLineNumbers : SetBool::unset;
define localProfile = config && config.options && config.options.profile ?
            config.options.profile : options && options.profile ?
            options.profile : SetBool::unset;
define localOptimization = config && config.options && config.options.optimization ?
            config.options.optimization : options && options.optimization ?
            options.optimization : OptimizationStrategy::none;
define localFastMath = config && config.options && config.options.fastMath ?
            config.options.fastMath : options && options.fastMath ?
            options.fastMath : SetBool::unset;
define localDefaultNameSpace = config && config.options && config.options.defaultNameSpace ?
            config.options.defaultNameSpace : options && options.defaultNameSpace ?
            options.defaultNameSpace : null;
define localStrictNameSpaces = config && config.options && config.options.strictNameSpaces ?
            config.options.strictNameSpaces : options && options.strictNameSpaces ?
            options.strictNameSpaces : SetBool::unset;
// TODO: I would rather have null here, check if it'll be ok, have the property return "" if required
define localTargetFileName = config && config.options && config.options.targetFileName ?
            config.options.targetFileName : options && options.targetFileName ?
            options.targetFileName : "";
define localTargetDirectory = config && config.options && config.options.targetDirectory && config.options.targetDirectory[0] ?
            config.options.targetDirectory : options && options.targetDirectory && options.targetDirectory[0] ?
            options.targetDirectory : null;
define settingsTargetDirectory = ideSettings && ideSettings.projectDefaultIntermediateObjDir &&
            ideSettings.projectDefaultIntermediateObjDir[0] ?
            ideSettings.projectDefaultIntermediateObjDir : defaultObjDirExpression;
define localObjectsDirectory = config && config.options && config.options.objectsDirectory && config.options.objectsDirectory[0] ?
            config.options.objectsDirectory : options && options.objectsDirectory && options.objectsDirectory[0] ?
            options.objectsDirectory : null;
define settingsObjectsDirectory = ideSettings && ideSettings.projectDefaultIntermediateObjDir &&
            ideSettings.projectDefaultIntermediateObjDir[0] ?
            ideSettings.projectDefaultIntermediateObjDir : defaultObjDirExpression;
define localConsole = config && config.options && config.options.console ?
            config.options.console : options && options.console ?
            options.console : SetBool::unset;
define localCompress = config && config.options && config.options.compress ?
            config.options.compress : options && options.compress ?
            options.compress : SetBool::unset;

define platformTargetType =
         configPOs && configPOs.options && configPOs.options.targetType && configPOs.options.targetType != localTargetType ?
               configPOs.options.targetType :
         projectPOs && projectPOs.options && projectPOs.options.targetType && projectPOs.options.targetType != localTargetType ?
               projectPOs.options.targetType : TargetTypes::unset;


char * PlatformToMakefileTargetVariable(Platform platform)
{
   return platform == win32 ? "WINDOWS_TARGET" :
          platform == tux   ? "LINUX_TARGET"   :
          platform == apple ? "OSX_TARGET"     :
                              "ERROR_BAD_TARGET";
}

char * TargetTypeToMakefileVariable(TargetTypes targetType)
{
   return targetType == executable    ? "executable" :
          targetType == sharedLibrary ? "sharedlib"  :
          targetType == staticLibrary ? "staticlib"  :
                                        "unknown";
}

// Move this to ProjectConfig? null vs Common to consider...
char * GetConfigName(ProjectConfig config)
{
   return config ? config.name : "Common";
}

public enum SingleFileCompileMode { normal, debugPrecompile, debugCompile, debugGenerateSymbols, cObject };

class Project : struct
{
   class_no_expansion;  // To use Find on the Container<Project> in Workspace::projects
                        // We might want to tweak this default behavior of regular classes ?
                        // Expansion/the current default kind of Find matching we want for things like BitmapResource, FontResource (Also regular classes)
public:
   float version;
   String moduleName;

   property char * moduleVersion
   {
      set { delete moduleVersion; if(value && value[0]) moduleVersion = CopyString(value); } // TODO: use CopyString function that filters chars
      get { return moduleVersion ? moduleVersion : ""; }                                     //       version number should only use digits and dots
      isset { return moduleVersion != null && moduleVersion[0]; }                            //       add leading/trailing 0 if value start/ends with dot(s)
   }

   property char * description
   {
      set { delete description; if(value && value[0]) description = CopyString(value); }
      get { return description ? description : ""; }
      isset { return description != null && description[0]; }
   }

   property char * license
   {
      set { delete license; if(value && value[0]) license = CopyString(value); }
      get { return license ? license : ""; }
      isset { return license != null && license[0]; }
   }

   property char * compilerConfigsDir
   {
      set { delete compilerConfigsDir; if(value && value[0]) compilerConfigsDir = CopyString(value); }
      get { return compilerConfigsDir ? compilerConfigsDir : ""; }
      isset { return compilerConfigsDir && compilerConfigsDir[0]; }
   }

   property ProjectOptions options { get { return options; } set { options = value; } isset { return options && !options.isEmpty; } }
   property Array<PlatformOptions> platforms
   {
      get { return platforms; }
      set
      {
         if(platforms) { platforms.Free(); delete platforms; }
         if(value)
         {
            List<PlatformOptions> empty { };
            Iterator<PlatformOptions> it { value };
            platforms = value;
            for(p : platforms; !p.options || p.options.isEmpty) empty.Add(p);
            for(p : empty; it.Find(p)) platforms.Delete(it.pointer);
            delete empty;
         }
      }
      isset
      {
         if(platforms)
         {
            for(p : platforms)
            {
               if(p.options && !p.options.isEmpty)
                  return true;
            }
         }
         return false;
      }
   }
   List<ProjectConfig> configurations;
   LinkList<ProjectNode> files;
   String resourcesPath;
   LinkList<ProjectNode> resources;

private:
   // topNode.name holds the file name (.epj)
   ProjectOptions options;
   Array<PlatformOptions> platforms;
   ProjectNode topNode { type = project, icon = epjFile, files = LinkList<ProjectNode>{ }, project = this };
   ProjectNode resNode;

   ProjectConfig config;
   String filePath;
   // This is the file name stripped of the epj extension
   // It should NOT be edited, saved or loaded anywhere
   String name;

   String description;
   String license;
   String compilerConfigsDir;
   String moduleVersion;

#ifndef MAKEFILE_GENERATOR
   FileMonitor fileMonitor
   {
      this, FileChange { modified = true };
      bool OnFileNotify(FileChange action, char * param)
      {
         fileMonitor.StopMonitoring();
         if(OnProjectModified(action, param))
            fileMonitor.StartMonitoring();
         return true;
      }
   };

   bool StartMonitoring()
   {
      fileMonitor.fileName = filePath;
      fileMonitor.StartMonitoring();
      return true;
   }

   bool StopMonitoring()
   {
      fileMonitor.StopMonitoring();
      return true;
   }

   bool OnProjectModified(FileChange fileChange, char * param)
   {
      char temp[4096];
      sprintf(temp, $"The project %s was modified by another application.\n"
            "Would you like to reload it and lose your changes?", name);
      if(MessageBox { type = yesNo, master = ide,
            text = $"Project has been modified", contents = temp }.Modal() == yes)
      {
         Project project = LoadProject(filePath, config.name);
         if(project)
         {
            ProjectView projectView = ide.projectView;
            DataRow prev = topNode.row ? topNode.row.previous : null;
            FileMonitor fm = fileMonitor;
            bool confirmation = true;

            if(projectView)
            {
               if(projectView.projectSettingsDialog)
               {
                  confirmation = projectView.projectSettingsDialog.CloseConfirmation(true);
                  if(confirmation)
                     projectView.projectSettingsDialog.Destroy(0);
               }
               if(confirmation)
                  projectView.DeleteNode(topNode);
            }
            if(confirmation)
            {
               *this = *project;
               delete fileMonitor;
               fileMonitor = fm;
               topNode.project = this;

               if(projectView)
               {
                  CompilerConfig compiler = ideSettings.GetCompilerConfig(projectView.workspace.compiler);
                  projectView.AddNode(topNode, null);
                  topNode.row.Move(prev);

                  projectView.ShowOutputBuildLog(true);
                  projectView.DisplayCompiler(compiler, false);
                  projectView.ProjectUpdateMakefileForAllConfigs(this);
                  delete compiler;
               }
               eSystem_Delete(project);
            }
            else
               delete project;
         }
         return true;
      }
      return true;
   }

#endif

   // This frees contents without freeing the instance
   // For use from destructor and for file monitor reloading
   // (To work around JSON loader (LoadProject) always returning a new instance)
   void Free()
   {
      if(platforms) { platforms.Free(); delete platforms; }
      if(configurations) { configurations.Free(); delete configurations; }
      if(files) { files.Free(); delete files; }
      if(resources) { resources.Free(); delete resources; }
      delete options;
      delete resourcesPath;

      delete description;
      delete license;
      delete compilerConfigsDir;
      delete moduleName;
      delete moduleVersion;
      delete filePath;
      delete topNode;
      delete name;
   }

   ~Project()
   {
      /* // THIS IS NOW AUTOMATED WITH A project CHECK IN ProjectNode
      topNode.configurations = null;
      topNode.platforms = null;
      topNode.options = null;
      */
      Free();
   }

   property ProjectConfig config
   {
      set
      {
         config = value;
         delete topNode.info;
         topNode.info = CopyString(GetConfigName(config));
      }
   }
   property char * filePath
   {
      set
      {
         if(value)
         {
            char string[MAX_LOCATION];
            GetLastDirectory(value, string);
            delete topNode.name;
            topNode.name = CopyString(string);
            StripExtension(string);
            delete name;
            name = CopyString(string);
            StripLastDirectory(value, string);
            delete topNode.path;
            topNode.path = CopyString(string);
            delete filePath;
            filePath = CopyString(value);
         }
      }
   }

   TargetTypes GetTargetType(ProjectConfig config)
   {
      TargetTypes targetType = localTargetType;
      return targetType;
   }

   bool GetTargetTypeIsSetByPlatform(ProjectConfig config)
   {
      Platform platform;
      for(platform = (Platform)1; platform < Platform::enumSize; platform++)
      {
         PlatformOptions projectPOs, configPOs;
         MatchProjectAndConfigPlatformOptions(config, platform, &projectPOs, &configPOs);
         if(platformTargetType)
            return true;
      }
      return false;
   }


   char * GetObjDirExpression(ProjectConfig config)
   {
      // TODO: Support platform options
      char * expression = localObjectsDirectory;
      if(!expression)
         expression = settingsObjectsDirectory;
      return expression;
   }

   DirExpression GetObjDir(CompilerConfig compiler, ProjectConfig config, int bitDepth)
   {
      char * expression = GetObjDirExpression(config);
      DirExpression objDir { type = intermediateObjectsDir };
      objDir.Evaluate(expression, this, compiler, config, bitDepth);
      return objDir;
   }

   char * GetTargetDirExpression(ProjectConfig config)
   {
      // TODO: Support platform options
      char * expression = localTargetDirectory;
      if(!expression)
         expression = settingsTargetDirectory;
      return expression;
   }

   DirExpression GetTargetDir(CompilerConfig compiler, ProjectConfig config, int bitDepth)
   {
      char * expression = GetTargetDirExpression(config);
      DirExpression targetDir { type = DirExpressionType::targetDir /*intermediateObjectsDir*/};
      targetDir.Evaluate(expression, this, compiler, config, bitDepth);
      return targetDir;
   }

   WarningsOption GetWarnings(ProjectConfig config)
   {
      WarningsOption warnings = localWarnings;
      return warnings;
   }

   bool GetDebug(ProjectConfig config)
   {
      SetBool debug = localDebug;
      return debug == true;
   }

   bool GetMemoryGuard(ProjectConfig config)
   {
      SetBool memoryGuard = localMemoryGuard;
      return memoryGuard == true;
   }

   bool GetNoLineNumbers(ProjectConfig config)
   {
      SetBool noLineNumbers = localNoLineNumbers;
      return noLineNumbers == true;
   }

   bool GetProfile(ProjectConfig config)
   {
      SetBool profile = localProfile;
      return profile == true;
   }

   OptimizationStrategy GetOptimization(ProjectConfig config)
   {
      OptimizationStrategy optimization = localOptimization;
      return optimization;
   }

   bool GetFastMath(ProjectConfig config)
   {
      SetBool fastMath = localFastMath;
      return fastMath == true;
   }

   String GetDefaultNameSpace(ProjectConfig config)
   {
      String defaultNameSpace = localDefaultNameSpace;
      return defaultNameSpace;
   }

   bool GetStrictNameSpaces(ProjectConfig config)
   {
      SetBool strictNameSpaces = localStrictNameSpaces;
      return strictNameSpaces == true;
   }

   String GetTargetFileName(ProjectConfig config)
   {
      String targetFileName = localTargetFileName;
      return targetFileName;
   }

   //String targetDirectory;
   //String objectsDirectory;
   bool GetConsole(ProjectConfig config)
   {
      SetBool console = localConsole;
      return console == true;
   }

   bool GetCompress(ProjectConfig config)
   {
      SetBool compress = localCompress;
      return compress == true;
   }
   //SetBool excludeFromBuild;

   bool GetConfigIsInActiveDebugSession(ProjectConfig config)
   {
#ifndef MAKEFILE_GENERATOR
      return ide.project == this && ide.debugger && ide.debugger.prjConfig == config && ide.debugger.isActive;
#endif
   }

   bool GetConfigIsInDebugSession(ProjectConfig config)
   {
#ifndef MAKEFILE_GENERATOR
      return ide.project == this && ide.debugger && ide.debugger.prjConfig == config && ide.debugger.isPrepared;
#endif
   }

   void SetPath(bool projectsDirs, CompilerConfig compiler, ProjectConfig config, int bitDepth)
   {
#ifndef MAKEFILE_GENERATOR
      ide.SetPath(projectsDirs, compiler, config, bitDepth);
#endif
   }

#ifndef MAKEFILE_GENERATOR
   bool Save(char * fileName)
   {
      File f;
      /*char output[MAX_LOCATION];
       ChangeExtension(fileName, "json", output);
      f = FileOpen(output, write);*/
      f = FileOpen(fileName, write);
      if(f)
      {
         files = topNode.files;
         resources = resNode.files;
         resourcesPath = resNode.path;

         files.Remove(resNode);
         version = 0.2f;

         WriteJSONObject(f, class(Project), this, 0);

         files.Add(resNode);

         files = null;
         resources = null;
         resourcesPath = null;
         delete f;
      }
      return true;
   }
#endif

   // This method is only called from Debugger, should be moved to Debugger class?
#ifndef MAKEFILE_GENERATOR
   bool GetRelativePath(char * filePath, char * relativePath)
   {
      ProjectNode node;
      char moduleName[MAX_FILENAME];
      GetLastDirectory(filePath, moduleName);
      // try with workspace dir first?
      if((node = topNode.Find(moduleName, false)))
      {
         strcpy(relativePath, strcmp(node.path, ".") ? node.path : "");
         PathCatSlash(relativePath, node.name);
         return true;
      }
      else
      {
         // Tweak for automatically resolving symbol loader modules
         char * sl = strstr(moduleName, ".main.ec");
         if(sl && (*sl = 0, !strcmpi(moduleName, name)))
         {
            char objDir[MAX_LOCATION];
            DirExpression objDirExp;
            CompilerConfig compiler = ide.debugger.currentCompiler;
            ProjectConfig config = ide.debugger.prjConfig;
            int bitDepth = ide.debugger.bitDepth;
            // This is not perfect, as multiple source files exist for the symbol loader module...
            // We try to set it in the debug config object directory.
            if(!compiler || !config)
            {
               // If we're not currently debugging, set a breakpoint in the active compiler/config
               compiler = GetCompilerConfig();
               config = this.config;
               // If the current config is not debuggable, set it in the first debuggable config found
               if(config && !config.options.debug)
               {
                  for(c : configurations; c.options.debug)
                  {
                     config = c;
                     break;
                  }
               }
            }
            objDirExp = GetObjDir(compiler, config, bitDepth);
            strcpy(objDir, objDirExp.dir);
            delete objDirExp;
            ChangeCh(objDir, '\\', '/'); // TODO: this is a hack, paths should never include win32 path seperators - fix this in ProjectSettings and ProjectLoad instead
            ReplaceSpaces(objDir, objDir);
            strcpy(relativePath, objDir);
            *sl = '.';
            PathCatSlash(relativePath, moduleName);
            return true;
         }
      }
      // WARNING: On failure, relative path is uninitialized
      return false;   
   }
#endif

   void CatTargetFileName(char * string, CompilerConfig compiler, ProjectConfig config)
   {
      TargetTypes targetType = GetTargetType(config);
      String targetFileName = GetTargetFileName(config);
      if(targetType == staticLibrary)
      {
         PathCatSlash(string, "lib");
         strcat(string, targetFileName);
      }
      else if(compiler.targetPlatform != win32 && targetType == sharedLibrary)
      {
         PathCatSlash(string, "lib");
         strcat(string, targetFileName);
      }
      else
         PathCatSlash(string, targetFileName);
      
      switch(targetType)
      {
         case executable:
            if(compiler.targetPlatform == win32)
               strcat(string, ".exe");
            break;
         case sharedLibrary:
            if(compiler.targetPlatform == win32)
               strcat(string, ".dll");
            else if(compiler.targetPlatform == apple)
               strcat(string, ".dylib");
            else
               strcat(string, ".so");
            if(compiler.targetPlatform == tux && GetRuntimePlatform() == tux && moduleVersion && moduleVersion[0])
            {
               strcat(string, ".");
               strcat(string, moduleVersion);
            }
            break;
         case staticLibrary:
            strcat(string, ".a");
            break;
      }
   }

   bool GetProjectCompilerConfigsDir(char * cfDir, bool replaceSpaces, bool makeRelative)
   {
      bool result = false;
      char temp[MAX_LOCATION];
      strcpy(cfDir, topNode.path);
      if(compilerConfigsDir && compilerConfigsDir[0])
      {
         PathCatSlash(cfDir, compilerConfigsDir);
         result = true;
      }
      if(makeRelative)
      {
         strcpy(temp, cfDir);
         // Using a relative path makes it less likely to run into spaces issues
         // Even with escaped spaces, there still seems to be issues including a config file
         // in a path containing spaces

         MakePathRelative(temp, topNode.path, cfDir);
      }

      if(cfDir && cfDir[0] && cfDir[strlen(cfDir)-1] != '/')
         strcat(cfDir, "/");
      if(replaceSpaces)
      {
         strcpy(temp, cfDir);
         ReplaceSpaces(cfDir, temp);
      }
      return result;
   }

   bool GetIDECompilerConfigsDir(char * cfDir, bool replaceSpaces, bool makeRelative)
   {
      char temp[MAX_LOCATION];
      bool result = false;
      strcpy(cfDir, topNode.path);
      if(ideSettings && ideSettings.compilerConfigsDir && ideSettings.compilerConfigsDir[0])
      {
         PathCatSlash(cfDir, ideSettings.compilerConfigsDir);
         result = true;
      }
      else
      {
         // Default to <ProjectDir>/.configs if unset
         PathCatSlash(cfDir, ".configs");
         result = true;
      }
      if(makeRelative)
      {
         strcpy(temp, cfDir);
         // Using a relative path makes it less likely to run into spaces issues
         // Even with escaped spaces, there still seems to be issues including a config file
         // in a path containing spaces
         if(IsPathInsideOf(cfDir, topNode.path))
            MakePathRelative(temp, topNode.path, cfDir);
      }
      if(cfDir && cfDir[0] && cfDir[strlen(cfDir)-1] != '/')
         strcat(cfDir, "/");
      if(replaceSpaces)
      {
         strcpy(temp, cfDir);
         ReplaceSpaces(cfDir, temp);
      }
      return result;
   }

   void CatMakeFileName(char * string, ProjectConfig config)
   {
      char projectName[MAX_LOCATION];
      strcpy(projectName, name);
      sprintf(string, "%s%s%s.Makefile", projectName, config ? "-" : "", config ? config.name : "");
   }

#ifndef MAKEFILE_GENERATOR
   void MarkChanges(ProjectNode node)
   {
      for(cfg : topNode.configurations)
      {
         ProjectConfig c = null;
         for(i : node.configurations; !strcmpi(i.name, cfg.name)) { c = i; break; }

         if(c && ((c.options && cfg.options && cfg.options.console != c.options.console) ||
               (!c.options || !cfg.options)))
            cfg.symbolGenModified = true;

         cfg.makingModified = true;
      }
   }

   void ModifiedAllConfigs(bool making, bool compiling, bool linking, bool symbolGen)
   {
      for(cfg : configurations)
      {
         if(making)
            cfg.makingModified = true;
         if(compiling)
            cfg.compilingModified = true;
         if(linking)
            cfg.linkingModified = true;
         if(symbolGen)
            cfg.symbolGenModified = true;
      }
      if(compiling || linking)
      {
         ide.projectView.modifiedDocument = true;
         ide.workspace.modified = true;
      }
   }
   
   void RotateActiveConfig(bool forward)
   {
      if(configurations.first && configurations.last != configurations.first)
      {
         Iterator<ProjectConfig> cfg { configurations };
         while(forward ? cfg.Next() : cfg.Prev())
            if(cfg.data == config)
               break;

         if(forward)
         {
            if(!cfg.Next())
               cfg.Next();
         }
         else
         {
            if(!cfg.Prev())
               cfg.Prev();
         }

         property::config = cfg.data;
         ide.UpdateToolBarActiveConfigs(true);
         ide.workspace.modified = true;
         ide.projectView.Update(null);
      }
   }

   void ProcessPipeOutputRaw(DualPipe f)
   {
      char line[65536];
      while(!f.Eof() && !ide.ShouldStopBuild())
      {
         bool result = true;
         double lastTime = GetTime();
         bool wait = true;
         while(result)
         {
            if((result = f.Peek()) && (result = f.GetLine(line, sizeof(line)-1)))
            {
               ide.outputView.buildBox.Logf("%s\n", line);
            }
            if(GetTime() - lastTime > 1.0 / PEEK_RESOLUTION) break;
         }
         //printf("Processing Input...\n");
         if(app.ProcessInput(true))
            wait = false;
         app.UpdateDisplay();
         if(wait)
         {
            //printf("Waiting...\n");
            app.Wait();
         }
         //if(!result) Sleep(1.0 / PEEK_RESOLUTION);
      }
      if(ide.ShouldStopBuild())
      {
         ide.outputView.buildBox.Logf($"\nBuild cancelled by user.\n", line);
         f.Terminate();
      }
   }

   bool ProcessBuildPipeOutput(DualPipe f, DirExpression objDirExp, bool isARun, List<ProjectNode> onlyNodes,
      CompilerConfig compiler, ProjectConfig config, int bitDepth)
   {
      char line[65536];
      bool compiling = false, linking = false, precompiling = false;
      int compilingEC = 0;
      int numErrors = 0, numWarnings = 0;
      bool loggedALine = false;
      char * configName = config ? config.name : "Common";
      int lenMakeCommand = strlen(compiler.makeCommand);
      int testLen = 0;

      char * gnuToolchainPrefix = compiler.gnuToolchainPrefix ? compiler.gnuToolchainPrefix : "";

      DynamicString test { };
      DynamicString ecp { };
      DynamicString ecc { };
      DynamicString ecs { };
      DynamicString ear { };
      DynamicString prefix { };
      DynamicString cpp { };
      DynamicString cc { };
      DynamicString cxx { };
      DynamicString strip { };
      DynamicString ar { };
      /*
      if(bitDepth == 64 && compiler.targetPlatform == win32) 
         gnuToolchainPrefix = "x86_64-w64-mingw32-";
      else if(bitDepth == 32 && compiler.targetPlatform == win32)
         gnuToolchainPrefix = "i686-w64-mingw32-";
      */
      ecp.concatx(compiler.ecpCommand, " ");
      ecc.concatx(compiler.eccCommand, " ");
      ecs.concatx(compiler.ecsCommand, " ");
      ear.concatx(compiler.earCommand, " ");

      prefix.concatx(
            compiler.ccacheEnabled ? "ccache " : "",
            compiler.distccEnabled ? "distcc " : "",
            gnuToolchainPrefix);

      cpp.concatx((String)prefix, compiler.cppCommand, " ");
      cc.concatx((String)prefix, compiler.ccCommand,  " ");
      cxx.concatx((String)prefix, compiler.cxxCommand, " ");

      strip.concatx(gnuToolchainPrefix, "strip ");
      ar.concatx(gnuToolchainPrefix, "ar rcs");

      testLen = Max(testLen, ecp.size);
      testLen = Max(testLen, ecc.size);
      testLen = Max(testLen, ecs.size);
      testLen = Max(testLen, ear.size);
      testLen = Max(testLen, cpp.size);
      testLen = Max(testLen, cc.size);
      testLen = Max(testLen, cxx.size);
      testLen = Max(testLen, strip.size);
      testLen = Max(testLen, ar.size);
      testLen++;

      while(!f.Eof() && !ide.ShouldStopBuild())
      {
         bool result = true;
         double lastTime = GetTime();
         bool wait = true;
         while(result)
         {
            //printf("Peeking and GetLine...\n");
            if((result = f.Peek()) && (result = f.GetLine(line, sizeof(line)-1)))
            {
               char * message = null;
               char * inFileIncludedFrom = strstr(line, stringInFileIncludedFrom);
               test.copyLenSingleBlankReplTrim(line, ' ', true, testLen);
               if(strstr(line, compiler.makeCommand) == line && line[lenMakeCommand] == ':')
               {
                  char * module = strstr(line, "No rule to make target `");
                  if(module)
                  {
                     char * end;
                     module = strchr(module, '`') + 1;
                     end = strchr(module, '\'');
                     if(end)
                     {
                        *end = '\0';
                        ide.outputView.buildBox.Logf($"   %s: No such file or directory\n", module);
                        // ide.outputView.buildBox.Logf("error: %s\n   No such file or directory\n", module);
                        numErrors++;
                     }
                  }
                  //else
                  //{
                     //ide.outputView.buildBox.Logf("error: %s\n", line);
                     //numErrors++;
                  //}
               }
               else if(strstr(test, ear) == test);
               else if(strstr(test, strip) == test);
               else if(strstr(test, cc) == test || strstr(test, cxx) == test || strstr(test, ecp) == test || strstr(test, ecc) == test)
               {
                  char moduleName[MAX_FILENAME];
                  byte * tokens[1];
                  char * module;
                  bool isPrecomp = false;
                  bool gotCC = false;

                  if(strstr(test, cc) == test || strstr(test, cxx) == test)
                  {
                     module = strstr(line, " -c ");
                     if(module) module += 4;
                     gotCC = true;
                  }
                  else if(strstr(test, ecc) == test)
                  {
                     module = strstr(line, " -c ");
                     if(module) module += 4;
                     //module = line + 3;
                     // Don't show GCC warnings about generated C code because it does not compile clean yet...
                     compilingEC = 3;//2;
                     gotCC = true;
                  }
                  else if(strstr(test, ecp) == test)
                  {
                     // module = line + 8;
                     module = strstr(line, " -c ");
                     if(module) module += 4;
                     isPrecomp = true;
                     compilingEC = 0;
                     gotCC = true;
                  }

                  loggedALine = true;

                  if(module)
                  {
                     if(!compiling && !isPrecomp)
                     {
                        ide.outputView.buildBox.Logf($"Compiling...\n");
                        compiling = true;
                     }
                     else if(!precompiling && isPrecomp)
                     {
                        ide.outputView.buildBox.Logf($"Generating symbols...\n");
                        precompiling = true;
                     }
                     // Changed escapeBackSlashes here to handle paths with spaces
                     Tokenize(module, 1, tokens, true); // false);
                     GetLastDirectory(module, moduleName);
                     ide.outputView.buildBox.Logf("%s\n", moduleName);
                  }
                  else if((module = strstr(line, " -o ")))
                  {
                     compiling = false;
                     precompiling = false;
                     linking = true;
                     ide.outputView.buildBox.Logf($"Linking...\n");
                  }
                  else
                  {
                     ide.outputView.buildBox.Logf("%s\n", line);
                     if(strstr(line, "warning:") || strstr(line, "note:"))
                        numWarnings++;
                     else if(!gotCC && !strstr(line, "At top level") && !strstr(line, "In file included from"))
                        numErrors++;
                  }

                  if(compilingEC) compilingEC--;
               }
               else if(strstr(test, ar) == test)
                  ide.outputView.buildBox.Logf($"Building library...\n");
               else if(strstr(test, ecs) == test)
                  ide.outputView.buildBox.Logf($"Writing symbol loader...\n");
               else
               {
                  if(linking || compiling || precompiling)
                  {
                     char * colon = strstr(line, ":"); //, * bracket;
                     if(colon && (colon[1] == '/' || colon[1] == '\\'))
                        colon = strstr(colon + 1, ":");
                     if(colon)
                     {
                        char moduleName[MAX_LOCATION], temp[MAX_LOCATION];
                        char * pointer;
                        char * error;
                        char * start = inFileIncludedFrom ? line + strlen(stringInFileIncludedFrom) : line;
                        int len = (int)(colon - start);
                        len = Min(len, MAX_LOCATION-1);
                        // Don't be mistaken by the drive letter colon
                        // Cut module name
                        // TODO: need to fix colon - line gives char *
                        // warning: incompatible expression colon - line (char *); expected int
                        /*
                        strncpy(moduleName, line, (int)(colon - line));
                        moduleName[colon - line] = '\0';
                        */
                        strncpy(moduleName, start, len);
                        moduleName[len] = '\0';
                        // Remove stuff in brackets
                        //bracket = strstr(moduleName, "(");
                        //if(bracket) *bracket = '\0';

                        GetLastDirectory(moduleName, temp);
                        if(linking && (!strcmp(temp, "ld") || !strcmp(temp, "ld.exe")))
                        {
                           if(strstr(colon, "skipping incompatible") || strstr(colon, "Recognised but unhandled"))
                              message = $"Linker Message";
                           else
                           {
                              numErrors++;
                              message = $"Linker Error";
                           }
                        }
                        else
                        {
                           strcpy(temp, topNode.path);
                           PathCatSlash(temp, moduleName);
                           MakePathRelative(temp, topNode.path, moduleName);
                        }
                        error = strstr(line, "error:");
                        if(error && error > colon)
                           numErrors++;
                        else
                        {
                           // Silence warnings for compiled EC
                           char * objDir = strstr(moduleName, objDirExp.dir);
                        
                           if(linking)
                           {
                              if((pointer = strstr(line, "undefined"))  ||
                                   (pointer = strstr(line, "No such file")) ||
                                   (pointer = strstr(line, "token")))
                              {
                                 strncat(moduleName, colon, pointer - colon);
                                 strcat(moduleName, "error: ");
                                 colon = pointer;
                                 numErrors++;
                              }
                           }
                           else if((pointer = strstr(line, "No such file")))
                           {
                              strncat(moduleName, colon, pointer - colon);
                              strcat(moduleName, "error: ");
                              colon = pointer;
                              numErrors++;
                           }
                           else if(compilingEC == 1 || (objDir && objDir == moduleName))
                              continue;
                           else if(strstr(line, "warning:"))
                           {
                              numWarnings++;
                           }
                        }
                        if(message)
                           ide.outputView.buildBox.Logf("   %s: %s\n", message, line);
                        else if(this == ide.workspace.projects.firstIterator.data)
                           ide.outputView.buildBox.Logf("   %s%s\n", moduleName, colon);
                        else
                        {
                           char fullModuleName[MAX_LOCATION];
                           strcpy(fullModuleName, topNode.path);
                           PathCat(fullModuleName, moduleName);
                           MakePathRelative(fullModuleName, ide.workspace.projects.firstIterator.data.topNode.path, fullModuleName);
                           MakeSystemPath(fullModuleName);
                           ide.outputView.buildBox.Logf("   %s%s%s\n", inFileIncludedFrom ? stringInFileIncludedFrom : "", fullModuleName, colon);
                        }
                     }
                     else
                     {
                        ide.outputView.buildBox.Logf("%s\n", line);
                        linking = compiling = precompiling = false;
                     }
                  }
                  else
                     ide.outputView.buildBox.Logf("%s\n", line);
               }
               wait = false;
            }
            //printf("Done getting line\n");
            if(GetTime() - lastTime > 1.0 / PEEK_RESOLUTION) break;
         }
         //printf("Processing Input...\n");
         if(app.ProcessInput(true))
            wait = false;
         app.UpdateDisplay();
         if(wait)
         {
            //printf("Waiting...\n");
            app.Wait();
         }
         //if(!result) Sleep(1.0 / PEEK_RESOLUTION);
      }
      if(ide.ShouldStopBuild())
      {
         ide.outputView.buildBox.Logf($"\nBuild cancelled by user.\n", line);
         f.Terminate();
      }
      else if(loggedALine || !isARun)
      {
         if(f.GetExitCode() && !numErrors)
         {
            bool result = f.GetLine(line, sizeof(line)-1);
            ide.outputView.buildBox.Logf($"Fatal Error: child process terminated unexpectedly\n");
         }
         else
         {
            if(!onlyNodes)
            {
               char targetFileName[MAX_LOCATION];
               targetFileName[0] = '\0';
               CatTargetFileName(targetFileName, compiler, config);
               ide.outputView.buildBox.Logf("\n%s (%s) - ", targetFileName, configName);
            }
            if(numErrors)
               ide.outputView.buildBox.Logf("%d %s, ", numErrors, (numErrors > 1) ? $"errors" : $"error");
            else
               ide.outputView.buildBox.Logf($"no error, ");
   
            if(numWarnings)
               ide.outputView.buildBox.Logf("%d %s\n", numWarnings, (numWarnings > 1) ? $"warnings" : $"warning");
            else
               ide.outputView.buildBox.Logf($"no warning\n");
         }
      }

      delete test;
      delete ecp;
      delete ecc;
      delete ecs;
      delete ear;
      delete prefix;
      delete cpp;
      delete cc;
      delete cxx;
      delete strip;
      delete ar;

      return numErrors == 0;
   }

   void ProcessCleanPipeOutput(DualPipe f, CompilerConfig compiler, ProjectConfig config)
   {
      char line[65536];
      int lenMakeCommand = strlen(compiler.makeCommand);
      while(!f.Eof())
      {
         bool result = true;
         bool wait = true;
         double lastTime = GetTime();
         while(result)
         {
            if((result = f.Peek()) && (result = f.GetLine(line, sizeof(line)-1)))
            {
               if(strstr(line, compiler.makeCommand) == line && line[lenMakeCommand] == ':');
               else if(strstr(line, "del") == line);
               else if(strstr(line, "rm") == line);
               else if(strstr(line, "Could Not Find") == line);
               else
               {
                  ide.outputView.buildBox.Logf(line);
                  ide.outputView.buildBox.Logf("\n");
               }
               wait = false;
            }
            if(GetTime() - lastTime > 1.0 / PEEK_RESOLUTION) break;
         }
         if(app.ProcessInput(true))
            wait = false;
         app.UpdateDisplay();
         if(wait)
            app.Wait();
         //Sleep(1.0 / PEEK_RESOLUTION);
      }
   }

   bool Build(bool isARun, List<ProjectNode> onlyNodes, CompilerConfig compiler, ProjectConfig config, int bitDepth, bool justPrint, SingleFileCompileMode mode)
   {
      bool result = false;
      DualPipe f;
      char targetFileName[MAX_LOCATION] = "";
      DynamicString makeTargets { };
      char makeFile[MAX_LOCATION];
      char makeFilePath[MAX_LOCATION];
      char configName[MAX_LOCATION];
      DirExpression objDirExp = GetObjDir(compiler, config, bitDepth);
      PathBackup pathBackup { };
      bool crossCompiling = (compiler.targetPlatform != GetRuntimePlatform());
      char * targetPlatform = crossCompiling ? (char *)compiler.targetPlatform : "";

      int numJobs = compiler.numJobs;
      char command[MAX_F_STRING];
      char * compilerName;

      compilerName = CopyString(compiler.name);
      CamelCase(compilerName);

      strcpy(configName, config ? config.name : "Common");

      SetPath(false, compiler, config, bitDepth); //true
      CatTargetFileName(targetFileName, compiler, config);

      strcpy(makeFilePath, topNode.path);
      CatMakeFileName(makeFile, config);
      PathCatSlash(makeFilePath, makeFile);

      // TODO: TEST ON UNIX IF \" around makeTarget is ok
      if(onlyNodes)
      {
         if(compiler.type.isVC)
         {
            PrintLn("compiling a single file is not yet supported");
         }
         else
         {
            int len;
            char pushD[MAX_LOCATION];
            char cfDir[MAX_LOCATION];
            Map<String, NameCollisionInfo> namesInfo { };
            GetIDECompilerConfigsDir(cfDir, true, true);
            GetWorkingDir(pushD, sizeof(pushD));
            ChangeWorkingDir(topNode.path);
            // Create object dir if it does not exist already
            if(!FileExists(objDirExp.dir).isDirectory)
            {
               sprintf(command, "%s CF_DIR=\"%s\"%s%s%s%s COMPILER=%s objdir -C \"%s\"%s -f \"%s\"",
                     compiler.makeCommand, cfDir,
                     crossCompiling ? " TARGET_PLATFORM=" : "",
                     targetPlatform,
                     bitDepth ? " ARCH=" : "", bitDepth == 32 ? "32" : bitDepth == 64 ? "64" : "",
                     /*(bitDepth == 64 && compiler.targetPlatform == win32) ? " GCC_PREFIX=x86_64-w64-mingw32-" : (bitDepth == 32 && compiler.targetPlatform == win32) ? " GCC_PREFIX=i686-w64-mingw32-" : */"",

                     compilerName, topNode.path, justPrint ? " -n" : "", makeFilePath);
               if(justPrint)
                  ide.outputView.buildBox.Logf("%s\n", command);
               Execute(command);
            }

            ChangeWorkingDir(pushD);

            topNode.GenMakefileGetNameCollisionInfo(namesInfo, config);
            for(node : onlyNodes)
            {
               if(node.GetIsExcluded(config))
                  ide.outputView.buildBox.Logf($"File %s is excluded from current build configuration.\n", node.name);
               else
               {
                  node.DeleteIntermediateFiles(compiler, config, bitDepth, namesInfo, mode == cObject ? true : false);
                  node.GetTargets(config, namesInfo, objDirExp.dir, makeTargets);
               }
            }
            namesInfo.Free();
            delete namesInfo;
         }
      }

      if(compiler.type.isVC)
      {
         bool result = false;
         char oldwd[MAX_LOCATION];
         GetWorkingDir(oldwd, sizeof(oldwd));
         ChangeWorkingDir(topNode.path);

         // TODO: support justPrint
         sprintf(command, "%s /useenv /nologo /logcommands %s.sln %s|Win32", compiler.makeCommand, name, config.name);
         if(justPrint)
            ide.outputView.buildBox.Logf("%s\n", command);
         if((f = DualPipeOpen(PipeOpenMode { output = true, error = true, input = true }, command)))
         {
            ProcessPipeOutputRaw(f);
            delete f;
            result = true;
         }
         ChangeWorkingDir(oldwd);
      }
      else
      {
         char cfDir[MAX_LOCATION];
         GetIDECompilerConfigsDir(cfDir, true, true);
         sprintf(command, "%s %sCF_DIR=\"%s\"%s%s%s%s%s COMPILER=%s -j%d %s%s%s -C \"%s\"%s -f \"%s\"",
               compiler.makeCommand,
               mode == debugPrecompile ? "ECP_DEBUG=y " : mode == debugCompile ? "ECC_DEBUG=y " : mode == debugGenerateSymbols ? "ECS_DEBUG=y " : "",
               cfDir,
               crossCompiling ? " TARGET_PLATFORM=" : "",
               targetPlatform,
               bitDepth ? " ARCH=" : "",
               bitDepth == 32 ? "32" : bitDepth == 64 ? "64" : "",
               /*(bitDepth == 64 && compiler.targetPlatform == win32) ? " GCC_PREFIX=x86_64-w64-mingw32-" : (bitDepth == 32 && compiler.targetPlatform == win32) ? " GCC_PREFIX=i686-w64-mingw32-" :*/ "",
               compilerName, numJobs,
               compiler.ccacheEnabled ? "CCACHE=y " : "",
               compiler.distccEnabled ? "DISTCC=y " : "",
               (String)makeTargets, topNode.path, (justPrint || (mode != normal && mode != cObject)) ? " -n" : "", makeFilePath);
         if(justPrint)
            ide.outputView.buildBox.Logf("%s\n", command);
         if((f = DualPipeOpen(PipeOpenMode { output = true, error = true, input = true }, command)))
         {
            bool found = false;
            if(justPrint)
            {
               ProcessPipeOutputRaw(f);
               result = true;
            }
            else if(mode != normal && mode != cObject)
            {
               char line[65536];
               while(!f.Eof())
               {
                  bool result = true;
                  while(result)
                  {
                     if((result = f.Peek()) && (result = f.GetLine(line, sizeof(line)-1)))
                     {
                        if(!found && strstr(line, "ide ") == line)
                        {
                           strcpy(command, line);
                           found = true;
                        }
                     }
                  }
               }
            }
            else
               result = ProcessBuildPipeOutput(f, objDirExp, isARun, onlyNodes, compiler, config, bitDepth);
            delete f;
            if(found)
               Execute(command);
         }
         else
            ide.outputView.buildBox.Logf($"Error executing make (%s) command\n", compiler.makeCommand);
      }

      delete pathBackup;
      delete objDirExp;
      delete compilerName;
      delete makeTargets;
      return result;
   }

   void Clean(CompilerConfig compiler, ProjectConfig config, int bitDepth, CleanType cleanType, bool justPrint)
   {
      char makeFile[MAX_LOCATION];
      char makeFilePath[MAX_LOCATION];
      char command[MAX_LOCATION];
      char * compilerName;
      DualPipe f;
      PathBackup pathBackup { };
      bool crossCompiling = (compiler.targetPlatform != GetRuntimePlatform());
      char * targetPlatform = crossCompiling ? (char *)compiler.targetPlatform : "";

      compilerName = CopyString(compiler.name);
      CamelCase(compilerName);

      SetPath(false, compiler, config, bitDepth);

      strcpy(makeFilePath, topNode.path);
      CatMakeFileName(makeFile, config);
      PathCatSlash(makeFilePath, makeFile);
      
      if(compiler.type.isVC)
      {
         bool result = false;
         char oldwd[MAX_LOCATION];
         GetWorkingDir(oldwd, sizeof(oldwd));
         ChangeWorkingDir(topNode.path);
         
         // TODO: justPrint support
         sprintf(command, "%s /useenv /clean /nologo /logcommands %s.sln %s|Win32", compiler.makeCommand, name, config.name);
         if(justPrint)
            ide.outputView.buildBox.Logf("%s\n", command);
         if((f = DualPipeOpen(PipeOpenMode { output = true, error = true, input = true }, command)))
         {
            ProcessPipeOutputRaw(f);
            delete f;
            result = true;
         }
         ChangeWorkingDir(oldwd);
         return result;
      }
      else
      {
         char cfDir[MAX_LOCATION];
         GetIDECompilerConfigsDir(cfDir, true, true);
         sprintf(command, "%s CF_DIR=\"%s\"%s%s%s%s COMPILER=%s %sclean%s -C \"%s\"%s -f \"%s\"",
               compiler.makeCommand, cfDir,
               crossCompiling ? " TARGET_PLATFORM=" : "", targetPlatform,
               bitDepth ? " ARCH=" : "", bitDepth == 32 ? "32" : bitDepth == 64 ? "64" : "",
               compilerName,
               cleanType == realClean ? "real" : "", cleanType == cleanTarget ? "target" : "",
               topNode.path, justPrint ? " -n": "", makeFilePath);
         if(justPrint)
            ide.outputView.buildBox.Logf("%s\n", command);
         if((f = DualPipeOpen(PipeOpenMode { output = 1, error = 1, input = 2 }, command)))
         {
            ide.outputView.buildBox.Tell($"Deleting target and object files...");
            if(justPrint)
               ProcessPipeOutputRaw(f);
            else
               ProcessCleanPipeOutput(f, compiler, config);
            delete f;

            ide.outputView.buildBox.Logf($"Target and object files deleted\n");
         }
      }

      delete pathBackup;
      delete compilerName;
   }

   void Run(char * args, CompilerConfig compiler, ProjectConfig config, int bitDepth)
   {   
      String target = new char[maxPathLen];
      char oldDirectory[MAX_LOCATION];
      char * executableLauncher = compiler.executableLauncher;
      DirExpression targetDirExp = GetTargetDir(compiler, config, bitDepth);
      PathBackup pathBackup { };

      // Build(project, ideMain, true, null, false);

   #if defined(__WIN32__)
      strcpy(target, topNode.path);
   #else
      strcpy(target, "");
   #endif
      PathCatSlash(target, targetDirExp.dir);
      CatTargetFileName(target, compiler, config);
      sprintf(target, "%s %s", target, args);
      GetWorkingDir(oldDirectory, MAX_LOCATION);

      if(strlen(ide.workspace.debugDir))
      {
         char temp[MAX_LOCATION];
         strcpy(temp, topNode.path);
         PathCatSlash(temp, ide.workspace.debugDir);
         ChangeWorkingDir(temp);
      }
      else
         ChangeWorkingDir(topNode.path);
      // ChangeWorkingDir(topNode.path);
      SetPath(true, compiler, config, bitDepth);
      if(executableLauncher)
      {
         char * prefixedTarget = new char[strlen(executableLauncher) + strlen(target) + 2];
         prefixedTarget[0] = '\0';
         strcat(prefixedTarget, executableLauncher);
         strcat(prefixedTarget, " ");
         strcat(prefixedTarget, target);
         Execute(prefixedTarget);
         delete prefixedTarget;
      }
      else
         Execute(target);

      ChangeWorkingDir(oldDirectory);
      delete pathBackup;

      delete targetDirExp;
      delete target;
   }

   void Compile(List<ProjectNode> nodes, CompilerConfig compiler, ProjectConfig config, int bitDepth, bool justPrint, SingleFileCompileMode mode)
   {
      Build(false, nodes, compiler, config, bitDepth, justPrint, mode);
   }
#endif

   void GetMakefileTargetFileName(TargetTypes targetType, char * fileName, ProjectConfig config)
   {
      fileName[0] = '\0';
      if(targetType == staticLibrary || targetType == sharedLibrary)
         strcat(fileName, "$(LP)");
      // !!! ReplaceSpaces must be done after all PathCat calls !!!
      // ReplaceSpaces(s, GetTargetFileName(config));
      strcat(fileName, GetTargetFileName(config));
      switch(targetType)
      {
         case executable:
            strcat(fileName, "$(E)");
            break;
         case sharedLibrary:
            strcat(fileName, "$(SO)$(VER)");
            break;
         case staticLibrary:
            strcat(fileName, "$(A)");
            break;
      }
   }

   bool GenerateCrossPlatformMk(File altCrossPlatformMk)
   {
      bool result = false;
      char path[MAX_LOCATION];

      if(!GetProjectCompilerConfigsDir(path, false, false))
         GetIDECompilerConfigsDir(path, false, false);

      if(!FileExists(path).isDirectory)
      {
         MakeDir(path);
         {
            char dirName[MAX_FILENAME];
            GetLastDirectory(path, dirName);
            if(!strcmp(dirName, ".configs"))
               FileSetAttribs(path, FileAttribs { isHidden = true });
         }
      }
      PathCatSlash(path, "crossplatform.mk");

      if(FileExists(path))
         DeleteFile(path);
      {
         File include = altCrossPlatformMk ? altCrossPlatformMk : FileOpen(":crossplatform.mk", read);
         if(include)
         {
            File f = FileOpen(path, write);
            if(f)
            {
               include.Seek(0, start);
               for(; !include.Eof(); )
               {
                  char buffer[4096];
                  int count = include.Read(buffer, 1, 4096);
                  f.Write(buffer, 1, count);
               }
               delete f;

               result = true;
            }
            if(!altCrossPlatformMk)
               delete include;
         }
      }
      return result;
   }

   bool GenerateCompilerCf(CompilerConfig compiler)
   {
      bool result = false;
      char path[MAX_LOCATION];
      char * name;
      char * compilerName;
      bool gccCompiler = compiler.ccCommand && (strstr(compiler.ccCommand, "gcc") != null || strstr(compiler.ccCommand, "g++") != null);
      char * gnuToolchainPrefix = compiler.gnuToolchainPrefix ? compiler.gnuToolchainPrefix : "";
      Platform platform = compiler.targetPlatform;

      compilerName = CopyString(compiler.name);
      CamelCase(compilerName);
      name = PrintString(platform, "-", compilerName, ".cf");

      if(!GetProjectCompilerConfigsDir(path, false, false))
         GetIDECompilerConfigsDir(path, false, false);

      if(!FileExists(path).isDirectory)
      {
         MakeDir(path);
         {
            char dirName[MAX_FILENAME];
            GetLastDirectory(path, dirName);
            if(!strcmp(dirName, ".configs"))
               FileSetAttribs(path, FileAttribs { isHidden = true });
         }
      }
      PathCatSlash(path, name);

      if(FileExists(path))
         DeleteFile(path);
      {
         File f = FileOpen(path, write);
         if(f)
         {
            if(compiler.environmentVars && compiler.environmentVars.count)
            {
               f.Puts("# ENVIRONMENT VARIABLES\n");
               f.Puts("\n");
               for(e : compiler.environmentVars)
               {
                  f.Printf("export %s := %s\n", e.name, e.string);
               }
            }

            f.Puts("# TOOLCHAIN\n");
            f.Puts("\n");

            if(gnuToolchainPrefix && gnuToolchainPrefix[0])
            {
               f.Printf("GCC_PREFIX := %s\n", gnuToolchainPrefix);
               f.Puts("\n");
            }
            if(compiler.sysroot && compiler.sysroot[0])
            {
               f.Printf("SYSROOT := %s\n", compiler.sysroot);
               // Moved this to crossplatform.mk
               //f.Puts("_SYSROOT := $(space)--sysroot=$(SYSROOT)\n");
               f.Puts("\n");
            }

            //f.Printf("SHELL := %s\n", "sh"/*compiler.shellCommand*/); // is this really needed?
            f.Printf("CPP := $(CCACHE_COMPILE)$(DISTCC_COMPILE)$(GCC_PREFIX)%s$(_SYSROOT)\n", compiler.cppCommand);
            f.Printf("CC := $(CCACHE_COMPILE)$(DISTCC_COMPILE)$(GCC_PREFIX)%s$(_SYSROOT)\n", compiler.ccCommand);
            f.Printf("CXX := $(CCACHE_COMPILE)$(DISTCC_COMPILE)$(GCC_PREFIX)%s$(_SYSROOT)\n", compiler.cxxCommand);
            f.Printf("ECP := $(if $(ECP_DEBUG),ide -debug-start $(ECERE_SDK_SRC)/compiler/ecp/ecp.epj -@,%s)\n", compiler.ecpCommand);
            f.Printf("ECC := $(if $(ECC_DEBUG),ide -debug-start $(ECERE_SDK_SRC)/compiler/ecc/ecc.epj -@,%s)$(if $(CROSS_TARGET), -t $(TARGET_PLATFORM),)\n", compiler.eccCommand);
            f.Printf("ECS := $(if $(ECS_DEBUG),ide -debug-start $(ECERE_SDK_SRC)/compiler/ecs/ecs.epj -@,%s)$(if $(CROSS_TARGET), -t $(TARGET_PLATFORM),)\n", compiler.ecsCommand);
            f.Printf("EAR := %s\n", compiler.earCommand);

            f.Puts("AS := $(GCC_PREFIX)as\n");
            f.Puts("LD := $(GCC_PREFIX)ld\n");
            f.Puts("AR := $(GCC_PREFIX)ar\n");
            f.Puts("STRIP := $(GCC_PREFIX)strip\n");
            f.Puts("UPX := upx\n");
            f.Puts("\n");

            f.Puts("UPXFLAGS = -9\n"); // TOFEAT: Compression Level Option? Other UPX Options?
            f.Puts("\n");

            f.Puts("EARFLAGS = \n");
            f.Puts("\n");

            f.Puts("ifndef ARCH\n");
            f.Puts("TARGET_ARCH :=$(shell $(CC) -dumpmachine)\n");
            f.Puts(" ifdef WINDOWS_HOST\n");
            f.Puts("  ifneq ($(filter x86_64%,$(TARGET_ARCH)),)\n");
            f.Puts("     TARGET_ARCH := x86_64\n");
            f.Puts("  else\n");
            f.Puts("     TARGET_ARCH := i386\n");
            f.Puts("  endif\n");
            f.Puts(" endif\n");
            f.Puts("endif\n\n");

            f.Puts("# HARD CODED TARGET_PLATFORM-SPECIFIC OPTIONS\n");
            f.Printf("LDFLAGS +=$(if $(%s), -Wl$(comma)--no-undefined,)\n", PlatformToMakefileTargetVariable(tux));
            f.Puts("\n");

            // JF's
            f.Printf("LDFLAGS +=$(if $(%s), -framework cocoa -framework OpenGL,)\n", PlatformToMakefileTargetVariable(apple));

            if(gccCompiler)
            {
               f.Puts("\nCFLAGS += -fmessage-length=0\n");
            }

            if(compiler.includeDirs && compiler.includeDirs.count)
            {
               f.Puts("\nCFLAGS +=");
               OutputListOption(f, gccCompiler ? "isystem " : "I", compiler.includeDirs, lineEach, true);
               f.Puts("\n");
            }
            if(compiler.prepDirectives && compiler.prepDirectives.count)
            {
               f.Puts("\nCFLAGS +=");
               OutputListOption(f, "D", compiler.prepDirectives, inPlace, true);
               f.Puts("\n");
            }
            if(compiler.libraryDirs && compiler.libraryDirs.count)
            {
               f.Puts("\nLDFLAGS +=");
               OutputListOption(f, "L", compiler.libraryDirs, lineEach, true);
               // We would need a bool option to know whether we want to add to rpath as well...
               // OutputListOption(f, "Wl,-rpath ", compiler.libraryDirs, lineEach, true);
               f.Puts("\n");
            }
            if(compiler.excludeLibs && compiler.excludeLibs.count)
            {
               f.Puts("\nEXCLUDED_LIBS =");
               for(l : compiler.excludeLibs)
               {
                  f.Puts(" ");
                  f.Puts(l);
               }
            }
            if(compiler.linkerFlags && compiler.linkerFlags.count)
            {
               f.Puts("\nLDFLAGS +=");
               OutputListOption(f, "Wl,", compiler.linkerFlags, inPlace, true);
               f.Puts("\n");
            }
            f.Puts("\n");
            f.Puts("\nOFLAGS += $(LDFLAGS)");
            f.Puts("\n");
            f.Puts("ifdef ARCH_FLAGS\n");
            f.Puts("CFLAGS += $(ARCH_FLAGS)\n");
            f.Puts("OFLAGS += $(ARCH_FLAGS)\n");
            f.Puts("endif\n");

            delete f;

            result = true;
         }
      }
      delete name;
      delete compilerName;
      return result;
   }

   bool GenerateMakefile(char * altMakefilePath, bool noResources, char * includemkPath, ProjectConfig config)
   {
      bool result = false;
      char filePath[MAX_LOCATION];
      char makeFile[MAX_LOCATION];
      // PathBackup pathBackup { };
      // char oldDirectory[MAX_LOCATION];
      File f = null;

      if(!altMakefilePath)
      {
         strcpy(filePath, topNode.path);
         CatMakeFileName(makeFile, config);
         PathCatSlash(filePath, makeFile);
      }

      f = FileOpen(altMakefilePath ? altMakefilePath : filePath, write);

      /*SetPath(false, compiler, config);
      GetWorkingDir(oldDirectory, MAX_LOCATION);
      ChangeWorkingDir(topNode.path);*/

      if(f)
      {
         bool test;
         int ifCount;
         Platform platform;
         char targetDir[MAX_LOCATION];
         char objDirExpNoSpaces[MAX_LOCATION];
         char objDirNoSpaces[MAX_LOCATION];
         char resDirNoSpaces[MAX_LOCATION];
         char targetDirExpNoSpaces[MAX_LOCATION];
         char fixedModuleName[MAX_FILENAME];
         char fixedConfigName[MAX_FILENAME];
         int c, len;
         // Non-zero if we're building eC code
         // We'll have to be careful with this when merging configs where eC files can be excluded in some configs and included in others
         int numCObjects = 0;
         int numObjects = 0;
         bool containsCXX = false; // True if the project contains a C++ file
         bool sameObjTargetDirs;
         String objDirExp = GetObjDirExpression(config);
         TargetTypes targetType = GetTargetType(config);

         char cfDir[MAX_LOCATION];
         int objectsParts = 0, eCsourcesParts = 0;
         Array<String> listItems { };
         Map<String, int> varStringLenDiffs { };
         Map<String, NameCollisionInfo> namesInfo { };

         Map<String, int> cflagsVariations { };
         Map<intptr, int> nodeCFlagsMapping { };

         Map<String, int> ecflagsVariations { };
         Map<intptr, int> nodeECFlagsMapping { };

         ReplaceSpaces(objDirNoSpaces, objDirExp);
         strcpy(targetDir, GetTargetDirExpression(config));
         ReplaceSpaces(targetDirExpNoSpaces, targetDir);

         strcpy(objDirExpNoSpaces, GetObjDirExpression(config));
         ChangeCh(objDirExpNoSpaces, '\\', '/'); // TODO: this is a hack, paths should never include win32 path seperators - fix this in ProjectSettings and ProjectLoad instead
         ReplaceSpaces(objDirExpNoSpaces, objDirExpNoSpaces);
         ReplaceSpaces(resDirNoSpaces, resNode.path ? resNode.path : "");
         ReplaceSpaces(fixedModuleName, moduleName);
         ReplaceSpaces(fixedConfigName, GetConfigName(config));
         CamelCase(fixedConfigName);

         sameObjTargetDirs = !fstrcmp(objDirExpNoSpaces, targetDirExpNoSpaces);

         f.Printf(".PHONY: all objdir%s cleantarget clean realclean distclean\n\n", sameObjTargetDirs ? "" : " targetdir");

         f.Puts("# CORE VARIABLES\n\n");

         f.Printf("MODULE := %s\n", fixedModuleName);
         f.Printf("VERSION := %s\n", property::moduleVersion);
         f.Printf("CONFIG := %s\n", fixedConfigName);
         f.Puts("ifndef COMPILER\n" "COMPILER := default\n" "endif\n");
         f.Puts("\n");

         test = GetTargetTypeIsSetByPlatform(config);
         if(test)
         {
            ifCount = 0;
            for(platform = (Platform)1; platform < Platform::enumSize; platform++)
            {
               TargetTypes targetType;
               PlatformOptions projectPOs, configPOs;
               MatchProjectAndConfigPlatformOptions(config, platform, &projectPOs, &configPOs);
               targetType = platformTargetType;
               if(targetType)
               {
                  if(ifCount)
                     f.Puts("else\n");
                  ifCount++;
                  f.Printf("ifdef %s\n", PlatformToMakefileTargetVariable(platform));
                  f.Printf("TARGET_TYPE = %s\n", TargetTypeToMakefileVariable(targetType));
               }
            }
            f.Puts("else\n");
         }
         f.Printf("TARGET_TYPE = %s\n", TargetTypeToMakefileVariable(targetType));
         if(test)
         {
            if(ifCount)
            {
               for(c = 0; c < ifCount; c++)
                  f.Puts("endif\n");
            }
         }
         f.Puts("\n");

         f.Puts("# FLAGS\n\n");

         f.Puts("ECFLAGS =\n");
         f.Puts("ifndef DEBIAN_PACKAGE\n" "CFLAGS =\n" "LDFLAGS =\n" "endif\n");
         f.Puts("PRJ_CFLAGS =\n");
         f.Puts("CECFLAGS =\n");
         f.Puts("OFLAGS =\n");
         f.Puts("LIBS =\n");
         f.Puts("\n");

         f.Puts("ifdef DEBUG\n" "NOSTRIP := y\n" "endif\n");
         f.Puts("\n");

         // Important: We cannot use this ifdef anymore, EXECUTABLE_TARGET is not yet defined. It's embedded in the crossplatform.mk EXECUTABLE
         //f.Puts("ifdef EXECUTABLE_TARGET\n");
         f.Printf("CONSOLE = %s\n", GetConsole(config) ? "-mconsole" : "-mwindows");
         //f.Puts("endif\n");
         f.Puts("\n");

         f.Puts("# INCLUDES\n\n");

         if(compilerConfigsDir && compilerConfigsDir[0])
         {
            strcpy(cfDir, compilerConfigsDir);
            if(cfDir && cfDir[0] && cfDir[strlen(cfDir)-1] != '/')
               strcat(cfDir, "/");
         }
         else
         {
            GetIDECompilerConfigsDir(cfDir, true, true);
            // Use CF_DIR environment variable for absolute paths only
            if(cfDir[0] == '/' || (cfDir[0] && cfDir[1] == ':'))
               strcpy(cfDir, "$(CF_DIR)");
         }

         f.Printf("_CF_DIR = %s\n", cfDir);
         f.Puts("\n");

         f.Printf("include %s\n", includemkPath ? includemkPath : "$(_CF_DIR)crossplatform.mk");
         f.Puts("include $(_CF_DIR)$(TARGET_PLATFORM)-$(COMPILER).cf\n");
         f.Puts("\n");

         f.Puts("# POST-INCLUDES VARIABLES\n\n");

         f.Printf("OBJ = %s%s\n", objDirExpNoSpaces, objDirExpNoSpaces[0] ? "/" : "");
         f.Puts("\n");

         f.Printf("RES = %s%s\n", resDirNoSpaces, resDirNoSpaces[0] ? "/" : "");
         f.Puts("\n");

         // test = GetTargetTypeIsSetByPlatform(config);
         {
            char target[MAX_LOCATION];
            char targetNoSpaces[MAX_LOCATION];
            if(test)
            {
               TargetTypes type;
               ifCount = 0;
               for(type = (TargetTypes)1; type < TargetTypes::enumSize; type++)
               {
                  if(type != targetType)
                  {
                     if(ifCount)
                        f.Puts("else\n");
                     ifCount++;
                     f.Printf("ifeq \"$(TARGET_TYPE)\" \"%s\"\n", TargetTypeToMakefileVariable(type));

                     GetMakefileTargetFileName(type, target, config);
                     strcpy(targetNoSpaces, targetDir);
                     PathCatSlash(targetNoSpaces, target);
                     ReplaceSpaces(targetNoSpaces, targetNoSpaces);
                     f.Printf("TARGET = %s\n", targetNoSpaces);
                  }
               }
               f.Puts("else\n");
            }
            GetMakefileTargetFileName(targetType, target, config);
            strcpy(targetNoSpaces, targetDir);
            PathCatSlash(targetNoSpaces, target);
            ReplaceSpaces(targetNoSpaces, targetNoSpaces);
            f.Printf("TARGET = %s\n", targetNoSpaces);

            if(test)
            {
               if(ifCount)
               {
                  for(c = 0; c < ifCount; c++)
                     f.Puts("endif\n");
               }
            }
         }
         f.Puts("\n");

         // Use something fixed here, to not cause Makefile differences across compilers...
         varStringLenDiffs["$(OBJ)"] = 30; // strlen("obj/memoryGuard.android.gcc-4.6.2") - 6;
         // varStringLenDiffs["$(OBJ)"] = strlen(objDirNoSpaces) - 6;

         topNode.GenMakefileGetNameCollisionInfo(namesInfo, config);

         {
            int c;
            char * map[5][2] = { { "COBJECTS", "C" }, { "SYMBOLS", "S" }, { "IMPORTS", "I" }, { "ECOBJECTS", "O" }, { "BOWLS", "B" } };

            numCObjects = topNode.GenMakefilePrintNode(f, this, eCsources, namesInfo, listItems, config, null);
            if(numCObjects)
            {
               eCsourcesParts = OutputFileList(f, "_ECSOURCES", listItems, varStringLenDiffs, null);

               f.Puts("ECSOURCES = $(call shwspace,$(_ECSOURCES))\n");
               if(eCsourcesParts > 1)
               {
                  for(c = 1; c <= eCsourcesParts; c++)
                     f.Printf("ECSOURCES%d = $(call shwspace,$(_ECSOURCES%d))\n", c, c);
               }
               f.Puts("\n");

               for(c = 0; c < 5; c++)
               {
                  if(eCsourcesParts > 1)
                  {
                     int n;
                     f.Printf("%s =", map[c][0]);
                     for(n = 1; n <= eCsourcesParts; n++)
                        f.Printf(" $(%s%d)", map[c][0], n);
                     f.Puts("\n");
                     for(n = 1; n <= eCsourcesParts; n++)
                        f.Printf("%s%d = $(call shwspace,$(addprefix $(OBJ),$(patsubst %%.ec,%%$(%s),$(notdir $(_ECSOURCES%d)))))\n", map[c][0], n, map[c][1], n);
                  }
                  else if(eCsourcesParts == 1)
                     f.Printf("%s = $(call shwspace,$(addprefix $(OBJ),$(patsubst %%.ec,%%$(%s),$(notdir $(_ECSOURCES)))))\n", map[c][0], map[c][1]);
                  f.Puts("\n");
               }
            }
         }

         numObjects = topNode.GenMakefilePrintNode(f, this, objects, namesInfo, listItems, config, &containsCXX);
         if(numObjects)
            objectsParts = OutputFileList(f, "_OBJECTS", listItems, varStringLenDiffs, null);
         f.Printf("OBJECTS =%s%s%s\n", numObjects ? " $(_OBJECTS)" : "", numCObjects ? " $(ECOBJECTS)" : "", numCObjects ? " $(OBJ)$(MODULE).main$(O)" : "");
         f.Puts("\n");

         topNode.GenMakefilePrintNode(f, this, sources, null, listItems, config, null);
         OutputFileList(f, "SOURCES", listItems, varStringLenDiffs, numCObjects ? "$(ECSOURCES)" : null);

         if(!noResources)
            resNode.GenMakefilePrintNode(f, this, resources, null, listItems, config, null);
         OutputFileList(f, "RESOURCES", listItems, varStringLenDiffs, null);

         f.Puts("LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)\n");
         f.Puts("\n");
         if((config && config.options && config.options.libraries) ||
               (options && options.libraries))
         {
            f.Puts("ifndef STATIC_LIBRARY_TARGET\n");
            f.Puts("LIBS +=");
            if(config && config.options && config.options.libraries)
               OutputLibraries(f, config.options.libraries);
            else if(options && options.libraries)
               OutputLibraries(f, options.libraries);
            f.Puts("\n");
            f.Puts("endif\n");
            f.Puts("\n");
         }

         topNode.GenMakeCollectAssignNodeFlags(config, numCObjects,
               cflagsVariations, nodeCFlagsMapping,
               ecflagsVariations, nodeECFlagsMapping, null);

         GenMakePrintCustomFlags(f, "PRJ_CFLAGS", false, cflagsVariations);
         GenMakePrintCustomFlags(f, "ECFLAGS", true, ecflagsVariations);

         if(platforms || (config && config.platforms))
         {
            ifCount = 0;
            //for(platform = firstPlatform; platform <= lastPlatform; platform++)
            //for(platform = win32; platform <= apple; platform++)

            f.Puts("# PLATFORM-SPECIFIC OPTIONS\n\n");
            for(platform = (Platform)1; platform < Platform::enumSize; platform++)
            {
               PlatformOptions projectPlatformOptions, configPlatformOptions;
               MatchProjectAndConfigPlatformOptions(config, platform, &projectPlatformOptions, &configPlatformOptions);

               if(projectPlatformOptions || configPlatformOptions)
               {
                  if(ifCount)
                     f.Puts("else\n");
                  ifCount++;
                  f.Printf("ifdef %s\n", PlatformToMakefileTargetVariable(platform));
                  f.Puts("\n");

                  if((projectPlatformOptions && projectPlatformOptions.options.linkerOptions && projectPlatformOptions.options.linkerOptions.count) ||
                     (configPlatformOptions && configPlatformOptions.options.linkerOptions && configPlatformOptions.options.linkerOptions.count))
                  {
                     f.Puts("OFLAGS +=");
                     if(projectPlatformOptions && projectPlatformOptions.options.linkerOptions && projectPlatformOptions.options.linkerOptions.count)
                     {
                        bool needWl = false;
                        f.Puts(" \\\n\t ");
                        for(s : projectPlatformOptions.options.linkerOptions)
                        {
                           if(!IsLinkerOption(s))
                              f.Printf(" %s", s);
                           else
                              needWl = true;
                        }
                        if(needWl)
                        {
                           f.Puts(" -Wl");
                           for(s : projectPlatformOptions.options.linkerOptions)
                              if(IsLinkerOption(s))
                                 f.Printf(",%s", s);
                        }
                     }
                     if(configPlatformOptions && configPlatformOptions.options.linkerOptions && configPlatformOptions.options.linkerOptions.count)
                     {
                        bool needWl = false;
                        f.Puts(" \\\n\t ");
                        for(s : configPlatformOptions.options.linkerOptions)
                        {
                           if(IsLinkerOption(s))
                              f.Printf(" %s", s);
                           else
                              needWl = true;
                        }
                        if(needWl)
                        {
                           f.Puts(" -Wl");
                           for(s : configPlatformOptions.options.linkerOptions)
                              if(!IsLinkerOption(s))
                                 f.Printf(",%s", s);
                        }
                     }
                     f.Puts("\n");
                     f.Puts("\n");
                  }

                  if((projectPlatformOptions && projectPlatformOptions.options.libraryDirs && projectPlatformOptions.options.libraryDirs.count) ||
                        (configPlatformOptions && configPlatformOptions.options.libraryDirs && configPlatformOptions.options.libraryDirs.count) ||
                        (projectPlatformOptions && projectPlatformOptions.options.libraries && projectPlatformOptions.options.libraries.count) ||
                        (configPlatformOptions && configPlatformOptions.options.libraries && configPlatformOptions.options.libraries.count))
                  {
                     f.Puts("ifndef STATIC_LIBRARY_TARGET\n");
                     if((projectPlatformOptions && projectPlatformOptions.options.libraryDirs && projectPlatformOptions.options.libraryDirs.count) ||
                        (configPlatformOptions && configPlatformOptions.options.libraryDirs && configPlatformOptions.options.libraryDirs.count))
                     {
                        f.Puts("OFLAGS +=");
                        if(configPlatformOptions && configPlatformOptions.options.libraryDirs)
                           OutputListOption(f, "L", configPlatformOptions.options.libraryDirs, lineEach, true);
                        if(projectPlatformOptions && projectPlatformOptions.options.libraryDirs)
                           OutputListOption(f, "L", projectPlatformOptions.options.libraryDirs, lineEach, true);
                        f.Puts("\n");
                     }

                     if((configPlatformOptions && configPlatformOptions.options.libraries))
                     {
                        if(configPlatformOptions.options.libraries.count)
                        {
                           f.Puts("LIBS +=");
                           OutputLibraries(f, configPlatformOptions.options.libraries);
                           f.Puts("\n");
                        }
                     }
                     else if(projectPlatformOptions && projectPlatformOptions.options.libraries)
                     {
                        if(projectPlatformOptions.options.libraries.count)
                        {
                           f.Puts("LIBS +=");
                           OutputLibraries(f, projectPlatformOptions.options.libraries);
                           f.Puts("\n");
                        }
                     }
                     f.Puts("endif\n");
                     f.Puts("\n");
                  }
               }
            }
            if(ifCount)
            {
               for(c = 0; c < ifCount; c++)
                  f.Puts("endif\n");
            }
            f.Puts("\n");
         }

         if((config && config.options && config.options.linkerOptions && config.options.linkerOptions.count) ||
               (options && options.linkerOptions && options.linkerOptions.count))
         {
            f.Puts("OFLAGS +=");
            f.Puts(" \\\n\t");

            if(config && config.options && config.options.linkerOptions && config.options.linkerOptions.count)
            {
               bool needWl = false;
               for(s : config.options.linkerOptions)
               {
                  if(!IsLinkerOption(s))
                     f.Printf(" %s", s);
                  else
                     needWl = true;
               }
               if(needWl)
               {
                  f.Puts(" -Wl");
                  for(s : config.options.linkerOptions)
                     if(IsLinkerOption(s))
                        f.Printf(",%s", s);
               }
            }
            if(options && options.linkerOptions && options.linkerOptions.count)
            {
               bool needWl = false;
               for(s : options.linkerOptions)
               {
                  if(!IsLinkerOption(s))
                     f.Printf(" %s", s);
                  else
                     needWl = true;
               }
               if(needWl)
               {
                  f.Puts(" -Wl");
                  for(s : options.linkerOptions)
                     if(IsLinkerOption(s))
                        f.Printf(",%s", s);
               }
            }
         }
         f.Puts("\n");
         f.Puts("\n");

         f.Puts("CECFLAGS += -cpp $(_CPP)");
         f.Puts("\n");
         f.Puts("\n");

         if(GetProfile(config))
            f.Puts("OFLAGS += -pg\n\n");

         if((config && config.options && config.options.libraryDirs) || (options && options.libraryDirs))
         {
            f.Puts("ifndef STATIC_LIBRARY_TARGET\n");
            f.Puts("OFLAGS +=");
            if(config && config.options && config.options.libraryDirs)
               OutputListOption(f, "L", config.options.libraryDirs, lineEach, true);
            if(options && options.libraryDirs)
               OutputListOption(f, "L", options.libraryDirs, lineEach, true);
            f.Puts("\n");
            f.Puts("endif\n");
            f.Puts("\n");
         }

         f.Puts("# TARGETS\n");
         f.Puts("\n");

         f.Printf("all: objdir%s $(TARGET)\n", sameObjTargetDirs ? "" : " targetdir");
         f.Puts("\n");

         f.Puts("objdir:\n");
            f.Puts("\t$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))\n");
         //f.Puts("# PRE-BUILD COMMANDS\n");
         if(options && options.prebuildCommands)
         {
            for(s : options.prebuildCommands)
               if(s && s[0]) f.Printf("\t%s\n", s);
         }
         if(config && config.options && config.options.prebuildCommands)
         {
            for(s : config.options.prebuildCommands)
               if(s && s[0]) f.Printf("\t%s\n", s);
         }
         if(platforms || (config && config.platforms))
         {
            ifCount = 0;
            //f.Puts("# TARGET_PLATFORM-SPECIFIC PRE-BUILD COMMANDS\n");
            for(platform = (Platform)1; platform < Platform::enumSize; platform++)
            {
               PlatformOptions projectPOs, configPOs;
               MatchProjectAndConfigPlatformOptions(config, platform, &projectPOs, &configPOs);

               if((projectPOs && projectPOs.options.prebuildCommands && projectPOs.options.prebuildCommands.count) ||
                     (configPOs && configPOs.options.prebuildCommands && configPOs.options.prebuildCommands.count))
               {
                  if(ifCount)
                     f.Puts("else\n");
                  ifCount++;
                  f.Printf("ifdef %s\n", PlatformToMakefileTargetVariable(platform));

                  if(projectPOs && projectPOs.options.prebuildCommands && projectPOs.options.prebuildCommands.count)
                  {
                     for(s : projectPOs.options.prebuildCommands)
                        if(s && s[0]) f.Printf("\t%s\n", s);
                  }
                  if(configPOs && configPOs.options.prebuildCommands && configPOs.options.prebuildCommands.count)
                  {
                     for(s : configPOs.options.prebuildCommands)
                        if(s && s[0]) f.Printf("\t%s\n", s);
                  }
               }
            }
            if(ifCount)
            {
               int c;
               for(c = 0; c < ifCount; c++)
                  f.Puts("endif\n");
            }
         }
         f.Puts("\n");

         if(!sameObjTargetDirs)
         {
            f.Puts("targetdir:\n");
               f.Printf("\t$(if $(wildcard %s),,$(call mkdirq,%s))\n", targetDirExpNoSpaces, targetDirExpNoSpaces);
            f.Puts("\n");
         }

         if(numCObjects)
         {
            // Main Module (Linking) for ECERE C modules
            f.Puts("$(OBJ)$(MODULE).main.ec: $(SYMBOLS) $(COBJECTS)\n");
            // use of objDirExpNoSpaces used instead of $(OBJ) to prevent problematic joining of arguments in ecs
            f.Printf("\t$(ECS)%s $(ARCH_FLAGS) $(ECSLIBOPT) $(SYMBOLS) $(IMPORTS) -symbols %s -o $(OBJ)$(MODULE).main.ec\n", 
               GetConsole(config) ? " -console" : "", objDirExpNoSpaces);
            f.Puts("\n");
            // Main Module (Linking) for ECERE C modules
            f.Puts("$(OBJ)$(MODULE).main.c: $(OBJ)$(MODULE).main.ec\n");
            f.Puts("\t$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS)"
                  " -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.sym -symbols $(OBJ)\n");
            f.Puts("\t$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY)"
                  " -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.c -symbols $(OBJ)\n");
            f.Puts("\n");
         }

         // *** Target ***

         // This would not rebuild the target on updated objects
         // f.Printf("$(TARGET): $(SOURCES) $(RESOURCES) | objdir $(SYMBOLS) $(OBJECTS)%s\n", sameObjTargetDirs ? "" : " targetdir");

         // This should fix it for good!
         f.Puts("$(SYMBOLS): | objdir\n");
         f.Puts("$(OBJECTS): | objdir\n");

         // This alone was breaking the tarball, object directory does not get created first (order-only rules happen last it seems!)
         f.Printf("$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir%s\n", sameObjTargetDirs ? "" : " targetdir");

         f.Printf("\t@$(call rmq,$(OBJ)linkobjects.lst)\n");
         f.Printf("\t@$(call touch,$(OBJ)linkobjects.lst)\n");
         OutputLinkObjectActions(f, "_OBJECTS", objectsParts);
         if(numCObjects)
         {
            f.Printf("\t@$(call echo,$(OBJ)$(MODULE).main$(O)) >> $(OBJ)linkobjects.lst\n");
            OutputLinkObjectActions(f, "ECOBJECTS", eCsourcesParts);
         }

         f.Puts("ifndef STATIC_LIBRARY_TARGET\n");

         f.Printf("\t$(%s) $(OFLAGS) @$(OBJ)linkobjects.lst $(LIBS) %s-o $(TARGET) $(INSTALLNAME)\n", containsCXX ? "CXX" : "CC", containsCXX ? "-lstdc++ " : "");
         if(!GetDebug(config))
         {
            f.Puts("ifndef NOSTRIP\n");
            f.Puts("\t$(STRIP) $(STRIPOPT) $(TARGET)\n");
            f.Puts("endif\n");

            if(GetCompress(config))
            {
               f.Printf("ifndef %s\n", PlatformToMakefileTargetVariable(win32));
               f.Puts("ifdef EXECUTABLE_TARGET\n");
                  f.Puts("\t$(UPX) $(UPXFLAGS) $(TARGET)\n");
               f.Puts("endif\n");
               f.Puts("else\n");
                  f.Puts("\t$(UPX) $(UPXFLAGS) $(TARGET)\n");
               f.Puts("endif\n");
            }
         }
         if(resNode.files && resNode.files.count && !noResources)
            resNode.GenMakefileAddResources(f, resNode.path, config);
         f.Puts("else\n");
         f.Puts("\t$(AR) rcs $(TARGET) @$(OBJ)linkobjects.lst $(LIBS)\n");
         f.Puts("endif\n");
         f.Puts("ifdef SHARED_LIBRARY_TARGET\n");
         f.Puts("ifdef LINUX_TARGET\n");
         f.Puts("ifdef LINUX_HOST\n");
         // TODO?: support symlinks for longer version numbers
         f.Puts("\t$(if $(basename $(VER)),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO)$(basename $(VER)),)\n");
         f.Puts("\t$(if $(VER),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO),)\n");
         f.Puts("endif\n");
         f.Puts("endif\n");
         f.Puts("endif\n");

         //f.Puts("# POST-BUILD COMMANDS\n");
         if(options && options.postbuildCommands)
         {
            for(s : options.postbuildCommands)
               if(s && s[0]) f.Printf("\t%s\n", s);
         }
         if(config && config.options && config.options.postbuildCommands)
         {
            for(s : config.options.postbuildCommands)
               if(s && s[0]) f.Printf("\t%s\n", s);
         }
         if(platforms || (config && config.platforms))
         {
            ifCount = 0;
            //f.Puts("# TARGET_PLATFORM-SPECIFIC POST-BUILD COMMANDS\n");
            for(platform = (Platform)1; platform < Platform::enumSize; platform++)
            {
               PlatformOptions projectPOs, configPOs;
               MatchProjectAndConfigPlatformOptions(config, platform, &projectPOs, &configPOs);

               if((projectPOs && projectPOs.options.postbuildCommands && projectPOs.options.postbuildCommands.count) ||
                     (configPOs && configPOs.options.postbuildCommands && configPOs.options.postbuildCommands.count))
               {
                  if(ifCount)
                     f.Puts("else\n");
                  ifCount++;
                  f.Printf("ifdef %s\n", PlatformToMakefileTargetVariable(platform));

                  if(projectPOs && projectPOs.options.postbuildCommands && projectPOs.options.postbuildCommands.count)
                  {
                     for(s : projectPOs.options.postbuildCommands)
                        if(s && s[0]) f.Printf("\t%s\n", s);
                  }
                  if(configPOs && configPOs.options.postbuildCommands && configPOs.options.postbuildCommands.count)
                  {
                     for(s : configPOs.options.postbuildCommands)
                        if(s && s[0]) f.Printf("\t%s\n", s);
                  }
               }
            }
            if(ifCount)
            {
               int c;
               for(c = 0; c < ifCount; c++)
                  f.Puts("endif\n");
            }
         }
         f.Puts("\n");

         f.Puts("# SYMBOL RULES\n");
         f.Puts("\n");

         topNode.GenMakefilePrintSymbolRules(f, this, config, nodeCFlagsMapping, nodeECFlagsMapping);

         f.Puts("# C OBJECT RULES\n");
         f.Puts("\n");

         topNode.GenMakefilePrintCObjectRules(f, this, config, nodeCFlagsMapping, nodeECFlagsMapping);

         f.Puts("# OBJECT RULES\n");
         f.Puts("\n");
         // todo call this still but only generate rules whith specific options
         // see we-have-file-specific-options in ProjectNode.ec
         topNode.GenMakefilePrintObjectRules(f, this, namesInfo, config, nodeCFlagsMapping, nodeECFlagsMapping);

         if(numCObjects)
            GenMakefilePrintMainObjectRule(f, config);

         f.Printf("cleantarget: objdir%s\n", sameObjTargetDirs ? "" : " targetdir");
         f.Puts("\t$(call rmq,$(TARGET))\n");
         f.Puts("ifdef SHARED_LIBRARY_TARGET\n");
         f.Puts("ifdef LINUX_TARGET\n");
         f.Puts("ifdef LINUX_HOST\n");
         // TODO?: support symlinks for longer version numbers
         f.Puts("\t$(call rmq,$(OBJ)$(LP)$(MODULE)$(SO)$(basename $(VER)))\n");
         f.Puts("\t$(call rmq,$(OBJ)$(LP)$(MODULE)$(SO))\n");
         f.Puts("endif\n");
         f.Puts("endif\n");
         f.Puts("endif\n");
         f.Puts("\n");

         f.Puts("clean: cleantarget\n");
         f.Printf("\t$(call rmq,$(OBJ)linkobjects.lst)\n");
         OutputCleanActions(f, "_OBJECTS", objectsParts);
         if(numCObjects)
         {
            f.Printf("\t$(call rmq,%s)\n", "$(OBJ)$(MODULE).main.o $(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S)");
            OutputCleanActions(f, "ECOBJECTS", eCsourcesParts);
            OutputCleanActions(f, "COBJECTS", eCsourcesParts);
            OutputCleanActions(f, "BOWLS", eCsourcesParts);
            OutputCleanActions(f, "IMPORTS", eCsourcesParts);
            OutputCleanActions(f, "SYMBOLS", eCsourcesParts);
         }
         f.Puts("\n");

         f.Puts("realclean: cleantarget\n");
         f.Puts("\t$(call rmrq,$(OBJ))\n");
         if(!sameObjTargetDirs)
            f.Printf("\t$(call rmdirq,%s)\n", targetDirExpNoSpaces);
         f.Puts("\n");

         f.Puts("distclean: cleantarget\n");
         if(!sameObjTargetDirs)
            f.Printf("\t$(call rmdirq,%s)\n", targetDirExpNoSpaces);
         f.Puts("\t$(call rmrq,obj/)\n");

         delete f;

         listItems.Free();
         delete listItems;
         varStringLenDiffs.Free();
         delete varStringLenDiffs;
         namesInfo.Free();
         delete namesInfo;

         delete cflagsVariations;
         delete nodeCFlagsMapping;
         delete ecflagsVariations;
         delete nodeECFlagsMapping;

         result = true;
      }

      // ChangeWorkingDir(oldDirectory);
      // delete pathBackup;

      if(config)
         config.makingModified = false;
      return result;
   }

   void GenMakefilePrintMainObjectRule(File f, ProjectConfig config)
   {
      char extension[MAX_EXTENSION] = "c";
      char modulePath[MAX_LOCATION];
      char fixedModuleName[MAX_FILENAME];
      DualPipe dep;
      char command[2048];
      char objDirNoSpaces[MAX_LOCATION];
      String objDirExp = GetObjDirExpression(config);

      ReplaceSpaces(objDirNoSpaces, objDirExp);
      ReplaceSpaces(fixedModuleName, moduleName);
      
      //sprintf(fixedModuleName, "%s.main", fixedPrjName);
      //strcat(fixedModuleName, ".main");

#if 0       // TODO: Fix nospaces stuff
      // *** Dependency command ***
      sprintf(command, "gcc -MT $(OBJ)%s$(O) -MM $(OBJ)%s.c", fixedModuleName, fixedModuleName);

      // System Includes (from global settings)
      for(item : compiler.dirs[Includes])
      {
         strcat(command, " -isystem ");
         if(strchr(item.name, ' '))
         {
            strcat(command, "\"");
            strcat(command, item);
            strcat(command, "\"");
         }
         else
            strcat(command, item);
      }

      for(item = includeDirs.first; item; item = item.next)
      {
         strcat(command, " -I");
         if(strchr(item.name, ' '))
         {
            strcat(command, "\"");
            strcat(command, item.name);
            strcat(command, "\"");
         }
         else
            strcat(command, item.name);
      }
      for(item = preprocessorDefs.first; item; item = item.next)
      {
         strcat(command, " -D");
         strcat(command, item.name);
      }

      // Execute it
      if((dep = DualPipeOpen(PipeOpenMode { output = 1, error = 1, input = 2 }, command)))
      {
         char line[1024];
         bool result = true;
         bool firstLine = true;

         // To do some time: auto save external dependencies?
         while(!dep.Eof())
         {
            if(dep.GetLine(line, sizeof(line)-1))
            {
               if(firstLine)
               {
                  char * colon = strstr(line, ":");
                  if(strstr(line, "No such file") || strstr(line, ",") || (colon && strstr(colon+1, ":")))
                  {
                     result = false;
                     break;
                  }
                  firstLine = false;
               }
               f.Puts(line);
               f.Puts("\n");
            }
            if(!result) break;
         }
         delete dep;

         // If we failed to generate dependencies...
         if(!result)
         {
#endif
            f.Puts("$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c\n");
            f.Printf("\t$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.%s -o $(OBJ)$(MODULE).main$(O)\n", extension);
            f.Puts("\n");
#if 0
         }
      }
#endif
   }

   void GenMakePrintCustomFlags(File f, String variableName, bool printNonCustom, Map<String, int> cflagsVariations)
   {
      int c;
      for(c = printNonCustom ? 0 : 1; c <= cflagsVariations.count; c++)
      {
         for(v : cflagsVariations)
         {
            if(v == c)
            {
               if(v == 1)
                  f.Printf("%s +=", variableName);
               else
                  f.Printf("CUSTOM%d_%s =", v-1, variableName);
               f.Puts(&v ? &v : "");
               f.Puts("\n");
               f.Puts("\n");
               break;
            }
         }
      }
      f.Puts("\n");
   }

   void MatchProjectAndConfigPlatformOptions(ProjectConfig config, Platform platform,
         PlatformOptions * projectPlatformOptions, PlatformOptions * configPlatformOptions)
   {
      *projectPlatformOptions = null;
      *configPlatformOptions = null;
      if(platforms)
      {
         for(p : platforms)
         {
            if(!strcmpi(p.name, platform))
            {
               *projectPlatformOptions = p;
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
               *configPlatformOptions = p;
               break;
            }
         }
      }
   }
}

Project LegacyBinaryLoadProject(File f, char * filePath)
{
   Project project = null;
   char signature[sizeof(epjSignature)];

   f.Read(signature, sizeof(signature), 1);
   if(!strncmp(signature, (char *)epjSignature, sizeof(epjSignature)))
   {
      char topNodePath[MAX_LOCATION];
      /*ProjectConfig newConfig
      {
         name = CopyString("Default");
         makingModified = true;
         compilingModified = true;
         linkingModified = true;
         options = { };
      };*/

      project = Project { options = { } };
      LegacyBinaryLoadNode(project.topNode, f);
      delete project.topNode.path;
      GetWorkingDir(topNodePath, sizeof(topNodePath)-1);
      MakeSlashPath(topNodePath);

      PathCatSlash(topNodePath, filePath);
      project.filePath = topNodePath;
      
      /* THIS IS ALREADY DONE BY filePath property
      StripLastDirectory(topNodePath, topNodePath);
      project.topNode.path = CopyString(topNodePath);
      */
      // Shouldn't this be done BEFORE the StripLastDirectory? project.filePath = topNodePath;
      
      // newConfig.options.defaultNameSpace = "";
      /*newConfig.objDir.dir = "obj";
      newConfig.targetDir.dir = "";*/

      //project.configurations = { [ newConfig ] };
      //project.config = newConfig;

      // Project Settings
      if(!f.Eof())
      {
         int temp;
         int len,c, count;
         String targetFileName, targetDirectory, objectsDirectory;

         // { executable = 0, sharedLibrary = 1, staticLibrary = 2 };
         f.Read(&temp, sizeof(int),1);
         switch(temp)
         {
            case 0: project.options.targetType = executable; break;
            case 1: project.options.targetType = sharedLibrary; break;
            case 2: project.options.targetType = staticLibrary; break;
         }

         f.Read(&len, sizeof(int),1);
         targetFileName = new char[len+1];
         f.Read(targetFileName, sizeof(char), len+1);
         project.options.targetFileName = targetFileName;
         delete targetFileName;

         f.Read(&len, sizeof(int),1);
         targetDirectory = new char[len+1];
         f.Read(targetDirectory, sizeof(char), len+1);
         project.options.targetDirectory = targetDirectory;
         delete targetDirectory;

         f.Read(&len, sizeof(int),1);
         objectsDirectory = new byte[len+1];
         f.Read(objectsDirectory, sizeof(char), len+1);
         project.options.objectsDirectory = objectsDirectory;
         delete objectsDirectory;

         f.Read(&temp, sizeof(int),1);
         project./*config.*/options.debug = temp ? true : false;
         f.Read(&temp, sizeof(int),1);         
         project./*config.*/options.optimization = temp ? speed : none;
         f.Read(&temp, sizeof(int),1);
         project./*config.*/options.profile = temp ? true : false;
         f.Read(&temp, sizeof(int),1);
         project.options.warnings = temp ? all : unset;

         f.Read(&count, sizeof(int),1);
         if(count)
         {
            project.options.includeDirs = { };
            for(c = 0; c < count; c++)
            {
               char * name;
               f.Read(&len, sizeof(int),1);
               name = new char[len+1];
               f.Read(name, sizeof(char), len+1);
               project.options.includeDirs.Add(name);
            }
         }

         f.Read(&count, sizeof(int),1);
         if(count)
         {
            project.options.libraryDirs = { };
            for(c = 0; c < count; c++)
            {
               char * name;            
               f.Read(&len, sizeof(int),1);
               name = new char[len+1];
               f.Read(name, sizeof(char), len+1);
               project.options.libraryDirs.Add(name);
            }
         }

         f.Read(&count, sizeof(int),1);
         if(count)
         {
            project.options.libraries = { };
            for(c = 0; c < count; c++)
            {
               char * name;
               f.Read(&len, sizeof(int),1);
               name = new char[len+1];
               f.Read(name, sizeof(char), len+1);
               project.options.libraries.Add(name);
            }
         }

         f.Read(&count, sizeof(int),1);
         if(count)
         {
            project.options.preprocessorDefinitions = { };
            for(c = 0; c < count; c++)
            {
               char * name;
               f.Read(&len, sizeof(int),1);
               name = new char[len+1];
               f.Read(name, sizeof(char), len+1);
               project.options.preprocessorDefinitions.Add(name);
            }
         }

         f.Read(&temp, sizeof(int),1);
         project.options.console = temp ? true : false;
      }

      for(node : project.topNode.files)
      {
         if(node.type == resources)
         {
            project.resNode = node;
            break;
         }
      }
   }
   else
      f.Seek(0, start);
   return project;
}

void ProjectConfig::LegacyProjectConfigLoad(File f)
{  
   delete options;
   options = { };
   while(!f.Eof())
   {
      char buffer[65536];
      char section[128];
      char subSection[128];
      char * equal;
      int len;
      uint pos;
      
      pos = f.Tell();
      f.GetLine(buffer, 65536 - 1);
      TrimLSpaces(buffer, buffer);
      TrimRSpaces(buffer, buffer);
      if(strlen(buffer))
      {
         if(buffer[0] == '-')
         {
            equal = &buffer[0];
            equal[0] = ' ';
            TrimLSpaces(equal, equal);
            if(!strcmpi(subSection, "LibraryDirs"))
            {
               if(!options.libraryDirs)
                  options.libraryDirs = { [ CopyString(equal) ] };
               else
                  options.libraryDirs.Add(CopyString(equal));
            }
            else if(!strcmpi(subSection, "IncludeDirs"))
            {
               if(!options.includeDirs)
                  options.includeDirs = { [ CopyString(equal) ] };
               else
                  options.includeDirs.Add(CopyString(equal));
            }
         }
         else if(buffer[0] == '+')
         {
            if(name)
            {
               f.Seek(pos, start);
               break;
            }
            else
            {
               equal = &buffer[0];
               equal[0] = ' ';
               TrimLSpaces(equal, equal);
               delete name; name = CopyString(equal); // property::name = equal;
            }
         }
         else if(!strcmpi(buffer, "Compiler Options"))
            strcpy(section, buffer);
         else if(!strcmpi(buffer, "IncludeDirs"))
            strcpy(subSection, buffer);
         else if(!strcmpi(buffer, "Linker Options"))
            strcpy(section, buffer);
         else if(!strcmpi(buffer, "LibraryDirs"))
            strcpy(subSection, buffer);
         else if(!strcmpi(buffer, "Files") || !strcmpi(buffer, "Resources"))
         {
            f.Seek(pos, start);
            break;
         }
         else
         {
            equal = strstr(buffer, "=");
            if(equal)
            {
               equal[0] = '\0';
               TrimRSpaces(buffer, buffer);
               equal++;
               TrimLSpaces(equal, equal);
               if(!strcmpi(buffer, "Target Name"))
                  options.targetFileName = /*CopyString(*/equal/*)*/;
               else if(!strcmpi(buffer, "Target Type"))
               {
                  if(!strcmpi(equal, "Executable"))
                     options.targetType = executable;
                  else if(!strcmpi(equal, "Shared"))
                     options.targetType = sharedLibrary;
                  else if(!strcmpi(equal, "Static"))
                     options.targetType = staticLibrary;
                  else
                     options.targetType = executable;
               }
               else if(!strcmpi(buffer, "Target Directory"))
                  options.targetDirectory = /*CopyString(*/equal/*)*/;
               else if(!strcmpi(buffer, "Console"))
                  options.console = ParseTrueFalseValue(equal);
               else if(!strcmpi(buffer, "Libraries"))
               {
                  if(!options.libraries) options.libraries = { };
                  ParseArrayValue(options.libraries, equal);
               }
               else if(!strcmpi(buffer, "Intermediate Directory"))
                  options.objectsDirectory = /*CopyString(*/equal/*)*/; //objDir.expression = equal;
               else if(!strcmpi(buffer, "Debug"))
                  options.debug = ParseTrueFalseValue(equal);
               else if(!strcmpi(buffer, "Optimize"))
               {
                  if(!strcmpi(equal, "None"))
                     options.optimization = none;
                  else if(!strcmpi(equal, "Speed") || !strcmpi(equal, "True"))
                     options.optimization = speed;
                  else if(!strcmpi(equal, "Size"))
                     options.optimization = size;
                  else
                     options.optimization = none;
               }
               else if(!strcmpi(buffer, "Compress"))
                  options.compress = ParseTrueFalseValue(equal);
               else if(!strcmpi(buffer, "Profile"))
                  options.profile = ParseTrueFalseValue(equal);
               else if(!strcmpi(buffer, "AllWarnings"))
                  options.warnings = ParseTrueFalseValue(equal) ? all : unset;
               else if(!strcmpi(buffer, "MemoryGuard"))
                  options.memoryGuard = ParseTrueFalseValue(equal);
               else if(!strcmpi(buffer, "Default Name Space"))
                  options.defaultNameSpace = CopyString(equal);
               else if(!strcmpi(buffer, "Strict Name Spaces"))
                  options.strictNameSpaces = ParseTrueFalseValue(equal);
               else if(!strcmpi(buffer, "Preprocessor Definitions"))
               {
                  if(!options.preprocessorDefinitions) options.preprocessorDefinitions = { };
                  ParseArrayValue(options.preprocessorDefinitions, equal);
               }
            }
         }
      }
   }
   if(!options.targetDirectory && options.objectsDirectory)
      options.targetDirectory = /*CopyString(*/options.objectsDirectory/*)*/;
   //if(!objDir.dir) objDir.dir = "obj";
   //if(!targetDir.dir) targetDir.dir = "";
   // if(!targetName) property::targetName = "";   // How can a targetFileName be nothing???
   // if(!defaultNameSpace) property::defaultNameSpace = "";
   makingModified = true;
}

Project LegacyAsciiLoadProject(File f, char * filePath)
{
   Project project = null;
   ProjectNode node = null;
   int pos;
   char parentPath[MAX_LOCATION];
   char section[128] = "";
   char subSection[128] = "";
   ProjectNode parent;
   bool configurationsPresent = false;

   f.Seek(0, start);
   while(!f.Eof())
   {
      char buffer[65536];
      //char version[16];
      char * equal;
      int len;
      pos = f.Tell();
      f.GetLine(buffer, 65536 - 1);
      TrimLSpaces(buffer, buffer);
      TrimRSpaces(buffer, buffer);
      if(strlen(buffer))
      {
         if(buffer[0] == '-' || buffer[0] == '=')
         {
            bool simple = buffer[0] == '-';
            equal = &buffer[0];
            equal[0] = ' ';
            TrimLSpaces(equal, equal);
            if(!strcmpi(section, "Target") && !strcmpi(subSection, "LibraryDirs"))
            {
               if(!project.config.options.libraryDirs)
                  project.config.options.libraryDirs = { [ CopyString(equal) ] };
               else
                  project.config.options.libraryDirs.Add(CopyString(equal));
            }
            else if(!strcmpi(section, "Target") && !strcmpi(subSection, "IncludeDirs"))
            {
               if(!project.config.options.includeDirs)
                  project.config.options.includeDirs = { [ CopyString(equal) ] };
               else
                  project.config.options.includeDirs.Add(CopyString(equal));
            }
            else if(!strcmpi(section, "Target") && (!strcmpi(subSection, "Files") || !strcmpi(subSection, "Resources")))
            {
               len = strlen(equal);
               if(len)
               {
                  char temp[MAX_LOCATION];
                  ProjectNode child { };
                  // We don't need to do this anymore, fileName is just a property that sets name & path
                  // child.fileName = CopyString(equal);
                  if(simple)
                  {
                     child.name = CopyString(equal);
                     child.path = CopyString(parentPath);
                  }
                  else
                  {
                     GetLastDirectory(equal, temp);
                     child.name = CopyString(temp);
                     StripLastDirectory(equal, temp);
                     child.path = CopyString(temp);
                  }
                  child.nodeType = file;
                  child.parent = parent;
                  child.indent = parent.indent + 1;
                  child.type = file;
                  child.icon = NodeIcons::SelectFileIcon(child.name);
                  parent.files.Add(child);
                  node = child;
                  //child = null;
               }
               else
               {
                  StripLastDirectory(parentPath, parentPath);
                  parent = parent.parent;
               }
            }
         }
         else if(buffer[0] == '+')
         {
            equal = &buffer[0];
            equal[0] = ' ';
            TrimLSpaces(equal, equal);
            if(!strcmpi(section, "Target") && (!strcmpi(subSection, "Files") || !strcmpi(subSection, "Resources")))
            {
               char temp[MAX_LOCATION];
               ProjectNode child { };
               // NEW: Folders now have a path set like files
               child.name = CopyString(equal);
               strcpy(temp, parentPath);
               PathCatSlash(temp, child.name);
               child.path = CopyString(temp);

               child.parent = parent;
               child.indent = parent.indent + 1;
               child.type = folder;
               child.nodeType = folder;
               child.files = { };
               child.icon = folder;
               PathCatSlash(parentPath, child.name);
               parent.files.Add(child);
               parent = child;
               node = child;
               //child = null;
            }
            else if(!strcmpi(section, "Configurations"))
            {
               ProjectConfig newConfig
               {
                  makingModified = true;
                  options = { };
               };
               f.Seek(pos, start);
               LegacyProjectConfigLoad(newConfig, f);
               project.configurations.Add(newConfig);
            }
         }
         else if(!strcmpi(buffer, "ECERE Project File"));
         else if(!strcmpi(buffer, "Version 0a"))
            ; //strcpy(version, "0a");
         else if(!strcmpi(buffer, "Version 0.1a"))
            ; //strcpy(version, "0.1a");
         else if(!strcmpi(buffer, "Configurations"))
         {
            project.configurations.Free();
            project.config = null;
            strcpy(section, buffer);
            configurationsPresent = true;
         }
         else if(!strcmpi(buffer, "Target") || !strnicmp(buffer, "Target \"", strlen("Target \"")))
         {
            ProjectConfig newConfig { name = CopyString("Default"), options = { } };
            char topNodePath[MAX_LOCATION];
            // newConfig.defaultNameSpace = "";
            //newConfig.objDir.dir = "obj";
            //newConfig.targetDir.dir = "";
            project = Project { /*options = { }*/ };
            project.configurations = { [ newConfig ] };
            project.config = newConfig;
            // if(project.topNode.path) delete project.topNode.path;
            GetWorkingDir(topNodePath, sizeof(topNodePath)-1);
            MakeSlashPath(topNodePath);
            PathCatSlash(topNodePath, filePath);
            project.filePath = topNodePath;
            parentPath[0] = '\0';
            parent = project.topNode;
            node = parent;
            strcpy(section, "Target");
            equal = &buffer[6];
            if(equal[0] == ' ')
            {
               equal++;
               if(equal[0] == '\"')
               {
                  StripQuotes(equal, equal);
                  delete project.moduleName; project.moduleName = CopyString(equal);
               }
            }
         }
         else if(!strcmpi(buffer, "Compiler Options"));
         else if(!strcmpi(buffer, "IncludeDirs"))
            strcpy(subSection, buffer);
         else if(!strcmpi(buffer, "Linker Options"));
         else if(!strcmpi(buffer, "LibraryDirs"))
            strcpy(subSection, buffer);
         else if(!strcmpi(buffer, "Files"))
         {
            strcpy(section, "Target");
            strcpy(subSection, buffer);
         }
         else if(!strcmpi(buffer, "Resources"))
         {
            ProjectNode child { };
            parent.files.Add(child);
            child.parent = parent;
            child.indent = parent.indent + 1;
            child.name = CopyString(buffer);
            child.path = CopyString("");
            child.type = resources;
            child.files = { };
            child.icon = archiveFile;
            project.resNode = child;
            parent = child;
            node = child;
            strcpy(subSection, buffer);
         }
         else
         {
            equal = strstr(buffer, "=");
            if(equal)
            {
               equal[0] = '\0';
               TrimRSpaces(buffer, buffer);
               equal++;
               TrimLSpaces(equal, equal);

               if(!strcmpi(section, "Target"))
               {
                  if(!strcmpi(buffer, "Build Exclusions"))
                  {
                     if(!strcmpi(section, "Target") && !strcmpi(subSection, "Files"))
                     {
                        /*if(node && node.type != NodeTypes::project)
                           ParseListValue(node.buildExclusions, equal);*/
                     }
                  }
                  else if(!strcmpi(buffer, "Path") && !strcmpi(subSection, "Resources"))
                  {
                     delete project.resNode.path;
                     project.resNode.path = CopyString(equal);
                     PathCatSlash(parentPath, equal);
                  }

                  // Config Settings
                  else if(!strcmpi(buffer, "Intermediate Directory"))
                     project.config.options.objectsDirectory = /*CopyString(*/equal/*)*/; //objDir.expression = equal;
                  else if(!strcmpi(buffer, "Debug"))
                     project.config.options.debug = ParseTrueFalseValue(equal);
                  else if(!strcmpi(buffer, "Optimize"))
                  {
                     if(!strcmpi(equal, "None"))
                        project.config.options.optimization = none;
                     else if(!strcmpi(equal, "Speed") || !strcmpi(equal, "True"))
                        project.config.options.optimization = speed;
                     else if(!strcmpi(equal, "Size"))
                        project.config.options.optimization = size;
                     else
                        project.config.options.optimization = none;
                  }
                  else if(!strcmpi(buffer, "Profile"))
                     project.config.options.profile = ParseTrueFalseValue(equal);
                  else if(!strcmpi(buffer, "MemoryGuard"))
                     project.config.options.memoryGuard = ParseTrueFalseValue(equal);
                  else
                  {
                     if(!project.options) project.options = { };

                     // Project Wide Settings (All configs)
                     if(!strcmpi(buffer, "Target Name"))
                        project.options.targetFileName = /*CopyString(*/equal/*)*/;
                     else if(!strcmpi(buffer, "Target Type"))
                     {
                        if(!strcmpi(equal, "Executable"))
                           project.options.targetType = executable;
                        else if(!strcmpi(equal, "Shared"))
                           project.options.targetType = sharedLibrary;
                        else if(!strcmpi(equal, "Static"))
                           project.options.targetType = staticLibrary;
                        else
                           project.options.targetType = executable;
                     }
                     else if(!strcmpi(buffer, "Target Directory"))
                        project.options.targetDirectory = /*CopyString(*/equal/*)*/;
                     else if(!strcmpi(buffer, "Console"))
                        project.options.console = ParseTrueFalseValue(equal);
                     else if(!strcmpi(buffer, "Libraries"))
                     {
                        if(!project.options.libraries) project.options.libraries = { };
                        ParseArrayValue(project.options.libraries, equal);
                     }
                     else if(!strcmpi(buffer, "AllWarnings"))
                        project.options.warnings = ParseTrueFalseValue(equal) ? all : unset;
                     else if(!strcmpi(buffer, "Preprocessor Definitions"))
                     {
                        if(!strcmpi(section, "Target") && !strcmpi(subSection, "Files"))
                        {
                           /*if(node && (node.type == NodeTypes::project || (node.type == file && !node.isInResources) || node.type == folder))
                              ParseListValue(node.preprocessorDefs, equal);*/
                        }
                        else
                        {
                           if(!project.options.preprocessorDefinitions) project.options.preprocessorDefinitions = { };
                           ParseArrayValue(project.options.preprocessorDefinitions, equal);
                        }
                     }
                  }
               }
            }
         }
      }
   }
   parent = null;

   SplitPlatformLibraries(project);

   if(configurationsPresent)
      CombineIdenticalConfigOptions(project);
   return project;
}

void SplitPlatformLibraries(Project project)
{
   if(project && project.configurations)
   {
      for(cfg : project.configurations)
      {
         if(cfg.options.libraries && cfg.options.libraries.count)
         {
            Iterator<String> it { cfg.options.libraries };
            while(it.Next())
            {
               String l = it.data;
               char * platformName = strstr(l, ":");
               if(platformName)
               {
                  PlatformOptions platform = null;
                  platformName++;
                  if(!cfg.platforms) cfg.platforms = { };
                  for(p : cfg.platforms)
                  {
                     if(!strcmpi(platformName, p.name))
                     {
                        platform = p;
                        break;
                     }
                  }
                  if(!platform)
                  {
                     platform = { name = CopyString(platformName), options = { libraries = { } } };
                     cfg.platforms.Add(platform);
                  }
                  *(platformName-1) = 0;
                  platform.options.libraries.Add(CopyString(l));

                  cfg.options.libraries.Delete(it.pointer);
                  it.pointer = null;
               }
            }
         }
      }      
   }
}

void CombineIdenticalConfigOptions(Project project)
{
   if(project && project.configurations && project.configurations.count)
   {
      DataMember member;
      ProjectOptions nullOptions { };
      ProjectConfig firstConfig = null;
      for(cfg : project.configurations)
      {
         if(cfg.options.targetType != staticLibrary)
         {
            firstConfig = cfg;
            break;
         }
      }
      if(!firstConfig)
         firstConfig = project.configurations.firstIterator.data;

      for(member = class(ProjectOptions).membersAndProperties.first; member; member = member.next)
      {
         if(!member.isProperty)
         {
            Class type = eSystem_FindClass(__thisModule, member.dataTypeString);
            if(type)
            {
               bool same = true;

               for(cfg : project.configurations)
               {
                  if(cfg != firstConfig)
                  {
                     if(cfg.options.targetType != staticLibrary)
                     {
                        int result;
                        
                        if(type.type == noHeadClass || type.type == normalClass)
                        {
                           result = ((int (*)(void *, void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnCompare])(type, 
                              *(void **)((byte *)firstConfig.options + member.offset + member._class.offset),
                              *(void **)((byte *)cfg.options         + member.offset + member._class.offset));
                        }
                        else
                        {
                           result = ((int (*)(void *, void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnCompare])(type, 
                              (byte *)firstConfig.options + member.offset + member._class.offset,
                              (byte *)cfg.options         + member.offset + member._class.offset);
                        }
                        if(result)
                        {
                           same = false;
                           break;
                        }
                     }
                  }                  
               }
               if(same)
               {
                  if(type.type == noHeadClass || type.type == normalClass)
                  {
                     if(!((int (*)(void *, void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnCompare])(type, 
                        *(void **)((byte *)firstConfig.options + member.offset + member._class.offset),
                        *(void **)((byte *)nullOptions         + member.offset + member._class.offset)))
                        continue;
                  }
                  else
                  {
                     if(!((int (*)(void *, void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnCompare])(type, 
                        (byte *)firstConfig.options + member.offset + member._class.offset,
                        (byte *)nullOptions         + member.offset + member._class.offset))
                        continue;
                  }

                  if(!project.options) project.options = { };
                  
                  /*if(type.type == noHeadClass || type.type == normalClass)
                  {
                     ((void (*)(void *, void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnCopy])(type, 
                        (byte *)project.options + member.offset + member._class.offset,
                        *(void **)((byte *)firstConfig.options + member.offset + member._class.offset));
                  }
                  else
                  {
                     void * address = (byte *)firstConfig.options + member.offset + member._class.offset;
                     // TOFIX: ListBox::SetData / OnCopy mess
                     ((void (*)(void *, void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnCopy])(type, 
                        (byte *)project.options + member.offset + member._class.offset,
                        (type.typeSize > 4) ? address : 
                           ((type.typeSize == 4) ? (void *)*(uint32 *)address : 
                              ((type.typeSize == 2) ? (void *)*(uint16*)address : 
                                 (void *)*(byte *)address )));                              
                  }*/
                  memcpy(
                     (byte *)project.options + member.offset + member._class.offset,
                     (byte *)firstConfig.options + member.offset + member._class.offset, type.typeSize);

                  for(cfg : project.configurations)
                  {
                     if(cfg.options.targetType == staticLibrary)
                     {
                        int result;
                        
                        if(type.type == noHeadClass || type.type == normalClass)
                        {
                           result = ((int (*)(void *, void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnCompare])(type, 
                              *(void **)((byte *)firstConfig.options + member.offset + member._class.offset),
                              *(void **)((byte *)cfg.options         + member.offset + member._class.offset));
                        }
                        else
                        {
                           result = ((int (*)(void *, void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnCompare])(type, 
                              (byte *)firstConfig.options + member.offset + member._class.offset,
                              (byte *)cfg.options         + member.offset + member._class.offset);
                        }
                        if(result)
                           continue;
                     }
                     if(cfg != firstConfig)
                     {
                        if(type.type == noHeadClass || type.type == normalClass)
                        {
                           ((void (*)(void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnFree])(type, 
                              *(void **)((byte *)cfg.options + member.offset + member._class.offset));
                        }
                        else
                        {
                           ((void (*)(void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnFree])(type, 
                              (byte *)cfg.options + member.offset + member._class.offset);
                        }
                        memset((byte *)cfg.options + member.offset + member._class.offset, 0, type.typeSize);
                     }                     
                  }
                  memset((byte *)firstConfig.options + member.offset + member._class.offset, 0, type.typeSize);
               }
            }
         }
      }
      delete nullOptions;

      // Compare Platform Specific Settings
      {
         bool same = true;
         for(cfg : project.configurations)
         {
            if(cfg != firstConfig && cfg.options.targetType != staticLibrary && (firstConfig.platforms || cfg.platforms) &&
               ((!firstConfig.platforms && cfg.platforms) || firstConfig.platforms.OnCompare(cfg.platforms)))
            {
               same = false;
               break;
            }
         }
         if(same && firstConfig.platforms)
         {
            for(cfg : project.configurations)
            {
               if(cfg.options.targetType == staticLibrary && firstConfig.platforms.OnCompare(cfg.platforms))
                  continue;
               if(cfg != firstConfig)
               {
                  cfg.platforms.Free();
                  delete cfg.platforms;
               }
            }
            project.platforms = firstConfig.platforms;
            firstConfig.platforms = null;
         }
      }

      // Static libraries can't contain libraries
      for(cfg : project.configurations)
      {
         if(cfg.options.targetType == staticLibrary)
         {
            if(!cfg.options.libraries) cfg.options.libraries = { };
            cfg.options.libraries.Free();
         }
      }
   }
}

Project LoadProject(char * filePath, char * activeConfigName)
{
   Project project = null;
   File f = FileOpen(filePath, read);
   if(f)
   {
      project = LegacyBinaryLoadProject(f, filePath);
      if(!project)
      {
         JSONParser parser { f = f };
         JSONResult result = parser.GetObject(class(Project), &project);
         if(project)
         {
            char insidePath[MAX_LOCATION];

            delete project.topNode.files;
            if(!project.files) project.files = { };
            project.topNode.files = project.files;
            project.resNode = project.topNode.Add(project, "Resources", project.topNode.files.last, resources, archiveFile, false);
            delete project.resNode.path;
            project.resNode.path = project.resourcesPath;
            project.resourcesPath = null;
            project.resNode.nodeType = (ProjectNodeType)-1;
            delete project.resNode.files;
            project.resNode.files = project.resources;
            project.files = null;
            project.resources = null;
            if(!project.configurations) project.configurations = { };

            {
               char topNodePath[MAX_LOCATION];
               GetWorkingDir(topNodePath, sizeof(topNodePath)-1);
               MakeSlashPath(topNodePath);
               PathCatSlash(topNodePath, filePath);
               project.filePath = topNodePath;//filePath;
            }

            project.topNode.FixupNode(insidePath);
         }
         delete parser;
      }
      if(!project)
         project = LegacyAsciiLoadProject(f, filePath);

      delete f;

      if(project)
      {
         if(!project.options) project.options = { };
         if(activeConfigName && activeConfigName[0] && project.configurations)
         {
            for(cfg : project.configurations)
            {
               if(!strcmpi(cfg.name, activeConfigName))
               {
                  project.config = cfg;
                  break;
               }
            }
         }
         if(!project.config && project.configurations)
            project.config = project.configurations.firstIterator.data;

         if(!project.resNode)
         {
            project.resNode = project.topNode.Add(project, "Resources", project.topNode.files.last, resources, archiveFile, false);
         }
         
         if(!project.moduleName)
            project.moduleName = CopyString(project.name);
         if(project.config && 
            (!project.options || !project.options.targetFileName || !project.options.targetFileName[0]) &&
            (!project.config.options.targetFileName || !project.config.options.targetFileName[0]))
         {
            //delete project.config.options.targetFileName;
            
            project.options.targetFileName = /*CopyString(*/project.moduleName/*)*/;
            project.config.options.optimization = none;
            project.config.options.debug = true;
            //project.config.options.warnings = unset;
            project.config.options.memoryGuard = false;
            project.config.compilingModified = true;
            project.config.linkingModified = true;
         }
         else if(!project.topNode.name && project.config)
         {
            project.topNode.name = CopyString(project.config.options.targetFileName);
         }

         /* // THIS IS NOW AUTOMATED WITH A project CHECK IN ProjectNode
         project.topNode.configurations = project.configurations;
         project.topNode.platforms = project.platforms;
         project.topNode.options = project.options;*/
      }
   }
   return project;
}
