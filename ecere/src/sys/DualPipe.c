#if defined(__WIN32__)
#define WIN32_LEAN_AND_MEAN
#define UNICODE
#include <windows.h>
#else
#include <sys/select.h>
#include <signal.h>
#include <unistd.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <errno.h>
#endif

#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define POM_output   1
#define POM_error    2
#define POM_input    4

#define FSM_start    0
#define FSM_current  1
#define FSM_end      2


#define false  0
#define true   1

#define null   ((void *)0)

typedef unsigned int FileSeekMode;
typedef unsigned int PipeOpenMode;
typedef unsigned char byte;
typedef unsigned short uint16;
typedef unsigned int uint;
typedef int bool;

#define forArgsPassing 2
int __ecereNameSpace__ecere__sys__Tokenize(char * string, int maxTokens, char * tokens[], unsigned int esc);
char * __ecereNameSpace__ecere__sys__CopyString(char * string);
void __ecereNameSpace__ecere__com__eSystem_Delete(void * memory);
unsigned short * __ecereNameSpace__ecere__sys__UTF8toUTF16(char * source, int * wordCount);

typedef struct
{
#if defined(__WIN32__)
   HANDLE inputHandle, outputHandle;
   HANDLE hProcess;
#else
   FILE * input, * output;
   int exitCode;
#endif
   int pid;
   bool eof:1, gotExitCode:1;
} _DualPipe;

void DualPipe_Destructor(_DualPipe * dp)
{
#if defined(__WIN32__)
   if(dp->outputHandle)
   {
      CloseHandle(dp->outputHandle);
      dp->outputHandle = null;
   }
   if(dp->inputHandle)
   {
      CloseHandle(dp->inputHandle);
      dp->inputHandle = null;
   }
   if(dp->hProcess)
      CloseHandle(dp->hProcess);
#endif
   free(dp);
}

void DualPipe_CloseInput(_DualPipe * dp)
{
#if defined(__WIN32__)
   if(dp->inputHandle)
   {
      CloseHandle(dp->inputHandle);
      dp->inputHandle = null;
   }
#endif
}

void DualPipe_CloseOutput(_DualPipe * dp)
{
#if defined(__WIN32__)
   if(dp->outputHandle)
   {
      CloseHandle(dp->outputHandle);
      dp->outputHandle = null;
   }
#endif
}

int DualPipe_Read(_DualPipe * dp, byte * buffer, uint size, uint count)
{
#if defined(__WIN32__)
   unsigned int read;
   dp->eof = !ReadFile(dp->inputHandle, buffer, size*count, (DWORD *)&read, null);
   return read / size;
#else
   int result;
   result = read(fileno(dp->input), buffer, size * count);
   if(!result || (result < 0 && errno != EAGAIN))
      dp->eof = true;
   return (result > 0) ? (result / size) : 0;
#endif
}

int DualPipe_Write(_DualPipe * dp, byte * buffer, uint size, uint count)
{
#if defined(__WIN32__)
   unsigned int written;
   WriteFile(dp->outputHandle, buffer, size * count, (DWORD *)&written, null);
   return written / size;
#endif
   return 0;
}

bool DualPipe_Getc(_DualPipe * dp, char * ch)
{
#if defined(__WIN32__)
   unsigned int read;
   dp->eof = !ReadFile(dp->inputHandle, ch, 1, (DWORD *)&read, null);
   return !dp->eof && read != 0;
#endif
   return false;
}

bool DualPipe_Putc(_DualPipe * dp, char ch)
{
#if defined(__WIN32__)
   unsigned int written;
   WriteFile(dp->outputHandle, &ch, 1, (DWORD *)&written, null);
   return written != 0;
#endif
   return false;
}

bool DualPipe_Puts(_DualPipe * dp, char * string)
{
#if defined(__WIN32__)
   unsigned int written;
   int len = strlen(string);
   WriteFile(dp->outputHandle, string, len, (DWORD *)&written, null);
   return written == len;
#endif
   return false;
}

bool DualPipe_Seek(_DualPipe * dp, int pos, FileSeekMode mode)
{
#if defined(__WIN32__)
   bool result = false;
   switch(mode)
   {
      case FSM_start:
         result = SetFilePointer(dp->inputHandle, pos, null, FILE_BEGIN) != -1;
         break;
      case FSM_current:
         result = SetFilePointer(dp->inputHandle, pos, null, FILE_CURRENT) != -1;
         break;
      case FSM_end:
         result = SetFilePointer(dp->inputHandle, pos, null, FILE_END) != -1;
         break;
   }
   return result;   
#endif
   return false;
}

uint DualPipe_Tell(_DualPipe * dp)
{
#if defined(__WIN32__)
   return (uint)SetFilePointer(dp->inputHandle, 0, null, FILE_CURRENT);
#endif
   return 0;
}

bool DualPipe_Eof(_DualPipe * dp)
{
#if defined(__WIN32__)
   return dp->eof;
#else
   return !dp->input || dp->eof || feof(dp->input);
#endif
}

// Not yet supported... Will ever be?
bool DualPipe_GetSize(_DualPipe * dp)
{
   return 0; 
}

bool DualPipe_Peek(_DualPipe * dp)
{
#if defined(__WIN32__)
   uint avail = 0;
   int result = PeekNamedPipe(dp->inputHandle, null, 0, null, (DWORD *)&avail, null);
   if(!result)
   {
      unsigned int read;
      char buffer[1];
      dp->eof = !ReadFile(dp->inputHandle, buffer, 0, (DWORD *)&read, null);
   }      
   return avail ? true : false;
#else
   bool result = false; //true; // false
   if(!DualPipe_Eof(dp))
   {
      fd_set rs;
      struct timeval tv;
      int fd = fileno(dp->input);
      FD_ZERO(&rs);
      FD_SET(fd, &rs);
      tv.tv_sec = 0;
      tv.tv_usec = 0;
      return select(fd+1, &rs, null, null, &tv) > 0;
   }
   return result;
#endif
}

void DualPipe_Terminate(_DualPipe * dp)
{
#if defined(__WIN32__)
   TerminateProcess(dp->hProcess, 0);
#else
   if(dp->pid)
      kill(dp->pid, SIGTERM);
#endif
}

int DualPipe_GetExitCode(_DualPipe * dp)
{
#if !defined(__WIN32__)
   if(!dp->gotExitCode)
   {
      int status = 0;
      waitpid(dp->pid, &status, 0);
      dp->exitCode = WEXITSTATUS(status);
      dp->gotExitCode = true;
   }
   /*#if defined(__linux__)
      // Until we support this _extension_ syntax: (moved this to a C file...)
      // return (((( _extension_   (((union { __typeof(status) __in; int __i; }) { .__in = (status) }).__i))) & 0xff00) >> 8);
      // return ((__extension__({ union { __typeof(status) __in;  int __i; } __u; __u.__in = (status); __u.__i; }) ) & 0xFF00) >> 8;
   #else*/
   return dp->exitCode;
   //#endif
   //return __WEXITSTATUS(status);
#else
   int exitCode = 0;
   // NOTE: This was inconsistent with Linux version waiting... Testing Suite would not return proper values
   WaitForSingleObject(dp->hProcess, INFINITE);
   GetExitCodeProcess(dp->hProcess, (DWORD *)&exitCode);
   return exitCode;
#endif
}

int DualPipe_GetProcessID(_DualPipe * dp)
{
   return dp->pid;
   // Requires Windows Vista or Windows XP SP1.
   // return GetProcessId(hProcess);
}

void DualPipe_Wait(_DualPipe * dp)
{
#if defined(__WIN32__)   
   WaitForSingleObject(dp->hProcess, INFINITE);
#else
   if(dp->pid)
   {
      int status = 0;
      waitpid(dp->pid, &status, 0);
      dp->exitCode = WEXITSTATUS(status);
      dp->gotExitCode = true;
   }
#endif   
}

_DualPipe * _DualPipeOpen(PipeOpenMode mode, char * commandLine, char * env, void ** inputPtr, void ** outputPtr)
{
   _DualPipe * f = null;
#define PIPE_READ    0
#define PIPE_WRITE   1

#if !defined(__WIN32__)
   {
      FILE * input = null, * output = null;
      int hInput[2] = { 0 }, hOutput[2] = { 0 };
      pid_t pid;
      
      if((mode & POM_error) || (mode & POM_output))
         pipe(hOutput);

      if((mode & POM_input))
         pipe(hInput);

      pid = fork();
      if(pid > 0)
      {
         // This process
         if(hInput[PIPE_READ])
         {
            close(hInput[PIPE_READ]);
            output = fdopen(hInput[PIPE_WRITE],"w");
         }
         if(hOutput[PIPE_WRITE])
         {
            close(hOutput[PIPE_WRITE]);
            input = fdopen(hOutput[PIPE_READ],"r");
         }
      }
      else if(pid == 0)
      {
         // Child process
         char * tokens[129];
         int numTokens;
         char * commandLineCopy = __ecereNameSpace__ecere__sys__CopyString(commandLine);

         if(hInput[PIPE_WRITE])
            close(hInput[PIPE_WRITE]);
         if(hOutput[PIPE_READ])
            close(hOutput[PIPE_READ]);
         
         if((mode & POM_error) && hOutput[PIPE_WRITE] != STDERR_FILENO)
            dup2(hOutput[PIPE_WRITE], STDERR_FILENO);

         if((mode & POM_output) && hOutput[PIPE_WRITE] != STDOUT_FILENO)
            dup2(hOutput[PIPE_WRITE], STDOUT_FILENO);
         if(hOutput[PIPE_WRITE] && hOutput[PIPE_WRITE] != STDOUT_FILENO)
            close(hOutput[PIPE_WRITE]);            
         
         if((mode & POM_input) && hInput[PIPE_READ] != STDIN_FILENO)
         {
            dup2(hInput[PIPE_READ], STDIN_FILENO);
            close(hInput[PIPE_READ]);
         }
         
#if 0 //#ifdef _DEBUG
         fprintf(stderr, "\n_DualPipeOpen (in child): %s\n\n", commandLineCopy);
#endif
         numTokens = __ecereNameSpace__ecere__sys__Tokenize(commandLineCopy, sizeof(tokens) / sizeof(tokens[0]) - 1, tokens, forArgsPassing);
#if 0 //#ifdef _DEBUG
         { int c; for(c=0; c<numTokens; c++) fprintf(stderr, "argv[%d]: %s\n", c, tokens[c]); fprintf(stderr, "\n"); }
#endif
         tokens[numTokens] = null;
         if(env)
         {
            char * envTokens[129];
            char * envCopy = __ecereNameSpace__ecere__sys__CopyString(env);
            int numEnvTokens = __ecereNameSpace__ecere__sys__Tokenize(envCopy, sizeof(envTokens) / sizeof(envTokens[0]) - 1, envTokens, false);
            envTokens[numEnvTokens] = null;

            if(execve(tokens[0], tokens, envTokens) < 0)
            {
               __ecereNameSpace__ecere__com__eSystem_Delete(commandLineCopy);
               __ecereNameSpace__ecere__com__eSystem_Delete(envCopy);
               exit(1);
            }
            __ecereNameSpace__ecere__com__eSystem_Delete(commandLineCopy);
            __ecereNameSpace__ecere__com__eSystem_Delete(envCopy);
            exit(0);
         }
         else
         {
            if(execvp(tokens[0], (char **)tokens) < 0)
            {
               __ecereNameSpace__ecere__com__eSystem_Delete(commandLineCopy);
               exit(1);
            }
            __ecereNameSpace__ecere__com__eSystem_Delete(commandLineCopy);
            exit(0);
         }
      }
      if(input || output)
      {
         f = calloc(1, sizeof(_DualPipe));
         *inputPtr = f->input = input;
         *outputPtr = f->output = output;
         f->pid = pid;
      }
   }
#else
   {
      HANDLE hOutput[2] = { 0 },hOutputRead = 0;
      HANDLE hInput[2] = { 0 }, hInputWrite = 0;
      HANDLE hError[2] = { 0 }, hErrorRead = 0;
      HANDLE hStdErr = 0, hStdIn = 0, hStdOut = 0;
      SECURITY_ATTRIBUTES sa;
      PROCESS_INFORMATION pi = { 0 };
      STARTUPINFO si = { 0 };
      uint16 * _wcommandLine = __ecereNameSpace__ecere__sys__UTF8toUTF16(commandLine, null);

      sa.nLength = sizeof(SECURITY_ATTRIBUTES);
      sa.lpSecurityDescriptor = null;
      sa.bInheritHandle = TRUE;

      // Force redirecting if GUI application
      if(!(mode & POM_error))
         hStdErr = GetStdHandle(STD_ERROR_HANDLE);
      if(!(mode & POM_input))
         hStdIn  = GetStdHandle(STD_INPUT_HANDLE);
      if(!(mode & POM_output))
         hStdOut = GetStdHandle(STD_OUTPUT_HANDLE);

      if((mode & POM_output) || !hStdOut)
         CreatePipe(&hOutput[PIPE_READ],&hOutput[PIPE_WRITE],&sa,0);

      if(( (mode & POM_error) && !(mode & POM_output)) || 
         (!(mode & POM_error) && !hStdErr))
         CreatePipe(&hError[PIPE_READ], &hError[PIPE_WRITE],&sa,0);
         
      if((mode & POM_input) || !hStdIn)
         CreatePipe(&hInput[PIPE_READ], &hInput[PIPE_WRITE], &sa,0);

      if(hInput[PIPE_READ])
         DuplicateHandle(GetCurrentProcess(),hInput[PIPE_WRITE],GetCurrentProcess(),&hInputWrite,0,FALSE,DUPLICATE_SAME_ACCESS);

      if((mode & POM_error) && (mode & POM_output))
      {
         DuplicateHandle(GetCurrentProcess(),hOutput[PIPE_READ],GetCurrentProcess(),&hOutputRead,0,FALSE,DUPLICATE_SAME_ACCESS);
         DuplicateHandle(GetCurrentProcess(),hOutput[PIPE_WRITE],GetCurrentProcess(),&hError[PIPE_WRITE],0,TRUE,DUPLICATE_SAME_ACCESS);
      }
      else 
      {
         if(hOutput[PIPE_WRITE])
            DuplicateHandle(GetCurrentProcess(),hOutput[PIPE_READ],GetCurrentProcess(),&hOutputRead,0,FALSE,DUPLICATE_SAME_ACCESS);
         if(hError[PIPE_WRITE])
            DuplicateHandle(GetCurrentProcess(),hError[PIPE_READ],GetCurrentProcess(),&hErrorRead,0,FALSE,DUPLICATE_SAME_ACCESS);
      }

      if(hOutput[PIPE_READ])
         CloseHandle(hOutput[PIPE_READ]);
      if(hError[PIPE_READ])
         CloseHandle(hError[PIPE_READ]);
      if(hInput[PIPE_WRITE])
         CloseHandle(hInput[PIPE_WRITE]);

      // Set up the start up info struct.
      si.cb = sizeof(STARTUPINFO);
      si.dwFlags = STARTF_USESTDHANDLES|STARTF_USESHOWWINDOW;
      si.hStdOutput = hOutput[PIPE_WRITE] ? hOutput[PIPE_WRITE] : hStdOut;
      si.hStdInput  = hInput [PIPE_READ] ? hInput [PIPE_READ]  : hStdIn;
      if((mode & POM_error) && (mode & POM_output))
         si.hStdError = hOutput[PIPE_WRITE];
      else if((mode & POM_error))
         si.hStdError = hError[PIPE_WRITE];
      else
         si.hStdError = hError[PIPE_WRITE] ? hError[PIPE_WRITE] : hStdErr;

      if(CreateProcess(null,_wcommandLine,null,null,TRUE, 0,env,null ,&si,&pi))
      {
         CloseHandle(pi.hThread);

         f = calloc(1, sizeof(_DualPipe));
         f->inputHandle = hOutputRead;
         f->outputHandle = hInputWrite;
         f->hProcess = pi.hProcess;
         f->pid = pi.dwProcessId;
         *inputPtr = null;
         *outputPtr = null;
      }
      else
      {
         if(hOutputRead)
            CloseHandle(hOutputRead);
         if(hInputWrite)
            CloseHandle(hInputWrite);
         if(hErrorRead)
            CloseHandle(hErrorRead);
      }

      if(hInput [PIPE_READ])  CloseHandle(hInput [PIPE_READ]);
      if(hOutput[PIPE_WRITE]) CloseHandle(hOutput[PIPE_WRITE]);
      if(hError [PIPE_WRITE]) CloseHandle(hError [PIPE_WRITE]);
      __ecereNameSpace__ecere__com__eSystem_Delete(_wcommandLine);
   }
#endif
   return f;
}
