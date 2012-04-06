#ifndef MAKEFILE_GENERATOR
import "ide"
#else
#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

import "Project"

static define app = ((GuiApplication)__thisModule);
#endif

bool eString_PathInsideOfMore(char * path, char * of, char * pathRest)
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

enum NodeTypes { project, file, folder, resources, folderOpen };
enum NodeIcons
{
   genFile, ewsFile, epjFile, folder, openFolder, ecFile, ehFile,
   cFile, hFile, cppFile, hppFile, textFile, webFile, pictureFile, soundFile,
   archiveFile, packageFile, opticalMediaImageFile, mFile;

   NodeIcons ::SelectFileIcon(char * filePath)
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
            else if(!strcmpi(extension, "c"))
               icon = cFile;
            else if(!strcmpi(extension, "h"))
               icon = hFile;
            else if(!strcmpi(extension, "m"))
               icon = mFile;
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

class ProjectNode : ListItem
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
   property String fileName
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

   // For makefile generation:
   bool GetECFLAGS(ProjectConfig prjConfig)
   {
      ProjectConfig config = GetMatchingNodeConfig(prjConfig);
      ProjectOptions options = property::options;
      SetBool memoryGuard = localMemoryGuard;
      String defaultNameSpace = localDefaultNameSpace;
      SetBool strictNameSpaces = localStrictNameSpaces;
      SetBool noLineNumbers = localNoLineNumbers;

      if(memoryGuard || defaultNameSpace || strictNameSpaces || noLineNumbers)
         return true;
      else if(parent.parent)
         return parent.GetECFLAGS(prjConfig);
      else
         return false;
   }
   
   bool GetMemoryGuard(ProjectConfig prjConfig)
   {
      ProjectConfig config = GetMatchingNodeConfig(prjConfig);
      ProjectOptions options = property::options;
      SetBool memoryGuard = localMemoryGuard;
      if(!memoryGuard)
      {
         if(parent)
            return parent.GetMemoryGuard(prjConfig);
      }
      return memoryGuard == true;
   }

   String GetDefaultNameSpace(ProjectConfig prjConfig)
   {
      ProjectConfig config = GetMatchingNodeConfig(prjConfig);
      ProjectOptions options = property::options;
      String defaultNameSpace = localDefaultNameSpace;
      if(!defaultNameSpace)
      {
         if(parent)
            return parent.GetDefaultNameSpace(prjConfig);
      }
      return defaultNameSpace;
   }

   bool GetStrictNameSpaces(ProjectConfig prjConfig)
   {
      ProjectConfig config = GetMatchingNodeConfig(prjConfig);
      ProjectOptions options = property::options;
      SetBool strictNameSpaces = localStrictNameSpaces;
      if(!strictNameSpaces)
      {
         if(parent)
            return parent.GetStrictNameSpaces(prjConfig);
      }
      return strictNameSpaces == true;
   }

   bool GetNoLineNumbers(ProjectConfig prjConfig)
   {
      ProjectConfig config = GetMatchingNodeConfig(prjConfig);
      ProjectOptions options = property::options;
      SetBool noLineNumbers = localNoLineNumbers;
      if(!noLineNumbers)
      {
         if(parent)
            return parent.GetNoLineNumbers(prjConfig);
      }
      return noLineNumbers == true;
   }

   property ProjectNode root { get { ProjectNode n; for(n = this; n.parent; n = n.parent); return n; } }

   property bool containsFile
   {
      get
      {
         bool result;
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

   char * GetFullFilePath(char * buffer)
   {
      if(buffer)
      {
         strcpy(buffer, root.path);
         PathCatSlash(buffer, path);
         PathCatSlash(buffer, name);
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
         ProjectConfig config = GetMatchingNodeConfig(prjConfig);
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

   void RenameConfig(char * oldName, char * newName)
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

   char * OnGetString(char * tempString, void * fieldData, bool * needClass)
   {
      if(!needClass)
      {
         // TOCHECK: Called from JSON writer
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
      char * exp, * var;
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
                  char * comma = mn.next ? "," : "";

                  var = PlatformToMakefileVariable(mn.key);

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
               var = PlatformToMakefileVariable(exclusionInfo.root.minimum.key);
            else
               var = PlatformToMakefileVariable(exclusionInfo.root.minimum.next.key);

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

   void CollectExclusionInfo(Map<Platform, SetBool> output, ProjectConfig prjConfig)
   {
      // note: unknown platform is for common
      Platform platform;
      ProjectConfig config = GetMatchingNodeConfig(prjConfig);
      ProjectOptions options = property::options;
      Array<PlatformOptions> platforms = property::platforms;
      List<ProjectConfig> configurations = property::configurations;

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

   ProjectNode Find(char * name, bool includeResources)
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

   ProjectNode FindWithPath(char * name, bool includeResources)
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

   ProjectNode FindSpecial(char * name, bool recursive, bool includeResources, bool includeFolders)
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

   ProjectNode FindSameNameConflict(char * name, bool includeResources,
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

   ProjectNode Add(Project project, char * filePath, ProjectNode after, NodeTypes type, NodeIcons icon, bool checkIfExists)
   {
      ProjectNode node = null;
      char temp[MAX_LOCATION];
      Map<Platform, SetBool> exclusionInfo { };

      GetLastDirectory(filePath, temp);
      //if(!checkIfExists || !project.topNode.Find(temp, false))
      
      // TOCHECK: Shouldn't this apply either for all configs or none?
      CollectExclusionInfo(exclusionInfo, project.config);
      if(!checkIfExists || !project.topNode.FindSameNameConflict(temp, false, exclusionInfo, project.config))
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
      return node;
   }

#ifndef MAKEFILE_GENERATOR
   void OnDisplay(Surface surface, int x, int y, int width, ProjectView projectView, Alignment alignment, DataDisplayFlags displayFlags)
   {
      char label[MAX_FILENAME];
      int indent = 16;
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
      xStart = /*indent * indent + */x + (bmp ? (bmp.width + 5) : 0);

      GetLastDirectory(name, label);
      if(!showConfig || projectView.drawingInProjectSettingsDialogHeader)
      {
         if(projectView.drawingInProjectSettingsDialogHeader || (type == project && info))
         {
            if(projectView.projectSettingsDialog && projectView.projectSettingsDialog.buildTab)
            {
               char * addendum;
               addendum = projectView.projectSettingsDialog.buildTab.selectedConfigName;
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
      int result;
      if(type == b.type /*|| type >= TYPE_DRIVE*/)
         result = strcmpi(name, b.name);
      else
      {
         if(type == folder && b.type == file) result = -1;
         else if(type == file && b.type == folder) result = 1;
      }
      return result;
   }

   bool ContainsFilesWithExtension(char * extension)
   {
      if(type == file)
      {
         char ext[MAX_EXTENSION];
         GetExtension(name, ext);
         if(!fstrcmp(ext, extension))
            return true;
      }
      else if(files)
      {
         bool needed = false;
         for(child : files)
            if(child.ContainsFilesWithExtension(extension))
               return true;
      }
      return false;
   }

   void GenFileFlags(File f, Project project, ProjectConfig prjConfig)
   {
      ProjectNode node = null;
      List<ProjectNode> nodeStack { };
      
      for(node = this; node && node.parent; node = node.parent)
         nodeStack.Add(node);

      // Should we reverse this stack to give priority to the per-file includes?

      while((node = nodeStack.lastIterator.data))
      {
         ProjectOptions nodeOptions = node.property::options;
         ProjectConfig config = node.GetMatchingNodeConfig(prjConfig);
         if(nodeOptions && nodeOptions.preprocessorDefinitions)
            OutputListOption(f, "D", nodeOptions.preprocessorDefinitions, inPlace, false);
         if(config && config.options && config.options.preprocessorDefinitions)
            OutputListOption(f, "D", config.options.preprocessorDefinitions, inPlace, false);
         if(nodeOptions && nodeOptions.includeDirs)
            OutputListOption(f, "I", nodeOptions.includeDirs, inPlace, true);
         if(config && config.options && config.options.includeDirs)
            OutputListOption(f, "I", config.options.includeDirs, inPlace, true);

         nodeStack.lastIterator.Remove();
      }
      delete nodeStack;
   }

   void GenMakefileGetNameCollisionInfo(Map<String, NameCollisionInfo> namesInfo, ProjectConfig prjConfig)
   {
      if(type == file)
      {
         char extension[MAX_EXTENSION];
         GetExtension(name, extension);
         if(!strcmpi(extension, "ec") || !strcmpi(extension, "c") ||
               !strcmpi(extension, "cpp") || !strcmpi(extension, "cc") ||
               !strcmpi(extension, "cxx") || !strcmpi(extension, "m"))
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
            else if(!strcmpi(extension, "c"))
               info.c = true;
            else if(!strcmpi(extension, "cpp"))
               info.cpp = true;
            else if(!strcmpi(extension, "cc"))
               info.cc = true;
            else if(!strcmpi(extension, "cxx"))
               info.cxx = true;
            else if(!strcmpi(extension, "m"))
               info.m = true;
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
      Map<String, NameCollisionInfo> namesInfo, Array<String> items,
      ProjectConfig prjConfig)
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
            ReplaceSpaces(modulePath, tempPath);
            sprintf(s, "%s%s%s%s", ts.a, useRes ? "$(RES)" : "", modulePath, ts.b);
            items.Add(CopyString(s));
         }
         else if(printType == sources)
         {
            if(!strcmpi(extension, "c") || !strcmpi(extension, "cpp") ||
                  !strcmpi(extension, "cc") || !strcmpi(extension, "cxx") ||
                  !strcmpi(extension, "ec") || !strcmpi(extension, "m"))
            {
               char modulePath[MAX_LOCATION];

               ReplaceSpaces(modulePath, path);
               ReplaceSpaces(moduleName, name);
               sprintf(s, "%s%s%s%s%s", ts.a, modulePath, path[0] ? SEPS : "", moduleName, ts.b);
               items.Add(CopyString(s));
            }
         }
         else if(!strcmpi(extension, "c") || !strcmpi(extension, "cpp") ||
               !strcmpi(extension, "cc") || !strcmpi(extension, "cxx") ||
               !strcmpi(extension, "m"))
         {
            if(printType == objects)
            {
               bool collision;
               NameCollisionInfo info;
               ReplaceSpaces(moduleName, name);
               StripExtension(moduleName);
               info = namesInfo[moduleName];
               collision = info ? info.IsExtensionColliding(extension) : false;
               sprintf(s, "%s$(OBJ)%s%s%s.o%s", ts.a, moduleName, collision ? "." : "", collision ? extension : "", ts.b);
               items.Add(CopyString(s));
            }
         }
         else if(!strcmpi(extension, "ec"))
         {
            ReplaceSpaces(moduleName, name);
            StripExtension(moduleName);
            if(printType == objects)
               count++;
            s[0] = '\0';
            if(printType == objects)
               sprintf(s, "%s$(OBJ)%s.o%s", ts.a, moduleName, ts.b);
            else if(printType == cObjects)
               sprintf(s, "%s$(OBJ)%s.c%s", ts.a, moduleName, ts.b);
            else if(printType == symbols)
               sprintf(s, "%s$(OBJ)%s.sym%s", ts.a, moduleName, ts.b);
            else if(printType == imports)
               sprintf(s, "%s$(OBJ)%s.imp%s", ts.a, moduleName, ts.b);
            if(s[0])
               items.Add(CopyString(s));
         }
         delete ts;
      }
      else if(files)
      {
         for(child : files)
         {
            if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
               count += child.GenMakefilePrintNode(f, project, printType, namesInfo, items, prjConfig);
         }
      }
      return count;
   }

   void GenMakefilePrintSymbolRules(File f, Project project, CompilerConfig compiler,
         ProjectConfig prjConfig, Map<Platform, bool> parentExcludedPlatforms)
   {
      int ifCount = 0;
      Array<Platform> platforms = GetPlatformsArrayFromExcluisionInfo(prjConfig);
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
            DualPipe dep;
            char command[2048];

            ReplaceSpaces(moduleName, name);
            StripExtension(moduleName);

            ReplaceSpaces(modulePath, path);
            if(modulePath[0]) strcat(modulePath, SEPS);

#if 0
            // *** Dependency command ***
            sprintf(command, "gcc -MT $(OBJ)%s.o -MM %s%s.%s", moduleName,
               modulePath, moduleName, extension);

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
            if((dep = DualPipeOpen(PipeOpenMode { output = 1, error = 1, input = 2 }, command)))
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
               delete dep;

               // If we failed to generate dependencies...
               if(!result)
               {
#endif
               OpenRulesPlatformExclusionIfs(f, &ifCount, platforms[0], parentExcludedPlatforms, null);
                  f.Printf("$(OBJ)%s.sym: %s%s.%s\n",
                     moduleName, modulePath, moduleName, extension);
#if 0
               }
            }
#endif
         /*
            f.Printf("\t$(ECP) %s%s.%s %s.sym\n\n",
               modulePath, moduleName, extension, moduleName);
            */

            f.Printf("\t$(ECP)");
            // Give priority to file flags
            GenFileFlags(f, project, prjConfig);

            f.Printf(" $(CECFLAGS)");
            if(GetECFLAGS(prjConfig))
            {
               if(GetMemoryGuard(prjConfig))
                  f.Printf(" -memguard");
               if(GetStrictNameSpaces(prjConfig))
                  f.Printf(" -strictns");
               {
                  char * s = GetDefaultNameSpace(prjConfig);
                  if(s && s[0])
                     f.Printf(" -defaultns %s", s);
               }
            }
            else
               f.Printf(" $(ECFLAGS)");
            f.Printf(" $(CFLAGS)");

            f.Printf(" -c %s%s.%s -o $(OBJ)%s.sym\n\n",
               modulePath, moduleName, extension, moduleName);
            CloseRulesPlatformExclusionIfs(f, ifCount);
         }
      }
      if(files)
      {
         bool needed = false;
         if(ContainsFilesWithExtension("ec"))
         {
            for(child : files)
            {
               if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
               {
                  needed = true;
                  break;
               }
            }
         }
         if(needed)
         {
            Map<Platform, bool> excludedPlatforms { };
            for(mn : parentExcludedPlatforms) if(mn) excludedPlatforms[&mn] = true;
            for(platform : platforms)
            {
               OpenRulesPlatformExclusionIfs(f, &ifCount, platform, parentExcludedPlatforms, excludedPlatforms);
               for(child : files)
               {
                  if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
                     child.GenMakefilePrintSymbolRules(f, project, compiler, prjConfig, excludedPlatforms);
               }
            }
            CloseRulesPlatformExclusionIfs(f, ifCount);
            delete excludedPlatforms;
         }
      }
      delete platforms;
   }

   void GenMakefilePrintPrepecsRules(File f, Project project, CompilerConfig compiler,
         ProjectConfig prjConfig, Map<Platform, bool> parentExcludedPlatforms)
   {
      int ifCount = 0;
      ProjectConfig config = GetMatchingNodeConfig(prjConfig);
      Array<Platform> platforms = GetPlatformsArrayFromExcluisionInfo(prjConfig);
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
            DualPipe dep;
            char command[2048];

            ReplaceSpaces(moduleName, name);
            StripExtension(moduleName);

            ReplaceSpaces(modulePath, path);
            if(modulePath[0]) strcat(modulePath, SEPS);

            OpenRulesPlatformExclusionIfs(f, &ifCount, platforms[0], parentExcludedPlatforms, null);
            f.Printf("$(OBJ)%s$(EC): %s%s.%s\n",
               moduleName, modulePath, moduleName, extension);
            //$(CPP) -x c -E ../extras/gui/controls/DirectoriesBox.ec -o $(OBJ)DirectoriesBox$(EC)
            /*f.Printf("\t$(CPP) %s%s.%s %s$(S)\n\n",
               modulePath, moduleName, extension, moduleName);*/

            f.Printf("\t$(CPP)");
            // Give priority to file flags
            GenFileFlags(f, project, prjConfig);

            /*f.Printf(" $(CECFLAGS)");
            if(GetECFLAGS(prjConfig))
            {
               if(GetMemoryGuard(prjConfig))
                  f.Printf(" -memguard");
               if(GetStrictNameSpaces(prjConfig))
                  f.Printf(" -strictns");
               {
                  char * s = GetDefaultNameSpace(prjConfig);
                  if(s && s[0])
                     f.Printf(" -defaultns %s", s);
               }
            }
            else
               f.Printf(" $(ECFLAGS)");*/
            f.Printf(" $(CFLAGS)");

            f.Printf(" -x c -E %s%s.%s -o $(OBJ)%s$(EC)\n\n",
               modulePath, moduleName, extension, moduleName);
            CloseRulesPlatformExclusionIfs(f, ifCount);
         }
      }
      if(files)
      {
         bool needed = false;
         if(ContainsFilesWithExtension("ec"))
         {
            for(child : files)
            {
               if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
               {
                  needed = true;
                  break;
               }
            }
         }
         if(needed)
         {
            Map<Platform, bool> excludedPlatforms { };
            for(mn : parentExcludedPlatforms) if(mn) excludedPlatforms[&mn] = true;
            for(platform : platforms)
            {
               OpenRulesPlatformExclusionIfs(f, &ifCount, platform, parentExcludedPlatforms, excludedPlatforms);
               for(child : files)
               {
                  if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
                     child.GenMakefilePrintPrepecsRules(f, project, compiler, prjConfig, excludedPlatforms);
               }
            }
            CloseRulesPlatformExclusionIfs(f, ifCount);
            delete excludedPlatforms;
         }
      }
      delete platforms;
   }

   void GenMakefilePrintCObjectRules(File f, Project project, CompilerConfig compiler,
      ProjectConfig prjConfig, Map<Platform, bool> parentExcludedPlatforms)
   {
      int ifCount = 0;
      ProjectConfig config = GetMatchingNodeConfig(prjConfig);
      Array<Platform> platforms = GetPlatformsArrayFromExcluisionInfo(prjConfig);
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
            DualPipe dep;
            char command[2048];

            ReplaceSpaces(moduleName, name);
            StripExtension(moduleName);

            ReplaceSpaces(modulePath, path);
            if(modulePath[0]) strcat(modulePath, SEPS);

#if 0
            // *** Dependency command ***
            sprintf(command, "gcc -MT $(OBJ)%s.o -MM %s%s.%s",
               moduleName, modulePath, moduleName, extension);

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
                  /* COMMENTED OUT FOR NOW
                  f.Printf("$(OBJ)%s.c: %s%s.%s $(Symbols)\n",
                     moduleName, modulePath, moduleName, extension);
                  */
#endif
            OpenRulesPlatformExclusionIfs(f, &ifCount, platforms[0], parentExcludedPlatforms, null);
                  f.Printf("$(OBJ)%s.c: %s%s.%s $(OBJ)%s.sym | $(SYMBOLS)\n",
                     moduleName, modulePath, moduleName, extension, moduleName);
#if 0
               }
            }
#endif
         /*
            f.Printf("\t$(ECC) %s%s.%s $(OBJ)%s.c\n\n",
               modulePath, moduleName, extension, moduleName);
         */

            f.Printf("\t$(ECC)");
            // Give priority to file flags
            GenFileFlags(f, project, prjConfig);
            if(GetECFLAGS(prjConfig))
            {
               f.Printf("%s $(CECFLAGS)", GetNoLineNumbers(prjConfig) ? " -nolinenumbers" : "");
               if(GetMemoryGuard(prjConfig))
                  f.Printf(" -memguard");
               if(GetStrictNameSpaces(prjConfig))
                  f.Printf(" -strictns");
               {
                  char * s = GetDefaultNameSpace(prjConfig);
                  if(s && s[0])
                     f.Printf(" -defaultns %s", s);
               }
            }
            else
               f.Printf(" $(CECFLAGS) $(ECFLAGS)");
            f.Printf(" $(CFLAGS) $(FVISIBILITY)");

            f.Printf(" -c %s%s.%s -o $(OBJ)%s.c -symbols $(OBJ)\n\n",
               modulePath, moduleName, extension, moduleName);
            CloseRulesPlatformExclusionIfs(f, ifCount);
         }
      }
      if(files)
      {
         bool needed = false;
         if(ContainsFilesWithExtension("ec"))
         {
            for(child : files)
            {
               if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
               {
                  needed = true;
                  break;
               }
            }
         }
         if(needed)
         {
            Map<Platform, bool> excludedPlatforms { };
            for(mn : parentExcludedPlatforms) if(mn) excludedPlatforms[&mn] = true;
            for(platform : platforms)
            {
               OpenRulesPlatformExclusionIfs(f, &ifCount, platform, parentExcludedPlatforms, excludedPlatforms);
               for(child : files)
               {
                  if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
                     child.GenMakefilePrintCObjectRules(f, project, compiler, prjConfig, excludedPlatforms);
               }
            }
            CloseRulesPlatformExclusionIfs(f, ifCount);
            delete excludedPlatforms;
         }
      }
      delete platforms;
   }

   void GenMakefilePrintObjectRules(File f, Project project,
      Map<String, NameCollisionInfo> namesInfo,
      CompilerConfig compiler, ProjectConfig prjConfig,
      Map<Platform, bool> parentExcludedPlatforms)
   {
      int ifCount = 0;
      ProjectConfig config = GetMatchingNodeConfig(prjConfig);
      Array<Platform> platforms = GetPlatformsArrayFromExcluisionInfo(prjConfig);
      //ProjectNode child;
      //char objDir[MAX_LOCATION];
      //ReplaceSpaces(objDir, config.objDir.dir);
      //eSystem_Log("Printing Object Rules\n");
      if(type == file)
      {
         bool collision;
         char extension[MAX_EXTENSION];
         char modulePath[MAX_LOCATION];
         char moduleName[MAX_FILENAME];

         GetExtension(name, extension);
         /*if(!strcmpi(extension, "c") || !strcmpi(extension, "cpp") ||
               !strcmpi(extension, "ec") || !strcmpi(extension, "cc") ||
               !strcmpi(extension, "cxx"))*/
         if(!strcmpi(extension, "c") || !strcmpi(extension, "cpp") ||
               !strcmpi(extension, "cc") || !strcmpi(extension, "cxx") ||
               !strcmpi(extension, "m") || !strcmpi(extension, "ec"))
         {
            DualPipe dep;
            char command[2048];
            NameCollisionInfo info;

            ReplaceSpaces(moduleName, name);
            StripExtension(moduleName);

            info = namesInfo[moduleName];
            collision = info ? info.IsExtensionColliding(extension) : false;
            
            ReplaceSpaces(modulePath, path);
            if(modulePath[0]) strcat(modulePath, SEPS);

            // *** Dependency command ***
            if(!strcmpi(extension, "ec"))
               sprintf(command, "%s -MT $(OBJ)%s.o -MM $(OBJ)%s.c", compiler.ccCommand, moduleName, moduleName);
            else
               sprintf(command, "%s -MT $(OBJ)%s.o -MM %s%s.%s", compiler.ccCommand, moduleName, modulePath, moduleName, extension);

            if(!strcmpi(extension, "ec"))
               f.Printf("$(OBJ)%s.o: $(OBJ)%s.c\n", moduleName, moduleName);
            else
            {
#if 0
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
               if((dep = DualPipeOpen(PipeOpenMode { output = 1, error = 1, input = 2 }, command)))
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
                  delete dep;

                  // If we failed to generate dependencies...
                  if(!result)
                  {
#endif
            OpenRulesPlatformExclusionIfs(f, &ifCount, platforms[0], parentExcludedPlatforms, null);

                     /*if(!strcmpi(extension, "ec"))
                        f.Printf("$(OBJ)%s.o: $(OBJ)%s.c\n", moduleName, moduleName);
                     else*/
                        f.Printf("$(OBJ)%s%s%s.o: %s%s.%s\n", moduleName, 
                              collision ? "." : "", collision ? extension : "", modulePath, moduleName, extension);
#if 0
                  }
               }
#endif
            }
            f.Printf("\t$(CC)");
            // Give priority to file flags
            GenFileFlags(f, project, prjConfig);

            f.Printf(" $(CFLAGS)");

            if(!strcmpi(extension, "ec"))
               f.Printf(" $(FVISIBILITY) -c $(OBJ)%s.c -o $(OBJ)%s.o\n\n", moduleName, moduleName);
            else
               f.Printf(" -c %s%s.%s -o $(OBJ)%s%s%s.o\n\n",
                     modulePath, moduleName, !strcmpi(extension, "ec") ? "c" : extension, moduleName,
                     collision ? "." : "", collision ? extension : "");
            CloseRulesPlatformExclusionIfs(f, ifCount);
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
            Map<Platform, bool> excludedPlatforms { };
            for(mn : parentExcludedPlatforms) if(mn) excludedPlatforms[&mn] = true;
            for(platform : platforms)
            {
               OpenRulesPlatformExclusionIfs(f, &ifCount, platform, parentExcludedPlatforms, excludedPlatforms);
               for(child : files)
               {
                  if(child.type != resources && (child.type == folder || !child.GetIsExcluded(prjConfig)))
                     child.GenMakefilePrintObjectRules(f, project, namesInfo, compiler, prjConfig, excludedPlatforms);
               }
            }
            CloseRulesPlatformExclusionIfs(f, ifCount);
            delete excludedPlatforms;
         }
      }
      delete platforms;
   }

   void GenMakefileAddResources(File f, String resourcesPath, ProjectConfig prjConfig)
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

               char * quotes;

               // $(EAR) aw%s --- /*quiet ? "q" : */""
               if(count == 0)
                  f.Printf("\t%s$(EAR) aw $(TARGET)", ts.a);

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
               ReplaceSpaces(resPath, tempPath);
               if(strchr(tempPath, ' '))
                  quotes = "\"";
               else
                  quotes = "";
               f.Printf(" %s%s%s%s", quotes, useRes ? "$(RES)" : "", tempPath, quotes);
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
               child.GenMakefileAddResources(f, resourcesPath, prjConfig);
         }
      }
   }

   Array<Platform> GetPlatformsArrayFromExcluisionInfo(ProjectConfig prjConfig)
   {
      Array<Platform> platforms { };
      Map<Platform, SetBool> exclusionInfo { };
      CollectExclusionInfo(exclusionInfo, prjConfig);
      if(exclusionInfo[unknown] == true && exclusionInfo.count > 1)
         for(mn : exclusionInfo; mn == false)
            platforms.Add(&mn);
      else
         platforms.Add(unknown);
      delete exclusionInfo;
      return platforms;
   }
}

class NameCollisionInfo
{
   bool ec;
   bool c;
   bool cpp;
   bool cc;
   bool cxx;
   bool m;
   byte count;

   bool IsExtensionColliding(char * extension)
   {
      bool colliding;
      if(count > 1 && ((!strcmpi(extension, "c") && ec) ||
            (!strcmpi(extension, "cpp") && (ec || c)) ||
            (!strcmpi(extension, "cc") && (ec || c || cpp)) ||
            (!strcmpi(extension, "cxx") && (ec || c || cpp || cc)) ||
            !strcmpi(extension, "m")))
         colliding = true;
      else
         colliding = false;
     return colliding;
   }
}

static inline void OpenRulesPlatformExclusionIfs(File f, int * ifCount, Platform platform,
      Map<Platform, bool> parentExcludedPlatforms, Map<Platform, bool> excludedPlatforms)
{
   if(platform != unknown && !parentExcludedPlatforms[platform])
   {
      if(*ifCount)                 // we really need a if defined(a) || defined(b) here
         f.Printf("else\n");       // instead of repeating the rules for each platform
      (*ifCount)++;                  //
      f.Printf("ifdef %s\n\n", PlatformToMakefileVariable(platform)); //
      if(excludedPlatforms)
         excludedPlatforms[platform] = true;
   }
}

static inline void CloseRulesPlatformExclusionIfs(File f, int ifCount)
{
   if(ifCount)
   {
      int c;
      for(c = 0; c < ifCount; c++)
         f.Printf("endif\n");
      f.Printf("\n");
   }
}
