#ifdef ECERE_STATIC
public import static "ecere"
public import static "EDA"
#else
public import "ecere"
public import "EDA"
#endif

#include "sqlite3.h"

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

int CollationCompare(Class type, int count1, void * data1, int count2, void * data2)
{
   if(type.type == normalClass || type.type ==  noHeadClass)
   {
      Instance inst1, inst2;
      int result;
      SerialBuffer buffer1 { size = count1, count = count1, buffer = data1 };
      SerialBuffer buffer2 { size = count2, count = count2, buffer = data2 };

      type._vTbl[__ecereVMethodID_class_OnUnserialize](type, &inst1, buffer1);
      type._vTbl[__ecereVMethodID_class_OnUnserialize](type, &inst2, buffer2);

      result = type._vTbl[__ecereVMethodID_class_OnCompare](type, inst1, inst2);
     
      buffer1.buffer = null;
      buffer2.buffer = null;
      delete buffer1;
      delete buffer2;
      inst1.OnFree();
      inst2.OnFree();
      return result;
   }
   else if(type.type == structClass)
   {
      void * inst1, * inst2;
      int result;
      SerialBuffer buffer1 { size = count1, count = count1, buffer = data1 };
      SerialBuffer buffer2 { size = count2, count = count2, buffer = data2 };

      inst1 = new0 byte[type.structSize];
      inst2 = new0 byte[type.structSize];
      type._vTbl[__ecereVMethodID_class_OnUnserialize](type, inst1, buffer1);
      type._vTbl[__ecereVMethodID_class_OnUnserialize](type, inst2, buffer2);

      result = type._vTbl[__ecereVMethodID_class_OnCompare](type, inst1, inst2);
     
      buffer1.buffer = null;
      buffer2.buffer = null;
      delete buffer1;
      delete buffer2;
      delete inst1;
      delete inst2;
      return result;
   }
   else
      return type._vTbl[__ecereVMethodID_class_OnCompare](type, data1, data2);
}

class SQLiteDataSource : DataSourceDriver
{
   class_property(name) = "SQLite";
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

   ~SQLiteDataSource()
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
         FileListing listing { path, "sqlite" };
         databasesCount = 0;
         while(listing.Find())
            databasesCount++;
         return true;
      }
      return false;
   }

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

   virtual String MakeDatabasePath(const String name)
   {
      if(name)
      {
         char build[MAX_LOCATION];
         strcpy(build, path ? path : "");
         PathCat(build, name);
         ChangeExtension(build, "sqlite", build);
         return CopyString(build);
      }
      return null;
   }

   Database OpenDatabase(const String name, CreateOptions createOptions, DataSource ds)
   {
      Database result = null;
      if(name && name[0])
      {
         String path = MakeDatabasePath(name);
         sqlite3 * db;

         // sqlite3_open(path, &db);
         // sqlite3_open_v2(path, &db, SQLITE_OPEN_READONLY /*SQLITE_OPEN_READWRITE*/ /*SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE*/, null );
         
         if(sqlite3_open_v2(path, &db, (createOptions == readOnly) ? SQLITE_OPEN_READONLY :
            (SQLITE_OPEN_READWRITE | ((createOptions == create) ? SQLITE_OPEN_CREATE : 0)), null))
         {
            // fprintf(stderr, "%s\n", s); // interesting
            printf("EDASQLite: Can't open database (%s): %s\n", path, sqlite3_errmsg(db));
            sqlite3_close(db);
         }
         else
         {
            char command[1024];
            sprintf(command, "CREATE TABLE eda_table_fields(Table_Name TEXT, Name TEXT, Type TEXT, Length INT);");
            sqlite3_exec(db, command, null, null, null);

            result = SQLiteDatabase { db = db };
         }            
         delete path;
      }
      return result;
   }
}

class SQLiteField : Field
{
   char * name;
   Class type;
   int length;
   public LinkElement<SQLiteField> link;
   int num;
   int sqliteType;

   ~SQLiteField()
   {
      delete name;
   }

   String GetName()
   {
      return name;
   }
   Class GetType()
   {
      return type;
   }
   int GetLength() { return length; }
   Field GetPrev()
   {
      return link.prev;
   }
   Field GetNext()
   {
      return link.next;
   }
}

class SQLiteDatabase : Database
{
   sqlite3 * db;
   AVLTree<String> collations { };
   
   ~SQLiteDatabase()
   {
      sqlite3_close(db);
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
      char command[1024];
      int result;
      int nRows = 0, nCols = 0;
      char ** t;
      SQLiteTable table = null;
      if(options.type == tablesList)
      {
         SQLiteField field { name = CopyString("Name"), type = class(String), num = -1, sqliteType = SQLITE_TEXT };
         strcpy(command, "SELECT name FROM sqlite_master WHERE type='table' AND name!='eda_table_fields';");
         table = SQLiteTable { db = this, specialStatement = CopyString(command) };
         LinkTable(table);
         incref field;
         table.fields.Add(field);
      }
      else if(options.type == fieldsList)
      {
         SQLiteField field;

         sprintf(command, "SELECT Name, Type, Length FROM eda_table_fields WHERE Table_Name='%s';", name);
         table = SQLiteTable { db = this, specialStatement = CopyString(command) };
         LinkTable(table);
         field = { name = CopyString("Name"), type = class(String), num = -1, sqliteType = SQLITE_TEXT };
         incref field;
         table.fields.Add(field);
         field = { name = CopyString("Type"), type = class(Class), num = 0, sqliteType = SQLITE_TEXT };
         incref field;
         table.fields.Add(field);
         field = { name = CopyString("Length"), type = class(int), num = 1, sqliteType = SQLITE_INTEGER };
         incref field;
         table.fields.Add(field);
      }
      else if(options.type == tableRows)
      {
         bool addFields = false;

         sprintf(command, "SELECT Name FROM eda_table_fields WHERE Table_Name='%s';", name);
         result = sqlite3_get_table(db, command, &t, &nRows, &nCols, null);
         if(!nRows && !nCols)
            addFields = true;

         sqlite3_free_table(t);

         sprintf(command, "SELECT sql FROM sqlite_master WHERE type='table' AND name='%s';", name);
         nCols = 0, nRows = 0;
         result = sqlite3_get_table(db, command, &t, &nRows, &nCols, null);
         
         if((nCols || nRows) || options.create)
         {
            table = SQLiteTable { db = this, name = CopyString(name) };
            LinkTable(table);
            if(!nCols && !nRows)
               table.mustCreate = true;
            else
            {
               if(addFields)
               {
                  int r;
                  for(r = 1; r <= nRows; r++)      // There should be only 1 row here
                  {
                     char * sql = t[nCols * r];
                     char * bracket = strchr(sql, '(');
                     if(bracket) 
                     {
                        int c = 0;
                        bracket++;
                        while(true)
                        {
                           char ch;
                           char fieldName[256];
                           char dataType[256];
                           int d;
                           int start = c;
                           int sqliteType;
                           Class type = class(int);
                           fieldName[0] = 0;
                           dataType[0] = 0;

                           while((ch = bracket[c++]))
                           {
                              if(ch == ',' || ch == ')')
                                 break;
                           }
                           for(d = c-1; d >= 0 && bracket[d] != ' '; d--);

                           memcpy(fieldName, bracket + start, d - start);
                           fieldName[d - start] = 0;

                           memcpy(dataType, bracket + d + 1, c - d - 2);
                           dataType[c - d - 2] = 0;

                           while(ch && bracket[c] == ' ') c++;
                           
                           if(!strcmp(dataType, "REAL")) { sqliteType = SQLITE_FLOAT; type = class(double); }
                           else if(!strcmp(dataType, "TEXT")) { sqliteType = SQLITE_TEXT; type = class(String); }
                           else if(!strcmp(dataType, "INTEGER")) { sqliteType = SQLITE_INTEGER; type = class(int); }
                           else if(!strcmp(dataType, "BLOB")) { sqliteType = SQLITE_BLOB; type = class(char *); } //class(byte *);

                           sprintf(command, "INSERT INTO eda_table_fields (Table_Name, Name, Type, Length) VALUES ('%s', '%s', '%s', %d);", name,
                              fieldName, type.name, 0);
                           result = sqlite3_exec(db, command, null, null, null);

                           {
                              SQLiteField field { name = CopyString(fieldName), type = type, num = table.fields.count, sqliteType = sqliteType };
                              incref field;
                              table.fields.Add(field);
                           }

                           if(!ch || ch == ')') break;
                        }
                     }
                  }
               }
               else
               {
                  sqlite3_stmt * statement;
                  
                  sprintf(command, "SELECT Name, Type, Length FROM eda_table_fields WHERE Table_Name='%s';", name);
                  result = sqlite3_prepare_v2(db, command, -1, &statement, null);

                  while(sqlite3_step(statement) != SQLITE_DONE)
                  {
                     char * fieldName = sqlite3_column_text(statement, 0);
                     char * typeName = sqlite3_column_text(statement, 1);
                     int length = sqlite3_column_int(statement, 2);
                     Class type = null;
                     int sqliteType;

                     ((Class)(&type)).OnGetDataFromString(typeName);    // TODO: THIS REQUIRES A FIX SOMEWHERE ELSE

                     if(type)
                     {
                        if(!strcmp(type.dataTypeString, "int") || !strcmp(type.dataTypeString, "unsigned int") || 
                           !strcmp(type.dataTypeString, "long") || !strcmp(type.dataTypeString, "long int") || 
                           !strcmp(type.dataTypeString, "uint") || !strcmp(type.dataTypeString, "uint32") || 
                           !strcmp(type.dataTypeString, "int64") || !strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64") || 
                           !strcmp(type.dataTypeString, "short") || !strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") ||
                           !strcmp(type.dataTypeString, "char") || !strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte"))
                           sqliteType = SQLITE_INTEGER;
                        else if(!strcmp(type.dataTypeString, "double") || !strcmp(type.dataTypeString, "float"))
                           sqliteType = SQLITE_FLOAT;
                        else if(!strcmp(type.dataTypeString, "String") || !strcmp(type.dataTypeString, "char *"))
                           sqliteType = SQLITE_TEXT;
                        else
                        {
                           if(strcmp(type.fullName, "CIString") && !collations.Find(type.fullName))
                           {
                              collations.Add(type.fullName);
                              sqlite3_create_collation_v2(table.db.db, type.fullName, SQLITE_UTF8, type, CollationCompare, null);
                           }
                           sqliteType = SQLITE_BLOB;
                        }
                     }

                     {
                        SQLiteField field { name = CopyString(fieldName), type = type, length = length, num = table.fields.count, sqliteType = sqliteType };
                        incref field;
                        table.fields.Add(field);
                     }
                  }
                  sqlite3_finalize(statement);
               }
            }
         }
         sqlite3_free_table(t);
      }
      return (Table)table;
   }

   bool Begin()
   {
      char command[1024];
      int result;
      sprintf(command, "BEGIN;");
      result = sqlite3_exec(db, command, null, null, null);
      if(result)
         PrintLn("BEGIN FAILED!");
      return result == SQLITE_OK;
   }

   bool Commit()
   {
      char command[1024];
      int result;
      sprintf(command, "COMMIT;");
      result = sqlite3_exec(db, command, null, null, null);
      if(result)
         PrintLn("COMMIT FAILED!");
      return result == SQLITE_OK;
   }

   bool CreateCustomFunction(char * name, SQLCustomFunction customFunction)
   {
      int result = sqlite3_create_function(db, name, 1, SQLITE_UTF8, customFunction, SQLiteFunctionProcessor, null, null);
      return result == SQLITE_OK;
   }
}

void SQLiteFunctionProcessor(sqlite3_context* context, int n, sqlite3_value** value)
{
   SQLCustomFunction sqlFunction = sqlite3_user_data(context);
   char * text = sqlite3_value_text(*value);
   sqlFunction.array.size = 1;
   sqlFunction.array[0] = 0;
   sqlFunction.Process(text);
   sqlite3_result_text(context, sqlFunction.array.array, sqlFunction.array.count ? sqlFunction.array.count - 1 : 0, SQLITE_TRANSIENT);
}

class SQLiteTable : Table
{
   char * name;
   bool mustCreate;
   SQLiteDatabase db;
   LinkList<SQLiteField> fields { };
   char * specialStatement;
   SQLiteField primaryKey;
   FieldIndex * indexFields;
   int indexFieldsCount;
   int64 lastID;

   Field AddField(const String fieldName, Class type, int length)
   {
      SQLiteField field;
      char command[1024];
      char dataType[256];
      int sqliteType;
      int result;
      Table refTable = null;
      Field idField = null;
      command[0] = 0;
      
      if(FindField(fieldName)) return null;

      if(!strcmp(type.dataTypeString, "int") || !strcmp(type.dataTypeString, "unsigned int") || 
         !strcmp(type.dataTypeString, "long") || !strcmp(type.dataTypeString, "long int") || 
         !strcmp(type.dataTypeString, "uint") || !strcmp(type.dataTypeString, "uint32") || 
         !strcmp(type.dataTypeString, "int64") || !strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64") || 
         !strcmp(type.dataTypeString, "short") || !strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") ||
         !strcmp(type.dataTypeString, "char") || !strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte"))
      {
         strcpy(dataType, "INTEGER");
         sqliteType = SQLITE_INTEGER;
      }
      else if(!strcmp(type.dataTypeString, "double") || !strcmp(type.dataTypeString, "float"))
      {
         strcpy(dataType, "REAL");
         sqliteType = SQLITE_FLOAT;
      }
      else if(!strcmp(type.name, "CIString"))
      {
         strcpy(dataType, "TEXT");
         sqliteType = SQLITE_BLOB;
      }
      else if(!strcmp(type.dataTypeString, "String") || !strcmp(type.dataTypeString, "char *"))
      {
         strcpy(dataType, "TEXT");
         sqliteType = SQLITE_TEXT;
      }
      else
      {
         //strcpy(dataType, "BLOB");
         strcpy(dataType, "TEXT");
         sqliteType = SQLITE_BLOB;

         if(!db.collations.Find(type.fullName))
         {
            db.collations.Add(type.fullName);
            result = sqlite3_create_collation_v2(db.db, type.fullName, SQLITE_UTF8, type, CollationCompare, null);
         }
      }
      if(sqliteType != SQLITE_BLOB && eClass_IsDerived(type, class(eda::Id)))
      {
         Table * table = (Table *)eClass_GetProperty(type, "table");
         if(table) refTable = *table;
         if(refTable)
         {
            if(primaryKey || refTable != this)
            {
               for(idField = refTable.firstField; idField; idField = idField.next)
                  if(eClass_IsDerived(type, idField.type)) break;

               if(!idField)
                  PrintLn("WARNING: field not yet created for class ", (String)type.name);
            }
            else
               idField = primaryKey;
         }
         else
         {
            PrintLn("WARNING: Table not yet created for class ", (String)type.name);
         }
      }
      
      if(mustCreate)
      {
         if(sqliteType == SQLITE_BLOB)
         {
            if(!strcmp(type.name, "CIString"))
               sprintf(command, "CREATE TABLE `%s`(%s %s COLLATE NOCASE);", name, fieldName, dataType);
            else
               sprintf(command, "CREATE TABLE `%s`(%s %s COLLATE '%s');", name, fieldName, dataType, type.fullName);
         }
         else if(refTable)
         {
            if(!idField && refTable == this)
               sprintf(command, "CREATE TABLE `%s`(`%s` %s PRIMARY KEY);", name, fieldName, dataType);
            else if(idField)
               sprintf(command, "CREATE TABLE `%s`(`%s` %s REFERENCES `%s`(`%s`));", name, fieldName, dataType, refTable.name, idField.name);
         }
         else
            sprintf(command, "CREATE TABLE `%s`(`%s` %s);", name, fieldName, dataType);
         result = sqlite3_exec(db.db, command, null, null, null);
         if(result) return null;
         mustCreate = false;
      }
      else
      {
         if(sqliteType == SQLITE_BLOB)
         {
            if(!strcmp(type.name, "CIString"))
               sprintf(command, "ALTER TABLE `%s` ADD `%s` %s COLLATE NOCASE;", name, fieldName, dataType);
            else
               sprintf(command, "ALTER TABLE `%s` ADD `%s` %s COLLATE `%s`;", name, fieldName, dataType, type.fullName);
         }
         else if(refTable)
         {
            if(!idField && refTable == this)
            {
               PrintLn("WARNING: ALTER TABLE DOESN'T WORK WITH PRIMARY KEY FOR ", (String)name);
               sprintf(command, "ALTER TABLE `%s` ADD `%s` %s PRIMARY KEY;", name, fieldName, dataType);
            }
            else if(idField)
               sprintf(command, "ALTER TABLE `%s` ADD `%s` %s REFERENCES `%s`(`%s`);", name, fieldName, dataType, refTable.name, idField.name);
         }
         else
            sprintf(command, "ALTER TABLE `%s` ADD `%s` %s;", name, fieldName, dataType);
         result = sqlite3_exec(db.db, command, null, null, null);
         if(result) return null;
      }

      sprintf(command, "INSERT INTO eda_table_fields (Table_Name, Name, Type, Length) VALUES ('%s', '%s', '%s', %d);", name,
         fieldName, type.name, length);
      result = sqlite3_exec(db.db, command, null, null, null);

      field = { name = CopyString(fieldName), type = type, num = fields.count, sqliteType = sqliteType };
      incref field;
      fields.Add(field);
      if(!primaryKey && refTable == this)
         primaryKey = field;
      return (Field)field;
   }

   Field FindField(const String name)
   {
      for(f : fields; !strcmp(f.name, name))
      {
         if(!primaryKey)
         {
            if(f.sqliteType != SQLITE_BLOB && eClass_IsDerived(f.type, class(eda::Id)))
            {

               Table * tablePtr = (Table *)eClass_GetProperty(f.type, "table");
               if(tablePtr && *tablePtr == this)
                  primaryKey = f;
            }
         }
         return (Field)f;
      }
      return null;
   }

   bool GenerateIndex(int count, FieldIndex * fieldIndexes, bool init)
   {
      char command[1024];
      int c;
      int result;
      char indexName[4096];

      delete indexFields;
      indexFieldsCount = count;
      indexFields = new FieldIndex[count];
      memcpy(indexFields, fieldIndexes, count * sizeof(FieldIndex));

      // TODO: USE CODED INDEX NAME INSTEAD?
      strcpy(indexName, "index_");
      strcat(indexName, name);
      strcat(indexName, "_");
      for(c = 0; c<count; c++)
      {
         if(fieldIndexes[c].field)
         {
            if(count == 1 && fieldIndexes[c].field == primaryKey)
               return true;
            strcat(indexName, fieldIndexes[c].field.name);
            if(fieldIndexes[c].memberField)
            {
               strcat(indexName, ".");
               strcat(indexName, fieldIndexes[c].memberField.name);
            }
            strcat(indexName, (fieldIndexes[c].order == ascending) ? "+" : "-");
         }
         else
            return false;
      }

      sprintf(command, "CREATE INDEX IF NOT EXISTS `%s` ON `%s` (", indexName, name);
      for(c = 0; c<count; c++)
      {
         char columnName[1024];
         sprintf(columnName, "`%s` %s", fieldIndexes[c].field.name, (fieldIndexes[c].order == ascending) ? "ASC" : "DESC");
         if(c > 0) strcat(command, ", ");
         strcat(command, columnName);
      }
      strcat(command, ");");
      result = sqlite3_exec(db.db, command, null, null, null);

      return result == SQLITE_OK;
   }

   String GetName()
   {
      return name;
   }

   Field GetFirstField()
   {
      return fields.first;
   }

   uint GetFieldsCount()
   {
      return fields.count;
   }

   uint GetRowsCount()
   {
      char command[1024];
      char **t;
      int nCols, nRows;
      int result;
      uint rowCount = 0;
      sprintf(command, "SELECT COUNT(*) FROM `%s`;", name);
      result = sqlite3_get_table(db.db, command, &t, &nRows, &nCols, null);
      if(result == SQLITE_OK)
      {
         rowCount = atoi(t[1]);
         sqlite3_free_table(t);
      }
      return rowCount;
   }

   DriverRow CreateRow()
   {
      char command[1024];
      sqlite3_stmt * statement;
      sqlite3_stmt * sysIDStmt = null, * insertStmt = null, * deleteStmt = null, * selectRowIDsStmt = null, * setRowIDStmt = null;
      sqlite3_stmt * prevStmt = null, * nextStmt = null, * lastStmt = null, * insertIDStmt = null;

      if(specialStatement)
         strcpy(command, specialStatement);
      else
      {
         /*sprintf(command, "SELECT ROWID, * FROM `%s` WHERE ? = ?;", name);
         sqlite3_prepare_v2(db.db, command, -1, &findStmt, null);*/
         sprintf(command, "SELECT ROWID, * FROM `%s` WHERE ROWID = ?;", name);
         sqlite3_prepare_v2(db.db, command, -1, &sysIDStmt, null);

         sprintf(command, "INSERT INTO `%s` DEFAULT VALUES;", name);
         sqlite3_prepare_v2(db.db, command, -1, &insertStmt, null);

         sprintf(command, "INSERT INTO `%s` (ROWID) VALUES(?);", name);
         sqlite3_prepare_v2(db.db, command, -1, &insertIDStmt, null);

         sprintf(command, "DELETE FROM `%s` WHERE ROWID = ?;", name);
         sqlite3_prepare_v2(db.db, command, -1, &deleteStmt, null);

         sprintf(command, "SELECT ROWID, * FROM `%s` WHERE ROWID < ? ORDER BY ROWID DESC LIMIT 1;", name);
         sqlite3_prepare_v2(db.db, command, -1, &prevStmt, null);

         sprintf(command, "SELECT ROWID, * FROM `%s` WHERE ROWID > ? ORDER BY ROWID LIMIT 1;", name);
         sqlite3_prepare_v2(db.db, command, -1, &nextStmt, null);

         sprintf(command, "SELECT MAX(ROWID), * FROM `%s`", name);
         sqlite3_prepare_v2(db.db, command, -1, &lastStmt, null);

         /*sprintf(command, "UPDATE `%s` SET ? = ? WHERE ROWID = ?;", name);

         sqlite3_prepare_v2(db.db, command, -1, &updateStmt, null);*/

         if(!indexFields || (indexFieldsCount == 1 && indexFields[0].field == primaryKey && indexFields[0].order == ascending))
            sprintf(command, "SELECT ROWID, * FROM `%s`;", name);
         else
         {
            int c;
            sprintf(command, "SELECT ROWID, * FROM `%s` ORDER BY ", name);
            for(c = 0; c < indexFieldsCount; c++)
            {
               char order[1024];
               FieldIndex * fIndex = &indexFields[c];
               order[0] = 0;
               if(c) strcat(order, ", ");
               strcat(order, "`");
               strcat(order, fIndex->field.name);
               strcat(order, "`");
               if(fIndex->order == descending) strcat(order, " DESC");
               strcat(command, order);
            }
            strcat(command, ";");
         }
      }
      sqlite3_prepare_v2(db.db, command, -1, &statement, null);

      sprintf(command, "SELECT ROWID FROM `%s` WHERE ROWID > ?", name);
      sqlite3_prepare_v2(db.db, command, -1, &selectRowIDsStmt, null);

      sprintf(command, "UPDATE `%s` SET ROWID = ? WHERE ROWID = ?", name);
      sqlite3_prepare_v2(db.db, command, -1, &setRowIDStmt, null);

      return SQLiteRow
         { tbl = this, defaultStatement = statement, curStatement = statement, sysIDStatement = sysIDStmt, 
           insertStatement = insertStmt, deleteStatement = deleteStmt, selectRowIDsStmt = selectRowIDsStmt, setRowIDStmt = setRowIDStmt,
           previousStatement = prevStmt, nextStatement = nextStmt, lastStatement = lastStmt, insertIDStatement = insertIDStmt };
   }

   ~SQLiteTable()
   {
      delete name;
      delete specialStatement;
      delete indexFields;
      fields.Free();
   }
}

class SQLiteRow : DriverRow
{
   SQLiteTable tbl;
   sqlite3_stmt * curStatement;

   sqlite3_stmt * defaultStatement;
   sqlite3_stmt * findStatement;
   sqlite3_stmt * sysIDStatement;
   sqlite3_stmt * queryStatement;
   sqlite3_stmt * findMultipleStatement;
   sqlite3_stmt * selectRowIDsStmt;
   sqlite3_stmt * setRowIDStmt;
   sqlite3_stmt * lastStatement;
   sqlite3_stmt * previousStatement;
   sqlite3_stmt * nextStatement;

   sqlite3_stmt * insertStatement;
   sqlite3_stmt * deleteStatement;
   sqlite3_stmt * updateStatement;
   sqlite3_stmt * insertIDStatement;
   bool done;
   done = true;
   int64 rowID;
   
   bool Nil()
   {
      return done;
   }

   ~SQLiteRow()
   {
      if(defaultStatement) sqlite3_finalize(defaultStatement);
      if(findStatement)    sqlite3_finalize(findStatement);
      if(findMultipleStatement)    sqlite3_finalize(findMultipleStatement);
      if(sysIDStatement)   sqlite3_finalize(sysIDStatement);
      if(insertStatement)  sqlite3_finalize(insertStatement);
      if(deleteStatement)  sqlite3_finalize(deleteStatement);
      if(updateStatement)  sqlite3_finalize(updateStatement);
      if(queryStatement)   sqlite3_finalize(queryStatement);
      if(selectRowIDsStmt) sqlite3_finalize(selectRowIDsStmt);
      if(setRowIDStmt)     sqlite3_finalize(setRowIDStmt);
      if(previousStatement)sqlite3_finalize(previousStatement);
      if(nextStatement)    sqlite3_finalize(nextStatement);
      if(lastStatement)    sqlite3_finalize(lastStatement);
      if(insertIDStatement)    sqlite3_finalize(insertIDStatement);
   }

   bool Select(MoveOptions move)
   {
      int result;
      bool stepping = curStatement == previousStatement || curStatement == nextStatement || curStatement == lastStatement;
      if(!curStatement)
         curStatement = defaultStatement;
      switch(move)
      {
         case first:
         {
            sqlite3_reset(curStatement);
            result = sqlite3_step(curStatement);
            done = result == SQLITE_DONE || (result && result != SQLITE_ROW);
            if(done) { rowID = 0; sqlite3_reset(curStatement); return false; }
            rowID = sqlite3_column_int64(curStatement, 0);
            break;
         }
         case last:
         {
            sqlite3_reset(curStatement);
            curStatement = lastStatement;
            result = sqlite3_step(curStatement);
            done = result == SQLITE_DONE || (result && result != SQLITE_ROW);
            if(done) { rowID = 0; sqlite3_reset(curStatement); return false; }
            rowID = sqlite3_column_int64(curStatement, 0);
            break;
         }
         case middle:
            break;
         case next:
            if(!stepping)
            {
               result = sqlite3_step(curStatement);
               done = result == SQLITE_DONE || (result && result != SQLITE_ROW);
               if(done) { rowID = 0; sqlite3_reset(curStatement); return false; }
               rowID = sqlite3_column_int64(curStatement, 0);
               break;
            }
         case previous:
         {
            sqlite3_reset(curStatement);
            curStatement = (move == previous) ? (rowID ? previousStatement : lastStatement) : (rowID ? nextStatement : defaultStatement);
            sqlite3_bind_int64(curStatement, 1, (sqlite3_int64)rowID);
            result = sqlite3_step(curStatement);
            done = result == SQLITE_DONE || (result && result != SQLITE_ROW);
            if(done) { rowID = 0; sqlite3_reset(curStatement); return false; }
            rowID = sqlite3_column_int64(curStatement, 0);
            break;
         }
         case nil:
            sqlite3_reset(curStatement);
            rowID = 0;
            done = true;
            break;
         case here:
            break;
      }
      return true;
   }

   bool Query(char * queryString)
   {
      bool status = true;
      int result;

      if(curStatement)
         sqlite3_reset(curStatement);
      if(queryStatement)
      {
         sqlite3_finalize(queryStatement);
         queryStatement = null;
      }

      if(queryString)
      {
         result = sqlite3_prepare_v2(tbl.db.db, queryString, -1, &queryStatement, null);
         curStatement = queryStatement;
         if(!strchr(queryString, '?'))
         {
            result = sqlite3_step(queryStatement);

            done = result == SQLITE_DONE || (result && result != SQLITE_ROW);
            if(done) { rowID = 0; sqlite3_reset(queryStatement); return false; }

            rowID = sqlite3_column_int64(queryStatement, 0);
         }
      }
      else
         curStatement = null;
      return status;
   }

   bool Find(Field fld, MoveOptions move, MatchOptions match, typed_object data)
   {
      char command[1024];
      int result;
      SQLiteField sqlFld = (SQLiteField)fld;
      Class dataType = sqlFld.type;

      if(fld == tbl.primaryKey)
      {
         return GoToSysID(*(int *)data);
      }
      
      if(curStatement)
         sqlite3_reset(curStatement);
      if(findStatement)
         sqlite3_finalize(findStatement);

      sprintf(command, "SELECT ROWID, * FROM `%s` WHERE `%s` = ?;", tbl.name, fld.name);
      result = sqlite3_prepare_v2(tbl.db.db, command, -1, &findStatement, null);

      // result = sqlite3_bind_text(findStatement, 1, fld.name, strlen(fld.name), SQLITE_STATIC);

      curStatement = findStatement;
      switch(sqlFld.sqliteType)
      {
         case SQLITE_INTEGER: 
         {
            switch(dataType.typeSize)
            {
               case 8:
                  sqlite3_bind_int64(findStatement, 1, (sqlite3_int64)*(int64 *)data);
                  break;
               case 4:
                  sqlite3_bind_int(findStatement, 1, *(int *)data);
                  break;
               case 2:
               {
                  int value;
                  if((int)data < 0)
                     value = (int)*(short *)data;
                  else
                     value = (int)*(uint16 *)data;
                  sqlite3_bind_int(findStatement, 1, value);
                  break;
               }
               case 1:
               {
                  int value;
                  if((int)data < 0)
                     value = (int)*(char *)data;
                  else
                     value = (int)*(byte *)data;
                  sqlite3_bind_int(findStatement, 1, value);
                  break;
               }
            }
            break;
         }
         case SQLITE_FLOAT:
         {
            if(dataType.typeSize == 8)
               sqlite3_bind_double(findStatement, 1, *(double *)data);
            else
               sqlite3_bind_double(findStatement, 1, (double)*(float *)data);
            break;
         }
         case SQLITE_TEXT:
         {
            if((char *)data)
               sqlite3_bind_text(findStatement, 1, (char *)data, strlen((char *)data), SQLITE_STATIC);
            else
               sqlite3_bind_text(findStatement, 1, null, 0, SQLITE_STATIC);
            break;
         }
         case SQLITE_BLOB:
         case SQLITE_NULL:
         {
            SerialBuffer buffer { };

            dataType._vTbl[__ecereVMethodID_class_OnSerialize](dataType, data, buffer);
            //sqlite3_bind_blob(findStatement, 1, buffer._buffer, buffer.count, SQLITE_STATIC);
            sqlite3_bind_text(findStatement, 1, buffer._buffer, buffer.count, SQLITE_STATIC);
            result = sqlite3_step(findStatement);

            done = result == SQLITE_DONE || (result && result != SQLITE_ROW);
            if(done) { rowID = 0; sqlite3_reset(findStatement); delete buffer; return false; }

            rowID = sqlite3_column_int64(findStatement, 0);

            delete buffer;
            return true;
            break;
         } 
      }
      result = sqlite3_step(findStatement);

      done = result == SQLITE_DONE || (result && result != SQLITE_ROW);
      if(done) { rowID = 0; sqlite3_reset(findStatement); return false; }

      rowID = sqlite3_column_int64(findStatement, 0);
      return true;
   }

   bool FindMultiple(FieldFindData * findData, MoveOptions move, int numFields)
   {
      if(numFields)
      {
         char command[4096];
         int result;
         int c;
         Array<SerialBuffer> serialBuffers { };

         if(curStatement)
            sqlite3_reset(curStatement);
         if(findMultipleStatement)
            sqlite3_finalize(findMultipleStatement);

         sprintf(command, "SELECT ROWID, * FROM `%s` WHERE `", tbl.name);
         for(c = 0; c < numFields; c++)
         {
            FieldFindData * fieldFind = &findData[c];

            if(c) strcat(command, " AND `");
            strcat(command, fieldFind->field.name);
            strcat(command, "` = ?");
         }
         strcat(command, ";");

         result = sqlite3_prepare_v2(tbl.db.db, command, -1, &findMultipleStatement, null);
         curStatement = findMultipleStatement;

         for(c = 0; c < numFields; c++)
         {
            FieldFindData * fieldFind = &findData[c];
            SQLiteField sqlFld = (SQLiteField)fieldFind->field;
            Class dataType = sqlFld.type;

            switch(sqlFld.sqliteType)
            {
               case SQLITE_INTEGER: 
               {
                  switch(dataType.typeSize)
                  {
                     case 8:
                        sqlite3_bind_int64(findMultipleStatement, 1 + c, (sqlite_int64)fieldFind->value.i64);
                        break;
                     case 4:
                        sqlite3_bind_int(findMultipleStatement, 1 + c, fieldFind->value.i);
                        break;
                     case 2:
                     {
                        int value;
                        if(value < 0)
                           value = (int)fieldFind->value.s;
                        else
                           value = (int)fieldFind->value.us;
                        sqlite3_bind_int(findMultipleStatement, 1 + c, value);
                        break;
                     }
                     case 1:
                     {
                        int value;
                        if(value < 0)
                           value = (int)fieldFind->value.c;
                        else
                           value = (int)fieldFind->value.uc;
                        sqlite3_bind_int(findMultipleStatement, 1 + c, value);
                        break;
                     }
                  }
                  break;
               }
               case SQLITE_FLOAT:
               {
                  if(dataType.typeSize == 8)
                     sqlite3_bind_double(findMultipleStatement, 1 + c, fieldFind->value.d);
                  else
                     sqlite3_bind_double(findMultipleStatement, 1 + c, fieldFind->value.f);
                  break;
               }
               case SQLITE_TEXT:
               {
                  if(fieldFind->value.p)
                     sqlite3_bind_text(findMultipleStatement, 1 + c, (char *)fieldFind->value.p, strlen(fieldFind->value.p), SQLITE_STATIC);
                  else
                     sqlite3_bind_text(findMultipleStatement, 1 + c, null, 0, SQLITE_STATIC);
                  break;
               }
               case SQLITE_BLOB:
               case SQLITE_NULL:
               {
                  SerialBuffer buffer { };

                  dataType._vTbl[__ecereVMethodID_class_OnSerialize](dataType, fieldFind->value.p, buffer);
                  //sqlite3_bind_blob(findMultipleStatement, 1 + c, buffer._buffer, buffer.count, SQLITE_STATIC);
                  sqlite3_bind_text(findMultipleStatement, 1 + c, buffer._buffer, buffer.count, SQLITE_STATIC);

                  serialBuffers.Add(buffer);
                  break;
               } 
            }
         }

         result = sqlite3_step(findMultipleStatement);

         done = result == SQLITE_DONE || (result && result != SQLITE_ROW);
         if(done)
         {
            rowID = 0;
            sqlite3_reset(findMultipleStatement);

            serialBuffers.Free();
            delete serialBuffers;
            return false;
         }
         else
         {
            rowID = sqlite3_column_int64(findMultipleStatement, 0);

            serialBuffers.Free();
            delete serialBuffers;
            return true;
         }
      }
      return false;
   }

   bool Synch(DriverRow to)
   {
      return true;
   }

   bool Add(uint64 id)
   {
      int result;
      //char command[1024];
      //sprintf(command, "INSERT INTO `%s` DEFAULT VALUES;", tbl.name);
      //result = sqlite3_exec(tbl.db.db, command, null, null, null);
      if(id)
      {
         sqlite3_bind_int64(insertIDStatement, 1, (sqlite3_int64)id);
         result = sqlite3_step(insertIDStatement);
      }
      else
         result = sqlite3_step(insertStatement);
      if(result == SQLITE_DONE)     // if(result == SQLITE_OK)
      {
         rowID = sqlite3_last_insert_rowid(tbl.db.db);
         if(rowID > MAXDWORD)
         {
            int64 lastID = tbl.lastID;

            sqlite3_bind_int64(selectRowIDsStmt, 1, (sqlite3_int64)lastID);
            while(true)
            {
               int64 id;
               result = sqlite3_step(selectRowIDsStmt);
               if(result == SQLITE_DONE || result != SQLITE_ROW) break;
               id = sqlite3_column_int64(selectRowIDsStmt, 0);
               if(id - lastID > 1) break;
               lastID = id;
            }
            sqlite3_reset(selectRowIDsStmt);

            sqlite3_bind_int64(setRowIDStmt, 2, (sqlite3_int64)rowID);
            rowID = lastID + 1;
            tbl.lastID = rowID;
            sqlite3_bind_int64(setRowIDStmt, 1, (sqlite3_int64)rowID);
            result = sqlite3_step(setRowIDStmt);
            sqlite3_reset(setRowIDStmt);
         }
         sqlite3_reset(id ? insertIDStatement : insertStatement);
         curStatement = sysIDStatement;
         sqlite3_reset(curStatement);
         return true;
      }
      sqlite3_reset(insertStatement);
      return false;
   }

   bool Delete()
   {
      int result;
      //char command[1024];
      //sprintf(command, "DELETE FROM `%s` WHERE ROWID = %d;", tbl.name, rowID);
      //result = sqlite3_exec(tbl.db.db, command, null, null, null);
      sqlite3_bind_int64(deleteStatement, 1, (sqlite3_int64)rowID);
      result = sqlite3_step(deleteStatement);
      sqlite3_reset(deleteStatement);
      rowID = 0;
      return result == SQLITE_OK || result == SQLITE_DONE;
   }

   bool GetData(Field fld, typed_object &data)
   {
      SQLiteField sqlFld = (SQLiteField)fld;
      int num = sqlFld.num + 1;
      Class dataType = sqlFld.type;
      switch(sqlFld.sqliteType)
      {
         case SQLITE_INTEGER: 
         {
            switch(dataType.typeSize)
            {
               case 8:
                  if(fld == tbl.primaryKey)
                     *(int64 *)data = rowID;
                  else
                     *(int64 *)data = sqlite3_column_int64(curStatement, num);
                  break;
               case 4:
                  if(fld == tbl.primaryKey)
                     *(int *)data = (int)(uint)rowID;
                  else
                     *(int *)data = sqlite3_column_int(curStatement, num);
                  break;
               case 2:
               {
                  int value;
                  if(fld == tbl.primaryKey)
                     value = (int)(uint)rowID;
                  else
                     value = sqlite3_column_int(curStatement, num);
                  if(value < 0)
                     *(short *)data = (short)value;
                  else
                     *(uint16 *)data = (uint16)value;
                  break;
               }
               case 1:
               {
                  int value;
                  if(fld == tbl.primaryKey)
                     value = (int)(uint)rowID;
                  else
                     value = sqlite3_column_int(curStatement, num);
                  if(value < 0)
                     *(char *)data = (char)value;
                  else
                     *(byte *)data = (byte)value;
                  break;
               }
            }
            break;
         }
         case SQLITE_FLOAT:
         {
            double d = sqlite3_column_double(curStatement, num);
            if(dataType.typeSize == 8)
               *(double *)data = d;
            else
               *(float *)data = (float)d;
            break;
         }
         case SQLITE_TEXT:
         {
            int numBytes = sqlite3_column_bytes(curStatement, num);
            char * text = sqlite3_column_text(curStatement, num);
            *(char **)data = text ? new byte[numBytes+1] : null;
            if(text)
               memcpy(*(char **)data, text, numBytes+1);
            break;
         }
         case SQLITE_BLOB:
         {
            SerialBuffer buffer { };
            //buffer._buffer = sqlite3_column_blob(curStatement, num);
            buffer._size = sqlite3_column_bytes(curStatement, num);
            buffer._buffer = sqlite3_column_text(curStatement, num);
            buffer.count = buffer._size;

            dataType._vTbl[__ecereVMethodID_class_OnUnserialize](dataType, data, buffer);
           
            buffer._buffer = null;
            delete buffer;
            break;
         } 
      }
      return true;
   }

   bool SetData(Field fld, typed_object data)
   {
      SQLiteField sqlFld = (SQLiteField)fld;
      int result;

      int num = sqlFld.num + 1;
      Class dataType = sqlFld.type;
      char command[1024];
      //sqlite3_stmt * setStatement;

      if(updateStatement)
         sqlite3_finalize(updateStatement);

      // sprintf(command, "UPDATE `%s` SET `%s` = ? WHERE ROWID = %d;", tbl.name, sqlFld.name, rowID);
      sprintf(command, "UPDATE `%s` SET `%s` = ? WHERE ROWID = ?;", tbl.name, sqlFld.name);

      result = sqlite3_prepare_v2(tbl.db.db, command, -1, &updateStatement, null);

      //sqlite3_bind_text(updateStatement, 1, sqlFld.name, strlen(sqlFld.name), SQLITE_STATIC);
      //sqlite3_bind_int64(updateStatement, 3, (sqlite3_int64)rowID);

      sqlite3_bind_int64(updateStatement, 2, (sqlite3_int64)rowID);
      switch(sqlFld.sqliteType)
      {
         case SQLITE_INTEGER: 
         {
            switch(dataType.typeSize)
            {
               case 8:
                  sqlite3_bind_int64(updateStatement, 1, (sqlite3_int64)*(int64 *)data);
                  break;
               case 4:
                  sqlite3_bind_int(updateStatement, 1, *(int *)data);
                  break;
               case 2:
               {
                  int value;
                  if((int)data < 0)
                     value = (int)*(short *)data;
                  else
                     value = (int)*(uint16 *)data;
                  sqlite3_bind_int(updateStatement, 1, value);
                  break;
               }
               case 1:
               {
                  int value;
                  if((int)data < 0)
                     value = (int)*(char *)data;
                  else
                     value = (int)*(byte *)data;
                  sqlite3_bind_int(updateStatement, 1, value);
                  break;
               }
            }
            break;
         }
         case SQLITE_FLOAT:
         {
            if(dataType.typeSize == 8)
               sqlite3_bind_double(updateStatement, 1, *(double *)data);
            else
               sqlite3_bind_double(updateStatement, 1, (double)*(float *)data);
            break;
         }
         case SQLITE_TEXT:
         {
            // TOFIX: Checking a not casted typed_object for null should generate a compiler error (crashes!)
            if((char *)data)
               sqlite3_bind_text(updateStatement, 1, (char *)data, strlen((char *)data), SQLITE_STATIC);
            else
               sqlite3_bind_text(updateStatement, 1, null, 0, SQLITE_STATIC);
            break;
         }
         case SQLITE_BLOB:
         case SQLITE_NULL:
         {
            SerialBuffer buffer { };

            dataType._vTbl[__ecereVMethodID_class_OnSerialize](dataType, data, buffer);
            //sqlite3_bind_blob(updateStatement, 1, buffer._buffer, buffer.count, SQLITE_STATIC);
            sqlite3_bind_text(updateStatement, 1, buffer._buffer, buffer.count, SQLITE_STATIC);
            sqlite3_step(updateStatement);
            sqlite3_reset(updateStatement);
            delete buffer;
            return true;
            break;
         }
      }
      result = sqlite3_step(updateStatement);
      sqlite3_reset(updateStatement);
      if(fld == tbl.primaryKey)
      {
         rowID = *(uint *)data;
      }
      return result == SQLITE_DONE;
   }

   int GetSysID()
   {
      return (int)(uint)rowID;
   }

   bool GoToSysID(int id)
   {
      //char command[1024];
      int result;
      rowID = (uint)id;
      //if(statement)
         //sqlite3_finalize(statement);
      //sprintf(command, "SELECT ROWID, * FROM `%s` WHERE ROWID = ?;", tbl.name);
      //result = sqlite3_prepare_v2(tbl.db.db, command, -1, &statement, null);

      if(curStatement)
         sqlite3_reset(curStatement);

      curStatement = sysIDStatement;
      sqlite3_reset(sysIDStatement);
      sqlite3_bind_int64(curStatement, 1, (sqlite_int64)rowID);
      result = sqlite3_step(curStatement);
      done = result == SQLITE_DONE || (result && result != SQLITE_ROW);
      if(done) { rowID = 0; sqlite3_reset(curStatement); return false; }
      return !done;
   }

   bool SetQueryParam(int paramID, int value)
   {
      int result;
      if(curStatement != queryStatement)
      {
         if(curStatement) sqlite3_reset(curStatement);
         curStatement = queryStatement;
      }
      sqlite3_reset(queryStatement);
      result = sqlite3_bind_int(queryStatement, paramID, value);
      return !result;
   }

   bool SetQueryParam64(int paramID, int64 value)
   {
      int result;
      if(curStatement != queryStatement)
      {
         if(curStatement) sqlite3_reset(curStatement);
         curStatement = queryStatement;
      }
      sqlite3_reset(queryStatement);
      result = sqlite3_bind_int64(queryStatement, paramID, (sqlite_int64)value);
      return !result;
   }

   bool SetQueryParamText(int paramID, char * data)
   {
      int result;
      if(curStatement != queryStatement)
      {
         if(curStatement) sqlite3_reset(curStatement);
         curStatement = queryStatement;
      }
      sqlite3_reset(queryStatement);
      if(data)
         result = sqlite3_bind_text(queryStatement, paramID, (char *)data, strlen((char *)data), SQLITE_STATIC);
      else
         result = sqlite3_bind_text(queryStatement, paramID, null, 0, SQLITE_STATIC);
      return !result;
   }

   bool SetQueryParamObject(int paramID, void * data, Class type)
   {
      int result;
      if(curStatement != queryStatement)
      {
         if(curStatement) sqlite3_reset(curStatement);
         curStatement = queryStatement;
      }
      sqlite3_reset(queryStatement);
      {
         SerialBuffer buffer { };
         type._vTbl[__ecereVMethodID_class_OnSerialize](type, data, buffer);
         result = sqlite3_bind_text(queryStatement, paramID, buffer._buffer, buffer.count, SQLITE_TRANSIENT);
         delete buffer;
      }
      return !result;
   }

   /*char * GetExtraColumn(int paramID)
   {
      SQLiteField lastFld = tbl.fields.last;
      return sqlite3_column_text(curStatement, lastFld.num + 1 + paramID);
   }*/
   char * GetColumn(int paramID)
   {
      return sqlite3_column_text(curStatement, paramID);
   }
}
