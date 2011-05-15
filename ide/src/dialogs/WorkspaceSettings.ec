import "Project"
import "DirectoriesBox"

class WorkspaceTab : Tab
{
   background = activeBorder;
   text = "Workspace";

   Label labelDebugDirectory { this, position = { 8, 8 }, labeledWindow = debugDirectory };
   PathBox debugDirectory
   {
      this, size = { 290, 22 }, position = { 8, 24 }, anchor = { left = 8, top = 24, right = 8 };
      text = "Debug Working Directory", hotKey = altU;
      typeExpected = directory;
      browseDialog = { };
      NotifyModified = WorkspaceControlModified;
   };

   Label labelCommandLineArgs { this, position = { 8, 50 }, labeledWindow = commandLineArgs };
   EditBox commandLineArgs
   {
      this, size = { 290, 22 }, position = { 8, 66 }, anchor = { left = 8, top = 66, right = 8 };
      text = "Command Line Arguments", hotKey = altA;
      NotifyModified = WorkspaceControlModified;
   };
   Label labelEnvironmentVars { environmentVars, this, position = { 0, 6 }, labeledWindow = environmentVars };
   NamedStringsBox environmentVars
   {
      this, size = { 290, 100 }, anchor = { left = 8, top = 96, right = 8 };
      text = "Environment Variables", hotKey = altV;
      NotifyModified = WorkspaceControlModified;
   };

   Label labelSourceDirs { sourceDirs, this, position = { 0, 6 }, labeledWindow = sourceDirs };
   DirectoriesBox sourceDirs
   {
      this, size = { 290, 100 }, anchor = { left = 8, top = 204, right = 8 };
      text = "Source Files Directories", hotKey = altI;
      NotifyModified = WorkspaceControlModified;
   };

   bool OnCreate()
   {
      // This is required to be here because the label is labeling its parent, which otherwise has issues
      labelSourceDirs.labeledWindow = sourceDirs;

      if(ide.projectView)
      {
         Array<String> strings { };

         for(dir : ide.workspace.sourceDirs)
            strings.Add(dir);
         sourceDirs.strings = strings;

         debugDirectory.path = ide.workspace.debugDir;
         commandLineArgs.contents = ide.workspace.commandLineArgs;
         environmentVars.namedStrings = ide.workspace.environmentVars;

         delete strings;
      }
      return true;
   }

   bool WorkspaceControlModified(CommonControl control)
   {
      modifiedDocument = true;
      return true;
   }

   void SaveChanges()
   {
      if(debugDirectory.modifiedDocument)
         ide.workspace.debugDir = debugDirectory.slashPath;
      if(commandLineArgs.modifiedDocument)
         ide.workspace.commandLineArgs = commandLineArgs.line.text;
      if(environmentVars.modifiedDocument)
         ide.workspace.environmentVars = environmentVars.namedStrings;
      if(sourceDirs.modifiedDocument)
         ide.workspace.UpdateSourceDirsArray(sourceDirs.strings);

      if(debugDirectory.modifiedDocument || sourceDirs.modifiedDocument || commandLineArgs.modifiedDocument)
         ide.workspace.modified = true;
   }

   bool OnClose(bool parentClosing)
   {
      if(modifiedDocument)
      {
         DialogResult diagRes = MessageBox
         {
            type = yesNoCancel, master = rootWindow,
            text = "Save changes to workspace options?",
            contents = "Would you like to save changes made to the workspace options?"
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
