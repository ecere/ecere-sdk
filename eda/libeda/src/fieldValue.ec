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

// TOCHECK: Move this into FieldTypeEx ?
public enum FieldValueFormat
{
   decimal, hex, octal, binary, exponential
};

public class FieldTypeEx : FieldType
{
public:
   FieldType type:3;
   bool mustFree:1;
   FieldValueFormat format:3;
   bool isUnsigned:1;
};

public struct FieldValue
{
   FieldTypeEx type;
   union
   {
      int64 i;
      double r;
      String s;
      void * b;
   };

   int OnCompare(FieldValue b)
   {
      if(type.type < b.type.type) return -1;
      if(type.type > b.type.type) return  1;
      switch(type.type)
      {
         case integer:  return compareInt(b);
         case real:     return compareReal(b);
         case text:     return compareText(b);
      }
      return 0;
   }

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
         case integer:
            switch(type.format)
            {
               // case binary: sprintf(temp, "%b", i); break;  // TODO: proper binary support
               case octal:  sprintf(temp, "%o", (uint)i); break;
               case hex:    sprintf(temp, FORMAT64HEX, i); break;
               default:     sprintf(temp, type.isUnsigned ? FORMAT64U : FORMAT64D, i); break;
            }
            return CopyString(temp);
         case real:
            if(type.format == exponential)
            {
               sprintf(temp, "%e", r);
               return CopyString(temp);
            }
            else
               return CopyString(r.OnGetString(temp, null, null));
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

   void OnCopy(FieldValue b)
   {
      this = b;
      if(type.type == text && type.mustFree)
         s = CopyString(b.s);
   }

   void OnFree()
   {
      if(type.mustFree)
         delete s;
   }

   const char * OnGetString(char * stringOutput, void * fieldData, ObjectNotationType * onType)
   {
      switch(type.type)
      {
         case integer:
            switch(type.format)
            {
               // case binary: sprintf(stringOutput, "%b", i); break;  // TODO: proper binary support
               case octal:  sprintf(stringOutput, "%o", (uint)i); break;
               case hex:    sprintf(stringOutput, FORMAT64HEX, i); break;
               default:     sprintf(stringOutput, type.isUnsigned ? FORMAT64U : FORMAT64D, i); break;
            }
            return stringOutput;
         case real:
         {
            if(type.format == exponential)
            {
               sprintf(stringOutput, "%e", r);
               return stringOutput;
            }
            else
            {
               String s = (String)r.OnGetString(stringOutput, null, null);
               if(!strchr(s, '.') && !strchr(s, 'E') && !strchr(s, 'e'))
                  strcat(s, ".0");
               return s;
            }
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
         if(len > 0) len--;
         s = new char[len + 1];
         memcpy(s, string+1, len);
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
      else if(!strcmpi(string, "false"))
      {
         type = { integer };
         i = 0;
         return true;
      }
      else if(!strcmpi(string, "true"))
      {
         type = { integer };
         i = 1;
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
         i = (int64) strtoll(string, null, 0);
         return true;
      }
      return false;
   }
};
