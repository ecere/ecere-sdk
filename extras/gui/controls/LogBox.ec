#include <stdarg.h>

public import "ecere"

class LogBox : EditBox
{
   bool moved, logging, tell;

   void Logt(typed_object object, ...)
   {
      va_list args;
      char buffer[4096];
      va_start(args, object);
      PrintStdArgsToBuffer(buffer, sizeof(buffer), object, args);
      va_end(args);
      Log(buffer);
   }

   void Logf(char * format, ...)
   {
      va_list args;
      char string[MAX_F_STRING*10];
      va_start(args, format);
      vsprintf(string, format, args);
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

   void Tellt(typed_object object, ...)
   {
      va_list args;
      char buffer[4096];
      va_start(args, object);
      PrintStdArgsToBuffer(buffer, sizeof(buffer), object, args);
      va_end(args);
      Tell(buffer);
   }

   void Tellf(char * format, ...)
   {
      va_list args;
      char string[MAX_F_STRING*10];
      va_start(args, format);
      vsprintf(string, format, args);
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
