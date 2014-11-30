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

#ifdef GDB_DEBUG_GUI
import "GDBDialog"
#endif

import "Project"
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

class ImportFolderProjectsFSI : NormalFileSystemIterator
{
   bool noParsing;
   char selfProjectPath[MAX_LOCATION];
   extensions = ProjectExtension;
   bool OnFile(const char * filePath)
   {
      if(fstrcmp(filePath, selfProjectPath))
         ide.OpenFile(filePath, false, true, ProjectExtension, no, add, noParsing);
      return true;
   }
}

// TODO: Review the whole automatic freeing of container elements
class FreeingAVLTree : AVLTree
{
   ~FreeingAVLTree()
   {
      Free();
   }
}

FreeingAVLTree<const String> binaryDocExt
{ [
   "wav", "mp3", "flac", "ogg",
   "mid",
   "avi", "mkv", "mpg", "mpeg",
   "7z", "zip", "gz", "bz2", "xz", "rar", "z", "tar", "ear",
   "pdf", "odp", "ods", "odt", "ppt", "doc", "xls", "pptx", "docx", "xlsx"
] };

#if defined(__WIN32__)
define pathListSep = ";";
#else
define pathListSep = ":";
#endif

IDEConfigHolder ideConfig { };

FontResource panelFont { $"Courier New", 10 };
FontResource codeFont { $"Courier New", 10 };

IDESettings ideSettings;

IDESettingsContainer settingsContainer
{
   dataOwner = &ideSettings;
   dataClass = class(IDESettings);

   void onLoadCompilerConfigs()     { ide.UpdateCompilerConfigs(true); }
   void onLoadRecentFiles()         { ide.updateRecentFilesMenu(); }
   void onLoadRecentProjects()      { ide.updateRecentProjectsMenu(); }
   void onLoad()                    { ide.ApplyColorScheme(colorScheme); ide.ApplyFont(ideSettings.codeEditorFont, ideSettings.codeEditorFontSize); }
};

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
   { $"C/C++/eC Source Files (*.ec, *.c, *.cpp, *.cc, *.cxx)", "ec, eh, c, cpp, cc, cxx" },
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
   { $"Text Files (*.txt, *.text, *.nfo, *.info)", "txt, text, nfo, info" },
   { $"Web Files (*.html, *.htm, *.xhtml, *.css, *.php, *.js, *.jsi, *.rb, *.xml)", "html, htm, xhtml, css, php, js, jsi, rb, xml" },
   { $"Image Files (*.jpg, *.jpeg, *.bmp, *.pcx, *.png, *.gif)", "jpg, jpeg, bmp, pcx, png, gif" },
   { $"3D Studio Model Files (*.3ds)", "3ds" },
   { $"All Files", null }
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
   { $"Workspace Files (*.ews)", WorkspaceExtension },
   { $"Project and Workspace Files (*.epj, *.ews)", "epj, ews" }
] };

static Array<FileType> projectTypes
{ [
   { $"Project / Workspace File", ProjectExtension }
] };

static Array<FileFilter> findInFilesFileFilters
{ [
   { $"Project and Workspace Files (*.epj, *.ews)", "epj, ews" },
   { $"eC Files (*.ec, *.eh)", "ec, eh" },
   { $"C Files (*.c, *.h)", "c, h" },
   { $"C++ Files (*.cpp, *.cc, *.cxx, *.hpp, *.hh, *.hxx)", "cpp, cc, cxx, hpp, hh, hxx" },
   { $"C/C++/eC Files (*.ec, *.eh, *.c, *.cpp, *.cc, *.cxx, *.h, *.hpp, *.hh, *.hxx)", "ec, eh, c, cpp, cc, cxx, h, hpp, hh, hxx" },
   { $"Header Files for C/C++/eC (*.eh, *.h, *.hpp, *.hh, *.hxx)", "eh, h, hpp, hh, hxx" },
   { $"C/C++/eC Source Files (*.ec, *.c, *.cpp, *.cc, *.cxx)", "ec, c, cpp, cc, cxx" },
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
   { $"Web Files (*.html, *.htm, *.xhtml, *.css, *.php, *.js, *.jsi, *.rb, *.xml)", "html, htm, xhtml, css, php, js, jsi, rb, xml" },
   { $"Text Files (*.txt)", "txt" },
   { $"More Text Files (*.txt, *.text, *.nfo, *.info)", "txt, text, nfo, info" },
   { $"All Files", null }
] };

FileDialog importFolderProjectsDialog { autoCreate = false, type = selectDir, text = $"Import Folder Projects" };
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
   types = projectTypes.array;
   sizeTypes = projectTypes.count * sizeof(FileType);
   filters = projectFilters.array;
   sizeFilters = projectFilters.count * sizeof(FileFilter);
};

GlobalSettingsDialog globalSettingsDialog
{
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
            break;
         case compilers:
         {
            ide.UpdateCompilerConfigs(true);
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

#define IDEItem(x)   (&((IDEWorkSpace)0).x)

class IDEToolbar : ToolBar
{
   // File options
   // New
   ToolButton buttonNewFile { this, toolTip = $"New file", menuItemPtr = IDEItem(fileNewItem) };
   // Open
   ToolButton buttonOpenFile { this, toolTip = $"Open file", menuItemPtr = IDEItem(fileOpenItem) };
   // Close
   // ToolButton buttonCloseFile { this, toolTip = $"Close file", menuItemPtr = IDEItem(fileCloseItem) };
   // Save
   ToolButton buttonSaveFile { this, toolTip = $"Save file", menuItemPtr = IDEItem(fileSaveItem) };
   // Save All
   ToolButton buttonSaveAllFile { this, toolTip = $"Save all", menuItemPtr = IDEItem(fileSaveAllItem) };

   ToolSeparator separator1 { this };

   // Edit options
   // Cut
   // Copy
   // Paste
   // Undo
   // Redo

   // ToolSeparator separator2 { this };

   // Project options
   // New project
   ToolButton buttonNewProject { this, toolTip = $"New project", menuItemPtr = IDEItem(projectNewItem) };
   // Open project
   ToolButton buttonOpenProject { this, toolTip = $"Open project", menuItemPtr = IDEItem(projectOpenItem) };
   // Add project to workspace
   ToolButton buttonAddProject { this, toolTip = $"Add project to workspace", menuItemPtr = IDEItem(projectAddItem), disabled = true; };
   // Close project
   // ToolButton buttonCloseProject { this, toolTip = $"Close project", menuItemPtr = IDEItem(projectCloseItem), disabled = true; };

   ToolSeparator separator3 { this };

   // Build/Execution options
   // Build
   ToolButton buttonBuild { this, toolTip = $"Build project", menuItemPtr = IDEItem(projectBuildItem), disabled = true; };
   // Re-link
   ToolButton buttonReLink { this, toolTip = $"Relink project", menuItemPtr = IDEItem(projectLinkItem), disabled = true; };
   // Rebuild
   ToolButton buttonRebuild { this, toolTip = $"Rebuild project", menuItemPtr = IDEItem(projectRebuildItem), disabled = true; };
   // Clean
   ToolButton buttonClean { this, toolTip = $"Clean project", menuItemPtr = IDEItem(projectCleanItem), disabled = true; };
   // Real Clean
   // ToolButton buttonRealClean { this, toolTip = $"Real clean project", menuItemPtr = IDEItem(projectRealCleanItem), disabled = true; };
   // Regenerate Makefile
   ToolButton buttonRegenerateMakefile { this, toolTip = $"Regenerate Makefile", menuItemPtr = IDEItem(projectRegenerateItem), disabled = true; };
   // Compile actual file
   // Execute
   ToolButton buttonRun { this, toolTip = $"Run", menuItemPtr = IDEItem(projectRunItem), disabled = true; };
#ifdef IDE_SHOW_INSTALL_MENU_BUTTON
   ToolButton buttonInstall { this, toolTip = $"Install", menuItemPtr = IDEItem(projectInstallItem), disabled = true; };
#endif

   ToolSeparator separator4 { this };

   // Debug options
   // Start/Resume
   ToolButton buttonDebugStartResume { this, toolTip = $"Start", menuItemPtr = IDEItem(debugStartResumeItem), disabled = true; };
   // Restart
   ToolButton buttonDebugRestart { this, toolTip = $"Restart", menuItemPtr = IDEItem(debugRestartItem), disabled = true; };
   // Pause
   ToolButton buttonDebugPause { this, toolTip = $"Break", menuItemPtr = IDEItem(debugBreakItem), disabled = true; };
   // Stop
   ToolButton buttonDebugStop { this, toolTip = $"Stop", menuItemPtr = IDEItem(debugStopItem), disabled = true; };
   // Breakpoints
   //ToolButton buttonRun { this, toolTip = $"Run", menuItemPtr = IDEItem(projectRunItem) };
   // F11
   ToolButton buttonDebugStepInto { this, toolTip = $"Step Into", menuItemPtr = IDEItem(debugStepIntoItem), disabled = true; };
   // F10
   ToolButton buttonDebugStepOver { this, toolTip = $"Step Over", menuItemPtr = IDEItem(debugStepOverItem), disabled = true; };
   // Shift+F11
   ToolButton buttonDebugStepOut { this, toolTip = $"Step Out", menuItemPtr = IDEItem(debugStepOutItem), disabled = true; };
   // Shift+F10
   ToolButton buttonDebugSkipStepOver { this, toolTip = $"Step Over Skipping Breakpoints", menuItemPtr = IDEItem(debugSkipStepOverItem), disabled = true; };

   ToolSeparator separator5 { this };

   Window spacer5 { this, size = { 4 } };

   DropBox activeConfig
   {
      this, toolTip = $"Active Configuration(s)", size = { 160 }, disabled = true;
      bool NotifySelect(DropBox dropBox, DataRow row, Modifiers mods)
      {
         if(row)
            ide.workspace.SelectActiveConfig(row.string);
         return true;
      }
   };

   Window spacer6 { this, size = { 4 } };

   DropBox activeCompiler
   {
      this, toolTip = $"Active Compiler", size = { 160 }, disabled = true;
      bool NotifySelect(DropBox dropBox, DataRow row, Modifiers mods)
      {
         if(ide.workspace && ide.projectView && row && strcmp(row.string, ide.workspace.activeCompiler))
         {
            bool silent = ide.projectView.buildInProgress == none ? false : true;
            CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(row.string);
            ide.workspace.activeCompiler = row.string;
            ide.projectView.ShowOutputBuildLog(!silent);
            if(!silent)
               ide.projectView.DisplayCompiler(compiler, false);
            for(prj : ide.workspace.projects)
               ide.projectView.ProjectPrepareCompiler(prj, compiler, silent);
            delete compiler;
            ide.workspace.Save();
         }
         return true;
      }
   };

   DropBox activeBitDepth
   {
      this, toolTip = $"Active Bit Length", size = { 60 }, disabled = true;
      bool NotifySelect(DropBox dropBox, DataRow row, Modifiers mods)
      {
         if(ide.workspace && ide.projectView && row)
         {
            bool silent = ide.projectView.buildInProgress == none ? false : true;
            CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
            ide.workspace.bitDepth = (int)row.tag;
            ide.projectView.ShowOutputBuildLog(!silent);
            if(!silent)
               ide.projectView.DisplayCompiler(compiler, false);
            for(prj : ide.workspace.projects)
               ide.projectView.ProjectPrepareCompiler(prj, compiler, silent);
            delete compiler;
            ide.workspace.Save();
         }
         return true;
      }
   };

   Window spacer65 { this, size = { 4 } };

   Button forceSingleJob { this, text = $"Force Single Job Compiling", isCheckbox = true; };

   Window spacer7 { this, size = { 4 } };

   void IDEToolbar()
   {
      DataRow row;
      row = activeBitDepth.AddString("Auto");
      row.tag = 0;
      activeBitDepth.AddString("32 bit").tag = 32;
      activeBitDepth.AddString("64 bit").tag = 64;
      activeBitDepth.currentRow = row;
   }
}

class IDEMainFrame : Window
{
   background = formColor;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   minClientSize = { 600, 300 };
   hasMenuBar = true;
   icon = { ":icon.png" };
   text = titleECEREIDE;
#if defined(__linux__) // 0 //def _DEBUG
   //stayOnTop = true;
   //size = { 800, 600 };
   anchor = { left = 0, top = 0, right = 0, bottom = 92 };
#else
   state = maximized;
   anchor = { left = 0, top = 0, right = 0, bottom = 0 };
#endif

   Stacker stack
   {
      this;
      menu = { };
      isActiveClient = true;
      gap = 0;
      direction = vertical;
      background = formColor;
      anchor = { left = 0, top = 0, right = 0, bottom = 0 };
   };
   IDEToolbar toolBar
   {
      stack, ideWorkSpace;

      void OnDestroy(void)
      {
         ((IDEWorkSpace)master).toolBar = null;
      }
   };
   IDEWorkSpace ideWorkSpace { stack, this, toolBar = toolBar };
}

define ide = ideMainFrame.ideWorkSpace;

class IDEWorkSpace : Window
{
   background = Color { 85, 85, 85 };

   //tabCycle = true;
   hasVertScroll = true;
   hasHorzScroll = true;
   hasStatusBar = true;
   isActiveClient = true;
   anchor = { left = 0, top = 0, right = 0, bottom = 0 };
   menu = Menu {  };
   IDEToolbar toolBar;

   MenuItem * driverItems, * skinItems, * languageItems;
   StatusField pos { width = 150 };
   StatusField ovr, caps, num;
   DualPipe documentor;

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

   BuildOutputMode rightClickMenuBuildOutputMode;

   Debugger debugger { };

   void ApplyFont(const String faceName, float size)
   {
      panelFont.faceName = faceName;
      panelFont.size = size;

      codeFont.faceName = faceName;
      codeFont.size = size;

      {
         CodeEditor ce;
         for(ce = (CodeEditor)firstChild; ce; ce = (CodeEditor)ce.next)
            if(ce._class == class(CodeEditor))
            {
               FontResource font;
               font = { codeFont.faceName, codeFont.size, codeFont.bold, codeFont.italic };
               incref font;
               delete *&ce.font;
               *&ce.font = font;
               ce.editBox.font = font;
               ce.OnPostCreate();
            }
      }

      threadsView.font          = { panelFont.faceName, panelFont.size, panelFont.bold, panelFont.italic };
      callStackView.font        = { panelFont.faceName, panelFont.size, panelFont.bold, panelFont.italic };
      outputView.buildBox.font  = { panelFont.faceName, panelFont.size, panelFont.bold, panelFont.italic };
      outputView.debugBox.font  = { panelFont.faceName, panelFont.size, panelFont.bold, panelFont.italic };
      outputView.findBox.font   = { panelFont.faceName, panelFont.size, panelFont.bold, panelFont.italic };
   #ifdef GDB_DEBUG_OUTPUT
      outputView.gdbBox.font   = { panelFont.faceName, panelFont.size, panelFont.bold, panelFont.italic };
   #endif
#ifdef GDB_DEBUG_GUI
      if(gdbDialog)
      {
         gdbDialog.tree.font   = { panelFont.faceName, panelFont.size, panelFont.bold, panelFont.italic };
         gdbDialog.output.font = { panelFont.faceName, panelFont.size, panelFont.bold, panelFont.italic };
      }
#endif
   }

   void ApplyColorScheme(IDEColorScheme cs)
   {
      CodeEditor ce;

      colorScheme = cs;

      for(ce = (CodeEditor)firstChild; ce; ce = (CodeEditor)ce.next)
         if(ce._class == class(CodeEditor))
         {
            EditBox eb = ce.editBox;
            ce.background = cs.marginColor;
            eb.selectionColor = cs.selectionColor;
            eb.selectionText = cs.selectionText;
            eb.background = cs.codeEditorBG;
            eb.foreground = cs.codeEditorFG;
            if((SyntaxHighlighting)eb.syntaxHighlighting)
               ((SyntaxHighlighting)eb.syntaxHighlighting).syntaxColorScheme = cs.syntaxColors;
         }

      if(projectView)
      {
         projectView.fileList.background = cs.projectViewBackground;
         projectView.fileList.foreground = cs.projectViewText;
         projectView.fileList.selectionColor = cs.selectionColor;
         projectView.fileList.selectionText = cs.selectionText;
      }

      sheet.properties.background = cs.viewsBackground;
      sheet.properties.foreground = cs.viewsText;
      sheet.properties.selectionText = cs.sheetSelectionText;
      sheet.properties.selectionColor = cs.sheetSelectionColor;
      sheet.methods.background = cs.viewsBackground;
      sheet.methods.foreground = cs.viewsText;

      threadsView.editBox.background = cs.viewsBackground;
      threadsView.editBox.foreground = cs.viewsText;
      threadsView.editBox.selectionColor = cs.selectionColor;
      threadsView.editBox.selectionText = cs.selectionText;

      callStackView.editBox.background = cs.viewsBackground;
      callStackView.editBox.foreground = cs.viewsText;
      callStackView.editBox.selectionColor = cs.selectionColor;
      callStackView.editBox.selectionText = cs.selectionText;

      watchesView.listBox.background = cs.viewsBackground;
      watchesView.listBox.foreground = cs.viewsText;
      watchesView.listBox.selectionColor = cs.selectionColor;
      watchesView.listBox.selectionText = cs.selectionText;

      breakpointsView.listBox.background = cs.viewsBackground;
      breakpointsView.listBox.foreground = cs.viewsText;
      breakpointsView.listBox.selectionColor = cs.selectionColor;
      breakpointsView.listBox.selectionText = cs.selectionText;

      outputView.buildBox.background = cs.outputBackground;
      outputView.buildBox.foreground = cs.outputText;
      outputView.buildBox.selectionColor = cs.selectionColor;
      outputView.buildBox.selectionText = cs.selectionText;

      outputView.debugBox.background = cs.outputBackground;
      outputView.debugBox.foreground = cs.outputText;
      outputView.debugBox.selectionColor = cs.selectionColor;
      outputView.debugBox.selectionText = cs.selectionText;

      outputView.findBox.background = cs.outputBackground;
      outputView.findBox.foreground = cs.outputText;
      outputView.findBox.selectionColor = cs.selectionColor;
      outputView.findBox.selectionText = cs.selectionText;

#ifdef GDB_DEBUG_OUTPUT
      outputView.findBox.background = cs.outputBackground;
      outputView.findBox.foreground = cs.outputText;
      outputView.findBox.selectionColor = cs.selectionColor;
      outputView.findBox.selectionText = cs.selectionText;
#endif
   }

   ProjectView projectView;

   OutputView outputView
   {
      parent = this;

      void OnGotoError(const char * line, bool openAsText, bool noParsing)
      {
         CompilerConfig compiler = ide.workspace ? ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler) : null;
         const char * objectFileExt = compiler ? compiler.objectFileExt : objectDefaultFileExt;
         ide.GoToError(line, openAsText, noParsing, objectFileExt);
         delete compiler;
      }

      void OnCodeLocationParseAndGoTo(const char * line, bool openAsText, bool noParsing)
      {
         CompilerConfig compiler = ide.workspace ? ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler) : null;
         const char * objectFileExt = compiler ? compiler.objectFileExt : objectDefaultFileExt;
         bool inFind = ide.outputView.activeBox == ide.outputView.findBox;
         if(inFind)
            ide.CodeLocationParseAndGoTo(line, ide.findInFilesDialog.findProject, ide.findInFilesDialog.findDir, openAsText, noParsing, objectFileExt);
         else
            ide.CodeLocationParseAndGoTo(line, null, null, openAsText, noParsing, objectFileExt);
         delete compiler;
      }

      bool OnKeyDown(Key key, unichar ch)
      {
         switch(key)
         {
            case escape:
               if(activeBox != findBox || !ide.findInFilesDialog || !ide.findInFilesDialog.SearchAbort())
                  ide.ShowCodeEditor();
               break;
            default:
            {
               OutputView::OnKeyDown(key, ch);
               break;
            }
         }
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
      parent = this, font = { panelFont.faceName, panelFont.size, panelFont.bold, panelFont.italic };

      void OnSelectFrame(int frameIndex)
      {
         ide.debugger.GoToStackFrameLine(frameIndex, true, true);
         if(frameIndex >= 0)
            ide.debugger.SelectFrame(frameIndex);
      }

      void OnToggleBreakpoint()
      {
         Debugger debugger = ide.debugger;
         if(debugger.activeFrame && debugger.activeFrame.absoluteFile)
         {
            int line = debugger.activeFrame.line;
            debugger.ToggleBreakpoint(debugger.activeFrame.absoluteFile, line);
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

      bool OnClose(bool parentClosing)
      {
         visible = false;
         if(!parentClosing)
            ide.RepositionWindows(false);
         return parentClosing;
      }

      void OnRedraw(Surface surface)
      {
         Debugger debugger = ide.debugger;
         Frame activeFrame = debugger.activeFrame;
         if(activeFrame)
         {
            bool error;
            int lineCursor, lineTopFrame;
            int lineH, scrollY, boxH;
            BitmapResource bmp;
            Breakpoint bp = null;

            boxH = clientSize.h;
            scrollY = editBox.scroll.y;
            displaySystem.FontExtent(editBox.font.font, " ", 1, null, &lineH);
            //activeThread = debugger.activeThread;
            //hitThread = debugger.hitThread;
            debugger.GetCallStackCursorLine(&error, &lineCursor, &lineTopFrame);

            // TODO: improve bp drawing... it should be visible even if it's not on the activeFrame
            if(activeFrame.absoluteFile)
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
         }
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
      parent = this, font = { panelFont.faceName, panelFont.size, panelFont.bold, panelFont.italic };

      bool OnKeyDown(Key key, unichar ch)
      {
         switch(key)
         {
            case escape: ide.ShowCodeEditor(); break;
         }
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

   ToolBox toolBox { parent = this, visible = false };
   Sheet sheet { parent = this, visible = false };

   char * tmpPrjDir;
   property char * tmpPrjDir { set { delete tmpPrjDir; if(value) tmpPrjDir = CopyString(value); } get { return tmpPrjDir; } };

   Menu fileMenu { menu, $"File", f, hasMargin = true };
      MenuItem fileNewItem
      {
         fileMenu, $"New", n, ctrlN;
         bitmap = { ":actions/docNew.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            Window currentDoc = activeClient;
            bool maximizeDoc = ((currentDoc && currentDoc.state == maximized) || (!currentDoc && !projectView));
            Window document = (Window)NewCodeEditor(this, maximizeDoc ? maximized : normal, false);
            RepositionWindows(false);
            document.NotifySaved = DocumentSaved;
            return true;
         }
      };
      MenuItem fileOpenItem
      {
         fileMenu, $"Open...", o, ctrlO;
         bitmap = { ":actions/docOpen.png" };
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
                  const char * const * multiFilePaths = ideFileDialog.multiFilePaths;

                  for(c = 0; c < numSelections; c++)
                  {
                     if(OpenFile(multiFilePaths[c], false, true, fileTypes[ideFileDialog.fileType].typeExtension, no, normal, mods.ctrl && mods.shift))
                        gotWhatWeWant = true;
                  }
                  if(gotWhatWeWant ||
                     MessageBox { type = yesNo, master = this, text = $"Error opening file",
                     contents = $"Open a different file?" }.Modal() == no)
                  {
                     if(!projectView && gotWhatWeWant)
                        ChangeFileDialogsDirectory(ideFileDialog.currentDirectory, true);
                     ide.RepositionWindows(false);
                     break;
                  }
               }
               else
                  break;
            }
            return true;
         }
      };
      MenuItem fileCloseItem { fileMenu, $"Close", c, ctrlF4, NotifySelect = MenuFileClose };
      MenuDivider { fileMenu };
      MenuItem fileSaveItem
      {
         fileMenu, $"Save", s, ctrlS, bitmap = { ":actions/docSave.png" };

         // For the toolbar button; clients can still override that for the menu item
         bool Window::NotifySelect(MenuItem selection, Modifiers mods)
         {
            Window w = activeClient;
            if(w)
               w.MenuFileSave(null, 0);
            return true;
         }
      };
      MenuItem fileSaveAsItem { fileMenu, $"Save As...", a };
      MenuItem fileSaveAllItem { fileMenu, $"Save All", l, NotifySelect = MenuFileSaveAll, bitmap = { ":actions/docSaveAll.png" } };
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
      };
      MenuItem replaceInFiles
      {
         fileMenu, $"Replace In Files...", e, Key { r, ctrl = true , shift = true };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            findInFilesDialog.replaceMode = true;
            findInFilesDialog.Show();
            return true;
         }
      };
      MenuDivider { fileMenu };
      MenuItem globalSettingsItem
      {
         fileMenu, $"Global Settings...", g;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            // Reload configs here until we setup a configs directory monitor
            ideConfig.compilers.read(settingsContainer);

            globalSettingsDialog.master = this;
            if(ide.workspace && ide.workspace.activeCompiler)
               globalSettingsDialog.workspaceActiveCompiler = ide.workspace.activeCompiler;
            else if(ideSettings.defaultCompiler)
               globalSettingsDialog.workspaceActiveCompiler = ideSettings.defaultCompiler;
            globalSettingsDialog.Modal();
            return true;
         }
      };
      MenuDivider { fileMenu };
      Menu recentFilesMenu { fileMenu, $"Recent Files", r };
      Menu recentProjectsMenu { fileMenu, $"Recent Projects", p };
      MenuDivider { fileMenu };
      MenuItem exitItem
      {
         fileMenu, $"Exit", x, altF4;

         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            ideMainFrame.Destroy(0);
            return true;
         }
      };

      bool FileRecentFile(MenuItem selection, Modifiers mods)
      {
         int id = 0;
         RecentPaths recentFiles = workspace ? workspace.recentFiles : ideConfig.recentFiles;
         for(file : recentFiles)
         {
            if(id == selection.id)
            {
               bool isProjectFile;
               char extension[MAX_EXTENSION] = "";
               GetExtension(file, extension);
               isProjectFile = (!strcmpi(extension, ProjectExtension) || !strcmpi(extension, WorkspaceExtension));
               if(mods.ctrl && !mods.shift)
               {
                  char * command = PrintString("ecere-ide ", isProjectFile ? "-t " : "", file);
                  Execute(command);
                  delete command;
               }
               else
               {
                  OpenFile(file, false, true, isProjectFile ? "txt" : null, no, normal, mods.ctrl && mods.shift);
                  ide.RepositionWindows(false);
               }
               break;
            }
            id++;
         }
         return true;
      }

      bool FileRecentProject(MenuItem selection, Modifiers mods)
      {
         int id = 0;
         for(file : ideConfig.recentWorkspaces)
         {
            if(id == selection.id)
            {
               if(mods.ctrl && !mods.shift)
               {
                  char * command = PrintString("ecere-ide ", file);
                  Execute(command);
                  delete command;
               }
               else
                  OpenFile(file, false, true, (mods.ctrl && mods.shift) ? "txt" : null, no, normal, mods.ctrl && mods.shift);
               break;
            }
            id++;
         }
         return true;
      }

   MenuPlacement editMenu { menu, $"Edit", e };

   Menu projectMenu { menu, $"Menu"."Project", p, hasMargin = true };
      MenuItem projectNewItem
      {
         projectMenu, $"New...", n, Key { n, true, true };
         bitmap = { ":actions/projNew.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(!DontTerminateDebugSession($"New Project"))
            {
               DialogResult result;
               NewProjectDialog newProjectDialog { master = this };
               incref newProjectDialog;
               result = newProjectDialog.Modal();
               if(result == ok)
               {
                  if(ProjectClose())
                  {
                     newProjectDialog.CreateNewProject();
                     if(projectView)
                     {
                        ideConfig.recentWorkspaces.addRecent(projectView.fileName);
                        ideConfig.recentWorkspaces.write(settingsContainer);
                        ide.updateRecentProjectsMenu();
                     }
                  }
               }
               delete newProjectDialog;
            }
            return true;
         }
      };
      MenuItem projectOpenItem
      {
         projectMenu, $"Open...", o, Key { o, true, true };
         bitmap = { ":actions/projOpen.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(ideSettings.ideProjectFileDialogLocation)
               ideProjectFileDialog.currentDirectory = ideSettings.ideProjectFileDialogLocation;

            ideProjectFileDialog.text = openProjectFileDialogTitle;
            ideProjectFileDialog.filter = 2; // default to Project and Workspace Files
            if(ideProjectFileDialog.Modal() == ok)
            {
               OpenFile(ideProjectFileDialog.filePath, false, true, projectTypes[ideProjectFileDialog.fileType].typeExtension, no, normal, mods.ctrl && mods.shift);
               //ChangeProjectFileDialogDirectory(ideProjectFileDialog.currentDirectory);
            }
            return true;
         }
      };
      MenuItem projectQuickItem
      {
         projectMenu, $"Quick...", q, f7, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(!projectView)
               QuickProjectDialog { this }.Modal();
            return true;
         }
      };
      MenuItem projectAddItem
      {
         projectMenu, $"Add project to workspace...", a, Key { a, true, true };
         bitmap = { ":actions/projAdd.png" };
         disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(ideSettings.ideProjectFileDialogLocation)
               ideProjectFileDialog.currentDirectory = ideSettings.ideProjectFileDialogLocation;

            ideProjectFileDialog.text = addProjectFileDialogTitle;
            ideProjectFileDialog.filter = 0; // default to Project Files
            for(;;)
            {
               if(ideProjectFileDialog.Modal() == ok)
               {
                  if(OpenFile(ideProjectFileDialog.filePath, false, true, projectTypes[ideProjectFileDialog.fileType].typeExtension, no, add, mods.ctrl && mods.shift))
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
      };
      MenuItem projectImportAddItem
      {
         projectMenu, $"Import projects into workspace...", a, Key { a, true, true, true };
         disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            char path[MAX_LOCATION];
            FileDialog fileDialog = importFolderProjectsDialog;
            fileDialog.master = parent;
            path[0] = '\0';
            StripLastDirectory(path, ide.workspace.workspaceDir);
            MakeSystemPath(path);
            fileDialog.currentDirectory = path;
            fileDialog.filePath = path;
            if(fileDialog.Modal() == ok)
            {
               ImportFolderProjectsFSI fsi { noParsing = mods.ctrl && mods.shift };
               ide.project.topNode.GetFullFilePath(fsi.selfProjectPath, true, true);
               MakeSystemPath(fsi.selfProjectPath);
               PrintLn("self: ", fsi.selfProjectPath);
               fsi.Iterate(fileDialog.filePath);
               delete fsi;
            }
            return true;
         }
      };
      MenuItem projectCloseItem
      {
         projectMenu, $"Close", c, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
            {
               if(!ide.DontTerminateDebugSession($"Project Close"))
                  ProjectClose();
            }
            return true;
         }
      };
      MenuDivider { projectMenu };
      MenuItem projectSettingsItem
      {
         projectMenu, $"Settings...", s, altF7, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            projectView.MenuSettings(projectView.active ? selection : null, mods);
            return true;
         }
      };
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
      };
      MenuDivider { projectMenu };
      MenuItem projectRunItem
      {
         projectMenu, $"Run", r, ctrlF5, disabled = true;
         bitmap = { ":actions/run.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.Run(null, mods);
            return true;
         }
      };
      MenuItem projectBuildItem
      {
         projectMenu, $"Build", b, f7, disabled = true;
         bitmap = { ":actions/build.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.ProjectBuild(projectView.active ? selection : null, mods);
            return true;
         }
      };
      MenuItem projectLinkItem
      {
         projectMenu, $"Relink", l, disabled = true;
         bitmap = { ":actions/relink.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.ProjectLink(projectView.active ? selection : null, mods);
            return true;
         }
      };
      MenuItem projectRebuildItem
      {
         projectMenu, $"Rebuild", d, shiftF7, disabled = true;
         bitmap = { ":actions/rebuild.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.ProjectRebuild(projectView.active ? selection : null, mods);
            return true;
         }
      };
      MenuItem projectCleanTargetItem
      {
         projectMenu, $"Clean Target", g, disabled = true;
         bitmap = { ":actions/clean.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
            {
               debugger.Stop();
               projectView.ProjectCleanTarget(projectView.active ? selection : null, mods);
            }
            return true;
         }
      };
      MenuItem projectCleanItem
      {
         projectMenu, $"Clean", e, disabled = true;
         bitmap = { ":actions/clean.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
            {
               debugger.Stop();
               projectView.ProjectClean(projectView.active ? selection : null, mods);
            }
            return true;
         }
      };
      MenuItem projectRealCleanItem
      {
         projectMenu, $"Real Clean", disabled = true;
         bitmap = { ":actions/clean.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
            {
               debugger.Stop();
               projectView.ProjectRealClean(projectView.active ? selection : null, mods);
            }
            return true;
         }
      };
      MenuItem projectRegenerateItem
      {
         projectMenu, $"Regenerate Makefile", m, disabled = true;
         bitmap = { ":actions/regMakefile.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.ProjectRegenerate(projectView.active ? selection : null, mods);
            return true;
         }
      };
      MenuItem projectInstallItem
      {
#ifdef IDE_SHOW_INSTALL_MENU_BUTTON
         projectMenu, $"Install", t, disabled = true;
#endif
         bitmap = { ":status/software-update-available.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.ProjectInstall(projectView.active ? selection : null, mods);
            return true;
         }
      };
      MenuItem projectCompileItem;

   Menu workspaceMenu { menu, $"Menu"."Workspace", s, hasMargin = true };
      MenuItem workspaceSettingsItem
      {
         workspaceMenu, $"Settings...", s, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            projectView.MenuWorkspaceSettings(projectView.active ? selection : null, mods);
            return true;
         }
      };

   Menu debugMenu { menu, $"Debug", d, hasMargin = true };
      MenuItem debugStartResumeItem
      {
         debugMenu, $"Start", s, f5, disabled = true;
         bitmap = { ":actions/debug.png" };
         NotifySelect = MenuDebugStart;
      };
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
         bitmap = { ":actions/restart.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.DebugRestart();
            return true;
         }
      };
      MenuItem debugBreakItem
      {
         debugMenu, $"Break", b, Key { pauseBreak, ctrl = true }, disabled = true;
         bitmap = { ":actions/pause.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView && projectView.buildInProgress != none)
               return true;
            if(projectView)
               projectView.DebugBreak();
            return true;
         }
      };
      MenuItem debugStopItem
      {
         debugMenu, $"Stop", p, shiftF5, disabled = true;
         bitmap = { ":actions/stopDebug.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView)
               projectView.DebugStop();
            return true;
         }
      };
      MenuDivider { debugMenu };
      ModelView duck
      {
         this,
         // nonClient = true,
         autoCreate = false,
         alphaBlend = true,
         opacity = 0,
         isRemote = true,
         borderStyle = 0,
         moveable = true,
         anchor = { right = 0, bottom = 0 },
         inactive = true,
         isActiveClient = false,
         stayOnTop = true,
         clickThrough = true,
         size = { 500, 500 };

         bool OnLoadGraphics()
         {
            ModelView::OnLoadGraphics();
            camera.position.z /= 1.3;
            camera.orientation = Euler { yaw = 280, pitch = 20 };
            camera.Update();
            Update(null);
            return true;
         }

         bool OnRightButtonDown(int x, int y, Modifiers mods)
         {
            if(!displaySystem.flags.flipping) return true;
            MenuWindowMove(null, 0);
            return false;
         }

         bool OnRightButtonUp(int x, int y, Modifiers mods)
         {
            position = position;
            state = normal;
            return true;
         }
      };
      MenuItem debugRubberDuck
      {
         debugMenu, $"Rubber Duck", checkable = true, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(selection.checked)
               duck.Create();
            else
               duck.Destroy(0);
            return true;
         }
      };
#ifndef __WIN32__
      MenuDivider { debugMenu };
      MenuItem debugUseValgrindItem
      {
         debugMenu, $"Use Valgrind", d, disabled = true, checkable = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(ide.workspace)
            {
               ide.workspace.useValgrind = selection.checked;
               ide.workspace.Save();
            }
            ide.AdjustValgrindMenus();
            return true;
         }
      };
      Menu debugValgrindLeakCheckItem { debugMenu, $"Valgrind Leak Check", h };
         MenuItem debugValgrindNoLeakCheckItem      { debugValgrindLeakCheckItem, $"No"     , f, id = ValgrindLeakCheck::no     , checkable = true, disabled = true; NotifySelect = ValgrindLCSelect; };
         MenuItem debugValgrindSummaryLeakCheckItem { debugValgrindLeakCheckItem, $"Summary", f, id = ValgrindLeakCheck::summary, checkable = true, disabled = true; NotifySelect = ValgrindLCSelect, checked = true; };
         MenuItem debugValgrindYesLeakCheckItem     { debugValgrindLeakCheckItem, $"Yes"    , f, id = ValgrindLeakCheck::yes    , checkable = true, disabled = true; NotifySelect = ValgrindLCSelect; };
         MenuItem debugValgrindFullLeakCheckItem    { debugValgrindLeakCheckItem, $"Full"   , f, id = ValgrindLeakCheck::full   , checkable = true, disabled = true; NotifySelect = ValgrindLCSelect; };
         bool ValgrindLCSelect(MenuItem selection, Modifiers mods)
         {
            if(ide.workspace)
            {
               if(selection.checked)
               {
                  ValgrindLeakCheck vgLeakCheck = (ValgrindLeakCheck)selection.id;

                  debugValgrindNoLeakCheckItem.checked      = debugValgrindNoLeakCheckItem.id      == vgLeakCheck;
                  debugValgrindSummaryLeakCheckItem.checked = debugValgrindSummaryLeakCheckItem.id == vgLeakCheck;
                  debugValgrindYesLeakCheckItem.checked     = debugValgrindYesLeakCheckItem.id     == vgLeakCheck;
                  debugValgrindFullLeakCheckItem.checked    = debugValgrindFullLeakCheckItem.id    == vgLeakCheck;

                  ide.workspace.vgLeakCheck = vgLeakCheck;
                  ide.workspace.Save();
               }
               else
                  selection.checked = true;
            }
            return true;
         }
      Menu debugValgrindRedzoneSizeItem { debugMenu, $"Valgrind Redzone Size", z };
         MenuItem debugValgrindRSDefaultItem { debugValgrindRedzoneSizeItem, $"Default", f, id =  -1, checkable = true, disabled = true; NotifySelect = ValgrindRSSelect, checked = true; };
         MenuItem debugValgrindRS0Item       { debugValgrindRedzoneSizeItem, "0"      , f, id =   0, checkable = true, disabled = true; NotifySelect = ValgrindRSSelect; };
         MenuItem debugValgrindRS16Item      { debugValgrindRedzoneSizeItem, "16"     , f, id =  16, checkable = true, disabled = true; NotifySelect = ValgrindRSSelect; };
         MenuItem debugValgrindRS32Item      { debugValgrindRedzoneSizeItem, "32"     , f, id =  32, checkable = true, disabled = true; NotifySelect = ValgrindRSSelect; };
         MenuItem debugValgrindRS64Item      { debugValgrindRedzoneSizeItem, "64"     , f, id =  64, checkable = true, disabled = true; NotifySelect = ValgrindRSSelect; };
         MenuItem debugValgrindRS128Item     { debugValgrindRedzoneSizeItem, "128"    , f, id = 128, checkable = true, disabled = true; NotifySelect = ValgrindRSSelect; };
         MenuItem debugValgrindRS256Item     { debugValgrindRedzoneSizeItem, "256"    , f, id = 256, checkable = true, disabled = true; NotifySelect = ValgrindRSSelect; };
         MenuItem debugValgrindRS512Item     { debugValgrindRedzoneSizeItem, "512"    , f, id = 512, checkable = true, disabled = true; NotifySelect = ValgrindRSSelect; };
         bool ValgrindRSSelect(MenuItem selection, Modifiers mods)
         {
            if(ide.workspace)
            {
               if(selection.checked)
               {
                  int vgRedzoneSize = (int)selection.id;

                  debugValgrindRSDefaultItem.checked = debugValgrindRSDefaultItem.id == vgRedzoneSize;
                  debugValgrindRS0Item.checked       = debugValgrindRS0Item.id       == vgRedzoneSize;
                  debugValgrindRS16Item.checked      = debugValgrindRS16Item.id      == vgRedzoneSize;
                  debugValgrindRS32Item.checked      = debugValgrindRS32Item.id      == vgRedzoneSize;
                  debugValgrindRS64Item.checked      = debugValgrindRS64Item.id      == vgRedzoneSize;
                  debugValgrindRS128Item.checked     = debugValgrindRS128Item.id     == vgRedzoneSize;
                  debugValgrindRS256Item.checked     = debugValgrindRS256Item.id     == vgRedzoneSize;
                  debugValgrindRS512Item.checked     = debugValgrindRS512Item.id     == vgRedzoneSize;

                  ide.workspace.vgRedzoneSize = vgRedzoneSize;
                  ide.workspace.Save();
               }
               else
                  selection.checked = true;
            }
            return true;
         }
      MenuItem debugValgrindTrackOriginsItem
      {
         debugMenu, $"Valgrind Track Origins", k, checkable = true, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(ide.workspace)
            {
               ide.workspace.vgTrackOrigins = selection.checked;
               ide.workspace.Save();
            }
            return true;
         }
      };
#endif
      MenuDivider { debugMenu };
      MenuItem debugStepIntoItem
      {
         debugMenu, $"Step Into", i, f11, disabled = true;
         bitmap = { ":actions/stepInto.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView) projectView.DebugStepInto();
            return true;
         }
      };
      MenuItem debugStepOverItem
      {
         debugMenu, $"Step Over", v, f10, disabled = true;
         bitmap = { ":actions/stepOver.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView) projectView.DebugStepOver(false);
            return true;
         }
      };
      MenuItem debugSkipStepOverItem
      {
         debugMenu, $"Step Over Skipping Breakpoints", e, shiftF10, disabled = true;
         bitmap = { ":actions/stepOverSkipBreak.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView) projectView.DebugStepOver(true);
            return true;
         }
      };
      MenuItem debugStepOutItem
      {
         debugMenu, $"Step Out", o, shiftF11, disabled = true;
         bitmap = { ":actions/stepOut.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView) projectView.DebugStepOut(false);
            return true;
         }
      };
      MenuItem debugSkipStepOutItem
      {
         debugMenu, $"Step Out Skipping Breakpoints", n, Key { f11, ctrl = true, shift = true }, disabled = true;
         bitmap = { ":actions/skipBreaks.png" };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView) projectView.DebugStepOut(true);
            return true;
         }
      };
#if 0
      MenuItem debugStepUntilItem
      {
         debugMenu, $"Step Over Until Next Line", x, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView) projectView.DebugStepUntil(false);
            return true;
         }
      };
      MenuItem debugSkipStepUntilItem
      {
         debugMenu, $"Step Over Until Next Line Skipping Breakpoints", e, Key { f10, shift = true, alt = true }, disabled = true;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if(projectView) projectView.DebugStepUntil(true);
            return true;
         }
      };
#endif
      MenuPlacement debugRunToCursorItem { debugMenu, $"Run To Cursor", c };
      MenuPlacement debugSkipRunToCursorItem { debugMenu, $"Run To Cursor Skipping Breakpoints", u };
      MenuPlacement debugRunToCursorAtSameLevelItem { debugMenu, $"Run To Cursor At Same Level", l };
      MenuPlacement debugSkipRunToCursorAtSameLevelItem { debugMenu, $"Run To Cursor At Same Level Skipping Breakpoints", g };
#if 0
      MenuPlacement debugBpRunToCursorItem { debugMenu, $"BP Run To Cursor" };
      MenuPlacement debugBpSkipRunToCursorItem { debugMenu, $"BP Run To Cursor Skipping Breakpoints" };
      MenuPlacement debugBpRunToCursorAtSameLevelItem { debugMenu, $"BP Run To Cursor At Same Level" };
      MenuPlacement debugBpSkipRunToCursorAtSameLevelItem { debugMenu, $"BP Run To Cursor At Same Level Skipping Breakpoints" };
#endif
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
      };
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
      };
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
      };
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
      };
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
      };
      MenuItem viewToolBoxItem
      {
         viewMenu, $"View Toolbox", x, f12;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            toolBox.visible = true;
            toolBox.Activate();
            return true;
         }
      };
      MenuItem viewOutputItem
      {
         viewMenu, $"Output", o, alt2;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            outputView.Show();
            return true;
         }
      };
      MenuItem viewWatchesItem
      {
         viewMenu, $"Watches", w, alt3;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            watchesView.Show();
            return true;
         }
      };
      MenuItem viewThreadsItem
      {
         viewMenu, $"Threads", t, alt4;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            threadsView.Show();
            return true;
         }
      };
      MenuItem viewBreakpointsItem
      {
         viewMenu, $"Breakpoints", b, alt5;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            breakpointsView.Show();
            return true;
         }
      };
      MenuItem viewCallStackItem
      {
         viewMenu, $"Call Stack", s, alt7;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            callStackView.Show();
            return true;
         }
      };
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
      };
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
      };
#endif
      MenuDivider { viewMenu };
      MenuItem viewColorPicker
      {
         viewMenu, $"Color Picker...", c, Key { c, ctrl = true , shift = true };
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            ColorPicker colorPicker { master = this };
            colorPicker.Modal();
            return true;
         }
      };
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

      MenuDivider { viewMenu };

      Menu languageMenu { viewMenu, "Language", l };

      //Menu skinsMenu { viewMenu, "GUI Skins", k };
   Menu windowMenu { menu, $"Window", w };
      MenuItem { windowMenu, $"Close All", l, NotifySelect = MenuWindowCloseAll };
      MenuDivider { windowMenu };
      MenuItem { windowMenu, $"Next", n, Key { right, ctrl = true, alt = true }, NotifySelect = MenuWindowNext };
      MenuItem { windowMenu, $"Previous", p, Key { left, ctrl = true, alt = true }, NotifySelect = MenuWindowPrevious };
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
            if(!documentor)
            {
               char * p = new char[MAX_LOCATION];
               p[0] = '\0';
               strncpy(p, settingsContainer.moduleLocation, MAX_LOCATION); p[MAX_LOCATION-1] = '\0';
               PathCat(p, "documentor");
   #if defined(__WIN32__)
               ChangeExtension(p, "exe", p);
   #endif
               if(!FileExists(p).isFile)
                  strcpy(p, "documentor");

               documentor = DualPipeOpen({ input = true, output = true, showWindow = true }, p);
               delete p;
            }
            else
            {
               Process_ShowWindows(documentor.GetProcessID());
               // documentor.Puts("Activate\n");
            }
            return true;
         }
      };
      MenuDivider { helpMenu };
      MenuItem
      {
         helpMenu, $"Ecere Tao of Programming [work in progress]", t;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            FindAndShellOpenInstalledFile("doc", "Ecere Tao of Programming [work in progress].pdf");
            return true;
         }
      };
      MenuDivider { helpMenu };
      MenuItem
      {
         helpMenu, $"Documentation Folder", d;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            FindAndShellOpenInstalledFolder("doc");
            return true;
         }
      };
      MenuItem
      {
         helpMenu, $"Samples Folder", s;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            FindAndShellOpenInstalledFolder("samples");
            return true;
         }
      };
      MenuItem
      {
         helpMenu, $"Extras Folder", x;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            FindAndShellOpenInstalledFolder("extras");
            return true;
         }
      };
      MenuDivider { helpMenu };
      MenuItem
      {
         helpMenu, $"Community Forums", f;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            ShellOpen("http://ecere.com/forums");
            return true;
         }
      };
      MenuDivider { helpMenu };
      MenuItem
      {
         helpMenu, $"About...", a;
         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            AboutIDE { master = this }.Modal();
            return true;
         }
      };

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
      master = this,
      filters = findInFilesFileFilters.array, sizeFilters = findInFilesFileFilters.count * sizeof(FileFilter);
   };

   bool noParsing;
   bool debugStart;

#ifdef GDB_DEBUG_GUI
   GDBDialog gdbDialog
   {
      master = this, parent = this;
      //anchor = { left = 100, top = 100, right = 100, bottom = 100 };

      void OnCommand(const char * string)
      {
         if(ide)
            ide.debugger.SendGDBCommand(string);
      }
   };
#endif

   bool NotifySelectDisplayDriver(MenuItem selection, Modifiers mods)
   {
      //app.driver = app.drivers[selection.id];
#if defined(__unix__) || defined(__APPLE__)
      app.driver = selection.id ? "OpenGL" : "X";
#else
      app.driver = selection.id ? "OpenGL" : "GDI";
#endif
      delete ideSettings.displayDriver;
      ideSettings.displayDriver = CopyString(selection.id ? "OpenGL" : "Default");

      ide.debugRubberDuck.disabled = !ide.duck.modelFile || strcmpi(app.driver, "OpenGL");

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

   ProjectView CreateProjectView(Workspace workspace, const char * fileName)
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
      ideMainFrame.SetText("%s - %s", project.topNode.name, titleECEREIDE);

      AdjustMenus();
      updateRecentMenus();

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

   bool ProjectClose()
   {
      projectView.visible = false;
      if((!projectView || projectView.created == false || projectView.Destroy(0)) && MenuWindowCloseAll(null, 0))
      {
         if(findInFilesDialog)
         {
            char workingDir[MAX_LOCATION];
            GetWorkingDir(workingDir, MAX_LOCATION);
            findInFilesDialog.SearchStop();
            findInFilesDialog.currentDirectory = workingDir;
         }
         sheet.visible = false;
         toolBox.visible = false;
         outputView.visible = false;
         ideMainFrame.text = titleECEREIDE;
         ide.AdjustMenus();
         ide.updateRecentMenus();
         return true;
      }
      return false;
   }

   void RepositionWindows(bool expand)
   {
      if(this)
      {
         Window child;
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
                  anchor.left = (sheet.visible || (projectView && projectView.visible)) ? 300 : 0;
                  anchor.right = toolBoxVisible ? 150 : 0;
               }
               if(ide.projectView)
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
         if(duck.visible) duck.Update(null);   // TOFIX: If this is not here, the duck disappears -- Why?
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
      else if(sheet.visible)
         sheet.Activate();
      else
         outputView.visible = false;
      return false;
   }

   void DocumentSaved(Window document, const char * fileName)
   {
      if(ide.workspace)
      {
         ide.workspace.recentFiles.addRecent(fileName);
         ide.workspace.Save();
      }
      else
      {
         ideConfig.recentFiles.addRecent(fileName);
         ideConfig.recentFiles.write(settingsContainer);
      }
      ide.updateRecentFilesMenu();
      ide.AdjustFileMenus();
   }

   bool Window::OnFileModified(FileChange fileChange, const char * param)
   {
      char temp[4096];
      sprintf(temp, $"The document %s was modified by another application.\n"
            "Would you like to reload it and lose your changes?", this.fileName);
      if(MessageBox { creationActivation = flash, type = yesNo, master = this/*.parent*/,
            text = $"Document has been modified", contents = temp }.Modal() == yes)
      {
         bool noParsing = (this._class == class(CodeEditor) && ((CodeEditor)this).noParsing) ? true : false;
         char * fileName = CopyString(this.fileName);
         WindowState state = this.state;
         Anchor anchor = this.anchor;
         Size size = this.size;

         this.modifiedDocument = false;
         this.Destroy(0);
         this = ide.OpenFile(fileName, false, true, null, no, normal, noParsing);
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
         CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(workspace.activeCompiler);
         for(prj : workspace.projects)
            projectView.ProjectUpdateMakefileForAllConfigs(prj);
         delete compiler;
      }
   }

   void UpdateCompilerConfigs(bool mute)
   {
      UpdateToolBarActiveCompilers();
      if(workspace)
      {
         bool silent = mute || (ide.projectView.buildInProgress == none ? false : true);
         CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(workspace.activeCompiler);
         if(!silent)
         {
            projectView.ShowOutputBuildLog(true);
            projectView.DisplayCompiler(compiler, false);
         }
         for(prj : workspace.projects)
            projectView.ProjectPrepareCompiler(prj, compiler, silent);
         delete compiler;
      }
   }

   void UpdateToolBarActiveCompilers()
   {
      toolBar.activeCompiler.Clear();
      for(compiler : ideConfig.compilers)
      {
         DataRow row = toolBar.activeCompiler.AddString(compiler.name);
         if(workspace && workspace.activeCompiler && !strcmp(compiler.name, workspace.activeCompiler))
            toolBar.activeCompiler.currentRow = row;
      }
      if(!toolBar.activeCompiler.currentRow && toolBar.activeCompiler.firstRow)
         toolBar.activeCompiler.SelectRow(toolBar.activeCompiler.firstRow);
      toolBar.activeBitDepth.SelectRow(toolBar.activeBitDepth.FindRow(workspace ? workspace.bitDepth : 0));
   }

   void UpdateToolBarActiveConfigs(bool selectionOnly)
   {
      bool commonSelected = false;
      DataRow row = toolBar.activeConfig.currentRow;
      if(selectionOnly)
         row = toolBar.activeConfig.FindRow(1);
      else
      {
         toolBar.activeConfig.Clear();
         row = toolBar.activeConfig.AddString($"(Mixed)");
         row.tag = 1;
      }
      if(workspace)
      {
         char * configName = null;
         if(!selectionOnly)
         {
            Map<String, int> configs { }; // TOIMP: just need sort but using map until containers have sort
            for(prj : workspace.projects)
            {
               for(cfg : prj.configurations)
               {
                  if(cfg.name)
                     configs[cfg.name] = 1;
               }
            }
            for(name : configs)
            {
               toolBar.activeConfig.AddString(&name);
            }
            delete configs;
         }
         if(projectView && projectView.project)
         {
            for(prj : workspace.projects)
            {
               if(prj.config && prj.config.name)
               {
                  configName = prj.config.name;
                  break;
               }
            }
            if(configName)
            {
               commonSelected = true;
               for(prj : workspace.projects)
               {
                  if(prj.config && (!prj.config.name || strcmp(prj.config.name, configName)))
                  {
                     commonSelected = false;
                     break;
                  }
               }
            }
         }
         if(commonSelected)
         {
            commonSelected = false;
            for(row = toolBar.activeConfig.firstRow; row; row = row.next)
            {
               if(!strcmp(row.string, configName))
               {
                  toolBar.activeConfig.currentRow = row;
                  commonSelected = true;
                  break;
               }
            }
         }
      }
      if(!selectionOnly)
         toolBar.activeConfig.Sort(null, 0);
      if(!commonSelected)
         toolBar.activeConfig.currentRow = row;
   }

   void AdjustMenus()
   {
      bool unavailable = !project;

      projectAddItem.disabled             = unavailable;
      projectImportAddItem.disabled       = unavailable;
      toolBar.buttonAddProject.disabled   = unavailable;

      projectSettingsItem.disabled        = unavailable;

      projectBrowseFolderItem.disabled    = unavailable;

      workspaceSettingsItem.disabled      = unavailable;

      viewProjectItem.disabled            = unavailable;

      toolBar.activeConfig.disabled       = unavailable;
      toolBar.activeCompiler.disabled     = unavailable;
      toolBar.activeBitDepth.disabled     = unavailable;

#ifndef __WIN32__
      debugUseValgrindItem.disabled       = unavailable;
      AdjustValgrindMenus();
#endif

      AdjustFileMenus();
      AdjustBuildMenus();
      AdjustDebugMenus();
   }

#ifndef __WIN32__
   void AdjustValgrindMenus()
   {
      bool unavailable = !project || !debugUseValgrindItem.checked;
      debugValgrindNoLeakCheckItem.disabled        = unavailable;
      debugValgrindSummaryLeakCheckItem.disabled   = unavailable;
      debugValgrindYesLeakCheckItem.disabled       = unavailable;
      debugValgrindFullLeakCheckItem.disabled      = unavailable;

      debugValgrindTrackOriginsItem.disabled       = unavailable;

      debugValgrindRSDefaultItem.disabled          = unavailable;
      debugValgrindRS0Item.disabled                = unavailable;
      debugValgrindRS16Item.disabled               = unavailable;
      debugValgrindRS32Item.disabled               = unavailable;
      debugValgrindRS64Item.disabled               = unavailable;
      debugValgrindRS128Item.disabled              = unavailable;
      debugValgrindRS256Item.disabled              = unavailable;
      debugValgrindRS512Item.disabled              = unavailable;
   }
#endif

   property bool hasOpenedCodeEditors
   {
      get
      {
         Window w;
         for(w = firstChild; w; w = w.next)
            if(w._class == class(CodeEditor) &&
                  w.isDocument && !w.closing && w.visible && w.created &&
                  w.fileName && w.fileName[0])
               return true;
         return false;
      }
   }

   void AdjustFileMenus()
   {
      bool unavailable = project != null || !hasOpenedCodeEditors; // are they supported source code (ec, c, cpp, etc) ?

      projectQuickItem.disabled           = unavailable;
   }

   void AdjustBuildMenus()
   {
      bool unavailable = project && projectView.buildInProgress;
      bool naForRun = unavailable || !project || project.GetTargetType(project.config) != executable;
      BuildOutputMode mode = ide.rightClickMenuBuildOutputMode;

      projectNewItem.disabled             = unavailable;
      toolBar.buttonNewProject.disabled   = unavailable;
      projectOpenItem.disabled            = unavailable;
      toolBar.buttonOpenProject.disabled  = unavailable;

      unavailable = !project || projectView.buildInProgress;

      projectCloseItem.disabled           = unavailable;
      // toolBar.buttonCloseProject.disabled = unavailable;

      projectRunItem.disabled    = naForRun;
      toolBar.buttonRun.disabled = naForRun;

      projectBuildItem.disabled = false;
      projectBuildItem.text     = unavailable ? $"Stop Build" : bldMnuStrBuild[mode];
      projectBuildItem.accelerator = unavailable ? Key { pauseBreak, ctrl = true } : f7;

      projectLinkItem.disabled                  = unavailable;
      toolBar.buttonReLink.disabled             = unavailable;
      projectRebuildItem.disabled               = unavailable;
      toolBar.buttonRebuild.disabled            = unavailable;
      projectCleanItem.disabled                 = unavailable;
      toolBar.buttonClean.disabled              = unavailable;
      projectCleanTargetItem.disabled           = unavailable;
      projectRealCleanItem.disabled             = unavailable;
      // toolBar.buttonRealClean.disabled          = unavailable;
      projectRegenerateItem.disabled            = unavailable;
      toolBar.buttonRegenerateMakefile.disabled = unavailable;
#ifdef IDE_SHOW_INSTALL_MENU_BUTTON
      projectInstallItem.disabled               = unavailable;
      toolBar.buttonInstall.disabled            = unavailable;
#endif
      projectCompileItem.disabled               = unavailable;

      AdjustPopupBuildMenus();
   }

   void AdjustPopupBuildMenus()
   {
      bool unavailable = !project || projectView.buildInProgress;

      if(projectView && projectView.popupMenu && projectView.popupMenu.menu && projectView.popupMenu.created)
      {
         MenuItem menu;
         BuildOutputMode mode = ide.rightClickMenuBuildOutputMode;
         menu = projectView.popupMenu.menu.FindItem(ProjectView::ProjectBuild, mode);
         if(menu)
         {
            menu.disabled = false;
            menu.text   = unavailable ? $"Stop Build" : bldMnuStrBuild[mode];
            menu.accelerator = unavailable ? Key { pauseBreak, ctrl = true } : f7;
         }

         menu = projectView.popupMenu.menu.FindItem(ProjectView::ProjectLink, mode);              if(menu) menu.disabled = unavailable;
         menu = projectView.popupMenu.menu.FindItem(ProjectView::ProjectRebuild, mode);           if(menu) menu.disabled = unavailable;
         menu = projectView.popupMenu.menu.FindItem(ProjectView::ProjectCleanTarget, mode);       if(menu) menu.disabled = unavailable;
         menu = projectView.popupMenu.menu.FindItem(ProjectView::ProjectClean, mode);             if(menu) menu.disabled = unavailable;
         menu = projectView.popupMenu.menu.FindItem(ProjectView::ProjectRealClean, mode);         if(menu) menu.disabled = unavailable;
         menu = projectView.popupMenu.menu.FindItem(ProjectView::ProjectRegenerate, mode);        if(menu) menu.disabled = unavailable;
         menu = projectView.popupMenu.menu.FindItem(ProjectView::ProjectInstall, mode);           if(menu) menu.disabled = unavailable;
         menu = projectView.popupMenu.menu.FindItem(ProjectView::ProjectRemove, mode);            if(menu) menu.disabled = unavailable;
         menu = projectView.popupMenu.menu.FindItem(ProjectView::FileClean, mode);                if(menu) menu.disabled = unavailable;
         menu = projectView.popupMenu.menu.FindItem(ProjectView::FileCompile, mode);              if(menu) menu.disabled = unavailable;
         menu = projectView.popupMenu.menu.FindItem(ProjectView::FileDebugPrecompile, mode);      if(menu) menu.disabled = unavailable;
         menu = projectView.popupMenu.menu.FindItem(ProjectView::FileDebugCompile, mode);         if(menu) menu.disabled = unavailable;
         menu = projectView.popupMenu.menu.FindItem(ProjectView::FileDebugGenerateSymbols, mode); if(menu) menu.disabled = unavailable;
         projectView.popupMenu.Update(null);
      }
   }

   property bool areDebugMenusUnavailable { get {
      return !project ||
            project.GetTargetType(project.config) != executable ||
            projectView.buildInProgress == buildingMainProject;
   } }

   property bool isBreakpointTogglingUnavailable { get { return !project; } }
   property bool isDebuggerRunning { get { if(ide.debugger) return ide.debugger.state == running; return false; } }
   property bool isDebuggerStopped { get { if(ide.debugger) return ide.debugger.state == stopped; return false; } }

   void AdjustDebugMenus()
   {
      bool unavailable = areDebugMenusUnavailable;
      bool running = isDebuggerRunning;
      bool stopped = isDebuggerStopped;
      bool active = debugger.isActive;

      bool isNotRunning    = unavailable || !running;
      bool isNotNotRunning = unavailable || running;
      bool isNotStopped    = unavailable || !stopped;
      bool isNotActive     = unavailable || !active;

      debugStartResumeItem.disabled       = isNotNotRunning;
      debugStartResumeItem.text           = active ? $"Resume" : $"Start";
      debugStartResumeItem.NotifySelect   = active ? MenuDebugResume : MenuDebugStart;
      if(toolBar)
      {
         toolBar.buttonDebugStartResume.disabled      = isNotNotRunning;
         toolBar.buttonDebugStartResume.toolTip       = active ? $"Resume" : $"Start";
      }

      debugBreakItem.disabled             = isNotRunning;
      debugStopItem.disabled              = isNotActive;
      debugRestartItem.disabled           = isNotActive;
      if(toolBar)
      {
         toolBar.buttonDebugPause.disabled            = isNotRunning;
         toolBar.buttonDebugStop.disabled             = isNotActive;
         toolBar.buttonDebugRestart.disabled          = isNotActive;
      }

      debugStepIntoItem.disabled          = isNotNotRunning;
      debugStepOverItem.disabled          = isNotNotRunning;
      debugSkipStepOverItem.disabled      = isNotNotRunning;
      debugStepOutItem.disabled           = isNotStopped;
      debugSkipStepOutItem.disabled       = isNotStopped;
#if 0
      debugStepUntilItem.disabled         = isNotStopped;
      debugSkipStepUntilItem.disabled     = isNotStopped;
#endif
      if(toolBar)
      {
         toolBar.buttonDebugStepInto.disabled         = isNotNotRunning;
         toolBar.buttonDebugStepOver.disabled         = isNotNotRunning;
         toolBar.buttonDebugSkipStepOver.disabled     = isNotNotRunning;
         toolBar.buttonDebugStepOut.disabled          = isNotStopped;
         //toolBar.buttonDebugSkipStepOutItem.disabled  = isNotNotRunning;
      }
      if((Designer)GetActiveDesigner())
      {
         CodeEditor codeEditor = ((Designer)GetActiveDesigner()).codeEditor;
         if(codeEditor)
            codeEditor.AdjustDebugMenus();
      }
   }

   void ChangeFileDialogsDirectory(const char * directory, bool saveSettings)
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

   Window FindWindow(const char * filePath)
   {
      Window document = null;

      // TOCHECK: Do we need to change slashes here?
      for(document = firstChild; document; document = document.next)
      {
         const char * fileName = document.fileName;
         if(document.isDocument && fileName && !fstrcmp(fileName, filePath))
         {
            document.visible = true;
            document.Activate();
            return document;
         }
      }
      return null;
   }

   bool DontTerminateDebugSession(const char * title)
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

   Window getOpenedFile(const char * filePath)
   {
      Window document = null;
      for(document = firstChild; document; document = document.next)
      {
         const char * fileName = document.fileName;
         if(document.isDocument && fileName && !fstrcmp(fileName, filePath) && document.created)
            break;
      }
      return document;
   }

   Window OpenFile(const char * origFilePath, bool dontMaximize, bool visible, const char * type, OpenCreateIfFails createIfFails, OpenMethod openMethod, bool noParsing)
   {
      char extension[MAX_EXTENSION] = "";
      Window document = null;
      bool isProject = false;
      bool needFileModified = true;
      Window currentDoc = activeClient;
      bool maximizeDoc = !dontMaximize && ((currentDoc && currentDoc.state == maximized) || (!currentDoc && !projectView));
      bool isUrl = strstr(origFilePath, "http://") == origFilePath;
      char slashPath[MAX_LOCATION];
      char filePathBuffer[MAX_LOCATION];
      char rightPathBuffer[MAX_LOCATION];
      const char * filePath;
      const char * rightPath = null;

      if(isUrl)
         strcpy(filePathBuffer, origFilePath);
      else
      {
         if(workspace)
         {
            GetSlashPathBuffer(slashPath, origFilePath);
            rightPath = workspace.getRightPath(slashPath);
            if(rightPath)
               rightPath = GetSystemPathBuffer(rightPathBuffer, rightPath);
         }
         GetSystemPathBuffer(filePathBuffer, origFilePath);
      }
      filePath = rightPath ? rightPathBuffer : filePathBuffer;

      if(!type)
      {
         GetExtension(filePath, extension);
         strlwr(extension);
      }
      else
         strcpy(extension, type);

      if(strcmp(extension, ProjectExtension))
      {
         document = getOpenedFile(filePath);
         if(!document && rightPath)
            document = getOpenedFile(filePathBuffer);
         if(document)
         {
            document.visible = true;
            if(visible)
               document.Activate();
            return document;
         }
      }

      if(createIfFails == whatever)
         ;
      else if(!strcmp(extension, ProjectExtension) || !strcmp(extension, WorkspaceExtension))
      {
         needFileModified = false;
         if(openMethod == normal)
         {
            if(DontTerminateDebugSession($"Open Project"))
               return null;
            isProject = true;
            if(ProjectClose())
            {
               if(!projectView)
               {
                  for(;;)
                  {
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
                     }

                     if(workspace)
                     {
                        CreateProjectView(workspace, filePath);
                        document = projectView;

                        // toolBox.visible = true;
                        // sheet.visible = true;
                        projectView.MakeActive();

                        workspace.ParseLoadedBreakpoints();
                        workspace.DropInvalidBreakpoints(null);
                        workspace.Save();

                        ide.projectView.ShowOutputBuildLog(true);
                        {
                           CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
                           ide.projectView.DisplayCompiler(compiler, false);
                           delete compiler;
                        }
                        UpdateCompilerConfigs(false);
                        UpdateMakefiles();
                        {
                           char newWorkingDir[MAX_LOCATION];
                           StripLastDirectory(filePath, newWorkingDir);
                           ChangeFileDialogsDirectory(newWorkingDir, false);
                        }
                        if(document)
                           document.fileName = filePath;

                        ideMainFrame.SetText("%s - %s", filePath, titleECEREIDE);

                        // this crashes on starting ide with epj file, solution please?
                        // app.UpdateDisplay();

                        workspace.OpenPreviouslyOpenedFiles(noParsing);
                        workspace.holdTracking = true;
                        ide.RepositionWindows(false);
                        workspace.holdTracking = false;

                        workspace.timer.Start();

#if !defined(__WIN32__)
                        // Valgrind Debug menu updates
                        debugUseValgrindItem.checked = workspace.useValgrind;

                        debugValgrindNoLeakCheckItem.checked      = workspace.vgLeakCheck == no;
                        debugValgrindSummaryLeakCheckItem.checked = workspace.vgLeakCheck == summary;
                        debugValgrindYesLeakCheckItem.checked     = workspace.vgLeakCheck == yes;
                        debugValgrindFullLeakCheckItem.checked    = workspace.vgLeakCheck == full;

                        debugValgrindRSDefaultItem.checked = workspace.vgRedzoneSize == -1;
                        debugValgrindRS0Item.checked       = workspace.vgRedzoneSize == 0;
                        debugValgrindRS16Item.checked      = workspace.vgRedzoneSize == 16;
                        debugValgrindRS32Item.checked      = workspace.vgRedzoneSize == 32;
                        debugValgrindRS64Item.checked      = workspace.vgRedzoneSize == 64;
                        debugValgrindRS128Item.checked     = workspace.vgRedzoneSize == 128;
                        debugValgrindRS256Item.checked     = workspace.vgRedzoneSize == 256;
                        debugValgrindRS512Item.checked     = workspace.vgRedzoneSize == 512;

                        debugValgrindTrackOriginsItem.checked = workspace.vgTrackOrigins;
#endif

                        findInFilesDialog.mode = FindInFilesMode::project;
                        findInFilesDialog.currentDirectory = ide.project.topNode.path;

                        {
                           char location[MAX_LOCATION];
                           StripLastDirectory(ide.project.topNode.path, location);
                           ChangeProjectFileDialogDirectory(location);
                        }

                        break;
                     }
                     else
                     {
                        if(MessageBox { type = yesNo, master = this, text = $"Error opening project", contents = $"Open a different project?" }.Modal() == yes)
                        {
                           ideProjectFileDialog.text = openProjectFileDialogTitle;
                           ideProjectFileDialog.filter = 2; // default to Project and Workspace Files
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
               return null;
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
                  prj = LoadProject(filePath, null);
                  if(prj)
                  {
                     const char * activeConfigName = null;
                     CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(workspace.activeCompiler);
                     prj.StartMonitoring();
                     workspace.AddProject(prj, null);
                     if(toolBar.activeConfig.currentRow && toolBar.activeConfig.currentRow != toolBar.activeConfig.firstRow &&
                           toolBar.activeConfig.currentRow.string && toolBar.activeConfig.currentRow.string[0])
                        activeConfigName = toolBar.activeConfig.currentRow.string;
                     if(activeConfigName)
                     {
                        for(cfg : prj.configurations)
                        {
                           if(cfg.name && !strcmp(cfg.name, activeConfigName))
                           {
                              prj.config = cfg;
                              break;
                           }
                        }
                     }
                     if(projectView)
                        projectView.AddNode(prj.topNode, null);
                     workspace.modified = true;
                     workspace.Save();
                     findInFilesDialog.AddProjectItem(prj);
                     projectView.ShowOutputBuildLog(true);
                     projectView.DisplayCompiler(compiler, false);
                     projectView.ProjectUpdateMakefileForAllConfigs(prj);
                     delete compiler;

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
            MessageBox { type = ok, master = this, text = filePath, contents = $"File doesn't exist." }.Modal();
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
            MessageBox { type = ok, master = this, text = filePath, contents = $"File doesn't exist." }.Modal();
      }
#endif
      else if(!strcmp(extension, "txt") || !strcmp(extension, "text") ||
            !strcmp(extension, "nfo") || !strcmp(extension, "info") ||
            !strcmp(extension, "htm") || !strcmp(extension, "html") ||
            !strcmp(extension, "css") || !strcmp(extension, "php") ||
            !strcmp(extension, "js"))
      {
         CodeEditor editor { parent = this, state = state, visible = false, noParsing = noParsing };
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
         CodeEditor editor { parent = this, state = state, visible = false, noParsing = noParsing };
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
               workspace.UpdateOpenedFileInfo(filePath, opened, true);
         }
      }

      if(!document && createIfFails != no)
      {
         String msg = PrintString($"\nFile doesn't exist.\n\nLocation: ", filePath, $"\n\nCreate?");
         if(createIfFails != yes && !needFileModified &&
               MessageBox { type = yesNo, master = this, text = $"File not found", contents = msg }.Modal() == yes)
            createIfFails = yes;
         if(createIfFails == yes || createIfFails == whatever)
         {
            document = (Window)NewCodeEditor(this, maximizeDoc ? maximized : normal, true);
            if(document)
               document.fileName = filePath;
         }
         delete msg;
      }

      if(document)
      {
         if(projectView && document._class == class(CodeEditor) && workspace)
            workspace.RestorePreviouslyOpenedFileState((CodeEditor)document);

         if(needFileModified)
            document.OnFileModified = OnFileModified;
         document.NotifySaved = DocumentSaved;
         if(maximizeDoc && document.hasMaximize)
            document.state = maximized;

         if(isProject)
         {
            ideConfig.recentWorkspaces.addRecent(document.fileName);
            ideConfig.recentWorkspaces.write(settingsContainer);
            ide.updateRecentProjectsMenu();
         }
         else if(workspace)
         {
            workspace.recentFiles.addRecent(document.fileName);
            workspace.Save();
         }
         else
         {
            ideConfig.recentFiles.addRecent(document.fileName);
            ideConfig.recentFiles.write(settingsContainer);
         }
         ide.updateRecentFilesMenu();
         ide.AdjustFileMenus();
         return document;
      }
      else
         return null;
   }

   // TOCHECK: I can't use a generic one for both ModelView and PictureEdit both derived from Window
   /*bool Window::GenericDocumentOnClose(bool parentClosing)
   {
      if(!parentClosing && ide.workspace)
         ide.workspace.UpdateOpenedFileInfo(fileName, unknown, false);
      return true;
   }*/
   bool ModelView::ModelViewOnClose(bool parentClosing)
   {
      if(!parentClosing && ide.workspace)
         ide.workspace.UpdateOpenedFileInfo(fileName, unknown, false);
      return true;
   }
   bool PictureEdit::PictureEditOnClose(bool parentClosing)
   {
      if(!parentClosing && ide.workspace)
         ide.workspace.UpdateOpenedFileInfo(fileName, unknown, false);
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

   void UpdateStateLight(StatusField fld, bool on)
   {
      fld.color = on ? lime : Color { 128,128,128 };
      fld.backColor = on ? dimGray : 0;
      fld.bold = on;
   }

   bool OnActivate(bool active, Window swap, bool * goOnWithActivation, bool direct)
   {
      UpdateStateLight(caps, app.GetKeyState(capsState));
      UpdateStateLight(num, app.GetKeyState(numState));
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case b: projectView.Update(null); break;
         case capsLock: UpdateStateLight(caps, app.GetKeyState(capsState)); break;
         case numLock:  UpdateStateLight(num, app.GetKeyState(numState)); break;
      }
      return true;
   }

   bool OnKeyUp(Key key, unichar ch)
   {
      switch(key)
      {
         case capsLock: UpdateStateLight(caps, app.GetKeyState(capsState)); break;
         case numLock:  UpdateStateLight(num, app.GetKeyState(numState)); break;
      }
      return true;
   }

   void GoToError(const char * line, bool openAsText, bool noParsing, const char * objectFileExt)
   {
      if(projectView)
         projectView.GoToError(line, openAsText, noParsing, objectFileExt);
   }

   FileAttribs GoToCodeSelectFile(const char * filePath, const char * dir, Project prj, ProjectNode * node, char * selectedPath, const char * objectFileExt)
   {
      FileAttribs result { };
      FileAttribs fileAttribs;
      if(filePath[0])
      {
         bool done = false;
         if(prj)
            strcpy(selectedPath, prj.topNode.path);
         else if(dir && dir[0])
            strcpy(selectedPath, dir);
         else
            selectedPath[0] = '\0';
         PathCat(selectedPath, filePath);

         if((fileAttribs = FileExists(selectedPath)).isFile)
         {
            result = fileAttribs;
            done = true;
         }
         else
         {
            char * path = CopyString(selectedPath);
            StripLastDirectory(path, path);
            if((fileAttribs = FileExists(path)) && (fileAttribs.isDirectory || fileAttribs.isDrive))
            {
               int len = strlen(selectedPath);
               char * d = &selectedPath[len - 1];
               char * stop = d - (len - strlen(path));
               while(d != stop)
               {
                  *d = 0;
                  while(d != stop)
                  {
                     d--;
                     if(!isspace(*d)) break;
                     *d = 0;
                  }
                  if((fileAttribs = FileExists(selectedPath)).isFile)
                  {
                     result = fileAttribs;
                     done = true;
                     break;
                  }
               }
            }
            delete path;
         }
         if(!done && workspace)
         {
            for(p : workspace.projects)
            {
               strcpy(selectedPath, p.topNode.path);
               PathCat(selectedPath, filePath);
               if((fileAttribs = FileExists(selectedPath)).isFile)
               {
                  done = true;
                  result = fileAttribs;
                  break;
               }
            }
            if(!done)
            {
               Project project;
               ProjectNode n = null;
               for(p : workspace.projects)
               {
                  if((n = p.topNode.Find(filePath, false)))
                  {
                     n.GetFullFilePath(selectedPath, true, true);
                     if((fileAttribs = FileExists(selectedPath)).isFile)
                     {
                        if(node) *node = n;
                        result = fileAttribs;
                        break;
                     }
                  }
               }
               if(!n && (n = workspace.GetObjectFileNode(filePath, &project, selectedPath, objectFileExt)) && project &&
                     (fileAttribs = FileExists(selectedPath)).isFile)
               {
                  if(node) *node = n;
                  result = fileAttribs;
               }
            }
         }
      }
      return result;
   }

   void CodeLocationParseAndGoTo(const char * text, Project project, const char * dir, bool openAsText, bool noParsing, const char * objectFileExt)
   {
      char *s = null;
      const char *path = text;
      char *colon = strchr(text, ':');
      char filePath[MAX_LOCATION] = "";
      char completePath[MAX_LOCATION];
      int line = 0, col = 0;
      int len = strlen(text);
      Project prj = null;
      FileAttribs fileAttribs;

      // support for valgrind output
      if((s = strstr(text, "==")) && s == text && (s = strstr(s+2, "==")) && (s = strstr(s+2, ":")) && (s = strstr(s+1, ":")))
      {
         colon = s;
         for(; s>text; s--)
         {
            if(*s == '(')
            {
               path = s+1;
               break;
            }
         }
         /*for(s=colon; *s; s++)
         {
            if(*s == ')')
            {
               *s = '\0';;
               break;
            }
         }*/
         //*colon = '\0';
         //line = atoi(colon+1);
      }
      // support for "Found n match(es) in "file/path";
      else if(len > 0 && path[len-1] == '\"' && strstr(path, $"Found %d match%s in \"%s\"%s\n\n"."Found") && strstr(path, $"match") && strstr(path, $"in") && (s = strstr(path, "\"")) && s != path+len-1)
      {
         path = s+1;
      }
      else
      {
         if(colon && (colon[1] == '/' || colon[1] == '\\'))
         {
            path = (colon - 1 > path) ? colon - 1 : path;
            colon = strstr(colon + 1, ":");
         }
         if(*path == '*' && (s = strchr(path+1, '*')))
            path = s+1;
         while(isspace(*path)) path++;
      }
      if(*path == '(')
      {
         char * close = strchr(path, ')');
         if(close)
         {
            char name[256];
            strncpy(name, path+1, close - path - 1);
            name[close - path - 1] = '\0';
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
      if(colon)
      {
         strncpy(filePath, path, colon - path);
         filePath[colon - path] = '\0';
         line = atoi(colon + 1);
         colon = strstr(colon + 1, ":");
         if(colon)
            col = atoi(colon + 1);
      }
      else if(path - 1 >= text && *(path - 1) == '\"')
      {
         colon = strchr(path, '\"');
         if(colon)
         {
            strncpy(filePath, path, colon - path);
            filePath[colon - path] = '\0';
         }
      }
      else if(path && !colon)
      {
         strcpy(filePath, path);
      }

      if(prj && filePath[0] && strstr(filePath, "$("))
      {
         DirExpression pathExp { };
         CompilerConfig compiler = GetCompilerConfig();
         ProjectConfig config = prj.config;
         int bitDepth = GetBitDepth();
         pathExp.Evaluate(filePath, prj, compiler, config, bitDepth);
         PathCatSlash(filePath, pathExp.dir);
         delete compiler;
         delete pathExp;
      }

      if((fileAttribs = GoToCodeSelectFile(filePath, dir, prj, null, completePath, objectFileExt)))
         CodeLocationGoTo(completePath, fileAttribs, line, col, openAsText, noParsing);
   }

   void CodeLocationGoTo(const char * path, const FileAttribs fileAttribs, int line, int col, bool openAsText, bool noParsing)
   {
      if(fileAttribs.isFile)
      {
         char ext[MAX_EXTENSION];
         GetExtension(path, ext);
         strlwr(ext);
         if(binaryDocExt.Find(ext))
            ShellOpen(path);
         else if(!strcmp(ext, "a") || !strcmp(ext, "o") || !strcmp(ext, "bc") ||
               !strcmp(ext, "lib") || !strcmp(ext, "dll") || !strcmp(ext, "exe"))
         {
            char dirPath[MAX_LOCATION];
            StripLastDirectory(path, dirPath);
            ShellOpen(dirPath);
         }
         else
         {
            bool asText = (openAsText || !strcmpi(ext, ProjectExtension) || !strcmpi(ext, WorkspaceExtension));
            CodeEditor codeEditor = (CodeEditor)OpenFile(path, false, true, asText ? "txt" : ext, no, normal, noParsing);
            if(codeEditor && codeEditor._class == class(CodeEditor) && line)
            {
               EditBox editBox = codeEditor.editBox;
               editBox.GoToLineNum(line - 1);
               editBox.GoToPosition(editBox.line, line - 1, col ? (col - 1) : 0);
            }
         }
      }
      else if(fileAttribs.isDirectory)
         ShellOpen(path);
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
            if(!client && !projectView && sheet.visible)
            {
               if(sheet)
                  sheet.visible = false;
               toolBox.visible = false;
            }
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

            caps = { width = 40, text = $"CAPS" };
            statusBar.AddField(caps);
            UpdateStateLight(caps, app.GetKeyState(capsState));

            ovr = { width = 36, text = $"OVR" };
            statusBar.AddField(ovr);
            UpdateStateLight(ovr, (editBox && editBox.overwrite));

            num = { width = 36, text = $"NUM" };
            statusBar.AddField(num);
            UpdateStateLight(num, app.GetKeyState(numState));

            //statusBar.text = "Ready";

            if(projectView && projectView.project)
            {
               bool isCObject = false;
               ProjectNode node = projectView.GetNodeFromWindow(client, null, true, false, null);
               if(!node && (node = projectView.GetNodeFromWindow(client, null, true, true, null)))
                  isCObject = true;
               if(node)
               {
                  char nodeName[MAX_FILENAME];
                  char name[MAX_FILENAME+96];
                  if(isCObject)
                     ChangeExtension(node.name, "c", nodeName);
                  sprintf(name, $"Compile %s", isCObject ? nodeName : node.name);
                  projectCompileItem =
                  {
                     copyText = true, text = name, c, ctrlF7, disabled = projectView.buildInProgress;

                     bool NotifySelect(MenuItem selection, Modifiers mods)
                     {
                        if(projectView)
                        {
                           bool isCObject = false;
                           bool isExcluded = false;
                           ProjectNode node = projectView.GetNodeForCompilationFromWindow(activeClient, true, &isExcluded, &isCObject);
                           if(node)
                           {
                              if(isExcluded)
                                 ide.outputView.buildBox.Logf($"%s %s is excluded from current build configuration.\n", isCObject ? "Object file" : "File", node.name);
                              else
                              {
                                 List<ProjectNode> nodes { };
                                 nodes.Add(node);
                                 projectView.Compile(node.project, nodes, normal, isCObject ? cObject : normal);
                                 delete nodes;
                              }
                           }
                        }
                        return true;
                     }
                  };
                  projectMenu.AddDynamic(projectCompileItem, ide, false);
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
      ideMainFrame.Destroy(0);
      return true;
   }

   bool OnPostCreate()
   {
      int c;
      bool passThrough = false;
      bool debugWorkDir = false;
      char * passDebugWorkDir = null;
      bool openAsText = false;
      DynamicString passArgs { };
      int ptArg = 0;

      for(c = 1; c<app.argc; c++)
      {
         if(passThrough)
         {
            const char * arg = app.argv[c];
            char * buf = new char[strlen(arg)*2+1];
            if(ptArg++ > 0)
               passArgs.concat(" ");
            PassArg(buf, arg);
            passArgs.concat(buf);
            delete buf;
         }
         else if(debugWorkDir)
         {
            passDebugWorkDir = CopyString(app.argv[c]);
            StripQuotes(passDebugWorkDir, passDebugWorkDir);
            debugWorkDir = false;
         }
         else if(!strcmp(app.argv[c], "-t"))
            openAsText = true;
         else if(!strcmp(app.argv[c], "-no-parsing"))
            ide.noParsing = true;
         else if(!strcmp(app.argv[c], "-debug-start"))
            ide.debugStart = true;
         else if(!strcmp(app.argv[c], "-debug-work-dir"))
            debugWorkDir = true;
         else if(!strcmp(app.argv[c], "-@"))
            passThrough = true;
         else
         {
            char fullPath[MAX_LOCATION];
            char parentPath[MAX_LOCATION];
            char ext[MAX_EXTENSION];
            bool isProject;
            FileAttribs dirAttribs;
            GetWorkingDir(fullPath, MAX_LOCATION);
            PathCat(fullPath, app.argv[c]);
            StripLastDirectory(fullPath, parentPath);
            GetExtension(app.argv[c], ext);
            isProject = !openAsText && !strcmpi(ext, ProjectExtension);

            if(isProject && c > 1 + (ide.debugStart ? 1 : 0)) continue;

            // Create directory for projects (only)
            if(((dirAttribs = FileExists(parentPath)) && dirAttribs.isDirectory) || isProject)
            {
               if(isProject && !FileExists(fullPath))
               {
                  char name[MAX_LOCATION];
                  NewProjectDialog newProjectDialog;

                  if(projectView)
                  {
                     projectView.visible = false;
                     if(!projectView.Destroy(0))
                        return true;
                  }

                  newProjectDialog = { master = this };

                  strcpy(name, app.argv[c]);
                  StripExtension(name);
                  GetLastDirectory(name, name);
                  newProjectDialog.projectName.contents = name;
                  newProjectDialog.projectName.NotifyModified(newProjectDialog, newProjectDialog.projectName);
                  newProjectDialog.locationEditBox.path = parentPath;
                  newProjectDialog.NotifyModifiedLocation(newProjectDialog.locationEditBox);

                  incref newProjectDialog;
                  newProjectDialog.Modal();
                  if(projectView)
                  {
                     ideConfig.recentWorkspaces.addRecent(projectView.fileName);
                     ideConfig.recentWorkspaces.write(settingsContainer);
                     ide.updateRecentMenus();
                  }
                  delete newProjectDialog;
                  // Open only one project
                  break;
               }
               else
                  ide.OpenFile(fullPath, app.argFilesCount > 1, true, openAsText ? "txt" : null, yes, normal, false);
            }
            else if(strstr(fullPath, "http://") == fullPath)
               ide.OpenFile(fullPath, app.argFilesCount > 1, true, openAsText ? "txt" : null, yes, normal, false);
         }
      }
      if(passThrough && projectView && projectView.project && workspace)
         workspace.commandLineArgs = passArgs;
      if(passDebugWorkDir && projectView && projectView.project && workspace)
      {
         workspace.debugDir = passDebugWorkDir;
         delete passDebugWorkDir;
      }

      UpdateToolBarActiveConfigs(false);
      UpdateToolBarActiveCompilers();
      delete passArgs;
      return true;
   }

   void OnDestroy()
   {
      // IS THIS NEEDED? WASN'T HERE BEFORE...  Crashes on getting node's projectView otherwise
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

   void SetPath(bool projectsDirs, CompilerConfig compiler, ProjectConfig config, int bitDepth)
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

      if(projectsDirs)
      {
         for(prj : workspace.projects)
         {
            DirExpression targetDirExp;

            // SKIP FIRST PROJECT...
            if(prj == workspace.projects.firstIterator.data) continue;

            // NOTE: Right now the additional project config dir will be
            //       obtained when the debugger is started, so toggling it
            //       while building will change which library gets used.
            //       To go with the initial state, e.g. when F5 was pressed,
            //       we nould need to keep a list of all project's active
            //       config upon startup.
            targetDirExp = prj.GetTargetDir(compiler, prj.config, bitDepth);

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
         DirExpression dirExpr { };
         dirExpr.Evaluate(item, null, compiler, null, 0);
         found = false;

         for(p : newExePaths)
         {
            if(!fstrcmp(p, dirExpr.dir))
            {
               found = true;
               break;
            }
         }
         if(!found)
            newExePaths.Add(CopySystemPath(dirExpr.dir));
         delete dirExpr;
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
         char path[MAX_LOCATION];
         if(!libPathExists[item])  // fstrcmp should be used
         {
            DirExpression pathExp { };
            pathExp.Evaluate(item, projectView.project, compiler, config, bitDepth);
            path[0] = '\0';
            PathCatSlash(path, pathExp.dir);
            newLibPaths.Add(CopyString(path));
            libPathExists[path] = true;
            delete pathExp;
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
            String s = CopyString(oldPaths[c]);
            newLibPaths.Add(s);
            libPathExists[s] = true;
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

      newLibPaths.Free();
      delete newLibPaths;
      delete libPathExists;
#endif

      if(compiler.distccEnabled && compiler.distccHosts)
         SetEnvironment("DISTCC_HOSTS", compiler.distccHosts);

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

   IDEWorkSpace()
   {
      // Graphics Driver Menu

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

   void updateRecentMenus()
   {
      updateRecentFilesMenu();
      updateRecentProjectsMenu();
   }

   void updateRecentFilesMenu()
   {
      Workspace ws = workspace;
      RecentPaths recentFiles = ws ? ws.recentFiles : ideConfig.recentFiles;
      recentFiles.updateRecentMenu(ide, ide.FileRecentFile, recentFilesMenu);
   }

   void updateRecentProjectsMenu()
   {
      ideConfig.recentWorkspaces.updateRecentMenu(ide, ide.FileRecentProject, recentProjectsMenu);
   }

   ~IDEWorkSpace()
   {
      delete driverItems;
      delete skinItems;
      delete languageItems;
      delete ideSettings;
      if(documentor)
      {
         documentor.Puts("Quit\n");
         documentor.Wait();
         delete documentor;
      }
   }
}

void DestroyDir(char * path)
{
   RecursiveDeleteFolderFSI fsi { };
   fsi.Iterate(path);
   delete fsi;
}

#if defined(__WIN32__)
define sdkDirName = "Ecere SDK";
#else
define sdkDirName = "ecere";
#endif

bool GetInstalledFileOrFolder(const char * subDir, const char * name, char * path, FileAttribs attribs)
{
   bool found = false;
   char * v = new char[maxPathLen];
   v[0] = '\0';
   if(!found)
   {
      strncpy(path, settingsContainer.moduleLocation, MAX_LOCATION); path[MAX_LOCATION-1] = '\0';
      StripLastDirectory(path, path);
      PathCat(path, subDir);
      if(name) PathCat(path, name);
      if(FileExists(path) & attribs) found = true;
   }
#if defined(__WIN32__)
   if(!found)
   {
      for(s : [ "ECERE_SDK_SRC", "AppData", "ALLUSERSPROFILE", "USERPROFILE", "HOMEPATH", "ProgramData", "ProgramFiles", "ProgramFiles(x86)", "SystemDrive" ])
      {
         GetEnvironment(s, v, maxPathLen);
         if(v[0])
         {
            strncpy(path, v, MAX_LOCATION); path[MAX_LOCATION-1] = '\0';
            if(!strcmp(s, "SystemDrive"))
               PathCat(path, "Program Files");
            if(strcmp(s, "ECERE_SDK_SRC"))
               PathCat(path, sdkDirName);
            PathCat(path, subDir);
            if(name) PathCat(path, name);
            if(FileExists(path) & attribs)
            {
               found = true;
               break;
            }
         }
      }
   }
#else
   if(!found)
   {
      char * p = null;
      char * tokens[256];
      int c, numTokens;

      GetEnvironment("XDG_DATA_DIRS", v, maxPathLen);
      numTokens = TokenizeWith(v, sizeof(tokens) / sizeof(byte *), tokens, ":", false);
      if(!numTokens)
      {
         p = new char[MAX_LOCATION];
         p[0] = '\0';
         strcat(p, "/usr/share");
         tokens[0] = p;
         numTokens = 1;
      }
      for(c=0; c<numTokens; c++)
      {
         strncpy(path, tokens[c], MAX_LOCATION); path[MAX_LOCATION-1] = '\0';
         PathCat(path, sdkDirName);
         PathCat(path, subDir);
         if(name)
            PathCat(path, name);
         if(FileExists(path) & attribs)
         {
            found = true;
            break;
         }
      }
      delete p;
   }
#endif
   delete v;
   return found;
}

void FindAndShellOpenInstalledFolder(const char * name)
{
   char path[MAX_LOCATION];
   if(GetInstalledFileOrFolder(name, null, path, { isDirectory = true }))
      ShellOpen(path);
}

void FindAndShellOpenInstalledFile(const char * subdir, const char * name)
{
   char path[MAX_LOCATION];
   if(GetInstalledFileOrFolder(subdir, name, path, { isFile = true }))
      ShellOpen(path);
}

class RecursiveDeleteFolderFSI : NormalFileSystemIterator
{
   bool preserveRootFolder;

   void OutFolder(const char * folderPath, bool isRoot)
   {
      if(!(preserveRootFolder && isRoot))
         RemoveDir(folderPath);
   }

   bool OnFile(const char * filePath)
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

   TempFile includeFile { };
   int argFilesCount;

   bool Init()
   {
      char ext[MAX_EXTENSION];
      SetLoggingMode(stdOut, null);
      //SetLoggingMode(debug, null);

      settingsContainer.Load();

      if(ideSettings.language)
      {
         const String language = GetLanguageString();
         if(ideSettings.language.OnCompare(language))
         {
            LanguageRestart(ideSettings.language, app, null, null, null, null, true);
            return false;
         }
      }

      ide.ApplyFont(ideSettings.codeEditorFont, ideSettings.codeEditorFontSize);
      ide.ApplyColorScheme(colorScheme);

      ideConfig.compilers.read(settingsContainer);
      ideConfig.recentFiles.read(settingsContainer);
      ideConfig.recentWorkspaces.read(settingsContainer);

      // First count files arg to decide whether to maximize
      {
         bool passThrough = false, debugWorkDir = false;
         int c;
         argFilesCount = 0;
         for(c = 1; c<app.argc; c++)
         {
            if(passThrough);
            else if(debugWorkDir)
               debugWorkDir = false;
            else if(!strcmp(app.argv[c], "-t"));
            else if(!strcmp(app.argv[c], "-no-parsing"));
            else if(!strcmp(app.argv[c], "-debug-start"));
            else if(!strcmp(app.argv[c], "-debug-work-dir"))
               debugWorkDir = true;
            else if(!strcmp(app.argv[c], "-@"))
               passThrough = true;
            else
               argFilesCount++;
         }
      }

      if(app.argFilesCount > 0 && !strcmpi(GetExtension(argv[1], ext), "3ds"))
      {
         app.driver = "OpenGL";
         ide.driverItems[1].checked = true;
      }
      else
      {
#if defined(__unix__) || defined(__APPLE__)
         app.driver = (ideSettings.displayDriver && !strcmp(ideSettings.displayDriver, "OpenGL")) ? ideSettings.displayDriver : "X";
#else
         app.driver = (ideSettings.displayDriver && !strcmp(ideSettings.displayDriver, "OpenGL")) ? ideSettings.displayDriver : "GDI";
#endif
         ide.driverItems[ideSettings.displayDriver && !strcmp(ideSettings.displayDriver,"OpenGL")].checked = true;
      }

      {
         char model[MAX_LOCATION];
         if(GetInstalledFileOrFolder("samples", "3D/ModelViewer/models/duck/duck.3DS", model, { isFile = true }))
         {
            ide.duck.modelFile = model;
            ide.duck.parent = ideMainFrame;
         }
      }
      if(ide.duck.modelFile && !strcmpi(app.driver, "OpenGL"))
         ide.debugRubberDuck.disabled = false;

      SetInIDE(true);

      desktop.caption = titleECEREIDE;
      /*
      int c;
      for(c = 1; c<app.argc; c++)
      {
         char fullPath[MAX_LOCATION];
         GetWorkingDir(fullPath, MAX_LOCATION);
         PathCat(fullPath, app.argv[c]);
         ide.OpenFile(fullPath, app.argFilesCount > 1, true, null, yes, normal, false);
      }
      */

      // Default to language specified by environment if no language selected
      if(!ideSettings.language)
      {
         ideSettings.language = GetLanguageString();
         settingsContainer.Save();
      }

      // Default to home directory if no directory yet set up
      if(!ideSettings.ideProjectFileDialogLocation[0])
      {
         bool found = false;
         char location[MAX_LOCATION];
         char * home = getenv("HOME");
         char * homeDrive = getenv("HOMEDRIVE");
         char * homePath = getenv("HOMEPATH");
         char * userProfile = getenv("USERPROFILE");
         char * systemDrive = getenv("SystemDrive");
         if(home && FileExists(home).isDirectory)
         {
            strcpy(location, home);
            found = true;
         }
         if(!found && homeDrive && homePath)
         {
            strcpy(location, homeDrive);
            PathCat(location, homePath);
            if(FileExists(location).isDirectory)
               found = true;
         }
         if(!found && FileExists(userProfile).isDirectory)
         {
            strcpy(location, userProfile);
            found = true;
         }
         if(!found && FileExists(systemDrive).isDirectory)
         {
            strcpy(location, systemDrive);
            found = true;
         }
         if(found)
         {
            ideSettings.ideProjectFileDialogLocation = location;
            if(!ideSettings.ideFileDialogLocation[0])
               ideSettings.ideFileDialogLocation = location;
         }
      }

      if(!LoadIncludeFile())
         PrintLn($"error: unable to load :crossplatform.mk file inside ide binary.");

      // Create language menu
      {
         String language = ideSettings.language;
         int i = 0;
         bool found = false;

         ide.languageItems = new MenuItem[languages.count];
         for(l : languages)
         {
            ide.languageItems[i] =
            {
               ide.languageMenu, l.name;
               bitmap = { l.bitmap };
               id = i;
               isRadio = true;

               bool Window::NotifySelect(MenuItem selection, Modifiers mods)
               {
                  if(!LanguageRestart(languages[(int)selection.id].code, app, ideSettings, settingsContainer, ide, ide.projectView, false))
                  {
                     // Re-select previous selected language if aborted
                     String language = ideSettings.language;
                     int i = 0;
                     for(l : languages)
                     {
                        if(((!language || !language[0]) && i == 0) ||
                           (language && !strcmpi(l.code, language)))
                        {
                           ide.languageItems[i].checked = true;
                           break;
                        }
                        i++;
                     }
                  }
                  return true;
               }
            };
            i++;
         }

         // Try to find country-specific language first
         if(language)
         {
            i = 0;
            for(l : languages)
            {
               if(!strcmpi(l.code, language) || (i == 0 && !strcmpi("en", language)))
               {
                  ide.languageItems[i].checked = true;
                  found = true;
                  break;
               }
               i++;
            }
         }

         // Try generalizing locale
         if(!found && language)
         {
            char * under;
            char genericLocale[256];
            i = 0;
            strncpy(genericLocale, language, sizeof(genericLocale));
            genericLocale[sizeof(genericLocale)-1] = 0;

            under = strchr(genericLocale, '_');
            if(under)
               *under = 0;
            if(!strcmpi(genericLocale, "zh"))
               strcpy(genericLocale, "zh_CN");
            if(strcmp(genericLocale, language))
            {
               for(l : languages)
               {
                  if(!strcmpi(l.code, genericLocale) || (i == 0 && !strcmpi("en", genericLocale)))
                  {
                     ide.languageItems[i].checked = true;
                     found = true;
                     break;
                  }
                  i++;
               }
            }
         }

         if(!found)
            ide.languageItems[0].checked = true;

         MenuDivider { ide.languageMenu };
         MenuItem
         {
            ide.languageMenu, "Help Translate";

            bool Window::NotifySelect(MenuItem selection, Modifiers mods)
            {
               ShellOpen("http://translations.launchpad.net/ecere");
               return true;
            }
         };
      }

      ideMainFrame.Create();
      if(app.argFilesCount > 1)
         ide.MenuWindowTileVert(null, 0);
      return true;
   }

   bool Cycle(bool idle)
   {
      if(ide.documentor)
      {
         if(ide.documentor.Peek())
         {
            char line[1024];
            ide.documentor.GetLine(line, sizeof(line));
            if(!strcmpi(line, "Exited"))
            {
               ide.documentor.CloseInput();
               ide.documentor.CloseOutput();
               ide.documentor.Wait();
               delete ide.documentor;
            }
         }
         if(ide.documentor && ide.documentor.eof)
         {
            ide.documentor.CloseInput();
            ide.documentor.CloseOutput();
            ide.documentor.Wait();
            delete ide.documentor;
         }
      }
      return true;
   }

   bool LoadIncludeFile()
   {
      bool result = false;
      File include = FileOpen(":crossplatform.mk", read);
      if(include)
      {
         File f = includeFile;
         if(f)
         {
            for(; !include.Eof(); )
            {
               char buffer[4096];
               int64 count = include.Read(buffer, 1, 4096);
               f.Write(buffer, 1, count);
            }
            result = true;
         }
         delete include;
      }
      return result;
   }
}

IDEMainFrame ideMainFrame { };

define app = ((IDEApp)__thisModule);
#ifdef _DEBUG
define titleECEREIDE = $"Ecere IDE (Debug)";
#else
define titleECEREIDE = $"Ecere IDE";
#endif
