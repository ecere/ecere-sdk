#include <stdarg.h>

import "idList"

import "FieldBox"

default:

extern int __ecereVMethodID_class_OnFree;
extern int __ecereVMethodID_class_OnGetString;
extern int __ecereVMethodID_class_OnGetDataFromString;

private:

#ifdef _DEBUG
// #define _DEBUG_LINE
#endif

#define FULL_STRING_SEARCH

#define UTF8_IS_FIRST(x)   (__extension__({ byte b = x; (!(b) || !((b) & 0x80) || ((b) & 0x40)); }))
#define UTF8_NUM_BYTES(x)  (__extension__({ byte b = x; (b & 0x80 && b & 0x40) ? ((b & 0x20) ? ((b & 0x10) ? 4 : 3) : 2) : 1; }))

define newEntryStringDebug = $"New|id=";
define newEntryString = $"New";

public char ToASCII(unichar ch)
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

public char * ConvertToASCII(char * string, char * newString, int * len, bool lowerCase)
{
   if(string)
   {
      unichar unich;
      int nb;
      int c, d = 0;
      for(c = 0; (unich = UTF8GetChar(string + c, &nb)); c += nb)
      {
         char ch = ToASCII(unich);
         if(ch < 128 && (ch == '-' || isalpha(ch) || ch == ','))
            newString[d++] = lowerCase ? (char)tolower(ch) : (char)ch;
      }
      newString[d] = 0;
      if(len) *len = d;
   }
   return null;
}

public class NoCaseAccent : SQLCustomFunction
{
   void Process(char * text)
   {
      int len = text ? strlen(text) : 0;
      array.size = len + 1;
      ConvertToASCII(text ? text : "", array.array, &len, true);
      array.count = len + 1;
   }
}

public class MemberStringSample
{
   String name;
}

default extern int __ecereVMethodID_class_OnUnserialize;

public class GetMemberString<class NT:void * = MemberStringSample, name = NT::name> : SQLCustomFunction
{
   SerialBuffer buffer { };
   void Process(char * text)
   {
      NT pn;
      buffer.buffer = text;
      buffer.count = MAXINT;
      buffer.pos = 0;
      class(NT)._vTbl[__ecereVMethodID_class_OnUnserialize](class(NT), &pn, buffer);
      NoCaseAccent::Process((NoCaseAccent)this, (pn && pn.name) ? pn.name : null);
      delete pn;
      buffer.buffer = null;
      buffer.count = 0;
      // TOFIX: If we name GetName's type 'T', the following name confuses with Array's 'T'
      //ConvertToASCII(s ? s : "", array.array, &len, true);
   }
}

// Rename TableEditor to TableControl and move to eda/src/gui/controls
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

   property Table index
   {
      set
      {
         DebugLn("TableEditor::index|set");
         index = value;
         filterRow.tbl = index;
      }
   }
   Table index;

   bool OnPostCreate()
   {
      DebugLn("TableEditor::OnPostCreate");
      if(table)
      {
         if(!initialized)
         {
            ResetListFields();
            if(searchTables)
               PrepareWordList();
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
               if(searchTables)
                  PrepareWordList();
            }
            initialized = true;
            OnInitialize();
         }
         if(!listEnumerationTimer.hasCompleted)
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
   Field idField;
   Field stringField;
   Field indexFilterField;

   ListBox list;
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
         StringSearchTable searchTable { table, idField, value };
         DebugLn("TableEditor::searchFields|set");
         // The searchTables property will incref...
         property::searchTables = { [ searchTable ] };
      }
   }

   property Array<StringSearchTable> searchTables
   {
      set
      {
         // This API is not very clear on ownership of search tables array/search table/field...
         // Right now both the array and tables themselves are incref'ed here
         incref value;
         for(t : value) { incref t; }
         DebugLn("TableEditor::searchTables|set");
         if(searchTables) searchTables.Free();
         delete searchTables;
         searchTables = value;
      }
   }
   Array<StringSearchTable> searchTables;

   property Array<SQLiteSearchTable> sqliteSearchTables
   {
      set
      {
         incref value;
         for(t : value) { incref t; }
         DebugLn("TableEditor::searchTables|set");
         if(sqliteSearchTables) sqliteSearchTables.Free();
         delete sqliteSearchTables;
         sqliteSearchTables = value;
      }
   }
   Array<SQLiteSearchTable> sqliteSearchTables;

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

   Map<Table, Lookup> lookups;

   Array<LookupEditor> dynamicLookupEditors;
   property Array<LookupEditor> dynamicLookupEditors
   {
      set
      {
         DebugLn("TableEditor::dynamicLookupEditors|set");
         dynamicLookupEditors = value;
      }
   }

   // Fields Editor
   property Id selectedId { get { return selectedId; } }

   Array<FieldBox> fieldsBoxes { };
   Array<TableEditor> tableEditors { };
   Array<TableEditor> dynamicLookupTableEditors { };

   bool readOnly;
   
   public virtual void OnInitialize();
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
      {
         StopWordListPrepTimer();
         StopListEnumerationTimer();
      }
      return result;
   }

   //public void List() // this gets called out of nowhere by some constructor thing...
   public void Enumerate()
   {
      DebugLn("TableEditor::Enumerate");
      if(list)
      {
         StopListEnumerationTimer();
         list.Clear();
         EditClear();
      }
      if(list || OnList != TableEditor::OnList)
      {
         Row r { table };
         Array<Id> matches = null;
         listEnumerationTimer.sqliteSearch = false;
         if(searchTables && searchTables.count)
            matches = SearchWordList();
         //else if(sqliteSearchTables && sqliteSearchTables.count)
            //matches = SearchSQLite();
         else if(searchString && searchString[0] &&
               sqliteSearchTables && sqliteSearchTables.count &&
               sqliteSearchTables[0].table && sqliteSearchTables[0].idField &&
               sqliteSearchTables[0].searchFields && sqliteSearchTables[0].searchFields.count &&
               sqliteSearchTables[0].searchFields[0].field)
            listEnumerationTimer.sqliteSearch = true;
         if(matches && matches.count)
            PrintLn("results count: ", matches.count);
         OnList(r, matches);
         delete matches;
         delete r;
      }
      modifiedDocument = false; // setting this here is not really logical, enumeration and modified have nothing to do with eachother
   }

   virtual void OnList(Row r, Array<Id> matches)
   {
      DebugLn("TableEditor::OnList");
      if(!listEnumerationTimer.started)
      {
         listEnumerationTimer.hasCompleted = false;
         listEnumerationTimer.matchesIndex = 0;
         listEnumerationTimer.tablesIndex = 0;
         if(!listEnumerationTimer.sqliteSearch)
            listEnumerationTimer.row = Row { r.tbl };
         if(matches)
         {
            listEnumerationTimer.matches = { };
            // TOFIX: This (void *) cast here should NOT be required... Fix this Container warning:
            // warning: incompatible expression matches (ecere::com::Array<eda::Id>); expected ecere::com::Container<T>
            listEnumerationTimer.matches.Copy((void *)matches);
         }
         else
            listEnumerationTimer.matches = null;
         listEnumerationTimer.Start();
      }
      else
         DebugLn("TableEditor::OnList -- timer state error");
   }

   virtual void OnCreateDynamicLookupEditors()
   {
      DebugLn("TableEditor::OnCreateLookupEditors");
      if(dynamicLookupEditors && dynamicLookupEditors.count)
      {
         for(f : dynamicLookupEditors)
         {
            if(f.editorClass && f.parentWindow && f.lookupFindField)
            {
               Row row { f.lookupFindIndex ? f.lookupFindIndex : f.lookupFindField.table };
               // todo: make this work for all types
               uint id = 0;
               editRow.GetData(f.lookupValueField, id);
               // TODO: add alternative class instance for creation when no rows are found via lookup
               for(row.Find(f.lookupFindField, middle, nil, id); !row.nil; row.Next())
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
                              if(eClass_IsDerived(dataType, class(char*)))
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
      // EDA is now set up so that Next()/Prev() will work with sysID = , but not with Find() (As Find() will return a particular set of results)
      if(idField && (editRow.sysID = id, !editRow.nil))// && editRow.Find(idField, middle, nil, id))
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

   bool Filter(Id id)
   {
      bool result;
      DebugLn("TableEditor::Filter");
      if(selectedId && index && indexFilterField)
      {
         for(filterRow.Find(indexFilterField, middle, nil, id); !filterRow.nil; filterRow.Next())
         {
            Id id2;
            filterRow.GetData(idField, id2);
            if(id2 == selectedId)
            {
               filtered = true;
               result = true;
               break;
            }
         }
      }
      else
         result = false;
      return result;
   }

   bool SelectNext()
   {
      bool result;
      bool wasNil = !editRow.sysID;
      DebugLn("TableEditor::SelectNext");
      // How about confirmation / saving before changing the entry?
      if(filtered)
      {
         if(filterRow.Next())
         {
            if(wasNil && filterRow.sysID == selectedId)
               filterRow.Next();
            editRow.sysID = filterRow.sysID;
         }
         else
            editRow.sysID = 0;
      }
      else
         editRow.Next();
      if(!editRow.nil)
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
      bool wasNil = !editRow.sysID;
      DebugLn("TableEditor::SelectPrevious");
      if(filtered)
      {
         if(filterRow.Previous())
         {
            if(wasNil && filterRow.sysID == selectedId)
               filterRow.Previous();
            editRow.sysID = filterRow.sysID;
         }
         else
            editRow.sysID = 0;
      }
      else
         editRow.Previous();
      if(!editRow.nil)
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
   Row filterRow { };
   bool filtered;
   Array<char> searchCI { };

   ListEnumerationTimer listEnumerationTimer
   {
      userData = this, delay = 0.1f;
      bool DelayExpired()
      {
         static Time startTime;
         bool next = false;
         int c;
         Row row = listEnumerationTimer.row;
         Array<Id> matches = listEnumerationTimer.matches;
         Time delay = listEnumerationTimer.delay;
         Time lastTime = GetTime();
         static int slice = 128;

         static int wordListPrepRowCount = 0, wordListPrepRowNum = 0, ticks = 0;
         ticks++;
         if(ticks % 10 == 0)
            PrintLn("listing... ");

         if(matches)
         {
            int index = listEnumerationTimer.matchesIndex;
            if(listFields && idField)
            {
               for(c=0; c<slice && (next = index++<matches.count); c++)
               {
                  if(row.Find(idField, middle, nil, matches[index]))
                  {
                     Id id = 0;
                     DataRow dataRow = list.AddRow();
                     row.GetData(idField, id);
                     dataRow.tag = id;
                     SetListRowFields(row, dataRow, true);
                  }
                  else
                     DebugLn($"WordList match cannot be found in database.");
               }
               listEnumerationTimer.matchesIndex = index;
               if(next) slice = Max(32, (int)(slice * (delay / (GetTime() - lastTime))));
            }
            else if(idField && stringField)
            {
               for(c=0; c<slice && (next = index++<matches.count); c++)
               {
                  if(row.Find(idField, middle, nil, matches[index]))
                  {
                     Id id = 0;
                     String s = null;
                     row.GetData(idField, id);
                     row.GetData(stringField, s);
                     list.AddString(s).tag = id;
                     delete s;
                  }
                  else
                     DebugLn($"WordList match cannot be found in database.");
               }
               listEnumerationTimer.matchesIndex = index;
               if(next) slice = Max(32, (int)(slice * (delay / (GetTime() - lastTime))));
            }
         }
         else if(listEnumerationTimer.sqliteSearch)
         {
            static SQLiteSearchTable st = null;
            Row lookupRow { table };
            Map<Id, int> uniques = listEnumerationTimer.uniques;
            if(!row)
            {
               if(listEnumerationTimer.tablesIndex < sqliteSearchTables.count)
               {
                  char queryString[4096*4];

                  if(!listEnumerationTimer.uniques)
                     listEnumerationTimer.uniques = uniques = { };

                  st = sqliteSearchTables[listEnumerationTimer.tablesIndex];
                  if(st.table && st.idField && st.searchFields && st.searchFields.count)
                  {
                     wordListPrepRowNum = 0;
                     wordListPrepRowCount = st.table.rowsCount;

                     if(st.table && st.idField && st.searchFields && st.searchFields.count &&
                           st.searchFields[0].field)
                     {
                        bool first = true;
                        int bindId = 0;

                        listEnumerationTimer.row = row = { st.table };

                        {
                           int len = searchString ? strlen(searchString) : 0;
                           searchCI.size = len + 1;
                           ConvertToASCII(searchString ? searchString : "", searchCI.array, &len, true);
                           searchCI.count = len + 1;
                        }

                        sprintf(queryString, "SELECT ROWID, * FROM `%s`", st.table.name);
                        strcat(queryString, " WHERE ");
                        for(sf : st.searchFields)
                        {
                           if(sf.field)
                           {
                              if(!first)
                                 strcat(queryString, " OR ");
#define PERSON_SEARCH_LIKE
                              // This code tries to implement the logic of PersonName::OnGetDataFromString because PersonName is inaccessible from here
                              if(strstr(sf.field.type.name, "PersonName"))
                              {
#ifdef PERSON_SEARCH_LIKE
                                 String ln = null, fn = null, mn = null;
                                 char * comma = strchr(searchCI.array, ',');
                                 if(comma)
                                 {
                                    int len = comma - searchCI.array;
                                    ln = new char[len + 1];
                                    memcpy(ln, searchCI.array, len);
                                    ln[len] = 0;

                                    fn = CopyString(comma+1);
                                    {
                                       int c;
                                       for(c = strlen(fn)-2; c > 0; c--)
                                       {
                                          if(fn[c] == ' ')
                                          {
                                             mn = CopyString(fn + c + 1);
                                             fn[c] = 0;
                                          }
                                       }
                                    }
                                 }
                                 else
                                    ln = CopyString(searchCI.array);

                                 /* We could simply do this if we had access to PersonName: (don't forget the delete pn; below)
                                 PersonName pn;
                                 pn.OnGetDataFromString(searchCI.array);
                                 */
                                 if(ln && !fn && !mn)
                                 {
                                    // Only last name is pecified in search object, it is looked for in all fields
                                    strcatf(queryString, "(PNLastName(`%s`) LIKE '%%%s%%' OR PNFirstName(`%s`) LIKE '%%%s%%' OR PNMiddleName(`%s`) LIKE '%%%s%%')",
                                       sf.field.name, searchCI.array, sf.field.name, searchCI.array, sf.field.name, ln);
                                 }
                                 else if(ln || fn || mn)
                                 {
                                    // Otherwise search is in respective fields only (all specified must match)
                                    bool first = true;
                                    strcatf(queryString, "(");
                                    if(ln)
                                    {
                                       if(!first) strcatf(queryString, " AND ");
                                       first = false;
                                       strcatf(queryString, "PNLastName(`%s`) LIKE '%%%s%%'", sf.field.name, ln);
                                    }
                                    if(fn)
                                    {
                                       if(!first) strcatf(queryString, " AND ");
                                       first = false;
                                       strcatf(queryString, "PNFirstName(`%s`) LIKE '%%%s%%'", sf.field.name, fn);
                                    }
                                    if(mn)
                                    {
                                       if(!first) strcatf(queryString, " AND ");
                                       first = false;
                                       strcatf(queryString, "PNMiddleName(`%s`) LIKE '%%%s%%'", sf.field.name, mn);
                                    }
                                    strcatf(queryString, ")");
                                 }
                                 //delete pn;
                                 delete ln; delete fn; delete mn;
#else
                                 // To use CompPersonName::OnCompare:
                                 strcatf(queryString, "`%s` = ?", sf.field.name);
#endif
                              }
                              else
                                 strcatf(queryString, "`%s` LIKE '%%%s%%'", sf.field.name, searchString);
                              first = false;
                           }
                        }
                        PrintLn(queryString);
                        startTime = GetTime();
                        row.query = queryString;
#ifndef PERSON_SEARCH_LIKE
                        // To use CompPersonName::OnCompare:
                        for(sf : st.searchFields)
                        {
                           if(sf.field)
                           {
                              if(strstr(sf.field.type.name, "PersonName"))
                              {
                                 void * pn;
                                 sf.field.type._vTbl[__ecereVMethodID_class_OnGetDataFromString](sf.field.type, &pn, searchCI.array);
                                 row.SetQueryParamObject(++bindId, pn, sf.field.type);
                                 bindId++;
                                 delete pn;
                              }
                              first = false;
                           }
                        }
#endif
                        if(bindId)
                           row.Next();
                     }
                  }
               }
            }
            if(row)
            {
               if(listFields && idField)
               {
                  // should we not start with a Next() ??? :S  -- right now, query = does not need a Next(), unless it had parameters (SetQueryParam), See #591
                  // when going through all the rows in a table you always start with Next() no?
                  // is this different for query results?
                  for(c = 0, next = !row.nil; c<slice && next; c++, next = row.Next())
                  {
                     Id id = 0;
                     row.GetData(st.idField, id);
                     //if(uniques[id]++ == 0)
                     if(uniques[id] == 0)
                     {
                        DataRow dataRow = list.AddRow();
                        dataRow.tag = id;
                        if(st.table == table)
                           SetListRowFields(row, dataRow, true);
                        else if(lookupRow.Find(idField, middle, nil, id))
                           SetListRowFields(lookupRow, dataRow, true);
                        else
                           PrintLn("no");
                     }
                     uniques[id] = uniques[id] + 1;
                  }
                  if(next) slice = Max(32, (int)(slice * (delay / (GetTime() - lastTime))));
                  else
                  {
                     delete listEnumerationTimer.row; row = null;
                     next = ++listEnumerationTimer.tablesIndex < sqliteSearchTables.count;
                  }
               }
               else if(idField && stringField)
               {
                  // should we not start with a Next() ??? :S
                  // when going through all the rows in a table you always start with Next() no?
                  // is this different for query results?
                  for(c = 0, next = !row.nil; c<slice && next; c++, next = row.Next())
                  {
                     Id id = 0;
                     row.GetData(st.idField, id);
                     //if(uniques[id]++ == 0)
                     if(uniques[id] == 0)
                     {
                        String s = null;
                        if(st.table == table)
                           row.GetData(stringField, s);
                        else if(lookupRow.Find(idField, middle, nil, id))
                           lookupRow.GetData(stringField, s);
                        else
                           PrintLn("no");
                        list.AddString(s).tag = id;
                        delete s;
                     }
                     uniques[id] = uniques[id] + 1;
                  }
                  if(next) slice = Max(32, (int)(slice * (delay / (GetTime() - lastTime))));
                  else
                  {
                     delete listEnumerationTimer.row; row = null;
                     next = ++listEnumerationTimer.tablesIndex < sqliteSearchTables.count;
                  }
               }
            }
            delete lookupRow;
         }
         else if(!disabledFullListing)
         {
            if(listFields && idField)
            {
               for(c = 0; c<slice && (next = row.Next()); c++)
               {
                  Id id = 0;
                  DataRow dataRow = list.AddRow();
                  row.GetData(idField, id);
                  dataRow.tag = id;
                  SetListRowFields(row, dataRow, true);
                  //app.UpdateDisplay();
               }
               if(next) slice = Max(32, (int)(slice * (delay / (GetTime() - lastTime))));
            }
            else if(idField && stringField)
            {
               for(c = 0; c<slice && (next = row.Next()); c++)
               {
                  Id id = 0;
                  String s = null;
                  row.GetData(idField, id);
                  row.GetData(stringField, s);
                  list.AddString(s).tag = id;
                  delete s;
               }
               if(next) slice = Max(32, (int)(slice * (delay / (GetTime() - lastTime))));
            }
         }

         list.Sort(listSortField, listSortOrder);

         if(!next)
         {
            listEnumerationTimer.hasCompleted = true;
            StopListEnumerationTimer();
         }
         if(startTime) PrintLn("*** Search took ", (uint)((GetTime() - startTime) * 1000), "ms ***");
         return true;
      }
   };

   void StopListEnumerationTimer()
   {
      listEnumerationTimer.Stop();
      listEnumerationTimer.matchesIndex = 0;
      listEnumerationTimer.tablesIndex = 0;
      delete listEnumerationTimer.row;
      delete listEnumerationTimer.matches;
      delete listEnumerationTimer.uniques;
   }

   WordListPrepTimer wordListPrepTimer
   {
      userData = this, delay = 0.1f;
      bool DelayExpired()
      {
         bool next = false;
         Row row = wordListPrepTimer.row;
         static int slice = 512;
         static StringSearchTable st = null;

         static int wordListPrepRowCount = 0, wordListPrepRowNum = 0, ticks = 0;

         if(!row)
         {
            if(wordListPrepTimer.tablesIndex < searchTables.count)
            {
               st = searchTables[wordListPrepTimer.tablesIndex];
               if(st.table && st.idField && st.searchFields && st.searchFields.count)
               {
                  wordListPrepRowNum = 0;
                  wordListPrepRowCount = st.table.rowsCount;

                  wordListPrepTimer.row = row = { st.table };
                  DebugLn("building word list for ", st.table.name, " table ------------------------------------- ");
               }
            }
         }
         if(row)
         {
            int c;
            Time delay = wordListPrepTimer.delay;
            Time lastTime = GetTime();

            ticks++;
            if(ticks % 10 == 0)
               PrintLn("indexing ", wordListPrepRowNum, " of ", wordListPrepRowCount, " --- slice is ", slice);

            for(c = 0; c<slice && (next = row.Next()); c++)
            {
               Id id = 0;
               row.GetData(st.idField, id);

               wordListPrepRowNum++;

               for(sf : st.searchFields)
               {
                  Field field = sf.field;
                  StringSearchIndexingMethod method = sf.method;
                  if(field && field.type == class(String))
                  {
                     String string = null;
                     row.GetData(field, string);

                     if(string && string[0])
                        ProcessWordListString(string, method, id);
                     delete string;
                  }
                  // todo: need to improve on this...
                  // else ... call OnGetString of type ... etc...
                     //PrintLn("todo: support other field types for string search");
                  else if(field && field.type)
                  {
                     char * n = field.name;
                     char tempString[MAX_F_STRING];
                     int64 data = 0;
                     Class type = field.type;
                     if(type.type == unitClass && !type.typeSize)
                     {
                        Class dataType = eSystem_FindClass(type.module, type.dataTypeString);
                        if(dataType)
                           type = dataType;
                     }
                     if(type.type == structClass)
                        data = (int64)new0 byte[type.structSize];
                     ((bool (*)())(void *)row.GetData)(row, field, type, (type.type == structClass) ? (void *)data : &data);

                     if(type.type == systemClass || type.type == unitClass || type.type == bitClass || type.type == enumClass)
                        field.type._vTbl[__ecereVMethodID_class_OnGetString](field.type, &data, tempString, null, null);
                     else
                        field.type._vTbl[__ecereVMethodID_class_OnGetString](field.type, (void *)data, tempString, null, null);

                     if(tempString[0])
                        ProcessWordListString(tempString, method, id);

                     if(!(type.type == systemClass || type.type == unitClass || type.type == bitClass || type.type == enumClass))
                        type._vTbl[__ecereVMethodID_class_OnFree](type, data);
                  }
               }
            }
            if(next) slice = Max(32, (int)(slice * (delay / (GetTime() - lastTime))));
            else
            {
               delete wordListPrepTimer.row; row = null;
               next = ++wordListPrepTimer.tablesIndex < searchTables.count;
            }
         }

         if(!next)
         {
            char filePath[MAX_FILENAME];
            File f;

            sprintf(filePath, "%s.search", table.name);
            // this doesn't want to work? :S :S :S
            // f == 0x0
            f = FileOpenBuffered(filePath, read);
            if(f)
            {
               f.Put(wordTree);
               delete f;
            }

            wordListPrepTimer.hasCompleted = true;
            StopWordListPrepTimer();
         }
         return true;
      }
   };

   void StopWordListPrepTimer()
   {
      wordListPrepTimer.Stop();
      wordListPrepTimer.tablesIndex = 0;
      delete wordListPrepTimer.row;
   }

   ~TableEditor()
   {
      DebugLn("TableEditor::~()");

      fieldsBoxes.Free(); // TOCHECK: do I need to delete each to oppose the incref in AddFieldBox? -- Free() does just that
      delete searchString;
      wordTree.Free();

      delete listFields;
      delete lookups;
      delete dynamicLookupEditors;
      delete dynamicLookupTableEditors;
      if(searchTables) searchTables.Free();
      delete searchTables;
      if(sqliteSearchTables) sqliteSearchTables.Free();
      delete sqliteSearchTables;
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
         it.Remove(); // tableEditors.Remove(it.pointer); // <-- any reason why we would want to do that instead? -- It's the same.
         delete tableEditor; // AddTableEditor increfs...
      }
      else
         DebugLn("   TableEditor instance not found, no need to remove");
   }

   void AddFieldBox(FieldBox fieldBox)
   {
      // I was putting this here to force autosize on the lists (e.g. the Radiologists fields):
      /*
      if(!fieldBox.autoSize)
         fieldBox.autoSize = true;
      */
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
         it.Remove(); // fieldsBoxes.Remove(it.pointer); // <-- any reason why we would want to do that instead? -- It's the same.
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
      for(lu : lookups)
      {
         if(&lu == table)
         {
            if(!lu.row)
               lu.row = { lu.findIndex ? lu.findIndex : lu.findField.table };
            if(lu.valueField && eClass_IsDerived(lu.valueField.type, class(Id)) &&
                  lu.findField && eClass_IsDerived(lu.findField.type, class(Id)))
            {
               Id id = 0;
               editRow.GetData(lu.valueField, id);
               lu.row.Find(lu.findField, middle, nil, id);
            }
         }
      }
      for(fb : fieldsBoxes)
         fb.Load();
      OnCreateDynamicLookupEditors();
      internalModifications = false;
      size = size;   // This seems to be required to fix autoSize on entering order screen

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
         e.Destroy(0);
      for(e : tableEditors)
         e.Destroy(0);
      tableEditors.Free();
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
            if(eClass_IsDerived(lf.field.type, class(char*)))
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
               else if(lf.lookupFindField && (lf.lookupFindIndex || lf.lookupFindField.table) && lf.lookupValueField &&
                     eClass_IsDerived(lf.lookupFindField.type, class(Id)) &&
                     eClass_IsDerived(lf.lookupValueField.type, class(char*)))
               {
                  Id id = 0;
                  String s = null;
                  Row lookupRow { lf.lookupFindIndex ? lf.lookupFindIndex : lf.lookupFindField.table };
                  dbRow.GetData(lf.field, id);
                  if(lookupRow.Find(lf.lookupFindField, middle, nil, id))
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
            else if(lf.field.type && eClass_IsDerived(lf.dataField.dataType, class(char*)))
            {
               char * n = lf.field.name;
               char tempString[MAX_F_STRING];
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
                  lf.field.type._vTbl[__ecereVMethodID_class_OnGetString](lf.field.type, &data, tempString, null, null);
               else
                  lf.field.type._vTbl[__ecereVMethodID_class_OnGetString](lf.field.type, (void*)data, tempString, null, null);

               listRow.SetData(lf.dataField, tempString);

               if(!(type.type == systemClass || type.type == unitClass || type.type == bitClass || type.type == enumClass))
                  type._vTbl[__ecereVMethodID_class_OnFree](type, data);
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
   {
      int c;
      int numTokens = 0;
      int len[256];
      char * words[256];
      WordEntry entries[256];
      Array<Id> results = null;
      if(searchTables && searchTables.count && searchString && searchString[0])
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
   }
#else
      return null;
#endif

   }

   // find a way to not load a tree for different searchFields
   // if the code that sets the searchFields has changed
   // store a search index signature containing following:
   // tables name, idField name and type, fields name and type
   void PrepareWordList()
   {
      DebugLn("TableEditor::PrepareWordList");
#ifdef FULL_STRING_SEARCH
   {
      char filePath[MAX_FILENAME];
      File f;

      sprintf(filePath, "%s.search", table.name);
      f = filePath ? FileOpenBuffered(filePath, read) : null;
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
      else if(searchTables && searchTables.count)
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

         wordListPrepTimer.tablesIndex = 0;
         wordListPrepTimer.Start();
      }
   }
#endif
   }

   void ProcessWordListString(char * string, StringSearchIndexingMethod method, Id id)
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

   /*static */WordEntryBinaryTree wordTree
   {
      CompareKey = (void *)BinaryTree::CompareString;
      FreeKey = BinaryTree::FreeString;
   };

   WordEntry letters[26];
   WordEntry doubleLetters[26][26];

   void AddWord(char * word, int count, bool addAllSubstrings, Id id)
   {
      //DebugLn("TableEditor::AddWord");
#ifdef FULL_STRING_SEARCH
   {
      if(addAllSubstrings)
      {
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
      }
      else
      {
         WordEntry wordEntry;
         if(!(wordEntry = (WordEntry)(wordTree.root).FindString(word)))
            wordTree.Add((BTNode)(wordEntry = WordEntry { string = CopyString(word) }));
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
   Field lookupFindField;
   Field lookupValueField;
   Table lookupFindIndex;
   String (*CustomLookup)(Id);
private:

   ~ListField()
   {
      delete dataField;
   }
}

public class Lookup
{
public:
   Field valueField;
   Field findField;
   Table findIndex;

private:
   Row row;

   ~Lookup()
   {
      delete row;
   }
}

public class LookupEditor : struct
{
public:
   subclass(TableEditor) editorClass;
   Window parentWindow;
   Field lookupValueField;
   Field lookupFindField;
   Field lookupIdField;
   Table lookupFindIndex;
}

// all methods currently perform ascii conversion and all that jazz on every string added to the index
public enum StringSearchIndexingMethod { fullString, allSubstrings };

public class StringSearchField
{
public:
   Field field;
   StringSearchIndexingMethod method;

   Field lookupFindField;
   Field lookupValueField;

   //String (*CustomRead)(Id);
};

public class StringSearchTable
{
public:
   Table table;
   Field idField;
   Array<StringSearchField> searchFields;

private:
   ~StringSearchTable()
   {
      delete searchFields;
   }
}

public class SQLiteSearchField
{
public:
   Field field;
   //StringSearchIndexingMethod method;
};

public class SQLiteSearchTable
{
public:
   Table table;
   Field idField;
   Array<SQLiteSearchField> searchFields;

private:
   ~SQLiteSearchTable()
   {
      delete searchFields;
   }
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


class ListEnumerationTimer : Timer
{
   bool hasCompleted;
   int matchesIndex;
   bool sqliteSearch;
   int tablesIndex;
   Array<Id> matches;
   Row row;
   Map<Id, int> uniques;
}

class WordListPrepTimer : Timer
{
   bool hasCompleted;
   int tablesIndex;
   Row row;
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
