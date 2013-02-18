namespace gui::controls;
import "Window"
import "Array"

default extern int __ecereVMethodID_class_OnGetDataFromString;
default static void _workAround()
{
   int a;
   a.OnGetDataFromString(0);
}

public class FilePath : String
{
   Window OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)
   {
      PathBox pathBox
      {
         dataBox, borderStyle = 0, anchor = { 0, 0, 0, 0 },
         typeExpected = any;
         browseDialog = userData ? (FileDialog)userData : { type = open, text = $"Select a file..." };
         path = this;
      };
      pathBox.Create();
      return pathBox;
   }

   bool OnSaveEdit(PathBox pathBox, void * object)
   {
      bool changed = false;
      if(pathBox.modifiedDocument)
      {
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
         browseDialog = userData ? (FileDialog)userData : { type = selectDir, text = $"Select a folder..." };
         path = this;
      };
      pathBox.Create();
      return pathBox;
   }
}

public enum PathTypeExpected { none, any, directory, file };

public class PathBox : CommonControl
{
   borderStyle = deep;
   clientSize = { 64, 18 };

   watch(background) { editBox.background = background; };
   watch(foreground) { editBox.foreground = foreground; };
   watch(opacity)    { editBox.opacity    = opacity; };

#if defined(__WIN32__)
   PathBox()
   {
      path[0] = '\0';
   }
#endif

   PathTypeExpected typeExpected;
   FileDialog browseDialog;
#if defined(__WIN32__)
   char path[MAX_LOCATION];
#endif

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
            /* We need a reinterpret cast :) Easy eC compiler introduction contribution! :)
            DataBox dataBox = reinterpret(master);
            ListBox lb = dataBox ? reinterpret(dataBox.parent) : null;
            DirectoriesBox dirBox = lb ? reinterpret(lb.parent) : null;
            */
            DataBox dataBox = eClass_IsDerived(master._class, class(DataBox)) ? (DataBox)master : null;
            ListBox lb = ((dataBox && eClass_IsDerived(dataBox.parent._class, class(ListBox))) ? (ListBox)dataBox.parent : null;
            DirectoriesBox dirBox = ((lb && eClass_IsDerived(lb.parent._class, class(DirectoriesBox))) ? (DirectoriesBox)lb.parent : null;
            char * browsePath = CopyString(editBox.contents);
            char fileName[MAX_LOCATION];

            incref this;

            GetLastDirectory(browsePath, fileName);
            StripLastDirectory(browsePath, browsePath);

            if(!browsePath[0])
            {
               char filePath[MAX_LOCATION];
               delete browsePath;
               LocateModule(null, filePath);
               StripLastDirectory(filePath, filePath);
               browsePath = CopyString(filePath);
            }

            while(browsePath[0] && !FileExists(browsePath).isDirectory)
            {
               char temp[MAX_LOCATION];
               GetLastDirectory(browsePath, temp);
               PathCat(temp, fileName);
               strcpy(fileName, temp);
               StripLastDirectory(browsePath, browsePath);
            }
            browseDialog.filePath = fileName;
            browseDialog.currentDirectory = browsePath;
            delete browsePath;
            browseDialog.master = rootWindow;

            // THIS PART WAS MISSING IN THE PathBox/DirectoriesBox INTEGRATION AND WAS CRUCIAL
            if(dirBox) dirBox.browsing = true;
            if(browseDialog.Modal())
            {
               PathBox pathBox = dataBox ? (PathBox)dataBox.editor : this;
               pathBox.modifiedDocument = true;
               pathBox.property::path = browseDialog.filePath;
               if(dataBox)
                  dataBox.SaveData();
               else
                  pathBox.editBox.SelectAll();
               if(lb) lb.StopEditing(true);
               pathBox.NotifyModified(pathBox.master, this);
            }
            if(dirBox) dirBox.browsing = false;

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
         FileAttribs exists = FileExists(editBox.contents);
         
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
   }

   void Home() { editBox.Home(); }
   void End() { editBox.End(); }

   void SelectAll() { editBox.SelectAll(); }
   void Deselect() { editBox.Deselect(); }

   property String path
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

   virtual bool Window::NotifyModified(PathBox pathBox);
}

// DirectoriesBox
FileDialog browseFileDialog { type = selectDir, text = $"Select directory" };

public class DirectoriesBox : CommonControl
{
public:

   bool browsing;

   opacity = 0;

   virtual bool OnChangedDir(char ** directory);
   virtual bool OnPrepareBrowseDir(char ** directory);
   virtual bool OnBrowsedDir(char ** directory);

   watch(foreground) { list.foreground = foreground; };
   watch(background) { list.background = background; };

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
            String string = row.string;
            if(string && string[0])
               array.Add(CopyUnixPath(string));
         }
         return array;
      }
   }

   virtual bool Window::NotifyModified(DirectoriesBox dirsBox);

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
   Button up
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
   Button down
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
               {
                  DataRow r = listBox.lastRow;
                  char * s = r.string;
                  listBox.currentRow = listBox.AddString("");
               }
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

      bool NotifyKeyDown(ListBox listBox, DataRow row, Key key, unichar ch)
      {
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
   DataField dirField { dataType = class(DirPath), editable = true, userData = browseFileDialog };

   DirectoriesBox()
   {
      list.AddField(dirField);
      list.AddString("");
      list.modifiedDocument = false;
   }
}
