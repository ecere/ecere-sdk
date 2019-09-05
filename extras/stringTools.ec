#if defined(ECERE_STATIC) && !defined(IMPORT_STATIC)
#define IMPORT_STATIC static
#endif
public import IMPORT_STATIC "ecere"

public enum Trim { no, left = 1, right = 2, ends = 3, middle = 4, all = 7 };

void TrimChars(const char * string, char * output, const char * chars, Trim trim, bool squash, char alt)
{
   const char * s = string;
   char * o = output;
   char ch;
   bool keepChar = (trim & left) != left;
   bool keepMiddleChars = (trim & middle) != middle;
   for(; (ch = *s); s++)
   {
      if(strchr(chars, ch))
      {
         if(keepChar)
         {
            *o++ = alt;
            if(squash)
               keepChar = false;
         }
      }
      else
      {
         if(!keepChar && keepMiddleChars)
            keepChar = true;
         *o++ = ch;
      }
   }
   if(keepMiddleChars && (trim & right) == right && o > output && *(o-1) == alt)
      o--;
   *o = '\0';
}

char * TrimCharsCopy(const char * string, const char * chars, Trim trim, bool squash, char alt)
{
   int len = strlen(string);
   char * output = new char[len+1];
   TrimChars(string, output, chars, trim, squash, alt);
   len = strlen(output);
   output = renew output char[len+1];
   return output;
}

void TrimTestChars(const char * string, char * output, int (*CharTest)(char), Trim trim, bool squash, char alt)
{
   const char * s = string;
   char * o = output;
   char ch;
   bool keepChar = (trim & left) != left;
   bool keepMiddleChars = (trim & middle) != middle;
   for(; (ch = *s); s++)
   {
      if(CharTest(ch))
      {
         if(keepChar)
         {
            *o++ = alt;
            if(squash)
               keepChar = false;
         }
      }
      else
      {
         if(!keepChar && keepMiddleChars)
            keepChar = true;
         *o++ = ch;
      }
   }
   if(keepMiddleChars && (trim & right) == right && o > output && *(o-1) == alt)
      o--;
   *o = '\0';
}

char * TrimTestCharsCopy(const char * string, int (*CharTest)(char), Trim trim, bool squash, char alt)
{
   int len = strlen(string);
   char * output = new char[len+1];
   TrimTestChars(string, output, CharTest, trim, squash, alt);
   len = strlen(output);
   output = renew output char[len+1];
   return output;
}

char * CopyAllCapsString(const char * string)
{
   int len = strlen(string);
   char * output = new char[len+1];
   const char * s = string;
   char * o = output;
   char ch;
   for(; (ch = *s); s++)
      *o++ = (ch < 128) ? (char)toupper(ch) : ch; // TODO: UNICODE TO UPPER -- REFER EditBox.ec
   *o = 0;
   return output;
}

// String Escape Copy
static void strescpy(char * output, char * string)
{
   char * s = string;
   char * d = output;
   while(*s)
   {
      switch(*s)
      {
      // case '\n': *d = '\\'; d++; *d = 'n' ; break;
      // case '\t': *d = '\\'; d++; *d = 't' ; break;
      // case '\a': *d = '\\'; d++; *d = 'a' ; break;
      // case '\b': *d = '\\'; d++; *d = 'b' ; break;
      // case '\f': *d = '\\'; d++; *d = 'f' ; break;
      // case '\r': *d = '\\'; d++; *d = 'r' ; break;
      // case '\v': *d = '\\'; d++; *d = 'v' ; break;
         case '\'': *d = '\\'; d++; *d = '\''; break;
      // case '\"': *d = '\\'; d++; *d = '\"'; break;
         default: *d = *s;
      }
      s++;
      d++;
   }
   *d = '\0';
}

String copyEscapeString(String string)
{
   String result = null;
   String buffer = new char[strlen(string) * 2 + 1];
   strescpy(buffer, string);
   result = CopyString(buffer);
   delete buffer;
   return result;
}
