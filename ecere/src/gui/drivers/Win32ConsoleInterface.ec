namespace gui::drivers;

import "instance"

#if defined(__WIN32__)

#define WIN32_LEAN_AND_MEAN
#define Method _Method
#define String _String
#include <windows.h>
#include <mmsystem.h>

#undef Method
#undef String

import "Display"

default:
WINBASEAPI HWND WINAPI GetConsoleWindow (); 

private:

static HANDLE hStdin, hStdout, hInactive;
static byte keys[256];
static Point mousePosition;
static Box mouseRange;

default:
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp;

extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightDoubleClick;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleDoubleClick;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonUp;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonUp;

private:

/****************************************************************************
   /// DRIVER IMPLEMENTATION /////////////
****************************************************************************/

class Win32ConsoleInterface : Interface
{
   class_property(name) = "Win32Console";

   // --- User Interface System ---
   bool Initialize()
   {
      CONSOLE_CURSOR_INFO cursor;

      // FreeConsole();
      AllocConsole();
      {
         WINDOWPLACEMENT placement = { 0 };

         placement.length = sizeof(WINDOWPLACEMENT);
         placement.showCmd = SW_NORMAL;
         placement.rcNormalPosition.top = 10;
         placement.rcNormalPosition.left = 10;
         placement.rcNormalPosition.right = 810;
         placement.rcNormalPosition.bottom = 610;
         SetWindowPlacement(GetConsoleWindow(), &placement);
         ShowWindow(GetConsoleWindow(), SW_SHOW);
         SetForegroundWindow(GetConsoleWindow());
      }

      hStdin = GetStdHandle(STD_INPUT_HANDLE);
      SetConsoleMode(hStdin, ENABLE_WINDOW_INPUT | ENABLE_MOUSE_INPUT);
      hStdout = GetStdHandle(STD_OUTPUT_HANDLE);
      //SetConsoleMode(hStdout, 0);
      FillBytes(keys, 0, sizeof(keys));

      SetConsoleTitle(guiApp.desktop.text ? guiApp.desktop.text : "");
      cursor.bVisible = FALSE;
      cursor.dwSize = 100;
      SetConsoleCursorInfo(hStdout, &cursor);
      SetTimer(null, 0, (uint)(1000.0 / 18.2), null);

   	return true;
   }

   void Terminate()
   {
      CONSOLE_CURSOR_INFO cursor;
      SetConsoleMode(hStdout, ENABLE_PROCESSED_OUTPUT);
      cursor.bVisible = TRUE;
      cursor.dwSize = 100;
      SetConsoleCursorInfo(hStdout, &cursor);
      DumpErrors(true);

      // ShowWindow(GetConsoleWindow(), SW_HIDE);
      /*
      FreeConsole();
      if(AllocConsole())
      */
      {
         // SetForegroundWindow(GetActiveWindow());
         WINDOWPLACEMENT placement = { 0 };
         placement.length = sizeof(WINDOWPLACEMENT);
         placement.showCmd = SW_HIDE;
         SetWindowPlacement(GetConsoleWindow(), &placement);
      }
   }

   bool ProcessInput(bool processAll)
   {
      int numInput, c;
      GetNumberOfConsoleInputEvents(hStdin, &numInput);
      if(numInput)
      {
         for(c = 0; c<numInput; c++)
         {
            INPUT_RECORD event;
            int readInputs;
            ReadConsoleInput(hStdin, &event, 1, &readInputs);
            switch(event.EventType)
            {
               case KEY_EVENT:
               {
                  byte key = (byte)event.Event.KeyEvent.wVirtualScanCode;
                  byte ch = event.Event.KeyEvent.uChar.AsciiChar;
                  Key keyFlags;

                  if(event.Event.KeyEvent.dwControlKeyState & ENHANCED_KEY)
                     key = (byte)GetExtendedKey(key);

                  keyFlags = key;
                  if(event.Event.KeyEvent.dwControlKeyState&SHIFT_PRESSED)
                     keyFlags.shift = true;
                  if(event.Event.KeyEvent.dwControlKeyState&LEFT_ALT_PRESSED ||
                     event.Event.KeyEvent.dwControlKeyState&RIGHT_ALT_PRESSED)
                     keyFlags.alt = true;
                  if(event.Event.KeyEvent.dwControlKeyState&LEFT_CTRL_PRESSED ||
                     event.Event.KeyEvent.dwControlKeyState&RIGHT_CTRL_PRESSED)
                     keyFlags.ctrl = true;

                  if(event.Event.KeyEvent.bKeyDown)
                  {
                     if(keys[key])
                        guiApp.desktop.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit,keyFlags,ch);
                     else
                     {
                        keys[key] = (byte)bool::true;
                        guiApp.desktop.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown,keyFlags,ch);
                     }
                  }
                  else
                  {
                     keys[key] = (byte)bool::false;   
                     guiApp.desktop.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp,keyFlags,ch);
                  }
                  break;
               }
               case MOUSE_EVENT:
               {
                  Modifiers keyFlags = 0;
                  static MouseButtons lastButtonState = 0;
                  MouseButtons buttonState = event.Event.MouseEvent.dwButtonState;

                  if(event.Event.MouseEvent.dwControlKeyState&SHIFT_PRESSED)
                     keyFlags.shift = true;
                  if(event.Event.MouseEvent.dwControlKeyState&LEFT_ALT_PRESSED ||
                     event.Event.MouseEvent.dwControlKeyState&RIGHT_ALT_PRESSED)
                     keyFlags.alt = true;
                  if(event.Event.MouseEvent.dwControlKeyState&LEFT_CTRL_PRESSED ||
                     event.Event.MouseEvent.dwControlKeyState&RIGHT_CTRL_PRESSED)
                     keyFlags.ctrl = true;

                  switch(event.Event.MouseEvent.dwEventFlags)
                  {
                     case MOUSE_MOVED:
                     {
                        int x = event.Event.MouseEvent.dwMousePosition.X * textCellW;
                        int y = event.Event.MouseEvent.dwMousePosition.Y * textCellH;

                        x = Min(Max(x, mouseRange.left), mouseRange.right);
                        y = Min(Max(y, mouseRange.top), mouseRange.bottom);

                        if(x != mousePosition.x || y != mousePosition.y)
                        {
                           mousePosition.x = x;
                           mousePosition.y = y;
                           guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove, x, y, &keyFlags, false, false);
                        }
                        break;
                     }
                     case DOUBLE_CLICK:
                        if(buttonState.left && !(lastButtonState.left))
                        {
                           if(!guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick,
                              mousePosition.x, mousePosition.y, &keyFlags, false, true))
                              break;
                        }
                        else if(buttonState.middle && !(lastButtonState.middle))
                        {
                           if(!guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleDoubleClick,
                              mousePosition.x, mousePosition.y, &keyFlags, false, true))
                              break;
                        }
                        else if(buttonState.right && !(lastButtonState.right))
                        {
                           if(!guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightDoubleClick,
                              mousePosition.x, mousePosition.y, &keyFlags, false, true))
                              break;
                        }
                     default:
                        if(buttonState.left && !(lastButtonState.left))
                           guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown,
                              mousePosition.x, mousePosition.y, &keyFlags, false, 
                              (event.Event.MouseEvent.dwEventFlags == DOUBLE_CLICK) ? false : true) ;
                        else if(buttonState.middle && !(lastButtonState.middle))
                           guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonDown,
                              mousePosition.x, mousePosition.y, &keyFlags, false,
                              (event.Event.MouseEvent.dwEventFlags == DOUBLE_CLICK) ? false : true);
                        else if(buttonState.right && !(lastButtonState.right))
                           guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown,
                              mousePosition.x, mousePosition.y, &keyFlags, false,
                              (event.Event.MouseEvent.dwEventFlags == DOUBLE_CLICK) ? false : true);
                        else if(!(buttonState.left) && lastButtonState.left)
                           guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp,
                              mousePosition.x, mousePosition.y, &keyFlags, false, false);
                        else if(!(buttonState.middle) && lastButtonState.middle)
                           guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonUp,
                              mousePosition.x, mousePosition.y, &keyFlags, false, false);
                        else if(!(buttonState.right) && lastButtonState.right)
                           guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonUp,
                              mousePosition.x, mousePosition.y, &keyFlags, false, false);
                  }
                  lastButtonState = buttonState;
                  break;
               }
               case WINDOW_BUFFER_SIZE_EVENT:
               {
                  COORD coord = 
                  { 
                     event.Event.WindowBufferSizeEvent.dwSize.X,
                     event.Event.WindowBufferSizeEvent.dwSize.Y
                  };
                  SetConsoleScreenBufferSize(hStdout,coord);
                  guiApp.SetDesktopPosition(0,0, coord.X * textCellW, coord.Y * textCellH, true);
                  break;
               }
            }

            if(!processAll) break;
         }
         return true;
      }
      return false;
   }

   void Wait()
   {
      void * objects[2] = { hStdin, *((uint **)guiApp.semaphore) };
      if(MsgWaitForMultipleObjects(2, objects, FALSE, INFINITE, QS_TIMER) == WAIT_OBJECT_0 + 2)
      {
         MSG msg;
         GetMessage(&msg, null,0,0);
      }
   }

   void Lock(Window window)
   {

   }

   void Unlock(Window window)
   {

   }

   char ** GraphicsDrivers(int * numDrivers)
   {
      static char *graphicsDrivers[] = { "Win32Console" };
      *numDrivers = sizeof(graphicsDrivers) / sizeof(char *);
      return (char **)graphicsDrivers;
   }

   void GetCurrentMode(bool * fullScreen, Resolution * resolution, PixelFormat * colorDepth, int * refreshRate)
   {
      *fullScreen = true;
      *colorDepth = pixelFormatText;
   }

   void EnsureFullScreen(bool *fullScreen)
   {
      *fullScreen = true;
   }

   bool ScreenMode(bool fullScreen, Resolution resolution, PixelFormat colorDepth, int refreshRate, bool * textMode)
   {
      if(fullScreen)
      {
         CONSOLE_SCREEN_BUFFER_INFO info;

         ChangeDisplaySettings(null, 0);

         if(GetConsoleScreenBufferInfo(hStdout, &info))
         {
            COORD coord;
            coord.X = info.srWindow.Right+1;
            coord.Y = info.srWindow.Bottom+1;
            SetConsoleScreenBufferSize(hStdout,coord);
            guiApp.SetDesktopPosition(0,0, coord.X * textCellW, coord.Y * textCellH, false);
            *textMode = true;
            mouseRange.right = MAXINT;
            mouseRange.bottom = MAXINT;
   	      return true;
         }
      }
      return false;
   }

   // --- Window Creation ---
   void * CreateRootWindow(Window window)
   {
      return (void *) hStdout;
   }

   void DestroyRootWindow(void * windowHandle)
   {
   }

   // -- Window manipulation ---

   void SetRootWindowCaption(void * windowHandle, char * name)
   {
      if(windowHandle == guiApp.desktop)
         SetConsoleTitle(name);
   }

   void PositionRootWindow(void * windowHandle, int x, int y, int w, int h, bool move, bool resize)
   {
   }

   void OrderRootWindow(void * windowHandle, bool topMost)
   {
   }

   void SetRootWindowColor(Window window)
   {
   }

   void OffsetWindow(void * windowHandle, int * x, int * y)
   {

   }

   void UpdateRootWindow(void * windowHandle)
   {
   }

   void SetRootWindowState(void * windowHandle, int state, bool visible)
   {
   }

   void ActivateRootWindow(void * windowHandle)
   {
   }

   // --- Mouse-based window movement ---

   void StartMoving(void * windowHandle, int x, int y, bool fromKeyBoard)
   {
   }

   void StopMoving(void * windowHandle)
   {
   }

   // -- Mouse manipulation ---

   void GetMousePosition(int *x, int *y)
   {
      *x = mousePosition.x;
      *y = mousePosition.y;
   }

   void SetMousePosition(int x, int y)
   {
      mousePosition.x = x;
      mousePosition.y = y;
   }

   void SetMouseRange(Window window, Box box)
   {
      if(box != null)
      {
         mouseRange = box;
      }
      else
      {
         mouseRange.left = mouseRange.top = 0;
         mouseRange.right = mouseRange.bottom = MAXINT;
      }
   }

   void SetMouseCapture(void * windowHandle)
   {

   }

   // -- Mouse cursor ---

   void SetMouseCursor(int cursor)
   {

   }

   // --- Caret ---

   void SetCaret(int x, int y, int size)
   {
      COORD coords = { (short)(x / textCellW), (short)(y / textCellH) };
      CONSOLE_CURSOR_INFO cursor = 
      { 
         size ? size : 99, 
         (size && x >= 0 && y >= 0 && x < guiApp.desktop.clientSize.w && y < guiApp.desktop.clientSize.h) ? TRUE : FALSE
      };
      SetConsoleCursorInfo(hStdout, &cursor);
      SetConsoleCursorPosition(hStdout, coords);
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
      clipBoard.handle=GlobalAlloc(GHND | GMEM_DDESHARE, size);
      if(clipBoard.handle)
      {
         clipBoard.text=GlobalLock(clipBoard.handle);
         if(clipBoard.text)
            result = true;
         else
            GlobalFree(clipBoard.handle);
      }
      return result;
   }

   bool SaveClipboard(ClipBoard clipBoard)
   {
      bool status = false;
      if(clipBoard.handle)
      {
         GlobalUnlock(clipBoard.handle);
   	   if(OpenClipboard(null))
   	   {
            EmptyClipboard();
   	      if(SetClipboardData(CF_TEXT,clipBoard.handle))
            {
   	         CloseClipboard();
               status = true;
            }
         }
         if(!status)
            GlobalFree(clipBoard.handle);
      }
      return status;
   }

   bool LoadClipboard(ClipBoard clipBoard)
   {
      bool result = false;
   	if(OpenClipboard(null))
   	{
         if(clipBoard.handle = GetClipboardData(CF_TEXT))
         {
            if(clipBoard.text = GlobalLock(clipBoard.handle))
               result = true;
         }
         CloseClipboard();
      }
      return result;
   }

   void UnloadClipboard(ClipBoard clipBoard)
   {
      if(clipBoard.handle)
         GlobalUnlock(clipBoard.handle);
   }

   // --- State based input ---

   bool AcquireInput(void * windowHandle, bool state)
   {
      return false;
   }

   bool GetMouseState(MouseButtons * buttons, int * x, int * y)
   {
      bool result = false;

      return result;
   }

   bool GetJoystickState(int device, Joystick joystick)
   {
      bool result = false;

      return result;
   }

   bool GetKeyState(Key key)
   {
      if(key < 256)
         return keys[key];
      else if(key == capsState)
         return GetKeyState(VK_CAPITAL) & 0x00000001;
      else if(key == numState)
         return GetKeyState(VK_NUMLOCK) & 0x00000001;
      else if(key == scrollState)
         return GetKeyState(VK_SCROLL) & 0x00000001;
      return 0;
   }
};

#endif
