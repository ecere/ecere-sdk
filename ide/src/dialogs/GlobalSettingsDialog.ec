import "IDESettings"

// import "SelectorBar"
import "CompilersDetectionDialog"
import "ide"

FileDialog settingsFileDialog { type = selectDir, text = $"Select directory" };

FileDialog toolchainFileDialog { type = open, text = $"Open"; mayNotExist = true; };

class GlobalSettingsDialog : Window
{
   autoCreate = false;
   tabCycle = true;
   background = formColor;
   hasClose = true;
   borderStyle = sizable;
   text = $"Global Settings";
   minClientSize = { 560, 542 };
   nativeDecorations = true;

   String workspaceActiveCompiler;

   TabControl tabControl { this, background = formColor, anchor = { left = 8, top = 8, right = 8, bottom = 40 } };

   EditorTab editorTab { this, tabControl = tabControl };
   CompilersTab compilersTab { this, tabControl = tabControl };
   ProjectOptionsTab projectOptionsTab { this, tabControl = tabControl };
   WorkspaceOptionsTab workspaceOptionsTab { this, tabControl = tabControl };

   property bool settingsModified
   {
      get
      {
         return editorTab.modifiedDocument || compilersTab.modifiedDocument ||
               projectOptionsTab.modifiedDocument || workspaceOptionsTab.modifiedDocument;
      }
   }

   bool OnClose(bool parentClosing)
   {
      if(!settingsModified || MessageBox {
         type = okCancel, master = ide,
         text = $"Lose Changes?",
         contents = $"Are you sure you wish to discard changes?"
          }.Modal() == ok)
         return true;
      return false;
   }

   Button cancel
   {
      parent = this, hotKey = escape, text = $"Cancel", id = DialogResult::cancel;
      position = { 290, 290 }, size = { 80 };
      anchor = { right = 8, bottom = 8 };
      NotifyClicked = ButtonCloseDialog;
   };

   Button ok
   {
      parent = this, isDefault = true, text = $"OK";
      position = { 200, 290 }, size = { 90 };
      anchor = { right = 96, bottom = 8 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(settingsModified)
         {
            bool editorSettingsChanged = false;
            bool compilerSettingsChanged = false;
            bool compilersChanged = false;
            bool projectOptionsChanged = false;
            AVLTree<String> cfgsToWrite = null;
            if(editorTab.modifiedDocument)
            {
               if(editorTab.useFreeCaret.checked != ideSettings.useFreeCaret ||
                     editorTab.showLineNumbers.checked != ideSettings.showLineNumbers ||
                     editorTab.caretFollowsScrolling.checked != ideSettings.caretFollowsScrolling ||
                     editorTab.fontPicker.fontSize != ideSettings.codeEditorFontSize ||
                     editorTab.fontPicker.faceName.OnCompare(ideSettings.codeEditorFont) ||
                     editorTab.dbColorSchemes.currentRow.string.OnCompare(ideSettings.activeColorScheme)
                     )
               {
                  DataRow csRow = editorTab.dbColorSchemes.currentRow;
                  ideSettings.useFreeCaret = editorTab.useFreeCaret.checked;
                  ideSettings.showLineNumbers = editorTab.showLineNumbers.checked;
                  ideSettings.caretFollowsScrolling = editorTab.caretFollowsScrolling.checked;
                  ideSettings.codeEditorFont = editorTab.fontPicker.faceName;
                  ideSettings.codeEditorFontSize = editorTab.fontPicker.fontSize;
                  if(csRow && csRow.string)
                  {
                     ideSettings.activeColorScheme = csRow.string;
                     for(cs : ideSettings.colorSchemes; cs.name && !strcmp(cs.name, csRow.string))
                     {
                        colorScheme = cs;
                        ide.ApplyColorScheme(colorScheme);
                        break;
                     }
                  }

                  ide.ApplyFont(ideSettings.codeEditorFont, ideSettings.codeEditorFontSize);

                  editorSettingsChanged = true;
               }
            }

            if(compilersTab.modifiedDocument)
            {
               if(strcmp(compilersTab.compilerConfigsDir.path, ideSettings.compilerConfigsDir))
               {
                  ideSettings.compilerConfigsDir = compilersTab.compilerConfigsDir.path;
                  compilerSettingsChanged = true;
               }
               if(compilersTab.compilerConfigs.OnCompare(ideConfig.compilers))
               {
                  cfgsToWrite = compilersTab.compilerConfigs.getWriteRequiredList(ideConfig.compilers);
                  ideConfig.compilers.Free();
                  for(compiler : compilersTab.compilerConfigs)
                  {
                     ideConfig.compilers.Add(compiler.Copy());
                  }
                  compilersChanged = true;
               }
            }

            if(projectOptionsTab.modifiedDocument)
            {
               if(strcmp(projectOptionsTab.defaultTargetDir.path, ideSettings.projectDefaultTargetDir)
                     || strcmp(projectOptionsTab.defaultIntermediateObjDir.path, ideSettings.projectDefaultIntermediateObjDir))
               {
                  ideSettings.projectDefaultTargetDir = projectOptionsTab.defaultTargetDir.path;
                  ideSettings.projectDefaultIntermediateObjDir = projectOptionsTab.defaultIntermediateObjDir.path;
                  projectOptionsChanged = true;
               }
            }

            if(workspaceOptionsTab.modifiedDocument)
            {
               DataRow row = workspaceOptionsTab.defaultCompilerDropBox.currentRow;
               if(row && row.string)
               {
                  if(!ideSettings.defaultCompiler || strcmp(row.string, ideSettings.defaultCompiler))
                  {
                     ideSettings.defaultCompiler = row.string;
                  }
               }
            }

            if(editorSettingsChanged || compilerSettingsChanged || projectOptionsChanged)
               settingsContainer.Save();

            if(editorSettingsChanged)
               OnGlobalSettingChange(GlobalSettingsChange::editorSettings);
            if(compilerSettingsChanged)
               OnGlobalSettingChange(GlobalSettingsChange::compilerSettings);
            if(projectOptionsChanged)
               OnGlobalSettingChange(GlobalSettingsChange::projectOptions);

            if(compilersChanged)
            {
               ideConfig.compilers.write(settingsContainer, cfgsToWrite);
               OnGlobalSettingChange(GlobalSettingsChange::compilers);
               cfgsToWrite.Free();
               delete cfgsToWrite;
            }

            editorTab.modifiedDocument = false;
            compilersTab.modifiedDocument = false;
            projectOptionsTab.modifiedDocument = false;
            workspaceOptionsTab.modifiedDocument = false;
         }

         Destroy(DialogResult::ok);
         return true;
      }
   };

   /*
   void Temp()
   {
      DirTypes c;
      for(c = 0; c < DirTypes::enumSize; c++)
      {
         CompilerDir compilerDir;

         for(systemDir : ideSettings.systemDirs[c])
         {
            compilerDir = CompilerDir { type = c; compilerConfig = null; path = CopyString(systemDir) };
            dirs.Add(compilerDir);
         }

         row = compilersTab.dirs[c].AddRow();
         row.SetData(null, "");
         compilersTab.dirs[c].currentRow = compilersTab.dirs[c].firstRow;
         compilersTab.dirs[c].modifiedDocument = false;
      }
   }
   */

   bool OnCreate()
   {
      CompilerConfig activateCompiler = null;
      CompilerConfig readonlyCompiler = null;

      // EditorTab
      editorTab.useFreeCaret.checked = ideSettings.useFreeCaret;
      editorTab.showLineNumbers.checked = ideSettings.showLineNumbers;
      editorTab.caretFollowsScrolling.checked = ideSettings.caretFollowsScrolling;

      // CompilersTab
      if(workspaceActiveCompiler)
      {
         for(compiler : ideConfig.compilers)
         {
            if(!activateCompiler && !strcmp(workspaceActiveCompiler, compiler.name))
               activateCompiler = compiler;
            if(!readonlyCompiler && compiler.readOnly)
               readonlyCompiler = compiler;
            if(activateCompiler && readonlyCompiler)
               break;
         }
      }
      if(!activateCompiler && readonlyCompiler)
         activateCompiler = readonlyCompiler;
      if(!activateCompiler && ideConfig.compilers.count)
         activateCompiler = ideConfig.compilers[0];

      for(compiler : ideConfig.compilers)
         compilersTab.AddCompiler(compiler.Copy(), compiler == activateCompiler);
      compilersTab.compilerConfigsDir.path = ideSettings.compilerConfigsDir;

      // ProjectOptionsTab
      projectOptionsTab.defaultTargetDir.path = ideSettings.projectDefaultTargetDir;
      projectOptionsTab.defaultIntermediateObjDir.path = ideSettings.projectDefaultIntermediateObjDir;

      return true;
   }

   void OnDestroy()
   {
      editorTab.modifiedDocument = false;
      compilersTab.modifiedDocument = false;
      compilersTab.dirsTab.modifiedDocument = false;
      compilersTab.toolchainTab.modifiedDocument = false;
      compilersTab.optionsTab.modifiedDocument = false;
      compilersTab.activeCompiler = null;
      compilersTab.compilerConfigs.Free();
      compilersTab.compilerSelector.Clear();
      projectOptionsTab.modifiedDocument = false;
      workspaceOptionsTab.modifiedDocument = false;
   }

   virtual void OnGlobalSettingChange(GlobalSettingsChange globalSettingsChange);
}

import "FontPicker"

class EditorTab : GlobalSettingsSubTab
{
   background = formColor;
   text = $"Editor";

   bool OnCreate()
   {
      dbColorSchemes.Clear();

      for(s : ideSettings.colorSchemes)
      {
         DataRow row = dbColorSchemes.AddString(s.name);
         if(!strcmp(s.name, ideSettings.activeColorScheme))
            dbColorSchemes.currentRow = row;
      }
      return true;
   }

   Label lblColorSchemes { this, anchor = { top = 70, right = 16 }, labeledWindow = dbColorSchemes };
   DropBox dbColorSchemes
   {
      this, text = $"Color Scheme: ", anchor = { top = 92, right = 16 }, size = { 200, 22 };

      bool NotifySelect(DropBox dropBox, DataRow row, Modifiers mods)
      {
         if(row)
         {
            IDEColorScheme colorScheme = null;
            for(cs : ideSettings.colorSchemes; cs.name && !strcmp(cs.name, row.string))
            {
               colorScheme = cs;
               break;
            }
            fontPicker.SelectColorScheme(colorScheme);
            modifiedDocument = true;
         }
         return true;
      }
   };

   Button useFreeCaret
   {
      this, text = $"Move code editor caret freely past end of line", position = { 16, 58 }, isCheckbox = true;
      NotifyClicked = NotifyClickedModifiedDocument;
   };

   Button caretFollowsScrolling
   {
      this, text = $"Keep caret visible (move along) when scrolling", position = { 16, 78 }, isCheckbox = true;
      NotifyClicked = NotifyClickedModifiedDocument;
   };

   Button showLineNumbers
   {
      this, text = $"Show line numbers in code editor", position = { 16, 98 }, isCheckbox = true;
      NotifyClicked = NotifyClickedModifiedDocument;
   };

   bool NotifyClickedModifiedDocument(Button button, int x, int y, Modifiers mods)
   {
      modifiedDocument = true;
      return true;
   }

   FontPicker fontPicker
   {
      this, anchor = { left = 8, right = 8, top = 120, bottom = 8 };

      bool NotifyChanged()
      {
         modifiedDocument = true;
         return true;
      }
   };
}

static void DrawStipple(Surface surface, Size clientSize)
{
   int x1 = 0;
   int y1 = 0;
   int x2 = clientSize.w - 1;
   int y2 = clientSize.h - 1;
   if((x2 - x1) & 1) x2--;
   if((y2 - y1) & 1) y2--;

   surface.LineStipple(0x5555);
   surface.Rectangle(x1, y1, x2, y2);
   surface.LineStipple(0);
}

class CompilersTab : GlobalSettingsSubTab
{
   background = formColor;
   text = $"Compilers";

   Label compilerConfigsDirLabel { this, position = { 8, 12 }, labeledWindow = compilerConfigsDir, tabCycle = false, inactive = true };
   PathBox compilerConfigsDir
   {
      this, anchor = { left = 230, top = 8, right = 8 };
      text = $"Compiler Configurations Directory", browseDialog = settingsFileDialog, NotifyModified = NotifyModifiedDocument;
   };

   SelectorBar compilerSelector
   {
      this, text = $"Compiler Configurations:", anchor = { left = 148, top = 38, right = 99 }; size = { 0, 26 };
      opacity = 0;
      direction = horizontal;
      scrollable = true;
      endButtons = false;
      hoverScroll = true;

      bool OnKeyDown(Key key, unichar ch)
      {
         if(key == insert)
         {
            ((CompilersTab)parent).createCompiler.NotifyClicked(parent, ((CompilersTab)parent).createCompiler, 0, 0, 0);
            return false;
         }
         else if(key == del)
         {
            ((CompilersTab)parent).deleteCompiler.NotifyClicked(parent, ((CompilersTab)parent).deleteCompiler, 0, 0, 0);
            return false;
         }
         return SelectorBar::OnKeyDown(key, ch);
      }

      bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
      {
         ((CompilersTab)master).labelCompilers.Update(null);
         return true;
      }

      bool OnPostCreate()
      {
         CompilersTab compilers = (CompilersTab)parent;
         SelectorBar::OnPostCreate();
         if(compilers.selectedButton)
         {
            Button sb = compilers.selectedButton;
            sb.Activate();
            sb.checked = true;
            // Why was this being set to null? On going back to compilers the 2nd time, the selectedButton was lost and so was not made visible...
            // compilers.selectedButton = null;
         }
         return true;
      }
   };

   TabControl tabControl { this, background = formColor, anchor = { left = 8, top = 68, right = 8, bottom = 8 } };

   CompilerDirectoriesTab dirsTab { this, tabControl = tabControl };
   CompilerToolchainTab toolchainTab { this, tabControl = tabControl };
   CompilerEnvironmentTab environmentTab { this, tabControl = tabControl };
   CompilerOptionsTab optionsTab { this, tabControl = tabControl };

   CompilerConfigs compilerConfigs { };
   CompilerConfig activeCompiler;

   Label labelCompilers
   {
      this, anchor = { left = 8, top = 44 }, labeledWindow = compilerSelector;

      void OnRedraw(Surface surface)
      {
         Label::OnRedraw(surface);
         if(labeledWindow.active)
            DrawStipple(surface, clientSize);
      }
   };

   void FindUniqueCompilerName(const char * baseName, CompilerConfig compiler/*, bool startWithNumber*/, char * output)
   {
      int num = 0;
      char tmp[MAX_F_STRING];
      /*if(startWithNumber)
         sprintf(tmp, "%s%d", baseName, num);
      else*/
         strcpy(tmp, baseName);
      while(true)
      {
         CompilerConfig matchingCompiler = null;
         for(c : compilerConfigs)
         {     // TOFIX: Error when omitting these brackets, c not found
            if((!compiler || c != compiler) && c.name && !strcmp(c.name, tmp))
            {
               matchingCompiler = c;
               break;
            }
         }
         if(matchingCompiler)
         {
            num++;
            sprintf(tmp, "%s%d", baseName, num);
         }
         else
            break;
      }
      strcpy(output, tmp);
   }

   Button createCompiler
   {
      parent = this, bevelOver = true, inactive = true;
      size = { 22, 22 };
      anchor = { top = 40, right = 77 };
      hotKey = altC, bitmap = BitmapResource { fileName = ":actions/docNew.png", alphaBlend = true };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         char compilerName[MAX_F_STRING];
         CompilerConfig newCompiler;
         FindUniqueCompilerName("New Compiler", null, compilerName);
         newCompiler = MakeDefaultCompiler(compilerName, false);
         AddCompiler(newCompiler, true);
         modifiedDocument = true;
         return true;
      }
   };
   Button detectCompiler
   {
      parent = this, bevelOver = true, inactive = true;
      size = { 22, 22 };
      anchor = { top = 40, right = 54 };
      hotKey = altC, bitmap = BitmapResource { fileName = ":actions/attach.png", alphaBlend = true };

      bool NotifyClicked(Button b, int x, int y, Modifiers mods)
      {
         CompilersDetectionDialog compilersDetectionDialog
         {
            dialog.parent;

         };
         if(compilersDetectionDialog.Modal())
         {
            if(compilersDetectionDialog.selectedCompilerType)
            {
               char uniqueName[MAX_F_STRING];
               CompilerConfig newCompiler = compilersDetectionDialog.compilerConfig;
               FindUniqueCompilerName(newCompiler.name, null, uniqueName);
               newCompiler.name = uniqueName;
               AddCompiler(newCompiler, true);
               modifiedDocument = true;
            }
         }
         return true;
      }
   };
   Button duplicateCompiler
   {
      parent = this, bevelOver = true, inactive = true;
      size = { 22, 22 };
      anchor = { top = 40, right = 31 };
      hotKey = altU, bitmap = BitmapResource { fileName = ":actions/editCopy.png", alphaBlend = true };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         char copyName[MAX_F_STRING];
         CompilerConfig copyCompiler = activeCompiler.Copy();
         FindUniqueCompilerName(copyCompiler.name, null, copyName);
         copyCompiler.readOnly = false;
         copyCompiler.name = copyName;
         AddCompiler(copyCompiler, true);
         modifiedDocument = true;
         return true;
      }
   };
   Button deleteCompiler
   {
      parent = this, bevelOver = true, inactive = true;
      size = { 22, 22 };
      anchor = { top = 40, right = 8 };
      hotKey = altD, bitmap = BitmapResource { fileName = ":actions/delete2.png", alphaBlend = true };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(activeCompiler)
         {
            CompilerConfig compilerToDelete = activeCompiler;
            String title = PrintString($"Delete ", compilerToDelete.name, $" Compiler Configuration");
            String msg = PrintString($"Are you sure you wish to delete the ", compilerToDelete.name, $" compiler configuration?");
            if(MessageBox { type = okCancel, text = title, contents = msg }.Modal() == ok)
            {
               SelectorButton button = compilerSelector.FindButtonByID((int64)(intptr)compilerToDelete);
               if(button)
                  compilerSelector.RemoveButton(button);
               //DeleteCompiler(compilerToDelete);
               {
                  Iterator<CompilerConfig> it { compilerConfigs };
                  if(it.Find(compilerToDelete))
                     compilerConfigs.Delete(it.pointer);
               }
               modifiedDocument = true;
            }
            delete title;
            delete msg;
         }
         return true;
      }
   };

   void AddCompiler(CompilerConfig compiler, bool load)
   {
      SelectorButton selectButton;
      if(compiler.readOnly)
      {
         SelectorButton button
         {
            compilerSelector, master = this, text = compiler.name, id = (int64)(intptr)compiler;
            NotifyClicked = CompilerClicked;
         };
         selectButton = button;
      }
      else
      {
         EditableSelectorButton button
         {
            compilerSelector, master = this, renameable = true, text = compiler.name, id = (int64)(intptr)compiler;
            NotifyClicked = CompilerClicked;

            bool OnRename(EditableSelectorButton button, char ** oldName, char ** newName)
            {
               if(*newName && (*newName)[0])
               {
                  char compilerName[MAX_F_STRING];
                  FindUniqueCompilerName(*newName, activeCompiler, compilerName);
                  if(strcmp(*newName, compilerName))
                  {
                     delete *newName;
                     *newName = CopyString(compilerName);
                  }
                  activeCompiler.name = compilerName;
                  modifiedDocument = true;
                  return true;
               }
               return false;
            }
         };
         selectButton = (SelectorButton)button;
      }
      compilerConfigs.Add(compiler);
      if(load)
      {
         LoadCompiler(compiler);
         selectedButton = selectButton;
         compilerSelector.Select(selectedButton);
      }
   }
   SelectorButton selectedButton;

   void LoadCompiler(CompilerConfig compiler)
   {
      bool modified = modifiedDocument;
      activeCompiler = compiler;

      dirsTab.Load();
      toolchainTab.Load();
      environmentTab.Load();
      optionsTab.Load();

      // Restore original modifiedDocument
      modifiedDocument = modified;

      deleteCompiler.disabled = compiler.readOnly;
   }

   bool CompilerClicked(Button clickedButton, int x, int y, Modifiers mods)
   {
      if(!eClass_IsDerived(clickedButton._class, class(EditableSelectorButton)) || !((EditableSelectorButton)clickedButton).editBox)
      {
         LoadCompiler((CompilerConfig)(intptr)clickedButton.id);
         selectedButton = (SelectorButton)clickedButton;
      }
      return true;
   }

   bool NotifyModifiedDocument(PathBox pathBox)
   {
      BasicValidatePathBoxPath(pathBox);
      modifiedDocument = true;
      return true;
   }
}

Array<const String> displayDirectoryNames
{ [
   $"Include Files",
   $"Library Files",
   $"Executable Files"
] };

class CompilerDirectoriesTab : CompilersSubTab
{
   background = formColor;
   text = $"Directories";

   Button dirTypeTglBtn[DirTypes];
   DirectoriesBox dirs[DirTypes], currentDirs;

   ~CompilerDirectoriesTab()
   {
      DirTypes c;
      for(c = 0; c < DirTypes::enumSize; c++)
      {
         delete dirs[c];
         delete dirTypeTglBtn[c];
      }
   }
   CompilerDirectoriesTab()
   {
      DirTypes c;
      int v = 8;
      for(c = 0; c < DirTypes::enumSize; c++)
      {
         dirs[c] = DirectoriesBox
         {
            this;//, alwaysHighLight = true
            anchor = { left = 8, top = 8, right = 8, bottom = 8 };
            id = c;

   /*   MAKE SURE THINGS ARE DONE PROPERLY IN THE NEW DIRECTORIES BOX WHEN BROWSING FOR A DIR?
            settingsFileDialog.filePath = directory;
         if(settingsFileDialog.Modal())
            row.SetData(null, (s = CopyUnixPath(settingsFileDialog.filePath)));
   */

            bool NotifyModified(DirectoriesBox dirsBox)
            {
               CompilerConfig compiler = loadedCompiler;
               if(compiler)
               {
                  DirTypes dirType = (DirTypes)dirsBox.id;
                  if(dirType == includes)
                     compiler.includeDirs = dirsBox.strings;
                  else if(dirType == libraries)
                     compiler.libraryDirs = dirsBox.strings;
                  else if(dirType == executables)
                     compiler.executableDirs = dirsBox.strings;

                  compilersTab.modifiedDocument = true;
               }
               return true;
            }
            bool NotifyPathBoxModified(DirectoriesBox dirsBox, PathBox pathBox)
            {
               BasicValidatePathBoxPath(pathBox);
               return true;
            }
         };
         incref dirs[c];

         if(c)
            dirs[c].visible = false;

         // (width) Should be 324 for text...
         //field[c] = { dataType = class(char *), editable = true };
         //dirs[c].AddField(field[c]);

         dirTypeTglBtn[c] = Button
         {
            this, inactive = true, text = displayDirectoryNames[c], bevelOver = true, isRadio = true, bitmap = null;
            stayOnTop = true;
            id = c;
            minClientSize = { 99, 20 };
            anchor = { left = v, top = 8 }; // ((int)c) * 100 + 8

            bool NotifyClicked(Button button, int x, int y, Modifiers mods)
            {
               DirTypes dirType = (DirTypes)button.id;
               currentDirs.visible = false;
               dirs[dirType].visible = true;
               currentDirs = dirs[dirType];
               return true;
            }
         };
         v += dirTypeTglBtn[c].size.w + 1;
         incref dirTypeTglBtn[c];

         if(c == includes)
            dirTypeTglBtn[c].hotKey = altI;
         else if(c == libraries)
            dirTypeTglBtn[c].hotKey = altL;
         else if(c == executables)
            dirTypeTglBtn[c].hotKey = altE;
      }
      currentDirs = dirs[includes];
      dirTypeTglBtn[includes].checked = true;
      return true;
   }

   bool OnLoadGraphics()
   {
      DirTypes c;
      int v = 8;
      for(c = 0; c < DirTypes::enumSize; c++)
      {
         dirTypeTglBtn[c].anchor.left = v;
         v += dirTypeTglBtn[c].size.w + 1;
      }
      return CompilersSubTab::OnLoadGraphics();
   }

   void Load()
   {
      CompilerConfig compiler = loadedCompiler;
      if(compiler)
      {
         dirs[includes].strings = compiler.includeDirs;
         dirs[libraries].strings = compiler.libraryDirs;
         dirs[executables].strings = compiler.executableDirs;
         dirs[includes].list.scroll = { 0, 0 };
         dirs[libraries].list.scroll = { 0, 0 };
         dirs[executables].list.scroll = { 0, 0 };
      }
   }
}

class CompilerToolchainTab : CompilersSubTab
{
   background = formColor;
   text = $"Toolchain";

   int margin;
   margin = 130;

   Label ecpLabel { this, position = { 8, 12 }, labeledWindow = ecp, tabCycle = false, inactive = true };
   PathBox ecp
   {
      this, anchor = { left = margin, top = 8, right = 8 };
      text = $"eC Precompiler", browseDialog = toolchainFileDialog, NotifyModified = NotifyModifiedDocument;
   };
   Label eccLabel { this, position = { 8, 38 }, labeledWindow = ecc, tabCycle = false, inactive = true };
   PathBox ecc
   {
      this, anchor = { left = margin, top = 34, right = 8 };
      text = $"eC Compiler", browseDialog = toolchainFileDialog, NotifyModified = NotifyModifiedDocument;
   };
   Label ecsLabel { this, position = { 8, 64 }, labeledWindow = ecs, tabCycle = false, inactive = true };
   PathBox ecs
   {
      this, anchor = { left = margin, top = 60, right = 8 };
      text = $"eC Symbol Loader", browseDialog = toolchainFileDialog, NotifyModified = NotifyModifiedDocument;
   };
   Label earLabel { this, position = { 8, 90 }, labeledWindow = ear, tabCycle = false, inactive = true };
   PathBox ear
   {
      this, anchor = { left = margin, top = 86, right = 8 };
      text = $"Ecere Archiver", browseDialog = toolchainFileDialog, NotifyModified = NotifyModifiedDocument;
   };
   Label cppLabel { this, position = { 8, 116 }, labeledWindow = cpp, tabCycle = false, inactive = true };
   EditBox cpp
   {
      this, anchor = { left = margin, top = 112, right = 8 };
      //text = $"C Preprocessor", browseDialog = toolchainFileDialog, NotifyModified = NotifyModifiedDocument;
      text = $"C Preprocessor";//, NotifyModified = NotifyModifiedDocument;
      bool NotifyModified(EditBox editBox)
      {
         CompilerConfig compiler = loadedCompiler;
         if(compiler)
         {
            compiler.cppCommand = editBox.contents;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };
   Label ccLabel { this, position = { 8, 142 }, labeledWindow = cc, tabCycle = false, inactive = true };
   PathBox cc
   {
      this, anchor = { left = margin, top = 138, right = 8 };
      text = $"C Compiler", browseDialog = toolchainFileDialog, NotifyModified = NotifyModifiedDocument;
   };
   Label cxxLabel { this, position = { 8, 168 }, labeledWindow = cxx, tabCycle = false, inactive = true };
   PathBox cxx
   {
      this, anchor = { left = margin, top = 164, right = 8 };
      text = $"C++ Compiler", browseDialog = toolchainFileDialog, NotifyModified = NotifyModifiedDocument;
   };
   Label arLabel { this, position = { 8, 194 }, labeledWindow = ar, tabCycle = false, inactive = true };
   PathBox ar
   {
      this, anchor = { left = margin, top = 190, right = 8 };
      text = $"AR", browseDialog = toolchainFileDialog, NotifyModified = NotifyModifiedDocument;
   };
   Label ldLabel { this, position = { 8, 220 }, labeledWindow = ld, tabCycle = false, inactive = true };
   PathBox ld
   {
      this, anchor = { left = margin, top = 216, right = 8 };
      text = $"Linker", browseDialog = toolchainFileDialog, NotifyModified = NotifyModifiedDocument;
   };
   Label makeLabel { this, position = { 8, 246 }, labeledWindow = make, tabCycle = false, inactive = true };
   PathBox make
   {
      this, anchor = { left = margin, top = 242, right = 8 };
      text = $"GNU Make", browseDialog = toolchainFileDialog, NotifyModified = NotifyModifiedDocument;
   };
   Label gnuToolchainPrefixLabel { this, position = { 8, 272 }, labeledWindow = gnuToolchainPrefix, tabCycle = false, inactive = true };
   PathBox gnuToolchainPrefix
   {
      this, anchor = { left = margin, top = 268, right = 8 };
      text = $"GNU Toolchain Prefix", typeExpected = directory, browseDialog = toolchainFileDialog, NotifyModified = NotifyModifiedDocument;
   };
   Label sysrootLabel { this, position = { 8, 298 }, labeledWindow = sysroot, tabCycle = false, inactive = true };
   PathBox sysroot
   {
      this, anchor = { left = margin, top = 294, right = 8 };
      text = $"SYSROOT", browseDialog = toolchainFileDialog, NotifyModified = NotifyModifiedDocument;
   };
   Label executableLauncherLabel { this, position = { 8, 324 }, labeledWindow = executableLauncher, tabCycle = false, inactive = true };
   PathBox executableLauncher
   {
      this, anchor = { left = margin, top = 320, right = 8 };
      text = $"Executable Launcher", browseDialog = toolchainFileDialog, NotifyModified = NotifyModifiedDocument;
   };

   bool NotifyModifiedDocument(PathBox pathBox)
   {
      CompilerConfig compiler = loadedCompiler;
      if(compiler)
      {
         BasicValidatePathBoxPath(pathBox);
         if(pathBox == ecp)
            compiler.ecpCommand = pathBox.slashPath;
         else if(pathBox == ecc)
            compiler.eccCommand = pathBox.slashPath;
         else if(pathBox == ecs)
            compiler.ecsCommand = pathBox.slashPath;
         else if(pathBox == ear)
            compiler.earCommand = pathBox.slashPath;
         /*else if(pathBox == cpp)
            compiler.cppCommand = pathBox.slashPath;*/
         else if(pathBox == cc)
            compiler.ccCommand = pathBox.slashPath;
         else if(pathBox == cxx)
            compiler.cxxCommand = pathBox.slashPath;
         else if(pathBox == ld)
            compiler.ldCommand = pathBox.slashPath;
         else if(pathBox == ar)
            compiler.arCommand = pathBox.slashPath;
         else if(pathBox == make)
            compiler.makeCommand = pathBox.slashPath;
         else if(pathBox == executableLauncher)
            compiler.executableLauncher = pathBox.slashPath;
         else if(pathBox == gnuToolchainPrefix)
            compiler.gccPrefix = pathBox.slashPath;
         else if(pathBox == sysroot)
            compiler.sysroot = pathBox.slashPath;
         modifiedDocument = true;
         compilersTab.modifiedDocument = true;
      }
      return true;
   }

   void Load()
   {
      CompilerConfig compiler = loadedCompiler;
      if(compiler)
      {
         bool disabled = compiler.readOnly;
         bool isVC = compiler.type.isVC;
         ecp.path = compiler.ecpCommand;
         ecc.path = compiler.eccCommand;
         ecs.path = compiler.ecsCommand;
         ear.path = compiler.earCommand;
         //cpp.path = compiler.cppCommand;
         cpp.contents = compiler.cppCommand;
         cc.path = compiler.ccCommand;
         cxx.path = compiler.cxxCommand;
         ld.path = compiler.ldCommand;
         ar.path = compiler.arCommand;
         make.path = compiler.makeCommand;
         executableLauncher.path = compiler.executableLauncher;
         gnuToolchainPrefix.path = compiler.gnuToolchainPrefix;
         sysroot.path = compiler.sysroot;

         ecpLabel.disabled = ecp.disabled = disabled;
         eccLabel.disabled = ecc.disabled = disabled;
         ecsLabel.disabled = ecs.disabled = disabled;
         earLabel.disabled = ear.disabled = disabled;
         cppLabel.disabled = cpp.disabled = isVC || disabled;
         cxxLabel.disabled = cxx.disabled = isVC || disabled;
         ccLabel.disabled = cc.disabled = isVC || disabled;
         ldLabel.disabled = ld.disabled = isVC || disabled;
         arLabel.disabled = ar.disabled = isVC || disabled;
         makeLabel.disabled = make.disabled = disabled;
         executableLauncherLabel.disabled = executableLauncher.disabled = disabled;
         gnuToolchainPrefixLabel.disabled = gnuToolchainPrefix.disabled = disabled;
         sysrootLabel.disabled = sysroot.disabled = disabled;
      }
      modifiedDocument = false;
   }
}

class CompilerEnvironmentTab : CompilersSubTab
{
   background = formColor;
   text = $"Environment";

   Label labelEnvVars { envVars, labeledWindow = envVars, position = { 0, 6 }; };
   NamedStringsBox envVars
   {
      this, size = { 290, 22 }, anchor = { left = 8, top = 8, right = 8, bottom = 8 };
      text = $"Environment Variables", hotKey = altE; //, option = OPTION(postbuildCommands);

      bool NotifyModified(NamedStringsBox stringsBox)
      {
         CompilerConfig compiler = loadedCompiler;
         if(compiler)
         {
            compiler.environmentVars = stringsBox.namedStrings;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   CompilerEnvironmentTab()
   {
   }

   void Load()
   {
      CompilerConfig compiler = loadedCompiler;
      if(compiler)
      {
         envVars.namedStrings = compiler.environmentVars;

         modifiedDocument = false;
      }
   }
}

class CompilerOptionsTab : CompilersSubTab
{
   background = formColor;
   text = $"Options";

   Label labelTargetPlatform { this, position = { 8, 12 }, labeledWindow = targetPlatform };   // TOCHECK: nameless instances dissapear when selecting tabs?
   DropBox targetPlatform
   {
      this, position = { 110, 8 }, size = { 160 };
      text = $"Target Platform", hotKey = altT;
      bool NotifySelect(DropBox dropBox, DataRow row, Modifiers mods)
      {
         CompilerConfig compiler = loadedCompiler;
         if(compiler && row)
         {
            compiler.targetPlatform = (Platform)row.tag;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   int numJobs;
   Label numJobsLabel { this, position = { 8, 40 }, labeledWindow = numJobsBox };
   DataBox numJobsBox
   {
      this, text = $"Number of parallel build jobs", hotKey = altJ, borderStyle = deep;
      position = { 244, 36 }, size = { 80, 20 }, type = class(int), data = &numJobs;

      bool OnKeyDown(Key key, unichar ch)
      {
         if((SmartKey)key == enter)
         {
            DataBox::OnKeyDown(key, ch);
            return true;
         }
         else
            return DataBox::OnKeyDown(key, ch);
      }

      bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
      {
         if(!active)
         {
            if(!SaveData())
               Refresh();
         }
         return true;
      }

      bool NotifyChanged(DataBox dataBox, bool closingDropDown)
      {
         CompilerConfig compiler = loadedCompiler;
         if(compiler)
         {
            compiler.numJobs = numJobs;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   Button ccacheEnabled
   {
      this, text = $"Use ccache", hotKey = altC, position = { 8, 68 };
      isCheckbox = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         CompilerConfig compiler = loadedCompiler;
         if(compiler)
         {
            compiler.ccacheEnabled = button.checked;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   Button distccEnabled
   {
      this, text = $"Use distcc", position = { 158, 68 };
      isCheckbox = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         CompilerConfig compiler = loadedCompiler;
         if(compiler)
         {
            distccHostsLabel.disabled = distccHosts.disabled = !button.checked;
            compiler.distccEnabled = button.checked;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   Label distccHostsLabel { this, position = { 240, 68 }, labeledWindow = distccHosts };
   EditBox distccHosts
   {
      this, text = $"distcc hosts", hotKey = altH;
      position = { 320, 64 }, size = { 160, 22 };

      bool NotifyModified(EditBox editBox)
      {
         CompilerConfig compiler = loadedCompiler;
         if(compiler)
         {
            compiler.distccHosts = editBox.contents;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   Label lblPrepDefs { this, position = { 8, 96 }, labeledWindow = prepDefs };
   StringListBox prepDefs
   {
      this, text = $"Preprocessor directives", hotKey = altP;
      position = { 168, 94 }, size = { 280, 22 }, anchor = { left = 168, top = 94, right = 8 };

      bool NotifyModified(EditBox editBox)
      {
         if(loadedCompiler)
         {
            CompilerConfig compiler = loadedCompiler;
            compiler.prepDirectives = ((StringListBox)editBox).strings;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   Label leCcompilerFlags { this, position = { 8, 126 }, labeledWindow = eCcompilerFlags };
   StringListBox eCcompilerFlags
   {
      this, text = $"Additional eC compiler flags", hotKey = altG;
      position = { 168, 124 }, size = { 280, 22 }, anchor = { left = 168, top = 124, right = 8 };

      bool NotifyModified(EditBox editBox)
      {
         if(loadedCompiler)
         {
            CompilerConfig compiler = loadedCompiler;
            compiler.eCcompilerFlags = ((StringListBox)editBox).strings;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   Label lblCompilerFlags { this, position = { 8, 156 }, labeledWindow = compilerFlags };
   StringListBox compilerFlags
   {
      this, text = $"Additional C compiler flags", hotKey = altR;
      position = { 168, 154 }, size = { 280, 22 }, anchor = { left = 168, top = 154, right = 8 };

      bool NotifyModified(EditBox editBox)
      {
         if(loadedCompiler)
         {
            CompilerConfig compiler = loadedCompiler;
            compiler.compilerFlags = ((StringListBox)editBox).strings;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   Label lblcxxFlags { this, position = { 8, 186 }, labeledWindow = cxxFlags };
   StringListBox cxxFlags
   {
      this, text = $"Additional C++ compiler flags", hotKey = altD;
      position = { 168, 184 }, size = { 280, 22 }, anchor = { left = 168, top = 184, right = 8 };

      bool NotifyModified(EditBox editBox)
      {
         if(loadedCompiler)
         {
            CompilerConfig compiler = loadedCompiler;
            compiler.cxxFlags = ((StringListBox)editBox).strings;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   Label lblLinkerFlags { this, position = { 8, 216 }, labeledWindow = linkerFlags };
   StringListBox linkerFlags
   {
      this, text = $"Additional linker flags", hotKey = altL;
      position = { 168, 214 }, size = { 280, 22 }, anchor = { left = 168, top = 214, right = 8 };

      bool NotifyModified(EditBox editBox)
      {
         if(loadedCompiler)
         {
            CompilerConfig compiler = loadedCompiler;
            compiler.linkerFlags = ((StringListBox)editBox).strings;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   Label lblExcludedLibraries { this, position = { 8, 246 }, labeledWindow = excludedLibraries };
   StringListBox excludedLibraries
   {
      this, text = $"Libraries to exclude", hotKey = altX;
      position = { 168, 244 }, size = { 280, 22 }, anchor = { left = 168, top = 244, right = 8 };

      bool NotifyModified(EditBox editBox)
      {
         if(loadedCompiler)
         {
            CompilerConfig compiler = loadedCompiler;
            compiler.excludeLibs = ((StringListBox)editBox).strings;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   Label objectFileExtLabel { this, position = { 8, 276 }, labeledWindow = objectFileExt };
   EditBox objectFileExt
   {
      this, text = $"Object file extension";//, hotKey = altH;
      position = { 168, 274 }, size = { 80, 22 };

      bool NotifyModified(EditBox editBox)
      {
         CompilerConfig compiler = loadedCompiler;
         if(compiler)
         {
            compiler.objectFileExt = editBox.contents;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   Label staticLibFileExtLabel { this, position = { 8, 306 }, labeledWindow = staticLibFileExt };
   EditBox staticLibFileExt
   {
      this, text = $"Target extensions (a, so, exe)";//, hotKey = altH;
      position = { 168, 304 }, size = { 80, 22 };

      bool NotifyModified(EditBox editBox)
      {
         CompilerConfig compiler = loadedCompiler;
         if(compiler)
         {
            compiler.staticLibFileExt = editBox.contents;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };
   EditBox sharedLibFileExt
   {
      this;
      position = { 256, 304 }, size = { 80, 22 };

      bool NotifyModified(EditBox editBox)
      {
         CompilerConfig compiler = loadedCompiler;
         if(compiler)
         {
            compiler.sharedLibFileExt = editBox.contents;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };
   EditBox executableFileExt
   {
      this;
      position = { 344, 304 }, size = { 80, 22 };

      bool NotifyModified(EditBox editBox)
      {
         CompilerConfig compiler = loadedCompiler;
         if(compiler)
         {
            compiler.executableFileExt = editBox.contents;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   Button stripTarget
   {
      this, text = $"Strip target", hotKey = altC, position = { 168, 332 };
      isCheckbox = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         CompilerConfig compiler = loadedCompiler;
         if(compiler)
         {
            compiler.noStripTarget = !button.checked;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   Button resourcesDotEar
   {
      this, text = $"Use resources.ear", position = { 308, 332 };
      isCheckbox = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         CompilerConfig compiler = loadedCompiler;
         if(compiler)
         {
            compiler.resourcesDotEar = button.checked;
            modifiedDocument = true;
            compilersTab.modifiedDocument = true;
         }
         return true;
      }
   };

   CompilerOptionsTab()
   {
      Platform p;
      DataRow row;
      for(p = (Platform)1; p < Platform::enumSize; p++)
      {
         row = targetPlatform.AddRow();
         row.tag = p;
         row.string = p;
      }
   }

   void Load()
   {
      CompilerConfig compiler = loadedCompiler;
      if(compiler)
      {
         bool disabled = compiler.readOnly;
         targetPlatform.currentRow = targetPlatform.FindRow(compiler.targetPlatform);
         numJobs = compiler.numJobs;
         numJobsBox.Refresh();
         ccacheEnabled.checked = compiler.ccacheEnabled;
         distccEnabled.checked = compiler.distccEnabled;
         distccHostsLabel.disabled = distccHosts.disabled = !compiler.distccEnabled;
         distccHosts.contents = compiler.distccHosts;
         prepDefs.strings = compiler.prepDirectives;
         excludedLibraries.strings = compiler.excludeLibs;
         eCcompilerFlags.strings = compiler.eCcompilerFlags;
         compilerFlags.strings = compiler.compilerFlags;
         cxxFlags.strings = compiler.cxxFlags;
         linkerFlags.strings = compiler.linkerFlags;
         objectFileExt.contents = compiler.objectFileExt;
         staticLibFileExt.contents = compiler.staticLibFileExt;
         sharedLibFileExt.contents = compiler.sharedLibFileExt;
         executableFileExt.contents = compiler.executableFileExt;
         stripTarget.checked = !compiler.noStripTarget;
         resourcesDotEar.checked = compiler.resourcesDotEar;

         labelTargetPlatform.disabled = disabled;
         targetPlatform.disabled = disabled;

      }
      modifiedDocument = false;
   }
}

class CompilersSubTab : Tab
{
   property CompilersTab compilersTab
   {
      get
      {
         CompilersTab tab = (CompilersTab)master;
         while(tab && tab._class != class(CompilersTab))
            tab = (CompilersTab)tab.master;
         return tab;
      }
   };

   property CompilerConfig loadedCompiler
   {
      get
      {
         CompilersTab tab = compilersTab;
         return tab ? tab.activeCompiler : null;
      }
   };
}

class ProjectOptionsTab : GlobalSettingsSubTab
{
   background = formColor;
   text = $"Project";

   Label defaultTargetDirLabel { this, position = { 8, 34 }, labeledWindow = defaultTargetDir };
   PathBox defaultTargetDir
   {
      this, size = { 160, 21 }, position = { 8, 52 }, anchor = { left = 8, top = 52, right = 8 };
      text = $"Default Target Directory", hotKey = altT;

      bool NotifyModified(PathBox pathBox)
      {
         BasicValidatePathBoxPath(pathBox);
         modifiedDocument = true;
         return true;
      }
   };

   Label defaultIntermediateObjDirLabel { this, position = { 8, 78 }, labeledWindow = defaultIntermediateObjDir };
   PathBox defaultIntermediateObjDir
   {
      this, size = { 160, 21 }, position = { 8, 96 }, anchor = { left = 8, top = 96, right = 8 };
      text = $"Default Intermediate Objects Directory", hotKey = altI;

      bool NotifyModified(PathBox pathBox)
      {
         BasicValidatePathBoxPath(pathBox);
         modifiedDocument = true;
         return true;
      }
   };
}

// COMPILER TOFIX: if class GlobalSettingsSubTab is after class WorkspaceOptionsTab the OnPostCreate
//                 of WorkspaceOptionsTab will *not* be called!
class GlobalSettingsSubTab : Tab
{
   property GlobalSettingsDialog dialog
   {
      get
      {
         GlobalSettingsDialog dialog = (GlobalSettingsDialog)master;
         while(dialog && dialog._class != class(GlobalSettingsDialog))
            dialog = (GlobalSettingsDialog)dialog.master;
         return dialog;
      }
   };
}

class WorkspaceOptionsTab : GlobalSettingsSubTab
{
   background = formColor;
   text = $"Workspace";

   Label defaultCompilerLabel { this, position = { 8, 14 }, labeledWindow = defaultCompilerDropBox };
   DropBox defaultCompilerDropBox
   {
      this, position = { 140, 8 }, size = { 220 };
      text = $"Default Compiler", hotKey = altA;

      bool NotifySelect(DropBox dropBox, DataRow row, Modifiers mods)
      {
         modifiedDocument = true;
         return true;
      }
   };

   bool OnCreate()
   {
      GlobalSettingsDialog dialog = this.dialog;
      if(dialog && dialog.compilersTab.compilerConfigs && ideSettings)
      {
         DataRow row;
         for(compiler : ideConfig.compilers)
         {
            row = defaultCompilerDropBox.AddString(compiler.name);
            if(ideSettings.defaultCompiler && ideSettings.defaultCompiler[0] &&
                  !strcmp(compiler.name, ideSettings.defaultCompiler))
               defaultCompilerDropBox.currentRow = row;
         }
         if(!defaultCompilerDropBox.currentRow && defaultCompilerDropBox)
            defaultCompilerDropBox.currentRow = defaultCompilerDropBox.firstRow;
      }
      return true;
   }

   void OnDestroy()
   {
      // TOFIX: The selection will be lost upon changing tab...
      // Should either warn, or leave it modified and put in place
      // checks to save/find the compiler by name
      defaultCompilerDropBox.Clear();
      modifiedDocument = false;
   }
}

//static define app = ((GuiApplication)__thisModule);
