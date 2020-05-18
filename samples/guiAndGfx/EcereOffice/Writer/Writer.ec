import "ecere"

import "RichEdit"

static FileFilter ewdFilters[] =
{
   { "Ecere Writer Documents (*.ewd)", "ewd" },
   { "All files", null }
};
static FileType ewdTypes[] =
{
   { "Ecere Writer Documents", "ewd", always }
};

FileDialog fileDialog { types = ewdTypes, sizeTypes = sizeof(ewdTypes), filters = ewdFilters, sizeFilters = sizeof(ewdFilters) };

static FileFilter htmlFilters[] =
{
   { "HTML Files (*.html)", "html" },
   { "All files", null }
};
static FileType htmlTypes[] =
{
   { "HTML", "html", always }
};
FileDialog htmlDialog { types = htmlTypes, sizeTypes = sizeof(htmlTypes), filters = htmlFilters, sizeFilters = sizeof(htmlFilters) };

class WriterDocument : Window
{
   displayDriver = "OpenGL";
   caption = "Ecere Writer";
   size = { 1024, 768 };
   state = maximized;
   borderStyle = sizable;
   background = darkGray;
   hasClose = true;
   hasMinimize = true;
   hasMaximize = true;
   hasMenuBar = true;
   isDocument = true;
   hasHorzScroll = true;
   hasVertScroll = true;
   scrollArea = { 840, 1140 };
   saveDialog = fileDialog;

   menu = { };
   Menu fileMenu { menu, "File", f };
   MenuItem newItem
   {
      fileMenu, "New", n, ctrlN;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         WriterDocument { }.Create();
         return true;
      }
   };
   MenuItem openItem
   {
      fileMenu, "Open", o, ctrlO;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         fileDialog.master = this;
         fileDialog.type = open;
         fileDialog.caption = "Open Document...";

         if(fileDialog.Modal() == ok)
         {
            File f = FileOpenBuffered(fileDialog.filePath, read);
            if(f)
            {
               fileName = fileDialog.filePath;
               edit.loadDocument(f, fileDialog.filePath);
               delete f;
            }
         }
         return true;
      }
   };
   MenuItem closeItem { fileMenu, "Close", c, ctrlF4; NotifySelect = MenuFileExit };   // MenuFileClose is for MDI apps...
   MenuDivider { fileMenu };
   MenuItem saveItem
   {
      fileMenu, "Save", s, ctrlS;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         fileDialog.master = this;
         fileDialog.type = save;
         fileDialog.caption = "Save Document...";

         return MenuFileSave(selection, mods);
      }
   };
   MenuItem saveAsItem
   {
      fileMenu, "Save As...", a;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         fileDialog.master = this;
         fileDialog.type = save;
         fileDialog.caption = "Save Document...";

         return MenuFileSaveAs(selection, mods);
      }
   };
   MenuDivider { fileMenu };
   MenuItem importHTMLItem
   {
      fileMenu, "Import from HTML...", i;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         htmlDialog.master = this;
         htmlDialog.type = open;
         htmlDialog.caption = "Import Document...";

         if(htmlDialog.Modal() == ok)
         {
            File f = FileOpen(htmlDialog.filePath, read);
            if(f)
            {
               /*
               TempFile ewd { };
               if(html2ewd(f, ewd))
               {
                  ewd.Seek(0, start);
                  edit.loadDocument(ewd);
               }
               delete ewd;
               */
               edit.loadHTML(f, htmlDialog.filePath);
               delete f;
            }
         }
         return true;
      }
   };
   MenuItem exportHTMLItem
   {
      fileMenu, "Export to HTML...", h;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         htmlDialog.master = this;
         htmlDialog.type = save;
         htmlDialog.caption = "Export Document...";

         if(htmlDialog.Modal() == ok)
         {
            File f = FileOpen(htmlDialog.filePath, write);
            if(f)
            {
               TempFile ewd { };
               if(edit.saveDocument(ewd))
               {
                  ewd.Seek(0, start);
                  ewd2html(ewd, f, true);
               }
               delete ewd;
               delete f;
            }
         }
         return true;
      }
   };
   MenuDivider { fileMenu };
   MenuItem exitItem
   {
      fileMenu, "Exit", x, altF4;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         ((GuiApplication)__thisModule.application).desktop.Destroy(0);
         return true;
      }
   };

   bool OnSaveFile(const char * fileName)
   {
      File f = FileOpen(fileName, write);
      if(f)
      {
         edit.saveDocument(f);

         modifiedDocument = false;
         delete f;
         return true;
      }
      return false;
   }

   Size pageSize { 800, 1100 };
   Box margins { 50, 50, 50, 50 };

   RichEdit edit { this, size = { pageSize.w - margins.left - margins.right, pageSize.h - margins.top - margins.bottom } };

   void OnResize(int width, int height)
   {
      Point o { Max(20,(clientSize.w - pageSize.w) / 2) + margins.left, Max(20, (clientSize.h - pageSize.h) / 2) + margins.top };
      edit.position = o;
   }

   void OnRedraw(Surface surface)
   {
      Box sClip = surface.box;
      Point o { Max(20,(clientSize.w - pageSize.w) / 2), Max(20, (clientSize.h - pageSize.h) / 2) };
      Box box { o.x - scroll.x, o.y - scroll.y };

      box.right = box.left + pageSize.w - 1;
      box.bottom = box.top + pageSize.h - 1;
      box.Clip(surface.box);

      surface.foreground = lightGray;
      surface.Rectangle(o.x + 1 - scroll.x, o.y + 1 - scroll.y, o.x + pageSize.w - scroll.x + 3, o.y + pageSize.h - scroll.y + 3);
      surface.foreground = gray;
      surface.Rectangle(o.x - scroll.x, o.y - scroll.y, o.x + pageSize.w - scroll.x + 2, o.y + pageSize.h - scroll.y + 2);
      surface.Clip(box);
      surface.background = white;
      surface.Clear(colorBuffer);

      surface.Clip(sClip);
      surface.foreground = black;
      surface.Rectangle(o.x - 1 - scroll.x, o.y - 1 - scroll.y, o.x + pageSize.w - scroll.x, o.y + pageSize.h - scroll.y);
      surface.Rectangle(o.x - 2 - scroll.x, o.y - 2 - scroll.y, o.x + pageSize.w - scroll.x + 1, o.y + pageSize.h - scroll.y + 1);
   }
}

WriterDocument writerWindow { };
