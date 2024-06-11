#ifdef ECERE_STATIC
public import static "ecere"
public import static "ec"
#else
public import "ecere"
public import "ec"
#endif

import "ide"
import "process"
import "debugFindCtx"
import "debugTools"
import "dpl.ec"

// Work around for lockups while step-debugging on Linux
define focusNotContinue = GetRuntimePlatform() == win32;

#ifdef _DEBUG
#define GDB_DEBUG_CONSOLE
#define _DPL_ON
#endif

extern char * strrchr(const char * s, int c);

#define uint _uint
#define strlen _strlen
#include <stdarg.h>
#include <unistd.h>
#include <string.h> // For memchr

#ifdef __APPLE__
#define __unix__
#endif

#if defined(__unix__)
#include <sys/stat.h>
#include <sys/time.h> // Required on Apple...
#endif
#undef uint
#undef strlen

#include <dpl.eh>
#ifdef _DPL_ON
// use =0 to disable printing of specific channels
static enum dplchan { none, gdbProtoIgnored=0/*1*/, gdbProtoUnknown=2, gdbOutput=3/*3*/, gdbCommand=4/*4*/, debuggerCall=0/*5*/, debuggerProblem=6,
                        debuggerUserAction=7,debuggerState=8, debuggerBreakpoints=9, debuggerWatches=0/*10*/, debuggerTemp=0 };
static const char * _dpct[] = {
   null,
   "GDB Protocol Ignored",
   "GDB Protocol ***Unknown***",
   "GDB Output",
   "GDB Command",
   ""/*Debugger Call*/,
   "Debugger ***Problem***",
   "Debugger::ChangeUserAction",
   "Debugger::ChangeState",
   "Breakpoints",
   "Watches",
   "-----> Temporary Message",
   null
};
#endif

public char * StripQuotes2(char * string, char * output)
{
   int c;
   int d = 0;
   bool quoted = false, escaped = false;
   char ch;
   for(c = 0; (ch = string[c]); c++)
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
   int j = 0, k = 0;
   char ch;
   while((ch = s[j]))
   {
      switch(ch)
      {
         case '\n': d[k] = '\\'; d[++k] = 'n'; break;
         case '\t': d[k] = '\\'; d[++k] = 't'; break;
         case '\a': d[k] = '\\'; d[++k] = 'a'; break;
         case '\b': d[k] = '\\'; d[++k] = 'b'; break;
         case '\f': d[k] = '\\'; d[++k] = 'f'; break;
         case '\r': d[k] = '\\'; d[++k] = 'r'; break;
         case '\v': d[k] = '\\'; d[++k] = 'v'; break;
         case '\\': d[k] = '\\'; d[++k] = '\\'; break;
         case '\"': d[k] = '\\'; d[++k] = '\"'; break;
         default: d[k] = s[j];
      }
      j++, k++;
   }
   d[k] = '\0';
}

/*static char * CopyUnescapedSystemPath(char * p)
{
   int len = strlen(p);
   char * d = new char[len + 1];
   UnescapeString(d, p, len);
#if defined(__WIN32__)
   ChangeCh(d, '/', '\\');
#endif
   return d;
}*/

static char * CopyUnescapedUnixPath(char * p)
{
   int len = strlen(p);
   char * d = new char[len + 1];
   UnescapeString(d, p, len);
#if defined(__WIN32__)
   ChangeCh(d, '\\', '/');
#endif
   return d;
}

static char * CopyUnescapedString(char * s)
{
   int len = strlen(s);
   char * d = new char[len + 1];
   UnescapeString(d, s, len);
   return d;
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

/*static int StringGetInt(char * string, int start)
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
}*/

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
      return true;
   }
   return false;
}

static bool CheckCommandAvailable(const char * command)
{
   bool available = false;
   int c, count;
   char * name = new char[MAX_FILENAME];
   char * pathVar = new char[maxPathLen];
   char * paths[128];
   GetEnvironment("PATH", pathVar, maxPathLen);
   count = TokenizeWith(pathVar, sizeof(paths) / sizeof(char *), paths, pathListSep, false);
   strcpy(name, command);
#ifdef __WIN32__
   {
      int e;
      const char * extensions[] = { "exe", "com", "bat", null };
      for(e=0; extensions[e]; e++)
      {
         ChangeExtension(name, extensions[e], name);
#endif
         for(c=0; c<count; c++)
         {
            FileListing fl { paths[c] };
            while(fl.Find())
            {
               if(fl.stats.attribs.isFile && !fstrcmp(fl.name, name))
               {
                  available = true;
                  fl.Stop();
                  break;
               }
            }
            if(available) break;
         }
#ifdef __WIN32__
         if(available) break;
      }
   }
#endif
   delete name;
   delete pathVar;
   return available;
}

// define GdbGetLineSize = 1638400;
define GdbGetLineSize = 5638400;
#if defined(__unix__)
char progFifoPath[MAX_LOCATION];
char progFifoDir[MAX_LOCATION];
#endif

enum DebuggerState { none, prompt, loaded, running, stopped, terminated, error };
enum DebuggerEvent
{
   none, hit, breakEvent, signal, stepEnd, functionEnd, exit, valgrindStartPause, locationReached;

   property bool canBeMonitored { get { return (this == hit || this == breakEvent || this == signal || this == stepEnd || this == functionEnd || this == locationReached); } };
};
enum DebuggerAction { none, internal, restart, stop, selectFrame, advance }; //, bpValidation
enum DebuggerReason
{
   unknown, endSteppingRange, functionFinished, signalReceived, breakpointHit, locationReached
   //watchpointTrigger, readWatchpointTrigger, accessWatchpointTrigger, watchpointScope,
   //exited, exitedNormally, exitedSignalled;
};
enum BreakpointType
{
   none, internalMain, internalWinMain, internalModulesLoaded, user, runToCursor, internalModuleLoad, internalEntry, debugBreakpoint;

   property bool isInternal { get { return (this == internalMain || this == internalWinMain || this == internalModulesLoaded || this == internalModuleLoad || this == internalEntry); } };
   property bool isUser { get { return (this == user || this == runToCursor || this == debugBreakpoint); } };
};
enum DebuggerEvaluationError { none, symbolNotFound, memoryCantBeRead, unknown };
enum DebuggerUserAction
{
   none, start, resume, _break, stop, restart, selectThread, selectFrame, stepInto, stepOver, stepUntil, stepOut, runToCursor;
   property bool breaksOnInternalBreakpoint { get { return (this == stepInto || this == stepOver || this == stepUntil); } };
};
enum GdbExecution
{
   none, run, _continue, next, until, advance, step, finish;
   property bool suspendInternalBreakpoints { get { return (this == until || this == advance || this == step || this == finish); } };
};

FileDialog debuggerFileDialog { type = selectDir };

static DualPipe vgTargetHandle;
static File vgLogFile;
static char vgLogPath[MAX_LOCATION];
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
   bool sentKill;
   bool sentBreakInsert;
   bool ignoreBreakpoints;
   bool signalOn;
   bool needReset;
   bool usingValgrind;

   int ideProcessId;
   int gdbProcessId;

   int activeFrameLevel;
   int activeThread;
   int hitThread;
   int signalThread;
   int frameCount;

   char * targetDir;
   char * targetFile;

   GdbExecution gdbExecution;
   DebuggerUserAction userAction;
   DebuggerState state;
   DebuggerEvent event;
   DebuggerAction breakType;
   char * breakString;
   //DebuggerCommand lastCommand;    // THE COMPILER COMPILES STUFF THAT DOES NOT EXIST???

   GdbDataStop stopItem;
   GdbDataBreakpoint bpItem;
   Frame activeFrame;

   List<Breakpoint> sysBPs { };
   Breakpoint bpRunToCursor;
   Breakpoint intBpEntry;
   Breakpoint intBpMain;
   Breakpoint intBpWinMain;

   OldList stackFrames;

   CompilerConfig currentCompiler;
   ProjectConfig prjConfig;
   int bitDepth;

   CodeEditor codeEditor;

   ValgrindLogThread vgLogThread { debugger = this };
   ValgrindTargetThread vgTargetThread { debugger = this };
   GdbThread gdbThread { debugger = this };

   bool entryPoint;
   Map<String, bool> projectsLibraryLoaded { };

   Time targetRunTime;
   Time targetLastStopTime;
   Time targetStoppedTime;

   Timer gdbTimer
   {
      delay = 0.0, userData = this;

      bool DelayExpired()
      {
         bool monitor = false;
         DebuggerEvent curEvent = event;
         GdbDataStop stopItem = this.stopItem;
         Breakpoint bpUser = null;
         Breakpoint bpInternal = null;

         if(!gdbReady)
            return false;

         event = none;
         if(this.stopItem)
         {
            this.stopItem = null;
#ifdef _DPL_ON
            {
               char * s = null;
               DynamicString bpReport { };

               for(bp : sysBPs; bp.inserted)
               {
                  bpReport.concatx(",", bp.type, "(", s=bp.CopyLocationString(false), ")");
                  delete s;
               }
               if(bpRunToCursor && bpRunToCursor.inserted)
               {
                  Breakpoint bp = bpRunToCursor;
                  bpReport.concatx(",", bp.type, "(", s=bp.CopyLocationString(false), ")");
                  delete s;
               }
               for(bp : ide.workspace.breakpoints; bp.inserted)
               {
                  bpReport.concatx(",", bp.type, "(", s=bp.CopyLocationString(false), ")");
                  delete s;
               }
               s = bpReport;
               _dpcl(_dpct, dplchan::debuggerBreakpoints, 0, "gdbTimer::DelayExpired: ", s+1);

               if(stopItem.bkptno)
               {
                  bool isInternal;
                  Breakpoint bp = GetBreakpointById(stopItem.bkptno, &isInternal);
                  if(bp)
                  {
                     _dpcl(_dpct, dplchan::debuggerBreakpoints, 0, "gdb stopped by a breakpoint: ", bp.type, "(", s=bp.CopyLocationString(false), ")");
                     delete s;
                  }
               }
               delete bpReport;
            }
#endif
         }
#ifdef _DPL_ON
         else
         {
            if(curEvent && curEvent != exit)
            {
               _dplf(0, "No stop item");
            }
         }
#endif
         switch(breakType)
         {
            case restart:
               breakType = none;
               Restart(currentCompiler, prjConfig, bitDepth, usingValgrind);
               break;
            case stop:
               breakType = none;
               Stop();
               break;
            case selectFrame:
            {
               breakType = none;
               GdbCommand(0, false, "-stack-select-frame %d", activeFrameLevel);
               for(activeFrame = stackFrames.first; activeFrame; activeFrame = activeFrame.next)
                  if(activeFrame.level == activeFrameLevel)
                     break;
               break;
            }
            //case bpValidation:
            //   breakType = none;
            //   GdbCommand(0, false, "-break-info %s", bpItem.number);
            //   break;
         }

         if(curEvent == none)
            return false;

         switch(curEvent)
         {
            case hit:
               {
                  bool isInternal;
                  Breakpoint bp = stopItem ? GetBreakpointById(stopItem.bkptno, &isInternal) : null;
                  if(bp && bp.inserted && bp.bp.addr)
                  {
                     if(bp.type.isInternal)
                        bpInternal = bp;
                     else
                        bpUser = bp;
                     if(bp.type == debugBreakpoint)
                        activeFrameLevel = 1;
                     if(stopItem && stopItem.frame)
                     {
                        if(bpInternal && bpRunToCursor && bpRunToCursor.inserted && !strcmp(bpRunToCursor.bp.addr, bp.bp.addr))
                           bpUser = bpRunToCursor;
                        else
                        {
                           for(item : (bpInternal ? ide.workspace.breakpoints : sysBPs); item.inserted)
                           {
                              if(item.bp && item.bp.addr && !strcmp(item.bp.addr, bp.bp.addr))
                              {
                                 if(bpInternal)
                                    bpUser = item;
                                 else
                                    bpInternal = item;
                                 break;
                              }
                           }
                        }
                     }
                     else
                        _dpcl(_dpct, dplchan::debuggerProblem, 0, "Invalid stopItem!");
                     if(bpUser && stopItem.frame.addr && strcmp(stopItem.frame.addr, bpUser.bp.addr))
                        _dpcl(_dpct, dplchan::debuggerProblem, 0, "Breakpoint bkptno(", stopItem.bkptno, ") address missmatch!");
                  }
                  else
                     _dpcl(_dpct, dplchan::debuggerProblem, 0, "Breakpoint bkptno(", stopItem.bkptno, ") invalid or not found!");
                  if((bpUser && !ignoreBreakpoints) || (bpInternal && userAction.breaksOnInternalBreakpoint))
                     monitor = true;
                  hitThread = stopItem.threadid;
               }
               break;
            case signal:
               signalThread = stopItem.threadid;
            case breakEvent:
            case stepEnd:
            case functionEnd:
            case locationReached:
               monitor = true;
               ignoreBreakpoints = false;
               break;
            case valgrindStartPause:
               GdbExecContinue(true);
               monitor = false;
               break;
            case exit:
               HideDebuggerViews();
               break;
         }

         if(curEvent == signal)
         {
            char * s = null;
            signalOn = true;
            ide.outputView.debugBox.Logf($"Signal received: %s - %s\n", stopItem.name, stopItem.meaning);
            ide.outputView.debugBox.Logf("    %s:%d\n", (s = CopySystemPath(stopItem.frame.file)), stopItem.frame.line);
            ide.outputView.Show();
            ide.callStackView.Show();
            delete s;
         }
         else if(curEvent == breakEvent)
         {
            ide.threadsView.Show();
            ide.callStackView.Show();
            ide.callStackView.Activate();
         }
         else if(curEvent == hit)
         {
            if(BreakpointHit(stopItem, bpInternal, bpUser))
            {
               ide.AdjustDebugMenus();
               if(bpUser && bpUser.type == runToCursor)
               {
                  ignoreBreakpoints = false;
                  UnsetBreakpoint(bpUser);
                  delete bpRunToCursor;
               }
            }
            else
            {
               if(breakType == advance && bpInternal && (bpInternal.type == internalMain || bpInternal.type == internalEntry))
               {
                  breakType = none;
                  GdbExecAdvance(breakString, 0);
                  delete breakString;
               }
               else
               {
                  GdbExecContinue(false);
                  monitor = false;
               }
            }
         }

         if(monitor && curEvent.canBeMonitored)
         {
            GdbGetStack();
            activeThread = stopItem.threadid;
            GdbCommand(0, false, "-thread-list-ids");
            InternalSelectFrame(activeFrameLevel);
            GoToStackFrameLine(activeFrameLevel, true, false);

            Process_UngrabPointer(targetProcessId);

            EvaluateWatches();
            ide.ShowCodeEditor();
            ide.AdjustDebugMenus();
            ideMainFrame.Activate();   // TOFIX: ide.Activate() is not reliable (app inactive)
            ide.Update(null);
         }

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

#ifdef _DPL_ON
#define _ChangeUserAction(value) ChangeUserAction(__FILE__, __LINE__, value)
   void ChangeUserAction(const char * file, int line, DebuggerUserAction value)
   {
#if 0
      bool same = value == userAction;
      __dpl(file, line, _dpct, dplchan::debuggerUserAction, 0, userAction, /*same ? " *** == *** " : */" -> ", value);
#endif
      userAction = value;
   }
#else
#define _ChangeUserAction(value) userAction = value
#endif

#ifdef _DPL_ON
#define _ChangeState(value) ChangeState(__FILE__, __LINE__, value)
   void ChangeState(const char * file, int line, DebuggerState value)
#else
#define _ChangeState(value) ChangeState(value)
   void ChangeState(DebuggerState value)
#endif
   {
      bool same = value == state;
#if 0 //def _DPL_ON
      __dpl(file, line, _dpct, dplchan::debuggerState, 0, state, same ? " *** == *** " : " -> ", value);
#endif
      if(value == stopped)
         targetLastStopTime = GetTime();
      state = value;
      if(!same) ide.AdjustDebugMenus();
   }

   void CleanUp()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::CleanUp");

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
      signalOn = false;

      activeFrameLevel = 0;
      activeThread = 0;
      hitThread = 0;
      signalThread = 0;
      frameCount = 0;

      targetDir = null;
      targetFile = null;

      _ChangeState(none);
      event = none;
      breakType = none;

      delete stopItem;
      delete bpItem;
      activeFrame = 0;

      bpRunToCursor = null;

      delete currentCompiler;
      prjConfig = null;

      WatchesReleaseCodeEditor();

      entryPoint = false;
      projectsLibraryLoaded.Free();

      /*GdbThread gdbThread
      Timer gdbTimer*/
   }

   Debugger()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::constructor");
      ideProcessId = Process_GetCurrentProcessId();

      sysBPs.Add((intBpEntry = Breakpoint { type = internalEntry, enabled = false, level = -1 }));
 #if defined(__linux__)
      sysBPs.Add((intBpMain = Breakpoint { type = internalMain, function = "_start", enabled = true, level = -1 }));
 #endif
      sysBPs.Add((intBpMain = Breakpoint { type = internalMain, function = "__main", enabled = true, level = -1 }));
      sysBPs.Add((intBpMain = Breakpoint { type = internalMain, function = "main", enabled = true, level = -1 }));
#if defined(__WIN32__)
      sysBPs.Add((intBpWinMain = Breakpoint { type = internalWinMain, function = "WinMain", enabled = true, level = -1 }));
#endif
      sysBPs.Add(Breakpoint { type = internalModulesLoaded, enabled = true, level = -1 });
      sysBPs.Add(Breakpoint { type = internalModuleLoad, function = "InternalModuleLoadBreakpoint", enabled = true, level = -1 });
      sysBPs.Add(Breakpoint { type = debugBreakpoint, function = "debugBreakpoint", enabled = true, level = -1 });
   }

   ~Debugger()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::destructor");
      sysBPs.Free();
      Stop();
      CleanUp();
   }

   // PUBLIC MEMBERS

   property bool isActive { get { return state == running || state == stopped; } }
   property bool isPrepared  { get { return state == loaded || state == running || state == stopped; } }

   void Resume()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::Resume");
      _ChangeUserAction(resume);
      GdbExecContinue(true);
   }

   void Break()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::Break");
      _ChangeUserAction(_break);
      if(state == running)
      {
         if(targetProcessId)
            GdbDebugBreak(false);
      }
   }

   void Stop()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::Stop");
      _ChangeUserAction(stop);
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
            HideDebuggerViews();
            GdbExit();
            break;
         case loaded:
            GdbExit();
            break;
      }
   }

   void Restart(CompilerConfig compiler, ProjectConfig config, int bitDepth, bool useValgrind)
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::Restart");
      _ChangeUserAction(restart);
      if(StartSession(compiler, config, bitDepth, useValgrind, true, false) == loaded)
         GdbExecRun();
   }

   bool GoToCodeLine(char * location)
   {
      CodeLocation codloc;
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GoToCodeLine(", location, ")");
      codloc = CodeLocation::ParseCodeLocation(location);
      if(codloc)
      {
         CodeEditor editor = (CodeEditor)ide.OpenFile(codloc.absoluteFile, false, true, null, no, normal, false);
         if(editor)
         {
            EditBox editBox = editor.editBox;
            if(editBox.GoToLineNum(codloc.line - 1))
               editBox.GoToPosition(editBox.line, codloc.line - 1, 0);
            return true;
         }
      }
      return false;
   }

   bool GoToStackFrameLine(int stackLevel, bool askForLocation, bool fromCallStack)
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GoToStackFrameLine(", stackLevel, ", ", askForLocation, ")");
      if(ide)
      {
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
            if(!fromCallStack)
               ide.callStackView.Show();

            if(frame.absoluteFile)
               editor = (CodeEditor)ide.OpenFile(frame.absoluteFile, false, true, null, no, normal, false);
            if(!editor && frame.file)
               frame.absoluteFile = ide.workspace.CopyAbsolutePathFromRelative(frame.file);
            if(!frame.absoluteFile && askForLocation && frame.file)
            {
               char * s = null;
               char title[MAX_LOCATION];
               snprintf(title, sizeof(title), $"Provide source file location for %s", (s = CopySystemPath(frame.file)));
               title[sizeof(title)-1] = 0;
               delete s;
               if(SourceDirDialog(title, ide.workspace.projectDir, frame.file, sourceDir))
               {
                  AddSourceDir(sourceDir);
                  frame.absoluteFile = ide.workspace.CopyAbsolutePathFromRelative(frame.file);
               }
            }
            if(!editor && frame.absoluteFile)
               editor = (CodeEditor)ide.OpenFile(frame.absoluteFile, false, true, null, no, normal, false);
            if(editor)
               ide.RepositionWindows(false);
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
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::SelectThread(", thread, ")");
      _ChangeUserAction(selectThread);
      if(state == stopped)
      {
         if(thread != activeThread)
         {
            activeFrameLevel = -1;
            ide.callStackView.Clear();
            GdbCommand(0, false, "-thread-select %d", thread);
            GdbGetStack();
            InternalSelectFrame(activeFrameLevel);
            GoToStackFrameLine(activeFrameLevel, true, false);
            EvaluateWatches();
            ide.Update(null);
         }
         ide.callStackView.Show();
      }
   }

   void SelectFrame(int frame)
   {
      //_dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::SelectFrame(", frame, ")");
      _ChangeUserAction(selectFrame);
      if(state == stopped)
      {
         if(frame != activeFrameLevel)
         {
            InternalSelectFrame(frame);
            EvaluateWatches();
            ide.Update(null);
         }
      }
   }

   void InternalSelectFrame(int frame)
   {
      //_dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::InternalSelectFrame(", frame, ")");
      activeFrameLevel = frame;  // there is no active frame number in the gdb reply
      GdbCommand(0, false, "-stack-select-frame %d", activeFrameLevel);
      for(activeFrame = stackFrames.first; activeFrame; activeFrame = activeFrame.next)
         if(activeFrame.level == activeFrameLevel)
            break;
   }

   void HandleExit(char * reason, char * code)
   {
      char verboseExitCode[128];
      Time targetExitTime = 0;
      if(targetRunTime)
         targetExitTime = GetTime();

      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::HandleExit(", reason, ", ", code, ")");
      _ChangeState(loaded); // this state change seems to be superfluous, might be in case of gdb crash
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
      if(!usingValgrind)
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
      if(targetRunTime)
         ide.outputView.debugBox.Logf($"It ran for %.1f seconds.\n", targetExitTime - targetRunTime - targetStoppedTime);
      ide.Update(null);
      targetRunTime = 0;
   }

   DebuggerState StartSession(CompilerConfig compiler, ProjectConfig config, int bitDepth, bool useValgrind, bool restart, bool ignoreBreakpoints)
   {
      DebuggerState result = none;
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::StartSession(restart(", restart, "), ignoreBreakpoints(", ignoreBreakpoints, ")");

#if !defined(__WIN32__) // To ungrab X pointer in Process_UngrabPointer()
      Execute("setxkbmap -option grab:break_actions");
#endif

      if(restart && state == running && targetProcessId)
      {
         breakType = DebuggerAction::restart;
         GdbDebugBreak(false);
      }
      else
      {
         if(restart && state == stopped)
            GdbAbortExec();
         if(needReset && state == loaded)
            GdbExit(); // this reset is to get a clean state with all the breakpoints until a better state can be maintained on program exit
         result = state;
         if(result == none || result == terminated)
         {
            ide.outputView.ShowClearSelectTab(debug);
            ide.outputView.debugBox.Logf($"Starting debug mode\n");

            for(bp : sysBPs)
            {
               bp.hits = 0;
               bp.breaks = 0;
            }
            for(bp : ide.workspace.breakpoints)
            {
               bp.hits = 0;
               bp.breaks = 0;
            }

            if(GdbInit(compiler, config, bitDepth, useValgrind))
               result = state;
            else
               result = error;
         }
         this.ignoreBreakpoints = ignoreBreakpoints;
      }
      return result;
   }

   void Start(CompilerConfig compiler, ProjectConfig config, int bitDepth, bool useValgrind)
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::Start()");
      _ChangeUserAction(start);
      if(StartSession(compiler, config, bitDepth, useValgrind, true, false) == loaded)
         GdbExecRun();
   }

   void StepInto(CompilerConfig compiler, ProjectConfig config, int bitDepth, bool useValgrind)
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::StepInto()");
      _ChangeUserAction(stepInto);
      switch(StartSession(compiler, config, bitDepth, useValgrind, false, false))
      {
         case loaded:  GdbExecRun();  break;
         case stopped: GdbExecStep(); break;
      }
   }

   void StepOver(CompilerConfig compiler, ProjectConfig config, int bitDepth, bool useValgrind, bool ignoreBreakpoints)
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::StepOver()");
      _ChangeUserAction(stepOver);
      switch(StartSession(compiler, config, bitDepth, useValgrind, false, ignoreBreakpoints))
      {
         case loaded:  GdbExecRun();  break;
         case stopped: GdbExecNext(); break;
      }
   }

   void StepUntil(CompilerConfig compiler, ProjectConfig config, int bitDepth, bool useValgrind, bool ignoreBreakpoints)
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::StepUntil()");
      _ChangeUserAction(stepUntil);
      switch(StartSession(compiler, config, bitDepth, useValgrind, false, ignoreBreakpoints))
      {
         case loaded:  GdbExecRun();          break;
         case stopped: GdbExecUntil(null, 0); break;
      }
   }

   void StepOut(bool ignoreBreakpoints)
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::StepOut()");
      _ChangeUserAction(stepOut);
      if(state == stopped)
      {
         this.ignoreBreakpoints = ignoreBreakpoints;
         if(frameCount > 1)
            GdbExecFinish();
         else
            GdbExecContinue(true);
      }
   }

   void RunToCursor(CompilerConfig compiler, ProjectConfig config, int bitDepth, bool useValgrind, const char * absoluteFilePath, int lineNumber, bool ignoreBreakpoints, bool atSameLevel, bool oldImplementation)
   {
      char relativeFilePath[MAX_LOCATION];
      const char * objectFileExt = compiler ? compiler.objectFileExt : objectDefaultFileExt;
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::RunToCursor()");
      _ChangeUserAction(runToCursor);
      ide.workspace.GetRelativePath(absoluteFilePath, relativeFilePath, null, objectFileExt);

      if(bpRunToCursor && bpRunToCursor.inserted && symbols)
      {
         UnsetBreakpoint(bpRunToCursor);
         delete bpRunToCursor;
      }

      StartSession(compiler, config, bitDepth, useValgrind, false, ignoreBreakpoints);

#if 0
      if(oldImplementation)
      {
         bpRunToCursor = Breakpoint { };
         bpRunToCursor.absoluteFilePath = absoluteFilePath;
         bpRunToCursor.relativeFilePath = relativeFilePath;
         bpRunToCursor.line = lineNumber;
         bpRunToCursor.type = runToCursor;
         bpRunToCursor.enabled = true;
         bpRunToCursor.level = atSameLevel ? frameCount - activeFrameLevel -1 : -1;
      }
#endif
      if(state == loaded)
      {
         breakType = advance;
         breakString = PrintString(relativeFilePath, ":", lineNumber);
         GdbExecRun();
      }
      else if(state == stopped)
      {
         if(oldImplementation)
            GdbExecContinue(true);
         else
         {
            if(atSameLevel)
               GdbExecUntil(absoluteFilePath, lineNumber);
            else
               GdbExecAdvance(absoluteFilePath, lineNumber);
         }
      }
   }

   void GetCallStackCursorLine(bool * error, int * lineCursor, int * lineTopFrame)
   {
      //_dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GetCallStackCursorLine()");
      if(activeFrameLevel == -1)
      {
         *error = false;
         *lineCursor = 0;
         *lineTopFrame = 0;
      }
      else
      {
         *error = signalOn && activeThread == signalThread;
         *lineCursor = activeFrameLevel - ((frameCount > 192 && activeFrameLevel > 191) ? frameCount - 192 - 1 : 0) + 1;
         *lineTopFrame = activeFrameLevel ? 1 : 0;
      }
   }

   int GetMarginIconsLineNumbers(const char * fileName, int lines[], bool enabled[], int max, bool * error, int * lineCursor, int * lineTopFrame)
   {
      char winFilePath[MAX_LOCATION];
      char * absoluteFilePath = GetSlashPathBuffer(winFilePath, fileName);
      int count = 0;
      Iterator<Breakpoint> it { ide.workspace.breakpoints };
      //_dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GetMarginIconsLineNumbers()");
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
      Watch wh = (Watch)(intptr)row.tag;
      //_dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::ChangeWatch(", expression, ")");
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
         row.tag = (int64)(intptr)wh;
         ide.workspace.watches.Add(wh);
         wh.row = row;
         wh.expression = CopyString(expression);
      }
      ide.workspace.Save();
      //if(expression && state == stopped)
      if(expression)
         ResolveWatch(wh);
   }

   void MoveIcons(const char * fileName, int lineNumber, int move, bool start)
   {
      char winFilePath[MAX_LOCATION];
      const char * absoluteFilePath = GetSlashPathBuffer(winFilePath, fileName);

      Link bpLink, next;
      //_dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::MoveIcons()");
      if(ide.workspace.breakpoints)
      {
         for(bpLink = ide.workspace.breakpoints.first; bpLink; bpLink = next)
         {
            Breakpoint bp = (Breakpoint)(intptr)bpLink.data;
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
      }

      // moving code cursors is futile, on next step, stop, hit, cursors will be offset anyways
   }

   bool SourceDirDialog(const char * title, const char * startDir, const char * test, char * sourceDir)
   {
      bool result;
      String srcDir = null;

      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::SourceDirDialog()");
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

   void AddSourceDir(const char * sourceDir)
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::AddSourceDir(", sourceDir, ")");
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
               GdbCommand(0, false, "-environment-directory \"%s\"", sourceDir);
               break;
         }
         if(oldState == running)
            GdbExecContinue(false);
      }
   }

   void ToggleBreakpoint(const char * fileName, int lineNumber)
   {
      char absolutePath[MAX_LOCATION];
      Breakpoint bp = null;

      GetSlashPathBuffer(absolutePath, fileName);
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
         Project owner;
         char relativePath[MAX_LOCATION];
         const char * objectFileExt = currentCompiler ? currentCompiler.objectFileExt : objectDefaultFileExt;

         ide.workspace.GetRelativePath(absolutePath, relativePath, &owner, objectFileExt);

         if(!owner && !FileExists(absolutePath))
         {
            char title[MAX_LOCATION];
            char directory[MAX_LOCATION];
            char sourceDir[MAX_LOCATION];
            StripLastDirectory(absolutePath, directory);
            snprintf(title, sizeof(title), $"Provide source files location directory for %s", relativePath);
            title[sizeof(title)-1] = 0;
            while(true)
            {
               String srcDir = null;
               for(dir : ide.workspace.sourceDirs)
               {
                  if(IsPathInsideOf(absolutePath, dir))
                  {
                     MakePathRelative(absolutePath, dir, relativePath);
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
                     MakePathRelative(absolutePath, sourceDir, relativePath);
                     break;
                  }
                  else if(MessageBox { type = yesNo, master = ide,
                                 contents = $"You must provide a valid source directory in order to place a breakpoint in this file.\nWould you like to try again?",
                                 text = $"Invalid Source Directory" }.Modal() == no)
                     return;
               }
               else
                  return;
            }
         }
         ide.workspace.bpCount++;
         bp = { line = lineNumber, type = user, enabled = true, level = -1, project = owner };
         ide.workspace.breakpoints.Add(bp);
         bp.absoluteFilePath = absolutePath;
         bp.relativeFilePath = relativePath;
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
               if(!SetBreakpoint(bp, false))
                  SetBreakpoint(bp, true);
               break;
         }
         if(oldState == running)
            GdbExecContinue(false);
      }

      ide.workspace.Save();
   }

   void UpdateRemovedBreakpoint(Breakpoint bp)
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::UpdateRemovedBreakpoint()");
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
               UnsetBreakpoint(bp);
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

      //_dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::ParseFrame()");
      TokenizeList(string, ',', frameTokens);
      for(i = 0; i < frameTokens.count; i++)
      {
         if(TokenizeListItem(frameTokens[i], item))
         {
            StripQuotes(item.value, item.value);
            if(!strcmp(item.name, "level"))
               frame.level = atoi(item.value);
            else if(!strcmp(item.name, "addr"))
               frame.addr = item.value;
            else if(!strcmp(item.name, "func"))
               frame.func = item.value;
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
                              arg.name = item.value;
                           }
                           else if(!strcmp(item.name, "value"))
                           {
                              StripQuotes(item.value, item.value);
                              arg.val = item.value;
                           }
                           else
                              _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, "frame args item (", item.name, "=", item.value, ") is unheard of");
                        }
                        else
                           _dplf(0, "Bad frame args item");
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
               frame.file = item.value;
            else if(!strcmp(item.name, "line"))
               frame.line = atoi(item.value);
            else if(!strcmp(item.name, "fullname"))
            {
               // GDB 6.3 on OS X is giving "fullname" and "dir", all in absolute, but file name only in 'file'
               Workspace ws = ide.workspace;
               if(ws)
               {
                  String path = ide.workspace.CopyUnixPathWorkspaceRelativeOrAbsolute(item.value);
                  if(strcmp(frame.file, path))
                     frame.file = path;
                  delete path;
               }
               frame.absoluteFile = item.value;
            }
            else
               _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, "frame member (", item.name, "=", item.value, ") is unheard of");
         }
         else
            _dplf(0, "Bad frame");
      }

      delete frameTokens;
      delete argsTokens;
      delete argumentTokens;
      delete item;
   }

   Breakpoint GetBreakpointById(int id, bool * isInternal)
   {
      Breakpoint bp = null;
      //_dpcl(_dpct, dplchan::debuggerBreakpoints, 0, "Debugger::GetBreakpointById(", id, ")");
      if(isInternal)
         *isInternal = false;
      if(id)
      {
         for(i : sysBPs; i.bp && i.bp.id == id)
         {
            if(isInternal)
               *isInternal = true;
            bp = i;
            break;
         }
         if(!bp && bpRunToCursor && bpRunToCursor.bp && bpRunToCursor.bp.id == id)
            bp = bpRunToCursor;
         if(!bp)
         {
            for(i : ide.workspace.breakpoints; i.bp && i.bp.id == id)
            {
               bp = i;
               break;
            }
         }
      }
      return bp;
   }

   GdbDataBreakpoint ParseBreakpoint(char * string, Array<char *> outTokens)
   {
      int i;
      GdbDataBreakpoint bp { };
      DebugListItem item { };
      Array<char *> bpTokens { minAllocSize = 16 };
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::ParseBreakpoint()");
      string = StripCurlies(string);
      TokenizeList(string, ',', bpTokens);
      for(i = 0; i < bpTokens.count; i++)
      {
         if(TokenizeListItem(bpTokens[i], item))
         {
            StripQuotes(item.value, item.value);
            if(!strcmp(item.name, "number"))
            {
               if(!strchr(item.value, '.'))
                  bp.id = atoi(item.value);
               bp.number = item.value;
            }
            else if(!strcmp(item.name, "type"))
               bp.type = item.value;
            else if(!strcmp(item.name, "disp"))
               bp.disp = item.value;
            else if(!strcmp(item.name, "enabled"))
               bp.enabled = (!strcmpi(item.value, "y"));
            else if(!strcmp(item.name, "addr"))
            {
               if(outTokens && !strcmp(item.value, "<MULTIPLE>"))
               {
                  int c = 1;
                  Array<GdbDataBreakpoint> bpArray = bp.multipleBPs = { };
                  while(outTokens.count > ++c)
                  {
                     GdbDataBreakpoint multBp = ParseBreakpoint(outTokens[c], null);
                     bpArray.Add(multBp);
                  }
               }
               else
                  bp.addr = item.value;
            }
            else if(!strcmp(item.name, "func"))
               bp.func = item.value;
            else if(!strcmp(item.name, "file"))
               bp.file = item.value;
            else if(!strcmp(item.name, "fullname"))
               bp.fullname = item.value;
            else if(!strcmp(item.name, "line"))
               bp.line = atoi(item.value);
            else if(!strcmp(item.name, "at"))
               bp.at = item.value;
            else if(!strcmp(item.name, "times"))
               bp.times = atoi(item.value);
            else if(!strcmp(item.name, "original-location") || !strcmp(item.name, "thread-groups"))
               _dpcl(_dpct, dplchan::gdbProtoIgnored, 0, "breakpoint member (", item.name, "=", item.value, ") is ignored");
            else
               _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, "breakpoint member (", item.name, "=", item.value, ") is unheard of");
         }
      }
      delete bpTokens;
      delete item;
      return bp;
   }

   void ShowDebuggerViews()
   {
      //_dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::ShowDebuggerViews()");
      ide.outputView.Show();
      ide.outputView.SelectTab(debug);
      ide.threadsView.Show();
      ide.callStackView.Show();
      ide.watchesView.Show();
      ide.Update(null);
   }

   void HideDebuggerViews()
   {
      //_dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::HideDebuggerViews()");
      ide.RepositionWindows(true);
   }

   bool ::GdbCommand(Time timeOut, bool focus, const char * format, ...)
   {
      bool result = false;
      if(gdbHandle)
      {
         Time startTime;
         // TODO: Improve this limit
         static char string[MAX_F_STRING*4];
         va_list args;
         va_start(args, format);
         vsnprintf(string, sizeof(string), format, args);
         string[sizeof(string)-1] = 0;
         va_end(args);

         gdbReady = false;
         ide.debugger.serialSemaphore.TryWait();

#ifdef GDB_DEBUG_CONSOLE
         _dpcl(_dpct, dplchan::gdbCommand, 0, string);
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

         if(timeOut)
         {
            startTime = GetTime();
            while(true)
            {
               if(ide.debugger.serialSemaphore.TryWait())
               {
                  result = true;
                  break;
               }
               else
               {
                  if(GetTime() - startTime > timeOut)
                     break;
                  Sleep(0.01);
               }
            }
         }
         else
         {
            ide.debugger.serialSemaphore.Wait();
            result = true;
         }

         app.Lock();
      }
      return result;
   }

   bool ValidateBreakpoint(Breakpoint bp)
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::ValidateBreakpoint()");
      if(modules && bp.line && bp.bp)
      {
         if(bp.bp.line != bp.line)
         {
            if(!bp.bp.line)
            {
#ifdef _DEBUG
               //here
               ide.outputView.debugBox.Logf("WOULD HAVE -- Invalid breakpoint disabled: %s:%d\n", bp.relativeFilePath, bp.line);
#endif
               //UnsetBreakpoint(bp);
               //bp.enabled = false;
               return false;
            }
            else
            {
               //here
               ide.outputView.debugBox.Logf("Debugger Error: ValidateBreakpoint error\n");
               bp.line = bp.bp.line;
            }
         }
      }
      return true;
   }

   void BreakpointsMaintenance()
   {
      //_dpcl(_dpct, dplchan::debuggerBreakpoints, 0, "Debugger::BreakpointsMaintenance()");
      if(symbols)
      {
         if(gdbExecution.suspendInternalBreakpoints)
         {
            for(bp : sysBPs; bp.inserted)
               UnsetBreakpoint(bp);
         }
         else
         {
            DirExpression objDir = ide.project.GetObjDir(currentCompiler, prjConfig, bitDepth);
            for(bp : sysBPs; !bp.inserted)
            {
               bool insert = false;
               if(bp.type == internalModulesLoaded)
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
                           moduleLoadLine =
                              !strncmp(line, "eModule_Load", strlen("eModule_Load")) ||
                              !strncmp(line, "if(!eModule_Load", strlen("if(!eModule_Load"));
                           if(!moduleLoadBlock && moduleLoadLine)
                              moduleLoadBlock = true;
                           else if(moduleLoadBlock && !moduleLoadLine && strlen(line) > 0 && strncmp(line, "printf", strlen("printf")))
                              break;
                        }
                     }
                     if(!f.Eof())
                     {
                        char relative[MAX_LOCATION];
                        bp.absoluteFilePath = path;
                        MakePathRelative(path, ide.workspace.projectDir, relative);
                        bp.relativeFilePath = relative;
                        bp.line = lineNumber;
                        insert = true;
                     }
                     delete f;
                  }
               }
               else if(bp.type == internalModuleLoad)
               {
                  if(modules)
                  {
                     for(prj : ide.workspace.projects)
                     {
                        if(!strcmp(prj.moduleName, "ecere"))
                        {
                           ProjectNode node = prj.topNode.Find("instance.c", false);
                           if(node)
                           {
                              char path[MAX_LOCATION];
                              char relative[MAX_LOCATION];
                              node.GetFullFilePath(path, true, true);
                              bp.absoluteFilePath = path;
                              MakePathRelative(path, prj.topNode.path, relative);
                              bp.relativeFilePath = relative;
                              insert = true;
                              break;
                           }
                        }
                     }
                  }
               }
               else
                  insert = true;
               if(insert)
               {
                  if(!SetBreakpoint(bp, false))
                     SetBreakpoint(bp, true);
               }
            }
            delete objDir;
         }

         if(userAction != runToCursor && bpRunToCursor && bpRunToCursor.inserted)
            UnsetBreakpoint(bpRunToCursor);
         if(bpRunToCursor && !bpRunToCursor.inserted)
         {
            if(!SetBreakpoint(bpRunToCursor, false))
               SetBreakpoint(bpRunToCursor, true);
         }

         if(ignoreBreakpoints)
         {
            for(bp : ide.workspace.breakpoints; bp.inserted)
               UnsetBreakpoint(bp);
         }
         else
         {
            for(bp : ide.workspace.breakpoints; !bp.inserted && bp.type == user)
            {
               if(bp.enabled)
               {
                  if(!SetBreakpoint(bp, false))
                     SetBreakpoint(bp, true);
               }
               else
               {
#ifdef _DEBUG
                  if(bp.bp)
                     _dplf(0, "problem");
#endif
                  delete bp.bp;
                  bp.bp = GdbDataBreakpoint { };
               }
            }
         }
      }
   }

   void UnsetBreakpoint(Breakpoint bp)
   {
      char * s = null; _dpcl(_dpct, dplchan::debuggerBreakpoints, 0, "Debugger::UnsetBreakpoint(", s=bp.CopyLocationString(false), ") -- ", bp.type); delete s;
      if(symbols && bp.inserted)
      {
         GdbCommand(0, false, "-break-delete %s", bp.bp.number);
         bp.inserted = false;
         delete bp.bp;
         bp.bp = { };
      }
   }

   bool SetBreakpoint(Breakpoint bp, bool removePath)
   {
      char * s = null; _dpcl(_dpct, dplchan::debuggerBreakpoints, 0, "Debugger::SetBreakpoint(", s=bp.CopyLocationString(false), ", ", removePath ? "**** removePath(true) ****" : "", ") -- ", bp.type); delete s;
      breakpointError = false;
      if(symbols && bp.enabled && (!bp.project || bp.project.GetTargetType(bp.project.config) == staticLibrary || bp.project == ide.project || projectsLibraryLoaded[bp.project.name]))
      {
         sentBreakInsert = true;
         if(bp.address)
            GdbCommand(0, false, "-break-insert *%s", bp.address);
         else
         {
            char * location = bp.CopyLocationString(removePath);
            GdbCommand(0, false, "-break-insert %s", location);
            delete location;
         }
         if(!breakpointError)
         {
            char * address = null;
            if(bpItem && bpItem.multipleBPs && bpItem.multipleBPs.count)
            {
               int count = 0;
               GdbDataBreakpoint first = null;
               for(n : bpItem.multipleBPs)
               {
                  if(bp.absoluteFilePath && !fstrcmp(n.fullname, bp.absoluteFilePath) && !first)
                  {
                     count++;
                     first = n;
                     //break;
                  }
                  /*else
                  {
                     if(n.enabled)
                     {
                        GdbCommand(0, false, "-break-disable %s", n.number);
                        n.enabled = false;
                     }
                     else
                        _dpcl(_dpct, dplchan::debuggerProblem, 0, "Debugger::SetBreakpoint -- error breakpoint already disabled.");
                  }*/
               }
               if(first)
               {
                  //address = CopyString(first.addr);
                  bpItem.addr = first.addr;
                  bpItem.func = first.func;
                  bpItem.file = first.file;
                  bpItem.fullname = first.fullname;
                  bpItem.line = first.line;
                  //bpItem.thread-groups = first.thread-groups;*/
               }
               else if(count == 0)
                  _dpcl(_dpct, dplchan::debuggerProblem, 0, "Debugger::SetBreakpoint -- error multiple breakpoints all disabled.");
               else
                  _dpcl(_dpct, dplchan::debuggerProblem, 0, "Debugger::SetBreakpoint -- error multiple breakpoints in exact same file not supported.");
               bpItem.multipleBPs.Free();
               delete bpItem.multipleBPs;
            }
            delete bp.bp;
            bp.bp = bpItem;
            bpItem = null;
            bp.inserted = (bp.bp && bp.bp.number && strcmp(bp.bp.number, "0"));
            if(bp.inserted)
               ValidateBreakpoint(bp);

            if(address)
            {
               //UnsetBreakpoint(bp);
               bp.address = address;
               delete address;
               SetBreakpoint(bp, removePath);
            }
         }
         return !breakpointError;
      }
      return false;
   }

   void GdbGetStack()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbGetStack()");
      activeFrame = null;
      stackFrames.Free(Frame::Free);
      GdbCommand(0, false, "-stack-info-depth");
      if(!frameCount)
         GdbCommand(0, false, "-stack-info-depth 192");
      if(frameCount && frameCount <= 192)
         GdbCommand(0, false, "-stack-list-frames 0 %d", Min(frameCount-1, 191));
      else
      {
         GdbCommand(0, false, "-stack-list-frames 0 %d", Min(frameCount-1, 95));
         GdbCommand(0, false, "-stack-list-frames %d %d", Max(frameCount - 96, 96), frameCount - 1);
      }
      GdbCommand(0, false, "");
   }

   bool GdbTargetSet()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbTargetSet()");
      if(!targeted)
      {
         char escaped[MAX_LOCATION];
         strescpy(escaped, targetFile);
         GdbCommand(0, false, "file \"%s\"", escaped); //GDB/MI Missing Implementation in 5.1.1 but we now have -file-exec-and-symbols / -file-exec-file / -file-symbol-file

         if(!symbols)
            return true;

         if(usingValgrind)
         {
            const char *vgdbCommand = "/usr/bin/vgdb"; // TODO: vgdb command config option
            //GdbCommand(0, false, "-target-select remote | %s --pid=%d", "vgdb", targetProcessId);
            printf("target remote | %s --pid=%d\n", vgdbCommand, targetProcessId);
            GdbCommand(0, false, "target remote | %s --pid=%d", vgdbCommand, targetProcessId); // TODO: vgdb command config option
         }
         else
            GdbCommand(0, false, "info target"); //GDB/MI Missing Implementation -file-list-symbol-files and -file-list-exec-sections

         /*for(prj : ide.workspace.projects; prj != ide.workspace.projects.firstIterator.data)
            GdbCommand(0, false, "-environment-directory \"%s\"", prj.topNode.path);*/

         for(dir : ide.workspace.sourceDirs; dir && dir[0])
         {
           bool interference = false;
           for(prj : ide.workspace.projects)
           {
              if(!fstrcmp(prj.topNode.path, dir))
              {
                 interference = true;
                 break;
              }
           }
           if(!interference && dir[0])
              GdbCommand(0, false, "-environment-directory \"%s\"", dir);
         }

         targeted = true;
      }
      return true;
   }

   /*void GdbTargetRelease()
   {
      if(targeted)
      {
         BreakpointsDeleteAll();
         GdbCommand(0, false, "file");  //GDB/MI Missing Implementation -target-detach
         targeted = false;
         symbols = true;
      }
   }*/

   void GdbDebugBreak(bool internal)
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbDebugBreak()");
      if(targetProcessId)
      {
         if(internal)
            breakType = DebuggerAction::internal;

         if(ide) ide.Update(null);
         app.Unlock();
         if(Process_Break(targetProcessId))  //GdbCommand(0, false, "-exec-interrupt");
            serialSemaphore.Wait();
         else
         {
            _ChangeState(loaded);
            targetProcessId = 0;
         }
         app.Lock();
      }
      else
         ide.outputView.debugBox.Logf("Debugger Error: GdbDebugBreak with not target id should never happen\n");
   }

   void GdbExecRun()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbExecRun()");
      GdbTargetSet();
      if(!usingValgrind)
         gdbExecution = run;
      ShowDebuggerViews();
      GdbExecCommon();
      if(usingValgrind)
         GdbExecContinue(true);
      else if(!GdbCommand(3, true, "-exec-run"))
         gdbExecution = none;
   }

   void GdbExecContinue(bool focus)
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbExecContinue()");
      gdbExecution = run;
      GdbExecCommon();
      GdbCommand(0, focus, "-exec-continue");
   }

   void GdbExecNext()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbExecNext()");
      gdbExecution = next;
      GdbExecCommon();
      GdbCommand(0, focusNotContinue, "-exec-next");
   }

   void ForceUpdateCurrentFrame()
   {
      GdbGetStack();
      GdbCommand(0, false, "-thread-list-ids");
      InternalSelectFrame(activeFrameLevel);
      GoToStackFrameLine(activeFrameLevel, true, false);
      EvaluateWatches();
      ide.ShowCodeEditor();
      ide.AdjustDebugMenus();
      ideMainFrame.Activate();   // TOFIX: ide.Activate() is not reliable (app inactive)
      ide.Update(null);
   }

   void GdbExecUntil(const char * absoluteFilePath, int lineNumber)
   {
      bool forceUpdate = false;
      char relativeFilePath[MAX_LOCATION];
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbExecUntil()");
      gdbExecution = until;
      GdbExecCommon();
      if(absoluteFilePath)
      {
         const char * objectFileExt = currentCompiler ? currentCompiler.objectFileExt : objectDefaultFileExt;
         ide.workspace.GetRelativePath(absoluteFilePath, relativeFilePath, null, objectFileExt);
         if(!GdbCommand(0.1, focusNotContinue, "-exec-until %s:%d", relativeFilePath, lineNumber))
         {
            GetLastDirectory(relativeFilePath, relativeFilePath);
            if(GdbCommand(1, focusNotContinue, "-exec-until %s:%d", relativeFilePath, lineNumber))
               forceUpdate = true;
         }
      }
      else
         GdbCommand(0, focusNotContinue, "-exec-until");

      // This is to handle GDB 6.3 on OS X not giving us *running then *stopped:
      // (It may not be ideal, we may need to wait?)
      if(forceUpdate)
         ForceUpdateCurrentFrame();
   }

   void GdbExecAdvance(const char * absoluteFilePathOrLocation, int lineNumber)
   {
      bool forceUpdate = false;
      char relativeFilePath[MAX_LOCATION];
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbExecAdvance()");
      gdbExecution = advance;
      GdbExecCommon();
      if(lineNumber)
      {
         const char * objectFileExt = currentCompiler ? currentCompiler.objectFileExt : objectDefaultFileExt;
         ide.workspace.GetRelativePath(absoluteFilePathOrLocation, relativeFilePath, null, objectFileExt);
         if(!GdbCommand(0.1, focusNotContinue, "advance %s:%d", relativeFilePath, lineNumber)) // should use -exec-advance -- GDB/MI implementation missing
         {
            GetLastDirectory(relativeFilePath, relativeFilePath);
            if(GdbCommand(1, focusNotContinue, "advance %s:%d", relativeFilePath, lineNumber))
               forceUpdate = true;
         }
      }
      else
      {
         if(!GdbCommand(0.1, focusNotContinue, "advance %s", absoluteFilePathOrLocation)) // should use -exec-advance -- GDB/MI implementation missing
         {
            GetLastDirectory(absoluteFilePathOrLocation, relativeFilePath);
            if(GdbCommand(1, focusNotContinue, "advance %s", relativeFilePath))
               forceUpdate = true;
         }
      }

      // This is to handle GDB 6.3 on OS X not giving us *running then *stopped:
      // (It may not be ideal, we may need to wait?)
      if(forceUpdate)
         ForceUpdateCurrentFrame();
   }

   void GdbExecStep()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbExecStep()");
      gdbExecution = step;
      GdbExecCommon();
      GdbCommand(0, focusNotContinue, "-exec-step");
   }

   void GdbExecFinish()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbExecFinish()");
      gdbExecution = finish;
      GdbExecCommon();
      GdbCommand(0, focusNotContinue, "-exec-finish");
   }

   void GdbExecCommon()
   {
      //_dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbExecCommon()");
      BreakpointsMaintenance();

      if(!targetRunTime)
      {
         targetRunTime = GetTime();
         targetStoppedTime = 0;
      }
      if(targetLastStopTime)
      {
         Time now = GetTime();
         targetStoppedTime = targetStoppedTime + (now - targetLastStopTime);
         targetLastStopTime = 0;
      }
   }

#ifdef GDB_DEBUG_GUI
   void SendGDBCommand(const char * command)
   {
      //_dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::SendGDBCommand()");
      DebuggerState oldState = state;
      switch(state)
      {
         case running:
            if(targetProcessId)
               GdbDebugBreak(true);
         case stopped:
         case loaded:
            GdbCommand(0, false, command);
            break;
      }
      if(oldState == running)
         GdbExecContinue(false);
   }
#endif

   void ClearBreakDisplay()
   {
      //_dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::ClearBreakDisplay()");
      activeThread = 0;
      activeFrameLevel = -1;
      hitThread = 0;
      signalThread = 0;
      signalOn = false;
      frameCount = 0;
      if(stopItem)
         stopItem.Free();
      delete stopItem;
      event = none;
      activeFrame = null;
      stackFrames.Free(Frame::Free);
      ide.callStackView.Clear();
      ide.threadsView.Clear();
      ide.Update(null);
   }

   bool GdbAbortExec()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbAbortExec()");
      sentKill = true;
      GdbCommand(0, false, "-interpreter-exec console \"kill\""); // should use -exec-abort -- GDB/MI implementation incomplete
      return true;
   }

   bool GdbInit(CompilerConfig compiler, ProjectConfig config, int bitDepth, bool useValgrind)
   {
      bool result = true;
      char oldDirectory[MAX_LOCATION];
      char tempPath[MAX_LOCATION];
      char command[MAX_F_STRING*4];
      Project project = ide.project;
      DirExpression targetDirExp = project.GetTargetDir(compiler, config, bitDepth);
      PathBackup pathBackup { };
      Map<String, String> envBackup { };

      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbInit()");
      if(currentCompiler != compiler)
      {
         delete currentCompiler;
         currentCompiler = compiler;
         incref currentCompiler;
      }
      prjConfig = config;
      this.bitDepth = bitDepth;
      usingValgrind = useValgrind;

      _ChangeState(loaded);
      sentKill = false;
      sentBreakInsert = false;
      breakpointError = false;
      ignoreBreakpoints = false;
      symbols = true;
      targeted = false;
      modules = false;
      needReset = false;
      entryPoint = false;
      projectsLibraryLoaded.Free();

      ide.outputView.ShowClearSelectTab(debug);
      ide.outputView.debugBox.Logf($"Starting debug mode\n");

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

      ide.SetPath(true, compiler, config, bitDepth);

      // TODO: This pollutes the environment, but at least it works
      // It shouldn't really affect the IDE as the PATH gets restored and other variables set for testing will unlikely cause problems
      // What is the proper solution for this? DualPipeOpenEnv?
      // gdb set environment commands don't seem to take effect
      for(e : ide.workspace.environmentVars)
      {
         // Backing up the environment variables until we use DualPipeOpenEnv()
         envBackup[e.name] = CopyString(getenv(e.name));
         SetEnvironment(e.name, e.string);
      }

      if(usingValgrind)
      {
         char * clArgs = ide.workspace.commandLineArgs;
         const char *valgrindCommand = "valgrind"; // TODO: valgrind command config option //TODO: valgrind options
         ValgrindLeakCheck vgLeakCheck = ide.workspace.vgLeakCheck;
         int vgRedzoneSize = ide.workspace.vgRedzoneSize;
         bool vgTrackOrigins = ide.workspace.vgTrackOrigins;
         vgLogFile = CreateTemporaryFile(vgLogPath, "ecereidevglog");
         if(vgLogFile)
         {
            incref vgLogFile;
            vgLogThread.Create();
         }
         else
         {
            ide.outputView.debugBox.Logf($"Debugger Fatal Error: Couldn't open temporary log file for Valgrind output\n");
            result = false;
         }
         if(result && !CheckCommandAvailable(valgrindCommand))
         {
            ide.outputView.debugBox.Logf($"Debugger Fatal Error: Command %s for Valgrind is not available.\n", valgrindCommand);
            result = false;
         }
         if(result)
         {
            char * vgRedzoneSizeFlag = PrintString(" --redzone-size=", vgRedzoneSize);
            sprintf(command, "%s --vgdb=yes --vgdb-error=0 --log-file=%s --leak-check=%s%s --track-origins=%s %s%s%s",
                  valgrindCommand, vgLogPath, (char*)vgLeakCheck, vgRedzoneSize > -1 ? vgRedzoneSizeFlag : "", vgTrackOrigins ? "yes" : "no", targetFile, clArgs ? " " : "", clArgs ? clArgs : "");
            delete vgRedzoneSizeFlag;
            vgTargetHandle = DualPipeOpen(PipeOpenMode { output = true, /*error = true, */input = true }, command);
            if(!vgTargetHandle)
            {
               ide.outputView.debugBox.Logf($"Debugger Fatal Error: Couldn't start Valgrind\n");
               result = false;
            }
         }
         if(result)
         {
            incref vgTargetHandle;
            vgTargetThread.Create();

            targetProcessId = vgTargetHandle.GetProcessID();
            waitingForPID = false;
            if(!targetProcessId)
            {
               ide.outputView.debugBox.Logf($"Debugger Fatal Error: Couldn't get Valgrind process ID\n");
               result = false;
            }
         }
         if(result)
         {
            app.Unlock();
            serialSemaphore.Wait();
            app.Lock();
         }
      }

      if(result)
      {
         if(compiler.targetPlatform == win32)
         {
            strcpy(command,
#if !((defined(__WORDSIZE) && __WORDSIZE == 8) || defined(__x86_64__))
               1 ||
#endif
               bitDepth == 32 ? "i686-w64-mingw32-gdb" : "gdb");  // x86_64-w64-mingw32-gdb
         }
         else
            // We really should have a box to select GDB in the compiler/toolchain options
            strcpy(command, "gdb");
         if(!CheckCommandAvailable(command))
         {
            ide.outputView.debugBox.Logf($"Debugger Fatal Error: Command %s for GDB is not available.\n", command);
            result = false;
         }
         else
         {
            strcat(command, " -n -silent --interpreter=mi2"); //-async //\"%s\"
            gdbTimer.Start();
            gdbHandle = DualPipeOpen(PipeOpenMode { output = true, /*error = true, */input = true }, command);
            if(!gdbHandle)
            {
               ide.outputView.debugBox.Logf($"Debugger Fatal Error: Couldn't start GDB\n");
               result = false;
            }
         }
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
      }
      if(result)
      {
         app.Unlock();
         serialSemaphore.Wait();
         app.Lock();

         GdbCommand(0, false, "handle SIGPIPE nostop");
         GdbCommand(0, false, "-gdb-set verbose off");
         //GdbCommand(0, false, "-gdb-set exec-done-display on");
         GdbCommand(0, false, "-gdb-set step-mode off");
         GdbCommand(0, false, "-gdb-set unwindonsignal on");
         GdbCommand(0, false, "-gdb-set stop-on-solib-events on");
         //GdbCommand(0, false, "-gdb-set shell on");
         GdbCommand(0, false, "set print elements 992");
         GdbCommand(0, false, "-gdb-set backtrace limit 100000");

         if(!GdbTargetSet())
         {
            //_ChangeState(terminated);
            result = false;
         }
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

         if(!usingValgrind)
         {
            progThread.terminate = false;
            progThread.Create();
         }
#endif

#if defined(__WIN32__)
         GdbCommand(0, false, "-gdb-set new-console on");
#endif

#if defined(__unix__)
         if(!usingValgrind)
            GdbCommand(0, false, "-inferior-tty-set %s", progFifoPath);
#endif

         if(!usingValgrind)
            GdbCommand(0, false, "-gdb-set args %s", ide.workspace.commandLineArgs ? ide.workspace.commandLineArgs : "");
         /*
         for(e : ide.workspace.environmentVars)
         {
            GdbCommand(0, false, "set environment %s=%s", e.name, e.string);
         }
         */
      }

      ChangeWorkingDir(oldDirectory);

      for(e : envBackup)
      {
         SetEnvironment(&e, e);
      }
      envBackup.Free();
      delete envBackup;

      delete pathBackup;

      if(!result)
         GdbExit();
      delete targetDirExp;
      return result;
   }

   void GdbExit()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbExit()");
      if(gdbHandle && gdbProcessId)
      {
         gdbTimer.Stop();
         GdbCommand(0, false, "-gdb-exit");

         if(gdbThread)
         {
            app.Unlock();
            gdbThread.Wait();
            app.Lock();
         }
         if(vgLogFile)
            vgLogFile.CloseInput();
         if(vgLogThread.created)
         {
            app.Unlock();
            vgLogThread.Wait();
            app.Lock();
         }
         delete vgLogFile;
         if(vgTargetThread)
         {
            app.Unlock();
            vgTargetThread.Wait();
            app.Lock();
         }
         if(gdbHandle)
         {
            gdbHandle.Wait();
            delete gdbHandle;
         }
      }
      gdbTimer.Stop();
      _ChangeState(terminated); // this state change seems to be superfluous, is it safety for something?
      needReset = false;

      if(ide.workspace)
      {
         for(bp : ide.workspace.breakpoints)
            bp.Reset();
      }
      for(bp : sysBPs)
         bp.Reset();
      if(bpRunToCursor)
         bpRunToCursor.Reset();

      ide.outputView.debugBox.Logf($"Debugging stopped\n");

#if defined(__unix__)
      if(!usingValgrind && FileExists(progFifoPath)) //fileCreated)
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

      CleanUp();
      ide.Update(null);
   }

   bool WatchesLinkCodeEditor()
   {
      bool goodFrame = activeFrame && activeFrame.absoluteFile;
      //_dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::WatchesLinkCodeEditor()");
      if(codeEditor && (!goodFrame || fstrcmp(codeEditor.fileName, activeFrame.absoluteFile)))
         WatchesReleaseCodeEditor();

      if(!codeEditor && goodFrame)
      {
         codeEditor = (CodeEditor)ide.OpenFile(activeFrame.absoluteFile, false, false, null, no, normal, false);
         if(codeEditor)
         {
            codeEditor.inUseDebug = true;
            incref codeEditor;
         }
      }
      return codeEditor != null;
   }

   void WatchesReleaseCodeEditor()
   {
      //_dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::WatchesReleaseCodeEditor()");
      if(codeEditor)
      {
         codeEditor.inUseDebug = false;
         if(!codeEditor.visible)
            codeEditor.Destroy(0);
         delete codeEditor;
      }
   }

   bool ResolveWatch(Watch wh)
   {
      bool result = false;

      _dpcl(_dpct, dplchan::debuggerWatches, 0, "Debugger::ResolveWatch()");
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
         watchmsg[0] = 0;
         if(state == stopped && !codeEditor)
            wh.value = CopyString($"No source file found for selected frame");
         //if(codeEditor && state == stopped || state != stopped)
         else
         {
            Module backupPrivateModule;
            Context backupContext;
            Class backupThisClass;
            Expression exp;

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

            if(exp && !GetParseError())
            {
               char expString[4096];
               expString[0] = 0;
               PrintExpression(exp, expString);

               SetInDebugger(true);

               SetThisClass(null);
               // NOTE: DebugFindCtxTree() should be called only once for evaluating all watches in the watch window
               if(codeEditor && activeFrame)
                  DebugFindCtxTree(codeEditor.ast, activeFrame.line, 0);
               ProcessExpressionType(exp);

               wh.type = exp.expType;
               if(wh.type)
                  wh.type.refCount++;
               DebugComputeExpression(exp);
               // e.g. Meters * Degrees has no type set yet for some reason
               if(!wh.type && exp.expType)
               {
                  wh.type = exp.expType;
                  exp.expType.refCount++;
               }

               // This makes Degrees { 45 } work
               if(exp.type == constantExp && exp.isConstant && exp.expType && exp.expType.kind == classType &&
                  exp.expType._class && exp.expType._class.registered && exp.expType._class.registered.type == unitClass && exp.expType._class.registered.base.type == unitClass)
               {
                  ApplyUnitConverters(exp);
               }
               else if(exp.type == instanceExp && exp.instance.data)
               {
                  Symbol s = exp.instance._class ? exp.instance._class.symbol : null;
                  Class c = s ? s.registered : null;
                  if(c)
                  {
                     char tmp[4096];
                     bool needClass = false;
                     char * s = ((char * (*)(void *, void *, void *, void *, void *))(void *)c._vTbl[__ecereVMethodID_class_OnGetString])(c, exp.instance.data, tmp, null, &needClass);
                     if(s)
                     {
                        FreeExpContents(exp);
                        exp.type = constantExp;
                        exp.isConstant = true;
                        exp.constant = CopyString(s);
                     }
                  }
               }
               else if(exp.expType && exp.expType.kind == classType && exp.expType._class && exp.expType._class.registered && exp.expType._class.registered.type == bitClass)
               {
                  Class c = exp.expType._class.registered;
                  char tmp[4096];
                  bool needClass = false;
                  Operand op = GetOperand(exp);
                  char * s = null;
                  char * (* onGetString)(void *, void *, void *, void *, void *) = (void *)c._vTbl[__ecereVMethodID_class_OnGetString];
                  if(op.type)
                  {
                     if(op.type) op.type.refCount++;
                     switch(op.kind)
                     {
                        case charType: s = onGetString(c, &op.c, tmp, null, &needClass); break;
                        case shortType: s = onGetString(c, &op.s, tmp, null, &needClass); break;
                        case intType: s = onGetString(c, &op.i, tmp, null, &needClass); break;
                        case int64Type: s = onGetString(c, &op.i64, tmp, null, &needClass); break;
                     }
                  }
                  if(s)
                  {
                     FreeExpContents(exp);
                     exp.type = constantExp;
                     exp.isConstant = true;
                     exp.constant = CopyString(s);
                  }
                  FreeType(op.type);
               }
               else if(exp.expType && exp.expType.kind == classType && exp.expType._class && exp.expType._class.registered && exp.expType._class.registered.type == structClass && exp.hasAddress)
               {
                  Class c = exp.expType._class.registered;
                  DataMember m;
                  bool getString = true;
                  byte * data = null;
                  Class bc;

                  for(bc = c; bc && getString; bc = bc.inheritanceAccess == publicAccess ? bc.base : null)
                  {
                     for(m = bc.membersAndProperties.first; m; m = m.next)
                     {
                        if(!m.isProperty)
                        {
                           if(m.type == normalMember)
                           {
                              Class type = m.dataTypeClass;
                              if(!type)
                                 type = m.dataTypeClass = eSystem_FindClass(bc.module, m.dataTypeString);
                              if(!type || type.type == noHeadClass || type.type == normalClass)
                              {
                                 // Avoid trying to stringify types referencing debugged process memory
                                 getString = false;
                                 break;
                              }
                           }
                           else
                           {
                              // Avoid trying to stringify types referencing debugged process memory
                              // (should be recursive, but for now union/struct often contain debugged memory e.g., FieldValue
                              getString = false;
                           }
                        }
                     }
                  }
                  data = getString ? GdbReadMemory(exp.address, c.structSize) : null;
                  if(data)
                  {
                     char tmp[4096];
                     bool needClass = false;
                     char * s =
                        c._vTbl[__ecereVMethodID_class_OnGetString] ?
                        ((char * (*)(void *, void *, void *, void *, void *))(void *)c._vTbl[__ecereVMethodID_class_OnGetString])(c, data, tmp, null, &needClass)
                        : null;
                     if(s)
                     {
                        FreeExpContents(exp);
                        exp.type = constantExp;
                        exp.isConstant = true;
                        exp.constant = PrintString("{ ", s, " }");
                     }
                     delete data;
                  }
                  else
                  {
                     char structString[1024];
                     strcpy(structString, "*(struct ");
                     FullClassNameCat(structString, c.fullName, false);
                     strcat(structString, " *)");
                     strcatf(structString, "0x%p", exp.address);
                     GDBFallBack(exp, structString);
                  }
               }

               if(ExpressionIsError(exp) && exp.type != functionCallErrorExp)
               {
                  GDBFallBack(exp, expString);
               }

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
                  case memberSymbolErrorExp:
                  {
                     Expression memberExp = exp.member.exp;
                     Identifier memberID = exp.member.member;
                     Type type = memberExp.expType;
                     if(type)
                     {
                        if(type.kind == structType || type.kind == unionType)
                        {
                           char string[1024] = "";
                           if(!type.name)
                              PrintTypeNoConst(type, string, false, true);
                           snprintf(watchmsg, sizeof(watchmsg), $"Member \"%s\" not found in %s \"%s\"",
                              memberID ? memberID.string : "", type.kind == unionType ? "union" : "struct", type.name ? type.name : string);
                        }
                        else
                        {
                           Class _class = (memberID && memberID.classSym) ? memberID.classSym.registered : ((type.kind == classType && type._class) ? type._class.registered : null);
                           char string[1024] = "";
                           if(!_class)
                           {
                              Symbol classSym;
                              PrintTypeNoConst(type, string, false, true);
                              classSym = FindClass(string);
                              _class = classSym ? classSym.registered : null;
                           }
                           if(_class)
                              snprintf(watchmsg, sizeof(watchmsg), $"Member \"%s\" not found in class \"%s\"", memberID ? memberID.string : "", _class.name);
                           else
                              // NOTE: This should probably never happen, only classes and struct can be dereferenced, a dereferenceErrorExp should be displayed instead
                              snprintf(watchmsg, sizeof(watchmsg), $"Member \"%s\" not found in type \"%s\"", memberID ? memberID.string : "", string);
                        }
                     }
                     else
                        // NOTE: This should probably never happen, the error causing the unresolved expression should be displayed instead
                        snprintf(watchmsg, sizeof(watchmsg), $"Accessing member \"%s\" from unresolved expression", memberID ? memberID.string : "");
                     break;
                  }
                  case memberPropertyErrorExp:
                  {
                     Expression memberExp = exp.member.exp;
                     Identifier memberID = exp.member.member;
                     Type type = memberExp ? memberExp.expType : null;
                     Class _class = (type && memberID) ? (memberID && memberID.classSym) ? memberID.classSym.registered : ((type.kind == classType && type._class) ? type._class.registered : null) : null;
                     if(_class && memberID && memberID.string)
                        snprintf(watchmsg, sizeof(watchmsg), $"Missing property evaluation for \"%s\" in class \"%s\"", memberID.string, _class.name);
                     else
                        snprintf(watchmsg, sizeof(watchmsg), $"Missing property evaluation for \"%s\"", wh.expression);
                     break;
                  }
                  case functionCallErrorExp:
                     if(exp.call.exp && exp.call.exp.type == identifierExp && exp.call.exp.identifier.string)
                        snprintf(watchmsg, sizeof(watchmsg), $"Missing function evaluation for call to \"%s\"", exp.call.exp.identifier.string);
                     else
                        snprintf(watchmsg, sizeof(watchmsg), $"Missing function evaluation for \"%s\"", wh.expression);
                     break;
                  case memoryErrorExp:
                     // Need to ensure when set to memoryErrorExp, constant is set
                     snprintf(watchmsg, sizeof(watchmsg), $"Memory can't be read at %s", /*(exp.type == constantExp) ? */exp.constant /*: null*/);
                     break;
                  case dereferenceErrorExp:
                     snprintf(watchmsg, sizeof(watchmsg), $"Dereferencing error evaluating \"%s\"", wh.expression);
                     break;
                  case divideBy0ErrorExp:
                     snprintf(watchmsg, sizeof(watchmsg), "%s", $"Integer division by 0");
                     break;
                  case noDebuggerErrorExp:
                     snprintf(watchmsg, sizeof(watchmsg), $"Debugger required for symbol evaluation in \"%s\"", wh.expression);
                     break;
                  case unknownErrorExp:
                     // NOTE: This should never happen
                     snprintf(watchmsg, sizeof(watchmsg), $"Error evaluating \"%s\"", wh.expression);
                     break;
                  case 0:
                     // NOTE: This should never happen
                     snprintf(watchmsg, sizeof(watchmsg), $"Null type for \"%s\"", wh.expression);
                     break;
                  case stringExp:
                     wh.value = CopyString(exp.string);
                     break;
                  case constantExp:
                     // Temporary Code for displaying Strings
                     if((exp.expType && ((exp.expType.kind == pointerType ||
                              exp.expType.kind == arrayType) && exp.expType.type.kind == charType)) ||
                           (wh.type && wh.type.kind == classType && wh.type._class &&
                              wh.type._class.registered && wh.type._class.registered.type == normalClass &&
                              !strcmp(wh.type._class.registered.name, "String")))
                     {

                        if(exp.expType && (exp.expType.kind != arrayType || exp.hasAddress))
                        {
                           uint64 address;
                           char value[4196];
                           //char temp[MAX_F_STRING * 32];

                           //ExpressionType evalError = dummyExp;
                           /*if(exp.expType.kind == arrayType)
                              sprintf(temp, "(char*)0x%x", exp.address);
                           else
                              sprintf(temp, "(char*)%s", exp.constant);*/

                           //evaluation = Debugger::EvaluateExpression(temp, &evalError);
                           // address = strtoul(exp.constant, null, 0);
                           address = _strtoui64(exp.constant, null, 0);
                           //_dplf(0, "0x", address);
                           // snprintf(value, sizeof(value), "0x%08x ", address);

                           if(address > 0xFFFFFFFFLL)
                              snprintf(value, sizeof(value), (__runtimePlatform == win32) ? "0x%016I64x " : "0x%016llx ", address);
                           else
                              snprintf(value, sizeof(value), (__runtimePlatform == win32) ? "0x%08I64x " : "0x%08llx ", address);
                           value[sizeof(value)-1] = 0;

                           if(!address)
                              strcat(value, $"Null string");
                           else
                           {
                              String string = new char[4097];
                              int start = 0;
                              bool success = false;
                              int size = 256;
                              bool done = false;

                              for(start = 0; !done && start + size <= 4096; start += size)
                              {
                                 byte * s = null;
                                 while(!done && !s)
                                 {
                                    // Try to read 256 bytes at a time, then half if that fails
                                    s = GdbReadMemory(address + start, size);
                                    if(s)
                                    {
                                       success = true;
                                       memcpy(string + start, s, size);
                                       string[start + size] = 0;
                                       if(size == 1 || memchr(s, 0, size))
                                          done = true;
                                    }
                                    else if(size > 1)
                                       size /= 2;
                                    else
                                       done = true;
                                 }
                                 delete s;
                              }
                              if(success)
                              {
                                 if(string[0])
                                 {
                                    int len = strlen(value);
                                    value[len++] = '(';
                                    if(UTF8Validate(string))
                                    {
                                       int c;
                                       char ch;

                                       for(c = 0; (ch = string[c]); c++)
                                          value[len++] = ch;
                                       value[len++] = ')';
                                       value[len++] = '\0';

                                    }
                                    else
                                    {
                                       ISO8859_1toUTF8(string, value + len, strlen(value) - len - 30);
                                       strcat(value, ") (ISO8859-1)");
                                    }
                                 }
                                 else
                                    strcat(value, $"Empty string");
                              }
                              else
                                 strcat(value, $"Couldn't read memory");
                              delete string;
                           }
                           wh.value = CopyString(value);
                        }
                     }
                     else if(wh.type && wh.type.kind == classType && wh.type._class &&
                              wh.type._class.registered && wh.type._class.registered.type == enumClass)
                     {
                        Class enumClass = eSystem_FindClass(GetPrivateModule(), wh.type._class.registered.name);
                        EnumClassData enumeration = (EnumClassData)enumClass.data;
                        NamedLink64 item;
                        int64 value;

                        if(!strcmp(enumClass.dataTypeString, "uint64"))
                        {
                           uint64 v = strtoull(exp.constant, null, 0);
                           value = *(int64*)&v;
                        }
                        else
                           value = strtoll(exp.constant, null, 0);

                        for(item = enumeration.values.first; item; item = item.next)
                           if(item.data == value)
                              break;
                        if(item)
                           wh.value = CopyString(item.name);
                        else
                           wh.value = PrintString($"Invalid Enum Value (", value, ")");
                        result = true;
                     }
                     else if(wh.type && (wh.type.kind == charType || (wh.type.kind == classType && wh.type._class &&
                              wh.type._class.registered && !strcmp(wh.type._class.registered.fullName, "unichar"))) )
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
                              value = (uint)strtoul(exp.constant, null, 0);
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
                              snprintf(string, sizeof(string), $"Invalid Unicode Codepoint (0x%08X)", value);
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
                        result = true;
                     }
                     break;
                  default:
                  {
                     bool genericError = true;
                     if(exp.expType && exp.hasAddress)
                     {
                        bool showAddress = false;
                        switch(exp.expType.kind)
                        {
                           case pointerType:
                           case functionType:
                           case methodType:
                           case arrayType:
                           case subClassType:
                           case thisClassType:
                              showAddress = true;
                              break;
                           case classType:
                           {
                              Symbol s = exp.expType._class;
                              if(s)
                              {
                                 Class c = s.registered;
                                 if(c.type == noHeadClass || c.type == normalClass)
                                    showAddress = true;
                              }
                              break;
                           }
                        }
                        if(showAddress)
                        {
                           wh.value = PrintHexUInt64(exp.address);
                           result = true;
                           genericError = false;
                        }
                     }
                     if(genericError)
                        // NOTE: This should ideally be handled with a specific error message
                        snprintf(watchmsg, sizeof(watchmsg), $"Error evaluating \"%s\"", wh.expression);
                     break;
                  }
               }

               SetInDebugger(false);
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
      _dpcl(_dpct, dplchan::debuggerWatches, 0, "Debugger::EvaluateWatches()");
      WatchesLinkCodeEditor();
      if(state == stopped)
      {
         for(wh : ide.workspace.watches)
            ResolveWatch(wh);
      }
   }

   char * ::GdbEvaluateExpression(char * expression)
   {
      _dpcl(_dpct, dplchan::debuggerWatches, 0, "Debugger::GdbEvaluateExpression(", expression, ")");
      eval.active = true;
      eval.error = none;
      GdbCommand(0, false, "-data-evaluate-expression \"%s\"", expression);
      if(eval.active)
         ide.outputView.debugBox.Logf("Debugger Error: GdbEvaluateExpression\n");
      return eval.result;
   }

   // to be removed... use GdbReadMemory that returns a byte array instead
   char * ::GdbReadMemoryString(uint64 address, int size, char format, int rows, int cols)
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbReadMemoryString(", address, ")");
      eval.active = true;
      eval.error = none;
#ifdef _DEBUG
      if(!size)
         _dplf(0, "GdbReadMemoryString called with size = 0!");
#endif
      GdbCommand(0, false,
         (__runtimePlatform == win32) ? "-data-read-memory 0x%016I64x %c, %d, %d, %d" : "-data-read-memory 0x%016llx %c, %d, %d, %d", address, format, size, rows, cols);
      if(eval.active)
         ide.outputView.debugBox.Logf("Debugger Error: GdbReadMemoryString\n");
      return eval.result;
   }

   byte * ::GdbReadMemory(uint64 address, int bytes)
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbReadMemory(", address, ")");
      eval.active = true;
      eval.error = none;
      GdbCommand(0, false,
         (__runtimePlatform == win32) ? "-data-read-memory 0x%016I64x %c, 1, 1, %d" : "-data-read-memory 0x%016llx %c, 1, 1, %d",
         address, 'u', bytes);
#ifdef _DEBUG
      if(!bytes)
         _dplf(0, "GdbReadMemory called with bytes = 0!");
#endif
      if(eval.active)
         ide.outputView.debugBox.Logf("Debugger Error: GdbReadMemory\n");
      else if(eval.result && strcmp(eval.result, "N/A"))
      {
         byte * result = new byte[bytes];
         char * string = eval.result;
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
         delete eval.result;
         return result;
      }
      return null;
   }

   bool BreakpointHit(GdbDataStop stopItem, Breakpoint bpInternal, Breakpoint bpUser)
   {
      bool result = true;
      char * s1 = null; char * s2 = null;
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::BreakpointHit(",
            "bpInternal(", bpInternal ? s1=bpInternal.CopyLocationString(false) : null, "), ",
            "bpUser(", bpUser ? s2=bpUser.CopyLocationString(false) : null, ")) -- ",
            "ignoreBreakpoints(", ignoreBreakpoints, "), ",
            "hitCursorBreakpoint(", bpUser && bpUser.type == runToCursor,  ")");
      delete s1; delete s2;

      if(bpUser)
      {
         bool conditionMet = true;
         if(bpUser.condition)
         {
            if(WatchesLinkCodeEditor())
               conditionMet = ResolveWatch(bpUser.condition);
            else
               conditionMet = false;
         }
         bpUser.hits++;
         if(conditionMet)
         {
            if(!bpUser.ignore)
               bpUser.breaks++;
            else
            {
               bpUser.ignore--;
               result = false;
            }
         }
         else
            result = false;
         if(stopItem.frame.line && bpUser.line != stopItem.frame.line)
         {
            // updating user breakpoint on hit location difference
            // todo, print something?
            bpUser.line = stopItem.frame.line;
            ide.breakpointsView.UpdateBreakpoint(bpUser.row);
            ide.workspace.Save();
         }
         else
            ide.breakpointsView.UpdateBreakpoint(bpUser.row);
      }
      if(bpInternal)
      {
         bpInternal.hits++;
         if(bpInternal.type == internalModulesLoaded)
            modules = true;
         if(userAction == stepOver)
         {
            if((bpInternal.type == internalEntry && ((intBpMain && intBpMain.inserted) || (intBpWinMain && intBpWinMain.inserted))) ||
                  (bpInternal.type == internalMain && intBpWinMain && intBpWinMain.inserted))
               result = false;
         }
         if(!bpUser && !userAction.breaksOnInternalBreakpoint)
         {
            if(userAction == stepOut)
               StepOut(ignoreBreakpoints);
            else
               result = false;
         }
      }

      if(!bpUser && !bpInternal)
         result = false;

      return result;
   }

   void ValgrindTargetThreadExit()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::ValgrindTargetThreadExit()");
      if(vgTargetHandle)
      {
         vgTargetHandle.Wait();
         delete vgTargetHandle;
      }
      HandleExit(null, null);
   }

   void GdbThreadExit()
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::GdbThreadExit()");
      if(state != terminated)
      {
         _ChangeState(terminated);
         targetProcessId = 0;
         ClearBreakDisplay();

         delete vgLogFile;
         if(gdbHandle)
         {
            serialSemaphore.Release();
            gdbTimer.Stop();
            gdbHandle.Wait();
            delete gdbHandle;

            ide.outputView.debugBox.Logf($"Debugger Fatal Error: GDB lost\n");
            ide.outputView.debugBox.Logf($"Debugging stopped\n");
            ide.Update(null);
            HideDebuggerViews();
         }
         //_ChangeState(terminated);
      }
   }

   void GdbThreadMain(char * output)
   {
      int i;
      // char * t;
      Array<char *> outTokens { minAllocSize = 50 };
      Array<char *> subTokens { minAllocSize = 50 };
      DebugListItem item { };
      DebugListItem item2 { };
      bool setWaitingForPID = false;

#if defined(GDB_DEBUG_CONSOLE) || defined(GDB_DEBUG_GUI)
#ifdef GDB_DEBUG_CONSOLE
      // _dpcl(_dpct, dplchan::gdbOutput, 0, output);
      puts(output);
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
            /*
            if(!entryPoint && (t = strstr(output, "Entry point:")))
            {
               char * addr = t + strlen("Entry point:");
               t = addr;
               if(*t++ == ' ' && *t++ == '0' && *t == 'x')
               {
                  *addr = '*';
                  while(isxdigit(*++t));
                  *t = '\0';
                  for(bp : sysBPs; bp.type == internalEntry)
                  {
                     bp.function = addr;
                     bp.enabled = entryPoint = true;
                     break;
                  }
               }
            }
            */
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
                     _ChangeState(loaded);
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
                           _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, "kill reply (", item.name, "=", item.value, ") is unheard of");
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
                        _dplf(0, "problem");
#endif
                     delete bpItem;
                     bpItem = ParseBreakpoint(item.value, outTokens);
                     //breakType = bpValidation;
                  }
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
                                 _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, "unexpected frame file and from members present");
                              if(frame.file)
                              {
                                 char * s = null;
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
                                    char * s = null;
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
                              _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, "stack content (", item.name, "=", item.value, ") is unheard of");
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
                              _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, "threads content (", item.name, "=", item.value, ") is unheard of");
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
                              eval.nextBlockAddress = _strtoui64(item.value, null, 0);
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
                  else if(!strcmp(item.name, "source-path") || !strcmp(item.name, "BreakpointTable"))
                     _dpcl(_dpct, dplchan::gdbProtoIgnored, 0, "command reply (", item.name, "=", item.value, ") is ignored");
                  else
                     _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, "command reply (", item.name, "=", item.value, ") is unheard of");
               }
            }
            else if(!strcmp(outTokens[0], "^running"))
            {
               waitingForPID = true;
               setWaitingForPID = true;
               ClearBreakDisplay();
            }
            else if(!strcmp(outTokens[0], "^exit"))
            {
               _ChangeState(terminated);
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
                        _ChangeState(stopped);
                        gdbHandle.Printf("-exec-continue\n");
                     }
                     else if(!strcmp(item.value, "ptrace: No such process."))
                     {
                        _ChangeState(loaded);
                        targetProcessId = 0;
                     }
                     else if(!strcmp(item.value, "Function \\\"WinMain\\\" not defined."))
                     {
                     }
                     else if(!strcmp(item.value, "You can't do that without a process to debug."))
                     {
                        _ChangeState(loaded);
                        targetProcessId = 0;
                     }
                     else if(strstr(item.value, "No such file or directory."))
                     {
                        _ChangeState(loaded);
                        targetProcessId = 0;
                     }
                     else if(strstr(item.value, "During startup program exited with code "))
                     {
                        _ChangeState(loaded);
                        targetProcessId = 0;
                     }
                     else
                     {
#ifdef _DEBUG
                        if(strlen(item.value) < MAX_F_STRING)
                        {
                           char * s = null;
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
                  _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, "error content (", item.name, "=", item.value, ") is unheard of");
            }
            else
               _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, "result-record: ", outTokens[0]);
            outTokens.RemoveAll();
            break;
         case '+':
            _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, "status-async-output: ", outTokens[0]);
            break;
         case '=':
            if(TokenizeList(output, ',', outTokens))
            {
               if(!strcmp(outTokens[0], "=library-loaded"))
                  FGODetectLoadedLibraryForAddedProjectIssues(outTokens, false);
               else if(!strcmp(outTokens[0], "=shlibs-added"))
                  FGODetectLoadedLibraryForAddedProjectIssues(outTokens, true);
               else if(!strcmp(outTokens[0], "=thread-group-created") || !strcmp(outTokens[0], "=thread-group-added") ||
                        !strcmp(outTokens[0], "=thread-group-started") || !strcmp(outTokens[0], "=thread-group-exited") ||
                        !strcmp(outTokens[0], "=thread-created") || !strcmp(outTokens[0], "=thread-exited") ||
                        !strcmp(outTokens[0], "=cmd-param-changed") || !strcmp(outTokens[0], "=library-unloaded") ||
                        !strcmp(outTokens[0], "=breakpoint-modified"))
                  _dpcl(_dpct, dplchan::gdbProtoIgnored, 0, outTokens[0], outTokens.count>1 ? outTokens[1] : "",
                           outTokens.count>2 ? outTokens[2] : "", outTokens.count>3 ? outTokens[3] : "",
                           outTokens.count>4 ? outTokens[4] : "", outTokens.count>5 ? outTokens[5] : "",
                           outTokens.count>6 ? outTokens[6] : "", outTokens.count>7 ? outTokens[7] : "",
                           outTokens.count>8 ? outTokens[8] : "", outTokens.count>9 ? outTokens[9] : "");
               else
                  _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, "notify-async-output: ", outTokens[0]);
            }
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
                  _ChangeState(stopped);

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
                              needReset = true;
                           }
                           else if(!strcmp(reason, "breakpoint-hit") ||
                                   !strcmp(reason, "function-finished") ||
                                   !strcmp(reason, "end-stepping-range") ||
                                   !strcmp(reason, "location-reached") ||
                                   !strcmp(reason, "signal-received"))
                           {
                              char r = reason[0];
#ifdef _DEBUG
                              if(stopItem) _dplf(0, "problem");
#endif
                              stopItem = GdbDataStop { };
                              stopItem.reason = r == 'b' ? breakpointHit : r == 'f' ? functionFinished : r == 'e' ? endSteppingRange : r == 'l' ? locationReached : signalReceived;

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
                                 else if(stopItem.reason == breakpointHit && !strcmp(item.name, "bkptno"))
                                    stopItem.bkptno = atoi(item.value);
                                 else if(stopItem.reason == functionFinished && !strcmp(item.name, "gdb-result-var"))
                                    stopItem.gdbResultVar = CopyString(item.value);
                                 else if(stopItem.reason == functionFinished && !strcmp(item.name, "return-value"))
                                    stopItem.returnValue = CopyString(item.value);
                                 else if(stopItem.reason == signalReceived && !strcmp(item.name, "signal-name"))
                                    stopItem.name = CopyString(item.value);
                                 else if(stopItem.reason == signalReceived && !strcmp(item.name, "signal-meaning"))
                                    stopItem.meaning = CopyString(item.value);
                                 else if(!strcmp(item.name, "stopped-threads"))
                                    _dpcl(_dpct, dplchan::gdbProtoIgnored, 0, reason, ": Advanced thread debugging not handled");
                                 else if(!strcmp(item.name, "core"))
                                    _dpcl(_dpct, dplchan::gdbProtoIgnored, 0, reason, ": Information (core) not used");
                                 else if(!strcmp(item.name, "disp"))
                                    _dpcl(_dpct, dplchan::gdbProtoIgnored, 0, reason, ": (", item.name, "=", item.value, ")");
                                 else
                                    _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, "Unknown ", reason, " item name (", item.name, "=", item.value, ")");
                              }

                              if(stopItem.reason == signalReceived && !strcmp(stopItem.name, "SIGTRAP"))
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
                                 event = r == 'b' ? hit : r == 'f' ? functionEnd : r == 'e' ? stepEnd : r == 'l' ? locationReached : signal;
                                 ide.Update(null);
                              }
                           }
                           else if(!strcmp(reason, "watchpoint-trigger"))
                              _dpcl(_dpct, dplchan::gdbProtoIgnored, 0, "Reason watchpoint trigger not handled");
                           else if(!strcmp(reason, "read-watchpoint-trigger"))
                              _dpcl(_dpct, dplchan::gdbProtoIgnored, 0, "Reason read watchpoint trigger not handled");
                           else if(!strcmp(reason, "access-watchpoint-trigger"))
                              _dpcl(_dpct, dplchan::gdbProtoIgnored, 0, "Reason access watchpoint trigger not handled");
                           else if(!strcmp(reason, "watchpoint-scope"))
                              _dpcl(_dpct, dplchan::gdbProtoIgnored, 0, "Reason watchpoint scope not handled");
                           else
                              _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, "Unknown reason: ", reason);
                        }
                        else
                        {
                           PrintLn(output);
                        }
                     }
                  }
                  if(usingValgrind && event == none && !stopItem)
                     event = valgrindStartPause;
                  app.SignalEvent();
               }
            }
            else
               _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, "Unknown exec-async-output: ", outTokens[0]);
            outTokens.RemoveAll();
            break;
         case '(':
            if(!strcmpi(output, "(gdb) "))
            {
               if(waitingForPID)
               {
                  Time startTime = GetTime();
                  char exeFile[MAX_LOCATION];
                  int oldProcessID = targetProcessId;
                  GetLastDirectory(targetFile, exeFile);

                  while(!targetProcessId/*true*/)
                  {
                     targetProcessId = Process_GetChildExeProcessId(gdbProcessId, exeFile);
                     if(targetProcessId) break;
                     // Can't break on Peek(), GDB is giving us =library and other info before the process is listed in /proc
                     // if(gdbHandle.Peek()) break;
                     Sleep(0.01);
                     if(gdbHandle.Peek() && GetTime() - startTime > 2.5)  // Give the process 2.5 seconds to show up in /proc
                        break;
                  }

                  if(targetProcessId)
                     _ChangeState(running);
                  else if(!oldProcessID)
                  {
                     ide.outputView.debugBox.Logf($"Debugger Error: No target process ID\n");
                     // TO VERIFY: The rest of this block has not been thoroughly tested in this particular location
                     gdbHandle.Printf("-gdb-exit\n");
                     gdbTimer.Stop();
                     _ChangeState(terminated); //loaded;
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
                     if(!usingValgrind && FileExists(progFifoPath)) //fileCreated)
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
               _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, $"Unknown prompt", output);

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
                  char * s = null;
                  ide.outputView.debugBox.LogRaw((s = CopyUnescapedString(content)));
                  delete s;
                  ide.Update(null);
               }
            }
            break;
         default:
            _dpcl(_dpct, dplchan::gdbProtoUnknown, 0, $"Unknown output: ", output);
      }
      if(!setWaitingForPID)
         waitingForPID = false;
      setWaitingForPID = false;

      delete outTokens;
      delete subTokens;
      delete item;
      delete item2;
   }

   // From GDB Output functions
   void FGODetectLoadedLibraryForAddedProjectIssues(Array<char *> outTokens, bool shlibs)
   {
      char path[MAX_LOCATION] = "";
      char file[MAX_FILENAME] = "";
      //bool symbolsLoaded = false;
      DebugListItem item { };
      //_dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::FGODetectLoadedLibraryForAddedProjectIssues()");
      for(token : outTokens)
      {
         if(TokenizeListItem(token, item))
         {
            if(!strcmp(item.name, "target-name"))
            {
               StripQuotes(item.value, path);
               MakeSystemPath(path);
               GetLastDirectory(path, file);
            }
            else if(!strcmp(item.name, "symbols-loaded"))
            {
               //symbolsLoaded = (atoi(item.value) == 1);
            }
            else if(!strcmp(item.name, "shlib-info"))
            {
               DebugListItem subItem { };
               Array<char *> tokens { minAllocSize = 50 };
               item.value = StripBrackets(item.value);
               TokenizeList(item.value, ',', tokens);
               for(t : tokens)
               {
                  if(TokenizeListItem(t, subItem))
                  {
                     if(!strcmp(subItem.name, "path"))
                     {
                        StripQuotes(subItem.value, path);
                        MakeSystemPath(path);
                        GetLastDirectory(path, file);
                        //symbolsLoaded = true;
                     }
                  }
               }
               tokens.RemoveAll();
               delete tokens;
               delete subItem;
            }
         }
      }
      delete item;
      if(path[0] && file[0])
      {
         for(prj : ide.workspace.projects; prj != ide.workspace.projects.firstIterator.data)
         {
            bool match;
            char * dot;
            char prjTargetPath[MAX_LOCATION];
            char prjTargetFile[MAX_FILENAME];
            DirExpression targetDirExp = prj.GetTargetDir(currentCompiler, prj.config, bitDepth);
            strcpy(prjTargetPath, prj.topNode.path);
            PathCat(prjTargetPath, targetDirExp.dir);
            delete targetDirExp;
            prjTargetFile[0] = '\0';
            prj.CatTargetFileName(prjTargetFile, currentCompiler, prj.config);
            PathCat(prjTargetPath, prjTargetFile);
            MakeSystemPath(prjTargetPath);

            match = !fstrcmp(prjTargetFile, file);
            if(!match && (dot = strstr(prjTargetFile, ".so.")))
            {
               char * dot3 = strstr(dot+4, ".");
               if(dot3)
               {
                  dot3[0] = '\0';
                  match = !fstrcmp(prjTargetFile, file);
               }
               if(!match)
               {
                  dot[3] = '\0';
                  match = !fstrcmp(prjTargetFile, file);
               }
            }
            if(match)
            {
               // TODO: nice visual feedback to better warn user. use some ide notification system or other means.
               /* -- this is disabled because we can't trust gdb's symbols-loaded="0" field for =library-loaded (http://sourceware.org/bugzilla/show_bug.cgi?id=10693)
               if(!symbolsLoaded)
                  ide.outputView.debugBox.Logf($"Attention! No symbols for loaded library %s matched to the %s added project.\n", path, prj.topNode.name);
               */
               match = !fstrcmp(prjTargetPath, path);
               if(!match && (dot = strstr(prjTargetPath, ".so.")))
               {
                  char * dot3 = strstr(dot+4, ".");
                  if(dot3)
                  {
                     dot3[0] = '\0';
                     match = !fstrcmp(prjTargetPath, path);
                  }
                  if(!match)
                  {
                     dot[3] = '\0';
                     match = !fstrcmp(prjTargetPath, path);
                  }
               }
               if(match)
                  projectsLibraryLoaded[prj.name] = true;
               else
                  ide.outputView.debugBox.Logf($"Loaded library %s doesn't match the %s target of the %s added project.\n", path, prjTargetPath, prj.topNode.name);
               break;
            }
         }
      }
   }

   void FGOBreakpointModified(Array<char *> outTokens)
   {
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::FGOBreakpointModified() -- TODO only if needed: support breakpoint modified");
#if 0
      DebugListItem item { };
      if(outTokens.count > 1 && TokenizeListItem(outTokens[1], item))
      {
         if(!strcmp(item.name, "bkpt"))
         {
            GdbDataBreakpoint modBp = ParseBreakpoint(item.value, outTokens);
            delete modBp;
         }
      }
#endif
   }


   ExpressionType ::DebugEvalExpTypeError(char * result)
   {
      _dpcl(_dpct, dplchan::debuggerWatches, 0, "Debugger::DebugEvalExpTypeError()");
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
      _dpcl(_dpct, dplchan::debuggerWatches, 0, "Debugger::EvaluateExpression(", expression, ")");
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

   char * ::ReadMemory(uint64 address, int size, char format, ExpressionType * error)
   {
      // check for state
      char * result = GdbReadMemoryString(address, size, format, 1, 1);
      _dpcl(_dpct, dplchan::debuggerCall, 0, "Debugger::ReadMemory(", address, ")");
      if(!result || !strcmp(result, "N/A"))
         *error = memoryErrorExp;
      else
         *error = DebugEvalExpTypeError(result);
      return result;
   }
}

class ValgrindLogThread : Thread
{
   Debugger debugger;

   unsigned int Main()
   {
      static char output[4096];
      bool lastLineEmpty = true;
      Array<char> dynamicBuffer { minAllocSize = 4096 };
      File oldValgrindHandle = vgLogFile;
      incref oldValgrindHandle;

      app.Lock();
      while(debugger.state != terminated && vgLogFile && vgLogFile.input)
      {
         int result = 0;
         app.Unlock();
         Sleep(0.05);
         if(vgLogFile)
            result = (int)vgLogFile.Read(output, 1, sizeof(output));
         app.Lock();
         if(debugger.state == terminated || !vgLogFile) // || vgLogFile.Eof()
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
                     dynamicBuffer.size++;
                  if(dynamicBuffer.count)
                     dynamicBuffer[dynamicBuffer.count - 1] = '\0';
#ifdef _DEBUG
                  // printf("%s\n", dynamicBuffer.array);
#endif
                  if(strstr(&dynamicBuffer[0], "vgdb me ..."))
                     debugger.serialSemaphore.Release();
                  {
                     char * s = strstr(&dynamicBuffer[0], "==");
                     if(s)
                        s = strstr(s+2, "== ");
                     if(s)
                     {
                        s += 3;
                        if(s[0] == '\0' && !lastLineEmpty)
                        {
                           s = null;
                           lastLineEmpty = true;
                           dynamicBuffer[0] = '\0';
                        }
                     }
                     if(s)
                     {
                        char * t = s;
                        switch(s[0])
                        {
                           case '(':
                              if(strstr(s, "vgdb me ..."))
                              {
                                 if(strstr(s, "(action on error) vgdb me ..."))
                                    ide.outputView.debugBox.Logf($"...breaked on Valgrind error (F5 to resume)\n");
                                 s[0] = '\0';
                              }
                              else
                                 s = null;
                              break;
                           case 'T':
                              if(strstr(s, "TO DEBUG THIS PROCESS USING GDB: start GDB like this"))
                                 s[0] = '\0';
                              else
                                 s = null;
                              break;
                           case 'a':
                              if(strstr(s, "and then give GDB the following command"))
                                 s[0] = '\0';
                              else
                                 s = null;
                              break;
                           case ' ':
                              if(strstr(s, "/path/to/gdb") || strstr(s, "target remote | /usr/lib/valgrind/../../bin/vgdb --pid="))
                                 s[0] = '\0';
                              else
                                 s = null;
                              break;
                           case '-':
                              if(strstr(s, "--pid is optional if only one valgrind process is running"))
                                 s[0] = '\0';
                              else
                                 s = null;
                              break;
                           case 'U':
                              if((s = strstr(s, "; rerun with -h for copyright info")))
                              {
                                 s[0] = '\0';
                                 s = null;
                              }
                              break;
                           case '\0':
                              break;
                           default:
                              s = null;
                              break;
                        }
                        if(lastLineEmpty && t[0] != '\0')
                           lastLineEmpty = false;
                     }
                     if(!s)
                        ide.outputView.debugBox.Logf("%s\n", &dynamicBuffer[0]);
                  }
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
         else if(debugger.state == stopped)
         {
/*#ifdef _DEBUG
            printf("Got end of file from GDB!\n");
#endif*/
            app.Unlock();
            Sleep(0.2);
            app.Lock();
         }
      }
      delete dynamicBuffer;
      _dpcl(_dpct, dplchan::debuggerCall, 0, "ValgrindLogThreadExit");
      //if(oldValgrindHandle == vgLogFile)
         debugger.GdbThreadExit/*ValgrindLogThreadExit*/();
      delete oldValgrindHandle;
      app.Unlock();
      return 0;
   }
}

class ValgrindTargetThread : Thread
{
   Debugger debugger;

   unsigned int Main()
   {
      static char output[4096];
      Array<char> dynamicBuffer { minAllocSize = 4096 };
      DualPipe oldValgrindHandle = vgTargetHandle;
      incref oldValgrindHandle;

      app.Lock();
      while(debugger.state != terminated && vgTargetHandle && !vgTargetHandle.Eof())
      {
         int result;
         app.Unlock();
         result = (int)vgTargetHandle.Read(output, 1, sizeof(output));
         app.Lock();
         if(debugger.state == terminated || !vgTargetHandle || vgTargetHandle.Eof())
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
                  dynamicBuffer[Max(0, dynamicBuffer.count - 1)] = '\0';
#ifdef _DEBUG
                  // printf("%s\n", dynamicBuffer.array);
#endif
                  ide.outputView.debugBox.Logf("%s\n", &dynamicBuffer[0]);

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
      //if(oldValgrindHandle == vgTargetHandle)
         debugger.ValgrindTargetThreadExit();
      delete oldValgrindHandle;
      app.Unlock();
      return 0;
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
         result = (int)gdbHandle.Read(output, 1, sizeof(output));
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
                  // _dplf(0, dynamicBuffer.array);
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
            _dplf(0, "Got end of file from GDB!");
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
      //bool result = true;
      //bool fileCreated = false;
      //mode_t mask = 0600;
      static char output[1000];
      int fd = 0;

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
         //int selectResult;
         time.tv_sec = 1;
         time.tv_usec = 0;
         FD_ZERO(&rs);
         FD_ZERO(&es);
         FD_SET(fd, &rs);
         FD_SET(fd, &es);
         /*selectResult = */select(fd + 1, &rs, null, null, &time);
         if(FD_ISSET(fd, &rs))
         {
            int result = (int)read(fd, output, sizeof(output)-1);
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
   property char * name { set { delete name; if(value) name = CopyString(value); } }
   char * val;
   property char * val { set { delete val; if(value) val = CopyString(value); } }

   void Free()
   {
      delete name;
      delete val;
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
   property char * addr { set { delete addr; if(value) addr = CopyString(value); } }
   char * func;
   property char * func { set { delete func; if(value) func = CopyString(value); } }
   int argsCount;
   OldList args;
   char * from;
   property char * from { set { delete from; if(value) from = CopyUnescapedUnixPath(value); } }
   char * file;
   property char * file
   {
      set
      {
         delete file;
         if(value)
         {
            const char * rightFile;
            file = CopyUnescapedUnixPath(value);
            rightFile = ide.workspace.getRightPath(file);
            if(rightFile)
            {
               delete file;
               file = CopyString(rightFile);
            }
         }
      }
   }
   char * absoluteFile;
   property char * absoluteFile
   {
      set
      {
         delete absoluteFile;
         if(value)
         {
            const char * rightFile;
            absoluteFile = CopyUnescapedUnixPath(value);
            rightFile = ide.workspace.getRightPath(absoluteFile);
            if(rightFile)
            {
               delete absoluteFile;
               absoluteFile = CopyString(rightFile);
            }
         }
      }
   }
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
   DebuggerReason reason;
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
         if(reason == signalReceived)
         {
            delete name;
            delete meaning;
         }
         else if(reason == functionFinished)
         {
            delete gdbResultVar;
            delete returnValue;
         }
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
   int id;
   char * number;
   property char * number { set { delete number; if(value) number = CopyString(value); } }
   char * type;
   property char * type { set { delete type; if(value) type = CopyString(value); } }
   char * disp;
   property char * disp { set { delete disp; if(value) disp = CopyString(value); } }
   bool enabled;
   char * addr;
   property char * addr { set { delete addr; if(value) addr = CopyString(value); } }
   char * func;
   property char * func { set { delete func; if(value) func = CopyString(value); } }
   char * file;
   property char * file { set { delete file; if(value) file = CopyUnescapedUnixPath(value); } }
   char * fullname;
   property char * fullname { set { delete fullname; if(value) fullname = CopyUnescapedUnixPath(value); } }
   int line;
   char * at;
   property char * at { set { delete at; if(value) at = CopyString(value); } }
   int times;

   Array<GdbDataBreakpoint> multipleBPs;

   void Print()
   {
   _dplf(0, "");
      PrintLn("{", "#", number, " T", type, " D", disp, " E", enabled, " H", times, " (", func, ") (", file, ":", line, ") (", fullname, ") (", addr, ") (", at, ")", "}");
   }

   void Free()
   {
      delete type;
      delete disp;
      delete addr;
      delete func;
      delete file;
      delete at;
      if(multipleBPs) multipleBPs.Free();
      delete multipleBPs;
      delete number;
      delete fullname;
   }

   ~GdbDataBreakpoint()
   {
      Free();
   }
}

class Breakpoint : struct
{
   class_no_expansion;

public:
   property const char * function { set { delete function; if(value) function = CopyString(value); } get { return function; } isset { return function && *function; } }
   property const char * relativeFilePath { set { delete relativeFilePath; if(value) relativeFilePath = CopyString(value); } get { return relativeFilePath; } isset { return relativeFilePath && *relativeFilePath; } }
   property const char * absoluteFilePath { set { delete absoluteFilePath; if(value) absoluteFilePath = CopyString(value); } }
   property bool disabled { set { enabled = !value; } get { return !enabled; } isset { return !enabled; } }
   property int ignore { set { ignore = value; } get { return ignore; } isset { return ignore > 0; } }
   property int level { set { level = value; } get { return level; } isset { return level > -1; } }
   int line;
   Watch condition;

private:
   char * function;
   char * relativeFilePath;
   char * absoluteFilePath;
   bool enabled;
   int ignore;
   int level;
   char * location;
   int hits;
   int breaks;
   bool inserted;
   BreakpointType type;
   DataRow row;
   GdbDataBreakpoint bp;
   Project project;
   char * address;
   property const char * address { set { delete address; if(value) address = CopyString(value); } }

   enabled = true;

   void ParseLocation()
   {
      char * prjName = null;
      char * filePath = null;
      char * file;
      char * line;
      char fullPath[MAX_LOCATION];
      if(location[0] == '(' && location[1] && (file = strchr(location+2, ')')) && file[1])
      {
         prjName = new char[file-location];
         strncpy(prjName, location+1, file-location-1);
         prjName[file-location-1] = '\0';
         file++;
      }
      else
         file = location;
      if((line = strchr(file+1, ':')))
      {
         filePath = new char[strlen(file)+1];
         strncpy(filePath, file, line-file);
         filePath[line-file] = '\0';
         line++;
      }
      else
         filePath = CopyString(file);
      property::relativeFilePath = filePath;
      if(prjName)
      {
         for(prj : ide.workspace.projects)
         {
            if(!strcmp(prjName, prj.name))
            {
               if(prj.GetAbsoluteFromRelativePath(filePath, fullPath, null))
               {
                  property::absoluteFilePath = fullPath;
                  project = prj;
                  break;
               }
            }
         }
         if(line[0])
            this.line = atoi(line);
      }
      else
      {
         Project prj = ide.project;
         if(prj.GetAbsoluteFromRelativePath(filePath, fullPath, null))
         {
            property::absoluteFilePath = fullPath;
            project = prj;
         }
      }
      if(!absoluteFilePath)
         property::absoluteFilePath = "";
      delete prjName;
      delete filePath;
   }

   char * CopyLocationString(bool removePath)
   {
      char * location;
      char * file = relativeFilePath ? relativeFilePath : absoluteFilePath;
      bool removingPath = removePath && file;
      if(removingPath)
      {
         char * fileName = new char[MAX_FILENAME];
         GetLastDirectory(file, fileName);
         file = fileName;
      }
      if(function)
      {
         if(file)
            location = PrintString(file, ":", function);
         else
            location = CopyString(function);
      }
      else
         location = PrintString(file, ":", line);
      if(removingPath)
         delete file;
      return location;
   }

   char * CopyUserLocationString()
   {
      char * location;
      char * loc = CopyLocationString(false);
      Project prj = null;
      if(absoluteFilePath)
      {
         for(p : ide.workspace.projects; p != ide.workspace.projects.firstIterator.data)
         {
            if(p.topNode.FindByFullPath(absoluteFilePath, false))
            {
               prj = p;
               break;
            }
         }
      }
      if(prj)
      {
         location = PrintString("(", prj.name, ")", loc);
         delete loc;
      }
      else
         location = loc;
      return location;
   }

   void Save(File f)
   {
      if(relativeFilePath && relativeFilePath[0])
      {
         char * location = CopyUserLocationString();
         f.Printf("    * %d,%d,%d,%d,%s\n", enabled ? 1 : 0, ignore, level, line, location);
         delete location;
         if(condition)
            f.Printf("       ~ %s\n", condition.expression);
      }
   }

   void Free()
   {
      Reset();
      delete function;
      delete relativeFilePath;
      delete absoluteFilePath;
      delete location;
   }

   void Reset()
   {
      inserted = false;
      delete address;
      if(bp)
         bp.Free();
      delete bp;
   }

   ~Breakpoint()
   {
      Free();
   }

}

class Watch : struct
{
   class_no_expansion;

public:
   char * expression;

private:
   Type type;
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
   uint64 nextBlockAddress;

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
         for(temp = loc; (temp = strstr(temp, ":")); temp++)
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
                  codloc.absoluteFile = ide.workspace.CopyAbsolutePathFromRelative(loc);
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

void GDBFallBack(Expression exp, String expString)
{
   char * result;
   ExpressionType evalError = dummyExp;
   result = Debugger::EvaluateExpression(expString, &evalError);
   if(result)
   {
      FreeExpContents(exp);
      exp.constant = result;
      exp.type = constantExp;
   }
}
