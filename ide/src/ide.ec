#ifdef ECERE_STATIC
public import static "ecere"
public import static "ec"
#else
public import "ecere"
public import "ec"
#endif

import "GlobalSettingsDialog"
import "NewProjectDialog"
import "FindInFilesDialog"
import "ActiveCompilerDialog"

#ifdef GDB_DEBUG_GUI
import "GDBDialog"
#endif

import "Project"
import "ProjectActiveConfig"
import "ProjectConfig"
import "ProjectNode"
import "NodeProperties"
import "ProjectSettings"
import "ProjectView"
import "Workspace"

import "CodeEditor"
import "Designer"
import "ToolBox"
import "Sheet"

import "Debugger"

import "OutputView"
import "BreakpointsView"
import "CallStackView"
import "ThreadsView"
import "WatchesView"

#ifndef NO3D
import "ModelView"
#endif
import "PictureEdit"

import "about"

import "FileSystemIterator"

#if defined(__WIN32__)
define pathListSep = ";";
#else
define pathListSep = ":";
#endif

define maxPathLen = 65 * MAX_LOCATION;

class PathBackup : struct
{
   String oldLDPath;
   String oldPath;

   PathBackup()
   {
      oldPath = new char[maxPathLen];
      oldLDPath = new char[maxPathLen];

      GetEnvironment("PATH", oldPath, maxPathLen);
#if defined(__APPLE__)
      GetEnvironment("DYLD_LIBRARY_PATH", oldLDPath, maxPathLen);
#else
      GetEnvironment("LD_LIBRARY_PATH", oldLDPath, maxPathLen);
#endif
   }

   ~PathBackup()
   {
      SetEnvironment("PATH", oldPath);
#if defined(__APPLE__)
      SetEnvironment("DYLD_LIBRARY_PATH", oldLDPath);
#else
      SetEnvironment("LD_LIBRARY_PATH", oldLDPath);
#endif
      delete oldPath;
      delete oldLDPath;
   }
};

enum OpenCreateIfFails { no, yes, something, whatever };
enum OpenMethod { normal, add };

static Array<FileFilter> fileFilters
{ [
   { $"C/C++/eC Files (*.ec, *.eh, *.c, *.cpp, *.cc, *.cxx, *.h, *.hpp, *.hh, *.hxx)", "ec, eh, c, cpp, cc, cxx, h, hpp, hh, hxx" },
   { $"Header Files for eC/C/C++ (*.eh, *.h, *.hpp, *.hh, *.hxx)", "eh, h, hpp, hh, hxx" },
   { $"C/C++/eC Source Files (*.ec, *.c, *.cpp, *.cc, *.cxx)", "ec, c, cpp, cc, cxx" },
   { $"Text files (*.txt, *.text, *.nfo, *.info)", "txt, text, nfo, info" },
   { $"Web files (*.html, *.htm, *.xhtml, *.css, *.php, *.js, *.jsi, *.rb, *.xml)", "html, htm, xhtml, css, php, js, jsi, rb, xml" },
   { $"Image Files (*.jpg, *.jpeg, *.bmp, *.pcx, *.png, *.gif)", "jpg, jpeg, bmp, pcx, png, gif" },
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
   { $"Project Files (*.epj)", ProjectExtension }
] };

static Array<FileType> projectTypes
{ [
   { $"Project File", ProjectExtension }
] };

static Array<FileFilter> findInFilesFileFilters
{ [
   { $"eC Files (*.ec, *.eh)", "ec, eh" },
   { $"C/C++/eC Files (*.ec, *.eh, *.c, *.cpp, *.cc, *.cxx, *.h, *.hpp, *.hh, *.hxx)", "ec, eh, c, cpp, cc, cxx, h, hpp, hh, hxx" },
   { $"Header Files for eC/C/C++ (*.eh, *.h, *.hpp, *.hh, *.hxx)", "eh, h, hpp, hh, hxx" },
   { $"C/C++/eC Source Files (*.ec, *.c, *.cpp, *.cc, *.cxx)", "ec, c, cpp, cc, cxx" },
   { $"Text files (*.txt)", "txt" },
   { $"All files", null }
] };

FileDialog ideFileDialog
{
   type = multiOpen, text = $"Open";
   types = fileTypes.array, sizeTypes = fileTypes.count * sizeof(FileType), filters = fileFilters.array, sizeFilters = fileFilters.count * sizeof(FileFilter);
};

define openProjectFileDialogTitle = $"Open Project";
define addProjectFileDialogTitle = $"Open Additional Project";
FileDialog ideProjectFileDialog
{
   type = open;
   types = projectTypes.array, sizeTypes = projectTypes.count * sizeof(FileType), filters = projectFilters.array, sizeFilters = projectFilters.count * sizeof(FileFilter);
};

GlobalSettingsDialog globalSettingsDialog
{
   ideSettings = ideSettings;
   settingsContainer = settingsContainer;

   void OnGlobalSettingChange(GlobalSettingsChange globalSettingsChange)
   {
      switch(globalSettingsChange)
      {
         case editorSettings:
         {
            Window child;
            for(child = ide.firstChild; child; child = child.next)
            {
               if(child._class == class(CodeEditor))
               {
                  CodeEditor codeEditor = (CodeEditor) child;
                  codeEditor.editBox.freeCaret = ideSettings.useFreeCaret;
                  // codeEditor.editBox.lineNumbers = ideSettings.showLineNumbers;
                  codeEditor.editBox.caretFollowsScrolling = ideSettings.caretFollowsScrolling;
                  codeEditor.OnPostCreate(); // Update editBox margin size
               }
            }
            break;
         }
         case projectOptions:
            break;
         case compilerSettings:
         {
            ide.UpdateMakefiles();
            break;
         }
      }
   }
};

void DrawLineMarginIcon(Surface surface, BitmapResource resource, int line, int lineH, int scrollY, int boxH)
{
   int lineY;
   if(line)
   {
      lineY = (line - 1) * lineH;
      if(lineY + lineH > scrollY && lineY + lineH < scrollY + boxH)
      {
         Bitmap bitmap = resource.bitmap;
         if(bitmap)
            surface.Blit(bitmap, 0, lineY - scrollY + (lineH - bitmap.height) / 2 + 1, 0, 0, bitmap.width, bitmap.height);
      }
   }
}

class IDE : Window
{
   nativeDecorations = true;
   icon = { ":icon.png" };
   text = titleECEREIDE;
   background = Color { 85, 85, 85 };
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   //tabCycle = true;
   hasVertScroll = true;
   hasHorzScroll = true;
   hasMenuBar = true;
   hasStatusBar = true;
#if 0 //def _DEBUG
   //stayOnTop = true;
   size = { 800, 600 };
   anchor = { top = 0, right = 0, bottom = 0 };
#else
   state = maximized;
   anchor = { left = 0, top = 0, right = 0, bottom = 0 };
#endif
   menu = Menu {  };

   MenuItem * driverItems, * skinItems;
   StatusField pos { width = 150 };
   StatusField ovr, caps, num;

   BitmapResource back                 { ":ecereBack.jpg", window = this };
   BitmapResource bmpBp                { ":codeMarks/breakpoint.png", window = this };
   BitmapResource bmpBpDisabled        { ":codeMarks/breakpointDisabled.png", window = this };
   BitmapResource bmpBpHalf            { ":codeMarks/breakpointHalf.png", window = this };
   BitmapResource bmpBpHalfDisabled    { ":codeMarks/breakpointHalfDisabled.png", window = this };
   BitmapResource bmpCursor            { ":codeMarks/cursor.png", window = this };
   BitmapResource bmpCursorError       { ":codeMarks/cursorError.png", window = this };
   BitmapResource bmpTopFrame          { ":codeMarks/topFrame.png", window = this };
   BitmapResource bmpTopFrameError     { ":codeMarks/topFrameError.png", window = this };
   BitmapResource bmpTopFrameHalf      { ":codeMarks/topFrameHalf.png", window = this };
   BitmapResource bmpTopFrameHalfError { ":codeMarks/topFrameHalfError.png", window = this };
   
   Debugger debugger { };

   ProjectView projectView;

   OutputView outputView
   {
      parent = this;

      void OnGotoError(char * line)
      {
         ide.GoToError(line);
      }

      void OnCodeLocationParseAndGoTo(char * line)
      {
         ide.CodeLocationParseAndGoTo(line, ide.findInFilesDialog.findProject, ide.findInFilesDialog.findDir);
      }

      bool OnKeyDown(Key key, unichar ch)
      {
         switch(key)
         {
            case escape: 
               if(!ide.findInFilesDialog || !ide.findInFilesDialog.SearchAbort())
                  ide.ShowCodeEditor(); 
               break;
            case ctrlS:
               ide.projectView.stopBuild = true;
               break;
            default:
            {
               OutputView::OnKeyDown(key, ch);
               break;
            }
         }
         return true;
      }

      bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
      {
         if(active)
            ide.RepositionWindows(false);
         return true;
      }

      bool OnClose(bool parentClosing)
      {
         visible = false;
         if(!parentClosing)
            ide.RepositionWindows(false);
         return parentClosing;
      }
   };

   CallStackView callStackView
   {
      parent = this, font = { panelFont.faceName, panelFont.size };

      void OnGotoLine(char * line)
      {
         int stackLvl;
         stackLvl = atoi(line);
         ide.debugger.GoToStackFrameLine(stackLvl, true);
      }

      void OnSelectFrame(int lineNumber)
      {
         ide.debugger.SelectFrame(lineNumber);
      }

      void OnToggleBreakpoint()
      {
         Debugger debugger = ide.debugger;
         if(debugger.activeFrame && debugger.activeFrame.absoluteFile)
         {
            int line = debugger.activeFrame.line;
            char name[MAX_LOCATION];
            Project prj = null;
            // TOFIX: Improve on this, don't use only filename, make a function
            GetLastDirectory(debugger.activeFrame.absoluteFile, name);
            if(ide && ide.workspace)
            {
               for(p : ide.workspace.projects)
               {
                  if(p.topNode.Find(name, false))
                  {
                     prj = p;
                     break;
                  }
               }
               if(!prj)
               {
                  for(p : ide.workspace.projects)
                  {
                     if(eString_PathInsideOf(debugger.activeFrame.absoluteFile, p.topNode.path))
                     {
                        prj = p;
                        break;
                     }
                  }
               }
            }
            debugger.ToggleBreakpoint(debugger.activeFrame.absoluteFile, line, prj);
            Update(null);
            {
               CodeEditor codeEditor = (CodeEditor)ide.FindWindow(debugger.activeFrame.absoluteFile);
               if(codeEditor) { codeEditor.Update(null); Activate(); }
            }
         }
      }

      bool OnKeyDown(Key key, unichar ch)
      {
         switch(key)
         {
            case escape: ide.ShowCodeEditor(); break;
         }
         return true;
      }

      bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
      {
         if(active)
            ide.RepositionWindows(false);
         return true;
      }

      bool OnClose(bool parentClosing)
      {
         visible = false;
         if(!parentClosing)
            ide.RepositionWindows(false);
         return parentClosing;
      }

      void OnRedraw(Surface surface)
      {
         bool error;
         int lineCursor, lineTopFrame, activeThread, hitThread;
         int lineH, scrollY, boxH;
         BitmapResource bmp;
         Breakpoint bp = null;
         Debugger debugger = ide.debugger;
         Frame activeFrame = debugger.activeFrame;

         boxH = clientSize.h;
         scrollY = editBox.scroll.y;
         displaySystem.FontExtent(editBox.font.font, " ", 1, null, &lineH);

         activeThread = debugger.activeThread;
         hitThread = debugger.hitThread;
         debugger.GetCallStackCursorLine(&error, &lineCursor, &lineTopFrame);

         if(activeFrame && activeFrame.absoluteFile)
         {
            for(i : ide.workspace.breakpoints; i.type == user)
            {
               if(i.absoluteFilePath && i.absoluteFilePath[0] && 
                  !fstrcmp(i.absoluteFilePath, activeFrame.absoluteFile) &&
                  activeFrame.line == i.line)
               {
                  bp = i;
                  break;
               }
            }
         }

         if(bp)
            DrawLineMarginIcon(surface,
                  /*(lineCursor == 1 || lineTopFrame == 1) ? */ide.bmpBpHalf/* : ide.bmpBp*/,
                  lineCursor /*1*/, lineH, scrollY, boxH);

         /*
         if(activeThread && activeThread == hitThread && debugger.bpHit && debugger.bpHit.type == user)
            DrawLineMarginIcon(surface,
                  (lineCursor == 1 || lineTopFrame == 1) ? ide.bmpBpHalf : ide.bmpBp,
                  1, lineH, scrollY, boxH);
         */
         DrawLineMarginIcon(surface, error ? ide.bmpCursorError : ide.bmpCursor, lineCursor, lineH, scrollY, boxH);
         if(bp && lineCursor == 1) //activeThread && activeThread == hitThread && debugger.bpHit && debugger.bpHit.type == user)
            bmp = error ? ide.bmpTopFrameHalfError : ide.bmpTopFrameHalf;
         else
            bmp = error ? ide.bmpTopFrameError : ide.bmpTopFrame;
         DrawLineMarginIcon(surface, bmp, lineTopFrame, lineH, scrollY, boxH);
         if(editBox.horzScroll && editBox.horzScroll.visible)
         {
            surface.SetBackground(control);
            surface.Area(0, editBox.clientSize.h, 20 - 1, clientSize.h - 1);
         }
      }
   };
   
   WatchesView watchesView { parent = this };
   ThreadsView threadsView
   {
      parent = this, font = { panelFont.faceName, panelFont.size };

      bool OnKeyDown(Key key, unichar ch)
      {
         switch(key)
         {
            case escape: ide.ShowCodeEditor(); break;
         }
         return true;
      }

      bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
      {
         if(active)
            ide.RepositionWindows(false);
         return true;
      }

      bool OnClose(bool parentClosing)
      {
         visible = false;
         if(!parentClosing)
            ide.RepositionWindows(false);
         return parentClosing;
      }

      void OnSelectThread(int threadId)
      {
         if(threadId)
            ide.debugger.SelectThread(threadId);
      }

      bool OnGetThreadsInfo(int * activeThread, int * hitThread, int * signalThread)
      {
         bool result = false;
         Debugger debugger = ide.debugger;
         *activeThread = debugger.activeThread;
         *hitThread = debugger.hitThread;
         *signalThread = debugger.signalThread;
         result = true;
         return result;
      }
   };
   BreakpointsView breakpointsView { parent = this };

   ToolBox toolBox { parent = this };
   Sheet sheet { parent = this };

   char * tmpPrjDir;
   property char * tmpPrjDir { set { delete tmpPrjDir; if(value) tmpPrjDir = CopyString(value); } get { return tmpPrjDir; } };

   Menu fileMenu { menu, $"File", f };
      MenuItem fileNewItem
      {
         fileMenu, $"New", n, ctrlN;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            Window document = (Window)NewCodeEditor(this, normal, false);
            document.NotifySaved = DocumentSaved;
            return true;
         }
      }
      MenuItem fileOpenItem
      {
         fileMenu, $"Open...", o, ctrlO;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(!projectView && ideSettings.ideFileDialogLocation)
               ideFileDialog.currentDirectory = ideSettings.ideFileDialogLocation;
            for(;;)
            {
               if(ideFileDialog.Modal() == ok)
               {
                  bool gotWhatWeWant = false;
                  int c;
                  int numSelections = ideFileDialog.numSelections;
                  char ** multiFilePaths = ideFileDialog.multiFilePaths;

                  for(c = 0; c < numSelections; c++)
                  {
                     if(OpenFile(multiFilePaths[c], normal, true, fileTypes[ideFileDialog.fileType].typeExtension, no, normal))
                        gotWhatWeWant = true;
                  }
                  if(gotWhatWeWant ||
                     MessageBox { type = yesNo, master = this, text = $"Error opening file", 
                     contents = $"Open a different file?" }.Modal() == no)
                  {
                     if(!projectView && gotWhatWeWant)
                        ChangeFileDialogsDirectory(ideFileDialog.currentDirectory, true);
                     break;
                  }
               }
               else
                  break;
            }
            return true;
         }
      }
      MenuItem fileCloseItem { fileMenu, $"Close", c, ctrlF4, NotifySelect = MenuFileClose };
      MenuDivider { fileMenu };
      MenuItem fileSaveItem { fileMenu, $"Save", s, ctrlS };
      MenuItem fileSaveAsItem { fileMenu, $"Save As...", a };
      MenuItem fileSaveAllItem { fileMenu, $"Save All", l, NotifySelect = MenuFileSaveAll };
      MenuDivider { fileMenu };
      MenuItem findInFiles
      {
         fileMenu, $"Find In Files...", f, Key { f, ctrl = true , shift = true };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            findInFilesDialog.replaceMode = false;
            findInFilesDialog.Show();
            return true;
         }
      }
      MenuItem replaceInFiles
      {
         fileMenu, $"Replace In Files...", e, Key { r, ctrl = true , shift = true };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            findInFilesDialog.replaceMode = true;
            findInFilesDialog.Show();
            return true;
         }
      }
      MenuDivider { fileMenu };
      MenuItem globalSettingsItem
      {
         fileMenu, $"Global Settings...", g;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            globalSettingsDialog.master = this;
            if(ide.workspace && ide.workspace.compiler)
               globalSettingsDialog.workspaceActiveCompiler = ide.workspace.compiler;
            else if(ideSettings.defaultCompiler)
               globalSettingsDialog.workspaceActiveCompiler = ideSettings.defaultCompiler;
            globalSettingsDialog.Modal();
            return true;
         }
      }
      MenuDivider { fileMenu };
      Menu recentFiles { fileMenu, $"Recent Files", r };
      Menu recentProjects { fileMenu, $"Recent Projects", p };
      MenuDivider { fileMenu };
      MenuItem exitItem { fileMenu, $"Exit", x, altF4, NotifySelect = MenuFileExit };

      bool FileRecentFile(MenuItem selection, Modifiers mods)
      {
         int id = 0;
         for(file : ideSettings.recentFiles)
         {
            if(id == selection.id)
            {
               OpenFile(file, normal, true, null, no, normal);
               break;
            }
            id++;
         }
         return true;
      }

      bool FileRecentProject(MenuItem selection, Modifiers mods)
      {
         int id = 0;
         for(file : ideSettings.recentProjects)
         {
            if(id == selection.id)
            {
               OpenFile(file, normal, true, null, no, normal);
               break;
            }
            id++;
         }
         return true;
      }

   MenuPlacement editMenu { menu, $"Edit", e };
   
   Menu projectMenu { menu, $"Menu"."Project", p };
      MenuItem projectNewItem
      {
         projectMenu, $"New...", n, Key { n, true, true };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(!DontTerminateDebugSession($"New Project"))
               if(MenuWindowCloseAll(null, 0))
               {
                  NewProjectDialog newProjectDialog;

                  if(projectView)
                  {
                     projectView.visible = false;
                     if(!projectView.Destroy(0))
                        return true;
                  }
                  
                  newProjectDialog = { master = this };
                  newProjectDialog.Modal();
                  if(projectView)
                  {
                     ideSettings.AddRecentProject(projectView.fileName);
                     ide.UpdateRecentMenus();
                     settingsContainer.Save();
                  }
               }
            return true;
         }
      }
      MenuItem projectOpenItem
      {
         projectMenu, $"Open...", o, Key { o, true, true };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(ideSettings.ideProjectFileDialogLocation)
               ideProjectFileDialog.currentDirectory = ideSettings.ideProjectFileDialogLocation;

            ideProjectFileDialog.text = openProjectFileDialogTitle;
            if(ideProjectFileDialog.Modal() == ok)
            {
               OpenFile(ideProjectFileDialog.filePath, normal, true, projectTypes[ideProjectFileDialog.fileType].typeExtension, no, normal);
               //ChangeProjectFileDialogDirectory(ideProjectFileDialog.currentDirectory);
            }
            return true;
         }
      }
      MenuItem projectQuickItem
      {
         projectMenu, $"Quick...", q, f7;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(!projectView)
               QuickProjectDialog{ this }.Modal();
            return true;
         }
      }
      MenuItem projectAddItem
      {
         projectMenu, $"Add project to workspace...", a, Key { a, true, true };
         disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(ideSettings.ideProjectFileDialogLocation)
               ideProjectFileDialog.currentDirectory = ideSettings.ideProjectFileDialogLocation;

            ideProjectFileDialog.text = addProjectFileDialogTitle;
            for(;;)
            {
               if(ideProjectFileDialog.Modal() == ok)
               {
                  if(OpenFile(ideProjectFileDialog.filePath, normal, true, projectTypes[ideProjectFileDialog.fileType].typeExtension, no, add))
                     break;
                  if(MessageBox { type = yesNo, master = this, text = $"Error opening project file", 
                        contents = $"Add a different project?" }.Modal() == no)
                  {
                     break;
                  }
               }
               else
                  break;
            }
            return true;
         }
      }
      MenuItem projectCloseItem
      {
         projectMenu, $"Close", c, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
            {
               if(!ide.DontTerminateDebugSession($"Project Close"))
               {
                  if(findInFilesDialog)
                     findInFilesDialog.SearchStop();
                  projectView.visible = false;
                  if(projectView.Destroy(0))
                     MenuWindowCloseAll(null, 0);
                  {
                     char workingDir[MAX_LOCATION];
                     GetWorkingDir(workingDir, MAX_LOCATION);
                     findInFilesDialog.currentDirectory = workingDir;
                  }
               }
            }
            return true;
         }
      }
      MenuDivider { projectMenu };
      MenuItem activeCompilerItem
      {
         projectMenu, $"Active Compiler...", g, /*altF5, */disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            projectView.MenuCompiler(null, mods);
            return true;
         }
      }
      MenuItem projectActiveConfigItem
      {
         projectMenu, $"Active Configuration...", g, altF5, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            projectView.MenuConfig(projectView.active ? selection : null, mods);
            return true;
         }
      }
      MenuItem projectSettingsItem
      {
         projectMenu, $"Settings...", s, altF7, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            projectView.MenuSettings(projectView.active ? selection : null, mods);
            return true;
         }
      }
      MenuDivider { projectMenu };
      MenuItem projectBrowseFolderItem
      {
         projectMenu, $"Browse Project Folder", p, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.MenuBrowseFolder(null, mods);
            return true;
         }
      }
      MenuDivider { projectMenu };
      MenuItem projectRunItem
      {
         projectMenu, $"Run", r, ctrlF5, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.Run(null, mods);
            return true;
         }
      }
      MenuItem projectBuildItem
      {
         projectMenu, $"Build", b, f7, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.ProjectBuild(projectView.active ? selection : null, mods);
            return true;
         }
      }
      MenuItem projectLinkItem
      {
         projectMenu, $"Relink", l, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.ProjectLink(projectView.active ? selection : null, mods);
            return true;
         }
      }
      MenuItem projectRebuildItem
      {
         projectMenu, $"Rebuild", d, shiftF7, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.ProjectRebuild(projectView.active ? selection : null, mods);
            return true;
         }
      }
      MenuItem projectCleanItem
      {
         projectMenu, $"Clean", e, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
            {
               debugger.Stop();
               projectView.ProjectClean(projectView.active ? selection : null, mods);
            }
            return true;
         }
      }
      MenuItem projectRegenerateItem
      {
         projectMenu, $"Regenerate Makefile", m, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.ProjectRegenerate(projectView.active ? selection : null, mods);
            return true;
         }
      }
      MenuItem projectCompileItem;
   Menu debugMenu { menu, $"Debug", d };
      MenuItem debugStartResumeItem
      {
         debugMenu, $"Start", s, f5, disabled = true;
         NotifySelect = MenuDebugStart;
      }
      bool MenuDebugStart(MenuItem selection, Modifiers mods)
      {
         if(projectView)
         {
            debugStartResumeItem.disabled = true; // a very rare exception to calling AdjustDebugMenus
            if(!projectView.DebugStart())
               debugStartResumeItem.disabled = false; // same exception
         }
         return true;
      }
      bool MenuDebugResume(MenuItem selection, Modifiers mods)
      {
         if(projectView)
            projectView.DebugResume();
         return true;
      }
      MenuItem debugRestartItem
      {
         debugMenu, $"Restart", r, Key { f5, ctrl = true, shift = true }, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.DebugRestart();
            return true;
         }
      }
      MenuItem debugBreakItem
      {
         debugMenu, $"Break", b, Key { pauseBreak, ctrl = true }, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.DebugBreak();
            return true;
         }
      }
      MenuItem debugStopItem
      {
         debugMenu, $"Stop", p, shiftF5, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.DebugStop();
            return true;
         }
      }
      MenuDivider { debugMenu };
      MenuItem debugStepIntoItem
      {
         debugMenu, $"Step Into", i, f11, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.DebugStepInto();
            return true;
         }
      }
      MenuItem debugStepOverItem
      {
         debugMenu, $"Step Over", v, f10, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.DebugStepOver(false);
            return true;
         }
      }
      MenuItem debugStepOutItem
      {
         debugMenu, $"Step Out", o, shiftF11, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.DebugStepOut(false);
            return true;
         }
      }
      MenuPlacement debugRunToCursorItem { debugMenu, $"Run To Cursor", c };
      MenuItem debugSkipStepOverItem
      {
         debugMenu, $"Step Over Skipping Breakpoints", e, shiftF10, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.DebugStepOver(true);
            return true;
         }
      }
      MenuItem debugSkipStepOutItem
      {
         debugMenu, $"Step Out Skipping Breakpoints", t, Key { f11, ctrl = true, shift = true }, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.DebugStepOut(true);
            return true;
         }
      }
      MenuPlacement debugSkipRunToCursorItem { debugMenu, $"Run To Cursor Skipping Breakpoints", u };
      //MenuDivider { debugMenu };
      //MenuPlacement debugToggleBreakpoint { debugMenu, "Toggle Breakpoint", t };
   MenuPlacement imageMenu { menu, $"Image", i };
   Menu viewMenu { menu, $"View", v };
      MenuItem viewProjectItem
      {
         viewMenu, $"Project View", j, alt0, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
            {
               projectView.visible = true;
               projectView.Activate();
            }
            return true;
         }
      }
      MenuPlacement { viewMenu, $"View Designer" };
      MenuPlacement { viewMenu, $"View Code" };
      MenuPlacement { viewMenu, $"View Properties" };
      MenuPlacement { viewMenu, $"View Methods" };
      MenuItem viewDesignerItem
      {
         viewMenu, $"View Designer", d, f8;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            Window client = activeClient;
            Class dataType = client._class;
            if(!strcmp(dataType.name, "Designer"))
            {
               client.visible = true;
               client.Activate();
            }
            else
               ((CodeEditor)client).ViewDesigner();
            return true;
         }
      }
      MenuItem viewCodeItem
      {
         viewMenu, $"View Code", c, f8;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            Window client = activeClient;
            Class dataType = client._class;
            if(!strcmp(dataType.name, "Designer"))
               client = ((Designer)client).codeEditor;

            client.Activate();
            // Do this after so the caret isn't moved yet...
            client.visible = true;
            return true;
         }
      }
      MenuItem viewPropertiesItem
      {
         viewMenu, $"View Properties", p, f4;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            sheet.visible = true;
            sheet.sheetSelected = properties;
            sheet.Activate();
            return true;
         }
      }
      MenuItem viewMethodsItem
      {
         viewMenu, $"View Methods", m, f4;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            sheet.visible = true;
            sheet.sheetSelected = methods;
            sheet.Activate();
            return true;
         }
      }
      MenuItem viewToolBoxItem
      {
         viewMenu, $"View Toolbox", x, f12;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            toolBox.visible = true;
            toolBox.Activate();
            return true;
         }
      }
      MenuItem viewOutputItem
      {
         viewMenu, $"Output", o, alt2;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            outputView.Show();
            return true;
         }
      }
      MenuItem viewWatchesItem
      {
         viewMenu, $"Watches", w, alt3;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            watchesView.Show();
            return true;
         }
      }
      MenuItem viewThreadsItem
      {
         viewMenu, $"Threads", t, alt4;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            threadsView.Show();
            return true;
         }
      }
      MenuItem viewBreakpointsItem
      {
         viewMenu, $"Breakpoints", b, alt5;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            breakpointsView.Show();
            return true;
         }
      }
      MenuItem viewCallStackItem
      {
         viewMenu, $"Call Stack", s, alt7;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            callStackView.Show();
            return true;
         }
      }
      MenuItem viewAllDebugViews
      {
         viewMenu, $"All Debug Views", a, alt9;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            outputView.Show();
            watchesView.Show();
            threadsView.Show();
            callStackView.Show();
            breakpointsView.Show();
            return true;
         }
      }
#ifdef GDB_DEBUG_GUI
      MenuDivider { viewMenu };
      MenuItem viewGDBItem
      {
         viewMenu, $"GDB Dialog", g, Key { f9, shift = true, ctrl = true };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            gdbDialog.Show();
            return true;
         }
      }
#endif
      MenuDivider { viewMenu };
      MenuItem viewColorPicker
      {
         viewMenu, $"Color Picker...", c, Key { c, ctrl = true , shift = true };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            ColorPicker colorPicker { master = this, parent = this, stayOnTop = true };
            colorPicker.Create();
            return true;
         }
      }
      MenuDivider { viewMenu };
      /*
      MenuItem
      {
         viewMenu, "Full Screen", f, checkable = true;

         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            app.fullScreen ^= true;
            SetDriverAndSkin();
            anchor = { 0, 0, 0, 0 };
            return true;
         }
      };
      */
      Menu driversMenu { viewMenu, $"Graphics Driver", v };
      //Menu skinsMenu { viewMenu, "GUI Skins", k };
   Menu windowMenu { menu, $"Window", w };
      MenuItem { windowMenu, $"Close All", l, NotifySelect = MenuWindowCloseAll };
      MenuDivider { windowMenu };
      MenuItem { windowMenu, $"Next", n, f6, NotifySelect = MenuWindowNext };
      MenuItem { windowMenu, $"Previous", p, shiftF6, NotifySelect = MenuWindowPrevious };
      MenuDivider { windowMenu };
      MenuItem { windowMenu, $"Cascade", c, NotifySelect = MenuWindowCascade };
      MenuItem { windowMenu, $"Tile Horizontally", h, NotifySelect = MenuWindowTileHorz };
      MenuItem { windowMenu, $"Tile Vertically", v, NotifySelect = MenuWindowTileVert };
      MenuItem { windowMenu, $"Arrange Icons", a, NotifySelect = MenuWindowArrangeIcons };
      MenuDivider { windowMenu };
      MenuItem { windowMenu, $"Windows...", w, NotifySelect = MenuWindowWindows };
   Menu helpMenu { menu, $"Help", h };
      MenuItem
      {
         helpMenu, $"API Reference", r, f1;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            Execute("documentor");
            return true;
         }
      }
      MenuDivider { helpMenu };
      MenuItem
      {
         helpMenu, $"About...", a;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            AboutIDE { master = this }.Modal();
            return true;
         }
      }

   property ToolBox toolBox
   {
      get { return toolBox; }
   }

   property Sheet sheet
   {
      get { return sheet; }
   }

   property Project project
   {
      get { return projectView ? projectView.project : null; }
   }

   property Workspace workspace
   {
      get { return projectView ? projectView.workspace : null; }
   }

   FindInFilesDialog findInFilesDialog
   {
      master = this, parent = this;
      filters = findInFilesFileFilters.array, sizeFilters = findInFilesFileFilters.count * sizeof(FileFilter);
      filter = 1;
   };

#ifdef GDB_DEBUG_GUI
   GDBDialog gdbDialog
   {
      master = this, parent = this;
      anchor = { left = 100, top = 100, right = 100, bottom = 100 };

      void OnCommand(char * string)
      {
         if(ide)
            ide.debugger.SendGDBCommand(string);
      }
   };
#endif
   
   bool NotifySelectDisplayDriver(MenuItem selection, Modifiers mods)
   {
      //app.driver = app.drivers[selection.id];
#ifdef __unix__
      app.driver = selection.id ? "OpenGL" : "X";
#else
      app.driver = selection.id ? "OpenGL" : "GDI";
#endif
      delete ideSettings.displayDriver;
      ideSettings.displayDriver = CopyString(selection.id ? "OpenGL" : "Default");

      settingsContainer.Save();
      //SetDriverAndSkin();
      return true;
   }

   bool NotifySelectDisplaySkin(MenuItem selection, Modifiers mods)
   {
      app.skin = app.skins[selection.id];
      SetDriverAndSkin();
      return true;
   }

   void SetDriverAndSkin()
   {
      int c;
      for(c = 0; c < app.numSkins; c++)
         if(!strcmp(app.skins[c], app.skin))
         {
            skinItems[c].checked = true;
            break;
         }
      for(c = 0; c < app.numDrivers; c++)
         if(!strcmp(app.drivers[c], app.driver))
         {
            driverItems[c].checked = true;
            break;
         }
   }

   ProjectView CreateProjectView(Workspace workspace, char * fileName)
   {
      Project project = workspace.projects.firstIterator.data;
      projectView = ProjectView
      {
         this;
         fileName = fileName;
         
         void NotifyDestroyed(Window window, DialogResult result)
         {
            projectView = null;
            text = titleECEREIDE;
            
            AdjustMenus();
         }
      };
      projectView.Create();
      RepositionWindows(false);

      // Leave it after Create to avoid flicker due to seeing IDE without a project view
      projectView.workspace = workspace;
      projectView.project = project;
      SetText("%s - %s", project.topNode.name, titleECEREIDE);

      AdjustMenus();

      ide.breakpointsView.LoadFromWorkspace();
      ide.watchesView.LoadFromWorkspace();

      findInFilesDialog.projectNodeField.userData = projectView;

      {
         char fileName[MAX_LOCATION];
         strcpy(fileName, project.topNode.path);
         PathCat(fileName, project.topNode.name);
      }
      return projectView;
   }

   bool GetDebugMenusDisabled()
   {
      if(projectView)
      {
         Project project = projectView.project;
         if(project)
            if(project.targetType == executable)
               return false;
           
      }
      return true;
   }

   void RepositionWindows(bool expand)
   {
      if(this)
      {
         Window child;
         bool inDebugMode = debugger.isActive;
         bool callStackVisible = expand ? false : callStackView.visible;
         bool threadsVisible = expand ? false : threadsView.visible;
         bool watchesVisible = expand ? false : watchesView.visible;
         bool breakpointsVisible = expand ? false : breakpointsView.visible;
         bool toolBoxVisible = toolBox.visible;
         bool outputVisible = expand ? false : outputView.visible;
         int topDistance = (callStackVisible || threadsVisible) ? 200 : 0;
         int bottomDistance = (outputVisible || watchesVisible || breakpointsVisible) ? 240 : 0;
         
         for(child = firstChild; child; child = child.next)
         {
            if(child._class == class(CodeEditor) || child._class == class(Designer) || 
               child._class == class(Sheet) || child._class == class(ProjectView))
            {
               Anchor anchor = child.anchor;
               anchor.top = topDistance;
               anchor.bottom = bottomDistance;
               if(child._class == class(CodeEditor) || child._class == class(Designer))
               {
                  anchor.right = toolBoxVisible ? 150 : 0;
               }
               child.anchor = anchor;
            }
            else if(expand)
            {
               if(child._class == class(OutputView) || child._class == class(CallStackView) || child._class == class(ThreadsView) || child._class == class(WatchesView) || 
                  child._class == class(BreakpointsView))
                  child.visible = false;
            }
         }
         // If this is not here, the IDE is not updated when doing Debug/Break then Alt-4 to show call stack (IDE not updated)
         Update(null);
      }
   }

   bool ShowCodeEditor()
   {
      if(activeClient)
         activeClient.Activate();
      else if(projectView)
      { 
         projectView.visible = true;
         projectView.Activate();
      }
      else
      {
         sheet.visible = true;
         sheet.Activate();
      }
      return false;
   }

   bool ShouldStopBuild()
   {
      return projectView.stopBuild;
   }

   void DocumentSaved(Window document, char * fileName)
   {
      ideSettings.AddRecentFile(fileName);
      ide.UpdateRecentMenus();
      settingsContainer.Save();
   }

   bool Window::OnFileModified(FileChange fileChange, char * param)
   {
      char temp[4096];
      sprintf(temp, $"The document %s was modified by another application.\n"
            "Would you like to reload it and lose your changes?", this.fileName);
      if(MessageBox { type = yesNo, master = this/*.parent*/,
            text = $"Document has been modified", contents = temp }.Modal() == yes)
      {
         char * fileName = CopyString(this.fileName);
         WindowState state = this.state;
         Anchor anchor = this.anchor;
         Size size = this.size;

         this.modifiedDocument = false;
         this.Destroy(0);
         this = ide.OpenFile(fileName, normal, true, null, no, normal);
         if(this)
         {
            this.anchor = anchor;
            this.size = size;
            this.SetState(state, true, 0);
         }
         delete fileName;
         return true;
      }
      return true;
   }

   void UpdateMakefiles()
   {
      if(workspace)
      {
         for(prj : workspace.projects)
         {
            bool first = prj == workspace.projects.firstIterator.data;
            projectView.ProjectUpdateMakefileForAllConfigs(prj, first, first);
         }
      }
   }

   void AdjustMenus()
   {
      bool unavailable = !project;

      projectQuickItem.disabled           = !unavailable;

      projectAddItem.disabled             = unavailable;

      activeCompilerItem.disabled         = unavailable;
      projectActiveConfigItem.disabled    = unavailable;
      projectSettingsItem.disabled        = unavailable;

      projectBrowseFolderItem.disabled    = unavailable;

      viewProjectItem.disabled            = unavailable;

      AdjustBuildMenus();
      AdjustDebugMenus();
   }

   void AdjustBuildMenus()
   {
      bool unavailable = project && projectView.buildInProgress;

      projectNewItem.disabled          = unavailable;
      projectOpenItem.disabled         = unavailable;

      unavailable = !project || projectView.buildInProgress;

      projectCloseItem.disabled        = unavailable;

      projectRunItem.disabled          = unavailable || project.targetType != executable;
      projectBuildItem.disabled        = unavailable;
      projectLinkItem.disabled         = unavailable;
      projectRebuildItem.disabled      = unavailable;
      projectCleanItem.disabled        = unavailable;
      projectRegenerateItem.disabled   = unavailable;
      projectCompileItem.disabled      = unavailable;
   }

   void AdjustDebugMenus()
   {
      bool unavailable = !project || project.targetType != executable ||
               projectView.buildInProgress == buildingMainProject;
      bool active = ide.debugger.isActive;
      bool executing = ide.debugger.state == running;
      //bool holding = ide.debugger.state == stopped;

      debugStartResumeItem.disabled       = unavailable || executing;

      debugStartResumeItem.text           = active ? $"Resume" : $"Start";
      debugStartResumeItem.NotifySelect   = active ? MenuDebugResume : MenuDebugStart;

      debugBreakItem.disabled             = unavailable || !executing;
      debugStopItem.disabled              = unavailable || !active;
      debugRestartItem.disabled           = unavailable || !active;

      debugStepIntoItem.disabled          = unavailable || executing;
      debugStepOverItem.disabled          = unavailable || executing;
      debugStepOutItem.disabled           = unavailable || executing || !active;
      debugSkipStepOverItem.disabled      = unavailable || executing;
      debugSkipStepOutItem.disabled       = unavailable || executing || !active;

      if((Designer)GetActiveDesigner())
      {
         CodeEditor codeEditor = ((Designer)GetActiveDesigner()).codeEditor;
         if(codeEditor)
         {
            codeEditor.debugRunToCursor.disabled      = unavailable || executing;
            codeEditor.debugSkipRunToCursor.disabled  = unavailable || executing;
         }
      }
   }

   void ChangeFileDialogsDirectory(char * directory, bool saveSettings)
   {
      char tempString[MAX_LOCATION];
      strcpy(tempString, directory);
      if(saveSettings && !projectView)
      {
         ideSettings.ideFileDialogLocation = directory;
         settingsContainer.Save();
      }

      ideFileDialog.currentDirectory = tempString;
      codeEditorFileDialog.currentDirectory = tempString;
      codeEditorFormFileDialog.currentDirectory = tempString;
   }

   void ChangeProjectFileDialogDirectory(char * directory)
   {
      ideSettings.ideProjectFileDialogLocation = directory;
      settingsContainer.Save();
   }

   Window FindWindow(char * filePath)
   {
      Window document = null;

      // TOCHECK: Do we need to change slashes here?
      for(document = firstChild; document; document = document.next)
      {
         char * fileName = document.fileName;
         if(document.isDocument && fileName && !fstrcmp(fileName, filePath))
         {
            document.visible = true;
            document.Activate();
            return document;
         }
      }
      return null;
   }

   bool DontTerminateDebugSession(char * title)
   {
      if(debugger.isActive)
      {
         if(MessageBox { type = yesNo, master = ide, 
                           contents = $"Do you want to terminate the debugging session in progress?", 
                           text = title }.Modal() == no)
            return true;
         /*
         MessageBox msg { type = yesNo, master = ide, 
                           contents = "Do you want to terminate the debugging session in progress?", 
                           text = title };
         if(msg.Modal() == no)
         {
            msg.Destroy(0);
            delete msg;
            return true;
         }
         msg.Destroy(0);
         delete msg;*/
      }
      return false;
   }

   Window OpenFile(char * origFilePath, WindowState state, bool visible, char * type, OpenCreateIfFails createIfFails, OpenMethod openMethod)
   {
      char extension[MAX_EXTENSION] = "";
      Window document = null;
      bool isProject = false;
      bool needFileModified = true;
      char winFilePath[MAX_LOCATION];
      char * filePath = strstr(origFilePath, "http://") == origFilePath ? strcpy(winFilePath, origFilePath) : GetSystemPathBuffer(winFilePath, origFilePath);

      if(!type)
      {
         GetExtension(filePath, extension);
         strlwr(extension);
      }
      else
         strcpy(extension, type);

      if(strcmp(extension, ProjectExtension))
      {
         for(document = firstChild; document; document = document.next)
         {
            char * fileName = document.fileName;
            if(document.isDocument && fileName && !fstrcmp(fileName, filePath) && document.created)
            {
               document.visible = true;
               document.Activate();
               return document;
            }
         }
      }

      if(createIfFails == whatever)
         ;
      else if(!strcmp(extension, ProjectExtension) || !strcmp(extension, WorkspaceExtension))
      {
         if(openMethod == normal)
         {
            if(DontTerminateDebugSession($"Open Project"))
               return null;
            isProject = true;
            if(MenuWindowCloseAll(null, 0))
            {
               if(projectView)
               {
                  projectView.visible = false;
                  projectView.Destroy(0);
                  // Where did this come from? projectView = null;
               }
               if(!projectView)
               {
                  for(;;)
                  {
                     Project project;
                     Workspace workspace = null;
                     
                     if(FileExists(filePath))
                     {
                        if(!strcmp(extension, ProjectExtension))
                        {
                           char workspaceFile[MAX_LOCATION];
                           strcpy(workspaceFile, filePath);
                           ChangeExtension(workspaceFile, WorkspaceExtension, workspaceFile);
                           workspace = LoadWorkspace(workspaceFile, filePath);
                        }
                        else if(!strcmp(extension, WorkspaceExtension))
                           workspace = LoadWorkspace(filePath, null);
                        else
                           return null;
                        //project = LoadProject(filePath);
                     }
                     
                     if(workspace)
                     {
                        char absolutePath[MAX_LOCATION];
                        CreateProjectView(workspace, filePath);
                        document = projectView;

                        workspace.DropInvalidBreakpoints();
                        workspace.Save();

                        ide.projectView.ShowOutputBuildLog(true);
                        ide.projectView.DisplayCompiler(false);
                        UpdateMakefiles();
                        {
                           char newWorkingDir[MAX_LOCATION];
                           StripLastDirectory(filePath, newWorkingDir);
                           ChangeFileDialogsDirectory(newWorkingDir, false);
                        }
                        if(document)
                           document.fileName = filePath;

                        SetText("%s - %s", filePath, titleECEREIDE);

                        // this crashes on starting ide with epj file, solution please?
                        // app.UpdateDisplay();

                        workspace.holdTracking = true;
                        for(ofi : workspace.openedFiles)
                        {
                           if(ofi.state != closed)
                           {
                              Window file = OpenFile(ofi.path, normal, true, null, no, normal);
                              if(file)
                              {
                                 char fileName[MAX_LOCATION];
                                 ProjectNode node;
                                 GetLastDirectory(ofi.path, fileName);
                                 node = projectView.project.topNode.Find(fileName, true);
                                 if(node)
                                    node.EnsureVisible();
                              }
                           }
                        }
                        workspace.holdTracking = false;

                        workspace.timer.Start();

                        findInFilesDialog.mode = FindInFilesMode::project;
                        findInFilesDialog.currentDirectory = ide.project.topNode.path;
                        
                        {
                           char location[MAX_LOCATION];
                           StripLastDirectory(ide.project.topNode.path, location);
                           ChangeProjectFileDialogDirectory(location);
                        }
                        
                        /*
                        if(projectView.debugger)
                           projectView.debugger.EvaluateWatches();
                        */
                        
                        break;
                     }
                     else 
                     {
                        if(MessageBox { type = yesNo, parent = this, text = $"Error opening project", contents = $"Open a different project?" }.Modal() == yes)
                        {
                           ideProjectFileDialog.text = openProjectFileDialogTitle;
                           if(ideProjectFileDialog.Modal() == cancel)
                              return null;
                           filePath = ideProjectFileDialog.filePath;
                           GetExtension(filePath, extension);
                        }
                        else
                           return null;
                     }
                  }
               }
            }
            else
               return document;
         }
         else if(openMethod == add)
         {
            if(workspace)
            {
               Project prj = null;
               char slashFilePath[MAX_LOCATION];
               GetSlashPathBuffer(slashFilePath, filePath);
               for(p : workspace.projects)
               {
                  if(!fstrcmp(p.filePath, slashFilePath))
                  {
                     prj = p;
                     break;
                  }
               }
               if(prj)
               {
                  MessageBox { type = ok, parent = parent, master = this, text = $"Same Project", 
                        contents = $"This project is already present in workspace." }.Modal();
               }
               else
               {
                  prj = LoadProject(filePath);
                  if(prj)
                  {
                     workspace.projects.Add(prj);
                     if(projectView)
                        projectView.AddNode(prj.topNode, null);
                     workspace.modified = true;
                     workspace.Save();
                     findInFilesDialog.AddProjectItem(prj);
                     projectView.ProjectUpdateMakefileForAllConfigs(prj, true, true);

                     {
                        char location[MAX_LOCATION];
                        StripLastDirectory(prj.topNode.path, location);
                        ChangeProjectFileDialogDirectory(location);
                     }

                     // projectView is associated with the main project and not with the one just added but
                     return projectView; // just to let the caller know something was opened
                  }
               }
            }
            else
               return null;
         }
      }
      else if(!strcmp(extension, "bmp") || !strcmp(extension, "pcx") ||
            !strcmp(extension, "jpg") || !strcmp(extension, "gif") ||
            !strcmp(extension, "jpeg") || !strcmp(extension, "png"))
      {
         if(FileExists(filePath))
            document = PictureEdit { hasMaximize = true, hasMinimize = true, hasClose = true, borderStyle = sizable, 
                                       hasVertScroll = true, hasHorzScroll = true, parent = this, state = state, 
                                       visible = visible, bitmapFile = filePath, OnClose = PictureEditOnClose/*why?--GenericDocumentOnClose*/;
                                    };
         if(!document)
            MessageBox { type = ok, parent = this, text = filePath, contents = $"File doesn't exist." }.Modal();
      }
#ifndef NO3D
      else if(!strcmp(extension, "3ds"))
      {
         if(FileExists(filePath))
            document = ModelView { hasMaximize = true, hasMinimize = true, hasClose = true, borderStyle = sizable, 
                                    hasVertScroll = true, hasHorzScroll = true, parent = this, state = state, 
                                    visible = visible, modelFile = filePath, OnClose = ModelViewOnClose/*why?--GenericDocumentOnClose*/
                                    };

         if(!document)
            MessageBox { type = ok, parent = this, text = filePath, contents = $"File doesn't exist." }.Modal();
      }
#endif
      else if(!strcmp(extension, "txt") || !strcmp(extension, "text") ||
            !strcmp(extension, "nfo") || !strcmp(extension, "info") ||
            !strcmp(extension, "htm") || !strcmp(extension, "html") ||
            !strcmp(extension, "css") || !strcmp(extension, "php") ||
            !strcmp(extension, "js"))
      {
         CodeEditor editor { parent = this, state = state, visible = false };
         editor.updatingCode = true;
         if(editor.LoadFile(filePath))
         {
            document = editor;
            editor.visible = true;
         }
         else
            delete editor;
         needFileModified = false;
      }
      else
      {
         CodeEditor editor { parent = this, state = state, visible = false };
         if(editor.LoadFile(filePath))
         {
            document = editor;
            editor.visible = true;
         }
         else
            delete editor;
         needFileModified = false;
      }

      if(document && (document._class == class(PictureEdit) ||
            document._class == class(ModelView)))
      {
         document.Create();
         if(document)
         {
            document.fileName = filePath;
            if(workspace && !workspace.holdTracking)
               workspace.UpdateOpenedFileInfo(filePath, opened);
         }
      }
      
      if(!document && createIfFails != no)
      {
         if(createIfFails != yes && !needFileModified && 
               MessageBox { type = yesNo, parent = this, text = filePath, contents = $"File doesn't exist. Create?" }.Modal() == yes)
            createIfFails = yes;
         if(createIfFails == yes || createIfFails == whatever)
         {
            document = (Window)NewCodeEditor(this, state, true);
            if(document)
               document.fileName = filePath;
         }
      }

      if(document)
      {
         if(projectView && document._class == class(CodeEditor) && workspace)
         {
            int lineNumber, position;
            Point scroll;
            CodeEditor editor = (CodeEditor)document;
            editor.openedFileInfo = workspace.UpdateOpenedFileInfo(filePath, opened);
            editor.openedFileInfo.holdTracking = true;
            lineNumber = Max(editor.openedFileInfo.lineNumber - 1, 0);
            position = Max(editor.openedFileInfo.position - 1, 0);
            editor.editBox.GoToLineNum(lineNumber);
            editor.editBox.GoToPosition(editor.editBox.line, lineNumber, position);
            scroll.x = Max(editor.openedFileInfo.scroll.x, 0);
            scroll.y = Max(editor.openedFileInfo.scroll.y, 0);
            editor.editBox.scroll = scroll;
            editor.openedFileInfo.holdTracking = false;
         }
         
         if(needFileModified)
            document.OnFileModified = OnFileModified;
         document.NotifySaved = DocumentSaved;
         
         if(isProject)
            ideSettings.AddRecentProject(document.fileName);
         else
            ideSettings.AddRecentFile(document.fileName);
         ide.UpdateRecentMenus();
         settingsContainer.Save();
         
         return document;
      }
      else
         return null;
   }

   // TOCHECK: I can't use a generic one for both ModelView and PictureEdit both derived from Window
   /*bool Window::GenericDocumentOnClose(bool parentClosing)
   {
      if(!parentClosing && ide.workspace)
         ide.workspace.UpdateOpenedFileInfo(fileName, unknown);
      return true;
   }*/
   bool ModelView::ModelViewOnClose(bool parentClosing)
   {
      if(!parentClosing && ide.workspace)
         ide.workspace.UpdateOpenedFileInfo(fileName, unknown);
      return true;
   }
   bool PictureEdit::PictureEditOnClose(bool parentClosing)
   {
      if(!parentClosing && ide.workspace)
         ide.workspace.UpdateOpenedFileInfo(fileName, unknown);
      return true;
   }

   /*
   void OnUnloadGraphics(Window window)
   {
      display.ClearMaterials();
      display.ClearTextures();
      display.ClearMeshes();
   }
   */

   bool OnActivate(bool active, Window swap, bool * goOnWithActivation, bool direct)
   {
      caps.color = app.GetKeyState(capsState) ? black : Color { 128,128,128 };
      num.color = app.GetKeyState(numState) ? black : Color { 128,128,128 };
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case b:
            projectView.Update(null);
            break;
         case capsLock:
            caps.color = app.GetKeyState(capsState) ? black : Color { 128,128,128 };
            break;
         case numLock:
            num.color = app.GetKeyState(numState) ? black : Color { 128,128,128 };
            break;
      }
      return true;
   }

   void GoToError(const char * line)
   {
      if(projectView)
         projectView.GoToError(line);
   }

   void CodeLocationParseAndGoTo(const char * text, Project project, const char * dir)
   {
      char *path = text;
      char *colon = strchr(text, ':');
      char filePath[MAX_LOCATION];
      char completePath[MAX_LOCATION];
      int line = 0, col = 0;
      Project prj = null;

      if(text[3] == '(')
      {
         char * close = strchr(text, ')');
         if(close)
         {
            char name[256];
            strncpy(name, &text[4], close - text - 4);
            name[close - text - 4] = '\0';
            for(p : ide.workspace.projects)
            {
               if(!strcmp(p.name, name))
               {
                  path = close + 1;
                  prj = p;
                  break;
               }
            }
         }
      }
      if(!prj)
         prj = project ? project : (dir ? null : ide.project);
      if(colon && (colon[1] == '/' || colon[1] == '\\'))
      {
         path = (colon - 1 > path) ? colon - 1 : path;
         colon = strstr(colon + 1, ":");
      }
      while(isspace(*path)) path++;
      if(colon)
      {
         strncpy(filePath, path, colon - path);
         filePath[colon - path] = '\0';
         line = atoi(colon + 1);
         colon = strstr(colon + 1, ":");
         if(colon)
            col = atoi(colon + 1);
      }
      else if(path - 1 >= path && *(path - 1) == '\"')
      {
         colon = strchr(path, '\"');
         if(colon)
         {
            strncpy(filePath, path, colon - path);
            filePath[colon - path] = '\0';
         }
      }

      if(prj)
         strcpy(completePath, prj.topNode.path);
      else if(dir && dir[0])
         strcpy(completePath, dir);
      else
         completePath[0] = '\0';
      PathCat(completePath, filePath);

      if(FileExists(completePath).isFile)
      {
         CodeEditor codeEditor = (CodeEditor)OpenFile(completePath, normal, true, "", no, normal);
         if(codeEditor && line)
         {
            EditBox editBox = codeEditor.editBox;
            editBox.GoToLineNum(line - 1);
            editBox.GoToPosition(editBox.line, line - 1, col ? (col - 1) : 0);
         }
      }
   }

   void OnRedraw(Surface surface)
   {
      Bitmap bitmap = back.bitmap;
      if(bitmap)
         surface.Blit(bitmap, (clientSize.w - bitmap.width) / 2, (clientSize.h - bitmap.height) / 2, 0, 0, bitmap.width, bitmap.height);
   }

   void SheetSelected(SheetType sheetSelected)
   {
      if(activeChild == sheet)
      {
         if(sheetSelected == methods)
         {
            viewPropertiesItem.accelerator = f4;
            viewPropertiesItem.parent = viewMenu;
            viewMethodsItem.parent = null;
         }
         else
         {
            viewMethodsItem.accelerator = f4;
            viewMethodsItem.parent = viewMenu;
            viewPropertiesItem.parent = null;
         }
      }
      else
      {
         viewMethodsItem.parent = viewMenu;
         viewPropertiesItem.parent = viewMenu;
         if(sheetSelected == methods)
         {
            viewMethodsItem.accelerator = f4;
            viewPropertiesItem.accelerator = 0;
         }
         else
         {
            viewMethodsItem.accelerator = 0;
            viewPropertiesItem.accelerator = f4;
         }
      }
   }

   void OnActivateClient(Window client, Window previous)
   {
      //if(!client || client != previous)
      {
         Class dataType;
         if(!client || client != previous)
         {
            if(previous)
               dataType = previous._class;
            if(previous && !strcmp(dataType.name, "CodeEditor"))
            {
               ((CodeEditor)previous).UpdateFormCode();
            }
            else if(previous && !strcmp(dataType.name, "Designer"))
            {
               ((Designer)previous).codeEditor.UpdateFormCode();
            }
         }

         if(client)
            dataType = client._class;
         if(client && !strcmp(dataType.name, "CodeEditor"))
         {
            CodeEditor codeEditor = (CodeEditor)client;
            SetPrivateModule(codeEditor.privateModule);
            SetCurrentContext(codeEditor.globalContext);
            SetTopContext(codeEditor.globalContext);
            SetGlobalContext(codeEditor.globalContext);
            
            SetDefines(&codeEditor.defines);
            SetImports(&codeEditor.imports);

            SetActiveDesigner(codeEditor.designer);
            
            sheet.codeEditor = codeEditor;
            toolBox.codeEditor = codeEditor;

            viewDesignerItem.parent = viewMenu;
            if(activeChild != codeEditor)
            {
               viewCodeItem.parent = viewMenu;
               viewDesignerItem.accelerator = 0;
               viewCodeItem.accelerator = f8;
            }
            else
            {
               viewCodeItem.parent = null;
               viewDesignerItem.accelerator = f8;
            }
         }
         else if(client && !strcmp(dataType.name, "Designer"))
         {
            CodeEditor codeEditor = ((Designer)client).codeEditor;
            if(codeEditor)
            {
               SetPrivateModule(codeEditor.privateModule);
               SetCurrentContext(codeEditor.globalContext);
               SetTopContext(codeEditor.globalContext);
               SetGlobalContext(codeEditor.globalContext);
               SetDefines(&codeEditor.defines);
               SetImports(&codeEditor.imports);
            }
            else
            {
               SetPrivateModule(null);
               SetCurrentContext(null);
               SetTopContext(null);
               SetGlobalContext(null);
               SetDefines(null);
               SetImports(null);
            }

            SetActiveDesigner((Designer)client);

            sheet.codeEditor = codeEditor;
            toolBox.codeEditor = codeEditor;

            viewCodeItem.parent = viewMenu;
            if(activeChild != client)
            {
               viewDesignerItem.parent = viewMenu;
               viewDesignerItem.accelerator = f8;
               viewCodeItem.accelerator = 0;
            }
            else
            {
               viewDesignerItem.parent = null;
               viewCodeItem.accelerator = f8;
            }
         }
         else
         {
            if(sheet)
               sheet.codeEditor = null;
            toolBox.codeEditor = null;
            SetActiveDesigner(null);

            viewDesignerItem.parent = null;
            viewCodeItem.parent = null;
         }
         if(sheet)
            SheetSelected(sheet.sheetSelected);
      }

      projectCompileItem = null;

      if(statusBar)
      {
         statusBar.Clear();
         if(client && client._class == eSystem_FindClass(__thisModule, "CodeEditor")) // !strcmp(client._class.name, "CodeEditor")
         {
            CodeEditor codeEditor = (CodeEditor)client;
            EditBox editBox = codeEditor.editBox;

            statusBar.AddField(pos);

            caps = { width = 40, text = $"CAPS", color = app.GetKeyState(capsState) ? black : Color { 128, 128, 128 } };
            statusBar.AddField(caps);

            ovr = { width = 30, text = $"OVR", color = editBox.overwrite ? black : Color { 128, 128, 128 } };
            statusBar.AddField(ovr);

            num = { width = 30, text = $"NUM", color = app.GetKeyState(numState) ? black : Color { 128, 128, 128 } };
            statusBar.AddField(num);

            //statusBar.text = "Ready";

            if(projectView && projectView.project)
            {
               ProjectNode node = projectView.GetNodeFromWindow(client, null);
               if(node)
               {
                  char name[1024];
                  sprintf(name, $"Compile %s", node.name);
                  projectCompileItem = 
                  {
                     copyText = true, text = name, c, ctrlF7, disabled = projectView.buildInProgress;

                     bool NotifySelect(MenuItem selection, Modifiers mods)
                     {
                        if(projectView)
                        {
                           ProjectNode node = projectView.GetNodeFromWindow(activeClient, null);
                           if(node)
                              projectView.Compile(node);
                        }
                        return true;
                     }
                  };
                  projectMenu.AddDynamic(projectCompileItem, null, false);
               }
            }
         }
         else
         {
            caps = ovr = num = null;
         }
      }
   }

   bool OnClose(bool parentClosing)
   {
      //return !projectView.buildInProgress;
      if(projectView && projectView.buildInProgress)
         return false;
      if(DontTerminateDebugSession($"Close IDE"))
         return false;
      if(findInFilesDialog)
         findInFilesDialog.SearchStop();
      if(workspace)
      {
         workspace.timer.Stop();
         workspace.Save();
      }
      return true;
   }

   bool OnPostCreate()
   {
      int c;
      for(c = 1; c<app.argc; c++)
      {
         char fullPath[MAX_LOCATION];
         GetWorkingDir(fullPath, MAX_LOCATION);
         PathCat(fullPath, app.argv[c]);
         if(FileExists(fullPath))
            ide.OpenFile(fullPath, (app.argc == 2) * maximized, true, null, yes, normal);
      }
      return true;
   }

   void OnDestroy()
   {
      // IS THIS NEEDED? WASN'T HERE BEFORE...
      if(projectView)
      {
         projectView.visible = false;
         projectView.Destroy(0);
         projectView = null;
      }
#ifdef GDB_DEBUG_GUI
      gdbDialog.Destroy(0);
      delete gdbDialog;
#endif
   }

   void SetPath(bool projectsDirs)
   {
      int c, len, count;
      char * newList;
      char * oldPaths[128];
      String oldList = new char[maxPathLen];
      Array<String> newExePaths { };
      //Map<String, bool> exePathExists { };
      bool found = false;
#if defined(__unix__) || defined(__APPLE__)
      Array<String> newLibPaths { };
      Map<String, bool> libPathExists { };
#endif
      CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);

      if(projectsDirs)
      {
         for(prj : workspace.projects)
         {
            DirExpression targetDirExp;

            // SKIP FIRST PROJECT...
            if(prj == workspace.projects.firstIterator.data) continue;

            targetDirExp = prj.targetDir;

            /*if(prj.config.targetType == sharedLibrary && prj.config.debug)
               cfg = prj.config;
            else
            {
               for(cfg = prj.configurations.first; cfg; cfg = cfg.next)
                  if(cfg.targetType == sharedLibrary && cfg.debug && !strcmpi(cfg.name, "Debug"))
                     break;
               if(!cfg)
               {
                  for(cfg = prj.configurations.first; cfg; cfg = cfg.next)
                     if(cfg.targetType == sharedLibrary && cfg.debug)
                        break;
               }
            }*/
            if(targetDirExp.dir)
            {
               char buffer[MAX_LOCATION];
#if defined(__WIN32__)
               Array<String> paths = newExePaths;
#else
               Array<String> paths = newLibPaths;
#endif
               GetSystemPathBuffer(buffer, prj.topNode.path);
               PathCat(buffer, targetDirExp.dir);
               for(p : paths)
               {
                  if(!fstrcmp(p, buffer))
                  {
                     found = true;
                     break;
                  }
               }
               if(!found)
                  paths.Add(CopyString(buffer));
            }
            delete targetDirExp;
         }
      }

      for(item : compiler.executableDirs)
      {
         found = false;
         for(p : newExePaths)
         {
            if(!fstrcmp(p, item))
            {
               found = true;
               break;
            }
         }
         if(!found)
            newExePaths.Add(CopySystemPath(item));
      }

      GetEnvironment("PATH", oldList, maxPathLen);
/*#ifdef _DEBUG
      printf("Old value of PATH: %s\n", oldList);
#endif*/
      count = TokenizeWith(oldList, sizeof(oldPaths) / sizeof(char *), oldPaths, pathListSep, false);
      for(c = 0; c < count; c++)
      {
         found = false;
         for(p : newExePaths)
         {
            if(!fstrcmp(p, oldPaths[c]))
            {
               found = true;
               break;
            }
         }
         if(!found)
            newExePaths.Add(CopySystemPath(oldPaths[c]));
      }

      len = 0;
      for(path : newExePaths)
         len += strlen(path) + 1;
      newList = new char[len + 1];
      newList[0] = '\0';
      for(path : newExePaths)
      {
         strcat(newList, path);
         strcat(newList, pathListSep);
      }
      newList[len - 1] = '\0';
      SetEnvironment("PATH", newList);
/*#ifdef _DEBUG
      printf("New value of PATH: %s\n", newList);
#endif*/
      delete newList;

      newExePaths.Free();
      delete newExePaths;

#if defined(__unix__) || defined(__APPLE__)

      for(item : compiler.libraryDirs)
      {
         if(!libPathExists[item])  // fstrcmp should be used
         {
            newLibPaths.Add(item);
            libPathExists[item] = true;
         }
      }

#if defined(__APPLE__)
      GetEnvironment("DYLD_LIBRARY_PATH", oldList, maxPathLen);
#else
      GetEnvironment("LD_LIBRARY_PATH", oldList, maxPathLen);
#endif
/*#ifdef _DEBUG
      printf("Old value of [DY]LD_LIBRARY_PATH: %s\n", oldList);
#endif*/
      count = TokenizeWith(oldList, sizeof(oldPaths) / sizeof(char *), oldPaths, pathListSep, false);
      for(c = 0; c < count; c++)
      {
         if(!libPathExists[oldPaths[c]])  // fstrcmp should be used
         {
            newLibPaths.Add(oldPaths[c]);
            libPathExists[oldPaths[c]] = true;
         }
      }

      len = 0;
      for(path : newLibPaths)
         len += strlen(path) + 1;
      newList = new char[len + 1];
      newList[0] = '\0';
      for(path : newLibPaths)
      {
         strcat(newList, path);
         strcat(newList, pathListSep);
      }
      newList[len - 1] = '\0';
#if defined(__APPLE__)
      SetEnvironment("DYLD_LIBRARY_PATH", newList);
#else
      SetEnvironment("LD_LIBRARY_PATH", newList);
#endif
/*#ifdef _DEBUG
      printf("New value of [DY]LD_LIBRARY_PATH: %s\n", newList);
#endif*/
      delete newList;

      delete newLibPaths;
      delete libPathExists;
#endif

      if(compiler.distccEnabled && compiler.distccHosts)
         SetEnvironment("DISTCC_HOSTS", compiler.distccHosts);

      delete compiler;
      delete oldList;
   }

   void DestroyTemporaryProjectDir()
   {
      if(tmpPrjDir && tmpPrjDir[0])
      {
         if(FileExists(tmpPrjDir).isDirectory)
            DestroyDir(tmpPrjDir);
         property::tmpPrjDir = null;
      }
   }

   IDE()
   {
      // Graphics Driver Menu
      int c;

      /*
      app.currentSkin.selectionColor = selectionColor;
      app.currentSkin.selectionText = selectionText;
      */

/*
      driverItems = new MenuItem[app.numDrivers];
      for(c = 0; c < app.numDrivers; c++)
      {
         driverItems[c] = MenuItem { driversMenu, app.drivers[c], NotifySelect = NotifySelectDisplayDriver };
         driverItems[c].id = c;
         driverItems[c].isRadio = true;         
      }
*/
      driverItems = new MenuItem[2];
#if defined(__unix__)
         driverItems[0] = MenuItem { driversMenu, "X", NotifySelect = NotifySelectDisplayDriver };
         driverItems[0].id = 0;
         driverItems[0].isRadio = true;         
#else
         driverItems[0] = MenuItem { driversMenu, "GDI", NotifySelect = NotifySelectDisplayDriver };
         driverItems[0].id = 0;
         driverItems[0].isRadio = true;         
#endif
         driverItems[1] = MenuItem { driversMenu, "OpenGL", NotifySelect = NotifySelectDisplayDriver };
         driverItems[1].id = 1;
         driverItems[1].isRadio = true;         

/*      skinItems = new MenuItem[app.numSkins];
      for(c = 0; c < app.numSkins; c++)
      {
         skinItems[c] = MenuItem {skinsMenu, app.skins[c], NotifySelect = NotifySelectDisplaySkin };
         skinItems[c].id = c;
         skinItems[c].isRadio = true;         
      }
*/
      ideFileDialog.master = this;
      ideProjectFileDialog.master = this;

      //SetDriverAndSkin();
      return true;
   }

   void UpdateRecentMenus()
   {
      int c;
      Menu fileMenu = menu.FindMenu($"File");
      Menu recentFiles = fileMenu.FindMenu($"Recent Files");
      Menu recentProjects = fileMenu.FindMenu($"Recent Projects");
      char itemName[MAX_LOCATION + 4];
      MenuItem item;

      recentFiles.Clear();
      c = 0;

      for(recent : ideSettings.recentFiles)
      {
         sprintf(itemName, "%d %s", 1 + c, recent);
         MakeSystemPath(itemName);
         recentFiles.AddDynamic(MenuItem { copyText = true, text = itemName, (Key)k1 + c, id = c, NotifySelect = ide.FileRecentFile }, null, true);
         c++;
      }

      recentProjects.Clear();
      c = 0;
      for(recent : ideSettings.recentProjects)
      {
         sprintf(itemName, "%d %s", 1 + c, recent);
         MakeSystemPath(itemName);
         recentProjects.AddDynamic(MenuItem { copyText = true, text = itemName, (Key)k1 + c, id = c, NotifySelect = ide.FileRecentProject }, null, true);
         c++;
      }
   }

   ~IDE()
   {
      delete driverItems;
      delete skinItems;
      delete ideSettings;
   }
}

void DestroyDir(char * path)
{
   RecursiveDeleteFolderFSI fsi { };
   fsi.Iterate(path);
   delete fsi;
}

class RecursiveDeleteFolderFSI : NormalFileSystemIterator
{
   bool preserveRootFolder;

   void OutFolder(char * folderPath, bool isRoot)
   {
      if(!(preserveRootFolder && isRoot))
         RemoveDir(folderPath);
   }

   bool OnFile(char * filePath)
   {
      DeleteFile(filePath);
      return true;
   }
}

class IDEApp : GuiApplication
{
   //driver = "Win32Console";
   // driver = "OpenGL";
   // skin = "Aqua";
   //skin = "TVision";
   bool Init()
   {
      SetLoggingMode(stdOut, null);
      //SetLoggingMode(debug, null);

      settingsContainer.Load();
#if defined(__unix__) || defined(__APPLE__)
      app.driver = (ideSettings.displayDriver && !strcmp(ideSettings.displayDriver, "OpenGL")) ? ideSettings.displayDriver : "X";
#else
      app.driver = (ideSettings.displayDriver && !strcmp(ideSettings.displayDriver, "OpenGL")) ? ideSettings.displayDriver : "GDI";
#endif
      ide.driverItems[ideSettings.displayDriver && !strcmp(ideSettings.displayDriver,"OpenGL")].checked = true;

      SetInIDE(true);

      desktop.text = titleECEREIDE;
      /*
      int c;
      for(c = 1; c<app.argc; c++)
      {
         char fullPath[MAX_LOCATION];
         GetWorkingDir(fullPath, MAX_LOCATION);
         PathCat(fullPath, app.argv[c]);
         ide.OpenFile(fullPath, (app.argc == 2) * maximized, true, null, yes, normal);
      }
      */
      return true;
   }
}

IDE ide { };

define app = ((IDEApp)__thisModule);
#ifdef _DEBUG
define titleECEREIDE = $"ECERE IDE (Debug)";
#else
define titleECEREIDE = $"ECERE IDE";
#endif
