import "ecere"

public bool loadFromFileECON(const String path, Class objectType, void * object)
{
   File f = FileOpen(path, read);
   if(f)
   {
      ECONParser parser { f = f };
      JSONResult jsonResult;
      jsonResult = parser.GetObject(objectType, object);
      delete f;
      return jsonResult == success;
   }
   return false;
}

public bool writeToFileECON(const String path, Class objectType, void * object)
{
   File f = FileOpen(path, write);
   if(f)
   {
      WriteECONObject(f, objectType, object, 0);
      delete f;
      return true;
   }
   return false;
}

public byte * loadFileToBuffer(const String path, uint64 * l)
{
   byte * b = null;
   File f = FileOpen(path, read);
   if(f)
   {
      uint64 len = f.GetSize();
      byte * b = new char[len + 1];
      uintsize read = f.Read(b, 1, len);
      if(read == len)
      {
         if(l) *l = len;
         b[len] = 0;
      }
      else
      {
         //PrintLn("error: file size and read size missmatch.");
         delete b;
         len = 0;
      }
   }
   return b;
}

#ifdef _DEBUG
public bool writeLoadWriteToFileTestECON(const String path, Class objectType, void * object, void * test)
{
   bool success = false;
   String p2 = PrintString("test-", path);
   writeToFileECON(path, objectType, object);
   loadFromFileECON(path, objectType, test);
   writeToFileECON(p2, objectType, test);
   {
      uint64 len1 = 0;
      uint64 len2 = 0;
      char * b1 = (char*)loadFileToBuffer(path, &len1);
      char * b2 = (char*)loadFileToBuffer(p2, &len2);
      if(len1 == len2 && len1)
      {
         if(!strncmp(b1, b2, len1))
            success = true;
      }
      delete b1;
      delete b2;
   }
   return success;
}
#endif // def _DEBUG
