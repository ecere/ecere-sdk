import "ecere"

// Numbers separated by commas, * makes rest of line a comment
char File_NextChar(File f)
{
   char ch;
   while(!f.eof)
   {
      ch = ' ';
      while(isspace(ch))
         f.Getc(&ch);
      if(ch == '*')
         while(ch != '\n')
            f.Getc(&ch);
      else
         return ch;
  }
  return 0;
}

int File_GetNumber(File f)
{
   char ch;
   int sign=1;
   int num;

   num=0;
   if((ch=File_NextChar(f))=='-')
   {
      sign=-1;
      ch=File_NextChar(f);
   }
   while (isdigit(ch))
   {
     num=num*10+ch-'0';
     ch=File_NextChar(f);
   }
   return num*sign;
}

// Seek for a string then return a value
static char line[256]="";
static char *pointer=line;

char * File_Find(File f, const char * string, bool reset)
{
   if(reset) { line[0]=0; pointer=line; return 0; }
   if(!string) return null;
   for(;;)
   {
      if(string[0])
      {
         if(strstr(pointer, string))
         {
            pointer=strstr(pointer, string)+strlen(string);
            return pointer;
         }
      }
      else if(pointer[0])
         return pointer;
      pointer=line;
      if(!f.GetLine(line, 256))
         return null;
   }
}

bool File_GetINT(File f, const char *string, int *data)
{
   uint16 c;
   char * str;
   *data = 0;
   str=File_Find(f, string, 0);
   if(!str) return 0;
   for(c=0; str[c]; c++)
      if(!isspace(str[c]) && str[c]!='\t') break;
   if(!str[c]) return false;
   if((str[c]!='-')&&(str[c]!='.')&&(!isdigit(str[c])))
      return false;
   *data=atoi(str+c);
   return true;
}

bool File_GetFLT(File f, const char *string, float *data)
{
   uint16 c;
   char * str;
   *data = 0;
   str=File_Find(f, string, 0);
   if(!str) return 0;
   for(c=0; str[c]; c++)
      if(!isspace(str[c]) && str[c]!='\t') break;
   if(!str[c]) return false;
   if((str[c]!='-')&&(str[c]!='.')&&(!isdigit(str[c])))
      return false;
   *data=(float)strtod(str+c, null);
   return true;
}

bool File_GetDBL(File f, const char *string, double *data)
{
   uint16 c;
   char * str;
   *data = 0;
   str=File_Find(f, string, 0);
   if(!str) return 0;
   for(c=0; str[c]; c++)
      if(!isspace(str[c]) && str[c]!='\t') break;
   if(!str[c]) return false;
   if((str[c]!='-')&&(str[c]!='.')&&(!isdigit(str[c])))
      return false;
   *data = strtod(str+c, null);
   return true;
}

bool File_GetSTR(File f, const char *string, char *data, uint16 max, bool enclosed)
{
   uint16 c,i;
   char * str;

   str=File_Find(f, string, 0);
   if(!str) return 0;
   if(enclosed)
   {
      for(c=0; str[c]; c++)
         if(str[c] == '\"')
            break;
   }
   else
   {
      for(c=0; str[c]; c++)
         if(str[c]!=32 && str[c] != '\t')
            break;
   }
   if(!str[c++]) return false;
   for(i=0; i<max-1; i++)
   {
      if(str[c]=='\"' || !str[c])
         break;
      else
         data[i]=str[c++];
   }
   data[i]=0;
   return true;
}
