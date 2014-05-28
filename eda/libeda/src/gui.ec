import "idList"

define sgs = 3; // screen sgs size
define shadowS = 4;

default:
extern int __ecereVMethodID_class_OnFree;
extern int __ecereVMethodID_class_OnGetString;
private:

const char * defaultNameField = "Name";
const char * defaultIdField = "Id";
const char * defaultActiveField = "Active";

public void SetDefaultIdField(char * value) { defaultIdField = value; }
public void SetDefaultNameField(char * value) { defaultNameField = value; }

public class ButtonStyle : Button
{
   font = { $"Arial", 10, bold = true };
   creationActivation = doNothing;
}

public class Group : Window
{
   size = { 84, 31 };
   tabCycle = true;
   //inactive = true; // TOFIX causes problems...

public:
   Label title { this, font = { $"Arial", 10, bold = true }, position = { 16, 2 } };

   bool OnCreate()
   {
      title.labeledWindow = this;
      return true;
   }

   void OnRedraw(Surface surface)
   {
      int x = clientSize.w - 1, y = clientSize.h - 1;

      surface.SetBackground(gray);

      surface.Rectangle(0, 10, x - shadowS, y - shadowS);
      surface.Area(shadowS / 2, y - shadowS + 1, x, y);
      surface.Area(x - shadowS + 1, 10 + shadowS / 2, x, y);

      surface.SetBackground(white);

      surface.Rectangle(10, 0, title.size.w + 22, title.size.h + 4);
      surface.Area(11, 1, title.size.w + 21, title.size.h + 3);
   }
}

public class CheckBool : bool
{
   Window OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)
   {
      Button button = dataBox.keepEditor ? (Button)obsolete : null;
      if(!button)
      {
         button = Button
         {
            dataBox, borderStyle = 0, text = dataBox.text, anchor = { 0, 0, 0, 0 },
            // size = { 100, 22 };
            modifyVirtualArea = false, isCheckbox = true;

            bool DataBox::NotifyClicked(Button control, int x, int y, Modifiers mods)
            {
               bool checked = control.checked;
               if(readOnly)
                  control.checked = !checked;
               else
                  SetData(&checked, false);
               return true;
            }
         };
      }
      button.checked = this;
      button.Create();
      return button;
   }
}

String GetNameString(Row r, Field nameField)
{
   String s = null;
   if(nameField.type != class(String) && nameField.type != class(char *))
   {
      char tempString[4096];
      Class type = nameField.type;
      int64 data = 0;
      if(type.type == structClass)
         data = (int64)new0 byte[type.structSize];
      ((bool (*)())(void *)r.GetData)(r, nameField, type, (type.type == structClass) ? (void *)data : &data);
      s = CopyString(((char *(*)(void *, void *, char *, void *, bool *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, (void *)data, tempString, null, null));
      ((void (*)(void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnFree])(type, (void *)data);
      if(type.type == structClass)
      {
         void * _data = (void *)data;
         delete _data;
      }
   }
   else
      r.GetData(nameField, s);
   return s;
}

public class TableDropBox : DropBox
{
   anchor = { left = 130, top = 180, right = shadowS + sgs * 2 };
   borderStyle = deep;

public:
   uint filter;
   bool filtered;
   Field nameField;
   uint exclusion;
   Table table;
   Field filterField;

   property uint filter
   {
      set
      {
         filter = value;
         filtered = true;
      }
      get { return filter; }
   }
   property Field nameField { set { nameField = value; } }
   property uint exclusion { set { exclusion = value; } }
   property Table table { set { table = value; if(!nameField && value) nameField = value.FindField(defaultNameField); } }

   virtual void Refill()
   {
      Clear();
      if(table)
      {
         Field fldId = table.FindField(defaultIdField);
         if(fldId && nameField)
         {
            Row r { table };
            if(filterField && filtered)
            {
               if(eClass_IsDerived(filterField.type, class(Id)))
               {
                  FieldIndex indexedFields[1];
                  // Table tbl = table.db.OpenTable(table.name, { tableRows });
                  const char * name = table.name;
                  Database db = table.db;
                  Table tbl = db.OpenTable(name, { tableRows });
                  if(tbl)
                  {
                     delete r;

                     indexedFields[0] = { filterField };
                     tbl.GenerateIndex(1, indexedFields, false);

                     r = Row { tbl };

                     for(r.Find(filterField, middle, nil, filter); !r.nil; r.Next()) //while(r.Next())
                     {
                        Id id;
                        Id idFilter;
                        r.GetData(filterField, idFilter);
                        r.GetData(fldId, id);
                        if(idFilter != filter)
                           break;
                        if(!exclusion || id != exclusion)
                        {
                           String s = GetNameString(r, nameField);
                           AddString(s).tag = id;
                           delete s;
                        }
                     }
                  }
               }
               else if(eClass_IsDerived(filterField.type, class(IdList)))
               {
                  while(r.Next())
                  {
                     Id id;
                     IdList idList;
                     r.GetData(filterField, idList);
                     r.GetData(fldId, id);
                     if(idList && idList.Includes(filter) && (!exclusion || !idList.Includes(exclusion)))
                     {
                        String s = GetNameString(r, nameField);
                        AddString(s).tag = id;
                        delete s;
                     }
                     delete idList;
                  }
               }
            }
            else if(exclusion)
            {
               while(r.Next())
               {
                  Id id;
                  r.GetData(fldId, id);
                  if(id != exclusion)
                  {
                     String s = GetNameString(r, nameField);
                     AddString(s).tag = id;
                     delete s;
                  }
               }
            }
            else
            {
               while(r.Next())
               {
                  Id id;
                  String s = GetNameString(r, nameField);
                  r.GetData(fldId, id);
                  AddString(s).tag = id;
                  delete s;
               }
            }
            delete r;
         }
      }
      Sort(null, 1);
   }

   property Field filterField { set { filterField = value; } }

   bool OnKeyHit(Key key, unichar ch)
   {
      if((SmartKey)key == del)
      {
         SelectRow(null); //currentRow = null;
         return false;
      }
      else if((SmartKey)key == enter)
         parent.CycleChildren(true, false, false, true);

      return DropBox::OnKeyHit(key, ch);
   }

   bool NotifySelect(DropBox dropBox, DataRow row, Modifiers mods)
   {
      modifiedDocument = true;
      return true;
   }

   bool OnCreate()
   {
      Refill();
      return true;
   }

   void EditNotifyCharsAdded()
   {
      if(!editBox.NotifyUpdate || editBox.NotifyUpdate == EditBox::NotifyUpdate)
         editBox.NotifyUpdate = EditNotifyUpdate;
   }

   void EditNotifyUpdate(EditBox editBox)
   {
      DataRow row;
      const char * contents = editBox.contents;
      int len = strlen(contents);
      if(len && editBox.charPos == len)
      {
         EditLine line = editBox.firstLine;
         int x1, x2;

         editBox.GetSelPos(null, null, &x1, null, null, &x2, false);
         if(x2 == x1)
         {
            for(row = firstRow; row; row = row.next)
            {
               const char * string = row.string;
               if(string && SearchString(string, 0, contents, false, false) == string)
               {
                  // SelectRow(row);
                  editBox.contents = row.string;
                  editBox.SetSelPos(line, 0, len, line, 0, strlen(string));
                  break;
               }
            }
         }
      }
      editBox.NotifyUpdate = null;
   }
}

public class DropDataBox : DataBox
{
   size.h = 24;
   keepEditor = true;
   borderStyle = deep;
   showNone = false; //true;

public:

   property uint filter { set { filtered = true; filter = value; } get { return filter; } }
   property bool filtered { set { filtered = value; } }
   property uint exclusion { set { exclusion = value; } }
   property Field filterField { set { filterField = value; } }
   property Field nameField { set { nameField = value; } }
   virtual void TableDropBox::RefillFunction();
   property bool showNone { set { showNone = value; } }

   void Refill()
   {
      if(editor)
      {
         TableDropBox dropBox = (TableDropBox) editor;
         uint id = data ? *(uint *)data : MAXDWORD;
         void * notifyChanged = (void *)NotifyChanged;

         OnConfigure(dropBox);

         NotifyChanged = null;
         dropBox.Refill();
         NotifyChanged = notifyChanged;

         if(id != MAXDWORD) dropBox.SelectRow(dropBox.FindSubRow(id));
      }
   }

   void OnConfigure(TableDropBox dropBox)
   {
      if(RefillFunction != DropDataBox::RefillFunction) dropBox.Refill = RefillFunction;
      if(nameField) dropBox.nameField = nameField;
      if(filterField) dropBox.filterField = filterField;
      if(filtered)
         dropBox.filter = filter;
      else
         dropBox.filtered = false;

      dropBox.exclusion = exclusion;
      dropBox.showNone = showNone;
   }

private:
   Field nameField;
   Field filterField;
   uint exclusion;
   uint filter;
   bool filtered;
   bool showNone;
}

public class EditDropDataBox : DropDataBox
{
   void OnConfigure(TableDropBox dropBox)
   {
      DropDataBox::OnConfigure(dropBox);
      dropBox.editText = true;
      dropBox.editBox.NotifyCharsAdded = (void *)TableDropBox::EditNotifyCharsAdded;
   }
}

public class FieldDataBox : DataBox
{
   size = { 100, 22 };
   anchor = { left = 110, right = shadowS + sgs * 2 };
   borderStyle = deep;

public:
   property Row row
   {
      set { row = value; }
      get { return row; }
   }
   property EditSection editor
   {
      set
      {
         parent = value.editArea;
         master = value;
         value.AddFieldEditor(this);
         row = value.editRow;
      }
   };

   property Field field
   {
      set
      {
         Class dataType;
         if(field) type = null;

         if(dataHolder)
         {
            ((void (*)(void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnFree])(type, (void *)dataHolder);
            if(type.type == structClass)
            {
               void * dataPtr = (void *)dataHolder;
               delete dataPtr;
            }
            dataHolder = 0;
         }

         field = value;
         dataType = value ? value.type : null;
         if(!text)
            text = field ? field.name : null;

         if(dataType && dataType.type == structClass)
         {
            dataHolder = (int64)new0 byte[dataType.structSize];
            data = (void *)dataHolder;
         }
         else if(dataType && (dataType.type == noHeadClass || dataType.type == normalClass))
         {
            if(eClass_IsDerived(dataType, class(String)))
               dataHolder = (int64)CopyString("");
            else
               dataHolder = (int64)eInstance_New(dataType);
            data = (void *)&dataHolder;
         }
         else
         {
            dataHolder = 0;
            data = &dataHolder;
         }
         if(!type) type = dataType;
      }
   }

   void Clear()
   {
      if(data)
         SetData(null, false);

      if(type && (type.type == noHeadClass || type.type == normalClass))
      {
         if(eClass_IsDerived(type, class(String)))
            dataHolder = (int64)CopyString("");
         else
            dataHolder = (int64)eInstance_New(type);
         data = (void *)&dataHolder;
      }

      if(created)
         Refresh();
   }

   void Load()
   {
      if(field && row)
      {
         SetData(null, false);
         master.modifiedDocument = false;

         ((bool (*)())(void *)Row::GetData)(row, field, field.type, data);

         if(!dataHolder && type && (type.type == noHeadClass || type.type == normalClass))
         {
            if(eClass_IsDerived(type, class(String)))
               dataHolder = (int64)CopyString("");
            else
               dataHolder = (int64)eInstance_New(type);
            data = (void *)&dataHolder;
         }

         // if(created)
         Refresh();
      }
   }

   virtual void Save()
   {
      bool result;
      if(field && row)
      {
         Class type = field.type;
         if(!DataBox::SaveData())
            Refresh();

         ((bool (*)())(void *)Row::SetData)(row, field, type,
            (type.type == noHeadClass || type.type == normalClass) ? *(void **)data : data);
      }
   }

   void Init()
   {
      if(created)
         Refresh();
   }

   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
      if(!active)
      {
         if(modifiedDocument && !DataBox::SaveData())
            Refresh();
      }
      return true;
   }

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

   bool OnKeyHit(Key key, unichar ch)
   {
      if((SmartKey)key == enter)
         parent.CycleChildren(true, false, false, true);

      return DataBox::OnKeyHit(key, ch);
   }

   bool Window::NotifyChanged(DataBox dataBox, bool closingDropDown)
   {
      modifiedDocument = true;
      return true;
   }

   bool Window::NotifyModified()
   {
      modifiedDocument = true;
      return true;
   }

   ~FieldDataBox()
   {
      if(data)
         SetData(null, false);

      if(dataHolder)
      {
         ((void (*)(void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnFree])(type, (void *)dataHolder);
         if(type.type == structClass)
         {
            void * dataPtr = (void *)dataHolder;
            delete dataPtr;
         }
         dataHolder = 0;
      }
   }

private:
   Field field;
   int64 dataHolder; // THERE SEEMS(ED?) TO BE A BUG WHEN ACCESSING row ACROSS .so
   Row row;
}

public class FieldCheckButton : FieldDataBox
{
   borderStyle = 0;
   type = class(CheckBool);
   // TOCHECK: When not here, the virtual area goes wild (anchor.right is not reset)
   position = { 0, 0 };
}

public class FieldDropDataBox : FieldDataBox
{
   size.h = 24;
   keepEditor = true;
   showNone = true;

public:
   property uint filter { set { filtered = true; filter = value; } get { return filter; } }
   property bool filtered { set { filtered = value; } }
   property uint exclusion { set { exclusion = value; } }
   property Field filterField { set { filterField = value; } }
   property Field nameField { set { nameField = value; } }
   virtual void TableDropBox::RefillFunction();
   property bool showNone { set { showNone = value; } }

   void Refill()
   {
      if(editor)
      {
         TableDropBox dropBox = (TableDropBox) editor;
         uint id = data ? *(uint *)data : MAXDWORD;
         OnConfigure(dropBox);
         dropBox.Refill();
         if(id != MAXDWORD) dropBox.SelectRow(dropBox.FindSubRow(id));
      }
   }

   void OnConfigure(TableDropBox dropBox)
   {
      if(RefillFunction != FieldDropDataBox::RefillFunction) dropBox.Refill = RefillFunction;
      if(nameField) dropBox.nameField = nameField;
      if(filterField) dropBox.filterField = filterField;
      if(filtered)
         dropBox.filter = filter;
      else
         dropBox.filtered = false;
      dropBox.exclusion = exclusion;
      dropBox.showNone = showNone;
   }

private:
   Field nameField;
   Field filterField;
   uint exclusion;
   uint filter;
   bool filtered;
   bool showNone;
}

public class EditFieldDropDataBox : FieldDropDataBox
{
   // showNone = false;
public:
   void OnConfigure(TableDropBox dropBox)
   {
      FieldDropDataBox::OnConfigure(dropBox);
      dropBox.editText = true;
      dropBox.editBox.NotifyCharsAdded = (void *)TableDropBox::EditNotifyCharsAdded;
   }

   void Save()
   {
      TableDropBox dropBox = (TableDropBox) editor;

      if(!dropBox.currentRow && dropBox.contents[0])
      {
         Row row { dropBox.table };
         Id sysID;
         OnAddTextEntry(row, dropBox, dropBox.contents);
         sysID = row.sysID;
         delete row;

         dropBox.Refill();
         dropBox.SelectRow(dropBox.FindSubRow(sysID));
      }
      FieldDataBox::Save();
   }

   virtual bool OnAddTextEntry(Row row, TableDropBox dropBox, const char * entry)
   {
      row.Add();
      row.SetData(dropBox.nameField, entry);
      return true;
   }
}

public class ListSection : Group
{
   text = $"List";
   size = { 710, 287 };
   anchor = { left = sgs, top = 32 + sgs * 3, bottom = 55 + sgs * 3 };
public:
   property EditSection editor
   {
      set
      {
         editor = value;
         value.list = this;
      }
   }

   property Table table
   {
      set
      {
         if(value)
         {
            table = value;
            if(table)
            {
               FieldIndex indexedFields[1];

               if(!fldId) fldId = table.FindField(defaultIdField);
               if(!fldName) fldName = table.FindField(defaultNameField);
               if(!fldActive) fldActive = table.FindField(defaultActiveField);

               indexedFields[0] = { fldId };
               table.Index(1, indexedFields);

               editor.editRow.tbl = table;

               RefillList();
            }
         }
      }
   }
   Field fldId, fldName, fldActive;

   virtual DialogResult Window::NotifySaveConfirmation(ListSection listSection)
   {
      return MessageBox { master = this, type = yesNoCancel, text = $"List Editor", contents = $"You have modified this entry. Would you like to save it before proceeding?" }.Modal();
   }

   bool OnClose(bool parentClosing)
   {
      if(editor && editor.modifiedDocument)
      {
         switch(NotifySaveConfirmation(master, this))
         {
            case cancel:
               return false;
            case yes:
               editor.EditSave();
            case no:
               editor.modifiedDocument = false;
               break;
         }
      }
      return true;
   }

   void RefillList()
   {
      list.Clear();
      //if(fldId && fldName)
      {
         Row r { table };
         NotifyRefillList(master, this, r);
         delete r;
      }
      list.Sort(null, 1);
      editor.modifiedDocument = false;
   }

   virtual void Window::NotifyRefillList(ListSection listSection, Row r)
   {
      if(listSection.fldId && listSection.fldName)
      {
         bool stringName = !strcmp(listSection.fldName.type.dataTypeString, "char *");
         while(r.Next())
         {
            Id id = 0;
            String s = null;
            r.GetData(listSection.fldId, id);
            if(stringName)
               r.GetData(listSection.fldName, s);
            else
               s = PrintString("Entry ", id);
            listSection.list.AddString(s).tag = id;
            delete s;
         }
      }
   }

   virtual bool Window::NotifyNew(ListSection listSection, Row r);

   ButtonStyle btnNew
   {
      this, anchor = { right = shadowS + sgs * 2, top = 24 }, hotKey = altW, text = $"New";

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         list.NotifySelect(this, list, null, 0);
         if(!editor.modifiedDocument)
         {
            uint id; // = table.rowsCount + 1; // this is bad with deleted rows, won't work, how to have unique id?
            Row r { table };

            if(r.Last())   // this will reuse ids in cases where the item(s) with the last id have been deleted
            {
               r.GetData(fldId, id);
               id++;
            }
            else
               id = 1;

            editor.EditClear();
            {
               bool active = true;
               r.Add();
               {
                  // Patch for SQLite driver which auto-increments IDs
                  int curID = 0;
                  if(r.GetData(fldId, curID))
                     id = curID;
                  else
                     r.SetData(fldId, id);
               }
               if(!strcmp(fldName.type.dataTypeString, "char *"))
                  r.SetData(fldName, $"[New]");

               if(fldActive)
                  r.SetData(fldActive, active);

               if(NotifyNew(master, this, r))
                  list.currentRow = list.AddString($"[New]");
               delete r;
            }

            list.Sort(null, 1);
            list.currentRow.tag = id;
            SelectListRow(list.currentRow);
            RefreshState();
         }
         return true;
      }
   };

   virtual bool Window::NotifyDeleteConfirmation(ListSection listSection)
   {
      return MessageBox {  master = this, type = yesNo, text = $"List Editor",
                           contents =  $"You are about to delete an entry.\n"
                                        "Do you wish to continue?"
                  }.Modal() == yes;
   }

   virtual void Window::NotifyDeleting(ListSection listSection);
   virtual void Window::NotifyDeleted(ListSection listSection);

   ButtonStyle btnDelete
   {
      this, anchor = { right = shadowS + sgs * 2, top = 24 }, hotKey = altD, text = $"Delete";

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(list.currentRow)
         {
            if(NotifyDeleteConfirmation(master, this))
            {
               NotifyDeleting(master, this);

               editor.editRow.Delete();
               list.DeleteRow(list.currentRow);
               editor.EditClear();

               NotifyDeleted(master, this);

               SelectListRow(list.currentRow);
               RefreshState();
            }
         }
         return true;
      }
   };

   bool FilterNotifyChanged(DataBox dataBox, bool closeDropDown)
   {
      editor.EditClear();
      RefillList();
      if(list.firstRow)
         SelectListRow(list.firstRow);
      RefreshState();
      return true;
   }

   ListBox list
   {
      this, anchor = { left = sgs * 2, top = 22 + 22 + sgs * 4, right = shadowS + sgs * 2, bottom = shadowS + sgs * 2 };
      alwaysHighLight = true;

      bool NotifySelect(ListBox listBox, DataRow row, Modifiers mods)
      {
         bool result = true;
         if(/*row && */row != lastRow)
         {
            uint id;
            if(editor.modifiedDocument)
            {
               if(row)
                  list.currentRow = lastRow;
               result = false;
               switch(NotifySaveConfirmation(master, this))
               {
                  case cancel:
                     return false;
                  case yes:
                     editor.EditSave();
                  case no:
                     editor.modifiedDocument = false;
                     list.currentRow = row;
                     break;
               }
            }
            SelectListRow(row);
         }
         return result;
      }
   };

   virtual void Window::NotifySelectListRow(ListSection listSection, uint64 id);

   void SelectListRow(DataRow row)
   {
      // Time startTime = GetTime();
      if(row)
      {
         uint64 id = row.tag;
         lastRow = row;

         if(list.currentRow != row)
            list.currentRow = row;
         if(editor.editRow.Find(fldId, middle, nil, id))
         {
            editor.listRow = row;
            NotifySelectListRow(master, this, id);
            editor.EditLoad();
         }
      }
      // Logf("SelectListRow took %f seconds\n", GetTime() - startTime);
   }

   void SelectFirst()
   {
      if(list.firstRow)
         SelectListRow(list.firstRow);
      RefreshState();
   }

   void RefreshState()
   {
      if(editor)
      {
         editor.btnSave.disabled = !(bool)list.currentRow;
         editor.btnReload.disabled = !(bool)list.currentRow;
         btnDelete.disabled = !(bool)list.currentRow;
         editor.disabled = !(bool)list.firstRow;
      }
   }

   void OnResize(int width, int height)
   {
      int x = width - btnDelete.size.w - 20;

      btnDelete.position.x = x;
      if(btnNew.visible)
         btnNew.position.x = x = x - btnNew.size.w - sgs * 2;
   }

   bool OnPostCreate(void)
   {
      OnResize(clientSize.w, clientSize.h);
      SelectFirst();
      if(editor) editor.modifiedDocument = false;
      return Window::OnPostCreate();
   }

private:
   EditSection editor;
   Table table;
   DataRow lastRow;
}

public class EditSection : Group
{
   tabCycle = true;
   text = $"Entry";
   size = { 710, 55 };
   anchor = { right = sgs, top = 32 + sgs * 3, bottom = 55 + sgs * 3 };

   ~EditSection()
   {
      editBoxes.Free(null);
   }

public:
   ListSection list;

   property Table table
   {
      set
      {
         if(value)
         {
            table = value;
            InitFields();
         }
      }
   }
   Table table;

   Row editRow { };
   DataRow listRow;
   OldList editBoxes { };

   Window editArea { this, borderStyle = deep, tabCycle = true, anchor = { left = 8, top = 54, right = 10, bottom = 10 }, hasVertScroll = true, dontHideScroll = true };

   ButtonStyle btnSave
   {
      this, anchor = { right = shadowS + sgs * 2, top = 24 }, hotKey = altV, text = $"Save";

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         EditSave();
         return true;
      }
   };

   ButtonStyle btnReload
   {
      this, anchor = { left = 10, top = 24 }, hotKey = altV, text = $"Revert";

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         EditLoad();
         return true;
      }
   };


   void AddFieldEditor(FieldDataBox box)
   {
      editBoxes.Add(OldLink { data = box });
   }

   virtual void Window::NotifyInitFields(EditSection editSection);

   void InitFields()
   {
      OldLink link;
      for(link = editBoxes.first; link; link = link.next)
      {
         FieldDataBox dataBox = link.data;
         dataBox.Init();
      }
      NotifyInitFields(master, this);
   }

   void EditNew()
   {
      modifiedDocument = false;
   }

   virtual void Window::NotifyEditSave(EditSection edit, String name)
   {
      edit.listRow.string = name;
   }

   void EditSave()
   {
      bool stringName = !strcmp(list.fldName.type.dataTypeString, "char *");
      OldLink link;
      String name = null;

      editRow.tbl.db.Begin();
      for(link = editBoxes.first; link; link = link.next)
      {
         FieldDataBox dataBox = link.data;
         dataBox.Save();
      }
      editRow.tbl.db.Commit();
      // ADDED THIS HERE FOR SQLITE TO REFRESH
      editRow.Find(list.fldId, middle, nil, list.list.currentRow.tag);

      if(stringName)
         editRow.GetData(list.fldName, name);
      else
         name = PrintString("Entry ", list.list.currentRow.tag);

      NotifyEditSave(master, this, name);
      delete name;
      list.list.Sort(null, 1);
      list.list.currentRow = list.list.currentRow;

      modifiedDocument = false;
   }

   virtual void Window::NotifyEditLoad(EditSection editSection);

   void EditLoad()
   {
      OldLink link;
      for(link = editBoxes.first; link; link = link.next)
      {
         FieldDataBox dataBox = link.data;
         dataBox.Load();
      }
      NotifyEditLoad(master, this);

      modifiedDocument = false;
   }

   virtual void Window::NotifyEditClear(EditSection editSection);

   void EditClear()
   {
      OldLink link;
      for(link = editBoxes.first; link; link = link.next)
      {
         FieldDataBox dataBox = link.data;
         editRow.Select(nil);
         dataBox.Clear();
      }
      NotifyEditClear(master, this);
      modifiedDocument = false;
   }

   bool OnPostCreate()
   {
      // TO CHECK: Why is there a jump in the scroll thumb size when this is not here?
      anchor = anchor;

      modifiedDocument = false;
      return true;
   }
}
