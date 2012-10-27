#include <stdarg.h>

class DynamicString : Array<char>
{
   minAllocSize = 1024;

   DynamicString()
   {
      Add('\0');
   }

   property String
   {
      get
      {
         return &(this[0]);
      }
      set
      {
      }
   }

   void concat(String s)
   {
      int len = strlen(s);
      if(len)
      {
         int pos = size-1;
         if(pos == -1) { Add('\0'); pos = 0; }
         size += len;
         memcpy(&(this[pos]), s, len+1);
      }
   }

   void concatf(char * format, ...)
   {
      char string[MAX_F_STRING*16];
      va_list args;
      va_start(args, format);
      vsprintf(string, format, args);
      va_end(args);
      concat(string);
   }

   void concatx(typed_object object, ...)
   {
      char string[MAX_F_STRING*16];
      va_list args;
      int len;
      va_start(args, object);
      len = PrintStdArgsToBuffer(string, sizeof(string), object, args);
      concat(string);
      va_end(args);
   }

}
