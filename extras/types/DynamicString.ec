#ifdef ECERE_STATIC
public import static "ecere"
#endif

#include <stdarg.h>

public class DynamicString : Array<char>
{
   minAllocSize = 1024;

   DynamicString()
   {
      Add('\0');
   }

   property String
   {
      set
      {
         DynamicString s { };
         if(value)
         {
            int len = strlen(value) + 1;
            s.size = len;
            memcpy(s.array, value, len);
         }
         return s;
      }
      get { return array; }
   }

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      return array;
   }

   bool OnGetDataFromString(const char * string)
   {
      this = (DynamicString)(char *)string;
      return true;
   }

   void concat(const String s)
   {
      int len = strlen(s);
      if(len)
      {
         int pos = size-1;
         if(pos == -1) { Add('\0'); pos = 0; }
         if(size + len > minAllocSize)
            minAllocSize += len + (minAllocSize >> 1);
         size += len;
         memcpy(&(this[pos]), s, len+1);
      }
   }

   void concatf(const char * format, ...)
   {
      // TODO: improve this to vsprinf directly in the Array<char> instead of calling concat
      char string[MAX_F_STRING];
      va_list args;
      va_start(args, format);
      vsnprintf(string, sizeof(string), format, args);
      string[sizeof(string)-1] = 0;
      va_end(args);
      concat(string);
   }

   void concatx(typed_object object, ...)
   {
      // TODO: improve this to work directly on the Array<char> instead of calling PrintStdArgsToBuffer
      char string[MAX_F_STRING];
      va_list args;
      //int len;
      va_start(args, object);
      /*len = */PrintStdArgsToBuffer(string, sizeof(string), object, args);
      concat(string);
      va_end(args);
   }

   void print(const String s)
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

   void println(const String s)
   {
      printf("%s\n", s);
   }

   void printf(const char * format, ...)
   {
      char string[MAX_F_STRING];
      va_list args;
      va_start(args, format);
      vsnprintf(string, sizeof(string), format, args);
      string[sizeof(string)-1] = 0;
      va_end(args);
      concat(string);
   }

   void printx(typed_object object, ...)
   {
      char string[MAX_F_STRING];
      va_list args;
      //int len;
      va_start(args, object);
      /*len = */PrintStdArgsToBuffer(string, sizeof(string), object, args);
      concat(string);
      va_end(args);
   }

   void printxln(typed_object object, ...)
   {
      char string[MAX_F_STRING];
      va_list args;
      //int len;
      va_start(args, object);
      /*len = */PrintStdArgsToBuffer(string, sizeof(string), object, args);
      printf("%s\n", string);
      va_end(args);
   }

   void copySingleBlankReplTrim(String s, char replace, bool trim)
   {
      privateCommonCopyLenSingleBlankReplTrim(s, replace, trim, strlen(s));
   }

   void copyLenSingleBlankReplTrim(String s, char replace, bool trim, int copyLen)
   {
      privateCommonCopyLenSingleBlankReplTrim(s, replace, trim, Min(strlen(s), copyLen));
   }

   void privateCommonCopyLenSingleBlankReplTrim(String s, char replace, bool trim, int len)
   {
      int c, d;
      bool wasBlank = trim;
      size = len + 1;
      for(c = d = 0; c < len; c++)
      {
         if(isblank(s[c]))
         {
            if(!wasBlank)
            {
               wasBlank = true;
               /*array*/this[d++] = replace ? replace : s[c];
            }
         }
         else
         {
            /*array*/this[d++] = s[c];
            if(wasBlank)
               wasBlank = false;
         }
      }
      if(!trim || (len && !isblank(/*array*/this[d])))
         d++;
      /*array*/this[d] = '\0';
      size = d + 1;
   }
}
