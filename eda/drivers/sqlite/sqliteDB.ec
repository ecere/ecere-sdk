#include "sqlite3.h"

#ifdef ECERE_STATIC
public import static "ecere"
public import static "EDA"
#else
public import "ecere"
public import "EDA"
#endif

#define __restrict

#include <regex.h>

static regex_t regex;
static String lastRegex;

static void sqlite_regexp(sqlite3_context * context, int argc, sqlite3_value ** values)
{
#ifndef ECERE_STATIC
   String reg  = (String)sqlite3_value_text(values[0]);
   String text = (String)sqlite3_value_text(values[1]);
   if(lastRegex && !strcmp(reg, lastRegex));
   else
   {
      delete lastRegex;
      regfree(&regex);
      lastRegex = CopyString(reg);
      if(regcomp(&regex, reg, REG_EXTENDED | REG_NOSUB))
         sqlite3_result_error(context, "invalid regex", -1);
   }

   if ( argc != 2 || reg == 0 || text == 0)
      sqlite3_result_error(context, "invalid arguments for regexp()\n", -1);
   else
      sqlite3_result_int(context, (regexec(&regex, text , 0, null, 0) != REG_NOMATCH));
#endif
}

public enum SQLiteResult
{
   ok = SQLITE_OK,                  // Successful result
   error = SQLITE_ERROR,            // SQL error or missing database
   internal = SQLITE_INTERNAL,      // Internal logic error in SQLite
   permission = SQLITE_PERM,        // Access permission denied
   abort = SQLITE_ABORT,            // Callback routine requested an abort
   busy = SQLITE_BUSY,              // The database file is locked
   locked = SQLITE_LOCKED,          // A table in the database is locked
   noMem = SQLITE_NOMEM,            // A malloc() failed
   readOnly = SQLITE_READONLY,      // Attempt to write a readonly database
   interrupt = SQLITE_INTERRUPT,    // Operation terminated by sqlite3_interrupt()
   ioError = SQLITE_IOERR,          // Some kind of disk I/O error occurred
   corrupt = SQLITE_CORRUPT,        // The database disk image is malformed
   notFound = SQLITE_NOTFOUND,      // Unknown opcode in sqlite3_file_control()
   full = SQLITE_FULL,              // Insertion failed because database is full
   cantOpen = SQLITE_CANTOPEN,      // Unable to open the database file
   protocol = SQLITE_PROTOCOL,      // Database lock protocol error
   empty = SQLITE_EMPTY,            // Database is empty
   schema = SQLITE_SCHEMA,          // The database schema changed
   tooBig = SQLITE_TOOBIG,          // String or BLOB exceeds size limit
   constraint = SQLITE_CONSTRAINT,  // Abort due to constraint violation
   mismatch = SQLITE_MISMATCH,      // Data type mismatch
   misuse = SQLITE_MISUSE,          // Library used incorrectly
   noLFS = SQLITE_NOLFS,            // Uses OS features not supported on host
   authorization = SQLITE_AUTH,     // Authorization denied
   format = SQLITE_FORMAT,          // Auxiliary database format error
   range = SQLITE_RANGE,            // 2nd parameter to sqlite3_bind out of range
   notADatabase = SQLITE_NOTADB,    // File opened that is not a database file
   notice = SQLITE_NOTICE,          // Notifications from sqlite3_log()
   warning = SQLITE_WARNING,        // Warnings from sqlite3_log()
   rowReady = SQLITE_ROW,           // sqlite3_step() has another row ready
   done = SQLITE_DONE               // sqlite3_step() has finished executing
};

public class SQLiteDB
{
   sqlite3 * db;
   bool inBegin;

public:
   SQLiteDB ::open(subclass(SQLiteDB) _class, const String path, bool readOnly, bool create)
   {
      SQLiteDB result = null;
      sqlite3 * db;
      SQLiteResult r = (SQLiteResult)sqlite3_open_v2(path, &db, readOnly ? SQLITE_OPEN_READONLY : (SQLITE_OPEN_READWRITE | (create ? SQLITE_OPEN_CREATE : 0)), null);
      if(r == ok)
      {
         result = eInstance_New(_class ? _class : class(SQLiteDB));
         result.db = db;
      }
      else
      {
         printf("SQLite: Can't open database (%s): %s\n", path, sqlite3_errmsg(db));
         sqlite3_close(db);
      }
      return result;
   }

   void setupRegExp()
   {
      create_function("regexp", 2, null, sqlite_regexp,0,0);
   }

   SQLiteResult exec(const String cmd)
   {
      return (SQLiteResult)sqlite3_exec(db, cmd, null, null, null);
   }

   SQLiteResult execf(const String format, ...)
   {
      SQLiteResult result;
      char cmd[MAX_F_STRING];
      va_list args;
      va_start(args, format);
      vsnprintf(cmd, sizeof(cmd), format, args);
      cmd[sizeof(cmd)-1] = 0;
      result = exec(cmd);
      va_end(args);
      return result;
   }

   bool begin() { inBegin = true; return exec("BEGIN;") == done; }
   bool commit() { inBegin = false; return exec("COMMIT;") == done; }
   property const String lockingMode { set { execf("PRAGMA locking_mode=%s; BEGIN IMMEDIATE; COMMIT;", value); } }

   ~SQLiteDB()
   {
      // TOFIX: Doing this here now
      delete lastRegex;
#ifndef ECERE_STATIC
      regfree(&regex);
#endif

      if(inBegin) commit();
      lockingMode = "normal";
      if((SQLiteResult)sqlite3_close(db) == busy)
         PrintLn("Can't close SQLite DB (busy)");
   }

private:
   void create_function(const String name, int nArgs, void *userData,
      void (*xFunc)(sqlite3_context*,int,sqlite3_value**),
      void (*xStep)(sqlite3_context*,int,sqlite3_value**),
      void (*xFinal)(sqlite3_context *))
   {
      sqlite3_create_function(db, name, nArgs, SQLITE_UTF8 /*SQLITE_ANY*/, userData, xFunc, xStep, xFinal);
   }
}

public class SQLiteStmt : struct
{
   sqlite3_stmt * stmt;
   SQLiteDB db;

public:
   property SQLiteDB db { set { db = value; } get { return db; } }
   property const String query { set { if(stmt) finalize(); sqlite3_prepare_v2(db.db, value, -1, &stmt, null); } }

   ~SQLiteStmt() { finalize(); }

   void queryf(const String format, ...)
   {
      char cmd[MAX_F_STRING];
      va_list args;
      va_start(args, format);
      vsnprintf(cmd, sizeof(cmd), format, args);
      cmd[sizeof(cmd)-1] = 0;
      query = cmd;
      va_end(args);
   }
   void reset() { sqlite3_reset(stmt); }
   void finalize() { sqlite3_finalize(stmt); stmt = null; }
   SQLiteResult step() { return (SQLiteResult)sqlite3_step(stmt); }

   void bind_null(int pos) { sqlite3_bind_null(stmt, pos); }
   void bind_int(int pos, int i) { sqlite3_bind_int(stmt, pos, i); }
   void bind_int64(int pos, int64 i) { sqlite3_bind_int64(stmt, pos, i); }
   void bind_double(int pos, double d) { sqlite3_bind_double(stmt, pos, d); }
   void bind_text(int pos, const String t)
   {
      if(t)
         sqlite3_bind_text(stmt, pos, t, strlen(t), SQLITE_TRANSIENT);
       else
         sqlite3_bind_null(stmt, pos);
   }

   void bind_blob(int pos, const void * d, uint size)
   {
      if(d)
         sqlite3_bind_text(stmt, pos, d, size, SQLITE_TRANSIENT);
       else
         sqlite3_bind_null(stmt, pos);
   }

   void bind_value(int pos, FieldValue value)
   {
      // TODO: 64 bit ints?
      switch(value.type.type)
      {
         case nil:     bind_null  (pos);          break;
         case integer: bind_int   (pos, value.i); break;
         case real:    bind_double(pos, value.r); break;
         case text:    bind_text  (pos, value.s); break;
      }
   }

   FieldType column_type(int pos) { return (FieldType)sqlite3_column_type(stmt, pos); }
   int column_int(int pos) { return sqlite3_column_int(stmt, pos); }
   int64 column_int64(int pos) { return sqlite3_column_int64(stmt, pos); }
   double column_double(int pos) { return sqlite3_column_double(stmt, pos); }
   int column_bytes(int pos) { return sqlite3_column_bytes(stmt, pos); }
   const String column_text(int pos) { return (const String)sqlite3_column_text(stmt, pos); }
   String column_text_copy(int pos)
   {
      int numBytes = column_bytes(pos);
      const String text = column_text(pos);
      String s = text ? new char[numBytes + 1] : null;
      if(text)
         memcpy(s, text, numBytes + 1);
      return s;
   }
   void column_value(int pos, FieldValue value)
   {
      switch(column_type(pos))
      {
         case integer: value = { { integer },    i = column_int      (pos) }; break;
         case real:    value = { { real },       r = column_double   (pos) }; break;
         case text:    value = { { text, true }, s = column_text_copy(pos) }; break;
         default:      value = { { nil } };                                   break;
      }
   }
}
