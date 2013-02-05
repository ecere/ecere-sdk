namespace com;

#if defined(ECERE_BOOTSTRAP)
#define dllexport
#endif

import "instance"

default extern Platform runtimePlatform;

// Limit Definitions
public define MAXBYTE = 0xff;
public define MAXWORD = 0xffff;
public define MININT = ((int)0x80000000);
public define MAXINT = ((int)0x7fffffff);
public define MININT64 = ((int64)0x8000000000000000LL);
public define MAXINT64 = ((int64)0x7fffffffffffffffLL);
public define MAXDWORD = 0xffffffff;
public define MAXQWORD = 0xffffffffffffffffLL;
public define MINFLOAT = ((float)1.17549435082228750e-38);
public define MAXFLOAT = ((float)3.40282346638528860e+38);
public define MINDOUBLE = ((double) 2.2250738585072014e-308);
public define MAXDOUBLE = ((double) 1.7976931348623158e+308);

public define FORMAT64HEXLL  = (GetRuntimePlatform() == win32) ? "0x%I64XLL" : "0x%llXLL";
public define FORMAT64HEX    = (GetRuntimePlatform() == win32) ? "0x%I64X" : "0x%llX";
public define FORMAT64DLL    = (GetRuntimePlatform() == win32) ? "%I64dLL" : "%lldLL";
public define FORMAT64D      = (GetRuntimePlatform() == win32) ? "%I64d" : "%lld";
public define FORMAT64U      = (GetRuntimePlatform() == win32) ? "%I64u" : "%llu";

#define PUTXWORD(b, w) \
   (b)[0] = (byte)(((w) >> 8) & 0xFF); \
   (b)[1] = (byte)(((w)     ) & 0xFF);

#define GETXWORD(b) (uint16)(((b)[0] << 8) | (b)[1])

#define PUTXDWORD(b, d) \
   (b)[0] = (byte)(((d) >> 24) & 0xFF); \
   (b)[1] = (byte)(((d) >> 16) & 0xFF); \
   (b)[2] = (byte)(((d) >> 8)  & 0xFF); \
   (b)[3] = (byte)( (d)        & 0xFF);

#define GETXDWORD(b) (uint32)(((b)[0] << 24) | ((b)[1] << 16) | ((b)[2] << 8) | (b)[3])

#define PUTXQWORD(b, d) \
   (b)[0] = (byte)(((d) >> 56) & 0xFF); \
   (b)[1] = (byte)(((d) >> 48) & 0xFF); \
   (b)[2] = (byte)(((d) >> 40) & 0xFF); \
   (b)[3] = (byte)(((d) >> 32) & 0xFF); \
   (b)[4] = (byte)(((d) >> 24) & 0xFF); \
   (b)[5] = (byte)(((d) >> 16) & 0xFF); \
   (b)[6] = (byte)(((d) >> 8)  & 0xFF); \
   (b)[7] = (byte)( (d)        & 0xFF);

#define GETXQWORD(b) (uint64)(((uint64)(b)[0] << 56) | ((uint64)(b)[1] << 48) | ((uint64)(b)[2] << 40) | ((uint64)(b)[3] << 32) | ((uint64)(b)[4] << 24) | ((b)[5] << 16) | ((b)[6] << 8) | (b)[7])

static void UnusedFunction()
{
   int a;
   a.OnGetString(0,0,0);
   a.OnFree();
   a.OnCopy(null);
   a.OnCompare(null);
   a.OnSaveEdit(null,0);
   a.OnEdit(null,null,0,0,0,0,0);
   a.OnDisplay(null,0,0,0,0,null,null);
   a.OnGetDataFromString(null);
}

default:
extern int __ecereVMethodID_class_OnGetString;
extern int __ecereVMethodID_class_OnGetDataFromString;
extern int __ecereVMethodID_class_OnCompare;
extern int __ecereVMethodID_class_OnSerialize;
extern int __ecereVMethodID_class_OnUnserialize;
extern int __ecereVMethodID_class_OnCopy;
public:

#if defined(ECERE_BOOTSTRAP) || defined(ECERE_STATIC)
#define dllexport
#endif

// TOFIX: Declaration ordering (Required on gcc 3.4.5)
dllexport void eSystem_Delete(void * memory);

public class IOChannel
{
public:
   virtual uint WriteData(byte * data, uint numBytes);
   virtual uint ReadData(byte * data, uint numBytes);

   dllexport void Serialize(typed_object data)
   {
      data.OnSerialize(this);
   }

   dllexport void Unserialize(typed_object & data)
   {
      data.OnUnserialize(this);
   }

   dllexport void Put(typed_object data)
   {
      data.OnSerialize(this);
   }

   dllexport void Get(typed_object & data)
   {
      data.OnUnserialize(this);
   }
};

public class SerialBuffer : IOChannel
{
public:
   byte * _buffer;
   uint count;
   uint _size;
   uint pos;

   uint WriteData(byte * bytes, uint numBytes)
   {
      if(this != null)
      {
         if(count + numBytes > _size)
         {
            _size = count + numBytes;
            _size += _size/2;
            _buffer = renew _buffer byte[_size];
         }
         memcpy(_buffer + count, bytes, numBytes);
         count += numBytes;
         return numBytes;
      }
      return 0;
   }

   uint ReadData(byte * bytes, uint numBytes)
   {
      if(this != null)
      {
         int read = Min(numBytes, count - pos);
         memcpy(bytes, _buffer + pos, read);
         pos += read;
         return read;
      }
      return 0;
   }

   ~SerialBuffer()
   {
      Free();
   }

   dllexport void Free()
   {
      if(this)
      {
         delete _buffer;
         count = 0;
         _size = 0;
         pos = 0;
      }
   }

   // TODO: THIS IS VERY BAD!
   property byte * buffer
   {
      get { return _buffer + pos; }
      set { _buffer = value; }
   }

   property uint size
   {
      get { return count - pos; }
      set { count = value; }
   }
};

/*static */char * Enum_OnGetString(Class _class, int * data, char * tempString, void * fieldData, bool * needClass)
{
   EnumClassData enumeration = (EnumClassData)_class.data;
   NamedLink item;
   for(item = enumeration.values.first; item; item = item.next)
      if((int)item.data == *data)
         break;
   if(item)
   {
      strcpy(tempString, item.name);
      if(!needClass || !*needClass)
         tempString[0] = (char)toupper(tempString[0]);
      return tempString;
      //return item.name;
   }
   else
      return null;
}

static bool Enum_OnGetDataFromString(Class _class, int * data, char * string)
{
   EnumClassData enumeration = (EnumClassData)_class.data;
   NamedLink item;
   for(item = enumeration.values.first; item; item = item.next)
   {
      if(item.name && !strcmpi(item.name, string))
         break;
   }
   if(item)
   {
      *data = (int)item.data;
      return true;
   }
   else
      return Integer_OnGetDataFromString(_class, data, string);
   return false;
}

static void OnFree(Class _class, void * data)
{
   if(_class.templateClass) _class = _class.templateClass;
   if(_class.type == normalClass)
   {
      // eInstance_Delete(data);
      eInstance_DecRef(data);
   }
   else if(_class.type == noHeadClass && data)
   {
      while(_class && _class.type == noHeadClass)
      {
         if(_class.Destructor)
            _class.Destructor(data);
         _class = _class.base;
      }
      delete data;
   }
}

static int DataMember_OnCompare(DataMember parentMember, void * data1, void * data2)
{
   DataMember member;
   Module module = parentMember._class.module;
   for(member = parentMember.members.first; member; member = member.next)
   {
      int memberResult = 0;
      if(member.type == normalMember)
      {
         Class memberType = member.dataTypeClass;

         if(!memberType)
            memberType = member.dataTypeClass = eSystem_FindClass(module, member.dataTypeString);
         if(!memberType)
            memberType = member.dataTypeClass = eSystem_FindClass(module, "int");

         if(memberType.type == structClass || memberType.type == normalClass || memberType.type == noHeadClass)
         {
            memberResult = memberType._vTbl[__ecereVMethodID_class_OnCompare](memberType, 
               (byte *)data1 + member.offset, 
               (byte *)data2 + member.offset);
            if(memberResult)
               return memberResult;
         }
         else
         {
            DataValue value1, value2;
            value1.i = *(int *)((byte *)data1 + member.offset);
            value2.i = *(int *)((byte *)data2 + member.offset);
            memberResult = memberType._vTbl[__ecereVMethodID_class_OnCompare](memberType, &value1, &value2);
            if(memberResult)
               return memberResult;
         }
      }
      else
      {
         memberResult = DataMember_OnCompare(member, 
            (byte *)data1 + member.offset, 
            (byte *)data2 + member.offset);
         if(memberResult)
            return memberResult;
      }
   }
   return 0;
}

static int OnCompare(Class _class, void * data1, void * data2)
{
   Module module = _class.module;
   if(_class.type == normalClass || _class.type == noHeadClass || _class.type == structClass)
   {
      if(data1 && data2)
      {
         // NOTE: Comparing from top class down here... might want to reverse it
         for(; _class && _class.type != systemClass; _class = _class.base)
         {
            DataMember member;

            // TESTING THIS HERE...
            if(_class.noExpansion)
            {
               if(data1 > data2) return 1;
               else if(data1 < data2) return -1;
               else
                  return 0;
            }

            for(member = _class.membersAndProperties.first; member; member = member.next)
            {
               int memberResult = 0;
               if(member.isProperty || member.type == normalMember)
               {
                  Class memberType = member.dataTypeClass;
                        
                  if(!memberType)
                     memberType = member.dataTypeClass = eSystem_FindClass(module, member.dataTypeString);
                  /*
                  if(!memberType)
                     memberType = member.dataTypeClass = eSystem_FindClass(module, "int");
                  */
                  if(memberType)
                  {
                     if(member.isProperty)
                     {
                        Property prop = (Property)member;
                        if(!prop.conversion && prop.Get && prop.Set)
                        {
                           if(memberType.type == structClass || memberType.type == normalClass || memberType.type == noHeadClass)
                           {
                              if(!strcmp(memberType.dataTypeString, "char *"))
                              {
                                 String a = ((String(*)())(void *)prop.Get)(data1);
                                 String b = ((String(*)())(void *)prop.Get)(data2);
                                 memberResult = memberType._vTbl[__ecereVMethodID_class_OnCompare](memberType, a, b);
                              }
                           }
                           else
                           {
                              DataValue value1, value2;
                              if(!strcmp(memberType.dataTypeString, "float"))
                              {
                                 value1.f = ((float(*)())(void *)prop.Get)(data1);
                                 value2.f = ((float(*)())(void *)prop.Get)(data2);
                              }
                              else
                              {
                                 value1.i = prop.Get(data1);
                                 value2.i = prop.Get(data2);
                              }
                              memberResult = memberType._vTbl[__ecereVMethodID_class_OnCompare](memberType, &value1, &value2);
                           }
                        }
                     }
                     else
                     {
                        if(memberType.type == structClass || memberType.type == normalClass || memberType.type == noHeadClass)
                        {
                           if(memberType.type == normalClass || memberType.type == noHeadClass)
                           {
                              // TESTING THIS!
                              memberResult = memberType._vTbl[__ecereVMethodID_class_OnCompare](memberType, 
                                 *(void **)((byte *)data1 + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset)), 
                                 *(void **)((byte *)data2 + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset)));
                           }
                           else
                           {
                              memberResult = memberType._vTbl[__ecereVMethodID_class_OnCompare](memberType, 
                                 (byte *)data1 + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset), 
                                 (byte *)data2 + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset));
                           }
                        }
                        else
                        {
                           DataValue value1, value2;
                           if(memberType.typeSize == 8)
                           {
                              value1.ui64 = *(uint64 *)((byte *)data1 + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset));
                              value2.ui64 = *(uint64 *)((byte *)data2 + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset));
                           }
                           else
                           {
                              value1.i = *(int *)((byte *)data1 + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset));
                              value2.i = *(int *)((byte *)data2 + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset));
                           }
                           memberResult = memberType._vTbl[__ecereVMethodID_class_OnCompare](memberType, &value1, &value2);
                        }
                     }
                  }
                  else
                  {
                     // printf("Unknown type\n");
                  }
               }
               else
               {
                  memberResult = DataMember_OnCompare(member, 
                     (byte *)data1 + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset), 
                     (byte *)data2 + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset));
               }
               if(memberResult)
                  return memberResult;
            }
         }
      }
      else if(!data1 && data2)
         return 1;
      else if(data1 && !data2)
         return -1;
   }
   else if(_class.type == unitClass)
   {
      Class dataType = eSystem_FindClass(module, _class.dataTypeString);
      return dataType._vTbl[__ecereVMethodID_class_OnCompare](dataType, data1, data2);
   }
   else
   {
      int result = 0;
      if(data1 && data2)
      {
         if(*(void **)data1 > *(void **)data2)
            result = 1;
         else if(*(void **)data1 < *(void **)data2)
            result = -1;
      }
      else if(!data1 && data2)
         return 1;
      else if(data1 && !data2)
         return -1;
      return result;
   }
   return 0;
}

static char * OnGetString(Class _class, void * data, char * tempString, void * fieldData, bool * needClass)
{
   // WHY DOES _class.module NOT SEEM TO WORK?
   Module module = _class.templateClass ? _class.templateClass.module : _class.module;
   if(_class.type == enumClass)
   {
      return Enum_OnGetString(_class, data, tempString, fieldData, needClass);
   }
   else if(_class.type == unitClass)
   {
      Class dataType = eSystem_FindClass(module, _class.dataTypeString);
      return ((char *(*)(void *, void *, char *, void *, bool *))(void *)dataType._vTbl[__ecereVMethodID_class_OnGetString])(dataType, data, tempString, fieldData, needClass);
   }
   else
   {
      bool atMember = true;
      bool prev = false;
      Class mainClass = _class;
      _class = null;
      tempString[0] = '\0';
      if(!data && (mainClass.type == normalClass || mainClass.type == noHeadClass)) return tempString;

      while(_class != mainClass)
      {
         DataMember member;
         Class lastClass = _class;

         for(_class = mainClass; _class.base != lastClass && _class.base.type != systemClass; _class = _class.base);

         for(member = _class.membersAndProperties.first; member; member = member.next)
         {
            char memberString[1024];
            Class memberType = member.dataTypeClass;
            char * name = member.name;
                  
            memberString[0] = 0;

            if(!memberType)
               memberType = member.dataTypeClass = eSystem_FindClass(module, member.dataTypeString);
            if(!memberType)
               memberType = member.dataTypeClass = eSystem_FindClass(module, "int");

            if(member.isProperty)
            {
               Property prop = (Property) member;

               if(!prop.conversion && prop.Get && prop.Set && (!prop.IsSet || prop.IsSet(data)))
               {
                  if(memberType.type != structClass && (memberType.type != normalClass || !strcmp(memberType.dataTypeString, "char *")) && memberType.type != bitClass && data)
                  {
                     DataValue value = { 0 };
                     if(!strcmp(prop.dataTypeString, "float"))
                     {
                        value.f = ((float(*)())(void *)prop.Get)(data);
                        if(value.f)
                        {
                           bool needClass = true;
                           char * result = ((char *(*)(void *, void *, char *, void *, bool *))(void *)memberType._vTbl[__ecereVMethodID_class_OnGetString])(memberType, &value, memberString, null, &needClass);
                           if(result && result != memberString)
                              strcpy(memberString, result);
                           // TESTING THIS HERE
                           if(strchr(memberString, '.'))
                              strcat(memberString, "f");
                        }
                     }
                     else
                     {
                        value.i = prop.Get(data);
                        if(value.i || prop.IsSet)
                        {
                           bool needClass = true;
                           char * result = ((char *(*)(void *, void *, char *, void *, bool *))(void *)memberType._vTbl[__ecereVMethodID_class_OnGetString])(memberType, 
                              (memberType.type == normalClass) ? value.p : &value, memberString, null, &needClass);
                           if(result && result != memberString)
                              strcpy(memberString, result);
                        }
                     }
                  }
               }
            }
            else
            {
               if(member.type == normalMember)
               {
                  if(memberType.type == structClass || memberType.type == normalClass)
                  {
                     char internalMemberString[1024];
                     byte * memberData = ((byte *)data + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset));
                     int c;
                     for(c = 0; c < memberType.structSize; c++)
                        if(memberData[c])
                           break;
                     if(c < memberType.structSize)
                     {
                        bool needClass = true;
                        char * result;
                        if(memberType.type == normalClass)
                           result = ((char *(*)(void *, void *, char *, void *, bool *))(void *)memberType._vTbl[__ecereVMethodID_class_OnGetString])(memberType, *(Instance *)memberData, internalMemberString, null, &needClass);
                        else
                           result = ((char *(*)(void *, void *, char *, void *, bool *))(void *)memberType._vTbl[__ecereVMethodID_class_OnGetString])(memberType, memberData, internalMemberString, null, &needClass);
                        if(needClass)
                        {
                           //strcpy(memberString, memberType.name);
                           strcat(memberString, "{ ");
                           if(result) strcat(memberString, result);
                           strcat(memberString, " }");
                        }
                        else if(result)
                           strcpy(memberString, result);
                     }
                  }
                  //else if(_class /*memberType*/.type != bitClass)
                  else // if(_class /*memberType*/.type != bitClass)
                  {
                     DataValue value = { 0 };
                     if(_class.type == bitClass)
                     {
                        BitMember bitMember = (BitMember) member;
                        // TODO: Check if base type is 32 or 64 bit

                        //value.ui = (((uint)data & bitMember.mask) >> bitMember.pos);
                        value.ui64 = ((*(uint*)data & bitMember.mask) >> bitMember.pos);
                        if(value.ui64)
                        {
                           bool needClass = true;
                           char internalMemberString[1024];
                           char * result = ((char *(*)(void *, void *, char *, void *, bool *))(void *)memberType._vTbl[__ecereVMethodID_class_OnGetString])(memberType, &value, internalMemberString, null, &needClass);

                           if(needClass && memberType.type != systemClass && memberType.type != enumClass && memberType.type != unitClass)
                           {
                              //strcpy(memberString, memberType.name);
                              strcat(memberString, " { ");
                              if(result) strcat(memberString, result);
                              strcat(memberString, " }");
                           }
                           else if(result)
                              strcpy(memberString, result);
                           /*
                           if(result && memberString != result)
                              strcpy(memberString, result);
                           */
                        }
                     }
                     else if(!memberType.noExpansion)
                     {
                        // TOCHECK: Is this still right??
                        if(memberType.typeSize <= 4)
                        {
                           value.i = *(int *)((byte *)data + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset));
                           if(value.i)
                           {
                              bool needClass = true;
                              char * result = ((char *(*)(void *, void *, char *, void *, bool *))(void *)memberType._vTbl[__ecereVMethodID_class_OnGetString])(memberType, &value, memberString, null, &needClass);
                              if(result && memberString != result)
                                 strcpy(memberString, result);
                           }
                        }
                        else
                        {
                           bool needClass = true;
                           char * result = ((char *(*)(void *, void *, char *, void *, bool *))(void *)memberType._vTbl[__ecereVMethodID_class_OnGetString])(memberType, ((byte *)data + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset)), memberString, null, &needClass);
                           if(result && memberString != result)
                              strcpy(memberString, result);
                        }
                     }
                  }
                  /*else
                  {
                     char internalMemberString[1024];
                     byte * memberData = ((byte *)data + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset));
                     bool needClass = true;
                     char * result;
                     result = ((char *(*)(void *, void *, char *, void *, bool *))(void *)memberType._vTbl[__ecereVMethodID_class_OnGetString])(memberType, memberData, internalMemberString, null, &needClass);
                     if(needClass)
                     {
                        //strcpy(memberString, memberType.name);
                        strcat(memberString, "{ ");
                        if(result) strcat(memberString, result);
                        strcat(memberString, " }");
                     }
                     else if(result)
                        strcpy(memberString, result);
                  }*/
               }
               // MemberUnion
               // MemberStruct
            }
            // TODO: Fix atID stuff
            if(memberString[0])
            {
               if(prev)
                  strcat(tempString, ", ");
               if(!atMember || !strcmp(memberType.name, "bool"))
               {
                  strcat(tempString, name);
                  strcat(tempString, " = ");
               }

               if(!strcmp(memberType.name, "char *"))
               {
                  int len = strlen(tempString);
                  int c;
                  strcat(tempString, "\"");
                  len ++;
                  for(c = 0; memberString[c]; c++)
                  {
                     if(memberString[c] == '\"')
                     {
                        strcat(tempString, "\\\"");
                        len+=2;
                     }
                     else if(memberString[c] == '\\')
                     {
                        strcat(tempString, "\\\\");
                        len+=2;
                     }
                     else
                     {
                        tempString[len++] = memberString[c];
                        tempString[len] = 0;
                     }
                  }                              
                  strcat(tempString, "\"");
               }
               else
                  strcat(tempString, memberString);
               atMember = true;

               prev = true;
            }
            else if(member && (!member.isProperty || !((Property)member).conversion))
               atMember = false;
         }
      }
   }
   return tempString;
}

static bool OnGetDataFromString(Class _class, void ** data, char * string)
{
   bool result;
   Module module = _class.module;
   if(_class.type == enumClass)
      result = Enum_OnGetDataFromString(_class, (int *)data, string);
   else if(_class.type == unitClass)
   {
      Class dataType = eSystem_FindClass(module, _class.dataTypeString);
      return dataType._vTbl[__ecereVMethodID_class_OnGetDataFromString](dataType, data, string);
   }
   else if(!string[0] && _class.type == normalClass)
   {
      // result = false;  // Why was this data = null commented?
      *data = null;
      return true;
   }
   else
   {
      int c;
      char memberName[1024];
      char memberString[10240];
      int count = 0;
      bool quoted = false;
      int brackets = 0;
      char ch;
      bool escape = false;
      bool gotChar;
      uint memberOffset;
      Class curClass = null;
      DataMember curMember = null;
      DataMember subMemberStack[256];
      int subMemberStackPos = 0;

      result = true;

      if(_class.type == noHeadClass || _class.type == normalClass) 
      {
         data = *data = eInstance_New(_class);
         if(_class.type == normalClass) 
            ((Instance)data)._refCount++;
      }
      else if(/*_class.type == noHeadClass || */_class.type == structClass) 
         memset(data, 0, _class.structSize);
      // Bit classes cleared outside?

      memberName[0] = '\0';

      for(c = 0; string[c] && count < sizeof(memberString); )
      {
         bool found = false;
         DataMember thisMember = null;

         brackets = 0;
         gotChar = false;
         for(; (ch = string[c]) && count < sizeof(memberString); c++)
         {
            if(ch == '\"' && !escape)
            {
               quoted ^= true;
            }
            else if(quoted)
            {
               if(!escape && ch == '\\')
               {
                  escape = true;
               }
               else
               {
                  memberString[count++] = ch;
                  escape = false;
               }
            }
            // TOFIX: OnGetDataFromString is far from ready as a generic object notation reader...
            // It has mostly been tested/used for entering data in the IDE's property sheet, as well as for parsing code in the Code Editor
            // Is it used by the compiler?
            else if(ch == ' ') // || ch == '\n' || ch == '\t' || ch == '\r')
            {
               if(gotChar) 
                  memberString[count++] = ch;
            }
            else if(ch == ',')
            {
               if(brackets)
               {
                  memberString[count++] = ch;
               }
               else
               {
                  c++;
                  break;
               }
            }
            else if(ch == '{')
            {
               // If bracket is not initialization
               if(gotChar && !brackets) 
               {
                  count = 0;
                  gotChar = false;
               }

               if(brackets)
               {
                  memberString[count++] = ch;
                  gotChar = true;
               }
               brackets++;
            }
            else if(ch == '}')
            {
               brackets--;
               if(brackets)
               {
                  gotChar = true;
                  memberString[count++] = ch;
               }
            }
            else if(ch == '=')
            {
               if(brackets)
               {
                  memberString[count++] = ch;
               }
               else
               {
                  memberString[count] = '\0';
                  //TrimLSpaces(memberString, memberName);
                  //TrimRSpaces(memberName, memberString);
                  //strcpy(memberName, memberString);
            
                  TrimRSpaces(memberString, memberName);
                  count = 0;
                  gotChar = false;
               }
            }
            else
            {
               memberString[count++] = ch;
               gotChar = true;
            }
         }

         memberString[count] = '\0';
         TrimRSpaces(memberString, memberString);

         if(memberName[0])
         {
            DataMember _subMemberStack[256];
            int _subMemberStackPos = 0;

            thisMember = eClass_FindDataMemberAndOffset(_class, memberName, &memberOffset, _class.module, _subMemberStack, &_subMemberStackPos);

            if(!thisMember)
               thisMember = (DataMember)eClass_FindProperty(_class, memberName, _class.module);
            if(thisMember)
            {
               if(thisMember.memberAccess == publicAccess)
               {
                  curMember = thisMember;
                  curClass = thisMember._class;
                  memcpy(subMemberStack, _subMemberStack, sizeof(int) * _subMemberStackPos);
                  subMemberStackPos = _subMemberStackPos;
               }
               found = true;
            }
         }
         else
         {
            eClass_FindNextMember(_class, &curClass, (DataMember *)&curMember, subMemberStack, &subMemberStackPos);
            thisMember = curMember;
            if(thisMember)
            {
               found = true;
               eClass_FindDataMemberAndOffset(_class, thisMember.name, &memberOffset, _class.module, null, null);
            }
         }
         if(found)
         {
            Class memberType = thisMember.dataTypeClass;
            
            if(!memberType)
               memberType = thisMember.dataTypeClass = eSystem_FindClass(module, thisMember.dataTypeString);
            if(!memberType)
               memberType = thisMember.dataTypeClass = eSystem_FindClass(module, "int");
            if(memberType.type == structClass)
            {
               if(thisMember)
               {
                  if(!memberType._vTbl[__ecereVMethodID_class_OnGetDataFromString](memberType, 
                     (byte *)data + (((thisMember._class.type == normalClass) ? thisMember._class.offset : 0) + memberOffset), memberString))
                     result = false;
               }
            }
            else
            {
               DataValue value = { 0 };
               // Patch for hotKey crash ( #556 )
               // Key has a member KeyCode, which inherits from Key
               // We don't want KeyCode to use its base class OnGetDataFromString
               if(memberType._vTbl[__ecereVMethodID_class_OnGetDataFromString] == _class._vTbl[__ecereVMethodID_class_OnGetDataFromString])
               {
                  if(!OnGetDataFromString(memberType, &value, memberString))
                     result = false;
               }
               else if(!memberType._vTbl[__ecereVMethodID_class_OnGetDataFromString](memberType, &value, memberString))
                  result = false;
               if(thisMember && !thisMember.isProperty)
               {
                  if(_class.type == bitClass)
                  {
                     BitMember bitMember = (BitMember) thisMember;
                     // TODO: Check if bit _class is 32 or 64 bit
                     *(uint *)data = (uint32)(((*(uint *)data & ~bitMember.mask)) | ((value.ui64<<bitMember.pos)&bitMember.mask));
                  }
                  else
                     *(int *)((byte *)data + (((thisMember._class.type == normalClass) ? thisMember._class.offset : 0) + thisMember.offset)) = value.i;
               }
               else if(thisMember.isProperty && ((Property)thisMember).Set)
                  ((Property)thisMember).Set(data, value.i);
            }
         }
         else
            result = false;
            
         count = 0;
         memberName[0] = '\0';
      }
   }
   return result;
}

static void OnCopy(Class _class, void ** data, void * newData)
{
   // TO IMPROVE: Inherit from Unit class for better performance?
   if(_class.type == unitClass || _class.type == bitClass || _class.type == enumClass)
   {
      Class dataType = eSystem_FindClass(_class.module, _class.dataTypeString);
      if(dataType)
         dataType._vTbl[__ecereVMethodID_class_OnCopy](dataType, data, newData);
   }
   else if(_class.type != structClass && _class.type != systemClass)
   {
      *data = newData;
   }
   // Here we have either a structClass or a systemClass
   else if(newData)
      memcpy(data, newData, _class.typeSize);
   else
      memset(data, 0, _class.typeSize);
}

static int DataMember_OnSerialize(DataMember parentMember, void * data, IOChannel channel)
{
   DataMember member;
   Module module = parentMember._class.module;
   for(member = parentMember.members.first; member; member = member.next)
   {
      if(member.type == normalMember)
      {
         Class memberType = member.dataTypeClass;

         if(!memberType)
            memberType = member.dataTypeClass = eSystem_FindClass(module, member.dataTypeString);
         if(!memberType)
            memberType = member.dataTypeClass = eSystem_FindClass(module, "int");

         if(memberType.type == structClass || memberType.type == normalClass || memberType.type == noHeadClass)
         {
            memberType._vTbl[__ecereVMethodID_class_OnSerialize](memberType, (byte *)data + member.offset, channel);
         }
         else
         {
            DataValue value;
            value.i = *(int *)((byte *)data + member.offset);
            memberType._vTbl[__ecereVMethodID_class_OnSerialize](memberType, &value);
         }
      }
      else
      {
         DataMember_OnSerialize(member, (byte *)data + member.offset, channel);
      }
   }
   return 0;
}

static void OnSerialize(Class _class, void * data, IOChannel channel)
{
   Module module = _class.module;
   // TO IMPROVE: Inherit from Unit class for better performance?
   if(_class.type == unitClass || _class.type == bitClass || _class.type == enumClass)
   {
      Class dataType = eSystem_FindClass(module, _class.dataTypeString);
      if(dataType)
         dataType._vTbl[__ecereVMethodID_class_OnSerialize](dataType, data, channel);
   }
   else if(_class.type == normalClass || _class.type == noHeadClass || _class.type == structClass)
   {
      //if(data)
      {
         Class lastClass = null;
         while(lastClass != _class)
         {
            DataMember member;
            for(; _class && (!_class.base || _class.base.type != systemClass) && _class != lastClass; _class = _class.base);
            lastClass = _class;

            for(member = _class.membersAndProperties.first; member; member = member.next)
            {
               if(member.isProperty || member.type == normalMember)
               {
                  Class memberType = member.dataTypeClass;
                        
                  if(!memberType)
                     memberType = member.dataTypeClass = eSystem_FindClass(module, member.dataTypeString);
                  if(memberType)
                  {
                     if(member.isProperty)
                     {
                        /*Property prop = (Property)member;
                        if(!prop.conversion && prop.Get && prop.Set)
                        {
                           if(memberType.type == structClass || memberType.type == normalClass || memberType.type == noHeadClass)
                           {

                           }
                           else
                           {
                              DataValue value;
                              if(!strcmp(memberType.dataTypeString, "float"))
                              {
                                 value.f = ((float(*)())(void *)prop.Get)(data);
                              }
                              else
                              {
                                 value.i = prop.Get(data);
                              }
                              memberType._vTbl[__ecereVMethodID_class_OnSerialize](memberType, &value, channel);
                           }
                        }*/
                     }
                     else
                     {
                        if(!strcmp(memberType.name, "String") || memberType.type == normalClass || memberType.type == noHeadClass)
                        {
                           memberType._vTbl[__ecereVMethodID_class_OnSerialize](memberType, data ? (*(void **)((byte *)data + member._class.offset + member.offset)) : null, channel);
                        }
                        else
                           memberType._vTbl[__ecereVMethodID_class_OnSerialize](memberType, data ? (((byte *)data + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset))) : null, channel);
                     }
                  }
                  else
                  {
                     // printf("Unknown type\n");
                  }
               }
               else
               {
                  DataMember_OnSerialize(member, data ? ((byte *)data + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset)) : null, channel);
               }
            }
         }
      }
   }
}

static int DataMember_OnUnserialize(DataMember parentMember, void * data, IOChannel channel)
{
   DataMember member;
   Module module = parentMember._class.module;
   for(member = parentMember.members.first; member; member = member.next)
   {
      if(member.type == normalMember)
      {
         Class memberType = member.dataTypeClass;

         if(!memberType)
            memberType = member.dataTypeClass = eSystem_FindClass(module, member.dataTypeString);
         if(!memberType)
            memberType = member.dataTypeClass = eSystem_FindClass(module, "int");

         if(memberType.type == structClass || memberType.type == normalClass || memberType.type == noHeadClass)
         {
            memberType._vTbl[__ecereVMethodID_class_OnUnserialize](memberType, (byte *)data + member.offset, channel);
         }
         else
         {
            DataValue value;
            memberType._vTbl[__ecereVMethodID_class_OnUnserialize](memberType, &value, channel);  // channel was missing here?
            *(int *)((byte *)data + member.offset) = value.i;
         }
      }
      else
      {
         DataMember_OnUnserialize(member, (byte *)data + member.offset, channel);
      }
   }
   return 0;
}
 
static void OnUnserialize(Class _class, void ** data, IOChannel channel)
{
   Module module = _class.module;
   if(_class.type == unitClass || _class.type == bitClass || _class.type == enumClass)
   {
      Class dataType = eSystem_FindClass(module, _class.dataTypeString);
      if(dataType)
         dataType._vTbl[__ecereVMethodID_class_OnUnserialize](dataType, data, channel);
   }
   else if(_class.type == normalClass || _class.type == noHeadClass || _class.type == structClass)
   {
      if(data)
      {
         Class lastClass = null;
         if(_class.type == normalClass || _class.type == noHeadClass)
         {
            // TOFIX: Seriously!?!?? Fix me!
            data = *data = eInstance_New(_class);
            if(_class.type == normalClass) 
               ((Instance)data)._refCount++;
         }
         else if(/*_class.type == noHeadClass || */_class.type == structClass) 
            memset(data, 0, _class.structSize);

         while(lastClass != _class)
         {
            DataMember member;
            for(; _class && (!_class.base || _class.base.type != systemClass) && _class != lastClass; _class = _class.base);
            lastClass = _class;

            for(member = _class.membersAndProperties.first; member; member = member.next)
            {
               if(member.isProperty || member.type == normalMember)
               {
                  Class memberType = member.dataTypeClass;
                        
                  if(!memberType)
                     memberType = member.dataTypeClass = eSystem_FindClass(module, member.dataTypeString);
                  if(memberType)
                  {
                     if(member.isProperty)
                     {
                        /*Property prop = (Property)member;
                        if(!prop.conversion && prop.Get && prop.Set)
                        {
                           if(memberType.type == structClass || memberType.type == normalClass || memberType.type == noHeadClass)
                           {

                           }
                           else
                           {
                              DataValue value;
                              memberType._vTbl[__ecereVMethodID_class_OnUnserialize](memberType, &value, channel);
                              prop.Set(data, value.i);
                           }
                        }*/
                     }
                     else
                        memberType._vTbl[__ecereVMethodID_class_OnUnserialize](memberType, 
                           (byte *)data + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset), channel);
                  }
                  else
                  {
                     // printf("Unknown type\n");
                  }
               }
               else
               {
                  DataMember_OnUnserialize(member, (byte *)data + (((member._class.type == normalClass) ? member._class.offset : 0) + member.offset), channel);
               }
            }
         }
      }
   }
}

// Integer
static int Integer_OnCompare(Class _class, int * data1, int * data2)
{
   int result = 0;
   if(!data1 && !data2) result = 0;
   else if(data1 && !data2) result = 1;
   else if(!data1 && data2) result = -1;
   else if(*data1 > *data2) result = 1;
   else if(*data1 < *data2) result = -1;
   return result;
}

/*static */char * Integer_OnGetString(Class _class, int * data, char * string, void * fieldData, bool * needClass)
{
   sprintf(string, "%d", *data);
   return string;
}

static bool Integer_OnGetDataFromString(Class _class, int * data, char * string)
{
   char * end;
   int result = strtol(string, &end, 0);

   if(end > string)
   {
      *data = result;
      return true;
   }
   return false;
}

static int UInteger_OnCompare(Class _class, unsigned int * data1, unsigned int * data2)
{
   int result = 0;
   if(!data1 && !data2) result = 0;
   else if(data1 && !data2) result = 1;
   else if(!data1 && data2) result = -1;
   else if(*data1 > *data2) result = 1;
   else if(*data1 < *data2) result = -1;
   return result;
}

static char * UInteger_OnGetString(Class _class, unsigned int * data, char * string, void * fieldData, bool * needClass)
{
   sprintf(string, "%u", *data);
   return string;
}

static bool UInteger_OnGetDataFromString(Class _class, unsigned int * data, char * string)
{
   char * end;
   uint result = strtoul(string, &end, 0);
   if(end > string)
   {
      *data = result;
      return true;
   }
   return false;
}

static int Byte_OnCompare(Class _class, byte * data1, byte * data2)
{
   int result = 0;
   if(!data1 && !data2) result = 0;
   else if(data1 && !data2) result = 1;
   else if(!data1 && data2) result = -1;
   else if(*data1 > *data2) result = 1;
   else if(*data1 < *data2) result = -1;
   return result;
}

static char * Byte_OnGetString(Class _class, byte * data, char * string, void * fieldData, bool * needClass)
{
   sprintf(string, "%u", (int)*data);
   return string;
}

static char * Char_OnGetString(Class _class, char * data, char * string, void * fieldData, bool * needClass)
{
   if(needClass && *needClass)
   {
      char ch = *data;
      if(ch == '\t')      strcpy(string, "'\t'");
      else if(ch == '\n') strcpy(string, "'\n'");
      else if(ch == '\r') strcpy(string, "'\r'");
      else if(ch == '\a') strcpy(string, "'\a'");
      else if(ch == '\\') strcpy(string, "'\\'");
      else if(ch < 32 || ch >= 127)    sprintf(string, "'\o'", ch);
      else sprintf(string, "'%c'", ch);
   }
   else
      sprintf(string, "%c", *data);
   return string;
}

static bool Byte_OnGetDataFromString(Class _class, byte * data, char * string)
{
   char * end;
   byte result = (byte)strtoul(string, &end, 0);
   if(end > string)
   {
      *data = result;
      return true;
   }
   return false;
}

static int Int64_OnCompare(Class _class, int64 * data1, int64 * data2)
{
   int result = 0;
   if(!data1 && !data2) result = 0;
   else if(data1 && !data2) result = 1;
   else if(!data1 && data2) result = -1;
   else if(*data1 > *data2) result = 1;
   else if(*data1 < *data2) result = -1;
   return result;
}

static int UInt64_OnCompare(Class _class, uint64 * data1, uint64 * data2)
{
   int result = 0;
   if(!data1 && !data2) result = 0;
   else if(data1 && !data2) result = 1;
   else if(!data1 && data2) result = -1;
   else if(*data1 > *data2) result = 1;
   else if(*data1 < *data2) result = -1;
   return result;
}

static char * Int64_OnGetString(Class _class, int64 * data, char * string, void * fieldData, bool * needClass)
{
   sprintf(string, FORMAT64D, *data);
   return string;
}

static char * UInt64_OnGetString(Class _class, uint64 * data, char * string, void * fieldData, bool * needClass)
{
   sprintf(string, FORMAT64U, *data);
   return string;
}

/*static */void Byte_OnSerialize(Class _class, byte * data, IOChannel channel)
{
   channel.WriteData(data, 1);
}

/*static */void Byte_OnUnserialize(Class _class, byte * data, IOChannel channel)
{
   if(channel.ReadData(data, 1) != 1)
      *data = 0;
}


/*static */void Int_OnSerialize(Class _class, int * data, IOChannel channel)
{
   byte bytes[4];
   PUTXDWORD(bytes, * data);
   channel.WriteData(bytes, 4);
}

/*static */void Int_OnUnserialize(Class _class, int * data, IOChannel channel)
{
   byte bytes[4];
   if(channel.ReadData(bytes, 4) == 4)
      *data = GETXDWORD(bytes);   
   else
      *data = 0;
}

/*static */void Int64_OnSerialize(Class _class, int64 * data, IOChannel channel)
{
   byte bytes[8];
   PUTXQWORD(bytes, * data);
   channel.WriteData(bytes, 8);
}

/*static */void Int64_OnUnserialize(Class _class, int64 * data, IOChannel channel)
{
   byte bytes[8];
   if(channel.ReadData(bytes, 8) == 8)
      *data = GETXQWORD(bytes);   
   else
      *data = 0;
}

/*static */void Word_OnSerialize(Class _class, uint16 * data, IOChannel channel)
{
   byte bytes[2];
   PUTXWORD(bytes, * data);
   channel.WriteData(bytes, 2);
}

/*static */void Word_OnUnserialize(Class _class, uint16 * data, IOChannel channel)
{
   byte bytes[2];
   if(channel.ReadData(bytes, 2) == 2)
      *data = GETXWORD(bytes);   
   else
      *data = 0;
}

static void RegisterClass_Integer(Module module)
{
   Class integerClass = eSystem_RegisterClass(normalClass, "int", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   integerClass.type = systemClass;
   delete integerClass.dataTypeString;
   integerClass.dataTypeString = CopyString("int");
   integerClass.structSize = 0;
   integerClass.typeSize = sizeof(int);
   
   eClass_AddMethod(integerClass, "OnCompare", null, Integer_OnCompare, publicAccess);
   eClass_AddMethod(integerClass, "OnGetString", null, Integer_OnGetString, publicAccess);
   eClass_AddMethod(integerClass, "OnGetDataFromString", null, Integer_OnGetDataFromString, publicAccess);
   eClass_AddMethod(integerClass, "OnSerialize", null, Int_OnSerialize, publicAccess);
   eClass_AddMethod(integerClass, "OnUnserialize", null, Int_OnUnserialize, publicAccess);

   integerClass = eSystem_RegisterClass(normalClass, "int64", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   integerClass.type = systemClass;
   integerClass.structSize = 0;
   integerClass.typeSize = sizeof(int64);
   delete integerClass.dataTypeString;
   integerClass.dataTypeString = CopyString("int64");
   eClass_AddMethod(integerClass, "OnGetString", null, Int64_OnGetString, publicAccess);
   eClass_AddMethod(integerClass, "OnCompare", null, Int64_OnCompare, publicAccess);
   // eClass_AddMethod(integerClass, "OnGetDataFromString", null, Integer64_OnGetDataFromString, publicAccess);
   eClass_AddMethod(integerClass, "OnSerialize", null, Int64_OnSerialize, publicAccess);
   eClass_AddMethod(integerClass, "OnUnserialize", null, Int64_OnUnserialize, publicAccess);

   integerClass = eSystem_RegisterClass(normalClass, "uint", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   integerClass.type = systemClass;
   delete integerClass.dataTypeString;
   integerClass.dataTypeString = CopyString("unsigned int");
   integerClass.structSize = 0;
   integerClass.typeSize = sizeof(uint);
   eClass_AddMethod(integerClass, "OnCompare", null, UInteger_OnCompare, publicAccess);
   eClass_AddMethod(integerClass, "OnGetString", null, UInteger_OnGetString, publicAccess);
   eClass_AddMethod(integerClass, "OnGetDataFromString", null, UInteger_OnGetDataFromString, publicAccess);
   eClass_AddMethod(integerClass, "OnSerialize", null, Int_OnSerialize, publicAccess);
   eClass_AddMethod(integerClass, "OnUnserialize", null, Int_OnUnserialize, publicAccess);

   integerClass = eSystem_RegisterClass(normalClass, "unsigned int", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   integerClass.type = systemClass;
   delete integerClass.dataTypeString;
   integerClass.dataTypeString = CopyString("unsigned int");
   integerClass.structSize = 0;
   integerClass.typeSize = sizeof(uint);

   eClass_AddMethod(integerClass, "OnCompare", null, UInteger_OnCompare, publicAccess);
   eClass_AddMethod(integerClass, "OnGetString", null, UInteger_OnGetString, publicAccess);
   eClass_AddMethod(integerClass, "OnGetDataFromString", null, UInteger_OnGetDataFromString, publicAccess);
   eClass_AddMethod(integerClass, "OnSerialize", null, Int_OnSerialize, publicAccess);
   eClass_AddMethod(integerClass, "OnUnserialize", null, Int_OnUnserialize, publicAccess);

   integerClass = eSystem_RegisterClass(normalClass, "uint16", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   integerClass.type = systemClass;
   delete integerClass.dataTypeString;
   integerClass.dataTypeString = CopyString("unsigned short");
   integerClass.structSize = 0;
   integerClass.typeSize = sizeof(uint16);

   eClass_AddMethod(integerClass, "OnSerialize", null, Word_OnSerialize, publicAccess);
   eClass_AddMethod(integerClass, "OnUnserialize", null, Word_OnUnserialize, publicAccess);

   integerClass = eSystem_RegisterClass(normalClass, "short", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   integerClass.type = systemClass;
   delete integerClass.dataTypeString;
   integerClass.dataTypeString = CopyString("short");
   integerClass.structSize = 0;
   integerClass.typeSize = sizeof(short);

   eClass_AddMethod(integerClass, "OnSerialize", null, Word_OnSerialize, publicAccess);
   eClass_AddMethod(integerClass, "OnUnserialize", null, Word_OnUnserialize, publicAccess);

   /*
   integerClass = eSystem_RegisterClass(normalClass, "uint32", null, 0, 0, null, null, module, baseSystemAccess);
   integerClass.type = systemClass;
   delete integerClass.dataTypeString;
   integerClass.dataTypeString = CopyString("uint32");
   eClass_AddMethod(integerClass, "OnCompare", null, UInteger_OnCompare, publicAccess);
   eClass_AddMethod(integerClass, "OnGetString", null, UInteger_OnGetString, publicAccess);
   eClass_AddMethod(integerClass, "OnGetDataFromString", null, UInteger_OnGetDataFromString, publicAccess);
   */
   integerClass = eSystem_RegisterClass(normalClass, "uint32", "uint", 0, 0, null, null, module, baseSystemAccess, publicAccess);
   integerClass.type = systemClass;
   delete integerClass.dataTypeString;
   integerClass.dataTypeString = CopyString("unsigned int");
   integerClass.structSize = 0;
   integerClass.typeSize = sizeof(uint32);

   integerClass = eSystem_RegisterClass(normalClass, "uint64", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   integerClass.type = systemClass;
   delete integerClass.dataTypeString;
   integerClass.dataTypeString = CopyString("uint64");
   integerClass.structSize = 0;
   integerClass.typeSize = sizeof(uint64);
   eClass_AddMethod(integerClass, "OnGetString", null, UInt64_OnGetString, publicAccess);
   eClass_AddMethod(integerClass, "OnSerialize", null, Int64_OnSerialize, publicAccess);
   eClass_AddMethod(integerClass, "OnUnserialize", null, Int64_OnUnserialize, publicAccess);
   eClass_AddMethod(integerClass, "OnCompare", null, Int64_OnCompare, publicAccess);

   integerClass = eSystem_RegisterClass(normalClass, "byte", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   integerClass.type = systemClass;
   delete integerClass.dataTypeString;
   integerClass.dataTypeString = CopyString("unsigned char");
   integerClass.structSize = 0;
   integerClass.typeSize = sizeof(byte);
   eClass_AddMethod(integerClass, "OnCompare", null, Byte_OnCompare, publicAccess);
   eClass_AddMethod(integerClass, "OnGetString", null, Byte_OnGetString, publicAccess);
   eClass_AddMethod(integerClass, "OnGetDataFromString", null, Byte_OnGetDataFromString, publicAccess);
   eClass_AddMethod(integerClass, "OnSerialize", null, Byte_OnSerialize, publicAccess);
   eClass_AddMethod(integerClass, "OnUnserialize", null, Byte_OnUnserialize, publicAccess);

   integerClass = eSystem_RegisterClass(normalClass, "char", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   integerClass.type = systemClass;
   delete integerClass.dataTypeString;
   integerClass.dataTypeString = CopyString("char");
   integerClass.structSize = 0;
   integerClass.typeSize = sizeof(char);
   eClass_AddMethod(integerClass, "OnCompare", null, Byte_OnCompare, publicAccess);
   eClass_AddMethod(integerClass, "OnGetString", null, Char_OnGetString, publicAccess);
   eClass_AddMethod(integerClass, "OnGetDataFromString", null, Byte_OnGetDataFromString, publicAccess);
   eClass_AddMethod(integerClass, "OnSerialize", null, Byte_OnSerialize, publicAccess);
   eClass_AddMethod(integerClass, "OnUnserialize", null, Byte_OnUnserialize, publicAccess);

   integerClass = eSystem_RegisterClass(normalClass, "uintptr", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   integerClass.type = systemClass;
   delete integerClass.dataTypeString;
   integerClass.dataTypeString = CopyString("uintptr_t");
   integerClass.structSize = 0;
   integerClass.typeSize = sizeof(uintptr);
   if(sizeof(uintptr) == 8)
   {
      eClass_AddMethod(integerClass, "OnGetString", null, UInt64_OnGetString, publicAccess);
      eClass_AddMethod(integerClass, "OnSerialize", null, Int64_OnSerialize, publicAccess);
      eClass_AddMethod(integerClass, "OnUnserialize", null, Int64_OnUnserialize, publicAccess);
      eClass_AddMethod(integerClass, "OnCompare", null, UInt64_OnCompare, publicAccess);
   }
   else
   {
      eClass_AddMethod(integerClass, "OnCompare", null, UInteger_OnCompare, publicAccess);
      eClass_AddMethod(integerClass, "OnGetString", null, UInteger_OnGetString, publicAccess);
      eClass_AddMethod(integerClass, "OnGetDataFromString", null, UInteger_OnGetDataFromString, publicAccess);
      eClass_AddMethod(integerClass, "OnSerialize", null, Int_OnSerialize, publicAccess);
      eClass_AddMethod(integerClass, "OnUnserialize", null, Int_OnUnserialize, publicAccess);
   }

   integerClass = eSystem_RegisterClass(normalClass, "intptr", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   integerClass.type = systemClass;
   delete integerClass.dataTypeString;
   integerClass.dataTypeString = CopyString("intptr_t");
   integerClass.structSize = 0;
   integerClass.typeSize = sizeof(intptr);
   if(sizeof(intptr) == 8)
   {
      eClass_AddMethod(integerClass, "OnGetString", null, Int64_OnGetString, publicAccess);
      eClass_AddMethod(integerClass, "OnSerialize", null, Int64_OnSerialize, publicAccess);
      eClass_AddMethod(integerClass, "OnUnserialize", null, Int64_OnUnserialize, publicAccess);
      eClass_AddMethod(integerClass, "OnCompare", null, Int64_OnCompare, publicAccess);
   }
   else
   {
      eClass_AddMethod(integerClass, "OnCompare", null, Integer_OnCompare, publicAccess);
      eClass_AddMethod(integerClass, "OnGetString", null, Integer_OnGetString, publicAccess);
      eClass_AddMethod(integerClass, "OnGetDataFromString", null, Integer_OnGetDataFromString, publicAccess);
      eClass_AddMethod(integerClass, "OnSerialize", null, Int_OnSerialize, publicAccess);
      eClass_AddMethod(integerClass, "OnUnserialize", null, Int_OnUnserialize, publicAccess);
   }
}

// Float
static int Float_OnCompare(Class _class, float * data1, float * data2)
{
   int result = 0;
   if(!data1 && !data2) result = 0;
   else if(data1 && !data2) result = 1;
   else if(!data1 && data2) result = -1;
   else if(*data1 > *data2) result = 1;
   else if(*data1 < *data2) result = -1;
   return result;
}

static char * Float_OnGetString(Class _class, float * data, char * string, void * fieldData, bool * needClass)
{
   int c;
   int last = 0;
   int numDigits = 7, num = 1;
   char format[10];
   while(numDigits && num < *data) numDigits--, num *= 10;
   sprintf(format, "%%.%df", numDigits);

   //sprintf(string, "%f", *data);
   sprintf(string, format, *data);

   c = strlen(string)-1;
   for( ; c >= 0; c--)
   {
      if(string[c] != '0') 
         last = Max(last, c);
      if(string[c] == '.')
      {
         if(last == c)
            string[c] = 0;
         else
            string[last+1] = 0;
         break;
      }
   }
   return string;
}

static bool Float_OnGetDataFromString(Class _class, float * data, char * string)
{
   char * end;
   float result = (float)strtod(string, &end);
   //*data = atof(string);
   if(end > string)
   {
      *data = result;
      return true;
   }
   return false;
}

static void Float_OnSerialize(Class _class, float * data, IOChannel channel)
{
   byte bytes[4];
   PUTXDWORD(bytes, * (uint *)data);
   channel.WriteData(bytes, 4);
}

static void Float_OnUnserialize(Class _class, float * data, IOChannel channel)
{
   byte bytes[4];
   if(channel.ReadData(bytes, 4) == 4)
      *(uint *)data = GETXDWORD(bytes);   
   else
      *data = 0;
}

static void RegisterClass_Float(Module module)
{
   Class floatClass = eSystem_RegisterClass(normalClass, "float", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   floatClass.type = systemClass;
   delete floatClass.dataTypeString;
   floatClass.dataTypeString = CopyString("float");
   floatClass.structSize = 0;
   floatClass.typeSize = sizeof(float);
   eClass_AddMethod(floatClass, "OnCompare", null, Float_OnCompare, publicAccess);
   eClass_AddMethod(floatClass, "OnGetString", null, Float_OnGetString, publicAccess);
   eClass_AddMethod(floatClass, "OnGetDataFromString", null, Float_OnGetDataFromString, publicAccess);
   eClass_AddMethod(floatClass, "OnSerialize", null, Float_OnSerialize, publicAccess);
   eClass_AddMethod(floatClass, "OnUnserialize", null, Float_OnUnserialize, publicAccess);
}

// Double
static int Double_OnCompare(Class _class, double * data1, double * data2)
{
   int result = 0;
   if(!data1 && !data2) result = 0;
   else if(data1 && !data2) result = 1;
   else if(!data1 && data2) result = -1;
   else if(*data1 > *data2) result = 1;
   else if(*data1 < *data2) result = -1;
   return result;
}

static char * Double_OnGetString(Class _class, double * data, char * string, void * fieldData, bool * needClass)
{
   int c;
   int last = 0;
   //sprintf(string, "%.20f", *data);
   if(runtimePlatform == win32)
   // sprintf(string, "%.16g", *data);
      sprintf(string, "%.15g", *data);
   else
      sprintf(string, "%.13lf", *data);

   c = strlen(string)-1;
   for( ; c >= 0; c--)
   {
      if(string[c] != '0') 
         last = Max(last, c);
      if(string[c] == '.')
      {
         if(last == c)
            string[c] = 0;
         else
            string[last+1] = 0;
         break;
      }
   }
   return string;
}

static bool Double_OnGetDataFromString(Class _class, double * data, char * string)
{
   char * end;
   double result;
   //*data = (double)strtod(string, null);
   result = strtod(string, &end);
   if(end > string)
   {
      *data = result;
      return true;
   
    }
    return false;
}

static void Double_OnSerialize(Class _class, double * data, IOChannel channel)
{
   byte bytes[8];
   PUTXQWORD(bytes, * (uint64 *)data);
   channel.WriteData(bytes, 8);
}

static void Double_OnUnserialize(Class _class, double * data, IOChannel channel)
{
   byte bytes[8];
   if(channel.ReadData(bytes, 8) == 8)
      *(uint64 *)data = GETXQWORD(bytes);
   else
      *data = 0;
}

static void RegisterClass_Double(Module module)
{
   Class doubleClass = eSystem_RegisterClass(normalClass, "double", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   doubleClass.type = systemClass;
   delete doubleClass.dataTypeString;
   doubleClass.dataTypeString = CopyString("double");
   doubleClass.structSize = 0;
   doubleClass.typeSize = sizeof(double);
   eClass_AddMethod(doubleClass, "OnCompare", null, Double_OnCompare, publicAccess);
   eClass_AddMethod(doubleClass, "OnGetString", null, Double_OnGetString, publicAccess);
   eClass_AddMethod(doubleClass, "OnGetDataFromString", null, Double_OnGetDataFromString, publicAccess);
   eClass_AddMethod(doubleClass, "OnSerialize", null, Double_OnSerialize, publicAccess);
   eClass_AddMethod(doubleClass, "OnUnserialize", null, Double_OnUnserialize, publicAccess);
}

public struct StaticString
{
   char string[1];

   void OnSerialize(IOChannel channel)
   {
      int len = this ? strlen(string) : 0;
      channel.WriteData(this ? string : "", len+1);
   }

   void OnUnserialize(IOChannel channel)
   {
      if(this)
      {
         int c;
         uint size;

         for(c = 0; channel.ReadData(&string[c], 1) && string[c]; c++);
         string[c++] = '\0';
      }
   }

   int OnCompare(StaticString string2)
   {
      int result = 0;
      if(this && string2)
         result = strcmpi(string, string2.string);
      else if(!this && string2)
         result = -1;   // INVERTED THESE 2 CASES
      else if(this && !string2)
         result = 1;
      return result;
   }

   char * OnGetString(char * tempString, void * fieldData, bool * needClass)
   {
      return (char *)(this ? string : null); // Cast for memguard
   }

   void OnFree()
   {
   }
};

static void String_OnCopy(Class _class, char ** data, char * newData)
{
   if(newData)
   {
      int len = strlen(newData);
      if(len)
      {
         *data = eSystem_New(len+1);
         memcpy(*data, newData, len+1);
      }
      else
         *data = null;
   }
   else
      *data = null;
}

static bool String_OnGetDataFromString(Class _class, char ** data, char * newData)
{
   if(newData)
   {
      int len = strlen(newData);
      if(len)
      {
         *data = eSystem_New(len+1);
         memcpy(*data, newData, len+1);
      }
      else
         *data = null;
   }
   return true;
}
 
/*static */int String_OnCompare(Class _class, char * string1, char * string2)
{
   int result = 0;
   if(string1 && string2)
      result = strcmpi(string1, string2);
   else if(!string1 && string2)
      result = 1;
   else if(string1 && !string2)
      result = -1;
   return result;
}

static char * String_OnGetString(Class _class, char * string, char * tempString, void * fieldData, bool * needClass)
{
   return string;
}

static void String_OnFree(Class _class, char * string)
{
   if(string) 
   {
      eSystem_Delete(string);
   }
}

static void String_OnSerialize(Class _class, char * string, IOChannel channel)
{
   int len = string ? strlen(string) : 0;
   channel.WriteData(string ? string : "", len+1);
}

static void String_OnUnserialize(Class _class, char * * string, IOChannel channel)
{
   if(string)
   {
      int c;
      uint size = 64;

      *string = new char[size];
      for(c = 0; channel.ReadData(&(*string)[c], 1) && (*string)[c]; c++)
      {
         if(c == size - 1)
         {
            size += size / 2;
            *string = renew *string char[size];
         }
      }
      (*string)[c++] = '\0';
      if(!UTF8Validate(*string))
      {
         char * newString = new char[c*2];
         ISO8859_1toUTF8(*string, newString, c*2);
         delete *string;
         *string = renew newString char[strlen(newString)+1];
      }
      else
         *string = renew *string char[c];
   }
}

static void RegisterClass_String(Module module)
{
   Class stringClass = eSystem_RegisterClass(normalClass, "char *", null, 0, 0, null, null, module, baseSystemAccess, publicAccess);
   delete stringClass.dataTypeString;
   stringClass.dataTypeString = CopyString("char *");
   stringClass.structSize = 0;
   
   eClass_AddMethod(stringClass, "OnCompare", null, String_OnCompare, publicAccess);
   eClass_AddMethod(stringClass, "OnCopy", null, String_OnCopy, publicAccess);
   eClass_AddMethod(stringClass, "OnFree", null, String_OnFree, publicAccess);
   eClass_AddMethod(stringClass, "OnGetString", null, String_OnGetString, publicAccess);
   eClass_AddMethod(stringClass, "OnGetDataFromString", null, String_OnGetDataFromString, publicAccess);
   eClass_AddMethod(stringClass, "OnSerialize", null, String_OnSerialize, publicAccess);
   eClass_AddMethod(stringClass, "OnUnserialize", null, String_OnUnserialize, publicAccess); 
   // eClass_AddProperty(stringClass, null, "Class", null, String_GetClass, publicAccess);

   stringClass = eSystem_RegisterClass(normalClass, "String", "char *", 0, 0, null, null, module, baseSystemAccess, publicAccess);
   stringClass.structSize = 0;
   eClass_AddProperty(stringClass, null, "char *", null, null, publicAccess);
}

void InitializeDataTypes1(Module module)
{
   Class baseClass = eSystem_FindClass(module, "class");

   eClass_AddVirtualMethod(baseClass, "OnDisplay", "void typed_object::OnDisplay(Surface surface, int x, int y, int width, void * fieldData, Alignment alignment, DataDisplayFlags displayFlags)", null, publicAccess);
   eClass_AddVirtualMethod(baseClass, "OnCompare", "int typed_object::OnCompare(any_object object)", OnCompare, publicAccess);
   eClass_AddVirtualMethod(baseClass, "OnCopy", "void typed_object&::OnCopy(any_object newData)", OnCopy, publicAccess);
   eClass_AddVirtualMethod(baseClass, "OnFree", "void typed_object::OnFree(void)", OnFree, publicAccess);
   eClass_AddVirtualMethod(baseClass, "OnGetString", "char * typed_object::OnGetString(char * tempString, void * fieldData, bool * needClass)", OnGetString, publicAccess);
   eClass_AddVirtualMethod(baseClass, "OnGetDataFromString", "bool typed_object&::OnGetDataFromString(char * string)", OnGetDataFromString, publicAccess);
   eClass_AddVirtualMethod(baseClass, "OnEdit", "Window typed_object::OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)", null, publicAccess);
   eClass_AddVirtualMethod(baseClass, "OnSerialize", "void typed_object::OnSerialize(IOChannel channel)", OnSerialize, publicAccess);
   eClass_AddVirtualMethod(baseClass, "OnUnserialize", "void typed_object&::OnUnserialize(IOChannel channel)", OnUnserialize, publicAccess);
   eClass_AddVirtualMethod(baseClass, "OnSaveEdit", "bool typed_object&::OnSaveEdit(Window window, void * object)", null, publicAccess);
}

void InitializeDataTypes(Module module)
{
   Class enumClass = eSystem_FindClass(module, "enum");

   eClass_AddMethod(enumClass, "OnSerialize", null, Int_OnSerialize, publicAccess);
   eClass_AddMethod(enumClass, "OnUnserialize", null, Int_OnUnserialize, publicAccess);

   // Data Types
   RegisterClass_Integer(module);
   RegisterClass_Float(module);
   RegisterClass_Double(module);
   RegisterClass_String(module);
}

#define uint _uint
#include <stdarg.h>
#include <stdio.h>
#undef uint

public int PrintStdArgsToBuffer(char * buffer, int maxLen, typed_object object, va_list args)
{
   int len = 0;
   // TOFIX: OnGetString will need a maxLen as well
   char * result = object.OnGetString(buffer, null, null);
   if(result)
   {
      len = strlen(result);
      if(len >= maxLen) len = maxLen-1;
      if(result != buffer)
         memcpy(buffer, result, len);
   }
   while(true)
   {
      Class _class = null;
      void * data = null;

      _class = va_arg(args, void *);
      if(!_class) break;
      data = va_arg(args, void *);
      if(data)
      {
         // TOFIX: OnGetString will need a maxLen as well
         result = ((char *(*)(void *, void *, char *, void *, bool *))(void *)_class._vTbl[__ecereVMethodID_class_OnGetString])(_class, data, buffer + len, null, null);
         if(result)
         {
            int newLen = strlen(result);
            if(len + newLen >= maxLen) newLen = maxLen-1-len;
            if(result != buffer + len)
               memcpy(buffer + len, result, newLen);
            len += newLen;              
         }
      }
   }
   buffer[len] = 0;
   return len;
}

public int PrintBuf(char * buffer, int maxLen, typed_object object, ...)
{
   va_list args;
   int len;
   va_start(args, object);
   len = PrintStdArgsToBuffer(buffer, maxLen, object, args);
   va_end(args);
   return len;
}

public int PrintLnBuf(char * buffer, int maxLen, typed_object object, ...)
{
   va_list args;
   int len;
   va_start(args, object);
   len = PrintStdArgsToBuffer(buffer, maxLen-1, object, args);
   buffer[len++] = '\n';
   buffer[len] = '\0';
   va_end(args);
   return len;
}

public char * PrintString(typed_object object, ...)
{
   char buffer[4096];
   va_list args;
   char * string;
   int len;
   va_start(args, object);
   len = PrintStdArgsToBuffer(buffer, sizeof(buffer), object, args);
   string = new char[len + 1];
   memcpy(string, buffer, len + 1);
   va_end(args);
   return string;
}

public char * PrintLnString(typed_object object, ...)
{
   char buffer[4096];
   va_list args;
   char * string;
   int len;
   va_start(args, object);
   len = PrintStdArgsToBuffer(buffer, sizeof(buffer), object, args);
   string = new char[len + 2];
   memcpy(string, buffer, len);
   string[len++] = '\n';
   string[len] = '\0';
   va_end(args);
   return string;
}

#if defined(__ANDROID__)
#include <android/log.h>
#define LOGI(...) ((void)__android_log_print(ANDROID_LOG_INFO, "ecere-app", __VA_ARGS__))
#endif

public void PrintLn(typed_object object, ...)
{
   va_list args;
   char buffer[4096];
   va_start(args, object);
   PrintStdArgsToBuffer(buffer, sizeof(buffer), object, args);
   va_end(args);
#if defined(__ANDROID__) && !defined(ECERE_NOFILE)
   LOGI("%s", buffer);
#else
   puts(buffer);
#endif
}

public void Print(typed_object object, ...)
{
   va_list args;
   char buffer[4096];
   va_start(args, object);
   PrintStdArgsToBuffer(buffer, sizeof(buffer), object, args);
   va_end(args);
   fputs(buffer, stdout);
}
