#include <stdarg.h>

import "ecere"
import "CodeEditor"

enum OutputViewTab { build, debug, find
#ifdef GDB_DEBUG_OUTPUT
, gdb
#endif
};

enum CompilerMessageType
{
   nil, any, error, other, warning, note, location, unusedFunc, unusedVar, varSetButNotUsed;

   bool match(CompilerMessageType b)
   {
      CompilerMessageType a = this;
      if(b != nil && (b == any ||
            (b == other && (a == unusedFunc || a == unusedVar || a == varSetButNotUsed)) ||
            b == a))
         return true;
      return false;
   }

   CompilerMessageType ::fromKeyCode(KeyCode code)
   {
      switch(code)
      {
         case space: return any;
         case a:     return any;
         case e:     return error;
         case o:     return other;
         case w:     return warning;
         case n:     return note;
         case l:     return location;
         case f:     return unusedFunc;
         case v:     return unusedVar;
         case s:     return varSetButNotUsed;
      }
      return nil;
   }
};

struct BuildOutputLineMark
{
   CompilerMessageType type;
   int lineNumber;
};

class OutputView : Window
{
   visible = false;
   borderStyle = sizable;
   hasClose = true;
   mergeMenus = false;
   text = $"Output";
   menu = Menu { };
   anchor = Anchor { left = 0, right = 0, bottom = 0 };
   size.h = 240;
   background = formColor;

   virtual void OnGotoError(const char * line, bool openAsText, bool noParsing);
   virtual void OnCodeLocationParseAndGoTo(const char * line, bool openAsText, bool noParsing);

   FindDialog findDialog { master = this, editBox = buildBox, isModal = true, autoCreate = false, text = $"Find" };

   Button buildBtn
   {
      this, inactive = true, text = $"Build", bevelOver = true, isRadio = true, bitmap = null, checked = true;
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
      this, inactive = true, text = $"Debug", bevelOver = true, isRadio = true, bitmap = null;
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
      this, inactive = true, text = $"Find", bevelOver = true, isRadio = true, bitmap = null;
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

   Button autoGo
   {
      this, inactive = true, text = $"Automatic Go To Line", isCheckbox = true, hotKey = ctrlSpace, checked = false;
      anchor = { top = 4, right = 4 };
   };

   void SelectTab(OutputViewTab tab)
   {
      Button activeBtn = null;
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
      autoGo.visible = tab == build;
      if(activeBtn && activeBox)
      {
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
   }

   EditBox activeBox;
   activeBox = buildBox;

   // todo: add marks to find results! using space for any.. and generate marks as something
   //       have marks for files? use enter? to go from file to file?

   LogBox buildBox
   {
      parent = this, freeCaret = true, autoEmpty = true, multiLine = true;
      readOnly = true, hasVertScroll = true, hasHorzScroll = true;
      anchor = Anchor { left = 0, right = 0, top = 23, bottom = 0 };
      /*
      font = { panelFont.faceName, panelFont.size, panelFont.bold, panelFont.italic };
      background = colorScheme.outputBackground;
      foreground = colorScheme.outputText;
      selectionColor = colorScheme.selectionColor;
      selectionText = colorScheme.selectionText;
      */

      bool NotifyDoubleClick(EditBox editBox, EditLine line, Modifiers mods)
      {
         if(mods.alt)
            return true;
         OnGotoError(editBox.line.text, mods.ctrl && mods.shift, mods.ctrl && !mods.shift);
         return false;
      }

      bool OnKeyHit(Key key, unichar ch)
      {
         CompilerMessageType t = key.modifiers & { alt = true, ctrl = true } ? 0 :
               CompilerMessageType::fromKeyCode(key.code);
         if(t)
         {
            LogBox buildBox = this;
            OutputView outputView = (OutputView)buildBox.parent;
            Array<BuildOutputLineMark> marks = outputView.marks;
            if(marks.count)
            {
               bool reverse = key.shift;
               int count = marks.count;
               int increment = reverse ? -1 : 1;
               int bound = reverse ? -1 : count;
               int firstPos = reverse ? count - 1 : 0;
               int lastPos = reverse ? 0 : count - 1;
               int lineNumber = buildBox.lineNumber + 1;
               int nextPos = -1;
               int endPos;
               int pos;
               for(pos = firstPos; pos != bound; pos += increment)
               {
                  int num = marks[pos].lineNumber;
                  if((reverse && num < lineNumber) || (!reverse && num > lineNumber))
                  {
                     nextPos = pos;
                     break;
                  }
               }
               if(nextPos == -1)
                  nextPos = firstPos;
               endPos = nextPos - increment;
               if(endPos == -1)
                  endPos = lastPos;
               else if(endPos == bound)
                  endPos = firstPos;
               while(1)
               {
                  if(nextPos == bound)
                     nextPos = firstPos;
                  if(marks[nextPos].type.match(t))
                     break;
                  if(nextPos == endPos)
                  {
                     nextPos = -1;
                     break;
                  }
                  nextPos += increment;
               }
               if(nextPos == -1 && marks.count && marks[marks.count - 1].type == nil)
                  nextPos = marks.count - 1;
               if(nextPos != -1)
               {
                  buildBox.GoToLineNum(marks[nextPos].lineNumber - 1);
                  if(outputView.autoGo.checked)
                  {
                     outputView.OnGotoError(this.line.text, false, false);
                     Activate();
                  }
               }
               return true;
            }
         }
         return EditBox::OnKeyHit(key, ch);
      }

      bool NotifyKeyDown(EditBox editBox, Key key, unichar ch)
      {
         if(key.code == enter || key.code == keyPadEnter)
         {
            OnGotoError(editBox.line.text, key.ctrl && key.shift, key.ctrl && !key.shift);
            return false;
         }
         return true;
      }
   };

   void buildClear()
   {
      buildBox.Clear();
      marks.RemoveAll();
   }

   Array<BuildOutputLineMark> marks { };

   LogBox debugBox
   {
      parent = this, freeCaret = true, autoEmpty = true, multiLine = true;
      readOnly = true, hasVertScroll = true, hasHorzScroll = true, visible = false;
      anchor = Anchor { left = 0, right = 0, top = 23, bottom = 0 };
      /*
      font = { panelFont.faceName, panelFont.size, panelFont.bold, panelFont.italic };
      background = colorScheme.outputBackground;
      foreground = colorScheme.outputText;
      selectionColor = colorScheme.selectionColor;
      selectionText = colorScheme.selectionText;
      */

      bool NotifyDoubleClick(EditBox editBox, EditLine line, Modifiers mods)
      {
         OnCodeLocationParseAndGoTo(editBox.line.text, mods.ctrl && mods.shift, mods.ctrl && !mods.shift);
         return false;
      }

      bool NotifyKeyDown(EditBox editBox, Key key, unichar ch)
      {
         if(key.code == enter || key.code == keyPadEnter)
         {
            OnCodeLocationParseAndGoTo(editBox.line.text, key.ctrl && key.shift, key.ctrl && !key.shift);
            return false;
         }
         return true;
      }
   };

   LogBox findBox
   {
      parent = this, freeCaret = true, autoEmpty = true, multiLine = true;
      readOnly = true, hasVertScroll = true, hasHorzScroll = true, visible = false;
      anchor = Anchor { left = 0, right = 0, top = 23, bottom = 0 };
      /*
      font = { panelFont.faceName, panelFont.size, panelFont.bold, panelFont.italic };
      background = colorScheme.outputBackground;
      foreground = colorScheme.outputText;
      selectionColor = colorScheme.selectionColor;
      selectionText = colorScheme.selectionText;
      */

      bool NotifyDoubleClick(EditBox editBox, EditLine line, Modifiers mods)
      {
         OnCodeLocationParseAndGoTo(editBox.line.text, mods.ctrl && mods.shift, mods.ctrl && !mods.shift);
         return false;
      }

      bool NotifyKeyDown(EditBox editBox, Key key, unichar ch)
      {
         if(key.code == enter || key.code == keyPadEnter)
         {
            OnCodeLocationParseAndGoTo(editBox.line.text, key.ctrl && key.shift, key.ctrl && !key.shift);
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
      font = { panelFont.faceName, panelFont.size, panelFont.bold, panelFont.italic };
      background = colorScheme.outputBackground;
      foreground = colorScheme.outputText;
      selectionColor = colorScheme.selectionColor;
      selectionText = colorScheme.selectionText;
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
      int64 id = selection.id;
      const char * searchString = findDialog.searchString;
      if(id != 2 && searchString[0])
      {
         activeBox.Find(searchString, findDialog.wholeWord, findDialog.matchCase, id != 0);
         return true;
      }
      findDialog.Create();
      return true;
   }

   void Show()
   {
      visible = true;
      ide.RepositionWindows(false);
      Activate();
   }
   void ShowClearSelectTab(OutputViewTab tab)
   {
      Show();
      if(tab == build)
         buildClear();
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
            OutputViewTab switchTo = build;
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
            OutputViewTab switchTo = debug;
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

   void Logf(const char * format, ...)
   {
      char string[MAX_F_STRING*10];
      va_list args;
      va_start(args, format);
      vsnprintf(string, sizeof(string), format, args);
      string[sizeof(string)-1] = 0;
      va_end(args);

      LogRaw(string);
   }

   void LogRaw(const char * entry)
   {
      // Cut the line longer than 1024 because Logf prints to a buffer (and we don't want to output crazy long lines either)
      //if(len > 1023) line[1023] = '\0';
      /* Fixed, but disabled this ... Not sure if there's any reason to keep it? The EditBox should be fine with long lines
         and it's easier to copy commands and go to errors */
      /*int len = strlen(entry);
      if(len > 1023)
      {
         char * newStart, * start = entry;

         while(len > 1023)
         {
            char backup[3];
            newStart = start + 1020;
            strncpy(backup, newStart, 3);
            strncpy(newStart, "\n ", 3);
            Log(start);
            strncpy(newStart, backup, 3);
            start = newStart;
            len = strlen(start);
         }
         Log(start);
      }
      else*/
         Log(entry);
   }

   void Log(const char * string)
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

   void Tellf(const char * format, ...)
   {
      char string[MAX_F_STRING*10];
      va_list args;
      va_start(args, format);
      vsnprintf(string, sizeof(string), format, args);
      string[sizeof(string)-1] = 0;
      va_end(args);

      Tell(string);
   }

   void Tell(const char * string)
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
