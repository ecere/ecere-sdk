#ifdef BUILDING_ECERE_COM
namespace gui::controls;
import "Window"
import "Array"
#else
#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif
#endif

import "PathBox"

FileDialog browseFileDialog { type = selectDir, text = "Select directory" };

public class DirectoriesBox : CommonControl
{
public:

   bool browsing;

   opacity = 0;

   virtual bool OnChangedDir(char ** directory)
   {
      return true;
   }
   virtual bool OnPrepareBrowseDir(char ** directory)
   {
      return true;
   }
   virtual bool OnBrowsedDir(char ** directory)
   {
      return true;
   }

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

   // TOCHECK: Is this not working?! :S
   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
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
         //browseDir.Destroy(0);
         return true;
      }

      /*
      bool NotifyEdited(ListBox listBox, DataRow row)
      {
         browseDir.anchor = Anchor { right = 0, top = listBox.currentIndex * listBox.rowHeight - 2 };
         browseDir.size = { 30, listBox.rowHeight + 3 };

         browseDir.Create();
         return true;
      }*/

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
   /*
   Button browseDir
   {
      master = this, parent = list, autoCreate = false, inactive = true, hotKey = f2, text = "...";
     
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         DataRow row;
         char * directory;
         
         list.StopEditing(true);
         
         row = list.currentRow;
         directory = CopyString(row.string ? row.string : "");
         if(OnPrepareBrowseDir(&directory))
         {
            browseFileDialog.filePath = directory;
            StripLastDirectory(directory, directory);
            browseFileDialog.currentDirectory = directory;
            //browseFileDialog.master = rootWindow;
            browsing = true;
            if(browseFileDialog.Modal())
            {
               char * newDir = CopyString(browseFileDialog.filePath);
               if(OnBrowsedDir(&newDir))
               {
                  row.string = newDir;
                  if(list.lastRow.string && list.lastRow.string[0])
                  {
                     list.AddString("");
                     list.currentRow = list.lastRow;
                  }
                  list.modifiedDocument = true;
               }
               delete newDir;
            }
            browsing = false;
         }
         delete directory;
         return true;
      }
   };*/

   DirectoriesBox()
   {
      list.AddField(dirField);
      list.AddString("");
      list.modifiedDocument = false;
   }
}
