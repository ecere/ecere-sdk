import "ide"

enum OpenedFileState { unknown, opened, closed };
enum ValgrindLeakCheck
{
   no, summary, yes, full;

   property const char *
   {
      get { return OnGetString(null, null, null); }
   }

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      if(this >= no && this <= full)
      {
         if(tempString)
            strcpy(tempString, valgrindLeakCheckNames[this]);
         return valgrindLeakCheckNames[this];
      }
      if(tempString && tempString[0])
         tempString[0] = '\0';
      return null;
   }
};
static const char * valgrindLeakCheckNames[ValgrindLeakCheck] = { "no", "summary", "yes", "full" };

class OpenedFileInfo : struct
{
   class_no_expansion;
public:
//   class_fixed
   char * path;
   OpenedFileState state;
   int lineNumber;
   int position;
   Point scroll;
   TimeStamp modified;

private:
   bool holdTracking;

   property bool trackingAllowed
   {
      get { return !holdTracking && ide && ide.workspace && !ide.workspace.holdTracking; }
   }

   void CaretMove(int line, int charPos)
   {
      if(trackingAllowed && (line != lineNumber || position != charPos))
      {
         lineNumber = line;
         position = charPos;
         ide.workspace.modified = true;
      }
   }

   void ScrollChange(Point scroll)
   {
      if(trackingAllowed)
      {
         this.scroll.x = scroll.x;
         this.scroll.y = scroll.y;
         ide.workspace.modified = true;
      }
   }

   void Activate()
   {
      if(trackingAllowed)
      {
         List<OpenedFileInfo> files = ide.workspace.openedFiles;
         Iterator<OpenedFileInfo> it { files };
         IteratorPointer last;
         if(it.Find(this) && it.pointer != (last = files.GetLast()))
         {
            files.Move(it.pointer, last);
            ide.workspace.modified = true;
         }
         modified = GetLocalTimeStamp();
      }
   }

   void SetCodeEditorState(CodeEditor editor)
   {
      int num = Max(lineNumber - 1, 0);
      Point scrl;
      holdTracking = true;
      if(editor.editBox.GoToLineNum(num))
      {
         int pos = Max(Min(editor.editBox.line.count, position - 1), 0);
         editor.editBox.GoToPosition(editor.editBox.line, num, pos);
      }
      scrl.x = Max(scroll.x, 0);
      scrl.y = Max(scroll.y, 0);
      editor.editBox.scroll = scrl;
      holdTracking = false;
   }

   ~OpenedFileInfo()
   {
      delete path;
   }
};

class WorkspaceFile : struct
{
   class_no_expansion;
public:
   property const char * format
   {
      set { }
      get { return "Ecere IDE Workspace File"; }
      isset { return true; }
   }
   property const char * version
   {
      set { }
      get { return "0.1"; }
      isset { return true; }
   }
   Workspace workspace;
}

enum AddedProjectType : bool { project = false, folderLauncher/*, dynamicFolder*/ };
class AddedProjectInfo : struct
{
   class_no_expansion;
public:
   property const char * path
   {
      set { delete path; if(value && value[0]) path = CopyString(value); }
      get { return path && path[0] ? path : null; }
      isset { return path != null; }
   }
   property const char * activeConfig
   {
      set { delete activeConfig; if(value && value[0]) activeConfig = CopyString(value); }
      get
      {
         char * config;
         if(project && project.config)
            config = project.config.name;
         else
            config = activeConfig;
         return config && config[0] ? config : null;
      }
      isset { return property::activeConfig != null; }
   }
   property AddedProjectType type
   {
      set { type = value; }
      get { return type; }
      isset { return type; }
   }
private:
   char * path;
   char * activeConfig;
   Project project;
   AddedProjectType type;

   void Free()
   {
      delete path;
      delete activeConfig;
   }

   void OnFree()
   {
      Free();
      class::OnFree();
   }

   ~AddedProjectInfo()
   {
      Free();
   }
}

class Workspace : struct
{
   class_no_expansion;
public:
   property const char * name
   {
      set { delete name; if(value && value[0]) name = CopyString(value); }
      get { return name && name[0] ? name : null; }
      isset { return name != null; }
   }
   property const char * activeCompiler
   {
      set { delete activeCompiler; if(value && value[0]) activeCompiler = CopyString(value); }
      get { return activeCompiler && activeCompiler[0] ? activeCompiler : null; }
      isset { return activeCompiler != null; }
   }
   int bitDepth;
   property const char * commandLineArgs
   {
      set { delete commandLineArgs; if(value && value[0]) commandLineArgs = CopyString(value); }
      get { return commandLineArgs && commandLineArgs[0] ? commandLineArgs : null; }
      isset { return commandLineArgs != null; }
   }
   property const char * debugDir
   {
      set { delete debugDir; if(value && value[0]) debugDir = CopyString(value); }
      get { return debugDir && debugDir[0] ? debugDir : null; }
      isset { return debugDir != null; }
   }

   property List<AddedProjectInfo> addedProjects { set { addedProjects = value; } get { return addedProjects; } isset { return addedProjects && addedProjects.count; } }
   property List<String> sourceDirs { set { sourceDirs = value; } get { return sourceDirs; } isset { return sourceDirs && sourceDirs.count; } }
   property Array<NamedString> environmentVars { set { environmentVars = value; } get { return environmentVars; } isset { return environmentVars && environmentVars.count; } }
   property List<Breakpoint> breakpoints { set { breakpoints = value; } get { return breakpoints; } isset { return breakpoints && breakpoints.count; } }
   property List<Watch> watches { set { watches = value; } get { return watches; } isset { return watches && watches.count; } }
   property List<OpenedFileInfo> openedFiles { set { openedFiles = value; } get { return openedFiles; } isset { return openedFiles && openedFiles.count; } }
   property RecentPaths recentFiles { set { recentFiles = value; } get { return recentFiles; } isset { return recentFiles && recentFiles.count; } }

   bool useValgrind;
   ValgrindLeakCheck vgLeakCheck;
   bool vgTrackOrigins;
   int vgRedzoneSize;
   bool alwaysRebuild;
   bool noParsing;
   GuiConfigData guiConfigData;

private:
   char * name;
   char * activeCompiler;
   char * commandLineArgs;
   char * debugDir;

   List<AddedProjectInfo> addedProjects;
   List<String> sourceDirs;
   Array<NamedString> environmentVars;
   List<Breakpoint> breakpoints;
   List<Watch> watches;
   List<OpenedFileInfo> openedFiles;
   RecentPaths recentFiles;

   char * workspaceFile;
   char * workspaceDir;

   int bpCount;

   List<Project> projects { };
   //Project project;

   bool modified;
   bool holdTracking;

   property bool isModified { get { return modified || (guiConfigData && guiConfigData.modified); } }

   vgRedzoneSize = -1;
   vgLeakCheck = summary;

   Timer timer
   {
      userData = this, delay = 1.0;
      bool DelayExpired()
      {
         static bool skip = true;
         if(skip)
            skip = false;
         else if(isModified)
            Save();

         if(ide.debugStart)
         {
            ide.MenuDebugStart(ide.debugStartResumeItem, 0);
            ide.debugStart = false;
         }
         return true;
      }
   };

   void AddProject(Project project, AddedProjectInfo addedProject)
   {
      if(addedProject)
      {
         ProjectConfig activeConfig = project.GetConfig(addedProject.activeConfig);
         if(activeConfig)
            project.config = activeConfig;
         addedProject.project = project;
      }
      else
      {
         char location[MAX_LOCATION];
         GetRelativePathForProject(location, project);
         if(!addedProjects)
            addedProjects = { };
         addedProjects.Add(AddedProjectInfo { path = location, project = project });
      }
      projects.Add(project);
   }

   property const char * workspaceFile
   {
      set
      {
         char dir[MAX_DIRECTORY];
         if(workspaceFile) delete workspaceFile;
         if(workspaceDir) delete workspaceDir;
         workspaceFile = CopyString(value);
         StripLastDirectory(workspaceFile, dir);
         workspaceDir = CopyUnixPath(dir);
      }
      get { return workspaceFile; }
   }

   property const char * projectDir
   {
      get
      {
         if(projects.first)
         {
            Project prj = projects.firstIterator.data;
            return prj.topNode ? prj.topNode.path : null;
         }
         else
            return workspaceDir;
      }
   }

   /*property Project project
   {
      set
      {
         if(project)
         {
         }
         project = value;
         if(project)
         {
            projectDir = CopyString(project.topNode.path);

            if(!project.config && activeConfig && activeConfig[0])
            {
               ProjectConfig cfg;
               for(cfg = project.configurations.first; cfg; cfg = cfg.next)
                  if(!strcmp(cfg.name, activeConfig))
                     break;
               project.config = cfg;
            }
            if(!project.config)
               project.config = project.configurations.first;
         }
      }
      get { return project; }
   }*/

public:
   void Save()
   {
      if(workspaceFile && workspaceFile[0])
      {
         File file = FileOpen(workspaceFile, write);
         if(file)
         {
            WorkspaceFile wf { workspace = this };
            WriteECONObject(file, class(WorkspaceFile), wf, 0);
            delete wf;
            delete file;
            modified = false;
         }
      }
   }

   const char * getRightPath(const char * filePath)
   {
      const char * rightPath = null;
      for(p : projects)
      {
         rightPath = p.topNode.getRightPath(filePath);
         if(rightPath) break;
         rightPath = p.resNode.getRightPath(filePath);
         if(rightPath) break;
      }
      return rightPath;
   }

   char * CopyAbsolutePathFromRelative(const char * relative)
   {
      char name[MAX_LOCATION];
      char absolute[MAX_LOCATION];
      Project prj = null;
      ProjectNode node = null;

      GetLastDirectory(relative, name);
      for(p : projects)
      {
         if((node = p.topNode.Find(name, false)))
         {
            prj = p;
            break;
         }
      }
      if(prj)
      {
         node.GetFullFilePath(absolute, true, true);
         return CopyString(absolute);
      }

      prj = null;
      for(p : projects)
      {
         strcpy(absolute, p.topNode.path);
         PathCatSlash(absolute, relative);
         if(FileExists(absolute))
         {
            prj = p;
            break;
         }
      }
      if(prj)
         return CopyString(absolute);

      strcpy(absolute, workspaceDir); //projectDir // CHECK?
      PathCatSlash(absolute, relative);
      if(FileExists(absolute))
         return CopyString(absolute);

      {
         for(dir : sourceDirs)
         {
            strcpy(absolute, dir);
            PathCatSlash(absolute, relative);
            if(FileExists(absolute))
               return CopyString(absolute);
         }
      }

      return null;
   }

   char * CopyUnixPathWorkspaceRelativeOrAbsolute(const char * path)
   {
      if(IsPathInsideOf(path, workspaceDir))
      {
         char relativePath[MAX_LOCATION];
         MakePathRelative(path, workspaceDir, relativePath);
         return CopyUnixPath(relativePath);
      }
      else
         return CopyUnixPath(path);
   }

   char * MakeRelativePath(char * buffer, const char * path)
   {
      char * result = null;
      if(buffer && path)
      {
         MakePathRelative(path, workspaceDir, buffer);
         MakeSlashPath(buffer);
         result = buffer;
      }
      return result;
   }

   char * GetRelativePathForProject(char * buffer, Project project)
   {
      char * result = null;
      if(buffer && project && project.topNode.path)
      {
         MakePathRelative(project.topNode.path, workspaceDir, buffer);
         MakeSlashPath(buffer);
         PathCatSlash(buffer, project.topNode.name);
         result = buffer;
      }
      return result;
   }

   Array<ProjectNode> GetAllProjectNodes(const char *fullPath, bool skipExcluded)
   {
      Array<ProjectNode> nodes = null;
      for(project : projects)
      {
         ProjectNode node;
         if((node = project.topNode.FindByFullPath(fullPath, false)))
         {
            if(!skipExcluded || !node.GetIsExcluded(project.config))
            {
               if(!nodes) nodes = { };
               nodes.Add(node);
            }
         }
      }
      return nodes;
   }

   Project GetFileOwner(const char * absolutePath, const char * objectFileExt)
   {
      Project owner = null;
      for(prj : projects)
      {
         if(prj.topNode.FindByFullPath(absolutePath, false))
         {
            owner = prj;
            break;
         }
      }
      if(!owner)
         GetObjectFileNode(absolutePath, &owner, null, objectFileExt);
      return owner;
   }

   void GetRelativePath(const char * absolutePath, char * relativePath, Project * owner, const char * objectFileExt)
   {
      Project prj = GetFileOwner(absolutePath, objectFileExt);
      if(owner)
         *owner = prj;
      if(!prj)
         prj = projects.firstIterator.data;
      if(prj)
      {
         MakePathRelative(absolutePath, prj.topNode.path, relativePath);
         MakeSlashPath(relativePath);
      }
      else
         relativePath[0] = '\0';
   }

   ProjectNode GetObjectFileNode(const char * filePath, Project * project, char * fullPath, const char * objectFileExt)
   {
      ProjectNode node = null;
      char ext[MAX_EXTENSION];
      GetExtension(filePath, ext);
      if(ext[0])
      {
         IntermediateFileType type = IntermediateFileType::FromExtension(ext);
         if(type)
         {
            char fileName[MAX_FILENAME];
            GetLastDirectory(filePath, fileName);
            if(fileName[0])
            {
               DotMain dotMain = DotMain::FromFileName(fileName);
               for(prj : ide.workspace.projects)
               {
                  if((node = prj.FindNodeByObjectFileName(fileName, type, dotMain, null, objectFileExt)))
                  {
                     if(project)
                        *project = prj;
                     if(fullPath)
                     {
                        const char * cfgName = prj.config ? prj.config.name : "";
                        char name[MAX_FILENAME];
                        CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(prj.lastBuildCompilerName);
                        DirExpression objDir = prj.GetObjDir(compiler, prj.config, bitDepth);
                        strcpy(fullPath, prj.topNode.path);
                        PathCatSlash(fullPath, objDir.dir);
                        node.GetObjectFileName(name, prj.configsNameCollisions[cfgName], type, dotMain, objectFileExt);
                        PathCatSlash(fullPath, name);
                        delete objDir;
                        delete compiler;
                     }
                     break;
                  }
               }
            }
         }
      }
      return node;
   }

   OpenedFileInfo UpdateOpenedFileInfo(const char * fileName, OpenedFileState state, bool fileOpen)
   {
      bool insert = false;
      char absolutePath[MAX_LOCATION];
      char relativePath[MAX_LOCATION];
      OpenedFileInfo ofi;
      GetSlashPathBuffer(absolutePath, fileName);
      MakeRelativePath(relativePath, fileName);
      ofi = FindOpenedFileInfo(relativePath, absolutePath);
      if(fileOpen && ofi)
      {
         openedFiles.Remove(openedFiles.Find(ofi));
         insert = true;
      }
      if(state)
      {
         if(!ofi)
         {
            ofi = OpenedFileInfo { path = CopyString(relativePath) };
            insert = true;
         }
         ofi.state = state;
         ofi.modified = GetLocalTimeStamp();
         if(!holdTracking)
            modified = true;
      }
      else if(ofi)
      {
         Iterator<OpenedFileInfo> it { openedFiles };
         if(it.Find(ofi))
            openedFiles.Delete(it.pointer);
         if(!holdTracking)
            modified = true;
      }
      if(insert)
         openedFiles.Insert(null, ofi);
      return ofi;
   }

   void LoadOpenedFileInfo(const char * path, OpenedFileState state, int lineNumber, int position, Point scroll, TimeStamp modified, Array<String> openedFilesNotFound)
   {
      char absolutePath[MAX_LOCATION];
      char relativePath[MAX_LOCATION];
      TimeStamp stamp = modified;
      bool exists;
      strcpy(absolutePath, workspaceDir);
      PathCatSlash(absolutePath, path);
      MakeRelativePath(relativePath, absolutePath);
      if(!(exists = FileExists(absolutePath)))
         stamp -= 60*60*24*20; // Days { 20 };
      if(stamp > GetLocalTimeStamp() - 60*60*24*384) // Days { 384 });
      {
         if(state == closed || exists)
         {
            OpenedFileInfo ofi = FindOpenedFileInfo(relativePath, absolutePath);
            if(!ofi)
               openedFiles.Add(OpenedFileInfo { CopyString(relativePath), state, lineNumber, position, scroll, stamp });
            // else silently drop duplicates if they should ever occur;
         }
         else
            openedFilesNotFound.Add(CopyString(absolutePath));
      }
      // else silently discarding old or broken OpenedFileInfo entries;
   }

   void OpenPreviouslyOpenedFiles(bool noParsing)
   {
      Array<String> filePaths {};
      holdTracking = true;
      for(ofi : openedFiles; ofi.state != closed)
         filePaths.Add(CopyString(ofi.path));
      for(path : filePaths)
      {
         Window file;
         char absolutePath[MAX_LOCATION];
         strcpy(absolutePath, workspaceDir);
         PathCatSlash(absolutePath, path);
         file = ide.OpenFile(absolutePath, false, true, null, no, normal, noParsing);
         if(file)
         {
            for(prj : projects)
            {
               ProjectNode node = prj.topNode.FindByFullPath(absolutePath, true);
               if(node)
                  node.EnsureVisible();
            }
         }
      }
      holdTracking = false;
      filePaths.Free();
      delete filePaths;
   }

   OpenedFileInfo FindOpenedFileInfo(const char * relativePath, const char * absolutePath)
   {
      OpenedFileInfo result = null;
      for(e : openedFiles)
      {
         bool switchToRelative;
         if((switchToRelative = !fstrcmp(absolutePath, e.path)) || !fstrcmp(relativePath, e.path))
         {
            result = e;
            if(switchToRelative)
            {
               delete result.path;
               result.path = CopyString(relativePath);
            }
            break;
         }
      }
      return result;
   }

   void RestorePreviouslyOpenedFileState(CodeEditor editor)
   {
      if((editor.openedFileInfo = UpdateOpenedFileInfo(editor.fileName, opened, true)))
         editor.openedFileInfo.SetCodeEditorState(editor);
   }

   void UpdateSourceDirsArray(Array<String> dirs)
   {
      sourceDirs.Free();

      for(s : dirs)
         sourceDirs.Add(CopyString(s));

      DropInvalidBreakpoints(null);

      delete dirs;
   }

   void RemoveProject(Project project)
   {
      Iterator<AddedProjectInfo> it { addedProjects };
      while(it.Next())
      {
         if(it.data.project == project)
         {
            addedProjects.Remove(it.pointer);
            break;
         }
      }
      projects.TakeOut(project);

      DropInvalidBreakpoints(project);
      modified = true;
      ide.findInFilesDialog.RemoveProjectItem(project);
      ide.UpdateToolBarActiveConfigs(false);
      Save();

      delete project;
   }

   void SelectActiveConfig(const char * configName)
   {
      bool change = false;
      for(prj : ide.workspace.projects)
      {
         for(cfg : prj.configurations)
         {
            if(cfg.name && !strcmp(cfg.name, configName))
            {
               prj.config = cfg;
               change = true;
               break;
            }
         }
      }
      if(change)
      {
         modified = true;
         ide.UpdateToolBarActiveConfigs(true);
         ide.projectView.Update(null);
         Save();
      }
      ide.AdjustDebugMenus();
   }

   bool FindPath(ProjectNode node, const char * path)
   {
      if(node.type == file)
      {
         // TODO: Should this code be moved into a ProjectNode::absolutePath property? Taken from NodeProperties.ec
         char filePath[MAX_LOCATION];
         GetSlashPathBuffer(filePath, node.project.topNode.path);
         PathCatSlash(filePath, node.path);
         PathCatSlash(filePath, node.name);

         if(!fstrcmp(filePath, path))
            return true;
      }
      if(node.files)
      {
         for(n : node.files)
         {
            if(FindPath(n, path))
               return true;
         }
      }
      return false;
   }

   void ChangeBreakpoint(DataRow row, const char * location)
   {
      Breakpoint bp = (Breakpoint)(intptr)row.tag;
      if(bp)
      {
         char * currentLoc = bp.CopyUserLocationString();
         if(strcmp(location, currentLoc))
         {
            char * newLoc;
            bp.location = CopyString(location);
            bp.ParseLocation();
            delete bp.location;
            newLoc = bp.CopyUserLocationString();
            if(strcmp(newLoc, currentLoc))
            {
               ide.breakpointsView.UpdateBreakpoint(row);
               Save();
            }
         }
         delete currentLoc;
      }
      else if(location)
      {
         // adding a breakpoint by typing it in the breakpoints view
         // todo, parse location
         //  if good, make add breakpoint, make sure possibly previously entered ignore and level are reflected in breakpoint
         //  else
         //     ...
         //bp = Breakpoint { };
         //row.tag = (int64)bp;
         //breakpoints.Add(bp);
         //bp.row = row;
         Save();
      }
   }

   void ChangeBreakpointIgnore(DataRow row, int ignore)
   {
      Breakpoint bp = (Breakpoint)(intptr)row.tag;
      if(bp)
      {
         bp.ignore = ignore;
         Save();
      }
   }

   void ChangeBreakpointLevel(DataRow row, int level)
   {
      Breakpoint bp = (Breakpoint)(intptr)row.tag;
      if(bp)
      {
         bp.level = level;
         Save();
      }
   }

   void ChangeBreakpointCondition(DataRow row, const char * condition)
   {
      Breakpoint bp = (Breakpoint)(intptr)row.tag;
      if(bp && !(!bp.condition && !(condition && condition[0])))
      {
         if(!bp.condition)
         {
            bp.condition = Watch { };
            bp.condition.expression = CopyString(condition);
            Save();
         }
         else if(!(condition && condition[0]))
         {
            bp.condition.Free();
            bp.condition = null;
            Save();
         }
         else if(strcmp(condition, bp.condition.expression))
         {
            bp.condition.Free();
            bp.condition = Watch { };
            bp.condition.expression = CopyString(condition);
            Save();
         }
      }
   }

   void RemoveBreakpoint(Breakpoint bp)
   {
      bpCount--;
      ide.breakpointsView.RemoveBreakpoint(bp);
      ide.debugger.UpdateRemovedBreakpoint(bp);
      {
         Iterator<Breakpoint> it { breakpoints };
         if(it.Find(bp))
            breakpoints.Remove(it.pointer);
      }
      {
         Window document;
         for(document = ide.firstChild; document; document = document.next)
         {
            const char * fileName = document.fileName;
            if(document.isDocument && fileName && document.created)
            {
               char winFilePath[MAX_LOCATION];
               const char * slashPath = GetSlashPathBuffer(winFilePath, fileName);

               if(!fstrcmp(slashPath, bp.absoluteFilePath))
               {
                  CodeEditor codeEditor = (CodeEditor)document;
                  int boxH = codeEditor.editBox.clientSize.h;
                  Box box { 0, 0, 19, boxH - 1 };
                  document.Update(box);
                  break;
               }
            }
         }
      }
      Save();
      delete bp;
   }

   void ParseLoadedBreakpoints()
   {
      for(bp : breakpoints; bp.location)
      {
         bp.ParseLocation();
         delete bp.location;
         ide.breakpointsView.UpdateBreakpoint(bp.row);
      }
   }

   void DropInvalidBreakpoints(Project removedProject) // think about not dropping BPs that are past end of file but simply disable them
   {                                                   // why? when using a scm/vcs you might be alternating between two version of a file
      if(breakpoints)                                  // and anoyingly keep loosing breakpoints in the version of the file you are working on
      {
         Link bpLink, next;
         for(bpLink = breakpoints.first; bpLink; bpLink = next)
         {
            Breakpoint bp = (Breakpoint)(intptr)bpLink.data;
            next = bpLink.next;
            if(removedProject)
            {
               if(bp.project == removedProject)
               {
                  ide.breakpointsView.RemoveBreakpoint(bp);
                  RemoveBreakpoint(bp);
               }
            }
            else
            {
               Project project = bp.project;
               if(!project)
               {
                  for(p : projects)
                  {
                     if(FindPath(p.topNode, bp.absoluteFilePath))
                     {
                        project = p;
                        break;
                     }
                     // Handle symbol loader modules:
                     {
                        char moduleName[MAX_FILENAME];
                        char * sl;
                        GetLastDirectory(bp.absoluteFilePath, moduleName);
                        // Tweak for automatically resolving symbol loader modules
                        sl = strstr(moduleName, ".main.ec");
                        if(sl && (*sl = 0, !strcmpi(moduleName, p.name)))
                        {
                           project = p;
                           break;
                        }
                     }
                  }
               }
               if(!project)
               {
                  bool found = false;
                  for(dir : sourceDirs)
                  {
                     if(IsPathInsideOf(bp.absoluteFilePath, dir))
                     {
                        found = true;
                        break;
                     }
                  }
                  if(!found)
                  {
                     ide.breakpointsView.RemoveBreakpoint(bp);
                     RemoveBreakpoint(bp);
                  }
               }
            }
         }
         ide.breakpointsView.Update(null);
      }
   }

   char * getEnv(const char * name, CompilerConfig compiler, bool fallback)
   {
      for(e : environmentVars)
      {
         if(!strcmp(e.name, name))
            return e.string;
      }
      if(compiler)
      {
         for(e : compiler.environmentVars)
         {
            if(!strcmp(e.name, name))
               return e.string;
         }
      }
      if(fallback)
         return getenv(name);
      return (char *)"";
   }

   char * getEnvVarsString()
   {
      int len = 0;
      char * vars;
      char * d;
      for(e : environmentVars)
      {
         int l = strlen(e.string);
         if(l)
         {
            bool quoted = e.string[0] == '\"' && e.string[l - 1] == '\"';
            len += strlen(e.name) + l + (quoted ? 2 : 4);
         }
      }
      vars = new char[len + 1];
      d = vars;
      for(e : environmentVars)
      {
         int l = strlen(e.string);
         if(l)
         {
            bool quoted = e.string[0] == '\"' && e.string[l - 1] == '\"';
            if(quoted)
               sprintf(d, " %s=%s", e.name, e.string);
            else
               sprintf(d, " %s=\"%s\"", e.name, e.string);
            d += strlen(e.name) + l + (quoted ? 2 : 4);
         }
      }
      *d = '\0';
#if defined(__WIN32__)
      ChangeCh(vars, '\\', '/');
#endif
      return vars;
   }

   void Init()
   {
      if(!addedProjects) addedProjects = { };
      if(!sourceDirs) sourceDirs = { };
      if(!environmentVars) environmentVars = { };
      if(!breakpoints) breakpoints = { };
      if(!watches) watches = { };
      if(!openedFiles) openedFiles = { };
      if(!recentFiles) recentFiles = { };
      if(!guiConfigData) guiConfigData = { };
   }

   void Free()
   {
      delete name;
      delete workspaceFile;
      delete workspaceDir;
      delete commandLineArgs;
      delete debugDir;
      delete activeCompiler;

      //project = null;

      if(addedProjects) { addedProjects.Free(); delete addedProjects; }
      if(sourceDirs) { sourceDirs.Free(); delete sourceDirs; }
      if(environmentVars) { environmentVars.Free(); delete environmentVars; }
      if(breakpoints) { breakpoints.Free(); delete breakpoints; }
      if(watches) { watches.Free(); delete watches; }
      if(openedFiles) { openedFiles.Free(); delete openedFiles; }
      if(recentFiles) { recentFiles.Free(); delete recentFiles; }
      delete guiConfigData;

      projects.Free();
   }

   Workspace()
   {
      ide.outputView.buildClear();
      ide.outputView.debugBox.Clear();
      ide.callStackView.Clear();
      ide.watchesView.Clear();
      ide.threadsView.Clear();
      ide.breakpointsView.Clear();

      property::debugDir = "";

      SetSourceDirs(sourceDirs);
   }

   ~Workspace()
   {
      Save();
      timer.Stop();

      SetSourceDirs(null);
      Free();
   }
}

Workspace LoadWorkspace(const char * filePath, const char * fromProjectFile)
{
   File f;
   Workspace workspace = null;

   ideMainFrame.holdGuiConfigDataSaving();

   f = FileOpen(filePath, read);
   if(f)
   {
      Array<String> openedFilesNotFound { };
      JSONResult result;
      WorkspaceFile wf = null;
      {
         ECONParser parser { f = f };
         f.Seek(0, start);
         result = parser.GetObject(class(WorkspaceFile), &wf);
         if(result != success)
            delete wf;
         delete parser;
      }
      if(!wf)
         workspace = LoadLegacyWorkspace(filePath, openedFilesNotFound);
      else if(wf.workspace)
      {
         workspace = wf.workspace;
         //incref workspace;
         workspace.workspaceFile = filePath;
         {
            char absolutePath[MAX_LOCATION];
            bool done = false;
            bool ahead = false;
            Iterator<AddedProjectInfo> it { workspace.addedProjects };
            while(!done && (ahead || !(done = !it.Next())))
            {
               // TODO: implement some type of time based pruning of "dea" added projects instead of just dropping them on the spot
               //         TimeStamp modified; modified = GetLocalTimeStamp();
               //               TimeStamp stamp = modified; if(stamp > GetLocalTimeStamp() - 60*60*24*20) // Days { 20 });
               AddedProjectInfo addedPrj = it.data;
               strcpy(absolutePath, workspace.workspaceDir);
               PathCatSlash(absolutePath, addedPrj.path);
               if(FileExists(absolutePath))
               {
                  Project loadedProject = LoadProject(absolutePath, null);
                  if(loadedProject)
                  {
                     workspace.AddProject(loadedProject, addedPrj);
                     loadedProject.StartMonitoring();
                  }
                  else if(workspace.projects.count == 0)
                  {
                     delete workspace;
                     break;
                  }
                  else
                  {
                     // TODO: (#524) show message or something when added project fails to load;
                  }
                  ahead = false;
               }
               else
               {
                  IteratorPointer notFound = it.pointer;
                  done = !it.Next();
                  workspace.addedProjects.Delete(notFound);
                  ahead = true;
               }
            }
            if(workspace)
            {
               for(bp : workspace.breakpoints)
               {
                  char * path = workspace.CopyAbsolutePathFromRelative(bp.relativeFilePath);
                  bp.type = user;
                  if(path)
                  {
                     bp.absoluteFilePath = path;
                     delete path;
                  }
                  else
                     bp.absoluteFilePath = "";
               }
               if(workspace.openedFiles && workspace.openedFiles.count)
               {
                  List<OpenedFileInfo> openedFiles = workspace.openedFiles;
                  workspace.openedFiles = { };
                  for(of : openedFiles)
                  {
                     workspace.LoadOpenedFileInfo(of.path, of.state, of.lineNumber, of.position, of.scroll, of.modified, openedFilesNotFound);
                  }
                  openedFiles.Free();
                  delete openedFiles;
               }
            }
         }
      }

      if(workspace)
      {
         if(!workspace.recentFiles || !workspace.recentFiles.count)
         {
            int c;
            if(!workspace.recentFiles) workspace.recentFiles = { };
            if(workspace.openedFiles && workspace.openedFiles.count)
            {
               for(c = workspace.openedFiles.count - 1; c >= 0; c--)
               {
                  char path[MAX_LOCATION];
                  strcpy(path, workspace.workspaceDir);
                  PathCatSlash(path, workspace.openedFiles[c].path);
                  workspace.recentFiles.addRecent(path);
               }
            }
         }
         if(workspace.guiConfigData)
            workspace.guiConfigData.applyWindowConfig(((GuiDataSavingController)ideMainFrame.controller).name, ideMainFrame);
         workspace.Init();
         if(!workspace.projects.first)
         {
            Project project;
            if(fromProjectFile)
               project = LoadProject(fromProjectFile /*projectFilePath*/, null);
            else
            {
               char projectFilePath[MAX_LOCATION];
               strcpy(projectFilePath, workspace.workspaceFile);
               ChangeExtension(projectFilePath, ProjectExtension, projectFilePath);
               project = LoadProject(projectFilePath, null);
            }
            if(project)
            {
               project.StartMonitoring();
               workspace.AddProject(project, null);
               workspace.name = CopyString(project.name);
            }
            else
            {
               MessageBox { type = ok, master = ide, contents = $"Workspace load file failed", text = $"Workspace Load File Error" }.Modal();
               delete workspace;
               ideMainFrame.resumeGuiConfigDataSaving();
               return null;
            }
         }

         if(openedFilesNotFound.count)
         {
            int c = 0;
            char s[2] = "";
            String files = new char[MAX_LOCATION * 16];
            char title[512];
            String msg = new char[MAX_LOCATION * 16 + 2048];
            strcpy(files,"\n");

            if(openedFilesNotFound.count > 1)
               strcpy(s, "s");

            for(item : openedFilesNotFound)
            {
               c++;
               if(c == 16)
               {
                  strcat(files, "\n...");
                  break;
               }
               strcat(files, "\n");
               strcat(files, item);
            }

            sprintf(title, $"File%s not found", s);
            sprintf(msg, $"The following file%s could not be re-opened.%s", s, files);

            MessageBox { type = ok, master = ide, contents = msg, text = title }.Modal();

            delete files;
            delete msg;
         }
      }
      openedFilesNotFound.Free();
      delete openedFilesNotFound;
      delete wf;
      delete f;
   }
   else if(fromProjectFile)
   {
      //MessageBox { type = Ok, master = ide, contents = "Worspace load file failed", text = "Worspace Load File Error" }.Modal();

      //char projectFile[MAX_LOCATION];
      Project newProject;

      //strcpy(projectFile, filePath);
      //ChangeExtension(projectFile, ProjectExtension, projectFile);
      newProject = LoadProject(fromProjectFile /*projectFile*/, null);

      if(newProject)
      {
         newProject.StartMonitoring();
         workspace = Workspace { property::workspaceFile = filePath };

         workspace.Init();
         workspace.AddProject(newProject, null);
         workspace.Save();
      }
   }

   if(workspace)
   {
      ide.ChangeFileDialogsDirectory(workspace.workspaceDir, false);

      if(!workspace.activeCompiler || !workspace.activeCompiler[0])
         workspace.activeCompiler = defaultCompilerName;
   }

   ideMainFrame.resumeGuiConfigDataSaving();

   return workspace;
}

Workspace LoadLegacyWorkspace(const char * filePath, Array<String> openedFilesNotFound)
{
   File file;
   Workspace workspace = null;

   file = FileOpen(filePath, read);
   if(file)
   {
      double version = 0;
      char section[128];
      char subSection[128];

      workspace = Workspace { activeCompiler = ideSettings.defaultCompiler, property::workspaceFile = filePath };
      workspace.Init();

      file.Seek(0, start);
      while(!file.Eof())
      {
         char buffer[65536];
         char * equal;

         Watch wh;
         Breakpoint bp = null;

         file.GetLine(buffer, 65536 - 1);
         TrimLSpaces(buffer, buffer);
         TrimRSpaces(buffer, buffer);
         if(strlen(buffer))
         {
            if(buffer[0] == '~')
            {
               equal = &buffer[0];
               equal[0] = ' ';
               TrimLSpaces(equal, equal);
               if(!strcmpi(section, "Debugger Data") && !strcmpi(subSection, "Watches"))
               {
                  wh = Watch { };
                  if(!workspace.watches) workspace.watches = { };
                  workspace.watches.Add(wh);
                  wh.expression = CopyString(equal);
               }
               else if(!strcmpi(section, "Debugger Data") && !strcmpi(subSection, "Breakpoints"))
               {
                  if(bp)
                  {
                     wh = Watch { };
                     wh.expression = CopyString(equal);
                     bp.condition = wh;
                  }
               }
               else if(!strcmpi(section, "Execution Data") && !strcmpi(subSection, "Environment Variables"))
               {
                  String value = strchr(equal, '=');
                  if(value)
                  {
                     *value = 0;
                     value++;
                     TrimRSpaces(equal, equal);
                     TrimLSpaces(value, value);
                     workspace.environmentVars.Add({ equal, value });
                  }
               }
            }
            else if(buffer[0] == '*')
            {
               equal = &buffer[0];
               equal[0] = ' ';
               TrimLSpaces(equal, equal);
               if(!strcmpi(section, "Debugger Data") && !strcmpi(subSection, "Breakpoints"))
               {
                  char * strEnabled = null;
                  char * strIgnore = null;
                  char * strLevel = null;
                  char * strLine = null;
                  char * strFile = null;

                  strEnabled = equal;
                  if(strEnabled && strEnabled[0])
                  {
                     strIgnore = strstr(strEnabled, ",");
                     strIgnore[0] = '\0';
                     strIgnore++;
                  }
                  if(strIgnore && strIgnore[0])
                  {
                     strLevel = strstr(strIgnore, ",");
                     strLevel[0] = '\0';
                     strLevel++;
                  }
                  if(strLevel && strLevel[0])
                  {
                     strLine = strstr(strLevel, ",");
                     strLine[0] = '\0';
                     strLine++;
                  }
                  if(strLine && strLine[0])
                  {
                     strFile = strstr(strLine, ",");
                     strFile[0] = '\0';
                     strFile++;
                  }
                  if(strEnabled && strEnabled[0] && strIgnore && strIgnore[0] &&
                        strLevel && strLevel[0] && strLine && strLine[0] && strFile && strFile[0])
                  {
                     bool enabled;
                     int ignore;
                     int level;
                     int line;

                     TrimLSpaces(strEnabled, strEnabled);
                     TrimRSpaces(strEnabled, strEnabled);
                     TrimLSpaces(strIgnore, strIgnore);
                     TrimRSpaces(strIgnore, strIgnore);
                     TrimLSpaces(strLevel, strLevel);
                     TrimRSpaces(strLevel, strLevel);
                     TrimLSpaces(strLevel, strLevel);
                     TrimRSpaces(strLevel, strLevel);
                     TrimLSpaces(strFile, strFile);
                     TrimRSpaces(strFile, strFile);

                     enabled = (strEnabled[0] == '1');
                     ignore = atoi(strIgnore);
                     level = atoi(strLevel);
                     line = atoi(strLine);

                     bp = { type = user, enabled = enabled, ignore = ignore, level = level, line = line };
                     if(!workspace.breakpoints)
                        workspace.breakpoints = { };
                     workspace.breakpoints.Add(bp);
                     bp.location = CopyString(strFile);
                  }
               }
            }
            else if(buffer[0] == '=' || buffer[0] == '-')
            {
               equal = &buffer[0];
               equal[0] = ' ';
               TrimLSpaces(equal, equal);
               if(!strcmpi(section, "Debugger Data") && !strcmpi(subSection, "Source Directories"))
                  workspace.sourceDirs.Add(CopyString(equal));
               else if(!strcmpi(section, "Opened Files"))
               {
                  OpenedFileState state = opened;
                  int lineNumber = 0;
                  int position = 0;
                  Point scroll { };
                  if(version == 0.01)
                  {
                     char * comma = strchr(equal, ',');
                     if(comma)
                     {
                        comma[0] = '\0';
                        lineNumber = atoi(equal);
                        equal = comma + 1;
                     }
                  }
                  else if(version >= 0.02)
                  {
                     char * column = strchr(equal, ':');
                     if(column)
                     {
                        column[0] = '\0';
                        if(strcmpi(equal, "O"))
                           state = closed;
                        column++;
                        equal = column;
                        column = strchr(equal, ':');
                        if(column)
                        {
                           column[0] = '\0';
                           lineNumber = atoi(equal);
                           column++;
                           equal = column;
                           column = strchr(equal, ':');
                           if(column)
                           {
                              column[0] = '\0';
                              position = atoi(equal);
                              column++;
                              equal = column;
                              column = strchr(equal, ':');
                              if(column)
                              {
                                 column[0] = '\0';
                                 scroll.x = atoi(equal);
                                 column++;
                                 equal = column;
                                 column = strchr(equal, ':');
                                 if(column)
                                 {
                                    column[0] = '\0';
                                    scroll.y = atoi(equal);
                                    column++;
                                    equal = column;
                                 }
                              }
                           }
                        }
                     }
                  }
                  workspace.LoadOpenedFileInfo(equal, state, lineNumber, position, scroll, GetLocalTimeStamp(), openedFilesNotFound);
               }
               else if(!strcmpi(section, "Projects"))
               {
                  char projectFilePath[MAX_LOCATION];
                  Project newProject;
                  strcpy(projectFilePath, workspace.workspaceDir);
                  PathCatSlash(projectFilePath, equal);
                  newProject = LoadProject(projectFilePath, null);
                  if(newProject)
                  {
                     workspace.AddProject(newProject, null);
                     newProject.StartMonitoring();
                  }
                  else if(workspace.projects.count == 0)
                  {
                     delete workspace;
                     break;
                  }
                  else
                  {
                     // TODO: (#524) show message or something when added project fails to load;
                  }
               }
            }
            else if(!strcmpi(buffer, "ECERE Workspace File"));
            else if(!strcmpi(buffer, "Version 0a"))
               version = 0;
            else if(!strncmp(buffer, "Version ", 8))
               version = atof(&buffer[8]);
            else if(!strcmpi(buffer, "Workspace"))
               strcpy(section, buffer);
            else if(!strcmpi(buffer, "Projects"))
               strcpy(section, buffer);
            else if(!strcmpi(buffer, "Execution Data"))
               strcpy(section, buffer);
            else if(!strcmpi(buffer, "Debugger Data"))
               strcpy(section, buffer);
            else if(!strcmpi(buffer, "Source Directories"))
               strcpy(subSection, buffer);
            else if(!strcmpi(buffer, "Breakpoints"))
               strcpy(subSection, buffer);
            else if(!strcmpi(buffer, "Watches"))
               strcpy(subSection, buffer);
            else if(!strcmpi(buffer, "Environment Variables"))
               strcpy(subSection, buffer);
            else if(!strcmpi(buffer, "Opened Files"))
            {
               strcpy(section, buffer);
               if(!workspace.openedFiles) workspace.openedFiles = { };
            }
            else if(!strcmpi(buffer, ""))      // | These two lines were commented out
               strcpy(subSection, buffer);     // | Do they serve a purpose? They were there for copy paste when adding a new subsection
            else
            {
               equal = strstr(buffer, "=");
               if(equal)
               {
                  if(!strcmpi(section, "Workspace"))
                  {
                     equal[0] = '\0';
                     TrimRSpaces(buffer, buffer);
                     equal++;
                     TrimLSpaces(equal, equal);
                     if(!strcmpi(buffer, "Active Compiler"))
                     {
                        CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(equal);
                        if(!compiler)
                           workspace.activeCompiler = defaultCompilerName;
                        else
                           workspace.activeCompiler = equal;
                        delete compiler;
                     }
                     if(!strcmpi(buffer, "Active Bit Depth"))
                     {
                        int bitDepth = atoi(equal);
                        if(!(bitDepth == 32 || bitDepth == 64))
                           bitDepth = 0;
                        workspace.bitDepth = bitDepth;
                        ide.toolBar.activeBitDepth.SelectRow(ide.toolBar.activeBitDepth.FindRow(bitDepth));
                     }
                  }
                  else if(!strcmpi(section, "Execution Data"))
                  {
                     equal[0] = '\0';
                     TrimRSpaces(buffer, buffer);
                     equal++;
                     TrimLSpaces(equal, equal);
                     if(!strcmpi(buffer, "Command Line Arguments"))
                        workspace.commandLineArgs = equal;

                     if(!strcmpi(buffer, "Environment Variables"))
                     {
                        workspace.environmentVars.Free();
                        delete workspace.environmentVars;
                        workspace.environmentVars = { };
                     }

                  }
                  else if(!strcmpi(section, "Debugger Data"))
                  {
                     equal[0] = '\0';
                     TrimRSpaces(buffer, buffer);
                     equal++;
                     TrimLSpaces(equal, equal);
                     if(!strcmpi(buffer, "Debug Working Directory"))
                        workspace.debugDir = equal;
                  }
                  else
                  {
                     equal[0] = '\0';
                     TrimRSpaces(buffer, buffer);
                     equal++;
                     TrimLSpaces(equal, equal);
                     if(!strcmpi(buffer, "Active Configuration"))
                     {
                        Project prj;
                        if(workspace.projects.last)
                        {
                           prj = workspace.projects.lastIterator.data;
                           for(cfg : prj.configurations)
                           {
                              if(!strcmp(cfg.name, equal))
                              {
                                 prj.config = cfg;
                                 break;
                              }
                           }
                        }
                     }
                     else if(!strcmpi(buffer, "Modified Compiler Config") || !strcmpi(buffer, "Modified Linker Config"))
                     {
                        Project prj;
                        if(workspace.projects.last)
                        {
                           prj = workspace.projects.lastIterator.data;
                           for(cfg : prj.configurations)
                           {
                              if(!strcmp(cfg.name, equal))
                              {
                                 if(strstr(buffer, "Compiler"))
                                    cfg.compilingModified = true;
                                 else
                                    cfg.linkingModified = true;
                                 break;
                              }
                           }
                        }
                     }
                     else if(!strcmpi(buffer, "CommandLineArgs"))
                        workspace.commandLineArgs = equal;
                     else if(!strcmpi(buffer, "Breakpoint"))
                     {
                        bool enabled;
                        char * lineNum = strstr(equal, ",");
                        if(lineNum)
                        {
                           lineNum[0] = '\0';
                           lineNum++;
                           if(equal[0] == '0')
                              enabled = false;
                           else
                              enabled = true;
                           if(lineNum)
                           {
                              char * absPath = strstr(lineNum, ",");
                              if(absPath)
                              {
                                 absPath[0] = '\0';
                                 absPath++;
                                 if(absPath)
                                 {
                                    char * relPath = strstr(absPath, ",");
                                    if(relPath)
                                    {
                                       relPath[0] = '\0';
                                       relPath++;
                                       if(relPath)
                                       {
                                          bp = { type = user, enabled = enabled, level = -1 };
                                          workspace.breakpoints.Add(bp);
                                          bp.line = atoi(lineNum);
                                          bp.location = relPath;
                                       }
                                    }
                                 }
                              }
                           }
                        }
                     }
                     else if(!strcmpi(buffer, "Watch"))
                     {
                        wh = Watch { };
                        workspace.watches.Add(wh);
                        wh.expression = CopyString(equal);
                     }
                     else if(!strcmpi(buffer, "SourceDir"))
                     {
                        workspace.sourceDirs.Add(CopyString(equal));
                     }
                     else if(!strcmpi(buffer, "DebugDir"))
                     {
                        workspace.debugDir = equal;
                     }
                  }
               }
            }
         }
      }
      delete file;
   }
   return workspace;
}

TimeStamp GetLocalTimeStamp()
{
   TimeStamp now;
   DateTime time { };
   time.GetLocalTime();
   now = time;
   return now;
}
