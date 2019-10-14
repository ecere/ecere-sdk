import "ide"
import "WorkspaceSettings"
import "ProjectTabSettings"
import "StringsBox"
// import "SelectorBar"

enum SettingsDialogTab { project, build, workspace };

static ProjectConfig config;
static Platform platform;
static ProjectNode currentNode;
static Project project;

static String MakeString(const char * s, int len, const char * switchToKeep, int lenSwitchToKeep)
{
   String string = new char[len+1];
   if(s[0] == '-' && switchToKeep && switchToKeep[0])
   {
      if(strstr(s+1, switchToKeep) == s+1)
      {
         memcpy(string, s+lenSwitchToKeep+1, len-lenSwitchToKeep-1);
         string[len-lenSwitchToKeep-1] = '\0';
      }
      else
         delete string;
   }
   else
   {
      memcpy(string, s, len);
      string[len] = '\0';
   }
   return string;
}

class StringListBox : EditBox
{
   const char * switchToKeep;
   int lenSwitchToKeep;

   textHorzScroll = true;

   property Array<String> strings
   {
      set
      {
         contents = "";
         if(value)
         {
            bool first = true;
            for(item : value)
            {
               if(item)
               {
                  if(!first)
                     AddS(" ");
                  AddS(item);
                  first = false;
               }
            }
         }
      }
      get
      {
         Array<String> array { };
         int c, start = 0;
         const char * contents = property::contents;
         char * s;
         char ch;
         bool quoted = false;

         for(c = 0; (ch = contents[c]); c++)
         {
            if(ch == ' ' && !quoted)
            {
               if(c - start)
               {
                  if((s = MakeString(contents + start, c - start, switchToKeep, lenSwitchToKeep)))
                     array.Add(s);
               }
               start = c + 1;
            }
            else if(ch == '\"')
            {
               if(quoted)
                  quoted = false;
               else
                  quoted = true;
            }
         }
         if(c - start)
         {
            if((s = MakeString(contents + start, c - start, switchToKeep, lenSwitchToKeep)))
               array.Add(s);
         }
         return array;
      }
   }
}

define dialogTitle = $"Project Settings";
static Color unfocusedSelectorColor { 70, 96, 166 };
class ProjectSettings : Window
{
   text = dialogTitle;
   background = formColor;
   borderStyle = sizable;
   minClientSize = { 650, 520 };
   hasClose = true;
   tabCycle = true;
   size = { 650, 520 };

   property Project project
   {
      set
      {
         ::project = value;
         projectTab.project = value;
         buildTab.Init();

         buildTab.SelectNode(project.topNode, false);

         if(project && project.topNode && project.topNode.name && project.topNode.name[0])
            UpdateDialogTitle();
      }
      get { return ::project; }
   };

   property ProjectNode projectNode
   {
      set { buildTab.SelectNode(value, false); }
      get { return currentNode; }
   }

   void UpdateDialogTitle()
   {
      //char * s = PrintString("Project Settings - ", project.topNode.fileName);
      //text = s;
      char * projectName = new char[strlen(project.topNode.name) + 1];
      const char * nodeName = currentNode && currentNode != project.topNode ? currentNode.name : "";
      const char * config = buildTab.selectedConfigName;
      const char * platform = buildTab.selectedPlatformName;
      char * label = new char[strlen(dialogTitle) + 3 + strlen(project.topNode.name) + 3 +
                              strlen(nodeName) + 2 + strlen(config) + 1 + strlen(platform) + 1 + 1];
      strcpy(label, dialogTitle);
      strcat(label, " - ");
      strcpy(projectName, project.topNode.name);
      StripExtension(projectName);
      strcat(label, projectName);
      if(currentNode && currentNode.type != project)
      {
         strcat(label, " - ");
         strcat(label, nodeName);
      }
      if(strlen(config) || strlen(platform))
      {
         strcat(label, " (");
         if(strlen(config))
            strcat(label, config);
         if(strlen(config) && strlen(platform))
            strcat(label, "/");
         if(strlen(platform))
            strcat(label, platform);
         strcat(label, ")");
      }
      text = label;
      delete projectName;
      delete label;
   }

   ~ProjectSettings()
   {
      currentNode = null;
   }

   TabControl prjTabControl
   {
      this, background = formColor, anchor = { left = 8, top = 4, right = 8, bottom = 38 };
   };
   ProjectTab projectTab { this, tabControl = prjTabControl };
   BuildTab buildTab { this, tabControl = prjTabControl };
   WorkspaceTab workspaceTab { this, tabControl = prjTabControl };

   Button cancel
   {
      this, size = { 80, 22 };
      anchor = { right = 8, bottom = 8 };
      text = $"Cancel", hotKey = escape, id = DialogResult::cancel;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(prjTabControl.curTab.modifiedDocument)
         {
            DialogResult diagRes = MessageBox
            {
               type = okCancel, master = ide,
               text = $"Lose Changes?",
               contents = $"Are you sure you wish to discard changes made to the build options?"
            }.Modal();
            if(diagRes == ok)
            {
               switch(tab)
               {
                  case project:
                     projectTab.modifiedDocument = false;
                     break;
                  case build:
                     buildTab.RevertChanges();
                     buildTab.modifiedDocument = false;
                     break;
                  case workspace:
                     workspaceTab.modifiedDocument = false;
                     break;
               }
               Destroy(DialogResult::cancel);
            }
         }
         else
            Destroy(DialogResult::cancel);
         return true;
      }
   };
   Button ok
   {
      this, size = { 80, 22 };
      anchor = { right = 96, bottom = 8 };
      text = $"OK", isDefault = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(prjTabControl.curTab == buildTab && buildTab.modifiedDocument)
         {
            buildTab.modifiedDocument = false;

            project.topNode.modified = true;
            project.MarkChanges(buildTab.backupNode);
            ide.projectView.modifiedDocument = true;
            ide.projectView.Update(null);
         }
         if(prjTabControl.curTab == workspaceTab && workspaceTab.modifiedDocument)
         {
            workspaceTab.SaveChanges();
            workspaceTab.modifiedDocument = false;
            ide.workspace.Save();
         }
         if(prjTabControl.curTab == projectTab && projectTab.modifiedDocument)
         {
            projectTab.SaveChanges();
            projectTab.modifiedDocument = false;
         }
         Destroy(DialogResult::ok);
         return true;
      }
   };

   bool OnPostCreate()
   {
      UpdateDialogTitle();
      prjTabControl.curTab = prjTabControl.curTab; // tofix: this is how we can ensure that a tab selected at instantiation is created

      ((DirectoriesBox)buildTab.compilerTab.includeDirs.editor).baseBrowsePath = project.topNode.path;
      ((DirectoriesBox)buildTab.linkerTab.libraryDirs.editor).baseBrowsePath = project.topNode.path;

      return true;
   }

   property SettingsDialogTab tab
   {
      set
      {
         switch(value)
         {
            case project:     projectTab.SelectTab();    break;
            case build:       buildTab.SelectTab();      break;
            case workspace:   workspaceTab.SelectTab();  break;
         }
      }
      get
      {
         if(prjTabControl.curTab == projectTab)    return project;
         if(prjTabControl.curTab == buildTab)      return build;
         if(prjTabControl.curTab == workspaceTab)  return workspace;
         return project; // unreachable
      }
   };
}

#define OPTION(x) ((uint)(uintptr)(&((ProjectOptions)0).x))

// TOFIX: USING T INSTEAD OF Z HERE CAUSED US SOME CONFLICTS WITH T IN Array TEMPLATES

// the BlendFileConfigPlatformProjectOptions function and the GenericOptionTools class
// contain code that is closely matched to the following code
// output changing modification should be mirrored in both implementations
class OptionBox<class Z> : CommonControl
{
   bool mergeValues, configReplaces;
   void * chainKeyDown;

   autoCreate = false;

   ~OptionBox()
   {
      delete editor;
   }
   property Window editor
   {
      set
      {
         editor = value;
         incref editor;
         editor.OnRightButtonDown = OptionBox_OnRightButtonDown;
         chainKeyDown = (void *)editor.OnKeyDown;
         editor.OnKeyDown = OptionBox_OnKeyDown;
      }
   }

   property bool visible { set { editor.visible = value; } get { return editor.visible; } }
   property Window parent { set { editor.parent = value; Window::parent = value; master = value; editor.id = (int64)(intptr)this; } }
   property Point position { set { editor.position = value; } }
   property Size size { set { editor.size = value; } }
   property Anchor anchor { set { editor.anchor = value; } }
   property Key hotKey { set { editor.hotKey = value; } }
   property const char * text { set { editor.caption = value; Window::caption = value; } }

   uint option;

   Window editor;
   Menu clearMenu { };
   MenuItem clearItem
   {
      clearMenu, $"Clear";

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         OptionBox ob = (OptionBox)(intptr)id;
         if(eClass_IsDerived(ob._class, class(CheckBoxForEnumOptionBox)))
         {
            Window slave;
            for(slave = ob.master.firstSlave; slave; slave = slave.nextSlave)
            {
               if(eClass_IsDerived(slave._class, class(CheckBoxForEnumOptionBox)) &&
                  ((OptionBox)slave).option == ob.option)
                     ((OptionBox)slave).Unset();
            }
         }
         else
            ob.Unset();
         return true;
      }
   };

   bool Window::OptionBox_OnRightButtonDown(int x, int y, Modifiers mods)
   {
      OptionBox ob = (OptionBox)(intptr)id;
      GuiApplication app = ((GuiApplication)__thisModule.application);
      Activate();
      PopupMenu { null, this, menu = ob.clearMenu,
         position = { absPosition.x + clientStart.x + x - app.desktop.position.x, absPosition.y + clientStart.y + y - app.desktop.position.y } }.Create();
      return true;
   }

   bool Window::OptionBox_OnKeyDown(Key key, unichar ch)
   {
      OptionBox ob = (OptionBox)(intptr)id;
      if(key == Key { del, ctrl = true } || key == Key { keyPadDelete, ctrl = true })
      {
         ob.Unset();
         return false;
      }
      return ob.chainKeyDown ? ((bool(*)(Window, Key, unichar)) ob.chainKeyDown)(this, key, ch) : true;
   }

   // code: 0 = not set anywhere, 1 = overridden here, 2 = inherited
   void SetAttribs(int code)
   {
      Window c;
      Label label = null;

      for(c = Window::parent.firstChild; c; c = c.next)
      {
         if(eClass_IsDerived(c._class, class(Label)))
         {
            label = (Label)c;
            if(label.labeledWindow == this)
               break;
         }
      }

      if(!c)
      {
         label = null;
         for(c = editor.firstChild; c; c = c.next)
         {
            if(eClass_IsDerived(c._class, class(Label)))
            {
               label = (Label)c;
               break;
            }
         }
      }
      // control.foreground = foreground;

      if(code == 0 || code == 1)
      {
         editor.font = { editor.font.faceName, editor.font.size, bold = (code == 1) };
         editor.background = white;
      }
      else if(code == 2)
      {
         Color foreground = 0x0F3F66;
         int r = foreground.r, g = foreground.g, b = foreground.b;
         Color src = white;
         double alpha = 0.1;

         editor.font = { editor.font.faceName, editor.font.size };

         r = (int)(alpha * r + src.r * (1 - alpha));
         g = (int)(alpha * g + src.g * (1 - alpha));
         b = (int)(alpha * b + src.b * (1 - alpha));

         r = Max(0,Min(255,r));
         g = Max(0,Min(255,g));
         b = Max(0,Min(255,b));

         editor.background = Color { (byte) r, (byte) g, (byte) b };

      }
      if(label)
      {
         label.font = { editor.font.faceName, editor.font.size, bold = (code == 1) };
         //label.foreground = foreground;
      }
   }

   virtual void FinalizeLoading();

   virtual void LoadOption(ProjectOptions options);
   virtual void RetrieveOption(ProjectOptions options, bool isCfgOrPlt);
   virtual void UnsetOption(ProjectOptions options)
   {
      Z value = (Z)0;
      *(Z*)((byte *)options + option) = value;
   }

   virtual bool OptionSet(ProjectOptions options)
   {
      // TOFIX: If you get a crash here, it might be because JSON.ec must be after ProjectConfig.ec in the project files
      //        JSON.ec must also be before ProjectSettings.ec in the project files
      if(*(Z*)((byte *)options + option))
         return true;
      return false;
   }
   // BUG: OptionCheck = OptionSet; // Overrides derived classes OptionCheck ?

   virtual bool OptionCheck(ProjectOptions options)
   {
      return OptionSet(options);
   }

   void MarkBuildTabModified()
   {
      BuildTab buildTab = (BuildTab)master;
      while(buildTab && buildTab._class != class(BuildTab))
         buildTab = (BuildTab)buildTab.master;
      if(buildTab) buildTab.modifiedDocument = true;
   }

   void Unset()
   {
      const char * platformName = platform ? platform.OnGetString(0,0,0) : null;
      MarkBuildTabModified();

      if(config)
      {
         ProjectConfig c = null;
         if(currentNode.configurations)
         {
            for(i : currentNode.configurations; !strcmpi(i.name, config.name)) { c = i; break; }
            if(c)
            {
               if(platform)
               {
                  PlatformOptions p = null;
                  if(c.platforms)
                  {
                     for(i : c.platforms; !strcmpi(i.name, platformName)) { p = i; break; }
                     if(p)
                     {
                        if(p.options && OptionSet(p.options))
                           UnsetOption(p.options);
                        if(p.options && p.options.isEmpty)
                           delete p.options;
                        if(!p.options)
                        {
                           Iterator<PlatformOptions> it { c.platforms };
                           if(it.Find(p))
                           {
                              it.Remove();
                              delete p;
                           }
                        }
                     }
                     if(!c.platforms.count)
                        c.platforms = null;
                  }
                  Load();
                  return;
               }
               if(c.options && OptionSet(c.options))
                  UnsetOption(c.options);
               if(c.options && c.options.isEmpty)
                  delete c.options;

               // DON'T DELETE PROJECT CONFIGS HERE!
               if(!c.options && currentNode != project.topNode)
               {
                  Iterator<ProjectConfig> it { currentNode.configurations };
                  if(it.Find(c))
                  {
                     it.Remove();
                     delete c;
                  }
               }
            }
            if(!currentNode.configurations.count)
               currentNode.configurations = null;
         }
         Load();
         return;
      }
      if(platform)
      {
         PlatformOptions p = null;
         if(currentNode.platforms)
         {
            for(i : currentNode.platforms; !strcmpi(i.name, platformName)) { p = i; break; }
            if(p)
            {
               if(p.options && OptionSet(p.options))
                  UnsetOption(p.options);
               if(p.options && p.options.isEmpty)
                  delete p.options;
               if(!p.options)
               {
                  Iterator<PlatformOptions> it { currentNode.platforms };
                  if(it.Find(p))
                  {
                     it.Remove(p);
                     delete p;
                  }
               }
            }
            if(!currentNode.platforms.count)
               currentNode.platforms = null;
         }
         Load();
         return;
      }

      if(currentNode.options && OptionSet(currentNode.options))
         UnsetOption(currentNode.options);
      if(currentNode.options && currentNode.options.isEmpty)
      {
         // delete currentNode.options;
         // Property will free:
         currentNode.options = null;
      }

      Load();
   }

   void FigureOutInherited()
   {
      ProjectNode node;
      const char * platformName = platform ? platform.OnGetString(0,0,0) : null;
      bool skipped = false;
      for(node = currentNode; node; node = node.parent)
      {
         bool configXplatformSet = false;
         if(config && node.configurations)
         {
            for(c : node.configurations; !strcmpi(c.name, config.name))
            {
               if(platform && c.platforms)
               {
                  for(p : c.platforms; !strcmpi(p.name, platformName))
                  {
                     if(p.options && OptionSet(p.options))
                     {
                        if(skipped)
                           LoadOption(p.options);
                     }
                     configXplatformSet = true;
                     skipped = true;
                     break;
                  }
               }

               if(skipped && c.options && OptionSet(c.options))
               {
                  LoadOption(c.options);
                  if(configReplaces) return;
               }
               skipped = true;
               break;
            }
         }
         if((!configXplatformSet || !configReplaces) && platform && node.platforms)
         {
            for(p : node.platforms; !strcmpi(p.name, platformName))
            {
               if(skipped && p.options && OptionSet(p.options))
                  LoadOption(p.options);
               skipped = true;
               break;
            }
         }
         if(skipped && node.options && OptionSet(node.options))
            LoadOption(node.options);
         else if(skipped && !node.parent)
            LoadOption(null);
         skipped = true;
      }
   }

   void Retrieve()
   {
      const char * platformName = platform ? platform.OnGetString(0,0,0) : null;
      MarkBuildTabModified();
      if(config)
      {
         ProjectConfig c = null;
         if(!currentNode.configurations) currentNode.configurations = { };
         for(i : currentNode.configurations; !strcmpi(i.name, config.name)) { c = i; break; }
         if(!c)
            currentNode.configurations.Add(c = ProjectConfig { name = CopyString(config.name) });
         if(platform)
         {
            PlatformOptions p = null;
            if(!c.platforms) c.platforms = { };

            for(i : c.platforms; !strcmpi(i.name, platformName)) { p = i; break; }
            if(!p)
               c.platforms.Add(p = PlatformOptions { CopyString(platformName) });

            if(!p.options) p.options = { };
            RetrieveOption(p.options, true);
            if(!mergeValues) SetAttribs(1);
            return;
         }
         if(!c.options) c.options = { };
         RetrieveOption(c.options, true);
         if(!mergeValues) SetAttribs(1);
         return;
      }
      if(platform)
      {
         PlatformOptions p = null;
         if(!currentNode.platforms) currentNode.platforms = { };
         for(i : currentNode.platforms; !strcmpi(i.name, platformName)) { p = i; break; }
         if(!p)
            currentNode.platforms.Add(p = PlatformOptions { CopyString(platformName) });

         if(!p.options) p.options = { };
         RetrieveOption(p.options, true);
         if(!mergeValues) SetAttribs(1);
         return;
      }

      if(!currentNode.options) currentNode.options = { };
      RetrieveOption(currentNode.options, false);
      if(!mergeValues) SetAttribs((currentNode.parent || OptionCheck(currentNode.options)) ? 1 : 0);
   }

   void Load()
   {
      ProjectNode node;
      const char * platformName = platform ? platform.OnGetString(0,0,0) : null;
      bool setAttribs = false;
      for(node = currentNode; node; node = node.parent)
      {
         bool configXplatformSet = false;
         ProjectConfig nodeConfig = null;
         if(config && node.configurations)
         {
            for(c : node.configurations; !strcmpi(c.name, config.name))
            {
               if(platform && c.platforms)
               {
                  for(p : c.platforms; !strcmpi(p.name, platformName))
                  {
                     if(p.options && (mergeValues ? OptionCheck(p.options) : OptionSet(p.options)))
                     {
                        LoadOption(p.options);
                        if(!setAttribs) { setAttribs = true; SetAttribs((node == currentNode) ? 1 : 2); }
                        if(!mergeValues) { FinalizeLoading(); return; }
                        configXplatformSet = true;
                     }
                     break;
                  }
               }

               nodeConfig = c;
               break;
            }
         }
         if(platform && node.platforms && (!configXplatformSet || !configReplaces))
         {
            for(p : node.platforms; !strcmpi(p.name, platformName))
            {
               if(p.options && (mergeValues ? OptionCheck(p.options) : OptionSet(p.options)))
               {
                  LoadOption(p.options);
                  if(!setAttribs) { setAttribs = true; SetAttribs((node == currentNode && !config) ? 1 : 2); }
                  if(!mergeValues) { FinalizeLoading(); return; }
               }
               break;
            }
         }

         if(nodeConfig && nodeConfig.options && ((mergeValues && !configReplaces) ? OptionCheck(nodeConfig.options) : OptionSet(nodeConfig.options)))
         {
            LoadOption(nodeConfig.options);
            if(!setAttribs) { setAttribs = true; SetAttribs((node == currentNode && !platform) ? 1 : 2); }
            if(!mergeValues || configReplaces) { FinalizeLoading(); return; }
         }

         if(node.options && (mergeValues ? OptionCheck(node.options) : OptionSet(node.options)))
         {
            LoadOption(node.options);
            if(!node.parent && !OptionCheck(node.options))
            {
               if(!setAttribs) { setAttribs = true; SetAttribs(0); }
            }
            else
            {
               if(!setAttribs) { setAttribs = true; SetAttribs((node == currentNode && !config && !platform) ? 1 : 2); }
            }
            if(!mergeValues) { FinalizeLoading(); return; }
         }
         else if(!node.parent)
         {
            LoadOption(null);
            if(!setAttribs) { setAttribs = true; SetAttribs(0); }
            if(!mergeValues) { FinalizeLoading(); return; }
         }
      }
      FinalizeLoading();
   }
}

class StringOptionBox : OptionBox<String>
{
   editor = EditBox
   {
      bool NotifyModified(EditBox editBox)
      {
         ((OptionBox)(intptr)editBox.id).Retrieve();
         return true;
      }

      textHorzScroll = true;
   };

   void RetrieveOption(ProjectOptions options, bool isCfgOrPlt)
   {
      String * string = (String*)((byte *)options + option);
      if(*string) delete *string;
      *string = CopyString(((EditBox)editor).contents);
   }

   void LoadOption(ProjectOptions options)
   {
      ((EditBox)editor).contents = options ? *(String*)((byte *)options + option) : "";
      ((EditBox)editor).Deselect();
   }

   bool OptionCheck(ProjectOptions options)
   {
      String string = *(String*)((byte *)options + option);
      return string && string[0];
   }

   void UnsetOption(ProjectOptions options)
   {
      delete *(String*)((byte *)options + option);
   }
}

class PathOptionBox : OptionBox<String>
{
   bool Window::EditBoxORB(int x, int y, Modifiers mods)
   {
      Window parent = this.parent;
      x += clientStart.x + position.x;
      y += clientStart.y + position.y;
      return ((OptionBox)this).OptionBox_OnRightButtonDown(parent, x, y, mods);
   }

   editor = PathBox
   {
      typeExpected = directory, browseDialog = { };
      editBox.OnRightButtonDown = (void *)EditBoxORB;

      bool NotifyModified(PathBox pathBox)
      {
         FixPathOnPathBoxNotifyModified(pathBox);
         ((OptionBox)(intptr)pathBox.id).Retrieve();
         return true;
      }
   };

   void RetrieveOption(ProjectOptions options, bool isCfgOrPlt)
   {
      String * string = (String*)((byte *)options + option);
      String slashPath = ((PathBox)editor).slashPath;
      if(*string) delete *string;
      *string = CopyString(slashPath);//(slashPath && slashPath[0]) ? CopyString(slashPath) : null;
   }

   void LoadOption(ProjectOptions options)
   {
      ((PathBox)editor).path = options ? *(String*)((byte *)options + option) : "";
      ((PathBox)editor).Deselect();
   }

   bool OptionCheck(ProjectOptions options)
   {
      String string = *(String*)((byte *)options + option);
      return string && string[0];
   }

   void UnsetOption(ProjectOptions options)
   {
      delete *(String*)((byte *)options + option);
   }
}

class MultiStringOptionBox : OptionBox<Array<String>>
{
   bool caseSensitive;

   mergeValues = true;
   caseSensitive = true;

   virtual Array<String> GetStrings();
   virtual void SetStrings(Array<String> value);

   Array<String> tempStrings;

   void RetrieveOption(ProjectOptions options, bool isCfgOrPlt)
   {
      Array<String> newStrings = GetStrings();
      Array<String> * strings = (Array<String>*)((byte *)options + option);
      if(*strings) { strings->Free(); delete *strings; }

      if(mergeValues)
      {
         Iterator<String> it { newStrings };

         FigureOutInherited();

         if(tempStrings)
         {
            while(it.Next())
            {
               String s = it.data;
               bool found = false;
               for(i : tempStrings; i && s && !(caseSensitive ? strcmp : strcmpi)(i, s)) { found = true; break; }
               if(found && (!configReplaces || platform))   // ADDED || platform here...
               {
                  delete s;
                  it.Remove();
               }
            }
         }
         delete tempStrings;
      }

      if(!mergeValues || (configReplaces && isCfgOrPlt && !platform))
         *strings = newStrings;
      else
      {
         *strings = (newStrings && newStrings.count) ? newStrings : null;
         if(newStrings && !newStrings.count) delete newStrings;
      }

      Load();
   }

   void LoadOption(ProjectOptions options)
   {
      if(mergeValues)
      {
         Array<String> strings = options ? *(Array<String>*)((byte *)options + option) : null;
         if(strings)
         {
            if(!tempStrings)
               tempStrings = { };
            for(s : strings)
            {
               bool found = false;
               for(i : tempStrings; i && s && !(caseSensitive ? strcmp : strcmpi)(i, s)) { found = true; break; }
               if(!found) tempStrings.Add(s);
            }
         }
      }
      else
      {
         SetStrings(options ? *(Array<String>*)((byte *)options + option) : null);
      }
   }

   void FinalizeLoading()
   {
      if(mergeValues)
      {
         SetStrings(tempStrings);
         delete tempStrings;
      }
   }

   bool OptionSet(ProjectOptions options)
   {
      Array<String> strings = *(Array<String>*)((byte *)options + option);
      if(mergeValues && !configReplaces)
      {
         return strings && strings.count;
      }
      else
         return strings != null;
   }

   bool OptionCheck(ProjectOptions options)
   {
      Array<String> strings = *(Array<String>*)((byte *)options + option);
      return strings && strings.count;
   }

   void UnsetOption(ProjectOptions options)
   {
      Array<String> * strings = (Array<String>*)((byte *)options + option);
      if(*strings) { strings->Free(); delete *strings; }
   }
}

class StringArrayOptionBox : MultiStringOptionBox
{
   editor = StringListBox
   {
      bool NotifyModified(EditBox editBox)
      {
         ((OptionBox)(intptr)editBox.id).Retrieve();
         return true;
      }
   };

   // NO VIRTUAL PROPERTIES YET...
   Array<String> GetStrings() { return ((StringListBox)editor).strings; }
   void SetStrings(Array<String> value) { ((StringListBox)editor).strings = value; }

   property const char * switchToKeep { set { ((StringListBox)editor).switchToKeep = value; ((StringListBox)editor).lenSwitchToKeep = strlen(value); } };
}

class StringsArrayOptionBox : MultiStringOptionBox
{
   editor = StringsBox
   {
      /*bool OnCreate()
      {
         project = ::project;
         return true;
      }*/

      bool NotifyModified(StringsBox stringsBox)
      {
         ((OptionBox)(intptr)stringsBox.id).Retrieve();
         return true;
      }
   };

   Array<String> GetStrings() { return ((StringsBox)editor).strings; }
   void SetStrings(Array<String> value) { ((StringsBox)editor).strings = value; }
}

bool eString_IsPathRelatedTo(char * path, char * to)
{
   if(path[0] && to[0])
   {
      char pathPart[MAX_FILENAME], pathRest[MAX_LOCATION] = "";
      char toPart[MAX_FILENAME], toRest[MAX_LOCATION] = "";
      SplitDirectory(path, pathPart, pathRest);
      SplitDirectory(to, toPart, toRest);
      if(!fstrcmp(pathPart, toPart))
      {
         if(pathRest[0] && toRest[0])
         {
            SplitDirectory(pathRest, pathPart, pathRest);
            SplitDirectory(toRest, toPart, toRest);
            if(!fstrcmp(pathPart, toPart))
               return true;
         }
      }
   }
   return false;
}

static void FixPathOnPathBoxNotifyModified(PathBox pathBox)
{
   int len;
   char path[MAX_LOCATION];
   ValidPathBufCopy(path, pathBox.path);
   len = strlen(path);
   if(len && !(path[0] == '.' && (len == 1 || (len == 2 && path[1] == DIR_SEP) || (len > 1 && path[1] == '.'))))
   {
      char cwdBackup[MAX_LOCATION];
      if(project)
      {
         GetWorkingDir(cwdBackup, sizeof(cwdBackup));
         ChangeWorkingDir(project.topNode.path);
      }
      FileFixCase(path);
      if(project)
         ChangeWorkingDir(cwdBackup);
      if(eString_IsPathRelatedTo(path, project.topNode.path))
         MakePathRelative(path, project.topNode.path, path);
      if(!path[0])
         strcpy(path, ".");
      len = strlen(path);
   }
   if(len>1 && path[len-1] == DIR_SEP)
      path[--len] = '\0';
   pathBox.path = path;
}

class DirsArrayOptionBox : MultiStringOptionBox
{
public:
   property const char * switchToKeep { set { switchToKeep = value; lenSwitchToKeep = strlen(value); } };
private:
   const char * switchToKeep;
   int lenSwitchToKeep;

   editor = DirectoriesBox
   {
      browseDialog = { };
      bool NotifyModified(DirectoriesBox dirsBox)
      {
         const char * switchToKeep = ((DirsArrayOptionBox)(intptr)dirsBox.id).switchToKeep;
         if(switchToKeep && switchToKeep[0])
         {
            bool change = false;
            int lenSwitchToKeep = ((DirsArrayOptionBox)(intptr)dirsBox.id).lenSwitchToKeep;
            Array<String> dirs { };
            Array<String> previousDirs = dirsBox.strings;
            for(d : previousDirs)
            {
               int c;
               char * buffer = new char[strlen(d)+64];
               char * tokens[1024];
               uint count;
               strcpy(buffer, d);
               count = Tokenize(buffer, sizeof(tokens)/sizeof(tokens[0]), tokens, (BackSlashEscaping)false);
               for(c=0; c<count; c++)
               {
                  if(tokens[c][0] == '-')
                  {
                     if(strstr(tokens[c]+1, switchToKeep) == tokens[c]+1)
                        tokens[c] += lenSwitchToKeep+1;
                     else
                        tokens[c][0] = '\0';
                     change = true;
                  }
                  dirs.Add(CopyString(tokens[c]));
               }
               delete buffer;
            }
            if(change)
               dirsBox.strings = dirs;
            dirs.Free();
            delete dirs;
            previousDirs.Free();
            delete previousDirs;
         }
         ((OptionBox)(intptr)dirsBox.id).Retrieve();
         return true;
      }

      bool NotifyPathBoxModified(DirectoriesBox dirsBox, PathBox pathBox)
      {
         FixPathOnPathBoxNotifyModified(pathBox);
         return true;
      }
   };

   Array<String> GetStrings() { return ((DirectoriesBox)editor).strings; }
   void SetStrings(Array<String> value) { ((DirectoriesBox)editor).strings = value; }
}

class BoolOptionBox : OptionBox<SetBool>
{
   editor = Button
   {
      isCheckbox = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ((OptionBox)(intptr)button.id).Retrieve();
         return true;
      }
   };

   bool OptionCheck(ProjectOptions options)
   {
      return *(SetBool*)((byte *)options + option) == true;
   }

   void RetrieveOption(ProjectOptions options, bool isCfgOrPlt)
   {
      bool checked = ((Button)editor).checked;
      *(SetBool*)((byte *)options + option) = checked ? true :
         ((currentNode.parent || isCfgOrPlt) ? false : unset);
   }

   void LoadOption(ProjectOptions options)
   {
      ((Button)editor).checked = options && (*(SetBool*)((byte *)options + option) == true);
   }
}

class CheckBoxForEnumOptionBox : OptionBox
{
   editor = Button
   {
      isCheckbox = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ((OptionBox)(intptr)button.id).Retrieve();
         {
            Window slave;
            for(slave = master.firstSlave; slave; slave = slave.nextSlave)
            {
               if(eClass_IsDerived(slave._class, class(CheckBoxForEnumOptionBox)) &&
                     slave != (Window)(intptr)button.id &&
                     ((OptionBox)slave).option == ((OptionBox)(intptr)button.id).option)
                  ((OptionBox)slave).Load();
            }
         }
         return true;
      }
   };

   Z enumValue;
   void LoadOption(ProjectOptions options)
   {
      Z value = options ? *(Z*)((byte *)options + option) : (Z)0;
      ((Button)editor).checked = value == enumValue;
   }

   void RetrieveOption(ProjectOptions options, bool isCfgOrPlt)
   {
      Button checkBox = (Button)editor;
      if(checkBox.checked)
         *(Z*)((byte *)options + option) = enumValue;
   }
}

class BuildBitDepthOptionBox : CheckBoxForEnumOptionBox<BuildBitDepth> { }

class DropOptionBox : OptionBox
{
   editor = DropBox
   {
      bool NotifySelect(DropBox dropBox, DataRow row, Modifiers mods)
      {
         ((OptionBox)(intptr)dropBox.id).Retrieve();
         return true;
      }
   };

   void LoadOption(ProjectOptions options)
   {
      DropBox dropBox = (DropBox)editor;
      Z value = options ? *(Z*)((byte *)options + option) : (Z)0;
      dropBox.currentRow = value ? dropBox.FindRow((int64)value) : dropBox.firstRow;
   }

   void RetrieveOption(ProjectOptions options, bool isCfgOrPlt)
   {
      DropBox dropBox = (DropBox)editor;
      DataRow row = dropBox.currentRow;
      Z value = (Z)(row ? row.tag : 0);
      *(Z*)((byte *)options + option) = value;
   }
}

class TargetTypeDB : DropOptionBox<TargetTypes>
{
   TargetTypeDB()
   {
      DataRow row;

      row = ((DropBox)editor).AddRow();
      row.tag = TargetTypes::executable;
      row.SetData(null, $"Executable");

      row = ((DropBox)editor).AddRow();
      row.tag = TargetTypes::sharedLibrary;
      row.SetData(null, $"Shared Library");

      row = ((DropBox)editor).AddRow();
      row.tag = TargetTypes::staticLibrary;
      row.SetData(null, $"Static Library");
   }

   bool OptionCheck(ProjectOptions options)
   {
      TargetTypes value = *(TargetTypes*)((byte *)options + option);
      return value && value != executable;
   }
}

class OptimizationDB : DropOptionBox<OptimizationStrategy>
{
   OptimizationDB()
   {
      DataRow row;
      row = ((DropBox)editor).AddRow();
      row.tag = OptimizationStrategy::none;
      row.SetData(null, $"None");

      row = ((DropBox)editor).AddRow();
      row.tag = OptimizationStrategy::speed;
      row.SetData(null, $"For Speed (-O2)");

      row = ((DropBox)editor).AddRow();
      row.tag = OptimizationStrategy::size;
      row.SetData(null, $"For Size (-Os)");
   }

   bool OptionCheck(ProjectOptions options)
   {
      OptimizationStrategy value = *(OptimizationStrategy*)((byte *)options + option);
      return value && value != none;
   }
}

class WarningsDB : DropOptionBox<WarningsOption>
{
   WarningsDB()
   {
      DataRow row;
      row = ((DropBox)editor).AddRow();
      row.tag = WarningsOption::normal;
      row.SetData(null, $"Normal");

      row = ((DropBox)editor).AddRow();
      row.tag = WarningsOption::none;
      row.SetData(null, $"None");

      row = ((DropBox)editor).AddRow();
      row.tag = WarningsOption::all;
      row.SetData(null, $"All");
   }

   bool OptionCheck(ProjectOptions options)
   {
      WarningsOption value = *(WarningsOption*)((byte *)options + option);
      return value && value != none;
   }
}

void DrawStipple(Surface surface, Size clientSize)
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

class BuildTab : Tab
{
   text = $"Build";
   background = formColor;
   tabCycle = true;

   ProjectNode backupNode;
   String activeConfigName;

   ProjectNode lastSelectedNode;

   property const char * selectedConfigName
   {
      get
      {
         if(created)
         {
            SelectorButton button = (SelectorButton)configSelector.selectedButton;
            if(button && button.id)
            {
               ProjectConfig config = (ProjectConfig)(intptr)button.id;
               return config.name;
            }
         }
         return "";
      }
   }

   property const char * selectedPlatformName
   {
      get
      {
         if(created)
         {
            SelectorButton button = (SelectorButton)platformSelector.selectedButton;
            if(button && button.id)
            {
               Platform platform = (Platform)button.id;
               const char * platformName = platform ? platform.OnGetString(0,0,0) : null; // all these platformName are leaking, no?
               return platformName;
            }
         }
         return "";
      }
   }

   Label labelConfigurations
   {
      this, anchor = { left = 8, top = 14 }, labeledWindow = configSelector;

      void OnRedraw(Surface surface)
      {
         Label::OnRedraw(surface);
         if(labeledWindow.active) DrawStipple(surface, clientSize);
      }
   };
   SelectorBar configSelector
   {
      this, text = $"Configurations: ", anchor = { left = 90, top = 8, right = 54 }; size = { 0, 26 };
      opacity = 0;
      direction = horizontal;
      scrollable = true;
      endButtons = false;
      hoverScroll = true;

      bool OnKeyDown(Key key, unichar ch)
      {
         if(key == insert)
         {
            ((BuildTab)parent).createConfig.NotifyClicked(parent, ((BuildTab)parent).createConfig, 0, 0, 0);
            return false;
         }
         else if(key == del)
         {
            ((BuildTab)parent).deleteConfig.NotifyClicked(parent, ((BuildTab)parent).deleteConfig, 0, 0, 0);
            return false;
         }
         return SelectorBar::OnKeyDown(key, ch);
      }

      bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
      {
         ((BuildTab)master).labelConfigurations.Update(null);
         return true;
      }
   };

   Button createConfig
   {
      parent = this, bevelOver = true, inactive = true;
      size = { 22, 22 };
      anchor = { top = 10, right = 31 };
      hotKey = altC, bitmap = BitmapResource { fileName = ":actions/docNew.png", alphaBlend = true };

      bool NotifyClicked(Button b, int x, int y, Modifiers mods)
      {
         char tmp[MAX_F_STRING];
         ProjectConfig config;
         EditableSelectorButton button;

         FindUniqueConfigName("NewConfig", false, tmp);

         config =
         {
            makingModified = true;
            compilingModified = true;
            linkingModified = true;
            name = CopyString(tmp);
            options =
            {
               // objectsDirectory = /*CopyString(*/defaultObjDirExpression/*)*/;
            };
         };
         if(!project.topNode.configurations) project.topNode.configurations = { };
         project.topNode.configurations.Add(config);
         /*
         targetType = project.config.options.targetType;
         config.options.
         config.options.targetFileName = project.moduleName;
         config.options.targetDir.dir = "";
         config.options.objectsDirectory = defaultObjDirExpression);
         config.options.debug = true;
         config.options.optimization = none;
         config.options.warnings = all;
         */

         button =
         {
            configSelector, renameable = true, master = this, text = config.name, id = (int64)(intptr)config;
            NotifyClicked = ConfigClicked, OnRename = ConfigOnRename;
         };

         configSelector.Select(button);
         modifiedDocument = true;
         return true;
      }
   };
   /*Button duplicateConfig
   {
      parent = this, bevelOver = true, inactive = true;
      size = { 22, 22 };
      anchor = { top = 10, right = 31 };
      hotKey = altU, bitmap = BitmapResource { fileName = ":actions/editCopy.png", alphaBlend = true };
   };*/
   Button deleteConfig
   {
      parent = this, bevelOver = true, inactive = true;
      size = { 22, 22 };
      anchor = { top = 10, right = 8 };
      hotKey = altD, bitmap = BitmapResource { fileName = ":actions/delete2.png", alphaBlend = true };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(config)
         {
            String title = PrintString($"Delete ", config.name, $" Configuration");
            String msg = PrintString($"Are you sure you wish to delete the ", config.name, $" configuration?");
            if(MessageBox { type = okCancel, text = title, contents = msg }.Modal() == ok)
            {
               //Iterator<Window> it { configSelector.controls };
               ProjectConfig configToDelete = config;
               /*
               while(it.Next())
               {
                  SelectorButton button = (SelectorButton)it.data;
                  if((ProjectConfig)button.id == config)
                  {
                     button.visible = false;
                     button.Destroy(0);

                     if(it.Prev())
                     {
                        button = (SelectorButton)it.data;
                        config = (ProjectConfig)button.id;
                        configSelector.Select(button);
                     }
                     break;
                  }
               }
               */
               SelectorButton button = configSelector.FindButtonByID((int64)(intptr)configToDelete);
               if(button)
                  configSelector.RemoveButton(button);

               project.topNode.DeleteConfig(configToDelete);

               modifiedDocument = true;
            }
            delete title;
            delete msg;
         }
         return true;
      }
   };

   Label labelPlatforms
   {
      this, anchor = { left = 8, top = 44 }, labeledWindow = platformSelector;

      void OnRedraw(Surface surface)
      {
         Label::OnRedraw(surface);
         if(labeledWindow.active) DrawStipple(surface, clientSize);
      }
   };
   SelectorBar platformSelector
   {
      this, text = $"Platforms: ", anchor = { left = 64, top = 38, right = 54 }; size = { 0, 26 };
      opacity = 0;
      direction = horizontal;
      scrollable = true;
      endButtons = false;
      hoverScroll = true;

      bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
      {
         ((BuildTab)master).labelPlatforms.Update(null);
         return true;
      }
   };

   TabControl buildTabControl
   {
      this, background = formColor, anchor = { left = 8, top = 64, right = 8, bottom = 8 };
      curTab = compilerTab;
   };
   CompilerTab compilerTab { this, tabControl = buildTabControl };
   LinkerTab linkerTab { this, tabControl = buildTabControl };
   BuilderTab builderTab { this, tabControl = buildTabControl };
   Label rightClick
   {
      this, font = { font.faceName, font.size, italic = true }, stayOnTop = true,
      text = $"(Right click or press Ctrl-Del to revert an option to inherited value)", anchor = { top = 72, right = 16 }
   };

   void FindUniqueConfigName(const char * baseName, bool startWithNumber, char * output)
   {
      int num = 0;
      char tmp[MAX_F_STRING];
      if(startWithNumber)
         sprintf(tmp, "%s%d", baseName, num);
      else
         strcpy(tmp, baseName);
      while(true)
      {
         ProjectConfig config = null;
         for(c : project.topNode.configurations)
         {     // TOFIX: Error when omitting these brackets, c not found
            if(c.name && !strcmp(c.name, tmp))
            {
               config = c;
               break;
            }
         }
         if(config)
         {
            num++;
            sprintf(tmp, "%s%d", baseName, num);
         }
         else
            break;
      }
      strcpy(output, tmp);
   }

   bool PlatformClicked(Button clickedButton, int x, int y, Modifiers mods)
   {
      if(!eClass_IsDerived(clickedButton._class, class(EditableSelectorButton)) || !((EditableSelectorButton)clickedButton).editBox)
      {
         platform = (Platform)clickedButton.id;

         // Load Settings Into Dialog
         compilerTab.LoadSettings();
         linkerTab.LoadSettings();
         builderTab.LoadSettings();

         if(!mods)
            buildTabControl.Activate();

         if(compilerTab.rightPaneHeader.visible)
            compilerTab.rightPaneHeader.Update(null);
         ((ProjectSettings)master).UpdateDialogTitle();
      }
      return true;
   }

   ~BuildTab()
   {
      platformSelector.DestroyChildren();
      configSelector.DestroyChildren();

      delete activeConfigName;
   }

   bool ConfigOnRename(EditableSelectorButton button, char * * oldName, char * * newName)
   {
      int c, d = 0;
      char ch;

      for(c = 0; (ch = (*newName)[c]); c++)
      {
         if(ch == '_' || isalpha(ch) || (isdigit(ch) && d))
            (*newName)[d++] = ch;
      }
      (*newName)[d] = 0;

      {
         bool found = false;
         for(c : project.topNode.configurations; c != config)
         {
            if(!strcmpi(c.name, *newName))
            {
               found = true;
               break;
            }
         }
         if(found || !(*newName)[0])
         {
            char tmp[MAX_F_STRING];
            char * tmpName = config.name;
            config.name = null;
            FindUniqueConfigName("NewConfig", false, tmp);
            config.name = tmpName;
            delete *newName;
            *newName = CopyString(tmp);
         }
      }

      if(activeConfigName && !strcmp(activeConfigName, *oldName))
      {
         delete activeConfigName;
         activeConfigName = CopyString(*newName);
      }

      project.topNode.RenameConfig(config.name, *newName);

      modifiedDocument = true;
      Update(null);
      return true;
   }

   bool ConfigClicked(Button clickedButton, int x, int y, Modifiers mods)
   {
      if(!eClass_IsDerived(clickedButton._class, class(EditableSelectorButton)) || !((EditableSelectorButton)clickedButton).editBox)
      {
         config = (ProjectConfig)(intptr)clickedButton.id;

         // Load Settings Into Dialog
         compilerTab.LoadSettings();
         linkerTab.LoadSettings();
         builderTab.LoadSettings();

         deleteConfig.disabled = (clickedButton._class == class(SelectorButton));

         if(!mods)
            buildTabControl.Activate();

         compilerTab.fileList.Update(null);
         if(compilerTab.rightPaneHeader.visible)
            compilerTab.rightPaneHeader.Update(null);
         ((ProjectSettings)master).UpdateDialogTitle();
      }
      return true;
   }

   void SelectNode(ProjectNode node, bool ignoreAsLastSelection)
   {
      if(node != currentNode)
      {
         Window ac = compilerTab.rightPane.activeChild;
         bool prevNodeRes = currentNode ? currentNode.isInResources : false;
         bool newNodeRes;

         if(!node) node = project.topNode;

         newNodeRes = node.isInResources;

         currentNode = node;
         if(!ignoreAsLastSelection)
            lastSelectedNode = node;

         ((ProjectSettings)master).UpdateDialogTitle();
         if(node.type == project)
         {
            compilerTab.rightPaneHeader.visible = false;
         }
         else
         {
            compilerTab.rightPaneHeader.id = (int64)(intptr)node;
            compilerTab.rightPaneHeader.Update(null);
            compilerTab.rightPaneHeader.visible = true;
         }

         {
            DataRow row = compilerTab.fileList.FindSubRow((int64)(intptr)currentNode);
            if(row)
            {
               compilerTab.fileList.currentRow = row;
               while((row = row.parent))
                  row.collapsed = false;
            }
         }

         if(prevNodeRes != newNodeRes)
         {
            compilerTab.labelObjDir.visible = !newNodeRes;
            compilerTab.objDir.visible = !newNodeRes;
            compilerTab.excludeFromBuild.visible = !newNodeRes;
            compilerTab.alwaysBuild.visible = !newNodeRes;
            compilerTab.labelPreprocessorDefs.visible = !newNodeRes;
            compilerTab.preprocessorDefs.visible = !newNodeRes;
            compilerTab.labelDefaultNameSpace.visible = !newNodeRes;
            compilerTab.defaultNameSpace.visible = !newNodeRes;
            compilerTab.strictNameSpaces.visible = !newNodeRes;
            compilerTab.memoryGuard.visible = !newNodeRes;
            compilerTab.noLineNumbers.visible = !newNodeRes;
            compilerTab.debug.visible = !newNodeRes;
            compilerTab.labelWarnings.visible = !newNodeRes;
            compilerTab.warnings.visible = !newNodeRes;
            compilerTab.profiling.visible = !newNodeRes;
            compilerTab.labelOptimization.visible = !newNodeRes;
            compilerTab.optimization.visible = !newNodeRes;
            compilerTab.fastMath.visible = !newNodeRes;
            compilerTab.labelIncludeDirs.visible = !newNodeRes;
            compilerTab.includeDirs.visible = !newNodeRes;
         }

         if(node == project.topNode)
         {
            compilerTab.objDir.visible = true;
            compilerTab.labelObjDir.visible = true;

            compilerTab.excludeFromBuild.visible = false;
            compilerTab.alwaysBuild.visible = false;
         }
         else
         {
            compilerTab.objDir.visible = false;
            compilerTab.labelObjDir.visible = false;

            compilerTab.excludeFromBuild.visible = (node != project.resNode);
            compilerTab.alwaysBuild.visible = (node != project.resNode);
         }

         // Load Settings Into Dialog
         compilerTab.LoadSettings();
         linkerTab.LoadSettings();
         builderTab.LoadSettings();

         if(ac)
         {
            if(!ac.visible)
            {
               if(ac == compilerTab.excludeFromBuild.editor)
                  ac = compilerTab.objDir.editor;
               else if(compilerTab.excludeFromBuild.editor.visible)
                  ac = compilerTab.excludeFromBuild.editor;
            }
            ac.MakeActive();
         }
      }
   }

   void CreateConfigButtons()
   {
      // Create Config Buttons
      SelectorButton
      {
         configSelector, master = this, text = $"Common", id = 0; font = { font.faceName, font.size, true };
         checked = true;
         NotifyClicked = ConfigClicked;
      };

      config = null;

      if(project.topNode.configurations)
      {
         for(c : project.topNode.configurations)
         {
            EditableSelectorButton button
            {
               configSelector, master = this, renameable = true, text = c.name, id = (int64)(intptr)c;
               NotifyClicked = ConfigClicked, OnRename = ConfigOnRename;
            };
         }
      }
   }

   void Init()
   {
      Platform p;
      SelectorButton button;

      activeConfigName = project.config ? CopyString(project.config.name) : null;

      compilerTab.AddNode(project.topNode, null);

      CreateConfigButtons();

      platformButton = button =
      {
         platformSelector, master = this, text = $"Common", id = 0;  font = { font.faceName, font.size, true };
         NotifyClicked = PlatformClicked; checked = true;
      };

      platform = 0;

      for(p = (Platform)1; p < Platform::enumSize; p++)
      {
         SelectorButton button
         {
            platformSelector, master = this, text = p.OnGetString(0,0,0), id = (int64)p;
            NotifyClicked = PlatformClicked;
         };
      }
   }
   SelectorButton platformButton;

   bool OnPostCreate()
   {
      // Backup Current Settings
      backupNode = project.topNode.Backup();

      buildTabControl.Activate();

      {
         Iterator<Window> it { configSelector.controls };
         while(it.Next())
         {
            SelectorButton configButton = (SelectorButton)it.data;
            ProjectConfig buttonConfig = (ProjectConfig)(intptr)configButton.id;
            if(buttonConfig == project.config)
            {
               configButton.Activate();
               configButton.checked = true;
               ConfigClicked(configButton, 0, 0, 0);
               break;
            }
         }
      }
      if(platformButton)
      {
         platformButton.MakeActive();
         platformButton = null;
      }
      return true;
   }

   void OnDestroy()
   {
      delete backupNode;

      lastSelectedNode = null;

      project.config = null;

      /* // THIS IS NOW AUTOMATED WITH A project CHECK IN ProjectNode
      project.configurations = project.topNode.configurations;
      project.platforms = project.topNode.platforms;
      project.options = project.topNode.options;
      */

      if(project.topNode.configurations)
      {
         for(c : project.topNode.configurations)
         {
            if(!strcmpi(c.name, activeConfigName))
            {
               project.config = c;
               break;
            }
         }
      }
      if(!project.config)
      {
         List<ProjectConfig> configs = project.topNode.configurations;
         if(configs && configs.count)
            project.config = configs[0];
      }

      ide.UpdateToolBarActiveConfigs(false);
   }

   void RevertChanges()
   {
      String configName = config ? CopyString(config.name) : null;

      // Revert to saved project options
      project.topNode.Revert(backupNode);

      configSelector.DestroyChildren();
      CreateConfigButtons();

      // Reselect Configuration
      if(configName)
      {
         Iterator<Window> it { configSelector.controls };
         while(it.Next())
         {
            Button button = (Button)it.data;
            ProjectConfig c = (ProjectConfig)(intptr)button.id;
            if(c && !strcmp(c.name, configName))
            {
               config = c;
               button.Activate();
               button.checked = true;
               ConfigClicked(button, 0,0, 0);
               break;
            }
         }
      }

      SelectNode(project.topNode, false);

      delete configName;
   }

   bool OnClose(bool parentClosing)
   {
      if(modifiedDocument)
      {
         DialogResult diagRes = MessageBox
         {
            type = yesNoCancel, master = ide,
            text = $"Save changes to project settings?",
            contents = $"Would you like to save changes made to the build options?"
         }.Modal();
         if(diagRes == no)
            RevertChanges();
         if(diagRes == cancel)
            return false;
         if(diagRes == yes)
         {
            project.MarkChanges(backupNode);
            project.topNode.modified = true;
            ide.projectView.modifiedDocument = true;
            ide.UpdateToolBarActiveConfigs(false);
            ide.projectView.Update(null);
         }
         modifiedDocument = false;
      }
      return true;
   }
}

class CompilerTab : Tab
{
   background = formColor;
   text = $"Compiler";

   Window leftPane { this, size = { 180 }, anchor = { left = 0, top = 0, bottom = 0 }, background = formColor };

   Label labelFileList { leftPane, this, position = { 8, 8 }, labeledWindow = fileList };
   ListBox fileList
   {
      leftPane, this, borderStyle = deep, hasVertScroll = true, hasHorzScroll = true;
      // THIS WOULD BE EVEN MORE FUN: multiSelect = true,
      fullRowSelect = false, collapseControl = true, treeBranches = true;
      alwaysHighLight = true;
      selectionColor = unfocusedSelectorColor;
      size = { 180 };
      anchor = Anchor { left = 8, top = 24, right = 4, bottom = 8 };
      text = $"Files";

      bool NotifySelect(ListBox listBox, DataRow row, Modifiers mods)
      {
         BuildTab buildTab = (BuildTab)master;
         ProjectNode node = (ProjectNode)(intptr)row.tag;
         buildTab.SelectNode(node, false);
         return true;
      }

      void OnRedraw(Surface surface)
      {
         ide.projectView.drawingInProjectSettingsDialog = true;
         ListBox::OnRedraw(surface);
         ide.projectView.drawingInProjectSettingsDialog = false;
      }

      bool NotifyActivate(Window window, bool active, Window previous)
      {
         if(active)
         {
            //subclass(Skin) skinClass = (subclass(Skin))eSystem_FindClass(app, app.skin);
            fileList.selectionColor = Color { 10, 36, 106 }; //skinClass.selectionColor; // darkBlue;
         }
         else if(fileList.currentRow)
         {
            DataRow currentRow = fileList.currentRow;
            //int headerSize = ((fileList.style.header) ? fileList.rowHeight : 0);
            int height = fileList.clientSize.h + 1;// - fileList.headerSize;
            fileList.selectionColor = unfocusedSelectorColor;
            if(currentRow && currentRow.index * fileList.rowHeight > fileList.scroll.y + height - fileList.rowHeight)
               fileList.SetScrollPosition(fileList.scroll.x, currentRow.index * fileList.rowHeight - height + fileList.rowHeight);
            else if(!currentRow || currentRow.index * fileList.rowHeight < fileList.scroll.y)
               fileList.SetScrollPosition(fileList.scroll.x, currentRow ? currentRow.index * fileList.rowHeight : 0);

         }

         return true;
      }
   };

   Window rightPane
   {
      this, anchor = { left = 196, top = 0, right = 0, bottom = 0 }, background = formColor, tabCycle = true;
   };

   Window rightPaneHeader
   {
      rightPane, this, size = { h = 21 }, anchor = { left = 0, top = 0, right = 0 }, background = Color { 70, 96, 166 };//0x0F3F66;
      foreground = white; visible = false;

      void OnRedraw(Surface surface)
      {
         if(id)
         {
            void (* onDisplay)(void *, void *, void *, int, int, int, void *, uint, uint) = (void *)class(ProjectNode)._vTbl[__ecereVMethodID_class_OnDisplay];

            ide.projectView.drawingInProjectSettingsDialogHeader = true;
            if(onDisplay)
               onDisplay(class(ProjectNode), (void *)(intptr)id, surface, 8, 2, clientSize.w, ide.projectView, Alignment::left, DataDisplayFlags { selected = true });
            ide.projectView.drawingInProjectSettingsDialogHeader = false;
         }
      }
   };

   PaneSplitter splitter
   {
      this, leftPane = leftPane, rightPane = rightPane, split = 188
   };

   Label labelObjDir { rightPane, this, position = { 8, 8 }, labeledWindow = objDir };
   PathOptionBox objDir
   {
      rightPane, this, size = { 250, 22 }, anchor = { left = 8, top = 24, right = 8 };
      text = $"Intermediate Objects Directory", hotKey = altJ, option = OPTION(objectsDirectory);
   };

   BoolOptionBox excludeFromBuild
   {
      rightPane, this, position = { 8, 28 },
      text = $"Exclude from Build", visible = false, option = OPTION(excludeFromBuild);
   };

   BoolOptionBox alwaysBuild
   {
      rightPane, this, position = { 8, 28 }, anchor = { top = 28, right = 8 },//anchor.right = 8,
      text = $"Always Build", visible = false, option = OPTION(alwaysBuild);
   };

   Label labelPreprocessorDefs { rightPane, this, position = { 8, 50 }, labeledWindow = preprocessorDefs };
   StringArrayOptionBox preprocessorDefs
   {
      rightPane, this, size = { 290, 22 }, anchor = { left = 8, top = 66, right = 8 };
      text = $"Preprocessor Definitions", hotKey = altD, option = OPTION(preprocessorDefinitions);
   };

   Label labelDefaultNameSpace { rightPane, this, position = { 8, 92 }, labeledWindow = defaultNameSpace };
   StringOptionBox defaultNameSpace
   {
      rightPane, this, size = { 160, 22 }, position = { 8, 108 };
      text = $"Default Name Space", option = OPTION(defaultNameSpace);
   };
   BoolOptionBox strictNameSpaces
   {
      rightPane, this, position = { 172, 112 },
      text = $"Strict Name Spaces", option = OPTION(strictNameSpaces);
   };

   BoolOptionBox fastMath
   {
      rightPane, this, position = { 316, 112 },
      text = $"Fast Math", option = OPTION(fastMath);
   };

   BoolOptionBox memoryGuard
   {
      rightPane, this, position = { 8, 154 };
      text = $"MemoryGuard", hotKey = altM, option = OPTION(memoryGuard);
   };

   Label labelWarnings { rightPane, position = { 116, 138 }, labeledWindow = warnings };
   WarningsDB warnings
   {
      rightPane, this, position = { 116, 154 };
      text = $"Warnings", hotKey = altW, option = OPTION(warnings);
   };

   Label labelOptimization { rightPane, position = { 220, 138 }, labeledWindow = optimization };
   OptimizationDB optimization
   {
      rightPane, this, position = { 220, 154 }, size = { 120, 22 };
      text = $"Optimization", hotKey = altO, option = OPTION(optimization);
   };

   BoolOptionBox debug
   {
      rightPane, this, position = { 8, 188 };
      text = $"Debuggable", hotKey = altG, option = OPTION(debug);
   };

   BoolOptionBox profiling
   {
      rightPane, this, position = { 116, 188 };
      text = $"Profiling Data", hotKey = altP, option = OPTION(profile);
   };

   BoolOptionBox noLineNumbers
   {
      rightPane, this, position = { 220, 188 };
      text = $"No Line Numbers", hotKey = altN, option = OPTION(noLineNumbers);
   };

   Label labelCompilerOptions { rightPane, this, position = { 8, 208 }, labeledWindow = compilerOptions };
   StringArrayOptionBox compilerOptions
   {
      rightPane, this, size = { 290, 22 }, anchor = { left = 8, top = 224, right = 8 };
      text = $"Compiler Options", hotKey = altO, option = OPTION(compilerOptions);
      configReplaces = true;
   };

   Label labelIncludeDirs { includeDirs.editor, labeledWindow = includeDirs, position = { 0, 6 }; };
   DirsArrayOptionBox includeDirs
   {
      rightPane, this, size = { 290, 22 }, anchor = { left = 8, top = 250, right = 8, bottom = 8 };
      text = $"Additional Include Directories", hotKey = altI, option = OPTION(includeDirs), switchToKeep = "I";
   };

   CompilerTab()
   {
      fileList.AddField(DataField { dataType = class(ProjectNode), freeData = false,
         userData = null /* Now set in the ProjectNode directly to know we're in ProjectSettings Dialog -- ide.projectView*/ });
   }

   bool OnCreate()
   {
      BuildTab buildTab = (BuildTab)master;
      buildTab.SelectNode(buildTab.lastSelectedNode, true);
      return true;
   }

   void AddNode(ProjectNode node, DataRow addTo)
   {
      DataRow row = addTo ? addTo.AddRow() : fileList.AddRow();

      row.tag = (int64)(intptr)node;

      row.SetData(null, node);

      if(node.files && node.files.first && node.parent &&
            !(!node.parent.parent &&
               (!strcmpi(node.name, "notes") || !strcmpi(node.name, "sources") ||
                  !strcmpi(node.name, "src") || !strcmpi(node.name, "tools"))))
         row.collapsed = true;
      else if(node.type == folder)
         node.icon = openFolder;

      if(node.files)
      {
         for(child : node.files)
            AddNode(child, row);
      }
   }

   void LoadSettings()
   {
      OptionBox ob;
      for(ob = (OptionBox)firstSlave; ob; ob = (OptionBox)ob.nextSlave)
         if(eClass_IsDerived(ob._class, class(OptionBox)))
            ob.Load();

      if(activeChild && activeChild.active)
      {
         Window control = activeChild;
         control.Deactivate();
         control.Activate();
      }
   }

   bool OnPostCreate()
   {
      objDir.editor.Activate();
      return true;
   }
}

class LinkerTab : Tab
{
   background = formColor;
   text = $"Linker";

   Label labelTargetName { this, position = { 8, 8 }, labeledWindow = targetName };
   StringOptionBox targetName
   {
      this, position = { 8, 24 }, size = { 200, 22 };
      text = $"Target Name", hotKey = altN, option = OPTION(targetFileName);
   };

   Label labelTargetType { this, position = { 216, 8 }, labeledWindow = targetType };
   TargetTypeDB targetType
   {
      this, position = { 216, 24 }, size = { 120, 22 };
      text = $"Target Type", hotKey = altT, option = OPTION(targetType);
   };

   Label labelTargetDirectory { this, position = { 344, 8 }, labeledWindow = targetDirectory };
   PathOptionBox targetDirectory
   {
      this, size = { 270, 22 }, anchor = { left = 344, top = 24, right = 8 };
      hotKey = altR, text = $"Target Directory", option = OPTION(targetDirectory);
   };

   Label labelLibraries { this, position = { 8, 50 }, labeledWindow = libraries };
   StringArrayOptionBox libraries
   {
      this, size = { 290, 22 }, anchor = { left = 8, top = 66, right = 8 };
      text = $"Additional Libraries", hotKey = altL, option = OPTION(libraries), switchToKeep = "l";
      configReplaces = true;
   };

   Label labelLinkerOptions { this, position = { 8, 92 }, labeledWindow = linkerOptions };
   StringArrayOptionBox linkerOptions
   {
      this, size = { 290, 22 }, anchor = { left = 8, top = 108, right = 8 };
      text = $"Linker Options", hotKey = altO, option = OPTION(linkerOptions);
      configReplaces = true;
   };

   BoolOptionBox console
   {
      this, position = { 8, 138 };
      text = $"Console Application", hotKey = altC, option = OPTION(console);
   };

   BoolOptionBox compress
   {
      this, position = { 8, 162 };
      text = $"Compress", hotKey = altW, option = OPTION(compress);
   };

   Label labelLibraryDirs { libraryDirs.editor, labeledWindow = libraryDirs, position = { 0, 6 }; };
   DirsArrayOptionBox libraryDirs
   {
      this, size = { 290, 22 }, anchor = { left = 8, top = 182, right = 8, bottom = 8 };
      text = $"Additional Library Directories", hotKey = altY, option = OPTION(libraryDirs), switchToKeep = "L";
   };

   bool OnCreate()
   {
      ((BuildTab)master).SelectNode(project.topNode, true);
      return true;
   }

   void LoadSettings()
   {
      OptionBox ob;
      for(ob = (OptionBox)firstSlave; ob; ob = (OptionBox)ob.nextSlave)
         if(eClass_IsDerived(ob._class, class(OptionBox)))
            ob.Load();
      compress.disabled = (config && config.options && config.options.debug == true) || project.topNode.options.debug == true;

      if(activeChild && activeChild.active)
      {
         Window control = activeChild;
         control.Deactivate();
         control.Activate();
      }
   }
}

class BuilderTab : Tab
{
   background = formColor;
   text = $"Builder";

   Label labelPrebuildCommands { prebuildCommands.editor, labeledWindow = prebuildCommands, position = { 0, 6 }; };
   StringsArrayOptionBox prebuildCommands
   {
      this, size = { 290, 92 }, anchor = { left = 8, top = 8, right = 8, bottom = 200 };
      text = $"Pre-build Commands", hotKey = altE, option = OPTION(prebuildCommands);
   };

   Label labelPostbuildCommands { postbuildCommands.editor, labeledWindow = postbuildCommands, position = { 0, 6 }; };
   StringsArrayOptionBox postbuildCommands
   {
      this, size = { 290, 92 }, anchor = { left = 8, top = 100, right = 8, bottom = 100 };
      text = $"Post-build Commands", hotKey = altT, option = OPTION(postbuildCommands);
   };

   Label labelInstallCommands { installCommands.editor, labeledWindow = installCommands, position = { 0, 6 }; };
   StringsArrayOptionBox installCommands
   {
      this, size = { 290, 92 }, anchor = { left = 8, top = 200, right = 8, bottom = 8 };
      text = $"Install Commands", hotKey = altT, option = OPTION(installCommands);
   };

   void LoadSettings()
   {
      OptionBox ob;
      for(ob = (OptionBox)firstSlave; ob; ob = (OptionBox)ob.nextSlave)
         if(eClass_IsDerived(ob._class, class(OptionBox)))
            ob.Load();

      if(activeChild && activeChild.active)
      {
         Window control = activeChild;
         control.Deactivate();
         control.Activate();
      }
   }

   void OnResize(int width, int height)
   {
      int h = (height - 8 * 4) / 3;
      prebuildCommands.anchor = { left = 8, top = 8, right = 8, bottom = h * 2 + 8 * 3 };
      postbuildCommands.anchor = { left = 8, top = h + 8 * 2, right = 8, bottom = h + 8 * 2 };
      installCommands.anchor = { left = 8, top = h * 2 + 8 * 3, right = 8, bottom = 8 };
   }
}
