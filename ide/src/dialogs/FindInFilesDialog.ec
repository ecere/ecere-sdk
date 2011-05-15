import "ide"

enum FindInFilesMode { directory, workspace, project };

class FindInFilesDialog : Window
{
   text = "Find In Files";
   background = activeBorder;
   borderStyle = sizable;
   minClientSize = { 440, 202 };
   maxClientSize = { 640, 202 };
   hasClose = true;
   tabCycle = true;
   size = { 440, 202 };
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
            filterDrop.AddString("All files");

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

   void AddProjectItem(Project project)
   {
      if(created)
      {
         char label[MAX_FILENAME];
         DataRow row;
         sprintf(label, "%s Project", project.name);
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
   Project lastSelectionProject;

   FindInFilesDialog()
   {
      GetWorkingDir(currentDirectory, MAX_DIRECTORY);
      FileFixCase(currentDirectory);
      findWhere.path = currentDirectory;
   }

   ~FindInFilesDialog()
   {
      SearchStop();
   }

   Label labelFindIn { this, position = { 16, 6 }, labeledWindow = findIn };
   DropBox findIn
   {
      this, text = "Find in:", hotKey = altI, size = { 256, 24 }, position = { 96, 4 };
      anchor = { left = 96, top = 4, right = 100 };

      bool NotifySelect(DropBox control, DataRow row, Modifiers mods)
      {
         bool disabled = row != inDirectoryRow;
         findWhere.disabled = disabled;
         subDirs.disabled = disabled;
         if(row)
         {
            lastSelectionMode = mode;
            lastSelectionProject = lastSelectionMode == project ? (Project)row.tag : null;
         }
         return true;
      }
   };
   
   Label labelFindWhere { this, position = { 16, 32 }, labeledWindow = findWhere };
   PathBox findWhere
   {
      this, text = "Find where:", hotKey = altH, size = { 256, 22 }, position = { 96, 30 };
      anchor = { left = 96, top = 30, right = 100 };
      typeExpected = directory, browseDialog = fileDialog;
   };
   
   Button subDirs { this, text = "Include Subdirectories", altU, size = { 132, 15 }, position = { 96, 54 }, isCheckbox = true, checked = true };
   
   Label labelFilter { this, position = { 16, 79 }, labeledWindow = filterDrop };
   DropBox filterDrop
   {
      this, text = "Filter:", hotKey = altL, size = { 256, 24 }, position = { 96, 74 };
      anchor = { left = 96, top = 74, right = 100 };

      bool NotifySelect(DropBox control, DataRow row, Modifiers mods)
      {
         fileFilter = row ? row.tag : 0;
         //ListFiles();
         return true;
      }
   };
   
   Label labelFileName { this, position = { 16, 108 }, labeledWindow = fileName };
   EditBox fileName
   {
      this, text = "File name:", altN, size = { 256, 20 }, position = { 96, 104 };
      anchor = { left = 96, top = 104, right = 100 };
   };
   
   //Button nameWholeWord { this, text = "Whole word only", AltO, size = { 106, 15 }, position = { 96, 128 }, isCheckbox = true };
   //Button nameMatchCase { this, text = "Match case", altA, size = { 80, 15 }, position = { 96, 146 }, isCheckbox = true };
   
   Label labelFindContent { this, position = { 16, 132 }, labeledWindow = findContent };
   EditBox findContent
   {
      this, text = "Find what:", altT, size = { 256, 20 }, position = { 96, 128 };
      anchor = { left = 96, top = 128, right = 100 };
   };
   
   Button contentWholeWord { this, text = "Whole word only", altW, size = { 106, 15 }, position = { 96, 152 }, isCheckbox = true };
   
   Button contentMatchCase { this, text = "Match case", altC, size = { 80, 15 }, position = { 96, 170 }, isCheckbox = true };
   
   Button find
   {
      parent = this, text = "Find", hotKey = altF, isDefault = true, size = { 80, 21 }, anchor = { top = 10, right = 10 }, keyRepeat = true;

      bool NotifyClicked(Button control, int x, int y, Modifiers mods)
      {
         String findPath = findWhere.path;
         if(findIn.currentRow == inDirectoryRow && !findPath[0])
         {
            findWhere.Activate();
            MessageBox { type = ok, master = parent, 
                  text = "Find In Files", contents = "You must specify a search location." }.Modal();
         }
         else if(!FileExists(findPath))
         {
            findWhere.Activate();
            MessageBox { type = ok, master = parent, 
                  text = "Find In Files", contents = "Search location does not exist. Please provide a valid location." }.Modal();
         }
         else if(!fileName.contents[0] && !findContent.contents[0])
         {
            findContent.Activate();
            MessageBox { type = ok, master = parent, 
                  text = "Find In Files", contents = "Nothing to be found. Please specify at least one criteria." }.Modal();
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
      parent = this, text = "Cancel", hotKey = { escape }, size = { 80, 21 }, anchor = { top = 45, right = 10 };

      bool NotifyClicked(Button control, int x, int y, Modifiers mods)
      {
         findContent.Activate();
         Destroy(0);
         return true;
      }
   };
   
   SearchThread searchThread { findDialog = this };
   FileDialog fileDialog { master = this, type = selectDir, text = "Select Search Location..." };

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
         inDirectoryRow = findIn.AddString("Directory");
      if(withWorkspace)
      {
         if(!inWorkspaceRow)
            inWorkspaceRow = findIn.AddString("Workspace");
         for(prj : ide.workspace.projects)
            AddProjectItem(prj);
         if(lastSelectionProject)
         {
            for(row = findIn.firstRow; row; row = row.next)
               if((Project)row.tag == lastSelectionProject)
                  break;
            if(row)
               findIn.SelectRow(row);
            else
               lastSelectionProject = null;
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
      disabled = findIn.currentRow != inDirectoryRow;

      findWhere.disabled = disabled;
      subDirs.disabled = disabled;
      
      findContent.Activate();
      return true;
   }

   void SearchStart()
   {
      char text[2048];
      
      searchThread.active = true;

      if(findIn.currentRow == inDirectoryRow)
      {
         searchThread.mode = directory;
         strcpy(searchThread.dir, findWhere.slashPath);
      }
      else if(findIn.currentRow == inWorkspaceRow)
         searchThread.mode = workspace;
      else
      {
         searchThread.mode = project;
         searchThread.project = (Project)findIn.currentRow.tag;
      }
      searchThread.subDirs = subDirs.checked;
      //searchThread.nameMatchCase = nameMatchCase.checked;
      //searchThread.nameWholeWord = nameWholeWord.checked;
      searchThread.contentMatchCase = contentMatchCase.checked;
      searchThread.contentWholeWord = contentWholeWord.checked;
      
      searchThread.filter = filters[fileFilter];

      strcpy(searchThread.nameCriteria, fileName.contents);
      strcpy(searchThread.contentCriteria, findContent.contents);

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
      //cancel.text = "Cancel";
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
   char dir[MAX_DIRECTORY], contentCriteria[1024], nameCriteria[1024];
   FileFilter filter;
   FindInFilesDialog findDialog;
   FindInFilesMode mode;
   Project project;

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
      int globalFindCount = 0, filesSearchedCount = 0, filesMatchedCount = 0;
      //double lastTime = GetTime();
      SearchStackFrame stack[1024];
      FindInFilesMode mode = this.mode;

      abort = false;
      abortNow = false;

      app.Lock();
         {
            char substring[512];
            if(nameCriteria[0])
               sprintf(substring, " with file name matching \"%s\"", nameCriteria);
            else
               substring[0] = '\0';
            if(mode == directory)
            {
               char * s;
               ide.outputView.findBox.Logf("Searching \"%s\"%s for %s%s%s containing \"%s\"\n\n", (s = CopySystemPath(dir)), subDirs ? " and its sub directories" : "", filter.name, substring, substring[0] ? " and" : "", contentCriteria);
               delete s;
            }
            else if(mode == workspace)
               ide.outputView.findBox.Logf("Searching workspace files for files%s%s containing \"%s\"\n\n", substring, substring[0] ? " and" : "", contentCriteria);
            else if(mode == project)
               ide.outputView.findBox.Logf("Searching project %s files for files%s%s containing \"%s\"\n\n", project.name, substring, substring[0] ? " and" : "", contentCriteria);
         }
      app.Unlock();
      
      if(mode == directory)
      {
         strcpy(stack[0].path, dir);
         stack[0].fileList = FileListing { dir, extensions = filter.extensions };  // there should be a sorted = true/false 

         for(frame = 0; frame >= 0 && !abort; )
         {
            if(stack[frame].fileList.Find())
            {
               if(!stack[frame].fileList.stats.attribs.isDirectory)
               {
                  bool relative = false;
                  bool match = true;
                  char fileRelative[MAX_LOCATION];
                  if(filter.ValidateFileName(stack[frame].fileList.name))
                  {
                     MakePathRelative(stack[frame].fileList.path, dir, fileRelative);
                     relative = true;
                     
                     filesSearchedCount++;
                     if(nameCriteria[0])
                     {
                        char name[MAX_LOCATION];
                        GetLastDirectory(stack[frame].fileList.path, name);
                        if(!(bool)SearchString(name, 0, nameCriteria, false, false))
                           match = false;
                     }
                     if(match && contentCriteria[0])
                     {
                        int ret;

                        app.Lock();
                           ide.outputView.findBox.Tellf("Searching %s for %s", relative ? fileRelative : stack[frame].fileList.path, contentCriteria);
                        app.Unlock();

                        ret = SearchFileContent(stack[frame].fileList.path, relative, fileRelative);
                        if(ret > -1)
                        {
                           if(ret > 0)
                           {
                              globalFindCount += ret;
                              filesMatchedCount++;
                           }
                        }
                     }
                     else if(match && nameCriteria[0])
                     {
                        filesMatchedCount++;
                        app.Lock();
                           ide.outputView.findBox.Logf("%s matches the file name criteria\n", relative ? fileRelative : stack[frame].fileList.path);
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
                     ide.outputView.findBox.Tellf("Searching %s", relative ? fileRelative : stack[frame].fileList.path);
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
            stack[1] = prj.topNode;

            for(frame = 1; frame && !abort;)
            {
               switch(stack[frame].type)
               {
                  case project:
                     if(stack[frame].files && stack[frame].files.count)
                     {
                        int lastFrame = frame;
                        frame++;
                        stack[frame] = stack[lastFrame].files.first;
                     }
                     break;
                  case file:
                  {   
                     bool relative = false;
                     char fileRelative[MAX_LOCATION];
                     char filePath[MAX_LOCATION];
                     strcpy(filePath, stack[1].path);
                     PathCat(filePath, stack[frame].path);
                     PathCat(filePath, stack[frame].name);
                     relative = prj.GetRelativePath(filePath, fileRelative);
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
                                 ide.outputView.findBox.Tellf("Searching %s for \"%s\"", relative ? fileRelative : filePath, contentCriteria);
                              app.Unlock();

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
                                 ide.outputView.findBox.Logf("%s\n", relative ? fileRelative : filePath); /*" matches the file name criteria"*/
                              app.Unlock();
                           }
                        }
                     }
                     stack[frame] = stack[frame].next;
                     break;
                  }
                  case folder:
                     if(stack[frame].files && stack[frame].files.count)
                     {
                        int lastFrame = frame;
                        frame++;
                        stack[frame] = stack[lastFrame].files.first;
                     }
                     else
                        stack[frame] = stack[frame].next;
                     break;
                  case resources:
                     stack[frame] = stack[frame].next;
                     break;
               }
               while(frame && !stack[frame])
               {
                  frame--;
                  if(frame)
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

      active = false;

      app.Lock();
         if(filesSearchedCount)
         {
            if(globalFindCount)
               ide.outputView.findBox.Logf("%s search found a total of %d match%s in %d out of the %d file%s searched\n", abort ? "Aborted" : "Completed", globalFindCount, (globalFindCount > 1) ? "es" : "", filesMatchedCount, filesSearchedCount, (filesSearchedCount > 1) ? "s" : "");
            else if(filesMatchedCount)
               ide.outputView.findBox.Logf("%s search found a total of %d match%s in the %d file%s searched\n", abort ? "Aborted" : "Completed", filesMatchedCount, (filesMatchedCount > 1) ? "es" : "", filesSearchedCount, (filesSearchedCount > 1) ? "s" : "");
            else
               ide.outputView.findBox.Logf("%s search did not find any match in the %d files searched\n", abort ? "Aborted" : "Completed", filesSearchedCount);
         }
         else
            ide.outputView.findBox.Logf("%s search did not find any file\n", abort ? "Aborted" : "Completed");
         findDialog.SearchComplete();
      app.Unlock();
      return 0;
   }

   int SearchFileContent(char *filePath, bool relative, char *fileRelative)
   {
      if(contentCriteria[0])
      {
         int inFileFindCount = 0, lineNum = 0;
         char line[65536];
         File file = FileOpen(filePath, read);
         if(!file)
         {
            app.Lock();
               ide.outputView.findBox.Logf("Unable to open file %s\n\n", filePath);
            app.Unlock();
            return -1;
         }
         while(file.GetLine(line, 65536/* should there be a - 1 here? */) && !abortNow)
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
            if(inLineFindCount)
            {
               char s1[6] = "      ";
               char s2[4] = "    ";
               int len = strlen(line);
               s1[6 - HowManyDigits(lineNum)] = '\0';
               s2[4 - HowManyDigits(col)] = '\0';
               app.Lock();
               // Cut the line longer than 1024 because Logf prints to a buffer (and we don't want to output crazy long lines either)
               if(len > 1023) line[1023] = '\0';
               ide.outputView.findBox.Logf("   %s:%d:%d%s%s> %s\n", relative ? fileRelative : filePath, lineNum, col, s1, s2, line);
               app.Unlock();
               inFileFindCount += inLineFindCount;
            }
         }
         delete file;

         if(inFileFindCount)
         {
            app.Lock();
               ide.outputView.findBox.Logf("Found %d match%s in \"%s\"%s\n\n", inFileFindCount, (inFileFindCount > 1) ? "es" : "", relative ? fileRelative : filePath, abortNow ? " before search was aborted" : "");
            app.Unlock();
         }
         return inFileFindCount;
      }
      return -1;
   }
}

static struct SearchStackFrame
{
   int tag;
   char path[MAX_LOCATION];
   FileListing fileList;
};

