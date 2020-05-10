import "Display"

#include "gl123es.h"

default:
__declspec(dllexport) void testClear()
{
   // On HoloLens, it is important to clear to transparent.
   glClearColor(0.0f, 0.2f, 0.f, 0.f);
}
private:

#define _Noreturn

namespace gui::drivers;

// #include <locale.h>

import "Window"
import "Interface"

import "egl"

static bool initialized;

//static int desktopW, desktopH;
static char * clipBoardData;
static float mouseX = 320, mouseY = 240;
static bool acquiredInputMode;
static MouseButtons buttonsState;
//static Pointf lastButtonPressedPos[2];
static float relMouseX, relMouseY;

/*
static Pointf lastTouchPos[2];
static bool touchPadDown[2];
static bool wasActiveLastPass[2];
static float lastTouchPadForce[2];
static bool wasButtonPressedLastPass_trigger[2];
static bool wasButtonPressedLastPass_bumper[2];

enum MouseEvent { OnTrigger, OnBumper, OnTouchpad };
static MouseEvent prevMouseButtonEvent[2];
*/

default:
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonUp;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightDoubleClick;
private:

class UWPInterface : Interface
{
   class_property(name) = "UWP";

   // --- User Interface System ---
   bool Initialize()
   {
      // setlocale(LC_ALL, "en_US.UTF-8");
      initialized = false;

      return true;
   }

   void Terminate()
   {

   }

   #define DBLCLICK_DELAY  300   // 0.3 second
   #define DBLCLICK_DELTA  1

   bool ProcessInput(bool processAll)
   {
      static Time lastTime, lastClickTime;
      Time time = GetTime();
      bool eventAvailable = false;
      /*int w = 640 * 2;
      int h = 480 * 2;
      */
      //int controllerID = 1; //or 2
      Time diffTime;

      if(!initialized)
      {
         initialized = true;

         lastTime = time;
         lastClickTime = time;
      }

      diffTime = time - lastTime;
      lastTime = time;

      /*
      if(desktopW != w || desktopH != h)
      {
         guiApp.SetDesktopPosition(0, 0, w, h, true);
         desktopW = w;
         desktopH = h;
         guiApp.desktop.Update(null);
      }
      */
      return eventAvailable;
   }

   void Wait()
   {
      // guiApp.WaitEvent();
   }

   void Lock(Window window)
   {

   }

   void Unlock(Window window)
   {

   }

   const char ** GraphicsDrivers(int * numDrivers)
   {
      static const char *graphicsDrivers[] = { "OpenGL" };
      *numDrivers = sizeof(graphicsDrivers) / sizeof(char *);
      return (const char **)graphicsDrivers;
   }

   void GetCurrentMode(bool * fullScreen, int * resolution, int * colorDepth, int * refreshRate)
   {

      *fullScreen = true;
   }

   void EnsureFullScreen(bool *fullScreen)
   {
      *fullScreen = true;
   }

   bool ScreenMode(bool fullScreen, int resolution, int colorDepth, int refreshRate, bool * textMode)
   {
      bool result = true;
      return result;
   }

   // --- Window Creation ---
   void * CreateRootWindow(Window window)
   {
      return (void *)1;
   }

   void DestroyRootWindow(Window window)
   {

   }

   // -- Window manipulation ---

   void SetRootWindowCaption(Window window, const char * name)
   {
   }

   void PositionRootWindow(Window window, int x, int y, int w, int h, bool move, bool resize)
   {
   }

   void OrderRootWindow(Window window, bool topMost)
   {

   }

   void SetRootWindowColor(Window window)
   {

   }

   void OffsetWindow(Window window, int * x, int * y)
   {
   }

   void UpdateRootWindow(Window window)
   {

      if(!window.parent || !window.parent.display)
      {
         if(window.visible)
         {
            Box box = window.box;
            box.left -= window.clientStart.x;
            box.top -= window.clientStart.y;
            box.right -= window.clientStart.x;
            box.bottom -= window.clientStart.y;
            // Logf("Update root window %s\n", window.name);
            window.Update(null);
            box.left   += window.clientStart.x;
            box.top    += window.clientStart.y;
            box.right  += window.clientStart.x;
            box.bottom += window.clientStart.y;
            window.UpdateDirty(box);
         }
      }
   }


   void SetRootWindowState(Window window, WindowState state, bool visible)
   {
   }

   void FlashRootWindow(Window window)
   {

   }

   void ActivateRootWindow(Window window)
   {

   }

   // --- Mouse-based window movement ---

   void StartMoving(Window window, int x, int y, bool fromKeyBoard)
   {

   }

   void StopMoving(Window window)
   {

   }

   // -- Mouse manipulation ---

   void GetMousePosition(int *x, int *y)
   {
      *x = (int)mouseX;
      *y = (int)mouseY;
   }

   void SetMousePosition(int x, int y)
   {
      mouseX = x;
      mouseY = y;
   }

   void SetMouseRange(Window window, Box box)
   {
   }

   void SetMouseCapture(Window window)
   {
   }

   // -- Mouse cursor ---

   void SetMouseCursor(Window window, int cursor)
   {
      if(cursor == -1)
      {

      }
   }

   // --- Caret ---

   void SetCaret(int x, int y, int size)
   {
      Window caretOwner = guiApp.caretOwner;
      Window window = caretOwner ? caretOwner.rootWindow : null;
      if(window && window.windowData)
      {
      }
   }

   void ClearClipboard()
   {
      if(clipBoardData)
      {
         delete clipBoardData;
      }
   }

   bool AllocateClipboard(ClipBoard clipBoard, uint size)
   {
      bool result = false;
      if((clipBoard.text = new0 byte[size]))
         result = true;
      return result;
   }

   bool SaveClipboard(ClipBoard clipBoard)
   {
      bool result = false;
      if(clipBoard.text)
      {
         if(clipBoardData)
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

      // The data is inside this client...
      if(clipBoardData)
      {
         clipBoard.text = new char[strlen(clipBoardData)+1];
         strcpy(clipBoard.text, clipBoardData);
         result = true;
      }
      // The data is with another client...
      else
      {
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
      acquiredInputMode = state;
      if(acquiredInputMode)
      {
         relMouseX = 0;
         relMouseY = 0;
      }
      return true;
   }

   bool GetMouseState(MouseButtons * buttons, int * x, int * y)
   {
      bool result = false;
      if(acquiredInputMode == true)
      {
         if(x) *x = (int)(relMouseX * 1000);
         if(y) *y = (int)(relMouseY * 1000);
         relMouseX = 0;
         relMouseY = 0;
         *buttons = buttonsState;
         result = true;
      }
      else
      {
         if(x) *x = 0;
         if(y) *y = 0;
         if(buttons) *buttons = 0;
      }
      return result;
   }

   bool GetJoystickState(int device, Joystick joystick)
   {
      bool result = false;
      return result;
   }

   bool GetKeyState(Key key)
   {
      bool keyState = false;
      return keyState;
   }

   void SetTimerResolution(uint hertz)
   {
      // timerDelay = hertz ? (1000000 / hertz) : MAXINT;
   }

   bool SetIcon(Window window, BitmapResource resource)
   {
      if(resource)
      {
         /*Bitmap bitmap { };
         if(bitmap.Load(resource.fileName, null, null))
         {
         }
         delete bitmap;*/
      }
      return true;
   }
}

/*
static Key keyCodeTable[] =
{
    0, //AKEYCODE_UNKNOWN         = 0,
    0, //AKEYCODE_SOFT_LEFT       = 1,
    0, //AKEYCODE_SOFT_RIGHT      = 2,
    0, //AKEYCODE_HOME            = 3,
    0, //AKEYCODE_BACK            = 4,
    0, //AKEYCODE_CALL            = 5,
    0, //AKEYCODE_ENDCALL         = 6,
    k0, //AKEYCODE_0               = 7,
    k1, //AKEYCODE_1               = 8,
    k2, //AKEYCODE_2               = 9,
    k3, //AKEYCODE_3               = 10,
    k4, //AKEYCODE_4               = 11,
    k5, //AKEYCODE_5               = 12,
    k6, //AKEYCODE_6               = 13,
    k7, //AKEYCODE_7               = 14,
    k8, //AKEYCODE_8               = 15,
    k9, //AKEYCODE_9               = 16,
    keyPadStar, //AKEYCODE_STAR            = 17,
    Key { k3, shift = true }, //AKEYCODE_POUND           = 18,
    up, //AKEYCODE_DPAD_UP         = 19,
    down, //AKEYCODE_DPAD_DOWN       = 20,
    left, //AKEYCODE_DPAD_LEFT       = 21,
    right, //AKEYCODE_DPAD_RIGHT      = 22,
    keyPad5, //AKEYCODE_DPAD_CENTER     = 23,
    0, //AKEYCODE_VOLUME_UP       = 24,
    0, //AKEYCODE_VOLUME_DOWN     = 25,
    0, //AKEYCODE_POWER           = 26,
    0, //AKEYCODE_CAMERA          = 27,
    0, //AKEYCODE_CLEAR           = 28,
    a, //AKEYCODE_A               = 29,
    b, //AKEYCODE_B               = 30,
    c, //AKEYCODE_C               = 31,
    d, //AKEYCODE_D               = 32,
    e, //AKEYCODE_E               = 33,
    f, //AKEYCODE_F               = 34,
    g, //AKEYCODE_G               = 35,
    h, //AKEYCODE_H               = 36,
    i, //AKEYCODE_I               = 37,
    j, //AKEYCODE_J               = 38,
    k, //AKEYCODE_K               = 39,
    l, //AKEYCODE_L               = 40,
    m, //AKEYCODE_M               = 41,
    n, //AKEYCODE_N               = 42,
    o, //AKEYCODE_O               = 43,
    p, //AKEYCODE_P               = 44,
    q, //AKEYCODE_Q               = 45,
    r, //AKEYCODE_R               = 46,
    s, //AKEYCODE_S               = 47,
    t, //AKEYCODE_T               = 48,
    u, //AKEYCODE_U               = 49,
    v, //AKEYCODE_V               = 50,
    w, //AKEYCODE_W               = 51,
    x, //AKEYCODE_X               = 52,
    y, //AKEYCODE_Y               = 53,
    z, //AKEYCODE_Z               = 54,
    comma, //AKEYCODE_COMMA           = 55,
    period, //AKEYCODE_PERIOD          = 56,
    leftAlt, //AKEYCODE_ALT_LEFT        = 57,
    rightAlt, //AKEYCODE_ALT_RIGHT       = 58,
    leftShift, //AKEYCODE_SHIFT_LEFT      = 59,
    rightShift, //AKEYCODE_SHIFT_RIGHT     = 60,
    tab, //AKEYCODE_TAB             = 61,
    space, //AKEYCODE_SPACE           = 62,
    0, //AKEYCODE_SYM             = 63,
    0, //AKEYCODE_EXPLORER        = 64,
    0, //AKEYCODE_ENVELOPE        = 65,
    enter, //AKEYCODE_ENTER           = 66,
    backSpace, //AKEYCODE_DEL             = 67,
    backQuote, //AKEYCODE_GRAVE           = 68,
    minus, //AKEYCODE_MINUS           = 69,
    plus, //AKEYCODE_EQUALS          = 70,
    leftBracket, //AKEYCODE_LEFT_BRACKET    = 71,
    rightBracket, //AKEYCODE_RIGHT_BRACKET   = 72,
    backSlash, //AKEYCODE_BACKSLASH       = 73,
    semicolon, //AKEYCODE_SEMICOLON       = 74,
    quote, //AKEYCODE_APOSTROPHE      = 75,
    slash, //AKEYCODE_SLASH           = 76,
    Key { k2, shift = true }, //AKEYCODE_AT              = 77,
    0, //AKEYCODE_NUM             = 78,      // Interpreted as an Alt
    0, //AKEYCODE_HEADSETHOOK     = 79,
    0, //AKEYCODE_FOCUS           = 80,   // *Camera* focus
    keyPadPlus, //AKEYCODE_PLUS            = 81,
    0, //AKEYCODE_MENU            = 82,
    0, //AKEYCODE_NOTIFICATION    = 83,
    0, //AKEYCODE_SEARCH          = 84,
    0, //AKEYCODE_MEDIA_PLAY_PAUSE= 85,
    0, //AKEYCODE_MEDIA_STOP      = 86,
    0, //AKEYCODE_MEDIA_NEXT      = 87,
    0, //AKEYCODE_MEDIA_PREVIOUS  = 88,
    0, //AKEYCODE_MEDIA_REWIND    = 89,
    0, //AKEYCODE_MEDIA_FAST_FORWARD = 90,
    0, //AKEYCODE_MUTE            = 91,
    0, //AKEYCODE_PAGE_UP         = 92,
    0, //AKEYCODE_PAGE_DOWN       = 93,
    0, //AKEYCODE_PICTSYMBOLS     = 94,
    0, //AKEYCODE_SWITCH_CHARSET  = 95,
    0, //AKEYCODE_BUTTON_A        = 96,
    0, //AKEYCODE_BUTTON_B        = 97,
    0, //AKEYCODE_BUTTON_C        = 98,
    0, //AKEYCODE_BUTTON_X        = 99,
    0, //AKEYCODE_BUTTON_Y        = 100,
    0, //AKEYCODE_BUTTON_Z        = 101,
    0, //AKEYCODE_BUTTON_L1       = 102,
    0, //AKEYCODE_BUTTON_R1       = 103,
    0, //AKEYCODE_BUTTON_L2       = 104,
    0, //AKEYCODE_BUTTON_R2       = 105,
    0, //AKEYCODE_BUTTON_THUMBL   = 106,
    0, //AKEYCODE_BUTTON_THUMBR   = 107,
    0, //AKEYCODE_BUTTON_START    = 108,
    0, //AKEYCODE_BUTTON_SELECT   = 109,
    0, //AKEYCODE_BUTTON_MODE     = 110,
    escape, //AKEYCODE_BUTTON_ESCAPE = 111,
    del, //AKEYCODE_BUTTON_ESCAPE    = 112,
    leftControl, // = 113
    rightControl, // = 114
    capsLock, // = 115
    scrollLock, // = 116
    0, // = 117      KEYCODE_META_LEFT
    0, // = 118      KEYCODE_META_RIGHT
    0, // = 119      KEYCODE_FUNCTION
    printScreen, // = 120      KEYCODE_SYSRQ
    pauseBreak, // = 121
    home, // = 122
    end, // = 123
    insert // = 124
};
*/
