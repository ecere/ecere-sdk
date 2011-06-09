import "ide"

//bool eString_PathInsideOf(char * path, char * of);

static void ParseListValue(List<String> list, char * equal)
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
      list.Add(CopyString(start));
      if(comma)
         comma++;
      if(comma)
         comma++;
      start = comma;
   }
   delete string;
}

enum OpenedFileState { unknown, opened, closed };

class OpenedFileInfo
{
   class_no_expansion;
//public:
//   class_fixed
   char * path;
   OpenedFileState state;
   int lineNumber, position;
   Point scroll;
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
         if(it.Find(this) && it.pointer != files.GetLast())
         {
            files.Move(it.pointer, files.GetPrev(files.GetLast()));
            ide.workspace.modified = true;
         } 
      }
   }
};

class Workspace
{
public:
   char * name;
   char * workspaceFile;
   char * workspaceDir;
   char * commandLineArgs;
   property char * commandLineArgs { set { delete commandLineArgs; if(value) commandLineArgs = CopyString(value); } }
   char * debugDir;
   property char * debugDir { set { delete debugDir; if(value) debugDir = CopyString(value); } }

   int bpCount;

   property char * compiler
   {
      set { delete compiler; if(value && value[0]) compiler = CopyString(value); }
      get { return compiler && compiler[0] ? compiler : null; }
   }

   List<String> sourceDirs { };
   Array<NamedString> environmentVars { };
   List<Breakpoint> breakpoints { };
   List<Watch> watches { };
   List<OpenedFileInfo> openedFiles { };
   List<Project> projects { };

   //Project project;

   bool modified;
   bool holdTracking;

   Timer timer
   {
      userData = this, delay = 2.5;
      bool DelayExpired()
      {
         if(modified)
            Save();
         return true;
      }
   };

   property char * workspaceFile
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

   property char * projectDir
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

private:
   String compiler;

public:
   void Save()
   {
      bool bkpts = false;
      File file;
      
      file = FileOpen(workspaceFile, write);
      if(file)
      {
         /*
         for(bp : breakpoints)
         {
            if(bp.type == user)
            {
               if(bp.enabled)
                  file.Printf("Breakpoint=1,%d,%s,%s\n", bp.line, bp.absoluteFilePath, bp.relativeFilePath);
               else
                  file.Printf("Breakpoint=0,%d,%s,%s\n", bp.line, bp.absoluteFilePath, bp.relativeFilePath);
            }
         }
         
         for(wh : watches)
            file.Printf("Watch=%s\n", wh.expression);
         
         for(dir : sourceDirs)
            file.Printf("SourceDir=%s\n", dir);

         if(debugDir && debugDir[0])
            file.Printf("DebugDir=%s\n", debugDir);
         
         if(commandLineArgs && commandLineArgs[0])
            file.Printf("CommandLineArgs=%s\n", commandLineArgs);
         */

         /*
         char indentation[128*3];
         char path[MAX_LOCATION];
         */
         file.Printf("\nECERE Workspace File\n");
         file.Printf("\nVersion 0.02\n");
         file.Printf("\nWorkspace\n");
         file.Printf("\n   Active Compiler = %s\n", compiler ? compiler : defaultCompilerName);
         
         if(projects.first)
         {
            file.Printf("\n   Projects\n\n");
            for(prj : projects)
            {
               char location[MAX_LOCATION];
               MakePathRelative(prj.topNode.path, workspaceDir, location);
               MakeSlashPath(location);
               PathCatSlash(location, prj.topNode.name);
               //strcat(location, ".epj");

               file.Printf("    %s %s\n", "-", location);
               
               if(prj.config)
                  file.Printf("         Active Configuration = %s\n", prj.config.name);
               for(cfg : prj.configurations)
               {
                  if(cfg.compilingModified)
                     file.Printf("         Modified Compiler Config = %s\n", cfg.name);
                  else if(cfg.linkingModified)
                     file.Printf("         Modified Linker Config = %s\n", cfg.name);
               }
            }
         }
         
         file.Printf("\n   Execution Data\n");
         if(commandLineArgs && commandLineArgs[0])
            file.Printf("\n      Command Line Arguments = %s\n", commandLineArgs);

         file.Printf("\n   Debugger Data\n");
         if(debugDir && debugDir[0])
            file.Printf("\n      Debug Working Directory = %s\n", debugDir);
         if(sourceDirs.count)
         {
            file.Printf("\n      Source Directories\n");
            for(dir : sourceDirs)
               file.Printf("       = %s\n", dir);
         }

         for(bp : breakpoints)
         {
            if(bp.type == user)
            {
               if(!bkpts)
               {
                  bkpts = true;
                  file.Printf("\n   Breakpoints\n\n");
               }
               bp.Save(file);
            }
         }

         if(watches.count)
         {
            file.Printf("\n   Watches\n\n");
            for(wh : watches)
               wh.Save(file);
         }

         if(openedFiles.count)
         {
            file.Printf("\n   Opened Files\n\n");
            for(ofi : openedFiles)
            {
               char * location;
               char chr[2];
               char relativePath[MAX_LOCATION];
               if(eString_PathInsideOf(ofi.path, workspaceDir))
               {
                  MakePathRelative(ofi.path, workspaceDir, relativePath);
                  MakeSlashPath(relativePath);
                  location = relativePath;
               }
               else
                  location = ofi.path;
               strcpy(chr, "=");

               file.Printf("    %s %s:%d:%d:%d:%d:%s\n", chr, ofi.state == closed ? "C" : "O", ofi.lineNumber, ofi.position, ofi.scroll.x, ofi.scroll.y, location);
            }
         }

         modified = false;
         delete file;
      }
   }

   char * GetAbsolutePathFromRelative(char * relative)
   {
      char name[MAX_LOCATION];
      char absolute[MAX_LOCATION];
      Project prj = null;

      GetLastDirectory(relative, name);
      for(p : projects)
      {
         if(p.topNode.Find(name, false))
         {
            prj = p;
            break;
         }
      }
      if(prj)
      {
         strcpy(absolute, prj.topNode.path);
         PathCatSlash(absolute, relative);
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

   char * GetPathWorkspaceRelativeOrAbsolute(char * path)
   {
      if(eString_PathInsideOf(path, workspaceDir))
      {
         char relativePath[MAX_LOCATION];
         MakePathRelative(path, workspaceDir, relativePath);
         return CopyUnixPath(relativePath);
      }
      else
         return CopyUnixPath(path);
   }

   OpenedFileInfo UpdateOpenedFileInfo(char * fileName, OpenedFileState state)
   {
      char filePath[MAX_LOCATION];
      OpenedFileInfo ofi = null;
      GetSlashPathBuffer(filePath, fileName);
      for(item : openedFiles)
      {
         if(!fstrcmp(item.path, filePath))
         {
            ofi = item;
            break;
         }
      }
      if(state)
      {
         if(!ofi)
         {
            ofi = OpenedFileInfo { path = CopyString(filePath) };
            openedFiles.Add(ofi);
         }
         ofi.state = state;
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
      return ofi;
   }

   void UpdateSourceDirsArray(Array<String> dirs)
   {
      byte * tokens[256];
      int c, numTokens;

      sourceDirs.Free();
      
      for(s : dirs)
         sourceDirs.Add(CopyString(s));
      
      DropInvalidBreakpoints();

      delete dirs;
   }
   
   void RemoveProject(Project project)
   {
      Iterator<Project> it { projects };
      if(it.Find(project))
         it.Remove();

      DropInvalidBreakpoints();
      modified = true;
      ide.findInFilesDialog.RemoveProjectItem(project);
      Save();

      delete project;
   }

   bool FindPath(ProjectNode node, char * path)
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

   void ChangeBreakpoint(DataRow row, char * location)
   {
      Breakpoint bp = (Breakpoint)row.tag;
      if(bp)
      {
         char * currentLoc = bp.LocationToString();
         if(strcmp(location, currentLoc))
         {
            // todo, parse location
            //  if good, make changes to breakpoint, according to execution state delete and place breakpoint
            ide.breakpointsView.UpdateBreakpoint(row); // this is the else
            //Save();
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
         //row.tag = (int)bp;
         //breakpoints.Add(bp);
         //bp.row = row;
         Save();
      }
   }

   void ChangeBreakpointIgnore(DataRow row, int ignore)
   {
      Breakpoint bp = (Breakpoint)row.tag;
      if(bp)
      {
         bp.ignore = ignore;
         Save();
      }
   }

   void ChangeBreakpointLevel(DataRow row, int level)
   {
      Breakpoint bp = (Breakpoint)row.tag;
      if(bp)
      {
         bp.level = level;
         Save();
      }
   }

   void ChangeBreakpointCondition(DataRow row, char * condition)
   {
      Breakpoint bp = (Breakpoint)row.tag;
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
            char * fileName = document.fileName;
            if(document.isDocument && fileName && document.created)
            {
               char winFilePath[MAX_LOCATION];
               char * slashPath = GetSlashPathBuffer(winFilePath, fileName);

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

   void DropInvalidBreakpoints()
   {
      Link bpLink, next;
      for(bpLink = breakpoints.first; bpLink; bpLink = next)
      {
         Breakpoint bp = (Breakpoint)bpLink.data;
         next = bpLink.next;

         if(bp.type == user)
         {
            Project project = null;
            for(p : projects)
            {
               if(FindPath(p.topNode, bp.absoluteFilePath))
               {
                  project = p;
                  break;
               }
            }
            if(!project)
            {
               bool found = false;
               for(dir : sourceDirs)
               {
                  if(eString_PathInsideOf(bp.absoluteFilePath, dir))
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

   void Free()
   {
      delete workspaceFile;
      delete workspaceDir;
      delete commandLineArgs;
      delete debugDir;
      
      //project = null;

      projects.Free();
      breakpoints.Free();
      watches.Free();
   }

   Workspace()
   {
      ide.outputView.buildBox.Clear();
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

      sourceDirs.Free();
      environmentVars.Free();
      SetSourceDirs(null);
      Free();
      openedFiles.Free();
      delete compiler;
   }

}

Workspace LoadWorkspace(char * filePath, char * fromProjectFile)
{
   File file;
   Workspace workspace = null;

   file = FileOpen(filePath, read);
   if(file)
   {
      OldList openedFilesNotFound { };

      workspace = Workspace { compiler = ideSettings.defaultCompiler, workspaceFile = filePath };

      file.Seek(0, start);
      while(!file.Eof())
      {
         char buffer[65536];
         char section[128];
         char subSection[128];
         //char version[16];
         float version;
         char * equal;
         int len;
         
         Watch wh;
         Breakpoint bp;
         
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
                     workspace.breakpoints.Add(bp);
                     bp.relativeFilePath = CopyString(strFile);
                     bp.absoluteFilePath = workspace.GetAbsolutePathFromRelative(strFile);
                     if(!bp.absoluteFilePath)
                        bp.absoluteFilePath = CopyString("");
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
                  char absolutePath[MAX_LOCATION];
                  strcpy(absolutePath, workspace.workspaceDir);
                  if(version == 0.01f)
                  {
                     char * comma = strchr(equal, ',');
                     if(comma)
                     {
                        comma[0] = '\0';
                        lineNumber = atoi(equal);
                        equal = comma + 1;
                     }
                  }
                  else if(version >= 0.02f)
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
                  PathCatSlash(absolutePath, equal);
                     
                  if(state == closed || FileExists(absolutePath))
                     workspace.openedFiles.Add(OpenedFileInfo { path = CopyString(absolutePath), state = state, lineNumber = lineNumber, position = position, scroll = scroll });
                  else
                     openedFilesNotFound.Add(NamedItem { name = CopyString(equal) });
               }
               else if(!strcmpi(section, "Projects"))
               {
                  char projectFilePath[MAX_LOCATION];
                  Project newProject;
                  strcpy(projectFilePath, workspace.workspaceDir);
                  PathCatSlash(projectFilePath, equal);
                  newProject = LoadProject(projectFilePath);
                  if(newProject)
                     workspace.projects.Add(newProject);
                  else if(workspace.projects.count == 0)
                  {
                     delete workspace;
                     break;
                  }
                  else
                  {
                     // TODO: show message or something when added project fails to load
                     // http://ecere.com/mantis/view.php?id=524
                  }
               }
            }
            else if(!strcmpi(buffer, "ECERE Workspace File"));
            else if(!strcmpi(buffer, "Version 0a"))
               version = 0.0f;
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
            else if(!strcmpi(buffer, "Opened Files"))
               strcpy(section, buffer);
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
                        CompilerConfig compiler = ideSettings.GetCompilerConfig(equal);
                        if(!compiler)
                           workspace.compiler = defaultCompilerName;
                        else
                           workspace.compiler = equal;
                        delete compiler;
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
                                          bp.relativeFilePath = CopyString(relPath);
                                          bp.absoluteFilePath = workspace.GetAbsolutePathFromRelative(relPath);
                                          if(!bp.absoluteFilePath)
                                             bp.absoluteFilePath = CopyString("");
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

      if(workspace)
      {
         if(!workspace.projects.first)
         {
            Project project;
            if(fromProjectFile)
               project = LoadProject(fromProjectFile /*projectFilePath*/);
            else
            {
               char projectFilePath[MAX_LOCATION];
               strcpy(projectFilePath, workspace.workspaceFile);
               ChangeExtension(projectFilePath, ProjectExtension, projectFilePath);
               project = LoadProject(projectFilePath);
            }
            if(project)
            {
               workspace.projects.Add(project);
               workspace.name = CopyString(project.name);
            }
            else
            {
               MessageBox { type = ok, master = ide, contents = "Workspace load file failed", text = "Workspace Load File Error" }.Modal();
               delete workspace;
               return null;
            }
         }

         if(openedFilesNotFound.first)
         {
            int c = 0;
            char s[2] = "";
            char files[MAX_LOCATION * 16] = "\n";
            char title[512];
            char msg[MAX_LOCATION * 16 + 2048];

            NamedItem item;

            item = openedFilesNotFound.first;
            if(item.next)
               strcpy(s, "s");
            
            for(item = openedFilesNotFound.first; item; item = item.next)
            {
               c++;
               if(c == 16)
               {
                  strcat(files, "\n...");
                  break;
               }
               strcat(files, "\n");
               strcat(files, item.name);
            }

            sprintf(title, "File%s not found", s);
            sprintf(msg, "The following file%s could not be re-opened.%s", s, files);
            
            MessageBox { type = ok, master = ide, contents = msg, text = title }.Modal();
         }
         openedFilesNotFound.Free(OldLink::Free);
      }
      else
         openedFilesNotFound.Free(OldLink::Free);
   }
   else if(fromProjectFile)
   {
      //MessageBox { type = Ok, master = ide, contents = "Worspace load file failed", text = "Worspace Load File Error" }.Modal();
      
      char projectFile[MAX_LOCATION];
      Project newProject;
      
      //strcpy(projectFile, filePath);
      //ChangeExtension(projectFile, ProjectExtension, projectFile);
      newProject = LoadProject(fromProjectFile /*projectFile*/);

      if(newProject)
      {
         workspace = Workspace { workspaceFile = filePath };

         workspace.projects.Add(newProject);
         workspace.Save();
      }
   }
   
   if(workspace)
   {
      ide.ChangeFileDialogsDirectory(workspace.workspaceDir, false);

      if(!workspace.compiler || !workspace.compiler[0])
         workspace.compiler = defaultCompilerName;
   }

   return workspace;
}
