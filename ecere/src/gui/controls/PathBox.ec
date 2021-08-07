namespace gui::controls;
import "Window"
import "Array"

default extern int __ecereVMethodID_class_OnGetDataFromString;
default __attribute__((unused)) static void _workAround()
{
   int a = 0;
   a.OnGetDataFromString(0);
}


/* We need a dynamic cast :) Easy eC compiler introduction contribution! :)
static define pathBoxDataBox =                        dynamic_cast(pathBox.master);
static define pathBoxListBox = pathBoxEditorDataBox ? dynamic_cast((pathBoxDataBox).parent) : null;
static define pathBoxDirsBox = pathBoxEditorListBox ? dynamic_cast((pathBoxListBox).parent) : null;
*/
static Class _classDataBox() { return class(DataBox); }
static Class _classListBox() { return class(ListBox); }                              // Fix #908
static Class _classDirectoriesBox() { return class(DirectoriesBox); }
static define pathBoxDataBox =                    eClass_IsDerived(         pathBox.master._class, _classDataBox()        ) ?                 (DataBox)pathBox.master : null;
static define pathBoxListBox = (pathBoxDataBox && eClass_IsDerived((pathBoxDataBox).parent._class, _classListBox()       )) ?        (ListBox)(pathBoxDataBox).parent : null;
static define pathBoxDirsBox = (pathBoxListBox && eClass_IsDerived((pathBoxListBox).parent._class, _classDirectoriesBox())) ? (DirectoriesBox)(pathBoxListBox).parent : null;

public class FilePath : String
{
   Window OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)
   {
      PathBox pathBox
      {
         dataBox, borderStyle = 0, anchor = { 0, 0, 0, 0 },
         typeExpected = any;
         path = this;
      };
      DirectoriesBox dirsBox = pathBoxDirsBox;
      if(dirsBox)
         pathBox.browseDialog = dirsBox.browseDialog;
      // TOCHECK: compiler issues?
      /*else if(userData && eClass_IsDerived(userData._class, class(FileDialog)))
         pathBox.browseDialog = (FileDialog)userData;*/
      else
         pathBox.browseDialog = { type = open, text = $"Select a file..." };
      pathBox.Create();
      return pathBox;
   }

   bool OnSaveEdit(PathBox pathBox, void * object)
   {
      bool changed = false;
      if(pathBox.modifiedDocument)
      {
         DirectoriesBox dirsBox = pathBoxDirsBox;
         if(dirsBox)
            dirsBox.NotifyPathBoxModified(dirsBox.master, dirsBox, pathBox);
         String::OnFree();
         changed = ((bool (*)(void *, void *, const char *))(void *)_class._vTbl[__ecereVMethodID_class_OnGetDataFromString])(_class, &this, pathBox.systemPath);
      }
      return changed;
   }

   int OnCompare(DirPath b)
   {
      return fstrcmp(this, b);
   }
}

public class DirPath : FilePath
{
   Window OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)
   {
      PathBox pathBox
      {
         dataBox, borderStyle = 0, anchor = { 0, 0, 0, 0 },
         typeExpected = directory;
         path = this;
      };
      DirectoriesBox dirsBox = pathBoxDirsBox;
      if(dirsBox)
         pathBox.browseDialog = dirsBox.browseDialog;
      // TOCHECK: compiler issues? (same)
      /*else if(userData && eClass_IsDerived(userData._class, class(FileDialog)))
         pathBox.browseDialog = (FileDialog)userData;*/
      else
         pathBox.browseDialog = { type = selectDir, text = $"Select a folder..." };
      pathBox.Create();
      return pathBox;
   }

   bool OnSaveEdit(PathBox pathBox, void * object)
   {
      bool changed = false;
      if(pathBox.modifiedDocument)
      {
         DirectoriesBox dirsBox = pathBoxDirsBox;
         if(dirsBox)
            dirsBox.NotifyPathBoxModified(dirsBox.master, dirsBox, pathBox);
         String::OnFree();
         changed = ((bool (*)(void *, void *, const char *))(void *)_class._vTbl[__ecereVMethodID_class_OnGetDataFromString])(_class, &this, pathBox.systemPath);
      }
      return changed;
   }

}

public enum PathTypeExpected { none, any, directory, file };

public class PathBox : CommonControl
{
   borderStyle = deep;
   clientSize = { 64, 18 };

   watch(background)     { editBox.background = background; };
   watch(foreground)     { editBox.foreground = foreground; };
   watch(selectionColor) { editBox.selectionColor = selectionColor; };
   watch(selectionText)  { editBox.selectionText = selectionText; };
   watch(opacity)        { editBox.opacity = opacity; };

   PathTypeExpected typeExpected;
   FileDialog browseDialog;
   char path[MAX_LOCATION];

   BitmapResource file { "<:ecere>mimeTypes/file.png", transparent = true, alphaBlend = true };
   BitmapResource brokenFile { "<:ecere>mimeTypes/brokenFile.png", transparent = true, alphaBlend = true };
   BitmapResource folder { "<:ecere>places/folder.png", transparent = true, alphaBlend = true };
   BitmapResource brokenFolder { "<:ecere>places/brokenFolder.png", transparent = true, alphaBlend = true };

   Picture picture
   {
      this/*, size = { 318, 94 }*/, anchor = { left = 1, vert = 0 };
      image = brokenFolder;
      visible = false;
      opacity = 0;
      alphaBlend = true;
   };

   public property EditBox editBox { get { return editBox; } }
   EditBox editBox
   {
      this/*, size = { 290, 22 }*/, position = { 1, 1 }, anchor = { left = 1, top = 1, right = 1 };
      borderStyle = none;

      void NotifyUpdate(EditBox editBox)
      {
         CheckFileExists();
         modifiedDocument = true;
      }
      bool NotifyModified(EditBox editBox)
      {
         PathBox pathBox = this;
         DirectoriesBox dirsBox = pathBoxDirsBox;
         if(dirsBox)
            dirsBox.NotifyPathBoxModified(dirsBox.master, dirsBox, this);
         return NotifyModified(master, this);
      }

      /* F4? F4 is properties, f2 works already for this
      bool OnKeyDown(Key key, unichar ch)
      {
         if(key == f4)
            ((PathBox)parent).browse.NotifyClicked(parent, ((PathBox)parent).browse, 0, 0, (Modifiers)null);
         return EditBox::OnKeyDown(key, ch);
      }
      */
   };

   // For chaining popup-key event
   bool OnKeyHit(Key key, unichar ch)
   {
      return editBox.OnKeyHit(key, ch);
   }

   Button browse
   {
      this, size = { w = 26 }, anchor = { top = 0, right = 0, bottom = 0 };
      text = "...";
      hotKey = f2;
      visible = false;
      inactive = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(browseDialog)
         {
            char browsePath[MAX_LOCATION];
            PathBox pathBox = this;
            DataBox dataBox = pathBoxDataBox;
            ListBox listBox;
            DirectoriesBox dirsBox = pathBoxDirsBox;
            const char * ebContents = editBox.contents;
            String backFilePath = CopyString(browseDialog.filePath);
            char * baseBrowsePath = dirsBox ? dirsBox.baseBrowsePath : null;

            browsePath[0] = '\0';
            strncpy(browsePath, browseDialog.filePath, MAX_LOCATION); browsePath[MAX_LOCATION-1] = '\0';
            if(baseBrowsePath && baseBrowsePath[0] && ((ebContents && ebContents[0]) || !backFilePath || !backFilePath[0]))
               PathCat(browsePath, baseBrowsePath);
            PathCat(browsePath, ebContents);
            browseDialog.filePath = (ebContents && ebContents[0]) ? browsePath : "";
            if(pathBox.typeExpected == directory && browsePath[0] && FileExists(browsePath).isDirectory && backFilePath && backFilePath[0])
               StripLastDirectory(browsePath, browsePath);
            while(browsePath[0] && !FileExists(browsePath).isDirectory)
               StripLastDirectory(browsePath, browsePath);
            if(!browsePath[0])
            {
               char path[MAX_LOCATION];
               LocateModule(null, path);
               StripLastDirectory(path, path);
               strncpy(browsePath, path, MAX_LOCATION); browsePath[MAX_LOCATION-1] = '\0';
            }
            browseDialog.currentDirectory = browsePath;
            browseDialog.master = rootWindow;

            incref this;
            if(dirsBox) dirsBox.browsing = true;
            if(browseDialog.Modal())
            {
               PathBox pathBox = dataBox ? (PathBox)dataBox.editor : this;
               pathBox.modifiedDocument = true;
               pathBox.property::path = browseDialog.filePath;
               pathBox.NotifyModified(pathBox.master, this);
               if(dataBox)
                  dataBox.SaveData();
               else
                  pathBox.editBox.SelectAll();
               if((listBox = pathBoxListBox))
                  listBox.StopEditing(true);
            }
            else
               browseDialog.filePath = backFilePath;
            delete backFilePath;
            if(dirsBox) dirsBox.browsing = false;
            delete this;
         }
         return true;
      }
   };

   void CheckFileExists()
   {
      if(typeExpected != none)
      {
         BitmapResource icon = null;
         char path[MAX_LOCATION];
         FileAttribs exists { };
         GetSystemPathBuffer(path, editBox.contents);
         if(!(path[0] == DIR_SEP && path[1] == DIR_SEP && (!path[2] || !strchr(&path[2], DIR_SEP))))
            exists = FileExists(path);

         switch(typeExpected)
         {
            case any:
               // TODO: improvements, add drive, etc, also find a better solution/icon for expect any and file doesn't exist
               icon = exists ? exists.isFile ? file : exists.isDirectory ? folder : null : null;
               break;
            case directory:
               icon = exists && exists.isDirectory ? folder : brokenFolder;
               break;
            case file:
               icon = exists && exists.isFile ? file : brokenFile;
               break;
         }

         picture.image = icon;
      }
   }

   void OnRedraw(Surface surface)
   {
      if(!isEnabled)
      {
         surface.SetBackground(formColor);
         surface.Area(0, 0, clientSize.w, clientSize.h);
      }
      else
         Window::OnRedraw(surface);
   }

   ~PathBox()
   {
      delete browseDialog;
   }

public:
   virtual bool Window::NotifyModified(PathBox pathBox);

   property PathTypeExpected typeExpected
   {
      set
      {
         if(value != typeExpected)
         {
            if(value == none || typeExpected == none)
            {
               bool withIcon = value != none;
               picture.visible = withIcon;
               editBox.anchor.left = withIcon ? 18 : 1;
               CheckFileExists();
            }
            typeExpected = value;
            if(browseDialog && browseDialog.type == open && typeExpected == directory)
               browseDialog.type = selectDir;
         }
      }
   }

   property FileDialog browseDialog
   {
      set
      {
         delete browseDialog;
         browseDialog = value;
         if(browseDialog)
         {
            incref browseDialog;
            if(browseDialog.type == open && typeExpected == directory)
               browseDialog.type = selectDir;
            if(!strcmp(browseDialog.text, "Select a file...") && text)
            {
               char temp[1024] = "Select ";
               strcat(temp, text);
               strcat(temp, "...");
               browseDialog.text = temp;
            }
         }
         browse.visible = browseDialog ? true : false;
         editBox.anchor.right = browseDialog ? 26 : 1;
      }
      get { return browseDialog; }
   }

   void Home() { editBox.Home(); }
   void End() { editBox.End(); }

   void SelectAll() { editBox.SelectAll(); }
   void Deselect() { editBox.Deselect(); }

   property const String path
   {
      set
      {
         char path[MAX_LOCATION];
         GetSystemPathBuffer(path, value);
         editBox.contents = path;
         if(active)
            editBox.SelectAll();
         CheckFileExists();
      }
      get { return editBox.contents; }
   }
   property String slashPath  { get { return GetSlashPathBuffer (path, editBox.contents); } };
   property String systemPath { get { return GetSystemPathBuffer(path, editBox.contents); } };

   property Color selectionColor { set { editBox.selectionColor = value; } get { return editBox.selectionColor; }/* isset { return selectionColor ? true : false; }*/ };
   property Color selectionText  { set { editBox.selectionText = value; } get { return editBox.selectionText; }/* isset { return selectionText ? true : false; }*/ };
}

// DirectoriesBox
FileDialog browseFileDialog { type = selectDir, text = $"Select directory" };

public class DirectoriesBox : CommonControl
{
   FileDialog browseDialog;
   char * baseBrowsePath;

public:

   bool browsing;

   opacity = 0;

   virtual bool Window::NotifyModified(DirectoriesBox dirsBox);
   virtual bool Window::NotifyPathBoxModified(DirectoriesBox dirsBox, PathBox pathBox);

   virtual bool OnChangedDir(char ** directory);
   virtual bool OnPrepareBrowseDir(char ** directory);
   virtual bool OnBrowsedDir(char ** directory);

   watch(foreground)     { list.foreground = foreground; };
   watch(background)     { list.background = background; };
   //watch(selectionColor) { list.selectionColor = selectionColor; };
   //watch(selectionText)  { list.selectionText = selectionText; };
   watch(opacity)        { list.opacity = opacity; };

   property Array<String> strings
   {
      set
      {
         list.Clear();
         if(value)
         {
            for(s : value)
            {
               char temp[MAX_LOCATION];
               list.AddString(GetSystemPathBuffer(temp, s));
            }
         }
         list.AddString("");
         list.currentRow = list.firstRow;
         list.modifiedDocument = false;
      }
      get
      {
         Array<String> array { };
         DataRow row;
         for(row = list.firstRow; row; row = row.next)
         {
            const String string = row.string;
            if(string && string[0])
               array.Add(CopyUnixPath(string));
         }
         return array;
      }
   }

   property FileDialog browseDialog
   {
      set
      {
         delete browseDialog;
         browseDialog = value;
         if(browseDialog)
         {
            incref browseDialog;
            if(browseDialog.type == open)
               browseDialog.type = selectDir;
            if(!strcmp(browseDialog.text, "Select a file...") && text)
            {
               char temp[1024] = "Select ";
               strcat(temp, text);
               strcat(temp, "...");
               browseDialog.text = temp;
            }
         }
      }
      get { return browseDialog; }
   }

   property String baseBrowsePath
   {
      set
      {
         delete baseBrowsePath;
         if(value)
            baseBrowsePath = CopyString(value);
      }
      get { return baseBrowsePath; }
   }

   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
      // Browsing was not being set, fixed by introducing dependency to this class to PathBox
      if(!active && !browsing)
      {
         list.StopEditing(true);
         if(list.modifiedDocument)
         {
            NotifyModified(master, this);
            list.modifiedDocument = false;
            modifiedDocument = true;
         }
      }
      return true;
   }

   Button add
   {
      parent = this, bevelOver = true, inactive = true;
      position = { 265, 0 }, size = { 22, 22 };
      anchor = { top = 0, right = 77 };
      hotKey = plus, bitmap = BitmapResource { fileName = "<:ecere>actions/listAdd.png", alphaBlend = true };
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         list.StopEditing(true);
         list.lastRow.Edit(null);
         list.modifiedDocument = true;
         return true;
      }
   };
   Button remove
   {
      parent = this, bevelOver = true, inactive = true;
      position = { 290, 0 }, size = { 22, 22 };
      anchor = { top = 0, right = 54 };
      hotKey = del, bitmap = BitmapResource { fileName = "<:ecere>actions/listRemove.png", alphaBlend = true };
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         list.StopEditing(true);
         if(list.currentRow != list.lastRow)
         {
            list.DeleteRow(null);
            list.modifiedDocument = true;
         }
         return true;
      }
   };
   RepButton up
   {
      parent = this, bevelOver = true, inactive = true;
      position = { 315, 0 }, size = { 22, 22 };
      anchor = { top = 0, right = 31 };
      hotKey = ctrlUp, bitmap = BitmapResource { fileName = "<:ecere>actions/goUp.png", alphaBlend = true };
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(list.currentRow != list.lastRow)
         {
            DataRow current = list.currentRow, row;
            if(current)
            {
               row = current.previous;
               if(row)
               {
                  row = row.previous;
                  current.Move(row);
                  list.modifiedDocument = true;
               }
            }
         }
         return true;
      }
   };
   RepButton down
   {
      parent = this, bevelOver = true, inactive = true;
      position = { 340, 0 }, size = { 22, 22 };
      anchor = { top = 0, right = 8 };
      hotKey = ctrlDown, bitmap = BitmapResource { fileName = "<:ecere>actions/goDown.png", alphaBlend = true };
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         DataRow current = list.currentRow, row;
         if(current)
         {
            row = current.next;
            if(row && row != list.lastRow)
            {
               current.Move(row);
               list.modifiedDocument = true;
            }
         }
         return true;
      }
   };
   ListBox list
   {
      this, moveRows = true, hasVertScroll = true, dontHideScroll = true;
      borderStyle = deep, position = { 0, 22 }, size = { 300, 60 };
      anchor = { left = 0, top = 22, right = 0, bottom = 0 };

      bool OnRightButtonDown(int x, int y, Modifiers mods)
      {
         return parent.OnRightButtonDown(x + position.x + parent.clientStart.x, y + position.y + parent.clientStart.y, mods);
      }

      bool NotifyChanged(ListBox listBox, DataRow row)
      {
         char * directory = listBox.GetData(null);
         if(directory && directory[0])
         {
            char * dir = CopyString(directory);
            if(OnChangedDir(&dir))
            {
               // Put this back to enable making Paths relative by overriding
               // these DirectoriesBox virtual methods (from FileDialog only)
               if(browsing)
               {
                  OnPrepareBrowseDir(&dir);
                  OnBrowsedDir(&dir);
               }
               listBox.SetData(null, dir);
               listBox.modifiedDocument = true;
               if(listBox.currentRow == listBox.lastRow && listBox.lastRow.string)
                  listBox.currentRow = listBox.AddString("");
            }
            delete dir;
         }
         else if(listBox.currentRow != listBox.lastRow)
         {
            listBox.DeleteRow(null);
            listBox.modifiedDocument = true;
         }
         return true;
      }

      bool NotifyEditDone(ListBox listBox, DataRow row)
      {
         return true;
      }

      bool NotifyKeyHit(ListBox listBox, DataRow row, Key key, unichar ch)
      {
         // Prioritize row moving Ctrl-Up/Down over scrollbar scrolling
         if(key == ctrlUp || key == ctrlDown)
         {
            Button btn = (key == ctrlUp) ? up : down;
            btn.OnKeyHit(hotKey, 0);
            return false;
         }
         return true;
      }

      bool NotifyKeyDown(ListBox listBox, DataRow row, Key key, unichar ch)
      {
         // Prioritize row moving Ctrl-Up/Down over scrollbar scrolling
         if(key == ctrlUp || key == ctrlDown)
         {
            Button btn = (key == ctrlUp) ? up : down;
            btn.OnKeyDown(hotKey, 0);
            return false;
         }
         if(key == del)
         {
            listBox.StopEditing(true);
            if(listBox.currentRow != listBox.lastRow)
               listBox.DeleteRow(null);
            return false;
         }
         return true;
      }

      bool NotifyMove(ListBox listBox, DataRow row, Modifiers mods)
      {
         if(listBox.currentRow == listBox.lastRow)
            return false;
         else if(row == listBox.lastRow)
         {
            if(listBox.currentRow == row.previous)
               return false;
            listBox.currentRow.Move(row.previous);
            return false;
         }
         return true;
      }

      bool NotifyReclick(ListBox listBox, DataRow row, Modifiers mods)
      {
         row.Edit(null);
         return true;
      }
   };
   DataField dirField { dataType = class(DirPath), editable = true };

   DirectoriesBox()
   {
      incref browseFileDialog;
      browseDialog = browseFileDialog;
      list.AddField(dirField);
      list.AddString("");
      list.modifiedDocument = false;
   }
   ~DirectoriesBox()
   {
      delete browseDialog;
      delete baseBrowsePath;
   }
}
