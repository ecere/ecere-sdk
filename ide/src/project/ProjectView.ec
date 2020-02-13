import "ide"

import "FileSystemIterator"

class ImportFolderFSI : NormalFileSystemIterator
{
   ProjectView projectView;
   Array<ProjectNode> stack { };

   bool OnFolder(const char * folderPath)
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

   void OutFolder(const char * folderPath, bool isRoot)
   {
      stack.lastIterator.Remove(); //stack.Remove();
   }

   bool OnFile(const char * filePath)
   {
      ProjectNode parentNode = stack.lastIterator.data;
      if(!projectView.AddFile(parentNode, filePath, parentNode.isInResources, false))
      {
         char * msg = PrintString($"This file can't be imported due to a conflict.\n\n", filePath,
               "\n\nThis occurs with identical file paths and with conflicting file names.\n");
         MessageBox { master = ide, type = ok, text = "Import File Conflict", contents = msg }.Modal();
         delete msg;
      }
      return true;
   }
}

static Array<FileFilter> fileFilters
{ [
   { $"eC/C/C++ Files (*.ec, *.eh, *.c, *.cpp, *.cc, *.cxx, *.h, *.hpp, *.hh, *.hxx)", "ec, eh, c, cpp, cc, cxx, h, hpp, hh, hxx" },
   { $"eC/C/C++ Source Files (*.ec, *.c, *.cpp, *.cc, *.cxx)", "ec, eh, c, cpp, cc, cxx" },
   { $"Header Files for eC/C/C++ (*.eh, *.h, *.hpp, *.hh, *.hxx)", "eh, h, hpp, hh, hxx" },
   { $"Objective-C Source Files (*.m, *.mm)", "m, mm" },
   { $"GLSL Source Files (*.glsl, *.vert, *.frag)", "glsl, vert, frag" },
   { $"Python Source Files (*.py)", "py" },
   { $"Java Source Files (*.java)", "java" },
   { $"C# Source Files (*.cs)", "cs" },
   { $"Rust Source Files (*.rs)", "rs" },
   { $"Go Source Files (*.go)", "go" },
   { $"Ruby Source Files (*.rb)", "rb" },
   { $"JavaScript Source Files (*.js)", "js" },
   { $"PHP Source Files (*.php)", "php" },
   { $"Bison & Flex Source Files (*.y, *.l)", "y, l" },
   { $"Source Files (*.ec, *.eh, *.c, *.cpp, *.cc, *.cxx, *.h, *.hpp, *.hh, *.hxx, *.m, *.mm, *.frag, *.glsl, *.vert, *.py, *.java, *.cs, *.go, *.rs, *.swift, *.js, *.php, *.y, *.l)",
      "ec, eh, c, cpp, cc, cxx, h, hpp, hh, hxx, py, java, cs, js, go, rs, swift, php, m, mm, frag, glsl, vert, y, l" },
   { $"Swift Source Files (*.swift)", "swift" },
   { $"All files", null }
] };

static Array<FileFilter> resourceFilters
{ [
   { $"Image Files (*.jpg, *.jpeg, *.bmp, *.pcx, *.png, *.gif)", "jpg, jpeg, bmp, pcx, png, gif" },
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

static const char * iconNames[] =
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
enum BuildType { build, rebuild, relink, run, start, restart, clean, install };
enum BuildState
{
   none, buildingMainProject, buildingSecondaryProject, compilingFile;

   property bool { get { return this != none; } }
   //property bool actualBuild { get { return this == buildingMainProject || this == buildingSecondaryProject;  } }
};
enum BuildOutputMode { normal, raw, verbose, justPrint }; // note: verbose and justPrint both imply raw output
Array<const String> bldMnuStrBuild
{[
   $"Build",
   $"Build (Raw Output)",
   $"Build (Verbose)",
   $"Build (Just Print Commands)"
]};
Array<const String> bldMnuStrRelink
{[
   $"Relink",
   $"Relink (Raw Output)",
   $"Relink (Verbose)",
   $"Relink (Just Print Commands)"
]};
Array<const String> bldMnuStrRebuild
{[
   $"Rebuild",
   $"Rebuild (Raw Output)",
   $"Rebuild (Verbose)",
   $"Rebuild (Just Print Commands)"
]};
Array<const String> bldMnuStrCleanTarget
{[
   $"Clean Target",
   $"Clean Target (Raw Output)",
   $"Clean Target (Verbose)",
   $"Clean Target (Just Print Commands)"
]};
Array<const String> bldMnuStrClean
{[
   $"Clean",
   $"Clean (Raw Output)",
   $"Clean (Verbose)",
   $"Clean (Just Print Commands)"
]};
Array<const String> bldMnuStrRealClean
{[
   $"Real Clean",
   $"Real Clean (Raw Output)",
   $"Real Clean (Verbose)",
   $"Real Clean (Just Print Commands)"
]};
Array<const String> bldMnuStrCompile
{[
   $"Compile",
   $"Compile (Raw Output)",
   $"Compile (Verbose)",
   $"Compile (Just Print Commands)"
]};

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

      background = colorScheme.projectViewBackground;
      foreground = colorScheme.projectViewText;
      selectionColor = colorScheme.selectionColor, selectionText = colorScheme.selectionText;
      stippleColor = skyBlue;

      bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
      {
         if(!active) Update(null);
         return ListBox::OnActivate(active, previous, goOnWithActivation, direct);
      }

      bool NotifyDoubleClick(ListBox listBox, int x, int y, Modifiers mods)
      {
         // Prevent the double click from reactivating the project view (returns false if we opened something)
         return !OpenSelectedNodes(mods.ctrl && mods.shift);
      }

      bool NotifyRightClick(ListBox listBox, int x, int y, Modifiers mods)
      {
         DataRow row = listBox.currentRow;
         if(row)
         {
            bool showDebuggingMenuItems = mods.ctrl && mods.shift;
            bool showInstallMenuItem = mods.ctrl && mods.shift;
            BuildOutputMode outputMode = (mods.ctrl && mods.shift) ? justPrint : mods.ctrl ? verbose : mods.shift ? raw : normal;
            ProjectNode node = (ProjectNode)(intptr)row.tag;
#ifdef IDE_SHOW_INSTALL_MENU_BUTTON
            showInstallMenuItem = true;
#endif
            if(node.type == NodeTypes::project || node.type == resources || node.type == file || node.type == folder)
            {
               bool na = buildInProgress; // N/A - buildMenuUnavailable
               Menu pop { };

               if(node.type == NodeTypes::project)
               {
                  MenuItem mi;
                                                                                                                                                                        mi = ide.projectBuildItem;
                  MenuItem { pop, bldMnuStrBuild[outputMode]      , b, f7     , id = outputMode, NotifySelect = ProjectBuild      , bitmap = mi.bitmap }.disabled = na; mi = ide.projectLinkItem;
                  MenuItem { pop, bldMnuStrRelink[outputMode]     , l         , id = outputMode, NotifySelect = ProjectLink       , bitmap = mi.bitmap }.disabled = na; mi = ide.projectRebuildItem;
                  MenuItem { pop, bldMnuStrRebuild[outputMode]    , r, shiftF7, id = outputMode, NotifySelect = ProjectRebuild    , bitmap = mi.bitmap }.disabled = na; mi = ide.projectCleanTargetItem;
                  MenuItem { pop, bldMnuStrCleanTarget[outputMode], g         , id = outputMode, NotifySelect = ProjectCleanTarget, bitmap = mi.bitmap }.disabled = na; mi = ide.projectCleanItem;
                  MenuItem { pop, bldMnuStrClean[outputMode]      , c         , id = outputMode, NotifySelect = ProjectClean      , bitmap = mi.bitmap }.disabled = na; mi = ide.projectRealCleanItem;
                  MenuItem { pop, bldMnuStrRealClean[outputMode]              , id = outputMode, NotifySelect = ProjectRealClean  , bitmap = mi.bitmap }.disabled = na; mi = ide.projectRegenerateItem;
                  MenuItem { pop, $"Regenerate Makefile"          , m                          , NotifySelect = ProjectRegenerate , bitmap = mi.bitmap }.disabled = na;
                  if(showInstallMenuItem)
                  {
                     mi = ide.projectInstallItem;
                     MenuItem { pop, $"Install"            , t         , NotifySelect = ProjectInstall    , bitmap = mi.bitmap }.disabled = na;
                  }
                  if(showDebuggingMenuItems && node.ContainsFilesWithExtension("ec", node.project.config))
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
                  MenuItem { pop, $"Browse Folder(s)", w, NotifySelect = MenuBrowseFolder };
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
                  MenuItem { pop, $"Browse Folder(s)", w, NotifySelect = MenuBrowseFolder };
                  MenuDivider { pop };
                  MenuItem { pop, $"Settings...", s, Key { f7, alt = true } , NotifySelect = MenuSettings };
                  MenuItem { pop, $"Properties...", p, Key { enter, alt = true }, NotifySelect = FileProperties };
               }
               else if(node.type == file)
               {
                  MenuItem { pop, $"Open", o, NotifySelect = FileOpenFile };
                  MenuDivider { pop };
                  MenuItem { pop, bldMnuStrClean[outputMode], l, id = outputMode, NotifySelect = FileClean, bitmap = ide.projectCleanItem.bitmap }.disabled = na;
                  MenuItem { pop, bldMnuStrCompile[outputMode], c, Key { f7, ctrl = true}, id = outputMode, NotifySelect = FileCompile, bitmap = ide.projectBuildItem.bitmap }.disabled = na;
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
                  MenuItem { pop, $"Browse Folder(s)", w, NotifySelect = MenuBrowseFolder };
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
                  MenuItem { pop, bldMnuStrClean[outputMode], l, id = outputMode, NotifySelect = FileClean, bitmap = ide.projectCleanItem.bitmap }.disabled = na;
                  MenuItem { pop, bldMnuStrCompile[outputMode], c, Key { f7, ctrl = true}, id = outputMode, NotifySelect = FileCompile, bitmap = ide.projectBuildItem.bitmap }.disabled = na;
                  MenuDivider { pop };
                  MenuItem { pop, $"Remove", r, NotifySelect = FileRemoveFile };
                  MenuDivider { pop };
                  MenuItem { pop, $"Browse Folder(s)", w, NotifySelect = MenuBrowseFolder };
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
               ide.rightClickMenuBuildOutputMode = outputMode;
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
            ProjectNode node = (ProjectNode)(intptr)row.tag;
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
               case ctrlL:
               {
                  if(node.type == project || node.type == folder || node.type == resources)
                  {
                     ProjectNewFile(null, 0);
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
               case Key { space, false, true }:
               case Key { space, true, true }:
               case Key { space, true }:
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
                     prj.RotateActiveConfig(!key.shift, key.ctrl);
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
            case Key { enter, true, true }:        OpenSelectedNodes(true);   break;
            case Key { keyPadEnter, true, true }:  OpenSelectedNodes(true);   break;
            case enter: case keyPadEnter:          OpenSelectedNodes(false);  break;
            case del:                              RemoveSelectedNodes();     break;
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
         ProjectNode node = (ProjectNode)(intptr)row.tag;
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

      ide.outputView.buildClear();
      ide.outputView.debugBox.Clear();
      //ide.outputView.findBox.Clear();
      ide.callStackView.Clear();
      ide.watchesView.Clear();
      ide.threadsView.Clear();
      ide.breakpointsView.Clear();
      ide.outputView.ShowClearSelectTab(find); // why this?
   }

   bool OnSaveFile(const char * fileName)
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

   bool IsModuleInProject(const char * filePath)
   {
      char moduleName[MAX_FILENAME]; //, modulePath[MAX_LOCATION];
      GetLastDirectory(filePath, moduleName);
      return project.topNode.Find(moduleName, false) != null;
   }

   ProjectNode GetNodeForCompilationFromWindow(Window document, bool nonExcludedFirst, bool * isExcluded, bool * isCObject)
   {
      ProjectNode node = null;
      if(nonExcludedFirst)
         node = GetNodeFromWindow(document, null, false, false, isExcluded);
      if(!node)
         node = GetNodeFromWindow(document, null, true, false, isExcluded);
      if(!node && nonExcludedFirst)
      {
         node = GetNodeFromWindow(document, null, false, true, isExcluded);
         if(isCObject && node) *isCObject = true;
      }
      if(!node)
      {
         node = GetNodeFromWindow(document, null, true, true, isExcluded);
         if(isCObject && node) *isCObject = true;
      }
      return node;
   }

   ProjectNode GetNodeFromWindow(Window document, Project project, bool allNodes, bool isCObject, bool * isNodeExcluded)
   {
      ProjectNode node = null;
      if(document.fileName)
      {
         bool excluded = false;
         char winFileName[MAX_LOCATION];
         char * documentFileName = GetSlashPathBuffer(winFileName, document.fileName);
         Project prj;
         ProjectNode n;
         if(isCObject)
         {
            char name[MAX_FILENAME];
            GetLastDirectory(documentFileName, name);
            ChangeExtension(name, "ec", name);
            for(p : ide.workspace.projects)
            {
               prj = project ? project : p;
               if((n = prj.topNode.Find(name, false)))
               {
                  if(allNodes || !(excluded = n.GetIsExcluded(prj.config)))
                  {
                     node = n;
                     break;
                  }
               }
               if(project) break;
            }
         }
         else
         {
            for(p : ide.workspace.projects)
            {
               prj = project ? project : p;
               if((n = prj.topNode.FindByFullPath(documentFileName, false)))
               {
                  if(allNodes || !(excluded = n.GetIsExcluded(prj.config)))
                  {
                     node = n;
                     break;
                  }
               }
               if(project) break;
            }
         }
         if(node && isNodeExcluded)
            *isNodeExcluded = excluded;
      }
      return node;
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
      ShowOutputBuildLog(cleanLog);

      if(displayCompiler)
         DisplayCompiler(compiler, false);

      ProjectPrepareCompiler(project, compiler, false);
      ProjectPrepareMakefile(project, method, compiler, config);
      return true;
   }

   bool ProjectPrepareCompiler(Project project, CompilerConfig compiler, bool silent)
   {
      if((!project.GenerateCrossPlatformMk(app.includeFile) ||
            !project.GenerateCompilerCf(compiler, project.topNode.ContainsFilesWithExtension("ec", project.config))) && !silent)
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
            const char * reason;
            const char * action;
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

   bool BuildInterrim(Project prj, BuildType buildType, CompilerConfig compiler, ProjectConfig config, int bitDepth, BuildOutputMode outputMode)
   {
      if(ProjectPrepareForToolchain(prj, normal, true, true, compiler, config))
      {
         ide.outputView.buildBox.Logf($"Building project %s using the %s configuration...\n", prj.name, GetConfigName(config));
         return Build(prj, buildType, compiler, config, bitDepth, outputMode);
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
      app.ProcessInput(true);
      ShowOutputBuildLog(false);
      return result;
   }

   bool Build(Project prj, BuildType buildType, CompilerConfig compiler, ProjectConfig config, int bitDepth, BuildOutputMode outputMode)
   {
      bool result = true;
      Window document;

      stopBuild = false;
      for(document = master.firstChild; document; document = document.next)
      {
         if(document.modifiedDocument)
         {
            ProjectNode node = GetNodeFromWindow(document, prj, true, false, null);
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
            prj.Clean(compiler, config, bitDepth, clean, outputMode);
         else
         {
            if(buildType == relink || (config && config.linkingModified))
               prj.Clean(compiler, config, bitDepth, cleanTarget, outputMode);
            if(config && config.symbolGenModified)
            {
               DirExpression objDir = prj.GetObjDir(compiler, config, bitDepth);
               char fileName[MAX_LOCATION];
               char moduleName[MAX_FILENAME];
               strcpy(fileName, prj.topNode.path);
               PathCatSlash(fileName, objDir.dir);
               ReplaceSpaces(moduleName, prj.moduleName);
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

         result = prj.Build(buildType, null, compiler, config, bitDepth, outputMode, normal);

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
      BuildOutputMode mode = selection ? (BuildOutputMode)selection.id : normal;
      if(buildInProgress == none)
      {
         Project prj = project;
         CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
         int bitDepth = ide.workspace.bitDepth;
         ProjectConfig config;
         if(selection || !ide.activeClient)
         {
            DataRow row = fileList.currentRow;
            ProjectNode node = row ? (ProjectNode)(intptr)row.tag : null;
            if(node) prj = node.project;
         }
         else
         {
            ProjectNode node = GetNodeForCompilationFromWindow(ide.activeClient, true, null, null);
            if(node)
               prj = node.project;
         }
         config = prj.config;
         if(/*prj != project || */!prj.GetConfigIsInDebugSession(config) || !ide.DontTerminateDebugSession($"Project Build"))
         {
            BuildInterrim(prj, build, compiler, config, bitDepth, mode);
         }
         delete compiler;
      }
      else
         stopBuild = true;
      return true;
   }

   bool ProjectInstall(MenuItem selection, Modifiers mods)
   {
      Project prj = project;
      CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
      int bitDepth = ide.workspace.bitDepth;
      BuildOutputMode mode = selection ? (BuildOutputMode)selection.id : normal;
      ProjectConfig config;
      if(selection || !ide.activeClient)
      {
         DataRow row = fileList.currentRow;
         ProjectNode node = row ? (ProjectNode)(intptr)row.tag : null;
         if(node) prj = node.project;
      }
      else
      {
         ProjectNode node = GetNodeFromWindow(ide.activeClient, null, true, false, null);
         if(node)
            prj = node.project;
      }
      config = prj.config;
      if(!prj.GetConfigIsInDebugSession(config) ||
            (!ide.DontTerminateDebugSession($"Project Install") && DebugStopForMake(prj, relink, compiler, config)))
      {
         BuildInterrim(prj, build, compiler, config, bitDepth, mode);
         if(ProjectPrepareForToolchain(prj, normal, false, false, compiler, config))
         {
            ide.outputView.buildBox.Logf($"\nInstalling project %s using the %s configuration...\n", prj.name, GetConfigName(config));
            Build(prj, install, compiler, config, bitDepth, mode);
         }
      }
      delete compiler;
      return true;
   }

   bool ProjectLink(MenuItem selection, Modifiers mods)
   {
      Project prj = project;
      CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
      int bitDepth = ide.workspace.bitDepth;
      BuildOutputMode mode = selection ? (BuildOutputMode)selection.id : normal;
      ProjectConfig config;
      if(selection || !ide.activeClient)
      {
         DataRow row = fileList.currentRow;
         ProjectNode node = row ? (ProjectNode)(intptr)row.tag : null;
         if(node) prj = node.project;
      }
      else
      {
         ProjectNode node = GetNodeFromWindow(ide.activeClient, null, true, false, null);
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
            Build(prj, relink, compiler, config, bitDepth, mode);
         }
      }
      delete compiler;
      return true;
   }

   bool ProjectRebuild(MenuItem selection, Modifiers mods)
   {
      CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
      int bitDepth = ide.workspace.bitDepth;
      Project prj = project;
      BuildOutputMode mode = selection ? (BuildOutputMode)selection.id : normal;
      ProjectConfig config;
      if(selection || !ide.activeClient)
      {
         DataRow row = fileList.currentRow;
         ProjectNode node = row ? (ProjectNode)(intptr)row.tag : null;
         if(node) prj = node.project;
      }
      else
      {
         ProjectNode node = GetNodeFromWindow(ide.activeClient, null, true, false, null);
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
            Build(prj, rebuild, compiler, config, bitDepth, mode);
         }
      }
      delete compiler;
      return true;
   }

   bool ProjectCleanTarget(MenuItem selection, Modifiers mods)
   {
      BuildOutputMode mode = selection ? (BuildOutputMode)selection.id : normal;
      CleanProject($"Project Clean Target", $"Cleaning project %s target using the %s configuration...\n", selection, cleanTarget, mode);
      return true;
   }

   bool ProjectClean(MenuItem selection, Modifiers mods)
   {
      BuildOutputMode mode = selection ? (BuildOutputMode)selection.id : normal;
      CleanProject($"Project Clean", $"Cleaning project %s using the %s configuration...\n", selection, clean, mode);
      return true;
   }

   bool ProjectRealClean(MenuItem selection, Modifiers mods)
   {
      BuildOutputMode mode = selection ? (BuildOutputMode)selection.id : normal;
      CleanProject($"Project Real Clean", $"Removing intermediate objects directory for project %s using the %s configuration...\n", selection, realClean, mode);
      return true;
   }

   void CleanProject(const char * terminateDebugSessionMessage, const char * cleaningMessageLogFormat, MenuItem selection, CleanType cleanType, BuildOutputMode outputMode)
   {
      Project prj = project;
      Array<Project> projects { };
      CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
      int bitDepth = ide.workspace.bitDepth;
      if(selection)
      {
         OldLink item;
         OldList selectedRows;
         fileList.GetMultiSelection(selectedRows);
         for(item = selectedRows.first; item; item = item.next)
         {
            DataRow row = item.data;
            ProjectNode node = (ProjectNode)(intptr)row.tag;
            if(node.type == project)
               projects.Add(node.project);
         }
         selectedRows.Free(null);
      }
      if(selection || !ide.activeClient)
      {
         DataRow row = fileList.currentRow;
         ProjectNode node = row ? (ProjectNode)(intptr)row.tag : null;
         if(node) prj = node.project;
         if(projects.count == 0)
            projects.Add(prj);
      }
      else
      {
         // TODO: a file can belong to more than one project, ask which one to clean
         ProjectNode node = GetNodeFromWindow(ide.activeClient, null, true, false, null);
         if(node) prj = node.project;
         if(projects.count == 0)
            projects.Add(prj);
      }
      for(prj : projects)
      {
         ProjectConfig config = prj.config;
         if(!prj.GetConfigIsInDebugSession(config) ||
               (!ide.DontTerminateDebugSession(terminateDebugSessionMessage) && DebugStopForMake(prj, clean, compiler, config)))
         {
            if(ProjectPrepareForToolchain(prj, normal, true, true, compiler, config))
            {
               ide.outputView.buildBox.Logf(cleaningMessageLogFormat, prj.name, GetConfigName(config));

               buildInProgress = prj == project ? buildingMainProject : buildingSecondaryProject;
               ide.AdjustBuildMenus();
               ide.AdjustDebugMenus();

               prj.Clean(compiler, config, bitDepth, cleanType, outputMode);
               buildInProgress = none;
               ide.AdjustBuildMenus();
               ide.AdjustDebugMenus();
            }
         }
      }
      delete compiler;
      delete projects;
   }

   bool ProjectRegenerate(MenuItem selection, Modifiers mods)
   {
      Project prj = project;
      CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
      ShowOutputBuildLog(true);
      if(selection || !ide.activeClient)
      {
         DataRow row = fileList.currentRow;
         ProjectNode node = row ? (ProjectNode)(intptr)row.tag : null;
         if(node)
            prj = node.project;
      }
      else
      {
         ProjectNode node = GetNodeFromWindow(ide.activeClient, null, true, false, null);
         if(node)
            prj = node.project;
      }

      DisplayCompiler(compiler, false);
      ProjectPrepareCompiler(project, compiler, false);
      ProjectPrepareMakefile(prj, force, compiler, prj.config);
      delete compiler;
      return true;
   }

   bool Compile(Project project, List<ProjectNode> nodes, BuildOutputMode outputMode, SingleFileCompileMode mode)
   {
      bool result = true;
      Window document;
      ProjectConfig config = project.config;

      stopBuild = false;

      for(document = ide.firstChild; document; document = document.next)
      {
         if(document.modifiedDocument)
         {
            ProjectNode n = GetNodeFromWindow(document, project, true, mode == cObject ? true : false, null);
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
         CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
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
            result = project.Compile(nodes, compiler, config, bitDepth, outputMode, mode);
            buildInProgress = none;
            ide.AdjustBuildMenus();
         }
         delete compiler;
      }
      return result;
   }

   bool Clean(Project project, List<ProjectNode> nodes)
   {
      bool result = true;
      Window document;
      ProjectConfig config = project.config;

      stopBuild = false;

      for(document = ide.firstChild; document; document = document.next)
      {
         if(document.modifiedDocument)
         {
            ProjectNode n = GetNodeFromWindow(document, project, true, false, null);
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
         CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
         int bitDepth = ide.workspace.bitDepth;
         result = false;
         if(ProjectPrepareForToolchain(project, normal, true, true, compiler, config))
         {
            Map<CIString, NameCollisionInfo> namesInfo { };
            project.topNode.GenMakefileGetNameCollisionInfo(namesInfo, config);
            for(node : nodes)
            {
               if(node.GetIsExcluded(config))
                  ide.outputView.buildBox.Logf($"File %s is excluded from current build configuration.\n", node.name);
               else
               {
                  if(config)
                     ide.outputView.buildBox.Logf($"Deleting intermediate objects for %s %s in project %s using the %s configuration...\n",
                           node.type == file ? $"single file" : $"folder", node.name, project.name, config.name);
                  else
                     ide.outputView.buildBox.Logf($"Deleting intermediate objects for %s %s in project %s...\n",
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
         ProjectNode parentNode = (ProjectNode)(intptr)row.tag;
         ProjectNode n, fileNode;
         parentNode.GetFileSysMatchingPath(filePath);
         MakePathRelative(filePath, parentNode.project.topNode.path, filePath);
         for(n = parentNode; n && n != parentNode.project.resNode; n = n.parent);
         sprintf(fileName, $"Untitled %d", documentID);
         fileNode = AddFile(parentNode, fileName, n != null, true);
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
         ProjectNode parentNode = (ProjectNode)(intptr)row.tag;
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
         ProjectNode toNode = (ProjectNode)(intptr)row.tag;
         ImportFolder(toNode);
      }
      return true;
   }

   bool ProjectAddNewForm(MenuItem selection, Modifiers mods)
   {
      CodeEditor codeEditor = CreateNew("Form", "form", "Window", null);
      codeEditor.EnsureUpToDate();
      ide.RepositionWindows(false);
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
         ProjectNode node = (ProjectNode)(intptr)row.tag;
         if(node.type == project)
            RemoveSelectedNodes();
      }
      return true;
   }

   bool ProjectUpdateMakefileForAllConfigs(Project project)
   {
      CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);

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
         ProjectNode node = (ProjectNode)(intptr)row.tag;
         NodeProperties { parent = parent, master = this, node = node,
               position = { position.x + 100, position.y + 100 } }.Create();
      }
      return true;
   }

   bool FileOpenFile(MenuItem selection, Modifiers mods)
   {
      OpenSelectedNodes(mods.ctrl && mods.shift);
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
      BuildOutputMode mode = selection ? (BuildOutputMode)selection.id : normal;
      List<ProjectNode> nodes { };
      fileList.GetMultiSelection(selectedRows);
      for(item = selectedRows.first; item; item = item.next)
      {
         DataRow row = item.data;
         ProjectNode node = (ProjectNode)(intptr)row.tag;
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
         Compile(project, nodes, mode, normal);
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
         DataRow row = item.data;
         ProjectNode node = (ProjectNode)(intptr)row.tag;
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
         Clean(project, nodes);
      else
         ide.outputView.buildBox.Logf($"Please select files from a single project.\n");
      delete nodes;
      return true;
   }

   bool FileDebugPrecompile(MenuItem selection, Modifiers mods)
   {
      DataRow row = fileList.currentRow;
      ProjectNode node = row ? (ProjectNode)(intptr)row.tag : null;
      BuildOutputMode mode = selection ? (BuildOutputMode)selection.id : normal;
      if(node)
      {
         List<ProjectNode> nodes { };
         nodes.Add(node);
         if(node.type == project)
            ProjectBuild(selection, mods);
         ide.Update(null);
         if(!stopBuild)
            Compile(node.project, nodes, mode, debugPrecompile);
         delete nodes;
      }
      return true;
   }

   bool FileDebugCompile(MenuItem selection, Modifiers mods)
   {
      DataRow row = fileList.currentRow;
      ProjectNode node = row ? (ProjectNode)(intptr)row.tag : null;
      BuildOutputMode mode = selection ? (BuildOutputMode)selection.id : normal;
      if(node)
      {
         List<ProjectNode> nodes { };
         nodes.Add(node);
         if(node.type == project)
            ProjectBuild(selection, mods);
         else
            Compile(node.project, nodes, mode, normal);
         if(!stopBuild)
            Compile(node.project, nodes, mode, debugCompile);
         delete nodes;
      }
      return true;
   }

   bool FileDebugGenerateSymbols(MenuItem selection, Modifiers mods)
   {
      DataRow row = fileList.currentRow;
      ProjectNode node = row ? (ProjectNode)(intptr)row.tag : null;
      BuildOutputMode mode = selection ? (BuildOutputMode)selection.id : normal;
      if(node)
      {
         List<ProjectNode> nodes { };
         nodes.Add(node);
         if(node.type == project)
            ProjectBuild(selection, mods);
         else
            Compile(node.project, nodes, mode, normal);
         if(!stopBuild)
            Compile(node.project, nodes, mode, debugGenerateSymbols);
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
         ProjectNode node = row ? (ProjectNode)(intptr)row.tag : null;
         if(node)
            prj = node.project;
      }
      return prj;
   }

   void SelectNextProject(bool backwards)
   {
      DataRow row = fileList.currentRow;
      if(!row)
         row = backwards ? fileList.lastRow : fileList.firstRow;

      if(row)
      {
         DataRow currentRow = row;
         ProjectNode node = (ProjectNode)(intptr)row.tag;
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
   }

   ProjectNode GetSelectedNode(bool useSelection)
   {
      ProjectNode node = null;
      if(useSelection)
      {
         DataRow row = fileList.currentRow;
         if(row)
            node = (ProjectNode)(intptr)row.tag;
      }
      return node;
   }

   bool MenuBrowseFolder(MenuItem selection, Modifiers mods)
   {
      char filePath[MAX_LOCATION];
      AVLTree<String> folders { };
      OldList selected;
      OldLink item;

      fileList.GetMultiSelection(selected);
      for(item = selected.first; item; item = item.next)
      {
         DataRow row = item.data;
         ProjectNode node = (ProjectNode)(intptr)row.tag;
         node.GetFullFilePath(filePath, true, true);
         while(!FileExists(filePath).isDirectory)
         {
            StripLastDirectory(filePath, filePath);
            if(filePath[0] == '\0')
               break;
         }
         if(filePath[0] != '\0')
            folders.Add(CopyString(filePath));
      }
      selected.Free(null);
      if(folders.count)
      {
         for(e : folders)
            ShellOpen(e);
         folders.Free();
      }
      else
      {
         MessageBox { master = ide, type = ok, text = $"Browse Folder(s)", contents = $"Couldn't open any folder." }.Modal();
      }
      delete folders;
      return true;
   }

   bool Run(MenuItem selection, Modifiers mods)
   {
      CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
      ProjectConfig config = project.config;
      int bitDepth = ide.workspace.bitDepth;
      bool shellOpen = compiler.hasDocumentOutput;
      String args = new char[maxPathLen];
      args[0] = '\0';
      if(ide.workspace.commandLineArgs)
         //ide.debugger.GetCommandLineArgs(args);
         strcpy(args, ide.workspace.commandLineArgs);
      if(ide.debugger.isActive)
         project.Run(args, compiler, config, bitDepth, shellOpen);
      /*else if(config.targetType == sharedLibrary || config.targetType == staticLibrary)
         MessageBox { master = ide, type = ok, text = "Run", contents = "Shared and static libraries cannot be run like executables." }.Modal();*/
      else if(BuildInterrim(project, run, compiler, config, bitDepth, normal))
         project.Run(args, compiler, config, bitDepth, shellOpen);
      delete args;
      delete compiler;
      return true;
   }

   bool DebugStart()
   {
      bool result = false;
      CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
      ProjectConfig config = project.config;
      int bitDepth = ide.workspace.bitDepth;
      bool useValgrind = ide.workspace.useValgrind;
      TargetTypes targetType = project.GetTargetType(config);
      if(targetType == sharedLibrary || targetType == staticLibrary)
         MessageBox { master = ide, type = ok, text = $"Run", contents = $"Shared and static libraries cannot be run like executables." }.Modal();
      else if(project.GetCompress(config))
         MessageBox { master = ide, text = $"Starting Debug", contents = $"Debugging compressed applications is not supported\n" }.Modal();
      else if(project.GetDebug(config) ||
         MessageBox { master = ide, type = okCancel, text = $"Starting Debug", contents = $"Attempting to debug non-debug configuration\nProceed anyways?" }.Modal() == ok)
      {
         if(/*!IsProjectModified() ||*/ BuildInterrim(project, start, compiler, config, bitDepth, normal))
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
            else if(compiler.hasDocumentOutput)
            {
               project.Run("", compiler, config, bitDepth, true);
            }
            else
            {
               ide.debugger.Start(compiler, config, bitDepth, useValgrind);
               result = true;
            }
         }
      }
      delete compiler;
      return result;
   }

   void GoToError(const char * line, bool openAsText, bool noParsing, const char * objectFileExt)
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
#if 0 // MSVS Errors -- todo fix this later
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
#endif
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
            char moduleName[MAX_LOCATION], filePath[MAX_LOCATION] = "";
            char ext[MAX_EXTENSION] = "";
            ProjectNode node = null;
            if(colon)
            {
               const char * inFileIncludedFrom = strstr(line, stringInFileIncludedFrom);
               const char * from = strstr(line, "from ");
               const char * start = inFileIncludedFrom ? inFileIncludedFrom + strlen(stringInFileIncludedFrom) : from ? from + strlen("from ") : line;
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

            if(!colon)
            {
               char * msg;
               if((msg = strstr(moduleName, " - ")))
               {
                  bool found = false;
                  msg[0] = '\0';
                  for(prj : ide.workspace.projects)
                  {
                     strcpy(filePath, prj.topNode.path);
                     PathCatSlash(filePath, moduleName);
                     if(FileExists(filePath).isFile)
                     {
                        found = true;
                        break;
                     }
                  }
                  if(!found)
                  {
                     msg[0] = ' ';
                     filePath[0] = '\0';
                  }
               }
               else if((msg = strstr(moduleName, "...")) && (colon = strchr(moduleName, ' ')) && (++colon)[0])
               {
                  bool found = false;
                  msg[0] = '\0';
                  for(prj : ide.workspace.projects)
                  {
                     if((node = prj.resNode.Find(colon, true)))
                     {
                        strcpy(filePath, prj.topNode.path);
                        PathCatSlash(filePath, node.path);
                        PathCatSlash(filePath, node.name);

                        found = true;
                        break;
                     }
                  }
                  if(!found)
                  {
                     msg[0] = '.';
                     filePath[0] = '\0';
                  }
               }
               colon = null;
            }
            // Remove stuff in brackets
            /*
            bracket = strstr(moduleName, "(");
            if(bracket) *bracket = '\0';
            */
            MakeSlashPath(moduleName);
            GetExtension(moduleName, ext);

            if(!colon && !filePath[0])
            {
               // Check if it's one of our modules
               node = project.topNode.Find(moduleName, false);
               if(node)
               {
                  strcpy(filePath, node.path);
                  PathCatSlash(filePath, node.name);
               }
               else
               {
                  char ext[MAX_EXTENSION];
                  GetExtension(moduleName, ext);
                  {
                     DotMain dotMain = DotMain::FromFileName(moduleName);
                     IntermediateFileType type = IntermediateFileType::FromExtension(ext);
                     ProjectConfig config = null;
                     if(type)
                     {
                        for(prj : ide.workspace.projects; prj.lastBuildConfigName)
                        {
                           if((config = prj.GetConfig(prj.lastBuildConfigName)))
                              node = prj.FindNodeByObjectFileName(moduleName, type, dotMain, config, objectFileExt);
                           if(node)
                              break;
                        }
                     }
                     if(node)
                     {
                        char name[MAX_FILENAME];
                        Project project = node.project;
                        CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(project.lastBuildCompilerName);
                        if(compiler)
                        {
                           int bitDepth = ide.workspace.bitDepth;
                           const char * objectFileExt = compiler ? compiler.objectFileExt : objectDefaultFileExt;
                           DirExpression objDir = project.GetObjDir(compiler, config, bitDepth);
                           strcpy(filePath, project.topNode.path);
                           PathCatSlash(filePath, objDir.dir);
                           node.GetObjectFileName(name, project.configsNameCollisions[config ? config.name : ""], type, dotMain, objectFileExt);
                           PathCatSlash(filePath, name);
                           delete objDir;
                        }
                        delete compiler;
                     }
                  }
               }
               if(!node)
                  filePath[0] = '\0';
            }
            if(!strcmp(ext, "a") || !strcmp(ext, "o") || !strcmp(ext, "lib") ||
                  !strcmp(ext, "dll") || !strcmp(ext, "exe") || !strcmp(ext, "mo"))
               moduleName[0] = 0;    // Avoid opening binary files
            if(moduleName[0])
            {
               CodeEditor codeEditor = null;

               if(ide.GoToCodeSelectFile(moduleName, null, project, null, filePath, objectFileExt))
               {
                  codeEditor = (CodeEditor)ide.OpenFile(filePath, false, true, openAsText ? "txt" : null, no, normal, noParsing);
                  ide.RepositionWindows(false);
               }

               if(!codeEditor)
               {
                  if(!filePath[0])
                  {
                     strcpy(filePath, project.topNode.path);
                     PathCatSlash(filePath, moduleName);
                  }

                  codeEditor = (CodeEditor)ide.OpenFile(filePath, false, true, openAsText ? "txt" : null, no, normal, noParsing);
                  if(!codeEditor && !strcmp(ext, "c"))
                  {
                     char ecName[MAX_LOCATION];
                     ChangeExtension(filePath, "ec", ecName);
                     codeEditor = (CodeEditor)ide.OpenFile(ecName, false, true, openAsText ? "txt" : null, no, normal, noParsing);
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
                              node.GetFullFilePath(filePath, true, true);
                              codeEditor = (CodeEditor)ide.OpenFile(filePath, false, true, null, no, normal, noParsing);
                              if(codeEditor)
                                 break;
                           }
                        }
                        if(!codeEditor && (strchr(moduleName, '/') || strchr(moduleName, '\\')))
                        {
                           for(prj : ide.workspace.projects)
                           {
                              ProjectNode node;
                              if((node = prj.topNode.FindWithPath(moduleName, false)))
                              {
                                 node.GetFullFilePath(filePath, true, true);
                                 codeEditor = (CodeEditor)ide.OpenFile(filePath, false, true, null, no, normal, noParsing);
                                 if(codeEditor)
                                    break;
                              }
                           }
                        }
                        if(!codeEditor)
                        {
                           GetLastDirectory(moduleName, moduleName);
                           for(prj : ide.workspace.projects)
                           {
                              ProjectNode node;
                              if((node = prj.topNode.Find(moduleName, false)))
                              {
                                 node.GetFullFilePath(filePath, true, true);
                                 codeEditor = (CodeEditor)ide.OpenFile(filePath, false, true, null, no, normal, noParsing);
                                 if(codeEditor)
                                    break;
                              }
                           }
                        }
                     }
                  }
               }
               if(codeEditor && lineNumber)
               {
                  EditBox editBox = codeEditor.editBox;
                  if(editBox.GoToLineNum(lineNumber - 1))
                     editBox.GoToPosition(editBox.line, lineNumber - 1, col ? (col - 1) : 0);
               }
            }
         }
      }
   }

   bool OpenNode(ProjectNode node, bool noParsing)
   {
      char filePath[MAX_LOCATION];
      char ext[MAX_EXTENSION];
      node.GetFullFilePath(filePath, true, true);

      GetExtension(filePath, ext);
      if(binaryDocExt.Find(ext))
      {
         ShellOpen(filePath);
         return true;
      }
      else
         return ide.OpenFile(filePath, false, true/*false Why was it opening hidden?*/, null, something, normal, noParsing) ? true : false;
   }

   void AddNode(ProjectNode node, DataRow addTo)
   {
      DataRow row = addTo ? addTo.AddRow() : fileList.AddRow();

      row.tag = (int64)(intptr)node;
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
         while((child = projectNode.files.first))
            DeleteNode(child);
      }
      fileList.DeleteRow(projectNode.row);
      projectNode.Delete();
   }

   void updateModified()
   {
      Project modPrj = null;
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
   }

   bool ProjectSave(MenuItem selection, Modifiers mods)
   {
      DataRow row = fileList.currentRow;
      ProjectNode node = row ? (ProjectNode)(intptr)row.tag : null;
      Project prj = node ? node.project : null;
      if(prj)
      {
         prj.StopMonitoring();
         if(prj.Save(prj.filePath))
         {
            prj.topNode.modified = false;
            updateModified();
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
      CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
      ProjectConfig config = project.config;
      int bitDepth = ide.workspace.bitDepth;
      bool useValgrind = ide.workspace.useValgrind;

      bool result = false;
      if(/*!IsProjectModified() ||*/ BuildInterrim(project, restart, compiler, config, bitDepth, normal))
      {
         // For Restart, compiler and config will only be used if for
         // whatever reason (if at all possible) the Debugger is in a
         // 'terminated' or 'none' state
         ide.debugger.Restart(compiler, config, bitDepth, useValgrind);
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
      CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
      ProjectConfig config = project.config;
      int bitDepth = ide.workspace.bitDepth;
      bool useValgrind = ide.workspace.useValgrind;

      if((ide.debugger.isActive) || (!buildInProgress && BuildInterrim(project, start, compiler, config, bitDepth, normal)))
         ide.debugger.StepInto(compiler, config, bitDepth, useValgrind);
      delete compiler;
      return true;
   }

   bool DebugStepOver(bool skip)
   {
      CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
      ProjectConfig config = project.config;
      int bitDepth = ide.workspace.bitDepth;
      bool useValgrind = ide.workspace.useValgrind;

      if((ide.debugger.isActive) || (!buildInProgress && BuildInterrim(project, start, compiler, config, bitDepth, normal)))
         ide.debugger.StepOver(compiler, config, bitDepth, useValgrind, skip);

      delete compiler;
      return true;
   }

   bool DebugStepUntil(bool skip)
   {
      CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
      ProjectConfig config = project.config;
      int bitDepth = ide.workspace.bitDepth;
      bool useValgrind = ide.workspace.useValgrind;

      if((ide.debugger.isActive) || (!buildInProgress && BuildInterrim(project, start, compiler, config, bitDepth, normal)))
         ide.debugger.StepUntil(compiler, config, bitDepth, useValgrind, skip);

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
         char path[MAX_LOCATION];
         char currentDir[MAX_LOCATION];
         ProjectNode node = toNode;
         FileDialog fileDialog = importFileDialog;
         fileDialog.master = parent;
         while(node)
         {
            node.GetFullFilePath(path, true, true);
            while(path[0])
            {
               StripLastDirectory(path, path);
               if(FileExists(path).isDirectory) break;
            }
            if(path[0] || node == toNode.project.topNode)
               node = null;
            else
               node = toNode.project.topNode;
         }
         MakeSystemPath(path);
         StripLastDirectory(path, currentDir);
         fileDialog.currentDirectory = currentDir[0] ? currentDir : path;
         fileDialog.filePath = path;
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

         if(!parentNode.files) parentNode.files = { };

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
            folderNode.row.tag = (int64)(intptr)folderNode;

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
         ProjectNode parentNode = (ProjectNode)(intptr)row.tag;
         bool addFailed = false;
         int numSelections = fileDialog.numSelections;
         const char * const * multiFilePaths = fileDialog.multiFilePaths;

         Array<String> nameConflictFiles { };

         for(c = 0; c < numSelections; c++)
         {
            const char * filePath = multiFilePaths[c];
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
            const char * part1 = $"The following file";
            const char * opt1 = $" was ";
            const char * opt2 = $"s were ";
            const char * part2 = $"not added because of identical file name conflict within the project.\n\n";
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

   ProjectNode AddFile(ProjectNode parentNode, const char * filePath, bool resources, bool isTemporary)
   {
      ProjectNode result = null;
      ProjectNode after = null;

      if(!parentNode.files) parentNode.files = { };

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
         result.row.tag = (int64)(intptr)result;
         result.row.SetData(null, result);
      }
      return result;
   }

   CodeEditor CreateNew(const char * upper, const char * lower, const char * base, char * className)
   {
      CodeEditor codeEditor = null;
      ProjectNode projectNode;
      ProjectNode after = null;
      DataRow row = fileList.currentRow;
      Project project;
      ProjectNode parentNode;
      int c;

      if(!row) row = this.project.topNode.row;

      parentNode = (ProjectNode)(intptr)row.tag;
      project = parentNode.project;

      for(node : parentNode.files)
      {
         if(node.type != folder && node.type != file && node.type)
            break;
         after = node;
      }
      for(c = 1; c < 100; c++)
      {
         char string[16];
         sprintf(string, "%s%d.ec", lower, c);
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
         projectNode.row.tag = (int64)(intptr)projectNode;

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
               codeEditor = (CodeEditor)ide.OpenFile(filePath, false, false, null, whatever, normal, false);
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
            codeEditor = (CodeEditor)ide.OpenFile(filePath, false, false, null, whatever, normal, false);
         }
         ide.sheet.visible = true;
         ide.sheet.Activate();
         if(codeEditor)
         {
            codeEditor.ViewDesigner();
            codeEditor.codeModified = true;
         }
      }
      //visible = false;
      return codeEditor;
   }

   // Returns true if we opened something
   bool OpenSelectedNodes(bool noParsing)
   {
      bool result = false;
      OldList selection;
      OldLink item;

      fileList.GetMultiSelection(selection);
      for(item = selection.first; item; item = item.next)
      {
         DataRow row = item.data;
         ProjectNode node = (ProjectNode)(intptr)row.tag;
         if(node.type == file)
         {
            OpenNode(node, noParsing);
            result = true;
         }
      }
      selection.Free(null);
      ide.RepositionWindows(false);
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
         ProjectNode n, node = (ProjectNode)(intptr)row.tag;
         bool remove = false;

         next = item.next;
         for(i = selection.first; i && !remove; i = i.next)
         {
            ProjectNode iNode = (ProjectNode)(intptr)((DataRow)i.data).tag;
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
         ProjectNode node = (ProjectNode)(intptr)row.tag;
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
