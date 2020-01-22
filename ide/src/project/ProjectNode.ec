#if !defined(ECERE_DOCUMENTOR) && !defined(ECERE_EPJ2MAKE) && !defined(TEST_SUITE)
import "ide"
#else
#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

import "Project"

#if !defined(ECERE_DOCUMENTOR) && !defined(ECERE_EPJ2MAKE) && !defined(TEST_SUITE)
import "FileSystemIterator"
#endif

static define app = ((GuiApplication)__thisModule);
#endif

#define OPTION(x) ((uint)(uintptr)(&((ProjectOptions)0).x))

static void OutputLog(const char * string)
{
#if !defined(ECERE_DOCUMENTOR) && !defined(ECERE_EPJ2MAKE) && !defined(TEST_SUITE)
   ide.outputView.buildBox.Log(string);
#else
   printf("%s", string);
#endif
}

bool eString_PathInsideOfMore(const char * path, const char * of, char * pathRest)
{
   if(!path[0] || !of[0])
      return false;  // What to do here? Ever used?
   else
   {
      char ofPart[MAX_FILENAME], ofRest[MAX_LOCATION];
      char pathPart[MAX_FILENAME]; //, pathRest[MAX_LOCATION];
      strcpy(ofRest, of);
      strcpy(pathRest, path);
      for(; ofRest[0] && pathRest[0];)
      {
         SplitDirectory(ofRest, ofPart, ofRest);
         SplitDirectory(pathRest, pathPart, pathRest);
         if(fstrcmp(pathPart, ofPart))
            return false;
      }
      if(!ofRest[0] && !pathRest[0])
         return false;
      else if(!pathRest[0])           // not inside of, it's the other way around
         return false;
      return true;
   }
}

enum NodeTypes { project, file, folder, resources, folderOpen, folderOpener/* todo: rename to folder launcher */ };
enum NodeIcons
{
   genFile, ewsFile, epjFile, folder, openFolder, ecFile, ehFile,
   sFile, cFile, hFile, cppFile, hppFile, textFile, webFile, pictureFile, soundFile,
   archiveFile, packageFile, opticalMediaImageFile, mFile, mmFile;

   NodeIcons ::SelectFileIcon(const char * filePath)
   {
      NodeIcons icon;
      if(filePath && filePath[0])
      {
         char extension[MAX_EXTENSION];
         GetExtension(filePath, extension);
         if(strlen(extension))
         {
            if(!strcmpi(extension, WorkspaceExtension))
               icon = ewsFile;
            else if(!strcmpi(extension, ProjectExtension))
               icon = epjFile;
            else if(!strcmpi(extension, "ec"))
               icon = ecFile;
            else if(!strcmpi(extension, "eh"))
               icon = ehFile;
            else if(!strcmpi(extension, "cpp") || !strcmpi(extension, "cc") ||
                  !strcmpi(extension, "cxx"))
               icon = cppFile;
            else if(!strcmpi(extension, "hpp") || !strcmpi(extension, "hh") ||
                  !strcmpi(extension, "hxx"))
               icon = hppFile;
            else if(!strcmpi(extension, "s"))
               icon = sFile;
            else if(!strcmpi(extension, "c"))
               icon = cFile;
            else if(!strcmpi(extension, "h"))
               icon = hFile;
            else if(!strcmpi(extension, "m"))
               icon = mFile;
            else if(!strcmpi(extension, "mm"))
               icon = mmFile;
            else if(!strcmpi(extension, "txt") || !strcmpi(extension, "text") ||
                  !strcmpi(extension, "nfo") || !strcmpi(extension, "info"))
               icon = textFile;
            else if(!strcmpi(extension, "htm") || !strcmpi(extension, "html") ||
                  !strcmpi(extension, "css") || !strcmpi(extension, "php") ||
                  !strcmpi(extension, "js"))
               icon = webFile;
            else if(!strcmpi(extension, "bmp") || !strcmpi(extension, "pcx") ||
                  !strcmpi(extension, "jpg") || !strcmpi(extension, "jpeg") ||
                  !strcmpi(extension, "gif") || !strcmpi(extension, "png") ||
                  !strcmpi(extension, "ico"))
               icon = pictureFile;
            else if(!strcmpi(extension, "wav") || !strcmpi(extension, "mp3") ||
                  !strcmpi(extension, "ogg") || !strcmpi(extension, "snd"))
               icon = soundFile;
            else if(!strcmpi(extension, "ear") || !strcmpi(extension, "7z") ||
                  !strcmpi(extension, "rar") || !strcmpi(extension, "zip") ||
                  !strcmpi(extension, "gz") || !strcmpi(extension, "bz2") ||
                  !strcmpi(extension, "tar") || !strcmpi(extension, "arj") ||
                  !strcmpi(extension, "lza") || !strcmpi(extension, "lzh") ||
                  !strcmpi(extension, "cpio") || !strcmpi(extension, "z"))
               icon = archiveFile;
            else if(!strcmpi(extension, "cab") || !strcmpi(extension, "deb") ||
                  !strcmpi(extension, "rpm"))
               icon = packageFile;
            else if(!strcmpi(extension, "iso") || !strcmpi(extension, "mds") ||
                  !strcmpi(extension, "cue") || !strcmpi(extension, "bin") ||
                  !strcmpi(extension, "ccd") || !strcmpi(extension, "bwt") ||
                  !strcmpi(extension, "cdi") || !strcmpi(extension, "nrg"))
               icon = opticalMediaImageFile;
            else
               icon = genFile;
         }
         else
            icon = genFile;
      }
      else
         icon = genFile; // tocheck: error icon?
      return icon;
   }

   NodeIcons ::SelectNodeIcon(NodeTypes type)
   {
      switch(type)
      {
         case project:
            return epjFile;
         case file:
            return genFile;
         case folder:
            return folder;
         case resources:
            return archiveFile;
         case folderOpen:
            return openFolder;
         case folderOpener:
            return openFolder; // todo: find or make better icon
      }
      return genFile;
   }
};

#define SELECTION_COLOR Color { 10, 36, 106 }

// On Windows & UNIX
#define SEPS    "/"
#define SEP     '/'

// this is so not working, why!
//struct TwoStrings
// return result was not even executed (did not step on while debugging)
class TwoStrings : struct
{
   char * a;
   char * b;

   property bool
   {
      get
      {
         return a && a[0];
      }
   }

   ~TwoStrings()
   {
      delete a;
      delete b;
   }
}

class DotMain : bool
{
   //property char * { set { } }
   DotMain ::FromFileName(const char * fileName)
   {
      DotMain dotMain = false;
      if(fileName && fileName[0])
      {
         char ext[MAX_EXTENSION];
         GetExtension(fileName, ext);
         if(!strcmp(ext, "c") || !strcmp(ext, "ec"))
         {
            char stripExt[MAX_LOCATION];
            strcpy(stripExt, fileName);
            StripExtension(stripExt);
            GetExtension(stripExt, ext);
            if(!strcmp(ext, "main"))
               dotMain = true;
         }
      }
      return dotMain;
   }
}

enum IntermediateFileType
{
   none, ec, c, sym, imp, bowl, o;

   //property char * { set { } }
   IntermediateFileType ::FromExtension(char * extension)
   {
      IntermediateFileType type = none;
      if(extension && extension[0])
      {
         if(!fstrcmp(extension, "ec"))
            type = ec;
         else if(!fstrcmp(extension, "c"))
            type = c;
         else if(!fstrcmp(extension, "sym"))
            type = sym;
         else if(!fstrcmp(extension, "imp"))
            type = imp;
         else if(!fstrcmp(extension, "bowl"))
            type = bowl;
         else if(!fstrcmp(extension, "o"))
            type = o;
      }
      return type;
   }
};

class ProjectNode : private ListItem
{
public:
   property String
   {
      set { return { fileName = value }; }
      // TOCHECK: Is this isset necessary at all?
      isset { return nodeType == file && !options && !configurations && !platforms && !files; }
   };
   property String folder
   {
      set
      {
         nodeType = folder;
         if(strchr(value, '/'))
         {
            char p[MAX_LOCATION];
            char n[MAX_FILENAME];
            GetLastDirectory(value, n);
            StripLastDirectory(value, p);
            name = CopyString(n);
            path = CopyString(p);
         }
         else
            name = CopyString(value);
      }
      get
      {
         // TOCHECK: Non Reentrant
         static char insidePath[MAX_LOCATION];

         strcpy(insidePath, (parent.type == project) ? "" : parent.path);
         PathCatSlash(insidePath, name);

         if(!fstrcmp(path, insidePath))
            return name;
         else
         {
            strcpy(insidePath, path);
            if(!insidePath[0]) strcpy(insidePath, ".");
            PathCatSlash(insidePath, name);
            return insidePath;
         }
      }
      isset { return nodeType == folder; }
   };
   property const String fileName
   {
      set
      {
         nodeType = file;
         if(strchr(value, '/'))
         {
            char p[MAX_LOCATION];
            char n[MAX_FILENAME];
            GetLastDirectory(value, n);
            StripLastDirectory(value, p);
            name = CopyValidateMakefilePath(n);
            path = CopyValidateMakefilePath(p);
         }
         else
            name = CopyValidateMakefilePath(value);
      }
      get
      {
         // TOCHECK: Non Reentrant
         static char insidePath[MAX_LOCATION];

         strcpy(insidePath, (parent.type == project) ? "" : parent.path);
         if(!fstrcmp(path, insidePath))
            return name;
         else
         {
            strcpy(insidePath, path);
            if(!insidePath[0]) strcpy(insidePath, ".");
            PathCatSlash(insidePath, name);
            return insidePath;
         }
      }
      isset { return nodeType == file && (options || configurations || platforms); }
   };

   LinkList<ProjectNode> files;
   property ProjectOptions options
   {
      get { return project ? project.options : options; }
      set { if(project) { delete project.options; project.options = value; } else { delete options; options = value; } }
      isset { ProjectOptions options = project ? project.options : this.options; return options && !options.isEmpty; }
   }
   property Array<PlatformOptions> platforms
   {
      get { return project ? project.platforms : platforms; }
      set
      {
         if(project) { project.platforms = value; }
         else
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
      }
      isset
      {
         Array<PlatformOptions> platforms = project ? project.platforms : this.platforms;
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
   property List<ProjectConfig> configurations
   {
      get { return project ? project.configurations : configurations; }
      set
      {
         if(project)
         {
            if(project.configurations)
            {
               project.configurations.Free();
               delete project.configurations;
            }
            project.configurations = value;
         }
         else
         {
            if(configurations) { configurations.Free(); delete configurations; }
            if(value)
            {
               List<ProjectConfig> empty { };
               Iterator<ProjectConfig> it { value };
               configurations = value;
               for(c : configurations)
               {
                  bool somethingSet = c.options && !c.options.isEmpty;
                  // TODO: Implement isset keyword
                  if(!somethingSet && c.platforms && c.platforms.count)
                  {
                     for(p : c.platforms)
                     {
                        if(p.options && !p.options.isEmpty)
                        {
                           somethingSet = true;
                           break;
                        }
                     }
                  }
                  if(!somethingSet)
                     empty.Add(c);
               }
               for(c : empty; it.Find(c)) configurations.Delete(it.pointer);
               delete empty;
            }
         }
      }
      isset
      {
         if(!parent) return true;
         if(configurations)
         {
            for(c : configurations)
            {
               bool somethingSet = c.options && !c.options.isEmpty;
               if(!somethingSet && c.platforms && c.platforms.count)
               {
                  for(p : c.platforms)
                  {
                     if(p.options && !p.options.isEmpty)
                     {
                        somethingSet = true;
                        break;
                     }
                  }
               }
               return somethingSet;
            }
         }
         return false;
      }
   }

private:
   ProjectOptions options;
   Array<PlatformOptions> platforms;
   List<ProjectConfig> configurations;
   ProjectNodeType nodeType;
   ProjectNode parent;
   char * name;
   char * info;

   // This holds the absolute path of the .epj for the project topnode (without the filename)
   // It holds a relative path to the topNode (project) for other nodes (folders and files)
   // For folders, it includes the folder it refers to. If there is a name difference between the
   // file system folder and the grouping folder of the project view, it maps to that folder.
   char * path;

   NodeTypes type;
   NodeIcons icon;
   int indent;
   DataRow row;

   bool modified;

   // This is only set for Top Nodes
   Project project;

   char * absolutePath; // absolute path for any type of node pointing to a file or folder
   char * realPath; // real (symlinks resolved) absolute path if different from absolutePath
   AVLTree<FilePath> paths { };

   void OpenRulesPlatformExclusionIfs(File f, int * ifCount, Array<Platform> platforms)
   {
      if(!platforms.Find(unknown))  // unknown is "Common"
      {
         // e.g. ifneq ($(or $(or $(OSX_TARGET),$(LINUX_TARGET)),$(WINDOWS_TARGET)),)
         int i = 0;
         f.Puts("ifneq (");
         for(i = 0; platforms.count && i < platforms.count - 1; i++)
            f.Puts("$(or ");
         i = 0;
         for(p : platforms)
         {
            if(i > 0)
               f.Puts(",");
            f.Puts("$(");
            f.Puts(PlatformToMakefileTargetVariable(p));
            f.Puts(")");
            if(i > 0)
               f.Puts(")");
            i++;
         }
         f.Puts(",)\n");
         (*ifCount)++;
      }
      else
         *ifCount = 0;
   }

   ProjectConfig GetMatchingNodeConfig(ProjectConfig prjConfig)
   {
      ProjectConfig nodeConfig = null;
      if(property::configurations && prjConfig)
      {
         const char * configName = prjConfig.name;
         for(cfg : property::configurations)
         {
            if(!strcmpi(cfg.name, configName))
            {
               nodeConfig = cfg;
               break;
            }
         }
      }
      return nodeConfig;
   }

   property ProjectNode root { get { ProjectNode n; for(n = this; n.parent; n = n.parent); return n; } }

   property bool containsFile
   {
      get
      {
         bool result = false;
         if(files)
         {
            for(child : files)
            {
               if(child.type == file ||
                     ((child.type == folder || child.type == folderOpen) && child.containsFile))
               {
                  result = true;
                  break;
               }
            }
         }
         else
            result = false;
         return result;
      }
   }

   char * GetFullFilePath(char * buffer, bool absolute, bool resolveVars)
   {
      if(buffer)
      {
         *buffer = 0;
         if(absolute)
            strcpy(buffer, root.path);
         if(resolveVars)
         {
            if(path && path[0])
            {
               DirExpression pathExp { };
               Project project = property::project;
               CompilerConfig compiler = GetCompilerConfig();
               ProjectConfig config = project.config;
               int bitDepth = GetBitDepth();
               pathExp.Evaluate(path, project, compiler, config, bitDepth);
               PathCatSlash(buffer, pathExp.dir);
               delete compiler;
               delete pathExp;
            }
            PathCatSlash(buffer, name);
         }
         else
         {
            PathCatSlash(buffer, path);
            PathCatSlash(buffer, name);
         }
      }
      return buffer;
   }

   char * GetObjectFileName(char * buffer, Map<CIString, NameCollisionInfo> namesInfo, IntermediateFileType type, bool dotMain, const char * objectFileExt)
   {
      if(buffer && (this.type == file || (this.type == project && dotMain == true)))
      {
         bool collision;
         char extension[MAX_EXTENSION];
         char moduleName[MAX_FILENAME];
         const char * objFileExt = objectFileExt ? objectFileExt : objectDefaultFileExt;
         NameCollisionInfo info;

         GetExtension(name, extension);
         ReplaceSpaces(moduleName, name);
         StripExtension(moduleName);
         info = namesInfo[moduleName];
         collision = info ? info.IsExtensionColliding(extension) : false;

         if(dotMain)
         {
            Project prj = property::project;
            ReplaceSpaces(buffer, prj.moduleName);
            StripExtension(buffer);
            strcat(buffer, ".main.ec");
         }
         else
            strcpy(buffer, name);
         if(!strcmp(extension, "ec") || dotMain)
         {
            if(type == c)
               ChangeExtension(buffer, "c", buffer);
            else if(type == sym)
               ChangeExtension(buffer, "sym", buffer);
            else if(type == imp)
               ChangeExtension(buffer, "imp", buffer);
            else if(type == bowl)
               ChangeExtension(buffer, "bowl", buffer);
         }
         if(type == o)
         {
            if(collision)
            {
               strcat(buffer, ".");
               strcat(buffer, objFileExt);
            }
            else
               ChangeExtension(buffer, objFileExt, buffer);
         }
      }
      return buffer;
   }

   char * GetFileSysMatchingPath(char * buffer)
   {
      if(buffer)
      {
         ProjectNode n, root = this.root;
         for(n = this; n && (n.type == folder || n.type == project); n = n.parent)
         {
            strcpy(buffer, root.path);
            if(n != root)
               PathCatSlash(buffer, n.path);
            if(FileExists(buffer).isDirectory)
               break;
         }
         if(!(n && (n.type == folder || n.type == project)))
            buffer[0] = '\0';
      }
      return buffer;
   }

   void CollectPerFileAndDirOptions(ProjectConfig prjConfig, Array<String> perFilePreprocessorDefs, Array<DirPath> perFileIncludeDirs)
   {
      ProjectNode node = null;
      ProjectConfig config = GetMatchingNodeConfig(prjConfig);
      List<ProjectNode> nodeStack { };

      for(node = this; node && node.parent; node = node.parent)
         nodeStack.Add(node);

      // Should we reverse this stack to give priority to the per-file includes? Does the following technique already reverse?

      // TODO: Check how to fix duplication of following options when configuration is made per-config-per-file
      while((node = nodeStack.lastIterator.data))
      {
         ProjectOptions nodeOptions = node.property::options;
         if(nodeOptions && nodeOptions.preprocessorDefinitions)
         {
            for(def : nodeOptions.preprocessorDefinitions)
               perFilePreprocessorDefs.Add(CopyString(def));
         }
         if(config && config.options && config.options.preprocessorDefinitions)
         {
            for(def : config.options.preprocessorDefinitions)
               perFilePreprocessorDefs.Add(CopyString(def));
         }
         if(nodeOptions && nodeOptions.includeDirs)
         {
            for(dir : nodeOptions.includeDirs)
               perFileIncludeDirs.Add(CopySystemPath(dir));
         }
         if(config && config.options && config.options.includeDirs)
         {
            for(dir : config.options.includeDirs)
               perFileIncludeDirs.Add(CopySystemPath(dir));
         }
         nodeStack.lastIterator.Remove();
      }
      delete nodeStack;
   }


   property Project project
   {
      get
      {
         ProjectNode n = this;
         while(n && n.type != project) n = n.parent;
         return n ? (*&n.project) : null;
      }
   }

   void RenameConfig(const char * oldName, const char * newName)
   {
      if(files)
      {
         for(f : files; (f.configurations || f.files)) { f.RenameConfig(oldName, newName); }
      }
      if(property::configurations)
      {
         for(c : property::configurations; !strcmp(c.name, oldName))
         {
            delete c.name;
            c.name = CopyString(newName);
         }
      }
   }

   void DeleteConfig(ProjectConfig configToDelete)
   {
      if(files)
      {
         for(f : files; (f.configurations || f.files)) { f.DeleteConfig(configToDelete); }
      }
      if(property::configurations)
      {
         Iterator<ProjectConfig> c { property::configurations };
         while(c.Next())
         {
            ProjectConfig config = c.data;
            if(!strcmp(configToDelete.name, config.name))
            {
               c.Remove();
               delete config;
               break;
            }
         }
         if(!property::configurations.count)
            property::configurations = null;
      }
   }

   ProjectNode Backup()
   {
      ProjectNode backupNode { };

      if(files)
      {
         backupNode.files = { };
         for(f : files) backupNode.files.Add(f.Backup());
      }
      if(property::options)
         backupNode.options = property::options.Copy();

      if(property::platforms)
      {
         backupNode.platforms = { };
         for(p : property::platforms)
            backupNode.platforms.Add(p.Copy());
      }

      if(property::configurations)
      {
         backupNode.configurations = { };
         for(c : property::configurations)
            backupNode.configurations.Add(c.Copy());
      }
      return backupNode;
   }

   void Revert(ProjectNode backupNode)
   {
      if(files)
      {
         Iterator<ProjectNode> it { backupNode.files };
         for(f : files)
         {
            it.Next();
            f.Revert(it.data);
         }
      }

      property::options = backupNode.options ? backupNode.options.Copy() : null;
      if(backupNode.platforms)
      {
         Array<PlatformOptions> platforms { };
         property::platforms = platforms;

         for(p : backupNode.platforms)
            platforms.Add(p.Copy());
      }
      if(backupNode.configurations)
      {
         List<ProjectConfig> configurations { };
         property::configurations = configurations;
         for(c : backupNode.configurations)
            configurations.Add(c.Copy());
      }
   }

   void FixupNode(char * parentPath)
   {
      if(!parent)
      {
         type = project;
      }
      else if(nodeType == file)
      {
         type = file;
         if(!path)
         {
            path = CopyString((parent.type == folder || parent.type == resources) ? parentPath : "");
         }
      }
      else if(nodeType == folder)
      {
         type = folder;

         if(!path)
         {
            char temp[MAX_LOCATION];
            strcpy(temp, (parent.type == folder || parent.type == resources) ? parentPath : "");
            PathCatSlash(temp, name);
            path = CopyString(temp);
         }
      }

      if(!path)
         path = CopyString("");

      indent = parent ? parent.indent + 1 : 0;

      if(type == file)
         icon = NodeIcons::SelectFileIcon(name);
      else
         icon = NodeIcons::SelectNodeIcon(type);

      if(files)
      {
         for(f : files)
         {
            f.parent = this;

            if(type == project)
               parentPath[0] = '\0';
            else if(type == resources || type == folder)
               strcpy(parentPath, path);

            f.FixupNode(parentPath);
         }
      }
   }

   void resolvePaths()
   {
      char path[MAX_LOCATION];
      GetFullFilePath(path, true, true);
      if(path[0] && !paths.Find(path))
      {
         delete absolutePath;
         absolutePath = CopyString(path);
         paths.Add(absolutePath);
      }
#if !defined(ECERE_DOCUMENTOR) && !defined(ECERE_EPJ2MAKE) && !defined(TEST_SUITE)
      if(absolutePath)
      {
         getRealPath(absolutePath, path);
         if(path[0] && !paths.Find(path))
         {
            delete realPath;
            realPath = CopyString(path);
            paths.Add(realPath);
         }
      }
#endif

      if(files)
      {
         for(f : files)
         {
            f.resolvePaths();
         }
      }
   }

   const char * getRightPath(const char * filePath)
   {
      const char * rightPath = null;
      if(paths.Find(filePath))
         rightPath = absolutePath ? absolutePath : filePath;

      if(!rightPath && files)
      {
         for(f : files)
         {
            rightPath = f.getRightPath(filePath);
            if(rightPath) break;
         }
      }

      if(rightPath && (rightPath == filePath || !fstrcmp(filePath, rightPath)))
         rightPath = null;
      return rightPath;
   }

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      if(onType && *onType)
      {
         // TOCHECK: Called from ECON/JSON writer
         if(nodeType == file && !property::options && !property::configurations && !property::platforms && name)
         {
            strcpy(tempString, "\"");
            strcat(tempString, property::fileName);
            strcat(tempString, "\"");
            return tempString;
         }
         else
            return null;
      }
      else
         // TOCHECK: Called from ProjectView rendering
         return name ? name : "";
   }

   ~ProjectNode()
   {
      if(files)
      {
         files.Free();
         delete files;
      }
      if(!project)
         delete options;

      if(!project && platforms)
      {
         platforms.Free();
         delete platforms;
      };
      if(!project && configurations)
      {
         configurations.Free();
         delete configurations;
      }

      delete realPath;
      delete absolutePath;
      paths.Free();

      /////////////////////////////
      delete path;
      delete name;
      delete info;
   }

   property bool isInResources
   {
      get
      {
         ProjectNode node;
         for(node = this; node; node = node.parent)
         {
            if(node.type == resources)
               return true;
         }
         return false;
      }
   }

   TwoStrings GetPlatformSpecificFu(ProjectConfig prjConfig)
   {
      TwoStrings result { a = CopyString(""), b = CopyString("") };
      // note: unknown platform is for common
      Map<Platform, SetBool> exclusionInfo { };
      MapNode<Platform, SetBool> mn;
      char * exp;
      const char * var;
      int len;
      SetBool common;

      CollectExclusionInfo(exclusionInfo, prjConfig);
      common = exclusionInfo[unknown];
      {
         Map<Platform, SetBool> cleaned { };
         SetBool opposite = common == true ? false : true;
         for(mn = exclusionInfo.root.minimum; mn; mn = mn.next)
         {
            if(mn.key == unknown || mn.value == opposite)
              cleaned[mn.key] = mn.value;
         }
         delete exclusionInfo;
         exclusionInfo = cleaned;
      }

      if(exclusionInfo.count > 1)
      {
         if(exclusionInfo.count > 2)
         {
            exp = result.a;
            len = strlen(exp) + strlen("$(if $(or ");
            exp = renew exp char[len+1];
            strcat(exp, "$(if $(or ");
            result.a = exp;

            for(mn = exclusionInfo.root.minimum; mn; mn = mn.next)
            {
               if(mn.key != unknown)
               {
                  const char * comma = mn.next ? "," : "";

                  var = PlatformToMakefileTargetVariable(mn.key);

                  exp = result.a;
                  len = strlen(exp) + strlen("$(") + strlen(var) + strlen(")") + strlen(comma);
                  exp = renew exp char[len+1];
                  strcat(exp, "$(");
                  strcat(exp, var);
                  strcat(exp, ")");
                  strcat(exp, comma);
                  result.a = exp;
               }
            }

            exp = result.a;
            len = strlen(exp) + strlen("),");
            exp = renew exp char[len+1];
         }
         else
         {
            if(exclusionInfo.root.minimum.key != unknown)
               var = PlatformToMakefileTargetVariable(exclusionInfo.root.minimum.key);
            else
               var = PlatformToMakefileTargetVariable(exclusionInfo.root.minimum.next.key);

            exp = result.a;
            len = strlen(exp) + strlen("$(if $(") + strlen(var) + strlen("),");
            exp = renew exp char[len+1];
            strcat(exp, "$(if $(");
            strcat(exp, var);
         }

         strcat(exp, "),");
         result.a = exp;

         exp = common == true ? result.b : result.a;
         len = strlen(exp) + strlen(",");
         exp = renew exp char[len+1];
         strcat(exp, ",");
         if(common == true) result.b = exp; else result.a = exp;

         exp = result.b;
         len = strlen(exp) + strlen(")");
         exp = renew exp char[len+1];
         strcat(exp, ")");
         result.b = exp;
      }
      delete exclusionInfo;

      return result;
   }

   bool GetIsExcluded(ProjectConfig prjConfig)
   {
      bool result;
      // note: unknown platform is for common
      Map<Platform, SetBool> exclusionInfo { };
      CollectExclusionInfo(exclusionInfo, prjConfig);
      if(exclusionInfo.count == 0)
         result = false;
      else if(exclusionInfo.count == 1)
         result = exclusionInfo.root.minimum.value == true;
      else
      {
         SetBool check = exclusionInfo.root.minimum.value;
         MapNode<Platform, SetBool> mn;
         for(mn = exclusionInfo.root.minimum; mn; mn = mn.next)
         {
            if(check != mn.value)
               break;
         }
         if(!mn) // all are same
            result = check == true;
         else
            result = false;
      }
      delete exclusionInfo;
      return result;
   }

   bool GetIsExcludedForCompiler(ProjectConfig prjConfig, CompilerConfig compiler)
   {
      bool result;
      Map<Platform, SetBool> exclusionInfo { };
      SetBool common, platform;
      CollectExclusionInfo(exclusionInfo, prjConfig);
      common = exclusionInfo[unknown];
      platform = exclusionInfo[compiler.targetPlatform];
      result = platform == true || (common == true && platform == unset);
      delete exclusionInfo;
      return result;
   }

   void CollectExclusionInfo(Map<Platform, SetBool> output, ProjectConfig prjConfig)
   {
      // note: unknown platform is for common
      Platform platform;
      ProjectConfig config = GetMatchingNodeConfig(prjConfig);
      ProjectOptions options = property::options;
      Array<PlatformOptions> platforms = property::platforms;

      if(parent)
         parent.CollectExclusionInfo(output, prjConfig);
      else
         output[unknown] = unset;

      if(options && options.excludeFromBuild)
         output[unknown] = options.excludeFromBuild;

      if(config && config.options && config.options.excludeFromBuild)
         output[unknown] = config.options.excludeFromBuild;

      if(platforms)
      {
         for(p : platforms)
         {
            if(p.options.excludeFromBuild && (platform = p.name))
               output[platform] = p.options.excludeFromBuild;
         }
      }
      if(config && config.platforms)
      {
         for(p : config.platforms)
         {
            if(p.options.excludeFromBuild && (platform = p.name))
               output[platform] = p.options.excludeFromBuild;
         }
      }
   }

   bool GetAlwaysBuild(ProjectConfig prjConfig)
   {
      bool result;
      // note: unknown platform is for common
      Map<Platform, SetBool> alwaysBuildInfo { };
      CollectAlwaysBuildInfo(alwaysBuildInfo, prjConfig);
      if(alwaysBuildInfo.count == 0)
         result = false;
      else if(alwaysBuildInfo.count == 1)
         result = alwaysBuildInfo.root.minimum.value == true;
      else
      {
         SetBool check = alwaysBuildInfo.root.minimum.value;
         MapNode<Platform, SetBool> mn;
         for(mn = alwaysBuildInfo.root.minimum; mn; mn = mn.next)
         {
            if(check != mn.value)
               break;
         }
         if(!mn) // all are same
            result = check == true;
         else
            result = false;
      }
      delete alwaysBuildInfo;
      return result;
   }

   void CollectAlwaysBuildInfo(Map<Platform, SetBool> output, ProjectConfig prjConfig)
   {
      // note: unknown platform is for common
      Platform platform;
      ProjectConfig config = GetMatchingNodeConfig(prjConfig);
      ProjectOptions options = property::options;
      Array<PlatformOptions> platforms = property::platforms;

      if(parent)
         parent.CollectAlwaysBuildInfo(output, prjConfig);
      else
         output[unknown] = unset;

      if(options && options.alwaysBuild)
         output[unknown] = options.alwaysBuild;

      if(config && config.options && config.options.alwaysBuild)
         output[unknown] = config.options.alwaysBuild;

      if(platforms)
      {
         for(p : platforms)
         {
            if(p.options.alwaysBuild && (platform = p.name))
               output[platform] = p.options.alwaysBuild;
         }
      }
      if(config && config.platforms)
      {
         for(p : config.platforms)
         {
            if(p.options.alwaysBuild && (platform = p.name))
               output[platform] = p.options.alwaysBuild;
         }
      }
   }

   void EnsureVisible()
   {
      if(parent)
         parent.EnsureVisible();
      row.collapsed = false;
   }

   void Delete()
   {
      if(parent)
         parent.files.Delete(this);
   }

   ProjectNode Find(const char * name, bool includeResources)
   {
      ProjectNode result = null;
      if(files)
      {
         for(child : files)
         {
            if(includeResources || child.type != resources)
            {
               if(child.type != folder && child.name && !strcmpi(child.name, name))
               {
                  result = child;
                  break;
               }
               result = child.Find(name, includeResources);
               if(result)
                  break;
            }
         }
      }
      return result;
   }

   ProjectNode FindWithPath(const char * name, bool includeResources)
   {
      ProjectNode result = null;
      if(files)
      {
         for(child : files)
         {
            if(includeResources || child.type != resources)
            {
               char path[MAX_LOCATION];
               strcpy(path, child.path);
               if(child.type != folder && child.name)
               {
                  PathCatSlash(path, child.name);
                  if(!strcmpi(path, name))
                  {
                     result = child;
                     break;
                  }
               }
               result = child.FindWithPath(name, includeResources);
               if(result)
                  break;
            }
         }
      }
      return result;
   }

   ProjectNode FindByFullPath(const char * path, bool includeResources)
   {
      if(files)
      {
         char name[MAX_FILENAME];
         GetLastDirectory(path, name);
         return InternalFindByFullPath(path, includeResources, name);
      }
      return null;
   }

   ProjectNode InternalFindByFullPath(const char * path, bool includeResources, const char * lastDirName)
   {
      ProjectNode result = null;
      if(files)
      {
         for(child : files)
         {
            if(includeResources || child.type != resources)
            {
               if(child.type != file)
                  result = child.InternalFindByFullPath(path, includeResources, lastDirName);
               else if(child.name && !fstrcmp(lastDirName, child.name))
               {
                  char p[MAX_LOCATION];
                  child.GetFullFilePath(p, true, true);
                  if(!fstrcmp(p, path))
                  {
                     result = child;
                     break;
                  }
               }
               if(result)
                  break;
            }
         }
      }
      return result;
   }

   ProjectNode FindByObjectFileName(const char * fileName, IntermediateFileType type, bool dotMain, Map<CIString, NameCollisionInfo> namesInfo, const char * objectFileExt)
   {
      char p[MAX_LOCATION];
      ProjectNode result = null;
      if(dotMain == true && this.type == project)
      {
         GetObjectFileName(p, namesInfo, type, dotMain, objectFileExt);
         if(!fstrcmp(p, fileName))
            result = this;
      }
      else if(files)
      {
         for(child : files; child.type != resources)
         {
            if(child.type != file && (result = child.FindByObjectFileName(fileName, type, dotMain, namesInfo, objectFileExt)))
               break;
            else if(child.type == file && child.name)
            {
               child.GetObjectFileName(p, namesInfo, type, dotMain, objectFileExt);
               if(!fstrcmp(p, fileName))
               {
                  result = child;
                  break;
               }
            }
         }
      }
      return result;
   }

   ProjectNode FindSpecial(const char * name, bool recursive, bool includeResources, bool includeFolders)
   {
      ProjectNode result = null;
      if(files)
      {
         for(child : files)
         {
            if(includeResources || child.type != resources)
            {
               if((includeFolders || child.type != folder) && child.name && !strcmpi(child.name, name))
               {
                  result = child;
                  break;
               }
               if(recursive)
                  result = child.FindSpecial(name, recursive, includeResources, includeFolders);
               if(result)
                  break;
            }
         }
      }
      return result;
   }

   ProjectNode FindSameNameConflict(const char * name, bool includeResources,
      Map<Platform, SetBool> exclusionInfo, ProjectConfig prjConfig)
   {
      ProjectNode result = null;
      Map<Platform, SetBool> compareExclusion { };
      SetBool common, commonComp;
      SetBool actual, actualComp;
      if(files)
      {
         for(child : files)
         {
            if(includeResources || child.type != resources)
            {
               if(child.type != folder && child.name && !strcmpi(child.name, name))
               {
                  child.CollectExclusionInfo(compareExclusion, prjConfig);
                  common = exclusionInfo[unknown];
                  commonComp = compareExclusion[unknown];
                  if(exclusionInfo.count == 1 && compareExclusion.count == 1)
                  {
                     if(!(common == true || commonComp == true))
                     {
                        result = child;
                        break;
                     }
                  }
                  else
                  {
                     Platform platform;
                     for(platform = (Platform)1; platform < Platform::enumSize; platform++)
                     {
                        actual = common;
                        actualComp = commonComp;
                        if(exclusionInfo[platform] != unset)
                           actual = exclusionInfo[platform];
                        if(compareExclusion[platform] != unset)
                           actualComp = compareExclusion[platform];
                        if(!(actual == true || actualComp == true))
                        {
                           result = child;
                           break;
                        }
                     }
                     if(result) break;
                  }
                  compareExclusion.Free();
                  break;
               }
               result = child.FindSameNameConflict(name, includeResources, exclusionInfo, prjConfig);
               if(result) break;
            }
         }
         compareExclusion.Free();
      }
      delete compareExclusion;
      return result;
   }

   ProjectNode Add(Project project, const char * filePath, ProjectNode after, NodeTypes type, NodeIcons icon, bool checkIfExists)
   {
      ProjectNode node = null;
      if(!project.topNode.FindByFullPath(filePath, true))
      {
         char temp[MAX_LOCATION];
         Map<Platform, SetBool> exclusionInfo { };

         GetLastDirectory(filePath, temp);
         //if(!checkIfExists || !project.topNode.Find(temp, false))

         // TOCHECK: Shouldn't this apply either for all configs or none?
         CollectExclusionInfo(exclusionInfo, project.config);
         if(!checkIfExists || type == folder || !project.topNode.FindSameNameConflict(temp, false, exclusionInfo, project.config))
         {
            // Do the check for folder in the same parent or resource files only here
            if(type == folder || !checkIfExists)
            {
               for(node : files)
               {
                  if(node.name && !strcmpi(node.name, temp))
                     return null;
               }
            }

            node = ProjectNode { parent = this, indent = indent + 1, type = type, icon = icon, name = CopyString(temp) };
            if(type != file)
            {
               node.files = { };
               node.nodeType = folder;
            }
            if(type != folder)
            {
               if(filePath)
               {
                  StripLastDirectory(filePath, temp);
                  MakePathRelative(temp, project.topNode.path, temp);
                  node.path = CopyUnixPath(temp);
               }
               node.nodeType = file;
            }
            else
            {
               strcpy(temp, (type == NodeTypes::project) ? "" : path);
               PathCatSlash(temp, node.name);
               node.path = CopyString(temp);
            }
            files.Insert(after, node);
         }
         delete exclusionInfo;
      }
      return node;
   }

#if !defined(ECERE_DOCUMENTOR) && !defined(ECERE_EPJ2MAKE) && !defined(TEST_SUITE)
   void OnDisplay(Surface surface, int x, int y, int width, ProjectView projectView, Alignment alignment, DataDisplayFlags displayFlags)
   {
      char label[MAX_FILENAME];
      int xStart;
      int len;
      int w, h;
      Bitmap bmp;
      bool showConfig = true;

      if(!projectView)
      {
         showConfig = false;
         projectView = ide.projectView;
      }

      bmp = projectView.icons[icon].bitmap;
      xStart = x + (bmp ? (bmp.width + 5) : 0);

      GetLastDirectory(name, label);
      if(!showConfig || projectView.drawingInProjectSettingsDialogHeader)
      {
         if(projectView.drawingInProjectSettingsDialogHeader || (type == project && info))
         {
            if(projectView.projectSettingsDialog && projectView.projectSettingsDialog.buildTab)
            {
               const char * addendum = projectView.projectSettingsDialog.buildTab.selectedConfigName;
               if(strlen(addendum))
               {
                  strcat(label, " (");
                  strcat(label, addendum);
                  strcat(label, ")");
               }
               addendum = projectView.projectSettingsDialog.buildTab.selectedPlatformName;
               if(strlen(addendum))
               {
                  strcat(label, " (");
                  strcat(label, addendum);
                  strcat(label, ")");
               }
            }
         }
      }
      else if(!projectView.drawingInProjectSettingsDialog)
      {
         if(modified)
            strcat(label, " *");
         if(type == project && info)
         {
            int len = strlen(info) + 4;
            char * more = new char[len];
            sprintf(more, " (%s)", info);
            strcat(label, more);
            delete more;
         }
      }
      len = strlen(label);

      if(!bmp)
      {
         if(type == folder || type == folderOpen)
            surface.SetForeground(yellow);
         indent = 8;
      }

      surface.TextOpacity(false);
      surface.TextExtent(label, len, &w, &h);
      h = Max(h, 16);

      // Draw the current row stipple
      if(displayFlags.selected)
         //surface.Area(xStart - 1, y, xStart - 1, y + h - 1);
         //surface.Area(xStart + w - 1, y, xStart + w + 1, y + h - 1);
         surface.Area(xStart - 3, y, xStart + w + 1, y + h - 1);

      surface.WriteTextDots(alignment, xStart, y + 2, width, label, len);

      if(!app.textMode)
      {
         if(displayFlags.current)
         {
            if(displayFlags.active)
            {
               surface.LineStipple(0x5555);
               if(displayFlags.selected)
                  surface.SetForeground(projectView.fileList.stippleColor);
               else
                  surface.SetForeground(projectView.fileList.foreground);
            }
            else
            {
               surface.SetForeground(SELECTION_COLOR);
            }
            surface.Rectangle(xStart - 3, y, xStart + w + 1, y + h - 1);
            surface.LineStipple(0);
         }

         if(bmp)
         {
            surface.SetForeground(white);
            surface.Blit(bmp, x /*+ indent * indent*/,y,0,0, bmp.width, bmp.height);
         }
      }
   }
#endif

   int OnCompare(ProjectNode b)
   {
      int result = 0;
      if(type == b.type /*|| type >= TYPE_DRIVE*/)
         result = strcmpi(name, b.name);
      else
      {
         if(type == folder && b.type == file) result = -1;
         else if(type == file && b.type == folder) result = 1;
      }
      return result;
   }

   bool ContainsFilesWithExtension(const char * extension, ProjectConfig prjConfig)
   {
      if(type == file && name && name[0])
      {
         char ext[MAX_EXTENSION];
         GetExtension(name, ext);
         if(!fstrcmp(ext, extension))
            return true;
      }
      else if(files)
      {
         for(child : files)
         {
            if(child.type != resources && (child.type == folder || !prjConfig || !child.GetIsExcluded(prjConfig)))
            {
               if(child.ContainsFilesWithExtension(extension, prjConfig))
                  return true;
            }
         }
      }
      return false;
   }

   void GenMakefileGetNameCollisionInfo(Map<CIString, NameCollisionInfo> namesInfo, ProjectConfig prjConfig)
   {
      if(type == file)
      {
         char extension[MAX_EXTENSION];
         GetExtension(name, extension);
         if(!strcmpi(extension, "ec") || !strcmpi(extension, "s") || !strcmpi(extension, "c") ||
               !strcmpi(extension, "rc") || !strcmpi(extension, "cpp") || !strcmpi(extension, "cc") ||
               !strcmpi(extension, "cxx") || !strcmpi(extension, "m") || !strcmpi(extension, "mm"))
         {
            char moduleName[MAX_FILENAME];
            NameCollisionInfo info;
            ReplaceSpaces(moduleName, name);
            StripExtension(moduleName);
            info = namesInfo[moduleName];
            if(!info)
               info = NameCollisionInfo { };
            info.count++; // += 1; unless this is for a bug?
            if(!strcmpi(extension, "ec"))
               info.ec = true;
            else if(!strcmpi(extension, "s"))
               info.s = true;
            else if(!strcmpi(extension, "c"))
               info.c = true;
            else if(!strcmpi(extension, "rc"))
               info.rc = true;
            else if(!strcmpi(extension, "cpp"))
               info.cpp = true;
            else if(!strcmpi(extension, "cc"))
               info.cc = true;
            else if(!strcmpi(extension, "cxx"))
               info.cxx = true;
            else if(!strcmpi(extension, "m"))
               info.m = true;
            else if(!strcmpi(extension, "mm"))
               info.mm = true;
            namesInfo[moduleName] = info;
         }
      }
      else if(files)
      {
         for(child : files)
         {
            if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
               child.GenMakefileGetNameCollisionInfo(namesInfo, prjConfig);
         }
      }
   }

   int GenMakefilePrintNode(File f, Project project, GenMakefilePrintTypes printType,
      Map<CIString, NameCollisionInfo> namesInfo, Array<String> items,
      ProjectConfig prjConfig, bool * containsCXX, bool * containsCPLMK,
      MakefileGenerationOptions opt)
   {
      int count = 0;
      if(type == file)
      {
         char s[2048];
         TwoStrings ts = GetPlatformSpecificFu(prjConfig);
         char moduleName[MAX_FILENAME];
         char extension[MAX_EXTENSION];
         GetExtension(name, extension);
         if(printType == resources)
         {
            bool useRes;
            char tempPath[MAX_LOCATION];
            char modulePath[MAX_LOCATION];

            tempPath[0] = '\0';
            if(eString_PathInsideOfMore(path, project.resNode.path, tempPath))
            {
               useRes = true;
               PathCatSlash(tempPath, name);
            }
            else
            {
               useRes = false;
               strcpy(tempPath, path);
               PathCatSlash(tempPath, name);
            }
            EscapeForMake(modulePath, tempPath, false, true, false);
            sprintf(s, "%s%s%s%s", ts.a, useRes ? "$(RES)" : "", modulePath, ts.b);
            items.Add(CopyString(s));
            if(containsCPLMK && !strcmp(name, "crossplatform.mk"))
               *containsCPLMK = true;
         }
         else if(printType == sources)
         {
            if(!strcmpi(extension, "s") || !strcmpi(extension, "c") || !strcmpi(extension, "cpp") ||
                  !strcmpi(extension, "cc") || !strcmpi(extension, "cxx") ||
                  !strcmpi(extension, "m") || !strcmpi(extension, "mm"))
            {
               char modulePath[MAX_LOCATION];
               EscapeForMake(modulePath, path, false, true, false);
               EscapeForMake(moduleName, name, false, true, false);
               sprintf(s, "%s%s%s%s%s", ts.a, modulePath, path[0] ? SEPS : "", moduleName, ts.b);
               items.Add(CopyString(s));
            }
         }
         else if(printType == eCsources || printType == eC_noPrint)
         {
            if(!strcmpi(extension, "ec"))
            {
               if(printType == eCsources)
               {
                  char modulePath[MAX_LOCATION];
                  EscapeForMake(modulePath, path, true, true, false);
                  EscapeForMake(moduleName, name, true, true, false);
                  sprintf(s, "%s%s%s%s%s", ts.a, modulePath, path[0] ? SEPS : "", moduleName, ts.b);
                  items.Add(CopyString(s));
               }
               count++;
            }
         }
         else if(printType == rcSources)
         {
            if(!strcmpi(extension, "rc"))
            {
               char modulePath[MAX_LOCATION];
               EscapeForMake(modulePath, path, false, true, false);
               EscapeForMake(moduleName, name, false, true, false);
               sprintf(s, "%s%s%s%s%s", ts.a, modulePath, path[0] ? SEPS : "", moduleName, ts.b);
               items.Add(CopyString(s));
               count++;
            }
         }
         else if(printType == allAlwaysBuild)
         {
            if(GetAlwaysBuild(prjConfig))
            {
               char modulePath[MAX_LOCATION];
               EscapeForMake(modulePath, path, true, true, false);
               EscapeForMake(moduleName, name, true, true, false);
               sprintf(s, "%s%s%s%s%s", ts.a, modulePath, path[0] ? SEPS : "", moduleName, ts.b);
               items.Add(CopyString(s));
            }
         }
         else if(!strcmpi(extension, "s") || !strcmpi(extension, "c") || !strcmpi(extension, "cpp") ||
               !strcmpi(extension, "cc") || !strcmpi(extension, "cxx") ||
               !strcmpi(extension, "m") || !strcmpi(extension, "mm"))
         {
            if(printType == objects)
            {
               bool collision;
               NameCollisionInfo info;
               count++;
               EscapeForMake(moduleName, name, false, true, false);
               StripExtension(moduleName);
               info = namesInfo[moduleName];
               collision = info ? info.IsExtensionColliding(extension) : false;
               sprintf(s, "%s$(OBJ)%s%s%s%s%s", ts.a, moduleName,
                     collision ? "." : "", collision ? extension : "",
                     !opt.noVarForObjectExt ? "$(O)" : ".o", ts.b);
               items.Add(CopyString(s));
            }
            else if(printType == noPrint && containsCXX &&
                  (!strcmpi(extension, "cpp") || !strcmpi(extension, "cc") || !strcmpi(extension, "cxx")))
               *containsCXX = true;
         }
         delete ts;
      }
      else if(files)
      {
         for(child : files)
         {
            if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
               count += child.GenMakefilePrintNode(f, project, printType, namesInfo, items, prjConfig, containsCXX, containsCPLMK, opt);
         }
      }
      return count;
   }

   void GenMakefilePrintSymbolRules(File f, Project project,
         ProjectConfig prjConfig, //Map<Platform, bool> parentExcludedPlatforms,
         Map<intptr, int> nodeCFlagsMapping, Map<intptr, int> nodeECFlagsMapping,
         MakefileGenerationOptions opt)
   {
      int ifCount = 0;
      Array<Platform> platforms = GetPlatformsArrayFromExclusionInfo(prjConfig);
      //ProjectNode child;
      //char objDir[MAX_LOCATION];
      //ReplaceSpaces(objDir, config.objDir.dir);

      //eSystem_Log("Printing Symbol Rules\n");
      if(type == file)
      {
         char extension[MAX_EXTENSION];
         char modulePath[MAX_LOCATION];
         char moduleName[MAX_FILENAME];

         GetExtension(name, extension);
         if(!strcmpi(extension, "ec"))
         {
            //DualPipe dep;
            //char command[2048];
            String prereq;
            String target;
            const String prereqOpt;
            const String targetOpt;

            ReplaceSpaces(moduleName, name);
            StripExtension(moduleName);

            ReplaceSpaces(modulePath, path);
            if(modulePath[0]) strcat(modulePath, SEPS);
            prereq = PrintString(modulePath, moduleName, ".", extension);
            prereqOpt = opt.noSpecialVarPrereqName ? prereq : "$<";
            target = PrintString("$(OBJ)", moduleName, ".sym");
            targetOpt = opt.noSpecialVarTargetName ? target : "$@";

            OpenRulesPlatformExclusionIfs(f, &ifCount, platforms);
#if 0
            // *** Dependency command ***
            sprintf(command, "gcc -MT $(OBJ)%s.o -MM %s", moduleName, prereq);

            // System Includes (from global settings)
            for(item : compiler.dirs[Includes])
            {
               strcat(command, " -isystem ");
               if(strchr(item, ' '))
               {
                  strcat(command, "\"");
                  strcat(command, item);
                  strcat(command, "\"");
               }
               else
                  strcat(command, item);
            }

            for(item : project.includeDirs)
            {
               strcat(command, " -I");
               if(strchr(item, ' '))
               {
                  strcat(command, "\"");
                  strcat(command, item);
                  strcat(command, "\"");
               }
               else
                  strcat(command, item);
            }
            for(item : project.preprocessorDefs)
            {
               strcat(command, " -D");
               strcat(command, item);
            }

            // Execute it
            if((dep = DualPipeOpen(PipeOpenMode { output = true, error = true/*, input = true*/ }, command)))
            {
               char line[1024];
               bool firstLine = true;
               bool result = true;

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
               dep.Wait();
               delete dep;

               // If we failed to generate dependencies...
               if(!result)
               {
#endif
                  f.Printf("%s: %s\n", target, prereq);

                  f.Puts("\t$(ECP)");

                  f.Puts(" $(CFLAGS)");
                  f.Puts(" $(CECFLAGS)"); // tocheck: what of this? should this stuff be per-file customized?

                  GenMakePrintNodeFlagsVariable(this, nodeECFlagsMapping, "ECFLAGS", f);
                  GenMakePrintNodeFlagsVariable(this, nodeCFlagsMapping, "PRJ_CFLAGS", f);

                  f.Printf(" -c %s%s%s -o %s%s%s\n",
                        opt.NQP ? "" : "$(call quote_path,", prereqOpt, opt.NQP ? "" : ")",
                        opt.NQT ? "" : "$(call quote_path,", targetOpt, opt.NQT ? "" : ")");
                  if(ifCount) f.Puts("endif\n");
                  f.Puts("\n");
#if 0
               }
            }
#endif
            delete prereq;
            delete target;
         }
      }
      if(files)
      {
         if(ContainsFilesWithExtension("ec", prjConfig))
         {
            for(child : files)
            {
               if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
                  child.GenMakefilePrintSymbolRules(f, project, prjConfig, /*excludedPlatforms,*/
                        nodeCFlagsMapping, nodeECFlagsMapping, opt);
            }
         }
      }
      delete platforms;
   }

   void GenMakefilePrintPrepecsRules(File f, Project project,
         ProjectConfig prjConfig, /*Map<Platform, bool> parentExcludedPlatforms,*/
         Map<intptr, int> nodeCFlagsMapping, Map<intptr, int> nodeECFlagsMapping,
         MakefileGenerationOptions opt)
   {
      int ifCount = 0;
      Array<Platform> platforms = GetPlatformsArrayFromExclusionInfo(prjConfig);
      //ProjectNode child;
      //char objDir[MAX_LOCATION];
      //ReplaceSpaces(objDir, config.objDir.dir);

      //eSystem_Log("Printing Symbol Rules\n");
      if(type == file)
      {
         char extension[MAX_EXTENSION];
         char modulePath[MAX_LOCATION];
         char moduleName[MAX_FILENAME];

         GetExtension(name, extension);
         if(!strcmpi(extension, "ec"))
         {
            String prereq;
            String target;
            const String prereqOpt;
            const String targetOpt;
            ReplaceSpaces(moduleName, name);
            StripExtension(moduleName);

            ReplaceSpaces(modulePath, path);
            if(modulePath[0]) strcat(modulePath, SEPS);
            prereq = PrintString(modulePath, moduleName, ".", extension);
            prereqOpt = opt.noSpecialVarPrereqName ? prereq : "$<";
            target = PrintString("$(OBJ)", moduleName, "$(EC)");
            targetOpt = opt.noSpecialVarTargetName ? target : "$@";

            OpenRulesPlatformExclusionIfs(f, &ifCount, platforms);
            f.Printf("%s: %s\n", target, prereq);
            // f.Printf("\t$(CPP) %s %s$(S)\n\n", prereq, moduleName);

            f.Puts("\t$(CPP)");

            f.Puts(" $(CFLAGS)");
            //f.Puts(" $(CECFLAGS)");
            //GenMakePrintNodeFlagsVariable(this, nodeECFlagsMapping, "ECFLAGS", f);
            GenMakePrintNodeFlagsVariable(this, nodeCFlagsMapping, "PRJ_CFLAGS", f);

            f.Printf(" -x c -E %s -o %s\n", prereqOpt, targetOpt);
            if(ifCount) f.Puts("endif\n");
            f.Puts("\n");
            delete prereq;
            delete target;
         }
      }
      if(files)
      {
         if(ContainsFilesWithExtension("ec", prjConfig))
         {
            for(child : files)
            {
               if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
                  child.GenMakefilePrintPrepecsRules(f, project, prjConfig, /*excludedPlatforms,*/
                        nodeCFlagsMapping, nodeECFlagsMapping, opt);
            }
         }
      }
      delete platforms;
   }

   void GenMakefilePrintCObjectRules(File f, Project project,
      ProjectConfig prjConfig, /*Map<Platform, bool> parentExcludedPlatforms,*/
      Map<intptr, int> nodeCFlagsMapping, Map<intptr, int> nodeECFlagsMapping,
      MakefileGenerationOptions opt)
   {
      int ifCount = 0;
      Array<Platform> platforms = GetPlatformsArrayFromExclusionInfo(prjConfig);
      //ProjectNode child;
      //char objDir[MAX_LOCATION];
      //ReplaceSpaces(objDir, config.objDir.dir);
      //eSystem_Log("Printing C Object Rules\n");
      if(type == file)
      {
         char extension[MAX_EXTENSION];
         char modulePath[MAX_LOCATION];
         char moduleName[MAX_FILENAME];

         GetExtension(name, extension);
         if(!strcmpi(extension, "ec"))
         {
            //DualPipe dep;
            //char command[2048];
            String prereq;
            String target;
            const String prereqOpt;
            const String targetOpt;

            ReplaceSpaces(moduleName, name);
            StripExtension(moduleName);

            ReplaceSpaces(modulePath, path);
            if(modulePath[0]) strcat(modulePath, SEPS);
            prereq = PrintString(modulePath, moduleName, ".", extension);
            prereqOpt = opt.noSpecialVarPrereqName ? prereq : "$<";
            target = PrintString("$(OBJ)", moduleName, ".c");
            targetOpt = opt.noSpecialVarTargetName ? target : "$@";

            OpenRulesPlatformExclusionIfs(f, &ifCount, platforms);
#if 0
            // *** Dependency command ***
            sprintf(command, "gcc -MT $(OBJ)%s.o -MM %s", moduleName, prereq);

            // System Includes (from global settings)
            for(item : compiler.dirs[Includes])
            {
               strcat(command, " -isystem ");
               if(strchr(item, ' '))
               {
                  strcat(command, "\"");
                  strcat(command, item);
                  strcat(command, "\"");
               }
               else
                  strcat(command, item);
            }

            for(item : config.includeDirs)
            {
               strcat(command, " -I");
               if(strchr(item, ' '))
               {
                  strcat(command, "\"");
                  strcat(command, item);
                  strcat(command, "\"");
               }
               else
                  strcat(command, item);
            }
            for(item : config.preprocessorDefs)
            {
               strcat(command, " -D");
               strcat(command, item);
            }

            // Execute it
            if((dep = DualPipeOpen(PipeOpenMode { output = true, error = true/*, input = true*/ }, command)))
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
               dep.Wait();
               delete dep;

               // If we failed to generate dependencies...
               if(!result)
               {
                  // COMMENTED OUT FOR NOW // f.Printf("$(OBJ)%s.c: %s $(Symbols)\n", moduleName, prereq);
#endif
                  f.Printf("%s: %s $(OBJ)%s.sym | $(SYMBOLS)\n", target, prereq, moduleName);
#if 0
               }
            }
#endif
         // f.Printf("\t$(ECC) %s $(OBJ)%s.c\n\n", prereq, moduleName);

            f.Puts("\t$(ECC)");

            f.Puts(" $(CFLAGS)");
            f.Puts(" $(CECFLAGS)"); // what of this? should this stuff be per-file customized?
            GenMakePrintNodeFlagsVariable(this, nodeECFlagsMapping, "ECFLAGS", f);
            GenMakePrintNodeFlagsVariable(this, nodeCFlagsMapping, "PRJ_CFLAGS", f);
            f.Puts(" $(FVISIBILITY)");

            f.Printf(" -c %s%s%s -o %s%s%s -symbols $(OBJ)\n",
                  opt.NQP ? "" : "$(call quote_path,", prereqOpt, opt.NQP ? "" : ")",
                  opt.NQT ? "" : "$(call quote_path,", targetOpt, opt.NQT ? "" : ")");
            if(ifCount) f.Puts("endif\n");
            f.Puts("\n");
            delete prereq;
            delete target;
         }
      }
      if(files)
      {
         if(ContainsFilesWithExtension("ec", prjConfig))
         {
            for(child : files)
            {
               if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
                  child.GenMakefilePrintCObjectRules(f, project, prjConfig, /*excludedPlatforms,*/
                        nodeCFlagsMapping, nodeECFlagsMapping, opt);
            }
         }
      }
      delete platforms;
   }

   void GenMakefilePrintObjectRules(File f, Project project,
      Map<CIString, NameCollisionInfo> namesInfo,
      ProjectConfig prjConfig,
      //Map<Platform, bool> parentExcludedPlatforms,
      Map<intptr, int> nodeCFlagsMapping, Map<intptr, int> nodeECFlagsMapping,
      MakefileGenerationOptions opt)
   {
      int ifCount = 0;
      Array<Platform> platforms = GetPlatformsArrayFromExclusionInfo(prjConfig);
      //ProjectNode child;
      //char objDir[MAX_LOCATION];
      //ReplaceSpaces(objDir, config.objDir.dir);
      //eSystem_Log("Printing Object Rules\n");
      if(type == file)
      {
         bool collision;
         bool ec;
         char extension[MAX_EXTENSION];
         char modulePath[MAX_LOCATION];
         char moduleName[MAX_FILENAME];

         GetExtension(name, extension);
         ec = !strcmpi(extension, "ec");
         if(ec ||
               !strcmpi(extension, "s") || !strcmpi(extension, "c") || !strcmpi(extension, "rc") ||
               !strcmpi(extension, "cpp") || !strcmpi(extension, "cc") || !strcmpi(extension, "cxx") ||
               !strcmpi(extension, "m") || !strcmpi(extension, "mm"))
         {
            //DualPipe dep;
            //char command[2048];
            String prereq;
            String target;
            const String prereqOpt;
            const String targetOpt;
            NameCollisionInfo info;

            ReplaceSpaces(moduleName, name);
            StripExtension(moduleName);

            info = namesInfo[moduleName];
            collision = info ? info.IsExtensionColliding(extension) : false;

            ReplaceSpaces(modulePath, path);
            if(modulePath[0]) strcat(modulePath, SEPS);
            if(ec)
               prereq = PrintString("$(OBJ)", moduleName, ".c");
            else
               prereq = PrintString(modulePath, moduleName, ".", extension);
            prereqOpt = opt.noSpecialVarPrereqName ? prereq : "$<";
            if(ec)
               target = PrintString("$(OBJ)", moduleName, !opt.noVarForObjectExt ? "$(O)" : ".o");
            else
               target = PrintString("$(OBJ)", moduleName, collision ? "." : "", collision ? extension : "", !opt.noVarForObjectExt ? "$(O)" : ".o");
            targetOpt = opt.noSpecialVarTargetName ? target : "$@";

            /*
#if 0
            // *** Dependency command ***
            if(ec)
               sprintf(command, "%s -MT $(OBJ)%s.o -MM $(OBJ)%s.c", "$(CPP)", moduleName, moduleName);
            else
               sprintf(command, "%s -MT $(OBJ)%s.o -MM %s", (!strcmpi(extension, "cc") || !strcmpi(extension, "cxx") || !strcmpi(extension, "cpp")) ? "$(CXX)" : "$(CC)",
                  moduleName, prereq);

            if(ec)
            {
               f.Printf("$(OBJ)%s.o: $(OBJ)%s.c\n", moduleName, moduleName);
            }
            else
            {
               // System Includes (from global settings)
               for(item : compiler.dirs[includes])
               {
                  strcat(command, " -isystem ");
                  if(strchr(item, ' '))
                  {
                     strcat(command, "\"");
                     strcat(command, item);
                     strcat(command, "\"");
                  }
                  else
                     strcat(command, item);
               }

               for(item : config.includeDirs)
               {
                  strcat(command, " -I");
                  if(strchr(item, ' '))
                  {
                     strcat(command, "\"");
                     strcat(command, item);
                     strcat(command, "\"");
                  }
                  else
                     strcat(command, item);
               }
               for(item : config.preprocessorDefs)
               {
                  strcat(command, " -D");
                  strcat(command, item);
               }

               // Execute it
               if((dep = DualPipeOpen(PipeOpenMode { output = true, error = true, input = false }, command)))
               {
                  char line[1024];
                  bool firstLine = true;
                  bool result = true;

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
                  dep.Wait();
                  delete dep;

                  // If we failed to generate dependencies...
                  if(!result)
                  {

                  }
               }
            }
#endif
         */
            if(!strcmpi(extension, "rc"))
            {
               ifCount++;
               f.Puts("ifdef WINDOWS_TARGET\n\n");
            }
            else
               OpenRulesPlatformExclusionIfs(f, &ifCount, platforms);

            f.Printf("%s: %s\n", target, prereq);
            if(!strcmpi(extension, "cc") || !strcmpi(extension, "cpp") || !strcmpi(extension, "cxx"))
               f.Printf("\t$(CXX) $(CXXFLAGS)");
            else if(!strcmpi(extension, "rc"))
            {
               f.Printf("\t$(WINDRES) $(WINDRES_FLAGS) %s%s%s %s%s%s\n",
                     opt.NQP ? "" : "$(call quote_path,", prereqOpt, opt.NQP ? "" : ")",
                     opt.NQT ? "" : "\"$(call escspace,$(call quote_path,", targetOpt, opt.NQT ? "" : "))\"");
            }
            else
               f.Printf("\t$(CC) $(CFLAGS)");

            if(strcmpi(extension, "rc") != 0)
            {
               GenMakePrintNodeFlagsVariable(this, nodeCFlagsMapping, "PRJ_CFLAGS", f);
               f.Printf("%s -c %s%s%s -o %s%s%s\n",
                     ec ? " $(FVISIBILITY)" : "",
                     opt.NQP ? "" : "$(call quote_path,", prereqOpt, opt.NQP ? "" : ")",
                     opt.NQT ? "" : "$(call quote_path,", targetOpt, opt.NQT ? "" : ")");
            }
            if(ifCount) f.Puts("endif\n");
            f.Puts("\n");
            delete prereq;
            delete target;
         }
      }
      if(files)
      {
         bool needed = false;
         for(child : files)
         {
            if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
            {
               needed = true;
               break;
            }
         }
         if(needed)
         {
            for(child : files)
            {
               if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
                  child.GenMakefilePrintObjectRules(f, project, namesInfo, prjConfig, /*excludedPlatforms,*/
                        nodeCFlagsMapping, nodeECFlagsMapping, opt);
            }
         }
      }
      delete platforms;
   }

   void GenMakefileAddResources(File f, String resourcesPath, ProjectConfig prjConfig, const char * resourcesTarget)
   {
      int count = 0;
      if(files)
      {
         int c;
         bool prev = false;
         //Iterator<ProjectNode> i { files };
         //Iterator<ProjectNode> prev { files };
         //for(child : files)
         //while(i.Next())
         for(c = 0; c < files.count; c++)
         {
            ProjectNode child = files[c];
            TwoStrings ts = child.GetPlatformSpecificFu(prjConfig);
            if(count > 0 && ts)
               prev = true;
            if(child.type == file && !child.GetIsExcluded(prjConfig) && !(count > 0 && ts))
            {
               bool useRes;
               char tempPath[MAX_LOCATION];
               char resPath[MAX_LOCATION];

               // $(EAR) aw%s --- /*quiet ? "q" : */""
               if(count == 0)
                  f.Printf("\t%s$(EAR) aw$(EARFLAGS) $(%s)", ts.a, resourcesTarget);

               tempPath[0] = '\0';
               if(eString_PathInsideOfMore(child.path, resourcesPath, tempPath))
               {
                  useRes = true;
                  PathCatSlash(tempPath, child.name);
               }
               else
               {
                  useRes = false;
                  strcpy(tempPath, child.path);
                  PathCatSlash(tempPath, child.name);
               }
               EscapeForMake(resPath, tempPath, false, true, false);
               f.Printf(" %s%s", useRes ? "$(RES)" : "", resPath);
               count++;
            }
            if(count == 10 || (count > 0 && (ts || !child.next)))
            {
               char path[MAX_LOCATION] = "", temp[MAX_LOCATION];
               ProjectNode parent;

               for(parent = this; parent.type == folder; parent = parent.parent)
               {
                  strcpy(temp, path);
                  strcpy(path, parent.name);
                  if(temp[0])
                  {
                     strcat(path, "/");
                     strcat(path, temp);
                  }
               }
               f.Printf(" \"%s\"%s\n", path, ts.b);
               count = 0;
               if(prev)
               {
                  c--;
                  prev = false;
               }
            }
            delete ts;
         }
         for(child : files)
         {
            if(child.type == folder)
               child.GenMakefileAddResources(f, resourcesPath, prjConfig, resourcesTarget);
         }
      }
   }

   void GenMakeCollectAssignNodeFlags(ProjectConfig prjConfig, bool prjWithEcFiles,
         Map<String, int> cflagsVariations, Map<intptr, int> nodeCFlagsMapping,
         Map<String, int> ecflagsVariations, Map<intptr, int> nodeECFlagsMapping,
         Map<Platform, ProjectOptions> parentByPlatformOptions,
         MakefileGenerationOptions opt)
   {
      Map<Platform, ProjectOptions> byPlatformOptions = parentByPlatformOptions;
      if(type == file || type == folder || type == project)
      {
         bool hasPerNodeOptions = type == project;
         if(!hasPerNodeOptions)
         {
            if(options && !options.isEmpty)
               hasPerNodeOptions = true;
            else if(configurations)
            {
               for(c : configurations)
               {
                  if(c.options && !c.options.isEmpty)
                  {
                     hasPerNodeOptions = true;
                     break;
                  }
                  if(c.platforms)
                  {
                     for(p : c.platforms)
                     {
                        if(p.options && !p.options.isEmpty)
                        {
                           hasPerNodeOptions = true;
                           break;
                        }
                     }
                     if(hasPerNodeOptions)
                        break;
                  }
               }
            }
            if(!hasPerNodeOptions && platforms)
            {
               for(p : platforms)
               {
                  if(p.options && !p.options.isEmpty)
                  {
                     hasPerNodeOptions = true;
                     break;
                  }
               }
            }

         }
         if(hasPerNodeOptions)
         {
            bool isEqual = false, isGreater = false;
            ComplexComparison complexCmp;
            DynamicString s;
            Map<Platform, ProjectOptions> additionsByPlatformOptions { };
            ProjectOptions platformsCommonOptions;
            ProjectOptions byFileConfigPlatformProjectOptions;

            DynamicString cflags { };
            DynamicString ecflags { };

            Platform platform;

            byPlatformOptions = { };

            for(platform = (Platform)1; platform < Platform::enumSize; platform++)
            {
               byFileConfigPlatformProjectOptions =
                     BlendFileConfigPlatformProjectOptions(this, prjConfig, platform);
               byPlatformOptions[platform] = byFileConfigPlatformProjectOptions;
            }

            CollectPlatformsCommonOptions(byPlatformOptions, &platformsCommonOptions);

            byPlatformOptions[unknown] = platformsCommonOptions;

            if(parentByPlatformOptions)
            {
               complexCmp = PlatformsOptionsGreaterEqual(byPlatformOptions,
                     parentByPlatformOptions, additionsByPlatformOptions);
               isGreater = complexCmp == greater;
               isEqual = complexCmp == equal;
            }

            if(!isEqual)
            {
               for(platform = (Platform)1; platform < Platform::enumSize; platform++)
               {
                  byFileConfigPlatformProjectOptions = isGreater ? additionsByPlatformOptions[platform] : byPlatformOptions[platform];
                  s = { };
                  GenCFlagsFromProjectOptions(byFileConfigPlatformProjectOptions, prjWithEcFiles, false, isGreater, opt, s);
                  if(s.count > 1)
                     cflags.concatf(" \\\n\t $(if $(%s),%s,)", PlatformToMakefileTargetVariable(platform), (String)s);
                  delete s;
                  s = { };
                  GenECFlagsFromProjectOptions(byFileConfigPlatformProjectOptions, prjWithEcFiles, s);
                  if(s.count > 1)
                     ecflags.concatf(" \\\n\t $(if $(%s),%s,)", PlatformToMakefileTargetVariable(platform), (String)s);
                  delete s;
               }

               platformsCommonOptions = isGreater ? additionsByPlatformOptions[unknown] : byPlatformOptions[unknown];
               s = { };
               GenCFlagsFromProjectOptions(platformsCommonOptions, prjWithEcFiles, true, isGreater, opt, s);
               if(s.count > 1)
               {
                  if(!isGreater) cflags.concat(" \\\n\t");
                  cflags.concat(s);
               }
               delete s;
               s = { };
               GenECFlagsFromProjectOptions(platformsCommonOptions, prjWithEcFiles, s);
               if(s.count > 1)
               {
                  ecflags.concat(" \\\n\t");
                  ecflags.concat(s);
               }
               delete s;

               if(isGreater)
               {
                  cflags.concat(" \\\n\t");
                  DynStringPrintNodeFlagsVariable(parent, nodeCFlagsMapping, "PRJ_CFLAGS", cflags);
               }
            }

            additionsByPlatformOptions.Free();
            delete additionsByPlatformOptions;

            // output
            {
               if(isEqual)
               {
                  nodeCFlagsMapping[(intptr)this] = nodeCFlagsMapping[(intptr)parent];
                  nodeECFlagsMapping[(intptr)this] = nodeECFlagsMapping[(intptr)parent];
               }
               else
               {
                  String s;
                  int variationNum;

                  variationNum = 1;
                  if((s = cflags) && s[0] && !(variationNum = cflagsVariations[s]))
                     cflagsVariations[s] = variationNum = cflagsVariations.count;
                  nodeCFlagsMapping[(intptr)this] = variationNum;

                  variationNum = 1;
                  if((s = ecflags) && s[0] && !(variationNum = ecflagsVariations[s]))
                     ecflagsVariations[s] = variationNum = ecflagsVariations.count;
                  nodeECFlagsMapping[(intptr)this] = variationNum;
               }
            }

            delete cflags;
            delete ecflags;
         }
         else
         {
            // output
            {
               nodeCFlagsMapping[(intptr)this] = nodeCFlagsMapping[(intptr)parent];
               nodeECFlagsMapping[(intptr)this] = nodeECFlagsMapping[(intptr)parent];
            }
         }
      }
      if(files)
      {
         for(child : files)
         {
            if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
               child.GenMakeCollectAssignNodeFlags(prjConfig, prjWithEcFiles,
                     cflagsVariations, nodeCFlagsMapping, ecflagsVariations, nodeECFlagsMapping,
                     byPlatformOptions, opt);
         }
      }

      if(byPlatformOptions != parentByPlatformOptions)
      {
         byPlatformOptions.Free();
         delete byPlatformOptions;
      }
   }

   Array<Platform> GetPlatformsArrayFromExclusionInfo(ProjectConfig prjConfig)
   {
      Array<Platform> platforms { };
      Map<Platform, SetBool> exclusionInfo { };
      CollectExclusionInfo(exclusionInfo, prjConfig);

      if(exclusionInfo[unknown] == true)
      {
         if(exclusionInfo.count > 1)
            for(p : exclusionInfo; p == false)
               platforms.Add(&p);
      }
      else
      {
         bool onlyOnknown = true;
         for(p : exclusionInfo)
            if(&p != unknown && p == true)
            {
               onlyOnknown = false;
               break;
            }
         if(onlyOnknown)
            platforms.Add(unknown);
         else
         {
            Platform p;
            for(p = unknown + 1; p < Platform::enumSize; p++)
               if(exclusionInfo[p] != true)
                  platforms.Add(p);
         }
      }
      delete exclusionInfo;
      return platforms;
   }

   void GetTargets(ProjectConfig prjConfig, Map<CIString, NameCollisionInfo> namesInfo, char * objDir, const char * objectFileExt, DynamicString output)
   {
      char moduleName[MAX_FILENAME];
      if(type == file)
      {
         bool headerAltFailed = false;
         bool collision;
         char extension[MAX_EXTENSION];
         NameCollisionInfo info;
         Project prj = property::project;
         Map<String, const String> headerToSource { [ { "eh", "ec" }, { "h", "c" }, { "hh", "cc" }, { "hpp", "cpp" }, { "hxx", "cxx" } ] };

         GetExtension(name, extension);
         strcpy(moduleName, name);
         StripExtension(moduleName);
         info = namesInfo[moduleName];
         collision = info ? info.IsExtensionColliding(extension) : false;

         for(h2s : headerToSource)
         {
            if(!strcmpi(extension, &h2s))
            {
               char filePath[MAX_LOCATION];
               GetFullFilePath(filePath, true, true);
               OutputLog($"No compilation required for header file "); OutputLog(filePath); OutputLog("\n");
               ChangeExtension(moduleName, h2s, moduleName);
               if(prj.topNode.Find(moduleName, false))
               {
                  strcpy(extension, h2s);
                  collision = info ? info.IsExtensionColliding(extension) : false;
                  ChangeExtension(filePath, h2s, filePath);
                  OutputLog($"Compiling source file "); OutputLog(filePath); OutputLog($" instead\n");
                  StripExtension(moduleName);
               }
               else
               {
                  headerAltFailed = true;
                  OutputLog($"Unable to locate source file "); OutputLog(moduleName); OutputLog($" to compile instead of "); OutputLog(filePath); OutputLog($"\n");
                  StripExtension(moduleName);
               }
               break;
            }
         }

         if(!headerAltFailed)
         {
            output.concat(" \"");
            output.concat(objDir); //.concat(" $(OBJ)");
            output.concat("/");

            if(collision)
            {
               strcat(moduleName, ".");
               strcat(moduleName, extension);
            }
            strcat(moduleName, ".");
            strcat(moduleName, objectFileExt);
            output.concat(moduleName);
            output.concat("\"");
         }
      }
      else if(type == project && ContainsFilesWithExtension("ec", prjConfig))
      {
         Project prj = property::project;

         ReplaceSpaces(moduleName, prj.moduleName);
         strcat(moduleName, ".main.ec");
         output.concat(" \"");
         output.concat(objDir);
         output.concat("/");
         output.concat(moduleName);
         output.concat("\"");

         ChangeExtension(moduleName, "c", moduleName);
         output.concat(" \"");
         output.concat(objDir);
         output.concat("/");
         output.concat(moduleName);
         output.concat("\"");

         ChangeExtension(moduleName, "o", moduleName);
         output.concat(" \"");
         output.concat(objDir);
         output.concat("/");
         output.concat(moduleName);
         output.concat("\"");
      }
      else if(files)
      {
         for(child : files)
         {
            if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
               child.GetTargets(prjConfig, namesInfo, objDir, objectFileExt, output);
         }
      }
   }

   void DeleteIntermediateFiles(CompilerConfig compiler, ProjectConfig prjConfig, int bitDepth, Map<CIString, NameCollisionInfo> namesInfo, bool onlyCObject)
   {
      if(type == file)
      {
         bool collision;
         const char * objectFileExt = compiler ? compiler.objectFileExt : objectDefaultFileExt;
         char extension[MAX_EXTENSION];
         char fileName[MAX_FILENAME];
         char moduleName[MAX_FILENAME];
         NameCollisionInfo info;
         Project prj = property::project;
         DirExpression objDir = prj.GetObjDir(compiler, prjConfig, bitDepth);

         GetExtension(name, extension);
         ReplaceSpaces(moduleName, name);
         StripExtension(moduleName);
         info = namesInfo[moduleName];
         collision = info ? info.IsExtensionColliding(extension) : false;

         strcpy(fileName, prj.topNode.path);
         PathCatSlash(fileName, objDir.dir);
         PathCatSlash(fileName, name);

         if(!onlyCObject && !strcmp(extension, "ec"))
         {
            ChangeExtension(fileName, "c", fileName);
            if(FileExists(fileName)) DeleteFile(fileName);
            ChangeExtension(fileName, "sym", fileName);
            if(FileExists(fileName)) DeleteFile(fileName);
            ChangeExtension(fileName, "imp", fileName);
            if(FileExists(fileName)) DeleteFile(fileName);
            ChangeExtension(fileName, "bowl", fileName);
            if(FileExists(fileName)) DeleteFile(fileName);
            ChangeExtension(fileName, "ec", fileName);
         }

         if(collision)
         {
            strcat(fileName, ".");
            strcat(fileName, objectFileExt);
         }
         else
            ChangeExtension(fileName, objectFileExt, fileName);
         if(FileExists(fileName)) DeleteFile(fileName);

         delete objDir;
      }
      else if(files)
      {
         for(child : files)
         {
            if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
               child.DeleteIntermediateFiles(compiler, prjConfig, bitDepth, namesInfo, onlyCObject);
         }
      }
   }

   bool IsInNode(ProjectNode node)
   {
      bool result = false;
      ProjectNode n;
      for(n = this; n; n = n.parent)
      {
         if(n == node)
         {
            result = true;
            break;
         }
      }
      return result;
   }
}

// the code in this function is closely matched to OptionsBox::Load
// and accompanying derivations of OptionBox and their use of OptionSet,
// OptionCheck, LoadOption and FinalizeLoading methods.
// output changing modification should be mirrored in both implementations
static ProjectOptions BlendFileConfigPlatformProjectOptions(ProjectNode node, ProjectConfig projectConfig, Platform platform)
{
   ProjectOptions output { };

   // legend: e Element
   //         o Option (of a ProjectOptions)
   //         n Node (ProjectNode)
   //         p Platform
   //         u Utility (GenericOptionTools)

   int o;
   int priority = 0;
   int includeDirsOption = OPTION(includeDirs);
   ProjectNode n;
   const char * platformName = platform ? platform.OnGetString(0,0,0) : null;

   // OPTION(ProjectOptions' last member) for size
   Array<bool> optionConfigXplatformSet   { size = OPTION(installCommands) };
   Array<bool> optionDone                 { size = OPTION(installCommands) };
   Array<Array<String>> optionTempStrings { size = OPTION(installCommands) };

   GenericOptionTools<SetBool>              utilSetBool {
      bool OptionCheck(ProjectOptions options, int option) {
         return *(SetBool*)((byte *)options + option) == true;
      }
      void LoadOption(ProjectOptions options, int option, int priority, Array<Array<String>> optionTempStrings, ProjectOptions output) {
         if(options && (*(SetBool*)((byte *)options + option) == true))
            *(SetBool*)((byte *)output + option) = true;
      }
   };
   GenericOptionTools<String>               utilString {
      void LoadOption(ProjectOptions options, int option, int priority, Array<Array<String>> optionTempStrings, ProjectOptions output) {
         String * string = (String*)((byte *)output + option);
         if(*string) delete *string;
         if(options)
            *string = CopyString(*(String*)((byte *)options + option));
      }
   };
   StringArrayOptionTools                   utilStringArrays {
      mergeValues = true;
      caseSensitive = true;
      bool OptionCheck(ProjectOptions options, int option) {
         Array<String> strings = *(Array<String>*)((byte *)options + option);
         return strings && strings.count;
      }
      bool OptionSet(ProjectOptions options, int option) {
         Array<String> strings = *(Array<String>*)((byte *)options + option);
         if(mergeValues && !configReplaces)
            return strings && strings.count;
         else
            return strings != null;
      }
      void LoadOption(ProjectOptions options, int option, int priority, Array<Array<String>> optionTempStrings, ProjectOptions output) {
         if(mergeValues)
         {
            Array<String> strings = options ? *(Array<String>*)((byte *)options + option) : null;
            if(strings)
            {
               int order = 0;
               Array<String> tempStrings = optionTempStrings[option];
               if(!tempStrings)
                  optionTempStrings[option] = tempStrings = { };
               for(s : strings)
               {
                  bool found = false;
                  char priorityMark[16];
                  order++;
                  if(priority)
                     sprintf(priorityMark, "%06d\n", priority * 1000 + order);
                  for(i : tempStrings; !(caseSensitive ? strcmp : strcmpi)(i, s)) { found = true; break; }
                  if(!found) tempStrings.Add(priority ? PrintString(priorityMark, s) : CopyString(s));
               }
            }
         }
         else
         {
            Array<String> * newStrings = (Array<String>*)((byte *)options + option);
            Array<String> * strings = (Array<String>*)((byte *)output + option);
            if(*strings) { strings->Free(); delete *strings; }
            if(*newStrings && newStrings->count) { *strings = { }; strings->Copy((void*)*newStrings); }
         }
      }
      void FinalizeLoading(int option, Array<Array<String>> optionTempStrings, ProjectOptions output) {
         if(mergeValues)
         {
            Array<String> tempStrings = optionTempStrings[option];
            Array<String> * strings = (Array<String>*)((byte *)output + option);
            if(*strings) { strings->Free(); delete *strings; }
            if(tempStrings && tempStrings.count) { *strings = { }; strings->Copy((void*)tempStrings); }
            delete tempStrings;
         }
      }
   };
   GenericOptionTools<WarningsOption>       utilWarningsOption {
      bool OptionCheck(ProjectOptions options, int option) {
         WarningsOption value = *(WarningsOption*)((byte *)options + option);
         return value && value != none;
      }
      void LoadOption(ProjectOptions options, int option, int priority, Array<Array<String>> optionTempStrings, ProjectOptions output) {
         WarningsOption value = options ? *(WarningsOption*)((byte *)options + option) : (WarningsOption)0;
         *(WarningsOption*)((byte *)output + option) = value;
      }
   };
   GenericOptionTools<OptimizationStrategy> utilOptimizationStrategy {
      bool OptionCheck(ProjectOptions options, int option) {
         OptimizationStrategy value = *(OptimizationStrategy*)((byte *)options + option);
         return value && value != none;
      }
      void LoadOption(ProjectOptions options, int option, int priority, Array<Array<String>> optionTempStrings, ProjectOptions output) {
         OptimizationStrategy value = options ? *(OptimizationStrategy*)((byte *)options + option) : (OptimizationStrategy)0;
         *(OptimizationStrategy*)((byte *)output + option) = value;
      }
   };

   Map<int, GenericOptionTools> ot { };

   // The following are compiler options

   ot[OPTION(debug)] =                   utilSetBool;
   ot[OPTION(memoryGuard)] =             utilSetBool;
   ot[OPTION(profile)] =                 utilSetBool;
   ot[OPTION(noLineNumbers)] =           utilSetBool;
   ot[OPTION(strictNameSpaces)] =        utilSetBool;
   ot[OPTION(fastMath)] =                utilSetBool;

   ot[OPTION(defaultNameSpace)] =        utilString;

   ot[OPTION(preprocessorDefinitions)] = utilStringArrays;
   ot[OPTION(includeDirs)] =             utilStringArrays;

   ot[OPTION(warnings)] =                utilWarningsOption;

   ot[OPTION(optimization)] =            utilOptimizationStrategy;

   for(n = node; n; n = n.parent)
   {
      ProjectConfig nodeConfig = null;
      if(n.parent)
         priority = (priority / 10 + 1) * 10;
      else
         priority = 9990;
      if(projectConfig && n.configurations)
      {
         for(c : n.configurations; !strcmpi(c.name, projectConfig.name))
         {
            if(platform && c.platforms)
            {
               for(p : c.platforms; !strcmpi(p.name, platformName))
               {
                  for(uu : ot)
                  {
                     GenericOptionTools u = uu;
                     o = &uu;
                     if(!optionDone[o] && p.options && (u.mergeValues ? u.OptionCheck(p.options, o) : u.OptionSet(p.options, o)))
                     {
                        u.LoadOption(p.options, o, o == includeDirsOption ? priority : 0, optionTempStrings, output);
                        if(!u.mergeValues) { u.FinalizeLoading(o, optionTempStrings, output); optionDone[o] = true; }
                        optionConfigXplatformSet[o] = true;
                     }
                  }
                  break;
               }
            }
            nodeConfig = c;
            break;
         }
      }
      for(uu : ot)
      {
         GenericOptionTools u = uu;
         o = &uu;
         if(!optionDone[o])
         {
            if(platform && n.platforms && (!optionConfigXplatformSet[o] || !u.configReplaces))
            {
               for(p : n.platforms; !strcmpi(p.name, platformName))
               {
                  if(p.options && (u.mergeValues ? u.OptionCheck(p.options, o) : u.OptionSet(p.options, o)))
                  {
                     u.LoadOption(p.options, o, o == includeDirsOption ? priority + 1 : 0, optionTempStrings, output);
                     if(!u.mergeValues) { u.FinalizeLoading(o, optionTempStrings, output); optionDone[o] = true; }
                  }
                  break;
               }
            }
            if(!optionDone[o] && nodeConfig && nodeConfig.options &&
                  ((u.mergeValues && !u.configReplaces) ?
                        u.OptionCheck(nodeConfig.options, o) :
                        u.OptionSet(nodeConfig.options, o)))
            {
               u.LoadOption(nodeConfig.options, o, o == includeDirsOption ? priority : 0, optionTempStrings, output);
               if(!u.mergeValues || u.configReplaces) { u.FinalizeLoading(o, optionTempStrings, output); optionDone[o] = true; }
            }
            if(!optionDone[o])
            {
               if(n.options && (u.mergeValues ? u.OptionCheck(n.options, o) : u.OptionSet(n.options, o)))
               {
                  u.LoadOption(n.options, o, o == includeDirsOption ? priority + 1 : 0, optionTempStrings, output);
                  if(!u.mergeValues) { u.FinalizeLoading(o, optionTempStrings, output); optionDone[o] = true; }
               }
               else if(!n.parent)
               {
                  u.LoadOption(null, o, o == includeDirsOption ? priority + 1 : 0, optionTempStrings, output);
                  if(!u.mergeValues) { u.FinalizeLoading(o, optionTempStrings, output); optionDone[o] = true; }
               }
            }
         }
      }
   }
   for(uu : ot)
   {
      GenericOptionTools u = uu;
      o = &uu;
      if(!optionDone[o])
         u.FinalizeLoading(o, optionTempStrings, output);
   }

   delete optionConfigXplatformSet;
   delete optionDone;
   delete optionTempStrings;

   delete utilSetBool;
   delete utilString;
   delete utilStringArrays;
   delete utilWarningsOption;
   delete utilOptimizationStrategy;

   delete ot;

   return output;
}

static void CollectPlatformsCommonOptions(Map<Platform, ProjectOptions> byPlatformOptions, ProjectOptions * platformsCommonOptions)
{
   ProjectOptions first = null;
   ProjectOptions commonOptions;

   Map<String, int> countIncludeDirs { };
   Map<String, int> countPreprocessorDefinitions { };
   Map<String, bool> commonIncludeDirs { };
   Map<String, bool> commonPreprocessorDefinitions { };

   for(options : byPlatformOptions) { first = options; break; }

   *platformsCommonOptions = commonOptions = first ? first.Copy() : { };

   if(commonOptions.includeDirs)
      commonOptions.includeDirs.Free();
   if(commonOptions.preprocessorDefinitions)
      commonOptions.preprocessorDefinitions.Free();

   for(options : byPlatformOptions)
   {
      if(options != first)
      {
         if(commonOptions.debug && options.debug != commonOptions.debug)
            commonOptions.debug = unset;
         if(commonOptions.memoryGuard && options.memoryGuard != commonOptions.memoryGuard)
            commonOptions.memoryGuard = unset;
         if(commonOptions.profile && options.profile != commonOptions.profile)
            commonOptions.profile = unset;
         if(commonOptions.noLineNumbers && options.noLineNumbers != commonOptions.noLineNumbers)
            commonOptions.noLineNumbers = unset;
         if(commonOptions.strictNameSpaces && options.strictNameSpaces != commonOptions.strictNameSpaces)
            commonOptions.strictNameSpaces = unset;
         if(commonOptions.fastMath && options.fastMath != commonOptions.fastMath)
            commonOptions.fastMath = unset;

         if(commonOptions.warnings && options.warnings != commonOptions.warnings)
            commonOptions.warnings = unset;
         if(commonOptions.optimization && options.optimization != commonOptions.optimization)
            commonOptions.optimization = unset;

         if(commonOptions.defaultNameSpace && strcmp(options.defaultNameSpace, commonOptions.defaultNameSpace))
            delete commonOptions.defaultNameSpace;
      }

      CountSameNonEmptyOrNullStrings(options.includeDirs, countIncludeDirs);
      CountSameNonEmptyOrNullStrings(options.preprocessorDefinitions, countPreprocessorDefinitions);
   }

   GetPlatformsCommonStrings(countIncludeDirs, byPlatformOptions.count,
         commonIncludeDirs, commonOptions.includeDirs);
   GetPlatformsCommonStrings(countPreprocessorDefinitions, byPlatformOptions.count,
         commonPreprocessorDefinitions, commonOptions.preprocessorDefinitions);

   for(options : byPlatformOptions)
   {
      if(options.debug && options.debug == commonOptions.debug)
         options.debug = unset;
      if(options.memoryGuard && options.memoryGuard == commonOptions.memoryGuard)
         options.memoryGuard = unset;
      if(options.profile && options.profile == commonOptions.profile)
         options.profile = unset;
      if(options.noLineNumbers && options.noLineNumbers == commonOptions.noLineNumbers)
         options.noLineNumbers = unset;
      if(options.strictNameSpaces && options.strictNameSpaces == commonOptions.strictNameSpaces)
         options.strictNameSpaces = unset;
      if(options.fastMath && options.fastMath == commonOptions.fastMath)
         options.fastMath = unset;

      if(options.warnings && options.warnings == commonOptions.warnings)
         options.warnings = unset;
      if(options.optimization && options.optimization == commonOptions.optimization)
         options.optimization = unset;

      if(options.defaultNameSpace && !strcmp(options.defaultNameSpace, commonOptions.defaultNameSpace))
         delete options.defaultNameSpace;

      RemovePlatformsCommonStrings(commonIncludeDirs, options.includeDirs);
      RemovePlatformsCommonStrings(commonPreprocessorDefinitions, options.preprocessorDefinitions);
   }

   delete countIncludeDirs;
   delete countPreprocessorDefinitions;
   delete commonIncludeDirs;
   delete commonPreprocessorDefinitions;
}

static ComplexComparison PlatformsOptionsGreaterEqual(Map<Platform, ProjectOptions> byPlatformOptions,
      Map<Platform, ProjectOptions> parentByPlatformOptions,
      Map<Platform, ProjectOptions> additionsByPlatformOptions)
{
   ComplexComparison result = equal;
   ComplexComparison compare;
   Platform platform;
   for(platform = (Platform)0; platform < Platform::enumSize; platform++)
   {
      ProjectOptions additionalOptions;
      additionsByPlatformOptions[platform] = { };
      additionalOptions = additionsByPlatformOptions[platform];
      compare = ExtractPlatformsOptionsAdditions(byPlatformOptions[platform], parentByPlatformOptions[platform], additionalOptions);
      if(compare == greater && result == equal)
         result = greater;
      else if(compare == different)
      {
         result = different;
         break;
      }
   }
   return result;
}

static ComplexComparison ExtractPlatformsOptionsAdditions(ProjectOptions options, ProjectOptions parentOptions, ProjectOptions additionalOptions)
{
   ComplexComparison result = equal;
   if(options.debug != parentOptions.debug ||
         options.memoryGuard != parentOptions.memoryGuard ||
         options.profile != parentOptions.profile ||
         options.noLineNumbers != parentOptions.noLineNumbers ||
         options.strictNameSpaces != parentOptions.strictNameSpaces ||
         options.fastMath != parentOptions.fastMath ||
         options.warnings != parentOptions.warnings ||
         options.optimization != parentOptions.optimization ||
         (options.defaultNameSpace != parentOptions.defaultNameSpace &&
               strcmp(options.defaultNameSpace, parentOptions.defaultNameSpace)))
      result = different;
   else
   {
      if(!StringsAreSameOrMore(options.includeDirs, parentOptions.includeDirs, &additionalOptions.includeDirs) ||
            !StringsAreSameOrMore(options.preprocessorDefinitions, parentOptions.preprocessorDefinitions, &additionalOptions.preprocessorDefinitions))
         result = different;
      if((additionalOptions.includeDirs && additionalOptions.includeDirs.count) ||
            (additionalOptions.preprocessorDefinitions && additionalOptions.preprocessorDefinitions.count))
         result = greater;
   }
   return result;
}

enum ComplexComparison { different/*, smaller*/, equal, greater };

static bool StringsAreSameOrMore(Array<String> strings, Array<String> originals, Array<String> * additions)
{
   bool result = true;
   if((!strings || !strings.count) && originals && originals.count)
      result = false;
   else if(strings && strings.count && (!originals || !originals.count))
   {
      if(!*additions)
         *additions = { };
      for(s : strings)
         additions->Add(CopyString(s));
   }
   else if(strings && strings.count && originals && originals.count)
   {
      Map<String, String> map { };
      MapIterator<String, bool> mit { map = map };
      for(it : strings)
      {
         char * s = strstr(it, "\n");
         s = s ? s+1 : it;
         map[s] = it;
      }
      for(it : originals)
      {
         char * s = strstr(it, "\n");
         s = s ? s+1 : it;
         if(!mit.Index(s, false))
         {
            result = false;
            break;
         }
         else
            mit.Remove();
            // TOFIX: Templates map[s] = null;
      }
      if(result)
      {
         if(!*additions)
            *additions = { };
         for(it : map)
         {
            if(it)
               additions->Add(CopyString(it));
         }
      }
      delete map;
   }
   return result;
}

static void CountSameNonEmptyOrNullStrings(Array<String> strings, Map<String, int> counts)
{
   if(strings)
   {
      for(it : strings)
      {
         char * s = it;
         if(s && s[0])
            counts[s]++;
      }
   }
}

static void GetPlatformsCommonStrings(Map<String, int> counts, int goodCount, Map<String, bool> common, Array<String> strings)
{
   for(it : counts)
   {
      int i = it;
      if(i == goodCount)
      {
         const char * s = &it;
         strings.Add(CopyString(s));
         common[s] = true;
      }
   }
}

static void RemovePlatformsCommonStrings(Map<String, bool> common, Array<String> strings)
{
   if(strings)
   {
      Array<String> tmp { };
      MapIterator<String, bool> mit { map = common };
      for(it : strings)
      {
         char * s = it;
         if(!mit.Index(s, false))
            tmp.Add(CopyString(s));
      }
      strings.Free();
      if(tmp.count)
      {
         for(s : tmp)
            strings.Add(CopyString(s));
         tmp.Free();
      }
      delete tmp;
   }
}

static void GenMakePrintNodeFlagsVariable(ProjectNode node, Map<intptr, int> nodeFlagsMapping, const String variableName, File f)
{
   int customFlags;
   customFlags = nodeFlagsMapping[(intptr)node];
   if(customFlags > 1)
      f.Printf(" $(CUSTOM%d_%s)", customFlags-1, variableName);
   else
      f.Printf(" $(%s)", variableName);
}

static void DynStringPrintNodeFlagsVariable(ProjectNode node, Map<intptr, int> nodeFlagsMapping, const String variableName, DynamicString s)
{
   int customFlags;
   customFlags = nodeFlagsMapping[(intptr)node];
   if(customFlags > 1)
      s.concatf(" $(CUSTOM%d_%s)", customFlags-1, variableName);
   else
      s.concatf(" $(%s)", variableName);
}

static void GenCFlagsFromProjectOptions(ProjectOptions options, bool prjWithEcFiles,
      bool commonOptions, bool isGreater, MakefileGenerationOptions opt, DynamicString s)
{
   if(!isGreater)
   {
      //if(gccCompiler)
      {
         if(options.optimization == speed || options.optimization == size ||
               options.fastMath == true || options.debug == true)
         {
            if(options.debug != true)
            {
               s.concat(" $(if $(DEBUG),");
               s.concat(" -g");
               s.concat(",");
            }
            switch(options.optimization)
            {
               case speed: s.concat(" -O2"); break;
               case size: s.concat(" -Os"); break;
            }
            if(options.fastMath == true)
               s.concat(" -ffast-math");
            if(options.debug == true)
               s.concat(" -g");
            if(options.debug != true)
               s.concat(")");
         }
         else if(commonOptions)
            s.concat(" $(if $(DEBUG),-g)");
         if(commonOptions)
            s.concat(" $(FPIC)");
      }
      switch(options.warnings)
      {
         case all: s.concat(" -Wall"); break;
         case none: s.concat(" -w"); break;
      }
      if(options.profile)
         s.concat(" -pg");
      /*if(commonOptions)
         s.concat(" $(FVISIBILITY)");*/
      if(commonOptions && !opt.noRepositoryVersion)
         s.concat(" \\\n\t\t -DREPOSITORY_VERSION=\"\\\"$(REPOSITORY_VER)\\\"\"");
   }

   if(options && options.preprocessorDefinitions)
      ListOptionToDynamicString(s, _D, options.preprocessorDefinitions, false, lineEach, "\t\t");
   if(options && options.includeDirs)
      ListOptionToDynamicString(s, _I, options.includeDirs, true, lineEach, "\t\t");
}

static void GenECFlagsFromProjectOptions(ProjectOptions options, bool prjWithEcFiles, DynamicString s)
{
   if(options.memoryGuard == true)
      s.concat(" -memguard");
   if(options.noLineNumbers == true)
      s.concat(" -nolinenumbers");
   if(options.strictNameSpaces == true)
      s.concat(" -strictns");
   if(options.defaultNameSpace && options.defaultNameSpace[0])
      s.concatf(" -defaultns %s", options.defaultNameSpace);
}

static void ListOptionToDynamicString(DynamicString output, ToolchainFlag flag, Array<String> list, bool prioritize,
      LineOutputMethod lineMethod, const String newLineStart)
{
   if(list.count)
   {
      if(lineMethod == newLine)
      {
         output.concat(" \\\n");
         output.concat(newLineStart);
      }
      if(prioritize)
      {
         Map<String, int> sortedList { };
         MapNode<String, int> mn;
         for(item : list)
            sortedList[item] = 1;
         for(mn = sortedList.root.minimum; mn; mn = mn.next)
         {
            char * start = strstr(mn.key, "\n");
            if(lineMethod == lineEach)
            {
               output.concat(" \\\n");
               output.concat(newLineStart);
            }
            output.concat(" ");
            output.concat(flagNames[flag]);
            EscapeForMakeToDynString(output, start ? start+1 : mn.key, false, true, flag == _D);
         }
         delete sortedList;
      }
      else
      {
         for(item : list)
         {
            if(lineMethod == lineEach)
            {
               output.concat(" \\\n");
               output.concat(newLineStart);
            }
            output.concat(" ");
            output.concat(flagNames[flag]);
            EscapeForMakeToDynString(output, item, false, true, flag == _D);
         }
      }
   }
}

class GenericOptionTools<class X>
{
   bool mergeValues, configReplaces;

   virtual bool OptionSet(ProjectOptions options, int option) {
      if(*(X*)((byte *)options + option))
         return true;
      return false;
   }

   // BUG: OptionCheck = OptionSet; // Overrides derived classes OptionCheck ?

   virtual bool OptionCheck(ProjectOptions options, int option) {
      return OptionSet(options, option);
   }

   virtual void LoadOption(ProjectOptions options, int option, int priority, Array<Array<String>> optionTempStrings, ProjectOptions output);
   virtual void FinalizeLoading(int option, Array<Array<String>> optionTempStrings, ProjectOptions output);
}

class StringArrayOptionTools : GenericOptionTools<Array<String>>
{
   bool caseSensitive;
}

class NameCollisionInfo
{
   bool ec;
   bool s;
   bool c;
   bool rc;
   bool cpp;
   bool cc;
   bool cxx;
   bool m;
   bool mm;
   byte count;

   bool IsExtensionColliding(char * extension)
   {
      bool colliding;
      if(count > 1 &&
            ((!strcmpi(extension, "c")   && ec) ||
             (!strcmpi(extension, "rc")  && (ec || c)) ||
             (!strcmpi(extension, "s")   && (ec || c || rc)) ||
             (!strcmpi(extension, "cpp") && (ec || c || rc || s)) ||
             (!strcmpi(extension, "cc")  && (ec || c || rc || s || cpp)) ||
             (!strcmpi(extension, "cxx") && (ec || c || rc || s || cpp || cc)) ||
             (!strcmpi(extension, "m")   && (ec || c || rc || s || cpp || cc || m)) ||
              !strcmpi(extension, "mm")))
         colliding = true;
      else
         colliding = false;
     return colliding;
   }
}
