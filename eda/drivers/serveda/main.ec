// using main.ec in both client and server (different files, same file name) to make Serveda.sym 's private entry for import "main" work for the client

// Serveda: pronounced like "survey" and "da" from Canada
//          doesn't directly relate to surveys but is made in Canada
//          stands for Served EDA
//          is an EDA Server and EDA driver client combo
//          the server hosts a configured data source
//          the client is just like any other eda driver
//          but marshalls the driver function over to the server
//          the server should implement multi user by offering
//          single request / transaction at a time to start

// names?: dcomeda, serveda, edaserv, edaserver, EDAserver, Serveda, EDAServed

#define IMPORT_STATIC // temporary ugliness
import IMPORT_STATIC "ecere"
import IMPORT_STATIC "EDA"

import remote "Serveda"
import "commonServeda"

Serveda serveda;

class ServedaDriver : DataSourceDriver
{
   class_property(name) = "Serveda";

   String host;
   String port;
   String user;
   String pass;

   // Serveda serveda;

   ~ServedaDriver()
   {
      delete host;
      delete port;
      delete user;
      delete pass;
   }

   String BuildLocator(DataSource ds)
   {
      // this whole thing is not really working is it? :/
      // should just pass DataSource to DataSourceDriver::Connect instead of this locator string?
      // ah, I guess this is meant to be used with database clients that _do_ use a connection string or whatnot
      delete host; host = CopyString(ds.host);
      delete port; port = CopyString(ds.port);
      delete user; user = CopyString(ds.user);
      delete pass; pass = CopyString(ds.pass);
      return null;
   }

   bool Connect(const String locator)
   {
      serveda = Serveda { };
      // bug: add an int port to DataSource class (and use int port here instead of defined constant)
      if(serveda.Connect(host, servedaPort))
      {
         if(serveda.login(user, pass))
         {
            PrintLn("did we really login?");
            return true;
         }
      }
      return false;
   }

   Array<const String> databases { };
   Array<const String> GetDatabases()
   {
      String str = serveda.dataDriver_getDatabases();
      parseECONString(str, &databases);
      return databases;
   }

   Database OpenDatabase(const String name, CreateOptions createOptions, DataSource ds)
   {
      Database database = null;
      if(name && name[0])
      {
      }
      return database;
   }
}

void parseECONString(String str, void * object)
{
   TempFile f { };
   JSONResult jsonResult;
   ECONParser parser { f = f };
   PrintLn(str);
   f.Puts(str);
   f.Seek(0, start);
   jsonResult = parser.GetObject(class(Array<const String>), object);
   delete f;
   if(jsonResult != success)
      PrintLn(" ! error parsing econ string");
}

class ServedaDatabase : Database
{
   //Database prev, next;
   //DataSourceDriver ds;
   //OldList listTbl { offset = (uint)(uintptr)&((Table)0).prev };
   public virtual String GetName();
   // TOCHECK: Deprecate this? isn't used anywhere
   //public virtual Array<String> GetTables(); // TODO: make this Container<Table> GetTables(); // if supported, filled with ready to open Tables

public:
   // TODO: Get rid of all these, they are not defined anywhere and we have no need for a common API for these different 'ObjectTypes'
   //virtual uint ObjectsCount(ObjectType type);
   //virtual bool RenameObject(ObjectType type, const String name, const String rename);
   //virtual bool DeleteObject(ObjectType type, const String name);

#if 0
   virtual Table OpenTable(const String name, OpenOptions open);
   virtual bool Begin();
   virtual bool Commit();
   virtual bool CreateCustomFunction(const char * name, SQLCustomFunction customFunction);
#endif // 0
}

#if 0
public enum IndexOrder { ascending, descending };

public struct FieldIndex
{
   Field field;
   IndexOrder order;
   Field memberField;
   Table memberTable;
   Field memberIdField;
};

Mutex idRowCacheMutex { };

public class Table
{
   class_no_expansion;
   Table prev, next;
   Database db;
   OldList listRows { offset = (uint)(uintptr)&((Row)0).prev };
   Row cachedIdRow;
public:
   virtual const String GetName();
   virtual Field GetFirstField();
   virtual Field GetPrimaryKey();
   virtual uint GetFieldsCount();
   virtual uint GetRowsCount();
   virtual DriverRow CreateRow();

   ~Table()
   {
      Row row;

      // Delete cached Id row
      idRowCacheMutex.Wait();
      delete cachedIdRow;
      idRowCacheMutex.Release();

#ifdef AUTO_DELETE_TABLES
      if(db)
         db.listTbl.Remove(this);
#endif
      while((row = listRows.first))
         row.tbl = null;
   }
public:
   property const String name { get { return GetName(); } }
   property Field firstField { get { return GetFirstField(); } }
   property Field primaryKey { get { return GetPrimaryKey(); } }
   property uint fieldsCount { get { return GetFieldsCount(); } }
   property uint rowsCount { get { return GetRowsCount(); } }
   property Container<Field> fields { get { return GetFields(); } }

   virtual Field AddField(const String name, Class type, int length);
   virtual Field FindField(const String name);
   virtual bool GenerateIndex(int count, FieldIndex * fieldIndexes, bool init);
   virtual Container<Field> GetFields();
   virtual uint GetRecordSize();

   bool Index(int count, FieldIndex * fieldIndexes)
   {
      return GenerateIndex(count, fieldIndexes, true);
   }

   void GUIListBoxAddRowsField(ListBox list, const String fieldName)
   {
      Field fld;
      list.Clear();
      fld = FindField(fieldName);
      if(fld)
      {
         Row r { this };
         while(r.Next())
         {
            String s/* = null*/;
            r.GetData(fld, s);
            list.AddRow().SetData(null, s);
            delete s;
         }
         delete r;
      }
   }

   void GUIListBoxAddFields(ListBox list)
   {
      Field fld;
      list.Clear();
      list.ClearFields();
      for(fld = firstField; fld; fld = fld.next)
      {
         DataField df
         {
            alignment = left;
            dataType = fld.type;
            editable = true;
            header = fld.name;
            width = 100;
         };
         list.AddField(df);
      }
   }

   void GUIListBoxAddRows(ListBox list)
   {
      list.Clear();
      if(rowsCount)
      {
         DataField df;
         DataRow dr;
         Row r { this };
         dr = list.firstRow;
         while(r.Next())
         {
            Field fld = firstField;
            for(df = list.firstField; df; df = df.next, fld = fld.next)
            {
               int64 data = 0;
               Class type = fld.type;
               if(type && type.type == unitClass && !type.typeSize)
               {
                  Class dataType = eSystem_FindClass(type.module, type.dataTypeString);
                  if(dataType)
                     type = dataType;
               }
               if(type && type.type == structClass)
                  data = (int64)(intptr)new0 byte[type.structSize];
               if(!df.prev)
               {
                  dr = list.AddRow();
                  dr.tag = r.sysID;
               }
               ((bool (*)())(void *)r.GetData)(r, fld, type, (type && type.type == structClass) ? (void *)(intptr)data : &data);
               if(type && (type.type == systemClass || type.type == unitClass || type.type == bitClass || type.type == enumClass))
                  dr.SetData(df, (void *)&data);
               else
                  dr.SetData(df, (void *)(intptr)data);

               // Is this missing some frees here? strings? Probably not: freeData = true?
               // ((void (*)(void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnFree])(type, data);
               if(type && type.type == structClass)
               {
                  delete (void *)(intptr)data;
               }
               else if(type && !strcmp(type.dataTypeString, "char *"))
               {
                  // Strings are handled as a special case in ListBox -- normalClass, but copied when freeData = true
                  delete (char *)(intptr)data;
               }
            }
            dr = dr.next;
         }
         delete r;
      }
   }
}

public class Field
{
   class_no_expansion
public:
   virtual const String GetName();
   virtual Class GetType();
   virtual int GetLength();
   virtual Field GetPrev();
   virtual Field GetNext();
   virtual Table GetTable();

   property const String name { get { return GetName(); } }
   property Class type { get { return GetType(); } }
   property int length { get { return GetLength(); } }
   property Field prev { get { return GetPrev(); } }
   property Field next { get { return GetNext(); } }
   property Table table { get { return GetTable(); } }

   bool GetData(Row row, typed_object & data)
   {
      return row.GetData(this, data);
   }

   bool SetData(Row row, typed_object & data)
   {
      return row.SetData(this, data);
   }
};

public class Row
{
   class_no_expansion;
   DriverRow row;
   Row prev, next;
   Table tbl;
   String query;

   ~Row()
   {
#ifdef AUTO_DELETE
      if(tbl)
         tbl.listRows.Remove(this);
#endif
      delete row;
      delete query;
   }

public:
   property Table tbl
   {
      set
      {
         delete row;
         row = value ? value.CreateRow() : null;
         if(tbl)
         {
#ifdef AUTO_DELETE
            tbl.listRows.Remove(this);
#endif
            tbl = value;
            if(!value)
            {
               delete this;
               return;
            }
         }
         if(value)
         {
#ifdef AUTO_DELETE
            if(!tbl)
               incref this;
#endif
            tbl = value;
#ifdef AUTO_DELETE
            tbl.listRows.Add(this);
#endif
         }
      }
      get { return tbl; }
   }

   property bool nil { get { return row ? row.Nil() : true; } }

   property const char * query
   {
      set
      {
         // So we can do row.query = row.query
         if(query != value) { delete query; query = CopyString(value); }
         if(row) row.Query(value);
      }
      get { return query; }
   }
   property uint rowsCount
   {
      get
      {
         if(query)
         {
            // NOTE: This does not work if the query relies on bound data...
            String from = SearchString(query, 0, "FROM", false, true);
            if(from)
            {
               uint len = strlen(query);
               String countQuery = new char[len+40];
               uint count;
               const String result;
               Row r { tbl = tbl };
               strcpy(countQuery, "SELECT COUNT(*) ");
               strcat(countQuery, from);
               r.query = countQuery;
               result = r.GetColumn(0);
               count = result ? strtol(result, null, 0) : 0;
               delete r;
               return count;
            }
         }
         else if(tbl)
            return tbl.rowsCount;
         return 0;
     }
   }

   public bool Query(const char * query)  // Add printf format support
   {
      if(row)
         return row.Query(query);
      return false;
   }
   bool Select(MoveOptions move) { return row ? row.Select(move) : false; }
   bool First() { return row ? row.Select(first) : false; }
   bool Last() { return row ? row.Select(last) : false; }
   bool Next() { return row ? row.Select(next) : false; }
   bool Previous() { return row ? row.Select(previous) : false; }

   bool Find(Field field, MoveOptions move, MatchOptions match, typed_object data) { return (row && field) ? row.Find(field, move, match, data) : false; }
   bool FindMultiple(FieldFindData * findData, MoveOptions move, int numFields) { return row ? row.FindMultiple(findData, move, numFields) : false; }

   bool Synch(Row to) { return row && to && row._class == to.row._class ? row.Synch(to.row) : false; }

   bool Add() { return row ? row.Add(0) : false; }
   bool AddID(uint64 id) { return row ? row.Add(id) : false; }
   bool GetData(Field field, typed_object & data) { return (row && field) ? row.GetData(field, data) : false; }
   bool SetData(Field field, typed_object data) { return (row && field) ? row.SetData(field, data) : false; }
   bool Delete() { return row ? row.Delete() : false; }
   bool SetQueryParam(int paramID, int value) { return row ? row.SetQueryParam(paramID, value) : false; }
   bool SetQueryParam64(int paramID, int64 value) { return row ? row.SetQueryParam64(paramID, value) : false; }
   bool SetQueryParamText(int paramID, const char * value) { return row ? row.SetQueryParamText(paramID, value) : false; }
   bool SetQueryParamObject(int paramID, void * value, Class type) { return row ? row.SetQueryParamObject(paramID, value, type) : false; }
   // TOCHECK: Field is passed here to have sqlite type handy. The API might be nicer without
   bool BindQueryData(int paramID, Field fld, typed_object value) { return row ? row.BindQueryData(paramID, fld, value) : false; }
   bool GetQueryData(int paramID, Field fld, typed_object & value) { return row ? row.GetQueryData(paramID, fld, value) : false; }
   const char * GetColumn(int paramID) { return row ? row.GetColumn(paramID) : null; }

   bool GUIDataRowSetData(DataRow dr, DataField df, Field fld)
   {
      int64 data = 0;
      Class type = fld.type;
      if(type.type == unitClass && !type.typeSize)
      {
         Class dataType = eSystem_FindClass(type.module, type.dataTypeString);
         if(dataType)
            type = dataType;
      }
      if(type.type == structClass)
         data = (int64)(intptr)new0 byte[type.structSize];
      ((bool (*)())(void *)GetData)(this, fld, type, (type.type == structClass) ? (void *)(intptr)data : &data);

      if((type.type == systemClass || type.type == unitClass || type.type == bitClass || type.type == enumClass))
         dr.SetData(df, (void *)&data);
      else
         dr.SetData(df, (void *)(intptr)data);
      if(type.type == structClass)
      {
         void * dataPtr = (void *)(intptr)data;
         delete dataPtr;
      }
      else if(!strcmp(type.dataTypeString, "char *"))
      {
         // Strings are handled as a special case in ListBox -- normalClass, but copied when freeData = true
         delete (char *)(intptr)data;
      }
      return true;
   }

   property uint64 sysID { get { return row ? row.GetSysID() : 0; } set { if(row) row.GoToSysID(value); } }

   bool GetDataFieldValue(Field field, FieldValue value) { return field && row ? row.GetDataFieldValue(field, value) : false; }
   const void * GetRowData() { return row ? row.GetRowData() : null; }
};

public class DriverRow
{
public:
   virtual bool Nil();
   virtual bool Select(MoveOptions move);
   virtual bool Find(Field fld, MoveOptions move, MatchOptions match, typed_object data);
   virtual bool FindMultiple(FieldFindData * findData, MoveOptions move, int numFields);
   virtual bool Synch(DriverRow to);
   virtual bool Add(uint64 id);
   virtual bool Delete();

   virtual bool GetData(Field fld, typed_object &data);
   virtual bool SetData(Field fld, typed_object data);
   virtual uint64 GetSysID();
   virtual bool GoToSysID(uint64 id);
   virtual bool Query(const char * queryString);
   virtual bool SetQueryParam(int paramID, int value);
   virtual bool SetQueryParam64(int paramID, int64 value);
   virtual bool SetQueryParamText(int paramID, const char * value);
   virtual bool SetQueryParamObject(int paramID, const void * data, Class type);
   virtual const char * GetColumn(int paramID);
   virtual bool BindQueryData(int paramID, Field fld, typed_object value);
   virtual bool GetQueryData(int paramID, Field fld, typed_object & value);
   virtual bool GetDataFieldValue(Field fld, FieldValue value);
   virtual const void * GetRowData();
};

public class SQLCustomFunction
{
public:
   Method method;
   Class returnType;
   Array<Class> args { };
   void /*ffi_type*/ * rType;
   // Array<void *> does not work right now :(
   Array</*ffi_type*/ String> argTypes { };
   void /*ffi_cif*/ * cif;

   ~SQLCustomFunction()
   {
      delete cif;
   }
}

public struct FieldFindData
{
   Field field;
   DataValue value;
};

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
#endif // 0
