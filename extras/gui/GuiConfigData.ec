#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

class GuiConfigData
{
   virtual bool onSave();
   virtual void onModified()
   {
      modified = true;
   }

public:

   Map<String, GuiDataWindow> windows;
   Map<String, GuiDataPaneSplitter> paneSplitters;

   void saveWindowInit(const char * configId, Window window)
   {
      applyWindowConfig(configId, window);
      {
         bool isNew = false;
         GuiDataWindow guiData = insertWindowConfig(configId, true, &isNew);
         if(guiData && isNew)
         {
            if(window.state != minimized)
               guiData.state = window.state;
            recordWindowPosition(guiData, window);
            recordWindowSize(guiData, window);
            onModified();
            onSave();
         }
      }
   }

   void saveWindowState(const char * configId, Window window, WindowState state)
   {
      GuiDataWindow guiData = insertWindowConfig(configId, true, null);
      if(guiData)
      {
         if(state != minimized)
            guiData.state = state;
         onModified();
      }
   }

   void saveWindowPosition(const char * configId, Window window, Point position, Size size)
   {
      GuiDataWindow guiData = insertWindowConfig(configId, true, null);
      if(guiData && window.state == normal)
      {
         recordWindowPosition(guiData, window);
         recordWindowSize(guiData, window);
         onModified();
      }
   }

   void saveWindowSize(const char * configId, Window window, Size size)
   {
      GuiDataWindow guiData = insertWindowConfig(configId, true, null);
      if(guiData && window.state == normal)
      {
         recordWindowSize(guiData, window);
         onModified();
      }
   }

   void saveWindowClose(const char * configId)
   {
      GuiDataWindow guiData = getWindowConfig(configId);
      if(guiData)
         guiData.saving = false;
      if(modified)
         onSave();
   }

   void savePaneSplitterSize(const char * configId, double scaleSplit)
   {
      GuiDataPaneSplitter guiData = null;
      if(!paneSplitters)
         paneSplitters = { };
      if(!(guiData = paneSplitters[configId]))
         paneSplitters[configId] = guiData = { };
      if(!guiData.loading)
      {
         guiData.scaleSplit = scaleSplit;
         onModified();
      }
   }

private:
   bool modified;

   ~GuiConfigData()
   {
      timer.Stop();

      if(windows)
      {
         windows.Free();
         delete windows;
      }
      if(paneSplitters)
      {
         paneSplitters.Free();
         delete paneSplitters;
      }
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

   GuiDataWindow getWindowConfig(const char * configId)
   {
      GuiDataWindow guiData = null;
      if(windows)
         guiData = windows[configId];
      return guiData;
   }

   GuiDataWindow insertWindowConfig(const char * configId, bool startSaving, bool *isNew)
   {
      GuiDataWindow guiData = null;
      if(startSaving)
      {
         if(!windows)
            windows = { };
         if(!(guiData = windows[configId]))
         {
            windows[configId] = guiData = { };
            if(isNew)
               *isNew = true;
         }
         guiData.saving = true;
      }
      else
         guiData = getWindowConfig(configId);
      if(/*!startSaving && */guiData && (!guiData.saving || guiData.loading))
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
      GuiDataWindow guiData = getWindowConfig(configId);
      if(guiData)
      {
         guiData.loading = true;
         window.state = normal;
         applyWindowPosition(window, guiData);
         applyWindowSize(window, guiData);
         window.Move(guiData.position.x, guiData.position.y, guiData.size.w, guiData.size.h);
         window.state = guiData.state;
         guiData.loading = false;
      }
   }

   void applyWindowPosition(Window window, GuiDataWindow guiData)
   {
      window.position = guiData.position;
   }

   void applyWindowSize(Window window, GuiDataWindow guiData)
   {
      window.size = guiData.size;
   }

   void applyPaneSplitterConfig(const char * configId, PaneSplitter paneSplitter)
   {
      GuiDataPaneSplitter guiData = paneSplitters[configId];
      if(guiData)
      {
         guiData.loading = true;
         paneSplitter.scaleSplit = guiData.scaleSplit;
         guiData.loading = false;
      }
   }
}

// TODO: Make this a WindowController (Note: it's currently missing OnStateChange)
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

   bool OnClose(bool parentClosing)
   {
      GuiConfigData data = getGuiConfigData();
      if(data) data.saveWindowClose(getGuiConfigInstanceId());
      return true;
   }
}

class GuiDataWindow : struct
{
public:
   WindowState state;
   Point position;
   Size size;
private:
   bool saving;
   bool loading;
}

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

class GuiDataPaneSplitter : struct
{
public:
   double scaleSplit;
private:
   bool loading;
}
