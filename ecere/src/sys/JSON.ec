namespace sys;

import "System"
import "Array"

default:
static void UnusedFunction()
{
   int a;
   a.OnGetDataFromString(null);
   a.OnGetString(null, 0, 0);
   a.OnFree();
}
extern int __ecereVMethodID_class_OnGetDataFromString;
extern int __ecereVMethodID_class_OnGetString;
extern int __ecereVMethodID_class_OnFree;
private:

public enum JSONResult { syntaxError, success, typeMismatch, noItem };

public enum SetBool : uint
{
   unset, false, true /*; // Syntax error! */

   /*public property bool     // NOT WORKING!
   {
      set { return value ? true : false; }
      get { return (this == true); }
   }*/
};


public class JSONParser
{
public:
   File f;
   char ch;

   void SkipEmpty()
   {
      while(!f.Eof() && (!ch || ch == ' ' || ch == '\n' || ch == '\r' || ch == '\t'))
      {
         f.Getc(&ch);
      }
   }

   JSONResult GetValue(Class type, DataValue value)
   {
      JSONResult result = syntaxError;
      ch = 0;
      SkipEmpty();
      if(ch == '\"')
      {
         String string;
         result = GetString(&string);
         if(result)
         {
            Property prop;
            if(type && (!strcmp(type.name, "String") || !strcmp(type.dataTypeString, "char *")))
            {
               value.p = string;
            }
            else if(type && type.type == enumClass)
            {
               if(((bool (*)(void *, void *, const char *))(void *)type._vTbl[__ecereVMethodID_class_OnGetDataFromString])(type, &value.i, string))
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
            else if(type && (type.type == structClass))
            {
               if(((bool (*)(void *, void *, const char *))(void *)type._vTbl[__ecereVMethodID_class_OnGetDataFromString])(type, value.p, string))
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
         Container array;
         result = GetArray(type, &array);
         
         if(type && eClass_IsDerived(type, class(Container)))
         {
            value.p = array;
         }
         else
         {
            if(array)
               array.Free();
            delete array;
            result = typeMismatch;
         }
      }
      else if(ch == '-' || isdigit(ch))
      {
         result = GetNumber(type, value);
      }
      else if(ch == '{')
      {
         void * object;
         result = GetObject(type, &object);
         if(result)
         {
            if(type && (type.type == normalClass || type.type == structClass || type.type == noHeadClass || type.type == bitClass))
            {
               value.p = object;
            }
            else
            {
               result = typeMismatch;
               ((void (*)(void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnFree])(type, object);
            }
         }
      }
      else if(isalpha(ch))
      {
         char buffer[256];
         int c = 0;
         while(c < sizeof(buffer)-1 && isalpha(ch))
         {
            buffer[c++] = ch;
            if(!f.Getc(&ch)) break;
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
               value.p = 0;
            }
            else
               result = typeMismatch;
         }
         else
            result = typeMismatch;
      }
      else if(ch == '}' || ch == ']')
         result = noItem;
      return result;
   }

   JSONResult GetArray(Class type, Container * array)
   {
      JSONResult result = syntaxError;
      SkipEmpty();
      *array = null;
      if(ch == '[')
      {
         int count = 0;
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

            itemResult = GetValue(arrayType, value);
            if(itemResult == success)
            {
               // TODO: Verify the matching between template type and uint64
               uint64 t;
               if(arrayType.type == structClass)
               {
                  t = (uint64) value.p;
               }
               else if(arrayType == class(double) || !strcmp(arrayType.dataTypeString, "double"))
               {
                  t = *(uint64 *)&value.d;
               }
               else if(arrayType == class(float) || !strcmp(arrayType.dataTypeString, "float"))
               {
                  t = *(uint *)&value.f;
               }
               else if(arrayType.typeSize == sizeof(int64) || !strcmp(arrayType.dataTypeString, "int64")
                  !strcmp(arrayType.dataTypeString, "unsigned int64") || !strcmp(arrayType.dataTypeString, "uint64"))
               {
                  t = value.ui64;
               }
               else if(arrayType.typeSize == sizeof(int) || !strcmp(arrayType.dataTypeString, "int") || 
                  !strcmp(arrayType.dataTypeString, "unsigned int") || !strcmp(arrayType.dataTypeString, "uint"))
               {
                  t = value.i;
               }
               else if(arrayType.typeSize == sizeof(short int) || !strcmp(arrayType.dataTypeString, "short") || 
                  !strcmp(arrayType.dataTypeString, "unsigned short") || !strcmp(arrayType.dataTypeString, "uint16") || 
                  !strcmp(arrayType.dataTypeString, "int16"))
               {
                  t = value.s;
               }
               else if(arrayType.typeSize == sizeof(byte) || !strcmp(arrayType.dataTypeString, "char") || 
                  !strcmp(arrayType.dataTypeString, "unsigned char") || !strcmp(arrayType.dataTypeString, "byte"))
               {
                  t = value.c;
               }
               else
               {
                  t = (uint64)value.p;
               }
               ((void *(*)(void *, uint64))(void *)array->Add)(*array, t);
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

   JSONResult GetString(String * string)
   {
      JSONResult result = syntaxError;
      Array<char> buffer { minAllocSize = 256 };
      bool escaped = false;

      *string = null;
      SkipEmpty();
      if(ch == '\"')
      {
         while(f.Getc(&ch))
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
                     f.Getc(&unicode[0]);
                     f.Getc(&unicode[1]);
                     f.Getc(&unicode[2]);
                     f.Getc(&unicode[3]);                  
                  }
                  escaped = false;
               }
               else if(ch == '\"')
               {
                  break;
               }
               buffer.Add(ch);
               if(buffer.minAllocSize < buffer.count)
                  buffer.minAllocSize *= 2;
            }
         }
         buffer.Add(0);
         *string = CopyString(buffer.array);
         result = success;
      }
      delete buffer;
      ch = 0;
      return result;
   }

   public JSONResult GetObject(Class objectType, void ** object)
   {
      JSONResult result = syntaxError;
      *object = null;
      SkipEmpty();
      if(ch == '{')
      {
         result = success;
         if(objectType && (objectType.type == noHeadClass || objectType.type == normalClass))
         {
            *object = eInstance_New(objectType);
         }
         else if(objectType)
         {
            *object = eSystem_New(objectType.typeSize);
         }

         while(result)
         {
            String string;
            ch = 0;
            if(GetString(&string))
            {
               bool found = true;
               DataMember member = null;
               Property prop = null;
               Class type = null;

               if(objectType)
               {
                  string[0] = (char)tolower(string[0]);
                  member = eClass_FindDataMember(objectType, string, objectType.module, null, null);
                  if(member)
                  {
                     type = eSystem_FindClass(__thisModule, member.dataTypeString);
                     if(!type)
                        type = eSystem_FindClass(__thisModule.application, member.dataTypeString);
                  }
                  else if(!member)
                  {
                     prop = eClass_FindProperty(objectType, string, objectType.module);
                     if(prop)
                     {
                        type = eSystem_FindClass(__thisModule, prop.dataTypeString);
                        if(!type)
                           type = eSystem_FindClass(__thisModule.application, prop.dataTypeString);
                     }
                     else
                        PrintLn("Warning: member ", string, " not found in class ", (String)objectType.name);
                  }                    
               }
               // Find Member in Object Class
               {
                  DataValue value { };

                  if(type && type.type == structClass)
                  {
                     value.p = (byte *)*object + member._class.offset + member.offset;
                  }
                  ch = 0;
                  SkipEmpty();
                  if(ch == ':')
                  {
                     JSONResult itemResult = GetValue(type, value);
                     if(itemResult != syntaxError)
                     {
                        if(prop || member)
                        {
                           if(!type)
                           {
                              PrintLn("warning: Unresolved data type ", member ? (String)member.dataTypeString : (String)prop.dataTypeString);
                           }
                           else if(itemResult == success)
                           {
                              // Set value
                              if(member)
                              {
                                 // TOFIX: How to swiftly handle classes with base data type?
                                 if(type == class(double) || !strcmp(type.dataTypeString, "double"))
                                 {
                                    *(double *)((byte *)*object + member._class.offset + member.offset) = value.d;
                                 }
                                 else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
                                 {
                                    *(float *)((byte *)*object + member._class.offset + member.offset) = value.f;
                                 }
                                 else if(type.typeSize == sizeof(int64) || !strcmp(type.dataTypeString, "int64")
                                    !strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64"))
                                 {
                                    *(uint64 *)((byte *)*object + member._class.offset + member.offset) = value.ui64;
                                 }
                                 else if(type.typeSize == sizeof(int) || !strcmp(type.dataTypeString, "int") || 
                                    !strcmp(type.dataTypeString, "unsigned int") || !strcmp(type.dataTypeString, "uint"))
                                 {
                                    int * ptr = (int *)((byte *)*object + member._class.offset + member.offset);
                                    // TODO: Fix Me Up 64 bit pointer here
                                    if(eClass_IsDerived(type, class(Container)) && *ptr)
                                    {
                                       Container container = (Container)*ptr;
                                       container.Free();
                                       delete container;
                                    }
                                    *ptr = value.i;
                                 }
                                 else if(type.typeSize == sizeof(short int) || !strcmp(type.dataTypeString, "short") || 
                                    !strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") || 
                                    !strcmp(type.dataTypeString, "int16"))
                                 {
                                    *(short *)((byte *)*object + member._class.offset + member.offset) = value.s;
                                 }
                                 else if(type.typeSize == sizeof(byte) || !strcmp(type.dataTypeString, "char") || 
                                    !strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte"))
                                 {
                                    *(char *)((byte *)*object + member._class.offset + member.offset) = value.c;
                                 }
                                 else if(type.type != structClass)
                                 {
                                    *(void **)((byte *)*object + member._class.offset + member.offset) = value.p;
                                 }
                              }
                              else if(prop && prop.Set)
                              {
                                 if(!strcmp(type.dataTypeString, "char *"))
                                 {
                                    ((void (*)(void *, void *))(void *)prop.Set)(*object, value.p);
                                    delete value.p;
                                 }
                                 // TOFIX: How to swiftly handle classes with base data type?
                                 else if(type == class(double) || !strcmp(type.dataTypeString, "double"))
                                 {
                                    ((void (*)(void *, double))(void *)prop.Set)(*object, value.d);
                                 }
                                 else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
                                 {
                                    ((void (*)(void *, float))(void *)prop.Set)(*object, value.f);
                                 }
                                 else if(type.typeSize == sizeof(int64) || !strcmp(type.dataTypeString, "int64")
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
               }
            }
            else if(ch)
               result = syntaxError;
            delete string;

            if(result)
            {
               SkipEmpty();
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

   JSONResult GetNumber(Class type, DataValue value)
   {
      JSONResult result = syntaxError;
      char buffer[256];
      int c = 0;
      while(c < sizeof(buffer)-1 && (ch == '-' || ch == '.' || tolower(ch) == 'e' || ch == '+' || isdigit(ch)))
      {
         buffer[c++] = ch;
         if(!f.Getc(&ch)) break;
      }
      buffer[c] = 0;
      //if(strchr(buffer, '.'))

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
         value.i64 = strtol(buffer, null, 10);  // TOFIX: 64 bit support
         result = success;
      }
      else if(type == class(uint64) || !strcmp(type.dataTypeString, "uint64"))
      {
         value.ui64 = strtol(buffer, null, 10);  // TOFIX: 64 bit support
         result = success;
      }
      else
      {
         value.i = strtol(buffer, null, 10);
         result = success;
      }
      return result;
   }
}

bool WriteArray(File f, Class type, Container array, int indent)
{
   if(array)
   {
      int c;
      int i;
      bool isFirst = true;
      Iterator it { array };
      Class arrayType = type.templateArgs[0].dataTypeClass;
      f.Puts("[\n");
      indent++;
      
      while(it.Next())
      {
         byte * pointer;
         DataValue value { };
         uint64 t = ((uint64(*)(void *, void *))(void *)array.GetData)(array, it.pointer);
         if(!isFirst)
            f.Puts(",\n");
         else
            isFirst = false;         
         
         // Add value
         // TODO: Verify the matching between template type and uint64
         if(arrayType.type == structClass)
         {
            value.p = (void *)t;
         }
         else if(arrayType == class(double) || !strcmp(arrayType.dataTypeString, "double"))
         {
            value.d = *(double *)&t;
         }
         else if(arrayType == class(float) || !strcmp(arrayType.dataTypeString, "float"))
         {
            value.f = *(float *)&t;
         }
         else if(arrayType.typeSize == sizeof(int64) || !strcmp(arrayType.dataTypeString, "int64")
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
            value.p = (void *)t;
         }
         for(i = 0; i<indent; i++) f.Puts("   ");
         WriteValue(f, arrayType, value, indent);
      }      
      f.Puts("\n");
      indent--;
      for(i = 0; i<indent; i++) f.Puts("   ");
      f.Puts("]");      
   }
   else
      f.Puts("null");
   return true;
}

bool WriteNumber(File f, Class type, DataValue value, int indent)
{
   char buffer[1024];
   bool needClass = false;
   buffer[0] = 0;
   if(type == class(double) || !strcmp(type.dataTypeString, "double"))
      ((char *(*)(void *, void *, char *, void *, bool *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.d, buffer, 0, &needClass);
   else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
      ((char *(*)(void *, void *, char *, void *, bool *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.f, buffer, null, &needClass);
   else if(!strcmp(type.dataTypeString, "int64"))
      ((char *(*)(void *, void *, char *, void *, bool *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.i64, buffer, null, &needClass);
   else if(!strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64") || type.typeSize == sizeof(int64))
      ((char *(*)(void *, void *, char *, void *, bool *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.ui64, buffer, null, &needClass);
   else if(!strcmp(type.dataTypeString, "int"))
      ((char *(*)(void *, void *, char *, void *, bool *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.i, buffer, null, &needClass);
   else if(!strcmp(type.dataTypeString, "unsigned int") || !strcmp(type.dataTypeString, "uint") || type.typeSize == sizeof(int))
      ((char *(*)(void *, void *, char *, void *, bool *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.ui, buffer, null, &needClass);
   else if(!strcmp(type.dataTypeString, "short") || !strcmp(type.dataTypeString, "int16"))
      ((char *(*)(void *, void *, char *, void *, bool *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.s, buffer, null, &needClass);
   else if(!strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") || type.typeSize == sizeof(short int))
      ((char *(*)(void *, void *, char *, void *, bool *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.us, buffer, null, &needClass);
   else if(!strcmp(type.dataTypeString, "char"))
      ((char *(*)(void *, void *, char *, void *, bool *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.c, buffer, null, &needClass);
   else if(!strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte") || type.typeSize == sizeof(byte))
      ((char *(*)(void *, void *, char *, void *, bool *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &value.uc, buffer, null, &needClass);
   f.Puts(buffer);
   return true;
}

bool WriteValue(File f, Class type, DataValue value, int indent)
{
   if(!strcmp(type.name, "String") || !strcmp(type.dataTypeString, "char *"))
   {
      f.Puts("\"");
      //if(strchr(value.p, '\"') || strchr(value.p, '\\'))
      {
         int c = 0;
         int b = 0;
         char buffer[1024];
         char * string = value.p;
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
      /*else
         f.Puts(value.p);*/
      f.Puts("\"");
   }
   else if(!strcmp(type.name, "bool"))
   {
      if(value.i)
         f.Puts("true");
      else
         f.Puts("false");
   }
   else if(!strcmp(type.name, "SetBool"))
   {
      if(value.i == SetBool::true)
         f.Puts("true");
      else if(value.i == SetBool::false)
         f.Puts("false");
      else
         f.Puts("unset");
   }
   else if(type.type == enumClass)
   {
      f.Puts("\"");
      WriteNumber(f, type, value, indent);      
      f.Puts("\"");
   }
   else if(eClass_IsDerived(type, class(Container)))
   {
      WriteArray(f, type, value.p, indent);
   }
   else if(type.type == normalClass || type.type == noHeadClass || type.type == structClass || type.type == bitClass)
   {
      _WriteJSONObject(f, type, value.p, indent);
   }
   else if(type.type == systemClass)
   {
      WriteNumber(f, type, value, indent);
   }
   return true;
}

public bool WriteJSONObject(File f, Class objectType, void * object, int indent)
{
   bool result = false;
   if(object)
   {
      result = _WriteJSONObject(f, objectType, object, indent);
      f.Puts("\n");
   }
   return result;
}

static bool _WriteJSONObject(File f, Class objectType, void * object, int indent)
{
   if(object)
   {
      char * string = null;

      if(objectType._vTbl[__ecereVMethodID_class_OnGetString] != objectType.base._vTbl[__ecereVMethodID_class_OnGetString])
      {
         char buffer[1024];
         buffer[0] = 0;
         string = ((char *(*)())(void *)objectType._vTbl[__ecereVMethodID_class_OnGetString])(objectType, object, buffer, null, null);
      }
      if(string)
      {
         // TOCHECK: ProjectNode.ec why do we add quotes in OnGetString there?
         if(string[0] == '\"')
            f.Puts(string);
         else
         {
            f.Puts("\"");
            f.Puts(string);
            f.Puts("\"");
         }
      }
      else
      {
         Property prop;
         int c;
         bool isFirst = true;
         
         f.Puts("{\n");
         indent++;

         for(prop = objectType.membersAndProperties.first; prop; prop = prop.next)
         {
            if(prop.memberAccess != publicAccess || (prop.isProperty && (!prop.Set || !prop.Get))) continue;
            if(prop.isProperty)
            {
               if(!prop.conversion && (!prop.IsSet || prop.IsSet(object)))
               {
                  DataValue value { };
                  Class type = eSystem_FindClass(__thisModule, prop.dataTypeString);
                  if(!type)
                     type = eSystem_FindClass(__thisModule.application, prop.dataTypeString);

                  // TOFIX: How to swiftly handle classes with base data type?
                  if(type == class(double) || !strcmp(type.dataTypeString, "double"))
                  {
                     value.d = ((double (*)(void *))(void *)prop.Get)(object);
                  }
                  else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
                  {
                     value.f = ((float (*)(void *))(void *)prop.Get)(object);
                  }
                  else if(type.typeSize == sizeof(int64) || !strcmp(type.dataTypeString, "int64")
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
                  else
                  {
                     value.p = ((void *(*)(void *))(void *)prop.Get)(object);
                  }

                  if(!isFirst) f.Puts(",\n");
                  for(c = 0; c<indent; c++) f.Puts("   ");

                  f.Puts("\"");
                  f.Putc((char)toupper(prop.name[0]));
                  f.Puts(prop.name+1);
                  f.Puts("\" : ");
                  WriteValue(f, type, value, indent);
                  isFirst = false;
               }
            }
            else
            {
               DataMember member = (DataMember)prop;
               DataValue value { };
               Class type = eSystem_FindClass(__thisModule, member.dataTypeString);
               if(!type)
                  type = eSystem_FindClass(__thisModule.application, member.dataTypeString);

               if(type)
               {
                  if(type.type == normalClass || type.type == noHeadClass || type.type == structClass || !strcmp(type.name, "String"))
                  {
                     if(type.type == structClass)
                        value.p = (void *)((byte *)object + member._class.offset + member.offset);
                     else
                        value.p = *(void **)((byte *)object + member._class.offset + member.offset);
                     if(!value.p)
                        continue;
                  }
                  else if(type == class(double) || !strcmp(type.dataTypeString, "double"))
                  {
                     value.d = *(double *)((byte *)object + member._class.offset + member.offset);
                  }
                  else if(type == class(float) || !strcmp(type.dataTypeString, "float"))
                  {
                     value.f = *(float *)((byte *)object + member._class.offset + member.offset);
                  }
                  else if(type.typeSize == sizeof(int64) || !strcmp(type.dataTypeString, "int64")
                     !strcmp(type.dataTypeString, "unsigned int64") || !strcmp(type.dataTypeString, "uint64"))
                  {
                     value.ui64 = *(uint64 *)((byte *)object + member._class.offset + member.offset);
                  }
                  else if(type.typeSize == sizeof(int) || !strcmp(type.dataTypeString, "int") || 
                     !strcmp(type.dataTypeString, "unsigned int") || !strcmp(type.dataTypeString, "uint"))
                  {
                     value.i = *(int *)((byte *)object + member._class.offset + member.offset);
                     if(!strcmp(type.name, "bool") || type.type == enumClass)
                        if(!value.i)
                           continue;
                  }
                  else if(type.typeSize == sizeof(short int) || !strcmp(type.dataTypeString, "short") || 
                     !strcmp(type.dataTypeString, "unsigned short") || !strcmp(type.dataTypeString, "uint16") || 
                     !strcmp(type.dataTypeString, "int16"))
                  {
                     value.s = *(short *)((byte *)object + member._class.offset + member.offset);
                  }
                  else if(type.typeSize == sizeof(byte) || !strcmp(type.dataTypeString, "char") || 
                     !strcmp(type.dataTypeString, "unsigned char") || !strcmp(type.dataTypeString, "byte"))
                  {
                     value.c = *(char *)((byte *)object + member._class.offset + member.offset);
                  }
                  else
                  {
                     value.i = *(int *)((byte *)object + member._class.offset + member.offset);  
                  }

                  if(!isFirst) f.Puts(",\n");
                  for(c = 0; c<indent; c++) f.Puts("   ");

                  f.Puts("\"");
                  f.Putc((char)toupper(member.name[0]));
                  f.Puts(member.name+1);
                  f.Puts("\" : ");
                  WriteValue(f, type, value, indent);
                  isFirst = false;
               }
            }
         }   

         indent--;
         f.Puts("\n");
         for(c = 0; c<indent; c++) f.Puts("   "); f.Puts("}");
      }
   }
   else
      f.Puts("null");
   return true;
}
