#undef __BlOCKS__

default:
#define uint _uint
#define String String_

#include <unistd.h>
#ifdef __WIN32__
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <tlhelp32.h>
#else

#define uint _uint
#define property _property
#define new _new
#define class _class
#define Window    X11Window
#define Cursor    X11Cursor
#define Font      X11Font
#define Display   X11Display
#define Time      X11Time
#define KeyCode   X11KeyCode

#include <signal.h>

#include <X11/Xatom.h>
#include <X11/Xlib.h>
#include <X11/Xresource.h>
#include <X11/Xutil.h>
#include <fcntl.h>

#undef Window
#undef Cursor
#undef Font
#undef Display
#undef Time
#undef KeyCode
#undef uint
#undef new
#undef property
#undef class

#endif
#undef uint
#undef String

private:

import "ecere"

#ifdef __WIN32__
static bool CALLBACK EnumWindowsBringToTop(HWND hwnd, LPARAM lParam)
{
   DWORD pid;
   GetWindowThreadProcessId(hwnd, &pid);
   if(pid == lParam)
      BringWindowToTop(hwnd);
   return true;
}

static bool CALLBACK EnumWindowsSetForeground(HWND hwnd, LPARAM lParam)
{
   DWORD pid;
   GetWindowThreadProcessId(hwnd, &pid);
   if(pid == lParam)
   {
      for(;;)
      {
         HWND parent = GetParent(hwnd);
         if(parent) hwnd = parent; else break;
      }
      SetForegroundWindow(hwnd); //SetForegroundWindow( GetAncestor(hwnd, GA_ROOTOWNER));
      return false;
   }
   return true;
}

class ShowProcessWindowsThread : Thread
{
   int processId;
   unsigned int Main()
   {
      if(processId)
      {
         EnumWindows(EnumWindowsSetForeground, processId);
         EnumWindows(EnumWindowsBringToTop, processId);
      }
      return 0;
   }
}
#else

extern void * IS_XGetDisplay();
static Atom xa_NET_WM_PID, xa_activeWindow;

#if 0
static void WaitForViewableWindow(X11Display * xGlobalDisplay, X11Window window)
{
   int c;
   XFlush(xGlobalDisplay);
   for(c = 0; c<4; c++)
   // while(true)
   {
      XWindowAttributes attributes = { 0 };
      XGetWindowAttributes(xGlobalDisplay, window, &attributes);
      if(attributes.map_state == IsViewable)
         break;
      else
         Sleep(1.0 / 18.2);
   }
}
#endif // 0

static void EnumWindowBringToTop(X11Display * xGlobalDisplay, X11Window window, int processId)
{
   Atom xa_type;
   X11Window root = 0, parent = 0, * children = null;
   uint numWindows = 0;
   int format;
   unsigned long len, fill;

   if(XQueryTree(xGlobalDisplay, window, &root, &parent, &children, &numWindows))
   {
      int c;
      for(c = 0; c<numWindows; c++)
      {
         byte * data;
         if(XGetWindowProperty(xGlobalDisplay, children[c], xa_NET_WM_PID, 0, 1, False,
                               XA_CARDINAL, &xa_type, &format, &len, &fill,
                               &data) != Success)
         {
            // printf("cant get _NET_WM_PID property\n");
            break;
         }

         if(data)
         {
            int pid = *(int *)data;
            //printf("pid: %d\n", pid);
            if(pid == processId)
            {
               // printf("Found one window with processID\n");
               {
                  // REVIEW: Is this what's causing display lock-up issues?
                  XRaiseWindow(xGlobalDisplay, children[c]);
                  // WaitForViewableWindow(xGlobalDisplay, children[c]);
                  if(xa_activeWindow)
                  {
                     XClientMessageEvent event = { 0 };
                     event.type = ClientMessage;
                     event.message_type = xa_activeWindow;
                     event.display = xGlobalDisplay;
                     event.serial = 0;
                     event.window = children[c];
                     event.send_event = 1;
                     event.format = 32;
                     event.data.l[0] = 0;

                     XSendEvent(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay), bool::false, SubstructureRedirectMask | SubstructureNotifyMask, (union _XEvent *)&event);
                  }
                  else
                  {
                     XSetInputFocus(xGlobalDisplay, children[c], RevertToPointerRoot, CurrentTime);
                  }
               }
            }
         }
         else
            EnumWindowBringToTop(xGlobalDisplay, children[c], processId);
      }
   }
   if(children)
      XFree(children);
}

#endif

void Process_ShowWindows(int processId)
{
#ifdef __WIN32__
   ShowProcessWindowsThread thread { processId = processId };
   thread.Create();
#else
   if(processId)
   {
      X11Display * xGlobalDisplay = IS_XGetDisplay();
      xa_NET_WM_PID = XInternAtom(xGlobalDisplay, "_NET_WM_PID", True);
      xa_activeWindow = XInternAtom(xGlobalDisplay, "_NET_ACTIVE_WINDOW", True);
      EnumWindowBringToTop(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay), processId);
   }
#endif
}

void Process_UngrabPointer(int processId)
{
#ifndef __WIN32__
   Execute("xdotool key XF86Ungrab");
#endif
}

bool Process_Break(int processId)
{
   bool result = false;
#ifdef __WIN32__
   HANDLE handle = OpenProcess(PROCESS_ALL_ACCESS, FALSE, processId);
   if(handle)
   {
      DWORD remoteThreadId;
      HANDLE hRemoteThread;
      static void * debugBreakAddress;
      if(!debugBreakAddress)
      {
         HINSTANCE hDll = LoadLibrary("kernel32");
         debugBreakAddress = GetProcAddress(hDll, "DebugBreak");
         FreeLibrary(hDll);
      }
      hRemoteThread = CreateRemoteThread(handle, null, 0, debugBreakAddress, 0, 0, &remoteThreadId);
      if(hRemoteThread)
      {
         //DebugBreakProcess(handle);  // this worked only in winxp, right?
         //GenerateConsoleCtrlEvent(CTRL_C_EVENT, processId);  // this had no effect, right?
         result = true;
         CloseHandle(hRemoteThread);
      }
      CloseHandle(handle);
   }
#else
   kill(processId, SIGTRAP);
   result = true;
#endif
   return result;
}

int Process_GetCurrentProcessId()
{
#ifdef __WIN32__
   DWORD currentProcessId = GetCurrentProcessId();
   return currentProcessId;
#else
   return (int)getpid();
#endif
}

int Process_GetChildExeProcessId(const int parentProcessId, const char * exeFile)
{
#ifdef __WIN32__
   HANDLE hProcessSnap;
   PROCESSENTRY32 pe32;

   int childProcessId = 0;

   hProcessSnap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);

   if(hProcessSnap != INVALID_HANDLE_VALUE)
   {
      pe32.dwSize = sizeof(PROCESSENTRY32);

      if(Process32First(hProcessSnap, &pe32))
      {
         do
         {
            if(pe32.th32ParentProcessID == parentProcessId)
            {
               //if(strstr(exeFile, pe32.szExeFile) == exeFile)
               if(SearchString(exeFile, 0, pe32.szExeFile, false, false) == exeFile)
               {
                  childProcessId = pe32.th32ProcessID;
                  break;
               }
            }
         } while(Process32Next(hProcessSnap, &pe32));
      }
      CloseHandle(hProcessSnap);
   }
   return childProcessId;
#elif defined(__linux__)
   char exeFileTruncated[16];
   FileListing listing { "/proc/" };
   // Names is limited to 15 characters in /proc/pid/status
   strncpy(exeFileTruncated, exeFile, 15);
   exeFileTruncated[15] = 0;
   while(listing.Find())
   {
      if(listing.stats.attribs.isDirectory)
      {
         int process = atoi(listing.name);
         if(process)
         {
            int ppid = 0;
            bool found = false;
            char fileName[256];
            File f;
            strcpy(fileName, listing.path);
            PathCat(fileName, "status");
            if((f = FileOpen(fileName, read)))
            {
               char buffer[256];
               while(f.GetLine(buffer, 256))
               {
                  if(!strncmp(buffer, "Name:", 5))
                  {
                     char * string = strstr(buffer + 6, exeFileTruncated);
                     if(!string || strcmp(string, exeFileTruncated))
                        break;
                     found = true;
                  }
                  else if(!strncmp(buffer, "PPid:", 5))
                  {
                     ppid = atoi(buffer + 6);
                     break;
                  }
               }
               delete f;
            }
            if(found && ppid == parentProcessId)
            {
               listing.Stop();
               return process;
            }
         }
      }
   }
   return 0;
#else
   // This is the current OS X implementation
   uint pid = 0;
   DualPipe f = DualPipeOpen({ output = true }, "ps -ajx");
   if(f)
   {
      bool firstLine = true;
      int pidColumn = -1;
      int ppidColumn = -1;
      while(!f.eof)
      {
         char line[1024];
         char * tokens[128];
         if(f.GetLine(line,sizeof(line)))
         {
            uint count = Tokenize(line, sizeof(tokens)/sizeof(tokens[0]), tokens,false);
            int i;
            if(firstLine)
            {
               for(i = 0; i < count; i++)
               {
                  if(!strcmpi(tokens[i], "pid"))
                     pidColumn = i;
                  else if(!strcmpi(tokens[i], "ppid"))
                     ppidColumn = i;
               }
               if(pidColumn > 0 && ppidColumn > 0)
                  firstLine = false;
               else
                  break;
            }
            else
            {
               if(count > pidColumn && count > ppidColumn && strtoul(tokens[ppidColumn], null, 0) == parentProcessId)
               {
                  pid = (uint)strtoul(tokens[pidColumn], null, 0);
                  break;
               }
            }
         }
      }
      f.Wait();
      delete f;
   }
   return pid;
#endif
}
