import "ecere"
import "Documentor"

class SettingsDialog : Window
{
   text = $"Settings";
   background = activeBorder;
   borderStyle = fixed;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   tabCycle = true;
   size = { 436, 120 };
   anchor = { horz = -83, vert = -104 };
   
   Label docLabel { this, text = $"Documentation Path:", anchor = { left = 16, top = 16 }, labeledWindow = pathEditBox };

   Button browseBtn 
   { 
      this, text = "...", font = { $"Tahoma", 8.25f, bold = true }, hotKey = f2;
      anchor = { right = 20, top = 16 };
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(settingsFileDialog.Modal() == ok) // open the file dialog box, and wait for confirmation that all is okay.
         {
            pathEditBox.contents = settingsFileDialog.filePath; // display the selected directory in the edit box
         }
         return true;
      }     
   };

   FileDialog settingsFileDialog
   {
      type = selectDir, text = $"Select a path"; // set the file dialog box to choose a directory instead of a file.
   };

   Button saveBtn 
   { 
      this, text = $"Save", size = { 68, 21 }, position = { 224, 56 }, isDefault = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         settings.docDir = pathEditBox.contents; // Store the path entered into the edit box
         settingsContainer.Save(); // write that path to the ini file
         Destroy(0); // close the window
         return true;
      }  
   };

   Button cancelBtn 
   { 
      this, text = $"Cancel", size = { 68, 21 }, position = { 304, 56 }, hotKey = escape;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Destroy(0); // close the window without making any changes
         return true;
      }
   };
   EditBox pathEditBox { this, size = { 214, 19 }, contents = settings.docDir, anchor = { right = 41, top = 16 } };
}
