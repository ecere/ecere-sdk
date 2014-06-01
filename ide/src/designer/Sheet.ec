import "ide"

import "CodeObject"

static void UnusedFunction()
{
   int a;
   Module b;
   a.OnGetString(0,0,0);
   a.OnFree();
   a.OnCopy(null);
   a.OnCompare(null);
   a.OnSaveEdit(null,0);
   a.OnEdit(null,null,0,0,0,0,0);
   a.OnDisplay(null,0,0,0,0,0,0);
   b.OnLoad();
}

extern int __ecereVMethodID_class_OnEdit;
extern int __ecereVMethodID_class_OnDisplay;
extern int __ecereVMethodID_class_OnGetString;
extern int __ecereVMethodID_class_OnFree;
extern int __ecereVMethodID_class_OnCompare;
extern int __ecereVMethodID_class_OnCopy;
extern int __ecereVMethodID_class_OnSaveEdit;

//#define SHOW_METHODS


// *** THESE METHODS SHOULD BE IMPROVED UPON AND USED TO SET PROPERTIES FROM NOW ON ***
//     (Other locations where this will be useful: JSON (DataValue version?), CodeEditor, ...)
// This takes in a value according to the any_object rules

void SetPropValue(Property prop, void * object, any_object value)
{
   Class type = prop.dataTypeClass;
   if(!type)
      type = prop.dataTypeClass = eSystem_FindClass(prop._class.module, prop.dataTypeString);

   if(type.type == normalClass || type.type == noHeadClass || type.type == structClass)
   {
      ((void (*)(void *, void *))(void *)prop.Set)(object, value);
   }
   // TOFIX: How to swiftly handle classes with base data type?
   else if(type == class(double) || !strcmp(type.dataTypeString, "double"))
   {
      ((void (*)(void *, double))(void *)prop.Set)(object, *(double *)value);
   }
   else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
   {
      ((void (*)(void *, float))(void *)prop.Set)(object, *(float *)value);
   }
   else if(type.typeSize == sizeof(int64))// || !strcmp(type.dataTypeString, "int64") || !strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64"))
   {
      ((void (*)(void *, int64))(void *)prop.Set)(object, *(int64 *)value);
   }
   else if(type.typeSize == sizeof(int))// || !strcmp(type.dataTypeString, "int") || !strcmp(type.dataTypeString, "unsigned int") || !strcmp(type.dataTypeString, "uint"))
   {
      ((void (*)(void *, int))(void *)prop.Set)(object, *(int *)value);
   }
   else if(type.typeSize == sizeof(short int)) // || !strcmp(type.dataTypeString, "short") || !strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") ||  !strcmp(type.dataTypeString, "int16"))
   {
      ((void (*)(void *, short))(void *)prop.Set)(object, *(short *)value);
   }
   else if(type.typeSize == sizeof(byte))// || !strcmp(type.dataTypeString, "char") || !strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte"))
   {
      ((void (*)(void *, byte))(void *)prop.Set)(object, *(byte *)value);
   }
   else
   {
      ((void (*)(void *, void *))(void *)prop.Set)(object, value);
   }
}

any_object GetPropValue(Property prop, Instance object)
{
   if(object)
   {
      Class type = prop.dataTypeClass;
      if(!type)
      {
         type = prop.dataTypeClass = eSystem_FindClass(prop._class.module, prop.dataTypeString);
      }

      if(type.type == normalClass || type.type == noHeadClass || type.type == structClass)
      {
         return ((void*(*)())(void *)prop.Get)(object);
      }
      // TOFIX: How to swiftly handle classes with base data type?
      else if(type == class(double) || !strcmp(type.dataTypeString, "double"))
      {
         double d = ((double(*)(void *))(void *)prop.Get)(object);
         return d;
      }
      else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
      {
         float f =((float(*)(void *))(void *)prop.Get)(object);
         return f;
      }
      else if(type.typeSize == sizeof(int64))// || !strcmp(type.dataTypeString, "int64") || !strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64"))
      {
         return ((int64(*)(void *))(void *)prop.Get)(object);
      }
      else if(type.typeSize == sizeof(int))// || !strcmp(type.dataTypeString, "int") || !strcmp(type.dataTypeString, "unsigned int") || !strcmp(type.dataTypeString, "uint"))
      {
         return ((int(*)(void *))(void *)prop.Get)(object);
      }
      else if(type.typeSize == sizeof(short int)) // || !strcmp(type.dataTypeString, "short") || !strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") ||  !strcmp(type.dataTypeString, "int16"))
      {
         return ((short(*)(void *))(void *)prop.Get)(object);
      }
      else if(type.typeSize == sizeof(byte))// || !strcmp(type.dataTypeString, "char") || !strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte"))
      {
         return ((byte(*)(void *))(void *)prop.Get)(object);
      }
      else
      {
         return ((int (*)(void *))(void *)prop.Get)(object);
      }
   }
   else
      return 0;
}

void CopyProperty(Property prop, Instance dest, Instance src)
{
   Class type = prop.dataTypeClass;
   if(!type)
      type = prop.dataTypeClass = eSystem_FindClass(prop._class.module, prop.dataTypeString);

   if(type.type == structClass)
   {
      void * propData = new0 byte[type.structSize];
      ((void (*)(void *, void *))(void *)prop.Get)(src, propData);
      ((void (*)(void *, void *))(void *)prop.Set)(dest, propData);
      delete propData;
   }
   else if(type.type == normalClass || type.type == noHeadClass)
   {
      // TOCHECK: Why was there a return here?
      /*return */((void (*)(void *, void *))(void *)prop.Set)(dest, ((void*(*)(void *))(void *)prop.Get)(src));
   }
   // TOFIX: How to swiftly handle classes with base data type?
   else if(type == class(double) || !strcmp(type.dataTypeString, "double"))
   {
      ((void (*)(void *, double))(void *)prop.Set)(dest, ((double(*)(void *))(void *)prop.Get)(src));
   }
   else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
   {
      ((void (*)(void *, float))(void *)prop.Set)(dest, ((float(*)(void *))(void *)prop.Get)(src));
   }
   else if(type.typeSize == sizeof(int64))// || !strcmp(type.dataTypeString, "int64") || !strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64"))
   {
      ((void (*)(void *, int64))(void *)prop.Set)(dest, ((int64(*)(void *))(void *)prop.Get)(src));
   }
   else if(type.typeSize == sizeof(int))// || !strcmp(type.dataTypeString, "int") || !strcmp(type.dataTypeString, "unsigned int") || !strcmp(type.dataTypeString, "uint"))
   {
      ((void (*)(void *, int))(void *)prop.Set)(dest, ((int(*)(void *))(void *)prop.Get)(src));
   }
   else if(type.typeSize == sizeof(short int)) // || !strcmp(type.dataTypeString, "short") || !strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") ||  !strcmp(type.dataTypeString, "int16"))
   {
      ((void (*)(void *, short))(void *)prop.Set)(dest, ((short(*)(void *))(void *)prop.Get)(src));
   }
   else if(type.typeSize == sizeof(byte))// || !strcmp(type.dataTypeString, "char") || !strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte"))
   {
      ((void (*)(void *, byte))(void *)prop.Set)(dest, ((byte(*)(void *))(void *)prop.Get)(src));
   }
   else
   {
      ((void (*)(void *, int))(void *)prop.Set)(dest, ((int (*)(void *))(void *)prop.Get)(src));
   }
}

void GetProperty(Property prop, Instance object, DataValue value)
{
   if(object)
   {
      Class type = prop.dataTypeClass;
      if(!type)
      {
         type = prop.dataTypeClass = eSystem_FindClass(prop._class.module, prop.dataTypeString);
#ifdef _DEBUG
         if(prop._class.module.application == __thisModule &&
            prop.dataTypeClass.module.application == ((Designer)GetActiveDesigner()).codeEditor.privateModule)
            printf($"Warning");
#endif
      }

      if(type.type == normalClass || type.type == noHeadClass || type.type == structClass)
      {
         value.p = ((void*(*)(void *))(void *)prop.Get)(object);
      }
      // TOFIX: How to swiftly handle classes with base data type?
      else if(type == class(double) || !strcmp(type.dataTypeString, "double"))
      {
         value.d = ((double(*)(void *))(void *)prop.Get)(object);
      }
      else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
      {
         value.f = ((float(*)(void *))(void *)prop.Get)(object);
      }
      else if(type.typeSize == sizeof(int64))// || !strcmp(type.dataTypeString, "int64") || !strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64"))
      {
         value.i64 = ((int64(*)(void *))(void *)prop.Get)(object);
      }
      else if(type.typeSize == sizeof(int))// || !strcmp(type.dataTypeString, "int") || !strcmp(type.dataTypeString, "unsigned int") || !strcmp(type.dataTypeString, "uint"))
      {
         value.i = ((int(*)(void *))(void *)prop.Get)(object);
      }
      else if(type.typeSize == sizeof(short int)) // || !strcmp(type.dataTypeString, "short") || !strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") ||  !strcmp(type.dataTypeString, "int16"))
      {
         value.s = ((short(*)(void *))(void *)prop.Get)(object);
      }
      else if(type.typeSize == sizeof(byte))// || !strcmp(type.dataTypeString, "char") || !strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte"))
      {
         value.uc = ((byte(*)(void *))(void *)prop.Get)(object);
      }
      else
      {
         value.i = ((int (*)(void *))(void *)prop.Get)(object);
      }
   }
   else
      value.i64 = 0;
}

void SetProperty(Property prop, Instance object, DataValue value)
{
   if(object)
   {
      Class type = prop.dataTypeClass;
      if(!type)
         type = prop.dataTypeClass = eSystem_FindClass(prop._class.module, prop.dataTypeString);

      if(type.type == normalClass || type.type == noHeadClass || type.type == structClass)
      {
         ((void (*)(void *, void *))(void *)prop.Set)(object, value);
      }
      // TOFIX: How to swiftly handle classes with base data type?
      else if(type == class(double) || !strcmp(type.dataTypeString, "double"))
      {
         ((void (*)(void *, double))(void *)prop.Set)(object, value.d);
      }
      else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
      {
         ((void (*)(void *, float))(void *)prop.Set)(object, value.f);
      }
      else if(type.typeSize == sizeof(int64))// || !strcmp(type.dataTypeString, "int64") || !strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64"))
      {
         ((void (*)(void *, int64))(void *)prop.Set)(object, value.i64);
      }
      else if(type.typeSize == sizeof(int))// || !strcmp(type.dataTypeString, "int") || !strcmp(type.dataTypeString, "unsigned int") || !strcmp(type.dataTypeString, "uint"))
      {
         ((void (*)(void *, int))(void *)prop.Set)(object, value.i);
      }
      else if(type.typeSize == sizeof(short int)) // || !strcmp(type.dataTypeString, "short") || !strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") ||  !strcmp(type.dataTypeString, "int16"))
      {
         ((void (*)(void *, short))(void *)prop.Set)(object, value.s);
      }
      else if(type.typeSize == sizeof(byte))// || !strcmp(type.dataTypeString, "char") || !strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte"))
      {
         ((void (*)(void *, byte))(void *)prop.Set)(object, value.uc);
      }
      else
      {
         ((void (*)(void *, int))(void *)prop.Set)(object, value.i);
      }
   }
}

static define sheetSelectionColor = Color { 170, 220, 255 };
static define sheetSelectionText = black;

class Sheet : Window
{
   text = $"Sheet";
   borderStyle = sizable;
   hasClose = true;
   //tabCycle = true;
   size.w = 300;
   anchor = { left = 0, top = 0, bottom = 0 };
   background = formColor;

   Sheet()
   {
      dropBox.AddField(dropField);
      properties.AddField(propertyName);
      properties.AddField(propertyValue);
      methods.AddField(methodName);
   }

   ~Sheet()
   {
      categories.Free(null);
   }

   DropBox dropBox
   {
      this,
      anchor = { left = 0, top = 0, right = 0 };

      bool NotifySelect(DropBox control, DataRow row, Modifiers keyFlags)
      {
         ObjectInfo selected = (ObjectInfo)(row ? row.tag : null);
         ToolBox toolBox = ((IDEWorkSpace)parent).toolBox;

         if(codeEditor && selected)
            codeEditor.SelectObject(selected);

         // TODO: Get containing class of object
         toolBox.selectedClass = selected ? selected.oClass : null;

         object = selected ? selected.instance : null;

         methods.Clear();
         ListProperties(true);

         {
            DataRow row;
            row = methods.currentRow;
            if(row)
               strcpy(selectedMethod, ((CodeObject)row.GetData(methodName)).name);
         }


         if(selected && selected.instance && codeEditor)
         {
            Class _class;
            int c = 0;
            int rowHeight = methods.rowHeight;

            propertyValue.userData = (void *)selected.instance;

            // Fill up the methods
            {
               CodeObjectType type;
               {
                  for(_class = selected.instance._class; _class && _class.type != systemClass; _class = _class.base)
                  {
                     int id;
                     for(id = _class.base ? _class.base.vTblSize : 0; id<_class.vTblSize; id++)
                     {
                        Method method;
                        for(method = (Method)_class.methods.first; method; method = (Method)((BTNode)method).next)
                        {
                           if(method.type == virtualMethod && method.vid == id)
                           {
                              if(!method.dataType)
                                 method.dataType = ProcessTypeString(method.dataTypeString, false);

                              type = method.dataType.thisClass ? typeEvent : typeMethod;
                              {
                                 DataRow row = methods.AddRow();
                                 CodeObject codeObject
                                 {
                                    eventsUp = (selected.oClass == selected) ? false : true;
                                    type = type;
                                    method = method;
                                    name = method.name;
                                    overriden = codeEditor.FindMethod(method.name, &codeObject.function, null);
                                 };
                                 if(!codeObject.overriden || codeObject.overriden == 2)
                                    codeEditor.FindCompatibleMethods(method, codeObject.compatible);

                                 row.SetData(methodName, codeObject);

                                 if(!strcmp(method.name, selectedMethod))
                                    methods.currentRow = row;
                              }
                           }
                        }
                     }
                  }
               }
            }
            methods.Sort(methodName, 1);
            {
               DataRow row;
               for(row = methods.firstRow; row; row = row.next)
               {
                  CodeObject codeObject = row.GetData(methodName);
                  CreateButtons(codeObject, row.index * rowHeight, rowHeight, row);
               }
            }
         }
         return true;
      }
   };
   DataField dropField { dataType = class(CodeObject) };

   Button propBtn
   {
      this, inactive = true, text = $"Properties", bevelOver = true, isRadio = true;
      size.h = 20;
      anchor = { left = 0, bottom = 3, right = 0.5 };
      bitmap = null;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         text = $"Properties";
         button.font = { $"Tahoma", 8.25f, bold = true };
         methBtn.font = null;

         methods.visible = false;
         methBtn.Activate();      // Ensure proper cycling (until tab order?)
         properties.visible = true;

         alphabetical.disabled = false;
         categorized.disabled = false;

         properties.Activate();

         // ((IDEWorkSpace)master).SheetSelected(Properties);
         return true;
      }
   };

   Button methBtn
   {
      this, inactive = true, bevelOver = true;
      text = $"Methods";
      isRadio = true;
      bitmap = null;
      size.h = 20;
      anchor = { bottom = 3, left = 0.5, right = 0 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         text = $"Methods";
         button.font = { $"Tahoma", 8.25f, bold = true };
         propBtn.font = null;

         properties.visible = false;
         methBtn.Activate();      // Ensure proper cycling (until tab order?)
         methods.visible = true;

         alphabetical.disabled = true;
         categorized.disabled = true;

         methods.Activate();

         // ((IDEWorkSpace)master).SheetSelected(Methods);
         return true;
      }
   };

   // Menu
   menu = Menu { };
   MenuPlacement editMenu { menu, text = $"Edit" };
   Menu viewMenu { menu, text = $"View" };

   // Property Sheet
   ListBox properties
   {
      this, anchor = { left = 0, right = 0, top = 50, bottom = 25 };
      hasVertScroll = true, alwaysEdit = true, collapseControl = true, resizable = true;
      background = viewsBackground;
      foreground = viewsText;
      selectionText = sheetSelectionText;
      selectionColor = sheetSelectionColor;

      bool NotifySelect(ListBox control, DataRow row, Modifiers keyFlags)
      {
         /*
         if(row)
         {
            strcpy(selectedProp, (char *)row.GetData(propertyName));
            selectedScroll = properties.scroll.y;
            selectedScroll -= row.index * properties.rowHeight;
         }
         else
            selectedProp[0] = 0;
         if(row)
         {
            prop = ((PropertyInfo)row.GetData(propertyValue)).prop;
         }
         else
            prop = null;
         */
         return true;
      }
   };

   DataField propertyName { dataType = class(char *), width = 130 };
   DataField propertyValue { dataType = class(PropertyInfo), width = 0, editable = true };

   // Method Sheet
   ListBox methods
   {
      this, anchor = { left = 0, right = 0, top = 50, bottom = 25 };
      hasVertScroll = true;
      background = viewsBackground;
      foreground = viewsText;
      // alwaysEdit = true;
      // resizable = true;

      bool NotifyDoubleClick(ListBox control, int x, int y, Modifiers mods)
      {
         CodeObject object = control.GetData(methodName);
         if(object)
            codeEditor.AddMethod(object.method);
         return false;
      }

      bool NotifyRightClick(ListBox control, int x, int y, Modifiers mods)
      {
         CodeObject object = control.GetData(methodName);
         Menu menu { };
         PopupMenu popupMenu;
         MenuItem item;
         if(object.overriden == 0)
         {
            MenuItem { menu, $"Override", o, enter, bold = true, NotifySelect = OverrideMethodSelected };
            if(object.compatible.count)
            {
               Menu attachMenu { menu, $"Attach", a };
               OldLink compatible;
               for(compatible = object.compatible.first; compatible; compatible = compatible.next)
               {
                  ClassFunction function = compatible.data;
                  MenuItem { attachMenu, function.declarator.symbol.string, id = (int64)function, NotifySelect = AttachMethodSelected };
               }
            }
         }
         else if(object.overriden == 1)
         {
            MenuItem { menu, $"Go to", g, enter, bold = true, NotifySelect = GotoMethodSelected };
            MenuItem { menu, $"Detach", d, d, NotifySelect = DetachMethodSelected };
            MenuItem { menu, $"Delete", del, del, NotifySelect = DeleteMethodSelected };
         }
         else if(object.overriden == 2)
         {
            MenuItem { menu, $"Go to", g, enter, bold = true, NotifySelect = GotoMethodSelected };
            MenuItem { menu, $"Detach", d, d, NotifySelect = DetachMethodSelected };
            if(object.compatible.count > 1)
            {
               Menu attachMenu { menu, $"Reattach", r };
               OldLink compatible;
               for(compatible = object.compatible.first; compatible; compatible = compatible.next)
               {
                  ClassFunction function = compatible.data;
                  if(function != object.function)
                  {
                     MenuItem { attachMenu, function.declarator.symbol.string, id = (int64)function, NotifySelect = ReattachMethodSelected };
                  }
               }
            }
         }

         attachMethod = object.method;
         popupMenu = PopupMenu { menu = menu, master = this, position =
            {
               x + control.absPosition.x - app.desktop.absPosition.x,
               y + control.absPosition.y - app.desktop.absPosition.y
            } };
         popupMenu.Create();
         // popupMenu.Capture();
         return false;
      }

      bool NotifyKeyDown(ListBox listBox, DataRow row, Key key, unichar ch)
      {
         if(row)
         {
            CodeObject object = row.GetData(methodName);
            switch((SmartKey)key)
            {
               case enter:
                  if(!object.overriden)
                     listBox.NotifyDoubleClick(this, listBox, 0,0, 0);
                  else
                     codeEditor.GoToMethod(object.method.name);
                  break;
               case del:
                  if(object.deleteBtn)
                     object.deleteBtn.NotifyClicked(this, object.deleteBtn, 0,0,0);
                  else if(object.detachBtn)
                     object.detachBtn.NotifyClicked(this, object.detachBtn, 0,0,0);
                  break;
               case a:
                  if(object.attachBtn)
                     object.attachBtn.NotifyPushed(this, object.attachBtn, 0,0,0);
                  break;
               case d:
                  if(object.detachBtn)
                     object.detachBtn.NotifyClicked(this, object.detachBtn, 0,0,0);
                  break;
            }
         }
         return true;
      }
   };

   DataField methodName { dataType = class(CodeObject) };

#ifdef SHOW_METHODS
   methBtn.font = { $"Tahoma", 8.25, bold = true };
   methBtn.checked = true;
   properties.visible = false;
   text = $"Methods";
#else
   propBtn.font = { $"Tahoma", 8.25f, bold = true };
   propBtn.checked = true;
   methods.visible = false;
   text = $"Properties";
#endif

   Button alphabetical
   {
      this, bevelOver = true, inactive = true, position = { 25, 25 }, size = { 24, 24 };
      bitmap = { "<:ecere>elements/orderAscending.png" };
      // isRadio = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(!alphabetical.checked)
         {
            alphabetical.checked = true;
            categorized.checked = false;

            ListProperties(true);
         }
         return true;
      }
   };

   Button categorized
   {
      this, bevelOver = true, checked = true, inactive = true, position = { 0, 25 }, size = { 24, 24 };
      bitmap = { "<:ecere>elements/orderCategorized.png" };
      // isRadio = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(!categorized.checked)
         {
            categorized.checked = true;
            alphabetical.checked = false;

            ListProperties(true);
         }
         return true;
      }
   };

   property CodeEditor codeEditor
   {
      set
      {
         if(codeEditor != value)
         {
            codeEditor = value;
            // Refill it up
            dropBox.Clear();
            dropField.userData = codeEditor;
            methodName.userData = codeEditor;

            if(codeEditor)
               codeEditor.EnumerateObjects(this);
          }
      }
      get
      {
         return codeEditor;
      }
   }

   property SheetType sheetSelected
   {
      set
      {
         if(methBtn.checked != (value == SheetType::methods))
            ToggleSheet();
      }
      get
      {
         return methBtn.checked ? methods : properties;
      }
   }

   bool OnClose(bool parentClosing)
   {
      if(!parentClosing)
      {
         visible = false;
         return false;
      }
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if(key == shiftTab)
         dropBox.Activate();
      else if(key == tab)
         ToggleSheet();
      else if(key == escape)
      {
         Window activeClient = ide.activeClient;
         if(activeClient)
            activeClient.Activate();
         else
            ide.RepositionWindows(true);
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      return properties.OnKeyHit(key, ch);
   }

   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
      if(active && codeEditor)
         codeEditor.EnsureUpToDate();
      return true;
   }

   void ListProperties(bool clear)
   {
      DataRow row = dropBox.currentRow;
      ObjectInfo selected = row ? (ObjectInfo)row.tag : null;

      //int scroll = 0;
      bool categorized = this.categorized.checked;
      bool currentRow = false;
      char selectedProp[1024];

      if(clear)
      {
         Category cat;
         DataRow row = properties.currentRow;
         if(row)
         {
            DataRow propRow = row;
            char * propName;
            while(propRow && propRow.parent && !propRow.parent.isHeader)
               propRow = row.parent;

            propName = propRow.GetData(propertyName);
            strcpy(this.selectedProp, propName);
            selectedScroll = properties.scroll.y;
            selectedScroll -= propRow.index * properties.rowHeight;
         }
         currentRow = this.selectedProp[0] ? true : false;

         for(cat = categories.first; cat; cat = cat.next)
         {
            cat.collapsed = cat.row.collapsed;
            cat.row = null;
         }

         // Preserve selected property (PropertySheetSelect will null it)
         strcpy(selectedProp, this.selectedProp);
         properties.Clear();
         strcpy(this.selectedProp, selectedProp);
      }
      if(selected && selected.instance && codeEditor)
      {
         Instance test = eInstance_New(selected.instance._class);
         Class _class = null;
         incref test;

         // Put it in the same desktop window...
         if(selected.classDefinition)
            codeEditor.designer.PrepareTestObject(test);

         // Fill up the properties
         while(_class != selected.instance._class)
         {
            BitMember bitMember = null;
            Class lastClass = _class;
            Property propIt;

            for(_class = selected.instance._class; _class.base != lastClass && _class.base.type != systemClass && _class.inheritanceAccess != privateAccess; _class = _class.base);

            for(propIt = _class.membersAndProperties.first; propIt; propIt = propIt.next)
            {
               if(propIt.isProperty)
               {
                  Property prop = eClass_FindProperty(selected.instance._class, propIt.name, GetPrivateModule());

                  if(prop && prop.Set && prop.Get && prop.compiled && (!prop.category || strcmpi(prop.category, $"Deprecated")))
                  {
                     bool disabled = Code_IsPropertyDisabled(selected, prop.name);
                     bool bold;
                     Class dataType = prop.dataTypeClass;
                     if(!dataType)
                        dataType = prop.dataTypeClass = eSystem_FindClass(codeEditor.privateModule, prop.dataTypeString);

                     if(!strcmp(_class.name, "DesignerBase"))
                        disabled = true;
                     bold = !disabled && Code_IsPropertyModified(test, selected, prop);

                     if(dataType)
                     {
                        DataRow row;
                        PropertyInfo info { prop, disabled, bold ? codeEditor.boldFont : codeEditor.normalFont };
                        const char * name = prop.category ? prop.category : $"Misc";
                        Category category = categories.FindName(name, false);

                        // Hide properties like this for now..
                        if(name && !strcmp(name, "Private"))
                        {
                           delete info;
                           continue;
                        }

                        if(!category)
                        {
                           category = Category { name = name };
                           categories.AddName(category);
                        }
                        if(!category.row && categorized)
                        {
                           PropertyInfo catInfo { null, false, null, name };
                           category.row = properties.AddRow();
                           category.row.SetData(propertyName, name );
                           category.row.SetData(propertyValue, catInfo);
                           category.row.isHeader = true;
                           category.row.collapsed = category.collapsed;
                        }

                        if(clear)
                        {
                           row = categorized ? category.row.FindRow((int64)prop) : properties.FindRow((int64)prop);
                           if(!row)
                              row = categorized ? category.row.AddRow() : properties.AddRow();
                           row.tag = (int64)prop;
                        }
                        else
                           row = categorized ? category.row.FindRow((int64)prop) : properties.FindRow((int64)prop);

                        row.SetData(propertyName, prop.name);
                        row.SetData(propertyValue, info);

                        if(clear && !strcmp(prop.name, this.selectedProp))
                           properties.currentRow = row;

                        if(!dataType.noExpansion && (dataType.type == structClass || dataType.type == normalClass || dataType.type == noHeadClass || dataType.type == bitClass))
                        {
                           DataMember member;

                           if(clear)
                              row.collapsed = true;

                           for(member = dataType.membersAndProperties.first; member; member = member.next)
                           {
                              if(member.isProperty)
                              {
                                 Property subProp = (Property)member;
                                 if(!subProp.conversion && subProp.Get && subProp.Set)
                                 {
                                    DataRow subRow;
                                    PropertyInfo info { prop, disabled, bold ? codeEditor.boldFont : codeEditor.normalFont, null, null, subProp };

                                    if(clear)
                                    {
                                       subRow = row.AddRow();
                                       subRow.tag = (int64)subProp;
                                    }
                                    else
                                       subRow = row.FindRow((int64)subProp);

                                    subRow.SetData(propertyName, subProp.name);
                                    subRow.SetData(propertyValue, info);
                                 }
                              }
                              else if(member.name)
                              {
                                 DataRow subRow;
                                 PropertyInfo info { prop, disabled, bold ? codeEditor.boldFont : codeEditor.normalFont, null, member, null };
                                 if(clear)
                                 {
                                    subRow = row.AddRow();
                                    subRow.tag = (int64)member;
                                 }
                                 else
                                    subRow = row.FindRow((int64)member);

                                 subRow.SetData(propertyName, member.name);
                                 subRow.SetData(propertyValue, info);
                              }
                              else
                              {
                                 DataMember subMember;
                                 for(subMember = member.members.first; subMember; subMember = subMember.next)
                                 {
                                    DataRow subRow;
                                    PropertyInfo info { prop, disabled, bold ? codeEditor.boldFont : codeEditor.normalFont, null, subMember, null, member.offset };
                                    if(clear)
                                    {
                                       subRow = row.AddRow();
                                       subRow.tag = (int64)subMember;
                                    }
                                    else
                                       subRow = row.FindRow((int64)subMember);

                                    subRow.SetData(propertyName, subMember.name);
                                    subRow.SetData(propertyValue, info);
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         delete test;
         // Sort alphabetically for now...
         if(clear)
         {
            // properties.Sort(null, 1);
            properties.Sort(propertyValue, 1);
            if(!properties.currentRow)
            {
               bool found = false;

               for(_class = selected.instance._class; _class; _class = _class.base)
               {
                  Property prop;
                  for(prop = _class.membersAndProperties.first; prop; prop = prop.next)
                  {
                     if(prop.isProperty && prop.Set && prop.Get && prop.compiled)
                     {
                        if(_class.defaultProperty && !strcmp(prop.name, _class.defaultProperty))
                        {
                           DataRow row;
                           const char * name = prop.category ? prop.category : $"Misc";
                           Category category = categories.FindName(name, false);
                           row = category ? (categorized ? category.row.FindRow((int64)prop) : properties.FindRow((int64)prop)) : null;
                           properties.currentRow = row;
                           found = true;
                           break;
                        }
                     }
                  }
                  if(found) break;
               }
               if(!found)
                  properties.currentRow = properties.firstRow;
            }

            if(currentRow)
            {
               DataRow row = properties.currentRow;
               properties.scroll.y = selectedScroll + row.index * properties.rowHeight;
            }
         }
      }
   }

   void AddObject(ObjectInfo object, const char * name, CodeObjectType type, bool select)
   {
      DataRow after = null;
      DataRow row;
      CodeObject codeObject;
      char * bitmap = null;
      bool foundClass = false;

      for(row = dropBox.firstRow; row; row = row.next)
      {
         CodeObject codeObject = row.GetData(null);
         if(codeObject.object.oClass == object.oClass)
            foundClass = true;
         else if(foundClass)
            break;
         after = row;
      }

      row = (DataRow)dropBox.AddRowAfter(after);

      row.tag = (int64)object;

      codeObject =
      {
         object = object;
         name = name;
         type = type;
         indent = (type == typeClass) ? 0 : 1;
      };

      if(type != typeClass)
         bitmap = (char *)eClass_GetProperty(object.instance._class, "icon");
      if(bitmap)
      {
         codeObject.bitmap = { bitmap };
         AddResource(codeObject.bitmap);
      }

      row.SetData(null, codeObject);

      if(select)
      {
         this.object = object ? object.instance : null;
         propertyValue.userData = object ? (void *)object.instance : null;
         dropBox.SelectRow(row);
      }
   }

   void DeleteObject(ObjectInfo object)
   {
      DataRow row = dropBox.FindRow((int64)object);
      if(row)
      {
         CodeObject codeObject = row.GetData(null);

         if(codeObject.bitmap)
            RemoveResource(codeObject.bitmap);
         dropBox.DeleteRow(row);
      }
   }

   void SelectObject(ObjectInfo object)
   {
      if(this)
      {
         DataRow row = dropBox.FindRow((int64)object);
         this.object = object ? object.instance : null;
         propertyValue.userData = object ? (void *)object.instance : null;
         dropBox.SelectRow(row);
      }
   }

   void RenameObject(ObjectInfo object, const char * name)
   {
      DataRow row = dropBox.FindRow((int64)object);
      CodeObject codeObject = row.GetData(null);
      // Isn't this useless? Shouldn't it be after?
      codeObject.name = name;
      // row.SetData(null, codeObject);  // Is this necessary?
   }

   void DataBox::EditSetData(any_object setValue, bool closingDropDown)
   {
      ((Sheet)master.master).SetData(setValue, this);
   }

   void SetData(any_object setValue, DataBox dataBox)
   {
      //PropertyInfo propertyPtr = row.GetData(null);
      PropertyInfo propertyPtr = properties.GetData(null);
      Property prop = propertyPtr ? propertyPtr.prop : null;
      Instance object = this.object;
      if(prop)
      {
         Class dataType = prop.dataTypeClass;
         if(!dataType)
            dataType = prop.dataTypeClass = eSystem_FindClass(codeEditor.privateModule, prop.dataTypeString);
         if(propertyPtr.subMember)
         {
            DataMember member = propertyPtr.subMember;
            Class subDataType = member.dataTypeClass;
            if(!member.dataTypeClass)
               subDataType = member.dataTypeClass = eSystem_FindClass(codeEditor.privateModule, member.dataTypeString);
            if(subDataType)
            {
               void * data = null;
               if(!subDataType.dataType)
                  subDataType.dataType = ProcessTypeString(subDataType.dataTypeString, false);

               if(dataType.type == structClass)
               {
                  data = new0 byte[dataType.structSize];
                  ((void (*)(void *, void *))(void *)prop.Get)(object, data);
                  // CopyBytes((byte *)data + member.offset + propertyPtr.extraOffset, &setValue, subDataType.size);
                  CopyBytes((byte *)data + member.offset + propertyPtr.extraOffset, (void *)setValue, subDataType.dataType.size);
                  ((void (*)(void *, void *))(void *)prop.Set)(object, data);
               }
               else if(dataType.type == normalClass || dataType.type == noHeadClass)
               {
               }
               else
               {
                  if(dataType.type == bitClass)
                  {
                     BitMember bitMember = (BitMember) member;
                     if(subDataType)
                     {
                        DataValue value { 0 };
                        value.ui = ((uint (*)(void *))(void *)prop.Get)(object);
                        value.ui &= ~ (uint)bitMember.mask;
                        value.ui |= *(uint32 *)setValue << bitMember.pos;
                        ((void (*)(void *, uint))(void *)prop.Set)(object, value.ui);
                     }
                  }
                  else
                  {
                     // TODO: What does this handle?
                     data = dataType.typeSize ? new0 byte[dataType.typeSize] : null;
                     ((void (*)(void *, void *))(void *)prop.Get)(object, data);
                     // CopyBytes((byte *)data + member.offset + propertyPtr.extraOffset, &setValue, subDataType.typeSize);
                     CopyBytes((byte *)data + member.offset + propertyPtr.extraOffset, (void *)setValue, subDataType.dataType.size);
                     // TODO: Support non 32 bit datatypes here
                     ((void (*)(void *, void *))(void *)prop.Set)(object, data);
                  }
               }

               if(data) ((void (*)(void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnFree])(dataType,&data);
               delete data;
            }
         }
         else if(propertyPtr.subProperty)
         {
            Property subProperty = propertyPtr.subProperty;
            Class subDataType = subProperty.dataTypeClass;
            if(!subDataType)
               subDataType = subProperty.dataTypeClass = eSystem_FindClass(codeEditor.privateModule, subProperty.dataTypeString);
            if(subDataType)
            {
               void * data = null;

               if(dataType.type == structClass)
               {
                  data = new0 byte[dataType.structSize];
                  ((void (*)(void *, void *))(void *)prop.Get)(object, data);
                  ((void (*)(void *, uint))(void *)subProperty.Set)(data, *(uint32 *)setValue);
                  ((void (*)(void *, void *))(void *)prop.Set)(object, data);
               }
               else if(dataType.type == normalClass || dataType.type == noHeadClass)
               {
                  Instance current = (Instance)((void *(*)(void *))(void *)prop.Get)(object);
                  Instance propObject = eInstance_New(dataType);
                  CopyInstanceData(dataType, propObject, current);
                  ((void (*)(void *, uint))(void *)subProperty.Set)(propObject, (uint32)setValue);
                  ((void (*)(void *, void *))(void *)prop.Set)(object, propObject);
               }
               else
               {
                  data = dataType.typeSize ? new0 byte[dataType.typeSize] : null;
                  ((void (*)(void *, void *))(void *)prop.Get)(object, data);
                  ((void (*)(void *, uint))(void *)subProperty.Set)(data, (uint32)setValue);
                  // TODO: Support not 32 bit data types here
                  ((void (*)(void *, void *))(void *)prop.Set)(object, data);
               }

               if(data) ((void (*)(void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnFree])(dataType,&data);
               delete data;
            }
         }
         else
         {
            SetPropValue(prop, object, (uint32)setValue);
         }
         Code_FixProperty(propertyPtr.prop, object);

         properties.Update(null);
         dropBox.Update(null);
         codeEditor.designer.Update(null);
         codeEditor.Update(null);   // patch for redraw bug if on top

         ListProperties(false);
         // DataRow values were changed by ListProperties, need to re-query
         propertyPtr = properties.GetData(null);
         if(propertyPtr)
            dataBox.editor.font = { propertyPtr.font.faceName, propertyPtr.font.size, propertyPtr.font.bold };

         codeEditor.ModifyCode();
      }
   }

   bool SaveEdit(PropertyInfo propertyPtr, Instance object)
   {
      codeEditor.designer.Update(null);
      codeEditor.Update(null);   // patch for redraw bug if on top
      properties.Update(null);
      dropBox.Update(null);

      Code_FixProperty(propertyPtr.prop, object);
      ListProperties(false);

      codeEditor.ModifyCode();
      return true;
   }

   void ToggleSheet()
   {
      if(!propBtn.checked)
      {
         propBtn.checked = true;
         propBtn.NotifyClicked(this, propBtn, 0,0,0);
      }
      else
      {
         methBtn.checked = true;
         methBtn.NotifyClicked(this, methBtn, 0,0,0);
      }
   }

   bool AttachMethodSelected(MenuItem selection, Modifiers mods)
   {
      ClassFunction function = (ClassFunction)selection.id;
      codeEditor.AttachMethod(attachMethod, function);
      return true;
   }

   bool ReattachMethodSelected(MenuItem selection, Modifiers mods)
   {
      ClassFunction function = (ClassFunction)selection.id;
      CodeObject object = methods.GetData(methodName);
      codeEditor.ReAttachMethod(attachMethod, function);
      return true;
   }

   bool OverrideMethodSelected(MenuItem selection, Modifiers mods)
   {
      ClassFunction function = (ClassFunction)selection.id;
      CodeObject object = methods.GetData(methodName);
      if(object)
         codeEditor.AddMethod(object.method);
      return true;
   }

   bool GotoMethodSelected(MenuItem selection, Modifiers mods)
   {
      ClassFunction function = (ClassFunction)selection.id;
      CodeObject object = methods.GetData(methodName);
      if(object)
         codeEditor.GoToMethod(object.method.name);
      return true;
   }

   bool DetachMethodSelected(MenuItem selection, Modifiers mods)
   {
      ClassFunction function = (ClassFunction)selection.id;
      CodeObject object = methods.GetData(methodName);
      if(object)
         codeEditor.DetachMethod(object.method, object.function, object.overriden);
      return true;
   }

   bool DeleteMethodSelected(MenuItem selection, Modifiers mods)
   {
      ClassFunction function = (ClassFunction)selection.id;
      CodeObject object = methods.GetData(methodName);
      if(object)
         object.deleteBtn.NotifyClicked(this, object.deleteBtn, 0,0,0);
      return true;
   }

   bool AddMethodClicked(Button button, int x, int y, Modifiers mods)
   {
      DataRow row = (DataRow)button.id;
      CodeObject object = row.GetData(methodName);
      codeEditor.AddMethod(object.method);
      return true;
   }

   void CreateButtons(CodeObject codeObject, int y, int h, DataRow row)
   {
      BitmapResource bitmap;

      if(codeObject.overriden)
      {
         if(codeObject.overriden == 1)
         {
            codeObject.deleteBtn = Button
            {
               methods, master = this,
               inactive = true,
               bitmap = { ":actions/delete.png", alphaBlend = true },
               anchor = { right = 16, top = y },
               size = { 16, h },
               id = (int64)row;

               bool NotifyClicked(Button button, int x, int y, Modifiers mods)
               {
                  CodeObject codeObject = ((DataRow)button.id).GetData(null);
                  bool confirmation = !Code_IsFunctionEmpty(codeObject.function, codeObject.method, codeEditor.selected);

                  if(confirmation)
                  {
                     char title[1024];
                     sprintf(title, $"Delete %s", codeObject.name);
                     if(MessageBox
                        {
                           master = parent, type = okCancel, text = title,
                           contents = $"Method still contains code. Are you sure you want to delete it?"
                        }.Modal() == ok)
                        confirmation = false;
                  }

                  if(!confirmation && codeObject.function.attached.count)
                  {
                     char title[1024];
                     sprintf(title, $"Delete %s", codeObject.name);
                     confirmation = true;
                     if(MessageBox
                        {
                           master = parent, type = okCancel, text = title,
                           contents = $"Other methods are still attached to this method. Are you sure you want to delete it?"
                        }.Modal() == ok)
                        confirmation = false;
                  }

                  if(!confirmation)
                  {
                     codeEditor.DeleteMethod(codeObject.function);
                  }
                  return false;
               }
            };
            incref codeObject.deleteBtn;
            codeObject.deleteBtn.Create();
         }

         if(codeObject.overriden == 2 || !codeObject.function.attached.count)
         {
            codeObject.detachBtn = Button
            {
               methods,
               master = methods.master,
               inactive = true,
               bitmap = { ":actions/detach.png" },
               anchor = { right = 0, top = y },
               size = { 16, h },
               id = (int64)row;

               bool NotifyClicked(Button button, int x, int y, Modifiers mods)
               {
                  DataRow row = (DataRow)button.id;
                  CodeObject object = row.GetData(methodName);

                  codeEditor.DetachMethod(object.method, object.function, object.overriden);
                  return true;
               }
            };
            incref codeObject.detachBtn;
            codeObject.detachBtn.Create();
         }
      }
      else
      {
         if(codeObject.compatible.count)
         {
            codeObject.attachBtn = Button
            {
               parent = methods, master = methods.master,
               inactive = true,
               bitmap = { ":actions/attach.png" },
               anchor = { right = 0, top = y },
               size = { 16, h },
               id = (int64)row;

               bool NotifyPushed(Button button, int x, int y, Modifiers mods)
               {
                  // Create menu
                  DataRow row = (DataRow)button.id;
                  CodeObject object = row.GetData(methodName);
                  OldLink compatible;
                  PopupMenu popupMenu;

                  Menu menu { };

                  for(compatible = object.compatible.first; compatible; compatible = compatible.next)
                  {
                     ClassFunction function = compatible.data;
                     MenuItem { menu, function.declarator.symbol.string, id = (int64)function, NotifySelect = AttachMethodSelected };
                  }
                  attachMethod = object.method;

                  popupMenu = PopupMenu
                  {
                     master = this, menu = menu,
                     position =
                     {
                        button.absPosition.x - app.desktop.position.x,
                        button.absPosition.y - app.desktop.position.y + button.size.h
                     };
                  };
                  popupMenu.Create();
                  button.ReleaseCapture();
                  popupMenu.Capture();
                  return false;
               }
            };
            incref codeObject.attachBtn;
            codeObject.attachBtn.Create();
         }
      }
   }
   Instance object;
   Method attachMethod;
   char selectedMethod[1024];
   CodeEditor codeEditor;
   OldList categories;
   char selectedProp[1024];
   int selectedScroll;
}

static int String_OnCompare(const char ** string1, const char ** string2)
{
   int result = 0;
   if(*string1 && *string2)
      result = strcmpi(*string1, *string2);
   else if(!*string1 && *string2)
      result = 1;
   else if(*string1 && !*string2)
      result = -1;
   return result;
}

static void CopyInstanceData(Class dataType, Instance propObject, Instance current)
{
   Class _class;
   for(_class = dataType; _class && _class.type != systemClass; _class = _class.base)
   {
      DataMember member;
      for(member = _class.membersAndProperties.first; member; member = member.next)
      {
         Class memberType = member.dataTypeClass;
         if(!memberType)
            memberType = member.dataTypeClass = eSystem_FindClass(((Designer)GetActiveDesigner()).codeEditor.privateModule, member.dataTypeString);
         if(member.isProperty)
         {
            Property subProp = (Property) member;
            if(subProp.Get && subProp.Set)
               CopyProperty(subProp, propObject, current);
         }
         else if(member.id > -1)
         {
            if(memberType)
               // TOCHECK: I have serious doubts this works in many cases.
               ((void (*)(void *, void *, void *))(void *)memberType._vTbl[__ecereVMethodID_class_OnCopy])(memberType, (byte *)propObject + member.offset, (byte *)current + member.offset);
            else
               memcpy((byte *)propObject + member.offset, (byte *)current + member.offset, member.memberOffset);
         }
      }
   }
}

class PropertyInfo : struct
{
public:
   Property prop;
   bool disabled;
   FontResource font;
   const char * categoryName;
   DataMember subMember;
   Property subProperty;
   uint extraOffset;

   void OnDisplay(Surface surface, int x, int y, int width, Instance object, Alignment alignment, DataDisplayFlags displayFlags)
   {
      Property prop = this.prop;

      surface.TextFont(font.font);
      if(disabled)
      {
         surface.SetBackground(Color { 170, 170, 170 });
         surface.Area(0,0, x+width-1, y+100);
      }
      else if(prop && prop.dataTypeString)
      {
         Class dataType = prop.dataTypeClass;
         Module module = ((Designer)GetActiveDesigner()).codeEditor.privateModule;
         if(!dataType)
            dataType = prop.dataTypeClass = eSystem_FindClass(module, prop.dataTypeString);

         if(dataType && prop.Get)
         {
            void * dataPtr, * data = null, * subData = null;
            DataValue valueData, valueSubData;
            uint64 bitValue;

            // Get main prop
            if(dataType.type == structClass)
            {
               data = new0 byte[dataType.structSize];
               ((void (*)(void *, void *))(void *)prop.Get)(object, data);
               dataPtr = data;
            }
            else
            {
               GetProperty(prop, object, &valueData);

               if(dataType.type == normalClass)
                  dataPtr = valueData.p;
               else
                  dataPtr = &valueData;
            }

            // Get sub prop
            if(this.subMember)
            {
               DataMember member = this.subMember;
               Class subDataType = member.dataTypeClass;
               if(!subDataType)
                  subDataType = member.dataTypeClass = eSystem_FindClass(((Designer)GetActiveDesigner()).codeEditor.privateModule, member.dataTypeString);
               if(subDataType)
               {
                  if(dataType.type == bitClass)
                  {
                     BitMember bitMember = (BitMember)member;
                     bitValue = (valueData.i & bitMember.mask) >> bitMember.pos;
                     dataPtr = &bitValue;
                  }
                  else
                     dataPtr = (byte *)dataPtr + member.offset + this.extraOffset;
               }
               dataType = subDataType;
            }
            else if(this.subProperty)
            {
               Property subProperty = this.subProperty;
               Class subDataType = subProperty.dataTypeClass;
               if(!subDataType)
                  subDataType = subProperty.dataTypeClass = eSystem_FindClass(((Designer)GetActiveDesigner()).codeEditor.privateModule, subProperty.dataTypeString);
               if(!subProperty.Get) subDataType = null;
               if(subDataType)
               {
                  if(subDataType.type == structClass)
                  {
                     subData = new0 byte[subDataType.structSize];
                     ((void (*)(void *, void *))(void *)subProperty.Get)(dataPtr, subData);
                     dataPtr = subData;
                  }
                  else
                  {
                     GetProperty(subProperty, dataPtr, &valueSubData);
                     if(subDataType.type == normalClass)
                        dataPtr = valueSubData.p;
                     else
                        dataPtr = &valueSubData;
                  }
               }
               dataType = subDataType;
            }

            if(dataType)
               ((void (*)(void *, void *, void *, int, int, int, void *, uint, uint))(void *)dataType._vTbl[__ecereVMethodID_class_OnDisplay])(dataType, dataPtr, surface, x, y, width, null, alignment, displayFlags);

            delete data;
            delete subData;
         }
      }
   }

   Window OnEdit(DataBox dataBox, Window obsolete, int x, int y, int w, int h, void * unused)
   {
      Window editData = null;
      Property prop = this.prop;

      dataBox.SetData = Sheet::EditSetData;
      if(prop && prop.dataTypeString && !this.disabled)
      {
         Sheet propertyWindow = (Sheet)dataBox.master.master;
         Instance object = propertyWindow.object;
         Class dataType = prop.dataTypeClass;
         if(!dataType)
            dataType = prop.dataTypeClass = eSystem_FindClass(((Designer)GetActiveDesigner()).codeEditor.privateModule, prop.dataTypeString);

         if(dataType && prop.Get)
         {
            void * dataPtr, * data = null, * subData = null;
            DataValue valueData, valueSubData;
            uint64 bitValue;
            bool isEditBoxMultiLineContents = false;

            // Get main prop
            if(dataType.type == structClass)
            {
               data = new0 byte[dataType.structSize];
               ((void (*)(void *, void *))(void *)prop.Get)(object, data);
               dataPtr = data;
            }
            else
            {
               bool freeDataForm = false, freeDataTest = false;
               // Because contents property is broken for mutiline EditBox at the moment
               if(!strcmp(prop.name, "contents") && !strcmp(prop._class.name, "EditBox") && ((EditBox)object).multiLine)
               {
                  isEditBoxMultiLineContents = true;
                  dataType = eSystem_FindClass(((Designer)GetActiveDesigner()).codeEditor.privateModule, "MultiLineString");
                  valueData.p = ((EditBox)object).multiLineContents;
                  dataBox.size.h = 3*(h-2);
                  h = dataBox.clientSize.h;
               }
               else
                  GetProperty(prop, object, &valueData);

               if(dataType.type == normalClass)
                  dataPtr = valueData.p;
               else
                  dataPtr = &valueData;
            }

            // Get sub prop
            if(this.subMember)
            {
               DataMember member = this.subMember;
               Class subDataType = member.dataTypeClass;
               if(!subDataType)
                  subDataType = member.dataTypeClass = eSystem_FindClass(((Designer)GetActiveDesigner()).codeEditor.privateModule, member.dataTypeString);
               if(subDataType)
               {
                  if(dataType.type == bitClass)
                  {
                     BitMember bitMember = (BitMember)member;
                     bitValue = (valueData.i & bitMember.mask) >> bitMember.pos;
                     dataPtr = &bitValue;
                  }
                  else
                     dataPtr = (byte *)dataPtr + member.offset + this.extraOffset;
               }
               dataType = subDataType;
            }
            else if(this.subProperty)
            {
               Property subProperty = this.subProperty;
               Class subDataType = subProperty.dataTypeClass;
               if(!subDataType)
                  subDataType = subProperty.dataTypeClass = eSystem_FindClass(((Designer)GetActiveDesigner()).codeEditor.privateModule, subProperty.dataTypeString);
               if(!subProperty.Get) subDataType = null;
               if(subDataType)
               {
                  if(subDataType.type == structClass)
                  {
                     subData = new0 byte[subDataType.structSize];
                     ((void (*)(void *, void *))(void *)subProperty.Get)(dataPtr, subData);
                     dataPtr = subData;
                  }
                  else
                  {
                     GetProperty(subProperty, dataPtr, &valueSubData);
                     if(subDataType.type == normalClass)
                        dataPtr = valueSubData.p;
                     else
                        dataPtr = &valueSubData;
                  }
               }
               dataType = subDataType;
            }

            if(dataType)
               editData = ((Window (*)(void *, void *, DataBox, void *, int, int, int, int, void*))(void *)dataType._vTbl[__ecereVMethodID_class_OnEdit])(dataType, dataPtr, dataBox, obsolete,  x, y, w, h, object /*unused*/);

            delete data;
            delete subData;

            if(isEditBoxMultiLineContents)
               delete valueData.p;

            editData.font = { font.faceName, font.size, font.bold };
            if(eClass_IsDerived(editData._class, class(DropBox)))
            {
               DropBox db = (DropBox)editData;
               db.selectionColor = sheetSelectionColor;
               db.selectionText = sheetSelectionText;
            }
            else if(eClass_IsDerived(editData._class, class(EditBox)))
            {
               EditBox eb = (EditBox)editData;
               eb.selectionColor = sheetSelectionColor;
               eb.selectionText = sheetSelectionText;
            }
         }
      }
      return editData;
   }

   int OnCompare(PropertyInfo data2)
   {
      const char * category1 = prop ? prop.category : categoryName;
      const char * category2 = data2.prop ? data2.prop.category : data2.categoryName;
      int result;

      if(!category1) category1 = $"Misc";
      if(!category2) category2 = $"Misc";

      if(!prop)
      {
         result = String_OnCompare(&category1, &category2);
      }
      else
      //if(!result)
      {
         if(subMember && !data2.subMember)
         {
            result = 1;
         }
         else if(!subMember && data2.subMember)
         {
            result = 1;
         }
         else if(subMember && data2.subMember)
         {
            if(subMember.id < data2.subMember.id)
               result = -1;
            else if(subMember.id > data2.subMember.id)
               result = 1;
            else
               result = 0;
         }
         else if(subProperty && !data2.subProperty)
         {
            result = 1;
         }
         else if(!subProperty && data2.subProperty)
         {
            result = 1;
         }
         else if(subProperty && data2.subProperty)
         {
            if(subProperty.id < data2.subProperty.id)
               result = -1;
            else if(subProperty.id > data2.subProperty.id)
               result = 1;
            else
               result = 0;
         }
         else if(prop && !data2.prop)
            result = 1;
         else if(!prop && data2.prop)
            result = -1;
         else
            // result = ((String)prop.name).OnCompare(data2.prop.name);
            // result = String::OnCompare((String)prop.name, (String)data2.prop.name);
            result = String_OnCompare((const char **)&prop.name, (const char **)&data2.prop.name);
      }
      return result;
   }

   bool OnSaveEdit(Window editControl, void * unusedData)
   {
      Property prop = this.prop;
      if(prop)
      {
         Sheet sheet = (Sheet)editControl.master.master.master;
         Instance object = sheet.object;
         Class mainDataType = prop.dataTypeClass;
         Class dataType;
         bool result = false;
         void * dataPtr, * data = null, * subData = null;
         void * propObject = null;
         DataValue valueData { 0 };
         DataValue valueSubData { 0 };
         uint bitValue;

         if(!mainDataType)
            mainDataType = prop.dataTypeClass = eSystem_FindClass(((Designer)GetActiveDesigner()).codeEditor.privateModule, prop.dataTypeString);
         dataType = mainDataType;

         // Because contents property is broken for mutiline EditBox at the moment
         if(!strcmp(prop.name, "contents") && !strcmp(prop._class.name, "EditBox") && ((EditBox)object).multiLine)
            dataType = eSystem_FindClass(((Designer)GetActiveDesigner()).codeEditor.privateModule, "MultiLineString");

         // Prepare main prop
         if(dataType.type == structClass)
         {
            data = new0 byte[dataType.structSize];
            if(this.subMember || this.subProperty)
               ((void (*)(void *, void *))(void *)prop.Get)(object, data);
            dataPtr = data;
            propObject = data;
         }
         else if(dataType.type == normalClass || dataType.type == noHeadClass)
         {
            dataPtr = &valueData;

            if(this.subMember || this.subProperty)
            {
               Class _class;
               Instance current = (Instance)((void *(*)(void *))(void *)prop.Get)(object);
               propObject = valueData.p = eInstance_New(dataType);
               CopyInstanceData(dataType, propObject, current);
            }
         }
         else
         {

            if(this.subMember || this.subProperty)
               GetProperty(prop, object, &valueData);

            dataPtr = &valueData;
            propObject = &valueData;
         }

         // Prepare sub prop
         if(this.subMember)
         {
            DataMember member = this.subMember;
            Class subDataType = member.dataTypeClass;
            if(!subDataType)
               subDataType = member.dataTypeClass = eSystem_FindClass(((Designer)GetActiveDesigner()).codeEditor.privateModule, member.dataTypeString);
            if(subDataType)
            {
               if(dataType.type == bitClass)
                  dataPtr = &bitValue;
               else
                  dataPtr = (byte *)dataPtr + member.offset + this.extraOffset;
            }
            dataType = subDataType;
         }
         else if(this.subProperty)
         {
            Property subProperty = this.subProperty;
            Class subDataType = subProperty.dataTypeClass;

            if(!subDataType)
               subDataType = subProperty.dataTypeClass =
                  eSystem_FindClass(((Designer)GetActiveDesigner()).codeEditor.privateModule, subProperty.dataTypeString);
            if(!subProperty.Get) subDataType = null;
            if(subDataType)
            {
               if(subDataType.type == structClass)
               {
                  subData = new0 byte[subDataType.structSize];
                  dataPtr = subData;
               }
               else
                  dataPtr = &valueSubData;
            }
            dataType = subDataType;
         }

         if(dataType)
         {
            if(((bool (*)(void *, void *, Window, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnSaveEdit])(dataType, dataPtr, editControl, null))
            {
               if(mainDataType.type == bitClass && this.subMember)
               {
                  BitMember bitMember = (BitMember)this.subMember;
                  valueData.ui &= ~ (uint)bitMember.mask;
                  valueData.ui |= bitValue << bitMember.pos;
               }
               if(this.subProperty)
               {
                  if(dataType.type == structClass)
                     ((void (*)(void *, void *))(void *)this.subProperty.Set)(propObject, subData);
                  else if(dataType.type == unitClass || dataType.type == enumClass || dataType.type == bitClass || dataType.type == systemClass)
                  {
                     if(!strcmp(dataType.dataTypeString, "float"))
                        ((void(*)(void *,float))(void *)this.subProperty.Set)(propObject, valueSubData.f);
                     else if(!strcmp(dataType.dataTypeString, "double"))
                        ((void(*)(void *,double))(void *)this.subProperty.Set)(propObject, valueSubData.d);
                     else if(!strcmp(dataType.dataTypeString, "byte"))
                        ((void(*)(void *,byte))(void *)this.subProperty.Set)(propObject, valueSubData.uc);
                     else if(!strcmp(dataType.dataTypeString, "uint16"))
                        ((void(*)(void *,uint16))(void *)this.subProperty.Set)(propObject, valueSubData.us);
                     else
                        ((void (*)(void *, uint))(void *)this.subProperty.Set)(propObject, valueSubData.ui);
                  }
                  else
                     ((void (*)(void *, void *))(void *)this.subProperty.Set)(propObject, valueSubData.p);
               }
               if(mainDataType.type == structClass)
                  ((void (*)(void *, void *))(void *)prop.Set)(object, data);
               else if(mainDataType.type == unitClass || mainDataType.type == enumClass || mainDataType.type == bitClass || mainDataType.type == systemClass)
               {
                  if(!strcmp(mainDataType.dataTypeString, "float"))
                     ((void(*)(void *,float))(void *)prop.Set)(object, valueData.f);
                  else if(!strcmp(mainDataType.dataTypeString, "double"))
                     ((void(*)(void *,double))(void *)prop.Set)(object, valueData.d);
                  else if(!strcmp(mainDataType.dataTypeString, "byte"))
                     ((void(*)(void *,byte))(void *)prop.Set)(object, valueData.uc);
                  else if(!strcmp(mainDataType.dataTypeString, "uint16"))
                     ((void(*)(void *,uint16))(void *)prop.Set)(object, valueData.us);
                  else
                     ((void (*)(void *, uint))(void *)prop.Set)(object, valueData.ui);
               }
               else
                  ((void (*)(void *, void *))(void *)prop.Set)(object, valueData.p);

               result = true;
            }
            if(data == dataPtr)     ((void (*)(void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnFree])(dataType, &data);
            if(subData == dataPtr)  ((void (*)(void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnFree])(dataType, &subData);
         }
         delete data;
         delete subData;

         if(result)
            return sheet.SaveEdit(this, object);
      }
      return false;
   }
};

class Category : struct
{
   Category prev, next;
   const char * name;
   DataRow row;
   bool collapsed;
};
