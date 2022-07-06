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
   // boolean allows treating a value as a boolean, writing  it as either true or false
   // each type is allowed to disregard this and use a default format instead
   decimal, hex, octal, binary, exponential, boolean
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
         case blob:     return Sgn((uintptr)this.b - (uintptr)b.b); // NOTE: Currently no way to compare content of blob...
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
            formatInteger(temp, i, type.format, type.isUnsigned);
            return CopyString(temp);
         case real:
            formatFloat(temp, r, type.format, false);
            return CopyString(temp);
         case text:
            return s;
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
            return formatInteger(stringOutput, i, type.format, type.isUnsigned);
         case real:
         {
            return formatFloat(stringOutput, r, type.format, true);
         }
         case text:
         {
            if(onType && *onType != none)
            {
               TempFile f { };
               WriteONString(f, s, *onType == econ, 0);
               f.Putc('\0'); // make f.buffer into a null-terminated string
               strcpy(stringOutput, (const char *)f.buffer);
               delete f;
            }
            else
               sprintf(stringOutput, "\"%s\"", s);
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
         UnescapeCString(s, string+1, len);
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
         type = { type=integer, format = boolean};
         i = 0;
         return true;
      }
      else if(!strcmpi(string, "true"))
      {
         type = { type=integer, format = boolean};
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

// BEGIN ::: Formating functions shared between FieldValue and FlexyField

String formatFloat(char * stringOutput, double r, FieldValueFormat format, bool fixDot)
{
   switch (format)
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

String formatInteger(char * stringOutput, int64 i, FieldValueFormat format, bool isUnsigned)
{
   switch(format)
   {
      // case binary: sprintf(stringOutput, "%b", i); break;  // TODO: proper binary support
      case octal:   sprintf(stringOutput, "%o", (uint)i); break;
      case hex:     sprintf(stringOutput, FORMAT64HEX, i); break;
      case boolean: sprintf(stringOutput, "%s", (i)?"true":"false"); break;
      default:      sprintf(stringOutput, isUnsigned ? FORMAT64U : FORMAT64D, i); break;
   }
   return stringOutput;
}

// END ::: Formating functions shared between FieldValue and FlexyField

// Add array and map to the enumeration of known field types.
// Note that the new values are not compatible with SQLiteType objects.
public enum FlexyType : FieldType {
   array, // The blob points to an Array<FlexyField> object
   map    // the blob points to a Map<String, FlexyField> object
};


public class FlexyTypeEx : FlexyType
{
public:
   FlexyType type:3;
   bool mustFree:1;
   FieldValueFormat format:3;
   bool isUnsigned:1;
};


class MapGetHelper {
   // Little helper class to read a Map object from string in
   // FlexyField OnGetDataFromString.
public:
   property Map<String, FlexyField> M {get{return M;} set{M = value;}};
private:
   Map<String, FlexyField> M ;
}


public struct FlexyField
{
   FlexyTypeEx type;
   union
   {
      int64 i;
      double r;
      String s;
      void * b;
      Array<FlexyField> a;
      Map<String, FlexyField> m;
   };
public:

   // Access to the union members, will be hndled via via properties.
   // The setter can help to ensure that the value of type.type and type.mustFree are consistent.
   //   Setting a new value for one of the pointer union members [s,m,b,a] does
   //   not delete the previous from memory, since it could well be referenced
   //   elsewhere.
   //
   // Note: be careful when adding a FlexyField to the m attribute of another FlexyField, as in:
   //
   //       Array<FlexyField> an_array {}
   //       FlexyField a {a=an_array};
   //       Map<String, FlexyField> a_map {};
   //       a_map["key"] = a;
   //       FlexyField b {m=a_map};
   //       delete a; // deallocates an_array, but b.m["key"] still points at it.
   //       delete b; // attempts to call OnFree() with the deleted b.m["key"].
   //
   // The values of type can be altered after assignment if necessary (eg: set
   //   type = {nil, false}, since there is no property for nil values, or  set
   //   mustFree to false for a string that we know is referenced elsewhere):
   //
   //       FlexyField f {s=aString};
   //       f.type.mustFree = false
   //       FlexyField n {b=null, {nil, false}};
   //
   // Trying to get data using the wrong property (eg: using s when
   //   type.type==array) should return 0, 0.0 or null, according to the property type.

   // TODO: Get rid of these properties, they cause a great deal of confusion and are unnecessary.

   // Property to access data as pointer to void:
   property void * prop_b {
      get{ return (type.type == blob) ? b : null;}
      set{b = value; type = {blob, true};}
      isset { return type.type == blob && b != null;}
   }

   // Property to access data as String (aka char *):
   property String prop_s {
      get{ return (type.type == text) ? s : null;}
      set{ s = value; type = {text, true};}
      isset { return type.type == text && s != null;}
   }
   // Property to access data as integer:
   property int64 prop_i {
      get{ return (type.type == integer) ? i : 0;}
      set{ i = value; type = {integer, false};}
      isset { return type.type == integer;}
   }

   // Property to access data as real:
   property double prop_r {
      get{ return (type.type == real) ? r : 0.0;}
      set{ r = value; type = {real, false};}
      isset { return type.type == real;}
   }

   // Property to access data as array:
   property Array<FlexyField> prop_a {
      get{ return (type.type == array) ? a : null;}
      set{ a = value; type = {array, true};}
      isset { return type.type == array && a != null;}
   }

   // Property to access the data as map:
   property Map<String, FlexyField> prop_m {
      get{ return (type.type == map) ? m : null;}
       set{ m = value; type = {map, true};}
      isset { return type.type == map && m != null;}
   }

   int OnCompare(FlexyField other)
   {
      // Return -1, 0, 1 if this is respectively smaller equal or larger than other.

      if(type.type < other.type.type) return -1;
      if(type.type > other.type.type) return  1;
      switch(type.type)
      {
         case integer:
            return ((i > other.i) - (i < other.i));
         case real:
            return ((r > other.r) - (r < other.r));
         case text:
            return compareText(other);
         case blob:
            // At the moment, we assume that all blobs
            // are actually text that must be stored verbatim,
            // we do not treat bynary data here.
            return compareText(other);
         case array:
         case map:
         default:
            // We consider arrays and maps to compare equal
            // until a sensible ordering is devised.
            return 0;
      }
      return 0;
   }

   int compareText(FlexyField other)
   {
      if(!s && other.s) return -1;
      if(s && !other.s) return 1;
      if(!s && !other.s) return 0;
      return strcmp(s, other.s);
   }

   void OnFree()
   {
      if(type.mustFree)
      {
         if(type.type == text && s)
         {
            delete s;
         }
         else if(type.type == blob)
         {
            delete b;
         }
         else if (type.type == array && a)
         {
            a.OnFree();
            a = null;
         }
         else if (type.type == map && m)
         {
            m.OnFree();
            m = null;
         }
      }
   }

   void OnCopy(FlexyField other)
   {
      this = other;
      if(type.mustFree)
      {
         switch (type.type)
         {
            case text:
               s = CopyString(other.s);
               break;
            case blob:
               // At the moment, we assume that all raw  blobs
               // are actually text that must be stored verbatim,
               // we do not treat binary data here.
               s = CopyString((String)other.b);
               break;
            case array :
               {
                  Array<FlexyField> at {};
                  int n;
                  for ( n=0; n< a.count; n++ )
                  {
                     at.Add({});
                     at[n].OnCopy(a[n]);
                  }
                  a = at;
                  break;
               }
            case map:
               {
                  Map<String, FlexyField> mt {};
                  MapIterator<String, FlexyField> iter {map = other.m};
                  for (iter.Next(); iter.pointer; iter.Next())
                  {
                     const String key = iter.key;
                     FlexyField val = iter.value;
                     mt[key] = {};
                     mt[key].OnCopy(val);
                  }
                  m = mt;
                  break;
               }
         }
      }
   }

   void OnSerialize(IOChannel f)
   {
      f.Put(type);
      switch(type.type)
      {
         case integer:
            f.Put(i); break;
         case real:
            f.Put(r); break;
         case text:
            f.Put(s); break;
         case blob:
            // At the moment, we assume that all blobs
            // are actually text that must be stored verbatim,
            // we do not treat binary data here.
            f.Put((String)b); break;
         case array:
            a.OnSerialize(f); break;
         case map:
            m.OnSerialize(f); break;
      }
   }

   void OnUnserialize(IOChannel f)
   {
      // First free any allocated space.
      this.OnFree();
      f.Get(type);
      switch(type.type)
      {
         case integer:
            f.Get(i);
            break;
         case real:
            f.Get(r);
            break;
         case text:
            f.Get(s);
         case blob:
            // At the moment, we assume that all blobs
            // are actually text that must be stored verbatim,
            // we do not treat binary data here.
            f.Get(s);
            break;
         case array:
            {
               Array<FlexyField> at {};
               at.OnUnserialize(f);
               a = at;
               break;
            }
         case map:
            {
               Map<String, FlexyField> mt {};
               mt.OnUnserialize(f);
               m = mt;
               break;
            }
         default:
            r = 0;
            break;
      }
   }

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      // Arrays are formatted on a single line, for now.
      // If a map has up to three elements they are formatted
      // on one line, otherwise each on its own.

      tempString[0] = 0;
      switch(type.type)
      {
         case integer:
            formatInteger(tempString, i, type.format, type.isUnsigned);
            break;
         case real:
            formatFloat(tempString, r, type.format, true);
            break;
         case text:
            sprintf(tempString, "\"%s\"", s);
            break;
         case blob:
            // At the moment, we assume that all blobs
            // are actually text that must be stored verbatim,
            // we do not treat binary data here.
            strcat(tempString, (String)b);
            break;
         case 0: // Handle  zero values as 'nil'
         case nil:
            strcat(tempString, "null");
            break;
         case array:
            formatArray(tempString, fieldData, onType);
            break;
         case map:
            formatMap(tempString, fieldData, onType);
            break;
      }
      return tempString;
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

   String stringify()
   {
      // Return a string representation of the value:
      // A new String is allocated and must be deleted by the caller.
      // The resulting string may not be suitable for json/econ files.

      char temp[MAX_LOCATION];
      switch(type.type)
      {
         case integer:
            formatInteger(temp, i, type.format, type.isUnsigned);
            return CopyString(temp);
         case real:
            formatFloat(temp, r, type.format, false);
            return CopyString(temp);
         case text:
            return CopyString(s);
         case blob:
            // At the moment, we assume that all blobs
            // are actually text that must be stored verbatim,
            // we do not treat binary data here.
            return CopyString((String)b);
         case array:
         case map:
            {
               ObjectNotationType on = econ;
               this.OnGetString(temp, null, &on);
               return CopyString(temp);
            }
      }
      return null;
   }

   bool OnGetDataFromString(const char * string)
   {
      bool result = false;

      if(string[0] == '{')
      {
         MapGetHelper  tempMap = null;
         String working = new char[strlen(string)+9];
         sprintf(working, "{ M = %s }", string);

         result = getArrayOrMap(working, class(MapGetHelper), (void*)&tempMap);
         delete working;
         if(result)
         {
            prop_m = tempMap.M;
            tempMap.M = null;
         }
         delete tempMap;
         return result;
      }
      if(string[0] == '[')
      {
         Array<FlexyField> tempArray = null;
         result = getArrayOrMap(string, class(Array<FlexyField>), (void*)&tempArray);
         if(!result)
            delete tempArray;
         prop_a = tempArray;
         return result;
      }
      else if(string[0] == '\"')
      {
         int len = strlen(string + 1);
         if(len > 0) len--;
         prop_s = new char[len + 1];
         UnescapeCString(s, string+1, len);
         return true;
      }
      else if(!strcmpi(string, "null"))
      {
         s = null;
         type = {nil, false};
         return true;
      }
      else if(!strcmpi(string, "false"))
      {
         prop_i = 0;
         type.format = boolean;
         return true;
      }
      else if(!strcmpi(string, "true"))
      {
         prop_i = 1;
         type.format = boolean;
         return true;
      }
      else{
         // Attempt to treat the string as a number
         char * rest;
         if(strchr(string, '.') || strchr(string, 'E') || strchr(string, 'e') )
         {
            prop_r = strtod(string, &rest);
         }
         else
         {
            prop_i = (int64) strtoll(string, &rest, 0);
         }

         // If rest points to the start of string,
         // this was not a number, so it is a blob.
         if((rest == string))
            prop_b = CopyString(string);
         return true;
      }

   }

   bool getArrayOrMap(const char * string, Class destClass, void **destination)
   {
      bool result = false;
         TempFile tmp {buffer = (byte *)string, size = strlen(string)};
         ECONParser parser {tmp};
         result = parser.GetObject(destClass, destination) == success;
         delete parser;
         // It is the caller's responsibility to delete or keep
         // the input string as needed, so we steal it back from tmp.
         tmp.StealBuffer();
         delete tmp;
         return result;
   }
};
