#ifdef NOMINGW
static define buildString = $"Ecere SDK v0.44 (Without MinGW) -- built on March 8, 2012 ";
#else
static define buildString = $"Ecere SDK v0.44 -- built on March 8, 2012 ";
#endif

#define WIN32_LEAN_AND_MEAN
#define GetFreeSpace _GetFreeSpace
#include <windows.h>
#undef GetFreeSpace

#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif
import "IDESettings"
import "createLink"
// import "licenseBox"
import "licensing"

class CheckListBox : ListBox
{
   fullRowSelect = false, collapseControl = true, treeBranches = true, rootCollapseButton = true, 
   noDragging = true;
   rowHeight = 18;

   void ToggleCheck(DataRow row)
   {
      Button checkBox = (Button)row.tag;
      DataRow parent;
      bool checked = !(checkBox.checked) || checkBox.buttonState == down;
      if(!checkBox.disabled)
      {
         SetCheck(row, checked);
         checkBox.buttonState = up;

         for(parent = row; parent; parent = parent.parent)
         {
            for(row = parent.firstRow; row; row = row.next)
            {
               checkBox = (Button)row.tag;
               if(checkBox.checked != checked)
                  break;
            }
            checkBox = (Button)parent.tag;
            if(row)
            {
               checkBox.checked = true;
               NotifyChecked(master, this, parent);
               checkBox.buttonState = down;
               checked = true;
            }
            else
            {
               checkBox.checked = checked;
               NotifyChecked(master, this, parent);
               checkBox.buttonState = up;
            }
         }
      }
   }

   void SetCheck(DataRow row, bool checked)
   {
      Button checkBox = (Button)row.tag;
      DataRow subRow;
      if(!checkBox.disabled && (checkBox.checked != checked || checkBox.buttonState == down))
      {
         checkBox.checked = checked;
         for(subRow = row.firstRow; subRow; subRow = subRow.next)
            SetCheck(subRow, checked);
         NotifyChecked(master, this, row);
      }
   }
   
   DataRow AddRow(DataRow parentRow)
   {      
      DataRow row = parentRow ? parentRow.AddRow() : ListBox::AddRow();
      int c;
      DataRow parent;
      int indent = 20;
      for(parent = row.parent; parent; parent = parent.parent)
         indent += 20;
      row.tag = (int)Button
      {
         this, isCheckbox = true, inactive = true, checked = true,
         position = { 2 + indent, 1+(row.index + hasHeader) * rowHeight }, size = { 12, 12 }; 
         id = (int)row;

         bool NotifyPushed(Button button, int x, int y, Modifiers mods)
         {
            currentRow = (DataRow)button.id;
            ToggleCheck(currentRow);
            return false;
         }

         bool NotifyReleased(Button button, int x, int y, Modifiers mods)
         {
            return false;
         }

         bool OnMouseOver(int x, int y, Modifiers mods)
         {

            return true;
         }

         bool OnMouseLeave(Modifiers mods)
         {

            return true;
         }
      };
      return row;
   }      

   bool NotifyKeyDown(CheckListBox listBox, DataRow row, Key key, unichar ch)
   {
      if(key == space)
      {
         listBox.ToggleCheck(row);
         return false;
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(key == space)
         return false;
      return ListBox::OnKeyHit(key, ch);
   }

   bool NotifyDoubleClick(CheckListBox listBox, int x, int y, Modifiers mods)
   {
      listBox.OnLeftButtonDown(x, y, mods);
      return false;
   }

   bool NotifyReclick(CheckListBox listBox, DataRow row, Modifiers mods)
   {
      listBox.ToggleCheck(row);
      return true;
   }

   bool NotifyCollapse(ListBox listBox, DataRow row, bool collapsed)
   {
      DataRow r;
      for(r = row.firstRow; r && r != row; )
      {
         Button checkBox = (Button)r.tag;
         checkBox.visible = !collapsed;
         if(r.firstRow && !r.collapsed) 
            row = r.firstRow;
         else 
            for(; r != row; r = r.parent)
               if(r.next) { r = r.next; break; }
      }
      for(r = row.GetNextRow(); r; r = r.GetNextRow())
      {
         Button checkBox = (Button)r.tag;
         checkBox.position.y = 1 + (r.index + listBox.hasHeader) * listBox.rowHeight;
      }
      return true;
   }

   virtual void Window::NotifyChecked(CheckListBox listBox, DataRow row);
};

struct CheckItem
{
   char * name;
   void * data;
   char * OnGetString(char * tempString, void * fieldData, bool * needClass)
   {
      return name;
   }

   void OnDisplay(Surface surface, int x, int y, int width, void * fieldData, Alignment alignment, DataDisplayFlags displayFlags)
   {
      if(!displayFlags.active) { displayFlags.current = false; displayFlags.selected = false; }
      class::OnDisplay(surface, x + 22, y, width - 22, fieldData, alignment, displayFlags);
   }
};

//#define BUFFERSIZE 0x10000
#define BUFFERSIZE 0x1000
bool abortInstall = false;

void ExtractFileFromArchive(ProgressBar progressBar, char * path, char * outputFile)
{
   char fileName[MAX_LOCATION];
   FileAttribs exists = FileExists(path);
   bool setTime = false;
   FileStats stats;

   if(exists.isDirectory)
   {
      FileListing listing { path };

      if(outputFile[0])
      {
         if(MakeDir(outputFile))
         {
            setTime = true;
            FileGetStats(path, &stats);
         }
      }

      while(listing.Find() && !abortInstall)
      {
         strcpy(fileName, outputFile);

         // Tweak file name if out
         if(outputFile[0])
         {
            if(!strcmp(fileName, ".")) fileName[0] = '\0';
            if(listing.name[0] == '/' || listing.name[0] == '\\')
            {
               char * afterSlash, rest[MAX_LOCATION];
               for(afterSlash = fileName; *afterSlash == '/' || *afterSlash == '\\'; afterSlash++);
               strcpy(rest, afterSlash);
               PathCat(fileName, "_root");
               PathCat(fileName, rest);
            }
            else if(listing.name[1] == ':')
            {
               char letter[10];
               sprintf(letter, "_%cdrive", toupper(listing.name[0]));
               PathCat(fileName, letter);
               PathCat(fileName, listing.name[2] ? (listing.name + 3) : (listing.name + 2));
            }
            else
               PathCat(fileName, listing.name);
         }
         else
            PathCat(fileName, listing.name);
         if(!strcmp(fileName, "/") || !strcmp(fileName, "\\"))
            strcpy(fileName, DIR_SEPS);
         ExtractFileFromArchive(progressBar, listing.path, fileName);
      }
      listing.Stop();
   }
   else if(exists)
   {
      File input = FileOpen(path, read);
      if(input)
      {
         File output = FileOpen(outputFile, write);
         if(output)
         {
            char fileName[MAX_FILENAME];
            uint position = progressBar.progress;
            FileSize dataSize;
            int c;
            byte buffer[BUFFERSIZE];

            FileGetSize(path, &dataSize);
            GetLastDirectory(outputFile, fileName);
            
            ((GuiApplication)__thisModule).SignalEvent();
            //((GuiApplication)__thisModule).ProcessInput();
            //((GuiApplication)__thisModule).UpdateDisplay();
            
            for(c = 0; c<dataSize && !abortInstall; c += BUFFERSIZE)
            {
               uint size = (dataSize > c + BUFFERSIZE) ? BUFFERSIZE : (dataSize - c);

               ((GuiApplication)__thisModule).Unlock();

               input.Read(buffer, 1, size);
               output.Write(buffer, 1, size);

               ((GuiApplication)__thisModule).Lock();

               progressBar.progress = position + c + size;
               ((GuiApplication)__thisModule).SignalEvent();

               //((GuiApplication)__thisModule).ProcessInput();
               //((GuiApplication)__thisModule).UpdateDisplay();
            }

            delete output;
            setTime = true;
            FileGetStats(path, &stats);
         }
         delete input;
      }
   }
   if(setTime)
      FileSetTime(outputFile, stats.created, 0, stats.modified);
}

struct Component
{
   char * name;
   char * dataPath;
   char * defInstallPath;
   Component * subComponents;
   bool mandatory;
   bool selected;
   Component * parent;

   uint requiredSize;
   uint size;
   char installPath[MAX_LOCATION];
   DataRow row;

   void GetFullPath(char * path)
   {
      if(this != null && parent)
         parent->GetFullPath(path);
      else
         strcpy(path, installDir);

      if(this != null)
         PathCat(path, installPath);
   }

   void Install(char * parentPath)
   {
      int c;
      if(selected)
      {
         char path[MAX_LOCATION];
         strcpy(path, parentPath);
         PathCat(path, installPath);

         installProgress.installing.SetText($"Installing %s...", name);
         ((GuiApplication)__thisModule).UpdateDisplay();

         if(dataPath)
         {
            char source[MAX_LOCATION];
            strcpy(source, ":");
            strcat(source, dataPath);

            MakeDir(path);

            if(FileExists(source).isFile)
            {
               char name[MAX_FILENAME];
               GetLastDirectory(source, name);
               PathCat(path, name);
            }
            if(requiredSize)
            {
               uint p = installProgress.progressBar.progress;
               ExtractFileFromArchive(installProgress.progressBar, source, path); 
            }
         }
         if(subComponents)
         {
            for(c = 0; subComponents[c].name; c++)
               subComponents[c].Install(path);
         }
      }
   }
};
Component samples[] =
{
   { "Ecere Chess",     "samples/chess",     "chess",       null, false, true },
   { "Ecere Fractals",  "samples/fractals",  "fractals",    null, false, true },
   { "3D",              "samples/3D",        "3D",          null, false, true },
   { "Audio",           "samples/audio",     "audio",       null, false, true },
   { "Database",        "samples/db",        "db",          null, false, true },
   { "eC",              "samples/eC",        "eC",          null, false, true },
   { "Games",           "samples/games",     "games",       null, false, true },
   { "GUI & Graphics",  "samples/guiAndGfx", "guiAndGfx",   null, false, true },
   { "Miscellaneous",   "samples/misc",      "misc",        null, false, true },
   { "Networking",      "samples/net",       "net",         null, false, true },
   { "WIA Scanning",    "samples/scanning",  "scanning",    null, false, true },
   { "Threading",       "samples/threads",   "threads",     null, false, true }
   { null }
};

public enum CoreSDKID
{
   ide, runtime, ec, eda, vanilla, extras,
#ifndef NOMINGW
   gcc, gdb, mingw, binutils, make,
#endif
   none
};

Component coreSDK[CoreSDKID] =
{
   { "Ecere IDE",       "ecere-sdk/ide",                 "bin",      null, true,  true },
   { "Runtime Library", "ecere-sdk/ecere.dll",           "bin",      null, true,  true },
   { "eC Compiler",     "ecere-sdk/compiler",            "bin",      null, true,  true },
   { "Data Access",     "ecere-sdk/eda",                 "bin",      null, false, true },
   { "Ecere Vanilla",   "ecere-sdk/libecereVanilla.a",   "lib",      null, false, true },
   { "Ecere Extras",    "extras",                        "extras",   null, false, true },
#ifndef NOMINGW
   { "GNU C Compiler",  "mingw/gcc/core",   "mingw", null, true, true },
   { "GNU Debugger",    "mingw/gdb",        "mingw", null, true, true },
   { "MinGW Runtime",   "mingw/mingwrt",    "mingw", null, true, true },
   { "Binary Utils",    "mingw/binutils",   "mingw", null, true, true },
   { "GNU Make",        "mingw/make",       "mingw", null, true, true },
#endif
   { null }
};

#ifndef NOMINGW
Component additional[] =
{
   { "UPX",             "upx/bin",                 "mingw",    null, false, true },
   { "GNU Regexp",      "mingw/gnurx",             "mingw",    null, false, true },
   { "Win32 APIs",      "mingw/w32api",            "mingw",    null, false, true },
   { "pthreads",        "mingw/pthreads",          "mingw",    null, false, true },
   { "C++ Compiler",    "mingw/gcc/c++",           "mingw",    null, false, true },
   { "GCC I18n",        "mingw/locale/gcc",        "mingw",    null, false, false },
   { "GDB I18n",        "mingw/locale/gdb",        "mingw",    null, false, false },
   { "Make I18n",       "mingw/locale/make",       "mingw",    null, false, false },
   { "Binutils I18n",   "mingw/locale/binutils",   "mingw",    null, false, false },
   { null }
};
#endif

public enum DocumentationID
{
   ecereBook, apiRef, tutorials, coursework,
#ifndef NOMINGW
   gccDoc, gppDocs, gdbDocs, makeDocs, binDocs, mingwDocs, gnurxDocs, upxDocs,
#endif
   none
};

Component documentation[DocumentationID] =
{
   { "Ecere Book",         "ecere-sdk/book",       "doc",            null, false, true },
   { "API Reference",      "ecere-sdk/doc",        "doc",            null, false, true },
   { "Ecere Tutorials",    "ecere-sdk/tutorials",  "doc",            null, false, true },
   { "Ecere Coursework",   "ecere-sdk/coursework", "doc",            null, false, true },
#ifndef NOMINGW
   { "GCC Docs",        "mingw/doc/gcc",        "mingw",          null, false, false },
   { "G++ Docs",        "mingw/doc/g++",        "mingw",          null, false, false },
   { "GDB Docs",        "mingw/doc/gdb",        "mingw",          null, false, false },
   { "Make Docs",       "mingw/doc/make",       "mingw",          null, false, false },
   { "Binutils Docs",   "mingw/doc/binutils",   "mingw",          null, false, false },
   { "MinGW Docs",      "mingw/doc/mingwrt",    "mingw",          null, false, false },
   { "gnurx Docs",      "mingw/doc/gnurx",      "mingw",          null, false, false },
   { "UPX Docs",        "upx/doc",              "mingw/doc/upx",  null, false, false },
#endif
   { null }
};

public enum ComponentID
{
   coreSDK,
#ifndef NOMINGW
   additional,
#endif
   documentation,
   samples,
   none
};

Component components[ComponentID] =
{
   { "Core SDK Files", null, null, coreSDK, true, true },
#ifndef NOMINGW
   { "Additional Support", null, null, additional, false, true },
#endif
   { "Documentation", null /*"doc"*/, null /*"doc"*/, documentation, false, true },
   { "Samples", null, "samples", samples, false, true },
   { null }
};
FileSize totalSize;
FileSize totalInstalled;

struct InstallOption
{
   char * name;
   InstallOption * subOptions;
   bool selected;
   DataRow row;
};

enum AssociateOptions
{
   AssociateEPJ,
   AssociateEC,
   AssociateC,
   AssociateCPP,
   AssociateTXT,
   Associate3DS,
   AssociateIMG
};

InstallOption associateOptions[] =
{
   { "Associate with Ecere Project Files (*.epj)", null, true },
   { "Associate with eC Files (*.ec, *.eh)", null, true },
   { "Associate with C files (*.c, *.h)", null, false },
   { "Associate with C++ Files (*.cpp, *.hpp, *.cc, *.hh, *.cxx, *.hxx)", null, false },
   { "Associate with text files (*.txt)", null, false },
   { "Associate with 3D Studio Model Files (*.3ds)", null, true },
   { "Associate with Image Files (*.png, *.jpg, *.pcx, *.bmp, *.gif)", null, false },
   { null }
};

enum PathOptions
{
   AddECEREPaths
#ifndef NOMINGW
   , AddMinGWPaths
#endif
};

InstallOption pathOptions[] =
{
   { "Add Ecere binaries location to the system path", null, true },
   { "Add MinGW to the system path", null, true }
   { null }
};

enum IconOptions
{
   StartMenuIcon,
   DesktopIcon,
   QuickLaunchIcon
};

InstallOption options[] =
{
   { "Start Menu Group", null, true },
   { "Desktop Icon", null, true },
   { "Quicklaunch Icon", null, true },
   { "Associate the ECERE IDE with Supported File Types", associateOptions, true },
#ifndef NOMINGW
   { "Add binaries location to the system paths", pathOptions, true },
#endif
   { null }
};

char sourceDir[MAX_LOCATION] = ":";
char installDir[MAX_LOCATION];

class Installer : Window
{
   text = $"Ecere Software Development Kit Setup - v0.44 \"Ryōan-ji\"";
   background = activeBorder;
   borderStyle = fixed;
   hasMinimize = true;
   hasClose = true;
   tabCycle = true;
   clientSize = { 636, 456 };
   icon = { ":icon.png" };

   Picture back { image = BitmapResource { ":ryoanji.png" }, parent = this, position = { 0, 0 } };
   FileDialog fileDialog
   {
      master = this, type = selectDir,
      text = $"Select a new location"
   };
   Button browse
   {
      master = this, autoCreate = false, inactive = true, /*hotKey = F2,*/ text = "...";
      
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         DataRow row = componentsBox.currentRow;
         Component * component = ((CheckItem *)row.GetData(componentField))->data;
         component->GetFullPath(fileDialog.filePath);
         StripLastDirectory(fileDialog.filePath, fileDialog.currentDirectory);

         if(fileDialog.Modal() == ok)
         {
            componentsBox.StopEditing(false);
            row.SetData(locationField, fileDialog.filePath);
            componentsBox.NotifyChanged(this, componentsBox, row);
            componentsBox.currentField = componentsBox.currentField;
         }
         return true;
      }
   };
   CheckListBox componentsBox
   {
      this, size = { 460, 112 }, position = { 160, 160 }, hasHeader = true;
      alwaysEdit = true;
      opacity = 0;

      bool NotifyChanged(ListBox listBox, DataRow row)
      {
         Component * component = ((CheckItem *)listBox.GetData(componentField))->data;
         char path[MAX_LOCATION], relative[MAX_LOCATION] = "", ** newPath;
         char fullPath[MAX_LOCATION];

         component->parent->GetFullPath(path);
         strcpy(fullPath, path);

         newPath = (char **)row.GetData(locationField);
         if(newPath && *newPath)
         {
            PathCat(fullPath, *newPath);
            MakePathRelative(fullPath, path, relative);
         }
         listBox.SetData(locationField, relative);
         strcpy(component->installPath, relative);

         //SetAvailableSpace(component, path);
         {
            ComponentID c;
            install.disabled = false;
            for(c = 0; components[c].name; c++)
            {
               SetAvailableSpace(components[c], installDir);
            }
         }
         return true;
      }

      bool NotifyEditDone(ListBox listBox, DataRow row)
      {
         browse.Destroy(0);
         return true;
      }

      bool NotifyEdited(ListBox listBox, DataRow row)
      {
         browse.parent = listBox;
         browse.position = { componentField.width + locationField.width + 18, (listBox.currentIndex+1) * listBox.rowHeight - 2 };
         browse.size = { 30, listBox.rowHeight + 3 };

         browse.Create();
         return true;
      }

      void NotifyChecked(CheckListBox listBox, DataRow row)
      {
         Component * component = ((CheckItem *)row.GetData(componentField))->data;
         int c;
         Button checkBox = (Button)row.tag;
         component->selected = checkBox.checked;

         if(!component->parent) totalSize -= component->requiredSize;
         component->requiredSize = 0;
         if(component->selected)
         {
            component->requiredSize += component->size; 
            if(component->subComponents)
               for(c = 0; component->subComponents[c].name; c++)
                  component->requiredSize += component->subComponents[c].requiredSize;
         }
         if(component->requiredSize)
         {
            uint requiredSize = component->requiredSize;
            row.SetData(reqField, requiredSize);
         }
         else
            row.UnsetData(reqField);
         if(!component->parent) 
         {
            totalSize += component->requiredSize;
            {
               char sizeString[100];
               PrintSize(sizeString, totalSize, 2);
               totalSpaceValue.text = sizeString;
            }
         }
      }
   };
   Label agreementLbl { parent = this, text = $"By installing the Ecere SDK, you agree to the                                         .", font = { "Tahoma", 8.25f }, anchor = Anchor { left = 24, top = 424 } };
   Button licenseButton
   {
      this, inactive = true, offset = false, bevel = false, foreground = blue, font = { "Tahoma", 8.25f, underline = true, bold = true },
      // text = $"terms and conditions", anchor = Anchor { left = 241, top = 421 };
      text = $"terms and conditions", anchor = Anchor { left = 237, top = 421 };
      cursor = ((GuiApplication)__thisModule).GetCursor(hand);

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         // LicenseBox { master = this, sourceFile = ":ecere-sdk/doc/LICENSE" }.Modal();
         LicensesForm { master = this }.Modal();
         return true;
      }
   };
   CheckListBox optionsBox
   {
      this, size = { 460, 94 }, position = { 160, 284 };
      opacity = 0;

      void NotifyChecked(CheckListBox listBox, DataRow row)
      {
         CheckItem * item = row.GetData(optionField);
         InstallOption * option = item->data;
         int c;
         Button checkBox = (Button)row.tag;
         option->selected = checkBox.checked;
      }
   };
   Button install
   {
      parent = this, text = $"Install", isDefault = true, size = { 75, 23 }, position = { 432, 416 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         installProgress.Create();
         Destroy(0);
         // installProgress.thread.Main();
         installProgress.thread.Create();
         return true;
      }
   };
   Button button3 { parent = this, text = $"Cancel", hotKey = altX, size = Size { 75, 23 }, anchor = Anchor { left = 544, top = 416 }, NotifyClicked = ButtonCloseDialog };
   Label label1 { labeledWindow = destBox, tabCycle = true, isGroupBox = true, parent = this, inactive = false, size = Size { 458, 50 }, anchor = Anchor { left = 160, top = 96 } };
   PathBox destBox
   {
      parent = label1, master = this, text = $" Destination Folder", size = Size { 336, 22 }, anchor = Anchor { left = 12, top = 20, right = 12 };
      typeExpected = directory;
      browseDialog = fileDialog;
      opacity = 0;

      bool NotifyModified(PathBox pathBox)
      {
         ComponentID c;
         strcpy(installDir, destBox.path);
         install.disabled = false;
         for(c = 0; components[c].name; c++)
         {
            SetAvailableSpace(components[c], installDir);
         }
         return true;
      }
   };
   /*Button button1
   {
      label1, this, $"Browse", altB, size = { 83, 24 }, position = { 360, 16 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         strcpy(fileDialog.filePath, installDir);
         StripLastDirectory(installDir, fileDialog.currentDirectory);
         if(fileDialog.Modal())
         {
            strcpy(installDir, fileDialog.filePath);
            destBox.contents = installDir;
            // TOCHECK: Should setting contents call NotifyModified?
            destBox.NotifyModified(destBox.master, destBox);
         }
         return true;
      }
   };*/
   EditBox label5
   {
      this, multiLine = true,
      opacity = 0, borderStyle = none, inactive = true, size = { 136, 53 }, position = { 14, 96 }, noSelect = true,
      contents = $"Select the default root\n"
         "folder where to install\n"
         "all components:"
   };
   EditBox label6
   {
      this, opacity = 0, borderStyle = none, inactive = true, size = { 136, 132 }, position = { 14, 152 }, noSelect = true,
      multiLine = true,
      contents = $"Select the optional\n"
         "components you wish\n"
         "to install:\n\n"
         "You may customize the\n"
         "install location for each\n"
         "of them, or use the default\n"
         "based on the main\n"
         "destination folder."
   };
   EditBox label7
   {
      this, opacity = 0, borderStyle = none, inactive = true, size = { 136, 53 }, position = { 14, 280 }, noSelect = true, 
      multiLine = true,
      contents = $"Select icons to install, file\n"
      "associations, and system\n"
      "environment modifications:"
   };
   Label totalSpaceLabel
   {
      this, position = { 18, 352 }, text = $"Space Required: "
   };
   Label totalSpaceValue
   {
      this, position = { 100, 352 }, text = "0 mb"
   };
   EditBox editBox1
   {
      inactive = true, noSelect = true,
      multiLine = true, parent = label3, text = "editBox1", opacity = 0, borderStyle = none, size = Size { 350, 35 }, anchor = Anchor { horz = 111, vert = 13 },
      contents = $"Choose in which folder to install the ECERE SDK, which features\n"
         "of the SDK to install, as well as where to install program icons."
   };
   Label label2 { parent = this, text = buildString, position = { 16, 392 }, font = { "Tahoma", 10, true }, disabled = true, opacity = 0, background = activeBorder };
   Picture picture1
   {
      image = BitmapResource { ":ecere.png", alphaBlend = true }, filter = true, parent = label3, text = "picture1", anchor = Anchor { left = 16, top = 4 };
      cursor = ((GuiApplication)__thisModule).GetCursor(hand);

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
         ShellOpen("http://www.ecere.com/");
         return true;
      }
   };
   Label label4 { parent = label3, text = $"Choose Components, Locations and Install Options", font = FontResource { "Tahoma", 8.25f, bold = true }, size = Size { 326, 16 }, anchor = Anchor { horz = 91, vert = -12 } };
   DataField componentField { "CheckItem", width = 140, header = $"Component" };
   DataField locationField { "char *", width = 108, header = $"Destination Folder", editable = true };
   DataField reqField { "FileSize", width = 80, header = $"Req. Space", alignment = right };
   DataField avField { "FileSize64", width = 80, header = $"Avail. Space", alignment = right };
   DataField optionField { "CheckItem" };

   void SetAvailableSpace(Component component, char * parentPath)
   {
      char path[MAX_LOCATION];
      int c;
      FileSize64 size = 0;

      strcpy(path, parentPath);
      PathCat(path, component.installPath);

      if(component.subComponents)
         for(c = 0; component.subComponents[c].name; c++)
            SetAvailableSpace(component.subComponents[c], path);

      while(!FileExists(path) && path[0])
         StripLastDirectory(path, path);

      if(path[0])
         GetFreeSpace(path, &size);
      component.row.SetData(avField, size);
      if(!size) install.disabled = true;
   }

   FileSize ComputeSize(char * path)
   {
      FileSize size = 0;
      FileAttribs attribs = FileExists(path);
      if(attribs.isDirectory)
      {
         FileListing listing { path };
         while(listing.Find())
         {
            if(listing.stats.attribs.isDirectory)
               size += ComputeSize(listing.path);
            else
               size += listing.stats.size;
         }
      }
      else
         FileGetSize(path, &size);
      return size;
   }

   void AddComponent(Component component, Component parent, char * parentPath)
   {
      DataRow row = component.row = componentsBox.AddRow((parent != null) ? parent.row : null);
      Button checkBox = (Button) row.tag;
      FileSize size = 0;
      FileSize64 avSize = 0;
      char path[MAX_LOCATION];
      strcpy(path, parentPath);
      if(component.defInstallPath)
         PathCat(path, component.defInstallPath);
      component.parent = parent;
         
      row.SetData(null, CheckItem { component.name, component } );

      if(component.defInstallPath)
      {
         strcpy(component.installPath, component.defInstallPath);
         ChangeCh(component.installPath, '/', DIR_SEP);
         row.SetData(locationField, component.installPath);
      }

      if(component.mandatory) checkBox.disabled = true;
      if(!component.selected) componentsBox.ToggleCheck(row);
      if(component.dataPath)
      {
         char path[MAX_LOCATION];
         strcpy(path, ":");
         PathCat(path, component.dataPath);
         component.size = ComputeSize(path);
      }
      if(component.subComponents)
      {
         int c;
         for(c = 0; component.subComponents[c].name; c++)
         {
            AddComponent(component.subComponents[c], component, path);
            size += component.subComponents[c].requiredSize;
         }
      }

      component.requiredSize = component.selected ? (size + component.size) : 0;
      if(component.requiredSize)
         row.SetData(reqField, component.requiredSize);

      while(!FileExists(path) && path[0])
         StripLastDirectory(path, path);
      
      if(path[0])
         GetFreeSpace(path, &avSize);
      else
         avSize = 0;
      row.SetData(avField, avSize);
      row.collapsed = true;
   }

   void AddOption(InstallOption option, InstallOption parent)
   {
      DataRow row = option.row = optionsBox.AddRow((parent != null) ? parent.row : null);
      row.SetData(null, CheckItem { option.name, option } );
      if(!option.selected)
         optionsBox.ToggleCheck(row);
      if(option.subOptions)
      {
         int c;
         for(c = 0; option.subOptions[c].name; c++)
         {
            AddOption(option.subOptions[c], option);
         }
      }
      row.collapsed = true;
   }

   Installer()
   {
      int c;
      char programFilesDir[MAX_LOCATION];
      char appData[MAX_LOCATION]; // = getenv("APPDATA");
      char homeDrive[MAX_LOCATION]; //= getenv("HOMEDRIVE");
      char winDir[MAX_LOCATION]; //= getenv("windir");

      GetEnvironment("APPDATA", appData, sizeof(appData));
      GetEnvironment("HOMEDRIVE", homeDrive, sizeof(homeDrive));
      GetEnvironment("windir", winDir, sizeof(winDir));
      
      componentsBox.AddField(componentField);
      componentsBox.AddField(locationField);
      componentsBox.AddField(reqField);
      componentsBox.AddField(avField);

      optionsBox.AddField(optionField);

      if(GetEnvironment("ProgramFiles", programFilesDir, MAX_LOCATION))
      {
         strcpy(installDir, programFilesDir);
         PathCat(installDir, "ECERE SDK");
      }
      else if(homeDrive && homeDrive[0])
      {
         strcpy(installDir, homeDrive);
         PathCat(installDir, "ECERE SDK");
      }
      else if(winDir && winDir[0])
      {
         strcpy(installDir, winDir);
         PathCat(installDir, "..\\ECERE SDK");
      }
      else
         strcpy(installDir, "C:\\ECERE SDK");
      
      if(appData && appData[0])
      {
         static char defSamplesPath[MAX_LOCATION];
         static char defExtrasPath[MAX_LOCATION];
         strcpy(defSamplesPath, appData);
         PathCat(defSamplesPath, "ECERE SDK\\Samples");
         components[samples].defInstallPath = defSamplesPath;

         strcpy(defExtrasPath, appData);
         PathCat(defExtrasPath, "ECERE SDK\\extras");
         coreSDK[extras].defInstallPath = defExtrasPath;
      }
         
      destBox.path = installDir;

      {
         ComponentID c;
         for(c = 0; components[c].name; c++)
            AddComponent(components[c], null, installDir);
      }

      // Compute size apart because ToggleCheck will change it
      totalSize = 0;
      {
         ComponentID c;
         for(c = 0; components[c].name; c++)
            totalSize += components[c].requiredSize;
      }
      {
         char sizeString[100];
         PrintSize(sizeString, totalSize, 2);
         totalSpaceValue.text = sizeString;
      }
      for(c = 0; options[c].name; c++)
         AddOption(options[c], null);
   }

   bool OnCreate()
   {
      destBox.Activate();
      return true;
   }

   void OnDrawOverChildren(Surface surface)
   {
      int tw = label2.size.w;
      surface.SetForeground(Color { 128, 128, 128 });
      surface.HLine(label2.position.x + tw + 6, 620, 400);
      surface.SetForeground(white);
      surface.HLine(label2.position.x + tw + 6, 621, 401);
      surface.PutPixel(621, 400);
   }

   Label label3
   {
      parent = this, opacity = 0, borderStyle = deep, size = Size { 644, 93 }, anchor = Anchor { left = -8, top = -8 };
   };
}

class InstallProgress : Window
{
   text = $"Ecere Software Development Kit Setup - v0.44 \"Ryōan-ji\"";
   background = activeBorder;
   borderStyle = fixed;
   hasMinimize = true;
   hasClose = true;
   tabCycle = true;
   size = Size { 640, 480 };
   icon = { ":icon.png" };

   Picture back { image = BitmapResource { ":ryoanji-progress.png" }, parent = this, position = { 0, 0 } };
   Label installing { this, position = { 32, 160 } };
   ProgressBar progressBar { parent = this, size = Size { 588, 24 }, anchor = Anchor { left = 24, top = 184 } };
   Button finish
   {
      parent = this, text = $"Install", disabled = true, isDefault = true, size = Size { 75, 23 }, anchor = Anchor { left = 432, top = 416 };

      NotifyClicked = ButtonCloseDialog
   };
   Button cancel
   {
      this, text = $"Cancel", hotKey = altX, size = Size { 75, 23 }, anchor = Anchor { left = 544, top = 416 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         abortInstall = true;
         return true;
      }
   };
   EditBox titleInfo
   {
      inactive = true, noSelect = true,
      multiLine = true, parent = label3, opacity = 0, borderStyle = none, size = Size { 350, 35 }, anchor = Anchor { horz = 111, vert = 13 },
      contents = $"Please wait while the Ecere Software Development Kit is being installed."
   };
   Label label2 { parent = this, text = buildString, position = { 16, 392 }, font = { "Tahoma", 10, true }, disabled = true, opacity = 0, background = activeBorder };
   Picture picture1
   {
      image = BitmapResource { ":ecere.png", alphaBlend = true }, filter = true, parent = label3, anchor = Anchor { left = 16, top = 4 };
      cursor = ((GuiApplication)__thisModule).GetCursor(hand);

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
         ShellOpen("http://www.ecere.com/");
         return true;
      }
   };
   Label title { parent = label3, text = $"Installing the ECERE SDK", font = FontResource { "Tahoma", 8.25f, bold = true }, size = Size { 326, 16 }, anchor = Anchor { horz = 91, vert = -12 } };

   void OnDrawOverChildren(Surface surface)
   {
      int tw = label2.size.w;
      surface.SetForeground(Color { 128, 128, 128 });
      surface.HLine(label2.position.x + tw + 6, 620, 400);
      surface.SetForeground(white);
      surface.HLine(label2.position.x + tw + 6, 621, 401);
      surface.PutPixel(621, 400);
   }

   Label label3
   {
      parent = this, opacity = 0, borderStyle = deep, size = Size { 644, 93 }, anchor = Anchor { left = -8, top = -8 };
   };
   InstallThread thread
   {
   };
}

Installer installer {};
InstallProgress installProgress { autoCreate = false };

void ModifyPath(char * newPath)
{
   char * paths[100];
   int p, count;
   char oldPath[4096];
   CoreSDKID c;

   strcpy(oldPath, newPath);
   count = TokenizeWith(oldPath, sizeof(paths) / sizeof(char *), paths, ";", false);

   for(c = 0; coreSDK[c].name; c++)
   {
      char path[MAX_LOCATION];
      if(c == extras || c == vanilla) continue;

      coreSDK[c].GetFullPath(path);
      if(c != ide && c != runtime && c != eda && c != ec)
      {
#ifndef NOMINGW
         if(!pathOptions[PathOptions::AddMinGWPaths].selected)
#endif
         continue;
         PathCat(path, "bin");
      }
      else if(!pathOptions[PathOptions::AddECEREPaths].selected) continue;

      for(p = 0; p<count; p++)
         if(!fstrcmp(paths[p], path))
            break;
      if(p == count)
      {
         char * start;
         if(count) 
         {
            strcat(newPath, ";");
            start = oldPath + strlen(paths[count-1])+1;
         }
         else
            start = oldPath;
         
         strcpy(start, path);
         *(start + strlen(path)) = '\0';
         paths[count++] = start;

         strcat(newPath, path);
      }
   }
#ifndef NOMINGW
   if(pathOptions[PathOptions::AddMinGWPaths].selected)
   {
      int c;
      for(c = 0; additional[c].name; c++)
      {
         char path[MAX_LOCATION];
         NamedItem item;
         additional[c].GetFullPath(path);
         PathCat(path, "bin");
         for(p = 0; p<count; p++)
            if(!fstrcmp(paths[p], path))
               break;

         if(p == count)
         {
            char * start;
            if(count) 
            {
               strcat(newPath, ";");
               start = oldPath + strlen(paths[count-1])+1;
            }
            else
               start = oldPath;
            
            strcpy(start, path);
            *(start + strlen(path)) = '\0';
            paths[count++] = start;

            strcat(newPath, path);
         }
      }
   }
#endif
}

void AssociateExtension(char * extension, char * description, char *name, char * action, char * path)
{
   HKEY key;
   uint status, size;
   char keyName[1024];

   RegCreateKeyEx(HKEY_CLASSES_ROOT, extension, 0, "", REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, null, &key, &status);
   RegSetValueEx(key, null, 0, REG_SZ, name, strlen(name)+1);
   RegCloseKey(key);

   RegCreateKeyEx(HKEY_CLASSES_ROOT, name, 0, "", REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, null, &key, &status);
   RegSetValueEx(key, null, 0, REG_SZ, description, strlen(description)+1);
   RegCloseKey(key);

   sprintf(keyName, "%s\\shell", extension);
   RegCreateKeyEx(HKEY_CLASSES_ROOT, keyName, 0, "", REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, null, &key, &status);
   RegSetValueEx(key, null, 0, REG_SZ, action, strlen(action)+1);
   RegCloseKey(key);

   sprintf(keyName, "%s\\shell\\%s", name, action);
   RegCreateKeyEx(HKEY_CLASSES_ROOT, keyName, 0, "", REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, null, &key, &status);
   RegCloseKey(key);

   sprintf(keyName, "%s\\shell\\%s\\command", name, action);
   RegCreateKeyEx(HKEY_CLASSES_ROOT, keyName, 0, "", REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, null, &key, &status);
   
   sprintf(keyName, path);
   strcat(keyName, " \"%L\"");
   {
      uint16 wKeyName[2048];
      UTF8toUTF16Buffer(keyName, wKeyName, sizeof(wKeyName) / sizeof(uint16));
      RegSetValueExW(key, null, 0, REG_SZ, (byte *)wKeyName, (wcslen(wKeyName) + 1)*sizeof(uint16));
   }
   RegCloseKey(key);
}

class InstallThread : Thread
{
   unsigned int Main()
   {
      ComponentID c;
      ((GuiApplication)__thisModule).Lock();
      installProgress.progressBar.range = totalSize;
      for(c = 0; components[c].name && !abortInstall; c++)
         components[c].Install(installDir);
      if(abortInstall)
      {
         installProgress.progressBar.range = 0;
         installProgress.finish.Destroy(0);
         installProgress.cancel.text = $"Close";
         installProgress.cancel.isDefault = true;
         installProgress.cancel.disabled = false;
         installProgress.cancel.NotifyClicked = Window::ButtonCloseDialog;
         installProgress.installing.text = $"Installation Cancelled.";
         installProgress.title.text = $"Installation Cancelled";
         installProgress.titleInfo.contents = $"The installation was not completed.";
      }
      else
      {
         CoreSDKID c;
         char idePath[MAX_LOCATION];
         char userProfile[MAX_LOCATION];

         // Configure IDE
         GlobalSettings settings
         {
            
         };
         installProgress.installing.text = $"Configuring ECERE IDE...";
         ((GuiApplication)__thisModule).Unlock();
         ((GuiApplication)__thisModule).SignalEvent();

         settings.Load();
         for(c = 0; coreSDK[c].name; c++)
         {
            char path[MAX_LOCATION];
            NamedItem item;
            coreSDK[c].GetFullPath(path);
            if(c != ide && c != runtime && c != eda && c != ec)
               PathCat(path, "bin");
            if(c == ide)
            {
               coreSDK[c].GetFullPath(idePath);
               PathCat(idePath, "IDE.exe");
            }

            // TODO: Update This!
            /*
            for(item = settings.systemDirs[executables].first; item; item = item.next)
               if(!fstrcmp(item.name, path))
                  break;
            if(!item)
            {
               settings.systemDirs[executables].Add(NamedItem { name = CopyString(path); });
            }

            if(c == runtime)
            {
               for(item = settings.systemDirs[libraries].first; item; item = item.next)
                  if(!fstrcmp(item.name, path))
                     break;
               if(!item)
               {
                  settings.systemDirs[libraries].Add(NamedItem { name = CopyString(path); });
               }
            }
            */
         }
#ifndef NOMINGW
         /*
         for(c = 0; additional[c].name; c++)
         {
            char path[MAX_LOCATION];
            NamedItem item;
            additional[c].GetFullPath(path);
            PathCat(path, "bin");
            for(item = settings.systemDirs[executables].first; item; item = item.next)
               if(!fstrcmp(item.name, path))
                  break;
            if(!item)
            {
               settings.systemDirs[executables].Add(NamedItem { name = CopyString(path); });
            }
         }
         */
#endif
         
         {
            char path[MAX_LOCATION] = "";
            if(components[samples].selected)
               components[samples].GetFullPath(path);
            else
               components[coreSDK].GetFullPath(path);
            /* TODO: Update This!
            if(!settings.ideProjectFileDialogLocation)
               settings.ideProjectFileDialogLocation = path;
            if(!settings.ideFileDialogLocation)
               settings.ideFileDialogLocation = path;
            */
         }

         settings.Save();
         delete settings;

         // Set up Uninstaller
         ((GuiApplication)__thisModule).Lock();
         installProgress.installing.text = $"Registering uninstaller...";
         ((GuiApplication)__thisModule).Unlock();
         ((GuiApplication)__thisModule).SignalEvent();

         {
            HKEY key;
            uint status, size;
            char * displayName = "ECERE SDK 0.44";
            char uninstaller[MAX_LOCATION];
            bool nomodify = true;

            strcpy(uninstaller, installDir);
            PathCat(uninstaller, "uninstall_ecere.exe");

            RegCreateKeyEx(HKEY_LOCAL_MACHINE, "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\ECERE SDK", 0, "", REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, null, &key, &status);

            RegSetValueEx(key, "DisplayName", 0, REG_SZ, displayName, strlen(displayName)+1);
            RegSetValueEx(key, "UninstallString", 0, REG_SZ, uninstaller, strlen(uninstaller)+1);
            RegSetValueEx(key, "DisplayIcon", 0, REG_SZ, idePath, strlen(idePath)+1);
            //RegSetValueEx(key, "NoModify", 0, REG_DWORD, (byte *)&nomodify, sizeof(nomodify));
            //RegSetValueEx(key, "NoRepair", 0, REG_DWORD, (byte *)&nomodify, sizeof(nomodify));
            RegCloseKey(key);
         }

         // Add paths
         if(pathOptions[PathOptions::AddECEREPaths].selected 
#ifndef NOMINGW
            || pathOptions[PathOptions::AddMinGWPaths].selected
#endif
            )
         {
            HKEY key;
            uint status, size;
            char path[2048] = "";
            uint16 wPath[2048];

            ((GuiApplication)__thisModule).Lock();
            installProgress.installing.text = "Registering paths...";
            ((GuiApplication)__thisModule).Unlock();
            ((GuiApplication)__thisModule).SignalEvent();
                        
            // if(RegOpenKeyEx(HKEY_LOCAL_MACHINE, "Environment", 0, KEY_ALL_ACCESS, &key) == ERROR_SUCCESS)
            
            RegCreateKeyEx(HKEY_CURRENT_USER, "Environment", 0, "", REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, null, &key, &status);
            // RegCreateKeyEx(HKEY_LOCAL_MACHINE, "SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Environment", 0, "", REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, null, &key, &status);
            if(status == REG_OPENED_EXISTING_KEY)
            {
               size = sizeof(wPath);
               RegQueryValueExW(key, L"path", null, null, (byte *)wPath, &size);
               UTF16toUTF8Buffer(wPath, path, sizeof(path));
            }
            ModifyPath(path);
            UTF8toUTF16Buffer(path, wPath, sizeof(wPath) / sizeof(uint16));
            RegSetValueExW(key, L"path", 0, REG_EXPAND_SZ, (byte *)wPath, (wcslen(wPath)+1) * 2);
            RegCloseKey(key);

            SendMessageTimeout (HWND_BROADCAST, WM_SETTINGCHANGE, 0, (int)"Environment", SMTO_NORMAL, 1000, NULL);
         }

         // Install Program Group Icons
         // userProfile = getenv("USERPROFILE");
         GetEnvironment("USERPROFILE", userProfile, sizeof(userProfile));

         if(options[IconOptions::StartMenuIcon].selected)
         {
            char destPath[MAX_LOCATION];
            char startMenuPath[MAX_LOCATION] = "";
            HKEY key;

            ((GuiApplication)__thisModule).Lock();
            installProgress.installing.text = $"Installing Start Menu Icons...";
            ((GuiApplication)__thisModule).Unlock();
            ((GuiApplication)__thisModule).SignalEvent();

            strcpy(destPath, userProfile);

            if(RegOpenKeyEx(HKEY_CURRENT_USER, "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders", 0, KEY_ALL_ACCESS, &key) == ERROR_SUCCESS)
            {
               uint16 wStartMenuPath[2048];
               uint size = sizeof(wStartMenuPath);
               // RegQueryValueEx(key, "Start Menu", null, null, startMenuPath, &size);
               RegQueryValueExW(key, L"Programs", null, null, (byte *)wStartMenuPath, &size);
               UTF16toUTF8Buffer(wStartMenuPath, startMenuPath, sizeof(startMenuPath));
               RegCloseKey(key);
            }
            if(!startMenuPath[0] && userProfile && userProfile[0])
            {
               strcpy(startMenuPath, userProfile);
               PathCat(startMenuPath, "Start Menu\\Programs");
            }

            if(startMenuPath[0])
            {
               strcpy(destPath, startMenuPath);
               PathCat(destPath, "ECERE SDK");
               MakeDir(destPath);

               strcpy(destPath, startMenuPath);
               PathCat(destPath, "ECERE SDK\\ECERE IDE.lnk");
               CreateLink(idePath, destPath, null); //"ECERE IDE");
               if(components[samples].selected)
               {
                  char samplesPath[MAX_LOCATION] = "";
                  components[samples].GetFullPath(samplesPath);

                  strcpy(destPath, startMenuPath);
                  PathCat(destPath, "ECERE SDK\\Sample Projects.lnk");
                  CreateLink(samplesPath, destPath, null);//"Sample Projects");
               }
               if(components[documentation].selected && documentation[ecereBook].selected)
               {
                  char docPath[MAX_LOCATION] = "";
                  documentation[ecereBook].GetFullPath(docPath);
                  PathCat(docPath, "Ecere Tao of Programming [work in progress].pdf");

                  {
                     char tao[MAX_LOCATION] ;
                     documentation[ecereBook].GetFullPath(tao);
                     PathCat(tao, "tao.pdf");
                     RenameFile(tao, docPath);
                  }

                  strcpy(destPath, startMenuPath);
                  PathCat(destPath, "ECERE SDK\\The Ecere Tao of Programming.lnk");
                  CreateLink(docPath, destPath, null);
               }
            }
         }

         // Install Desktop Icon
         if(options[IconOptions::DesktopIcon].selected)
         {
            HKEY key;
            char desktopPath[MAX_LOCATION];

            if(RegOpenKeyEx(HKEY_CURRENT_USER, "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders", 0, KEY_ALL_ACCESS, &key) == ERROR_SUCCESS)
            {
               uint16 wDesktopPath[MAX_LOCATION];
               uint size = sizeof(wDesktopPath);
               RegQueryValueExW(key, L"Desktop", null, null, (byte *)wDesktopPath, &size);
               UTF16toUTF8Buffer(wDesktopPath, desktopPath, sizeof(desktopPath));
               RegCloseKey(key);
            }
            if(!desktopPath[0] && userProfile && userProfile[0])
            {
               strcpy(desktopPath, userProfile);
               PathCat(desktopPath, "Desktop");
            }

            if(desktopPath[0])
            {
               PathCat(desktopPath, "ECERE IDE.lnk");

               ((GuiApplication)__thisModule).Lock();
               installProgress.installing.text = $"Installing Desktop Icon...";
               ((GuiApplication)__thisModule).Unlock();
               ((GuiApplication)__thisModule).SignalEvent();

               CreateLink(idePath, desktopPath, null);//"ECERE IDE");
            }
         }

         // Install QuickLaunch Icon
         if(options[IconOptions::QuickLaunchIcon].selected)
         {
            char appData[MAX_LOCATION]; // = getenv("APPDATA");
            GetEnvironment("APPDATA", appData, sizeof(appData));

            if(appData && appData[0])
            {
               char destPath[MAX_LOCATION];

               ((GuiApplication)__thisModule).Lock();
               installProgress.installing.text = $"Installing Quicklaunch Icon...";
               ((GuiApplication)__thisModule).Unlock();
               ((GuiApplication)__thisModule).SignalEvent();

               strcpy(destPath, appData);
               PathCat(destPath, "Microsoft\\Internet Explorer\\Quick Launch\\ECERE IDE.lnk");

               CreateLink(idePath, destPath, null);//"ECERE IDE");
            }
         }

         // Register File Types
         if(associateOptions[AssociateOptions::AssociateEPJ].selected ||
            associateOptions[AssociateOptions::AssociateEC].selected ||
            associateOptions[AssociateOptions::AssociateC].selected ||
            associateOptions[AssociateOptions::AssociateCPP].selected ||
            associateOptions[AssociateOptions::AssociateTXT].selected ||
            associateOptions[AssociateOptions::Associate3DS].selected ||
            associateOptions[AssociateOptions::AssociateIMG].selected)
         {
            ((GuiApplication)__thisModule).Lock();
            installProgress.installing.text = $"Resgistering File Types...";
            ((GuiApplication)__thisModule).Unlock();
            ((GuiApplication)__thisModule).SignalEvent();
            
            if(associateOptions[AssociateOptions::AssociateEPJ].selected)
            {
               AssociateExtension(".epj", "ECERE IDE Project", "epj_file", "Open", idePath);
            }
            if(associateOptions[AssociateOptions::AssociateEC].selected)
            {
               AssociateExtension(".ec", "eC Source File", "ec_file", "Open", idePath);
               AssociateExtension(".eh", "eC Header File", "eh_file", "Open", idePath);
            }
            if(associateOptions[AssociateOptions::AssociateC].selected)
            {
               AssociateExtension(".c", "C Source File", "c_file", "Open", idePath);
               AssociateExtension(".h", "C Header File", "h_file", "Open", idePath);
            }
            if(associateOptions[AssociateOptions::AssociateCPP].selected)
            {
               AssociateExtension(".cpp", "C++ Source File", "cpp_file", "Open", idePath);
               AssociateExtension(".cc", "C++ Source File", "cpp_file", "Open", idePath);
               AssociateExtension(".cxx", "C++ Source File", "cpp_file", "Open", idePath);
               AssociateExtension(".chh", "C++ Header File", "chh_file", "Open", idePath);
               AssociateExtension(".hh", "C++ Header File", "chh_file", "Open", idePath);
               AssociateExtension(".hxx", "C++ Header File", "chh_file", "Open", idePath);
            }
            if(associateOptions[AssociateOptions::AssociateTXT].selected)
            {
               AssociateExtension(".txt", "Text File", "txt_file", "Open", idePath);
            }
            if(associateOptions[AssociateOptions::Associate3DS].selected)
            {
               AssociateExtension(".3ds", "3D Studio Model", "3ds_file", "View", idePath);
            }
            if(associateOptions[AssociateOptions::AssociateIMG].selected)
            {
               AssociateExtension(".bmp", "BMP Image", "bmp_file", "View", idePath);
               AssociateExtension(".pcx", "PCX Image", "pcx_file", "View", idePath);
               AssociateExtension(".png", "PNG Image", "png_file", "View", idePath);
               AssociateExtension(".jpg", "JPEG Image", "jpg_file", "View", idePath);
               AssociateExtension(".jpeg", "JPEG Image", "jpg_file", "View", idePath);
               AssociateExtension(".gif", "GIF Image", "gif_file", "View", idePath);
            }
         }
         ((GuiApplication)__thisModule).Lock();

         installProgress.cancel.Destroy(0);
         installProgress.finish.text = $"Finish";
         installProgress.finish.disabled = false;
         installProgress.finish.Activate();
         installProgress.installing.text = $"Installation Complete.";
         installProgress.title.text = $"Installation Complete";
         installProgress.titleInfo.contents = $"Thank you for using the Ecere SDK.";
      }
      ((GuiApplication)__thisModule).Unlock();
      return 0;
   }
}
