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
      // Free any allocated memory first.
      this.OnFree();
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
   // Since "OnCopy" calls "OnDelete", it requires attention too, in a set-up like this.
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

   // Property to access data as pointer to void:
   property void * b {
      get{ return (type.type == blob) ? b : null;}
      set{b = value; type = {blob, true};}
      isset { return type.type == blob && b != null;}
   }

   // Property to access data as String (aka char *):
   property String s {
      get{ return (type.type == text) ? s : null;}
      set{ s = value; type = {text, true};}
      isset { return type.type == text && s != null;}
   }
   // Property to access data as integer:
   property int64 i {
      get{ return (type.type == integer) ? i : 0;}
      set{ i = value; type = {integer, false};}
      isset { return type.type == integer;}
   }

   // Property to access data as real:
   property double r {
      get{ return (type.type == real) ? r : 0.0;}
      set{ r = value; type = {real, false};}
      isset { return type.type == real;}
   }

   // Property to access data as array:
   property Array<FlexyField> a {
      get{ return (type.type == array) ? a : null;}
      set{ a = value; type = {array, true};}
      isset { return type.type == array && a != null;}
   }

   // Property to access the data as map:
   property Map<String, FlexyField> m {
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
};
