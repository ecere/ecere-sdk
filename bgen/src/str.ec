//#include <assert.h>

char * s;

const char ln = '\n';
const char * sln = "\n";

static const char * _spaces = \
      "                                                                " \
      "                                                                " \
      "                                                                " \
      "                                                                " \
      "                                                                " \
      "                                                                " \
      "                                                                " \
      "                                                                ";

public const char * spaces(int length, int minus)
{
   return _spaces + strlen(_spaces) - Min(Max(0, length - minus), strlen(_spaces));
}

static const char * _slashes = \
      "////////////////////////////////////////////////////////////////" \
      "////////////////////////////////////////////////////////////////" \
      "////////////////////////////////////////////////////////////////" \
      "////////////////////////////////////////////////////////////////" \
      "////////////////////////////////////////////////////////////////" \
      "////////////////////////////////////////////////////////////////" \
      "////////////////////////////////////////////////////////////////" \
      "////////////////////////////////////////////////////////////////";

public const char * slashes(int length, int minus)
{
   return _slashes + strlen(_slashes) - Min(Max(0, length - minus), strlen(_slashes));
}

static const char * _sharps = \
      "################################################################" \
      "################################################################" \
      "################################################################" \
      "################################################################" \
      "################################################################" \
      "################################################################" \
      "################################################################" \
      "################################################################";

public const char * sharps(int length, int minus)
{
   return _sharps + strlen(_sharps) - Min(Max(0, length - minus), strlen(_sharps));
}

public char * copyCamelCaseString(const char * string)
{
   char * s = CopyString(string);
   *s = (char)tolower(*s);
   return s;
}

public char * strcpySubstring(char * string, const char * substring, const char * replace)
{
   char * b, * d;
   const char * s, * r;
   //if(strlen(substring) >= strlen(replace)
   b = strstr(string, substring);
   if(b)
   {
      for(s = substring, r = replace, d = b; *b; b++)
      {
         if(*r && *s)
         {
            *d++ = *r;
            s++;
            r++;
         }
         else if(*s)
            s++;
         else
            *d++ = *b;
      }
      *d = 0;
   }
   return string;
}

public char * copySpecialSingleCharName(const char * name)
{
   char * s = new char[2];
   *s = (char)tolower(*name);
   if(*s == 'v') *s = 'x';
   s[1] = 0;
   return s;
}

char * getNoNamespaceString(const char * str, char * buffer, bool camelCase)
{
   uint len = strlen(str);
   char * output = buffer ? buffer : new char[len+1];
   char * o = output;
   const char * i = str;
   /*uint t;
   for(t = 0; t <= len; t++)
      output[t] = 0;*/
   while(*i)
   {
      uint kl; // keep length
      uint dl; // discard length
      char * part = strstr(i, "::");
      if(part)
      {
         int n;
         dl = part - i + 2;
         for(n = part - i - 1; n >= 0 && (isalpha(i[n]) || i[n] == '_' || isdigit(i[n]))/*!isspace(i[n])*/; n--)
            ;
         kl = n + 1;
         for(n = dl; i[n] && (isalpha(i[n]) || i[n] == '_' || isdigit(i[n]) || i[n] == ':'); n++)
         {
            if(i[n] == ':')
            {
               if(i[n+1] == ':' && (isalpha(i[n+2]) || i[n+2] == '_'))
               {
                  n++;
                  dl = n+1;
               }
               else
               {
                  //assert(0);
                  break;
               }
            }
         }
      }
      else
      {
         kl = dl = strlen(i);
      }
      if(kl)
      {
         strncpy(o, i, kl);
         o += kl;
      }
      i += dl;
      if(!part)
         break;
   }
   *o = 0;
   if(camelCase)
      *output = (char)tolower(*output);
   return output;
}
