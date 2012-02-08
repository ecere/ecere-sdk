#ifdef ECERE_STATIC
public import static "ecere"
public import static "EDA"
#else
public import "ecere"
public import "EDA"
#endif

#define uint _uint
#define property _property
#define get _get
#include <oci.h>
#undef get
#undef property
#undef uint

define Oracle = "Oracle";

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

public class OracleStaticLink { }   // Until .imp generation is fixed

void ToUpperAndUnderscore(String stringValue)
{
   int i;

   for (i = 0; stringValue[i]; i++)
   {
      stringValue[i] = toupper(stringValue[i]);  
      if (stringValue[i] == 32)
         stringValue[i] = '_';
   }
}

int OracleExecuteNonQuery(OCIEnv* env, OCISvcCtx* svc, String command)
{
   OCIStmt* stmt; 
   OCIError* err;
   text errbuf[512];
   ub4 buflen;
   ub4 errcode;
   int r;
   
   OCIHandleAlloc(env, (dvoid**)&err, OCI_HTYPE_ERROR,   0, 0);
   OCIHandleAlloc(env, (dvoid**)&stmt, OCI_HTYPE_STMT, 0, 0);

   r = OCIStmtPrepare(stmt, err, (OraText *)command,
      (ub4)strlen((char *)command),
      (ub4) OCI_NTV_SYNTAX, (ub4) OCI_DEFAULT);

   r = OCIStmtExecute(svc, stmt, err, 1, 0,
      (OCISnapshot *) 0, (OCISnapshot *) 0, OCI_COMMIT_ON_SUCCESS);
   
   OCIStmtRelease(stmt, err, (OraText *)NULL, 0, OCI_DEFAULT);

   if (err) OCIHandleFree(err, OCI_HTYPE_ERROR);
   if (stmt) OCIHandleFree(stmt, OCI_HTYPE_STMT);

   return r;
}

class OracleDataSource : DataSourceDriver
{
   class_property(name) = "Oracle";
   uint databasesCount;
   OCIEnv* env;
   OCIError* err;
   OCIServer* srv;
   OCISvcCtx* svc;
   OCISession* ses;

   String BuildLocator(DataSource ds)
   {
      return null;
   }

   uint GetDatabasesCount()
   {
      return databasesCount;
   }

   ~OracleDataSource()
   {
      if (ses) OCIHandleFree(ses, OCI_HTYPE_SESSION);
      if (svc) OCIHandleFree(svc, OCI_HTYPE_SVCCTX);
      if (srv) OCIHandleFree(srv, OCI_HTYPE_SERVER);
      if (err) OCIHandleFree(err, OCI_HTYPE_ERROR);
      if (env) OCIHandleFree(env, OCI_HTYPE_ENV);

      //OCITerminate(OCI_DEFAULT);
   }

   bool Connect(const String locator)
   {
      return true;
   }

   bool RenameDatabase(const String name, const String rename)
   {
      return false;
   }

   bool DeleteDatabase(const String name)
   {
      return false;
   }

   virtual String MakeDatabasePath(const String name)
   {
      return null;
   }

   Database OpenDatabase(const String name, CreateOptions createOptions, DataSource ds)
   {
      int r;
      OracleDatabase result = null;

      char s[MAX_F_STRING];
      char t[MAX_LOCATION];
      
      s[0] = '\0';
      strcat(s, "(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(");
      if(ds.host)
         sprintf(t, "Host=%s", ds.host), strcat(s, t);
      strcat(s, ")(");
      if(ds.port)
         sprintf(t, "Port=%s", ds.port), strcat(s, t);
      strcat(s, "))(CONNECT_DATA=(");
      if(name)
         sprintf(t, "SID=%s", name), strcat(s, t);
      strcat(s, ")))");
      
      if (ses) OCIHandleFree(ses, OCI_HTYPE_SESSION);
      if (svc) OCIHandleFree(svc, OCI_HTYPE_SVCCTX);
      if (srv) OCIHandleFree(srv, OCI_HTYPE_SERVER);
      if (err) OCIHandleFree(err, OCI_HTYPE_ERROR);
      if (env) OCIHandleFree(env, OCI_HTYPE_ENV);

      r = OCIEnvCreate(&env, OCI_DEFAULT, 0, 0, 0, 0, 0, 0);                  

      OCIHandleAlloc(env, (dvoid**)&err, OCI_HTYPE_ERROR,   0, 0);
      OCIHandleAlloc(env, (dvoid**)&srv, OCI_HTYPE_SERVER,  0, 0);
      OCIHandleAlloc(env, (dvoid**)&svc, OCI_HTYPE_SVCCTX,  0, 0);
      OCIHandleAlloc(env, (dvoid**)&ses, OCI_HTYPE_SESSION, 0, 0);

      r = OCIServerAttach(srv, err, name, strlen(name), (ub4) OCI_DEFAULT);

      OCIAttrSet(svc, OCI_HTYPE_SVCCTX, srv, 0, OCI_ATTR_SERVER,  err);

      OCIAttrSet(ses, OCI_HTYPE_SESSION, ds.user, strlen(ds.user), OCI_ATTR_USERNAME, err); 
      OCIAttrSet(ses, OCI_HTYPE_SESSION, ds.pass, strlen(ds.pass), OCI_ATTR_PASSWORD, err);

      r = OCISessionBegin(svc, err, ses, OCI_CRED_RDBMS, OCI_DEFAULT);

      r = OCIAttrSet((dvoid *) svc, (ub4) OCI_HTYPE_SVCCTX, (dvoid *)ses, (ub4) 0, (ub4) OCI_ATTR_SESSION, err);

      result = OracleDatabase {env = env; err = err; srv = srv; svc = svc; ses = ses};

      return result;
   }
}

class OracleField : Field
{
   char* name;
   Class type;
   int length;
   public LinkElement<OracleField> link;
   int num;
   int oracleType;

   OCIDefine* def;
   OCIDefine* p_dfn;
   char p_sli[1024];
   int p_sliInt;
   double p_sliFloat;
   OCIDateTime *p_sliDateTime;

   sb2 ind;
   ub2 len;

   ~OracleField()
   {
      OCIDescriptorFree(p_sliDateTime, OCI_DTYPE_TIMESTAMP_LTZ);
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

class OracleDatabase : Database
{
   AVLTree<String> collations { };
   OCIEnv* env;
   OCIError* err;
   OCIServer* srv;
   OCISvcCtx* svc;
   OCISession* ses;
   
   ~OracleDatabase()
   {
      //
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
      OracleTable table = null;
      int r;

      text errbuf[512];
      ub4 buflen;
      ub4 errcode;

      OCIDefine* p_dfn1;
      OCIDefine* p_dfn2;
      OCIDefine* p_dfn3;
      char p_sli1[1024];
      char p_sli2[1024];
      int p_sli3; 

      int oracleType;

      if(options.type == tablesList)
      {
         OracleField field { name = CopyString("Name"), type = class(String), num = -1, oracleType = SQLT_STR };
         strcpy(command, "SELECT DISTINCT(Table_Name) AS Name FROM EDA_TABLE_FIELDS");
         table = OracleTable { db = this, specialStatement = CopyString(command) };
         LinkTable(table);
         incref field;
         table.fields.Add(field);
      }
      else if(options.type == fieldsList)
      {
         OracleField field;

         sprintf(command, "SELECT Name, Type, Length FROM EDA_TABLE_FIELDS WHERE UPPER(Table_Name)=UPPER('%s')", name);
         table = OracleTable { db = this, specialStatement = CopyString(command) };
         LinkTable(table);
         field = { name = CopyString("Name"), type = class(String), num = -1, oracleType = SQLT_STR };
         incref field;
         table.fields.Add(field);
         field = { name = CopyString("Type"), type = class(Class), num = 0, oracleType = SQLT_STR };
         incref field;
         table.fields.Add(field);
         field = { name = CopyString("Lenght"), type = class(int), num = 1, oracleType = SQLT_INT };
         incref field;
         table.fields.Add(field);
      }
      else if(options.type == tableRows)
      {
         OracleField field;
         int num;

         OCIStmt* stmtRows; 

         OCIHandleAlloc(env, (dvoid**)&stmtRows, OCI_HTYPE_STMT, 0, 0);

         /* Check fields in internal table */
         sprintf(command, "SELECT Name, Type, Length FROM EDA_TABLE_FIELDS WHERE UPPER(Table_Name)=UPPER('%s')", name);
         r = OCIStmtPrepare(stmtRows, err, (OraText *)command,
            (ub4)strlen((char *)command),
            (ub4) OCI_NTV_SYNTAX, (ub4) OCI_DEFAULT);

         table = OracleTable { db = this, name = CopyString(name) };
         LinkTable(table);

         /* Field definitions */
         r = OCIDefineByPos(stmtRows, &p_dfn1, err, 1, (dvoid *) &p_sli1,
            (sword) 30, SQLT_STR, (dvoid *) 0, (ub2 *)0,
            (ub2 *)0, OCI_DEFAULT);

         r = OCIDefineByPos(stmtRows, &p_dfn2, err, 2, (dvoid *) &p_sli2,
            (sword) 30, SQLT_STR, (dvoid *) 0, (ub2 *)0,
            (ub2 *)0, OCI_DEFAULT);

         r = OCIDefineByPos(stmtRows, &p_dfn3, err, 3, (dvoid *) &p_sli3,
            sizeof(int), SQLT_INT, (dvoid *) 0, (ub2 *)0,
            (ub2 *)0, OCI_DEFAULT);
         /* End of field definitions */

         r = OCIStmtExecute(svc, stmtRows, err, 0, 0,
            (OCISnapshot *) 0, (OCISnapshot *) 0, OCI_STMT_SCROLLABLE_READONLY);

         while ((OCIStmtFetch2(stmtRows, err, 1, OCI_FETCH_NEXT, 0, OCI_DEFAULT)) != OCI_NO_DATA)
         {
            Class type = null;
            oracleType = SQLT_BLOB;

            ((Class)(&type)).OnGetDataFromString(p_sli2);    // TODO: THIS REQUIRES A FIX SOMEWHERE ELSE

            if (type)
            {
               if(!strcmp(type.dataTypeString, "int") || !strcmp(type.dataTypeString, "unsigned int") || 
                  !strcmp(type.dataTypeString, "long") || !strcmp(type.dataTypeString, "long int") || 
                  !strcmp(type.dataTypeString, "uint") || !strcmp(type.dataTypeString, "uint32") || 
                  !strcmp(type.dataTypeString, "int64") || !strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64") || 
                  !strcmp(type.dataTypeString, "short") || !strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") ||
                  !strcmp(type.dataTypeString, "char") || !strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte"))
                  oracleType = SQLT_INT;
               else if(!strcmp(type.dataTypeString, "double") || !strcmp(type.dataTypeString, "float"))
                  oracleType = SQLT_FLT;
               else if(!strcmp(type.dataTypeString, "String") || !strcmp(type.dataTypeString, "char *"))
                  oracleType = SQLT_STR;
               else
               {
                  /* No basic datatype */
                  if(strcmp(type.fullName, "CIString") && !collations.Find(type.fullName))
                  {
                     collations.Add(type.fullName);
                  }
                  oracleType = SQLT_BLOB;
               }
            }
            else
            {
               type = class(String);
               oracleType = SQLT_STR;
            }

            if (!strcmp(type.name, "Date"))
            {
               oracleType = SQLT_TIMESTAMP_TZ;
            }
            
            field = { name = CopyString(p_sli1), type = type, length = p_sli3, num = table.fields.count, oracleType = oracleType };
            incref field;
            table.fields.Add(field);
         }

         OCIStmtRelease(stmtRows, err, (OraText *)NULL, 0, OCI_DEFAULT);

         if (stmtRows) OCIHandleFree(stmtRows, OCI_HTYPE_STMT);   
      }

      return (Table)table;
   }

   bool Begin()
   {
      return false;
   }

   bool Commit()
   {
      return false;
   }

   bool CreateCustomFunction(char * name, SQLCustomFunction customFunction)
   {
      printf("CreateCustomFunction\n");
      return false;
   }
}

class OracleTable : Table
{
   char * name;
   bool mustCreate;
   OracleDatabase db;
   LinkList<OracleField> fields { };
   char * specialStatement;
   OracleField primaryKey;
   FieldIndex * indexFields;
   int indexFieldsCount;
   int64 lastID;

   text errbuf[512];
   ub4 buflen;
   ub4 errcode;

   OCIStmt* stmt;
   OCIDefine* def;
   OCIDefine* p_dfn;
   char p_sli[1024];  

   Field AddField(const String fieldName, Class type, int length)
   {
      OracleField field;
      char command[1024];
      char dataType[256];
      int result;
      Table refTable = null;
      Field idField = null;
      int oracleType;

      command[0] = 0;

      if(FindField(fieldName)) return null;
      
      oracleType = SQLT_BLOB;

      ((Class)(&type)).OnGetDataFromString(type);    // TODO: THIS REQUIRES A FIX SOMEWHERE ELSE

      if (type)
      {
         if(!strcmp(type.dataTypeString, "int") || !strcmp(type.dataTypeString, "unsigned int") || 
            !strcmp(type.dataTypeString, "long") || !strcmp(type.dataTypeString, "long int") || 
            !strcmp(type.dataTypeString, "uint") || !strcmp(type.dataTypeString, "uint32") || 
            !strcmp(type.dataTypeString, "int64") || !strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64") || 
            !strcmp(type.dataTypeString, "short") || !strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") ||
            !strcmp(type.dataTypeString, "char") || !strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte"))
            oracleType = SQLT_INT;
         else if(!strcmp(type.dataTypeString, "double") || !strcmp(type.dataTypeString, "float"))
            oracleType = SQLT_FLT;
         else if(!strcmp(type.dataTypeString, "String") || !strcmp(type.dataTypeString, "char *"))
            oracleType = SQLT_STR;
         else
         {
            /* No basic datatype */
            if(strcmp(type.fullName, "CIString") && !db.collations.Find(type.fullName))
            {
               db.collations.Add(type.fullName);
            }
            oracleType = SQLT_BLOB;
         }
      }
      else
      {
         type = class(String);
         oracleType = SQLT_STR;
      }

      if (!strcmp(type.name, "Date"))
      {
         oracleType = SQLT_TIMESTAMP_TZ;
      }

      field = { name = CopyString(fieldName), type = type, num = fields.count, oracleType = SQLT_STR };

      incref field;
      fields.Add(field);
      return (Field)field;
   }

   Field FindField(const String name)
   {
      String upperName = CopyString(name);     
      ToUpperAndUnderscore(upperName);

      for(f : fields)
      {
         String upperFieldName = CopyString(f.name);
         ToUpperAndUnderscore(upperFieldName);

         if (!strcmp(upperFieldName, upperName))
         {
            if(!primaryKey)
            {
               if(eClass_IsDerived(f.type, class(eda::Id)))
               {

                  Table * tablePtr = (Table *)eClass_GetProperty(f.type, "table");
                  if(tablePtr && *tablePtr == this)
                     primaryKey = f;
               }
            }

            delete upperFieldName;            
            return (Field)f;  
         }

         delete upperFieldName;
      }

      delete upperName;
      return null;
   }

   bool GenerateIndex(int count, FieldIndex * fieldIndexes, bool init)
   {
      return false;
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
      
      OCIStmt* stmtCount; 
      OCIError* err;
      text errbuf[512];
      ub4 buflen;
      ub4 errcode;
      int r;

      sprintf(command, "SELECT COUNT(*) FROM %s", name);

      OCIHandleAlloc(db.env, (dvoid**)&err, OCI_HTYPE_ERROR,   0, 0);
      OCIHandleAlloc(db.env, (dvoid**)&stmtCount, OCI_HTYPE_STMT, 0, 0);

      r = OCIStmtPrepare(stmtCount, err, (OraText *)command,
         (ub4)strlen((char *)command),
         (ub4) OCI_NTV_SYNTAX, (ub4) OCI_DEFAULT);

      r = OCIDefineByPos(stmtCount, &p_dfn, err, 1, (dvoid *) &rowCount,
         (sword) sizeof(uint), SQLT_INT, (dvoid *) 0, (ub2 *)0,
         (ub2 *)0, OCI_DEFAULT);

      r = OCIStmtExecute(db.svc, stmtCount, err, 1, 0,
         (OCISnapshot *) 0, (OCISnapshot *) 0, OCI_COMMIT_ON_SUCCESS);

      OCIStmtRelease(stmtCount, err, (OraText *)NULL, 0, OCI_DEFAULT);

      if (err) OCIHandleFree(err, OCI_HTYPE_ERROR);
      if (stmtCount) OCIHandleFree(stmtCount, OCI_HTYPE_STMT);

      return rowCount;
   }

   // Returns true if not ordered by row ID
   bool GetIndexOrder(char * fullOrder)
   {
      if(!indexFields || (indexFieldsCount == 1 && indexFields[0].field == primaryKey && indexFields[0].order == ascending))
      {
         OracleField field = GetFirstField();
         strcpy(fullOrder, " ORDER BY ");
         strcat(fullOrder, field.name);
         strcat(fullOrder, "\0");
         return false;
      }
      else
      {
         int c;
         strcpy(fullOrder, " ORDER BY ");
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
            strcat(fullOrder, order);
         }
         return true;
      }

      return false;
   }

   DriverRow CreateRow()
   {
      char command[1024];
      int r;
      int i;
      String fieldList[1024];

      if(specialStatement)
         strcpy(command, specialStatement);
      else
      {
         char order[1024];

         GetIndexOrder(order);
         sprintf(command, "SELECT * FROM %s %s", name, order);
      }

      if (stmt) OCIHandleFree(stmt, OCI_HTYPE_STMT);
      OCIHandleAlloc(db.env, (dvoid**)&stmt, OCI_HTYPE_STMT, 0, 0); 

      for (i = 0; i < fields.count; i++)
      {
         OracleField field = fields[i];
         r= OCIDescriptorAlloc(db.env,(dvoid **)&field.p_sliDateTime, OCI_DTYPE_TIMESTAMP,
            0, (dvoid **)0);
      }

      r = OCIStmtPrepare(stmt, db.err, (OraText *)command,
         (ub4)strlen((char *)command),
         (ub4) OCI_NTV_SYNTAX, (ub4) OCI_DEFAULT);
      
      for (i = 0; i < fields.count; i++)
      {
         OracleField field = fields[i];
         switch(field.oracleType)
         {
            case SQLT_INT:
            {
               r = OCIDefineByPos(stmt, &field.p_dfn, db.err, i + 1, (dvoid *) &field.p_sliInt,
                  sizeof(int), SQLT_INT, (dvoid *) &field.ind, (ub2 *) &field.len,
                  (ub2 *)0, OCI_DEFAULT);
               break;
            }
            case SQLT_FLT:
            {
               r = OCIDefineByPos(stmt, &field.p_dfn, db.err, i + 1, (dvoid *) &field.p_sliFloat,
                  sizeof(double), SQLT_FLT, (dvoid *) &field.ind, (ub2 *) &field.len,
                  (ub2 *)0, OCI_DEFAULT);
               break;
            }
            case SQLT_TIMESTAMP_TZ:
            {
               r = OCIDefineByPos(stmt, &field.p_dfn, db.err, i + 1, (dvoid *) &field.p_sliDateTime,
                  sizeof(field.p_sliDateTime), SQLT_TIMESTAMP_TZ, (dvoid *) &field.ind, (ub2 *) &field.len,
                  (ub2 *)0, OCI_DEFAULT);
               break;
            }
            case SQLT_STR:
            case SQLT_BLOB: // No basic datatype
            {
               r = OCIDefineByPos(stmt, &field.p_dfn, db.err, i + 1, (dvoid *) &field.p_sli,
                  (sword) 1024, SQLT_STR, (dvoid *) &field.ind, (ub2 *) &field.len,
                  (ub2 *)0, OCI_DEFAULT);
               break;
            }
         }
      }

      r = OCIStmtExecute(db.svc, stmt, db.err, 0, 0,
         (OCISnapshot *) 0, (OCISnapshot *) 0, OCI_STMT_SCROLLABLE_READONLY);

      return OracleRow { tbl = this, rowID = 0 };
   }

   ~OracleTable()
   {
      if (stmt) OCIHandleFree(stmt, OCI_HTYPE_STMT); 

      delete name;
      delete specialStatement;
      delete indexFields;
      fields.Free();
   }
}

class OracleRow : DriverRow
{
   OracleTable tbl;

   bool done;
   done = true;
   int64 rowID;
   int numVal;
   
   bool Nil()
   {
      return done;
   }

   ~OracleRow()
   {
   }

   bool Select(MoveOptions move)
   {
      int r;

      text errbuf[512];
      ub4 errcode;  
      int i;

      switch(move)
      {
         case first:
         {
            r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_FIRST, 0, OCI_DEFAULT);
            if (r == OCI_NO_DATA)
            {
               return false;
            }
            rowID = 1;
            return true;
            break;
         }
         case last:
         {
            break;
         }
         case middle:
         {
            break;
         }
         case next:
         {
            r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_NEXT, 0, OCI_DEFAULT);
            if (r == OCI_NO_DATA)
            {
               return false;
            }
            rowID += 1;
            return true;
            break;
         }
         case previous:
         {           
            break;
         }
         case nil:
         {
            break;
         }
         case here:
         {
            break;
         }
      }

      return false;
   }

   bool Query(char * queryString)
   {
      return false;
   }

   void AddCursorWhereClauses(char * command, MoveOptions move, bool useIndex)
   {
      printf("%s\n", "AddCursorWhereClauses...");
   }

   bool Find(Field fld, MoveOptions move, MatchOptions match, typed_object data)
   {
      if(fld == tbl.primaryKey)
      {
         int id;
         id = *(int *)data;
         return GoToSysID(id);

         //return done;
      }
      else
      {
         OracleField oracleField = (OracleField)fld;
         Class dataType = oracleField.type;
         int r;  

         switch (oracleField.oracleType)
         {

            case SQLT_INT:
            {
               switch(dataType.typeSize)
               {
                  case 8:
                  {
                     int64 dataValue = *(int64 *)data;

                     rowID = 1;
                     r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_FIRST, 0, OCI_DEFAULT);
                     
                     if (oracleField.p_sliInt == dataValue)
                     {
                        return true;
                     }
                     while (r != OCI_NO_DATA)
                     {
                        r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_NEXT, 0, OCI_DEFAULT);
                        rowID += 1;
                        if (oracleField.p_sliInt == dataValue)
                        {
                           return true;
                        }
                     }
                     break;
                  }
                  case 4:
                  {
                     int dataValue = *(int *)data;

                     rowID = 1;
                     r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_FIRST, 0, OCI_DEFAULT);
                     
                     if (oracleField.p_sliInt == dataValue)
                     {
                        return true;
                     }
                     while (r != OCI_NO_DATA)
                     {
                        r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_NEXT, 0, OCI_DEFAULT);
                        rowID += 1;
                        if (oracleField.p_sliInt == dataValue)
                        {
                           return true;
                        }
                     }
                     break;
                  }
                  case 2:
                  {
                     uint16 dataValue = *(uint16 *)data;

                     rowID = 1;
                     r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_FIRST, 0, OCI_DEFAULT);
                     
                     if (oracleField.p_sliInt == dataValue)
                     {
                        return true;
                     }
                     while (r != OCI_NO_DATA)
                     {
                        r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_NEXT, 0, OCI_DEFAULT);
                        rowID += 1;
                        if (oracleField.p_sliInt == dataValue)
                        {
                           return true;
                        }
                     }
                     break;
                  }
                  case 1:
                  {
                     if(dataType.typeSize == 8)
                     {
                        double dataValue = *(double *)data;

                        rowID = 1;
                        r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_FIRST, 0, OCI_DEFAULT);
                        
                        if (oracleField.p_sliInt == dataValue)
                        {
                           return true;
                        }
                        while (r != OCI_NO_DATA)
                        {
                           r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_NEXT, 0, OCI_DEFAULT);
                           rowID += 1;
                           if (oracleField.p_sliInt == dataValue)
                           {
                              return true;
                           }
                        }
                     }
                     else
                     {
                        float dataValue = *(float *)data;

                        rowID = 1;
                        r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_FIRST, 0, OCI_DEFAULT);
                        
                        if (oracleField.p_sliInt == dataValue)
                        {
                           return true;
                        }
                        while (r != OCI_NO_DATA)
                        {
                           r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_NEXT, 0, OCI_DEFAULT);
                           rowID += 1;
                           if (oracleField.p_sliInt == dataValue)
                           {
                              return true;
                           }
                        }
                     }                     
                     break;
                  }
               }
               break;
            }
            case SQLT_FLT:
            {
               byte dataValue = *(byte *)data;

               rowID = 1;
               r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_FIRST, 0, OCI_DEFAULT);
               
               if (oracleField.p_sliInt == dataValue)
               {
                  return true;
               }
               while (r != OCI_NO_DATA)
               {
                  r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_NEXT, 0, OCI_DEFAULT);
                  rowID += 1;
                  if (oracleField.p_sliInt == dataValue)
                  {
                     return true;
                  }
               }
               break;
            }
            case SQLT_STR:
            {
               char *dataValue = *(char **)data;

               rowID = 1;
               r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_FIRST, 0, OCI_DEFAULT);
               
               if (!strcmp(oracleField.p_sli, dataValue))
               {
                  return true;
               }
               while (r != OCI_NO_DATA)
               {
                  r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_NEXT, 0, OCI_DEFAULT);
                  rowID += 1;
                  if (!strcmp(oracleField.p_sli, dataValue))
                  {
                     return true;
                  }
               }
               break;
            }
            case SQLT_TIMESTAMP_TZ:
            {
               sb2 year;
               ub1 month;
               ub1 day;
               Date date = *(Date *)data;

               rowID = 1;
               r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_FIRST, 0, OCI_DEFAULT);
               
               OCIDateTimeGetDate(tbl.db.env, tbl.db.err, oracleField.p_sliDateTime,
                  &year, &month, &day);  

               if ((year == date.year) && (month == date.month) && (day == date.day))
               {
                  return true;
               }
               while (r != OCI_NO_DATA)
               {
                  r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_NEXT, 0, OCI_DEFAULT);
                  OCIDateTimeGetDate(tbl.db.env, tbl.db.err, oracleField.p_sliDateTime,
                     &year, &month, &day);
                  rowID += 1;
                  if ((year == date.year) && (month == date.month) && (day == date.day))
                  {
                     return true;
                  }
               }
               break;
            }
            case SQLT_BLOB: // No basic datatype
            {
               //TODO
               break;
            }
         }
      }
      
      return false;
   }

   bool FindMultiple(FieldFindData * findData, MoveOptions move, int numFields)
   {
      printf("%s\n", "FindMultiple...");
      return false;
   }

   bool Synch(DriverRow to)
   {
      printf("%s\n", "Synch...");
      return false;
   }

   bool Add(uint64 id)
   {
      /* We use primaryKey to new row. We increment primaryKey.
         If we must do it without it, it has to be changed */

      char command[1024];
      String primaryKeyName;
      String tableName;
      int r;
      int newID;

      if (tbl.primaryKey)
      {
         primaryKeyName = CopyString(tbl.primaryKey.name);
      }
      else
      {
         primaryKeyName = CopyString(tbl.GetFirstField().name);
      }

      tableName = CopyString(tbl.name);

      ToUpperAndUnderscore(primaryKeyName);
      ToUpperAndUnderscore(tableName);

      if (id)
      {
         /* New row with id as new value for primaryKey field */
         sprintf(command, "INSERT INTO %s (%s) VALUES (%i)", tableName, primaryKeyName, id);
      }
      else
      {
         /* New row with id as max(id)+i*/
         sprintf(command, "INSERT INTO %s (%s) SELECT MAX(CAST(%s AS INTEGER)) + 1 FROM %s",
            tableName, primaryKeyName, primaryKeyName, tbl.name); 
      }

      OracleExecuteNonQuery(tbl.db.env, tbl.db.svc, command);
      
      OCIStmtRelease(tbl.stmt, tbl.db.err, (OraText *)NULL, 0, OCI_DEFAULT);

      r = OCIStmtExecute(tbl.db.svc, tbl.stmt, tbl.db.err, 0, 0,
         (OCISnapshot *) 0, (OCISnapshot *) 0, OCI_STMT_SCROLLABLE_READONLY); 
      r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_LAST, 0, OCI_DEFAULT);
      
      delete primaryKeyName;
      delete tableName;

      return true;
   }

   bool Delete()
   {
      String primaryKeyName;
      String tableName;
      OracleField primaryKeyField;
      String primaryKeyValue;
      String primaryKeyValueString[1024];
      int primaryKeyValueInt;
      bool deletePrimaryKeyValue = false;
      char command[1024];
      int r;
      int actualRowID;
      int numRows;

      if (tbl.primaryKey)
      {
         primaryKeyName = CopyString(tbl.primaryKey.name);
      }
      else
      {
         primaryKeyName = CopyString(tbl.GetFirstField().name);
      }
      
      primaryKeyField = tbl.FindField(primaryKeyName);

      tableName = CopyString(tbl.name);

      ToUpperAndUnderscore(primaryKeyName);
      ToUpperAndUnderscore(tableName);

      if (primaryKeyField.oracleType == SQLT_STR)
      {
         GetData(primaryKeyField, primaryKeyValue);
         deletePrimaryKeyValue = true;
      }
      else
      {
         GetData(primaryKeyField, primaryKeyValueInt);
         sprintf(primaryKeyValueString, "%i", primaryKeyValueInt);
         primaryKeyValue = primaryKeyValueString;
      }

      actualRowID = rowID;
      sprintf(command, "DELETE %s WHERE %s = %s", tableName, primaryKeyName, primaryKeyValue);
      r = OracleExecuteNonQuery(tbl.db.env, tbl.db.svc, command);

      numRows = tbl.GetRowsCount();
      if (actualRowID > numRows)
         actualRowID = numRows;

      if (deletePrimaryKeyValue)
         delete primaryKeyValue;

      delete primaryKeyName;
      delete tableName;

      if ((r == OCI_SUCCESS) || (r == OCI_SUCCESS_WITH_INFO))
         return true;

      return false;
   }

   bool GetData(Field fld, typed_object &data)
   {
      OracleField sqlFld = (OracleField)fld;
      Class dataType = sqlFld.type;

      switch(sqlFld.oracleType)
      {
         case SQLT_INT:
         {
            switch(dataType.typeSize)
            {
               case 8:
               {
                  *(int64 *)data = sqlFld.p_sliInt;
                  break;
               }
               case 4:
               {
                  *(int *)data = sqlFld.p_sliInt;
                  break;
               }
               case 2:
               {
                  *(uint16 *)data = (uint16)sqlFld.p_sliInt;
                  break;
               }
               case 1:
               {
                  if(dataType.typeSize == 8)
                     *(double *)data = sqlFld.p_sliFloat;
                  else
                     *(float *)data = (float)sqlFld.p_sliFloat;
                  break;
               }
            }
            break;
         }
         case SQLT_FLT:
         {
            *(byte *)data = (byte)sqlFld.p_sliInt;
            break;
         }
         case SQLT_STR:
         {
            int numBytes = strlen(sqlFld.p_sli);
            *(char **)data = sqlFld.p_sli ? new byte[numBytes+1] : null;
            if(sqlFld.p_sli)
               memcpy(*(char **)data, sqlFld.p_sli, numBytes+1);
            break;
         }
         case SQLT_TIMESTAMP_TZ:
         {
            sb2 year;
            ub1 month;
            ub1 day;

            OCIDateTimeGetDate(tbl.db.env, tbl.db.err, sqlFld.p_sliDateTime,
               &year, &month, &day);
            if (!sqlFld.ind)
               *(Date *)data = Date { year = year, month = month - 1, day = day };
            break;
         }
         case SQLT_BLOB: // No basic datatype
         {
            SerialBuffer buffer { };
            buffer._size = sqlFld.len;
            buffer._buffer = sqlFld.p_sli;
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
      OracleField sqlFld = (OracleField)fld;
      Class dataType = sqlFld.type;
      char command[1024];
      String primaryKeyName;
      String primaryKeyValue;
      String primaryKeyValueString[1024];
      int primaryKeyValueInt;
      OracleField primaryKeyField;
      bool deletePrimaryKeyValue = false;
      String tableName = CopyString(tbl.name);
      String fieldName = CopyString(sqlFld.name);
      int r;
      int actualRowID;

      if (tbl.primaryKey)
      {
         primaryKeyName = CopyString(tbl.primaryKey.name);
      }
      else
      {
         primaryKeyName = CopyString(tbl.GetFirstField().name);
      }
      
      primaryKeyField = tbl.FindField(primaryKeyName);
      if (primaryKeyField.oracleType == SQLT_STR)
      {
         GetData(primaryKeyField, primaryKeyValue);
         deletePrimaryKeyValue = true;
      }
      else
      {
         GetData(primaryKeyField, primaryKeyValueInt);
         sprintf(primaryKeyValueString, "%i", primaryKeyValueInt);
         primaryKeyValue = primaryKeyValueString;
      }

      ToUpperAndUnderscore(primaryKeyName);
      ToUpperAndUnderscore(tableName);
      ToUpperAndUnderscore(fieldName);

      switch(sqlFld.oracleType)
      {
         case SQLT_INT:
            switch(dataType.typeSize)
            {
               case 8:
               {
                  sprintf(command, "UPDATE %s SET %s = '%i' WHERE %s = %s", tableName, fieldName, (int64)data, primaryKeyName, primaryKeyValue);
                  r = OracleExecuteNonQuery(tbl.db.env, tbl.db.svc, command);
                  break;
               }
               case 4:
               {
                  sprintf(command, "UPDATE %s SET %s = '%i' WHERE %s = %s", tableName, fieldName, (int)data, primaryKeyName, primaryKeyValue);
                  r = OracleExecuteNonQuery(tbl.db.env, tbl.db.svc, command);
                  break;
               }
               case 2:
               {
                  sprintf(command, "UPDATE %s SET %s = '%i' WHERE %s = %s", tableName, fieldName, (uint16)data, primaryKeyName, primaryKeyValue);
                  r = OracleExecuteNonQuery(tbl.db.env, tbl.db.svc, command);
                  break;
               }
               case 1:
               {
                  if(dataType.typeSize == 8)
                     sprintf(command, "UPDATE %s SET %s = '%d' WHERE %s = %s", tableName, fieldName, (double)data, primaryKeyName, primaryKeyValue);
                  else
                     sprintf(command, "UPDATE %s SET %s = '%d' WHERE %s = %s", tableName, fieldName, (float)data, primaryKeyName, primaryKeyValue);
                  r = OracleExecuteNonQuery(tbl.db.env, tbl.db.svc, command);
                  break;
               }
            }
            break;
         case SQLT_FLT:            
            sprintf(command, "UPDATE %s SET %s = '%i' WHERE %s = %s", tableName, fieldName, (uint16)data, primaryKeyName, primaryKeyValue);
            r = OracleExecuteNonQuery(tbl.db.env, tbl.db.svc, command);
            break;
         case SQLT_STR:
         {
            sprintf(command, "UPDATE %s SET %s = '%s' WHERE %s = %s", tableName, fieldName, (char *)data, primaryKeyName, primaryKeyValue);
            r = OracleExecuteNonQuery(tbl.db.env, tbl.db.svc, command);
            break;
         }
         case SQLT_TIMESTAMP_TZ:
         {
            sb2 year;
            ub1 month;
            ub1 day;
            char date[11];

            Date* ecDate = data;
            year = ecDate->year;
            month = ecDate->month;
            day = ecDate->day;

            sprintf(date, "%04i-%02i-%02i", year, month, day);

            if (strcmp(date, "0000-00-00"))
               sprintf(command, "UPDATE %s SET %s = TO_DATE('%s', 'YYYY-MM-DD') WHERE %s = %s", tableName, fieldName, date, primaryKeyName, primaryKeyValue);
            else
               sprintf(command, "UPDATE %s SET %s = NULL WHERE %s = %s", tableName, fieldName, primaryKeyName, primaryKeyValue);

            r = OracleExecuteNonQuery(tbl.db.env, tbl.db.svc, command);
            break;
         }
         case SQLT_BLOB: // No basic datatype
         {           
            break;
         }
      }

      if (deletePrimaryKeyValue)
         delete primaryKeyValue;

      delete primaryKeyName;
      delete tableName;
      delete fieldName;

      actualRowID = rowID;
      OracleExecuteNonQuery(tbl.db.env, tbl.db.svc, command);
      
      OCIStmtRelease(tbl.stmt, tbl.db.err, (OraText *)NULL, 0, OCI_DEFAULT);

      r = OCIStmtExecute(tbl.db.svc, tbl.stmt, tbl.db.err, 0, 0,
         (OCISnapshot *) 0, (OCISnapshot *) 0, OCI_STMT_SCROLLABLE_READONLY); 
      r = OCIStmtFetch2(tbl.stmt, tbl.db.err, actualRowID, OCI_FETCH_ABSOLUTE, 0, OCI_DEFAULT);
      
      if ((r == OCI_SUCCESS) || (r == OCI_SUCCESS_WITH_INFO))
         return true;
      
      return false;
   }

   int GetSysID()
   {
      return (int)(uint)rowID;
   }

   bool GoToSysID(uint id)
   {
      /* We need to find in primaryKey field the row matching primaryKey field value and id */    
      char idValue[64];
      int r;
      int i;

      rowID = 1;
      r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_FIRST, 0, OCI_DEFAULT);
      if (tbl.primaryKey.p_sliInt == id)
      {
         return true;
      }
      while (r != OCI_NO_DATA)
      {
         r = OCIStmtFetch2(tbl.stmt, tbl.db.err, 1, OCI_FETCH_NEXT, 0, OCI_DEFAULT);
         rowID += 1;
         if (tbl.primaryKey.p_sliInt == id)
         {
            return true;
         }
      }

      return false;
   }

   bool SetQueryParam(int paramID, int value)
   {
      printf("%s\n", "SetQueryParam...");
      return false;
   }

   bool SetQueryParam64(int paramID, int64 value)
   {
      printf("%s\n", "SetQueryParam634...");
      return false;
   }

   bool SetQueryParamText(int paramID, char * data)
   {
      printf("%s\n", "SetQueryParamText...");
      return false;
   }

   bool SetQueryParamObject(int paramID, void * data, Class type)
   {
      printf("%s\n", "SetQueryParamObject...");
      return false;
   }

   char * GetColumn(int paramID)
   {
      printf("%s\n", "GetColumn...");
      return null;
   }
}