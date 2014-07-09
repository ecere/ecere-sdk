namespace gui::drivers;

import "instance"

#define UNICODE

#if defined(__WIN32__)

#undef WINVER
#define WINVER 0x0500
#undef _WIN32_WINNT
#define _WIN32_WINNT 0x0501

#undef JOY_BUTTON1
#undef JOY_BUTTON2
#undef JOY_BUTTON3
#undef JOY_BUTTON4

#define WIN32_LEAN_AND_MEAN
#define Method _Method
#define byte _byte
#define int64 _int64
#define String _String
#define Mutex _Mutex
#define Platform _Platform
#include <windows.h>
#include <wincon.h>
#include <shellapi.h>


#if defined(ECERE_VANILLA)
#define ECERE_NOJOYSTICK
#endif

#ifndef ECERE_NODINPUT
#ifndef ECERE_NOJOYSTICK
#define DIRECTINPUT_VERSION 0x700
#include <dinput.h>
#else
#define DIRECTINPUT_VERSION 0x300
#endif

#endif

#include <mmsystem.h>

#include <imm.h>

#define VK_SEMI       0xBA
#define VK_EQUALS     0xBB
#define VK_COMMA      0xBC
#define VK_MINUS      0xBD
#define VK_PERIOD     0xBE
#define VK_SLASH      0xBF
#define VK_TILDE      0xC0
#define VK_LBRACKET   0xDB
#define VK_BACK_SLASH 0xDC
#define VK_RBRACKET   0xDD
#define VK_QUOTE      0xDE

#ifndef WM_MOUSEWHEEL
#define WM_MOUSEWHEEL 0x20A
#endif

#ifndef IDC_HAND
#define IDC_HAND (char *)0x7F89
#endif

#ifndef WS_EX_LAYERED

#define LWA_COLORKEY            0x00000001
#define LWA_ALPHA               0x00000002

#define WS_EX_LAYERED           0x00080000

WINUSERAPI
BOOL
WINAPI
SetLayeredWindowAttributes(
    HWND hwnd,
    COLORREF crKey,
    BYTE bAlpha,
    DWORD dwFlags);

#endif

#undef Method
#undef byte
#undef int64
#undef String
#undef Mutex
#undef Platform

import "Window"

#ifdef ECERE_VANILLA
#define ECERE_NODINPUT
#define ECERE_NOJOYSTICK
#define ECERE_NOBLENDING
#endif

static byte key2VK[256] =
{
   0,VK_ESCAPE,'1','2','3','4','5','6','7','8','9','0',VK_MINUS,VK_EQUALS,VK_BACK,VK_TAB,
   'Q','W','E','R','T','Y','U','I','O','P',VK_LBRACKET,VK_RBRACKET,VK_RETURN,VK_LCONTROL,'A','S',
   'D','F','G','H','J','K','L',VK_SEMI,VK_QUOTE,VK_TILDE,VK_LSHIFT,VK_BACK_SLASH,'Z','X','C','V',
   'B','N','M',VK_COMMA,VK_PERIOD,VK_DIVIDE,VK_RSHIFT,VK_MULTIPLY,VK_LMENU,VK_SPACE,VK_CAPITAL,VK_F1,VK_F2,VK_F3,VK_F4,VK_F5,
   VK_F6,VK_F7,VK_F8,VK_F9,VK_F10,VK_NUMLOCK,VK_SCROLL,VK_NUMPAD7,VK_NUMPAD8,VK_NUMPAD9,VK_SUBTRACT,VK_NUMPAD4,VK_NUMPAD5,VK_NUMPAD6,VK_ADD,VK_NUMPAD1,
   VK_NUMPAD2,VK_NUMPAD3,VK_NUMPAD0,VK_DELETE,0,0,0,VK_F11,VK_F12,0,0,0,0,0,0,0,
   0,VK_RCONTROL,0,0,VK_RMENU,0,VK_HOME,VK_UP,VK_PRIOR,VK_LEFT,VK_RIGHT,VK_END,VK_DOWN,VK_NEXT,VK_INSERT,VK_DELETE
};
static const uint16 className[] = L"Ecere Application";
static HINSTANCE hInstance;

static WPARAM lastBits;
static LPARAM lastRes;

static DEVMODE devMode;
#ifndef ECERE_NODINPUT
static HWND acquiredWindow = null;
#endif
static HCURSOR systemCursors[SystemCursor];
static bool fullScreenMode;
static int desktopX = 0, desktopY = 0, desktopW = 0, desktopH = 0;
static DWORD hiResTimer;
// static HWND topWindow;

static HWND startBar;

#ifndef ECERE_NODINPUT
#define NUMJOY    4
static HMODULE dInputDll = null;
static BOOL * (WINAPI * directInputCreate)(HINSTANCE, DWORD, IDirectInput **, void *);
static IDirectInput * dInput = null;
static IDirectInputDevice * directMouse = null;
#ifndef ECERE_NOJOYSTICK
static int numJoysticks = 0;
static IDirectInputDevice2 * directJoysticks[NUMJOY] = {null,null,null,null};
#endif
#endif

default:
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleDoubleClick;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonUp;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightDoubleClick;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonUp;

private:

static Box lastMonitorAreas[32];
static Box monitorAreas[32];
static int monitor;

static bool EnumerateMonitors(HMONITOR hMonitor, HDC hdcMonitor, LPRECT lprcMonitor, LPARAM dwData)
{
   MONITORINFO info = { 0 };
   info.cbSize = sizeof(MONITORINFO);
   GetMonitorInfo(hMonitor, &info);
   monitorAreas[monitor] = { info.rcWork.left, info.rcWork.top, info.rcWork.right, info.rcWork.bottom };
   monitor++;
   return monitor < 32;
}

static bool externalDisplayChange;

static int taskBarState;
static WINDOWPLACEMENT taskBarPlacement;
static bool activateApp;

static SystemCursor lastCursor = (SystemCursor)-1;

static void SmartShowWindow(HWND windowHandle, WindowState state, bool doActivate)
{
   int showCmd;
   if(state == maximized)
      showCmd = doActivate ? SW_SHOWMAXIMIZED : SW_MAXIMIZE;
   else if(state == minimized)
      showCmd = SW_MINIMIZE;
   else
      showCmd = doActivate ? SW_SHOWNORMAL : SW_SHOWNOACTIVATE;
   ShowWindow(windowHandle, showCmd);
}

void AeroSnapPosition(Window window, int x, int y, int w, int h)
{
   int oldX = window.absPosition.x;

   // To prevent having a window < minClientSize with Aero Snap, because we don't receive a WM_SIZING!
   // The sensible implementation of this is in WM_SIZING
   {
      int gw = w, gh = h;
      MinMaxValue ew, eh;
      window.GetDecorationsSize(&ew, &eh);

      gw -= ew;
      gh -= eh;

      gw = Max(gw, 1);
      gh = Max(gh, 1);

      gw = Max(gw, window.minSize.w);
      gh = Max(gh, window.minSize.h);
      gw = Min(gw, window.maxSize.w);
      gh = Min(gh, window.maxSize.h);

      if(!window.OnResizing(&gw, &gh))
      {
         gw = window.clientSize.w;
         gh = window.clientSize.h;
      }

      gw = Max(gw, window.skinMinSize.w);
      gh = Max(gh, window.skinMinSize.h);

      gw += ew;
      gh += eh;

      if(w != gw || h != gh)
      {
         bool move = false;
         // Adjust x position if we resized from top or bottom left corner
         if(x != oldX)
         {
            x += w - gw;
            move = true;
         }
         w = gw;
         h = gh;
         guiApp.interfaceDriver.PositionRootWindow(window, x, y, w, h, move, true);
      }
   }
   window.ExternalPosition(x, y, w, h);
}

class Win32Interface : Interface
{
   class_property(name) = "Win32";

   void ::RepositionDesktop(bool updateChildren)
   {
      int c;
      static double lastTime = 0, time;
      int x = 0, y = 0;
      int w = 0, h = 0;
      //static Size lastScreen;
      //static Point lastScreenPos;
      static double lastAutoHideCheck = 0;
      int newTaskBarState = taskBarState;
      HMONITOR primaryMonitor = 0;

      time = GetTime();
      if(time - lastTime < 0.1) return;
      lastTime = time;

      // Every sec, check for the auto hide property
      if(time - lastAutoHideCheck > 1)
      {
         APPBARDATA appBarData = { 0 };
         newTaskBarState = (int)SHAppBarMessage(ABM_GETSTATE, &appBarData);
         lastAutoHideCheck = time;
      }

      monitor = 0;
      EnumDisplayMonitors(null, null, EnumerateMonitors, 0);
      for(c = 0; c<monitor; c++)
      {
         if(monitorAreas[c].left != lastMonitorAreas[c].left ||
            monitorAreas[c].top != lastMonitorAreas[c].top ||
            monitorAreas[c].right != lastMonitorAreas[c].right ||
            monitorAreas[c].bottom != lastMonitorAreas[c].bottom)
         {
            break;
         }
      }

      memcpy(lastMonitorAreas, monitorAreas, sizeof(monitorAreas));

      guiApp.virtualScreen =
      {
         GetSystemMetrics(SM_CXVIRTUALSCREEN),
         GetSystemMetrics(SM_CYVIRTUALSCREEN)
      };
      guiApp.virtualScreenPos =
      {
         x = GetSystemMetrics(SM_XVIRTUALSCREEN),
         y = GetSystemMetrics(SM_YVIRTUALSCREEN)
      };

      {
         HMONITOR monitor = MonitorFromWindow(NULL, MONITOR_DEFAULTTOPRIMARY);
         if(monitor)
         {
            MONITORINFO info = { 0 };
            info.cbSize = sizeof(MONITORINFO);
            primaryMonitor = monitor;
            GetMonitorInfo(monitor, &info);
            x = info.rcMonitor.left;
            y = info.rcMonitor.top;
            w = info.rcMonitor.right - info.rcWork.left;
            h = info.rcMonitor.bottom - info.rcWork.top;
         }
      }

     {
         WINDOWPLACEMENT placement = { 0 };
         placement.length = sizeof(WINDOWPLACEMENT);

         if(!GetWindowPlacement(startBar, &placement))
         {
            startBar = FindWindowA("Shell_TrayWnd", null);
            GetWindowPlacement(startBar, &placement);
         }
         {
            HMONITOR taskBarMonitor = MonitorFromWindow(startBar, MONITOR_DEFAULTTONEAREST);
            if(primaryMonitor == taskBarMonitor)
            {
               if(placement.rcNormalPosition.top <= 0 && placement.rcNormalPosition.bottom >= h - 1)
               {
                  if(placement.rcNormalPosition.left <= 0)
                  {
                     x = (taskBarState & ABS_AUTOHIDE) ? 1 : placement.rcNormalPosition.right;
                     w -= x;
                  }
                  else
                     w = (taskBarState & ABS_AUTOHIDE) ? (w - 1) : Min(placement.rcNormalPosition.left, w);
               }
               else if(placement.rcNormalPosition.left <= 0 && placement.rcNormalPosition.right >= w - 1)
               {
                  if(placement.rcNormalPosition.top <= 0)
                  {
                     y = (taskBarState & ABS_AUTOHIDE) ? 1 : placement.rcNormalPosition.bottom;
                     h -= y;
                  }
                  else
                     h = (taskBarState & ABS_AUTOHIDE) ? (h - 1) : Min(placement.rcNormalPosition.top, h);
               }
            }
         }

        if(c < monitor ||
         placement.rcNormalPosition.left != taskBarPlacement.rcNormalPosition.left ||
         placement.rcNormalPosition.top != taskBarPlacement.rcNormalPosition.top ||
         placement.rcNormalPosition.right != taskBarPlacement.rcNormalPosition.right ||
         placement.rcNormalPosition.bottom != taskBarPlacement.rcNormalPosition.bottom  ||
         newTaskBarState != taskBarState)
         {
            taskBarState = newTaskBarState;
            guiApp.desktop.size.w = 0;
            desktopX = x;
            desktopY = y;
            desktopW = w;
            desktopH = h;
            taskBarPlacement = placement;
            guiApp.SetDesktopPosition(x, y, w, h, updateChildren);
         }

         //lastScreen = guiApp.virtualScreen;
         //lastScreenPos = guiApp.virtualScreenPos;
      }
   }

   /****************************************************************************
      /// PRIVATE UTILITY FUNCTIONS /////////////
   ****************************************************************************/
   // --- Keyboard Input ---
   bool ::ProcessKeyMessage(Window window, DWORD msg, WPARAM wParam, LPARAM lParam, unichar ch)
   {
      bool result = true;
      Key code = 0;
      Key key;
      // UNICODE FIX
      bool frenchShift = (ch < 0x10000) ? (((VkKeyScan((uint16)ch) >> 8) & 6) == 6) : false;

      if(msg == WM_CHAR || msg == WM_DEADCHAR)
      {
         wParam = 0;
         lParam = 0;
      }
      if(msg == WM_MOUSEWHEEL)
         code = (((short) HIWORD(wParam)) < 0) ? wheelDown : wheelUp;
      else
      {
         key = (byte)((lParam & 0xFF0000)>>16);
         if(lParam & 0x1000000)
         {
            key = Interface::GetExtendedKey(key);
            if(!key)
            {
               if(wParam == 0xb3)
                  key = KeyCode::play;
            }
         }
         code = key;
      }

      if(msg == WM_MOUSEWHEEL)
      {
         if(::GetAsyncKeyState(VK_SHIFT) & 0x80000)
            code.shift = true;
         if(::GetAsyncKeyState(VK_CONTROL) & 0x80000)
            code.ctrl = true;
         if(::GetAsyncKeyState(VK_MENU) & 0x80000)
            code.alt = true;

         result = window.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit, code, 0);
      }
      else
      {
         if(key != leftShift && key != rightShift && ::GetKeyState(VK_SHIFT) & 0x80000)
            code.shift = true;
         if(key != leftControl && key != rightControl && ::GetKeyState(VK_CONTROL) & 0x80000 && !frenchShift)
            code.ctrl = true;
         if(key != leftAlt && key != rightAlt && ::GetKeyState(VK_MENU) & 0x80000 && !frenchShift)
            code.alt = true;
         /*
         byte ch = Interface::TranslateKeykey, code.shift);
         if(::GetKeyState(VK_CAPITAL))
            ch = toupper(ch);
         */

         if(msg == WM_KEYUP || msg == WM_SYSKEYUP)
         {
            result = window.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp, code, ch);
         }
         else
         {
            if(!(lParam & 0x40000000))
            {
               /*
               {
                  char string[256];
                  Class * keyClass = eSystem_FindClass(__ecereModule, "Key");
                  code.OnGetString(string, null, null);
                  eSystem_Logf("%s\n", string);
               }
               */

               result = window.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown, code, ch);
            }
            else if(key<128)
               result = window.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit, code,ch);
         }
      }

      return result;
   }

   // --- Window procedure ---
   DWORD CALLBACK ::ApplicationWindow(HWND windowHandle, UINT msg, WPARAM wParam, LPARAM lParam)
   {
#ifdef _WIN64
      Window window = (Window)GetWindowLongPtr(windowHandle, GWLP_USERDATA);
#else
      Window window = (Window)GetWindowLong(windowHandle, GWL_USERDATA);
#endif
      static Point lastPos;
      if(window)
      {
         int x = 0,y = 0;
         unichar ch = 0;
         switch(msg)
         {
            case WM_QUERYNEWPALETTE:
            case WM_PALETTECHANGED:
               if(window.display)
                  window.display.RestorePalette();
               UpdateWindow(windowHandle);
               break;
            case WM_NCACTIVATE:
            {
               if(!fullScreenMode && !guiApp.IsModeSwitching())
               {
                  if(wParam)
                  {
                     Window modalRoot = window.FindModal();

                     HWND modalWindow = modalRoot ? modalRoot.windowHandle : null;

                     FLASHWINFO flashInfo = { 0 };
                     flashInfo.cbSize = sizeof(FLASHWINFO);
                     flashInfo.hwnd = window.windowHandle;
                     flashInfo.uCount = 0;
                     flashInfo.dwFlags = FLASHW_STOP;
                     FlashWindowEx((void *)&flashInfo);

                     if(modalWindow && modalWindow != windowHandle)
                        modalRoot.ExternalActivate(true, true, window, null);
                     else
                        window.ExternalActivate(true, true, window, null);
                  }
                  else
                  {
                     HWND foreground;
                     DWORD id;
                     void * windowLong;
                     foreground = GetForegroundWindow();
                     if(foreground == windowHandle && lParam)
                        foreground = (HWND)lParam;

                     GetWindowThreadProcessId(foreground, &id);

#ifdef _WIN64
                     windowLong = (void*)GetWindowLongPtr(foreground, GWLP_WNDPROC);
#else
                     windowLong = (void*)GetWindowLong(foreground, GWL_WNDPROC);
#endif
#if !defined(ECERE_VANILLA) && !defined(ECERE_NO3D)
                     // The != ApplicationWindow check is for not recognizing the Console window as an Ecere Window
                     // That check causes a problem with the OpenGL driver which seems to popup a window of a different class
                     if(window.displaySystem && window.displaySystem.driver == class(OpenGLDisplayDriver))
                        windowLong = (void *)ApplicationWindow;
#endif
                     if(id != GetCurrentProcessId() || windowLong != (void *)ApplicationWindow)
                        window.ExternalActivate(false, true, window, null);
                     // DefWindowProc for WM_NCACTIVATE draws the decorations, make sure it's drawn in the right state
                     return (uint)DefWindowProc(windowHandle, msg, window.active, lParam);
                  }
               }
               if(activateApp)
               {
                  for(window = guiApp.desktop.firstChild; window; window = window.next)
                     SetWindowPos(window.windowHandle, window.style.stayOnTop ? HWND_TOPMOST : HWND_TOP, 0,0,0,0,
                        SWP_NOACTIVATE|SWP_NOCOPYBITS|SWP_NOMOVE|SWP_NOSIZE); //|SWP_NOREDRAW);
                  activateApp = false;
               }

               return (uint)DefWindowProc(windowHandle, msg, window ? window.active : wParam, lParam);
            }
            case WM_ACTIVATEAPP:
               if(!guiApp.IsModeSwitching())
               {
                  if(fullScreenMode)
                  {
                     HDC hdc = GetDC(windowHandle);
                     if(wParam != TRUE)
                     {
                        guiApp.SetAppFocus(false);
                        ShowWindow(windowHandle, SW_MINIMIZE);
                        ChangeDisplaySettings(null,0);
                        SetSystemPaletteUse(hdc, SYSPAL_STATIC);
                     }
                     else
                     {
                        ChangeDisplaySettings(&devMode, CDS_FULLSCREEN);
                        SetSystemPaletteUse(hdc, SYSPAL_NOSTATIC);
                        if(window.display)
                           window.display.RestorePalette();
                        ShowWindow(windowHandle, SW_SHOWNORMAL);
                        guiApp.SetAppFocus(true);
                        if(window.display)
                           window.display.Resize(window.clientSize.w, window.clientSize.h);
                        window.Update(null);
                     }
                     ReleaseDC(windowHandle, hdc);
                  }
                  else
                  {
                     //Window window;

                     if(wParam && !guiApp.desktop.active /*&& lParam != GetCurrentThreadID()*/)
                     {
                        activateApp = true;
                        /*
                        for(window = guiApp.desktop.firstChild; window; window = window.next)
                           SetWindowPos(window.windowHandle, window.style.stayOnTop ? HWND_TOPMOST : HWND_TOP, 0,0,0,0,
                              SWP_NOACTIVATE|SWP_NOCOPYBITS|SWP_NOMOVE|SWP_NOSIZE); //|SWP_NOREDRAW);
                        */
                     }
                     guiApp.SetAppFocus((bool)wParam);
                  }
               }
               else
                  guiApp.SetAppFocus((bool)wParam);
               break;
            case WM_PAINT:
            {
               if(!window.alphaBlend || window.display.pixelFormat != pixelFormat888)
               {
                  PAINTSTRUCT ps;

/*
#define ACCESS_ITEM(l, id) \
      ((FastItem)(((id) == -1) ? null : (((byte *)((l).items)) + (id) * (l).itemSize)))
*/

#define ACCESS_ITEM(l, id) \
   id

                  BoxItem item = window.dirtyArea.count ? (BoxItem)ACCESS_ITEM(window.dirtyArea, window.dirtyArea.first) : null;

                  BeginPaint(windowHandle, &ps);

                  // Prevent flickering if we're going to update anyways
                  /*
                  printf("   Paint message (%d, %d)-(%d, %d)\n",
                     item ? item.box.left : 0,
                     item ? item.box.top : 0,
                     item ? item.box.right : 0,
                     item ? item.box.bottom : 0);
                  */
                  // Causes redraw bug...
                  if(!window.manageDisplay || !item ||
                     item.box.left > 0 ||
                     item.box.top > 0 ||
                     item.box.right < window.size.w - 1 ||
                     item.box.bottom < window.size.h - 1)
                  {
                     Box box { ps.rcPaint.left, ps.rcPaint.top, ps.rcPaint.right-1, ps.rcPaint.bottom-1 };
                     window.UpdateDirty(box);
                  }
                     // TODO: Fix precompiler with
                     // window.UpdateDirty((Box *)&ps.rcPaint);
                  EndPaint(windowHandle, &ps);
               }
               break;
            }
            case WM_DISPLAYCHANGE:
            {
               if(!guiApp.fullScreenMode && (lastBits != wParam || lastRes != lParam))
               {
                  RECT rect;
                  HWND foregroundWindow = GetForegroundWindow();
                  int w = LOWORD(lParam);
                  int h = HIWORD(lParam);

                  GetWindowRect(foregroundWindow, &rect);
                  if(rect.right == w && rect.bottom == h)
                     break;

                  lastBits = wParam;
                  lastRes = lParam;

                  externalDisplayChange = true;
                  if(guiApp.desktop.DisplayModeChanged())
                  {
                     char caption[2048];
                     if(!window.style.hidden)
                        SmartShowWindow(window.windowHandle, (window.nativeDecorations && window.state == maximized) ? maximized : normal, false);
                     window.FigureCaption(caption);
                     SetRootWindowCaption(window, caption);
                  }
                  externalDisplayChange = false;
               }
               break;
            }
            // Keyboard Messages
            case WM_SYSKEYDOWN:
            case WM_KEYDOWN:
            case WM_SYSKEYUP:
            case WM_KEYUP:
            case WM_CHAR:
            //case WM_DEADCHAR:
            {
               MSG charMsg;
               DWORD min = 0, max = 0;

               if(msg != WM_CHAR && window.composing)
                  break;

               switch(msg)
               {
                  case WM_SYSKEYDOWN: min = max = WM_SYSCHAR; break;
                  case WM_KEYDOWN: min = max = WM_CHAR; break;
                  case WM_SYSKEYUP: min = WM_SYSCHAR; max = WM_SYSDEADCHAR; break;
                  case WM_KEYUP: min = WM_CHAR; max = WM_DEADCHAR; break;
               }

               // This is very annoying.
               // PeekMessage somehow invokes this function directly... don't know why.
               // Only crashes when running through debug mode in visual studio
               incref window;
               if(msg == WM_CHAR || msg == WM_DEADCHAR || PeekMessage(&charMsg, windowHandle, min, max, PM_REMOVE))
               {
                  ch = (msg == WM_CHAR || msg == WM_DEADCHAR) ? (unichar)wParam : (unichar)charMsg.wParam;
                  // TOCHECK: What is this for again? Fixing some obscure activation status?
                  // -- I believe this was somehow allowing 'unmaximizing', but was causing problems
                  // as there was no way to prevent AltEnter from doing so (e.g. when it is used for a node property)
                  // Worked around by fixing ProcessHotKeys to properly check for sysButtons in parent.parent when sys buttons
                  // are placed inside a menu bar for a document
                  /*
                  if(msg == WM_SYSKEYDOWN && ch == 13)
                  {
                     ShowWindow(window.windowHandle, window.state == maximized ? SW_MAXIMIZE : SW_SHOWNORMAL);
                     // This last line been commented out for a long time:
                     // window.ExternalActivate(true, true, window, null);
                  }
                  */
                  if(msg == WM_SYSKEYUP || msg == WM_KEYUP)
                  {
                     if(!ProcessKeyMessage(window, WM_KEYDOWN, 0x40000000, 0, ch))
                        break;
                  }
               }
            }
            case WM_MOUSEWHEEL:
               ProcessKeyMessage(window, msg, wParam, lParam, ch);
               if(window.composing && msg == WM_CHAR)
               {
                  COMPOSITIONFORM form;
                  Window caretOwner = guiApp.caretOwner;
                  if(caretOwner)
                  {
                     HIMC ctx = ImmGetContext(windowHandle);
                     form.dwStyle = CFS_POINT;
                     form.ptCurrentPos.x = caretOwner.caretPos.x - caretOwner.scroll.x + caretOwner.absPosition.x - window.absPosition.x + 4;
                     form.ptCurrentPos.y = caretOwner.caretPos.y - caretOwner.scroll.x + caretOwner.absPosition.y - window.absPosition.y + 2;
                     window.composing = true;
                     ImmSetCompositionWindow(ctx, &form);
                     ImmReleaseContext(windowHandle, ctx);
                  }
               }
               if(msg != WM_MOUSEWHEEL)
                  delete window;
               break;

            case WM_IME_STARTCOMPOSITION:
            {
               COMPOSITIONFORM form;
               Window caretOwner = guiApp.caretOwner;
               if(caretOwner)
               {
                  HIMC ctx = ImmGetContext(windowHandle);
                  form.dwStyle = CFS_POINT;
                  form.ptCurrentPos.x = caretOwner.caretPos.x - caretOwner.scroll.x + caretOwner.absPosition.x - window.absPosition.x + 4;
                  form.ptCurrentPos.y = caretOwner.caretPos.y - caretOwner.scroll.y + caretOwner.absPosition.y - window.absPosition.y + 2;
                  /*
                  form.rcArea.left = window.caretPos.x;
                  form.rcArea.top = 250;
                  form.rcArea.right = 500;
                  form.rcArea.bottom = 300;
                  */
                  window.composing = true;
                  DefWindowProc(windowHandle, msg, wParam, lParam);
                  ImmSetCompositionWindow(ctx, &form);
                  ImmSetStatusWindowPos(ctx, &form.ptCurrentPos);
                  {
                     FontResource res = caretOwner.font;
                     LOGFONT font = { 0 };
                     HDC hdc = GetDC(0);
                     int pixels = GetDeviceCaps(hdc, LOGPIXELSY);
                     ReleaseDC(0, hdc);
                     font.lfHeight = -(int)((float)res.size * pixels / 72 + 0.5);
                     font.lfWeight = res.flags.bold ? FW_BOLD : FW_NORMAL;
                     font.lfItalic = res.flags.italic ? TRUE : FALSE,
                     font.lfUnderline = res.flags.underline ? TRUE : FALSE;
                     font.lfCharSet = DEFAULT_CHARSET;
                     font.lfOutPrecision = OUT_DEFAULT_PRECIS;
                     font.lfClipPrecision = CLIP_DEFAULT_PRECIS;
                     font.lfQuality = DEFAULT_QUALITY;
                     font.lfPitchAndFamily = (byte)(DEFAULT_PITCH|FF_DONTCARE); // TODO: Fix compiler 0 | 0 to produce byte, not int
                     UTF8toUTF16Buffer(res.faceName, font.lfFaceName, LF_FACESIZE);

                     ImmSetCompositionFont(ctx, &font);
                     ImmReleaseContext(windowHandle, ctx);
                  }
                  return 1;
               }
               break;
            }
            case WM_IME_ENDCOMPOSITION:
               window.composing = false;
               return (uint)DefWindowProc(windowHandle, msg, wParam, lParam);
            /*case WM_IME_COMPOSITION:
               return (uint)DefWindowProc(windowHandle, msg, wParam, lParam);
            case WM_IME_REQUEST:
               return (uint)DefWindowProc(windowHandle, msg, wParam, lParam);
            case WM_IME_NOTIFY:
               return (uint)DefWindowProc(windowHandle, msg, wParam, lParam);
            case WM_IME_KEYDOWN:
               return (uint)DefWindowProc(windowHandle, msg, wParam, lParam);
            case WM_IME_KEYUP:
               return (uint)DefWindowProc(windowHandle, msg, wParam, lParam);
            case WM_IME_SELECT:
               return (uint)DefWindowProc(windowHandle, msg, wParam, lParam);
            case WM_IME_SETCONTEXT:
               return (uint)DefWindowProc(windowHandle, msg, wParam, lParam);
            case WM_IME_CONTROL:
               return (uint)DefWindowProc(windowHandle, msg, wParam, lParam);
            case WM_IME_CHAR:
               return (uint)DefWindowProc(windowHandle, msg, wParam, lParam);
            case WM_IME_COMPOSITIONFULL:
               return (uint)DefWindowProc(windowHandle, msg, wParam, lParam);
            */
            case WM_NCHITTEST:
               if(window.nativeDecorations)
                  return (uint)DefWindowProc(windowHandle, msg, wParam, lParam);
               else
               // return HTCAPTION;
                  return HTCLIENT;

            // Mouse Messages
            case WM_LBUTTONUP:
            case WM_RBUTTONUP:
            case WM_MBUTTONUP:
            case WM_LBUTTONDOWN:
            case WM_LBUTTONDBLCLK:
            case WM_RBUTTONDOWN:
            case WM_RBUTTONDBLCLK:
            case WM_MBUTTONDOWN:
            case WM_MBUTTONDBLCLK:
            case WM_MOUSEMOVE:
               x = window.absPosition.x;
               y = window.absPosition.y;
            /*case WM_NCLBUTTONUP:
            case WM_NCRBUTTONUP:
            case WM_NCMBUTTONUP:
            case WM_NCLBUTTONDOWN:
            case WM_NCLBUTTONDBLCLK:
            case WM_NCRBUTTONDOWN:
            case WM_NCRBUTTONDBLCLK:
            case WM_NCMBUTTONDOWN:
            case WM_NCMBUTTONDBLCLK:*/
            case WM_NCMOUSEMOVE:
            {
               Modifiers code = 0;
               bool consequential = false;

               x += (short)LOWORD(lParam);
               y += (short)HIWORD(lParam);

               if(window.nativeDecorations && msg != WM_NCMOUSEMOVE)
               {
                  x += window.clientStart.x;
                  y += window.clientStart.y - (window.hasMenuBar ? skinMenuHeight : 0);
               }

               if(::GetKeyState(VK_SHIFT) & 0x80000)   code.shift = true;
               if(::GetKeyState(VK_CONTROL) & 0x80000) code.ctrl = true;
               if(::GetKeyState(VK_MENU) & 0x80000)    code.alt = true;
               if(wParam & MK_LBUTTON) code.left = true;
               if(wParam & MK_MBUTTON) code.middle = true;
               if(wParam & MK_RBUTTON) code.right = true;

               if(msg == WM_MOUSEMOVE)
               {
                  if(lastPos.x == x && lastPos.y == y)
                     consequential = true;
                  lastPos.x = x;
                  lastPos.y = y;
               }

               incref window;
               switch(msg)
               {
                  case WM_NCMOUSEMOVE:
                  case WM_MOUSEMOVE:
                     window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove, x,y,&code, consequential, false);
                     break;
                  //case WM_NCLBUTTONDBLCLK:
                  case WM_LBUTTONDBLCLK:
                     if(!window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick, x,y,&code, false, true))
                        break;
                  //case WM_NCLBUTTONDOWN:
                  case WM_LBUTTONDOWN:
                     window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown,x,y,&code, false,
                                             /*(msg == WM_LBUTTONDBLCLK) ? false: */true);
                     break;
                  //case WM_NCLBUTTONUP:
                  case WM_LBUTTONUP:      window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp, x,y,&code, false, false);break;
                  //case WM_NCMBUTTONDBLCLK:
                  case WM_MBUTTONDBLCLK:
                     if(!window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleDoubleClick, x,y,&code, false, false))
                        break;
                  //case WM_NCMBUTTONDOWN:
                  case WM_MBUTTONDOWN:
                     window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonDown, x,y,&code, false,
                                             (msg == WM_LBUTTONDBLCLK) ? false: true);
                     break;
                  //case WM_NCMBUTTONUP:
                  case WM_MBUTTONUP:
                     window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonUp, x,y,&code, false, false);
                     break;
                  //case WM_NCRBUTTONDBLCLK:
                  case WM_RBUTTONDBLCLK:
                     if(!window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightDoubleClick, x,y,&code, false, true))
                        break;
                  //case WM_NCRBUTTONDOWN:
                  case WM_RBUTTONDOWN:
                     window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown, x,y,&code, false,
                                             (msg == WM_LBUTTONDBLCLK) ? false: true);
                     break;
                  //case WM_NCRBUTTONUP:
                  case WM_RBUTTONUP:
                     window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonUp, x,y,&code, false, false);
                     break;
               }
               delete window;
               if(msg == WM_NCMOUSEMOVE)
                  return (uint)DefWindowProc(windowHandle, msg, wParam, lParam);
               break;
            }
            case WM_SETCURSOR:
            {
               if(window.nativeDecorations)
               {
                  if(DefWindowProc(windowHandle, msg, wParam, lParam))
                     return 1;
               }
               // SetCursor(systemCursors[0]);
               SetCursor((lastCursor == (SystemCursor)-1) ? null : systemCursors[lastCursor]);
               return 0;
            }
            case WM_EXITMENULOOP:
            case WM_EXITSIZEMOVE:
               // We had some DirectInput stuff in here
               break;
            case WM_ENTERMENULOOP:
            case WM_ENTERSIZEMOVE:
               // We had some DirectInput stuff in here
               break;
            case WM_CLOSE:
            {
               window.Destroy(0);
               return 0;
            }
            case WM_MOVE:
            {
               int x, y, w, h;
               WINDOWPLACEMENT placement = { 0 };
               RECT rcWindow;
               placement.length = sizeof(WINDOWPLACEMENT);
               GetWindowRect(windowHandle, &rcWindow);
               GetWindowPlacement(windowHandle, &placement);

               x = rcWindow.left - desktopX;
               y = rcWindow.top  - desktopY;
               w = rcWindow.right - rcWindow.left;
               h = rcWindow.bottom - rcWindow.top;

               AeroSnapPosition(window, x, y, w, h);
               break;
            }
            /*case WM_MOVING:
               break;*/
            case WM_SIZING:
            {
               RECT * rect = (RECT *)lParam;
               MinMaxValue ew, eh;
               int w, h;

               window.GetDecorationsSize(&ew, &eh);

               w = rect->right - rect->left;
               h = rect->bottom - rect->top;

               w -= ew;
               h -= eh;

               w = Max(w, 1);
               h = Max(h, 1);

               w = Max(w, window.minSize.w);
               h = Max(h, window.minSize.h);
               w = Min(w, window.maxSize.w);
               h = Min(h, window.maxSize.h);

               if(!window.OnResizing(&w, &h))
               {
                  w = window.clientSize.w;
                  h = window.clientSize.h;
               }

               w = Max(w, window.skinMinSize.w);
               h = Max(h, window.skinMinSize.h);

               w += ew;
               h += eh;

               if(wParam == WMSZ_BOTTOMLEFT || wParam == WMSZ_LEFT || wParam == WMSZ_TOPLEFT)
                  rect->left = rect->right - w;
               else
                  rect->right = rect->left + w;

               if(wParam == WMSZ_TOPLEFT || wParam == WMSZ_TOP || wParam == WMSZ_TOPRIGHT)
                  rect->top = rect->bottom - h;
               else
                  rect->bottom = rect->top + h;

               return 1;
            }
            case WM_SIZE:
            {
               if(window.nativeDecorations)
               {
                  int x, y, w, h;
                  RECT rcWindow;
                  GetWindowRect(windowHandle, &rcWindow);

                  if(wParam == SIZE_MAXIMIZED && window.state != maximized)
                     window.state = maximized;
                  else if(wParam == SIZE_MINIMIZED && window.state != minimized)
                     window.state = minimized;
                  else if(wParam == SIZE_RESTORED && window.state != normal && window.visible)
                     window.state = normal;

                  x = rcWindow.left - desktopX;
                  y = rcWindow.top  - desktopY;
                  w = rcWindow.right - rcWindow.left;
                  h = rcWindow.bottom - rcWindow.top;

                  AeroSnapPosition(window, x, y, w, h);
                  if(!guiApp.modeSwitching)
                     window.UpdateVisual(null);
               }
               else
                  return (uint)DefWindowProc(windowHandle, msg, wParam, lParam);
               break;
            }
            default:
               return (uint)DefWindowProc(windowHandle, msg, wParam, lParam);
         }
      }
      else
         return (uint)DefMDIChildProc(windowHandle, msg, wParam, lParam);
         // return DefWindowProc(windowHandle, msg, wParam, lParam);
      return 0;
   }

   // --- DirectInput ---

   #ifndef ECERE_NODINPUT

   #ifndef ECERE_NOJOYSTICK
   bool CALLBACK ::JoystickCallback( const DIDEVICEINSTANCE* pdidInstance, void * context )
   {
      if(!dInput->lpVtbl->CreateDevice(dInput, &GUID_Joystick,
         (IDirectInputDevice **)&directJoysticks[numJoysticks], null ))
         numJoysticks++;
      return DIENUM_CONTINUE;
   }

   bool CALLBACK ::JoystickAxesCallback( const DIDEVICEOBJECTINSTANCE* pdidoi, void * context )
   {
      DIPROPRANGE diprg;
      IDirectInputDevice2 * curJoy = (IDirectInputDevice2 *)context;

      diprg.diph.dwSize       = sizeof(DIPROPRANGE);
      diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER);
      diprg.diph.dwHow        = DIPH_BYOFFSET;
      diprg.diph.dwObj        = pdidoi->dwOfs;
      diprg.lMin              = -128;
      diprg.lMax              = 127;
      if(curJoy->lpVtbl->SetProperty(curJoy, DIPROP_RANGE, &diprg.diph))
         return DIENUM_STOP;
      return DIENUM_CONTINUE;
   }
   #endif

   void ::TerminateDirectInput()
   {
      int j;
      if (directMouse)
      {
         directMouse->lpVtbl->Unacquire(directMouse);
         directMouse->lpVtbl->Release(directMouse);
         directMouse = null;
      }
   #ifndef ECERE_NOJOYSTICK
      for(j=0; j<numJoysticks; j++)
      {
         if (directJoysticks[j])
         {
            directJoysticks[j]->lpVtbl->Unacquire(directJoysticks[j]);
            directJoysticks[j]->lpVtbl->Release(directJoysticks[j]);
            directJoysticks[j] = null;
         }
      }
      numJoysticks = 0;
   #endif
      if(dInput)
      {
         dInput->lpVtbl->Release(dInput);
         dInput = null;
      }

      directInputCreate = null;

      if(dInputDll)
      {
         FreeLibrary(dInputDll);
         dInputDll = null;
      }
   }

   bool ::InitDirectInput()
   {
      bool result = false;

      dInputDll = LoadLibraryA("dinput.dll");
      if(dInputDll)
      {
         if((directInputCreate = (void *)GetProcAddress(dInputDll, "DirectInputCreateA")))
         {
            if(!directInputCreate( hInstance, DIRECTINPUT_VERSION, &dInput, null ))
            {
               int j;

               // Mouse
               if(!dInput->lpVtbl->CreateDevice(dInput, &GUID_SysMouse, &directMouse, null ))
                  directMouse->lpVtbl->SetDataFormat(directMouse, &c_dfDIMouse );

   #ifndef ECERE_NOJOYSTICK
               // Joystick
               dInput->lpVtbl->EnumDevices(dInput, DIDEVTYPE_JOYSTICK, JoystickCallback, null, DIEDFL_ATTACHEDONLY );
               for(j=0; j<NUMJOY; j++)
                  if(directJoysticks[j])
                     if(!directJoysticks[j]->lpVtbl->SetDataFormat(directJoysticks[j], &c_dfDIJoystick ))
                        directJoysticks[j]->lpVtbl->EnumObjects(directJoysticks[j], JoystickAxesCallback, directJoysticks[j], DIDFT_AXIS );
   #endif
               result = true;
            }
         }
      }
      return result;
   }

   void ::AcquireDirectInput(HWND windowHandle, bool state)
   {
      if((state && !acquiredWindow) || (!state && acquiredWindow == windowHandle))
      {
         int j;
         if(directMouse)
         {
            if(state)
            {
               directMouse->lpVtbl->SetCooperativeLevel(directMouse, /*fullScreenMode ? */windowHandle /*: HWND_DESKTOP*/, DISCL_EXCLUSIVE|DISCL_FOREGROUND);
               directMouse->lpVtbl->Acquire(directMouse);
            }
            else
               directMouse->lpVtbl->Unacquire(directMouse);
         }
   #ifndef ECERE_NOJOYSTICK
         for(j = 0; j<NUMJOY; j++)
            if(directJoysticks[j])
            {
               if(state)
               {
                  directJoysticks[j]->lpVtbl->SetCooperativeLevel(directJoysticks[j], /*fullScreenMode ? */windowHandle /*: HWND_DESKTOP*/, DISCL_EXCLUSIVE|DISCL_FOREGROUND);
                  directJoysticks[j]->lpVtbl->Acquire(directJoysticks[j]);
               }
               else
                  directJoysticks[j]->lpVtbl->Unacquire(directJoysticks[j]);
            }
   #endif
         acquiredWindow = state ? windowHandle : null;
      }
   }
   #endif

   /****************************************************************************
      /// INTEGRATION FUNCTIONALITY /////////////
   ****************************************************************************/
   bool eisWIN32ProcessKey(Window window, DWORD msg, DWORD wParam, DWORD lParam, byte ch)
   {
      return ProcessKeyMessage(window, msg, wParam, lParam, ch);
   }

   HWND eisWIN32GetWindowHandle(Window window)
   {
      return window.windowHandle ? window.windowHandle : window.rootWindow.windowHandle;
   }

   /****************************************************************************
      /// DRIVER IMPLEMENTATION /////////////
   ****************************************************************************/

#ifdef _WIN64
   void CALLBACK ::TimerProc(UINT uTimerID, UINT uMsg, uint64 dwUser, uint64 dw1, uint64 dw2)
#else
   void CALLBACK ::TimerProc(UINT uTimerID, UINT uMsg, DWORD dwUser, DWORD dw1, DWORD dw2)
#endif
   {
      guiApp.SignalEvent();
   }

   // --- User Interface System ---
   bool Initialize()
   {
      WNDCLASS wcl =
      {
         CS_DBLCLKS, ApplicationWindow, 0L, 0L, 0,
         LoadIcon(null, IDI_APPLICATION),
         null,
         null,
         null,
         className
      };
      HDC hdc = GetDC(0);
      lastRes = MAKELPARAM(GetSystemMetrics(SM_CYSCREEN), GetSystemMetrics(SM_CXSCREEN));
      lastBits = (WPARAM)GetDeviceCaps(hdc, BITSPIXEL);
      ReleaseDC(0, hdc);

      AttachConsole(-1);
      wcl.hInstance = hInstance = GetModuleHandle(null);
      RegisterClass(&wcl);

      // Move that in reposition desktop
      startBar = FindWindowA("Shell_TrayWnd", null);

      systemCursors[arrow] = LoadCursor(null, IDC_ARROW);
      systemCursors[iBeam] = LoadCursor(null, IDC_IBEAM);
      systemCursors[cross] = LoadCursor(null, IDC_CROSS);
      systemCursors[moving] = LoadCursor(null, IDC_SIZEALL);
      systemCursors[sizeNESW] = LoadCursor(null, IDC_SIZENESW);
      systemCursors[sizeNS  ] = LoadCursor(null, IDC_SIZENS);
      systemCursors[sizeNWSE] = LoadCursor(null, IDC_SIZENWSE);
      systemCursors[sizeWE  ] = LoadCursor(null, IDC_SIZEWE);
      systemCursors[hand    ] = LoadCursor(null, IDC_HAND);

      SetTimer(null, 0, (DWORD)(1000.0 / 18.2), null);
      //SetTimer(null, 0, 1, null);
      /*
      timeBeginPeriod(1);

      hiResTimer = timeSetEvent(
         1000.0 / 250.0,
         1000.0 / 250.0,
         TimerProc,0,TIME_PERIODIC);
      */
      /*
      hiResTimer = timeSetEvent(
         1000.0 / 500.0,
         1000.0 / 500.0,
         TimerProc,0,TIME_PERIODIC);
         */

   /*
      topWindow = CreateWindowEx(0, className, "",WS_POPUP,0,0,1,1,HWND_DESKTOP,
         null, hInstance, null);
   */
      return true;
   }

   void Terminate()
   {
      if(hiResTimer) timeKillEvent(hiResTimer);
   #ifndef ECERE_NODINPUT
      TerminateDirectInput();
   #endif
   }

   void SetTimerResolution(uint hertz)
   {
      if(hiResTimer) timeKillEvent(hiResTimer);
      if(hertz)
         hiResTimer = timeSetEvent(1000 / hertz, 1000 / hertz, TimerProc, 0, TIME_PERIODIC);
   }

   bool ProcessInput(bool processAll)
   {
      MSG msg;
      if(!fullScreenMode)
         RepositionDesktop(true);
      if(PeekMessage(&msg,0,0,0,PM_NOREMOVE))
      {
         while(PeekMessage(&msg,0,0,0,PM_REMOVE))
         {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
            // printf("%d\n", msg.message);
            if(!processAll || msg.message == WM_TIMER) break;
         }
         return true;
      }
      return false;
   }

   void Wait()
   {
      MsgWaitForMultipleObjects(1, (void **)guiApp.semaphore, FALSE, (uint)(1000 / 18.2) /*INFINITE*/, QS_ALLINPUT);
   }

   void Lock(Window window)
   {

   }

   void Unlock(Window window)
   {

   }

   const char ** GraphicsDrivers(int * numDrivers)
   {
      static const char *graphicsDrivers[] = { "GDI", "DirectDraw", "OpenGL", "Direct3D", "Direct3D8", "Direct3D9" };
      *numDrivers = sizeof(graphicsDrivers) / sizeof(char *);
      return (const char **)graphicsDrivers;
   }

   void GetCurrentMode(bool * fullScreen, Resolution * resolution, PixelFormat * colorDepth, int * refreshRate)
   {
      *fullScreen = fullScreenMode;
      if(fullScreenMode)
      {
         Resolution c;
         for(c = 0; c<Resolution::enumSize; c++)
            if(GetResolutionWidth(c) == devMode.dmPelsWidth && GetResolutionHeight(c) == devMode.dmPelsHeight)
            {
               *resolution = c;
               break;
            }
         switch(devMode.dmBitsPerPel)
         {
            case 8: *colorDepth = pixelFormat8; break;
            case 16: *colorDepth = pixelFormat555; break;
            default: *colorDepth = pixelFormat888; break;
         }
         * refreshRate = devMode.dmDisplayFrequency;
      }
   }

   void EnsureFullScreen(bool *fullScreen)
   {

   }

   bool ScreenMode(bool fullScreen, Resolution resolution, PixelFormat colorDepth, int refreshRate, bool * textMode)
   {
      bool result = true;
      HDC hdc = GetDC(0);

      fullScreenMode = fullScreen;

      if(fullScreen)
      {
         FillBytes(&devMode, 0, sizeof(DEVMODE));
   	   devMode.dmSize = (uint16)sizeof(devMode);
         devMode.dmFields |=DM_BITSPERPEL;
         devMode.dmFields |=DM_PELSWIDTH|DM_PELSHEIGHT;
         devMode.dmFields |= DM_DISPLAYFREQUENCY;
         devMode.dmBitsPerPel = colorDepth ? GetDepthBits(colorDepth) : GetDeviceCaps(hdc, BITSPIXEL);
         devMode.dmPelsWidth = resolution ? GetResolutionWidth(resolution) : GetSystemMetrics(SM_CXSCREEN);
         devMode.dmPelsHeight = resolution ? GetResolutionHeight(resolution) : GetSystemMetrics(SM_CYSCREEN);
         devMode.dmDisplayFrequency = refreshRate ? refreshRate : GetDeviceCaps(hdc, VREFRESH);
         if(ChangeDisplaySettings(&devMode, CDS_FULLSCREEN) != DISP_CHANGE_SUCCESSFUL)
            result = false;
         else
         {
            SetSystemPaletteUse(hdc, SYSPAL_NOSTATIC);
            guiApp.SetDesktopPosition(0, 0, GetSystemMetrics(SM_CXSCREEN), GetSystemMetrics(SM_CYSCREEN), false);
         }
      }
      else
      {
         static bool firstTime = true;
         if(!firstTime)
            ChangeDisplaySettings(null, 0);
         firstTime = false;
         SetSystemPaletteUse(hdc, SYSPAL_STATIC);
         desktopX = desktopY = desktopW = desktopH = 0;

         RepositionDesktop(false);
      }
      ReleaseDC(0,hdc);

      return result;
   }

   // --- Window Creation ---
   void * CreateRootWindow(Window window)
   {
      HWND windowHandle;
      uint16 * text = UTF8toUTF16(window.text, null);
      if(fullScreenMode)
      {
         windowHandle = CreateWindowEx(0, className, text,
                        WS_POPUP,
                        0,0,GetSystemMetrics(SM_CXSCREEN),GetSystemMetrics(SM_CYSCREEN),
                        HWND_DESKTOP,
                        null, hInstance, null);
         ShowWindow(windowHandle, SW_SHOWNORMAL);
      }
      else if(window.systemParent)
         windowHandle = CreateWindowEx(0, className, text,
         WS_CHILD,0,0,1,1, window.systemParent, null, hInstance, null);
      else
      {
         DWORD style = 0;
         DWORD exStyle = 0;
         HWND parentWindow = null; //HWND_DESKTOP; // we get different behaviors with desktop...
         Window master = window.master, rootWindow = (master && master != guiApp.desktop) ? master.rootWindow : null;
         if(window.style.stayOnTop)
            exStyle |= WS_EX_TOPMOST;

         if(rootWindow && (window._isModal || window.style.interim))
            parentWindow = rootWindow.is3D ? rootWindow.parent.windowHandle : rootWindow.windowHandle;

         if(window.alphaBlend)
         // if(window.background.a < 255) //&& window.style & ES_REDRAW) Not needed anymore?
            exStyle |= WS_EX_LAYERED; // | WS_EX_TRANSPARENT;

         // Toolwindow will disappear if they don't have AppWindow set
         if(window.style.showInTaskBar || (!parentWindow && window.style.thin))
         {
            exStyle |= WS_EX_APPWINDOW;
            parentWindow = null;
         }

         if(window.style.thin)
            exStyle |= WS_EX_TOOLWINDOW;

         if(window.windowHandle)
            windowHandle = window.windowHandle;
         else
         {
            if(window.nativeDecorations)
            {
               BorderBits borderStyle = window.borderStyle; // FIXME!
               style = WS_OVERLAPPED;
               if(borderStyle.fixed)
                  style |= WS_CAPTION;
               if(window.hasClose)
                  style |= WS_SYSMENU;
               if(borderStyle.sizable)
                  style |= WS_THICKFRAME;
               if(window.hasMinimize)
                  style |= WS_MINIMIZEBOX;
               if(window.hasMaximize)
                  style |= WS_MAXIMIZEBOX;
            }
            windowHandle = CreateWindowEx(
               exStyle,
               className, text,
               style | (window.systemParent ? WS_CHILD :
               (WS_POPUP | (window.style.hasMinimize ? WS_MINIMIZEBOX : 0))),
                  0,0,1,1, parentWindow, null, hInstance, null);
   #if 0
            if(exStyle & WS_EX_LAYERED)
               SetLayeredWindowAttributes(windowHandle, 0, 255 /*A(window.background)*/, LWA_ALPHA);
   #endif
         }
      }
      delete text;
#ifdef _WIN64
      SetWindowLongPtr(windowHandle, GWLP_USERDATA, (int64)window);
#else
      SetWindowLong(windowHandle, GWL_USERDATA, (DWORD)window);
#endif

      return windowHandle;
   }

   void DestroyRootWindow(Window window)
   {
      HICON oldIcon;
      int c, lockCount = guiApp.lockMutex.lockCount;
      for(c = 0; c < lockCount; c++)
         guiApp.lockMutex.Release();

      oldIcon = (HICON)SendMessage(window.windowHandle, WM_GETICON, ICON_BIG, 0);
#ifdef _WIN64
      if(oldIcon && oldIcon != (HICON)GetClassLongPtr(window.windowHandle, GCLP_HICON))
#else
      if(oldIcon && oldIcon != (HICON)GetClassLong(window.windowHandle, GCL_HICON))
#endif
         DestroyIcon(oldIcon);

   	ShowWindow(window.windowHandle, SW_HIDE);

#ifdef _WIN64
      SetWindowLongPtr(window.windowHandle, GWLP_USERDATA, (int64)null);
#else
      SetWindowLong(window.windowHandle, GWL_USERDATA, 0);
#endif
      DestroyWindow(window.windowHandle);

      for(c = 0; c < lockCount; c++)
         guiApp.lockMutex.Wait();

      window.windowHandle = null;
   }

   // -- Window manipulation ---

   void SetRootWindowCaption(Window window, const char * name)
   {
      uint16 * text = UTF8toUTF16(name, null);
      guiApp.Unlock();
      SetWindowText(window.windowHandle, text);
      guiApp.Lock();
      delete text;
   }

   void PositionRootWindow(Window window, int x, int y, int w, int h, bool move, bool resize)
   {
      int flags = SWP_NOZORDER|SWP_NOACTIVATE|SWP_NOCOPYBITS;

      if(!window.systemParent && !fullScreenMode)
      {
         x += desktopX;
         y += desktopY;
      }

      if(!move) flags |= SWP_NOMOVE;
      if(!resize) flags |= SWP_NOSIZE;

      /*if(move && resize)
      {
         flags |= SWP_NOMOVE;
         SetWindowPos(window.windowHandle, null, x, y, w, h, flags);
         flags &=~SWP_NOMOVE;
         flags |= SWP_NOSIZE;
      }*/
      if(!window.nativeDecorations || window.state != maximized || !window.visible || guiApp.modeSwitching)
         SetWindowPos(window.windowHandle, null, x, y, w, h, flags);
   }

   void OrderRootWindow(Window window, bool topMost)
   {
      SetWindowPos(window.windowHandle, topMost ? HWND_TOPMOST : HWND_NOTOPMOST, 0,0,0,0,
         SWP_NOACTIVATE|SWP_NOCOPYBITS|SWP_NOMOVE|SWP_NOSIZE|SWP_NOREDRAW);
   }

   void SetRootWindowColor(Window window)
   {
      if(window.alphaBlend && window.display.pixelFormat == pixelFormat888)
      {
         /*if(A(window.background) == 255)
         {
            if((style & WS_EX_LAYERED) == WS_EX_LAYERED)
               SetWindowLong(window.windowHandle, GWL_EXSTYLE, style &~WS_EX_LAYERED);
         }
         else*/
         {
#ifndef ECERE_NOBLENDING
            DWORD style = GetWindowLong(window.windowHandle, GWL_EXSTYLE);
            if((style & WS_EX_LAYERED) != WS_EX_LAYERED)
               SetWindowLong(window.windowHandle, GWL_EXSTYLE, style | WS_EX_LAYERED);
#endif
            // SetLayeredWindowAttributes(window.windowHandle, 0, 255 /*Max(A(window.background),1)*/, LWA_ALPHA);
         }
      }
   }

   void OffsetWindow(Window window, int * x, int * y)
   {
      if(window.systemParent)
      {
         POINT point = {*x,*y};
         ClientToScreen(GetParent(window.windowHandle), &point);
         *x = point.x;
         *y = point.y;
      }
   }

   void UpdateRootWindow(Window window)
   {
      UpdateWindow(window.windowHandle);
   }

   void SetRootWindowState(Window window, WindowState state, bool visible)
   {
      if(visible)
      {
         WindowState curState = window.state;
         *&window.state = state;
         switch(state)
         {
            case maximized:
            case normal:
               SmartShowWindow(window.windowHandle, window.nativeDecorations ? state : normal, (window.active || window.creationActivation == activate) && !externalDisplayChange);
               break;
            case minimized:
               ShowWindow(window.windowHandle, SW_MINIMIZE);
               break;
         }
         *&window.state = curState;
      }
      else
      {
         ShowWindow(window.windowHandle, SW_HIDE);
      }
   }

   void ActivateRootWindow(Window window)
   {
      if(!externalDisplayChange)
         SetForegroundWindow(window.windowHandle);
   }

   void FlashRootWindow(Window window)
   {
      FLASHWINFO flashInfo = { 0 };
      flashInfo.cbSize = sizeof(FLASHWINFO);
      flashInfo.hwnd = window.windowHandle;
      flashInfo.uCount = 1;
      flashInfo.dwFlags = FLASHW_TRAY; // FLASHW_ALL;
      guiApp.Unlock();
      FlashWindowEx((void *)&flashInfo);
      guiApp.Lock();
   }

   // --- Mouse-based window movement ---
   void StartMoving(Window window, int x, int y, bool fromKeyBoard)
   {
      if(!fullScreenMode && !window.systemParent)
         // Commented out for Chess game because AI thread takes over the moving of main window... Still required?
         //SetThreadPriority(GetCurrentThread(), THREAD_PRIORITY_IDLE);
         ; //SetThreadPriority(GetCurrentThread(), THREAD_PRIORITY_BELOW_NORMAL);
      if(fromKeyBoard)
      {
         SetWindowPos(window.windowHandle, HWND_TOPMOST, 0,0,0,0,SWP_NOMOVE|SWP_NOSIZE|SWP_NOACTIVATE);
         mouse_event(MOUSEEVENTF_LEFTDOWN, x, y, 0, 0);
         if(!window.stayOnTop)
            SetWindowPos(window.windowHandle, HWND_NOTOPMOST, 0,0,0,0,SWP_NOMOVE|SWP_NOSIZE|SWP_NOACTIVATE);
      }
   }

   void StopMoving(Window window)
   {
      if(!fullScreenMode && !window.systemParent)
         SetThreadPriority(GetCurrentThread(), THREAD_PRIORITY_NORMAL);
   }

   // -- Mouse manipulation ---

   void GetMousePosition(int *x, int *y)
   {
      POINT point;
      GetCursorPos(&point);
      *x = point.x;
      *y = point.y;
   }

   void SetMousePosition(int x, int y)
   {
      SetCursorPos(x, y);
   }

   void SetMouseRange(Window window, Box box)
   {
      ClipCursor((RECT *) box);
   }

   void SetMouseCapture(Window window)
   {
      if(window)
         SetCapture(window.windowHandle);
      else
         ReleaseCapture();
   }

   // -- Mouse cursor ---

   void SetMouseCursor(Window window, SystemCursor cursor)
   {
      if(lastCursor != cursor)
      {
         lastCursor = cursor;
         SetCursor((cursor == (SystemCursor)-1) ? null : systemCursors[cursor]);
      }
   }

   // --- Caret ---

   void SetCaret(int x, int y, int size)
   {

   }

   // --- Clipboard manipulation ---

   void ClearClipboard()
   {
   	if(OpenClipboard(null))
   	{
         EmptyClipboard();
   	   CloseClipboard();
      }
   }

   bool AllocateClipboard(ClipBoard clipBoard, uint size)
   {
      bool result = false;
      clipBoard.text = new byte[size];
      result = true;
      return result;
   }

   bool SaveClipboard(ClipBoard clipBoard)
   {
      bool result = false;
      if(clipBoard.text)
      {
         int wordCount;
         uint16 * u16text = UTF8toUTF16(clipBoard.text, &wordCount);
         wordCount++;
         clipBoard.handle = GlobalAlloc(GHND | GMEM_DDESHARE, wordCount * 2);
         if(clipBoard.handle)
         {
            uint16 * text = GlobalLock(clipBoard.handle);
            if(text)
            {
               memcpy(text, u16text, wordCount * 2);
               GlobalUnlock(clipBoard.handle);
         	   if(OpenClipboard(null))
         	   {
                  EmptyClipboard();
         	      if(SetClipboardData(CF_UNICODETEXT, clipBoard.handle))
                  {
         	         CloseClipboard();
                     result= true;
                  }
               }
            }
            if(!result)
               GlobalFree(clipBoard.handle);
         }
         delete u16text;
      }
      return result;
   }

   bool LoadClipboard(ClipBoard clipBoard)
   {
      bool result = false;
   	if(OpenClipboard(null))
   	{
         if((clipBoard.handle = GetClipboardData(CF_UNICODETEXT)))
         {
            uint16 * u16text = GlobalLock(clipBoard.handle);
            if(u16text)
            {
               clipBoard.text = UTF16toUTF8(u16text);
               result = true;
               GlobalUnlock(clipBoard.handle);
            }
         }
         CloseClipboard();
      }
      return result;
   }

   void UnloadClipboard(ClipBoard clipBoard)
   {
      delete clipBoard.text;
   }

   // --- State based input ---

   bool AcquireInput(Window window, bool state)
   {
   #ifndef ECERE_NODINPUT
      if(dInput || InitDirectInput())
      {
         AcquireDirectInput(window.windowHandle, state);
         return true;
      }
   #endif
      return false;
   }

   bool GetMouseState(MouseButtons * buttons, int * x, int * y)
   {
      bool result = false;
   #ifndef ECERE_NODINPUT
      DIMOUSESTATE dims = {0};

      if(acquiredWindow && directMouse)
      {
         if(directMouse->lpVtbl->GetDeviceState(directMouse, sizeof(DIMOUSESTATE), &dims ))
         {
            FillBytes(&dims, 0, sizeof(dims));
            directMouse->lpVtbl->Acquire(directMouse);
         }
         result = true;
      }
      /*  We don't really want this...
      else
      {
         if(GetAsyncKeyState(VK_LBUTTON))
            dims.rgbButtons[0] |= 0x80;
         if(GetAsyncKeyState(VK_RBUTTON))
            dims.rgbButtons[1] |= 0x80;
         if(GetAsyncKeyState(VK_MBUTTON))
            dims.rgbButtons[2] |= 0x80;
      }
      */

      if(x)*x = dims.lX;
      if(y)*y = dims.lY;
      if(dims.lZ)
      {
#ifdef _WIN64
         Window window = (Window)GetWindowLongPtr(acquiredWindow, GWLP_USERDATA);
#else
         Window window = (Window)GetWindowLong(acquiredWindow, GWL_USERDATA);
#endif
         ProcessKeyMessage(window, WM_MOUSEWHEEL, ((uint16)(short)dims.lZ) << 16, 0, 0);
      }
      if(buttons)
      {
         *buttons = MouseButtons {
             left = (dims.rgbButtons[0] & 0x80) ? true : false,
             right = (dims.rgbButtons[1] & 0x80) ? true : false,
             middle = (dims.rgbButtons[2] & 0x80) ? true : false };
      }
   #endif

      return result;
   }

   bool GetJoystickState(int device, Joystick joystick)
   {
      bool result = false;
   #ifndef ECERE_NODINPUT
      if(joystick != null)
      {
         DIJOYSTATE dijs = {0};
   #ifndef ECERE_NOJOYSTICK
         if(acquiredWindow && device < numJoysticks)
         {
            if(directJoysticks[device])
            {
               directJoysticks[device]->lpVtbl->Poll(directJoysticks[device]);
               if(directJoysticks[device]->lpVtbl->GetDeviceState(directJoysticks[device], sizeof(DIJOYSTATE), &dijs ))
                  directJoysticks[device]->lpVtbl->Acquire(directJoysticks[device]);
               result = true;
            }
         }
   #endif
         joystick.x = dijs.lX;
         joystick.y = dijs.lY;
         joystick.z = dijs.lZ;
         joystick.rx = dijs.lRx;
         joystick.ry = dijs.lRy;
         joystick.rz = dijs.lRz;
         joystick.buttons =
              ((dijs.rgbButtons[0] & 0x80) ? JOY_BUTTON1 : 0)
            | ((dijs.rgbButtons[1] & 0x80) ? JOY_BUTTON2 : 0)
            | ((dijs.rgbButtons[2] & 0x80) ? JOY_BUTTON3 : 0)
            | ((dijs.rgbButtons[3] & 0x80) ? JOY_BUTTON4 : 0);
      }
   #endif
      return result;
   }

   bool GetKeyState(Key key)
   {
      bool keyState = false;
      if(key < 256 || key == alt || key == shift || key == control)
      {
         uint ks = 0;
         if(key == alt)
            ks = GetAsyncKeyState(VK_MENU);
         else if(key == control)
            ks = GetAsyncKeyState(VK_CONTROL);
         else if(key == shift)
            ks = GetAsyncKeyState(VK_SHIFT);
         else if(key2VK[key])
            ks = GetAsyncKeyState(key2VK[key]);
         keyState = (ks & 0x80000) ? true : false;
      }
      else if(key == capsState)
         keyState = (::GetKeyState(VK_CAPITAL) & 0x00000001) != 0;
      else if(key == numState)
         keyState = (::GetKeyState(VK_NUMLOCK) & 0x00000001) != 0;
      else if(key == scrollState)
         keyState = (::GetKeyState(VK_SCROLL) & 0x00000001) != 0;
      return keyState;
   }

   bool SetIcon(Window window, BitmapResource resource)
   {
      HICON icon = null;
      HICON oldIcon = (HICON)SendMessage(window.windowHandle, WM_GETICON, ICON_BIG, 0);

      // Dialogs Inherit master's icon if none set
      if(!window.style.showInTaskBar && window.hasClose)
      {
         Window master = window.master;
         while(master && !resource)
         {
            Window rootWindow = (master && master != guiApp.desktop) ? master.rootWindow : null;
            if(rootWindow && rootWindow.icon)
               resource = rootWindow.icon;
            else
               master = master.master;
         }
      }

      // WARNING -- putting this here as it is right after CreateRootWindow
      // Take out Layered flag if we're not in 24 bit
      {
         if(window.alphaBlend && window.display.pixelFormat != pixelFormat888)
         {
#ifndef ECERE_NOBLENDING
            DWORD style = GetWindowLong(window.windowHandle, GWL_EXSTYLE);
            style &= ~WS_EX_LAYERED;
            SetWindowLong(window.windowHandle, GWL_EXSTYLE, style);
#endif
         }
      }

#ifdef _WIN64
      if(oldIcon && oldIcon != (HICON)GetClassLongPtr(window.windowHandle, GCLP_HICON))
#else
      if(oldIcon && oldIcon != (HICON)GetClassLong(window.windowHandle, GCL_HICON))
#endif
      {
         DestroyIcon(oldIcon);
      }

      if(resource)
      {
         Bitmap bitmap { };
         if(bitmap.Load(resource.fileName, null, null))
         {
            Bitmap and { };
            PixelFormat format = window.display.pixelFormat;
            int bits = GetDepthBits(format);
            bool blend;

            bitmap.Convert(null, pixelFormat888, null);
            and.Allocate(null, (bitmap.width+7/8), bitmap.height, 0, pixelFormat8, false);

            blend = bits == 32 || bitmap.pixelFormat != pixelFormat888;

            {
               byte * picture = and.picture;
               int c = 0;
               int b = 0;
               uint size = bitmap.height * bitmap.width;
               while(c < size)
               {
                  int m = 0;
                  byte mask = 0;
                  while(m < 8 && c < size)
                  {
                     mask <<= 1;
                     mask |= blend ? (!((ColorAlpha *)bitmap.picture)[c].a) : (((ColorAlpha *)bitmap.picture)[c].a <= 192);
                     c++;
                     m++;
                  }
                  picture[b++] = mask;
               }
               c = 0;
               while(c < size)
               {
                  ColorAlpha color = ((ColorAlpha *)bitmap.picture)[c];
                  if(blend ? (!color.a) : (color.a <= 192))
                  {
                     color.color = { 0, 0, 0 };
                     ((ColorAlpha *)bitmap.picture)[c] = color;
                  }
                  c++;
               }
            }
            if(bits == 15) { bits = 16; format = pixelFormat565; };
            bitmap.Convert(null, format, null);

            icon = CreateIcon(hInstance, bitmap.width, bitmap.height, 1, (byte)bits, and.picture, bitmap.picture);
            delete and;
         }
         delete bitmap;
      }
      SendMessage(window.windowHandle, WM_SETICON, ICON_BIG, (LPARAM)icon);
      SendMessage(window.windowHandle, WM_SETICON, ICON_SMALL, (LPARAM)icon);
      return true;
   }

   void ::GetScreenArea(Window window, Box box)
   {
      HMONITOR monitor = MonitorFromWindow(window.windowHandle, MONITOR_DEFAULTTONEAREST);
      HMONITOR taskBarMonitor = MonitorFromWindow(startBar, MONITOR_DEFAULTTONEAREST);
      if(monitor)
      {
         MONITORINFO info = { 0 };
         info.cbSize = sizeof(MONITORINFO);
         GetMonitorInfo(monitor, &info);
         // box = { info.rcWork.left, info.rcWork.top, info.rcWork.right, info.rcWork.bottom };
         box = { info.rcMonitor.left, info.rcMonitor.top, info.rcMonitor.right-1, info.rcMonitor.bottom-1 };

         if(taskBarMonitor == monitor)
         {
            if(taskBarPlacement.rcNormalPosition.top <= box.top && taskBarPlacement.rcNormalPosition.bottom >= box.bottom)
            {
               if(taskBarPlacement.rcNormalPosition.left <= box.left)
               {
                  if(taskBarState & ABS_AUTOHIDE)
                     box.left++;
                  else
                     box.left = taskBarPlacement.rcNormalPosition.right;
               }
               else if(taskBarState & ABS_AUTOHIDE)
                  box.right -= 1;
               else
                  box.right = taskBarPlacement.rcNormalPosition.left;
            }
            else if(taskBarPlacement.rcNormalPosition.left <= box.left && taskBarPlacement.rcNormalPosition.right >= box.right)
            {
               if(taskBarPlacement.rcNormalPosition.top <= box.top)
               {
                  if(taskBarState & ABS_AUTOHIDE)
                     box.top += 1;
                  else
                     box.top = taskBarPlacement.rcNormalPosition.bottom;
               }
               else if(taskBarState & ABS_AUTOHIDE)
                  box.bottom -= 1;
               else
                  box.bottom = taskBarPlacement.rcNormalPosition.top;
            }
         }

         box.left -= desktopX;
         box.top -= desktopY;
         box.right -= desktopX;
         box.bottom -= desktopY;
      }
   }
}

#endif
