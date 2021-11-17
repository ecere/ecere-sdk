#include "sqlite3.h"

#ifdef ECERE_STATIC
public import static "ecere"
public import static "EDA"
#else
public import "ecere"
public import "EDA"
#endif

#define __restrict

#ifndef ECERE_STATIC
#include <regex.h>

static regex_t regex;
static String lastRegex;
#endif

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
      bool isArchive = path[0] == '<' || path[0] == ':';
      SQLiteResult r = (SQLiteResult)sqlite3_open_v2(path, &db,
         readOnly || isArchive ? SQLITE_OPEN_READONLY : (SQLITE_OPEN_READWRITE | (create ? SQLITE_OPEN_CREATE : 0)),
         isArchive ? "ecere" : null);
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
   int64 lastInsertRowID() { return sqlite3_last_insert_rowid(db); }

   ~SQLiteDB()
   {
#ifndef ECERE_STATIC
      // TOFIX: Doing this here now
      delete lastRegex;
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
   property const String query
   {
      set
      {
         if(stmt) finalize();
         sqlite3_prepare_v2(db.db, value, -1, &stmt, null);
#ifdef _DEBUG
         if(!stmt)
            printf($"SQLite Error preparing statement:\n   %s\n", value);
#endif
      }
   }

   ~SQLiteStmt() { finalize(); }

   bool queryf(const String format, ...)
   {
      char cmd[MAX_F_STRING];
      va_list args;
      va_start(args, format);
      vsnprintf(cmd, sizeof(cmd), format, args);
      cmd[sizeof(cmd)-1] = 0;
      query = cmd;
      va_end(args);
      return stmt != null;
   }
   void reset() { if(stmt) sqlite3_reset(stmt); }
   void finalize() { if(stmt) sqlite3_finalize(stmt); stmt = null; }
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
         sqlite3_bind_blob(stmt, pos, d, size, SQLITE_TRANSIENT);
       else
         sqlite3_bind_null(stmt, pos);
   }

   void bind_value(int pos, FieldValue value)
   {
      // TODO: 64 bit ints?
      switch(value.type.type)
      {
         case nil:     bind_null  (pos);          break;
         case integer: bind_int64 (pos, value.i); break;
         case real:    bind_double(pos, value.r); break;
         case text:    bind_text  (pos, value.s); break;
      }
   }

   FieldType column_type(int pos) { return (FieldType)sqlite3_column_type(stmt, pos); }
   int column_int(int pos) { return sqlite3_column_int(stmt, pos); }
   int64 column_int64(int pos) { return sqlite3_column_int64(stmt, pos); }
   double column_double(int pos) { return sqlite3_column_double(stmt, pos); }
   int column_bytes(int pos) { return sqlite3_column_bytes(stmt, pos); }
   const void * column_blob(int pos) { return (const void *)sqlite3_column_blob(stmt, pos); }
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
         case integer: value = { { integer },    i = column_int64    (pos) }; break;
         case real:    value = { { real },       r = column_double   (pos) }; break;
         case text:    value = { { text, true }, s = column_text_copy(pos) }; break;
         default:      value = { { nil } };                                   break;
      }
   }
}

// Virtual File System to access SQLite databases inside Ecere archives
static int ecereClose(sqlite3_file *pFile)
{
   File f = *(File *)(pFile+1);
   delete f;
   return SQLITE_OK;
}

static int ecereRead(sqlite3_file *pFile, void *zBuf, int iAmt, sqlite_int64 iOfst)
{
   int result = SQLITE_IOERR_READ;
   File f = *(File *)(pFile+1);
   if(f.Seek(iOfst, start))
   {
      int nRead = f.Read(zBuf, 1, iAmt);
      if(nRead == iAmt)
         result = SQLITE_OK;
      else if(nRead >= 0)
      {
         if(nRead < iAmt)
            memset((char*)zBuf + nRead, 0, iAmt - nRead);
         result = SQLITE_IOERR_SHORT_READ;
      }
   }
   return result;
}

static int ecereWrite(sqlite3_file *pFile, const void *zBuf, int iAmt, sqlite_int64 iOfst) { return SQLITE_IOERR_WRITE; }
static int ecereTruncate(sqlite3_file *pFile, sqlite_int64 size) { return SQLITE_IOERR_TRUNCATE; }
static int ecereSync(sqlite3_file *pFile, int flags) { return SQLITE_OK; }
static int ecereFileSize(sqlite3_file *pFile, sqlite_int64 *pSize)
{
   File f = *(File *)(pFile+1);
   *pSize = f.GetSize();
   return SQLITE_OK;
}

static int ecereLock(sqlite3_file *pFile, int eLock) { return SQLITE_OK; }
static int ecereUnlock(sqlite3_file *pFile, int eLock) { return SQLITE_OK; }
static int ecereCheckReservedLock(sqlite3_file *pFile, int *pResOut) { *pResOut = 0; return SQLITE_OK; }
static int ecereFileControl(sqlite3_file *pFile, int op, void *pArg) { return SQLITE_NOTFOUND; }
static int ecereSectorSize(sqlite3_file *pFile) { return 0; }
static int ecereDeviceCharacteristics(sqlite3_file *pFile) { return 0; }

static int ecereOpen(sqlite3_vfs *pVfs, const char *zName, sqlite3_file *pFile, int flags, int *pOutFlags)
{
   int result = SQLITE_IOERR;
   static const sqlite3_io_methods ecereIO =
   {
      1,
      ecereClose,
      ecereRead,
      ecereWrite,
      ecereTruncate,
      ecereSync,
      ecereFileSize,
      ecereLock,
      ecereUnlock,
      ecereCheckReservedLock,
      ecereFileControl,
      ecereSectorSize,
      ecereDeviceCharacteristics
   };
   if(zName)
   {
      File * fp = (File *)(pFile+1);
      *fp = FileOpen(zName, read);
      if(*fp)
      {
         result = SQLITE_OK;
         if( pOutFlags )
            *pOutFlags = SQLITE_OPEN_EXCLUSIVE | SQLITE_OPEN_READONLY;
         pFile->pMethods = &ecereIO;
      }
      else
         result = SQLITE_CANTOPEN;
   }
   return result;
}

static int ecereDelete(sqlite3_vfs *pVfs, const char *zPath, int dirSync)
{
  return SQLITE_IOERR_DELETE;
}

static int ecereAccess(sqlite3_vfs *pVfs, const char *zPath, int flags, int *pResOut)
{
  *pResOut = FileExists(zPath) ? 1 : 0;
  return SQLITE_OK;
}

static int ecereFullPathname(sqlite3_vfs *pVfs, const char *zPath, int nPathOut, char *zPathOut)
{
  char zDir[MAX_FILENAME];
  zDir[0] = 0;
  PathCat(zDir, zPath);
  strncpy(zPathOut, zDir, nPathOut-1);
  zPathOut[nPathOut-1] = 0;
  return SQLITE_OK;
}

static void *ecereDlOpen(sqlite3_vfs *pVfs, const char *zPath) { return 0; }
static void ecereDlError(sqlite3_vfs *pVfs, int nByte, char *zErrMsg)
{
  sqlite3_snprintf(nByte, zErrMsg, "Loadable extensions are not supported");
  zErrMsg[nByte-1] = '\0';
}
static void (*ecereDlSym(sqlite3_vfs *pVfs, void *pH, const char *z))(void) { return 0; }
static void ecereDlClose(sqlite3_vfs *pVfs, void *pHandle) { }
static int ecereRandomness(sqlite3_vfs *pVfs, int nByte, char *zByte) { return SQLITE_OK; }

static int ecereSleep(sqlite3_vfs *pVfs, int nMicro)
{
   Sleep(nMicro / 1000000.0);
   return nMicro;
}

static int ecereCurrentTime(sqlite3_vfs *pVfs, double *pTime)
{
  *pTime = GetTime();
  return SQLITE_OK;
}

static sqlite3_vfs ecereVFS =
{
   1,
   sizeof(sqlite3_file) + sizeof(File),
   MAX_FILENAME-1,
   0,
   "ecere",
   0,
   ecereOpen,
   ecereDelete,
   ecereAccess,
   ecereFullPathname,
   ecereDlOpen,
   ecereDlError,
   ecereDlSym,
   ecereDlClose,
   ecereRandomness,
   ecereSleep,
   ecereCurrentTime
};

__on_register_module()
{
   sqlite3_vfs_register(&ecereVFS, 0);
}

static class SQLiteDBUnregisterModule
{
   ~SQLiteDBUnregisterModule()
   {
      sqlite3_vfs_unregister(&ecereVFS);
   }
}

// FIXME: No __on_unregister_module() ?
static SQLiteDBUnregisterModule unregisterModule { };
