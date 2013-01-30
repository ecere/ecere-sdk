#include <stdarg.h>

import "ecere"
import "CodeEditor"

enum OutputViewTab { build, debug, find
#ifdef GDB_DEBUG_OUTPUT
, gdb
#endif
};

class OutputView : Window
{
   visible = false;
   borderStyle = sizable;
   hasClose = true;
   mergeMenus = false;
   text = "Output";
   menu = Menu { };
   anchor = Anchor { left = 0, right = 0, bottom = 0 };
   size.h = 240;
   background = formColor;

   virtual void OnGotoError(char * line);
   virtual void OnCodeLocationParseAndGoTo(char * line);

   FindDialog findDialog { master = this, editBox = buildBox, isModal = true, autoCreate = false, text = "Find" };

   Button buildBtn
   {
      this, inactive = true, text = "Build", bevelOver = true, isRadio = true, bitmap = null, checked = true;
      size = { 99, 20 };
      anchor = { left = 0, top = 1 };
      font = { $"Tahoma", 8.25f, bold = true };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         SelectTab(build);
         return true;
      }
   };
   
   Button debugBtn
   {
      this, inactive = true, text = "Debug", bevelOver = true, isRadio = true, bitmap = null;
      size = { 99, 20 };
      anchor = { left = 100, top = 1 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         SelectTab(debug);
         return true;
      }
   };
   
   Button findBtn
   {
      this, inactive = true, text = "Find", bevelOver = true, isRadio = true, bitmap = null;
      size = { 99, 20 };
      anchor = { left = 200, top = 1 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         SelectTab(find);
         return true;
      }
   };

#ifdef GDB_DEBUG_OUTPUT
   Button gdbBtn
   {
      this, inactive = true, text = "GDB", bevelOver = true, isRadio = true, bitmap = null;
      size = { 99, 20 };
      anchor = { left = 300, top = 1 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         SelectTab(gdb);
         return true;
      }
   };
#endif

   void SelectTab(OutputViewTab tab)
   {
      Button activeBtn;
      if(tab == build)
         activeBtn = buildBtn, activeBox = buildBox;
      else if(tab == debug)
         activeBtn = debugBtn, activeBox = debugBox;
      else if(tab == find)
         activeBtn = findBtn, activeBox = findBox;
#ifdef GDB_DEBUG_OUTPUT
      else if(tab == gdb)
         activeBtn = gdbBtn, activeBox = gdbBox;
#endif

      activeBtn.checked = true;
      activeBtn.font = { $"Tahoma", 8.25f, bold = true };
      if(buildBtn != activeBtn) buildBtn.font = null;
      if(debugBtn != activeBtn) debugBtn.font = null;
      if(findBtn != activeBtn) findBtn.font = null;
#ifdef GDB_DEBUG_OUTPUT
      if(gdbBtn != activeBtn) gdbBtn.font = null;
#endif

      activeBox.visible = false;
      activeBtn.Activate();      // Ensure proper cycling (until tab order?)
      activeBox.visible = true;
      activeBox.Activate();
      findDialog.editBox = activeBox;
   }

   EditBox activeBox;
   
   LogBox buildBox
   {
      parent = this, freeCaret = true, autoEmpty = true, multiLine = true;
      readOnly = true, hasVertScroll = true, hasHorzScroll = true;
      anchor = Anchor { left = 0, right = 0, top = 23, bottom = 0 };
      font = { panelFont.faceName, panelFont.size };
      background = outputBackground;
      foreground = outputText;
      selectionColor = selectionColor, selectionText = selectionText;
      
      bool NotifyDoubleClick(EditBox editBox, EditLine line, Modifiers mods)
      {
         OnGotoError(editBox.line.text);
         return false; //true; // why not use true here? 
      }

      bool NotifyKeyDown(EditBox editBox, Key key, unichar ch)
      {
         if((SmartKey)key == enter)
         {
            OnGotoError(editBox.line.text);
            return false;
         }
         return true;
      }
   };
   
   LogBox debugBox
   {
      parent = this, freeCaret = true, autoEmpty = true, multiLine = true;
      readOnly = true, hasVertScroll = true, hasHorzScroll = true, visible = false;
      anchor = Anchor { left = 0, right = 0, top = 23, bottom = 0 };
      font = { panelFont.faceName, panelFont.size };
      background = outputBackground;
      foreground = outputText;
      selectionColor = selectionColor, selectionText = selectionText;
   };
   
   LogBox findBox
   {
      parent = this, freeCaret = true, autoEmpty = true, multiLine = true;
      readOnly = true, hasVertScroll = true, hasHorzScroll = true, visible = false;
      anchor = Anchor { left = 0, right = 0, top = 23, bottom = 0 };
      font = { panelFont.faceName, panelFont.size };
      background = outputBackground;
      foreground = outputText;
      selectionColor = selectionColor, selectionText = selectionText;

      bool NotifyDoubleClick(EditBox editBox, EditLine line, Modifiers mods)
      {
         OnCodeLocationParseAndGoTo(editBox.line.text);
         return false; //true;
      }

      bool NotifyKeyDown(EditBox editBox, Key key, unichar ch)
      {
         if((SmartKey)key == enter)
         {
            OnCodeLocationParseAndGoTo(editBox.line.text);
            return false;
         }
         return true;
      }
   };

#ifdef GDB_DEBUG_OUTPUT
   LogBox gdbBox
   {
      parent = this, freeCaret = true, autoEmpty = true, multiLine = true;
      readOnly = true, hasVertScroll = true, hasHorzScroll = true, visible = false;
      anchor = Anchor { left = 0, right = 0, top = 23, bottom = 0 };
      font = { panelFont.faceName, panelFont.size };
   };
#endif
   
   Menu editMenu { menu, $"Edit", e };

   MenuItem item;
   MenuItem copyItem
   {
      editMenu, $"Copy", c, ctrlC;
      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         activeBox.Copy();
         return true;
      }
   };
   MenuDivider { editMenu };
   MenuItem { editMenu, $"Find Previous", e, Key { f3, shift = true }, NotifySelect = MenuEditFind, id = 0 };
   MenuItem { editMenu, $"Find Next", n, f3, NotifySelect = MenuEditFind, id = 1 };
   MenuItem { editMenu, $"Find", f, ctrlF, NotifySelect = MenuEditFind, id = 2 };

   bool MenuEditFind(MenuItem selection, Modifiers mods)
   {
      int id = selection.id;
      char * searchString = findDialog.searchString;
      if(id != 2 && searchString[0])
      {
         activeBox.Find(searchString, findDialog.wholeWord, findDialog.matchCase, id);
         return true;
      }
      findDialog.Create();
      return true;
   }

   void Show()
   {
      visible = true;
      Activate();
   }
   void ShowClearSelectTab(OutputViewTab tab)
   {
      Show();
      if(tab == build)
         buildBox.Clear();
      else if(tab == debug)
         debugBox.Clear();
      else if(tab == find)
      {
         findBox.Clear();
      }
#ifdef GDB_DEBUG_OUTPUT
      else if(tab == gdb)
         gdbBox.Clear();
#endif
      SelectTab(tab);
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case shiftTab:
         {
            OutputViewTab switchTo;
            if(activeBox == buildBox)
#ifdef GDB_DEBUG_OUTPUT
               switchTo = gdb;
#else
               switchTo = find;
#endif
            else if(activeBox == debugBox)
               switchTo = build;
            else if(activeBox == findBox)
               switchTo = debug;
#ifdef GDB_DEBUG_OUTPUT
            else if(activeBox == gdbBox)
               switchTo = build;
#endif
            SelectTab(switchTo);
            break;
         }
         case tab:
         {
            OutputViewTab switchTo;
            if(activeBox == buildBox)
               switchTo = debug;
            else if(activeBox == debugBox)
               switchTo = find;
            else if(activeBox == findBox)
#ifdef GDB_DEBUG_OUTPUT
               switchTo = gdb;
            else if(activeBox == gdbBox)
#endif
               switchTo = build;
            SelectTab(switchTo);
            break;
         }
      }
      return true;
   }
}

class LogBox : EditBox
{
   bool moved, logging, tell;

   void Logf(char * format, ...)
   {
      char string[MAX_F_STRING*10];
      va_list args;
      string[sizeof(string)-1] = 0;
      va_start(args, format);
      vsnprintf(string, sizeof(string), format, args);
      va_end(args);

      LogRaw(string);
   }

   void LogSprintf(char * entry)
   {
      char string[MAX_F_STRING];
      sprintf(string, entry);
      LogRaw(string);
   }

   void LogRaw(char * entry)
   {
      // Cut the line longer than 1024 because Logf prints to a buffer (and we don't want to output crazy long lines either)
      //if(len > 1023) line[1023] = '\0';
      int len = strlen(entry);
      if(len > 1023)
      {
         char backup[4];
         char * newStart, * start = entry;
         
         while(len > 1023)
         {
            newStart = start + 1020;
            strncpy(backup, newStart, 4);
            strncpy(newStart, " \\ \0", 4);
            Log(start);
            strncpy(newStart, backup, 4);
            start = newStart;
            len = strlen(start);
         }
         
         //while((len = strlen(start)) > 1023)
         
      }
      else
         Log(entry);
   }

   void Log(char * string)
   {
      int x1, y1, x2, y2;
      Point scrl;
      EditLine line1;
      EditLine line2;
      logging = true;
      if(moved)
      {
         GetSelPos(&line1, &y1, &x1, &line2, &y2, &x2, false);
         scrl = scroll;
      }
      End();
      if(tell)
      {
         ClearLine();
         tell = false;
      }
      PutS(string);
      Update(null);
      if(moved)
      {
         scroll = scrl;
         SetSelPos(line1, y1, x1, line2, y2, x2);
      }
      logging = false;
   }

   void Tellf(char * format, ...)
   {
      char string[MAX_F_STRING*10];
      va_list args;
      string[sizeof(string)-1] = 0;
      va_start(args, format);
      vsnprintf(string, sizeof(string), format, args);
      va_end(args);

      Tell(string);
   }

   void Tell(char * string)
   {
      Log(string);
      if(!moved)
      {
         Point caretPos;
         GetCaretPosition(caretPos);
         SetCaret(0, caretPos.y, GetCaretSize());
      }
      tell = true;
   }

   void Clear()
   {
      EditBox::Clear();
      moved = false;
   }

   void NotifyCaretMove(EditBox editBox, int line, int charPos)
   {
      LogBox logBox = (LogBox)editBox;
      if(!logBox.logging)
      {
         int y1, y2;
         logBox.GetSelPos(null, &y1, null, null, &y2, null, false);
         logBox.moved = (y1 == logBox.numLines - 1 && y2 == y1) ? false : true;
      }
   }
}
