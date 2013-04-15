namespace sys;

#define set _set
#define uint _uint
#define strlen _strlen

default:

#undef __BLOCKS__
#include <stdlib.h>
#if !defined(ECERE_BOOTSTRAP) // quick fix for now
#if defined(__WIN32__)
#define WIN32_LEAN_AND_MEAN
#define String _String
#include <windows.h>
#undef String
#else
#include <unistd.h>
#endif
#endif

#undef uint
#undef set
#undef strlen
private:

import "instance"

default extern Platform runtimePlatform;

#define IS_ALUNDER(ch) ((ch) == '_' || isalnum((ch)))

public define DIR_SEP   = (GetRuntimePlatform() == win32) ? '\\' : '/';
public define DIR_SEPS  = (GetRuntimePlatform() == win32) ? "\\" : "/";

// Maximum length for a vsnprintf string
public define MAX_F_STRING = 1025;

// Maximum length for a directories and filenames strings
public define MAX_EXTENSION = 17;  // 16 + \0
public define MAX_FILENAME = 274; // 256 chars + extension + dot + \0
public define MAX_DIRECTORY = 534; // 8 levels + 8 separators + \0
public define MAX_LOCATION = 797; // directory + filename + separator + \0

// --- File related String functions ---
public char * GetExtension(char * string, char * output)
{
   int c;
   int len = strlen(string);
   int limit = Max(0, len-MAX_EXTENSION);
   output[0] = '\0';
   for(c = len; c>=limit; c--)
   {
      char ch = string[c];
      if(ch == '.')
      {
         strcpy(output, string+c+1);
         break;
      }
      else if(ch == '/' || ch == '\\')
         break;
   }
   return output;
}

public char * StripLastDirectory(char * string, char * output)
{
   int c;
   if(runtimePlatform == win32 && !strcmp(string, "\\\\"))
   {
      strcpy(output, "/");
      return output;
   }
   else
   {
      int len = strlen(string);
      for(c = len-2; c>=0; c--)
         if(string[c] == '/' || string[c] == '\\')
            break;
         else if(string[c] == '>' || (string[c] == ':' && c == 0))
         {
            c++;
            break;
         }

      if((runtimePlatform == win32) ? (c >= 0) : (c > 0))
      {
         memmove(output, string, c);
         if(c > 0)
         {
            if(runtimePlatform == win32 && c == 1 && output[0] == '\\' && output[1] == '\\')
               output[2] = '\0';
            else
               output[c] = '\0';
         }
         else
            strcpy(output, DIR_SEPS);
         return output;
      }
      else
      {
         // Return root on UNIX instead of null...
         if(c == 0)
         {
            strcpy(output, DIR_SEPS);
            return output;
         }
         else
         {
            strcpy(output, "");
            return null;
         }
      }
   }
}

public char * SplitDirectory(const char * string, char * part, char * rest)
{
   int len = 0;
   char ch;
   int c = 0;
   for(;(ch = string[c]) && (ch == '/' || ch == '\\'); c++);

   if(c)
      part[len++] = DIR_SEP;
   else
   {
      for(;(ch = string[c]) && (ch != '/' && ch != '\\'); c++)
      {
         if(len < MAX_FILENAME)
            part[len++] = ch;  
      }
   }

   for(;(ch = string[c]) && (ch == '/' || ch == '\\'); c++);
   memmove(rest, string + c, strlen(string + c) + 1);
   for(c = strlen(rest); c >= 0; c--)
      if(ch != '/' && ch != '\\') 
         break;
   if(c > 0)
      rest[c] = '\0';

   part[len] = '\0';
   return rest;
}

public char * GetLastDirectory(char * string, char * output)
{
   int c;
   int len = string ? strlen(string) : 0;
   for(c = len-2; c>=0; c--)
      if(string[c] == '/' || string[c] == '\\' || string[c] == ':' || string[c] == '>')
         break;

   c++;
   if(c >= 0)
      memmove(output, string+c, strlen(string+c)+1);
   else
      output[0] = '\0';

   len = strlen(output);
   if(len > 1 && (output[len-1] == '\\' || output[len-1] == '/'))
      output[len-1] = '\0';   
   return output;
}

public bool SplitArchivePath(char * fileName, char * archiveName, char ** archiveFile)
{
   // Support Archives
   if(fileName[0] == '<')
   {
      int c = strlen(fileName);
      for(;c>0 && fileName[c] != '>'; c--);
      if(c > 0)
      {
         strncpy(archiveName, fileName + 1, c - 1);
         archiveName[c - 1] = '\0';
         *archiveFile = fileName + c + 1;
         return true;
      }
   }
   else if(fileName[0] == ':')
   {
      strcpy(archiveName, ":");
      *archiveFile = fileName + 1;
      return true;
   }
   return false;
}

public char * PathCatSlash(char * string, char * addedPath)
{
   bool modified = false;
   if(addedPath)
   {
      char fileName[MAX_LOCATION] = "", archiveName[MAX_LOCATION] = "", * file;
      int c = 0;
      bool isURL = false;
      char * urlFileName;

      if(SplitArchivePath(string, archiveName, &file))
         strcpy(fileName, file);
      else
      {
         strcpy(fileName, string);
      }

      if(strstr(string, "http://") == string)
      {
         char * slash = strstr(fileName + 7, "/");
         isURL = true;
         if(slash)
            urlFileName = slash;
         else
            urlFileName = fileName + strlen(fileName);
      }
      if(strstr(addedPath, "http://") == addedPath)
      {
         strcpy(fileName, "http://");
         isURL = true;
         c = 7;
      }
      else if(GetRuntimePlatform() == win32)
      {
         if(addedPath[0] && addedPath[1] == ':' && addedPath[0] != '<')
         {
            fileName[0] = (char)toupper(addedPath[0]);
            fileName[1] = ':';
            fileName[2] = '\0';
            c = 2;
            modified = true;
         }
         else if(addedPath[0] == '\\' && addedPath[1] == '\\')
         {
            fileName[0] = fileName[1] = '\\';
            fileName[2] = '\0';
            c = 2;
            modified = true;
         }
         // A drive needs to be selected
         /* TOCHECK: Cutting this out, can't handle relative path
         else if(fileName[0] == '/' && !archiveName[0] && strcmp(addedPath, "/"))
            return null;
         */
      }

      if(!modified && isURL && (addedPath[0] == '\\' || addedPath[0] == '/'))
      {
         urlFileName[0] = '/';
         urlFileName[1] = '\0';
      }
      else if(!modified && (addedPath[0] == '\\' || addedPath[0] == '/'))
      {
         if(GetRuntimePlatform() == win32)
         {
            // Entire Computer
            if(addedPath[0] == '/' && !addedPath[1])
            {
               fileName[0] = addedPath[0];
               fileName[1] = '\0';
               modified = true;
            }
            // Root of drive
            else if(fileName[0] && fileName[1] == ':')
            {
               fileName[2] = '\0';
               modified = true;
            }
            // Relative path root of drive
            else
            {
               fileName[0] = '\\';
               fileName[1] = '\0';
               modified = true;
            }
         }
         else
         {
            fileName[0] = '/';
            fileName[1] = '\0';
            modified = true;
         }
         c = 1;
      }

      for(; addedPath[c]; )
      {
         // DANGER OF OVERFLOW HERE
         // char directory[MAX_FILENAME];
         char directory[MAX_FILENAME * 16];
         int len = 0;
         char ch;
         int count;
      
         for(;(ch = addedPath[c]) && (ch == '/' || ch == '\\'); c++);
         for(;(ch = addedPath[c]) && (ch != '/' && ch != '\\'); c++)
         {
            if(isURL && ch == '?')
            {
               break;
            }
            if(len < MAX_FILENAME)
               directory[len++] = ch;  
         }
         directory[len] = '\0';

         // Trim rightmost spaces
         for(count = len-1; count >= 0 && (directory[count] == ' ' || directory[count] == '\t'); count--)
         {
            directory[count] = '\0';
            len--;
         }

         if(len > 0)
         {
            modified = true;
            if(strstr(directory, "..") == directory && (!directory[2] || directory[2] == DIR_SEP || directory[2] == '/'))
            {
               int strLen = strlen(fileName) - 1;
               if(strLen > -1)
               {
                  // Go back one directory
                  for(;(ch = fileName[strLen]) && strLen > -1 && (ch == '/' || ch == '\\'); strLen--);
                  for(;(ch = fileName[strLen]) && strLen > -1 && (ch != '/' && ch != '\\' && ch != ':'); strLen--);
                  for(;(ch = fileName[strLen]) && strLen > -1 && (ch == '/' || ch == '\\'); strLen--);

                  if(isURL)
                  {
                     strLen = Max(strLen, urlFileName - fileName);
                  }
                  if(!strcmp(fileName + strLen + 1, ".."))
                  {
                     strcat(fileName, "/" /*DIR_SEPS*/);
                     strcat(fileName, "..");
                  }
                  else
                  {
                     if(GetRuntimePlatform() == win32)
                     {
                        if(!strLen && fileName[0] == '\\' && fileName[1] == '\\')
                        {
                           if(!fileName[2])
                              return null;
                           else
                           {
                              fileName[0] = '\\';
                              fileName[1] = '\\';
                              fileName[2] = '\0';
                           }
                        }
                        else
                           fileName[strLen+1] = '\0';
                     }
                     else
                     {
                        fileName[strLen+1] = '\0';
                        if(strLen<0)
                        {
                           fileName[0] = '/';
                           fileName[1] = '\0';
                           strLen = 2;
                        }
                     }
                  }
               }
               else
               {
                  strcpy(fileName, "..");
               }
            }
            else if(strcmp(directory, "."))
            {
               int strLen = strlen(fileName);
               bool notZeroLen = strLen > 0;
               // if(strLen > 1 && (fileName[strLen-1] == '/' || fileName[strLen-1] == '\\'))
               if(strLen > 0 && (fileName[strLen-1] == '/' || fileName[strLen-1] == '\\'))
                  strLen--;
               if(notZeroLen /*&& fileName[strLen-1] != ':' && fileName[strLen-1] != '>'*/)
                  fileName[strLen++] = '/';

               fileName[strLen] = '\0';

               if(strLen + strlen(directory) > MAX_LOCATION - 3)
                  return null;   // AN ERROR OCCURED!

               strcat(fileName, directory);
            }
         }
         if(isURL && ch == '/')
            strcat(fileName, "/");
         if(isURL && ch == '?')
         {
            strcat(fileName, addedPath+c);
            break;
         }
      }
      if(archiveName[0])
         sprintf(string, "<%s>%s", archiveName, fileName);
      else
         strcpy(string, fileName);
   }
   return modified ? string : null;
}

public char * PathCat(char * string, char * addedPath)
{
   bool modified = false;
   if(addedPath)
   {
      char fileName[MAX_LOCATION] = "", archiveName[MAX_LOCATION] = "", * file;
      int c = 0;
      bool isURL = false;
      char * urlFileName;

      if(SplitArchivePath(string, archiveName, &file))
         strcpy(fileName, file);
      else
      {
         strcpy(fileName, string);
      }

      if(strstr(string, "http://") == string)
      {
         char * slash = strstr(fileName + 7, "/");
         isURL = true;
         if(slash)
            urlFileName = slash;
         else
            urlFileName = fileName + strlen(fileName);
      }
      if(strstr(addedPath, "http://") == addedPath)
      {
         strcpy(fileName, "http://");
         isURL = true;
         c = 7;
      }
      else if(runtimePlatform == win32)
      {
         if(addedPath[0] && addedPath[1] == ':' && addedPath[0] != '<')
         {
            fileName[0] = (char)toupper(addedPath[0]);
            fileName[1] = ':';
            fileName[2] = '\0';
            c = 2;
            modified = true;
         }
         else if(addedPath[0] == '\\' && addedPath[1] == '\\')
         {
            fileName[0] = fileName[1] = '\\';
            fileName[2] = '\0';
            c = 2;
            modified = true;
         }
         // A drive needs to be selected
         else if(fileName[0] == '/' && !archiveName[0] && strcmp(addedPath, "/"))
            return null;
      }

      if(!modified && isURL && (addedPath[0] == '\\' || addedPath[0] == '/'))
      {
         urlFileName[0] = '/';
         urlFileName[1] = '\0';
      }
      else if(!modified && (addedPath[0] == '\\' || addedPath[0] == '/'))
      {
         if(runtimePlatform == win32)
         {
            // Entire Computer
            if(addedPath[0] == '/' && !addedPath[1])
            {
               fileName[0] = addedPath[0];
               fileName[1] = '\0';
               modified = true;
            }
            // Root of drive
            else if(fileName[0] && fileName[1] == ':')
            {
               fileName[2] = '\0';
               modified = true;
            }
            // Relative path root of drive
            else
            {
               fileName[0] = '\\';
               fileName[1] = '\0';
               modified = true;
            }
         }
         else
         {
            fileName[0] = '/';
            fileName[1] = '\0';
            modified = true;
         }
         c = 1;
      }

      for(; addedPath[c]; )
      {
         // DANGER OF OVERFLOW HERE
         // char directory[MAX_FILENAME];
         char directory[MAX_FILENAME * 16];
         int len = 0;
         char ch;
         int count;
      
         for(;(ch = addedPath[c]) && (ch == '/' || ch == '\\'); c++);
         for(;(ch = addedPath[c]) && (ch != '/' && ch != '\\'); c++)
         {
            if(isURL && ch == '?')
            {
               break;
            }
            if(len < MAX_FILENAME)
               directory[len++] = ch;  
         }
         directory[len] = '\0';

         // Trim rightmost spaces
         for(count = len-1; count >= 0 && (directory[count] == ' ' || directory[count] == '\t'); count--)
         {
            directory[count] = '\0';
            len--;
         }

         if(len > 0)
         {
            modified = true;
            if(strstr(directory, "..") == directory && (!directory[2] || directory[2] == DIR_SEP))
            {
               int strLen = strlen(fileName) - 1;
               if(strLen > -1)
               {
                  bool separator = false;

                  // Go back one directory
                  for(;(ch = fileName[strLen]) && strLen > -1 && (ch == '/' || ch == '\\'); strLen--);
                  for(;(ch = fileName[strLen]) && strLen > -1 && (ch != '/' && ch != '\\' && ch != ':'); strLen--);
                  for(;(ch = fileName[strLen]) && strLen > -1 && (ch == '/' || ch == '\\'); strLen--) separator = true;

                  if(isURL)
                  {
                     strLen = Max(strLen, urlFileName - fileName);
                  }
                  if(!strcmp(fileName + strLen + (separator ? 2 : 1), ".."))
                  {
                     strcat(fileName, DIR_SEPS);
                     strcat(fileName, "..");
                  }
                  else
                  {
                     if(runtimePlatform == win32)
                     {
                        if(!strLen && fileName[0] == '\\' && fileName[1] == '\\')
                        {
                           if(!fileName[2])
                              return null;
                           else
                           {
                              fileName[0] = '\\';
                              fileName[1] = '\\';
                              fileName[2] = '\0';
                           }
                        }
                        else
                           fileName[strLen+1] = '\0';
                     }
                     else
                     {
                        fileName[strLen+1] = '\0';
                        if(strLen<0)
                        {
                           fileName[0] = '/';
                           fileName[1] = '\0';
                           strLen = 2;
                        }
                     }
                  }
               }
               else
               {
                  strcpy(fileName, "..");
               }
            }
            else if(strcmp(directory, "."))
            {
               int strLen = strlen(fileName);
               bool notZeroLen = strLen > 0;
               // if(strLen > 1 && (fileName[strLen-1] == '/' || fileName[strLen-1] == '\\'))
               if(strLen > 0 && (fileName[strLen-1] == '/' || fileName[strLen-1] == '\\'))
                  strLen--;
               if(notZeroLen /*&& fileName[strLen-1] != ':' && fileName[strLen-1] != '>'*/)
               {
                  if(isURL)
                     fileName[strLen++] = '/';
                  else
                     fileName[strLen++] = DIR_SEP;
               }

               fileName[strLen] = '\0';

               if(strLen + strlen(directory) > MAX_LOCATION - 3)
                  return null;   // AN ERROR OCCURED!

               strcat(fileName, directory);
            }
         }
         if(isURL && ch == '/')
            strcat(fileName, "/");
         if(isURL && ch == '?')
         {
            strcat(fileName, addedPath+c);
            break;
         }
      }
      if(archiveName[0])
         sprintf(string, "<%s>%s", archiveName, fileName);
      else
         strcpy(string, fileName);
   }
   return modified ? string : null;
}

public char * MakePathRelative(char * path, char * to, char * destination)
{
   // Don't process empty paths
   if(!path[0])
      memmove(destination, path, strlen(path)+1);
   else
   {
      // TOFIX: DANGER OF OVERFLOW HERE
      char pathPart[MAX_FILENAME * 16], pathRest[MAX_LOCATION];
      char toPart[MAX_FILENAME * 16], toRest[MAX_LOCATION];
      bool different = false;

      strcpy(pathRest, path);
      strcpy(toRest, to);

      destination[0] = '\0';
      for(;toRest[0];)
      {
         SplitDirectory(toRest, toPart, toRest);      
         if(!different)
            SplitDirectory(pathRest, pathPart, pathRest);

         if(different || fstrcmp(toPart, pathPart))
         {
            different = true;
            strcat(destination, "..");
            strcat(destination, DIR_SEPS);
         }
      }

      if(different)
         PathCat(destination, pathPart);
      for(;pathRest[0];)
      {
         SplitDirectory(pathRest, pathPart, pathRest);
         PathCat(destination, pathPart);
      }
   }
   return destination;
}

public bool StripExtension(char * string)
{
   int c;
   for(c = strlen(string); c>=0; c--)
      if(string[c] == '.')
      {
         string[c] = '\0';
         return true;
      }
      else if(string[c] == '\\' || string[c] == '/')
         break;
   return false;
}

public char * ChangeExtension(char * string, char * ext, char * output)
{
   if(string != output)
      strcpy(output, string);
   StripExtension(output);
   if(ext[0])
      strcat(output, ".");
   strcat(output, ext);
   return output;
}

// --- String Stuff (Temporarily outside String class) ---
public void PrintSize(char * string, uint size, int prec)
{
   if(size > 1024)
   {
      char format[8];
      sprintf(format, "%%.0%df", prec);
      if(size > 1024 * 1024 * 1024)
      {
         sprintf(string, format, size / (float)(1024 * 1024 * 1024));
         strcat(string, " GB");
      }
      else if(size > 1024 * 1024)
      {
         sprintf(string, format, size / (float)(1024 * 1024));
         strcat(string, " MB");
      }
      else
      {
         sprintf(string, format, size / (float)1024);
         strcat(string, " KB");
      }
   }
   else
      sprintf(string, "%d B", size);
}

public void PrintBigSize(char * string, double size, int prec)
{
   if(size > 1024)
   {
      char format[8];
      sprintf(format, "%%.0%df", prec);
      if(size > 1024.0 * 1024.0 * 1024.0 * 1024.0)
      {
         sprintf(string, format, size / (1024 * 1024 * 1024.0 * 1024.0));
         strcat(string, " TB");
      }
      else if(size > 1024.0 * 1024.0 * 1024.0)
      {
         sprintf(string, format, size / (1024.0 * 1024.0 * 1024.0));
         strcat(string, " GB");
      }
      else if(size > 1024.0 * 1024.0)
      {
         sprintf(string, format, size / (1024.0 * 1024.0));
         strcat(string, " MB");
      }
      else
      {
         sprintf(string, format, size / 1024.0);
         strcat(string, " KB");
      }
   }
   else
      sprintf(string, "%.0f B", size);
}

public char * SearchString(char * buffer, int start, char * subStr, bool matchCase, bool matchWord)
{
   if(buffer && subStr)
   {
      char * ptr;
      char * strBuffer = buffer + start;
      int subLen = strlen(subStr);
      char beforeChar = start ? *(strBuffer-1) : 0;
      int (*strcompare)(const char *, const char *, unsigned int) = matchCase ? strncmp : strnicmp;

      for(ptr = strBuffer; *ptr; ptr++)
      {
         if(matchCase ? (*subStr == *ptr) : (tolower(*subStr) == tolower(*ptr)))
         {
            if(matchWord)
            {
               if(!strcompare(ptr,subStr,subLen) && 
                  /*
                  !IS_ALUNDER(ptr[subLen]) && 
                  !IS_ALUNDER(beforeChar))
                  */
                  (!IS_ALUNDER(subStr[subLen-1]) || !IS_ALUNDER(ptr[subLen])) && 
                  (!IS_ALUNDER(subStr[0]) || !IS_ALUNDER(beforeChar)))
                  return ptr;
            }
            else
            {
               if(!strcompare(ptr,subStr,subLen))
                  return ptr;
            }
         }
         beforeChar = ptr[0];  
      }
   }
   return null;
}

public char * RSearchString(char * buffer, char * subStr, int maxLen, bool matchCase, bool matchWord)
{
   if(buffer && subStr)
   {
      int subLen = strlen(subStr);
      char * ptr1 = buffer + maxLen - subLen;
      char * ptr2 = buffer + maxLen - subLen - 1;
      int (*strcompare)(const char *, const char *, unsigned int) = matchCase ? strncmp : strnicmp;
      for(; ptr1 >=buffer; ptr1--, ptr2--)
      {
         if(tolower(*subStr) == tolower(*ptr1))
         {
            if(matchWord)
            {
               if(!strcompare(ptr1,subStr,subLen) && 
                  //!IS_ALUNDER(ptr1[subLen]) && !IS_ALUNDER(*ptr2))
                  (!IS_ALUNDER(subStr[subLen-1]) || !IS_ALUNDER(ptr1[subLen])) && 
                  (!IS_ALUNDER(subStr[0]) || !IS_ALUNDER(*ptr2)))

                 return ptr1;
            }
            else
            {
               if(!strcompare(ptr1,subStr,subLen))
                  return ptr1;
            }
         }
      }
   }
   return null;
}

public int Tokenize(char * string, int maxTokens, char* tokens[], bool escapeBackSlashes)
{
   int count = 0;
   bool quoted = false;
   byte * start = null;
   bool escaped = false;
   char * output = string;

   for(; *string && count < maxTokens; string++, output++)
   {
      if(output != string)
         *output = *string;
      if(start)
      {
         if(escaped)
         {
            escaped = false;
            output--;

            // ADDED THIS HERE...
            if(output != string)
               *output = *string;
         }
         else if(escapeBackSlashes && *string == '\\')
            escaped = true;
         else if(*string == '\"')
         {
            if(quoted)
            {
               *output = '\0';
               quoted = false;
            }
            else
            {
               memmove(start + 1, start, string - (char *)start);
               start++;
            }
         }
         else if(*string == ' ' && !quoted)
         {
            tokens[count++] = start;
            *output = '\0';
            start = null;
         }
      }
      else if(*string != ' ')
      {
         if(*string == '\"')
         {
            quoted = true;
            start = output + 1;
         }
         else
         {
            start = output;
            if(*string == '\\' && escapeBackSlashes)
               escaped = true;
         }
      }
   }
   if(start && count < maxTokens)
   {
      tokens[count++] = start;
      *output = '\0';
   }
   return count;
}

public int TokenizeWith(char * string, int maxTokens, char* tokens[], char * tokenizers, bool escapeBackSlashes)
{
   int count = 0;
   bool quoted = false;
   byte * start = null;
   bool escaped = false;
   char * output = string;
   bool quotedFromStart = false;

   for(; *string && count < maxTokens; string++, output++)
   {
      if(output != string)
         *output = *string;
      if(start)
      {
         if(escaped)
         {
            escaped = false;
            output--;
            if(output != string)
               *output = *string;
         }
         else if(escapeBackSlashes && *string == '\\')
            escaped = true;
         else if(*string == '\"')
         {
            if(quoted)
            {
               if(quotedFromStart)
                  *output = '\0';
               quotedFromStart = false;
               quoted = false;
            }
            else
               quoted = true;
         }
         else if(strchr(tokenizers, *string) && !quoted)
         {
            tokens[count++] = start;
            *output = '\0';
            start = null;
         }
         // MOVED THIS INSIDE IF ABOVE...
         //if(output != string)
         //   *output = *string;
      }
      else if(!strchr(tokenizers, *string))
      {
         if(*string == '\"')
         {
            quotedFromStart = true;
            quoted = true;
            start = output + 1;
         }
         else
         {
            start = output;
            if(*string == '\\' && escapeBackSlashes)
               escaped = true;
         }
      }
   }
   if(start && count < maxTokens)
   {
      tokens[count++] = start;
      *output = '\0';
   }
   return count;
}

public char * TrimLSpaces(char * string, char * output)
{
   int c;
   for(c = 0; string[c] && string[c] == ' '; c++);
   memmove(output, string + c, strlen(string+c)+1);
   return output;
}

public char * TrimRSpaces(char * string, char * output)
{
   int c;
   for(c = strlen(string)-1; c >= 0 && string[c] == ' '; c--);
   if(c >= 0)
   {
      memmove(output, string, c+1);
      output[c+1] = '\0';
   }
   else
      output[0] = '\0';
   return output;
}

public void ChangeCh(char * string, char ch1, char ch2)
{
   int c;
   for(c=0; string[c]; c++)
      if(string[c] == ch1) string[c] = ch2;
}

public void RepeatCh(char * string, int count, char ch)
{
   int c;
   for(c=0; c<count; c++)
      string[c] = ch;
   string[c] = 0;
}

public char * CopyString(char * string)
{
   if(string)
   {
      int len = strlen(string);
      char * destination = new char[len+1];
      if(destination)
         memcpy(destination, string, len + 1);
      return destination;
   }
   else
      return null;
}

public bool GetString(char ** buffer, char * string, int max)
{
   int c;
   char ch;
   bool quoted = false;
   bool result = true;
   if(!**buffer) { string[0]=0; return false; }

   for(;;)
   {
      if(!(ch = *((*buffer)++)))
         result = false;
      if( (ch!='\n') && (ch!='\r') && (ch!=' ') && (ch!=',') && (ch!='\t'))
         break;
      if(!*(*buffer)) break;
   }
   if(result)
   {
      for(c=0; c<max-1; c++)
      {
         if(!quoted && ((ch=='\n')||(ch=='\r')||(ch==' ')||(ch==',')||(ch=='\t')))
         {
            result = true;
            break;
         }
         if(ch == '\"')
         {
            quoted ^= 1;
            c--;
         }
         else
            string[c]=ch;

         if(!(ch = *(*buffer)))
         {
            c++;
            //result = false;
            break;            
         }
         (*buffer)++;
      }
      string[c]=0;
   }
   return result;
}

public int GetValue(char ** buffer)
{
   char string[20];
   GetString(buffer,string,20);
   return atoi(string);
}

public uint GetHexValue(char ** buffer)
{
   char string[20];
   GetString(buffer,string,20);
   return (uint)strtoul(string, null, 16);
}

public char * StripQuotes(char * string, char * output)
{
   int len;
   char * src = (string[0] == '\"') ? (string+1) : string;
   memmove(output, src, strlen(src)+1);
   len = strlen(output);
   if(len && output[len-1] == '\"')
      output[len-1] = '\0';
   return output;
}

public double FloatFromString(char * string)
{
   int c, dig;
   float dec = 0,res = 0;
   int neg = 1;
   char ch;
   for(c = 0; string[c]; c++)
   {
      ch = string[c];
      if(ch == ' ') continue;
      if(ch == '-')
      {
         if(neg == -1) break;
         neg = -1;
      }
      else if((ch == '.') && !dec)
         dec = 10;
      else if(isdigit(ch))
      {
         dig = ch - '0';
         if(dec)
         {
            res += dig / dec;
            dec *= 10;
         }
         else
            res = res * 10 + dig;
      }
      else
         break;
   }
   return neg * res;
}

public bool IsPathInsideOf(char * path, char * of)
{
   if(!path[0] || !of[0])
      return false;  // What to do here? Ever used?
   else
   {
      char ofPart[MAX_FILENAME], ofRest[MAX_LOCATION];
      char pathPart[MAX_FILENAME], pathRest[MAX_LOCATION];
      strcpy(ofRest, of);
      strcpy(pathRest, path);
      for(; ofRest[0] && pathRest[0];)
      {
         SplitDirectory(ofRest, ofPart, ofRest);
         SplitDirectory(pathRest, pathPart, pathRest);
         if(fstrcmp(pathPart, ofPart))
            return false;
      }
      if(!ofRest[0] && !pathRest[0])  // paths are identical - should return false or true? (changed to false)
         return false;
      else if(!pathRest[0])           // not inside of, it's the other way around
         return false;
      return true;
   }
}
