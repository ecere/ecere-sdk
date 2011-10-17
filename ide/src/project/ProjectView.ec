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
   { $"All files", null }
] };

static Array<FileType> fileTypes
{ [
   { $"Based on extension", null },
   { $"Text",               "txt" },
   { $"Image",              "jpg" },
   { $"3D Studio Model",    "3ds" }
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
   "<:ecere>mimeTypes/file.png"                    /*mFile*/ //TODO: create icon for mfile
};

enum PrepareMakefileMethod { normal, force, forceExists };

enum BuildType { build, rebuild, relink, run, start, restart };
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
   
   /*property Project project
   {
      set
      {
         if(project)
         {
            DeleteNode(project.topNode);
            project.Free();
         }
         project = value;
         if(project)
         {
            AddNode(project.topNode, null);
            fileDialog.currentDirectory = project.topNode.path;
            resourceFileDialog.currentDirectory = project.topNode.path;

            // Make sure this is done already...
            {
               char filePath[MAX_LOCATION];
               strcpy(filePath, project.topNode.path);
               PathCat(filePath, project.topNode.name);
               strcat(filePath, ".epj");
               fileName = filePath;
            }

            ide.statusBar.text = "Generating Makefile & Dependencies...";
            app.UpdateDisplay();
            // REDJ set makefile generation flag so generation occurs only when compiling instead of generating on the spot
            project.config.makingModified = true;
            ide.statusBar.text = "Initializing Debugger";
            ide.statusBar.text = null;
            app.UpdateDisplay();
         }
      }
      get { return project; }
   }*/

   bool drawingInProjectSettingsDialog;
   bool drawingInProjectSettingsDialogHeader;
   ProjectSettings projectSettingsDialog;

   bool stopBuild;

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
            ProjectNode node = (ProjectNode)row.tag;
            if(node.type == NodeTypes::project || node.type == resources || node.type == file || node.type == folder)
            {
               bool buildMenuUnavailable = buildInProgress;
               PopupMenu popupMenu;
               Menu popupContent { };
               
               if(node.type == NodeTypes::project)
               {
                  //if(node == ((Project)workspace.projects.first).topNode)
                  {
                     MenuItem { popupContent, $"Build", b, NotifySelect = ProjectBuild }.disabled = buildMenuUnavailable;
                     MenuItem { popupContent, $"Relink", l, NotifySelect = ProjectLink }.disabled = buildMenuUnavailable;
                     MenuItem { popupContent, $"Rebuild", r, NotifySelect = ProjectRebuild }.disabled = buildMenuUnavailable;
                     MenuItem { popupContent, $"Clean", c, NotifySelect = ProjectClean }.disabled = buildMenuUnavailable;
                     MenuItem { popupContent, $"Regenerate Makefile", m, NotifySelect = ProjectRegenerate }.disabled = buildMenuUnavailable;
                     MenuDivider { popupContent };
                  }
                  MenuItem { popupContent, $"New File...", l, Key { l, ctrl = true }, NotifySelect = ProjectNewFile };
                  MenuItem { popupContent, $"New Folder...", n, Key { f, ctrl = true }, NotifySelect = ProjectNewFolder };
                  MenuItem { popupContent, $"Import Folder...", i, NotifySelect = ProjectImportFolder };
                  MenuItem { popupContent, $"Add Files to Project...", f, NotifySelect = ProjectAddFiles };
                  MenuDivider { popupContent };
                  MenuItem { popupContent, $"Add New Form...", o, NotifySelect = ProjectAddNewForm };
                  // MenuItem { popupContent, "Add New Behavior Graph...", g, NotifySelect = ProjectAddNewGraph };
                  MenuDivider { popupContent };
                  if(node != ((Project)workspace.projects.first).topNode)
                  {
                     MenuItem { popupContent, $"Remove project from workspace", r, NotifySelect = ProjectRemove }.disabled = buildMenuUnavailable;
                     MenuDivider { popupContent };
                  }
                  MenuItem { popupContent, $"Active Configuration...", s, Key { f5, alt = true } , NotifySelect = MenuConfig };
                  MenuItem { popupContent, $"Settings...", s, Key { f7, alt = true } , NotifySelect = MenuSettings };
                  MenuDivider { popupContent };
                  MenuItem { popupContent, $"Browse Folder", w, NotifySelect = MenuBrowseFolder };
                  MenuDivider { popupContent };
                  MenuItem { popupContent, $"Save", v, Key { s, ctrl = true }, NotifySelect = ProjectSave }.disabled = !node.modified;
                  MenuDivider { popupContent };
                  MenuItem { popupContent, $"Properties...", p, Key { enter, alt = true }, NotifySelect = FileProperties };
               }
               else if(node.type == resources)
               {
                  MenuItem { popupContent, $"New File...", l, Key { l, ctrl = true }, NotifySelect = ProjectNewFile };
                  MenuItem { popupContent, $"New Folder...", n, Key { f, ctrl = true }, NotifySelect = ProjectNewFolder };
                  MenuItem { popupContent, $"Add Resources to Project...", f, NotifySelect = ResourcesAddFiles };
                  MenuItem { popupContent, $"Browse Folder", w, NotifySelect = MenuBrowseFolder };
                  MenuDivider { popupContent };
                  MenuItem { popupContent, $"Settings...", s, Key { f7, alt = true } , NotifySelect = MenuSettings };
                  MenuItem { popupContent, $"Properties...", p, Key { enter, alt = true }, NotifySelect = FileProperties };
               }
               else if(node.type == file)
               {
                  MenuItem { popupContent, $"Open", o, NotifySelect = FileOpenFile };
                  MenuItem { popupContent, $"Compile", c, Key { f7, ctrl = true}, NotifySelect = FileCompile }.disabled = buildMenuUnavailable;
                  MenuDivider { popupContent };
                  MenuItem { popupContent, $"Remove", r, NotifySelect = FileRemoveFile };
                  MenuDivider { popupContent };
                  MenuItem { popupContent, $"Browse Folder", w, NotifySelect = MenuBrowseFolder };
                  MenuDivider { popupContent };
                  MenuItem { popupContent, $"Settings...", s, Key { f7, alt = true } , NotifySelect = MenuSettings };
                  MenuItem { popupContent, $"Properties..", p, Key { enter, alt = true }, NotifySelect = FileProperties };
               }
               else if(node.type == folder)
               {
                  bool isInResources = node.isInResources;

                  MenuItem { popupContent, $"New File...", l, Key { l, ctrl = true }, NotifySelect = ProjectNewFile };
                  MenuItem { popupContent, $"New Folder...", n, Key { f, ctrl = true }, NotifySelect = ProjectNewFolder };
                  MenuItem { popupContent, $"Import Folder...", i, NotifySelect = ProjectImportFolder };
                  if(isInResources)
                  {
                     MenuItem { popupContent, $"Add Resources to Folder...", f, NotifySelect = ResourcesAddFiles };
                  }
                  else
                  {
                     MenuItem { popupContent, $"Add Files to Folder...", f, NotifySelect = ProjectAddFiles };
                  }
                  if(!isInResources)
                  {
                     MenuDivider { popupContent };
                     MenuItem { popupContent, $"Add New Form...", o, NotifySelect = ProjectAddNewForm };
                     MenuItem { popupContent, $"Add New Behavior Graph...", g, NotifySelect = ProjectAddNewGraph };
                  }
                  MenuDivider { popupContent };
                  MenuItem { popupContent, $"Remove", r, NotifySelect = FileRemoveFile };
                  MenuDivider { popupContent };
                  MenuItem { popupContent, $"Browse Folder", w, NotifySelect = MenuBrowseFolder };
                  MenuDivider { popupContent };
                  MenuItem { popupContent, $"Settings...", s, Key { f7, alt = true } , NotifySelect = MenuSettings };
                  MenuItem { popupContent, $"Properties...", p, Key { enter, alt = true }, NotifySelect = FileProperties };
               }

               popupMenu = 
               {
                  master = this, menu = popupContent;
                  position = {
                     x + clientStart.x + absPosition.x - app.desktop.position.x, 
                     y + clientStart.y + absPosition.y - app.desktop.position.y };
               };
               popupMenu.Create();
            }
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
      types = fileTypes.array, sizeTypes = fileTypes.count * sizeof(FileType);
   };
   FileDialog resourceFileDialog
   {
      autoCreate = false, mayNotExist = true, filters = resourceFilters.array, sizeFilters = resourceFilters.count * sizeof(FileFilter);
      types = fileTypes.array, sizeTypes = fileTypes.count * sizeof(FileType);
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
         if(prj.topNode.modified && prj.Save(prj.filePath))
         {
            // ProjectUpdateMakefileForAllConfigs(prj, true, true);
            prj.topNode.modified = false;
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
      /*ProjectNode node;
      char moduleName[MAX_FILENAME]; //, modulePath[MAX_LOCATION];
      GetLastDirectory(filePath, moduleName);
      
      // try with workspace dir first?
      if((node = project.topNode.Find(moduleName, false)))
      {
         strcpy(relativePath, node.path);
         PathCatSlash(relativePath, node.name);
         return true;
      }
      // WARNING: On failure, relative path is uninitialized
      return false;   */
      return project.GetRelativePath(filePath, relativePath);
   }

   ProjectNode GetNodeFromWindow(Window document, Project project)
   {
      if(document.fileName)
      {
         char winFileName[MAX_LOCATION];
         char * documentFileName = GetSlashPathBuffer(winFileName, document.fileName);
         for(p : ide.workspace.projects)
         {
            Project prj = project ? project : p;
            ProjectNode node;
            char moduleName[MAX_FILENAME], modulePath[MAX_LOCATION];
            GetLastDirectory(document.fileName, moduleName);

            if((node = prj.topNode.Find(moduleName, false)))
            {
               strcpy(modulePath, prj.topNode.path);
               PathCatSlash(modulePath, node.path);
               PathCatSlash(modulePath, node.name);
               if(!fstrcmp(documentFileName, modulePath))
               {
                  return node;
               }
            }
            if(project) break;
         }
      }
      return null;
   }

   void Compile(ProjectNode node)
   {
      char fileName[MAX_LOCATION];
      char extension[MAX_EXTENSION];
      Window document;
      Project prj = node.project;
      CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
      DirExpression objDir = prj.objDir;

      strcpy(fileName, prj.topNode.path);
      PathCatSlash(fileName, objDir.dir);
      PathCatSlash(fileName, node.name);
      StripExtension(fileName);
      strcat(fileName, ".o");
      if(FileExists(fileName))
         DeleteFile(fileName);

      GetExtension(node.name, extension);
      if(!strcmp(extension, "ec"))
      {
         // Delete generated C file
         strcpy(fileName, prj.topNode.path);
         PathCat(fileName, objDir.dir);
         PathCat(fileName, node.name);
         StripExtension(fileName);
         strcat(fileName, ".c");
         if(FileExists(fileName))
            DeleteFile(fileName);

         // Delete symbol file
         strcpy(fileName, prj.topNode.path);
         PathCat(fileName, node.path);
         PathCat(fileName, node.name);
         StripExtension(fileName);
         strcat(fileName, ".sym");
         if(FileExists(fileName))
            DeleteFile(fileName);
      }

      stopBuild = false;

      // Check if we have to save
      strcpy(fileName, prj.topNode.path);
      PathCatSlash(fileName, node.path);
      PathCatSlash(fileName, node.name);
      for(document = ide.firstChild; document; document = document.next)
      {
         if(document.modifiedDocument)
         {
            char documentFileName[MAX_LOCATION];
            if(!fstrcmp(GetSlashPathBuffer(documentFileName, document.fileName), fileName))
               if(!document.MenuFileSave(null, 0))
                  return;
         }
      }

      if(ProjectPrepareForToolchain(prj, normal, true, true))
      {
         if(!node.isExcluded)
         {
            buildInProgress = compilingFile;
            ide.AdjustBuildMenus();

            //ide.outputView.ShowClearSelectTab(build);
            // this stuff doesn't even appear
            //ide.outputView.buildBox.Logf("%s Compiler\n", compiler.name);
            if(prj.config)
               ide.outputView.buildBox.Logf($"Compiling single file %s in project %s using the %s configuration...\n", node.name, prj.name, prj.config.name);
            else
               ide.outputView.buildBox.Logf($"Compiling single file %s in project %s...\n", node.name, prj.name);

            prj.Compile(node);
            buildInProgress = none;
            ide.AdjustBuildMenus();
         }
         else
            ide.outputView.buildBox.Logf($"File %s is excluded from current build configuration.\n", node.name);
      }
      delete objDir;
      delete compiler;
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
            char * bracket;
            if(colon)
            {
               // Cut module name
               strncpy(moduleName, line, colon - line);
               moduleName[colon - line] = '\0';
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
            if(moduleName[0])
            {
               CodeEditor codeEditor;
               strcpy(filePath, project.topNode.path);
               PathCatSlash(filePath, moduleName);
      
               codeEditor = (CodeEditor)ide.OpenFile(filePath, normal, true, null, no, normal);
               if(!codeEditor)
               {
                  char name[MAX_LOCATION];
                  // TOFIX: Improve on this, don't use only filename, make a function
                  if(ide && ide.workspace)
                  {
                     for(prj : ide.workspace.projects)
                     {
                        if(prj.topNode.FindWithPath(moduleName, false))
                        {
                           strcpy(filePath, prj.topNode.path);
                           PathCatSlash(filePath, moduleName);
                           codeEditor = (CodeEditor)ide.OpenFile(filePath, normal, true, null, no, normal);
                           if(codeEditor)
                              break;
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

      row.tag = (int)node;
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

   bool ProjectSave(MenuItem selection, Modifiers mods)
   {
      DataRow row = fileList.currentRow;
      ProjectNode node = row ? (ProjectNode)row.tag : null;
      Project prj = node ? node.project : null;
      if(prj)
      {
         if(prj.Save(prj.filePath))
         {
            // ProjectUpdateMakefileForAllConfigs(prj, true, true);
            prj.topNode.modified = false;
            prj = null;
            for(p : ide.workspace.projects)
            {
               if(p.topNode.modified)
               { 
                  prj = p;
                  break;
               }
            }
            if(!prj)
               modifiedDocument = false;
            Update(null);
         }
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
   }

   bool DisplayCompiler(bool cleanLog)
   {
      CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
      ShowOutputBuildLog(cleanLog);
      ide.outputView.buildBox.Logf($"%s Compiler\n", compiler ? compiler.name : $"{problem with compiler selection}");
      delete compiler;
   }

   bool ProjectUpdateMakefileForAllConfigs(Project project, bool cleanLog, bool displayCompiler)
   {
      ProjectConfig currentConfig = project.config;
      ShowOutputBuildLog(cleanLog);

      if(displayCompiler)
         DisplayCompiler(false);
      
      for(config : project.configurations)
      {
         project.config = config;
         ProjectPrepareMakefile(project, forceExists, false, false);
      }

      project.config = currentConfig;

      ide.Update(null);
   }

   bool ProjectPrepareForToolchain(Project project, PrepareMakefileMethod method, bool cleanLog, bool displayCompiler)
   {
      bool isReady = true;
      char message[MAX_F_STRING];
      LogBox logBox = ide.outputView.buildBox;

      ShowOutputBuildLog(cleanLog);

      if(displayCompiler)
         DisplayCompiler(false);

      ProjectPrepareMakefile(project, method, false, false);
      return true;
   }

   bool ProjectPrepareMakefile(Project project, PrepareMakefileMethod method, bool cleanLog, bool displayCompiler)
   {
      char makefilePath[MAX_LOCATION];
      char makefileName[MAX_LOCATION];
      bool exists;
      LogBox logBox = ide.outputView.buildBox;
      
      ShowOutputBuildLog(cleanLog);

      if(displayCompiler)
         DisplayCompiler(false);

      strcpy(makefilePath, project.topNode.path);
      project.CatMakeFileName(makefileName);
      PathCatSlash(makefilePath, makefileName);

      exists = FileExists(makefilePath);
      if((method == normal && (!exists || project.config.makingModified/*|| project.topNode.modified*/)) ||
            (method == forceExists && exists) || 
            method == force) // || project.config.makingModified || makefileDirty
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
         logBox.Logf($"%s - %s%smakefile for %s config...\n", makefileName, reason, action, project.configName);
         project.GenerateMakefile(null, false, null);

         ide.statusBar.text = null;
         app.UpdateDisplay();
         return true;
      }
      return false;
   }
   
   bool ProjectBuild(MenuItem selection, Modifiers mods)
   {
      Project prj = project;
      if(selection || !ide.activeClient || activeClient == this)
      {
         DataRow row = fileList.currentRow;
         ProjectNode node = row ? (ProjectNode)row.tag : null;
         if(node) prj = node.project;
      }
      // Added this code here until dependencies work:
      else //if(ide.activeClient)
      {
         ProjectNode node = GetNodeFromWindow(ide.activeClient, null);
         if(node)
            prj = node.project;
      }
      if(/*prj != project || */!prj.configIsInDebugSession || !ide.DontTerminateDebugSession($"Project Build"))
         BuildInterrim(prj, build);
      return true;
   }

   bool BuildInterrim(Project prj, BuildType buildType)
   {
      if(ProjectPrepareForToolchain(prj, normal, true, true))
      {
         ide.outputView.buildBox.Logf($"Building project %s using the %s configuration...\n", prj.name, prj.configName);
         return Build(prj, buildType);
      }
      return false;
   }

   bool ProjectLink(MenuItem selection, Modifiers mods)
   {
      Project prj = project;
      if(selection || !ide.activeClient || activeClient == this)
      {
         DataRow row = fileList.currentRow;
         ProjectNode node = row ? (ProjectNode)row.tag : null;
         if(node) prj = node.project;
      }
      // Added this code here until dependencies work:
      else //if(ide.activeClient)
      {
         ProjectNode node = GetNodeFromWindow(ide.activeClient, null);
         if(node)
            prj = node.project;
      }
      if(ProjectPrepareForToolchain(prj, normal, true, true))
      {
         ide.outputView.buildBox.Logf("Relinking project %s using the %s configuration...\n", prj.name, prj.configName);
         if(prj.config)
            prj.config.linkingModified = true;
         Build(prj, relink);
      }
      return true;
   }

   bool ProjectRebuild(MenuItem selection, Modifiers mods)
   {
      Project prj = GetSelectedProject((bool)selection);
      if(ProjectPrepareForToolchain(prj, normal, true, true))
      {
         ide.outputView.buildBox.Logf($"Rebuilding project %s using the %s configuration...\n", prj.name, prj.configName);
         /*if(prj.config)
         {
            prj.config.compilingModified = true;
            prj.config.makingModified = true;
         }*/ // -- should this still be used depite the new solution of BuildType?
         Build(prj, rebuild);
      }
      return true;
   }

   bool ProjectClean(MenuItem selection, Modifiers mods)
   {
      Project prj = GetSelectedProject((bool)selection);
      if(ProjectPrepareForToolchain(prj, normal, true, true))
      {
         ide.outputView.buildBox.Logf($"Cleaning project %s using the %s configuration...\n", prj.name, prj.configName);
         
         buildInProgress = prj == project ? buildingMainProject : buildingSecondaryProject;
         ide.AdjustBuildMenus();

         prj.Clean();
         buildInProgress = none;
         ide.AdjustBuildMenus();
      }
      return true;
   }

   bool ProjectRegenerate(MenuItem selection, Modifiers mods)
   {
      Project prj = project;
      if(selection || !ide.activeClient || activeClient == this)
      {
         DataRow row = fileList.currentRow;
         ProjectNode node = row ? (ProjectNode)row.tag : null;
         if(node)
            prj = node.project;
      }
      // Added this code here until dependencies work:
      else //if(ide.activeClient)
      {
         ProjectNode node = GetNodeFromWindow(ide.activeClient, null);
         if(node)
            prj = node.project;
      }

      ProjectPrepareMakefile(prj, force, true, true);
      return true;
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

   bool MenuConfig(MenuItem selection, Modifiers mods)
   {
      if(ProjectActiveConfig { parent = parent.parent, master = parent, project = project }.Modal() == ok)
         ide.AdjustMenus();
      return true;
   }

   bool MenuCompiler(MenuItem selection, Modifiers mods)
   {
      ActiveCompilerDialog compilerDialog
      {
         parent = parent.parent, master = parent;
         ideSettings = ideSettings, workspaceActiveCompiler = ide.workspace.compiler;
      };
      incref compilerDialog;
      if(compilerDialog.Modal() == ok && strcmp(compilerDialog.workspaceActiveCompiler, ide.workspace.compiler))
      {
         ide.workspace.compiler = compilerDialog.workspaceActiveCompiler;
         for(prj : ide.workspace.projects)
            ide.projectView.ProjectUpdateMakefileForAllConfigs(prj, true, true);
      }
      delete compilerDialog;
      return true;
   }

   bool MenuSettings(MenuItem selection, Modifiers mods)
   {
      ProjectNode node = GetSelectedNode(true);
      Project prj = node ? node.project : project;
      projectSettingsDialog = ProjectSettings { parent = parent.parent, master = parent, project = prj, projectNode = node };
      projectSettingsDialog.Modal();

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
      DataRow row = fileList.currentRow;
      if(row)
      {
         ProjectNode node = (ProjectNode)row.tag;
         Compile(node);
      }
      return true;
   }

   /*bool IsProjectModified()
   {
      Window document;

      for(document = master.firstChild; document; document = document.next)
      {
         if(document.modifiedDocument)
            if(GetNodeFromWindow(document), project)
               return true;
      }
      return false;
   }
   */

   bool Build(Project prj, BuildType buildType)
   {
      bool result = true;
      Window document;

      stopBuild = false;
      for(document = master.firstChild; document; document = document.next)
      {
         if(document.modifiedDocument)
         {
            ProjectNode node = GetNodeFromWindow(document, prj);
            if(node && !document.MenuFileSave(null, 0))
            {
               result = false;
               break;
            }
         }
      }
      if(result)
      {
         DirExpression targetDir = prj.targetDir;

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
               {
                  DebugStop();
               }
            }
            else
            {
               if(ide.project == prj && ide.debugger && ide.debugger.prjConfig == prj.config && ide.debugger.isPrepared)
               {
                  DebugStop();
               }
            }
         }
         
         // TODO: Disabled until problems fixed... is it fixed?
         if(buildType == rebuild || (prj.config && prj.config.compilingModified))
            prj.Clean();
         else
         {
            if(buildType == relink || (prj.config && prj.config.linkingModified))
            {
               char target[MAX_LOCATION];

               strcpy(target, prj.topNode.path);
               PathCat(target, targetDir.dir);
               prj.CatTargetFileName(target);
               if(FileExists(target))
                  DeleteFile(target);
            }
            if(prj.config && prj.config.symbolGenModified)
            {
               DirExpression objDir = prj.objDir;
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

         result = prj.Build(buildType == run, null);

         if(prj.config)
         {
            prj.config.compilingModified = false;
            if(!ide.ShouldStopBuild())
               prj.config.linkingModified = false;

            prj.config.symbolGenModified = false;
         }
         buildInProgress = none;
         ide.AdjustBuildMenus();
         ide.AdjustDebugMenus();

         ide.workspace.modified = true;

         delete targetDir;
      }
      return result;
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

   #ifndef __WIN32__
      // move this code to ShellOpen?
      char command[MAX_LOCATION] = "";
      char desktop[MAX_LOCATION * 65];

      GetEnvironment("DESKTOP_SESSION", desktop, sizeof(desktop));
      if(strstr("gnome", desktop))
         sprintf(command, "gnome-open \"%s\"", folder);
      else if(strstr("kde", desktop))
         sprintf(command, "kde-open \"%s\"", folder);
      if(command[0])
         Execute(command);
      else
         PrintLn("unable to detect known desktop");
   #else
      ShellOpen(folder);
   #endif
   }

   bool Run(MenuItem selection, Modifiers mods)
   {
      char args[MAX_LOCATION * 64];
      args[0] = '\0';
      if(ide.workspace.commandLineArgs)
         //ide.debugger.GetCommandLineArgs(args);
         strcpy(args, ide.workspace.commandLineArgs);
      if(ide.debugger.isActive)
         project.Run(args);
      /*else if(project.config.targetType == sharedLibrary || project.config.targetType == staticLibrary)
         MessageBox { master = ide, type = ok, text = "Run", contents = "Shared and static libraries cannot be run like executables." }.Modal();*/
      else if(BuildInterrim(project, run))
         project.Run(args);
      return true;
   }

   bool DebugStart()
   {
      bool result = false;
      if(project.targetType == sharedLibrary || project.targetType == staticLibrary)
         MessageBox { master = ide, type = ok, text = $"Run", contents = $"Shared and static libraries cannot be run like executables." }.Modal();
      else if(project.compress)
         MessageBox { master = ide, text = $"Starting Debug", contents = $"Debugging compressed applications is not supported\n" }.Modal();
      else if(project.debug ||
         MessageBox { master = ide, type = okCancel, text = $"Starting Debug", contents = $"Attempting to debug non-debug configuration\nProceed anyways?" }.Modal() == ok)
      {
         if(/*!IsProjectModified() ||*/ BuildInterrim(project, start))
         {
            CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
            if(compiler.type.isVC)
            {
               //bool result = false;
               char oldwd[MAX_LOCATION];
               char oldPath[MAX_LOCATION * 65];
               char command[MAX_LOCATION];

               GetEnvironment("PATH", oldPath, sizeof(oldPath));
               ide.SetPath(false); //true
               
               GetWorkingDir(oldwd, sizeof(oldwd));
               ChangeWorkingDir(project.topNode.path);

               sprintf(command, "%s /useenv %s.sln /projectconfig \"%s|Win32\" /command \"%s\"" , "devenv", project.name, project.config.name, "Debug.Start");
               //ide.outputView.buildBox.Logf("command: %s\n", command);
               Execute(command);
               ChangeWorkingDir(oldwd);
               SetEnvironment("PATH", oldPath);
            }
            else
            {
               ide.debugger.Start();
               result = true;
            }

            delete compiler;
         }
      }
      return result;      
   }

   bool DebugRestart()
   {
      if(/*!IsProjectModified() ||*/ BuildInterrim(project, restart))
      {
         ide.debugger.Restart();
         return true;
      }
      return false;
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
      if((ide.debugger.isActive) || (!buildInProgress && BuildInterrim(project, start)))
         ide.debugger.StepInto();
      return true;
   }

   bool DebugStepOver(bool skip)
   {
      if((ide.debugger.isActive) || (!buildInProgress && BuildInterrim(project, start)))
         ide.debugger.StepOver(skip);
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
            folderNode.row.tag = (int)folderNode;
               
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
         result.row.tag = (int)result;
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
         projectNode.row.tag =(int)projectNode;
            
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
            return true;
         }
      }
      selection.Free(null);
      return false;
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
