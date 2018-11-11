import "ecere"

import "EDA"

import "commonServeda"

class EDABetterTestForm : Window
{
   text = "EDA Test";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 710, 616 };

   DataSource ds { };
   Database db;
   Table tbl;

   Label groupDrv { this, anchor = { left = 8, top = 8, right = 8 }, size = { h = 60 }, text = "Driver", inactive = false, isGroupBox = true };

   DropBox driver
   {
      groupDrv, this, "Driver", size = { 136, 24 }, position = { 16, 24 };

      bool NotifySelect(DropBox dropBox, DataRow row, Modifiers mods)
      {
         const char * select = row.string;
         if(!strcmp(select, "EDB") || !strcmp(select, "SQLite") || !strcmp(select, "dBASE"))
         {
            char path[MAX_LOCATION];
            GetWorkingDir(path, MAX_LOCATION);
            host.contents = path;
            username.contents = "";
            password.contents = "";
            port.contents = "";
            nameDb.contents = "test";
            nameTbl.contents = "tblone";
            nameFld.contents = "fldone";
            fldDataType.currentRow = fldDataType.firstRow;
            groupDs.disabled = false;
         }
         else if(!strcmp(select, "MemoryEDB"))
         {
            host.contents = "";
            username.contents = "";
            password.contents = "";
            port.contents = "";
            nameDb.contents = "";
            dbCreate.checked = true;
            fldDataType.currentRow = fldDataType.firstRow;
            groupDs.disabled = false;
         }
         else if(!strcmp(select, "PostgreSQL"))
         {
            host.contents = "onreus.ilyeus.hamachi";
            username.contents = "tester";
            password.contents = "test";
            port.contents = "5432";
            nameDb.contents = "testdb";
            nameTbl.contents = "testtbl";
            groupDs.disabled = false;
         }
         else if(!strcmp(select, "MySQL"))
         {
            host.contents = "lyr.dnsalias.com";
            username.contents = "ecere";
            password.contents = "0xartac18";
            port.contents = "3306";
            nameDb.contents = "mysql";
            groupDs.disabled = false;
         }
         else if(!strcmp(select, "Oracle"))
         {
            host.contents = "localhost";
            username.contents = "test";
            password.contents = "test";
            port.contents = "1521";
            nameDb.contents = "xe";
            groupDs.disabled = false;
         }
         else if(!strcmp(select, "Serveda"))
         {
            host.contents = "localhost";
            username.contents = "test";
            password.contents = "test";
            port.contents = servedaPortString;
            nameDb.contents = "test";
            groupDs.disabled = false;
         }
         return true;
      }

      bool OnPostCreate(void)
      {
         //AddField({ "subclass(DataSourceDriver)" });  // won't compile, should be done differently?
         //AddRow().SetData(null, GetDataDriver("EDB"));
         //AddRow().SetData(null, GetDataDriver("MySQL"));

         AddString("EDB");
         AddString("MemoryEDB");
         AddString("MySQL");
         AddString("PostgreSQL");
         AddString("SQLite");
         AddString("SQLiteCipher");
         AddString("Oracle");
         AddString("dBASE");
         SelectRow(AddString("Serveda"));

         return true;
      }
   };

   Label groupDs { this, anchor = { left = 8, top = 76, right = 8 }, size = { h = 60 }, text = "Datasource (Host, Port, Username, Password)", inactive = false, isGroupBox = true, disabled = true };

   EditBox host { groupDs, this, size = { 142, 24 }, position = { 16, 24 } };
   EditBox port { groupDs, this, size = { 70, 24 }, position = { 168, 24 } };
   EditBox username { groupDs, this, size = { 150, 24 }, position = { 264, 24 } };
   EditBox password { groupDs, this, size = { 118, 24 }, position = { 424, 24 } };
   Button openDs
   {
      groupDs, this, text = "Open", position = { 552, 24 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ds.driver = driver.currentRow.string;
         //ds.locator = host.contents;
         ds.host = host.contents;
         ds.port = port.contents;
         ds.user = username.contents;
         ds.pass = password.contents;
         if(ds.Connect())
         {
            groupDrv.disabled = true;
            groupDb.disabled = false;
            host.disabled = true;
            port.disabled = true;
            username.disabled = true;
            password.disabled = true;
            openDs.disabled = true;
            closeDs.disabled = false;
            testDs.disabled = true;

            if(ds.databases)
               for(d : ds.databases)
                  listDatabases.AddString(d);
         }
         return true;
      }
   };
   Button closeDs
   {
      groupDs, this, text = "Close", position = { 598, 24 }, disabled = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ds.driver = null;
         groupDrv.disabled = false;
         groupDb.disabled = true;
         host.disabled = false;
         port.disabled = false;
         username.disabled = false;
         password.disabled = false;
         openDs.disabled = false;
         closeDs.disabled = true;
         testDs.disabled = false;
         return true;
      }
   };
   Button testDs
   {
      groupDs, this, text = "Test", position = { 644, 24 }, disabled = false;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         int c;
         for(c = 0; c < 100; c++)   // still have memory leaks here
         {
            openDs.NotifyClicked(this, openDs, 0, 0, { });
            closeDs.NotifyClicked(this, closeDs, 0, 0, { });
            Update(null);
         }
         return true;
      }
   };


   Label groupDb { this, text = "Database (List, Name)", anchor = { left = 8, top = 152, right = 8 }, size = { h = 120 }, inactive = false, isGroupBox = true, disabled = true };

   ListBox listDatabases
   {
      groupDb, this, size = { 200, 88 }, position = { 16, 24 };

      bool NotifySelect(ListBox listBox, DataRow row, Modifiers mods)
      {
         if(listBox.currentRow)
            nameDb.contents = listBox.currentRow.string;
         return true;
      }

      bool NotifyDoubleClick(ListBox listBox, int x, int y, Modifiers mods)
      {
         if(listBox.currentRow)
         {
            nameDb.contents = listBox.currentRow.string;
            openDb.NotifyClicked(this, openDb, 0, 0, { });
         }
         return true;
      }
   };
   EditBox nameDb { groupDb, this, size = { 200, 24 }, position = { 232, 24 } };
   Button dbCreate { groupDb, this, "Create", size = { 59, 15 }, position = { 232, 52 }, isCheckbox = true };
   Button openDb
   {
      groupDb, this, "Open", position = { 448, 24 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         db = ds.OpenDatabase(nameDb.contents, dbCreate.checked ? create : no);
         if(db)
         {
            groupDs.disabled = true;
            groupTbl.disabled = false;
            listDatabases.disabled = true;
            nameDb.disabled = true;
            dbCreate.disabled = true;
            openDb.disabled = true;
            closeDb.disabled = false;
            deleteDb.disabled = true;
            {
               Table tblTables = db.OpenTable(null, { tablesList });
               if(tblTables)
                  tblTables.GUIListBoxAddRowsField(listTables, "Name");
               delete tblTables;
            }
         }
         return true;
      }
   };
   Button closeDb
   {
      groupDb, this, "Close", position = { 496, 24 }, disabled = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         delete db;
         listTables.Clear();
         groupDs.disabled = false;
         groupTbl.disabled = true;
         listDatabases.disabled = false;
         nameDb.disabled = false;
         dbCreate.disabled = false;
         openDb.disabled = false;
         closeDb.disabled = true;
         deleteDb.disabled = false;
         return true;
      }
   };
   Button deleteDb
   {
      groupDb, this, "Delete", position = { 544, 24 }, disabled = false;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(!ds.DeleteDatabase(nameDb.contents))
            MessageBox { type = ok, master = this, text = "Error", contents = "Undable to delete db" }.Modal();
         return true;
      }
   };

   Label groupTbl { this, text = "Table (List, Name)", anchor = { left = 8, top = 288, right = 8 }, size = { h = 120 }, inactive = false, isGroupBox = true, disabled = true };

   ListBox listTables
   {
      groupTbl, this, size = { 200, 88 }, position = { 16, 24 };

      bool NotifySelect(ListBox listBox, DataRow row, Modifiers mods)
      {
         if(listBox.currentRow)
            nameTbl.contents = listBox.currentRow.string;
         return true;
      }

      bool NotifyDoubleClick(ListBox listBox, int x, int y, Modifiers mods)
      {
         if(listBox.currentRow)
         {
            if(tbl)
               closeTbl.NotifyClicked(this, closeTbl, 0, 0, { });
            nameTbl.contents = listBox.currentRow.string;
            openTbl.NotifyClicked(this, openTbl, 0, 0, { });
         }
         return true;
      }
   };
   EditBox nameTbl { groupTbl, this, size = { 200, 24 }, position = { 232, 24 } };
   Button tblCreate { groupTbl, this, "Create", size = { 59, 15 }, position = { 232, 52 }, isCheckbox = true };
   Button openTbl
   {
      groupTbl, this, "Open", position = { 448, 24 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(tbl)
            closeTbl.NotifyClicked(this, closeTbl, 0, 0, { });
         tbl = db.OpenTable(nameTbl.contents, { type = tableRows, create = tblCreate.checked ? create : no });
         if(tbl)
         {
            /*FieldIndex indexes[2] =
            {
               { tbl.FindField("field1"), ascending },
               { tbl.FindField("field2"), ascending }
            };
            tbl.Index(2, indexes);*/

            groupDb.disabled = true;
            groupFld.disabled = false;
            nameTbl.disabled = true;
            tblCreate.disabled = true;
            openTbl.disabled = true;
            closeTbl.disabled = false;

            if(tblCreate.checked)
            {
               Table tblTables = db.OpenTable(null, { tablesList });
               if(tblTables)
                  tblTables.GUIListBoxAddRowsField(listTables, "Name");
               delete tblTables;
            }
            {
               Table tblFields = db.OpenTable(nameTbl.contents, { fieldsList });
               if(tblFields)
                  tblFields.GUIListBoxAddRowsField(listFields, "Name");
               delete tblFields;
            }

            tableBox.text = tbl.name;
            tbl.GUIListBoxAddFields(tableBox);
            tbl.GUIListBoxAddRows(tableBox);
         }
         return true;
      }
   };
   Button closeTbl
   {
      groupTbl, this, "Close", position = { 496, 24 }, disabled = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         delete tbl;
         listFields.Clear();
         tableBox.Clear();
         tableBox.ClearFields();
         tableBox.text = null;
         groupDb.disabled = false;
         groupFld.disabled = true;
         nameTbl.disabled = false;
         tblCreate.disabled = false;
         openTbl.disabled = false;
         closeTbl.disabled = true;
         return true;
      }
   };

   Label groupFld { this, text = "Fields (List / Properties)", anchor = { left = 8, top = 424, right = 8 }, size = { h = 120 }, inactive = false, isGroupBox = true, disabled = true };

   ListBox listFields { groupFld, this, size = { 200, 88 }, position = { 16, 24 } };
   EditBox nameFld { groupFld, this, size = { 200, 24 }, position = { 232, 24 } };
   DropBox fldDataType
   {
      groupFld, this, "Data Type", size = { 136, 24 }, position = { 448, 24 };

      bool OnPostCreate(void)
      {
         AddField({ class(Class) });
         AddRow().SetData(null, class(Date));
         AddRow().SetData(null, class(double));
         AddRow().SetData(null, class(float));
         AddRow().SetData(null, class(Color));
         AddRow().SetData(null, class(String));
         AddRow().SetData(null, class(int));
         AddRow().SetData(null, class(DateTime));
         AddRow().SetData(null, class(bool));
         return true;
      }
   };
   Button createFld
   {
      groupFld, this, "Create", position = { 600, 24 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(tbl.AddField(nameFld.contents, fldDataType.currentRow.GetData(null), 0))
         {
            Table tblFields = db.OpenTable(nameTbl.contents, { fieldsList });
            if(tblFields)
               tblFields.GUIListBoxAddRowsField(listFields, "Name");
            tbl.GUIListBoxAddFields(tableBox);
            tbl.GUIListBoxAddRows(tableBox);
            delete tblFields;
         }
         return true;
      }
   };

   Button addRow
   {
      this, text = "AddRow", anchor = { left = 10, bottom = 10 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Row row { tbl };
         row.Add();
         delete row;
         tbl.GUIListBoxAddRows(tableBox);
         return true;
      }
   };

   Button find
   {
      this, text = "Find", anchor = { left = 110, bottom = 10 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Row row { tbl };
         /*
         Field field = tbl.FindField("field1");
         String search = "Elephant";
         row.Last();
         // row.Find(field, first, nil, search);
         // row.Find(field, last, nil, search);
         row.Find(field, previous, nil, search);
         row.Find(field, previous, nil, search);
         row.Find(field, previous, nil, search);
         */
         delete row;
         return true;
      }
   };

   ListBox tableBox
   {
      master = this, borderStyle = sizable, anchor = { left = 0, top = 0, right = 0 }, size = { h = 200 }, hasHeader = true, alwaysEdit = true;
      resizable = true, hasHorzScroll = true;

      bool NotifyChanged(ListBox listBox, DataRow listRow)
      {
         if(tbl)
         {
            DataRow curRow = listBox.firstRow;
            Row row { tbl };
            uint64 sysID = 0;

            while(row.Next() && curRow)
            {
               if(curRow == listBox.currentRow)
               {
                  int curField = 0;
                  Field field;
                  sysID = row.sysID;
                  for(field = tbl.firstField; field; field = field.next)
                  {
                     if(curField == listBox.currentField.index)
                     {
                        void * data = listBox.currentRow.GetData(listBox.currentField);
                        ((bool(*)())(void *)row.SetData)(row, field, field.type, data);
                     }
                     curField++;
                  }
               }
               curRow = curRow.next;
            }
            delete row;
            tbl.GUIListBoxAddRows(tableBox);
            if(sysID) tableBox.SelectRow(tableBox.FindRow(sysID));
         }
         return false; //true;
      }
   };
}

EDABetterTestForm betterTest { };
EDATestApp app;

class EDATestApp : GuiApplication
{
   bool Init()
   {
      app = this;
      DumpErrors(false);
      SetLoggingMode(stdOut, null);
      return true;
   }
}
