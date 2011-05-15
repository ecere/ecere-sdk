import "eda"

#include "libpq-fe.h"

static class PgSQLDataSource : DataSourceDriver
{
   class_property(name) = "PostgreSQL";

   String locator;
   //PGconn * conn;

   String BuildLocator(DataSource ds)
   {
      char r[MAX_F_STRING];
      char t[MAX_LOCATION];
      
      /*
      host
      hostaddr
      port
      dbname
      user
      password
      connect_timeout
      options
      tty
      sslmode
      requiressl
      krbsrvname
      service
      */
      
      r[0] = '\0';
      if(ds.host)
         sprintf(t, "host=%s ", ds.host), strcat(r, t);
      if(ds.port)
         sprintf(t, "port=%s ", ds.port), strcat(r, t);
      if(ds.user)
         sprintf(t, "user=%s ", ds.user), strcat(r, t);
      if(ds.pass)
         sprintf(t, "password=%s ", ds.pass), strcat(r, t);
      return CopyString(r);
   }

   uint GetDatabasesCount()
   {
      return 0;
   }

   ~PgSQLDataSource()
   {
      /*if(conn)
         PQfinish(conn);*/
   }

   bool Connect(const String locator)
   {
      /*char loc[16384];
      strcpy(loc, locator);
      strcat(loc, " dbname=postgres ");*/
      this.locator = CopyString(locator);
      /*conn = PQconnectdb(locator);
      if(PQstatus(conn) != CONNECTION_OK)
      {
         Logf("Connection to database failed: %s", PQerrorMessage(conn));
         return false;
      }*/
      return true;
   }

   void Status()
   {
      Log("Status: Feeling groovy!\n");
   }

   bool RenameDatabase(const String name, const String rename)
   {
   }

   bool DeleteDatabase(const String name)
   {
   }

   Database OpenDatabase(const String name, CreateOptions createOptions)
   {
      char dbLocator[MAX_F_STRING];
      PGconn * conn;
      PgSQLDatabase db;
      
      //PGconn *PQconnectStart(const char *conninfo);
      //PostgresPollingStatusType PQconnectPoll(PGconn *conn);
      //void PQreset(PGconn *conn);
      //int PQresetStart(PGconn *conn);
      //PostgresPollingStatusType PQresetPoll(PGconn *conn);

      /*switch(PQstatus(conn))
      {
         case CONNECTION_STARTED:
            feedback = "Connecting...";
            break;
         case CONNECTION_MADE:
            feedback = "Connected to server...";
            break;
         case CONNECTION_AWAITING_RESPONSE:
         case CONNECTION_AUTH_OK:
         case CONNECTION_SSL_STARTUP:
         case CONNECTION_SETENV:
         default:
            feedback = "Connecting...";
      }*/

      sprintf(dbLocator, "%s dbname=%s ", locator, name);
      conn = PQconnectdb(dbLocator);
      if(PQstatus(conn) != CONNECTION_OK)
      {
         Logf("Connection to database failed: %s", PQerrorMessage(conn));
         return null;
      }
      db = PgSQLDatabase { conn = conn };
      return db;
   }
}

class PgSQLDatabase : Database
{
   PGconn * conn;

   /*
   char *PQuser(const PGconn *conn);
   char *PQpass(const PGconn *conn);
   char *PQhost(const PGconn *conn);
   char *PQport(const PGconn *conn);
   char *PQtty(const PGconn *conn);
   char *PQoptions(const PGconn *conn);
   ConnStatusType PQstatus(const PGconn *conn);
   PGTransactionStatusType PQtransactionStatus(const PGconn *conn);
   const char *PQparameterStatus(const PGconn *conn, const char *paramName);
   int PQprotocolVersion(const PGconn *conn);
   int PQserverVersion(const PGconn *conn);
   char *PQerrorMessage(const PGconn *conn);
   int PQsocket(const PGconn *conn);
   int PQbackendPID(const PGconn *conn);
   SSL *PQgetssl(const PGconn *conn);
   */

   ~PgSQLDatabase()
   {
      if(conn)
         PQfinish(conn);
   }

   String GetName()
   {
      return conn ? PQdb(conn) : null;
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
      char t[MAX_F_STRING];
      String sql = null;
      switch(options.type)
      {
         case queryRows:
            break;
         case tableRows:
            sprintf(t, "SELECT * FROM %s;", name);
            sql = t;
            break;
         case viewRows:
         case processesList:
         case databasesList:
         case tablesList:
            break;
         case fieldsList:
            break;
      }
      if(sql)
      {
         ExecStatusType status;
         PgSQLTable tbl { };
         tbl.res = PQexec(conn, sql);
         //PGresult *PQexecParams(PGconn *conn, const char *command, int nParams, const Oid *paramTypes, 
         //             const char * const *paramValues, const int *paramLengths, const int *paramFormats, int resultFormat);
         //PGresult *PQprepare(PGconn *conn, const char *stmtName, const char *query, int nParams, const Oid *paramTypes);
         //PGresult *PQexecPrepared(PGconn *conn, const char *stmtName, int nParams, const char * const *paramValues,
         //             const int *paramLengths, const int *paramFormats, int resultFormat);
         //PGresult *PQdescribePrepared(PGconn *conn, const char *stmtName);
         //PGresult *PQdescribePortal(PGconn *conn, const char *portalName);
         //char *PQresultErrorMessage(const PGresult *res);
         //char *PQresultErrorField(const PGresult *res, int fieldcode);
         /*
         PG_DIAG_SEVERITY
         PG_DIAG_SQLSTATE
         PG_DIAG_MESSAGE_PRIMARY
         PG_DIAG_MESSAGE_DETAIL
         PG_DIAG_MESSAGE_HINT
         PG_DIAG_STATEMENT_POSITION
         PG_DIAG_INTERNAL_POSITION
         PG_DIAG_INTERNAL_QUERY
         PG_DIAG_CONTEXT
         PG_DIAG_SOURCE_FILE
         PG_DIAG_SOURCE_LINE
         PG_DIAG_SOURCE_FUNCTION
         */
         //PGresult *PQmakeEmptyPGresult(PGconn *conn, ExecStatusType status);

         //asynch
         //int PQsendQuery(PGconn *conn, const char *command);
         //int PQsendQueryParams(PGconn *conn, const char *command, int nParams, const Oid *paramTypes,
         //       const char * const *paramValues, const int *paramLengths, const int *paramFormats, int resultFormat);
         //int PQsendPrepare(PGconn *conn, const char *stmtName, const char *query, int nParams, const Oid *paramTypes);
         //int PQsendQueryPrepared(PGconn *conn, const char *stmtName, int nParams, const char * const *paramValues,
         //       const int *paramLengths, const int *paramFormats, int resultFormat);
         //int PQsendDescribePrepared(PGconn *conn, const char *stmtName);
         //int PQsendDescribePortal(PGconn *conn, const char *portalName);
         //PGresult *PQgetResult(PGconn *conn);
         //int PQconsumeInput(PGconn *conn);
         //int PQisBusy(PGconn *conn);
         //int PQsetnonblocking(PGconn *conn, int arg);
         //int PQisnonblocking(const PGconn *conn);
         //int PQflush(PGconn *conn);
         //PGcancel *PQgetCancel(PGconn *conn);
         //void PQfreeCancel(PGcancel *cancel);
         //int PQcancel(PGcancel *cancel, char *errbuf, int errbufsize);
         //int PQrequestCancel(PGconn *conn);

         if(tbl.res)
            status = PQresultStatus(tbl.res);
         else
            status = PGRES_FATAL_ERROR;
         switch(status)
         {
            case PGRES_EMPTY_QUERY:    //The string sent to the server was empty.
            case PGRES_COPY_OUT:       //Copy Out (from server) data transfer started.
            case PGRES_COPY_IN:        //Copy In (to server) data transfer started.
            case PGRES_BAD_RESPONSE:   //The server's response was not understood.
            case PGRES_NONFATAL_ERROR: //A nonfatal error (a notice or warning) occurred.
            case PGRES_FATAL_ERROR:    //A fatal error occurred.
            case PGRES_COMMAND_OK:     //Successful completion of a command returning no data.
               Logf("Open table failed: %s", PQresStatus(status));
               break;
            case PGRES_TUPLES_OK:      //Successful completion of a command returning data (such as a SELECT or SHOW).
               return tbl;
         }
         //int PQbinaryTuples(const PGresult *res);   // returns 0 for textual and 1 for binary
         delete tbl;
      }
      return null;
   }
}

class PgSQLTable : Table
{
   PGresult * res;

   ~PgSQLTable()
   {
      if(res)
         PQclear(res);
   }

   String GetName()
   {
      return null;
   }

   Field GetFirstField()
   {
      return null;
   }

   uint GetFieldsCount()
   {
      return res ? PQnfields(res) : 0;
   }
   
   uint GetRowsCount()
   {
      return res ? PQntuples(res) : 0;
   }
   
   DriverRow CreateRow()
   {
      return null;
   }
   
   Field AddField(const String name, Class type, int length)
   {
      return null;
   }
   
   //char *PQfname(const PGresult *res, int column_number);
   //Oid PQftable(const PGresult *res, int column_number);
   //int PQftablecol(const PGresult *res, int column_number);
   //int PQfformat(const PGresult *res, int column_number);
   //Oid PQftype(const PGresult *res, int column_number);
   //int PQfmod(const PGresult *res, int column_number);
   //int PQfsize(const PGresult *res, int column_number);
   //int PQbinaryTuples(const PGresult *res);
   //char *PQgetvalue(const PGresult *res, int row_number, int column_number);
   //int PQgetisnull(const PGresult *res, int row_number, int column_number);
   //int PQgetlength(const PGresult *res, int row_number, int column_number);
   //int PQnparams(const PGresult *res);
   //Oid PQparamtype(const PGresult *res, int param_number);
   //void PQprint(FILE *fout,      /* output stream */ const PGresult *res, const PQprintOpt *po);
   
   //char *PQcmdStatus(PGresult *res);
   //char *PQcmdTuples(PGresult *res);
   //Oid PQoidValue(const PGresult *res);
   //char *PQoidStatus(const PGresult *res);

   //size_t PQescapeStringConn (PGconn *conn, char *to, const char *from, size_t length, int *error);
   //size_t PQescapeString (char *to, const char *from, size_t length);

   //unsigned char *PQescapeByteaConn(PGconn *conn, const unsigned char *from, size_t from_length, size_t *to_length);
   //unsigned char *PQescapeBytea(const unsigned char *from, size_t from_length, size_t *to_length);
   //unsigned char *PQunescapeBytea(const unsigned char *from, size_t *to_length);
   //void PQfreemem(void *ptr);

   Field FindField(const String name)
   {
      if(res)
      {
         int num = PQfnumber(res, name);
         if(num != -1)
         {
            PgSQLField fld { num = num };
            return fld;
         }
      }
      return null;
   }
   
   bool Index(int count, FieldIndex * fieldIndexes)
   {
      return false;
   }
}

static class PgSQLField : Field
{
public:
   PgSQLTable tbl;
   
   Class type;
   int length;

   int num;

   //int PQfformat(const PGresult *res, int column_number); // returns 0 for textual and 1 for binary
   //Oid PQftype(const PGresult *res, int column_number);
         //query the system table pg_type to obtain the names and properties of the various data types
   //int PQfmod(const PGresult *res, int column_number);
   //int PQfsize(const PGresult *res, int column_number);

   String GetName() { return (tbl && tbl.res) ? PQfname(tbl.res, num) : null; }
   Class GetType() { return type; }
   int GetLength() { return length; }
   Field GetNext() { return next; }
   Field GetPrev() { return prev; }

   ~PgSQLField()
   {
   }

   void Free() { delete this; }
}


//char *PQgetvalue(const PGresult *res, int row_number, int column_number);
//int PQgetisnull(const PGresult *res, int row_number, int column_number);
//int PQgetlength(const PGresult *res, int row_number, int column_number);

//void PQprint(FILE *fout,      /* output stream */
//             const PGresult *res,
//             const PQprintOpt *po);

//typedef struct {
//    pqbool  header;      /* print output field headings and row count */
//    pqbool  align;       /* fill align the fields */
//    pqbool  standard;    /* old brain dead format */
//    pqbool  html3;       /* output HTML tables */
//    pqbool  expanded;    /* expand tables */
//    pqbool  pager;       /* use pager for output if needed */
//    char    *fieldSep;   /* field separator */
//    char    *tableOpt;   /* attributes for HTML table element */
//    char    *caption;    /* HTML table caption */
//    char    **fieldName; /* null-terminated array of replacement field names */
//} PQprintOpt;

static class PgSQLRow : DriverRow
{
   PgSQLTable tbl;
   int _num;

   property int num
   {
      set
      {
         _num = value;
      }
   }

   ~PgSQLRow()
   {
   }

   bool GetData(PgSQLField field, typed_object & data)
   {
   }

   bool SetData(PgSQLField field, typed_object data)
   {
   }

   bool Nil()
   {
      return _num == -1;
   }
   
   bool Select(MoveOptions move)
   {
      int rowsCount = tbl.GetRowsCount();
      if(rowsCount)
      {
         switch(move)
         {
            case first:
               num = -1;
            case next:
               num = _num + 1;
               if(_num != rowsCount)
                  return true;
               num = -1;
               break;
            case last:
               num = rowsCount;
            case previous:
               num = _num - 1;
               if(_num != -1)
                  return true;
               break;
            case middle:
            case nil:
               num = -1;
               break;
         }
      }
      return false;
   }

   int CompareRowPath(char * apath, PgSQLField field, typed_object data)
   {
   }

   int CompareRowNum(int num, PgSQLField field, typed_object data)
   {
   }

   int CompareRow(PgSQLField field, typed_object data)
   {
   }

   bool Find(PgSQLField field, MoveOptions move, MatchOptions match, typed_object data)
   {
      return false;
   }

   bool Add()
   {
   }

   bool Delete()
   {
      return false;
   }
}
