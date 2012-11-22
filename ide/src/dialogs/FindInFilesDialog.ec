import "ide"
import "layout"

enum FindInFilesMode { directory, workspace, project };

class FindInFilesDialog : Window
{
   text = $"Find In Files";
   background = formColor;
   borderStyle = sizable;
   minClientSize = { 440, 208 };
   maxClientSize = { 640, 208 };
   hasClose = true;
   tabCycle = true;
   size = { 440, 208 };
   autoCreate = false;
   stayOnTop = true;
   
public:
   property char * searchString { set { findContent.contents = value; } get { return findContent.contents; } };
   property bool contentWholeWord { set { contentWholeWord.checked = value; } get { return contentWholeWord.checked; } };
   property bool contentMatchCase { set { contentMatchCase.checked = value; } get { return contentMatchCase.checked; } };
   property char * currentDirectory
   {
      set
      {
         GetWorkingDir(currentDirectory, MAX_DIRECTORY);
         PathCat(currentDirectory, value);
         FileFixCase(currentDirectory);
         findWhere.path = currentDirectory;
      }
      get { return (char *)currentDirectory; }
   };
   property FileFilter * filters { set { filters = value; } get { return filters; } };
   // Replace with Array system
   property int sizeFilters
   {
      set
      {
         int numFilters = value / sizeof(FileFilter);
         int c;

         sizeFilters = value;

         // File Extension Filter
         filterDrop.Clear();
         // filterDrop.AddField(null);
         fileFilter = 0;
         if(filters)
         {
            for(c = 0; c<numFilters; c++)
            {
               DataRow row = filterDrop.AddString(filters[c].name);
               if(filters[c].extensions && !strcmp(filters[c].extensions, "ec, eh, c, cpp, cc, cxx, h, hpp, hh, hxx"))
                  fileFilter = c;
               row.tag = c;
            }
         }
         if(!numFilters)
            filterDrop.AddString($"All files");

         //if(fileFilter >= numFilters)
         //  fileFilter = 0;
         filterDrop.currentRow = filterDrop.FindRow(fileFilter);
      }
      get { return sizeFilters; }
   };
   property int filter { set { fileFilter = value; } get { return fileFilter; } };

   property FindInFilesMode mode
   {
      set
      {
         switch(value)
         {
            case directory:
               findIn.SelectRow(inDirectoryRow);
               break;
            case workspace:
               findIn.SelectRow(inWorkspaceRow);
               break;
            case project:
            {
               DataRow row;
               for(row = findIn.firstRow; row; row = row.next)
                  if(row != inDirectoryRow && row != inWorkspaceRow)
                     break;
               if(row)
                  findIn.SelectRow(row);
               break;
            }
         }
         lastSelectionMode = value;
      }
      get
      {
         if(findIn.currentRow == inDirectoryRow)
            return directory;
         else if(findIn.currentRow == inWorkspaceRow)
            return workspace;
         else
            return project;
      }
   }

   property char * findDir
   {
      get { return searchThread.mode == directory ? (char *)searchThread.dir : null; }
   }
      /*if(searchThread.mode == directory)
         ide.outputView.findDir = CopyString(searchThread.dir);
      else if(searchThread.mode == project)
         ide.outputView.findProject = searchThread.project;*/
   property Project findProject
   {
      get { return searchThread.mode == project ? searchThread.project : null; }
   }

   property bool replaceMode
   {
      set
      {
         if(value != replaceMode)
         {
            int h = value ? 236 : 208;
            find.text = value ? $"Replace" : $"Find";
            find.hotKey = value ? altF : altR; // tocheck: the hotkey keeps getting lost
            llreplaceWith.visible = value;
            text = value ? $"Replace In Files" : $"Find In Files";
            minClientSize.h = h;
            maxClientSize.h = h;
            size.h = h;
            replaceMode = value;
         }
      }
   }

   void AddProjectItem(Project project)
   {
      if(created)
      {
         char label[MAX_FILENAME];
         DataRow row;
         sprintf(label, $"%s Project", project.name);
         row = findIn.AddString(label);
         row.tag = (uint)project;
      }
   }

   void RemoveProjectItem(Project project)
   {
      DataRow row;
      if(inWorkspaceRow)
      {
         for(row = inWorkspaceRow.next; row; row = row.next)
         {
            if((Project)row.tag == project)
            {
               findIn.DeleteRow(row);
               break;
            }
         }
      }
   }

   void Show()
   {
      if(!created)
         Create();
      else
         Activate();
   }

private:

   char currentDirectory[MAX_DIRECTORY];
   FileFilter * filters;
   int sizeFilters;
   int fileFilter;
   DataRow inDirectoryRow;
   DataRow inWorkspaceRow;
   FindInFilesMode lastSelectionMode;
   String lastSelectionProject;
   String lastSelectionProjectNode;
   bool replaceMode;
   SelectorButton starDir;

   FindInFilesDialog()
   {
      GetWorkingDir(currentDirectory, MAX_DIRECTORY);
      FileFixCase(currentDirectory);
      findWhere.path = currentDirectory;
      findWherePrjNode.AddField(projectNodeField);
   }

   ~FindInFilesDialog()
   {
      SearchStop();
   }

   LayoutPage layout
   {
      this, anchor = { left = 20, top = 4, right = 8, bottom = 0 };
      direction = horizontal;
      tabCycle = true;
      reverse = true;
      gap = 8;
   };

   LayoutPage lpmain
   {
      layout, this;
      tabCycle = true;
      anchor.left = 0;
      anchor.top = 0, anchor.bottom = 0;
      gap = 2;
   };

   LayoutLine llfindIn      { lpmain, this, size.h = 26 };
   LayoutLine llfindWhere   { lpmain, this, size.h = 26 };
   LayoutLine llsubDirs     { lpmain, this, size.h = 18 };
   LayoutLine llfilter      { lpmain, this, size.h = 26 };
   LayoutLine llfileName    { lpmain, this, size.h = 26 };
   LayoutLine llfindWhat    { lpmain, this, size.h = 26 };
   LayoutLine llwholeWord   { lpmain, this, size.h = 18 };
   LayoutLine llmatchCase   { lpmain, this, size.h = 18 };
   LayoutLine llreplaceWith { lpmain, this, size.h = 26, visible = false };

   Label lfindIn { llfindIn, this, size.w = 72, labeledWindow = findIn };
   DropBox findIn
   {
      llfindIn, this, $"Find in:", altI, anchor.right = 0;

      bool NotifySelect(DropBox control, DataRow row, Modifiers mods)
      {
         FindInFilesMode mode = this.mode;
         bool inDir = mode == directory;
         bool inWrk = mode == workspace;
         bool inPrj = mode == project;
         if(inPrj)
            lfindWhere.labeledWindow = findWherePrjNode;
         else
            lfindWhere.labeledWindow = findWhere;
         findWhere.visible = !inPrj;
         findWhere.disabled = !inDir;
         findWherePrjNode.visible = inPrj;
         subDirs.disabled = inWrk;
         llfindWhere.size = { llfindWhere.size.w, llfindWhere.size.h };

         if(row)
         {
            Project prj;
            lastSelectionMode = mode;
            prj = lastSelectionMode == project ? (Project)row.tag : null;
            delete lastSelectionProject;
            if(prj)
            {
               DataRow r = null;
               ProjectNode node = prj.topNode;
               char filePath[MAX_LOCATION];
               prj.topNode.GetFullFilePath(filePath);
               lastSelectionProject = CopyString(filePath);
               findWherePrjNode.Clear();
               ListProjectNodeFolders(node, null);

               if(lastSelectionProjectNode && !(node = prj.topNode.FindByFullPath(lastSelectionProjectNode, false)))
               {
                  node = prj.topNode;
                  delete lastSelectionProjectNode;
               }

               for(r = findWherePrjNode.firstRow; r; r = r.next)
                  if((ProjectNode)r.tag == node)
                     break;
               if(r)
                  findWherePrjNode.SelectRow(r);
            }
         }
         return true;
      }
   };

   void ListProjectNodeFolders(ProjectNode node, DataRow parentRow)
   {
      DataRow row;
      if(parentRow)
         row = findWherePrjNode/*parentRow*/.AddRow();
      else
         row = findWherePrjNode.AddRow();
      row.tag = (int)node;
      row.SetData(null, node);
      if(node.files)
      {
         for(child : node.files; child.type == folder/* || child.type == file*//* || child.type == folderOpen*/)
            ListProjectNodeFolders(child, row);
      }
   }

   Label lfindWhere { llfindWhere, this, size.w = 72, labeledWindow = findWhere };
   PathBox findWhere
   {
      llfindWhere, this, $"Find where:", altH, size.h = 24, anchor.right = 0;
      typeExpected = directory, browseDialog = fileDialog;
   };
   DropBox findWherePrjNode
   {
      llfindWhere, this, $"Find where:", altH, size.h = 24, anchor.right = 0;
      visible = false;
      //collapseControl = true, treeBranches = true;

      bool NotifySelect(DropBox control, DataRow row, Modifiers mods)
      {
         if(row)
         {
            ProjectNode node = (ProjectNode)row.tag;
            delete lastSelectionProjectNode;
            if(node)
            {
               char filePath[MAX_LOCATION];
               node.GetFullFilePath(filePath);
               lastSelectionProjectNode = CopyString(filePath);
            }
         }
         return true;
      }
   };
   DataField projectNodeField { dataType = "ProjectNode", freeData = false };

   Window spacerA { llsubDirs, this, size = { 72, 10 }, clickThrough = true, background = formColor, inactive = true };
   Button subDirs
   {
      llsubDirs, this, $"Include Subdirectories", altU, isCheckbox = true, checked = true;
   };

   Label lfilter { llfilter, this, size.w = 72, labeledWindow = filterDrop };
   DropBox filterDrop
   {
      llfilter, this, $"Filter:", altL, anchor.right = 0;

      bool NotifySelect(DropBox control, DataRow row, Modifiers mods)
      {
         fileFilter = row ? row.tag : 0;
         //ListFiles();
         return true;
      }
   };

   Label lfileName { llfileName, this, size.w = 72, labeledWindow = fileName };
   EditBox fileName
   {
      llfileName, this, $"File name:", altN, size.h = 24, anchor.right = 0;
   };

   //Window spacerX { ll, this, size = { 72, 10 }, clickThrough = true, background = formColor, inactive = true };
   //Button nameWholeWord { ll, this, "Whole word only", AltO, isCheckbox = true };
   //Window spacerX { llwholeWord, this, size = { 72, 10 }, clickThrough = true, background = formColor, inactive = true };
   //Button nameMatchCase { ll, this, "Match case", altA, isCheckbox = true };

   Label lfindContent { llfindWhat, this, size.w = 72, labeledWindow = findContent };
   EditBox findContent
   {
      llfindWhat, this, $"Find what:", altT, size.h = 24, anchor.right = 0;
   };

   Label lreplaceWith { llreplaceWith, this, size.w = 72, labeledWindow = replaceWith };
   EditBox replaceWith
   {
      llreplaceWith, this, $"Replace with:", altE;
      size.h = 24, anchor.right = 0;
   };

   Window spacerB { llwholeWord, this, size = { 72, 10 }, clickThrough = true, background = formColor, inactive = true };
   Button contentWholeWord { llwholeWord, this, $"Whole word only", altW, isCheckbox = true };

   Window spacerC { llmatchCase, this, size = { 72, 10 }, clickThrough = true, background = formColor, inactive = true };
   Button contentMatchCase { llmatchCase, this, $"Match case", altC, isCheckbox = true };

   LayoutPage lpbuttons
   {
      layout, this;
      tabCycle = true;
      size.w = 80;
      anchor.top = 0, anchor.bottom = 0;
      gap = 16;
   };

   LayoutLine llspace   { lpbuttons, this, size.h = 2 };
   LayoutLine llfind    { lpbuttons, this, size.h = 30 };
   LayoutLine llcancel  { lpbuttons, this, size.h = 30 };

   Button find
   {
      llfind, this, $"Find", altF, isDefault = true, size = { 80, 24 }, anchor.horz = 0, anchor.vert = 0, keyRepeat = true;

      bool NotifyClicked(Button control, int x, int y, Modifiers mods)
      {
         String findPath = findWhere.path;
         if(findIn.currentRow == inDirectoryRow && !findPath[0])
         {
            findWhere.Activate();
            MessageBox { type = ok, master = parent,
                  text = text, contents = $"You must specify a search location." }.Modal();
         }
         else if(findIn.currentRow == inDirectoryRow && !FileExists(findPath))
         {
            findWhere.Activate();
            MessageBox { type = ok, master = parent,
                  text = text, contents = $"Search location does not exist. Please provide a valid location." }.Modal();
         }
         else if(!fileName.contents[0] && !findContent.contents[0])
         {
            findContent.Activate();
            MessageBox { type = ok, master = parent,
                  text = text, contents = $"Nothing to be found. Please specify at least one criteria." }.Modal();
         }
         else
         {
            findContent.Activate();
            SearchStop();
            SearchStart();
         }
         return true;
      }
   };

   Button cancel
   {
      llcancel, this, $"Cancel", hotKey = { escape }, size = { 80, 24 }, anchor.horz = 0, anchor.vert = 0;

      bool NotifyClicked(Button control, int x, int y, Modifiers mods)
      {
         findContent.Activate();
         Destroy(0);
         return true;
      }
   };
   
   SearchThread searchThread { findDialog = this };
   FileDialog fileDialog { master = this, type = selectDir, text = $"Select Search Location..." };

   void OnDestroy()
   {
      findIn.Clear();
      inDirectoryRow = null;
      inWorkspaceRow = null;
   }

   bool OnPostCreate()
   {
      bool disabled;
      bool withWorkspace = (bool)ide.workspace;
      DataRow row;
      if(!inDirectoryRow)
         inDirectoryRow = findIn.AddString($"Directory");
      if(withWorkspace)
      {
         if(!inWorkspaceRow)
            inWorkspaceRow = findIn.AddString($"Workspace");
         for(prj : ide.workspace.projects)
            AddProjectItem(prj);
         if(lastSelectionProject)
         {
            for(row = findIn.firstRow; row; row = row.next)
            {
               char filePath[MAX_LOCATION];
               Project p = (Project)row.tag;
               if(p)
               {
                  p.topNode.GetFullFilePath(filePath);
                  if(!fstrcmp(filePath, lastSelectionProject))
                     break;
               }
            }
            if(row)
               findIn.SelectRow(row);
            else
               delete lastSelectionProject;
         }
         if(!lastSelectionProject)
         {
            if(lastSelectionMode == project)
            {
               Project prj = ide.workspace.projects.firstIterator.data;
               for(row = findIn.firstRow; row; row = row.next)
                  if((Project)row.tag == prj)
                     break;
               if(row)
                  findIn.SelectRow(row);
            }
            else
               property::mode = lastSelectionMode;
         }
      }
      else
      {
         findIn.SelectRow(inDirectoryRow);
      }

      findIn.disabled = !withWorkspace;
      /*disabled = findIn.currentRow != inDirectoryRow;

      findWhere.disabled = disabled;
      subDirs.disabled = disabled;*/
      
      findContent.Activate();
      return true;
   }

   void SearchStart()
   {
      char text[2048];
      
      searchThread.active = true;
      searchThread.project = null;
      searchThread.projectNode = null;
      searchThread.subDirs = subDirs.checked;

      if(findIn.currentRow == inDirectoryRow)
      {
         searchThread.mode = directory;
         strcpy(searchThread.dir, findWhere.slashPath);
      }
      else if(findIn.currentRow == inWorkspaceRow)
      {
         searchThread.mode = workspace;
         searchThread.subDirs = true;
      }
      else
      {
         searchThread.mode = project;
         searchThread.project = (Project)findIn.currentRow.tag;
         searchThread.projectNode = (ProjectNode)(findWherePrjNode.currentRow ? findWherePrjNode.currentRow.tag : null);
      }
      //searchThread.nameMatchCase = nameMatchCase.checked;
      //searchThread.nameWholeWord = nameWholeWord.checked;
      searchThread.contentMatchCase = contentMatchCase.checked;
      searchThread.contentWholeWord = contentWholeWord.checked;
      
      searchThread.filter = filters[fileFilter];

      strcpy(searchThread.nameCriteria, fileName.contents);
      strcpy(searchThread.contentCriteria, findContent.contents);
      if(replaceMode)
         strcpy(searchThread.contentReplace, replaceWith.contents);
      searchThread.replaceMode = replaceMode;

      //cancel.text = "Stop";
      
      ide.outputView.ShowClearSelectTab(find);

      Destroy(0);
      
      searchThread.Create();
   }

   bool SearchAbort()
   {
      if(searchThread.active)
      {
         searchThread.Abort();
         return true;
      }
      return false;
   }

   bool SearchStop()
   {
      if(searchThread.active)
      {
         searchThread.Abort();
         searchThread.Abort();
         app.Unlock();
            searchThread.Wait();
         app.Lock();
         return true;
      }
      return false;
   }

   void SearchComplete()
   {
      //cancel.text = $"Cancel";
   }

   int GetSizeFilter()
   {
      return sizeFilters;
   }

   bool NotifyCharsAddedDeletedNameContent(EditBox editBox, BufferLocation before, BufferLocation after, bool pasteOperation)
   {
      find.disabled = (strlen(fileName.contents) == 0 && strlen(findContent.contents) == 0);
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(ch)
      {
         findContent.Activate();
         return findContent.OnKeyHit(key, ch);
      }
      return true;
   }
}

class SearchThread : Thread
{
public:
   bool active, subDirs/*, nameMatchCase, nameWholeWord*/, contentMatchCase, contentWholeWord;
   char dir[MAX_DIRECTORY], contentCriteria[1024], contentReplace[1024], nameCriteria[1024];
   FileFilter filter;
   FindInFilesDialog findDialog;
   FindInFilesMode mode;
   Project project;
   ProjectNode projectNode;
   bool replaceMode;

   void Abort()
   {
      if(abort)
         abortNow = true;
      else
         abort = true;
   }

private:

   bool abort, abortNow;

   SearchThread()
   {
      active = false;
      abort = false;
      abortNow = false;
   }

   int HowManyDigits(int num)
   {
      int count = 1;
      while(num > 9)
      {
         count++;
         num /= 10;
      }
      return count;
   }

   unsigned int Main()
   {
      int frame, treeTop = 0;
      int globalFindCount = 0, filesSearchedCount = 0, filesMatchedCount = 0, dirsMatchedCount = 0;
      //double lastTime = GetTime();
      SearchStackFrame stack[1024];
      FindInFilesMode mode = this.mode;
      
      EditBox replaceEdit = null;

      abort = false;
      abortNow = false;

      app.Lock();
         {
            char substring[512];
            if(nameCriteria[0])
               sprintf(substring, $" with file name matching \"%s\"", nameCriteria);
            else
               substring[0] = '\0';
            if(mode == directory)
            {
               char * s;
               ide.outputView.findBox.Logf(
                     $"Searching \"%s\"%s for %s%s%s containing \"%s\"\n\n",
                     (s = CopySystemPath(dir)), subDirs ? $" and its sub directories" : "",
                     filter.name, substring, substring[0] ? $" and" : "", contentCriteria);
               delete s;
            }
            else if(mode == workspace)
               ide.outputView.findBox.Logf(
                     $"Searching workspace files for files%s%s containing \"%s\"\n\n",
                     substring, substring[0] ? $" and" : "", contentCriteria);
            else if(mode == project)
               ide.outputView.findBox.Logf(
                     $"Searching project %s files for files%s%s containing \"%s\"\n\n",
                     project.name, substring, substring[0] ? $" and" : "", contentCriteria);
         }
      app.Unlock();
      
      if(replaceMode)
      {
         replaceEdit = EditBox
         {
            multiLine = true,textHorzScroll = true,textVertScroll = true, 
            text = $"Replacing Editbox", size = Size { 640,480 },maxLineSize = 65536
         };
      }

      if(mode == directory)
      {
         strcpy(stack[0].path, dir);
         stack[0].fileList = FileListing { dir, extensions = filter.extensions };  // there should be a sorted = true/false 

         for(frame = 0; frame >= 0 && !abort; )
         {
            if(stack[frame].fileList.Find())
            {
               bool match = true;
               if(nameCriteria[0])
               {
                  char name[MAX_LOCATION];
                  GetLastDirectory(stack[frame].fileList.path, name);
                  if(!(bool)SearchString(name, 0, nameCriteria, false, false))
                     match = false;
               }
               if(!stack[frame].fileList.stats.attribs.isDirectory)
               {
                  bool relative = false;
                  char fileRelative[MAX_LOCATION];
                  if(filter.ValidateFileName(stack[frame].fileList.name))
                  {
                     MakePathRelative(stack[frame].fileList.path, dir, fileRelative);
                     relative = true;
                     
                     filesSearchedCount++;
                     if(match && contentCriteria[0])
                     {
                        int ret;

                        app.Lock();
                           ide.outputView.findBox.Tellf(
                                 $"Searching %s for %s", relative ? fileRelative : stack[frame].fileList.path, contentCriteria);
                        app.Unlock();

                        if(replaceMode)
                           ret = SearchFileContentAndReplace(stack[frame].fileList.path, relative, fileRelative, replaceEdit);
                        else
                           ret = SearchFileContent(stack[frame].fileList.path, relative, fileRelative);
                        if(ret > 0)
                        {
                           globalFindCount += ret;
                           filesMatchedCount++;
                        }
                     }
                     else if(match && nameCriteria[0])
                     {
                        filesMatchedCount++;
                        app.Lock();
                           ide.outputView.findBox.Logf(
                                 "%s\n",
                                 relative ? fileRelative : stack[frame].fileList.path);
                        app.Unlock();
                     }
                  }
               }
               else
               {
                  bool relative = false;
                  char fileRelative[MAX_LOCATION];
                  MakePathRelative(stack[frame].fileList.path, dir, fileRelative);
                  relative = true;
                  app.Lock();
                     if(match && nameCriteria[0])
                     {
                        dirsMatchedCount++;
                        ide.outputView.findBox.Logf(
                              "%s\n",
                              relative ? fileRelative : stack[frame].fileList.path);
                     }
                     ide.outputView.findBox.Tellf(
                           $"Searching %s", relative ? fileRelative : stack[frame].fileList.path);
                  app.Unlock();
               }

               if(subDirs && stack[frame].fileList.stats.attribs.isDirectory)
               {
                  int lastFrame = frame;
                  /*double thisTime = GetTime();
                  app.Lock();
                     if(thisTime - lastTime > 0.25)
                     {
                        findDialog.SearchUpdateLabel(stack[lastFrame].fileList.path);
                        lastTime = thisTime;
                     }
                  app.Unlock();*/
                  frame++;
                  strcpy(stack[frame].path, stack[lastFrame].fileList.path);
                  stack[frame].fileList = FileListing { stack[frame].path, extensions = stack[lastFrame].fileList.extensions };
               }
            }
            else
            {
               frame--;
            }
         }
         if(abort)
            for( ; frame >= 0 ; frame--)
               stack[frame].fileList.Stop();
      }
      else if(mode == workspace || mode == project)
      {
         int len;
         char path[MAX_LOCATION];
         bool firtIteration = true;
         Project prj = project;
         ProjectNode stack[1024];
         Iterator<Project> it { ide.workspace.projects };

         while(true)
         {
            if(mode == workspace)
            {
               if(!it.Next()) break;
               prj = it.data;
            }
            stack[1] = projectNode ? projectNode : prj.topNode;

            for(frame = 1; frame && !abort;)
            {
               switch(stack[frame].type)
               {
                  case project:
                     if((subDirs || firtIteration) && stack[frame].files && stack[frame].files.count)
                     {
                        int lastFrame = frame;
                        frame++;
                        stack[frame] = stack[lastFrame].files.first;
                        firtIteration = false;
                     }
                     break;
                  case file:
                  {   
                     bool relative = true;
                     char fileRelative[MAX_LOCATION];
                     char filePath[MAX_LOCATION];
                     filePath[0] = '\0';
                     PathCat(filePath, prj.topNode.path);
                     PathCat(filePath, stack[frame].path);
                     PathCat(filePath, stack[frame].name);
                     fileRelative[0] = '\0';
                     PathCat(fileRelative, stack[frame].path);
                     PathCat(fileRelative, stack[frame].name);
                     if(relative && mode == workspace && prj != ide.project)
                     {
                        char special[MAX_LOCATION];
                        sprintf(special, "(%s)%s", prj.name, fileRelative);
                        strcpy(fileRelative, special);
                     }
                     if(filter.ValidateFileName(stack[frame].name))
                     {
                        filesSearchedCount++;
                        if(!nameCriteria[0] || (bool)SearchString(stack[frame].name, 0, nameCriteria, false, false))
                        {
                           if(contentCriteria[0])
                           {
                              int ret;

                              app.Lock();
                                 ide.outputView.findBox.Tellf(
                                       $"Searching %s for \"%s\"", relative ? fileRelative : filePath,
                                       contentCriteria);
                              app.Unlock();

                              if(replaceMode)
                                 ret = SearchFileContentAndReplace(filePath, relative, fileRelative, replaceEdit);
                              else
                                 ret = SearchFileContent(filePath, relative, fileRelative);
                              if(ret > 0)
                              {
                                 globalFindCount += ret;
                                 filesMatchedCount++;
                              }
                           }
                           else if(nameCriteria[0])
                           {
                              filesMatchedCount++;
                              app.Lock();
                                 ide.outputView.findBox.Logf(
                                       "%s\n", relative ? fileRelative : filePath);
                              app.Unlock();
                           }
                        }
                     }
                     stack[frame] = stack[frame].next;
                     break;
                  }
                  case folder:
                  {
                     bool relative = true;
                     char fileRelative[MAX_LOCATION];
                     char filePath[MAX_LOCATION];
                     filePath[0] = '\0';
                     PathCat(filePath, prj.topNode.path);
                     PathCat(filePath, stack[frame].path);
                     fileRelative[0] = '\0';
                     PathCat(fileRelative, stack[frame].path);
                     if(relative && mode == workspace && prj != ide.project)
                     {
                        char special[MAX_LOCATION];
                        sprintf(special, "(%s)%s", prj.name, fileRelative);
                        strcpy(fileRelative, special);
                     }
                     if(nameCriteria[0] && (bool)SearchString(stack[frame].name, 0, nameCriteria, false, false))
                     {
                        dirsMatchedCount++;
                        app.Lock();
                           ide.outputView.findBox.Logf(
                                 "%s\n", relative ? fileRelative : filePath);
                        app.Unlock();
                     }
                     if((subDirs || firtIteration) && stack[frame].files && stack[frame].files.count)
                     {
                        int lastFrame = frame;
                        frame++;
                        stack[frame] = stack[lastFrame].files.first;
                        firtIteration = false;
                     }
                     else
                        stack[frame] = stack[frame].next;
                     break;
                  }
                  case resources:
                     stack[frame] = stack[frame].next;
                     break;
               }
               while(frame && !stack[frame])
               {
                  frame--;
                  if(frame == 1 && projectNode && stack[frame] == projectNode)
                     stack[frame] = null;
                  else if(frame)
                     stack[frame] = stack[frame].next;
               }
            }
            if(mode == project) break;
         }
         if(abort)
         {
            for( ; frame ; frame--)
               stack[frame] = null;
         }
      }
      delete replaceEdit;

      active = false;

      app.Lock();
         if(filesSearchedCount)
         {
            if(!contentCriteria[0] && (filesMatchedCount || dirsMatchedCount))
               ide.outputView.findBox.Logf("\n");
            if(globalFindCount)
               ide.outputView.findBox.Logf(
                     $"%s search %s a total of %d match%s in %d out of the %d file%s searched\n",
                     abort ? $"Aborted" : $"Completed", replaceMode ? $"replaced" : $"found", globalFindCount, (globalFindCount > 1) ? $"es" : "",
                     filesMatchedCount, filesSearchedCount, (filesSearchedCount > 1) ? $"s" : "");
            else if(filesMatchedCount)
               ide.outputView.findBox.Logf(
                     $"%s search found a total of %d match%s in the %d file%s searched\n",
                     abort ? $"Aborted" : $"Completed", filesMatchedCount, (filesMatchedCount > 1) ? $"es" : "",
                     filesSearchedCount, (filesSearchedCount > 1) ? $"s" : "");
            else
               ide.outputView.findBox.Logf(
                     $"%s search did not find any match in the %d files searched\n",
                     abort ? $"Aborted" : $"Completed", filesSearchedCount);
         }
         else
            ide.outputView.findBox.Logf(
                  $"%s search did not find any file\n", abort ? $"Aborted" : $"Completed");
         findDialog.SearchComplete();
      app.Unlock();
      return 0;
   }

   int SearchFileContent(char *filePath, bool relative, char *fileRelative)
   {
      int findCount = -1;
      File f = FileOpen(filePath, read);
      if(f)
      {
         int lineNum = 0;
         char line[65536];
         findCount = 0;
         while(f.GetLine(line, 65536/* should there be a - 1 here? */) && !abortNow)
         {
            int col = 0;
            uint start = 0;
            char * find = null;
            int inLineFindCount = 0;
            lineNum++;
            while((find = SearchString(line, start, contentCriteria, contentMatchCase, contentWholeWord)) && !abortNow)
            {
               if(!col)
                  col = find - &line[start] + 1;
               start += (find - &line[start]) / sizeof(char) + strlen(contentCriteria);
               inLineFindCount++;
            }
            if(inLineFindCount && !abortNow)
            {
               char s1[6] = "      ";
               char s2[4] = "    ";
               int len = strlen(line);
               s1[6 - HowManyDigits(lineNum)] = '\0';
               s2[4 - HowManyDigits(col)] = '\0';
               // Cut the line longer than 1024 because Logf prints to a buffer (and we don't want to output crazy long lines either)
               if(len > 1023)
               {
                  line[1023] = '\0';
                  line[1022] = '.';
                  line[1021] = '.';
                  line[1020] = '.';
               }
               app.Lock();
                  ide.outputView.findBox.Logf(
                        "   %s:%d:%d%s%s> %s\n", relative ? fileRelative : filePath,
                        lineNum, col, s1, s2, line);
               app.Unlock();
               findCount += inLineFindCount;
            }
            // todo
            /*else
               f.Seek(-strlen(contentCriteria), current);*/
         }
         delete f;
      }
      else
      {
         app.Lock();
            ide.outputView.findBox.Logf($"Unable to open file %s\n\n", filePath);
         app.Unlock();
      }
      if(findCount)
      {
         app.Lock();
            ide.outputView.findBox.Logf(
                  $"Found %d match%s in \"%s\"%s\n\n", findCount, (findCount > 1) ? "es" : "",
                  relative ? fileRelative : filePath, abortNow ? $" before search was aborted" : "");
         app.Unlock();
      }
      return findCount;
   }

   int SearchFileContentAndReplace(char *filePath, bool relative, char *fileRelative, EditBox edit)
   {
      int replaceCount = -1;
      File f = FileOpen(filePath, read);
      if(f)
      {
         char line[65536];
         replaceCount = 0;
         while(f.GetLine(line, 65536/* should there be a - 1 here? */) && !abortNow)
         {
            int col = 0;
            char * find = null;
            int inLineFindCount = 0;
            if(SearchString(line, 0, contentCriteria, contentMatchCase, contentWholeWord) && !abortNow)
            {
               int lastLineNum = 0;
               f.Seek(0, start);
               edit.Load(f);
               delete f;

               for(; edit.Find(contentCriteria, contentWholeWord, contentMatchCase, true) == found; replaceCount++)
               {
                  int lineNum = edit.lineNumber + 1;
                  edit.PutS(contentReplace);
                  if(lineNum != lastLineNum)
                  {
                     int len;
                     char line[1024];
                     char s1[6] = "      ";
                     char s2[4] = "    ";
                     //int len = strlen(line);
                     s1[6 - HowManyDigits(lineNum)] = '\0';
                     s2[4 - HowManyDigits(col)] = '\0';
                     strncpy(line, edit.line.text, 1023);
                     line[1023] = '\0';
                     len = strlen(line);
                     // Cut the line longer than 1024 because Logf prints
                     // to a buffer (and we don't want to output crazy long lines either)
                     if(len > 1023)
                     {
                        line[1022] = '.';
                        line[1021] = '.';
                        line[1020] = '.';
                     }
                     app.Lock();
                        ide.outputView.findBox.Logf(
                              "   %s:%d:%d%s%s> %s\n", relative ? fileRelative : filePath,
                              lineNum, col, s1, s2, line);
                     app.Unlock();
                  }
               }
               if(replaceCount)
               {
                  if((f = FileOpen(filePath, write)))
                  {
                     edit.Save(f, false);
                     delete f;
                  }
               }
               edit.Clear();
               break;
            }
            // todo
            /*else
               f.Seek(-strlen(contentCriteria), current);*/
               
         }
         delete f;
      }
      else
      {
         app.Lock();
            ide.outputView.findBox.Logf($"Unable to open file %s\n\n", filePath);
         app.Unlock();
      }
      if(replaceCount)
      {
         app.Lock();
            ide.outputView.findBox.Logf(
                  $"Replaced %d match%s in \"%s\"%s\n\n", replaceCount, (replaceCount > 1) ? $"es" : "",
                  relative ? fileRelative : filePath, abortNow ? $" before search was aborted" : "");
         app.Unlock();
      }
      return replaceCount;
   }
}

static struct SearchStackFrame
{
   int tag;
   char path[MAX_LOCATION];
   FileListing fileList;
};

