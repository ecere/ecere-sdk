#ifdef ECERE_STATIC
public import static "ecere"
#else
#ifndef IMPORT_STATIC
#define IMPORT_STATIC
#endif
public import IMPORT_STATIC "ecere"
#endif

public class GuiConfigData
{
   virtual bool onSave();
   virtual void onModified()
   {
      modified = true;
   }

public:

   property bool modified { get { return modified; } set { modified = value; } isset { return false; } }

   Map<String, GuiDataWindow> windows;
   Map<String, GuiDataPaneSplitter> paneSplitters;

   void saveWindowInit(const char * configId, Window window)
   {
      applyWindowConfig(configId, window);
      {
         bool isNew = false;
         GuiDataWindow * guiData = insertWindowConfig(configId, &isNew);
         if(guiData && isNew)
         {
            if(window.state != minimized)
               guiData->state = window.state;
            recordWindowPosition(guiData, window);
            recordWindowSize(guiData, window);
            onModified();
            onSave();
         }
      }
   }

   void saveWindowState(const char * configId, Window window, WindowState state)
   {
      if(saving)
      {
         GuiDataWindow * guiData = insertWindowConfig(configId, null);
         if(guiData)
         {
            if(state != minimized)
               guiData->state = state;
            onModified();
         }
      }
   }

   void saveWindowPosition(const char * configId, Window window, Point position, Size size)
   {
      if(saving)
      {
         GuiDataWindow * guiData = insertWindowConfig(configId, null);
         if(guiData && window.state == normal)
         {
            recordWindowPosition(guiData, window);
            recordWindowSize(guiData, window);
            onModified();
         }
      }
   }

   void saveWindowSize(const char * configId, Window window, Size size)
   {
      if(saving)
      {
         GuiDataWindow * guiData = insertWindowConfig(configId, null);
         if(guiData && window.state == normal)
         {
            recordWindowSize(guiData, window);
            onModified();
         }
      }
   }

   void saveWindowClose(const char * configId)
   {
      if(saving)
      {
         getWindowConfig(configId);
         if(modified)
            onSave();
      }
   }

   void savePaneSplitterSize(const char * configId, double scaleSplit)
   {
      if(saving)
      {
         GuiDataPaneSplitter * guiData = null;
         MapIterator<String, GuiDataPaneSplitter> it { map = paneSplitters };

         if(!paneSplitters)
            it.map = paneSplitters = { };
         if(!it.Index(configId, true))
            it.data = { };
         guiData = (GuiDataPaneSplitter *)paneSplitters.GetData(it.pointer);
         if(!guiData->loading)
         {
            guiData->scaleSplit = scaleSplit;
            onModified();
         }
      }
   }

   void controlSaving(bool on)
   {
      saving = on;
      if(on)
         timer.Start();
      else
         timer.Stop();
   }

private:
   bool modified;
   bool saving;

   ~GuiConfigData()
   {
      timer.Stop();

      if(windows) { windows.Free(); delete windows; }
      if(paneSplitters) { paneSplitters.Free(); delete paneSplitters; }
   }

   thisclass copy()
   {
      if(this)
      {
         GuiConfigData configData
         {
            windows = windows ? { mapSrc = windows } : null;
            paneSplitters = paneSplitters ? { mapSrc = paneSplitters } : null;
         };
         return configData;
      }
      return null;
   }

   Timer timer
   {
      userData = this, delay = 2.5;
      bool DelayExpired()
      {
         if(modified)
         {
            if(onSave())
               modified = false;
         }
         return true;
      }
   };

   GuiDataWindow * getWindowConfig(const char * configId)
   {
      MapIterator<String, GuiDataWindow> it { map = windows };
      return (windows && it.Index(configId, false)) ? (GuiDataWindow *)windows.GetData(it.pointer) : null;
   }

   GuiDataWindow * insertWindowConfig(const char * configId, bool *isNew)
   {
      GuiDataWindow * guiData = null;
      MapIterator<String, GuiDataWindow> it { map = windows };
      if(!windows)
         it.map = windows = { };

      if(!it.Index(configId, true))
      {
         it.data = { };
         if(isNew)
            *isNew = true;
      }
      guiData = (GuiDataWindow *)windows.GetData(it.pointer);

      if(guiData && guiData->loading)
         guiData = null;
      return guiData;
   }

   void recordWindowPosition(GuiDataWindow guiData, Window window)
   {
      guiData.position = window.position;
   }

   void recordWindowSize(GuiDataWindow guiData, Window window)
   {
      guiData.size = window.size;
   }

   void applyWindowConfig(const char * configId, Window window)
   {
      GuiDataWindow * guiData = getWindowConfig(configId);
      if(guiData)
      {
         guiData->loading = true;
         window.state = normal;
         applyWindowPosition(window, guiData);
         applyWindowSize(window, guiData);
         window.Move(guiData->position.x, guiData->position.y, guiData->size.w, guiData->size.h);
         window.state = guiData->state;
         guiData->loading = false;
      }
   }

   void applyWindowPosition(Window window, GuiDataWindow * guiData)
   {
      window.position = guiData->position;
   }

   void applyWindowSize(Window window, GuiDataWindow * guiData)
   {
      window.size = guiData->size;
   }

   void applyPaneSplitterConfig(const char * configId, PaneSplitter paneSplitter)
   {
      MapIterator<String, GuiDataPaneSplitter> it { map = paneSplitters };
      if(paneSplitters && it.Index(configId, false))
      {
         GuiDataPaneSplitter * guiData = (GuiDataPaneSplitter *)paneSplitters.GetData(it.pointer);
         guiData->loading = true;
         paneSplitter.scaleSplit = guiData->scaleSplit;
         guiData->loading = false;
      }
   }
}

class SavedConfigWindow : Window
{
   virtual GuiConfigData getGuiConfigData() { return null; }
   virtual const char * getGuiConfigInstanceId() { return _class.name; }

   bool OnCreate()
   {
      bool result = Window::OnCreate();
      if(result)
      {
         GuiConfigData data = getGuiConfigData();
         if(data) data.saveWindowInit(getGuiConfigInstanceId(), this);
      }
      return result;
   }

   bool OnPostCreate()
   {
      bool result = Window::OnPostCreate();
      if(result)
      {
         GuiConfigData data = getGuiConfigData();
         if(data)
            data.timer.Start();
      }
      return result;
   }

   bool OnStateChange(WindowState state, Modifiers mods)
   {
      GuiConfigData data = getGuiConfigData();
      if(data) data.saveWindowState(getGuiConfigInstanceId(), this, state);
      return true;
   }

   void OnPosition(int x, int y, int width, int height)
   {
      GuiConfigData data = getGuiConfigData();
      if(data) data.saveWindowPosition(getGuiConfigInstanceId(), this, { x, y }, clientSize);
   }

   void OnResize(int width, int height)
   {
      GuiConfigData data = getGuiConfigData();
      if(data) data.saveWindowSize(getGuiConfigInstanceId(), this, clientSize);
   }

   void OnDestroy()
   {
      GuiConfigData data = getGuiConfigData();
      if(data) data.saveWindowClose(getGuiConfigInstanceId());
   }
}

struct GuiDataWindow
{
public:
   WindowState state;
   Point position;
   Size size;
private:
   bool loading;
};

class SavedConfigPaneSplitter : PaneSplitter
{
   virtual GuiConfigData getGuiConfigData() { return null; }
   virtual const char * getGuiConfigInstanceId() { return _class.name; }

   bool OnPostCreate()
   {
      GuiConfigData data = getGuiConfigData();
      if(data) data.applyPaneSplitterConfig(getGuiConfigInstanceId(), this);
      return true;
   }

   bool NotifyResized(SavedConfigPaneSplitter splitter)
   {
      GuiConfigData data = splitter.getGuiConfigData();
      if(data) data.savePaneSplitterSize(splitter.getGuiConfigInstanceId(), splitter.scaleSplit);
      return true;
   }
}

struct GuiDataPaneSplitter
{
public:
   double scaleSplit;
private:
   bool loading;
};

class GuiDataSavingController : WindowController<Window>
{
   public const char * name;
   virtual GuiConfigData getGuiConfigData() { return null; }
   virtual const char * getGuiConfigInstanceId() { return name ? name : _class.name; }
   virtual void onModified();

   bool OnCreate(GuiDataSavingController controller)
   {
      GuiConfigData data = controller.getGuiConfigData();
      if(data)
         data.saveWindowInit(controller.getGuiConfigInstanceId(), this);
      return true;
   }

   bool OnPostCreate(GuiDataSavingController controller)
   {
      GuiConfigData data = controller.getGuiConfigData();
      if(data)
         data.timer.Start();
      return true;
   }

   void OnDestroy(GuiDataSavingController controller)
   {
      GuiConfigData data = controller.getGuiConfigData();
      if(data)
         data.saveWindowClose(controller.getGuiConfigInstanceId());
   }

   void OnPosition(GuiDataSavingController controller, int x, int y, int width, int height)
   {
      GuiConfigData data = controller.getGuiConfigData();
      if(data)
         data.saveWindowPosition(controller.getGuiConfigInstanceId(), controller.window, { x, y }, controller.window.clientSize);
   }

   void OnResize(GuiDataSavingController controller, int width, int height)
   {
      GuiConfigData data = controller.getGuiConfigData();
      if(data)
         data.saveWindowSize(controller.getGuiConfigInstanceId(), controller.window, clientSize);
   }

   bool OnStateChange(GuiDataSavingController controller, WindowState state, Modifiers mods)
   {
      GuiConfigData data = controller.getGuiConfigData();
      if(data)
         data.saveWindowState(controller.getGuiConfigInstanceId(), controller.window, state);
      return true;
   }
}
