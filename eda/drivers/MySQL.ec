import "ecere"
import "eda"

define MySQL = "MySQL";

#ifdef COMMENTED_OUT_MYSQL_NEED_MATCH_MODIFIED_DRIVER_STRUCTURE

#include <stdio.h>
#include <stdarg.h>
#include <mysql.h>
#define DEFALT_SQL_STMT "SELECT * FROM db"

static MySqlLib mySqlLib;

static void LogMySqlError(MYSQL * mySql, String msg)
{
   Logf("%s\n   MySql Error: #%d %s\n", msg, mysql_errno(mySql), mysql_error(mySql));
}

static void LogMySqlErrorf(MYSQL * mySql, String format, ...)
{
   char msg[MAX_F_STRING];

   va_list args;
   va_start(args, format);
   vsprintf(msg, format, args);
   va_end(args);

   Logf("%s\n   MySql Error: #%d %s\n", msg, mysql_errno(mySql), mysql_error(mySql));
}

static class MySqlLib
{
   MySqlLib()
   {
      mysql_library_init(0, null, null);
   }

   ~MySqlLib()
   {
      mysql_library_end();
   }
}

static class MySqlDataSource : struct
{
public:
   MYSQL * mySql;
}

static class MySqlDatabase : struct
{
public:
   MYSQL * mySql;

   MySqlDataSource src;
}

static class MySqlTable : struct
{
public:
   MYSQL * mySql;
   MYSQL_RES * myRes;

   MySqlDatabase dDb;
   MySqlField dFld;
   MySqlRow dRow;

   Field fld;
   Row row;
}

static class MySqlField : struct
{
public:
   MYSQL_FIELD * myFlds;

   MySqlTable dTbl;

   uint fldsCount;
   uint fldsPos;
}

static class MySqlRow : struct
{
public:
   MYSQL_ROW myRow;
   unsigned long *myLengths;

   MySqlTable dTbl;
   MySqlField dFld;

   Field fld;

   uint rowsCount;
   uint rowsPos;
}

class MySqlDataDriver : DataDriver
{
public:

   class_property(name) = "MySql";

   /* -------------------------------------------------------------------------------------------------- */
   /* --- Driver --------------------------------------------------------------------------------------- */

   uint ::DriverDefaultPort()
   {
      return MYSQL_PORT;
   }

   /* -------------------------------------------------------------------------------------------------- */
   /* --- Data Source ---------------------------------------------------------------------------------- */

   void ::SourceClose(DataSource ds)
   {
      MySqlDataSource src = (MySqlDataSource)ds.driverData;
      if(src)
      {
         if(src.mySql) mysql_close(src.mySql);
         delete src;
         ds.driverData = null;
      }
   }

   void ::SourceStatus(DataSource ds)
   {
      MySqlDataSource src = (MySqlDataSource)ds.driverData;
      const String pszT;
      Log(" ********************************************* \n");
      Log(" *      MySql Status Info                    * \n");
      Log(" ********************************************* \n");
         pszT = mysql_get_client_info(); Logf("   Client info: %s\n", pszT);
         pszT = mysql_get_host_info(src.mySql); Logf("   Host info: %s\n", pszT);
         pszT = mysql_get_server_info(src.mySql); Logf("   Server info: %s\n", pszT);
      Log("     _____________________________________\n\n");

      Log(" ********************************************* \n");
      Log(" *      Stats                                * \n");
      Log(" ********************************************* \n");
         pszT = mysql_stat(src.mySql); Logf("   %s\n", pszT);
      Log("     _____________________________________\n\n");
   }

   bool ::SourceConnect(DataSource ds, const String host, const String user, const String password, uint port)
   {
      bool success = false;
      MySqlDataSource src {};
      if(!mySqlLib) mySqlLib = { };
      if(src.mySql) mysql_close(src.mySql);
      if(src.mySql = mysql_init((MYSQL *) 0))
      {
         if(mysql_real_connect(src.mySql, host, user, password, null, port, null, 0))
         {
            src.mySql->reconnect = 1;
            success = true;
         }
         else
         {
            LogMySqlErrorf(src.mySql, "Can't connect to the mysql server on port %d !\n", port);
            mysql_close(src.mySql);
         }
      }
      else
      {
         LogMySqlError(src.mySql, "Can't initialize mysql socket");
         mysql_close(src.mySql);
      }
      ds.driverData = (void *)src;
      return success;
   }

   uint ::SourceDatabasesCount(DataSource ds)
   {
      MySqlDataSource src = (MySqlDataSource)ds.driverData;
      Log("TODO: MySql - DataSourceDatabasesCount");
      return 0;
   }

   /* -------------------------------------------------------------------------------------------------- */
   /* --- Database ------------------------------------------------------------------------------------- */

   void ::DatabaseClose(Database db)
   {
      MySqlDatabase dDb = (MySqlDatabase)db.driverData;
      Log("TODO: MySql - DatabaseClose");
   }

   uint ::DatabaseTablesCount(Database db)
   {
      MySqlDatabase dDb = (MySqlDatabase)db.driverData;
      Log("TODO: MySql - DatabaseTablesCount");
      return 0;
   }

   uint ::DatabaseViewsCount(Database db)
   {
      MySqlDatabase dDb = (MySqlDatabase)db.driverData;
      Log("TODO: MySql - DatabaseViewsCount");
      return 0;
   }

   String ::DatabaseNameGet(Database db)
   {
      MySqlDatabase dDb = (MySqlDatabase)db.driverData;
      Log("TODO: MySql - DatabaseNameGet");
      return null;
   }

   bool ::DatabaseNameSet(Database db, const String value)
   {
      MySqlDatabase dDb = (MySqlDatabase)db.driverData;
      Log("TODO: MySql - DatabaseNameSet");
      return false;
   }

   bool ::DatabaseOpen(Database db, DataSource ds, const String name, OpenOptions options)
   {
      MySqlDataSource src = (MySqlDataSource)ds.driverData;
      MySqlDatabase dDb { mySql = src.mySql, src = src };
      Table databases;
      db.driver = ds.driver;
      db.driverData = (void *)dDb;

      databases = ds.OpenTable(null, { databasesList });
      if(databases)
      {
         if(databases.row.field.Seek("SCHEMA_NAME", firstEqual))
         {
            if(!databases.row.Seek(name, firstEqual))
            {
               if(options.create == create)
               {
                  char ddl[MAX_F_STRING];
                  sprintf(ddl, "CREATE DATABASE IF NOT EXISTS %s", name);  //  [[DEFAULT] CHARACTER SET, [[DEFAULT] COLLATE]]
                  if(mysql_query(src.mySql, ddl))
                     LogMySqlErrorf(src.mySql, "Couldn't execute DDL statement on the server!\n   %s", ddl);
               }
               else
               {
                  Logf("Database (%s) does not exist.\n", name);
                  return false;
               }
            }
         }
         else
            Log("Unable to detect if database exists!\n");
         databases.Close();
      }
      else
         Log("Unable to detect if database exists!\n");

      if(mysql_select_db(dDb.mySql, name) < 0)
      {
         LogMySqlErrorf(src.mySql, "Can't open the %s database!\n", db);
         return false;
      }
      return true;
   }

   bool ::DatabaseDelete(Database db, DataSource ds, const String name)
   {
      if(db)
      {
         MySqlDatabase dDb = (MySqlDatabase)db.driverData;
      }
      else
      {
         MySqlDataSource src = (MySqlDataSource)ds.driverData;
      }
      Log("TODO: MySql - DatabaseDelete");
      return false;
   }

   /* -------------------------------------------------------------------------------------------------- */
   /* --- Table ---------------------------------------------------------------------------------------- */

   void ::TableClose(Table tbl)
   {
      MySqlTable dTbl = (MySqlTable)tbl.driverData;
      if(dTbl.myRes) mysql_free_result(dTbl.myRes);
   }

   uint ::TableFieldsCount(Table tbl)
   {
      MySqlTable dTbl = (MySqlTable)tbl.driverData;
      return mysql_num_fields(dTbl.myRes);
   }

   uint ::TableRowsCount(Table tbl)
   {
      MySqlTable dTbl = (MySqlTable)tbl.driverData;
      return (uint)mysql_num_rows(dTbl.myRes);
   }

   Field ::TableField(Table tbl)
   {
      MySqlTable dTbl = (MySqlTable)tbl.driverData;
      if(!dTbl.fld)
      {
         dTbl.dFld = MySqlField { mysql_fetch_fields(dTbl.myRes), dTbl = dTbl, fldsCount = mysql_num_fields(dTbl.myRes), fldsPos = -1 };
         dTbl.fld = Field { driver = tbl.driver, driverData = dTbl.dFld };
      }
      return dTbl.fld;
   }

   Row ::TableRow(Table tbl)
   {
      MySqlTable dTbl = (MySqlTable)tbl.driverData;
      if(!dTbl.row)
      {
         dTbl.dRow = MySqlRow { dTbl = dTbl, rowsCount = (uint)mysql_num_rows(dTbl.myRes), rowsPos = -1 };
         dTbl.row = Row { driver = tbl.driver, driverData = dTbl.dRow };
      }
      return dTbl.row;
   }

   String ::TableNameGet(Table tbl)
   {
      MySqlTable dTbl = (MySqlTable)tbl.driverData;
      Log("TODO: MySql - TableNameGet");
      return null;
   }

   bool ::TableNameSet(Table tbl, const String value)
   {
      MySqlTable dTbl = (MySqlTable)tbl.driverData;
      Log("TODO: MySql - TableNameSet");
      return false;
   }

   bool ::TableOpen(Table tbl, Database db, DataSource ds, const String query, OpenOptions options)
   {
      char sql[MAX_F_STRING];
      MySqlDataSource src;
      MySqlDatabase dDb;
      MySqlTable dTbl { };
      Table tables;
      tbl.driverData = (void *)dTbl;
      if(db)
      {
         dDb = (MySqlDatabase)db.driverData;
         src = dDb.src;
         dTbl.mySql = dDb.mySql;
         tbl.driver = db.driver;
         if(options.type == tableRows)
            tables = db.OpenTable(null, { tablesList });
         else if(options.type == viewRows)
            ;
      }
      else
      {
         src = (MySqlDataSource)ds.driverData;
         dTbl.mySql = src.mySql;
         tbl.driver = ds.driver;
         if(options.type == tableRows)
            tables = ds.OpenTable(null, { tablesList });
         else if(options.type == viewRows)
            ;
      }

      if(options.type == tableRows)
      {
         if(tables)
         {
            if(tables.row.field.Seek("TABLE_NAME", firstEqual))
            {
               if(!tables.row.Seek(query, firstEqual))
               {
                  if(options.create == create)
                  {
                     char ddl[MAX_F_STRING];
                     sprintf(ddl, "CREATE TABLE IF NOT EXISTS %s (a INT);", query);
                     if(mysql_query(src.mySql, ddl))
                        LogMySqlErrorf(src.mySql, "Couldn't execute DDL statement on the server!\n   %s", ddl);
                  }
                  else
                  {
                     Logf("Table (%s) does not exist.\n", query);
                     return false;
                  }
               }
            }
            else
               Log("Unable to detect if table exists!\n");
            tables.Close();
         }
         else
            Log("Unable to detect if table exists!\n");
      }

      switch(options.type)
      {
         case queryRows:
            if(!mysql_query(dTbl.mySql, query))
            {
               if(options.access == integral)
                  dTbl.myRes = mysql_store_result(dTbl.mySql);
               else
                  dTbl.myRes = mysql_use_result(dTbl.mySql);
            }
            else
               LogMySqlErrorf(dTbl.mySql, "Couldn't execute %s on the server!", sql);
            break;
         case tableRows:
            sprintf(sql, "SELECT * FROM %s", query);
            if(!mysql_query(dTbl.mySql, sql))
            {
               if(options.access == integral)
                  dTbl.myRes = mysql_store_result(dTbl.mySql);
               else
                  dTbl.myRes = mysql_use_result(dTbl.mySql);
            }
            else
               LogMySqlErrorf(dTbl.mySql, "Couldn't execute %s on the server!", sql);
            break;
         case viewRows:
            break;
         case processesList:
            dTbl.myRes = mysql_list_processes(dTbl.mySql);
            break;
         case databasesList:
            dTbl.myRes = mysql_list_dbs(dTbl.mySql, null);
            break;
         case tablesList:
            dTbl.myRes = mysql_list_tables(dTbl.mySql, null);
            break;
         case fieldsList:
            sprintf(sql, "SHOW COLUMNS FROM %s", query);
            if(!mysql_query(dTbl.mySql, sql))
               dTbl.myRes = mysql_store_result(dTbl.mySql);
            else
               LogMySqlErrorf(dTbl.mySql, "Listing fields for table %s failed!", query);
            break;
      }

      if(dTbl.myRes)
      {
         //dTbl.fldsCount = mysql_num_fields(dTbl.myRes);
         //dTbl.flds = mysql_fetch_fields(dTbl.myRes);
         //dTbl.fldsPos = 0;
         return true;
      }
      return false;
   }

   bool ::TableDelete(Table tbl, Database db, const String name)
   {
      if(tbl)
      {
         MySqlTable dTbl = (MySqlTable)tbl.driverData;
      }
      else
      {
         MySqlDatabase dDb = (MySqlDatabase)db.driverData;
      }
      Log("TODO: MySql - TableDelete");
      return false;
   }

   /* -------------------------------------------------------------------------------------------------- */
   /* --- Field ---------------------------------------------------------------------------------------- */

   bool FieldEnd(Field fld)
   {
      MySqlField dFld = (MySqlField)fld.driverData;
      return dFld.fldsPos == dFld.fldsCount;
   }

   bool FieldNext(Field fld)
   {
      MySqlField dFld = (MySqlField)fld.driverData;
      /*if(dFld.fldsPos == -1)
         ;//dFld.fldsPos = 0;
      */
      if(dFld.fldsPos == dFld.fldsCount)
         return false;
      dFld.fldsPos++;
      return true;
   }

   bool FieldPrevious(Field fld)
   {
      MySqlField dFld = (MySqlField)fld.driverData;
      if(dFld.fldsPos == -1)
         dFld.fldsPos = dFld.fldsCount ? dFld.fldsCount + 1 : 0;
      else if(dFld.fldsPos == 0)
      {
         dFld.fldsPos = dFld.fldsCount;
         return false;
      }
      dFld.fldsPos--;
      return true;
   }

   bool FieldSeek(Field fld, String value, SeekOptions options)
   {
      MySqlField dFld = (MySqlField)fld.driverData;
      if(options == reset)
      {
         if(dFld.fldsCount)
         {
            dFld.fldsPos = -1;
            return true;
         }
      }
      else if(options == first)
      {
         if(dFld.fldsCount)
         {
            dFld.fldsPos = 0;
            return true;
         }
      }
      else if(options == firstEqual)
      {
         int len = strlen(value);
         for(dFld.fldsPos = 0; dFld.fldsPos < dFld.fldsCount; dFld.fldsPos++)
            if(dFld.myFlds[dFld.fldsPos].org_name_length == len && !strncmp(dFld.myFlds[dFld.fldsPos].org_name, value, len))
               break;
         if(dFld.fldsPos == dFld.fldsCount)
         {
            dFld.fldsPos = -1;
            return false;
         }
         return true;
      }
      else if(options == last)
      {
         if(dFld.fldsCount)
         {
            dFld.fldsPos = dFld.fldsCount - 1;
            return true;
         }
      }
      else if(options == none)
      {
         dFld.fldsPos = -1;
         return false;
      }
      return false;
   }

   String ::FieldNameGet(Field fld)
   {
      MySqlField dFld = (MySqlField)fld.driverData;
      String name = new char [dFld.myFlds[dFld.fldsPos].org_name_length + 1];
      strncpy(name, dFld.myFlds[dFld.fldsPos].org_name, dFld.myFlds[dFld.fldsPos].org_name_length);
      name[dFld.myFlds[dFld.fldsPos].org_name_length] = '\0';
      return name;
   }

   bool ::FieldNameSet(Field fld, const String value)
   {
      MySqlField dFld = (MySqlField)fld.driverData;
      Log("TODO: MySql - FieldNameSet");
      return false;
   }

   /* -------------------------------------------------------------------------------------------------- */
   /* --- Row ------------------------------------------------------------------------------------------ */

   Field ::RowField(Row row)
   {
      MySqlRow dRow = (MySqlRow)row.driverData;
      MySqlTable dTbl = dRow.dTbl;
      if(!dRow.fld)
      {
         dRow.dFld = MySqlField { mysql_fetch_fields(dTbl.myRes), dTbl, mysql_num_fields(dTbl.myRes), -1 };
         dRow.fld = Field { driver = row.driver, driverData = dRow.dFld };
      }
      return dRow.fld;
   }

   bool ::RowEnd(Row row)
   {
      MySqlRow dRow = (MySqlRow)row.driverData;
      return dRow.rowsPos == dRow.rowsCount;
   }

   bool ::RowNext(Row row)
   {
      MySqlRow dRow = (MySqlRow)row.driverData;
      MySqlTable dTbl = dRow.dTbl;
      if(dRow.rowsPos == -1)
         dRow.rowsPos = 0;
      if(dRow.rowsPos == dRow.rowsCount)
         return false;
      dRow.rowsPos++;
      dRow.myRow = mysql_fetch_row(dTbl.myRes);  // this won't work in all situations...
      dRow.myLengths = mysql_fetch_lengths(dTbl.myRes);
      return true;
   }

   bool ::RowPrevious(Row row)
   {
      MySqlRow dRow = (MySqlRow)row.driverData;
      MySqlTable dTbl = dRow.dTbl;
      if(dRow.rowsPos == -1)
         dRow.rowsPos = dRow.rowsCount ? dRow.rowsCount + 1 : 0;
      else if(dRow.rowsPos == 0)
      {
         dRow.rowsPos = dRow.rowsCount;
         return false;
      }
      dRow.rowsPos--;
      dRow.myRow = mysql_fetch_row(dTbl.myRes);  // this won't work at all...
      Log("TODO: MySql - FieldNameSet");
      return false;
      return true;
   }

   bool ::RowSeek(Row row, const String value, SeekOptions options)
   {
      MySqlRow dRow = (MySqlRow)row.driverData;
      if(options == first || options == reset)
      {
         if(dRow.rowsCount)
         {
            dRow.rowsPos = -1;
            mysql_data_seek(dRow.dTbl.myRes, 0);
            if(options == first)
               row.Next(row);
            return true;
         }
      }
      else if(options == firstEqual)
      {
         dRow.rowsPos = -1;
         mysql_data_seek(dRow.dTbl.myRes, 0);
         while(row.Next(row))
            if(!strcmp(row.stringValue, value))
               return true;
         return false;
      }
      /*else if(options == Last)
      {
         if(dFld.fldsCount)
         {
            dFld.fldsPos = dFld.fldsCount - 1;
            return true;
         }
      }*/
      /*else if(options == null)
      {
         dFld.fldsPos = -1;
         return false;
      }*/
      //Log("TODO: MySql - RowSeek");
      return false;
   }

   String ::RowStringValueGet(Row row)
   {
      char temp[4096];
      MySqlRow dRow = (MySqlRow)row.driverData;
      MySqlTable dTbl = dRow.dTbl;
      MySqlField dFld = dRow.dFld;

      switch(dFld.myFlds[dFld.fldsPos].type)
      {
         case FIELD_TYPE_TINY:
         case FIELD_TYPE_SHORT:
         case FIELD_TYPE_LONG:
         case FIELD_TYPE_INT24:
         case FIELD_TYPE_LONGLONG:
         {
            char temp[32];
            sprintf(temp, "%d", dRow.myRow[dFld.fldsPos]);
            return CopyString(temp);
         }
         case FIELD_TYPE_DECIMAL:
            return CopyString("FIELD_TYPE_DECIMAL");
         case FIELD_TYPE_FLOAT:
            return CopyString("FIELD_TYPE_FLOAT");
         case FIELD_TYPE_DOUBLE:
            return CopyString("FIELD_TYPE_DOUBLE");
         case FIELD_TYPE_TIMESTAMP:
            return CopyString("FIELD_TYPE_TIMESTAMP");
         case FIELD_TYPE_DATE:
            return CopyString("FIELD_TYPE_DATE");
         case FIELD_TYPE_TIME:
            return CopyString("FIELD_TYPE_TIME");
         case FIELD_TYPE_DATETIME:
            return CopyString("FIELD_TYPE_DATETIME");
         case FIELD_TYPE_YEAR:
            return CopyString("FIELD_TYPE_YEAR");
         case FIELD_TYPE_STRING:
            return dRow.myRow[dFld.fldsPos];
         case FIELD_TYPE_VAR_STRING:
            return dRow.myRow[dFld.fldsPos];
         case FIELD_TYPE_BLOB:
            return CopyString("FIELD_TYPE_BLOB");
         case FIELD_TYPE_SET:
            return CopyString("FIELD_TYPE_SET");
         case FIELD_TYPE_ENUM:
            return CopyString("FIELD_TYPE_ENUM");
         case FIELD_TYPE_NULL:
            return CopyString("FIELD_TYPE_NULL");
         //case FIELD_TYPE_CHAR:
         //   return CopyString("FIELD_TYPE_CHAR");
         default:
            return CopyString("DEFAULT");
      }
      //sprintf(temp, "%.*s", (int)dRow.myLengths[dFld.fldsPos], dRow.myRow[dFld.fldsPos] ? dRow.myRow[dFld.fldsPos] : "null");
      /*if(!dFld || dRow.myRow[dFld.fldsPos] == null || !strlen(dRow.myRow[dFld.fldsPos]))
         return null;
      return dRow.myRow[dFld.fldsPos];*/
      //return CopyString(temp);
   }

   bool ::RowStringValueSet(Row row, const String value)
   {
      MySqlRow dRow = (MySqlRow)row.driverData;
      Log("TODO: MySql - RowStringValueSet");
      return false;
   }

}

#endif
