#include <stdarg.h>

import "ecere"
import "CodeEditor"

class CallStackView : Window
{
   visible = false;
   borderStyle = sizableDeep;
   background = { 224, 224, 224 };
   hasClose = true;
   mergeMenus = false;
   text = $"Call Stack";
   menu = Menu { };
   anchor = Anchor { left = 0, right = 0.2, top = 0 };
   size.h = 200;

   virtual void OnGotoLine(char * line);
   virtual void OnSelectFrame(int lineNumber);
   virtual void OnToggleBreakpoint();

   bool moved, logging;
   FindDialog findDialog { master = this, editBox = editBox, isModal = true, autoCreate = false, text = $"Find" };
   
   EditBox editBox
   {
      parent = this, freeCaret = true, autoEmpty = true, multiLine = true, readOnly = true;
      hasVertScroll = true, hasHorzScroll = true, borderStyle = none;
      anchor = Anchor { left = 20, top = 0, right = 0, bottom = 0 };
      background = viewsBackground;
      foreground = viewsText;
      selectionColor = selectionColor, selectionText = selectionText;

      bool NotifyDoubleClick(EditBox editBox, EditLine line, Modifiers mods)
      {
         OnGotoLine(editBox.line.text);
         if(strcmp(editBox.line.text, "..."))
         {
            int lineNumber = atoi(editBox.line.text);
            OnSelectFrame(lineNumber);
         }
         return true;
      }

      bool NotifyKeyDown(EditBox editBox, Key key, unichar ch)
      {
         if(key == enter || key == keyPadEnter)
         {
            OnGotoLine(editBox.line.text);
            if(strcmp(editBox.line.text, "..."))
            {
               int lineNumber = atoi(editBox.line.text);
               OnSelectFrame(lineNumber);
            }
            return false;
         }
         if(key == f9)
         {
            OnToggleBreakpoint();
            return false;
         }
         return true;
      }

      void OnVScroll(ScrollBarAction action, int position, Key key)
      {
         if(anchor.left.distance)
         {
            Box box { 0, 0, anchor.left.distance-1, parent.clientSize.h - 1 };
            parent.Update(box);
         }
         EditBox::OnVScroll(action, position, key);
      }
   };

   Menu editMenu { menu, $"Edit", e };
   MenuItem item;
   
   MenuItem copyItem
   {
      editMenu, $"Copy", c, ctrlC;
      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         editBox.Copy();
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
         editBox.Find(searchString, findDialog.wholeWord, findDialog.matchCase, id);
         return true;
      }
      findDialog.Create();
      return true;
   }

   void Logf(char * format, ...)
   {
      char string[MAX_F_STRING*10];
      va_list args;
      string[sizeof(string)-1] = 0;
      va_start(args, format);
      vsnprintf(string, sizeof(string), format, args);
      va_end(args);

      Log(string);
   }
   void LogSprintf(char * entry)
   {
      char string[MAX_F_STRING];
      sprintf(string, entry);
      Log(string);
   }
   void LogRaw(char * entry)
   {
      Log(entry);
   }
   void Log(char * string)
   {
      EditLine line1;
      EditLine line2;
      int x1, y1, x2, y2;
      Point scroll;
      logging = true;
      if(moved)
      {
         editBox.GetSelPos(&line1, &y1, &x1, &line2, &y2, &x2, false);
         scroll = editBox.scroll;
      }
      editBox.End();
      editBox.PutS(string);
      editBox.Update(null);
      if(moved)
      {
         editBox.scroll = scroll;
         editBox.SetSelPos(line1, y1, x1, line2, y2, x2);
      }
      logging = false;
   }
   void Clear()
   {
      editBox.Clear();
      moved = false;
   }
   void Home()
   {
      editBox.Home();
   }
   void Show()
   {
      visible = true;
      Activate();
   }
}
