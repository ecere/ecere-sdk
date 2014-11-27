import "ecere"

// source file line number printf (sflnprintf)

#undef _DEBUG

#ifdef _DEBUG
#define sflnprintf(format,...) printf("%s:% 5d: " format, __FILE__, __LINE__, ##__VA_ARGS__)
#define sflnPrintLn(...) PrintLn(__FILE__, ":", __LINE__, ": ", ##__VA_ARGS__)
#else
void DoNothing() {}
#define sflnprintf(format,...) DoNothing()
#define sflnPrintLn(...) DoNothing()
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
      sflnprintf("GuiConfigData::saveWindowInit\n");
      applyWindowConfig(configId, window);
      {
         bool isNew = false;
         GuiDataWindow guiData = insertWindowConfig(configId, true, &isNew);
         if(guiData && isNew)
         {
            if(window.state != minimized)
               guiData.state = window.state;
            if(!(window.normalAnchor.left.distance == 0 && window.normalAnchor.top.distance == 0 &&
                  window.normalSizeAnchor.size.w == 0 && window.normalSizeAnchor.size.h == 0))
            {
               recordWindowPosition(guiData, window);
               recordWindowSize(guiData, window);
            }
            onModified();
            onSave();
         }
      }
   }

   void saveWindowState(const char * configId, Window window, WindowState state)
   {
      sflnprintf("GuiConfigData::saveWindowState\n");
      GuiDataWindow guiData = insertWindowConfig(configId, false, null);
      if(guiData)
      {
         if(state != minimized)
            guiData.state = state;
         if(state == normal)
            applyWindowSize(window, guiData);
         onModified();
      }
   }

   void saveWindowPosition(const char * configId, Window window, Point position, Size size)
   {
      sflnprintf("GuiConfigData::saveWindowPosition\n");
      GuiDataWindow guiData = insertWindowConfig(configId, false, null);
      if(guiData && window.state == normal)
      {
         if(!(window.normalAnchor.left.distance == 0 && window.normalAnchor.top.distance == 0 &&
               window.normalSizeAnchor.size.w == 0 && window.normalSizeAnchor.size.h == 0))
         {
            recordWindowPosition(guiData, window);
            recordWindowSize(guiData, window);
         }
         onModified();
      }
   }

   void saveWindowSize(const char * configId, Window window, Size size)
   {
      sflnprintf("GuiConfigData::saveWindowSize\n");
      GuiDataWindow guiData = insertWindowConfig(configId, false, null);
      if(guiData && window.state == normal)
      {
         recordWindowSize(guiData, window);
         onModified();
      }
   }

   void saveWindowClose(const char * configId)
   {
      sflnprintf("GuiConfigData::saveWindowClose\n");
      GuiDataWindow guiData = getWindowConfig(configId);
      if(guiData)
         guiData.saving = false;
      if(modified)
         onSave();
   }

   void savePaneSplitterSize(const char * configId, double scaleSplit)
   {
      sflnprintf("GuiConfigData::savePaneSplitterSize\n");
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
      //sflnprintf("GuiConfigData::getWindowConfig\n");
      GuiDataWindow guiData = null;
      if(windows)
         guiData = windows[configId];
      return guiData;
   }

   GuiDataWindow insertWindowConfig(const char * configId, bool startSaving, bool *isNew)
   {
      //sflnprintf("GuiConfigData::insertWindowConfig\n");
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
      sflnprintf("GuiConfigData::recordWindowPosition\n");
      guiData.position = { window.normalAnchor.left.distance, window.normalAnchor.top.distance };
      sflnPrintLn("recordWindowPosition(guiData.position == ", guiData.position, ", created == ", window.created, ")");
   }

   void recordWindowSize(GuiDataWindow guiData, Window window)
   {
      sflnprintf("GuiConfigData::recordWindowSize\n");
      //Size s;
      //sflnPrintLn(guiData.size);
      //s = window.normalSizeAnchor.size;
      //sflnPrintLn(s);
      guiData.size = window.normalSizeAnchor.size;
      //sflnPrintLn(guiData.size);
      //sflnPrintLn(window.size);
      //sflnPrintLn("recordWindowSize(guiData.size == ", guiData.size, ", created == ", window.created, ")");
   }

   void applyWindowConfig(const char * configId, Window window)
   {
      sflnprintf("GuiConfigData::applyWindowConfig\n");
      GuiDataWindow guiData = getWindowConfig(configId);
      if(guiData)
      {
         guiData.loading = true;
         window.state = normal;
         applyWindowPosition(window, guiData);
         applyWindowSize(window, guiData);
         window.Move(guiData.position.x, guiData.position.y, guiData.size.w, guiData.size.h);
         sflnPrintLn("applyWindowConfig(window.size == ", window.size, ", created == ", window.created, ")");
         window.state = guiData.state;
         guiData.loading = false;
      }
   }

   void applyWindowPosition(Window window, GuiDataWindow guiData)
   {
      sflnprintf("GuiConfigData::applyWindowPosition\n");
      window.position = guiData.position;
      sflnPrintLn("applyWindowPosition(window.position == ", window.position, ", created == ", window.created, ")");
   }

   void applyWindowSize(Window window, GuiDataWindow guiData)
   {
      sflnprintf("GuiConfigData::applyWindowSize\n");
      if(guiData.size.w && guiData.size.h)
      {
         window.size = guiData.size;
         sflnPrintLn("applyWindowSize(window.size == ", window.size, ", created == ", window.created, ")");
      }
   }

   void applyPaneSplitterConfig(const char * configId, PaneSplitter paneSplitter)
   {
      //sflnprintf("GuiConfigData::applyPaneSplitterConfig\n");
      GuiDataPaneSplitter guiData = paneSplitters[configId];
      if(guiData)
      {
         guiData.loading = true;
         paneSplitter.scaleSplit = guiData.scaleSplit;
         guiData.loading = false;
      }
   }
}

class SavedConfigWindow : Window
{
   virtual GuiConfigData getGuiConfigData() { return null; }
   virtual const char * getGuiConfigInstanceId() { return _class.name; }

   bool OnCreate()
   {
      sflnprintf("SavedConfigWindow::OnCreate\n");
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
      sflnprintf("SavedConfigWindow::OnPostCreate\n");
      bool result = Window::OnPostCreate();
      if(result)
      {
         GuiConfigData data = getGuiConfigData();
         if(data)
            data.timer.Start();
      }
      return result;
   }

   /*bool OnPostCreate()
   {
      //sflnprintf("SavedConfigWindow::OnPostCreate\n");
      GuiConfigData data = getGuiConfigData();
      if(data) data.saveWindowInit(getGuiConfigInstanceId(), this);
      return true;
   }*/

   bool OnStateChange(WindowState state, Modifiers mods)
   {
      sflnprintf("SavedConfigWindow::OnStateChange\n");
      GuiConfigData data = getGuiConfigData();
      if(data) data.saveWindowState(getGuiConfigInstanceId(), this, state);
      return true;
   }

   void OnPosition(int x, int y, int width, int height)
   {
      sflnprintf("SavedConfigWindow::OnPosition(%i, %i, %i, %i)\n", x, y, width, height);
      GuiConfigData data = getGuiConfigData();
      if(data) data.saveWindowPosition(getGuiConfigInstanceId(), this, { x, y }, clientSize);
   }

   void OnResize(int width, int height)
   {
      sflnprintf("SavedConfigWindow::OnResize(%i, %i) -- (%i, %i)\n", width, height, this.normalSizeAnchor.size.w, this.normalSizeAnchor.size.h);
      GuiConfigData data = getGuiConfigData();
      if(data) data.saveWindowSize(getGuiConfigInstanceId(), this, clientSize);
   }

   bool OnClose(bool parentClosing)
   {
      sflnprintf("SavedConfigWindow::OnClose\n");
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
      //sflnprintf("SavedConfigPaneSplitter::OnPostCreate\n");
      GuiConfigData data = getGuiConfigData();
      if(data) data.applyPaneSplitterConfig(getGuiConfigInstanceId(), this);
      return true;
   }

   bool NotifyResized(SavedConfigPaneSplitter splitter)
   {
      //sflnprintf("SavedConfigPaneSplitter::NotifyResized\n");
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
