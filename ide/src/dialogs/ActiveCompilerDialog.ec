import "IDESettings"

class ActiveCompilerDialog : Window
{
   text = $"Active Compiler";
   background = formColor;
   borderStyle = fixed;
   minClientSize = { 568, 40 };
   hasClose = true;
   tabCycle = true;
   size = { 568, 40 };

   IDESettings ideSettings;
   String workspaceActiveCompiler;

   Button ok
   {
      this, size = { 80 }, position = { 392, 8 };
      text = $"OK", isDefault = true, id = DialogResult::ok;
      NotifyClicked = ButtonCloseDialog;

      /*bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Destroy(DialogResult::ok);
         return true;
      }*/
   };
   
   Button cancel
   {
      this, size = { 80 }, position = { 480, 8 };
      text = $"Cancel", hotKey = escape, id = DialogResult::cancel;
      NotifyClicked = ButtonCloseDialog;
   };

   DropBox compilerDropBox
   {
      this, position = { 160, 8 }, size = { 220 };
      text = $"Active Compiler", hotKey = altA;

      bool NotifySelect(DropBox dropBox, DataRow row, Modifiers mods)
      {
         if(row)
            workspaceActiveCompiler = row.string;
         return true;
      }
   };
   Label { this, position = { 20, 14 }, labeledWindow = compilerDropBox };

   bool OnPostCreate()
   {
      for(compiler : ideSettings.compilerConfigs)
      {
         DataRow row = compilerDropBox.AddString(compiler.name);
         if(workspaceActiveCompiler && !strcmp(compiler.name, workspaceActiveCompiler))
            compilerDropBox.currentRow = row;
      }
      return true;
   }
}
