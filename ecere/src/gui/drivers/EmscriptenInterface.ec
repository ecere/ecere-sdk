namespace gui::drivers;

#ifdef BUILDING_ECERE_COM
import "Window"
import "Interface"
#else
#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif
#endif

#ifdef __EMSCRIPTEN__

#include <stdio.h>

// source file line number printf (sflnprintf)
#define sflnprintf(format,...) printf("%s:% 5d: " format, __FILE__, __LINE__, ##__VA_ARGS__)

#define property _property
#define uint _uint

#include <emscripten.h>
#include <html5.h>

#undef property
#undef uint

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

static Point lastMouse;

static inline const char *emscripten_event_type_to_string(int eventType) {
  const char *events[] = { "(invalid)", "(none)", "keypress", "keydown", "keyup", "click", "mousedown", "mouseup", "dblclick", "mousemove", "wheel", "resize",
    "scroll", "blur", "focus", "focusin", "focusout", "deviceorientation", "devicemotion", "orientationchange", "fullscreenchange", "pointerlockchange",
    "visibilitychange", "touchstart", "touchend", "touchmove", "touchcancel", "gamepadconnected", "gamepaddisconnected", "beforeunload",
    "batterychargingchange", "batterylevelchange", "webglcontextlost", "webglcontextrestored", "mouseenter", "mouseleave", "mouseover", "mouseout", "(invalid)" };
  ++eventType;
  if (eventType < 0) eventType = 0;
  if (eventType >= sizeof(events)/sizeof(events[0])) eventType = sizeof(events)/sizeof(events[0])-1;
  return events[eventType];
}

static int mouseButtons;
static int movementX, movementY;

static bool isFullScreen;

static EM_BOOL mouse_callback(int eventType, const EmscriptenMouseEvent *e, void *userData)
{
   Window window = guiApp.desktop;
   Modifiers mods { };
   int methodID;

   mods.alt = e->altKey ? true : false;
   mods.shift = e->shiftKey ? true : false;
   mods.ctrl = e->ctrlKey ? true : false;

   mods.left = (mouseButtons & 1) ? true : false;
   mods.right = (mouseButtons & 2) ? true : false;
   mods.middle = (mouseButtons & 4) ? true : false;

   switch(eventType)
   {
      case EMSCRIPTEN_EVENT_MOUSEMOVE:
         lastMouse = { e->canvasX, e->canvasY };
         window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove,
            e->canvasX, e->canvasY, &mods, false, true);
         movementX += e->movementX;
         movementY += e->movementY;
         break;
      case EMSCRIPTEN_EVENT_MOUSEDOWN:
         // PrintLn("EMSCRIPTEN_EVENT_MOUSEDOWN!");
         methodID =
            e->button == 0 ? __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown :
            e->button == 2 ? __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown :
                             __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonDown;
         window.MouseMessage(methodID, e->canvasX, e->canvasY, &mods, false, true);
         if(e->button == 0)
            mouseButtons |= 1;
         else if(e->button == 2)
            mouseButtons |= 2;
         else
            mouseButtons |= 4;
         break;
      case EMSCRIPTEN_EVENT_MOUSEUP:
         methodID =
            e->button == 0 ? __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp :
            e->button == 2 ? __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonUp :
                             __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonUp;
         window.MouseMessage(methodID, e->canvasX, e->canvasY, &mods, false, true);
         if(e->button == 0)
            mouseButtons &= ~1;
         else if(e->button == 2)
            mouseButtons &= ~2;
         else
            mouseButtons &= ~4;
         break;
      case EMSCRIPTEN_EVENT_DBLCLICK:
         methodID =
            e->button == 0 ? __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick :
            e->button == 2 ? __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightDoubleClick :
                             __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleDoubleClick;
         window.MouseMessage(methodID, e->canvasX, e->canvasY, &mods, false, true);
         break;
   }

/*
   printf("%s, screen: (%ld,%ld), client: (%ld,%ld),%s%s%s%s button: %hu, buttons: %hu, movement: (%ld,%ld), canvas: (%ld,%ld)\n",
      emscripten_event_type_to_string(eventType), e->screenX, e->screenY, e->clientX, e->clientY,
      e->ctrlKey ? " CTRL" : "", e->shiftKey ? " SHIFT" : "", e->altKey ? " ALT" : "", e->metaKey ? " META" : "",
      e->button, e->buttons, e->movementX, e->movementY, e->canvasX, e->canvasY);
*/
   return 0;
}

static EM_BOOL wheel_callback(int eventType, const EmscriptenWheelEvent *e, void *userData)
{
   Window window = guiApp.desktop;
   Key key = (e->deltaY < 0 || e->deltaX < 0) ? wheelUp : wheelDown;

   key.alt = e->mouse.altKey ? true : false;
   key.shift = e->mouse.shiftKey ? true : false;
   key.ctrl = e->mouse.ctrlKey ? true : false;

   /*
   printf("%s, screen: (%ld,%ld), client: (%ld,%ld),%s%s%s%s button: %hu, buttons: %hu, canvas: (%ld,%ld), delta:(%g,%g,%g), deltaMode:%lu\n",
    emscripten_event_type_to_string(eventType), e->mouse.screenX, e->mouse.screenY, e->mouse.clientX, e->mouse.clientY,
    e->mouse.ctrlKey ? " CTRL" : "", e->mouse.shiftKey ? " SHIFT" : "", e->mouse.altKey ? " ALT" : "", e->mouse.metaKey ? " META" : "",
    e->mouse.button, e->mouse.buttons, e->mouse.canvasX, e->mouse.canvasY,
    (float)e->deltaX, (float)e->deltaY, (float)e->deltaZ, e->deltaMode);
   */

   window.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit, key, 0);

  return 0;
}
static bool keyStatus[KeyCode];

EM_BOOL pointerlockchange_callback(int eventType, const EmscriptenPointerlockChangeEvent *e, void *userData)
{
   if(!e->isActive)
   {
      if(guiApp.acquiredWindow)
      {
         guiApp.acquiredWindow.acquiredInput = false;
         guiApp.acquiredWindow = null;
      }
   }
   else
   {
      Window w = guiApp.desktop;
      if(w && w.children.first) w = w.children.first;
      guiApp.acquiredWindow = w;
      guiApp.acquiredWindow.acquiredInput = true;
   }
/*
  printf("%s, isActive: %d, pointerlock element nodeName: \"%s\", id: \"%s\"\n",
    emscripten_event_type_to_string(eventType), e->isActive, e->nodeName, e->id);
*/
   movementX = 0;
   movementY = 0;
   return 0;
}

EM_BOOL fullscreenchange_callback(int eventType, const EmscriptenFullscreenChangeEvent *e, void *userData)
{
   int w = 0, h = 0;
   double dw = 0, dh = 0;
   isFullScreen = (bool)e->isFullscreen;
   *&guiApp.fullScreen = isFullScreen;

   emscripten_get_element_css_size(0, &dw, &dh);
   w = (int)dw, h = (int)dh;
   if(w && h)
   {
      emscripten_set_canvas_size(w, h);
      guiApp.desktop.ExternalPosition(0,0, w, h);
      if(guiApp.desktop.display && guiApp.desktop.display.displaySystem)
         guiApp.desktop.display.Resize(w, h);
   }
   movementX = 0;
   movementY = 0;
   return 0;
}

// The event handler functions can return 1 to suppress the event and disable the default action. That calls event.preventDefault();
// Returning 0 signals that the event was not consumed by the code, and will allow the event to pass on and bubble up normally.
EM_BOOL key_callback(int eventType, const EmscriptenKeyboardEvent *e, void *userData)
{
   Window window = guiApp.desktop;
   Key key = 0;
   switch(e->keyCode)
   {
      case 8: key = backSpace; break;
      case 9: key = tab; break;
      case 13: key = enter; break;
      case 16: key = shift; break;
      case 17: key = control; break;
      case 18: key = alt; break;
      case 19: key = pause; break;
      case 20: key = capsLock; break;
      case 27: key = escape; break;
      case 32: key = space; break;
      case 33: key = pageUp; break;
      case 34: key = pageDown; break;
      case 35: key = end; break;
      case 36: key = home; break;
      case 37: key = left; break;
      case 38: key = up; break;
      case 39: key = right; break;
      case 40: key = down; break;
      case 44: key = printScreen; break;
      case 45: key = insert; break;
      case 46: key = del; break;
      case 48: key = k0; break;
      case 49: key = k1; break;
      case 50: key = k2; break;
      case 51: key = k3; break;
      case 52: key = k4; break;
      case 53: key = k5; break;
      case 54: key = k6; break;
      case 55: key = k7; break;
      case 56: key = k8; break;
      case 57: key = k9; break;
      case 65: key = a; break;
      case 66: key = b; break;
      case 67: key = c; break;
      case 68: key = d; break;
      case 69: key = KeyCode::e; break;
      case 70: key = f; break;
      case 71: key = g; break;
      case 72: key = h; break;
      case 73: key = i; break;
      case 74: key = j; break;
      case 75: key = k; break;
      case 76: key = l; break;
      case 77: key = m; break;
      case 78: key = n; break;
      case 79: key = o; break;
      case 80: key = p; break;
      case 81: key = q; break;
      case 82: key = r; break;
      case 83: key = s; break;
      case 84: key = t; break;
      case 85: key = u; break;
      case 86: key = v; break;
      case 87: key = w; break;
      case 88: key = x; break;
      case 89: key = y; break;
      case 90: key = z; break;
      // case 91: key = start; break;
      // case 93: key = context; break;
      case 112: key = f1; break;
      case 113: key = f2; break;
      case 114: key = f3; break;
      case 115: key = f4; break;
      case 116: key = f5; break;
      case 117: key = f6; break;
      case 118: key = f7; break;
      case 119: key = f8; break;
      case 120: key = f9; break;
      case 121: key = f10; break;
      case 122: key = f11; break;
      case 123: key = f12; break;
      case 144: key = numLock; break;
      case 125: key = scrollLock; break;
      case 188: key = comma; break;
      case 190: key = period; break;
      case 191: key = slash; break;
      case 192: key = tilde; break;
      case 219: key = leftBracket; break;    // also corresponds to the Win Key (Start) in older versions of Opera.
      case 220: key = backSlash; break;
      case 221: key = rightBracket; break;
      case 222: key = quote; break;

      /*case 173: */case 181: key = mute; break;       // FF: 181
      case 174: case 182: key = volumeDown; break;     // FF: 182
      case 175: case 183: key = volumeDown; break;     // FF: 183
      case 186: case 59:  key = semicolon; break;      // FF: 59
      case 187: case 61:  key = equal; break;          // FF: 61
      case 189: case 173: key = minus; break;          // FF: 61

      case 96: key = keyPad0; break;
      //case 45: key = keyPadInsert; break;

      case 97: key = keyPad1; break;
      //case 35: key = keyPadEnd; break;

      case 98: key = keyPad2; break;
      //case 40: key = keyPadDown; break;

      case 99: key = keyPad3; break;
      //case 34: key = keyPadPageDown; break;

      case 100: key = keyPad4; break;
      //case 37: key = keyPadLeft; break;

      case 101: key = keyPad5; break;
      case 12: key = keyPad5; break;

      case 102: key = keyPad6; break;
      //case 39: key = keyPadRight; break;

      case 103: key = keyPad7; break;
      //case 36: key = keyPadHome; break;

      case 104: key = keyPad8; break;
      //case 38: key = keyPadUp; break;

      case 105: key = keyPad9; break;
      //case 33: key = keyPadPageUp; break;

      case 106: key = keyPadStar; break;
      case 107: key = keyPadPlus; break;
      case 109: key = keyPadMinus; break;

      case 110: key = keyPadDelete; break;
      //case 46: key = keyPadDelete; break;

      case 11: key = keyPadSlash; break;
   }

   key.alt = e->altKey ? true : false;
   key.shift = e->shiftKey ? true : false;
   key.ctrl = e->ctrlKey ? true : false;

   /*
   key.modifiers.left = (mouseButtons & 1) ? true : false;
   key.modifiers.right = (mouseButtons & 2) ? true : false;
   key.modifiers.middle = (mouseButtons & 4) ? true : false;
   */


/*
     printf("%s, key: \"%s\", code: \"%s\", location: %lu,%s%s%s%s repeat: %d, locale: \"%s\", char: \"%s\", charCode: %lu, keyCode: %lu, which: %lu\n",
       emscripten_event_type_to_string(eventType), e->key, e->code, e->location,
       e->ctrlKey ? " CTRL" : "", e->shiftKey ? " SHIFT" : "", e->altKey ? " ALT" : "", e->metaKey ? " META" : "",
       e->repeat, e->locale, e->charValue, e->charCode, e->keyCode, e->which);
*/
   if(key)
   {
      switch(eventType)
      {
         case EMSCRIPTEN_EVENT_KEYDOWN:
            //PrintLn("Setting ", key, " to down");
            keyStatus[key] = true;
            window.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown, key, (unichar)e->charCode);
            break;
         case EMSCRIPTEN_EVENT_KEYUP:
            //PrintLn("Setting ", key, " to false");
            keyStatus[key] = false;
            window.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp, key, (unichar)e->charCode);
            break;
      }
   }

  /*
  if (eventType == EMSCRIPTEN_EVENT_KEYPRESS && (!strcmp(e->key, "f") || e->which == 102)) {
    EmscriptenFullscreenChangeEvent fsce;
    EMSCRIPTEN_RESULT ret = emscripten_get_fullscreen_status(&fsce);
    TEST_RESULT(emscripten_get_fullscreen_status);
    if (!fsce.isFullscreen) {
      printf("Requesting fullscreen..\n");
      ret = emscripten_request_fullscreen(0, 1);
      TEST_RESULT(emscripten_request_fullscreen);
    } else {
      printf("Exiting fullscreen..\n");
      ret = emscripten_exit_fullscreen();
      TEST_RESULT(emscripten_exit_fullscreen);
      ret = emscripten_get_fullscreen_status(&fsce);
      TEST_RESULT(emscripten_get_fullscreen_status);
      if (fsce.isFullscreen) {
        fprintf(stderr, "Fullscreen exit did not work!\n");
      }
    }
  }

  if (eventType == EMSCRIPTEN_EVENT_KEYPRESS && (!strcmp(e->key, "p") || e->which == 112)) {
    EmscriptenPointerlockChangeEvent plce;
    EMSCRIPTEN_RESULT ret = emscripten_get_pointerlock_status(&plce);
    TEST_RESULT(emscripten_get_pointerlock_status);
    if (!plce.isActive) {
      printf("Requesting pointer lock..\n");
      ret = emscripten_request_pointerlock(0, 1);
      TEST_RESULT(emscripten_request_pointerlock);
    } else {
      printf("Exiting pointer lock..\n");
      ret = emscripten_exit_pointerlock();
      TEST_RESULT(emscripten_exit_pointerlock);
      ret = emscripten_get_pointerlock_status(&plce);
      TEST_RESULT(emscripten_get_pointerlock_status);
      if (plce.isActive) {
        fprintf(stderr, "Pointer lock exit did not work!\n");
      }
    }
  }
  */

  return 0;
}

static EM_BOOL uievent_callback(int eventType, const EmscriptenUiEvent *e, void *userData)
{
   switch(eventType)
   {
      case EMSCRIPTEN_EVENT_RESIZE:
      //case EMSCRIPTEN_EVENT_SCROLL:
      {
         int w = 0, h = 0;
         double dw = 0, dh = 0;
         emscripten_get_element_css_size(0, &dw, &dh);
         w = (int)dw, h = (int)dh;
         if(w && h)
         {
            emscripten_set_canvas_size(w, h);
            guiApp.desktop.ExternalPosition(0,0, w, h);
            if(guiApp.desktop.display && guiApp.desktop.display.displaySystem)
               guiApp.desktop.display.Resize(w, h);
         }
         //PrintLn("EMSCRIPTEN_EVENT_RESIZE: ", w, " x ", h);
         break;
      }
   }
   /*
   printf("%s, detail: %ld, document.body.client size: (%d,%d), window.inner size: (%d,%d), scrollPos: (%d, %d)\n",
      emscripten_event_type_to_string(eventType), e->detail, e->documentBodyClientWidth, e->documentBodyClientHeight,
      e->windowInnerWidth, e->windowInnerHeight, e->scrollTop, e->scrollLeft);
   */
   return 0;
}

class EmscriptenInterface : Interface
{
   class_property(name) = "Emscripten";

   // --- User Interface System ---

   bool ::Initialize()
   {
      emscripten_set_resize_callback(0, 0, 1, uievent_callback);
      //emscripten_set_scroll_callback(0, 0, 1, uievent_callback);
      emscripten_set_click_callback(0, 0, 1, mouse_callback);
      emscripten_set_mousedown_callback(0, 0, 1, mouse_callback);
      emscripten_set_mouseup_callback(0, 0, 1, mouse_callback);
      emscripten_set_dblclick_callback(0, 0, 1, mouse_callback);
      emscripten_set_mousemove_callback(0, 0, 1, mouse_callback);
      emscripten_set_wheel_callback(0, 0, 1, wheel_callback);
      emscripten_set_keypress_callback(0, 0, 1, key_callback);
      emscripten_set_keydown_callback(0, 0, 1, key_callback);
      emscripten_set_keyup_callback(0, 0, 1, key_callback);
      emscripten_set_pointerlockchange_callback(0, 0, 1, pointerlockchange_callback);
      emscripten_set_fullscreenchange_callback(0, 0, 1, fullscreenchange_callback);
      /*emscripten_set_mouseenter_callback(0, 0, 1, mouse_callback);
      emscripten_set_mouseleave_callback(0, 0, 1, mouse_callback);*/
      return true;
   }

   void ::Terminate()
   {

   }

   bool ::ProcessInput(bool processAll)
   {

      return false;
   }

   void ::Wait()
   {

   }

   void ::Lock(Window window)
   {

   }

   void ::Unlock(Window window)
   {

   }

   void ::SetTimerResolution(uint hertz)
   {

   }

   const char ** ::GraphicsDrivers(int * numDrivers)
   {
      static const char *graphicsDrivers[] = { "OpenGL" };
      *numDrivers = sizeof(graphicsDrivers) / sizeof(char *);
      return (const char **)graphicsDrivers;
      return null;
   }

   void ::EnsureFullScreen(bool * fullScreen)
   {

   }

   void ::GetCurrentMode(bool * fullScreen, Resolution * resolution, PixelFormat * colorDepth, int * refreshRate)
   {
      *fullScreen = isFullScreen;
   }

   bool ::ScreenMode(bool fullScreen, Resolution resolution, PixelFormat colorDepth, int refreshRate, bool * textMode)
   {
      if(fullScreen)
         emscripten_request_fullscreen(0, 1);
      else
         emscripten_exit_fullscreen();
      return true;
   }


   // --- Window Creation ---

   void * ::CreateRootWindow(Window window)
   {

      return (void *)(uintptr)1;
   }

   void ::DestroyRootWindow(Window window)
   {

   }


   // --- Window manipulation ---

   void ::SetRootWindowCaption(Window window, const char * name)
   {

   }

   void ::PositionRootWindow(Window window, int x, int y, int w, int h, bool move, bool resize)
   {

   }

   void ::OffsetWindow(Window window, int * x, int * y)
   {

   }

   void ::UpdateRootWindow(Window window)
   {

   }

   void ::SetRootWindowState(Window window, WindowState state, bool visible)
   {

   }

   void ::ActivateRootWindow(Window window)
   {

   }

   void ::OrderRootWindow(Window window, bool topMost)
   {

   }

   void ::SetRootWindowColor(Window window)
   {

   }

   void ::FlashRootWindow(Window window)
   {

   }


   // --- Mouse-based window movement ---

   void ::StartMoving(Window window, int x, int y, bool fromKeyBoard)
   {

   }

   void ::StopMoving(Window window)
   {

   }


   // --- Mouse manipulation ---

   void ::GetMousePosition(int *x, int *y)
   {
      *x = lastMouse.x;
      *y = lastMouse.y;
   }

   void ::SetMousePosition(int x, int y)
   {

   }

   void ::SetMouseRange(Window window, Box box)
   {

   }

   void ::SetMouseCapture(Window window)
   {

   }


   // --- Mouse cursor ---

   void ::SetMouseCursor(Window window, SystemCursor cursor)
   {

   }


   // --- Caret manipulation ---

   void ::SetCaret(int caretX, int caretY, int size)
   {

   }


   // --- Clipboard manipulation ---

   void ::ClearClipboard()
   {

   }

   bool ::AllocateClipboard(ClipBoard clipBoard, uint size)
   {

      return false;
   }

   bool ::SaveClipboard(ClipBoard clipBoard)
   {

      return false;
   }

   bool ::LoadClipboard(ClipBoard clipBoard)
   {

      return false;
   }

   void ::UnloadClipboard(ClipBoard clipBoard)
   {

   }


   // --- State based input ---

   bool ::AcquireInput(Window window, bool state)
   {
      if(state)
         emscripten_request_pointerlock(0, 1);
      else
         emscripten_exit_pointerlock();

      movementX = 0;
      movementY = 0;
      return true;
   }

   bool ::GetMouseState(MouseButtons * buttons, int * x, int * y)
   {
      if(buttons) *buttons = { left = mouseButtons & 1, right = (mouseButtons & 2) ? true : false, middle = (mouseButtons & 4) ? true : false };
      if(x) { *x = movementX; movementX = 0; }
      if(y) { *y = movementY; movementY = 0; }

      return true;
   }

   bool ::GetJoystickState(int device, Joystick joystick)
   {

      return false;
   }

   bool ::GetKeyState(Key key)
   {
      return keyStatus[key];
   }

   bool ::SetIcon(Window window, BitmapResource icon)
   {

      return false;
   }

   void ::GetScreenArea(Window window, Box box)
   {
   }
}

#endif
