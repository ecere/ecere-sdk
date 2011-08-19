import "Project"

class ProjectTab : Tab
{
   Project project;

   background = activeBorder;
   text = "Project";
   Label labelModuleName { this, position = { 8, 8 }, labeledWindow = moduleName };
   EditBox moduleName
   {
      this, size = { 180, 22 }, position = { 8, 24 };
      text = "Module Name", hotKey = altU;
      NotifyModified = ProjectControlModified;
   };
   
   Label labelDescription { this, position = { 8, 50 }, labeledWindow = description };
   EditBox description
   {
      this, size = { 290, 100 }, position = { 8, 66 }, anchor = { left = 8, top = 66, right = 8 };
      multiLine = true, hasVertScroll = true;
      text = "Description", hotKey = altA;
      NotifyModified = ProjectControlModified;
   };

   Label labelLicense { this, position = { 8, 174 }, labeledWindow = license };
   EditBox license
   {
      this, size = { 290, 22 }, position = { 8, 190 }, anchor = { left = 8, top = 190, right = 8, bottom = 8 };
      multiLine = true, hasVertScroll = true;
      text = "License", hotKey = altA;
      NotifyModified = ProjectControlModified;
   };

   void SaveChanges()
   {
      if(description.modifiedDocument || license.modifiedDocument || moduleName.modifiedDocument)
      {
         delete project.moduleName; project.moduleName = CopyString(moduleName.contents);
         delete project.description; project.description = description.multiLineContents;
         delete project.license; project.license = license.multiLineContents;  // THIS ALLOCATES A NEW STRING (multi line)
         
         project.topNode.modified = true;
         ide.projectView.modifiedDocument = true;
         ide.projectView.Update(null);
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
            text = "Save changes to project options?",
            contents = "Would you like to save changes made to the project options?"
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
