#include <stdarg.h>

import "ecere"
import "CodeEditor"

class ThreadsView : Window
{
   visible = false;
   borderStyle = sizableDeep;
   background = { 224, 224, 224 };
   hasClose = true;
   hasClose = true;
   mergeMenus = false;
   text = "Threads";
   menu = Menu { };
   anchor = Anchor { left = 0.8, right = 0, top = 0 };
   size.h = 200;

   bool moved, logging;
   FindDialog findDialog { master = this, editBox = editBox, isModal = true, autoCreate = false, text = "Find" };
   
   BitmapResource bmpCursor            { ":codeMarks/cursor.png", window = this };
   BitmapResource bmpCursorError       { ":codeMarks/cursorError.png", window = this };
   BitmapResource bmpTopFrame          { ":codeMarks/topFrame.png", window = this };
   BitmapResource bmpTopFrameError     { ":codeMarks/topFrameError.png", window = this };

   virtual void OnSelectThread(int threadId);
   virtual bool OnGetThreadsInfo(int * activeThread, int * hitThread, int * signalThread);

   int GetThreadId()
   {
      return atoi(editBox.line.text);
   }

   int FindThreadId(int threadId)
   {
      int lineNumber;
      EditLine line;
      for(line = editBox.firstLine, lineNumber = 1; line; line = line.next, lineNumber++)
      {
         int id = atoi(line.text);
         if(id && id == threadId)
            return lineNumber;
      }
      return 0;
   }

   EditBox editBox
   {
      parent = this, freeCaret = true, autoEmpty = true, multiLine = true, readOnly = true;
      hasVertScroll = true, hasHorzScroll = true, borderStyle = none;
      anchor = { left = 20, right = 0, top = 0, bottom = 0 };
      background = viewsBackground;
      foreground = viewsText;
      selectionColor = selectionColor, selectionText = selectionText;

      bool NotifyDoubleClick(EditBox editBox, EditLine line, Modifiers mods)
      {
         int id = GetThreadId();
         OnSelectThread(id);
         return true;
      }

      bool NotifyKeyDown(EditBox editBox, Key key, unichar ch)
      {
         if((SmartKey)key == enter)
         {
            int id = GetThreadId();
            OnSelectThread(id);
            return false;
         }
         return true;
      }

      void NotifyCaretMove(EditBox editBox, int line, int charPos)
      {
         if(!logging)
         {
            int y1, y2;
            editBox.GetSelPos(null, &y1, null, null, &y2, null, false);
            moved = (y1 == editBox.numLines - 1 && y2 == y1) ? false : true;
         }
      }

      void OnVScroll(ScrollBarAction action, int position, Key key)
      {
         int boxH = clientSize.h;
         Box box = { 0,0, 19, boxH - 1 };
         parent.Update(box);
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

   void OnRedraw(Surface surface)
   {
      int lineH;
      int scrollY = editBox.scroll.y;
      int boxH = clientSize.h;
      int lineNumber;
      int activeThread, hitThread, signalThread;
      
      if(OnGetThreadsInfo(&activeThread, &hitThread, &signalThread))
      {
         EditLine line;
         BitmapResource bmpRes;
         displaySystem.FontExtent(editBox.font.font, " ", 1, null, &lineH);
         for(line = editBox.firstLine, lineNumber = 1; line; line = line.next, lineNumber++)
         {
            if(strlen(line.text))
            {
               int id = atoi(line.text);
               bmpRes = (id == signalThread) ? bmpTopFrameError : bmpTopFrame;
               if(id == activeThread)
               {
                  DrawLineMarginIcon(surface,
                        (id == signalThread) ? bmpCursorError : bmpCursor,
                        lineNumber, lineH, scrollY, boxH);
               }
               else if(id == signalThread)
                  DrawLineMarginIcon(surface, bmpRes, lineNumber, lineH, scrollY, boxH);
            }
         }
         if(editBox.horzScroll && editBox.horzScroll.visible)
         {
            surface.SetBackground(control);
            surface.Area(0, editBox.clientSize.h, 20 - 1, clientSize.h - 1);
         }
      }
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
}
