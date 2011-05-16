public import "ecere"

import "timeTools"

enum ColumnType { null = 1, string = 2, number = 4, floater = 8, date = 12 };
String columnTypeNames[ColumnType] = { "", "Null", "String", "", "Number", "", "", "", "Float", "", "", "", "Date" };

class Column : struct
{
   ColumnType type;
   union
   {
      char * s;
      int i;
      float f;
      DateTime d;
   };

   ~Column()
   {
      if(type == string) delete s;
   }
}

class CommaSeparatedProcessor
{
public:
   void * userData;
   char * filePath;
   char fieldSeparator;
   char valueQuotes;
   int expectedFieldCount;
   int newLineCharCount;
   uint lineNum;
   uint charNum;
   uint rowNum;
   uint fieldNum;
   bool checkNulls;
   bool checkCurlies;
   fieldSeparator = ',';
   valueQuotes = '\"';
   checkNulls = true;
   checkCurlies = true;

   void Process(File f)
   {
      //bool isHeader = true;
      bool stop = false;
      //int rowCount = 0;
      newLineCharCount = 0;
      rowNum = 1;
      lineNum = 1;
      charNum = 1;

      if(f)
      {
         char buffer[4096];
         Array<char> dynamicBuffer { minAllocSize = 4096 };
         bool quoted = false;
         int curlyCount = 0;
         int otherCurlyCount = 0;
         Array<String> values { };
         char pch, ch = '\0';
         
         fieldNum = 1;

         while(!f.Eof() && !stop)// && rowNum < 1000)
         {
            int readCount = f.Read(buffer, 1, sizeof(buffer));
            if(readCount)
            {
               int c, start, rowStart, lineEnd;
               for(c=start=rowStart=0,lineEnd=-1; c<readCount; c++,charNum++)
               {  
                  bool lastChar = c+1 == readCount && f.Eof();
                  pch = ch;
                  ch = buffer[c];
                  /*if(lineNum == 3982)
                     PrintLn("HERE");*/
                  if(ch == '{')
                  {
                     if(lineEnd > -1)
                        otherCurlyCount++;
                     else
                        curlyCount++;
                  }
                  else if(ch == '}')
                  {
                     if(lineEnd > -1)
                        otherCurlyCount++;
                     else
                        curlyCount--;
                  }
                  else if(ch == fieldSeparator || lastChar)
                  {
                     bool newField = true;
                     bool newRow = (expectedFieldCount && fieldNum == expectedFieldCount) || lastChar;
                     int pos = dynamicBuffer.size;
                     int o, end;
                     while(newRow || newField)
                     {
                        char * s = null;
                        if(lastChar && lineEnd > -1)
                        {
                           curlyCount += otherCurlyCount;
                           otherCurlyCount = 0;
                        }
                        if(curlyCount)
                        {
                           if(checkCurlies)
                              PrintLn("bad data: ", curlyCount, " curlies not closed!",
                                    " -> filePath=", filePath, " lineNum=", lineNum, " charNum=", charNum, " rowNum=", rowNum, " fieldNum=", fieldNum);
                           curlyCount = 0;
                        }

                        if(newRow)
                        {
                           if(lastChar)
                              o = c;
                           else
                           {
                              if(lineEnd == -1)
                                 PrintLn("PROBLEM");
                              o = lineEnd;
                           }
                        }
                        else
                           o = c;//(c && buffer[c-1] == valueQuotes) ? c - 1 : c;
                        end = o;
                        if(end && buffer[end-1] == '\r')
                           end--;
                        // if(buffer[start] == valueQuotes) start++;
                        if(end > start)
                        {
                           dynamicBuffer.size += end - start;
                           memcpy(&dynamicBuffer[pos], buffer + start, end - start);
                        }
                        else if(end < start)
                           PrintLn("PROBLEM");
                        if(dynamicBuffer.count && dynamicBuffer[dynamicBuffer.count - 1] == '\r')
                           dynamicBuffer.size--;

                        dynamicBuffer.size++;
                        dynamicBuffer[dynamicBuffer.count - 1] = '\0';
                        s = &dynamicBuffer[0];
                        values.Add(CopyString(&dynamicBuffer[0]));
                        dynamicBuffer.size = 0;

                        if(newRow)
                        {
                           /*if(!isHeader) */stop = OnRow(userData, values);
                           //isHeader = false;
                           lineNum += newLineCharCount;
                           newLineCharCount = 0;
                           values.Free();
                           //rowCount++;
                           if(stop) break;
                           lineEnd = -1;
                           curlyCount = otherCurlyCount;
                           otherCurlyCount = 0;
                           if(lastChar)
                              newField = false;
                           rowStart = o+1;
                        }

                        if(newRow)
                        {
                           newRow = false;
                           fieldNum = 1;
                           rowNum++;
                        }
                        else
                        {
                           newField = false;
                           fieldNum++;
                        }
                        start = o+1;
                     }
                  }
                  else if(ch == valueQuotes)
                  {
                     if(quoted)
                     {
                        int end = c;
                        if(end > start)
                        {
                           int pos = dynamicBuffer.size;
                           dynamicBuffer.size += end - start;
                           memcpy(&dynamicBuffer[pos], buffer + start, end - start);
                        }

                        if(c+1 < readCount)
                        {
                           if(buffer[c+1] == '\r' || buffer[c+1] == '\n' || buffer[c+1] == fieldSeparator/* || buffer[c+1] == '\t'*/)
                              quoted = false;
                           else if(buffer[c+1] == valueQuotes)
                           {
                              PrintLn("bad data: multiple quotes!",
                                    " -> filePath=", filePath, " lineNum=", lineNum, " charNum=", charNum, " rowNum=", rowNum, " fieldNum=", fieldNum);
                              dynamicBuffer.size += 1;
                              dynamicBuffer[dynamicBuffer.count - 1] = valueQuotes;
                              c++;
                           }
                           start = c+1;
                        }
                        else
                        {
                           PrintLn("special: read span back seek!",
                                 " -> filePath=", filePath, " lineNum=", lineNum, " charNum=", charNum, " rowNum=", rowNum, " fieldNum=", fieldNum);
                           f.Seek(-1, current);
                           charNum--;
                           break;
                        }
                     }
                     else
                     {
                        start = c+1;
                        quoted = true;
                     }
                  }
                  else if(ch == '\n')
                  {
                     if(!quoted)
                     {
                        if(lineEnd > -1)
                        {
                           curlyCount += otherCurlyCount;
                           otherCurlyCount = 0;
                        }
                        lineEnd = c;
                     }
                        /*if(expectedFieldCount && fieldNum == expectedFieldCount)
                        {
                           if(!curlyCount)
                           {
                              newField = true;
                              newRow = true;
                           }
                           else
                              PrintLn("bad data: less than perfect end of line!",
                                    " -> filePath=", filePath, " lineNum=", lineNum, " charNum=", charNum, " rowNum=", rowNum, " fieldNum=", fieldNum);
                        }
                        else if(!curlyCount)
                           PrintLn("bad data: new line char in field value!",
                                 " -> filePath=", filePath, " lineNum=", lineNum, " charNum=", charNum, " rowNum=", rowNum, " fieldNum=", fieldNum);
                        */
                     newLineCharCount++;
                  }
                  //else if(ch == '\r')
                  //else if(!quoted && !curlyCount && (ch == '\n' || ch == fieldSeparator || ch == '\t'))
                  else if(ch == '\0' && checkNulls && charNum > 1)
                  {
                     if(ch == '\0' && pch != '\r' && pch != '\n' && pch != fieldSeparator)
                        PrintLn("bad data: null char not at begining of field!",
                              " -> filePath=", filePath, " lineNum=", lineNum, " charNum=", charNum, " rowNum=", rowNum, " fieldNum=", fieldNum);
                     if(pch == '\0' && ch != '\r' && ch != '\n' && ch != fieldSeparator)
                        PrintLn("bad data: null char not at end of field!",
                              " -> filePath=", filePath, " lineNum=", lineNum, " charNum=", charNum, " rowNum=", rowNum, " fieldNum=", fieldNum);
                  }
               }
               if(c == readCount && !f.Eof())
               {
                  int end;
                  if(lineEnd > -1)
                  {
                     int len = lineEnd - start;
                     end = len >= 2 ? lineEnd-2 : len == 1 ? lineEnd-1 : lineEnd;
                  }
                  else
                     end = c;
                  //if(end && !quoted && buffer[end-1] == '\r') end--;
                  if(end > start)
                  {
                     int pos = dynamicBuffer.size;
                     dynamicBuffer.size += end - start;
                     memcpy(&dynamicBuffer[pos], buffer + start, end - start);
                  }
                  if(lineEnd > -1)
                  {
                     int len = readCount - lineEnd;
                     //len = len >= 2 ? 2 : len;
                     if(len > 0)
                     {
                        f.Seek(-len, current);
                        charNum -= len;
                        lineNum--;
                     }
                     else
                        PrintLn("ERROR");
                     PrintLn("double check: line end span back seek",
                              " -> filePath=", filePath, " lineNum=", lineNum, " charNum=", charNum, " rowNum=", rowNum, " fieldNum=", fieldNum);
                  }
               }
            }
         }
         values.Free();
         delete values;
         delete dynamicBuffer;
      }
   }

   void PrintMessage(String message)
   {
      PrintLn(message, " -> filePath=", filePath, " lineNum=", lineNum, " charNum=", charNum, " rowNum=", rowNum, " fieldNum=", fieldNum);
   }

   virtual bool any_object::OnRow(Array<String> values);
}

class OtherCommaSeparatedProcessor
{
public:
   void * userData;
   char separator;
   separator = ',';

   void Process(File f)
   {
      bool isHeader = true;
      if(f)
      {
         char buffer[4096];
         Array<char> dynamicBuffer { minAllocSize = 4096 };
         bool quoted = false;
         int curlyCount = 0;
         Array<String> values { };

         while(!f.Eof())
         {
            int result = f.Read(buffer, 1, sizeof(buffer));
            if(result)
            {
               int c;
               int start = 0;
               for(c = 0; c<result; c++)
               {  
                  char ch = buffer[c];
                  if(!quoted && !curlyCount && (ch == '\n' || ch == ',' || ch == '\t'))
                  {
                     int pos = dynamicBuffer.size;
                     int end = c;//(c && buffer[c-1] == '\"') ? c - 1 : c;
                     if(end && buffer[c-1] == '\r') end--;
                     // if(buffer[start] == '\"') start++;
                     if(end > start)
                     {
                        dynamicBuffer.size += end - start;
                        memcpy(&dynamicBuffer[pos], buffer + start, end - start);
                     }
                     if(dynamicBuffer.count && dynamicBuffer[dynamicBuffer.count - 1] == '\r')
                        dynamicBuffer.size--;

                     dynamicBuffer.size++;
                     dynamicBuffer[dynamicBuffer.count - 1] = '\0';

                     values.Add(CopyString(&dynamicBuffer[0]));
                     dynamicBuffer.size = 0;
                     start = c + 1;

                     if(ch == '\n')
                     {
                        /*if(!isHeader) */OnRow(userData, values);
                        isHeader = false;
                        values.Free();
                     }
                  }
                  else if(ch == '\"')
                  {
                     if(quoted)
                     {
                        int end = c;
                        if(end > start)
                        {
                           int pos = dynamicBuffer.size;
                           dynamicBuffer.size += end - start;
                           memcpy(&dynamicBuffer[pos], buffer + start, end - start);
                        }

                        if(c+1 < result)
                        {
                           if(buffer[c+1] == '\r' || buffer[c+1] == '\n' || buffer[c+1] == ',' || buffer[c+1] == '\t')
                              quoted = false;
                           else if(buffer[c+1] == '\"')
                           {
                              dynamicBuffer.size += 1;
                              dynamicBuffer[dynamicBuffer.count - 1] = '\"';
                              c++;
                           }
                           start = c + 1;
                        }
                        else
                        {
                           f.Seek(-1, current);
                           break;
                        }
                     }
                     else
                     {
                        start = c+1;
                        quoted = true;
                     }
                  }
                  else if(ch == '{')
                  {
                     curlyCount++;
                  }
                  else if(ch == '}')
                  {
                     curlyCount--;
                  }
               }
               if(c == result)
               {
                  int end = c;
                  if(end && !quoted && buffer[c-1] == '\r') end--;
                  if(end > start)
                  {
                     int pos = dynamicBuffer.size;
                     dynamicBuffer.size += end - start;
                     memcpy(&dynamicBuffer[pos], buffer + start, end - start);
                  }
               }
            }
         }
         values.Free();
         delete values;
         delete dynamicBuffer;
      }
   }

   virtual void any_object::OnRow(Array<String> values);
}

class CSVFileImporter
{
   public ColumnType * columnsTypes;
   public int columnsCount;
   public int rowCount;
   Array<char> buffer { minAllocSize = 1024 };

   CommaSeparatedProcessor processor
   {
      this;

      bool OnRow(Array<String> values)
      {
         bool stop = false;
         int c = 0;
         
         for(v : values)
         {
            switch(columnsTypes[c])
            {
               case date:
               {
                  DateTime d;
                  d.OnGetDataFromString(v);
                  if(d.month >= january && d.month <= december)
                     columns.Add(Column { type = date, d = d });
                  else
                  {
                     PrintLn("BAD DATE -- FIXME FIXME -- ", v);
                     columns.Add(Column { type = date, d = { } });
                  }
                  break;
               }
               case floater:
                  columns.Add({ type = floater, f = (float)strtod(v, null) });
                  break;
               case number:
                  columns.Add({ type = number, i = strtol(v, null, 10) });
                  break;
               case null|string:
               case string:
               {
                  if(v)
                  {
                     int len;
                     char * s;
                     buffer.size = strlen(v) * 3 + 1;
                     len = ISO8859_1toUTF8(v, buffer.array, buffer.size);
                     s = new char[len + 1];
                     memcpy(s, buffer.array, len + 1);
                     columns.Add({ type = string, s = s });
                  }
                  else
                     columns.Add({ type = string, s = CopyString(""); });
                  break;
               }
            }
            if(++c >= columnsCount) break;
         }
         rowCount++;
         stop = OnRow();
         columns.Free();
         return stop;
      }
   };

   Array<Column> columns { };

   File file;
   char * filePath;
   property String filePath
   {
      set
      {
         delete file;
         delete filePath;
         if(value && FileExists(value))
         {
            file = FileOpen(value, read);
            if(file)
            {
               filePath = CopyString(value);
               OnFileOpened();
            }
         }
      }
   }

   ~CSVFileImporter()
   {
      delete file;
      delete filePath;
   }

   void Import()
   {
      rowCount = 0;
      file.Seek(0, start);
      processor.filePath = filePath;
      processor.Process(file);
      OnImportCompleted();
   }

   virtual void OnFileOpened();
   virtual void OnImportCompleted();
   virtual bool OnRow();
}
