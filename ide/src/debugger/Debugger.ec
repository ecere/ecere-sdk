import "ide"
import "process"
import "debugFindCtx"
import "debugTools"

#ifdef _DEBUG
#define GDB_DEBUG_CONSOLE
#endif

extern char * strrchr(const char * s, int c);

#define uint _uint
#include <stdarg.h>
#include <unistd.h>

#ifdef __APPLE__
#define __unix__
#endif

#if defined(__unix__)
#include <sys/stat.h>
#include <sys/time.h> // Required on Apple...
#endif
#undef uint


public char * StripQuotes2(char * string, char * output)
{
   int c;
   int d = 0;
   bool quoted = false, escaped = false;
   char ch;
   for(c = 0; ch = string[c]; c++)
   {
      if(quoted)
      {
         if(escaped || ch != '\"')
         {
            output[d++] = ch;
            escaped = !escaped && ch == '\\';
         }
         else
            quoted = false;
      }
      else if(ch == '\"')
         quoted = true;
      else
         output[d++] = ch;
   }
   output[d] = '\0';
   return output;
}

// String Escape Copy
static void strescpy(char * d, char * s)
{
   int j, k;
   j = k = 0;
   while(s[j])
   {
      switch(s[j])
      {
         case '\n':
            d[k] = '\\';
            d[++k] = 'n';
            break;
         case '\t':
            d[k] = '\\';
            d[++k] = 't';
            break;
         case '\a':
            d[k] = '\\';
            d[++k] = 'a';
            break;
         case '\b':
            d[k] = '\\';
            d[++k] = 'b';
            break;
         case '\f':
            d[k] = '\\';
            d[++k] = 'f';
            break;
         case '\r':
            d[k] = '\\';
            d[++k] = 'r';
            break;
         case '\v':
            d[k] = '\\';
            d[++k] = 'v';
            break;
         case '\\':
            d[k] = '\\';
            d[++k] = '\\';
            break;
         case '\"':
            d[k] = '\\';
            d[++k] = '\"';
            break;
         default:
            d[k] = s[j];
      }
      ++j;
      ++k;
   }
   d[k] = s[j];
}

static char * CopyUnescapedSystemPath(char * p)
{
   char * d = new char[strlen(p) + 1];
   struscpy(d, p);
#if defined(__WIN32__)
   ChangeCh(d, '/', '\\');
#endif
   return d;
}

static char * CopyUnescapedUnixPath(char * p)
{
   char * d = new char[strlen(p) + 1];
   struscpy(d, p);
#if defined(__WIN32__)
   ChangeCh(d, '\\', '/');
#endif
   return d;
}

static char * CopyUnescapedString(char * s)
{
   char * d = new char[strlen(s) + 1];
   struscpy(d, s);
   return d;
}

// String Unescape Copy

// TOFIX: THIS DOESN'T HANDLE NUMERIC ESCAPE CODES (OCTAL/HEXADECIMAL...)?
// Seems very similar to ReadString in pass15.ec (which also misses numeric escape codes :) )

static void struscpy(char * d, char * s)
{
   int j, k;
   j = k = 0;
   while(s[j])
   {
      switch(s[j])
      {
         case '\\':
            switch(s[++j])
            {
               case 'n':
                  d[k] = '\n';
                  break;
               case 't':
                  d[k] = '\t';
                  break;
               case 'a':
                  d[k] = '\a';
                  break;
               case 'b':
                  d[k] = '\b';
                  break;
               case 'f':
                  d[k] = '\f';
                  break;
               case 'r':
                  d[k] = '\r';
                  break;
               case 'v':
                  d[k] = '\v';
                  break;
               case '\\':
                  d[k] = '\\';
                  break;
               case '\"':
                  d[k] = '\"';
                  break;
               default:
                  d[k] = '\\';
                  d[++k] = s[j];
            }
            break;
         default:
            d[k] = s[j];
      }
      ++j;
      ++k;
   }
   d[k] = s[j];
}

static char * StripBrackets(char * string)
{
   int length = strlen(string);
   if(length > 1 && *string == '[' && string[length - 1] == ']')
   {
      *string = '\0';
      string[length - 1] = '\0';
      return ++string;
   }
   else
      return string;
}

static char * StripCurlies(char * string)
{
   int length = strlen(string);
   if(length > 1 && *string == '{' && string[length - 1] == '}')
   {
      *string = '\0';
      string[length - 1] = '\0';
      return ++string;
   }
   else
      return string;
}

static int StringGetInt(char * string, int start)
{
   char number[8];
   int i, len = strlen(string);
   number[0] = '\0';
   for(i = start; i < len && i < start + 8; i++)
   {
      if(string[i] == '0' || string[i] == '1' || string[i] == '2' || string[i] == '3' || string[i] == '4' || string[i] == '5' || string[i] == '6' || string[i] == '7' || string[i] == '8' || string[i] == '9')
         strncat(number, &string[i], 1);
      else
         break;
   }
   return atoi(number);
}

static int TokenizeList(char * string, const char seperator, Array<char *> tokens)
{
   uint level = 0;
   
   bool quoted = false, escaped = false;
   char * start = string, ch;
   
   for(; (ch = *string); string++)
   {
      if(!start)
         start = string;

      if(quoted)
      {
         if(escaped || ch != '\"')
            escaped = !escaped && ch == '\\';
         else
            quoted = false;
      }
      else if(ch == '\"')
         quoted = true;
      else if(ch == '{' || ch == '[' || ch == '(' || ch == '<')
         level++;
      else if(ch == '}' || ch == ']' || ch == ')' || ch == '>')
         level--;
      else if(ch == seperator && !level)
      {
         tokens.Add(start);
         *string = '\0';
         start = null;
      }
   }
   if(start)
   {
      //tokens[count] = start;
      //tokens[count++] = start;
      tokens.Add(start);
      *string = '\0';
   }
   return tokens.count;
}

static bool TokenizeListItem(char * string, DebugListItem item)
{
   char * equal = strstr(string, "=");
   if(equal)
   {
      item.name = string;
      *equal = '\0';
      equal++;
      item.value = equal;
      equal = null;
      return true;
   }
   else
      return false;
}

static void DebuggerProtocolUnknown(char * message, char * gdbOutput)
{
#ifdef _DEBUG_GDB_PROTOCOL
   ide.outputView.debugBox.Logf("Debugger Protocol Error: %s (%s)\n", message, gdbOutput);
#endif
}

// define GdbGetLineSize = 1638400;
define GdbGetLineSize = 5638400;
#if defined(__unix__)
char progFifoPath[MAX_LOCATION];
char progFifoDir[MAX_LOCATION];
#endif

enum DebuggerState { none, prompt, loaded, running, stopped, terminated };
enum DebuggerEvent { none, hit, breakEvent, signal, stepEnd, functionEnd, exit };
enum DebuggerAction { none, internal, restart, stop, selectFrame }; //, bpValidation
enum BreakpointType { none, internalMain, internalWinMain, internalModulesLoaded, user, runToCursor };
enum DebuggerEvaluationError { none, symbolNotFound, memoryCantBeRead, unknown };

FileDialog debuggerFileDialog { type = selectDir };

static DualPipe gdbHandle;
static DebugEvaluationData eval { };

static int targetProcessId;

static bool gdbReady;
static bool breakpointError;

class Debugger
{
   Semaphore serialSemaphore { };
   bool waitingForPID;
   bool targeted;
   bool symbols;
   bool modules;
   //bool breakpointsInserted;
   bool sentKill;
   bool sentBreakInsert;
   bool ignoreBreakpoints;
   bool userBreakOnInternBreak;
   bool signalOn;
   //bool watchesInit;

   int ideProcessId;
   int gdbProcessId;

   int activeFrameLevel;
   int activeThread;
   int hitThread;
   int signalThread;
   int frameCount;

   char * targetDir;
   char * targetFile;
   
   DebuggerState state;
   DebuggerEvent event;
   DebuggerAction breakType;
   //DebuggerCommand lastCommand;    // THE COMPILER COMPILES STUFF THAT DOES NOT EXIST???

   GdbDataStop stopItem;
   GdbDataBreakpoint bpItem;
   Frame activeFrame;
   
   List<Breakpoint> sysBPs { };
   Breakpoint bpRunToCursor;
   //Breakpoint bpStep;
   Breakpoint bpHit;

   OldList stackFrames;

   CompilerConfig currentCompiler;
   ProjectConfig prjConfig;

   CodeEditor codeEditor;

   GdbThread gdbThread { debugger = this };
   Timer gdbTimer
   {
      delay = 0.0, userData = this;

      bool DelayExpired()
      {
         bool monitor = false;
         DebuggerEvent curEvent = event;
         GdbDataStop stopItem = this.stopItem;
         if(!gdbReady)
            return false;
   
         event = none;
         if(this.stopItem)
            this.stopItem = null;
         else
         {
            if(curEvent && curEvent != exit)
            {
#ifdef _DEBUG
               printf("No stop item\n");
#endif
            }
         }
         switch(breakType)
         {
            case restart:
               breakType = none;
               Restart(currentCompiler, prjConfig);
               break;
            case stop:
               breakType = none;
               Stop();
               break;
            case selectFrame:
            {
               breakType = none;
               GdbCommand(false, "-stack-select-frame %d", activeFrameLevel);
               for(activeFrame = stackFrames.first; activeFrame; activeFrame = activeFrame.next)
                  if(activeFrame.level == activeFrameLevel)
                     break;
               break;
            }
            //case bpValidation:
            //   breakType = none;
            //   GdbCommand(false, "-break-info %d", bpItem.number);
            //   break;
         }
         
         if(curEvent == none)
            return false;
         
         switch (curEvent)
         {
            case breakEvent:
               activeThread = stopItem.threadid;
               GdbCommand(false, "-thread-list-ids");
               GdbGetStack();
               break;
            case hit:
               {
                  Breakpoint bp = null;
               
                  for(i : ide.workspace.breakpoints; i.bp && i.bp.number == stopItem.bkptno)
                  {
                     bp = i;
                     break;
                  }
                  if(!bp)
                  {
                     for(i : sysBPs; i.bp && i.bp.number == stopItem.bkptno)
                     {
                        bp = i;
                        break;
                     }
                  }
                  if(bp && bp.type != user && stopItem && stopItem.frame)
                  {
                     // In case the user put a breakpoint where an internal breakpoint is, avoid the confusion...
                     for(i : ide.workspace.breakpoints)
                     {
                        if(i.bp && i.line == stopItem.frame.line && !fstrcmp(i.absoluteFilePath, stopItem.frame.absoluteFile))
                           bp = i;
                        break;
                     }
                  }
                  bpHit = bp;
                  
                  if(!(!userBreakOnInternBreak && 
                        bp && (bp.type == internalMain || bp.type == internalWinMain || bp.type == internalModulesLoaded)))
                     monitor = true;
                  hitThread = stopItem.threadid;
               }
               break;
            case signal:
               signalThread = stopItem.threadid;
            case stepEnd:
            case functionEnd:
               monitor = true;
               break;
            case exit:
               HideDebuggerViews();
               break;
         }
         
         if(monitor)
         {
            activeThread = stopItem.threadid;
            GdbCommand(false, "-thread-list-ids");
            GdbGetStack();
            if(activeFrameLevel > 0)
               GdbCommand(false, "-stack-select-frame %d", activeFrameLevel);

            WatchesCodeEditorLinkInit();
            EvaluateWatches();
         }
         
         switch(curEvent)
         {
            case signal:
            {
               char * s;
               signalOn = true;
               ide.outputView.debugBox.Logf($"Signal received: %s - %s\n", stopItem.name, stopItem.meaning);
               ide.outputView.debugBox.Logf("    %s:%d\n", (s = CopySystemPath(stopItem.frame.file)), stopItem.frame.line);
               delete s;
            }
            case stepEnd:
            case functionEnd:
            case breakEvent:
               // Why was SelectFrame missing here?
               SelectFrame(activeFrameLevel);
               GoToStackFrameLine(activeFrameLevel, curEvent == signal || curEvent == stepEnd /*false*/);
               ideMainFrame.Activate();   // TOFIX: ide.Activate() is not reliable (app inactive)
               ide.Update(null);
               if(curEvent == signal)
                  ide.outputView.Show();
               if(curEvent == signal || curEvent == breakEvent)
               {
                  if(curEvent == breakEvent)
                     ide.threadsView.Show();
                  ide.callStackView.Show();
               }
               ide.ShowCodeEditor();
               if(curEvent == breakEvent)
                  ide.callStackView.Activate();
               break;
            case hit:
               EventHit(stopItem);
               break;
         }
         
         if(curEvent != hit)
            ignoreBreakpoints = false;
         
         if(stopItem)
         {
            stopItem.Free();
            delete stopItem;
         }
         return false;
      }
   };

#ifdef GDB_DEBUG_CONSOLE
   char lastGdbOutput[GdbGetLineSize];
#endif
#if defined(__unix__)
   ProgramThread progThread { };
#endif

   void ChangeState(DebuggerState value)
   {
      bool same = value == state;
      // if(same) PrintLn("Debugger::ChangeState -- changing to same state");
      state = value;
      if(!same && ide) ide.AdjustDebugMenus();
   }

   void CleanUp()
   {
      // Stop(); // Don't need to call Stop here, because ~ProjectView() will call it explicitly.

      stackFrames.Free(Frame::Free);

      delete targetDir;
      delete targetFile;

      ClearBreakDisplay();

      // Clear Stuff up
      gdbProcessId = 0;

      waitingForPID = false;
      targeted = false;
      symbols = false;
      modules = false;
      sentKill = false;
      sentBreakInsert = false;
      ignoreBreakpoints = false;
      userBreakOnInternBreak = false;
      signalOn = false;

      activeFrameLevel = 0;
      activeThread = 0;
      hitThread = 0;
      signalThread = 0;
      frameCount = 0;

      targetDir = null;
      targetFile = null;
      
      ChangeState(none);
      event = none;
      breakType = none;

      stopItem = null;
      bpItem = null;
      activeFrame = 0;
      
      bpRunToCursor = null;
      bpHit = null;

      delete currentCompiler;
      prjConfig = null;
      codeEditor = null;

      /*GdbThread gdbThread
      Timer gdbTimer*/
   }
   
   Debugger()
   {
      ideProcessId = Process_GetCurrentProcessId();

      sysBPs.Add(Breakpoint { type = internalMain, enabled = true, level = -1 });
#if defined(__WIN32__)
      sysBPs.Add(Breakpoint { type = internalWinMain, enabled = true, level = -1 });
#endif
      sysBPs.Add(Breakpoint { type = internalModulesLoaded, enabled = true, level = -1 });
      
   }

   ~Debugger()
   {
      sysBPs.Free();
      Stop();
      CleanUp();
   }

   // PUBLIC MEMBERS

   property bool isActive { get { return state == running || state == stopped; } }
   property bool isPrepared  { get { return state == loaded || state == running || state == stopped; } }

   void Resume()
   {
      GdbExecContinue(true);
   }

   void Break()
   {
      if(state == running)
      {
         if(targetProcessId)
            GdbDebugBreak(false);
      }
   }

   void Stop()
   {
      switch(state)
      {
         case running:
            if(targetProcessId)
            {
               breakType = stop;
               GdbDebugBreak(false);
            }
            break;
         case stopped:
            GdbAbortExec();
         case loaded:
            GdbExit();
            break;
      }
   }

   void Restart(CompilerConfig compiler, ProjectConfig config)
   {
      switch(state)
      {
         case running:
            if(targetProcessId)
            {
               breakType = restart;
               GdbDebugBreak(false);
            }
            break;
         case stopped:
            GdbAbortExec();
         case none:
         case terminated:
            if(!GdbInit(compiler, config))
               break;
         case loaded:
            GdbExecRun();
            break;
      }
   }

   bool GoToCodeLine(char * location)
   {
      CodeLocation codloc;
      codloc = CodeLocation::ParseCodeLocation(location);
      if(codloc)
      {
         CodeEditor editor = (CodeEditor)ide.OpenFile(codloc.absoluteFile, normal, true, null, no, normal);
         if(editor)
         {
            EditBox editBox = editor.editBox;
            editBox.GoToLineNum(codloc.line - 1);
            editBox.GoToPosition(editBox.line, codloc.line - 1, 0);
            return true;
         }
      }
      return false;
   }

   bool GoToStackFrameLine(int stackLevel, bool askForLocation)
   {
      if(ide)
      {
         char filePath[MAX_LOCATION];
         char sourceDir[MAX_LOCATION];
         Frame frame;
         CodeEditor editor = null;
         if(stackLevel == -1)  // this (the two lines) is part of that fix that I would not put in for some time
            return false;
         for(frame = stackFrames.first; frame; frame = frame.next)
            if(frame.level == stackLevel)
               break;
         if(frame)
         {
            ide.callStackView.Show();

            if(!frame.absoluteFile && frame.file)
               frame.absoluteFile = ide.workspace.GetAbsolutePathFromRelative(frame.file);
            if(!frame.absoluteFile && askForLocation && frame.file)
            {
               char * s;
               char title[MAX_LOCATION];
               snprintf(title, sizeof(title), $"Provide source file location for %s", (s = CopySystemPath(frame.file)));
               title[sizeof(title)-1] = 0;
               delete s;
               if(SourceDirDialog(title, ide.workspace.projectDir, frame.file, sourceDir))
               {
                  AddSourceDir(sourceDir);
                  frame.absoluteFile = ide.workspace.GetAbsolutePathFromRelative(frame.file);
               }
            }
            if(frame.absoluteFile)
               editor = (CodeEditor)ide.OpenFile(frame.absoluteFile, normal, true, null, no, normal);
            ide.Update(null);
            if(editor && frame.line)
            {
               EditBox editBox = editor.editBox;
               editBox.GoToLineNum(frame.line - 1);
               editBox.GoToPosition(editBox.line, frame.line - 1, 0);
               return true;
            }
         }
      }
      return false;
   }

   void SelectThread(int thread)
   {
      if(state == stopped)
      {
         if(thread != activeThread)
         {
            activeFrameLevel = -1;
            ide.callStackView.Clear();
            GdbCommand(false, "-thread-select %d", thread);
            GdbGetStack();
            // Why was SelectFrame missing here?
            SelectFrame(activeFrameLevel);
            GoToStackFrameLine(activeFrameLevel, true);
            WatchesCodeEditorLinkRelease();
            WatchesCodeEditorLinkInit();
            EvaluateWatches();
            ide.Update(null);
         }
         ide.callStackView.Show();
      }
   }

   void SelectFrame(int frame)
   {
      if(state == stopped)
      {
         if(frame != activeFrameLevel || !codeEditor || !codeEditor.visible)
         {
            activeFrameLevel = frame;  // there is no active frame number in the gdb reply
            GdbCommand(false, "-stack-select-frame %d", activeFrameLevel);
            for(activeFrame = stackFrames.first; activeFrame; activeFrame = activeFrame.next)
               if(activeFrame.level == activeFrameLevel)
                  break;

            WatchesCodeEditorLinkRelease();
            WatchesCodeEditorLinkInit();
            EvaluateWatches();
            ide.Update(null);
         }
      }
   }

   void HandleExit(char * reason, char * code)
   {
      bool returnedExitCode = false;
      char verboseExitCode[128];
      
      ChangeState(loaded); // this state change seems to be superfluous, might be in case of gdb crash
      targetProcessId = 0;

      if(code)
      {
         snprintf(verboseExitCode, sizeof(verboseExitCode), $" with exit code %s", code);
         verboseExitCode[sizeof(verboseExitCode)-1] = 0;
      }
      else
         verboseExitCode[0] = '\0';
      
      event = exit;

      // ClearBreakDisplay();

      if(ide.workspace)
      {
         for(wh : ide.workspace.watches)
         {
            if(wh.type) FreeType(wh.type);
            wh.type = null;
            delete wh.value;
            ide.watchesView.UpdateWatch(wh);
         }
      }

#if defined(__unix__)
      progThread.terminate = true;
      if(fifoFile)
      {
         fifoFile.CloseInput();
         app.Unlock();
         progThread.Wait();
         app.Lock();
         delete fifoFile;
      }         
#endif

      {
         char program[MAX_LOCATION];
         GetSystemPathBuffer(program, targetFile);
         if(!reason)
            ide.outputView.debugBox.Logf($"The program %s has exited%s.\n", program, verboseExitCode);
         else if(!strcmp(reason, "exited-normally"))
            ide.outputView.debugBox.Logf($"The program %s has exited normally%s.\n", program, verboseExitCode);
         else if(!strcmp(reason, "exited"))
            ide.outputView.debugBox.Logf($"The program %s has exited%s.\n", program, verboseExitCode);
         else if(!strcmp(reason, "exited-signalled"))
            ide.outputView.debugBox.Logf($"The program %s has exited with a signal%s.\n", program, verboseExitCode);
         else
            ide.outputView.debugBox.Logf($"The program %s has exited (gdb provided an unknown reason)%s.\n", program, verboseExitCode);
      }
      ide.Update(null);
   }
      
   void Start(CompilerConfig compiler, ProjectConfig config)
   {
      ide.outputView.debugBox.Clear();
      switch(state)
      {
         case none:
         case terminated:
            if(!GdbInit(compiler, config))
               break;
         case loaded:
            GdbExecRun();
            break;
      }
   }

   void StepInto(CompilerConfig compiler, ProjectConfig config)
   {
      switch(state)
      {
         case none:
         case terminated:
            if(!GdbInit(compiler, config)) 
               break;
         case loaded:
            ide.outputView.ShowClearSelectTab(debug);
            ide.outputView.debugBox.Logf($"Starting debug mode\n");
            userBreakOnInternBreak = true;
            GdbExecRun();
            break;
         case stopped:
            GdbExecStep();
            break;
      }
   }

   void StepOver(CompilerConfig compiler, ProjectConfig config, bool ignoreBkpts)
   {
      switch(state)
      {
         case none:
         case terminated:
            if(!GdbInit(compiler, config)) 
               break;
         case loaded:
            ide.outputView.ShowClearSelectTab(debug);
            ide.outputView.debugBox.Logf($"Starting debug mode\n");
            ignoreBreakpoints = ignoreBkpts;
            userBreakOnInternBreak = true;
            GdbExecRun();
            break;
         case stopped:
            ignoreBreakpoints = ignoreBkpts;
            if(ignoreBreakpoints)
               GdbBreakpointsDelete(true);
            GdbExecNext();
            break;
      }
   }

   void StepOut(bool ignoreBkpts)
   {
      if(state == stopped)
      {
         ignoreBreakpoints = ignoreBkpts;
         if(ignoreBreakpoints)
            GdbBreakpointsDelete(true);
         GdbExecFinish();
      }
   }

   void RunToCursor(CompilerConfig compiler, ProjectConfig config, char * absoluteFilePath, int lineNumber, bool ignoreBkpts)
   {
      char relativeFilePath[MAX_LOCATION];
      DebuggerState oldState = state;
      ignoreBreakpoints = ignoreBkpts;
      if(!ide.projectView.GetRelativePath(absoluteFilePath, relativeFilePath))
         strcpy(relativeFilePath, absoluteFilePath);
      switch(state)
      {
         case none:
         case terminated:
            Start(compiler, config);
         case stopped:
         case loaded:
            if(symbols)
            {
               if(state == loaded)
               {
                  ide.outputView.ShowClearSelectTab(debug);
                  ide.outputView.debugBox.Logf($"Starting debug mode\n");
               }
               RunToCursorPrepare(absoluteFilePath, relativeFilePath, lineNumber);
               sentBreakInsert = true;
               GdbCommand(false, "-break-insert %s:%d", relativeFilePath, lineNumber);
               bpRunToCursor.bp = bpItem;
               bpItem = null;
               bpRunToCursor.inserted = (bpRunToCursor.bp.number != 0);
               ValidateBreakpoint(bpRunToCursor);
            }
            break;
      }
      switch(oldState)
      {
         case loaded:
            if(ignoreBreakpoints)
               GdbBreakpointsDelete(false);
            GdbExecRun();
            break;
         case stopped:
            if(ignoreBreakpoints)
               GdbBreakpointsDelete(false);
            GdbExecContinue(true);
            break;
      }
      
   }

   void GetCallStackCursorLine(bool * error, int * lineCursor, int * lineTopFrame)
   {
      if(activeFrameLevel == -1)
      {
         *error = false;
         *lineCursor = 0;
         *lineTopFrame = 0;
      }
      else
      {
         *error = signalOn && activeThread == signalThread;
         *lineCursor = activeFrameLevel + 1;
         *lineTopFrame = activeFrameLevel ? 1 : 0;
      }
   }

   int GetMarginIconsLineNumbers(char * fileName, int lines[], bool enabled[], int max, bool * error, int * lineCursor, int * lineTopFrame)
   {
      char winFilePath[MAX_LOCATION];
      char * absoluteFilePath = GetSlashPathBuffer(winFilePath, fileName);
      int count = 0;
      Iterator<Breakpoint> it { ide.workspace.breakpoints };
      while(it.Next() && count < max)
      {
         Breakpoint bp = it.data;
         if(bp.type == user)
         {
            if(bp.absoluteFilePath && bp.absoluteFilePath[0] && !fstrcmp(bp.absoluteFilePath, absoluteFilePath))
            {
               lines[count] = bp.line;
               enabled[count] = bp.enabled;
               count++;
            }
         }
      }
      if(activeFrameLevel == -1)
      {
         *error = false;
         *lineCursor = 0;
         *lineTopFrame = 0;
      }
      else
      {
         *error = signalOn && activeThread == signalThread;
         if(activeFrame && activeFrame.absoluteFile && !fstrcmp(absoluteFilePath, activeFrame.absoluteFile))
            *lineCursor = activeFrame.line;
         else
            *lineCursor = 0;
         if(activeFrame && stopItem && stopItem.frame && activeFrame.level == stopItem.frame.level)
            *lineTopFrame = 0;
         else if(stopItem && stopItem.frame && stopItem.frame.absoluteFile && !fstrcmp(absoluteFilePath, stopItem.frame.absoluteFile))
            *lineTopFrame = stopItem.frame.line;
         else
            *lineTopFrame = 0;
         
         if(*lineTopFrame == *lineCursor && *lineTopFrame)
            *lineTopFrame = 0;
      }
      return count;
   }

   void ChangeWatch(DataRow row, char * expression)
   {
      Watch wh = (Watch)row.tag;
      if(wh)
      {
         delete wh.expression;
         if(expression)
            wh.expression = CopyString(expression);
         else
         {
            Iterator<Watch> it { ide.workspace.watches };
            if(it.Find(wh))
               ide.workspace.watches.Delete(it.pointer);
         }
      }
      else if(expression)
      {
         wh = Watch { };
         row.tag = (int64)wh;
         ide.workspace.watches.Add(wh);
         wh.row = row;
         wh.expression = CopyString(expression);
      }
      ide.workspace.Save();
      //if(expression && state == stopped)
      if(expression)
         ResolveWatch(wh);
   }

   void MoveIcons(char * fileName, int lineNumber, int move, bool start)
   {
      char winFilePath[MAX_LOCATION];
      char * absoluteFilePath = GetSlashPathBuffer(winFilePath, fileName);

      Link bpLink, next;
      for(bpLink = ide.workspace.breakpoints.first; bpLink; bpLink = next)
      {
         Breakpoint bp = (Breakpoint)bpLink.data;
         next = bpLink.next;

         if(bp.type == user && bp.absoluteFilePath && !fstrcmp(bp.absoluteFilePath, absoluteFilePath))
         {
            if(bp.line > lineNumber || (bp.line == lineNumber && start))
            {
               if(move < 0 && (bp.line < lineNumber - move))
                  ide.workspace.RemoveBreakpoint(bp);
               else
               {
                  bp.line += move;
                  ide.breakpointsView.UpdateBreakpoint(bp.row);
                  ide.workspace.Save();
               }
            }
         }
      }
      
      // moving code cursors is futile, on next step, stop, hit, cursors will be offset anyways
   }

   bool SourceDirDialog(char * title, char * startDir, char * test, char * sourceDir)
   {
      bool result;
      bool retry;
      String srcDir = null;

      debuggerFileDialog.text = title;
      debuggerFileDialog.currentDirectory = startDir;
      debuggerFileDialog.master = ide;

      while(debuggerFileDialog.Modal())
      {
         strcpy(sourceDir, debuggerFileDialog.filePath);
         if(!fstrcmp(ide.workspace.projectDir, sourceDir) && 
                  MessageBox { type = yesNo, master = ide, 
                              contents = $"This is the project directory.\nWould you like to try again?", 
                              text = $"Invalid Source Directory" }.Modal() == no)
            return false;
         else
         {
            for(dir : ide.workspace.sourceDirs)
            {
               if(!fstrcmp(dir, sourceDir))
               {
                  srcDir = dir;
                  break;
               }
            }
            
            if(srcDir && 
                  MessageBox { type = yesNo, master = ide, 
                              contents = $"This source directory is already specified.\nWould you like to try again?", 
                              text = $"Invalid Source Directory" }.Modal() == no)
               return false;
            else
            {
               if(test)
               {
                  char file[MAX_LOCATION];
                  strcpy(file, sourceDir);
                  PathCat(file, test);
                  result = FileExists(file);
                  if(!result && 
                        MessageBox { type = yesNo, master = ide, 
                                    contents = $"Unable to locate source file.\nWould you like to try again?", 
                                    text = $"Invalid Source Directory" }.Modal() == no)
                        return false;
               }
               else
                  result = true;
               
               if(result)
                  return true;
            }
         }
      }
      return false;
   }

   void AddSourceDir(char * sourceDir)
   {
      ide.workspace.sourceDirs.Add(CopyString(sourceDir));
      ide.workspace.Save();
      
      if(targeted)
      {
         DebuggerState oldState = state;
         switch(state)
         {
            case running:
               if(targetProcessId)
                  GdbDebugBreak(true);
            case stopped:
            case loaded:
               GdbCommand(false, "-environment-directory \"%s\"", sourceDir);
               break;
         }
         if(oldState == running)
            GdbExecContinue(false);
      }
   }

   void ToggleBreakpoint(char * fileName, int lineNumber, Project prj)
   {
      char winFilePath[MAX_LOCATION];
      char * absoluteFilePath = GetSlashPathBuffer(winFilePath, fileName);
      char absolutePath[MAX_LOCATION];
      char relativePath[MAX_LOCATION];
      char sourceDir[MAX_LOCATION];
      Breakpoint bp = null;

      strcpy(absolutePath, absoluteFilePath);
      for(i : ide.workspace.breakpoints; i.type == user && i.absoluteFilePath && !fstrcmp(i.absoluteFilePath, absolutePath) && i.line == lineNumber)
      {
         bp = i;
         break;
      }
      if(bp)
      {
         if(bp.enabled)
         {
            ide.workspace.RemoveBreakpoint(bp);
            bp = null;
         }
         else
            bp.enabled = true;
      }
      else
      {
         // FIXED: This is how it should have been... Source locations are only for files not in project
         // if(IsPathInsideOf(absolutePath, ide.workspace.projectDir))
         //   MakePathRelative(absolutePath, ide.workspace.projectDir, relativePath);
         bool result = false;
         if(prj)
            result = prj.GetRelativePath(absolutePath, relativePath);
         else
            ide.projectView.GetRelativePath(absolutePath, relativePath);
         //if(ide.projectView.GetRelativePath(absolutePath, relativePath));
         //else
         if(!result)
         {
            char title[MAX_LOCATION];
            char directory[MAX_LOCATION];
            StripLastDirectory(absolutePath, directory);
            snprintf(title, sizeof(title), $"Provide source files location directory for %s", absolutePath);
            title[sizeof(title)-1] = 0;
            while(true)
            {
               String srcDir = null;
               for(dir : ide.workspace.sourceDirs)
               {
                  if(IsPathInsideOf(absolutePath, dir))
                  {
                     MakePathRelative(absoluteFilePath, dir, relativePath);
                     srcDir = dir;
                     break;
                  }
               }
               if(srcDir)
                  break;
               
               if(SourceDirDialog(title, directory, null, sourceDir))
               {
                  if(IsPathInsideOf(absolutePath, sourceDir))
                  {
                     AddSourceDir(sourceDir);
                     MakePathRelative(absoluteFilePath, sourceDir, relativePath);
                     break;
                  }
                  else if(MessageBox { type = yesNo, master = ide, 
                                 contents = $"You must provide a valid source directory in order to place a breakpoint in this file.\nWould you like to try again?", 
                                 text = $"Invalid Source Directory" }.Modal() == no)
                     return;
               }
               else if(MessageBox { type = yesNo, master = ide, 
                                 contents = $"You must provide a source directory in order to place a breakpoint in this file.\nWould you like to try again?", 
                                 text = $"No Source Directory Provided" }.Modal() == no)
                  return;
            }
         }
         ide.workspace.bpCount++;
         bp = { line = lineNumber, type = user, enabled = true, level = -1 };
         ide.workspace.breakpoints.Add(bp);
         bp.absoluteFilePath = CopyString(absolutePath);
         bp.relativeFilePath = CopyString(relativePath);
         ide.breakpointsView.AddBreakpoint(bp);
      }

      if(bp && targeted)
      {
         DebuggerState oldState = state;
         switch(state)
         {
            case running:
               if(targetProcessId)
                  GdbDebugBreak(true);
            case stopped:
            case loaded:
               if(symbols)
               {
                  sentBreakInsert = true;
                  GdbCommand(false, "-break-insert %s:%d", bp.relativeFilePath, bp.line);
                  bp.bp = bpItem;
                  bpItem = null;
                  bp.inserted = (bp.bp && bp.bp.number != 0);
                  ValidateBreakpoint(bp);
               }
               break;
         }
         if(oldState == running)
            GdbExecContinue(false);
      }

      ide.workspace.Save();
   }

   void UpdateRemovedBreakpoint(Breakpoint bp)
   {
      if(targeted && bp.inserted)
      {
         DebuggerState oldState = state;
         switch(state)
         {
            case running:
               if(targetProcessId)
                  GdbDebugBreak(true);
            case stopped:
            case loaded:
               if(symbols)
                  GdbCommand(false, "-break-delete %d", bp.bp.number);
               break;
         }
         if(oldState == running)
            GdbExecContinue(false);
      }
   }

   // PRIVATE MEMBERS

   void ParseFrame(Frame frame, char * string)
   {
      int i, j, k;
      Array<char *> frameTokens { minAllocSize = 50 };
      Array<char *> argsTokens { minAllocSize = 50 };
      Array<char *> argumentTokens { minAllocSize = 50 };
      DebugListItem item { };
      Argument arg;
      
      TokenizeList(string, ',', frameTokens);
      for(i = 0; i < frameTokens.count; i++)
      {
         if(TokenizeListItem(frameTokens[i], item))
         {
            StripQuotes(item.value, item.value);
            if(!strcmp(item.name, "level"))
               frame.level = atoi(item.value);
            else if(!strcmp(item.name, "addr"))
               frame.addr = CopyString(item.value);
            else if(!strcmp(item.name, "func"))
               frame.func = CopyString(item.value);
            else if(!strcmp(item.name, "args"))
            {
               if(!strcmp(item.value, "[]"))
                  frame.argsCount = 0;
               else
               {
                  item.value = StripBrackets(item.value);
                  TokenizeList(item.value, ',', argsTokens);
                  for(j = 0; j < argsTokens.count; j++)
                  {
                     argsTokens[j] = StripCurlies(argsTokens[j]);
                     TokenizeList(argsTokens[j], ',', argumentTokens);
                     for(k = 0; k < argumentTokens.count; k++)
                     {
                        arg = Argument { };
                        frame.args.Add(arg);
                        if(TokenizeListItem(argumentTokens[k], item))
                        {
                           if(!strcmp(item.name, "name"))
                           {
                              StripQuotes(item.value, item.value);
                              arg.name = CopyString(item.value);
                           }
                           else if(!strcmp(item.name, "value"))
                           {
                              StripQuotes(item.value, item.value);
                              arg.value = CopyString(item.value);
                           }
                           else
                              DebuggerProtocolUnknown("Unknown frame args item name", item.name);
                        }
                        else 
                           DebuggerProtocolUnknown("Bad frame args item", "");
                     }
                     argumentTokens.RemoveAll();
                  }
                  frame.argsCount = argsTokens.count;
                  argsTokens.RemoveAll();
               }
            }
            else if(!strcmp(item.name, "from"))
               frame.from = item.value;
            else if(!strcmp(item.name, "file"))
            {
               frame.file = item.value;
               frame.absoluteFile = ide.workspace.GetAbsolutePathFromRelative(frame.file);
            }
            else if(!strcmp(item.name, "line"))
               frame.line = atoi(item.value);
            else if(!strcmp(item.name, "fullname"))
            {
               // GDB 6.3 on OS X is giving "fullname" and "dir", all in absolute, but file name only in 'file'
               String path = ide.workspace.GetPathWorkspaceRelativeOrAbsolute(item.value);
               if(strcmp(frame.file, path))
               {
                  frame.file = path;
                  delete frame.absoluteFile;
                  frame.absoluteFile = ide.workspace.GetAbsolutePathFromRelative(frame.file);
               }
               delete path;
            }
            else
               DebuggerProtocolUnknown("Unknown frame member name", item.name);
         }
         else
            DebuggerProtocolUnknown("Bad frame", "");
      }
      
      delete frameTokens;
      delete argsTokens;
      delete argumentTokens;
      delete item;
   }

   void ShowDebuggerViews()
   {
      ide.outputView.Show();
      ide.outputView.SelectTab(debug);
      ide.threadsView.Show();
      ide.callStackView.Show();
      ide.watchesView.Show();
      ide.Update(null);
   }

   void HideDebuggerViews()
   {
      ide.RepositionWindows(true);
   }

   void ::GdbCommand(bool focus, char * format, ...)
   {
      if(gdbHandle)
      {
         // TODO: Improve this limit
         static char string[MAX_F_STRING*3];
         va_list args;
         va_start(args, format);
         vsnprintf(string, sizeof(string), format, args);
         string[sizeof(string)-1] = 0;
         va_end(args);
         
         gdbReady = false;
         ide.debugger.serialSemaphore.TryWait();


#ifdef GDB_DEBUG_CONSOLE
         Log(string); Log("\n");
#endif
#ifdef GDB_DEBUG_OUTPUT
         ide.outputView.gdbBox.Logf("cmd: %s\n", string);
#endif
#ifdef GDB_DEBUG_GUI
         if(ide.gdbDialog)
            ide.gdbDialog.AddCommand(string);
#endif
         strcat(string,"\n");
         gdbHandle.Puts(string);

         if(focus)
            Process_ShowWindows(targetProcessId);

         app.Unlock();
         ide.debugger.serialSemaphore.Wait();
         app.Lock();
      } 
   }

   bool ValidateBreakpoint(Breakpoint bp)
   {
      if(modules && bp.bp)
      {
         if(bp.bp.line != bp.line)
         {
            if(!bp.bp.line)
            {
#ifdef _DEBUG
               ide.outputView.debugBox.Logf("WOULD HAVE -- Invalid breakpoint disabled: %s:%d\n", bp.relativeFilePath, bp.line);
#endif
               if(bp.inserted)
               {
                  //GdbCommand(false, "-break-delete %d", bp.bp.number);
                  //bp.inserted = false;
               }
               //bp.enabled = false;
               return false;
            }
            else
            {
               ide.outputView.debugBox.Logf("Debugger Error: ValidateBreakpoint error\n");
               bp.line = bp.bp.line;
            }
         }
      }
      return true;
   }

   static void GdbInsertInternalBreakpoint()
   {
      if(symbols)
      {
         //if(!breakpointsInserted)
         {
            DirExpression objDir = ide.project.GetObjDir(currentCompiler, prjConfig);
            for(bp : sysBPs)
            {
               if(!bp.inserted)
               {
                  if(bp.type == internalMain)
                  {
                     sentBreakInsert = true;
                     GdbCommand(false, "-break-insert main");
                     bp.bp = bpItem;
                     bpItem = null;
                     bp.inserted = (bp.bp && bp.bp.number != 0);
                  }
#if defined(__WIN32__)
                  else if(bp.type == internalWinMain)
                  {
                     sentBreakInsert = true;
                     GdbCommand(false, "-break-insert WinMain");
                     bp.bp = bpItem;
                     bpItem = null;
                     bp.inserted = (bp.bp && bp.bp.number != 0);
                  }
#endif
                  else if(bp.type == internalModulesLoaded)
                  {
                     char path[MAX_LOCATION];
                     char name[MAX_LOCATION];
                     char fixedModuleName[MAX_FILENAME];
                     char line[16384];
                     int lineNumber;
                     bool moduleLoadBlock = false;
                     File f;
                     ReplaceSpaces(fixedModuleName, ide.project.moduleName);
                     snprintf(name, sizeof(name),"%s.main.ec", fixedModuleName);
                     name[sizeof(name)-1] = 0;
                     strcpy(path, ide.workspace.projectDir);
                     PathCatSlash(path, objDir.dir);
                     PathCatSlash(path, name);
                     f = FileOpen(path, read);
                     if(f)
                     {
                        for(lineNumber = 1; !f.Eof(); lineNumber++)
                        {
                           if(f.GetLine(line, sizeof(line) - 1))
                           {
                              bool moduleLoadLine;
                              TrimLSpaces(line, line);
                              moduleLoadLine = !strncmp(line, "eModule_Load", strlen("eModule_Load"));
                              if(!moduleLoadBlock && moduleLoadLine)
                                 moduleLoadBlock = true;
                              else if(moduleLoadBlock && !moduleLoadLine && strlen(line) > 0)
                                 break;
                           }
                        }
                        if(!f.Eof())
                        {
                           char relative[MAX_LOCATION];
                           bp.absoluteFilePath = CopyString(path);
                           MakePathRelative(path, ide.workspace.projectDir, relative);
                           delete bp.relativeFilePath;
                           bp.relativeFilePath = CopyString(relative);
                           bp.line = lineNumber;
                           sentBreakInsert = true;
                           GdbCommand(false, "-break-insert %s:%d", bp.relativeFilePath, lineNumber);
                           bp.bp = bpItem;
                           bpItem = null;
                           bp.inserted = (bp.bp && bp.bp.number != 0);
                           ValidateBreakpoint(bp);
                        }
                        delete f;
                     }
                     break;
                  }
               }
            }
            delete objDir;
         }
      }
   }

   void GdbBreakpointsInsert()
   {
      if(symbols)
      {
         //if(!breakpointsInserted)
         {
            //if(!ignoreBreakpoints)
               //breakpointsInserted = true;
            for(bp : ide.workspace.breakpoints)
            {
               if(!bp.inserted && bp.type == user)
               {
                  if(!ignoreBreakpoints && bp.enabled)
                  {
                     sentBreakInsert = true;
                     breakpointError = false;
                     GdbCommand(false, "-break-insert %s:%d", bp.relativeFilePath, bp.line);
                     // Improve, GdbCommand should return a success value?
                     if(breakpointError)
                     {
                        char fileName[MAX_FILENAME];
                        breakpointError = false;
                        GetLastDirectory(bp.relativeFilePath, fileName);
                        sentBreakInsert = true;
                        GdbCommand(false, "-break-insert %s:%d", fileName, bp.line);
                     }
                     bp.bp = bpItem;
                     bpItem = null;
                     bp.inserted = (bp.bp && bp.bp.number != 0);
                     bp.hits = 0;
                     bp.breaks = 0;
                     ValidateBreakpoint(bp);
                  }
                  else
                  {
#ifdef _DEBUG
                     if(bp.bp)
                        printf("problem\n");
#endif
                     bp.bp = GdbDataBreakpoint { };
                  }
               }
            }
            if(bpRunToCursor && !bpRunToCursor.inserted)
            {
               sentBreakInsert = true;
               GdbCommand(false, "-break-insert %s:%d", bpRunToCursor.relativeFilePath, bpRunToCursor.line);
               bpRunToCursor.bp = bpItem;
               bpItem = null;
               bpRunToCursor.inserted = (bpRunToCursor.bp && bpRunToCursor.bp.number != 0);
               ValidateBreakpoint(bpRunToCursor);
            }
         }
      }
   }

   void GdbBreakpointsDelete(bool deleteRunToCursor)
   {
      //breakpointsInserted = false;
      if(symbols)
      {
         for(bp : ide.workspace.breakpoints)
         {
            if(bp.bp)
               GdbCommand(false, "-break-delete %d", bp.bp.number);
            bp.inserted = false;
            bp.bp = bpItem;
            //check here (reply form -break-delete, returns bpitem?)
            bpItem = null;
         }
         if(deleteRunToCursor && bpRunToCursor)
         {
            GdbCommand(false, "-break-delete %d", bpRunToCursor.bp.number);
            bpRunToCursor.inserted = false;
            bpRunToCursor.bp = bpItem;
            //check here (reply form -break-delete, returns bpitem?)
            bpItem = null;
         }
      }
   }

   void GdbGetStack()
   {
      activeFrame = null;
      stackFrames.Free(Frame::Free);
      GdbCommand(false, "-stack-info-depth");
      if(!frameCount)
         GdbCommand(false, "-stack-info-depth 192");
      if(frameCount && frameCount <= 192)
         GdbCommand(false, "-stack-list-frames 0 %d", Min(frameCount-1, 191));
      else
      {
         GdbCommand(false, "-stack-list-frames 0 %d", Min(frameCount-1, 95));
         GdbCommand(false, "-stack-list-frames %d %d", Max(frameCount - 96, 96), frameCount - 1);
      }
      GdbCommand(false, "");
   }

   bool GdbTargetSet()
   {
      if(!targeted)
      {
         char escaped[MAX_LOCATION];
         strescpy(escaped, targetFile);
         GdbCommand(false, "file \"%s\"", escaped);  //GDB/MI Missing Implementation -symbol-file, -target-attach

         if(!symbols)
            return true;

         for(prj : ide.workspace.projects)
         {
            if(prj == ide.workspace.projects.firstIterator.data)
               continue;

            //PrintLn("THIS: ", (String)prj.topNode.path);
            GdbCommand(false, "-environment-directory \"%s\"", prj.topNode.path);
            //GdbCommand(false, ""); // why this empty GDB command
         }

         for(dir : ide.workspace.sourceDirs)
         {
            GdbCommand(false, "-environment-directory \"%s\"", dir);
            //GdbCommand(false, ""); // why this empty GDB command
         }
         GdbInsertInternalBreakpoint();
         targeted = true;
      }
      return true;
   }

   void GdbTargetRelease()
   {
      if(targeted)
      {
         GdbBreakpointsDelete(true);
         GdbCommand(false, "file");  //GDB/MI Missing Implementation -target-detach
         targeted = false;
         symbols = true;
      }
   }

   void GdbDebugBreak(bool internal)
   {
      if(targetProcessId)
      {
         if(internal)
            breakType = DebuggerAction::internal;

         if(ide) ide.Update(null);
         app.Unlock();
         if(Process_Break(targetProcessId))  //GdbCommand(false, "-exec-interrupt");
            serialSemaphore.Wait();
         else
         {
            ChangeState(loaded);
            targetProcessId = 0;
         }
         app.Lock();
      }
      else
         ide.outputView.debugBox.Logf("Debugger Error: GdbDebugBreak with not target id should never happen\n");
   }

   void GdbExecRun()
   {
      GdbTargetSet();
      GdbExecCommon();
      ShowDebuggerViews();
      GdbCommand(true, "-exec-run");
   }

   void GdbExecContinue(bool focus)
   {
      GdbExecCommon();
      GdbCommand(focus, "-exec-continue");
   }

   void GdbExecNext()
   {
      GdbExecCommon();
      GdbCommand(true, "-exec-next");
   }

   void GdbExecStep()
   {
      GdbExecCommon();
      GdbCommand(true, "-exec-step");
   }

   void GdbExecFinish()
   {
      GdbExecCommon();
      GdbCommand(true, "-exec-finish");
   }

   void GdbExecCommon()
   {
      ClearBreakDisplay();
      GdbBreakpointsInsert();
   }

#ifdef GDB_DEBUG_GUI
   void SendGDBCommand(char * command)
   {
      DebuggerState oldState = state;
      switch(state)
      {
         case running:
            if(targetProcessId)
               GdbDebugBreak(true);
         case stopped:
         case loaded:
            GdbCommand(false, command);
            break;
      }
      if(oldState == running)
         GdbExecContinue(false);
   }
#endif

   void ClearBreakDisplay()
   {
      activeThread = 0;
      activeFrameLevel = -1;
      hitThread = 0;
      bpHit = null;
      signalThread = 0;
      signalOn = false;
      frameCount = 0;
      if(stopItem)
         stopItem.Free();
      delete stopItem;
      event = none;
      activeFrame = null;
      stackFrames.Free(Frame::Free);
      WatchesCodeEditorLinkRelease();
      ide.callStackView.Clear();
      ide.threadsView.Clear();
      ide.Update(null);
   }

   bool GdbAbortExec()
   {
      sentKill = true;
      GdbCommand(false, "-interpreter-exec console \"kill\""); // should use -exec-abort -- GDB/MI implementation incomplete
      return true;
   }

   bool GdbInit(CompilerConfig compiler, ProjectConfig config)
   {
      bool result = true;
      char oldDirectory[MAX_LOCATION];
      char tempPath[MAX_LOCATION];
      char command[MAX_LOCATION];
      Project project = ide.project;
      DirExpression targetDirExp = project.GetTargetDir(compiler, config);
      PathBackup pathBackup { };

      if(currentCompiler != compiler)
      {
         delete currentCompiler;
         currentCompiler = compiler;
         incref currentCompiler;
      }
      prjConfig = config;

      ChangeState(loaded);
      sentKill = false;
      sentBreakInsert = false;
      breakpointError = false;
      symbols = true;
      targeted = false;
      modules = false;
      //breakpointsInserted = false;
      
      ide.outputView.ShowClearSelectTab(debug);
      ide.outputView.debugBox.Logf($"Starting debug mode\n");

#ifdef GDB_DEBUG_CONSOLE
      Log("Starting GDB"); Log("\n");
#endif
#ifdef GDB_DEBUG_OUTPUT
      ide.outputView.gdbBox.Logf("run: Starting GDB\n");
#endif

      strcpy(tempPath, ide.workspace.projectDir);
      PathCatSlash(tempPath, targetDirExp.dir);
      delete targetDir;
      targetDir = CopyString(tempPath);
      project.CatTargetFileName(tempPath, compiler, config);
      delete targetFile;
      targetFile = CopyString(tempPath);

      GetWorkingDir(oldDirectory, MAX_LOCATION);
      if(ide.workspace.debugDir && ide.workspace.debugDir[0])
      {
         char temp[MAX_LOCATION];
         strcpy(temp, ide.workspace.projectDir);
         PathCatSlash(temp, ide.workspace.debugDir);
         ChangeWorkingDir(temp);
      }
      else
         ChangeWorkingDir(ide.workspace.projectDir);
      
      ide.SetPath(true, compiler, config);

      // TODO: This pollutes the environment, but at least it works
      // It shouldn't really affect the IDE as the PATH gets restored and other variables set for testing will unlikely cause problems
      // What is the proper solution for this? DualPipeOpenEnv?
      // gdb set environment commands don't seem to take effect
      for(e : ide.workspace.environmentVars)
      {
         SetEnvironment(e.name, e.string);
      }

      strcpy(command, "gdb -n -silent --interpreter=mi2"); //-async //\"%s\"
      gdbTimer.Start();
      gdbHandle = DualPipeOpen(PipeOpenMode { output = 1, error = 2, input = 1 }, command);
      if(!gdbHandle)
      {
         ide.outputView.debugBox.Logf($"Debugger Fatal Error: Couldn't start GDB\n");
         result = false;
      }
      if(result)
      {
         incref gdbHandle;
         gdbThread.Create();

         gdbProcessId = gdbHandle.GetProcessID();
         if(!gdbProcessId)
         {
            ide.outputView.debugBox.Logf($"Debugger Fatal Error: Couldn't get GDB process ID\n");
            result = false;
         }
         if(result)
         {
            app.Unlock();
            serialSemaphore.Wait();
            app.Lock();

            if(!GdbTargetSet())
            {
               //ChangeState(terminated);
               result = false;
            }

            if(result)
            {
#if defined(__unix__)
               {
                  CreateTemporaryDir(progFifoDir, "ecereide");
                  strcpy(progFifoPath, progFifoDir);
                  PathCat(progFifoPath, "ideprogfifo");
                  if(!mkfifo(progFifoPath, 0600))
                  {
                     //fileCreated = true;
                  }
                  else
                  {
                     //app.Lock();
                     ide.outputView.debugBox.Logf(createFIFOMsg, progFifoPath);
                     //app.Unlock();
                  }
               }

               progThread.terminate = false;
               progThread.Create();
#endif
      
#if defined(__WIN32__)
               GdbCommand(false, "-gdb-set new-console on");
#endif
         
               GdbCommand(false, "-gdb-set verbose off");
               //GdbCommand(false, "-gdb-set exec-done-display on");
               GdbCommand(false, "-gdb-set step-mode off");
               GdbCommand(false, "-gdb-set unwindonsignal on");
               //GdbCommand(false, "-gdb-set shell on");
               GdbCommand(false, "set print elements 992");
               GdbCommand(false, "-gdb-set backtrace limit 100000");

#if defined(__unix__)
               GdbCommand(false, "-inferior-tty-set %s", progFifoPath);
#endif

               GdbCommand(false, "-gdb-set args %s", ide.workspace.commandLineArgs ? ide.workspace.commandLineArgs : "");
               /*
               for(e : ide.workspace.environmentVars)
               {
                  GdbCommand(false, "set environment %s=%s", e.name, e.string);
               }
               */
            }
         }
      }

      ChangeWorkingDir(oldDirectory);

      delete pathBackup;

      if(!result)
         GdbExit();
      delete targetDirExp;
      return result;
   }

   void GdbExit()
   {
      if(gdbHandle && gdbProcessId)
      {
         GdbCommand(false, "-gdb-exit");

         if(gdbThread)
         {
            app.Unlock();
            gdbThread.Wait();
            app.Lock();
         }
         if(gdbHandle)
         {
            gdbHandle.Wait();
            delete gdbHandle;
         }
      }
      gdbTimer.Stop();
      ChangeState(terminated); // this state change seems to be superfluous, is it safety for something?
      prjConfig = null;

      if(ide.workspace)
         for(bp : ide.workspace.breakpoints)
            bp.inserted = false;
      for(bp : sysBPs)
         bp.inserted = false;
      if(bpRunToCursor)
         bpRunToCursor.inserted = false;
      
      ide.outputView.debugBox.Logf($"Debugging stopped\n");
      ClearBreakDisplay();
      ide.Update(null);

#if defined(__unix__)
      if(FileExists(progFifoPath)) //fileCreated)
      {
         progThread.terminate = true;
         if(fifoFile)
         {
            fifoFile.CloseInput();
            app.Unlock();
            progThread.Wait();
            app.Lock();
            delete fifoFile;
         }         
         DeleteFile(progFifoPath);
         progFifoPath[0] = '\0';
         rmdir(progFifoDir);
      }
#endif
   }

   void WatchesCodeEditorLinkInit()
   {
      /*
      char tempPath[MAX_LOCATION];
      char path[MAX_LOCATION];
      
      //void MakeFilePathProjectRelative(char * path, char * relativePath)
      if(!ide.projectView.GetRelativePath(activeFrame.file, tempPath))
         strcpy(tempPath, activeFrame.file);
      
      strcpy(path, ide.workspace.projectDir);
      PathCat(path, tempPath);
      codeEditor = (CodeEditor)ide.OpenFile(path, Normal, false, null, no);
      if(!codeEditor)
      {
         for(srcDir : ide.workspace.sourceDirs)
         {
            strcpy(path, srcDir);
            PathCat(path, tempPath);
            codeEditor = (CodeEditor)ide.OpenFile(path, Normal, false, null, no);
            if(codeEditor) break;
         }
      }
      */

      if(activeFrame && !activeFrame.absoluteFile && activeFrame.file)
         activeFrame.absoluteFile = ide.workspace.GetAbsolutePathFromRelative(activeFrame.file);
      if(!activeFrame || !activeFrame.absoluteFile)
         codeEditor = null;
      else
         codeEditor = (CodeEditor)ide.OpenFile(activeFrame.absoluteFile, normal, false, null, no, normal);
      if(codeEditor)
      {
         codeEditor.inUseDebug = true;
         incref codeEditor;
      }
      //watchesInit = true;
   }

   void WatchesCodeEditorLinkRelease()
   {
      //if(watchesInit)
      {
         if(codeEditor)
         {
            codeEditor.inUseDebug = false;
            if(!codeEditor.visible)
               codeEditor.Destroy(0);
            delete codeEditor;
         }
      }
   }

   bool ResolveWatch(Watch wh)
   {
      bool result = false;
      
      wh.Reset();

      /*delete wh.value;
      if(wh.type) 
      {
         FreeType(wh.type);
         wh.type = null;
      }*/

      if(wh.expression)
      {
         char watchmsg[MAX_F_STRING];
         if(state == stopped && !codeEditor)
            wh.value = CopyString($"No source file found for selected frame");
         //if(codeEditor && state == stopped || state != stopped)
         else
         {
            Module backupPrivateModule;
            Context backupContext;
            Class backupThisClass;
            Expression exp;
            parseError = false;

            backupPrivateModule = GetPrivateModule();
            backupContext = GetCurrentContext();
            backupThisClass = GetThisClass();
            if(codeEditor)
            {
               SetPrivateModule(codeEditor.privateModule);
               SetCurrentContext(codeEditor.globalContext);
               SetTopContext(codeEditor.globalContext);
               SetGlobalContext(codeEditor.globalContext);
               SetGlobalData(&codeEditor.globalData);
            }
         
            exp = ParseExpressionString(wh.expression);
            
            if(exp && !parseError)
            {
               if(GetPrivateModule())
               {
                  if(codeEditor)
                     DebugFindCtxTree(codeEditor.ast, activeFrame.line, 0);
                  ProcessExpressionType(exp);
               }
               wh.type = exp.expType;
               if(wh.type)
                  wh.type.refCount++;
               DebugComputeExpression(exp);

               /*if(exp.hasAddress)
               {
                  char temp[MAX_F_STRING];
                  sprintf(temp, "0x%x", exp.address);
                  wh.address = CopyString(temp);
                  // wh.address = CopyStringf("0x%x", exp.address);
               }*/
/*
//#ifdef _DEBUG
               {
                  Type dataType = exp.expType;
                  if(dataType)
                  {
                     char temp[MAX_F_STRING];
                     switch(dataType.kind)
                     {
                        case charType:
                           sprintf(temp, "%i", exp.val.c);
                           break;
                        case shortType:
                           sprintf(temp, "%i", exp.val.s);
                           break;
                        case intType:
                        case longType:
                        case enumType:
                           sprintf(temp, "%i", exp.val.i);
                           break;
                        case int64Type:
                           sprintf(temp, "%i", exp.val.i64);
                           break;
                        case pointerType:
                           sprintf(temp, "%i", exp.val.p);
                           break;

                        case floatType:
                        {
                           long v = (long)exp.val.f;
                           sprintf(temp, "%i", v);
                           break;
                        } 
                        case doubleType:
                        {
                           long v = (long)exp.val.d;
                           sprintf(temp, "%i", v);
                           break;
                        }
                     }
                     if(temp)
                        wh.intVal = CopyString(temp);
                     switch(dataType.kind)
                     {
                        case charType:
                           sprintf(temp, "0x%x", exp.val.c);
                           break;
                        case shortType:
                           sprintf(temp, "0x%x", exp.val.s);
                           break;
                        case enumType:
                        case intType:
                           sprintf(temp, "0x%x", exp.val.i);
                           break;
                        case int64Type:
                           sprintf(temp, "0x%x", exp.val.i64);
                           break;
                        case longType:
                           sprintf(temp, "0x%x", exp.val.i64);
                           break;
                        case pointerType:
                           sprintf(temp, "0x%x", exp.val.p);
                           break;

                        case floatType:
                        {
                           long v = (long)exp.val.f;
                           sprintf(temp, "0x%x", v);
                           break;
                        } 
                        case doubleType:
                        {
                           long v = (long)exp.val.d;
                           sprintf(temp, "0x%x", v);
                           break;
                        }
                     }
                     if(temp)
                        wh.hexVal = CopyString(temp);
                     switch(dataType.kind)
                     {
                        case charType:
                           sprintf(temp, "0o%o", exp.val.c);
                           break;
                        case shortType:
                           sprintf(temp, "0o%o", exp.val.s);
                           break;
                        case enumType:
                        case intType:
                           sprintf(temp, "0o%o", exp.val.i);
                           break;
                        case int64Type:
                           sprintf(temp, "0o%o", exp.val.i64);
                           break;
                        case longType:
                           sprintf(temp, "0o%o", exp.val.i64);
                           break;
                        case pointerType:
                           sprintf(temp, "0o%o", exp.val.p);
                           break;

                        case floatType:
                        {
                           long v = (long)exp.val.f;
                           sprintf(temp, "0o%o", v);
                           break;
                        } 
                        case doubleType:
                        {
                           long v = (long)exp.val.d;
                           sprintf(temp, "0o%o", v);
                           break;
                        }
                     }
                     if(temp)
                        wh.octVal = CopyString(temp);
                  }
               }
               // WHATS THIS HERE ?
               if(exp.type == constantExp && exp.constant)
                  wh.constant = CopyString(exp.constant);
//#endif
*/

               switch(exp.type)
               {
                  case symbolErrorExp:
                     snprintf(watchmsg, sizeof(watchmsg), $"Symbol \"%s\" not found", exp.identifier.string);
                     break;
                  case structMemberSymbolErrorExp:
                     // todo get info as in next case (ExpClassMemberSymbolError)
                     snprintf(watchmsg, sizeof(watchmsg), $"Error: Struct member not found for \"%s\"", wh.expression);
                     break;
                  case classMemberSymbolErrorExp:
                     {
                        Class _class;
                        Expression memberExp = exp.member.exp;
                        Identifier memberID = exp.member.member;
                        Type type = memberExp.expType;
                        if(type)
                        {
                           _class = (memberID && memberID.classSym) ? memberID.classSym.registered : ((type.kind == classType && type._class) ? type._class.registered : null);
                           if(!_class)
                           {
                              char string[256] = "";
                              Symbol classSym;
                              PrintType(type, string, false, true);
                              classSym = FindClass(string);
                              _class = classSym ? classSym.registered : null;
                           }
                           if(_class)
                              snprintf(watchmsg, sizeof(watchmsg), $"Member \"%s\" not found in class \"%s\"", memberID ? memberID.string : "", _class.name);
                           else
                              snprintf(watchmsg, sizeof(watchmsg), "Member \"%s\" not found in unregistered class? (Should never get this message)", memberID ? memberID.string : "");
                        }
                        else
                           snprintf(watchmsg, sizeof(watchmsg), "Member \"%s\" not found in no type? (Should never get this message)", memberID ? memberID.string : "");
                     }
                     break;
                  case memoryErrorExp:
                     // Need to ensure when set to memoryErrorExp, constant is set
                     snprintf(watchmsg, sizeof(watchmsg), $"Memory can't be read at %s", /*(exp.type == constantExp) ? */exp.constant /*: null*/);
                     break;
                  case dereferenceErrorExp:
                     snprintf(watchmsg, sizeof(watchmsg), $"Dereference failure for \"%s\"", wh.expression);
                     break;
                  case unknownErrorExp:
                     snprintf(watchmsg, sizeof(watchmsg), $"Unknown error for \"%s\"", wh.expression);
                     break;
                  case noDebuggerErrorExp:
                     snprintf(watchmsg, sizeof(watchmsg), $"Debugger required for symbol evaluation in \"%s\"", wh.expression);
                     break;
                  case debugStateErrorExp:
                     snprintf(watchmsg, sizeof(watchmsg), $"Incorrect debugger state for symbol evaluation in \"%s\"", wh.expression);
                     break;
                  case 0:
                     snprintf(watchmsg, sizeof(watchmsg), $"Null type for \"%s\"", wh.expression);
                     break;
                  case constantExp:
                  case stringExp:
                     // Temporary Code for displaying Strings
                     if((exp.expType && ((exp.expType.kind == pointerType || 
                              exp.expType.kind == arrayType) && exp.expType.type.kind == charType)) || 
                           (wh.type && wh.type.kind == classType && wh.type._class && 
                              wh.type._class.registered && wh.type._class.registered.type == normalClass &&
                              !strcmp(wh.type._class.registered.name, "String")))
                     {

                        if(exp.expType.kind != arrayType || exp.hasAddress)
                        {
                           uint address;
                           char * string;
                           char value[4196];
                           int len;
                           //char temp[MAX_F_STRING * 32];

                           ExpressionType evalError = dummyExp;
                           /*if(exp.expType.kind == arrayType)
                              sprintf(temp, "(char*)0x%x", exp.address);
                           else
                              sprintf(temp, "(char*)%s", exp.constant);*/

                           //evaluation = Debugger::EvaluateExpression(temp, &evalError);
                           address = strtoul(exp.constant, null, 0);
                           //printf("%x\n", address);
                           snprintf(value, sizeof(value), "0x%08x ", address);
                           value[sizeof(value)-1] = 0;
                           
                           if(!address)
                              strcat(value, $"Null string");
                           else
                           {
                              int size = 4096;
                              len = strlen(value);
                              string = null;
                              while(!string && size > 2)
                              {
                                 string = GdbReadMemory(address, size);
                                 size /= 2;
                              }
                              if(string && string[0])
                              {
                                 value[len++] = '(';
                                 if(UTF8Validate(string))
                                 {
                                    int c;
                                    char ch;
                                    
                                    for(c = 0; (ch = string[c]) && c<4096; c++)
                                       value[len++] = ch;                                 
                                    value[len++] = ')';
                                    value[len++] = '\0';
                                    
                                 }
                                 else
                                 {
                                    ISO8859_1toUTF8(string, value + len, 4096 - len - 30);
                                    strcat(value, ") (ISO8859-1)");
                                 }

                                 delete string;
                              }
                              else if(string)
                              {
                                 strcat(value, $"Empty string");
                                 delete string;
                              }
                              else
                                 strcat(value, $"Couldn't read memory");
                           }
                           wh.value = CopyString(value);
                        }
                     }
                     else if(wh.type && wh.type.kind == classType && wh.type._class && 
                              wh.type._class.registered && wh.type._class.registered.type == enumClass)
                     {
                        uint64 value = strtoul(exp.constant, null, 0);
                        Class enumClass = eSystem_FindClass(GetPrivateModule(), wh.type._class.registered.name);
                        EnumClassData enumeration = (EnumClassData)enumClass.data;
                        NamedLink item;
                        for(item = enumeration.values.first; item; item = item.next)
                           if((int)item.data == value)
                              break;
                        if(item)
                           wh.value = CopyString(item.name);
                        else
                           wh.value = CopyString($"Invalid Enum Value");
                        result = (bool)atoi(exp.constant);
                     }
                     else if(wh.type && (wh.type.kind == charType || (wh.type.kind == classType && wh.type._class && 
                              wh.type._class.registered && !strcmp(wh.type._class.registered.fullName, "ecere::com::unichar"))) )
                     {
                        unichar value;
                        int signedValue;
                        char charString[5];
                        char string[256];

                        if(exp.constant[0] == '\'')
                        {
                           if((int)((byte *)exp.constant)[1] > 127)
                           {
                              int nb;
                              value = UTF8GetChar(exp.constant + 1, &nb);
                              if(nb < 2) value = exp.constant[1];
                              signedValue = value;
                           }
                           else
                           {
                              signedValue = exp.constant[1];
                              {
                                 // Precomp Syntax error with boot strap here:
                                 byte b = (byte)(char)signedValue;
                                 value = (unichar) b;
                              }
                           }
                        }
                        else
                        {
                           if(wh.type.kind == charType && wh.type.isSigned)
                           {
                              signedValue = (int)(char)strtol(exp.constant, null, 0);
                              {
                                 // Precomp Syntax error with boot strap here:
                                 byte b = (byte)(char)signedValue;
                                 value = (unichar) b;
                              }
                           }
                           else
                           {
                              value = strtoul(exp.constant, null, 0);
                              signedValue = (int)value;
                           }
                        }
                        charString[0] = 0;
                        UTF32toUTF8Len(&value, 1, charString, 5);
                        if(value == '\0')
                           snprintf(string, sizeof(string), "\'\\0' (0)");
                        else if(value == '\t')
                           snprintf(string, sizeof(string), "\'\\t' (%d)", value);
                        else if(value == '\n')
                           snprintf(string, sizeof(string), "\'\\n' (%d)", value);
                        else if(value == '\r')
                           snprintf(string, sizeof(string), "\'\\r' (%d)", value);
                        else if(wh.type.kind == charType && wh.type.isSigned)
                           snprintf(string, sizeof(string), "\'%s\' (%d)", charString, signedValue);
                        else if(value > 256 || wh.type.kind != charType)
                        {
                           if(value > 0x10FFFF || !GetCharCategory(value))
                              snprintf(string, sizeof(string), $"Invalid Unicode Keypoint (0x%08X)", value);
                           else
                              snprintf(string, sizeof(string), "\'%s\' (U+%04X)", charString, value);
                        }
                        else
                           snprintf(string, sizeof(string), "\'%s\' (%d)", charString, value);
                        string[sizeof(string)-1] = 0;
                        
                        wh.value = CopyString(string);
                        result = true;
                     }
                     else
                     {
                        wh.value = CopyString(exp.constant);
                        result = (bool)atoi(exp.constant);
                     }
                     break;
                  default:
                     if(exp.hasAddress)
                     {
                        wh.value = PrintHexUInt(exp.address);
                        result = (bool)exp.address;
                     }
                     else
                     {
                        char tempString[256];
                        if(exp.member.memberType == propertyMember)
                           snprintf(watchmsg, sizeof(watchmsg), $"Missing property evaluation support for \"%s\"", wh.expression);
                        else
                           snprintf(watchmsg, sizeof(watchmsg), $"Evaluation failed for \"%s\" of type \"%s\"", wh.expression, 
                                 exp.type.OnGetString(tempString, null, null));
                     }
                     break;
               }
            }
            else
               snprintf(watchmsg, sizeof(watchmsg), $"Invalid expression: \"%s\"", wh.expression);
            if(exp) FreeExpression(exp);

            
            SetPrivateModule(backupPrivateModule);
            SetCurrentContext(backupContext);
            SetTopContext(backupContext);
            SetGlobalContext(backupContext);
            SetThisClass(backupThisClass);
         }
         //else 
         //   wh.value = CopyString("No source file found for selected frame");
         
         watchmsg[sizeof(watchmsg)-1] = 0;
         if(!wh.value)
            wh.value = CopyString(watchmsg);
      }
      ide.watchesView.UpdateWatch(wh);
      return result;
   }

   void EvaluateWatches()
   {
      for(wh : ide.workspace.watches)
         ResolveWatch(wh);
   }

   char * ::GdbEvaluateExpression(char * expression)
   {
      eval.active = true;
      eval.error = none;
      GdbCommand(false, "-data-evaluate-expression \"%s\"", expression);
      if(eval.active)
         ide.outputView.debugBox.Logf("Debugger Error: GdbEvaluateExpression\n");
      return eval.result;
   }

   // to be removed... use GdbReadMemory that returns a byte array instead
   char * ::GdbReadMemoryString(uint address, int size, char format, int rows, int cols)
   {
      eval.active = true;
      eval.error = none;
#ifdef _DEBUG
      if(!size)
         printf("GdbReadMemoryString called with size = 0!\n");
#endif
      GdbCommand(false, "-data-read-memory 0x%08x %c, %d, %d, %d", address, format, size, rows, cols);
      if(eval.active)
         ide.outputView.debugBox.Logf("Debugger Error: GdbReadMemoryString\n");
      return eval.result;
   }

   byte * ::GdbReadMemory(uint address, int bytes)
   {
      eval.active = true;
      eval.error = none;
      GdbCommand(false, "-data-read-memory 0x%08x %c, 1, 1, %d", address, 'u', bytes);
#ifdef _DEBUG
      if(!bytes)
         printf("GdbReadMemory called with bytes = 0!\n");
#endif
      if(eval.active)
         ide.outputView.debugBox.Logf("Debugger Error: GdbReadMemory\n");
      else if(eval.result && strcmp(eval.result, "N/A"))
      {
         byte * result = new byte[bytes];
         byte * string = eval.result;
         int c = 0;
         while(true)
         {
            result[c++] = (byte)strtol(string, &string, 10);
            if(string)
            {
               if(*string == ',')
                  string++;
                else
                  break;
            }
            else
               break;
         }
         return result;
      }
      return null;
   }

   void EventHit(GdbDataStop stopItem)
   {
      bool conditionMet = true;
      Breakpoint bp = bpHit;

      if(!bp && bpRunToCursor)
      {
         bp = bpRunToCursor;
         if(symbols)
            GdbCommand(false, "-break-delete %d", bp.bp.number);
      }
      
      if(bp)
      {
         if(bp.type == user && stopItem.frame.line && bp.line != stopItem.frame.line)
         {
            bp.line = stopItem.frame.line;
            ide.breakpointsView.UpdateBreakpoint(bp.row);
            ide.workspace.Save();
         }

         switch(bp.type)
         {
            case internalMain:
            case internalWinMain:
               GdbBreakpointsInsert();
               if(userBreakOnInternBreak)
               {
                  userBreakOnInternBreak = false;
                  // Why was SelectFrame missing here?
                  SelectFrame(activeFrameLevel);
                  GoToStackFrameLine(activeFrameLevel, true);
                  ideMainFrame.Activate();   // TOFIX: ide.Activate() is not reliable (app inactive)
                  ide.Update(null);
               }
               else
                  GdbExecContinue(false);
               break;
            case internalModulesLoaded:
               modules = true;
               GdbBreakpointsInsert();
               GdbExecContinue(false);
               break;
            case user:
            case runToCursor:
               if(bp.condition)
                  conditionMet = ResolveWatch(bp.condition);
               bp.hits++;
               if((bp.level == -1 || bp.level == frameCount-1) && conditionMet)
               {
                  if(!bp.ignore)
                  {
                     bp.breaks++;
                     ignoreBreakpoints = false;
                     // Why was SelectFrame missing here?
                     SelectFrame(activeFrameLevel);
                     GoToStackFrameLine(activeFrameLevel, true);
                     ideMainFrame.Activate();   // TOFIX: ide.Activate() is not reliable (app inactive)
                     ide.Update(null);
                     if(bp.type == BreakpointType::runToCursor)
                     {
                        delete bpRunToCursor;
                        bpRunToCursor = null;
                     }
                  }
                  else
                  {
                     bp.ignore--;
                     GdbExecContinue(false);
                  }
               }
               else
                  GdbExecContinue(false);
               ide.breakpointsView.UpdateBreakpoint(bp.row);
               break;
         }
      }
      else
         ide.outputView.debugBox.Logf("Debugger Error: Breakpoint hit could not match breakpoint instance\n");
   }

   void GdbThreadExit()
   {
      if(state != terminated)
      {
         ChangeState(terminated);
         targetProcessId = 0;
         ClearBreakDisplay();

         if(gdbHandle)
         {
            serialSemaphore.Release();
            gdbTimer.Stop();
            gdbHandle.Wait();
            delete gdbHandle;
            
            ide.outputView.debugBox.Logf($"Debugger Fatal Error: GDB lost\n");
            ide.outputView.debugBox.Logf($"Debugging stopped\n");
            ide.Update(null);
         }
         //ChangeState(terminated);
      }
   }

   void GdbThreadMain(char * output)
   {
      int i;
      Array<char *> outTokens { minAllocSize = 50 };
      Array<char *> subTokens { minAllocSize = 50 };
      DebugListItem item { };
      DebugListItem item2 { };
      bool setWaitingForPID = false;
      
#if defined(GDB_DEBUG_CONSOLE) || defined(GDB_DEBUG_GUI)
#ifdef GDB_DEBUG_CONSOLE
      Log(output); Log("\n");
#endif
#ifdef GDB_DEBUG_OUTPUT
      {
         int len = strlen(output);
         if(len > 1024)
         {
            int c;
            char * start;
            char tmp[1025];
            tmp[1024] = '\0';
            start = output;
            for(c = 0; c < len / 1024; c++)
            {
               strncpy(tmp, start, 1024);
               ide.outputView.gdbBox.Logf("out: %s\n", tmp);
               start += 1024;
            }
            ide.outputView.gdbBox.Logf("out: %s\n", start);
         }
         else
         {
            ide.outputView.gdbBox.Logf("out: %s\n", output);
         }
      }
#endif
#ifdef GDB_DEBUG_CONSOLE
         strcpy(lastGdbOutput, output);
#endif
#ifdef GDB_DEBUG_GUI
         if(ide.gdbDialog) ide.gdbDialog.AddOutput(output);
#endif
#endif
      
      switch(output[0])
      {
         case '~':
            if(strstr(output, "No debugging symbols found") || strstr(output, "(no debugging symbols found)"))
            {
               symbols = false;
               ide.outputView.debugBox.Logf($"Target doesn't contain debug information!\n");
               ide.Update(null);
            }
            break;
         case '^':
            gdbReady = false;
            if(TokenizeList(output, ',', outTokens) && !strcmp(outTokens[0], "^done"))
            {
               //if(outTokens.count == 1)
               {
                  if(sentKill)
                  {
                     sentKill = false;
                     ChangeState(loaded);
                     targetProcessId = 0;
                     if(outTokens.count > 1 && TokenizeListItem(outTokens[1], item))
                     {
                        if(!strcmp(item.name, "reason"))
                        {
                           char * reason = item.value;
                           StripQuotes(reason, reason);
                           if(!strcmp(reason, "exited-normally") || !strcmp(reason, "exited") || !strcmp(reason, "exited-signalled"))
                           {
                              char * exitCode;
                              if(outTokens.count > 2 && TokenizeListItem(outTokens[2], item2))
                              {
                                 StripQuotes(item2.value, item2.value);
                                 if(!strcmp(item2.name, "exit-code"))
                                    exitCode = item2.value;
                                 else
                                    exitCode = null;
                              }
                              else
                                 exitCode = null;
                              HandleExit(reason, exitCode);
                           }
                        }
                        else
                           DebuggerProtocolUnknown("Unknown kill reply", item.name);
                     }
                     else
                        HandleExit(null, null);
                  }
               }
               if(outTokens.count > 1 && TokenizeListItem(outTokens[1], item))
               {
                  if(!strcmp(item.name, "bkpt"))
                  {
                     sentBreakInsert = false;
#ifdef _DEBUG
                     if(bpItem)
                        printf("problem\n");
#endif
                     bpItem = GdbDataBreakpoint { };
                     item.value = StripCurlies(item.value);
                     TokenizeList(item.value, ',', subTokens);
                     for(i = 0; i < subTokens.count; i++)
                     {
                        if(TokenizeListItem(subTokens[i], item))
                        {
                           StripQuotes(item.value, item.value);
                           if(!strcmp(item.name, "number"))
                              bpItem.number = atoi(item.value);
                           else if(!strcmp(item.name, "type"))
                              bpItem.type = CopyString(item.value);
                           else if(!strcmp(item.name, "disp"))
                              bpItem.disp = CopyString(item.value);
                           else if(!strcmp(item.name, "enabled"))
                              bpItem.enabled = (!strcmpi(item.value, "y"));
                           else if(!strcmp(item.name, "addr"))
                              bpItem.addr = CopyString(item.value);
                           else if(!strcmp(item.name, "func"))
                              bpItem.func = CopyString(item.value);
                           else if(!strcmp(item.name, "file"))
                              bpItem.file = item.value;
                           else if(!strcmp(item.name, "line"))
                              bpItem.line = atoi(item.value);
                           else if(!strcmp(item.name, "at"))
                              bpItem.at = CopyString(item.value);
                           else if(!strcmp(item.name, "times"))
                              bpItem.times = atoi(item.value);
                        }
                     }
                     //breakType = bpValidation;
                     //app.SignalEvent();
                     subTokens.RemoveAll();
                  }
                  else if(!strcmp(item.name, "BreakpointTable"))
                     ide.outputView.debugBox.Logf("Debugger Error: Command reply BreakpointTable not handled\n");
                  else if(!strcmp(item.name, "depth"))
                  {
                     StripQuotes(item.value, item.value);
                     frameCount = atoi(item.value);
                     activeFrame = null;
                     stackFrames.Free(Frame::Free);
                  }
                  else if(!strcmp(item.name, "stack"))
                  {
                     Frame frame;
                     if(stackFrames.count)
                        ide.callStackView.Logf("...\n");
                     else
                        activeFrame = null;
                     item.value = StripBrackets(item.value);
                     TokenizeList(item.value, ',', subTokens);
                     for(i = 0; i < subTokens.count; i++)
                     {
                        if(TokenizeListItem(subTokens[i], item))
                        {
                           if(!strcmp(item.name, "frame"))
                           {
                              frame = Frame { };
                              stackFrames.Add(frame);
                              item.value = StripCurlies(item.value);
                              ParseFrame(frame, item.value);
                              if(frame.file && frame.from)
                                 DebuggerProtocolUnknown("Unexpected frame file and from members present", "");
                              if(frame.file)
                              {
                                 char * s;
                                 if(activeFrameLevel == -1)
                                 {
                                    if(ide.projectView.IsModuleInProject(frame.file));
                                    {
                                       if(frame.level != 0)
                                       {
                                          //stopItem.frame = frame;
                                          breakType = selectFrame;
                                       }
                                       else
                                          activeFrame = frame;
                                       activeFrameLevel = frame.level;
                                    }
                                 }
                                 ide.callStackView.Logf("%3d ", frame.level);
                                 if(!strncmp(frame.func, "__ecereMethod_", strlen("__ecereMethod_")))
                                    ide.callStackView.Logf($"%s Method, %s:%d\n", &frame.func[strlen("__ecereMethod_")], (s = CopySystemPath(frame.file)), frame.line);
                                 else if(!strncmp(frame.func, "__ecereProp_", strlen("__ecereProp_")))
                                    ide.callStackView.Logf($"%s Property, %s:%d\n", &frame.func[strlen("__ecereProp_")], (s = CopySystemPath(frame.file)), frame.line);
                                 else if(!strncmp(frame.func, "__ecereConstructor_", strlen("__ecereConstructor_")))
                                    ide.callStackView.Logf($"%s Constructor, %s:%d\n", &frame.func[strlen("__ecereConstructor_")], (s = CopySystemPath(frame.file)), frame.line);
                                 else if(!strncmp(frame.func, "__ecereDestructor_", strlen("__ecereDestructor_")))
                                    ide.callStackView.Logf($"%s Destructor, %s:%d\n", &frame.func[strlen("__ecereDestructor_")], (s = CopySystemPath(frame.file)), frame.line);
                                 else
                                    ide.callStackView.Logf($"%s Function, %s:%d\n", frame.func, (s = CopySystemPath(frame.file)), frame.line);
                                 delete s;
                              }
                              else
                              {
                                 ide.callStackView.Logf("%3d ", frame.level);

                                 if(frame.from)
                                 {
                                    char * s;
                                    ide.callStackView.Logf($"inside %s, %s\n", frame.func, (s = CopySystemPath(frame.from)));
                                    delete s;
                                 }
                                 else if(frame.func)
                                    ide.callStackView.Logf("%s\n", frame.func);
                                 else
                                    ide.callStackView.Logf($"unknown source\n");
                              }
                           }
                           else
                              DebuggerProtocolUnknown("Unknown stack content", item.name);
                        }
                     }
                     if(activeFrameLevel == -1)
                     {
                        activeFrameLevel = 0;
                        activeFrame = stackFrames.first;
                     }
                     ide.callStackView.Home();
                     ide.Update(null);
                     subTokens.RemoveAll();
                  }
                  /*else if(!strcmp(item.name, "frame"))
                  {
                     Frame frame { };
                     item.value = StripCurlies(item.value);
                     ParseFrame(&frame, item.value);
                  }*/
                  else if(!strcmp(item.name, "thread-ids"))
                  {
                     ide.threadsView.Clear();
                     item.value = StripCurlies(item.value);
                     TokenizeList(item.value, ',', subTokens);
                     for(i = subTokens.count - 1; ; i--)
                     {
                        if(TokenizeListItem(subTokens[i], item))
                        {
                           if(!strcmp(item.name, "thread-id"))
                           {
                              int value;
                              StripQuotes(item.value, item.value);
                              value = atoi(item.value);
                              ide.threadsView.Logf("%3d \n", value);
                           }
                           else
                              DebuggerProtocolUnknown("Unknown threads content", item.name);
                        }
                        if(!i)
                           break;
                     }
                     ide.threadsView.Home();
                     ide.Update(null);
                     subTokens.RemoveAll();
                     //if(!strcmp(outTokens[2], "number-of-threads"))
                  }
                  else if(!strcmp(item.name, "new-thread-id"))
                  {
                     StripQuotes(item.value, item.value);
                     activeThread = atoi(item.value);
                  }
                  else if(!strcmp(item.name, "value"))
                  {
                     StripQuotes(item.value, item.value);
                     eval.result = CopyString(item.value);
                     eval.active = false;
                  }
                  else if(!strcmp(item.name, "addr"))
                  {
                     for(i = 2; i < outTokens.count; i++)
                     {
                        if(TokenizeListItem(outTokens[i], item))
                        {
                           if(!strcmp(item.name, "total-bytes"))
                           {
                              StripQuotes(item.value, item.value);
                              eval.bytes = atoi(item.value);
                           }
                           else if(!strcmp(item.name, "next-row"))
                           {
                              StripQuotes(item.value, item.value);
                              eval.nextBlockAddress = strtoul(item.value, null, 0);
                           }
                           else if(!strcmp(item.name, "memory"))
                           {
                              int j;
                              //int value;
                              //StripQuotes(item.value, item.value);
                              item.value = StripBrackets(item.value);
                              // this should be treated as a list...
                              item.value = StripCurlies(item.value);
                              TokenizeList(item.value, ',', subTokens);
                              for(j = 0; j < subTokens.count; j++)
                              {
                                 if(TokenizeListItem(subTokens[j], item))
                                 {
                                    if(!strcmp(item.name, "data"))
                                    {
                                       item.value = StripBrackets(item.value);
                                       StripQuotes2(item.value, item.value);
                                       eval.result = CopyString(item.value);
                                       eval.active = false;
                                    }
                                 }
                              }
                              subTokens.RemoveAll();
                           }
                        }
                     }
                  }
                  else if(!strcmp(item.name, "source-path"))
                  {
                  }
                  else
                     DebuggerProtocolUnknown("Unknown command reply", item.name);
               }
            }
            else if(!strcmp(outTokens[0], "^running"))
            {
               waitingForPID = true;
               setWaitingForPID = true;
            }
            else if(!strcmp(outTokens[0], "^exit"))
            {
               ChangeState(terminated);
               // ide.outputView.debugBox.Logf("Exit\n");
               // ide.Update(null);
               gdbReady = true;
               serialSemaphore.Release();
            }
            else if(!strcmp(outTokens[0], "^error"))
            {
               if(sentBreakInsert)
               {
                  sentBreakInsert = false;
                  breakpointError = true;
#ifdef _DEBUG
                  if(bpItem)
                     printf("problem\n");
#endif
                  bpItem = GdbDataBreakpoint { };
               }

               if(outTokens.count > 1 && TokenizeListItem(outTokens[1], item))
               {
                  if(!strcmp(item.name, "msg"))
                  {
                     StripQuotes(item.value, item.value);
                     if(eval.active)
                     {
                        eval.active = false;
                        eval.result = null;
                        if(strstr(item.value, "No symbol") && strstr(item.value, "in current context"))
                           eval.error = symbolNotFound;
                        else if(strstr(item.value, "Cannot access memory at address"))
                           eval.error = memoryCantBeRead;
                        else
                           eval.error = unknown;
                     }
                     else if(!strcmp(item.value, "Previous frame inner to this frame (corrupt stack?)"))
                     {
                     }
                     else if(!strncmp(item.value, "Cannot access memory at address", 31))
                     {
                     }
                     else if(!strcmp(item.value, "Cannot find bounds of current function"))
                     {
                        ChangeState(stopped);
                        gdbHandle.Printf("-exec-continue\n");
                     }
                     else if(!strcmp(item.value, "ptrace: No such process."))
                     {
                        ChangeState(loaded);
                        targetProcessId = 0;
                     }
                     else if(!strcmp(item.value, "Function \\\"WinMain\\\" not defined."))
                     {
                     }
                     else if(!strcmp(item.value, "You can't do that without a process to debug."))
                     {
                        ChangeState(loaded);
                        targetProcessId = 0;
                     }
                     else if(strstr(item.value, "No such file or directory."))
                     {
                        ChangeState(loaded);
                        targetProcessId = 0;
                     }
                     else if(strstr(item.value, "During startup program exited with code "))
                     {
                        ChangeState(loaded);
                        targetProcessId = 0;
                     }
                     else
                     {
#ifdef _DEBUG
                        if(strlen(item.value) < MAX_F_STRING)
                        {
                           char * s;
                           ide.outputView.debugBox.Logf("GDB: %s\n", (s = CopyUnescapedString(item.value)));
                           delete s;
                        }
                        else
                           ide.outputView.debugBox.Logf("GDB: %s\n", item.value);
#endif
                     }
                  }
               }
               else
                  DebuggerProtocolUnknown("Unknown error content", item.name);
            }
            else
               DebuggerProtocolUnknown("Unknown result-record", outTokens[0]);
            
            outTokens.RemoveAll();
            break;
         case '+':
            DebuggerProtocolUnknown("Unknown status-async-output", outTokens[0]);
            break;
         case '=':
            if(TokenizeList(output, ',', outTokens) && !strcmp(outTokens[0], "=thread-group-created")) //=thread-group-created,id="7611"
               ;
            else if(!strcmp(outTokens[0], "=thread-created")) //=thread-created,id="1",group-id="7611"
               ;
            else if(!strcmp(outTokens[0], "=library-loaded")) //=library-loaded,id="/lib/ld-linux.so.2",target-name="/lib/ld-linux.so.2",host-name="/lib/ld-linux.so.2",symbols-loaded="0"
               ;
            else
               DebuggerProtocolUnknown("Unknown notify-async-output", outTokens[0]);
            outTokens.RemoveAll();
            break;
         case '*':
            gdbReady = false;
            if(TokenizeList(output, ',', outTokens))
            {
               if(!strcmp(outTokens[0],"*running"))
               {
                  waitingForPID = true;
                  setWaitingForPID = true;
               }
               else if(!strcmp(outTokens[0], "*stopped"))
               {
                  int tk;
                  ChangeState(stopped);

                  for(tk = 1; tk < outTokens.count; tk++)
                  {
                     if(TokenizeListItem(outTokens[tk], item))
                     {
                        if(!strcmp(item.name, "reason"))
                        {
                           char * reason = item.value;
                           StripQuotes(reason, reason);
                           if(!strcmp(reason, "exited-normally") || !strcmp(reason, "exited") || !strcmp(reason, "exited-signalled"))
                           {
                              char * exitCode;
                              if(outTokens.count > tk+1 && TokenizeListItem(outTokens[tk+1], item2))
                              {
                                 tk++;
                                 StripQuotes(item2.value, item2.value);
                                 if(!strcmp(item2.name, "exit-code"))
                                    exitCode = item2.value;
                                 else
                                    exitCode = null;
                              }
                              else
                                 exitCode = null;
                              HandleExit(reason, exitCode);
                           }
                           else if(!strcmp(reason, "breakpoint-hit"))
                           {
      #ifdef _DEBUG
                              if(stopItem)
                                 printf("problem\n");
      #endif
                              stopItem = GdbDataStop { };

                              for(i = tk+1; i < outTokens.count; i++)
                              {
                                 TokenizeListItem(outTokens[i], item);
                                 StripQuotes(item.value, item.value);
                                 if(!strcmp(item.name, "bkptno"))
                                    stopItem.bkptno = atoi(item.value);
                                 else if(!strcmp(item.name, "thread-id"))
                                    stopItem.threadid = atoi(item.value);
                                 else if(!strcmp(item.name, "frame"))
                                 {
                                    item.value = StripCurlies(item.value);
                                    ParseFrame(stopItem.frame, item.value);
                                 }
                                 else
                                    DebuggerProtocolUnknown("Unknown breakpoint hit item name", item.name);
                              }

                              event = hit;
                           }
                           else if(!strcmp(reason, "end-stepping-range"))
                           {
      #ifdef _DEBUG
                              if(stopItem)
                                 printf("problem\n");
      #endif
                              stopItem = GdbDataStop { };

                              for(i = tk+1; i < outTokens.count; i++)
                              {
                                 TokenizeListItem(outTokens[i], item);
                                 StripQuotes(item.value, item.value);
                                 if(!strcmp(item.name, "thread-id"))
                                    stopItem.threadid = atoi(item.value);
                                 else if(!strcmp(item.name, "frame"))
                                 {
                                    item.value = StripCurlies(item.value);
                                    ParseFrame(stopItem.frame, item.value);
                                 }
                                 else if(!strcmp(item.name, "reason"))
                                    ;
                                 else if(!strcmp(item.name, "bkptno"))
                                    ;
                                 else
                                    DebuggerProtocolUnknown("Unknown end of stepping range item name", item.name);
                              }

                              event = stepEnd;
                              ide.Update(null);
                           }
                           else if(!strcmp(reason, "function-finished"))
                           {
      #ifdef _DEBUG
                              if(stopItem)
                                 printf("problem\n");
      #endif
                              stopItem = GdbDataStop { };
                              stopItem.reason = CopyString(reason);

                              for(i = tk+1; i < outTokens.count; i++)
                              {
                                 TokenizeListItem(outTokens[i], item);
                                 StripQuotes(item.value, item.value);
                                 if(!strcmp(item.name, "thread-id"))
                                    stopItem.threadid = atoi(item.value);
                                 else if(!strcmp(item.name, "frame"))
                                 {
                                    item.value = StripCurlies(item.value);
                                    ParseFrame(stopItem.frame, item.value);
                                 }
                                 else if(!strcmp(item.name, "gdb-result-var"))
                                    stopItem.gdbResultVar = CopyString(item.value);
                                 else if(!strcmp(item.name, "return-value"))
                                    stopItem.returnValue = CopyString(item.value);
                                 else
                                    DebuggerProtocolUnknown("Unknown function finished item name", item.name);
                              }

                              event = functionEnd;
                              ide.Update(null);
                           }
                           else if(!strcmp(reason, "signal-received"))
                           {
      #ifdef _DEBUG
                              if(stopItem)
                                 printf("problem\n");
      #endif
                              stopItem = GdbDataStop { };
                              stopItem.reason = CopyString(reason);

                              for(i = tk+1; i < outTokens.count; i++)
                              {
                                 TokenizeListItem(outTokens[i], item);
                                 StripQuotes(item.value, item.value);
                                 if(!strcmp(item.name, "signal-name"))
                                    stopItem.name = CopyString(item.value);
                                 else if(!strcmp(item.name, "signal-meaning"))
                                    stopItem.meaning = CopyString(item.value);
                                 else if(!strcmp(item.name, "thread-id"))
                                    stopItem.threadid = atoi(item.value);
                                 else if(!strcmp(item.name, "frame"))
                                 {
                                    item.value = StripCurlies(item.value);
                                    ParseFrame(stopItem.frame, item.value);
                                 }
                                 else
                                    DebuggerProtocolUnknown("Unknown signal reveived item name", item.name);
                              }
                              if(!strcmp(stopItem.name, "SIGTRAP"))
                              {
                                 switch(breakType)
                                 {
                                    case internal:
                                       breakType = none;
                                       break;
                                    case restart:
                                    case stop:
                                       break;
                                    default:
                                       event = breakEvent;
                                 }
                              }
                              else
                              {
                                 event = signal;
                              }
                           }
                           else if(!strcmp(reason, "watchpoint-trigger"))
                              DebuggerProtocolUnknown("Reason watchpoint trigger not handled", "");
                           else if(!strcmp(reason, "read-watchpoint-trigger"))
                              DebuggerProtocolUnknown("Reason read watchpoint trigger not handled", "");
                           else if(!strcmp(reason, "access-watchpoint-trigger"))
                              DebuggerProtocolUnknown("Reason access watchpoint trigger not handled", "");
                           else if(!strcmp(reason, "watchpoint-scope"))
                              DebuggerProtocolUnknown("Reason watchpoint scope not handled", "");
                           else if(!strcmp(reason, "location-reached"))
                              DebuggerProtocolUnknown("Reason location reached not handled", "");
                           else
                              DebuggerProtocolUnknown("Unknown reason", reason);
                        }
                     }
                  }
                  app.SignalEvent();
               }
            }
            else
               DebuggerProtocolUnknown("Unknown exec-async-output", outTokens[0]);
            outTokens.RemoveAll();
            break;
         case '(':
            if(!strcmpi(output, "(gdb) "))
            {
               if(waitingForPID)
               {
                  char exeFile[MAX_LOCATION];
                  int oldProcessID = targetProcessId;
                  GetLastDirectory(targetFile, exeFile);

                  while(true)
                  {
                     targetProcessId = Process_GetChildExeProcessId(gdbProcessId, exeFile);
                     if(targetProcessId || gdbHandle.Peek()) break;
                     Sleep(0.01);
                  }

                  if(targetProcessId)
                     ChangeState(running);
                  else if(!oldProcessID)
                  {
                     ide.outputView.debugBox.Logf($"Debugger Error: No target process ID\n");
                     // TO VERIFY: The rest of this block has not been thoroughly tested in this particular location
                     gdbHandle.Printf("-gdb-exit\n");
                     gdbTimer.Stop();
                     ChangeState(terminated); //loaded;
                     prjConfig = null;

                     if(ide.workspace)
                     {
                        for(bp : ide.workspace.breakpoints)
                           bp.inserted = false;
                     }
                     for(bp : sysBPs)
                        bp.inserted = false;
                     if(bpRunToCursor)
                        bpRunToCursor.inserted = false;
                     
                     ide.outputView.debugBox.Logf($"Debugging stopped\n");
                     ClearBreakDisplay();

               #if defined(__unix__)
                     if(FileExists(progFifoPath)) //fileCreated)
                     {
                        progThread.terminate = true;
                        if(fifoFile)
                        {
                           fifoFile.CloseInput();
                           app.Unlock();
                           progThread.Wait();
                           app.Lock();
                           delete fifoFile;
                        }

                        DeleteFile(progFifoPath);
                        progFifoPath[0] = '\0';
                        rmdir(progFifoDir);
                     }
               #endif
                  }
               }
               gdbReady = true;
               serialSemaphore.Release();
            }
            else
               DebuggerProtocolUnknown($"Unknown prompt", output);

            break;
         case '&':
            if(!strncmp(output, "&\"warning:", 10))
            {
               char * content;
               content = strstr(output, "\"");
               StripQuotes(content, content);
               content = strstr(content, ":");
               if(content)
                  content++;
               if(content)
               {
                  char * s;
                  ide.outputView.debugBox.LogRaw((s = CopyUnescapedString(content)));
                  delete s;
                  ide.Update(null);
               }
            }
            break;
         default:
            DebuggerProtocolUnknown($"Unknown output", output);
      }
      if(!setWaitingForPID)
         waitingForPID = false;
      setWaitingForPID = false;

      delete outTokens;
      delete subTokens;
      delete item;
      delete item2;
   }

   void RunToCursorPrepare(char * absoluteFilePath, char * relativeFilePath, int lineNumber)
   {
      if(bpRunToCursor)
      {
         //bpRunToCursor.Free();
         bpRunToCursor = Breakpoint { };
      }
      else
         bpRunToCursor = Breakpoint { };

      if(absoluteFilePath)
         bpRunToCursor.absoluteFilePath = CopyString(absoluteFilePath);
      if(relativeFilePath)
         bpRunToCursor.relativeFilePath = CopyString(relativeFilePath);
      bpRunToCursor.line = lineNumber;
      bpRunToCursor.type = runToCursor;
      bpRunToCursor.enabled = true;
      bpRunToCursor.condition = null;
      bpRunToCursor.ignore = 0;
      bpRunToCursor.level = -1;
   }

   ExpressionType ::DebugEvalExpTypeError(char * result)
   {
      if(result)
         return dummyExp;
      switch(eval.error)
      {
         case symbolNotFound:
            return symbolErrorExp;
         case memoryCantBeRead:
            return memoryErrorExp;
      }
      return unknownErrorExp;
   }

   char * ::EvaluateExpression(char * expression, ExpressionType * error)
   {
      char * result;
      if(ide.projectView && ide.debugger.state == stopped)
      {
         result = GdbEvaluateExpression(expression);
         *error = DebugEvalExpTypeError(result);
      }
      else
      {
         result = null;
         *error = noDebuggerErrorExp;
      }
      return result;
   }

   char * ::ReadMemory(uint address, int size, char format, ExpressionType * error)
   {
      // check for state
      char * result = GdbReadMemoryString(address, size, format, 1, 1);
      if(!result || !strcmp(result, "N/A"))
         *error = memoryErrorExp;
      else
         *error = DebugEvalExpTypeError(result);
      return result;
   }
}

class GdbThread : Thread
{
   Debugger debugger;

   unsigned int Main()
   {
      static char output[4096];
      Array<char> dynamicBuffer { minAllocSize = 4096 };
      DualPipe oldGdbHandle = gdbHandle;
      incref oldGdbHandle;

      app.Lock();
      while(debugger.state != terminated && gdbHandle && !gdbHandle.Eof())
      {
         int result;
         app.Unlock();
         result = gdbHandle.Read(output, 1, sizeof(output));
         app.Lock();
         if(debugger.state == terminated || !gdbHandle || gdbHandle.Eof())
            break;
         if(result)
         {
            int c;
            int start = 0;

            for(c = 0; c<result; c++)
            {
               if(output[c] == '\n')
               {
                  int pos = dynamicBuffer.size;
                  dynamicBuffer.size += c - start;
                  memcpy(&dynamicBuffer[pos], output + start, c - start);
                  if(dynamicBuffer.count && dynamicBuffer[dynamicBuffer.count - 1] != '\r')
                  // COMMENTED OUT DUE TO ISSUE #135, FIXED
                  //if(dynamicBuffer.array[dynamicBuffer.count - 1] != '\r')
                     dynamicBuffer.size++;
                  dynamicBuffer[dynamicBuffer.count - 1] = '\0';
#ifdef _DEBUG
                  // printf("%s\n", dynamicBuffer.array);
#endif
                  debugger.GdbThreadMain(&dynamicBuffer[0]);
                  dynamicBuffer.size = 0;
                  start = c + 1;
               }
            }
            if(c == result)
            {
               int pos = dynamicBuffer.size;
               dynamicBuffer.size += c - start;
               memcpy(&dynamicBuffer[pos], output + start, c - start);
            }
         }
         else
         {
#ifdef _DEBUG
            printf("Got end of file from GDB!\n");
#endif
         }
      }
      delete dynamicBuffer;
      //if(oldGdbHandle == gdbHandle)
         debugger.GdbThreadExit();
      delete oldGdbHandle;
      app.Unlock();
      return 0;
   }
}

static define createFIFOMsg = $"err: Unable to create FIFO %s\n";
static define openFIFOMsg = $"err: Unable to open FIFO %s for read\n";

#if defined(__unix__)
#define uint _uint
#include <errno.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/types.h>
#undef uint

File fifoFile;

class ProgramThread : Thread
{
   bool terminate;
   unsigned int Main()
   {
      bool result = true;
      bool fileCreated = false;
      mode_t mask = 0600;
      static char output[1000];
      int fd;

      /*if(!mkfifo(progFifoPath, mask))
      {
         fileCreated = true;
      }
      else
      {
         app.Lock();
         ide.outputView.debugBox.Logf($"err: Unable to create FIFO %s\n", progFifoPath);
         app.Unlock();
      }*/

      if(FileExists(progFifoPath)) //fileCreated)
      {
         fifoFile = FileOpen(progFifoPath, read);
         if(!fifoFile)
         {
            app.Lock();
            ide.outputView.debugBox.Logf(openFIFOMsg, progFifoPath);
            app.Unlock();
         }
         else
         {
            fd = fileno((FILE *)fifoFile.input);
            //fcntl(fd, F_SETFL, fcntl(fd, F_GETFL) | O_NONBLOCK);
         }
      }

      while(!terminate && fifoFile && !fifoFile.Eof())
      {
         fd_set rs, es;
         struct timeval time;
         int selectResult;
         time.tv_sec = 1;
         time.tv_usec = 0;
         FD_ZERO(&rs);
         FD_ZERO(&es);
         FD_SET(fd, &rs);
         FD_SET(fd, &es);
         selectResult = select(fd + 1, &rs, null, null, &time);
         if(FD_ISSET(fd, &rs))
         {
            int result = read(fd, output, sizeof(output)-1);
            if(!result || (result < 0 && errno != EAGAIN))
               break;
            if(result > 0)
            {
               output[result] = '\0';
               if(strcmp(output,"&\"warning: GDB: Failed to set controlling terminal: Invalid argument\\n\"\n"))
               {
                  app.Lock();
                  ide.outputView.debugBox.Log(output);
                  app.Unlock();
               }
            }
         }
      }

      //if(fifoFile)
      {
         //fifoFile.CloseInput();
         //delete fifoFile;
         app.Lock();
         ide.outputView.debugBox.Log("\n");
         app.Unlock();
      }
      /*
      if(FileExists(progFifoPath)) //fileCreated)
      {
         DeleteFile(progFifoPath);
         progFifoPath[0] = '\0';
      }
      */
      return 0;
   }
}
#endif

class Argument : struct
{
   Argument prev, next;
   char * name;
   char * value;

   void Free()
   {
      delete name;
      delete value;
   }

   ~Argument()
   {
      Free();
   }
}

class Frame : struct
{
   Frame prev, next;
   int level;
   char * addr;
   char * func;
   int argsCount;
   OldList args;
   char * from;
   property char * from { set { delete from; if(value) from = CopyUnescapedUnixPath(value); } }
   char * file;
   property char * file { set { delete file; if(value) file = CopyUnescapedUnixPath(value); } }
   char * absoluteFile;
   int line;

   void Free()
   {
      delete addr;
      delete func;
      delete from;
      delete file;
      delete absoluteFile;
      args.Free(Argument::Free);
   }

   ~Frame()
   {
      Free();
   }
}

class GdbDataStop : struct
{
   char * reason;
   int threadid;
   union
   {
      struct
      {
         int bkptno;
      };
      struct
      {
         char * name;
         char * meaning;
      };
      struct
      {
         char * gdbResultVar;
         char * returnValue;
      };
   };
   Frame frame { };

   void Free()
   {
      if(reason)
      {
         if(!strcmp(reason, "signal-received"))
         {
            delete name;
            delete meaning;
         }
         else if(!strcmp(reason, "function-finished"))
         {
            delete gdbResultVar;
            delete returnValue;
         }
         delete reason;
      }
      if(frame) frame.Free();
   }

   ~GdbDataStop()
   {
      Free();
   }
}

class GdbDataBreakpoint : struct
{
   int number;
   char * type;
   char * disp;
   bool enabled;
   char * addr;
   char * func;
   char * file;
   property char * file { set { delete file; if(value) file = CopyUnescapedUnixPath(value); } }
   int line;
   char * at;
   int times;

   void Free()
   {
      delete type;
      delete disp;
      delete addr;
      delete func;
      delete file;
      delete at;
   }

   ~GdbDataBreakpoint()
   {
      Free();
   }
}

class Breakpoint : struct
{
   class_no_expansion;

   char * relativeFilePath;
   char * absoluteFilePath;
   int line;
   bool enabled;
   int hits;
   int breaks;
   int ignore;
   int level;
   Watch condition;
   bool inserted;
   BreakpointType type;
   DataRow row;
   
   GdbDataBreakpoint bp;

   char * LocationToString()
   {
      char location[MAX_LOCATION+20];
      snprintf(location, sizeof(location), "%s:%d", relativeFilePath, line);
      location[sizeof(location)-1] = 0;
#if defined(__WIN32__)
      ChangeCh(location, '/', '\\');
#endif
      return CopyString(location);
   }

   void Save(File f)
   {
      if(relativeFilePath && relativeFilePath[0])
      {
         f.Printf("    * %d,%d,%d,%d,%s\n", enabled ? 1 : 0, ignore, level, line, relativeFilePath);
         if(condition)
            f.Printf("       ~ %s\n", condition.expression);
      }
   }

   void Free()
   {
      if(bp)
         bp.Free();
      delete bp;
      delete relativeFilePath;
      delete absoluteFilePath;
   }

   ~Breakpoint()
   {
      Free();
   }

}

class Watch : struct
{
   class_no_expansion;
   
   Type type;
   char * expression;
   char * value;
   DataRow row;

   void Save(File f)
   {
      f.Printf("    ~ %s\n", expression);
   }

   void Free()
   {
      delete expression;
      delete value;
      FreeType(type);
      type = null;
   }

   void Reset()
   {
      delete value;
      FreeType(type);
      type = null;
   }

   ~Watch()
   {
      Free();
   }
}

class DebugListItem : struct
{
   char * name;
   char * value;
}

struct DebugEvaluationData
{
   bool active;
   char * result;
   int bytes;
   uint nextBlockAddress;

   DebuggerEvaluationError error;
};

class CodeLocation : struct
{
   char * file;
   char * absoluteFile;
   int line;

   CodeLocation ::ParseCodeLocation(char * location)
   {
      if(location)
      {
         char * colon = null;
         char * temp;
         char loc[MAX_LOCATION];
         strcpy(loc, location);
         for(temp = loc; temp = strstr(temp, ":"); temp++)
            colon = temp;
         if(colon)
         {
            colon[0] = '\0';
            colon++;
            if(colon)
            {
               int line = atoi(colon);
               if(line)
               {
                  CodeLocation codloc { line = line };
                  codloc.file = CopyString(loc);
                  codloc.absoluteFile = ide.workspace.GetAbsolutePathFromRelative(loc);
                  return codloc;
               }
            }
         }
      }
      return null;
   }

   void Free()
   {
      delete file;
      delete absoluteFile;
   }

   ~CodeLocation()
   {
      Free();
   }
}
