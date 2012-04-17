#include <stdarg.h>

import "idList"

import "FieldBox"

default:

extern int __ecereVMethodID_class_OnFree;
extern int __ecereVMethodID_class_OnGetDataFromString;

private:

#ifdef _DEBUG
#define _DEBUG_LINE
#endif

//#define FULL_STRING_SEARCH

#define UTF8_IS_FIRST(x)   (__extension__({ byte b = x; (!(b) || !((b) & 0x80) || ((b) & 0x40)); }))
#define UTF8_NUM_BYTES(x)  (__extension__({ byte b = x; (b & 0x80 && b & 0x40) ? ((b & 0x20) ? ((b & 0x10) ? 4 : 3) : 2) : 1; }))

// all methods currently perform ascii conversion and all that jazz on every string added to the index
public enum StringSearchIndexingMethod { fullString, allSubstrings };
public class StringSearchField
{
public:
   Field field;
   StringSearchIndexingMethod method;
};

define newEntryStringDebug = $"New|id=";
define newEntryString = $"New";

public class TableEditor : public Window
{
   bool initialized;
public:
   property Table table
   {
      set
      {
         DebugLn("TableEditor::table|set");
         table = value;
      }
   }
   Table table;

   bool OnPostCreate()
   {
      DebugLn("TableEditor::OnPostCreate");
      if(table)
      {
         if(!initialized)
         {
            ResetListFields();
            if(searchFields)
            {
               char name[MAX_FILENAME];
               sprintf(name, "%s.search", table.name);
               PrepareWordList(name);
            }
            InitFieldsBoxes(); // IMPORTANT: table must be set *AFTER* all related FieldEditors have been initialized
            {
               Field fldId = idField, fldName = stringField, fldActive = null;
               FieldIndex indexedFields[1];
               if(!idField) fldId = table.FindField(defaultIdField);
               if(!fldName) fldName = table.FindField(defaultNameField);
               if(!fldActive) fldActive = table.FindField(defaultActiveField);
               indexedFields[0] = { fldId };
               table.Index(1, indexedFields);
               editRow.tbl = table;
               {
                  char name[MAX_FILENAME];
                  sprintf(name, "%s.search", table.name);
                  PrepareWordList(name);
               }
            }
            initialized = true;
            OnInitizlize();
         }
         if(!listEnumerationCompleted)
            Enumerate();
         if(list && !list.currentRow)
            list.SelectRow(list.firstRow); // should the tableeditor select method be used here?
      }
      return true;
   }

   bool OnClose(bool parentClosing)
   {
      bool result = NotifyClosing();
      if(result)
      {
         EditClear();
      }
      return result;
   }

   // List
   property ListBox list
   {
      set
      {
         DebugLn("TableEditor::list|set");
         list = value;
         //ResetListFields();
      }
   }
   ListBox list;
   Field idField;
   Field stringField;
   property Array<ListField> listFields
   {
      set
      {
         DebugLn("TableEditor::listFields|set");
         listFields = value;
         //ResetListFields();
      }
   }
   Array<ListField> listFields;
   int listSortOrder;
   DataField listSortField;
   bool disabledFullListing;
   property Array<StringSearchField> searchFields
   {
      set
      {
         DebugLn("TableEditor::searchFields|set");
         searchFields = value;
      }
   }
   Array<StringSearchField> searchFields;
   property String searchString
   {
      set
      {
         bool modified = modifiedDocument;
         DebugLn("TableEditor::searchString|set");
         switch(modified ? OnLeavingModifiedDocument() : no)
         {
            case cancel:
               break;
            case yes:
               EditSave();
            case no:
               if(modified)
                  EditLoad();
               delete searchString;
               if(value && value[0])
                  searchString = CopyString(value);
               Enumerate();
               break;
         }
      }
   }
   String searchString;

   Array<LookupField> dynamicLookupFields;
   property Array<LookupField> dynamicLookupFields
   {
      set
      {
         DebugLn("TableEditor::dynamicLookupFields|set");
         dynamicLookupFields = value;
      }
   }

   // Fields Editor
   property Id selectedId { get { return selectedId; } }

   Array<FieldBox> fieldsBoxes { };
   Array<TableEditor> tableEditors { };
   Array<TableEditor> dynamicLookupTableEditors { };

   bool readOnly;
   
   public virtual void OnInitizlize();
   public virtual void OnLoad();
   public virtual void OnStateChanged();
   bool internalModifications;
   public void NotifyModifiedDocument()
   {
      DebugLn("TableEditor::NotifyModifiedDocument");
      if(!internalModifications)
         OnStateChanged();
   }

   //public virtual bool Window::NotifyNew(AltListSection listSection, Row r);
   //virtual void Window::NotifyInitFields(AltEditSection editSection);
   
   public virtual DialogResult OnLeavingModifiedDocument()
   {
      DebugLn("TableEditor::OnLeavingModifiedDocument");
      return MessageBox { master = this, type = yesNoCancel, text = text && text[0] ? text : $"Table Editor",
                          contents = $"You have modified this entry. Would you like to save it before proceeding?"
                  }.Modal();
   }
   
   public virtual bool OnRemovalRequest()
   {
      DebugLn("TableEditor::OnRemovalRequest");
      return MessageBox { master = this, type = yesNo, text = text && text[0] ? text : $"Table Editor",
                          contents =  $"You are about to permanently remove an entry.\n"
                                       "Do you wish to continue?"
                  }.Modal() == yes;
   }

   //public virtual void Window::NotifyDeleting(ListSection listSection);
   //public virtual void Window::NotifyDeleted(ListSection listSection);

   public bool NotifyClosing()
   {
      bool result = true;
      DebugLn("TableEditor::NotifyClosing");
      if(modifiedDocument)
      {
         switch(OnLeavingModifiedDocument())
         {
            case cancel:
               result = false;
               break;
            case yes:
               EditSave();
            case no:
               EditLoad();
               break;
         }
      }
      if(result)
         listEnumerationTimer.Stop();
      return result;
   }

   //public void List() // this gets called out of nowhere by some constructor thing...
   public void Enumerate()
   {
      DebugLn("TableEditor::Enumerate");
      if(list)
      {
         listEnumerationTimer.Stop();
         list.Clear();
         EditClear();
         {
            Row r { table };
            Array<Id> matches = SearchWordList();
            OnList(r, matches);
            delete matches;
            delete r;
         }
      }
      modifiedDocument = false; // setting this here is not really logical, enumeration and modified have nothing to do with eachother
   }

   virtual void OnList(Row r, Array<Id> matches)
   {
      DebugLn("TableEditor::OnList");
      listEnumerationCompleted = false;
      listEnumerationIndex = 0;
      listEnumerationRow = Row { r.tbl };
      listEnumerationMatches = matches;
      listEnumerationTimer.Start();
   }

   virtual void OnCreateDynamicLookupEditors()
   {
      DebugLn("TableEditor::OnCreateLookupEditors");
      if(dynamicLookupFields && dynamicLookupFields.count)
      {
         for(f : dynamicLookupFields)
         {
            if(f.editorClass && f.parentWindow)
            {
               Row row { tbl = f.lookupTable };
               // todo: make this work for all types
               uint id = 0;
               editRow.GetData(f.field, id);
               for(row.Find(f.lookupField, middle, nil, id); !row.nil; row.Next())
               {
                  // todo: make this work for all types, although this is meant to be an id field
                  uint id = 0;
                  TableEditor editor = eInstance_New(f.editorClass);
                  incref editor;
                  editor.parent = f.parentWindow;
                  editor.master = this;
                  dynamicLookupTableEditors.Add(editor);
                  editor.Create();
                  row.GetData(f.lookupIdField, id);
                  editor.Select(id);
               }
               delete row;
            }
         }
      }
   }

   TableEditor masterEditor;

   public property TableEditor masterEditor
   {
      set
      {
         if(value != masterEditor)
         {
            if(masterEditor)
               masterEditor.RemoveTableEditor(this);
            masterEditor = value;
            if(value)
               value.AddTableEditor(this);
         }
      }
   }

   watch(parent)
   {
      if(eClass_IsDerived(parent._class, class(TableEditor)))
         property::masterEditor = (TableEditor)parent;
   };

   watch(master)
   {
      if(eClass_IsDerived(master._class, class(TableEditor)))
         property::masterEditor = (TableEditor)master;
   };

   void CreateRow()
   {
      DebugLn("TableEditor::CreateRow");
      //list.NotifySelect(this, list, null, 0);
      if(!modifiedDocument)
      {
         uint id; // = table.rowsCount + 1; // this is bad with deleted rows, won't work, how to have unique id? 
                               // I think the 3 following comment lines apply to the old sqlite driver before many fix we done for wsms
         Row r = editRow;// { table }; // the multipurpose row is buggy with sqlite driver, you can't use the same row to do Row::Last(), Row::Next(), Row::Find(), etc...
         //Row r { editRow.tbl };                    // for example, Row::Last() here is not using the proper sqlite statement and fails to
                                                   // return false when no rows are present in a table
         DataRow row = null;
         String newText;

         /*uint count = editRow.tbl.GetRowsCount();

         id = 0;
         // r.Last() is returning true even if there are not rows in this table (SQLite)
         if(count && !(r.Last() || r.Last()))
            DebugLn("PROBLEM");*/
         if(r.Last())   // this will reuse ids in cases where the item(s) with the last id have been deleted
         {
            r.GetData(idField, id);
            id++;
         }
         else
            id = 1;

         EditClear();
         {
            bool active = true;
            r.Add();
            {
               // Patch for SQLite driver which auto-increments IDs
               int curId = 0;
               if(r.GetData(idField, curId))
                  id = curId;
               else
                  r.SetData(idField, id);
            }
            /*if(fldActive)
               r.SetData(fldActive, active);*/

#ifdef _DEBUG
            newText = PrintString("[", newEntryStringDebug, id, "]");
#else
            newText = PrintString("[", newEntryString, "]");
#endif

            //if(NotifyNew(master, this, r))
            if(listFields && idField)
            {
               for(lf : listFields)
               {
                  if(lf.dataField && lf.field)
                  {
                     if(lf.field.type == class(String))
                        r.SetData(lf.field, newText);
                     else // this whole block is new?
                     {
                        if(lf.field.type._vTbl[__ecereVMethodID_class_OnGetDataFromString])
                        {
                           Class dataType = lf.field.type;
                           int64 dataHolder = 0;
                           void * data = &dataHolder;

                           if(dataType && dataType.type == structClass)
                           {
                              dataHolder = (int64)new0 byte[dataType.structSize];
                              data = (void *)dataHolder;
                           }
                           /*else if(dataType && (dataType.type == noHeadClass || dataType.type == normalClass))
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
                           }*/
                           if(data)
                              dataType._vTbl[__ecereVMethodID_class_OnGetDataFromString](dataType, data, newText);


                           /*dataType._vTbl[__ecereVMethodID_class_OnFree](dataType, dataHolder);
                           if(dataType.type == structClass)
                           {
                              void * dataPtr = (void *)dataHolder;
                              delete dataPtr;
                           }
                           dataHolder = 0;*/
                        }
                     }
                  }
               }
               if(list)
               {
                  row = list.AddRow();
                  row.tag = id;
                  // have a better technique than Row::Next(); Row::Find(...); to make sure Row::GetData() will work right after a Row::SetData()?
                  // it seems we're missing Row::Update()
                  //r.Next();
                  //r.tbl.db.Commit();
                  //editRow.Synch(r);
                  //r.Last();
                  // next line is a patch for SQLite not returning data from GetData right after a SetData
                  if(idField && r.Find(idField, middle, nil, id))
                     SetListRowFields(r, row, false);
               }
            }
            else if(idField && stringField)
            {
               r.SetData(stringField, newText);
               if(list)
               {
                  row = list.AddString(newText);
                  row.tag = id;
               }
            }
            //delete r;
            delete newText;
         }

         if(list)
         {
            list.Sort(listSortField, listSortOrder);
            if(row) SelectListRow(row);
         }
         OnStateChanged();
      }
   }

   void Remove()
   {
      DebugLn("TableEditor::Remove");
      if(editRow.sysID) //list && list.currentRow)
      {
         if(OnRemovalRequest())
         {
            editRow.Delete();
            if(list)
               list.DeleteRow(list.currentRow);
            EditClear();
            //NotifyDeleted(master, this);
            if(list)
               SelectListRow(list.currentRow);
            OnStateChanged();
         }
      }
   }

   void Load()
   {
      DebugLn("TableEditor::Load");
      EditLoad();
   }

   void Write()
   {
      DebugLn("TableEditor::Write");
      EditSave();
   }

   bool ListSelect(DataRow row)
   {
      bool result = true;
      DebugLn("TableEditor::ListSelect");
      if(/*-row && -*/row != lastRow)
      {
         uint id;
         if(modifiedDocument)
         {
            if(row)
               list.currentRow = lastRow;
            result = false;
            switch(OnLeavingModifiedDocument())
            {
               case cancel:
                  break;
               case yes:
                  EditSave();
               case no:
                  EditClear();
                  list.currentRow = row;
                  break;
            }
         }
         if(list.currentRow == row)
            SelectListRow(row);
      }
      return result;
   }

   bool Select(Id id)
   {
      bool result;
      DebugLn("TableEditor::Select");
      if(idField && editRow.Find(idField, middle, nil, id))
      {
         //Id test = editRow.sysID;
         selectedId = editRow.sysID;
         EditLoad();
         result = true;
      }
      else
         result = false;
      return result;
   }

   bool SelectNext()
   {
      bool result;
      DebugLn("TableEditor::SelectNext");
      // How about confirmation / saving before changing the entry?
      if(editRow.Next())
      {
         //Id test = editRow.sysID;
         selectedId = editRow.sysID;
         EditLoad();
         result = true;
      }
      else
      {
         result = false;
         // Wrap around after 2 Next if commented out (1st time could inform user of reaching the end)
         // The first Next() bring the row to a null row (rowID = 0), a Next() on a rowID = 0 starts at first row
         //editRow.Previous();
      }
      return result;
   }
   
   bool SelectPrevious()
   {
      bool result;
      DebugLn("TableEditor::SelectPrevious");
      if(editRow.Previous())
      {
         //Id test = editRow.sysID;
         selectedId = editRow.sysID;
         EditLoad();
         result = true;
      }
      else
      {
         result = false;
         // Wrap around after 2 Prev if commented out (1st time could inform user of reaching the end)
         // The first Prev() bring the row to a null row (rowID = 0), a Prev() on a rowID = 0 starts at last row
         //editRow.Next();
      }
      return result;
   }
   
   void SelectListRow(DataRow row)
   {
      // Time startTime = GetTime();
      DebugLn("TableEditor::SelectListRow");
      if(row)
      {
         selectedId = row.tag;
         lastRow = row;

         if(list.currentRow != row)
            list.currentRow = row;
         if(idField && editRow.Find(idField, middle, nil, selectedId))
         {
            //Id test = editRow.sysID;
            listRow = row;
            //NotifySelectListRow(master, this, selectedId);
            EditLoad();
         }
      }
      // Logf("SelectListRow took %f seconds\n", GetTime() - startTime);
   }

private:
   Row editRow { };
   DataRow listRow;
   DataRow lastRow;
   Id selectedId;

   bool listEnumerationCompleted;
   int listEnumerationIndex;
   Array<Id> listEnumerationMatches;
   Row listEnumerationRow;

   Timer listEnumerationTimer
   {
      userData = this, delay = 0.1f;
      bool DelayExpired()
      {
         bool next = false;
         if(listEnumerationMatches)
         {
            if(listFields && idField)
            {
               int c;
               for(c = 0; c<100 && (next = listEnumerationRow.Next()); c++)
               for(c=0; c<100 && (next = listEnumerationIndex++<listEnumerationMatches.count); c++)
               {
                  if(listEnumerationRow.Find(idField, middle, nil, listEnumerationMatches[listEnumerationIndex]))
                  {
                     Id id = 0;
                     DataRow row = list.AddRow();
                     listEnumerationRow.GetData(idField, id);
                     row.tag = id;
                     SetListRowFields(listEnumerationRow, row, true);

                  }
                  else
                     DebugLn($"WordList match cannot be found in database.");
               }
            }
            else if(idField && stringField)
            {
               int c;
               for(c = 0; c<100 && (next = listEnumerationRow.Next()); c++)
               for(c=0; c<100 && (next = listEnumerationIndex++<listEnumerationMatches.count); c++)
               {
                  if(listEnumerationRow.Find(idField, middle, nil, listEnumerationMatches[listEnumerationIndex]))
                  {
                     Id id = 0;
                     String s = null;
                     listEnumerationRow.GetData(idField, id);
                     listEnumerationRow.GetData(stringField, s);
                     list.AddString(s).tag = id;
                     delete s;
                  }
                  else
                     DebugLn($"WordList match cannot be found in database.");
               }
            }
         }
         else if(!disabledFullListing)
         {
            if(listFields && idField)
            {
               int c;
               for(c = 0; c<100 && (next = listEnumerationRow.Next()); c++)
               {
                  Id id = 0;
                  DataRow row = list.AddRow();
                  listEnumerationRow.GetData(idField, id);
                  row.tag = id;
                  SetListRowFields(listEnumerationRow, row, true);
                  //Update(null);
                  app.UpdateDisplay();
               }
            }
            else if(idField && stringField)
            {
               int c;
               for(c = 0; c<100 && (next = listEnumerationRow.Next()); c++)
               {
                  Id id = 0;
                  String s = null;
                  listEnumerationRow.GetData(idField, id);
                  listEnumerationRow.GetData(stringField, s);
                  list.AddString(s).tag = id;
                  delete s;
               }
            }
         }

         list.Sort(listSortField, listSortOrder);

         if(!next)
         {
            listEnumerationCompleted = true;
            listEnumerationTimer.Stop();
         }
         return true;
      }
   };

   ~TableEditor()
   {
      DebugLn("TableEditor::~()");
      fieldsBoxes.Free(); // TOCHECK: do I need to delete each to oppose the increb in AddFieldBox?
      delete searchString;
      wordTree.Free();

      delete listFields;
      delete searchFields;
   }

   void ResetListFields()
   {
      DebugLn("TableEditor::ResetListFields");
      if(list && listFields && listFields.count)
      {
         bool c = list.created;
         list.ClearFields();
         for(lf : listFields)
         {
            list.AddField(lf.dataField);
            incref lf.dataField;
         }
      }
   }

   void AddTableEditor(TableEditor tableEditor)
   {
      DebugLn("TableEditor::AddTableEditor");
      if(!tableEditors.Find(tableEditor))
      {
         tableEditors.Add(tableEditor);
         incref tableEditor;
      }
      else
         DebugLn("   TableEditor instance already added");
   }

   void RemoveTableEditor(TableEditor tableEditor)
   {
      Iterator<TableEditor> it { tableEditors };
      DebugLn("TableEditor::RemoveTableEditor");
      if(it.Find(tableEditor))
      {
         it.Remove(); // tableEditors.Remove(it.pointer); // <-- any reason why we would want to do that instead?
      }
      else
         DebugLn("   TableEditor instance not found, no need to remove");
   }

   void AddFieldBox(FieldBox fieldBox)
   {
      DebugLn("TableEditor::AddFieldBox");
      if(!fieldsBoxes.Find(fieldBox))
      {
         fieldsBoxes.Add(fieldBox);
         if(table)
            fieldBox.Init();
         incref fieldBox;
      }
      else
         DebugLn("   FieldBox instance already added");
   }

   void RemoveFieldBox(FieldBox fieldBox)
   {
      Iterator<FieldBox> it { fieldsBoxes };
      DebugLn("TableEditor::RemoveFieldBox");
      if(it.Find(fieldBox))
      {
         it.Remove(); // fieldsBoxes.Remove(it.pointer); // <-- any reason why we would want to do that instead?
      }
      else
         DebugLn("   FieldBox instance not found, no need to remove");
   }

   void InitFieldsBoxes()
   {
      DebugLn("TableEditor::InitFieldsBoxes");
      if(readOnly)
      {
         for(fb : fieldsBoxes)
         {
            fb.readOnly = true;
            fb.Init();
         }
      }
      else
      {
         for(fb : fieldsBoxes)
            fb.Init();
      }
      //NotifyInitFields(master, this);
   }

   void EditNew()
   {
      DebugLn("TableEditor::EditNew");

      modifiedDocument = false;
   }

   void EditSave()
   {
      DebugLn("TableEditor::EditSave");
      internalModifications = true;
      for(fb : fieldsBoxes)
         fb.Save();

      if(idField && list && listFields && listFields.count)
      {
         DataRow listRow = list.currentRow;
         // ADDED THIS HERE FOR SQLITE TO REFRESH
         editRow.Find(idField, middle, nil, listRow.tag);
         SetListRowFields(editRow, listRow, false);
         list.Sort(listSortField, listSortOrder);
      }
      internalModifications = false;

      for(te : tableEditors)
         te.EditSave();

      modifiedDocument = false;
      OnStateChanged();
   }

   void EditLoad()
   {
      DebugLn("TableEditor::EditLoad");
      EditClear();
      OnLoad();
      internalModifications = true;
      for(fb : fieldsBoxes)
         fb.Load();
      OnCreateDynamicLookupEditors();
      internalModifications = false;

      DebugLn("   TODO: implement virtual method TableEditor::OnSubEditorsLoad");

      modifiedDocument = false;
      OnStateChanged();
   }

   void EditClear()
   {
      DebugLn("TableEditor::EditClear");
      internalModifications = true;
      for(fb : fieldsBoxes)
         fb.Clear();
      for(e : dynamicLookupTableEditors)
      {
         e.visible = false;
         e.parent = null;
         e.master = null;
         e.Destroy(0);
         delete e;
      }
      dynamicLookupTableEditors.Free();
      //dynamicLookupTableEditors.size = 0;
      internalModifications = false;

      DebugLn("   TODO: remove all sub table editors");

      modifiedDocument = false;
      OnStateChanged();
   }

   void SetListRowFields(Row dbRow, DataRow listRow, bool restoreSelection)
   {
//      DebugLn("TableEditor::SetListRowFields");
      for(lf : listFields)
      {
         if(lf.dataField && lf.field)
         {
            if(eClass_IsDerived(lf.field.type, class(String)))
            {
               String s = null;
               dbRow.GetData(lf.field, s);
               listRow.SetData(lf.dataField, s);
               delete s;
            }
            else if(eClass_IsDerived(lf.field.type, class(Id)))
            {
               if(lf.CustomLookup)
               {
                  Id id = 0;
                  String s = null;
                  dbRow.GetData(lf.field, id);
                  s = lf.CustomLookup(id);
                  listRow.SetData(lf.dataField, s);
                  delete s; // ?
               }
               else if(lf.lookupTable && lf.lookupField && lf.lookupValueField &&
                     eClass_IsDerived(lf.lookupField.type, class(Id)) &&
                     eClass_IsDerived(lf.lookupValueField.type, class(String)))
               {
                  Id id = 0;
                  String s = null;
                  Row lookupRow { lf.lookupTable };
                  dbRow.GetData(lf.field, id);
                  if(lookupRow.Find(lf.lookupField, middle, nil, id))
                     lookupRow.GetData(lf.lookupValueField, s);
                  listRow.SetData(lf.dataField, s);
                  delete s;
                  delete lookupRow;
               }
            }
            else if(lf.CustomLookup && lf.field.type)
            {
               char * n = lf.field.name;
               int64 data = 0;
               String s = null;
               Class type = lf.field.type;
               if(type.type == unitClass && !type.typeSize)
               {
                  Class dataType = eSystem_FindClass(type.module, type.dataTypeString);
                  if(dataType)
                     type = dataType;
               }
               if(type.type == structClass)
                  data = (int64)new0 byte[type.structSize];
               ((bool (*)())(void *)dbRow.GetData)(dbRow, lf.field, type, (type.type == structClass) ? (void *)data : &data);
               s = lf.CustomLookup((int)data);
               listRow.SetData(lf.dataField, s);
               if(!(type.type == systemClass || type.type == unitClass || type.type == bitClass || type.type == enumClass))
                  type._vTbl[__ecereVMethodID_class_OnFree](type, data);
               delete s; // ?
            }
            else if(lf.field.type)
            {
               char * n = lf.field.name;
               //char tempString[256];
               int64 data = 0;
               Class type = lf.field.type;
               if(type.type == unitClass && !type.typeSize)
               {
                  Class dataType = eSystem_FindClass(type.module, type.dataTypeString);
                  if(dataType)
                     type = dataType;
               }
               if(type.type == structClass)
                  data = (int64)new0 byte[type.structSize];
               ((bool (*)())(void *)dbRow.GetData)(dbRow, lf.field, type, (type.type == structClass) ? (void *)data : &data);
               if(type.type == systemClass || type.type == unitClass || type.type == bitClass || type.type == enumClass)
                  listRow.SetData(lf.dataField, (void *)&data);
               else
                  listRow.SetData(lf.dataField, (void *)data);
               //extern int __ecereVMethodID_class_OnGetString;
               //lf.field.type._vTbl[__ecereVMethodID_class_OnGetString](lf.field.type, &data, tempString, null, null);
               if(!(type.type == systemClass || type.type == unitClass || type.type == bitClass || type.type == enumClass))
                  type._vTbl[__ecereVMethodID_class_OnFree](type, data);
            }
         }
      }
      if(restoreSelection && !list.currentRow)
      {
         DataRow select;
         if((select = list.FindRow(selectedId)))
            SelectListRow(select);
      }
   }

   Array<Id> SearchWordList()
   {
      DebugLn("TableEditor::SearchWordList");
#ifdef FULL_STRING_SEARCH
      int c;
      int numTokens = 0;
      int len[256];
      char * words[256];
      WordEntry entries[256];
      Array<Id> results = null;
      if(searchFields && searchFields.count && searchString && searchString[0])
      {
         char * searchCopy = CopyString(searchString);
         numTokens = TokenizeWith(searchCopy, sizeof(words) / sizeof(char *), words, " ',/-;[]{}", false);
         for(c = 0; c<numTokens; c++)
         {
            len[c] = strlen(words[c]);
            strlwr(words[c]);
            entries[c] = (WordEntry)wordTree.FindString(words[c]);
         }
         delete searchCopy;
      }
      if(numTokens)
      {
         if(numTokens > 1)
         {
            // AND
            int i;
            Map<Id, int> matches { };
            Map<Id, int> uniques { };
            MapNode<Id, int> mn;
            results = { };
            for(c = 0; c<numTokens; c++)
            {
               if(entries[c] && entries[c].items && entries[c].items.count)
               {
                  for(i = 0; i<entries[c].items.count; i++)
                  {
                     int count = uniques[entries[c].items.ids[i]];
#ifdef _DEBUG
                     if(count != 0)
                        DebugLn("Problem");
#endif
                     matches[entries[c].items.ids[i]]++;
                  }
                  uniques.Free();
               }
            }
            for(mn = matches.root.minimum; mn; mn = mn.next)
            {
               if(mn.value > 1)
                  results.Add(mn.key);
            }
            matches.Free();
            delete matches;
            delete uniques;
         }
         else if(numTokens == 1)
         {
            results = { };
            if(entries[0] && entries[0].items && entries[0].items.count)
            {
               for(c = 0; c<entries[0].items.count; c++)
                  results.Add(entries[0].items.ids[c]);
            }
         }
      }
      return results;
#else
      return null;
#endif

   }

   // find a way to not load a tree for different searchFields
   // if the code that sets the searchFields has changed
   void PrepareWordList(char * filePath)
   {
      DebugLn("TableEditor::PrepareWordList");
#ifdef FULL_STRING_SEARCH
      Row r { table };
      File f = filePath ? FileOpenBuffered(filePath, read) : null;
      if(f)
      {
         int a;
         f.Get(wordTree);
         delete f;

         for(a = 0; a<26; a++)
         {
            int b;
            char word[3];
            word[0] = 'a' + (char)a;
            word[1] = 0;
            word[2] = 0;
            letters[a] = (WordEntry)wordTree.FindString(word);
            for(b = 0; b<26; b++)
            {
               word[1] = 'a' + (char)b;
               doubleLetters[a][b] = (WordEntry)wordTree.FindString(word);
            }
         }
      }
      else if(r && idField && searchFields && searchFields.count)
      {
         if(!letters[0])
         {
            int a;
            for(a = 0; a<26; a++)
            {
               int b;
               char word[3];
               word[0] = 'a' + (char)a;
               word[1] = 0;
               word[2] = 0;
               wordTree.Add((BTNode)(letters[a] = WordEntry { string = CopyString(word) }));
               for(b = 0; b<26; b++)
               {
                  word[1] = 'a' + (char)b;
                  wordTree.Add((BTNode)(doubleLetters[a][b] = WordEntry { string = CopyString(word) }));
               }
            }
         }

         while(r.Next())
         {
            Id id = 0;
            r.GetData(idField, id);

            for(ssf : searchFields)
            {
               Field field = ssf.field;
               StringSearchIndexingMethod method = ssf.method;
               if(field && field.type == class(String))
               {
                  String string = null;
                  r.GetData(field, string);

                  if(string && string[0])
                  {
                     int c;
                     unichar ch;
                     unichar lastCh = 0;
                     int count = 0;
                     int numChars = 0;
                     int nb;
                     char word[1024];
                     char asciiWord[1024];

                     for(c = 0; ; c += nb)
                     {
                        ch = UTF8GetChar(string + c, &nb);

                        if(!ch || CharMatchCategories(ch, separators) || 
                           (count && CharMatchCategories(ch, letters|numbers|marks|connector) != CharMatchCategories(lastCh, letters|numbers|marks|connector)))
                        {
                           if(count)
                           {
                              word[count] = 0;
                              asciiWord[numChars] = 0;
                              strlwr(word);
                              strlwr(asciiWord);

                              AddWord(word, count, method == allSubstrings, id);
                              if(count > numChars)
                                 AddWord(asciiWord, strlen(asciiWord), method == allSubstrings, id);
                              count = 0;
                              numChars = 0;
                           }
                           if(!CharMatchCategories(ch, separators))
                           {
                              int cc;
                              for(cc = 0; cc < nb; cc++)
                                 word[count++] = string[c + cc];

                              asciiWord[numChars++] = ToASCII(ch);
                           }
                           if(!ch)
                              break;
                        }
                        else
                        {
                           int cc;
                           for(cc = 0; cc < nb; cc++)
                              word[count++] = string[c + cc];

                           asciiWord[numChars++] = ToASCII(ch);
                        }
                        lastCh = ch;
                     }
                  }
                  delete string;
               }
            }
         }

         f = filePath ? FileOpen(filePath, write) : null;
         if(f)
         {
            f.Put(wordTree);
            delete f;
         }
      }
      delete r;
#endif
   }

   /*static */WordEntryBinaryTree wordTree
   {
      CompareKey = (void *)BinaryTree::CompareString;
      FreeKey = BinaryTree::FreeString;
   };

   WordEntry letters[26];
   WordEntry doubleLetters[26][26];

   void AddWord(char * word, int count, bool addAllSubstrings, Id id)
   {
      DebugLn("TableEditor::AddWord");
#ifdef FULL_STRING_SEARCH
      int s;
      WordEntry mainEntry = null;
      WordEntry sEntry = null;

      for(s = 0; s < count; s += UTF8_NUM_BYTES(word[s]))
      {
         int l;
         char subWord[1024];
         char ch1;
         WordEntry lEntry = null;
         memcpy(subWord, word + s, count-s);
         subWord[count-s] = 0;   // THIS IS REQUIRED!! THE WHILE LOOP BELOW CHECKED count-s FIRST!!
         ch1 = subWord[0];

         for(l = count-s; l>0; l--)
         {
            uint wid;
            WordEntry start = null, wordEntry;

            while(l > 0 && !UTF8_IS_FIRST(subWord[l])) l--;
            if(!l) break;

            subWord[l] = 0;

            if(ch1 >= 'a' && ch1 <= 'z')
            {
               char ch2 = subWord[1];
               if(count - s > 1 && ch2 >= 'a' && ch2 <= 'z')
               {
                  char ch2 = subWord[1];
                  start = doubleLetters[ch1 - 'a'][ch2 - 'a'];
               }
               else
               {
                  start = letters[ch1 - 'a'];
               }
            }
            
            if(start)
            {
               WordEntry max;
               while(start && (max = (WordEntry)((BTNode)start).maximum))
               {
                  if(strcmp(max.string, subWord) >= 0)
                     break;
                  start = start.parent;
               }
            }
            
            if(!start)
               start = (WordEntry)wordTree.root;

            if((wordEntry = (WordEntry)((BTNode)start).FindString(subWord)))
            {

            }
            else
            {
               wordTree.Add((BTNode)(wordEntry = WordEntry { string = CopyString(subWord) }));
            }
            if(!mainEntry)
            {
               mainEntry = wordEntry;
               sEntry = wordEntry;
               lEntry = wordEntry;
            }
            else if(!sEntry)
            {
               sEntry = wordEntry;
               lEntry = wordEntry;
               if(!wordEntry.words) wordEntry.words = IdList { };
               wordEntry.words.Add((Id)mainEntry);
            }
            else if(!lEntry)
            {
               lEntry = wordEntry;
               if(!wordEntry.words) wordEntry.words = IdList { };
               wordEntry.words.Add((Id)sEntry);
            }
            else
            {
               if(!wordEntry.words) wordEntry.words = IdList { };
               wordEntry.words.Add((Id)lEntry);
            }
            if(!wordEntry.items) wordEntry.items = IdList { };
            wordEntry.items.Add(id);
         }                        
      }
#endif
   }
}

public class ListField : struct
{
public:
   Field field;
   DataField dataField;
   Table lookupTable;
   Field lookupField;
   Field lookupValueField;
   String (*CustomLookup)(Id);
   /*public property Field lookupField
   {
      set
      {
         lookupField = value;
         if(value && !lookupTable)
            lookupTable = value.table;
      }
   }
private:*/

   ~ListField()
   {
      delete dataField;
   }
}

public class LookupField : struct
{
public:
   subclass(TableEditor) editorClass;
   Window parentWindow;
   Field field;
   Table lookupTable;
   Field lookupField;
   Field lookupIdField;
   String (*CustomLookup)(Id);
}

static WordEntry * btnodes;

struct WordEntryBinaryTree : BinaryTree
{
   WordEntry * entries;
   
   void OnSerialize(IOChannel channel)
   {
      WordEntry node;
      uint id;
      uint count = this.count;
      DebugLn("WordEntryBinaryTree::OnSerialize");
      for(id = 1, node = (WordEntry)root; node;)
      {
         node.id = id++;
         if(node.left)
            node = node.left;
         else if(node.right)
            node = node.right;
         else if(node.parent)
         {
            bool isLeft = node == node.parent.left;
            node = node.parent;
            
            while(node)
            {
               if(isLeft && node.right)
               {
                  node = node.right;
                  break;
               }
               if(node.parent)
                  isLeft = node == node.parent.left;
               node = node.parent;
            }
         }
         else
            node = null;
      }

      id--;
      channel.Serialize(id);
      channel.Serialize((WordEntry)root);
   }

   void OnUnserialize(IOChannel channel)
   {
      WordEntry root, node;
      uint count;
      DebugLn("WordEntryBinaryTree::OnUnserialize");
      channel.Unserialize(count);
      entries = new WordEntry[count];      
      btnodes = entries;
      channel.Unserialize(root);
      this.root = (BTNode)root;
      // count = root ? this.root.count : 0;      
      this.count = count;
      for(node = (WordEntry)root; node;)
      {
         if(node.words)
         {
            int c;
            for(c = 0; c<node.words.count; c++)
               node.words.ids[c] = (Id)btnodes[node.words.ids[c] - 1];
         }
         if(node.left)
            node = node.left;
         else if(node.right)
            node = node.right;
         else if(node.parent)
         {
            bool isLeft = node == node.parent.left;
            node = node.parent;
            
            while(node)
            {
               if(isLeft && node.right)
               {
                  node = node.right;
                  break;
               }
               if(node.parent)
                  isLeft = node == node.parent.left;
               node = node.parent;
            }
         }
         else
            node = null;
      }
      delete entries;
      btnodes = null;
   }
};

static char ToASCII(unichar ch)
{
   char asciiCH = 0;
   if(ch > 127)
   {
      if(ch == 'À' || ch == 'Á' || ch == 'Â' || ch == 'Ã' || ch == 'Ä' || ch == 'Å')
         asciiCH = 'A';
      else if(ch == 'Ç')
         asciiCH = 'C';
      else if(ch == 'È' || ch == 'É' || ch == 'Ê' || ch == 'Ë')
         asciiCH = 'E';
      else if(ch == 'Ì' || ch == 'Í' || ch == 'Î' || ch == 'Ï')
         asciiCH = 'I';
      else if(ch == 'Ñ')
         asciiCH = 'N';
      else if(ch == 'Ò' || ch == 'Ó' || ch == 'Ô' || ch == 'Õ' || ch == 'Ö')
         asciiCH = 'O';
      else if(ch == 'Ù' || ch == 'Ú' || ch == 'Û' || ch == 'Ü')
         asciiCH = 'U';
      else if(ch == 'à' || ch == 'á' || ch == 'â' || ch == 'ã' || ch == 'ä' || ch == 'å')
         asciiCH = 'a';
      else if(ch == 'ç')
         asciiCH = 'c';
      else if(ch == 'è' || ch == 'é' || ch == 'ê' || ch == 'ë')
         asciiCH = 'e';
      else if(ch == 'ì' || ch == 'í' || ch == 'î' || ch == 'ï')
         asciiCH = 'i';
      else if(ch == 'ñ')
         asciiCH = 'n';
      else if(ch == 'ò' || ch == 'ó' || ch == 'ô' || ch == 'õ' || ch == 'ö')
         asciiCH = 'o';
      else if(ch == 'ù' || ch == 'ú' || ch == 'û' || ch == 'ü')
         asciiCH = 'u';
   }
   else
      asciiCH = (char)ch;
   return asciiCH;
}

class WordEntry : struct
{
   String string;
   WordEntry parent;
   WordEntry left, right;
   int depth;
   
   IdList items;
   IdList words;
   uint id;

   ~WordEntry()
   {
      delete items;
      delete words;
   }

   void OnSerialize(IOChannel channel)
   {
#ifdef FULL_STRING_SEARCH
      if(this)
      {
         channel.Serialize(id);
         channel.Serialize(string);
         channel.Serialize(items);

         if(words)
         {
            int c;
            channel.Serialize(words.count);
            for(c = 0; c < words.count; c++)
            {
               uint id = ((WordEntry)words.ids[c]).id;
               channel.Serialize(id);
            }
         }
         else
         {
            Id none = MAXDWORD;
            channel.Serialize(none);
         }

         // channel.Serialize(words);
         channel.Serialize(left);
         channel.Serialize(right);
      }
      else
      {
         uint nothing = 0;
         channel.Serialize(nothing);
      }
#endif
   }

   void OnUnserialize(IOChannel channel)
   {
#ifdef FULL_STRING_SEARCH
      uint id;
      channel.Unserialize(id);
      if(id)
      {
         uint count;
         WordEntry entry;
         // TODO: Fix typed_object issues
         entry = btnodes[id - 1] = eInstance_New(class(WordEntry));
         this = (void *)entry;
         
         channel.Unserialize(string);
         channel.Unserialize(items);
         channel.Unserialize(words);

         channel.Unserialize(left);
         if(left) { left.parent = (void *)this; }
         channel.Unserialize(right);
         if(right) { right.parent = (void *)this; }

         // TODO: Precomp errors without extra brackets
         depth = ((BTNode)((void *)this)).depthProp;
      }
      else
         this = null;
#endif
   }
}

#if 0
class EnumerateThread : Thread
{
public:
   bool active;
   TableEditor editor;
   //Table table;
   //Row r;
   Array<Id> matches;

   void Abort()
   {
      /*if(abort)
         abortNow = true;
      else*/
      if(active)
         abort = true;
   }

private:
   bool abort, abortNow;

   unsigned int Main()
   {
      app.Wait();
      app.Lock();

      //if(app.ProcessInput(true))
         //app.Wait();
      {
         Row r { editor.table };
         if(matches)
         {
            int c;
            if(editor.listFields && editor.idField)
            {
               /*for(c=0; c<matches.count && !abort; c++)
               {
                  if(r.Find(editor.idField, middle, nil, matches[c]))
                  {
                     Id id = 0;
                     DataRow row;
                     GuiLock();
                     row = editor.list.AddRow();
                     r.GetData(editor.idField, id);
                     row.tag = id;
                     editor.SetListRowFields(r, row, true);
                     GuiUnlock();
                  }
                  else
                     DebugLn($"WordList match cannot be found in database.");
               }*/
            }
            else if(editor.idField && editor.stringField)
            {
               /*for(c=0; c<matches.count && !abort; c++)
               {
                  if(r.Find(editor.idField, middle, nil, matches[c]))
                  {
                     Id id = 0;
                     String s = null;
                     r.GetData(editor.idField, id);
                     r.GetData(editor.stringField, s);
                     GuiLock();
                     editor.list.AddString(s).tag = id;
                     GuiUnlock();
                     delete s;
                  }
                  else
                     DebugLn($"WordList match cannot be found in database.");
               }*/
            }
            else
               ;//app.Unlock();
         }
         else if(!editor.disabledFullListing)
         {
            if(editor.listFields && editor.idField)
            {
               app.Unlock();
               while(r.Next() && !abort)
               {
                  Id id = 0;
                  DataRow row;
               app.Unlock();
                  r.GetData(editor.idField, id);
                  //if(app.ProcessInput(true))
                     //app.Wait();
                  //app.Wait();
                  app.Lock();
                     row = editor.list.AddRow();
                     row.tag = id;
                     editor.SetListRowFields(r, row, true);
                  //app.Unlock();
               }
               //app.Unlock();
            }
            else if(editor.idField && editor.stringField)
            {
               /*while(r.Next() && !abort)
               {
                  Id id = 0;
                  String s = null;
                  GuiLock();
                  r.GetData(editor.idField, id);
                  r.GetData(editor.stringField, s);
                  editor.list.AddString(s).tag = id;
                  GuiUnlock();
                  delete s;
               }*/
            }
            else
               ;//app.Unlock();
         }
         else
            ;//app.Unlock();

         //app.Lock();
            editor.list.Sort(editor.listSortField, editor.listSortOrder);
         //app.Unlock();
      }
      active = false;
      abort = false;

      app.Unlock();
      return 0;
   }

   /*void GuiLock()
   {
      app.Wait();
      app.Lock();
   }*/

   /*void GuiUnlock()
   {
      app.Unlock();
      editor.list.Update(null);
      //app.Wait(); // Sleep(0.2f);
      //if(app.ProcessInput(true))
         //app.Wait();
         // Update(null);
         //app.UpdateDisplay();
      //app.Wait();
      // app.Lock();
   }*/
}
#endif

static define app = ((GuiApplication)__thisModule);

static inline void DebugLn(typed_object object, ...)
{
#if defined(_DEBUG_LINE)
   va_list args;
   char buffer[4096];
   va_start(args, object);
   PrintStdArgsToBuffer(buffer, sizeof(buffer), object, args);
   va_end(args);
   puts(buffer);
#endif
}
