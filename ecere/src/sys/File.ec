namespace sys;

#define _Noreturn

default:
#define set _set
#define uint _uint
#define File _File
#define strlen _strlen
#undef __BLOCKS__
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>

#define UNICODE

#define IS_ALUNDER(ch) ((ch) == '_' || isalnum((ch)))

#if defined(ECERE_BOOTSTRAP)
#undef __WIN32__
#undef __linux__
#undef __APPLE__
#undef __UNIX__
#endif

#ifndef ECERE_BOOTSTRAP
#if defined(__GNUC__) || defined(__WATCOMC__) || defined(__WIN32__)
#include <time.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#endif

#if defined(__unix__) || defined(__APPLE__)
#include <utime.h>
#endif

#if defined(__WIN32__) || defined(__WATCOMC__)
#include <direct.h>
#else
#include <dirent.h>
#endif

#if defined(__WIN32__)
#define WIN32_LEAN_AND_MEAN
#define String String_
#include <windows.h>
#undef String
#include <io.h>

errno_t _chsize_s(int fd, __int64 size);

BOOL __declspec(dllimport) WINAPI GetVolumePathName(LPCTSTR lpszFileName,LPTSTR lpszVolumePathName,DWORD cchBufferLength);

// Missing function...
/*
#ifndef WNetGetResourceInformation
DWORD APIENTRY WNetGetResourceInformationA(LPNETRESOURCE lpNetResource, LPVOID lpBuffer, LPDWORD lpcbBuffer, LPTSTR* lplpSystem);
#ifdef UNICODE
#define WNetGetResourceInformation  WNetGetResourceInformationW
#else
#define WNetGetResourceInformation  WNetGetResourceInformationA
#endif
#endif
*/

#else
#include <unistd.h>
#endif


#include "zlib.h"

#endif //#ifndef ECERE_BOOTSTRAP
private:

#undef set
#undef uint
#undef File
#undef strlen

import "System"

#if !defined(ECERE_VANILLA) && !defined(ECERE_NONET) && !defined(ECERE_BOOTSTRAP)
import "HTTPFile"
#endif

import "dataTypes"

// IMPLEMENTATION OF THESE IS IN _File.c
default:

FILE *eC_stdin(void);
FILE *eC_stdout(void);

uint FILE_GetSize(FILE * input);
bool FILE_Lock(FILE * input, FILE * output, FileLock type, uint64 start, uint64 length, bool wait);
void FILE_set_buffered(FILE * input, FILE * output, bool value);
FileAttribs FILE_FileExists(const char * fileName);
bool FILE_FileGetSize(const char * fileName, FileSize * size);
bool FILE_FileGetStats(const char * fileName, FileStats stats);
void FILE_FileFixCase(char * file);
void FILE_FileOpen(const char * fileName, FileOpenMode mode, FILE ** input, FILE **output);
int FILE_Seek64(FILE * f, int64 offset, int origin);

private:

FileSystem httpFileSystem;

public class FileSize : uint
{
   // defaultAlignment = Right;
   /*
   void OnDisplay(Surface surface, int x, int y, int width, void * fieldData, int alignment, DataDisplayFlags displayFlags)
   {
      char string[16];
      int len;
      eUtils_PrintSize(string, *size, 2);
      len = strlen(string);
      surface.WriteTextDots(alignment, x, y, width, string, len);
   }
   */
   int OnCompare(FileSize data2)
   {
      int result = 0;
      if(&this && &data2)
      {
         if(this > data2)
            result = 1;
         else if(this < data2)
            result = -1;
      }
      return result;
   }

   const char * OnGetString(char * string, void * fieldData, ObjectNotationType * onType)
   {
      PrintSize(string, this, 2);
      return string;
   }

   bool OnGetDataFromString(const char * string)
   {
      char * end;
      double value = strtod(string, &end);
      uint multiplier = 1;
      if(strstr(end, "GB") || strstr(end, "gb")) multiplier = (uint)1024 * 1024 * 1024;
      else if(strstr(end, "MB") || strstr(end, "mb")) multiplier = (uint)1024 * 1024;
      else if(strstr(end, "KB") || strstr(end, "kb")) multiplier = 1024;

      this = (uint)(multiplier * value);
      return true;
   }
};

public class FileSize64 : uint64
{
   int OnCompare(FileSize64 data2)
   {
      int result = 0;
      if(&this && &data2)
      {
         if(this > data2)
            result = 1;
         else if(this < data2)
            result = -1;
      }
      return result;
   }

   const char * OnGetString(char * string, void * fieldData, ObjectNotationType * onType)
   {
      PrintBigSize(string, this, 2);
      return string;
   }

   bool OnGetDataFromString(const char * string)
   {
      char * end;
      double value = strtod(string, &end);
      uint64 multiplier = 1;
           if(strstr(end, "PB") || strstr(end, "pb")) multiplier = (uint64)1024 * 1024 * 1024 * 1024;
      else if(strstr(end, "TB") || strstr(end, "tb")) multiplier = (uint64)1024 * 1024 * 1024 * 1024;
      else if(strstr(end, "GB") || strstr(end, "gb")) multiplier = (uint64)1024 * 1024 * 1024;
      else if(strstr(end, "MB") || strstr(end, "mb")) multiplier = (uint64)1024 * 1024;
      else if(strstr(end, "KB") || strstr(end, "kb")) multiplier = 1024;

      this = (uint64)(multiplier * value);
      return true;
   }
};

class FileSystem
{
   virtual File ::Open(const char * archive, const char * name, FileOpenMode mode);

   // Query on names
   virtual FileAttribs ::Exists(const char * archive, const char * fileName);
   virtual bool ::GetSize(const char * archive, const char * fileName, FileSize * size);
   virtual bool ::Stats(const char * archive, const char * fileName, FileStats stats);
   virtual void ::FixCase(const char * archive, char * fileName);

   // File Listing
   virtual bool ::Find(FileDesc file, const char * archive, const char * name);
   virtual bool ::FindNext(FileDesc file);
   virtual void ::CloseDir(FileDesc file);

   // Archive manipulation
   virtual Archive ::OpenArchive(const char * fileName, ArchiveOpenFlags create);
   virtual bool ::QuerySize(const char * fileName, FileSize * size);
};

public enum FileOpenMode { read = 1, write, append, readWrite, writeRead, appendRead };
public enum FileSeekMode { start, current, end };

#if !defined(ECERE_BOOTSTRAP)
static FileDialog fileDialog { text = $"Select File" };
#endif

public enum FileLock
{
   unlocked = 0,     // LOCK_UN  _SH_DENYNO
   shared = 1,       // LOCK_SH  _SH_DENYWR
   exclusive = 2     // LOCK_EX  _SH_DENYRW
};

public class File : IOChannel
{
   FILE * input, * output;

   uintsize ReadData(byte * bytes, uintsize numBytes)
   {
      return Read(bytes, 1, numBytes);
   }

   uintsize WriteData(const byte * bytes, uintsize numBytes)
   {
      return Write(bytes, 1, numBytes);
   }

   ~File()
   {
      if(output && output != input)
      {
         openCount--;
         fclose(output);
      }
      if(input)
      {
         openCount--;
         fclose(input);
      }
      input = null;
      output = null;
   }

   bool OnGetDataFromString(const char * string)
   {
      if(!string[0])
      {
         this = null;
         return true;
      }
      else
      {
         File f = FileOpen(string, read);
         if(f)
         {
            this = TempFile { };
            while(!f.Eof())
            {
               byte buffer[4096];
               uintsize read = f.Read(buffer, 1, sizeof(buffer));
               Write(buffer, 1, read);
            }
            delete f;
            return true;
         }
      }
      return false;
   }

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      if(this)
      {
         PrintSize(tempString, GetSize(), 2);
         return tempString;
      }
      return null;
   }

#ifndef ECERE_BOOTSTRAP
   Window OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)
   {
      Window editData = class::OnEdit(dataBox, obsolete, x + 24, y, w - 48, h, userData);
      Button load
      {
         dataBox, inactive = true, text = $"Import"."Imp", hotKey = f2,
         position = { Max(x + 24, x + w - 24), y }, size = { 24, h };

         bool DataBox::NotifyClicked(Button button, int x, int y, Modifiers mods)
         {
            fileDialog.master = rootWindow;
            fileDialog.filePath = "";
            fileDialog.type = open;

            if(fileDialog.Modal() == ok)
            {
               const char * filePath = fileDialog.filePath;
               File output = null;
               if(output.OnGetDataFromString(filePath))
               {
                  SetData(output, false);
                  Refresh();
               }
            }
            return true;
         }
      };
      Button save
      {
         dataBox, inactive = true, text = $"Export"."Exp", hotKey = f2,
         position = { Max(x + 24, x + w - 48), y }, size = { 24, h };

         bool DataBox::NotifyClicked(Button button, int x, int y, Modifiers mods)
         {
            fileDialog.master = rootWindow;
            fileDialog.type = save;
            fileDialog.filePath = "";
            if(fileDialog.Modal() == ok)
            {
               const char * filePath = fileDialog.filePath;
               File f = FileOpen(filePath, write);
               if(f)
               {
                  File input = *(void **)data;
                  input.Seek(0, start);
                  while(!input.Eof())
                  {
                     byte buffer[4096];
                     uintsize read = input.Read(buffer, 1, sizeof(buffer));
                     f.Write(buffer, 1, read);
                  }
                  delete f;
               }
            }
            return true;
         }
      };
      load.Create();
      save.Create();
      return editData;
   }
#endif //#ifndef ECERE_BOOTSTRAP

#if !defined(ECERE_VANILLA) && !defined(ECERE_NOARCHIVE) && !defined(ECERE_BOOTSTRAP)
   void OnSerialize(IOChannel channel)
   {
      uintsize size = this ? (uintsize)GetSize() : MAXDWORD;
      if(this)
      {
         byte * uncompressed = new byte[size];
         Seek(0, start);
         if(uncompressed || !size)
         {
            uintsize count = Read(uncompressed, 1,  size);
            if(count == size)
            {
               uLongf cSize = size + size / 1000 + 12;
               byte * compressed = new byte[cSize];
               if(compressed)
               {
                  compress2(compressed, &cSize, uncompressed, size, 9);

                  size.OnSerialize(channel);
                  cSize.OnSerialize(channel);
                  channel.WriteData(compressed, (uintsize)cSize);

                  delete compressed;
               }
            }
            delete uncompressed;
         }
      }
      else
         size.OnSerialize(channel);

      /*
      byte data[4096];
      uint c;
      size.OnSerialize(channel);

      // Will add position...
      if(this)
      {
         Seek(0, start);
         for(c = 0; c<size; c += sizeof(data))
         {
            uintsize count = Read(data, 1, sizeof(data));
            buffer.WriteData(data, count);
         }
      }
      */
   }

   void OnUnserialize(IOChannel channel)
   {
      uLongf size = 0;
      uint cSize = 0;

      this = null;

      size.OnUnserialize(channel);
      if(size != MAXDWORD)
      {
         byte * compressed;
         cSize.OnUnserialize(channel);

         compressed = new byte[cSize];
         if(compressed)
         {
            if(channel.ReadData(compressed, cSize) == cSize)
            {
               byte * uncompressed = new byte[size];
               if(uncompressed || !size)
               {
                  this = TempFile { };
                  incref this;
                  uncompress(uncompressed, &size, compressed, cSize);
                  Write(uncompressed, 1, (uint)size);
                  Seek(0, start);

                  delete uncompressed;
               }
            }
            delete compressed;
         }
      }

      /*
      byte data[4096];
      uint c;

      size.OnUnserialize(channel);
      if(size != MAXDWORD)
      {
         this = TempFile { };
         for(c = 0; c<size; c += sizeof(data))
         {
            uint count = Min(size - c, sizeof(data));
            channel.ReadData(data, count);
            Write(data, 1, count);
         }
         Seek(0, start);
      }
      else
         this = null;
      */
   }
#endif

public:

   // Virtual Methods
   virtual bool Seek(int64 pos, FileSeekMode mode)
   {
      uint fmode = SEEK_SET;
      switch(mode)
      {
         case start: fmode = SEEK_SET; break;
         case end: fmode = SEEK_END; break;
         case current: fmode = SEEK_CUR; break;
      }
      return
         FILE_Seek64(input ? input : output, pos, fmode) != EOF;
   }

   virtual uint64 Tell(void)
   {
      return (input ? ftell(input) : ftell(output));
   }

   virtual uintsize Read(void * buffer, uintsize size, uintsize count)
   {
      return input ? fread(buffer, size, count, input) : 0;
   }

   virtual uintsize Write(const void * buffer, uintsize size, uintsize count)
   {
      return output ? fwrite(buffer, size, count, output) : 0;
   }

   // UNICODE OR NOT?
   virtual bool Getc(char * ch)
   {
      int ich = fgetc(input);
      if(ich != EOF)
      {
         if(ch) *ch = (char)ich;
         return true;
      }
      return false;
   }

   virtual bool Putc(char ch)
   {
      return (fputc((int)ch, output) == EOF) ? false : true;
   }

   virtual bool Puts(const char * string)
   {
      bool result = false;
      if(output)
      {
         result = (fputs(string, output) == EOF) ? false : true;
         // TODO: Check if any repercusions of commenting out fflush here
         // This is what broke the debugger in 0.44d2 , it is required for outputting things to the DualPipe
         // Added an explicit flush call in DualPipe::Puts
         // fflush(output);
      }
      return result;
   }

   virtual bool Eof(void)
   {
      return input ? feof(input) != 0 : true;
   }

   virtual bool Truncate(uint64 size)
   {
   #ifdef ECERE_BOOTSTRAP
      fprintf(stderr, "WARNING:  File::Truncate unimplemented in ecereBootstrap.\n");
      return false;
   #else
   #if defined(__WIN32__)
      return output ? (_chsize_s(fileno(output), size) == 0) : false;
   #else
      return output ? (ftruncate(fileno(output), size) == 0) : false;
   #endif
   #endif
   }

   virtual uint64 GetSize(void)
   {
      return FILE_GetSize(input);
   }

   virtual void CloseInput(void)
   {
      if(input)
      {
         fclose(input);
         if(output == input)
            output = null;
         input = null;
      }
   }

   virtual void CloseOutput(void)
   {
      if(output)
      {
         fclose(output);
         if(input == output)
            input = null;
         output = null;
      }
   }

   virtual bool Lock(FileLock type, uint64 start, uint64 length, bool wait)
   {
      return FILE_Lock(input, output, type, start, length, wait);
   }

   virtual bool Unlock(uint64 start, uint64 length, bool wait)
   {
      return Lock(unlocked, start, length, wait);
   }

   // Normal Methods
   int Printf(const char * format, ...)
   {
      int result = 0;
      if(format)
      {
         char text[MAX_F_STRING];
         va_list args;
         va_start(args, format);
         vsnprintf(text, sizeof(text), format, args);
         text[sizeof(text)-1] = 0;
         if(Puts(text))
            result = strlen(text);
         va_end(args);
      }
      return result;
   }

   public void PrintLn(typed_object object, ...)
   {
      va_list args;
      char buffer[4096];
      int len;
      va_start(args, object);
      len = PrintStdArgsToBuffer(buffer, sizeof(buffer), object, args);
      WriteData(buffer, len);
      Putc('\n');
      va_end(args);
   }

   public void Print(typed_object object, ...)
   {
      va_list args;
      char buffer[4096];
      int len;
      va_start(args, object);
      len = PrintStdArgsToBuffer(buffer, sizeof(buffer), object, args);
      WriteData(buffer, len);
      va_end(args);
   }

   bool Flush(void)
   {
      fflush(output);
      return true;
   }

   bool GetLine(char *s, int max)
   {
      int c = 0;
      bool result = true;
      s[c]=0;

      if(Eof())
      {
         result = false;
      }
      else
      {
         while(c<max-1)
         {
            char ch = 0;

            if(/*!Peek() || */ !Getc(&ch))
            {
               result = false;
               break;
            }
            if(ch =='\n')
               break;
            if(ch !='\r')
               s[c++]=ch;
         }
      }
      s[c]=0;
      return result || c > 1;
   }

   // Strings and numbers separated by spaces, commas, tabs, or CR/LF, handling quotes
   bool GetString(char * string, int max)
   {
      int c;
      char ch;
      bool quoted = false;
      bool result = true;

      *string = 0;
      while(true)
      {
         if(!Getc(&ch))
         {
            result = false;
            break;
         }
         if( (ch!='\n') && (ch!='\r') && (ch!=' ') && (ch!=',') && (ch!='\t'))
            break;
         if(Eof()) break;
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

            if(!Getc(&ch))
            {
               c++;
               result = false;
               break;
            }
         }
         string[c]=0;
      }
      return result;
   }

   int GetValue(void)
   {
      char string[32];
      GetString(string,sizeof(string));
      return atoi(string);
   }

   unsigned int GetHexValue(void)
   {
      char string[32];
      GetString(string, sizeof(string));
      return (uint)strtoul(string, null, 16);
   }

   float GetFloat(void)
   {
      char string[32];
      GetString(string, sizeof(string));
      return (float)FloatFromString(string);
   }

   double GetDouble(void)
   {
      char string[32];
      GetString(string, sizeof(string));
      return FloatFromString(string);
   }

   property void * input { set { input = value; } get { return input; } }
   property void * output { set { output = value; } get { return output; } }
   property bool buffered
   {
      set
      {
         FILE_set_buffered(input, output, value);
      }
   }
   property bool eof { get { return Eof(); } }

   int GetLineEx(char *s, int max, bool *hasNewLineChar)
   {
      int c = 0;
      s[c] = '\0';

      if(!Eof())
      {
         char ch = '\0';
         while(c < max - 1)
         {
            if(/*!Peek() || */ !Getc(&ch))
               break;
            if(ch == '\n')
               break;
            if(ch != '\r')
               s[c++] = ch;
         }
         if(hasNewLineChar)
            *hasNewLineChar = (ch == '\n');
      }
      s[c] = '\0';
      return c;
   }

   bool CopyTo(const char * outputFileName)
   {
      bool result = false;
      File f = FileOpen(outputFileName, write);
      if(f)
      {
         byte buffer[65536];

         result = true;
         Seek(0, start);
         while(!Eof())
         {
            uintsize count = Read(buffer, 1, sizeof(buffer));
            if(count && !f.Write(buffer, 1, count))
            {
               result = false;
               break;
            }
         }
         delete f;
      }
      Seek(0, start);
      return result;
   }

#if 0
   virtual bool Open(const char * fileName, FileOpenMode mode)
   {
      bool result = false;
      if(this)
      {
         FILE_FileOpen(fileName, mode, &input, &output);

         //file.mode = mode;
         if(!input && !output);
         else
         {
            openCount++;
            result = true;
            // TESTING ENABLING FILE BUFFERING BY DEFAULT... DOCUMENT ANY ISSUE
            /*
            if(file.input)
               setvbuf(file.input, null, _IONBF, 0);
            else
               setvbuf(file.output, null, _IONBF, 0);
            */
         }
         //if(!result)
         {
            /* TOFIX:
            LogErrorCode((mode == Read || mode == ReadWrite) ?
               ERR_FILE_NOT_FOUND : ERR_FILE_WRITE_FAILED, fileName);
            */
         }
      }
      return result;
   }
#endif

   virtual void Close()
   {
      CloseOutput();
      CloseInput();
   }
}

#if defined(__WIN32__)
default extern intptr_t stdinHandle;
default extern intptr_t stdoutHandle;
#endif

public class ConsoleFile : File
{
   input = eC_stdin();
   output = eC_stdout();

#if defined(__WIN32__)
   void CloseInput()
   {
      CloseHandle((HANDLE)stdinHandle);
   }
   /*
   void CloseOutput()
   {
      CloseHandle((HANDLE)stdoutHandle);
   }*/
#endif

   ~ConsoleFile()
   {
      input = null;
      output = null;
   }
};

public class FileAttribs : bool
{
public:
   bool isFile:1, isArchive:1, isHidden:1, isReadOnly:1, isSystem:1, isTemporary:1, isDirectory:1;
   bool isDrive:1, isCDROM:1, isRemote:1, isRemovable:1, isServer:1, isShare:1;
   // property bool { };
};

#ifdef ECERE_BOOTSTRAP
public class SecSince1970 : int64;
#endif

public struct FileStats
{
   FileAttribs attribs;
   uint64 size;
   SecSince1970 accessed;
   SecSince1970 modified;
   SecSince1970 created;
};

#if defined(__WIN32__)

// --- FileName functions ---

default TimeStamp Win32FileTimeToTimeStamp(FILETIME * fileTime)
{
   // TIME_ZONE_INFORMATION tz = { 0 };
   SYSTEMTIME st, lt;
   DateTime t;

   FileTimeToSystemTime(fileTime, &lt);

   /*
   GetTimeZoneInformation(&tz);
   tz.Bias = 0;
   _TzSpecificLocalTimeToSystemTime(&tz, &lt, &st);
   */
   st = lt;

   t.year = st.wYear;
   t.month = (Month)(st.wMonth - 1);
   t.day = st.wDay;
   t.hour = st.wHour;
   t.minute = st.wMinute;
   t.second = st.wSecond;
   return t;
}

default void TimeStampToWin32FileTime(TimeStamp t, FILETIME * fileTime)
{
   // TIME_ZONE_INFORMATION tz = { 0 };
   SYSTEMTIME st, lt;
   DateTime tm;

   tm = t;

   st.wYear = (short)tm.year;
   st.wMonth = (short)(tm.month + 1);
   st.wDay = (short)tm.day;
   st.wHour = (short)tm.hour;
   st.wMinute = (short)tm.minute;
   st.wSecond = (short)tm.second;
   st.wMilliseconds = 0;
   st.wDayOfWeek = 0;

   /*
   GetTimeZoneInformation(&tz);
   tz.Bias = 0;
   SystemTimeToTzSpecificLocalTime(&tz, &st, &lt);
   */

   lt = st;
   SystemTimeToFileTime(&lt, fileTime);
}
/*
default TimeStamp Win32FileTimeToTimeStamp(FILETIME * fileTime);
default void TimeStampToWin32FileTime(TimeStamp t, FILETIME * fileTime);
*/
default bool WinReviveNetworkResource(uint16 * _wfileName);

#endif

public FileAttribs FileExists(const char * fileName)
{
#if !defined(ECERE_BOOTSTRAP)
   char archiveName[MAX_LOCATION];
   const char * archiveFile;
   if(SplitArchivePath(fileName, archiveName, &archiveFile))
   {
      return EARFileSystem::Exists(archiveName, archiveFile);
   }
   else if(strstr(fileName, "http://") == fileName || strstr(fileName, "https://") == fileName || strstr(fileName, "wfs://") == fileName || strstr(fileName, "wfs3://") == fileName || strstr(fileName, "wfs3s://") == fileName)
   {
      return FileAttribs { isFile = true };
   }
   else
#endif
      return FILE_FileExists(fileName);
}

static int openCount;

public File FileOpen(const char * fileName, FileOpenMode mode)
{
   File result = null;
   if(fileName)
   {
#if !defined(ECERE_BOOTSTRAP)
      char archiveName[MAX_LOCATION];
      const char * archiveFile;
      if(SplitArchivePath(fileName, archiveName, &archiveFile))
      {
         result = EARFileSystem::Open(archiveName, archiveFile, mode);
      }
#if !defined(ECERE_VANILLA) && !defined(ECERE_NONET) && !defined(ECERE_NOCURL) /*&& !defined(__ANDROID__)*/ // Curl version not supported yet
      else if(strstr(fileName, "http://") == fileName || strstr(fileName, "https://"))
      {
         HTTPFile r = FileOpenURL(fileName);
         if(r && r.httpCode != 200)
            delete r;
         else
            result = r;
      }
#endif
      else
#endif
      if(strstr(fileName, "File://") == fileName)
      {
         result = (File)(uintptr)strtoull(fileName+7, null, 16);
         if(result)
         {
            if(result._class && eClass_IsDerived(result._class, class(File)))
            {
               if(!result._refCount) incref result;
               incref result;
               result.Seek(0, start);
            }
            else
               result = null;
         }
      }
      else
      {
         File file = File {};
         if(file)
         {
            FILE_FileOpen(fileName, mode, &file.input, &file.output);

            //file.mode = mode;
            if(!file.input && !file.output);
            else
            {
               openCount++;
               result = file;
               // TESTING ENABLING FILE BUFFERING BY DEFAULT... DOCUMENT ANY ISSUE
               /*
               if(file.input)
                  setvbuf(file.input, null, _IONBF, 0);
               else
                  setvbuf(file.output, null, _IONBF, 0);
               */
            }
            if(!result)
            {
               delete file;
               /* TOFIX:
               LogErrorCode((mode == Read || mode == ReadWrite) ?
                  ERR_FILE_NOT_FOUND : ERR_FILE_WRITE_FAILED, fileName);
               */
            }
         }
      }
   }
   return result;
}

public void FileFixCase(char * file)
{
   FILE_FileFixCase(file);
}

#if !defined(ECERE_BOOTSTRAP)
public bool FileTruncate(const char * fileName, uint64 size)
{
#if defined(__WIN32__)
   uint16 * _wfileName = UTF8toUTF16(fileName, null);
   int f = _wopen(_wfileName, _O_RDWR|_O_CREAT, _S_IREAD|_S_IWRITE);
   bool result = false;
   if(f != -1)
   {
      if(!_chsize_s(f, size))
         result = true;
      _close(f);
   }
   delete _wfileName;
   return result;
#else
   return truncate(fileName, size) == 0;
#endif
}
#endif

public bool FileGetSize(const char * fileName, FileSize * size)
{
   bool result = false;
   if(size)
   {
      *size = 0;
      if(fileName)
      {
#if !defined(ECERE_BOOTSTRAP)
         char archiveName[MAX_LOCATION];
         const char * archiveFile;
         if(SplitArchivePath(fileName, archiveName, &archiveFile))
            return EARFileSystem::GetSize(archiveName, archiveFile, size);
         else
#endif
            result = FILE_FileGetSize(fileName, size);
      }
   }
   return result;
}

public bool FileGetStats(const char * fileName, FileStats stats)
{
   bool result = false;
   if(stats && fileName)
   {
#if !defined(ECERE_BOOTSTRAP)
      char archiveName[MAX_LOCATION];
      const char * archiveFile;
      if(SplitArchivePath(fileName, archiveName, &archiveFile))
         result = EARFileSystem::Stats(archiveName, archiveFile, stats);
      else
#endif
         return FILE_FileGetStats(fileName, stats);
   }
   return result;
}

#ifndef ECERE_BOOTSTRAP

public bool FileSetAttribs(const char * fileName, FileAttribs attribs)
{
#ifdef __WIN32__
   uint winAttribs = 0;
   uint16 * _wfileName = UTF8toUTF16(fileName, null);

   if(attribs.isHidden)   winAttribs |= FILE_ATTRIBUTE_HIDDEN;
   if(attribs.isReadOnly) winAttribs |= FILE_ATTRIBUTE_READONLY;

   SetFileAttributes(_wfileName, winAttribs);
   delete _wfileName;
#endif
   return true;
}

public bool FileSetTime(const char * fileName, TimeStamp created, TimeStamp accessed, TimeStamp modified)
{
   bool result = false;
   TimeStamp currentTime = time(null);
   if(!created)  created = currentTime;
   if(!accessed) accessed = currentTime;
   if(!modified) modified = currentTime;
   if(fileName)
   {
#if defined(__WIN32__) && !defined(__UWP__)
      uint16 * _wfileName = UTF8toUTF16(fileName, null);
      HANDLE hFile = CreateFile(_wfileName, GENERIC_WRITE|GENERIC_READ, FILE_SHARE_READ|FILE_SHARE_WRITE, null,
         OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, null);
      delete _wfileName;
      if(hFile != INVALID_HANDLE_VALUE)
      {
         FILETIME c, a, m;

         TimeStampToWin32FileTime(created, &c);
         TimeStampToWin32FileTime(accessed, &a);
         TimeStampToWin32FileTime(modified, &m);

         /*
         {
            uint cc,aa,mm;

            cc = Win32FileTimeToTimeStamp(&c);
            aa = Win32FileTimeToTimeStamp(&a);
            mm = Win32FileTimeToTimeStamp(&m);
         }
         */

         if(SetFileTime(hFile, &c, &a, &m))
            result = true;

         CloseHandle(hFile);
      }
#elif !defined(__UWP__)
      struct utimbuf t = { (int)accessed, (int)modified };
      if(!utime(fileName, &t))
         result = true;
#endif
   }
   return result;
}

/****************************************************************************
 Directory Listing
****************************************************************************/
// Directory Description for file listing
private class Dir : struct
{
#if defined(__WIN32__)
   HANDLE fHandle;

#if !defined(__UWP__)
   int resource;
   NETRESOURCE * resources;
   int numResources;

   int workGroup;
   NETRESOURCE * workGroups;
   int numWorkGroups;
#endif

#else
   DIR * d;
#endif
   char name[MAX_LOCATION];
};

static FileDesc FileFind(const char * path, const char * extensions)
{
   FileDesc result = null;
   FileDesc file;

   if((file = FileDesc {}))
   {
      char archiveName[MAX_LOCATION];
      const char * archiveFile;
      if(SplitArchivePath(path, archiveName, &archiveFile))
      {
         if(EARFileSystem::Find(file, archiveName, archiveFile))
         {
            file.system = class(EARFileSystem);
            result = file;
         }
      }
      else
      {
         Dir d;

         if((d = file.dir = Dir {}))
         {
#if defined(__WIN32__)
            if(!strcmp(path, "/"))
            {
               int c;
               uint drives = 0xFFFFFFFF;
               d.fHandle = (HANDLE)(uintptr)drives; //GetLogicalDrives();
               for(c = 0; c<26; c++)
                  if(((uint)(uintptr)d.fHandle) & (1<<c))
                  {
                     char volume[MAX_FILENAME] = "";
                     uint16 _wvolume[MAX_FILENAME];
                     int driveType;
                     uint16 _wfilePath[4];

                     strcpy(d.name, path);
                     file.stats.attribs = FileAttribs { isDirectory = true, isDrive = true };
                     _wfilePath[0] = file.path[0] = (char)('A' + c);
                     _wfilePath[1] = file.path[1] = ':';
                     _wfilePath[2] = file.path[2] = '\\';
                     _wfilePath[3] = file.path[3] = '\0';
                     file.stats.size = 0;
                     file.stats.accessed = file.stats.created = file.stats.modified = 0;
                     driveType = GetDriveType(_wfilePath);
                     switch(driveType)
                     {
                        case DRIVE_REMOVABLE: file.stats.attribs.isRemovable = true; break;
                        case DRIVE_REMOTE:    file.stats.attribs.isRemote = true; break;
                        case DRIVE_CDROM:     file.stats.attribs.isCDROM = true; break;
                     }
                     drives ^= (1<<c);
                     if(driveType == DRIVE_NO_ROOT_DIR) continue;

                     if(driveType != DRIVE_REMOVABLE && driveType != DRIVE_REMOTE &&
                        GetVolumeInformation(_wfilePath, _wvolume, MAX_FILENAME - 1, null, null, null, null, 0))
                     {
                        file.path[2] = '\0';
                        UTF16toUTF8Buffer(_wvolume, volume, MAX_FILENAME);
                        sprintf(file.name, "%s [%s]", file.path, volume);
                     }
                     else
                     {
                        file.path[2] = '\0';
                        strcpy(file.name, file.path);
                     }
                     result = file;
                     break;
                  }
               d.fHandle = (HANDLE)(uintptr) drives;
#if !defined(__UWP__)
               d.resource = 0;
#endif
            }
            else if(path[0] != '\\' || path[1] != '\\' || strstr(path+2, "\\"))
            {
               WIN32_FIND_DATA winFile;
               uint16 dir[MAX_PATH];

               UTF8toUTF16Buffer(path, dir, MAX_LOCATION);
               if(path[0]) wcscat(dir, L"\\");
               wcscat(dir, L"*.*");

               d.fHandle = FindFirstFile(dir, &winFile);
 #if !defined(__UWP__)
               if(d.fHandle == INVALID_HANDLE_VALUE && WinReviveNetworkResource(dir))
                  d.fHandle = FindFirstFile(dir, &winFile);
#endif
               if(d.fHandle != INVALID_HANDLE_VALUE)
               {
                  UTF16toUTF8Buffer(winFile.cFileName, file.name, MAX_FILENAME);
                  strcpy(file.path, path);
                  PathCat(file.path, file.name);
                  /*if(path[0])
                     strcat(file.path, DIR_SEPS);
                  strcat(file.path, file.name);*/
                  // file.sizeHigh = winFile.nFileSizeHigh;
                  file.stats.size = winFile.nFileSizeLow;

                  file.stats.attribs = FileAttribs { };
                  file.stats.attribs.isArchive   = (winFile.dwFileAttributes & FILE_ATTRIBUTE_ARCHIVE)   ? true : false;
                  file.stats.attribs.isHidden    = (winFile.dwFileAttributes & FILE_ATTRIBUTE_HIDDEN)    ? true : false;
                  file.stats.attribs.isReadOnly  = (winFile.dwFileAttributes & FILE_ATTRIBUTE_READONLY)  ? true : false;
                  file.stats.attribs.isSystem    = (winFile.dwFileAttributes & FILE_ATTRIBUTE_SYSTEM)    ? true : false;
                  file.stats.attribs.isTemporary = (winFile.dwFileAttributes & FILE_ATTRIBUTE_TEMPORARY) ? true : false;
                  file.stats.attribs.isDirectory = (winFile.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) ? true : false;
                  file.stats.attribs.isFile = !(winFile.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY);
                  strcpy(d.name, path);

                  file.stats.accessed = Win32FileTimeToTimeStamp(&winFile.ftLastAccessTime);
                  file.stats.modified = Win32FileTimeToTimeStamp(&winFile.ftLastWriteTime);
                  file.stats.created  = Win32FileTimeToTimeStamp(&winFile.ftCreationTime);
                  result = file;
               }
            }
 #if !defined(__UWP__)
            else
            {
               HANDLE handle = 0;
               DWORD count = 0xFFFFFFFF;
               DWORD size = 512 * sizeof(NETRESOURCE);
               NETRESOURCE * buffer = (NETRESOURCE *)new0 byte[size];
               NETRESOURCE nr = {0};

               d.fHandle = null;
               nr.dwScope       = RESOURCE_GLOBALNET;
               nr.dwType        = RESOURCETYPE_DISK;
               nr.lpProvider = (uint16 *)L"Microsoft Windows Network";

               strcpy(d.name, path);
               if(path[2])
               {
                  nr.lpRemoteName = UTF8toUTF16(path, null);

                  // Server
                  WNetOpenEnum(RESOURCE_GLOBALNET, RESOURCETYPE_DISK, 0, &nr, &handle);
                  if(!handle)
                  {
                     WinReviveNetworkResource(nr.lpRemoteName);
                     WNetOpenEnum(RESOURCE_GLOBALNET, RESOURCETYPE_DISK, 0, &nr, &handle);
                  }

                  if(handle)
                  {
                     while(true)
                     {
                        int returnCode = WNetEnumResource(handle, &count, buffer, &size);
                        if(returnCode != ERROR_MORE_DATA)
                           break;
                        count = 0xFFFFFFFF;
                        buffer = (NETRESOURCE *)renew0 buffer byte[size];
                     }
                     WNetCloseEnum(handle);
                  }

                  delete nr.lpRemoteName;
                  if(count > 0)
                  {
                     file.stats.attribs = FileAttribs { isDirectory = true, isShare = true };
                     file.stats.size = 0;
                     file.stats.accessed = file.stats.created = file.stats.modified = 0;

                     UTF16toUTF8Buffer(buffer->lpRemoteName, file.path, MAX_LOCATION);
                     GetLastDirectory(file.path, file.name);

                     result = file;
                     d.resources = buffer;
                     d.numResources = count;
                     d.resource = 1;
                  }
                  else
                     delete buffer;
               }
               else
               {
                  int c;
                  nr.lpProvider = (uint16 *)L"Microsoft Windows Network";

                  // Entire Network
                  WNetOpenEnum(RESOURCE_GLOBALNET, RESOURCETYPE_DISK, 0, &nr, &handle);
                  while(true)
                  {
                     int returnCode = WNetEnumResource(handle, &count, buffer, &size);
                     if(returnCode != ERROR_MORE_DATA)
                        break;
                     count = 0xFFFFFFFF;
                     buffer = (NETRESOURCE *)renew0 buffer byte[size];
                  }
                  WNetCloseEnum(handle);

                  for(c = 0; c<count; c++)
                  {
                     NETRESOURCE * resources;
                     DWORD countInGroup = 0xFFFFFFFF;

                     size = 512 * sizeof(NETRESOURCE);
                     resources = (NETRESOURCE *)new0 byte[size];

                     // Entire Network
                     WNetOpenEnum(RESOURCE_GLOBALNET, RESOURCETYPE_DISK, 0, &buffer[c], &handle);
                     while(true)
                     {
                        int returnCode = WNetEnumResource(handle, &countInGroup, resources, &size);
                        if(returnCode != ERROR_MORE_DATA)
                           break;
                        countInGroup = 0xFFFFFFFF;
                        resources = (NETRESOURCE *)renew0 resources byte[size];
                     }
                     WNetCloseEnum(handle);

                     if(countInGroup)
                     {
                        file.stats.attribs = FileAttribs { isDirectory = true, isServer = true };
                        file.stats.size = 0;
                        file.stats.accessed = file.stats.created = file.stats.modified = 0;

                        UTF16toUTF8Buffer(resources->lpRemoteName, file.path, MAX_LOCATION);
                        strlwr(file.path);
                        file.path[2] = (char)toupper(file.path[2]);
                        GetLastDirectory(file.path, file.name);

                        result = file;

                        d.resources = resources;
                        d.numResources = countInGroup;
                        d.resource = 1;

                        d.workGroups = buffer;
                        d.numWorkGroups = count;
                        d.workGroup = c;
                        break;
                     }
                     else
                        delete resources;
                  }
                  if(c >= count && buffer) delete buffer;
               }
            }
#endif
#else
            struct dirent *de;
            struct stat s;

            d.d = opendir((path && path[0]) ? path : ".");
            if(d.d && (de = readdir(d.d)))
            {
               if(path[0])
               {
                  strcpy(file.path, path);
                  if(path[1])
                     strcat(file.path, DIR_SEPS);
               }
               strcpy(file.name,de->d_name);
               strcat(file.path, file.name);
               if(!stat(file.path, &s))
               {
                  file.stats.attribs = (s.st_mode&S_IFDIR) ? FileAttribs { isDirectory = true } : FileAttribs { isFile = true };
                  file.stats.size = (FileSize)s.st_size;
                  file.stats.accessed = s.st_atime;
                  file.stats.modified = s.st_mtime;
                  file.stats.created = s.st_ctime;
               }
               strcpy(d.name, path);

               result = file;
            }
#endif
         }

         if(!result)
            delete d;
      }
      if(!result)
         delete file;
   }
   if(result)
   {
      while(result && !result.Validate(extensions))
         result = result.FindNext(extensions);
   }
   return result;
}

private class FileDesc : struct
{
   FileStats stats;
   char name[MAX_FILENAME];
   char path[MAX_LOCATION];

   subclass(FileSystem) system;
   Dir dir;

   bool Validate(const char * extensions)
   {
      if(strcmp(name, "..") && strcmp(name, ".") && strcmp(name, ""))
      {
         if(extensions && !stats.attribs.isDirectory)
         {
            char extension[MAX_EXTENSION], compared[MAX_EXTENSION];
            int c;

            GetExtension(name, extension);
            for(c = 0; extensions[c];)
            {
               int len = 0;
               char ch;
               for(;(ch = extensions[c]) && !IS_ALUNDER(ch); c++);
               for(;(ch = extensions[c]) &&  IS_ALUNDER(ch); c++)
                  compared[len++] = ch;
               compared[len] = '\0';

               if(!strcmpi(extension, compared))
                  return true;
            }
         }
         else
            return true;
      }
      return false;
   }

   FileDesc FindNext(const char * extensions)
   {
      FileDesc result = null;

      Dir d = dir;

      name[0] = '.';
      name[1] = '\0';
      while(!Validate(extensions))
      {
         result = null;

         if(system)
         {
            if(system.FindNext(this))
               result = this;
            else
               break;
         }
         else
         {
#if defined(__WIN32__)
            if(!strcmp(d.name, "/"))
            {
               int c;
               uint drives = (uint)(uintptr)d.fHandle;
               for(c = 0; c<26; c++)
               {
                  if(drives & (1<<c))
                  {
                     char volume[MAX_FILENAME] = "";
                     int driveType;
                     uint16 _wpath[4];
                     uint16 _wvolume[MAX_FILENAME];

                     stats.attribs = FileAttribs { isDirectory = true, isDrive = true };
                     stats.size = 0;
                     stats.accessed = stats.created = stats.modified = 0;
                     _wpath[0] = path[0] = (char)('A' + c);
                     _wpath[1] = path[1] = ':';
                     _wpath[2] = path[2] = '\\';
                     _wpath[3] = path[3] = 0;
                     driveType = GetDriveType(_wpath);
                     drives ^= (1<<c);

                     switch(driveType)
                     {
                        case DRIVE_REMOVABLE: stats.attribs.isRemovable = true; break;
                        case DRIVE_REMOTE:    stats.attribs.isRemote = true;    break;
                        case DRIVE_CDROM:     stats.attribs.isCDROM = true;     break;
                     }
 #if !defined(__UWP__)
                     if(driveType == DRIVE_NO_ROOT_DIR)
                     {
                        uint16 remoteName[1024];
                        int status;
                        DWORD size = 1024;
                        _wpath[2] = 0;

                        status = WNetGetConnection(_wpath, remoteName, &size);
                        if(status != ERROR_CONNECTION_UNAVAIL)
                           continue;

                        _wpath[2] = '\\';
                        _wpath[3] = 0;
                     }
#endif

                     if(driveType != DRIVE_REMOVABLE && driveType != DRIVE_REMOTE &&
                        GetVolumeInformation(_wpath, _wvolume, MAX_FILENAME - 1, null, null, null, null, 0))
                     {
                        UTF16toUTF8Buffer(_wvolume, volume, MAX_FILENAME);
                        path[2] = '\0';
                        sprintf(name, "%s [%s]", path, volume);
                     }
                     else
                     {
                        path[2] = '\0';
                        strcpy(name, path);
                     }
                     result = this;
                     break;
                  }
               }
               d.fHandle = (HANDLE)(uintptr) drives;
               break;
            }
            else if(d.name[0] != '\\' || d.name[1] != '\\' || strstr(d.name+2, "\\"))
            {
               WIN32_FIND_DATA winFile;
               if(FindNextFile(d.fHandle, &winFile))
               {
                  UTF16toUTF8Buffer(winFile.cFileName, name, MAX_FILENAME);
                  stats.attribs = FileAttribs { };
                  stats.attribs.isArchive   = (winFile.dwFileAttributes & FILE_ATTRIBUTE_ARCHIVE)   ? true : false;
                  stats.attribs.isHidden    = (winFile.dwFileAttributes & FILE_ATTRIBUTE_HIDDEN)    ? true : false;
                  stats.attribs.isReadOnly  = (winFile.dwFileAttributes & FILE_ATTRIBUTE_READONLY)  ? true : false;
                  stats.attribs.isSystem    = (winFile.dwFileAttributes & FILE_ATTRIBUTE_SYSTEM)    ? true : false;
                  stats.attribs.isTemporary = (winFile.dwFileAttributes & FILE_ATTRIBUTE_TEMPORARY) ? true : false;
                  stats.attribs.isDirectory = (winFile.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) ? true : false;
                  stats.attribs.isFile      = !(winFile.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY);
                  stats.size = winFile.nFileSizeLow;

                  stats.accessed = Win32FileTimeToTimeStamp(&winFile.ftLastAccessTime);
                  stats.modified = Win32FileTimeToTimeStamp(&winFile.ftLastWriteTime);
                  stats.created  = Win32FileTimeToTimeStamp(&winFile.ftCreationTime);

                  strcpy(path, d.name);
                  PathCat(path, name);
                  /*if(d.name[0])
                     strcat(path, DIR_SEPS);
                  strcat(path, name);*/
                  result = this;
               }
               else
                  break;
            }
#if !defined(__UWP__)
            else
            {
               if(d.name[2])
               {
                  if(d.resource < d.numResources)
                  {
                     stats.attribs = FileAttribs { isDirectory = true, isShare = true };
                     stats.size = 0;
                     stats.accessed = stats.created = stats.modified = 0;

                     UTF16toUTF8Buffer(d.resources[d.resource].lpRemoteName, path, MAX_LOCATION);
                     GetLastDirectory(path, name);

                     result = this;

                     d.resource++;
                  }
                  else
                  {
                     delete d.resources;
                     break;
                  }
               }
               else
               {
                  int c;
                  for(c = d.workGroup; c<d.numWorkGroups; c++)
                  {
                     if(c != d.workGroup)
                     {
                        DWORD countInGroup = 0xFFFFFFFF;
                        HANDLE handle;
                        NETRESOURCE * resources;
                        DWORD size = 512 * sizeof(NETRESOURCE);

                        resources = (NETRESOURCE *)new0 byte[size];
                        // Entire Network
                        WNetOpenEnum(RESOURCE_GLOBALNET, RESOURCETYPE_DISK, 0, &d.workGroups[c], &handle);
                        while(true)
                        {
                           int returnCode = WNetEnumResource(handle, &countInGroup, resources, &size);
                           if(returnCode != ERROR_MORE_DATA)
                              break;
                           countInGroup = 0xFFFFFFFF;
                           resources = (NETRESOURCE *)renew0 resources byte[size];

                        }
                        WNetCloseEnum(handle);
                        d.numResources = countInGroup;
                        d.resources = resources;
                        d.resource = 0;
                     }

                     if(d.resource < d.numResources)
                     {
                        stats.attribs = FileAttribs { isDirectory = true, isServer = true };
                        stats.size = 0;
                        stats.accessed = stats.created = stats.modified = 0;

                        UTF16toUTF8Buffer(d.resources[d.resource].lpRemoteName, path, MAX_LOCATION);
                        strlwr(path);
                        path[2] = (char)toupper(path[2]);
                        GetLastDirectory(path, name);

                        result = this;

                        d.resource++;
                        break;
                     }
                     else
                     {
                        if(d.resources)
                           delete d.resources;
                     }
                  }
                  d.workGroup = c;
                  if(d.workGroup == d.numWorkGroups && d.resource == d.numResources)
                  {
                     delete d.workGroups;
                     break;
                  }
               }
            }
#endif
#else
            struct dirent *de;
            struct stat s;

            de = readdir(d.d);
            if(de)
            {
               strcpy(name,de->d_name);
               strcpy(path, d.name);
               if(d.name[0] && d.name[1])
                  strcat(path, DIR_SEPS);
               strcat(path, name);
               if(!stat(path, &s))
               {
                  stats.attribs = FileAttribs { };
                  stats.attribs = (s.st_mode&S_IFDIR) ? FileAttribs { isDirectory = true } : FileAttribs { isFile = true };
                  stats.size = (FileSize)s.st_size;
                  stats.accessed = s.st_atime;
                  stats.modified = s.st_mtime;
                  stats.created = s.st_ctime;
               }
               result = this;
            }
            else
               break;
#endif
         }
      }
      if(!result)
         CloseDir();
      return result;
   }

   void CloseDir(void)
   {
      if(system)
         system.CloseDir(this);
      else
      {
         Dir d = dir;
         if(d)
         {
#if defined(__WIN32__)
            if(d.fHandle && strcmp(d.name, "/"))
               FindClose(d.fHandle);
#else
            closedir(d.d);
#endif
            delete d;
         }
      }
      delete this;
   }
}

public struct FileListing
{
public:
   const char * directory;
   const char * extensions;

   bool Find()
   {
      if(desc)
         desc = desc.FindNext(extensions);
      else
         desc = FileFind(directory, extensions);
      if(desc)
         return true;
      return false;
   }

   void Stop()
   {
      if(desc)
         desc.CloseDir();
      desc = null;
   }

   property const char * name { get { return desc ? desc.name : null; } };
   property const char * path { get { return desc ? desc.path : null; } };
   property FileStats stats { get { value = desc ? desc.stats : FileStats { }; } };

private:
   FileDesc desc;
};
#endif

public File CreateTemporaryFile(char * tempFileName, const char * template)
{
#ifndef ECERE_BOOTSTRAP // quick fix for now
   File f;
#if defined(__unix__) || defined(__APPLE__)
   char buffer[MAX_FILENAME];
   int fd;
   strcpy(buffer, "/tmp/");
   strcat(buffer, template);
   //strcpy(buffer, template);
   strcat(buffer, "XXXXXX");
   // mktemp(buffer);
   fd = mkstemp(buffer);
   strcpy(tempFileName, buffer);
   f = { };
   f.output = f.input = fdopen(fd, "r+");
#else
   char tempPath[MAX_LOCATION];
   GetTempPathA(MAX_LOCATION, tempPath);     // TODO: Patch this whole thing to support Unicode temp path
   GetTempFileNameA(tempPath, template, 0, tempFileName);
   f = FileOpen(tempFileName, readWrite);
#endif
   return f;
#else
   return null;
#endif
}

#undef DeleteFile

public void CreateTemporaryDir(char * tempFileName, const char * template)
{
#ifndef ECERE_BOOTSTRAP // quick fix for now
#if defined(__unix__) || defined(__APPLE__)
   char buffer[MAX_FILENAME];
   strcpy(buffer, "/tmp/");
   strcat(buffer, template);
   //strcpy(buffer, template);
   strcat(buffer, "XXXXXX");
   // mkstemp(buffer);
   mkdtemp(buffer);
   strcpy(tempFileName, buffer);
#else
   char tempPath[MAX_LOCATION];
   GetTempPathA(MAX_LOCATION, tempPath);     // TODO: Patch this whole thing to support Unicode temp path
   GetTempFileNameA(tempPath, template, 0, tempFileName);
   DeleteFile(tempFileName);
   MakeDir(tempFileName);
#endif
#endif
}

public void MakeSlashPath(char * p)
{
   FileFixCase(p);
   if(__runtimePlatform == win32)
      ChangeCh(p, '\\', '/');
}

public void MakeSystemPath(char * p)
{
   FileFixCase(p);
}

public char * CopySystemPath(const char * p)
{
   char * d = CopyString(p);
   if(d)
      MakeSystemPath(d);
   return d;
}

public char * CopyUnixPath(const char * p)
{
   char * d = CopyString(p);
   if(d)
      MakeSlashPath(d);
   return d;
}

public char * GetSystemPathBuffer(char * d, const char * p)
{
   if(d != p)
      strcpy(d, p ? p : "");
   MakeSystemPath(d);
   return d;
}

public char * GetSlashPathBuffer(char * d, const char * p)
{
   if(d != p)
      strcpy(d, p ? p : "");
   MakeSlashPath(d);
   return d;
}
