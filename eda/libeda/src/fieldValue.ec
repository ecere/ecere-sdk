#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

public enum FieldType   // Note: these match SQLiteType
{
   integer = 1,
   real    = 2,
   text    = 3,
   blob    = 4,
   nil     = 5
};

public class FieldTypeEx : FieldType
{
public:
   FieldType type:3;
   bool mustFree:1;
};

public struct FieldValue
{
   FieldTypeEx type;
   union
   {
      int i;
      double r;
      String s;
      void * b;
   };

   int compareText(FieldValue b)
   {
      if(!s && b.s) return -1;
      if(s && !b.s) return 1;
      if(!s && !b.s) return 0;
      return strcmp(s, b.s);
   }

   int compareInt(FieldValue b)
   {
      if(i < b.i) return -1;
      if(i > b.i) return 1;
      return 0;
   }

   int compareReal(FieldValue b)
   {
      if(r < b.r) return -1;
      if(r > b.r) return 1;
      return 0;
   }

   String stringify()
   {
      char temp[128];
      switch(type.type)
      {
         case integer: sprintf(temp, "%d", i); return CopyString(temp);
         case real:    return CopyString(r.OnGetString(temp, null, null));
         case text:    return s;
      }
      return null;
   }

   void OnSerialize(IOChannel f)
   {
      f.Put(type);
      switch(type.type)
      {
         case integer: f.Put(i); break;
         case real:    f.Put(r); break;
         case text:    f.Put(s); break;
      }
   }

   void OnUnserialize(IOChannel f)
   {
      f.Get(type);
      switch(type.type)
      {
         case integer: f.Get(i); break;
         case real:    f.Get(r); break;
         case text:    f.Get(s); break;
         default:      r = 0;    break;
      }
   }

   void OnFree()
   {
      if(type.mustFree)
         delete s;
   }

   const char * OnGetString(char * stringOutput, void * fieldData, bool * needClass)
   {
      switch(type.type)
      {
         case integer: sprintf(stringOutput, "%d", i); return stringOutput;
         case real:
         {
            String s = (String)r.OnGetString(stringOutput, null, null);
            if(!strchr(s, '.') && !strchr(s, 'E'))
               strcat(s, ".0");
            return s;
         }
         case text:
         {
            int len = s ? strlen(s) : 0;
            stringOutput[0] = '\"';
            memcpy(stringOutput + 1, s, len);
            stringOutput[len + 1] = '\"';
            stringOutput[len + 2] = 0;
            return stringOutput;
         }
         case nil: return "null";
      }
      stringOutput[0] = 0;
      return stringOutput;
   }

   bool OnGetDataFromString(const char * string)
   {
      if(string[0] == '\"')
      {
         int len = strlen(string + 1);
         if(len > 1) len--;
         s = new char[len + 1];
         memcpy(s, string, len);
         s[len] = 0;
         type = { text, true };
         return true;
      }
      else if(!strcmpi(string, "null"))
      {
         type = { nil };
         s = null;
         return true;
      }
      else if(strchr(string, '.') || strchr(string, 'E'))
      {
         type = { real };
         r = strtod(string, null);
         return true;
      }
      else
      {
         type = { integer };
         i = (int) strtol(string, null, 0);
         return true;
      }
      return false;
   }
};
