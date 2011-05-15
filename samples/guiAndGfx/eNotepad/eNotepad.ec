import "ecere"

static FileFilter txtFilters[] =
{
   { "Text Files (*.txt)", "txt" },
   { "All files", null }
};
static FileType txtTypes[] =
{
   { "Text Files", "txt", always },
};

eNotepad app;
eNodepadWindow appWindow;

class eNodepadWindow : Window
{
   text = "eNotepad";
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   hasMenuBar = true;

   size = { 640, 480 };
   isDocument = true;

   Menu fileMenu { menu, "File", f };
   MenuItem openItem
   {
      fileMenu, "Open", o, ctrlO;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         if(openDialog.Modal() == ok)
         {
            File f = FileOpen(openDialog.filePath, read);
            if(f)
            {
               fileName = openDialog.filePath;
               editBox.Load(f);
               delete(f);
            }
         }
      }
   }
   MenuDivider { fileMenu };
   MenuItem saveItem { fileMenu, "Save", s, ctrlS, NotifySelect = MenuFileSave };
   MenuItem saveItemAs { fileMenu, "Save As...", a, NotifySelect = MenuFileSaveAs };
   MenuDivider { fileMenu };
   MenuItem exitItem { fileMenu, "Exit", x, altF4, NotifySelect = MenuFileExit };
   MenuPlacement { menu, "Edit", e };
   FileDialog fileSaveDialog
   {
      master = this, type = save, text = "Save File...",
      types = txtTypes, sizeTypes = sizeof(txtTypes), filters = txtFilters, sizeFilters = sizeof(txtFilters)
   };
   FileDialog openDialog
   {
      master = this, type = open, text = "Load File...",
      types = txtTypes, sizeTypes = sizeof(txtTypes), filters = txtFilters, sizeFilters = sizeof(txtFilters)
   };
   saveDialog = fileSaveDialog;

   bool OnSaveFile(char * fileName)
   {
      File f = FileOpen(fileName, write);
      if(f)
      {
         editBox.Save(f, false);
         modifiedDocument = false;
         delete(f);
         return true;
      }
      return false;
   }
   EditBox editBox 
   {
      this, font = { "Lucida Console", 10 }, anchor = { left = 0.0, top = 0.0, right = 0.0, bottom = 0.0 }, hasHorzScroll = true, hasVertScroll = true, multiLine = true;

      bool OnFileModified(FileChange fileChange, char * param)
      {
         
         return true;
      }

      bool NotifyModified(EditBox editBox)
      {
         modifiedDocument = true;
         return true;
      }
   };

   bool OnCreate(void)
   {
      if(app.paramLocation[0])
         LoadFile(app.paramLocation);
      return true;
   }

   bool LoadFile(char * filePath)
   {
      File f;
      f = FileOpen(filePath, read);
      if(f)
      {
         fileName = filePath;
         editBox.Load(f);
         delete f;
         return true;
      }
      return false;
   }

   bool OnFileModified(FileChange fileChange, char * param)
   {

      return true;
   }
}

class eNotepad : GuiApplication
{
   char paramLocation[MAX_LOCATION];
   bool Init()
   {
      app = this;
      
      if(argc == 2)
         strcpy(paramLocation, argv[1]); // how to check if the path is valid?
      else
         paramLocation[0] = '\0';

      appWindow = eNodepadWindow { };
      
      return true;
   }
}
