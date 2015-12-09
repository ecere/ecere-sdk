#include <stdarg.h>

public import "ecere"

public int UnescapeString(char * d, char * s, int len)
{
   int j = 0, k = 0;
   char ch;
   while(j < len && (ch = s[j]))
   {
      switch(ch)
      {
         case '\\':
            switch((ch = s[++j]))
            {
               case 'n': d[k] = '\n'; break;
               case 't': d[k] = '\t'; break;
               case 'a': d[k] = '\a'; break;
               case 'b': d[k] = '\b'; break;
               case 'f': d[k] = '\f'; break;
               case 'r': d[k] = '\r'; break;
               case 'v': d[k] = '\v'; break;
               case '\\': d[k] = '\\'; break;
               case '\"': d[k] = '\"'; break;
               case '\'': d[k] = '\''; break;
               default: d[k] = '\\'; d[k] = ch;
            }
            break;
         default:
            d[k] = ch;
      }
      j++, k++;
   }
   d[k] = '\0';
   return k;
}

// to be moved in ecere?
public class FileHandler
{
   public File file;

   ~FileHandler()
   {
      delete file;
   }
}

public struct CSVParserParameters
{
   char fieldSeparator;
   char valueQuotes;
   int expectedFieldCount;
   bool tolerateNewLineInValues;
   bool escaped;
   bool lastFieldEndsWithNewLine;
   //bool checkNulls;
   //bool checkCurlies;
};

CSVParserParameters classicParameters = { ',', '\"', 0, false };

public struct CSVParserState
{
   uint lineNum;
   uint charNum;
   uint rowNum;
   uint fieldNum;
};

public class CSVParser : public FileHandler
{
public:
   CSVParserParameters options { ',', '\"', 0, false };
   CSVParserState info;

   void PrintMessage(typed_object object, ...)
   {
      va_list args;
      char buffer[4096];
      va_start(args, object);
      PrintStdArgsToBuffer(buffer, sizeof(buffer), object, args);
      va_end(args);
      OnMessage(buffer);
   }

   virtual void OnMessage(const String message)
   {
      ::PrintLn(this._class.name, ": ", message,
            " lineNum=", info.lineNum,
            " charNum=", info.charNum,
            " rowNum=", info.rowNum,
            " fieldNum=", info.fieldNum);
   }

   virtual bool OnRowStrings(Array<String> strings);

   virtual void Process()
   {
      bool quoted = false, status = true;
      bool escaped = false;
      Array<String> values { };
      bool started = false;
      int start = 0, end = 0;
      int readCount = 0;
      Array<char> buffer { minAllocSize = 4096 };

      info.charNum = 0;
      info.lineNum = 0;
      info.rowNum = 0;
      info.fieldNum = 0;

      while(!file.Eof() && status)
      {
         int c, offset = 0;

         if(started)
         {
            offset = readCount - start;
            if(offset > buffer.minAllocSize / 2)
               buffer.minAllocSize += 4096;
            memmove(&buffer[0], &buffer[start], offset);
            end -= start;
            start = 0;
         }

         readCount = offset + file.Read(&buffer[offset], 1, buffer.minAllocSize - offset);
         for(c = offset; c < readCount && status; c++)
         {
            char ch = buffer[c];
            if(quoted)
            {
               // For Git import...
               bool inTextQuote = false;

               if(options.lastFieldEndsWithNewLine && info.fieldNum == options.expectedFieldCount - 1 && ch == '\"' && info.charNum > 0)
                  inTextQuote = true;

               if(!inTextQuote && !escaped && ch == options.valueQuotes)
               {
                  quoted = false;
                  end = c;
               }
               if(options.escaped && ch == '\\')
                  escaped = true;
               else
                  escaped = false;
            }
            else
            {
               if(ch == options.valueQuotes)
               {
                  quoted = true;
                  start = c + 1;
                  started = true;
               }
               //else if(ch == options.fieldSeparator || ch == '\n')
               else if(ch == options.fieldSeparator ||
                     (ch == '\n' && (!options.tolerateNewLineInValues || info.fieldNum >= options.expectedFieldCount-1)))
               {
                  if(values.count < options.expectedFieldCount)
                  {
                     int len = started ? (end-start) : 0;
                     String value = new char[len+1];
                     if(options.escaped)
                        UnescapeString(value, &buffer[start], len);
                     else
                     {
                        memcpy(value, &buffer[start], len);
                        value[len] = 0;
                     }
                     values.Add(value);
                  }
                  start = end = 0;
                  started = false;
                  info.fieldNum++;
                  if(ch == '\n')
                  {
                     info.lineNum++;
                     info.rowNum++;
                     status = OnRowStrings(values);
                     values.Free();
                     info.fieldNum = 0;
                  }
               }
               else if(ch == '\r');
               else
               {
                  if(!started)
                  {
                     start = c;
                     started = true;
                  }
                  end = c+1;
               }
            }
            if(ch == '\r' || ch == '\n')
               info.charNum = 0;
            else
               info.charNum++;
         }
      }
      if(end > start)
      {
         int len = end-start;

         String value = new char[len+1];
         if(options.escaped)
            UnescapeString(value, &buffer[start], len);
         else
         {
            memcpy(value, &buffer[start], len);
            value[len] = 0;
         }
         values.Add(value);
      }
      if(values.count && status)
      {
         status = OnRowStrings(values);
         info.rowNum++;
      }
      values.Free();
      delete values;
   }
}
