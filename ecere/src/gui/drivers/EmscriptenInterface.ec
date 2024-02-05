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

#ifdef _DEBUG
// #define EMSCRIPTEN_DEBUG
#endif

#include <stdio.h>

// source file line number printf (sflnprintf)
#define sflnprintf(format,...) printf("%s:% 5d: " format, __FILE__, __LINE__, ##__VA_ARGS__)

#define property _property
#define uint _uint

#include <emscripten.h>
#include <emscripten/html5.h>

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

const char *emscripten_result_to_string(EMSCRIPTEN_RESULT result)
{
   if(result == EMSCRIPTEN_RESULT_SUCCESS)             return "success";
   if(result == EMSCRIPTEN_RESULT_DEFERRED)            return "deferred";
   if(result == EMSCRIPTEN_RESULT_NOT_SUPPORTED)       return "not supported";
   if(result == EMSCRIPTEN_RESULT_FAILED_NOT_DEFERRED) return "failed not deferred";
   if(result == EMSCRIPTEN_RESULT_INVALID_TARGET)      return "invalid target";
   if(result == EMSCRIPTEN_RESULT_UNKNOWN_TARGET)      return "unknown target";
   if(result == EMSCRIPTEN_RESULT_INVALID_PARAM)       return "invalid param";
   if(result == EMSCRIPTEN_RESULT_FAILED)              return "failed";
   if(result == EMSCRIPTEN_RESULT_NO_DATA)             return "no data";
   return "unknown";
}

static __attribute__((unused)) inline const char *emscripten_event_type_to_string(int eventType) {
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
   bool result = true;

   mods.alt = e->altKey ? true : false;
   mods.shift = e->shiftKey ? true : false;
   mods.ctrl = e->ctrlKey ? true : false;

   mods.left = (mouseButtons & 1) ? true : false;
   mods.right = (mouseButtons & 2) ? true : false;
   mods.middle = (mouseButtons & 4) ? true : false;

   switch(eventType)
   {
      case EMSCRIPTEN_EVENT_MOUSEMOVE:
         lastMouse = { e->targetX, e->targetY };
         window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove,
            e->targetX, e->targetY, &mods, false, true);
         movementX += e->movementX;
         movementY += e->movementY;
         break;
      case EMSCRIPTEN_EVENT_MOUSEDOWN:
         methodID =
            e->button == 0 ? __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown :
            e->button == 2 ? __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown :
                             __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonDown;
         window.MouseMessage(methodID, e->targetX, e->targetY, &mods, false, true);
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
         window.MouseMessage(methodID, e->targetX, e->targetY, &mods, false, true);
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
         window.MouseMessage(methodID, e->targetX, e->targetY, &mods, false, true);
         break;
   }

/*
   printf("~ %s, screen: (%ld,%ld), client: (%ld,%ld),%s%s%s%s button: %hu, buttons: %hu, movement: (%ld,%ld), target: (%ld,%ld)\n",
      emscripten_event_type_to_string(eventType), e->screenX, e->screenY, e->clientX, e->clientY,
      e->ctrlKey ? " CTRL" : "", e->shiftKey ? " SHIFT" : "", e->altKey ? " ALT" : "", e->metaKey ? " META" : "",
      e->button, e->buttons, e->movementX, e->movementY, e->targetX, e->targetY);
*/
   result = false;
   return !result;
}

static Array<TouchPointerInfo> buildPointerInfo(const EmscriptenTouchEvent * event)
{
   uint count = event->numTouches;
   Array<TouchPointerInfo> infos { size = count };
   int i;
   for(i = 0; i < count; i++)
   {
      infos[i].point = { event->touches[i].targetX, event->touches[i].targetY };
      infos[i].id = i;
      infos[i].pressure = 0;
      infos[i].size = 0;
   }
   return infos;
}

static EM_BOOL touch_callback(int eventType, const EmscriptenTouchEvent *e, void *userData)
{
   Window window = guiApp.desktop;
   Modifiers mods { };
   const EmscriptenTouchPoint * t1 = &e->touches[0];
   int methodID;

   mods.alt = e->altKey ? true : false;
   mods.shift = e->shiftKey ? true : false;
   mods.ctrl = e->ctrlKey ? true : false;

   mods.left = (mouseButtons & 1) ? true : false;

   switch(eventType)
   {
      case EMSCRIPTEN_EVENT_TOUCHMOVE:
      {
         Array<TouchPointerInfo> infos = buildPointerInfo(e);
         lastMouse = { t1->targetX, t1->targetY };
         if(window.MultiTouchMessage(move, infos, &mods, false, true))
            window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove, t1->targetX, t1->targetY, &mods, false, true);
         delete infos;
         break;
      }
      case EMSCRIPTEN_EVENT_TOUCHSTART:
      {
         bool result = true;
         if(e->numTouches == 1)
         {
            static int mouseX, mouseY;
            static Time lastTime = 0;
            Time time = GetTime();
            if(Abs(t1->targetX - mouseX) < 40 && Abs(t1->targetY - mouseY) < 40 && time - lastTime < 0.3)
            {
               methodID = __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick;
               if(!window.MouseMessage(methodID, t1->targetX, t1->targetY, &mods, false, true))
                  result = false;
            }
            lastTime = time;
            mouseX = t1->targetX, mouseY = t1->targetY;
            if(result)
            {
               methodID = __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown;
               // result = ?
               window.MouseMessage(methodID, t1->targetX, t1->targetY, &mods, false, true);
            }
            mouseButtons |= 1;
         }
         if(result)
         {
            Array<TouchPointerInfo> infos = buildPointerInfo(e);
            window.MultiTouchMessage(e->numTouches == 1 ? down : pointerDown, infos, &mods, false, true);
            delete infos;
         }
         break;
      }
      case EMSCRIPTEN_EVENT_TOUCHCANCEL:
      case EMSCRIPTEN_EVENT_TOUCHEND:
         methodID = __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp;
         if(window.MouseMessage(methodID, t1->targetX, t1->targetY, &mods, false, true))
         {
            Array<TouchPointerInfo> infos = buildPointerInfo(e);
            window.MultiTouchMessage(e->numTouches > 1 ? pointerUp : up, infos, &mods, false, true);
            delete infos;
         }

         // if(e->button == 0)
            mouseButtons &= ~1;
         break;
   }
   return 1;
}

static EM_BOOL wheel_callback(int eventType, const EmscriptenWheelEvent *e, void *userData)
{
#ifdef EMSCRIPTEN_DEBUG
   printf("wheel_callback\n");
#endif
   Window window = guiApp.desktop;
   Key key = (e->deltaY < 0 || e->deltaX < 0) ? wheelUp : wheelDown;

   key.alt = e->mouse.altKey ? true : false;
   key.shift = e->mouse.shiftKey ? true : false;
   key.ctrl = e->mouse.ctrlKey ? true : false;

   /*
   printf("%s, screen: (%ld,%ld), client: (%ld,%ld),%s%s%s%s button: %hu, buttons: %hu, target: (%ld,%ld), delta:(%g,%g,%g), deltaMode:%lu\n",
    emscripten_event_type_to_string(eventType), e->mouse.screenX, e->mouse.screenY, e->mouse.clientX, e->mouse.clientY,
    e->mouse.ctrlKey ? " CTRL" : "", e->mouse.shiftKey ? " SHIFT" : "", e->mouse.altKey ? " ALT" : "", e->mouse.metaKey ? " META" : "",
    e->mouse.button, e->mouse.buttons, e->mouse.targetX, e->mouse.targetY,
    (float)e->deltaX, (float)e->deltaY, (float)e->deltaZ, e->deltaMode);
   */

   window.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit, key, 0);

   return 1;
}

static bool keyStatus[KeyCode];

// The event handler functions can return 1 to suppress the event and disable the default action. That calls event.preventDefault();
// Returning 0 signals that the event was not consumed by the code, and will allow the event to pass on and bubble up normally.
EM_BOOL key_callback(int eventType, const EmscriptenKeyboardEvent *e, void *userData)
{
   Window window = guiApp.desktop;
   Key key = 0;
   bool result = 0;
#ifdef EMSCRIPTEN_DEBUG
   printf("key_callback\n");
#endif
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

      default:
#ifdef EMSCRIPTEN_DEBUG
         printf("%s, key: \"%s\", code: \"%s\", location: %lu,%s%s%s%s repeat: %d, locale: \"%s\", char: \"%s\", charCode: %lu, keyCode: %lu, which: %lu\n",
               emscripten_event_type_to_string(eventType), e->key, e->code, e->location,
               e->ctrlKey ? " CTRL" : "", e->shiftKey ? " SHIFT" : "", e->altKey ? " ALT" : "", e->metaKey ? " META" : "",
               e->repeat, e->locale, e->charValue, e->charCode, e->keyCode, e->which);
#endif
         break;
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
            result = window.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown, key, (unichar)e->charCode);
            break;
         case EMSCRIPTEN_EVENT_KEYUP:
            //PrintLn("Setting ", key, " to false");
            keyStatus[key] = false;
            result = window.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp, key, (unichar)e->charCode);
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

  return !result;
}

EM_BOOL pointerlockchange_callback(int eventType, const EmscriptenPointerlockChangeEvent *e, void *userData)
{
#ifdef EMSCRIPTEN_DEBUG
   printf("pointerlockchange_callback\n");
#endif
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
#ifdef EMSCRIPTEN_DEBUG
  printf("%s, isActive: %d, pointerlock element nodeName: \"%s\", id: \"%s\"\n",
    emscripten_event_type_to_string(eventType), e->isActive, e->nodeName, e->id);
#endif
/*
*/
   movementX = 0;
   movementY = 0;
   return 0;
}

EM_BOOL fullscreenchange_callback(int eventType, const EmscriptenFullscreenChangeEvent *e, void *userData)
{
/*
   EM_BOOL isFullscreen;
   EM_BOOL fullscreenEnabled;
   EM_UTF8 nodeName[EM_HTML5_LONG_STRING_LEN_BYTES];
   EM_UTF8 id[EM_HTML5_LONG_STRING_LEN_BYTES];
   int elementWidth;
   int elementHeight;
   int screenWidth;
   int screenHeight;
*/

   int w = 0, h = 0;
   double dw = 0, dh = 0;
#ifdef EMSCRIPTEN_DEBUG
   printf("fullscreenchange_callback\n");
#endif
   isFullScreen = (bool)e->isFullscreen;
   *&guiApp.fullScreen = isFullScreen;

   emscripten_get_element_css_size(target, &dw, &dh);
   w = (int)dw, h = (int)dh;
   if(w && h)
   {
      // emscripten_set_canvas_size(w, h);
      // emscripten_set_canvas_element_size(target, w, h);
      guiApp.desktop.ExternalPosition(0,0, w, h);
      if(guiApp.desktop.display && guiApp.desktop.display.displaySystem)
         guiApp.desktop.display.Resize(w, h);
   }
   movementX = 0;
   movementY = 0;
   return 0;
}

EM_BOOL deviceorientation_callback(int eventType, const EmscriptenDeviceOrientationEvent *e, void *userData)
{
/*
  double alpha;
  double beta;
  double gamma;
  EM_BOOL absolute;
*/
#ifdef EMSCRIPTEN_DEBUG
   printf("%s, (%g, %g, %g)\n", emscripten_event_type_to_string(eventType), e->alpha, e->beta, e->gamma);
#endif
   return 0;
}

EM_BOOL devicemotion_callback(int eventType, const EmscriptenDeviceMotionEvent *e, void *userData)
{
/*
  double accelerationX;
  double accelerationY;
  double accelerationZ;
  double accelerationIncludingGravityX;
  double accelerationIncludingGravityY;
  double accelerationIncludingGravityZ;
  double rotationRateAlpha;
  double rotationRateBeta;
  double rotationRateGamma;
  int supportedFields;
*/
#ifdef EMSCRIPTEN_DEBUG
   printf("%s, accel: (%g, %g, %g), accelInclGravity: (%g, %g, %g), rotationRate: (%g, %g, %g), supportedFields: %s %s %s\n",
   emscripten_event_type_to_string(eventType),
   e->accelerationX, e->accelerationY, e->accelerationZ,
   e->accelerationIncludingGravityX, e->accelerationIncludingGravityY, e->accelerationIncludingGravityZ,
   e->rotationRateAlpha, e->rotationRateBeta, e->rotationRateGamma,
   (e->supportedFields & EMSCRIPTEN_DEVICE_MOTION_EVENT_SUPPORTS_ACCELERATION) ? "EMSCRIPTEN_DEVICE_MOTION_EVENT_SUPPORTS_ACCELERATION" : "",
   (e->supportedFields & EMSCRIPTEN_DEVICE_MOTION_EVENT_SUPPORTS_ACCELERATION_INCLUDING_GRAVITY) ? "EMSCRIPTEN_DEVICE_MOTION_EVENT_SUPPORTS_ACCELERATION_INCLUDING_GRAVITY" : "",
   (e->supportedFields & EMSCRIPTEN_DEVICE_MOTION_EVENT_SUPPORTS_ROTATION_RATE) ? "EMSCRIPTEN_DEVICE_MOTION_EVENT_SUPPORTS_ROTATION_RATE" : "");
#endif
   return 0;
}

EM_BOOL orientationchange_callback(int eventType, const EmscriptenOrientationChangeEvent *e, void *userData)
{
/*
  int orientationIndex;
  int orientationAngle;
*/
#ifdef EMSCRIPTEN_DEBUG
   printf("%s, orientationAngle: %d, orientationIndex: %d\n", emscripten_event_type_to_string(eventType), e->orientationAngle, e->orientationIndex);
#endif
   return 0;
}

EM_BOOL visibilitychange_callback(int eventType, const EmscriptenVisibilityChangeEvent *e, void *userData)
{
/*
  EM_BOOL hidden;
  int visibilityState;
*/
#ifdef EMSCRIPTEN_DEBUG
   printf("%s, hidden: %d, visibilityState: %d\n", emscripten_event_type_to_string(eventType), e->hidden, e->visibilityState);
#endif
   return 0;
}

EM_BOOL webglcontext_callback(int eventType, const void *reserved, void *userData)
{
#ifdef EMSCRIPTEN_DEBUG
   printf("%s.\n", emscripten_event_type_to_string(eventType));
#endif
   return 0;
}

static EM_BOOL uievent_callback(int eventType, const EmscriptenUiEvent *e, void *userData)
{
/*
  long detail;
  int documentBodyClientWidth;
  int documentBodyClientHeight;
  int windowInnerWidth;
  int windowInnerHeight;
  int windowOuterWidth;
  int windowOuterHeight;
  int scrollTop;
  int scrollLeft;
*/

   // emscripten_log(EM_LOG_CONSOLE, "uievent_callback\n");
   switch(eventType)
   {
      /*
      EMSCRIPTEN_EVENT_KEYPRESS
      EMSCRIPTEN_EVENT_KEYDOWN
      EMSCRIPTEN_EVENT_KEYUP
      EMSCRIPTEN_EVENT_CLICK
      EMSCRIPTEN_EVENT_MOUSEDOWN
      EMSCRIPTEN_EVENT_MOUSEUP
      EMSCRIPTEN_EVENT_DBLCLICK
      EMSCRIPTEN_EVENT_MOUSEMOVE
      EMSCRIPTEN_EVENT_WHEEL
      EMSCRIPTEN_EVENT_RESIZE
      EMSCRIPTEN_EVENT_SCROLL
      EMSCRIPTEN_EVENT_BLUR
      EMSCRIPTEN_EVENT_FOCUS
      EMSCRIPTEN_EVENT_FOCUSIN
      EMSCRIPTEN_EVENT_FOCUSOUT
      EMSCRIPTEN_EVENT_DEVICEORIENTATION
      EMSCRIPTEN_EVENT_DEVICEMOTION
      EMSCRIPTEN_EVENT_ORIENTATIONCHANGE
      EMSCRIPTEN_EVENT_FULLSCREENCHANGE
      EMSCRIPTEN_EVENT_POINTERLOCKCHANGE
      EMSCRIPTEN_EVENT_VISIBILITYCHANGE
      EMSCRIPTEN_EVENT_TOUCHSTART
      EMSCRIPTEN_EVENT_TOUCHEND
      EMSCRIPTEN_EVENT_TOUCHMOVE
      EMSCRIPTEN_EVENT_TOUCHCANCEL
      EMSCRIPTEN_EVENT_GAMEPADCONNECTED
      EMSCRIPTEN_EVENT_GAMEPADDISCONNECTED
      EMSCRIPTEN_EVENT_BEFOREUNLOAD
      EMSCRIPTEN_EVENT_BATTERYCHARGINGCHANGE
      EMSCRIPTEN_EVENT_BATTERYLEVELCHANGE
      EMSCRIPTEN_EVENT_WEBGLCONTEXTLOST
      EMSCRIPTEN_EVENT_WEBGLCONTEXTRESTORED
      EMSCRIPTEN_EVENT_MOUSEENTER
      EMSCRIPTEN_EVENT_MOUSELEAVE
      EMSCRIPTEN_EVENT_MOUSEOVER
      EMSCRIPTEN_EVENT_MOUSEOUT
      EMSCRIPTEN_EVENT_POINTERLOCKERROR
      */

      case EMSCRIPTEN_EVENT_RESIZE:
      case EMSCRIPTEN_EVENT_CANVASRESIZED:
      //case EMSCRIPTEN_EVENT_SCROLL:
      {
         int w = 0, h = 0;
         double dw = 0, dh = 0;
#ifdef EMSCRIPTEN_DEBUG
         printf("uievent/resize\n");
         printf("documentBodyClient %4dx%-4d\n", e->documentBodyClientWidth, e->documentBodyClientHeight);
         printf("windowInner        %4dx%-4d\n", e->windowInnerWidth, e->windowInnerHeight);
         printf("windowOuter        %4dx%-4d\n", e->windowOuterWidth, e->windowOuterHeight);
#endif
         emscripten_get_element_css_size(target, &dw, &dh);
      // w = (int)dw, h = (int)dh;
#ifdef EMSCRIPTEN_DEBUG
         printf("getElementCssSize  --interface--  %4dx%-4d\n", w, h);
#endif
         w = e->windowInnerWidth, h = e->windowInnerHeight;
         if(w && h)
         {
            emscripten_set_canvas_element_size(target, w, h);
            guiApp.desktop.ExternalPosition(0,0, w, h);
            if(guiApp.desktop.display && guiApp.desktop.display.displaySystem)
               guiApp.desktop.display.Resize(w, h);
         }
         //PrintLn("EMSCRIPTEN_EVENT_RESIZE: ", w, " x ", h);
#ifdef EMSCRIPTEN_DEBUG
         printf("scroll             %4dx%-4d\n", e->scrollTop, e->scrollLeft);
#endif
         break;
      }
      default:
#ifdef EMSCRIPTEN_DEBUG
         printf("%s, detail: %ld, document.body.client size: (%d,%d), window.inner size: (%d,%d), scrollPos: (%d, %d)\n",
               emscripten_event_type_to_string(eventType), e->detail, e->documentBodyClientWidth, e->documentBodyClientHeight,
               e->windowInnerWidth, e->windowInnerHeight, e->scrollTop, e->scrollLeft);
#endif
         break;
   }
   return EM_FALSE;
}

EM_BOOL focusevent_callback(int eventType, const EmscriptenFocusEvent *e, void *userData)
{
   /*
   EM_UTF8 nodeName[EM_HTML5_LONG_STRING_LEN_BYTES];
   EM_UTF8 id[EM_HTML5_LONG_STRING_LEN_BYTES];
   */
#ifdef EMSCRIPTEN_DEBUG
   printf("%s, nodeName: \"%s\", id: \"%s\"\n", emscripten_event_type_to_string(eventType), e->nodeName, e->id[0] == '\0' ? "(empty string)" : e->id);
#endif
   return 0;
}

static inline void emReturnTest(const char * name, EMSCRIPTEN_RESULT ret, int * okCount)
{
   if(ret == EMSCRIPTEN_RESULT_SUCCESS)
      ++(*okCount);
   else
      printf("error: %s call failure: %s\n", name, emscripten_result_to_string(ret));
}

class EmscriptenInterface : Interface
{
   class_property(name) = "Emscripten";

   // --- User Interface System ---

   bool ::Initialize()
   {
      int okCount = 0;
      // EMSCRIPTEN_RESULT ret;
      // The event listener is applied to the JavaScript:
      const char * invalid = EMSCRIPTEN_EVENT_TARGET_INVALID;     // 0
      const char * document = EMSCRIPTEN_EVENT_TARGET_DOCUMENT;   // 'document' object.
      const char * window = EMSCRIPTEN_EVENT_TARGET_WINDOW;       // 'window' object.
      const char * screen = EMSCRIPTEN_EVENT_TARGET_SCREEN;       // 'window.screen' object.
      const char * canvas = target;                               // #canvas

      emReturnTest("emscripten_set_resize_callback",              emscripten_set_resize_callback(window, null, 0, uievent_callback), &okCount);
   // emReturnTest("emscripten_set_scroll_callback",              emscripten_set_scroll_callback(document, null, 1, uievent_callback), &okCount);

      emReturnTest("emscripten_set_click_callback",               emscripten_set_click_callback(window, null, 1, mouse_callback), &okCount);
      emReturnTest("emscripten_set_mousedown_callback",           emscripten_set_mousedown_callback(window, null, 1, mouse_callback), &okCount);
      emReturnTest("emscripten_set_mouseup_callback",             emscripten_set_mouseup_callback(window, null, 1, mouse_callback), &okCount);
      emReturnTest("emscripten_set_dblclick_callback",            emscripten_set_dblclick_callback(window, null, 1, mouse_callback), &okCount);
      emReturnTest("emscripten_set_mousemove_callback",           emscripten_set_mousemove_callback(window, null, 1, mouse_callback), &okCount);
   // emReturnTest("emscripten_set_mouseenter_callback",          emscripten_set_mouseenter_callback(canvas, null, 1, mouse_callback), &okCount);
   // emReturnTest("emscripten_set_mouseleave_callback",          emscripten_set_mouseleave_callback(canvas, null, 1, mouse_callback), &okCount);

      emReturnTest("emscripten_set_wheel_callback",               emscripten_set_wheel_callback(canvas, null, 1, wheel_callback), &okCount);

      emReturnTest("emscripten_set_keypress_callback",            emscripten_set_keypress_callback(window, null, 1, key_callback), &okCount);
      emReturnTest("emscripten_set_keydown_callback",             emscripten_set_keydown_callback(window, null, 1, key_callback), &okCount);
      emReturnTest("emscripten_set_keyup_callback",               emscripten_set_keyup_callback(window, null, 1, key_callback), &okCount);

      emReturnTest("emscripten_set_pointerlockchange_callback",   emscripten_set_pointerlockchange_callback(document, null, 1, pointerlockchange_callback), &okCount);
      emReturnTest("emscripten_set_fullscreenchange_callback",    emscripten_set_fullscreenchange_callback(document, null, 1, fullscreenchange_callback), &okCount);

   // emReturnTest("emscripten_set_blur_callback",                emscripten_set_blur_callback(window, null, 1, focusevent_callback), &okCount);
   // emReturnTest("emscripten_set_focus_callback",               emscripten_set_focus_callback(window, null, 1, focusevent_callback), &okCount);
   // emReturnTest("emscripten_set_focusin_callback",             emscripten_set_focusin_callback(window, null, 1, focusevent_callback), &okCount);
   // emReturnTest("emscripten_set_focusout_callback",            emscripten_set_focusout_callback(window, null, 1, focusevent_callback), &okCount);

   // emReturnTest("emscripten_set_deviceorientation_callback",   emscripten_set_deviceorientation_callback(null, 1, deviceorientation_callback), &okCount);
   // emReturnTest("emscripten_set_devicemotion_callback",        emscripten_set_devicemotion_callback(null, 1, devicemotion_callback), &okCount);

   // emReturnTest("emscripten_set_orientationchange_callback",   emscripten_set_orientationchange_callback(null, 1, orientationchange_callback), &okCount);

      emReturnTest("emscripten_set_touchstart_callback",          emscripten_set_touchstart_callback(window, null, 1, touch_callback), &okCount);
      emReturnTest("emscripten_set_touchend_callback",            emscripten_set_touchend_callback(window, null, 1, touch_callback), &okCount);
      emReturnTest("emscripten_set_touchmove_callback",           emscripten_set_touchmove_callback(window, null, 1, touch_callback), &okCount);
      emReturnTest("emscripten_set_touchcancel_callback",         emscripten_set_touchcancel_callback(window, null, 1, touch_callback), &okCount);

      emReturnTest("emscripten_set_webglcontextlost_callback",    emscripten_set_webglcontextlost_callback(canvas, null, 1, webglcontext_callback), &okCount);
      emReturnTest("emscripten_set_webglcontextrestored_callback",emscripten_set_webglcontextrestored_callback(canvas, null, 1, webglcontext_callback), &okCount);

      // emscripten_log(EM_LOG_CONSOLE, "EmscriptenInterface::Initialize OK\n");

#ifdef EMSCRIPTEN_DEBUG
      printf("AAA EmscriptenInterface::Initialize -- %dxOk\n", okCount);
      emscripten_run_script("Module.setStatus('Actually Running...');");
      printf("BBB EmscriptenInterface::Initialize -- is it working?\n");
      emscripten_run_script("statusElement.innerHTML = 'this is a test'; statusElement.hidden = false;");
#endif

      if(guiApp.desktop)
         emscripten_set_window_title(guiApp.desktop.caption);
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
         emscripten_request_fullscreen(target, 1);
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
         emscripten_request_pointerlock(target, 1);
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
