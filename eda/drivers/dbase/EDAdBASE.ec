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

static define driverName = "dBASE";
public class dBaseDataSource : DirFilesDataSourceDriver
{
   class_property(name) = driverName;
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
               {
                  listing.Stop();
                  return true;
               }
            }
         }
      }
      return false;
   }

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

class dBaseRow : DriverRow
{
   dBaseTable tbl;
   int id;  // 0 when null, 1 based index
   int maxID;

   virtual bool ReadRecord() { return true; }

   bool Find(dBaseField field, MoveOptions move, MatchOptions match, typed_object data)
   {
      // TODO: DBF indexing?
      bool result = false;
      int i;
      FieldValue dataValue { };
      switch(field.info.type)
      {
         case 'B': case 'G': case 'M': case 'C': case 'D': dataValue = { s = (String)data, type = { text    } }; break;
         case 'I': case '+': case 'L':                     dataValue = { i = (int)   data, type = { integer } }; break;
         case 'F': case 'O': case '@':                     dataValue = { r = (double)data, type = { real    } }; break;
         case 'N':
            if(field.info.decimalCount)
               dataValue = { r = (double) data, type = { real } };
            else
               dataValue = { i = (int)    data, type = { integer } };
            break;
      }
      for(i = 1; i <= maxID && !result; i++)
      {
         FieldValue v { };
         if(GoToSysID(i) && GetDataFieldValue(field, v) && !v.OnCompare(dataValue))
            result = true;
         if(v.type == { text, mustFree = true })
            delete v.s;
      }
      return result;
   }
   bool FindMultiple(FieldFindData * findData, MoveOptions move, int numFields) { return false; }
   bool Synch(DriverRow to) { return false; }
   bool Add(uint64 id) { return false; }
   bool Delete() { return false; }
   int GetSysID() { return id; }
   bool GoToSysID(int id)
   {
      if(this.id == id) return true;
      if(id > 0 && id <= maxID)
      {
         this.id = id;
         if(ReadRecord()) return true;
      }
      this.id = 0;
      return false;
   }
   bool Nil() { return !id; }
   bool Select(MoveOptions move)
   {
      if(maxID)
      {
         switch(move)
         {
            case first: id = -1;
            case next: while(++id <= maxID) if(ReadRecord()) return true; break;
            case last: id = maxID + 1;
            case previous: while(--id > 0) if(ReadRecord()) return true; break;
            case middle: id = (maxID+1)/2; if(ReadRecord()) return true; break;
            case nil: break;
         }
      }
      id = 0;
      return false;
   }
}

class dBaseTablesListRow : dBaseRow
{
   Array<String> tables;

   bool GetData(dBaseField field, typed_object & data)
   {
      if(id)
      {
         *(String *)data = CopyString(tables[id-1]);
         return true;
      }
      *(String *)data = null;
      return false;
   }
}

class dBaseFieldsListRow : dBaseRow
{
   Array<dBaseField> fields;

   bool GetData(dBaseField field, typed_object & data)
   {
      if(id)
      {
         switch(field.n)
         {
            case 0: *(String *)data = CopyString(fields[id-1].info.name); break;
            case 1: *(Class *)data = fields[id].type; break;
            case 2: *(int *)data = fields[id].info.length * 8; break;   // Length is in pixels?
            default: return false;
         }
         return true;
      }
      switch(field.n)
      {
         case 0: *(String *)data = null; break;
         case 1: *(Class *)data = null; break;
         case 2: *(int *)data = 0; break;
      }
      return false;
   }
}

class dBaseTable : Table
{
   OpenType tblType;
   String apath;
   File f;
   Array<dBaseField> fields { };
   int recordSize;
   bool isUTF8;
   DBFHeader header;
   int deletedRowsCount;

   Field FindField(const String name)
   {
      for(fld : fields)
         if(!strcmp(fld.name, name))
            return fld;
      return null;
   }

   Field GetFirstField()
   {
      return fields.count ? fields[0] : null;
   }

   DriverRow CreateRow()
   {
      switch(tblType)
      {
         case tableRows:  return dBaseTableRow { tbl = this, data = new byte[recordSize], maxID = header.rowsCount  };
         case tablesList:
         {
            Array<String> tables = db.GetTables();
            return dBaseTablesListRow { tbl = this, tables = tables, maxID = tables.count };
         }
         case fieldsList:
         {
            dBaseTable tbl = db.GetDBTable(apath, { tableRows });
            Array<dBaseField> fields = (Array<dBaseField>)tbl.fields;
            return dBaseFieldsListRow { tbl = tbl, fields = fields, maxID = fields.count };
         }
      }
      return null;
   }

   const String GetName()
   {
      return apath;
   }

   uint GetFieldsCount()
   {
      return fields.count;
   }

   uint GetRowsCount()
   {
      return header.rowsCount - deletedRowsCount;
   }

   Container<Field> GetFields()
   {
      return (Container<Field>)fields;
   }

   uint GetRecordSize()
   {
      return recordSize;
   }

   ~dBaseTable()
   {
      fields.Free();
      delete apath;
      delete f;
   }

   void Free() { delete this; }

   bool Open()
   {
      bool result = false;
      delete f;
      f = FileOpenBuffered(apath, read);
      if(f)
      {
         FileSize64 fileSize = f.GetSize();
         if(fileSize > (FileSize64)sizeof(DBFHeader)) // TOFIX: fix this warning
         {
            char encodingFile[MAX_LOCATION];
            // Encoding File
            ChangeExtension(apath, "cpg", encodingFile);

            // Check encoding
            {
               File f = FileOpen(encodingFile, read);
               if(f)
               {
                  char encoding[256];
                  if(f.GetLine(encoding, sizeof(encoding)) && (!strcmpi(encoding, "UTF-8") || !strcmpi(encoding, "UTF8")))
                     isUTF8 = true;
                  delete f;
               }
            }

            f.Read(&header, sizeof(DBFHeader), 1);
#if 0
            bigEndian = determineEndian();
            if(bigEndian) reverseEndian(sizeof(short), &header.headerLength);
            if(bigEndian) reverseEndian(sizeof(short), &header.recordLength);
            if(bigEndian) reverseEndian(sizeof(int),   &header.rowsCount);
#endif

            recordSize = header.recordLength-1;
            if(fileSize >= (header.headerLength + header.recordLength) && (header.headerLength > sizeof(DBFHeader) + 1))
            {
               int activeRowsCount = 0;
               int i, fieldsCount = (header.headerLength - sizeof(DBFHeader) - 1) / sizeof(DBFFieldInfo);
               uint offset = 0;
               fields.size = fieldsCount;
               for(i = 0; i < fieldsCount; i++)
               {
                  dBaseField fld { tbl = this, n = i };
                  incref fld;
                  f.Read(&fld.info, sizeof(DBFFieldInfo), 1);
                  fld.type = dbfType(fld.info.type);
                  if(fld.info.type == 'N' && fld.info.decimalCount) fld.type = class(double);
                  fld.offset = offset;
                  fields[i] = fld;
                  offset += fld.info.length;
               }
               i = 0;
               f.Seek(header.headerLength, start);
               // TOCHECK: Potential performance issue reading tons of rows at startup?
               while(i < header.rowsCount)
               {
                  char c = 0;
                  if(!f.Getc(&c))
                  {
                     // dBASE level 5 does not seem to have this marker...
                     //PrintLn(driverName, ": It seems the ", apath, " table file is truncated.");
                     break;
                  }
                  if(c == ' ')
                     activeRowsCount++;
                  else if(c == '*')
                     deletedRowsCount++;
                  else if(c == 26)
                  {
                     if(f.Getc(&c))
                        PrintLn(driverName, ": There is data past the end of file marker in the ", apath, " table file.");
                     break;
                  }
                  else
                     PrintLn(driverName, ": There appears to be some corruption among the records of the ", apath, " table file.");
                  f.Seek(header.recordLength-1, current);
                  i++;
               }
               if(activeRowsCount != header.rowsCount - deletedRowsCount)
                  PrintLn(driverName, ": A bad records count is stored in the ", apath, " table file.");
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
   Map<String, dBaseTable> dbTables { };
   Array<String> tables { };

   ~dBaseDatabase()
   {
      dbTables.Free();
      delete path;
      tables.Free();
   }

   String GetName()
   {
      return path; // TOFIX
   }

   Array<String> GetTables()
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
      return tables;
   }

   dBaseTable GetDBTable(char * apath, OpenOptions options)
   {
      if(options.type == tableRows && FileExists(apath).isFile)
      {
         MapIterator<String, dBaseTable> it { map = dbTables };
         if(!it.Index(apath, true))
         {
            dBaseTable dbTbl { tblType = tableRows, apath = CopyString(apath) };
            incref dbTbl;
            dbTbl.Open();
            it.data = dbTbl;
            return dbTbl;
         }
         return it.data;
      }
      else if(options.type == tablesList && FileExists(apath).isDirectory)
      {
         dBaseTable dbTbl { tblType = tablesList, db = this, apath = CopyString(apath) };
         dBaseField field { type = class(String) };
         incref dbTbl;
         strcpy(field.info.name, "Name");
         dbTbl.fields.Add(field);
         return dbTbl;
      }
      else if(options.type == fieldsList)
      {
         dBaseTable dbTbl { tblType = fieldsList, db = this, apath = CopyString(apath) };
         dBaseField fldName { n = 0, type = class(String) };
         dBaseField fldType { n = 1, type = class(Class) };
         dBaseField fldLen  { n = 2, type = class(int) };
         incref dbTbl;
         strcpy(fldName.info.name, "Name");
         dbTbl.fields.Add(fldName);

         strcpy(fldType.info.name, "Type");
         dbTbl.fields.Add(fldType);

         strcpy(fldLen.info.name, "Length");
         dbTbl.fields.Add(fldLen);
         return dbTbl;
      }
      return null;
   }

   Table OpenTable(const String name, OpenOptions options)
   {
      dBaseTable tbl = null;
      if(name || options.type == tablesList)
      {
         char apath[MAX_LOCATION];
         const char *ext = dds.tableFileExt;
         strcpy(apath, path ? path : "");
         if(name)
         {
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
         }
         if(apath[0])
         {
            tbl = GetDBTable(apath, options);
            if(tbl)
            {
               incref tbl;
               LinkTable(tbl);
            }
         }
      }
      return tbl;
   }
}

private static inline Class dbfType(char ch)
{
   switch(ch)
   {
      case 'B': case 'G': case 'M': PrintLn(driverName, ": no .DBT support for type (", ch, ")");
      case 'C': return class(String);
      // NOTE: Treating 'N' as a float if decimal count is non-zero (handled outside)
      case 'N': case 'I': case '+': return class(int);
      case 'F': case 'O': return class(double);
      case 'D': return class(Date);
      case 'L': return class(bool);
      case '@': return class(SecSince1970);
   }
   PrintLn(driverName, ": Unknown field type (", ch, ")");
   return class(String);
}

class dBaseField : Field
{
   dBaseTable tbl;
   int n;
   DBFFieldInfo info;
   Class type;
   uint offset;

   const String GetName()   { return info.name; }
   Class  GetType()   { return type; }
   int    GetLength() { return info.length; }
   Field  GetNext()   { Array<dBaseField> fields = (Array<dBaseField>)*&tbl.fields; return n < fields.count-1 ? fields[n+1] : null; }
   Field  GetPrev()   { Array<dBaseField> fields = (Array<dBaseField>)*&tbl.fields; return n > 0 ? fields[n-1] : null; }
   Table  GetTable()  { return (Table)tbl; }

   void Free() { delete this; }
}

class dBaseTableRow : dBaseRow
{
   File f;
   byte * data;

   ~dBaseTableRow()
   {
      delete data;
   }

   // Reference: http://www.dbase.com/KnowledgeBase/int/db7_file_fmt.htm
   private static inline bool _GetData(dBaseField field, typed_object & data)
   {
      bool result = false;
      if(id)
      {
         char fldData[1024];
         uint fSize = field.length;
         memcpy(fldData, this.data + field.offset, fSize);
         fldData[fSize] = 0;

         switch(field.info.type)
         {
            // *** Types stored as strings... ***
            case 'B': // Binary (.DBT block number)
            case 'G': // OLE (.DBT block number)
            case 'M': // Memo (.DBT block number)
               TrimLSpaces(fldData, fldData);
               TrimRSpaces(fldData, fldData);
               if(fldData[0])
               {
                  *(String *)data = CopyString(fldData);
                  PrintLn(driverName, ": .DBT support not implemented");
                  result = true;
               }
               break;
            case 'C': // Strings
               TrimLSpaces(fldData, fldData);
               TrimRSpaces(fldData, fldData);
               if(fldData[0])
               {
                  // Assume ISO8859-1 Encoding
                  if(!tbl.isUTF8 || !UTF8Validate(fldData))
                  {
                     char utf8[1024];
                     ISO8859_1toUTF8(fldData, utf8, sizeof(utf8));
                     *(String *)data = CopyString(utf8);
                  }
                  else
                     *(String *)data = CopyString(fldData);
                  result = true;
               }
               break;
            case 'D': // Dates (as YYYYMMDD strings)
               if(fldData[0])
               {
                  int day, month, year;
                  day = atoi(fldData+6); fldData[6] = '\0';
                  month = atoi(fldData+4); fldData[4] = '\0';
                  year = atoi(fldData);
                  if(year /*>= 1970*/ && month >= 1 && month <= 12 && day >= 1 && day <= 31)
                  {
                     *(Date *)data = { year, (Month)(month-1), day };
                     result = true;
                  }
                  else
                     PrintLn(driverName, ": Invalid date(", fldData, ")");
               }
               break;
            case 'L':  // Logical (true or false)
               *(int64 *)data = fldData[0] == 'T';
               result = fldData[0] == 'T' || fldData[0] == 'F';
               break;
            case 'N': // Numbers (as strings)
            {
               if(!field.info.decimalCount)
               {
                  char * p;
                  *(int64 *)data = strtoll(fldData, &p, 10);
                  result = p > fldData; // Why do we have **** for 0?
                  break;
               }
               // Fall-through: decimals...
            }
            case 'F': // Floats (as strings)
            {
               char * p;
               *(double *)data = strtod(fldData, &p);
               if(p > fldData && !(*(double *)data).isNan)
                  result = true;
               break;
            }
            // *** Types stored in binary... ***
            case '@': // Timestamp  8 bytes - two longs, first for date, second for time.  The date is the number of days since  01/01/4713 BC. Time is hours * 3600000L + minutes * 60000L + Seconds * 1000L
            {
               #define DAYS_FROM_4713BC_TO_1970 2440588
               uint date, time;
               memcpy(&date, (uint *)fldData, 4);
               memcpy(&time, (uint *)(fldData + 4), 4);
               *(SecSince1970 *)data = (SecSince1970) (((int64)date - DAYS_FROM_4713BC_TO_1970) * 24*60*60 + time / 1000);   // No ms support for now...
               result = true;
               break;
            }
            case 'I':  // Integer: 4 bytes. Leftmost bit used to indicate sign, 0 negative.
            case '+':  // (Autoincrement)
            {
               int * iPtr = (int *)fldData;
               *(int64 *)data = *iPtr;
               result = true;
               break;
            }
            case 'O': // double
            {
               double * dPtr = (double *)fldData;
               *(double *)data = *dPtr;
               if(!(*(double *)data).isNan)
                  result = true;
               break;
            }
            default:
               PrintLn(driverName, ": Field type (", field.info.type, ") not supported yet");
         }
      }
      return result;
   }

   bool ReadRecord()
   {
      File f = tbl.f;
      uint recordSize = tbl.recordSize;
      char recState = 0;
      return f.Seek(tbl.header.headerLength + (id-1) * (1+recordSize), start) &&
             f.Getc(&recState) && recState == ' ' &&
             f.Read(data, 1, recordSize) == recordSize;
   }

   const void * GetRowData() { return id ? data : null; }

   bool GetData(dBaseField field, typed_object & data) { return _GetData(field, data); }

   // To return as FieldValue
   bool GetDataFieldValue(dBaseField field, FieldValue value)
   {
      value = { { nil } };
      if(id)
      {
         switch(field.info.type)
         {
            case 'B': case 'G': case 'M': case 'C': if(_GetData(field, value.s)) value.type = { text, true }; break;
            case 'I': case '+': case 'L': if(_GetData(field, value.i)) value.type = { integer }; break;
            case 'N':
               if(!field.info.decimalCount)
               {
                  if(_GetData(field, value.i))
                     value.type = { integer };
                  break;
               }
               // fall-through: decimals...
            case 'F': case 'O':                     if(_GetData(field, value.r)) value.type = { real }; break;
            // TODO: Should probably support additional types, at least dates?
            case 'D': // Dates (as YYYYMMDD strings)
            {
               char date[9];
               memcpy(date, data + field.offset, Min(8, field.length));
               date[8] = 0;
               if(date[0])
                  value = { { text, true }, s = CopyString(date) };
               break;
            }
            case '@': // Timestamp  8 bytes - two longs, first for date, second for time.  The date is the number of days since  01/01/4713 BC. Time is hours * 3600000L + minutes * 60000L + Seconds * 1000L
            {
               SecSince1970 t;
               if(_GetData(field, &t))
                  value = { { real }, r = t }; // Returning time stamps in double for now (watch out for bad precision)
               break;
            }
         }
      }
      return value.type.type != nil;
   }
}
