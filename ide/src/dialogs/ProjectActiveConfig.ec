import "ide"

class ProjectActiveConfig : Window
{
   text = $"Project Active Configuration";
   background = formColor;
   borderStyle = fixed;
   minClientSize = { 568, 40 };
   hasClose = true;
   tabCycle = true;
   size = { 568, 40 };

   Project project;
   property Project project
   {
      set
      {
         project = value;

         if(project)
         {
            DataRow row;
            ProjectConfig cfg;

            for(cfg : project.configurations)
            {
               row = config.AddString(cfg.name);
               row.tag = (int)cfg;
               if(cfg == project.config)
                  config.currentRow = row;
            }
         }
      }
   }

   Button ok
   {
      this, size = { 80 }, position = { 392, 8 };
      text = $"OK", isDefault = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ProjectConfig activeConfig = (ProjectConfig)config.currentRow.tag;
         if(activeConfig != project.config)
         {
            project.config = activeConfig;
            ide.projectView.Update(null);
         }
         Destroy(DialogResult::ok);
         return true;
      }
   };
   
   Button cancel
   {
      this, size = { 80 }, position = { 480, 8 };
      text = $"Cancel", hotKey = escape, id = DialogResult::cancel;
      NotifyClicked = ButtonCloseDialog;
   };

   Label { this, position = { 20, 14 }, labeledWindow = config };
   DropBox config
   {
      this, position = { 160, 8 }, size = { 220 };
      text = $"Active Configuration", hotKey = altA;
   };
   
}
