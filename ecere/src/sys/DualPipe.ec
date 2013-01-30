#include <stdarg.h>

namespace sys;

import "System"

default:
// IMPLEMENTATION OF THESE IS IN _DualPipe.c
void DualPipe_Destructor(_DualPipe * dp);
void DualPipe_CloseInput(_DualPipe * dp);
void DualPipe_CloseOutput(_DualPipe * dp);
int DualPipe_Read(_DualPipe * dp, byte * buffer, uint size, uint count);
int DualPipe_Write(_DualPipe * dp, byte * buffer, uint size, uint count);
bool DualPipe_Getc(_DualPipe * dp, char * ch);
bool DualPipe_Putc(_DualPipe * dp, char ch);
bool DualPipe_Puts(_DualPipe * dp, char * string);
bool DualPipe_Seek(_DualPipe * dp, int pos, FileSeekMode mode);
uint DualPipe_Tell(_DualPipe * dp);
bool DualPipe_Eof(_DualPipe * dp);
bool DualPipe_GetSize(_DualPipe * dp);
bool DualPipe_Peek(_DualPipe * dp);
void DualPipe_Terminate(_DualPipe * dp);
int DualPipe_GetExitCode(_DualPipe * dp);
int DualPipe_GetProcessID(_DualPipe * dp);
void DualPipe_Wait(_DualPipe * dp);
_DualPipe * _DualPipeOpen(PipeOpenMode mode, char * commandLine, char * env, void ** inputPtr, void ** outputPtr);

private:

public class PipeOpenMode { public bool output:1, error:1, input:1; };

public class DualPipe : File
{
   void * dp;

   ~DualPipe() { DualPipe_Destructor(dp); }
   void CloseInput() { (input != null) ? File::CloseInput() : DualPipe_CloseInput(dp); }
   void CloseOutput() { (output != null) ? File::CloseOutput() : DualPipe_CloseOutput(dp); }
   int Read(byte * buffer, uint size, uint count) { return DualPipe_Read(dp, buffer, size, count); }
   int Write(byte * buffer, uint size, uint count) { return output ? File::Write(buffer, size, count) : DualPipe_Write(dp, buffer, size, count); }
   bool Getc(char * ch) { return input ? File::Getc(ch) : DualPipe_Getc(dp, ch); }
   bool Putc(char ch) { return output ? File::Putc(ch) : DualPipe_Putc(dp, ch); }
   bool Puts(char * string) { return output ? (File::Puts(string), File::Flush()) : DualPipe_Puts(dp, string); }
   bool Seek(int pos, FileSeekMode mode) { return (input || output) ? File::Seek(pos, mode) : DualPipe_Seek(dp, pos, mode); }
   uint Tell() { return (input || output) ? File::Tell() : DualPipe_Tell(dp); }
   bool Eof() { return DualPipe_Eof(dp); }
   bool GetSize() { return (input || output) ? File::GetSize() : DualPipe_GetSize(dp); }

public:
   bool Peek() { return DualPipe_Peek(dp); }
   void Terminate() { DualPipe_Terminate(dp); }
   int GetExitCode() { return DualPipe_GetExitCode(dp); }   
   int GetProcessID() { return DualPipe_GetProcessID(dp); }
   void Wait() { DualPipe_Wait(dp); }
};

public DualPipe DualPipeOpenf(PipeOpenMode mode, char * command, ...)
{
   char commandLine[MAX_F_STRING];
   va_list args;
   commandLine[sizeof(commandLine)-1] = 0;
   va_start(args, command);
   vsnprintf(commandLine, sizeof(commandLine), command, args);
   va_end(args);
   return DualPipeOpen(mode, commandLine);
}

public DualPipe DualPipeOpen(PipeOpenMode mode, char * commandLine)
{
   void * input, * output;
   void * f = _DualPipeOpen(mode, commandLine, null, &input, &output);
   if(f)
      return DualPipe { dp = f, input = input, output = output };
   return null;
}

public DualPipe DualPipeOpenEnvf(PipeOpenMode mode, char * env, char * command, ...)
{
   char commandLine[MAX_F_STRING];
   va_list args;
   commandLine[sizeof(commandLine)-1] = 0;
   va_start(args, command);
   vsnprintf(commandLine, sizeof(commandLine), command, args);
   va_end(args);
   return DualPipeOpenEnv(mode, env, commandLine);
}

public DualPipe DualPipeOpenEnv(PipeOpenMode mode, char * env, char * commandLine)
{
   void * input, * output;
   void * f = _DualPipeOpen(mode, commandLine, env, &input, &output);
   if(f)
      return DualPipe { dp = f, input = input, output = output };
   return null;
}
