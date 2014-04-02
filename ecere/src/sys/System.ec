namespace sys;

#if defined(ECERE_BOOTSTRAP)
#undef __WIN32__
#undef __unix__
#undef __APPLE__
#endif

default:
#define uint _uint
#define set _set

#if defined(__WIN32__)

#define WIN32_LEAN_AND_MEAN
#define UNICODE
#define GetFreeSpace _GetFreeSpace
#define String String_
#include <windows.h>
#undef String
#undef GetFreeSpace

#elif defined(__unix__) || defined(__APPLE__)

#include <sys/time.h>
#include <unistd.h>

#endif

#undef __BLOCKS__
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#undef uint
#undef set

default:
FILE *eC_stdout(void);
FILE *eC_stderr(void);

// IMPLEMENTED IN _System.c
bool System_MoveFile(char * source, char * dest);
bool System_RenameFile(char * oldName, char * newName);
bool System_DeleteFile(char * fileName);
bool System_MakeDir(char * path);
bool System_RemoveDir(char * path);
char * System_GetWorkingDir(char * buf, int size);
bool System_ChangeWorkingDir(char * buf);
char * System_GetEnvironment(char * envName, char * envValue, int max);
void System_SetEnvironment(char * envName, char * envValue);
void System_UnsetEnvironment(char * envName);
bool System_Execute(char * env, char * command, va_list args, bool wait);
bool System_ShellOpen(char * fileName, va_list args);
void System_GetFreeSpace(char * path, FileSize64 * size);

private:

import "Array"
import "i18n"
import "File"
import "TempFile"
import "memory"

#if !defined(ECERE_BOOTSTRAP)
import "units"
import "Time"
import "Mutex"
import "Semaphore"
import "FileMonitor"
import "Thread"
import "Archive"
import "EARArchive"
import "Date"
import "unicode"
import "GuiApplication"
#endif

public enum LoggingMode { noLogging, stdOut, stdErr, debug, logFile, msgBox, buffer };

// GENERAL ERROR CODES
public enum ErrorLevel
{
   veryFatal = 0,
   fatal = 1,
   major = 2,
   minor = 3
};

public define AllErrors = ErrorLevel::Minor;

public class ErrorCode
{
public:
   ErrorLevel level:2:12;
   uint code:12:0;
};

// TODO: Support enums resolved in compiling pass to allow moving this to GuiApplication.ec
public enum SysErrorCode : ErrorCode
{
   allocationFailed = ErrorCode { fatal, 0x001 },
   nameInexistant   = ErrorCode { fatal, 0x002 },
   nameExists       = ErrorCode { fatal, 0x003 },
   missingLibrary   = ErrorCode { fatal, 0x004 },
   fileNotFound     = ErrorCode { minor, 0x005 },
   writeFailed      = ErrorCode { major, 0x006 }
};

public enum GuiErrorCode : ErrorCode
{
   driverNotSupported      = ErrorCode { veryFatal, 0x101 },
   windowCreationFailed    = ErrorCode { veryFatal, 0x102 },
   graphicsLoadingFailed   = ErrorCode { veryFatal, 0x103 },
   modeSwitchFailed        = ErrorCode { veryFatal, 0x104 }
};

static define DEFAULT_BUFFER_SIZE = 100 * MAX_F_STRING;

static Array<Array<String>> errorMessages
{ [
   // System
   { [
      $"No error",
      $"Memory allocation failed",
      $"Inexistant string identifier specified",
      $"Identic string identifier already exists",
      $"Shared library loading failed",
      $"File not found",
      $"Couldn't write to file"
   ] },
   // GUI
   { [
      $"No error",
      $"Graphics driver not supported by any user interface system",
      $"Window creation failed",
      $"Window graphics loading failed",
      $"Driver/Mode switch failed"
   ] }
] };

// --- File, directory & environment manipulation ---
#undef MoveFile

public bool MoveFile(char * source, char * dest)
{
   return System_MoveFile(source, dest);
}

public bool RenameFile(char * oldName, char * newName)
{
   return System_RenameFile(oldName, newName);
}

#undef DeleteFile

public bool DeleteFile(char * fileName)
{
   return System_DeleteFile(fileName);
}

public bool MakeDir(char * path)
{
   return System_MakeDir(path);
}

public bool RemoveDir(char * path)
{
   return System_RemoveDir(path);
}

public char * GetWorkingDir(char * buf, int size)
{
   return System_GetWorkingDir(buf, size);
}

public bool ChangeWorkingDir(char * buf)
{
   return System_ChangeWorkingDir(buf);
}

public char * GetEnvironment(char * envName, char * envValue, int max)
{
   return System_GetEnvironment(envName, envValue, max);
}

public void SetEnvironment(char * envName, char * envValue)
{
   System_SetEnvironment(envName, envValue);
}

public void UnsetEnvironment(char * envName)
{
   System_UnsetEnvironment(envName);
}

public bool Execute(char * command, ...)
{
   bool result;
   va_list args;
   va_start(args, command);
   result = System_Execute(null, command, args, false);
   va_end(args);
   return result;
}

public bool ExecuteWait(char * command, ...)
{
   bool result;
   va_list args;
   va_start(args, command);
   result = System_Execute(null, command, args, true);
   va_end(args);
   return result;
}

public bool ExecuteEnv(char * env, char * command, ...)
{
   bool result;
   va_list args;
   va_start(args, command);
   result = System_Execute(env, command, args, false);
   va_end(args);
   return result;
}

public bool ShellOpen(char * fileName, ...)
{
   bool result;
   va_list args;
   result = System_ShellOpen(fileName, args);
   va_end(args);
   return result;
}

public void GetFreeSpace(char * path, FileSize64 * size)
{
   System_GetFreeSpace(path, size);
}

// --- Uncagotegorized Functions ---
public void Logf(char * format, ...)
{
   va_list args;
   char string[MAX_F_STRING];
   va_start(args, format);
   vsnprintf(string, sizeof(string), format, args);
   string[sizeof(string)-1] = 0;
   Log(string);
   va_end(args);
}

public void Log(char * text)
{
   switch(globalSystem.errorLoggingMode)
   {
      case debug:
#if defined(__WIN32__) && !defined(ECERE_BOOTSTRAP)
      {
         uint16 * _wtext = UTF8toUTF16(text, null);
         OutputDebugString(_wtext);
         delete _wtext;
         break;
      }
#endif
      case stdOut:
         fputs(text, eC_stdout());
         fflush(eC_stdout());
         break;
      case stdErr:
         fputs(text, eC_stderr());
         fflush(eC_stderr());
         break;
      case logFile:
      {
         File f;
         if((f = FileOpen(globalSystem.logFile, append)))
         {
            f.Puts(text);
            delete f;
         }
         break;
      }
      case buffer:
      case msgBox:
         strcat(globalSystem.errorBuffer, text);
         break;
   }
}

public void DumpErrors(bool display)
{
   if(globalSystem.errorBuffer && globalSystem.errorBuffer[0])
   {
      if(display)
      {
#if defined(__WIN32__) && !defined(ECERE_BOOTSTRAP)
         if(globalSystem.errorLoggingMode == buffer)
            printf(globalSystem.errorBuffer);
         else
         {
            char title[1024];
            sprintf(title, "%s - Error Log", guiApp.appName);
            MessageBox(HWND_DESKTOP, globalSystem.errorBuffer, title, MB_OK|MB_ICONWARNING);
         }
#else
         printf(globalSystem.errorBuffer);
#endif
      }
      globalSystem.errorBuffer[0] = '\0';
   }
}

public void LogErrorCode(ErrorCode errorCode, char * details)
{
   if(errorCode.level <= globalSystem.errorLevel)
   {
      int cat = (errorCode.code & 0xF00) >> 8;
      int code = errorCode.code & 0xFF;
      if(details)
         Logf("System Error [%d]: %s (%s).\n",
            errorCode.level,
            errorMessages[cat][code],
            details);
      else
         Logf("System Error [%d]: %s.\n",
            errorCode.level,
            errorMessages[cat][code]);
   }
   globalSystem.lastErrorCode = errorCode;
}

public uint GetLastErrorCode()
{
   return globalSystem.lastErrorCode;
}

public void ResetError()
{
   globalSystem.lastErrorCode = 0;
}

public void SetErrorLevel(ErrorLevel level)
{
   globalSystem.errorLevel = level;
}

public void SetLoggingMode(LoggingMode mode, void * where)
{
   globalSystem.errorLoggingMode = mode;

   if(mode == logFile)
   {
      File file;
      strcpy(globalSystem.logFile, where);
      file = FileOpen(globalSystem.logFile, write);
      delete file;
   }
   else if(mode == buffer || mode == msgBox)
   {
      if(!globalSystem.errorBuffer)
      {
         globalSystem.errorBufferSize = DEFAULT_BUFFER_SIZE;
         globalSystem.errorBuffer = new char[DEFAULT_BUFFER_SIZE];
      }
      globalSystem.errorBuffer[0] = 0;
   }
   else if(mode == debug)
   {
#if defined(__WIN32__) && !defined(ECERE_BOOTSTRAP)
      uint16 * _wappName = UTF8toUTF16(guiApp.appName, null);
      OutputDebugString(L"\n");
      OutputDebugString(_wappName);
      OutputDebugString(L" - Logging Errors...\n");
      delete _wappName;
#endif
   }
   if(mode == 0)
   {
      DumpErrors(true);
      if(globalSystem.errorBuffer)
      {
         delete globalSystem.errorBuffer;
         globalSystem.errorBufferSize = 0;
      }
   }
}

static define errorLogMsg = $"\n\nWould you like to view the error log?";

#if defined(__WIN32__) && !defined(ECERE_BOOTSTRAP)
static DWORD REAL_ExceptionHandler(EXCEPTION_POINTERS *exception)
{
   EXCEPTION_RECORD * record = exception->ExceptionRecord;
   char exceptionString[1024] = "", title[1024];

   switch(record->ExceptionCode)
   {
      case EXCEPTION_ACCESS_VIOLATION:
         if(record->ExceptionInformation[0])
            sprintf(exceptionString, "Access Violation Writing to 0x%08X", record->ExceptionInformation[1]);
         else
            sprintf(exceptionString, "Access Violation Reading from 0x%08X", record->ExceptionInformation[1]);
         break;
      case EXCEPTION_ARRAY_BOUNDS_EXCEEDED:
         sprintf(exceptionString, "Array Bounds Exceeded");
         break;
      case EXCEPTION_BREAKPOINT:
         sprintf(exceptionString, "Breakpoint Encountered");
         break;
      case EXCEPTION_DATATYPE_MISALIGNMENT:
         sprintf(exceptionString, "Data Type Misalignment");
         break;
      case EXCEPTION_FLT_DENORMAL_OPERAND:
         sprintf(exceptionString, "Floating-Point Denormal Operand");
         break;
      case EXCEPTION_FLT_DIVIDE_BY_ZERO:
         sprintf(exceptionString, "Floating-Point Divide by Zero");
         break;
      case EXCEPTION_FLT_INEXACT_RESULT:
         sprintf(exceptionString, "Floating-Point Inexact Result");
         break;
      case EXCEPTION_FLT_INVALID_OPERATION:
         sprintf(exceptionString, "Floating-Point Invalid Operation");
         break;
      case EXCEPTION_FLT_OVERFLOW:
         sprintf(exceptionString, "Floating-Point Overflow");
         break;
      case EXCEPTION_FLT_STACK_CHECK:
         sprintf(exceptionString, "Floating-Point Stack Check");
         break;
      case EXCEPTION_FLT_UNDERFLOW:
         sprintf(exceptionString, "Floating-Point Underflow");
         break;
      case EXCEPTION_ILLEGAL_INSTRUCTION:
         sprintf(exceptionString, "Illegal Instruction");
         break;
      case EXCEPTION_IN_PAGE_ERROR:
         sprintf(exceptionString, "In Page Error");
         break;
      case EXCEPTION_INT_DIVIDE_BY_ZERO:
         sprintf(exceptionString, "Integer Divide by Zero");
         break;
      case EXCEPTION_INT_OVERFLOW:
         sprintf(exceptionString, "Integer Overflow");
         break;
      case EXCEPTION_INVALID_DISPOSITION:
         sprintf(exceptionString, "Invalid Disposition");
         break;
      case EXCEPTION_NONCONTINUABLE_EXCEPTION:
         sprintf(exceptionString, "Non Continuable Exception");
         break;
      case EXCEPTION_PRIV_INSTRUCTION:
         sprintf(exceptionString, "Unallowed Instruction");
         break;
      case EXCEPTION_SINGLE_STEP:
         sprintf(exceptionString, "Single Step Exception");
         break;
      case EXCEPTION_STACK_OVERFLOW:
         return EXCEPTION_CONTINUE_SEARCH;
         /*
         sprintf(exceptionString, "Stack Overflow");
         break;
         */
   }

   sprintf(title, "%s - Fatal Error", guiApp.appName);

   if(globalSystem.errorBuffer && globalSystem.errorBuffer[0])
   {
      strcat(exceptionString, errorLogMsg);
      if(MessageBox(HWND_DESKTOP, exceptionString, title, MB_YESNO|MB_ICONERROR) == IDYES)
         DumpErrors(true);
   }
   else
      MessageBox(HWND_DESKTOP, exceptionString, title, MB_OK|MB_ICONERROR);

   return EXCEPTION_EXECUTE_HANDLER;
}
#endif

private struct System
{
   LoggingMode errorLoggingMode;
   char * errorBuffer;
   int errorBufferSize;
   char logFile[MAX_LOCATION];
   ErrorCode lastErrorCode;
   ErrorLevel errorLevel;

   Semaphore eventSemaphore;

   //FileSystem fileSystems;

   // File Monitor
   OldList fileMonitors;
   Mutex fileMonitorMutex;
   Thread fileMonitorThread;
   bool systemTerminate;
};

System globalSystem;
