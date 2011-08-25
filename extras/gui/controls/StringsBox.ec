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

public class NamedString : struct
{
public:
   property String name { set { delete name; name = CopyString(value); } get { return name; } }
   property String string { set { delete string; string = CopyString(value); } get { return string; } }
private:
   String name;
   String string;

   ~NamedString()
   {
      delete name;
      delete string;
   }
}

public class StringsBox : CommonControl
{
   opacity = 0;

   watch(foreground) { list.foreground = foreground; };
   watch(background) { list.background = background; };

public:
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
               list.AddString(s);
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

   virtual bool Window::NotifyModified(StringsBox dirsBox);

   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
      if(!active)
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
         //list.modifiedDocument = true;
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
            //list.modifiedDocument = true;
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
                  //list.modifiedDocument = true;
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
               current.Move(row);
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
         char * string = listBox.GetData(null);
         if(string && string[0])
         {
            if(listBox.currentRow == listBox.lastRow)
            {
               DataRow r = listBox.lastRow;
               char * s = r.string;
               listBox.currentRow = listBox.AddString("");
            }
         }
         else if(listBox.currentRow != listBox.lastRow)
            listBox.DeleteRow(null);
         //listBox.modifiedDocument = true;
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
   DataField stringField { dataType = class(char *), editable = true };
   StringsBox()
   {
      list.AddField(stringField);
      list.AddString("");
      list.modifiedDocument = false;
   }
}

class NamedStringsBox : CommonControl
{
   opacity = 0;

   watch(foreground) { list.foreground = foreground; };
   watch(background) { list.background = background; };

   property Array<NamedString> namedStrings
   {
      set
      {
         DataRow row;
         list.Clear();
         if(value)
         {
            for(s : value)
            {
               char temp[MAX_LOCATION];
               row = list.AddRow();
               row.SetData(nameField, s.name);
               row.SetData(stringField, s.string);
            }
         }
         row = list.AddRow();
         //row.SetData(nameField, null);
         //row.SetData(stringField, null);
         list.currentRow = list.firstRow;
         list.modifiedDocument = false;
      }
      get
      {
         Array<NamedString> array { };
         DataRow row;
         for(row = list.firstRow; row; row = row.next)
         {
            // NamedString is a class:struct, need to instantiate!!
            String name = row.GetData(nameField);
            String string = row.GetData(stringField);
            if(name && name[0] && string && string[0])
               array.Add({ name, string });
         }
         return array;
      }
   }

   virtual bool Window::NotifyModified(NamedStringsBox stringsBox);

   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
      if(!active)
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
            list.DeleteRow(null);
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
               current.Move(row);
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
         String name = row.GetData(nameField);
         String string = row.GetData(stringField);
         if((name && name[0]) || (string && string[0]))
         {
            if(listBox.currentRow == listBox.lastRow)
            {
               DataRow r = listBox.lastRow;
               char * s = r.string;
               listBox.currentRow = list.AddRow();
               //row.SetData(nameField, null);
               //row.SetData(stringField, null);
            }
         }
         else if(listBox.currentRow != listBox.lastRow)
            listBox.DeleteRow(null);
         listBox.modifiedDocument = true;
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
   DataField nameField { dataType = class(char *), editable = true, freeData = false, width = 120 };
   DataField stringField { dataType = class(char *), editable = true, freeData = false };
   
   NamedStringsBox()
   {
      //DataRow row;
      list.AddField(nameField);
      list.AddField(stringField);
      /*row = */list.AddRow();
      //row.SetData(nameField, null);
      //row.SetData(stringField, null);
      list.modifiedDocument = false;
   }
}
