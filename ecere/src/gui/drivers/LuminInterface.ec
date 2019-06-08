#define _Noreturn

namespace gui::drivers;

#include <locale.h>

#include <ml_graphics.h>
#include <ml_head_tracking.h>
#include <ml_perception.h>
#include <ml_lifecycle.h>
#include <ml_logging.h>
#include <ml_controller.h>
#include <ml_input.h>

import "Window"
import "Interface"

import "egl"

static bool initialized;

static int desktopW, desktopH;
static char * clipBoardData;
static float mouseX = 320, mouseY = 240;
static bool acquiredInputMode;
static MouseButtons buttonsState;
static Pointf lastButtonPressedPos[2];
static float relMouseX, relMouseY;

static MLHandle inputTracker;
static Pointf lastTouchPos[2];
static bool touchPadDown[2];
static bool wasActiveLastPass[2];
static float lastTouchPadForce[2];
static bool wasButtonPressedLastPass_trigger[2];
static bool wasButtonPressedLastPass_bumper[2];

enum MouseEvent { OnTrigger, OnBumper, OnTouchpad };
static MouseEvent prevMouseButtonEvent[2];

default:
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonUp;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightDoubleClick;
private:

const char application_name[] = "com.magicleap.ecereapp -- but not really"; // minor todo

enum AppState { zero, paused, resumed };

struct ApplicationContext
{
   AppState state;
};

ApplicationContext application_context { };

MLLifecycleCallbacks lifecycle_callbacks = {0};
MLGraphicsOptions graphics_options = { 0, MLSurfaceFormat_RGBA8UNorm, MLSurfaceFormat_D32Float };
MLHandle opengl_context;
MLHandle head_tracker;

// callbacks
static void onStop(void * appContext)
{
   ((ApplicationContext*)appContext)->state = zero; // ((struct application_context_t*)application_context)->dummy_value = 0;
   ML_LOG(Info, "On stop called.");
}

static void onPause(void * appContext)
{
   ((ApplicationContext*)appContext)->state = paused; // ((struct application_context_t*)application_context)->dummy_value = 1;
   ML_LOG(Info, "On pause called.");
}

static void onResume(void * appContext)
{
   ((ApplicationContext*)appContext)->state = resumed; // ((struct application_context_t*)application_context)->dummy_value = 2;
   ML_LOG(Info, "On resume called.");
}


class LuminInterface : Interface
{
   class_property(name) = "Lumin";

   // --- User Interface System ---
   bool Initialize()
   {
      setlocale(LC_ALL, "en_US.UTF-8");
      initialized = false;

      lifecycle_callbacks.on_stop = onStop;
      lifecycle_callbacks.on_pause = onPause;
      lifecycle_callbacks.on_resume = onResume;

      application_context.state = resumed;

      if(MLResult_Ok != MLLifecycleInit(&lifecycle_callbacks, (void*)&application_context))
      {
         ML_LOG(Error, "Failed to initialize lifecycle.");
         return false;
      }

      MLInputConfiguration config;
      MLResult r;
      int i;
      for(i = 0; i < MLInput_MaxControllers; i++)
         config.dof[i] = MLInputControllerDof_6;
      r = MLInputCreate(&config, &inputTracker);
      if(r != MLResult_Ok) //&mlContext->inputTracker
      {
         ML_LOG(Error, "Failed to create input tracker: %d:%s", r, MLGetResultString(r));//application_name
         return false;
      }
      return true;
   }

   void Terminate()
   {
      ML_LOG(Error, "LuminInterface::Terminate() -- some todo?");

      // clean up system
      MLGraphicsDestroyClient(&graphics_client);
      MLPerceptionShutdown();

      MLResult r = MLInputDestroy(inputTracker);
      if(r != MLResult_Ok)
      {
         ML_LOG(Error, "Failed to destroy input tracker: %d:%s", r, MLGetResultString(r));
      }
   }

   #define DBLCLICK_DELAY  300   // 0.3 second
   #define DBLCLICK_DELTA  1

   bool ProcessInput(bool processAll)
   {
      static Time lastTime, lastClickTime;
      Time time = GetTime();
      bool eventAvailable = false;
      int w = 640 * 2;
      int h = 480 * 2;
      MLResult r;
      int controllerID = 1; //or 2
      Time diffTime;

      if(!initialized)
      {
         const char * loc = "LuminInterface::ProcessInput()/initialize";
         // initialize perception system
         MLPerceptionSettings perception_settings = {0};
         if(MLResult_Ok != MLPerceptionInitSettings(&perception_settings))
         {
            ML_LOG(Error, "Failed to initialize perception.");
            //return false; // example didn't return here so we don't?
         }

         if(MLResult_Ok != MLPerceptionStartup(&perception_settings))
         {
            ML_LOG(Error, "Failed to startup perception.");
            return false;
         }

         // Get ready to connect our GL context to the MLSDK graphics API
         MLGraphicsOptions graphics_options = { 0, MLSurfaceFormat_RGBA8UNorm, MLSurfaceFormat_D32Float };
         graphics_client = ML_INVALID_HANDLE;

         r = MLGraphicsCreateClientGL(&graphics_options, eglContext, &graphics_client);
         if(MLResult_Ok != r)
            ML_LOG(Error, "MLGraphicsCreateClientGL complained: %d:%s", r, MLGetResultString(r));
         ML_LOG(Info, "%s: graphics_client:%p", loc, graphics_client);

         // Now that graphics is connected, the app is ready to go
         if(MLResult_Ok != MLLifecycleSetReadyIndication())
         {
            ML_LOG(Error, "Failed to indicate lifecycle ready.");
            return false;
         }

         initialized = true;

         lastTime = time;
         lastClickTime = time;
      }

      int i = 0;
      //MLResult r;

      diffTime = time - lastTime;
      lastTime = time;

      MLInputControllerState inputStates[MLInput_MaxControllers];
      r = MLInputGetControllerState(inputTracker, inputStates);   //
      //if(result == MLResult_Ok)
      for(i = 0; i < MLInput_MaxControllers; ++i)
      {
         MLInputControllerState * ctrlState = &inputStates[i];  // is this yielding position from having input only?
         bool is_connected = ctrlState->is_connected;
         if(is_connected)
         {
            //int myresult = MLResult_Ok;
            //PrintLn("ok is ", myresult);
            float trigger = ctrlState->trigger_normalized;
            float bumper = ctrlState->button_state[MLInputControllerButton_Bumper] ? 1.0f : 0.0f;
            float home = ctrlState->button_state[MLInputControllerButton_HomeTap] ? 1.0f : 0.0f;
            bool isTouchActive = ctrlState->is_touch_active[i];
            MLVec3f * touchPosAndForce = &ctrlState->touch_pos_and_force[i];
            float triggerThreshPos = 0.2f;
            float touchPadPressedForce = 0.05f;
            float dxButtonPressed = 0, dyButtonPressed = 0;
            bool triggerPressed = trigger > triggerThreshPos;
            bool touchPadPressed = isTouchActive ? touchPosAndForce->z > touchPadPressedForce : false;

            Modifiers keyFlags = 0;
            if(isTouchActive)
            {
               MLInputControllerTouchpadGesture gesture = ctrlState->touchpad_gesture;
               MLInputControllerTouchpadGestureState gestureState = ctrlState->touchpad_gesture_state;
               float tx = touchPosAndForce->x, ty = touchPosAndForce->y, dx = 0, dy = 0;

               if(wasActiveLastPass[i])
               {
                  dx = tx - lastTouchPos[i].x;
                  dy = ty - lastTouchPos[i].y;
               }

               if(dx) dx = Sgn(dx) * pow(fabs(dx), 1.3);
               if(dy) dy = Sgn(dy) * pow(fabs(dy), 1.3);

               // Non-Acquired Input Mode
               if(acquiredInputMode == false)
               {
                  float deltaMouseX = 0;
                  float deltaMouseY = 0;

                  if(wasActiveLastPass[i] == true)
                  {
                     deltaMouseX = dx * 500;
                     deltaMouseY = dy * 500;

                     //PrintLn("dx: ", deltaMouseX, ", dy: ", deltaMouseY);
                  }

                  mouseX += deltaMouseX;
                  mouseY -= deltaMouseY;

                  mouseX = Min(w-1, Max(0.0f, mouseX));
                  mouseY = Min(h-1, Max(0.0f, mouseY));

                  dxButtonPressed = Abs(mouseX - lastButtonPressedPos[i].x);
                  dyButtonPressed = Abs(mouseY - lastButtonPressedPos[i].y);

                  guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove,
                     (int)mouseX, (int)mouseY, &keyFlags, true, true);
               }
               else
               {
                  relMouseX += dx;
                  relMouseY += dy;
               }
               lastTouchPos[i] = { tx, ty };
               lastTouchPadForce[i] = touchPosAndForce->z;
            }
            else
            {
               touchPadDown[i] = false;
               lastTouchPadForce[i] = 0;
            }

            if(acquiredInputMode == false)
            {
               dxButtonPressed = Abs(mouseX - lastButtonPressedPos[i].x);
               dyButtonPressed = Abs(mouseY - lastButtonPressedPos[i].y);

               // on button up - touchpad
               if(!touchPadPressed && touchPadDown[i])
               {
                  guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp,
                     (int)mouseX, (int)mouseY,&keyFlags,true, true);

                  if(prevMouseButtonEvent[i] == OnTouchpad && (time - lastClickTime) < 0.4 && dxButtonPressed < 2 && dyButtonPressed < 2)
                     guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick,
                        mouseX, mouseY, &keyFlags, true, true);

                  lastClickTime = time;
                  prevMouseButtonEvent[i] = OnTouchpad;
                  lastButtonPressedPos[i].x = mouseX;
                  lastButtonPressedPos[i].y = mouseY;
                  touchPadDown[i] = false;

               }
               // on button down - touchpad
               else if(touchPadPressed && !touchPadDown[i])
               {
                  touchPadDown[i] = true;
                  guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown,
                     mouseX, mouseY, &keyFlags, true, true);
               }

               // on button up - trigger
               if(wasButtonPressedLastPass_trigger[i] && !triggerPressed)
               {
                  guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonUp,
                     mouseX, mouseY, &keyFlags, true, true);

                  if(prevMouseButtonEvent[i] == OnTrigger && (time - lastClickTime) < 0.4 && dxButtonPressed < 2 && dyButtonPressed < 2)
                     guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightDoubleClick,
                        mouseX, mouseY, &keyFlags, true, true);

                  lastClickTime = time;
                  prevMouseButtonEvent[i] = OnTrigger;
               }
               // on button down - trigger
               else if(!wasButtonPressedLastPass_trigger[i] && triggerPressed)
                  guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown,
                     mouseX, mouseY, &keyFlags, true, true);

               // on button up - bumper
               if(wasButtonPressedLastPass_bumper[i] && !bumper)
               {
                  guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp,
                     mouseX, mouseY, &keyFlags, true, true);

                  if(prevMouseButtonEvent[i] == OnBumper && (time - lastClickTime) < 0.4 && dxButtonPressed < 2 && dyButtonPressed < 2)
                     guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick,
                        mouseX, mouseY, &keyFlags, true, true);

                  prevMouseButtonEvent[i] = OnBumper;
                  lastClickTime = time;
               }
               // on button down - bumper
               else if(!wasButtonPressedLastPass_bumper[i] && bumper)
                  guiApp.desktop.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown,
                     mouseX, mouseY, &keyFlags, true, true);
            }
            wasButtonPressedLastPass_trigger[i] = triggerPressed;
            wasButtonPressedLastPass_bumper[i] = bumper ? true : false;
            wasActiveLastPass[i] = isTouchActive;

            buttonsState =
            {
               left = triggerPressed,
               right = bumper ? true : false
            };
         }
         else
         {
            wasButtonPressedLastPass_trigger[i] = false;
            wasButtonPressedLastPass_bumper[i] = false;
            wasActiveLastPass[i] = false;
            lastTouchPadForce[i] = 0;
            touchPadDown[i] = false;
         }
      }

      if(desktopW != w || desktopH != h)
      {
         guiApp.SetDesktopPosition(0, 0, w, h, true);
         desktopW = w;
         desktopH = h;
         guiApp.desktop.Update(null);
      }

      return eventAvailable;
   }

   void Wait()
   {
      // guiApp.WaitEvent();
   }

   void Lock(Window window)
   {
      ML_LOG(Error, "LuminInterface::Lock()");
   }

   void Unlock(Window window)
   {
      ML_LOG(Error, "LuminInterface::Unlock()");
   }

   const char ** GraphicsDrivers(int * numDrivers)
   {
      static const char *graphicsDrivers[] = { "OpenGL" };
      *numDrivers = sizeof(graphicsDrivers) / sizeof(char *);
      return (const char **)graphicsDrivers;
   }

   void GetCurrentMode(bool * fullScreen, int * resolution, int * colorDepth, int * refreshRate)
   {
      ML_LOG(Error, "LuminInterface::GetCurrentMode()");
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
      ML_LOG(Error, "LuminInterface::DestroyRootWindow()");
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
      ML_LOG(Error, "LuminInterface::OrderRootWindow()");
   }

   void SetRootWindowColor(Window window)
   {
      ML_LOG(Error, "LuminInterface::SetRootWindowColor()");
   }

   void OffsetWindow(Window window, int * x, int * y)
   {
   }

   void UpdateRootWindow(Window window)
   {
      ML_LOG(Error, "LuminInterface::UpdateRootWindow()");
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
      ML_LOG(Error, "LuminInterface::FlashRootWindow()");
   }

   void ActivateRootWindow(Window window)
   {
      ML_LOG(Error, "LuminInterface::ActivateRootWindow()");
   }

   // --- Mouse-based window movement ---

   void StartMoving(Window window, int x, int y, bool fromKeyBoard)
   {
      ML_LOG(Error, "LuminInterface::StartMoving()");
   }

   void StopMoving(Window window)
   {
      ML_LOG(Error, "LuminInterface::StopMoving()");
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
