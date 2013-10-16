import "ide"

class WatchesView : Window
{
   visible = false;
   text = $"Watches";
   borderStyle = sizable;
   background = { 224, 224, 224 };
   hasClose = true;
   anchor = Anchor { left = 0, right = 0, bottom = 0 };
   size.h = 240;

   bool moved, logging;

   ListBox listBox
   {
      parent = this, hasHeader = true, hasVertScroll = true, alwaysEdit = true, collapseControl = true, resizable = true;
      anchor = Anchor { left = 0, right = 0, top = 0, bottom = 0 };
      background = viewsBackground;
      foreground = viewsText;
      selectionColor = selectionColor, selectionText = selectionText;

      bool NotifyChanged(ListBox listBox, DataRow row)
      {
         char * expression = row.GetData(expressionField);

         if(expression && expression[0])
         {
            TrimLSpaces(expression, expression);
            TrimRSpaces(expression, expression);
         }

         if(expression && expression[0])
         {
            row.SetData(valueField, null);
            if(row == listBox.lastRow)
            {
               DataRow newRow = listBox.AddRow();
               newRow.SetData(expressionField, null);
               newRow.SetData(valueField, null);
               listBox.currentRow = newRow;
            }
            ide.debugger.ChangeWatch(row, expression);
         }
         else
         {
            ide.debugger.ChangeWatch(row, expression);
            if(row != listBox.lastRow)
            {
               //Type type = (Type)row.GetData(typeField);
               //if(type) FreeType(type);
               listBox.DeleteRow(row);
            }
            else
               row.SetData(valueField, null);
         }
         return true;
      }

      bool NotifyKeyHit(ListBox listBox, DataRow row, Key key, unichar ch)
      {
         if((SmartKey)key == del)
         {
            listBox.StopEditing(true);
            if(row && row != listBox.lastRow)
            {
               //Type type = (Type)row.GetData(typeField);
               ide.debugger.ChangeWatch(row, null);
               //if(type) FreeType(type);
               listBox.DeleteRow(null);
            }
         }
         return true;
      }

      bool NotifySelect(ListBox listBox, DataRow row, Modifiers mods)
      {
         if(listBox.currentField != expressionField)
            listBox.currentField = expressionField;
         return true;
      }
   };
   DataField expressionField { "char *", true, width = 130, header = $"Expression" };
   DataField typeField { "Type", false, width = 180, header = $"Type" };
   //DataField addressField { "char *", true, width = 80, header = $"Symbol Address" };
   DataField valueField { class(WatchMultiLineString), true, width = 330, header = $"Value", freeData = false };

   WatchesView()
   {
      listBox.AddField(expressionField);
      listBox.AddField(typeField);
      listBox.AddField(valueField);
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

   void Show()
   {
      visible = true;
      ide.RepositionWindows(false);
      Activate();
   }

   void LoadFromWorkspace()
   {
      for(wh : ide.workspace.watches)
         AddWatch(wh);
   }

   void AddWatch(Watch wh)
   {
      DataRow row = listBox.AddRowAfter(listBox.lastRow.previous);
      row.tag = (int64)wh;
      wh.row = row;
      UpdateWatch(wh);
   }

   void UpdateWatch(Watch wh)
   {
      if(wh)
      {
         DataRow row = wh.row;
         if(row && row.tag)
         {
            row.SetData(expressionField, wh.expression);
            row.SetData(typeField, wh.type);
            //row.SetData(addressField, wh.address);
            row.SetData(valueField, wh.value);
         }
      }
   }

   void Clear()
   {
      DataRow row;
      listBox.Clear();
      row = listBox.AddRow();
      row.SetData(expressionField, null);
      row.SetData(typeField, null);
      row.SetData(valueField, null);
      if(ide.workspace)
      {
         for(w : ide.workspace.watches)
            w.row = null;
      }
   }
}

class WatchMultiLineString : String
{
   Window OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)
   {
      if(this && strchr(this, '\n'))
      {
         // Don't show the editbox right away so that the text is highlighted by default
         EditBox editBox
         {
            parent = dataBox, master = obsolete, visible = false,
            borderStyle = contour,
            //interim = true,
            hasHorzScroll = true, hasVertScroll = true,
            modifyVirtualArea = false,
            anchor = { 0, 0, 0, 0 };
            //position = { x + dataBox.absPosition.x, y + dataBox.absPosition.y };
            //size = { w, h * 4 };
            multiLine = true;

            bool OnKeyDown(Key key, unichar ch)
            {
               /*if(key == escape)
               {
                  ((ListBox)master.master).currentField = ((ListBox)master.master).firstField;
                  return false;
               }*/
               return EditBox::OnKeyDown(key, ch);
            }

            bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
            {
               if(active) SelectAll(); else Deselect();
               return EditBox::OnActivate(active, previous, goOnWithActivation, direct);
            }

            void DataBox::NotifyUpdate(EditBox editBox)
            {
               Modified();

            }
         };
         dataBox.size = { w, h * 4 + 2 };
         if(dataBox.size.h + dataBox.position.y > dataBox.parent.clientSize.h)
            dataBox.position.y = dataBox.parent.clientSize.h - dataBox.size.h;
         if(dataBox.size.w + dataBox.position.x > dataBox.parent.clientSize.w)
            dataBox.position.x = dataBox.parent.clientSize.w - dataBox.size.w;

         editBox.contents = this;
         editBox.visible = true;
         editBox.Create();
         if(!dataBox.active)
         {
            editBox.Deselect();
            editBox.Home();
         }
         return editBox;
      }
      else
         return String::OnEdit(dataBox, obsolete, x, y, w,h, userData);
   }

   bool OnSaveEdit(Window window, void * object)
   {
      bool changed = false;
      EditBox editBox = (EditBox)window;
      if(editBox.modifiedDocument)
      {
      /*
         EditLine line;
         int size = 0;
         char * string;

         delete this;

         for(line = editBox.firstLine; line; line = line.next)
            size += line.count+1;
         this = string = new char[size+1];
         size = 0;
         for(line = editBox.firstLine; line; line = line.next)
         {
            memcpy(string + size, line.text, line.count);
            size += line.count;
            string[size] = '\n';
            size++;
         }
         string[size] = '\0';
*/
         changed = true;
      }
      return changed;
   }

   void OnDisplay(Surface surface, int x, int y, int width, void * fieldData, Alignment alignment, DataDisplayFlags displayFlags)
   {
      if(this)
      {
         char ch;
         char * string = this;
         char actualString[8196];
         int c, len = 0;
         for(c = 0; (ch = string[c]) && len < sizeof(actualString)-1; c++)
         {
            if(ch == '\t') { actualString[len++] = '\\'; actualString[len++] = 't'; }
            else if(ch == '\r') { actualString[len++] = '\\'; actualString[len++] = 'r'; }
            else if(ch == '\n') { actualString[len++] = '\\'; actualString[len++] = 'n'; }
            else actualString[len++] = ch;
         }
         actualString[len] = 0;
         ((void (*)(void *, void *, void *, int, int, int, void *, uint, uint))(void *)class(String)._vTbl[__ecereVMethodID_class_OnDisplay])(class(String), actualString, surface, x, y, width, null, alignment, displayFlags);
      }
   }
};
