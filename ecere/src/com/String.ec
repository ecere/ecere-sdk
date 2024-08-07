#define _Noreturn

namespace sys;

#define set _set
#define uint _uint
#define strlen _strlen

default:

#undef __BLOCKS__
#include <stdlib.h>
#include <stdarg.h>
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

/* Copyright (c) 2008-2010 Bjoern Hoehrmann <bjoern@hoehrmann.de> */
/* See http://bjoern.hoehrmann.de/utf-8/decoder/dfa/ for details. */

/* Returns 1 when data is insufficient, send more bytes */
default dllexport uint32 ccUtf8ToUnicode( uint32 b, uint32 *state, unichar *retunicode )
{
  uint32 type;
  static const byte utf8d[] =
  {
    /* The first part of the table maps bytes to character classes that */
    /* to reduce the size of the transition table and create bitmasks. */
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,  9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,
    7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,  7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
    8,8,2,2,2,2,2,2,2,2,2,2,2,2,2,2,  2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
    10,3,3,3,3,3,3,3,3,3,3,3,3,4,3,3, 11,6,6,6,5,8,8,8,8,8,8,8,8,8,8,8,
    /* The second part is a transition table that maps a combination */
    /* of a state of the automaton and a character class to a state. */
    0,12,24,36,60,96,84,12,12,12,48,72, 12,12,12,12,12,12,12,12,12,12,12,12,
    12, 0,12,12,12,12,12, 0,12, 0,12,12, 12,24,12,12,12,12,12,24,12,24,12,12,
    12,12,12,12,12,12,12,24,12,12,12,12, 12,24,12,12,12,12,12,12,12,24,12,12,
    12,12,12,12,12,12,12,36,12,36,12,12, 12,36,12,12,12,12,12,36,12,36,12,12,
    12,36,12,12,12,12,12,12,12,12,12,12
  };
  type = utf8d[b];
  *retunicode = ( (*state != 0) ? ( ( b & 0x3fu ) | ( *retunicode << 6 ) ) : ( ( 0xff >> type ) & ( b ) ) );
  *state = utf8d[ 256 + *state + type ];
  return *state;
}

import "instance"

default extern Platform runtimePlatform;

#define IS_ALUNDER(ch) ((ch) == '_' || isalnum((ch)))

public define DIR_SEP   = (__runtimePlatform == win32) ? '\\' : '/';
public define DIR_SEPS  = (__runtimePlatform == win32) ? "\\" : "/";

// Maximum length for a vsnprintf string
public define MAX_F_STRING = 1025;

// Maximum length for a directories and filenames strings
public define MAX_EXTENSION = 17;  // 16 + \0
public define MAX_FILENAME = 274; // 256 chars + extension + dot + \0
public define MAX_DIRECTORY = 534; // 8 levels + 8 separators + \0
public define MAX_LOCATION = 797; // directory + filename + separator + \0

// --- File related String functions ---
public char * GetExtension(const char * string, char * output)
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

public char * StripLastDirectory(const char * string, char * output)
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

public char * GetLastDirectory(const char * string, char * output)
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

public bool SplitArchivePath(const char * fileName, char * archiveName, const char * * archiveFile)
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

public char * PathCatSlash(char * string, const char * addedPath)
{
   bool modified = false;
   if(addedPath)
   {
      char fileName[MAX_LOCATION] = "", archiveName[MAX_LOCATION] = "";
      const char * file = null;
      int c = 0;
      bool isURL = false;
      bool isArchive = SplitArchivePath(string, archiveName, &file);
      char * urlFileName = null;
      char * protocolSymbol;

      strcpy(fileName, isArchive ? file : string);

      if(!isArchive) // TODO: Support for PathCat'ing .. outside of archive
      {
         protocolSymbol = (fileName[0] && fileName[0] != '.' && fileName[0] != '/' && fileName[0] != '\\' && fileName[1] != ':') ? strstr(fileName, "://") : null;
         if(protocolSymbol)
         {
            char * slash = strstr(protocolSymbol + 3, "/");
            isURL = true;
            if(slash)
               urlFileName = slash;
            else
               urlFileName = fileName + strlen(fileName);
         }
      }

      protocolSymbol = (addedPath[0] && addedPath[0] != '.' && addedPath[0] != '/' && addedPath[0] != '\\' && addedPath[1] != ':') ? strstr(addedPath, "://") : null;
      if(protocolSymbol)
      {
         int len = protocolSymbol - addedPath + 3;
         memcpy(fileName, addedPath, len);
         fileName[len] = 0;
         isURL = true;
         c = len;
      }
      else if(__runtimePlatform == win32)
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
         if(__runtimePlatform == win32)
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
                  for(;strLen > -1 && (ch = fileName[strLen]) && (ch == '/' || ch == '\\'); strLen--);
                  for(;strLen > -1 && (ch = fileName[strLen]) && (ch != '/' && ch != '\\' && ch != ':'); strLen--);
                  for(;strLen > -1 && (ch = fileName[strLen]) && (ch == '/' || ch == '\\'); strLen--);

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
                     if(__runtimePlatform == win32)
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
                           if(string[0] == '/')
                           {
                              // Absolute path
                              fileName[0] = '/';
                              fileName[1] = '\0';
                           }
                           else
                           {
                              // Relative path
                              fileName[0] = '.';
                              fileName[1] = '/';
                              fileName[2] = '\0';
                           }
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
                  return null;   // AN ERROR OCCURRED!

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

public char * PathCat(char * string, const char * addedPath)
{
   bool modified = false;
   if(addedPath)
   {
      char fileName[MAX_LOCATION] = "", archiveName[MAX_LOCATION] = "";
      const char * file = null;
      int c = 0;
      bool isURL = false;
      bool isArchive = SplitArchivePath(string, archiveName, &file);
      char * urlFileName = null;
      char * protocolSymbol;

      strcpy(fileName, isArchive ? file : string);

      if(!isArchive) // TODO: Support for PathCat'ing .. outside of archive
      {
         protocolSymbol = (fileName[0] && fileName[0] != '.' && fileName[0] != '/' && fileName[0] != '\\' && fileName[1] != ':') ? strstr(fileName, "://") : null;
         if(protocolSymbol)
         {
            char * slash = strstr(protocolSymbol + 3, "/");
            isURL = true;
            if(slash)
               urlFileName = slash;
            else
               urlFileName = fileName + strlen(fileName);
         }
      }

      protocolSymbol = (addedPath[0] && addedPath[0] != '.' && addedPath[0] != '/' && addedPath[0] != '\\' && addedPath[1] != ':') ? strstr(addedPath, "://") : null;
      if(protocolSymbol)
      {
         int len = protocolSymbol - addedPath + 3;
         memcpy(fileName, addedPath, len);
         fileName[len] = 0;
         isURL = true;
         c = len;
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
                  for(;strLen > -1 && (ch = fileName[strLen]) && (ch == '/' || ch == '\\'); strLen--);
                  for(;strLen > -1 && (ch = fileName[strLen]) && (ch != '/' && ch != '\\' && ch != ':'); strLen--);
                  for(;strLen > -1 && (ch = fileName[strLen]) && (ch == '/' || ch == '\\'); strLen--) separator = true;

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
                           if(string[0] == '/')
                           {
                              // Absolute path
                              fileName[0] = '/';
                              fileName[1] = '\0';
                           }
                           else
                           {
                              // Relative path
                              fileName[0] = '.';
                              fileName[1] = '/';
                              fileName[2] = '\0';
                           }
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
                  return null;   // AN ERROR OCCURRED!

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

public char * MakePathRelative(const char * path, const char * to, char * destination)
{
   int len;
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
   len = strlen(destination);
   if(len>1 && (destination[len-1] == '/' || destination[len-1] == '\\'))
      destination[--len] = '\0';
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

public char * ChangeExtension(const char * string, const char * ext, char * output)
{
   if(string != output)
      strcpy(output, string);
   StripExtension(output);
   if(ext[0])
      strcat(output, ".");
   strcat(output, ext);
   return output;
}

public bool IsPathInsideOf(const char * path, const char * of)
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

// --- String Stuff (Temporarily outside String class) ---
public void PrintSize(char * string, uint64 size, int prec)
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
      sprintf(string, "%d B", (uint)size);
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

public bool ishexdigit(char x)
{
   return (isdigit(x) || (x >= 'a' && x<='f') || (x >= 'A' && x <= 'F'));
}

public char * SearchString(const char * buffer, int start, const char * subStr, bool matchCase, bool matchWord)
{
   if(buffer && subStr)
   {
      const char * ptr;
      const char * strBuffer = buffer + start;
      int subLen = strlen(subStr);
      char beforeChar = start ? *(strBuffer-1) : 0;
      int (*strcompare)(const char *, const char *, uintsize) = matchCase ? strncmp : strnicmp;

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
                  return (char *)ptr;
            }
            else
            {
               if(!strcompare(ptr,subStr,subLen))
                  return (char *)ptr;
            }
         }
         beforeChar = ptr[0];
      }
   }
   return null;
}

public char * RSearchString(const char * buffer, const char * subStr, int maxLen, bool matchCase, bool matchWord)
{
   if(buffer && subStr)
   {
      int subLen = strlen(subStr);
      const char * ptr1 = buffer + maxLen - subLen;
      const char * ptr2 = ptr1 - 1;
      int (*strcompare)(const char *, const char *, uintsize) = matchCase ? strncmp : strnicmp;
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

                 return (char *)ptr1;
            }
            else
            {
               if(!strcompare(ptr1,subStr,subLen))
                  return (char *)ptr1;
            }
         }
      }
   }
   return null;
}

// NOTE: The 'len' is a stop on the SOURCE string, and these functions are missing a stop on the destination string
public int UnescapeCString(char * d, const char * s, int len)
{
   /*
    * Remove c escape sequences from a string:
    * if non-standard sequences are present, (eg: "\z"),
    * the leading backslash is __removed__.
    * */
   return _UnescapeCString(d, s, len, false);}

public int UnescapeCStringLoose(char * d, const char * s, int len)
{
   /*
    * Remove c escape sequences from a string:
    * if non-standard sequences are present, (eg: "\z"),
    * the leading backslash is __kept__.
    * */
   return _UnescapeCString(d, s, len, true);
}

// TOFIX: THIS DOESN'T HANDLE NUMERIC ESCAPE CODES (OCTAL/HEXADECIMAL...)?
static inline int _UnescapeCString(char * d, const char * s, int len, bool keepBS)
{
   /*
    * Remove c escape sequences from a string:
    * if non-standard sequences are present, (eg: "\z", the leading backslash
    * is removed or kept depending to the value of the boolean parameter
    * keepBS with obvious meaning.
    **/
   int j = 0, k = 0;
   char ch;
   while(j < len && (ch = s[j]))
   {
      switch(ch)
      {
         case '\\':
            switch((ch = s[++j]))
            {
               case 'n': d[k] = '\n'; break;
               case 't': d[k] = '\t'; break;
               case 'a': d[k] = '\a'; break;
               case 'b': d[k] = '\b'; break;
               case 'f': d[k] = '\f'; break;
               case 'r': d[k] = '\r'; break;
               case 'v': d[k] = '\v'; break;
               case '\\': d[k] = '\\'; break;
               case '\"': d[k] = '\"'; break;
               case '\'': d[k] = '\''; break;
               default: d[k] = '\\'; d[k+(int)keepBS] = ch;
            }
            break;
         default:
            d[k] = ch;
      }
      j++, k++;
   }
   d[k] = '\0';
   return k;
}

public class EscapeCStringOptions : uint32
{
public:
   bool escapeSingleQuote:1;
   bool escapeDoubleQuotes:1;
   bool writeQuotes:1;
   bool multiLine:1;
   int indent:16;
};

// TODO: Review... See also copyEscapeString() and strescpy() extras/stringTools.ec, WriteONString() in JSON.ec
public int EscapeCString(String outString, int bufferLen, const String s, EscapeCStringOptions options)
{
   uintsize actualIndent = 3 * options.indent;
   int d = 0, c = 0;
   const char * string = s;
   char ch;

   if(!options)
      options.escapeDoubleQuotes = true; // default to double quotes if nothing is specified

   if(options.writeQuotes)
      outString[d++] = '\"';
   while(d + 2 < bufferLen)
   {
      ch = string[c++];
      // TODO: Properly handle all necessary escapes
           if(ch == '\"' && options.escapeDoubleQuotes) outString[d++] = '\\', outString[d++] = '\"';
      else if(ch == '\'' && options.escapeSingleQuote)  outString[d++] = '\\', outString[d++] = '\'';
      else if(ch == '\\') outString[d++] = '\\', outString[d++] = '\\';
      else if(ch == '\t') outString[d++] = '\\', outString[d++] = 't';
      else if(ch == '\b') outString[d++] = '\\', outString[d++] = 'b';
      else if(ch == '\r') outString[d++] = '\\', outString[d++] = 'r';
      else if(ch == '\f') outString[d++] = '\\', outString[d++] = 'f';
      else if(ch == '\n')
      {
         outString[d++] = '\\', outString[d++] = 'n';
         if(options.multiLine && options.writeQuotes)
         {
            outString[d++] = '\"';
            outString[d++] = '\n';
            memset(outString+d, ' ', actualIndent);
            d += actualIndent;
            outString[d++] = '\"';
         }
      }
      /*
      // Special code for JSON writer to add an automatic newline for <br> as this is how we imported documentor data...
      else if(c >= 4 && ch == '>' && string[c-2] == 'r' && string[c-3] == 'b' && string[c-4] == '<' &&
             options.multiLine && options.writeQuotes)
      {
         int i;
         outString[d++] = '>';
         outString[d++] = '\"', outString[d++] = '\n';
         for(i = 0; i <= options.indent; i++)
            outString[d++] = ' ', outString[d++] = ' ', outString[d++] = ' ';
         outString[d++] = '\"';
      }
      */
      else if(ch)
         outString[d++] = ch;
      else
         break;
   }
   if(options.writeQuotes)
      outString[d++] = '\"';
   outString[d] = 0;
   return d;
}

//public define gnuMakeCharsNeedEscaping = "$%";
//public define windowsFileNameCharsNotAllowed = "*/:<>?\\\"|";
//public define linuxFileNameCharsNotAllowed = "/";
//public define windowsFileNameCharsNeedEscaping = " !%&'()+,;=[]^`{}~"; // "#$-.@_" are ok
//public define linuxFileNameCharsNeedEscaping = " !\"$&'()*:;<=>?[\\`{|"; // "#%+,-.@]^_}~" are ok

// fix #139 to remove " = 2" and warnings for backward compatible calls to Tokenize using 'true' for the 'esc' argument;
public enum BackSlashEscaping : bool { forArgsPassing = 2 };
public int Tokenize(char * string, int maxTokens, char* tokens[], BackSlashEscaping esc)
{
   const char * escChars, * escCharsQuoted;
   int count = 0;
   bool quoted = false, escaped = false;
   char * start = null, * output = string;
   char ch;
   if(__runtimePlatform == win32)
   {
//define windowsFileNameCharsNeedEscaping = " !%&'()+,;=[]^`{}~"; // "#$-.@_" are ok
      escChars = " !\"%&'()+,;=[]^`{}~"; // windowsFileNameCharsNeedEscaping;
      escCharsQuoted = "\"";
   }
   else
   {
//define linuxFileNameCharsNeedEscaping = " !\"$&'()*:;<=>?[\\`{|"; // "#%+,-.@]^_}~" are ok
      escChars = " !\"$&'()*:;<=>?[\\`{|"; // linuxFileNameCharsNeedEscaping;
      escCharsQuoted = "\"()$";
   }

   for(; (ch = *string) && count<maxTokens; string++, output++)
   {
      bool wasEscaped = escaped;
      if(output != string)
         *output = ch;
      if(start)
      {
         if(escaped)
         {
            escaped = false;
            output--;
            *output = ch;
         }
         else if(ch == '\"')
         {
            quoted ^= true;
            output--;
         }
         else if(ch == ' ' && !quoted)
         {
            tokens[count++] = start;
            *output = '\0';
            start = null;
         }
      }
      else if(ch != ' ')
      {
         if(ch == '\"')
         {
            quoted = true;
            start = output+1;
         }
         else
            start = output;
      }
      if(!wasEscaped && ch == '\\' && ( esc == true || (esc == forArgsPassing && strchr(quoted ? escCharsQuoted : escChars, *(string+1))) ))
         escaped = true;
   }
   if(start && count < maxTokens)
   {
      tokens[count++] = start;
      *output = '\0';
   }
   return count;
}

public int TokenizeWith(char * string, int maxTokens, char* tokens[], const char * tokenizers, bool escapeBackSlashes)
{
   int count = 0;
   bool quoted = false;
   char * start = null;
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

public char * TrimLSpaces(const char * string, char * output)
{
   int c;
   for(c = 0; string[c] && string[c] == ' '; c++);
   memmove(output, string + c, strlen(string+c)+1);
   return output;
}

public char * TrimRSpaces(const char * string, char * output)
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

public char * StripChars(String string, const String chars)
{
   int i, j;
   char ch;

   for(i = 0, j = 0; (ch = string[i]); i++)
   {
      if(!strchr(chars, ch))
      {
         if(i != j)
            string[j] = ch;
         j++;
      }
   }
   string[j] = 0;
   return string;
}

public void ChangeCh(char * string, char ch1, char ch2)
{
   int c;
   for(c=0; string[c]; c++)
      if(string[c] == ch1) string[c] = ch2;
}

public void ChangeChars(char * string, const char * chars, char alt)
{
   int c;
   for(c=0; string[c]; c++)
      if(strchr(chars, string[c])) string[c] = alt;
}

public void RepeatCh(char * string, int count, char ch)
{
   int c;
   for(c=0; c<count; c++)
      string[c] = ch;
   string[c] = 0;
}

public char * CopyString(const char * string)
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

public bool GetString(const char ** buffer, char * string, int max)
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

public int GetValue(const char ** buffer)
{
   char string[20];
   GetString(buffer,string,20);
   return atoi(string);
}

public uint GetHexValue(const char ** buffer)
{
   char string[20];
   GetString(buffer,string,20);
   return (uint)strtoul(string, null, 16);
}

public char * StripQuotes(const char * string, char * output)
{
   int len;
   const char * src = (string[0] == '\"') ? (string+1) : string;
   memmove(output, src, strlen(src)+1);
   len = strlen(output);
   if(len && output[len-1] == '\"')
      output[len-1] = '\0';
   return output;
}

public double FloatFromString(const char * string)
{
   int c, dig;
   double dec = 0, res = 0;
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

public enum StringAllocType { pointer, stack, heap };
public class ZString
{
public:
   char * _string;
   int len;
   StringAllocType allocType;
   int size;
   int minSize;
   int maxSize;

   ZString()
   {
      maxSize = MAXINT;
   }

   ~ZString()
   {
      if(allocType == heap)
         delete _string;
   }

   void copyString(const char * value, int newLen)
   {
      if(allocType == pointer)
      {
         size = 0;
         _string = null;
         allocType = heap;
      }
      if(allocType == heap)
      {
         int newSize = newLen ? newLen + 1 : 1;
         if(newSize != size)
         {
            if(newSize < minSize) newSize = minSize;
            else if(newSize > maxSize) newSize = maxSize;

            if(newSize && size)
               _string = renew _string char[newSize];
            else if(newSize)
               _string = new char[newSize];
            else
               delete _string;
            size = newSize;
         }
      }
      if(newLen + 1 > size) newLen = size-1;
      len = newLen;

      if(value)
      {
         memcpy(_string, value, newLen);
         _string[newLen] = 0;
      }
   }

public:

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      return _string;
   }

   bool OnGetDataFromString(const char * string)
   {
      property::string = (char *)string;
      return true;
   }

   property const char * string
   {
      set { copyString(value, value ? strlen(value) : 0); }
      get { return _string; }
   }

   property const char *
   {
      get { return _string; }
      set
      {
         return
         {
            len = value ? strlen(value) : 0;
            _string = (char *)value;
            allocType = pointer;
         };
      }
   }
   property const String
   {
      get { return _string; }
      set
      {
         return
         {
            len = value ? strlen(value) : 0;
            _string = (char *)value;
            allocType = pointer;
         };
      }
   }

   void concatf(const char * format, ...)
   {
      if(format && allocType != pointer)
      {
         int addedLen, n;
         va_list args;

         if(size < minSize)
         {
            _string = renew _string char[minSize];
            size = minSize;
         }
         n = Max(0, size - 1 - len);
         if(n < 64)
         {
            size += 64 - n;
            _string = renew _string char[size];
            n = Max(0, size - 1 - len);
         }

         while(true)
         {
            va_start(args, format);
            addedLen = vsnprintf(_string + len, n, format, args);
            if(addedLen >= 0 && addedLen < n)
               break;
            addedLen = Max(n+Max(1, size / 2), addedLen);
            size += addedLen + 1 - n;
            _string = renew _string char[size];
            n = Max(0, size - 1 - len);
         }
         if(addedLen > 0)
         {
            len += addedLen;
            _string[len] = 0;
         }
         va_end(args);
      }
   }

   void concat(ZString s)
   {
      if(s && allocType != pointer)
      {
         int addedLen = s.len;
         int newLen = len + addedLen;
         if(allocType == heap && newLen + 1 > size)
         {
            int newSize = newLen + 1;
            if(newSize > maxSize)
               newSize = maxSize;
            if(newSize > size)
            {
               _string = renew _string char[newSize];
               size = newSize;
            }
         }
         if(newLen + 1 > size)
            addedLen = size - 1 - len;
         if(addedLen > 0)
         {
            memcpy(_string + len, s._string, addedLen);
            len += addedLen;
         }
         _string[len] = 0;

         // WARNING: auto-decref'ing for now when s is of pointer type!
         if(s.allocType == pointer)
            delete s;
      }
   }

   void concatx(const typed_object object, ...)
   {
      if(allocType != pointer)
      {
         // TODO: improve this to work directly on the Array<char> instead of calling PrintStdArgsToBuffer
         char string[MAX_F_STRING];
         va_list args;
         // int len;
         va_start(args, object);
         /*len = */PrintStdArgsToBuffer(string, sizeof(string), object, args);
         concat(string);
         va_end(args);
      }
   }

   void concatn(ZString s, int l)
   {
      if(s && allocType != pointer)
      {
         int addedLen = l;
         int newLen = len + addedLen;
         if(allocType == heap && newLen + 1 > size)
         {
            int newSize = newLen + 1;
            if(newSize > maxSize)
               newSize = maxSize;
            if(newSize > size)
            {
               _string = renew _string char[newSize];
               size = newSize;
            }
         }
         if(newLen + 1 > size)
            addedLen = size - 1 - len;
         if(addedLen > 0)
         {
            memcpy(_string + len, s._string, addedLen);
            len += addedLen;
         }
         _string[len] = 0;
         // WARNING: auto-decref'ing for now when s is of pointer type!
         if(s.allocType == pointer)
            delete s;
      }
   }

   void copy(ZString s)
   {
      copyString(s._string, s.len);

      // WARNING: auto-decref'ing for now when s is of pointer type!
      if(s.allocType == pointer)
         delete s;
   }
};

public char * strchrmax(const char * s, int c, int max)
{
   int i;
   char ch;
   for(i = 0; i < max && (ch = s[i]); i++)
      if(ch == c)
         return (char *)s + i;
   return null;
}

#define MAX_WILDCARD 300

public bool StringLikePattern(const String string, const String pattern)
{
   bool result = true;
   int wildcardPosition[MAX_WILDCARD], stringPosition[MAX_WILDCARD], currentWildcard = 0;
   int i, j;
   char chp;
   bool lastWasWildcard = false;

   for(i = 0, j = 0; (chp = pattern[i]); i++, j++)
   {
      char chs = string[j];

      lastWasWildcard = false;
      if(chs && chp == '_')
      {
         // Match any single char (but it might be multiple bytes for unicode chars)
         int nb;
         UTF8GetChar(string + j, &nb);
         j += nb - 1;
      }
      else
      {
         if(chp == '%')
         {
            if(pattern[i+1] == '%')
               i++;  // Escaped (%%) actual % to match
            else
            {
               lastWasWildcard = true;
               // Wildcard
               if(chs && currentWildcard < MAX_WILDCARD)
               {
                  wildcardPosition[currentWildcard] = i;
                  stringPosition[currentWildcard] = j;
                  currentWildcard++;
               }
               j--; // Start trying at j
               continue;
            }
         }

         if(chs != chp ||
            // Avoid exiting loop if there is a left over on the string and the pattern is over
            (!lastWasWildcard && currentWildcard && string[j+1] && !pattern[i+1]))
         {
            // Mismatch, abort or continue trying to match wildcard
            if(currentWildcard)
            {
               currentWildcard--;
               i = wildcardPosition[currentWildcard]-1;
               j = stringPosition[currentWildcard];
            }
            else
            {
               if(!lastWasWildcard || pattern[i + 1])
                  result = false;
               break;
            }
         }
      }
   }
   // Mismatch if we have any character left in the string and are not still in a wildcard
   if(!lastWasWildcard && string[j])
      result = false;
   return result;
}
