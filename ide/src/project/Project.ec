#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

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
      // ide.UpdateMakefiles(); -- can't really regenerate on Load since all recent menus changes will happen
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
      f.Printf("\n");
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
         f.Printf("\n");
      }
      list.Free();
      list.count = 0;
   }
   else
      f.Printf("\n");
   f.Printf("\n");
   delete breaks;
   return numOfBreaks;
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
         f.Printf(" \\\n\t");
      for(item : list)
      {
         if(method == lineEach)
            f.Printf(" \\\n\t");
         f.Printf(" -%s", option);
         if(noSpace)
            OutputNoSpace(f, item);
         else
            f.Printf("%s", item);
      }
   }
}

static void OutputLibraries(File f, Array<String> libraries)
{
   for(item : libraries)
   {
      char ext[MAX_EXTENSION];
      char temp[MAX_LOCATION];
      char * s = item;
      GetExtension(item, ext);
      if(!strcmp(ext, "o") || !strcmp(ext, "a"))
         f.Printf(" ");
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
         f.Printf(" -l");
      }
      OutputNoSpace(f, s);
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


// we should have some kind of direct mapping between a platform and it's makefile variable
char * PlatformToMakefileVariable(Platform platform)
{
   return platform == win32 ? "WINDOWS" :
          platform == tux   ? "LINUX"   :
          platform == apple ? "OSX"/*"APPLE"*/ :
                              platform;
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

class Project : struct
{
   class_no_expansion;  // To use Find on the Container<Project> in Workspace::projects
                        // We might want to tweak this default behavior of regular classes ?
                        // Expansion/the current default kind of Find matching we want for things like BitmapResource, FontResource (Also regular classes)
public:
   float version;
   String moduleName;

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

   ~Project()
   {
      /* // THIS IS NOW AUTOMATED WITH A project CHECK IN ProjectNode
      topNode.configurations = null;
      topNode.platforms = null;
      topNode.options = null;
      */

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
      delete filePath;
      delete topNode;
      delete name;
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


   char * GetObjDirExpression(CompilerConfig compiler, ProjectConfig config)
   {
      // TODO: Support platform options
      char * expression = localObjectsDirectory;
      if(!expression)
         expression = settingsObjectsDirectory;
      return expression;
   }

   DirExpression GetObjDir(CompilerConfig compiler, ProjectConfig config)
   {
      char * expression = GetObjDirExpression(compiler, config);
      DirExpression objDir { type = intermediateObjectsDir };
      objDir.Evaluate(expression, this, compiler, config);
      return objDir;
   }

   char * GetTargetDirExpression(CompilerConfig compiler, ProjectConfig config)
   {
      // TODO: Support platform options
      char * expression = localTargetDirectory;
      if(!expression)
         expression = settingsTargetDirectory;
      return expression;
   }

   DirExpression GetTargetDir(CompilerConfig compiler, ProjectConfig config)
   {
      char * expression = GetTargetDirExpression(compiler, config);
      DirExpression targetDir { type = DirExpressionType::targetDir /*intermediateObjectsDir*/};
      targetDir.Evaluate(expression, this, compiler, config);
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

   void SetPath(bool projectsDirs, CompilerConfig compiler, ProjectConfig config)
   {
#ifndef MAKEFILE_GENERATOR
      ide.SetPath(projectsDirs, compiler, config);
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
            break;
         case staticLibrary:
            strcat(string, ".a");
            break;
      }
   }

   void GetCompilerConfigsDir(char * cfDir)
   {
      strcpy(cfDir, topNode.path);
      if(compilerConfigsDir && compilerConfigsDir[0])
         PathCatSlash(cfDir, compilerConfigsDir);
      else if(ideSettings.compilerConfigsDir && ideSettings.compilerConfigsDir[0])
         PathCatSlash(cfDir, ideSettings.compilerConfigsDir);
      if(cfDir && cfDir[0] && cfDir[strlen(cfDir)-1] != '/')
         strcat(cfDir, "/");
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

   bool ProcessBuildPipeOutput(DualPipe f, DirExpression objDirExp, bool isARun, ProjectNode onlyNode,
      CompilerConfig compiler, ProjectConfig config)
   {
      char line[65536];
      bool compiling = false, linking = false, precompiling = false;
      int compilingEC = 0;
      int numErrors = 0, numWarnings = 0;
      bool loggedALine = false;
      char * configName = config.name;
      int lenMakeCommand = strlen(compiler.makeCommand);

      char cppCommand[MAX_LOCATION];
      char ccCommand[MAX_LOCATION];
      char ecpCommand[MAX_LOCATION];
      char eccCommand[MAX_LOCATION];
      char ecsCommand[MAX_LOCATION];
      char earCommand[MAX_LOCATION];

      char * cc = compiler.ccCommand;
      char * cpp = compiler.cppCommand;
      sprintf(cppCommand, "%s%s%s%s ",
            compiler.ccacheEnabled ? "ccache " : "",
            compiler.ccacheEnabled && !compiler.distccEnabled ? " " : "",
            compiler.distccEnabled ? "distcc " : "",
            compiler.cppCommand);
      sprintf(ccCommand, "%s%s%s%s ",
            compiler.ccacheEnabled ? "ccache " : "",
            compiler.ccacheEnabled && !compiler.distccEnabled ? " " : "",
            compiler.distccEnabled ? "distcc " : "",
            compiler.ccCommand);
      sprintf(ecpCommand, "%s ", compiler.ecpCommand);
      sprintf(eccCommand, "%s ", compiler.eccCommand);
      sprintf(ecsCommand, "%s ", compiler.ecsCommand);
      sprintf(earCommand, "%s ", compiler.earCommand);

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
               char * inFileIncludedFrom = strstr(line, stringInFileIncludedFrom);
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
               else if(strstr(line, "ear ") == line);
               else if(strstr(line, "strip ") == line);
               else if(strstr(line, ccCommand) == line || strstr(line, ecpCommand) == line || strstr(line, eccCommand) == line)
               {
                  char moduleName[MAX_FILENAME];
                  byte * tokens[1];
                  char * module;
                  bool isPrecomp = false;

                  if(strstr(line, ccCommand) == line)
                  {
                     module = strstr(line, " -c ");
                     if(module) module += 4;
                  }
                  else if(strstr(line, eccCommand) == line)
                  {
                     module = strstr(line, " -c ");
                     if(module) module += 4;
                     //module = line + 3;
                     // Don't show GCC warnings about generated C code because it does not compile clean yet...
                     compilingEC = 3;//2;
                  }
                  else if(strstr(line, ecpCommand) == line)
                  {
                     // module = line + 8;
                     module = strstr(line, " -c ");
                     if(module) module += 4;
                     isPrecomp = true;
                     compilingEC = 0;
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
                     numErrors++;
                  }

                  if(compilingEC) compilingEC--;
               }
               else if(strstr(line, "ar rcs") == line)
                  ide.outputView.buildBox.Logf($"Building library...\n");
               else if(strstr(line, ecsCommand) == line)
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
                           numErrors++;
                           strcpy(moduleName, $"Linker Error");
                        }
                        else
                        {
                           strcpy(temp, topNode.path);
                           PathCatSlash(temp, moduleName);
                           MakePathRelative(temp, topNode.path, moduleName);
                        }
                        if(strstr(line, "error:"))
                           numErrors ++;
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
                                 numErrors ++;
                              }
                           }
                           else if((pointer = strstr(line, "No such file")))
                           {
                              strncat(moduleName, colon, pointer - colon);
                              strcat(moduleName, "error: ");
                              colon = pointer;
                              numErrors ++;
                           }
                           else if(compilingEC == 1 || (objDir && objDir == moduleName))
                              continue;
                           else if(strstr(line, "warning:"))
                           {
                              numWarnings++;
                           }
                        }
                        if(this == ide.workspace.projects.firstIterator.data)
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
            if(!onlyNode)
               ide.outputView.buildBox.Logf("\n%s (%s) - ", GetTargetFileName(config), configName);
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

   bool Build(bool isARun, ProjectNode onlyNode, CompilerConfig compiler, ProjectConfig config)
   {
      bool result = false;
      DualPipe f;
      char targetFileName[MAX_LOCATION] = "";
      char makeTarget[MAX_LOCATION] = "";
      char makeFile[MAX_LOCATION];
      char makeFilePath[MAX_LOCATION];
      char configName[MAX_LOCATION];
      DirExpression objDirExp = GetObjDir(compiler, config);
      PathBackup pathBackup { };

      int numJobs = compiler.numJobs;
      char command[MAX_LOCATION];
      char * compilerName;

      compilerName = CopyString(compiler.name);
      CamelCase(compilerName);

      strcpy(configName, config ? config.name : "Common");

      SetPath(false, compiler, config); //true
      CatTargetFileName(targetFileName, compiler, config);

      strcpy(makeFilePath, topNode.path);
      CatMakeFileName(makeFile, config);
      PathCatSlash(makeFilePath, makeFile);
      
      // TODO: TEST ON UNIX IF \" around makeTarget is ok
      if(onlyNode)
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
            GetCompilerConfigsDir(cfDir);
            GetWorkingDir(pushD, sizeof(pushD));
            ChangeWorkingDir(topNode.path);
            // Create object dir if it does not exist already
            if(!FileExists(objDirExp.dir).isDirectory)
               Execute("%s E_IDE_CF_DIR=%s COMPILER=%s objdir -C \"%s\" -f \"%s\"", compiler.makeCommand, cfDir, compilerName, topNode.path, makeFilePath);
            ChangeWorkingDir(pushD);

            PathCatSlash(makeTarget+1, objDirExp.dir);
            PathCatSlash(makeTarget+1, onlyNode.name);
            StripExtension(makeTarget+1);
            strcat(makeTarget+1, ".o");
            makeTarget[0] = '\"';
            len = strlen(makeTarget);
            makeTarget[len++] = '\"';
            makeTarget[len++] = '\0';
         }
      }

      if(compiler.type.isVC)
      {
         bool result = false;
         char oldwd[MAX_LOCATION];
         GetWorkingDir(oldwd, sizeof(oldwd));
         ChangeWorkingDir(topNode.path);

         sprintf(command, "%s /useenv /nologo /logcommands %s.sln %s|Win32", compiler.makeCommand, name, config.name);
         ide.outputView.buildBox.Logf("command: %s\n", command);
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
         GetCompilerConfigsDir(cfDir);
         sprintf(command, "%s E_IDE_CF_DIR=%s COMPILER=%s -j%d %s%s%s -C \"%s\" -f \"%s\"", compiler.makeCommand, cfDir, compilerName, numJobs,
               compiler.ccacheEnabled ? "CCACHE=y " : "",
               compiler.distccEnabled ? "DISTCC=y " : "",
               makeTarget, topNode.path, makeFilePath);
         if((f = DualPipeOpen(PipeOpenMode { output = true, error = true, input = true }, command)))
         {
            result = ProcessBuildPipeOutput(f, objDirExp, isARun, onlyNode, compiler, config);
            delete f;
         }
         else
            ide.outputView.buildBox.Logf($"Error executing make (%s) command\n", compiler.makeCommand);
      }

      delete pathBackup;
      delete objDirExp;
      delete compilerName;
      return result;
   }

   void Clean(CompilerConfig compiler, ProjectConfig config, bool realclean)
   {
      char makeFile[MAX_LOCATION];
      char makeFilePath[MAX_LOCATION];
      char command[MAX_LOCATION];
      char * compilerName;
      DualPipe f;
      PathBackup pathBackup { };

      compilerName = CopyString(compiler.name);
      CamelCase(compilerName);

      SetPath(false, compiler, config);

      strcpy(makeFilePath, topNode.path);
      CatMakeFileName(makeFile, config);
      PathCatSlash(makeFilePath, makeFile);
      
      if(compiler.type.isVC)
      {
         bool result = false;
         char oldwd[MAX_LOCATION];
         GetWorkingDir(oldwd, sizeof(oldwd));
         ChangeWorkingDir(topNode.path);
         
         sprintf(command, "%s /useenv /clean /nologo /logcommands %s.sln %s|Win32", compiler.makeCommand, name, config.name);
         ide.outputView.buildBox.Logf("command: %s\n", command);
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
         GetCompilerConfigsDir(cfDir);
         sprintf(command, "%s E_IDE_CF_DIR=%s COMPILER=%s %sclean -C \"%s\" -f \"%s\"", compiler.makeCommand, cfDir, compilerName, realclean ? "real" : "", topNode.path, makeFilePath);
         if((f = DualPipeOpen(PipeOpenMode { output = 1, error = 1, input = 2 }, command)))
         {
            ide.outputView.buildBox.Tell($"Deleting target and object files...");
            ProcessCleanPipeOutput(f, compiler, config);
            delete f;

            ide.outputView.buildBox.Logf($"Target and object files deleted\n");
         }
      }

      delete pathBackup;
      delete compilerName;
   }

   void Run(char * args, CompilerConfig compiler, ProjectConfig config)
   {   
      String target = new char[maxPathLen];
      char oldDirectory[MAX_LOCATION];
      DirExpression targetDirExp = GetTargetDir(compiler, config);
      PathBackup pathBackup { };

      // Build(project, ideMain, true, null);

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
      SetPath(true, compiler, config);
      if(compiler.execPrefixCommand)
      {
         char * prefixedTarget = new char[strlen(compiler.execPrefixCommand) + strlen(target) + 2];
         prefixedTarget[0] = '\0';
         strcat(prefixedTarget, compiler.execPrefixCommand);
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

   void Compile(ProjectNode node, CompilerConfig compiler, ProjectConfig config)
   {
      Build(false, node, compiler, config);
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
            strcat(fileName, "$(SO)");
            break;
         case staticLibrary:
            strcat(fileName, "$(A)");
            break;
      }
   }

   bool GenerateDebugCf(CompilerConfig compiler)
   {
      bool result = false;
      char path[MAX_LOCATION];

      GetCompilerConfigsDir(path);
      if(!FileExists(path).isDirectory)
         MakeDir(path);
      PathCatSlash(path, "debug.cf");

      if(FileExists(path))
         DeleteFile(path);
      {
         File f = FileOpen(path, write);
         if(f)
         {
            f.Printf(".PHONY: debug_lists\n");
            f.Printf("\n");

            f.Printf("ifdef WINDOWS\n");
            f.Printf(".PHONY: debug_openssl\n");
            f.Printf("debug_openssl:\n");
            f.Printf("	@$(call echo,OPENSSL_CONF = $(OPENSSL_CONF))\n");
            f.Printf("	@$(call echo,_OPENSSL_CONF = $(_OPENSSL_CONF))\n");
            f.Printf("	@$(call echo,OPENSSL_INCLUDE_DIR = $(OPENSSL_INCLUDE_DIR))\n");
            f.Printf("	@$(call echo,OPENSSL_LIB_DIR = $(OPENSSL_LIB_DIR))\n");
            f.Printf("	@$(call echo,OPENSSL_BIN_DIR = $(OPENSSL_BIN_DIR))\n");
            f.Printf("endif\n");
            f.Printf("\n");

            f.Printf("debug_lists:\n");
            f.Printf("	@$(call echo,ECSOURCES = $(ECSOURCES))\n");
            f.Printf("	@$(call echo,SYMBOLS = $(SYMBOLS))\n");
            f.Printf("	@$(call echo,IMPORTS = $(IMPORTS))\n");
            f.Printf("	@$(call echo,COBJECTS = $(COBJECTS))\n");

            delete f;
         }
      }
      return result;
   }

   bool GenerateCrossPlatformCf()
   {
      bool result = false;
      char path[MAX_LOCATION];

      GetCompilerConfigsDir(path);
      if(!FileExists(path).isDirectory)
         MakeDir(path);
      PathCatSlash(path, "crossplatform.cf");

      if(FileExists(path))
         DeleteFile(path);
      {
         File include = FileOpen(":crossplatform.cf", read);
         if(include)
         {
            File f = FileOpen(path, write);
            if(f)
            {
               for(; !include.Eof(); )
               {
                  char buffer[4096];
                  int count = include.Read(buffer, 1, 4096);
                  f.Write(buffer, 1, count);
               }
               delete f;

               result = true;
            }
            delete include;
         }
      }
      return result;
   }

   bool GenerateCompilerMk(CompilerConfig compiler)
   {
      bool result = false;
      char path[MAX_LOCATION];
      char * name;
      char * compilerName;
      bool gccCompiler = compiler.ccCommand && strstr(compiler.ccCommand, "gcc") != null;
      Platform platform = GetRuntimePlatform();

      compilerName = CopyString(compiler.name);
      CamelCase(compilerName);
      name = PrintString(platform, "-", compilerName, ".cf");

      GetCompilerConfigsDir(path);
      if(!FileExists(path).isDirectory)
         MakeDir(path);
      PathCatSlash(path, name);

      if(FileExists(path))
         DeleteFile(path);
      {
         File f = FileOpen(path, write);
         if(f)
         {
            bool crossCompiling = compiler.targetPlatform != platform;

            f.Printf("# TOOLCHAIN\n\n");

            //f.Printf("SHELL := %s\n", "ar"/*compiler.arCommand*/); // is this really needed?
            f.Printf("CPP := $(CCACHE_COMPILE) $(DISTCC_COMPILE) %s\n", compiler.cppCommand);
            f.Printf("CC := $(CCACHE_COMPILE) $(DISTCC_COMPILE) %s\n", compiler.ccCommand);
            f.Printf("ECP := %s\n", compiler.ecpCommand);
            f.Printf("ECC := %s\n", compiler.eccCommand);
            f.Printf("ECS := %s%s%s\n", compiler.ecsCommand,
                  crossCompiling ? " -t " : "", crossCompiling ? (char*)compiler.targetPlatform : "");
            f.Printf("EAR := %s\n", compiler.earCommand);

            f.Printf("AS := as\n");
            f.Printf("LD := ld\n");
            f.Printf("AR := ar\n");
            f.Printf("STRIP := strip\n");
            f.Printf("UPX := upx\n");

            f.Printf("\n");

            f.Printf("UPXFLAGS = -9\n\n"); // TOFEAT: Compression Level Option? Other UPX Options?

            f.Printf("# HARD CODED PLATFORM-SPECIFIC OPTIONS\n");
            f.Printf("ifdef %s\n", PlatformToMakefileVariable(tux));
            f.Printf("OFLAGS += -Wl,--no-undefined\n");
            f.Printf("endif\n\n");

            // JF's
            f.Printf("ifdef %s\n", PlatformToMakefileVariable(apple));
            f.Printf("OFLAGS += -framework cocoa -framework OpenGL\n");
            f.Printf("endif\n\n");

            if(crossCompiling)
               f.Printf("PLATFORM = %s\n", (char *)compiler.targetPlatform);

            if((compiler.includeDirs && compiler.includeDirs.count) ||
                  (compiler.libraryDirs && compiler.libraryDirs.count))
            {
               if(compiler.includeDirs && compiler.includeDirs.count)
               {
                  f.Printf("CFLAGS +=");
                  OutputListOption(f, gccCompiler ? "isystem " : "I", compiler.includeDirs, lineEach, true);
                  f.Printf("\n");
               }
               if(compiler.libraryDirs && compiler.libraryDirs.count)
               {
                  f.Printf("OFLAGS +=");
                  OutputListOption(f, "L", compiler.libraryDirs, lineEach, true);
                  f.Printf("\n");
               }
               f.Printf("\n");
            }

            delete f;
         }
      }
      delete name;
      delete compilerName;
      return result;
   }

   bool GenerateMakefile(char * altMakefilePath, bool noResources, char * includemkPath,
      CompilerConfig compiler, ProjectConfig config)
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

#if defined(__WIN32__) && !defined(MAKEFILE_GENERATOR)
      if(compiler.type.isVC)
      {
         GenerateVSSolutionFile(this, compiler);
         GenerateVCProjectFile(this, compiler);
      }
      else
#endif
      f = FileOpen(altMakefilePath ? altMakefilePath : filePath, write);

      /*SetPath(false, compiler, config);
      GetWorkingDir(oldDirectory, MAX_LOCATION);
      ChangeWorkingDir(topNode.path);*/

      if(f)
      {
         bool test;
         int ifCount;
         Platform platform;
         Platform runtimePlatform = GetRuntimePlatform();
         char targetDir[MAX_LOCATION];
         char objDirExpNoSpaces[MAX_LOCATION];
         char objDirNoSpaces[MAX_LOCATION];
         char resDirNoSpaces[MAX_LOCATION];
         char targetDirExpNoSpaces[MAX_LOCATION];
         char fixedModuleName[MAX_FILENAME];
         char fixedConfigName[MAX_FILENAME];
         char fixedCompilerName[MAX_FILENAME];
         int c, len;
         int numCObjects = 0;
         bool sameObjTargetDirs;
         DirExpression objDirExp = GetObjDir(compiler, config);
         TargetTypes targetType = GetTargetType(config);

         bool crossCompiling = compiler.targetPlatform != runtimePlatform;
         bool gccCompiler = compiler.ccCommand && strstr(compiler.ccCommand, "gcc") != null;
         bool tccCompiler = compiler.ccCommand && strstr(compiler.ccCommand, "tcc") != null;
         bool defaultPreprocessor = compiler.cppCommand && (strstr(compiler.cppCommand, "gcc") != null || compiler.cppCommand && strstr(compiler.cppCommand, "cpp") != null);

         int objectsParts, eCsourcesParts;
         Array<String> listItems { };
         Map<String, int> varStringLenDiffs { };
         Map<String, NameCollisionInfo> namesInfo { };

         ReplaceSpaces(objDirNoSpaces, objDirExp.dir);
         strcpy(targetDir, GetTargetDirExpression(compiler, config));
         ReplaceSpaces(targetDirExpNoSpaces, targetDir);

         strcpy(objDirExpNoSpaces, GetObjDirExpression(compiler, config));
         ChangeCh(objDirExpNoSpaces, '\\', '/'); // TODO: this is a hack, paths should never include win32 path seperators - fix this in ProjectSettings and ProjectLoad instead
         ReplaceSpaces(objDirExpNoSpaces, objDirExpNoSpaces);
         ReplaceSpaces(resDirNoSpaces, resNode.path ? resNode.path : "");
         //ReplaceSpaces(fixedPrjName, name);
         ReplaceSpaces(fixedModuleName, moduleName);
         ReplaceSpaces(fixedConfigName, GetConfigName(config));
         ReplaceSpaces(fixedCompilerName, compiler.name);
         //CamelCase(fixedModuleName); // case is important for static linking
         CamelCase(fixedConfigName);
         CamelCase(fixedCompilerName);

         sameObjTargetDirs = !fstrcmp(objDirExpNoSpaces, targetDirExpNoSpaces);

         f.Printf(".PHONY: all objdir%s clean realclean\n\n", sameObjTargetDirs ? "" : " targetdir");

         f.Printf("# CONTENT\n\n");

         f.Printf("MODULE := %s\n", fixedModuleName);
         //f.Printf("VERSION = %s\n", version);
         f.Printf("CONFIG := %s\n", fixedConfigName);
         f.Printf("ifndef COMPILER\n");
         f.Printf("COMPILER := default\n");
         f.Printf("endif\n");

         f.Printf("ifndef DEBUG\n");
         f.Printf("OPTIMIZE :=");
         switch(GetOptimization(config))
         {
            case speed:
               f.Printf(" -O2");
               f.Printf(" -ffast-math");
               break;
            case size:
               f.Printf(" -Os");
               break;
         }
         if(GetDebug(config))
            f.Printf(" -g");
         f.Printf("\n");
         f.Printf("else\n");
         f.Printf("OPTIMIZE := -g\n");
         f.Printf("NOSTRIP := y\n");
         f.Printf("endif\n");

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
                     f.Printf("else\n");
                  ifCount++;
                  f.Printf("ifdef %s\n", PlatformToMakefileVariable(platform));

                  f.Printf("TARGET_TYPE = ");
                  f.Printf(TargetTypeToMakefileVariable(targetType));
                  f.Printf("\n");
               }
            }
            f.Printf("else\n"); // ifCount should always be > 0
         }
         f.Printf("TARGET_TYPE = ");
         f.Printf(TargetTypeToMakefileVariable(targetType));
         f.Printf("\n");
         if(test)
         {
            if(ifCount)
            {
               for(c = 0; c < ifCount; c++)
                  f.Printf("endif\n");
            }
         }
         f.Printf("\n");

         f.Printf("# FLAGS\n\n");

         f.Printf("CFLAGS =\n");
         f.Printf("CECFLAGS =\n");
         f.Printf("ECFLAGS =\n");
         f.Printf("OFLAGS =\n");
         f.Printf("LIBS =\n");
         f.Printf("\n");

         f.Printf("# INCLUDES\n\n");

         f.Printf("include %s\n", includemkPath ? includemkPath : "$(E_IDE_CF_DIR)crossplatform.cf");
         f.Printf("include $(E_IDE_CF_DIR)%s-%s.cf\n", (char*)runtimePlatform, fixedCompilerName);
         f.Printf("\n");

         f.Printf("# VARIABLES\n\n");

         f.Printf("ifndef DEBUG\n");
         f.Printf("OBJ = %s%s\n", objDirExpNoSpaces, objDirExpNoSpaces[0] ? "/" : "");
         f.Printf("else\n");
         f.Printf("OBJ = %s.debug%s\n", objDirExpNoSpaces, objDirExpNoSpaces[0] ? "/" : "");
         f.Printf("endif\n\n");

         f.Printf("RES = %s%s\n\n", resDirNoSpaces, resDirNoSpaces[0] ? "/" : "");

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
                     f.Printf("else\n");
                  ifCount++;
                  f.Printf("ifeq \"$(TARGET_TYPE)\" \"%s\"\n", TargetTypeToMakefileVariable(type));

                  GetMakefileTargetFileName(type, target, config);
                  f.Printf("ifndef DEBUG\n");
                  strcpy(targetNoSpaces, targetDir);
                  PathCatSlash(targetNoSpaces, target);
                  ReplaceSpaces(targetNoSpaces, targetNoSpaces);
                  f.Printf("TARGET = %s\n", targetNoSpaces);
                  f.Printf("else\n");
                  strcpy(targetNoSpaces, targetDir);
                  strcat(targetNoSpaces, ".debug");
                  PathCatSlash(targetNoSpaces, target);
                  ReplaceSpaces(targetNoSpaces, targetNoSpaces);
                  f.Printf("TARGET = %s\n", targetNoSpaces);
                  f.Printf("endif\n");
               }
            }
            f.Printf("else\n"); // ifCount should always be > 0
         }
         GetMakefileTargetFileName(targetType, target, config);
         f.Printf("ifndef DEBUG\n");
         strcpy(targetNoSpaces, targetDir);
         PathCatSlash(targetNoSpaces, target);
         ReplaceSpaces(targetNoSpaces, targetNoSpaces);
         f.Printf("TARGET = %s\n", targetNoSpaces);
         f.Printf("else\n");
         strcpy(targetNoSpaces, targetDir);
         strcat(targetNoSpaces, ".debug");
         PathCatSlash(targetNoSpaces, target);
         ReplaceSpaces(targetNoSpaces, targetNoSpaces);
         f.Printf("TARGET = %s\n", targetNoSpaces);
         f.Printf("endif\n");

         if(test)
         {
            if(ifCount)
            {
               for(c = 0; c < ifCount; c++)
                  f.Printf("endif\n");
            }
         }
         }
         f.Printf("\n");

         varStringLenDiffs["$(OBJ)"] = strlen(objDirNoSpaces) - 6;

         topNode.GenMakefileGetNameCollisionInfo(namesInfo, config);

         numCObjects = topNode.GenMakefilePrintNode(f, this, objects, namesInfo, listItems, config);
         if(numCObjects)
            listItems.Add(CopyString("$(OBJ)$(MODULE).main$(O)"));
         objectsParts = OutputFileList(f, "OBJECTS", listItems, varStringLenDiffs, null);

         {
            int c;
            char * map[3][2] = { { "COBJECTS", "C" }, { "SYMBOLS", "S" }, { "IMPORTS", "I" } };

            topNode.GenMakefilePrintNode(f, this, eCsources, namesInfo, listItems, config);
            eCsourcesParts = OutputFileList(f, "_ECSOURCES", listItems, varStringLenDiffs, null);

            f.Printf("ECSOURCES = $(call shwspace,$(_ECSOURCES))\n");
            if(eCsourcesParts > 1)
            {
               for(c = 1; c <= eCsourcesParts; c++)
                  f.Printf("ECSOURCES%d = $(call shwspace,$(_ECSOURCES%d))\n", c, c);
            }
            f.Printf("\n");

            for(c = 0; c < 3; c++)
            {
               if(eCsourcesParts > 1)
               {
                  int n;
                  f.Printf("%s =", map[c][0]);
                  for(n = 1; n <= eCsourcesParts; n++)
                     f.Printf(" $(%s%d)", map[c][0], n);
                  f.Printf("\n");
                  for(n = 1; n <= eCsourcesParts; n++)
                     f.Printf("%s%d = $(call shwspace,$(addprefix $(OBJ),$(patsubst %%.ec,%%$(%s),$(notdir $(_ECSOURCES%d)))))\n", map[c][0], n, map[c][1], n);
               }
               else if(eCsourcesParts == 1)
                  f.Printf("%s = $(call shwspace,$(addprefix $(OBJ),$(patsubst %%.ec,%%$(%s),$(notdir $(_ECSOURCES)))))\n", map[c][0], map[c][1]);
               f.Printf("\n");
            }
         }

         topNode.GenMakefilePrintNode(f, this, sources, null, listItems, config);
         OutputFileList(f, "SOURCES", listItems, varStringLenDiffs, "$(ECSOURCES)");

         if(!noResources)
            resNode.GenMakefilePrintNode(f, this, resources, null, listItems, config);
         OutputFileList(f, "RESOURCES", listItems, varStringLenDiffs, null);

         f.Printf("ifeq \"$(TARGET_TYPE)\" \"%s\"\n", TargetTypeToMakefileVariable(executable));
         f.Printf("CONSOLE = %s\n", GetConsole(config) ? "-mconsole" : "-mwindows");
         f.Printf("endif\n\n");

         if((config && config.options && config.options.libraries) ||
               (options && options.libraries))
         {
            f.Printf("ifneq \"$(TARGET_TYPE)\" \"%s\"\n", TargetTypeToMakefileVariable(staticLibrary));
            f.Printf("LIBS +=");
            if(config && config.options && config.options.libraries)
               OutputLibraries(f, config.options.libraries);
            else if(options && options.libraries)
               OutputLibraries(f, options.libraries);
            f.Printf("\n");
            f.Printf("endif\n");
            f.Printf("\n");
         }
         f.Printf("LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)\n\n");

         if(platforms || (config && config.platforms))
         {
            ifCount = 0;
            //for(platform = firstPlatform; platform <= lastPlatform; platform++)
            //for(platform = win32; platform <= apple; platform++)

            f.Printf("# PLATFORM-SPECIFIC OPTIONS\n\n");
            for(platform = (Platform)1; platform < Platform::enumSize; platform++)
            {
               PlatformOptions projectPlatformOptions, configPlatformOptions;
               MatchProjectAndConfigPlatformOptions(config, platform, &projectPlatformOptions, &configPlatformOptions);

               if(projectPlatformOptions || configPlatformOptions)
               {
                  if(ifCount)
                     f.Printf("else\n");
                  ifCount++;
                  f.Printf("ifdef ");
                  f.Printf(PlatformToMakefileVariable(platform));
                  f.Printf("\n\n");

                  if((projectPlatformOptions && projectPlatformOptions.options.preprocessorDefinitions && projectPlatformOptions.options.preprocessorDefinitions.count) ||
                     (configPlatformOptions && configPlatformOptions.options.preprocessorDefinitions && configPlatformOptions.options.preprocessorDefinitions.count) ||
                     (projectPlatformOptions && projectPlatformOptions.options.includeDirs && projectPlatformOptions.options.includeDirs.count) ||
                     (configPlatformOptions && configPlatformOptions.options.includeDirs && configPlatformOptions.options.includeDirs.count))
                  {
                     f.Printf("CFLAGS +=");
                     if(projectPlatformOptions && projectPlatformOptions.options.linkerOptions && projectPlatformOptions.options.linkerOptions.count)
                     {
                        f.Printf(" \\\n\t -Wl");
                        for(s : projectPlatformOptions.options.linkerOptions)
                           f.Printf(",%s", s);
                     }
                     if(configPlatformOptions && configPlatformOptions.options.linkerOptions && configPlatformOptions.options.linkerOptions.count)
                     {
                        f.Printf(" \\\n\t -Wl");
                        for(s : configPlatformOptions.options.linkerOptions)
                           f.Printf(",%s", s);
                     }
                     if(projectPlatformOptions && projectPlatformOptions.options.preprocessorDefinitions)
                        OutputListOption(f, "D", projectPlatformOptions.options.preprocessorDefinitions, newLine, false);
                     if(configPlatformOptions && configPlatformOptions.options.preprocessorDefinitions)
                        OutputListOption(f, "D", configPlatformOptions.options.preprocessorDefinitions, newLine, false );
                     if(configPlatformOptions && configPlatformOptions.options.includeDirs)
                        OutputListOption(f, "I", configPlatformOptions.options.includeDirs, lineEach, true);
                     if(projectPlatformOptions && projectPlatformOptions.options.includeDirs)
                        OutputListOption(f, "I", projectPlatformOptions.options.includeDirs, lineEach, true);
                     f.Printf("\n\n");
                  }

                  if((projectPlatformOptions && projectPlatformOptions.options.libraryDirs && projectPlatformOptions.options.libraryDirs.count) ||
                        (configPlatformOptions && configPlatformOptions.options.libraryDirs && configPlatformOptions.options.libraryDirs.count) ||
                        (projectPlatformOptions && projectPlatformOptions.options.libraries && projectPlatformOptions.options.libraries.count) ||
                        (configPlatformOptions && configPlatformOptions.options.libraries && configPlatformOptions.options.libraries.count))
                  {
                     f.Printf("ifneq \"$(TARGET_TYPE)\" \"%s\"\n", TargetTypeToMakefileVariable(staticLibrary));
                     if((projectPlatformOptions && projectPlatformOptions.options.libraryDirs && projectPlatformOptions.options.libraryDirs.count) ||
                        (configPlatformOptions && configPlatformOptions.options.libraryDirs && configPlatformOptions.options.libraryDirs.count))
                     {
                        f.Printf("OFLAGS +=");
                        if(configPlatformOptions && configPlatformOptions.options.libraryDirs)
                           OutputListOption(f, "L", configPlatformOptions.options.libraryDirs, lineEach, true);
                        if(projectPlatformOptions && projectPlatformOptions.options.libraryDirs)
                           OutputListOption(f, "L", projectPlatformOptions.options.libraryDirs, lineEach, true);
                        f.Printf("\n");
                     }

                     if(projectPlatformOptions && projectPlatformOptions.options.libraries &&
                           projectPlatformOptions.options.libraries.count)
                     {
                        f.Printf("LIBS +=");
                        OutputLibraries(f, projectPlatformOptions.options.libraries);
                        f.Printf("\n");
                     }
                     if((configPlatformOptions && configPlatformOptions.options.libraries &&
                           configPlatformOptions.options.libraries.count))
                     {
                        f.Printf("LIBS +=");
                        OutputLibraries(f, configPlatformOptions.options.libraries);
                        f.Printf("\n");
                     }
                     f.Printf("endif\n\n");
                  }
               }
            }
            if(ifCount)
            {
               for(c = 0; c < ifCount; c++)
                  f.Printf("endif\n");
            }
            f.Printf("\n");
         }

         f.Printf("CFLAGS +=");
         if(gccCompiler)
         {
            f.Printf(" -fmessage-length=0 $(OPTIMIZE)");
            //if(compiler.targetPlatform.is32Bits)
               f.Printf(" -m32");
            //else if(compiler.targetPlatform.is64Bits)
            //   f.Printf(" -m64");
            f.Printf(" $(FPIC)");
            //f.Printf(" -fpack-struct");
         }
         switch(GetWarnings(config))
         {
            case all: f.Printf(" -Wall"); break;
            case none: f.Printf(" -w"); break;
         }
         if(GetProfile(config))
            f.Printf(" -pg");
         if(options && options.linkerOptions && options.linkerOptions.count)
         {
            f.Printf(" \\\n\t -Wl");
            for(s : options.linkerOptions)
               f.Printf(",%s", s);
         }

         if(options && options.preprocessorDefinitions)
            OutputListOption(f, "D", options.preprocessorDefinitions, newLine, false);
         if(config && config.options && config.options.preprocessorDefinitions)
            OutputListOption(f, "D", config.options.preprocessorDefinitions, newLine, false);
         if(config && config.options && config.options.includeDirs)
            OutputListOption(f, "I", config.options.includeDirs, lineEach, true);
         if(options && options.includeDirs)
            OutputListOption(f, "I", options.includeDirs, lineEach, true);
         f.Printf("\n\n");

         f.Printf("CECFLAGS +=%s%s%s%s", defaultPreprocessor ? "" : " -cpp ", defaultPreprocessor ? "" : compiler.cppCommand,
               crossCompiling ? " -t " : "", crossCompiling ? (char*)compiler.targetPlatform : "");
         f.Printf("\n\n");

         f.Printf("ECFLAGS +=");
         if(GetMemoryGuard(config))
            f.Printf(" -memguard");
         if(GetStrictNameSpaces(config))
            f.Printf(" -strictns");
         if(GetNoLineNumbers(config))
            f.Printf(" -nolinenumbers");
         {
            char * s;
            if((s = GetDefaultNameSpace(config)) && s[0])
               f.Printf(" -defaultns %s", s);
         }
         f.Printf("\n\n");

         f.Printf("OFLAGS +=\n");
         f.Printf("ifneq \"$(TARGET_TYPE)\" \"%s\"\n", TargetTypeToMakefileVariable(staticLibrary));
         f.Printf("OFLAGS += -m32");
         if(GetProfile(config))
            f.Printf(" -pg");
         if(config && config.options && config.options.libraryDirs)
            OutputListOption(f, "L", config.options.libraryDirs, lineEach, true);
         if(options && options.libraryDirs)
            OutputListOption(f, "L", options.libraryDirs, lineEach, true);
         f.Printf("\n");
         f.Printf("endif\n\n");

         f.Printf("# TARGETS\n\n");

         f.Printf("all: objdir%s $(TARGET)\n\n", sameObjTargetDirs ? "" : " targetdir");

         f.Printf("objdir:\n");
            f.Printf("\t$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))\n");
         //f.Printf("# PRE-BUILD COMMANDS\n");
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
            //f.Printf("# PLATFORM-SPECIFIC PRE-BUILD COMMANDS\n");
            for(platform = (Platform)1; platform < Platform::enumSize; platform++)
            {
               PlatformOptions projectPOs, configPOs;
               MatchProjectAndConfigPlatformOptions(config, platform, &projectPOs, &configPOs);

               if((projectPOs && projectPOs.options.prebuildCommands && projectPOs.options.prebuildCommands.count) ||
                     (configPOs && configPOs.options.prebuildCommands && configPOs.options.prebuildCommands.count))
               {
                  if(ifCount)
                     f.Printf("else\n");
                  ifCount++;
                  f.Printf("ifdef ");
                  f.Printf(PlatformToMakefileVariable(platform));
                  f.Printf("\n");

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
                  f.Printf("endif\n");
            }
         }
         f.Printf("\n");

         if(!sameObjTargetDirs)
         {
            f.Printf("targetdir:\n");
               f.Printf("\t$(if $(wildcard %s),,$(call mkdirq,%s))\n\n", targetDirExpNoSpaces, targetDirExpNoSpaces);
         }

         if(numCObjects)
         {
            // Main Module (Linking) for ECERE C modules
            f.Printf("$(OBJ)$(MODULE).main.ec: $(SYMBOLS) $(COBJECTS)\n");
            // use of objDirExpNoSpaces used instead of $(OBJ) to prevent problematic joining of arguments in ecs
            f.Printf("\t$(ECS)%s $(ECSLIBOPT) $(SYMBOLS) $(IMPORTS) -symbols %s -o $(OBJ)$(MODULE).main.ec\n\n", 
               GetConsole(config) ? " -console" : "", objDirExpNoSpaces);
            // Main Module (Linking) for ECERE C modules
            f.Printf("$(OBJ)$(MODULE).main.c: $(OBJ)$(MODULE).main.ec\n");
            f.Printf("\t$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS)"
                  " -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.sym -symbols $(OBJ)\n");
            f.Printf("\t$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY)"
                  " -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.c -symbols $(OBJ)\n\n");
         }

         // *** Target ***

         // This would not rebuild the target on updated objects
         // f.Printf("$(TARGET): $(SOURCES) $(RESOURCES) | objdir $(SYMBOLS) $(OBJECTS)%s\n", sameObjTargetDirs ? "" : " targetdir");

         // This should fix it for good!
         f.Printf("$(SYMBOLS): | objdir\n");
         f.Printf("$(OBJECTS): | objdir\n");

         // This alone was breaking the tarball, object directory does not get created first (order-only rules happen last it seems!)
         f.Printf("$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir%s\n", sameObjTargetDirs ? "" : " targetdir");

         f.Printf("ifneq \"$(TARGET_TYPE)\" \"%s\"\n", TargetTypeToMakefileVariable(staticLibrary));
         f.Printf("\t$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)\n");
         if(!GetDebug(config))
         {
            f.Printf("ifndef NOSTRIP\n");
            f.Printf("\t$(STRIP) $(STRIPOPT) $(TARGET)\n");
            f.Printf("endif\n");

            if(GetCompress(config))
            {
               f.Printf("ifndef WINDOWS\n");
               f.Printf("ifeq \"$(TARGET_TYPE)\" \"%s\"\n", TargetTypeToMakefileVariable(executable));
                  f.Printf("\t$(UPX) $(UPXFLAGS) $(TARGET)\n");
               f.Printf("endif\n");
               f.Printf("else\n");
                  f.Printf("\t$(UPX) $(UPXFLAGS) $(TARGET)\n");
               f.Printf("endif\n");
            }
         }
         if(resNode.files && resNode.files.count && !noResources)
            resNode.GenMakefileAddResources(f, resNode.path, config);
         f.Printf("else\n");
         f.Printf("\t$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)\n");
         f.Printf("endif\n");

         //f.Printf("# POST-BUILD COMMANDS\n");
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
            //f.Printf("# PLATFORM-SPECIFIC POST-BUILD COMMANDS\n");
            for(platform = (Platform)1; platform < Platform::enumSize; platform++)
            {
               PlatformOptions projectPOs, configPOs;
               MatchProjectAndConfigPlatformOptions(config, platform, &projectPOs, &configPOs);

               if((projectPOs && projectPOs.options.postbuildCommands && projectPOs.options.postbuildCommands.count) ||
                     (configPOs && configPOs.options.postbuildCommands && configPOs.options.postbuildCommands.count))
               {
                  if(ifCount)
                     f.Printf("else\n");
                  ifCount++;
                  f.Printf("ifdef ");
                  f.Printf(PlatformToMakefileVariable(platform));
                  f.Printf("\n");

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
                  f.Printf("endif\n");
            }
         }
         f.Printf("\n");

         f.Printf("# SYMBOL RULES\n\n");
         {
            Map<Platform, bool> excludedPlatforms { };
            topNode.GenMakefilePrintSymbolRules(f, this, compiler, config, excludedPlatforms);
            delete excludedPlatforms;
         }

         f.Printf("# C OBJECT RULES\n\n");
         {
            Map<Platform, bool> excludedPlatforms { };
            topNode.GenMakefilePrintCObjectRules(f, this, compiler, config, excludedPlatforms);
            delete excludedPlatforms;
         }

         f.Printf("# OBJECT RULES\n\n");
         // todo call this still but only generate rules whith specific options
         // see we-have-file-specific-options in ProjectNode.ec
         {
            Map<Platform, bool> excludedPlatforms { };
            topNode.GenMakefilePrintObjectRules(f, this, namesInfo, compiler, config, excludedPlatforms);
            delete excludedPlatforms;
         }

         if(numCObjects)
            GenMakefilePrintMainObjectRule(f, compiler, config);

         f.Printf("clean: objdir%s\n", sameObjTargetDirs ? "" : " targetdir");
         f.Printf("\t$(call rmq,%s$(TARGET))\n", numCObjects ? "$(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S) " : "");
         OutputCleanActions(f, "OBJECTS", objectsParts);
         OutputCleanActions(f, "COBJECTS", eCsourcesParts);
         if(numCObjects)
         {
            OutputCleanActions(f, "IMPORTS", eCsourcesParts);
            OutputCleanActions(f, "SYMBOLS", eCsourcesParts);
         }
         f.Printf("\n");

         f.Printf("realclean: clean\n");
         f.Printf("\t$(call rmrq,$(OBJ))\n");
         if(!sameObjTargetDirs)
            f.Printf("\t$(call rmdirq,%s)\n", targetDirExpNoSpaces);
         f.Printf("\n");

         f.Printf("include $(E_IDE_CF_DIR)debug.cf\n");

         delete f;
         delete objDirExp;
         listItems.Free();
         delete listItems;
         varStringLenDiffs.Free();
         delete varStringLenDiffs;
         namesInfo.Free();
         delete namesInfo;

         result = true;
      }

      // ChangeWorkingDir(oldDirectory);
      // delete pathBackup;

      if(config)
         config.makingModified = false;
      return result;
   }

   void GenMakefilePrintMainObjectRule(File f, CompilerConfig compiler, ProjectConfig config)
   {
      char extension[MAX_EXTENSION] = "c";
      char modulePath[MAX_LOCATION];
      char fixedModuleName[MAX_FILENAME];
      DualPipe dep;
      char command[2048];
      char objDirNoSpaces[MAX_LOCATION];
      DirExpression objDirExp = GetObjDir(compiler, config);

      ReplaceSpaces(objDirNoSpaces, objDirExp.dir);
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
            f.Printf("$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c\n");
#if 0
         }
      }
#endif

      f.Printf("\t$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.%s -o $(OBJ)$(MODULE).main$(O)\n\n", extension);

      delete objDirExp;
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
               if(!project.config.options.libraryDirs) project.config.options.libraryDirs = { };
               project.config.options.libraryDirs.Add(CopyString(equal));
            }
            else if(!strcmpi(section, "Target") && !strcmpi(subSection, "IncludeDirs"))
            {
               if(!project.config.options.includeDirs) project.config.options.includeDirs = { };
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
                           result = type._vTbl[__ecereVMethodID_class_OnCompare](type, 
                              *(void **)((byte *)firstConfig.options + member.offset + member._class.offset),
                              *(void **)((byte *)cfg.options         + member.offset + member._class.offset));
                        }
                        else
                        {
                           result = type._vTbl[__ecereVMethodID_class_OnCompare](type, 
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
                     if(!type._vTbl[__ecereVMethodID_class_OnCompare](type, 
                        *(void **)((byte *)firstConfig.options + member.offset + member._class.offset),
                        *(void **)((byte *)nullOptions         + member.offset + member._class.offset)))
                        continue;
                  }
                  else
                  {
                     if(!type._vTbl[__ecereVMethodID_class_OnCompare](type, 
                        (byte *)firstConfig.options + member.offset + member._class.offset,
                        (byte *)nullOptions         + member.offset + member._class.offset))
                        continue;
                  }

                  if(!project.options) project.options = { };
                  
                  /*if(type.type == noHeadClass || type.type == normalClass)
                  {
                     type._vTbl[__ecereVMethodID_class_OnCopy](type, 
                        (byte *)project.options + member.offset + member._class.offset,
                        *(void **)((byte *)firstConfig.options + member.offset + member._class.offset));
                  }
                  else
                  {
                     void * address = (byte *)firstConfig.options + member.offset + member._class.offset;
                     // TOFIX: ListBox::SetData / OnCopy mess
                     type._vTbl[__ecereVMethodID_class_OnCopy](type, 
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
                           result = type._vTbl[__ecereVMethodID_class_OnCompare](type, 
                              *(void **)((byte *)firstConfig.options + member.offset + member._class.offset),
                              *(void **)((byte *)cfg.options         + member.offset + member._class.offset));
                        }
                        else
                        {
                           result = type._vTbl[__ecereVMethodID_class_OnCompare](type, 
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
                           type._vTbl[__ecereVMethodID_class_OnFree](type, 
                              *(void **)((byte *)cfg.options + member.offset + member._class.offset));
                        }
                        else
                        {
                           type._vTbl[__ecereVMethodID_class_OnFree](type, 
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

Project LoadProject(char * filePath)
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
