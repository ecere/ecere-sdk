import "EDA.ec"

public class EDBIndexOptions
{
public:
   bool saveIndex:1, deleteIndex:1;
};

public void SetEDBIndexOptions(EDBIndexOptions options)
{
   indexOptions = options;
}

EDBIndexOptions indexOptions { saveIndex = true, deleteIndex = false; };

static void UnusedFunction()
{
   int a;
   a.OnGetString(0,0,0);
   a.OnFree();
   a.OnCopy(null);
   a.OnCompare(null);
   a.OnSaveEdit(null,0);
   a.OnEdit(null,null,0,0,0,0,0);
   a.OnDisplay(null,0,0,0,0,0,0);
   a.OnGetDataFromString(null);
   a.OnUnserialize(null);
   a.OnSerialize(null);
}

default:
extern int __ecereVMethodID_class_OnGetString;
extern int __ecereVMethodID_class_OnGetDataFromString;
extern int __ecereVMethodID_class_OnCompare;
extern int __ecereVMethodID_class_OnSerialize;
extern int __ecereVMethodID_class_OnUnserialize;
extern int __ecereVMethodID_class_OnFree;
private:

enum RowsCountFileAction { init, add, del, reuse };
void RowsCountFileEdit(Archive archive, const String apath, const RowsCountFileAction action, int * allocatedRowsCount, int * deletedRowsCount, uint * rowsCountPosition)
{
   File f;
   int temp;
   if(!*rowsCountPosition)
   {
      int c;
      File f = ((EDBArchive)archive).f;
      EDBArchiveDir dir = (EDBArchiveDir) archive.OpenDirectory(apath, FileStats { }, readOnlyDir);
      uint position;
      EAREntry entry { };
      f.Seek(dir.position, start);
      position = dir.first;
      while(true)
      {
         char fileName[MAX_FILENAME];
         if(!f.Seek(position, start)) break;
         if(!f.Read(entry, sizeof(EAREntry), 1)) break;
         f.Read(fileName, 1, entry.nameLen);
         fileName[entry.nameLen] = '\0';
         if(!strcmp(fileName, "rowsCount"))
         {
            *rowsCountPosition = position;
            break;
         }
         if(entry.next)
            position = entry.next;
         else
            break;
      }
      delete dir;
   }

   f = *rowsCountPosition ? archive.FileOpenAtPosition(*rowsCountPosition) : null;
   if(f)
   {
      f.Get(temp); *allocatedRowsCount = temp;
      f.Get(temp); *deletedRowsCount = temp;
      delete f;
   }
   else
   {
      *allocatedRowsCount = 0;
      *deletedRowsCount = 0;
   }
   
   switch(action)
   {
      case init: break;
      case add: (*allocatedRowsCount)++; break;
      case del: (*deletedRowsCount)++; break;
      case reuse: (*deletedRowsCount)--; break;
   }

   if(action != init)
   {
      ArchiveDir dir;
      TempFile tf { };
      temp = *allocatedRowsCount; tf.Put(temp);
      temp = *deletedRowsCount; tf.Put(temp);
      tf.Seek(0, start);

      dir = archive.OpenDirectory(apath, FileStats { }, replace);
      dir.AddFromFileAtPosition(*rowsCountPosition, "rowsCount", tf, { size = tf.GetSize() }, replace, 0, null, rowsCountPosition);
      delete tf;
      delete dir;
   }
}

static class EDBDataSource : DataSourceDriver
{
   class_property(name) = "EDB";

   String path;
   OldList listDatabases;
   uint databasesCount;

   String BuildLocator(DataSource ds)
   {
      return CopyString(ds.host);
   }

   uint GetDatabasesCount()
   {
      return databasesCount;
   }

   ~EDBDataSource()
   {
      delete path;
   }

   bool Connect(const String locator)
   {
      delete path;
      path = CopyString(locator);
      // TODO, use user name and password for local security?
      // TODO, open ds in read or write mode
      if(FileExists(path))
      {
         int n = 0;
         FileListing listing { path, "edb" };
         databasesCount = 0;
         while(listing.Find())
            databasesCount++;
         return true;
      }
      return false;
   }

   void Status()
   {
      Log($"Status: Feeling groovy!\n");
   }

   /*
   Table OpenDatabasesListTable(subclass(DataDriver) driver)
   {
      // get the table for databasesList using a temporary archive of a db with a table databases filled 
      // with the list of edb files in data source's dirPath
      
      TempFile f { };
      //ArchiveFile af = ArchiveOpen
      
      return null;
   }
   */

   bool RenameDatabase(const String name, const String rename)
   {
      if(name && rename && path && FileExists(path))
      {
         String path;
         path = MakeDatabasePath(name);
         if(FileExists(path))
         {
            bool renamed;
            String repath;
            repath = MakeDatabasePath(rename);
            renamed = RenameFile(path, repath);
            delete path;
            delete repath;
            return renamed;
         }
         delete path;
      }
      return false;
   }

   bool DeleteDatabase(const String name)
   {
      if(path && FileExists(path))
      {
         bool deleted;
         String path = MakeDatabasePath(name);
         deleted = DeleteFile(path);  // delete file seems to return true even if the file does not exist
         databasesCount--;
         delete path;
         return deleted;
      }
      return false;
   }

   String MakeDatabasePath(const String name)
   {
      if(name)
      {
         char build[MAX_LOCATION];
         strcpy(build, path ? path : "");
         PathCat(build, name);
         ChangeExtension(build, "edb", build);
         return CopyString(build);
      }
      return null;
   }

   Database OpenDatabase(const String name, CreateOptions createOptions, DataSource ds)
   {
      if(name && name[0])
      {
         String path = MakeDatabasePath(name);
         Archive archive = null;
         if(FileExists(path))
         {
            // Check if it's a valid archive because we don't want to create an archive at the end of another file
            archive = ArchiveOpen(path, { false, false, false });
            if(archive)
            {
               // If we want write access
               delete archive;
               archive = ArchiveOpen(path, { true, true, true });
            }
            else
               printf($"Invalid, corrupted or in use (%s) database file.\n", path);
         }
         else if(createOptions == create)
         {
            archive = ArchiveOpen(path, { true, true, true });
            if(archive)
               databasesCount++;
         }
         if(archive)
         {
            EDBDatabase db { path = path, archive = archive };
            if(!archive.FileExists("-/tables"))
            {
               int allocatedRowsCount, deletedRowsCount;
               RowsCountFileEdit(archive, "-/tables", init, &allocatedRowsCount, &deletedRowsCount, &db.tablesCountPosition);
            }
            return db;
         }
         else if(createOptions == create)
            Logf($"Database file (%s) could not be created.\n", path);
         else
            Logf($"Database file (%s) could not be opened.\n", path);
         delete path;
      }
      return null;
   }
}

static enum EAREntryType { ENTRY_FILE = 1, ENTRY_FOLDER = 2 };

static struct EAREntry
{
   EAREntryType type;
   TimeStamp32 created, modified;
   FileSize size, cSize;
   uint prev, next;
   uint nameLen;
   // null terminated file name follows
};

static class EDBArchive : Archive
{
   File f;
};
 
static class EDBArchiveDir : ArchiveDir
{
   EDBArchive archive;
   uint position;
   uint first, last;
   bool readOnly;
};

static class DBTable : struct
{
   DBTable prev, next;
   String apath;
   String apathFields;
   OldList indexes;
   OldList fields { offset = (uint)&((EDBField)0).prev; };
   ArchiveDir dir;

   uint rowsCountPosition;
   // uint fieldsCountPosition;
   uint * rowPositions;
   uint rowPositionsSize;

   int rowsCount;
   int allocatedRowsCount;
   int deletedRowsCount;
   int fieldsCount;
   DBTable fieldsTable;

   ~DBTable()
   {
      // Save Indexes
      if(indexOptions.saveIndex)
      {
         DBIndex index;
         for(index = indexes.first; index; index = index.next)
         {
            if(index.init)
            {
               char indexName[1024];
               int c;
               TempFile tf { };
               ArchiveDir dirTable;
               tf.Put(index.tree);
               strcpy(indexName, "index_");
               for(c = 0; c<index.numFields; c++)
               {
                  strcat(indexName, index.fieldIndexes[c].field.name);
                  if(index.fieldIndexes[c].memberField)
                  {
                     strcat(indexName, ".");
                     strcat(indexName, index.fieldIndexes[c].memberField.name);
                  }
                  strcat(indexName, (index.fieldIndexes[c].order == ascending) ? "+" : "-");
               }
               tf.Seek(0, start);
               
               dirTable = db.archive.OpenDirectory(apath, FileStats { }, replace);
               dirTable.AddFromFile(indexName, tf, { size = tf.GetSize() }, replace, 0, null, null);
               delete dirTable;

               delete tf;
            }
         }
      }

      delete apath;
      delete apathFields;
      delete dir;
      delete rowPositions;

      fields.RemoveAll(EDBField::Free);
      indexes.RemoveAll(DBIndex::Free);
   }

   void Free() { delete this; }

public:
   EDBDatabase db;
}

class EDBDatabase : Database
{
   String path;
   Archive archive;
   OldList dbTables;
   uint tablesCountPosition;

   property uint bufferSize { set { archive.bufferSize = value; } }
   property uint bufferRead { set { archive.bufferRead = value; } }

   ~EDBDatabase()
   {
      dbTables.RemoveAll(DBTable::Free);
      delete path;
      delete archive;
   }

   String GetName()
   {
      return path;   // TOFIX
   }

   DBTable GetDBTable(char * apath, OpenOptions options)
   {
      DBTable dbTbl;
      for(dbTbl = dbTables.first; dbTbl; dbTbl = dbTbl.next)
         if(!strcmp(apath, dbTbl.apath))
            break;
      if(!dbTbl)
      {
         char build[MAX_LOCATION];
         ArchiveDir dirTable = archive.OpenDirectory(apath, FileStats { }, replace);
         delete dirTable;
         dbTbl = DBTable { this, apath = CopyString(apath) };
         strcpy(build, apath);
         PathCat(build, "fields");
         dbTbl.apathFields = CopyString(build);
         dbTables.Add(dbTbl);

         dbTbl.dir = archive.OpenDirectory(apath, null, readOnlyDir);
      
         RowsCountFileEdit(archive, apath, init, &dbTbl.allocatedRowsCount, &dbTbl.deletedRowsCount, &dbTbl.rowsCountPosition);
         dbTbl.rowsCount = dbTbl.allocatedRowsCount - dbTbl.deletedRowsCount;

         {
            int c;
            File f = ((EDBArchive)archive).f;
            EDBArchiveDir dir = (EDBArchiveDir) dbTbl.dir;
            uint position;
            EAREntry entry { };
            uint allocatedCount = dbTbl.allocatedRowsCount;
            f.Seek(dir.position, start);
            dbTbl.rowPositionsSize = dbTbl.allocatedRowsCount;
            dbTbl.rowPositions = new0 uint[Max(1,dbTbl.rowPositionsSize)];
            position = dir.first;
            
            while(true)
            {
               char fileName[MAX_FILENAME] = "";
               uint number;
               f.Seek(position, start);
               f.Read(entry, sizeof(EAREntry), 1);
               f.Read(fileName, 1, entry.nameLen);
               fileName[entry.nameLen] = '\0';
               number = atoi(fileName);
               if(number && number <= allocatedCount)
                  dbTbl.rowPositions[number - 1] = position;
               if(entry.next)
                  position = entry.next;
               else
                  break;
            }
         }

         if(options.type == tablesList)
         {
            dbTbl.fields.Add(EDBField
               { 
                  tbl = dbTbl, 
                  name = CopyString("Name"), 
                  type = class(String), 
                  length = 0,
                  num = 1
               });
            dbTbl.fieldsCount = 1;
         }
         else if(options.type == fieldsList)
         {
            dbTbl.fields.Add(EDBField
               {
                  tbl = dbTbl,
                  name = CopyString("Name"),
                  type = class(String),
                  length = 0,
                  num = 1
               });
            dbTbl.fields.Add(EDBField
               {
                  tbl = dbTbl,
                  name = CopyString("Type"),
                  type = class(Class),
                  length = 0,
                  num = 2
               });
            dbTbl.fields.Add(EDBField
               {
                  tbl = dbTbl,
                  name = CopyString("Length"),
                  type = class(int),
                  length = 0,
                  num = 3
               });
            dbTbl.fieldsCount = 3;
         }
         else
         {
            int num, rowsCount, deletedRowsCount;
            DBTable fieldsTable = dbTbl.fieldsTable;
            if(!fieldsTable) fieldsTable = dbTbl.fieldsTable = GetDBTable(dbTbl.apathFields, { fieldsList });
            RowsCountFileEdit(archive, dbTbl.apathFields, init, &rowsCount, &deletedRowsCount, &dbTbl.fieldsTable.rowsCountPosition /*fieldsCountPosition*/);

            for(num = 1; num <= rowsCount; num++)          // TOFIX in future a field position might have been deleted
            {
               EDBField fld { tbl = dbTbl, num = num };
               incref fld;
               fld.Read();
               dbTbl.fields.Add(fld);
            }
            dbTbl.fieldsCount = rowsCount;
         }
      }
      return dbTbl;
   }

   uint ObjectsCount(ObjectType type)
   {
      // TODO
      return 0;
   }

   bool RenameObject(ObjectType type, const String name, const String rename)
   {
      // TODO
      return false;
   }

   bool DeleteObject(ObjectType type, const String name)
   {
      // TODO
      return false;
   }

   Table OpenTable(const String name, OpenOptions options)
   {
      EDBTable tbl = null;
      char apath[MAX_LOCATION] = "";
      switch(options.type)
      {
         case viewRows:
            break;
         case processesList:
            break;
         case databasesList:
            {
               // get the table for databasesList using a temporary archive of a db with a table databases filled 
               // with the list of edb files in data source's dirPath
            }
            break;
         case queryRows:
            break;
         case tableRows:
            if(name)
            {
               Table tblTables = OpenTable(null, { tablesList });
               if(tblTables)
               {
                  Row rowTables { tblTables };
                  Field fldTableName = tblTables.FindField("Name");
                  if(fldTableName)
                  {
                     if(!rowTables.Find(fldTableName, first, nil, name))
                     {
                        if(options.create == create)
                        {
                           strcpy(apath, name);
                           rowTables.Add();
                           rowTables.SetData(fldTableName, name);
                        }
                        else
                           Logf($"Table (%s) does not exist.\n", name);
                     }
                     else
                        strcpy(apath, name);
                  }
                  delete rowTables;
                  delete tblTables;
               }
               else
                  Log($"Unable to detect if table exists!\n");
            }
            break;
         case tablesList:
            strcpy(apath, "-/tables");
            break;
         case fieldsList:
            if(name)
            {
               strcpy(apath, name);
               PathCat(apath, "fields");
            }
            break;
      }

      if(apath[0] && archive)
      {
         DBTable dbTable = GetDBTable(apath, options);
         if(dbTable)
         {
            tbl = EDBTable { dbTable = dbTable };
            LinkTable(tbl);
         }
      }
      return tbl;
   }
}

static struct IndexBinaryTree : BinaryTree
{
   DBIndex index;
};

static int IndexCompareRows(IndexBinaryTree tree, uint r1, uint r2)
{
   DBIndex index = tree.index;
   int f;
   EDBRow row1 = index.row1;
   EDBRow row2 = index.row2;
   
   if(index.cache && index.cache._num == r1)
      row1 = index.cache;
   else
   {
      row1.tbl = index.dbTable;
      row1.num = r1;
   }

   if(index.cache && index.cache._num == r2)
      row2 = index.cache;
   else
   {
      row2.tbl = index.dbTable;
      row2.num = r2;
   }

   for(f = 0; f < index.numFields; f++)
   {
      Field field = index.fieldIndexes[f].field;
      int order = (index.fieldIndexes[f].order == ascending) ? 1 : -1;
      Field memberField = index.fieldIndexes[f].memberField;
      while(field)
      {
         Class type = field.type;
         int64 data1 = 0, data2 = 0;
         int fieldResult = 0;
         if(type.type == structClass)
         {
            data1 = (int64)new0 byte[type.structSize];
            data2 = (int64)new0 byte[type.structSize];
         }
         ((bool (*)())(void *)row1.GetData)(row1, field, type, (type.type == structClass) ? (void *)data1 : &data1);
         ((bool (*)())(void *)row2.GetData)(row2, field, type, (type.type == structClass) ? (void *)data2 : &data2);
         fieldResult = order * type._vTbl[__ecereVMethodID_class_OnCompare](type, 
            (type.type == systemClass || type.type == bitClass || type.type == enumClass || type.type == unitClass) ? &data1 : (void *)data1,
            (type.type == systemClass || type.type == bitClass || type.type == enumClass || type.type == unitClass) ? &data2 : (void *)data2);
         type._vTbl[__ecereVMethodID_class_OnFree](type, data1);
         type._vTbl[__ecereVMethodID_class_OnFree](type, data2);
         if(field.type.type == structClass)
         {
            void * dataPtr = (void *)data1;
            delete dataPtr;
            dataPtr = (void *)data2;
            delete dataPtr;
         }
         if(fieldResult)
         {
            if(memberField)
            {
               row1 = index.row1;
               row1.tbl = ((EDBTable)index.fieldIndexes[f].memberTable).dbTable;
               row1.index = ((EDBTable)index.fieldIndexes[f].memberTable).index;
               row1.num = 0;
               row1.Find(index.fieldIndexes[f].memberIdField, middle, nil, data1);

               row2 = index.row2;
               row2.tbl = ((EDBTable)index.fieldIndexes[f].memberTable).dbTable;
               row2.index = ((EDBTable)index.fieldIndexes[f].memberTable).index;
               row2.num = 0;
               row2.Find(index.fieldIndexes[f].memberIdField, middle, nil, data2);               

               field = memberField;
               memberField = null;
            }
            else
               return fieldResult;
         }
         else
            break;
      }
   }
   if(r1 > r2)
      return 1;
   else if(r1 < r2)
      return -1;
   else
      return 0;
}

static class DBIndex : struct
{
   DBIndex prev, next;
   DBTable dbTable;
   int numFields;
   FieldIndex * fieldIndexes;
   EDBRow row1 { };
   EDBRow row2 { };
   EDBRow cache;
   IndexBinaryTree tree
   {
      index = this,
      CompareKey = (void *)IndexCompareRows;
   };
   bool init;

   ~DBIndex()
   {
      tree.Free();
      delete fieldIndexes;
   }
   void Free() { delete this; }
}

static class EDBTable : Table
{
   DBTable dbTable;
   DBIndex index;

   Field AddField(const String name, Class type, int length)
   {
      EDBDatabase edb = dbTable.db;
      EDBField field
      {  
         tbl = dbTable,
         name = CopyString(name),
         type = type,
         length = length
      };
      DBTable fieldsTable = dbTable.fieldsTable;
      incref field;
      if(!fieldsTable) fieldsTable = dbTable.fieldsTable = edb.GetDBTable(dbTable.apathFields, { fieldsList });

      RowsCountFileEdit(edb.archive, dbTable.apathFields, add, &fieldsTable.allocatedRowsCount, &fieldsTable.deletedRowsCount, &fieldsTable.rowsCountPosition /*dbTable.fieldsCountPosition*/);
      fieldsTable.rowsCount = fieldsTable.allocatedRowsCount - fieldsTable.deletedRowsCount;

      // What should this be?
      fieldsTable.rowPositions = renew0 fieldsTable.rowPositions uint[fieldsTable.allocatedRowsCount];

      dbTable.fields.Add(field);

      // Field num starts at index base 1 !
      field.num = dbTable.fields.count;
      field.Write();
      return field;
   }

   Field FindField(const String name)
   {
      Field fld;
      for(fld = dbTable.fields.first; fld; fld = fld.next)
         if(!strcmp(fld.name, name))
            return fld;
      return null;
   }

   Field GetFirstField()
   {
      return dbTable.fields.first;
   }

   DriverRow CreateRow()
   {
      return EDBRow { tbl = dbTable, index = index, num = 0 };
   }
   
   bool GenerateIndex(int count, FieldIndex * fieldIndexes, bool init)
   {
      DBIndex index = null;
      //Time startTime = GetTime();
      if(count)
      {
         for(index = dbTable.indexes.first; index; index = index.next)
         {
            if(index.numFields == count)
            {
               int c;
               for(c = 0; c<count; c++)
                  if(index.fieldIndexes[c].field != fieldIndexes[c].field || 
                     index.fieldIndexes[c].order != fieldIndexes[c].order ||
                     index.fieldIndexes[c].memberField != fieldIndexes[c].memberField)
                     break;
               if(c == count)
                  break;
            }         
         }
         if(!index)
         {
            int c;

            for(c = 0; c<count; c++)
            {
               if(!fieldIndexes[c].field)
                  return false;
               else
               {
                  EDBField field;
                  for(field = dbTable.fields.first; field; field = field.next)
                     if(field == fieldIndexes[c].field)
                        break;
                  if(!field) 
                     return false;
               }
            }
            index = DBIndex { numFields = count, dbTable = dbTable, init = init };
            index.fieldIndexes = new FieldIndex[count];
            memcpy(index.fieldIndexes, fieldIndexes, count * sizeof(FieldIndex));
            dbTable.indexes.Add(index);

            {
#ifdef _DEBUG
               //char output[10000];
#endif
               char indexName[1024];
               int c;
               File f = null;
               strcpy(indexName, "index_");
               for(c = 0; c<index.numFields; c++)
               {
                  strcat(indexName, index.fieldIndexes[c].field.name);
                  if(index.fieldIndexes[c].memberField)
                  {
                     strcat(indexName, ".");
                     strcat(indexName, index.fieldIndexes[c].memberField.name);
                  }
                  strcat(indexName, (index.fieldIndexes[c].order == ascending) ? "+" : "-");
               }
               if(init)
                  f = dbTable.dir.FileOpen(indexName);
               if(f)
               {
                  ArchiveDir dir = dbTable.db.archive.OpenDirectory(dbTable.apath, FileStats { }, replace);
                  f.Get(index.tree);
                  delete f;
                  if(indexOptions.deleteIndex)
                     dir.Delete(indexName);
                  delete dir;
               }
               else
               {
                  index.cache = EDBRow { tbl = dbTable };
                  for(c = 1; c<= dbTable.allocatedRowsCount; c++)
                  {
                     char file[MAX_FILENAME];
                     sprintf(file, "%d", c);
                     index.cache.num = c;
                     if(dbTable.rowPositions[c - 1])
                        index.tree.Add(BTNode { c });
                  }
                  delete index.cache;
               }
#ifdef _DEBUG
               /*
               index.tree.Print(output, inOrder);
               printf("\n\n%s - %s:\n", dbTable.apath, indexName);
               puts(output);
               printf("\n");
               */
#endif
            }
         }
      }
      this.index = index;
#ifndef ECERE_STATIC
      //Logf("Indexing took %f seconds\n", GetTime() - startTime);
#endif
      return true;
   }

   String GetName()
   {
      return dbTable.apath;
   }

   uint GetFieldsCount()
   {
      return dbTable.fieldsCount;
   }

   uint GetRowsCount()
   {
      return dbTable.rowsCount;
   }
}

static class EDBField : Field
{
public:
   EDBField prev, next;
   DBTable tbl;
   property int num
   {
      set
      {
         num = value;
         delete apath;
         delete aname;
         if(num)
         {
            char file[MAX_FILENAME];
            char build[MAX_LOCATION];
            sprintf(file, "%d", num);
            strcpy(build, tbl.apath);
            PathCat(build, "fields");
            PathCat(build, file);
            apath = CopyString(build);
            aname = CopyString(file);
         }
      }
   }
   String name;
   Class type;
   int length;

   int num;
   String apath;
   String aname;

   String GetName() { return name; }
   Class GetType() { return type; }
   int GetLength() { return length; }
   Field GetNext() { return next; }
   Field GetPrev() { return prev; }
   Table GetTable() { return (Table)tbl; }

   ~EDBField()
   {
      delete apath;
      delete aname;
      delete name;
   }

   void Read()
   {
      EDBDatabase edb = tbl.db;
      if(aname)
      {
         File f = edb.archive.FileOpen(apath);
         if(f)
         {
            int numFields;
            uint offsets[3];
            f.Get(numFields);
            f.Read(offsets, sizeof(uint), 3);
            f.Get(name);
            f.Get(type);
            f.Get(length);
            delete f;
         }
         else
            Log($"Error reading field");
      }
   }

   void Write()
   {
      int length = 0;
      TempFile f { };
      ArchiveDir dir;
      EDBDatabase edb = tbl.db;
      int numFields = 3;
      uint offsets[3];
      f.Put(numFields);
      f.Write(offsets, sizeof(uint), numFields);
      offsets[0] = f.Tell();
      f.Put(name);
      offsets[1] = f.Tell();
      f.Put(type);
      offsets[2] = f.Tell();
      f.Put(length);
      f.Seek(sizeof(uint), start);
      f.Write(offsets, sizeof(uint), numFields);
      f.Seek(0, start);

      dir = edb.archive.OpenDirectory(tbl.apathFields, FileStats { }, replace);
      dir.AddFromFile(aname, f, { size = f.GetSize() }, replace, 0, null, null);
      delete f;
      delete dir;
   }

   void Free() { delete this; }
}

static class EDBRow : DriverRow
{
   DBTable tbl;
   DBIndex index;
   BTNode node;
   
   String aname;
   int _num;

   property int num
   {
      set
      {
         _num = value;
         delete aname;
         /*if(tbl && _num)
         {
            char file[MAX_FILENAME];
            sprintf(file, "%d", _num);
            aname = CopyString(file);
         }*/
      }
   }

   ~EDBRow()
   {
      delete aname;
   }

   bool GetData(EDBField field, typed_object & data)
   {
      bool result = false;
      EDBDatabase edb = tbl.db;
      File f = (_num && tbl.rowPositions[_num - 1]) ? edb.archive.FileOpenAtPosition(tbl.rowPositions[_num - 1]) : null;
      if(f && data._class)
      {
         uint numFields = 0;
         f.Seek(0, start);
         f.Get(numFields);
         if(numFields)
         {
            uint * offsets = new0 uint[numFields];
            f.Read(offsets, sizeof(uint), numFields);
            if(((field.num < numFields && offsets[field.num-1] && offsets[field.num-1] != offsets[field.num]) || (field.num == numFields && offsets[field.num-1])))
            {
               f.Seek(offsets[field.num-1], start);
               field.type._vTbl[__ecereVMethodID_class_OnUnserialize](field.type, data, f);
               result = true;
            }

            delete offsets;
         }
      }
      delete f;
      return result;
   }

   bool SetData(EDBField field, typed_object data)
   {
      EDBDatabase edb = tbl.db;
      File f = (_num && tbl.rowPositions[_num - 1]) ? edb.archive.FileOpenAtPosition(tbl.rowPositions[_num - 1]) : null;
      if(f)
      {
         TempFile tf { };
         ArchiveDir dirTable;

         uint numFields, oldNumFields = 0;
         f.Seek(0, start);
         f.Get(oldNumFields);
         numFields = Max(oldNumFields, tbl.fields.count);

         if(numFields)
         {
            uint * offsets = new0 uint[numFields];
            byte * buffer = null;
            uint size;
            f.Read(offsets, sizeof(uint), oldNumFields);
            tf.Put(numFields);
            
            tf.Write(offsets, sizeof(uint), numFields);

            size = f.GetSize();
            if(field.num-1 < oldNumFields)
            {
               // We will read right up to to the field we're writing to
               // (Size will be from right after the offset table to that offset)
                if(offsets[field.num-1])
                  // *** Fields are based at index 1, if we're writing the last field we need to set size to its offset
                  // because we will be rewriting over it. ***
                  size = offsets[field.num-1];
                else
                {
                   int c;
                   // If this field does not exist yet (offsets[field.num-1] == 0), we want to write at the end (leave size = f.GetSize()),
                   for(c = field.num; c < oldNumFields; c++)
                   {
                      if(offsets[c])
                      {
                         size = offsets[c];
                         break;
                      }
                   }
                }
            }

            // Subtract the header (numFields + offsets table), that's where we're at right now
            size -= f.Tell();

            if(size)
            {
               buffer = renew buffer byte[size];
               f.Read(buffer, 1, size);
               tf.Write(buffer, 1, size);               
            }

            // Update the offset of the field we're writing to
            offsets[field.num-1] = tf.Tell();
            // Serialize the data we're writing
            field.type._vTbl[__ecereVMethodID_class_OnSerialize](field.type, data, tf);

            if(field.num < numFields)
            {
               int c;
               int difference = 0;
               for(c = field.num; c<numFields; c++)
               {
                  if(offsets[c])
                  {
                     difference = tf.Tell() - offsets[c];
                     break;
                  }
               }
                
               if(c < numFields)
               {
                  int fileSize = f.GetSize();
                  f.Seek(offsets[c], start);
                  size = fileSize - offsets[c];
                  buffer = renew buffer byte[size];
                  f.Read(buffer, 1, size);
                  tf.Write(buffer, 1, size);
               }
               for(; c<numFields; c++)
               {
                  if(offsets[c])
                     offsets[c] += difference;
               }
            }
            if(numFields > oldNumFields)
            {
               int c;
               for(c = 0; c < field.num - 1; c++)
               {
                  if(offsets[c])
                     offsets[c] += (numFields - oldNumFields) * sizeof(uint);
               }
            }

            tf.Seek(sizeof(uint), start);
            tf.Write(offsets, sizeof(uint), numFields);

            delete buffer;
            delete offsets;
         }

         delete f;
         dirTable = edb.archive.OpenDirectory(tbl.apath, FileStats { }, replace);
         tf.Seek(0, start);
         if(!aname)
         {
            char file[MAX_FILENAME];
            sprintf(file, "%d", _num);
            aname = CopyString(file);
         }
         dirTable.AddFromFileAtPosition(tbl.rowPositions[_num - 1], aname, tf, { size = tf.GetSize() }, replace, 0, null, &tbl.rowPositions[_num - 1]);
         delete tf;
         delete dirTable;

         {
            DBIndex i;
            for(i = tbl.indexes.first; i; i = i.next)
            {
               BTNode n = (i == index) ? node : null;
               int c;
               for(c = 0; c<i.numFields; c++)
                  if(i.fieldIndexes[c].field == field || 
                     i.fieldIndexes[c].memberField == field ||
                     i.fieldIndexes[c].memberIdField == field)
                     break;
               if(c == i.numFields) continue;

               if(!n)
                  n = i.tree.FindAll(_num);
               if(n)
               {
                  i.tree.Remove(n);
                  i.tree.Add(n);
               }
            }
         }
      }
      return true;
   }

   bool Nil()
   {
      return !_num;
   }
   
   bool Select(MoveOptions move)
   {
      EDBDatabase edb = tbl.db;
      if(tbl.rowsCount)
      {
         if(index)
         {
            switch(move)
            {
               case first:
                  node = index.tree.first;
                  num = node ? (uint)node.key : 0;
                  return _num != 0;
               case next:
                  node = node ? node.next : index.tree.first;
                  num = node ? (uint)node.key : 0;
                  return _num != 0;
               case last:
                  node = index.tree.last;
                  num = node ? (uint)node.key : 0;
                  return _num != 0;
               case previous:
                  node = node ? node.prev : index.tree.last;
                  num = node ? (uint)node.key : 0;
                  return _num != 0;
               case middle:
                  node = index.tree.root;
                  num = node ? (uint)node.key : 0;
                  return _num != 0;
               case nil:
                  num = 0;
                  break;
            }
         }
         else
            switch(move)
            {
               case first:
                  num = 0;
               case next:
                  while(_num < tbl.allocatedRowsCount)
                  {
                     num = _num + 1;
                     if(tbl.rowPositions[_num - 1])
                        return true;
                  }
                  num = 0;
                  break;
               case last:
                  num = tbl.allocatedRowsCount + 1;
               case previous:
                  while(_num)
                  {
                     num = _num - 1;
                     if(tbl.rowPositions[_num - 1])
                        return true;
                  }
                  break;
               case middle:
               case nil:
                  num = 0;
                  break;
            }
      }
      return false;
   }

   int CompareRowNum(int num, EDBField field, typed_object data)
   {
      int result = -1;
      EDBDatabase edb = tbl.db;
      File f;
      f = (num && tbl.rowPositions[num - 1]) ? edb.archive.FileOpenAtPosition(tbl.rowPositions[num - 1]) : null;
      if(f && data._class)
      {
         uint numFields = 0;
         f.Get(numFields);
         if(field.num <= numFields)
         {
            uint * offsets = new0 uint[numFields];
            Class type = field.type;
            int64 read = 0;

            f.Read(offsets, sizeof(uint), numFields);

            if(((field.num < numFields && offsets[field.num-1] && offsets[field.num-1] != offsets[field.num]) || (field.num == numFields && offsets[field.num-1])))
            {
               f.Seek(offsets[field.num-1], start);
               if(type.type == structClass)
                  read = (int64)new0 byte[type.structSize];
               type._vTbl[__ecereVMethodID_class_OnUnserialize](type, (type.type == structClass) ? (void *)read : &read, f);
            }
            //if(data._class == type)
            {
               result = type._vTbl[__ecereVMethodID_class_OnCompare](type,
                     (type.type == systemClass || type.type == bitClass || type.type == enumClass || type.type == unitClass) ? &read : (void *)read, data);
            }
            type._vTbl[__ecereVMethodID_class_OnFree](type, read);
            if(type.type == structClass)
            {
               void * dataPtr = (void *)read;
               delete dataPtr;
            }
            delete offsets;
         }
         
         delete f;
      }
      return result;
   }

   int CompareRow(EDBField field, typed_object data)
   {
      return CompareRowNum(_num, field, data);
   }

   bool Find(EDBField field, MoveOptions move, MatchOptions match, typed_object data)
   {
      EDBDatabase edb = tbl.db;
      if(tbl == field.tbl)
      {
         if(tbl.rowsCount)
         {
            /*if(move == nil)
               return false;*/

            if(index && index.fieldIndexes[0].field == field && !index.fieldIndexes[0].memberField)
            {
               BTNode node = this.node, lastNode = null;
               int result;
               int order = (index.fieldIndexes[0].order == ascending) ? 1 : -1;

               if(move == next || move == nil)
               {
                  if(move == next)
                     node = node ? node.next : null;
                  else
                     move = next;
                  result = node ? order * CompareRowNum((uint)node.key, field, data) : 1;
                  // We won't find this on our right
                  if(result > 0)
                  {
                     this.node = null;
                     num = 0;
                     return false;
                  }
                  // The next row is good
                  else if(result == 0)
                  {
                     this.node = node;
                     num = (uint)node.key;
                     return true;                  
                  }
               }
               else if(move == previous)
               {
                  node = node ? node.prev : null;
                  result = node ? order * CompareRowNum((uint)node.key, field, data) : -1;
                  // We won't find this on our left
                  if(result < 0)
                  {
                     this.node = null;
                     num = 0;
                     return false;
                  }
                  // The previous row is good
                  else if(result == 0)
                  {
                     this.node = node;
                     num = (uint)node.key;
                     return true;                  
                  }
               }

               // Go up as high as we need to
               if(move == here)
               {
                  while(node)
                  {
                     BTNode max = node.maximum, min = node.minimum;
                     int maxResult = order * CompareRowNum((uint)max.key, field, data);
                     int minResult = order * CompareRowNum((uint)min.key, field, data);
                     if(maxResult >= 0 && minResult <= 0) break;
                     node = node.parent;
                  }
               }
               else if(move == first || move == next)
               {
                  if(move == first)
                     node = index.tree.first;
                  while(node)
                  {
                     BTNode max = node.maximum;
                     result = order * CompareRowNum((uint)max.key, field, data);
                     if(result >= 0) break;
                     node = node.parent;
                  }
               }
               else if(move == last || move == previous)
               {
                  node = index.tree.last;
                  while(node)
                  {
                     BTNode min = node.minimum;
                     result = order * CompareRowNum((uint)min.key, field, data);
                     if(result <= 0) break;
                     node = node.parent;
                  }
               }
               else if(move == middle)
                  node = index.tree.root;

               // Go down
               while(node)
               {
                  result = order * CompareRowNum((uint)node.key, field, data);
                  if(!result) break;
                  node = (result < 0) ? node.right : node.left;
               }

               // Look for closest matching row to search point
               while(node && !result)
               {
                  lastNode = node;
                  node = (move == last || move == previous) ? node.next : node.prev;
                  if(node) result = order * CompareRowNum((uint)node.key, field, data);
               }
               this.node = lastNode;
               num = lastNode ? (uint)lastNode.key : 0;
               return lastNode ? true : false;
            }
            else
            {
               if(move == first || move == middle)
               {
                  Select(first);
                  move = next;
               }
               else if(move == last)
               {
                  Select(last);
                  move = previous;
               }
               else if(move == next)
                  Select(next);
               else if(move == previous)
                  Select(previous);
               else if(move == nil)
                  move = next;
               while(_num)
               {
                  int result = CompareRow(field, data);
                  if(!result)
                  {
                     return true;
                  }
                  Select(move);
               }
            }
         }
      }
      return false;
   }

   int MultipleCompareRowNum(int num, FieldFindData * findData, int numFindFields)
   {
      int result = -1;
      EDBDatabase edb = tbl.db;
      File f;
      f = (num && tbl.rowPositions[num - 1]) ? edb.archive.FileOpenAtPosition(tbl.rowPositions[num - 1]) : null;
      if(f)
      {
         uint numFields = 0;
         int c;
         uint * offsets;
         f.Get(numFields);
         offsets = new0 uint[numFields];
         f.Read(offsets, sizeof(uint), numFields);

         for(c = 0; c<numFindFields; c++)
         {
            EDBField field = (EDBField)findData[c].field;
            int order = (!index || index.fieldIndexes[c].order == ascending) ? 1 : -1;

            if(field.num <= numFields)
            {
               Class type = field.type;
               int64 read = 0;

               if(((field.num < numFields && offsets[field.num-1] && offsets[field.num-1] != offsets[field.num]) || (field.num == numFields && offsets[field.num-1])))
               {
                  f.Seek(offsets[field.num-1], start);

                  if(type.type == structClass)
                     read = (int64)new0 byte[type.structSize];
                  type._vTbl[__ecereVMethodID_class_OnUnserialize](type, (type.type == structClass) ? (void *)read : &read, f);
               }
               //if(data._class == type)
               {
                  result = order * type._vTbl[__ecereVMethodID_class_OnCompare](type,
                        (type.type == systemClass || type.type == bitClass || type.type == enumClass || type.type == unitClass) ? &read : (void *)read, 
                        (type.type == systemClass || type.type == bitClass || type.type == enumClass || type.type == unitClass) ? &findData[c].value.i64 : (void *)findData[c].value.i64);
               }
               type._vTbl[__ecereVMethodID_class_OnFree](type, read);
               if(type.type == structClass)
               {
                  void * dataPtr = (void *)read;
                  delete dataPtr;
               }

               if(result) break;
            }
         }
         delete offsets;
         delete f;
      }
      return result;
   }

   int MultipleCompareRow(FieldFindData * findData, int numFields)
   {
      return MultipleCompareRowNum(_num, findData, numFields);
   }

   bool FindMultiple(FieldFindData * findData, MoveOptions move, int numFields)
   {
      EDBDatabase edb = tbl.db;
      int c;
      for(c = 0; c<numFields; c++)
         if(tbl != ((EDBField)findData[c].field).tbl)
            break;
      if(c == numFields)
      {
         if(tbl.rowsCount)
         {
            bool indexedFind = false;
            /*if(move == nil)
               return false;*/
            if(index)
            {
               for(c = 0; c<numFields; c++)
               {
                  if(index.numFields <= c || index.fieldIndexes[c].field != findData[c].field || index.fieldIndexes[c].memberField)
                     break;
               }
               if(c == numFields)
                  indexedFind = true;
            }
            if(indexedFind)
            {
               BTNode node = this.node, lastNode = null;
               int result;
               
               if(move == next || move == nil)
               {
                  if(move == next)
                     node = node ? node.next : null;
                  else
                     move = next;
                  result = node ? MultipleCompareRowNum((uint)node.key, findData, numFields) : 1;
                  // We won't find this on our right
                  if(result > 0)
                  {
                     this.node = null;
                     num = 0;
                     return false;
                  }
                  // The next row is good
                  else if(result == 0)
                  {
                     this.node = node;
                     num = (uint)node.key;
                     return true;                  
                  }
               }
               else if(move == previous)
               {
                  node = node ? node.prev : null;
                  result = node ? MultipleCompareRowNum((uint)node.key, findData, numFields) : -1;
                  // We won't find this on our left
                  if(result < 0)
                  {
                     this.node = null;
                     num = 0;
                     return false;
                  }
                  // The previous row is good
                  else if(result == 0)
                  {
                     this.node = node;
                     num = (uint)node.key;
                     return true;                  
                  }
               }

               // Go up as high as we need to
               if(move == first || move == next)
               {
                  if(move == first)
                     node = index.tree.first;
                  while(node)
                  {
                     BTNode max = node.maximum;
                     result = MultipleCompareRowNum((uint)max.key, findData, numFields);
                     if(result >= 0) break;
                     node = node.parent;
                  }
               }
               else if(move == last || move == previous)
               {
                  node = index.tree.last;
                  while(node)
                  {
                     BTNode min = node.minimum;
                     result = MultipleCompareRowNum((uint)min.key, findData, numFields);
                     if(result <= 0) break;
                     node = node.parent;
                  }
               }
               else if(move == middle)
                  node = index.tree.root;

               // Go down
               while(node)
               {
                  result = MultipleCompareRowNum((uint)node.key, findData, numFields);
                  if(!result) break;
                  node = (result < 0) ? node.right : node.left;
               }

               // Look for closest matching row to search point
               while(node && !result)
               {
                  lastNode = node;
                  node = (move == last || move == previous) ? node.next : node.prev;
                  if(node) result = MultipleCompareRowNum((uint)node.key, findData, numFields);
               }
               this.node = lastNode;
               num = lastNode ? (uint)lastNode.key : 0;
               return lastNode ? true : false;
            }
            else
            {
               if(move == first || move == middle)
               {
                  Select(first);
                  move = next;
               }
               else if(move == last)
               {
                  Select(last);
                  move = previous;
               }
               else if(move == nil)
                  move = next;
               else if(!_num)
                  Select(first);
               while(_num)
               {
                  int result = MultipleCompareRow(findData, numFields);
                  if(!result)
                  {
                     return true;
                  }
                  Select(move);
               }
            }
         }
      }
      return false;
   }

   bool Synch(DriverRow to)
   {
      EDBRow rowTo = (EDBRow)to;
      if(tbl == rowTo.tbl)
      {
         num = rowTo._num;
         node = rowTo.node;
         return true;
      }
      return false;
   }

   bool Add(uint64 id)
   {
      bool reused = tbl.deletedRowsCount != 0;
      EDBDatabase edb = tbl.db;
      TempFile f;
      ArchiveDir dirTable;
      
      RowsCountFileEdit(edb.archive, tbl.apath, reused ? reuse : add, &tbl.allocatedRowsCount, &tbl.deletedRowsCount, &tbl.rowsCountPosition);
      tbl.rowsCount = tbl.allocatedRowsCount - tbl.deletedRowsCount;
      if(reused)
      {
         int n;
         for(n = 1; n <= tbl.allocatedRowsCount; n++)
         {
            if(!tbl.rowPositions[n - 1])
               break;
         }
         num = n;
      }
      else
      {
         num = tbl.rowsCount;

         if(tbl.allocatedRowsCount > tbl.rowPositionsSize)
         {
            tbl.rowPositionsSize = tbl.allocatedRowsCount + tbl.allocatedRowsCount / 2;
            //tbl.rowPositionsSize = tbl.allocatedRowsCount;
            tbl.rowPositions = renew0 tbl.rowPositions uint[Max(1, tbl.rowPositionsSize)];
         }
         tbl.rowPositions[tbl.allocatedRowsCount - 1] = 0;
      }

      dirTable = edb.archive.OpenDirectory(tbl.apath, FileStats { }, replace);
      
      f = TempFile { };
      f.Seek(0, start);

      if(!aname)
      {
         char file[MAX_FILENAME];
         sprintf(file, "%d", _num);
         aname = CopyString(file);
      }
      dirTable.AddFromFileAtPosition(tbl.rowPositions[_num - 1], aname, f, { size = f.GetSize() }, replace, 0, null, &tbl.rowPositions[_num - 1]);
      delete f;
      
      delete dirTable;
      
      {
         DBIndex i;
         for(i = tbl.indexes.first; i; i = i.next)
         {
            BTNode n { _num };
            i.tree.Add(n);
            if(i == index)
               node = n;
         }
      }
      return true;
   }

   bool Delete()
   {
      if(_num)
      {
         EDBDatabase edb = tbl.db;
         ArchiveDir dirTable;
         BTNode node = this.node;
         int oldNum = this._num;
         
         RowsCountFileEdit(edb.archive, tbl.apath, del, &tbl.allocatedRowsCount, &tbl.deletedRowsCount, &tbl.rowsCountPosition);
         tbl.rowsCount = tbl.allocatedRowsCount - tbl.deletedRowsCount;
         tbl.rowPositions[_num - 1] = 0;
         
         dirTable = edb.archive.OpenDirectory(tbl.apath, FileStats { }, replace);
         if(!aname)
         {
            char file[MAX_FILENAME];
            sprintf(file, "%d", _num);
            aname = CopyString(file);
         }
         dirTable.Delete(aname);
         delete dirTable;
         
         Select(next);
         if(!_num)
            Select(last);
         
         {
            DBIndex i;
            for(i = tbl.indexes.first; i; i = i.next)
            {
               BTNode n = (i == index) ? node : null;
               if(!n)
                  n = i.tree.FindAll(oldNum);
               if(n)
               {
                  i.tree.Delete(n);
               }
            }
            node = null;
         }
         return true;
      }
      return false;
   }

   int GetSysID()
   {
      return _num;
   }

   bool GoToSysID(int id)
   {
      if(tbl.allocatedRowsCount >= id && id > 0 && tbl.rowPositions[id - 1])
      {
         _num = id;
         
         if(index)
            node = index.tree.FindAll(id);
         return true;
      }
      return false;
   }
}
