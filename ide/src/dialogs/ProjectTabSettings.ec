import "Project"

class ProjectTab : Tab
{
   Project project;

   background = formColor;
   text = $"Project";

   Label labelModuleName { this, position = { 8, 8 }, labeledWindow = moduleName };
   EditBox moduleName
   {
      this, size = { 180, 22 }, position = { 8, 24 };
      text = $"Module Name", hotKey = altM;
      NotifyModified = ProjectControlModified;
   };

   Label labelModuleVersion { this, position = { 8, 52 }, labeledWindow = moduleVersion };
   EditBox moduleVersion
   {
      this, size = { 180, 22 }, position = { 8, 68 };
      text = $"Module Version", hotKey = altV;
      NotifyModified = ProjectControlModified;
   };

   Label lcompilerConfigsDir { this, position = { 8, 96 }, labeledWindow = compilerConfigsDir };
   PathBox compilerConfigsDir
   {
      this, size = { 210, 22 }, position = { 8, 112 };
      text = $"Compiler Configurations Directory", hotKey = altC;
      browseDialog = settingsFileDialog;
      NotifyModified = ProjectControlModified;
   };

   Label labelDescription { this, position = { 8, 138 }, labeledWindow = description };
   EditBox description
   {
      this, size = { 290, 100 }, anchor = { left = 8, top = 156, right = 8 };
      multiLine = true, hasVertScroll = true;
      text = $"Description", hotKey = altD;
      NotifyModified = ProjectControlModified;
   };

   Label labelLicense { this, position = { 8, 262 }, labeledWindow = license };
   EditBox license
   {
      this, size = { 290, 22 }, anchor = { left = 8, top = 280, right = 8, bottom = 8 };
      multiLine = true, hasVertScroll = true;
      text = $"License", hotKey = altL;
      NotifyModified = ProjectControlModified;
   };

   void SaveChanges()
   {
      if(description.modifiedDocument || license.modifiedDocument ||
            moduleName.modifiedDocument || compilerConfigsDir.modifiedDocument ||
            moduleVersion.modifiedDocument)
      {
         char * s;
         delete project.moduleName; project.moduleName = CopyString(moduleName.contents);
         project.moduleVersion = moduleVersion.contents;
         project.description = s = description.multiLineContents; delete s;
         project.license = s = license.multiLineContents; delete s;
         project.compilerConfigsDir = compilerConfigsDir.path;

         project.topNode.modified = true;
         project.ModifiedAllConfigs(true, false, true, false);
         ide.projectView.modifiedDocument = true;
         ide.projectView.Update(null);
         ide.AdjustFileMenus();
      }
   }

   bool ProjectControlModified(CommonControl control)
   {
      modifiedDocument = true;
      return true;
   }

   bool OnCreate()
   {
      moduleName.contents = project.moduleName;
      moduleVersion.contents = project.moduleVersion;
      compilerConfigsDir.path = project.compilerConfigsDir;
      description.contents = project.description;
      license.contents = project.license;
      return true;
   }

   bool OnClose(bool parentClosing)
   {
      if(modifiedDocument)
      {
         DialogResult diagRes = MessageBox
         {
            type = yesNoCancel, master = ide,
            text = $"Save changes to project options?",
            contents = $"Would you like to save changes made to the project options?"
         }.Modal();
         if(diagRes == cancel)
            return false;
         if(diagRes == yes)
            SaveChanges();
         modifiedDocument = false;
      }
      return true;
   }
}
