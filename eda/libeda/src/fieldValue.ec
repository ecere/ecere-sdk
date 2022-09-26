#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

public enum FieldType
{
   // Note: these match SQLiteType
   integer = 1,
   real    = 2,
   text    = 3,
   blob    = 4,
   nil     = 5,

   // Add array and map to the enumeration of known field types.
   // Note that the new values are not compatible with SQLiteType objects.
   array   = 6, // a points to an Array<FieldValue> object
   map     = 7  // m points to a Map<String, FieldValue> object

   // NOTE: Currently limited to 7 non-zero values (3 bits) in FieldTypeEx
};

public enum FieldValueFormat
{
   decimal,       // for real
   hex,           // for integer
   octal,         // for integer
   binary,        // for integer
   exponential,   // for real
   boolean,       // for integer
   textObj        // for text (JSON/ECON object)

   // NOTE: Currently limited to 8 values (3 bits) in FieldTypeEx
};

public class FieldTypeEx : FieldType
{
public:
   FieldType type:3;
   bool mustFree:1;
   FieldValueFormat format:3;
   bool isUnsigned:1;
   bool isDateTime:1;
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
      Array<FieldValue> a;
      Map<String, FieldValue> m;
   };

   int OnCompare(FieldValue other)
   {
      // Return -1, 0, 1 if this is respectively smaller, equal or larger than other.
      if(type.type < other.type.type) return -1;
      if(type.type > other.type.type) return  1;
      switch(type.type)
      {
         case integer:  return compareInt(other);
         case real:     return compareReal(other);
         case text:     return compareText(other);
         case blob:     return Sgn((uintptr)this.b - (uintptr)other.b); // NOTE: Currently no way to compare content of blob...
         case array:    return a.OnCompare(other.a);
         case map:      return m.OnCompare(other.m);
      }
      return 0;
   }

   static inline int compareText(FieldValue other)
   {
      if(!s && other.s) return -1;
      if(s && !other.s) return 1;
      if(!s && !other.s) return 0;
      return strcmp(s, other.s);
   }

   static inline int compareInt(FieldValue other)
   {
      if(i < other.i) return -1;
      if(i > other.i) return 1;
      return 0;
   }

   static inline int compareReal(FieldValue other)
   {
      if(r < other.r) return -1;
      if(r > other.r) return 1;
      return 0;
   }

   String stringify()
   {
      // Return a string representation of the value:
      // A new String is allocated and must be deleted by the caller.
      // The resulting string may not be suitable for json/econ files.
      char temp[128];
      switch(type.type)
      {
         case integer:
            formatInteger(temp);
            return CopyString(temp);
         case real:
            formatFloat(temp, false);
            return CopyString(temp);
         case text:
            return CopyString(s);
         case array:
         case map:
         {
            char temp[4096];
            ObjectNotationType on = econ;
            OnGetString(temp, null, &on);
            return CopyString(temp);
         }
         return CopyString((String)b);
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
         case array:   a.OnSerialize(f); break;
         case map:     m.OnSerialize(f); break;
      }
   }

   void OnUnserialize(IOChannel f)
   {
      // NOTE: FlexyField was first freeing any allocated space.
      // this.OnFree(); // REVIEW: OnUnserialize() could be called with an initialized structs
                        //         and typically not used on a struct already containing data.

      f.Get(type);
      switch(type.type)
      {
         case integer: f.Get(i); break;
         case real:    f.Get(r); break;
         case text:    f.Get(s); break;
         case array:
            {
               Array<FieldValue> at {};
               at.OnUnserialize(f);
               a = at;
               break;
            }
         case map:
            {
               Map<String, FieldValue> mt {};
               mt.OnUnserialize(f);
               m = mt;
               break;
            }
         default: r = 0; break;
      }
   }

   void OnCopy(FieldValue other)
   {
      this = other;
      if(type.mustFree)
      {
         switch(type.type)
         {
            case text: s = CopyString(other.s); break;
            case array:
            {
               int count = a.count, i;
               Array<FieldValue> at { size = count };

               for(i = 0; i < count; i++)
                  at[i].OnCopy(a[i]);
               a = at;
               break;
            }
            case map:
            {
               Map<String, FieldValue> mt {};
               MapIterator<String, FieldValue> sIt { map = other.m };
               MapIterator<String, FieldValue> dIt { map = mt };
               while(sIt.Next())
               {
                  const String key = sIt.key;
                  FieldValue * sVal = (FieldValue *)sIt.GetData(), * dVal;
                  dIt.Index(key, true);
                  dVal = (FieldValue *)dIt.GetData();
                  dVal->OnCopy(sVal);
               }
               m = mt;
               break;
            }
         }
      }
   }

   void OnFree()
   {
      if(type.mustFree)
      {
         switch(type.type)
         {
            case text: delete s; break;
            case blob: delete b; break;
            case array:
               if(a)
               {
                   a.OnFree();
                   a = null;
               }
               break;
            case map:
               if(m)
               {
                   m.OnFree();
                   m = null;
               }
               break;
         }
      }
   }

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      // Arrays are formatted on a single line, for now.
      // If a map has up to three elements they are formatted
      // on one line, otherwise each on its own.
      switch(type.type)
      {
         case integer: formatInteger(tempString); break;
         case real: formatFloat(tempString, true); break;
         case array: formatArray(tempString, fieldData, onType); break;
         case map: formatMap(tempString, fieldData, onType); break;
         case text:
         {
            if(type.format == textObj)
               return s;
            else if(onType && *onType != none)
            {
               // NOTE: This block was originally not included in FlexyField
               TempFile f { };
               WriteONString(f, s, *onType == econ, 0);
               f.Putc('\0'); // make f.buffer into a null-terminated string
               strcpy(tempString, (const char *)f.buffer);
               delete f;
            }
            else
               sprintf(tempString, "\"%s\"", s);
            break;
         }
         case 0: // Handle zero values as 'nil'
#ifdef _DEBUG
            PrintLn("WARNING: invalid 0 FieldValue type");
#endif
         case nil: return "null"; // REVIEW
         default: tempString[0] = 0; break;
      }
      return tempString;
   }

   bool OnGetDataFromString(const char * string)
   {
      bool result = false;

      if(string[0] == '\"')
      {
         int len = strlen(string + 1);
         if(len > 0) len--;
         s = new char[len + 1];
         UnescapeCString(s, string+1, len);
         type = { text, true };
         result = true;
      }
      else if(string[0] == '{')
      {
         Map<String, FieldValue> tempMap = null;
         result = getArrayOrMap(string, class(Map<String, FieldValue>), (void*)&tempMap);
         if(!result)
            delete tempMap;
         m = tempMap;
         type = { map, mustFree = true };
      }
      else if(string[0] == '[')
      {
         Array<FieldValue> tempArray = null;
         result = getArrayOrMap(string, class(Array<FieldValue>), (void*)&tempArray);
         if(!result)
            delete tempArray;
         a = tempArray;
         type = { array, mustFree = true };
      }
      else if(!strcmpi(string, "null"))
      {
         type = { nil };
         s = null;
         result = true;
      }
      else if(!strcmpi(string, "false"))
      {
         type = { type = integer, format = boolean};
         i = 0;
         result = true;
      }
      else if(!strcmpi(string, "true"))
      {
         type = { type = integer, format = boolean};
         i = 1;
         result = true;
      }
      else if(strchr(string, '.') || strchr(string, 'E') || strchr(string, 'e'))
      {
         char * rest;
         type = { real };
         r = strtod(string, &rest);
         result = rest != string;
      }
      else
      {
         char * rest;
         type = { integer };
         i = (int64) strtoll(string, &rest, 0);
         result = rest != string;
      }
      return result;
   }

   String formatFloat(char * stringOutput, bool fixDot)
   {
      switch(type.format)
      {
         // For now boolean is not active for float numbers, and uses the default
         /* case boolean: sprintf(stringOutput, "%s", (r)?"true":"false"); break; */
         case exponential:
            sprintf(stringOutput, "%e", r);
            return stringOutput;
         default:
         {
            String st = (String)r.OnGetString(stringOutput, null, null);
            if(fixDot && !strchr(st, '.') && !strchr(st, 'E') && !strchr(st, 'e'))
               strcat(st, ".0");
            return st;
         }
      }
   }

   String formatInteger(char * stringOutput)
   {
      switch(type.format)
      {
         // case binary: sprintf(stringOutput, "%b", i); break;  // TODO: proper binary support
         case octal:   sprintf(stringOutput, "%o", (uint)i); break;
         case hex:     sprintf(stringOutput, FORMAT64HEX, i); break;
         case boolean: sprintf(stringOutput, "%s", (i)?"true":"false"); break;
         default:      sprintf(stringOutput, type.isUnsigned ? FORMAT64U : FORMAT64D, i); break;
      }
      return stringOutput;
   }

   String formatArray(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      String temp = PrintObjectNotationString( a._class, a, *onType, 0, false, keepCase);
      strcat(tempString, temp);
      delete temp;

      return tempString;
   }

   String formatMap(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      // Depending on the object notation and number of elements:
      String temp = PrintObjectNotationString( m._class, m, *onType, 0, false, keepCase);
      strcat(tempString, temp);
      delete temp;

      return tempString;
   }

   static bool ::getArrayOrMap(const char * string, Class destClass, void **destination)
   {
      bool result = false;
      TempFile tmp {buffer = (byte *)string, size = strlen(string)};
      // In ECON, mode JSON-style dictionaries do not currently parse as a Map...
      JSONParser parser = string[0] == '{' ? JSONParser { } : ECONParser { };
      parser.f = tmp;
      result = parser.GetObject(destClass, destination) == success;
      delete parser;
      // It is the caller's responsibility to delete or keep
      // the input string as needed, so we steal it back from tmp.
      tmp.StealBuffer();
      delete tmp;
      return result;
   }
};
