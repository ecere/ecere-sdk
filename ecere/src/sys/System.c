#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>

#define UNICODE

#if (defined(__unix__) || defined(__APPLE__)) && !defined(__dos__)
#define DIR_SEP   '/'
#define DIR_SEPS  "/"
#else
#define DIR_SEP   '\\'
#define DIR_SEPS  "\\"
#endif

// Maximum length for a vsprintf string
#define MAX_F_STRING 1025

#if defined(__WIN32__)

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <io.h>
#include <direct.h>
#include <shellapi.h>

#else

#include <unistd.h>
#include <sys/stat.h>

#endif

typedef int bool;
typedef unsigned int FileAttribs;
typedef unsigned char byte;
typedef unsigned int FileSize;
typedef unsigned short uint16;
typedef unsigned int uint;
typedef unsigned long long uint64;
typedef uint64 FileSize64;

#define false 0
#define true 1

#define null ((void *)0)

#define isDirectory  0x0040

#define MAX_LOCATION 797
#define MAX_FILENAME 274

void __ecereNameSpace__ecere__com__eSystem_Delete(void * memory);
void * __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);
void * __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);
void * __ecereNameSpace__ecere__com__eSystem_Renew(void * memory, unsigned int size);
void * __ecereNameSpace__ecere__com__eSystem_Renew0(void * memory, unsigned int size);

unsigned short * __ecereNameSpace__ecere__sys__UTF8toUTF16(char * source, int * wordCount);
unsigned short * __ecereNameSpace__ecere__sys__UTF8toUTF16Buffer(char * source, uint16 * dest, int max);
char * __ecereNameSpace__ecere__sys__UTF16toUTF8(uint16 * source);
char * __ecereNameSpace__ecere__sys__UTF16toUTF8Buffer(uint16 * source, byte * dest, int max);

char * __ecereNameSpace__ecere__sys__StripLastDirectory(char * string, char * output);

char * __ecereNameSpace__ecere__sys__GetEnvironment(char * envName, char * envValue, int max);
char * __ecereNameSpace__ecere__sys__SearchString(char * buffer, int start, char * subStr, bool matchCase, bool matchWord);

FileAttribs FILE_FileExists(char * fileName);

bool System_MoveFile(char * source, char * dest)
{
#ifdef __WIN32__
   bool result;
   uint16 * _wsource = __ecereNameSpace__ecere__sys__UTF8toUTF16(source, null);
   uint16 * _wdest = __ecereNameSpace__ecere__sys__UTF8toUTF16(dest, null);
   result = MoveFileEx(_wsource, _wdest, MOVEFILE_COPY_ALLOWED) != 0;
   __ecereNameSpace__ecere__com__eSystem_Delete(_wsource);
   __ecereNameSpace__ecere__com__eSystem_Delete(_wdest);
   return result;
#else
   return rename(source, dest) == 0;
#endif
}

bool System_RenameFile(char * oldName, char * newName)
{
#if defined(__WIN32__)
   bool result;
   uint16 * _woldName = __ecereNameSpace__ecere__sys__UTF8toUTF16(oldName, null);
   uint16 * _wnewName = __ecereNameSpace__ecere__sys__UTF8toUTF16(newName, null);
   result = _wrename(_woldName, _wnewName) == 0;
   __ecereNameSpace__ecere__com__eSystem_Delete(_woldName);
   __ecereNameSpace__ecere__com__eSystem_Delete(_wnewName);
   return result;

#else
   return rename(oldName, newName) == 0;
#endif
}

bool System_DeleteFile(char * fileName)
{
   bool result = true;
#if defined(__WIN32__)
   uint16 * _wfileName = __ecereNameSpace__ecere__sys__UTF8toUTF16(fileName, null);
   if(_wunlink(_wfileName))
      result = false;
      //if(errno == 13/*EACCES*/) printf("delete file access error\n");
      //else if(errno == 2/*ENOENT*/) printf("delete file file does not exist error\n");
   __ecereNameSpace__ecere__com__eSystem_Delete(_wfileName);
#else
   unlink(fileName);
#endif
   return result;
}

bool System_MakeDir(char * path)
{
   bool result = false;
   char location[MAX_LOCATION] = "";
   int locationLen = 0;
   int c = 0;
#ifdef __WIN32__
   if(path[0] && path[1] == ':')
      c = 2;
   else if(path[0] == '\\' && path[1] == '\\')
      c = 2;
   else
#endif
   if(path[0] == '/' || path[0] == '\\')
      c = 1;

   strncpy(location, path, c);
   location[c] = '\0';
   locationLen = c;

   for(; path[c]; )
   {
      char directory[MAX_FILENAME];
      int len = 0;
      char ch;
      for(;(ch = path[c]) && (ch == '/' || ch == '\\'); c++);
      for(;(ch = path[c]) && (ch != '/' && ch != '\\'); c++)
      {
         if(len < MAX_FILENAME)
            directory[len++] = ch;  
      }
      directory[len] = '\0';
      if(locationLen > 0 &&
         (location[locationLen-1] != '\\' && location[locationLen-1] != '/'))
         strcat(location, DIR_SEPS);
      strcat(location, directory);
      locationLen = strlen(location);

      if(FILE_FileExists(location) != isDirectory)
      {
#if defined(__unix__) || defined(__APPLE__)
         mkdir(location, 0755);
#else
         uint16 _wlocation[MAX_LOCATION];
         __ecereNameSpace__ecere__sys__UTF8toUTF16Buffer(location, _wlocation, MAX_LOCATION);
         _wmkdir(_wlocation);
#endif
         result = true;
      }
   }
   return result;
}

bool System_RemoveDir(char * path)
{
   bool result = false;
   char location[MAX_LOCATION] = "";
   int locationLen = 0;
   int c = 0;
#ifdef __WIN32__
   if(path[0] && path[1] == ':')
      c = 2;
   else if(path[0] == '\\' && path[1] == '\\')
      c = 2;
   else
#endif
   if(path[0] == '/' || path[0] == '\\')
      c = 1;

   strncpy(location, path, c);
   location[c] = '\0';
   locationLen = c;

   for(; path[c]; )
   {
      char directory[MAX_FILENAME];
      int len = 0;
      char ch;
      for(;(ch = path[c]) && (ch == '/' || ch == '\\'); c++);
      for(;(ch = path[c]) && (ch != '/' && ch != '\\'); c++)
      {
         if(len < MAX_FILENAME)
            directory[len++] = ch;  
      }
      directory[len] = '\0';
      if(locationLen > 0 &&
         (location[locationLen-1] != '\\' && location[locationLen-1] != '/'))
         strcat(location, DIR_SEPS);
      strcat(location, directory);
      locationLen = strlen(location);

      if(FILE_FileExists(location) == isDirectory)
      {
#if defined(__unix__) || defined(__APPLE__)
         rmdir(location);
#else
         uint16 _wlocation[MAX_LOCATION];
         __ecereNameSpace__ecere__sys__UTF8toUTF16Buffer(location, _wlocation, MAX_LOCATION);
         _wrmdir(_wlocation);
#endif
         result = true;
      }
   }
   return result;
}

char * System_GetWorkingDir(char * buf, int size)
{
#if defined(__WIN32__)
   uint16 * _wbuf = __ecereNameSpace__ecere__com__eSystem_New(sizeof(uint16) * size);
   _wgetcwd(_wbuf, size);
   __ecereNameSpace__ecere__sys__UTF16toUTF8Buffer(_wbuf, (byte *)buf, size);
   __ecereNameSpace__ecere__com__eSystem_Delete(_wbuf);
   return buf;
#else
   return getcwd(buf, size);
#endif
}

bool System_ChangeWorkingDir(char * buf)
{
#if defined(__WIN32__)
   bool result;
   uint16 * _wbuf = __ecereNameSpace__ecere__sys__UTF8toUTF16(buf, null);
   result = !chdir(buf);
   __ecereNameSpace__ecere__com__eSystem_Delete(_wbuf);
   return result;
#else
   return !chdir(buf);
#endif
}

char * System_GetEnvironment(char * envName, char * envValue, int max)
{
#if defined(__WIN32__)
   uint16 * _wenvName = __ecereNameSpace__ecere__sys__UTF8toUTF16(envName, null);
   //uint16 * result;
   uint16 result[2048];
   int success;

   success = GetEnvironmentVariable(_wenvName, result, sizeof(result) / sizeof(uint16));
   //result = _wgetenv(_wenvName);
   //if(result)
   if(success && success < sizeof(result) / sizeof(uint16))
      __ecereNameSpace__ecere__sys__UTF16toUTF8Buffer(result, (byte *)envValue, max);
   else
      envValue[0] = 0;
      
   __ecereNameSpace__ecere__com__eSystem_Delete(_wenvName);
   return envValue; //result ? envValue : null;
#else
   char * result = getenv(envName);
   if(result)
      strncpy(envValue, result, max);
   else
      envValue[0] = 0;
   return result ? envValue : null;
#endif
}

void System_SetEnvironment(char * envName, char * envValue)
{
#if defined(__WIN32__)
   uint16 * _wenvName = __ecereNameSpace__ecere__sys__UTF8toUTF16(envName, null);
   uint16 * _wenvValue = __ecereNameSpace__ecere__sys__UTF8toUTF16(envValue, null);
   SetEnvironmentVariable(_wenvName, _wenvValue);
   __ecereNameSpace__ecere__com__eSystem_Delete(_wenvName);
   __ecereNameSpace__ecere__com__eSystem_Delete(_wenvValue);
#else
   setenv(envName, envValue, 1);
#endif   
}

void System_UnsetEnvironment(char * envName)
{
#if defined(__WIN32__)
   uint16 * _wenvName = __ecereNameSpace__ecere__sys__UTF8toUTF16(envName, null);
   SetEnvironmentVariable(_wenvName, null);
   __ecereNameSpace__ecere__com__eSystem_Delete(_wenvName);
#else
   unsetenv(envName);
#endif   
}

bool System_Execute(char * env, char * command, va_list args)
{
   bool result = false;
   char commandLine[MAX_F_STRING];
   commandLine[sizeof(commandLine)-1] = 0;
   vsnprintf(commandLine, sizeof(commandLine)-1, command, args);

#ifndef __WIN32__
   {
      strcat(commandLine, "&");
      system(commandLine);
   }
#else
   {
      PROCESS_INFORMATION pi;
      STARTUPINFO si = { 0 };
      uint16 * _wcommandLine = __ecereNameSpace__ecere__sys__UTF8toUTF16(commandLine, null);

      // Set up the start up info struct.
      si.cb = sizeof(STARTUPINFO);
      // if(CreateProcess(null, _wcommandLine, null, null, TRUE, 0, env, null, &si, &pi))
      if(CreateProcess(null, _wcommandLine, null, null, TRUE, CREATE_NEW_CONSOLE, env, null, &si, &pi))
         result = true;
      __ecereNameSpace__ecere__com__eSystem_Delete(_wcommandLine);
   }
#endif
   return result;
}

bool System_ShellOpen(char * fileName, va_list args)
{
   bool result = false;
   char filePath[MAX_F_STRING];
   int len;
   filePath[sizeof(filePath)-1] = 0;
#if defined(__WIN32__)
   filePath[0] = '"';
   vsnprintf(filePath+1, sizeof(filePath)-2,fileName, args);
#else
   vsnprintf(filePath, sizeof(filePath), fileName, args);
#endif

   len = strlen(filePath);
#if defined(__WIN32__)
   filePath[len] = '"';
   filePath[len+1] = '\0';
#else
   filePath[len] = '\0';
#endif

#if !defined(__WIN32__)
   {
      char command[MAX_LOCATION] = "";
      char desktop[MAX_F_STRING];
      __ecereNameSpace__ecere__sys__GetEnvironment("ECERE_DESKTOP", desktop, sizeof(desktop));
      if(__ecereNameSpace__ecere__sys__SearchString(desktop, 0, "ecere", false, false))
         sprintf(command, "ede-open \"%s\" &", filePath);
      else
      {
         __ecereNameSpace__ecere__sys__GetEnvironment("DESKTOP_SESSION", desktop, sizeof(desktop));
         if(__ecereNameSpace__ecere__sys__SearchString(desktop, 0, "gnome", false, false))
            sprintf(command, "gnome-open \"%s\" &", filePath);
         else if(__ecereNameSpace__ecere__sys__SearchString(desktop, 0, "kde", false, false))
            sprintf(command, "kde-open \"%s\" &", filePath);
         else
            sprintf(command, "xdg-open \"%s\" &", filePath);
      }

      if(command[0] && system(command) != -1)
         result = true;
   }
#elif defined(ECERE_VANILLA)
   {
      uint16 * _wfilePath = __ecereNameSpace__ecere__sys__UTF8toUTF16(filePath, null);
      if(_wsystem(_wfilePath) != -1)
         result = true;
      __ecereNameSpace__ecere__com__eSystem_Delete(_wfilePath);
   }
#else
   {
      uint16 * _wfilePath = __ecereNameSpace__ecere__sys__UTF8toUTF16(filePath, null);
      char curDir[MAX_LOCATION];
      uint16 * _wcurDir;
      __ecereNameSpace__ecere__sys__StripLastDirectory(filePath, curDir);
      _wcurDir = __ecereNameSpace__ecere__sys__UTF8toUTF16(curDir, null);
      //if(ShellExecute(null, "open", _wfilePath, null, curDir, SW_SHOWNORMAL) > 32)
      if((void *)ShellExecute(null, null, _wfilePath, null, _wcurDir, SW_SHOWNORMAL) > (void *)32)
         result = true;
      __ecereNameSpace__ecere__com__eSystem_Delete(_wfilePath);
      __ecereNameSpace__ecere__com__eSystem_Delete(_wcurDir);
   }
#endif
   return result;
}

void System_GetFreeSpace(char * path, FileSize64 * size)
{
   uint64 freeSize = 0;
#ifdef __WIN32__
   uint16 * _wpath = __ecereNameSpace__ecere__sys__UTF8toUTF16(path, null);
   GetDiskFreeSpaceEx(_wpath, (PULARGE_INTEGER)&freeSize, null, null);
   __ecereNameSpace__ecere__com__eSystem_Delete(_wpath);
#endif
   *size = (FileSize64)freeSize;
}
