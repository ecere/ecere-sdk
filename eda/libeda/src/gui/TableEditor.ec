import "idList"

import "FieldBox"

#define FULL_STRING_SEARCH

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

public class TableEditor
{
public:
   Window window;
   property Table table
   {
      set
      {
         table = value;
         if(table)
         {
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
               Enumerate();
               {
                  char name[MAX_FILENAME];
                  sprintf(name, "%s.search", value.name);
                  PrepareWordList(name);
               }
            }
         }
      }
   }
   Table table;

   // List
   property ListBox list
   {
      set
      {
         list = value;
         ResetListFields();
      }
   }
   ListBox list;
   Field idField;
   Field stringField;
   property Array<ListField> listFields
   {
      set
      {
         listFields = value;
         ResetListFields();
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
         searchFields = value;
         {
            char name[MAX_FILENAME];
            sprintf(name, "%s.search", table.name);
            PrepareWordList(name);
         }
      }
   }
   Array<StringSearchField> searchFields;
   property String searchString
   {
      set
      {
         bool modified = window && window.modifiedDocument;
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

   // Fields Editor
   property Id selectedId { get { return selectedId; } }

   Array<FieldBox> fieldsBoxes { };
   
   public virtual void Window::OnLoad();
   public virtual void Window::OnStateChanged();
   bool internalModifications;
   public void NotifyModifiedDocument()
   {
      if(!internalModifications)
         OnStateChanged(window);
   }

   //public virtual bool Window::NotifyNew(AltListSection listSection, Row r);
   //virtual void Window::NotifyInitFields(AltEditSection editSection);
   
   public virtual DialogResult OnLeavingModifiedDocument()
   {
      return MessageBox { master = window, type = yesNoCancel, text = window ? window.text : $"Table Editor",
                          contents = $"You have modified this entry. Would you like to save it before proceeding?"
                  }.Modal();
   }
   
   public virtual bool OnRemovalRequest()
   {
      return MessageBox { master = window, type = yesNo, text = window ? window.text : $"Table Editor", 
                          contents =  $"You are about to permanently remove an entry.\n"
                                       "Do you wish to continue?"
                  }.Modal() == yes;
   }

   //public virtual void Window::NotifyDeleting(ListSection listSection);
   //public virtual void Window::NotifyDeleted(ListSection listSection);

   public bool NotifyClosing()
   {
      bool result = true;
      if(window && window.modifiedDocument)
      {
         switch(OnLeavingModifiedDocument())
         {
            case cancel:
               result = false;
               break;
            case yes:
               EditSave();
            case no:
               window.modifiedDocument = false;
               break;
         }
      }
      return result;
   }

   //public void List() // this gets called out of nowhere by some constructor thing...
   public void Enumerate()
   {
      if(list)
      {
         DataRow select;
         list.Clear();
         {
            Row r { table };
            Array<Id> matches = SearchWordList();
            OnList(this, r, matches);
            delete matches;
            delete r;
         }
         list.Sort(listSortField, listSortOrder);
         if((select = list.FindRow(selectedId)))
            SelectListRow(select);
         else
            EditClear();
      }
      if(window)
         window.modifiedDocument = false;
   }

   virtual void TableEditor::OnList(Row r, Array<Id> matches)
   {
      if(matches)
      {
         int c;
         if(listFields && idField)
         {
            for(c=0; c<matches.count; c++)
            {
               if(r.Find(idField, middle, nil, matches[c]))
               {
                  Id id = 0;
                  DataRow row = list.AddRow();
                  r.GetData(idField, id);
                  row.tag = id;
                  SetListRowFields(r, row);
               }
               else
                  PrintLn($"WordList match cannot be found in database.");
            }
         }
         else if(idField && stringField)
         {
            for(c=0; c<matches.count; c++)
            {
               if(r.Find(idField, middle, nil, matches[c]))
               {
                  Id id = 0;
                  String s = null;
                  r.GetData(idField, id);
                  r.GetData(stringField, s);
                  list.AddString(s).tag = id;
                  delete s;
               }
               else
                  PrintLn($"WordList match cannot be found in database.");
            }
         }
      }
      else if(!disabledFullListing)
      {
         if(listFields && idField)
         {
            while(r.Next())
            {
               Id id = 0;
               DataRow row = list.AddRow();
               r.GetData(idField, id);
               row.tag = id;
               SetListRowFields(r, row);
            }
         }
         else if(idField && stringField)
         {
            while(r.Next())
            {
               Id id = 0;
               String s = null;
               r.GetData(idField, id);
               r.GetData(stringField, s);
               list.AddString(s).tag = id;
               delete s;
            }
         }
      }
   }

   void Create()
   {
      //list.NotifySelect(this, list, null, 0);
      if(window && !window.modifiedDocument)
      {
         uint id; // = table.rowsCount + 1; // this is bad with deleted rows, won't work, how to have unique id? 
         Row r = editRow;// { table };
      
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
               int curID = 0;
               if(r.GetData(idField, curID))
                  id = curID;
               else
                  r.SetData(idField, id);
            }
            /*if(fldActive)
               r.SetData(fldActive, active);*/

            //if(NotifyNew(master, this, r))
            if(listFields && idField)
            {
               DataRow row;
               for(lf : listFields)
               {
                  if(lf.dataField && lf.field)
                  {
                     if(lf.field.type == class(String))
                     {
                        r.SetData(lf.field, $"[New]");
                     }
                  }
               }
               row = list.AddRow();
               row.tag = id;
               SetListRowFields(r, row);
            }
            else if(idField && stringField)
            {
               r.SetData(stringField, $"[New]");
               list.AddString($"[New]").tag = id;
            }
            delete r;
         }

         if(list)
         {
            list.Sort(listSortField, listSortOrder);
            list.currentRow.tag = id;
            SelectListRow(list.currentRow);
         }
         OnStateChanged(window);
      }
   }

   void Remove()
   {
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
            OnStateChanged(window);
         }
      }
   }

   void Load()
   {
      EditLoad();
   }

   void Write()
   {
      EditSave();
   }

   bool ListSelect(DataRow row)
   {
      bool result = true;
      if(/*-row && -*/row != lastRow)
      {
         uint id;
         if(window && window.modifiedDocument)
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

   ~TableEditor()
   {
      fieldsBoxes.Free(); // TOCHECK: do I need to delete each to oppose the increb in AddFieldBox?
      delete searchString;
      wordTree.Free();
   }

   void ResetListFields()
   {
      if(list && listFields && listFields.count)
      {
         list.ClearFields();
         for(lf : listFields)
            list.AddField(lf.dataField);
      }
   }

   void AddFieldBox(FieldBox fieldBox)
   {
      fieldsBoxes.Add(fieldBox);
      if(table)
         fieldBox.Init();
      incref fieldBox;
   }

   void InitFieldsBoxes()
   {
      for(fb : fieldsBoxes)
         fb.Init();
      //NotifyInitFields(master, this);
   }

   void EditNew()
   {
      if(window)
         window.modifiedDocument = false;
   }

   void EditSave()
   {
      internalModifications = true;
      for(fb : fieldsBoxes)
         fb.Save();

      if(idField && list && listFields && listFields.count)
      {
         DataRow listRow = list.currentRow;
         // ADDED THIS HERE FOR SQLITE TO REFRESH
         editRow.Find(idField, middle, nil, listRow.tag);
         SetListRowFields(editRow, listRow);
         list.Sort(listSortField, listSortOrder);
      }
      internalModifications = false;
      if(window)
         window.modifiedDocument = false;
      OnStateChanged(window);
   }

   void EditLoad()
   {
      OnLoad(window);
      internalModifications = true;
      for(fb : fieldsBoxes)
         fb.Load();
      internalModifications = false;
      if(window)
         window.modifiedDocument = false;
      OnStateChanged(window);
   }

   void EditClear()
   {
      internalModifications = true;
      for(fb : fieldsBoxes)
         fb.Clear();
      if(window)
         window.modifiedDocument = false;
      internalModifications = false;
      OnStateChanged(window);
   }

   void SetListRowFields(Row dbRow, DataRow listRow)
   {
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
               //if(type.type == systemClass || type.type == unitClass || type.type == bitClass || type.type == enumClass)
               //   listRow.SetData(lf.dataField, (void *)&data);
               //else
               //   listRow.SetData(lf.dataField, (void *)data);
               s = lf.CustomLookup((int)data);
               listRow.SetData(lf.dataField, s);
               // Is this missing some frees here? strings?
               // type._vTbl[__ecereVMethodID_class_OnFree](type, data);
               if(type.type == structClass)
               {
                  void * dataPtr = (void *)data;
                  delete dataPtr;
               }
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
               // Is this missing some frees here? strings?
               // type._vTbl[__ecereVMethodID_class_OnFree](type, data);
               if(type.type == structClass)
               {
                  void * dataPtr = (void *)data;
                  delete dataPtr;
               }
            }
         }
      }
   }

   Array<Id> SearchWordList()
   {
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
                        PrintLn("Problem");
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

   void PrepareWordList(char * filePath)
   {
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
   }

   void OnUnserialize(IOChannel channel)
   {
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
   }
}
