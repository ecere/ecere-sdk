namespace gui::drivers;

import "Window"
import "Interface"
import "Condition"

#define uint _uint
#define set _set
#include <errno.h>
#include <locale.h>
#include <pthread.h>
#include <unistd.h>

#include <android/configuration.h>
#include <android/looper.h>
#include <android/native_activity.h>
#include <android/sensor.h>
#include <android/log.h>
#include <android/window.h>

#include <jni.h>
#undef set
#undef uint

#define LOGI(...) ((void)__android_log_print(ANDROID_LOG_INFO, "ecere-app", __VA_ARGS__))
#define LOGE(...) ((void)__android_log_print(ANDROID_LOG_ERROR, "ecere-app", __VA_ARGS__))
#define LOGW(...) ((void)__android_log_print(ANDROID_LOG_WARN, "ecere-app", __VA_ARGS__))
#ifdef _DEBUG
#define LOGV(...)  ((void)0)
#else
#define LOGV(...)  ((void)__android_log_print(ANDROID_LOG_VERBOSE, "ecere-app", __VA_ARGS__))
#endif

// *** NATIVE APP GLUE ********
enum LooperID : byte { main = 1, input = 2, user = 3 };
enum AppCommand : byte
{
   error = 0, inputChanged, initWindow, termWindow, windowResized, windowRedrawNeeded,
   contentRectChanged, gainedFocus, lostFocus,
   configChanged, lowMemory, start, resume, saveState, pause, stop, destroy
};

class AndroidPollSource
{
public:
   void * userData;
   LooperID id;
   virtual void any_object::process();
};

class AndroidAppGlue : Thread
{
   void* userData;
   virtual void onAppCmd(AppCommand cmd);
   virtual int onInputEvent(AInputEvent* event);
   virtual void main();

   ANativeActivity* activity;
   AConfiguration* config;
   void* savedState;
   uint savedStateSize;

   ALooper* looper;
   AInputQueue* inputQueue;
   ANativeWindow* window;
   ARect contentRect;
   AppCommand activityState;
   bool destroyRequested;
   char * moduleName;

private:
   Mutex mutex { };
   Condition cond { };

   int msgread, msgwrite;

   unsigned int Main()
   {
      config = AConfiguration_new();
      AConfiguration_fromAssetManager(config, activity->assetManager);

      print_cur_config();

      looper = ALooper_prepare(ALOOPER_PREPARE_ALLOW_NON_CALLBACKS);
      ALooper_addFd(looper, msgread, LooperID::main, ALOOPER_EVENT_INPUT, null, cmdPollSource);

      mutex.Wait();
      running = true;
      cond.Signal();
      mutex.Release();

      main();

      destroy();
      return 0;
   }

   void destroy()
   {
      free_saved_state();
      mutex.Wait();
      if(inputQueue)
         AInputQueue_detachLooper(inputQueue);
      AConfiguration_delete(config);
      destroyed = true;
      cond.Signal();
      mutex.Release();

      delete __currentModule;

      LOGV("THE END.");
   }

   AndroidPollSource cmdPollSource
   {
      this, main;

      void process()
      {
         AppCommand cmd = read_cmd();
         pre_exec_cmd(cmd);
         onAppCmd(cmd);
         post_exec_cmd(cmd);
      }
   };
   AndroidPollSource inputPollSource
   {
      this, input;

      void process()
      {
         AInputEvent* event = null;
         if(AInputQueue_getEvent(inputQueue, &event) >= 0)
         {
            int handled = 0;
            LOGV("New input event: type=%d\n", AInputEvent_getType(event));
            if(AInputQueue_preDispatchEvent(inputQueue, event))
               return;
            handled = onInputEvent(event);
            AInputQueue_finishEvent(inputQueue, event, handled);
         }
         else
            LOGE("Failure reading next input event: %s\n", strerror(errno));
      }
   };

   bool running;
   bool stateSaved;
   bool destroyed;
   AInputQueue* pendingInputQueue;
   ANativeWindow* pendingWindow;
   ARect pendingContentRect;

   void free_saved_state()
   {
      mutex.Wait();
      free(savedState);
      savedStateSize = 0;
      mutex.Release();
   }

   AppCommand read_cmd()
   {
      AppCommand cmd;
      if(read(msgread, &cmd, sizeof(cmd)) == sizeof(cmd))
      {
         if(cmd == saveState)
            free_saved_state();
         return cmd;
      }
      else
         LOGE("No data on command pipe!");
      return error;
   }

   void print_cur_config()
   {
      char lang[2], country[2];
      AConfiguration_getLanguage(config, lang);
      AConfiguration_getCountry(config, country);

      LOGV("Config: mcc=%d mnc=%d lang=%c%c cnt=%c%c orien=%d touch=%d dens=%d "
              "keys=%d nav=%d keysHid=%d navHid=%d sdk=%d size=%d long=%d "
              "modetype=%d modenight=%d",
              AConfiguration_getMcc(config),
              AConfiguration_getMnc(config),
              lang[0], lang[1], country[0], country[1],
              AConfiguration_getOrientation(config),
              AConfiguration_getTouchscreen(config),
              AConfiguration_getDensity(config),
              AConfiguration_getKeyboard(config),
              AConfiguration_getNavigation(config),
              AConfiguration_getKeysHidden(config),
              AConfiguration_getNavHidden(config),
              AConfiguration_getSdkVersion(config),
              AConfiguration_getScreenSize(config),
              AConfiguration_getScreenLong(config),
              AConfiguration_getUiModeType(config),
              AConfiguration_getUiModeNight(config));
   }

   void pre_exec_cmd(AppCommand cmd)
   {
      PrintLn("pre_exec_cmd: ", (int)cmd);
      switch(cmd)
      {
         case inputChanged:
            mutex.Wait();
            if(inputQueue)
               AInputQueue_detachLooper(inputQueue);
            inputQueue = pendingInputQueue;
            if(inputQueue)
               AInputQueue_attachLooper(inputQueue, looper, LooperID::input, null, inputPollSource);
            cond.Signal();
            mutex.Release();
            break;
         case initWindow:
            mutex.Wait();
            window = pendingWindow;
            cond.Signal();
            mutex.Release();
            break;
         case termWindow:
            cond.Signal();
            break;
         case resume:
         case start:
         case pause:
         case stop:
            mutex.Wait();
            activityState = cmd;
            cond.Signal();
            mutex.Release();
            break;
         case configChanged:
            AConfiguration_fromAssetManager(config, activity->assetManager);
            print_cur_config();
            break;
         case destroy:
            destroyRequested = true;
            break;
      }
   }

   void post_exec_cmd(AppCommand cmd)
   {
      PrintLn("post_exec_cmd: ", (int)cmd);
      switch(cmd)
      {
         case termWindow:
            mutex.Wait();
            window = null;
            cond.Signal();
            mutex.Release();
            break;
         case saveState:
            mutex.Wait();
            stateSaved = true;
            cond.Signal();
            mutex.Release();
            break;
         case resume:
            free_saved_state();
            break;
      }
   }

   void write_cmd(AppCommand cmd)
   {
      if(write(msgwrite, &cmd, sizeof(cmd)) != sizeof(cmd))
         LOGE("Failure writing android_app cmd: %s\n", strerror(errno));
   }

   void set_input(AInputQueue* inputQueue)
   {
      mutex.Wait();
      pendingInputQueue = inputQueue;
      write_cmd(inputChanged);
      while(inputQueue != pendingInputQueue)
         cond.Wait(mutex);
      mutex.Release();
   }

   void set_window(ANativeWindow* window)
   {
      mutex.Wait();
      if(pendingWindow)
         write_cmd(termWindow);
      pendingWindow = window;
      if(window)
         write_cmd(initWindow);
      while(window != pendingWindow)
         cond.Wait(mutex);
      mutex.Release();
   }

   void set_activity_state(AppCommand cmd)
   {
      mutex.Wait();
      write_cmd(cmd);
      while(activityState != cmd)
         cond.Wait(mutex);
      mutex.Release();
   }

   void cleanup()
   {
      mutex.Wait();
      write_cmd(destroy);
      while(!destroyed)
         cond.Wait(mutex);
      mutex.Release();
      close(msgread);
      close(msgwrite);
   }

   void setSavedState(void * state, uint size)
   {
      free(savedState);
      if(state)
      {
         savedState = malloc(size);
         savedStateSize = size;
         memcpy(savedState, state, size);
      }
      else
         savedStateSize = 0;
   }

   void Create()
   {
      int msgpipe[2];
      if(pipe(msgpipe))
         LOGE("could not create pipe: %s", strerror(errno));
      msgread = msgpipe[0];
      msgwrite = msgpipe[1];

      Thread::Create();

      // Wait for thread to start.
      mutex.Wait();
      while(!running) cond.Wait(mutex);
      mutex.Release();
   }
}

// Callbacks
static void onDestroy(ANativeActivity* activity)
{
   AndroidAppGlue app = (AndroidAppGlue)activity->instance;
   LOGV("Destroy: %p\n", activity);
   app.cleanup();
}

static void onStart(ANativeActivity* activity)
{
   AndroidAppGlue app = (AndroidAppGlue)activity->instance;
   LOGV("Start: %p\n", activity);
   app.set_activity_state(start);
}

static void onResume(ANativeActivity* activity)
{
   AndroidAppGlue app = (AndroidAppGlue)activity->instance;
   LOGV("Resume: %p\n", activity);
   app.set_activity_state(resume);
}

static void* onSaveInstanceState(ANativeActivity* activity, size_t* outLen)
{
   AndroidAppGlue app = (AndroidAppGlue)activity->instance;
   void* savedState = null;
   LOGV("SaveInstanceState: %p\n", activity);
   app.mutex.Wait();
   app.stateSaved = false;
   app.write_cmd(saveState);
   while(!app.stateSaved)
      app.cond.Wait(app.mutex);
   if(app.savedState)
   {
      savedState = app.savedState;
      *outLen = app.savedStateSize;
      app.savedState = null;
      app.savedStateSize = 0;
   }
   app.mutex.Release();
   return savedState;
}

static void onPause(ANativeActivity* activity)
{
   AndroidAppGlue app = (AndroidAppGlue)activity->instance;
   LOGV("Pause: %p\n", activity);
   app.set_activity_state(pause);
}

static void onStop(ANativeActivity* activity)
{
   AndroidAppGlue app = (AndroidAppGlue)activity->instance;
   LOGV("Stop: %p\n", activity);
   app.set_activity_state(stop);
}

static void onConfigurationChanged(ANativeActivity* activity)
{
   AndroidAppGlue app = (AndroidAppGlue)activity->instance;
   LOGV("ConfigurationChanged: %p\n", activity);
   app.write_cmd(configChanged);
}

static void onLowMemory(ANativeActivity* activity)
{
   AndroidAppGlue app = (AndroidAppGlue)activity->instance;
   LOGV("LowMemory: %p\n", activity);
   app.write_cmd(lowMemory);
}

static void onWindowFocusChanged(ANativeActivity* activity, int focused)
{
   AndroidAppGlue app = (AndroidAppGlue)activity->instance;
   LOGV("WindowFocusChanged: %p -- %d\n", activity, focused);
   app.write_cmd(focused ? gainedFocus : lostFocus);
}

static void onNativeWindowCreated(ANativeActivity* activity, ANativeWindow* window)
{
   AndroidAppGlue app = (AndroidAppGlue)activity->instance;
   LOGV("NativeWindowCreated: %p -- %p\n", activity, window);
   app.set_window(window);
}

static void onNativeWindowDestroyed(ANativeActivity* activity, ANativeWindow* window)
{
   AndroidAppGlue app = (AndroidAppGlue)activity->instance;
   LOGV("NativeWindowDestroyed: %p -- %p\n", activity, window);
   app.set_window(null);
}

static void onInputQueueCreated(ANativeActivity* activity, AInputQueue* queue)
{
   AndroidAppGlue app = (AndroidAppGlue)activity->instance;
   LOGV("InputQueueCreated: %p -- %p\n", activity, queue);
   app.set_input(queue);
}

static void onInputQueueDestroyed(ANativeActivity* activity, AInputQueue* queue)
{
   AndroidAppGlue app = (AndroidAppGlue)activity->instance;
   LOGV("InputQueueDestroyed: %p -- %p\n", activity, queue);
   app.inputQueue = null;
   app.set_input(null);
}

default dllexport void ANativeActivity_onCreate(ANativeActivity* activity, void* savedState, size_t savedStateSize)
{
   AndroidAppGlue app;
   char * moduleName;

   // Determine our package name
   JNIEnv* env=activity->env;
   jclass clazz;
   const char* str;
   jboolean isCopy;
   jmethodID methodID;
   jobject result;

   // *** Reinitialize static global variables ***
   gotInit = false;
   guiApplicationInitialized = false;
   guiApp = null;
   desktopW = 0; desktopH = 0;
   clipBoardData = null;

   LOGV("Creating: %p\n", activity);

   //(*activity->vm)->AttachCurrentThread(activity->vm, &env, 0);
   clazz = (*env)->GetObjectClass(env, activity->clazz);
   methodID = (*env)->GetMethodID(env, clazz, "getPackageName", "()Ljava/lang/String;");
   result = (*env)->CallObjectMethod(env, activity->clazz, methodID);
   str = (*env)->GetStringUTFChars(env, (jstring)result, &isCopy);
   // (*activity->vm)->DetachCurrentThread(activity->vm);
   moduleName = strstr(str, "com.ecere.");
   if(moduleName) moduleName += 10;
   androidArgv[0] = moduleName;

   // Create a base Application class
   __thisModule = __currentModule = __ecere_COM_Initialize(true, 1, androidArgv);
   // Load up Ecere
   eModule_Load(__currentModule, "ecere", publicAccess);

   if(activity->internalDataPath) PrintLn("internalDataPath is ", activity->internalDataPath);
   if(activity->externalDataPath) PrintLn("externalDataPath is ", activity->externalDataPath);
   {
      char tmp[256];
      PrintLn("cwd is ", GetWorkingDir(tmp, sizeof(tmp)));
   }

   ANativeActivity_setWindowFlags(activity, AWINDOW_FLAG_FULLSCREEN|AWINDOW_FLAG_KEEP_SCREEN_ON, 0 );
   app = AndroidActivity { activity = activity, moduleName = moduleName };
   app.setSavedState(savedState, savedStateSize);
   activity->callbacks->onDestroy = onDestroy;
   activity->callbacks->onStart = onStart;
   activity->callbacks->onResume = onResume;
   activity->callbacks->onSaveInstanceState = onSaveInstanceState;
   activity->callbacks->onPause = onPause;
   activity->callbacks->onStop = onStop;
   activity->callbacks->onConfigurationChanged = onConfigurationChanged;
   activity->callbacks->onLowMemory = onLowMemory;
   activity->callbacks->onWindowFocusChanged = onWindowFocusChanged;
   activity->callbacks->onNativeWindowCreated = onNativeWindowCreated;
   activity->callbacks->onNativeWindowDestroyed = onNativeWindowDestroyed;
   activity->callbacks->onInputQueueCreated = onInputQueueCreated;
   activity->callbacks->onInputQueueDestroyed = onInputQueueDestroyed;
   activity->instance = app;
   app.Create();
}

// *** END OF NATIVE APP GLUE ******

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

static Module __currentModule;
static char * androidArgv[1];

static int desktopW, desktopH;
static char * clipBoardData;

class AndroidInterface : Interface
{
   class_property(name) = "Android";

   // --- User Interface System ---
   bool Initialize()
   {
      setlocale(LC_ALL, "en_US.UTF-8");
      return true;
   }

   void Terminate()
   {

   }

   #define DBLCLICK_DELAY  300   // 0.3 second
   #define DBLCLICK_DELTA  1

   bool ProcessInput(bool processAll)
   {
      bool eventAvailable = false;
      if(androidActivity.ident >= 0)
      {
         //PrintLn("androidActivity.ident >= 0");
         // Process this event.
         if(androidActivity.source)
            androidActivity.source.process(androidActivity.source.userData);

         // If a sensor has data, process it now.
         /*
         if(androidActivity.ident == user)
         {
            if(androidActivity.accelerometerSensor)
            {
               ASensorEvent event;
               while (ASensorEventQueue_getEvents(androidActivity.sensorEventQueue, &event, 1) > 0)
                  LOGI("accelerometer: x=%f y=%f z=%f", event.acceleration.x, event.acceleration.y, event.acceleration.z);
            }
         }
         */
         // eventAvailable = true;
         if(androidActivity.destroyRequested)
         {
            guiApp.desktop.Destroy(0);
            eventAvailable = true;
         }
      }
      androidActivity.ident = 0;
      if(androidActivity.animating)
         guiApp.desktop.Update(null);

      if(!eventAvailable)
         return false;
      return true;
   }

   void Wait()
   {
      androidActivity.ident = (LooperID)ALooper_pollAll(androidActivity.animating ? 0 : -1, null, &androidActivity.events, (void**)&androidActivity.source);
      // guiApp.WaitEvent();
   }

   void Lock(Window window)
   {

   }

   void Unlock(Window window)
   {

   }

   char ** GraphicsDrivers(int * numDrivers)
   {
      static char *graphicsDrivers[] = { "OpenGL" };
      *numDrivers = sizeof(graphicsDrivers) / sizeof(char *);
      return (char **)graphicsDrivers;
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
      return androidActivity.window;
   }

   void DestroyRootWindow(Window window)
   {

   }

   // -- Window manipulation ---

   void SetRootWindowCaption(Window window, char * name)
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
      int rootWindow, childWindow;
      int mx, my;
      unsigned int state;
   }

   void SetMousePosition(int x, int y)
   {

   }

   void SetMouseRange(Window window, Box box)
   {
   }

   void SetMouseCapture(Window window)
   {
   }

   // -- Mouse cursor ---

   void SetMouseCursor(int cursor)
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
      return false;
   }

   bool GetMouseState(MouseButtons * buttons, int * x, int * y)
   {
      bool result = false;
      if(x) *x = 0;
      if(y) *y = 0;
      return result;
   }

   bool GetJoystickState(int device, Joystick joystick)
   {
      bool result = false;
      return result;
   }

   bool GetKeyState(Key key)
   {
      int keyState = 0;
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

struct SavedState
{
    float angle;
    int x;
    int y;
};

static AndroidActivity androidActivity;

static bool gotInit;

class AndroidActivity : AndroidAppGlue
{
   AndroidPollSource source;
   int events;
   LooperID ident;
   /*
   ASensorManager* sensorManager;
   const ASensor* accelerometerSensor;
   ASensorEventQueue* sensorEventQueue;
   */
   bool animating;
   SavedState state;

   int onInputEvent(AInputEvent* event)
   {
      Window window = guiApp.desktop;
      uint type = AInputEvent_getType(event);
      if(type == AINPUT_EVENT_TYPE_MOTION)
      {
         uint actionAndIndex = AMotionEvent_getAction(event);
         uint action = actionAndIndex & AMOTION_EVENT_ACTION_MASK;
         uint index  = (actionAndIndex & AMOTION_EVENT_ACTION_POINTER_INDEX_MASK) >> AMOTION_EVENT_ACTION_POINTER_INDEX_SHIFT;
         uint flags = AMotionEvent_getFlags(event);
         uint meta = AMotionEvent_getMetaState(event);
         uint edge = AMotionEvent_getEdgeFlags(event);
         int64 downTime = AMotionEvent_getDownTime(event);     // nanotime
         int64 eventTime = AMotionEvent_getDownTime(event);
         Modifiers keyFlags = 0;
         int x = (int)AMotionEvent_getX(event, 0);
         int y = (int)AMotionEvent_getY(event, 0);

         switch(action)
         {
            case AMOTION_EVENT_ACTION_DOWN:
               window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown, x, y, &keyFlags, false, true);
               break;
            case AMOTION_EVENT_ACTION_UP:
               window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp, x, y, &keyFlags, false, true);
               break;
            case AMOTION_EVENT_ACTION_MOVE:
               window.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove, x, y, &keyFlags, false, true);
               break;
            case AMOTION_EVENT_ACTION_CANCEL: break;
            case AMOTION_EVENT_ACTION_OUTSIDE: break;
            case AMOTION_EVENT_ACTION_POINTER_DOWN: break;
            case AMOTION_EVENT_ACTION_POINTER_UP: break;
         }

         animating = true;
         return 1;
      }
      else if(type == AINPUT_EVENT_TYPE_KEY)
      {
         uint action = AKeyEvent_getAction(event);
         uint flags = AKeyEvent_getFlags(event);
         uint keyCode = AKeyEvent_getKeyCode(event);
         uint meta = AKeyEvent_getMetaState(event);
      }
      return 0;
   }

   void onAppCmd(AppCommand cmd)
   {
      switch(cmd)
      {
         case saveState:
            setSavedState(&state, sizeof(state));
            break;
         case initWindow:
            if(window)
            {
               int w, h;
               gotInit = true;
               PrintLn("onAppCmd: initWindow");
               ANativeWindow_setBuffersGeometry(window, 0, 0, 0); //format);
               w = ANativeWindow_getWidth(window);
               h = ANativeWindow_getHeight(window);
               guiApp.Initialize(false);
               guiApp.desktop.windowHandle = window;
               guiApp.interfaceDriver = null;
               guiApp.SwitchMode(true, null, 0, 0, 0, null, false);

               if(desktopW != w || desktopH != h)
               {
                  guiApp.SetDesktopPosition(0, 0, w, h, true);
                  desktopW = w;
                  desktopH = h;
               }
               guiApp.desktop.Update(null);
            }
            break;
         case termWindow:
            animating = false;
            guiApp.desktop.UnloadGraphics(false);
            break;
         case gainedFocus:
            androidActivity.animating = true;
            /*
            if(accelerometerSensor)
            {
               ASensorEventQueue_enableSensor(sensorEventQueue, accelerometerSensor);
               ASensorEventQueue_setEventRate(sensorEventQueue, accelerometerSensor, (1000L/60)*1000);
            }
            */
            break;
         case lostFocus:
            /*
            if(accelerometerSensor)
               ASensorEventQueue_disableSensor(sensorEventQueue, accelerometerSensor);
            */
            animating = false;
            guiApp.desktop.Update(null);
            break;
      }
   }

   void main()
   {
      androidActivity = this;
      /* Let's have fun with sensors when we have an actual device to play with
      sensorManager = ASensorManager_getInstance();
      accelerometerSensor = ASensorManager_getDefaultSensor(sensorManager, ASENSOR_TYPE_ACCELEROMETER);
      sensorEventQueue = ASensorManager_createEventQueue(sensorManager, looper, LooperID::user, null, null);
      */

      if(savedState)
         state = *(SavedState*)savedState;

      {
         Module app;
          
         // Evolve the Application class into a GuiApplication
         eInstance_Evolve((Instance *)&__currentModule, class(GuiApplication));
         __thisModule = __currentModule;

         // Wait for the initWindow command:
         guiApp.interfaceDriver = class(AndroidInterface);
         while(!gotInit)
         {
            guiApp.Wait();
            guiApp.ProcessInput(true);
         }

         // Invoke __ecereDll_Load() in lib[our package name].so
         app = eModule_Load(__currentModule, moduleName, publicAccess);
         if(app)
         {
            Class c;
            // Find out if any GuiApplication class was defined in our module
            for(c = app.classes.first; c && !eClass_IsDerived(c, class(GuiApplication)); c = c.next);
            if(!c) c = class(GuiApplication);

            // Evolve the Application into it
            eInstance_Evolve((Instance *)&__currentModule, c);
            __thisModule = __currentModule;


            // Call Main()
            __currentModule._vTbl[12](__currentModule);
         }

         if(!destroyRequested)
            ANativeActivity_finish(activity);
         while(!destroyRequested)
         {
            guiApp.Wait();
            guiApp.ProcessInput(true);
         }
      }
   }
}
