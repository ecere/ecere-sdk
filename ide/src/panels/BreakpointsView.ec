import "ide"

class BreakpointsView : Window
{
   visible = false;
   borderStyle = sizable;
   background = { 224, 224, 224 };
   hasClose = true;
   text = $"Breakpoints";
   clientSize = Size { 206, 624 };
   //anchor = Anchor { left = 0.8, top = 200, right = 0, bottom = 200 };
   //size = { 150 };
   anchor = Anchor { left = 0, right = 0, bottom = 0 };
   size.h = 240;

   bool moved, logging;
   
   ListBox listBox
   {
      parent = this, resizable = true, hasHeader = true, alwaysEdit = true, collapseControl = true, size = { 206, 624 };
      anchor = Anchor { left = 0, top = 0, right = 0, bottom = 0 }; //visible = true

      background = viewsBackground;
      foreground = viewsText;
      selectionColor = selectionColor, selectionText = selectionText;

      bool NotifyChanged(ListBox listBox, DataRow row)
      {
         if(listBox.currentField == locationField)
         {
            char * location = (char *)row.GetData(locationField);
            if(location && location[0])
            {
               TrimLSpaces(location, location);
               TrimRSpaces(location, location);
            }
            if(location && location[0])
            {
               if(row == listBox.lastRow)
               {
                  DataRow newRow = listBox.AddRow();
                  newRow.SetData(locationField, null);
               }
               ide.workspace.ChangeBreakpoint(row, location);
            }
            else
            {
               ide.workspace.RemoveBreakpoint((Breakpoint)row.tag);
               // This is already done by Workspace::RemoveBreakpoint!
               // listBox.DeleteRow(null);
            }
         }
         else if(listBox.currentField == ignoreField || listBox.currentField == levelField)
         {
            int value = 0;
            char * string = (char *)row.GetData(listBox.currentField);
            //char str[16];
            if(string && string[0])
            {
               TrimLSpaces(string, string);
               TrimRSpaces(string, string);
               value = atoi(string);
            }
            else if(listBox.currentField == levelField)
               value = -1;
            //str[0] = '\0';
            //sprintf(str, "%d", value);
            //listBox.StopEditing(true);
            //row.SetData(listBox.currentField, str);
            if(listBox.currentField == ignoreField)
               ide.workspace.ChangeBreakpointIgnore(row, value);
            else if(listBox.currentField == levelField)
               ide.workspace.ChangeBreakpointLevel(row, value);
         }
         else if(listBox.currentField == conditionField)
         {
            char * condition = (char *)row.GetData(conditionField);
            if(condition && condition[0])
            {
               TrimLSpaces(condition, condition);
               TrimRSpaces(condition, condition);
            }
            ide.workspace.ChangeBreakpointCondition(row, (condition && condition[0]) ? condition : null);
         }
         return true;
      }
      
      bool NotifyKeyDown(ListBox listBox, DataRow row, Key key, unichar ch)
      {
         if((SmartKey)key == enter)
            GoToBpLocation(listBox.currentRow);
         return true;
      }

      bool NotifyKeyHit(ListBox listBox, DataRow row, Key key, unichar ch)
      {
         if(row && (SmartKey)key == del)
         {
            listBox.StopEditing(true);
            ide.workspace.RemoveBreakpoint((Breakpoint)row.tag);
         }
         return true;
      }

      bool NotifyDoubleClick(ListBox listBox, int x, int y, Modifiers mods)
      {
         GoToBpLocation(listBox.currentRow);
         return true;
      }
   };
   
   // TODO: set field size based on font and i18n header string
   // TODO: save column widths to ide settings
   DataField locationField    { "char *", true , width = 220, header = $"Location" };
   DataField hitsField        { "int"   , false, width =  28, header = $"Hits" };
   DataField breaksField      { "int"   , false, width =  46, header = $"Breaks" };
   DataField ignoreField      { "char *", true , width =  80, header = $"Ignore Count" };
   DataField levelField       { "char *", true , width =  74, header = $"Stack Depth" };
   DataField conditionField   { "char *", true , width = 130, header = $"Condition" };
   
   BreakpointsView()
   {
      listBox.AddField(locationField);
      listBox.AddField(hitsField);
      listBox.AddField(breaksField);
      listBox.AddField(ignoreField);
      listBox.AddField(levelField);
      listBox.AddField(conditionField);
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
      int lineActive, lineUser;
      int lineH;
      int scrollY = listBox.scroll.y;
      int boxH = clientSize.h;
      
      displaySystem.FontExtent(listBox.font.font, " ", 1, null, &lineH);
      //Window::OnRedraw(surface);
      ide.debugger.GetCallStackCursorLine(&error, &lineActive, &lineUser);
      // todo DrawLineMarginIcon(surface, error ? ide.bmpErrorActiveCursor : ide.bmpActiveCursor, lineActive, lineH, scrollY, boxH);
   }

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

   void Show()
   {
      visible = true;
      Activate();
   }

   void LoadFromWorkspace()
   {
      for(bp : ide.workspace.breakpoints; bp.type == user)
         AddBreakpoint(bp);
   }

   void AddBreakpoint(Breakpoint bp)
   {
      char string[32];
      DataRow row = listBox.AddRow();
      row.tag = (int)bp;
      bp.row = row;
      UpdateBreakpoint(row);
      ide.callStackView.Update(null);
   }

   void RemoveBreakpoint(Breakpoint bp)
   {
      listBox.DeleteRow(bp.row);
      bp.row = null;
      ide.callStackView.Update(null);
      Update(null);
   }
   
   void UpdateBreakpoint(DataRow row)
   {
      if(row && row.tag)
      {
         char string[32];
         char * location;
         Breakpoint bp = (Breakpoint)row.tag;
         location = bp.LocationToString();
         row.SetData(locationField, location);
         delete location;
         if(bp.ignore == 0)
            string[0] = '\0';
         else
            sprintf(string, "%d", bp.ignore);
         row.SetData(ignoreField, string);
         if(bp.level == -1)
            string[0] = '\0';
         else
            sprintf(string, "%d", bp.level);
         row.SetData(levelField, string);
         if(bp.condition)
            row.SetData(conditionField, bp.condition.expression);
         else
            row.SetData(conditionField, null);
         row.SetData(hitsField, bp.hits);
         row.SetData(breaksField, bp.breaks);
      }
   }
   
   void Clear()
   {
      listBox.Clear();
   }

private:
   void GoToBpLocation(DataRow row)
   {
      if(row)
      {
         char * location = (char *)row.GetData(locationField);
         if(location)
            ide.debugger.GoToCodeLine(location);
      }
   }

}

