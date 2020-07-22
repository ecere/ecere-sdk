#define _Noreturn

#undef __BLOCKS__

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <ctype.h>

#if defined(__GNUC__) || defined(__WATCOMC__) || defined(__WIN32__)
#include <time.h>
#include <sys/types.h>
#include <sys/stat.h>

#define __USE_LARGEFILE64
#include <fcntl.h>

#if defined(__linux__) && !defined(__ANDROID__) && !defined(__EMSCRIPTEN__) && !defined(__i386__)

// From https://stackoverflow.com/questions/58472958/how-to-force-linkage-to-older-libc-fcntl-instead-of-fcntl64

asm(".symver fcntl64, fcntl@GLIBC_2.2.5");

int __wrap_fcntl64(int fd, int cmd, ...)
{
    int result;
    va_list va;
    va_start(va, cmd);

    switch (cmd) {
      //
      // File descriptor flags
      //
      case F_GETFD: goto takes_void;
      case F_SETFD: goto takes_int;

      // File status flags
      //
      case F_GETFL: goto takes_void;
      case F_SETFL: goto takes_int;

      // File byte range locking, not held across fork() or clone()
      //
      case F_SETLK: goto takes_flock_ptr_INCOMPATIBLE;
      case F_SETLKW: goto takes_flock_ptr_INCOMPATIBLE;
      case F_GETLK: goto takes_flock_ptr_INCOMPATIBLE;
#if 0
      // File byte range locking, held across fork()/clone() -- Not POSIX
      //
      case F_OFD_SETLK: goto takes_flock_ptr_INCOMPATIBLE;
      case F_OFD_SETLKW: goto takes_flock_ptr_INCOMPATIBLE;
      case F_OFD_GETLK: goto takes_flock_ptr_INCOMPATIBLE;

      // Managing I/O availability signals
      //
      case F_GETOWN: goto takes_void;
      case F_SETOWN: goto takes_int;
      case F_GETOWN_EX: goto takes_f_owner_ex_ptr;
      case F_SETOWN_EX: goto takes_f_owner_ex_ptr;
      case F_GETSIG: goto takes_void;
      case F_SETSIG: goto takes_int;

      // Notified when process tries to open or truncate file (Linux 2.4+)
      //
      case F_SETLEASE: goto takes_int;
      case F_GETLEASE: goto takes_void;

      // File and directory change notification
      //
      case F_NOTIFY: goto takes_int;

      // Changing pipe capacity (Linux 2.6.35+)
      //
      case F_SETPIPE_SZ: goto takes_int;
      case F_GETPIPE_SZ: goto takes_void;

      // File sealing (Linux 3.17+)
      //
      case F_ADD_SEALS: goto takes_int;
      case F_GET_SEALS: goto takes_void;

      // File read/write hints (Linux 4.13+)
      //
      case F_GET_RW_HINT: goto takes_uint64_t_ptr;
      case F_SET_RW_HINT: goto takes_uint64_t_ptr;
      case F_GET_FILE_RW_HINT: goto takes_uint64_t_ptr;
      case F_SET_FILE_RW_HINT: goto takes_uint64_t_ptr;
#endif

      default:
        fprintf(stderr, "fcntl64 workaround got unknown F_XXX constant");
    }

  takes_void:
    va_end(va);
    return fcntl64(fd, cmd);

  takes_int:
    result = fcntl64(fd, cmd, va_arg(va, int));
    va_end(va);
    return result;

  takes_flock_ptr_INCOMPATIBLE:
    //
    // !!! This is the breaking case: the size of the flock
    // structure changed to accommodate larger files.  If you
    // need this, you'll have to define a compatibility struct
    // with the older glibc and make your own entry point using it,
    // then call fcntl64() with it directly (bear in mind that has
    // been remapped to the old fcntl())
    //
    fprintf(stderr, "fcntl64 hack can't use glibc flock directly");
    exit(1);
#if 0
  takes_f_owner_ex_ptr:
    result = fcntl64(fd, cmd, va_arg(va, struct f_owner_ex*));
    va_end(va);
    return result;

  takes_uint64_t_ptr:
    result = fcntl64(fd, cmd, va_arg(va, uint64_t*));
    va_end(va);
    return result;
#endif
}
#endif

#endif

#if defined(__unix__) || defined(__APPLE__)
#include <utime.h>
#endif

#if defined(__WIN32__)
#define WIN32_LEAN_AND_MEAN
#define UNICODE
#include <windows.h>
#include <io.h>

#else
#include <unistd.h>
#endif

typedef int bool;
typedef unsigned char byte;
typedef unsigned short uint16;
typedef unsigned int uint;
typedef unsigned int FileSize;
typedef long long int64;
typedef unsigned long long uint64;

#define false 0
#define true 1

#define null ((void *)0)

#define MAX_LOCATION 797
#define MAX_FILENAME 274

void __ecereNameSpace__ecere__com__eSystem_Delete(void * memory);
void * __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);
void * __ecereNameSpace__ecere__com__eSystem_Renew(void * memory, unsigned int size);
void * __ecereNameSpace__ecere__com__eSystem_Renew0(void * memory, unsigned int size);
unsigned short * __ecereNameSpace__ecere__sys__UTF8toUTF16(const char * source, int * wordCount);
unsigned short * __ecereNameSpace__ecere__sys__UTF8toUTF16Buffer(const char * source, uint16 * dest, int max);
char * __ecereNameSpace__ecere__sys__UTF16toUTF8(const uint16 * source);
void __ecereNameSpace__ecere__sys__ChangeCh(char * string, char ch1, char ch2);

#if defined(__WIN32__) || defined(__WATCOMC__)
#include <direct.h>
__declspec(dllimport) BOOL WINAPI GetVolumePathName(LPCTSTR lpszFileName,LPTSTR lpszVolumePathName,DWORD cchBufferLength);
#else
#include <dirent.h>
#endif

typedef unsigned int FileAttribs;
typedef int64 SecSince1970;
typedef SecSince1970 TimeStamp;

typedef enum
{
   FOM_read = 1,
   FOM_write,
   FOM_append,
   FOM_readWrite,
   FOM_writeRead,
   FOM_appendRead
} FileOpenMode;

typedef enum
{
   unlocked = 0,     // LOCK_UN  _SH_DENYNO
   shared = 1,       // LOCK_SH  _SH_DENYWR
   exclusive = 2     // LOCK_EX  _SH_DENYRW
} FileLock;

#define isFile       0x0001
#define isArchive    0x0002
#define isHidden     0x0004
#define isReadOnly   0x0008
#define isSystem     0x0010
#define isTemporary  0x0020
#define isDirectory  0x0040
#define isDrive      0x0080
#define isCDROM      0x0100
#define isRemote     0x0200
#define isRemovable  0x0400
#define isServer     0x0800
#define isShare      0x1000

typedef struct
{
   FileAttribs attribs;
   uint64 size;
   SecSince1970 accessed;
   SecSince1970 modified;
   SecSince1970 created;
} FileStats;

char * __ecereNameSpace__ecere__sys__GetLastDirectory(const char * string, char * output);
bool __ecereNameSpace__ecere__sys__SplitArchivePath(const char * fileName, char * archiveName, char ** archiveFile);

#if defined(__WIN32__) && !defined(ECERE_BOOTSTRAP)
void __ecereMethod___ecereNameSpace__ecere__sys__EARFileSystem_FixCase(const char * archive, char * name);

#if !defined(__UWP__)
static BOOL CALLBACK EnumThreadWindowsProc(HWND hwnd, LPARAM lParam)
{
   DWORD pid;
   if(IsWindowVisible(hwnd) && GetWindowThreadProcessId(hwnd, &pid) && pid == GetCurrentProcessId())
   {
      *(void **)lParam = hwnd;
      return FALSE;
   }
   return TRUE;
}

bool WinReviveNetworkResource(uint16 * _wfileName)
{
   bool result = false;
   HWND windowHandle = null;
   NETRESOURCE nr = { 0 };
   nr.dwType = RESOURCETYPE_DISK;
   nr.lpRemoteName = _wfileName;
   if(_wfileName[0] != '\\' || _wfileName[1] == '\\')
   {
      uint16 volumePathName[MAX_LOCATION];
      if(GetVolumePathName(_wfileName, volumePathName, MAX_LOCATION))
      {
         uint16 remoteName[MAX_LOCATION];
         DWORD size = MAX_LOCATION;
         volumePathName[wcslen(volumePathName)-1] = 0;
         if(WNetGetConnection(volumePathName, remoteName, &size) == ERROR_CONNECTION_UNAVAIL)
         {
            nr.lpRemoteName = remoteName;
            nr.lpLocalName = volumePathName;
         }
         else
            return false;
      }
      else
         return false;
   }
   EnumThreadWindows(GetCurrentThreadId(), EnumThreadWindowsProc, (LPARAM)&windowHandle);
   if(!windowHandle)
   {
      EnumWindows(EnumThreadWindowsProc, (LPARAM)&windowHandle);

   }
   if(WNetAddConnection3(windowHandle, &nr, null, null, CONNECT_INTERACTIVE|CONNECT_PROMPT) == NO_ERROR)
      result = true;
   return result;
}
#endif

TimeStamp Win32FileTimeToTimeStamp(FILETIME * fileTime);
void TimeStampToWin32FileTime(TimeStamp t, FILETIME * fileTime);

#endif

uint FILE_GetSize(FILE * input)
{
   if(input)
   {
      struct stat s;
      int fd = fileno(input);
      if(!fstat(fd, &s))
         return s.st_size;
   }
   return 0;
}

bool FILE_Lock(FILE * input, FILE * output, FileLock type, uint64 start, uint64 length, bool wait)
{
   if(!output && !input)
      return true;
   else
   {
#if defined(__WIN32__)
      int handle = fileno(output ? output : input);
      HANDLE hFile = (HANDLE)_get_osfhandle(handle);
      OVERLAPPED overlapped = { 0 };
      overlapped.Offset = (uint)(start & 0xFFFFFFFF);
      overlapped.OffsetHigh = (uint)((start & 0xFFFFFFFF00000000LL) >> 32);
      if(type ==  unlocked)
         return UnlockFileEx(hFile, 0,
            (uint)(length ? (length & 0xFFFFFFFF) : 0xFFFFFFFF),
            (uint)(length ? ((length & 0xFFFFFFFF00000000LL) >> 32) : 0xFFFFFFFF),
            &overlapped) != 0;
      else
         return LockFileEx(hFile, ((type == exclusive) ? LOCKFILE_EXCLUSIVE_LOCK : 0) | (wait ? 0 : LOCKFILE_FAIL_IMMEDIATELY), 0,
            (uint)(length ? (length & 0xFFFFFFFF) : 0xFFFFFFFF),
            (uint)(length ? ((length & 0xFFFFFFFF00000000LL) >> 32) : 0xFFFFFFFF),
            &overlapped) != 0;
#else
      struct flock fl;
      int fd;

      fl.l_type   = (type == unlocked) ? F_UNLCK : ((type == exclusive) ? F_WRLCK : F_RDLCK);
      fl.l_whence = SEEK_SET;
      fl.l_start  = start;
      fl.l_len    = length;
      fl.l_pid    = getpid();

      fd = fileno(output ? output : input);
      return fcntl(fd, wait ? F_SETLKW : F_SETLK, &fl) != -1;
#endif
   }
}

void FILE_set_buffered(FILE * input, FILE * output, bool value)
{
#if !defined(__WIN32__) && !defined(ECERE_BOOTSTRAP)
   if(input)
      setvbuf(input, null, value ? _IOFBF : _IONBF, 0);
   if(output && output != input)
      setvbuf(output, null, value ? _IOFBF : _IONBF, 0);
#endif
}

FileAttribs FILE_FileExists(const char * fileName)
{
#ifdef __WIN32__
   FileAttribs result = 0;
   uint attribute = 0;  // Initialization isn't actually required here but GCC complains about it.
   uint16 * _wfileName = __ecereNameSpace__ecere__sys__UTF8toUTF16(fileName, null);
   if(!strcmp(fileName, "/") || !strcmp(fileName, "\\\\"))
   {
      result = (FileAttribs)(isDirectory);
   }
   else
      attribute = GetFileAttributes(_wfileName);
#if !defined(ECERE_BOOTSTRAP) && !defined(__UWP__)
   if(!result && attribute == 0xFFFFFFFF)
   {
      if(WinReviveNetworkResource(_wfileName))
         attribute = GetFileAttributes(_wfileName);
      if(attribute == 0xFFFFFFFF)
      {
         if(fileName[0] == '\\' && fileName[1] == '\\')
         {
            NETRESOURCE nr = { 0 };
            NETRESOURCE * buffer = null;
            unsigned int size = sizeof(NETRESOURCE);
            uint16 * dir;

            nr.dwScope       = RESOURCE_GLOBALNET;
            nr.dwType        = RESOURCETYPE_DISK;
            nr.lpRemoteName  = _wfileName;
            nr.lpProvider = L"Microsoft Windows Network";

            buffer = (NETRESOURCE *)__ecereNameSpace__ecere__com__eSystem_New0(size);
            while(true)
            {
               int returnCode = WNetGetResourceInformationW(&nr, buffer, (DWORD *)&size, &dir);
               if(returnCode == WN_MORE_DATA)
                  buffer = (NETRESOURCE *)__ecereNameSpace__ecere__com__eSystem_Renew0(buffer, size);
               else
               {
                  if(returnCode == WN_SUCCESS)
                  {
                     if(!_wcsicmp(buffer->lpRemoteName, _wfileName))
                        result = (FileAttribs)( isDirectory | isServer );
                  }
                  break;
               }
            }
            __ecereNameSpace__ecere__com__eSystem_Delete(buffer);
         }
      }
   }
#endif
   if(!result && attribute != 0xFFFFFFFF)
   {
      if(attribute & FILE_ATTRIBUTE_DIRECTORY)
         result = (FileAttribs)( isDirectory );
      else
         result = (FileAttribs)(isFile);
   }
   __ecereNameSpace__ecere__com__eSystem_Delete(_wfileName);
   return result;
#else
   if(!access(fileName, F_OK))
   {
      struct stat s;
      stat(fileName, &s);
      return S_ISDIR(s.st_mode) ? (FileAttribs) ( isDirectory ) : (FileAttribs) ( isFile );
   }
   else
   {
      // TODO: Check this
      return (FileAttribs) 0;
   }
#endif
}

bool FILE_FileGetSize(const char * fileName, FileSize * size)
{
   bool result = false;
#if defined(__WIN32__)
   struct _stat s;
   uint16 * _wfileName = __ecereNameSpace__ecere__sys__UTF8toUTF16(fileName, null);
   if(!_wstat(_wfileName, &s))
#else
   struct stat s;
   if(!stat(fileName, &s))
#endif
   {
      *size = s.st_size;
      result = true;
   }
#if defined(__WIN32__)
   __ecereNameSpace__ecere__com__eSystem_Delete(_wfileName);
#endif
   return result;
}

bool FILE_FileGetStats(const char * fileName, FileStats * stats)
{
   bool result = false;
#if defined(__WIN32__)
   uint16 * _wfileName = __ecereNameSpace__ecere__sys__UTF8toUTF16(fileName, null);
   struct _stat s;
   if(!_wstat(_wfileName, &s))
#else
   struct stat s;
   if(!stat(fileName, &s))
#endif
   {
      stats->size = s.st_size;
      stats->attribs = (s.st_mode & S_IFDIR) ? ((FileAttribs) (isDirectory)): ((FileAttribs) 0);

#if defined(__WIN32__) && !defined(__UWP__)
      {
         HANDLE hFile = CreateFile(_wfileName, 0, FILE_SHARE_READ, null,
            OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, null);
         if(hFile != INVALID_HANDLE_VALUE)
         {
#if defined(ECERE_BOOTSTRAP)
            stats->created  = 0;
            stats->accessed = 0;
            stats->modified = 0;
#else
            FILETIME c, a, m;
            GetFileTime(hFile, &c, &a, &m);
            stats->created  = Win32FileTimeToTimeStamp(&c);
            stats->accessed = Win32FileTimeToTimeStamp(&a);
            stats->modified = Win32FileTimeToTimeStamp(&m);
#endif

            CloseHandle(hFile);
         }
      }
#else
      stats->accessed = s.st_atime;
      // UNIX st_ctime is 'status change' time, not creation time
      // Marking created as 0, as ctime changes cause unreproducible builds
      stats->created = 0;
      stats->modified = s.st_mtime;
#endif
/*
      stats->attribs.isArchive   = (winFile.dwFileAttributes & FILE_ATTRIBUTE_ARCHIVE)   ? true : false;
      stats->attribs.isHidden    = (winFile.dwFileAttributes & FILE_ATTRIBUTE_HIDDEN)    ? true : false;
      stats->attribs.isReadOnly  = (winFile.dwFileAttributes & FILE_ATTRIBUTE_READONLY)  ? true : false;
      stats->attribs.isSystem    = (winFile.dwFileAttributes & FILE_ATTRIBUTE_SYSTEM)    ? true : false;
      stats->attribs.isTemporary = (winFile.dwFileAttributes & FILE_ATTRIBUTE_TEMPORARY) ? true : false;
      stats->attribs.isDirectory = (winFile.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) ? true : false;
*/
      result = true;
   }
#if defined(__WIN32__)
   __ecereNameSpace__ecere__com__eSystem_Delete(_wfileName);
#endif
   return result;
}

void FILE_FileFixCase(char * file)
{
#if defined(__WIN32__)
#ifndef ECERE_BOOTSTRAP
   char archive[MAX_LOCATION], * name;
   if(__ecereNameSpace__ecere__sys__SplitArchivePath(file, archive, &name))
   {
      char fileName[MAX_LOCATION];
      strcpy(fileName, name);
      __ecereMethod___ecereNameSpace__ecere__sys__EARFileSystem_FixCase(archive, fileName);
      if(archive[0] != ':')
         FILE_FileFixCase(archive);
      sprintf(file, "<%s>%s", archive, fileName);
   }
   else
#endif
   {
      int c = 0;
      char parent[MAX_LOCATION] = "";

      // Skip network protocols
      if(strstr(file, "http://") == file || strstr(file, "https://") == file || strstr(file, "wfs://") == file || strstr(file, "wfs3://") == file || strstr(file, "wfs3s://") == file) return;

      // Copy drive letter to new path
      if(file[0] && file[1] == ':')
      {
         parent[0] = (char)toupper(file[0]);
         parent[1] = ':';
         parent[2] = '\0';
         c = 2;
      }
      // Copy Microsoft Network string to new path
      else if(file[0] == '\\' && file[1] == '\\')
      {
         parent[0] = parent[1] = '\\';
         parent[2] = '\0';
         c = 2;
      }
      else if(file[0] == '/' && file[1] == '/')
      {
         parent[0] = parent[1] = '\\';
         parent[2] = '\0';
         c = 2;
      }
      // Copy Entire Computer to new path
      else if(file[0] == '/'  && !file[1])

      {
         parent[0] = '/';
         parent[1] = '\0';
         c = 1;
      }

      while(file[c])
      {
         // Get next directory
         char directory[MAX_FILENAME];
         int len = 0;
         char ch;
         for(;(ch = file[c]) && (ch == '/' || ch == '\\'); c++);
         for(;(ch = file[c]) && (ch != '/' && ch != '\\'); c++)
         {
            if(len < MAX_FILENAME)
               directory[len++] = ch;
         }
         directory[len] = '\0';

         // Normal file
         if(parent[0] != '\\' || parent[1] != '\\' || strstr(parent+2, "\\"))
         {
            if(strcmp(directory, "..") && strcmp(directory, "."))
            {
               WIN32_FIND_DATA winFile;
               uint16 dir[MAX_PATH];
               HANDLE handle;

               __ecereNameSpace__ecere__sys__UTF8toUTF16Buffer(parent, dir, MAX_PATH);
               if(dir[0]) wcscat(dir, L"\\");
               {
                  uint16 * _wdirectory = __ecereNameSpace__ecere__sys__UTF8toUTF16(directory, null);
                  wcscat(dir, _wdirectory);
                  __ecereNameSpace__ecere__com__eSystem_Delete(_wdirectory);
               }

               handle = FindFirstFile(dir, &winFile);
               if(parent[0] || (file[0] == '\\' || file[0] == '/'))
                  strcat(parent, "\\");
               if(handle != INVALID_HANDLE_VALUE)
               {
                  char * utf8 = __ecereNameSpace__ecere__sys__UTF16toUTF8(winFile.cFileName);
                  strcat(parent, utf8);
                  __ecereNameSpace__ecere__com__eSystem_Delete(utf8);
                  FindClose(handle);
               }
               else
                  strcat(parent, directory);
            }
            else
            {
               if(parent[0] || (file[0] == '\\' || file[0] == '/'))
                  strcat(parent, "\\");

               strcat(parent, directory);
            }
         }
#if !defined(ECERE_BOOTSTRAP) && !defined(__UWP__)
         else
         {
            // Network server
            if(parent[2])
            {
               HANDLE handle = 0;
               DWORD count = 0xFFFFFFFF;
               DWORD size = 512 * sizeof(NETRESOURCE);
               NETRESOURCE * buffer = (NETRESOURCE *)__ecereNameSpace__ecere__com__eSystem_New0(size);
               NETRESOURCE nr = {0};
               int c;

               nr.dwScope = RESOURCE_GLOBALNET;
               nr.dwType = RESOURCETYPE_DISK;
               // UNICODE FIX
               nr.lpRemoteName = __ecereNameSpace__ecere__sys__UTF8toUTF16(parent, null);
               nr.lpProvider = L"Microsoft Windows Network";

               // Server
               WNetOpenEnum(RESOURCE_GLOBALNET, RESOURCETYPE_DISK, 0, &nr, &handle);
               if(handle)
               {
                  while(true)
                  {
                     int returnCode = WNetEnumResource(handle, &count, buffer, &size);
                     if(returnCode != ERROR_MORE_DATA)
                        break;
                     count = 0xFFFFFFFF;
                     buffer = (NETRESOURCE *)__ecereNameSpace__ecere__com__eSystem_Renew0(buffer, size);
                  }
                  WNetCloseEnum(handle);
               }
               else
                  count = 0;

               for(c = 0; c<count; c++)
               {
                  char shareName[MAX_FILENAME];
                  char * remoteName = __ecereNameSpace__ecere__sys__UTF16toUTF8(buffer[c].lpRemoteName);
                  __ecereNameSpace__ecere__sys__GetLastDirectory(remoteName, shareName);
                  __ecereNameSpace__ecere__com__eSystem_Delete(remoteName);
                  if(!strcmpi(directory, shareName))
                  {
                     strcpy(directory, shareName);
                     break;
                  }
               }
               if(c == count)
                  strlwr(directory);

               __ecereNameSpace__ecere__com__eSystem_Delete(nr.lpRemoteName);
               __ecereNameSpace__ecere__com__eSystem_Delete(buffer);

               strcat(parent, "\\");
               strcat(parent, directory);
            }
            // Network share
            else
            {
               strlwr(directory);
               directory[0] = (char)toupper(directory[0]);
               strcat(parent, directory);
            }
         }
#endif
      }
      strcpy(file, parent);
   }
#else
   __ecereNameSpace__ecere__sys__ChangeCh(file, '\\', '/');
#endif
}

void FILE_FileOpen(const char * fileName, FileOpenMode mode, FILE ** input, FILE **output)
{
#if defined(__WIN32__) && !defined(ECERE_BOOTSTRAP)
   uint16 * _wfileName = __ecereNameSpace__ecere__sys__UTF8toUTF16(fileName, null);

   /*
   struct WinFile { HANDLE handle; } file;
   file.handle = CreateFile(_wfileName,
      ((mode == FOM_read || mode == FOM_readWrite || mode == FOM_writeRead || mode == FOM_appendRead) ? GENERIC_READ : 0) |
      ((mode == FOM_write || mode == FOM_append || mode == FOM_readWrite || mode == FOM_writeRead || mode == FOM_appendRead) ? GENERIC_WRITE: 0),
      FILE_SHARE_READ|FILE_SHARE_WRITE,
      null,
      (mode == FOM_write || mode == FOM_writeRead) ? TRUNCATE_EXISTING : ((mode == FOM_read || mode == FOM_readWrite) ? OPEN_EXISTING : OPEN_ALWAYS), 0, null);
   if(file.handle)
   {
      int flags;
      int handle = -1;
      switch(mode)
      {
         case FOM_read:       handle = _open_osfhandle((intptr_t)file.handle, _O_RDONLY); break;
         case FOM_write:      handle = _open_osfhandle((intptr_t)file.handle, _O_WRONLY | _O_CREAT | _O_TRUNC); break;
         case FOM_append:     handle = _open_osfhandle((intptr_t)file.handle, _O_WRONLY | _O_CREAT | _O_APPEND); break;
         case FOM_readWrite:  handle = _open_osfhandle((intptr_t)file.handle, _O_RDWR); break;
         case FOM_writeRead:  handle = _open_osfhandle((intptr_t)file.handle, _O_RDWR | _O_CREAT | _O_TRUNC); break;
         case FOM_appendRead: handle = _open_osfhandle((intptr_t)file.handle, _O_RDWR | _O_APPEND | _O_CREAT); break;
      }
      if(handle != -1)
      {
         switch(mode)
         {
            case FOM_read:       *input = _fdopen(handle, "rb"); break;
            case FOM_write:      *output = _fdopen(handle, "wb"); break;
            case FOM_append:     *output = _fdopen(handle, "ab"); break;
            case FOM_readWrite:  *input = *output = _fdopen(handle, "r+b"); break;
            case FOM_writeRead:  *input = *output = _fdopen(handle, "w+b"); break;
            case FOM_appendRead: *input = *output = _fdopen(handle, "a+b"); break;
         }
      }
   }
   */
   switch(mode)
   {
      case FOM_read:       *input = _wfopen(_wfileName, L"rb"); break;
      case FOM_write:      *output = _wfopen(_wfileName, L"wb"); break;
      case FOM_append:     *output = _wfopen(_wfileName, L"ab"); break;
      case FOM_readWrite:  *input = *output = _wfopen(_wfileName, L"r+b"); break;
      case FOM_writeRead:  *input = *output = _wfopen(_wfileName, L"w+b"); break;
      case FOM_appendRead: *input = *output = _wfopen(_wfileName, L"a+b"); break;
   }
 #if !defined(__UWP__)
   if(!mode && WinReviveNetworkResource(_wfileName))
   {
      switch(mode)
      {
         case FOM_read:       *input = _wfopen(_wfileName, L"rb"); break;
         case FOM_write:      *output = _wfopen(_wfileName, L"wb"); break;
         case FOM_append:     *output = _wfopen(_wfileName, L"ab"); break;
         case FOM_readWrite:  *input = *output = _wfopen(_wfileName, L"r+b"); break;
         case FOM_writeRead:  *input = *output = _wfopen(_wfileName, L"w+b"); break;
         case FOM_appendRead: *input = *output = _wfopen(_wfileName, L"a+b"); break;
      }
   }
#endif
   __ecereNameSpace__ecere__com__eSystem_Delete(_wfileName);
#else
   switch(mode)
   {
      case FOM_read:       *input = fopen(fileName, "rb"); break;
      case FOM_write:      *output = fopen(fileName, "wb"); break;
      case FOM_append:     *output = fopen(fileName, "ab"); break;
      case FOM_readWrite:  *input = *output = fopen(fileName, "r+b"); break;
      case FOM_writeRead:  *input = *output = fopen(fileName, "w+b"); break;
      case FOM_appendRead: *input = *output = fopen(fileName, "a+b"); break;
   }
#endif
}

int FILE_Seek64(FILE * f, int64 offset, int origin)
{
#if defined(__WIN32__)
   #if 1 //!defined(_WIN64)    // _fseeki64 is not working well with SEEK_CUR?
   if(origin == SEEK_CUR) // fseek with -1, SEEK_CUR failing in 32-bit with MinGW-w64 ?
      return fseek(f, offset, origin);
   #endif
   return _fseeki64(f, offset, origin);
#else
   return fseek(f, offset, origin);
#endif
}
