#ifdef ECERE_STATIC
public import static "ecere"
public import static "EDA"
#else
public import "ecere"
public import "EDA"
#endif

class DBFHeaderVersion : char
{
public:
   int version:3;
   bool memoFile:1;
   bool bit4:1;
   bool bit5:1;
   bool bit6:1;
   bool dBASE_MemoFile:1;
}

struct DBFHeader
{
   DBFHeaderVersion version;
   char updateTime[3];
   int rowsCount;
   short headerLength;
   short recordLength;
   char reservedField[2];
   char transaction;
   char encryption;
   char reservedField1[12];
   char production;
   char languageDriverID;
   char reservedField2[2];
};

struct DBFFieldInfo
{
   char name[11];
   char type;
   char reservedField[4];
   byte length;
   char decimalCount;
   char reservedField2[2];
   char workAreaID;
   char reservedField3[10];
   char productionFlag;
};

struct Value // TODO: get rid of this, just use a data pointer array for "values"
{
   char dataType;
   String string;
   double doubleValue;
};

define driverName = "dBASE";
class dBaseDataSource : DirFilesDataSourceDriver
{
   class_property(name) = driverName;
   class_property(databaseFileExtension) = "dbf"; // TODO: comment this <-- temporary
   class_property(tableFileExtension) = "dbf";

   bool IsDatabaseFile(const char *fullPath)
   {
      if(FileExists(fullPath).isDirectory)
      {
         char ext[MAX_EXTENSION];
         FileListing listing { fullPath, databaseFileExt };
         if(databaseFileExt)
            GetExtension(fullPath, ext);
         if(!databaseFileExt || !strcmp(ext, databaseFileExt))
         {
            while(listing.Find())
            {
               if(listing.stats.attribs.isFile)
                  return true;
            }
         }
      }
      return false;
   }

   /*String MakeDatabasePath(const String name)
   {
      if(name)
      {
         char dbPath[MAX_LOCATION];
         char *ext = databaseFileExt ? databaseFileExt : "";
         char *fileName = new char[strlen(name)+strlen(ext)+8];
         strcpy(dbPath, path ? path : "");
         strcpy(fileName, name);
         if(*ext)
            ChangeExtension(fileName, ext, fileName);
         PathCat(dbPath, fileName);
         return CopyString(dbPath);
      }
      return null;
   }*/

   Database OpenDatabase(const String name, CreateOptions createOptions, DataSource ds)
   {
      dBaseDatabase db = null;
      if(name && name[0])
      {
         String path = MakeDatabasePath(name);
         FileAttribs attribs = FileExists(path);
         if(!attribs && createOptions == create)
         {
            MakeDir(path);
            attribs = FileExists(path);
            /*if(attribs.isDirectory)
               databasesCount++;*/
         }
         if(attribs.isDirectory)
            db = { dds = this, path = CopyString(path) };
         else if(createOptions == create)
            Logf($"Database directory (%s) could not be created.\n", path);
         else
            Logf($"Database directory (%s) could not be opened.\n", path);
         delete path;
      }
      return db;
   }
}

class DBTable : struct
{
   DBTable prev, next;
   String apath; // TODO: find and replace all apath by path
   File f;
   int pos;
   LinkList<dBaseField> fields { };

   DBFHeader header;
   int deletedRowsCount;

   //DBTable fieldsTable;

   ~DBTable()
   {
      delete apath;
      delete f;
   }

   void Free() { delete this; }

   bool Open()
   {
      bool result = false;
      delete f;
      f = FileOpen(apath, read); // use of a buffered file?
      if(f)
      {
         uint fileSize = f.GetSize();
         if(fileSize > sizeof(DBFHeader))
         {
            f.Read(&header, sizeof(DBFHeader), 1);
#if 0
            bigEndian = determineEndian();
            if(bigEndian) reverseEndian(SHORT_SIZE, &(header.headerLength));
            if(bigEndian) reverseEndian(SHORT_SIZE, &(header.recordLength));
            if(bigEndian) reverseEndian(INT_SIZE, &(header.rowsCount));
#endif
            if(fileSize >= (header.headerLength + header.recordLength) && (header.headerLength > sizeof(DBFHeader) + 1))
            {
               int activeRowsCount = 0;
               int i, fieldsCount = (header.headerLength - sizeof(DBFHeader) - 1) / sizeof(DBFFieldInfo);
               char c;
               for(i=0; i<fieldsCount; i++)
               {
                  dBaseField fld { tbl = this, n = i };
                  incref fld;
                  fld.Read();
                  fields.Add(fld);
               }
               f.Seek(header.headerLength, start);
               for(;;)
               {
                  f.Getc(&c);
                  if(c == ' ')
                     activeRowsCount++;
                  else if(c == '*')
                     deletedRowsCount++;
                  else if(c == 26)
                  {
                     f.Getc(&c);
                     if(!f.eof)
                        PrintLn(driverName, ": There is data past the end of file marker in the ", apath, " table file.");
                     break;
                  }
                  else
                     PrintLn(driverName, ": There appears to be some corruption among the records of the ", apath, " table file.");
                  f.Seek(header.recordLength-1, current);
                  if(f.eof)
                  {
                     PrintLn(driverName, ": It seems the ", apath, " table file is truncated.");
                     break;
                  }
               }
               if(activeRowsCount != header.rowsCount - deletedRowsCount)
                  PrintLn(driverName, ": A bad rocords count is stored in the ", apath, " table file.");
               f.Seek(header.headerLength, start);
               result = true;
            }
         }
         else
            delete f;
      }
      return result;
   }

public:
   dBaseDatabase db;
}

class dBaseDatabase : Database
{
   dBaseDataSource dds;
   String path;
   OldList dbTables;
   Array<String> tables { };
#if 0
   uint tablesCountPosition;
#endif

   ~dBaseDatabase()
   {
      dbTables.RemoveAll(DBTable::Free);
      delete path;
      tables.Free();
   }

   String GetName()
   {
      return path; // TOFIX
   }

   Array<String> GetTables()
   {
      UpdateTablesList();
      return tables;
   }

   void UpdateTablesList()
   {
      FileListing listing { path, dds.tableFileExt };
      tables.Free();
      while(listing.Find())
      {
         if(listing.stats.attribs.isFile)
         {
            const char * ext = dds.tableFileExt;
            char * fileName = CopyString(listing.name);
            if(ext && *ext)
            {
               char fileExt[MAX_EXTENSION];
               GetExtension(fileName, fileExt);
               if(!strcmp(fileExt, ext))
                  StripExtension(fileName);
            }
            tables.Add(fileName);
         }
      }
   }

   DBTable GetDBTable(char * apath, OpenOptions options)
   {
      DBTable dbTbl { };
      for(dbTbl = dbTables.first; dbTbl; dbTbl = dbTbl.next)
         if(!fstrcmp(apath, dbTbl.apath))
            break;
      if(!dbTbl)
      {
         if(FileExists(apath).isFile)
         {
            dbTbl = DBTable { this, apath = CopyString(apath) };
            dbTbl.Open();
            dbTables.Add(dbTbl);
         }

         if(options.type == tablesList)
         {
#if 0
            dbTbl.fields.Add(dBaseField
               {
                  tbl = dbTbl,
                  name = CopyString("Name"),
                  type = class(String),
                  length = 0,
                  num = 1
               });
#endif
         }
         else if(options.type == fieldsList)
         {
#if 0
            dbTbl.fields.Add(dBaseField
               {
                  tbl = dbTbl,
                  name = CopyString("Name"),
                  type = class(String),
                  length = 0,
                  num = 1
               });
            dbTbl.fields.Add(dBaseField
               {
                  tbl = dbTbl,
                  name = CopyString("Type"),
                  type = class(Class),
                  length = 0,
                  num = 2
               });
            dbTbl.fields.Add(dBaseField
               {
                  tbl = dbTbl,
                  name = CopyString("Length"),
                  type = class(int),
                  length = 0,
                  num = 3
               });
#endif
         }
         else
         {
            //int num, rowsCount, deletedRowsCount;
            //DBTable fieldsTable = dbTbl.fieldsTable;
            //if(!fieldsTable) fieldsTable = dbTbl.fieldsTable = GetDBTable(dbTbl.apathFields, { fieldsList });
            //RowsCountFileEdit(archive, dbTbl.apathFields, init, &rowsCount, &deletedRowsCount, &dbTbl.fieldsTable.rowsCountPosition /-*fieldsCountPosition*-/);

            /*for(num = 1; num <= rowsCount; num++)          // TOFIX in future a field position might have been deleted
            {
               dBaseField fld { tbl = dbTbl, num = num };
               incref fld;
               fld.Read();
               dbTbl.fields.Add(fld);
            }*/
         }
      }
      return dbTbl;
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
      dBaseTable tbl = null;
      char apath[MAX_LOCATION] = "";
      switch(options.type)
      {
         case tableRows:
            if(name)
            {
               const char *ext = dds.tableFileExt;
               strcpy(apath, path ? path : "");
               if(ext && *ext)
               {
                  char *fileName = new char[strlen(name)+strlen(ext)+8];
                  char nameExt[MAX_EXTENSION];
                  GetExtension(name, nameExt);
                  strcpy(fileName, name);
                  if(!nameExt[0] || strcmp(nameExt, ext))
                  {
                     strcat(fileName, ".");
                     strcat(fileName, ext);
                  }
                  PathCat(apath, fileName);
                  delete fileName;
               }
               else
                  PathCat(apath, name);
               /*if(FileExists(tablePath).isFile)
               {
                  tbl = { db = this, apath = tablePath };
               }*/
            }
            break;
         case viewRows:
            break;
         case processesList:
            break;
         case databasesList:
            break;
         case queryRows:
            break;
         case tablesList:
            break;
         case fieldsList:
            break;
      }

      if(apath[0])
      {
         DBTable dbTable = GetDBTable(apath, options);
         if(dbTable)
         {
            tbl = dBaseTable { dbTable = dbTable };
            LinkTable(tbl);
         }
      }
      return tbl;
   }
}

class dBaseTable : Table
{
   DBTable dbTable;
   //DBIndex index;

   Field FindField(const String name)
   {
      for(fld : dbTable.fields)
         if(!strcmp(fld.name, name))
            return fld;
      return null;
   }

   Field GetFirstField()
   {
      return dbTable.fields.first;
   }

   DriverRow CreateRow()
   {
      return dBaseRow { tbl = dbTable/*, index = index*/, num = 0 };
   }

   const String GetName()
   {
      return dbTable.apath;
   }

   uint GetFieldsCount()
   {
      return dbTable.fields.count;
   }

   uint GetRowsCount()
   {
      return dbTable.header.rowsCount - dbTable.deletedRowsCount;
   }

   Container<Field> GetFields()
   {
      return (Container<Field>)dbTable.fields;
   }
}

class dBaseField : Field
{
   DBTable tbl;
   int n;
   DBFFieldInfo info;
   Class type;
   // public LinkElement<dBaseField> link;

   const String GetName()   { return info.name; }
   Class  GetType()   { return type; }
   int    GetLength() { return info.length; }
   Field  GetNext()   { return next; }
   Field  GetPrev()   { return prev; }
   Table  GetTable()  { return (Table)tbl; }

   void Read()
   {
      tbl.f.Read(&info, sizeof(DBFFieldInfo), 1);
      switch(info.type)
      {
         case 'C': // Char
            type = class(String);
            break;
         case 'N': // Number
            type = class(int);
            break;
         case 'D': // Date
            type = class(Date);
            break;
         case 'L': // Logic
            type = class(bool);
            break;
         case 'F': // Float -- Really?
            type = class(float);
            break;
         case 'G': // General
         case 'M': // Memo
         case 'B': // Binary
            PrintLn(driverName, ": Field type (", info.type, ") not supported yet");
            //type = class(byte *);
            break;
         default:
            PrintLn(driverName, ": Unknown field type (", info.type, ")");
      }
   }

   void Write()
   {
   }

   void Free() { delete this; }
}

class dBaseRow : DriverRow
{
   DBTable tbl;
   // DBIndex index;
   BTNode node;

   int num;

   Value *values;

   ~dBaseRow()
   {
      delete values;
   }

   bool GetData(dBaseField field, typed_object & data)
   {
      Class c = *data._class; // TOFIX: The '*' should not be required here
      if(eClass_IsDerived(c, class(String)))
      {
         *(char **)data = CopyString(values[field.n].string);
         return true;
      }
      else
      {
         switch(field.info.type)
         {
            //case 'B':
            //case 'G':
            //case 'M':
            case 'D':
               if(values[field.n].string[0])
               {
                  int year, month, day;
                  Date date { };
                  String s = CopyString(values[field.n].string);
                  day = atoi(s+6);   *(s+6) = '\0';
                  month = atoi(s+4); *(s+4) = '\0';
                  year = atoi(s);
                  delete s;
                  if(year >= 1970 && month >= 1 && month <= 12 && day >= 1 && day <= 31)
                  {
                     date.year = year;
                     date.month = (Month)(month-1);
                     date.day = day;
                     *(Date *)data = date;
                  }
                  else
                  {
                     PrintLn(driverName, ": Invalid date(", values[field.n].string, ")");
                     return false;
                  }
               }
               else
                  *(Date *)data = Date { };
               return true;
            //case 'C':
            //case 'L': // TODO: Support Logical
            //case 'F': // TODO: Support Numbers
            case 'N':
               if(eClass_IsDerived(c, class(double))/* <-- this doesn't work!! (class Currency : double) work around --> */ || !strcmp(data._class.name, "Currency"))
                  *(double *)data = values[field.n].string[0] ? atof(values[field.n].string) : 0;
               else if(eClass_IsDerived(c, class(float)))///* <-- this doesn't work!! (class Currency : double) work around --> */ || !strcmp(data._class.name, "Currency"))
                  *(float *)data = values[field.n].string[0] ? (float)atof(values[field.n].string) : 0;
               else
               {
                  PrintLn(driverName, ": Data type (", data._class, ") for field type (", field.info.type, ") not supported yet");
                  return false;
               }
               return true;
            default:
               PrintLn(driverName, ": Field type (", field.info.type, ") not supported yet");
               return false;
         }
      }
   }

   bool Nil()
   {
      return !num;
   }

   bool Select(MoveOptions move)
   {
      if(tbl.header.rowsCount)
      {
         switch(move)
         {
            case first:
               ResetPosition();
            case next:
               for(;;)
               {
                  if(num < tbl.header.rowsCount)
                  {
                     char c = 0;
                     tbl.f.Getc(&c);
                     if(c == ' ')
                     {
                        ReadRecord();
                        return true;
                     }
                     else if(c == '*')
                     {
                        tbl.f.Seek(tbl.header.recordLength-1, current);
                        num++;
                     }
                     else
                        break;
                  }
                  else if(num == tbl.header.rowsCount)
                  {
                     ResetPosition();
                     break;
                  }
               }
               break;
            case last:
            case previous:
            case middle:
               // Not supported. Forward only.
               break;
            case nil:
               num = 0;
               break;
         }
      }
      return false;
   }

   void ResetPosition()
   {
      num = 0;
      tbl.f.Seek(tbl.header.headerLength, start);
   }

   void ReadRecord()
   {
      char * data;
      if(!values)
         values = new Value[tbl.fields.count];
      for(f : tbl.fields)
      {
         int len = f.length;
         if(len > 0 && len < 1024)
         {
            data = new char[len+1];
            tbl.f.Read(data, 1, len);
            data[len] = '\0';
            switch(f.info.type)
            {
               case 'B':
               case 'G':
               case 'M':
               case 'D':
               case 'C':
                  if(!UTF8Validate(data))
                  {
                     char * temp = new char[len*2];
                     ISO8859_1toUTF8(data, temp, len*2);
                     delete data;
                     data = renew temp char[strlen(temp)+1];
                  }
                  TrimLSpaces(data, data);
                  TrimRSpaces(data, data);
                  values[f.n].string = data;
                  break;
               case 'L':
               case 'F':
               case 'N':
                  TrimLSpaces(data, data);
                  TrimRSpaces(data, data);
                  values[f.n].string = CopyString(data);
                  if(values[f.n].string)
                     values[f.n].doubleValue = atof(values[f.n].string);
                  else
                     values[f.n].doubleValue =-1;
                  break;
            }
         }
         else
            PrintLn(driverName, ": Field length (", len, ") outside of valid range (1-1023)");
      }
      num++;
   }

   bool Find(dBaseField field, MoveOptions move, MatchOptions match, typed_object data)
   {
      return false;
   }

   bool FindMultiple(FieldFindData * findData, MoveOptions move, int numFields)
   {
      return false;
   }

   bool Synch(DriverRow to)
   {
      return false;
   }

   bool Add(uint64 id)
   {
      return false;
   }

   bool Delete()
   {
      return false;
   }

   int GetSysID()
   {
      return num;
   }

   bool GoToSysID(int id)
   {
      return false;
   }
}
