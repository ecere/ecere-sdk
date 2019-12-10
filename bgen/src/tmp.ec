#include "debug.eh"

import "ecere"
import "ec"

import "debug"

import "miscTypes"

import "str"

define ecereNameSpace = "__ecereNameSpace__";

AVLTree<const String> cppKeywords { [
   "template",
   ""
] };

AVLTree<const String> actualTypeNames { [
   "byte",
   "char",
   "double",
   "float",
   "int",
   "int64",
   "short",
   "uint",
   "uint16",
   "uint32",
   "uint64",
   "any_object",
   "constString",
   ""
] };

AVLTree<const String> sysTypeTree { [
   "byte",
   "int64",
   "uintsize",
   "uintptr",
   "char",
   "unichar",
   "int",
   "unsigned int",
   "short",
   //"long",
   "double",
   "float",
   "uint8_t",
   "int64_t",
   "intptr_t",
   "ssize_t",
   "uint32_t",
   "uint16_t",
   "uint64_t",
   "uintptr_t",
   "size_t",
   "any_object",
   "",
   "0"
] };

bool checkNativeSpec(const char * spec)
{
   bool native;
   char * str = CopyString(spec);
   int len = strlen(spec);
   if(len)
   {
      char * n = str + len;
      for(; n != str && (*n == 0 || *n == ' ' || *n == '*' || *n == '[' || *n == ']'); n--);
      if(n == str || *(++n)) *n = 0;
   }
   native = sysTypeTree.Find(str) != null;
   delete str;
   return native;
}

Map<String, const String> sysTypeMap { [
   { "String", "char *" },
   { "byte", "uint8_t" },
   { "int64", "int64_t" },
   { "intptr", "intptr_t" },
   { "intsize", "ssize_t" },
   { "uint", "uint32_t" },
   { "uint16", "uint16_t" },
   { "uint32", "uint32_t" },
   { "uint64", "uint64_t" },
   { "uintptr", "uintptr_t" },
   { "uintsize", "size_t" },
   { "unichar", "uint32_t" }
] };

const char * systemTypeSubst(const char * name, const char * dataTypeString)
{
   const char * subst = sysTypeMap[name];
   if(!((!strcmp(name, dataTypeString) && (!strcmp(name, "char") ||
         !strcmp(name, "int") ||
         !strcmp(name, "unsigned int") ||
         !strcmp(name, "int64") ||
         !strcmp(name, "uint64") ||
         !strcmp(name, "short") ||
         !strcmp(name, "float") ||
         !strcmp(name, "double")
               )) ||
         (!strcmp(name, "String") && !strcmp(dataTypeString, "char *")) ||
         (!strcmp(name, "byte") && !strcmp(dataTypeString, "unsigned char")) ||
         (!strcmp(name, "uint") && !strcmp(dataTypeString, "unsigned int")) ||
         (!strcmp(name, "unichar") && !strcmp(dataTypeString, "uint")) ||
         (!strcmp(name, "FileSize") && !strcmp(dataTypeString, "uint")) ||
         (!strcmp(name, "FileSize64") && !strcmp(dataTypeString, "uint64")) ||
         (!strcmp(name, "Id") && !strcmp(dataTypeString, "uint64")) ||
         (!strcmp(name, "OSMNode") && !strcmp(dataTypeString, "uint64")) ||
         (!strcmp(name, "StringTableKey") && !strcmp(dataTypeString, "uint64")) ||
         (!strcmp(name, "StringTableRole") && !strcmp(dataTypeString, "uint64")) ||
         (!strcmp(name, "StringTableValue") && !strcmp(dataTypeString, "uint64")) ||
         (!strcmp(name, "TimeStamp32") && !strcmp(dataTypeString, "uint")) ||
         (!strcmp(name, "TimeStamp") && !strcmp(dataTypeString, "int64")) ||
         (!strcmp(name, "SecSince1970") && !strcmp(dataTypeString, "int64")) ||
         (!strcmp(name, "uint16") && !strcmp(dataTypeString, "unsigned short")) ||
         (!strcmp(name, "uint32") && !strcmp(dataTypeString, "unsigned int")) ||
         (!strcmp(name, "intptr") && !strcmp(dataTypeString, "intptr_t")) ||
         (!strcmp(name, "uintptr") && !strcmp(dataTypeString, "uintptr_t")) ||
         (!strcmp(name, "intsize") && !strcmp(dataTypeString, "ssize_t")) || // wth if ssize_t ?
         (!strcmp(name, "uintsize") && !strcmp(dataTypeString, "size_t")) ||
         (!strcmp(name, "enum") && !strcmp(dataTypeString, "int")) ||
         (!strcmp(name, "MinMaxValue") && !strcmp(dataTypeString, "int")) ||
         (!strcmp(name, "class") && !strcmp(dataTypeString, "struct __ecereNameSpace__ecere__com__Instance")) ||
         (!strcmp(name, "struct") && !strcmp(dataTypeString, "struct __ecereNameSpace__ecere__com__Instance")) ||
         (!strcmp(dataTypeString, "double") && (
               !strcmp(name, "Angle") ||
               !strcmp(name, "Radians") ||
               !strcmp(name, "Centimeters") ||
               !strcmp(name, "Meters") ||
               !strcmp(name, "Degrees") ||
               !strcmp(name, "Distance") ||
               !strcmp(name, "Feet") ||
               !strcmp(name, "Time") ||
               !strcmp(name, "Seconds") ||
               !strcmp(name, "NauticalMiles") ||
               false)) ||
         (!strcmp(name, "Percentage") && !strcmp(dataTypeString, "float")) ||
            false))
      Print("new stuff <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
   return subst ? subst : dataTypeString;
}

//Map<String, String> listEnumDataTypes { };

Map<String, const String> easyFuncNames
{
   [
      { "__ecereNameSpace__ecere__com____ecere_COM_Initialize", "eC_initApp" }
   ]
};

AVLTree<const String> skipPyFunctionTree { [
   "PrintStdArgsToBuffer",
   null
] };

AVLTree<const String> skipFunctionTree { [
   "acos",
   "acosh",
   "asin",
   "asinh",
   "atan",
   "atan2",
   "atanh",
   "atof",
   "atoi",
   "ceil",
   "cos",
   "cosh",
   "exp",
   "fabs",
   "floor",
   "fmod",
   "fputs",
   "getenv",
   "isalnum",
   "isalpha",
   "isblank",
   "isdigit",
   "islower",
   "isprint",
   "isspace",
   "isupper",
   "isxdigit",
   "log",
   "log10",
   "memcmp",
   "memcpy",
   "memmove",
   "memset",
   "pow",
   "printf",
   "puts",
   "qsort",
   "rename",
   "sin",
   "sinh",
   "strcatf",
   "sprintf",
   "snprintf",
   "sqrt",
   "strcasecmp",
   "strcat",
   "strchr",
   "strcmp",
   "strcpy",
   "strcspn",
   "strlen",
   "strlwr",
   "strncasecmp",
   "strncat",
   "strncmp",
   "strncpy",
   "strpbrk",
   "strspn",
   "strstr",
   "strtod",
   "strtol",
   "strtoll",
   "strtoul",
   "strtoull",
   "strupr",
   "system",
   "tan",
   "tanh",
   "tolower",
   "toupper",
   "vsnprintf",
   "vsprintf",

   "_strtoi64",
   "_strtoui64"
] };

bool skipFunction(const char * name, const char * moduleName, NameSpace * ns)
{
   if(/*!moduleName && */skipFunctionTree.Find(name))
      return true;
   if(islower(name[0]) && strstr(name, "eClass") != name && strstr(name, "eSystem") != name && strstr(name, "eEnum") != name &&
          strstr(name, "eInstance") != name && strstr(name, "eMember") != name && strstr(name, "eModule") != name &&
          strstr(name, "eProperty") != name)
      PrintLn("SHOULD WE SKIP FUNCTION: ", name, moduleName ? " from " : "", moduleName ? moduleName : "",
            (ns && ns->name) ? " / " : "", (ns && ns->name) ? ns->name : "");
   return false;
}

char * getFunctionPointerDeclFromDataTypeString(const char * str)
{
   uint len = strlen(str);
   char * output = new char[len+16];
   char * o = output;
   const char * i = str;
   char * part = strstr(i, "dllexport ");
   uint t;
   for(t = 0; t <= len; t++)
      output[t] = 0;
   if(part == i)
      i += 10;
   part = strstr(i, "(");
   if(part)
   {
      int n;
      for(n = part - i - 1; n >= 0 && (isalpha(i[n]) || i[n] == '_' || isdigit(i[n]))/*!isspace(i[n])*/; n--)
         ;
      n++;
      strncpy(o, i, n);
      i += n;
      o += n;
      strcpy(o, "(*");
      o += 2;
      n = part - i;
      strncpy(o, i, n);
      i = part;
      o += n;
      strcpy(o, ")");
      o += 1;
      strcpy(o, part);
      o += strlen(part);
   }
   else
      conmsgs("check");
   *o = 0;
   return output;
}

char * getMangledFunctionName(const char * functionName)
{
   int c, len;
   char * name = new char[MAX_FILENAME];
   name[0] = 0;
   strcat(name, ecereNameSpace);
   strcat(name, functionName);
   len = strlen(name);
   for(c = strlen(ecereNameSpace); c < len; c++)
   {
      if(name[c] == ':') name[c] = '_';
   }
   return name;
}

char * getEcName(const char * name)
{
   char * ecname = new char[strlen(name) + 4];
   strcpy(ecname, "eC_");
   strcpy(ecname + strlen("eC_"), name);
   return ecname;
}

char * getIndirectionTypeString(const char * typeString, int indirection)
{
   int c, count = Min(indirection, 30);
   char b[32], * s = b;
   char * string;
   b[0] = 0;
   for(c = 1; c < count; c++)
      *s++ = '*';
   *s = 0;
   string = PrintString(typeString, count ? " " : "", b);
   return string;
}

char * getSimpleDataTypeName(Type dataType, const char * dataTypeString, int indirection, bool unknownTypePermissive, bool ecereCOM, bool * prefix)
{
   char * name = null;
   switch(dataType.kind)
   {
      case voidType:
         if(!strcmp(dataTypeString, "void") ||
               !strcmp(dataTypeString, "const void"))
            name = getIndirectionTypeString(dataTypeString, indirection);
         else
            conmsgs("check");
         break;
      case intType:
         if(!strcmp(dataTypeString, "int") || !strcmp(dataTypeString, "const int") ||
               !strcmp(dataTypeString, "uint") || !strcmp(dataTypeString, "int (* *)()"))
            name = getIndirectionTypeString(dataTypeString, indirection);
         else
            conmsgs("check");
         break;
      case intPtrType:
         if(!strcmp(dataTypeString, "uintptr"))
            name = getIndirectionTypeString(dataTypeString, indirection);
         else
            conmsgs("check");
         break;
      case int64Type:
         if(!strcmp(dataTypeString, "int64") || !strcmp(dataTypeString, "uint64"))
            name = getIndirectionTypeString(dataTypeString, indirection);
         else
            conmsgs("check");
         break;
      case shortType:
         if(!strcmp(dataTypeString, "short") || !strcmp(dataTypeString, "uint16"))
            name = getIndirectionTypeString(dataTypeString, indirection);
         else
            conmsgs("check");
         break;
      case charType:
         if(!strcmp(dataTypeString, "const char") || !strcmp(dataTypeString, "const char *") ||
               !strcmp(dataTypeString, "char"))
            name = getIndirectionTypeString(dataTypeString, indirection);
         else if(strstr(dataTypeString, "char[") == dataTypeString && dataTypeString[strlen(dataTypeString) - 1] == ']')
            name = getIndirectionTypeString("char", indirection);
         else if(!strcmp(dataTypeString, "") ||
               !strcmp(dataTypeString, "byte"))
            name = getIndirectionTypeString(dataTypeString, indirection);
         else
            conmsgs("check");
         break;
      case floatType:
         if(!strcmp(dataTypeString, "float"))
            name = getIndirectionTypeString(dataTypeString, indirection);
         else
            conmsgs("check");
         break;
      case doubleType:
         if(!strcmp(dataTypeString, "double"))
            name = getIndirectionTypeString(dataTypeString, indirection);
         else
            conmsgs("check");
         break;
      //case pointerType:
      case subClassType:
         name = getIndirectionTypeString(dataType._class.registered.name, indirection);
         break;
      case thisClassType:
         //PrintLn("something to do about thisclass types?");
         if(!strcmp(dataTypeString, "thisclass"))
            name = getIndirectionTypeString("thisclass", indirection);
         else
            conmsgs("check");
         break;
      case intSizeType:
         if(!strcmp(dataTypeString, "uintsize") ||
            !strcmp(dataTypeString, ""))
            name = getIndirectionTypeString(dataTypeString, indirection);
         else
            conmsgs("check");
         break;
      case ellipsisType:
      case vaListType:
         if(!strcmp(dataTypeString, "...") ||
            !strcmp(dataTypeString, "__builtin_va_list")) // tocheck: __builtin_va_list won't work, should be just va_list
            name = getIndirectionTypeString(dataTypeString, indirection);
         else
            conmsgs("check");
         break;
      //case int64Type:
      case structType:
         name = getIndirectionTypeString(dataTypeString, indirection);
         break;
      case longType: //case floatType: case doubleType:
      case _BoolType:
      case enumType:
      //case classType:
      case dummyType: //case subClassType: case thisClassType:
      case unionType:
      case methodType: //case typedObjectType: case anyObjectType: case classPointerType: case int128Type:
         conmsgs("check");
         break;
      case arrayType:
      {
         char type[8192];
         type[0] = 0;
         PrintType(dataType.arrayType, type, false, false);
         name = getSimpleDataTypeName(dataType.arrayType, type, indirection, false, ecereCOM, null);
         break;
      }
      case classType:
         if(dataType._class && dataType._class.registered && dataType._class.registered.name)
         {
            char * tmp = getClassTypeName(dataType._class.registered);//oldGetClassTypeName(dataTypeString);
            name = getIndirectionTypeString(tmp, indirection);
            delete tmp;
         }
         else if(dataType._class && dataType._class.string && (
               !strcmp(dataType._class.string, "T") ||
               !strcmp(dataType._class.string, "BT") ||
               !strcmp(dataType._class.string, "LT") ||
               !strcmp(dataType._class.string, "V")))
            name = getIndirectionTypeString("uint64", indirection);//"uintptr64";
         else if(dataType._class && dataType._class.string && (
               !strcmp(dataType._class.string, "Type") ||
               !strcmp(dataType._class.string, "Instantiation") ||
               !strcmp(dataType._class.string, "ClassDefinition")))
            name = getIndirectionTypeString(dataTypeString, indirection);
         // TODO when encountered in ecereCOM
         else if(ecereCOM && (
               !strcmp(dataType._class.string, "EditBox") ||
               !strcmp(dataType._class.string, "Surface") ||
               !strcmp(dataType._class.string, "DataBox")))
         {
            name = getIndirectionTypeString(unknownTypePermissive ? "Instance" : "uint64", indirection);
            if(prefix) *prefix = true;
         }
         else if(!strcmp(dataType._class.string, "Size"))
         {
            name = getIndirectionTypeString(unknownTypePermissive ? dataTypeString : "uint64", indirection);
            if(prefix) *prefix = true;
         }
         else
            name = getIndirectionTypeString(dataTypeString, indirection);
         break;
      case templateType:
         if(dataType._class && dataType._class.registered && dataType._class.registered.name)
            conmsgs("check");
         else if(!strcmp(dataTypeString, "T") ||
               !strcmp(dataTypeString, "D") ||
               !strcmp(dataTypeString, "I") ||
               !strcmp(dataTypeString, "IT") ||
               !strcmp(dataTypeString, "NT") ||
               !strcmp(dataTypeString, "BT") ||
               !strcmp(dataTypeString, "LT") ||
               !strcmp(dataTypeString, "V") ||
               !strcmp(dataTypeString, "VT"))
            name = getIndirectionTypeString(dataTypeString, indirection);//"uintptr64";
         else if(!strcmp(dataTypeString, "const T") ||
               !strcmp(dataTypeString, "const D") ||
               !strcmp(dataTypeString, "const I") ||
               !strcmp(dataTypeString, "const IT") ||
               !strcmp(dataTypeString, "const KT"))
            name = getIndirectionTypeString(dataTypeString, indirection);//"uintptr64";
         else
            conmsgs("check");
         break;
      case pointerType:
      {
         char type[8192];
         type[0] = 0;
         PrintType(dataType.type, type, false, false);
         name = getSimpleDataTypeName(dataType.type, type, indirection + 1, false, ecereCOM, null);
         break;
      }
      case functionType:
      {
         char type[8192];
         type[0] = 0;
         PrintType(dataType.returnType, type, false, false);
         name = getSimpleDataTypeName(dataType.returnType, type, indirection, false, ecereCOM, null);
         break;
      }
      default:
         PrintLn("error: unknown TypeKind ", dataType.kind, " for property datatype kind.");
   }
   return name;
}

char * getClassTypeName(Class c)
{
   Class cl = c.templateClass ? c.templateClass : c;
   char * name = null;
   char * a = oldGetClassTypeName(cl.name);
   char buf[1024];
   char * b = getNoNamespaceString(cl.name, buf, false);
   conassert(cl != null, "?");
   if(cl.templateClass)
   {
            bool skipAllTemplated = false;
            ClassTemplateArgument * tArgs = cl.templateArgs;
            int tCount = cl.templateParams.count;
            int baseParam = cl.numParams - tCount;
            int n;
            //name = getNoNamespaceString(t.cl.string, null, false);
            if(tArgs)
            {
               for(n = baseParam; n < tCount; n++)
               {
                  Type argType;
                  ClassTemplateArgument * tArg = &tArgs[n];
                  if(!tArg->dataTypeString) conmsgs("check");
                  argType = ProcessTypeString(tArg->dataTypeString, false);
                  if(argType.kind == templateType)
                     skipAllTemplated = true;
                  else
                  {
                     skipAllTemplated = false;
                     break;
                  }
                  FreeType(argType);
               }
            }
            if(skipAllTemplated) conmsgs("check");
               //name = PrintString("C(", cl.templateClass.name, ")");
            else if(tArgs)
            {
               ZString z { allocType = heap };
               z.concatx("T(", cl.templateClass.name);
               for(n = baseParam; n < tCount; n++)
               {
                  ClassTemplateArgument * tArg = &tArgs[n];
                  if(!tArg->dataTypeString) conmsgs("check");
                  if(!strcmp(tArg->dataTypeString, "thisclass"))
                     z.concatx(", thisclass(", cl.name, cl.type == noHeadClass ? " *" : "", ")");
                  else
                     z.concatx(", ", tArg->dataTypeString);
               }
               z.concat(")");
               name = CopyString(z._string);
               delete z;
            }
            else conmsgs("check");
   }
   else
      name = CopyString(cl.name);
   if(strcmp(a, cl.name))
   {
      PrintLn("yo ", b);
   }
   delete a;
   return name;
}

char * getTemplateClassSymbol(const char * className, bool preexpanded)
{
   int count = 0;
   const char * s;
   for(s = className; *s; s++)
      if(*s == '<') count++;
   if(count)
   {
      char * result = getNoNamespaceString(className, null, false);
      int len = strlen(result);
      char * s;
      char * output = new char[len + count * (preexpanded ? 9 : 3) + 1];
      char * part = result;
      char * close = result + len;
      *output = 0;
      for(s = result; *s; s++)
      {
         /*if(s == close)
         {
            strcat(output, part);
            break;
         }*/
         if(*s == '<')
         {
            strcat(output, preexpanded ? "template_" : "T(");
            *s = 0;
            strcat(output, part);
            strcat(output, preexpanded ? "_" : ", ");
            part = s + 1;
            for(close--; *close; close--)
            {
               if(*close == '>')
               {
                  *close = preexpanded ? ' ' : ')'; // this might not work in preexpanded. add pass to remove spaces maybe?
                  break;
               }
            }
            strcat(output, part);
            break;
         }
         /*else if(*s == '=')
         {
         }*/
      }
      delete result;
      result = output;
      return result;
   }
   return null;
}

char * oldGetClassTypeName(const char * className)
{
   const char * of = "_";
   const char * with = "_";
   const char * as = "_as_";
   const char * close = "__";
   char * name;//, * s1, * s2;
   bool template, pluriparams;
   template = pluriparams = false;
   name = getNoNamespaceString(className, null, false);
   if(!strcmp(name, "const String"))
      name = CopyString("constString");
   else
   {
      char * s, * d, * temp = name;
      name = d = new char[strlen(temp) * 2 + 1];
      for(s = temp; *s; s++)
      {
         if(*s == '<')
         {
            template = true;
            strncpy(d, of, strlen(of));
            d += strlen(of);
         }
         else if(template)
         {
            if(*s == ',')
            {
               if(*(s + 1) == ' ')
                  s++;
               pluriparams = true;
               strncpy(d, with, strlen(with));
               d += strlen(with);
            }
            else if(*s == ' ')
            {
               if(*(s + 1) != '=')
                  *d++ = '_';
            }
            else if(*s == '=')
            {
               if(*(s + 1) == ' ')
                  s++;
               strncpy(d, as, strlen(as));
               d += strlen(as);
            }
            else if(*s == '>')
            {
               strncpy(d, close, strlen(close));
               d += strlen(close);
            }
            else if(!(isalpha(*s) || isdigit(*s) || *s == '_'))
               conmsgs("check");
            else
               *d++ = *s;
         }
         else
            *d++ = *s;
      }
      *d = 0;
      if((d = strstr(name, ":")))
         *d = 0;
      delete temp;
   }
   return name;
}

char * getSymbolNameStringFromTypeString(const char * typeString, const char * special)
{
   const char * ptr = "_ptr";
   const char * of = "_";
   const char * with = "_";
   const char * as = "_as_";
   const char * close = "__";
   char * name = null;
   bool template, pluriparams;
   template = pluriparams = false;
   if(special)
      template = true;
   else
      name = getNoNamespaceString(typeString, null, false);
   if(name && !strcmp(name, "const String"))
      name = CopyString("constString");
   else
   {
      const char * s, * temp = special ? special : name;
      char * d, * oldName = name;
      name = d = new char[strlen(special ? typeString : temp) * 2 + 1];
      if(special)
      {
         for(s = typeString; *s && s != special; s++)
            *d++ = *s;
      }
      for(s = temp; *s; s++)
      {
         if(*s == ' ') continue;
         if(*s == '*')
         {
            strncpy(d, ptr, strlen(ptr));
            d += strlen(ptr);
         }
         else if(*s == '<')
         {
            template = true;
            strncpy(d, of, strlen(of));
            d += strlen(of);
         }
         else if(template)
         {
            if(*s == ',')
            {
               if(*(s + 1) == ' ')
                  s++;
               pluriparams = true;
               strncpy(d, with, strlen(with));
               d += strlen(with);
            }
            else if(*s == ' ')
            {
               if(*(s + 1) != '=')
                  *d++ = '_';
            }
            else if(*s == '=')
            {
               if(*(s + 1) == ' ')
                  s++;
               strncpy(d, as, strlen(as));
               d += strlen(as);
            }
            else if(*s == '>')
            {
               strncpy(d, close, strlen(close));
               d += strlen(close);
            }
            else if(!(isalpha(*s) || isdigit(*s) || *s == '_' || (special && (*s == '(' || *s == ')'))))
               conmsgs("check");
            else
               *d++ = *s;
         }
         else
            *d++ = *s;
      }
      *d = 0;
      if((d = strstr(name, ":")))
         *d = 0;
      delete oldName;
   }
   return name;
}

enum SpecialType { normal, baseClass, typedObject, anyObject };
SpecialType specialType(Type t)
{
   Symbol s = t._class;
   bool isBaseClass = !s || !s.string || !strcmp(s.string, "class");
   if(t.classObjectType == typedObject && isBaseClass)
      return typedObject;
   else if(t.classObjectType == anyObject && isBaseClass)
      return anyObject;
   else if(isBaseClass)
      return baseClass;
   return normal;
}

void fileDataCopy(File input, File output)
{
   byte buffer[65536];
   input.Seek(0, start);
   for(;!input.Eof();)
   {
      uint count = input.Read(buffer, 1, sizeof(buffer));
      if(count)
         output.Write(buffer, 1, count);
   }
}

char * CopyAllNonCapsString(const char * string)
{
   int len = strlen(string);
   char * output = new char[len+1];
   const char * s = string;
   char * o = output;
   char ch;
   for(; (ch = *s); s++)
      *o++ = (ch < 128) ? (char)tolower(ch) : ch; // TODO: UNICODE TO UPPER -- REFER EditBox.ec
   *o = 0;
   return output;
}
