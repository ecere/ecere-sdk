public import "ecere"
public import "CSVParser"

import "timeTools"

public enum ColumnType { null = 1, string = 2, number = 4, floater = 8, date = 12 };
public String columnTypeNames[ColumnType] = { "", "Null", "String", "", "Number", "", "", "", "Float", "", "", "", "Date" };

public class Column : struct
{
   ColumnType type;
   char * s;
   union
   {
      int i;
      float f;
      DateTime d;
   };

   ~Column()
   {
      delete s;
   }
}

public class CSVDataParser : public CSVParser
{
public:
   ColumnType * columnsTypes;
   int rowCount;
   Array<Column> columns { };

   virtual bool OnRow();

   void Process()
   {
      rowCount = 0;
      CSVParser::Process();
   }

   bool OnRowStrings(Array<String> strings)
   {
      bool status = true;
      int c = 0;

      for(s : strings)
      {
         Column column;
         if(s)
         {
            int len;
            char * str;
            buffer.size = strlen(s) * 3 + 1;
            len = ISO8859_1toUTF8(s, buffer.array, buffer.size);
            str = new char[len + 1];
            memcpy(str, buffer.array, len + 1);
            column = Column { s = str };
         }
         else
            column = Column { s = CopyString("") };
         switch(columnsTypes[c])
         {
            case date:
            {
               DateTime d { };
               d.OnGetDataFromString(s);
               column.type = date;
               if(d.month >= january && d.month <= december)
                  column.d = d;
               else
               {
                  ::Print/*Ln*/("bdate"/*"BAD DATE -- FIXME FIXME -- ", s*/);
                  column.d = { };
               }
               break;
            }
            case floater:
               column.type = floater;
               column.f = (float)strtod(s, null);
               break;
            case number:
               column.type = number;
               column.i = strtol(s, null, 10);
               break;
            case null|string:
            case string:
               column.type = string;
               break;
         }
         switch(columnsTypes[c])
         {
            case date:
            case floater:
            case number:
            case null|string:
            case null:
            case string:
               columns.Add(column);
               break;
            default:
               ::PrintLn("WHAT'S GOING ON?", s);
               break;
         }
         if(++c >= options.expectedFieldCount) break;
      }
      rowCount++;
      status = OnRow();
      columns.Free();
      return status;
   }

private:
   Array<char> buffer { minAllocSize = 1024 };
}
