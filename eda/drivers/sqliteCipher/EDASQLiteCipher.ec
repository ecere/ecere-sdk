#ifdef ECERE_STATIC
public import static "ecere"
public import static "EDA"
#else
public import "ecere"
public import "EDA"
#endif

#include "sqlite3.h"

import "EDASQLiteCommon"

static class SQLiteCipherDataSource : DataSourceDriver
{
   class_property(name) = "SQLiteCipher";
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

   ~SQLiteCipherDataSource()
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

   String MakeDatabasePath(const String name)
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
            printf("Can't open database (%s): %s\n", path, sqlite3_errmsg(db));
            sqlite3_close(db);
         }
         else
         {
            char command[1024];
            if(ds.pass && ds.pass[0])
            {
               sprintf(command, "PRAGMA key = '%s';", ds.pass);
               sqlite3_exec(db, command, null, null, null);
               if(sqlite3_exec(db, "SELECT count(*) FROM sqlite_master;", null, null, null) == SQLITE_OK)
               {
                  PrintLn("EDASQLiteCipher: password is correct, database has been initialized");
               }
               else
               {
                  PrintLn("EDASQLiteCipher: incorrect password!");
               }
            }
            sprintf(command, "CREATE TABLE eda_table_fields(Table_Name TEXT, Name TEXT, Type TEXT, Length INT);");
            sqlite3_exec(db, command, null, null, null);

            result = SQLiteDatabase { db = db };
         }            
         delete path;
      }
      return result;
   }
}
