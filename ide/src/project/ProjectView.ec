import "ide"

import "FileSystemIterator"

class ImportFolderFSI : NormalFileSystemIterator
{
   ProjectView projectView;
   Array<ProjectNode> stack { };

   bool OnFolder(char * folderPath)
   {
      char name[MAX_LOCATION];
      ProjectNode parentNode = stack.lastIterator.data;
      ProjectNode folder;
      GetLastDirectory(folderPath, name);
      folder = parentNode.FindSpecial(name, false, true, true);
      if(!folder)
         folder = projectView.NewFolder(parentNode, name, false);
      stack.Add(folder);
      return true;
   }

   void OutFolder(char * folderPath, bool isRoot)
   {
      stack.lastIterator.Remove(); //stack.Remove();
   }

   bool OnFile(char * filePath)
   {
      ProjectNode parentNode = stack.lastIterator.data;
      projectView.AddFile(parentNode, filePath, parentNode.isInResources, false);
      return true;
   }
}

static Array<FileFilter> fileFilters
{ [
   { $"eC/C/C++ Files (*.ec, *.eh, *.c, *.cpp, *.cc, *.cxx, *.h, *.hpp, *.hh, *.hxx)", "ec, eh, c, cpp, cc, cxx, h, hpp, hh, hxx" },
   { $"eC/C/C++ Source Files (*.ec, *.c, *.cpp, *.cc, *.cxx)", "ec, eh, c, cpp, cc, cxx" },
   { $"Header Files for eC/C/C++ (*.eh, *.h, *.hpp, *.hh, *.hxx)", "eh, h, hpp, hh, hxx" },
   { $"All files", null }
] };

static Array<FileFilter> resourceFilters
{ [
   { $"Image Files (*.jpg, *.jpeg, *.bmp, *.pcx, *.png,*.gif)", "jpg, jpeg, bmp, pcx, png, gif" },
   { $"3D Studio Model Files (*.3ds)", "3ds" },
   { $"Translations (*.mo)", "mo" },
   { $"All files", null }
] };

static Array<FileFilter> projectFilters
{ [
   { $"Project Files (*.epj)", ProjectExtension },
   { $"Workspace Files (*.ews)", WorkspaceExtension }
] };

static Array<FileType> projectTypes
{ [
   { $"Ecere IDE Project", ProjectExtension },
   { $"Ecere IDE Workspace", WorkspaceExtension }
] };

static char * iconNames[] = 
{
   "<:ecere>mimeTypes/file.png",                   /*genFile*/
   "<:ecere>mimeTypes/textEcereWorkspace.png",     /*ewsFile*/
   "<:ecere>mimeTypes/textEcereProject.png",       /*epjFile*/
   "<:ecere>places/folder.png",                    /*folder*/
   "<:ecere>status/folderOpen.png",                /*openFolder*/
   "<:ecere>mimeTypes/textEcereSource.png",        /*ecFile*/
   "<:ecere>mimeTypes/textEcereHeader.png",        /*ehFile*/
   "<:ecere>mimeTypes/textCSource.png",            /*sFile*/ // TODO: change sFile icon to differentiate from cFile icon
   "<:ecere>mimeTypes/textCSource.png",            /*cFile*/
   "<:ecere>mimeTypes/textCHeader.png",            /*hFile*/
   "<:ecere>mimeTypes/textC++Source.png",          /*cppFile*/
   "<:ecere>mimeTypes/textC++Header.png",          /*hppFile*/
   "<:ecere>mimeTypes/text.png",                   /*textFile*/
   "<:ecere>mimeTypes/textHyperTextMarkup.png",    /*webFile*/
   "<:ecere>mimeTypes/image.png",                  /*pictureFile*/
   "<:ecere>status/audioVolumeHigh.png",           /*soundFile*/
   "<:ecere>mimeTypes/package.png",                /*archiveFile*/
   "<:ecere>mimeTypes/packageSoftware.png",        /*packageFile*/
   "<:ecere>mimeTypes/packageOpticalDisc.png",     /*opticalMediaImageFile*/
   "<:ecere>mimeTypes/file.png",                   /*mFile*/ //TODO: create icon for .m file
   "<:ecere>mimeTypes/file.png"                    /*mmFile*/ //TODO: create icon for .mm file
};

enum PrepareMakefileMethod { normal, force, forceExists };

enum CleanType { clean, realClean, cleanTarget };
enum BuildType { build, rebuild, relink, run, start, restart, clean };
enum BuildState
{
   none, buildingMainProject, buildingSecondaryProject, compilingFile;

   property bool { get { return this != none; } }
   //property bool actualBuild { get { return this == buildingMainProject || this == buildingSecondaryProject;  } }
};

class ProjectView : Window
{
   isDocument = true;
   //hasMinimize = true;
   hasClose = true;
   borderStyle = sizable;
   hasHorzScroll = true;
   hasVertScroll = true;
   background = white;
   size = { 300 };
   anchor = Anchor { left = 0, top = 0, bottom = 0 };
   menu = Menu { };
   
   //hasMinimize = true;
   saveDialog = projectFileDialog;
   
   DataRow resourceRow;
   BuildState buildInProgress;
   BitmapResource icons[NodeIcons];
   Project project;
   Workspace workspace;
   property Workspace workspace
   {
      set
      {
         if(workspace)
         {
            for(prj : workspace.projects)
            {
               DeleteNode(prj.topNode);
            }
            workspace.projects.Free();
            ide.debugger.CleanUp();
         }
         workspace = value;
         if(workspace)
         {
            fileDialog.currentDirectory = workspace.workspaceDir;
            resourceFileDialog.currentDirectory = workspace.workspaceDir;
            for(prj : workspace.projects)
               AddNode(prj.topNode, null);
            ide.statusBar.text = $"Generating Makefile & Dependencies...";
            app.UpdateDisplay();
            for(prj : workspace.projects)
               prj.ModifiedAllConfigs(true, false, false, false);
            ide.statusBar.text = $"Initializing Debugger"; app.UpdateDisplay();
            ide.statusBar.text = null;
            app.UpdateDisplay();
         }
      }
      get { return workspace; }
   }
   
   bool drawingInProjectSettingsDialog;
   bool drawingInProjectSettingsDialogHeader;
   ProjectSettings projectSettingsDialog;

   bool stopBuild;
   PopupMenu popupMenu;

   ProjectView()
   {
      NodeIcons c;
      for(c = 0; c < NodeIcons::enumSize; c++)
      {
         icons[c] = BitmapResource { iconNames[c], alphaBlend = true };
         AddResource(icons[c]);
      }
      fileList.AddField(DataField { dataType = class(ProjectNode), freeData = false, userData = this });
   }

   ~ProjectView()
   {
      DebugStop();
      ide.DestroyTemporaryProjectDir();
      if(project)
      {
         workspace.Free();
         delete workspace;
      }
   }

   ListBox fileList
   {
      multiSelect = true, fullRowSelect = false, hasVertScroll = true, hasHorzScroll = true;
      borderStyle = deep, parent = this, collapseControl = true, treeBranches = true;
      anchor = Anchor { left = 0, right = 0, top = 0 , bottom = 0 };

      background = projectViewBackground;
      foreground = projectViewText;
      selectionColor = selectionColor, selectionText = selectionText;
      stippleColor = skyBlue;

      bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
      {
         if(!active) Update(null);
         return ListBox::OnActivate(active, previous, goOnWithActivation, direct);
      }
      
      bool NotifyDoubleClick(ListBox listBox, int x, int y, Modifiers mods)
      {
         // Prevent the double click from reactivating the project view (returns false if we opened something)
         return !OpenSelectedNodes();
      }

      bool NotifyRightClick(ListBox listBox, int x, int y, Modifiers mods)
      {
         DataRow row = listBox.currentRow;
         if(row)
         {
            bool showDebuggingMenuItems = mods.ctrl && mods.shift;
            ProjectNode node = (ProjectNode)row.tag;
            if(node.type == NodeTypes::project || node.type == resources || node.type == file || node.type == folder)
            {
               bool na = buildInProgress; // N/A - buildMenuUnavailable
               Menu pop { };
               
               if(node.type == NodeTypes::project)
               {
                  MenuItem mi;
                                                                                                                                            mi = ide.projectBuildItem;
                  MenuItem { pop, $"Build"              , b, f7     , NotifySelect = ProjectBuild     , bitmap = mi.bitmap }.disabled = na; mi = ide.projectLinkItem;
                  MenuItem { pop, $"Relink"             , l         , NotifySelect = ProjectLink      , bitmap = mi.bitmap }.disabled = na; mi = ide.projectRebuildItem;
                  MenuItem { pop, $"Rebuild"            , r, shiftF7, NotifySelect = ProjectRebuild   , bitmap = mi.bitmap }.disabled = na; mi = ide.projectCleanItem;
                  MenuItem { pop, $"Clean"              , c         , NotifySelect = ProjectClean     , bitmap = mi.bitmap }.disabled = na; mi = ide.projectRealCleanItem;
                  MenuItem { pop, $"Real Clean"         , d         , NotifySelect = ProjectRealClean , bitmap = mi.bitmap }.disabled = na; mi = ide.projectRegenerateItem;
                  MenuItem { pop, $"Regenerate Makefile", m         , NotifySelect = ProjectRegenerate, bitmap = mi.bitmap }.disabled = na;

                  if(showDebuggingMenuItems && node.ContainsFilesWithExtension("ec"))
                  {
                     MenuDivider { pop };
                     MenuItem { pop, $"Debug Generate Symbols", l, NotifySelect = FileDebugGenerateSymbols }.disabled = na;
                     MenuItem { pop, $"Debug Precompile", l, NotifySelect = FileDebugPrecompile }.disabled = na;
                     MenuItem { pop, $"Debug Compile", l, NotifySelect = FileDebugCompile }.disabled = na;
                  }
                  MenuDivider { pop };
                  MenuItem { pop, $"New File...", l, Key { l, ctrl = true }, NotifySelect = ProjectNewFile };
                  MenuItem { pop, $"New Folder...", n, Key { f, ctrl = true }, NotifySelect = ProjectNewFolder };
                  MenuItem { pop, $"Import Folder...", i, NotifySelect = ProjectImportFolder };
                  MenuItem { pop, $"Add Files to Project...", f, NotifySelect = ProjectAddFiles };
                  MenuDivider { pop };
                  MenuItem { pop, $"Add New Form...", o, NotifySelect = ProjectAddNewForm };
                  // MenuItem { pop, "Add New Behavior Graph...", g, NotifySelect = ProjectAddNewGraph };
                  MenuDivider { pop };
                  if(node != ((Project)workspace.projects.first).topNode)
                  {
                     MenuItem { pop, $"Remove project from workspace", r, NotifySelect = ProjectRemove }.disabled = na;
                     MenuDivider { pop };
                  }
                  MenuItem { pop, $"Settings...", s, Key { f7, alt = true } , NotifySelect = MenuSettings };
                  MenuDivider { pop };
                  MenuItem { pop, $"Browse Folder", w, NotifySelect = MenuBrowseFolder };
                  MenuDivider { pop };
                  MenuItem { pop, $"Save", v, Key { s, ctrl = true }, NotifySelect = ProjectSave }.disabled = !node.modified;
                  MenuDivider { pop };
                  MenuItem { pop, $"Properties...", p, Key { enter, alt = true }, NotifySelect = FileProperties };
               }
               else if(node.type == resources)
               {
                  MenuItem { pop, $"New File...", l, Key { l, ctrl = true }, NotifySelect = ProjectNewFile };
                  MenuItem { pop, $"New Folder...", n, Key { f, ctrl = true }, NotifySelect = ProjectNewFolder };
                  MenuItem { pop, $"Import Folder...", i, NotifySelect = ProjectImportFolder };
                  MenuItem { pop, $"Add Resources to Project...", f, NotifySelect = ResourcesAddFiles };
                  MenuItem { pop, $"Browse Folder", w, NotifySelect = MenuBrowseFolder };
                  MenuDivider { pop };
                  MenuItem { pop, $"Settings...", s, Key { f7, alt = true } , NotifySelect = MenuSettings };
                  MenuItem { pop, $"Properties...", p, Key { enter, alt = true }, NotifySelect = FileProperties };
               }
               else if(node.type == file)
               {
                  MenuItem { pop, $"Open", o, NotifySelect = FileOpenFile };
                  MenuDivider { pop };
                  MenuItem { pop, $"Clean", l, NotifySelect = FileClean, bitmap = ide.projectCleanItem.bitmap }.disabled = na;
                  MenuItem { pop, $"Compile", c, Key { f7, ctrl = true}, NotifySelect = FileCompile, bitmap = ide.projectBuildItem.bitmap }.disabled = na;
                  if(showDebuggingMenuItems)
                  {
                     char extension[MAX_EXTENSION];
                     GetExtension(node.name, extension);
                     if(!strcmpi(extension, "ec"))
                     {
                        MenuDivider { pop };
                        MenuItem { pop, $"Debug Precompile", l, NotifySelect = FileDebugPrecompile }.disabled = na;
                        MenuItem { pop, $"Debug Compile", l, NotifySelect = FileDebugCompile }.disabled = na;
                     }
                  }
                  MenuDivider { pop };
                  MenuItem { pop, $"Remove", r, NotifySelect = FileRemoveFile };
                  MenuDivider { pop };
                  MenuItem { pop, $"Browse Folder", w, NotifySelect = MenuBrowseFolder };
                  MenuDivider { pop };
                  MenuItem { pop, $"Settings...", s, Key { f7, alt = true } , NotifySelect = MenuSettings };
                  MenuItem { pop, $"Properties..", p, Key { enter, alt = true }, NotifySelect = FileProperties };
               }
               else if(node.type == folder)
               {
                  bool isInResources = node.isInResources;

                  MenuItem { pop, $"New File...", l, Key { l, ctrl = true }, NotifySelect = ProjectNewFile };
                  MenuItem { pop, $"New Folder...", n, Key { f, ctrl = true }, NotifySelect = ProjectNewFolder };
                  MenuItem { pop, $"Import Folder...", i, NotifySelect = ProjectImportFolder };
                  if(isInResources)
                  {
                     MenuItem { pop, $"Add Resources to Folder...", f, NotifySelect = ResourcesAddFiles };
                  }
                  else
                  {
                     MenuItem { pop, $"Add Files to Folder...", f, NotifySelect = ProjectAddFiles };
                  }
                  if(!isInResources)
                  {
                     MenuDivider { pop };
                     MenuItem { pop, $"Add New Form...", o, NotifySelect = ProjectAddNewForm };
                     // MenuItem { pop, $"Add New Behavior Graph...", g, NotifySelect = ProjectAddNewGraph };
                  }
                  MenuDivider { pop };
                  MenuItem { pop, $"Clean", l, NotifySelect = FileClean, bitmap = ide.projectCleanItem.bitmap }.disabled = na;
                  MenuItem { pop, $"Compile", c, Key { f7, ctrl = true}, NotifySelect = FileCompile, bitmap = ide.projectBuildItem.bitmap }.disabled = na;
                  MenuDivider { pop };
                  MenuItem { pop, $"Remove", r, NotifySelect = FileRemoveFile };
                  MenuDivider { pop };
                  MenuItem { pop, $"Browse Folder", w, NotifySelect = MenuBrowseFolder };
                  MenuDivider { pop };
                  MenuItem { pop, $"Settings...", s, Key { f7, alt = true } , NotifySelect = MenuSettings };
                  MenuItem { pop, $"Properties...", p, Key { enter, alt = true }, NotifySelect = FileProperties };
               }

               popupMenu = 
               {
                  master = this, menu = pop;
                  position = {
                     x + clientStart.x + absPosition.x - app.desktop.position.x, 
                     y + clientStart.y + absPosition.y - app.desktop.position.y };

                  void NotifyDestroyed(Window window, DialogResult result)
                  {
                     popupMenu = null;
                  }
               };
               popupMenu.Create();
               ide.AdjustPopupBuildMenus();
            }
         }
         return true;
      }

      bool NotifyKeyHit(ListBox listBox, DataRow row, Key key, unichar ch)
      {
         if(key == altUp || key == altDown)
         {
            SelectNextProject(key == altUp);
            return false;
         }
         return true;
      }

      bool NotifyKeyDown(ListBox listBox, DataRow row, Key key, unichar ch)
      {
         if(row)
         {
            ProjectNode node = (ProjectNode)row.tag;
            switch(key)
            {
               case altEnter: case Key { keyPadEnter, alt = true }:
               {
                  NodeProperties { parent = parent, master = this, 
                     position = { position.x + 100, position.y + 100 }, node = node }.Create();
                  return false;
               }
               case enter: case keyPadEnter:
               {
                  ProjectNode resNode;
                  for(resNode = node.parent; resNode; resNode = resNode.parent)
                     if(resNode.type == resources)
                        break;
                  if(node.type == project || (node.type == folder && !resNode))
                  {
                     AddFiles(false);
                     return false;
                  }
                  else if(node.type == resources || node.type == folder)
                  {
                     AddFiles(true);
                     return false;
                  }
                  break;
               }
               case ctrlI:
               {
                  if(node.type == project || node.type == folder || node.type == resources)
                  {
                     ImportFolder(node);
                     return false;
                  }
                  break;
               }
               case ctrlF:
               {
                  if(node.type == project || node.type == folder || node.type == resources)
                  {
                     NewFolder(node, null, true);
                     return false;
                  }
                  break;
               }
               case ctrlF7:
               {
                  if(node.type == file)
                  {
                     FileCompile(null, (Modifiers)key);
                     return false;
                  }
                  break;
               }
               case Key { space, shift = true }:
               case space:
               {
                  if(node.type == NodeTypes::project)
                  {
                     Project prj = null;
                     for(p : workspace.projects)
                     {
                        if(p.topNode == node)
                        {
                           prj = p;
                           break;
                        }
                     }
                     prj.RotateActiveConfig(!key.shift);
                     if(prj == project)
                        ide.AdjustMenus();
                     return false;
                  }
                  break;
               }
            }
         }
         switch(key)
         {
            case enter: case keyPadEnter:  OpenSelectedNodes();   break;
            case del:                      RemoveSelectedNodes(); break;
            case escape:                      
            {
               Window activeClient = ide.activeClient;
               if(activeClient)
                  activeClient.Activate();
               else
                  ide.RepositionWindows(true);
               break;
            }
         }
         return true;
      }

      bool NotifyCollapse(ListBox listBox, DataRow row, bool collapsed)
      {
         ProjectNode node = (ProjectNode)row.tag;
         if(node.type == folder)
            node.icon = collapsed ? folder : openFolder;
         return true;
      }
   };

   FileDialog importFileDialog { autoCreate = false, type = selectDir, text = $"Import Folder" };
   FileDialog projectFileDialog
   {
      autoCreate = false, filters = projectFilters.array, sizeFilters = projectFilters.count * sizeof(FileFilter);
      types = projectTypes.array, sizeTypes = projectTypes.count * sizeof(FileType);
   };
   FileDialog fileDialog
   {
      autoCreate = false, mayNotExist = true, filters = fileFilters.array, sizeFilters = fileFilters.count * sizeof(FileFilter);
   };
   FileDialog resourceFileDialog
   {
      autoCreate = false, mayNotExist = true, filters = resourceFilters.array, sizeFilters = resourceFilters.count * sizeof(FileFilter);
   };

   Menu fileMenu { menu, $"File", f };
   MenuItem { fileMenu, $"Save", s, Key { s, ctrl = true }, NotifySelect = MenuFileSave };
   // MenuItem { fileMenu, "Save As...", a, NotifySelect = MenuFileSaveAs };

   bool OnClose(bool parentClosing)
   {
      if(!parentClosing && visible)
      {
         visible = false;
         return false;
      }
      if(buildInProgress)
         return false;

      if(modifiedDocument)
      {
         DialogResult dialogRes;
         char msg[2048];
         bool first = true;
         strcpy(msg, $"You have modified projects.\nSave changes to ");
         for(p : ide.workspace.projects)
         {
            if(p.topNode.modified)
            {
               if(!first) strcat(msg, ", ");
               strcat(msg, p.name);
               first = false;
            }
         }
         strcat(msg, "?");

         dialogRes = MessageBox { master = master, type = yesNoCancel, text = parent.caption ? parent.caption : rootWindow.caption, contents = msg }.Modal();

         if(dialogRes == yes)
         {
            // TOFIX: Precomp error if brackets are taken out
            return (DialogResult)MenuFileSave(null, 0) != cancel;
         }
         else if(dialogRes == cancel)
            return false;
         modifiedDocument = false;
      }
      return true;
   }

   void OnDestroy(void)
   {
      //if(ide.findInFilesDialog && ide.findInFilesDialog.created && ide.findInFilesDialog.mode != directory)
      //   ide.findInFilesDialog.SearchStop();

      ide.outputView.buildBox.Clear();
      ide.outputView.debugBox.Clear();
      //ide.outputView.findBox.Clear();
      ide.callStackView.Clear();
      ide.watchesView.Clear();
      ide.threadsView.Clear();
      ide.breakpointsView.Clear();
      ide.outputView.ShowClearSelectTab(find); // why this? 
   }

   bool OnSaveFile(char * fileName)
   {
      for(prj : ide.workspace.projects)
      {
         if(prj.topNode.modified)
         {
            prj.StopMonitoring();
            if(prj.Save(prj.filePath))
               prj.topNode.modified = false;
            prj.StartMonitoring();
         }
      }
      modifiedDocument = false;
      Update(null);
      return true;
   }

   bool IsModuleInProject(char * filePath)
   {
      char moduleName[MAX_FILENAME]; //, modulePath[MAX_LOCATION];
      GetLastDirectory(filePath, moduleName);
      return project.topNode.Find(moduleName, false) != null;
   }

   bool GetRelativePath(char * filePath, char * relativePath)
   {
      return project.GetRelativePath(filePath, relativePath);
   }

   ProjectNode GetNodeFromWindow(Window document, Project project, bool isCObject)
   {
      if(document.fileName)
      {
         char winFileName[MAX_LOCATION];
         char * documentFileName = GetSlashPathBuffer(winFileName, document.fileName);
         ProjectNode node;
         Project prj;
         if(isCObject)
         {
            char name[MAX_FILENAME];
            GetLastDirectory(documentFileName, name);
            ChangeExtension(name, "ec", name);
            for(p : ide.workspace.projects)
            {
               prj = project ? project : p;
               if((node = prj.topNode.Find(name, false)))
                  return node;
               if(project) break;
            }
         }
         else
         {
            for(p : ide.workspace.projects)
            {
               prj = project ? project : p;
               if((node = prj.topNode.FindByFullPath(documentFileName, false)))
                  return node;
               if(project) break;
            }
         }
      }
      return null;
   }

   //                          ((( UTILITY FUNCTIONS )))
   //
   //  ************************************************************************
   //  *** These methods below are part of a sequence of events, and as     ***
   //  *** such they must be passed the current compiler and project config ***
   //  ************************************************************************
   bool DisplayCompiler(CompilerConfig compiler, bool cleanLog)
   {
      ide.outputView.buildBox.Logf($"%s Compiler\n", compiler ? compiler.name : $"{problem with compiler selection}");
      return true;
   }

   bool ProjectPrepareForToolchain(Project project, PrepareMakefileMethod method, bool cleanLog, bool displayCompiler,
      CompilerConfig compiler, ProjectConfig config)
   {
      bool isReady = true;
      char message[MAX_F_STRING];
      LogBox logBox = ide.outputView.buildBox;

      ShowOutputBuildLog(cleanLog);

      if(displayCompiler)
         DisplayCompiler(compiler, false);

      ProjectPrepareCompiler(project, compiler, false);
      ProjectPrepareMakefile(project, method, compiler, config);
      return true;
   }

   bool ProjectPrepareCompiler(Project project, CompilerConfig compiler, bool silent)
   {
      if((!project.GenerateCrossPlatformMk(app.includeFile) || !project.GenerateCompilerCf(compiler)) && !silent)
         ide.outputView.buildBox.Logf($"Error generating compiler configuration (Is the project/config directory writable?)\n");
      return true;
   }

   // Note: Compiler is only passed in to for VisualStudio support
   bool ProjectPrepareMakefile(Project project, PrepareMakefileMethod method, CompilerConfig compiler, ProjectConfig config)
   {
      if(compiler.type.isVC)
      {
         // I'm guessing we'll want to support generating VS files on Linux as well...
         ide.statusBar.text = $"Generating Visual Studio Solution...";
         app.UpdateDisplay();
         //GenerateVSSolutionFile(project, compiler);
         ide.statusBar.text = $"Generating Visual Studio Project...";
         app.UpdateDisplay();
         //GenerateVCProjectFile(project, compiler, bitDepth);
         ide.statusBar.text = null;
         app.UpdateDisplay();
         return true;
      }
      else
      {
         char makefilePath[MAX_LOCATION];
         char makefileName[MAX_LOCATION];
         bool exists;
         LogBox logBox = ide.outputView.buildBox;
         
         strcpy(makefilePath, project.topNode.path);
         project.CatMakeFileName(makefileName, config);
         PathCatSlash(makefilePath, makefileName);

         exists = FileExists(makefilePath);
         if(method == force ||
           (method == forceExists && exists) ||
           (method == normal && (!exists || (config && config.makingModified))))
         {
            char * reason;
            char * action;
            ide.statusBar.text = $"Generating Makefile & Dependencies..."; // Dependencies?
            app.UpdateDisplay();

            if((method == normal && !exists) || (method == force && !exists))
               action = $"Generating ";
            else if(method == force)
               action = $"Regenerating ";
            else if(method == normal || method == forceExists)
               action = $"Updating ";
            else
               action = "";
            if(!exists)
               reason = $"Makefile doesn't exist. ";
            else if(project.topNode.modified)
               reason = $"Project has been modified. ";
            else
               reason = "";

            //logBox.Logf("%s\n", makefileName);
            logBox.Logf($"%s - %s%smakefile for %s config...\n", makefileName, reason, action, GetConfigName(config));

            if(!project.GenerateMakefile(null, false, null, config))
               ide.outputView.buildBox.Logf($"Error generating makefile (Is the project directory writable?)\n");

            ide.statusBar.text = null;
            app.UpdateDisplay();
            return true;
         }
      }
      return false;
   }
   
   bool BuildInterrim(Project prj, BuildType buildType, CompilerConfig compiler, ProjectConfig config, int bitDepth, bool justPrint)
   {
      if(ProjectPrepareForToolchain(prj, normal, true, true, compiler, config))
      {
         ide.outputView.buildBox.Logf($"Building project %s using the %s configuration...\n", prj.name, GetConfigName(config));
         return Build(prj, buildType, compiler, config, bitDepth, justPrint);
      }
      return false;
   }

   bool DebugStopForMake(Project prj, BuildType buildType, CompilerConfig compiler, ProjectConfig config)
   {
      bool result = false;
      // TOFIX: DebugStop is being abused and backfiring on us.
      //        It's supposed to be the 'Debug/Stop' item, not unloading executable or anything else

      //        configIsInDebugSession seems to be used for two OPPOSITE things:
      //        If we're debugging another config, we need to unload the executable!
      //        In building, we want to stop if we're debugging the 'same' executable
      if(buildType != run) ///* && prj == project*/ && prj.configIsInDebugSession)
      {
         if(buildType == start || buildType == restart)
         {
            if(ide.debugger && ide.debugger.isPrepared)
               result = DebugStop();
         }
         else
         {
            if(ide.project == prj && ide.debugger && ide.debugger.prjConfig == config && ide.debugger.isPrepared)
               result = DebugStop();
         }
      }
      return result;
   }

   bool Build(Project prj, BuildType buildType, CompilerConfig compiler, ProjectConfig config, int bitDepth, bool justPrint)
   {
      bool result = true;
      Window document;

      stopBuild = false;
      for(document = master.firstChild; document; document = document.next)
      {
         if(document.modifiedDocument)
         {
            ProjectNode node = GetNodeFromWindow(document, prj, false);
            if(node && !document.MenuFileSave(null, 0))
            {
               result = false;
               break;
            }
         }
      }
      if(result)
      {
         DirExpression targetDir = prj.GetTargetDir(compiler, config, bitDepth);

         DebugStopForMake(prj, buildType, compiler, config);

         // TODO: Disabled until problems fixed... is it fixed?
         if(buildType == rebuild || (config && config.compilingModified))
            prj.Clean(compiler, config, bitDepth, clean, justPrint);
         else
         {
            if(buildType == relink || (config && config.linkingModified))
               prj.Clean(compiler, config, bitDepth, cleanTarget, false);
            if(config && config.symbolGenModified)
            {
               DirExpression objDir = prj.GetObjDir(compiler, config, bitDepth);
               char fileName[MAX_LOCATION];
               char moduleName[MAX_FILENAME];
               strcpy(fileName, prj.topNode.path);
               PathCatSlash(fileName, objDir.dir);
               strcpy(moduleName, prj.moduleName);
               strcat(moduleName, ".main.ec");
               PathCatSlash(fileName, moduleName);
               if(FileExists(fileName))
                  DeleteFile(fileName);
               ChangeExtension(fileName, "c", fileName);
               if(FileExists(fileName))
                  DeleteFile(fileName);
               ChangeExtension(fileName, "o", fileName);
               if(FileExists(fileName))
                  DeleteFile(fileName);

               delete objDir;
            }
         }
         buildInProgress = prj == project ? buildingMainProject : buildingSecondaryProject;
         ide.AdjustBuildMenus();
         ide.AdjustDebugMenus();

         result = prj.Build(buildType == run, null, compiler, config, bitDepth, justPrint, normal);

         if(config)
         {
            config.compilingModified = false;
            if(!stopBuild)
               config.linkingModified = false;

            config.symbolGenModified = false;
         }
         buildInProgress = none;
         ide.AdjustBuildMenus();
         ide.AdjustDebugMenus();

         ide.workspace.modified = true;

         delete targetDir;
      }
      return result;
   }

   //                          ((( USER ACTIONS )))
   //
   //  ************************************************************************
   //  *** Methods below should atomically start a process, and as such     ***
   //  *** they can query compiler and config directly from ide and project ***
   //  *** but ONLY ONCE!!!                                                 ***
   //  ************************************************************************

   bool ProjectBuild(MenuItem selection, Modifiers mods)
   {
      if(buildInProgress == none)
      {
         Project prj = project;
         CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
         int bitDepth = ide.workspace.bitDepth;
         ProjectConfig config;
         if(selection || !ide.activeClient)
         {
            DataRow row = fileList.currentRow;
            ProjectNode node = row ? (ProjectNode)row.tag : null;
            if(node) prj = node.project;
         }
         else
         {
            ProjectNode node = GetNodeFromWindow(ide.activeClient, null, false);
            if(node)
               prj = node.project;
         }
         config = prj.config;
         if(/*prj != project || */!prj.GetConfigIsInDebugSession(config) || !ide.DontTerminateDebugSession($"Project Build"))
         {
            BuildInterrim(prj, build, compiler, config, bitDepth, mods.ctrl && mods.shift);
         }
         delete compiler;
      }
      else
         stopBuild = true;
      return true;
   }

   bool ProjectLink(MenuItem selection, Modifiers mods)
   {
      Project prj = project;
      CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
      int bitDepth = ide.workspace.bitDepth;
      ProjectConfig config;
      if(selection || !ide.activeClient)
      {
         DataRow row = fileList.currentRow;
         ProjectNode node = row ? (ProjectNode)row.tag : null;
         if(node) prj = node.project;
      }
      else
      {
         ProjectNode node = GetNodeFromWindow(ide.activeClient, null, false);
         if(node)
            prj = node.project;
      }
      config = prj.config;
      if(!prj.GetConfigIsInDebugSession(config) ||
            (!ide.DontTerminateDebugSession($"Project Link") && DebugStopForMake(prj, relink, compiler, config)))
      {
         if(ProjectPrepareForToolchain(prj, normal, true, true, compiler, config))
         {
            ide.outputView.buildBox.Logf($"Relinking project %s using the %s configuration...\n", prj.name, GetConfigName(config));
            if(config)
               config.linkingModified = true;
            Build(prj, relink, compiler, config, bitDepth, mods.ctrl && mods.shift);
         }
      }
      delete compiler;
      return true;
   }

   bool ProjectRebuild(MenuItem selection, Modifiers mods)
   {
      CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
      int bitDepth = ide.workspace.bitDepth;
      Project prj = project;
      ProjectConfig config;
      if(selection || !ide.activeClient)
      {
         DataRow row = fileList.currentRow;
         ProjectNode node = row ? (ProjectNode)row.tag : null;
         if(node) prj = node.project;
      }
      else
      {
         ProjectNode node = GetNodeFromWindow(ide.activeClient, null, false);
         if(node)
            prj = node.project;
      }
      config = prj.config;
      if(!prj.GetConfigIsInDebugSession(config) ||
            (!ide.DontTerminateDebugSession($"Project Rebuild") && DebugStopForMake(prj, rebuild, compiler, config)))
      {
         if(ProjectPrepareForToolchain(prj, normal, true, true, compiler, config))
         {
            ide.outputView.buildBox.Logf($"Rebuilding project %s using the %s configuration...\n", prj.name, GetConfigName(config));
            /*if(config)
            {
               config.compilingModified = true;
               config.makingModified = true;
            }*/ // -- should this still be used depite the new solution of BuildType?
            Build(prj, rebuild, compiler, config, bitDepth, mods.ctrl && mods.shift);
         }
      }
      delete compiler;
      return true;
   }

#if 0
   bool ProjectCleanTarget(MenuItem selection, Modifiers mods)
   {
      Project prj = project;
      CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
      ProjectConfig config;
      if(selection || !ide.activeClient)
      {
         DataRow row = fileList.currentRow;
         ProjectNode node = row ? (ProjectNode)row.tag : null;
         if(node) prj = node.project;
      }
      else
      {
         ProjectNode node = GetNodeFromWindow(ide.activeClient, null, false);
         if(node)
            prj = node.project;
      }
      config = prj.config;
      if(!prj.GetConfigIsInDebugSession(config) ||
            (!ide.DontTerminateDebugSession($"Project Clean Target") && DebugStopForMake(prj, clean, compiler, config)))
      {
         if(ProjectPrepareForToolchain(prj, normal, true, true, compiler, config))
         {
            ide.outputView.buildBox.Logf($"Cleaning target for project %s using the %s configuration...\n", prj.name, GetConfigName(config));

            buildInProgress = prj == project ? buildingMainProject : buildingSecondaryProject;
            ide.AdjustBuildMenus();
            ide.AdjustDebugMenus();

            prj.Clean(compiler, config, cleanTarget, mods.ctrl && mods.shift);
            buildInProgress = none;
            ide.AdjustBuildMenus();
            ide.AdjustDebugMenus();
         }
      }
      delete compiler;
      return true;
   }
#endif

   bool ProjectClean(MenuItem selection, Modifiers mods)
   {
      Project prj = project;
      CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
      ProjectConfig config;
      int bitDepth = ide.workspace.bitDepth;
      if(selection || !ide.activeClient)
      {
         DataRow row = fileList.currentRow;
         ProjectNode node = row ? (ProjectNode)row.tag : null;
         if(node) prj = node.project;
      }
      else
      {
         ProjectNode node = GetNodeFromWindow(ide.activeClient, null, false);
         if(node)
            prj = node.project;
      }
      config = prj.config;
      if(!prj.GetConfigIsInDebugSession(config) ||
            (!ide.DontTerminateDebugSession($"Project Clean") && DebugStopForMake(prj, clean, compiler, config)))
      {
         if(ProjectPrepareForToolchain(prj, normal, true, true, compiler, config))
         {
            ide.outputView.buildBox.Logf($"Cleaning project %s using the %s configuration...\n", prj.name, GetConfigName(config));

            buildInProgress = prj == project ? buildingMainProject : buildingSecondaryProject;
            ide.AdjustBuildMenus();
            ide.AdjustDebugMenus();

            prj.Clean(compiler, config, bitDepth, clean, mods.ctrl && mods.shift);
            buildInProgress = none;
            ide.AdjustBuildMenus();
            ide.AdjustDebugMenus();
         }
      }
      delete compiler;
      return true;
   }

   bool ProjectRealClean(MenuItem selection, Modifiers mods)
   {
      Project prj = project;
      CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
      ProjectConfig config;
      int bitDepth = ide.workspace.bitDepth;
      if(selection || !ide.activeClient)
      {
         DataRow row = fileList.currentRow;
         ProjectNode node = row ? (ProjectNode)row.tag : null;
         if(node) prj = node.project;
      }
      else
      {
         ProjectNode node = GetNodeFromWindow(ide.activeClient, null, false);
         if(node)
            prj = node.project;
      }
      config = prj.config;
      if(!prj.GetConfigIsInDebugSession(config) ||
            (!ide.DontTerminateDebugSession($"Project Real Clean") && DebugStopForMake(prj, clean, compiler, config)))
      {
         if(ProjectPrepareForToolchain(prj, normal, true, true, compiler, config))
         {
            ide.outputView.buildBox.Logf($"Removing intermediate objects directory for project %s using the %s configuration...\n", prj.name, GetConfigName(config));

            buildInProgress = prj == project ? buildingMainProject : buildingSecondaryProject;
            ide.AdjustBuildMenus();
            ide.AdjustDebugMenus();

            prj.Clean(compiler, config, bitDepth, realClean, mods.ctrl && mods.shift);
            buildInProgress = none;
            ide.AdjustBuildMenus();
            ide.AdjustDebugMenus();
         }
      }
      delete compiler;
      return true;
   }

   bool ProjectRegenerate(MenuItem selection, Modifiers mods)
   {
      Project prj = project;
      CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
      ShowOutputBuildLog(true);
      if(selection || !ide.activeClient)
      {
         DataRow row = fileList.currentRow;
         ProjectNode node = row ? (ProjectNode)row.tag : null;
         if(node)
            prj = node.project;
      }
      else
      {
         ProjectNode node = GetNodeFromWindow(ide.activeClient, null, false);
         if(node)
            prj = node.project;
      }

      DisplayCompiler(compiler, false);
      ProjectPrepareCompiler(project, compiler, false);
      ProjectPrepareMakefile(prj, force, compiler, prj.config);
      delete compiler;
      return true;
   }

   bool Compile(Project project, List<ProjectNode> nodes, bool justPrint, SingleFileCompileMode mode)
   {
      bool result = true;
      char fileName[MAX_LOCATION];
      Window document;
      ProjectConfig config = project.config;

      stopBuild = false;

      for(document = ide.firstChild; document; document = document.next)
      {
         if(document.modifiedDocument)
         {
            ProjectNode n = GetNodeFromWindow(document, project, mode == cObject ? true : false);
            for(node : nodes)
            {
               if(n && n.IsInNode(node) && !document.MenuFileSave(null, 0))
               {
                  ide.outputView.buildBox.Logf($"Unable to save %s file.\n", node.name);
                  result = false;
                  break;
               }
            }
         }
      }

      if(result)
      {
         CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
         int bitDepth = ide.workspace.bitDepth;
         result = false;
         if(ProjectPrepareForToolchain(project, normal, true, true, compiler, config))
         {
            if(config)
               ide.outputView.buildBox.Logf($"%s specific file(s) in project %s using the %s configuration...\n",
                     (mode == normal || mode == cObject) ? $"Compiling" : $"Debug compiling", project.name, config.name);
            else
               ide.outputView.buildBox.Logf($"%s specific file(s) in project %s...\n",
                     (mode == normal || mode == cObject) ? $"Compiling" : $"Debug compiling", project.name);

            buildInProgress = compilingFile;
            ide.AdjustBuildMenus();
            result = project.Compile(nodes, compiler, config, bitDepth, justPrint, mode);
            buildInProgress = none;
            ide.AdjustBuildMenus();
         }
         delete compiler;
      }
      return result;
   }

   bool Clean(Project project, List<ProjectNode> nodes, bool justPrint)
   {
      bool result = true;
      char fileName[MAX_LOCATION];
      Window document;
      ProjectConfig config = project.config;

      stopBuild = false;

      for(document = ide.firstChild; document; document = document.next)
      {
         if(document.modifiedDocument)
         {
            ProjectNode n = GetNodeFromWindow(document, project, false);
            for(node : nodes)
            {
               if(n && n.IsInNode(node) && !document.MenuFileSave(null, 0))
               {
                  ide.outputView.buildBox.Logf($"Unable to save %s file.\n", node.name);
                  result = false;
                  break;
               }
            }
         }
      }

      if(result)
      {
         CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
         int bitDepth = ide.workspace.bitDepth;
         result = false;
         if(ProjectPrepareForToolchain(project, normal, true, true, compiler, config))
         {
            Map<String, NameCollisionInfo> namesInfo { };
            project.topNode.GenMakefileGetNameCollisionInfo(namesInfo, config);
            for(node : nodes)
            {
               if(node.GetIsExcluded(config))
                  ide.outputView.buildBox.Logf($"File %s is excluded from current build configuration.\n", node.name);
               else
               {
                  if(config)
                     ide.outputView.buildBox.Logf($"Deleteing intermediate objects for %s %s in project %s using the %s configuration...\n",
                           node.type == file ? $"single file" : $"folder", node.name, project.name, config.name);
                  else
                     ide.outputView.buildBox.Logf($"Deleteing intermediate objects for %s %s in project %s...\n",
                           node.type == file ? $"single file" : $"folder", node.name, project.name);

                  node.DeleteIntermediateFiles(compiler, config, bitDepth, namesInfo, false);
                  result = true;
               }
            }
            namesInfo.Free();
            delete namesInfo;
         }
         delete compiler;
      }
      return result;
   }

   bool ProjectNewFile(MenuItem selection, Modifiers mods)
   {
      DataRow row = fileList.currentRow;
      if(row)
      {
         char fileName[1024];
         char filePath[MAX_LOCATION];
         ProjectNode parentNode = (ProjectNode)row.tag;
         ProjectNode n, fileNode;
         parentNode.GetFileSysMatchingPath(filePath);
         MakePathRelative(filePath, parentNode.project.topNode.path, filePath);
         for(n = parentNode; n && n != parentNode.project.resNode; n = n.parent);
         sprintf(fileName, $"Untitled %d", documentID);
         fileNode = AddFile(parentNode, fileName, (bool)n, true);
         fileNode.path = CopyUnixPath(filePath);
         if(fileNode)
         {
            NodeProperties nodeProperties
            {
               parent, this;
               position = { position.x + 100, position.y + 100 };
               mode = newFile;
               node = fileNode;
            };
            nodeProperties.Create(); // not modal?
         }
      }
      return true;
   }

   bool ProjectNewFolder(MenuItem selection, Modifiers mods)
   {
      DataRow row = fileList.currentRow;
      if(row)
      {
         ProjectNode parentNode = (ProjectNode)row.tag;
         NewFolder(parentNode, null, true);
      }
      return true;
   }

   bool ResourcesAddFiles(MenuItem selection, Modifiers mods)
   {
      AddFiles(true);
      return true;
   }

   bool ProjectAddFiles(MenuItem selection, Modifiers mods)
   {
      AddFiles(false);
      return true;
   }

   bool ProjectImportFolder(MenuItem selection, Modifiers mods)
   {
      DataRow row = fileList.currentRow;
      if(row)
      {
         ProjectNode toNode = (ProjectNode)row.tag;
         ImportFolder(toNode);
      }
      return true;
   }

   bool ProjectAddNewForm(MenuItem selection, Modifiers mods)
   {
      CodeEditor codeEditor = CreateNew("Form", "form", "Window", null);
      codeEditor.EnsureUpToDate();
      return true;
   }

   bool ProjectAddNewGraph(MenuItem selection, Modifiers mods)
   {
      CodeEditor codeEditor = CreateNew("Graph", "graph", "Block", null);
      if(codeEditor)
         codeEditor.EnsureUpToDate();
      return true;
   }

   bool ProjectRemove(MenuItem selection, Modifiers mods)
   {
      DataRow row = fileList.currentRow;
      if(row)
      {
         ProjectNode node = (ProjectNode)row.tag;
         if(node.type == project)
            RemoveSelectedNodes();
      }
      return true;
   }

   bool ProjectUpdateMakefileForAllConfigs(Project project)
   {
      CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);

      // This call really does not belong here:
      ide.UpdateToolBarActiveConfigs(false);
      for(config : project.configurations)
         ProjectPrepareMakefile(project, forceExists, compiler, config);

      ide.Update(null);
      delete compiler;
      return true;
   }

   bool MenuSettings(MenuItem selection, Modifiers mods)
   {
      ProjectNode node = GetSelectedNode(true);
      Project prj = node ? node.project : project;
      projectSettingsDialog = ProjectSettings { master = parent, project = prj, projectNode = node };
      incref projectSettingsDialog;
      projectSettingsDialog.Modal();
      delete projectSettingsDialog;
      ide.UpdateToolBarActiveConfigs(false);
      Update(null);
      ide.AdjustMenus();
      return true;
   }

   bool FileProperties(MenuItem selection, Modifiers mods)
   {
      DataRow row = fileList.currentRow;
      if(row)
      {
         ProjectNode node = (ProjectNode)row.tag;
         NodeProperties { parent = parent, master = this, node = node, 
               position = { position.x + 100, position.y + 100 } }.Create();
      }
      return true;
   }

   bool FileOpenFile(MenuItem selection, Modifiers mods)
   {
      OpenSelectedNodes();
      return true;
   }

   bool FileRemoveFile(MenuItem selection, Modifiers mods)
   {
      RemoveSelectedNodes();
      return true;
   }

   bool FileCompile(MenuItem selection, Modifiers mods)
   {
      OldLink item;
      OldList selectedRows;
      Project project = null;
      List<ProjectNode> nodes { };
      fileList.GetMultiSelection(selectedRows);
      for(item = selectedRows.first; item; item = item.next)
      {
         OldLink i;
         DataRow row = item.data;
         ProjectNode node = (ProjectNode)row.tag;
         if(!project)
            project = node.project;
         else if(node.project != project)
         {
            project = null;
            break;
         }
         nodes.Add(node);
      }
      selectedRows.Free(null);
      if(project)
         Compile(project, nodes, mods.ctrl && mods.shift, normal);
      else
         ide.outputView.buildBox.Logf($"Please select files from a single project.\n");
      delete nodes;
      return true;
   }

   bool FileClean(MenuItem selection, Modifiers mods)
   {
      OldLink item;
      OldList selectedRows;
      Project project = null;
      List<ProjectNode> nodes { };
      fileList.GetMultiSelection(selectedRows);
      for(item = selectedRows.first; item; item = item.next)
      {
         OldLink i;
         DataRow row = item.data;
         ProjectNode node = (ProjectNode)row.tag;
         if(!project)
            project = node.project;
         else if(node.project != project)
         {
            project = null;
            break;
         }
         nodes.Add(node);
      }
      selectedRows.Free(null);
      if(project)
         Clean(project, nodes, mods.ctrl && mods.shift);
      else
         ide.outputView.buildBox.Logf($"Please select files from a single project.\n");
      delete nodes;
      return true;
   }

   bool FileDebugPrecompile(MenuItem selection, Modifiers mods)
   {
      DataRow row = fileList.currentRow;
      ProjectNode node = row ? (ProjectNode)row.tag : null;
      if(node)
      {
         List<ProjectNode> nodes { };
         nodes.Add(node);
         if(node.type == project)
            ProjectBuild(selection, mods);
         ide.Update(null);
         if(!stopBuild)
            Compile(node.project, nodes, mods.ctrl && mods.shift, debugPrecompile);
         delete nodes;
      }
      return true;
   }

   bool FileDebugCompile(MenuItem selection, Modifiers mods)
   {
      DataRow row = fileList.currentRow;
      ProjectNode node = row ? (ProjectNode)row.tag : null;
      if(node)
      {
         List<ProjectNode> nodes { };
         nodes.Add(node);
         if(node.type == project)
            ProjectBuild(selection, mods);
         else
            Compile(node.project, nodes, mods.ctrl && mods.shift, normal);
         if(!stopBuild)
            Compile(node.project, nodes, mods.ctrl && mods.shift, debugCompile);
         delete nodes;
      }
      return true;
   }

   bool FileDebugGenerateSymbols(MenuItem selection, Modifiers mods)
   {
      DataRow row = fileList.currentRow;
      ProjectNode node = row ? (ProjectNode)row.tag : null;
      if(node)
      {
         List<ProjectNode> nodes { };
         nodes.Add(node);
         if(node.type == project)
            ProjectBuild(selection, mods);
         else
            Compile(node.project, nodes, mods.ctrl && mods.shift, normal);
         if(!stopBuild)
            Compile(node.project, nodes, mods.ctrl && mods.shift, debugGenerateSymbols);
         delete nodes;
      }
      return true;
   }

   Project GetSelectedProject(bool useSelection)
   {
      Project prj = project;
      if(useSelection)
      {
         DataRow row = fileList.currentRow;
         ProjectNode node = row ? (ProjectNode)row.tag : null;
         if(node)
            prj = node.project;
      }
      return prj;
   }
   
   void SelectNextProject(bool backwards)
   {
      DataRow row = fileList.currentRow;
      DataRow currentRow = row;
      ProjectNode node = (ProjectNode)row.tag;
      if(node.type != project)
         row = node.project.topNode.row;
      else if(backwards)
         row = row.previous ? row.previous : fileList.lastRow;
      if(!backwards)
         row = row.next ? row.next : fileList.firstRow;
      if(row && row != currentRow)
      {
         fileList.SelectRow(row);
         fileList.currentRow = row;
      }
   }

   ProjectNode GetSelectedNode(bool useSelection)
   {
      ProjectNode node = null;
      if(useSelection)
      {
         DataRow row = fileList.currentRow;
         if(row)
            node = (ProjectNode)row.tag;
      }
      return node;
   }

   bool MenuBrowseFolder(MenuItem selection, Modifiers mods)
   {
      char folder[MAX_LOCATION];
      Project prj;
      ProjectNode node = GetSelectedNode(true);
      if(!node)
         node = project.topNode;
      prj = node.project;

      strcpy(folder, prj.topNode.path);
      if(node != prj.topNode)
         PathCatSlash(folder, node.path);
      ShellOpen(folder);
      return true;
   }

   bool Run(MenuItem selection, Modifiers mods)
   {
      CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
      ProjectConfig config = project.config;
      int bitDepth = ide.workspace.bitDepth;
      String args = new char[maxPathLen];
      args[0] = '\0';
      if(ide.workspace.commandLineArgs)
         //ide.debugger.GetCommandLineArgs(args);
         strcpy(args, ide.workspace.commandLineArgs);
      if(ide.debugger.isActive)
         project.Run(args, compiler, config, bitDepth);
      /*else if(config.targetType == sharedLibrary || config.targetType == staticLibrary)
         MessageBox { master = ide, type = ok, text = "Run", contents = "Shared and static libraries cannot be run like executables." }.Modal();*/
      else if(BuildInterrim(project, run, compiler, config, bitDepth, false))
         project.Run(args, compiler, config, bitDepth);
      delete args;
      delete compiler;
      return true;
   }

   bool DebugStart()
   {
      bool result = false;
      CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
      ProjectConfig config = project.config;
      int bitDepth = ide.workspace.bitDepth;
      TargetTypes targetType = project.GetTargetType(config);
      if(targetType == sharedLibrary || targetType == staticLibrary)
         MessageBox { master = ide, type = ok, text = $"Run", contents = $"Shared and static libraries cannot be run like executables." }.Modal();
      else if(project.GetCompress(config))
         MessageBox { master = ide, text = $"Starting Debug", contents = $"Debugging compressed applications is not supported\n" }.Modal();
      else if(project.GetDebug(config) ||
         MessageBox { master = ide, type = okCancel, text = $"Starting Debug", contents = $"Attempting to debug non-debug configuration\nProceed anyways?" }.Modal() == ok)
      {
         if(/*!IsProjectModified() ||*/ BuildInterrim(project, start, compiler, config, bitDepth, false))
         {
            if(compiler.type.isVC)
            {
               //bool result = false;
               char oldwd[MAX_LOCATION];
               PathBackup pathBackup { };
               char command[MAX_LOCATION];

               ide.SetPath(false, compiler, config, bitDepth);
               
               GetWorkingDir(oldwd, sizeof(oldwd));
               ChangeWorkingDir(project.topNode.path);

               sprintf(command, "%s /useenv %s.sln /projectconfig \"%s|Win32\" /command \"%s\"" , "devenv", project.name, config.name, "Debug.Start");
               Execute(command);
               ChangeWorkingDir(oldwd);

               delete pathBackup;
            }
            else
            {
               ide.debugger.Start(compiler, config, bitDepth);
               result = true;
            }
         }
      }
      delete compiler;
      return result;      
   }

   void GoToError(const char * line)
   {
      char * colon;
      
      while(isspace(*line)) line++;
      colon = strstr(line, ":");

      {
         int lineNumber = 0;
         int col = 1;
         bool lookForLineNumber = true;

         // deal with linking error
         if(colon && colon[1] == ' ')
         {
            colon = strstr(colon + 1, ":");
            if(colon && !colon[1])
            {
               colon = strstr(line, ":");
               lookForLineNumber = false;
            }
            else if(colon && !isdigit(colon[1]))
            {
               line = colon + 1;
               colon = strstr(line, ":");
            }
         }
         // Don't be mistaken by the drive letter colon
         if(colon && (colon[1] == '/' || colon[1] == '\\'))
            colon = strstr(colon + 1, ":");
         if(colon && lookForLineNumber)
         {
            char * comma;
            // MSVS Errors
            char * par = RSearchString(line, "(", colon - line, true, false);
            if(par && strstr(par, ")"))
               colon = par;
            else if((colon+1)[0] == ' ')
            {
               // NOTE: This is the same thing as saying 'colon = line'
               for( ; colon != line; colon--)
                  /*if(*colon == '(')
                     break*/;
            }
            lineNumber = atoi(colon + 1);
            /*
            comma = strchr(colon, ',');
            if(comma)
               col = atoi(comma+1);
            */
            comma = strchr(colon+1, ':');
            if(comma)
               col = atoi(comma+1);
         }
         
         {
            char moduleName[MAX_LOCATION], filePath[MAX_LOCATION];
            char ext[MAX_EXTENSION];
            char * bracket;
            if(colon)
            {
               char * inFileIncludedFrom = strstr(line, stringInFileIncludedFrom);
               char * from = strstr(line, "from ");
               char * start = inFileIncludedFrom ? inFileIncludedFrom + strlen(stringInFileIncludedFrom) : from ? from + strlen("from ") : line;
               int len;
               if(colon < start)
                  start = line;
               len = Min((int)(colon - start), MAX_LOCATION-1);
               // Cut module name
               strncpy(moduleName, start, len);
               moduleName[len] = '\0';
            }
            else
               strcpy(moduleName, line);

            // Remove stuff in brackets
            /*
            bracket = strstr(moduleName, "(");
            if(bracket) *bracket = '\0';
            */
            MakeSlashPath(moduleName);

            if(!colon)
            {
               // Check if it's one of our modules
               ProjectNode node = project.topNode.Find(moduleName, false);
               if(node)
               {
                  strcpy(moduleName, node.path);
                  PathCatSlash(moduleName, node.name);
               }
               else
                  moduleName[0] = '\0';
            }
            GetExtension(moduleName, ext);
            if(!strcmp(ext, "a") || !strcmp(ext, "o") || !strcmp(ext, "lib") || !strcmp(ext, "dll"))
               moduleName[0] = 0;    // Avoid opening binary files
            if(moduleName[0])
            {
               CodeEditor codeEditor;
               strcpy(filePath, project.topNode.path);
               PathCatSlash(filePath, moduleName);
      
               codeEditor = (CodeEditor)ide.OpenFile(filePath, normal, true, null, no, normal);
               if(!codeEditor && !strcmp(ext, "c"))
               {
                  char ecName[MAX_LOCATION];
                  ChangeExtension(filePath, "ec", ecName);
                  codeEditor = (CodeEditor)ide.OpenFile(ecName, normal, true, null, no, normal);
               }
               if(!codeEditor)
               {
                  char path[MAX_LOCATION];
                  // TOFIX: Improve on this, don't use only filename, make a function
                  if(ide && ide.workspace)
                  {
                     for(prj : ide.workspace.projects)
                     {
                        ProjectNode node;
                        MakePathRelative(filePath, prj.topNode.path, path);

                        if((node = prj.topNode.FindWithPath(path, false)))
                        {
                           strcpy(filePath, prj.topNode.path);
                           PathCatSlash(filePath, node.path);
                           PathCatSlash(filePath, node.name);
                           codeEditor = (CodeEditor)ide.OpenFile(filePath, normal, true, null, no, normal);
                           if(codeEditor)
                              break;
                        }
                     }
                     if(!codeEditor && !strchr(moduleName, '/') && !strchr(moduleName, '\\'))
                     {
                        for(prj : ide.workspace.projects)
                        {
                           ProjectNode node;
                           if((node = prj.topNode.Find(moduleName, false)))
                           {
                              strcpy(filePath, prj.topNode.path);
                              PathCatSlash(filePath, node.path);
                              PathCatSlash(filePath, node.name);
                              codeEditor = (CodeEditor)ide.OpenFile(filePath, normal, true, null, no, normal);
                              if(codeEditor)
                                 break;
                           }
                        }
                     }
                  }
               }
               if(codeEditor && lineNumber)
               {
                  EditBox editBox = codeEditor.editBox;
                  editBox.GoToLineNum(lineNumber - 1);
                  editBox.GoToPosition(editBox.line, lineNumber - 1, col ? (col - 1) : 0);
               }
            }
         }
      }
   }

   bool OpenNode(ProjectNode node)
   {
      char filePath[MAX_LOCATION];
      node.GetFullFilePath(filePath);
      return ide.OpenFile(filePath, normal, true/*false Why was it opening hidden?*/, null, something, normal) ? true : false;
   }

   void AddNode(ProjectNode node, DataRow addTo)
   {
      DataRow row = addTo ? addTo.AddRow() : fileList.AddRow();

      row.tag = (int64)node;
      node.row = row;

      if(node.type == resources)
         resourceRow = row;

      row.SetData(null, node);

      if(node.files && node.files.first && node.parent && 
            !(!node.parent.parent && 
               (!strcmpi(node.name, "notes") || !strcmpi(node.name, "sources") || 
                  !strcmpi(node.name, "src") || !strcmpi(node.name, "tools"))))
         row.collapsed = true;
      else if(node.type == folder)
         node.icon = openFolder;

      if(node.files)
      {
         for(child : node.files)
            AddNode(child, row);
      }
   }

   void DeleteNode(ProjectNode projectNode)
   {
      if(projectNode.files)
      {
         ProjectNode child;
         while(child = projectNode.files.first)
            DeleteNode(child);
      }
      fileList.DeleteRow(projectNode.row);
      projectNode.Delete();
   }

   bool ProjectSave(MenuItem selection, Modifiers mods)
   {
      DataRow row = fileList.currentRow;
      ProjectNode node = row ? (ProjectNode)row.tag : null;
      Project prj = node ? node.project : null;
      if(prj)
      {
         prj.StopMonitoring();
         if(prj.Save(prj.filePath))
         {
            Project modPrj = null;
            prj.topNode.modified = false;
            for(p : ide.workspace.projects)
            {
               if(p.topNode.modified)
               { 
                  modPrj = p;
                  break;
               }
            }
            if(!modPrj)
               modifiedDocument = false;
            Update(null);
         }
         prj.StartMonitoring();
      }
      return true;
   }

   bool ShowOutputBuildLog(bool cleanLog)
   {
      OutputView output = ide.outputView;
      if(cleanLog)
         output.ShowClearSelectTab(build);
      else
      {
         output.SelectTab(build);
         output.Show();
      }
      return true;
   }

   bool DebugRestart()
   {
      CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
      ProjectConfig config = project.config;
      int bitDepth = ide.workspace.bitDepth;

      bool result = false;
      if(/*!IsProjectModified() ||*/ BuildInterrim(project, restart, compiler, config, bitDepth, false))
      {
         // For Restart, compiler and config will only be used if for
         // whatever reason (if at all possible) the Debugger is in a
         // 'terminated' or 'none' state
         ide.debugger.Restart(compiler, config, bitDepth);
         result = true;
      }

      delete compiler;
      return result;
   }

   bool DebugResume()
   {
      ide.debugger.Resume();
      return true;
   }

   bool DebugBreak()
   {
      ide.debugger.Break();
      return true;
   }

   bool DebugStop()
   {
      ide.debugger.Stop();
      return true;
   }

   bool DebugStepInto()
   {
      CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
      ProjectConfig config = project.config;
      int bitDepth = ide.workspace.bitDepth;

      if((ide.debugger.isActive) || (!buildInProgress && BuildInterrim(project, start, compiler, config, bitDepth, false)))
         ide.debugger.StepInto(compiler, config, bitDepth);
      delete compiler;
      return true;
   }

   bool DebugStepOver(bool skip)
   {
      CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
      ProjectConfig config = project.config;
      int bitDepth = ide.workspace.bitDepth;

      if((ide.debugger.isActive) || (!buildInProgress && BuildInterrim(project, start, compiler, config, bitDepth, false)))
         ide.debugger.StepOver(compiler, config, bitDepth, skip);

      delete compiler;
      return true;
   }

   bool DebugStepOut(bool skip)
   {
      ide.debugger.StepOut(skip);
      return true;
   }

   void ImportFolder(ProjectNode toNode)
   {
      if(toNode)
      {
         //bool isFolder = toNode.type == folder;
         //bool isRes = toNode.isInResources;
         
         FileDialog fileDialog = importFileDialog;
         fileDialog.master = parent;
         if(fileDialog.Modal() == ok)
         {
            ImportFolderFSI fsi { projectView = this };
            fsi.stack.Add(toNode);
            fsi.Iterate(fileDialog.filePath);
            delete fsi;
         }
      }
   }

   ProjectNode NewFolder(ProjectNode parentNode, char * name, bool showProperties)
   {
      if(parentNode)
      {
         ProjectNode folderNode;
         Project prj = parentNode.project;
         int c;
         ProjectNode after = null;
         for(node : parentNode.files)
         {
            if(node.type != folder)
               break;
            after = node;
         }
         
         if(name && name[0])
            folderNode = parentNode.Add(prj, name, after, folder, folder, true);
         else
         {
            for(c = 0; c < 100; c++)
            {
               char string[16];
               sprintf(string, c ? "New Folder (%d)" : "New Folder", c);
               if((folderNode = parentNode.Add(prj, string, after, folder, folder, true)))
                  break;
            }
         }

         if(folderNode)
         {
            NodeProperties nodeProperties;
            if(!showProperties)
            {
               modifiedDocument = true;
               prj.topNode.modified = true;
            }
            Update(null);
            folderNode.row = parentNode.row.AddRowAfter(after ? after.row : null);
            folderNode.row.tag = (int64)folderNode;
               
            folderNode.row.SetData(null, folderNode);
            fileList.currentRow = folderNode.row;
            
            if(showProperties)
            {
               nodeProperties = NodeProperties
               {
                  parent, this, mode = newFolder, node = folderNode;
                  position = { position.x + 100, position.y + 100 };
               };
               nodeProperties.Create();   // Modal?
            }
            return folderNode;
         }
      }
      return null;
   }

   void AddFiles(bool resources)
   {
      FileDialog fileDialog = (!resources) ? this.fileDialog : resourceFileDialog;
      fileDialog.type = multiOpen;
      fileDialog.text = !resources ? $"Add Files to Project" : $"Add Resources to Project";
      fileDialog.master = parent;

      if(fileDialog.Modal() == ok)
      {
         int c;
         DataRow row = fileList.currentRow;
         ProjectNode parentNode = (ProjectNode)row.tag;
         bool addFailed = false;
         int numSelections = fileDialog.numSelections;
         char ** multiFilePaths = fileDialog.multiFilePaths;

         Array<String> nameConflictFiles { };

         for(c = 0; c < numSelections; c++)
         {
            char * filePath = multiFilePaths[c];
            FileAttribs exists = FileExists(filePath);
            bool addThisFile = true;

            if(exists.isDirectory)
               addThisFile = false;
            else if(!exists)
            {
               if(MessageBox { master = ide, type = yesNo, text = filePath, 
                     contents = $"File doesn't exist. Create?" }.Modal() == yes)
               {
                  File f = FileOpen(filePath, write);
                  if(f)
                  {
                     addThisFile = true;
                     delete f;
                  }
                  else
                  {
                     MessageBox { master = ide, type = ok, text = filePath, 
                           contents = $"Couldn't create file."}.Modal();
                     addThisFile = false;
                  }
               }
            }

            if(addThisFile)
            {
               /*addFailed = */if(!AddFile(parentNode, filePath, resources, false))//;
               {
                  nameConflictFiles.Add(CopyString(filePath));
                  addFailed = true;
               }
            }
         }
         if(addFailed)
         {
            int len = 0;
            char * part1 = $"The following file";
            char * opt1 = $" was ";
            char * opt2 = $"s were ";
            char * part2 = $"not added because of identical file name conflict within the project.\n\n";
            char * message;
            len += strlen(part1);
            len += strlen(part2);
            len += nameConflictFiles.count > 1 ? strlen(opt2) : strlen(opt1);
            for(s : nameConflictFiles)
               len += strlen(s) + 1;
            message = new char[len + 1];
            strcpy(message, part1);
            strcat(message, nameConflictFiles.count > 1 ? opt2 : opt1);
            strcat(message, part2);
            for(s : nameConflictFiles)
            {
               strcat(message, s);
               strcat(message, "\n");
            }
            MessageBox { master = ide, type = ok, text = $"Name Conflict", 
                  contents = message }.Modal();
            delete message;
         }
         nameConflictFiles.Free();
         delete nameConflictFiles;
      }
   }

   ProjectNode AddFile(ProjectNode parentNode, char * filePath, bool resources, bool isTemporary)
   {
      ProjectNode result = null;
      ProjectNode after = null;
      for(node : parentNode.files)
      {
         if(node.type != folder && node.type != file && node.type)
            break;
         after = node;
      }

      result = parentNode.Add(parentNode.project, filePath, after, file, NodeIcons::SelectFileIcon(filePath), !resources);

      if(result)
      {
         if(!isTemporary)
         {
            modifiedDocument = true;
            parentNode.project.topNode.modified = true;
            parentNode.project.ModifiedAllConfigs(true, false, true, true);
         }
         Update(null);
         result.row = parentNode.row.AddRowAfter(after ? after.row : null);
         result.row.tag = (int64)result;
         result.row.SetData(null, result);
      }
      return result;
   }

   CodeEditor CreateNew(char * upper, char * lower, char * base, char * className)
   {
      CodeEditor codeEditor = null;
      ProjectNode projectNode;
      ProjectNode after = null;
      DataRow row = fileList.currentRow;
      ProjectNode parentNode;
      int c;

      if(!row) row = project.topNode.row;

      parentNode = (ProjectNode)row.tag;

      for(node : parentNode.files)
      {
         if(node.type != folder && node.type != file && node.type)
            break;
         after = node;
      }
      for(c = 1; c < 100; c++)
      {
         char string[16];
         sprintf(string, c ? "%s%d.ec" : "%s.ec", lower, c);
         if((projectNode = parentNode.Add(project, string, after, file, genFile, true)))
            break;
      }
      if(projectNode)
      {
         char name[256];
         char filePath[MAX_LOCATION];

         modifiedDocument = true;
         project.topNode.modified = true;
         Update(null);
         project.ModifiedAllConfigs(true, false, false, true);
         projectNode.row = parentNode.row.AddRowAfter(after ? after.row : null);
         projectNode.row.tag =(int64)projectNode;
            
         projectNode.row.SetData(null, projectNode);
         fileList.currentRow = projectNode.row;

         strcpy(filePath, project.topNode.path);
         PathCat(filePath, projectNode.path);
         PathCat(filePath, projectNode.name);

         codeEditor = (CodeEditor)ide.FindWindow(filePath);
         if(!codeEditor)
         {
            Class baseClass = eSystem_FindClass(__thisModule, base);
            subclass(ClassDesignerBase) designerClass = eClass_GetDesigner(baseClass);
            if(designerClass)
            {
               codeEditor = (CodeEditor)ide.OpenFile(filePath, normal, false, null, whatever, normal);
               strcpy(name, projectNode.name);
               sprintf(name, "%s%d", upper, c);
               if(className)
                  strcpy(className, name);

               designerClass.CreateNew(codeEditor.editBox, codeEditor.clientSize, name, base);

               //codeEditor.modifiedDocument = false;
               //codeEditor.designer.modifiedDocument = false;

               //Code_EnsureUpToDate(codeEditor);
            }
         }
         else // TODO: fix no symbols generated when ommiting {} for following else
         {
            codeEditor = (CodeEditor)ide.OpenFile(filePath, normal, false, null, whatever, normal);
         }
         if(codeEditor)
         {
            codeEditor.ViewDesigner();
            codeEditor.codeModified = true;
         }
      }
      visible = false;
      return codeEditor;   
   }

   // Returns true if we opened something
   bool OpenSelectedNodes()
   {
      bool result = false;
      OldList selection;
      OldLink item;

      fileList.GetMultiSelection(selection);
      for(item = selection.first; item; item = item.next)
      {
         DataRow row = item.data;
         ProjectNode node = (ProjectNode)row.tag;
         if(node.type == file)
         {
            OpenNode(node);
            result = true;
            break;
         }
      }
      selection.Free(null);
      return result;
   }

   void RemoveSelectedNodes()
   {
      OldList selection;
      OldLink item, next;
      
      fileList.GetMultiSelection(selection);

      // Remove children of parents we're deleting
      for(item = selection.first; item; item = next)
      {
         OldLink i;
         DataRow row = item.data;
         ProjectNode n, node = (ProjectNode)row.tag;
         bool remove = false;

         next = item.next;
         for(i = selection.first; i && !remove; i = i.next)
         {
            ProjectNode iNode = (ProjectNode)((DataRow)i.data).tag;
            for(n = node.parent; n; n = n.parent)
            {
               if(iNode == n)
               {
                  remove = true;
                  break;
               }
            }
         }
         if(remove)
            selection.Delete(item);
      }

      for(item = selection.first; item; item = item.next)
      {
         DataRow row = item.data;
         ProjectNode node = (ProjectNode)row.tag;
         ProjectNode resNode;
         for(resNode = node.parent; resNode; resNode = resNode.parent)
            if(resNode.type == resources)
               break;
         if(node.type == file)
         {
            Project prj = node.project;
            DeleteNode(node);
            modifiedDocument = true;
            prj.topNode.modified = true;
            Update(null);
            prj.ModifiedAllConfigs(true, false, true, true);
         }
         else if(node.type == folder)
         {
            char message[1024];
            sprintf(message, $"Are you sure you want to remove the folder \"%s\"\n"
                  "and all of its contents from the project?", node.name);
            if(MessageBox { master = ide, type = yesNo, text = $"Delete Folder", contents = message }.Modal() == yes)
            {
               Project prj = node.project;
               if(node.containsFile)
                  prj.ModifiedAllConfigs(true, false, true, true);
               DeleteNode(node);
               modifiedDocument = true;
               prj.topNode.modified = true;
            }
         }
         else if(node.type == project && node != project.topNode && !buildInProgress)
         {
            char message[1024];
            Project prj = null;
            for(p : workspace.projects)
            {
               if(p.topNode == node)
               {
                  prj = p;
                  break;
               }
            }
            sprintf(message, $"Are you sure you want to remove the \"%s\" project\n" "from this workspace?", node.name);
            if(MessageBox { master = ide, type = yesNo, text = $"Remove Project", contents = message }.Modal() == yes)
            {
               // THIS GOES FIRST!
               DeleteNode(node);
               if(prj)
                  workspace.RemoveProject(prj);
               //modifiedDocument = true; // when project view is a workspace view
            }
         }
      }
      selection.Free(null);
   }
}
