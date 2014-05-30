#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

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
