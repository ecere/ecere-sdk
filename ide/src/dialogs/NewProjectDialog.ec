import "ide"

FileDialog fileDialog { type = selectDir, text = $"Select project directory" };

class NewProjectDialog : Window
{
   background = formColor;
   minClientSize = { 316, 170 };
   maxClientSize = { 640, 170 };
   borderStyle = sizable;
   tabCycle = true;
   hasClose = true;
   text = $"New Project";

   char path[MAX_LOCATION];
   char name[MAX_FILENAME];

   PathBox locationEditBox
   {
      this, position = { 10, 80 }, size = { 120, 22 }, anchor = { left = 10, top = 80, right = 10 };
      hotKey = altL, text = $"Location";
      typeExpected = directory, browseDialog = fileDialog;

      NotifyModified = NotifyModifiedLocation;
   };
   Label { this, position = { 10, 60 }, labeledWindow = locationEditBox };

   DropBox targetType { this, position = { 10, 130 }, size = { 130 }, hotKey = altT, text = $"Target Type" };

   Label { this, position = { 10, 110 }, labeledWindow = targetType };

   Button okBtn
   {
      parent = this, isDefault = true, disabled = true, position = { 170, 130 }, size = { 60 }, text = $"OK";
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         char * location = locationEditBox.slashPath;
         char * prjName = projectName.contents;
         char filePath[MAX_LOCATION];
         char fileName[MAX_LOCATION];  // Windows Friendly path
         char extension[MAX_EXTENSION];
         FileAttribs exists;
         Project project;
         Workspace workspace;
         ProjectView projectWindow;
         ProjectConfig debug, release;
         
         if(!FileExists(location).isDirectory)
         {
            if(MessageBox { type = yesNo, master = this, 
                  text = $"Directory doesn't exist", contents = $"Create directory?" }.Modal() == yes)
            {
               if(!MakeDir(location))
               {
                  MessageBox { type = ok, master = this, text = location, contents = $"Error creating directory" }.Modal();
                  return true;
               }
            }
            else
               return true;
         }

         strcpy(filePath, location);
         PathCatSlash(filePath, prjName);
         GetExtension(filePath, extension);
         //if(!extension[0])
            ChangeExtension(filePath, ProjectExtension, filePath);

         GetSystemPathBuffer(fileName, filePath);
         exists = FileExists(filePath);

         if(exists)
         {
            if(MessageBox { type = yesNo, master = this, 
                  text = $"Project Already Exists", contents = $"Replace existing project?" }.Modal() == no)
               return true;
         }

         debug = ProjectConfig
         {
            name = CopyString("Debug");
            options = 
            {
               optimization = none;
               fastMath = false;
               debug = true;
               preprocessorDefinitions = { [ CopyString("_DEBUG") ] };
            };
            makingModified = true;
            compilingModified = true;
            linkingModified = true;
         };

         release = ProjectConfig
         {
            name = CopyString("Release");
            options =
            {
               optimization = speed;
               fastMath = true;
               debug = false;
            };
            makingModified = true;
            compilingModified = true;
            linkingModified = true;
         };

         /* error: too few arguments to function ‘__ecereProp_DirExpression_Set_char__PTR_’ -- debug.objDir = "debug";*/ 

         project = Project
         {
            filePath = filePath;
            moduleName = CopyString(name);
            topNode.type = NodeTypes::project;
            config = debug;
         };
         /*project.topNode.options = */project.options =
         {
            warnings = all;
            // TOFIX: Precomp problems withou the extra ( )
            targetType = ((TargetTypes)targetType.GetTag());
            targetFileName = /*CopyString(*/name/*)*/;
         };
         if(project.options.targetType != staticLibrary)
         {
            project.options.libraries = { [ CopyString("ecere") ] };
         }

         {
            char workspaceFile[MAX_LOCATION];
            strcpy(workspaceFile, filePath);
            ChangeExtension(workspaceFile, WorkspaceExtension, workspaceFile);
            workspace = Workspace { compiler = ideSettings.defaultCompiler, workspaceFile = workspaceFile };
         } 
         workspace.projects.Add(project);

         project.topNode.configurations = /*project.configurations = */{ [ debug, release ] };
         project.resNode = project.topNode.Add(project, "Resources", null, resources, archiveFile, false);

         if(!project.Save(filePath))
         {
            MessageBox { type = ok, master = this, text = filePath, contents = $"Error writing project file" }.Modal();
            delete project;
            return true;
         }

         projectWindow = ide.CreateProjectView(workspace, fileName);
         
         {
            char newWorkingDir[MAX_LOCATION];
            StripLastDirectory(filePath, newWorkingDir);

            ide.ChangeFileDialogsDirectory(newWorkingDir, false);
            
            StripLastDirectory(newWorkingDir, newWorkingDir);
            ide.ChangeProjectFileDialogDirectory(newWorkingDir);
         }

         if(createForm.checked)
         {
            char className[256];
            char varName[256];
            CodeEditor codeEditor = projectWindow.CreateNew("Form", "form", "Window", className);
            EditBox editBox = codeEditor.editBox;
            strcpy(varName, className);
            if(islower(varName[0]))
            {
               memmove(varName+1, varName, strlen(varName)+1);
               varName[0] = '_';
            }
            else
               varName[0] = (char)tolower(varName[0]);

            editBox.End();
            editBox.Printf("\n%s %s {};\n", className, varName);

            codeEditor.EnsureUpToDate();

            project.Save(filePath);

            projectWindow.modifiedDocument = false;
            project.topNode.modified = false;

            /*
            editBox.Printf("class FormApplication : GuiApplication\n");
            editBox.Printf("{\n");
            editBox.Printf("   %s %s {};\n", className, varName);
            editBox.Printf("}\n");
            editBox.Home();
            */
         }
         project.StartMonitoring();

         if(project && projectWindow)
         {
            CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
            ProjectConfig config = project.config;
            projectWindow.ShowOutputBuildLog(true);
            projectWindow.DisplayCompiler(compiler, false);
            projectWindow.ProjectPrepareCompiler(project, compiler, false);
            projectWindow.ProjectPrepareMakefile(project, force, compiler, config);
            delete compiler;

            ide.UpdateToolBarActiveConfigs(false);
         }

         Destroy(0);
         return true;
      }
   };
   
   Button
   {
      parent = this, position = { 240, 130 }, size = { 60 }, hotKey = escape, text = $"Cancel";
      NotifyClicked = ButtonCloseDialog;
   };
   Button createForm
   {
      parent = this, text = $"Create Form", hotKey = altF, position = { 200, 30 };
      isCheckbox = true, checked = true;
   };
   
   EditBox projectName
   {
      parent = this, textHorzScroll = true, position = { 10, 30 }, size = { 160 };
      hotKey = altP, text = $"Project Name";
      NotifyUpdate = EditBoxUpdate;

      bool NotifyModified(EditBox editBox)
      {
         char name[MAX_FILENAME];
         char lastPart[MAX_LOCATION];
         char * text = editBox.contents;

         // drop leading path stuff that has no business here
         GetLastDirectory(text, name);

         GetLastDirectory(path, lastPart);
         if(name[0] && (!strcmp(path, lastPart) || !path[0] || !strcmp(this.name, lastPart)))
         {
            if(strcmp(path, lastPart))
               StripLastDirectory(path, path);
            PathCatSlash(path, name);
            locationEditBox.path = path;
         }
         else if(!name[0] && !strcmp(this.name, lastPart))
         {
            if(strcmp(path, lastPart))
               StripLastDirectory(path, path);
            locationEditBox.path = path;
         }
         else if(strcmp(name, lastPart))
         {
            PathCatSlash(path, name);
            locationEditBox.path = path;
         }
         strcpy(this.name, name);
         editBox.contents = name;
         return true;
      }
   };
   Label { this, position = { 10, 10 }, labeledWindow = projectName };

   void EditBoxUpdate(EditBox editBox)
   {
      okBtn.disabled = !(locationEditBox.path[0] && projectName.contents[0]);
   }

   bool NotifyModifiedLocation(PathBox pathBox)
   {
      char location[MAX_LOCATION];
      char lastPart[MAX_FILENAME];
      char * text = pathBox.slashPath;

      //replacing this: NotifyUpdate = EditBoxUpdate;
      okBtn.disabled = !(text[0] && projectName.contents[0]);

      GetWorkingDir(location, sizeof(location) - 1);
      PathCatSlash(location, text);

      GetLastDirectory(path, lastPart);
      /*if(text[0] && (!name[0] || !strcmp(lastPart, name)))
      {
         char newName[MAX_FILENAME];
         GetLastDirectory(location, newName);
         if(strcmp(newName, location))
         {
            strcpy(name, newName);
            projectName.contents = name;
         }
      }*/
      strcpy(path, location);
      pathBox.path = path;
      return true;
   }

   NewProjectDialog()
   {
      char location[MAX_LOCATION];

      if(ideSettings.ideProjectFileDialogLocation)
         strcpy(location, ideSettings.ideProjectFileDialogLocation);
      else
         GetWorkingDir(location, sizeof(location) - 1);

      locationEditBox.path = location;
      strcpy(path, location);

      {
         DataRow row;

         //targetType.AddField("String", null, 0);

         row = targetType.AddRow();
         row.tag = TargetTypes::executable;
         row.SetData(null, $"Executable");

         row = targetType.AddRow();
         row.tag = TargetTypes::sharedLibrary;
         row.SetData(null, $"Shared Library");

         row = targetType.AddRow();
         row.tag = TargetTypes::staticLibrary;
         row.SetData(null, $"Static Library");

         targetType.currentRow = targetType.FindRow(TargetTypes::executable);
      }
   }
}

class QuickProjectDialog : Window
{
   background = formColor;
   minClientSize = { 316, 110 };
   maxClientSize = { 640, 110 };
   borderStyle = sizable;
   tabCycle = true;
   hasClose = true;
   text = $"Quick Project";

   char path[MAX_LOCATION];
   char name[MAX_FILENAME];

   Label message { this, position = { 10, 10 }, text = $"Do you want to quickly create a temporary project?" };

   DropBox targetType { this, position = { 10, 70 }, size = { 130 }, hotKey = altT, text = $"Target Type" };
   Label { this, position = { 10, 50 }, labeledWindow = targetType };

   Button okBtn
   {
      parent = this, isDefault = true, position = { 170, 70 }, size = { 60 }, text = $"OK";
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         char tempDir[MAX_LOCATION] = "";
         char filePath[MAX_LOCATION];
         char prjName[MAX_LOCATION] = "quick_project";
         Project project;
         Workspace workspace;
         ProjectView projectWindow;
         ProjectConfig debug, release;

         /*if(!*/CreateTemporaryDir(tempDir, "ecereide");/*)
         {
            MessageBox { type = ok, master = this, text = tempDir, contents = "Error creating temporary directory." }.Modal();
            return true;
         }*/

         GetLastDirectory(tempDir, prjName);
         {
            char * dot;
            if((dot = strstr(prjName, ".")))
               dot[0] = '_';
         }

         if(!FileExists(tempDir).isDirectory)
         {
            MessageBox { type = ok, master = this, text = tempDir, contents = $"Temporary directory does not exist." }.Modal();
            return true;
         }
         
         ide.tmpPrjDir = tempDir;

         strcpy(filePath, tempDir);
         PathCatSlash(filePath, prjName);
         //GetExtension(filePath, extension);
         //if(!extension[0])
            ChangeExtension(filePath, ProjectExtension, filePath);
         GetSystemPathBuffer(filePath, filePath);

         debug = ProjectConfig
         {
            name = CopyString("Debug");
            options = 
            {
               optimization = none;
               fastMath = false;
               debug = true;
               preprocessorDefinitions = { [ CopyString("_DEBUG") ] };
            };
            makingModified = true;
            compilingModified = true;
            linkingModified = true;
         };

         release = ProjectConfig
         {
            name = CopyString("Release");
            options =
            {
               optimization = speed;
               fastMath = true;
               debug = false;
            };
            makingModified = true;
            compilingModified = true;
            linkingModified = true;
         };

         project = Project
         {
            filePath = filePath;
            moduleName = CopyString(prjName);
            topNode.type = NodeTypes::project;
            config = debug;
         };
         /*project.topNode.options = */project.options =
         {
            warnings = all;
            // TOFIX: Precomp problems withou the extra ( )
            targetType = ((TargetTypes)targetType.GetTag());
            targetFileName = /*CopyString(*/prjName/*)*/;
         };

         if(project.options.targetType != staticLibrary)
         {
            project.options.libraries = { [ CopyString("ecere") ] };
         }

         {
            char workspaceFile[MAX_LOCATION];
            strcpy(workspaceFile, filePath);
            ChangeExtension(workspaceFile, WorkspaceExtension, workspaceFile);
            workspace = Workspace { compiler = ideSettings.defaultCompiler, workspaceFile = workspaceFile };
         } 

         workspace.projects.Add(project);

         // *** Don't set this directly on project, it must be set on top ProjectNode ***
         project.topNode.configurations = { [ debug, release ] };

         project.resNode = project.topNode.Add(project, "Resources", null, resources, archiveFile, false);

         if(!project.Save(filePath))
         {
            MessageBox { type = ok, master = this, text = filePath, contents = $"Error writing project file" }.Modal();
            delete project;
            delete workspace;
            ide.DestroyTemporaryProjectDir();
            return true;
         }

         projectWindow = ide.CreateProjectView(workspace, filePath);

         {
            char extension[MAX_EXTENSION];
            Window document = null;
            for(document = ide.firstChild; document; document = document.next)
            {
               if(document.created && document.isDocument && document._class == class(CodeEditor))
               {
                  char * fileName = document.fileName;
                  if(strstr(fileName, "http://") == fileName)
                  {
                     char name[MAX_LOCATION];
                     char newFileName[MAX_LOCATION];
                     GetLastDirectory(fileName, name);
                     strcpy(newFileName, tempDir);
                     PathCat(newFileName, name);

                     // TODO: this should be in Windows::SaveAs(char* asFileName)
                     // start
                     //document.saving = true;
                     if(document.OnSaveFile(newFileName))
                     {
                        document.fileName = newFileName;
                        document.NotifySaved(document.master, /*this*/document, newFileName);
                     }
                     //document.saving = false;
                     // end
                     // TODO else MessageBox unable to save and cancel the whole project creation thing
                     fileName = document.fileName;
                  }
                  if(fileName)
                  {
                     CodeEditor codeEditor = (CodeEditor)document;
                     ide.projectView.AddFile(project.topNode, fileName, false, false);
                     codeEditor.DebugMenusDisabled();
                  }
               }
            }
         }

         if(project.topNode.modified)
         {
            project.Save(filePath);
            projectWindow.modifiedDocument = false;
            project.topNode.modified = false;
         }
         else
         {
            // TOCHECK: Why is the Quick project creating a form???
            char className[256];
            char varName[256];
            CodeEditor codeEditor = projectWindow.CreateNew("Form", "form", "Window", className);
            EditBox editBox = codeEditor.editBox;
            strcpy(varName, className);
            if(islower(varName[0]))
            {
               memmove(varName+1, varName, strlen(varName)+1);
               varName[0] = '_';
            }
            else
               varName[0] = (char)tolower(varName[0]);

            editBox.End();
            editBox.Printf("\n%s %s {};\n", className, varName);

            codeEditor.EnsureUpToDate();

            // TODO: how to save that new file?

            project.Save(filePath);
            projectWindow.modifiedDocument = false;
            project.topNode.modified = false;
         }
         project.StartMonitoring();

         visible = false;

         if(project && projectWindow)
         {
            CompilerConfig compiler = ideSettings.GetCompilerConfig(ide.workspace.compiler);
            ProjectConfig config = project.config;
            projectWindow.ShowOutputBuildLog(true);
            projectWindow.DisplayCompiler(compiler, false);
            projectWindow.ProjectPrepareCompiler(project, compiler, false);
            projectWindow.ProjectPrepareMakefile(project, force, compiler, config);
            delete compiler;
         }

         ide.projectView.ProjectBuild(null, Modifiers { });

         Destroy(0);
         return true;
      }
   };
   
   Button
   {
      parent = this, position = { 240, 70 }, size = { 60 }, hotKey = escape, text = $"Cancel";
      NotifyClicked = ButtonCloseDialog;
   };
   
   QuickProjectDialog()
   {
      DataRow row;

      row = targetType.AddRow();
      row.tag = TargetTypes::executable;
      row.SetData(null, $"Executable");

      row = targetType.AddRow();
      row.tag = TargetTypes::sharedLibrary;
      row.SetData(null, $"Shared Library");

      row = targetType.AddRow();
      row.tag = TargetTypes::staticLibrary;
      row.SetData(null, $"Static Library");

      targetType.currentRow = targetType.FindRow(TargetTypes::executable);
   }

   bool OnPostCreate()
   {
      okBtn.Activate();
      return true;
   }
}
