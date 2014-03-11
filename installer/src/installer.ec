#ifdef NOMINGW
static define buildString = $"Ecere SDK v0.44.10 (Without MinGW) -- built on March 2nd, 2014 ";
#else
static define buildString = $"Ecere SDK v0.44.10 -- built on March 2nd, 2014 ";
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
import "licensing"
import "CheckListBox"

static bool IsAdministrator()
{
   bool b;
   SID_IDENTIFIER_AUTHORITY NtAuthority = { SECURITY_NT_AUTHORITY };
   PSID AdministratorsGroup;
   b = AllocateAndInitializeSid(&NtAuthority, 2, SECURITY_BUILTIN_DOMAIN_RID, DOMAIN_ALIAS_RID_ADMINS, 0, 0, 0, 0, 0, 0, &AdministratorsGroup);
   if(b)
   {
      if(!CheckTokenMembership(NULL, AdministratorsGroup, &b))
         b = FALSE;
       FreeSid(AdministratorsGroup);
   }
   return b;
}

struct CheckItem
{
   char * name;
   void * data;
   bool add32Bit;
   char * OnGetString(char * tempString, void * fieldData, bool * needClass)
   {
      if(add32Bit)
      {
         strcpy(tempString, name);
         strcat(tempString, " (32)");
         return tempString;
      }
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

public enum BitArch { none, bits32, bits64 };

struct Component
{
   char * name;
   char * dataPath;
   char * defInstallPath;
   Component * subComponents;
   bool mandatory;
   bool selected;
   bool available;
   BitArch arch;

   Component * parent;

   uint requiredSize;
   uint size;
   char installPath[MAX_LOCATION];
   DataRow row;

   void GetFullPath(char * path, bool is32bit)
   {
      if(this != null && parent)
         parent->GetFullPath(path, is32bit || (arch == bits32 && osIS64bit));
      else
         strcpy(path, (this && (is32bit || (arch == bits32 && osIS64bit))) ? installDir32 : installDir);

      if(this != null)
         PathCat(path, installPath);
   }

   void Install(char * parentPath, char * parentPath32)
   {
      int c;
      if(selected && (arch == none || arch == bits32 || osIS64bit))
      {
         char path64[MAX_LOCATION];
         char path32[MAX_LOCATION];
         strcpy(path64, parentPath);
         PathCat(path64, installPath);

         strcpy(path32, parentPath32);
         PathCat(path32, installPath);

         installProgress.installing.SetText($"Installing %s...", name);
         ((GuiApplication)__thisModule).UpdateDisplay();

         if(dataPath)
         {
            char * path = path64;
            char source[MAX_LOCATION];
            strcpy(source, ":");
            strcat(source, dataPath);

            if(arch == bits32)
               path = path32;

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
               subComponents[c].Install(path64, path32);
         }
      }
   }
};

#ifndef NOMINGW
define minGWIncluded = true;
#else
define minGWIncluded = false;
#endif

Array<Component> samples
{ [
   { "Ecere Chess",     "samples/chess",     "chess",       null, false, true, true, none },
   { "Ecere Fractals",  "samples/fractals",  "fractals",    null, false, true, true, none },
   { "3D",              "samples/3D",        "3D",          null, false, true, true, none },
   { "Android",         "samples/android",   "android",          null, false, true, true, none },
   { $"Audio",           "samples/audio",     "audio",       null, false, true, true, none },
   { $"Database",        "samples/db",        "db",          null, false, true, true, none },
   { "eC",              "samples/eC",        "eC",          null, false, true, true, none },
   { $"Games",           "samples/games",     "games",       null, false, true, true, none },
   { $"GUI & Graphics",  "samples/guiAndGfx", "guiAndGfx",   null, false, true, true, none },
   { $"Miscellaneous",   "samples/misc",      "misc",        null, false, true, true, none },
   { $"Networking",      "samples/net",       "net",         null, false, true, true, none },
   { $"WIA Scanning",    "samples/scanning",  "scanning",    null, false, true, true, none },
   { $"Threading",       "samples/threads",   "threads",     null, false, true, true, none },
   { null }
] };

public enum CoreSDKID
{
   ide, ide32, runtime, runtime32, ec, ec32,
   gcc, gdb, mingw, binutils, make,
   none
};

Array<Component> coreSDK
{ [
   { "Ecere IDE",       "ecere-sdk/ide",                 "bin",      null, true,  true, true, bits64 },
   { "Ecere IDE",       "ecere-sdk32/ide",                 "bin",      null, true,  true, true, bits32 },
   { $"Runtime Library", "ecere-sdk/ecere.dll",           "bin",      null, true,  true, true, bits64 },
   { $"Runtime Library", "ecere-sdk32/ecere.dll",           "bin",      null, true,  true, true, bits32 },
   { $"eC Compiler",     "ecere-sdk/compiler",            "bin",      null, true,  true, true, bits64 },
   { $"eC Compiler",     "ecere-sdk32/compiler",            "bin",      null, true,  true, true, bits32 },
   { $"GNU C Compiler",  "tdm/gcc/core",   "tdm", null, true, true, minGWIncluded, none },
   { $"GNU Debugger",    "tdm/gdb",        "tdm", null, true, true, minGWIncluded, none },
   { $"MinGW-w64 Runtime",   "tdm/mingwrt",    "tdm", null, true, true, minGWIncluded, none },
   { $"Binary Utils",    "tdm/binutils",   "tdm", null, true, true, minGWIncluded, none },
   { $"GNU Make",        "tdm/make",       "tdm", null, true, true, minGWIncluded, none },
   { null }
] };

public enum AdditionalID
{
   eda, eda32, vanilla, vanilla32, extras, upx, gnurx, gnurx32, /*pthreads, */cpp, /*w32api, gcci18n, gdbi18n, makei18n, binutilsi18n, */none
};

Array<Component> additional
{ [
   { $"Data Access",     "ecere-sdk/eda",                 "bin",      null, false, true, true, bits64 },
   { $"Data Access",     "ecere-sdk32/eda",               "bin",      null, false, true, true, bits32 },
   { $"Ecere Vanilla",   "ecere-sdk/libecereVanilla.a",   "lib",      null, false, true, true, bits64 },
   { $"Ecere Vanilla",   "ecere-sdk32/libecereVanilla.a", "lib",      null, false, true, true, bits32 },
   { $"Ecere Extras",    "extras",                        "extras",   null, false, true, true, none },
   { "UPX",             "upx/bin",                       "upx/bin",      null, false, true, true, none },
   { $"GNU Regexp",      "tdm/gnurx",                     "tdm",    null, false, true, true, bits64 },
   { $"GNU Regexp",      "tdm/gnurx32",                   "tdm",    null, false, true, true, bits32 },
//   { "pthreads",        "tdm/pthreads",                   "mingw",    null, false, true, minGWIncluded, none },
   { $"C++ Compiler",    "tdm/gcc/c++",                   "tdm",    null, false, true, minGWIncluded, none },
//   { "Win32 APIs",      "mingw/w32api",                  "mingw",    null, false, true, minGWIncluded, none },
/*   { "GCC I18n",        "mingw/locale/gcc",              "tdm",    null, false, false, minGWIncluded, none },
   { "GDB I18n",        "mingw/locale/gdb",              "tdm",    null, false, false, minGWIncluded, none },
   { "Make I18n",       "mingw/locale/make",             "tdm",    null, false, false, minGWIncluded, none },
   { "Binutils I18n",   "mingw/locale/binutils",         "tdm",    null, false, false, minGWIncluded, none },
*/
   { null }
] };

public enum DocumentationID
{
   ecereBook, apiRef, tutorials, coursework,
   gccDoc, gppDocs, gdbDocs, makeDocs, binDocs, mingwDocs, gnurxDocs, upxDocs,
   none
};

Array<Component> documentation
{ [
   { $"Ecere Book",         "ecere-sdk/book",       "doc",            null, false, true, true, none },
   { $"API Reference",      "ecere-sdk/doc",        "doc",            null, false, true, true, none },
   { $"Ecere Tutorials",    "ecere-sdk/tutorials",  "doc",            null, false, true, true, none },
   { $"Ecere Coursework",   "ecere-sdk/coursework", "doc",            null, false, true, true, none },
   { $"GCC Docs",           "tdm/doc/gcc",          "tdm",          null, false, false, minGWIncluded, none },
   { $"G++ Docs",           "tdm/doc/g++",          "tdm",          null, false, false, minGWIncluded, none },
   { $"GDB Docs",           "tdm/doc/gdb",          "tdm",          null, false, false, minGWIncluded, none },
   { $"Make Docs",          "tdm/doc/make",         "tdm",          null, false, false, minGWIncluded, none },
   { $"Binutils Docs",      "tdm/doc/binutils",     "tdm",          null, false, false, minGWIncluded, none },
   { $"gnurx Docs",         "tdm/doc/gnurx",        "tdm",          null, false, false, minGWIncluded, none },
   { $"UPX Docs",           "upx/doc",              "upx/doc",  null, false, false, minGWIncluded, none },
   { null }
] };

public enum ComponentID
{
   coreSDK,
   additional,
   documentation,
   samples,
   none
};

Array<Component> components
{ [
   { $"Core SDK Files", null, null, coreSDK.array, true, true, true, none },
   { $"Additional Support", null, null, additional.array, false, true, true, none },
   { $"Documentation", null /*"doc"*/, null /*"doc"*/, documentation.array, false, true, true, none },
   { $"Samples", null, "samples", samples.array, false, true, true, none },
   { null }
] };
FileSize totalSize;
FileSize totalInstalled;

struct InstallOption
{
   char * name;
   InstallOption * subOptions;
   bool selected;
   bool available;
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

Array<InstallOption> associateOptions
{ [
   { $"Associate with Ecere Project Files (*.epj)", null, true },
   { $"Associate with eC Files (*.ec, *.eh)", null, true },
   { $"Associate with C files (*.c, *.h)", null, false },
   { $"Associate with C++ Files (*.cpp, *.hpp, *.cc, *.hh, *.cxx, *.hxx)", null, false },
   { $"Associate with text files (*.txt)", null, false },
   { $"Associate with 3D Studio Model Files (*.3ds)", null, true },
   { $"Associate with Image Files (*.png, *.jpg, *.pcx, *.bmp, *.gif)", null, false },
   { null }
] };

enum PathOptions
{
   AddECEREPaths, AddMinGWPaths
};

Array<InstallOption> pathOptions
{ [
   { $"Add Ecere binaries location to the user environment path", null, true, true },
   { $"Add MinGW to the user environment path", null, true, minGWIncluded },
   { null }
] };

enum IconOptions
{
   StartMenuIcon = 1,
   DesktopIcon = 2,
   QuickLaunchIcon = 3
};

Array<InstallOption> options
{ [
   { $"Install for All Users", null, true, true },
   { $"Start Menu Group", null, true, true },
   { $"Desktop Icon", null, true, true },
   { $"Quicklaunch Icon", null, true, true },
   { $"Associate the Ecere IDE with Supported File Types", associateOptions.array, true, true },
   { $"Add binaries location to the user environment paths", pathOptions.array, true, minGWIncluded },
   { null }
] };

char sourceDir[MAX_LOCATION] = ":";
char installDir[MAX_LOCATION];
char installDir32[MAX_LOCATION];
bool osIS64bit;

class Installer : Window
{
   text = $"Ecere Software Development Kit Setup - v0.44.10 \"Ryōan-ji\" 64 Bit Edition";
   background = activeBorder;
   borderStyle = fixed;
   hasMinimize = true;
   hasClose = true;
   tabCycle = true;
   clientSize = { 636, 476 };
   // clientSize = { 796, 576 };
   icon = { ":icon.png" };

   Picture back { image = BitmapResource { ":ryoanji.png" }, parent = this, position = { 0, 0 } };
   FileDialog fileDialog
   {
      master = this, type = selectDir,
      text = $"Select a new location"
   };
   Button browse
   {
      master = this, autoCreate = false, inactive = true, text = "...";

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         DataRow row = componentsBox.currentRow;
         Component * component = ((CheckItem *)row.GetData(componentField))->data;
         component->GetFullPath(fileDialog.filePath, false);
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
      fullRowSelect = false, collapseControl = true, treeBranches = true, rootCollapseButton = true,
      noDragging = true;
      rowHeight = 18;
      selectionColor = { 145, 150, 140 };

      alwaysEdit = true;
      opacity = 0;

      bool NotifyKeyDown(ListBox listBox, DataRow row, Key key, unichar ch)
      {
         if(key == f2 && browse.visible)
            browse.NotifyClicked(this, browse, 0, 0, 0);
         return true;
      }

      bool NotifyChanged(ListBox listBox, DataRow row)
      {
         Component * component = ((CheckItem *)listBox.GetData(componentField))->data;
         char path[MAX_LOCATION], relative[MAX_LOCATION] = "", * newPath;
         char fullPath[MAX_LOCATION];

         component->parent->GetFullPath(path, false);
         strcpy(fullPath, path);

         newPath = row.GetData(locationField);
         if(newPath)
         {
            PathCat(fullPath, newPath);
            if(IsPathInsideOf(fullPath, path))
               MakePathRelative(fullPath, path, relative);
            else
               strcpy(relative, fullPath);
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
         Window e;
         browse.parent = listBox;
         browse.position = { componentField.width + locationField.width + 18, (listBox.currentIndex+1) * listBox.rowHeight - 2 };
         browse.size = { 30, listBox.rowHeight + 3 };
         for(e = listBox.firstChild; e; e = e.next)
         {
            if(e._class == class(DataBox))
               break;
         }
         if(e)
            e.Activate();
         browse.Create();
         return true;
      }

      void NotifyChecked(CheckListBox listBox, DataRow row)
      {
         Component * component = ((CheckItem *)row.GetData(componentField))->data;
         int c;
         component->selected = listBox.IsChecked(row);

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
   Label agreementLbl { parent = this, text = $"By installing the Ecere SDK, you agree to the                                         .", font = { "Tahoma", 8.25f }, anchor = Anchor { left = 24, top = 444 } };
   Button licenseButton
   {
      this, inactive = true, offset = false, bevel = false, foreground = blue, font = { "Tahoma", 8.25f, underline = true, bold = true },
      // text = $"terms and conditions", anchor = Anchor { left = 241, top = 421 };
      text = $"terms and conditions", anchor = Anchor { left = 237, top = 441 };
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
      this, size = { 460, 114 }, position = { 160, 284 };
      fullRowSelect = false, collapseControl = true, treeBranches = true, rootCollapseButton = true,
      noDragging = true;
      rowHeight = 18;
      opacity = 0;

      void NotifyChecked(CheckListBox listBox, DataRow row)
      {
         CheckItem * item = row.GetData(optionField);
         InstallOption * option = item->data;
         option->selected = listBox.IsChecked(row);
         // Update default samples/extras path whether we're installing for All Users or not
         if(option == &options[0])
         {
            char appData[MAX_LOCATION];

            options[5].name = options[0].selected ? $"Add binaries location to the system environment paths" : $"Add binaries location to the user environment paths";
            if(options[5].row)
               ((CheckItem *)options[5].row.GetData(optionField))->name = options[5].name;

            pathOptions[PathOptions::AddECEREPaths].name = options[0].selected ? $"Add Ecere binaries location to the system environment path" : $"Add Ecere binaries location to the user environment path";
            if(pathOptions[PathOptions::AddECEREPaths].row)
               ((CheckItem *)pathOptions[PathOptions::AddECEREPaths].row.GetData(optionField))->name = pathOptions[PathOptions::AddECEREPaths].name;

            pathOptions[PathOptions::AddMinGWPaths].name = options[0].selected ? $"Add TDM-GCC/MinGW-w64 to the system environment path" : $"Add TDM-GCC/MinGW-w64 to the user environment path";
            if(pathOptions[PathOptions::AddMinGWPaths].row)
               ((CheckItem *)pathOptions[PathOptions::AddMinGWPaths].row.GetData(optionField))->name = pathOptions[PathOptions::AddMinGWPaths].name;

            GetEnvironment(options[0].selected ? "ALLUSERSPROFILE" : "APPDATA", appData, sizeof(appData));
            if(appData && appData[0])
            {
               char defPath[MAX_LOCATION];

               char * s = components[ComponentID::samples].installPath;
               strcpy(defPath, installDir);
               PathCat(defPath, components[ComponentID::samples].defInstallPath);
               ChangeCh(defPath, '/', DIR_SEP);
               if(!strcmp(defPath, components[ComponentID::samples].installPath))
               {
                  static char defSamplesPath[MAX_LOCATION];
                  strcpy(defSamplesPath, appData);
                  PathCat(defSamplesPath, "Ecere SDK\\Samples");
                  components[ComponentID::samples].defInstallPath = defSamplesPath;

                  strcpy(components[ComponentID::samples].installPath, components[ComponentID::samples].defInstallPath);
                  ChangeCh(components[ComponentID::samples].installPath, '/', DIR_SEP);
                  components[ComponentID::samples].row.SetData(locationField, components[ComponentID::samples].installPath);
               }

               strcpy(defPath, installDir);
               PathCat(defPath, additional[AdditionalID::extras].defInstallPath);
               ChangeCh(defPath, '/', DIR_SEP);
               if(!strcmp(additional[AdditionalID::extras].installPath, additional[AdditionalID::extras].installPath))
               {
                  static char defExtrasPath[MAX_LOCATION];
                  strcpy(defExtrasPath, appData);
                  PathCat(defExtrasPath, "Ecere SDK\\extras");
                  additional[AdditionalID::extras].defInstallPath = defExtrasPath;

                  strcpy(additional[AdditionalID::extras].installPath, additional[AdditionalID::extras].defInstallPath);
                  ChangeCh(additional[AdditionalID::extras].installPath, '/', DIR_SEP);
                  additional[AdditionalID::extras].row.SetData(locationField, additional[AdditionalID::extras].installPath);
               }
            }
         }
      }
   };
   Button install
   {
      parent = this, text = $"Install", isDefault = true, size = { 75, 23 }, position = { 432, 436 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         installProgress.Create();
         Destroy(0);
         // installProgress.thread.Main();
         installProgress.thread.Create();
         return true;
      }
   };
   Button button3 { parent = this, text = $"Cancel", hotKey = altX, size = Size { 75, 23 }, anchor = Anchor { left = 544, top = 436 }, NotifyClicked = ButtonCloseDialog };
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
      contents = $"Choose in which folder to install the Ecere SDK, which features\n"
         "of the SDK to install, as well as where to install program icons."
   };
   Label label2 { parent = this, text = buildString, position = { 16, 412 }, font = { "Tahoma", 10, true }, disabled = true, opacity = 0, background = activeBorder };
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
   DataField componentField { "CheckItem", width = 160, header = $"Component" };
   DataField locationField { "char *", width = 108, header = $"Destination Folder", editable = true };
   DataField reqField { "FileSize", width = 70, header = $"Req. Space", alignment = right };
   DataField avField { "FileSize64", width = 70, header = $"Avail. Space", alignment = right };
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
      DataRow row = (parent != null) ? parent.row.AddRow() : componentsBox.AddRow();
      FileSize size = 0;
      FileSize64 avSize = 0;
      char path[MAX_LOCATION];

      component.row = row;
      strcpy(path, parentPath);
      if(component.defInstallPath)
         PathCat(path, component.defInstallPath);
      component.parent = parent;

      row.SetData(null, CheckItem { component.name, component, (component.arch == bits32 && osIS64bit) } );

      if(component.defInstallPath)
      {
         strcpy(component.installPath, component.defInstallPath);
         ChangeCh(component.installPath, '/', DIR_SEP);
         row.SetData(locationField, component.installPath);
      }

      if(component.mandatory)
      {
         if(component.arch != bits32 || !osIS64bit) // || component == &coreSDK[gdb32])
            componentsBox.SetDisabled(row, true);
         /*else
            component.selected = false;*/
      }
      else if(component.arch == bits32 && osIS64bit)
         ; //component.selected = false;

      componentsBox.SetCheck(row, component.selected);

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
            Component * sub = &component.subComponents[c];
            if(sub->available && (osIS64bit || sub->arch == bits32 || sub->arch == none))
            {
               AddComponent(sub, component, path);
               size += sub->requiredSize;
            }
            else
               sub->selected = false;
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
      DataRow row = option.row = (parent != null) ? parent.row.AddRow() : optionsBox.AddRow();
      row.SetData(null, CheckItem { option.name, option } );
      optionsBox.SetCheck(row, option.selected);
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
      char appData[MAX_LOCATION];
      char homeDrive[MAX_LOCATION];
      char winDir[MAX_LOCATION];
      char * x86 = null;

      bool isAdministrator = IsAdministrator();

      if(!isAdministrator)
      {
         options[0].available = false;
         options[0].selected = false;
      }

      GetEnvironment("HOMEDRIVE", homeDrive, sizeof(homeDrive));
      GetEnvironment("windir", winDir, sizeof(winDir));

      GetEnvironment(options[0].selected ? "ALLUSERSPROFILE" : "APPDATA", appData, sizeof(appData));

      componentsBox.AddField(componentField);
      componentsBox.AddField(locationField);
      componentsBox.AddField(reqField);
      componentsBox.AddField(avField);

      optionsBox.AddField(optionField);

      programFilesDir[0] = 0;
      if(GetEnvironment("ProgramFiles", programFilesDir, MAX_LOCATION))
      {
         x86 = strstr(programFilesDir, " (x86)");
         if(x86)
            osIS64bit = true;
      }

      if(isAdministrator && programFilesDir[0])
      {
         if(x86)
         {
            strcpy(installDir32, programFilesDir);
            PathCat(installDir32, "Ecere SDK");
            *x86 = 0;
            strcpy(installDir, programFilesDir);
            PathCat(installDir, "Ecere SDK");
         }
         else
         {
            strcpy(installDir, programFilesDir);
            PathCat(installDir, "Ecere SDK");
            strcpy(installDir32, installDir);
         }
      }
      else if(homeDrive && homeDrive[0])
      {
         strcpy(installDir, homeDrive);
         PathCat(installDir, "Ecere SDK");
         strcpy(installDir32, installDir);
         strcat(installDir32, " (32)");
      }
      else if(winDir && winDir[0])
      {
         strcpy(installDir, winDir);
         PathCat(installDir, "..\\Ecere SDK");
         strcpy(installDir32, installDir);
         strcat(installDir32, " (32)");
      }
      else
      {
         strcpy(installDir, "C:\\Ecere SDK");
         strcpy(installDir32, installDir);
         strcat(installDir32, " (32)");
      }

      if(appData && appData[0])
      {
         static char defSamplesPath[MAX_LOCATION];
         static char defExtrasPath[MAX_LOCATION];
         strcpy(defSamplesPath, appData);
         PathCat(defSamplesPath, "Ecere SDK\\Samples");
         components[ComponentID::samples].defInstallPath = defSamplesPath;

         strcpy(defExtrasPath, appData);
         PathCat(defExtrasPath, "Ecere SDK\\extras");
         additional[AdditionalID::extras].defInstallPath = defExtrasPath;
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
      {
         if(options[c].available)
            AddOption(options[c], null);
      }
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
      surface.HLine(label2.position.x + tw + 6, 620, 420);
      surface.SetForeground(white);
      surface.HLine(label2.position.x + tw + 6, 621, 421);
      surface.PutPixel(621, 400);
   }

   Label label3
   {
      parent = this, opacity = 0, borderStyle = deep, size = Size { 644, 93 }, anchor = Anchor { left = -8, top = -8 };
   };
}

class InstallProgress : Window
{
   text = $"Ecere Software Development Kit Setup - v0.44.10 \"Ryōan-ji\" 64 Bit Edition";
   background = activeBorder;
   borderStyle = fixed;
   hasMinimize = true;
   hasClose = true;
   tabCycle = true;
   // size = Size { 640, 480 };
   clientSize = { 636, 476 };
   //clientSize = { 796, 576 };
   icon = { ":icon.png" };

   Picture back { image = BitmapResource { ":ryoanji-progress.png" }, parent = this, position = { 0, 0 } };
   Label installing { this, position = { 32, 160 } };
   ProgressBar progressBar { parent = this, size = Size { 588, 24 }, anchor = Anchor { left = 24, top = 184 } };
   Button finish
   {
      parent = this, text = $"Install", disabled = true, isDefault = true, size = Size { 75, 23 }, anchor = Anchor { left = 432, top = 436 };

      NotifyClicked = ButtonCloseDialog
   };
   Button cancel
   {
      this, text = $"Cancel", hotKey = altX, size = Size { 75, 23 }, anchor = Anchor { left = 544, top = 436 };

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
   Label label2 { parent = this, text = buildString, position = { 16, 412 }, font = { "Tahoma", 10, true }, disabled = true, opacity = 0, background = activeBorder };
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
   Label title { parent = label3, text = $"Installing the Ecere SDK", font = FontResource { "Tahoma", 8.25f, bold = true }, size = Size { 326, 16 }, anchor = Anchor { horz = 91, vert = -12 } };

   void OnDrawOverChildren(Surface surface)
   {
      int tw = label2.size.w;
      surface.SetForeground(Color { 128, 128, 128 });
      surface.HLine(label2.position.x + tw + 6, 620, 420);
      surface.SetForeground(white);
      surface.HLine(label2.position.x + tw + 6, 621, 421);
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

static void AddPath(char * sysPaths[200], int sysCount, char * paths[200], int * count, char * oldPath, char * userPath, char * path)
{
   int p;
   bool found = false;
   for(p = 0; p<sysCount; p++)
      if(!fstrcmp(sysPaths[p], path))
      {
         found = true;
         break;
      }
   for(p = 0; !found && p<*count; p++)
      if(!fstrcmp(paths[p], path))
      {
         found = true;
         break;
      }
   if(!found)
   {
      char * start;
      if(*count)
      {
         strcat(userPath, ";");
         start = paths[(*count)-1] + strlen(paths[(*count)-1])+1;
      }
      else
         start = oldPath;

      strcpy(start, path);
      *(start + strlen(path)) = '\0';
      paths[(*count)++] = start;

      strcat(userPath, path);
   }
}


void ModifyPath(char * systemPath, char * userPath)
{
   char oldPath[8192], * paths[200], * sysPaths[200];
   int count, sysCount = 0;

   if(userPath)
   {
      strcpy(oldPath, userPath);
      count = TokenizeWith(oldPath, sizeof(paths) / sizeof(char *), paths, ";", false);
      sysCount = TokenizeWith(systemPath, sizeof(sysPaths) / sizeof(char *), sysPaths, ";", false);
   }
   else
   {
      strcpy(oldPath, systemPath);
      count = TokenizeWith(oldPath, sizeof(paths) / sizeof(char *), paths, ";", false);
   }

   {
      CoreSDKID c;
      for(c = 0; coreSDK[c].name; c++)
      {
         bool found = false;
         char path[MAX_LOCATION];
         if(!coreSDK[c].selected) continue;
         coreSDK[c].GetFullPath(path, false);
         if(c != ide && c != runtime && c != ec &&
            c != ide32 && c != runtime32 && c != ec32)
         {
            if(!pathOptions[PathOptions::AddMinGWPaths].available || !pathOptions[PathOptions::AddMinGWPaths].selected)
               continue;
            PathCat(path, "bin");
         }
         else if(!pathOptions[PathOptions::AddECEREPaths].selected) continue;

         AddPath(sysPaths, sysCount, paths, &count, oldPath, userPath ? userPath : systemPath, path);
      }
   }
   {
      AdditionalID c;
      // Up to C++
      for(c = 0; c <= cpp; c++)
      {
         bool found = false;
         char path[MAX_LOCATION];
         if(!additional[c].selected || c == vanilla || c == vanilla32 || c == extras) continue;
         if((c != eda && c != eda32 && c != upx) && (!pathOptions[PathOptions::AddMinGWPaths].available || !pathOptions[PathOptions::AddMinGWPaths].selected))
            continue;
         additional[c].GetFullPath(path, false);
         if(c != eda && c != eda32 && c != upx)
            PathCat(path, "bin");
         AddPath(sysPaths, sysCount, paths, &count, oldPath, userPath ? userPath : systemPath, path);
      }
   }
}

void AssociateExtension(char * extension, char * description, char *name, char * action, char * path)
{
   HKEY key;
   uint status, size;
   char keyName[1024];

   RegCreateKeyEx(HKEY_CLASSES_ROOT, extension, 0, "", REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, null, &key, &status);
   RegSetValueEx(key, null, 0, REG_SZ, name, (uint)strlen(name)+1);
   RegCloseKey(key);

   RegCreateKeyEx(HKEY_CLASSES_ROOT, name, 0, "", REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, null, &key, &status);
   RegSetValueEx(key, null, 0, REG_SZ, description, (uint)strlen(description)+1);
   RegCloseKey(key);

   sprintf(keyName, "%s\\shell", extension);
   RegCreateKeyEx(HKEY_CLASSES_ROOT, keyName, 0, "", REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, null, &key, &status);
   RegSetValueEx(key, null, 0, REG_SZ, action, (uint)strlen(action)+1);
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
      RegSetValueExW(key, null, 0, REG_SZ, (byte *)wKeyName, (uint)(wcslen(wKeyName) + 1)*sizeof(uint16));
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

      if(!osIS64bit)
         strcpy(installDir32, installDir);

      for(c = 0; components[c].name && !abortInstall; c++)
         components[c].Install(installDir, installDir32);
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
         char idePath[MAX_LOCATION];
         char userProfile[MAX_LOCATION];

         // Configure IDE
         IDESettings settings = null; // Don't instantiate yet so we can pick up old settings

         IDESettingsContainer settingsContainer
         {
            driver = "JSON";
            dataOwner = &settings;
            dataClass = class(IDESettings);
            allUsers = options[0].selected;
         };
         CompilerConfig compiler;
         installProgress.installing.text = $"Configuring Ecere IDE...";
         ((GuiApplication)__thisModule).Unlock();
         ((GuiApplication)__thisModule).SignalEvent();

         settingsContainer.Load();
         compiler = settings.GetCompilerConfig(defaultCompilerName);
         if(compiler)
         {
            {
               CoreSDKID c;
               for(c = 0; coreSDK[c].name; c++)
               {
                  char path[MAX_LOCATION];
                  if(!coreSDK[c].selected || !coreSDK[c].available) continue;

                  coreSDK[c].GetFullPath(path, false);
                  if(c != ide && c != runtime && c != ec &&
                     c != ide32 && c != runtime32 && c != ec32)
                     PathCat(path, "bin");
                  MakeSlashPath(path);
                  if((c == ide && osIS64bit) || (c == ide32 && !osIS64bit))
                  {
                     coreSDK[c].GetFullPath(idePath, false);
                     PathCat(idePath, "ide.exe");
                  }

                  if(c == runtime || c == runtime32)
                  {
                     if(!compiler.libraryDirs.Find(path))
                        compiler.libraryDirs.Add(CopyString(path));
                  }
               }
            }
            {
               AdditionalID c;
               // Up to C++
               for(c = 0; c <= cpp; c++)
               {
                  char path[MAX_LOCATION];
                  if(c == extras || !additional[c].selected || !additional[c].available) continue;
                  additional[c].GetFullPath(path, false);
                  if(c != upx && c != eda && c != vanilla && c != eda32 && c != vanilla32)
                     PathCat(path, "bin");
                  MakeSlashPath(path);
                  if(c == vanilla || c == vanilla32)
                  {
                     if(!compiler.libraryDirs.Find(path))
                        compiler.libraryDirs.Add(CopyString(path));
                  }
                  else
                  {
                     if(!compiler.executableDirs.Find(path))
                        compiler.executableDirs.Add(CopyString(path));
                  }
               }
            }
         }

         {
            char path[MAX_LOCATION] = "";

            if(components[ComponentID::samples].selected)
               components[ComponentID::samples].GetFullPath(path, false);
            // IDE will now default to HOME for the default project/files locations

            if(!settings.ideProjectFileDialogLocation[0])
               settings.ideProjectFileDialogLocation = path;
            if(!settings.ideFileDialogLocation[0])
               settings.ideFileDialogLocation = path;

            if(documentation[DocumentationID::apiRef].selected)
            {
               documentation[DocumentationID::apiRef].GetFullPath(path, false);
               if(!settings.docDir[0])
                  settings.docDir = path;
            }
         }

         settingsContainer.Save();
         delete settingsContainer;
         delete settings;

         // Set up Uninstaller
         ((GuiApplication)__thisModule).Lock();
         installProgress.installing.text = $"Registering uninstaller...";
         ((GuiApplication)__thisModule).Unlock();
         ((GuiApplication)__thisModule).SignalEvent();

         {
            HKEY key;
            uint status, size;
            char * displayName = "Ecere SDK 0.44";
            char uninstaller[MAX_LOCATION];
            bool nomodify = true;

            strcpy(uninstaller, installDir);
            PathCat(uninstaller, "uninstall_ecere.exe");

            RegCreateKeyEx(HKEY_LOCAL_MACHINE, "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Ecere SDK", 0, "", REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, null, &key, &status);

            RegSetValueEx(key, "DisplayName", 0, REG_SZ, displayName, (uint)strlen(displayName)+1);
            RegSetValueEx(key, "UninstallString", 0, REG_SZ, uninstaller, (uint)strlen(uninstaller)+1);
            RegSetValueEx(key, "DisplayIcon", 0, REG_SZ, idePath, (uint)strlen(idePath)+1);
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
            HKEY userKey = null, systemKey = null;
            uint status, size;
            char userPath[8192] = "";
            char systemPath[8192] = "";
            uint16 wUserPath[8192];
            uint16 wSystemPath[8192];

            wUserPath[0] = 0;
            wSystemPath[0] = 0;

            ((GuiApplication)__thisModule).Lock();
            installProgress.installing.text = "Registering paths...";
            ((GuiApplication)__thisModule).Unlock();
            ((GuiApplication)__thisModule).SignalEvent();

            if(options[0].selected)
            {
               if(RegOpenKeyEx(HKEY_LOCAL_MACHINE, "SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Environment", 0, KEY_ALL_ACCESS, &systemKey) == ERROR_SUCCESS)
               {
                  size = sizeof(wSystemPath);
                  RegQueryValueExW(systemKey, L"path", null, null, (byte *)wSystemPath, &size);
                  UTF16toUTF8Buffer(wSystemPath, systemPath, sizeof(systemPath));
                  ModifyPath(systemPath, null);

                  UTF8toUTF16Buffer(systemPath, wSystemPath, sizeof(wSystemPath) / sizeof(uint16));
                  RegSetValueExW(systemKey, L"path", 0, REG_EXPAND_SZ, (byte *)wSystemPath, (uint)(wcslen(wSystemPath)+1) * 2);
                  RegCloseKey(systemKey);
               }
            }
            else
            {
               if(RegOpenKeyEx(HKEY_LOCAL_MACHINE, "SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Environment", 0, KEY_QUERY_VALUE, &systemKey) == ERROR_SUCCESS)
               {
                  size = sizeof(wSystemPath);
                  RegQueryValueExW(systemKey, L"path", null, null, (byte *)wSystemPath, &size);
                  UTF16toUTF8Buffer(wSystemPath, systemPath, sizeof(systemPath));
                  RegCloseKey(systemKey);
               }

               RegCreateKeyEx(HKEY_CURRENT_USER, "Environment", 0, "", REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, null, &userKey, &status);
               if(status == REG_OPENED_EXISTING_KEY)
               {
                  size = sizeof(wUserPath);
                  RegQueryValueExW(userKey, L"path", null, null, (byte *)wUserPath, &size);
                  UTF16toUTF8Buffer(wUserPath, userPath, sizeof(userPath));
               }
               ModifyPath(systemPath, userPath);
               UTF8toUTF16Buffer(userPath, wUserPath, sizeof(wUserPath) / sizeof(uint16));
               RegSetValueExW(userKey, L"path", 0, REG_EXPAND_SZ, (byte *)wUserPath, (uint)(wcslen(wUserPath)+1) * 2);
               RegCloseKey(userKey);
            }
            SendMessageTimeout (HWND_BROADCAST, WM_SETTINGCHANGE, 0, (LPARAM)"Environment", SMTO_NORMAL, 1000, NULL);
         }

         // Install Program Group Icons
         GetEnvironment(options[0].selected ? "ALLUSERSPROFILE" : "USERPROFILE", userProfile, sizeof(userProfile));

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

            if(RegOpenKeyEx(options[0].selected ? HKEY_LOCAL_MACHINE : HKEY_CURRENT_USER,
               "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders", 0, KEY_QUERY_VALUE, &key) == ERROR_SUCCESS)
            {
               uint16 wStartMenuPath[2048];
               uint size = sizeof(wStartMenuPath);
               // RegQueryValueEx(key, "Start Menu", null, null, startMenuPath, &size);
               RegQueryValueExW(key, options[0].selected ? L"Common Programs" : L"Programs", null, null, (byte *)wStartMenuPath, &size);
               UTF16toUTF8Buffer(wStartMenuPath, startMenuPath, sizeof(startMenuPath));
               RegCloseKey(key);
            }
            if(!startMenuPath[0] && userProfile[0])
            {
               strcpy(startMenuPath, userProfile);
               PathCat(startMenuPath, "Start Menu\\Programs");
            }

            if(startMenuPath[0])
            {
               strcpy(destPath, startMenuPath);
               PathCat(destPath, "Ecere SDK");
               MakeDir(destPath);

               strcpy(destPath, startMenuPath);
               PathCat(destPath, "Ecere SDK\\Ecere IDE.lnk");
               CreateLink(idePath, destPath, null); //"Ecere IDE");
               if(components[ComponentID::samples].selected)
               {
                  char samplesPath[MAX_LOCATION] = "";
                  components[ComponentID::samples].GetFullPath(samplesPath, false);

                  strcpy(destPath, startMenuPath);
                  PathCat(destPath, "Ecere SDK\\Sample Projects.lnk");
                  CreateLink(samplesPath, destPath, null);//"Sample Projects");
               }
               if(components[ComponentID::documentation].selected && documentation[DocumentationID::ecereBook].selected)
               {
                  char docPath[MAX_LOCATION] = "";
                  documentation[DocumentationID::ecereBook].GetFullPath(docPath, false);
                  PathCat(docPath, "Ecere Tao of Programming [work in progress].pdf");

                  {
                     char tao[MAX_LOCATION] ;
                     documentation[DocumentationID::ecereBook].GetFullPath(tao, false);
                     PathCat(tao, "tao.pdf");
                     RenameFile(tao, docPath);
                  }

                  strcpy(destPath, startMenuPath);
                  PathCat(destPath, "Ecere SDK\\The Ecere Tao of Programming.lnk");
                  CreateLink(docPath, destPath, null);
               }
            }
         }

         // Install Desktop Icon
         if(options[IconOptions::DesktopIcon].selected)
         {
            HKEY key;
            char desktopPath[MAX_LOCATION];

            if(RegOpenKeyEx(options[0].selected ? HKEY_LOCAL_MACHINE : HKEY_CURRENT_USER,
               "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders", 0, KEY_QUERY_VALUE, &key) == ERROR_SUCCESS)
            {
               uint16 wDesktopPath[MAX_LOCATION];
               uint size = sizeof(wDesktopPath);
               RegQueryValueExW(key, options[0].selected ? L"Common Desktop" : L"Desktop", null, null, (byte *)wDesktopPath, &size);
               UTF16toUTF8Buffer(wDesktopPath, desktopPath, sizeof(desktopPath));
               RegCloseKey(key);
            }
            if(!desktopPath[0] && userProfile[0])
            {
               strcpy(desktopPath, userProfile);
               PathCat(desktopPath, "Desktop");
            }

            if(desktopPath[0])
            {
               PathCat(desktopPath, "Ecere IDE.lnk");

               ((GuiApplication)__thisModule).Lock();
               installProgress.installing.text = $"Installing Desktop Icon...";
               ((GuiApplication)__thisModule).Unlock();
               ((GuiApplication)__thisModule).SignalEvent();

               CreateLink(idePath, desktopPath, null);//"Ecere IDE");
            }
         }

         // Install QuickLaunch Icon
         if(options[IconOptions::QuickLaunchIcon].selected)
         {
            char appData[MAX_LOCATION];
            GetEnvironment("APPDATA", appData, sizeof(appData));
            if(appData[0])
            {
               char destPath[MAX_LOCATION];

               if(appData[0] && options[0].selected)
               {
                  char dir[MAX_FILENAME];
                  GetLastDirectory(appData, dir);
                  if(!strcmpi(dir, "Roaming"))
                     PathCat(appData, "../../../Default/AppData/Roaming");
                  else
                     PathCat(appData, "../Default");
               }

               ((GuiApplication)__thisModule).Lock();
               installProgress.installing.text = $"Installing Quicklaunch Icon...";
               ((GuiApplication)__thisModule).Unlock();
               ((GuiApplication)__thisModule).SignalEvent();

               strcpy(destPath, appData);
               PathCat(destPath, "Microsoft\\Internet Explorer\\Quick Launch\\Ecere IDE.lnk");
               CreateLink(idePath, destPath, null);

               // Set it up on the dock for Windows 7 -- not working
               /*
               StripLastDirectory(destPath, destPath);
               PathCat(destPath, "User Pinned\\TaskBar");
               MakeDir(destPath);
               PathCat(destPath, "Ecere IDE.lnk");
               CreateLink(idePath, destPath, null);
               */
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
               AssociateExtension(".epj", "Ecere IDE Project", "epj_file", "Open", idePath);
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
