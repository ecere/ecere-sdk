#define IMPORT_STATIC
public import IMPORT_STATIC "ecere"
public import IMPORT_STATIC "EDA"
import "main"

//import "commonServeda"

public remote class Serveda
{
public:

   bool login(const String user, const String pass)
   {
      // bug / todo: implement users, login
      PrintLn(" > login: ", user, " (", pass, ")\n");
      display.log.PutS(" > login: ");
      display.log.PutS(user);
      display.log.PutS(" (");
      display.log.PutS(pass);
      display.log.PutS(")\n");
      return true;
   }

   String dataDriver_getDatabases()
   {
      String str = getECONString(class(Array<const String>), ds.databases);
      return str;
   }

   /*void dataDriver_openDatabase(const String token, const String name, CreateOptions createOptions)
   {
   }*/

private:
}

char badbuf[MAX_F_STRING * 4096];
String getECONString(Class cl, void * object)
{
   uint64 size;
   TempFile f { };
   WriteECONObject(f, cl, object, 0);
   size = f.GetSize();
   f.Seek(0, start);
   f.Read(badbuf, 1, size);
   badbuf[size] = '\0';
   delete f;
   return badbuf;
}
