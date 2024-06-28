#ifdef ECERE_STATIC
public import static "ecere"
public import static "EDA"
#else
public import "ecere"
public import "EDA"
#endif

#if defined(__linux__) && !defined(__LUMIN__)
#include <sqlite3.h>
#else
#include "sqlite3.h"
#endif

#define uint _uint
#if !defined(__LUMIN__) && !defined(__UWP__)
#include "ffi.h"
#endif
#undef uint

__attribute__((unused)) static void UnusedFunction()
{
   int a = 0;
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

static SerialBuffer collationBuffer1 { };
static SerialBuffer collationBuffer2 { };
static char storage1[512];
static char storage2[512];

int CollationCompare(Class type, int count1, const void * data1, int count2, const void * data2)
{
   if(type.type == normalClass || type.type ==  noHeadClass)
   {
      Instance inst1, inst2;
      int result;
      SerialBuffer buffer1 { size = count1, count = count1, buffer = (byte *)data1 };
      SerialBuffer buffer2 { size = count2, count = count2, buffer = (byte *)data2 };

      ((void (*)(void *, void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnUnserialize])(type, &inst1, buffer1);
      ((void (*)(void *, void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnUnserialize])(type, &inst2, buffer2);

      result = ((int (*)(void *, const void *, const void *))(void *)type._vTbl[__ecereVMethodID_class_OnCompare])(type, inst1, inst2);

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
      //SerialBuffer buffer1 { size = count1, count = count1, buffer = (byte *)data1 };
      //SerialBuffer buffer2 { size = count2, count = count2, buffer = (byte *)data2 };

      SerialBuffer buffer1 = collationBuffer1;
      SerialBuffer buffer2 = collationBuffer2;
      buffer1.buffer = (byte*)data1;
      buffer1.size = count1;
      buffer1.count = count1;
      buffer1.pos = 0;
      buffer2.buffer = (byte*)data2;
      buffer2.size = count2;
      buffer2.count = count2;
      buffer2.pos = 0;

      if(type.structSize > 512)
      {
         inst1 = new0 byte[type.structSize];
         inst2 = new0 byte[type.structSize];
      }
      else
      {
         inst1 = storage1;
         inst2 = storage2;
      }
      ((void (*)(void *, void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnUnserialize])(type, inst1, buffer1);
      ((void (*)(void *, void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnUnserialize])(type, inst2, buffer2);

      result = ((int (*)(void *, void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnCompare])(type, inst1, inst2);

      buffer1.buffer = null;
      buffer2.buffer = null;
      //delete buffer1;
      //delete buffer2;
      if(type.structSize > 512)
      {
         delete inst1;
         delete inst2;
      }
      return result;
   }
   else
      return ((int (*)(void *, const void *, const void *))(void *)type._vTbl[__ecereVMethodID_class_OnCompare])(type, data1, data2);
}

public class SQLiteStaticLink { }   // Until .imp generation is fixed

class SQLiteDataSource : DirFilesDataSourceDriver
{
   class_property(name) = "SQLite";
   class_property(databaseFileExtension) = "sqlite";

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
            printf($"EDASQLite: Can't open database (%s): %s\n", path, sqlite3_errmsg(db));
            sqlite3_close(db);
         }
         else
         {
            bool success = true;
            char command[1024];

            sqlite3_exec(db, "PRAGMA page_size=4096;", null, null, null);
            sqlite3_exec(db, "PRAGMA synchronous=off;", null, null, null);

            sprintf(command, "CREATE TABLE eda_table_fields(Table_Name TEXT, Name TEXT, Type TEXT, Length INT);");
            sqlite3_exec(db, command, null, null, null);

            if(createOptions != readOnly)
            {
               sqlite3_exec(db, "PRAGMA locking_mode=exclusive", null, null, null);
               sqlite3_exec(db, "DELETE FROM eda_table_fields WHERE Name = 'lockDummy'", null, null, null);
               if(sqlite3_exec(db, "INSERT INTO eda_table_fields (Table_Name, Name, Type, Length) VALUES ('lockDummy', 'lockDummy', 'lockDummy', 'lockDummy')", null, null, null))
                  success = false;
               else
                  sqlite3_exec(db, "DELETE FROM eda_table_fields WHERE Name = 'lockDummy'", null, null, null);
            }

            if(success)
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
   SQLiteTable tbl;

   ~SQLiteField()
   {
      delete name;
   }

   const String GetName()
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
   Table GetTable()
   {
      return tbl;
   }
}

class SQLiteDatabase : Database
{
   sqlite3 * db;
   AVLTree<const String> collations { };

   ~SQLiteDatabase()
   {
      sqlite3_exec(db, "PRAGMA locking_mode=normal", null, null, null);
      // "Simply setting the locking-mode to NORMAL is not enough - locks are not released until the next time the database file is accessed."
      sqlite3_exec(db, "SELECT COUNT(*) from eda_table_fields", null, null, null);
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
      //int result;
      int nRows = 0, nCols = 0;
      char ** t;
      SQLiteTable table = null;
      if(options.type == tablesList)
      {
         SQLiteField field;
         strcpy(command, "SELECT name FROM sqlite_master WHERE type='table' AND name!='eda_table_fields';");
         table = SQLiteTable { db = this, specialStatement = CopyString(command) };
         field = { tbl = table, name = CopyString("Name"), type = class(String), num = -1, sqliteType = SQLITE_TEXT };
         LinkTable(table);
         incref field;
         table._fields.Add(field);
      }
      else if(options.type == fieldsList)
      {
         SQLiteField field;

         sprintf(command, "SELECT Name, Type, Length FROM eda_table_fields WHERE Table_Name='%s';", name);
         table = SQLiteTable { db = this, specialStatement = CopyString(command) };
         LinkTable(table);
         field = { tbl = table, name = CopyString("Name"), type = class(String), num = -1, sqliteType = SQLITE_TEXT };
         incref field;
         table._fields.Add(field);
         field = { tbl = table, name = CopyString("Type"), type = class(Class), num = 0, sqliteType = SQLITE_TEXT };
         incref field;
         table._fields.Add(field);
         field = { tbl = table, name = CopyString("Length"), type = class(int), num = 1, sqliteType = SQLITE_INTEGER };
         incref field;
         table._fields.Add(field);
      }
      else if(options.type == tableRows)
      {
         bool addFields = false;

         sprintf(command, "SELECT Name FROM eda_table_fields WHERE Table_Name='%s';", name);
         /*result = */sqlite3_get_table(db, command, &t, &nRows, &nCols, null);
         if(!nRows && !nCols)
            addFields = true;

         sqlite3_free_table(t);

         sprintf(command, "SELECT sql FROM sqlite_master WHERE type='table' AND name='%s';", name);
         nCols = 0, nRows = 0;
         /*result = */sqlite3_get_table(db, command, &t, &nRows, &nCols, null);

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
                           int sqliteType = SQLITE_BLOB;
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
                           /*result = */sqlite3_exec(db, command, null, null, null);

                           {
                              SQLiteField field { tbl = table, name = CopyString(fieldName), type = type, num = table._fields.count, sqliteType = sqliteType };
                              incref field;
                              table._fields.Add(field);
                           }

                           if(!ch || ch == ')') break;
                        }
                     }
                  }
               }
               else
               {
                  Table refTable = null;
                  sqlite3_stmt * statement;

                  sprintf(command, "SELECT Name, Type, Length FROM eda_table_fields WHERE Table_Name='%s';", name);
                  /*result = */sqlite3_prepare_v2(db, command, -1, &statement, null);

                  while(sqlite3_step(statement) != SQLITE_DONE)
                  {
                     const char * fieldName = (const char *)sqlite3_column_text(statement, 0);
                     const char * typeName = (const char *)sqlite3_column_text(statement, 1);
                     int length = sqlite3_column_int(statement, 2);
                     Class type = null;
                     int sqliteType = SQLITE_BLOB;

                     type.OnGetDataFromString(typeName);

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
                        Table * fTable = (Table *)(intptr)eClass_GetProperty(type, "table");
                        SQLiteField field { tbl = table, name = CopyString(fieldName), type = type, length = length, num = table._fields.count, sqliteType = sqliteType };
                        incref field;
                        if(fTable) refTable = *fTable;
                        if(!table.primaryKey && refTable && !strcmp(refTable.name, table.name))
                           table.primaryKey = field;

                        table._fields.Add(field);
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
         PrintLn($"BEGIN FAILED!");
      return result == SQLITE_OK;
   }

   bool Commit()
   {
      char command[1024];
      int result;
      sprintf(command, "COMMIT;");
      result = sqlite3_exec(db, command, null, null, null);
      if(result)
         PrintLn($"COMMIT FAILED!");
      return result == SQLITE_OK;
   }

   bool CreateCustomFunction(const char * name, SQLCustomFunction customFunction)
   {
      bool result = false;
#if !defined(__EMSCRIPTEN__) && !defined(__ANDROID__) && !defined(__UWP__)
      Class cfClass = customFunction._class;
      customFunction.method = eClass_FindMethod(cfClass, "function", cfClass.module);
      if(customFunction.method)
      {
         String typeString = CopyString(customFunction.method.dataTypeString);
         char * tokens[256];
         int count = TokenizeWith(typeString, sizeof(tokens)/sizeof(tokens[0]), tokens, "(,)", false);
         int c;
         bool variadic = false;

         for(c = 0; c < count; c++)
         {
            Class type = null;
            bool pointer = false;
            const String arg = tokens[c];
            char * space;
            TrimLSpaces(tokens[c], tokens[c]);
            if(strchr(arg, '*')) pointer = true;
            if(pointer)
               // Using String for generic pointer...
               type = class(String);
            else
            {
               if((space = strchr(arg, ' '))) *space = 0;
               if(!strcmp(arg, "void"))
                  type = null;
               else if(!strcmp(arg, "..."))
                  variadic = true;
               else
               {
                  if(cfClass.templateParams.count)
                  {
                     ClassTemplateParameter p;
                     int id = 0;
                     for(p = cfClass.templateParams.first; p; p = p.next, id++)
                     {
                        if(!strcmp(p.name, arg))
                           break;
                     }
                     if(p && cfClass.templateArgs)
                        arg = cfClass.templateArgs[id].dataTypeString;
                  }
                  type = eSystem_FindClass(customFunction._class.module, arg);
                  if(!type)
                     type = eSystem_FindClass(customFunction._class.module.application, arg);
               }
            }
            if(c == 0)
               customFunction.returnType = type;
            else
               customFunction.args.Add(type);
         }
         delete typeString;
         if(variadic)
         {
            result = false;
            // Variadic args don't make sense for SQL custom functions
            // Note that different CIF must be prepared for different set of arguments
            // ffi_prep_cif_var(&customFunction.cif, FFI_DEFAULT_ABI, args.count-1, rType, argTypes);
         }
         else
         {
            customFunction.rType = FFIGetType(customFunction.returnType, true);
            customFunction.argTypes.Add((void *)&ffi_type_pointer);    // This pointer for SQLCustomFunction object
            for(a : customFunction.args) customFunction.argTypes.Add((void *)FFIGetType(a, false));
            delete customFunction.cif;
            customFunction.cif = new0 ffi_cif[1];
            ffi_prep_cif(customFunction.cif, FFI_DEFAULT_ABI, customFunction.argTypes.count, customFunction.rType, (ffi_type **) customFunction.argTypes.array);
            result = sqlite3_create_function(db, name, customFunction.args.count, SQLITE_UTF8, customFunction, SQLiteFunctionProcessor, null, null) == SQLITE_OK;
         }
      }
#endif
      return result;
   }
}

static class FFITypesHolder : Map<Class, String> { ~FFITypesHolder() { Free(); } }
FFITypesHolder structFFITypes { };
__attribute__((unused)) static Iterator dummy; // TOFIX: forward struct declaration issues on Clang

public ffi_type * FFIGetType(Class type, bool structByValue)
{
#if !defined(__EMSCRIPTEN__) && !defined(__ANDROID__) && !defined(__UWP__)
   if(type)
      switch(type.type)
      {
         // Pointer Types
         case structClass:
            if(structByValue)
            {
               MapIterator<Class, String> it { map = (void*)structFFITypes };
               ffi_type * ffiType = null;
               if(it.Index(type, false))
                  ffiType = (void *)it.data;
               else
               {
                  /*
                  DataMember member;
                  Array<String> memberTypes { };
                  for(member = type.membersAndProperties.first; member; member = member.next)
                  {
                     if(!member.isProperty)
                     {
                        memberTypes.Add(FFIGetType(member.dataType
                     }
                  }
                  */
                  ffiType = new0 ffi_type[1];
                  ffiType->size = type.structSize;
                  ffiType->type = FFI_TYPE_STRUCT;
                  structFFITypes[type] = (void *)ffiType;
               }
               return ffiType;
            }
         case normalClass:
         case noHeadClass:
         case unionClass:
            return &ffi_type_pointer;
         // Scalar Types
         case bitClass:
         case enumClass:
         case systemClass:
         case unitClass:
                 if(!strcmp(type.dataTypeString, "float"))  return &ffi_type_float;
            else if(!strcmp(type.dataTypeString, "double")) return &ffi_type_double;
            else
               switch(type.typeSize)
               {
                  case 1: return &ffi_type_uint8;
                  case 2: return &ffi_type_uint16;
                  case 4: return &ffi_type_uint32;
                  case 8: return &ffi_type_uint64;
               }
      }
   else
      return &ffi_type_void;
#endif
   return null;
}

static SerialBuffer staticBuffer { };
void SQLiteFunctionProcessor(sqlite3_context* context, int n, sqlite3_value** values)
{
#if !defined(__EMSCRIPTEN__) && !defined(__ANDROID__) && !defined(__UWP__)
   SQLCustomFunction sqlFunction = sqlite3_user_data(context);

   /*  // Simple 1 pointer param returning a string
   void * p = sqlFunction.method.function(sqlFunction, sqlite3_value_text(values[0]));
   sqlite3_result_text(context, p, strlen(p), SQLITE_TRANSIENT);
   */
   int64 retData = 0;
   void * ret = &retData;
   Array<String> args { size = sqlFunction.args.count + 1 };
   Iterator<String> ffiArg { sqlFunction.argTypes };
   Iterator<String> arg { args };
   int i = 0;

   // this * for the SQLCustomFunction
   args[0] = (void *)&sqlFunction;
   ffiArg.Next();
   // Get the arguments from SQLite
   for(a : sqlFunction.args)
   {
      ffi_type * type = (ffi_type *)sqlFunction.argTypes[i+1];
      if(i >= n) break;
      switch(a.type)
      {
         case normalClass:
         case noHeadClass:
         case structClass:
         case unionClass:
         {
            void ** data = new void *[1];
            args[i+1] = (void *)data;
            if(a == class(String))
            {
               int numBytes = sqlite3_value_bytes(values[i]);
               const char * text = (const char *)sqlite3_value_text(values[i]);
               *(char **)data = text ? new byte[numBytes+1] : null;
               if(text)
                  memcpy(*(char **)data, text, numBytes+1);
            }
            else
            {
               SerialBuffer buffer = staticBuffer; //{ };
               buffer.pos = 0;
               buffer._size = sqlite3_value_bytes(values[i]);
               buffer._buffer = (byte *)sqlite3_value_text(values[i]);
               //buffer._buffer = sqlite3_value_blob(curStatement);
               buffer.count = buffer._size;
               if(a.type == structClass)
                  *data = new byte[a.structSize];
               ((void (*)(void *, void *, void *))(void *)a._vTbl[__ecereVMethodID_class_OnUnserialize])(a, (a.type == structClass) ? *data : data, buffer);
               buffer._buffer = null;
               //delete buffer;
            }
            break;
         }
         case bitClass:
         case enumClass:
         case systemClass:
         case unitClass:
            if(type == &ffi_type_double || type == &ffi_type_float)
            {
               double d = sqlite3_value_double(values[i]);
               if(a.typeSize == 8)
               {
                  double * data = new double[1];
                  args[i+1] = (void *)data;
                  *data = d;
               }
               else
               {
                  float * data = new float[1];
                  args[i+1] = (void *)data;
                  *data = (float)d;
               }
            }
            else
            {
               switch(a.typeSize)
               {
                  case 8:
                  {
                     int64 * data = new int64[1];
                     args[i+1] = (void *)data;
                     *data = sqlite3_value_int64(values[i]);
                     break;
                  }
                  case 4:
                  {
                     int * data = new int[1];
                     args[i+1] = (void *)data;
                     *data = sqlite3_value_int(values[i]);
                     break;
                  }
                  case 2:
                  {
                     short * data = new short[1];
                     int value;
                     args[i+1] = (void *)data;
                     value = sqlite3_value_int(values[i]);
                     if(value < 0)
                        *data = (short)value;
                     else
                        *(uint16 *)data = (uint16)value;
                     break;
                  }
                  case 1:
                  {
                     char * data = new char[1];
                     int value;
                     args[i+1] = data;
                     value = sqlite3_value_int(values[i]);
                     if(value < 0)
                        *data = (char)value;
                     else
                        *(byte *)data = (byte)value;
                     break;
                  }
               }
            }
            break;
      }
      i++;
      ffiArg.Next();
   }
   if(sqlFunction.returnType && sqlFunction.returnType.type == structClass)
      ret = new byte[sqlFunction.returnType.typeSize];
   ffi_call(sqlFunction.cif, (void *)sqlFunction.method.function, ret, args.array);
   // Give SQLite the return value
   if(sqlFunction.returnType)
   {
      ffi_type * type = sqlFunction.rType;
      Class r = sqlFunction.returnType;
      switch(r.type)
      {
         case normalClass:
         case noHeadClass:
         case structClass:
         case unionClass:
         {
            void * data = ret ? *(void **)ret : null;
            if(r.type == structClass)
               data = ret;
            if(r == class(String))
            {
               if(data)
                  sqlite3_result_text(context, (char *)data, strlen((char *)data), SQLITE_TRANSIENT);
               else
                  sqlite3_result_text(context, null, 0, SQLITE_TRANSIENT);
            }
            else
            {
               SerialBuffer buffer { };
               ((void (*)(void *, void *, void *))(void *)r._vTbl[__ecereVMethodID_class_OnSerialize])(r, data, buffer);
               sqlite3_result_text(context, (char *)buffer._buffer, buffer.count, SQLITE_TRANSIENT);
               delete buffer;

               // Avoid destroying Strings for now... (Returning memory owned by the Custom Function)
               ((void (*)(void *, void *))(void *)r._vTbl[__ecereVMethodID_class_OnFree])(r, data);
            }

            if(r.type == structClass)
               delete ret;
            break;
         }
         case bitClass:
         case enumClass:
         case systemClass:
         case unitClass:
            if(type == &ffi_type_double || type == &ffi_type_float)
            {
               if(r.typeSize == 8)
                  sqlite3_result_double(context, *(double *)ret);
               else
                  sqlite3_result_double(context, (double)*(float *)ret);
            }
            else
            {
               switch(r.typeSize)
               {
                  case 8:
                     sqlite3_result_int64(context, (sqlite3_int64)*(int64 *)ret);
                     break;
                  case 4:
                     sqlite3_result_int(context, *(int *)ret);
                     break;
                  case 2:
                  {
                     int value;
                     //if((int)data < 0)
                        value = (int)*(short *)ret;
                     //else
                        //value = (int)*(uint16 *)ret;
                     sqlite3_result_int(context, value);
                     break;
                  }
                  case 1:
                  {
                     int value;
                     //if((int)data < 0)
                        value = (int)*(char *)ret;
                     //else
                        //value = (int)*(byte *)ret;
                     sqlite3_result_int(context, value);
                     break;
                  }
               }
            }
            break;
      }
   }

   // Free Stuff up
   arg.Next();
   for(type : sqlFunction.args; arg.Next())
   {
      // Free instance
      void * data = *(void **)arg.data;
      ((void (*)(void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnFree])(type, data);
      if(type.type == structClass)
         delete data;
      // Free arg holder
      data = arg.data;
      delete data;
   }
   delete args;
#endif
}

class SQLiteTable : Table
{
   char * name;
   bool mustCreate;
   SQLiteDatabase db;
   LinkList<SQLiteField> _fields { };
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
      if(sqliteType != SQLITE_BLOB && eClass_IsDerived(type, class(eda::Id)) && type != class(eda::Id))
      {
         Table * table = (Table *)(intptr)eClass_GetProperty(type, "table");
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
            PrintLn($"WARNING: Table not yet created for class ", (String)type.name);
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
               PrintLn($"WARNING: ALTER TABLE DOESN'T WORK WITH PRIMARY KEY FOR ", (String)name);
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

      field = { name = CopyString(fieldName), type = type, num = _fields.count, sqliteType = sqliteType };
      incref field;
      _fields.Add(field);
      if(!primaryKey && refTable == this)
         primaryKey = field;
      return (Field)field;
   }

   Field FindField(const String name)
   {
      for(f : _fields; !strcmp(f.name, name))
      {
         if(!primaryKey)
         {
            if(f.sqliteType != SQLITE_BLOB && eClass_IsDerived(f.type, class(eda::Id)))
            {

               Table * tablePtr = (Table *)(intptr)eClass_GetProperty(f.type, "table");
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
      char command[4096 + 64];
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

   const String GetName()
   {
      return name;
   }

   Field GetFirstField()
   {
      return _fields.first;
   }

   Field GetPrimaryKey()
   {
      return primaryKey;
   }

   uint GetFieldsCount()
   {
      return _fields.count;
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

   // Returns true if not ordered by row ID
   bool GetIndexOrder(char * fullOrder, bool flip)
   {
      if(!flip && (!indexFields || (indexFieldsCount == 1 && indexFields[0].field == primaryKey && indexFields[0].order == ascending)))
      {
         strcpy(fullOrder, " ORDER BY ROWID");
         return false;
      }
      else
      {
         int c;
         strcpy(fullOrder, " ORDER BY ");
         for(c = flip ? indexFieldsCount-1 : 0; flip ? (c >= 0) : (c < indexFieldsCount); flip ? c-- : c++)
         {
            char order[1024];
            FieldIndex * fIndex = &indexFields[c];
            order[0] = 0;
            if(c) strcat(order, ", ");
            strcat(order, "`");
            strcat(order, fIndex->field.name);
            strcat(order, "`");
            if(fIndex->order == (flip ? ascending : descending)) strcat(order, " DESC");
            strcat(fullOrder, order);
         }
         return true;
      }
   }

   Container<Field> GetFields()
   {
      return (Container<Field>)_fields;
   }

   DriverRow CreateRow()
   {
      char command[1024*2];
      sqlite3_stmt * statement;
      sqlite3_stmt * sysIDStmt = null, * insertStmt = null, * deleteStmt = null, * selectRowIDsStmt = null, * setRowIDStmt = null;
      sqlite3_stmt * prevStmt = null, * nextStmt = null, * lastStmt = null, * insertIDStmt = null;

      if(specialStatement)
         strcpy(command, specialStatement);
      else
      {
         char order[1024];
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

         GetIndexOrder(order, false);
         sprintf(command, "SELECT ROWID, * FROM `%s`%s;", name, order);
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
      _fields.Free();
   }
}

class SQLiteRow : DriverRow
{
   SQLiteTable tbl;
   sqlite3_stmt * curStatement;

   sqlite3_stmt * defaultStatement;
   sqlite3_stmt * findStatement;
   sqlite3_stmt * prevFindStatement, * lastFindStatement;
   sqlite3_stmt * nextFindStatement;
   sqlite3_stmt * sysIDStatement;
   sqlite3_stmt * queryStatement;
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
   // Because we use GoToSysID() and the sysIDStatement when searching for a primary key with Find(),
   // this flag is used to distinguish between a Find() and a GoToSysID() for Select(next) purposes:
   bool findSysID;
   int findBindId;

   bool Nil()
   {
      return done;
   }

   ~SQLiteRow()
   {
      if(defaultStatement) sqlite3_finalize(defaultStatement);
      if(findStatement)    sqlite3_finalize(findStatement);
      if(prevFindStatement)sqlite3_finalize(prevFindStatement);
      if(lastFindStatement)sqlite3_finalize(lastFindStatement);
      if(nextFindStatement)sqlite3_finalize(nextFindStatement);
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
         case previous:
         {
            // For sysID statement, for a Find() we want to go through next/previous in order, otherwise we just go to nil
            if((move == next && curStatement != prevFindStatement && curStatement != lastFindStatement && !stepping && (curStatement != sysIDStatement || findSysID)) ||
               (move == previous && (curStatement == prevFindStatement || curStatement == lastFindStatement)))
            {
               result = sqlite3_step(curStatement);
               done = result == SQLITE_DONE || (result && result != SQLITE_ROW);
               if(done) { rowID = 0; sqlite3_reset(curStatement); return false; }
               rowID = sqlite3_column_int64(curStatement, 0);
            }
            else if(curStatement == prevFindStatement || curStatement == findStatement || curStatement == nextFindStatement || curStatement == lastFindStatement)
            {
               if(rowID)
               {
                  int bindId = findBindId;
                  sqlite3_reset((move == next) ? nextFindStatement : prevFindStatement);
                  BindCursorData((move == next) ? nextFindStatement : prevFindStatement, move,
                     (move == next && (!tbl.indexFields || (tbl.indexFieldsCount == 1 && tbl.indexFields[0].field == tbl.primaryKey && tbl.indexFields[0].order == ascending))) ? false : true, &bindId);
                  sqlite3_reset(curStatement);
                  curStatement = (move == next) ? nextFindStatement : prevFindStatement;
                  result = sqlite3_step(curStatement);
                  done = result == SQLITE_DONE || (result && result != SQLITE_ROW);
                  if(done) { rowID = 0; sqlite3_reset(curStatement); return false; }
                  rowID = sqlite3_column_int64(curStatement, 0);
               }
               else
               {
                  sqlite3_reset((move == next) ? findStatement : lastFindStatement);
                  sqlite3_reset(curStatement);
                  curStatement = (move == next) ? findStatement : lastFindStatement;
                  result = sqlite3_step(curStatement);
                  done = result == SQLITE_DONE || (result && result != SQLITE_ROW);
                  if(done) { rowID = 0; sqlite3_reset(curStatement); return false; }
                  rowID = sqlite3_column_int64(curStatement, 0);
               }
            }
            else
            {
               sqlite3_reset(curStatement);
               curStatement = (move == previous) ? (rowID ? previousStatement : lastStatement) : (rowID ? nextStatement : defaultStatement);
               sqlite3_bind_int64(curStatement, 1, (sqlite3_int64)rowID);
               result = sqlite3_step(curStatement);
               done = result == SQLITE_DONE || (result && result != SQLITE_ROW);
               if(done) { rowID = 0; sqlite3_reset(curStatement); return false; }
               rowID = sqlite3_column_int64(curStatement, 0);
            }
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

   bool Query(const char * queryString)
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
         if(!result)
         {
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
         {
            printf("SQLite Query Error: %s\n", queryString);
            status = false;
         }
      }
      else
         curStatement = null;
      return status;
   }

   bool BindData(sqlite3_stmt * statement, int pos, SQLiteField fld, typed_object data, SerialBuffer * bufferOut)
   {
      int result = 1;
      Class dataType = fld.type;
      SerialBuffer buffer = null;
      int dts = data._class.typeSize;

      switch(fld.sqliteType)
      {
         case SQLITE_INTEGER:
         {
            switch(dts) //dataType.typeSize)
            {
               case 8:
                  result = sqlite3_bind_int64(statement, pos, (sqlite3_int64)*(int64 *)data);
                  break;
               case 4:
                  result = sqlite3_bind_int(statement, pos, *(int *)data);
                  break;
               case 2:
               {
                  int value;
                  if((int)data < 0)
                     value = (int)*(short *)data;
                  else
                     value = (int)*(uint16 *)data;
                  result = sqlite3_bind_int(statement, pos, value);
                  break;
               }
               case 1:
               {
                  int value;
                  if((int)data < 0)
                     value = (int)*(char *)data;
                  else
                     value = (int)*(byte *)data;
                  result = sqlite3_bind_int(statement, pos, value);
                  break;
               }
            }
            break;
         }
         case SQLITE_FLOAT:
         {
            if(dataType.typeSize == 8)
               result = sqlite3_bind_double(statement, pos, *(double *)data);
            else
               result = sqlite3_bind_double(statement, pos, (double)*(float *)data);
            break;
         }
         case SQLITE_TEXT:
         {
            if((char *)data)
               result = sqlite3_bind_text(statement, pos, (char *)data, strlen((char *)data), SQLITE_TRANSIENT);
            else
               result = sqlite3_bind_null(statement, pos);
            break;
         }
         case SQLITE_BLOB:
         case SQLITE_NULL:
         {
            if((void *)data && dataType)
            {
               buffer = SerialBuffer { };
               ((void (*)(void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnSerialize])(dataType, data, buffer);
               result = sqlite3_bind_text(statement, pos, (char *)buffer._buffer, buffer.count, SQLITE_TRANSIENT);
            }
            else
               result = sqlite3_bind_null(statement, pos);
            break;
         }
      }
      if(bufferOut)
         *bufferOut = buffer;
      else
         delete buffer;
      return !result;
   }

   void AddCursorWhereClauses(char * command, MoveOptions move, bool useIndex)
   {
      if(move == next || move == previous)
      {
         // Where clauses for index
         if(useIndex)
         {
            int c;
            bool gotPrimaryKey = false;

            strcatf(command, " AND (");
            for(c = ((move == next) ? 0 : tbl.indexFieldsCount-1); (move == next) ? c < tbl.indexFieldsCount : c >= 0; (move == next) ? c++ : c--)
            {
               char where[1024];
               FieldIndex * fIndex = &tbl.indexFields[c];
               where[0] = 0;

               strcat(where, "`");
               strcat(where, fIndex->field.name);
               strcat(where, "` ");
               strcat(where, (fIndex->order == ((move == next) ? descending : ascending)) ? "<" : ">");
               strcat(where, " ? OR (");
               strcat(where, fIndex->field.name);
               if(fIndex->field == tbl.primaryKey)
                  gotPrimaryKey = true;
               strcat(where, " = ? AND (");
               strcat(command, where);
            }
            strcat(command, gotPrimaryKey ? "1)" : ((move == next) ? "ROWID > ?)" : "ROWID < ?)"));
            for(c = 0; c < tbl.indexFieldsCount; c++)
               strcat(command, "))");
         }
         else
            strcatf(command, (move == next) ? " AND ROWID > ?" : " AND ROWID < ?");
      }
   }

   void BindCursorData(sqlite3_stmt * stmt, MoveOptions move, bool useIndex, int * bindId)
   {
      if(move == next || move == previous)
      {
         // The binds for the Extra ordering Where clauses
         if(useIndex)
         {
            int c;
            /* // Code to not rely on curStatement being set up
            SQLiteRow dataRow = (SQLiteRow)tbl.CreateRow();
            dataRow.GoToSysID((uint)rowID);
            */
            for(c = ((move == next) ? 0 : tbl.indexFieldsCount-1); (move == next) ? c < tbl.indexFieldsCount : c >= 0; (move == next) ? c++ : c--)
            {
               FieldIndex * fIndex = &tbl.indexFields[c];
               int64 data;
               SQLiteField fld = (SQLiteField)fIndex->field;
               Class type = fld.type;
               void * dataPtr;
               SerialBuffer buffer;

               if(type.type == unitClass && !type.typeSize)
               {
                  Class dataType = eSystem_FindClass(type.module, type.dataTypeString);
                  if(dataType)
                     type = dataType;
               }
               if(type.type == structClass)
               {
                  data = (int64)(intptr)new0 byte[type.structSize];
                  dataPtr = (void *)(intptr)data;
               }
               // ((bool (*)())(void *)dataRow.GetData)(dataRow, fld, type, (type.type == structClass) ? (void *)data : &data);
               ((bool (*)())(void *)this.GetData)(this, fld, type, (type.type == structClass) ? (void *)(intptr)data : &data);
               if(type.type == normalClass || type.type == noHeadClass)
                  dataPtr = (void *)(intptr)data;
               else
                  dataPtr = &data;
               ((bool (*)())(void *)this.BindData)(this, stmt, (*bindId)++, fld, type, dataPtr, &buffer);
               // NOTE: The data is bound twice, for there are 2x '?' in the query from AddCursorWhereClauses
               // Reuse the buffer for Blobs...
               if(fld.sqliteType == SQLITE_BLOB || fld.sqliteType == SQLITE_NULL)
               {
                  sqlite3_bind_text(stmt, (*bindId)++, (char *)buffer._buffer, buffer.count, SQLITE_TRANSIENT);
                  delete buffer;
               }
               else
                  ((bool (*)())(void *)this.BindData)(this, stmt, (*bindId)++, fld, type, dataPtr, null);

               ((void (*)(void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnFree])(type, dataPtr);
            }
            // delete dataRow;
         }

         // Bind for the rowid
         sqlite3_bind_int64(stmt, (*bindId)++, (sqlite3_int64)rowID);
      }
   }

   bool Find(Field fld, MoveOptions move, MatchOptions match, typed_object data)
   {
      char order[1024], command[2048];
      int result;
      bool useIndex;
      sqlite3_stmt * stmt = null;
      int bindId = 1;

      if(fld == tbl.primaryKey)
      {
         if(curStatement) { sqlite3_reset(curStatement); curStatement = null; }
         if(findStatement) { sqlite3_finalize(findStatement); findStatement = null; }
         if(nextFindStatement) { sqlite3_finalize(nextFindStatement); nextFindStatement = null; }
         if(prevFindStatement) { sqlite3_finalize(prevFindStatement); prevFindStatement = null; }
         if(lastFindStatement) { sqlite3_finalize(lastFindStatement); lastFindStatement = null; }
         result = GoToSysID(*(Id *)data);
         if(result)
            findSysID = true;
         return result != 0;
      }

      useIndex = tbl.GetIndexOrder(order, false);
      // Basic Find
      sprintf(command, "SELECT ROWID, * FROM `%s` WHERE `%s` = ?", tbl.name, fld.name);
      AddCursorWhereClauses(command, move, useIndex);
      strcat(command, order);
      strcat(command, ";");
      result = sqlite3_prepare_v2(tbl.db.db, command, -1, &stmt, null);
      BindData(stmt, bindId++, (SQLiteField)fld, data, null);
      BindCursorData(stmt, move, useIndex, &bindId);

      // Currently, we can't reset curStatement until after BindCursorData, as current data is read from it
      if(curStatement) { sqlite3_reset(curStatement); curStatement = null; }
      if(findStatement) { sqlite3_finalize(findStatement); findStatement = null; }
      if(nextFindStatement) { sqlite3_finalize(nextFindStatement); nextFindStatement = null; }
      if(prevFindStatement) { sqlite3_finalize(prevFindStatement); prevFindStatement = null; }
      if(lastFindStatement) { sqlite3_finalize(lastFindStatement); lastFindStatement = null; }

      curStatement = findStatement = stmt;
      findBindId = bindId;

      // For going back to forward find
      bindId = 1;
      sprintf(command, "SELECT ROWID, * FROM `%s` WHERE `%s` = ?", tbl.name, fld.name);
      AddCursorWhereClauses(command, next, useIndex);
      strcat(command, order);
      strcat(command, ";");
      result = sqlite3_prepare_v2(tbl.db.db, command, -1, &stmt, null);
      BindData(stmt, bindId++, (SQLiteField)fld, data, null);
      nextFindStatement = stmt;

      // Backwards
      tbl.GetIndexOrder(order, true);
      // For tracing back finds
      bindId = 1;
      sprintf(command, "SELECT ROWID, * FROM `%s` WHERE `%s` = ?", tbl.name, fld.name);
      AddCursorWhereClauses(command, previous, true);
      strcat(command, order);
      strcat(command, ";");
      result = sqlite3_prepare_v2(tbl.db.db, command, -1, &stmt, null);
      BindData(stmt, bindId++, (SQLiteField)fld, data, null);
      prevFindStatement = stmt;

      // For tracing back from last
      bindId = 1;
      sprintf(command, "SELECT ROWID, * FROM `%s` WHERE `%s` = ?", tbl.name, fld.name);
      strcat(command, order);
      strcat(command, ";");
      result = sqlite3_prepare_v2(tbl.db.db, command, -1, &stmt, null);
      BindData(stmt, bindId++, (SQLiteField)fld, data, null);
      lastFindStatement = stmt;

      result = sqlite3_step(findStatement);

      done = result == SQLITE_DONE || (result && result != SQLITE_ROW);
      if(done)
      {
         rowID = 0;
         sqlite3_reset(findStatement);
      }
      else
         rowID = sqlite3_column_int64(findStatement, 0);
      return !done;
   }

   bool FindMultiple(FieldFindData * findData, MoveOptions move, int numFields)
   {
#define BINDDATA \
         for(c = 0; c < numFields; c++) \
         { \
            FieldFindData * fieldFind = &findData[c]; \
            SQLiteField sqlFld = (SQLiteField)findData->field; \
            Class dataType = sqlFld.type; \
            BindData(stmt, bindId++, sqlFld, (dataType.type == structClass || dataType.type == noHeadClass || dataType.type == normalClass) ? fieldFind->value.p : &fieldFind->value.i64, null); \
         }

      if(numFields)
      {
         char criterias[4096], command[4096], order[1024];
         int result;
         int c;
         bool useIndex;
         sqlite3_stmt * stmt = null;
         int bindId = 1;

         // Criterias
         sprintf(criterias, "SELECT ROWID, * FROM `%s` WHERE `", tbl.name);
         for(c = 0; c < numFields; c++)
         {
            FieldFindData * fieldFind = &findData[c];

            if(c) strcat(criterias, " AND `");
            strcat(criterias, fieldFind->field.name);
            strcat(criterias, "` = ?");
         }

         useIndex = tbl.GetIndexOrder(order, false);
         // Basic Find (multiple)
         strcpy(command, criterias);
         AddCursorWhereClauses(command, move, useIndex);
         strcat(command, order);
         strcat(command, ";");
         result = sqlite3_prepare_v2(tbl.db.db, command, -1, &stmt, null);
         BINDDATA;
         BindCursorData(stmt, move, useIndex, &bindId);

         // Currently, we can't reset curStatement until after BindCursorData, as current data is read from it
         if(curStatement) { sqlite3_reset(curStatement); curStatement = null; }
         if(findStatement) { sqlite3_finalize(findStatement); findStatement = null; }
         if(nextFindStatement) { sqlite3_finalize(nextFindStatement); nextFindStatement = null; }
         if(prevFindStatement) { sqlite3_finalize(prevFindStatement); prevFindStatement = null; }
         if(lastFindStatement) { sqlite3_finalize(lastFindStatement); lastFindStatement = null; }

         curStatement = findStatement = stmt;
         findBindId = bindId;

         // For tracing back forward finds
         bindId = 1;
         strcpy(command, criterias);
         AddCursorWhereClauses(command, previous, true);
         strcat(command, order);
         strcat(command, ";");
         result = sqlite3_prepare_v2(tbl.db.db, command, -1, &stmt, null);
         BINDDATA;
         nextFindStatement = stmt;

         // Backwards
         tbl.GetIndexOrder(order, true);
         // For tracing back finds
         bindId = 1;
         strcpy(command, criterias);
         AddCursorWhereClauses(command, next, useIndex);
         strcat(command, order);
         strcat(command, ";");
         result = sqlite3_prepare_v2(tbl.db.db, command, -1, &stmt, null);
         BINDDATA;
         prevFindStatement = stmt;

         // For tracing back from last
         bindId = 1;
         strcpy(command, criterias);
         strcat(command, order);
         strcat(command, ";");
         result = sqlite3_prepare_v2(tbl.db.db, command, -1, &stmt, null);
         BINDDATA;
         lastFindStatement = stmt;

         result = sqlite3_step(findStatement);
         done = result == SQLITE_DONE || (result && result != SQLITE_ROW);
         if(done)
         {
            rowID = 0;
            sqlite3_reset(findStatement);
         }
         else
            rowID = sqlite3_column_int64(findStatement, 0);
         return !done;
      }
      return false;
   }

   bool Synch(DriverRow to)
   {
      SQLiteRow rowTo = (SQLiteRow)to;
      if(tbl && rowTo.tbl && !strcmp(tbl.name, rowTo.tbl.name))
         return GoToSysID((uint)rowTo.rowID);
      return false;
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
         findSysID = false;
         sqlite3_reset(curStatement);
         sqlite3_bind_int64(sysIDStatement, 1, (sqlite3_int64)rowID);
         result = sqlite3_step(curStatement);
         done = false; // Make sure 'nil' is false
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
      Class dataType = *&sqlFld.type;
      int dataArgSize = data._class.typeSize;  // FIXME: data._class cannot be assigned to Class

      switch(sqlFld.sqliteType)
      {
         case SQLITE_INTEGER:
         {
            int64 value = 0;

            switch(dataType.typeSize)
            {
               case 8:
                  if(fld == tbl.primaryKey)
                     value = rowID;
                  else
                     value = sqlite3_column_int64(curStatement, num);
                  break;
               case 4:
                  if(fld == tbl.primaryKey)
                     value = rowID;
                  else
                     value = sqlite3_column_int(curStatement, num);
                  break;
               case 2:
                  if(fld == tbl.primaryKey)
                     value = rowID;
                  else
                     value = sqlite3_column_int(curStatement, num);
                  break;
               case 1:
                  if(fld == tbl.primaryKey)
                     value = rowID;
                  else
                     value = sqlite3_column_int(curStatement, num);
                  break;
            }
            if(dataArgSize == 8)
               *(int64 *)data = (int64)value;
            else if(dataArgSize == 4)
               *(int *)data = (int)value;
            else if(dataArgSize == 2)
               *(short *)data = (short)value;
            else if(dataArgSize == 1)
               *(char *)data = (char)value;
            break;
         }
         case SQLITE_FLOAT:
         {
            double d = sqlite3_column_double(curStatement, num);
            if(dataArgSize == 8) //dataType.typeSize == 8)
               *(double *)data = d;
            else
               *(float *)data = (float)d;
            break;
         }
         case SQLITE_TEXT:
         {
            int numBytes = sqlite3_column_bytes(curStatement, num);
            const char * text = (const char *)sqlite3_column_text(curStatement, num);
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
            buffer._buffer = (byte *)sqlite3_column_text(curStatement, num);
            buffer.count = buffer._size;

            ((void (*)(void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnUnserialize])(dataType, data, buffer);

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
      char command[1024];

      if(updateStatement)
         sqlite3_finalize(updateStatement);
      sprintf(command, "UPDATE `%s` SET `%s` = ? WHERE ROWID = ?;", tbl.name, sqlFld.name);
      // TODO: Shouldn't we cache those update statements per field?
      result = sqlite3_prepare_v2(tbl.db.db, command, -1, &updateStatement, null);
      sqlite3_bind_int64(updateStatement, 2, (sqlite3_int64)rowID);
      BindData(updateStatement, 1, (SQLiteField)fld, data, null);
      result = sqlite3_step(updateStatement);
      sqlite3_reset(updateStatement);
      if(fld == tbl.primaryKey)
         rowID = *(uint64 *)data;
      return result == SQLITE_DONE;
   }

   uint64 GetSysID()
   {
      return (int64)rowID;
   }

   bool GoToSysID(uint64 id)
   {
      //char command[1024];
      int result;
      rowID = (int64)id;
      //if(statement)
         //sqlite3_finalize(statement);
      //sprintf(command, "SELECT ROWID, * FROM `%s` WHERE ROWID = ?;", tbl.name);
      //result = sqlite3_prepare_v2(tbl.db.db, command, -1, &statement, null);

      findSysID = false;
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

   bool SetQueryParamText(int paramID, const char * data)
   {
      int result;
      if(curStatement != queryStatement)
      {
         if(curStatement) sqlite3_reset(curStatement);
         curStatement = queryStatement;
      }
      sqlite3_reset(queryStatement);
      if(data)
         result = sqlite3_bind_text(queryStatement, paramID, (char *)data, strlen((char *)data), SQLITE_TRANSIENT);
      else
         result = sqlite3_bind_text(queryStatement, paramID, null, 0, SQLITE_TRANSIENT);
      return !result;
   }

   bool SetQueryParamObject(int paramID, const void * data, Class type)
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
         ((void (*)(void *, const void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnSerialize])(type, data, buffer);
         result = sqlite3_bind_text(queryStatement, paramID, (char *)buffer._buffer, buffer.count, SQLITE_TRANSIENT);
         delete buffer;
      }
      return !result;
   }

   bool BindQueryData(int pos, SQLiteField fld, typed_object data)
   {
      if(curStatement != queryStatement)
      {
         if(curStatement) sqlite3_reset(curStatement);
         curStatement = queryStatement;
      }
      sqlite3_reset(queryStatement);
      return BindData(queryStatement, pos, fld, data, null);
   }

   bool GetQueryData(int num, SQLiteField fld, typed_object & data)
   {
      SQLiteField sqlFld = (SQLiteField)fld;
      Class dataType = *&sqlFld.type;

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
            const char * text = (const char *)sqlite3_column_text(curStatement, num);
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
            buffer._buffer = (byte *)sqlite3_column_text(curStatement, num);
            buffer.count = buffer._size;

            ((void (*)(void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnUnserialize])(dataType, data, buffer);

            buffer._buffer = null;
            delete buffer;
            break;
         }
      }
      return true;
   }

   /*char * GetExtraColumn(int paramID)
   {
      SQLiteField lastFld = tbl._fields.last;
      return sqlite3_column_text(curStatement, lastFld.num + 1 + paramID);
   }*/
   const char * GetColumn(int paramID)
   {
      return (const char *)sqlite3_column_text(curStatement, paramID);
   }
}
