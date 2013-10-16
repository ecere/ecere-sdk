namespace gui::drivers;

import "instance"

#if (defined(__unix__) || defined(__APPLE__)) && !defined(__DOS__)

#undef __BLOCKS__
#define DBLCLICK_DELAY  0.3  // seconds
#define DBLCLICK_DELTA  1

// #define DEBUG_THREADS

#define bool CursesBool
#define uint _uint

#include <curses.h>

#undef bool

#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>

import "Interface"

#undef uint

static class Message : struct
{
   Message prev, next;
   uint vmid;
   int x, y;
   Key key;
};

static OldList messages;

static Window nCursesDesktop;
static Point mousePosition;
static Box mouseRange;
static int caretX, caretY, caretVisible;

#define TIMEOUT (1000 / 18.2)

static Key characters2Key[256] =
{
// K_PERIOD - DEL
   0,0,0,0,0,0,0,0,backSpace,tab,0,0,0,enter,0,0,
   leftShift,leftControl,0,0,capsLock,0,0,0,0,0,0,escape,0,0,0,0,
//   space,pageUp,pageDown,end,home,left,up,right,down,keyPad5,0,0,0,insert,period,0,
   space,k1,quote,k3,k4,k5,k7,quote,k9,k0,k8,equal,comma,minus,period,slash,
   k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,semicolon,semicolon,comma,equal,period,slash,
   k2,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,
   p,q,r,s,t,u,v,w,x,y,z,leftBracket,slash,rightBracket,k6,minus,
   quote,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,
   p,q,r,s,t,u,v,w,x,y,z,leftBracket,backSlash,rightBracket,quote,backSpace
};

static char * clipBoardData = null;

void ClearClipboard();

static Thread ncursesThread;
static Mutex ncursesMutex;
static bool ncursesTerminate;

/****************************************************************************
   /// PRIVATE UTILITIES /////////////
****************************************************************************/

static void AddMsg(uint vmid, int x, int y, Key key)
{
   messages.Add(Message { vmid = vmid, x = x, y = y, key = key });
}

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

static void AddMessagesToQueue(int ch)
{
   Key key = 0;
   Key keyFlags = 0;
   int ch1;
#ifdef NCURSES_VERSION
   MEVENT event;
#endif

   //timeout(0);
   for(; ch != ERR; ch = getch())
   {
      if(ch == 0x1B) //Escaped = true;
      {
         ch = getch();
#ifdef NCDEBUG
         fprintf(f, "  \\e: %d\n",ch);
#endif
         if((ch >= 'a' && ch <= 'z') || (ch >= '0' && ch <= '9'))
         {
            key = characters2Key[ch];
            keyFlags.alt = true;
         }
         else if(ch == '[')
         {
            ch = getch();
#ifdef NCDEBUG
            fprintf(f, "   [: %d\n",ch);
#endif
            ch1 = getch();
#ifdef NCDEBUG
            fprintf(f, "   MOD: %c\n",ch1);
#endif
            if(ch == '[')
            {
               if(ch1 == 'A') key = f1;
               else if(ch1 == 'B') key = f2;
               else if(ch1 == 'C') key = f3;
               else if(ch1 == 'D') key = f4;
               else if(ch1 == 'E') key = f5;
            }
            else
            {
               if(ch1 == '$') keyFlags.shift = true;
               else if(ch1 == '^') keyFlags.ctrl = true;
               else if(ch1 == '@') { keyFlags.shift = true; keyFlags.ctrl = true; }
               else if(ch1 != ERR)
                  ungetch(ch1);

               switch(ch)
               {
                  case '1': case '7': key = home; break;
                  case '2': key = insert; break;
                  case '3': key = del; break;
                  case '4': case '8': key = end; break;
                  case '5': key = pageUp; break;
                  case '6': key = pageDown; break;
                  case 'a': keyFlags.shift = true; case 'A': key = up; break;
                  case 'b': keyFlags.shift = true; case 'B': key = down; break;
                  case 'c': keyFlags.shift = true; case 'C': key = right; break;
                  case 'd': keyFlags.shift = true; case 'D': key = left; break;
                  case 'k': keyFlags.shift = true; key = tab; break;
               }
            }
            ch = 0;
         }
         else if(ch == 'O')
         {
            ch = getch();
#ifdef NCDEBUG
            fprintf(f, "   O: %d\n",ch);
#endif
            keyFlags.ctrl = true;
            switch(ch)
            {
               case 'a': key = up; break;
               case 'b': key = down; break;
               case 'c': key = right; break;
               case 'd': key = left; break;
            }
            ch = 0;
         }
         else
         {
            if(ch == ERR)
            {
               key = escape;
               ch = 27;
            }
            else
               ch = 0;
            /*else
            {
               ungetch(ch);
            }*/
         }
      }
      else if(ch<256)
      {
         key = characters2Key[ch];
         if(!key && ch <= 26)
         {
            keyFlags.ctrl = true;
            key = characters2Key[ch + 'a' - 1];
            ch += 'a' - 1;
         }
      }
      else
      {
         switch(ch)
         {
            case KEY_ENTER: key = enter; break;
            case KEY_BACKSPACE: key = backSpace; break;
            case KEY_LEFT: key = left; break;
            case KEY_RIGHT: key = right; break;
            case KEY_UP: key = up; break;
            case KEY_DOWN: key = down; break;
            case KEY_SLEFT: key = left; keyFlags.shift = true; break;
            case KEY_SRIGHT: key = right; keyFlags.shift = true; break;
//               case KEY_SUP: key = up; keyFlags.shift = true; break;
//               case KEY_SDOWN: key = down; keyFlags.shift = true; break;
            case 353: key = tab; keyFlags.shift = true; break;
            case 383:
               keyFlags.shift = true;
            case KEY_DC: key = del; break;
            case KEY_IC: case KEY_EIC: key = insert; break;
            case 362:
            case KEY_HOME: key = home; break;
            case 335:
               keyFlags.ctrl = true;
            case 385:
            case KEY_END: key = end; break;
            case KEY_SHOME: key = home; keyFlags.shift = true; break;
            case KEY_SEND: key = end; keyFlags.shift = true; break;
            case KEY_NPAGE: key = pageDown; break;
            case KEY_PPAGE: key = pageUp; break;

            // NCurses Extensions
#ifdef NCURSES_VERSION
            case KEY_RESIZE:
               resizeterm(LINES, COLS);
               guiApp.SetDesktopPosition(0,0, COLS * textCellW, LINES * textCellH, true);
               break;
            case KEY_MOUSE:
            {
               static double lastTime[3];
               static Point lastPos[3];
               int x, y;
               getmouse(&event);
               x = Min(Max(event.x * textCellW, mouseRange.left), mouseRange.right);
               y = Min(Max(event.y * textCellH, mouseRange.top), mouseRange.bottom);
               if(mousePosition.x != x || mousePosition.y != y)
               {
                  mousePosition.x = x;
                  mousePosition.y = y;

                  AddMsg(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove, x, y, key);
               }
               if(event.bstate & BUTTON1_PRESSED)
               {
                  Time time = GetTime();
                  if(time - lastTime[0] < DBLCLICK_DELAY &&
                     Abs(mousePosition.x - lastPos[0].x) < DBLCLICK_DELTA &&
                     Abs(mousePosition.y - lastPos[0].y) < DBLCLICK_DELTA)
                     AddMsg(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick, x, y, keyFlags);
                  else
                     AddMsg(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown, x, y, keyFlags);
                  lastTime[0] = time;
                  lastPos[0] = mousePosition;
               }
               if(event.bstate & BUTTON1_RELEASED)
                  AddMsg(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp, x, y, keyFlags);
               if(event.bstate & BUTTON3_PRESSED)
               {
                  Time time = GetTime();
                  if(time - lastTime[2] < DBLCLICK_DELAY &&
                     Abs(mousePosition.x - lastPos[2].x) < DBLCLICK_DELTA &&
                     Abs(mousePosition.y - lastPos[2].y) < DBLCLICK_DELTA)
                     AddMsg(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightDoubleClick, x, y, keyFlags);
                  else
                     AddMsg(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown, x, y, keyFlags);
                  lastTime[2] = time;
                  lastPos[2] = mousePosition;
               }
               if(event.bstate & BUTTON3_RELEASED)
                  AddMsg(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonUp, x, y, keyFlags);
               if(event.bstate & BUTTON2_PRESSED)
               {
                  Time time = GetTime();
                  if(time - lastTime[1] < DBLCLICK_DELAY &&
                     Abs(mousePosition.x - lastPos[1].x) < DBLCLICK_DELTA &&
                     Abs(mousePosition.y - lastPos[1].y) < DBLCLICK_DELTA)
                     AddMsg(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleDoubleClick, x, y, keyFlags);
                  else
                     AddMsg(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonDown, x, y, keyFlags);
                  lastTime[1] = time;
                  lastPos[1] = mousePosition;
               }
               if(event.bstate & BUTTON2_RELEASED)
                  AddMsg(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonUp,  x, y, keyFlags);
               break;
            }
#endif
         }
         if(ch >= KEY_F(1) && ch <= KEY_F(12))
            key = (Key)f1 + ch-KEY_F(1);
         if(ch >= KEY_F(13) && ch <= KEY_F(24))
         {
            key = (Key)f1 + ch-KEY_F(13);
            keyFlags.shift = true;
         }
         ch = 0;
      }
      if(key)
      {
         key |= keyFlags;
         AddMsg(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown, ch, 1, key);
         AddMsg(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp, ch, 0, key);
      }
   }
}

static uint NCursesThread(Thread thread)
{
   while(!ncursesTerminate)
   {
      int ch;
      ncursesMutex.Wait();
      ch = getch();
      if(ch != ERR)
      {
         AddMessagesToQueue(ch);
         guiApp.SignalEvent();
      }
      ncursesMutex.Release();
      if(ch == ERR)
         Sleep(TIMEOUT / 1000.0);
   }
   return 0;
}

/****************************************************************************
   /// DRIVER IMPLEMENTATION /////////////
****************************************************************************/
class NCursesInterface : Interface
{
   class_property(name) = "NCurses";

   // --- User Interface System ---
   bool Initialize()
   {
      static byte colorMap[8] = {0,4,2,6,1,5,3,7};

      byte c = 0,f,b;
      initscr();

      SetLoggingMode(buffer, null);
      if((bool)has_colors())
      {
         start_color();
         for(b=0; b<8; b++)
            for(f=0; f<8; f++)
               init_pair(c++,colorMap[f],colorMap[b]);
      }

      printf( "\033(U\017");
      fflush(stdout);
      intrflush(stdscr, (_Bool)false);
      nonl();
      curs_set(false);
      keypad(stdscr, (_Bool)true);
   #ifdef NCURSES_VERSION
      ESCDELAY = 0;
      mousemask(REPORT_MOUSE_POSITION |
                BUTTON1_PRESSED | BUTTON1_RELEASED | BUTTON1_DOUBLE_CLICKED |
                BUTTON2_PRESSED | BUTTON2_RELEASED | BUTTON2_DOUBLE_CLICKED |
                BUTTON3_PRESSED | BUTTON3_RELEASED | BUTTON3_DOUBLE_CLICKED, null);
      mouseinterval(0);
   #endif
      idlok(stdscr, (_Bool)false);
      idcok(stdscr, (_Bool)false);
      clearok(stdscr, (_Bool)false);
      scrollok(stdscr, (_Bool)false);
      cbreak();
      caretVisible = false;
      leaveok(stdscr, (_Bool)true);
      timeout(0);
      noecho();

   	ncursesMutex = Mutex { };

      ncursesTerminate = false;

      ncursesThread = Thread { };
      incref ncursesThread;
      ncursesThread.Main = NCursesThread;
      ncursesThread.Create();

      ncursesMutex.Wait();
      return true;
   }

   void Terminate()
   {
      ncursesTerminate = true;
      ncursesMutex.Release();
      ncursesThread.Wait();
      delete ncursesThread;
      endwin();
      delete ncursesMutex;
      ClearClipboard();
   }

   bool ProcessInput(bool processAll)
   {
      Message msg;
      bool result = false;

      // Process messages
      while(!ncursesTerminate && (msg = messages.first))
      {
         result = true;
         messages.Remove(msg);
         if(msg.vmid == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown || msg.vmid == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp)
            nCursesDesktop.KeyMessage(msg.vmid, msg.key, (char)msg.x);
         else
         {
            if(nCursesDesktop.MouseMessage(msg.vmid, msg.x, msg.y, (Modifiers *)&msg.key, false, true))
            {
               if(msg.vmid == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick)
                  nCursesDesktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown, msg.x, msg.y, (Modifiers *)&msg.key, false, false);
               else if(msg.vmid == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightDoubleClick)
                  nCursesDesktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown, msg.x, msg.y, (Modifiers *)&msg.key, false, false);
               else if(msg.vmid == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleDoubleClick)
                  nCursesDesktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonDown, msg.x, msg.y, (Modifiers *)&msg.key, false, false);
            }
         }
         delete msg;

         if(processAll && ncursesMutex)
         {
            ncursesMutex.Release();
            ncursesMutex.Wait();
         }
         result = true;
      }
      if(ncursesTerminate)
         messages.Free(null);
      else if(caretVisible)
      {
         leaveok(stdscr, (_Bool)false);
         move(caretY,caretX);
         refresh();
         curs_set(true);
      }
      return result;
   }

   void Wait()
   {
      ncursesMutex.Release();
      guiApp.WaitEvent();
      ncursesMutex.Wait();
   }

   void Lock(Window window)
   {

   }

   void Unlock(Window window)
   {

   }

   char ** GraphicsDrivers(int * numDrivers)
   {
      static char *graphicsDrivers[] = { "NCurses" };
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

   void OffsetWindow(Window window, int * x, int * y)
   {

   }

   bool ScreenMode(bool fullScreen, int resolution, int colorDepth, int refreshRate, bool * textMode)
   {
      if(fullScreen)
      {
         guiApp.SetDesktopPosition(0,0, COLS * textCellW, LINES * textCellH, false);
         *textMode = true;
         mouseRange.right = MAXINT;
         mouseRange.bottom = MAXINT;
   	   return true;
      }
      return false;
   }

   // --- Window Creation ---
   void * CreateRootWindow(Window window)
   {
      nCursesDesktop = window;
      return (void *) stdscr;
   }

   void DestroyRootWindow(void * windowHandle)
   {
   }

   // -- Window manipulation ---

   void SetRootWindowCaption(void * windowHandle, char * name)
   {
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

   void UpdateRootWindow(void * windowHandle)
   {
   }

   void SetRootWindowState(Window window, int state, bool visible)
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
      if(size)
      {
         caretX = x / textCellW;
         caretY = y / textCellH;
         caretVisible = true;
      }
      else
         caretVisible = false;
   }

   // --- Clipboard manipulation ---

   void ClearClipboard()
   {
      delete clipBoardData;
   }

   bool AllocateClipboard(ClipBoard clipBoard, uint size)
   {
      bool result = false;
      if((clipBoard.text = new char[size]))
         result = true;
      return result;
   }

   bool SaveClipboard(ClipBoard clipBoard)
   {
      bool result = false;
      if(clipBoard.text)
      {
         delete clipBoardData;
         clipBoardData = clipBoard.text;
         clipBoard.text = null;
         result = true;
      }
      return result;
   }

   bool LoadClipboard(ClipBoard clipBoard)
   {
      bool result = false;
      if(clipBoardData)
      {
         clipBoard.text = clipBoardData;
         result = true;
      }
      return result;
   }

   void UnloadClipboard(ClipBoard clipBoard)
   {

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
      return false;
   }
}

#endif
