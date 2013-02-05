namespace gui;

#if (defined(__unix__) || defined(__APPLE__)) && !defined(__ANDROID__)
#define property _property
#define new _new
#define class _class
#define uint _uint

#define Window    X11Window
#define Cursor    X11Cursor
#define Font      X11Font
#define Display   X11Display
#define Time      X11Time
#define KeyCode   X11KeyCode
#define Picture   X11Picture

#include <X11/Xutil.h>

#undef Window
#undef Cursor
#undef Font
#undef Display
#undef Time
#undef KeyCode
#undef Picture

#undef uint
#undef new
#undef property
#undef class

#endif

#if !defined(ECERE_VANILLA) && !defined(ECERE_NONET)
#if defined(__WIN32__)

#define WIN32_LEAN_AND_MEAN
#include <winsock.h>
static WSADATA wsaData;

#elif defined(__unix__) || defined(__APPLE__)

default:
#define uint _uint
#define set _set
#include <sys/time.h>
#include <unistd.h>

#include <netinet/in.h>
#include <netdb.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/time.h>
#include <arpa/inet.h>

#undef set
#undef uint

private:
typedef int SOCKET;
typedef struct hostent HOSTENT;
typedef struct sockaddr SOCKADDR;
typedef struct sockaddr_in SOCKADDR_IN;
typedef struct in_addr IN_ADDR;
#define closesocket(s) close(s)

#endif

import "network"
#endif

#if defined(__APPLE__) && !defined(ECERE_VANILLA)
import "CocoaInterface"
#endif

#if (defined(__unix__) || defined(__APPLE__)) && !defined(__ANDROID__)
import "XInterface"
#endif

import "Window"

/*static */bool guiApplicationInitialized = false;
GuiApplication guiApp;
int terminateX;

enum GuiErrorCode : ErrorCode
{
   driverNotSupported      = ErrorCode { VeryFatal, 1 },
   windowCreationFailed    = ErrorCode { VeryFatal, 2 },
   graphicsLoadingFailed   = ErrorCode { VeryFatal, 3 },
   modeSwitchFailed        = ErrorCode { VeryFatal, 4 }
};

static Array<String> errorMessages
{ [
   $"No error",
   $"Graphics driver not supported by any user interface system",
   $"Window creation failed",
   $"Window graphics loading failed",
   $"Driver/Mode switch failed"
] };

public class GuiApplication : Application
{
   int numDrivers;
   char ** driverNames;
   int numSkins;
   char ** skinNames;

   bool textMode;

   subclass(Interface) interfaceDriver;
   subclass(Skin) currentSkin;

   // Desktop window
   Window desktop;

   // Screen mode flags
   bool modeSwitching;
   bool fullScreenMode; // Needs to start at true for the desktop to resize

   bool fullScreen;
   Resolution resolution;
   PixelFormat pixelFormat;
   int refreshRate;

   char * defaultDisplayDriver;

   Cursor systemCursors[SystemCursor];

   bool cursorUpdate;

   OldList customCursors;

   // Window Timers
   OldList windowTimers;

   // Mouse events
   Window prevWindow;     // Used for OnMouseLeave
   Window windowCaptured;

   // Mouse based moving & resizing
   Window windowMoving;
   Point windowMovingStart;
   Point windowMovingBefore;
   Size windowResizingBefore;
   Point movingLast;
   bool windowIsResizing;
   bool resizeX, resizeEndX;
   bool resizeY, resizeEndY;

   // Mouse based scrolling
   Window windowScrolling;
   Point windowScrollingBefore, windowScrollingStart;

   // Mouse cursors
   Bitmap cursorBackground { };
   int cursorBackgroundX, cursorBackgroundY;
   int cursorBackgroundW, cursorBackgroundH;

   // Carets
   Window caretOwner;

   // State based input
   Window acquiredWindow;
   int acquiredMouseX, acquiredMouseY;

   Cursor currentCursor;

   uint errorLevel, lastErrorCode;

   bool processAll;

   Mutex waitMutex {};
   bool waiting;
   Mutex lockMutex {};

   Window interimWindow;
   bool caretEnabled;

   char appName[1024];
   uint timerResolution;

   Size virtualScreen;   
   Point virtualScreenPos;

   int mainThread;

   GuiApplication()
   {
      SystemCursor c;
      
      mainThread = GetCurrentThreadID();
      if(!guiApp)
         guiApp = this;

      strcpy(appName, $"ECERE Application");

      processAll = true;

      // TODO:
      // customCursors.offset = OFFSET(Cursor, prev);
      windowTimers.offset = (uint)&((Timer)0).prev;

      for(c = 0; c<SystemCursor::enumSize; c++)
         systemCursors[c] = Cursor { systemCursor = c; };

      globalSystem.eventSemaphore = Semaphore { };
      globalSystem.fileMonitorMutex = Mutex { };
      globalSystem.fileMonitors.offset = (uint)&((FileMonitor)0).prev;
      return true;
   }

   ~GuiApplication()
   {
      SystemCursor c;

      if(desktop)
         desktop.Destroy(0);
      delete desktop;
      customCursors.Clear();

#if (defined(__unix__) || defined(__APPLE__)) && !defined(__ANDROID__)
      if(xGlobalDisplay)
         XUnlockDisplay(xGlobalDisplay);
#endif

#if !defined(__ANDROID__)
      // Because destruction of app won't be from main thread
      if(guiApplicationInitialized)
         lockMutex.Release();
#endif

      if(interfaceDriver)
      {
         interfaceDriver.Terminate();
      }

      // interfaceDrivers.Free(null);
      delete driverNames;

      // skins.Free(null);
      delete skinNames;

      for(c = 0; c<SystemCursor::enumSize; c++)
         delete systemCursors[c];

#if !defined(ECERE_VANILLA) && !defined(ECERE_NONET)
      Network_Terminate();
#endif

      delete globalSystem.eventSemaphore;
      delete globalSystem.fileMonitorMutex;
      delete globalSystem.fileMonitorThread;

      UnapplySkin(class(Window));

      // Stop all timers
      {
         Timer timer, nextTimer;
         for(timer = windowTimers.first; timer; timer = nextTimer)
         {
            nextTimer = timer.next;
            timer.Stop();
         }
      }
   }

   bool UpdateTimers()
   {
      bool result = false;
      Time time = GetTime();
      Timer timer;

      for(timer = windowTimers.first; timer; timer = timer.next)
         timer.dispatched = false;
      for(;;)
      {
         for(timer = windowTimers.first; timer; timer = timer.next)
         {
            if(!timer.dispatched)
            {
               if((timer.delay - (Seconds)(time - timer.lastTime)) < Seconds { 0.00001 })
               {
                  incref timer;
                  timer.lastTime = time;
                  if(timer.DelayExpired(timer.window))
                     result = true;
                  timer.dispatched = true;
                  //delete timer;
                  eInstance_DecRef(timer);
                  break;
               }
            }
         }
         if(!timer) break;
      }
      return result;
   }

   // --- Mouse-based window movement ---
   void SetCurrentCursor(Cursor cursor)
   {
      currentCursor = cursor;
      if(cursor)
      {
         if(fullScreenMode && cursor.bitmap)
            interfaceDriver.SetMouseCursor((SystemCursor)-1);
         else
         {
            interfaceDriver.SetMouseCursor(cursor.systemCursor);
            cursorBackground.Free();
         }
      }
      cursorUpdate = true;
   }

   void PreserveAndDrawCursor()
   {
      /*
      if(!acquiredWindow && cursorUpdate && currentCursor && currentCursor->bitmap)
      {
         int mouseX, mouseY;
         Surface surface;
         Box against = {0,0, desktop.w-1,desktop.h-1};
         Box box = {0, 0, currentCursor->bitmap->width,currentCursor->bitmap->height};

         interfaceDriver->GetMousePosition(&mouseX, &mouseY);

         mouseX -= currentCursor->hotSpotX;
         mouseY -= currentCursor->hotSpotY;

         // Preserve Background
         if(!(eDisplay_GetFlags(desktop.display) & DISPLAY_FLIPPING))
         {
            cursorBackgroundX = mouseX;
            cursorBackgroundY = mouseY;
            cursorBackgroundW = currentCursor->bitmap->width;
            cursorBackgroundH = currentCursor->bitmap->height;
            eDisplay_Grab(desktop.display, cursorBackground,
               mouseX, mouseY, cursorBackgroundW, cursorBackgroundH);
         }

         eBox_ClipOffset(&box, &against, mouseX, mouseY);

         if(!(eDisplay_GetFlags(desktop.display) & DISPLAY_FLIPPING))
            eDisplay_StartUpdate(desktop.display);
         // Display Cursor
         surface = eDisplay_GetSurface(desktop.display, mouseX, mouseY, &box);
         if(surface)
         {
            eSurface_SetForeground(surface, WHITE);
            eSurface_Blit(surface, currentCursor->bitmap, 0,0, 0,0,
               currentCursor->bitmap->width,currentCursor->bitmap->height);
            eInstance_Delete(surface);

            if(!(eDisplay_GetFlags(desktop.display) & DISPLAY_FLIPPING))
            {
               box.left += mouseX;
               box.right += mouseX;
               box.top += mouseY;
               box.bottom += mouseY;
               eDisplay_Update(desktop.display, &box);
            }
         }
         if(!(eDisplay_GetFlags(desktop.display) & DISPLAY_FLIPPING))
            eDisplay_EndUpdate(desktop.display);
      }
      */
   }

   void RestoreCursorBackground()
   {
      /*
      // Restore Cursor Background
      if(cursorBackground && desktop.active)
      {
         Box box = {0, 0, cursorBackgroundW-1,cursorBackgroundH-1};
         Box against = {0,0, desktop.w-1,desktop.h-1};
         Surface surface;

         eBox_ClipOffset(&box, &against, cursorBackgroundX, cursorBackgroundY);
         if((surface = eDisplay_GetSurface(desktop.display, cursorBackgroundX,cursorBackgroundY, &box)))
         {
            eSurface_Blit(surface, cursorBackground, 0, 0, 0,0, cursorBackgroundW,cursorBackgroundH);
            eInstance_Delete(surface);
         }
      }
      */
   }

   bool IsModeSwitching()
   {
      return modeSwitching;
   }  

   public bool SetDesktopPosition(int x, int y, int w, int h, bool moveChildren)
   {
      bool result = true;
      bool windowResized = desktop.size.w != w || desktop.size.h != h;
      bool windowMoved = desktop.clientStart.x != x || desktop.clientStart.y != y;

      if((windowResized || windowMoved) && moveChildren)
      {
         Window child;
         desktop.Position(x, y, w, h, true, true, true, true, false, false);

         // Maximized native decorations windows suffer when we drag the dock around, so remaximize them
         // It's a little jumpy, but oh well.
         for(child = desktop.children.first; child; child = child.next)
         {
            if(child.nativeDecorations && child.rootWindow == child && child.state == maximized)
            {
               child.state = normal;
               child.state = maximized;
            }
         }
         /*for(child = desktop.children.first; child; child = child.next)
         {
            if(!child.systemParent)
            {
               if(child.anchored)
               {
                  int x, y, w, h;
                  child.ComputeAnchors(
                     child.ax, child.ay, child.aw, child.ah,
                     &x, &y, &w, &h);
                  child.Position(x, y, w, h, true, true, true, true, false);
               }
               if(child.state == Maximized)
               {
                  child.x = desktop.x;
                  child.y = desktop.y;
                  child.ComputeAnchors(, 
                     A_LEFT,A_LEFT,A_OFFSET,A_OFFSET, 
                     &x, &y, &w, &h);
                  child.Position(, x, y, w, h, false, true, true, true, false);
               }           
            }
         }*/
         if(desktop.display)
         {
            desktop.display.Lock(true);
            if(windowResized)
            {
               if(!desktop.display.Resize(desktop.size.w, desktop.size.h))
                  result = false;

               desktop.dirty = true;
               if(!desktop.display.flags.flipping)
                  desktop.Update(null);
            }
            // When does the desktop have a display in not fullscreen mode?
            if(!fullScreenMode && !modeSwitching)
               desktop.UpdateDisplay();
            desktop.display.Unlock();
         }
      }
      else
         desktop.SetPosition(x, y, w, h, false, false, false);
      return result;
   }

   void SetAppFocus(bool state)
   {  
      // Shouldn't be property here
      desktop.active = state;
   }

   bool SelectSkin(char * skinName)
   {
      bool result = false;
      subclass(Skin) skin;
      OldLink link;
      
      for(link = class(Skin).derivatives.first; link; link = link.next)
      {
         skin = link.data;
         if(skin.name && !strcmp(skin.name, skinName))
            break;
      }
      if(!link) skin = null;
      
      if(skin)
      {
         if(skin != currentSkin || !currentSkin)
         {
            // Try finding a driver to support this mode
            if(skin.textMode != textMode)
            {
               return false;
            }
            else
            {
               bool needReload = false;

               if(!modeSwitching && currentSkin)
               {
                  modeSwitching = true;
                  desktop.UnloadGraphics(true);
                  needReload = true;
               }

               UnapplySkin(class(Window));
               
               currentSkin = skin;

               ApplySkin(class(Window), skin.name, null);

               if(needReload)
               {
                  if(desktop.SetupDisplay())
                     if(desktop.LoadGraphics(false, true))
                        result = true;
                  modeSwitching = false;
               }
               else
                  result = true;
            }
         }
         else
            result = true;
      }
      return result;
   }

   void Initialize(bool switchMode)
   {
      // TODO:
      // if(!initialized && eClass_IsDerived(__ecereModule->app->module.inst.class, guiApplicationClass))
      if(!guiApplicationInitialized)
      {
         char * defaultDriver = null;
#if defined(ECERE_VANILLA) || defined(ECERE_ONEDRIVER)
         char * driver = null;
#else

         // char * driver = getenv("ECERE_DRIVER");
         char * driver = null;
         static char driverStorage[1024];
         GetEnvironment("ECERE_DRIVER", driverStorage, sizeof(driverStorage));
         if(driverStorage[0]) driver = driverStorage;
#endif
         guiApplicationInitialized = true;

         fullScreenMode = true; // Needs to start at true for the desktop to resize
         // Set this to true earlier so we can override it!
         //processAll = true;

         errorLevel = 2;

         lockMutex.Wait();
#if (defined(__unix__) || defined(__APPLE__)) && !defined(__ANDROID__)
         if(xGlobalDisplay)
            XLockDisplay(xGlobalDisplay);
#endif

         // Setup Desktop
         if(!desktop)
         {
            desktop = Window { nativeDecorations = false };
            incref desktop;
            incref desktop;
            desktop.childrenOrder.circ = true;
            desktop.childrenCycle.circ = true;
            desktop.background = blue;
            desktop.rootWindow = desktop;
            desktop.cursor = GetCursor(arrow);
            desktop.caption = appName;
            *&desktop.visible = true;
            desktop.position = Point { };
            desktop.mutex = Mutex { };
            desktop.created = true;
         }

   #if defined(__WIN32__)
         {
            if(driver)
               defaultDriver = driver;
            else if((this.isGUIApp & 1) && !textMode)
               defaultDriver = "GDI";
            else
               defaultDriver = "Win32Console";
         }
   #elif defined(__APPLE__)
         {
            if (driver) {
               defaultDriver = driver;
            } else {
               defaultDriver = "X"; //"CocoaOpenGL";
            }
         }
   #elif defined(__ANDROID__)
         {
            if(driver)
               defaultDriver = driver;
            else
               defaultDriver = "OpenGL";
         }
   #else
         if((this.isGUIApp & 1) && !textMode)
         {
            char * display = getenv("DISPLAY");

            if(!display || !display[0] || !SwitchMode(false, "X", 0, 0, 0, null, true))
               defaultDriver = "NCurses";
               // SwitchMode(true, "NCurses", 0, PixelFormatText, 0, null, true);
            else if(!driver)
               defaultDriver = "X";
            else
               defaultDriver = driver;
         }
         else
            defaultDriver = "NCurses";
   #endif
         if(switchMode)
         {
            if(defaultDriver)
               SwitchMode(false, defaultDriver, 0, 0, 0, null, true);
            else
            {
            /*
         #if defined(__WIN32__)
               SwitchMode(true, "Win32Console", 0, PixelFormatText, 0, null, true);
         #endif
            */

         #if defined(__DOS__)
               SwitchMode(true, "SVGA", Res640x480, PixelFormat8, 0, null, true);
         #endif

         #if defined(__APPLE__)
               SwitchMode(true, "X" /*"CocoaOpenGL"*/, 0, 0, 0, null, true);
         #endif

         #if defined(__unix__)
         #if defined(ECERE_MINIGLX)
               SwitchMode(true, "OpenGL", 0, 0, 0, null, true);
         #endif
         #endif
            }
            if(!interfaceDriver)
               guiApplicationInitialized = false;
         }
         else
            defaultDisplayDriver = defaultDriver;
      }
   }

public:
   virtual bool Init(void);
   virtual bool Cycle(bool idle);
   virtual void Terminate(void);

   void Main(void)
   {
      Window window;

      if(Init())
      {
         if(desktop)
         {
            // better solution when designing tab order/activated window etc, why do windows move in the list?
            while(true)
            {
               for(window = desktop.children.first; window; window = window.next)
               {
                  if(window.autoCreate && !window.created)
                  {
                     if(window.Create())
                        break;
                  }
               }
               if(!window) break;
            }
         }

         if(desktop)
         {
            int terminated = 0;
            incref desktop;
            while(desktop && interfaceDriver)
            {
               bool wait;
               Window child;
               if(terminateX != terminated)
               {
                  terminated = terminateX;
                  desktop.Destroy(0);
                  if(desktop.created)
                  {
                     terminated = 0;
                     terminateX = 0;
                     //printf("Resetting terminate X to 0\n");
                  }
               }

               for(child = desktop.children.first; child; child = child.next)
                  if(child.created && child.visible)
                     break;
               if(!child) break;

               for(window = desktop.children.first; window; window = window.next)
                  if(window.mutex) window.mutex.Wait();
               UpdateDisplay();
               for(window = desktop.children.first; window; window = window.next)
                  if(window.mutex) window.mutex.Release();
               wait = !ProcessInput(true);
#ifdef _DEBUG
               if(lockMutex.owningThread != GetCurrentThreadID())
                  PrintLn("WARNING: ProcessInput returned unlocked GUI!");
#endif
               if(!Cycle(wait))
                  wait = false;

               if(wait) 
                  Wait();
               else
               {
#if (defined(__unix__) || defined(__APPLE__)) && !defined(__ANDROID__)
                  if(xGlobalDisplay)
                     XUnlockDisplay(xGlobalDisplay);
#endif

                  lockMutex.Release();
                  lockMutex.Wait();

#if (defined(__unix__) || defined(__APPLE__)) && !defined(__ANDROID__)
                  if(xGlobalDisplay)
                     XLockDisplay(xGlobalDisplay);
#endif
               }
            }
            eInstance_DecRef(desktop);
         }
      }
      Terminate();

#if defined(__ANDROID__)
      // Because destruction of GuiApp won't be from main thread
      lockMutex.Release();
#endif
   }

   void Wait(void)
   {
#if (defined(__unix__) || defined(__APPLE__)) && !defined(__ANDROID__)
      if(xGlobalDisplay)
         XUnlockDisplay(xGlobalDisplay);
#endif

      lockMutex.Release();

      waitMutex.Wait();
      waiting = true;
      if(interfaceDriver)
         interfaceDriver.Wait();
      waiting = false;
      waitMutex.Release();

      lockMutex.Wait();

#if (defined(__unix__) || defined(__APPLE__)) && !defined(__ANDROID__)
      if(xGlobalDisplay)
         XLockDisplay(xGlobalDisplay);
#endif
   }

   bool ProcessInput(bool useProcessAll)
   {
      if(interfaceDriver)
      {
         bool result = 0;

#if !defined(ECERE_VANILLA) && !defined(ECERE_NONET)
         ProcessNetworkEvents();
#endif

         /*
         result = interfaceDriver.ProcessInput(useProcessAll && processAll);
         if(!desktop || !interfaceDriver) return;
         {
            bool wait;
            Window child;
            for(child = app.desktop.children.first; child; child = child.next)
               if(child.created && child.visible)
                  break;
            if(!child) return result;
         }

         result |= UpdateTimers();
         result |= ProcessFileNotifications();
         */
         
         result |= ProcessFileNotifications();
         result |= UpdateTimers();
         result |= interfaceDriver.ProcessInput(useProcessAll && processAll);

         return result;
      }
      return false;
   }

   void UpdateDisplay(void)
   {
#if !defined(ECERE_VANILLA) && !defined(ECERE_NO3D)
      if(Desktop3DUpdateDisplay()) return;
#endif
      
      if(interfaceDriver)
      {
         if(fullScreenMode && desktop.display)
         {
            desktop.mutex.Wait();
            if(desktop.active)
            {
               desktop.display.Lock(true);

               if(desktop.dirty || cursorUpdate)
               {
                  if(desktop.display.flags.flipping)
                     desktop.Update(null);
                  desktop.UpdateDisplay();
                  cursorUpdate = true;
               }
               if(cursorUpdate || desktop.dirty)
               {
                  PreserveAndDrawCursor();
                  cursorUpdate = false;
                  desktop.dirty = false;
                  RestoreCursorBackground();
               }

               desktop.display.Unlock();
            }
            desktop.mutex.Release();
         }
         else
         {
            Window window;

            for(window = desktop.children.first; window; window = window.next)
            {
               if(window.mutex) window.mutex.Wait();
               if(window.visible && window.dirty)
               {
                  // Logf("Updating %s\n", window.name);
                  interfaceDriver.Lock(window);
                  if(window.display)
                  {
                     if(window.display.current)
                     {
                        printf("bug");
                     }
                     window.display.Lock(true);
                     window.UpdateDisplay();
                     window.display.Unlock();
                  }

                  window.dirty = false;
                  interfaceDriver.Unlock(window);
                  /*
                  Log("--------------\n");
                  usleep(1000000);
                  */
               }
               if(window.mutex) window.mutex.Release();
            }
         }
      }
   }

   void WaitEvent(void)
   {
      globalSystem.eventSemaphore.Wait();
   }

#if !defined(ECERE_VANILLA) && !defined(ECERE_NONET)
   bool ProcessNetworkEvents()
   {
      bool gotEvent = false;
   #if defined(__WIN32__) || defined(__unix__) || defined(__APPLE__)
      if(network.networkInitialized)
      {
         Service service;
         Socket socket, next;
         struct timeval tv = {0, 0};
         fd_set rs, ws, es;
         Service nextService;
         OldLink semPtr;

         PauseNetworkEvents();
         network.mutex.Wait();
         
   #ifdef DEBUG_SOCKETS
         if(network.connectEvent || network.networkEvent)
            Log("[P] [NProcess]\n");
   #endif
         rs = network.readSet;
         ws = network.writeSet;
         es = network.exceptSet;

         if((network.ns && select(network.ns, &rs, &ws, &es, &tv)) || network.leftOverBytes)
         {
            network.leftOverBytes = false;

            // Danger here? Why looping with a next and not unlocking anything?
            for(socket = network.connectSockets.first; socket; socket = next)
            {
               next = socket.next;
               if(!socket.processAlone && FD_ISSET(socket.s, &ws))
               {
                  network.mutex.Release();
                  socket.connectThread.Wait();
                  network.mutex.Wait();
               }
            }
            for(socket = network.sockets.first; socket; socket = next)
            {
               next = socket.next;
               if(!socket.processAlone)
               {
                  network.mutex.Release();
                  gotEvent |= socket.ProcessSocket(&rs, &ws, &es);
                  network.mutex.Wait();
               }
            }

            for(service = network.services.first; service; service = nextService)
            {
               nextService = service.next;
               if(!service.processAlone)
               {
                  if(FD_ISSET(service.s, &rs))
                  {
      #ifdef DEBUG_SOCKETS
                     Logf("[P] Accepting connection (%x)\n", service.s);
      #endif
                     service.accepted = false;
                     service.OnAccept();
                     if(!service.accepted)
                     {
                        SOCKET s;
                        SOCKADDR_IN a;
                        int addrLen = sizeof(a);
                        s = accept(service.s,(SOCKADDR *)&a,&addrLen);
                        closesocket(s);
                     }
                     gotEvent |= true;

      #ifdef DEBUG_SOCKETS
                     Log("[P] Connection accepted\n");
      #endif
                  }
               }
               for(socket = service.sockets.first; socket; socket = next)
               {
                  next = socket.next;
                  if(!socket.processAlone)
                  {
                     network.mutex.Release();
                     gotEvent |= socket.ProcessSocket(&rs, &ws, &es);
                     network.mutex.Wait();
                  }
               }
            }
         }
         if(network.connectEvent)
         {
            bool goOn = true;
            while(goOn)
            {
               goOn = false;
               for(socket = network.connectSockets.first; socket; socket = next)
               {
                  next = socket.next;
                  if(socket._connected  && socket._connected != -2)
                  {
                     network.connectSockets.Remove(socket);
                     delete socket.connectThread;

                     // printf("%s is connected = %d\n", socket._class.name, socket._connected);
                     if(socket._connected == -1)
                     {
      #ifdef DEBUG_SOCKETS
                        Logf("[P] Processing disconnected connect (%x)\n", socket.s);
      #endif
      #if 0
                        if(socket.disconnectCode == ResolveFailed)
                           Logf("Error resolving address %s\n", socket.address);
      #endif
                        if(socket.s == network.ns - 1)
                           Network_DetermineMaxSocket();

                        socket.Free(false);
                        delete socket;
                     }
                     else if(socket._connected == 1)
                     {
      #ifdef DEBUG_SOCKETS
                        Log("[P] Processing connected connect\n");
      #endif
                        FD_CLR(socket.s, &network.writeSet);
                        FD_SET(socket.s, &network.readSet);
                        FD_SET(socket.s, &network.exceptSet);
                        network.mutex.Release();
                        
                        // printf("Calling OnConnect on %s\n", socket._class.name);
                        socket.OnConnect();
                        network.mutex.Wait();
                        network.sockets.Add(socket);
                     }
                     gotEvent |= true;
                     goOn = true;
                     break;
                  }
               }
            }
            network.connectEvent = false;
         }
         if(network.networkEvent)
         {
            network.networkEvent = false;
            network.selectSemaphore.Release();
         }

         if(gotEvent)
         {
            for(semPtr = network.mtSemaphores.first; semPtr; semPtr = semPtr.next)
            {
               ((Semaphore)semPtr.data).Release();
            }
         }

         network.mutex.Release();
         ResumeNetworkEvents();
      }
   #endif
      return gotEvent;
   }

   void WaitNetworkEvent()
   {
      if(network.networkInitialized)
      {
         if(GetCurrentThreadID() == network.mainThreadID)
         {
            WaitEvent();
         }
         else
         {
            Semaphore semaphore { };
            OldLink semPtr { data = semaphore };
            network.mutex.Wait();
            network.mtSemaphores.Add(semPtr);
            network.mutex.Release();

            ResumeNetworkEvents();
            semaphore.Wait();
            PauseNetworkEvents();
            network.mutex.Wait();
            network.mtSemaphores.Delete(semPtr);
            network.mutex.Release();
            delete semaphore;
         }
      }
   }

   void PauseNetworkEvents()
   {
      if(network.networkInitialized)
      {
         network.processMutex.Wait();
      }
   }

   void ResumeNetworkEvents()
   {
      if(network.networkInitialized)
      {
         network.processMutex.Release();
      }
   }
#endif

   void SignalEvent(void)
   {
      globalSystem.eventSemaphore.Release();
   }

   // TODO: Might want to make this private with simpler public version?
   bool SwitchMode(bool fullScreen, char * driverName, Resolution resolution, PixelFormat colorDepth, int refreshRate, char * skinName, bool fallBack)
   {
      bool result = false;
      OldLink link;
      char * fbDriver;
      bool fbFullScreen = 0;
      Resolution fbResolution = 0;
      PixelFormat fbColorDepth = 0;
      int fbRefreshRate = 0;
      subclass(Interface) inter;
      subclass(Skin) skin = null;

      if(skinName)
      {
         OldLink link;
         
         for(link = class(Skin).derivatives.first; link; link = link.next)
         {
            skin = link.data;
            if(skin.name && !strcmp(skin.name, skinName))
               break;
         }
         if(!link) skin = null;
      }

      Initialize(false);

      fbDriver = defaultDisplayDriver;
      inter = interfaceDriver;

      if(interfaceDriver)
         interfaceDriver.GetCurrentMode(&fbFullScreen, &fbResolution, &fbColorDepth, &fbRefreshRate);

      if(!driverName && !interfaceDriver)
         driverName = defaultDisplayDriver;

      if(driverName || (skin && skin.textMode != textMode))
      {
         for(link = class(Interface).derivatives.first; link; link = link.next)
         {
            bool foundDriver = false;
            int c, numDrivers;
            char ** graphicsDrivers;
            inter = link.data;

            graphicsDrivers = inter.GraphicsDrivers(&numDrivers);

            for(c=0; c<numDrivers; c++)
               if(!driverName || !strcmp(driverName, graphicsDrivers[c]))
               {
                  if(!skin || skin.textMode == IsDriverTextMode(graphicsDrivers[c]))
                  {
                     driverName = graphicsDrivers[c];
                     foundDriver = true;
                     break;
                  }
               }
            if(foundDriver)
               break;
         }
         if(!link)
            inter = null;      
      }
   
      /*
      if(driverName)
      {   
#if defined(__WIN32__)
#if !defined(ECERE_VANILLA)
         if(!strcmp(driverName, "Win32Console")) inter = (subclass(Interface))class(Win32ConsoleInterface); else
#endif
         inter = (subclass(Interface))class(Win32Interface);
#else
         if(!strcmp(driverName, "X")) inter = (subclass(Interface))class(XInterface);
         else inter = (subclass(Interface))class(NCursesInterface);
#endif
      }
      */

      if(interfaceDriver && (!driverName || (fbDriver && !strcmp(fbDriver, driverName))) && 
         fullScreen == fbFullScreen &&
         (!resolution || resolution == fbResolution) &&
         (!colorDepth || colorDepth == fbColorDepth) &&
         (!refreshRate || refreshRate == fbRefreshRate) &&
         (currentSkin && (!skinName || !strcmp(currentSkin.name, skinName))))
         result = true;
      else if(inter)
      {
         bool wasFullScreen = fullScreenMode;
         subclass(Skin) oldSkin = currentSkin;

         textMode = false;
         modeSwitching = true;

         if(interfaceDriver)
            desktop.UnloadGraphics(true);

         if(inter != interfaceDriver)
         {
            if(interfaceDriver)
            {
               interfaceDriver.Terminate();
            }
            result = inter.Initialize();
         }
         else
            result = true;
         if(result)
         {
            result = false;

            interfaceDriver = inter;
            interfaceDriver.SetTimerResolution(timerResolution);
            inter.EnsureFullScreen(&fullScreen);
            fullScreenMode = fullScreen;

            if((!wasFullScreen && !fullScreen) ||
               inter.ScreenMode(fullScreen, resolution, colorDepth, refreshRate, &textMode))
            {
               if(!fbDriver || (driverName && strcmp(fbDriver, driverName)))
                  defaultDisplayDriver = driverName;
      
               if(!skinName || !SelectSkin(skinName))
               {
                  if(!currentSkin || currentSkin.textMode != textMode ||
                     !SelectSkin(currentSkin.name))
                  {
                     OldLink link;
                     subclass(Skin) skin = null;
                     
                     for(link = class(Skin).derivatives.first; link; link = link.next)
                     {
                        skin = link.data;
                        if(skin.textMode == textMode)
                           break;
                     }
                     if(!link) skin = null;

                     if(skin)
#if !defined(__ANDROID__)
                        SelectSkin(skin.name);
#else
                        currentSkin = skin;
#endif
                  }
               }

               if(currentSkin && desktop.SetupDisplay())
               {
                  desktop.active = true;
               
                  if(fullScreen)
                  {
                     desktop.display.Lock(false);
                     desktop.display.Position(0,0);
                     desktop.display.Unlock();
                  }

                  if(desktop.LoadGraphics(false, oldSkin != currentSkin))
                  {
                     if(fbDriver)
                     {
                        desktop.UpdateDisplay();
                     }

                     this.fullScreen = fullScreen;
                     result = true;
                  }
               }
            }
         }
         modeSwitching = false;
         if(!result)
            LogErrorCode(modeSwitchFailed, driverName ? driverName : defaultDisplayDriver);
      }
      else
         LogErrorCode(driverNotSupported, driverName ? driverName : defaultDisplayDriver);

      if(!result && fallBack && fbDriver)
      {
         if(!SwitchMode(fbFullScreen, fbDriver, fbResolution, fbColorDepth, fbRefreshRate, null, false))
            Log($"Error falling back to previous video mode.\n");
      }
      return result;
   }

   bool ProcessFileNotifications()
   {
      bool activity = false;
      FileMonitor monitor, next;
      static int reentrant = 0;
      
      // Reentrant FileNotification is asking for trouble since each monitor is spawning a Modal() MessageBox
      if(reentrant) return false;
      // printf("[%d] Waiting in ProcessFileNotifications for fileMonitor Mutex %x...\n", GetCurrentThreadID(), globalSystem.fileMonitorMutex);
      globalSystem.fileMonitorMutex.Wait();
      reentrant++;
      for(monitor = globalSystem.fileMonitors.first; monitor; monitor = next)
      {
         FileNotify notify;

         next = monitor.next;
         incref monitor;
         if(next)
            incref next;
         
         if(!monitor.reentrant && !monitor.toBeFreed)
         {
            monitor.reentrant = true;
            while((notify = monitor.fileNotifies.first))
            {
               monitor.fileNotifies.Remove(notify);

               if(monitor.active)
               {
                  if(monitor.directory)
                  {
                     if(!monitor.OnDirNotify(monitor.data, notify.action, notify.fileName, notify.param))
                        monitor.StopMonitoring();
                  }
                  else
                  {
                     if(!monitor.OnFileNotify(monitor.data, notify.action, notify.param))
                        monitor.StopMonitoring();
                  }
               }
               monitor.reentrant = false;

               notify.Free();
               delete notify;
               activity = true;
            }
            monitor.reentrant = false;
         }
         delete monitor;
         if(next && next._refCount > 1)
            next._refCount--;
         else
            delete next;
      }
      reentrant--;
      if(!reentrant)
      {
         for(monitor = globalSystem.fileMonitors.first; monitor; monitor = next)
         {
            next = monitor.next;
            if(monitor.toBeFreed && !monitor.reentrant)
               monitor.FreeMonitor();
         }
      }
      // printf("[%d] Releasing in ProcessFileNotifications fileMonitor Mutex %x...\n", GetCurrentThreadID(), globalSystem.fileMonitorMutex);
      globalSystem.fileMonitorMutex.Release();
      return activity;
   }

   void Lock(void)
   {
      lockMutex.Wait();
#if (defined(__unix__) || defined(__APPLE__)) && !defined(__ANDROID__)
      if(xGlobalDisplay)
         XLockDisplay(xGlobalDisplay);
#endif
   }

   void Unlock(void)
   {
#if (defined(__unix__) || defined(__APPLE__)) && !defined(__ANDROID__)
      if(xGlobalDisplay)
         XUnlockDisplay(xGlobalDisplay);
#endif
      lockMutex.Release();
   }

   Cursor GetCursor(SystemCursor cursor)
   {
      return systemCursors[cursor];
   }

   bool GetKeyState(Key key)
   {
      return interfaceDriver.GetKeyState(key);
   }

   bool GetMouseState(MouseButtons * buttons, int * x, int * y)
   {
      return interfaceDriver.GetMouseState(buttons, x, y);
   }
   
   // Properties
   property char * appName
   {
      set
      {
         strcpy(appName, value);
         if(desktop) desktop.text = appName;
      }
      get
      {
         return (char *)(this ? appName : null);
      }
   };
   property Semaphore semaphore { get { return globalSystem.eventSemaphore; } };
   property bool alwaysEmptyInput{ set { processAll = value; } get { return processAll; } };
   property bool fullScreen
   {
      set
      {
         SwitchMode(value, defaultDisplayDriver, resolution, 
            pixelFormat, refreshRate, currentSkin ? currentSkin.name : null, true);
      }
      get { return this ? fullScreen : false; }
   };
   property char * driver
   {
      set
      {
         SwitchMode( fullScreen, value, resolution, pixelFormat, refreshRate, 
            currentSkin ? currentSkin.name : null, true);
       } 
       get { return this ? defaultDisplayDriver : null; }
   };
   property Resolution resolution
   {
      set
      {
         SwitchMode(fullScreen, defaultDisplayDriver, value, pixelFormat, refreshRate, 
            currentSkin ? currentSkin.name : null, true);
      }
      get { return this ? resolution : 0; }
   };
   property PixelFormat pixelFormat
   {
      set
      {
         SwitchMode(fullScreen, defaultDisplayDriver, resolution, 
            pixelFormat, refreshRate, currentSkin ? currentSkin.name : null, true);
      }
      get { return this ? pixelFormat : 0; }
   };
   property int refreshRate
   {
      set
      {
         SwitchMode(fullScreen, defaultDisplayDriver, resolution, 
            pixelFormat, refreshRate, currentSkin ? currentSkin.name : null, true);
      }
      get { return this ? refreshRate : 0; }
   };
   property char * skin
   {
      set { SelectSkin(value); }
      get { return (this && currentSkin) ? currentSkin.name : null; }
   };
   property bool textMode
   {
      set { textMode = value; }     // TODO: Implement switching
      get { return this ? textMode : false; }
   };
   property Window desktop { get { return this ? desktop : null; } };
   property char ** drivers { get { return null; } };
   property char ** skins { get { return null; } };
   property subclass(Skin) currentSkin { get { return this ? currentSkin : null; } };
   property int numDrivers { get { return 0; } };
   property int numSkins { get { return 0; } };
   property uint timerResolution
   {
      set { timerResolution = value; if(interfaceDriver) interfaceDriver.SetTimerResolution(value); } 
   };
};
