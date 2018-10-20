namespace sys;

import "instance"
import "System"
import "Array"
import "AVLTree"

default:
__attribute__((unused)) static void UnusedFunction()
{
   int a;
   a.OnGetDataFromString(null);
   a.OnGetString(null, 0, 0);
   a.OnCopy(0);
   a.OnFree();
}
extern int __ecereVMethodID_class_OnCopy;
extern int __ecereVMethodID_class_OnGetDataFromString;
extern int __ecereVMethodID_class_OnGetString;
extern int __ecereVMethodID_class_OnFree;
private:

// TOFIX: How should this be handled?
/*static*/ class FreeingAVLTree : AVLTree
{
   ~FreeingAVLTree()
   {
      Free();
   }
}

FreeingAVLTree<const String> compactTypes
{ [
   "GeoPoint",
   "GeoExtent",
   "GeometryData",
   "PolygonGeometryData",
   "LineGeometryData",
   "PointGeometryData",
   "RecordDataField",
   "MapNode",
   "LineString",
   "PolygonContour",
   "StartEndPair",
   "VectorPiece",
   "ShortPoint",
   "uint16",
   "uint32",
   "PolygonVertexFlags",
   "byte",
   "UMSRowsSpecs",
   "GMLTimeExtent",
   "EX_TemporalExtent",
   "RS_Identifier",
   "CI_Date",
   "CI_Telephone",
   "MD_Resolution",
   "UMSFormat"
] };

FreeingAVLTree<const String> compactArrays
{ [
   "Polygon",
   "GeoPoint",
   "PolygonContour",
   "StartEndPair",
   "VectorPiece",
   "ShortPoint",
   "uint16",
   "uint32",
   "PolygonVertexFlags",
   "byte",
   "UMSRowsSpecs",
   "CI_ResponsibleParty",
   "MD_CharacterSetCode",
   "MD_Keywords",
   "EX_Extent"
] };

public enum JSONResult { syntaxError, success, typeMismatch, noItem };

public enum SetBool : uint
{
   unset, false, true;

   /*public property bool     // NOT WORKING!
   {
      set { return value ? true : false; }
      get { return (this == true); }
   }*/
};


public class ECONParser : JSONParser
{
   eCON = true;
}

static struct JSONParserState
{
   int pos;
   char ch;
   int col, line;
};

public class JSONParser
{
public:
   File f;
private:
   char ch;
   bool eCON;

   int charPos, col, line;
   int maxPos;
   bool debug;

   public property bool debug { set { debug = value; } get { return debug; } }

   bool ReadChar(char * ch)
   {
      bool result = f.Getc(ch);
      charPos++;
      if(charPos > maxPos)
      {
         if(*ch == '\r');
         else if(*ch == '\n')
         {
            line++;
            col = 1;
         }
         else
            col++;
#ifdef _DEBUG
         if(debug)
            Print(*ch);
#endif
         maxPos = charPos;
      }
      return result;
   }

   void BackUpState(JSONParserState state)
   {
      state.ch = ch;
      state.pos = charPos;
      state.col = col;
      state.line = line;
   }

   void ResetState(JSONParserState state)
   {
      ch = state.ch;
      charPos = state.pos;
      col = state.col;
      line = state.line;
      f.Seek(charPos, start);
   }

   void SkipEmpty()
   {
      if(eCON)
      {
         char pch;
         bool lineComment = false;
         bool comment = false;
         while(!f.Eof() && (!ch || lineComment || comment || ch == ' ' || ch == '\n' || ch == '\r' || ch == '\t' || ch == '/'))
         {
            pch = ch;
            ReadChar(&ch);
            if(!lineComment && !comment && pch == '/')
            {
               if(ch == '/')
                  lineComment = true;
               else if(ch == '*')
                  comment = true;
            }
            else if(lineComment && ch == '\n')
               lineComment = false;
            else if(comment && pch == '*' && ch == '/')
               comment = false;
         }
      }
      else
      {
         while(!f.Eof() && (!ch || ch == ' ' || ch == '\n' || ch == '\r' || ch == '\t' || ch == '/'))
         {
            ReadChar(&ch);
         }
      }
   }

   void SkipExtraSemicolon()
   {
      while(!f.Eof() && (!ch || ch == ' ' || ch == '\n' || ch == '\r' || ch == '\t' || ch == ';'))
      {
         ReadChar(&ch);
      }
   }

   JSONResult GetValue(Class type, DataValue value)
   {
      return _GetValue(type, value, null);
   }

   static inline JSONResult _GetValue(Class type, DataValue value, Container forMap)
   {
      JSONResult result = syntaxError;
      bool (* onGetDataFromString)(void *, void *, const char *) = type ? (void *)type._vTbl[__ecereVMethodID_class_OnGetDataFromString] : null;
      JSONParserState backState;

      BackUpState(backState);
      SkipEmpty();

      if(ch == '\"' || (ch != '{' && type && type.type == structClass && onGetDataFromString != type.base._vTbl[__ecereVMethodID_class_OnGetDataFromString]))
      {
         String string;
         if((ch != '\"' || (type && strstr(type.name, "FieldValue"))) && type && type.type == structClass && onGetDataFromString != type.base._vTbl[__ecereVMethodID_class_OnGetDataFromString])
         {
            bool escaped = false, quoted = ch == '\"', done = false;
            int size = 32, len = 0;
            char * s = new char[size];
            int level = 0;
            while(ch && !done)
            {
               if(len + 1 >= size)
               {
                  size += size >> 1;
                  s = renew s char[size];
               }
               if(!quoted)
               {
                  if(level <= 0 && (ch == ',' || ch == '}'))
                     break;
                  else if(ch == '{') level++;
                  else if(ch == '}') level--;
                  else if(ch == '[') level++;
                  else if(ch == ']') level--;
               }
               else if(quoted)
               {
                  if(escaped)
                     escaped = false;
                  else if(ch == '\\')
                     escaped = true;
                  else if(ch == '\"' && len > 1)
                     done = true;
               }
               s[len++] = ch;

               ReadChar(&ch);
            }
            s[len] = 0;
            while(len > 0 && isspace(s[len-1]))
               s[--len] = 0;
            s = renew s char[len + 1];
            string = s;
            result = (len > 0) ? success : syntaxError;
         }
         else
            result = GetString(&string);
         if(result)
         {
            Property prop;
            if(type && (!strcmp(type.name, "String") || !strcmp(type.dataTypeString, "char *")))
            {
               value.p = string;
            }
            else if(type && (type.type == enumClass || type.type == unitClass))
            {
               if(onGetDataFromString(type, &value.i, string))
                  result = success;
               else
                  result = typeMismatch;
               delete string;
            }
            else if(type && (prop = eClass_FindProperty(type, "String", type.module)))
            {
               // TOFIX: Add more conversion property support... Expecting void * compatible here
               value.p = ((void *(*)())(void *)prop.Set)(string);
               result = success;
               delete string;
            }
            else if(type && eClass_IsDerived(type, class(ColorAlpha)))
            {
               result = GetColorAlpha(string, value);
               delete string;
            }
            else if(type && (type.type == structClass))
            {
               if(onGetDataFromString(type, value.p, string))
                  result = success;
               else
                  result = typeMismatch;
               delete string;
            }
            else
            {
               delete string;
               result = typeMismatch;
            }
         }
      }
      else if(ch == '[')
      {
         Container array = null;
         if(type && eClass_IsDerived(type, class(Map)))
         {
            result = GetMap(type, (Map *)&array);
         }
         else
            result = GetArray(type, &array);

         if(result == success && type && eClass_IsDerived(type, class(Container)))
         {
            value.p = array;
         }
         else if(array && type && (type.type == normalClass || type.type == noHeadClass))
         {
            if(type.type == normalClass && eClass_IsDerived(type, class(Container)))
               array.Free();
            delete array;
         }
      }
      else if(ch == '-' || isdigit(ch))
      {
         result = GetNumber(type, value);
      }
      else if(ch == '{')
      {
         if(type && eClass_IsDerived(type, class(Map)))
         {
            Container array;
            result = GetJSONMap(type, (Map *)&array);
            if(result == success && type && eClass_IsDerived(type, class(Container)))
            {
               value.p = array;
            }
            else
            {
               if(array)
                  array.Free();
               delete array;
            }
         }
         else if(type && (type.type == structClass || type.type == normalClass || type.type == noHeadClass))
         {
            void * object = value.p;
            result = _GetObject(type, &object, forMap);
            if(result)
            {
               if(type && type.type == structClass);
               else
                  value.p = object;
            }
         }
         else if(type && type.type == bitClass)
         {
            uint64 object = 0;
            result = _GetObject(type, (void **)&object, null);
            if(result)
               value.ui64 = object;
         }
         else
         {
            void * object = value.p;
            result = _GetObject(type, &object, null);
            if(result)
            {
               result = typeMismatch;
               if(type)
                  ((void (*)(void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnFree])(type, object);
            }
         }
      }
      else if(isalpha(ch) || ch == '_')
      {
         if(eCON)
         {
            String string;
            if(GetIdentifier(&string, null))
            {
               result = success;
               if(eCON && type && (type.type == enumClass || type.type == unitClass || eClass_IsDerived(type, class(ColorAlpha)) || eClass_IsDerived(type, class(Color))))
               {
                  bool isColorAlpha = type.type != enumClass && type.type != unitClass && eClass_IsDerived(type, class(ColorAlpha));
                  if(isColorAlpha)
                     type = class(Color);
                  // should this be set by calling __ecereVMethodID_class_OnGetDataFromString ?
                  if(((bool (*)(void *, void *, const char *))(void *)type._vTbl[__ecereVMethodID_class_OnGetDataFromString])(type, &value.i, string))
                  {
                     if(isColorAlpha)
                        value.ui |= 0xFF000000;
                     result = success;
                  }
                  else
                     result = typeMismatch;
               }
               else if(type && !strcmp(type.name, "bool"))
               {
                  if(!strcmpi(string, "false")) value.i = 0;
                  else if(!strcmpi(string, "true")) value.i = 1;
                  else
                     result = typeMismatch;
               }
               else if(type && !strcmp(type.name, "SetBool"))
               {
                  if(!strcmpi(string, "false")) value.i = SetBool::false;
                  else if(!strcmpi(string, "true")) value.i = SetBool::true;
                  else
                     result = typeMismatch;
               }
               else if(type && !strcmpi(string, "null"))
               {
                  if(type.type != structClass)
                     value.p = 0;
               }
               else if(type && isSubclass(type, string))
               {
                  void * object = value.p;
                  Class subtype = superFindClass(string, type.module);
                  SkipEmpty();
                  result = _GetObject(subtype, &object, null);  // TO REVIEW: Is this a problem with bitClass here, in 32 bit?
                  if(result)
                  {
                     if(subtype && subtype.type == structClass);
                     else if(subtype && (subtype.type == normalClass || subtype.type == noHeadClass || subtype.type == bitClass))
                     {
                        value.p = object;
                     }
                     else
                     {
                        result = typeMismatch;
                        if(subtype)
                           ((void (*)(void *, void *))(void *)subtype._vTbl[__ecereVMethodID_class_OnFree])(subtype, object);
                     }
                  }
               }
               else if(ch != '=' && type)
               {
                  Property convProp;
                  Class cType = superFindClass(string, type.module);
                  for(convProp = type.conversions.first; convProp && cType; convProp = convProp.next)
                  {
                     if(!strcmp(convProp.name, cType.fullName))
                        break;
                  }
                  if(convProp && cType)
                  {
                     if(cType.type == unitClass)
                     {
                        // TODO: Improve on this...
                        DataValue v;
                        SkipEmpty();
                        if(ch == '{')
                           ch = 0;
                        SkipEmpty();
                        result = GetNumber(cType, v);
                        SkipEmpty();
                        if(ch == '}')
                           ch = 0;
                        if(result)
                        {
                           if(type && (type.type == normalClass || type.type == noHeadClass))
                           {
                              if(!strcmp(cType.dataTypeString, "double"))
                              {
                                 value.p = ((void *(*)(double))(void *)convProp.Set)(v.d);
                              }
                           }
                           else
                              result = typeMismatch;
                        }
                     }
                  }
                  else
                     result = typeMismatch;
               }
            }
            delete string;
         }
         else
         {
            char buffer[256];
            int c = 0;
            while(c < sizeof(buffer)-1 && (isalpha(ch) || isdigit(ch) || ch == '_'))
            {
               buffer[c++] = ch;
               if(!ReadChar(&ch)) break;
            }
            buffer[c] = 0;
            result = success;

            if(type)
            {
               if(!strcmp(type.name, "bool"))
               {
                  if(!strcmpi(buffer, "false")) value.i = 0;
                  else if(!strcmpi(buffer, "true")) value.i = 1;
                  else
                     result = typeMismatch;
               }
               else if(!strcmp(type.name, "SetBool"))
               {
                  if(!strcmpi(buffer, "false")) value.i = SetBool::false;
                  else if(!strcmpi(buffer, "true")) value.i = SetBool::true;
                  else
                     result = typeMismatch;
               }
               else if(!strcmpi(buffer, "null"))
               {
                  if(type.type != structClass)
                     value.p = 0;
               }
               else
                  result = typeMismatch;
            }
            else
               result = typeMismatch;
         }
      }
      else if(ch == '}' || ch == ']')
         result = noItem;
      if(result == typeMismatch)
         PrintLn("Warning: Value type mismatch");
      return result;
   }

   JSONResult GetArray(Class type, Container * array)
   {
      JSONResult result = syntaxError;
      SkipEmpty();
      *array = null;
      if(ch == '[')
      {
         bool isAVLTree = eClass_IsDerived(type, class(AVLTree));

         *array = eInstance_New(type);
         result = success;
         while(result)
         {
            DataValue value { };
            Class arrayType = null;
            JSONResult itemResult;

            if(eClass_IsDerived(type, class(Container)))
            {
               arrayType = type.templateArgs[0].dataTypeClass;
            }

            if(arrayType && arrayType.type == structClass)
               value.p = new0 byte[arrayType.structSize];
            ch = 0;
            itemResult = GetValue(arrayType, value);
            if(itemResult == success)
            {
               // TODO: Verify the matching between template type and uint64
               uint64 t;
               if(arrayType && arrayType.type == structClass)
               {
                  t = (uint64)(uintptr)value.p;
               }
               else if(arrayType && (arrayType == class(double) || !strcmp(arrayType.dataTypeString, "double")))
               {
                  t = value.ui64; //*(uint64 *)&value.d;
               }
               else if(arrayType && (arrayType == class(float) || !strcmp(arrayType.dataTypeString, "float")))
               {
                  t = value.ui; //f*(uint *)&value.f;
               }
               else if(arrayType && (arrayType.typeSize == sizeof(int64) || !strcmp(arrayType.dataTypeString, "int64") ||
                  !strcmp(arrayType.dataTypeString, "unsigned int64") || !strcmp(arrayType.dataTypeString, "uint64")))
               {
                  t = value.ui64;
               }
               else if(arrayType && (arrayType.typeSize == sizeof(int) || !strcmp(arrayType.dataTypeString, "int") ||
                  !strcmp(arrayType.dataTypeString, "unsigned int") || !strcmp(arrayType.dataTypeString, "uint")))
               {
                  t = value.i;
               }
               else if(arrayType && (arrayType.typeSize == sizeof(short int) || !strcmp(arrayType.dataTypeString, "short") ||
                  !strcmp(arrayType.dataTypeString, "unsigned short") || !strcmp(arrayType.dataTypeString, "uint16") ||
                  !strcmp(arrayType.dataTypeString, "int16")))
               {
                  t = value.s;
               }
               else if(arrayType && (arrayType.typeSize == sizeof(byte) || !strcmp(arrayType.dataTypeString, "char") ||
                  !strcmp(arrayType.dataTypeString, "unsigned char") || !strcmp(arrayType.dataTypeString, "byte")))
               {
                  t = value.c;
               }
               else
               {
                  t = (uint64)(uintptr)value.p;
               }
               if(*array && (arrayType || value.p))
                  ((void *(*)(void *, uint64))(void *)array->Add)(*array, t);

               if(isAVLTree && value.p)
               {
                  if(arrayType && (!strcmp(arrayType.name, "String") || !strcmp(arrayType.dataTypeString, "char *")))
                     delete value.p;
                  else if(arrayType.type == normalClass)
                     eInstance_Delete(value.p);
                  else if(arrayType.type == systemClass)
                     delete value.p;
               }

               if(arrayType && arrayType.type == structClass)
                  delete value.p;
            }
            else
            {
               if(itemResult == typeMismatch)
               {
                  if(arrayType)
                     PrintLn("Warning: Incompatible value for array value, expected ", (String)arrayType.name);
               }
               else if(itemResult == noItem)
                  result = success;
               else
                  result = itemResult;
            }

            if(result != syntaxError)
            {
               if(ch != ']' && ch != ',')
               {
                  ch = 0;
                  SkipEmpty();
               }
               if(ch == ']')
               {
                  break;
               }
               else if(ch != ',')
                  result = syntaxError;
            }
         }
      }
      ch = 0;
      return result;
   }

   JSONResult GetMap(Class type, Map * map)
   {
      JSONResult result = syntaxError;
      SkipEmpty();
      *map = null;
      if(ch == '[')
      {
         Class mapNodeType = type.templateArgs[0].dataTypeClass;
         Class keyType = mapNodeType.templateArgs[0].dataTypeClass;
         Class valueType = mapNodeType.templateArgs[2].dataTypeClass;
         Property keyProp = null;
         if(keyType && !strcmp(keyType.dataTypeString, "char *"))
            keyProp = eClass_FindProperty(mapNodeType, "key", mapNodeType.module);

         *map = eInstance_New(type);
         result = success;

         while(result)
         {
            DataValue value { };

            JSONResult itemResult;

            ch = 0;
            itemResult = _GetValue(mapNodeType, value, *map);
            if(itemResult == success)
            {
               String s = keyProp ? ((void * (*)(void *))(void *)keyProp.Get)(value.p) : null;
               ((void *(*)(void *, uint64))(void *)map->Add)(*map, (uint64)(uintptr)value.p);
               // Must free String keys here
               delete s;
            }
            else
            {
               if(itemResult == typeMismatch)
               {
                  if(mapNodeType)
                     PrintLn("Warning: Incompatible value for array value, expected ", (String)mapNodeType.name);
               }
               else if(itemResult == noItem)
                  result = success;
               else
                  result = itemResult;
            }
            if(valueType && valueType.type == structClass)
               delete value.p;

            if(result != syntaxError)
            {
               if(ch != ']' && ch != ',')
               {
                  ch = 0;
                  SkipEmpty();
               }
               if(ch == ']')
               {
                  break;
               }
               else if(ch != ',')
                  result = syntaxError;
            }
         }
      }
      ch = 0;
      return result;
   }

   JSONResult GetJSONMap(Class type, Map * map)
   {
      JSONResult result = syntaxError;
      SkipEmpty();
      *map = null;
      if(ch == '{')
      {
         Class mapNodeType = type.templateArgs[0].dataTypeClass;
         Class valueType = mapNodeType.templateArgs[2].dataTypeClass;
         *map = eInstance_New(type);
         result = success;

         while(result)
         {
            DataValue value { };
            String string;
            bool wasQuoted = false;

            ch = 0;
            if(eCON)
            {
               SkipExtraSemicolon();
               if(ch == '}')
                  break;
            }
            SkipEmpty();

            if(eCON ? GetIdentifier(&string, &wasQuoted) : GetString(&string))
            {
               ch = 0;
               SkipEmpty();

               if(ch == ':' || (eCON && ch == '='))
               {
                  JSONResult itemResult;
                  if(ch == ':' || ch == '=')
                     ch = 0;
                  if(valueType.type == structClass)
                     value.p = new0 byte[valueType.structSize];
                  itemResult = GetValue(valueType, value);
                  if(itemResult == success)
                  {
                     IteratorPointer node = ((IteratorPointer (*)(Map, uint64, bool, void *))(void *)map->GetAtPosition)(*map, (uint64)(uintptr)string, true, null);

                     switch(valueType.type)
                     {
                        case normalClass:
                        case noHeadClass:
                        case structClass:
                           ((bool (*)(Map, IteratorPointer, uint64))(void *)map->SetData)(*map, node, (uint64)(uintptr)value.p);
                           break;
                        case systemClass:
                        default:
                           Print("Warning: Unhandled class type for JSON map ", (String)valueType.name);
                           break;
                     }
                  }
                  else
                  {
                     if(itemResult == typeMismatch)
                     {
                        if(mapNodeType)
                           PrintLn("Warning: Incompatible value for JSON map value, expected ", (String)valueType.name);
                     }
                     else if(itemResult == noItem)
                        result = success;
                     else
                        result = itemResult;
                  }
                  if(valueType.type == structClass)
                     delete value.p;
               }
            }

            if(result != syntaxError)
            {
               if(ch != '}' && ch != ',')
               {
                  ch = 0;
                  SkipEmpty();
               }
               if(ch == '}')
               {
                  break;
               }
               else if(ch != ',')
                  result = syntaxError;
            }
         }
      }
      ch = 0;
      return result;
   }

   JSONResult GetIdentifier(String * string, bool * wasQuoted)
   {
      JSONResult result = syntaxError;
      Array<char> buffer { minAllocSize = 256 };
      bool comment = false;
      bool quoted = false;

      *string = null;
      SkipEmpty();
      if(ch == '\"')
         quoted = true;
      else
         buffer.Add(ch);
      result = success;
      while(ReadChar(&ch))
      {
         if(!comment && !quoted && ch == '/')
         {
            if(ReadChar(&ch))
            {

               if(ch == '/')
                  break;
               else if(ch == '*')
                  comment = true;
               else
               {
                  result = syntaxError;
                  break;
               }
            }
            else
            {
               result = syntaxError;
               break;
            }
         }
         else if(comment && ch == '*')
         {
            if(ReadChar(&ch))
            {
               if(ch == '/')
               {
                  comment = false;
                  ch = 0;
               }
            }
            else
            {
               result = syntaxError;
               break;
            }
         }
         else if(ch == '\"' || (!quoted && !comment && ch && !isalpha(ch) && !isdigit(ch) && ch != '_'))
         {
            if(quoted && ch == '\"' && wasQuoted)
               *wasQuoted = true;
            break;
         }
         else if(!comment && ch)
         {
            buffer.Add(ch);
            if(buffer.minAllocSize < buffer.count)
               buffer.minAllocSize *= 2;
         }
      }
      if(result != syntaxError)
      {
         buffer.Add(0);
         *string = CopyString(buffer.array);
      }
      delete buffer;
      if(ch != ']' && ch != ',' && ch != '}' && ch != ';' && ch != '/' && ch != '=' && ch != ':')
         ch = 0;
      return result;
   }

   JSONResult GetString(String * string)
   {
      JSONResult result = syntaxError;
      Array<char> buffer { minAllocSize = 256 };
      bool escaped = false;

      *string = null;
      SkipEmpty();
      if(ch == '\"' || eCON)
      {
         while(ReadChar(&ch))
         {
            if(ch == '\\' && !escaped)
               escaped = true;
            else
            {
               if(escaped)
               {
                  if(ch == 'b') ch = '\b';
                  else if(ch == 'f') ch = '\f';
                  else if(ch == 'n') ch = '\n';
                  else if(ch == 'r') ch = '\r';
                  else if(ch == 't') ch = '\t';
                  else if(ch == 'u')
                  {
                     // SKIP FOR NOW...
                     char unicode[4];
                     ReadChar(&unicode[0]);
                     ReadChar(&unicode[1]);
                     ReadChar(&unicode[2]);
                     ReadChar(&unicode[3]);
                  }
                  escaped = false;
               }
               else if(eCON && ch == '\"')
               {
                  bool lineComment = false;
                  bool comment = false;
                  JSONParserState seekBackState;
                  bool seekBack = false;

                  while(!f.Eof())
                  {
                     JSONParserState backState;
                     BackUpState(backState);
                     if(!seekBack)
                     {
                        seekBack = true;
                        seekBackState = backState;
                     }
                     ReadChar(&ch);

                     if(!lineComment && !comment && backState.ch == '/')
                     {
                        if(ch == '/')
                           lineComment = true;
                        else if(ch == '*')
                           comment = true;
                     }
                     else if(lineComment && ch == '\n')
                        lineComment = false;
                     else if(comment && backState.ch == '*' && ch == '/')
                        comment = false;
                     else if(ch == '=' || ch == ':' || ch == ';' || ch == ',' || ch == ']' || ch == '}')
                     {
                        ch = 0;
                        seekBackState = backState;
                        seekBack = true;
                        break;
                     }
                     else if(ch == '\"')
                     {
                        seekBack = false;
                        ch = 0;
                        break;
                     }
                  }
                  if(seekBack)
                  {
                     ResetState(seekBackState);
                     break;
                  }
               }
               else if((!eCON && ch == '\"'))
               {
                  break;
               }
               if(ch)
               {
                  buffer.Add(ch);
                  if(buffer.minAllocSize < buffer.count)
                     buffer.minAllocSize *= 2;
               }
            }
         }
         buffer.Add(0);
         *string = CopyString(buffer.array);
         result = success;
      }
      delete buffer;
      if(ch != ',' && ch != '}' && (!eCON || (ch != ';' && ch != '/')))
         ch = 0;
      return result;
   }

   public JSONResult GetObject(Class objectType, void ** object)
   {
      charPos = 0, line = 1, col = 1, maxPos = 0;
      if(objectType && objectType.type == structClass)
      {
         memset(object, 0, objectType.structSize);
         return _GetObject(objectType, &object, null);
      }
      else
         return _GetObject(objectType, object, null);
   }

   static inline JSONResult _GetObject(Class objectType, void ** object, Container forMap)
   {
      JSONResult result = syntaxError;
      if(!objectType || objectType.type != structClass)
      {
         if(objectType && objectType.type == bitClass)
            *(uint64 *)object = 0;
         else
            *object = null;
      }
      SkipEmpty();
      if(!forMap && eCON && ch != '{')
      {
         DataValue value { };
         JSONResult result = GetValue(objectType, value);
         *object = value.p;
         return result;
      }
      if(ch == '{')
      {
         Class mapKeyClass = null, mapDataClass = null;
         Class curClass = null;
         DataMember curMember = null;
         DataMember subMemberStack[256];
         int subMemberStackPos = 0;
         uint64 bits = 0;

         if(objectType && objectType.type == bitClass)
         {
            switch(objectType.typeSize)
            {
               case 1: bits = (byte  )*(uint64 *)object; break;
               case 2: bits = (uint16)*(uint64 *)object; break;
               case 4: bits = (uint32)*(uint64 *)object; break;
               case 8: bits = (uint64)*(uint64 *)object; break;
            }
         }

         if(objectType && objectType.templateClass && eClass_IsDerived(objectType.templateClass, class(MapNode)))
         {
            mapKeyClass = objectType.templateArgs[0].dataTypeClass;
            mapDataClass = objectType.templateArgs[2].dataTypeClass;
         }

         result = success;
         if(objectType && (objectType.type == noHeadClass || objectType.type == normalClass))
            *object = eInstance_New(objectType);

         while(result)
         {
            String string;
            bool wasQuoted = false;
            JSONParserState backState;
            ch = 0;
            if(eCON)
            {
               SkipExtraSemicolon();
               if(ch == '}')
                  break;
            }
            SkipEmpty();
            BackUpState(backState);
            if(eCON ? GetIdentifier(&string, &wasQuoted) : GetString(&string))
            {
               DataMember member = null;
               Property prop = null;
               Class type = null;
               bool isKey = false;
               bool isTemplateArg = false;
               uint offset = 0;

               ch = 0;
               SkipEmpty();

               // Find Member in Object Class
               if(eCON && (ch != '=' && ch != ':'))
               {
                  eClass_FindNextMember(objectType, &curClass, &curMember, subMemberStack, &subMemberStackPos);
                  if(curMember)
                  {
                     prop = curMember.isProperty ? (Property)curMember : null;
                     member = curMember.isProperty ? null : curMember;

                     // TODO: Document/Improve this!
                     eClass_FindDataMemberAndOffset(objectType, curMember.name, &offset, objectType.module, null, null);
                     if(curMember._class.type == normalClass || curMember._class.type == noHeadClass)
                        offset += curMember._class.base.structSize;

                     if(mapKeyClass && !strcmp(prop ? prop.name : member.name, "key"))
                     {
                        type = mapKeyClass;
                        isTemplateArg = true;
                        isKey = true;
                     }
                     else if(mapDataClass && !strcmp(prop ? prop.name : member.name, "value"))
                     {
                        type = mapDataClass;
                        isTemplateArg = true;
                        if(member)
                           offset = member._class.offset + member.offset;
                     }
                     else if(prop)
                        type = superFindClass(prop.dataTypeString, objectType.module);
                     else if(member)
                        type = superFindClass(member.dataTypeString, objectType.module);
                  }
                  else
                  {
                     if(ch == '=' || ch == ':')
                        PrintLn("Warning: member ", string, " not found in class ", (String)objectType.name);
                     else
                        PrintLn("Warning: default member assignment: no more members");
                  }
               }
               else if(objectType)
               {
                  if(!eCON || wasQuoted)
                     string[0] = (char)tolower(string[0]);
                  if(mapKeyClass && !strcmp(string, "key"))
                  {
                     prop = eClass_FindProperty(objectType, "key", objectType.module);
                     type = mapKeyClass;
                     isTemplateArg = true;
                     isKey = true;
                  }
                  else if(mapDataClass && !strcmp(string, "value"))
                  {
                     prop = eClass_FindProperty(objectType, "value", objectType.module);
                     type = mapDataClass;
                     isTemplateArg = true;
                  }
                  else
                  {
                     int c;
                     for(c = 0; c < ((!eCON || wasQuoted) ? 2 : 1); c++)
                     {
                        if(c == 1)
                           string[0] = (char)toupper(string[0]);
                        member = eClass_FindDataMemberAndOffset(objectType, string, &offset, objectType.module, subMemberStack, &subMemberStackPos);
                        if(member)
                        {
                           type = superFindClass(member.dataTypeString, objectType.module);
                           if(member._class.type == normalClass || member._class.type == noHeadClass)
                              offset += member._class.base.structSize;
                           curMember = member;
                           curClass = member._class;
                           break;
                        }
                        else if(!member)
                        {
                           prop = eClass_FindProperty(objectType, string, objectType.module);
                           if(prop)
                           {
                              type = superFindClass(prop.dataTypeString, objectType.module);
                              curMember = (DataMember)prop;
                              curClass = prop._class;
                              break;
                           }
                           else if(c == 1)
                           {
                              string[0] = (char)tolower(string[0]);
                              PrintLn("Warning: member ", string, " not found in class ", (String)objectType.name);
                           }
                        }
                     }
                  }
               }

#ifdef _DEBUG
               if(objectType && !member && !prop)
               {
                  PrintLn("Warning: member ", string, " not found in class ", (String)objectType.name);
               }
#endif

               if(type && type.templateClass && type.templateClass == class(Container))
               {
                  char * br = strchr(type.fullName, '<');
                  if(br)
                  {
                     char className[1024];
                     strcpy(className, "Array");
                     strcat(className, br);
                     type = superFindClass(className, objectType.module);
                  }
               }

               {
                  DataValue value { };

                  if(type && type.type == structClass)
                  {
                     if(member)
                     {
                        value.p = (byte *)*object + offset;
                        memset(value.p, 0, type.structSize);
                     }
                     else if(prop)
                     {
                        value.p = new0 byte[type.structSize];
                     }
                  }
                  if((ch == ':' || (eCON && ch == '=')) || (eCON && type && (prop || member)))
                  {
                     JSONResult itemResult;
                     if(ch == ':' || ch == '=')
                        ch = 0;
                     else
                        ResetState(backState);

                     itemResult = GetValue(type, value);
                     if(itemResult != syntaxError)
                     {
                        if(prop || member)
                        {
                           if(!type)
                              PrintLn("warning: Unresolved data type ", member ? (String)member.dataTypeString : (String)prop.dataTypeString);
                           else if(itemResult == success)
                           {
                              BitMember bitMember = objectType.type == bitClass ? (BitMember) member : null;
                              // Set value
                              if(member)
                              {
                                 // TOFIX: How to swiftly handle classes with base data type?
                                 if(type.type == structClass)
                                    ;
                                 else if(type.type == normalClass || type.type == noHeadClass)
                                 {
                                    void ** ptr = (void**)((byte *)*object + offset);
                                    if(eClass_IsDerived(type, class(Container)) && *ptr)
                                    {
                                       Container container = (Container)*ptr;
                                       container.Free();
                                       delete container;
                                    }
                                    *ptr = value.p;
                                 }
                                 else if(type == class(double) || !strcmp(type.dataTypeString, "double"))
                                 {
                                    if(objectType.type != bitClass)
                                    {
                                       *(double *)((byte *)*object + offset) = value.d;
                                    }
                                 }
                                 else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
                                 {
                                    if(objectType.type != bitClass)
                                    {
                                       *(float *)((byte *)*object + offset) = value.f;
                                    }
                                 }
                                 else if(type.typeSize == sizeof(int64) || !strcmp(type.dataTypeString, "int64") ||
                                    !strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64"))
                                 {
                                    if(objectType.type == bitClass)
                                    {
                                       bits &= ~bitMember.mask;
                                       bits |= (value.ui64 << bitMember.pos) & bitMember.mask;
                                    }
                                    else
                                    {
                                       *(uint64 *)((byte *)*object + offset) = value.ui64;
                                    }
                                 }
                                 else if(type.typeSize == sizeof(int) || !strcmp(type.dataTypeString, "int") ||
                                    !strcmp(type.dataTypeString, "unsigned int") || !strcmp(type.dataTypeString, "uint"))
                                 {
                                    if(objectType.type == bitClass)
                                    {
                                       bits &= ~bitMember.mask;
                                       bits |= (value.ui << bitMember.pos) & bitMember.mask;
                                    }
                                    else
                                    {
                                       *(int *)((byte *)*object + offset) = value.i;
                                    }
                                 }
                                 else if(type.typeSize == sizeof(short int) || !strcmp(type.dataTypeString, "short") ||
                                    !strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") ||
                                    !strcmp(type.dataTypeString, "int16"))
                                 {
                                    if(objectType.type == bitClass)
                                    {
                                       bits &= ~bitMember.mask;
                                       bits |= (value.us << bitMember.pos) & bitMember.mask;
                                    }
                                    else
                                    {
                                       *(short *)((byte *)*object + offset) = value.s;
                                    }
                                 }
                                 else if(type.typeSize == sizeof(byte) || !strcmp(type.dataTypeString, "char") ||
                                    !strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte"))
                                 {
                                    if(objectType.type == bitClass)
                                    {
                                       bits &= ~bitMember.mask;
                                       bits |= (value.uc << bitMember.pos) & bitMember.mask;
                                    }
                                    else
                                    {
                                       *(char *)((byte *)*object + offset) = value.c;
                                    }
                                 }
                                 else
                                 {
                                    if(objectType.type != bitClass)
                                       *(void **)((byte *)*object + offset) = value.p;
                                 }
                              }
                              else if(prop && prop.Set)
                              {
                                 if(objectType.type == bitClass)
                                 {
                                    if(type.type == enumClass || type.type == bitClass || type.type == unitClass || type.type == systemClass)
                                    {
                                       switch(objectType.typeSize)
                                       {
                                          case 1:
                                             switch(type.typeSize)
                                             {
                                                case 1: ((byte (*)(byte, byte))  (void *)prop.Set)((byte)bits, value.uc); break;
                                                case 2: ((byte (*)(byte, uint16))(void *)prop.Set)((byte)bits, value.us); break;
                                                case 4: ((byte (*)(byte, uint32))(void *)prop.Set)((byte)bits, value.ui); break;
                                                case 8: ((byte (*)(byte, uint64))(void *)prop.Set)((byte)bits, value.ui64); break;
                                             }
                                             break;
                                          case 2:
                                             switch(type.typeSize)
                                             {
                                                case 1: ((uint16 (*)(uint16, byte))  (void *)prop.Set)((uint16)bits, value.uc); break;
                                                case 2: ((uint16 (*)(uint16, uint16))(void *)prop.Set)((uint16)bits, value.us); break;
                                                case 4: ((uint16 (*)(uint16, uint32))(void *)prop.Set)((uint16)bits, value.ui); break;
                                                case 8: ((uint16 (*)(uint16, uint64))(void *)prop.Set)((uint16)bits, value.ui64); break;
                                             }
                                             break;
                                          case 4:
                                             switch(type.typeSize)
                                             {
                                                case 1: ((uint32 (*)(uint32, byte))  (void *)prop.Set)((uint32)bits, value.uc); break;
                                                case 2: ((uint32 (*)(uint32, uint16))(void *)prop.Set)((uint32)bits, value.us); break;
                                                case 4: ((uint32 (*)(uint32, uint32))(void *)prop.Set)((uint32)bits, value.ui); break;
                                                case 8: ((uint32 (*)(uint32, uint64))(void *)prop.Set)((uint32)bits, value.ui64); break;
                                             }
                                             break;
                                          case 8:
                                             switch(type.typeSize)
                                             {
                                                case 1: ((uint64 (*)(uint64, byte))  (void *)prop.Set)((uint64)bits, value.uc); break;
                                                case 2: ((uint64 (*)(uint64, uint16))(void *)prop.Set)((uint64)bits, value.us); break;
                                                case 4: ((uint64 (*)(uint64, uint32))(void *)prop.Set)((uint64)bits, value.ui); break;
                                                case 8: ((uint64 (*)(uint64, uint64))(void *)prop.Set)((uint64)bits, value.ui64); break;
                                             }
                                             break;
                                       }
                                    }
                                    else
                                       ; // TODO: Generate error
                                 }
                                 else if(!strcmp(type.dataTypeString, "char *"))
                                 {
                                    ((void (*)(void *, void *))(void *)prop.Set)(*object, value.p);
                                    if(!isKey)
                                       delete value.p;
                                 }
                                 else if(type.type == enumClass || type.type == bitClass || type.type == unitClass || type.type == systemClass)
                                 {
                                    // TOFIX: How to swiftly handle classes with base data type?
                                    if(type == class(double) || !strcmp(type.dataTypeString, "double"))
                                    {
                                       ((void (*)(void *, double))(void *)prop.Set)(*object, value.d);
                                    }
                                    else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
                                    {
                                       ((void (*)(void *, float))(void *)prop.Set)(*object, value.f);
                                    }
                                    else if(type.typeSize == sizeof(int64) || !strcmp(type.dataTypeString, "int64") ||
                                       !strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64"))
                                    {
                                       ((void (*)(void *, uint64))(void *)prop.Set)(*object, value.ui64);
                                    }
                                    else if(type.typeSize == sizeof(int) || !strcmp(type.dataTypeString, "int") ||
                                       !strcmp(type.dataTypeString, "unsigned int") || !strcmp(type.dataTypeString, "uint"))
                                    {
                                       ((void (*)(void *, int))(void *)prop.Set)(*object, value.i);
                                    }
                                    else if(type.typeSize == sizeof(short int) || !strcmp(type.dataTypeString, "short") ||
                                       !strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") ||
                                       !strcmp(type.dataTypeString, "int16"))
                                    {
                                       ((void (*)(void *, short))(void *)prop.Set)(*object, value.s);
                                    }
                                    else if(type.typeSize == sizeof(byte) || !strcmp(type.dataTypeString, "char") ||
                                       !strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte"))
                                    {
                                       ((void (*)(void *, char))(void *)prop.Set)(*object, value.c);
                                    }
                                    else
                                    {
                                       ((void (*)(void *, int))(void *)prop.Set)(*object, value.i);
                                    }
                                 }
                                 else
                                 {
                                    if(isTemplateArg)
                                    {
                                       if(forMap && objectType.templateClass == class(MapNode))
                                       {
                                          if(isKey)
                                          {
                                             Class keyClass = objectType.templateArgs[0].dataTypeClass;
                                             void (* onCopy)(void *, void *, void *) = keyClass._vTbl[__ecereVMethodID_class_OnCopy];
                                             onCopy(keyClass, (byte *)&((MapNode)*object).key + __ENDIAN_PAD(sizeof(void *)), value.p);
                                          }
                                          else
                                          {
                                             // TOFIX: Silly cast here to work around eC compiler generics warning
                                             ((Map<int, uint64>)forMap).SetData(*object, (uint64)(uintptr)value.p);
                                          }
                                       }
                                       else
                                          ((void (*)(void *, uint64))(void *)prop.Set)(*object, (uint64)(uintptr)value.p);
                                    }
                                    else
                                       ((void (*)(void *, void *))(void *)prop.Set)(*object, value.p);
                                 }
                              }
                           }
                           else
                           {
                              PrintLn("Warning: Incompatible value for ", member ? (String)member.name : (String)prop.name,
                                 ", expected ", member ? (String)member.dataTypeString : (String)prop.dataTypeString);
                           }
                        }
                     }
                  }
                  else
                     result = syntaxError;

                  if(prop && type && type.type == structClass)
                  {
                     delete value.p;
                  }
               }
            }
            else if(ch && ch != '}' && ch != ',' && (!eCON || ch != ';'))
               result = syntaxError;
            delete string;

            if(result)
            {
               SkipEmpty();
               if(ch == '}')
               {
                  break;
               }
               else if(ch != ',' && (!eCON || ch != ';'))
                  result = syntaxError;
            }
         }

         if(objectType && objectType.type == bitClass)
         {
            switch(objectType.typeSize)
            {
               case 1: *(uint64 *)object = (byte)   bits; break;
               case 2: *(uint64 *)object = (uint16) bits; break;
               case 4: *(uint64 *)object = (uint32) bits; break;
               case 8: *(uint64 *)object = (uint64) bits; break;
            }
         }
      }
      ch = 0;
      return result;
   }

   JSONResult GetNumber(Class type, DataValue value)
   {
      JSONResult result = success;
      char buffer[256];
      int c = 0;
      bool comment = false;
      bool hexMode = false;
      if(eCON)
      {
         while(c < sizeof(buffer)-1 && (comment || ch == '-' || ch == '.' || tolower(ch) == 'f' ||
                     (c == 1 && tolower(ch) == 'x' && buffer[0] == '0') || tolower(ch) == 'e' || ch == '+' || isdigit(ch) || ch == '/' ||
                     (hexMode && ((ch >= 'a' && ch <= 'f') || (ch >= 'A' && ch <= 'F')))))
         {
            if(!comment && ch == '/')
            {
               if(ReadChar(&ch))
               {
                  if(ch == '*')
                     comment = true;
               }
               else
               {
                  result = syntaxError;
                  break;
               }
            }
            else if(comment && ch == '*')
            {
               if(ReadChar(&ch))
               {
                  if(ch == '/')
                     comment = false;
               }
               else
               {
                  result = syntaxError;
                  break;
               }
            }
            else if(!comment)
            {
               if(c == 1 && ch == 'x' && buffer[0] == '0')
                  hexMode = true;
               buffer[c++] = ch;
            }
            if(!ReadChar(&ch)) break;
         }
      }
      else
      {
         while(c < sizeof(buffer)-1 && (ch == '-' || ch == '.' || tolower(ch) == 'e' || ch == '+' || isdigit(ch)))
         {
            buffer[c++] = ch;
            if(!ReadChar(&ch)) break;
         }
      }
      buffer[c] = 0;
      //if(strchr(buffer, '.'))
      if(result == syntaxError)
         return result;
      if(!type) return success;
      result = syntaxError;

      // TOFIX: How to swiftly handle classes with base data type?
      if(type == class(double) || !strcmp(type.dataTypeString, "double"))
      {
         value.d = strtod(buffer, null);
         result = success;
      }
      else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
      {
         value.f = (float)strtod(buffer, null);
         result = success;
      }
      // TOFIX: int64 looks for class long long?
      //else if(type == class(int64) || !strcmp(type.dataTypeString, "int64"))
      else if(!strcmp(type.dataTypeString, "int64"))
      {
         value.i64 = strtol(buffer, null, eCON ? 0 : 10);  // TOFIX: 64 bit support
         result = success;
      }
      else if(type == class(uint64) || !strcmp(type.dataTypeString, "uint64"))
      {
         value.ui64 = strtoul(buffer, null, eCON ? 0 : 10);  // TOFIX: 64 bit support
         result = success;
      }
      else if(type == class(uint) || !strcmp(type.dataTypeString, "unsigned int") || !strcmp(type.dataTypeString, "uint"))
      {
         value.ui = (uint)strtoul(buffer, null, eCON ? 0 : 10);  // TOFIX: 64 bit support
         result = success;
      }
      else if(type.type != structClass && type.type != noHeadClass && type.type != normalClass)
      {
         value.i = (int)strtol(buffer, null, eCON ? 0 : 10);
         result = success;
      }
      else
         result = typeMismatch;

      if(result == success && type.type == unitClass)
      {
         // Convert to reference unit
         Property prop;
         for(prop = type.conversions.first; prop; prop = prop.next)
         {
            bool refProp = false;
            if(!strcmp(prop.name, type.base.fullName))
               refProp = true;
            else
            {
               Class c = eSystem_FindClass(type.module, prop.name);
               if(!c)
                  c = eSystem_FindClass(type.module.application, prop.name);
               if(c)
               {
                  Property p;
                  for(p = c.conversions.first; p; p = p.next)
                  {
                     if(!strcmp(p.name, type.base.fullName) && !p.Set && !p.Get)
                     {
                        refProp = true;
                        break;
                     }
                  }
               }
            }
            if(refProp)
            {
               if(prop.Set && prop.Get)
               {
                  const String dts = type.base.dataTypeString;
                  if(!strcmp(dts, "double"))
                     value.d = ((double(*)(double))(void *)prop.Get)(value.d);
                  else if(!strcmp(dts, "float"))
                     value.f = ((float(*)(float))(void *)prop.Get)(value.f);
                  else if(!strcmp(dts, "int"))
                     value.i = ((int(*)(int))(void *)prop.Get)(value.i);
                  else if(!strcmp(dts, "int64"))
                     value.i64 = ((int64(*)(int64))(void *)prop.Get)(value.i64);
                  else if(!strcmp(dts, "unsigned int"))
                     value.ui = ((uint(*)(uint))(void *)prop.Get)(value.ui);
                  else if(!strcmp(dts, "uint64"))
                     value.ui64 = ((uint64(*)(uint64))(void *)prop.Get)(value.ui64);
               }
               else
                  break;
            }
         }
      }
      return result;
   }

   JSONResult GetColorAlpha(String string, DataValue value)
   {
      ColorAlpha color = 0;
      DefinedColor c = 0;
      if(string)
      {
         if(string[0] == '0' && string[1] == 'x')
            color = (uint)strtoul(string, null, 0);
         else
         {
            char *d;
            byte a = 255;
            if((d = strchr(string, ',')))
            {
               a = (byte)atoi(string);
               d += 2;
            }
            else
               d = string;
            if(c.class::OnGetDataFromString(d))
            {
               color.a = a;
               color.color = c;
            }
            else
               color = (uint)strtoul(string, null, 16);
         }
      }
      value.i = color;
      return success;
   }
}

static bool WriteMap(File f, Class type, Map map, int indent, bool eCON)
{
   if(map)
   {
      int i;
      bool isFirst = true;
      Class arrayType = (type = map._class, type.templateArgs[0].dataTypeClass);
      const String tArg = strchr(arrayType.name, '<');
      bool spacing = tArg && (strchr(tArg + 1, '<') || strstr(tArg + 1, "GeometryData") || strstr(tArg + 1, "UMSFieldValue"));
      MapIterator it { map = map };
      Class mapNodeClass = map._class.templateArgs[0].dataTypeClass;
      bool jsonDicMap = false;
      if(mapNodeClass && mapNodeClass.templateClass && eClass_IsDerived(mapNodeClass.templateClass, class(MapNode)))
      {
         Class mapKeyClass = mapNodeClass.templateArgs[0].dataTypeClass;
         Class mapDataClass = mapNodeClass.templateArgs[2].dataTypeClass;
         if(!eCON && (!strcmp(mapKeyClass.name, "UMSFormatType") || strstr(mapDataClass.name, "UMSFieldValue")))
            jsonDicMap = true;
      }

      if(jsonDicMap)
         f.Puts(spacing ? "{\n" : "{ ");
      else
         f.Puts(spacing ? "[\n" : "[ ");
      if(spacing) indent++;

      while(it.Next())
      {
         MapNode n = (MapNode)it.pointer;
         if(!isFirst)
            f.Puts(spacing ? ",\n" : ", ");
         else
            isFirst = false;
         if(spacing) for(i = 0; i<indent; i++) f.Puts("   ");
         WriteONObject(f, mapNodeClass, n, indent, eCON, eCON ? true : false, map);
      }
      if(spacing)
      {
         f.Puts("\n");
         indent--;
         for(i = 0; i<indent; i++) f.Puts("   ");
      }
      else
         f.Puts(" ");
      if(jsonDicMap)
         f.Puts("}");
      else
         f.Puts("]");
   }
   else
      f.Puts("null");
   return true;
}

static bool WriteArray(File f, Class type, Container array, int indent, bool eCON)
{
   if(array)
   {
      int i;
      bool isFirst = true;
      Iterator it { array };
      Class arrayType = type.templateArgs[0].dataTypeClass;
      const String tName = arrayType ? (arrayType.templateClass ? arrayType.templateClass.name : arrayType.name) : "";
      bool spacing = compactArrays.Find(tName) == null;
      f.Puts(spacing ? "[\n" : "[ ");
      if(spacing) indent++;

      while(arrayType && it.Next())
      {
         DataValue value { };
         uint64 t = ((uint64(*)(void *, void *))(void *)array.GetData)(array, it.pointer);
         if(!isFirst)
            f.Puts(spacing ? ",\n" : ", ");
         else
            isFirst = false;

         // Add value
         // TODO: Verify the matching between template type and uint64
         if(arrayType.type == structClass)
         {
            value.p = (void *)(uintptr)t;
         }
         else if(arrayType == class(double) || !strcmp(arrayType.dataTypeString, "double"))
         {
            value.ui64 = t;
            //value.d = *(double *)&t;
         }
         else if(arrayType == class(float) || !strcmp(arrayType.dataTypeString, "float"))
         {
            value.ui = (uint)t;
            //value.f = *(float *)&t;
         }
         else if(arrayType.typeSize == sizeof(int64) || !strcmp(arrayType.dataTypeString, "int64") ||
            !strcmp(arrayType.dataTypeString, "unsigned int64") || !strcmp(arrayType.dataTypeString, "uint64"))
         {
            value.ui64 = t;
         }
         else if(arrayType.typeSize == sizeof(int) || !strcmp(arrayType.dataTypeString, "int") ||
            !strcmp(arrayType.dataTypeString, "unsigned int") || !strcmp(arrayType.dataTypeString, "uint"))
         {
            value.i = (int)t;
         }
         else if(arrayType.typeSize == sizeof(short int) || !strcmp(arrayType.dataTypeString, "short") ||
            !strcmp(arrayType.dataTypeString, "unsigned short") || !strcmp(arrayType.dataTypeString, "uint16") ||
            !strcmp(arrayType.dataTypeString, "int16"))
         {
            value.s = (short)t;
         }
         else if(arrayType.typeSize == sizeof(byte) || !strcmp(arrayType.dataTypeString, "char") ||
            !strcmp(arrayType.dataTypeString, "unsigned char") || !strcmp(arrayType.dataTypeString, "byte"))
         {
            value.c = (char)t;
         }
         else
         {
            value.p = (void *)(uintptr)t;
         }
         if(spacing) for(i = 0; i<indent; i++) f.Puts("   ");
         WriteValue(f, arrayType, value, indent, eCON, false);
      }
      if(spacing)
      {
         f.Puts("\n");
         indent--;
         for(i = 0; i<indent; i++) f.Puts("   ");
      }
      else
         f.Puts(" ");
      f.Puts("]");
   }
   else
      f.Puts("null");
   return true;
}

static bool WriteNumber(File f, Class type, DataValue value, int indent, bool eCON, bool useHex, bool jsonBitClass, bool forceQuotes)
{
   char buffer[1024];
   ObjectNotationType onType = eCON ? econ : json;
   bool quote;
   buffer[0] = 0;
   if(type == class(double) || !strcmp(type.dataTypeString, "double"))
      ((const char *(*)(void *, void *, char *, void *, ObjectNotationType *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.d, buffer, 0, &onType);
   else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
      ((const char *(*)(void *, void *, char *, void *, ObjectNotationType *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.f, buffer, null, &onType);
   else if(!strcmp(type.dataTypeString, "int64"))
      ((const char *(*)(void *, void *, char *, void *, ObjectNotationType *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.i64, buffer, null, &onType);
   else if(!strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64") || type.typeSize == sizeof(int64))
   {
      if(useHex && eCON)
         sprintf(buffer, __runtimePlatform == win32 ? "0x%016I64X" : "0x%016llX", value.ui64);
      else
         ((const char *(*)(void *, void *, char *, void *, ObjectNotationType *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.ui64, buffer, null, &onType);
   }
   else if(!strcmp(type.dataTypeString, "int"))
      ((const char *(*)(void *, void *, char *, void *, ObjectNotationType *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.i, buffer, null, &onType);
   else if(!strcmp(type.dataTypeString, "unsigned int") || !strcmp(type.dataTypeString, "uint") || type.typeSize == sizeof(int))
   {
      if(useHex && eCON)
         sprintf(buffer, "0x%08X", value.ui);
      else
         ((const char *(*)(void *, void *, char *, void *, ObjectNotationType *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.ui, buffer, null, &onType);
   }
   else if(!strcmp(type.dataTypeString, "short") || !strcmp(type.dataTypeString, "int16"))
      ((const char *(*)(void *, void *, char *, void *, ObjectNotationType *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.s, buffer, null, &onType);
   else if(!strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") || type.typeSize == sizeof(short int))
      ((const char *(*)(void *, void *, char *, void *, ObjectNotationType *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.us, buffer, null, &onType);
   else if(!strcmp(type.dataTypeString, "char"))
      ((const char *(*)(void *, void *, char *, void *, ObjectNotationType *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.c, buffer, null, &onType);
   else if(!strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte") || type.typeSize == sizeof(byte))
      ((const char *(*)(void *, void *, char *, void *, ObjectNotationType *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.uc, buffer, null, &onType);

   quote = forceQuotes || (!jsonBitClass && ((type.type == unitClass && ((buffer[0] != '.' && buffer[0] != '-' && !isdigit(buffer[0])) || strchr(buffer, ' '))) ||
           (type.type == enumClass && !eCON)));
   if(quote) f.Puts("\"");
     // TODO: Review / Clarify / Document how needClass should work
   else if((onType == econ || (onType == json && jsonBitClass)) && type.type == bitClass) f.Puts("{ ");
   f.Puts(buffer);
   if(quote) f.Puts("\"");
   else if((onType == econ || (onType == json && jsonBitClass)) && type.type == bitClass) f.Puts(" }");
   return true;
}

static bool WriteColorAlpha(File f, Class type, DataValue value, int indent, bool eCON)
{
   char tmpColorString[1024], output[1024];
   ColorAlpha color = value.ui;
   DefinedColor c = color.color;
   bool needBrackets = false, needQuotes = false;
   ObjectNotationType onType = eCON ? econ : json;
   const String s = c.class::OnGetString(tmpColorString, null, &onType);
   if(s)
   {
      if(color.a == 255)
         strcpy(output, s);
      else
      {
         needQuotes = !eCON;
         needBrackets = eCON;
         sprintf(output, "%d, %s", color.a, s);
      }
   }
   else
   {
      sprintf(output, "0x%x", color);
      needQuotes = !eCON;
   }
   if(needQuotes) f.Puts("\""); else if(needBrackets) f.Puts("{ ");
   f.Puts(output);
   if(needQuotes) f.Puts("\""); else if(needBrackets) f.Puts(" }");
   return true;
}

public bool WriteONString(File f, String s, bool eCON, int indent)
{
   if(!s)
      f.Puts("null");
   else
   {
      f.Puts("\"");
      {
         int c = 0;
         int b = 0;
         char buffer[1024];
         char * string = s;
         char ch;
         while(true)
         {
            ch = string[c++];
            if(ch == '\"')
            {
               buffer[b] = 0;
               f.Puts(buffer);
               f.Puts("\\\"");
               b = 0;
            }
            else if(ch == '\\')
            {
               buffer[b] = 0;
               f.Puts(buffer);
               f.Puts("\\\\");
               b = 0;
            }
            else if(eCON && ch == '\t')
            {
               buffer[b] = 0;
               f.Puts(buffer);
               f.Puts("\\t");
               b = 0;
            }
            else if(eCON && ch == '\n')
            {
               int i;
               buffer[b] = 0;
               f.Puts(buffer);
               f.Puts("\\n\"\n");
               for(i = 0; i<indent; i++) f.Puts("   ");
               f.Puts("   \"");
               b = 0;
            }
            else if(eCON && c >= 4 && ch == '>' && string[c-2] == 'r' && string[c-3] == 'b' && string[c-4] == '<')
            {
               // Add an automatic newline for <br> as this is how we imported documentor data...
               int i;
               buffer[b] = 0;
               f.Puts(buffer);
               f.Puts(">\"\n");
               for(i = 0; i<indent; i++) f.Puts("   ");
               f.Puts("   \"");
               b = 0;
            }
            else if(b == sizeof(buffer)-2 || !ch)
            {
               buffer[b++] = ch;
               if(ch) buffer[b] = 0;
               f.Puts(buffer);
               b = 0;
               if(!ch) break;
            }
            else
               buffer[b++] = ch;
         }
      }
      f.Puts("\"");
   }
   return true;
}

static bool WriteValue(File f, Class type, DataValue value, int indent, bool eCON, bool forceQuotes)
{
   if(!strcmp(type.name, "String") || !strcmp(type.dataTypeString, "char *"))
      WriteONString(f, value.p, eCON, indent);
   else if(!strcmp(type.name, "bool"))
      f.Puts(value.i ? "true" : "false");
   else if(!strcmp(type.name, "SetBool"))
      f.Puts(value.i == SetBool::true ? "true" : value.i == SetBool::false ? "false" : "unset");
   else if(type.type == enumClass)
      WriteNumber(f, type, value, indent, eCON, false, false, forceQuotes);
   else if(eClass_IsDerived(type, class(Map)))
      WriteMap(f, type, value.p, indent, eCON);
   else if(eClass_IsDerived(type, class(Container)))
      WriteArray(f, type, value.p, indent, eCON);
   else if(type.type == normalClass || type.type == noHeadClass || type.type == structClass)
   {
      bool omitNames = type.type == structClass && type.members.count < 5 && !strstr(type.name, "GeometryData") && (type.members.count == type.membersAndProperties.count || !strcmp(type.name, "GeoExtent") || !strcmp(type.name, "GeoPoint") || !strcmp(type.name, "UMSRowsSpecs"));
      WriteONObject(f, type, value.p, indent, eCON, eCON && omitNames, null);
   }
   else if(eClass_IsDerived(type, class(ColorAlpha)))
      WriteColorAlpha(f, type, value, indent, eCON);
   else if(type.type == bitClass)
   {
      if(eCON || !strcmp(type.name, "MapDataType"))
         WriteNumber(f, type, value, indent, eCON, false, true, forceQuotes);
      else
         WriteNumber(f, superFindClass(type.dataTypeString, type.module), value, indent, false, true, false, forceQuotes);
   }
   else if(type.type == systemClass || type.type == unitClass)
      WriteNumber(f, type, value, indent, eCON, false, false, forceQuotes);
   return true;
}

public bool WriteJSONObject(File f, Class objectType, void * object, int indent)
{
   bool result = false;
   if(object)
   {
      result = WriteONObject(f, objectType, object, indent, false, false, null);
      f.Puts("\n");
   }
   return result;
}

public bool WriteECONObject(File f, Class objectType, void * object, int indent)
{
   bool result = false;
   if(object)
   {
      result = WriteONObject(f, objectType, object, indent, true, false, null);
      f.Puts("\n");
   }
   return result;
}

public String PrintECONObject(Class objectType, void * object, int indent)
{
   String result = null;
   if(object)
   {
      TempFile f { };
      if(WriteONObject(f, objectType, object, indent, true, false, null))
      {
         f.Putc(0);
         result = (String)f.StealBuffer();
      }
      delete f;
   }
   return result;
}


static bool WriteONObject(File f, Class objectType, void * object, int indent, bool eCON, bool omitDefaultIdentifier, Container forMap)
{
   const String tName = objectType.templateClass ? objectType.templateClass.name : objectType.name;
   bool spacing = compactTypes.Find(tName) == null;
   if(object)
   {
      const char * string = null;
      bool quote = true;
      ObjectNotationType onType = eCON ? econ : json;

      if(objectType._vTbl[__ecereVMethodID_class_OnGetString] != objectType.base._vTbl[__ecereVMethodID_class_OnGetString])
      {
         char buffer[1024];
         buffer[0] = 0;
         string = ((const char *(*)())(void *)objectType._vTbl[__ecereVMethodID_class_OnGetString])(objectType, object, buffer, null, &onType);
         quote = false;
      }
      if(string)
      {
         // TOCHECK: ProjectNode.ec why do we add quotes in OnGetString there?
         {
            if(quote) f.Puts("\"");
            f.Puts(string);
            if(quote) f.Puts("\"");
         }
      }
      else
      {
         Class _class = (objectType.type == normalClass) ? ((Instance)object)._class : objectType;
         Property prop;
         int c;
         bool isFirst = true;
         Class mapKeyClass = null, mapDataClass = null;
         Class baseClass;
         List<Class> bases { };
         bool cantOmit = false;
         Class jsonClass = null;
         bool jsonDicMap = false;

         if(objectType.templateClass && eClass_IsDerived(objectType.templateClass, class(MapNode)))
         {
            mapKeyClass = objectType.templateArgs[0].dataTypeClass;
            mapDataClass = objectType.templateArgs[2].dataTypeClass;
            if(!eCON && (!strcmp(mapKeyClass.name, "UMSFormatType") || strstr(mapDataClass.name, "UMSFieldValue")))
               jsonDicMap = true;
         }

         if(_class && _class.bindingsClass) _class = _class.base;
         if(_class != objectType && eClass_IsDerived(_class, objectType))
         {
            if(eCON)
            {
               f.Puts(_class.name);
               f.Puts(" ");
            }
            else
               jsonClass = _class;
         }

         if(!jsonDicMap)
            f.Puts(spacing ? "{\n" : omitDefaultIdentifier ? "{" : "{ ");
         if(spacing) indent++;

         if(jsonClass)
         {
            if(spacing) for(c = 0; c<indent; c++) f.Puts("   ");
            f.Print("\"JSONType\" : \"", jsonClass.name, "\"");
            isFirst = false;
         }

         for(baseClass = _class; baseClass; baseClass = baseClass.inheritanceAccess == publicAccess ? baseClass.base : null)
         {
            if(baseClass.isInstanceClass || !baseClass.base)
               break;
            bases.Insert(null, baseClass);
         }

         for(baseClass : bases)
         {
            for(prop = baseClass.membersAndProperties.first; prop; prop = prop.next)
            {
               if(prop.memberAccess != publicAccess || (prop.isProperty && (!prop.Set || !prop.Get))) continue;
               if(prop.isProperty)
               {
                  if(!prop.conversion && (!prop.IsSet || prop.IsSet(object)))
                  {
                     DataValue value { };
                     bool isTemplateArg = false;
                     Class type;
                     bool isMapNodeValue = false, isMapNodeKey = false;

                     if(mapKeyClass && !strcmp(prop.name, "key"))
                     {
                        isTemplateArg = true;
                        isMapNodeKey = true;
                        type = mapKeyClass;
                     }
                     else if(mapDataClass && !strcmp(prop.name, "value"))
                     {
                        isTemplateArg = true;
                        isMapNodeValue = true;
                        type = mapDataClass;
                     }
                     else
                        type = superFindClass(prop.dataTypeString, _class.module);

                     if(!type)
                        PrintLn("warning: Unresolved data type ", (String)prop.dataTypeString);
                     else
                     {
                        if(type.type == enumClass || type.type == bitClass || type.type == unitClass || type.type == systemClass)
                        {
                           // TOFIX: How to swiftly handle classes with base data type?
                           if(type == class(double) || !strcmp(type.dataTypeString, "double"))
                           {
                              value.d = ((double (*)(void *))(void *)prop.Get)(object);
                           }
                           else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
                           {
                              value.f = ((float (*)(void *))(void *)prop.Get)(object);
                           }
                           else if(type.typeSize == sizeof(int64) || !strcmp(type.dataTypeString, "int64") ||
                              !strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64"))
                           {
                              value.ui64 = ((uint64 (*)(void *))(void *)prop.Get)(object);
                           }
                           else if(type.typeSize == sizeof(int) || !strcmp(type.dataTypeString, "int") ||
                              !strcmp(type.dataTypeString, "unsigned int") || !strcmp(type.dataTypeString, "uint"))
                           {
                              value.i = ((int (*)(void *))(void *)prop.Get)(object);
                           }
                           else if(type.typeSize == sizeof(short int) || !strcmp(type.dataTypeString, "short") ||
                              !strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") ||
                              !strcmp(type.dataTypeString, "int16"))
                           {
                              value.s = ((short (*)(void *))(void *)prop.Get)(object);
                           }
                           else if(type.typeSize == sizeof(byte) || !strcmp(type.dataTypeString, "char") ||
                              !strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte"))
                           {
                              value.c = ((char (*)(void *))(void *)prop.Get)(object);
                           }
                        }
                        else if(type.type == structClass)
                        {
                           value.p = new0 byte[type.structSize];
                           if(forMap && (isMapNodeKey || isMapNodeValue))
                           {
                              void * p = isMapNodeValue ? (void *)forMap.GetData(object) : (void *)((Map)forMap).GetKey(object);
                              memcpy(value.p, p, type.structSize);
                           }
                           else
                              ((void (*)(void *, void *))(void *)prop.Get)(object, value.p);
                        }
                        else
                        {
                           if(isTemplateArg)
                              value.p = (void *)(uintptr)((uint64 (*)(void *))(void *)prop.Get)(object);
                           else
                              value.p = ((void *(*)(void *))(void *)prop.Get)(object);
                        }

                        if(!isFirst) f.Puts(spacing ? ",\n" : ", ");
                        if(spacing) for(c = 0; c<indent; c++) f.Puts("   ");

                        if(!jsonDicMap)
                        {
                           if(!eCON)
                           {
                              f.Puts("\"");
                              f.Putc((char)toupper(prop.name[0]));
                              f.Puts(prop.name+1);
                              f.Puts("\" : ");
                           }
                           else if(!omitDefaultIdentifier || cantOmit)
                           {
                              if(!cantOmit && isFirst && (!strcmp(prop.name, "points") || !strcmp(prop.name, "outer")));
                              else
                              {
                                 f.Puts(prop.name);
                                 f.Puts(" = ");
                              }
                           }
                        }
                        else if(isMapNodeValue)
                           f.Puts(" : ");
                        WriteValue(f, type, value, indent, eCON, jsonDicMap && isMapNodeKey);
                        if(!jsonDicMap)
                           isFirst = false;
                        if(type.type == structClass)
                           delete value.p;
                     }
                     cantOmit = false;
                  }
                  else if(!prop.conversion)
                     cantOmit = true;
               }
               else
               {
                  DataMember member = (DataMember)prop;
                  DataValue value { };
                  uint offset;
                  Class type;
                  // TODO: Proper struct / union support
                  while(member.type == unionMember && member.members.first)
                     member = member.members.first;

                  type = superFindClass(member.dataTypeString, _class.module);

                  // offset = member._class.offset + member.offset;
                  eClass_FindDataMemberAndOffset(member._class, member.name, &offset, member._class.module, null, null);
                  if(member._class.type == normalClass || member._class.type == noHeadClass)
                     offset += member._class.base.structSize;

                  if(type)
                  {
                     Property p;
                     for(p = baseClass.membersAndProperties.first; member.name && p; p = p.next)
                        if(p.isProperty && !p.conversion && p.IsSet && !strcmp(p.name, member.name))
                           break;
                     if(p && !p.IsSet(object)) { cantOmit = true; continue; }

                     if(type.type == normalClass || type.type == noHeadClass || type.type == structClass || !strcmp(type.name, "String"))
                     {
                        if(type.type == structClass)
                           value.p = (void *)((byte *)object + offset);
                        else
                           value.p = *(void **)((byte *)object + offset);
                        if(!value.p)
                        {
                           cantOmit = true;
                           continue;
                        }
                     }
                     else if(type == class(double) || !strcmp(type.dataTypeString, "double"))
                     {
                        value.d = *(double *)((byte *)object + offset);
                     }
                     else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
                     {
                        value.f = *(float *)((byte *)object + offset);
                     }
                     else if(type.typeSize == sizeof(int64) || !strcmp(type.dataTypeString, "int64") ||
                        !strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64"))
                     {
                        value.ui64 = *(uint64 *)((byte *)object + offset);
                     }
                     else if(type.typeSize == sizeof(int) || !strcmp(type.dataTypeString, "int") ||
                        !strcmp(type.dataTypeString, "unsigned int") || !strcmp(type.dataTypeString, "uint"))
                     {
                        value.i = *(int *)((byte *)object + offset);
                        if(!strcmp(type.name, "bool") || type.type == enumClass)
                           if(!value.i)
                           {
                              cantOmit = true;
                              continue;
                           }
                     }
                     else if(type.typeSize == sizeof(short int) || !strcmp(type.dataTypeString, "short") ||
                        !strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") ||
                        !strcmp(type.dataTypeString, "int16"))
                     {
                        value.s = *(short *)((byte *)object + offset);
                     }
                     else if(type.typeSize == sizeof(byte) || !strcmp(type.dataTypeString, "char") ||
                        !strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte"))
                     {
                        value.c = *(char *)((byte *)object + offset);
                     }
                     else
                     {
                        value.i = *(int *)((byte *)object + offset);
                     }

                     if(!isFirst) f.Puts(spacing ? ",\n" : ", ");
                     if(spacing) for(c = 0; c<indent; c++) f.Puts("   ");

                     if(!eCON)
                     {
                        f.Puts("\"");
                        f.Putc((char)toupper(member.name[0]));
                        f.Puts(member.name+1);
                        f.Puts("\" : ");
                     }
                     else if(!omitDefaultIdentifier || cantOmit)
                     {
                        f.Puts(member.name);
                        f.Puts(" = ");
                     }
                     WriteValue(f, type, value, indent, eCON, false);
                     isFirst = false;
                  }
               }
            }
         }

         delete bases;

         if(spacing)
         {
            indent--;
            f.Puts("\n");
            for(c = 0; c<indent; c++) f.Puts("   ");
         }
         else if(!omitDefaultIdentifier && !jsonDicMap)
            f.Puts(" ");
         if(!jsonDicMap)
            f.Puts("}");
      }
   }
   else
      f.Puts("null");
   return true;
}

static Class superFindClass(const String name, Module alternativeModule)
{
   Class _class = eSystem_FindClass(__thisModule, name);
   if(!_class && alternativeModule)
      _class = eSystem_FindClass(alternativeModule, name);
   if(!_class)
      _class = eSystem_FindClass(__thisModule.application, name);
   return _class;
}

static bool isSubclass(Class type, const String name)
{
   Class _class = superFindClass(name, type.module);
   if(eClass_IsDerived(_class, type))
      return true;
   return false;
}
