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

//#include <GLES2/gl2.h>
#include <GL/glfw.h>
#include <emscripten/emscripten.h>

#undef property
#undef uint


class EmscriptenInterface : Interface
{
   class_property(name) = "Emscripten";


   // --- User Interface System ---

   bool ::Initialize()
   {
      sflnprintf("class(EmscriptenInterface) ::Initialize [STUB!]\n");
      return true;
   }

   void ::Terminate()
   {
      sflnprintf("class(EmscriptenInterface) ::Terminate [STUB!]\n");
   }

   bool ::ProcessInput(bool processAll)
   {
      sflnprintf("class(EmscriptenInterface) ::ProcessInput [STUB!]\n");
      return false;
   }

   void ::Wait()
   {
      sflnprintf("class(EmscriptenInterface) ::Wait [STUB!]\n");
   }

   void ::Lock(Window window)
   {
      sflnprintf("class(EmscriptenInterface) ::Lock [STUB!]\n");
   }

   void ::Unlock(Window window)
   {
      sflnprintf("class(EmscriptenInterface) ::Unlock [STUB!]\n");
   }

   void ::SetTimerResolution(uint hertz)
   {
      sflnprintf("class(EmscriptenInterface) ::SetTimerResolution [STUB!] Implement high resolution timer here\n");
   }

   const char ** ::GraphicsDrivers(int * numDrivers)
   {
      //sflnprintf("class(EmscriptenInterface) ::GraphicsDrivers [STUB!]\n");
      static const char *graphicsDrivers[] = { "OpenGL" };
      *numDrivers = sizeof(graphicsDrivers) / sizeof(char *);
      return (const char **)graphicsDrivers;
      return null;
   }

   void ::EnsureFullScreen(bool * fullScreen)
   {
      sflnprintf("class(EmscriptenInterface) ::EnsureFullScreen [STUB!]\n");
      *fullScreen = true;
   }

   void ::GetCurrentMode(bool * fullScreen, Resolution * resolution, PixelFormat * colorDepth, int * refreshRate)
   {
      sflnprintf("class(EmscriptenInterface) ::GetCurrentMode [STUB!]\n");
   }

   bool ::ScreenMode(bool fullScreen, Resolution resolution, PixelFormat colorDepth, int refreshRate, bool * textMode)
   {
      sflnprintf("class(EmscriptenInterface) ::ScreenMode [STUB!]\n");
      return true;
   }


   // --- Window Creation ---

   void * ::CreateRootWindow(Window window)
   {
      sflnprintf("class(EmscriptenInterface) ::CreateRootWindow [STUB!]\n");
      return null;
   }

   void ::DestroyRootWindow(Window window)
   {
      sflnprintf("class(EmscriptenInterface) ::DestroyRootWindow [STUB!]\n");
   }


   // --- Window manipulation ---

   void ::SetRootWindowCaption(Window window, const char * name)
   {
      sflnprintf("class(EmscriptenInterface) ::SetRootWindowCaption [STUB!]\n");
   }

   void ::PositionRootWindow(Window window, int x, int y, int w, int h, bool move, bool resize)
   {
      sflnprintf("class(EmscriptenInterface) ::Stub [STUB!]\n");
   }

   void ::OffsetWindow(Window window, int * x, int * y)
   {
      sflnprintf("class(EmscriptenInterface) ::OffsetWindow [STUB!]\n");
   }

   void ::UpdateRootWindow(Window window)
   {
      sflnprintf("class(EmscriptenInterface) ::UpdateRootWindow [STUB!]\n");
   }

   void ::SetRootWindowState(Window window, WindowState state, bool visible)
   {
      sflnprintf("class(EmscriptenInterface) ::SetRootWindowState [STUB!]\n");
   }

   void ::ActivateRootWindow(Window window)
   {
      sflnprintf("class(EmscriptenInterface) ::ActivateRootWindow [STUB!]\n");
   }

   void ::OrderRootWindow(Window window, bool topMost)
   {
      sflnprintf("class(EmscriptenInterface) ::OrderRootWindow [STUB!]\n");
   }

   void ::SetRootWindowColor(Window window)
   {
      sflnprintf("class(EmscriptenInterface) ::SetRootWindowColor [STUB!]\n");
   }

   void ::FlashRootWindow(Window window)
   {
      sflnprintf("class(EmscriptenInterface) ::FlashRootWindow [STUB!]\n");
   }


   // --- Mouse-based window movement ---

   void ::StartMoving(Window window, int x, int y, bool fromKeyBoard)
   {
      sflnprintf("class(EmscriptenInterface) ::StartMoving [STUB!]\n");
   }

   void ::StopMoving(Window window)
   {
      sflnprintf("class(EmscriptenInterface) ::StopMoving [STUB!]\n");
   }


   // --- Mouse manipulation ---

   void ::GetMousePosition(int *x, int *y)
   {
      sflnprintf("class(EmscriptenInterface) ::GetMousePosition [STUB!]\n");
   }

   void ::SetMousePosition(int x, int y)
   {
      sflnprintf("class(EmscriptenInterface) ::SetMousePosition [STUB!]\n");
   }

   void ::SetMouseRange(Window window, Box box)
   {
      sflnprintf("class(EmscriptenInterface) ::SetMouseRange [STUB!]\n");
   }

   void ::SetMouseCapture(Window window)
   {
      sflnprintf("class(EmscriptenInterface) ::SetMouseCapture [STUB!]\n");
   }


   // --- Mouse cursor ---

   void ::SetMouseCursor(Window window, SystemCursor cursor)
   {
      sflnprintf("class(EmscriptenInterface) ::SetMouseCursor [STUB!]\n");
   }


   // --- Caret manipulation ---

   void ::SetCaret(int caretX, int caretY, int size)
   {
      sflnprintf("class(EmscriptenInterface) ::SetCaret [STUB!]\n");
   }


   // --- Clipboard manipulation ---

   void ::ClearClipboard()
   {
      sflnprintf("class(EmscriptenInterface) ::ClearClipboard [STUB!]\n");
   }

   bool ::AllocateClipboard(ClipBoard clipBoard, uint size)
   {
      sflnprintf("class(EmscriptenInterface) ::AllocateClipboard [STUB!]\n");
      return false;
   }

   bool ::SaveClipboard(ClipBoard clipBoard)
   {
      sflnprintf("class(EmscriptenInterface) ::SaveClipboard [STUB!]\n");
      return false;
   }

   bool ::LoadClipboard(ClipBoard clipBoard)
   {
      sflnprintf("class(EmscriptenInterface) ::LoadClipboard [STUB!]\n");
      return false;
   }

   void ::UnloadClipboard(ClipBoard clipBoard)
   {
      sflnprintf("class(EmscriptenInterface) ::UnloadClipboard [STUB!]\n");
   }


   // --- State based input ---

   bool ::AcquireInput(Window window, bool state)
   {
      sflnprintf("class(EmscriptenInterface) ::AcquireInput [STUB!]\n");
      return false;
   }

   bool ::GetMouseState(MouseButtons * buttons, int * x, int * y)
   {
      sflnprintf("class(EmscriptenInterface) ::GetMouseState [STUB!]\n");
      return false;
   }

   bool ::GetJoystickState(int device, Joystick joystick)
   {
      sflnprintf("class(EmscriptenInterface) ::GetJoystickState [STUB!]\n");
      return false;
   }

   bool ::GetKeyState(Key key)
   {
      sflnprintf("class(EmscriptenInterface) ::GetKeyState [STUB!]\n");
      return false;
   }

   bool ::SetIcon(Window window, BitmapResource icon)
   {
      sflnprintf("class(EmscriptenInterface) ::SetIcon [STUB!]\n");
      return false;
   }

   void ::GetScreenArea(Window window, Box box)
   {
      sflnprintf("class(EmscriptenInterface) ::GetScreenArea [STUB!]\n");
   }
}

#endif
