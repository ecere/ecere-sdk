import "HTMLView"

//define homeLocation = "localhost:8080";
//define homeLocation = "www.ecere.com";
define homeLocation = "google.com";

class AddressBar : Window
{
   background = activeBorder;
   tabCycle = true;
   Button back
   {
      this, bevelOver = true, inactive = true, anchor = Anchor { left = 0, top = 0, bottom = 0 }, size = Size { 24 }, hotKey = altLeft, bitmap = { "<:ecere>actions/goPrevious.png" };
      disabled = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ((Explorer)parent).Back();
         return true;
      }
   };
   Button forward
   {
      this, bevelOver = true, inactive = true, anchor = Anchor { left = 24, top = 0, bottom = 0 }, size = Size { 24 }, hotKey = altRight, bitmap = { "<:ecere>actions/goNext.png" };
      disabled = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ((Explorer)parent).Forward();
         return true;
      }
   };
   Button home
   {
      this, bevelOver = true, inactive = true, anchor = Anchor { left = 52, top = 0, bottom = 0 }, size = Size { 24 }, hotKey = ctrlH, bitmap = { "<:ecere>actions/goHome.png" };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ((Explorer)parent).Go(homeLocation);
         return true;
      }
   };
   Button refresh
   {
      this, bevelOver = true, inactive = true, anchor = Anchor { left = 76, top = 0, bottom = 0 }, size = Size { 24 }, hotKey = f5, bitmap = { "<:ecere>actions/viewRefresh.png" };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ((Explorer)parent).Refresh();
         return true;
      }
   };
   Label { this, anchor = Anchor { left = (96+12) }, labeledWindow = address };
   EditBox address
   {
      this, text = "Address:", anchor = Anchor { left = (16+48+96), right = 60, top = 0, bottom = 0 }, hotKey = altD;

      bool NotifyKeyDown(EditBox editBox, Key key, unichar ch)
      {
         if(!go.disabled && (SmartKey)key == enter)
            ((Explorer)parent).Go(editBox.contents);
         return true;
      }

      void NotifyUpdate(EditBox editBox)
      {
         String location = ((Explorer)parent).htmlView.location;
         go.disabled = !strcmp(location ? location : "", editBox.contents);
      }
   };
   Button go
   {
      this, bevelOver = true, inactive = true, text = "Go!", anchor = Anchor { top = 0, right = 0, bottom = 0 }, size = Size { 60 }, hotKey = altG;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ((Explorer)parent).Go(address.contents);
         return true;
      }
   };

   bool OnKeyHit(Key key, unichar ch)
   {
      if(key == escape)
         ((Explorer)parent).htmlView.MakeActive();
      return true;
   }
}

class Explorer : Window
{
   FileDialog openFileDialog { caption = "Select a file or enter a URL... " };
   FileDialog saveFileDialog { type = save, caption = "Save to file... " };

   icon = { ":newb.png" };

   tabCycle = true;
   background = activeBorder;
   hasMenuBar = true;
   hasStatusBar = true;
   borderStyle = sizable;
   hasClose = true;
   hasMaximize = true;
   hasMinimize = true;
   text = "Ecere Web Browser";
   size = Size { 800, 600 };
   state = maximized;

   AddressBar addressBar { this, borderStyle = bevel, anchor = Anchor { top = 0, left = 0, right = 0 }, size.h = 26, hotKey = altD };
   HTMLView htmlView { this, borderStyle = deep, hasVertScroll = true, hasHorzScroll = true, anchor = Anchor { left = 0, right = 0, top = 26, bottom = 0 }, NotifyPageOpened = PageOpened, OnOpen = OnOpen };

   // File Menu
   menu = Menu {};
   Menu fileMenu { menu, "File", f };
   MenuItem newWindowItem
   {
      fileMenu, "New Window\tCtrl+N", n, ctrlN;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         Explorer { state = normal }.Create();
         return true;
      }
   };
   MenuItem openItem
   {
      fileMenu, "Open...\tCtrl+O", o, ctrlO;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         if(openFileDialog.Modal() == ok)
            Go(openFileDialog.filePath);
         return true;
      }
   };
   // MenuItem closeItem { fileMenu, "Close\tCtrl-F4", c, NotifySelect = MenuFileClose };
   MenuDivider { fileMenu };
   MenuItem saveAsItem
   {
      fileMenu, "Save As...";

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         char fileName[MAX_LOCATION];
         GetLastDirectory(htmlView.location, fileName);
         strcpy(fileName, saveFileDialog.currentDirectory);
         PathCat(fileName, fileName);
         saveFileDialog.filePath = fileName;

         if(saveFileDialog.Modal() == ok)
         {
            File f = FileOpen(htmlView.location, read);
            if(f)
            {
               if(!f.CopyTo(saveFileDialog.filePath))
               {
                  String e = PrintString("Error saving to ", saveFileDialog.filePath);
                  MessageBox { contents = e }.Modal();
                  delete e;
               }
            }
         }
         return true;
      }
   };
   MenuDivider { fileMenu };
   MenuItem exitItem { fileMenu, "Exit\tAlt+F4", x, NotifySelect = MenuFileExit };

   bool PageOpened()
   {
      char caption[MAX_LOCATION];

      strcpy(caption, "Ecere Web Browser - ");
      strcat(caption, htmlView.title);

      text = caption;
      addressBar.address.Clear();
      addressBar.address.PutS(htmlView.fileName);
      return true;
   }

   bool OnPostCreate()
   {
      addressBar.MakeActive();
      return true;
   }

   Array<String> history { };
   int historyPos;

   ~Explorer()
   {
      history.Free();
   }

   bool HTMLView::OnOpen(char * href)
   {
      bool result = true;
      char newLocation[MAX_LOCATION];
      Explorer explorer = (Explorer)parent;

      strcpy(newLocation, location ? location : "");
      if(newLocation[strlen(newLocation)-1] != '/')
         PathCat(newLocation, "..");
      if(href[0] == '/' && href[1] == '/')
      {
         strcpy(newLocation, "http:");
         strcat(newLocation, href);
      }
      else
         PathCat(newLocation, href);

      if(explorer.history.count > explorer.historyPos+1)
      {
         int i;
         for(i = explorer.historyPos+1; i < explorer.history.count; i++)
            delete explorer.history[i];
         explorer.history.count = explorer.historyPos+1;
      }
      explorer.historyPos = explorer.history.count-1;
      explorer.addressBar.back.disabled = (explorer.historyPos == 0);
      explorer.addressBar.forward.disabled = (explorer.historyPos >= explorer.history.count-1);

      Open(newLocation, null);

      explorer.history.Add(CopyString(location));
      explorer.historyPos = explorer.history.count-1;

      explorer.addressBar.back.disabled = (explorer.historyPos == 0);
      explorer.addressBar.forward.disabled = (explorer.historyPos >= explorer.history.count-1);
      return result;
   }

   void Go(const String location)
   {
      if(history.count > historyPos+1)
      {
         int i;
         for(i = historyPos+1; i < history.count; i++)
            delete history[i];
         history.count = historyPos+1;
      }
      history.Add(CopyString(location));
      historyPos = history.count-1;
      addressBar.back.disabled = (historyPos == 0);
      addressBar.forward.disabled = (historyPos >= history.count-1);
      htmlView.MakeActive();
      htmlView.location = location;
   }

   void Refresh()
   {
      htmlView.MakeActive();
      if(history.count)
         htmlView.location = history[historyPos];
   }

   bool Forward()
   {
      if(historyPos < history.count-1)
      {
         historyPos++;
         addressBar.back.disabled = (historyPos == 0);
         addressBar.forward.disabled = (historyPos >= history.count-1);
         htmlView.location = history[historyPos];
         return true;
      }
      return false;
   }

   bool Back()
   {
      if(historyPos > 0)
      {
         historyPos--;
         addressBar.back.disabled = (historyPos == 0);
         addressBar.forward.disabled = (historyPos >= history.count-1);
         htmlView.location = history[historyPos];
         return true;
      }
      return false;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(key == ctrlR)
      {
         Refresh();
         return false;
      }
      return true;
   }
}

#ifndef ECERE_MODULE

class BrowserApp : GuiApplication
{
   //driver = "OpenGL";
   Explorer explorerWindow {};

   bool Init()
   {
      app = this;

   #ifndef ECERE_MODULE
      if(argc > 1)
         explorerWindow.Go(argv[1]);
      else
   #endif
         explorerWindow.Go(homeLocation);
      return true;
   }
}

BrowserApp app;

#else

extern GuiApplication app;

#endif
